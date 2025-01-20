@interface SBLockScreenPluginManager
- (BOOL)_handlePluginDisabled:(id)a3 withContext:(id)a4;
- (BOOL)_loadLockScreenPluginWithContext:(id)a3;
- (BOOL)_sendEventToPlugin:(id)a3;
- (BOOL)disableLockScreenPluginWithContext:(id)a3;
- (BOOL)enableLockScreenPluginWithContext:(id)a3;
- (BOOL)handleEvent:(int64_t)a3;
- (BOOL)isEnabled;
- (BOOL)pluginController:(id)a3 sendAction:(id)a4;
- (NSString)description;
- (SBLockScreenPlugin)activePlugin;
- (SBLockScreenPlugin)displayedPlugin;
- (SBLockScreenPluginManager)init;
- (SBLockScreenPluginManagerDelegate)delegate;
- (id)_highestPriorityPluginIgnoringViewDisplay:(BOOL)a3;
- (id)_pluginForPluginController:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)lockScreenActionContext;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handleUIRelock;
- (void)_refreshLockScreenPlugin;
- (void)_setActivePlugin:(id)a3 displayedPlugin:(id)a4;
- (void)activatePluginController:(id)a3;
- (void)deactivatePluginController:(id)a3;
- (void)dealloc;
- (void)pluginController:(id)a3 updateAppearance:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBLockScreenPluginManager

- (SBLockScreenPluginManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBLockScreenPluginManager;
  v2 = [(SBLockScreenPluginManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    plugins = v2->_plugins;
    v2->_plugins = v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleUIRelock name:@"SBLockScreenUIRelockedNotification" object:0];
    v6 = [MEMORY[0x1E4F5E408] rootSettings];
    uint64_t v7 = [v6 testPluginSettings];
    testSettings = v2->_testSettings;
    v2->_testSettings = (CSLockScreenTestPluginSettings *)v7;

    [(CSLockScreenTestPluginSettings *)v2->_testSettings addKeyObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_plugins enumerateKeysAndObjectsUsingBlock:&__block_literal_global_262];
  [(CSLockScreenTestPluginSettings *)self->_testSettings removeKeyObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenPluginManager;
  [(SBLockScreenPluginManager *)&v4 dealloc];
}

void __36__SBLockScreenPluginManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 viewController];
  v3 = [v4 viewIfLoaded];
  [v3 removeFromSuperview];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(SBLockScreenPluginManager *)self _refreshLockScreenPlugin];
  }
}

- (BOOL)enableLockScreenPluginWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBLockScreenPluginManager *)self _loadLockScreenPluginWithContext:v4];
  if (v5)
  {
    plugins = self->_plugins;
    uint64_t v7 = [v4 name];
    v8 = [(NSMutableDictionary *)plugins objectForKey:v7];

    v9 = [v4 auxiliaryAnimation];
    [v8 setAuxiliaryActivationAnimationBlock:v9];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pluginManager:self didLoadPlugin:v8];

    [(SBLockScreenPluginManager *)self _refreshLockScreenPlugin];
  }

  return v5;
}

- (BOOL)disableLockScreenPluginWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_plugins objectForKey:v5];
    BOOL v7 = [(SBLockScreenPluginManager *)self _handlePluginDisabled:v6 withContext:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)handleEvent:(int64_t)a3
{
  if ([(SBLockScreenPluginManager *)self isEnabled])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__SBLockScreenPluginManager_handleEvent___block_invoke;
    v7[3] = &__block_descriptor_40_e28_B16__0__SBLockScreenPlugin_8l;
    v7[4] = a3;
    return [(SBLockScreenPluginManager *)self _sendEventToPlugin:v7];
  }
  else
  {
    v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenPluginManager handleEvent:](a3, v6);
    }

    return 0;
  }
}

uint64_t __41__SBLockScreenPluginManager_handleEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pluginHandleEvent:*(void *)(a1 + 32)];
}

- (BOOL)_sendEventToPlugin:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  if (((uint64_t (*)(uint64_t (**)(void), SBLockScreenPlugin *))v4[2])(v4, self->_activePlugin))
  {
    char v5 = 1;
  }
  else if (self->_activePlugin == self->_displayedPlugin)
  {
    char v5 = 0;
  }
  else
  {
    char v5 = v4[2](v4);
  }

  return v5;
}

- (void)_handleUIRelock
{
  if ([(SBLockScreenPluginManager *)self isEnabled])
  {
    [(SBLockScreenPluginManager *)self handleEvent:2];
  }
}

