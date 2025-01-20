@interface CHDChartTypesCollection
- (CHDChartTypesCollection)initWithChart:(id)a3;
- (unint64_t)addObject:(id)a3;
- (void)resetSeriesOrder;
@end

@implementation CHDChartTypesCollection

- (CHDChartTypesCollection)initWithChart:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDChartTypesCollection;
  v5 = [(EDCollection *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mChart, v4);
  }

  return v6;
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHDChartTypesCollection;
  id v5 = [(EDCollection *)&v16 addObject:v4];
  if (v5 != (id)-1)
  {
    p_mChart = &self->mChart;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
    objc_super v8 = [WeakRetained processors];
    [v8 markObject:v4 processor:objc_opt_class()];

    if ([(EDCollection *)self count] == 1)
    {
      id v9 = objc_loadWeakRetained((id *)&self->mChart);
      v10 = [v9 processors];
      [v10 markObject:v4 processor:objc_opt_class()];
    }
    id v11 = objc_loadWeakRetained((id *)p_mChart);
    v12 = [v11 processors];
    [v12 markObject:v4 processor:objc_opt_class()];

    id v13 = objc_loadWeakRetained((id *)p_mChart);
    v14 = [v13 processors];
    [v14 markObject:v4 processor:objc_opt_class()];
  }
  return (unint64_t)v5;
}

- (void)resetSeriesOrder
{
  if ([(EDCollection *)self count] >= 2)
  {
    unint64_t v3 = [(EDCollection *)self count];
    if (v3)
    {
      unint64_t v4 = v3;
      uint64_t v5 = 0;
      for (uint64_t i = 0; i != v4; ++i)
      {
        v7 = [(EDCollection *)self objectAtIndex:i];
        objc_super v8 = v7;
        if (v7)
        {
          id v9 = [v7 seriesCollection];
          uint64_t v10 = [v9 count];
          if (v10)
          {
            uint64_t v11 = 0;
            do
            {
              v12 = [v9 objectAtIndex:v11];
              id v13 = v12;
              if (v12) {
                [v12 setOrder:v5++];
              }

              ++v11;
            }
            while (v10 != v11);
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end