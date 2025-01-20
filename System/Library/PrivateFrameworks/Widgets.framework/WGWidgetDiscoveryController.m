@interface WGWidgetDiscoveryController
+ (int64_t)layoutModeForSize:(CGSize)a3;
- (BOOL)_isApplicationLockedOutWithProxy:(id)a3;
- (BOOL)_isElementWithIdentifierEnabled:(id)a3;
- (BOOL)_isElementWithIdentifierFavorited:(id)a3;
- (BOOL)_isElementWithIdentifierKnown:(id)a3;
- (BOOL)_setEnabled:(BOOL)a3 forElementWithIdentifier:(id)a4;
- (BOOL)alwaysShowsFavoriteWidgets;
- (BOOL)areWidgetsPinned;
- (BOOL)bootstrapFavoriteWidgets;
- (BOOL)shouldPurgeArchivedSnapshotsForWidget:(id)a3;
- (BOOL)shouldPurgeNonASTCSnapshotsForWidget:(id)a3;
- (BOOL)shouldPurgeNonCAMLSnapshotsForWidget:(id)a3;
- (BOOL)shouldShowWidgetsPinButtonForWidgetListEditViewController:(id)a3;
- (BOOL)shouldShowWidgetsPinningTeachingView;
- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierEnabled:(id)a4;
- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierFavorited:(id)a4;
- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierNew:(id)a4;
- (BOOL)widgetListEditViewControllerShouldIncludeInternalWidgets:(id)a3;
- (BOOL)widgetListEditViewControllerShouldShowFavorites:(id)a3;
- (NSMutableDictionary)_widgetIDsToWidgets;
- (NSMutableDictionary)widgetIDsToPendingTestCompletions;
- (NSMutableDictionary)widgetIDsToPendingTestTearDowns;
- (WGWidgetDebugging)debuggingHandler;
- (WGWidgetDiscoveryController)init;
- (WGWidgetDiscoveryControllerDelegate)delegate;
- (WGWidgetListEditViewController)presentedEditViewController;
- (id)_defaultGroupForWidgetWithIdentifier:(id)a3;
- (id)_disabledIdentifiers;
- (id)_groupForWidgetWithIdentifier:(id)a3;
- (id)_insertWidgetWithIdentifier:(id)a3 atTop:(BOOL)a4;
- (id)_newWidgetListEditViewController;
- (id)_newWidgetListEditViewControllerStatusBarAssertion;
- (id)_newWidgetWithIdentifier:(id)a3 delegate:(id)a4;
- (id)_orderedEnabledIdentifiersForGroup:(id)a3;
- (id)_orderedEnabledWidgetIdentifiersForGroup:(id)a3 includingNoContent:(BOOL)a4;
- (id)_orderedVisibleIdentifiersForGroup:(id)a3;
- (id)_orderedVisibleIdentifiersForTodayGroup;
- (id)_orderedVisibleIdentifiersForWidgetGroup;
- (id)_preferredViewControllerForPresentingFromViewController:(id)a3;
- (id)_presentedEditViewControllerStatusBarAssertion;
- (id)_updatePublicationStateOfDatumWithIdentifier:(id)a3 visibilityChanged:(BOOL)a4 contentStateChanged:(BOOL)a5 insertAtTop:(BOOL)a6 notifyingObservers:(BOOL)a7;
- (id)enabledWidgetIdentifiersForAllGroups;
- (id)favoriteWidgetIdentifiers;
- (id)groupsForWidgetListEditViewController:(id)a3;
- (id)todayWidgetIdentifiers;
- (id)visibleWidgetIdentifiersForGroup:(id)a3;
- (id)widgetListEditViewController:(id)a3 defaultGroupForItemWithIdentifier:(id)a4;
- (id)widgetListEditViewController:(id)a3 displayNameForItemWithIdentifier:(id)a4;
- (id)widgetListEditViewController:(id)a3 itemIdentifiersForGroup:(id)a4;
- (id)widgetWithIdentifier:(id)a3 delegate:(id)a4 forRequesterWithIdentifier:(id)a5;
- (int)_nextSequenceNumber;
- (int64_t)_widgetListEditViewControllerStatusBarLegibilityStyle;
- (int64_t)largestAvailableDisplayModeForWidget:(id)a3;
- (int64_t)largestAvailableDisplayModeForWidgetWithIdentifier:(id)a3;
- (int64_t)layoutModeForWidgetListEditViewController:(id)a3;
- (int64_t)userSpecifiedDisplayModeForWidget:(id)a3;
- (int64_t)userSpecifiedDisplayModeForWidgetWithIdentifier:(id)a3;
- (unint64_t)visibleWidgetsCount;
- (void)_addDefaultPinnedWidgets;
- (void)_applicationIconChanged:(id)a3;
- (void)_beginObservingDataSourcesIfNecessary;
- (void)_calculateAndPostNewWidgetsCount;
- (void)_dataSourcesDidChange:(id)a3;
- (void)_externalSourceRequestsInsertionOfWidgetWithIdentifier:(id)a3 insertAtTop:(BOOL)a4;
- (void)_invalidateVisibleIdentifiersForGroup:(id)a3;
- (void)_invalidateWidgetListEditViewControllerStatusBarAssertion:(id)a3;
- (void)_notifyObserversOfOrderChangeForWidgetIdentifiers:(id)a3;
- (void)_notifyObserversOfSignificantWidgetsChange;
- (void)_notifyObserversOfVisibilityChange:(BOOL)a3 ofWidgetWithIdentifier:(id)a4 inGroup:(id)a5;
- (void)_removeWidgetWithIdentifier:(id)a3;
- (void)_requestUnlockWithCompletion:(id)a3;
- (void)_setPresentedEditViewController:(id)a3;
- (void)_setPresentedEditViewControllerStatusBarAssertion:(id)a3;
- (void)_setWidgetsPinned:(BOOL)a3;
- (void)_updateFavoriteWidgetIDs:(id)a3;
- (void)_updateLockedOutStateForWidget:(id)a3;
- (void)_updateLockedOutStateForWidget:(id)a3 withContainingAppProxy:(id)a4;
- (void)_widget:(id)a3 withIdentifier:(id)a4 didRemoveSnapshotAtURL:(id)a5;
- (void)_widgetListEditViewControllerWillDisappear:(id)a3;
- (void)_widgetViewControllerDidRemoveSnapshot:(id)a3;
- (void)_widgetViewControllerRequestsAdd:(id)a3;
- (void)addDiscoveryObserver:(id)a3;
- (void)beginDiscovery;
- (void)debugWidgetWithBundleID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)deviceManagementPolicyDidChange:(id)a3;
- (void)dismissWidgetListEditViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)dismissWidgetListEditViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleWidgetLaunchRecommendation:(id)a3 completion:(id)a4;
- (void)invalidateVisibleIdentifiers;
- (void)noteWidgetsPinningViewControllerDidDismiss:(BOOL)a3;
- (void)presentWidgetListEditViewControllerFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)registerIdentifierForRefreshEvents:(id)a3;
- (void)remoteViewControllerDidConnectForWidgetViewController:(id)a3;
- (void)remoteViewControllerViewDidAppearForWidgetViewController:(id)a3;
- (void)removeDiscoveryObserver:(id)a3;
- (void)removeWidgetIdentifiersFromToday:(id)a3;
- (void)requestRefreshForWidget:(id)a3 afterDate:(id)a4;
- (void)setBootstrapFavoriteWidgets:(BOOL)a3;
- (void)setDebuggingHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasContent:(BOOL)a3 forWidgetWithIdentifier:(id)a4;
- (void)setLargestAvailableDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4;
- (void)setUserSpecifiedDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4;
- (void)setWidgetIDsToPendingTestCompletions:(id)a3;
- (void)setWidgetIDsToPendingTestTearDowns:(id)a3;
- (void)setWidgetSnapshotTimestampsEnabled:(BOOL)a3;
- (void)unregisterIdentifierForRefreshEvents:(id)a3;
- (void)widget:(id)a3 didChangeLargestAvailableDisplayMode:(int64_t)a4;
- (void)widget:(id)a3 didChangeUserSpecifiedDisplayMode:(int64_t)a4;
- (void)widget:(id)a3 didEncounterProblematicSnapshotAtURL:(id)a4;
- (void)widget:(id)a3 didRemoveSnapshotAtURL:(id)a4;
- (void)widgetDataSource:(id)a3 removeDatum:(id)a4;
- (void)widgetDataSource:(id)a3 replaceWithDatum:(id)a4;
- (void)widgetEditListViewController:(id)a3 traitCollectionDidChange:(id)a4;
- (void)widgetListEditViewController:(id)a3 acknowledgeInterfaceItemsWithIdentifiers:(id)a4;
- (void)widgetListEditViewController:(id)a3 didChangeWidgetsPinning:(BOOL)a4;
- (void)widgetListEditViewController:(id)a3 didReorderItemsWithIdentifiersInGroups:(id)a4;
- (void)widgetListEditViewController:(id)a3 requestsIconForItemWithIdentifier:(id)a4 withHandler:(id)a5;
- (void)widgetListEditViewController:(id)a3 setEnabled:(BOOL)a4 forItemsWithIdentifiers:(id)a5;
- (void)widgetListEditViewController:(id)a3 updateFavoritesToIdentifiers:(id)a4;
- (void)widgetViewControllerNeedsToBeRegisteredForRefreshNotification:(id)a3;
- (void)widgetViewControllerNeedsToBeUnregisteredForRefreshNotification:(id)a3;
@end

