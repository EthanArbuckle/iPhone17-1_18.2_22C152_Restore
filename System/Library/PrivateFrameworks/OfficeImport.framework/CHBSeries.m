@interface CHBSeries
+ (Class)chdSeriesClassWithState:(id)a3;
+ (id)chdSeriesWithState:(id)a3;
+ (id)readFrom:(void *)a3 state:(id)a4;
+ (void)readXlChartSeriesFormat:(void *)a3 chdSeries:(id)a4 state:(id)a5;
+ (void)resolveSeriesStyle:(id)a3 state:(id)a4;
@end

@implementation CHBSeries

+ (id)readFrom:(void *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3
    && (Class v6 = +[CHBSeries chdSeriesClassWithState:v5]) != 0)
  {
    v40 = [(objc_class *)v6 chdSeriesWithState:v5];
    [v40 setOrder:*((unsigned __int16 *)a3 + 8)];
    v38 = +[CHBData readFrom:*((void *)a3 + 18) state:v5];
    v7 = [v38 formula];
    [v40 setName:v7];

    v37 = [v38 dataValues];
    if ([v37 count])
    {
      v8 = [v37 dataValueAtIndex:0];
      [v40 setLastCachedName:v8];
    }
    v9 = +[CHBData readFrom:*((void *)a3 + 19) state:v5];
    [v40 setValueData:v9];

    v10 = +[CHBData readFrom:*((void *)a3 + 20) state:v5];
    [v40 setCategoryData:v10];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = +[CHBData readFrom:*((void *)a3 + 21) state:v5];
      [v40 setSizeData:v11];
    }
    v12 = [v40 dataValuePropertiesCollection];
    unsigned int v13 = *((_DWORD *)a3 + 14) - *((_DWORD *)a3 + 12);
    int v14 = (unsigned __int16)(v13 >> 3);
    if ((unsigned __int16)(v13 >> 3))
    {
      int v15 = 0;
      do
      {
        uint64_t CachedCustomFormat = XlChartDataSeries::getCachedCustomFormat((XlChartDataSeries *)a3, (unsigned __int16)v15);
        if (CachedCustomFormat)
        {
          v17 = +[CHBDataValueProperties readFrom:CachedCustomFormat state:v5];
          [v12 addObject:v17];
        }
        ++v15;
      }
      while (v14 != v15);
    }
    unsigned int v18 = *((_DWORD *)a3 + 20) - *((_DWORD *)a3 + 18);
    int v19 = (unsigned __int16)(v18 >> 3);
    if ((unsigned __int16)(v18 >> 3))
    {
      int v20 = 0;
      do
      {
        uint64_t CachedCustomLabel = XlChartDataSeries::getCachedCustomLabel((XlChartDataSeries *)a3, (unsigned __int16)v20);
        if (CachedCustomLabel)
        {
          uint64_t v22 = *(unsigned int *)(CachedCustomLabel + 216);
          v23 = +[CHBDataLabel chdDataLabelFromXlChartCustomLabelText:state:](CHBDataLabel, "chdDataLabelFromXlChartCustomLabelText:state:");
          if (v22 == 0xFFFF)
          {
            [v40 setDefaultDataLabel:v23];
          }
          else
          {
            v24 = [v12 objectWithKey:v22];
            if (!v24)
            {
              uint64_t DefaultFormat = *(void *)([v5 xlCurrentPlot] + 24);
              if (!DefaultFormat
                && (((*((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 6)) & 0x7FFF8) == 0
                 || (uint64_t DefaultFormat = XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a3, 0)) == 0)
                || (+[CHBDataValueProperties chdDataValuePropertiesFrom:DefaultFormat state:v5], (v24 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                v24 = +[CHBDataValueProperties chdDataValuePropertiesFromState:v5];
              }
              [v24 setDataValueIndex:v22];
              [v12 addObject:v24];
            }
            [v24 setDataLabel:v23];
          }
        }
        ++v20;
      }
      while (v19 != v20);
    }
    [a1 readXlChartSeriesFormat:a3 chdSeries:v40 state:v5];
    [a1 resolveSeriesStyle:v40 state:v5];
    v26 = [v5 chart];
    v27 = [v26 legend];
    v28 = [v27 legendEntries];

    uint64_t v30 = *((void *)a3 + 22);
    uint64_t v29 = *((void *)a3 + 23);
    if (((v29 - v30) & 0x7FFF8) != 0)
    {
      unint64_t v31 = 0;
      do
      {
        uint64_t v32 = *(void *)(v30 + 8 * v31);
        if (v32)
        {
          v33 = +[CHBLegend readCHDLegendEntryFrom:v32 state:v5];
          [v28 addObject:v33];

          uint64_t v30 = *((void *)a3 + 22);
          uint64_t v29 = *((void *)a3 + 23);
        }
        ++v31;
      }
      while (v31 < (unsigned __int16)((v29 - v30) >> 3));
    }
    uint64_t v34 = *((void *)a3 + 1);
    if (v34 && !*(_WORD *)(v34 + 18)) {
      [v40 setHiddenFlag:1];
    }

    v35 = v40;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (Class)chdSeriesClassWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 xlCurrentPlot];
  switch((*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4))
  {
    case 5u:
      XlChartChartFormat::isVaried((XlChartChartFormat *)(v4 + 144));
      break;
    default:
      break;
  }
  id v5 = objc_opt_class();

  return (Class)v5;
}

