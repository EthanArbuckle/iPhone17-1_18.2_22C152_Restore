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
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code);
}

- (void)setCode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code) = (Class)a3;
}

- (ConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ConfigurationIntentResponse *)self init];
  *(Class *)((char *)&v7->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code) = (Class)a3;
  v8 = v7;
  [(ConfigurationIntentResponse *)v8 setUserActivity:v6];

  return v8;
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
  return (ConfigurationIntentResponse *)sub_100012FA8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (ConfigurationIntentResponse *)sub_100012FA8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_100013F80();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ConfigurationIntentResponse *)sub_100013004(v3);
}

@end