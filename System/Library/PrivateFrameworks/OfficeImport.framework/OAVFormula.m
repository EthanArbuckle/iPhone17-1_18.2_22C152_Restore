@interface OAVFormula
+ (OADFormulaArg)readArgument:(id)a3;
+ (id)readFormula:(_xmlNode *)a3;
+ (void)readFormulasFromManager:(id)a3 toGeometry:(id)a4;
@end

@implementation OAVFormula

+ (void)readFormulasFromManager:(id)a3 toGeometry:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = (_xmlNode *)[v11 shape];
  v8 = (_xmlNode *)OCXFindChild(v7, (CXNamespace *)OAVOfficeMainNamespace, "formulas");
  if (v8)
  {
    for (i = (_xmlNode *)OCXFindChild(v8, (CXNamespace *)OAVOfficeMainNamespace, "f");
          i;
          i = OCXFindNextChild(i, (CXNamespace *)OAVOfficeMainNamespace, (xmlChar *)"f"))
    {
      v10 = [a1 readFormula:i];
      [v6 addFormula:v10];
    }
  }
}

+ (id)readFormula:(_xmlNode *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v4 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"eqn");
  if (!+[OAVFormula(Private) readFormula:]::typeMap)
  {
    v5 = NSDictionary;
    v31 = [NSNumber numberWithInt:0];
    id v6 = [NSNumber numberWithInt:0];
    uint64_t v7 = [NSNumber numberWithInt:1];
    v8 = [NSNumber numberWithInt:2];
    [NSNumber numberWithInt:3];
    v37 = v36 = (void *)v7;
    v35 = [NSNumber numberWithInt:4];
    v30 = [NSNumber numberWithInt:5];
    v34 = [NSNumber numberWithInt:6];
    v33 = [NSNumber numberWithInt:7];
    v29 = [NSNumber numberWithInt:8];
    v28 = [NSNumber numberWithInt:9];
    v27 = [NSNumber numberWithInt:10];
    v32 = [NSNumber numberWithInt:11];
    v26 = [NSNumber numberWithInt:12];
    v25 = [NSNumber numberWithInt:13];
    v24 = [NSNumber numberWithInt:14];
    v9 = [NSNumber numberWithInt:15];
    v23 = [NSNumber numberWithInt:16];
    objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v31, @"val", v6, @"sum", v36, @"prod", v8, @"mid", v37, @"abs", v35, @"min", v30, @"max", v34, @"if", v33,
      @"mod",
      v29,
      @"atan2",
      v28,
      @"sin",
      v27,
      @"cos",
      v32,
      @"cosatan2",
      v26,
      @"sinatan2",
      v25,
      @"sqrt",
      v24,
      @"sumangle",
      v9,
      @"ellipse",
      v23,
      @"tan",
    uint64_t v10 = 0);
    id v11 = (void *)+[OAVFormula(Private) readFormula:]::typeMap;
    +[OAVFormula(Private) readFormula:]::typeMap = v10;
  }
  v12 = [v4 componentsSeparatedByString:@" "];
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  v13 = (void *)+[OAVFormula(Private) readFormula:]::typeMap;
  v14 = [v12 objectAtIndex:0];
  v15 = [v13 objectForKey:v14];

  uint64_t v16 = [v15 intValue];
  uint64_t v17 = 0;
  do
  {
    uint64_t v18 = v17 + 1;
    if ([v12 count] <= (unint64_t)(v17 + 1)) {
      break;
    }
    v19 = [v12 objectAtIndex:v17 + 1];
    *(&v38 + v17) = [a1 readArgument:v19];

    ++v17;
  }
  while (v18 != 3);
  v20 = [OADFormula alloc];
  v21 = [(OADFormula *)v20 initWithType:v16 arg0:v38 arg1:v39 arg2:v40];

  return v21;
}

+ (OADFormulaArg)readArgument:(id)a3
{
  id v3 = a3;
  if (!+[OAVFormula(Private) readArgument:]::keywordMap)
  {
    v4 = NSDictionary;
    id v24 = v3;
    v23 = [NSNumber numberWithInt:320];
    v5 = [NSNumber numberWithInt:321];
    v27 = [NSNumber numberWithInt:322];
    v26 = [NSNumber numberWithInt:323];
    uint64_t v6 = [NSNumber numberWithInt:339];
    uint64_t v7 = [NSNumber numberWithInt:340];
    v8 = [NSNumber numberWithInt:1271];
    v9 = [NSNumber numberWithInt:1272];
    v22 = [NSNumber numberWithInt:1273];
    uint64_t v10 = (void *)v6;
    v25 = [NSNumber numberWithInt:1276];
    id v11 = v4;
    v12 = [NSNumber numberWithInt:1277];
    v13 = [NSNumber numberWithInt:1278];
    v14 = [NSNumber numberWithInt:1279];
    objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v23, @"xcenter", v5, @"ycenter", v27, @"width", v26, @"height", v10, @"xlimo", v7, @"ylimo", v8, @"pixellinewidth", v9, @"pixelwidth", v22,
      @"pixelheight",
      v25,
      @"emuwidth",
      v12,
      @"emuheight",
      v13,
      @"emuwidth2",
      v14,
      @"emuheight2",
    uint64_t v15 = 0);
    uint64_t v16 = (void *)+[OAVFormula(Private) readArgument:]::keywordMap;
    +[OAVFormula(Private) readArgument:]::keywordMap = v15;

    id v3 = v24;
  }
  unsigned int v17 = [v3 characterAtIndex:0];
  if (v17 <= 0xFF && ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v17 + 60) >> 10) & 1) != 0 || v17 == 45)
  {
    uint64_t v19 = [v3 intValue];
    uint64_t v20 = 1;
  }
  else
  {
    if (v17 == 64)
    {
      uint64_t v18 = [v3 substringFromIndex:1];
      uint64_t v19 = [v18 intValue];
      uint64_t v20 = 3;
    }
    else if (v17 == 35)
    {
      uint64_t v18 = [v3 substringFromIndex:1];
      uint64_t v19 = [v18 intValue];
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v18 = [(id)+[OAVFormula(Private) readArgument:]::keywordMap objectForKey:v3];
      uint64_t v19 = [v18 intValue];
      uint64_t v20 = 4;
    }
  }
  return (OADFormulaArg)(v20 | (v19 << 32));
}

@end