@interface PFXSceneWidget
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXSceneWidget

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v33 = +[PFXWidget urlForDataBundleWithState:a3];
  v6 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", [a3 tspContext]);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v6);
  v7 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:self->super.super.mPlacement readerState:a3];
  id v8 = PFXTSDInfoGeometry((const char *)[v5 valueForAttribute:[PFXWidgetConstantDataStageGeometry[0] UTF8String]]);
  id v9 = objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "childResultCount");
  if (v9)
  {
    uint64_t v10 = 0;
    while (1)
    {
      objc_msgSend(objc_msgSend(v5, "currentEntryMediaState", v33), "childResultAtIndex:", v10);
      objc_opt_class();
      v11 = (void *)TSUDynamicCast();
      if (v11) {
        break;
      }
      if (v9 == (id)++v10)
      {
        id v9 = 0;
        goto LABEL_7;
      }
    }
    id v9 = [v11 color];
  }
LABEL_7:
  v12 = -[THWSceneInfo initWithContext:geometry:sourceURL:drmContext:stageColor:]([THWSceneInfo alloc], "initWithContext:geometry:sourceURL:drmContext:stageColor:", [a3 tspContext], v8, v33, objc_msgSend(objc_msgSend(a3, "archive"), "drmContext"), v9);
  -[THWSceneInfo setProgressKitID:](v12, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v5 xmlElementId]));
  -[THWSceneInfo setProgressKitSectionID:](v12, "setProgressKitSectionID:", [a3 nodeGUID]);
  if ([(PFXWidgetPlacement *)v7 fallbackImage])
  {
    id v13 = objc_alloc((Class)TSDInfoGeometry);
    [(-[TSDImageInfo geometry](-[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"), "geometry")) position];
    [v8 position];
    TSDSubtractPoints();
    double v15 = v14;
    double v17 = v16;
    [(-[TSDImageInfo geometry](-[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"), "geometry")) size];
    id v20 = [v13 initWithPosition:v15 size:v17, v18, v19];
    [(TSDImageInfo *)[(PFXWidgetPlacement *)v7 fallbackImage] setGeometry:v20];
    [(THWSceneInfo *)v12 setPlaceholderImage:[(PFXWidgetPlacement *)v7 fallbackImage]];
  }
  v21 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantColladaAutoRotateWhenIdle[0] error:v33];
  if (v21 && xmlStrEqual(v21, (const xmlChar *)"yes")) {
    [(THWSceneInfo *)v12 setIdleAnimationBehavior:1];
  }
  v22 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantColladaRotationType[0]];
  if (xmlStrEqual(v22, (const xmlChar *)PFXWidgetConstantColladaRotationFreeRotate[0]))
  {
    uint64_t v23 = 0;
  }
  else if (xmlStrEqual(v22, (const xmlChar *)PFXWidgetConstantColladaRotationHorizontal[0]))
  {
    uint64_t v23 = 2;
  }
  else
  {
    if (!xmlStrEqual(v22, (const xmlChar *)PFXWidgetConstantColladaRotationHorizontalAndVertical[0])) {
      goto LABEL_19;
    }
    uint64_t v23 = 1;
  }
  [(THWSceneInfo *)v12 setRotationConstraints:v23];
LABEL_19:
  v24 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.super.mPlacement, "infoGeometry"));
  [(THWDrawablesWidgetInfo *)v24 setStageDrawable:v12];
  id v25 = [v5 valueForAttribute:"title"];
  if (v25)
  {
    id v26 = v25;
    id v27 = [(THWDrawablesWidgetInfo *)v24 accessibilityDescriptions];
    if (!v27)
    {
      id v27 = objc_alloc_init((Class)NSMutableDictionary);
      [(THWDrawablesWidgetInfo *)v24 setAccessibilityDescriptions:v27];
    }
    [v27 setObject:v26 forKey:@"widgetTitle"];
  }
  if ([(PFXWidgetPlacement *)v7 hasChildrenForAdornmentInfo])
  {
    [(THWDrawablesWidgetInfo *)v24 setAdornmentInfo:+[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:v7 readerState:a3]];
    [(THWWidgetAdornmentInfo *)[(THWDrawablesWidgetInfo *)v24 adornmentInfo] updateParentInfo:v24];
    v28 = [(THWWidgetAdornmentInfo *)[(THWDrawablesWidgetInfo *)v24 adornmentInfo] title];
    if (v28)
    {
      id v29 = [(TSWPShapeInfo *)v28 containedStorage];
      id v30 = [a3 ancestorEntryWithReaderClass:objc_opt_class()];
      objc_opt_class();
      [v30 reader];
      v31 = (void *)TSUDynamicCast();
      if (v31) {
        [v31 setGutterTitleStorage:v29];
      }
    }
    [(THWSceneInfo *)v12 setPanelContentProvider:[(THWDrawablesWidgetInfo *)v24 adornmentInfo]];
  }
  [a3 setUniqueIdForInfo:v24 fromStackEntry:v5];
  objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setResult:", v24);

  mPlacement = self->super.super.mPlacement;

  [(PFXDrawablePlacement *)mPlacement mapEndElementWithState:a3];
}

@end