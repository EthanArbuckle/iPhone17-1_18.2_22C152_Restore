@interface DevicePropertyObserver
- (_TtC14nptocompaniond22DevicePropertyObserver)init;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
@end

@implementation DevicePropertyObserver

- (void)dealloc
{
  v2 = self;
  sub_1000066E0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC14nptocompaniond22DevicePropertyObserver)init
{
  result = (_TtC14nptocompaniond22DevicePropertyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  if (!a4)
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v15, 0, sizeof(v15));
    id v13 = a3;
    v14 = self;
    goto LABEL_6;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
LABEL_6:
  sub_100006850(a3, v8, v10);

  swift_bridgeObjectRelease();
  sub_100006AE4((uint64_t)v15);
}

@end