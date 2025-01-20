@interface CHBState
- (BOOL)hasPrimaryMixedArea;
- (BOOL)hasPrimaryMixedColumn;
- (BOOL)hasPrimaryMixedLine;
- (BOOL)hasSecondaryMixedArea;
- (BOOL)hasSecondaryMixedColumn;
- (BOOL)hasSecondaryMixedLine;
- (BOOL)isMixedChart;
- (CHBState)init;
- (id)chart;
- (id)resources;
- (id)workbook;
- (int)xlCurrentChartDataSeriesIndex;
- (int)xlSeriesCount;
- (unsigned)chartGroupIndexForType:(int)a3 isForPrimary:(BOOL)a4;
- (void)dealloc;
- (void)deleteXlChartDataSeriesCollection;
- (void)setChart:(id)a3;
- (void)setHasPrimaryMixedArea:(BOOL)a3;
- (void)setHasPrimaryMixedColumn:(BOOL)a3;
- (void)setHasPrimaryMixedLine:(BOOL)a3;
- (void)setHasSecondaryMixedArea:(BOOL)a3;
- (void)setHasSecondaryMixedColumn:(BOOL)a3;
- (void)setHasSecondaryMixedLine:(BOOL)a3;
- (void)setXlCurrentSeriesIndex:(int)a3;
- (void)xlChartDataSeriesAtIndex:(int)a3;
- (void)xlCurrentChartDataSeries;
@end

@implementation CHBState

- (CHBState)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHBState;
  result = [(CHBState *)&v3 init];
  if (result)
  {
    result->mXlChartDataSeriesCollection = 0;
    *(void *)&result->mXlSeriesCount = 0;
    *(void *)((char *)&result->mXlCurrentSeriesIndex + 2) = 0;
  }
  return result;
}

- (void)setChart:(id)a3
{
  v5 = (CHDChart *)a3;
  mChart = self->mChart;
  p_mChart = &self->mChart;
  if (mChart != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mChart, a3);
    v5 = v8;
  }
}

- (id)chart
{
  return self->mChart;
}

- (void)deleteXlChartDataSeriesCollection
{
  mXlChartDataSeriesCollection = self->mXlChartDataSeriesCollection;
  if (mXlChartDataSeriesCollection)
  {
    CFIndex Count = CFArrayGetCount(mXlChartDataSeriesCollection);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->mXlChartDataSeriesCollection, i);
        if (ValueAtIndex) {
          (*(void (**)(const void *))(*(void *)ValueAtIndex + 8))(ValueAtIndex);
        }
      }
    }
    CFArrayRemoveAllValues(self->mXlChartDataSeriesCollection);
    CFRelease(self->mXlChartDataSeriesCollection);
    self->mXlChartDataSeriesCollection = 0;
  }
}

- (int)xlSeriesCount
{
  return self->mXlSeriesCount;
}

- (void)xlChartDataSeriesAtIndex:(int)a3
{
  if (self->mXlCurrentSeriesIndex < 0 || !CFArrayGetCount(self->mXlChartDataSeriesCollection)) {
    return 0;
  }
  mXlChartDataSeriesCollection = self->mXlChartDataSeriesCollection;
  return (void *)CFArrayGetValueAtIndex(mXlChartDataSeriesCollection, a3);
}

- (void)setXlCurrentSeriesIndex:(int)a3
{
  self->mXlCurrentSeriesIndex = a3;
}

- (void)dealloc
{
  [(CHBState *)self deleteXlChartDataSeriesCollection];
  v3.receiver = self;
  v3.super_class = (Class)CHBState;
  [(CHBState *)&v3 dealloc];
}

- (id)workbook
{
  return 0;
}

- (id)resources
{
  return 0;
}

- (void)xlCurrentChartDataSeries
{
  CFIndex mXlCurrentSeriesIndex = self->mXlCurrentSeriesIndex;
  if ((mXlCurrentSeriesIndex & 0x80000000) != 0) {
    return 0;
  }
  mXlChartDataSeriesCollection = self->mXlChartDataSeriesCollection;
  if (!mXlChartDataSeriesCollection) {
    return 0;
  }
  else {
    return (void *)CFArrayGetValueAtIndex(mXlChartDataSeriesCollection, mXlCurrentSeriesIndex);
  }
}

- (int)xlCurrentChartDataSeriesIndex
{
  return self->mXlCurrentSeriesIndex;
}

- (BOOL)hasPrimaryMixedArea
{
  return self->mHasPrimaryMixedArea;
}

- (void)setHasPrimaryMixedArea:(BOOL)a3
{
  self->mHasPrimaryMixedArea = a3;
}

- (BOOL)hasPrimaryMixedColumn
{
  return self->mHasPrimaryMixedColumn;
}

- (void)setHasPrimaryMixedColumn:(BOOL)a3
{
  self->mHasPrimaryMixedColumn = a3;
}

- (BOOL)hasPrimaryMixedLine
{
  return self->mHasPrimaryMixedLine;
}

- (void)setHasPrimaryMixedLine:(BOOL)a3
{
  self->mHasPrimaryMixedLine = a3;
}

- (BOOL)hasSecondaryMixedArea
{
  return self->mHasSecondaryMixedArea;
}

- (void)setHasSecondaryMixedArea:(BOOL)a3
{
  self->mHasSecondaryMixedArea = a3;
}

- (BOOL)hasSecondaryMixedColumn
{
  return self->mHasSecondaryMixedColumn;
}

- (void)setHasSecondaryMixedColumn:(BOOL)a3
{
  self->mHasSecondaryMixedColumn = a3;
}

- (BOOL)hasSecondaryMixedLine
{
  return self->mHasSecondaryMixedLine;
}

- (void)setHasSecondaryMixedLine:(BOOL)a3
{
  self->mHasSecondaryMixedLine = a3;
}

- (BOOL)isMixedChart
{
  return self->mHasPrimaryMixedArea
      || self->mHasPrimaryMixedColumn
      || self->mHasPrimaryMixedLine
      || self->mHasSecondaryMixedArea
      || self->mHasSecondaryMixedColumn
      || self->mHasSecondaryMixedLine;
}

- (unsigned)chartGroupIndexForType:(int)a3 isForPrimary:(BOOL)a4
{
  if (a3 == 3 && a4) {
    return 0;
  }
  unsigned int v7 = [(CHBState *)self hasPrimaryMixedArea];
  if (a3 != 3 || a4)
  {
    BOOL v8 = [(CHBState *)self hasSecondaryMixedArea];
    if (v7) {
      int v9 = 2;
    }
    else {
      int v9 = 1;
    }
    if (v8) {
      unsigned int v7 = v9;
    }
    if (a3 != 2 || !a4)
    {
      v7 += [(CHBState *)self hasPrimaryMixedColumn];
      if (a3 != 2 || a4)
      {
        v7 += [(CHBState *)self hasSecondaryMixedColumn];
        if (a3 != 1 || !a4) {
          v7 += [(CHBState *)self hasPrimaryMixedLine];
        }
      }
    }
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end