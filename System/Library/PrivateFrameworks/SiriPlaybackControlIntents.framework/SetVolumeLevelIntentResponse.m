@interface SetVolumeLevelIntentResponse
- (SetVolumeLevelIntentResponse)init;
- (SetVolumeLevelIntentResponse)initWithBackingStore:(id)a3;
- (SetVolumeLevelIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetVolumeLevelIntentResponse)initWithCoder:(id)a3;
- (SetVolumeLevelIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetVolumeLevelIntentResponse

- (SetVolumeLevelIntentResponse)init
{
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init()();
}

- (void)setCode:(int64_t)a3
{
}

- (int64_t)code
{
  return sub_232843B28();
}

- (SetVolumeLevelIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init(backingStore:)(a3);
}

- (SetVolumeLevelIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetVolumeLevelIntentResponse)initWithCoder:(id)a3
{
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init(coder:)(a3);
}

- (SetVolumeLevelIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init(propertiesByName:)(v3);
}

@end