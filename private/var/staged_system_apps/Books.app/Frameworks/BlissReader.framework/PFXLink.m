@interface PFXLink
- (BOOL)mapStartElementWithState:(id)a3;
- (id)supportedCssMediaTypes;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXLink

- (id)supportedCssMediaTypes
{
  return +[PFXStylesheet basicMediaTypes];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentXmlStackEntry];
  id v6 = [v5 valueForAttribute:"type"];
  id v7 = [v5 valueForAttribute:"href"];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = v7;
    if (([PFXCommonSvgMimeType isEqualToString:v6] & 1) != 0
      || [PFXCommonSvgImageMimeType isEqualToString:v6])
    {
      if (![PFXSvgDefs readSvgDefinitionsFromEntry:readerState:v9, a3])[TSUAssertionHandler currentHandler][self previousToolbarHidden]]; {
    }
      }
    else
    {
      id v10 = [(PFXLink *)self supportedCssMediaTypes];
      id v11 = [v5 valueForAttribute:"media"];
      if ((!v11 || [v10 containsObject:v11])
        && !+[PFXStylesheet readStylesheetFromEntry:v9 readerState:a3])
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXLink mapStartElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXLink.mm") lineNumber:47 description:@"Failed to read CSS stylesheet '%@'", v9];
      }
    }
  }
  return 0;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXLink mapEndElementWithState:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXLink.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:60 description:@"Bad call."];
}

@end