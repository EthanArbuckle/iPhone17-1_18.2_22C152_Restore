@interface long_durationOutput
- (NSSet)featureNames;
- (double)duration_pred;
- (id)featureValueForName:(id)a3;
- (long_durationOutput)initWithDuration_pred:(double)a3;
- (void)setDuration_pred:(double)a3;
@end

@implementation long_durationOutput

- (long_durationOutput)initWithDuration_pred:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)long_durationOutput;
  result = [(long_durationOutput *)&v5 init];
  if (result) {
    result->_duration_pred = a3;
  }
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D385D08];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"duration_pred"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    [(long_durationOutput *)self duration_pred];
    objc_super v5 = objc_msgSend(v4, "featureValueWithDouble:");
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (double)duration_pred
{
  return self->_duration_pred;
}

- (void)setDuration_pred:(double)a3
{
  self->_duration_pred = a3;
}

@end