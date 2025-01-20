@interface _UIRootPresentationController
+ (BOOL)_allowsDeferredTransitions;
- (BOOL)_isRootPresentation;
- (BOOL)_mayChildGrabPresentedViewControllerView;
- (BOOL)_shouldDisableAppearanceCallbacksForPresentedViewController;
- (UIStatusBarHideAnimationParameters)_preferredStatusBarHideAnimationParameters;
- (UIStatusBarStyleAnimationParameters)_preferredStatusBarStyleAnimationParameters;
- (UIWindow)presentingWindow;
- (_UIRootPresentationController)initWithPresentedViewController:(id)a3 presentingWindow:(id)a4;
- (id)_createVisualStyleForProvider:(id)a3;
- (id)_transitionCoordinator;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)set_shouldDisableAppearanceCallbacksForPresentedViewController:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIRootPresentationController

- (UIWindow)presentingWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingWindow);
  return (UIWindow *)WeakRetained;
}

- (BOOL)_isRootPresentation
{
  return 1;
}

- (BOOL)_shouldDisableAppearanceCallbacksForPresentedViewController
{
  return self->__shouldDisableAppearanceCallbacksForPresentedViewController;
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 1;
}

- (id)_transitionCoordinator
{
  return 0;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  return (id)[a3 styleForRootPresentationController:self];
}

+ (BOOL)_allowsDeferredTransitions
{
  return 0;
}

- (_UIRootPresentationController)initWithPresentedViewController:(id)a3 presentingWindow:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIRootPresentationController;
  v7 = [(UISheetPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:0];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_presentingWindow, v6);
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  return 2;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIRootPresentationController;
  id v6 = a4;
  [(UIPresentationController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91___UIRootPresentationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E52DA598;
  v7[4] = self;
  [v6 animateAlongsideTransition:v7 completion:0];
}

- (UIStatusBarStyleAnimationParameters)_preferredStatusBarStyleAnimationParameters
{
  return 0;
}

- (UIStatusBarHideAnimationParameters)_preferredStatusBarHideAnimationParameters
{
  return 0;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)set_shouldDisableAppearanceCallbacksForPresentedViewController:(BOOL)a3
{
  self->__shouldDisableAppearanceCallbacksForPresentedViewController = a3;
}

@end