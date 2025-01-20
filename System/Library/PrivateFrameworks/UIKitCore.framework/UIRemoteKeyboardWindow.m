@interface UIRemoteKeyboardWindow
+ (BOOL)_isHostedInAnotherProcess;
+ (id)remoteKeyboardWindowForScreen:(id)a3 create:(BOOL)a4;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_canIgnoreInteractionEvents;
- (BOOL)_isAlwaysKeyboardWindow;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_isFullscreen;
- (BOOL)_isHostedInAnotherProcess;
- (BOOL)_isRemoteKeyboardWindow;
- (BOOL)_isTextEffectsWindowNotificationOwner;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_matchingOptions:(id)a3;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)_wantsSceneAssociation;
- (BOOL)isInternalWindow;
- (BOOL)isTransparentFocusItem;
- (BOOL)shouldAttachBindable;
- (BOOL)shouldDetachBindable;
- (FBSSceneIdentityToken)activeSceneIdentity;
- (NSDictionary)_options;
- (UIScreen)_intendedScreen;
- (id)_initBasicWithScreen:(id)a3 options:(id)a4;
- (id)_initWithScreen:(id)a3 options:(id)a4;
- (id)_layerForCoordinateSpaceConversion;
- (int64_t)_orientationForClassicPresentation;
- (int64_t)_orientationInSceneSpace;
- (void)_configureAlphaIfNecessary;
- (void)_resetScene;
- (void)_setRotatableClient:(id)a3 toOrientation:(int64_t)a4 updateStatusBar:(BOOL)a5 duration:(double)a6 force:(BOOL)a7 isRotating:(BOOL)a8;
- (void)attachBindable;
- (void)dealloc;
- (void)detachBindable;
- (void)endDisablingInterfaceAutorotation;
- (void)invalidate;
- (void)resetScene;
- (void)setWindowLevel:(double)a3;
@end

@implementation UIRemoteKeyboardWindow

void __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[_UIObjectPerScreen objectOfClass:*(void *)(a1 + 56) forScreen:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40) createIfNecessary:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v5)
  {
    v6 = [v5 rootViewController];
    if (*(unsigned char *)(a1 + 64)) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setHidden:0];
    }
    if (!v6)
    {
      v6 = objc_alloc_init(UIInputWindowController);
      [(UIInputWindowController *)v6 setShouldNotifyRemoteKeyboards:0];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRootViewController:v6];
    }
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!*(unsigned char *)(v7 + 1200))
    {
      *(unsigned char *)(v7 + 1200) = 1;
      v8 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
      v9 = [v8 rootViewController];

      uint64_t v12 = MEMORY[0x1E4F143A8];
      id v13 = v9;
      v14 = v6;
      id v10 = v9;
      v11 = +[UIInputViewAnimationStyle animationStyleImmediate];
      [(UIInputWindowController *)v14 performOperations:&v12 withAnimationStyle:v11];

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _matchDeviceOrientation];
    }
  }
}

+ (id)remoteKeyboardWindowForScreen:(id)a3 create:(BOOL)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__137;
  v23 = __Block_byref_object_dispose__137;
  id v24 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1ED3F79D8];
  if (dyld_program_sdk_at_least())
  {
    v8 = [NSNumber numberWithDouble:10000001.0];
    [v7 setObject:v8 forKey:@"Level"];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke;
  v13[3] = &unk_1E52E3718;
  v16 = &v19;
  id v17 = a1;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  BOOL v18 = a4;
  +[UIView performWithoutAnimation:v13];
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

+ (BOOL)_isHostedInAnotherProcess
{
  return 0;
}

uint64_t __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) transferPlacementStateToInputWindowController:*(void *)(a1 + 40)];
}

