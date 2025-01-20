@interface RTPlaceTypeClassifierModelRankerOutput
- (NSSet)featureNames;
- (RTPlaceTypeClassifierModelRankerOutput)initWithTarget:(double)a3;
- (double)target;
- (id)featureValueForName:(id)a3;
- (void)setTarget:(double)a3;
@end

@implementation RTPlaceTypeClassifierModelRankerOutput

- (RTPlaceTypeClassifierModelRankerOutput)initWithTarget:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTPlaceTypeClassifierModelRankerOutput;
  result = [(RTPlaceTypeClassifierModelRankerOutput *)&v5 init];
  if (result) {
    result->_target = a3;
  }
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3452D60];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"target"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    [(RTPlaceTypeClassifierModelRankerOutput *)self target];
    objc_super v5 = [v4 featureValueWithDouble:x0];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (double)target
{
  return self->_target;
}

- (void)setTarget:(double)a3
{
  self->_target = a3;
}

@end