- (id)_highestPriorityPluginIgnoringViewDisplay:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(SBLockScreenPluginManager *)self isEnabled])
  {
    v8 = 0;
    goto LABEL_19;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v5 = [(NSMutableDictionary *)self->_plugins allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {
    v8 = 0;
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v19;
  uint64_t v10 = 0x8000000000000000;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      uint64_t v13 = [v12 pluginPriority];
      if (v13 < v10 || a3)
      {
        if (v13 < v10) {
          continue;
        }
LABEL_12:
        id v16 = v12;

        uint64_t v10 = [v16 pluginPriority];
        v8 = v16;
        continue;
      }
      v14 = [v12 appearance];
      char v15 = [v14 isHidden];

      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);
LABEL_18:

LABEL_19:
  return v8;
}

- (void)_refreshLockScreenPlugin
{
  id v4 = [(SBLockScreenPluginManager *)self _highestPriorityPluginIgnoringViewDisplay:1];
  v3 = [(SBLockScreenPluginManager *)self _highestPriorityPluginIgnoringViewDisplay:0];
  [(SBLockScreenPluginManager *)self _setActivePlugin:v4 displayedPlugin:v3];
}

- (void)_setActivePlugin:(id)a3 displayedPlugin:(id)a4
{
  v14 = (SBLockScreenPlugin *)a3;
  uint64_t v7 = (SBLockScreenPlugin *)a4;
  activePlugin = self->_activePlugin;
  if (activePlugin != v14) {
    objc_storeStrong((id *)&self->_activePlugin, a3);
  }
  displayedPlugin = self->_displayedPlugin;
  if (displayedPlugin == v7)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = displayedPlugin;
    objc_storeStrong((id *)&self->_displayedPlugin, a4);
    v11 = [(SBLockScreenPlugin *)v10 viewController];
    v12 = [v11 viewIfLoaded];

    if (v12) {
      [v12 removeFromSuperview];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (activePlugin != v14) {
    [WeakRetained pluginManager:self activePluginDidChange:self->_activePlugin];
  }
  if (displayedPlugin != v7) {
    [WeakRetained pluginManager:self displayedPluginDidChangeFromPlugin:v10 toPlugin:self->_displayedPlugin];
  }
}

- (BOOL)_loadLockScreenPluginWithContext:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Sblockscreenpl_3.isa);
  if (!v4)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenPluginManager _loadLockScreenPluginWithContext:]();
    }
LABEL_15:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C079D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBLockScreenPluginContextClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenPluginManager _loadLockScreenPluginWithContext:]();
    }
    goto LABEL_15;
  }

  char v5 = [v4 name];
  uint64_t v6 = [(NSMutableDictionary *)self->_plugins objectForKey:v5];

  if (v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v8 = +[SBLockScreenPlugin pluginWithName:v5 activationContext:v4];
    BOOL v7 = v8 != 0;
    if (v8)
    {
      [(NSMutableDictionary *)self->_plugins setObject:v8 forKey:v5];
      [v8 pluginWillActivateWithContext:v4];
      [v8 setPluginAgent:self];
      uint64_t v9 = [v4 observer];

      if (v9)
      {
        uint64_t v10 = [v4 observer];
        [v8 addLifecycleObserver:v10];
      }
    }
  }
  return v7;
}

- (BOOL)_handlePluginDisabled:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSClassFromString(&cfstr_Sblockscreenpl_3.isa);
  if (!v7)
  {
    long long v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenPluginManager _handlePluginDisabled:withContext:]();
    }
LABEL_13:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C07C10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBLockScreenPluginContextClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenPluginManager _handlePluginDisabled:withContext:]();
    }
    goto LABEL_13;
  }

  if (v6
    && (v8 = self->_plugins,
        [v6 name],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)v8 objectForKey:v9],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10 == v6))
  {
    plugins = self->_plugins;
    uint64_t v13 = [v6 name];
    [(NSMutableDictionary *)plugins removeObjectForKey:v13];

    v14 = [v7 auxiliaryAnimation];
    [v6 setAuxiliaryDeactivationAnimationBlock:v14];

    [(SBLockScreenPluginManager *)self _refreshLockScreenPlugin];
    char v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"SBLockScreenPluginWasDisabledNotification" object:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pluginManager:self willUnloadPlugin:v6];

    [v6 setPluginAgent:0];
    [v6 pluginDidDeactivateWithContext:v7];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  int v5 = [(CSLockScreenTestPluginSettings *)self->_testSettings enablePlugin];
  id v6 = [MEMORY[0x1E4FA7958] contextWithName:@"LockScreenTestPlugin"];
  if (v5) {
    [(SBLockScreenPluginManager *)self enableLockScreenPluginWithContext:v6];
  }
  else {
    [(SBLockScreenPluginManager *)self disableLockScreenPluginWithContext:v6];
  }

  int v7 = [(CSLockScreenTestPluginSettings *)self->_testSettings enableLostModePlugin];
  id v8 = [MEMORY[0x1E4FA7958] contextWithName:@"FindMyiPhoneLockScreen"];
  if (v7) {
    [(SBLockScreenPluginManager *)self enableLockScreenPluginWithContext:v8];
  }
  else {
    [(SBLockScreenPluginManager *)self disableLockScreenPluginWithContext:v8];
  }
}

