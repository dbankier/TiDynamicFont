TiDynamicFont
=============

This iOS modules allows for the dynamic loading of custom fonts without
modify the `Info.plist` file.

See the following
[link](http://www.marco.org/2012/12/21/ios-dynamic-font-loading) for the
original source and motivation. (Credits to @jeffbonnes for forwarding
me the link.)  

Example Usage
-------------

```
  var TiDynamicFont = require('yy.tidynamicfont');
  var file = Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, "comic_zine_ot.otf");
  TiDynamicFont.registerFont(file);

  // open a single window
  var win = Ti.UI.createWindow({
    backgroundColor:'white'
  });
  var label = Ti.UI.createLabel({
    text: "Hello World",
    font:{fontSize:54,fontFamily:"Comic Zine OT"}
  });
  win.add(label);
  win.open();
```



