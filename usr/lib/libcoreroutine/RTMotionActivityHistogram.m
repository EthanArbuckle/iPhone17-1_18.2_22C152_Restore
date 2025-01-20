@interface RTMotionActivityHistogram
- (NSMutableDictionary)bins;
- (RTMotionActivityHistogram)init;
- (RTMotionActivityHistogram)initWithActivites:(id)a3 betweenDate:(id)a4 andDate:(id)a5;
- (double)totalInterval;
- (id)binForType:(unint64_t)a3;
- (id)binsSortedByInterval;
- (void)addInterval:(double)a3 ofType:(unint64_t)a4 withConfidence:(unint64_t)a5;
- (void)setTotalInterval:(double)a3;
@end

@implementation RTMotionActivityHistogram

- (RTMotionActivityHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTMotionActivityHistogram;
  v2 = [(RTMotionActivityHistogram *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bins = v2->_bins;
    v2->_bins = (NSMutableDictionary *)v3;

    v2->_totalInterval = 0.0;
  }
  return v2;
}

- (RTMotionActivityHistogram)initWithActivites:(id)a3 betweenDate:(id)a4 andDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RTMotionActivityHistogram;
  v11 = [(RTMotionActivityHistogram *)&v21 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    bins = v11->_bins;
    v11->_bins = (NSMutableDictionary *)v12;

    v11->_totalInterval = 0.0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__76;
    v19[4] = __Block_byref_object_dispose__76;
    id v20 = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__RTMotionActivityHistogram_initWithActivites_betweenDate_andDate___block_invoke;
    v15[3] = &unk_1E6B973C0;
    v18 = v19;
    id v16 = v9;
    v17 = v11;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v15];

    _Block_object_dispose(v19, 8);
  }

  return v11;
}

void __67__RTMotionActivityHistogram_initWithActivites_betweenDate_andDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  objc_super v6 = [v18 startDate];
  v7 = [v6 laterDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v8 = [v18 startDate];

  if (v7 != v8)
  {
    id v9 = [v18 startDate];
    id v10 = [v9 earlierDate:*(void *)(a1 + 32)];
    v11 = [v18 startDate];

    if (v10 == v11)
    {
      id v12 = *(id *)(a1 + 32);
      *a4 = 1;
    }
    else
    {
      id v12 = [v18 startDate];
    }
    v13 = *(void **)(a1 + 40);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timeIntervalSinceDate:v12];
    [v13 addInterval:objc_msgSend(v18, "type") ofType:objc_msgSend(v18, "confidence") withConfidence:v14];
    uint64_t v15 = [v18 startDate];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

- (id)binForType:(unint64_t)a3
{
  v4 = [(RTMotionActivityHistogram *)self bins];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  objc_super v6 = [v4 objectForKey:v5];
  v7 = (void *)[v6 copy];

  return v7;
}

- (void)addInterval:(double)a3 ofType:(unint64_t)a4 withConfidence:(unint64_t)a5
{
  id v9 = [(RTMotionActivityHistogram *)self bins];
  id v10 = [NSNumber numberWithUnsignedInteger:a4];
  double v14 = [v9 objectForKey:v10];

  if (v14)
  {
    [(RTMotionActivityHistogramBin *)v14 addInterval:a3];
    [(RTMotionActivityHistogramBin *)v14 updateConfidence:a5];
  }
  else
  {
    double v14 = [[RTMotionActivityHistogramBin alloc] initWithType:a4 confidence:a5 interval:a3];
    v11 = [(RTMotionActivityHistogram *)self bins];
    id v12 = [NSNumber numberWithUnsignedInteger:a4];
    [v11 setObject:v14 forKey:v12];
  }
  [(RTMotionActivityHistogram *)self totalInterval];
  [(RTMotionActivityHistogram *)self setTotalInterval:v13 + a3];
}

- (id)binsSortedByInterval
{
  v2 = [(RTMotionActivityHistogram *)self bins];
  uint64_t v3 = [v2 allValues];
  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_62];

  return v4;
}

uint64_t __49__RTMotionActivityHistogram_binsSortedByInterval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 interval];
  double v6 = v5;
  [v4 interval];
  double v8 = v7;

  if (v6 <= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (NSMutableDictionary)bins
{
  return self->_bins;
}

- (double)totalInterval
{
  return self->_totalInterval;
}

- (void)setTotalInterval:(double)a3
{
  self->_totalInterval = a3;
}

- (void).cxx_destruct
{
}

@end