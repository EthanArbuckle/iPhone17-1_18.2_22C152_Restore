@interface AONSenseSampleProvider
+ (BOOL)AONSENSE_FRAMEWORK_AVAILABLE;
+ (_TtC19ProximityDaemonCore22AONSenseSampleProvider)shared;
- (_TtC19ProximityDaemonCore22AONSenseSampleProvider)init;
- (void)registerWithQueue:(id)a3 callback:(id)a4;
@end

@implementation AONSenseSampleProvider

+ (BOOL)AONSENSE_FRAMEWORK_AVAILABLE
{
  return 1;
}

+ (_TtC19ProximityDaemonCore22AONSenseSampleProvider)shared
{
  if (qword_1008AA298 != -1) {
    swift_once();
  }
  v2 = (void *)static AONSenseSampleProvider.shared;

  return (_TtC19ProximityDaemonCore22AONSenseSampleProvider *)v2;
}

- (void)registerWithQueue:(id)a3 callback:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  AONSenseSampleProvider.register(queue:callback:)(v8, (uint64_t)sub_10032A184, v7);

  swift_release();
}

- (_TtC19ProximityDaemonCore22AONSenseSampleProvider)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__callout);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__aonSense) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AONSenseSampleProvider();
  return [(AONSenseSampleProvider *)&v4 init];
}

- (void).cxx_destruct
{
  sub_100327FCC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__callout));

  swift_release();
}

@end