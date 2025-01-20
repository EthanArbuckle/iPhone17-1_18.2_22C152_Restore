@interface _DASSwapModelAbstractAggregator
- (NSArray)algorithms;
- (_DASSwapModelAbstractAggregator)initWithAlgorithms:(id)a3;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)updateScores;
@end

@implementation _DASSwapModelAbstractAggregator

- (_DASSwapModelAbstractAggregator)initWithAlgorithms:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASSwapModelAbstractAggregator;
  v5 = [(_DASSwapModelAbstractAggregator *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    algorithms = v5->_algorithms;
    v5->_algorithms = v6;
  }
  return v5;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  return 0;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  return 0.0;
}

- (void)updateScores
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_algorithms;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updateScores:v7];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)algorithms
{
  return self->_algorithms;
}

- (void).cxx_destruct
{
}

@end