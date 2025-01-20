@interface OAXParagraph
+ (void)readParagraph:(_xmlNode *)a3 paragraph:(id)a4 drawingState:(id)a5;
@end

@implementation OAXParagraph

+ (void)readParagraph:(_xmlNode *)a3 paragraph:(id)a4 drawingState:(id)a5
{
  id v41 = a4;
  id v7 = a5;
  v8 = [v7 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "pPr");

  if (v9)
  {
    v10 = [v41 properties];
    +[OAXTextParaPropertyBag readParagraphProperties:v9 paragraphProperties:v10 drawingState:v7];
  }
  v11 = [v7 OAXMainNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "endParaRPr");

  v13 = &OBJC_METACLASS___OAXParagraph;
  if (v12)
  {
    v14 = [v41 paragraphEndCharacterProperties];
    +[OAXTextCharPropertyBag readCharacterProperties:v12 characterProperties:v14 drawingState:v7];
  }
  v15 = OCXFirstChild(a3);
  uint64_t v40 = *MEMORY[0x263EFF488];
  while (v15)
  {
    if (xmlStrEqual(v15->name, (const xmlChar *)"r"))
    {
      v16 = [v41 addRegularTextRun];
      v17 = [v7 OAXMainNamespace];
      uint64_t v18 = OCXFindChild(v15, v17, "rPr");

      v19 = [v16 properties];
      [&v13[23] readCharacterProperties:v18 characterProperties:v19 drawingState:v7];

      v20 = [v7 OAXMainNamespace];
      uint64_t v21 = OCXFindChild(v15, v20, "t");

      v22 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v21);
      if (v22)
      {
        v23 = [v16 text];
        [v23 setString:v22];
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (xmlStrEqual(v15->name, (const xmlChar *)"br"))
    {
      v16 = [v41 addTextLineBreak];
      v24 = [v7 OAXMainNamespace];
      uint64_t v25 = OCXFindChild(v15, v24, "rPr");

      v22 = [v16 properties];
      [&v13[23] readCharacterProperties:v25 characterProperties:v22 drawingState:v7];
      goto LABEL_13;
    }
    if (xmlStrEqual(v15->name, (const xmlChar *)"fld"))
    {
      v22 = CXRequiredStringAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"type");
      v23 = CXRequiredStringAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
      v26 = +[OAXTextFieldIdentity identityWithGuid:v23 type:v22];
      if (OAXDateTimeIdentityToFormatMap(void)::once != -1) {
        dispatch_once(&OAXDateTimeIdentityToFormatMap(void)::once, &__block_literal_global_50);
      }
      id v27 = (id)OAXDateTimeIdentityToFormatMap(void)::theMap;
      v28 = [v27 objectForKeyedSubscript:v26];

      if (v28)
      {
        id v29 = (id)objc_msgSend(v41, "addDateTimeFieldWithFormat:", objc_msgSend(v28, "intValue"));
        v16 = 0;
      }
      else
      {
        v30 = [v7 client];
        v16 = [v30 readClientTextField:v15 identity:v26 paragraph:v41 state:v7];

        if (v16
          || ([v41 addGenericTextFieldWithGuid:v23 type:v22],
              (v16 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v7, "OAXMainNamespace", v40);
          v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = OCXFindChild(v15, v31, "rPr");

          v33 = [v16 properties];
          +[OAXTextCharPropertyBag readCharacterProperties:v32 characterProperties:v33 drawingState:v7];

          v34 = [v7 OAXMainNamespace];
          uint64_t v35 = OCXFindChild(v15, v34, "pPr");

          v36 = [v16 paragraphProperties];
          +[OAXTextParaPropertyBag readParagraphProperties:v35 paragraphProperties:v36 drawingState:v7];

          v37 = [v7 OAXMainNamespace];
          uint64_t v38 = OCXFindChild(v15, v37, "t");

          if (v38)
          {
            v39 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v38);
            [v16 setText:v39];
            v13 = &OBJC_METACLASS___OAXParagraph;
          }
          else
          {
            v13 = &OBJC_METACLASS___OAXParagraph;
          }
        }
      }

LABEL_10:
LABEL_13:

      goto LABEL_14;
    }
    if (xmlStrEqual(v15->name, (const xmlChar *)"m")) {
      [MEMORY[0x263EFF940] raise:v40 format:@"Cannot read math content"];
    }
LABEL_14:
    v15 = OCXNextSibling(v15);
  }
}

@end