@interface SetCarRadioStationIntentResponse
- (SetCarRadioStationIntentResponse)init;
- (SetCarRadioStationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetCarRadioStationIntentResponse)initWithCoder:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetCarRadioStationIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (SetCarRadioStationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(SetCarRadioStationIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(SetCarRadioStationIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (SetCarRadioStationIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SetCarRadioStationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetCarRadioStationIntentResponse();
  return [(SetCarRadioStationIntentResponse *)&v3 init];
}

- (SetCarRadioStationIntentResponse)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SetCarRadioStationIntentResponse_code) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SetCarRadioStationIntentResponse();
  return [(SetCarRadioStationIntentResponse *)&v5 initWithCoder:a3];
}

@end