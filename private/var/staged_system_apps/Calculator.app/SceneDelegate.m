@interface SceneDelegate
- (_TtC10Calculator13SceneDelegate)init;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  v5 = self;
  id v6 = a3;
  v8 = self;
  [v5 preheatSystemSoundsForObject:];
  if (qword_100154728 != -1) {
    swift_once();
  }
  v7 = (void *)qword_100161338;
  if (([(id)qword_100161338 isActive] & 1) == 0) {
    [v7 activateWithCompletionBlock:0];
  }
}

- (_TtC10Calculator13SceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v3 init];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  v8 = (void (**)(void *, void))_Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v12 = self;
  char v11 = sub_100082E9C(v10);
  v8[2](v8, v11 & 1);
  _Block_release(v8);
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v4 = qword_100154728;
  id v5 = a3;
  v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  id v6 = (void *)qword_100161338;
  if ([(id)qword_100161338 isActive]) {
    [v6 deactivate];
  }
  [self cooldownSystemSoundsForObject:v7];
}

- (void)sceneWillResignActive:
{
  sub_1000824AC();
  id v0 = sub_100083260();
  if (v0)
  {
    v1 = v0;
    id v2 = [self sharedApplication];
    id v3 = [v2 shortcutItems];
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100083644();
      uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      id v6 = v1;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      if (v5)
      {
        v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        v7.super.isa = 0;
      }
      [v2 setShortcutItems:v7.super.isa];
    }
    else
    {
      [v2 setShortcutItems:0];
      swift_bridgeObjectRelease();
    }
  }
}

@end