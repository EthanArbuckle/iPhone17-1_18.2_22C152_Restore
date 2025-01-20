@interface BKMenuController
- (BKMenuController)init;
- (BKMenuController)initWithAppLaunchCoordinator:(id)a3 sceneManager:(id)a4;
- (void)buildInternalWithBuilder:(id)a3;
- (void)buildWithBuilder:(id)a3;
- (void)updateKeyWindow;
@end

@implementation BKMenuController

- (void)updateKeyWindow
{
  v2 = self;
  sub_10000D110();
}

- (BKMenuController)initWithAppLaunchCoordinator:(id)a3 sceneManager:(id)a4
{
  return (BKMenuController *)sub_10001EC68(a3, a4);
}

- (void)buildWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10060ED90(a3);

  swift_unknownObjectRelease();
}

- (void)buildInternalWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10060F7B4(a3);
  swift_unknownObjectRelease();
}

- (BKMenuController)init
{
  result = (BKMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end