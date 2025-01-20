@interface GetVolumeLevelIntentResponse
- (GetVolumeLevelIntentResponse)init;
- (GetVolumeLevelIntentResponse)initWithBackingStore:(id)a3;
- (GetVolumeLevelIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetVolumeLevelIntentResponse)initWithCoder:(id)a3;
- (GetVolumeLevelIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetVolumeLevelIntentResponse

- (int64_t)code
{
  return sub_232A542A8();
}

- (void)setCode:(int64_t)a3
{
}

- (GetVolumeLevelIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetVolumeLevelIntentResponse)init
{
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init()();
}

- (GetVolumeLevelIntentResponse)initWithCoder:(id)a3
{
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init(coder:)(a3);
}

- (GetVolumeLevelIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init(backingStore:)(a3);
}

- (GetVolumeLevelIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init(propertiesByName:)(v3);
}

@end