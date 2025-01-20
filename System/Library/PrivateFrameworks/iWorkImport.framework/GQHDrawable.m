@interface GQHDrawable
+ (Class)beginTable:(id)a3;
+ (int)beginDrawables:(id)a3;
+ (int)endDrawables:(id)a3;
+ (int)handleDrawable:(id)a3 state:(id)a4;
+ (int)handleFloatingDrawable:(id)a3 htmlState:(id)a4;
+ (int)handleInlineDrawable:(id)a3 htmlState:(id)a4;
+ (void)aboutToGenerateDrawable:(id)a3 htmlState:(id)a4;
+ (void)doneGeneratingDrawable:(id)a3 htmlState:(id)a4;
@end

@implementation GQHDrawable

+ (int)beginDrawables:(id)a3
{
  return 1;
}

+ (int)handleDrawable:(id)a3 state:(id)a4
{
  id v6 = [a4 generatorState];
  return [a1 handleFloatingDrawable:a3 htmlState:v6];
}

+ (void)aboutToGenerateDrawable:(id)a3 htmlState:(id)a4
{
  if (objc_msgSend(objc_msgSend(a4, "processorState"), "doCalculateThumbnailSize"))
  {
    id v6 = objc_msgSend(objc_msgSend(a4, "processorState"), "processor");
    [v6 thumbnailSize];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    objc_msgSend(objc_msgSend(a3, "geometry"), "position");
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    objc_msgSend(objc_msgSend(a3, "geometry"), "size");
    v22.size.width = v15 + 10.0;
    v22.size.height = v16 + 10.0;
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = v8;
    v20.size.height = v10;
    v22.origin.x = v12;
    v22.origin.y = v14;
    NSRect v21 = NSUnionRect(v20, v22);
    objc_msgSend(v6, "setThumbnailSize:", v21.size.width, v21.size.height);
  }
  if (([a3 hasPagesOrder] & 1) != 0
    || [a4 drawablesNeedCssZOrdering])
  {
    id v17 = [a4 htmlDoc];
    [v17 startElement:"div"];
    id v18 = [a4 cssZOrderClassForDrawable:a3];
    [v17 setAttribute:"class" cfStringValue:v18];
  }
}

+ (void)doneGeneratingDrawable:(id)a3 htmlState:(id)a4
{
  if (([a3 hasPagesOrder] & 1) != 0
    || [a4 drawablesNeedCssZOrdering])
  {
    id v5 = [a4 htmlDoc];
    [v5 endElementWithExpectedName:"div"];
  }
}

