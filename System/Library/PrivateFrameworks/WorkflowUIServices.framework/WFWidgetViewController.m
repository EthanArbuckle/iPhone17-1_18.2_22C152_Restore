@interface WFWidgetViewController
+ (id)progressSubscribers;
+ (id)runningStates;
+ (id)workflowOrFolderIdentifierFromINIntentBackedOptions:(id)a3 widgetType:(int64_t)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)needsLayout;
- (BOOL)running;
- (OS_os_log)log;
- (WFColor)homeScreenTintColor;
- (WFSystemActionRunnerClient)client;
- (WFWidgetDataSource)dataSource;
- (WFWidgetEmptyStateView)emptyStateView;
- (WFWidgetGridView)gridView;
- (WFWidgetOptions)options;
- (WFWidgetViewController)initWithOptions:(id)a3;
- (double)cornerRadius;
- (id)emptyStateTitle;
- (id)fetchDataSource;
- (id)publishingHandlerForCell:(id)a3;
- (id)runningContextForAction:(id)a3;
- (int64_t)widgetType;
- (int64_t)widgetTypeFromOptions:(id)a3;
- (unint64_t)limitFromOptions:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)emptyStateViewWasTapped:(id)a3;
- (void)gridView:(id)a3 cellDidTransitionToRunningState:(int64_t)a4;
- (void)gridView:(id)a3 didTapCell:(id)a4;
- (void)handleUpdateFromCache:(id)a3;
- (void)layoutWithActions:(id)a3 dataSource:(id)a4;
- (void)loadView;
- (void)openShortcutsAppWithOptions:(id)a3;
- (void)refreshActionsWithDataSource:(id)a3;
- (void)refreshDataSource;
- (void)removeStaleRunningContexts;
- (void)restoreRunningStateIfNecessary;
- (void)resumeRunningWithCell:(id)a3;
- (void)setClient:(id)a3;
- (void)setHomeScreenTintColor:(id)a3;
- (void)setNeedsLayout:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
- (void)showEmptyStateViewIfNeeded;
- (void)showRunningUIForCell:(id)a3;
- (void)showWidgetGridViewIfNeeded;
- (void)startObservingContentSizeCategoryNotifications;
- (void)stopObservingContentSizeCategoryNotifications;
- (void)stopRunningWithCell:(id)a3;
- (void)tintWithHomeScreenTintColor:(CGColor *)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation WFWidgetViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setClient:(id)a3
{
}

- (WFSystemActionRunnerClient)client
{
  return self->_client;
}

- (WFWidgetOptions)options
{
  return self->_options;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)widgetType
{
  return self->_widgetType;
}

- (void)setHomeScreenTintColor:(id)a3
{
}

- (WFColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v10;
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = [(WFWidgetViewController *)self gridView];
    v15 = [v13 action];
    v16 = [v14 cellForSystemAction:v15];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __98__WFWidgetViewController_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
    v19[3] = &unk_2642A59B8;
    id v20 = v16;
    BOOL v23 = a6;
    id v21 = v12;
    v22 = self;
    id v17 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v19);

    v18 = v13;
  }
  else
  {

    v18 = getWFWidgetLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFWidgetViewController workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]";
      _os_log_impl(&dword_2177E0000, v18, OS_LOG_TYPE_ERROR, "%s Could not cast workflow runner client to system action client", buf, 0xCu);
    }
  }
}

void __98__WFWidgetViewController_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = *(unsigned char *)(a1 + 56) == 0;
  }
  [*(id *)(a1 + 32) setCompletingSuccessfully:v2];
  v3 = [*(id *)(a1 + 32) progress];

  if (!v3)
  {
    v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    [v4 stopRunningWithCell:v5];
  }
}

- (void)openShortcutsAppWithOptions:(id)a3
{
  v3 = (void *)MEMORY[0x263F3F790];
  id v4 = a3;
  id v5 = [v3 serviceWithDefaultShellEndpoint];
  [v5 openApplication:*MEMORY[0x263F85610] withOptions:v4 completion:&__block_literal_global_161_1121];
}

- (void)emptyStateViewWasTapped:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [(WFWidgetViewController *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_DEFAULT, "Empty state view was tapped, launching Shortcuts app", buf, 2u);
  }

  id v5 = [(WFWidgetViewController *)self dataSource];
  v6 = [v5 folderIdentifierForDeepLinking];

  if ([(WFWidgetViewController *)self widgetType] == 2 && v6)
  {
    v7 = NSURL;
    v8 = [NSString stringWithFormat:@"shortcuts://folder?id=%@", v6];
    v9 = [v7 URLWithString:v8];

    if (v9)
    {
      uint64_t v13 = *MEMORY[0x263F3F5E0];
      v14[0] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v11 = [MEMORY[0x263F3F778] optionsWithDictionary:v10];
      [(WFWidgetViewController *)self openShortcutsAppWithOptions:v11];
    }
    else
    {
      [(WFWidgetViewController *)self openShortcutsAppWithOptions:0];
    }
  }
  else
  {
    [(WFWidgetViewController *)self openShortcutsAppWithOptions:0];
  }
}

