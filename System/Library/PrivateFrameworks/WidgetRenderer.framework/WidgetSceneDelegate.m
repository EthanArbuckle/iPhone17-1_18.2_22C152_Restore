@interface WidgetSceneDelegate
- (NSString)description;
- (UIWindow)window;
- (_TtC14WidgetRenderer19WidgetSceneDelegate)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)applicationDidReceiveMemoryWarning;
- (void)dealloc;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation WidgetSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)dealloc
{
  id v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_confirmationActionSubscribers);
  swift_beginAccess();
  id v4 = self;
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_261892D70(v5);
  swift_bridgeObjectRelease();
  *id v3 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for WidgetSceneDelegate();
  [(WidgetSceneDelegate *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_foregroundScene));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_sceneSettingsDiffInspector));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_26189F7E8(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_261895BDC(v4);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_261895C50(v4);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_261895F68(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_261896354(v4);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_261896C7C(v4);
}

- (void)applicationDidReceiveMemoryWarning
{
  v2 = self;
  sub_2618973B8();
}

- (NSString)description
{
  v2 = self;
  sub_261897904();

  id v3 = (void *)sub_2618FB300();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = self;
  sub_2618A18A4(a4, a5, a6, a7);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  sub_2618A2568(0, (unint64_t *)&unk_26B414920);
  sub_2618A201C((unint64_t *)&unk_26B414930, (unint64_t *)&unk_26B414920);
  uint64_t v10 = sub_2618FB480();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  sub_2618A1B28(v10, v12);

  swift_bridgeObjectRelease();
  id v15 = (void *)sub_2618FB470();
  swift_bridgeObjectRelease();

  return v15;
}

- (_TtC14WidgetRenderer19WidgetSceneDelegate)init
{
  return (_TtC14WidgetRenderer19WidgetSceneDelegate *)sub_26189EBEC();
}

@end