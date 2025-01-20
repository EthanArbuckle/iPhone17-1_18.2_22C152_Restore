@interface SBDashBoardPluginController
- (BOOL)handleEvent:(id)a3;
- (BOOL)pluginManager:(id)a3 plugin:(id)a4 handleAction:(id)a5;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSSet)components;
- (NSString)coverSheetIdentifier;
- (SBDashBoardPluginController)initWithCoverSheetViewController:(id)a3;
- (SBLockScreenActionProvider)lockScreenActionProvider;
- (_UILegibilitySettings)legibilitySettings;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_activate;
- (void)_deactivate;
- (void)_dismissPluginViewController:(id)a3 withStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_presentPluginViewController:(id)a3 withStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_setPluginViewController:(id)a3;
- (void)dealloc;
- (void)disableLockScreenPluginWithContext:(id)a3;
- (void)enableLockScreenPluginWithContext:(id)a3;
- (void)pluginManager:(id)a3 displayedPluginDidChangeFromPlugin:(id)a4 toPlugin:(id)a5;
- (void)pluginManager:(id)a3 displayedPluginDidUpdateAppearance:(id)a4;
@end

@implementation SBDashBoardPluginController

- (SBDashBoardPluginController)initWithCoverSheetViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardPluginController;
  v6 = [(SBDashBoardPluginController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    v8 = objc_alloc_init(SBLockScreenPluginManager);
    pluginManager = v7->_pluginManager;
    v7->_pluginManager = v8;

    [(CSCoverSheetViewController *)v7->_coverSheetViewController registerExternalEventHandler:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(SBDashBoardPluginController *)self _setPluginViewController:0];
  [(SBDashBoardPluginController *)self _deactivate];
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardPluginController;
  [(SBDashBoardPluginController *)&v3 dealloc];
}

- (SBLockScreenActionProvider)lockScreenActionProvider
{
  return (SBLockScreenActionProvider *)self->_pluginManager;
}

- (void)_activate
{
  [(SBLockScreenPluginManager *)self->_pluginManager setDelegate:self];
  pluginManager = self->_pluginManager;
  [(SBLockScreenPluginManager *)pluginManager setEnabled:1];
}

- (void)_deactivate
{
  [(SBLockScreenPluginManager *)self->_pluginManager setEnabled:0];
  pluginManager = self->_pluginManager;
  [(SBLockScreenPluginManager *)pluginManager setEnabled:0];
}

- (void)_setPluginViewController:(id)a3
{
  id v5 = (SBDashBoardPluginViewController *)a3;
  pluginViewController = self->_pluginViewController;
  if (pluginViewController != v5)
  {
    if (pluginViewController
      || ([(CSCoverSheetViewController *)self->_coverSheetViewController registerExternalAppearanceProvider:self], [(CSCoverSheetViewController *)self->_coverSheetViewController registerExternalBehaviorProvider:self], self->_pluginViewController))
    {
      v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[SBDashBoardPluginController _setPluginViewController:](v5);
      }

      v8 = self->_pluginViewController;
      int64_t pluginViewControllerPresentationStyle = self->_pluginViewControllerPresentationStyle;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__SBDashBoardPluginController__setPluginViewController___block_invoke;
      v13[3] = &unk_1E6AF4AC0;
      v13[4] = self;
      [(SBDashBoardPluginController *)self _dismissPluginViewController:v8 withStyle:pluginViewControllerPresentationStyle animated:v5 == 0 completion:v13];
    }
    objc_storeStrong((id *)&self->_pluginViewController, a3);
    self->_int64_t pluginViewControllerPresentationStyle = [(SBDashBoardPluginViewController *)v5 presentationStyle];
    if (!self->_pluginViewController) {
      goto LABEL_11;
    }
    v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SBDashBoardPluginController _setPluginViewController:](v5);
    }

    int64_t v11 = self->_pluginViewControllerPresentationStyle;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3;
    v12[3] = &unk_1E6AF4AC0;
    v12[4] = self;
    [(SBDashBoardPluginController *)self _presentPluginViewController:v5 withStyle:v11 animated:1 completion:v12];
    if (!self->_pluginViewController)
    {
LABEL_11:
      [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalAppearanceProvider:self];
      [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalBehaviorProvider:self];
    }
  }
}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke(uint64_t a1)
{
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__SBDashBoardPluginController__setPluginViewController___block_invoke_cold_1(a1, v2);
  }
}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3(uint64_t a1)
{
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3_cold_1(a1, v2);
  }
}

