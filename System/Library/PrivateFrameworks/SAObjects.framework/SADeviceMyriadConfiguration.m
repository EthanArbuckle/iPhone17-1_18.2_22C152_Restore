@interface SADeviceMyriadConfiguration
+ (id)deviceMyriadConfiguration;
- (BOOL)requiresResponse;
- (double)deviceAdjustment;
- (double)deviceClass;
- (double)deviceDelay;
- (double)deviceTrumpDelay;
- (double)deviceVTEndtimeDistanceThreshold;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDeviceAdjustment:(double)a3;
- (void)setDeviceClass:(double)a3;
- (void)setDeviceDelay:(double)a3;
- (void)setDeviceTrumpDelay:(double)a3;
- (void)setDeviceVTEndtimeDistanceThreshold:(double)a3;
@end

@implementation SADeviceMyriadConfiguration

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DeviceMyriadConfiguration";
}

+ (id)deviceMyriadConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)deviceAdjustment
{
  return AceObjectDoubleForProperty(self, @"deviceAdjustment");
}

- (void)setDeviceAdjustment:(double)a3
{
}

- (double)deviceClass
{
  return AceObjectDoubleForProperty(self, @"deviceClass");
}

- (void)setDeviceClass:(double)a3
{
}

- (double)deviceDelay
{
  return AceObjectDoubleForProperty(self, @"deviceDelay");
}

- (void)setDeviceDelay:(double)a3
{
}

- (double)deviceTrumpDelay
{
  return AceObjectDoubleForProperty(self, @"deviceTrumpDelay");
}

- (void)setDeviceTrumpDelay:(double)a3
{
}

- (double)deviceVTEndtimeDistanceThreshold
{
  return AceObjectDoubleForProperty(self, @"deviceVTEndtimeDistanceThreshold");
}

- (void)setDeviceVTEndtimeDistanceThreshold:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end