- (void)gridView:(id)a3 cellDidTransitionToRunningState:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3 || !a4)
  {
    [(WFWidgetViewController *)self setRunning:0];
    if ([(WFWidgetViewController *)self needsLayout])
    {
      v7 = [(WFWidgetViewController *)self log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2177E0000, v7, OS_LOG_TYPE_DEFAULT, "Doing deferred layout now", v9, 2u);
      }

      v8 = [(WFWidgetViewController *)self dataSource];
      [(WFWidgetViewController *)self refreshActionsWithDataSource:v8];
    }
  }
}

- (void)gridView:(id)a3 didTapCell:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(WFWidgetViewController *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v30) = 0;
    _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_DEFAULT, "Widget was tapped", (uint8_t *)&v30, 2u);
  }

  v7 = [v5 action];

  if (v7)
  {
    if ([v5 runningState] == 1 || objc_msgSend(v5, "runningState") == 2)
    {
      v8 = [(WFWidgetViewController *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v5 action];
        id v10 = [v9 identifier];
        int v30 = 138543362;
        id v31 = v10;
        _os_log_impl(&dword_2177E0000, v8, OS_LOG_TYPE_DEFAULT, "Workflow (%{public}@) was running, now stopping...", (uint8_t *)&v30, 0xCu);
      }
      [(WFWidgetViewController *)self stopRunningWithCell:v5];
    }
    else if ([(WFWidgetViewController *)self running])
    {
      id v12 = [(WFWidgetViewController *)self log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_2177E0000, v12, OS_LOG_TYPE_DEFAULT, "A different workflow was running, ignoring tap", (uint8_t *)&v30, 2u);
      }
    }
    else
    {
      uint64_t v13 = [v5 runningState];
      v14 = [(WFWidgetViewController *)self log];
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13 == 3)
      {
        if (v15)
        {
          v16 = [v5 action];
          id v17 = [v16 identifier];
          int v30 = 138543362;
          id v31 = v17;
          _os_log_impl(&dword_2177E0000, v14, OS_LOG_TYPE_DEFAULT, "Resuming run with action identifier: %{public}@", (uint8_t *)&v30, 0xCu);
        }
        [(WFWidgetViewController *)self resumeRunningWithCell:v5];
      }
      else
      {
        if (v15)
        {
          v18 = [v5 action];
          v19 = [v18 identifier];
          int v30 = 138543362;
          id v31 = v19;
          _os_log_impl(&dword_2177E0000, v14, OS_LOG_TYPE_DEFAULT, "Starting run with action identifier: %{public}@", (uint8_t *)&v30, 0xCu);
        }
        [(WFWidgetViewController *)self showRunningUIForCell:v5];
        id v20 = objc_alloc(MEMORY[0x263F85440]);
        id v21 = [v5 action];
        v22 = (void *)[v20 initWithSystemAction:v21];

        [v22 start];
        BOOL v23 = [v22 context];

        if (v23)
        {
          v24 = [v22 context];
          v25 = [v5 action];
          [v24 setAction:v25];

          uint64_t v26 = [(WFWidgetViewController *)self publishingHandlerForCell:v5];
          v27 = [v24 addProgressSubscriberUsingPublishingHandler:v26];

          v28 = [(id)objc_opt_class() progressSubscribers];
          [v28 setObject:v27 forKey:v24];

          v29 = [(id)objc_opt_class() runningStates];
          [v29 addObject:v24];

          objc_storeStrong((id *)&self->_client, v22);
        }
      }
    }
  }
  else
  {
    id v11 = [(WFWidgetViewController *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      id v31 = v5;
      _os_log_impl(&dword_2177E0000, v11, OS_LOG_TYPE_DEFAULT, "Cell (%@) does not have an action, launching Shortcuts app", (uint8_t *)&v30, 0xCu);
    }

    [(WFWidgetViewController *)self openShortcutsAppWithOptions:0];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = [(WFWidgetViewController *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_DEFAULT, "Received ContentSizeCategory changed notification", v6, 2u);
  }

  id v5 = [(WFWidgetViewController *)self dataSource];
  [(WFWidgetViewController *)self refreshActionsWithDataSource:v5];
}

- (void)stopObservingContentSizeCategoryNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83428] object:0];
}

- (void)startObservingContentSizeCategoryNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];
}

- (void)tintWithHomeScreenTintColor:(CGColor *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = [(WFWidgetViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [(WFWidgetViewController *)self gridView];
    v9 = [(WFWidgetViewController *)self gridView];
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v16 = 134219010;
    id v17 = self;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2048;
    id v21 = v8;
    __int16 v22 = 2112;
    BOOL v23 = v11;
    __int16 v24 = 2112;
    v25 = a3;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEFAULT, "<%p %@> Assigning home screen tint color to <%p %@>: %@", (uint8_t *)&v16, 0x34u);
  }
  if (a3)
  {
    id v12 = [MEMORY[0x263F851A8] colorWithCGColor:a3];
  }
  else
  {
    id v12 = 0;
  }
  homeScreenTintColor = self->_homeScreenTintColor;
  self->_homeScreenTintColor = v12;
  v14 = v12;

  BOOL v15 = [(WFWidgetViewController *)self gridView];
  [v15 tintWithHomeScreenTintColor:v14];
}

- (id)runningContextForAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(), "runningStates", 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 action];
        id v10 = v3;
        id v11 = v9;
        if (v11 == v10)
        {

LABEL_16:
          id v5 = v8;
          goto LABEL_17;
        }
        id v12 = v11;
        if (v3 && v11)
        {
          char v13 = [v10 isEqual:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v5;
}

- (id)publishingHandlerForCell:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WFWidgetViewController_publishingHandlerForCell___block_invoke;
  v9[3] = &unk_2642A5970;
  id v10 = v4;
  id v11 = self;
  id v5 = v4;
  uint64_t v6 = _Block_copy(v9);
  v7 = _Block_copy(v6);

  return v7;
}

id __51__WFWidgetViewController_publishingHandlerForCell___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setProgress:a2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_2;
  v7[3] = &unk_2642A5EC8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = _Block_copy(v7);

  return v5;
}

void __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_3;
  v5[3] = &unk_2642A5EC8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, MEMORY[0x263EF83A0], v5);
}

void __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) runningState];
  id v3 = *(void **)(a1 + 40);
  if (v2 == 3)
  {
    [v3 setRunning:0];
    id v5 = [*(id *)(a1 + 40) gridView];
    [v5 enableAllCells];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    [v3 stopRunningWithCell:v4];
  }
}

- (void)restoreRunningStateIfNecessary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(WFWidgetViewController *)self removeStaleRunningContexts];
    id v3 = [(id)objc_opt_class() runningStates];
    uint64_t v4 = [(WFWidgetViewController *)self gridView];
    id v5 = [v4 actionsForVisibleCells];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      __int16 v22 = v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "action", v22);

          if (v12)
          {
            char v13 = [v11 action];
            int v14 = [v5 containsObject:v13];

            if (v14)
            {
              long long v15 = [(WFWidgetViewController *)self gridView];
              long long v16 = [v11 action];
              long long v17 = [v15 cellForSystemAction:v16];

              if ([v17 runningState] == 1 || objc_msgSend(v17, "runningState") == 2)
              {

                goto LABEL_18;
              }
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              v24[0] = __56__WFWidgetViewController_restoreRunningStateIfNecessary__block_invoke;
              v24[1] = &unk_2642A5EA0;
              id v25 = v17;
              id v18 = v17;
              dispatch_async(MEMORY[0x263EF83A0], block);
              v19 = [(WFWidgetViewController *)self publishingHandlerForCell:v18];
              uint64_t v20 = [v11 addProgressSubscriberUsingPublishingHandler:v19];

              id v21 = [(id)objc_opt_class() progressSubscribers];
              [v21 setObject:v20 forKey:v11];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  else
  {
    id v6 = [(WFWidgetViewController *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_2177E0000, v6, OS_LOG_TYPE_FAULT, "restoreRunningStateIfNecessary must be called on the main thread", buf, 2u);
    }
  }
}

uint64_t __56__WFWidgetViewController_restoreRunningStateIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRunningState:3];
}

- (void)removeStaleRunningContexts
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v19 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [(id)objc_opt_class() runningStates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = [v9 creationDate];
        id v11 = [v19 components:16 fromDate:v10 toDate:v2 options:0];

        if ([v11 day] >= 7)
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * j);
        id v18 = [(id)objc_opt_class() runningStates];
        [v18 removeObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }
}

- (void)resumeRunningWithCell:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __48__WFWidgetViewController_resumeRunningWithCell___block_invoke;
  block[3] = &unk_2642A5EA0;
  id v5 = v4;
  id v12 = v5;
  id v6 = MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], block);
  dispatch_time_t v7 = dispatch_time(0, 300000000);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WFWidgetViewController_resumeRunningWithCell___block_invoke_2;
  v9[3] = &unk_2642A5EC8;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v7, v6, v9);
}