- (id)_initBasicWithScreen:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = +[_UIRemoteKeyboards keyboardWindowSceneForScreen:v5 create:1];
  if (!+[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow])
  {
    uint64_t v7 = [(id)UIApp _keyWindowForScreen:v5];
    v8 = [v7 windowScene];

    if (!v8)
    {
      v8 = +[UIWindowScene _keyWindowScene]();
      id v9 = [v8 screen];

      if (v9 != v5)
      {

LABEL_6:
        v8 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v5];
        goto LABEL_7;
      }
      if (!v8) {
        goto LABEL_6;
      }
    }
LABEL_7:
    [v6 _setSettingsScene:v8];
  }
  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v5 bounds];
  v15.receiver = self;
  v15.super_class = (Class)UIRemoteKeyboardWindow;
  id v12 = -[UITextEffectsWindow _initWithFrame:debugName:windowScene:](&v15, sel__initWithFrame_debugName_windowScene_, 0, v6, v10, v11);
  id v13 = v12;
  if (v12) {
    [v12 setPriorityLevel:10];
  }

  return v13;
}

- (id)_initWithScreen:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(UIRemoteKeyboardWindow *)self _initBasicWithScreen:v7 options:v8];
  double v10 = v9;
  if (v9)
  {
    [v9 setScreen:v7];
    objc_storeStrong(v10 + 149, a3);
    objc_storeStrong(v10 + 148, a4);
    double v11 = [v8 objectForKey:0x1ED14AE60];
    *((unsigned char *)v10 + 936) = [v11 BOOLValue];

    [v10 _commonInitWithOptions:v8];
    [v10 _configureAlphaIfNecessary];
    id v12 = v10;
  }

  return v10;
}

- (BOOL)_matchingOptions:(id)a3
{
  return 1;
}

- (UIScreen)_intendedScreen
{
  return (UIScreen *)self->_perScreenOptions;
}

- (NSDictionary)_options
{
  return (NSDictionary *)*(id *)&self->super._hostedViewReference.size.height;
}

- (void)invalidate
{
}

- (BOOL)isInternalWindow
{
  if (qword_1EB25C678 != -1) {
    dispatch_once(&qword_1EB25C678, &__block_literal_global_369);
  }
  return _MergedGlobals_47_0;
}

void __42__UIRemoteKeyboardWindow_isInternalWindow__block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    _MergedGlobals_47_0 = 1;
  }
  else
  {
    if (qword_1EB25C730 != -1) {
      dispatch_once(&qword_1EB25C730, &__block_literal_global_1106_0);
    }
    v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    id v1 = [v0 valueForPreferenceKey:@"HideRemoteKeyboardWindow"];

    _MergedGlobals_47_0 = [v1 BOOLValue];
  }
}

- (BOOL)_isAlwaysKeyboardWindow
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 1;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_isHostedInAnotherProcess
{
  uint64_t v2 = objc_opt_class();
  return [v2 _isHostedInAnotherProcess];
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_canIgnoreInteractionEvents
{
  return 0;
}

- (int64_t)_orientationInSceneSpace
{
  if (![(id)UIApp isFrontBoard]) {
    return self->super.super.super.super._viewOrientation;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIRemoteKeyboardWindow;
  return [(UIWindow *)&v4 _orientationInSceneSpace];
}

- (BOOL)_isFullscreen
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v2 raise:v3, @"%@ is in a separate scene, and cannot deduce this value", v5 format];

  return 1;
}

