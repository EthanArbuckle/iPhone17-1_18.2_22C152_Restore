@interface PUGroupValueFilter
- (NSArray)filters;
- (double)outputValue;
- (void)setFilters:(id)a3;
- (void)setInputValue:(double)a3;
@end

@implementation PUGroupValueFilter

- (void).cxx_destruct
{
}

- (void)setFilters:(id)a3
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (double)outputValue
{
  v2 = [(PUGroupValueFilter *)self filters];
  v3 = [v2 objectEnumerator];

  v4 = [v3 nextObject];
  [v4 outputValue];
  double v6 = v5;
  uint64_t v7 = [v3 nextObject];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      [v8 setInputValue:v6];
      [v8 outputValue];
      double v6 = v9;
      uint64_t v10 = [v3 nextObject];

      v8 = (void *)v10;
    }
    while (v10);
  }

  return v6;
}

- (void)setInputValue:(double)a3
{
  v4 = [(PUGroupValueFilter *)self filters];
  id v5 = [v4 firstObject];

  [v5 setInputValue:a3];
}

@end