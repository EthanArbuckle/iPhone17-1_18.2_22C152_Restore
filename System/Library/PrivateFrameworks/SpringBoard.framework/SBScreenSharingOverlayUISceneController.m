@interface SBScreenSharingOverlayUISceneController
+ (BOOL)_isEssoniteEnabled;
+ (id)_setupInfo;
- (BOOL)_canSetAdditionalRootLayerTransform;
- (BSInvalidatable)_requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion;
- (NSValue)_clientPreferredAdditionalRootLayerTransform;
- (id)_embeddedDisplayWindowScene;
- (id)_rootSceneWindow;
- (id)_systemGestureWindow;
- (void)_setCanSetAdditionalRootLayerTransform:(BOOL)a3;
- (void)_setClientPreferredAdditionalRootLayerTransform:(id)a3;
- (void)_setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:(id)a3;
- (void)_updateAdditionalRootLayerTransformsIfNeeded;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scenePresenter:(id)a3 didPresentScene:(id)a4;
- (void)scenePresenter:(id)a3 willDismissScene:(id)a4;
- (void)setDefaultPresenter:(id)a3;
@end

@implementation SBScreenSharingOverlayUISceneController

+ (BOOL)_isEssoniteEnabled
{
  if (_isEssoniteEnabled_onceToken != -1) {
    dispatch_once(&_isEssoniteEnabled_onceToken, &__block_literal_global_290);
  }
  return _isEssoniteEnabled__isEssoniteEnabled;
}

void __61__SBScreenSharingOverlayUISceneController__isEssoniteEnabled__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FADBD0]);
  _isEssoniteEnabled__isEssoniteEnabled = [v0 screenSharingRemoteControlEnabled];
}

+ (id)_setupInfo
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v8[0] = @"class";
  v9[0] = objc_opt_class();
  v8[1] = @"enabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isEssoniteEnabled"));
  v9[1] = v3;
  v9[2] = @"SBTraitsParticipantRoleSystemUIScene";
  v8[2] = @"traitsRole";
  v8[3] = @"hostLevel";
  v9[3] = &unk_1F3348CB8;
  v8[4] = @"jobLabel";
  v4 = objc_opt_new();
  v5 = [v4 uiSceneSessionRole];
  v9[4] = v5;
  v9[5] = &unk_1F334ABC8;
  v8[5] = @"presentationStyle";
  v8[6] = @"vendingStrategy";
  v9[6] = &unk_1F334ABC8;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:7];

  return v6;
}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  id v5 = a4;
  [(SBScreenSharingOverlayUISceneController *)self _setCanSetAdditionalRootLayerTransform:0];
  [v5 removeObserver:self];
}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  id v7 = a4;
  id v5 = [v7 clientSettings];
  v6 = [v5 preferredSystemRootTransform];
  [(SBScreenSharingOverlayUISceneController *)self _setClientPreferredAdditionalRootLayerTransform:v6];

  [(SBScreenSharingOverlayUISceneController *)self _setCanSetAdditionalRootLayerTransform:1];
  [v7 addObserver:self];
}

- (void)setDefaultPresenter:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBScreenSharingOverlayUISceneController;
  [(SBSystemUISceneController *)&v5 setDefaultPresenter:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 setPresentingDelegate:self];
  }
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6 = [a3 clientSettings];
  objc_super v5 = [v6 preferredSystemRootTransform];
  [(SBScreenSharingOverlayUISceneController *)self _setClientPreferredAdditionalRootLayerTransform:v5];
}

- (id)_embeddedDisplayWindowScene
{
  v2 = [(id)SBApp windowSceneManager];
  v3 = [v2 embeddedDisplayWindowScene];

  return v3;
}

- (id)_systemGestureWindow
{
  v2 = [(SBScreenSharingOverlayUISceneController *)self _embeddedDisplayWindowScene];
  v3 = [v2 systemGestureManager];
  id v4 = [v3 windowForSystemGestures];

  return v4;
}

