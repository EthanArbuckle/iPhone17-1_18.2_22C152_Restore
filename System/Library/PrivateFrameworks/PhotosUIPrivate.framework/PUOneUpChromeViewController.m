@interface PUOneUpChromeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hideScrubberWhenAccessoryIsVisible;
- (BOOL)_isDisplayingContentOnSecondScreen;
- (BOOL)_wantsAirPlayButton;
- (BOOL)_wantsContentLegibilityTreatment;
- (BOOL)_wantsShowInLibraryButton;
- (BOOL)hideScrubberWhenAccessoryIsVisible;
- (BOOL)isDisplayingContentOnSecondScreen;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAllowGestureToBeginAt:(id)a3;
- (BOOL)wantsAirPlayButton;
- (BOOL)wantsContentLegibilityTreatment;
- (BOOL)wantsShowInLibraryButton;
- (CGRect)oneUpActionsControllerPopoverSourceRectIn:(id)a3 actionType:(unint64_t)a4;
- (PUOneUpChromeViewController)initWithBrowsingSession:(id)a3 actionsController:(id)a4;
- (PUOneUpChromeViewController)initWithCoder:(id)a3;
- (PUOneUpChromeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUOneUpChromeViewControllerDelegate)_delegate;
- (PUOneUpChromeViewControllerDelegate)delegate;
- (UIColor)_backgroundColorOverride;
- (UIColor)backgroundColorOverride;
- (UIEdgeInsets)_additionalActionInfoEdgeInsets;
- (UIEdgeInsets)_contentDecorationAdditionalInsets;
- (UIEdgeInsets)_contentGuideInsets;
- (UIEdgeInsets)_toolbarInsets;
- (UIEdgeInsets)additionalActionInfoEdgeInsets;
- (UIEdgeInsets)contentDecorationAdditionalInsets;
- (UIEdgeInsets)contentGuideInsets;
- (UIEdgeInsets)contentGuideInsetsForViewSize:(CGSize)a3;
- (UIEdgeInsets)toolbarInsets;
- (UIEdgeInsets)toolbarInsetsForViewSize:(CGSize)a3;
- (UIView)ppt_scrubberView;
- (double)horizontalGuideInset;
- (id)oneUpActionsControllerPopoverSourceItemWithActionType:(unint64_t)a3;
- (id)oneUpActionsControllerPopoverSourceViewWithActionType:(unint64_t)a3;
- (void)invalidateIsDeviceUnlocked;
- (void)loadView;
- (void)setAdditionalActionInfoEdgeInsets:(UIEdgeInsets)a3;
- (void)setBackgroundColorOverride:(id)a3;
- (void)setContentDecorationAdditionalInsets:(UIEdgeInsets)a3;
- (void)setContentGuideInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setHideScrubberWhenAccessoryIsVisible:(BOOL)a3;
- (void)setIsDisplayingContentOnSecondScreen:(BOOL)a3;
- (void)setToolbarInsets:(UIEdgeInsets)a3;
- (void)setWantsAirPlayButton:(BOOL)a3;
- (void)setWantsContentLegibilityTreatment:(BOOL)a3;
- (void)setWantsShowInLibraryButton:(BOOL)a3;
- (void)set_additionalActionInfoEdgeInsets:(UIEdgeInsets)a3;
- (void)set_backgroundColorOverride:(id)a3;
- (void)set_contentDecorationAdditionalInsets:(UIEdgeInsets)a3;
- (void)set_contentGuideInsets:(UIEdgeInsets)a3;
- (void)set_delegate:(id)a3;
- (void)set_hideScrubberWhenAccessoryIsVisible:(BOOL)a3;
- (void)set_isDisplayingContentOnSecondScreen:(BOOL)a3;
- (void)set_toolbarInsets:(UIEdgeInsets)a3;
- (void)set_wantsAirPlayButton:(BOOL)a3;
- (void)set_wantsContentLegibilityTreatment:(BOOL)a3;
- (void)set_wantsShowInLibraryButton:(BOOL)a3;
- (void)updateDismissalStateWithIsInteractivelyDismissing:(BOOL)a3 dismissalProgress:(double)a4;
- (void)updateIsDeviceLocked;
- (void)updateIsDeviceUnlockedIfNeeded;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUOneUpChromeViewController

- (PUOneUpChromeViewController)initWithBrowsingSession:(id)a3 actionsController:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  OneUpChromeViewController.init(browsingSession:actionsController:)();
  return result;
}

- (UIView)ppt_scrubberView
{
  v2 = self;
  id v3 = sub_1AEA37614();

  return (UIView *)v3;
}

- (double)horizontalGuideInset
{
  v2 = self;
  sub_1AEA37708();
  double v4 = v3;

  return v4;
}

