@interface CreateAlarmIntentResponse
- (CreateAlarmIntentResponse)init;
- (CreateAlarmIntentResponse)initWithBackingStore:(id)a3;
- (CreateAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (CreateAlarmIntentResponse)initWithCoder:(id)a3;
- (CreateAlarmIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation CreateAlarmIntentResponse

- (CreateAlarmIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CreateAlarmIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CreateAlarmIntentResponse();
  return [(CreateAlarmIntentResponse *)&v3 init];
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___CreateAlarmIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CreateAlarmIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (CreateAlarmIntentResponse)initWithBackingStore:(id)a3
{
  return (CreateAlarmIntentResponse *)sub_25DC8B4D0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (CreateAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(CreateAlarmIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___CreateAlarmIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(CreateAlarmIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (CreateAlarmIntentResponse)initWithCoder:(id)a3
{
  return (CreateAlarmIntentResponse *)sub_25DC8B4D0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (CreateAlarmIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DC95E40();
  }
  else {
    uint64_t v3 = 0;
  }
  return (CreateAlarmIntentResponse *)CreateAlarmIntentResponse.init(propertiesByName:)(v3);
}

@end