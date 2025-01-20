@interface PFEIFigure
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEIFigure

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3 = [a3 currentHtmlStackEntry];
  id v4 = [v3 currentEntryMediaState];
  v5 = (const xmlChar *)[v3 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (xmlStrEqual(v5, (const xmlChar *)PFXWidgetConstantGalleryObjectValueItem[0])
    && [v4 childResultCount])
  {
    id v6 = +[PFEIGallery galleryItemFromEntry:v3];
    if (!v6) {
      return;
    }
  }
  else
  {
    if (![v4 childResultCount]) {
      return;
    }
    id v6 = [v4 childResults];
  }

  [v4 setResult:v6];
}

@end