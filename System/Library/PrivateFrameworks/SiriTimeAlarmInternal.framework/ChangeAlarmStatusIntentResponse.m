@interface ChangeAlarmStatusIntentResponse
- (ChangeAlarmStatusIntentResponse)init;
- (ChangeAlarmStatusIntentResponse)initWithBackingStore:(id)a3;
- (ChangeAlarmStatusIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ChangeAlarmStatusIntentResponse)initWithCoder:(id)a3;
- (ChangeAlarmStatusIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ChangeAlarmStatusIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ChangeAlarmStatusIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ChangeAlarmStatusIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ChangeAlarmStatusIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ChangeAlarmStatusIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChangeAlarmStatusIntentResponse();
  return [(ChangeAlarmStatusIntentResponse *)&v3 init];
}

- (ChangeAlarmStatusIntentResponse)initWithCoder:(id)a3
{
  return (ChangeAlarmStatusIntentResponse *)sub_25DC8C604((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ChangeAlarmStatusIntentResponse)initWithBackingStore:(id)a3
{
  return (ChangeAlarmStatusIntentResponse *)sub_25DC8C604((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ChangeAlarmStatusIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DC95E40();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ChangeAlarmStatusIntentResponse *)ChangeAlarmStatusIntentResponse.init(propertiesByName:)(v3);
}

@end