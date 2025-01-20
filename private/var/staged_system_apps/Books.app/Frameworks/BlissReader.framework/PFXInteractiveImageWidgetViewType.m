@interface PFXInteractiveImageWidgetViewType
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXInteractiveImageWidgetViewType

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v6 = [v5 propertySet];
  v7 = objc_alloc_init(PFXInteractiveImageWidgetViewObj);
  double v17 = 1.0;
  CGPoint v16 = CGPointZero;
  +[PFXInteractiveImageWidgetCalloutType readScaleTranslation:&v17 translation:&v16 stackEntry:v4];
  [(PFXInteractiveImageWidgetViewObj *)v7 setScale:v17];
  [(PFXInteractiveImageWidgetViewObj *)v7 setTranslation:v16];
  -[PFXInteractiveImageWidgetViewObj setCanvasGeometry:](v7, "setCanvasGeometry:", PFXTSDInfoGeometry((const char *)[v4 xmlValueForAttribute:PFXWidgetConstantDataCanvasGeometry[0]]));
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (char *)[v5 childResultCount];
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
      [v8 addObject:[v5 childResultAtIndex:i]];
  }
  [(PFXInteractiveImageWidgetViewObj *)v7 setChildren:v8];

  id v12 = objc_alloc_init((Class)TSSPropertyMap);
  id v13 = +[PFXGraphicStyle mapStrokeFromStyleProperties:v6 contentState:a3];
  if (v13) {
    [v12 setObject:v13 forProperty:517];
  }
  id v14 = +[PFXGraphicStyle mapFillFromStyleProperties:v6 contentState:a3];
  if (v14) {
    [v12 setObject:v14 forProperty:516];
  }
  id v15 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, v12, 0);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v15);
  [(PFXInteractiveImageWidgetViewObj *)v7 setStyle:v15];

  [v5 setResult:v7];
}

@end