@interface ObservabilityXPCTimerActivity
- (_TtC16promotedcontentd29ObservabilityXPCTimerActivity)init;
- (void)checkin;
@end

@implementation ObservabilityXPCTimerActivity

- (_TtC16promotedcontentd29ObservabilityXPCTimerActivity)init
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for ObservabilityXPCTimerActivityDelegate());
  v4 = self;
  id v5 = [v3 init];
  id v6 = [objc_allocWithZone((Class)APXPCActivity) initWithDelegate:v5];

  v7 = (objc_class *)type metadata accessor for ObservabilityXPCTimerActivity();
  v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivityDelegate] = v5;
  *(void *)&v8[OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivity] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  v9 = [(ObservabilityXPCTimerActivity *)&v11 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (void)checkin
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivity));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivityDelegate);
}

@end