@interface CalculatorMDMRestrictionsManager
- (_TtC10Calculator32CalculatorMDMRestrictionsManager)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation CalculatorMDMRestrictionsManager

- (_TtC10Calculator32CalculatorMDMRestrictionsManager)init
{
  return (_TtC10Calculator32CalculatorMDMRestrictionsManager *)sub_10000B738();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 sharedConnection];
  if (v6)
  {
    v7 = v6;
    [v6 unregisterObserver:v5];

    v8.receiver = v5;
    v8.super_class = ObjectType;
    [(CalculatorMDMRestrictionsManager *)&v8 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10Calculator32CalculatorMDMRestrictionsManager___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  sub_10007063C(a3);

  swift_bridgeObjectRelease();
}

@end