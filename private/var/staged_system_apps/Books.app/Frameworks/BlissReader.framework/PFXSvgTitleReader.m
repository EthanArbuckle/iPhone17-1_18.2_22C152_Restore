@interface PFXSvgTitleReader
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXSvgTitleReader

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3 = [a3 currentHtmlStackEntry];
  id v4 = objc_msgSend(objc_msgSend(v3, "currentEntryMediaState"), "storage");
  id v5 = [v3 parentHtmlStackEntry];
  if (xmlStrEqual((const xmlChar *)[v5 xmlElementName], (const xmlChar *)"svg")) {
    objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setAltDesc:", objc_msgSend(v4, "string"));
  }
  id v7 = [v4 range];

  [v4 replaceCharactersInRange:v7 withString:v6 notifyObservers:&stru_46D7E8 undoTransaction:0];
}

@end