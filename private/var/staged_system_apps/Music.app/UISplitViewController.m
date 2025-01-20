@interface UISplitViewController
- (int64_t)preferredStatusBarStyle;
@end

@implementation UISplitViewController

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  v3 = [(UISplitViewController *)v2 viewControllers];
  sub_100057778(0, (unint64_t *)&qword_101099260);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    int64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:

    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_6;
  }
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v4 + 32);
LABEL_6:
    v7 = v6;
    swift_bridgeObjectRelease();
    id v8 = [v7 preferredStatusBarStyle];

    return (int64_t)v8;
  }
  __break(1u);
  return result;
}

@end