- (BOOL)_hideScrubberWhenAccessoryIsVisible
{
  return sub_1AEA37790() & 1;
}

- (void)set_hideScrubberWhenAccessoryIsVisible:(BOOL)a3
{
}

- (BOOL)hideScrubberWhenAccessoryIsVisible
{
  v2 = self;
  char v3 = sub_1AEA3780C();

  return v3 & 1;
}

- (void)setHideScrubberWhenAccessoryIsVisible:(BOOL)a3
{
  char v3 = self;
  sub_1AEA36980();
}

- (BOOL)_wantsAirPlayButton
{
  return sub_1AEA37974() & 1;
}

- (void)set_wantsAirPlayButton:(BOOL)a3
{
}

- (BOOL)wantsAirPlayButton
{
  v2 = self;
  char v3 = sub_1AEA379F0();

  return v3 & 1;
}

- (void)setWantsAirPlayButton:(BOOL)a3
{
  char v3 = self;
  sub_1AEA36980();
}

- (BOOL)_wantsShowInLibraryButton
{
  return sub_1AEA37B30() & 1;
}

- (void)set_wantsShowInLibraryButton:(BOOL)a3
{
}

- (BOOL)wantsShowInLibraryButton
{
  v2 = self;
  char v3 = sub_1AEA37BAC();

  return v3 & 1;
}

- (void)setWantsShowInLibraryButton:(BOOL)a3
{
  char v3 = self;
  sub_1AEA36980();
}

- (BOOL)_isDisplayingContentOnSecondScreen
{
  return sub_1AEA37C58() & 1;
}

- (void)set_isDisplayingContentOnSecondScreen:(BOOL)a3
{
}

- (BOOL)isDisplayingContentOnSecondScreen
{
  v2 = self;
  char v3 = sub_1AEA37CD4();

  return v3 & 1;
}

- (void)setIsDisplayingContentOnSecondScreen:(BOOL)a3
{
  char v3 = self;
  sub_1AEA36980();
}

- (void)invalidateIsDeviceUnlocked
{
  v2 = self;
  sub_1AEA37D58();
}

- (void)updateIsDeviceUnlockedIfNeeded
{
  v2 = self;
  sub_1AEA37DF4();
}

- (void)updateIsDeviceLocked
{
  v2 = self;
  sub_1AEA37E88();
}

- (BOOL)shouldAllowGestureToBeginAt:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  unsigned __int8 v6 = sub_1AEA37F9C(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)updateDismissalStateWithIsInteractivelyDismissing:(BOOL)a3 dismissalProgress:(double)a4
{
  double v4 = self;
  sub_1AEA380B0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PUOneUpChromeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEA382C8();
}

- (void)loadView
{
  v2 = self;
  OneUpChromeViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  OneUpChromeViewController.viewDidLoad()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  unsigned __int8 v6 = self;
  OneUpChromeViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  OneUpChromeViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OneUpChromeViewController.viewDidLayoutSubviews()();
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  BOOL v3 = OneUpChromeViewController.prefersStatusBarHidden.getter();

  return v3;
}

- (PUOneUpChromeViewControllerDelegate)_delegate
{
}

- (void)set_delegate:(id)a3
{
  swift_unknownObjectRetain();
  double v4 = self;
  sub_1AEA3DA14();
}

- (PUOneUpChromeViewControllerDelegate)delegate
{
  v2 = self;
  BOOL v3 = (void *)sub_1AEA37180();

  return (PUOneUpChromeViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEA36850((uint64_t)a3, (uint64_t)&unk_1AEFEB050, (uint64_t)sub_1AEA442F8, MEMORY[0x1E4FBC8F8]);
}

- (UIEdgeInsets)_contentGuideInsets
{
  double v2 = sub_1AEA3E6C0(&OBJC_IVAR___PUOneUpChromeViewController__contentGuideInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)set_contentGuideInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = self;
  sub_1AEA3DFB8(&OBJC_IVAR___PUOneUpChromeViewController__contentGuideInsets, top, left, bottom, right);
}

- (UIEdgeInsets)contentGuideInsets
{
  sub_1AEA3E830(self, (uint64_t)a2, (void (*)(void))OneUpChromeViewController.contentGuideInsets.getter);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AEA36920();
}

- (UIEdgeInsets)_toolbarInsets
{
  double v2 = sub_1AEA3E6C0(&OBJC_IVAR___PUOneUpChromeViewController__toolbarInsets);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)set_toolbarInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = self;
  sub_1AEA3DFB8(&OBJC_IVAR___PUOneUpChromeViewController__toolbarInsets, top, left, bottom, right);
}