- (void)_dismissPluginViewController:(id)a3 withStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  int64_t v11 = (void (**)(void))a6;
  v12 = [(SBDashBoardPluginViewController *)self->_pluginViewController plugin];
  if (a4)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke;
    v22[3] = &unk_1E6AFCAC8;
    id v13 = v10;
    id v23 = v13;
    v25 = v11;
    id v14 = v12;
    id v24 = v14;
    v15 = (void *)MEMORY[0x1D948C7A0](v22);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_3;
    v20 = &unk_1E6B06D98;
    id v21 = v14;
    [v21 enumerateLifecycleObserversUsingBlock:&v17];
    if (a4 == 1)
    {
      v16 = [(CSCoverSheetViewController *)self->_coverSheetViewController mainPagePresentationViewController];
      [v16 dismissContentViewController:v13 animated:v7 completion:v15];
    }
    else if (a4 == 2)
    {
      -[CSCoverSheetViewController _dismissModalViewController:animated:completion:](self->_coverSheetViewController, "_dismissModalViewController:animated:completion:", v13, v7, v15, v17, v18, v19, v20);
    }
  }
  else if (v11)
  {
    v11[2](v11);
  }
}

void __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresenter:0];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  objc_super v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_2;
  v4[3] = &unk_1E6B06D98;
  id v5 = v3;
  [v5 enumerateLifecycleObserversUsingBlock:v4];
}

uint64_t __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didDismissLockScreenPlugin:*(void *)(a1 + 32)];
}

uint64_t __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 willDismissLockScreenPlugin:*(void *)(a1 + 32)];
}

- (void)_presentPluginViewController:(id)a3 withStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  int64_t v11 = (void (**)(void))a6;
  v12 = [v10 plugin];
  if (a4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke;
    v18[3] = &unk_1E6AF5A78;
    v20 = v11;
    id v13 = v12;
    id v19 = v13;
    id v14 = (void *)MEMORY[0x1D948C7A0](v18);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_3;
    v16[3] = &unk_1E6B06D98;
    id v17 = v13;
    [v17 enumerateLifecycleObserversUsingBlock:v16];
    if (a4 == 1)
    {
      v15 = [(CSCoverSheetViewController *)self->_coverSheetViewController mainPagePresentationViewController];
      [v15 presentContentViewController:v10 animated:v7 completion:v14];
    }
    else if (a4 == 2)
    {
      [(CSCoverSheetViewController *)self->_coverSheetViewController _presentModalViewController:v10 animated:v7 completion:v14];
    }
  }
  else if (v11)
  {
    v11[2](v11);
  }
}

void __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  objc_super v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_2;
  v4[3] = &unk_1E6B06D98;
  id v5 = v3;
  [v5 enumerateLifecycleObserversUsingBlock:v4];
}

uint64_t __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didPresentLockScreenPlugin:*(void *)(a1 + 32)];
}

uint64_t __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 willPresentLockScreenPlugin:*(void *)(a1 + 32)];
}

- (NSString)coverSheetIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (NSSet)components
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(SBDashBoardPluginViewController *)self->_pluginViewController plugin];
  id v5 = [v4 coverSheetAppearance];
  v6 = [v5 componentForType:1 property:16];

  if (v6) {
    [v3 addObject:v6];
  }
  BOOL v7 = [(SBDashBoardPluginViewController *)self->_pluginViewController plugin];
  int v8 = [v7 hidesLockScreenComplications];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F5E3C0] complicationSidebar];
    id v10 = [(SBDashBoardPluginController *)self appearanceIdentifier];
    int64_t v11 = [v9 identifier:v10];
    v12 = [v11 hidden:1];

    id v13 = [MEMORY[0x1E4F5E3C0] complicationContainer];
    id v14 = [(SBDashBoardPluginController *)self appearanceIdentifier];
    v15 = [v13 identifier:v14];
    v16 = [v15 hidden:1];

    [v3 addObject:v12];
    [v3 addObject:v16];
  }
  return (NSSet *)v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return [(CSCoverSheetViewControllerBase *)self->_pluginViewController restrictedCapabilities];
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  switch([v4 type])
  {
    case 3:
    case 8:
      [(SBDashBoardPluginController *)self _activate];
      goto LABEL_5;
    case 6:
    case 9:
      [(SBDashBoardPluginController *)self _deactivate];
      goto LABEL_5;
    case 12:
      if ([(SBLockScreenPluginManager *)self->_pluginManager handleEvent:1]) {
LABEL_5:
      }
        char v5 = [v4 isConsumable];
      else {
        char v5 = 0;
      }
      break;
    default:
      break;
  }

  return v5;
}

