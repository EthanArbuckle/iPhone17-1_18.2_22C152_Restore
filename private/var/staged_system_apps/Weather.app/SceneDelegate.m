@interface SceneDelegate
- (_TtC7Weather13SceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100030248((uint64_t)v5, "Scene will enter foreground", (void (*)(uint64_t, uint64_t))&dispatch thunk of SceneStateManagerType.willEnterForeground());
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100223044((uint64_t)v5, (void (*)(uint64_t, uint64_t))&dispatch thunk of SceneStateManagerType.didBecomeActive());
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100075ACC(v8, (uint64_t)v11, v10);
}

- (_TtC7Weather13SceneDelegate)init
{
  return (_TtC7Weather13SceneDelegate *)sub_100015950();
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100223044((uint64_t)v5, (void (*)(uint64_t, uint64_t))&dispatch thunk of SceneStateManagerType.willResignActive());
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10040B004((uint64_t)v8, v7);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = (objc_class *)a4;
  v12 = self;
  v11.super.isa = v10;
  sub_10040B1F8((uint64_t)v9, v11, (uint64_t)v12, (void (**)(void, void))v8);
  _Block_release(v8);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100030248((uint64_t)v5, "Scene did enter background", (void (*)(uint64_t, uint64_t))&dispatch thunk of SceneStateManagerType.didEnterBackground());
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1001781AC((uint64_t)self + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___continueUserActivityHandlerManager, &qword_100E74C18);
  sub_1001781AC((uint64_t)self + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___stateManager, &qword_100E74C00);

  swift_release();
}

@end