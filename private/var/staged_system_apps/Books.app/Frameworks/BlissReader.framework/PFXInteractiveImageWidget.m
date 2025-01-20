@interface PFXInteractiveImageWidget
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)placement;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXInteractiveImageWidget

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXInteractiveImageWidget;
  [(PFXInteractiveImageWidget *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mPlacement = v5;
  unsigned __int8 v6 = [(PFXDrawablePlacement *)v5 mapStartElementWithState:a3];
  id v7 = [a3 currentHtmlDocMediaState];
  if ([(PFXDrawablePlacement *)self->mPlacement mode] == 2)
  {
    if ([v7 hasHints])
    {
      if (([a3 inTable] & 1) == 0)
      {
        id v8 = [v7 nextHintLocation];
        if (v8 == [a3 totalTextRead])
        {
          objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage")), "addLineBreakHintWithPresentationId:", @"p");
          [v7 popHint];
        }
      }
    }
  }
  return v6;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v59 = [a3 tspContext];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 childResultCount];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      objc_opt_class();
      [v5 childResultAtIndex:v9];
      uint64_t v10 = TSUDynamicCast();
      if (v10) {
        break;
      }
      if (v8 == (id)++v9) {
        goto LABEL_5;
      }
    }
    v11 = (void *)v10;
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  v12 = [THWInteractiveImageCalloutInfo alloc];
  [v11 scale];
  double v14 = v13;
  [v11 translation];
  v17 = -[THWInteractiveImageCalloutInfo initWithViewScale:contentOffset:](v12, "initWithViewScale:contentOffset:", v14, v15, v16);
  [v6 addObject:v17];

  v18 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantVisualDictionaryUseCommonDescription[0]];
  double v19 = 0.0;
  if (v18 && xmlStrEqual(v18, (const xmlChar *)"yes"))
  {
    objc_msgSend(objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantVisualDictionaryDescriptionWidth[0]), "floatValue");
    double v19 = v20;
    unsigned int v58 = 1;
  }
  else
  {
    unsigned int v58 = 0;
  }
  v21 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantVisualDictionaryShowControls[0]];
  v62 = v4;
  id v63 = a3;
  v61 = v5;
  if (v21) {
    BOOL v57 = xmlStrEqual(v21, (const xmlChar *)"yes") != 0;
  }
  else {
    BOOL v57 = 0;
  }
  id v22 = objc_alloc_init((Class)NSMutableArray);
  id v23 = [v11 children];
  v24 = (char *)[v23 count];
  if (v24)
  {
    for (i = 0; i != v24; ++i)
    {
      objc_opt_class();
      [v23 objectAtIndex:i];
      uint64_t v26 = TSUDynamicCast();
      if (v26) {
        [v22 addObject:v26];
      }
    }
  }
  v60 = v11;
  [v22 sortUsingSelector:"sortInteractiveImageChildren:"];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v27 = [v22 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v66;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v66 != v29) {
          objc_enumerationMutation(v22);
        }
        v31 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        objc_opt_class();
        [v31 first];
        uint64_t v32 = TSUDynamicCast();
        if (v32) {
          [v6 addObject:v32];
        }
      }
      id v28 = [v22 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v28);
  }

  if (v24)
  {
    uint64_t v33 = 0;
    v34 = v63;
    v35 = v60;
    while (1)
    {
      objc_opt_class();
      [v23 objectAtIndex:v33];
      uint64_t v36 = TSUDynamicCast();
      if (v36) {
        break;
      }
      if (v24 == (char *)++v33)
      {
        uint64_t v37 = 0;
        goto LABEL_35;
      }
    }
    uint64_t v37 = v36;
  }
  else
  {
    uint64_t v37 = 0;
    v34 = v63;
    v35 = v60;
  }
LABEL_35:
  v38 = [[TSWWidgetStyle alloc] initWithContext:v59];
  objc_msgSend(objc_msgSend(objc_msgSend(v34, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v38);
  id v39 = PFXTSDInfoGeometry((const char *)[v62 xmlValueForAttribute:PFXWidgetConstantDataStageGeometry[0]]);
  [v39 position];
  double v41 = v40;
  double v43 = v42;
  [v39 size];
  v46 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v41, v43, v44, v45, 0.0);
  v47 = self;
  v48 = [[THWInteractiveImageWidgetInfo alloc] initWithContext:v59 geometry:[(PFXDrawablePlacement *)self->mPlacement infoGeometry] style:v38 stageGeometry:v46];

  -[THWInteractiveImageWidgetInfo setProgressKitID:](v48, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v62 xmlElementId]));
  -[THWInteractiveImageWidgetInfo setProgressKitSectionID:](v48, "setProgressKitSectionID:", [v34 nodeGUID]);
  objc_msgSend(objc_msgSend(v35, "canvasGeometry"), "boundsBeforeRotation");
  -[THWInteractiveImageWidgetInfo setupWithCallouts:backgroundSize:backgroundImageInfo:useSidebar:showTransportControls:](v48, "setupWithCallouts:backgroundSize:backgroundImageInfo:useSidebar:showTransportControls:", v6, v37, v58, v57, v49, v50);
  -[THWInteractiveImageWidgetInfo setViewportStyle:](v48, "setViewportStyle:", [v35 style]);
  -[THWInteractiveImageWidgetInfo setBackgroundFill:](v48, "setBackgroundFill:", objc_msgSend(objc_msgSend(v35, "style"), "valueForProperty:", 516));

  if (v19 == 0.0) {
    unsigned int v51 = 0;
  }
  else {
    unsigned int v51 = v58;
  }
  if (v51 == 1) {
    [(THWInteractiveImageWidgetInfo *)v48 setSidebarWidth:v19];
  }
  v52 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:self->mPlacement readerState:v34];
  if ([(PFXWidgetPlacement *)v52 hasChildrenForAdornmentInfo])
  {
    [(THWInteractiveImageWidgetInfo *)v48 setAdornmentInfo:+[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:v52 readerState:v34]];
    [(THWWidgetAdornmentInfo *)[(THWInteractiveImageWidgetInfo *)v48 adornmentInfo] updateParentInfo:v48];
    v53 = [(THWWidgetAdornmentInfo *)[(THWInteractiveImageWidgetInfo *)v48 adornmentInfo] title];
    if (v53)
    {
      id v54 = [(TSWPShapeInfo *)v53 containedStorage];
      id v55 = [v34 ancestorEntryWithReaderClass:objc_opt_class()];
      v47 = self;
      objc_opt_class();
      [v55 reader];
      v56 = (void *)TSUDynamicCast();
      if (v56) {
        [v56 setGutterTitleStorage:v54];
      }
    }
  }
  [v34 setUniqueIdForInfo:v48 fromStackEntry:v62];
  [v61 setResult:v48];

  [(PFXDrawablePlacement *)v47->mPlacement mapEndElementWithState:v34];
}

- (PFXDrawablePlacement)placement
{
  return self->mPlacement;
}

@end