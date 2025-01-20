@interface NCNotificationGroupList
+ (NSSet)presentableTypes;
- (BOOL)_allowPanningForRequest:(id)a3;
- (BOOL)_handleTapToExpandGroupForNotificationRequest:(id)a3;
- (BOOL)_isContentRevealedForNotificationRequest:(id)a3;
- (BOOL)_shouldAllowInteractionWithNotificationViewController:(id)a3;
- (BOOL)_shouldShowClearActionForRequest:(id)a3;
- (BOOL)_shouldShowOpenActionToPerformDefaultActionForRequest:(id)a3;
- (BOOL)_shouldShowOpenActionToPerformLongLookPresentationForRequest:(id)a3;
- (BOOL)_shouldShowOptionsActionForRequest:(id)a3;
- (BOOL)_shouldShowViewActionForRequest:(id)a3;
- (BOOL)containsCommunicationTypeNotificationRequests;
- (BOOL)containsCriticalNotificationRequest:(id)a3;
- (BOOL)containsNonPersistentNotificationRequests;
- (BOOL)containsNotificationRequest:(id)a3;
- (BOOL)containsPersistentNotificationRequests;
- (BOOL)containsTimeSensitiveNotificationRequests;
- (BOOL)deviceAuthenticated;
- (BOOL)handleTapOnNotificationViewController:(id)a3;
- (BOOL)hasNewTimeSensitiveNotificationRequestsWithMigratedTimeSensitiveNotificationRequests:(id)a3;
- (BOOL)isAttachmentImageFeaturedForNotificationViewController:(id)a3;
- (BOOL)isClearingAllNotificationRequestsForCellHorizontalSwipe;
- (BOOL)isClockNotificationGroup;
- (BOOL)isEligibleForStackElevationMigration;
- (BOOL)isGroupForNotificationRequest:(id)a3;
- (BOOL)isLeadingNotificationRequest:(id)a3;
- (BOOL)isRichNotificationContentViewForNotificationViewController:(id)a3;
- (BOOL)isShowingSummaryForRequest:(id)a3;
- (BOOL)longLookDismissalFinalFrameCalculatedWithoutWindow;
- (BOOL)matchesGroup:(id)a3;
- (BOOL)notificationViewControllerShouldAllowClickPresentationInteraction:(id)a3;
- (BOOL)notificationViewControllerShouldAllowExpandedPlatterInteraction:(id)a3;
- (BOOL)notificationViewControllerShouldAllowLongPressGesture:(id)a3;
- (BOOL)notificationViewControllerShouldInterpretTapAsDefaultAction:(id)a3;
- (BOOL)shouldAlignContentToBottomForNotificationViewController:(id)a3;
- (BOOL)shouldContinuePresentingActionButtonsForNotificationListCell:(id)a3;
- (BOOL)shouldReloadLeadingNotificationRequest;
- (BOOL)shouldShowDefaultActionForNotificationListCell:(id)a3;
- (BOOL)shouldShowSupplementaryActionsForNotificationListCell:(id)a3;
- (BOOL)shouldVerticallyStackActionButtonsForNotificationListCell:(id)a3;
- (BOOL)showAdditionalMessageLinesForNotificationViewController:(id)a3;
- (BOOL)summarizedNotificationsAllHaveMatchingIcons;
- (BOOL)summarizedNotificationsAllHaveMatchingPrimaryText;
- (BOOL)updateLeadingNotificationRequestContentProvider:(id)a3;
- (CGRect)notificationViewController:(id)a3 finalFrameForDismissingLongLookFromView:(id)a4;
- (CGRect)notificationViewController:(id)a3 initialFrameForPresentingLongLookFromView:(id)a4;
- (NCNotificationGroupList)initWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4;
- (NCNotificationListCell)cellRecycledWhilePresentingLongLook;
- (NCNotificationRequest)leadingNotificationRequest;
- (NCNotificationSectionSettings)notificationSectionSettings;
- (NCNotificationSummaryBuilder)summaryBuilder;
- (NCNotificationSystemSettings)notificationSystemSettings;
- (NSArray)allNotificationRequests;
- (NSArray)criticalAlerts;
- (NSArray)persistentNotificationRequests;
- (NSDate)comparisonDate;
- (NSMutableArray)orderedRequests;
- (NSMutableDictionary)clockSnoozeAlarmContentProviders;
- (NSMutableDictionary)contentProviders;
- (NSString)logDescription;
- (NSString)sectionIdentifier;
- (NSString)threadIdentifier;
- (_UILegibilitySettings)legibilitySettings;
- (double)_cachedHeightForNotificationRequest:(id)a3 isLeadingNotificationRequest:(BOOL)a4 withWidth:(double)a5;
- (double)individualCellBackgroundAlpha;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_cachedCellForNotificationRequest:(id)a3 createNewIfNecessary:(BOOL)a4 shouldConfigure:(BOOL)a5 forceShowContent:(BOOL)a6;
- (id)_clearActionForRequest:(id)a3 clearAll:(BOOL)a4;
- (id)_clockSnoozeAlarmNotificationStaticContentProviderForNotificationRequest:(id)a3 viewController:(id)a4;
- (id)_currentCellForNotificationRequest:(id)a3;
- (id)_openActionForRequest:(id)a3;
- (id)_optionsActionForRequest:(id)a3;
- (id)_presentLongLookActionForRequest:(id)a3 title:(id)a4 identifier:(id)a5;
- (id)_presentLongLookActionWithOpenTitleForRequest:(id)a3;
- (id)_presentLongLookActionWithViewTitleForRequest:(id)a3;
- (id)_requestForListCell:(id)a3;
- (id)animator;
- (id)clearAllText;
- (id)defaultActionForNotificationListCell:(id)a3;
- (id)headerText;
- (id)hideHomeAffordanceAnimationSettingsForNotificationViewController:(id)a3;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)notificationRequestPresenter:(id)a3 staticContentProviderForNotificationRequest:(id)a4;
- (id)notificationRequestPresenterNotificationUsageTrackingState:(id)a3;
- (id)notificationViewController:(id)a3 auxiliaryOptionsContentProviderForNotificationRequest:(id)a4 withLongLook:(BOOL)a5;
- (id)notificationViewController:(id)a3 keyboardAssertionForGestureWindow:(id)a4;
- (id)notificationViewControllerContainerViewProviderForExpandedContent:(id)a3;
- (id)purposeWithSensitiveTextHashed:(BOOL)a3;
- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationViewController:(id)a3;
- (id)supplementaryActionsForNotificationListCell:(id)a3;
- (id)unhideHomeAffordanceAnimationSettingsForNotificationViewController:(id)a3;
- (int64_t)_compareNotificationRequest:(id)a3 withNotificationRequest:(id)a4;
- (int64_t)compare:(id)a3;
- (int64_t)notificationViewControllerDateFormatStyle:(id)a3;
- (unint64_t)_existingIndexForCriticalNotificationRequest:(id)a3;
- (unint64_t)_existingIndexForNotificationRequest:(id)a3;
- (unint64_t)_insertionIndexForNotificationRequest:(id)a3;
- (unint64_t)_lockScreenPersistenceForNotificationRequest:(id)a3;
- (unint64_t)_lockScreenPriorityForNotificationRequest:(id)a3;
- (unint64_t)count;
- (unint64_t)importantAdornmentEligibleOptionsForNotificationViewController:(id)a3;
- (unint64_t)indexOfNotificationRequestPassingTest:(id)a3;
- (unint64_t)notificationCount;
- (unint64_t)notificationListViewNumberOfItems:(id)a3;
- (unint64_t)summarizedNotificationCountForLeadingRequest;
- (void)_executeClearActionForRequest:(id)a3;
- (void)_executeOptionsActionForRequest:(id)a3 action:(id)a4;
- (void)_executeViewActionForRequest:(id)a3;
- (void)_hintSideSwipeForDefaultActionForNotificationRequest:(id)a3;
- (void)_invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:(id)a3;
- (void)_loadLeadingNotificationRequestCellIfNecessary;
- (void)_performAction:(id)a3 forNotificationRequest:(id)a4 withCompletion:(id)a5;
- (void)_reloadAllNotificationRequests;
- (void)_reloadNotificationCellAtIndex:(unint64_t)a3;
- (void)_reloadNotificationViewForNotificationRequest:(id)a3 animated:(BOOL)a4;
- (void)_reloadNotificationViewForNotificationRequest:(id)a3 forceReloadView:(BOOL)a4 animated:(BOOL)a5;
- (void)_reloadRecycledGroupedNotificationCells;
- (void)_reloadRecycledNotificationCellForRequest:(id)a3;
- (void)_scrollToTopIfNecessaryAndPerformBlock:(id)a3;
- (void)_setGrouped:(BOOL)a3;
- (void)_updateSummariesForLeadingNotificationRequest:(id)a3 forceReload:(BOOL)a4;
- (void)_updateSummariesForNewLeadingNotificationRequest:(id)a3 oldLeadingNotificationRequest:(id)a4;
- (void)clearAll;
- (void)insertNotificationRequest:(id)a3;
- (void)longLookDidDismissForNotificationViewController:(id)a3;
- (void)longLookWillDismissForNotificationViewController:(id)a3;
- (void)longLookWillPresentForNotificationViewController:(id)a3;
- (void)mergeNotificationRequests:(id)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListDidLayoutSubviews;
- (void)notificationListView:(id)a3 didRemoveView:(id)a4;
- (void)notificationListView:(id)a3 willRemoveView:(id)a4 bottomSpacing:(double)a5;
- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6;
- (void)notificationRequestPresenter:(id)a3 executeAction:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)notificationRequestPresenter:(id)a3 shouldTransitionToStage:(id)a4 forTrigger:(int64_t)a5 completionBlock:(id)a6;
- (void)notificationViewController:(id)a3 didUpdatePreferredContentSize:(CGSize)a4;
- (void)notificationViewController:(id)a3 dismissPresentLongLookForRequst:(id)a4 animator:(id)a5;
- (void)notificationViewController:(id)a3 isPerformingHoverHighlighting:(BOOL)a4;
- (void)notificationViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)notificationViewController:(id)a3 willPresentLongLookForRequst:(id)a4 animator:(id)a5;
- (void)notificationViewControllerDidEndUserInteraction:(id)a3;
- (void)notificationViewControllerWillBeginUserInteraction:(id)a3;
- (void)notificationViewControllerWillDismissForCancelAction:(id)a3;
- (void)recycleView:(id)a3;
- (void)reloadLeadingNotificationRequestIfNecessaryWithAnimation:(BOOL)a3;
- (void)reloadLeadingNotificationRequestWithAnimation:(BOOL)a3;
- (void)reloadNotificationRequest:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)setCellRecycledWhilePresentingLongLook:(id)a3;
- (void)setClearingAllNotificationRequestsForCellHorizontalSwipe:(BOOL)a3;
- (void)setClockNotificationGroup:(BOOL)a3;
- (void)setClockSnoozeAlarmContentProviders:(id)a3;
- (void)setComparisonDate:(id)a3;
- (void)setContentProviders:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setIndividualCellBackgroundAlpha:(double)a3;
- (void)setLeadingNotificationRequest:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLogDescription:(id)a3;
- (void)setLongLookDismissalFinalFrameCalculatedWithoutWindow:(BOOL)a3;
- (void)setNotificationSectionSettings:(id)a3;
- (void)setNotificationSystemSettings:(id)a3;
- (void)setOrderedRequests:(id)a3;
- (void)setShouldReloadLeadingNotificationRequest:(BOOL)a3;
- (void)setSummaryBuilder:(id)a3;
- (void)toggleGroupedState;
- (void)updateComparisonDate;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
- (void)updateOrderedNotificationRequests:(id)a3;
- (void)updateStackSummariesIfNeeded;
@end

@implementation NCNotificationGroupList

- (NCNotificationGroupList)initWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationGroupList;
  v9 = [(NCNotificationGroupList *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_threadIdentifier, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedRequests = v10->_orderedRequests;
    v10->_orderedRequests = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentProviders = v10->_contentProviders;
    v10->_contentProviders = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clockSnoozeAlarmContentProviders = v10->_clockSnoozeAlarmContentProviders;
    v10->_clockSnoozeAlarmContentProviders = v15;

    v17 = objc_alloc_init(NCNotificationSummaryBuilder);
    summaryBuilder = v10->_summaryBuilder;
    v10->_summaryBuilder = v17;

    v10->_individualCellBackgroundAlpha = 1.0;
  }

  return v10;
}

