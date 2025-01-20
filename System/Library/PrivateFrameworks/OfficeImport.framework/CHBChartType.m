@interface CHBChartType
+ (Class)chdChartTypeClassWithPlot:(void *)a3;
+ (id)readWithState:(id)a3;
@end

@implementation CHBChartType

+ (id)readWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 xlCurrentPlot];
  if (!v4
    || (v5 = +[CHBChartType chdChartTypeClassWithPlot:v4]) == 0)
  {
    v6 = 0;
    goto LABEL_31;
  }
  v6 = [(objc_class *)v5 chdChartTypeWithState:v3];
  v7 = *(XlChartChartFormat **)(v4 + 16);
  if (v7) {
    [v6 setVaryColors:XlChartChartFormat::isVaried(v7)];
  }
  v8 = [v6 axisIds];
  int v9 = *(_DWORD *)(v4 + 136);
  if (XlChartBinaryReader::hasAxis([v3 xlReader], v9, 0))
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", 0, v3));
    [v8 addObject:v10];
  }
  if (XlChartBinaryReader::hasAxis([v3 xlReader], v9, 1))
  {
    v11 = objc_msgSend(NSNumber, "numberWithInt:", +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", 1, v3));
    [v8 addObject:v11];
  }
  if (XlChartBinaryReader::hasAxis([v3 xlReader], v9, 2))
  {
    v12 = objc_msgSend(NSNumber, "numberWithInt:", +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", 2, v3));
    [v8 addObject:v12];
  }
  for (uint64_t i = 0; (int)i < (int)[v3 xlSeriesCount]; uint64_t i = (i + 1))
  {
    v14 = (unsigned __int16 *)[v3 xlChartDataSeriesAtIndex:i];
    int v15 = v14[10];
    if ([v3 xlCurrentPlotIndex] == v15
      && !(*(unsigned int (**)(unsigned __int16 *))(*(void *)v14 + 16))(v14))
    {
      [v3 setXlCurrentSeriesIndex:i];
      v16 = +[CHBSeries readFrom:v14 state:v3];
      v17 = v16;
      if (v16)
      {
        if (([v16 isHidden] & 1) == 0)
        {
          [v17 setChartType:v6];
          v18 = [v6 seriesCollection];
          [v18 addObject:v17];
        }
      }
    }
  }
  for (uint64_t j = 0; (int)j < (int)[v3 xlSeriesCount]; uint64_t j = (j + 1))
  {
    v20 = (unsigned __int16 *)[v3 xlChartDataSeriesAtIndex:j];
    int v21 = v20[10];
    if ([v3 xlCurrentPlotIndex] != v21) {
      continue;
    }
    if ((*(unsigned int (**)(unsigned __int16 *))(*(void *)v20 + 16))(v20) == 1)
    {
      v22 = [v6 seriesCollection];
      +[CHBErrorBar readFrom:v20 toSeries:v22 state:v3];
    }
    else
    {
      if ((*(unsigned int (**)(unsigned __int16 *))(*(void *)v20 + 16))(v20) != 2) {
        continue;
      }
      v22 = [v6 seriesCollection];
      +[CHBTrendLine readFrom:v20 toSeries:v22 state:v3];
    }
  }
  v23 = +[CHBDataLabel chdDataLabelFromXlChartSeriesFormat:*(void *)(v4 + 24) state:v3];
  [v6 setDefaultDataLabel:v23];

LABEL_31:
  return v6;
}

+ (Class)chdChartTypeClassWithPlot:(void *)a3
{
  int v4 = (*(uint64_t (**)(void *, SEL))(*(void *)a3 + 16))(a3, a2);
  if (!*((void *)a3 + 1))
  {
    switch(v4)
    {
      case 5:
        XlChartChartFormat::isVaried((XlChartChartFormat *)((char *)a3 + 144));
        break;
      default:
        break;
    }
  }
  v5 = objc_opt_class();
  return (Class)v5;
}

@end