@interface WBList
+ (void)readFrom:(id)a3 list:(id)a4 override:(void *)a5;
+ (void)write:(id)a3 list:(id)a4 to:(void *)a5;
@end

@implementation WBList

+ (void)readFrom:(id)a3 list:(id)a4 override:(void *)a5
{
  id v14 = a3;
  id v7 = a4;
  unsigned int v8 = *((_DWORD *)a5 + 8) - *((_DWORD *)a5 + 6);
  int v9 = (v8 >> 3);
  if ((v8 >> 3))
  {
    int v10 = 0;
    do
    {
      uint64_t DefaultFormat = XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a5, v10);
      v12 = [v7 addLevelOverrideWithLevel:*(unsigned __int8 *)(DefaultFormat + 20)];
      v13 = [v14 targetDocument];
      +[WBListLevelOverride readFrom:v14 listLevelOverride:v12 formatOverride:DefaultFormat document:v13];

      ++v10;
    }
    while (v9 != v10);
  }
}

+ (void)write:(id)a3 list:(id)a4 to:(void *)a5
{
  id v11 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 levelOverrideCount];
  WrdListFormatOverride::setNumberOfLevelsOverridden((WrdListFormatOverride *)a5, v8);
  *((_DWORD *)a5 + 4) = [v7 listDefinitionId];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      int v10 = [v7 levelOverrideAt:i];
      +[WBListLevelOverride write:v11 listLevelOverride:v10 wrdFormatOverride:XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a5, i)];
    }
  }
}

@end