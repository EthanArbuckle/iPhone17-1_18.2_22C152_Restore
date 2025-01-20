@interface CSDCallHistoryCallFilter
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (CSDCallHistoryCallFilter)init;
- (CSDCallHistoryCallFilter)initWithChManager:(id)a3;
@end

@implementation CSDCallHistoryCallFilter

- (CSDCallHistoryCallFilter)initWithChManager:(id)a3
{
  return (CSDCallHistoryCallFilter *)sub_10036F694((uint64_t)a3);
}

- (BOOL)isUnknownCaller:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10036F71C(v4);

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
  BOOL v13 = sub_10036FA8C(v7, v9, v10, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

- (CSDCallHistoryCallFilter)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end