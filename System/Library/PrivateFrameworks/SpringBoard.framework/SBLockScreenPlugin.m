@interface SBLockScreenPlugin
+ (SBLockScreenPlugin)pluginWithName:(id)a3 activationContext:(id)a4;
+ (id)_pluginBundleForPluginWithName:(id)a3;
- (BOOL)handleDashBoardEvent:(id)a3;
- (BOOL)hidesLockScreenComplications;
- (BOOL)isCapabilityRestricted:(unint64_t)a3;
- (BOOL)isElementHidden:(int64_t)a3;
- (BOOL)pluginController:(id)a3 sendAction:(id)a4;
- (BOOL)pluginHandleEvent:(int64_t)a3;
- (CSAppearance)coverSheetAppearance;
- (CSBehavior)coverSheetBehavior;
- (NSString)description;
- (NSString)name;
- (SBLockOverlayContext)overlay;
- (SBLockScreenPlugin)initWithBundle:(id)a3 activationContext:(id)a4;
- (SBLockScreenPluginAction)pluginUnlockAction;
- (SBLockScreenPluginAgent)pluginAgent;
- (SBLockScreenPluginAppearanceContext)appearance;
- (SBLockScreenPluginController)controller;
- (SBLockScreenPluginDelegate)delegate;
- (SBLockScreenPluginViewController)pluginViewController;
- (id)auxiliaryActivationAnimationBlock;
- (id)auxiliaryDeactivationAnimationBlock;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)overrideForElement:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)pluginPriority;
- (void)_updateAppearance:(id)a3;
- (void)activatePluginController:(id)a3;
- (void)addLifecycleObserver:(id)a3;
- (void)deactivatePluginController:(id)a3;
- (void)dealloc;
- (void)enumerateLifecycleObserversUsingBlock:(id)a3;
- (void)pluginController:(id)a3 updateAppearance:(id)a4;
- (void)pluginDidDeactivateWithContext:(id)a3;
- (void)pluginWillActivateWithContext:(id)a3;
- (void)processDidExit:(id)a3;
- (void)removeLifecycleObserver:(id)a3;
- (void)setAuxiliaryActivationAnimationBlock:(id)a3;
- (void)setAuxiliaryDeactivationAnimationBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setPluginAgent:(id)a3;
@end

@implementation SBLockScreenPlugin

+ (id)_pluginBundleForPluginWithName:(id)a3
{
  id v3 = a3;
  v4 = [v3 pathComponents];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v6 = [MEMORY[0x1E4F4F7D8] mainManager];
    v7 = [v6 pluginBundleForName:v3 type:@"lockbundle"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (SBLockScreenPlugin)pluginWithName:(id)a3 activationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _pluginBundleForPluginWithName:v6];
  if ([v8 loadPlugin])
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithBundle:v8 activationContext:v7];
  }
  else
  {
    v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SBLockScreenPlugin pluginWithName:activationContext:]((uint64_t)v6, v10);
    }

    v9 = 0;
  }

  return (SBLockScreenPlugin *)v9;
}

- (SBLockScreenPlugin)initWithBundle:(id)a3 activationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SBLockScreenPlugin *)self init];
  if (v9)
  {
    v10 = v9;
    objc_storeStrong((id *)&v9->_bundle, a3);
    uint64_t v11 = [v7 name];
    bundleName = v10->_bundleName;
    v10->_bundleName = (NSString *)v11;

    uint64_t v13 = [v8 process];
    process = v10->_process;
    v10->_process = (FBProcess *)v13;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__SBLockScreenPlugin_initWithBundle_activationContext___block_invoke;
    v19[3] = &unk_1E6AFCDD8;
    v15 = v10;
    v20 = v15;
    if ([v7 loadPlugin:v19])
    {
      [(FBProcess *)v10->_process addObserver:v15];
    }
    else
    {
      controller = v15->_controller;
      v15->_controller = 0;

      v17 = SBLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SBLockScreenPlugin initWithBundle:activationContext:]((uint64_t)v7, v17);
      }

      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __55__SBLockScreenPlugin_initWithBundle_activationContext___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 conformsToProtocol:&unk_1F35B1680] & 1) != 0 || (objc_opt_respondsToSelector())
  {
    id v4 = [a2 rootViewController];
  }
  else
  {
    if (![a2 conformsToProtocol:&unk_1F33FFCC8])
    {
      id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Principal class does not conform to expected protocol" userInfo:0];
      objc_exception_throw(v11);
    }
    id v4 = objc_alloc_init((Class)a2);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;

  id v7 = [*(id *)(*(void *)(a1 + 32) + 32) pluginViewController];
  id v8 = (id)[v7 view];

  v9 = *(void **)(*(void *)(a1 + 32) + 32);
  return objc_msgSend(v9, "setPluginAgent:");
}