- (NSArray)allNotificationRequests
{
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)persistentNotificationRequests
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(NCNotificationGroupList *)self allNotificationRequests];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      v10 = [v9 options];
      uint64_t v11 = [v10 lockScreenPersistence];

      if (!v11) {
        break;
      }
      [v3 addObject:v9];
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return (NSArray *)v3;
}

- (NSArray)criticalAlerts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(NCNotificationGroupList *)self notificationSectionSettings];
  int v5 = [v4 criticalAlertsEnabled];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(NCNotificationGroupList *)self allNotificationRequests];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 isCriticalAlert]) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return (NSArray *)v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  uint64_t v6 = [v4 leadingNotificationRequest];

  int64_t v7 = [(NCNotificationGroupList *)self _compareNotificationRequest:v5 withNotificationRequest:v6];
  return v7;
}

- (BOOL)matchesGroup:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationGroupList *)self notificationSectionSettings];
  uint64_t v6 = [v5 groupingSetting];

  int64_t v7 = [(NCNotificationGroupList *)self sectionIdentifier];
  uint64_t v8 = [v4 sectionIdentifier];
  int v9 = [v7 isEqualToString:v8];
  if (v6 == 2) {
    int v10 = 0;
  }
  else {
    int v10 = v9;
  }

  if (v10 == 1 && !v6)
  {
    uint64_t v11 = [(NCNotificationGroupList *)self threadIdentifier];
    v12 = [v4 threadIdentifier];
    LOBYTE(v10) = [v11 isEqualToString:v12];
  }
  return v10;
}

- (void)mergeNotificationRequests:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__NCNotificationGroupList_mergeNotificationRequests___block_invoke;
  v11[3] = &unk_1E6A91B18;
  v11[4] = self;
  [v4 enumerateObjectsUsingBlock:v11];

  [(NCNotificationGroupList *)self updateStackSummariesIfNeeded];
  uint64_t v6 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  int64_t v7 = [v6 timestamp];
  comparisonDate = self->_comparisonDate;
  self->_comparisonDate = v7;

  int v9 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  [(NCNotificationGroupList *)self _updateSummariesForNewLeadingNotificationRequest:v9 oldLeadingNotificationRequest:v5];

  int v10 = [(NCNotificationListPresentableGroup *)self listView];
  [v10 invalidateData];
}

void __53__NCNotificationGroupList_mergeNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_existingIndexForNotificationRequest:");
  id v4 = *(void **)(a1 + 32);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [v4 _insertionIndexForNotificationRequest:v7];
    uint64_t v6 = [*(id *)(a1 + 32) orderedRequests];
    [v6 insertObject:v7 atIndex:v5];
  }
  else
  {
    [v4 modifyNotificationRequest:v7];
  }
}

- (BOOL)containsNonPersistentNotificationRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) options];
        uint64_t v7 = [v6 lockScreenPersistence];

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsPersistentNotificationRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) options];
        uint64_t v7 = [v6 lockScreenPersistence];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isGroupForNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationGroupList *)self notificationSectionSettings];
  uint64_t v6 = [v5 groupingSetting];

  uint64_t v7 = [v4 sectionIdentifier];
  uint64_t v8 = [(NCNotificationGroupList *)self sectionIdentifier];
  if ([v7 isEqualToString:v8])
  {
    if (v6)
    {
      BOOL v9 = 1;
    }
    else
    {
      long long v10 = [v4 threadIdentifier];
      long long v11 = [(NCNotificationGroupList *)self threadIdentifier];
      BOOL v9 = ([v10 isEqualToString:v11] & 1) != 0
        || [(NCNotificationGroupList *)self _existingIndexForCriticalNotificationRequest:v4] != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)containsCriticalNotificationRequest:(id)a3
{
  return [(NCNotificationGroupList *)self _existingIndexForCriticalNotificationRequest:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isLeadingNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  char v6 = [v5 matchesRequest:v4];

  return v6;
}

- (NCNotificationRequest)leadingNotificationRequest
{
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 firstObject];

  return (NCNotificationRequest *)v3;
}

- (void)reloadLeadingNotificationRequestWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  uint64_t v5 = [(NCNotificationListPresentableGroup *)self notificationListCache];
  [v5 clearCachedHeightsForNotificationRequest:v6];

  [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v6 animated:v3];
}

- (void)reloadLeadingNotificationRequestIfNecessaryWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCNotificationGroupList *)self shouldReloadLeadingNotificationRequest])
  {
    [(NCNotificationGroupList *)self reloadLeadingNotificationRequestWithAnimation:v3];
    [(NCNotificationGroupList *)self setShouldReloadLeadingNotificationRequest:0];
  }
}

- (unint64_t)indexOfNotificationRequestPassingTest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NCNotificationGroupList *)self orderedRequests];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__NCNotificationGroupList_indexOfNotificationRequestPassingTest___block_invoke;
    v8[3] = &unk_1E6A94240;
    id v9 = v4;
    unint64_t v6 = [v5 indexOfObjectPassingTest:v8];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __65__NCNotificationGroupList_indexOfNotificationRequestPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateOrderedNotificationRequests:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v6 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v7 = [v5 setWithArray:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  int v9 = [v7 isEqualToSet:v8];

  if (v9)
  {
    long long v10 = [(NCNotificationGroupList *)self orderedRequests];
    if ([v10 isEqualToArray:v4])
    {
    }
    else
    {
      BOOL v12 = [(NCNotificationListPresentableGroup *)self isGrouped];

      if (v12)
      {
        long long v13 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = v13;
          long long v15 = [(NCNotificationGroupList *)self logDescription];
          int v18 = 138543362;
          v19 = v15;
          _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification request ordering", (uint8_t *)&v18, 0xCu);
        }
        long long v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
        [(NCNotificationGroupList *)self setOrderedRequests:v16];

        v17 = [(NCNotificationListPresentableGroup *)self listView];
        [v17 invalidateData];
      }
    }
  }
  else
  {
    long long v11 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationGroupList *)v11 updateOrderedNotificationRequests:v4];
    }
  }
}

- (void)updateComparisonDate
{
  BOOL v3 = [(NCNotificationGroupList *)self leadingNotificationRequest];

  if (v3)
  {
    id v6 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    id v4 = [v6 timestamp];
    comparisonDate = self->_comparisonDate;
    self->_comparisonDate = v4;
  }
}

- (void)setIndividualCellBackgroundAlpha:(double)a3
{
  if (self->_individualCellBackgroundAlpha != a3)
  {
    self->_individualCellBackgroundAlpha = a3;
    uint64_t v5 = [(NCNotificationGroupList *)self orderedRequests];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__NCNotificationGroupList_setIndividualCellBackgroundAlpha___block_invoke;
    v6[3] = &unk_1E6A94268;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __60__NCNotificationGroupList_setIndividualCellBackgroundAlpha___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _cachedCellForNotificationRequest:a2 createNewIfNecessary:0 shouldConfigure:0 forceShowContent:0];
  [v3 setBackgroundAlpha:*(double *)(a1 + 40)];
}

- (BOOL)containsTimeSensitiveNotificationRequests
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) interruptionLevel] == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsCommunicationTypeNotificationRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) content];
        char v7 = [v6 isCommunicationType];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasNewTimeSensitiveNotificationRequestsWithMigratedTimeSensitiveNotificationRequests:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 interruptionLevel] == 2 && !objc_msgSend(v4, "containsObject:", v9))
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isEligibleForStackElevationMigration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NCNotificationGroupList *)self notificationSectionSettings];
  char v4 = [v3 isSummarizationEnabled];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v7) {
      return result;
    }
    long long v8 = v6;
    long long v9 = [(NCNotificationGroupList *)self logDescription];
    int v13 = 138543362;
    long long v14 = v9;
    long long v10 = "%{public}@ isSummarizationEnabled for app section is NO";
    goto LABEL_8;
  }
  if ([(NCNotificationGroupList *)self containsCommunicationTypeNotificationRequests])
  {
    return 1;
  }
  long long v11 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v12)
  {
    long long v8 = v11;
    long long v9 = [(NCNotificationGroupList *)self logDescription];
    int v13 = 138543362;
    long long v14 = v9;
    long long v10 = "%{public}@ doesn't contain communicationType notification";
LABEL_8:
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);

    return 0;
  }
  return result;
}

- (id)headerText
{
  uint64_t v3 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  char v4 = [v3 content];
  uint64_t v5 = [v4 customHeader];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v8 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    long long v9 = [v8 content];
    id v7 = [v9 defaultHeader];
  }
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    long long v11 = NCUserNotificationsUIKitFrameworkBundle();
    id v10 = [v11 localizedStringForKey:@"NOTIFICATION_SECTION_GENERAL_TITLE" value:&stru_1F2F516F8 table:0];
  }

  return v10;
}

- (id)clearAllText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (id)animator
{
  uint64_t v3 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 animator];
  }
  else
  {
    if (_NCReactiveListUI())
    {
      uint64_t v5 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_FAULT)) {
        [(NCNotificationListSupplementaryViewsGroup *)(uint64_t)v3 animator];
      }
    }
    uint64_t v4 = NCDefaultAnimator();
  }
  uint64_t v6 = (void *)v4;

  return v6;
}

- (unint64_t)count
{
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (NSSet)presentableTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();

  return (NSSet *)[v2 setWithObject:v3];
}

- (void)clearAll
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v5 = (void *)[v4 copy];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __35__NCNotificationGroupList_clearAll__block_invoke;
  long long v11 = &unk_1E6A92BA0;
  BOOL v12 = self;
  id v13 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:&v8];
  id v7 = [(NCNotificationListPresentableGroup *)self delegate];
  [v7 notificationListBaseComponent:self requestsClearingPresentables:v6];
  [v7 notificationListBaseComponentDidRemoveAll:self];
}

void __35__NCNotificationGroupList_clearAll__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 removeNotificationRequest:v4];
  [*(id *)(a1 + 40) addObject:v4];
}

- (unint64_t)notificationCount
{
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)insertNotificationRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationGroupList *)self _existingIndexForNotificationRequest:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    unint64_t v6 = [(NCNotificationGroupList *)self _insertionIndexForNotificationRequest:v4];
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [(NCNotificationGroupList *)self logDescription];
      id v10 = [v4 notificationIdentifier];
      long long v11 = objc_msgSend(v10, "un_logDigest");
      int v18 = 138543874;
      v19 = v9;
      __int16 v20 = 2114;
      v21 = v11;
      __int16 v22 = 2048;
      unint64_t v23 = v6;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting notification request %{public}@ at index %ld", (uint8_t *)&v18, 0x20u);
    }
    BOOL v12 = [(NCNotificationGroupList *)self orderedRequests];
    [v12 insertObject:v4 atIndex:v6];

    id v13 = [(NCNotificationListPresentableGroup *)self listView];
    [v13 insertViewAtIndex:v6 animated:1];

    long long v14 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    uint64_t v15 = [v14 timestamp];
    comparisonDate = self->_comparisonDate;
    self->_comparisonDate = v15;

    v17 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    [(NCNotificationGroupList *)self _updateSummariesForNewLeadingNotificationRequest:v17 oldLeadingNotificationRequest:v5];

    [(NCNotificationGroupList *)self updateStackSummariesIfNeeded];
  }
  else
  {
    [(NCNotificationGroupList *)self modifyNotificationRequest:v4];
  }
}

