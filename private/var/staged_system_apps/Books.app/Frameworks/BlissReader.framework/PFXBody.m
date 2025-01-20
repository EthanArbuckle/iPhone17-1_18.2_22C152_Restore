@interface PFXBody
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXBody

- (BOOL)mapStartElementWithState:(id)a3
{
  [a3 setInBody:1];
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  id v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "defaultParagraphStyle");
  id v6 = [v4 storage];
  [v6 stylesheet];
  [v5 stylesheet];
  id v7 = [v6 length];
  if (!v7) {
    [v6 setParagraphStyle:v5 forCharRange:0 undoTransaction:0];
  }
  [v4 setParagraphStyle:v5];
  [v4 setStartCharIndex:v7];
  [v5 floatValueForProperty:17];
  [v4 setFontSize:v8];
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlDocMediaState];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(objc_msgSend(a3, "popoversByIdentifier"), "allKeys", 0);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v4 sourceDrawableInfoForIdentifier:v10];
        if (v11)
        {
          v12 = v11;
          id v13 = [a3 targetDrawableInfoForIdentifier:v10];
          if (![v12 popUpInfo] && v13 != 0)
          {
            [v13 setProgressKitID:v10];
            [v13 setProgressKitSectionID:[a3 nodeGUID]];
            [v12 setPopUpInfo:v13];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  if (xmlStrEqual((const xmlChar *)"html", (const xmlChar *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "parentEntry"), "xmlElementName")))
  {
    [a3 setInBody:0];
  }
}

@end