@implementation WGWidgetDiscoveryController

+ (int64_t)layoutModeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  int64_t v7 = 3;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    int64_t v7 = 1;
  }
  if (width <= height) {
    return 2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  }
  else {
    return v7;
  }
}

- (WGWidgetDiscoveryController)init
{
  v12.receiver = self;
  v12.super_class = (Class)WGWidgetDiscoveryController;
  v2 = [(WGWidgetDiscoveryController *)&v12 init];
  if (v2)
  {
    WGRegisterWidgetsLogging();
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    defaultEnabledIDs = v2->_defaultEnabledIDs;
    v2->_defaultEnabledIDs = v3;

    v5 = [[WGWidgetPersistentStateController alloc] initWithDiscoveryController:v2];
    persistentStateController = v2->_persistentStateController;
    v2->_persistentStateController = v5;

    int64_t v7 = [[WGWidgetStatsController alloc] initWithDiscoveryController:v2];
    statsController = v2->_statsController;
    v2->_statsController = v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__widgetViewControllerRequestsAdd_ name:@"WGWidgetViewControllerAddRequestNotification" object:0];
    [v9 addObserver:v2 selector:sel__widgetViewControllerDidRemoveSnapshot_ name:@"WGWidgetViewControllerDidRemoveSnapshotNotification" object:0];
    [v9 addObserver:v2 selector:sel__widgetListEditViewControllerWillDisappear_ name:@"WGWidgetListEditViewControllerWillDisappear" object:0];
    v10 = [MEMORY[0x263F087C8] defaultCenter];
    [v10 addObserver:v2 selector:sel__applicationIconChanged_ name:@"com.apple.LaunchServices.applicationIconChanged" object:0];
  }
  return v2;
}

- (unint64_t)visibleWidgetsCount
{
  v3 = [(WGWidgetDiscoveryController *)self _orderedVisibleIdentifiersForTodayGroup];
  uint64_t v4 = [v3 count];
  v5 = [(WGWidgetDiscoveryController *)self _orderedVisibleIdentifiersForWidgetGroup];
  unint64_t v6 = [v5 count] + v4;

  return v6;
}

- (void)setWidgetSnapshotTimestampsEnabled:(BOOL)a3
{
}

- (void)addDiscoveryObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      int64_t v7 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSPointerArray *)observers addPointer:v9];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)removeDiscoveryObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [(NSPointerArray *)self->_observers compact];
    if ([(NSPointerArray *)self->_observers count])
    {
      uint64_t v4 = 0;
      while ([(NSPointerArray *)self->_observers pointerAtIndex:v4] != v5)
      {
        if (++v4 >= [(NSPointerArray *)self->_observers count]) {
          goto LABEL_8;
        }
      }
      [(NSPointerArray *)self->_observers removePointerAtIndex:v4];
    }
  }
LABEL_8:
}

- (BOOL)_isApplicationLockedOutWithProxy:(id)a3
{
  return a3 && [a3 deviceManagementPolicy] != 0;
}

- (void)_updateLockedOutStateForWidget:(id)a3 withContainingAppProxy:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  BOOL v7 = [(WGWidgetDiscoveryController *)self _isApplicationLockedOutWithProxy:v6];
  if (v7)
  {
    v8 = (void *)MEMORY[0x263F52718];
    if (v6)
    {
      id v9 = [v6 localizedName];
      [v8 messageForApplicationName:v9 style:2];
    }
    else
    {
      id v9 = [v11 widgetIdentifier];
      [v8 messageForBundleIdentifier:v9 style:2];
    v10 = };
  }
  else
  {
    v10 = 0;
  }
  [v11 setLockedOut:v7 withExplanation:v10];
}

- (void)_updateLockedOutStateForWidget:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 widgetIdentifier];
  id v5 = WGContainingBundleProxyForWidgetWithBundleIdentifer((uint64_t)v4);

  if (v5)
  {
    id v6 = [v5 bundleType];
    if (([v6 isEqualToString:*MEMORY[0x263F01818]] & 1) != 0
      || ([v6 isEqualToString:*MEMORY[0x263F01838]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x263F01848]])
    {
      BOOL v7 = v5;
    }
    else
    {
      BOOL v7 = 0;
    }
    [(WGWidgetDiscoveryController *)self _updateLockedOutStateForWidget:v8 withContainingAppProxy:v7];
  }
}

- (id)_newWidgetWithIdentifier:(id)a3 delegate:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v6];
    if (v8)
    {
      id v9 = [(NSMutableDictionary *)self->_identifiersToWidgetInfos objectForKey:v6];
      if (v9)
      {
        v10 = [[WGWidgetHostingViewController alloc] initWithWidgetInfo:v9 delegate:v7 host:self];
        [(WGWidgetDiscoveryController *)self _updateLockedOutStateForWidget:v10];
      }
      else
      {
        objc_super v12 = WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543362;
          id v15 = v6;
          _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "Couldn't find widget info for widget with ID '%{public}@'", (uint8_t *)&v14, 0xCu);
        }
        v10 = 0;
      }
    }
    else
    {
      id v11 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v6;
        _os_log_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find widget datum for widget with ID '%{public}@'", (uint8_t *)&v14, 0xCu);
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)widgetWithIdentifier:(id)a3 delegate:(id)a4 forRequesterWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
    -[WGWidgetDiscoveryController widgetWithIdentifier:delegate:forRequesterWithIdentifier:]();
  }
  if ([v8 length] && objc_msgSend(v10, "length"))
  {
    widgetIDsToWidgets = self->_widgetIDsToWidgets;
    if (!widgetIDsToWidgets)
    {
      objc_super v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v13 = self->_widgetIDsToWidgets;
      self->_widgetIDsToWidgets = v12;

      widgetIDsToWidgets = self->_widgetIDsToWidgets;
    }
    id v14 = [(NSMutableDictionary *)widgetIDsToWidgets objectForKey:v8];
    if (!v14)
    {
      id v14 = [(WGWidgetDiscoveryController *)self _newWidgetWithIdentifier:v8 delegate:v9];
      if (v14) {
        [(NSMutableDictionary *)self->_widgetIDsToWidgets setObject:v14 forKey:v8];
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_orderedEnabledIdentifiersForGroup:(id)a3
{
  int v4 = [a3 isEqual:@"WidgetGroup"];
  uint64_t v5 = 64;
  if (v4) {
    uint64_t v5 = 80;
  }
  id v6 = *(Class *)((char *)&self->super.isa + v5);
  return v6;
}

- (id)_orderedVisibleIdentifiersForTodayGroup
{
  orderedVisibleTodayIdentifiers = self->_orderedVisibleTodayIdentifiers;
  if (!orderedVisibleTodayIdentifiers)
  {
    int v4 = [(WGWidgetDiscoveryController *)self _orderedEnabledIdentifiersForGroup:@"TodayGroup"];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__WGWidgetDiscoveryController__orderedVisibleIdentifiersForTodayGroup__block_invoke;
    v9[3] = &unk_264676878;
    v9[4] = self;
    uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:v9];
    id v6 = [v4 filteredArrayUsingPredicate:v5];
    id v7 = self->_orderedVisibleTodayIdentifiers;
    self->_orderedVisibleTodayIdentifiers = v6;

    orderedVisibleTodayIdentifiers = self->_orderedVisibleTodayIdentifiers;
  }
  return orderedVisibleTodayIdentifiers;
}

uint64_t __70__WGWidgetDiscoveryController__orderedVisibleIdentifiersForTodayGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) doesWidgetWithIdentifierHaveContent:a2];
}

- (id)_orderedVisibleIdentifiersForWidgetGroup
{
  orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
  if (!orderedVisibleWidgetsIdentifiers)
  {
    int v4 = [(WGWidgetDiscoveryController *)self _orderedEnabledIdentifiersForGroup:@"WidgetGroup"];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__WGWidgetDiscoveryController__orderedVisibleIdentifiersForWidgetGroup__block_invoke;
    v9[3] = &unk_264676878;
    v9[4] = self;
    uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:v9];
    id v6 = [v4 filteredArrayUsingPredicate:v5];
    id v7 = self->_orderedVisibleWidgetsIdentifiers;
    self->_orderedVisibleWidgetsIdentifiers = v6;

    orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
  }
  return orderedVisibleWidgetsIdentifiers;
}