+ (int)handleFloatingDrawable:(id)a3 htmlState:(id)a4
{
  id v7 = [a4 htmlDoc];
  id v8 = [a3 urlString];
  if ([a4 shouldMapLinkWithUrl:v8])
  {
    double v9 = +[GQHUtils createHtmlHrefForLinkUri:v8 state:a4];
    if (v9)
    {
      [v7 startElement:"a"];
      [v7 setAttribute:"href" cfStringValue:v9];
      char v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    double v9 = 0;
  }
  char v10 = 1;
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v11 = +[GQHImage handleFloatingMedia:a3 state:a4];
LABEL_12:
    int v12 = v11;
    [a1 doneGeneratingDrawable:a3 htmlState:a4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v11 = +[GQHShape handleShape:a3 isFloating:1 state:a4];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v11 = +[GQHLine handleFloatingLine:a3 state:a4];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    int v12 = +[GQHPlaceholder handlePlaceholder:a3 state:a4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    objc_msgSend(v7, "startElement:");
    objc_msgSend(v7, "startElement:");
    id v21 = [a3 geometry];
    NSRect v22 = objc_alloc_init(GQHStyle);
    [(GQHStyle *)v22 addAttribute:off_9CF18 value:off_9CFA0];
    [v21 nonrotatedPosition];
    +[GQHBounds mapPosition:srcGraphicStyle:style:state:](GQHBounds, "mapPosition:srcGraphicStyle:style:state:", 0, v22, a4);
    [v21 size];
    double v24 = v23;
    double v26 = v25;
    [v21 angle];
    int v28 = v27;
    id v29 = [v21 horizontalFlip];
    id v30 = [v21 verticalFlip];
    LODWORD(v31) = v28;
    +[GQHBounds mapSize:angle:flipX:flipY:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:flipX:flipY:srcGraphicStyle:style:state:", v29, v30, 0, v22, a4, v24, v26, v31);
    +[GQHGraphicStyle mapExternalWrap:style:state:](GQHGraphicStyle, "mapExternalWrap:style:state:", [a3 externalTextWrap], v22, a4);
    [(GQHStyle *)v22 setStyleOnCurrentNode:a4];

    CFArrayRef v32 = (const __CFArray *)[a3 drawables];
    uint64_t Count = CFArrayGetCount(v32);
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
        objc_msgSend(a1, "handleFloatingDrawable:htmlState:", CFArrayGetValueAtIndex(v32, i), a4);
    }
    [v7 endElementWithExpectedName:"div"];
    [v7 endElementWithExpectedName:"span"];
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v11 = +[GQHImage handleFloatingWebView:a3 state:a4];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v11 = +[GQHChart handleFloatingChart:a3 state:a4];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    +[GQHChartLegend handleFloatingLegend:a3 state:a4];
LABEL_25:
    [a1 doneGeneratingDrawable:a3 htmlState:a4];
LABEL_26:
    int v12 = 1;
    goto LABEL_13;
  }
  int v12 = 3;
LABEL_13:
  if ((v10 & 1) == 0)
  {
    [v7 endElementWithExpectedName:"a"];
    CFRelease(v9);
  }
  if (v12 == 1)
  {
    id v13 = [a3 geometry];
    [v13 position];
    double v15 = v14;
    double v17 = v16;
    [v13 size];
    objc_msgSend(a4, "addedDrawableWithBounds:", v15, v17, v18, v19);
  }
  return v12;
}

+ (int)handleInlineDrawable:(id)a3 htmlState:(id)a4
{
  id v7 = [a4 htmlDoc];
  id v8 = [a3 urlString];
  if (![a4 shouldMapLinkWithUrl:v8])
  {
    double v9 = 0;
    goto LABEL_5;
  }
  double v9 = +[GQHUtils createHtmlHrefForLinkUri:v8 state:a4];
  if (!v9)
  {
LABEL_5:
    char v10 = 1;
    goto LABEL_6;
  }
  [v7 startElement:"a"];
  [v7 setAttribute:"href" cfStringValue:v9];
  char v10 = 0;
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = objc_msgSend(objc_msgSend(a3, "graphicStyle"), "valueForObjectProperty:", 72);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    id v11 = [a3 externalTextWrap];
  }
  int v12 = v11;
  if (v11
    && [v11 inlineWrapEnabled]
    && [v12 attachmentWrapType] == 1)
  {
    id v13 = objc_alloc_init(GQHStyle);
    [v7 startElement:"span"];
    [(GQHStyle *)v13 addAttribute:off_9CE60 value:off_9D000];
    [(GQHStyle *)v13 addAttribute:off_9CF68 value:@"100%"];
    [(GQHStyle *)v13 setStyleOnCurrentNode:a4];

    int v14 = 1;
    goto LABEL_17;
  }
LABEL_16:
  int v14 = 0;
LABEL_17:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v15 = +[GQHImage handleInlineMedia:a3 state:a4];
LABEL_36:
    int v17 = v15;
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v15 = +[GQHShape handleShape:a3 isFloating:0 state:a4];
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v16 = +[GQHLine handleInlineLine:a3 state:a4];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v15 = objc_msgSend(a3, "walkTableWithGenerator:state:", objc_opt_class(), objc_msgSend(a4, "processorState"));
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v15 = +[GQHImage handleInlineWebView:a3 state:a4];
      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 aboutToGenerateDrawable:a3 htmlState:a4];
        +[GQHChartLegend handleInlineLegend:a3 state:a4];
        [a1 doneGeneratingDrawable:a3 htmlState:a4];
        int v17 = 1;
      }
      else
      {
        int v17 = 3;
      }
LABEL_37:
      if (!v14) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    [a1 aboutToGenerateDrawable:a3 htmlState:a4];
    unsigned int v16 = +[GQHChart handleInlineChart:a3 state:a4];
LABEL_23:
    int v17 = v16;
    [a1 doneGeneratingDrawable:a3 htmlState:a4];
    goto LABEL_37;
  }
  if ((v14 & 1) == 0) {
    [v7 startElement:"span"];
  }
  [v7 startElement:"div"];
  id v18 = [a3 geometry];
  double v19 = objc_alloc_init(GQHStyle);
  [v18 size];
  double v21 = v20;
  double v23 = v22;
  [v18 angle];
  int v25 = v24;
  id v26 = [v18 horizontalFlip];
  id v27 = [v18 verticalFlip];
  LODWORD(v28) = v25;
  +[GQHBounds mapSize:angle:flipX:flipY:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:flipX:flipY:srcGraphicStyle:style:state:", v26, v27, 0, v19, a4, v21, v23, v28);
  [(GQHStyle *)v19 addAttribute:off_9CF18 value:off_9D040];
  [(GQHStyle *)v19 setStyleOnCurrentNode:a4];

  CFArrayRef v29 = (const __CFArray *)[a3 drawables];
  uint64_t Count = CFArrayGetCount(v29);
  if (Count)
  {
    for (CFIndex i = 0; i != Count; ++i)
      objc_msgSend(a1, "handleFloatingDrawable:htmlState:", CFArrayGetValueAtIndex(v29, i), a4);
  }
  [v7 endElement];
  if ((v14 & 1) == 0)
  {
    [v7 endElement];
    int v17 = 1;
    if (v10) {
      return v17;
    }
    goto LABEL_40;
  }
  int v17 = 1;
LABEL_38:
  [v7 endElementWithExpectedName:"span"];
LABEL_39:
  if ((v10 & 1) == 0)
  {
LABEL_40:
    [v7 endElement];
    CFRelease(v9);
  }
  return v17;
}

+ (int)endDrawables:(id)a3
{
  return 1;
}

+ (Class)beginTable:(id)a3
{
  return (Class)objc_opt_class();
}

@end