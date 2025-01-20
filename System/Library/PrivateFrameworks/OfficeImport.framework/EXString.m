@interface EXString
+ (id)cleanupWhitespace:(id)a3;
+ (id)edStringWithRunsFromXmlDivElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edStringWithRunsFromXmlStringElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edTextFromXmlStringElement:(_xmlNode *)a3 state:(id)a4;
+ (id)readStringWithAsciiCodeFromXmlStringElement:(_xmlNode *)a3;
+ (id)stringInEDString:(id)a3 forRunIndex:(unsigned int)a4;
+ (id)stringInEDString:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5;
+ (void)buildEDString:(id)a3 fromChildrenOfNode:(_xmlNode *)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7;
+ (void)buildEDString:(id)a3 fromNode:(_xmlNode *)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7;
+ (void)buildEDString:(id)a3 fromText:(id)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7;
+ (void)parseStringWithAsciiCode:(id)a3;
@end

@implementation EXString

+ (id)readStringWithAsciiCodeFromXmlStringElement:(_xmlNode *)a3
{
  v3 = a3;
  if (a3)
  {
    v3 = (_xmlNode *)objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "tc_initWithContentOfXmlNode:", a3);
    if (!v3) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    [a1 parseStringWithAsciiCode:v3];
  }
  return v3;
}

+ (void)parseStringWithAsciiCode:(id)a3
{
  v24[1] = *(int16x4_t *)MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length] && objc_msgSend(v3, "rangeOfString:", @"_x") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789abcdefABCDEF"];
    uint64_t v4 = [v3 rangeOfString:@"_x"];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      while (1)
      {
        uint64_t v5 = objc_msgSend(v3, "rangeOfString:options:range:", @"_", 0, v4 + 2, objc_msgSend(v3, "length") - (v4 + 2));
        uint64_t v6 = v5;
        if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_28;
        }
        if (v5 == v4 + 6) {
          break;
        }
        uint64_t v4 = objc_msgSend(v3, "rangeOfString:options:range:", @"_x", 0, v5 + 1, objc_msgSend(v3, "length") - (v5 + 1));
LABEL_27:
        if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_28;
        }
      }
      v7 = objc_msgSend(v3, "substringWithRange:", v4 + 2, 4);
      v8 = &stru_26EBF24D8;
      if ([v3 length] >= (unint64_t)(v6 + 7))
      {
        objc_msgSend(v3, "substringWithRange:", v6 + 1, 6);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (![v7 caseInsensitiveCompare:@"005F"]
        && [(__CFString *)v8 hasPrefix:@"x"]
        && [(__CFString *)v8 hasSuffix:@"_"]
        && (-[__CFString substringWithRange:](v8, "substringWithRange:", 1, 4),
            v9 = objc_claimAutoreleasedReturnValue(),
            [v9 stringByTrimmingCharactersInSet:v22],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v10 isEqualToString:&stru_26EBF24D8],
            v10,
            v9,
            v11))
      {
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 6, &stru_26EBF24D8);
        uint64_t v12 = objc_msgSend(v3, "rangeOfString:options:range:", @"_x", 0, v4 + 7, objc_msgSend(v3, "length") - (v4 + 7));
      }
      else
      {
        v13 = [v7 stringByTrimmingCharactersInSet:v22];
        int v14 = [v13 isEqualToString:&stru_26EBF24D8];

        if (v14)
        {
          unint64_t v23 = 0;
          v15 = [MEMORY[0x263F08B08] scannerWithString:v7];
          [v15 scanHexInt:&v23];
          if (v23 >> 11 == 27)
          {
            unsigned __int16 v16 = 0;
          }
          else
          {
            for (uint64_t i = 0; i != 4; ++i)
              v24[0].i16[i] = [v7 characterAtIndex:i];
            int8x8_t v18 = (int8x8_t)vcgt_u16((uint16x4_t)0x1A001A001A001ALL, (uint16x4_t)vadd_s16(v24[0], (int16x4_t)0x40004000400040));
            int8x8_t v19 = vand_s8((int8x8_t)vcgt_u16((uint16x4_t)0x9000900090009, (uint16x4_t)vadd_s16(v24[0], (int16x4_t)0x39003900390039)), (int8x8_t)vcgt_u16((uint16x4_t)0x19001900190019, (uint16x4_t)vadd_s16(v24[0], (int16x4_t)0x5A005A005A005ALL)));
            uint16x4_t v20 = vshl_u16((uint16x4_t)vadd_s16((int16x4_t)vorr_s8((int8x8_t)(*(void *)&v19 & 0xFFA9FFA9FFA9FFA9), vbic_s8(vorr_s8((int8x8_t)(*(void *)&v18 & 0xFFC9FFC9FFC9FFC9), (int8x8_t)(*(void *)&vmvn_s8(v18) & 0xFFD0FFD0FFD0FFD0)), v19)), v24[0]), (uint16x4_t)0x40008000CLL);
            unsigned __int16 v16 = v20.i16[0] | v20.i16[2] | ((v20.i32[0] | v20.i32[1]) >> 16);
          }
          v21 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v16);
          objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 7, v21);
          if ([v3 length] <= (unint64_t)(v4 + 1)) {
            uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v4 = objc_msgSend(v3, "rangeOfString:options:range:", @"_x", 0, v4 + 1, objc_msgSend(v3, "length") - (v4 + 1));
          }

          goto LABEL_26;
        }
        uint64_t v12 = objc_msgSend(v3, "rangeOfString:options:range:", @"_x", 0, v6 + 1, objc_msgSend(v3, "length") - (v6 + 1));
      }
      uint64_t v4 = v12;
