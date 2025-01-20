@interface PFAIHint
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFAIHint

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentStackEntry];
  id v5 = objc_msgSend(objc_msgSend(v4, "paginatedState"), "storage");
  if (xmlStrEqual((const xmlChar *)[v4 xmlElementName], (const xmlChar *)"lp"))
  {
    id v6 = [a3 hintCollectorForStorage:v5];
    [v6 addLineBreakHintWithPresentationId:paginatedPresentationId];
  }
  else if (xmlStrEqual((const xmlChar *)[v4 xmlElementName], (const xmlChar *)"sp"))
  {
    id v7 = [v4 valueForAttribute:"idref"];
    id v8 = [a3 hintCollectorForStorage:v5];
    [v8 addStartHintWithIdref:v7 presentationId:paginatedPresentationId];
  }
  [a3 setCfiPathForCurrentStorage];
  return 1;
}

@end