- (void)updateStackSummariesIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NCNotificationGroupList *)self orderedRequests];
  id v4 = (void *)[v3 copy];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        long long v11 = [(NCNotificationGroupList *)self contentProviders];
        BOOL v12 = [v11 objectForKey:v10];

        if (v12)
        {
          uint64_t v13 = [v12 stackedNotificationsCount];
          BOOL v14 = v13 != 0;
          if (v13) {
            [v12 setStackedNotificationsCount:0];
          }
          if ([v12 summarizedNotificationsAllHaveMatchingPrimaryText])
          {
            [v12 setSummarizedNotificationsAllHaveMatchingPrimaryText:0];
            BOOL v14 = 1;
          }
          if ([v12 summarizedNotificationsAllHaveMatchingIcons])
          {
            [v12 setSummarizedNotificationsAllHaveMatchingIcons:0];
            if ([v12 isThreadSummary]) {
LABEL_15:
            }
              [v12 setIsThreadSummary:0];
LABEL_16:
            [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v10 animated:1];
            goto LABEL_17;
          }
          if ([v12 isThreadSummary]) {
            goto LABEL_15;
          }
          if (v14) {
            goto LABEL_16;
          }
        }
LABEL_17:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v15 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
  }

  uint64_t v16 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  v17 = [(NCNotificationGroupList *)self contentProviders];
  int v18 = [v17 objectForKey:v16];
  BOOL v19 = [(NCNotificationGroupList *)self updateLeadingNotificationRequestContentProvider:v18];

  if (v19) {
    [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v16 animated:1];
  }
}

- (BOOL)updateLeadingNotificationRequestContentProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationGroupList *)self count];
  if (v5)
  {
    if ([(NCNotificationListPresentableGroup *)self isGrouped])
    {
      [v4 setStackedNotificationsCount:v5];
      id v5 = [v4 notificationRequest];
      uint64_t v6 = [v5 content];
      uint64_t v7 = [v6 threadSummary];
      if (v7
        && [(NCNotificationSectionSettings *)self->_notificationSectionSettings isSummarizationEnabled])
      {
        uint64_t v8 = [v5 options];
        if ([v8 canShowSummary])
        {
          uint64_t v9 = [v5 options];
          uint64_t v10 = [v9 contentPreviewSetting];

          [v4 setIsThreadSummary:v10 != 2];
          if (v10 != 2)
          {
            objc_msgSend(v4, "setSummarizedNotificationsAllHaveMatchingPrimaryText:", -[NCNotificationGroupList summarizedNotificationsAllHaveMatchingPrimaryText](self, "summarizedNotificationsAllHaveMatchingPrimaryText"));
            objc_msgSend(v4, "setSummarizedNotificationsAllHaveMatchingIcons:", -[NCNotificationGroupList summarizedNotificationsAllHaveMatchingIcons](self, "summarizedNotificationsAllHaveMatchingIcons"));
          }
          goto LABEL_11;
        }
      }
      [v4 setIsThreadSummary:0];
LABEL_11:

      LOBYTE(v5) = 1;
      goto LABEL_12;
    }
    LOBYTE(v5) = 0;
  }
LABEL_12:

  return (char)v5;
}

- (BOOL)summarizedNotificationsAllHaveMatchingPrimaryText
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = +[NCNotificationRequestContentProvider defaultPrimaryTextForRequest:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        uint64_t v9 = v8;
        if (!v5) {
          id v5 = v8;
        }
        int v10 = [v9 isEqualToString:v5];

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }
  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (BOOL)summarizedNotificationsAllHaveMatchingIcons
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v10 = [v9 iconRecipe];
        BOOL v11 = [v9 subordinateIconRecipe];
        if (!v6)
        {
          id v6 = v10;
          id v12 = v11;

          id v5 = v12;
        }
        if (!BSEqualObjects() || !BSEqualObjects())
        {

          BOOL v13 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
    id v6 = 0;
    BOOL v13 = 1;
  }
LABEL_15:

  return v13;
}

- (unint64_t)summarizedNotificationCountForLeadingRequest
{
  uint64_t v3 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  unint64_t v4 = [(NCNotificationGroupList *)self count];
  if (v4 < 2)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = v4;
    id v6 = [v3 content];
    uint64_t v7 = [v6 threadSummary];
    if (v7
      && [(NCNotificationSectionSettings *)self->_notificationSectionSettings isSummarizationEnabled]&& [(NCNotificationListPresentableGroup *)self isGrouped])
    {
      uint64_t v8 = [v3 options];
      if ([v8 contentPreviewSetting] == 2) {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isShowingSummaryForRequest:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_contentProviders objectForKey:a3];
  unint64_t v4 = [v3 contentSummaryText];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)removeNotificationRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NCNotificationGroupList *)self _existingIndexForNotificationRequest:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    uint64_t v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [(NCNotificationGroupList *)self logDescription];
      int v10 = [v4 notificationIdentifier];
      BOOL v11 = objc_msgSend(v10, "un_logDigest");
      int v22 = 138543874;
      long long v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      __int16 v26 = 2048;
      unint64_t v27 = v6;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ at index %ld", (uint8_t *)&v22, 0x20u);
    }
    id v12 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    BOOL v13 = [(NCNotificationGroupList *)self orderedRequests];
    long long v14 = [v13 objectAtIndex:v6];

    long long v15 = [(NCNotificationGroupList *)self contentProviders];
    [v15 removeObjectForKey:v14];

    long long v16 = [(NCNotificationGroupList *)self orderedRequests];
    [v16 removeObjectAtIndex:v6];

    long long v17 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v4];
    if (v17) {
      BOOL v18 = [(NCNotificationListPresentableGroup *)self actionsRevealedForNotificationListCell:v17];
    }
    else {
      BOOL v18 = 0;
    }
    BOOL v19 = [(NCNotificationListPresentableGroup *)self listView];
    [v19 removeViewAtIndex:v6 animated:1 isHorizontallyDisplaced:v18];

    uint64_t v20 = [(NCNotificationListPresentableGroup *)self notificationListCache];
    [v20 clearCacheForNotificationRequest:v4];

    long long v21 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    [(NCNotificationGroupList *)self _updateSummariesForNewLeadingNotificationRequest:v21 oldLeadingNotificationRequest:v12];

    [(NCNotificationGroupList *)self updateStackSummariesIfNeeded];
  }
  if ([(NCNotificationGroupList *)self count] == 1) {
    [(NCNotificationGroupList *)self _setGrouped:1];
  }
  if ([(NCNotificationGroupList *)self isClockNotificationGroup]) {
    [(NCNotificationGroupList *)self _invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:v4];
  }
}

- (void)modifyNotificationRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NCNotificationGroupList *)self _existingIndexForNotificationRequest:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    uint64_t v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [(NCNotificationGroupList *)self logDescription];
      int v10 = [v4 notificationIdentifier];
      BOOL v11 = objc_msgSend(v10, "un_logDigest");
      int v33 = 138543874;
      v34 = v9;
      __int16 v35 = 2114;
      v36 = v11;
      __int16 v37 = 2048;
      unint64_t v38 = v6;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@ at index %ld", (uint8_t *)&v33, 0x20u);
    }
    id v12 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    BOOL v13 = [(NCNotificationGroupList *)self orderedRequests];
    long long v14 = [v13 objectAtIndex:v6];

    long long v15 = [(NCNotificationGroupList *)self contentProviders];
    [v15 removeObjectForKey:v14];

    long long v16 = [(NCNotificationListPresentableGroup *)self notificationListCache];
    [v16 updateNotificationRequest:v4];

    unint64_t v17 = [(NCNotificationGroupList *)self _insertionIndexForNotificationRequest:v4];
    BOOL v18 = [(NCNotificationGroupList *)self orderedRequests];
    BOOL v19 = v18;
    if (v17 == v6)
    {
      [v18 replaceObjectAtIndex:v6 withObject:v4];

      unint64_t v20 = [v4 interruptionLevel];
      long long v21 = [(NCNotificationListPresentableGroup *)self listView];
      int v22 = v21;
      if (v20 < 3)
      {
        [v21 reloadViewAtIndex:v6];
        goto LABEL_10;
      }
      [v21 removeViewAtIndex:v6 animated:0];

      long long v23 = [(NCNotificationListPresentableGroup *)self listView];
      int v22 = v23;
      unint64_t v24 = v6;
      uint64_t v25 = 0;
    }
    else
    {
      [v18 removeObjectAtIndex:v6];

      __int16 v26 = [(NCNotificationListPresentableGroup *)self listView];
      [v26 removeViewAtIndex:v6 animated:0];

      unint64_t v27 = (__PAIR128__(v17, v6) - v17) >> 64;
      uint64_t v28 = [(NCNotificationGroupList *)self orderedRequests];
      [v28 insertObject:v4 atIndex:v27];

      long long v23 = [(NCNotificationListPresentableGroup *)self listView];
      int v22 = v23;
      unint64_t v24 = v27;
      uint64_t v25 = 1;
    }
    [v23 insertViewAtIndex:v24 animated:v25];
LABEL_10:

    [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v4 animated:1];
    v29 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    v30 = [v29 timestamp];
    comparisonDate = self->_comparisonDate;
    self->_comparisonDate = v30;

    v32 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    [(NCNotificationGroupList *)self _updateSummariesForNewLeadingNotificationRequest:v32 oldLeadingNotificationRequest:v12];

    [(NCNotificationGroupList *)self updateStackSummariesIfNeeded];
  }
}

- (void)reloadNotificationRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(NCNotificationGroupList *)self logDescription];
    uint64_t v8 = [v4 notificationIdentifier];
    uint64_t v9 = objc_msgSend(v8, "un_logDigest");
    int v10 = 138543618;
    BOOL v11 = v7;
    __int16 v12 = 2114;
    BOOL v13 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading notification request %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v4 animated:1];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_notificationSectionSettings, a3);
  if (v8)
  {
    uint64_t v9 = [v7 contentPreviewSetting];
    if (v9 != [v8 contentPreviewSetting]
      || (int v10 = [v7 isUserConfigurable], v10 != objc_msgSend(v8, "isUserConfigurable")))
    {
      BOOL v11 = [(NCNotificationListPresentableGroup *)self isGrouped];
      __int16 v12 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = v12;
        uint64_t v14 = [(NCNotificationGroupList *)self logDescription];
        long long v15 = [(NCNotificationGroupList *)self sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        int v33 = v14;
        __int16 v34 = 2114;
        __int16 v35 = v15;
        _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ changed content preview settings for section %{public}@", buf, 0x16u);
      }
      long long v16 = [(NCNotificationGroupList *)self orderedRequests];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __85__NCNotificationGroupList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
      v30[3] = &unk_1E6A94290;
      BOOL v31 = v11;
      v30[4] = self;
      [v16 enumerateObjectsUsingBlock:v30];
LABEL_7:

      goto LABEL_8;
    }
    int v17 = [v7 isSummarizationEnabled];
    if (v17 != [v8 isSummarizationEnabled]
      || (int v18 = [v7 isUserConfigurable], v18 != objc_msgSend(v8, "isUserConfigurable")))
    {
      BOOL v19 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = v19;
        long long v21 = [(NCNotificationGroupList *)self logDescription];
        int v22 = [(NCNotificationGroupList *)self sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        int v33 = v21;
        __int16 v34 = 2114;
        __int16 v35 = v22;
        _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ changed summarization setting for section %{public}@", buf, 0x16u);
      }
      long long v23 = [(NCNotificationGroupList *)self orderedRequests];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      __int16 v26 = __85__NCNotificationGroupList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_35;
      unint64_t v27 = &unk_1E6A92BA0;
      uint64_t v28 = self;
      id v29 = v7;
      [v23 enumerateObjectsUsingBlock:&v24];

      [(NCNotificationGroupList *)self _reloadAllNotificationRequests];
      [(NCNotificationGroupList *)self updateStackSummariesIfNeeded];
      long long v16 = v29;
      goto LABEL_7;
    }
  }
LABEL_8:
}

uint64_t __85__NCNotificationGroupList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 < 3 || !*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) reloadNotificationRequest:a2];
  }
  return result;
}

