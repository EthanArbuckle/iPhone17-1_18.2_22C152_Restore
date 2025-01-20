@interface ResetTimerIntentResponse
- (ResetTimerIntentResponse)init;
- (ResetTimerIntentResponse)initWithBackingStore:(id)a3;
- (ResetTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ResetTimerIntentResponse)initWithCoder:(id)a3;
- (ResetTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ResetTimerIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ResetTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ResetTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ResetTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ResetTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ResetTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ResetTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ResetTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ResetTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ResetTimerIntentResponse();
  return [(ResetTimerIntentResponse *)&v3 init];
}

- (ResetTimerIntentResponse)initWithCoder:(id)a3
{
  return (ResetTimerIntentResponse *)sub_25DD1A444((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ResetTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (ResetTimerIntentResponse *)sub_25DD1A444((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ResetTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ResetTimerIntentResponse *)ResetTimerIntentResponse.init(propertiesByName:)(v3);
}

@end