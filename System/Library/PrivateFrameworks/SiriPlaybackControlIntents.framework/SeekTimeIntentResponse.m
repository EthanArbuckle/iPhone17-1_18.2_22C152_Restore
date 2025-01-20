@interface SeekTimeIntentResponse
- (SeekTimeIntentResponse)init;
- (SeekTimeIntentResponse)initWithBackingStore:(id)a3;
- (SeekTimeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SeekTimeIntentResponse)initWithCoder:(id)a3;
- (SeekTimeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SeekTimeIntentResponse

- (int64_t)code
{
  return sub_232A50F24();
}

- (void)setCode:(int64_t)a3
{
}

- (SeekTimeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SeekTimeIntentResponse)init
{
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init()();
}

- (SeekTimeIntentResponse)initWithCoder:(id)a3
{
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init(coder:)(a3);
}

- (SeekTimeIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init(backingStore:)(a3);
}

- (SeekTimeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init(propertiesByName:)(v3);
}

@end