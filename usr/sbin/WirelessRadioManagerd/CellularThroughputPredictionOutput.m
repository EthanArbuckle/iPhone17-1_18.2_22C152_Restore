@interface CellularThroughputPredictionOutput
- (CellularThroughputPredictionOutput)initWithActualLowBandwidth_d:(double)a3;
- (NSSet)featureNames;
- (double)actualLowBandwidth_d;
- (id)featureValueForName:(id)a3;
- (void)setActualLowBandwidth_d:(double)a3;
@end

@implementation CellularThroughputPredictionOutput

- (CellularThroughputPredictionOutput)initWithActualLowBandwidth_d:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CellularThroughputPredictionOutput;
  result = [(CellularThroughputPredictionOutput *)&v5 init];
  if (result) {
    result->_actualLowBandwidth_d = a3;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10024E1A0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"actualLowBandwidth_d"])
  {
    v4 = [sub_1000A368C() featureValueWithDouble:self->_actualLowBandwidth_d];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)actualLowBandwidth_d
{
  return self->_actualLowBandwidth_d;
}

- (void)setActualLowBandwidth_d:(double)a3
{
  self->_actualLowBandwidth_d = a3;
}

@end