@interface SearchUISwitchAccessoryViewController
+ (BOOL)supportsRowModel:(id)a3;
- (BOOL)expectedUpdateState;
- (BOOL)isAwaitingUpdate;
- (BOOL)isHiddenByEvent;
- (SearchUIBiomeStreamSubscriber)subscriber;
- (WFContextualAction)action;
- (id)debounceBlock;
- (id)setupView;
- (void)buttonPressed;
- (void)dealloc;
- (void)debounceSetOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setAction:(id)a3;
- (void)setDebounceBlock:(id)a3;
- (void)setExpectedUpdateState:(BOOL)a3;
- (void)setIsAwaitingUpdate:(BOOL)a3;
- (void)setIsHiddenByEvent:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setSubscriber:(id)a3;
- (void)updateForEvent:(id)a3 animated:(BOOL)a4;
- (void)updateWithNotification:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUISwitchAccessoryViewController

+ (BOOL)supportsRowModel:(id)a3
{
  v3 = +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:a3];
  v4 = [v3 biomeStreamIdentifier];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (id)setupView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)dealloc
{
  v3 = [(SearchUISwitchAccessoryViewController *)self subscriber];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SearchUISwitchAccessoryViewController;
  [(SearchUISwitchAccessoryViewController *)&v4 dealloc];
}

- (void)updateWithRowModel:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SearchUISwitchAccessoryViewController;
  id v4 = a3;
  [(SearchUIAccessoryViewController *)&v15 updateWithRowModel:v4];
  BOOL v5 = [(SearchUISwitchAccessoryViewController *)self subscriber];

  if (v5)
  {
    v6 = [(SearchUISwitchAccessoryViewController *)self subscriber];
    [v6 removeObserver:self];

    [(SearchUISwitchAccessoryViewController *)self setSubscriber:0];
  }
  v7 = [v4 contextualAction];
  v8 = +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:v4];

  v9 = [v8 biomeStreamIdentifier];
  [(SearchUISwitchAccessoryViewController *)self setAction:v7];
  v10 = +[SearchUIBiomeSubscriberRegistry sharedManager];
  v11 = [v10 requestSubscriberForIdentifier:v9];
  [(SearchUISwitchAccessoryViewController *)self setSubscriber:v11];

  v12 = [(SearchUISwitchAccessoryViewController *)self subscriber];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SearchUISwitchAccessoryViewController_updateWithRowModel___block_invoke;
  v14[3] = &unk_1E6E74730;
  v14[4] = self;
  [v12 getLatestEventWithCompletion:v14];

  v13 = [(SearchUISwitchAccessoryViewController *)self subscriber];
  [v13 addObserver:self selector:sel_updateWithNotification_];
}

uint64_t __60__SearchUISwitchAccessoryViewController_updateWithRowModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateForEvent:a2 animated:0];
}

- (void)updateWithNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:@"event"];

  BOOL v5 = v6;
  if (v6)
  {
    [(SearchUISwitchAccessoryViewController *)self updateForEvent:v6 animated:1];
    BOOL v5 = v6;
  }
}

- (void)updateForEvent:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = [(SearchUISwitchAccessoryViewController *)self action];

  if (v7)
  {
    v8 = [(SearchUISwitchAccessoryViewController *)self action];
    uint64_t v9 = +[SearchUIBiomeEvent eventForEvent:v6 contextualAction:v8];

    id v6 = (id)v9;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = v6;
    objc_initWeak(&location, self);
    v11 = [(SearchUISwitchAccessoryViewController *)self subscriber];
    v12 = [v11 streamIdentifier];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke;
    v15[3] = &unk_1E6E74758;
    objc_copyWeak(&v17, &location);
    id v13 = v12;
    id v16 = v13;
    BOOL v18 = a4;
    [v10 getEnabledStatusWithCompletion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_71;
    v14[3] = &unk_1E6E72730;
    v14[4] = self;
    +[SearchUIUtilities dispatchMainIfNecessary:v14];
  }
}

void __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_2;
  v4[3] = &unk_1E6E72538;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  char v8 = *(unsigned char *)(a1 + 48);
  +[SearchUIUtilities dispatchMainIfNecessary:v4];

  objc_destroyWeak(&v6);
}

