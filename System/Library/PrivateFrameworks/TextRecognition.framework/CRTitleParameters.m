@interface CRTitleParameters
+ (id)defaultTitleParameters;
- (CRTitleParameters)initWithMinTitleProbability:(float)a3 minTitleLength:(unint64_t)a4;
- (float)minTitleProbability;
- (unint64_t)minTitleLength;
@end

@implementation CRTitleParameters

- (CRTitleParameters)initWithMinTitleProbability:(float)a3 minTitleLength:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRTitleParameters;
  result = [(CRTitleParameters *)&v7 init];
  if (result)
  {
    result->_minTitleProbability = a3;
    result->_minTitleLength = a4;
  }
  return result;
}

+ (id)defaultTitleParameters
{
  v2 = [[CRTitleParameters alloc] initWithMinTitleProbability:0 minTitleLength:0.0];
  return v2;
}

- (float)minTitleProbability
{
  return self->_minTitleProbability;
}

- (unint64_t)minTitleLength
{
  return self->_minTitleLength;
}

@end