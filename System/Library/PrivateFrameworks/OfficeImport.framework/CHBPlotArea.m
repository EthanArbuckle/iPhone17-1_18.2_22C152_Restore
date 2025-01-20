@interface CHBPlotArea
+ (id)readWithState:(id)a3;
+ (void)readAxisGroup:(int)a3 to:(id)a4 state:(id)a5;
@end

@implementation CHBPlotArea

+ (id)readWithState:(id)a3
{
  id v4 = a3;
  v5 = [v4 chart];
  v6 = [v5 plotArea];

  XlChartFrameType::XlChartFrameType(&v11);
  v11.var0 = (void **)&unk_26EBDAE18;
  *(&v11.var16 + 1) = 0;
  uint64_t v7 = [v4 xlReader];
  (*(void (**)(uint64_t, XlChartFrameType *))(*(void *)v7 + 704))(v7, &v11);
  v8 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartFrameType:&v11 state:v4];
  v9 = [v4 autoStyling];
  [v9 resolvePlotAreaGraphicProperties:v8];

  [v6 setGraphicProperties:v8];
  [a1 readAxisGroup:0 to:v6 state:v4];
  [a1 readAxisGroup:1 to:v6 state:v4];

  XlChartFrameType::~XlChartFrameType(&v11);
  return v6;
}

+ (void)readAxisGroup:(int)a3 to:(id)a4 state:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  [v8 setAxisGroup:v6];
  v23 = [v7 axes];
  v9 = +[CHBAxis readWithXlPlotAxis:0 state:v8];
  [v23 addObject:v9];

  v10 = +[CHBAxis readWithXlPlotAxis:1 state:v8];
  [v23 addObject:v10];

  XlChartFrameType v11 = +[CHBAxis readWithXlPlotAxis:2 state:v8];
  [v23 addObject:v11];

  v12 = (XlChartBinaryReader *)[v8 xlReader];
  v13 = [v7 chartTypes];
  int v14 = [v8 xlPlotCount];
  if (v14 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      v28 = 0;
      (*(void (**)(XlChartBinaryReader *, uint64_t, uint64_t, void **))(*(void *)v12 + 712))(v12, v6, v15, &v28);
      v16 = v28;
      if (v28)
      {
        if (!v15)
        {
          if (XlChartBinaryReader::hasLegend(v12))
          {
            XlChartTextFrame::XlChartTextFrame((XlChartTextFrame *)v24);
            v24[0] = &unk_26EBDAE50;
            v24[27] = 0x100000004;
            int v25 = 0;
            int v26 = 16843009;
            char v27 = 1;
            uint64_t v17 = [v8 xlReader];
            (*(void (**)(uint64_t, void *))(*(void *)v17 + 768))(v17, v24);
            v18 = [v8 chart];
            v19 = +[CHBLegend readFrom:v24 state:v8];
            [v18 setLegend:v19];

            XlChartTextFrame::~XlChartTextFrame((XlChartTextFrame *)v24);
          }
          v20 = [v8 chart];
          v21 = +[CHBView3D readFrom:v28[1]];
          [v20 setView3D:v21];

          v16 = v28;
        }
        [v8 setXlCurrentPlotIndex:*(__int16 *)(v16[2] + 16)];
        [v8 setXlCurrentPlot:v28];
        v22 = +[CHBChartType readWithState:v8];
        [v13 addObject:v22];
        if ([v13 count] == 1 && objc_msgSend(v22, "isHorizontal")) {
          [v23 adjustAxesPositionForHorizontalChart];
        }
        [v8 setXlCurrentPlot:0];
        [v8 setXlCurrentPlotIndex:0xFFFFFFFFLL];
        if (v28) {
          (*(void (**)(void *))(*v28 + 8))(v28);
        }
      }
      uint64_t v15 = (v15 + 1);
    }
    while (v14 != v15);
  }
}

@end