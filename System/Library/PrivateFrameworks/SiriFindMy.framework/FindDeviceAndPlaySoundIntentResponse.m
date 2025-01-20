@interface FindDeviceAndPlaySoundIntentResponse
- (FindDeviceAndPlaySoundIntentResponse)init;
- (FindDeviceAndPlaySoundIntentResponse)initWithBackingStore:(id)a3;
- (FindDeviceAndPlaySoundIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (FindDeviceAndPlaySoundIntentResponse)initWithCoder:(id)a3;
- (FindDeviceAndPlaySoundIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation FindDeviceAndPlaySoundIntentResponse

- (int64_t)code
{
  return FindDeviceAndPlaySoundIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (FindDeviceAndPlaySoundIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init(code:userActivity:)(a3, a4);
}

- (FindDeviceAndPlaySoundIntentResponse)init
{
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init()();
}

- (FindDeviceAndPlaySoundIntentResponse)initWithCoder:(id)a3
{
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init(coder:)(a3);
}

- (FindDeviceAndPlaySoundIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init(backingStore:)(a3);
}

- (FindDeviceAndPlaySoundIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1D463F868();
  }
  else {
    uint64_t v3 = 0;
  }
  return (FindDeviceAndPlaySoundIntentResponse *)FindDeviceAndPlaySoundIntentResponse.init(propertiesByName:)(v3);
}

@end