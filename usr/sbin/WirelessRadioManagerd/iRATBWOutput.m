@interface iRATBWOutput
- (NSSet)featureNames;
- (double)actualLowBandwidth_d;
- (iRATBWOutput)initWithActualLowBandwidth_d:(double)a3;
- (id)featureValueForName:(id)a3;
- (void)setActualLowBandwidth_d:(double)a3;
@end

@implementation iRATBWOutput

- (iRATBWOutput)initWithActualLowBandwidth_d:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)iRATBWOutput;
  result = [(iRATBWOutput *)&v5 init];
  if (result) {
    result->_actualLowBandwidth_d = a3;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10024E200];
}

- (id)featureValueForName:(id)a3
{
  if (![a3 isEqualToString:@"actualLowBandwidth_d"]) {
    return 0;
  }
  v4 = (void *)sub_1000CB9C8();
  double actualLowBandwidth_d = self->_actualLowBandwidth_d;

  return [v4 featureValueWithDouble:actualLowBandwidth_d];
}

- (double)actualLowBandwidth_d
{
  return self->_actualLowBandwidth_d;
}

- (void)setActualLowBandwidth_d:(double)a3
{
  self->_double actualLowBandwidth_d = a3;
}

@end