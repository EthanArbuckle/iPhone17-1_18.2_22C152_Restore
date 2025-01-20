@interface CSDBlockUtilities
- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4;
- (CSDBlockUtilities)init;
- (int64_t)blockCallReasonForHandles:(id)a3 providerIdentifier:(id)a4 callDataSource:(id)a5;
- (void)reportFailureForReason:(int64_t)a3 provider:(id)a4 callUUID:(id)a5 actionToFail:(id)a6;
@end

@implementation CSDBlockUtilities

- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4
{
  sub_1001F6204(0, (unint64_t *)&unk_1005888A0);
  sub_100210D5C((unint64_t *)&qword_1005858C0, (unint64_t *)&unk_1005888A0);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  char v7 = sub_100210750(v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (int64_t)blockCallReasonForHandles:(id)a3 providerIdentifier:(id)a4 callDataSource:(id)a5
{
  sub_1001F6204(0, (unint64_t *)&unk_100586190);
  sub_100210D5C((unint64_t *)&unk_100585430, (unint64_t *)&unk_100586190);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a5;
  v12 = self;
  int64_t v13 = sub_100210884(v7, v8, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

- (void)reportFailureForReason:(int64_t)a3 provider:(id)a4 callUUID:(id)a5 actionToFail:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a4;
  id v15 = a6;
  v16 = self;
  sub_1002109C4(a3, v14, (uint64_t)v13, a6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (CSDBlockUtilities)init
{
  return (CSDBlockUtilities *)sub_100210C7C();
}

- (void).cxx_destruct
{
}

@end