uint64_t __71__WGWidgetDiscoveryController__orderedVisibleIdentifiersForWidgetGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) doesWidgetWithIdentifierHaveContent:a2];
}

- (void)invalidateVisibleIdentifiers
{
  [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:@"TodayGroup"];
  [(WGWidgetDiscoveryController *)self _notifyObserversOfSignificantWidgetsChange];
}

- (void)_invalidateVisibleIdentifiersForGroup:(id)a3
{
  id v6 = a3;
  if ([v6 isEqual:@"TodayGroup"])
  {
    uint64_t v4 = 72;
  }
  else
  {
    if (![v6 isEqual:@"WidgetGroup"]) {
      goto LABEL_6;
    }
    uint64_t v4 = 88;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);
  *(Class *)((char *)&self->super.isa + v4) = 0;

LABEL_6:
}

- (id)_orderedVisibleIdentifiersForGroup:(id)a3
{
  if ([a3 isEqual:@"WidgetGroup"]) {
    [(WGWidgetDiscoveryController *)self _orderedVisibleIdentifiersForWidgetGroup];
  }
  else {
  uint64_t v4 = [(WGWidgetDiscoveryController *)self _orderedVisibleIdentifiersForTodayGroup];
  }
  return v4;
}

- (id)_disabledIdentifiers
{
  v3 = [(NSMutableDictionary *)self->_identifiersToDatums allKeys];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__WGWidgetDiscoveryController__disabledIdentifiers__block_invoke;
  v7[3] = &unk_264676878;
  v7[4] = self;
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:v7];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

uint64_t __51__WGWidgetDiscoveryController__disabledIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isElementWithIdentifierEnabled:a2] ^ 1;
}

- (id)_orderedEnabledWidgetIdentifiersForGroup:(id)a3 includingNoContent:(BOOL)a4
{
  if (a4) {
    [(WGWidgetDiscoveryController *)self _orderedEnabledIdentifiersForGroup:a3];
  }
  else {
  uint64_t v4 = [(WGWidgetDiscoveryController *)self _orderedVisibleIdentifiersForGroup:a3];
  }
  return v4;
}

- (id)visibleWidgetIdentifiersForGroup:(id)a3
{
  return [(WGWidgetDiscoveryController *)self _orderedEnabledWidgetIdentifiersForGroup:a3 includingNoContent:0];
}

- (id)enabledWidgetIdentifiersForAllGroups
{
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(WGWidgetDiscoveryController *)self _orderedEnabledIdentifiersForGroup:@"TodayGroup"];
  if (v4) {
    [v3 addObjectsFromArray:v4];
  }
  uint64_t v5 = [(WGWidgetDiscoveryController *)self _orderedEnabledIdentifiersForGroup:@"WidgetGroup"];
  if (v5) {
    [v3 addObjectsFromArray:v5];
  }

  return v3;
}

- (void)setHasContent:(BOOL)a3 forWidgetWithIdentifier:(id)a4
{
  id v8 = a4;
  if ([v8 length])
  {
    if (!a3)
    {
      id v6 = [(NSMutableDictionary *)self->_widgetIDsToWidgets objectForKey:v8];
      [v6 invalidateCachedSnapshotWithCompletionHandler:0];
    }
    id v7 = [(WGWidgetDiscoveryController *)self _updatePublicationStateOfDatumWithIdentifier:v8 visibilityChanged:0 contentStateChanged:1 insertAtTop:0 notifyingObservers:1];
  }
}

- (int64_t)userSpecifiedDisplayModeForWidgetWithIdentifier:(id)a3
{
  return WGTodayViewArchiveGetDisplayModeForIdentifier(self->_archive, a3);
}

- (void)setUserSpecifiedDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4
{
}

- (int64_t)largestAvailableDisplayModeForWidgetWithIdentifier:(id)a3
{
  return [(WGWidgetPersistentStateController *)self->_persistentStateController largestAvailableDisplayModeForWidgetWithIdentifier:a3];
}

- (void)setLargestAvailableDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4
{
}

- (void)_externalSourceRequestsInsertionOfWidgetWithIdentifier:(id)a3 insertAtTop:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([v8 length])
  {
    id v6 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v8];

    if (v6)
    {
      id v7 = [(WGWidgetDiscoveryController *)self _updatePublicationStateOfDatumWithIdentifier:v8 visibilityChanged:[(WGWidgetDiscoveryController *)self _setEnabled:1 forElementWithIdentifier:v8] contentStateChanged:0 insertAtTop:v4 notifyingObservers:1];
      if (!v7)
      {
        id v7 = [(WGWidgetDiscoveryController *)self _defaultGroupForWidgetWithIdentifier:v8];
      }
      WGTodayViewArchiveSetKnownForIdentifier(self->_archive, v8, 0);
      WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, self->_orderedEnabledTodayIdentifiers, v7, self->_archiveWriteQueue);
    }
  }
}

- (void)_widgetViewControllerRequestsAdd:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"WGWidgetViewControllerAddRequestBundleIdentifierKey"];

  [(WGWidgetDiscoveryController *)self _externalSourceRequestsInsertionOfWidgetWithIdentifier:v5 insertAtTop:0];
}

- (void)_widget:(id)a3 withIdentifier:(id)a4 didRemoveSnapshotAtURL:(id)a5
{
  id v11 = a5;
  widgetIDsToWidgets = self->_widgetIDsToWidgets;
  id v9 = a3;
  id v10 = [(NSMutableDictionary *)widgetIDsToWidgets objectForKey:a4];

  if (v10 != v9) {
    [v10 invalidateCachedSnapshotWithURL:v11 completionHandler:0];
  }
}

- (void)_widgetViewControllerDidRemoveSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v8 = [v5 objectForKey:@"WGWidgetViewControllerRemovedSnapshotWidgetIdentifierKey"];

  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"WGWidgetViewControllerRemovedSnapshotURLKey"];

  [(WGWidgetDiscoveryController *)self _widget:0 withIdentifier:v8 didRemoveSnapshotAtURL:v7];
}

- (void)_widgetListEditViewControllerWillDisappear:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke;
  v15[3] = &unk_2646766F8;
  objc_copyWeak(&v16, &location);
  id v5 = (void *)MEMORY[0x223CAA850](v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained transitionCoordinator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_2;
    v13[3] = &unk_2646768A0;
    id v14 = v5;
    [v8 animateAlongsideTransition:v13 completion:0];
    id v9 = &v14;
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_3;
    v11[3] = &unk_2646768C8;
    id v12 = v5;
    [v10 animateWithDuration:v11 animations:0.35];
    id v9 = &v12;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _presentedEditViewControllerStatusBarAssertion];
  [WeakRetained _invalidateWidgetListEditViewControllerStatusBarAssertion:v1];

  [WeakRetained _setPresentedEditViewControllerStatusBarAssertion:0];
}

uint64_t __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_applicationIconChanged:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"CFBundleIdentifier"];

  if (v5)
  {
    id v14 = v5;
    id v6 = WGPlugInBundleIdentifiersForContainingBundleIdentifier(v5);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = WGLogWidgets;
          if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v11;
            _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "Widget icon changed for bundle ID: %{public}@)", buf, 0xCu);
          }
          v13 = [(NSMutableDictionary *)self->_identifiersToWidgetInfos objectForKey:v11];
          [v13 _resetIcons];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }

    id v5 = v14;
  }
}

- (BOOL)areWidgetsPinned
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained areWidgetsPinnedForWidgetDiscoveryController:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)alwaysShowsFavoriteWidgets
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WGAlwaysShowFavorites"];

  return v3;
}

- (int)_nextSequenceNumber
{
  return _nextSequenceNumber___sequenceNumber;
}

- (void)handleWidgetLaunchRecommendation:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v17 = a4;
  uint64_t v7 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_222E49000, v7, OS_LOG_TYPE_DEFAULT, "Handling recommendation to update widgets with bundle IDs: %{public}@)", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v8 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v9 = self->_statsController;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v14 = [(WGWidgetDiscoveryController *)self widgetWithIdentifier:v13 delegate:0 forRequesterWithIdentifier:@"Duet"];
        if (v14)
        {
          dispatch_group_enter(v8);
          int v15 = [(WGWidgetDiscoveryController *)self _nextSequenceNumber];
          [(WGWidgetStatsController *)v9 notePreWarmHasStarted:v13 withTriggerType:1 withSequence:v15];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke;
          v22[3] = &unk_2646768F0;
          v22[4] = v13;
          p_long long buf = &buf;
          v23 = v9;
          int v26 = v15;
          v24 = v8;
          [v14 _updateWidgetWithCompletionHandler:v22];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke_72;
  block[3] = &unk_264676918;
  id v20 = v17;
  v21 = &buf;
  id v16 = v17;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(&buf, 8);
}

