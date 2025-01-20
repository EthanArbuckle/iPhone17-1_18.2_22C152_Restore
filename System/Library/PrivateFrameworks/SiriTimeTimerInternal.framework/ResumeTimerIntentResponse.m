@interface ResumeTimerIntentResponse
- (ResumeTimerIntentResponse)init;
- (ResumeTimerIntentResponse)initWithBackingStore:(id)a3;
- (ResumeTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ResumeTimerIntentResponse)initWithCoder:(id)a3;
- (ResumeTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ResumeTimerIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ResumeTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ResumeTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ResumeTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ResumeTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ResumeTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ResumeTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ResumeTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ResumeTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ResumeTimerIntentResponse();
  return [(ResumeTimerIntentResponse *)&v3 init];
}

- (ResumeTimerIntentResponse)initWithCoder:(id)a3
{
  return (ResumeTimerIntentResponse *)sub_25DD1C4F0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ResumeTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (ResumeTimerIntentResponse *)sub_25DD1C4F0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ResumeTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ResumeTimerIntentResponse *)ResumeTimerIntentResponse.init(propertiesByName:)(v3);
}

@end