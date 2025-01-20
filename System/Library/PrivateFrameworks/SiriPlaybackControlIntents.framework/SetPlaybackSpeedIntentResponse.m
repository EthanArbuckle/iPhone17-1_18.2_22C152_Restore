@interface SetPlaybackSpeedIntentResponse
- (SetPlaybackSpeedIntentResponse)init;
- (SetPlaybackSpeedIntentResponse)initWithBackingStore:(id)a3;
- (SetPlaybackSpeedIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetPlaybackSpeedIntentResponse)initWithCoder:(id)a3;
- (SetPlaybackSpeedIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetPlaybackSpeedIntentResponse

- (int64_t)code
{
  return sub_232A59374();
}

- (void)setCode:(int64_t)a3
{
}

- (SetPlaybackSpeedIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetPlaybackSpeedIntentResponse)init
{
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init()();
}

- (SetPlaybackSpeedIntentResponse)initWithCoder:(id)a3
{
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init(coder:)(a3);
}

- (SetPlaybackSpeedIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init(backingStore:)(a3);
}

- (SetPlaybackSpeedIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetPlaybackSpeedIntentResponse *)SetPlaybackSpeedIntentResponse.init(propertiesByName:)(v3);
}

@end