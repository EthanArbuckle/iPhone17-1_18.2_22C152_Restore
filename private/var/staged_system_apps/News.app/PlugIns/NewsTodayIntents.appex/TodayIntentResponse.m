@interface TodayIntentResponse
- (TodayIntentResponse)init;
- (TodayIntentResponse)initWithBackingStore:(id)a3;
- (TodayIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (TodayIntentResponse)initWithCoder:(id)a3;
- (TodayIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation TodayIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TodayIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___TodayIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (TodayIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(TodayIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___TodayIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(TodayIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (TodayIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___TodayIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [(TodayIntentResponse *)&v3 init];
}

- (TodayIntentResponse)initWithCoder:(id)a3
{
  return (TodayIntentResponse *)sub_10000EAFC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (TodayIntentResponse)initWithBackingStore:(id)a3
{
  return (TodayIntentResponse *)sub_10000EAFC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (TodayIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_10000FCF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (TodayIntentResponse *)TodayIntentResponse.init(propertiesByName:)(v3);
}

@end