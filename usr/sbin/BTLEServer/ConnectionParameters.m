@interface ConnectionParameters
- (float)maxInterval;
- (float)minInterval;
- (float)preferredInterval;
- (id)description;
- (int)maxCELength;
- (int)maxDeferment;
- (int)maxPeripheralLatency;
- (int)minCELength;
- (int)preferredPeripheralLatency;
- (int)timeout;
- (void)setMaxCELength:(int)a3;
- (void)setMaxDeferment:(int)a3;
- (void)setMaxInterval:(float)a3;
- (void)setMaxPeripheralLatency:(int)a3;
- (void)setMinCELength:(int)a3;
- (void)setMinInterval:(float)a3;
- (void)setPreferredInterval:(float)a3;
- (void)setPreferredPeripheralLatency:(int)a3;
- (void)setTimeout:(int)a3;
@end

@implementation ConnectionParameters

- (id)description
{
  v3 = objc_opt_new();
  unsigned int outCount = 0;
  v4 = (objc_class *)objc_opt_class();
  v5 = class_copyPropertyList(v4, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v5[i]);
      v8 = +[NSString stringWithUTF8String:Name];
      v9 = [(ConnectionParameters *)self valueForKey:v8];

      v10 = +[NSString stringWithUTF8String:Name];
      [v3 setObject:v9 forKey:v10];
    }
  }
  free(v5);
  v11 = +[NSString stringWithFormat:@"%@ 0x%x %@", objc_opt_class(), self, v3];

  return v11;
}

- (float)minInterval
{
  return self->_minInterval;
}

- (void)setMinInterval:(float)a3
{
  self->_minInterval = a3;
}

- (float)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(float)a3
{
  self->_preferredInterval = a3;
}

- (float)maxInterval
{
  return self->_maxInterval;
}

- (void)setMaxInterval:(float)a3
{
  self->_maxInterval = a3;
}

- (int)minCELength
{
  return self->_minCELength;
}

- (void)setMinCELength:(int)a3
{
  self->_minCELength = a3;
}

- (int)maxCELength
{
  return self->_maxCELength;
}

- (void)setMaxCELength:(int)a3
{
  self->_maxCELength = a3;
}

- (int)preferredPeripheralLatency
{
  return self->_preferredPeripheralLatency;
}

- (void)setPreferredPeripheralLatency:(int)a3
{
  self->_preferredPeripheralLatency = a3;
}

- (int)maxPeripheralLatency
{
  return self->_maxPeripheralLatency;
}

- (void)setMaxPeripheralLatency:(int)a3
{
  self->_maxPeripheralLatency = a3;
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (int)maxDeferment
{
  return self->_maxDeferment;
}

- (void)setMaxDeferment:(int)a3
{
  self->_maxDeferment = a3;
}

@end