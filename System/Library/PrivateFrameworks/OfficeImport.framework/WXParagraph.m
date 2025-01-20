@interface WXParagraph
+ (void)readAnnotationFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6;
+ (void)readFrom:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)readFromString:(id)a3 to:(id)a4;
+ (void)readRFrom:(_xmlNode *)a3 to:(id)a4 targetRun:(id)a5 state:(id)a6;
+ (void)readRunsFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 targetRun:(id)a6 state:(id)a7;
+ (void)readRunsTo:(id)a3 state:(id)a4;
+ (void)readSimpleFieldFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6;
+ (void)readTrackingFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6;
@end

@implementation WXParagraph

+ (void)readFrom:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!a3) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int v33 = 0;
    if (CXOptionalUnsignedAttributeFromHex8X(a3, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"paraId", &v33))
    {
      v12 = [NSNumber numberWithUnsignedInt:v33];
      BOOL v13 = +[OCXSTValidator isValidValue:v12 simpleType:10];

      if (v13)
      {
        v14 = [NSNumber numberWithUnsignedInt:v33];
        objc_msgSend(v10, "setIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));
      }
    }
  }
  v15 = [v11 WXMainNamespace];
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "pPr");

  if (v16)
  {
    v17 = [v10 properties];
    v18 = v17;
    if (v9)
    {
      [v17 setBaseStyle:v9];
    }
    else
    {
      v19 = [v10 document];
      v20 = [v19 styleSheet];
      v21 = [v20 defaultParagraphStyle];
      [v18 setBaseStyle:v21];
    }
    +[WXParagraphProperties readFrom:v16 to:v18 readBaseStyle:1 state:v11];
  }
  else if (v9)
  {
    v18 = [v10 properties];
    [v18 setBaseStyle:v9];
  }
  else
  {
    v27 = [v10 document];
    v28 = [v27 styleSheet];
    v29 = [v28 defaultParagraphStyle];

    if (!v29) {
      goto LABEL_14;
    }
    v18 = [v10 properties];
    v30 = [v10 document];
    v31 = [v30 styleSheet];
    v32 = [v31 defaultParagraphStyle];
    [v18 setBaseStyle:v32];
  }
LABEL_14:
  +[WXParagraph readRunsTo:v10 state:v11];
  +[WXParagraph readRunsFrom:a3 paragraphNamespace:a3->ns to:v10 targetRun:0 state:v11];
  uint64_t v22 = [v10 runCount];
  if (v16)
  {
    if (!v22)
    {
      v23 = [v11 WXMainNamespace];
      uint64_t v24 = OCXFindChild(v16, v23, "rPr");

      if (v24)
      {
        v25 = [v10 addCharacterRun];
        v26 = [v25 properties];
        +[WXCharacterProperties readFrom:v24 to:v26 state:v11];
      }
    }
  }
LABEL_18:
}

+ (void)readRunsTo:(id)a3 state:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  v6 = [v12 text];
  v7 = [v5 nodesToBeAdded:v6];

  v8 = 0;
  while (1)
  {
    id v9 = [v7 nextObject];

    if (!v9) {
      break;
    }
    uint64_t v10 = [v9 longValue];
    v8 = v9;
    if (xmlStrEqual(*(const xmlChar **)(v10 + 16), (const xmlChar *)"annotation"))
    {
      +[WXParagraph readAnnotationFrom:v10 paragraphNamespace:0 to:v12 state:v5];
      v8 = v9;
    }
  }
  id v11 = [v12 text];
  [v5 clearOutNodesToBeAdded:v11];
}