LABEL_26:

      goto LABEL_27;
    }
LABEL_28:
  }
}

+ (id)edStringWithRunsFromXmlStringElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(EDString);
  id v32 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7 = [v5 EXSpreadsheetMLNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v7, "r");

  if (!Child) {
    goto LABEL_29;
  }
  v30 = a3;
  v31 = v6;
  uint64_t v9 = 0;
  v10 = 0;
  do
  {
    objc_msgSend(v5, "EXSpreadsheetMLNamespace", v30);
    int v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (_xmlNode *)OCXFindChild(Child, v11, "rPr");

    if (v12)
    {
      if (!v10)
      {
        v10 = +[EDCollection collection];
      }
      v13 = [v5 EXSpreadsheetMLNamespace];
      int v14 = (void *)OCXFindChild(v12, v13, "effectLst");

      if (v14)
      {
        v15 = [v5 workbookPart];
        unsigned __int16 v16 = [v5 officeArtState];
        int v14 = +[OAXEffect readEffectsFromXmlNode:v14 packagePart:v15 drawingState:v16];
      }
      v17 = +[EXFont edFontFromXmlFontElement:v12 inConditionalFormat:0 returnDefaultIfEmpty:1 state:v5];
      int8x8_t v18 = [v5 resources];
      int8x8_t v19 = +[EDRun runWithCharIndex:v9 font:v17 effects:v14 resources:v18];

      [v10 addObject:v19];
    }
    uint16x4_t v20 = [v5 EXSpreadsheetMLNamespace];
    uint64_t v21 = OCXFindChild(Child, v20, "t");

    if (v21)
    {
      v22 = [a1 readStringWithAsciiCodeFromXmlStringElement:v21];
      unint64_t v23 = v22;
      if (v22)
      {
        uint64_t v24 = [v22 length];
        [v32 appendString:v23];
        v9 += v24;
      }
    }
    v25 = [v5 EXSpreadsheetMLNamespace];
    Child = OCXFindNextChild(Child, v25, (xmlChar *)"r");
  }
  while (Child);
  a3 = v30;
  uint64_t v6 = v31;
  if (v10)
  {
    [(EDString *)v31 setRuns:v10];
  }
  else
  {
LABEL_29:
    if (![v32 length])
    {
      v26 = [v5 EXSpreadsheetMLNamespace];
      uint64_t v27 = OCXFindChild(a3, v26, "t");

      if (v27)
      {
        v28 = [a1 readStringWithAsciiCodeFromXmlStringElement:v27];
        if (v28) {
          [v32 appendString:v28];
        }
      }
    }
    v10 = 0;
  }
  if (v32) {
    [(EDString *)v6 setString:v32];
  }

  return v6;
}