uint64_t __48__WFWidgetViewController_resumeRunningWithCell___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRunningState:1];
}

void __48__WFWidgetViewController_resumeRunningWithCell___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) showRunningUIForCell:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) client];
  [v2 resume];
}

- (void)stopRunningWithCell:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__WFWidgetViewController_stopRunningWithCell___block_invoke;
  v6[3] = &unk_2642A5EC8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __46__WFWidgetViewController_stopRunningWithCell___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRunningState:0];
  [*(id *)(a1 + 40) setRunning:0];
  id v2 = [*(id *)(a1 + 40) client];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) client];
    [v3 stop];
  }
  [*(id *)(a1 + 40) setClient:0];
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) action];
  id v10 = [v4 runningContextForAction:v5];

  if (v10)
  {
    id v6 = [(id)objc_opt_class() runningStates];
    [v6 removeObject:v10];
  }
  id v7 = [(id)objc_opt_class() progressSubscribers];
  id v8 = [v7 objectForKey:v10];

  if (v8)
  {
    [MEMORY[0x263F08AB8] removeSubscriber:v8];
    uint64_t v9 = [(id)objc_opt_class() progressSubscribers];
    [v9 removeObjectForKey:v10];
  }
}

- (void)showRunningUIForCell:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__WFWidgetViewController_showRunningUIForCell___block_invoke;
  v6[3] = &unk_2642A5EC8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __47__WFWidgetViewController_showRunningUIForCell___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRunningState:1];
  [*(id *)(a1 + 40) setRunning:1];
  id v2 = [*(id *)(a1 + 40) gridView];
  [v2 disableAllCellsExceptCell:*(void *)(a1 + 32)];
}

- (void)handleUpdateFromCache:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFWidgetViewController_handleUpdateFromCache___block_invoke;
  v6[3] = &unk_2642A5EC8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __48__WFWidgetViewController_handleUpdateFromCache___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"WFWidgetCacheAssociatedIdentifier"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 40) dataSource];
  char v7 = [v6 cacheUpdateIdentifierIsValid:v5];

  id v8 = [*(id *)(a1 + 40) log];
  uint64_t v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_2177E0000, v9, OS_LOG_TYPE_INFO, "Ignoring notification, mismatched identifiers (%@)", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)(a1 + 32) object];
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl(&dword_2177E0000, v9, OS_LOG_TYPE_DEFAULT, "Updating widget with workflows from notification: %@", (uint8_t *)&v15, 0xCu);
  }
  int v11 = [*(id *)(a1 + 40) running];
  id v12 = *(void **)(a1 + 40);
  if (!v11)
  {
    [v12 refreshDataSource];
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v9 = [v14 dataSource];
    [v14 refreshActionsWithDataSource:v9];
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v13 = [v12 log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_2177E0000, v13, OS_LOG_TYPE_DEFAULT, "Observable result change came in while we were running, deferring layout until we're done running", (uint8_t *)&v15, 2u);
  }

  [*(id *)(a1 + 40) setNeedsLayout:1];
LABEL_17:
}

- (unint64_t)limitFromOptions:(id)a3
{
  uint64_t v4 = [a3 family] - 1;
  unint64_t result = 4;
  switch(v4)
  {
    case 0:
      if ([(WFWidgetViewController *)self widgetType] == 2) {
        unint64_t result = 2;
      }
      else {
        unint64_t result = 1;
      }
      break;
    case 1:
      return result;
    case 2:
      unint64_t result = 8;
      break;
    default:
      unint64_t result = 16;
      break;
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)refreshActionsWithDataSource:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFWidgetViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    int v10 = 134218242;
    int v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEFAULT, "<%p %@> Refreshing actions", (uint8_t *)&v10, 0x16u);
  }
  if ([(WFWidgetViewController *)self widgetType] == 1)
  {
    id v8 = [(WFWidgetViewController *)self options];
    [v8 family];
  }
  uint64_t v9 = [v4 configuredActions];
  [(WFWidgetViewController *)self layoutWithActions:v9 dataSource:v4];
}

- (id)emptyStateTitle
{
  if ([(WFWidgetViewController *)self widgetType] == 1
    && ([(WFWidgetViewController *)self options],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 family],
        v3,
        v4 == 1))
  {
    id v5 = @"Choose shortcut";
  }
  else
  {
    id v5 = @"No shortcuts";
  }
  id v6 = WFLocalizedString(v5);
  return v6;
}