void __85__NCNotificationGroupList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_35(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKey:a2];
  objc_msgSend(v3, "setSummarizationEnabled:", objc_msgSend(*(id *)(a1 + 40), "isSummarizationEnabled"));
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_deviceAuthenticated != a3)
  {
    BOOL v3 = a3;
    self->_deviceAuthenticated = a3;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unint64_t v5 = [(NCNotificationGroupList *)self contentProviders];
    unint64_t v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) setDeviceAuthenticated:v3];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    if ([(NCNotificationGroupList *)self count])
    {
      BOOL v11 = [(NCNotificationGroupList *)self leadingNotificationRequest];
      __int16 v12 = [v11 options];
      uint64_t v13 = [v12 contentPreviewSetting];

      if (v13 == 1)
      {
        uint64_t v14 = [(NCNotificationListPresentableGroup *)self listView];
        [v14 setPerformingContentRevealAnimation:1];

        long long v15 = [(NCNotificationListPresentableGroup *)self delegate];
        int v16 = [v15 notificationGroupListShouldReloadNotificationCells:self];

        if (v16)
        {
          if ([(NCNotificationListPresentableGroup *)self isGrouped])
          {
            [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v11 animated:1];
          }
          else
          {
            int v17 = [(NCNotificationGroupList *)self orderedRequests];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __50__NCNotificationGroupList_setDeviceAuthenticated___block_invoke;
            v19[3] = &unk_1E6A91B18;
            v19[4] = self;
            [v17 enumerateObjectsUsingBlock:v19];
          }
          int v18 = [(NCNotificationListPresentableGroup *)self listView];
          [v18 setNeedsLayout];
        }
        else
        {
          [(NCNotificationGroupList *)self setShouldReloadLeadingNotificationRequest:1];
        }
      }
    }
  }
}

uint64_t __50__NCNotificationGroupList_setDeviceAuthenticated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reloadNotificationViewForNotificationRequest:a2 animated:1];
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationGroupList *)self orderedRequests];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__NCNotificationGroupList_containsNotificationRequest___block_invoke;
  v9[3] = &unk_1E6A92790;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __55__NCNotificationGroupList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (NSString)logDescription
{
  BOOL v3 = NSString;
  id v4 = [(NCNotificationGroupList *)self sectionIdentifier];
  unint64_t v5 = [(NCNotificationGroupList *)self threadIdentifier];
  id v6 = objc_msgSend(v5, "un_logDigest");
  uint64_t v7 = [v3 stringWithFormat:@"Group List [%@:%@]", v4, v6];

  return (NSString *)v7;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  uint64_t v8 = [(NCNotificationGroupList *)self orderedRequests];
  unint64_t v9 = [v8 count];

  if (v9 <= a4) {
    return 0.0;
  }
  if (!a4) {
    [(NCNotificationGroupList *)self _loadLeadingNotificationRequestCellIfNecessary];
  }
  BOOL v10 = a4 == 0;
  BOOL v11 = [(NCNotificationGroupList *)self orderedRequests];
  __int16 v12 = [v11 objectAtIndex:a4];

  [(NCNotificationGroupList *)self _cachedHeightForNotificationRequest:v12 isLeadingNotificationRequest:v10 withWidth:a5];
  double v14 = v13;

  return v14;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6 = [(NCNotificationGroupList *)self orderedRequests];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v8 = [(NCNotificationGroupList *)self orderedRequests];
    unint64_t v9 = [v8 objectAtIndex:a4];

    unsigned int v10 = ![(NCNotificationListPresentableGroup *)self isGrouped];
    if (a4) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 1;
    }
    id v12 = [(NCNotificationGroupList *)self _cachedCellForNotificationRequest:v9 createNewIfNecessary:1 shouldConfigure:v11 forceShowContent:0];
    double v13 = [(NCNotificationListPresentableGroup *)self listView];
    int v14 = 0;
    if ([v13 isHiddenBelowStack])
    {
      long long v15 = [(NCNotificationListPresentableGroup *)self listView];
      int v14 = [v15 showContentForGroupedViews] ^ 1;
    }
    int v16 = [v12 notificationViewController];

    [v16 setNotificationContentViewHidden:v11 ^ 1 | v14];
  }

  return v12;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  BOOL v3 = [(NCNotificationGroupList *)self orderedRequests];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)recycleView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationGroupList;
  [(NCNotificationListPresentableGroup *)&v11 recycleView:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 notificationViewController];
    if ([v6 hasCommittedToPresentingCustomContentProvidingViewController])
    {
      [(NCNotificationGroupList *)self setCellRecycledWhilePresentingLongLook:v5];
    }
    else
    {
      [v5 hideActionButtonsAnimated:0 fastAnimation:0 completion:0];
      unint64_t v7 = [(NCNotificationListPresentableGroup *)self notificationListCache];
      char v8 = [v7 recycleNotificationListCell:v5];

      [v6 removeObserver:self];
      if ((v8 & 1) == 0)
      {
        unint64_t v9 = [(NCNotificationListPresentableGroup *)self delegate];
        [v9 notificationListBaseComponent:self didRemoveViewController:v6];
      }
      unsigned int v10 = [v6 notificationRequest];
      if ([(NCNotificationGroupList *)self isClockNotificationGroup]) {
        [(NCNotificationGroupList *)self _invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:v10];
      }
    }
  }
}

- (void)notificationListDidLayoutSubviews
{
  id v3 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 groupListDidLayout:self];
  }
}

- (void)notificationListView:(id)a3 willRemoveView:(id)a4 bottomSpacing:(double)a5
{
  id v8 = a4;
  unint64_t v7 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 notificationListComponent:self willRemoveView:v8 bottomSpacing:a5];
  }
}

- (void)notificationListView:(id)a3 didRemoveView:(id)a4
{
  id v6 = a4;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 notificationListComponent:self didRemoveView:v6];
  }
}

- (id)notificationRequestPresenter:(id)a3 staticContentProviderForNotificationRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = 0;
    }
  }
  else
  {
    unsigned int v10 = 0;
  }
  id v11 = v10;

  if (![v11 isShortLook])
  {
    int v14 = 0;
    goto LABEL_27;
  }
  id v12 = [(NCNotificationGroupList *)self orderedRequests];
  if ([v12 containsObject:v7])
  {
    BOOL v13 = [(NCNotificationGroupList *)self isClockNotificationGroup];

    if (v13)
    {
      int v14 = [(NCNotificationGroupList *)self _clockSnoozeAlarmNotificationStaticContentProviderForNotificationRequest:v7 viewController:v11];
      goto LABEL_27;
    }
  }
  else
  {
  }
  long long v15 = [(NCNotificationListPresentableGroup *)self delegate];
  int v16 = [(NCNotificationGroupList *)self contentProviders];
  int v14 = [v16 objectForKey:v7];

  if (!v14)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v15 notificationGroupList:self requestsContentProviderForNotificationRequest:v7],
          (int v14 = (NCNotificationRequestCoalescingContentProvider *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      int v14 = [[NCNotificationRequestCoalescingContentProvider alloc] initWithNotificationRequest:v7];
    }
    int v17 = [(NCNotificationGroupList *)self contentProviders];
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v14, v7);
  }
  [(NCNotificationRequestCoalescingContentProvider *)v14 setDeviceAuthenticated:[(NCNotificationGroupList *)self deviceAuthenticated]];
  int v18 = [(NCNotificationGroupList *)self notificationSectionSettings];
  -[NCNotificationRequestCoalescingContentProvider setSummarizationEnabled:](v14, "setSummarizationEnabled:", [v18 isSummarizationEnabled]);

  id v19 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  if (v19 == v7)
  {
    -[NCNotificationRequestCoalescingContentProvider setShowSummaryFooterText:](v14, "setShowSummaryFooterText:", [v15 shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:self]);
    -[NCNotificationRequestCoalescingContentProvider setShowSummaryTextAsContent:](v14, "setShowSummaryTextAsContent:", [v15 shouldShowSummaryTextAsContentForLeadingNotificationRequestForNotificationGroupList:self]);
    [(NCNotificationGroupList *)self updateLeadingNotificationRequestContentProvider:v14];
    long long v20 = [v15 collapsedSectionSummaryStringForLeadingNotificationRequestForNotificationGroupList:self];
  }
  else
  {
    [(NCNotificationRequestCoalescingContentProvider *)v14 setCollapsedSectionSummaryString:0];
    [(NCNotificationRequestCoalescingContentProvider *)v14 setShowSummaryFooterText:0];
    [(NCNotificationRequestCoalescingContentProvider *)v14 setShowSummaryTextAsContent:0];
    long long v20 = 0;
  }
  [(NCNotificationRequestCoalescingContentProvider *)v14 setCollapsedSectionSummaryString:v20];
  if (([v7 matchesRequest:v19] & 1) == 0)
  {
    [(NCNotificationRequestCoalescingContentProvider *)v14 setOverridenSummaryBuilder:0];
LABEL_25:
    [(NCNotificationRequestCoalescingContentProvider *)v14 setThreadContentSummaryText:0];
    goto LABEL_26;
  }
  long long v21 = [(NCNotificationGroupList *)self summaryBuilder];
  [(NCNotificationRequestCoalescingContentProvider *)v14 setOverridenSummaryBuilder:v21];

  if (v20 || ![(NCNotificationListPresentableGroup *)self isGrouped]) {
    goto LABEL_25;
  }
  long long v22 = [v19 content];
  long long v23 = [v22 threadSummary];
  [(NCNotificationRequestCoalescingContentProvider *)v14 setThreadContentSummaryText:v23];

LABEL_26:
  [(NCNotificationRequestContentProvider *)v14 setDelegate:v11];

LABEL_27:

  return v14;
}

- (void)notificationRequestPresenter:(id)a3 shouldTransitionToStage:(id)a4 forTrigger:(int64_t)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = objc_opt_class();
  id v16 = v9;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v16;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  int v14 = [(NCNotificationListPresentableGroup *)self delegate];
  long long v15 = [v13 notificationRequest];

  [v14 notificationListComponent:self shouldFinishLongLookTransitionForNotificationRequest:v15 trigger:a5 withCompletionBlock:v10];
}

- (void)notificationRequestPresenter:(id)a3 executeAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = v10;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = v16;

  int v18 = [v17 notificationRequest];
  id v19 = [(NCNotificationListPresentableGroup *)self delegate];
  id v20 = [v18 defaultAction];
  if (v20 != v11) {
    goto LABEL_9;
  }
  long long v21 = [v17 presentedExpandedPlatterViewController];
  if (v21)
  {

    id v20 = v11;
LABEL_9:

LABEL_10:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __96__NCNotificationGroupList_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke;
    v23[3] = &unk_1E6A92578;
    id v24 = v13;
    [v19 notificationListComponent:self requestsExecuteAction:v11 forNotificationRequest:v18 requestAuthentication:1 withParameters:v12 completion:v23];

    goto LABEL_11;
  }
  int v22 = [v19 shouldHintDefaultActionForNotificationListBaseComponent:self];

  if (!v22) {
    goto LABEL_10;
  }
  [(NCNotificationGroupList *)self _hintSideSwipeForDefaultActionForNotificationRequest:v18];
  if (v13) {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
LABEL_11:
}

uint64_t __96__NCNotificationGroupList_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)notificationRequestPresenterNotificationUsageTrackingState:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  id v5 = [v4 notificationUsageTrackingStateForNotificationListComponent:self];

  return v5;
}

- (void)notificationViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(NCNotificationListPresentableGroup *)self delegate];
  uint64_t v14 = [v13 notificationRequest];

  [v15 notificationListComponent:self requestPermissionToExecuteAction:v12 forNotificationRequest:v14 withParameters:v11 completion:v10];
}

- (void)notificationViewControllerWillDismissForCancelAction:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  [v5 notificationListComponent:self willDismissLongLookForCancelActionForViewController:v4];
}

- (BOOL)notificationViewControllerShouldInterpretTapAsDefaultAction:(id)a3
{
  return 1;
}

- (int64_t)notificationViewControllerDateFormatStyle:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v4 staticContentProvider];

  id v7 = [v6 date];
  unsigned int v8 = [v5 isDateInToday:v7];

  return v8;
}

- (BOOL)showAdditionalMessageLinesForNotificationViewController:(id)a3
{
  return 1;
}

- (BOOL)notificationViewControllerShouldAllowExpandedPlatterInteraction:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationGroupList *)self _shouldAllowInteractionWithNotificationViewController:v4])
  {
    id v5 = [(NCNotificationListPresentableGroup *)self delegate];
    id v6 = [v4 notificationRequest];
    char v7 = [v5 notificationListComponent:self shouldAllowInteractionsForNotificationRequest:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)notificationViewControllerShouldAllowClickPresentationInteraction:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationGroupList *)self _shouldAllowInteractionWithNotificationViewController:v4])
  {
    id v5 = [(NCNotificationListPresentableGroup *)self delegate];
    id v6 = [v4 notificationRequest];
    char v7 = [v5 notificationListComponent:self shouldAllowInteractionsForNotificationRequest:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)notificationViewControllerContainerViewProviderForExpandedContent:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  id v6 = [v5 notificationListComponent:self containerViewProviderForExpandedContentForViewController:v4];

  return v6;
}

