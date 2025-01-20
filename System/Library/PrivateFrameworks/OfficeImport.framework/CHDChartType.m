@interface CHDChartType
+ (BOOL)is3DType;
+ (id)chartTypeWithChart:(id)a3;
- (BOOL)isHorizontal;
- (BOOL)isPlotedOnSecondaryAxis;
- (BOOL)isVaryColors;
- (CHDChartType)initWithChart:(id)a3;
- (id)axes;
- (id)axisForClass:(Class)a3;
- (id)axisIds;
- (id)chart;
- (id)contentFormat;
- (id)defaultDataLabel;
- (id)defaultTitleWithResources:(id)a3;
- (id)description;
- (id)seriesCollection;
- (int)defaultLabelPosition;
- (unint64_t)categoryCount;
- (unint64_t)seriesCount;
- (void)setDefaultDataLabel:(id)a3;
- (void)setSeriesCollection:(id)a3;
- (void)setVaryColors:(BOOL)a3;
- (void)switchAxes:(id)a3;
@end

@implementation CHDChartType

- (CHDChartType)initWithChart:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHDChartType;
  v5 = [(CHDChartType *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mChart, v4);
    v7 = objc_alloc_init(EDCollection);
    mAxisIds = v6->mAxisIds;
    v6->mAxisIds = v7;

    v9 = [[CHDSeriesCollection alloc] initWithChart:v4];
    mSeries = v6->mSeries;
    v6->mSeries = v9;

    v6->mVaryColors = 1;
  }

  return v6;
}

- (void)setVaryColors:(BOOL)a3
{
  self->mVaryColors = a3;
}

- (id)axisIds
{
  return self->mAxisIds;
}

- (id)seriesCollection
{
  return self->mSeries;
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

- (id)chart
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  return WeakRetained;
}

- (id)axes
{
  v3 = [MEMORY[0x263EFF980] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  v5 = [WeakRetained plotArea];
  v6 = [v5 axes];

  unint64_t v7 = [(EDCollection *)self->mAxisIds count];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = [(EDCollection *)self->mAxisIds objectAtIndex:i];
      int v10 = [v9 intValue];

      v11 = [v6 objectWithKey:v10];
      if (v11) {
        [v3 addObject:v11];
      }
    }
  }

  return v3;
}

- (BOOL)isHorizontal
{
  return 0;
}

- (BOOL)isVaryColors
{
  return self->mVaryColors;
}

- (void)setSeriesCollection:(id)a3
{
  v5 = (CHDSeriesCollection *)a3;
  mSeries = self->mSeries;
  p_mSeries = &self->mSeries;
  if (mSeries != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mSeries, a3);
    v5 = v8;
  }
}

+ (id)chartTypeWithChart:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChart:v3];

  return v4;
}

- (unint64_t)seriesCount
{
  return [(EDCollection *)self->mSeries count];
}

- (unint64_t)categoryCount
{
  unint64_t v3 = [(EDCollection *)self->mSeries count];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  unint64_t v5 = 0;
  for (uint64_t i = 0; i != v4; ++i)
  {
    unint64_t v7 = [(EDCollection *)self->mSeries objectAtIndex:i];
    v8 = v7;
    if (v7)
    {
      if (([v7 isEmpty] & 1) == 0)
      {
        unint64_t v9 = [v8 categoryCount];
        if (v9 > v5) {
          unint64_t v5 = v9;
        }
      }
    }
  }
  return v5;
}

+ (BOOL)is3DType
{
  return 0;
}

- (id)defaultTitleWithResources:(id)a3
{
  unint64_t v4 = (EDResources *)a3;
  if ([(EDCollection *)self->mSeries count] == 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v5 = [(EDCollection *)self->mSeries objectAtIndex:0];
    v6 = [v5 lastCachedName];

    if (v6)
    {
      EDValue::EDValue(&v10, (const EDValue *)[v6 value]);
      if (EDValue::isStringType(&v10))
      {
        unint64_t v7 = EDValue::resolvedEDStringValue(&v10, v4);
        v8 = (void *)[v7 copy];
      }
      else
      {
        v8 = 0;
      }
      EDValue::~EDValue(&v10);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isPlotedOnSecondaryAxis
{
  p_mChart = &self->mChart;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  unint64_t v5 = [WeakRetained plotArea];
  int v6 = [v5 hasSecondaryAxis];

  if (!v6) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_mChart);
  v8 = [v7 plotArea];
  unint64_t v9 = [v8 axes];

  unint64_t v10 = [(EDCollection *)self->mAxisIds count];
  if (v10)
  {
    uint64_t v11 = 0;
    while (1)
    {
      objc_super v12 = [(EDCollection *)self->mAxisIds objectAtIndex:v11];
      int v13 = [v12 intValue];

      v14 = [v9 objectWithKey:v13];
      v15 = v14;
      if (v14)
      {
        if ([v14 isSecondary]) {
          break;
        }
      }

      if (v10 == ++v11) {
        goto LABEL_7;
      }
    }

    BOOL v16 = 1;
  }
  else
  {
LABEL_7:
    BOOL v16 = 0;
  }

  return v16;
}

- (void)switchAxes:(id)a3
{
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  unint64_t v5 = [WeakRetained plotArea];
  int v6 = [v5 axes];

  uint64_t v7 = [v6 count];
  uint64_t v8 = [v17 count];
  if (v7 == 4 && v8 == 2)
  {
    unint64_t v9 = [v17 objectAtIndex:0];
    int v10 = [v9 intValue];

    uint64_t v11 = [v17 objectAtIndex:1];
    int v12 = [v11 intValue];

    for (uint64_t i = 0; i != 4; ++i)
    {
      v14 = [v6 objectAtIndex:i];
      v15 = v14;
      if (v14)
      {
        int v16 = [v14 axisId];
        if (v16 != v10 && v16 != v12) {
          [v15 setSecondary:1];
        }
      }
    }
  }
}

- (id)axisForClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  unint64_t v5 = [WeakRetained plotArea];
  int v6 = [v5 axes];

  unint64_t v7 = [(EDCollection *)self->mAxisIds count];
  if (v7)
  {
    uint64_t v8 = 0;
    while (1)
    {
      unint64_t v9 = [(EDCollection *)self->mAxisIds objectAtIndex:v8];
      int v10 = objc_msgSend(v6, "objectWithKey:", (int)objc_msgSend(v9, "intValue"));

      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }

      if (v7 == ++v8) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    int v10 = 0;
  }

  return v10;
}

- (id)defaultDataLabel
{
  return self->mDefaultDataLabel;
}

- (id)contentFormat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  unint64_t v3 = [WeakRetained defaultContentFormat];

  return v3;
}

- (int)defaultLabelPosition
{
  mDefaultDataLabel = self->mDefaultDataLabel;
  if (mDefaultDataLabel) {
    LODWORD(mDefaultDataLabel) = [(CHDDataLabel *)mDefaultDataLabel position];
  }
  return (int)mDefaultDataLabel;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDChartType;
  v2 = [(CHDChartType *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultDataLabel, 0);
  objc_storeStrong((id *)&self->mSeries, 0);
  objc_storeStrong((id *)&self->mAxisIds, 0);
  objc_destroyWeak((id *)&self->mChart);
}

@end