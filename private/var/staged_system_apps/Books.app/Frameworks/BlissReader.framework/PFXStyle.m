@interface PFXStyle
- (BOOL)mapStartElementWithState:(id)a3;
- (id)supportedMediaTypes;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXStyle

- (id)supportedMediaTypes
{
  return +[PFXStylesheet basicMediaTypes];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentXmlStackEntry];
  id v6 = [v5 valueForAttribute:"type"];
  if ([PFXCommonCssMimeType isEqualToString:v6])
  {
    id v7 = [(PFXStyle *)self supportedMediaTypes];
    id v8 = [v5 valueForAttribute:"media"];
    if (!v8 || [v7 containsObject:v8])
    {
      v9 = +[NSMutableString stringWithCapacity:0];
      v10 = (xmlTextReader *)[a3 streamAPI];
      int v11 = xmlTextReaderDepth(v10);
      while (xmlTextReaderRead(v10) == 1)
      {
        if (xmlTextReaderDepth(v10) == v11 && xmlTextReaderNodeType(v10) == 15) {
          break;
        }
        if (xmlTextReaderNodeType(v10) == 3) {
          [(NSMutableString *)v9 appendFormat:@"%@ %s", v9, xmlTextReaderConstValue(v10)];
        }
      }
      if ([(NSMutableString *)v9 length]
        && !+[PFXStylesheet readStylesheetFromStyleNodeContents:sourceURL:readerState:](PFXStylesheet, "readStylesheetFromStyleNodeContents:sourceURL:readerState:", v9, [a3 entryNSURL], a3))
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXStyle mapStartElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXStyle.mm") lineNumber:58 description:@"Failed to read CSS from style element"];
      }
    }
  }
  return 0;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXStyle mapEndElementWithState:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXStyle.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:72 description:@"Bad call."];
}

@end