- (void)layoutWithActions:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WFWidgetViewController *)self setNeedsLayout:0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __55__WFWidgetViewController_layoutWithActions_dataSource___block_invoke;
  block[3] = &unk_2642A5DF0;
  id v11 = v6;
  __int16 v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__WFWidgetViewController_layoutWithActions_dataSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 showWidgetGridViewIfNeeded];
    id v4 = [*(id *)(a1 + 40) gridView];
    [v4 layoutWithActions:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 48)];
  }
  else
  {
    [v3 showEmptyStateViewIfNeeded];
  }
}

- (int64_t)widgetTypeFromOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 intent];
  id v5 = [v4 typeName];
  char v6 = [v5 isEqualToString:@"sirikit.intents.custom.com.apple.WorkflowKit.ShortcutsIntents.WFShortcutsSmallWidgetConfigurationIntent"];

  if (v6)
  {
    int64_t v7 = 1;
  }
  else
  {
    id v8 = [v3 intent];
    id v9 = [v8 typeName];
    char v10 = [v9 isEqualToString:@"sirikit.intents.custom.com.apple.WorkflowKit.ShortcutsIntents.WFShortcutsWidgetConfigurationIntent"];

    if (v10)
    {
      int64_t v7 = 2;
    }
    else
    {
      id v11 = [v3 intent];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v12 = v11;
        }
        else {
          __int16 v12 = 0;
        }
      }
      else
      {
        __int16 v12 = 0;
      }
      id v13 = v12;

      uint64_t v14 = [v13 appIntentIdentifier];
      char v15 = [v14 isEqualToString:@"WFShortcutsSmallWidgetConfigurationIntent"];

      if (v15)
      {
        int64_t v7 = 1;
      }
      else
      {
        id v16 = [v13 appIntentIdentifier];
        char v17 = [v16 isEqualToString:@"WFShortcutsWidgetConfigurationIntent"];

        if (v17)
        {
          int64_t v7 = 2;
        }
        else
        {
          id v18 = getWFWidgetLogObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            int v20 = 136315394;
            long long v21 = "-[WFWidgetViewController widgetTypeFromOptions:]";
            __int16 v22 = 2112;
            id v23 = v3;
            _os_log_impl(&dword_2177E0000, v18, OS_LOG_TYPE_FAULT, "%s Could not determine widget type from options %@", (uint8_t *)&v20, 0x16u);
          }

          int64_t v7 = 0;
        }
      }
    }
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFWidgetViewController;
  [(WFWidgetViewController *)&v4 viewWillAppear:a3];
  [(WFWidgetViewController *)self restoreRunningStateIfNecessary];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(WFWidgetViewController *)self dataSource];
  [(WFWidgetViewController *)self refreshActionsWithDataSource:v3];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetViewController;
  [(WFWidgetViewController *)&v13 viewWillLayoutSubviews];
  id v3 = [(WFWidgetViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  __int16 v12 = [(WFWidgetViewController *)self gridView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)showWidgetGridViewIfNeeded
{
  id v3 = [(WFWidgetViewController *)self emptyStateView];
  double v4 = [v3 superview];

  if (v4)
  {
    double v5 = [(WFWidgetViewController *)self emptyStateView];
    [v5 removeFromSuperview];
  }
  double v6 = [(WFWidgetViewController *)self gridView];
  double v7 = [v6 superview];

  if (!v7)
  {
    id v9 = [(WFWidgetViewController *)self view];
    double v8 = [(WFWidgetViewController *)self gridView];
    [v9 addSubview:v8];
  }
}

- (void)showEmptyStateViewIfNeeded
{
  id v3 = [(WFWidgetViewController *)self gridView];
  double v4 = [v3 superview];

  if (v4)
  {
    double v5 = [(WFWidgetViewController *)self gridView];
    [v5 removeFromSuperview];
  }
  id v11 = [(WFWidgetViewController *)self emptyStateTitle];
  double v6 = [(WFWidgetViewController *)self emptyStateView];
  [v6 setTitleString:v11];

  double v7 = [(WFWidgetViewController *)self emptyStateView];
  double v8 = [v7 superview];

  if (!v8)
  {
    id v9 = [(WFWidgetViewController *)self view];
    double v10 = [(WFWidgetViewController *)self emptyStateView];
    [v9 addSubview:v10];
  }
}

- (WFWidgetEmptyStateView)emptyStateView
{
  emptyStateView = self->_emptyStateView;
  if (!emptyStateView)
  {
    if ([(WFWidgetViewController *)self widgetType] == 2) {
      double v4 = @"Choose shortcuts";
    }
    else {
      double v4 = @"Choose shortcut";
    }
    double v5 = WFLocalizedString(v4);
    double v6 = [[WFWidgetEmptyStateView alloc] initWithTitle:v5];
    [(WFWidgetEmptyStateView *)v6 setDelegate:self];
    [(WFWidgetEmptyStateView *)v6 setClipsToBounds:1];
    double v7 = [(WFWidgetViewController *)self view];
    [v7 bounds];
    -[WFWidgetEmptyStateView setFrame:](v6, "setFrame:");

    [(WFWidgetEmptyStateView *)v6 setAutoresizingMask:18];
    double v8 = self->_emptyStateView;
    self->_emptyStateView = v6;

    emptyStateView = self->_emptyStateView;
  }
  return emptyStateView;
}

- (WFWidgetGridView)gridView
{
  gridView = self->_gridView;
  if (!gridView)
  {
    double v4 = [WFWidgetGridView alloc];
    double v5 = [(WFWidgetViewController *)self options];
    uint64_t v6 = [v5 family];
    int64_t v7 = [(WFWidgetViewController *)self widgetType];
    [(WFWidgetViewController *)self cornerRadius];
    double v9 = v8;
    double v10 = [(WFWidgetViewController *)self log];
    id v11 = [(WFWidgetGridView *)v4 initWithFamily:v6 widgetType:v7 cornerRadius:v10 log:v9];

    [(WFWidgetGridView *)v11 setDelegate:self];
    [(WFWidgetGridView *)v11 setClipsToBounds:1];
    __int16 v12 = [(WFWidgetViewController *)self view];
    [v12 bounds];
    -[WFWidgetGridView setFrame:](v11, "setFrame:");

    [(WFWidgetGridView *)v11 setAutoresizingMask:18];
    [(WFWidgetGridView *)v11 tintWithHomeScreenTintColor:self->_homeScreenTintColor];
    objc_super v13 = self->_gridView;
    self->_gridView = v11;

    gridView = self->_gridView;
  }
  return gridView;
}

- (void)refreshDataSource
{
  self->_dataSource = [(WFWidgetViewController *)self fetchDataSource];
  MEMORY[0x270F9A758]();
}

- (WFWidgetDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    double v4 = [(WFWidgetViewController *)self fetchDataSource];
    double v5 = self->_dataSource;
    self->_dataSource = v4;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (id)fetchDataSource
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = [(WFWidgetViewController *)self options];
  double v4 = [v3 intent];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = getWFWidgetLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v47 = 136315138;
        v48 = "-[WFWidgetViewController fetchDataSource]";
        _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEBUG, "%s Attempting modern INAppIntent widget deserialization", (uint8_t *)&v47, 0xCu);
      }

      uint64_t v6 = [v4 linkAction];
      if (!v6)
      {
        id v11 = getWFWidgetLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v47 = 136315394;
          v48 = "-[WFWidgetViewController fetchDataSource]";
          __int16 v49 = 2112;
          v50 = v4;
          _os_log_impl(&dword_2177E0000, v11, OS_LOG_TYPE_ERROR, "%s Could not get link action from INAppIntent: %@", (uint8_t *)&v47, 0x16u);
        }
        objc_super v13 = 0;
        goto LABEL_45;
      }
      int64_t v7 = [(WFWidgetViewController *)self widgetType];
      double v8 = [v6 parameters];
      double v9 = v8;
      if (v7 == 1)
      {
        double v10 = objc_msgSend(v8, "if_firstObjectPassingTest:", &__block_literal_global_1135);
        id v11 = [v10 value];

        __int16 v12 = [MEMORY[0x263F851D0] systemActionWithValue:v11];
        objc_super v13 = [[WFWidgetDataSource alloc] initWithAction:v12];
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
      long long v21 = objc_msgSend(v8, "if_firstObjectPassingTest:", &__block_literal_global_89);
      id v11 = [v21 value];

      __int16 v22 = [v11 value];
      if (v22)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v23 = v22;
        }
        else {
          id v23 = 0;
        }
      }
      else
      {
        id v23 = 0;
      }
      id v24 = v23;

      long long v25 = [v24 identifier];

      __int16 v12 = [v25 instanceIdentifier];

      long long v26 = [NSURL URLWithString:v12];
      long long v27 = [v26 pathComponents];
      uint64_t v28 = [v27 lastObject];
      long long v29 = (void *)v28;
      uint64_t v30 = @"MyShortcuts";
      if (v28) {
        uint64_t v30 = (__CFString *)v28;
      }
      id v31 = v30;

      uint64_t v32 = v31;
      v33 = v32;
      if (v32 == @"all-shortcuts"
        || (int v34 = [(__CFString *)v32 isEqualToString:@"all-shortcuts"], v33,
                                                                                                   v34))
      {

        v35 = [WFWidgetDataSource alloc];
        v36 = [(WFWidgetViewController *)self options];
        unint64_t v37 = [(WFWidgetViewController *)self limitFromOptions:v36];
        v38 = @"MyShortcuts";
      }
      else
      {
        v39 = v33;
        v38 = v39;
        if (v39 == @"custom"
          || (int v40 = [(__CFString *)v39 isEqualToString:@"custom"], v38, v40))
        {
          v41 = [v6 parameters];
          v42 = objc_msgSend(v41, "if_firstObjectPassingTest:", &__block_literal_global_99);
          v36 = [v42 value];

          v43 = [v36 value];
          if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            v44 = getWFGeneralLogObject();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              int v47 = 136315394;
              v48 = "-[WFWidgetViewController fetchDataSource]";
              __int16 v49 = 2112;
              v50 = v6;
              _os_log_impl(&dword_2177E0000, v44, OS_LOG_TYPE_DEFAULT, "%s Got action %@", (uint8_t *)&v47, 0x16u);
            }

            v43 = 0;
          }
          v45 = objc_msgSend(v43, "if_compactMap:", &__block_literal_global_103);
          objc_super v13 = [[WFWidgetDataSource alloc] initWithActions:v45];

          goto LABEL_43;
        }
        v35 = [WFWidgetDataSource alloc];
        v36 = [(WFWidgetViewController *)self options];
        unint64_t v37 = [(WFWidgetViewController *)self limitFromOptions:v36];
      }
      objc_super v13 = [(WFWidgetDataSource *)v35 initWithIdentifier:v38 limit:v37];
