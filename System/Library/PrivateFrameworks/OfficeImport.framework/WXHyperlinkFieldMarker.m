@interface WXHyperlinkFieldMarker
+ (void)readFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6;
@end

@implementation WXHyperlinkFieldMarker

+ (void)readFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [v10 packagePart];
  uint64_t v12 = [v10 OCXReadRelationshipForNode:a3 packagePart:v11];

  v13 = [v10 WXMainNamespace];
  id v31 = 0;
  CXOptionalStringAttribute(a3, v13, (xmlChar *)"anchor", &v31);
  unint64_t v14 = (unint64_t)v31;

  if (v12 | v14)
  {
    if (v12)
    {
      v15 = [(id)v12 targetLocation];
      v16 = v15;
      if (v15)
      {
        v17 = [v15 scheme];
        v18 = [v17 lowercaseString];

        v30 = v18;
        if (([v18 isEqualToString:@"http"] & 1) != 0
          || ([v18 isEqualToString:@"https"] & 1) != 0
          || ([v18 isEqualToString:@"ftp"] & 1) != 0
          || ([v18 isEqualToString:@"mailto"] & 1) != 0
          || ([v16 isFileURL] & 1) != 0
          || ([v16 absoluteString],
              v19 = objc_claimAutoreleasedReturnValue(),
              [v19 rangeOfString:@"///"],
              uint64_t v21 = v20,
              v19,
              v21))
        {
          if (v14) {
            id v22 = (id)v14;
          }
          [v16 absoluteString];
          uint64_t v23 = 0;
          v24 = (void *)v14;
          id v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = [v16 fragment];

          id v25 = 0;
          if (v29)
          {
            v24 = [v16 fragment];
            uint64_t v23 = 1;
          }
          else
          {
            [v30 isEqualToString:@"javascript"];
            uint64_t v23 = 0;
            v24 = 0;
          }
        }
      }
      else
      {
        uint64_t v23 = 0;
        v24 = 0;
        id v25 = 0;
      }
    }
    else if (v14)
    {
      id v25 = (id)v14;
      v24 = 0;
      uint64_t v23 = 1;
    }
    else
    {
      uint64_t v23 = 0;
      v24 = 0;
      id v25 = 0;
    }
    v26 = [v9 addHyperlinkFieldMarker:19];
    [v26 setInternalLink:v23];
    [v26 setLink:v25];
    [v26 setFragment:v24];
    id v27 = (id)[v9 addFieldMarker:20];
    +[WXParagraph readRunsFrom:a3 paragraphNamespace:a4 to:v9 targetRun:0 state:v10];
    id v28 = (id)[v9 addHyperlinkFieldMarker:21];
  }
  else
  {
    +[WXParagraph readRunsFrom:a3 paragraphNamespace:a4 to:v9 targetRun:0 state:v10];
  }
}

@end