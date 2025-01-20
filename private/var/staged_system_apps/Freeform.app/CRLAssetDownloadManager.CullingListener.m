@interface CRLAssetDownloadManager.CullingListener
- (uint64_t)willCloseContainerForAssets:;
- (void)willCullAssets:(id)a3;
@end

@implementation CRLAssetDownloadManager.CullingListener

- (void)willCullAssets:(id)a3
{
  type metadata accessor for CRLAsset();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100678124(v3);
  swift_bridgeObjectRelease();

  swift_release();
}

- (uint64_t)willCloseContainerForAssets:
{
  type metadata accessor for CRLAsset();
  unint64_t v0 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100678124(v0);
  swift_bridgeObjectRelease();

  return swift_release();
}

@end