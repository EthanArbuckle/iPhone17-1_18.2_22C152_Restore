@interface PFXMath
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFXMath

- (BOOL)mapStartElementWithState:(id)a3
{
  xmlNodePtr v4 = xmlTextReaderExpand((xmlTextReaderPtr)[a3 streamAPI]);
  xmlDocPtr v5 = xmlTextReaderCurrentDoc((xmlTextReaderPtr)[a3 streamAPI]);
  id v6 = [a3 currentHtmlStackEntry];
  id v7 = [a3 currentHtmlDocMediaState];
  id v8 = objc_msgSend(objc_msgSend(v6, "currentEntryMediaState"), "storage");
  id v9 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle");
  if ([v7 hasHints])
  {
    if (([a3 inTable] & 1) == 0)
    {
      id v10 = [a3 totalTextRead];
      if (v10 == [v7 nextHintLocation] && !objc_msgSend(v7, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", v8), "addLineBreakHintWithPresentationId:", @"p");
        [v7 popHint];
      }
    }
  }
  id v11 = objc_msgSend(objc_alloc((Class)TSWPEquationInfo), "initWithContext:mathMLNode:fromXMLDoc:", objc_msgSend(a3, "tspContext"), v4, v5);
  id v12 = [objc_alloc((Class)TSDExteriorTextWrap) initWithIsHTMLWrap:0 type:0 direction:2 fitType:0 margin:0.0 alphaThreshold:0.5];
  [v11 setExteriorTextWrap:v12];
  id v13 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(a3, "tspContext"), v11);
  [v13 setHOffsetType:0];
  [v13 setHOffset:0.0];
  [v13 setVOffsetType:0];
  [v13 setVOffset:0.0];
  id v14 = [v8 length];
  [v8 insertAttachmentOrFootnote:v13 range:v14];
  [v8 setCharacterStyle:v9 range:v14 undoTransaction:1];

  return 0;
}

@end