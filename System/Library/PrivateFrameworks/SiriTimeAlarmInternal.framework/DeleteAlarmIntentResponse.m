@interface DeleteAlarmIntentResponse
- (DeleteAlarmIntentResponse)init;
- (DeleteAlarmIntentResponse)initWithBackingStore:(id)a3;
- (DeleteAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DeleteAlarmIntentResponse)initWithCoder:(id)a3;
- (DeleteAlarmIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DeleteAlarmIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___DeleteAlarmIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___DeleteAlarmIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (DeleteAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(DeleteAlarmIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___DeleteAlarmIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(DeleteAlarmIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (DeleteAlarmIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___DeleteAlarmIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeleteAlarmIntentResponse();
  return [(DeleteAlarmIntentResponse *)&v3 init];
}

- (DeleteAlarmIntentResponse)initWithCoder:(id)a3
{
  return (DeleteAlarmIntentResponse *)sub_25DC8F1F8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (DeleteAlarmIntentResponse)initWithBackingStore:(id)a3
{
  return (DeleteAlarmIntentResponse *)sub_25DC8F1F8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (DeleteAlarmIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DC95E40();
  }
  else {
    uint64_t v3 = 0;
  }
  return (DeleteAlarmIntentResponse *)DeleteAlarmIntentResponse.init(propertiesByName:)(v3);
}

@end