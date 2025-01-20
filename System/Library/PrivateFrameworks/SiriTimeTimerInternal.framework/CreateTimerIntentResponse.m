@interface CreateTimerIntentResponse
- (CreateTimerIntentResponse)init;
- (CreateTimerIntentResponse)initWithBackingStore:(id)a3;
- (CreateTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (CreateTimerIntentResponse)initWithCoder:(id)a3;
- (CreateTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation CreateTimerIntentResponse

- (CreateTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CreateTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CreateTimerIntentResponse();
  return [(CreateTimerIntentResponse *)&v3 init];
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___CreateTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CreateTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (CreateTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (CreateTimerIntentResponse *)sub_25DD173E8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (CreateTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(CreateTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___CreateTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(CreateTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (CreateTimerIntentResponse)initWithCoder:(id)a3
{
  return (CreateTimerIntentResponse *)sub_25DD173E8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (CreateTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (CreateTimerIntentResponse *)CreateTimerIntentResponse.init(propertiesByName:)(v3);
}

@end