- (void)dealloc
{
  [(FBProcess *)self->_process removeObserver:self];
  [(SBLockScreenPluginController *)self->_controller setPluginAgent:0];
  v3.receiver = self;
  v3.super_class = (Class)SBLockScreenPlugin;
  [(SBLockScreenPlugin *)&v3 dealloc];
}

- (SBLockScreenPluginAppearanceContext)appearance
{
  return self->_appearance;
}

- (BOOL)isElementHidden:(int64_t)a3
{
  objc_super v3 = [(SBLockScreenPlugin *)self overrideForElement:a3];
  char v4 = [v3 isHidden];

  return v4;
}

- (id)overrideForElement:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v4 = [(SBLockScreenPlugin *)self appearance];
  uint64_t v5 = [v4 elementOverrides];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 element] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isCapabilityRestricted:(unint64_t)a3
{
  char v4 = [(SBLockScreenPlugin *)self appearance];
  LOBYTE(a3) = (a3 & ~[v4 restrictedCapabilities]) == 0;

  return a3;
}

- (CSAppearance)coverSheetAppearance
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if ([(SBLockScreenPluginAppearanceContext *)self->_appearance isHidden])
  {
    objc_super v3 = 0;
    goto LABEL_45;
  }
  char v4 = (void *)MEMORY[0x1E4F5E390];
  uint64_t v5 = [(SBLockScreenPlugin *)self name];
  uint64_t v6 = [v4 appearanceWithIdentifier:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = [(SBLockScreenPlugin *)self appearance];
  uint64_t v9 = [v8 backgroundStyle];

  switch(v9)
  {
    case 3:
      goto LABEL_6;
    case 2:
      v10 = objc_opt_new();
      id v11 = [v10 priority:30];
      v12 = v11;
      long long v13 = &unk_1F3349CC8;
      goto LABEL_8;
    case 1:
LABEL_6:
      v10 = objc_opt_new();
      id v11 = [v10 priority:30];
      v12 = v11;
      long long v13 = &unk_1F3349CB0;
LABEL_8:
      long long v14 = [v11 style:v13];
      [v7 addObject:v14];

      break;
  }
  v71 = (void *)v6;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v15 = [(SBLockScreenPluginAppearanceContext *)self->_appearance elementOverrides];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (!v16) {
    goto LABEL_30;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v73;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v73 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      uint64_t v21 = [v20 element];
      if (v21 == 3)
      {
        v22 = (void *)[objc_alloc(MEMORY[0x1E4FA5F50]) initWithString:0 accessoryView:0];
        v23 = [MEMORY[0x1E4F5E3C0] dateView];
        if ([v20 isHidden])
        {
          [v22 setString:&stru_1F3084718];
          [v23 setView:v22];
        }
        else
        {
          v26 = [v20 text];
          if (v26)
          {
            [v22 setString:v26];
            v27 = v22;
          }
          else
          {
            v27 = 0;
          }
          [v23 setView:v27];
        }
        [v23 setPriority:30];
        [v7 addObject:v23];
LABEL_26:

        goto LABEL_27;
      }
      if (v21 != 2)
      {
        if (v21 != 1) {
          continue;
        }
        v22 = [MEMORY[0x1E4F5E3C0] statusBar];
        v23 = [v22 priority:30];
        v24 = objc_msgSend(v23, "hidden:", objc_msgSend(v20, "isHidden"));
        [v7 addObject:v24];

        goto LABEL_26;
      }
      v25 = [MEMORY[0x1E4F5E3C0] dateView];
      v22 = [v25 priority:30];

      objc_msgSend(v22, "setHidden:", objc_msgSend(v20, "isHidden"));
      [v7 addObject:v22];
LABEL_27:
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v72 objects:v76 count:16];
  }
  while (v17);