LABEL_43:

      goto LABEL_44;
    }
  }

  uint64_t v14 = getWFWidgetLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v47 = 136315138;
    v48 = "-[WFWidgetViewController fetchDataSource]";
    _os_log_impl(&dword_2177E0000, v14, OS_LOG_TYPE_DEBUG, "%s Attempting INIntent widget deserialization", (uint8_t *)&v47, 0xCu);
  }

  char v15 = objc_opt_class();
  id v16 = [(WFWidgetViewController *)self options];
  double v4 = objc_msgSend(v15, "workflowOrFolderIdentifierFromINIntentBackedOptions:widgetType:", v16, -[WFWidgetViewController widgetType](self, "widgetType"));

  if (v4)
  {
    if ([(WFWidgetViewController *)self widgetType] != 1)
    {
      if ([(WFWidgetViewController *)self widgetType] != 2)
      {
        objc_super v13 = 0;
        goto LABEL_47;
      }
      int v20 = [WFWidgetDataSource alloc];
      uint64_t v6 = [(WFWidgetViewController *)self options];
      char v17 = [(WFWidgetDataSource *)v20 initWithIdentifier:v4 limit:[(WFWidgetViewController *)self limitFromOptions:v6]];
      goto LABEL_19;
    }
    uint64_t v6 = +[WFWidgetDataSource systemActionForWorkflowIdentifier:v4];
    if (v6)
    {
      char v17 = [[WFWidgetDataSource alloc] initWithAction:v6];
LABEL_19:
      objc_super v13 = v17;
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v6 = getWFWidgetLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(WFWidgetViewController *)self options];
      v19 = [v18 intent];
      int v47 = 136315394;
      v48 = "-[WFWidgetViewController fetchDataSource]";
      __int16 v49 = 2112;
      v50 = v19;
      _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_ERROR, "%s Could not get workflow or folder identifier: %@", (uint8_t *)&v47, 0x16u);
    }
  }
  objc_super v13 = 0;
