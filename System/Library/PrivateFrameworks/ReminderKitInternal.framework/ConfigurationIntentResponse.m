@interface ConfigurationIntentResponse
- (ConfigurationIntentResponse)init;
- (ConfigurationIntentResponse)initWithBackingStore:(id)a3;
- (ConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ConfigurationIntentResponse)initWithCoder:(id)a3;
- (ConfigurationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ConfigurationIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ConfigurationIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ConfigurationIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ConfigurationIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ConfigurationIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return [(ConfigurationIntentResponse *)&v3 init];
}

- (ConfigurationIntentResponse)initWithCoder:(id)a3
{
  return (ConfigurationIntentResponse *)sub_1A757033C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (ConfigurationIntentResponse *)sub_1A757033C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1A75723F0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ConfigurationIntentResponse *)ConfigurationIntentResponse.init(propertiesByName:)(v3);
}

@end