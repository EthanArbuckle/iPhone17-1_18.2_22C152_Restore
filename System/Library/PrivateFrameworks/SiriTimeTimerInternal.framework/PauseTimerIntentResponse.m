@interface PauseTimerIntentResponse
- (PauseTimerIntentResponse)init;
- (PauseTimerIntentResponse)initWithBackingStore:(id)a3;
- (PauseTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (PauseTimerIntentResponse)initWithCoder:(id)a3;
- (PauseTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation PauseTimerIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PauseTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PauseTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (PauseTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(PauseTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___PauseTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(PauseTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (PauseTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PauseTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PauseTimerIntentResponse();
  return [(PauseTimerIntentResponse *)&v3 init];
}

- (PauseTimerIntentResponse)initWithCoder:(id)a3
{
  return (PauseTimerIntentResponse *)sub_25DD1B4D0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (PauseTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (PauseTimerIntentResponse *)sub_25DD1B4D0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (PauseTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (PauseTimerIntentResponse *)PauseTimerIntentResponse.init(propertiesByName:)(v3);
}

@end