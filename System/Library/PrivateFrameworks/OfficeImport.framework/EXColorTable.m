@interface EXColorTable
+ (void)readColorsFrom:(_xmlNode *)a3 toEDColors:(id)a4 state:(id)a5;
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readOADThemeFrom:(id)a3 toEDThemeColors:(id)a4;
@end

@implementation EXColorTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v18 = a4;
  v6 = [v18 resources];
  v7 = [v6 colors];

  if (a3
    && ([v18 EXSpreadsheetMLNamespace],
        v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = OCXFindChild(a3, v8, "indexedColors"),
        v8,
        v9))
  {
    v10 = [[EDColorsCollection alloc] initWithDefaultSetup:0];

    [a1 readColorsFrom:v9 toEDColors:v10 state:v18];
    v11 = [v18 resources];
    [v11 setColors:v10];

    v7 = v10;
  }
  else
  {
    [v7 addPalette:0 paletteSize:0 paletteX:0 paletteXSize:0];
  }
  v12 = [v18 resources];
  v13 = [v12 themes];

  if (a3
    && ([v18 EXSpreadsheetMLNamespace],
        v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = OCXFindChild(a3, v14, "themeColors"),
        v14,
        v15))
  {
    [a1 readColorsFrom:v15 toEDColors:v13 state:v18];
  }
  else
  {
    v16 = [v18 workbook];
    v17 = [v16 theme];
    [a1 readOADThemeFrom:v17 toEDThemeColors:v13];
  }
}

+ (void)readOADThemeFrom:(id)a3 toEDThemeColors:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (v11)
  {
    v6 = [v11 baseStyles];
    v7 = [v6 colorScheme];

    for (uint64_t i = 0; [v7 colorCount] > (unint64_t)i; uint64_t i = (i + 1))
    {
      uint64_t v9 = objc_msgSend(v7, "colorForIndex:", +[EDColorsCollection oadSchemeColorIdFromThemeIndex:](EDColorsCollection, "oadSchemeColorIdFromThemeIndex:", i));
      if (v9)
      {
        v10 = +[OADColor tsuColorWithColor:v9 colorMap:0 colorScheme:v7 colorPalette:0];
        [v5 addObject:v10];
      }
    }
  }
}

+ (void)readColorsFrom:(_xmlNode *)a3 toEDColors:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (a3)
  {
    v10 = [v8 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "rgbColor");

    while (Child)
    {
      id v17 = 0;
      uint64_t v18 = 0;
      BOOL v12 = CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"rgb", &v17);
      id v13 = v17;
      if (v12)
      {
        v14 = [MEMORY[0x263F08B08] scannerWithString:v13];
        [v14 scanHexInt:&v18];
        uint64_t v15 = +[OITSUColor colorWithRGBValue:v18];
        [v7 addObject:v15];
      }
      v16 = [v9 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v16, (xmlChar *)"rgbColor");
    }
  }
}

@end