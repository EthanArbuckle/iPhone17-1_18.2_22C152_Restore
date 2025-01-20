@interface SetShuffleStateIntentResponse
- (SetShuffleStateIntentResponse)init;
- (SetShuffleStateIntentResponse)initWithBackingStore:(id)a3;
- (SetShuffleStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetShuffleStateIntentResponse)initWithCoder:(id)a3;
- (SetShuffleStateIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetShuffleStateIntentResponse

- (int64_t)code
{
  return sub_232A52100();
}

- (void)setCode:(int64_t)a3
{
}

- (SetShuffleStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetShuffleStateIntentResponse)init
{
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init()();
}

- (SetShuffleStateIntentResponse)initWithCoder:(id)a3
{
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init(coder:)(a3);
}

- (SetShuffleStateIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init(backingStore:)(a3);
}

- (SetShuffleStateIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init(propertiesByName:)(v3);
}

@end