- (CGRect)notificationViewController:(id)a3 initialFrameForPresentingLongLookFromView:(id)a4
{
  id v6 = a4;
  char v7 = [a3 notificationRequest];
  unsigned int v8 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v7];

  id v9 = [v6 superview];
  [v6 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (v8)
  {
    int v18 = [v8 contentView];
    objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    uint64_t v25 = [v8 contentView];
    id v9 = v25;
    double v26 = 0.0;
    double v27 = v20;
    double v28 = v22;
    double v29 = v24;
  }
  else
  {
    uint64_t v25 = v9;
    double v26 = v11;
    double v27 = v13;
    double v28 = v15;
    double v29 = v17;
  }
  objc_msgSend(v25, "convertRect:toView:", 0, v26, v27, v28, v29);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = v31;
  double v39 = v33;
  double v40 = v35;
  double v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (CGRect)notificationViewController:(id)a3 finalFrameForDismissingLongLookFromView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(NCNotificationListPresentableGroup *)self listView];
  id v9 = [v8 window];
  self->_longLookDismissalFinalFrameCalculatedWithoutWindow = v9 == 0;

  double v10 = [v7 notificationRequest];

  double v11 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v10];

  if (v11)
  {
    double v12 = [v11 superview];
    [v11 frame];
    objc_msgSend(v12, "convertRect:toView:", 0);
    double v14 = v13;
    double v16 = v15;

    [v11 frame];
    objc_msgSend(v6, "sizeThatFits:", CGRectGetWidth(v38), 1.79769313e308);
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v21 = [v6 superview];
    [v6 frame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    objc_msgSend(v21, "convertRect:toView:", 0, v23, v25, v27, v29);
    double v14 = v30;
    double v16 = v31;
    double v18 = v32;
    double v20 = v33;
    id v6 = v21;
  }

  double v34 = v14;
  double v35 = v16;
  double v36 = v18;
  double v37 = v20;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)notificationViewController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationListPresentableGroup *)self delegate];
  id v7 = [v6 notificationListComponent:self keyboardAssertionForGestureWindow:v5];

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForNotificationViewController:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  id v5 = [v4 hideHomeAffordanceAnimationSettingsForNotificationListComponent:self];

  return v5;
}

- (id)unhideHomeAffordanceAnimationSettingsForNotificationViewController:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  id v5 = [v4 unhideHomeAffordanceAnimationSettingsForNotificationListComponent:self];

  return v5;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationViewController:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  id v5 = [v4 settleHomeAffordanceAnimationBehaviorDescriptionForNotificationListComponent:self];

  return v5;
}

- (BOOL)notificationViewControllerShouldAllowLongPressGesture:(id)a3
{
  id v3 = self;
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  LOBYTE(v3) = [v4 notificationListComponentShouldAllowLongPressGesture:v3];

  return (char)v3;
}

- (void)notificationViewController:(id)a3 isPerformingHoverHighlighting:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  unsigned int v8 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v7];
  id v9 = [v8 notificationViewController];

  LODWORD(v7) = [(NCNotificationListPresentableGroup *)self isGrouped];
  if (v7 && v9 == v6)
  {
    double v10 = [(NCNotificationGroupList *)self orderedRequests];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke;
    v11[3] = &unk_1E6A94290;
    v11[4] = self;
    BOOL v12 = a4;
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

void __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  id v7 = a2;
  unsigned int v8 = v7;
  if (a3 - 1 <= 1)
  {
    id v9 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke_2;
    v10[3] = &unk_1E6A942B8;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v7;
    char v12 = *(unsigned char *)(a1 + 40);
    [v9 animateWithDuration:v10 animations:0.2];
  }
  *a4 = a3 > 2;
}

void __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _currentCellForNotificationRequest:*(void *)(a1 + 40)];
  v2 = [v3 notificationViewController];
  [v2 setPlatterHighlighted:*(unsigned __int8 *)(a1 + 48)];
}

- (void)notificationViewController:(id)a3 didUpdatePreferredContentSize:(CGSize)a4
{
  double height = a4.height;
  id v6 = a3;
  id v11 = [v6 notificationRequest];
  id v7 = [v6 notificationRequest];

  LODWORD(v6) = [(NCNotificationGroupList *)self containsNotificationRequest:v7];
  if (v6)
  {
    unsigned int v8 = [(NCNotificationListPresentableGroup *)self notificationListCache];
    int v9 = objc_msgSend(v8, "invalidateCachedHeightIfNecessaryForNotificationRequest:updatedHeight:isContentRevealed:", v11, -[NCNotificationGroupList _isContentRevealedForNotificationRequest:](self, "_isContentRevealedForNotificationRequest:", v11), height);

    if (v9)
    {
      double v10 = [(NCNotificationListPresentableGroup *)self listView];
      [v10 setNeedsLayout];
    }
  }
}

- (BOOL)isRichNotificationContentViewForNotificationViewController:(id)a3
{
  id v3 = self;
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  LOBYTE(v3) = [v4 isRichNotificationContentViewForNotificationGroupList:v3];

  return (char)v3;
}

- (BOOL)isAttachmentImageFeaturedForNotificationViewController:(id)a3
{
  id v3 = self;
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  LOBYTE(v3) = [v4 isAttachmentImageFeaturedForNotificationGroupList:v3];

  return (char)v3;
}

- (BOOL)handleTapOnNotificationViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  [v5 notificationListBaseComponentDidSignificantUserInteraction:self];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v5 handleTapOnNotificationListBaseComponent:self] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [v4 notificationRequest];
    BOOL v6 = [(NCNotificationGroupList *)self _handleTapToExpandGroupForNotificationRequest:v7];
  }
  return v6;
}

- (BOOL)shouldAlignContentToBottomForNotificationViewController:(id)a3
{
  id v4 = [a3 notificationRequest];
  id v5 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  if (v5 == v4)
  {
    id v7 = [(NCNotificationListPresentableGroup *)self delegate];
    char v6 = [v7 shouldAlignContentToBottomForLeadingNotificationRequestForNotificationGroupList:self];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)importantAdornmentEligibleOptionsForNotificationViewController:(id)a3
{
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  unint64_t v5 = [v4 importantAdornmentEligibleOptionsForNotificationGroupList:self];

  return v5;
}

- (void)notificationViewController:(id)a3 willPresentLongLookForRequst:(id)a4 animator:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  unsigned int v8 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 notificationListComponent:self willPresentLongLookForRequst:v9 animator:v7];
  }
}

- (void)notificationViewController:(id)a3 dismissPresentLongLookForRequst:(id)a4 animator:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  unsigned int v8 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 notificationListComponent:self dismissPresentLongLookForRequst:v9 animator:v7];
  }
}

- (id)notificationViewController:(id)a3 auxiliaryOptionsContentProviderForNotificationRequest:(id)a4 withLongLook:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  unsigned int v8 = [(NCNotificationListPresentableGroup *)self delegate];
  if (![(NCNotificationListPresentableGroup *)self isGrouped]) {
    goto LABEL_4;
  }
  id v9 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  if ([v9 matchesRequest:v7])
  {
    char v10 = [v8 isNotificationGroupListInCollapsedStack:self];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      id v11 = [v8 notificationGroupList:self requestsAuxiliaryOptionsContentProviderForNotificationRequest:v7 isLongLook:v5];
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v11 = 0;
LABEL_7:

  return v11;
}

- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCNotificationListPresentableGroup *)self delegate];
  [v11 notificationListComponent:self requestsPresentingManagementViewForNotificationRequest:v10 managementViewType:a4 withPresentingView:v9 completion:0];
}

- (void)notificationViewControllerWillBeginUserInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  [v5 notificationListBaseComponent:self didBeginUserInteractionWithViewController:v4];
}

- (void)notificationViewControllerDidEndUserInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  [v5 notificationListBaseComponent:self didEndUserInteractionWithViewController:v4];
}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  [v5 notificationListComponent:self isPresentingLongLookForViewController:v4];
}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  id v4 = a3;
  int v5 = [v4 shouldRestorePresentingShortLookOnDismiss];
  char v6 = [v4 view];
  [v6 setHidden:v5 ^ 1u];

  id v7 = [v4 notificationRequest];

  id v9 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v7];

  if ((v5 & 1) == 0 && [(NCNotificationListPresentableGroup *)self isGrouped])
  {
    [(NCNotificationGroupList *)self _reloadNotificationCellAtIndex:1];
    unsigned int v8 = [(NCNotificationListPresentableGroup *)self listView];
    [v8 revealNotificationContentBelowGroupedViewIfNecessary:v9];
  }
}

- (void)longLookDidDismissForNotificationViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    char v6 = v5;
    id v7 = [(NCNotificationGroupList *)self logDescription];
    unsigned int v8 = [v4 notificationRequest];
    id v9 = [v8 notificationIdentifier];
    id v10 = objc_msgSend(v9, "un_logDigest");
    int v15 = 138543618;
    double v16 = v7;
    __int16 v17 = 2114;
    double v18 = v10;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did dismiss long look for notification request %{public}@", (uint8_t *)&v15, 0x16u);
  }
  id v11 = [(NCNotificationGroupList *)self cellRecycledWhilePresentingLongLook];
  id v12 = [v11 notificationViewController];

  if (v12 == v4)
  {
    [(NCNotificationGroupList *)self recycleView:v11];
    [(NCNotificationGroupList *)self setCellRecycledWhilePresentingLongLook:0];
  }
  else if (self->_longLookDismissalFinalFrameCalculatedWithoutWindow)
  {
    double v13 = [v4 notificationRequest];
    [(NCNotificationGroupList *)self reloadNotificationRequest:v13];

    self->_longLookDismissalFinalFrameCalculatedWithoutWindow = 0;
  }
  double v14 = [(NCNotificationListPresentableGroup *)self delegate];
  [v14 notificationListComponent:self isPresentingLongLookForViewController:0];
}

- (BOOL)shouldContinuePresentingActionButtonsForNotificationListCell:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  id v6 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v5];

  if (v6 == v4) {
    LOBYTE(v7) = 1;
  }
  else {
    BOOL v7 = ![(NCNotificationListPresentableGroup *)self isGrouped];
  }

  return v7;
}

- (BOOL)shouldShowSupplementaryActionsForNotificationListCell:(id)a3
{
  id v4 = [(NCNotificationGroupList *)self _requestForListCell:a3];
  if ([(NCNotificationGroupList *)self _allowPanningForRequest:v4]) {
    BOOL v5 = [(NCNotificationGroupList *)self _shouldShowOptionsActionForRequest:v4]
  }
      || [(NCNotificationGroupList *)self _shouldShowViewActionForRequest:v4]
      || [(NCNotificationGroupList *)self _shouldShowClearActionForRequest:v4];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)supplementaryActionsForNotificationListCell:(id)a3
{
  id v4 = [(NCNotificationGroupList *)self _requestForListCell:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NCNotificationGroupList *)self _shouldShowOptionsActionForRequest:v4])
  {
    id v6 = [(NCNotificationGroupList *)self _optionsActionForRequest:v4];
    [v5 addObject:v6];
  }
  if ([(NCNotificationGroupList *)self _shouldShowViewActionForRequest:v4])
  {
    BOOL v7 = [(NCNotificationGroupList *)self _presentLongLookActionWithViewTitleForRequest:v4];
    [v5 addObject:v7];
  }
  if ([(NCNotificationGroupList *)self _shouldShowClearActionForRequest:v4])
  {
    unsigned int v8 = [(NCNotificationListPresentableGroup *)self listView];
    if ([v8 isGrouped]) {
      BOOL v9 = [(NCNotificationGroupList *)self notificationCount] > 1;
    }
    else {
      BOOL v9 = 0;
    }

    id v10 = [(NCNotificationGroupList *)self _clearActionForRequest:v4 clearAll:v9];
    [v5 addObject:v10];
  }

  return v5;
}

