@interface MoveSpeakerIntentResponse
- (MoveSpeakerIntentResponse)init;
- (MoveSpeakerIntentResponse)initWithBackingStore:(id)a3;
- (MoveSpeakerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (MoveSpeakerIntentResponse)initWithCoder:(id)a3;
- (MoveSpeakerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation MoveSpeakerIntentResponse

- (int64_t)code
{
  return sub_232A57538();
}

- (void)setCode:(int64_t)a3
{
}

- (MoveSpeakerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init(code:userActivity:)(a3, a4);
}

- (MoveSpeakerIntentResponse)init
{
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init()();
}

- (MoveSpeakerIntentResponse)initWithCoder:(id)a3
{
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init(coder:)(a3);
}

- (MoveSpeakerIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init(backingStore:)(a3);
}

- (MoveSpeakerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (MoveSpeakerIntentResponse *)MoveSpeakerIntentResponse.init(propertiesByName:)(v3);
}

@end