void __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"is not";
    *(_DWORD *)uint64_t v9 = 138543874;
    if (a3) {
      uint64_t v8 = @"is";
    }
    *(void *)&v9[4] = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    _os_log_impl(&dword_222E49000, v6, OS_LOG_TYPE_DEFAULT, "Widget with ID '%{public}@' did update with result %ld, %{public}@ implemented", v9, 0x20u);
  }
  if (!a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
  }
  objc_msgSend(*(id *)(a1 + 40), "notePreWarmHasEnded:withResult:withTriggerType:withSequence:", *(void *)(a1 + 32), a2, 1, *(int *)(a1 + 64), *(void *)v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke_72(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_222E49000, v2, OS_LOG_TYPE_DEFAULT, "Informing Duet of updated widget bundle IDs: %{public}@)", (uint8_t *)&v6, 0xCu);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allObjects];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)requestRefreshForWidget:(id)a3 afterDate:(id)a4
{
}

- (void)_dataSourcesDidChange:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  int v6 = (void *)[(NSMutableDictionary *)self->_identifiersToDataSources mutableCopy];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v13 = [v12 dataSourceIdentifier];
        uint64_t v14 = [(NSMutableDictionary *)self->_identifiersToDataSources objectForKey:v13];
        int v15 = v14;
        if (v14)
        {
          if (([v14 isEqual:v12] & 1) == 0) {
            [v5 addObject:v12];
          }
        }
        else
        {
          [v5 addObject:v12];
          [v6 removeObjectForKey:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v9);
  }
  v34 = v7;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v22 = [v16 objectForKey:v21];
        [(NSMutableDictionary *)self->_identifiersToDataSources removeObjectForKey:v21];
        [(NSMutableDictionary *)self->_dataSourceIdentifiersToDatumIdentifiers removeObjectForKey:v21];
        [v22 removeWidgetObserver:self completion:0];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v18);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        identifiersToDataSources = self->_identifiersToDataSources;
        long long v30 = [v28 dataSourceIdentifier];
        [(NSMutableDictionary *)identifiersToDataSources setObject:v28 forKey:v30];

        dataSourceIdentifiersToDatumIdentifiers = self->_dataSourceIdentifiersToDatumIdentifiers;
        v32 = [MEMORY[0x263EFF980] array];
        uint64_t v33 = [v28 dataSourceIdentifier];
        [(NSMutableDictionary *)dataSourceIdentifiersToDatumIdentifiers setObject:v32 forKey:v33];

        [v28 addWidgetObserver:self completion:0];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v25);
  }
}

- (void)_beginObservingDataSourcesIfNecessary
{
  if (!self->_archive)
  {
    uint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.widgets.todayviewarchive.diskwritequeue", 0);
    archiveWriteQueue = self->_archiveWriteQueue;
    self->_archiveWriteQueue = v3;

    WGTodayViewArchiveGetArchive(self->_defaultEnabledIDs, self->_archiveWriteQueue);
    id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    archive = self->_archive;
    self->_archive = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifiersToDataSources = self->_identifiersToDataSources;
    self->_identifiersToDataSources = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataSourceIdentifiersToDatumIdentifiers = self->_dataSourceIdentifiersToDatumIdentifiers;
    self->_dataSourceIdentifiersToDatumIdentifiers = v9;

    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifiersToDatums = self->_identifiersToDatums;
    self->_identifiersToDatums = v11;

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifiersToWidgetInfos = self->_identifiersToWidgetInfos;
    self->_identifiersToWidgetInfos = v13;

    int v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
    self->_orderedEnabledTodayIdentifiers = v15;

    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    orderedEnabledWidgetsIdentifiers = self->_orderedEnabledWidgetsIdentifiers;
    self->_orderedEnabledWidgetsIdentifiers = v17;

    objc_initWeak(&location, self);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke;
    id v23 = &unk_264676968;
    objc_copyWeak(&v24, &location);
    +[WGDataSourceManager requestSharedDataSourceManager:&v20];
    uint64_t v19 = objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", v20, v21, v22, v23);
    [v19 addObserver:self];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke_2;
  v4[3] = &unk_264676940;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  [v3 addWidgetDataSourceChangeHandler:v4 forIdentifier:@"com.apple.widgets.widgetdiscoverycontroller.datasourcemanagerchangehandler"];
  objc_destroyWeak(&v5);
}

void __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dataSourcesDidChange:v3];
}

- (void)beginDiscovery
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    self->_shouldPurgeNonCAMLSnapshots = [WeakRetained didPurgeNonCAMLSnapshotsForWidgetDiscoveryController:self] ^ 1;
  }
  if _WGSupportsASTC() && (objc_opt_respondsToSelector()) {
    self->_shouldPurgeNonASTCSnapshots = [WeakRetained didPurgeNonASTCSnapshotsForWidgetDiscoveryController:self] ^ 1;
  }
  [(WGWidgetDiscoveryController *)self _beginObservingDataSourcesIfNecessary];
}

- (BOOL)_isElementWithIdentifierEnabled:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v4];
    int v6 = [v5 representedExtension];
    id v7 = v6;
    if (v6) {
      char v8 = [v6 optedIn];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_setEnabled:(BOOL)a3 forElementWithIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    BOOL v7 = [(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:v6];
    char v8 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v6];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v8 representedExtension], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      LOBYTE(v17) = 0;
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v10 = v9;
    int v11 = [v9 optedIn];
    if (v4)
    {
      if ((v11 & 1) == 0)
      {
        id v21 = 0;
        [v10 attemptOptIn:&v21];
        id v12 = v21;
        if (!v12) {
          goto LABEL_16;
        }
        uint64_t v13 = (void *)WGLogWidgets;
        if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        uint64_t v14 = v13;
        int v15 = [v10 identifier];
        *(_DWORD *)long long buf = 138543618;
        id v23 = v15;
        __int16 v24 = 2114;
        id v25 = v12;
        id v16 = "Encountered error attempting to opt in extension with ID '%{public}@': %{public}@";
LABEL_15:
        _os_log_impl(&dword_222E49000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

LABEL_16:
      }
    }
    else if (v11)
    {
      id v20 = 0;
      [v10 attemptOptOut:&v20];
      id v12 = v20;
      if (!v12) {
        goto LABEL_16;
      }
      uint64_t v18 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v14 = v18;
      int v15 = [v10 identifier];
      *(_DWORD *)long long buf = 138543618;
      id v23 = v15;
      __int16 v24 = 2114;
      id v25 = v12;
      id v16 = "Encountered error attempting to opt out extension with ID '%{public}@': %{public}@";
      goto LABEL_15;
    }
    int v17 = v7 ^ [(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:v6];

    goto LABEL_18;
  }
  LOBYTE(v17) = 0;
LABEL_19:

  return v17;
}

- (BOOL)_isElementWithIdentifierKnown:(id)a3
{
  id v4 = a3;
  if (WGTodayViewArchiveGetKnownForIdentifier(self->_archive, v4)) {
    char v5 = 1;
  }
  else {
    char v5 = WGIsWidgetWithBundleIdentifierInternal((uint64_t)v4);
  }

  return v5;
}

- (BOOL)_isElementWithIdentifierFavorited:(id)a3
{
  archive = self->_archive;
  id v4 = a3;
  char v5 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(archive, @"FavoriteGroup");
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_calculateAndPostNewWidgetsCount
{
  id v3 = [(NSMutableDictionary *)self->_identifiersToDatums allValues];
  if (self->_newWidgetsCountPostQueue
    || (id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notificationcenter.newwidgetscountpostqueue", 0),
        char v5 = self->_newWidgetsCountPostQueue,
        self->_newWidgetsCountPostQueue = v4,
        v5,
        self->_newWidgetsCountPostQueue))
  {
    objc_initWeak(&location, self);
    newWidgetsCountPostQueue = self->_newWidgetsCountPostQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke;
    block[3] = &unk_2646769E0;
    id v8 = v3;
    objc_copyWeak(&v9, &location);
    dispatch_async(newWidgetsCountPostQueue, block);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
}

void __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v19;
    char v6 = MEMORY[0x263EF83A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = 0;
        int v15 = &v14;
        uint64_t v16 = 0x2020000000;
        char v17 = 0;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_2;
        block[3] = &unk_264676990;
        objc_copyWeak(&v13, (id *)(a1 + 40));
        void block[4] = v8;
        block[5] = &v14;
        dispatch_sync(v6, block);
        v4 += *((unsigned __int8 *)v15 + 24);
        objc_destroyWeak(&v13);
        _Block_object_dispose(&v14, 8);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_3;
  v10[3] = &unk_2646769B8;
  v11[1] = v4;
  objc_copyWeak(v11, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], v10);
  objc_destroyWeak(v11);
}

void __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [*(id *)(a1 + 32) datumIdentifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _isElementWithIdentifierKnown:v2] ^ 1;
}

void __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  char v6 = @"WGNewWidgetsCountKey";
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 postNotificationName:@"WGAvailableWidgetsUpdatedNotification" object:WeakRetained userInfo:v3];
}

