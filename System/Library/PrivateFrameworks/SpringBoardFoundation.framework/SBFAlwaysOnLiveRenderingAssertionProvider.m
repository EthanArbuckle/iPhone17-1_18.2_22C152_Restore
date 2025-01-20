@interface SBFAlwaysOnLiveRenderingAssertionProvider
+ (id)sharedInstance;
- (BLSBacklightStateObservable)backlight;
- (SBFAlwaysOnLiveRenderingAssertionProvider)init;
- (SBFAlwaysOnLiveRenderingBLSAssertionProvider)assertionProvider;
- (id)_acquireLiveRenderingAssertionForScene:(id)a3 identifier:(id)a4 reason:(id)a5 attributes:(id)a6;
- (id)_assertionManagerForScene:(id)a3;
- (id)acquireLiveRenderingAssertionForFBSScene:(id)a3 reason:(id)a4;
- (id)acquireLiveRenderingAssertionForUIScene:(id)a3 reason:(id)a4;
- (id)description;
- (void)_setAssertionManager:(id)a3 forScene:(id)a4;
- (void)invalidateAllAssertions;
- (void)setAssertionProvider:(id)a3;
- (void)setBacklight:(id)a3;
@end

@implementation SBFAlwaysOnLiveRenderingAssertionProvider

- (SBFAlwaysOnLiveRenderingAssertionProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionProvider;
  v2 = [(SBFAlwaysOnLiveRenderingAssertionProvider *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBFAlwaysOnLiveRenderingBLSAssertionProvider);
    assertionProvider = v2->_assertionProvider;
    v2->_assertionProvider = v3;

    v5 = objc_alloc_init(SBFAlwaysOnLiveRenderingAssertionWeakCollection);
    assertions = v2->_assertions;
    v2->_assertions = v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __59__SBFAlwaysOnLiveRenderingAssertionProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SBFAlwaysOnLiveRenderingAssertionProvider);
  return MEMORY[0x1F41817F8]();
}

- (BLSBacklightStateObservable)backlight
{
  backlight = self->_backlight;
  if (backlight)
  {
    v3 = backlight;
  }
  else
  {
    v3 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
  }
  return v3;
}

- (id)acquireLiveRenderingAssertionForUIScene:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 _sceneIdentifier];
  v9 = [[SBFAlwaysOnLiveRenderingBLSAttributesProvider alloc] initWithUIScene:v7];
  v10 = [(SBFAlwaysOnLiveRenderingAssertionProvider *)self _acquireLiveRenderingAssertionForScene:v7 identifier:v8 reason:v6 attributes:v9];

  return v10;
}

- (id)acquireLiveRenderingAssertionForFBSScene:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 identifier];
  v9 = [[SBFAlwaysOnLiveRenderingBLSAttributesProvider alloc] initWithFBSScene:v7];
  v10 = [(SBFAlwaysOnLiveRenderingAssertionProvider *)self _acquireLiveRenderingAssertionForScene:v7 identifier:v8 reason:v6 attributes:v9];

  return v10;
}

- (id)_acquireLiveRenderingAssertionForScene:(id)a3 identifier:(id)a4 reason:(id)a5 attributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = [(SBFAlwaysOnLiveRenderingAssertionProvider *)self _assertionManagerForScene:v10];
  if (v14)
  {
    v15 = (SBFAlwaysOnLiveRenderingAssertionManager *)v14;
    v16 = SBLogLiveRendering();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SBFAlwaysOnLiveRenderingAssertionProvider _acquireLiveRenderingAssertionForScene:identifier:reason:attributes:]();
    }
  }
  else
  {
    v17 = [SBFAlwaysOnLiveRenderingAssertionManager alloc];
    v18 = [(SBFAlwaysOnLiveRenderingAssertionProvider *)self backlight];
    v19 = [(SBFAlwaysOnLiveRenderingAssertionProvider *)self assertionProvider];
    v15 = [(SBFAlwaysOnLiveRenderingAssertionManager *)v17 initWithBacklight:v18 assertionProvider:v19 attributesProvider:v12];

    v20 = SBLogLiveRendering();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[SBFAlwaysOnLiveRenderingAssertionProvider _acquireLiveRenderingAssertionForScene:identifier:reason:attributes:]();
    }

    [(SBFAlwaysOnLiveRenderingAssertionProvider *)self _setAssertionManager:v15 forScene:v10];
  }
  v21 = [(SBFAlwaysOnLiveRenderingAssertionManager *)v15 acquireLiveRenderingAssertionWithReason:v13];

  [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_assertions addAssertion:v21];
  return v21;
}

- (void)invalidateAllAssertions
{
  [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_assertions invalidateAll];
  assertions = self->_assertions;
  [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)assertions removeAll];
}

- (void)_setAssertionManager:(id)a3 forScene:(id)a4
{
}

- (id)_assertionManagerForScene:(id)a3
{
  return objc_getAssociatedObject(a3, (const void *)SBFAlwaysOnLiveRenderingSceneAssertionManagerKey);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; activeCount:%d",
    v5,
    self,
  id v6 = [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_assertions count]);

  return v6;
}

- (void)setBacklight:(id)a3
{
}

- (SBFAlwaysOnLiveRenderingBLSAssertionProvider)assertionProvider
{
  return self->_assertionProvider;
}

- (void)setAssertionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (void)_acquireLiveRenderingAssertionForScene:identifier:reason:attributes:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_18B52E000, v2, v3, "Created <%@; %p> for scene: %@", v4, v5, v6, v7, v8);
}

- (void)_acquireLiveRenderingAssertionForScene:identifier:reason:attributes:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_18B52E000, v2, v3, "Reusing <%@; %p> for scene: %@", v4, v5, v6, v7, v8);
}

@end