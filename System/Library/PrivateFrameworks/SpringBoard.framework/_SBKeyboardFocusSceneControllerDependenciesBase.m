@interface _SBKeyboardFocusSceneControllerDependenciesBase
- (BKSHIDEventDeliveryManager)deliveryManager;
- (BOOL)activeTransientOverlayPresentationCanBecomeFirstResponder;
- (BOOL)activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus;
- (BOOL)hasActiveTransientOverlayPresentation;
- (BOOL)isActiveTransientOverlayPresentationIsFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isBannerKitHostingSceneWithIdentityTokenString:(id)a3;
- (BOOL)isCoverSheetHostingAnApp;
- (BOOL)isPresentingModalBannerInLongLook;
- (BOOL)isScreenDim;
- (BOOL)isShowingSystemModalAlert;
- (BOOL)isSiriVisible;
- (BOOL)isSpolightPresentedAsTransientOverlay;
- (SBKeyboardFocusSceneProviding)sceneProvider;
- (SBKeyboardFocusTarget)focusTargetForActiveTransientOverlayPresentation;
- (_SBKeyboardFocusSceneControllerDependenciesBase)initWithScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5;
- (_UIEventDeferringSystemShellBehaviorDelegate)eventDeferringSystemShellBehaviorDelegate;
- (id)focusTargetForCoverSheetHostedAppGetCameraIsHosted:(BOOL *)a3;
@end

@implementation _SBKeyboardFocusSceneControllerDependenciesBase

- (BOOL)isShowingSystemModalAlert
{
  v2 = [(id)SBApp modalAlertPresentationCoordinator];
  char v3 = [v2 isShowingSystemModalAlert];

  return v3;
}

- (BOOL)isCoverSheetHostingAnApp
{
  v2 = +[SBCoverSheetPresentationManager sharedInstance];
  char v3 = [v2 isCoverSheetHostingAnApp];

  return v3;
}

- (BOOL)isScreenDim
{
  v2 = +[SBBacklightController sharedInstance];
  char v3 = [v2 screenIsDim];

  return v3;
}

- (BOOL)isPresentingModalBannerInLongLook
{
  v2 = [(id)SBApp notificationDispatcher];
  char v3 = [v2 bannerDestination];
  char v4 = [v3 isPresentingBannerInLongLook];

  return v4;
}

- (SBKeyboardFocusSceneProviding)sceneProvider
{
  return self->_sceneProvider;
}

- (BOOL)isSiriVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  char v3 = [WeakRetained assistantController];
  char v4 = [v3 isVisible];

  return v4;
}

- (_SBKeyboardFocusSceneControllerDependenciesBase)initWithScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SBKeyboardFocusSceneControllerDependenciesBase;
  v11 = [(_SBKeyboardFocusSceneControllerDependenciesBase *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_sbWindowScene, v8);
    objc_storeStrong((id *)&v12->_deliveryManager, a4);
    objc_storeStrong((id *)&v12->_sceneProvider, a5);
  }

  return v12;
}

- (BKSHIDEventDeliveryManager)deliveryManager
{
  return self->_deliveryManager;
}

- (id)focusTargetForCoverSheetHostedAppGetCameraIsHosted:(BOOL *)a3
{
  char v4 = +[SBCoverSheetPresentationManager sharedInstance];
  v5 = [v4 coverSheetHostedAppSceneHandle];
  v6 = [v5 application];
  v7 = [v5 sceneIfExists];
  if (v7)
  {
    id v8 = +[SBApplicationController sharedInstance];
    id v9 = [v8 cameraApplication];
    *a3 = [v6 isEqual:v9];

    id v10 = +[SBKeyboardFocusTarget targetForFBScene:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isBannerKitHostingSceneWithIdentityTokenString:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  v6 = [WeakRetained bannerController];
  v7 = [v6 presenter];
  id v8 = [v7 presentedPresentables];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98___SBKeyboardFocusSceneControllerDependenciesBase_isBannerKitHostingSceneWithIdentityTokenString___block_invoke;
  v12[3] = &unk_1E6AF74E8;
  id v13 = v4;
  id v9 = v4;
  char v10 = objc_msgSend(v8, "bs_containsObjectPassingTest:", v12);

  return v10;
}

- (BOOL)hasActiveTransientOverlayPresentation
{
  v2 = +[SBMainWorkspace sharedInstanceIfExists];
  char v3 = [v2 transientOverlayPresentationManager];
  char v4 = [v3 hasActivePresentation];

  return v4;
}

- (BOOL)activeTransientOverlayPresentationCanBecomeFirstResponder
{
  v2 = +[SBMainWorkspace sharedInstanceIfExists];
  char v3 = [v2 transientOverlayPresentationManager];

  if ([v3 canActivePresentationBecomeLocalFirstResponder]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 canActivePresentationBecomeFirstResponder];
  }

  return v4;
}

- (BOOL)activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus
{
  BOOL v2 = [(_SBKeyboardFocusSceneControllerDependenciesBase *)self hasActiveTransientOverlayPresentation];
  if (v2)
  {
    char v3 = +[SBMainWorkspace sharedInstanceIfExists];
    char v4 = [v3 transientOverlayPresentationManager];
    char v5 = [v4 shouldUseSceneBasedKeyboardFocusForActivePresentation];

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (BOOL)isSpolightPresentedAsTransientOverlay
{
  BOOL v2 = +[SBMainWorkspace sharedInstanceIfExists];
  char v3 = [v2 transientOverlayPresentationManager];
  char v4 = [v3 hasActiveSpotlightPresentation];

  return v4;
}

- (BOOL)isActiveTransientOverlayPresentationIsFromSceneWithIdentityTokenString:(id)a3
{
  id v3 = a3;
  char v4 = +[SBMainWorkspace sharedInstanceIfExists];
  char v5 = [v4 transientOverlayPresentationManager];
  char v6 = [v5 isTopmostPresentationFromSceneWithIdentityTokenString:v3];

  return v6;
}

- (SBKeyboardFocusTarget)focusTargetForActiveTransientOverlayPresentation
{
  id v3 = +[SBMainWorkspace sharedInstanceIfExists];
  char v4 = [v3 transientOverlayPresentationManager];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  char v6 = [v4 keyboardFocusTargetForSBWindowScene:WeakRetained];

  return (SBKeyboardFocusTarget *)v6;
}

- (_UIEventDeferringSystemShellBehaviorDelegate)eventDeferringSystemShellBehaviorDelegate
{
  return (_UIEventDeferringSystemShellBehaviorDelegate *)+[SBKeyboardFocusCoordinator sharedInstance];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneProvider, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

@end