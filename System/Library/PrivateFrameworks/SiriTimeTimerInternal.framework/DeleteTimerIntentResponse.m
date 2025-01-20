@interface DeleteTimerIntentResponse
- (DeleteTimerIntentResponse)init;
- (DeleteTimerIntentResponse)initWithBackingStore:(id)a3;
- (DeleteTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DeleteTimerIntentResponse)initWithCoder:(id)a3;
- (DeleteTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DeleteTimerIntentResponse

- (DeleteTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___DeleteTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeleteTimerIntentResponse();
  return [(DeleteTimerIntentResponse *)&v3 init];
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___DeleteTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___DeleteTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (DeleteTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (DeleteTimerIntentResponse *)sub_25DD183A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (DeleteTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(DeleteTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___DeleteTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(DeleteTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (DeleteTimerIntentResponse)initWithCoder:(id)a3
{
  return (DeleteTimerIntentResponse *)sub_25DD183A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (DeleteTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (DeleteTimerIntentResponse *)DeleteTimerIntentResponse.init(propertiesByName:)(v3);
}

@end