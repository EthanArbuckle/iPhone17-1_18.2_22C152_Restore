@interface PFEIWeb
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEIWeb

- (void)mapEndElementWithState:(id)a3
{
  [(PFXDrawablePlacement *)[(PFEIWidget *)self placement] mapEndElementWithState:a3];
  id v5 = [a3 currentHtmlStackEntry];
  id v28 = [v5 currentEntryMediaState];
  id v6 = +[PFXWidget urlForDataBundleWithState:a3];
  id v7 = PFXTSDInfoGeometry((const char *)[v5 valueForAttribute:[PFXWidgetConstantDataStageGeometry[0] UTF8String]]);
  v8 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantDataNotifiesOnReady[0]];
  BOOL v9 = v8 && *v8 && xmlStrEqual(v8, (const xmlChar *)"yes") != 0;
  [a3 applePubVersion];
  double v11 = v10;
  v27 = v5;
  v12 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantAllowNetworkAccess];
  if (v12) {
    BOOL v13 = xmlStrEqual(v12, (const xmlChar *)"yes") != 0;
  }
  else {
    BOOL v13 = 1;
  }
  v26 = self;
  BYTE1(v25) = v13;
  LOBYTE(v25) = v11 <= 1.01;
  v14 = [[THWWebInfo alloc] initWithContext:[[PFXDrawablePlacement infoGeometry:[PFEIWidget placement:self] "infoGeometry"] tspContext] geometry:[[PFXDrawablePlacement infoGeometry:[PFEIWidget placement:self] "infoGeometry"] stageGeometry] sourceURL:[[PFXDrawablePlacement infoGeometry:[PFEIWidget placement:self] "infoGeometry"] drmContext] drmContext:[[PFXDrawablePlacement infoGeometry:[PFEIWidget placement:self] "infoGeometry"] exposurePolicy] ignoreInfoPlist:[[PFXDrawablePlacement infoGeometry:[PFEIWidget placement:self] "infoGeometry"] allowNetworkAccess] autoplayConfig:[[PFXDrawablePlacement infoGeometry:[PFEIWidget placement:self] "infoGeometry"] autoplayConfig]];
  objc_opt_class();
  objc_msgSend(objc_msgSend(v28, "childResults"), "firstObject");
  v15 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v15 second];
  v16 = (void *)TSUDynamicCast();
  id v17 = objc_alloc_init((Class)NSMutableArray);
  if (![v16 count]) {
    goto LABEL_18;
  }
  unint64_t v18 = 0;
  id v19 = 0;
  do
  {
    objc_opt_class();
    [v16 objectAtIndexedSubscript:v18];
    v20 = (void *)TSUDynamicCast();
    id v21 = [v20 second];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 addObject:v20];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & (v19 == 0)) != 0) {
        id v19 = v21;
      }
    }
    ++v18;
  }
  while (v18 < (unint64_t)[v16 count]);
  if (v19)
  {
    [(THWWebInfo *)v14 setPlaceholderInfo:v19];
    v22 = v14;
    v23 = v26;
    if (+[PFXWidget isWidgetExpandedOnly:a3])
    {
      v22 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXWebWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](v26, "placement"), "infoGeometry"), objc_msgSend(v27, "titleAttributeValue"), v19, v14);
      [(THWWebInfo *)v22 setStageDrawable:v19];
      [(THWWebInfo *)v22 setExpandedStageDrawable:v14];
      [(THWWebInfo *)v22 setExpandedOnly:1];
      objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "setExpandedDrawable:forWidgetInfo:", v22, v14);
    }
  }
  else
  {
LABEL_18:
    +[PFXWidget isWidgetExpandedOnly:a3];
    v22 = v14;
    v23 = v26;
  }
  id v24 = [objc_alloc((Class)TSUPair) initWithFirst:@"web" second:v22];
  [v17 addObject:v24];

  [a3 setUniqueIdForInfo:v14 fromStackEntry:v27];
  [a3 setCfiPathForInfo:v14 fromStackEntry:v27];
  [v28 setResult:v17];

  v29.receiver = v23;
  v29.super_class = (Class)PFEIWeb;
  [(PFEIWidget *)&v29 mapEndElementWithState:a3];
}

@end