- (id)_pluginForPluginController:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__85;
  id v16 = __Block_byref_object_dispose__85;
  id v17 = 0;
  plugins = self->_plugins;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SBLockScreenPluginManager__pluginForPluginController___block_invoke;
  v9[3] = &unk_1E6B07CB0;
  id v6 = v4;
  id v10 = v6;
  BOOL v11 = &v12;
  [(NSMutableDictionary *)plugins enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__SBLockScreenPluginManager__pluginForPluginController___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = v7;
  if (*(id *)(a1 + 32) == v7
    || ([v7 controller],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = *(void **)(a1 + 32),
        v9,
        v9 == v10))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)activatePluginController:(id)a3
{
  id v4 = [(SBLockScreenPluginManager *)self _pluginForPluginController:a3];
  if (v4)
  {
    id v5 = v4;
    [(SBLockScreenPluginManager *)self _refreshLockScreenPlugin];
    id v4 = v5;
  }
}

- (void)deactivatePluginController:(id)a3
{
  id v4 = [(SBLockScreenPluginManager *)self _pluginForPluginController:a3];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4FA7958];
    id v8 = v4;
    id v6 = [v4 name];
    id v7 = [v5 contextWithName:v6];

    [(SBLockScreenPluginManager *)self _handlePluginDisabled:v8 withContext:v7];
    id v4 = v8;
  }
}

- (void)pluginController:(id)a3 updateAppearance:(id)a4
{
  id v5 = (SBLockScreenPlugin *)a3;
  [(SBLockScreenPluginManager *)self _refreshLockScreenPlugin];
  displayedPlugin = self->_displayedPlugin;

  if (displayedPlugin == v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pluginManager:self displayedPluginDidUpdateAppearance:self->_displayedPlugin];
  }
}

- (BOOL)pluginController:(id)a3 sendAction:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBLockScreenPluginManager *)self _pluginForPluginController:a3];
  id v8 = (void *)v7;
  char v9 = 0;
  if (v6 && v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [WeakRetained pluginManager:self plugin:v8 handleAction:v6];
  }
  return v9;
}

- (id)lockScreenActionContext
{
  v3 = +[SBLockScreenActionContextFactory sharedInstance];
  id v4 = [(SBLockScreenPluginManager *)self activePlugin];
  id v5 = [v3 lockScreenActionContextForPlugin:v4];

  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBLockScreenPluginManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenPluginManager *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (id)[v3 appendClass:objc_opt_class() withName:@"delegateClass"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenPluginManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLockScreenPluginManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBLockScreenPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

uint64_t __67__SBLockScreenPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F4F718];
  v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v5 = [v2 succinctDescriptionForObject:WeakRetained];
  id v6 = (id)[v3 appendObject:v5 withName:@"delegate" skipIfNil:1];

  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"activePlugin" skipIfNil:1];
  id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayedPlugin" skipIfNil:1];
  char v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  return [v9 appendDictionarySection:v10 withName:@"plugins" skipIfEmpty:1];
}

- (SBLockScreenPlugin)activePlugin
{
  return self->_activePlugin;
}

- (SBLockScreenPlugin)displayedPlugin
{
  return self->_displayedPlugin;
}

- (SBLockScreenPluginManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenPluginManagerDelegate *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedPlugin, 0);
  objc_storeStrong((id *)&self->_activePlugin, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
}

- (void)handleEvent:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[SBLockScreenPluginManager] Ignoring event %d because plugins are disabled.", (uint8_t *)v2, 8u);
}

- (void)_loadLockScreenPluginWithContext:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handlePluginDisabled:withContext:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_24();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end