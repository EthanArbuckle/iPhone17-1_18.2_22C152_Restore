@interface PFEIFrame
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEIFrame

- (void)mapEndElementWithState:(id)a3
{
  [(PFXDrawablePlacement *)[(PFEIWidget *)self placement] mapEndElementWithState:a3];
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  v31 = self;
  v7 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](self, "placement"), "infoGeometry"));
  id v8 = [v5 valueForAttribute:"title"];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(THWDrawablesWidgetInfo *)v7 accessibilityDescriptions];
    if (!v10)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      [(THWDrawablesWidgetInfo *)v7 setAccessibilityDescriptions:v10];
    }
    [v10 setObject:v9 forKey:@"widgetTitle"];
  }
  id v32 = a3;
  objc_opt_class();
  v30 = v6;
  objc_msgSend(objc_msgSend(v6, "childResults"), "firstObject");
  v11 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v11 second];
  v12 = (void *)TSUDynamicCast();
  id v13 = objc_alloc_init((Class)NSMutableArray);
  if ([v12 count])
  {
    unint64_t v14 = 0;
    v15 = &off_497000;
    do
    {
      objc_opt_class();
      [v12 objectAtIndexedSubscript:v14];
      v16 = (void *)TSUDynamicCast();
      id v17 = [v16 second];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 addObject:v16];
      }
      else if ([v17 conformsToProtocol:v15[81]])
      {
        if ([(THWDrawablesWidgetInfo *)v7 stageDrawable])
        {
          id v18 = +[TSUAssertionHandler currentHandler];
          id v19 = v13;
          v20 = v7;
          v21 = v15;
          v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIFrame mapEndElementWithState:]");
          v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIFrame.mm"];
          v24 = v22;
          v15 = v21;
          v7 = v20;
          id v13 = v19;
          [v18 handleFailureInFunction:v24 file:v23 lineNumber:70 description:@"Overwriting an existing stage drawable."];
        }
        [(THWDrawablesWidgetInfo *)v7 setStageDrawable:v17];
      }
      ++v14;
    }
    while (v14 < (unint64_t)[v12 count]);
  }
  objc_opt_class();
  [(THWDrawablesWidgetInfo *)v7 stageDrawable];
  v25 = (void *)TSUDynamicCast();
  if (+[PFXWidget isWidgetExpandedOnly:v32])
  {
    if (v25)
    {
      if (([v25 isAudioOnly] & 1) == 0)
      {
        id v26 = [v25 posterImageData];
        if (v26)
        {
          v27 = [[THImageInfo alloc] initWithContext:[v25 context] geometry:[TSDInfo geometry][-[THWDrawablesWidgetInfo stageDrawable](v7, "stageDrawable"), "geometry"] style:[v25 style] imageData:v26 originalImageData:0];
          [(THWDrawablesWidgetInfo *)v7 setStageDrawable:v27];
          [(THWDrawablesWidgetInfo *)v7 setExpandedStageDrawable:v25];
          [(THWDrawablesWidgetInfo *)v7 setExpandedOnly:1];
          objc_msgSend(objc_msgSend(objc_msgSend(v32, "orientationState"), "contentNodeBody"), "setExpandedDrawable:forWidgetInfo:", v7, v25);
        }
      }
    }
  }
  [(THWDrawablesWidgetInfo *)v7 stageDrawable];
  v28 = (void *)TSUProtocolCast();
  if (v28) {
    [v28 setAutoplayConfig:[PFXAutoplayConfig autoplayConfigWithState:v32]];
  }
  id v29 = [objc_alloc((Class)TSUPair) initWithFirst:@"stage" second:v7];
  [v13 addObject:v29];

  [v30 setResult:v13];
  v33.receiver = v31;
  v33.super_class = (Class)PFEIFrame;
  [(PFEIWidget *)&v33 mapEndElementWithState:v32];
}

@end