- (id)defaultActionForNotificationListCell:(id)a3
{
  id v4 = [(NCNotificationGroupList *)self _requestForListCell:a3];
  if ([(NCNotificationGroupList *)self _shouldShowOpenActionToPerformLongLookPresentationForRequest:v4])
  {
    [(NCNotificationGroupList *)self _presentLongLookActionWithOpenTitleForRequest:v4];
  }
  else
  {
    [(NCNotificationGroupList *)self _openActionForRequest:v4];
  id v5 = };

  return v5;
}

- (BOOL)shouldShowDefaultActionForNotificationListCell:(id)a3
{
  id v4 = [(NCNotificationGroupList *)self _requestForListCell:a3];
  if ([(NCNotificationGroupList *)self _allowPanningForRequest:v4]) {
    BOOL v5 = [(NCNotificationGroupList *)self _shouldShowOpenActionToPerformDefaultActionForRequest:v4]|| [(NCNotificationGroupList *)self _shouldShowOpenActionToPerformLongLookPresentationForRequest:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldVerticallyStackActionButtonsForNotificationListCell:(id)a3
{
  id v3 = self;
  id v4 = [(NCNotificationListPresentableGroup *)self delegate];
  LOBYTE(v3) = [v4 isAttachmentImageFeaturedForNotificationGroupList:v3];

  return (char)v3;
}

- (void)_loadLeadingNotificationRequestCellIfNecessary
{
  id v3 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  id v4 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v3];

  if (!v4)
  {
    id v6 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    id v5 = [(NCNotificationGroupList *)self _cachedCellForNotificationRequest:v6 createNewIfNecessary:1 shouldConfigure:1 forceShowContent:1];
  }
}

- (void)_reloadAllNotificationRequests
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:*(void *)(*((void *)&v8 + 1) + 8 * v7++) animated:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_reloadNotificationViewForNotificationRequest:(id)a3 animated:(BOOL)a4
{
}

- (void)_reloadNotificationViewForNotificationRequest:(id)a3 forceReloadView:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    long long v9 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v8];
    long long v10 = v9;
    if (v9)
    {
      [v9 hideActionButtonsAnimated:1 fastAnimation:0 completion:0];
      long long v11 = [v10 notificationViewController];
      id v12 = [v11 delegate];

      if (v12 != self) {
        [v11 setDelegate:self];
      }
      id v13 = [v11 notificationRequest];

      if (v13 == v8) {
        [v11 invalidateContentProviders];
      }
      else {
        [v11 setNotificationRequest:v8];
      }
      double v14 = [v11 view];
      int v15 = [v14 isHidden];

      if (v15)
      {
        double v16 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
          -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:forceReloadView:animated:](v16, self, v8);
        }
        __int16 v17 = [v11 view];
        [v17 setHidden:0];
      }
      double v18 = [(NCNotificationGroupList *)self animator];
      if (v5)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __98__NCNotificationGroupList__reloadNotificationViewForNotificationRequest_forceReloadView_animated___block_invoke;
        v24[3] = &unk_1E6A91BB0;
        uint64_t v19 = &v25;
        id v25 = v11;
        [v18 animateUsingSpringWithTension:1 friction:0 interactive:v24 type:0 animations:240.0 completion:20.0];
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __98__NCNotificationGroupList__reloadNotificationViewForNotificationRequest_forceReloadView_animated___block_invoke_2;
        v22[3] = &unk_1E6A91BB0;
        uint64_t v19 = &v23;
        id v23 = v11;
        [v18 performWithoutAnimation:v22];
      }

      if (v6)
      {
        double v20 = [(NCNotificationListPresentableGroup *)self listView];
        double v21 = [(NCNotificationGroupList *)self orderedRequests];
        objc_msgSend(v20, "reloadViewAtIndex:", objc_msgSend(v21, "indexOfObject:", v8));
      }
    }
  }
}

uint64_t __98__NCNotificationGroupList__reloadNotificationViewForNotificationRequest_forceReloadView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContent];
}

uint64_t __98__NCNotificationGroupList__reloadNotificationViewForNotificationRequest_forceReloadView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContent];
}

- (void)_scrollToTopIfNecessaryAndPerformBlock:(id)a3
{
  id v8 = (void (**)(void))a3;
  uint64_t v4 = [(NCNotificationListPresentableGroup *)self delegate];
  int v5 = [v4 shouldScrollToTopForNotificationListBaseComponent:self];
  BOOL v6 = [(NCNotificationListPresentableGroup *)self listView];
  int v7 = [v6 isVisibleForViewAtIndex:0];

  if (!v7 || v5)
  {
    [v4 notificationListPresentableGroup:self requestsScrollToTopOfCollectionWithCompletion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (id)purposeWithSensitiveTextHashed:(BOOL)a3
{
  threadIdentifier = self->_threadIdentifier;
  if (threadIdentifier)
  {
    if (a3)
    {
      int v5 = [(NSString *)threadIdentifier un_logDigest];
    }
    else
    {
      int v5 = threadIdentifier;
    }
    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = @"<Nil>";
  }
  int v7 = [NSString stringWithFormat:@"Bundle:%@;Thread:%@", self->_sectionIdentifier, v6];

  return v7;
}

- (void)toggleGroupedState
{
  id v3 = a1;
  uint64_t v4 = [a2 logDescription];
  int v5 = [a2 leadingNotificationRequest];
  BOOL v6 = [v5 notificationIdentifier];
  id v13 = objc_msgSend(v6, "un_logDigest");
  OUTLINED_FUNCTION_1_3(&dword_1D7C04000, v7, v8, "%{public}@ Reloading stale cell for request %{public}@ prior to collapsing", v9, v10, v11, v12, 2u);
}

void __45__NCNotificationGroupList_toggleGroupedState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = [v5 isDeviceAuthenticated];
  if (v6 != [*(id *)(a1 + 32) deviceAuthenticated])
  {
    objc_msgSend(v5, "setDeviceAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "deviceAuthenticated"));
    [*(id *)(a1 + 32) _reloadNotificationViewForNotificationRequest:v7 animated:1];
  }
}

- (void)_hintSideSwipeForDefaultActionForNotificationRequest:(id)a3
{
  id v3 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:a3];
  if (v3)
  {
    id v4 = v3;
    [v3 hintSideSwipeForDefaultAction];
    id v3 = v4;
  }
}

- (void)_updateSummariesForNewLeadingNotificationRequest:(id)a3 oldLeadingNotificationRequest:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  id v7 = [(NCNotificationListPresentableGroup *)self delegate];
  uint64_t v8 = [(NCNotificationGroupList *)self summaryBuilder];
  uint64_t v9 = [(NCNotificationGroupList *)self orderedRequests];
  [v8 updateWithNotificationRequests:v9];

  int v10 = [v7 shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:self];
  if (v16 != v6)
  {
    if (v6)
    {
      if (v16)
      {
        uint64_t v11 = [(NCNotificationGroupList *)self contentProviders];
        uint64_t v12 = [v11 objectForKey:v16];
        [v12 setOverridenSummaryBuilder:0];

        id v13 = [(NCNotificationGroupList *)self contentProviders];
        double v14 = [v13 objectForKey:v16];
        [v14 setThreadContentSummaryText:0];

        if (v10)
        {
          int v15 = [(NCNotificationListPresentableGroup *)self notificationListCache];
          [v15 clearCachedHeightsForNotificationRequest:v16];

          [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v16 animated:1];
        }
      }
    }
  }
}

- (void)_updateSummariesForLeadingNotificationRequest:(id)a3 forceReload:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(NCNotificationListPresentableGroup *)self notificationListCache];
  [v6 clearCachedHeightsForNotificationRequest:v15];

  id v7 = [(NCNotificationGroupList *)self contentProviders];
  uint64_t v8 = [v7 objectForKey:v15];
  uint64_t v9 = [(NCNotificationGroupList *)self summaryBuilder];
  [v8 setOverridenSummaryBuilder:v9];

  int v10 = [(NCNotificationGroupList *)self contentProviders];
  uint64_t v11 = [v10 objectForKey:v15];
  uint64_t v12 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  id v13 = [v12 content];
  double v14 = [v13 threadSummary];
  [v11 setThreadContentSummaryText:v14];

  [(NCNotificationGroupList *)self _reloadNotificationViewForNotificationRequest:v15 forceReloadView:v4 animated:1];
}

- (id)_cachedCellForNotificationRequest:(id)a3 createNewIfNecessary:(BOOL)a4 shouldConfigure:(BOOL)a5 forceShowContent:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = [(NCNotificationListPresentableGroup *)self notificationListCache];
  uint64_t v12 = [v11 listCellForNotificationRequest:v10 viewControllerDelegate:self createNewIfNecessary:v8 shouldConfigure:v7];

  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = [(NCNotificationGroupList *)self cellRecycledWhilePresentingLongLook];
  if (v12 == (void *)v13)
  {
    [(NCNotificationGroupList *)self setCellRecycledWhilePresentingLongLook:0];
    goto LABEL_11;
  }
  double v14 = (void *)v13;
  id v15 = [v12 notificationViewController];
  [v15 addObserver:self];
  id v16 = [(NCNotificationListPresentableGroup *)self materialGroupNameBase];
  [v15 setMaterialGroupNameBase:v16];
  __int16 v17 = [v15 parentViewController];

  if (!v17)
  {
    uint64_t v19 = [(NCNotificationListPresentableGroup *)self delegate];
    [v19 notificationListBaseComponent:self didAddViewController:v15];

    if (a6) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v18 = [v15 isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController] ^ 1;
    goto LABEL_9;
  }
  if (!a6) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v18 = 0;
LABEL_9:
  double v20 = [v15 view];
  [v20 setHidden:v18];

  [v12 setActionProvider:self];
  [v12 setActionHandler:self];
  [v12 setMaterialGroupNameBase:v16];
  objc_msgSend(v12, "setMaterialRecipe:", objc_msgSend(v15, "materialRecipe"));
  [v12 setBackgroundAlpha:self->_individualCellBackgroundAlpha];
  [v12 setContentAlpha:1.0];
  [v12 setDateAlpha:1.0];
  [v12 setHideDate:0];

LABEL_10:
  id v21 = v12;
LABEL_11:

  return v12;
}

- (id)_currentCellForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self notificationListCache];
  id v6 = [v5 listCellForNotificationRequest:v4 viewControllerDelegate:self createNewIfNecessary:0 shouldConfigure:0];

  return v6;
}

- (double)_cachedHeightForNotificationRequest:(id)a3 isLeadingNotificationRequest:(BOOL)a4 withWidth:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(NCNotificationListPresentableGroup *)self isGrouped] ^ 1 | v6;
  id v10 = [(NCNotificationListPresentableGroup *)self notificationListCache];
  objc_msgSend(v10, "heightForNotificationRequest:withFrameWidth:isContentRevealed:shouldCalculateHeight:", v8, -[NCNotificationGroupList _isContentRevealedForNotificationRequest:](self, "_isContentRevealedForNotificationRequest:", v8), v9, a5);
  double v12 = v11;

  return v12;
}

- (id)_requestForListCell:(id)a3
{
  id v3 = [a3 notificationViewController];
  id v4 = [v3 notificationRequest];

  return v4;
}

- (BOOL)_allowPanningForRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  int v6 = [v5 shouldNotificationGroupListPanHorizontally:self];

  if (v6)
  {
    if ([(NCNotificationListPresentableGroup *)self isGrouped])
    {
      BOOL v7 = [(NCNotificationGroupList *)self leadingNotificationRequest];
      int v8 = [v4 matchesRequest:v7];
    }
    else
    {
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v9 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    double v11 = [v4 notificationIdentifier];
    double v12 = objc_msgSend(v11, "un_logDigest");
    BOOL v13 = [(NCNotificationListPresentableGroup *)self isGrouped];
    double v14 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    id v15 = [v14 notificationIdentifier];
    id v16 = objc_msgSend(v15, "un_logDigest");
    int v18 = 138544386;
    uint64_t v19 = v12;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v13;
    __int16 v24 = 2114;
    id v25 = v16;
    __int16 v26 = 1024;
    int v27 = v8;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "Group list determining pan eligibility = %{public}@ delegateCheck: %{BOOL}d isGrouped: %{BOOL}d leadingNotificationRequest: %{public}@ [ shouldPanHorizontally = %{BOOL}d ]", (uint8_t *)&v18, 0x28u);
  }
  return v8;
}

