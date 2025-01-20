@interface SetGeoFenceIntentResponse
- (SetGeoFenceIntentResponse)init;
- (SetGeoFenceIntentResponse)initWithBackingStore:(id)a3;
- (SetGeoFenceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetGeoFenceIntentResponse)initWithCoder:(id)a3;
- (SetGeoFenceIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetGeoFenceIntentResponse

- (int64_t)code
{
  return SetGeoFenceIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (SetGeoFenceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetGeoFenceIntentResponse)init
{
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init()();
}

- (SetGeoFenceIntentResponse)initWithCoder:(id)a3
{
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init(coder:)(a3);
}

- (SetGeoFenceIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init(backingStore:)(a3);
}

- (SetGeoFenceIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1D463F868();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init(propertiesByName:)(v3);
}

@end