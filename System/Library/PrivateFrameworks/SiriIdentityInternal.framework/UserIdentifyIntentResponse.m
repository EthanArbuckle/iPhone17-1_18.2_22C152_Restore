@interface UserIdentifyIntentResponse
- (UserIdentifyIntentResponse)init;
- (UserIdentifyIntentResponse)initWithBackingStore:(id)a3;
- (UserIdentifyIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (UserIdentifyIntentResponse)initWithCoder:(id)a3;
- (UserIdentifyIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation UserIdentifyIntentResponse

- (int64_t)code
{
  return UserIdentifyIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (UserIdentifyIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init(code:userActivity:)(a3, a4);
}

- (UserIdentifyIntentResponse)init
{
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init()();
}

- (UserIdentifyIntentResponse)initWithCoder:(id)a3
{
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init(coder:)(a3);
}

- (UserIdentifyIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init(backingStore:)(a3);
}

- (UserIdentifyIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25C8EC110();
  }
  else {
    uint64_t v3 = 0;
  }
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init(propertiesByName:)(v3);
}

@end