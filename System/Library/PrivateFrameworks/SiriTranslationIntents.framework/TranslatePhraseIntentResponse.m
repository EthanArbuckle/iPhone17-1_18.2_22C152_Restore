@interface TranslatePhraseIntentResponse
- (TranslatePhraseIntentResponse)init;
- (TranslatePhraseIntentResponse)initWithBackingStore:(id)a3;
- (TranslatePhraseIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (TranslatePhraseIntentResponse)initWithCoder:(id)a3;
- (TranslatePhraseIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation TranslatePhraseIntentResponse

- (int64_t)code
{
  return TranslatePhraseIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (TranslatePhraseIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init(code:userActivity:)(a3, a4);
}

- (TranslatePhraseIntentResponse)init
{
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init()();
}

- (TranslatePhraseIntentResponse)initWithCoder:(id)a3
{
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init(coder:)(a3);
}

- (TranslatePhraseIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init(backingStore:)(a3);
}

- (TranslatePhraseIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_236FB28E0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (TranslatePhraseIntentResponse *)TranslatePhraseIntentResponse.init(propertiesByName:)(v3);
}

@end