@interface CLSSignalNode
- (BOOL)failsHighPrecisionWithConfidence:(double)a3;
- (BOOL)failsHighPrecisionWithSignal:(id)a3;
- (BOOL)failsHighRecallWithConfidence:(double)a3;
- (BOOL)failsHighRecallWithSignal:(id)a3;
- (BOOL)failsWithConfidence:(double)a3;
- (BOOL)failsWithSignal:(id)a3;
- (BOOL)passesHighPrecisionWithConfidence:(double)a3;
- (BOOL)passesHighPrecisionWithSignal:(id)a3;
- (BOOL)passesHighRecallWithConfidence:(double)a3;
- (BOOL)passesHighRecallWithSignal:(id)a3;
- (BOOL)passesWithConfidence:(double)a3;
- (BOOL)passesWithSignal:(id)a3;
- (CLSSignalNode)initWithIdentifier:(unint64_t)a3 name:(id)a4 operatingPoint:(double)a5 highPrecisionOperatingPoint:(double)a6 highRecallOperatingPoint:(double)a7;
- (NSString)name;
- (double)highPrecisionOperatingPoint;
- (double)highRecallOperatingPoint;
- (double)operatingPoint;
- (id)signalInfoWithIsHierarchical:(BOOL)a3;
- (unint64_t)identifier;
@end

@implementation CLSSignalNode

- (void).cxx_destruct
{
}

- (double)highRecallOperatingPoint
{
  return self->_highRecallOperatingPoint;
}

- (double)highPrecisionOperatingPoint
{
  return self->_highPrecisionOperatingPoint;
}

- (double)operatingPoint
{
  return self->_operatingPoint;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)signalInfoWithIsHierarchical:(BOOL)a3
{
  BOOL v3 = a3;
  v14[6] = *MEMORY[0x263EF8340];
  v13[0] = @"identifier";
  v5 = [NSNumber numberWithUnsignedLongLong:self->_identifier];
  name = self->_name;
  v14[0] = v5;
  v14[1] = name;
  v13[1] = @"name";
  v13[2] = @"operatingPoint";
  v7 = [NSNumber numberWithDouble:self->_operatingPoint];
  v14[2] = v7;
  v13[3] = @"highPrecisionOperatingPoint";
  v8 = [NSNumber numberWithDouble:self->_highPrecisionOperatingPoint];
  v14[3] = v8;
  v13[4] = @"highRecallOperatingPoint";
  v9 = [NSNumber numberWithDouble:self->_highRecallOperatingPoint];
  v14[4] = v9;
  v13[5] = @"isHierarchical";
  v10 = [NSNumber numberWithBool:v3];
  v14[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (BOOL)failsHighRecallWithConfidence:(double)a3
{
  return self->_highRecallOperatingPoint > a3;
}

- (BOOL)failsHighPrecisionWithConfidence:(double)a3
{
  return self->_highPrecisionOperatingPoint > a3;
}

- (BOOL)failsWithConfidence:(double)a3
{
  return self->_operatingPoint > a3;
}

- (BOOL)passesHighRecallWithConfidence:(double)a3
{
  return self->_highRecallOperatingPoint <= a3;
}

- (BOOL)passesHighPrecisionWithConfidence:(double)a3
{
  return self->_highPrecisionOperatingPoint <= a3;
}

- (BOOL)passesWithConfidence:(double)a3
{
  return self->_operatingPoint <= a3;
}

- (BOOL)failsHighRecallWithSignal:(id)a3
{
  id v4 = a3;
  if ([v4 extendedSceneIdentifier] == self->_identifier)
  {
    [v4 confidence];
    BOOL v6 = v5 < self->_highRecallOperatingPoint;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)failsHighPrecisionWithSignal:(id)a3
{
  id v4 = a3;
  if ([v4 extendedSceneIdentifier] == self->_identifier)
  {
    [v4 confidence];
    BOOL v6 = v5 < self->_highPrecisionOperatingPoint;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)failsWithSignal:(id)a3
{
  id v4 = a3;
  if ([v4 extendedSceneIdentifier] == self->_identifier)
  {
    [v4 confidence];
    BOOL v6 = v5 < self->_operatingPoint;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)passesHighRecallWithSignal:(id)a3
{
  id v4 = a3;
  if ([v4 extendedSceneIdentifier] == self->_identifier)
  {
    [v4 confidence];
    BOOL v6 = v5 >= self->_highRecallOperatingPoint;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)passesHighPrecisionWithSignal:(id)a3
{
  id v4 = a3;
  if ([v4 extendedSceneIdentifier] == self->_identifier)
  {
    [v4 confidence];
    BOOL v6 = v5 >= self->_highPrecisionOperatingPoint;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)passesWithSignal:(id)a3
{
  id v4 = a3;
  if ([v4 extendedSceneIdentifier] == self->_identifier)
  {
    [v4 confidence];
    BOOL v6 = v5 >= self->_operatingPoint;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CLSSignalNode)initWithIdentifier:(unint64_t)a3 name:(id)a4 operatingPoint:(double)a5 highPrecisionOperatingPoint:(double)a6 highRecallOperatingPoint:(double)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CLSSignalNode;
  v14 = [(CLSSignalNode *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_identifier = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_operatingPoint = a5;
    v15->_highPrecisionOperatingPoint = a6;
    v15->_highRecallOperatingPoint = a7;
    if (a5 > a6) {
      __assert_rtn("-[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]", "CLSSignalModel.m", 31, "_operatingPoint <= _highPrecisionOperatingPoint");
    }
    if (a5 < a7) {
      __assert_rtn("-[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]", "CLSSignalModel.m", 32, "_operatingPoint >= _highRecallOperatingPoint");
    }
  }

  return v15;
}

@end