- (void)setWindowLevel:(double)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = -10000001.0;
  }
  else
  {
    int v5 = dyld_program_sdk_at_least();
    BOOL v6 = a3 >= 10000001.0 || v5 == 0;
    if (!v6 && ![(id)UIApp _isSpringBoard]) {
      a3 = 10000001.0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UIRemoteKeyboardWindow;
  [(UIWindow *)&v7 setWindowLevel:a3];
}

- (void)_setRotatableClient:(id)a3 toOrientation:(int64_t)a4 updateStatusBar:(BOOL)a5 duration:(double)a6 force:(BOOL)a7 isRotating:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  objc_super v15 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  char v16 = [v15 snapshotting];

  if ((v16 & 1) == 0)
  {
    id v17 = [(UITextEffectsWindow *)self rootViewController];
    int v18 = [v17 inhibitRotationAnimation];
    double v19 = 0.0;
    if (!v18) {
      double v19 = a6;
    }
    v20.receiver = self;
    v20.super_class = (Class)UIRemoteKeyboardWindow;
    [(UIWindow *)&v20 _setRotatableClient:v14 toOrientation:a4 updateStatusBar:v11 duration:v9 force:v8 isRotating:v19];
  }
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  objc_super v4 = +[UIWindow _applicationKeyWindow];
  if ([(id)UIApp isFrontBoard]) {
    uint64_t v5 = [v4 _overriddenInterfaceOrientation];
  }
  else {
    uint64_t v5 = [v4 interfaceOrientation];
  }
  if (v5 == a3) {
    char v6 = 1;
  }
  else {
    char v6 = [v4 _shouldAutorotateToInterfaceOrientation:a3];
  }

  return v6;
}

- (BOOL)_isRemoteKeyboardWindow
{
  return 1;
}

- (BOOL)_isTextEffectsWindowNotificationOwner
{
  return 0;
}

- (id)_layerForCoordinateSpaceConversion
{
  return self->super.super.super.super._transformLayer;
}

- (BOOL)shouldAttachBindable
{
  if ([(id)UIApp _isSpringBoard]
    && ![(id)UIApp disablesFrontBoardImplicitWindowScenes])
  {
    return 0;
  }
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(UIWindow *)self screen];
  uint64_t v5 = [v3 remoteKeyboardWindowForScreen:v4 create:0];

  BOOL v6 = v5 == self || LOBYTE(self->_intendedScreen) == 0;
  return v6;
}

- (void)attachBindable
{
  if (!*(void *)&self->_arePlaceholdersInitialised)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F62980]);
    objc_super v4 = [(UIWindow *)self _boundContext];
    uint64_t v5 = [v3 initWithTrackingContext:v4];
    BOOL v6 = *(void **)&self->_arePlaceholdersInitialised;
    *(void *)&self->_arePlaceholdersInitialised = v5;

    objc_setAssociatedObject(self, &kKeyboardSceneLayer, *(id *)&self->_arePlaceholdersInitialised, (void *)0x301);
  }
  objc_super v7 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  obj = [v7 requiredScene];

  BOOL v8 = obj;
  p_keyboardSceneLayer = &self->_keyboardSceneLayer;
  keyboardSceneLayer = self->_keyboardSceneLayer;
  if (keyboardSceneLayer) {
    BOOL v11 = obj == keyboardSceneLayer;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    [(FBSSceneLayer *)keyboardSceneLayer detachLayer:*(void *)&self->_arePlaceholdersInitialised];
    BOOL v8 = obj;
  }
  objc_storeStrong((id *)&self->_keyboardSceneLayer, v8);
  [(FBSSceneLayer *)*p_keyboardSceneLayer detachLayer:*(void *)&self->_arePlaceholdersInitialised];
  if (!+[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow])
  {
    id v12 = +[UIScene _sceneForFBSScene:*p_keyboardSceneLayer];
    id v13 = [(UIWindow *)self windowScene];
    [v13 _setSettingsScene:v12];
  }
  [(FBSSceneLayer *)*p_keyboardSceneLayer attachLayer:*(void *)&self->_arePlaceholdersInitialised];
}

- (BOOL)shouldDetachBindable
{
  if ([(id)UIApp _isSpringBoard]
    && ![(id)UIApp disablesFrontBoardImplicitWindowScenes])
  {
    LOBYTE(keyboardSceneLayer) = 0;
  }
  else
  {
    id v3 = objc_opt_class();
    keyboardSceneLayer = [(UIWindow *)self screen];
    objc_super v4 = [v3 remoteKeyboardWindowForScreen:keyboardSceneLayer create:0];

    LOBYTE(keyboardSceneLayer) = 1;
    if (v4 != self)
    {
      if (v4)
      {
        keyboardSceneLayer = self->_keyboardSceneLayer;
        if (keyboardSceneLayer)
        {
          BOOL v6 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
          objc_super v7 = [v6 requiredScene];
          LOBYTE(keyboardSceneLayer) = keyboardSceneLayer != v7;
        }
      }
    }
  }
  return (char)keyboardSceneLayer;
}

