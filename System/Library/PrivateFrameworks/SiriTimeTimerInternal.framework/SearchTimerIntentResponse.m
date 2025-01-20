@interface SearchTimerIntentResponse
- (SearchTimerIntentResponse)init;
- (SearchTimerIntentResponse)initWithBackingStore:(id)a3;
- (SearchTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SearchTimerIntentResponse)initWithCoder:(id)a3;
- (SearchTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SearchTimerIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SearchTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SearchTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (SearchTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(SearchTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SearchTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(SearchTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (SearchTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SearchTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTimerIntentResponse();
  return [(SearchTimerIntentResponse *)&v3 init];
}

- (SearchTimerIntentResponse)initWithCoder:(id)a3
{
  return (SearchTimerIntentResponse *)sub_25DD1626C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (SearchTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (SearchTimerIntentResponse *)sub_25DD1626C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (SearchTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SearchTimerIntentResponse *)SearchTimerIntentResponse.init(propertiesByName:)(v3);
}

@end