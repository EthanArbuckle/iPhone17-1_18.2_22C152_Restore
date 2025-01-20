@interface SADeviceControlStartScreenRecording
+ (id)startScreenRecording;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SADeviceControlStartScreenRecording

- (id)groupIdentifier
{
  return @"com.apple.ace.devicecontrol";
}

- (id)encodedClassName
{
  return @"StartScreenRecording";
}

+ (id)startScreenRecording
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end