- (BOOL)_shouldShowOptionsActionForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  int v6 = [v4 topLevelSectionIdentifier];

  BOOL v7 = [v5 notificationListComponent:self sectionSettingsForSectionIdentifier:v6];

  LOBYTE(v4) = [v7 isUserConfigurable];
  return (char)v4;
}

- (BOOL)_shouldShowViewActionForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListPresentableGroup *)self delegate];
  LOBYTE(self) = [v5 notificationListComponent:self shouldAllowInteractionsForNotificationRequest:v4];

  return self ^ 1;
}

- (BOOL)_shouldShowClearActionForRequest:(id)a3
{
  id v3 = [a3 options];
  char v4 = [v3 hideClearActionInList] ^ 1;

  return v4;
}

- (BOOL)_shouldShowOpenActionToPerformDefaultActionForRequest:(id)a3
{
  char v4 = [a3 defaultAction];
  if (v4)
  {
    id v5 = [(NCNotificationListPresentableGroup *)self delegate];
    char v6 = [v5 shouldHintDefaultActionForNotificationListBaseComponent:self];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowOpenActionToPerformLongLookPresentationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 defaultAction];
  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    BOOL v7 = [v4 options];
    if ([v7 revealsAdditionalContentIfNoDefaultAction])
    {
      int v8 = [(NCNotificationListPresentableGroup *)self delegate];
      char v6 = [v8 shouldHintDefaultActionForNotificationListBaseComponent:self];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (id)_openActionForRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  char v6 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v7 = [v6 localizedStringForKey:@"NOTIFICATION_LIST_OPEN" value:&stru_1F2F516F8 table:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__NCNotificationGroupList__openActionForRequest___block_invoke;
  v12[3] = &unk_1E6A93D50;
  objc_copyWeak(&v14, &location);
  id v8 = v4;
  id v13 = v8;
  uint64_t v9 = [v5 actionWithTitle:v7 image:0 identifier:@"NCNotificationGroupListActionIdentifierOpen" handler:v12];

  id v10 = [(NCNotificationListPresentableGroup *)self delegate];
  LOBYTE(self) = [v10 isAttachmentImageFeaturedForNotificationGroupList:self];

  if ((self & 1) == 0) {
    objc_msgSend(v9, "setPl_defaultAction:", 1);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __49__NCNotificationGroupList__openActionForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) defaultAction];
    [WeakRetained _performAction:v2 forNotificationRequest:*(void *)(a1 + 32) withCompletion:0];
  }
}

- (id)_optionsActionForRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  char v6 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v7 = [v6 localizedStringForKey:@"NOTIFICATION_LIST_OPTIONS" value:&stru_1F2F516F8 table:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__NCNotificationGroupList__optionsActionForRequest___block_invoke;
  v11[3] = &unk_1E6A93D50;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v5 actionWithTitle:v7 image:0 identifier:@"NCNotificationGroupListActionIdentifierOptions" handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __52__NCNotificationGroupList__optionsActionForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _executeOptionsActionForRequest:*(void *)(a1 + 32) action:v5];
  }
}

- (void)_executeOptionsActionForRequest:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(NCNotificationListPresentableGroup *)self delegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke;
  v10[3] = &unk_1E6A94330;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [v8 notificationListComponent:self requestsPresentingOptionsMenuForNotificationRequest:v9 presentingViewProvider:v10 optionsForSection:0 completion:0];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained _currentCellForNotificationRequest:*(void *)(a1 + 32)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke_2;
    v8[3] = &unk_1E6A94308;
    id v9 = v6;
    id v10 = v3;
    id v7 = v6;
    [v7 revealSupplementaryActionsWithCompletion:v8];
  }
}

uint64_t __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) senderForActionWithIdentifier:@"NCNotificationGroupListActionIdentifierOptions"];
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return MEMORY[0x1F4181820]();
}

- (id)_presentLongLookActionWithOpenTitleForRequest:(id)a3
{
  id v4 = a3;
  id v5 = NCUserNotificationsUIKitFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"NOTIFICATION_LIST_OPEN" value:&stru_1F2F516F8 table:0];
  id v7 = [(NCNotificationGroupList *)self _presentLongLookActionForRequest:v4 title:v6 identifier:@"NCNotificationGroupListActionIdentifierOpen"];

  return v7;
}

- (id)_presentLongLookActionWithViewTitleForRequest:(id)a3
{
  id v4 = a3;
  id v5 = NCUserNotificationsUIKitFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"NOTIFICATION_LIST_VIEW" value:&stru_1F2F516F8 table:0];
  id v7 = [(NCNotificationGroupList *)self _presentLongLookActionForRequest:v4 title:v6 identifier:@"NCNotificationGroupListActionIdentifierView"];

  return v7;
}

- (id)_presentLongLookActionForRequest:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)MEMORY[0x1E4FB13F0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__NCNotificationGroupList__presentLongLookActionForRequest_title_identifier___block_invoke;
  v15[3] = &unk_1E6A93D50;
  objc_copyWeak(&v17, &location);
  id v12 = v8;
  id v16 = v12;
  id v13 = [v11 actionWithTitle:v9 image:0 identifier:v10 handler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __77__NCNotificationGroupList__presentLongLookActionForRequest_title_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _executeViewActionForRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_executeViewActionForRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__NCNotificationGroupList__executeViewActionForRequest___block_invoke;
  v7[3] = &unk_1E6A92FE0;
  objc_copyWeak(&v9, &location);
  id v6 = v5;
  id v8 = v6;
  [v6 hideActionButtonsAnimated:1 fastAnimation:1 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__NCNotificationGroupList__executeViewActionForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained delegate];
    id v4 = [*(id *)(a1 + 32) notificationViewController];
    [v3 notificationListBaseComponent:v6 didBeginUserInteractionWithViewController:v4];

    id v5 = [*(id *)(a1 + 32) notificationViewController];
    [v5 presentLongLookAnimated:1 trigger:3 completion:0];

    id WeakRetained = v6;
  }
}

- (id)_clearActionForRequest:(id)a3 clearAll:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = NCUserNotificationsUIKitFrameworkBundle();
  id v8 = v7;
  if (v4) {
    id v9 = @"NOTIFICATION_LIST_CLEAR_ALL_CELL";
  }
  else {
    id v9 = @"NOTIFICATION_LIST_CLEAR";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_1F2F516F8 table:0];

  objc_initWeak(&location, self);
  id v11 = (void *)MEMORY[0x1E4FB13F0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__NCNotificationGroupList__clearActionForRequest_clearAll___block_invoke;
  v17[3] = &unk_1E6A93D50;
  objc_copyWeak(&v19, &location);
  id v12 = v6;
  id v18 = v12;
  id v13 = [v11 actionWithTitle:v10 image:0 identifier:@"NCNotificationGroupListActionIdentifierClear" handler:v17];
  id v14 = [(NCNotificationListPresentableGroup *)self delegate];
  char v15 = [v14 isAttachmentImageFeaturedForNotificationGroupList:self];

  if ((v15 & 1) == 0) {
    objc_msgSend(v13, "setPl_defaultAction:", 1);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __59__NCNotificationGroupList__clearActionForRequest_clearAll___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _executeClearActionForRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_executeClearActionForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v4];
  id v6 = [v5 notificationViewController];

  id v7 = +[NCNotificationEventTracker sharedInstance];
  id v8 = [v6 notificationUsageTrackingState];
  [v7 shortLookClearedForNotificationRequest:v4 withState:v8];

  id v9 = *MEMORY[0x1E4FB3778];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3778]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_DISMISSAL_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  id v10 = [(NCNotificationListPresentableGroup *)self delegate];
  if ([(NCNotificationListPresentableGroup *)self isGrouped])
  {
    [(NCNotificationGroupList *)self setClearingAllNotificationRequestsForCellHorizontalSwipe:1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v12 = [(NCNotificationGroupList *)self orderedRequests];
    id v13 = (void *)[v12 copy];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __57__NCNotificationGroupList__executeClearActionForRequest___block_invoke;
    id v18 = &unk_1E6A92BA0;
    id v19 = self;
    id v20 = v11;
    id v14 = v11;
    [v13 enumerateObjectsUsingBlock:&v15];
    objc_msgSend(v10, "notificationListBaseComponentDidRemoveAll:", self, v15, v16, v17, v18, v19);
    [v10 notificationListBaseComponent:self requestsClearingPresentables:v14];
  }
  else
  {
    if ([(NCNotificationGroupList *)self count] == 1) {
      [(NCNotificationGroupList *)self setClearingAllNotificationRequestsForCellHorizontalSwipe:1];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 notificationListComponent:self willRemoveNotificationRequest:v4];
    }
    [(NCNotificationGroupList *)self removeNotificationRequest:v4];
    [v10 notificationListComponent:self didRemoveNotificationRequest:v4];
    id v13 = [v4 clearAction];
    [(NCNotificationGroupList *)self _performAction:v13 forNotificationRequest:v4 withCompletion:0];
  }

  [v10 notificationListComponentChangedContent:self];
}

void __57__NCNotificationGroupList__executeClearActionForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 removeNotificationRequest:v4];
  [*(id *)(a1 + 40) addObject:v4];
}

- (void)_performAction:(id)a3 forNotificationRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NCNotificationListPresentableGroup *)self delegate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__NCNotificationGroupList__performAction_forNotificationRequest_withCompletion___block_invoke;
  v13[3] = &unk_1E6A92578;
  id v14 = v8;
  id v12 = v8;
  [v11 notificationListComponent:self requestsExecuteAction:v10 forNotificationRequest:v9 requestAuthentication:1 withParameters:MEMORY[0x1E4F1CC08] completion:v13];
}

uint64_t __80__NCNotificationGroupList__performAction_forNotificationRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_clockSnoozeAlarmNotificationStaticContentProviderForNotificationRequest:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NCNotificationGroupList *)self clockSnoozeAlarmContentProviders];
  id v9 = [v8 objectForKey:v6];

  if (!v9
    || ([v9 viewController], id v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 != v7))
  {
    [v9 invalidateTimer];
    id v11 = [[NCSnoozeAlarmNotificationStaticContentProvider alloc] initWithNotificationRequest:v6 viewController:v7];

    id v12 = [(NCNotificationGroupList *)self clockSnoozeAlarmContentProviders];
    objc_msgSend(v12, "bs_setSafeObject:forKey:", v11, v6);

    id v9 = v11;
  }

  return v9;
}

- (void)_invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:(id)a3
{
  id v7 = a3;
  id v4 = [(NCNotificationGroupList *)self clockSnoozeAlarmContentProviders];
  id v5 = [v4 objectForKey:v7];

  if (v5)
  {
    [v5 invalidateTimer];
    id v6 = [(NCNotificationGroupList *)self clockSnoozeAlarmContentProviders];
    [v6 removeObjectForKey:v7];
  }
}

- (unint64_t)_lockScreenPersistenceForNotificationRequest:(id)a3
{
  id v3 = [a3 options];
  unint64_t v4 = [v3 lockScreenPersistence];

  return v4;
}

- (unint64_t)_lockScreenPriorityForNotificationRequest:(id)a3
{
  id v3 = [a3 options];
  unint64_t v4 = [v3 lockScreenPriority];

  return v4;
}

- (unint64_t)_existingIndexForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationGroupList *)self orderedRequests];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__NCNotificationGroupList__existingIndexForNotificationRequest___block_invoke;
  v9[3] = &unk_1E6A92790;
  id v6 = v4;
  id v10 = v6;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 isCriticalAlert]) {
      unint64_t v7 = [(NCNotificationGroupList *)self _existingIndexForCriticalNotificationRequest:v6];
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v7;
}

uint64_t __64__NCNotificationGroupList__existingIndexForNotificationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

