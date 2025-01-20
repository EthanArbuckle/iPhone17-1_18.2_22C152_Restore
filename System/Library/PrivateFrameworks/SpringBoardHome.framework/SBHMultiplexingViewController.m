@interface SBHMultiplexingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)multiplexedViewControllerShowsContentWhileDeactivated;
- (BOOL)sbh_isMultiplexingViewController;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NSHashTable)observers;
- (NSString)identifier;
- (SBHMultiplexingManager)multiplexingManager;
- (SBHMultiplexingViewController)initWithLevel:(double)a3 identifier:(id)a4;
- (UIViewController)multiplexedViewController;
- (double)level;
- (id)sbh_underlyingAvocadoHostViewControllers;
- (void)_setUpMultiplexedViewController;
- (void)activateWithViewController:(id)a3;
- (void)addObserver:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)loadView;
- (void)removeObserver:(id)a3;
- (void)setMultiplexedViewControllerShowsContentWhileDeactivated:(BOOL)a3;
- (void)setMultiplexingManager:(id)a3;
- (void)setObservers:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBHMultiplexingViewController

- (SBHMultiplexingViewController)initWithLevel:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHMultiplexingViewController;
  v7 = [(SBHMultiplexingViewController *)&v12 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    v7->_level = a3;
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(SBHMultiplexingViewController *)self multiplexingManager];
  [v3 validateActiveMultiplexingViewControllerForIdentifier:self->_identifier];

  v4.receiver = self;
  v4.super_class = (Class)SBHMultiplexingViewController;
  [(SBHMultiplexingViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setAutoresizingMask:18];
  [(SBHMultiplexingViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHMultiplexingViewController;
  [(SBHMultiplexingViewController *)&v4 viewWillAppear:a3];
  [(SBHMultiplexingViewController *)self _setUpMultiplexedViewController];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)activateWithViewController:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (UIViewController *)a3;
  v5 = SBLogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v11 = 138544386;
    objc_super v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2080;
    v16 = "-[SBHMultiplexingViewController activateWithViewController:]";
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2048;
    v20 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s <%{public}@:%p>", (uint8_t *)&v11, 0x34u);
  }
  multiplexedViewController = self->_multiplexedViewController;
  self->_multiplexedViewController = v4;

  if ([(SBHMultiplexingViewController *)self isViewLoaded]) {
    [(SBHMultiplexingViewController *)self _setUpMultiplexedViewController];
  }
}

- (void)deactivate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_multiplexedViewController)
  {
    id v3 = SBLogWidgets();
    if (os_signpost_enabled(v3))
    {
      objc_super v4 = NSString;
      v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      v7 = [v4 stringWithFormat:@"<%@: %p>", v6, self];
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_DEACTIVATE", "%{public}@", buf, 0xCu);
    }
    v8 = SBLogWidgets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2080;
      v29 = "-[SBHMultiplexingViewController deactivate]";
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 multiplexingViewControllerWillDeactivate:self];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    multiplexedViewController = self->_multiplexedViewController;
    self->_multiplexedViewController = 0;

    v18 = SBLogWidgets();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_DEACTIVATE", " isAnimation=YES ", buf, 2u);
    }
  }
}

- (void)addObserver:(id)a3
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

- (void)removeObserver:(id)a3
{
}

- (void)_setUpMultiplexedViewController
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = self->_multiplexedViewController;
  id v4 = v3;
  if (v3)
  {
    v5 = [(UIViewController *)v3 parentViewController];

    if (v5 != self)
    {
      id v6 = SBLogWidgets();
      if (os_signpost_enabled(v6))
      {
        v7 = NSString;
        id v8 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v8);
        v10 = [v7 stringWithFormat:@"<%@: %p>", v9, self];
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_ACTIVATE", "%{public}@", buf, 0xCu);
      }
      int v11 = [(UIViewController *)v4 view];
      uint64_t v12 = [(SBHMultiplexingViewController *)self view];
      [v12 bounds];
      objc_msgSend(v11, "setFrame:");

      [v11 setAutoresizingMask:18];
      [(UIViewController *)v4 bs_endAppearanceTransition:1];
      [(SBHMultiplexingViewController *)self bs_addChildViewController:v4];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v13 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v19 + 1) + 8 * v17++) multiplexingViewControllerDidActivate:self];
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v15);
      }

      v18 = SBLogWidgets();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_ACTIVATE", " isAnimation=YES ", buf, 2u);
      }
    }
  }
}

- (double)level
{
  return self->_level;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)multiplexedViewController
{
  return self->_multiplexedViewController;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (SBHMultiplexingManager)multiplexingManager
{
  return self->_multiplexingManager;
}

- (void)setMultiplexingManager:(id)a3
{
}

- (BOOL)multiplexedViewControllerShowsContentWhileDeactivated
{
  return self->_multiplexedViewControllerShowsContentWhileDeactivated;
}

- (void)setMultiplexedViewControllerShowsContentWhileDeactivated:(BOOL)a3
{
  self->_multiplexedViewControllerShowsContentWhileDeactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiplexingManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_multiplexedViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)sbh_isMultiplexingViewController
{
  return 1;
}

- (id)sbh_underlyingAvocadoHostViewControllers
{
  id v3 = [(SBHMultiplexingViewController *)self multiplexedViewController];
  char v4 = objc_msgSend(v3, "sbh_isWidgetHostViewController");
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  if (v4)
  {
    id v6 = [(SBHMultiplexingViewController *)self multiplexedViewController];
    v7 = [v5 setWithObject:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

@end