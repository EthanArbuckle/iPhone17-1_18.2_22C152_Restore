@interface FindDeviceAndPlaySoundDevicesResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (FindDeviceAndPlaySoundDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation FindDeviceAndPlaySoundDevicesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static FindDeviceAndPlaySoundDevicesResolutionResult.unsupported(forReason:)(a3);

  return v4;
}

- (FindDeviceAndPlaySoundDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (FindDeviceAndPlaySoundDevicesResolutionResult *)FindDeviceAndPlaySoundDevicesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end