void __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = SearchUIBiomeLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v12 = 138412546;
    uint64_t v13 = v4;
    __int16 v14 = 1024;
    int v15 = v5;
    _os_log_impl(&dword_1E45B5000, v3, OS_LOG_TYPE_DEFAULT, "Evaluated event from BiomeStream (%@) to %d", (uint8_t *)&v12, 0x12u);
  }

  id v6 = [WeakRetained subscriber];
  char v7 = [v6 streamIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = SearchUIBiomeLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = *(unsigned __int8 *)(a1 + 48);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 1024;
      int v15 = v11;
      _os_log_impl(&dword_1E45B5000, v9, OS_LOG_TYPE_DEFAULT, "Updated switch for BiomeStream (%@) to state: %d", (uint8_t *)&v12, 0x12u);
    }

    [WeakRetained debounceSetOn:*(unsigned __int8 *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 49)];
    [WeakRetained setIsHiddenByEvent:0];
  }
}

uint64_t __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_71(uint64_t a1)
{
  v2 = SearchUIBiomeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_71_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 32) setIsHiddenByEvent:1];
}

- (void)setIsHiddenByEvent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isHiddenByEvent = a3;
  BOOL v5 = !a3;
  id v6 = [(SearchUIAccessoryViewController *)self view];
  [v6 setEnabled:v5];

  if (v3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  id v8 = [(SearchUIAccessoryViewController *)self view];
  [v8 setAlpha:v7];
}

- (void)debounceSetOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SearchUISwitchAccessoryViewController *)self isAwaitingUpdate])
  {
    double v7 = [(SearchUISwitchAccessoryViewController *)self debounceBlock];

    if (v7)
    {
      id v8 = [(SearchUISwitchAccessoryViewController *)self debounceBlock];
      dispatch_block_cancel(v8);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__SearchUISwitchAccessoryViewController_debounceSetOn_animated___block_invoke;
    v12[3] = &unk_1E6E74780;
    v12[4] = self;
    BOOL v13 = v5;
    BOOL v14 = v4;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v12);
    [(SearchUISwitchAccessoryViewController *)self setDebounceBlock:v9];

    dispatch_time_t v10 = dispatch_time(0, 50000000);
    int v11 = [(SearchUISwitchAccessoryViewController *)self debounceBlock];
    dispatch_after(v10, MEMORY[0x1E4F14428], v11);
  }
  else
  {
    [(SearchUISwitchAccessoryViewController *)self setOn:v5 animated:v4];
  }
}

uint64_t __64__SearchUISwitchAccessoryViewController_debounceSetOn_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOn:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
  v2 = *(void **)(a1 + 32);
  return [v2 setIsAwaitingUpdate:0];
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(SearchUIAccessoryViewController *)self view];
  int v8 = [v7 isOn];

  if (v8 != v5)
  {
    id v9 = [(SearchUIAccessoryViewController *)self view];
    [v9 setOn:v5 animated:v4];
  }
}

- (void)buttonPressed
{
  [(SearchUISwitchAccessoryViewController *)self setIsAwaitingUpdate:1];
  BOOL v3 = [(SearchUIAccessoryViewController *)self view];
  -[SearchUISwitchAccessoryViewController setExpectedUpdateState:](self, "setExpectedUpdateState:", [v3 isOn]);

  BOOL v4 = [(SearchUIAccessoryViewController *)self delegate];
  BOOL v5 = [v4 feedbackDelegate];
  id v10 = +[SearchUIUtilities environmentForDelegate:v5];

  id v6 = [(SearchUIAccessoryViewController *)self rowModel];
  double v7 = +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:v6];

  int v8 = [(SearchUIAccessoryViewController *)self rowModel];
  id v9 = +[SearchUICommandHandler handlerForCommand:v7 rowModel:v8 button:0 sectionModel:0 environment:v10];

  [v9 executeWithTriggerEvent:3];
}

- (BOOL)isAwaitingUpdate
{
  return self->_isAwaitingUpdate;
}

- (void)setIsAwaitingUpdate:(BOOL)a3
{
  self->_isAwaitingUpdate = a3;
}

- (BOOL)expectedUpdateState
{
  return self->_expectedUpdateState;
}

- (void)setExpectedUpdateState:(BOOL)a3
{
  self->_expectedUpdateState = a3;
}

- (SearchUIBiomeStreamSubscriber)subscriber
{
  return (SearchUIBiomeStreamSubscriber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubscriber:(id)a3
{
}

- (WFContextualAction)action
{
  return (WFContextualAction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAction:(id)a3
{
}

- (BOOL)isHiddenByEvent
{
  return self->_isHiddenByEvent;
}

- (id)debounceBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setDebounceBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debounceBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
}

void __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_71_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [*(id *)(a1 + 32) action];
  BOOL v4 = [v3 settingBiomeStreamIdentifier];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Could not get enablement status for biome event (%@)", (uint8_t *)&v5, 0xCu);
}

@end