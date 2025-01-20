@interface CHBDefaultTextProperties
+ (void)readWithState:(id)a3;
@end

@implementation CHBDefaultTextProperties

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  v4 = [v3 chart];
  v5 = (XlParserVisitor **)[v3 xlReader];
  v6 = [v4 defaultTextProperties];
  uint64_t v7 = 0;
  do
  {
    XlChartTextFrame::XlChartTextFrame((XlChartTextFrame *)v11);
    v11[0] = &unk_26EBDADE0;
    int v19 = v7;
    XlChartBinaryReader::read(v5, (XlChartTextFrame *)v11);
    v8 = [v3 resources];
    v9 = +[CHDDefaultTextProperty defaultTextPropertyWithResources:v8];

    v10 = +[CHBString edRunsFromXlChartTextFrame:v11 state:v3];
    [v9 setRuns:v10];

    [v9 setContentFormatId:v13];
    [v9 setDefaultTextType:v7];
    [v9 setLabelPosition:v12];
    [v9 setIsShowCategoryLabel:v15];
    [v9 setIsShowValueLabel:v14];
    [v9 setIsShowPercentageLabel:v17];
    [v9 setIsShowBubbleSizeLabel:v18];
    [v9 setIsShowSeriesLabel:v16];
    [v6 addObject:v9];

    XlChartTextFrame::~XlChartTextFrame((XlChartTextFrame *)v11);
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 4);
}

@end