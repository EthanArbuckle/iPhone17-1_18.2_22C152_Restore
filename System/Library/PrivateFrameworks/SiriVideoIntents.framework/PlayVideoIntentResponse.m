@interface PlayVideoIntentResponse
- (PlayVideoIntentResponse)init;
- (PlayVideoIntentResponse)initWithBackingStore:(id)a3;
- (PlayVideoIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (PlayVideoIntentResponse)initWithCoder:(id)a3;
- (PlayVideoIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation PlayVideoIntentResponse

- (int64_t)code
{
  return PlayVideoIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (PlayVideoIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init(code:userActivity:)(a3, a4);
}

- (PlayVideoIntentResponse)init
{
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init()();
}

- (PlayVideoIntentResponse)initWithCoder:(id)a3
{
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init(coder:)(a3);
}

- (PlayVideoIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init(backingStore:)(a3);
}

- (PlayVideoIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22BD4ACF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init(propertiesByName:)(v3);
}

@end