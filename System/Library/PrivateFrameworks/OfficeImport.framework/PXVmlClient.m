@interface PXVmlClient
+ (id)colorWithRecolorInfoColorString:(id)a3;
+ (int)vmlSupportLevel;
+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5;
@end

@implementation PXVmlClient

+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5
{
  id v34 = a4;
  id v7 = a5;
  if (OCXFindChild(a3, (CXNamespace *)PXVmlNamespace, "iscomment"))
  {
    v8 = [v34 ensureClientDataOfClass:objc_opt_class()];
    [v8 setIsComment:1];
  }
  v9 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)PXVmlNamespace, "textdata");
  if (v9)
  {
    v10 = CXDefaultStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", 0);
    if (v10)
    {
      v35 = [v7 packagePart];
      v11 = [v35 package];
      v12 = [v35 relationshipForIdentifier:v10];
      v13 = [v12 targetLocation];
      v14 = [v11 partForLocation:v13];

      v15 = [v14 data];
      if (v15)
      {
        objc_opt_class();
        id v33 = v7;
        id v16 = v34;
        objc_opt_class();
        +[PXLegacyText readLegacyTextFromData:v15 toShape:v16 state:v33];

        id v7 = v33;
      }
      v17 = [v12 targetLocation];
      [v11 resetPartForLocation:v17];
    }
  }
  v18 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)CXNoNamespace, "recolorinfo");
  v19 = v18;
  if (v18 && CXDefaultBoolAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"recolorstate", 1))
  {
    uint64_t v20 = CXDefaultLongAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"numcolors", 0);
    if (v20 < 1) {
      v36 = 0;
    }
    else {
      v36 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v20];
    }
    uint64_t v21 = CXDefaultLongAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"numfills", 0);
    if (v21 < 1)
    {
      if (v20 < 1)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v21];
    }
    v31 = [v34 ensureClientDataOfClass:objc_opt_class()];
    v32 = (void *)v22;
    v30 = [[OADImageRecolorInfo alloc] initWithColors:v36 fills:v22];
    [v31 setImageRecolorInfo:v30];
    for (i = (_xmlNode *)OCXFindChild(v19, (CXNamespace *)CXNoNamespace, "recolorinfoentry");
          i;
          i = OCXFindNextChild(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"recolorinfoentry"))
    {
      v24 = CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"fromcolor", 0);
      v25 = +[PXVmlClient colorWithRecolorInfoColorString:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = +[OADColor tsuColorWithRgbColor:v25];
      }
      else
      {
        v26 = 0;
      }
      v27 = CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"tocolor", 0);
      uint64_t v28 = +[PXVmlClient colorWithRecolorInfoColorString:v27];
      v29 = (void *)v28;
      if (v26)
      {
        if (v28) {
          [v36 setObject:v28 forKey:v26];
        }
      }
    }
    goto LABEL_28;
  }
LABEL_29:
}

+ (int)vmlSupportLevel
{
  return 2;
}

+ (id)colorWithRecolorInfoColorString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "hasPrefix:", @"rgb(")
    && [v4 hasSuffix:@""]))
  {
    v5 = objc_msgSend(v4, "substringWithRange:", objc_msgSend(@"rgb("), "length", objc_msgSend(v4, "length") - (objc_msgSend(@"rgb("), "length" + objc_msgSend(@""), "length")));
    v6 = [v5 componentsSeparatedByString:@","];
    if ([v6 count] == 3)
    {
      id v7 = [v6 objectAtIndex:0];
      int v8 = [v7 intValue];

      v9 = [v6 objectAtIndex:1];
      LODWORD(v7) = [v9 intValue];

      v10 = [v6 objectAtIndex:2];
      int v11 = [v10 intValue];

      v12 = [OADRgbColor alloc];
      *(float *)&double v13 = (float)v8;
      *(float *)&double v14 = (float)(int)v7;
      *(float *)&double v15 = (float)v11;
      id v16 = [(OADRgbColor *)v12 initWithRedByte:v13 greenByte:v14 blueByte:v15];
    }
    else
    {
      id v16 = 0;
    }

    goto LABEL_12;
  }
  if (![v4 hasPrefix:@"scheme"]) {
    goto LABEL_11;
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_54, 0, &dword_238A75000);
  }
  v17 = (void *)+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap;
  if (!+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap)
  {
    v18 = [[TCEnumerationMap alloc] initWithStructs:&+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumStructs count:8 caseSensitive:1];
    v19 = (void *)+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap;
    +[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap = (uint64_t)v18;

    v17 = (void *)+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap;
  }
  uint64_t v20 = [v17 valueForString:v4];
  if (v20 != -130883970) {
    id v16 = [[OADSchemeColor alloc] initWithSchemeColorIndex:v20];
  }
  else {
LABEL_11:
  }
    id v16 = 0;
LABEL_12:

  return v16;
}

@end