LABEL_46:

LABEL_47:
  return v13;
}

uint64_t __41__WFWidgetViewController_fetchDataSource__block_invoke_100(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F851D0] systemActionWithValue:a2];
}

uint64_t __41__WFWidgetViewController_fetchDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  id v3 = v2;
  if (v2 == @"shortcut")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"shortcut"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __41__WFWidgetViewController_fetchDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  id v3 = v2;
  if (v2 == @"folder")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"folder"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __41__WFWidgetViewController_fetchDataSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  id v3 = v2;
  if (v2 == @"shortcut")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"shortcut"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)WFWidgetViewController;
  [(WFWidgetViewController *)&v12 loadView];
  [(WFWidgetViewController *)self cornerRadius];
  double v4 = v3;
  double v5 = [(WFWidgetViewController *)self view];
  uint64_t v6 = [v5 layer];
  [v6 setCornerRadius:v4];

  uint64_t v7 = *MEMORY[0x263F15A20];
  double v8 = [(WFWidgetViewController *)self view];
  double v9 = [v8 layer];
  [v9 setCornerCurve:v7];

  double v10 = [(WFWidgetViewController *)self view];
  id v11 = [v10 layer];
  [v11 setMasksToBounds:1];
}

- (void)dealloc
{
  [(WFWidgetViewController *)self stopObservingContentSizeCategoryNotifications];
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"WFWidgetCacheUpdateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFWidgetViewController;
  [(WFWidgetViewController *)&v4 dealloc];
}

