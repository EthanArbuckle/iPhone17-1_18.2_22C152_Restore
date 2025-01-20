@interface CHDSeries
+ (id)seriesWithChart:(id)a3;
- (BOOL)hasErrorBars;
- (BOOL)hasTrendlines;
- (BOOL)isDateTimeFormattingFlag;
- (BOOL)isEmpty;
- (BOOL)isHidden;
- (CHDSeries)initWithChart:(id)a3;
- (NSString)description;
- (id)categoryData;
- (id)chart;
- (id)chartType;
- (id)dataValuePropertiesCollection;
- (id)defaultDataLabel;
- (id)defaultSeriesNameForIndex:(unint64_t)a3;
- (id)errorBarXAxis;
- (id)errorBarYAxis;
- (id)graphicProperties;
- (id)lastCachedName;
- (id)name;
- (id)shallowCopy;
- (id)trendlineCollection;
- (id)valueData;
- (int64_t)key;
- (unint64_t)categoryCount;
- (unint64_t)order;
- (unint64_t)styleIndex;
- (void)clearBackPointers;
- (void)setCategoryData:(id)a3;
- (void)setChartType:(id)a3;
- (void)setDataValuePropertiesCollection:(id)a3;
- (void)setDateTimeFormattingFlag:(BOOL)a3;
- (void)setDefaultDataLabel:(id)a3;
- (void)setErrorBar:(id)a3;
- (void)setErrorBarXAxis:(id)a3;
- (void)setErrorBarYAxis:(id)a3;
- (void)setGraphicProperties:(id)a3;
- (void)setHiddenFlag:(BOOL)a3;
- (void)setLastCachedName:(id)a3;
- (void)setName:(id)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setStyleIndex:(unint64_t)a3;
- (void)setTrendlineCollection:(id)a3;
- (void)setValueData:(id)a3;
@end

@implementation CHDSeries

- (CHDSeries)initWithChart:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHDSeries;
  v5 = [(CHDSeries *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mChart, v4);
    v7 = objc_alloc_init(EDKeyedCollection);
    mDataValuePropertiesCollection = v6->mDataValuePropertiesCollection;
    v6->mDataValuePropertiesCollection = v7;

    v9 = objc_alloc_init(EDCollection);
    mTrendlinesCollection = v6->mTrendlinesCollection;
    v6->mTrendlinesCollection = v9;

    *(_OWORD *)&v6->mOrder = xmmword_238EDB320;
    *(_WORD *)&v6->mDateTimeFormattingFlag = 0;
  }

  return v6;
}

- (void)setOrder:(unint64_t)a3
{
  self->mOrder = a3;
}

- (void)setName:(id)a3
{
  v5 = (CHDFormula *)a3;
  p_mName = &self->mName;
  if (self->mName != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_mName, a3);
    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
      v8 = [WeakRetained processors];
      [v8 markObject:v9 processor:objc_opt_class()];
    }
  }
  MEMORY[0x270F9A790](p_mName);
}

- (void)setValueData:(id)a3
{
  v5 = (CHDData *)a3;
  if (self->mValueData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mValueData, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
    v7 = [WeakRetained processors];
    [v7 markObject:v8 processor:objc_opt_class()];

    v5 = v8;
  }
}

- (void)setCategoryData:(id)a3
{
  v5 = (CHDData *)a3;
  if (self->mCategoryData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mCategoryData, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
    v7 = [WeakRetained processors];
    [v7 markObject:v8 processor:objc_opt_class()];

    v5 = v8;
  }
}

- (id)dataValuePropertiesCollection
{
  return self->mDataValuePropertiesCollection;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

- (void)setGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }
}

- (id)defaultDataLabel
{
  return self->mDefaultDataLabel;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

- (BOOL)isHidden
{
  return self->mHiddenFlag;
}

- (void)setChartType:(id)a3
{
}

- (int64_t)key
{
  return self->mOrder;
}

- (id)name
{
  return self->mName;
}

- (id)lastCachedName
{
  return self->mLastCachedName;
}

- (id)valueData
{
  return self->mValueData;
}

- (id)categoryData
{
  return self->mCategoryData;
}

- (BOOL)isEmpty
{
  mValueData = self->mValueData;
  return !mValueData || [(CHDData *)mValueData isEmpty];
}

- (id)defaultSeriesNameForIndex:(unint64_t)a3
{
  p_mChart = &self->mChart;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  int v7 = [WeakRetained isMSGraph];

  v8 = @"Series";
  if (v7)
  {
    p_mChartType = &self->mChartType;
    id v10 = objc_loadWeakRetained((id *)p_mChartType);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = @"Slice ";
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)p_mChartType);
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      id v14 = objc_loadWeakRetained((id *)p_mChartType);
      v15 = v14;
      if (v13)
      {
        int v16 = [v14 isColumn];

        if (v16) {
          v8 = @"Column ";
        }
        else {
          v8 = @"Bar ";
        }
      }
      else
      {
        objc_opt_class();
        char v17 = objc_opt_isKindOfClass();

        if (v17)
        {
          v8 = @"Area ";
        }
        else
        {
          id v18 = objc_loadWeakRetained((id *)p_mChartType);
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            v8 = @"Line ";
          }
          else
          {
            id v20 = objc_loadWeakRetained((id *)p_mChartType);
            uint64_t v21 = objc_opt_class();
            uint64_t v22 = objc_opt_class();

            if (v21 == v22) {
              v8 = @"XY (Scatter) ";
            }
          }
        }
      }
    }
    id v23 = objc_loadWeakRetained((id *)p_mChart);
    int v24 = [v23 is3D];

    if (v24)
    {
      v8 = [NSString stringWithFormat:@"%@%@", @"3-D ", v8];
    }
  }
  v25 = [NSString stringWithFormat:@"%@%ld", v8, a3 + 1];

  return v25;
}

