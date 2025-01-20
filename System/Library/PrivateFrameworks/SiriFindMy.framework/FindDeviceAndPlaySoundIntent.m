@interface FindDeviceAndPlaySoundIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (FindDeviceAndPlaySoundIntent)init;
- (FindDeviceAndPlaySoundIntent)initWithCoder:(id)a3;
- (FindDeviceAndPlaySoundIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (FindDeviceAndPlaySoundIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation FindDeviceAndPlaySoundIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (FindDeviceAndPlaySoundIntent)init
{
  return (FindDeviceAndPlaySoundIntent *)FindDeviceAndPlaySoundIntent.init()();
}

- (FindDeviceAndPlaySoundIntent)initWithCoder:(id)a3
{
  return (FindDeviceAndPlaySoundIntent *)FindDeviceAndPlaySoundIntent.init(coder:)(a3);
}

- (FindDeviceAndPlaySoundIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D463F8C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (FindDeviceAndPlaySoundIntent *)FindDeviceAndPlaySoundIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (FindDeviceAndPlaySoundIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_1D463F868();
  }
  return (FindDeviceAndPlaySoundIntent *)FindDeviceAndPlaySoundIntent.init(domain:verb:parametersByName:)();
}

@end