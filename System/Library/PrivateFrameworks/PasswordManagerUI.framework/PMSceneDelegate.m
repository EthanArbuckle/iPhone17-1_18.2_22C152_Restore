@interface PMSceneDelegate
- (_TtC17PasswordManagerUI15PMSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation PMSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_258D6A430(v8, v10);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_258D6A53C();
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = objc_msgSend(v10, sel_type);
  uint64_t v13 = sub_258D6F498();
  v15 = v14;

  v16._countAndFlagsBits = v13;
  v16._object = v15;
  PMQuickAction.init(rawValue:)(v16);
  if (v17 != 3) {
    sub_258D6C1C8();
  }
  _Block_release(v8);
}

- (_TtC17PasswordManagerUI15PMSceneDelegate)init
{
  return (_TtC17PasswordManagerUI15PMSceneDelegate *)PMSceneDelegate.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI15PMSceneDelegate_shortcutItemForInitialLaunch));

  swift_bridgeObjectRelease();
}

@end