LABEL_30:

  objc_super v3 = v71;
  if ([v70[6] presentationStyle] == 1)
  {
    uint64_t v28 = objc_opt_class();
    v29 = [v70 viewController];
    v30 = [v29 view];
    v31 = SBSafeCast(v28, v30);

    if (v31)
    {
      int v32 = [v31 showsDateView];
      v33 = objc_opt_new();
      v34 = v33;
      if (v32)
      {
        v35 = [v33 hidden:0];
        v36 = v35;
        uint64_t v37 = 1;
      }
      else
      {
        v35 = [v33 hidden:1];
        v36 = v35;
        uint64_t v37 = 0;
      }
      v38 = [v35 vibrantAndCentered:v37];
      v39 = [v38 priority:30];
      [v7 addObject:v39];
    }
    else
    {
      v34 = [MEMORY[0x1E4F5E3C0] dateView];
      v36 = [v34 hidden:1];
      v38 = [v36 priority:30];
      [v7 addObject:v38];
    }

    v40 = [MEMORY[0x1E4F5E3C0] backgroundContent];
    v41 = [v40 priority:30];
    v42 = [v41 hidden:1];
    [v7 addObject:v42];

    v43 = [MEMORY[0x1E4F5E3C0] pageContent];
    v44 = [v43 priority:30];
    v45 = [v44 hidden:1];
    [v7 addObject:v45];

    v46 = [MEMORY[0x1E4F5E3C0] pageControl];
    v47 = [v46 priority:30];
    v48 = [v47 hidden:1];
    [v7 addObject:v48];

    v49 = [MEMORY[0x1E4F5E3C0] footerCallToActionLabel];
    v50 = [v49 priority:30];
    v51 = [v50 hidden:1];
    [v7 addObject:v51];

    v52 = [MEMORY[0x1E4F5E3C0] footerStatusLabel];
    v53 = [v52 priority:30];
    v54 = [v53 hidden:1];
    [v7 addObject:v54];

    v55 = [MEMORY[0x1E4F5E3C0] proudLock];
    v56 = [v55 priority:30];
    v57 = [v56 hidden:1];
    [v7 addObject:v57];

    v58 = [MEMORY[0x1E4F5E3C0] controlCenterGrabber];
    v59 = [v58 priority:30];
    v60 = [v59 hidden:1];
    [v7 addObject:v60];
  }
  [v71 setComponents:v7];
  v61 = [v70 appearance];
  uint64_t v62 = [v61 backgroundStyle];
  if ((unint64_t)(v62 - 1) < 2)
  {
    id v63 = objc_alloc(MEMORY[0x1E4F43228]);
    v64 = [MEMORY[0x1E4F428B8] whiteColor];
    v65 = v63;
    uint64_t v66 = 1;
    goto LABEL_42;
  }
  if (v62 == 3)
  {
    id v67 = objc_alloc(MEMORY[0x1E4F43228]);
    v64 = [MEMORY[0x1E4F428B8] blackColor];
    v65 = v67;
    uint64_t v66 = 2;
LABEL_42:
    v68 = (void *)[v65 initWithStyle:v66 contentColor:v64];
  }
  else
  {
    v68 = 0;
  }
  [v71 setLegibilitySettings:v68];

LABEL_45:
  return (CSAppearance *)v3;
}