+ (id)edTextFromXmlStringElement:(_xmlNode *)a3 state:(id)a4
{
  uint64_t v6 = [a4 EXSpreadsheetMLNamespace];
  uint64_t v7 = OCXFindChild(a3, v6, "t");

  if (v7
    && ([a1 readStringWithAsciiCodeFromXmlStringElement:v7],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = (void *)v8;
    v10 = +[EDString edStringWithString:v8];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)edStringWithRunsFromXmlDivElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v7 = +[EDString string];
    [a1 buildEDString:v7 fromNode:a3 edFont:0 keepWhitespace:0 state:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)buildEDString:(id)a3 fromChildrenOfNode:(_xmlNode *)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7
{
  BOOL v8 = a6;
  id v19 = a3;
  id v12 = a5;
  id v13 = a7;
  for (uint64_t i = OCXFirstChild(a4); i; uint64_t i = OCXNextSibling(i))
  {
    int v15 = xmlStrEqual(i->name, (const xmlChar *)"br");
    xmlElementType type = i->type;
    if (type == XML_ELEMENT_NODE && v15 == 0)
    {
      [a1 buildEDString:v19 fromNode:i edFont:v12 keepWhitespace:v8 state:v13];
    }
    else if (type == XML_TEXT_NODE)
    {
      int8x8_t v18 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", i);
      [a1 buildEDString:v19 fromText:v18 edFont:v12 keepWhitespace:v8 state:v13];
    }
    else if (v15)
    {
      [a1 buildEDString:v19 fromText:@"\n" edFont:v12 keepWhitespace:1 state:v13];
    }
  }
}

+ (void)buildEDString:(id)a3 fromNode:(_xmlNode *)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7
{
  BOOL v30 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  if (a4)
  {
    int v14 = (EDFont *)[v12 copy];
    if (!v14)
    {
      int v15 = [EDFont alloc];
      unsigned __int16 v16 = [v13 resources];
      int v14 = [(EDFont *)v15 initWithResources:v16];
    }
    if (xmlStrEqual(a4->name, (const xmlChar *)"font"))
    {
      id v28 = a1;
      id v34 = 0;
      id v29 = v11;
      BOOL v17 = CXOptionalStringAttribute(a4, (void *)CXNoNamespace, (xmlChar *)"face", &v34);
      int8x8_t v18 = (NSString *)v34;
      if (v17) {
        [(EDFont *)v14 setName:v18];
      }
      uint64_t v33 = 0;
      if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"size", &v33)) {
        [(EDFont *)v14 setHeight:(double)v33];
      }
      id v32 = 0;
      BOOL v19 = CXOptionalStringAttribute(a4, (void *)CXNoNamespace, (xmlChar *)"color", &v32);
      id v20 = v32;
      uint64_t v21 = v20;
      if (v19)
      {
        if ([v20 isEqualToString:@"auto"])
        {
          v22 = [v13 resources];
          +[EDColorReference colorReferenceWithSystemColorID:11 resources:v22];
        }
        else
        {
          int v25 = [v21 intValue];
          v22 = [v13 resources];
          +[EDColorReference colorReferenceWithColorIndex:v25 resources:v22];
        v26 = };

        [(EDFont *)v14 setColorReference:v26];
      }
    }
    else
    {
      if (!xmlStrEqual(a4->name, (const xmlChar *)"span"))
      {
        if (xmlStrEqual(a4->name, (const xmlChar *)"b"))
        {
          [(EDFont *)v14 setBold:1];
        }
        else if (xmlStrEqual(a4->name, (const xmlChar *)"i"))
        {
          [(EDFont *)v14 setItalic:1];
        }
        else if (xmlStrEqual(a4->name, (const xmlChar *)"u"))
        {
          [(EDFont *)v14 setUnderline:1];
        }
        else
        {
          if (!xmlStrEqual(a4->name, (const xmlChar *)"s"))
          {
            if (xmlStrEqual(a4->name, (const xmlChar *)"sup"))
            {
              uint64_t v27 = 1;
            }
            else
            {
              if (!xmlStrEqual(a4->name, (const xmlChar *)"sub")) {
                goto LABEL_19;
              }
              uint64_t v27 = 2;
            }
            [(EDFont *)v14 setScript:v27];
            goto LABEL_19;
          }
          [(EDFont *)v14 setStrike:1];
        }
LABEL_19:
        [a1 buildEDString:v11 fromChildrenOfNode:a4 edFont:v14 keepWhitespace:v30 state:v13];

        goto LABEL_20;
      }
      id v28 = a1;
      id v29 = v11;
      v31 = &stru_26EBF24D8;
      CXOptionalStringAttribute(a4, (void *)CXNoNamespace, (xmlChar *)"style", &v31);
      int8x8_t v18 = v31;
      uint64_t v21 = OAVReadComposite(v18);
      unint64_t v23 = [v21 objectForKey:@"mso-spacerun"];
      uint64_t v24 = v23;
      if (v23) {
        BOOL v30 = [v23 caseInsensitiveCompare:@"yes"] == 0;
      }
    }
    a1 = v28;
    id v11 = v29;
    goto LABEL_19;
  }
LABEL_20:
}

