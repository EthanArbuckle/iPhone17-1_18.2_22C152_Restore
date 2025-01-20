@interface PFXWidgetStyleType
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
- (void)mapGraphicStyleWithState:(id)a3;
- (void)mapParagraphStyleWithState:(id)a3;
@end

@implementation PFXWidgetStyleType

- (void)mapParagraphStyleWithState:(id)a3
{
  id v3 = [a3 currentHtmlStackEntry];
  id v4 = [v3 currentEntryMediaState];
  uint64_t v5 = 0;
  +[PFXParagraphStyle map:&v5 stackEntry:v3];
  [v4 setResult:v5];
}

- (void)mapGraphicStyleWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  id v5 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", [v4 propertySet], a3);

  [v4 setResult:v5];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  v6 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantDataWidgetStyleType[0]];
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueParagraphStyle[0]))
  {
    [(PFXWidgetStyleType *)self mapParagraphStyleWithState:a3];
  }
  else if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueGraphicStyle[0]))
  {
    [(PFXWidgetStyleType *)self mapGraphicStyleWithState:a3];
  }
}

@end