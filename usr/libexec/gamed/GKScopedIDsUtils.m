@interface GKScopedIDsUtils
+ (id)batchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 desiredSize:(int64_t)a5;
+ (id)filterUnsupportedGameBundleIDs:(id)a3;
+ (id)incompletePlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDs:(id)a5;
+ (id)mergeWithScopedIDs:(id)a3 with:(id)a4;
- (GKScopedIDsUtils)init;
@end

@implementation GKScopedIDsUtils

+ (id)filterUnsupportedGameBundleIDs:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static ScopedIDsUtils.filterUnsupportedGameBundleIDs(_:)(v3);
  swift_bridgeObjectRelease();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

+ (id)batchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 desiredSize:(int64_t)a5
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static ScopedIDsUtils.batchRequest(playerIDs:gameBundleIDs:desiredSize:)(v6, v7, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for ScopedIDsBatchRequest();
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

+ (id)incompletePlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDs:(id)a5
{
  v5 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100163CE4(0, &qword_1003266A0);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static ScopedIDsUtils.incomplete(playerIDs:gameBundleIDs:scopedIDs:)(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

+ (id)mergeWithScopedIDs:(id)a3 with:(id)a4
{
  sub_100163CE4(0, &qword_1003266A0);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static ScopedIDsUtils.merge(scopedIDs:with:)(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (GKScopedIDsUtils)init
{
  return (GKScopedIDsUtils *)ScopedIDsUtils.init()();
}

@end