+ (void)buildEDString:(id)a3 fromText:(id)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7
{
  id v25 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!a6)
  {
    uint64_t v15 = [a1 cleanupWhitespace:v12];

    id v12 = (id)v15;
  }
  if (v12 && [v12 length])
  {
    unsigned __int16 v16 = [v25 string];
    uint64_t v17 = [v16 length];
    int8x8_t v18 = [v14 resources];
    BOOL v19 = +[EDRun runWithCharIndex:v17 font:v13 resources:v18];

    id v20 = [v25 runs];
    if ([v20 count])
    {
      uint64_t v21 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v20, "count") - 1);
      v22 = v21;
      if (v21)
      {
        uint64_t v23 = [v21 fontIndex];
        if (v23 == [v19 fontIndex])
        {
LABEL_13:
          if (v16)
          {
            uint64_t v24 = [v16 stringByAppendingString:v12];
          }
          else
          {
            uint64_t v24 = v12;
          }
          [v25 setString:v24];
          if (v16) {

          }
          goto LABEL_19;
        }
      }
      if (!v20) {
        goto LABEL_11;
      }
    }
    else
    {
      v22 = 0;
      if (!v20)
      {
LABEL_11:
        id v20 = +[EDCollection collection];
        [v25 setRuns:v20];
      }
    }
    [v20 addObject:v19];
    goto LABEL_13;
  }
LABEL_19:
}

+ (id)stringInEDString:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  uint64_t v7 = [a3 string];
  BOOL v8 = objc_msgSend(v7, "substringWithRange:", a4, a5 - a4);

  return v8;
}

+ (id)stringInEDString:(id)a3 forRunIndex:(unsigned int)a4
{
  uint64_t v4 = *(void **)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 runs];
  unint64_t v8 = [v7 count];
  uint64_t v9 = v4;

  if (v8 <= v4)
  {
    uint64_t v17 = 0;
  }
  else
  {
    v10 = [v6 runs];
    id v11 = [v10 objectAtIndex:v4];

    uint64_t v12 = [v11 charIndex];
    id v13 = [v6 runs];
    uint64_t v14 = [v13 count] - 1;
    if (v14 == v4)
    {
      uint64_t v15 = [v6 string];
      uint64_t v16 = [v15 length];
    }
    else
    {
      uint64_t v15 = [v6 runs];
      uint64_t v4 = [v15 objectAtIndex:(v4 + 1)];
      uint64_t v16 = [v4 charIndex];
    }
    uint64_t v17 = [a1 stringInEDString:v6 start:v12 end:v16];
    if (v14 != v9) {
  }
    }
  return v17;
}

+ (id)cleanupWhitespace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "tc_componentsSeparatedByWhitespace");
  id v5 = 0;
  uint64_t v6 = [v4 count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      unint64_t v8 = [v4 objectAtIndex:i];
      uint64_t v9 = v8;
      if (v8 && [v8 length])
      {
        if (v5)
        {
          v10 = [v5 stringByAppendingString:@" "];
          uint64_t v11 = [v10 stringByAppendingString:v9];

          id v5 = (id)v11;
        }
        else
        {
          id v5 = v9;
        }
      }
    }
  }

  return v5;
}

@end