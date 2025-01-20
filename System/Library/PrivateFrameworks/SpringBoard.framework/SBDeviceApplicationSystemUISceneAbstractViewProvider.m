@interface SBDeviceApplicationSystemUISceneAbstractViewProvider
- (BOOL)_isUnderUILock;
- (BOOL)affectsStatusBarPresentation;
- (BOOL)isActive;
- (BOOL)isVisibleOnScreen;
- (BOOL)wantsResignActiveAssertion;
- (NSString)description;
- (id)_realOverlayViewController;
- (id)acquireSystemUIScenePresentingAssertion;
- (id)dismissScene:(id)a3;
- (id)parentSceneIdentityToken;
- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4;
- (id)presentingDelegate;
- (void)_acquireSystemUIScenePresentingAssertionIfNecessary;
- (void)_activateIfPossible;
- (void)_deactivateIfPossible;
- (void)_invalidateSystemUIScenePresentingAssertion;
- (void)dealloc;
- (void)noteDisplayModeChange:(int64_t)a3;
- (void)scene:(id)a3 didChangeTraitsParticipantDelegate:(id)a4;
- (void)setPresentingDelegate:(id)a3;
@end

@implementation SBDeviceApplicationSystemUISceneAbstractViewProvider

- (void)_activateIfPossible
{
  if (self->_systemSceneUIViewController)
  {
    self->_isActive = 1;
    v2.receiver = self;
    v2.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
    [(SBDeviceApplicationSceneOverlayViewProvider *)&v2 _activateIfPossible];
  }
  else
  {
    [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)self _acquireSystemUIScenePresentingAssertionIfNecessary];
  }
}

- (void)_acquireSystemUIScenePresentingAssertionIfNecessary
{
  if (!self->_systemUIScenePresenterAssertion)
  {
    v3 = [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)self acquireSystemUIScenePresentingAssertion];
    systemUIScenePresenterAssertion = self->_systemUIScenePresenterAssertion;
    self->_systemUIScenePresenterAssertion = v3;
  }
}

- (void)noteDisplayModeChange:(int64_t)a3
{
  self->_displayMode = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemUIScenePresentingDelegate);
  [WeakRetained scenePresenterVisibilityDidChange:self];
}

- (void)setPresentingDelegate:(id)a3
{
}

- (void)dealloc
{
  [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)self _invalidateSystemUIScenePresentingAssertion];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v3 dealloc];
}

- (BOOL)wantsResignActiveAssertion
{
  return 0;
}

- (id)acquireSystemUIScenePresentingAssertion
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SBDeviceApplicationSystemUISceneAbstractViewProvider.m", 41, @"For subclasses to override, [%@] cannot be used on its own", v6 object file lineNumber description];

  return 0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)_deactivateIfPossible
{
  if (self->_isActive)
  {
    self->_isActive = 0;
    systemSceneUIViewController = self->_systemSceneUIViewController;
    self->_systemSceneUIViewController = 0;

    v4.receiver = self;
    v4.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
    [(SBDeviceApplicationSceneOverlayViewProvider *)&v4 _deactivateIfPossible];
  }
}

- (id)_realOverlayViewController
{
  return self->_systemSceneUIViewController;
}

- (BOOL)affectsStatusBarPresentation
{
  return 0;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  v5 = (*((void (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  v6 = [v5 traitsOrientedViewController];

  if (!self->_isActive || v6 != self->_systemSceneUIViewController)
  {
    objc_storeStrong((id *)&self->_systemSceneUIViewController, v6);
    [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)self _activateIfPossible];
    systemSceneUIViewController = self->_systemSceneUIViewController;
    uint64_t v8 = objc_opt_class();
    v9 = systemSceneUIViewController;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    [(UIViewController *)v11 setContainerParticipant:0];
  }

  return 0;
}

- (id)dismissScene:(id)a3
{
  return 0;
}

- (id)parentSceneIdentityToken
{
  objc_super v2 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  objc_super v3 = [v2 sceneIfExists];
  objc_super v4 = [v3 identityToken];

  return v4;
}

- (id)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemUIScenePresentingDelegate);
  return WeakRetained;
}

- (BOOL)isVisibleOnScreen
{
  objc_super v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  char v4 = [v3 overlayViewProviderIsHostedInSecureWindow:self];

  return ((v4 & 1) != 0
       || ![(SBDeviceApplicationSystemUISceneAbstractViewProvider *)self _isUnderUILock])
      && self->_displayMode == 4;
}

- (BOOL)_isUnderUILock
{
  objc_super v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  char v4 = [v3 windowSceneForOverlayViewProvider:self];
  v5 = [v4 uiLockStateProvider];
  char v6 = [v5 isUILocked];

  return v6;
}

- (void)_invalidateSystemUIScenePresentingAssertion
{
  [(BSInvalidatable *)self->_systemUIScenePresenterAssertion invalidate];
  systemUIScenePresenterAssertion = self->_systemUIScenePresenterAssertion;
  self->_systemUIScenePresenterAssertion = 0;
}

- (void)scene:(id)a3 didChangeTraitsParticipantDelegate:(id)a4
{
  systemSceneUIViewController = self->_systemSceneUIViewController;
  uint64_t v5 = objc_opt_class();
  char v6 = systemSceneUIViewController;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = v7;

  [(UIViewController *)v8 setContainerParticipant:0];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
  char v4 = [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)&v9 description];
  uint64_t v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  char v6 = [v5 sceneIdentifier];
  v7 = [v3 stringWithFormat:@"%@ - %@", v4, v6];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemUIScenePresentingDelegate);
  objc_storeStrong((id *)&self->_systemUIScenePresenterAssertion, 0);
  objc_storeStrong((id *)&self->_systemSceneUIViewController, 0);
}

@end