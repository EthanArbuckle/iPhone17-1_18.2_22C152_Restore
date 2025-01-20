@interface SetAudioLanguageIntentResponse
- (SetAudioLanguageIntentResponse)init;
- (SetAudioLanguageIntentResponse)initWithBackingStore:(id)a3;
- (SetAudioLanguageIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetAudioLanguageIntentResponse)initWithCoder:(id)a3;
- (SetAudioLanguageIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetAudioLanguageIntentResponse

- (int64_t)code
{
  return sub_232A4EB48();
}

- (void)setCode:(int64_t)a3
{
}

- (SetAudioLanguageIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetAudioLanguageIntentResponse)init
{
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init()();
}

- (SetAudioLanguageIntentResponse)initWithCoder:(id)a3
{
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init(coder:)(a3);
}

- (SetAudioLanguageIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init(backingStore:)(a3);
}

- (SetAudioLanguageIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetAudioLanguageIntentResponse *)SetAudioLanguageIntentResponse.init(propertiesByName:)(v3);
}

@end