- (unint64_t)_existingIndexForCriticalNotificationRequest:(id)a3
{
  id v4 = a3;
  if ([v4 isCriticalAlert]
    && ([(NCNotificationGroupList *)self sectionIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 sectionIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    id v8 = [(NCNotificationGroupList *)self orderedRequests];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__NCNotificationGroupList__existingIndexForCriticalNotificationRequest___block_invoke;
    v11[3] = &unk_1E6A92790;
    id v12 = v4;
    unint64_t v9 = [v8 indexOfObjectPassingTest:v11];
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __72__NCNotificationGroupList__existingIndexForCriticalNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 notificationIdentifier];
  id v5 = [v3 notificationIdentifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (unint64_t)_insertionIndexForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v6 = [(NCNotificationGroupList *)self orderedRequests];
  uint64_t v7 = [v6 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__NCNotificationGroupList__insertionIndexForNotificationRequest___block_invoke;
  v10[3] = &unk_1E6A94358;
  void v10[4] = self;
  unint64_t v8 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v7, 1280, v10);

  return v8;
}

uint64_t __65__NCNotificationGroupList__insertionIndexForNotificationRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareNotificationRequest:a2 withNotificationRequest:a3];
}

- (int64_t)_compareNotificationRequest:(id)a3 withNotificationRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NCNotificationGroupList *)self _lockScreenPriorityForNotificationRequest:v6];
  unint64_t v9 = [(NCNotificationGroupList *)self _lockScreenPriorityForNotificationRequest:v7];
  unint64_t v10 = [(NCNotificationGroupList *)self _lockScreenPersistenceForNotificationRequest:v6];
  unint64_t v11 = [(NCNotificationGroupList *)self _lockScreenPersistenceForNotificationRequest:v7];
  if (v8 == v9)
  {
    if (v10 == v11)
    {
      id v12 = [v7 timestamp];
      id v13 = [v6 timestamp];
      int64_t v14 = [v12 compare:v13];
    }
    else if (v10 == 2)
    {
      int64_t v14 = -1;
    }
    else
    {
      int64_t v14 = 1;
    }
  }
  else if (v8 > v9)
  {
    int64_t v14 = -1;
  }
  else
  {
    int64_t v14 = 1;
  }

  return v14;
}

- (BOOL)_isContentRevealedForNotificationRequest:(id)a3
{
  id v4 = [a3 options];
  uint64_t v5 = [v4 contentPreviewSetting];

  if (!v5) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }

  return [(NCNotificationGroupList *)self deviceAuthenticated];
}

- (void)_reloadNotificationCellAtIndex:(unint64_t)a3
{
  if ([(NCNotificationGroupList *)self count] > a3)
  {
    uint64_t v5 = [(NCNotificationGroupList *)self orderedRequests];
    id v6 = [v5 objectAtIndex:a3];

    if (v6)
    {
      [(NCNotificationGroupList *)self _reloadRecycledNotificationCellForRequest:v6];
    }
  }
}

- (void)_reloadRecycledGroupedNotificationCells
{
  for (uint64_t i = 1; i != 3; ++i)
    [(NCNotificationGroupList *)self _reloadNotificationCellAtIndex:i];
}

- (void)_reloadRecycledNotificationCellForRequest:(id)a3
{
  id v10 = a3;
  id v4 = -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:");
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 notificationViewController];
    id v7 = [(NCNotificationListPresentableGroup *)self listView];
    objc_msgSend(v6, "setNotificationContentViewHidden:", objc_msgSend(v7, "isHiddenBelowStack"));

    [v6 setPlatterHighlighted:0];
    [v6 addObserver:self];
    unint64_t v8 = [v6 delegate];

    if (v8 != self) {
      [v6 setDelegate:self];
    }
    id v9 = [v6 notificationRequest];

    if (v9 == v10) {
      [v6 invalidateContentProviders];
    }
    else {
      objc_msgSend(v6, "setNotificationRequest:");
    }
    [v6 updateContent];
  }
}

- (BOOL)_shouldAllowInteractionWithNotificationViewController:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NCNotificationListPresentableGroup *)self delegate];
  int v6 = [v5 isViewVisibleForNotificationGroupList:self];

  id v7 = [(NCNotificationGroupList *)self leadingNotificationRequest];
  unint64_t v8 = [(NCNotificationGroupList *)self _currentCellForNotificationRequest:v7];
  id v9 = [v8 notificationViewController];

  BOOL v10 = v9 == v4;
  if (v6)
  {
    if (![(NCNotificationListPresentableGroup *)self isGrouped]
      && [(NCNotificationGroupList *)self count] > 1)
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  unint64_t v11 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    id v12 = [(NCNotificationGroupList *)self logDescription];
    id v13 = [v4 notificationRequest];
    int64_t v14 = [v13 notificationIdentifier];
    uint64_t v15 = objc_msgSend(v14, "un_logDigest");
    *(_DWORD *)buf = 138544898;
    id v19 = v12;
    __int16 v20 = 2114;
    int v21 = v15;
    __int16 v22 = 1024;
    int v23 = v6;
    __int16 v24 = 1024;
    BOOL v25 = [(NCNotificationListPresentableGroup *)self isGrouped];
    __int16 v26 = 2048;
    unint64_t v27 = [(NCNotificationGroupList *)self count];
    __int16 v28 = 1024;
    BOOL v29 = v9 == v4;
    __int16 v30 = 1024;
    BOOL v31 = v10;
    _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ should allow interaction with request %{public}@: [visible=%{BOOL}d \t grouped=%{BOOL}d \t count=%ld \t leadingRequest=%{BOOL}d] = %{BOOL}d", buf, 0x38u);
  }
  return v10;
}

- (BOOL)_handleTapToExpandGroupForNotificationRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 options];
  uint64_t v6 = [v5 contentPreviewSetting];

  id v7 = [v4 sectionIdentifier];
  unint64_t v8 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v7];
  int v9 = [v8 isLocked];
  BOOL v10 = [v4 options];
  int v11 = [v10 coalescesWhenLocked];
  if (v6 == 2) {
    int v12 = v9;
  }
  else {
    int v12 = 1;
  }
  if (v11 || !v12)
  {

    goto LABEL_12;
  }
  BOOL v13 = [(NCNotificationListPresentableGroup *)self isGrouped];

  if (!v13)
  {
LABEL_12:
    BOOL v22 = 0;
    goto LABEL_15;
  }
  int64_t v14 = [v4 options];
  uint64_t v15 = [v14 contentPreviewSetting];

  if (v15)
  {
    uint64_t v16 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      id v18 = [(NCNotificationGroupList *)self logDescription];
      id v19 = [v4 notificationIdentifier];
      __int16 v20 = objc_msgSend(v19, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      unint64_t v27 = v18;
      __int16 v28 = 2114;
      BOOL v29 = v20;
      _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "Expanding notification group %{public}@ for tap on request %{public}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    int v21 = [(NCNotificationListPresentableGroup *)self delegate];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__NCNotificationGroupList__handleTapToExpandGroupForNotificationRequest___block_invoke;
    v24[3] = &unk_1E6A91A18;
    objc_copyWeak(&v25, (id *)buf);
    [v21 notificationListComponent:self requestsAuthenticationAndPerformBlock:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(NCNotificationGroupList *)self toggleGroupedState];
  }
  BOOL v22 = 1;
LABEL_15:

  return v22;
}

void __73__NCNotificationGroupList__handleTapToExpandGroupForNotificationRequest___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained toggleGroupedState];
  }
}

- (void)_setGrouped:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NCNotificationListPresentableGroup *)self listView];
  [v5 setGrouped:v3];

  [(NCNotificationGroupList *)self updateStackSummariesIfNeeded];
  if (UNCCatchMe()
    && [(NCNotificationSectionSettings *)self->_notificationSectionSettings isSummarizationEnabled])
  {
    uint64_t v6 = [(NCNotificationGroupList *)self leadingNotificationRequest];
    [(NCNotificationGroupList *)self _updateSummariesForLeadingNotificationRequest:v6 forceReload:0];
  }
  id v7 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 notificationListBaseComponent:self didSetGrouped:v3];
  }
}

- (void)setLogDescription:(id)a3
{
}

- (BOOL)deviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NCNotificationSectionSettings)notificationSectionSettings
{
  return self->_notificationSectionSettings;
}

- (void)setNotificationSectionSettings:(id)a3
{
}

- (NCNotificationSystemSettings)notificationSystemSettings
{
  return self->_notificationSystemSettings;
}

- (void)setNotificationSystemSettings:(id)a3
{
}

- (BOOL)isClockNotificationGroup
{
  return self->_clockNotificationGroup;
}

- (void)setClockNotificationGroup:(BOOL)a3
{
  self->_clockNotificationGroup = a3;
}

- (void)setLeadingNotificationRequest:(id)a3
{
}

- (BOOL)isClearingAllNotificationRequestsForCellHorizontalSwipe
{
  return self->_clearingAllNotificationRequestsForCellHorizontalSwipe;
}

- (void)setClearingAllNotificationRequestsForCellHorizontalSwipe:(BOOL)a3
{
  self->_clearingAllNotificationRequestsForCellHorizontalSwipe = a3;
}

- (double)individualCellBackgroundAlpha
{
  return self->_individualCellBackgroundAlpha;
}

- (NSMutableArray)orderedRequests
{
  return self->_orderedRequests;
}

- (void)setOrderedRequests:(id)a3
{
}

- (NSMutableDictionary)contentProviders
{
  return self->_contentProviders;
}

- (void)setContentProviders:(id)a3
{
}

- (NSMutableDictionary)clockSnoozeAlarmContentProviders
{
  return self->_clockSnoozeAlarmContentProviders;
}

- (void)setClockSnoozeAlarmContentProviders:(id)a3
{
}

- (NCNotificationSummaryBuilder)summaryBuilder
{
  return self->_summaryBuilder;
}

- (void)setSummaryBuilder:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (NCNotificationListCell)cellRecycledWhilePresentingLongLook
{
  return self->_cellRecycledWhilePresentingLongLook;
}

- (void)setCellRecycledWhilePresentingLongLook:(id)a3
{
}

- (BOOL)longLookDismissalFinalFrameCalculatedWithoutWindow
{
  return self->_longLookDismissalFinalFrameCalculatedWithoutWindow;
}

- (void)setLongLookDismissalFinalFrameCalculatedWithoutWindow:(BOOL)a3
{
  self->_longLookDismissalFinalFrameCalculatedWithoutWindow = a3;
}

- (BOOL)shouldReloadLeadingNotificationRequest
{
  return self->_shouldReloadLeadingNotificationRequest;
}

- (void)setShouldReloadLeadingNotificationRequest:(BOOL)a3
{
  self->_shouldReloadLeadingNotificationRequest = a3;
}

- (NSDate)comparisonDate
{
  return self->_comparisonDate;
}

- (void)setComparisonDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonDate, 0);
  objc_storeStrong((id *)&self->_cellRecycledWhilePresentingLongLook, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_summaryBuilder, 0);
  objc_storeStrong((id *)&self->_clockSnoozeAlarmContentProviders, 0);
  objc_storeStrong((id *)&self->_contentProviders, 0);
  objc_storeStrong((id *)&self->_orderedRequests, 0);
  objc_storeStrong((id *)&self->_leadingNotificationRequest, 0);
  objc_storeStrong((id *)&self->_notificationSystemSettings, 0);
  objc_storeStrong((id *)&self->_notificationSectionSettings, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);

  objc_storeStrong((id *)&self->_logDescription, 0);
}

- (void)updateOrderedNotificationRequests:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 logDescription];
  uint64_t v7 = [a3 count];
  unint64_t v8 = [a2 orderedRequests];
  int v9 = 138543874;
  BOOL v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = [v8 count];
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "%{public}@ updating ordered notification requests failed because mismatch with count %lu while expected count is %lu", (uint8_t *)&v9, 0x20u);
}

- (void)_reloadNotificationViewForNotificationRequest:(void *)a1 forceReloadView:(void *)a2 animated:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 logDescription];
  uint64_t v7 = [a3 notificationIdentifier];
  uint64_t v14 = objc_msgSend(v7, "un_logDigest");
  OUTLINED_FUNCTION_1_3(&dword_1D7C04000, v8, v9, "%{public}@ notificationViewController for request %{public}@ is hidden when reloading; force reveal now",
    v10,
    v11,
    v12,
    v13,
    2u);
}

@end