- (void)setLastCachedName:(id)a3
{
  v5 = (CHDDataValue *)a3;
  mLastCachedName = self->mLastCachedName;
  p_mLastCachedName = &self->mLastCachedName;
  if (mLastCachedName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mLastCachedName, a3);
    v5 = v8;
  }
}

- (void)setDateTimeFormattingFlag:(BOOL)a3
{
  self->mDateTimeFormattingFlag = a3;
}

- (BOOL)isDateTimeFormattingFlag
{
  return self->mDateTimeFormattingFlag;
}

- (id)errorBarYAxis
{
  return self->mErrorBarY;
}

- (id)chart
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  return WeakRetained;
}

- (void)setErrorBar:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    if ([v12 direction] == 1) {
      [(CHDSeries *)self setErrorBarYAxis:v12];
    }
    else {
      [(CHDSeries *)self setErrorBarXAxis:v12];
    }
    id v4 = [v12 minusValues];

    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
      v6 = [WeakRetained processors];
      int v7 = [v12 minusValues];
      [v6 markObject:v7 processor:objc_opt_class()];
    }
    v8 = [v12 plusValues];

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->mChart);
      id v10 = [v9 processors];
      v11 = [v12 plusValues];
      [v10 markObject:v11 processor:objc_opt_class()];
    }
  }
}

- (void)setErrorBarYAxis:(id)a3
{
  v5 = (CHDErrorBar *)a3;
  mErrorBarY = self->mErrorBarY;
  p_mErrorBarY = &self->mErrorBarY;
  if (mErrorBarY != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mErrorBarY, a3);
    v5 = v8;
  }
}

- (void)setDefaultDataLabel:(id)a3
{
  v5 = (CHDDataLabel *)a3;
  mDefaultDataLabel = self->mDefaultDataLabel;
  p_mDefaultDataLabel = &self->mDefaultDataLabel;
  if (mDefaultDataLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDefaultDataLabel, a3);
    v5 = v8;
  }
}

- (id)chartType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChartType);
  return WeakRetained;
}

- (id)shallowCopy
{
  v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  v5 = [v3 seriesWithChart:WeakRetained];

  if (v5)
  {
    [v5 setStyleIndex:self->mStyleIndex];
    [v5 setOrder:self->mOrder];
    [v5 setDefaultDataLabel:self->mDefaultDataLabel];
    [v5 setDateTimeFormattingFlag:self->mDateTimeFormattingFlag];
    id v6 = objc_loadWeakRetained((id *)&self->mChartType);
    [v5 setChartType:v6];

    id v7 = v5;
  }

  return v5;
}

+ (id)seriesWithChart:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChart:v3];

  return v4;
}

- (id)trendlineCollection
{
  return self->mTrendlinesCollection;
}

- (void)setTrendlineCollection:(id)a3
{
  v5 = (EDCollection *)a3;
  mTrendlinesCollection = self->mTrendlinesCollection;
  p_mTrendlinesCollection = &self->mTrendlinesCollection;
  if (mTrendlinesCollection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTrendlinesCollection, a3);
    v5 = v8;
  }
}

- (id)errorBarXAxis
{
  return self->mErrorBarX;
}

- (void)setErrorBarXAxis:(id)a3
{
  v5 = (CHDErrorBar *)a3;
  mErrorBarX = self->mErrorBarX;
  p_mErrorBarX = &self->mErrorBarX;
  if (mErrorBarX != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mErrorBarX, a3);
    v5 = v8;
  }
}

- (void)clearBackPointers
{
  objc_storeWeak((id *)&self->mChart, 0);
  objc_storeWeak((id *)&self->mChartType, 0);
}

- (unint64_t)categoryCount
{
  unint64_t result = (unint64_t)self->mValueData;
  if (result) {
    return [(id)result countOfCellsBeingReferenced];
  }
  return result;
}

- (void)setDataValuePropertiesCollection:(id)a3
{
  v5 = (EDKeyedCollection *)a3;
  mDataValuePropertiesCollection = self->mDataValuePropertiesCollection;
  p_mDataValuePropertiesCollection = &self->mDataValuePropertiesCollection;
  if (mDataValuePropertiesCollection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDataValuePropertiesCollection, a3);
    v5 = v8;
  }
}

- (void)setHiddenFlag:(BOOL)a3
{
  self->mHiddenFlag = a3;
}

- (unint64_t)order
{
  return self->mOrder;
}

- (BOOL)hasTrendlines
{
  mTrendlinesCollection = self->mTrendlinesCollection;
  if (mTrendlinesCollection) {
    LOBYTE(mTrendlinesCollection) = [(EDCollection *)mTrendlinesCollection count] != 0;
  }
  return (char)mTrendlinesCollection;
}

- (BOOL)hasErrorBars
{
  return self->mErrorBarX || self->mErrorBarY != 0;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDSeries;
  v2 = [(CHDSeries *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mDefaultDataLabel, 0);
  objc_storeStrong((id *)&self->mErrorBarY, 0);
  objc_storeStrong((id *)&self->mErrorBarX, 0);
  objc_storeStrong((id *)&self->mTrendlinesCollection, 0);
  objc_storeStrong((id *)&self->mDataValuePropertiesCollection, 0);
  objc_storeStrong((id *)&self->mCategoryData, 0);
  objc_storeStrong((id *)&self->mValueData, 0);
  objc_storeStrong((id *)&self->mLastCachedName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mChartType);
  objc_destroyWeak((id *)&self->mChart);
}

@end