- (void)_notifyObserversOfVisibilityChange:(BOOL)a3 ofWidgetWithIdentifier:(id)a4 inGroup:(id)a5
{
  BOOL v6 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v8 = a5;
  [(NSPointerArray *)self->_observers compact];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_observers;
  uint64_t v10 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (v6)
        {
          if (objc_opt_respondsToSelector()) {
            [v14 widgetDiscoveryController:self widgetWithIdentifier:v15 shouldBecomeVisibleInGroup:v8];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          [v14 widgetDiscoveryController:self widgetWithIdentifier:v15 shouldBecomeHiddenInGroup:v8];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)_notifyObserversOfSignificantWidgetsChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(NSPointerArray *)self->_observers compact];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "widgetDiscoveryControllerSignificantWidgetsChange:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversOfOrderChangeForWidgetIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSPointerArray *)self->_observers compact];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "widgetDiscoveryController:orderDidChangeForWidgetIdentifiers:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_groupForWidgetWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = @"TodayGroup";
    uint64_t v6 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"TodayGroup");
    char v7 = [v6 containsObject:v4];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"WidgetGroup");
      int v9 = [v8 containsObject:v4];

      if (v9) {
        uint64_t v5 = @"WidgetGroup";
      }
      else {
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_defaultGroupForWidgetWithIdentifier:(id)a3
{
  return @"TodayGroup";
}

- (id)_insertWidgetWithIdentifier:(id)a3 atTop:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    char v7 = [(WGWidgetDiscoveryController *)self _groupForWidgetWithIdentifier:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(WGWidgetDiscoveryController *)self _defaultGroupForWidgetWithIdentifier:v6];
    }
    long long v10 = v9;

    long long v11 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, v10);
    long long v12 = [(WGWidgetDiscoveryController *)self _orderedEnabledIdentifiersForGroup:v10];
    [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:v10];
    if (v4)
    {
      [v12 insertObject:v6 atIndex:0];
    }
    else
    {
      [v12 addObject:v6];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__WGWidgetDiscoveryController__insertWidgetWithIdentifier_atTop___block_invoke;
      v14[3] = &unk_264676A08;
      v14[4] = self;
      id v15 = v11;
      [v12 sortWithOptions:16 usingComparator:v14];
    }
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

uint64_t __65__WGWidgetDiscoveryController__insertWidgetWithIdentifier_atTop___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 40);
  id v6 = a3;
  char v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v6];

  id v9 = *(id *)(a1 + 40);
  long long v10 = [v7 datumIdentifier];
  unint64_t v11 = [v9 indexOfObject:v10];

  long long v12 = [v8 datumIdentifier];
  unint64_t v13 = [v9 indexOfObject:v12];

  if (v11 < v13) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = v11 > v13;
  }

  return v14;
}

- (void)_removeWidgetWithIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    [(NSMutableArray *)self->_orderedEnabledTodayIdentifiers removeObject:v5];
    [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:@"TodayGroup"];
    [(NSMutableArray *)self->_orderedEnabledWidgetsIdentifiers removeObject:v5];
    [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:@"WidgetGroup"];
    orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
    self->_orderedVisibleWidgetsIdentifiers = 0;
  }
}

- (id)_updatePublicationStateOfDatumWithIdentifier:(id)a3 visibilityChanged:(BOOL)a4 contentStateChanged:(BOOL)a5 insertAtTop:(BOOL)a6 notifyingObservers:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  unint64_t v13 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138544386;
    id v23 = v12;
    __int16 v24 = 1024;
    BOOL v25 = v10;
    __int16 v26 = 1024;
    BOOL v27 = v9;
    __int16 v28 = 1024;
    BOOL v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl(&dword_222E49000, v13, OS_LOG_TYPE_DEFAULT, "Will update publication state of %{public}@ visibilityChanged: %d contentStateChanged: %d insertAtTop: %d notifyingObservers: %d", (uint8_t *)&v22, 0x24u);
  }
  if (![v12 length])
  {
    uint64_t v14 = 0;
    goto LABEL_25;
  }
  if (v10 || v9)
  {
    id v15 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v12];
    if (v15) {
      BOOL v16 = [(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:v12];
    }
    else {
      BOOL v16 = 0;
    }

    BOOL v17 = [(WGWidgetPersistentStateController *)self->_persistentStateController doesWidgetWithIdentifierHaveContent:v12];
    uint64_t v14 = [(WGWidgetDiscoveryController *)self _groupForWidgetWithIdentifier:v12];
    long long v18 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543874;
      id v23 = v12;
      __int16 v24 = 1024;
      BOOL v25 = v16;
      __int16 v26 = 1024;
      BOOL v27 = v17;
      _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, "Publication state of %{public}@ isVisible: %d hasContent: %d", (uint8_t *)&v22, 0x18u);
      if (!v9)
      {
LABEL_13:
        if (!v10) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
    else if (!v9)
    {
      goto LABEL_13;
    }
    long long v19 = [(WGWidgetDiscoveryController *)self _groupForWidgetWithIdentifier:v12];
    [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:v19];

    if (!v10)
    {
LABEL_14:
      if (!v7) {
        goto LABEL_24;
      }
LABEL_15:
      if (v10 && v17 || v16 && v9) {
        [(WGWidgetDiscoveryController *)self _notifyObserversOfVisibilityChange:v16 & v17 ofWidgetWithIdentifier:v12 inGroup:v14];
      }
      goto LABEL_24;
    }
LABEL_20:
    if (v16)
    {
      uint64_t v20 = [(WGWidgetDiscoveryController *)self _insertWidgetWithIdentifier:v12 atTop:v8];

      uint64_t v14 = (void *)v20;
      if (!v7) {
        goto LABEL_24;
      }
    }
    else
    {
      [(WGWidgetDiscoveryController *)self _removeWidgetWithIdentifier:v12];
      if (!v7) {
        goto LABEL_24;
      }
    }
    goto LABEL_15;
  }
  uint64_t v14 = 0;
LABEL_24:
  [(WGWidgetDiscoveryController *)self _calculateAndPostNewWidgetsCount];
LABEL_25:

  return v14;
}

- (void)presentWidgetListEditViewControllerFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  unint64_t v11 = WeakRetained;
  if (v8 && (objc_msgSend(WeakRetained, "wg_isAppearanceTransitioning") & 1) == 0)
  {
    objc_initWeak(&location, self);
    if (v11)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke;
      v19[3] = &unk_264676A30;
      id v12 = &v22;
      objc_copyWeak(&v22, &location);
      id v20 = v8;
      BOOL v23 = a4;
      id v21 = v9;
      [(WGWidgetDiscoveryController *)self dismissWidgetListEditViewControllerAnimated:1 completion:v19];

      unint64_t v13 = v20;
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_2;
      v14[3] = &unk_264676A80;
      id v12 = &v17;
      objc_copyWeak(&v17, &location);
      id v15 = v8;
      BOOL v18 = a4;
      id v16 = v9;
      [(WGWidgetDiscoveryController *)self _requestUnlockWithCompletion:v14];

      unint64_t v13 = v15;
    }

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained presentWidgetListEditViewControllerFromViewController:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

void __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    BOOL v4 = (void *)[WeakRetained _newWidgetListEditViewController];
    [v4 setDelegate:WeakRetained];
    [WeakRetained _setPresentedEditViewController:v4];
    id v5 = [WeakRetained _preferredViewControllerForPresentingFromViewController:*(void *)(a1 + 32)];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    id v11[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_3;
    v11[3] = &unk_2646768C8;
    id v12 = *(id *)(a1 + 40);
    [v5 presentViewController:v4 animated:v6 completion:v11];

    BOOL v7 = [v4 transitionCoordinator];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_4;
    v10[3] = &unk_264676A58;
    void v10[4] = WeakRetained;
    [v7 animateAlongsideTransition:v10 completion:0];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

uint64_t __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[v1 _newWidgetListEditViewControllerStatusBarAssertion];
  [v1 _setPresentedEditViewControllerStatusBarAssertion:v2];
}

- (void)dismissWidgetListEditViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __86__WGWidgetDiscoveryController_dismissWidgetListEditViewControllerAnimated_completion___block_invoke;
    v8[3] = &unk_264676AA8;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    [WeakRetained dismissViewControllerAnimated:v4 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __86__WGWidgetDiscoveryController_dismissWidgetListEditViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setPresentedEditViewController:0];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_newWidgetListEditViewController
{
  uint64_t v3 = objc_alloc_init(WGWidgetListEditViewController);
  [(WGWidgetListEditViewController *)v3 setModalPresentationStyle:5];
  [(WGWidgetListEditViewController *)v3 setDataSource:self];
  return v3;
}

- (id)_newWidgetListEditViewControllerStatusBarAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = objc_msgSend(WeakRetained, "statusBarAssertionForWidgetDiscoveryController:legibilityStyle:", self, -[WGWidgetDiscoveryController _widgetListEditViewControllerStatusBarLegibilityStyle](self, "_widgetListEditViewControllerStatusBarLegibilityStyle"));
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)_widgetListEditViewControllerStatusBarLegibilityStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  uint64_t v3 = [WeakRetained traitCollection];

  if ([v3 userInterfaceStyle] == 2) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = 2;
  }

  return v4;
}

