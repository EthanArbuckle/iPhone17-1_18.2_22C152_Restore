@interface CHDSeriesCollection
+ (CHDSeriesCollection)seriesCollectionWithChart:(id)a3;
- (CHDSeriesCollection)initWithChart:(id)a3;
- (id)firstNonEmptySeries;
- (unint64_t)addObject:(id)a3;
- (unint64_t)nonEmptySeriesCount;
@end

@implementation CHDSeriesCollection

- (CHDSeriesCollection)initWithChart:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDSeriesCollection;
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
  v16.super_class = (Class)CHDSeriesCollection;
  id v5 = [(EDSortedCollection *)&v16 addObject:v4];
  if (v5 != (id)-1)
  {
    v6 = [v4 name];
    if (v6)
    {
    }
    else
    {
      v7 = [v4 lastCachedName];

      if (!v7)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
        v9 = [WeakRetained processors];
        [v9 markObject:v4 processor:objc_opt_class()];
      }
    }
    p_mChart = &self->mChart;
    id v11 = objc_loadWeakRetained((id *)&self->mChart);
    v12 = [v11 processors];
    [v12 markObject:v4 processor:objc_opt_class()];

    id v13 = objc_loadWeakRetained((id *)p_mChart);
    v14 = [v13 processors];
    [v14 markObject:v4 processor:objc_opt_class()];
  }
  return (unint64_t)v5;
}

- (unint64_t)nonEmptySeriesCount
{
  unint64_t v3 = [(EDCollection *)self count];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  unint64_t v5 = 0;
  for (uint64_t i = 0; i != v4; ++i)
  {
    v7 = [(EDCollection *)self objectAtIndex:i];
    objc_super v8 = v7;
    if (v7) {
      v5 += [v7 isEmpty] ^ 1;
    }
  }
  return v5;
}

- (id)firstNonEmptySeries
{
  unint64_t v3 = [(EDCollection *)self count];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 0;
    while (1)
    {
      v6 = [(EDCollection *)self objectAtIndex:v5];
      v7 = v6;
      if (v6)
      {
        if (([v6 isEmpty] & 1) == 0) {
          break;
        }
      }

      if (v4 == ++v5) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }
  return v7;
}

+ (CHDSeriesCollection)seriesCollectionWithChart:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChart:v3];

  return (CHDSeriesCollection *)v4;
}

- (void).cxx_destruct
{
}

@end