- (void)enableLockScreenPluginWithContext:(id)a3
{
}

- (void)disableLockScreenPluginWithContext:(id)a3
{
}

- (void)pluginManager:(id)a3 displayedPluginDidUpdateAppearance:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  pluginViewController = self->_pluginViewController;
  if (!pluginViewController)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBDashBoardPluginController.m" lineNumber:301 description:@"We must have a plugin for the active one to have changed it's appearance."];

    pluginViewController = self->_pluginViewController;
  }
  id v10 = [(SBDashBoardPluginViewController *)pluginViewController plugin];

  if (v10 != v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBDashBoardPluginController.m" lineNumber:302 description:@"The active plugin that changed wasn't the one we knew about now."];
  }
  int64_t v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Active uplugin changed it's appearance style: %@", buf, 0xCu);
  }

  int64_t pluginViewControllerPresentationStyle = self->_pluginViewControllerPresentationStyle;
  if (pluginViewControllerPresentationStyle != [(SBDashBoardPluginViewController *)self->_pluginViewController presentationStyle])
  {
    id v13 = (void *)MEMORY[0x1E4F42FF0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__SBDashBoardPluginController_pluginManager_displayedPluginDidUpdateAppearance___block_invoke;
    v16[3] = &unk_1E6AF5290;
    void v16[4] = self;
    id v17 = v8;
    [v13 performWithoutAnimation:v16];
  }
}

uint64_t __80__SBDashBoardPluginController_pluginManager_displayedPluginDidUpdateAppearance___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 24);
    int v5 = [*(id *)(v3 + 16) presentationStyle];
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = 67109634;
    v8[1] = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Plugin changed presentation style from %d to %d: %@", (uint8_t *)v8, 0x18u);
  }

  [*(id *)(a1 + 32) _dismissPluginViewController:*(void *)(*(void *)(a1 + 32) + 16) withStyle:*(void *)(*(void *)(a1 + 32) + 24) animated:0 completion:0];
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) presentationStyle];
  return [*(id *)(a1 + 32) _presentPluginViewController:*(void *)(*(void *)(a1 + 32) + 16) withStyle:*(void *)(*(void *)(a1 + 32) + 24) animated:0 completion:0];
}

- (void)pluginManager:(id)a3 displayedPluginDidChangeFromPlugin:(id)a4 toPlugin:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    uint64_t v6 = [[SBDashBoardPluginViewController alloc] initWithLockScreenPlugin:v7];
    [(SBDashBoardPluginController *)self _setPluginViewController:v6];
  }
  else
  {
    [(SBDashBoardPluginController *)self _setPluginViewController:0];
  }
}

- (BOOL)pluginManager:(id)a3 plugin:(id)a4 handleAction:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  __int16 v9 = +[SBLockScreenActionContextFactory sharedInstance];
  int v10 = [v9 lockScreenActionContextForAction:v7 fromPlugin:v8];

  if (v10 && self->_pluginViewController)
  {
    coverSheetViewController = self->_coverSheetViewController;
    uint64_t v12 = [MEMORY[0x1E4F5E380] actionWithContext:v10];
    [(CSCoverSheetViewController *)coverSheetViewController handleAction:v12 fromSender:self->_pluginViewController];

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
  [v7 sendResponseWithSuccess:v13];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginManager, 0);
  objc_storeStrong((id *)&self->_pluginViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

- (void)_setPluginViewController:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 plugin];
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "Presenting plugin view controller for plugin: %@", v4, v5, v6, v7, 2u);
}

- (void)_setPluginViewController:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 plugin];
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "Dismissing plugin view controller for plugin: %@", v4, v5, v6, v7, 2u);
}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Dismissed plugin view controller: %@.", (uint8_t *)&v3, 0xCu);
}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Presented plugin view controller: %@.", (uint8_t *)&v3, 0xCu);
}

@end