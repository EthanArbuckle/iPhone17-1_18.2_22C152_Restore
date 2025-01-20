@interface SBHWidgetViewController
+ (id)sbh_sharedWidgetExtensionProvider;
- (CHSWidgetExtensionProvider)sbh_widgetExtensionProvider;
- (SBHWidgetDisplayConfiguration)sbh_customDisplayConfiguration;
- (id)acquirePreventSceneBackgroundingAssertionForReason:(id)a3;
- (id)sbh_effectiveWidgetExtensionProvider;
- (id)sbh_widgetDescriptor;
- (id)sbh_widgetExtension;
- (void)_invalidateBackgroundingAssertion:(id)a3;
- (void)invalidate;
- (void)sbh_addObserver:(id)a3;
- (void)sbh_removeObserver:(id)a3;
- (void)sbh_setCustomDisplayConfiguration:(id)a3;
- (void)sbh_setWidgetExtensionProvider:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)waitForContentReadyWithTimeout:(double)a3 completion:(id)a4;
@end

@implementation SBHWidgetViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetViewController;
  [(SBHWidgetViewController *)&v4 viewWillAppear:a3];
  [(SBHWidgetViewController *)self setPresentationMode:2];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetViewController;
  [(SBHWidgetViewController *)&v4 viewDidDisappear:a3];
  [(SBHWidgetViewController *)self setPresentationMode:1];
}

- (id)acquirePreventSceneBackgroundingAssertionForReason:(id)a3
{
  id v5 = a3;
  if (!self->_preventBackgroundingAssertions)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    preventBackgroundingAssertions = self->_preventBackgroundingAssertions;
    self->_preventBackgroundingAssertions = v6;
  }
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
  v9 = NSStringFromSelector(a2);
  uint64_t v10 = MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__SBHWidgetViewController_acquirePreventSceneBackgroundingAssertionForReason___block_invoke;
  v14[3] = &unk_1E6AAD538;
  objc_copyWeak(&v15, &location);
  v12 = (void *)[v8 initWithIdentifier:v9 forReason:v5 queue:v10 invalidationBlock:v14];

  [(NSMutableArray *)self->_preventBackgroundingAssertions addObject:v12];
  [(SBHWidgetViewController *)self log:@"New preventSceneBackgroundingAssertion acquired: %@", v12];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

void __78__SBHWidgetViewController_acquirePreventSceneBackgroundingAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _invalidateBackgroundingAssertion:v3];
}

- (void)waitForContentReadyWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (self->_isInvalidated)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke;
    v8[3] = &unk_1E6AAD560;
    id v9 = v6;
    [(SBHWidgetViewController *)self ensureContentWithTimeout:v8 completion:a3];
  }
}

void __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = SBLogWidgets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke_cold_1(v3, v4);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (void)sbh_addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)sbh_removeObserver:(id)a3
{
}

- (void)sbh_setCustomDisplayConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_customDisplayConfiguration != a3)
  {
    id v4 = (SBHWidgetDisplayConfiguration *)[a3 copy];
    customDisplayConfiguration = self->_customDisplayConfiguration;
    self->_customDisplayConfiguration = v4;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 widgetViewControllerDidChangeCustomDisplayConfiguration:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (!self->_isInvalidated)
  {
    if ([(SBHWidgetViewController *)self presentationMode] == a3)
    {
      if (a3 != 1 && self->_pendingStaticMode) {
        self->_pendingStaticMode = 0;
      }
    }
    else if (a3 == 1)
    {
      if ([(NSMutableArray *)self->_preventBackgroundingAssertions count])
      {
        [(SBHWidgetViewController *)self log:@"Denied transition to Static due to assertions."];
        self->_pendingStaticMode = 1;
      }
      else
      {
        id v5 = [(SBHWidgetViewController *)self delegate];
        if (self->_isInvalidatingBackgroundAssertion
          || (objc_opt_respondsToSelector() & 1) == 0
          || ([v5 widgetViewControllerShouldTransitionSceneToBackground:self] & 1) != 0)
        {
          self->_pendingStaticMode = 0;
          v7.receiver = self;
          v7.super_class = (Class)SBHWidgetViewController;
          [(SBHWidgetViewController *)&v7 setPresentationMode:1];
        }
        else
        {
          -[SBHWidgetViewController log:](self, "log:", @"Preventing transition to background; adding new preventBackgroundingAssertion; now %lu",
            [(NSMutableArray *)self->_preventBackgroundingAssertions count]);
          self->_pendingStaticMode = 1;
        }
      }
    }
    else
    {
      self->_pendingStaticMode = 0;
      v6.receiver = self;
      v6.super_class = (Class)SBHWidgetViewController;
      [(SBHWidgetViewController *)&v6 setPresentationMode:a3];
    }
  }
}

