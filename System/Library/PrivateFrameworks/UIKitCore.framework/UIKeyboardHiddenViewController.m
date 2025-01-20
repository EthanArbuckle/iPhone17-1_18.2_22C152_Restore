@interface UIKeyboardHiddenViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_formSheetObeysContentContainerSize;
- (BOOL)presentedAutofill;
- (BOOL)shouldPresentAsPopover;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (UIKeyboardHiddenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SFPasswordViewController)autofillVC;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_deviceWillLock:(id)a3;
- (void)_localAuthenticationUIDismissed;
- (void)_localAuthenticationUIPresented;
- (void)_sceneDidChange;
- (void)dealloc;
- (void)passwordViewControllerDidFinish:(id)a3;
- (void)presentAutofillVCWithAnimation:(BOOL)a3;
- (void)presentSelfWithAnimation:(BOOL)a3;
- (void)presentViewController:(BOOL)a3;
- (void)setAutofillVC:(id)a3;
- (void)setPresentedAutofill:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UIKeyboardHiddenViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIKeyboardHiddenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardHiddenViewController;
  v4 = [(UIViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)UIKBLADarwinUIPresented, @"com.apple.LocalAuthentication.ui.presented", 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)UIKBLADarwinUIDismissed, @"com.apple.LocalAuthentication.ui.dismissed", 0, (CFNotificationSuspensionBehavior)0);
    objc_storeStrong((id *)&__UIKBCurrentHiddenViewController, v4);
    [(UIViewController *)v4 setModalPresentationStyle:4];
    autofillVC = v4->_autofillVC;
    v4->_autofillVC = 0;
  }
  return v4;
}

- (void)dealloc
{
  if ((UIKeyboardHiddenViewController *)__UIKBCurrentHiddenViewController == self)
  {
    __UIKBCurrentHiddenViewController = 0;
  }
  if (self->_presentedAutofill)
  {
    v3 = +[UIPeripheralHost activeInstance];
    [v3 setDeactivatedKeyboard:0 forScene:0];

    self->_presentedAutofill = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.LocalAuthentication.ui.presented", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"com.apple.LocalAuthentication.ui.dismissed", 0);
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardHiddenViewController;
  [(UIViewController *)&v6 dealloc];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UIPresentationController *)[UIKeyboardVCPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_presentedAutofill)
  {
    if (![(id)UIApp isSuspended]
      || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v5 = objc_claimAutoreleasedReturnValue(), [v5 containerWindow], id v6 = objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "_isHostedInAnotherProcess"), v6, v5, v7))
    {
      self->_presentedAutofill = 1;
      v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      objc_super v9 = [MEMORY[0x1E4F29238] valueWithPointer:self];
      [v8 _preserveInputViewsWithId:v9 animated:1];

      v10 = +[UIPeripheralHost activeInstance];
      [v10 setDeactivatedKeyboard:1 forScene:0];
    }
  }
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__deviceWillLock_ name:@"UIApplicationProtectedDataWillBecomeUnavailable" object:0];

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardHiddenViewController;
  [(UIViewController *)&v12 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIApplicationProtectedDataWillBecomeUnavailable" object:0];

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardHiddenViewController;
  [(UIViewController *)&v6 viewWillDisappear:v3];
}

- (void)_localAuthenticationUIPresented
{
  if (!self->_presentedAutofill && !+[UIKeyboard usesInputSystemUI])
  {
    BOOL v3 = +[UIPeripheralHost activeInstance];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__UIKeyboardHiddenViewController__localAuthenticationUIPresented__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    [v3 performWithoutDeactivation:v4];
  }
}

void __65__UIKeyboardHiddenViewController__localAuthenticationUIPresented__block_invoke(uint64_t a1)
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  [v3 _preserveInputViewsWithId:v2 animated:1];
}

- (void)_localAuthenticationUIDismissed
{
  if (!self->_presentedAutofill)
  {
    id v3 = +[UIPeripheralHost activeInstance];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__UIKeyboardHiddenViewController__localAuthenticationUIDismissed__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    [v3 performWithoutDeactivation:v4];
  }
}

void __65__UIKeyboardHiddenViewController__localAuthenticationUIDismissed__block_invoke(uint64_t a1)
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  [v3 _restoreInputViewsWithId:v2 animated:1];
}

