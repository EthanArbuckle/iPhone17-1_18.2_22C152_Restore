@interface DocumentViewController
- (BOOL)deeplinkURLWasHandled:(id)a3;
- (BOOL)handleDeeplink:(id)a3;
- (BOOL)vuiShouldAutomaticallyForwardAppearanceMethods;
- (NSArray)preferredFocusEnvironments;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIViewController)childViewControllerForStatusBarHidden;
- (_TtC8VideosUI22DocumentViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI22DocumentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4;
- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)playbackUIChanged:(id)a3;
- (void)scrollToTopWithAnimated:(BOOL)a3 needsFocusUpdate:(BOOL)a4;
- (void)setActivityItemsConfiguration:(id)a3;
- (void)vui_didMoveToParentViewController:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
- (void)willEnterForeground:(id)a3;
- (void)willTerminate:(id)a3;
@end

@implementation DocumentViewController

- (BOOL)vuiShouldAutomaticallyForwardAppearanceMethods
{
  return DocumentViewController.vuiShouldAutomaticallyForwardAppearanceMethods.getter();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  DocumentViewController.vuiViewDidLayoutSubviews()();
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (UIViewController_optional *)OUTLINED_FUNCTION_8_8();
  DocumentViewController.vuiDidMove(toParent:)(v6);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentViewController.vuiViewDidAppear(_:)(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentViewController.vuiViewDidDisappear(_:)(v4);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = (UINavigationController *)a3;
  id v8 = a4;
  v9 = self;
  DocumentViewController.navigationController(_:didShow:animated:)(v7, &v9->super.super, 0);
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  v2 = self;
  DocumentViewController.activityItemsConfiguration.getter();
  char v4 = v3;

  return (UIActivityItemsConfigurationReading *)v4;
}

- (void)setActivityItemsConfiguration:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_8_8();
  DocumentViewController.activityItemsConfiguration.setter(v5);
}

- (_TtC8VideosUI22DocumentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  DocumentViewController.init(coder:)();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  DocumentViewController.vuiViewDidLoad()();
}

- (void)dealloc
{
  v2 = self;
  DocumentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22DocumentViewController_templateViewController));
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI22DocumentViewController_pendingDeeplinkURL, &qword_1EBF8F0E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22DocumentViewController_bubbletipOverlayController));
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI22DocumentViewController_documentDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI22DocumentViewController_documentDidSetHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22DocumentViewController_navBarTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22DocumentViewController_navBarTitleView));
  swift_bridgeObjectRelease();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentViewController.vuiViewWillAppear(_:)(v4);
}

- (void)willEnterForeground:(id)a3
{
}

- (void)willTerminate:(id)a3
{
}

- (void)didEnterBackground:(id)a3
{
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentViewController.vuiViewWillDisappear(_:)(v4);
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  id v3 = DocumentViewController.preferredStatusBarStyle.getter();

  return (int64_t)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  DocumentViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADED388);
  sub_1E387CC88();
  OUTLINED_FUNCTION_9();
  return (NSArray *)v2;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  v2 = self;
  id v3 = (void *)DocumentViewController.childForStatusBarHidden.getter();

  return (UIViewController *)v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = DocumentViewController.supportedInterfaceOrientations.getter();

  return (unint64_t)v3;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  id v5 = a4;
  id v6 = self;
  uint64_t v7 = OUTLINED_FUNCTION_100_15();
  id v9 = DocumentViewController.customAnimator(for:to:)(v7, v8);

  return v9;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  id v5 = a4;
  id v6 = self;
  uint64_t v7 = OUTLINED_FUNCTION_100_15();
  id v9 = DocumentViewController.customAnimator(for:from:)(v7, v8);

  return v9;
}

- (BOOL)handleDeeplink:(id)a3
{
  uint64_t v4 = sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_8();
  sub_1E3876088();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v4);
  return 0;
}

- (void)scrollToTopWithAnimated:(BOOL)a3 needsFocusUpdate:(BOOL)a4
{
  uint64_t v6 = self;
  DocumentViewController.scrollToTop(animated:needsFocusUpdate:)(a3, a4);
}

- (_TtC8VideosUI22DocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  DocumentViewController.init(nibName:bundle:)();
}

- (void)playbackUIChanged:(id)a3
{
  OUTLINED_FUNCTION_128();
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_56_41();
  sub_1E3875BE8();
  id v5 = v3;
  sub_1E366ED48();

  uint64_t v6 = OUTLINED_FUNCTION_22_10();
  v7(v6);
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  DocumentViewController.messageViewController(_:didUpdate:)();
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  DocumentViewController.messageViewController(_:didFailWithError:)();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  OUTLINED_FUNCTION_166();
  DocumentViewController.messageViewController(_:didSelectActionWith:)();
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8 = sub_1E387C678();
  if (a5)
  {
    uint64_t v9 = sub_1E387C928();
    a5 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = a3;
  v12 = self;
  DocumentViewController.messageViewController(_:enqueueEventWithFields:inTopic:)((uint64_t)v12, v8, v9, (uint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (BOOL)deeplinkURLWasHandled:(id)a3
{
  OUTLINED_FUNCTION_128();
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_56_41();
  sub_1E3876088();
  id v6 = v3;
  char v7 = DocumentViewController.deeplinkURLWasHandled(_:)(v4);

  uint64_t v8 = OUTLINED_FUNCTION_22_10();
  v9(v8);
  return v7 & 1;
}

@end