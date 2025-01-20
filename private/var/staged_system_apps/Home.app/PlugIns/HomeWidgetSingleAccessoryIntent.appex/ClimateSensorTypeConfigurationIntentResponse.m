@interface ClimateSensorTypeConfigurationIntentResponse
- (ClimateSensorTypeConfigurationIntentResponse)init;
- (ClimateSensorTypeConfigurationIntentResponse)initWithBackingStore:(id)a3;
- (ClimateSensorTypeConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ClimateSensorTypeConfigurationIntentResponse)initWithCoder:(id)a3;
- (ClimateSensorTypeConfigurationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ClimateSensorTypeConfigurationIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ClimateSensorTypeConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ClimateSensorTypeConfigurationIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ClimateSensorTypeConfigurationIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (ClimateSensorTypeConfigurationIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  return [(ClimateSensorTypeConfigurationIntentResponse *)&v3 init];
}

- (ClimateSensorTypeConfigurationIntentResponse)initWithCoder:(id)a3
{
  return (ClimateSensorTypeConfigurationIntentResponse *)sub_100028640((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ClimateSensorTypeConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (ClimateSensorTypeConfigurationIntentResponse *)sub_100028640((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ClimateSensorTypeConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_100029E88();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ClimateSensorTypeConfigurationIntentResponse *)ClimateSensorTypeConfigurationIntentResponse.init(propertiesByName:)(v3);
}

@end