- (void)detachBindable
{
  if (*(void *)&self->_arePlaceholdersInitialised)
  {
    -[FBSSceneLayer detachLayer:](self->_keyboardSceneLayer, "detachLayer:");
    objc_setAssociatedObject(self, &kKeyboardSceneLayer, 0, (void *)0x301);
    id v3 = *(void **)&self->_arePlaceholdersInitialised;
    *(void *)&self->_arePlaceholdersInitialised = 0;
  }
  keyboardSceneLayer = self->_keyboardSceneLayer;
  self->_keyboardSceneLayer = 0;
}

- (FBSSceneIdentityToken)activeSceneIdentity
{
  return (FBSSceneIdentityToken *)[(FBSSceneLayer *)self->_keyboardSceneLayer identityToken];
}

- (void)_resetScene
{
  if ([(UIRemoteKeyboardWindow *)self shouldDetachBindable]) {
    [(UIRemoteKeyboardWindow *)self detachBindable];
  }
  if ([(UIRemoteKeyboardWindow *)self shouldAttachBindable]) {
    [(UIRemoteKeyboardWindow *)self attachBindable];
  }
  LOBYTE(self->_activeScene) = 0;
}

- (void)resetScene
{
  if ([(UIWindow *)self isRotating])
  {
    LOBYTE(self->_activeScene) = 1;
  }
  else
  {
    [(UIRemoteKeyboardWindow *)self _resetScene];
  }
}

- (void)endDisablingInterfaceAutorotation
{
  v3.receiver = self;
  v3.super_class = (Class)UIRemoteKeyboardWindow;
  [(UIWindow *)&v3 endDisablingInterfaceAutorotation];
  if (LOBYTE(self->_activeScene)) {
    [(UIRemoteKeyboardWindow *)self _resetScene];
  }
}

- (int64_t)_orientationForClassicPresentation
{
  return self->super.super.super.super._viewOrientation;
}

- (void)dealloc
{
  objc_super v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  [v3 _lostWindow:self];

  objc_super v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  uint64_t v5 = [v4 keyboardWindow];
  if (v5 == self)
  {
    BOOL v6 = objc_opt_class();
    objc_super v7 = [(UIWindow *)self screen];
    BOOL v8 = [v6 remoteKeyboardWindowForScreen:v7 create:0];

    if (v8) {
      goto LABEL_5;
    }
    objc_super v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [v4 setWindowEnabled:0];
  }
  else
  {
  }
LABEL_5:
  v9.receiver = self;
  v9.super_class = (Class)UIRemoteKeyboardWindow;
  [(UITextEffectsWindow *)&v9 dealloc];
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (void)_configureAlphaIfNecessary
{
  if (qword_1EB25C680 != -1) {
    dispatch_once(&qword_1EB25C680, &__block_literal_global_103_1);
  }
  if (byte_1EB25C669)
  {
    [(UIView *)self setAlpha:0.8];
  }
}

void __52__UIRemoteKeyboardWindow__configureAlphaIfNecessary__block_invoke()
{
  if (qword_1EB25C738 != -1) {
    dispatch_once(&qword_1EB25C738, &__block_literal_global_1117);
  }
  v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v1 = [v0 valueForPreferenceKey:@"TranslucentKeyboard"];

  byte_1EB25C669 = [v1 BOOLValue];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSceneLayer, 0);
  objc_storeStrong((id *)&self->_arePlaceholdersInitialised, 0);
  objc_storeStrong((id *)&self->_perScreenOptions, 0);
  objc_storeStrong((id *)&self->super._hostedViewReference.size.height, 0);
}

@end