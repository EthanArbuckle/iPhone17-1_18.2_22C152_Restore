@interface NFWindowSceneEventLauncher
+ (void)launchBundleWithIdentifier:(id)a3 reason:(unint64_t)a4 domain:(int64_t)a5 completion:(id)a6;
- (_TtC11NFUIService26NFWindowSceneEventLauncher)init;
@end

@implementation NFWindowSceneEventLauncher

+ (void)launchBundleWithIdentifier:(id)a3 reason:(unint64_t)a4 domain:(int64_t)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  _Block_copy(v8);
  sub_100006A4C(v9, v11, a4, a5, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
}

- (_TtC11NFUIService26NFWindowSceneEventLauncher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NFWindowSceneEventLauncher();
  return [(NFWindowSceneEventLauncher *)&v3 init];
}

@end