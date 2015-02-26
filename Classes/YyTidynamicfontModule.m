/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "YyTidynamicfontModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <CoreText/CTFontManager.h>

@implementation YyTidynamicfontModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"300491b9-9464-4c5d-8a61-0d0bfde352db";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"yy.tidynamicfont";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)registerFont:(id)args
{
    NSObject *arg = [args objectAtIndex: 0];
    if ([arg isKindOfClass:[TiFile class]])
	{
        Boolean success = true;
        CFErrorRef error;
		TiFile *file = (TiFile*)arg;
        NSData *data = [NSData dataWithContentsOfFile:[file path]];
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)data);
        [UIFont familyNames]; // Fix hang app
        CGFontRef font = CGFontCreateWithDataProvider(provider);
        if (! CTFontManagerRegisterGraphicsFont(font, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
            success = false;
        }
        CFRelease(font);
        CFRelease(provider);
        return NUMBOOL(success);
    } else {
        NSLog(@"File required");
        return NUMBOOL(false);
    }
}



@end
