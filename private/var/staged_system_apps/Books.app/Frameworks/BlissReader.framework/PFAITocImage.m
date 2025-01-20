@interface PFAITocImage
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAITocImage

- (void)mapEndElementWithState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFAITocImage;
  -[PFXImage mapEndElementWithState:](&v6, "mapEndElementWithState:");
  v4 = (const xmlChar *)dataTocConfigBackgroundImage;
  id v5 = [a3 currentXmlStackEntry];
  xmlStrEqual(v4, (const xmlChar *)[v5 xmlValueForAttribute:dataTocConfigAttribute]);
}

@end