+ (void)readRunsFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 targetRun:(id)a6 state:(id)a7
{
  id v22 = a5;
  id v11 = a6;
  id v12 = a7;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (!sfaxmlNsEqual((uint64_t)i->ns, (uint64_t)a4))
    {
      v16 = [v12 drawingState];
      v17 = [v16 OAXMathNamespace];
      if ([v17 containsNode:i])
      {
        char v18 = [v12 readingMath];

        if ((v18 & 1) == 0)
        {
          [v12 setReadingMath:1];
          +[WXMath readMathRootFrom:i paragraphNamespace:a4 to:v22 targetRun:v11 state:v12];
          [v12 setReadingMath:0];
          continue;
        }
      }
      else
      {
      }
LABEL_14:
      +[WXParagraph readRunsFrom:i paragraphNamespace:a4 to:v22 targetRun:v11 state:v12];
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"smartTag")) {
      goto LABEL_14;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"bdo"))
    {
      v14 = [v12 WXMainNamespace];
      v15 = CXRequiredStringAttribute(i, v14, (xmlChar *)"dir");

      if (([v15 isEqualToString:@"rtl"] & 1) != 0
        || [v15 isEqualToString:@"ltr"])
      {
        +[WXParagraph readRunsFrom:i paragraphNamespace:a4 to:v22 targetRun:v11 state:v12];
      }
      goto LABEL_9;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"r"))
    {
      +[WXParagraph readRFrom:i to:v22 targetRun:v11 state:v12];
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"fldSimple"))
    {
      +[WXParagraph readSimpleFieldFrom:i paragraphNamespace:a4 to:v22 state:v12];
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"hyperlink"))
    {
      +[WXHyperlinkFieldMarker readFrom:i paragraphNamespace:a4 to:v22 state:v12];
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"commentRangeStart"))
    {
      uint64_t v19 = 0;
LABEL_28:
      +[WXAnnotation readFrom:i to:v22 type:v19 state:v12];
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"commentRangeEnd"))
    {
      uint64_t v19 = 1;
      goto LABEL_28;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"commentReference"))
    {
      uint64_t v19 = 2;
      goto LABEL_28;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"bookmarkStart") || xmlStrEqual(i->name, (const xmlChar *)"bookmarkEnd"))
    {
      v15 = [v22 addBookmark];
      +[WXBookmark readFrom:i to:v15 state:v12];
LABEL_9:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"ins") || xmlStrEqual(i->name, (const xmlChar *)"del"))
    {
      +[WXParagraph readTrackingFrom:i paragraphNamespace:a4 to:v22 state:v12];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"sdt"))
    {
      +[TCMessageContext reportWarning:WXFormsNotSupported];
      v20 = [v12 WXMainNamespace];
      uint64_t v21 = OCXFindChild(i, v20, "sdtContent");

      if (v21) {
        +[WXParagraph readRunsFrom:v21 paragraphNamespace:a4 to:v22 targetRun:v11 state:v12];
      }
    }
  }
}

