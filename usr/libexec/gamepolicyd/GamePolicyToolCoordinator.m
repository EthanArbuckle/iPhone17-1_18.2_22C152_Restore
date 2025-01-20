@interface GamePolicyToolCoordinator
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC11gamepolicyd25GamePolicyToolCoordinator)init;
@end

@implementation GamePolicyToolCoordinator

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10001097C(v7);

  return v9 & 1;
}

- (_TtC11gamepolicyd25GamePolicyToolCoordinator)init
{
  result = (_TtC11gamepolicyd25GamePolicyToolCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end