- (UIEdgeInsets)toolbarInsets
{
  sub_1AEA3E830(self, (uint64_t)a2, (void (*)(void))OneUpChromeViewController.toolbarInsets.getter);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setToolbarInsets:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AEA36920();
}

- (UIColor)_backgroundColorOverride
{
  double v2 = sub_1AEA3E158();
  return (UIColor *)v2;
}

- (void)set_backgroundColorOverride:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_1AEA3E1E4(a3);
}

- (UIColor)backgroundColorOverride
{
  double v2 = self;
  double v3 = OneUpChromeViewController.backgroundColorOverride.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColorOverride:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_1AEA368C4(a3);
}

- (UIEdgeInsets)_contentDecorationAdditionalInsets
{
  double v2 = sub_1AEA3E6C0(&OBJC_IVAR___PUOneUpChromeViewController__contentDecorationAdditionalInsets);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)set_contentDecorationAdditionalInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = self;
  sub_1AEA3DFB8(&OBJC_IVAR___PUOneUpChromeViewController__contentDecorationAdditionalInsets, top, left, bottom, right);
}

- (UIEdgeInsets)contentDecorationAdditionalInsets
{
  sub_1AEA3E830(self, (uint64_t)a2, (void (*)(void))OneUpChromeViewController.contentDecorationAdditionalInsets.getter);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setContentDecorationAdditionalInsets:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AEA36920();
}

- (UIEdgeInsets)_additionalActionInfoEdgeInsets
{
  double v2 = sub_1AEA3E6C0(&OBJC_IVAR___PUOneUpChromeViewController__additionalActionInfoEdgeInsets);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)set_additionalActionInfoEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = self;
  sub_1AEA3DFB8(&OBJC_IVAR___PUOneUpChromeViewController__additionalActionInfoEdgeInsets, top, left, bottom, right);
}

- (UIEdgeInsets)additionalActionInfoEdgeInsets
{
  sub_1AEA3E830(self, (uint64_t)a2, (void (*)(void))OneUpChromeViewController.additionalActionInfoEdgeInsets.getter);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setAdditionalActionInfoEdgeInsets:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AEA36920();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  OneUpChromeViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)a3, a4);
}

- (UIEdgeInsets)contentGuideInsetsForViewSize:(CGSize)a3
{
  sub_1AEA3FA5C(self, (uint64_t)a2, (void (*)(double))sub_1AEA3EC54);
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (UIEdgeInsets)toolbarInsetsForViewSize:(CGSize)a3
{
  sub_1AEA3FA5C(self, (uint64_t)a2, (void (*)(double))sub_1AEA3F1FC);
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (BOOL)_wantsContentLegibilityTreatment
{
  return sub_1AEA3FAD8() & 1;
}

- (void)set_wantsContentLegibilityTreatment:(BOOL)a3
{
  double v4 = self;
  sub_1AEA3FB3C(a3);
}

- (BOOL)wantsContentLegibilityTreatment
{
  double v2 = self;
  char v3 = sub_1AEA3FBC0();

  return v3 & 1;
}

- (void)setWantsContentLegibilityTreatment:(BOOL)a3
{
  char v3 = self;
  sub_1AEA36980();
}

- (PUOneUpChromeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AEF96DE0();
  }
  id v5 = a4;
  OneUpChromeViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUOneUpChromeViewController__chromeEnvironmentUpdater));
  swift_release();
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUOneUpChromeViewController__delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUOneUpChromeViewController__backgroundColorOverride));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUOneUpChromeViewController_chromeHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUOneUpChromeViewController_legibilityHostingController));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  char v3 = (char *)self + OBJC_IVAR___PUOneUpChromeViewController_logger;
  sub_1AEF95110();
  OUTLINED_FUNCTION_16_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  id v5 = (char *)self + OBJC_IVAR___PUOneUpChromeViewController___observationRegistrar;
  sub_1AEF93A30();
  OUTLINED_FUNCTION_16_0();
  v8 = *(void (**)(char *, uint64_t))(v7 + 8);
  v8(v5, v6);
}

- (id)oneUpActionsControllerPopoverSourceItemWithActionType:(unint64_t)a3
{
  return 0;
}

- (id)oneUpActionsControllerPopoverSourceViewWithActionType:(unint64_t)a3
{
  char v3 = self;
  OneUpChromeViewController.oneUpActionsControllerPopoverSourceView(actionType:)();
  id v5 = v4;

  return v5;
}

- (CGRect)oneUpActionsControllerPopoverSourceRectIn:(id)a3 actionType:(unint64_t)a4
{
  double v4 = OneUpChromeViewController.oneUpActionsControllerPopoverSourceRect(in:actionType:)();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end