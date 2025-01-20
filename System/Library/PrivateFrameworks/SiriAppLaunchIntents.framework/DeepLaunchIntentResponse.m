@interface DeepLaunchIntentResponse
- (DeepLaunchIntentResponse)init;
- (DeepLaunchIntentResponse)initWithBackingStore:(id)a3;
- (DeepLaunchIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DeepLaunchIntentResponse)initWithCoder:(id)a3;
- (DeepLaunchIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DeepLaunchIntentResponse

- (int64_t)code
{
  return DeepLaunchIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (DeepLaunchIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init(code:userActivity:)(a3, a4);
}

- (DeepLaunchIntentResponse)init
{
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init()();
}

- (DeepLaunchIntentResponse)initWithCoder:(id)a3
{
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init(coder:)(a3);
}

- (DeepLaunchIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init(backingStore:)(a3);
}

- (DeepLaunchIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_23785B640();
  }
  else {
    uint64_t v3 = 0;
  }
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init(propertiesByName:)(v3);
}

@end