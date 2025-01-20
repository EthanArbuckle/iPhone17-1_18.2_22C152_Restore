@interface SetPlaybackSpeedIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetPlaybackSpeedIntent)init;
- (SetPlaybackSpeedIntent)initWithCoder:(id)a3;
- (SetPlaybackSpeedIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetPlaybackSpeedIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetPlaybackSpeedIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetPlaybackSpeedIntent)init
{
  return (SetPlaybackSpeedIntent *)SetPlaybackSpeedIntent.init()();
}

- (SetPlaybackSpeedIntent)initWithCoder:(id)a3
{
  return (SetPlaybackSpeedIntent *)SetPlaybackSpeedIntent.init(coder:)(a3);
}

- (SetPlaybackSpeedIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_232A68588();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SetPlaybackSpeedIntent *)SetPlaybackSpeedIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetPlaybackSpeedIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SetPlaybackSpeedIntent *)SetPlaybackSpeedIntent.init(domain:verb:parametersByName:)();
}

@end