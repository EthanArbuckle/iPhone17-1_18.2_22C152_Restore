@interface CSDBlocklistUtilities
- (BOOL)blockListContainsHandles:(id)a3 providerIdentifier:(id)a4;
- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4;
- (CSDBlocklistUtilities)init;
@end

@implementation CSDBlocklistUtilities

- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4
{
  sub_1001F6204(0, (unint64_t *)&unk_1005888A0);
  sub_100210D5C((unint64_t *)&qword_1005858C0, (unint64_t *)&unk_1005888A0);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  char v7 = sub_100312858(v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (BOOL)blockListContainsHandles:(id)a3 providerIdentifier:(id)a4
{
  sub_1001F6204(0, (unint64_t *)&unk_100586190);
  sub_100210D5C((unint64_t *)&unk_100585430, (unint64_t *)&unk_100586190);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_1003128B8(v5);
  char v8 = v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (CSDBlocklistUtilities)init
{
  return (CSDBlocklistUtilities *)sub_1002CBFB8();
}

@end