+ (void)readRFrom:(_xmlNode *)a3 to:(id)a4 targetRun:(id)a5 state:(id)a6
{
  id v40 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [v10 WXMainNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "rPr");

  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"rPr")) {
      goto LABEL_4;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"t")
      || xmlStrEqual(i->name, (const xmlChar *)"tab")
      || xmlStrEqual(i->name, (const xmlChar *)"ptab")
      || xmlStrEqual(i->name, (const xmlChar *)"br")
      || xmlStrEqual(i->name, (const xmlChar *)"delText"))
    {
      if (v9)
      {
        id v15 = v9;
      }
      else
      {
        id v15 = [v40 addCharacterRun];
      }
      v16 = v15;
      +[WXCharacterRun readFrom:i to:v15];
      uint64_t v17 = [v16 properties];
    }
    else
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"commentReference"))
      {
        v14 = 0;
        +[WXAnnotation readFrom:i to:v40 type:2 state:v10];
        goto LABEL_5;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"footnoteReference")
        || xmlStrEqual(i->name, (const xmlChar *)"endnoteReference"))
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"footnoteReference")) {
          [v40 addFootnote];
        }
        else {
        v16 = [v40 addEndnote];
        }
        char v41 = 0;
        +[WXNote readFrom:i to:v16 skipNextSib:&v41 state:v10];
        char v18 = [v16 reference];
        v14 = [v18 properties];

        if (v41) {
          i = OCXNextSibling(i);
        }
        goto LABEL_16;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"footnoteRef") || xmlStrEqual(i->name, (const xmlChar *)"endnoteRef"))
      {
        uint64_t v19 = [v40 addSpecialCharacter];
        [(WDRubyRun *)v19 setCharacterType:2];
        if (v12) {
          goto LABEL_31;
        }
LABEL_49:

        goto LABEL_4;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"pict")
        || xmlStrEqual(i->name, (const xmlChar *)"drawing")
        || xmlStrEqual(i->name, (const xmlChar *)"object"))
      {
        p_super = [[WDOfficeArt alloc] initWithParagraph:v40];
        uint64_t v21 = [WDCharacterProperties alloc];
        id v22 = [v40 document];
        v20 = [(WDCharacterProperties *)v21 initWithDocument:v22];

        +[WXCharacterProperties applyDeletionInsertionProperties:v20 state:v10];
        if (v12) {
          +[WXCharacterProperties readFrom:v12 to:v20 state:v10];
        }
        [(WDRunWithCharacterProperties *)p_super setProperties:v20];
        +[WXOfficeArt readFrom:i parentRElement:a3 parentParagraph:v40 state:v10 to:p_super];
        if ([(WDOfficeArt *)p_super isDrawableOverridden])
        {
          v23 = [(WDOfficeArt *)p_super drawable];
          v37 = v20;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_41;
          }
          BOOL v24 = [(WDOfficeArt *)p_super isFloating];

          if (!v24)
          {
            v25 = [(WDOfficeArt *)[WDPicture alloc] initWithParagraph:v40];
            v23 = p_super;
            v26 = [(WDRunWithCharacterProperties *)p_super properties];
            [(WDRunWithCharacterProperties *)v25 setProperties:v26];

            v27 = [(WDOfficeArt *)p_super drawable];
            [(WDOfficeArt *)v25 setDrawable:v27];

            [(WDOfficeArt *)v25 setFloating:0];
            p_super = &v25->super;
LABEL_41:
          }
          p_super = p_super;
          v38 = [(WDOfficeArt *)p_super drawable];
          objc_opt_class();
          v28 = (WDOleObject *)p_super;
          if (objc_opt_isKindOfClass())
          {
            id v29 = v38;
            v30 = [v29 ole];

            v28 = (WDOleObject *)p_super;
            if (v30)
            {
              v28 = [(WDOfficeArt *)[WDOleObject alloc] initWithParagraph:v40];
              v31 = [(WDRunWithCharacterProperties *)p_super properties];
              [(WDRunWithCharacterProperties *)v28 setProperties:v31];

              v32 = [(WDOfficeArt *)p_super drawable];
              [(WDOfficeArt *)v28 setDrawable:v32];

              [(WDOfficeArt *)v28 setFloating:[(WDOfficeArt *)p_super isFloating]];
            }
          }
          [v40 addRun:v28];
          [(WDOfficeArt *)p_super propagateTextTypeToDrawables];

          v20 = v37;
LABEL_46:
        }
        uint64_t v19 = (WDRubyRun *)p_super;
