@interface SecurityAccessoryConfigurationIntentResponse
- (SecurityAccessoryConfigurationIntentResponse)init;
- (SecurityAccessoryConfigurationIntentResponse)initWithBackingStore:(id)a3;
- (SecurityAccessoryConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SecurityAccessoryConfigurationIntentResponse)initWithCoder:(id)a3;
- (SecurityAccessoryConfigurationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SecurityAccessoryConfigurationIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (SecurityAccessoryConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(SecurityAccessoryConfigurationIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(SecurityAccessoryConfigurationIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (SecurityAccessoryConfigurationIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  return [(SecurityAccessoryConfigurationIntentResponse *)&v3 init];
}

- (SecurityAccessoryConfigurationIntentResponse)initWithCoder:(id)a3
{
  return (SecurityAccessoryConfigurationIntentResponse *)sub_100027A54((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (SecurityAccessoryConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (SecurityAccessoryConfigurationIntentResponse *)sub_100027A54((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (SecurityAccessoryConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_100029E88();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SecurityAccessoryConfigurationIntentResponse *)SecurityAccessoryConfigurationIntentResponse.init(propertiesByName:)(v3);
}

@end