- (CSBehavior)coverSheetBehavior
{
  objc_super v3 = [MEMORY[0x1E4F5E3A8] behavior];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  int8x8_t v4 = (int8x8_t)[(SBLockScreenPluginAppearanceContext *)self->_appearance restrictedCapabilities];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  long long v13 = (void (*)(void *))__40__SBLockScreenPlugin_coverSheetBehavior__block_invoke;
  long long v14 = &unk_1E6AFCE00;
  long long v15 = &v16;
  uint64_t v5 = v12;
  if (v4)
  {
    char v20 = 0;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4);
    v6.i16[0] = vaddlv_u8(v6);
    int v7 = v6.i32[0];
    if (v6.i32[0])
    {
      unint64_t v8 = 0;
      do
      {
        if (((1 << v8) & *(void *)&v4) != 0)
        {
          v13(v5);
          if (v20) {
            break;
          }
          --v7;
        }
        if (v8 > 0x3E) {
          break;
        }
        ++v8;
      }
      while (v7 > 0);
    }
  }

  [v3 setRestrictedCapabilities:v17[3]];
  unint64_t v9 = [(SBLockScreenPluginAppearanceContext *)self->_appearance notificationBehavior];
  if (v9 >= 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_1D8FD10E8[v9];
  }
  [v3 setNotificationBehavior:v10];
  [v3 setIdleTimerDuration:0];
  [v3 setIdleTimerMode:1];
  [v3 setIdleWarnMode:1];
  _Block_object_dispose(&v16, 8);
  return (CSBehavior *)v3;
}

void *__40__SBLockScreenPlugin_coverSheetBehavior__block_invoke(void *result, uint64_t a2)
{
  if (a2 <= 31)
  {
    if (a2 > 7)
    {
      if (a2 == 8)
      {
        result += 4;
        uint64_t v2 = 56;
      }
      else
      {
        if (a2 != 16) {
          return result;
        }
        result += 4;
        uint64_t v2 = 2048;
      }
    }
    else if (a2 == 2)
    {
      result += 4;
      uint64_t v2 = 2;
    }
    else
    {
      if (a2 != 4) {
        return result;
      }
      result += 4;
      uint64_t v2 = 4;
    }
  }
  else if (a2 <= 127)
  {
    if (a2 == 32)
    {
      uint64_t v3 = result[4];
      result += 4;
      *(void *)(*(void *)(v3 + 8) + 24) |= 8uLL;
      uint64_t v2 = 16;
    }
    else
    {
      if (a2 != 64) {
        return result;
      }
      result += 4;
      uint64_t v2 = 512;
    }
  }
  else
  {
    switch(a2)
    {
      case 128:
        result += 4;
        uint64_t v2 = 64;
        break;
      case 256:
        result += 4;
        uint64_t v2 = 128;
        break;
      case 512:
        result += 4;
        uint64_t v2 = 0x4000;
        break;
      default:
        return result;
    }
  }
  *(void *)(*(void *)(*result + 8) + 24) |= v2;
  return result;
}

- (BOOL)handleDashBoardEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 type] - 27;
  if (v5 <= 6
    && ((0x7Bu >> v5) & 1) != 0
    && [(SBLockScreenPlugin *)self pluginHandleEvent:qword_1D8FD1100[v5]])
  {
    char v6 = [v4 isConsumable];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_updateAppearance:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA7950];
  id v5 = a3;
  char v6 = (SBLockScreenPluginAppearanceContext *)[[v4 alloc] initWithAppearance:v5];

  appearance = self->_appearance;
  self->_appearance = v6;
}

- (int64_t)pluginPriority
{
  return [(SBLockScreenPluginController *)self->_controller pluginPriority];
}

- (SBLockScreenPluginViewController)pluginViewController
{
  return (SBLockScreenPluginViewController *)[(SBLockScreenPluginController *)self->_controller pluginViewController];
}

- (void)pluginWillActivateWithContext:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)[v6 copy];
    [v4 setAuxiliaryAnimation:0];
    [(SBLockScreenPluginController *)self->_controller pluginWillActivateWithContext:v4];
  }
  id v5 = [(SBLockScreenPluginController *)self->_controller pluginAppearance];
  [(SBLockScreenPlugin *)self _updateAppearance:v5];
}

- (void)pluginDidDeactivateWithContext:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)[v5 copy];
    [v4 setAuxiliaryAnimation:0];
    [(SBLockScreenPluginController *)self->_controller pluginDidDeactivateWithContext:v4];
  }
}

- (SBLockScreenPluginAction)pluginUnlockAction
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(SBLockScreenPluginController *)self->_controller pluginUnlockAction];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (SBLockScreenPluginAction *)v3;
}

