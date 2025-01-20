@interface SADeviceControlStopScreenRecording
+ (id)stopScreenRecording;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SADeviceControlStopScreenRecording

- (id)groupIdentifier
{
  return @"com.apple.ace.devicecontrol";
}

- (id)encodedClassName
{
  return @"StopScreenRecording";
}

+ (id)stopScreenRecording
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end