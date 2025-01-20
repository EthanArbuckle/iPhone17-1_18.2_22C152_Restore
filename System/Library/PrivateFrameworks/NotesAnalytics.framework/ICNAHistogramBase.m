@interface ICNAHistogramBase
- (ICNAHistogramBase)init;
- (NSArray)bucketLeftBounds;
- (NSMutableArray)countsForEachBucket;
- (NSNumber)valueMax;
- (double)roundedValue:(double)a3;
- (double)valuePrecision;
- (id)icasHistogram;
- (unint64_t)roundedCount:(unint64_t)a3;
- (void)reportValue:(double)a3;
- (void)setBucketLeftBounds:(id)a3;
- (void)setCountsForEachBucket:(id)a3;
- (void)setValueMax:(id)a3;
- (void)setValuePrecision:(double)a3;
@end

@implementation ICNAHistogramBase

- (ICNAHistogramBase)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICNAHistogramBase;
  v2 = [(ICNAHistogramBase *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_valuePrecision = 1.0;
    [(ICNAHistogramBase *)v2 setup];
    if (!v3->_bucketLeftBounds)
    {
      v3->_bucketLeftBounds = (NSArray *)&unk_1F1F92420;
    }
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    countsForEachBucket = v3->_countsForEachBucket;
    v3->_countsForEachBucket = v4;

    if ([(NSArray *)v3->_bucketLeftBounds count])
    {
      unint64_t v6 = 0;
      do
      {
        [(NSMutableArray *)v3->_countsForEachBucket addObject:&unk_1F1F8DCC8];
        ++v6;
      }
      while (v6 < [(NSArray *)v3->_bucketLeftBounds count]);
    }
  }
  return v3;
}

- (void)reportValue:(double)a3
{
  [(ICNAHistogramBase *)self roundedValue:a3];
  double v5 = v4;
  uint64_t v6 = [(ICNAHistogramBase *)self valueMax];
  if (!v6
    || (v7 = (void *)v6,
        [(ICNAHistogramBase *)self valueMax],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        [v8 doubleValue],
        double v10 = v9,
        v8,
        v7,
        v5 <= v10))
  {
    v11 = [(ICNAHistogramBase *)self bucketLeftBounds];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      unint64_t v13 = 0;
      while (1)
      {
        v14 = [(ICNAHistogramBase *)self bucketLeftBounds];
        v15 = [v14 objectAtIndexedSubscript:v13];
        [v15 floatValue];
        double v17 = v16;

        if (v5 < v17) {
          break;
        }
        ++v13;
        v18 = [(ICNAHistogramBase *)self bucketLeftBounds];
        unint64_t v19 = [v18 count];

        if (v13 >= v19) {
          goto LABEL_9;
        }
      }
      if (!v13) {
        return;
      }
LABEL_9:
      unint64_t v20 = v13 - 1;
      v21 = [(ICNAHistogramBase *)self countsForEachBucket];
      v22 = [v21 objectAtIndexedSubscript:v20];
      uint64_t v23 = [v22 unsignedIntegerValue];

      id v25 = [NSNumber numberWithUnsignedInteger:v23 + 1];
      v24 = [(ICNAHistogramBase *)self countsForEachBucket];
      [v24 setObject:v25 atIndexedSubscript:v20];
    }
  }
}

- (id)icasHistogram
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [(ICNAHistogramBase *)self bucketLeftBounds];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(ICNAHistogramBase *)self countsForEachBucket];
      objc_super v8 = [v7 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v8 unsignedIntegerValue];

      if (v9)
      {
        double v10 = [(ICNAHistogramBase *)self bucketLeftBounds];
        v11 = [v10 objectAtIndexedSubscript:v6];
        [v11 floatValue];
        float v13 = v12;

        v14 = [(ICNAHistogramBase *)self bucketLeftBounds];
        unint64_t v15 = [v14 count] - 1;

        if (v6 >= v15)
        {
          v22 = [(ICNAHistogramBase *)self valueMax];
        }
        else
        {
          float v16 = NSNumber;
          double v17 = [(ICNAHistogramBase *)self bucketLeftBounds];
          v18 = [v17 objectAtIndexedSubscript:v6 + 1];
          [v18 floatValue];
          double v20 = v19;
          [(ICNAHistogramBase *)self valuePrecision];
          v22 = [v16 numberWithDouble:v20 - v21];
        }
        uint64_t v23 = [ICASHistogramItemData alloc];
        v24 = [NSNumber numberWithDouble:v13];
        id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNAHistogramBase roundedCount:](self, "roundedCount:", v9));
        v26 = [(ICASHistogramItemData *)v23 initWithLeftBound:v24 rightBound:v22 count:v25];

        [v3 addObject:v26];
      }
      ++v6;
      v27 = [(ICNAHistogramBase *)self bucketLeftBounds];
      unint64_t v28 = [v27 count];
    }
    while (v6 < v28);
  }
  v29 = (void *)[v3 copy];

  return v29;
}

- (double)roundedValue:(double)a3
{
  [(ICNAHistogramBase *)self valuePrecision];
  double v6 = round(a3 / v5);
  [(ICNAHistogramBase *)self valuePrecision];
  return v7 * v6;
}

- (unint64_t)roundedCount:(unint64_t)a3
{
  return ICNARoundTo2SigFigsInt(a3);
}

- (NSArray)bucketLeftBounds
{
  return self->_bucketLeftBounds;
}

- (void)setBucketLeftBounds:(id)a3
{
}

- (double)valuePrecision
{
  return self->_valuePrecision;
}

- (void)setValuePrecision:(double)a3
{
  self->_valuePrecision = a3;
}

- (NSNumber)valueMax
{
  return self->_valueMax;
}

- (void)setValueMax:(id)a3
{
}

- (NSMutableArray)countsForEachBucket
{
  return self->_countsForEachBucket;
}

- (void)setCountsForEachBucket:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countsForEachBucket, 0);
  objc_storeStrong((id *)&self->_valueMax, 0);
  objc_storeStrong((id *)&self->_bucketLeftBounds, 0);
}

@end