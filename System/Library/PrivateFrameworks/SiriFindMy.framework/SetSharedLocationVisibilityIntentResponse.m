@interface SetSharedLocationVisibilityIntentResponse
- (SetSharedLocationVisibilityIntentResponse)init;
- (SetSharedLocationVisibilityIntentResponse)initWithBackingStore:(id)a3;
- (SetSharedLocationVisibilityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetSharedLocationVisibilityIntentResponse)initWithCoder:(id)a3;
- (SetSharedLocationVisibilityIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetSharedLocationVisibilityIntentResponse

- (int64_t)code
{
  return SetSharedLocationVisibilityIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (SetSharedLocationVisibilityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetSharedLocationVisibilityIntentResponse)init
{
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init()();
}

- (SetSharedLocationVisibilityIntentResponse)initWithCoder:(id)a3
{
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init(coder:)(a3);
}

- (SetSharedLocationVisibilityIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init(backingStore:)(a3);
}

- (SetSharedLocationVisibilityIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1D463F868();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init(propertiesByName:)(v3);
}

@end