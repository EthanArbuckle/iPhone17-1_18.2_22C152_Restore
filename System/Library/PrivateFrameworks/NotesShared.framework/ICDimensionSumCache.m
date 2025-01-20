@interface ICDimensionSumCache
- (ICDimensionSumCache)init;
- (ICDimensionSumCache)initWithKeys:(id)a3 andEstimateDimension:(double)a4;
- (NSMutableDictionary)dimensions;
- (double)dimensionForKey:(id)a3;
- (double)estimateDimension;
- (double)sum;
- (unint64_t)count;
- (void)removeDimensionForKey:(id)a3;
- (void)setDimension:(double)a3 forKey:(id)a4;
- (void)setSum:(double)a3;
@end

@implementation ICDimensionSumCache

- (unint64_t)count
{
  v2 = [(ICDimensionSumCache *)self dimensions];
  unint64_t v3 = [v2 count];

  return v3;
}

- (ICDimensionSumCache)init
{
  return 0;
}

- (ICDimensionSumCache)initWithKeys:(id)a3 andEstimateDimension:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICDimensionSumCache;
  v7 = [(ICDimensionSumCache *)&v23 init];
  v8 = v7;
  if (v7)
  {
    v7->_estimateDimension = a4;
    unint64_t v9 = [v6 count];
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v9];
    dimensions = v8->_dimensions;
    v8->_dimensions = (NSMutableDictionary *)v10;

    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          -[NSMutableDictionary setObject:forKey:](v8->_dimensions, "setObject:forKey:", v12, *(void *)(*((void *)&v19 + 1) + 8 * v17++), (void)v19);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }

    [(ICDimensionSumCache *)v8 setSum:(double)v9 * a4];
  }

  return v8;
}

- (double)dimensionForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ICDimensionSumCache *)self dimensions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setDimension:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  [(ICDimensionSumCache *)self dimensionForKey:v6];
  double v8 = a3 - v7;
  [(ICDimensionSumCache *)self sum];
  [(ICDimensionSumCache *)self setSum:v9 + v8];
  id v11 = [(ICDimensionSumCache *)self dimensions];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [v11 setObject:v10 forKey:v6];
}

- (void)removeDimensionForKey:(id)a3
{
  id v10 = a3;
  id v4 = [(ICDimensionSumCache *)self dimensions];
  v5 = [v4 objectForKey:v10];

  if (v5)
  {
    [(ICDimensionSumCache *)self dimensionForKey:v10];
    double v7 = v6;
    [(ICDimensionSumCache *)self sum];
    [(ICDimensionSumCache *)self setSum:v8 - v7];
    double v9 = [(ICDimensionSumCache *)self dimensions];
    [v9 removeObjectForKey:v10];
  }
}

- (double)sum
{
  return self->_sum;
}

- (void)setSum:(double)a3
{
  self->_sum = a3;
}

- (double)estimateDimension
{
  return self->_estimateDimension;
}

- (NSMutableDictionary)dimensions
{
  return self->_dimensions;
}

- (void).cxx_destruct
{
}

@end