- (WFWidgetViewController)initWithOptions:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)WFWidgetViewController;
  uint64_t v6 = [(WFWidgetViewController *)&v34 initWithNibName:0 bundle:0];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    os_log_t v8 = os_log_create("com.apple.shortcuts", "Widget");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v7->_widgetType = [(WFWidgetViewController *)v7 widgetTypeFromOptions:v5];
    int HasBeenUnlocked = VCDeviceHasBeenUnlocked();
    id v11 = v7->_log;
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (HasBeenUnlocked)
    {
      if (v12)
      {
        objc_super v13 = v11;
        uint64_t v14 = (objc_class *)objc_opt_class();
        char v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 134218242;
        v36 = v7;
        __int16 v37 = 2112;
        v38 = v15;
        _os_log_impl(&dword_2177E0000, v13, OS_LOG_TYPE_DEFAULT, "<%p %@> Device has been unlocked at least once, refreshing", buf, 0x16u);
      }
      id v16 = [(WFWidgetViewController *)v7 dataSource];
      [(WFWidgetViewController *)v7 refreshActionsWithDataSource:v16];
    }
    else
    {
      if (v12)
      {
        char v17 = v11;
        id v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 134218242;
        v36 = v7;
        __int16 v37 = 2112;
        v38 = v19;
        _os_log_impl(&dword_2177E0000, v17, OS_LOG_TYPE_DEFAULT, "<%p %@> Device has not unlocked before, listening for first unlock", buf, 0x16u);
      }
      objc_initWeak((id *)buf, v7);
      id v20 = MEMORY[0x263EF83A0];
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      uint64_t v30 = __42__WFWidgetViewController_initWithOptions___block_invoke;
      id v31 = &unk_2642A5928;
      uint64_t v32 = v7;
      objc_copyWeak(&v33, (id *)buf);
      VCPerformOnFirstUnlock();

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    [(WFWidgetViewController *)v7 startObservingContentSizeCategoryNotifications];
    long long v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v7 selector:sel_handleUpdateFromCache_ name:@"WFWidgetCacheUpdateNotification" object:0];

    __int16 v22 = objc_opt_new();
    id v23 = [v22 previewMetricsSpecificationForBundleIdentifier:*MEMORY[0x263F85610]];

    id v24 = objc_msgSend(v23, "metricsForFamily:", objc_msgSend(v5, "family"));
    [v24 _effectiveCornerRadius];
    v7->_cornerRadius = v25;

    long long v26 = v7;
  }

  return v7;
}

void __42__WFWidgetViewController_initWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 1048);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2177E0000, v2, OS_LOG_TYPE_DEFAULT, "Received first unlock notification", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = [*(id *)(a1 + 32) dataSource];
  [WeakRetained refreshActionsWithDataSource:v4];
}

+ (id)progressSubscribers
{
  if (progressSubscribers_onceToken != -1) {
    dispatch_once(&progressSubscribers_onceToken, &__block_literal_global_147);
  }
  uint64_t v2 = (void *)progressSubscribers_progressSubscribers;
  return v2;
}

uint64_t __45__WFWidgetViewController_progressSubscribers__block_invoke()
{
  progressSubscribers_progressSubscribers = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)runningStates
{
  if (runningStates_onceToken != -1) {
    dispatch_once(&runningStates_onceToken, &__block_literal_global_145);
  }
  uint64_t v2 = (void *)runningStates_set;
  return v2;
}

uint64_t __39__WFWidgetViewController_runningStates__block_invoke()
{
  runningStates_set = [MEMORY[0x263EFF9C0] set];
  return MEMORY[0x270F9A758]();
}

+ (id)workflowOrFolderIdentifierFromINIntentBackedOptions:(id)a3 widgetType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 == 1)
  {
    id v11 = [v5 intent];
    os_log_t v8 = [v11 valueForKey:@"shortcut"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
    }
    goto LABEL_10;
  }
  if (a4 == 2)
  {
    uint64_t v7 = [v5 intent];
    os_log_t v8 = [v7 valueForKey:@"folder"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v9 = [v8 identifier];

        if (!v9)
        {
          double v10 = @"MyShortcuts";
LABEL_11:

          goto LABEL_13;
        }
LABEL_9:
        double v10 = [v8 identifier];
        goto LABEL_11;
      }
    }
LABEL_10:
    double v10 = 0;
    goto LABEL_11;
  }
  double v10 = 0;
LABEL_13:

  return v10;
}

@end