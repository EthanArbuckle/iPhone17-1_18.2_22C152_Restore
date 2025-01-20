@interface EXHyperlink
+ (id)edHyperlinkFromXmlHyperlinkElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXHyperlink

+ (id)edHyperlinkFromXmlHyperlinkElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = +[EDHyperlink hyperlink];
    v7 = [v5 currentPart];
    v8 = [v5 OCXReadRelationshipForNode:a3 packagePart:v7];

    if (!v8)
    {
      [v6 setType:3];
      goto LABEL_11;
    }
    v9 = [v8 targetLocation];
    v10 = v9;
    if (!v9)
    {
      a3 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v11 = [v9 absoluteURL];
    v12 = [v11 absoluteString];
    v13 = +[EDString edStringWithString:v12];
    [v6 setPath:v13];

    v14 = [v6 path];
    v15 = [v14 string];
    if (([v15 hasPrefix:@"mailto:"] & 1) == 0)
    {
      v16 = [v6 path];
      v17 = [v16 string];
      if (([v17 hasPrefix:@"http://"] & 1) == 0)
      {
        v34 = [v6 path];
        v32 = [v34 string];
        char v33 = [v32 hasPrefix:@"https://"];

        if ((v33 & 1) == 0)
        {
          uint64_t v18 = 1;
          goto LABEL_9;
        }
LABEL_8:
        uint64_t v18 = 0;
LABEL_9:
        [v6 setType:v18];

LABEL_11:
        id v38 = 0;
        BOOL v19 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v38);
        id v20 = v38;
        if (v19)
        {
          v21 = +[EXReference edReferenceFromXmlReference:v20];
          [v6 setReference:v21];
        }
        id v37 = v20;
        BOOL v22 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"location", &v37);
        id v23 = v37;

        if (v22)
        {
          v24 = +[EDString edStringWithString:v23];
          [v6 setTextMark:v24];
        }
        id v36 = v23;
        BOOL v25 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"tooltip", &v36);
        id v26 = v36;

        if (v25)
        {
          v27 = +[EDString edStringWithString:v26];
          [v6 setToolTip:v27];
        }
        id v35 = v26;
        BOOL v28 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"display", &v35);
        id v29 = v35;

        if (v28)
        {
          v30 = +[EDString edStringWithString:v29];
          [v6 setDescriptionText:v30];
        }
        a3 = v6;

        goto LABEL_21;
      }
    }
    goto LABEL_8;
  }
LABEL_22:

  return a3;
}

@end