+ (id)sbh_sharedWidgetExtensionProvider
{
  if (sbh_sharedWidgetExtensionProvider_onceToken != -1) {
    dispatch_once(&sbh_sharedWidgetExtensionProvider_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sbh_sharedWidgetExtensionProvider_sharedWidgetExtensionProvider;
  return v2;
}

void __60__SBHWidgetViewController_sbh_sharedWidgetExtensionProvider__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F58E40]);
  v1 = (void *)sbh_sharedWidgetExtensionProvider_sharedWidgetExtensionProvider;
  sbh_sharedWidgetExtensionProvider_sharedWidgetExtensionProvider = (uint64_t)v0;
}

- (id)sbh_effectiveWidgetExtensionProvider
{
  v2 = [(SBHWidgetViewController *)self sbh_widgetExtensionProvider];
  if (!v2)
  {
    v2 = objc_msgSend((id)objc_opt_class(), "sbh_sharedWidgetExtensionProvider");
  }
  return v2;
}

- (id)sbh_widgetDescriptor
{
  id v3 = [(SBHWidgetViewController *)self sbh_effectiveWidgetExtensionProvider];
  id v4 = [(SBHWidgetViewController *)self widget];
  id v5 = [v3 widgetDescriptorForWidget:v4];

  return v5;
}

- (id)sbh_widgetExtension
{
  id v3 = [(SBHWidgetViewController *)self sbh_effectiveWidgetExtensionProvider];
  id v4 = [(SBHWidgetViewController *)self widget];
  id v5 = [v4 extensionIdentity];
  objc_super v6 = [v5 extensionBundleIdentifier];
  objc_super v7 = [v3 widgetExtensionContainerForExtensionBundleIdentifier:v6];

  uint64_t v8 = [v7 extensionForExtensionIdentity:v5];

  return v8;
}

- (void)_invalidateBackgroundingAssertion:(id)a3
{
  id v4 = a3;
  [(SBHWidgetViewController *)self log:@"Invalidating preventSceneBackgroundingAssertion '%@'", v4];
  self->_isInvalidatingBackgroundAssertion = 1;
  if ([(NSMutableArray *)self->_preventBackgroundingAssertions containsObject:v4])
  {
    [(NSMutableArray *)self->_preventBackgroundingAssertions removeObject:v4];
    if (self->_pendingStaticMode && ![(NSMutableArray *)self->_preventBackgroundingAssertions count])
    {
      [(SBHWidgetViewController *)self log:@"Last prevent scene background assertion invalidated.  Adjusting now to static mode."];
      self->_pendingStaticMode = 0;
      [(SBHWidgetViewController *)self setPresentationMode:1];
    }
  }
  self->_isInvalidatingBackgroundAssertion = 0;
}

- (void)invalidate
{
  if (!self->_isInvalidated)
  {
    [(SBHWidgetViewController *)self setPresentationMode:1];
    self->_isInvalidated = 1;
    v3.receiver = self;
    v3.super_class = (Class)SBHWidgetViewController;
    [(SBHWidgetViewController *)&v3 invalidate];
  }
}

- (CHSWidgetExtensionProvider)sbh_widgetExtensionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetExtensionProvider);
  return (CHSWidgetExtensionProvider *)WeakRetained;
}

- (void)sbh_setWidgetExtensionProvider:(id)a3
{
}

- (SBHWidgetDisplayConfiguration)sbh_customDisplayConfiguration
{
  return self->_customDisplayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDisplayConfiguration, 0);
  objc_destroyWeak((id *)&self->_widgetExtensionProvider);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_preventBackgroundingAssertions, 0);
}

void __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a1 localizedDescription];
  int v4 = 136446466;
  id v5 = "-[SBHWidgetViewController waitForContentReadyWithTimeout:completion:]_block_invoke";
  __int16 v6 = 2114;
  objc_super v7 = v3;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "%{public}s Error waiting for non-placeholder content to appear: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end