LABEL_48:

        goto LABEL_49;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"contentPart"))
      {
        p_super = [v10 packagePart];
        v20 = [v10 OCXReadRequiredRelationshipForNode:i packagePart:p_super];
        unsigned int v33 = [(WDCharacterProperties *)v20 targetLocation];
        v28 = [v33 relativeString];

        +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", OAUnsupportedMediaType, v28);
        goto LABEL_46;
      }
      if (!xmlStrEqual(i->name, (const xmlChar *)"fldChar"))
      {
        if (!xmlStrEqual(i->name, (const xmlChar *)"instrText"))
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"annotation")) {
            goto LABEL_4;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"sym"))
          {
            uint64_t v19 = [v10 readSymbolTo];
            if (v19)
            {
              [v10 setReadSymbolTo:0];
              +[WXSymbol readFrom:i to:v19 state:v10];
              if (v12)
              {
                v35 = [(WDRunWithCharacterProperties *)v19 properties];
                +[WXCharacterProperties readFrom:v12 to:v35 state:v10];
              }
            }
            v20 = [v40 addSymbol];
            +[WXSymbol readFrom:i parentRElement:a3 to:v20 state:v10];
          }
          else
          {
            if (!xmlStrEqual(i->name, (const xmlChar *)"pgNum"))
            {
              if (xmlStrEqual(i->name, (const xmlChar *)"ruby"))
              {
                uint64_t v19 = [[WDRubyRun alloc] initWithParagraph:v40];
                +[WXRubyRun readFrom:i to:v19 state:v10];
                [v40 addRun:v19];
                goto LABEL_49;
              }
LABEL_4:
              v14 = 0;
              goto LABEL_5;
            }
            uint64_t v19 = [v40 addSpecialCharacter];
            [(WDRubyRun *)v19 setCharacterType:0];
            if (!v12) {
              goto LABEL_49;
            }
LABEL_31:
            v20 = [(WDRunWithCharacterProperties *)v19 properties];
            +[WXCharacterProperties readFrom:v12 to:v20 state:v10];
          }
          goto LABEL_48;
        }
        if (v9)
        {
          id v34 = v9;
        }
        else
        {
          id v34 = [v40 addCharacterRun];
        }
        v16 = v34;
        v14 = [v34 properties];
        v36 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", i);
        [v16 setString:v36];

        goto LABEL_16;
      }
      v16 = [v40 addFieldMarker];
      +[WXFieldMarker readFrom:i to:v16];
      uint64_t v17 = [v16 properties];
    }
    v14 = (void *)v17;
LABEL_16:

    if (v14)
    {
      +[WXCharacterProperties applyDeletionInsertionProperties:v14 state:v10];
      if (v12) {
        +[WXCharacterProperties readFrom:v12 to:v14 state:v10];
      }
    }
LABEL_5:
  }
}

+ (void)readFromString:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v5 = [a4 addCharacterRun];
  [v5 setString:v6];
}

+ (void)readSimpleFieldFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v16 = a5;
  id v9 = a6;
  id v10 = (id)[v16 addFieldMarker:19];
  id v11 = [v16 addCharacterRun];
  uint64_t v12 = [v9 WXMainNamespace];
  BOOL v13 = CXRequiredStringAttribute(a3, v12, (xmlChar *)"instr");
  [v11 setString:v13];

  id v14 = (id)[v16 addFieldMarker:20];
  +[WXParagraph readRunsFrom:a3 paragraphNamespace:a4 to:v16 targetRun:0 state:v9];
  id v15 = (id)[v16 addFieldMarker:21];
}

+ (void)readTrackingFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v12 = a5;
  id v9 = a6;
  id v10 = wmxmlGetAuthorProperty(a3);
  id v11 = wmxmlGetDateProperty(a3);
  if (xmlStrEqual(a3->name, (const xmlChar *)"ins"))
  {
    [v9 pushEditAuthor:v10 date:v11];
    +[WXParagraph readRunsFrom:a3 paragraphNamespace:a4 to:v12 targetRun:0 state:v9];
    [v9 popEditAuthorDate];
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"del"))
  {
    [v9 pushDeleteAuthor:v10 date:v11];
    +[WXParagraph readRunsFrom:a3 paragraphNamespace:a4 to:v12 targetRun:0 state:v9];
    [v9 popDeleteAuthorDate];
  }
}

+ (void)readAnnotationFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v13 = a5;
  id v8 = a6;
  id v9 = [v8 WXMainNamespace];
  id v10 = CXRequiredStringAttribute(a3, v9, (xmlChar *)"type");

  if ([v10 hasPrefix:@"wordBookmark"])
  {
    id v11 = [v13 addBookmark];
    +[WXBookmark readFrom:a3 to:v11 state:v8];

    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"wordCommentStart"])
  {
    uint64_t v12 = 0;
  }
  else
  {
    if (![v10 isEqualToString:@"wordCommentEnd"]) {
      goto LABEL_8;
    }
    uint64_t v12 = 1;
  }
  +[WXAnnotation readFrom:a3 to:v13 type:v12 state:v8];
LABEL_8:
}

@end