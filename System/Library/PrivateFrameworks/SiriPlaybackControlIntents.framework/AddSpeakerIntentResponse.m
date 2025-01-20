@interface AddSpeakerIntentResponse
- (AddSpeakerIntentResponse)init;
- (AddSpeakerIntentResponse)initWithBackingStore:(id)a3;
- (AddSpeakerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (AddSpeakerIntentResponse)initWithCoder:(id)a3;
- (AddSpeakerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation AddSpeakerIntentResponse

- (int64_t)code
{
  return sub_232A562EC();
}

- (void)setCode:(int64_t)a3
{
}

- (AddSpeakerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init(code:userActivity:)(a3, a4);
}

- (AddSpeakerIntentResponse)init
{
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init()();
}

- (AddSpeakerIntentResponse)initWithCoder:(id)a3
{
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init(coder:)(a3);
}

- (AddSpeakerIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init(backingStore:)(a3);
}

- (AddSpeakerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (AddSpeakerIntentResponse *)AddSpeakerIntentResponse.init(propertiesByName:)(v3);
}

@end