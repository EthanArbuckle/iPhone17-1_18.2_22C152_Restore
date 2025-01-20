@interface ToggleLocationSharingIntentResponse
+ (id)continueInAppIntentResponseWithState:(int64_t)a3;
+ (id)failureRequiringAppLaunchIntentResponseWithState:(int64_t)a3;
+ (id)inProgressIntentResponseWithState:(int64_t)a3;
+ (id)readyIntentResponseWithState:(int64_t)a3;
+ (id)successIntentResponseWithState:(int64_t)a3;
+ (id)unspecifiedIntentResponseWithState:(int64_t)a3;
- (ToggleLocationSharingIntentResponse)init;
- (ToggleLocationSharingIntentResponse)initWithBackingStore:(id)a3;
- (ToggleLocationSharingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ToggleLocationSharingIntentResponse)initWithCoder:(id)a3;
- (ToggleLocationSharingIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ToggleLocationSharingIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ToggleLocationSharingIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___ToggleLocationSharingIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ToggleLocationSharingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(ToggleLocationSharingIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ToggleLocationSharingIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(ToggleLocationSharingIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

+ (id)unspecifiedIntentResponseWithState:(int64_t)a3
{
  v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()) init];
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  swift_beginAccess();
  *(void *)v5 = 0;
  [v4 setUserActivity:0];
  [v4 setState:a3];

  return v4;
}

+ (id)readyIntentResponseWithState:(int64_t)a3
{
  v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()) init];
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  swift_beginAccess();
  *(void *)v5 = 1;
  [v4 setUserActivity:0];
  [v4 setState:a3];

  return v4;
}

+ (id)continueInAppIntentResponseWithState:(int64_t)a3
{
  v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()) init];
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  swift_beginAccess();
  *(void *)v5 = 2;
  [v4 setUserActivity:0];
  [v4 setState:a3];

  return v4;
}

+ (id)inProgressIntentResponseWithState:(int64_t)a3
{
  v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()) init];
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  swift_beginAccess();
  *(void *)v5 = 3;
  [v4 setUserActivity:0];
  [v4 setState:a3];

  return v4;
}

+ (id)successIntentResponseWithState:(int64_t)a3
{
  v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()) init];
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  swift_beginAccess();
  *(void *)v5 = 4;
  [v4 setUserActivity:0];
  [v4 setState:a3];

  return v4;
}

+ (id)failureRequiringAppLaunchIntentResponseWithState:(int64_t)a3
{
  v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()) init];
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  swift_beginAccess();
  *(void *)v5 = 6;
  [v4 setUserActivity:0];
  [v4 setState:a3];

  return v4;
}

- (ToggleLocationSharingIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ToggleLocationSharingIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ToggleLocationSharingIntentResponse();
  return [(ToggleLocationSharingIntentResponse *)&v3 init];
}

- (ToggleLocationSharingIntentResponse)initWithCoder:(id)a3
{
  return (ToggleLocationSharingIntentResponse *)sub_100546750((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ToggleLocationSharingIntentResponse)initWithBackingStore:(id)a3
{
  return (ToggleLocationSharingIntentResponse *)sub_100546750((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ToggleLocationSharingIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ToggleLocationSharingIntentResponse *)ToggleLocationSharingIntentResponse.init(propertiesByName:)(v3);
}

@end