@interface CHBReaderState
- (CHBReaderState)initWithEBReaderSheetState:(id)a3;
- (OADColorScheme)colorScheme;
- (const)defaultFormatForXlSeries:(const void *)a3;
- (const)xlCurrentDefaultSeriesFormat;
- (id)autoStyling;
- (id)ebReaderSheetState;
- (id)resources;
- (id)workbook;
- (int)axisGroup;
- (int)xlCurrentPlotIndex;
- (int)xlPlotCount;
- (void)readAndCacheXlChartDataSeries;
- (void)setAxisGroup:(int)a3;
- (void)setChart:(id)a3;
- (void)setXlCurrentPlot:(void *)a3;
- (void)setXlCurrentPlotIndex:(int)a3;
- (void)xlCurrentPlot;
- (void)xlReader;
@end

@implementation CHBReaderState

- (CHBReaderState)initWithEBReaderSheetState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHBReaderState;
  v6 = [(CHBState *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mEBReaderSheetState, a3);
    v7->mXlReader = (void *)[v5 xlReader];
    v7->mXlCurrentPlot = 0;
  }

  return v7;
}

- (void)xlReader
{
  return self->mXlReader;
}

- (id)ebReaderSheetState
{
  return self->mEBReaderSheetState;
}

- (void)readAndCacheXlChartDataSeries
{
  if (self->mXlReader)
  {
    [(CHBState *)self deleteXlChartDataSeriesCollection];
    self->super.mXlChartDataSeriesCollection = CFArrayCreateMutable(0, 0, 0);
    int SeriesCount = XlChartBinaryReader::getSeriesCount((XlChartBinaryReader *)self->mXlReader);
    self->super.mXlint SeriesCount = SeriesCount;
    if (SeriesCount)
    {
      int v4 = 0;
      do
      {
        value = 0;
        (*(void (**)(void *, void, void **, uint64_t))(*(void *)self->mXlReader + 736))(self->mXlReader, (unsigned __int16)v4, &value, 1);
        CFArrayAppendValue(self->super.mXlChartDataSeriesCollection, value);
        ++v4;
      }
      while (v4 < self->super.mXlSeriesCount);
    }
  }
}

- (id)resources
{
  return [self->mEBReaderSheetState resources];
}

- (void)setAxisGroup:(int)a3
{
  self->mAxisGroup = a3;
}

- (int)axisGroup
{
  return self->mAxisGroup;
}

- (id)workbook
{
  return [self->mEBReaderSheetState workbook];
}

- (int)xlPlotCount
{
  return XlChartBinaryReader::getPlotCount((uint64_t)self->mXlReader, self->mAxisGroup);
}

- (void)setXlCurrentPlotIndex:(int)a3
{
  self->mXlCurrentPlotIndex = a3;
}

- (void)setXlCurrentPlot:(void *)a3
{
  self->mXlCurrentPlot = a3;
}

- (void)xlCurrentPlot
{
  return self->mXlCurrentPlot;
}

- (int)xlCurrentPlotIndex
{
  return self->mXlCurrentPlotIndex;
}

- (const)xlCurrentDefaultSeriesFormat
{
  v3 = [(CHBState *)self xlChartDataSeriesAtIndex:self->super.mXlCurrentSeriesIndex];
  return [(CHBReaderState *)self defaultFormatForXlSeries:v3];
}

- (const)defaultFormatForXlSeries:(const void *)a3
{
  if (!a3) {
    return 0;
  }
  if (((*((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 6)) & 0x7FFF8) == 0) {
    return 0;
  }
  result = (const XlChartSeriesFormat *)XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a3, 0);
  if (result)
  {
    if (result->var9 >= 0) {
      return 0;
    }
  }
  return result;
}

- (OADColorScheme)colorScheme
{
  v2 = [self->mEBReaderSheetState workbook];
  v3 = [v2 theme];
  int v4 = [v3 baseStyles];
  id v5 = [v4 colorScheme];

  return (OADColorScheme *)v5;
}

- (void)setChart:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHBReaderState;
  [(CHBState *)&v7 setChart:v4];
  id v5 = +[CHAutoStyling autoStylingWithChart:v4 drawingTheme:0];
  mAutoStyling = self->mAutoStyling;
  self->mAutoStyling = v5;
}

- (id)autoStyling
{
  return self->mAutoStyling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAutoStyling, 0);
  objc_storeStrong((id *)&self->mEBReaderSheetState, 0);
}

@end