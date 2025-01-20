@interface FedStatsDataEncoderDimensionalResult
+ (id)resultWithIndex:(id)a3 dimensionality:(id)a4;
- (FedStatsDataEncoderDimensionalResult)initWithIndex:(id)a3 dimensionality:(id)a4;
- (NSNumber)dimensionality;
- (NSNumber)index;
- (void)setDimensionality:(id)a3;
- (void)setIndex:(id)a3;
@end

@implementation FedStatsDataEncoderDimensionalResult

- (FedStatsDataEncoderDimensionalResult)initWithIndex:(id)a3 dimensionality:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsDataEncoderDimensionalResult;
  v9 = [(FedStatsDataEncoderDimensionalResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_index, a3);
    objc_storeStrong((id *)&v10->_dimensionality, a4);
  }

  return v10;
}

+ (id)resultWithIndex:(id)a3 dimensionality:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithIndex:v7 dimensionality:v6];

  return v8;
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndex:(id)a3
{
}

- (NSNumber)dimensionality
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDimensionality:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensionality, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end