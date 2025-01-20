@interface PlaySoundIntentResponse
- (PlaySoundIntentResponse)init;
- (PlaySoundIntentResponse)initWithBackingStore:(id)a3;
- (PlaySoundIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (PlaySoundIntentResponse)initWithCoder:(id)a3;
- (PlaySoundIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation PlaySoundIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PlaySoundIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PlaySoundIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (PlaySoundIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(PlaySoundIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___PlaySoundIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(PlaySoundIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (PlaySoundIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PlaySoundIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaySoundIntentResponse();
  return [(PlaySoundIntentResponse *)&v3 init];
}

- (PlaySoundIntentResponse)initWithCoder:(id)a3
{
  return (PlaySoundIntentResponse *)sub_100547DF0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (PlaySoundIntentResponse)initWithBackingStore:(id)a3
{
  return (PlaySoundIntentResponse *)sub_100547DF0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (PlaySoundIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (PlaySoundIntentResponse *)PlaySoundIntentResponse.init(propertiesByName:)(v3);
}

@end