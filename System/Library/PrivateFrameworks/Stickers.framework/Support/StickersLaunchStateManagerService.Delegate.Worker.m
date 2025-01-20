@interface StickersLaunchStateManagerService.Delegate.Worker
- (_TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker)init;
- (void)launchConfigurationWithReply:(id)a3;
- (void)updateCurrentConfigurationWithSection:(id)a3 identifier:(id)a4 withReply:(id)a5;
- (void)upperCaseString:(id)a3 withReply:(id)a4;
@end

@implementation StickersLaunchStateManagerService.Delegate.Worker

- (void)updateCurrentConfigurationWithSection:(id)a3 identifier:(id)a4 withReply:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_copy(v7);
  v13 = self;
  sub_100003374(v8, v10, v11, (uint64_t)a4, (uint64_t)v13, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)launchConfigurationWithReply:(id)a3
{
  uint64_t v5 = type metadata accessor for StickerSectionType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void (**)(void *, NSString, NSString))_Block_copy(a3);
  uint64_t v10 = self;
  id v11 = sub_1000024D0();
  v12 = (void *)dispatch thunk of LaunchStateManager.launchConfiguration.getter();

  LaunchConfiguration.sectionType.getter();
  StickerSectionType.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LaunchConfiguration.identifier.getter();
  uint64_t v14 = v13;
  NSString v15 = String._bridgeToObjectiveC()();
  if (v14) {
    NSString v16 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v16 = 0;
  }
  v9[2](v9, v15, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  _Block_release(v9);
}

- (void)upperCaseString:(id)a3 withReply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1000037E0(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (_TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker____lazy_storage___launchStateManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersLaunchStateManagerService.Delegate.Worker();
  return [(StickersLaunchStateManagerService.Delegate.Worker *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker____lazy_storage___launchStateManager));
}

@end