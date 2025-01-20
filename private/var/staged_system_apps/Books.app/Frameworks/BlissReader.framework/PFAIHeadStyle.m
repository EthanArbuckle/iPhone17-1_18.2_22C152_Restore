@interface PFAIHeadStyle
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFAIHeadStyle

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentXmlStackEntry];
  id v5 = [v4 valueForAttribute:"type"];
  if ([PFXCommonCssMimeType isEqualToString:v5])
  {
    id v6 = [v4 valueForAttribute:"media"];
    unsigned int v7 = +[PFXStylesheet isMediaTypeSupportedInFlow:v6];
    unsigned int v8 = +[PFXStylesheet isMediaTypeSupportedInPaginated:v6];
    unsigned int v9 = v8;
    if ((v7 & 1) != 0 || v8)
    {
      v10 = +[NSMutableString stringWithCapacity:0];
      v11 = (xmlTextReader *)[a3 streamAPI];
      int v12 = xmlTextReaderDepth(v11);
      while (xmlTextReaderRead(v11) == 1)
      {
        if (xmlTextReaderDepth(v11) == v12 && xmlTextReaderNodeType(v11) == 15) {
          break;
        }
        if (xmlTextReaderNodeType(v11) == 3) {
          [(NSMutableString *)v10 appendFormat:@"%@ %s", v10, xmlTextReaderConstValue(v11)];
        }
      }
      if ([(NSMutableString *)v10 length])
      {
        if (v7)
        {
          [a3 setFlowAsCurrent];
          +[PFXStylesheet readStylesheetFromStyleNodeContents:sourceURL:readerState:](PFXStylesheet, "readStylesheetFromStyleNodeContents:sourceURL:readerState:", v10, [a3 entryNSURL], a3);
        }
        if (v9)
        {
          [a3 setPaginatedAsCurrent];
          +[PFXStylesheet readStylesheetFromStyleNodeContents:sourceURL:readerState:](PFXStylesheet, "readStylesheetFromStyleNodeContents:sourceURL:readerState:", v10, [a3 entryNSURL], a3);
        }
      }
    }
  }
  return 0;
}

@end