- (void)_invalidateWidgetListEditViewControllerStatusBarAssertion:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widgetDiscoveryController:self didEndUsingStatusBarAssertion:v5];
  }
}

- (id)_preferredViewControllerForPresentingFromViewController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = v4;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained widgetDiscoveryController:self preferredViewControllerForPresentingFromViewController:v4];
  }
  return v6;
}

- (void)_requestUnlockWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained widgetDiscoveryController:self requestUnlockWithCompletion:v5];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (void)dismissWidgetListEditViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);

  if (WeakRetained != v12)
  {
    unint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WGWidgetDiscoveryController.m", 807, @"Unknown edit view controller (%@) requesting dismissal", v12 object file lineNumber description];
  }
  [(WGWidgetDiscoveryController *)self dismissWidgetListEditViewControllerAnimated:v6 completion:v9];
}

- (void)widgetEditListViewController:(id)a3 traitCollectionDidChange:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  uint64_t v9 = [v6 userInterfaceStyle];
  if (v9 != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      int64_t v10 = [(WGWidgetDiscoveryController *)self _widgetListEditViewControllerStatusBarLegibilityStyle];
      unint64_t v11 = [(WGWidgetDiscoveryController *)self _presentedEditViewControllerStatusBarAssertion];
      [WeakRetained widgetDiscoveryController:self updateStatusBarAssertion:v11 withLegibilityStyle:v10];
    }
  }
}

- (void)widgetDataSource:(id)a3 replaceWithDatum:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    int64_t v10 = [v7 datumIdentifier];
    unint64_t v11 = [v7 representedExtension];
    id v12 = [v11 _plugIn];
    unint64_t v13 = [v12 uuid];
    int v31 = 138543874;
    id v32 = v6;
    __int16 v33 = 2114;
    v34 = v10;
    __int16 v35 = 2114;
    long long v36 = v13;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "Widget data source %{public}@ asking to replace with datum with ID '%{public}@ (%{public}@)'", (uint8_t *)&v31, 0x20u);
  }
  identifiersToDataSources = self->_identifiersToDataSources;
  id v15 = [v6 dataSourceIdentifier];
  id v16 = [(NSMutableDictionary *)identifiersToDataSources objectForKey:v15];

  if (v16)
  {
    id v17 = [v7 datumIdentifier];
    BOOL v18 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v17];

    [(NSMutableDictionary *)self->_identifiersToDatums setObject:v7 forKey:v17];
    uint64_t v19 = [(NSMutableDictionary *)self->_identifiersToWidgetInfos objectForKey:v17];
    if (v19)
    {
      id v20 = (void *)v19;
      id v21 = [v7 representedExtension];
      id v22 = [v20 widgetInfoWithExtension:v21];
    }
    else
    {
      id v21 = [v7 representedExtension];
      id v22 = +[WGWidgetInfo widgetInfoWithExtension:v21];
    }

    if (v22)
    {
      [(NSMutableDictionary *)self->_identifiersToWidgetInfos setObject:v22 forKey:v17];
    }
    else if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
    {
      -[WGWidgetDiscoveryController widgetDataSource:replaceWithDatum:]();
    }
    dataSourceIdentifiersToDatumIdentifiers = self->_dataSourceIdentifiersToDatumIdentifiers;
    BOOL v25 = [v6 dataSourceIdentifier];
    __int16 v26 = [(NSMutableDictionary *)dataSourceIdentifiersToDatumIdentifiers objectForKey:v25];
    [v26 addObject:v17];

    if (WGIsWidgetWithBundleIdentifierInternal((uint64_t)v17)) {
      WGTodayViewArchiveSetKnownForIdentifier(self->_archive, v17, self->_archiveWriteQueue);
    }
    if (!v18
      && (WGTodayViewArchiveGetPenalizedForIdentifier(self->_archive, v17) & 1) == 0
      && !WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v17, @"10.0"))
    {
      WGTodayViewArchiveRemoveFromOrderedIdentifiers(self->_archive, v17, 0);
      WGTodayViewArchiveSetPenalizedForIdentifier(self->_archive, v17, 0);
    }
    int v27 = [(NSMutableSet *)self->_defaultEnabledIDs containsObject:v17];
    if (v27) {
      [(NSMutableSet *)self->_defaultEnabledIDs removeObject:v17];
    }
    uint64_t v28 = [(WGWidgetDiscoveryController *)self _setEnabled:v27 | [(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:v17] forElementWithIdentifier:v17];
    if (v18)
    {
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v28 = [(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:v17] | v28;
      uint64_t v29 = WGIsWidgetWithBundleIdentifierWantsTop(v17);
    }
    id v30 = [(WGWidgetDiscoveryController *)self _updatePublicationStateOfDatumWithIdentifier:v17 visibilityChanged:v28 contentStateChanged:0 insertAtTop:v29 notifyingObservers:1];
  }
  else
  {
    BOOL v23 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetDiscoveryController widgetDataSource:replaceWithDatum:](v23, v6);
    }
  }
}

- (void)widgetDataSource:(id)a3 removeDatum:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    int64_t v10 = [v7 datumIdentifier];
    unint64_t v11 = [v7 representedExtension];
    id v12 = [v11 _plugIn];
    unint64_t v13 = [v12 uuid];
    int v24 = 138543874;
    id v25 = v6;
    __int16 v26 = 2114;
    int v27 = v10;
    __int16 v28 = 2114;
    uint64_t v29 = v13;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "Widget data source %{public}@ asking to remove datum with ID '%{public}@ (%{public}@)'", (uint8_t *)&v24, 0x20u);
  }
  identifiersToDataSources = self->_identifiersToDataSources;
  id v15 = [v6 dataSourceIdentifier];
  id v16 = [(NSMutableDictionary *)identifiersToDataSources objectForKey:v15];

  if (!v16)
  {
    id v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetDiscoveryController widgetDataSource:removeDatum:](v17, v6);
    }
  }
  BOOL v18 = [v7 datumIdentifier];
  uint64_t v19 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v18];
  if (v19)
  {
    if ([(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:v18]) {
      BOOL v20 = [(WGWidgetPersistentStateController *)self->_persistentStateController doesWidgetWithIdentifierHaveContent:v18];
    }
    else {
      BOOL v20 = 0;
    }
    [(NSMutableDictionary *)self->_identifiersToDatums removeObjectForKey:v18];
    [(NSMutableDictionary *)self->_identifiersToWidgetInfos removeObjectForKey:v18];
    id v21 = [v6 dataSourceIdentifier];
    id v22 = [(NSMutableDictionary *)self->_dataSourceIdentifiersToDatumIdentifiers objectForKey:v21];
    [v22 removeObject:v18];
    [(NSMutableDictionary *)self->_widgetIDsToWidgets removeObjectForKey:v18];
    id v23 = [(WGWidgetDiscoveryController *)self _updatePublicationStateOfDatumWithIdentifier:v18 visibilityChanged:1 contentStateChanged:0 insertAtTop:0 notifyingObservers:v20];
  }
  else if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
  {
    -[WGWidgetDiscoveryController widgetDataSource:removeDatum:]();
  }
}

- (int64_t)userSpecifiedDisplayModeForWidget:(id)a3
{
  id v4 = a3;
  id v5 = [v4 widgetInfo];
  if ([v5 isLinkedOnOrAfterSystemVersion:@"10.0"])
  {
    id v6 = [v4 widgetIdentifier];
    int64_t v7 = [(WGWidgetDiscoveryController *)self userSpecifiedDisplayModeForWidgetWithIdentifier:v6];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (void)widget:(id)a3 didChangeUserSpecifiedDisplayMode:(int64_t)a4
{
  id v9 = a3;
  if (-[WGWidgetDiscoveryController userSpecifiedDisplayModeForWidget:](self, "userSpecifiedDisplayModeForWidget:") != a4)
  {
    id v6 = [v9 widgetIdentifier];
    [(WGWidgetDiscoveryController *)self setUserSpecifiedDisplayMode:a4 forWidgetWithIdentifier:v6];

    int64_t v7 = +[WGWidgetEventTracker sharedInstance];
    uint64_t v8 = [v9 widgetIdentifier];
    [v7 widget:v8 didChangeUserSpecifiedDisplayMode:a4];
  }
}

- (int64_t)largestAvailableDisplayModeForWidget:(id)a3
{
  id v4 = a3;
  id v5 = [v4 widgetInfo];
  if ([v5 isLinkedOnOrAfterSystemVersion:@"10.0"])
  {
    id v6 = [v4 widgetIdentifier];
    int64_t v7 = [(WGWidgetDiscoveryController *)self largestAvailableDisplayModeForWidgetWithIdentifier:v6];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (void)widget:(id)a3 didChangeLargestAvailableDisplayMode:(int64_t)a4
{
  id v6 = [a3 widgetIdentifier];
  [(WGWidgetDiscoveryController *)self setLargestAvailableDisplayMode:a4 forWidgetWithIdentifier:v6];
}

- (void)widget:(id)a3 didEncounterProblematicSnapshotAtURL:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v9 widgetIdentifier];
    [WeakRetained widgetDiscoveryController:self widgetWithBundleIdentifier:v8 didEncounterProblematicSnapshotAtURL:v6];
  }
}

- (void)widget:(id)a3 didRemoveSnapshotAtURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 widgetIdentifier];
  [(WGWidgetDiscoveryController *)self _widget:v7 withIdentifier:v8 didRemoveSnapshotAtURL:v6];
}