- (BOOL)pluginHandleEvent:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  controller = self->_controller;
  return [(SBLockScreenPluginController *)controller pluginHandleEvent:a3];
}

- (void)addLifecycleObserver:(id)a3
{
  id v4 = a3;
  lifecycleObservers = self->_lifecycleObservers;
  id v8 = v4;
  if (!lifecycleObservers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v7 = self->_lifecycleObservers;
    self->_lifecycleObservers = v6;

    id v4 = v8;
    lifecycleObservers = self->_lifecycleObservers;
  }
  [(NSMutableArray *)lifecycleObservers addObject:v4];
}

- (void)removeLifecycleObserver:(id)a3
{
  [(NSMutableArray *)self->_lifecycleObservers removeObject:a3];
  if (![(NSMutableArray *)self->_lifecycleObservers count])
  {
    lifecycleObservers = self->_lifecycleObservers;
    self->_lifecycleObservers = 0;
  }
}

- (void)enumerateLifecycleObserversUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)[(NSMutableArray *)self->_lifecycleObservers copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)hidesLockScreenComplications
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  controller = self->_controller;
  return [(SBLockScreenPluginController *)controller hidesLockScreenComplications];
}

- (void)activatePluginController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  [WeakRetained activatePluginController:self];
}

- (void)deactivatePluginController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  [WeakRetained deactivatePluginController:self];
}

- (void)pluginController:(id)a3 updateAppearance:(id)a4
{
  [(SBLockScreenPlugin *)self _updateAppearance:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  id v6 = [(SBLockScreenPlugin *)self pluginAppearance];
  [WeakRetained pluginController:self updateAppearance:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  [v7 pluginAppearanceDidChange:self];
}

- (BOOL)pluginController:(id)a3 sendAction:(id)a4
{
  id v4 = self;
  p_agent = &self->_agent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_agent);
  LOBYTE(v4) = [WeakRetained pluginController:v4 sendAction:v6];

  return (char)v4;
}

- (void)processDidExit:(id)a3
{
  [a3 removeObserver:self];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBLockScreenPlugin_processDidExit___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__SBLockScreenPlugin_processDidExit___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained deactivatePluginController:*(void *)(a1 + 32)];
}

- (NSString)description
{
  return (NSString *)[(SBLockScreenPlugin *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBLockScreenPlugin *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_bundleName withName:@"name"];
  id v5 = [(BSPluginBundle *)self->_bundle identifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"identifier"];

  id v7 = (id)objc_msgSend(v3, "appendClass:withName:", -[BSPluginBundle principalClass](self->_bundle, "principalClass"), @"principalClass");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBLockScreenPlugin *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLockScreenPlugin *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBLockScreenPlugin_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __60__SBLockScreenPlugin_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"controller"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"overlay"];
}

- (SBLockScreenPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenPluginDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBLockScreenPluginController)controller
{
  return self->_controller;
}

- (SBLockOverlayContext)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (NSString)name
{
  return self->_bundleName;
}

- (id)auxiliaryActivationAnimationBlock
{
  return self->_auxiliaryActivationAnimationBlock;
}

- (void)setAuxiliaryActivationAnimationBlock:(id)a3
{
}

- (id)auxiliaryDeactivationAnimationBlock
{
  return self->_auxiliaryDeactivationAnimationBlock;
}

- (void)setAuxiliaryDeactivationAnimationBlock:(id)a3
{
}

- (SBLockScreenPluginAgent)pluginAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  return (SBLockScreenPluginAgent *)WeakRetained;
}

- (void)setPluginAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_auxiliaryDeactivationAnimationBlock, 0);
  objc_storeStrong(&self->_auxiliaryActivationAnimationBlock, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_lifecycleObservers, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_destroyWeak((id *)&self->_agent);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (void)pluginWithName:(uint64_t)a1 activationContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[SBLockScreenPlugin] No plugin bundle found named \"%@\"", (uint8_t *)&v2, 0xCu);
}

- (void)initWithBundle:(uint64_t)a1 activationContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[SBLockScreenPlugin] No root view controller was returned from %@", (uint8_t *)&v2, 0xCu);
}

@end