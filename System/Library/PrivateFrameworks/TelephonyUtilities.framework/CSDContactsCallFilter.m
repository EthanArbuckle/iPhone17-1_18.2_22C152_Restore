@interface CSDContactsCallFilter
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (CSDContactsCallFilter)init;
@end

@implementation CSDContactsCallFilter

- (BOOL)isUnknownCaller:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1002F34B8(v4);

  return self & 1;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  BOOL v13 = sub_1002F3C34(v7, v9, v10, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

- (CSDContactsCallFilter)init
{
  return (CSDContactsCallFilter *)sub_1002F4AA4();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CSDContactsCallFilter_carrierBundleController);
}

@end