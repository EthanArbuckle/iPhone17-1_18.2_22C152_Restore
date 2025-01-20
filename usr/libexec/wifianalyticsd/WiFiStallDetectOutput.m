@interface WiFiStallDetectOutput
- (NSDictionary)stallProbability;
- (NSSet)featureNames;
- (WiFiStallDetectOutput)initWithStall:(int64_t)a3 stallProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)stall;
- (void)setStall:(int64_t)a3;
- (void)setStallProbability:(id)a3;
@end

@implementation WiFiStallDetectOutput

- (WiFiStallDetectOutput)initWithStall:(int64_t)a3 stallProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WiFiStallDetectOutput;
  v8 = [(WiFiStallDetectOutput *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_stall = a3;
    objc_storeStrong((id *)&v8->_stallProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000E43D8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"stall"])
  {
    v5 = +[MLFeatureValue featureValueWithInt64:[(WiFiStallDetectOutput *)self stall]];
  }
  else if ([v4 isEqualToString:@"stallProbability"])
  {
    v6 = [(WiFiStallDetectOutput *)self stallProbability];
    v5 = +[MLFeatureValue featureValueWithDictionary:v6 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)stall
{
  return self->_stall;
}

- (void)setStall:(int64_t)a3
{
  self->_stall = a3;
}

- (NSDictionary)stallProbability
{
  return self->_stallProbability;
}

- (void)setStallProbability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end