+ (id)chdSeriesWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [CHDSeries alloc];
  id v5 = [v3 chart];
  Class v6 = [(CHDSeries *)v4 initWithChart:v5];

  return v6;
}

+ (void)readXlChartSeriesFormat:(void *)a3 chdSeries:(id)a4 state:(id)a5
{
  id v13 = a4;
  id v6 = a5;
  uint64_t v7 = [v6 xlCurrentDefaultSeriesFormat];
  uint64_t v8 = v7;
  if (!v7 || (uint64_t v9 = v7, !*(void *)(v7 + 8))) {
    uint64_t v9 = *(void *)([v6 xlCurrentPlot] + 24);
  }
  if (v13 && v8)
  {
    [v13 setStyleIndex:*(unsigned __int16 *)(v8 + 70)];
    XlChartBinaryReader::setDefaultFormat((uint64_t *)[v6 xlReader], *(unsigned __int16 *)(v8 + 72), 0);
    v10 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:v9 state:v6];
    [v13 setGraphicProperties:v10];

    v11 = [v13 defaultDataLabel];
    if (v11)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (*(unsigned char *)(v8 + 83)
      || *(unsigned char *)(v8 + 84)
      || *(unsigned char *)(v8 + 86)
      || *(unsigned char *)(v8 + 80)
      || *(unsigned char *)(v8 + 85)
      || *(unsigned char *)(v8 + 87))
    {
      v12 = +[CHBDataLabel chdDataLabelFromXlChartSeriesFormat:v8 state:v6];
      v11 = v12;
      if (v12)
      {
        [v12 setGraphicProperties:0];
        [v13 setDefaultDataLabel:v11];
      }
      goto LABEL_15;
    }
  }
LABEL_16:
}

+ (void)resolveSeriesStyle:(id)a3 state:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  if ([v20 conformsToProtocol:&unk_26ECB7708])
  {
    id v6 = [v5 autoStyling];
    uint64_t v7 = [v20 marker];
    uint64_t v8 = [v20 graphicProperties];
    objc_msgSend(v6, "resolveMarker:withSeriesGraphicProperties:forSeriesIndex:clientGraphicPropertyDefaults:", v7, v8, objc_msgSend(v20, "styleIndex"), 0);

    uint64_t v9 = [v5 autoStyling];
    v10 = [v20 graphicProperties];
    objc_msgSend(v9, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", v10, objc_msgSend(v20, "styleIndex"), 1);
  }
  else
  {
    uint64_t v9 = [v5 autoStyling];
    v10 = [v20 graphicProperties];
    objc_msgSend(v9, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", v10, objc_msgSend(v20, "styleIndex"), 0);
  }

  v11 = [v20 dataValuePropertiesCollection];
  uint64_t v12 = [v11 count];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v12)
  {
    char v14 = isKindOfClass;
    for (uint64_t i = 0; i != v12; ++i)
    {
      v16 = [v11 objectAtIndex:i];
      v17 = [v16 graphicProperties];
      if (v17)
      {
        unsigned int v18 = [v5 autoStyling];
        if (v14) {
          uint64_t v19 = [v16 dataValueIndex];
        }
        else {
          uint64_t v19 = [v20 styleIndex];
        }
        [v18 resolveGraphicPropertiesOfSeries:v17 forSeriesIndex:v19];
      }
    }
  }
}

@end