@interface PlayLiveServiceIntentResponse
- (PlayLiveServiceIntentResponse)init;
- (PlayLiveServiceIntentResponse)initWithBackingStore:(id)a3;
- (PlayLiveServiceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (PlayLiveServiceIntentResponse)initWithCoder:(id)a3;
- (PlayLiveServiceIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation PlayLiveServiceIntentResponse

- (int64_t)code
{
  return PlayLiveServiceIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (PlayLiveServiceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init(code:userActivity:)(a3, a4);
}

- (PlayLiveServiceIntentResponse)init
{
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init()();
}

- (PlayLiveServiceIntentResponse)initWithCoder:(id)a3
{
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init(coder:)(a3);
}

- (PlayLiveServiceIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init(backingStore:)(a3);
}

- (PlayLiveServiceIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22BD4ACF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init(propertiesByName:)(v3);
}

@end