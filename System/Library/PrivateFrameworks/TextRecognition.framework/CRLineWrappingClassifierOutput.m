@interface CRLineWrappingClassifierOutput
- (CRLineWrappingClassifierOutput)initWithWrappingProbability:(double)a3;
- (double)wrappingProbability;
@end

@implementation CRLineWrappingClassifierOutput

- (CRLineWrappingClassifierOutput)initWithWrappingProbability:(double)a3
{
  if (self) {
    self->_wrappingProbability = a3;
  }
  return self;
}

- (double)wrappingProbability
{
  return self->_wrappingProbability;
}

@end