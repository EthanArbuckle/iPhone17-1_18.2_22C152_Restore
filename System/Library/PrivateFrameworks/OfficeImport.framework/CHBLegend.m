@interface CHBLegend
+ (id)readCHDLegendEntryFrom:(const void *)a3 state:(id)a4;
+ (id)readFrom:(void *)a3 state:(id)a4;
+ (int)chdLegendPositionEnumFromXlLegendPosition:(int)a3;
+ (int)xlLegendPositionEnumFromCHDLegendPosition:(int)a3;
@end

@implementation CHBLegend

+ (id)readFrom:(void *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = [CHDLegend alloc];
    v7 = [v5 resources];
    v8 = [(CHDLegend *)v6 initWithResources:v7];

    [(CHDLegend *)v8 setFontIndex:+[CHBString edFontIndexForXlChartTextFrame:a3 state:v5]];
    v9 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartTextFrame:a3 state:v5];
    v10 = [v5 autoStyling];
    [v10 resolveLegendGraphicProperties:v9];

    [(CHDLegend *)v8 setGraphicProperties:v9];
    [(CHDLegend *)v8 setLegendPosition:+[CHBLegend chdLegendPositionEnumFromXlLegendPosition:*((unsigned int *)a3 + 54)]];
    [(CHDLegend *)v8 setIsSingleColumnLegend:*((unsigned __int8 *)a3 + 232)];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)chdLegendPositionEnumFromXlLegendPosition:(int)a3
{
  if (a3 > 7) {
    return 3;
  }
  else {
    return dword_238EDEF18[a3];
  }
}

+ (id)readCHDLegendEntryFrom:(const void *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = [CHDLegendEntry alloc];
    v7 = [v5 resources];
    v8 = [(CHDLegendEntry *)v6 initWithResources:v7];

    [(CHDLegendEntry *)v8 setFontIndex:+[CHBString edFontIndexForXlChartTextFrame:a3 state:v5]];
    [(CHDLegendEntry *)v8 setEntryIndex:*((unsigned __int16 *)a3 + 108)];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)xlLegendPositionEnumFromCHDLegendPosition:(int)a3
{
  if (a3 > 5) {
    return 3;
  }
  else {
    return dword_238EDEF38[a3];
  }
}

@end