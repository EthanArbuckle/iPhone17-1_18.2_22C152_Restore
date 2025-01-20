@interface SetRoomDimmingStateIntentResponse
- (SetRoomDimmingStateIntentResponse)init;
- (SetRoomDimmingStateIntentResponse)initWithBackingStore:(id)a3;
- (SetRoomDimmingStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetRoomDimmingStateIntentResponse)initWithCoder:(id)a3;
- (SetRoomDimmingStateIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetRoomDimmingStateIntentResponse

- (int64_t)code
{
  return sub_232A58668();
}

- (void)setCode:(int64_t)a3
{
}

- (SetRoomDimmingStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetRoomDimmingStateIntentResponse)init
{
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init()();
}

- (SetRoomDimmingStateIntentResponse)initWithCoder:(id)a3
{
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init(coder:)(a3);
}

- (SetRoomDimmingStateIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init(backingStore:)(a3);
}

- (SetRoomDimmingStateIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init(propertiesByName:)(v3);
}

@end