@interface shortDurationModelOutput
- (NSSet)featureNames;
- (double)duration_pred;
- (id)featureValueForName:(id)a3;
- (shortDurationModelOutput)initWithDuration_pred:(double)a3;
- (void)setDuration_pred:(double)a3;
@end

@implementation shortDurationModelOutput

- (shortDurationModelOutput)initWithDuration_pred:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)shortDurationModelOutput;
  result = [(shortDurationModelOutput *)&v5 init];
  if (result) {
    result->_duration_pred = a3;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100069B50];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"duration_pred"])
  {
    [(shortDurationModelOutput *)self duration_pred];
    v4 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
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