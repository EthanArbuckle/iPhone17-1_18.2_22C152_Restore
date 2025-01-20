@interface PBFPosterSwitcherSceneDelegate
- (PBFExtensionTestingViewController)posterExtensionTestingViewController;
- (PBFPosterRackCollectionViewController)posterRackViewController;
- (PBFPosterSwitcherSceneDelegate)init;
- (PBFPosterSwitcherSceneDelegate)initWithScene:(id)a3;
- (UIScene)_scene;
- (UIWindow)window;
- (id)_actionHandlersForScene:(id)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_setScene:(id)a3;
- (void)dataStoreDidTearDown;
- (void)debugGestureWasTriggered;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setPosterExtensionTestingViewController:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowDidAttachContext:(id)a3;
- (void)windowDidDetachContext:(id)a3;
@end

@implementation PBFPosterSwitcherSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (PBFPosterRackCollectionViewController)posterRackViewController
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window);
  if (!v2) {
    goto LABEL_5;
  }
  id v3 = self;
  id v4 = (PBFPosterSwitcherSceneDelegate *)objc_msgSend(v2, sel_rootViewController);
  if (!v4
    || (v5 = v4,
        type metadata accessor for PosterRackCollectionViewController(),
        v6 = (void *)swift_dynamicCastClass(),
        v3,
        id v3 = v5,
        !v6))
  {

LABEL_5:
    v6 = 0;
  }
  return (PBFPosterRackCollectionViewController *)v6;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1D32D0E58(v8);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32D1110();
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32D1270();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32CF85C();
}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v3 = OBJC_IVAR___PBFPosterSwitcherSceneDelegate_switcherInUseAssertion;
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_switcherInUseAssertion);
  if (v4)
  {
    id v6 = a3;
    v7 = self;
    objc_msgSend(v4, sel_invalidate);
    *(Class *)((char *)&self->super.super.isa + v3) = 0;

    swift_unknownObjectRelease();
  }
}

- (PBFPosterSwitcherSceneDelegate)init
{
  return (PBFPosterSwitcherSceneDelegate *)sub_1D32CED44();
}

- (PBFPosterSwitcherSceneDelegate)initWithScene:(id)a3
{
  id v3 = a3;
  sub_1D32D1374();
}

- (UIScene)_scene
{
  return (UIScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR___PBFPosterSwitcherSceneDelegate__scene));
}

- (void)_setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate__scene);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate__scene) = (Class)a3;
  id v3 = a3;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  return sub_1D32CEF18(self, (uint64_t)a2, (uint64_t)a3, &qword_1EBD6FD50);
}

- (id)_actionHandlersForScene:(id)a3
{
  return sub_1D32CEF18(self, (uint64_t)a2, (uint64_t)a3, &qword_1EBD6FD48);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = self;
  sub_1D32D1494(a4, (unint64_t)a5, (uint64_t)a6, a7);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  sub_1D32CE184(0, &qword_1EBD6FDF0);
  sub_1D32D2328(&qword_1EBD6FDF8, &qword_1EBD6FDF0);
  uint64_t v10 = sub_1D3372478();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  sub_1D32D1F40(v10);

  swift_bridgeObjectRelease();
  id v15 = (void *)sub_1D3372468();
  swift_bridgeObjectRelease();
  return v15;
}

- (void)windowDidAttachContext:(id)a3
{
}

- (void)windowDidDetachContext:(id)a3
{
}

- (void)dataStoreDidTearDown
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_1D32D011C;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1D32EF568;
  v6[3] = &block_descriptor_59;
  id v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  BSDispatchMain();
  _Block_release(v4);
}

- (PBFExtensionTestingViewController)posterExtensionTestingViewController
{
  v2 = self;
  uint64_t v3 = sub_1D32CFB3C();

  return (PBFExtensionTestingViewController *)v3;
}

- (void)setPosterExtensionTestingViewController:(id)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___posterExtensionTestingViewController);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___posterExtensionTestingViewController) = (Class)a3;
  id v4 = a3;
  sub_1D32D0020(v3);
}

- (void)debugGestureWasTriggered
{
  v2 = self;
  sub_1D32CFD9C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___sceneSettingsDiffInspector));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_extensionTestingViewController));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___posterExtensionTestingViewController);
  sub_1D32D0020(v3);
}

@end