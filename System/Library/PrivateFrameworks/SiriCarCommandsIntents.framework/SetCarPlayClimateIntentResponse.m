@interface SetCarPlayClimateIntentResponse
- (SetCarPlayClimateIntentResponse)init;
- (SetCarPlayClimateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetCarPlayClimateIntentResponse)initWithCoder:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetCarPlayClimateIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (SetCarPlayClimateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(SetCarPlayClimateIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(SetCarPlayClimateIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (SetCarPlayClimateIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SetCarPlayClimateIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetCarPlayClimateIntentResponse();
  return [(SetCarPlayClimateIntentResponse *)&v3 init];
}

- (SetCarPlayClimateIntentResponse)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SetCarPlayClimateIntentResponse_code) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SetCarPlayClimateIntentResponse();
  return [(SetCarPlayClimateIntentResponse *)&v5 initWithCoder:a3];
}

@end