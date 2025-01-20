@interface GQHPlaceholder
+ (int)handlePlaceholder:(id)a3 state:(id)a4;
@end

@implementation GQHPlaceholder

+ (int)handlePlaceholder:(id)a3 state:(id)a4
{
  if (![a3 isVisible]) {
    return 1;
  }
  id v6 = [a4 htmlDoc];
  id v7 = [a3 placeholderStyle];
  id v31 = 0;
  if (([v7 hasValueForObjectProperty:81 value:&v31] & 1) == 0) {
    id v31 = [a3 geometry];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 valueForObjectProperty:73];
        id v10 = [v8 valueForObjectProperty:45];
        unsigned int v29 = 0;
        id v30 = 0;
        goto LABEL_16;
      }
      unsigned int v29 = 0;
      id v30 = 0;
      goto LABEL_15;
    }
  }
  id v8 = objc_msgSend(objc_msgSend(a3, "layoutFrame"), "layoutStyle");
  id v9 = objc_msgSend(objc_msgSend(a3, "layoutFrame"), "storage");
  id v30 = v9;
  unsigned int v29 = objc_msgSend(objc_msgSend(a3, "layoutFrame"), "textScale");
  if (!v8)
  {
    CFArrayRef v12 = (const __CFArray *)[v9 body];
    if (CFArrayGetCount(v12) == 1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v12, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [ValueAtIndex layoutStyle];
        goto LABEL_7;
      }
    }
LABEL_15:
    id v10 = 0;
    id v8 = 0;
    goto LABEL_16;
  }
LABEL_7:
  id v10 = 0;
LABEL_16:
  [a4 enterGraphicObject];
  [v6 startElement:"div"];
  v14 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v14 addAttribute:off_9CF18 value:off_9CFA0];
  [v31 position];
  +[GQHBounds mapPosition:srcGraphicStyle:style:state:](GQHBounds, "mapPosition:srcGraphicStyle:style:state:", v7, v14, a4);
  [(GQHStyle *)v14 setStyleOnCurrentNode:a4];

  v15 = objc_alloc_init(GQHStyle);
  [v6 startElement:"div"];
  [v31 size];
  double v17 = v16;
  double v19 = v18;
  [v31 angle];
  LODWORD(v21) = v20;
  +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", v7, v15, a4, v17, v19, v21);
  +[GQHGraphicStyle mapStyle:v7 style:v15 state:a4];
  if (v8)
  {
    +[GQHTextBox mapStyle:v8 style:v15 state:a4];
    +[GQHTextBox mapLayout:v8 style:v15 state:a4];
    [v31 size];
    +[GQHTextBox mapScaledImageFill:style:size:](GQHTextBox, "mapScaledImageFill:style:size:", v8, v15);
  }
  if (v10) {
    +[GQHTextBox mapStyle:v10 style:v15 state:a4];
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
  v23 = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
  CFArrayAppendValue(Mutable, v7);
  v24 = (const void *)objc_opt_class();
  CFArrayAppendValue(v23, v24);
  if (v8)
  {
    CFArrayAppendValue(Mutable, v8);
    v25 = (const void *)objc_opt_class();
    CFArrayAppendValue(v23, v25);
  }
  if (v10)
  {
    CFArrayAppendValue(Mutable, v10);
    v26 = (const void *)objc_opt_class();
    CFArrayAppendValue(v23, v26);
  }
  [(GQHStyle *)v15 setStyleOnCurrentNode:a4 mappingBaseStyleClasses:Mutable baseClassTypes:v23];

  CFRelease(v23);
  CFRelease(Mutable);
  if (v30)
  {
    if (v29) {
      objc_msgSend(a4, "setTextScale:");
    }
    int v11 = +[GQHTextBox handleLayoutStorage:v30 state:a4];
    [a4 invalidateTextScale];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v27 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", [a4 currentSlide]);
      [v6 addContent:v27];
      CFRelease(v27);
    }
    int v11 = 1;
  }
  [v6 endElement];
  [v6 endElement];
  [a4 leaveGraphicObject];
  return v11;
}

@end