@interface LocateIntentResponse
- (LocateIntentResponse)init;
- (LocateIntentResponse)initWithBackingStore:(id)a3;
- (LocateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LocateIntentResponse)initWithCoder:(id)a3;
- (LocateIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LocateIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___LocateIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___LocateIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (LocateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(LocateIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___LocateIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(LocateIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (LocateIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___LocateIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocateIntentResponse();
  return [(LocateIntentResponse *)&v3 init];
}

- (LocateIntentResponse)initWithCoder:(id)a3
{
  return (LocateIntentResponse *)sub_1005453BC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (LocateIntentResponse)initWithBackingStore:(id)a3
{
  return (LocateIntentResponse *)sub_1005453BC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (LocateIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (LocateIntentResponse *)LocateIntentResponse.init(propertiesByName:)(v3);
}

@end