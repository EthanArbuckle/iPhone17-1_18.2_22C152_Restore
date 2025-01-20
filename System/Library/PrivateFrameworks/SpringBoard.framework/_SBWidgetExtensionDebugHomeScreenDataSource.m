@interface _SBWidgetExtensionDebugHomeScreenDataSource
- (_SBWidgetExtensionDebugHomeScreenDataSource)initWithIconManager:(id)a3;
- (id)hasExistingWidgetFromExtension:(id)a3;
- (void)_reallyLaunchWidgetOnHomeScreen:(id)a3 widgetFamily:(int64_t)a4;
- (void)launchWidget:(id)a3 widgetFamily:(int64_t)a4 completion:(id)a5;
@end

@implementation _SBWidgetExtensionDebugHomeScreenDataSource

- (_SBWidgetExtensionDebugHomeScreenDataSource)initWithIconManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBWidgetExtensionDebugHomeScreenDataSource;
  v6 = [(_SBWidgetExtensionDebugHomeScreenDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconManager, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
    inFlightAnimationTransactions = v7->_inFlightAnimationTransactions;
    v7->_inFlightAnimationTransactions = (NSHashTable *)v8;
  }
  return v7;
}

- (id)hasExistingWidgetFromExtension:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self->_iconManager iconModel];
  v6 = [v5 widgetIconsContainingWidgetsMatchingExtensionBundleIdentifier:v4 kind:0 sizeClass:0];

  if ([v6 count])
  {
    v7 = [v6 firstObject];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = objc_msgSend(v7, "widgets", 0);
    v9 = (SBWidgetExtensionDebugSearchResult *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (SBWidgetExtensionDebugSearchResult *)((char *)i + 1))
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = [v12 extensionBundleIdentifier];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            v15 = [v12 kind];
            v16 = [v7 gridSizeClass];
            uint64_t v17 = CHSWidgetFamilyForSBHIconGridSizeClass();

            v9 = [[SBWidgetExtensionDebugSearchResult alloc] initWithKind:v15 family:v17];
            goto LABEL_12;
          }
        }
        v9 = (SBWidgetExtensionDebugSearchResult *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)launchWidget:(id)a3 widgetFamily:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke;
  v23[3] = &unk_1E6B07570;
  id v10 = v9;
  id v25 = v10;
  v23[4] = self;
  id v11 = v8;
  id v24 = v11;
  int64_t v26 = a4;
  v12 = (void *)MEMORY[0x1D948C7A0](v23);
  v13 = [[SBDismissOverlaysAnimationController alloc] initWithTransitionContextProvider:0 options:-1];
  objc_initWeak(&location, v13);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_3;
  v18 = &unk_1E6AFCC28;
  id v14 = v12;
  long long v19 = self;
  id v20 = v14;
  objc_copyWeak(&v21, &location);
  [(SBDismissOverlaysAnimationController *)v13 setCompletionBlock:&v15];
  -[NSHashTable addObject:](self->_inFlightAnimationTransactions, "addObject:", v13, v15, v16, v17, v18, v19);
  [(SBDismissOverlaysAnimationController *)v13 begin];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

- (void)_reallyLaunchWidgetOnHomeScreen:(id)a3 widgetFamily:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SBLogWidgets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 debugDescription];
    id v8 = MEMORY[0x1D9489280](a4);
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    long long v22 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBAvocadoDebuggingController ensuring widget is visible for descriptor: %@ family: %@", buf, 0x16u);
  }
  id v9 = +[SBIconController sharedInstance];
  id v10 = [v9 iconManager];
  [v10 _ensureWidgetIsVisibleForDebuggingWithDescriptor:v5 sizeClass:a4];

  id v11 = [v5 extensionIdentity];
  v12 = [v11 containerBundleIdentifier];

  v13 = SBLogWidgets();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_SBWidgetExtensionDebugHomeScreenDataSource _reallyLaunchWidgetOnHomeScreen:widgetFamily:]((uint64_t)v12, v5, v13);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F58DC0]);
  uint64_t v15 = [v5 kind];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke;
  v17[3] = &unk_1E6AFC6D0;
  id v18 = v12;
  id v16 = v12;
  [v14 reloadTimelinesOfKind:v15 containedIn:v16 reason:@"Tools" completion:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAnimationTransactions, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
}

- (void)_reallyLaunchWidgetOnHomeScreen:(NSObject *)a3 widgetFamily:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 kind];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Going to reload the timeline for container: %{public}@ kind: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end