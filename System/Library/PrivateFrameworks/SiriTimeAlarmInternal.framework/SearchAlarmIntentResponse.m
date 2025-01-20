@interface SearchAlarmIntentResponse
- (SearchAlarmIntentResponse)init;
- (SearchAlarmIntentResponse)initWithBackingStore:(id)a3;
- (SearchAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SearchAlarmIntentResponse)initWithCoder:(id)a3;
- (SearchAlarmIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SearchAlarmIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SearchAlarmIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SearchAlarmIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (SearchAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(SearchAlarmIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SearchAlarmIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(SearchAlarmIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (SearchAlarmIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SearchAlarmIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchAlarmIntentResponse();
  return [(SearchAlarmIntentResponse *)&v3 init];
}

- (SearchAlarmIntentResponse)initWithCoder:(id)a3
{
  return (SearchAlarmIntentResponse *)sub_25DC90414((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (SearchAlarmIntentResponse)initWithBackingStore:(id)a3
{
  return (SearchAlarmIntentResponse *)sub_25DC90414((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (SearchAlarmIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25DC95E40();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SearchAlarmIntentResponse *)SearchAlarmIntentResponse.init(propertiesByName:)(v3);
}

@end