- (BOOL)shouldPurgeArchivedSnapshotsForWidget:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 widgetIdentifier];
    char v7 = [WeakRetained widgetDiscoveryController:self shouldPurgeArchivedSnapshotsForWidgetWithBundleIdentifier:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldPurgeNonCAMLSnapshotsForWidget:(id)a3
{
  return self->_shouldPurgeNonCAMLSnapshots;
}

- (BOOL)shouldPurgeNonASTCSnapshotsForWidget:(id)a3
{
  return self->_shouldPurgeNonASTCSnapshots;
}

- (id)groupsForWidgetListEditViewController:(id)a3
{
  return &unk_26D5D4EA0;
}

- (id)widgetListEditViewController:(id)a3 itemIdentifiersForGroup:(id)a4
{
  return [(WGWidgetDiscoveryController *)self _orderedEnabledWidgetIdentifiersForGroup:a4 includingNoContent:1];
}

- (id)widgetListEditViewController:(id)a3 defaultGroupForItemWithIdentifier:(id)a4
{
  return [(WGWidgetDiscoveryController *)self _defaultGroupForWidgetWithIdentifier:a4];
}

- (void)widgetListEditViewController:(id)a3 didReorderItemsWithIdentifiersInGroups:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v11 = [v5 objectForKey:v10];
        WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v11, v10, self->_archiveWriteQueue);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  id v12 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"TodayGroup");
  unint64_t v13 = (NSMutableArray *)[v12 mutableCopy];
  orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
  self->_orderedEnabledTodayIdentifiers = v13;

  [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:@"TodayGroup"];
  id v15 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"WidgetGroup");
  id v16 = (NSMutableArray *)[v15 mutableCopy];
  orderedEnabledWidgetsIdentifiers = self->_orderedEnabledWidgetsIdentifiers;
  self->_orderedEnabledWidgetsIdentifiers = v16;

  [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:@"WidgetGroup"];
  orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
  self->_orderedVisibleWidgetsIdentifiers = 0;

  [(WGWidgetDiscoveryController *)self _notifyObserversOfSignificantWidgetsChange];
}

- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierEnabled:(id)a4
{
  return [(WGWidgetDiscoveryController *)self _isElementWithIdentifierEnabled:a4];
}

- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierNew:(id)a4
{
  return ![(WGWidgetDiscoveryController *)self _isElementWithIdentifierKnown:a4];
}

- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierFavorited:(id)a4
{
  return [(WGWidgetDiscoveryController *)self _isElementWithIdentifierFavorited:a4];
}

- (void)widgetListEditViewController:(id)a3 setEnabled:(BOOL)a4 forItemsWithIdentifiers:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(WGWidgetDiscoveryController *)self _updatePublicationStateOfDatumWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * v11) visibilityChanged:[(WGWidgetDiscoveryController *)self _setEnabled:v5 forElementWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * v11)] contentStateChanged:0 insertAtTop:0 notifyingObservers:1];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)widgetListEditViewController:(id)a3 updateFavoritesToIdentifiers:(id)a4
{
}

- (BOOL)shouldShowWidgetsPinButtonForWidgetListEditViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained shouldShowWidgetsPinButtonForWidgetDiscoveryController:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowWidgetsPinningTeachingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained shouldShowWidgetsPinningTeachingViewForWidgetDiscoveryController:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)noteWidgetsPinningViewControllerDidDismiss:(BOOL)a3
{
  BOOL v3 = a3;
  -[WGWidgetDiscoveryController _setWidgetsPinned:](self, "_setWidgetsPinned:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widgetDiscoveryControllerDidDismissWidgetsPinningTeachingView:self];
  }
  if (v3) {
    [(WGWidgetDiscoveryController *)self _addDefaultPinnedWidgets];
  }
}

- (void)_addDefaultPinnedWidgets
{
  v14[2] = *MEMORY[0x263EF8340];
  if (([(NSMutableArray *)self->_orderedEnabledTodayIdentifiers containsObject:@"com.apple.weather.WeatherAppTodayWidget"] & 1) == 0)[(WGWidgetDiscoveryController *)self _externalSourceRequestsInsertionOfWidgetWithIdentifier:@"com.apple.weather.WeatherAppTodayWidget" insertAtTop:0]; {
  if (([(NSMutableArray *)self->_orderedEnabledTodayIdentifiers containsObject:@"com.apple.UpNextWidget.extension"] & 1) == 0)[(WGWidgetDiscoveryController *)self _externalSourceRequestsInsertionOfWidgetWithIdentifier:@"com.apple.UpNextWidget.extension" insertAtTop:0];
  }
  uint64_t v3 = [(NSMutableArray *)self->_orderedEnabledTodayIdentifiers indexOfObject:@"com.apple.weather.WeatherAppTodayWidget"];
  uint64_t v4 = [(NSMutableArray *)self->_orderedEnabledTodayIdentifiers indexOfObject:@"com.apple.UpNextWidget.extension"];
  if (v3 > 1 || v4 >= 2)
  {
    uint64_t v6 = (void *)[(NSMutableArray *)self->_orderedEnabledTodayIdentifiers mutableCopy];
    [v6 removeObject:@"com.apple.weather.WeatherAppTodayWidget"];
    [v6 insertObject:@"com.apple.weather.WeatherAppTodayWidget" atIndex:0];
    [v6 removeObject:@"com.apple.UpNextWidget.extension"];
    [v6 insertObject:@"com.apple.UpNextWidget.extension" atIndex:1];
    WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v6, @"TodayGroup", self->_archiveWriteQueue);
    id v7 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"TodayGroup");
    uint64_t v8 = (NSMutableArray *)[v7 mutableCopy];
    orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
    self->_orderedEnabledTodayIdentifiers = v8;

    [(WGWidgetDiscoveryController *)self _invalidateVisibleIdentifiersForGroup:@"TodayGroup"];
    v14[0] = @"com.apple.weather.WeatherAppTodayWidget";
    v14[1] = @"com.apple.UpNextWidget.extension";
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    uint64_t v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
    [(WGWidgetDiscoveryController *)self _notifyObserversOfOrderChangeForWidgetIdentifiers:v11];
  }
  id v12 = [(WGWidgetDiscoveryController *)self favoriteWidgetIdentifiers];
  long long v13 = (void *)[v12 mutableCopy];

  if (([v13 containsObject:@"com.apple.weather.WeatherAppTodayWidget"] & 1) == 0) {
    [v13 insertObject:@"com.apple.weather.WeatherAppTodayWidget" atIndex:0];
  }
  if (([v13 containsObject:@"com.apple.UpNextWidget.extension"] & 1) == 0) {
    [v13 insertObject:@"com.apple.UpNextWidget.extension" atIndex:1];
  }
  [(WGWidgetDiscoveryController *)self _updateFavoriteWidgetIDs:v13];
}

- (void)widgetListEditViewController:(id)a3 didChangeWidgetsPinning:(BOOL)a4
{
}

- (void)_setWidgetsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widgetDiscoveryController:self didChangeWidgetsPinning:v3];
  }
}

- (void)widgetListEditViewController:(id)a3 acknowledgeInterfaceItemsWithIdentifiers:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        WGTodayViewArchiveSetKnownForIdentifier(self->_archive, *(void **)(*((void *)&v10 + 1) + 8 * v9++), 0);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  WGTodayViewArchiveSave(self->_archive, self->_archiveWriteQueue, 0);
}

- (id)widgetListEditViewController:(id)a3 displayNameForItemWithIdentifier:(id)a4
{
  id v5 = a4;
  if (![v5 length])
  {
    uint64_t v6 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  long long v14 = [(NSMutableDictionary *)self->_identifiersToWidgetInfos objectForKey:v5];
  uint64_t v15 = v14;
  if (v14)
  {
    long long v16 = [v14 displayName];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:]();
    }
    long long v16 = 0;
  }

  return v16;
}

- (void)widgetListEditViewController:(id)a3 requestsIconForItemWithIdentifier:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (![v7 length])
  {
    uint64_t v9 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  id v17 = [(NSMutableDictionary *)self->_identifiersToWidgetInfos objectForKey:v7];
  uint64_t v18 = v17;
  if (v17)
  {
    [v17 requestSettingsIconWithHandler:v8];
  }
  else if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
  {
    -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:]();
  }
}

