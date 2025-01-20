@interface RCPRecorderConfig
- (BOOL)ignoreSenderProperties;
- (NSArray)deviceUsagePageArray;
- (double)maxStreamDuration;
- (void)setDeviceUsagePageArray:(id)a3;
- (void)setIgnoreSenderProperties:(BOOL)a3;
- (void)setMaxStreamDuration:(double)a3;
@end

@implementation RCPRecorderConfig

- (NSArray)deviceUsagePageArray
{
  return self->_deviceUsagePageArray;
}

- (void)setDeviceUsagePageArray:(id)a3
{
}

- (double)maxStreamDuration
{
  return self->_maxStreamDuration;
}

- (void)setMaxStreamDuration:(double)a3
{
  self->_maxStreamDuration = a3;
}

- (BOOL)ignoreSenderProperties
{
  return self->_ignoreSenderProperties;
}

- (void)setIgnoreSenderProperties:(BOOL)a3
{
  self->_ignoreSenderProperties = a3;
}

- (void).cxx_destruct
{
}

@end