- (id)_rootSceneWindow
{
  v2 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
  v3 = [v2 rootWindow];

  return v3;
}

- (NSValue)_clientPreferredAdditionalRootLayerTransform
{
  clientPreferredAdditionalRootLayerTransform = self->__clientPreferredAdditionalRootLayerTransform;
  if (clientPreferredAdditionalRootLayerTransform)
  {
    v3 = clientPreferredAdditionalRootLayerTransform;
  }
  else
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v6[0] = *MEMORY[0x1E4F1DAB8];
    v6[1] = v4;
    v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v3 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:v6];
  }
  return v3;
}

- (void)_setClientPreferredAdditionalRootLayerTransform:(id)a3
{
  id v5 = a3;
  if (!-[NSValue isEqualToValue:](self->__clientPreferredAdditionalRootLayerTransform, "isEqualToValue:"))
  {
    objc_storeStrong((id *)&self->__clientPreferredAdditionalRootLayerTransform, a3);
    if ([(SBScreenSharingOverlayUISceneController *)self _canSetAdditionalRootLayerTransform])
    {
      [(SBScreenSharingOverlayUISceneController *)self _updateAdditionalRootLayerTransformsIfNeeded];
    }
  }
}

- (void)_setCanSetAdditionalRootLayerTransform:(BOOL)a3
{
  if (self->__canSetAdditionalRootLayerTransform != a3)
  {
    self->__canSetAdditionalRootLayerTransform = a3;
    [(SBScreenSharingOverlayUISceneController *)self _updateAdditionalRootLayerTransformsIfNeeded];
  }
}

- (void)_updateAdditionalRootLayerTransformsIfNeeded
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v17.c = v3;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if ([(SBScreenSharingOverlayUISceneController *)self _canSetAdditionalRootLayerTransform])
  {
    long long v4 = [(SBScreenSharingOverlayUISceneController *)self _clientPreferredAdditionalRootLayerTransform];
    id v5 = v4;
    if (v4) {
      [v4 CGAffineTransformValue];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }
    CGAffineTransform v17 = v16;
  }
  CGAffineTransform v16 = v17;
  BOOL IsIdentity = CGAffineTransformIsIdentity(&v16);
  id v7 = [(SBScreenSharingOverlayUISceneController *)self _requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion];
  v8 = v7;
  if (IsIdentity)
  {
    [v7 invalidate];

    [(SBScreenSharingOverlayUISceneController *)self _setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:0];
  }
  else
  {

    if (!v8)
    {
      v9 = [(SBScreenSharingOverlayUISceneController *)self _embeddedDisplayWindowScene];
      v10 = [v9 systemGestureManager];
      v11 = [v10 acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason:@"Screen Sharing Overlay UI requests it"];

      [(SBScreenSharingOverlayUISceneController *)self _setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:v11];
    }
  }
  v12 = [(SBScreenSharingOverlayUISceneController *)self _systemGestureWindow];
  CGAffineTransform v16 = v17;
  [v12 _setAdditionalRootLayerAffineTransform:&v16];

  v13 = [(SBScreenSharingOverlayUISceneController *)self _rootSceneWindow];
  CGAffineTransform v16 = v17;
  [v13 _setAdditionalRootLayerAffineTransform:&v16];

  v14 = +[SBTouchRegionManager sharedInstance];
  CGAffineTransform v16 = v17;
  [v14 setRootWindowTransform:&v16];

  v15 = [(id)SBApp mousePointerManager];
  CGAffineTransform v16 = v17;
  [v15 setRootWindowTransformForEmbeddedDisplay:&v16];
}

- (BOOL)_canSetAdditionalRootLayerTransform
{
  return self->__canSetAdditionalRootLayerTransform;
}

- (BSInvalidatable)_requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion
{
  return self->__requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion;
}

- (void)_setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion, 0);
  objc_storeStrong((id *)&self->__clientPreferredAdditionalRootLayerTransform, 0);
}

@end