- (void)passwordViewControllerDidFinish:(id)a3
{
  v4 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
  v5 = [v4 rootViewController];

  [v5 setDontDismissKeyboardOnScrolling:0];
  if (self->_presentedAutofill)
  {
    objc_super v6 = +[UIPeripheralHost activeInstance];
    [v6 setDeactivatedKeyboard:0 forScene:0];

    self->_presentedAutofill = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__UIKeyboardHiddenViewController_passwordViewControllerDidFinish___block_invoke;
  v7[3] = &unk_1E52D9F70;
  v7[4] = self;
  _AttemptDismiss(self, v7);
}

void __66__UIKeyboardHiddenViewController_passwordViewControllerDidFinish___block_invoke(uint64_t a1)
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v3 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  char v4 = [v2 _restoreInputViewsWithId:v3 animated:1];

  if ((v4 & 1) == 0)
  {
    id v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v5 restorePreservedInputViewsIfNecessary];
  }
}

- (void)_deviceWillLock:(id)a3
{
}

- (BOOL)shouldPresentAsPopover
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  v2 = +[UIWindow _applicationKeyWindow];
  id v3 = [v2 traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] != 1;

  return v4;
}

- (void)presentSelfWithAnimation:(BOOL)a3
{
  [(UIViewController *)self setTransitioningDelegate:self];
  id v5 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
  objc_super v6 = [v5 rootViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__UIKeyboardHiddenViewController_presentSelfWithAnimation___block_invoke;
  v7[3] = &unk_1E52D9FC0;
  v7[4] = self;
  BOOL v8 = a3;
  [v6 presentViewController:self animated:0 completion:v7];
}

uint64_t __59__UIKeyboardHiddenViewController_presentSelfWithAnimation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _window];
  int v3 = [v2 _isHostedInAnotherProcess];

  if (v3)
  {
    id v4 = *(id *)(a1 + 32);
    id v5 = (void *)s_presentations;
    if (!s_presentations)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      int v7 = (void *)s_presentations;
      s_presentations = v6;

      id v5 = (void *)s_presentations;
    }
    [v5 addObject:v4];
  }
  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 40);
  return [v8 presentAutofillVCWithAnimation:v9];
}

- (void)presentAutofillVCWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
  id v6 = [v5 rootViewController];

  [v6 setDontDismissKeyboardOnScrolling:1];
  [(_SFPasswordViewController *)self->_autofillVC setModalPresentationStyle:3];
  [(UIViewController *)self setDefinesPresentationContext:1];
  [(UIKeyboardHiddenViewController *)self presentViewController:v3];
}

- (void)presentViewController:(BOOL)a3
{
}

- (BOOL)_formSheetObeysContentContainerSize
{
  return 1;
}

- (void)_sceneDidChange
{
  BOOL v3 = [(UIViewController *)self presentingViewController];

  if (v3)
  {
    if (!self->_processingSceneDidChange)
    {
      self->_processingSceneDidChange = 1;
      id v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      char v5 = [v4 snapshotting] ^ 1;

      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __49__UIKeyboardHiddenViewController__sceneDidChange__block_invoke;
      v6[3] = &unk_1E52D9FC0;
      char v7 = v5;
      v6[4] = self;
      _AttemptDismiss(self, v6);
    }
  }
}

uint64_t __49__UIKeyboardHiddenViewController__sceneDidChange__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 40)) {
    result = [*(id *)(result + 32) presentSelfWithAnimation:0];
  }
  *(unsigned char *)(*(void *)(v1 + 32) + 985) = 0;
  return result;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if ([(UIKeyboardHiddenViewController *)self shouldPresentAsPopover])
  {
    BOOL v8 = [(UIViewController *)self presentationController];
    objc_msgSend(v8, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIKeyboardHiddenViewController;
    -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v17, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    double v10 = v13;
    double v12 = v14;
  }

  double v15 = v10;
  double v16 = v12;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (_SFPasswordViewController)autofillVC
{
  return self->_autofillVC;
}

- (void)setAutofillVC:(id)a3
{
}

- (BOOL)presentedAutofill
{
  return self->_presentedAutofill;
}

- (void)setPresentedAutofill:(BOOL)a3
{
  self->_presentedAutofill = a3;
}

- (void).cxx_destruct
{
}

void __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    if (v3 && v3[15])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke_2;
      v5[3] = &unk_1E52DC3D0;
      v5[4] = *(void *)(a1 + 40);
      id v6 = v3;
      char v7 = *(unsigned char *)(a1 + 48);
      _AttemptDismiss(v6, v5);
    }
    else
    {
      id v4 = *(void **)(a1 + 40);
      objc_msgSend(v4, "presentViewController:animated:completion:");
    }
  }
}

uint64_t __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) completion:0];
}

void __59__UIKeyboardHiddenViewController_Autofill_isValidedString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] illegalCharacterSet];
  uint64_t v1 = (void *)_MergedGlobals_1166;
  _MergedGlobals_1166 = v0;

  v2 = (void *)_MergedGlobals_1166;
  BOOL v3 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  id v4 = (void *)_MergedGlobals_1166;
  id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [v4 formUnionWithCharacterSet:v5];
}

@end