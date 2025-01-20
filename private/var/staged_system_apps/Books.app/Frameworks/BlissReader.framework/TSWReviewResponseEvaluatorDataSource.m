@interface TSWReviewResponseEvaluatorDataSource
- (NSMutableArray)fractions;
- (TSWReviewResponse)response;
- (TSWReviewResponseEvaluatorDataSource)initWithResponse:(id)a3;
- (double)fractionForChoiceIndex:(unint64_t)a3;
- (unint64_t)choiceCount;
- (void)addFraction:(double)a3;
- (void)dealloc;
@end

@implementation TSWReviewResponseEvaluatorDataSource

- (TSWReviewResponseEvaluatorDataSource)initWithResponse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWReviewResponseEvaluatorDataSource;
  v4 = [(TSWReviewResponseEvaluatorDataSource *)&v6 init];
  if (v4)
  {
    v4->_response = (TSWReviewResponse *)a3;
    v4->_fractions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewResponseEvaluatorDataSource;
  [(TSWReviewResponseEvaluatorDataSource *)&v3 dealloc];
}

- (void)addFraction:(double)a3
{
  fractions = self->_fractions;
  *(float *)&a3 = a3;
  v4 = +[NSNumber numberWithFloat:a3];

  [(NSMutableArray *)fractions addObject:v4];
}

- (unint64_t)choiceCount
{
  return (unint64_t)[(NSMutableArray *)self->_fractions count];
}

- (double)fractionForChoiceIndex:(unint64_t)a3
{
  id v5 = [(NSMutableArray *)self->_fractions count];
  double result = 0.0;
  if ((unint64_t)v5 > a3)
  {
    [self->_fractions objectAtIndex:a3, 0.0] floatValue
    return v7;
  }
  return result;
}

- (TSWReviewResponse)response
{
  return self->_response;
}

- (NSMutableArray)fractions
{
  return self->_fractions;
}

@end