@interface DismissTimerIntentResponse
- (DismissTimerIntentResponse)init;
- (DismissTimerIntentResponse)initWithBackingStore:(id)a3;
- (DismissTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DismissTimerIntentResponse)initWithCoder:(id)a3;
- (DismissTimerIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DismissTimerIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___DismissTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___DismissTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (DismissTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(DismissTimerIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___DismissTimerIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(DismissTimerIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (DismissTimerIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___DismissTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DismissTimerIntentResponse();
  return [(DismissTimerIntentResponse *)&v3 init];
}

- (DismissTimerIntentResponse)initWithCoder:(id)a3
{
  return (DismissTimerIntentResponse *)sub_25DD150E4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (DismissTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (DismissTimerIntentResponse *)sub_25DD150E4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (DismissTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DD202C8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (DismissTimerIntentResponse *)DismissTimerIntentResponse.init(propertiesByName:)(v3);
}

@end