- (BOOL)widgetListEditViewControllerShouldIncludeInternalWidgets:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained widgetDiscoveryControllerShouldIncludeInternalWidgets:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)layoutModeForWidgetListEditViewController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  char v5 = [v3 presentingViewController];

  uint64_t v6 = [v5 view];
  [v6 bounds];
  int64_t v9 = objc_msgSend(v4, "layoutModeForSize:", v7, v8);

  return v9;
}

- (BOOL)widgetListEditViewControllerShouldShowFavorites:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained widgetDiscoveryControllerShouldRespectFavorites:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)remoteViewControllerDidConnectForWidgetViewController:(id)a3
{
  uint64_t v4 = [a3 widgetHost];
  id v7 = [v4 widgetIdentifier];

  uint64_t v5 = [(NSMutableDictionary *)self->_widgetIDsToPendingTestCompletions objectForKey:v7];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
    [(NSMutableDictionary *)self->_widgetIDsToPendingTestCompletions removeObjectForKey:v7];
  }
}

- (void)remoteViewControllerViewDidAppearForWidgetViewController:(id)a3
{
  uint64_t v4 = [a3 widgetHost];
  id v7 = [v4 widgetIdentifier];

  uint64_t v5 = [(NSMutableDictionary *)self->_widgetIDsToPendingTestTearDowns objectForKey:v7];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    [(NSMutableDictionary *)self->_widgetIDsToPendingTestTearDowns removeObjectForKey:v7];
  }
}

- (void)widgetViewControllerNeedsToBeUnregisteredForRefreshNotification:(id)a3
{
  statsController = self->_statsController;
  id v5 = [a3 widgetHost];
  uint64_t v4 = [v5 widgetIdentifier];
  [(WGWidgetStatsController *)statsController unregisterWidgetForPredictionEvents:v4];
}

- (void)widgetViewControllerNeedsToBeRegisteredForRefreshNotification:(id)a3
{
  statsController = self->_statsController;
  id v5 = [a3 widgetHost];
  uint64_t v4 = [v5 widgetIdentifier];
  [(WGWidgetStatsController *)statsController registerWidgetForPredictionEvents:v4];
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WGWidgetDiscoveryController_deviceManagementPolicyDidChange___block_invoke;
  block[3] = &unk_264676630;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__WGWidgetDiscoveryController_deviceManagementPolicyDidChange___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v21 + 1) + 8 * v3);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v5 = [v4 plugInKitPlugins];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v18;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v18 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
              uint64_t v11 = [WeakRetained _widgetIDsToWidgets];
              uint64_t v12 = [v10 bundleIdentifier];
              uint64_t v13 = [v11 objectForKey:v12];

              [WeakRetained _updateLockedOutStateForWidget:v13 withContainingAppProxy:v4];
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v7);
        }

        ++v3;
      }
      while (v3 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)debugWidgetWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEFAULT, "Asked to debug widget with ID '%{public}@'", (uint8_t *)&v16, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debuggingHandler);
  if ([v8 length])
  {
    uint64_t v13 = [(NSMutableDictionary *)self->_identifiersToDatums objectForKey:v8];
    uint64_t v14 = v13;
    if (v13 && WeakRetained)
    {
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        [(WGWidgetDiscoveryController *)self _externalSourceRequestsInsertionOfWidgetWithIdentifier:v8 insertAtTop:0];
        [WeakRetained makeVisibleWidgetWithIdentifier:v8 completion:v10];
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  if (v10) {
    v10[2](v10, 0);
  }
LABEL_11:
}

- (BOOL)bootstrapFavoriteWidgets
{
  return [(WGWidgetStatsController *)self->_statsController bootstrapFavoriteWidgets];
}

- (void)setBootstrapFavoriteWidgets:(BOOL)a3
{
}

- (id)favoriteWidgetIdentifiers
{
  return WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"FavoriteGroup");
}

- (id)todayWidgetIdentifiers
{
  return WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, @"TodayGroup");
}

- (void)removeWidgetIdentifiersFromToday:(id)a3
{
  id v4 = a3;
  id v5 = [(WGWidgetDiscoveryController *)self todayWidgetIdentifiers];
  id v9 = (id)[v5 mutableCopy];

  [v9 removeObjectsInArray:v4];
  WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v9, @"TodayGroup", self->_archiveWriteQueue);
  uint64_t v6 = [(WGWidgetDiscoveryController *)self todayWidgetIdentifiers];
  uint64_t v7 = (NSMutableArray *)[v6 mutableCopy];
  orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
  self->_orderedEnabledTodayIdentifiers = v7;

  [(WGWidgetDiscoveryController *)self invalidateVisibleIdentifiers];
}

- (void)_updateFavoriteWidgetIDs:(id)a3
{
  id v6 = a3;
  id v4 = [(WGWidgetDiscoveryController *)self favoriteWidgetIdentifiers];
  if (([v4 isEqualToArray:v6] & 1) == 0)
  {
    WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v6, @"FavoriteGroup", self->_archiveWriteQueue);
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"WGWidgetFavoritesDidChange" object:self];
  }
}

- (void)registerIdentifierForRefreshEvents:(id)a3
{
}

- (void)unregisterIdentifierForRefreshEvents:(id)a3
{
}

- (WGWidgetDiscoveryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetDiscoveryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)_widgetIDsToWidgets
{
  return self->_widgetIDsToWidgets;
}

- (WGWidgetDebugging)debuggingHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debuggingHandler);
  return (WGWidgetDebugging *)WeakRetained;
}

- (void)setDebuggingHandler:(id)a3
{
}

- (WGWidgetListEditViewController)presentedEditViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  return (WGWidgetListEditViewController *)WeakRetained;
}

- (void)_setPresentedEditViewController:(id)a3
{
}

- (id)_presentedEditViewControllerStatusBarAssertion
{
  return self->_presentedEditViewControllerStatusBarAssertion;
}

- (void)_setPresentedEditViewControllerStatusBarAssertion:(id)a3
{
}

- (NSMutableDictionary)widgetIDsToPendingTestCompletions
{
  return self->_widgetIDsToPendingTestCompletions;
}

- (void)setWidgetIDsToPendingTestCompletions:(id)a3
{
}

- (NSMutableDictionary)widgetIDsToPendingTestTearDowns
{
  return self->_widgetIDsToPendingTestTearDowns;
}

- (void)setWidgetIDsToPendingTestTearDowns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIDsToPendingTestTearDowns, 0);
  objc_storeStrong((id *)&self->_widgetIDsToPendingTestCompletions, 0);
  objc_storeStrong(&self->_presentedEditViewControllerStatusBarAssertion, 0);
  objc_destroyWeak((id *)&self->_presentedEditViewController);
  objc_destroyWeak((id *)&self->_debuggingHandler);
  objc_storeStrong((id *)&self->_widgetIDsToWidgets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_newWidgetsCountPostQueue, 0);
  objc_storeStrong((id *)&self->_statsController, 0);
  objc_storeStrong((id *)&self->_persistentStateController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_orderedVisibleWidgetsIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedEnabledWidgetsIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedVisibleTodayIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedEnabledTodayIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToWidgetInfos, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifiersToDatumIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToDatums, 0);
  objc_storeStrong((id *)&self->_identifiersToDataSources, 0);
  objc_storeStrong((id *)&self->_defaultEnabledIDs, 0);
  objc_storeStrong((id *)&self->_archiveWriteQueue, 0);
  objc_storeStrong((id *)&self->_archive, 0);
}

- (void)widgetWithIdentifier:delegate:forRequesterWithIdentifier:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_222E49000, v1, OS_LOG_TYPE_DEBUG, "Requester with ID '%{public}@' is requesting widget with ID '%{public}@'", v2, 0x16u);
}

- (void)widgetDataSource:(void *)a1 replaceWithDatum:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 dataSourceIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_222E49000, v5, v6, "Unknown data source (%{public}@) called observer", v7, v8, v9, v10, v11);
}

- (void)widgetDataSource:replaceWithDatum:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_222E49000, v0, v1, "Failed to obtain or create widget info for datum with identifier %{public}@", v2, v3, v4, v5, v6);
}

- (void)widgetDataSource:removeDatum:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_222E49000, v0, v1, "Asked to remove widget datum (%{public}@) we don't have", v2, v3, v4, v5, v6);
}

- (void)widgetDataSource:(void *)a1 removeDatum:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 dataSourceIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_222E49000, v5, v6, "Unknown data source (%@{public}) called observer", v7, v8, v9, v10, v11);
}

- (void)widgetListEditViewController:displayNameForItemWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_222E49000, v0, v1, "Couldn't find widget info for identifier '%{public}@'", v2, v3, v4, v5, v6);
}

- (void)widgetListEditViewController:(uint64_t)a3 displayNameForItemWithIdentifier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end