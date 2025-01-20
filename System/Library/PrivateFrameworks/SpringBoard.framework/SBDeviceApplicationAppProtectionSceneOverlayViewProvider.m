@interface SBDeviceApplicationAppProtectionSceneOverlayViewProvider
- (BOOL)contentWantsSimplifiedOrientationBehavior;
- (BOOL)isDeallocating;
- (BSInvalidatable)keyboardFocusPreventionAssertion;
- (BSInvalidatable)visibilityAssertion;
- (NSString)sceneIdentifier;
- (SBDeviceApplicationAppProtectionSceneOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4;
- (UIViewController)shieldViewController;
- (id)_appProtectionAssistant;
- (int64_t)priority;
- (void)_acquireKeyboardFocusPreventionAssertionIfNeeded;
- (void)_acquireVisibilityAssertionIfNeeded;
- (void)_activateIfPossible;
- (void)_deactivateIfPossible;
- (void)_invalidateKeyboardFocusPreventionAssertion;
- (void)_invalidateVisibilityAssertion;
- (void)appProtectionAssistantShouldShieldDidChange:(id)a3;
- (void)dealloc;
- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)sceneHandle:(id)a3 didChangeEffectiveForegroundness:(BOOL)a4;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4;
- (void)setDeallocating:(BOOL)a3;
- (void)setKeyboardFocusPreventionAssertion:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setShieldViewController:(id)a3;
- (void)setVisibilityAssertion:(id)a3;
- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SBDeviceApplicationAppProtectionSceneOverlayViewProvider

- (void)_acquireVisibilityAssertionIfNeeded
{
  v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self visibilityAssertion];

  if (!v3)
  {
    id v8 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _appProtectionAssistant];
    uint64_t v4 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self sceneIdentifier];
    v5 = (void *)v4;
    if (v4) {
      v6 = (__CFString *)v4;
    }
    else {
      v6 = @"NULL scene";
    }
    v7 = [v8 acquireVisibilityAssertionForReason:v6];
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setVisibilityAssertion:v7];
  }
}

- (BSInvalidatable)visibilityAssertion
{
  return self->_visibilityAssertion;
}

- (void)setVisibilityAssertion:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (SBDeviceApplicationAppProtectionSceneOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  v7 = [(SBDeviceApplicationSceneOverlayViewProvider *)&v12 initWithSceneHandle:v6 delegate:a4];
  id v8 = v7;
  if (v7)
  {
    v9 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)v7 _appProtectionAssistant];
    [v9 addObserver:v8];

    [v6 addObserver:v8];
    if ([v6 isEffectivelyForeground])
    {
      v10 = [v6 sceneIdentifier];
      [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)v8 setSceneIdentifier:v10];

      [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)v8 _acquireVisibilityAssertionIfNeeded];
    }
  }

  return v8;
}

- (id)_appProtectionAssistant
{
  v2 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  v3 = [v2 application];
  uint64_t v4 = +[SBApplicationAppProtectionAssistant assistantForApplication:v3];

  return v4;
}

- (void)_activateIfPossible
{
  id v6 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _appProtectionAssistant];
  if ([v6 shouldShield])
  {
    v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self shieldViewController];

    if (!v3)
    {
      uint64_t v4 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _appProtectionAssistant];
      v5 = [v4 createShieldUIViewController];
      [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setShieldViewController:v5];

      v7.receiver = self;
      v7.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
      [(SBDeviceApplicationSceneOverlayViewProvider *)&v7 _activateIfPossible];
    }
  }
  else
  {
  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  if ([a3 isEffectivelyForeground])
  {
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _acquireVisibilityAssertionIfNeeded];
  }
}

- (void)dealloc
{
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v3 dealloc];
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v5 invalidate];
  objc_super v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _appProtectionAssistant];
  [v3 removeObserver:self];

  uint64_t v4 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  [v4 removeObserver:self];

  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _invalidateVisibilityAssertion];
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _invalidateKeyboardFocusPreventionAssertion];
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setDeallocating:1];
}

- (void)sceneHandle:(id)a3 didChangeEffectiveForegroundness:(BOOL)a4
{
  if (a4) {
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _acquireVisibilityAssertionIfNeeded];
  }
  else {
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _invalidateVisibilityAssertion];
  }
}

- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4
{
  id v6 = a4;
  [a3 removeObserver:self];
  [v6 addObserver:self];
}

- (void)_deactivateIfPossible
{
  uint64_t v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self shieldViewController];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if ([(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self isDeallocating])
    {
    }
    else
    {
      objc_super v5 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _appProtectionAssistant];
      char v6 = [v5 shouldShield];

      if (v6) {
        return;
      }
    }
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setShieldViewController:0];
    v7.receiver = self;
    v7.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
    [(SBDeviceApplicationSceneOverlayViewProvider *)&v7 _deactivateIfPossible];
  }
}

- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v5 showContentWithAnimation:a3 completionHandler:a4];
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _acquireKeyboardFocusPreventionAssertionIfNeeded];
}

- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v5 hideContentWithAnimation:a3 completionHandler:a4];
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _invalidateKeyboardFocusPreventionAssertion];
}

- (void)appProtectionAssistantShouldShieldDidChange:(id)a3
{
  uint64_t v4 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _appProtectionAssistant];
  int v5 = [v4 shouldShield];

  if (v5)
  {
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _activateIfPossible];
  }
  else
  {
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self _deactivateIfPossible];
  }
}

- (int64_t)priority
{
  return 5;
}

- (BOOL)contentWantsSimplifiedOrientationBehavior
{
  return 1;
}

- (void)_invalidateVisibilityAssertion
{
  id v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self visibilityAssertion];
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setVisibilityAssertion:0];
  [v3 invalidate];
}

- (void)_acquireKeyboardFocusPreventionAssertionIfNeeded
{
  id v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self keyboardFocusPreventionAssertion];

  if (!v3)
  {
    id v9 = +[SBWorkspace mainWorkspace];
    uint64_t v4 = [v9 keyboardFocusController];
    int v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    char v6 = [v5 sceneIfExists];
    objc_super v7 = [v6 identityToken];
    id v8 = [v4 preventFocusForSceneWithIdentityToken:v7 reason:@"embedded app protection scene overlay preventing focus"];
    [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setKeyboardFocusPreventionAssertion:v8];
  }
}

- (void)_invalidateKeyboardFocusPreventionAssertion
{
  id v3 = [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self keyboardFocusPreventionAssertion];
  [(SBDeviceApplicationAppProtectionSceneOverlayViewProvider *)self setKeyboardFocusPreventionAssertion:0];
  [v3 invalidate];
}

- (UIViewController)shieldViewController
{
  return self->_shieldViewController;
}

- (void)setShieldViewController:(id)a3
{
}

- (BOOL)isDeallocating
{
  return self->_deallocating;
}

- (void)setDeallocating:(BOOL)a3
{
  self->_deallocating = a3;
}

- (BSInvalidatable)keyboardFocusPreventionAssertion
{
  return self->_keyboardFocusPreventionAssertion;
}

- (void)setKeyboardFocusPreventionAssertion:(id)a3
{
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardFocusPreventionAssertion, 0);
  objc_storeStrong((id *)&self->_visibilityAssertion, 0);
  objc_storeStrong((id *)&self->_shieldViewController, 0);
}

@end