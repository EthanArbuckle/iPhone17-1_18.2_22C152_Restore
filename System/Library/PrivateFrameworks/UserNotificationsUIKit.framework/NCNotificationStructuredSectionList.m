@interface NCNotificationStructuredSectionList
+ (NSSet)presentableTypes;
- (BOOL)_areNotificationsLoadedForSectionIdentifier:(id)a3;
- (BOOL)_shouldClearPersistentNotificationRequests;
- (BOOL)_shouldFilterNotificationRequest:(id)a3;
- (BOOL)_shouldHideForSectionIdentifier:(id)a3;
- (BOOL)_shouldHideNotificationGroupList:(id)a3;
- (BOOL)_shouldHideNotificationRequest:(id)a3;
- (BOOL)_shouldPreloadNotificationRequest:(id)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)allowSectionListViewGroupedWithContentShownAnimations;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)containsNotificationGroup:(id)a3;
- (BOOL)containsNotificationRequest:(id)a3;
- (BOOL)deferDynamicGroupingForPresentedLongLookOnDeviceLock;
- (BOOL)deviceAuthenticated;
- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3;
- (BOOL)hasVisibleContentToReveal;
- (BOOL)isAttachmentImageFeaturedForNotificationGroupList:(id)a3;
- (BOOL)isDynamicGroupingActive;
- (BOOL)isHeaderViewHeightValid;
- (BOOL)isHistorySection;
- (BOOL)isHorizontallyDisplaced;
- (BOOL)isNotificationGroupListInCollapsedStack:(id)a3;
- (BOOL)isNotificationListViewRevealed;
- (BOOL)isPerformingDynamicGrouping;
- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3;
- (BOOL)isSectionListCurrentlyGroupedWithContentShown;
- (BOOL)isSectionListViewGroupedWithContentShown;
- (BOOL)isSectionVisible;
- (BOOL)isShowingSummarizedStackForNotificationRequest:(id)a3;
- (BOOL)isShowingSummaryForNotificationRequest:(id)a3;
- (BOOL)isViewVisibleForNotificationGroupList:(id)a3;
- (BOOL)notificationGroupListShouldReloadNotificationCells:(id)a3;
- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4;
- (BOOL)preloadsNotificationRequests;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldAlignContentToBottomForLeadingNotificationRequestForNotificationGroupList:(id)a3;
- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3;
- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3;
- (BOOL)shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:(id)a3;
- (BOOL)shouldShowSummaryTextAsContentForLeadingNotificationRequestForNotificationGroupList:(id)a3;
- (BOOL)supportsDynamicGrouping;
- (NCAnimator)animator;
- (NCNotificationListBaseComponent)groupListWithActionsRevealed;
- (NCNotificationListCache)notificationListCache;
- (NCNotificationListComponent)groupListPresentingLongLook;
- (NCNotificationListComponentDelegate)delegate;
- (NCNotificationListSectionHeaderView)headerView;
- (NCNotificationListView)listView;
- (NCNotificationStructuredSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4;
- (NSArray)allNotificationGroups;
- (NSArray)allNotificationGroupsIncludingHidden;
- (NSArray)allNotificationRequests;
- (NSArray)orderedNotificationListComponents;
- (NSDate)comparisonDate;
- (NSMutableArray)notificationGroups;
- (NSMutableDictionary)filteredNotificationRequests;
- (NSMutableDictionary)preloadedNotificationGroups;
- (NSMutableSet)groupListsToSort;
- (NSMutableSet)hiddenNotificationGroups;
- (NSMutableSet)hiddenNotificationRequests;
- (NSString)logDescription;
- (NSString)sectionListDestination;
- (NSString)title;
- (double)collapsedHeight;
- (double)expandedHeight;
- (double)expandedHeightIgnoringNotificationStacks;
- (double)headerViewHeight;
- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_backgroundGroupNameBase;
- (id)_collapsedSectionSummaryString;
- (id)_groupListForPreloadedNotificationRequest:(id)a3 createNewIfNecessary:(BOOL)a4;
- (id)_highlightsList;
- (id)_legibilitySettings;
- (id)_newGroupListForNotificationRequest:(id)a3;
- (id)_newSectionHeaderView;
- (id)_sectionSettingsForSectionIdentifier:(id)a3;
- (id)collapsedSectionSummaryStringForLeadingNotificationRequestForNotificationGroupList:(id)a3;
- (id)containerViewForHeaderViewPreviewInteractionPresentedContent:(id)a3;
- (id)headerViewForNotificationList:(id)a3;
- (id)legibilitySettingsForSectionHeaderView:(id)a3;
- (id)notificationGroupList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5;
- (id)notificationListComponent:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5;
- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3;
- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3 inNotificationGroupLists:(id)a4;
- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3 withSectionIdentifier:(id)a4 threadIdentifier:(id)a5 inNotificationGroupLists:(id)a6;
- (unint64_t)_existingIndexOfGroupForNotificationRequestForRemoval:(id)a3;
- (unint64_t)_existingIndexOfGroupWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4 inNotificationGroupLists:(id)a5;
- (unint64_t)_groupingSettingForSectionIdentifier:(id)a3;
- (unint64_t)_indexOfOrderedNotificationListComponent:(id)a3;
- (unint64_t)_insertionIndexForGroup:(id)a3;
- (unint64_t)count;
- (unint64_t)dynamicGroupingThreshold;
- (unint64_t)existingIndexOfGroupForNotificationRequestForInsertion:(id)a3;
- (unint64_t)importantAdornmentEligibleOptionsForNotificationGroupList:(id)a3;
- (unint64_t)notificationCount;
- (unint64_t)notificationCountIncludingHidden;
- (unint64_t)notificationListViewNumberOfItems:(id)a3;
- (unint64_t)sectionType;
- (void)_addHiddenNotificationGroupList:(id)a3;
- (void)_configureSectionListView:(id)a3;
- (void)_filterNotificationRequest:(id)a3;
- (void)_filterNotificationRequestsForSectionIdentifier:(id)a3;
- (void)_hideNotificationGroupsOnDeviceReauthentication;
- (void)_hideNotificationGroupsPassingTest:(id)a3;
- (void)_insertPreloadedNotificationRequest:(id)a3;
- (void)_insertViewToListAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_modifyHiddenNotificationRequest:(id)a3;
- (void)_modifyPreloadedNotificationRequest:(id)a3;
- (void)_postPreloadedNotificationRequestsForSectionIdentifier:(id)a3;
- (void)_removeFilteredNotificationRequest:(id)a3;
- (void)_removeHiddenNotificationRequest:(id)a3;
- (void)_removeNotificationGroupList:(id)a3;
- (void)_removeNotificationGroupList:(id)a3 animated:(BOOL)a4;
- (void)_removePreloadedNotificationRequest:(id)a3;
- (void)_removeViewFromListAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5;
- (void)_showHiddenNotificationGroupsOnDeviceAuthentication;
- (void)_showHiddenNotificationGroupsPassingTest:(id)a3;
- (void)_showHiddenNotificationRequestsPassingTest:(id)a3;
- (void)_toggleDynamicGroupingIfNecessary;
- (void)_toggleDynamicGroupingIfNecessaryForced:(BOOL)a3;
- (void)_toggleHiddenNotificationsOnAuthenticationChange:(BOOL)a3;
- (void)_unfilterNotificationRequestsForSectionIdentifier:(id)a3;
- (void)_updatePositionOfGroup:(id)a3 atIndex:(unint64_t)a4;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)clearAll;
- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)didExitAlwaysOn;
- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)handleWake:(BOOL)a3;
- (void)insertNotificationRequest:(id)a3;
- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListBaseComponent:(id)a3 didTransitionActionsForSwipeInteraction:(id)a4 revealed:(BOOL)a5;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4;
- (void)notificationListComponent:(id)a3 isPresentingLongLookForViewController:(id)a4;
- (void)notificationListComponent:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6;
- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)recycleView:(id)a3;
- (void)regroupNotificationGroups;
- (void)reloadLeadingNotificationRequestsForStackedNotificationGroupLists;
- (void)reloadNotificationRequest:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)sectionHeaderView:(id)a3 didReceiveClearActionForSectionIdentifier:(id)a4;
- (void)sectionHeaderViewDidBeginForceTouchInteraction:(id)a3;
- (void)sectionHeaderViewDidDismissForceTouchView:(id)a3;
- (void)sectionHeaderViewDidPresentForceTouchView:(id)a3;
- (void)sectionHeaderViewDidReceiveClearAllAction:(id)a3;
- (void)sectionHeaderViewDidTransitionToClearState:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAllowSectionListViewGroupedWithContentShownAnimations:(BOOL)a3;
- (void)setDeferDynamicGroupingForPresentedLongLookOnDeviceLock:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setDynamicGroupingActive:(BOOL)a3;
- (void)setDynamicGroupingThreshold:(unint64_t)a3;
- (void)setFilteredNotificationRequests:(id)a3;
- (void)setGroupListPresentingLongLook:(id)a3;
- (void)setGroupListWithActionsRevealed:(id)a3;
- (void)setGroupListsToSort:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeaderViewHeight:(double)a3;
- (void)setHeaderViewHeightValid:(BOOL)a3;
- (void)setHiddenNotificationGroups:(id)a3;
- (void)setHiddenNotificationRequests:(id)a3;
- (void)setHistorySection:(BOOL)a3;
- (void)setListView:(id)a3;
- (void)setLogDescription:(id)a3;
- (void)setNotificationGroups:(id)a3;
- (void)setNotificationListCache:(id)a3;
- (void)setNotificationListViewRevealed:(BOOL)a3;
- (void)setPerformingDynamicGrouping:(BOOL)a3;
- (void)setPreloadedNotificationGroups:(id)a3;
- (void)setPreloadsNotificationRequests:(BOOL)a3;
- (void)setSectionListDestination:(id)a3;
- (void)setSectionListViewGroupedWithContentShown:(BOOL)a3;
- (void)setSectionType:(unint64_t)a3;
- (void)setSupportsDynamicGrouping:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)sortNotificationGroupListsIfNecessary;
- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
@end

@implementation NCNotificationStructuredSectionList

- (NCNotificationStructuredSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NCNotificationStructuredSectionList;
  v8 = [(NCNotificationStructuredSectionList *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_sectionType = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    notificationGroups = v9->_notificationGroups;
    v9->_notificationGroups = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hiddenNotificationGroups = v9->_hiddenNotificationGroups;
    v9->_hiddenNotificationGroups = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hiddenNotificationRequests = v9->_hiddenNotificationRequests;
    v9->_hiddenNotificationRequests = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    filteredNotificationRequests = v9->_filteredNotificationRequests;
    v9->_filteredNotificationRequests = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    preloadedNotificationGroups = v9->_preloadedNotificationGroups;
    v9->_preloadedNotificationGroups = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    groupListsToSort = v9->_groupListsToSort;
    v9->_groupListsToSort = v20;

    *(_WORD *)&v9->_dynamicGroupingActive = 1;
    v9->_allowSectionListViewGroupedWithContentShownAnimations = 1;
  }

  return v9;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v4 = (Protocol *)a3;
  if (conformsToProtocol__onceToken != -1) {
    dispatch_once(&conformsToProtocol__onceToken, &__block_literal_global_6);
  }
  uint64_t v5 = 0;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    if (protocol_isEqual(v4, *((Protocol **)&conformsToProtocol__defaultProtocols + v5))) {
      break;
    }
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v7 & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)NCNotificationStructuredSectionList;
      BOOL v8 = [(NCNotificationStructuredSectionList *)&v10 conformsToProtocol:v4];
      goto LABEL_8;
    }
  }
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

void __58__NCNotificationStructuredSectionList_conformsToProtocol___block_invoke()
{
  objc_storeStrong(conformsToProtocol__defaultProtocols, &unk_1F2F93410);

  objc_storeStrong(&conformsToProtocol__defaultProtocols[1], &unk_1F2F90258);
}

- (NCNotificationListView)listView
{
  listView = self->_listView;
  if (!listView)
  {
    v4 = [NCNotificationListView alloc];
    uint64_t v5 = objc_opt_class();
    char v6 = NCNotificationListSectionTypeString(self->_sectionType);
    char v7 = [(NCNotificationListView *)v4 initWithModelType:v5 purpose:v6];
    BOOL v8 = self->_listView;
    self->_listView = v7;

    [(NCNotificationStructuredSectionList *)self _configureSectionListView:self->_listView];
    listView = self->_listView;
  }

  return listView;
}

- (void)setNotificationListCache:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_notificationListCache, a3);
  char v6 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__NCNotificationStructuredSectionList_setNotificationListCache___block_invoke;
  v8[3] = &unk_1E6A92950;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __64__NCNotificationStructuredSectionList_setNotificationListCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNotificationListCache:*(void *)(a1 + 32)];
}

- (NCAnimator)animator
{
  v3 = [(NCNotificationStructuredSectionList *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 animator];
  }
  else
  {
    if (_NCReactiveListUI())
    {
      id v5 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_FAULT)) {
        [(NCNotificationListSupplementaryViewsGroup *)(uint64_t)v3 animator];
      }
    }
    uint64_t v4 = NCDefaultAnimator();
  }
  char v6 = (void *)v4;

  return (NCAnimator *)v6;
}

- (NSArray)allNotificationGroups
{
  v2 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    headerView = self->_headerView;
    self->_headerView = 0;

    char v6 = [(NCNotificationStructuredSectionList *)self listView];
    [v6 reloadHeaderView];
  }
}

- (NSArray)allNotificationRequests
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NCNotificationStructuredSectionList_allNotificationRequests__block_invoke;
  v7[3] = &unk_1E6A92950;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __62__NCNotificationStructuredSectionList_allNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 allNotificationRequests];
  [v2 addObjectsFromArray:v3];
}

- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke;
  v21[3] = &unk_1E6A92BC8;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  id v14 = v10;
  id v22 = v14;
  objc_super v23 = self;
  [v11 enumerateObjectsUsingBlock:v21];

  if (v5)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_4;
    v20[3] = &unk_1E6A92950;
    v20[4] = self;
    [v14 enumerateObjectsUsingBlock:v20];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_5;
    v19[3] = &unk_1E6A92950;
    v19[4] = self;
    [v14 enumerateObjectsUsingBlock:v19];
    v15 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    [v15 removeObjectsInArray:v14];

    v16 = [(NCNotificationStructuredSectionList *)self listView];
    [v16 invalidateData];
  }
  [(NCNotificationStructuredSectionList *)self _toggleDynamicGroupingIfNecessary];
  id v17 = v14;

  return v17;
}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    char v6 = [v3 allNotificationRequests];
    id v7 = (void *)[v5 initWithArray:v6];

    if (*(void *)(a1 + 56))
    {
      id v8 = [v3 allNotificationRequests];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_2;
      v20[3] = &unk_1E6A92B78;
      id v22 = *(id *)(a1 + 56);
      id v21 = v7;
      [v8 enumerateObjectsUsingBlock:v20];
    }
    uint64_t v9 = [v7 count];
    if (v9 == [v3 notificationCount])
    {
      [*(id *)(a1 + 32) addObject:v3];
    }
    else if ([v7 count])
    {
      id v10 = *(void **)(a1 + 40);
      v11 = [v7 firstObject];
      id v12 = (void *)[v10 _newGroupListForNotificationRequest:v11];

      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_3;
      id v17 = &unk_1E6A92BA0;
      id v18 = v3;
      id v19 = v12;
      id v13 = v12;
      [v7 enumerateObjectsUsingBlock:&v14];
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13, v14, v15, v16, v17);
    }
  }
}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) removeObject:v3];
  }
}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 removeNotificationRequest:v4];
  [*(id *)(a1 + 40) insertNotificationRequest:v4];
}

uint64_t __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeNotificationGroupList:a2];
}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) notificationGroups];
  uint64_t v5 = [v4 indexOfObject:v3];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      uint64_t v9 = [v7 logDescription];
      id v10 = [v3 logDescription];
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notificationGroup %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = [(NCNotificationStructuredSectionList *)self count];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke;
  v19[3] = &unk_1E6A92C18;
  v19[4] = self;
  id v8 = v7;
  id v20 = v8;
  [v5 enumerateObjectsUsingBlock:v19];

  unint64_t v9 = [(NCNotificationStructuredSectionList *)self count];
  if (!v6 && v9)
  {
    id v10 = [(NCNotificationStructuredSectionList *)self listView];
    [v10 reloadHeaderView];
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2_96;
  v16 = &unk_1E6A91A68;
  id v17 = v8;
  id v18 = self;
  id v11 = v8;
  id v12 = (void (**)(void))_Block_copy(&v13);
  if ([(NCNotificationStructuredSectionList *)self sectionType] - 1 <= 1) {
    v12[2](v12);
  }
  if ([(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown])
  {
    [(NCNotificationStructuredSectionList *)self reloadLeadingNotificationRequestsForStackedNotificationGroupLists];
  }
}

void __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldHideNotificationGroupList:v3])
  {
    id v4 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      unint64_t v6 = v4;
      id v7 = [v5 logDescription];
      id v8 = [v3 logDescription];
      *(_DWORD *)buf = 138543618;
      v34 = v7;
      __int16 v35 = 2114;
      v36 = v8;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ hiding merged notification group %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _addHiddenNotificationGroupList:v3];
    unint64_t v9 = [v3 listView];
    [v9 invalidateData];

    [v3 setDelegate:*(void *)(a1 + 32)];
    id v10 = [*(id *)(a1 + 32) notificationListCache];
    [v3 setNotificationListCache:v10];
  }
  else if ([*(id *)(a1 + 32) isPerformingDynamicGrouping])
  {
    id v11 = [v3 allNotificationRequests];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_93;
    v32[3] = &unk_1E6A91B18;
    v32[4] = *(void *)(a1 + 32);
    [v11 enumerateObjectsUsingBlock:v32];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) notificationGroups];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2;
    v30[3] = &unk_1E6A92BF0;
    id v13 = v3;
    id v31 = v13;
    uint64_t v14 = [v12 indexOfObjectPassingTest:v30];

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(void **)(a1 + 32);
        id v17 = v15;
        id v18 = [v16 logDescription];
        id v19 = [v13 logDescription];
        *(_DWORD *)buf = 138543618;
        v34 = v18;
        __int16 v35 = 2114;
        v36 = v19;
        _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting merged notification group %{public}@", buf, 0x16u);
      }
      id v20 = [v13 allNotificationRequests];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_95;
      v29[3] = &unk_1E6A91B18;
      v29[4] = *(void *)(a1 + 32);
      [v20 enumerateObjectsUsingBlock:v29];
    }
    else
    {
      id v21 = [*(id *)(a1 + 32) notificationGroups];
      id v22 = [v21 objectAtIndex:v14];

      objc_super v23 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v24 = *(void **)(a1 + 32);
        id v25 = v23;
        v26 = [v24 logDescription];
        v27 = [v13 logDescription];
        *(_DWORD *)buf = 138543618;
        v34 = v26;
        __int16 v35 = 2114;
        v36 = v27;
        _os_log_impl(&dword_1D7C04000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ merging notification group %{public}@ with existing group", buf, 0x16u);
      }
      v28 = [v13 allNotificationRequests];
      [v22 mergeNotificationRequests:v28];

      [*(id *)(a1 + 32) _updatePositionOfGroup:v22 atIndex:v14];
      [*(id *)(a1 + 40) addObject:v22];
    }
  }
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_93(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertNotificationRequest:a2];
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchesGroup:*(void *)(a1 + 32)];
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_95(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertNotificationRequest:a2];
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2_96(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3;
  v3[3] = &unk_1E6A92950;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 listView];
  if ([v4 isRevealed])
  {
    id v5 = [v3 listView];
    [v5 revealPercentage];
    char v6 = BSFloatApproximatelyEqualToFloat();

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
    __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3_cold_1(a1, v7, v3);
  }
  id v8 = [v3 listView];
  [v8 setRevealed:1];

  unint64_t v9 = [v3 listView];
  [v9 setRevealPercentage:1.0];

LABEL_8:
}

- (void)regroupNotificationGroups
{
  id v2 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_98];
}

uint64_t __64__NCNotificationStructuredSectionList_regroupNotificationGroups__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGrouped:1 animated:0];
}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  if (a4) {
    [(NCNotificationStructuredSectionList *)self _filterNotificationRequestsForSectionIdentifier:a3];
  }
  else {
    [(NCNotificationStructuredSectionList *)self _unfilterNotificationRequestsForSectionIdentifier:a3];
  }
}

- (void)clearAll
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(NCNotificationStructuredSectionList *)self logDescription];
    *(_DWORD *)buf = 138543362;
    id v21 = v5;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is clearing all notification requests", buf, 0xCu);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__NCNotificationStructuredSectionList_clearAll__block_invoke;
  v17[3] = &unk_1E6A91C20;
  v17[4] = self;
  id v9 = v7;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  [v8 enumerateObjectsUsingBlock:v17];

  id v11 = [(NCNotificationStructuredSectionList *)self delegate];
  [v11 notificationListBaseComponent:self requestsClearingPresentables:v10];
  id v12 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  int v13 = [v12 count];

  if (v13 >= 1)
  {
    unint64_t v14 = v13 + 1;
    do
    {
      uint64_t v15 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      v16 = [v15 objectAtIndex:(v14 - 2)];

      if ([v9 containsObject:v16]) {
        [(NCNotificationStructuredSectionList *)self _removeNotificationGroupList:v16];
      }

      --v14;
    }
    while (v14 > 1);
  }
  if (![(NCNotificationStructuredSectionList *)self count]) {
    [v11 notificationStructuredSectionListDidClearAllNotificationRequests:self];
  }
}

void __47__NCNotificationStructuredSectionList_clearAll__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 allNotificationRequests];
  id v4 = [v3 firstObject];
  id v5 = [v4 options];
  uint64_t v6 = [v5 lockScreenPriority];

  id v7 = [v4 options];
  uint64_t v8 = [v7 lockScreenPersistence];

  if (([*(id *)(a1 + 32) _shouldClearPersistentNotificationRequests] & 1) != 0 || !v8 || v6 == 100)
  {
    [*(id *)(a1 + 40) addObject:v11];
    id v9 = *(void **)(a1 + 48);
    id v10 = [v11 allNotificationRequests];
    [v9 addObjectsFromArray:v10];
  }
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__NCNotificationStructuredSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E6A92C60;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __88__NCNotificationStructuredSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v6 = [v9 isLeadingNotificationRequest:*(void *)(a1 + 32)];
  id v7 = v9;
  if (v6)
  {
    [v9 setGrouped:0 animated:1];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
    *a4 = 1;
    id v7 = v9;
  }
}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__NCNotificationStructuredSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E6A92C60;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __90__NCNotificationStructuredSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v6 = [v9 isLeadingNotificationRequest:*(void *)(a1 + 32)];
  id v7 = v9;
  if (v6)
  {
    [v9 setGrouped:1 animated:1];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
    *a4 = 1;
    id v7 = v9;
  }
}

- (void)sortNotificationGroupListsIfNecessary
{
  id v2 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(NCNotificationStructuredSectionList *)self groupListsToSort];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = [(NCNotificationStructuredSectionList *)v2 groupListsToSort];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v27;
      id v10 = (os_log_t *)MEMORY[0x1E4FB3778];
      *(void *)&long long v7 = 138543618;
      long long v24 = v7;
      id v25 = v5;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
          id v13 = [(NCNotificationStructuredSectionList *)v2 notificationGroups];
          uint64_t v14 = [v13 indexOfObject:v12];

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            os_log_t v15 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              v16 = v15;
              id v17 = [(NCNotificationStructuredSectionList *)v2 logDescription];
              [v12 logDescription];
              id v18 = v2;
              uint64_t v19 = v8;
              uint64_t v20 = v9;
              uint64_t v22 = v21 = v10;
              *(_DWORD *)buf = v24;
              id v31 = v17;
              __int16 v32 = 2112;
              v33 = v22;
              _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ sorting group %@", buf, 0x16u);

              id v10 = v21;
              uint64_t v9 = v20;
              uint64_t v8 = v19;
              id v2 = v18;

              id v5 = v25;
            }
            [(NCNotificationStructuredSectionList *)v2 _updatePositionOfGroup:v12 atIndex:v14];
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v8);
    }

    objc_super v23 = [(NCNotificationStructuredSectionList *)v2 groupListsToSort];
    [v23 removeAllObjects];
  }
}

- (BOOL)hasVisibleContentToReveal
{
  id v2 = self;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__NCNotificationStructuredSectionList_hasVisibleContentToReveal__block_invoke;
  v5[3] = &unk_1E6A91D78;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __64__NCNotificationStructuredSectionList_hasVisibleContentToReveal__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  long long v7 = [a2 sectionIdentifier];
  id v11 = [v6 _sectionSettingsForSectionIdentifier:v7];

  uint64_t v8 = v11;
  if (v11)
  {
    BOOL v9 = [v11 contentPreviewSetting] == 1;
    uint64_t v8 = v11;
    char v10 = v9;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)setSectionListViewGroupedWithContentShown:(BOOL)a3
{
  if (self->_sectionListViewGroupedWithContentShown != a3)
  {
    BOOL v3 = a3;
    self->_sectionListViewGroupedWithContentShown = a3;
    if (a3) {
      [(NCNotificationStructuredSectionList *)self _toggleDynamicGroupingIfNecessaryForced:1];
    }
    [(NCNotificationStructuredSectionList *)self setSupportsDynamicGrouping:v3 ^ 1];
    id v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 setSupportsGrouping:v3];

    uint64_t v6 = [(NCNotificationStructuredSectionList *)self listView];
    [v6 setGrouped:v3];

    long long v7 = [(NCNotificationStructuredSectionList *)self listView];
    [v7 setShowContentForGroupedViews:v3];

    uint64_t v8 = [(NCNotificationStructuredSectionList *)self listView];
    [v8 setGroupedOverlapHeightMultiple:4.0];

    BOOL v9 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__NCNotificationStructuredSectionList_setSectionListViewGroupedWithContentShown___block_invoke;
    v10[3] = &__block_descriptor_33_e40_v32__0__NCNotificationGroupList_8Q16_B24l;
    BOOL v11 = v3;
    [v9 enumerateObjectsUsingBlock:v10];

    [(NCNotificationStructuredSectionList *)self reloadLeadingNotificationRequestsForStackedNotificationGroupLists];
  }
}

void __81__NCNotificationStructuredSectionList_setSectionListViewGroupedWithContentShown___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 listView];
  [v3 setShowContentForGroupedViews:*(unsigned __int8 *)(a1 + 32)];
}

- (void)reloadLeadingNotificationRequestsForStackedNotificationGroupLists
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self allowSectionListViewGroupedWithContentShownAnimations];
  uint64_t v4 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__NCNotificationStructuredSectionList_reloadLeadingNotificationRequestsForStackedNotificationGroupLists__block_invoke;
  v5[3] = &unk_1E6A91B40;
  v5[4] = self;
  BOOL v6 = v3;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __104__NCNotificationStructuredSectionList_reloadLeadingNotificationRequestsForStackedNotificationGroupLists__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (a3 > 2)
  {
    id v8 = a2;
    id v9 = [v8 listView];

    [v9 setGroupedOverlapHeightMultiple:1.0];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v9 = a2;
    double v5 = 1.0;
    if ([v4 isSectionListCurrentlyGroupedWithContentShown])
    {
      BOOL v6 = [*(id *)(a1 + 32) notificationGroups];
      if ((unint64_t)[v6 count] <= 1) {
        double v5 = 1.0;
      }
      else {
        double v5 = 0.0;
      }
    }
    long long v7 = [v9 listView];
    [v7 setGroupedOverlapHeightMultiple:v5];

    [v9 reloadLeadingNotificationRequestWithAnimation:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isHorizontallyDisplaced
{
  return 0;
}

- (double)expandedHeightIgnoringNotificationStacks
{
  id v2 = [(NCNotificationStructuredSectionList *)self listView];
  [v2 calculateSizeForGrouped:0 ignoringExpandedNotificationStacks:1 ignoreFeaturedLeadingView:1];
  double v4 = v3;

  return v4;
}

- (double)expandedHeight
{
  id v2 = [(NCNotificationStructuredSectionList *)self listView];
  [v2 calculateSizeForGrouped:0 ignoringExpandedNotificationStacks:0 ignoreFeaturedLeadingView:0];
  double v4 = v3;

  return v4;
}

- (double)collapsedHeight
{
  id v2 = [(NCNotificationStructuredSectionList *)self listView];
  [v2 calculateSizeForGrouped:1 ignoringExpandedNotificationStacks:1 ignoreFeaturedLeadingView:0];
  double v4 = v3;

  return v4;
}

- (unint64_t)count
{
  id v2 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (NSSet)presentableTypes
{
  return +[NCNotificationGroupList presentableTypes];
}

- (unint64_t)notificationCount
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NCNotificationStructuredSectionList_notificationCount__block_invoke;
  v5[3] = &unk_1E6A92CA8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__NCNotificationStructuredSectionList_notificationCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 notificationCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)insertNotificationRequest:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationStructuredSectionList *)self _shouldFilterNotificationRequest:v4])
  {
    double v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      long long v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      uint64_t v8 = [v4 notificationIdentifier];
      uint64_t v9 = objc_msgSend(v8, "un_logDigest");
      *(_DWORD *)v52 = 138543618;
      *(void *)&v52[4] = v7;
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v9;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ filtering inserted notification request %{public}@", v52, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _filterNotificationRequest:v4];
    goto LABEL_37;
  }
  if ([(NCNotificationStructuredSectionList *)self _shouldHideNotificationRequest:v4])
  {
    char v10 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = v10;
      id v12 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v13 = [v4 notificationIdentifier];
      uint64_t v14 = objc_msgSend(v13, "un_logDigest");
      *(_DWORD *)v52 = 138543618;
      *(void *)&v52[4] = v12;
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v14;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ hiding inserted notification request %{public}@", v52, 0x16u);
    }
    os_log_t v15 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
    [v15 addObject:v4];

    goto LABEL_37;
  }
  if (![(NCNotificationStructuredSectionList *)self _shouldPreloadNotificationRequest:v4])
  {
    unint64_t v22 = [(NCNotificationStructuredSectionList *)self count];
    unint64_t v23 = [(NCNotificationStructuredSectionList *)self existingIndexOfGroupForNotificationRequestForInsertion:v4];
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v24 = [(NCNotificationStructuredSectionList *)self _newGroupListForNotificationRequest:v4];
      id v25 = (void *)*MEMORY[0x1E4FB3778];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      long long v26 = v25;
      long long v27 = [(NCNotificationStructuredSectionList *)self logDescription];
      long long v28 = [v4 notificationIdentifier];
      long long v29 = objc_msgSend(v28, "un_logDigest");
      v30 = [v24 logDescription];
      *(_DWORD *)v52 = 138543874;
      *(void *)&v52[4] = v27;
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v29;
      *(_WORD *)&v52[22] = 2114;
      v53 = v30;
      id v31 = "%{public}@ inserting notification request %{public}@ in new group %{public}@";
      __int16 v32 = v26;
      uint32_t v33 = 32;
    }
    else
    {
      v34 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      id v24 = [v34 objectAtIndex:v23];

      uint64_t v35 = (void *)*MEMORY[0x1E4FB3778];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      long long v26 = v35;
      long long v27 = [(NCNotificationStructuredSectionList *)self logDescription];
      long long v28 = [v4 notificationIdentifier];
      long long v29 = objc_msgSend(v28, "un_logDigest");
      v30 = [v24 logDescription];
      *(_DWORD *)v52 = 138544130;
      *(void *)&v52[4] = v27;
      *(_WORD *)&v52[12] = 2114;
      *(void *)&v52[14] = v29;
      *(_WORD *)&v52[22] = 2114;
      v53 = v30;
      LOWORD(v54) = 2048;
      *(void *)((char *)&v54 + 2) = v23;
      id v31 = "%{public}@ inserting notification request %{public}@ in existing group %{public}@ at index %ld";
      __int16 v32 = v26;
      uint32_t v33 = 42;
    }
    _os_log_impl(&dword_1D7C04000, v32, OS_LOG_TYPE_DEFAULT, v31, v52, v33);

LABEL_19:
    objc_msgSend(v24, "insertNotificationRequest:", v4, *(_OWORD *)v52, *(void *)&v52[16], v53, v54);
    v36 = [v24 listView];
    int v37 = [v36 isGrouped];

    if (v37) {
      [(NCNotificationStructuredSectionList *)self _updatePositionOfGroup:v24 atIndex:v23];
    }
    unint64_t v38 = [(NCNotificationStructuredSectionList *)self count];
    if (!v22 && v38)
    {
      v39 = [(NCNotificationStructuredSectionList *)self listView];
      [v39 reloadHeaderView];
    }
    [(NCNotificationStructuredSectionList *)self _toggleDynamicGroupingIfNecessary];
    if ([(NCNotificationStructuredSectionList *)self sectionType] - 1 <= 1)
    {
      v40 = [v24 listView];
      if ([v40 isRevealed])
      {
        v41 = [v24 listView];
        [v41 revealPercentage];
        char v42 = BSFloatApproximatelyEqualToFloat();

        if (v42)
        {
LABEL_36:

          goto LABEL_37;
        }
      }
      else
      {
      }
      v43 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
        [(NCNotificationStructuredSectionList *)v43 insertNotificationRequest:v24];
      }
      v44 = [v24 listView];
      [v44 setRevealed:1];

      v45 = [v24 listView];
      [v45 setRevealPercentage:1.0];
    }
    if ([(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown])
    {
      v46 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        v47 = v46;
        v48 = [(NCNotificationStructuredSectionList *)self logDescription];
        v49 = [v24 leadingNotificationRequest];
        v50 = [v49 notificationIdentifier];
        v51 = objc_msgSend(v50, "un_logDigest");
        *(_DWORD *)v52 = 138543618;
        *(void *)&v52[4] = v48;
        *(_WORD *)&v52[12] = 2114;
        *(void *)&v52[14] = v51;
        _os_log_impl(&dword_1D7C04000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ reload leading notification %{public}@", v52, 0x16u);
      }
      [(NCNotificationStructuredSectionList *)self reloadLeadingNotificationRequestsForStackedNotificationGroupLists];
    }
    goto LABEL_36;
  }
  v16 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    id v18 = [(NCNotificationStructuredSectionList *)self logDescription];
    uint64_t v19 = [v4 notificationIdentifier];
    uint64_t v20 = objc_msgSend(v19, "un_logDigest");
    id v21 = [v4 sectionIdentifier];
    *(_DWORD *)v52 = 138543874;
    *(void *)&v52[4] = v18;
    *(_WORD *)&v52[12] = 2114;
    *(void *)&v52[14] = v20;
    *(_WORD *)&v52[22] = 2114;
    v53 = v21;
    _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ preloading inserted notification request %{public}@ for section %{public}@", v52, 0x20u);
  }
  [(NCNotificationStructuredSectionList *)self _insertPreloadedNotificationRequest:v4];
LABEL_37:
}

- (void)removeNotificationRequest:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationStructuredSectionList *)self _shouldFilterNotificationRequest:v4])
  {
    double v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      long long v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      uint64_t v8 = [v4 notificationIdentifier];
      uint64_t v9 = objc_msgSend(v8, "un_logDigest");
      int v33 = 138543618;
      v34 = v7;
      __int16 v35 = 2114;
      v36 = v9;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing filtered notification request %{public}@", (uint8_t *)&v33, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _removeFilteredNotificationRequest:v4];
  }
  else if ([(NCNotificationStructuredSectionList *)self _shouldHideNotificationRequest:v4])
  {
    char v10 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = v10;
      id v12 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v13 = [v4 notificationIdentifier];
      uint64_t v14 = objc_msgSend(v13, "un_logDigest");
      int v33 = 138543618;
      v34 = v12;
      __int16 v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hidden notification request %{public}@", (uint8_t *)&v33, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _removeHiddenNotificationRequest:v4];
  }
  else if ([(NCNotificationStructuredSectionList *)self _shouldPreloadNotificationRequest:v4])
  {
    os_log_t v15 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      id v17 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v18 = [v4 notificationIdentifier];
      uint64_t v19 = objc_msgSend(v18, "un_logDigest");
      int v33 = 138543618;
      v34 = v17;
      __int16 v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ removing preloaded notification request %{public}@", (uint8_t *)&v33, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _removePreloadedNotificationRequest:v4];
  }
  else
  {
    unint64_t v20 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequestForRemoval:v4];
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v21 = v20;
      unint64_t v22 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      unint64_t v23 = [v22 objectAtIndex:v21];

      id v24 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v24;
        long long v26 = [(NCNotificationStructuredSectionList *)self logDescription];
        long long v27 = [v4 notificationIdentifier];
        long long v28 = objc_msgSend(v27, "un_logDigest");
        long long v29 = [v23 logDescription];
        int v33 = 138544130;
        v34 = v26;
        __int16 v35 = 2114;
        v36 = v28;
        __int16 v37 = 2114;
        unint64_t v38 = v29;
        __int16 v39 = 2048;
        unint64_t v40 = v21;
        _os_log_impl(&dword_1D7C04000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ in existing group %{public}@ at index %ld", (uint8_t *)&v33, 0x2Au);
      }
      [v23 removeNotificationRequest:v4];
      if ([v23 count])
      {
        v30 = [v23 listView];
        int v31 = [v30 isGrouped];

        if (v31)
        {
          __int16 v32 = [(NCNotificationStructuredSectionList *)self groupListsToSort];
          [v32 addObject:v23];
        }
      }
      else
      {
        [(NCNotificationStructuredSectionList *)self _removeNotificationGroupList:v23];
      }
    }
    if ([(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown])
    {
      [(NCNotificationStructuredSectionList *)self reloadLeadingNotificationRequestsForStackedNotificationGroupLists];
    }
  }
  [(NCNotificationStructuredSectionList *)self _toggleDynamicGroupingIfNecessary];
}

- (void)modifyNotificationRequest:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationStructuredSectionList *)self _shouldFilterNotificationRequest:v4])
  {
    double v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      long long v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      uint64_t v8 = [v4 notificationIdentifier];
      uint64_t v9 = objc_msgSend(v8, "un_logDigest");
      int v30 = 138543618;
      int v31 = v7;
      __int16 v32 = 2114;
      int v33 = v9;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying filtered notification request %{public}@", (uint8_t *)&v30, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _filterNotificationRequest:v4];
  }
  else if ([(NCNotificationStructuredSectionList *)self _shouldHideNotificationRequest:v4])
  {
    char v10 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = v10;
      id v12 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v13 = [v4 notificationIdentifier];
      uint64_t v14 = objc_msgSend(v13, "un_logDigest");
      int v30 = 138543618;
      int v31 = v12;
      __int16 v32 = 2114;
      int v33 = v14;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying hidden notification request %{public}@", (uint8_t *)&v30, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _modifyHiddenNotificationRequest:v4];
  }
  else if ([(NCNotificationStructuredSectionList *)self _shouldPreloadNotificationRequest:v4])
  {
    os_log_t v15 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      id v17 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v18 = [v4 notificationIdentifier];
      uint64_t v19 = objc_msgSend(v18, "un_logDigest");
      int v30 = 138543618;
      int v31 = v17;
      __int16 v32 = 2114;
      int v33 = v19;
      _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying preloaded notification request %{public}@", (uint8_t *)&v30, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _modifyPreloadedNotificationRequest:v4];
  }
  else
  {
    unint64_t v20 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:v4];
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v21 = v20;
      unint64_t v22 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      unint64_t v23 = [v22 objectAtIndex:v21];

      id v24 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v24;
        long long v26 = [(NCNotificationStructuredSectionList *)self logDescription];
        long long v27 = [v4 notificationIdentifier];
        long long v28 = objc_msgSend(v27, "un_logDigest");
        long long v29 = [v23 logDescription];
        int v30 = 138544130;
        int v31 = v26;
        __int16 v32 = 2114;
        int v33 = v28;
        __int16 v34 = 2114;
        __int16 v35 = v29;
        __int16 v36 = 2048;
        unint64_t v37 = v21;
        _os_log_impl(&dword_1D7C04000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@ in existing group %{public}@ at index %ld", (uint8_t *)&v30, 0x2Au);
      }
      [v23 modifyNotificationRequest:v4];
      [(NCNotificationStructuredSectionList *)self _updatePositionOfGroup:v23 atIndex:v21];
      if ([(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown])
      {
        [(NCNotificationStructuredSectionList *)self reloadLeadingNotificationRequestsForStackedNotificationGroupLists];
      }
    }
  }
}

- (void)reloadNotificationRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    long long v7 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    uint64_t v8 = [v7 objectAtIndex:v6];

    uint64_t v9 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      char v10 = v9;
      BOOL v11 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v12 = [v4 notificationIdentifier];
      id v13 = objc_msgSend(v12, "un_logDigest");
      uint64_t v14 = [v8 logDescription];
      int v15 = 138544130;
      v16 = v11;
      __int16 v17 = 2114;
      id v18 = v13;
      __int16 v19 = 2114;
      unint64_t v20 = v14;
      __int16 v21 = 2048;
      unint64_t v22 = v6;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading notification request %{public}@ in existing group %{public}@ at index %ld", (uint8_t *)&v15, 0x2Au);
    }
    [v8 reloadNotificationRequest:v4];
  }
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sectionIdentifier];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v10 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
  v50[3] = &unk_1E6A92C18;
  id v11 = v8;
  id v51 = v11;
  id v12 = v9;
  id v52 = v12;
  [v10 enumerateObjectsUsingBlock:v50];

  if (!v7)
  {
    int v15 = 0;
    char v14 = 0;
LABEL_8:
    int v17 = 0;
    goto LABEL_9;
  }
  int v13 = [v6 showsInNotificationCenter];
  if (v13 == [v7 showsInNotificationCenter])
  {
    int v15 = 0;
    char v14 = 0;
  }
  else
  {
    char v14 = [v6 showsInNotificationCenter] ^ 1;
    int v15 = [v6 showsInNotificationCenter];
  }
  int v16 = [v6 notificationsEnabled];
  if (v16 == [v7 notificationsEnabled]) {
    goto LABEL_8;
  }
  int v17 = [v6 notificationsEnabled] ^ 1;
LABEL_9:
  if ((v14 & 1) != 0 || v17)
  {
    id v18 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = v18;
      unint64_t v20 = [(NCNotificationStructuredSectionList *)self logDescription];
      *(_DWORD *)buf = 138543618;
      long long v54 = v20;
      __int16 v55 = 2114;
      id v56 = v11;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ hiding notifications for %{public}@ on settings change", buf, 0x16u);
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_101;
    v48[3] = &unk_1E6A927B8;
    id v49 = v11;
    [(NCNotificationStructuredSectionList *)self _hideNotificationGroupsPassingTest:v48];

    if (!v15)
    {
LABEL_12:
      if (!v7) {
        goto LABEL_24;
      }
      goto LABEL_20;
    }
  }
  else if (!v15)
  {
    goto LABEL_12;
  }
  __int16 v21 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = v21;
    uint64_t v23 = [(NCNotificationStructuredSectionList *)self logDescription];
    *(_DWORD *)buf = 138543618;
    long long v54 = v23;
    __int16 v55 = 2114;
    id v56 = v11;
    _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ showing notifications for %{public}@ on Shows In Notification Center Turned ON", buf, 0x16u);
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_103;
  v46[3] = &unk_1E6A927B8;
  id v47 = v11;
  [(NCNotificationStructuredSectionList *)self _showHiddenNotificationGroupsPassingTest:v46];

  if (v7)
  {
LABEL_20:
    uint64_t v24 = [v6 groupingSetting];
    if (v24 != [v7 groupingSetting])
    {
      id v25 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        long long v26 = v25;
        long long v27 = [(NCNotificationStructuredSectionList *)self logDescription];
        *(_DWORD *)buf = 138543618;
        long long v54 = v27;
        __int16 v55 = 2114;
        id v56 = v11;
        _os_log_impl(&dword_1D7C04000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ changed grouping setting for section %{public}@", buf, 0x16u);
      }
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_104;
      v43[3] = &unk_1E6A92C18;
      id v44 = v28;
      v45 = self;
      id v29 = v28;
      [v12 enumerateObjectsUsingBlock:v43];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2;
      v42[3] = &unk_1E6A91B18;
      v42[4] = self;
      [v29 enumerateObjectsUsingBlock:v42];
    }
  }
LABEL_24:
  int v30 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  unint64_t v37 = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3;
  uint64_t v38 = &unk_1E6A91C20;
  id v39 = v11;
  id v40 = v6;
  id v41 = v7;
  id v31 = v7;
  id v32 = v6;
  id v33 = v11;
  [v30 enumerateObjectsUsingBlock:&v35];

  __int16 v34 = [(NCNotificationStructuredSectionList *)self delegate];
  [v34 notificationListComponentChangedContent:self];
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 sectionIdentifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_101(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 sectionIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_103(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 sectionIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_104(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v5 allNotificationRequests];
  [v3 addObjectsFromArray:v4];

  [*(id *)(a1 + 40) _removeNotificationGroupList:v5];
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 notificationListCache];
  [v4 clearCacheForNotificationRequest:v5];

  [*(id *)(a1 + 32) insertNotificationRequest:v5];
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3(void *a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 sectionIdentifier];
  int v4 = [v3 isEqualToString:a1[4]];

  if (v4) {
    [v5 updateNotificationSectionSettings:a1[5] previousSectionSettings:a1[6]];
  }
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__NCNotificationStructuredSectionList_updateNotificationSystemSettings_previousSystemSettings___block_invoke;
  v11[3] = &unk_1E6A92C18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

uint64_t __95__NCNotificationStructuredSectionList_updateNotificationSystemSettings_previousSystemSettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateNotificationSystemSettings:*(void *)(a1 + 32) previousSystemSettings:*(void *)(a1 + 40)];
}

- (void)didExitAlwaysOn
{
  if ([(NCNotificationStructuredSectionList *)self isHistorySection])
  {
    listView = self->_listView;
    [(NCNotificationListView *)listView didExitAlwaysOn];
  }
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  if (self->_deviceAuthenticated != a3)
  {
    BOOL v3 = a3;
    self->_deviceAuthenticated = a3;
    -[NCNotificationStructuredSectionList _toggleHiddenNotificationsOnAuthenticationChange:](self, "_toggleHiddenNotificationsOnAuthenticationChange:");
    if (v3) {
      [(NCNotificationStructuredSectionList *)self _showHiddenNotificationGroupsOnDeviceAuthentication];
    }
    else {
      [(NCNotificationStructuredSectionList *)self _hideNotificationGroupsOnDeviceReauthentication];
    }
    id v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__NCNotificationStructuredSectionList_setDeviceAuthenticated___block_invoke;
    v8[3] = &__block_descriptor_33_e40_v32__0__NCNotificationGroupList_8Q16_B24l;
    BOOL v9 = v3;
    [v5 enumerateObjectsUsingBlock:v8];

    id v6 = [(NCNotificationStructuredSectionList *)self delegate];
    [v6 notificationListComponentChangedContent:self];

    id v7 = [(NCNotificationStructuredSectionList *)self listView];
    [v7 setNeedsLayout];
  }
}

uint64_t __62__NCNotificationStructuredSectionList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationStructuredSectionList *)self preloadsNotificationRequests])
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v8 = 138543618;
      BOOL v9 = v7;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifications loaded for section %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(NCNotificationStructuredSectionList *)self _postPreloadedNotificationRequestsForSectionIdentifier:v4];
  }
}

- (BOOL)containsNotificationGroup:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NCNotificationStructuredSectionList_containsNotificationGroup___block_invoke;
  v8[3] = &unk_1E6A91D78;
  id v6 = v4;
  id v9 = v6;
  __int16 v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __65__NCNotificationStructuredSectionList_containsNotificationGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__NCNotificationStructuredSectionList_containsNotificationRequest___block_invoke;
  v8[3] = &unk_1E6A91D78;
  id v6 = v4;
  id v9 = v6;
  __int16 v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __67__NCNotificationStructuredSectionList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsNotificationRequest:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)setLogDescription:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v4 stringWithFormat:@"%@ [%@]", v5, v9];

  logDescription = self->_logDescription;
  self->_logDescription = v7;
}

- (NSDate)comparisonDate
{
  id v2 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 comparisonDate];

  return (NSDate *)v4;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  id v7 = [(NCNotificationStructuredSectionList *)self orderedNotificationListComponents];
  double v8 = 0.0;
  if ([v7 count] > a4)
  {
    id v9 = [v7 objectAtIndex:a4];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v10 = [v9 listView];
        [v10 frame];
        double x = v16.origin.x;
        double y = v16.origin.y;
        double height = v16.size.height;
        if (CGRectGetWidth(v16) == 0.0) {
          objc_msgSend(v10, "setFrame:", x, y, a5, height);
        }
        objc_msgSend(v10, "sizeThatFits:", a5, 0.0);
        double v8 = v14;
      }
    }
  }
  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6 = [(NCNotificationStructuredSectionList *)self orderedNotificationListComponents];
  if ([v6 count] <= a4)
  {
    double v8 = 0;
  }
  else
  {
    id v7 = [v6 objectAtIndex:a4];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v8 = [v7 listView];
      [v8 updateSubviewTranslation:0.0];
      objc_msgSend(v8, "setShowContentForGroupedViews:", -[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"));
    }
    else
    {
      double v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self orderedNotificationListComponents];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)headerViewForNotificationList:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredSectionList *)self title];
  if (v4 && (id v5 = (void *)v4, v6 = [(NCNotificationStructuredSectionList *)self count], v5, v6))
  {
    headerView = self->_headerView;
    if (!headerView)
    {
      double v8 = [(NCNotificationStructuredSectionList *)self _newSectionHeaderView];
      id v9 = self->_headerView;
      self->_headerView = v8;

      self->_headerViewHeightValid = 0;
      headerView = self->_headerView;
    }
    __int16 v10 = headerView;
  }
  else
  {
    uint64_t v11 = self->_headerView;
    if (v11)
    {
      self->_headerView = 0;
    }
    __int16 v10 = 0;
  }

  return v10;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  if (!self->_headerViewHeightValid)
  {
    unint64_t v6 = [(NCNotificationStructuredSectionList *)self headerView];

    if (v6)
    {
      id v7 = [(NCNotificationStructuredSectionList *)self title];
      double v8 = [(NCNotificationStructuredSectionList *)self headerView];
      +[NCNotificationListSectionHeaderView headerHeightWithWidth:title:isShowingCollapseButton:](NCNotificationListSectionHeaderView, "headerHeightWithWidth:title:isShowingCollapseButton:", v7, [v8 showCollapseButton], a4);
      self->_headerViewHeight = v9;
    }
    else
    {
      self->_headerViewHeight = 0.0;
    }
    self->_headerViewHeightValid = 1;
  }
  return self->_headerViewHeight;
}

- (void)recycleView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 recycleVisibleViews];
  }
}

- (void)handleWake:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NCNotificationStructuredSectionList *)self allNotificationRequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = [(NCNotificationListCache *)self->_notificationListCache listCellForNotificationRequest:*(void *)(*((void *)&v12 + 1) + 8 * v9) viewControllerDelegate:0 createNewIfNecessary:0 shouldConfigure:0];
        uint64_t v11 = [v10 contentViewController];
        [v11 handleWake:v3];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationStructuredSectionList;
  if (-[NCNotificationStructuredSectionList respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", [v4 selector]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [v4 invokeWithTarget:WeakRetained];
    }
    else if ([WeakRetained conformsToProtocol:&unk_1F2F90258] {
           && (objc_opt_respondsToSelector() & 1) != 0)
    }
    {
      uint64_t v6 = [WeakRetained delegate];
      [v4 invokeWithTarget:v6];
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)NCNotificationStructuredSectionList;
      [(NCNotificationStructuredSectionList *)&v7 forwardInvocation:v4];
    }
  }
}

- (id)notificationListComponent:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NCNotificationStructuredSectionList *)self delegate];
  objc_super v7 = [v6 notificationListComponent:self containerViewProviderForExpandedContentForViewController:v5];

  return v7;
}

- (void)notificationListComponent:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(NCNotificationStructuredSectionList *)self setGroupListPresentingLongLook:v10];
  objc_initWeak(&location, self);
  long long v13 = [(NCNotificationStructuredSectionList *)self delegate];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __146__NCNotificationStructuredSectionList_notificationListComponent_shouldFinishLongLookTransitionForNotificationRequest_trigger_withCompletionBlock___block_invoke;
  v15[3] = &unk_1E6A92CD0;
  objc_copyWeak(&v17, &location);
  id v14 = v12;
  id v16 = v14;
  [v13 notificationListComponent:self shouldFinishLongLookTransitionForNotificationRequest:v11 trigger:a5 withCompletionBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

uint64_t __146__NCNotificationStructuredSectionList_notificationListComponent_shouldFinishLongLookTransitionForNotificationRequest_trigger_withCompletionBlock___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setGroupListPresentingLongLook:0];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)notificationListComponent:(id)a3 isPresentingLongLookForViewController:(id)a4
{
  if (a4) {
    id v5 = a3;
  }
  else {
    id v5 = 0;
  }
  id v6 = a4;
  [(NCNotificationStructuredSectionList *)self setGroupListPresentingLongLook:v5];
  objc_super v7 = [(NCNotificationStructuredSectionList *)self delegate];
  [v7 notificationListComponent:self isPresentingLongLookForViewController:v6];

  objc_super v8 = [(NCNotificationStructuredSectionList *)self groupListPresentingLongLook];
  if (v8)
  {
  }
  else if ([(NCNotificationStructuredSectionList *)self deferDynamicGroupingForPresentedLongLookOnDeviceLock])
  {
    [(NCNotificationStructuredSectionList *)self _toggleHiddenNotificationsOnAuthenticationChange:0];
  }
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  [(NCNotificationStructuredSectionList *)self _removeNotificationGroupList:a3];
  [(NCNotificationStructuredSectionList *)self _toggleDynamicGroupingIfNecessary];
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  [v4 notificationListBaseComponentDidRemoveAll:self];
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v7 = v14;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v8 count])
    {
      id v10 = [(NCNotificationStructuredSectionList *)self groupListsToSort];
      [v10 addObject:v9];
LABEL_7:

      goto LABEL_9;
    }
    [(NCNotificationStructuredSectionList *)self _removeNotificationGroupList:v9];
    [(NCNotificationStructuredSectionList *)self _toggleDynamicGroupingIfNecessary];
    id v11 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      id v10 = [(NCNotificationStructuredSectionList *)self listView];
      [v10 reloadHeaderView];
      goto LABEL_7;
    }
  }
LABEL_9:
  long long v13 = [(NCNotificationStructuredSectionList *)self delegate];
  [v13 notificationListComponent:self didRemoveNotificationRequest:v6];
}

- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(NCNotificationStructuredSectionList *)self isSectionListCurrentlyGroupedWithContentShown])goto LABEL_8; {
  objc_opt_class();
  }
  id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
  id v9 = v8;
  if (v9
    && (id v10 = v9,
        [(NCNotificationStructuredSectionList *)self notificationGroups],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 indexOfObject:v10],
        v11,
        v10,
        v12))
  {
    char v13 = 0;
  }
  else
  {
LABEL_8:
    id v14 = [(NCNotificationStructuredSectionList *)self delegate];
    char v13 = [v14 notificationListComponent:self shouldAllowInteractionsForNotificationRequest:v7];
  }
  return v13;
}

- (void)notificationListBaseComponent:(id)a3 didTransitionActionsForSwipeInteraction:(id)a4 revealed:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  id v9 = [(NCNotificationStructuredSectionList *)self delegate];
  [v9 notificationListBaseComponent:v12 didTransitionActionsForSwipeInteraction:v8 revealed:v5];

  if (!v5 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v11 = v12, (isKindOfClass & 1) == 0)) {
    id v11 = 0;
  }
  [(NCNotificationStructuredSectionList *)self setGroupListWithActionsRevealed:v11];
}

- (id)notificationGroupList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if ([(NCNotificationStructuredSectionList *)self isSectionListCurrentlyGroupedWithContentShown])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(NCNotificationStructuredSectionList *)self delegate];
    id v8 = [v9 notificationStructuredSectionList:self requestsAuxiliaryOptionsContentProviderForNotificationRequest:v7 isLongLook:v5];
  }

  return v8;
}

- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4
{
  char v13 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13) {
      v13[2]();
    }
  }
  else
  {
    id v9 = [(NCNotificationStructuredSectionList *)self listView];
    [v9 layoutOffsetForViewAtIndex:v8];
    double v11 = v10;

    id v12 = [(NCNotificationStructuredSectionList *)self delegate];
    [v12 notificationListBaseComponent:self requestsScrollingToContentOffset:v13 withCompletion:v11];
  }
}

- (BOOL)isViewVisibleForNotificationGroupList:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationStructuredSectionList *)self orderedNotificationListComponents];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v8 = [(NCNotificationStructuredSectionList *)self listView];
  char v9 = [v8 isVisibleForViewAtIndex:v6];

  return v9;
}

- (BOOL)notificationGroupListShouldReloadNotificationCells:(id)a3
{
  return 1;
}

- (BOOL)isNotificationGroupListInCollapsedStack:(id)a3
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self listView];
  char v4 = [v3 isGrouped];

  return v4;
}

- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 1;
}

- (BOOL)isAttachmentImageFeaturedForNotificationGroupList:(id)a3
{
  return 0;
}

- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3
{
  if (![(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown])return 0; {
  char v4 = [(NCNotificationStructuredSectionList *)self listView];
  }
  int v5 = [v4 isGrouped];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [(NCNotificationStructuredSectionList *)self delegate];
  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v6 handleTapOnNotificationListBaseComponent:self])
  {
    [(NCNotificationStructuredSectionList *)self reloadLeadingNotificationRequestsForStackedNotificationGroupLists];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v6 = [v5 indexOfObject:v4];

  BOOL v7 = ![(NCNotificationStructuredSectionList *)self isSectionListCurrentlyGroupedWithContentShown];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    LOBYTE(v7) = 1;
  }
  return !v6 || v7;
}

- (BOOL)shouldAlignContentToBottomForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  unint64_t v6 = [v5 indexOfObject:v4];

  BOOL v7 = [(NCNotificationStructuredSectionList *)self isSectionListCurrentlyGroupedWithContentShown];
  if (v6) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  return v6 < 3 && v8;
}

- (id)collapsedSectionSummaryStringForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v6 = [v5 indexOfObject:v4];

  BOOL v7 = [(NCNotificationStructuredSectionList *)self isSectionListCurrentlyGroupedWithContentShown];
  BOOL v8 = 0;
  if (v7 && v6 == 2)
  {
    char v9 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    unint64_t v10 = [v9 count];

    if (v10 < 4)
    {
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = [(NCNotificationStructuredSectionList *)self _collapsedSectionSummaryString];
    }
  }

  return v8;
}

- (BOOL)shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v6 = [v5 indexOfObject:v4];

  BOOL result = [(NCNotificationStructuredSectionList *)self isSectionListCurrentlyGroupedWithContentShown];
  if (v6) {
    return 0;
  }
  return result;
}

- (BOOL)shouldShowSummaryTextAsContentForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v6 = [v5 count];

  BOOL v7 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  unint64_t v8 = [v7 indexOfObject:v4];

  BOOL v9 = [(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown];
  BOOL v10 = 0;
  if (v9 && v8) {
    BOOL v10 = (v8 < 2 || v6 == 3) && (unint64_t)[v4 notificationCount] > 1;
  }

  return v10;
}

- (unint64_t)importantAdornmentEligibleOptionsForNotificationGroupList:(id)a3
{
  unint64_t v4 = [(NCNotificationStructuredSectionList *)self sectionType];
  if (v4 > 0xB) {
    return -1;
  }
  if (((1 << v4) & 0xBF9) != 0) {
    return -7;
  }
  if (((1 << v4) & 6) != 0) {
    return -5;
  }
  uint64_t v6 = [(NCNotificationStructuredSectionList *)self _highlightsList];
  int v7 = [v6 forceExpanded];

  if (v7) {
    return -3;
  }
  else {
    return -7;
  }
}

- (id)_highlightsList
{
  if ([(NCNotificationStructuredSectionList *)self sectionType] == 10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v3 = self;
    }
    else {
      BOOL v3 = 0;
    }
    unint64_t v4 = v3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)sectionHeaderViewDidTransitionToClearState:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListComponent:self didTransitionSectionHeaderView:v4 toClearState:1];
}

- (void)sectionHeaderView:(id)a3 didReceiveClearActionForSectionIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    unint64_t v8 = [(NCNotificationStructuredSectionList *)self logDescription];
    int v10 = 138543618;
    double v11 = v8;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requests clearing notifications in section with identifier %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(NCNotificationStructuredSectionList *)self clearAll];
  BOOL v9 = [(NCNotificationStructuredSectionList *)self delegate];
  [v9 notificationListComponentChangedContent:self];
}

- (void)sectionHeaderViewDidReceiveClearAllAction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [(NCNotificationStructuredSectionList *)self logDescription];
    int v8 = 138543362;
    BOOL v9 = v6;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requests clearing all notifications", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(NCNotificationStructuredSectionList *)self delegate];
  [v7 notificationListBaseComponentRequestsClearingAll:self];
}

- (id)containerViewForHeaderViewPreviewInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  id v5 = [v4 containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:self];

  return v5;
}

- (void)sectionHeaderViewDidBeginForceTouchInteraction:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  [v4 notificationListBaseComponent:self didBeginUserInteractionWithViewController:0];
}

- (void)sectionHeaderViewDidPresentForceTouchView:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListComponent:self didPresentSectionHeaderView:v4 inForceTouchState:1];
}

- (void)sectionHeaderViewDidDismissForceTouchView:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListComponent:self didPresentSectionHeaderView:v4 inForceTouchState:0];

  [v5 notificationListBaseComponent:self didEndUserInteractionWithViewController:0];
}

- (id)legibilitySettingsForSectionHeaderView:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  id v5 = [v4 legibilitySettingsForNotificationListBaseComponent:self];

  return v5;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__NCNotificationStructuredSectionList_adjustForLegibilitySettingsChange___block_invoke;
  v8[3] = &unk_1E6A92950;
  id v9 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v8];

  int v7 = [(NCNotificationStructuredSectionList *)self headerView];
  [v7 adjustForLegibilitySettingsChange:v6];
}

uint64_t __73__NCNotificationStructuredSectionList_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForLegibilitySettingsChange:*(void *)(a1 + 32)];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_118];

  id v4 = [(NCNotificationStructuredSectionList *)self headerView];
  [v4 adjustForContentSizeCategoryChange];

  self->_headerViewHeightValid = 0;
  return 1;
}

uint64_t __73__NCNotificationStructuredSectionList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

- (void)_insertViewToListAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(NCNotificationStructuredSectionList *)self listView];
  [v6 insertViewAtIndex:a3 animated:v4];
}

- (void)_removeViewFromListAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(NCNotificationStructuredSectionList *)self listView];
  [v8 removeViewAtIndex:a3 animated:v6 isHorizontallyDisplaced:v5];
}

- (unint64_t)notificationCountIncludingHidden
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  BOOL v3 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__NCNotificationStructuredSectionList_notificationCountIncludingHidden__block_invoke;
  v9[3] = &unk_1E6A92CA8;
  v9[4] = &v10;
  [v3 enumerateObjectsUsingBlock:v9];

  BOOL v4 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
  BOOL v5 = [v4 allObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__NCNotificationStructuredSectionList_notificationCountIncludingHidden__block_invoke_2;
  v8[3] = &unk_1E6A92CA8;
  void v8[4] = &v10;
  [v5 enumerateObjectsUsingBlock:v8];

  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __71__NCNotificationStructuredSectionList_notificationCountIncludingHidden__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 notificationCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __71__NCNotificationStructuredSectionList_notificationCountIncludingHidden__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 notificationCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (NSArray)allNotificationGroupsIncludingHidden
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  BOOL v4 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
  BOOL v5 = [v4 allObjects];

  unint64_t v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return (NSArray *)v6;
}

- (BOOL)isSectionVisible
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self listView];
  if ([v3 isRevealed])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 revealPercentage];
    BOOL v4 = v6 > 0.0;
  }
  return v4;
}

- (NSArray)orderedNotificationListComponents
{
  id v2 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  BOOL v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)_indexOfOrderedNotificationListComponent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationStructuredSectionList *)self orderedNotificationListComponents];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (void)_configureSectionListView:(id)a3
{
  id v6 = a3;
  [v6 setDataSource:self];
  [v6 setGrouped:0];
  objc_msgSend(v6, "setRevealed:", -[NCNotificationStructuredSectionList isNotificationListViewRevealed](self, "isNotificationListViewRevealed"));
  BOOL v4 = [(NCNotificationStructuredSectionList *)self isNotificationListViewRevealed];
  double v5 = 0.0;
  if (v4) {
    double v5 = 1.0;
  }
  [v6 setRevealPercentage:v5];
  objc_msgSend(v6, "setShowContentForGroupedViews:", -[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"));
}

- (unint64_t)_groupingSettingForSectionIdentifier:(id)a3
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self _sectionSettingsForSectionIdentifier:a3];
  unint64_t v4 = [v3 groupingSetting];

  return v4;
}

- (id)_newGroupListForNotificationRequest:(id)a3
{
  id v4 = a3;
  double v5 = [NCNotificationGroupList alloc];
  id v6 = [v4 sectionIdentifier];
  int v7 = [v4 threadIdentifier];
  id v8 = [(NCNotificationGroupList *)v5 initWithSectionIdentifier:v6 threadIdentifier:v7];

  [(NCNotificationGroupList *)v8 setDeviceAuthenticated:[(NCNotificationStructuredSectionList *)self deviceAuthenticated]];
  [(NCNotificationListPresentableGroup *)v8 setDelegate:self];
  id v9 = [(NCNotificationStructuredSectionList *)self notificationListCache];
  [(NCNotificationListPresentableGroup *)v8 setNotificationListCache:v9];

  uint64_t v10 = [v4 sectionIdentifier];
  double v11 = [(NCNotificationStructuredSectionList *)self _sectionSettingsForSectionIdentifier:v10];
  [(NCNotificationGroupList *)v8 setNotificationSectionSettings:v11];

  uint64_t v12 = [(NCNotificationStructuredSectionList *)self notificationSystemSettingsForNotificationListComponent:self];
  [(NCNotificationGroupList *)v8 setNotificationSystemSettings:v12];

  uint64_t v13 = [(NCNotificationStructuredSectionList *)self delegate];
  uint64_t v14 = [v13 notificationListComponent:self isClockNotificationRequest:v4];

  [(NCNotificationGroupList *)v8 setClockNotificationGroup:v14];
  long long v15 = [(NCNotificationStructuredSectionList *)self _backgroundGroupNameBase];
  [(NCNotificationListPresentableGroup *)v8 setMaterialGroupNameBase:v15];

  return v8;
}

- (id)_newSectionHeaderView
{
  BOOL v3 = [NCNotificationListSectionHeaderView alloc];
  id v4 = -[NCNotificationListSectionHeaderView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = [(NCNotificationStructuredSectionList *)self title];
  [(NCNotificationListSectionHeaderView *)v4 setTitle:v5];

  [(NCNotificationListSectionHeaderView *)v4 setDelegate:self];
  id v6 = [(NCNotificationStructuredSectionList *)self _legibilitySettings];
  [(NCNotificationListSectionHeaderView *)v4 adjustForLegibilitySettingsChange:v6];

  [(NCNotificationListSectionHeaderView *)v4 setAdjustsFontForContentSizeCategory:1];
  int v7 = [(NCNotificationStructuredSectionList *)self _backgroundGroupNameBase];
  [(NCNotificationListSectionHeaderView *)v4 setMaterialGroupNameBase:v7];

  return v4;
}

- (unint64_t)existingIndexOfGroupForNotificationRequestForInsertion:(id)a3
{
  id v4 = a3;
  double v5 = [(NCNotificationStructuredSectionList *)self _notificationGroupsForInsertion];
  unint64_t v6 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:v4 inNotificationGroupLists:v5];

  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [v5 objectAtIndex:v6];
    id v9 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    unint64_t v7 = [v9 indexOfObject:v8];
  }
  return v7;
}

- (unint64_t)_existingIndexOfGroupForNotificationRequestForRemoval:(id)a3
{
  id v4 = a3;
  double v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequestForRemoval___block_invoke;
  v9[3] = &unk_1E6A92BF0;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __93__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequestForRemoval___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsNotificationRequest:*(void *)(a1 + 32)];
}

- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3
{
  id v4 = a3;
  double v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  unint64_t v6 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:v4 inNotificationGroupLists:v5];

  return v6;
}

- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3 inNotificationGroupLists:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 sectionIdentifier];
  id v9 = [v7 threadIdentifier];
  unint64_t v10 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:v7 withSectionIdentifier:v8 threadIdentifier:v9 inNotificationGroupLists:v6];

  return v10;
}

- (unint64_t)_existingIndexOfGroupWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4 inNotificationGroupLists:(id)a5
{
  return [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:0 withSectionIdentifier:a3 threadIdentifier:a4 inNotificationGroupLists:a5];
}

- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3 withSectionIdentifier:(id)a4 threadIdentifier:(id)a5 inNotificationGroupLists:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(NCNotificationStructuredSectionList *)self isPerformingDynamicGrouping])
  {
    id v14 = [(NCNotificationStructuredSectionList *)self _sectionSettingsForSectionIdentifier:v11];
    uint64_t v15 = [v14 contentPreviewSetting];
    unint64_t v16 = [(NCNotificationStructuredSectionList *)self _groupingSettingForSectionIdentifier:v11];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke;
    v26[3] = &unk_1E6A92CF8;
    uint64_t v30 = v15;
    unint64_t v31 = v16;
    v26[4] = self;
    id v27 = v10;
    id v28 = v11;
    id v29 = v12;
    id v17 = v10;
    id v18 = v12;
    id v19 = v11;
    unint64_t v20 = [v13 indexOfObjectPassingTest:v26];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke_2;
    v22[3] = &unk_1E6A92D20;
    v22[4] = self;
    id v23 = v11;
    id v24 = v12;
    id v25 = v10;
    id v18 = v10;
    id v19 = v12;
    id v14 = v11;
    unint64_t v20 = [v13 indexOfObjectPassingTest:v22];
  }
  return v20;
}

uint64_t __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4 || v4 == 1 && ([*(id *)(a1 + 32) deviceAuthenticated] & 1) != 0 || *(void *)(a1 + 72) == 2)
  {
    uint64_t v5 = [v3 isLeadingNotificationRequest:*(void *)(a1 + 40)];
LABEL_6:
    uint64_t v6 = v5;
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isCriticalAlert])
  {
    uint64_t v5 = [v3 containsCriticalNotificationRequest:*(void *)(a1 + 40)];
    goto LABEL_6;
  }
  id v8 = [v3 sectionIdentifier];
  if ([v8 isEqualToString:*(void *)(a1 + 48)])
  {
    id v9 = [v3 threadIdentifier];
    uint64_t v6 = [v9 isEqualToString:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v6 = 0;
  }

LABEL_7:
  return v6;
}

uint64_t __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 sectionIdentifier];
  uint64_t v6 = [v4 _groupingSettingForSectionIdentifier:v5];

  if (v6 == 2)
  {
    if (!*(void *)(a1 + 56) || (objc_msgSend(v3, "isLeadingNotificationRequest:") & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v6 == 1)
  {
    id v10 = [v3 sectionIdentifier];
    char v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

    if ((v11 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v6) {
    goto LABEL_13;
  }
  id v7 = [v3 sectionIdentifier];
  if (([v7 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {

    goto LABEL_13;
  }
  id v8 = [v3 threadIdentifier];
  char v9 = [v8 isEqualToString:*(void *)(a1 + 48)];

  if (v9)
  {
LABEL_11:
    uint64_t v12 = 1;
    goto LABEL_16;
  }
LABEL_13:
  if ([*(id *)(a1 + 56) isCriticalAlert]) {
    uint64_t v12 = [v3 containsCriticalNotificationRequest:*(void *)(a1 + 56)];
  }
  else {
    uint64_t v12 = 0;
  }
LABEL_16:

  return v12;
}

- (void)_updatePositionOfGroup:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(NCNotificationStructuredSectionList *)self _insertionIndexForGroup:v6];
  if (v7 != a4 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = v7;
    id v10 = (os_log_t *)MEMORY[0x1E4FB3778];
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v11 = [(NCNotificationStructuredSectionList *)self _indexOfOrderedNotificationListComponent:v6];
      os_log_t v12 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        id v14 = [(NCNotificationStructuredSectionList *)self logDescription];
        uint64_t v15 = [v6 logDescription];
        int v33 = 138543618;
        __int16 v34 = v14;
        __int16 v35 = 2114;
        uint64_t v36 = v15;
        _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notificationGroup %{public}@", (uint8_t *)&v33, 0x16u);
      }
      unint64_t v16 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      [v16 removeObject:v6];

      [(NCNotificationStructuredSectionList *)self _removeViewFromListAtIndex:v11 animated:0 isHorizontallyDisplaced:0];
    }
    unint64_t v17 = (__PAIR128__(v9, a4) - v9) >> 64;
    id v18 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    unint64_t v19 = [v18 count];

    if (v17 > v19)
    {
      os_log_t v20 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        id v28 = v20;
        id v29 = [(NCNotificationStructuredSectionList *)self logDescription];
        uint64_t v30 = [v6 logDescription];
        unint64_t v31 = [(NCNotificationStructuredSectionList *)self notificationGroups];
        uint64_t v32 = [v31 count];
        int v33 = 138544130;
        __int16 v34 = v29;
        __int16 v35 = 2114;
        uint64_t v36 = v30;
        __int16 v37 = 2048;
        unint64_t v38 = v17;
        __int16 v39 = 2048;
        uint64_t v40 = v32;
        _os_log_error_impl(&dword_1D7C04000, v28, OS_LOG_TYPE_ERROR, "%{public}@ attempting to insert group %{public}@ at index %ld while total group count is %ld", (uint8_t *)&v33, 0x2Au);
      }
      __int16 v21 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      unint64_t v17 = [v21 count];
    }
    os_log_t v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      id v24 = [(NCNotificationStructuredSectionList *)self logDescription];
      id v25 = [v6 logDescription];
      int v33 = 138543874;
      __int16 v34 = v24;
      __int16 v35 = 2114;
      uint64_t v36 = v25;
      __int16 v37 = 2048;
      unint64_t v38 = v17;
      _os_log_impl(&dword_1D7C04000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting notificationGroup %{public}@ at index %ld", (uint8_t *)&v33, 0x20u);
    }
    long long v26 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    [v26 insertObject:v6 atIndex:v17];

    [(NCNotificationStructuredSectionList *)self _insertViewToListAtIndex:[(NCNotificationStructuredSectionList *)self _indexOfOrderedNotificationListComponent:v6] animated:1];
    id v27 = [(NCNotificationStructuredSectionList *)self listView];
    [v27 setNeedsLayout];
  }
}

- (unint64_t)_insertionIndexForGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  id v6 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  unint64_t v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v6, "count"), 1280, &__block_literal_global_121);

  return v7;
}

uint64_t __63__NCNotificationStructuredSectionList__insertionIndexForGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_removeNotificationGroupList:(id)a3
{
}

- (void)_removeNotificationGroupList:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = [v6 listView];
    [v9 recycleVisibleViews];

    unint64_t v10 = [(NCNotificationStructuredSectionList *)self _indexOfOrderedNotificationListComponent:v6];
    id v11 = [(NCNotificationStructuredSectionList *)self groupListWithActionsRevealed];
    if (v11 == v6) {
      uint64_t v12 = [v6 isClearingAllNotificationRequestsForCellHorizontalSwipe];
    }
    else {
      uint64_t v12 = 0;
    }

    [(NCNotificationStructuredSectionList *)self _removeViewFromListAtIndex:v10 animated:v4 isHorizontallyDisplaced:v12];
    id v13 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      uint64_t v15 = [(NCNotificationStructuredSectionList *)self logDescription];
      unint64_t v16 = [v6 logDescription];
      int v21 = 138543874;
      os_log_t v22 = v15;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notificationGroup %{public}@ at index %ld", (uint8_t *)&v21, 0x20u);
    }
    unint64_t v17 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    [v17 removeObjectAtIndex:v8];

    id v18 = [(NCNotificationStructuredSectionList *)self groupListsToSort];
    [v18 removeObject:v6];

    if (![(NCNotificationStructuredSectionList *)self count])
    {
      unint64_t v19 = [(NCNotificationStructuredSectionList *)self listView];
      [v19 reloadHeaderView];
    }
    os_log_t v20 = [v6 listView];
    [v20 setDataSource:0];
  }
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationStructuredSectionList *)self delegate];
  id v6 = [v5 notificationListComponent:self sectionSettingsForSectionIdentifier:v4];

  return v6;
}

- (id)_legibilitySettings
{
  id v3 = [(NCNotificationStructuredSectionList *)self delegate];
  id v4 = [v3 legibilitySettingsForNotificationListBaseComponent:self];

  return v4;
}

- (id)_backgroundGroupNameBase
{
  id v3 = [(NCNotificationStructuredSectionList *)self delegate];
  id v4 = [v3 backgroundGroupNameBaseForNotificationListBaseComponent:self];

  return v4;
}

- (BOOL)_shouldClearPersistentNotificationRequests
{
  return [(NCNotificationStructuredSectionList *)self sectionType] != 2;
}

- (id)_collapsedSectionSummaryString
{
  uint64_t v21 = 0;
  os_log_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  unint64_t v17 = __69__NCNotificationStructuredSectionList__collapsedSectionSummaryString__block_invoke;
  id v18 = &unk_1E6A91D00;
  os_log_t v20 = &v21;
  id v5 = v3;
  id v19 = v5;
  [v4 enumerateObjectsUsingBlock:&v15];

  id v6 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v5];
  unint64_t v7 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v22[3]];
  unint64_t v9 = [v7 localizedStringFromNumber:v8 numberStyle:0];

  unint64_t v10 = NSString;
  id v11 = NCUserNotificationsUIKitFrameworkBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"NOTIFICATION_LIST_STACK_SUMMARY" value:&stru_1F2F516F8 table:0];
  id v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9, v6, v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);

  return v13;
}

void __69__NCNotificationStructuredSectionList__collapsedSectionSummaryString__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    id v5 = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 notificationCount];
    id v6 = [v5 leadingNotificationRequest];

    unint64_t v7 = [v6 content];
    uint64_t v10 = [v7 defaultHeader];

    uint64_t v8 = (void *)v10;
    if (v10)
    {
      char v9 = [*(id *)(a1 + 32) containsObject:v10];
      uint64_t v8 = (void *)v10;
      if ((v9 & 1) == 0)
      {
        [*(id *)(a1 + 32) addObject:v10];
        uint64_t v8 = (void *)v10;
      }
    }
  }
}

- (BOOL)isSectionListCurrentlyGroupedWithContentShown
{
  if (![(NCNotificationStructuredSectionList *)self isSectionListViewGroupedWithContentShown])return 0; {
  uint64_t v3 = [(NCNotificationStructuredSectionList *)self listView];
  }
  if ([v3 isGrouped])
  {
    id v4 = [(NCNotificationStructuredSectionList *)self notificationGroups];
    BOOL v5 = (unint64_t)[v4 count] > 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_areNotificationsLoadedForSectionIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationStructuredSectionList *)self delegate];
  LOBYTE(self) = [v5 notificationStructuredSectionList:self areNotificationsLoadedForSectionIdentifier:v4];

  return (char)self;
}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 sectionIdentifier];
  id v6 = [(NCNotificationStructuredSectionList *)self _sectionSettingsForSectionIdentifier:v5];

  if [v4 isCriticalAlert] && (objc_msgSend(v6, "criticalAlertsEnabled"))
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [v4 sectionIdentifier];
    BOOL v7 = [(NCNotificationStructuredSectionList *)self _shouldHideForSectionIdentifier:v8];
  }
  return v7;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  id v4 = [a3 sectionIdentifier];
  LOBYTE(self) = [(NCNotificationStructuredSectionList *)self _shouldHideForSectionIdentifier:v4];

  return (char)self;
}

- (BOOL)_shouldHideForSectionIdentifier:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self _sectionSettingsForSectionIdentifier:a3];
  if (v4)
  {
    if (![(NCNotificationStructuredSectionList *)self deviceAuthenticated]
      && ![v4 showsInLockScreen]
      || ![v4 notificationsEnabled])
    {
      BOOL v5 = 1;
      goto LABEL_9;
    }
    if (([v4 showsInNotificationCenter] & 1) == 0)
    {
      BOOL v5 = [(NCNotificationStructuredSectionList *)self isHistorySection];
      goto LABEL_9;
    }
  }
  BOOL v5 = 0;
LABEL_9:

  return v5;
}

- (void)_addHiddenNotificationGroupList:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__1;
  id v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  BOOL v5 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __71__NCNotificationStructuredSectionList__addHiddenNotificationGroupList___block_invoke;
  uint64_t v12 = &unk_1E6A92D68;
  id v6 = v4;
  id v13 = v6;
  id v14 = &v15;
  [v5 enumerateObjectsUsingBlock:&v9];

  BOOL v7 = (void *)v16[5];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "allNotificationRequests", v9, v10, v11, v12);
    [v7 mergeNotificationRequests:v8];
  }
  else
  {
    uint64_t v8 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
    [v8 addObject:v6];
  }

  _Block_object_dispose(&v15, 8);
}

void __71__NCNotificationStructuredSectionList__addHiddenNotificationGroupList___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 matchesGroup:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_hideNotificationGroupsOnDeviceReauthentication
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __86__NCNotificationStructuredSectionList__hideNotificationGroupsOnDeviceReauthentication__block_invoke;
  v2[3] = &unk_1E6A927B8;
  v2[4] = self;
  [(NCNotificationStructuredSectionList *)self _hideNotificationGroupsPassingTest:v2];
}

uint64_t __86__NCNotificationStructuredSectionList__hideNotificationGroupsOnDeviceReauthentication__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldHideNotificationGroupList:a2];
}

- (void)_showHiddenNotificationGroupsOnDeviceAuthentication
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__NCNotificationStructuredSectionList__showHiddenNotificationGroupsOnDeviceAuthentication__block_invoke;
  v3[3] = &unk_1E6A927B8;
  v3[4] = self;
  [(NCNotificationStructuredSectionList *)self _showHiddenNotificationGroupsPassingTest:v3];
  [(NCNotificationStructuredSectionList *)self _showHiddenNotificationRequestsPassingTest:0];
}

uint64_t __90__NCNotificationStructuredSectionList__showHiddenNotificationGroupsOnDeviceAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 sectionIdentifier];
  id v4 = [v2 _sectionSettingsForSectionIdentifier:v3];

  uint64_t v5 = [v4 showsInNotificationCenter];
  return v5;
}

- (void)_hideNotificationGroupsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke;
  v12[3] = &unk_1E6A92D90;
  id v13 = v5;
  id v14 = v4;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke_2;
  v11[3] = &unk_1E6A92DB8;
  void v11[4] = self;
  [v7 enumerateObjectsUsingBlock:v11];
  uint64_t v9 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
  uint64_t v10 = [v7 allObjects];
  [v9 addObjectsFromArray:v10];
}

uint64_t __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  if (!v4 || (int v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v3 = v7, v5)) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F4181820]();
}

void __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setGrouped:1 animated:0];
  uint64_t v4 = [v3 criticalAlerts];
  [*(id *)(a1 + 32) _removeNotificationGroupList:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "removeNotificationRequest:", v10, (void)v11);
        [*(id *)(a1 + 32) insertNotificationRequest:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_showHiddenNotificationGroupsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke;
  v10[3] = &unk_1E6A92DE0;
  id v11 = v5;
  id v12 = v4;
  void v10[4] = self;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke_132;
  v9[3] = &unk_1E6A92950;
  void v9[4] = self;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
  {
    id v17 = v3;
    [v3 allNotificationRequests];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      id v8 = (os_log_t *)MEMORY[0x1E4FB3778];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (v10)
          {
            os_log_t v11 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
            {
              id v12 = *(void **)(a1 + 32);
              long long v13 = v11;
              long long v14 = [v12 logDescription];
              uint64_t v15 = [v10 notificationIdentifier];
              uint64_t v16 = objc_msgSend(v15, "un_logDigest");
              *(_DWORD *)buf = 138543618;
              uint64_t v24 = v14;
              __int16 v25 = 2114;
              uint64_t v26 = v16;
              _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting hidden notification %{public}@", buf, 0x16u);
            }
            [*(id *)(a1 + 32) insertNotificationRequest:v10];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v6);
    }
    id v3 = v17;
    [*(id *)(a1 + 40) addObject:v17];
  }
}

void __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke_132(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hiddenNotificationGroups];
  [v4 removeObject:v3];
}

- (void)_showHiddenNotificationRequestsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke;
  v10[3] = &unk_1E6A92E08;
  id v11 = v5;
  id v12 = v4;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke_2;
  v9[3] = &unk_1E6A92E30;
  void v9[4] = self;
  [v7 enumerateObjectsUsingBlock:v9];
}

uint64_t __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  if (!v4 || (int v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v3 = v7, v5)) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F4181820]();
}

void __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 insertNotificationRequest:v4];
  id v5 = [*(id *)(a1 + 32) hiddenNotificationRequests];
  [v5 removeObject:v4];
}

- (void)_removeHiddenNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__1;
  unint64_t v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  id v5 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke;
  v24[3] = &unk_1E6A92E58;
  id v6 = v4;
  id v25 = v6;
  uint64_t v26 = &v27;
  [v5 enumerateObjectsUsingBlock:v24];

  if (v28[5])
  {
    id v7 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
    [v7 removeObject:v28[5]];
  }
  else
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = __Block_byref_object_copy__1;
    long long v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    id v8 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke_2;
    uint64_t v15 = &unk_1E6A92D68;
    id v9 = v6;
    id v16 = v9;
    id v17 = &v18;
    [v8 enumerateObjectsUsingBlock:&v12];

    uint64_t v10 = (void *)v19[5];
    if (v10)
    {
      objc_msgSend(v10, "removeNotificationRequest:", v9, v12, v13, v14, v15);
      if (![(id)v19[5] count])
      {
        id v11 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
        [v11 removeObject:v19[5]];
      }
    }

    _Block_object_dispose(&v18, 8);
  }

  _Block_object_dispose(&v27, 8);
}

void __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 matchesRequest:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isGroupForNotificationRequest:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_modifyHiddenNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1;
  long long v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  id v5 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke;
  v12[3] = &unk_1E6A92E58;
  id v6 = v4;
  id v13 = v6;
  long long v14 = &v15;
  [v5 enumerateObjectsUsingBlock:v12];

  if (v16[5])
  {
    id v7 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
    [v7 removeObject:v16[5]];

    id v8 = [(NCNotificationStructuredSectionList *)self hiddenNotificationRequests];
    [v8 addObject:v6];
  }
  else
  {
    id v9 = [(NCNotificationStructuredSectionList *)self hiddenNotificationGroups];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke_2;
    v10[3] = &unk_1E6A92DB8;
    id v11 = v6;
    [v9 enumerateObjectsUsingBlock:v10];

    id v8 = v11;
  }

  _Block_object_dispose(&v15, 8);
}

void __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 matchesRequest:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 isGroupForNotificationRequest:*(void *)(a1 + 32)])
  {
    [v5 modifyNotificationRequest:*(void *)(a1 + 32)];
    *a3 = 1;
  }
}

- (BOOL)_shouldFilterNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  LOBYTE(self) = [v5 notificationStructuredSectionList:self shouldFilterNotificationRequest:v4];

  return (char)self;
}

- (void)_filterNotificationRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  id v6 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__NCNotificationStructuredSectionList__filterNotificationRequest___block_invoke;
    v18[3] = &unk_1E6A92E80;
    id v19 = v4;
    id v8 = [v7 objectsPassingTest:v18];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 removeObject:*(void *)(*((void *)&v14 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
    [v13 setObject:v7 forKey:v5];
  }
  [v7 addObject:v4];
}

uint64_t __66__NCNotificationStructuredSectionList__filterNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (void)_removeFilteredNotificationRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  id v6 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__NCNotificationStructuredSectionList__removeFilteredNotificationRequest___block_invoke;
    v17[3] = &unk_1E6A92E80;
    id v18 = v4;
    id v8 = [v7 objectsPassingTest:v17];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 removeObject:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __74__NCNotificationStructuredSectionList__removeFilteredNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (void)_filterNotificationRequestsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationStructuredSectionList *)self count];
  id v6 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
  id v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v8 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
    [v8 setObject:v7 forKey:v4];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke;
  v17[3] = &unk_1E6A92ED0;
  id v18 = v4;
  id v19 = self;
  id v20 = v7;
  id v11 = v9;
  id v21 = v11;
  id v12 = v7;
  id v13 = v4;
  [v10 enumerateObjectsUsingBlock:v17];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_3;
  v16[3] = &unk_1E6A92DB8;
  v16[4] = self;
  [v11 enumerateObjectsUsingBlock:v16];
  unint64_t v14 = [(NCNotificationStructuredSectionList *)self count];
  if (v5 && !v14)
  {
    long long v15 = [(NCNotificationStructuredSectionList *)self listView];
    [v15 reloadHeaderView];
  }
}

void __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sectionIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [v3 allNotificationRequests];
    id v7 = (void *)[v6 copy];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_2;
    v9[3] = &unk_1E6A92EA8;
    void v9[4] = *(void *)(a1 + 40);
    id v8 = v3;
    id v10 = v8;
    id v11 = *(id *)(a1 + 48);
    [v7 enumerateObjectsUsingBlock:v9];
    if (![v8 count]) {
      [*(id *)(a1 + 56) addObject:v8];
    }
  }
}

void __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1[4], "_shouldFilterNotificationRequest:"))
  {
    [a1[5] removeNotificationRequest:v3];
    [a1[6] addObject:v3];
  }
}

uint64_t __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeNotificationGroupList:a2];
}

- (void)_unfilterNotificationRequestsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationStructuredSectionList *)self count];
  id v6 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__NCNotificationStructuredSectionList__unfilterNotificationRequestsForSectionIdentifier___block_invoke;
    v11[3] = &unk_1E6A92E30;
    void v11[4] = self;
    [v7 enumerateObjectsUsingBlock:v11];
  }
  id v8 = [(NCNotificationStructuredSectionList *)self filteredNotificationRequests];
  [v8 removeObjectForKey:v4];

  unint64_t v9 = [(NCNotificationStructuredSectionList *)self count];
  if (!v5 && v9)
  {
    id v10 = [(NCNotificationStructuredSectionList *)self listView];
    [v10 reloadHeaderView];
  }
}

uint64_t __89__NCNotificationStructuredSectionList__unfilterNotificationRequestsForSectionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertNotificationRequest:a2];
}

- (unint64_t)dynamicGroupingThreshold
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];
  id v4 = +[NCUNUIKitPrototypeDomain rootSettings];
  unint64_t v5 = v4;
  if (v3 == 1) {
    uint64_t v6 = [v4 dynamicGroupingThresholdPad];
  }
  else {
    uint64_t v6 = [v4 dynamicGroupingThreshold];
  }
  unint64_t v7 = v6;

  return v7;
}

- (BOOL)isPerformingDynamicGrouping
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self supportsDynamicGrouping];
  if (v3)
  {
    LOBYTE(v3) = [(NCNotificationStructuredSectionList *)self isDynamicGroupingActive];
  }
  return v3;
}

- (void)_toggleDynamicGroupingIfNecessary
{
}

- (void)_toggleDynamicGroupingIfNecessaryForced:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationStructuredSectionList *)self supportsDynamicGrouping])
  {
    if (a3
      || [(NCNotificationStructuredSectionList *)self isDynamicGroupingActive]
      && (unint64_t v5 = [(NCNotificationStructuredSectionList *)self notificationCount],
          v5 > [(NCNotificationStructuredSectionList *)self dynamicGroupingThreshold]))
    {
      uint64_t v6 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = v6;
        id v8 = [(NCNotificationStructuredSectionList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        id v23 = v8;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ turning dynamic grouping OFF", buf, 0xCu);
      }
      self->_dynamicGroupingActive = 0;
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v11 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke;
      v19[3] = &unk_1E6A91C20;
      v19[4] = self;
      id v20 = v10;
      id v21 = v9;
      id v12 = v9;
      id v13 = v10;
      [v11 enumerateObjectsUsingBlock:v19];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_2;
      v18[3] = &unk_1E6A92DB8;
      void v18[4] = self;
      [v12 enumerateObjectsUsingBlock:v18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_3;
      v17[3] = &unk_1E6A92E30;
      void v17[4] = self;
      [v13 enumerateObjectsUsingBlock:v17];
    }
    else if (![(NCNotificationStructuredSectionList *)self isDynamicGroupingActive] {
           && ![(NCNotificationStructuredSectionList *)self count])
    }
    {
      unint64_t v14 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = v14;
        long long v16 = [(NCNotificationStructuredSectionList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        id v23 = v16;
        _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ turning dynamic grouping ON", buf, 0xCu);
      }
      self->_dynamicGroupingActive = 1;
    }
  }
}

void __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = a1[4];
  uint64_t v6 = [v12 sectionIdentifier];
  unint64_t v7 = [v12 threadIdentifier];
  id v8 = [a1[4] notificationGroups];
  uint64_t v9 = [v5 _existingIndexOfGroupWithSectionIdentifier:v6 threadIdentifier:v7 inNotificationGroupLists:v8];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != a3)
  {
    id v11 = [v12 allNotificationRequests];
    [a1[5] addObjectsFromArray:v11];
    [a1[6] addObject:v12];
  }
}

uint64_t __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeNotificationGroupList:a2];
}

uint64_t __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertNotificationRequest:a2];
}

- (void)_toggleHiddenNotificationsOnAuthenticationChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationStructuredSectionList *)self isPerformingDynamicGrouping]
    && [(NCNotificationStructuredSectionList *)self count])
  {
    if (v3
      || ([(NCNotificationStructuredSectionList *)self groupListPresentingLongLook],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      uint64_t v9 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        uint64_t v11 = [(NCNotificationStructuredSectionList *)self logDescription];
        id v12 = (void *)v11;
        id v13 = @"collapsing";
        if (v3) {
          id v13 = @"expanding";
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v11;
        __int16 v33 = 2112;
        __int16 v34 = v13;
        _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ notification groups for dynamic grouping on authentication change", buf, 0x16u);
      }
      self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock = 0;
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v15 = [(NCNotificationStructuredSectionList *)self notificationGroups];
      long long v16 = (void *)[v15 copy];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __88__NCNotificationStructuredSectionList__toggleHiddenNotificationsOnAuthenticationChange___block_invoke;
      v27[3] = &unk_1E6A92EF8;
      v27[4] = self;
      BOOL v29 = v3;
      id v17 = v14;
      id v28 = v17;
      [v16 enumerateObjectsUsingBlock:v27];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            -[NCNotificationStructuredSectionList insertNotificationRequest:](self, "insertNotificationRequest:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), (void)v23);
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }
        while (v20);
      }
    }
    else
    {
      uint64_t v6 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = v6;
        id v8 = [(NCNotificationStructuredSectionList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = (uint64_t)v8;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring dynamic grouping on authentication change while presenting long look", buf, 0xCu);
      }
      self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock = 1;
    }
  }
}

void __88__NCNotificationStructuredSectionList__toggleHiddenNotificationsOnAuthenticationChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 sectionIdentifier];
  uint64_t v6 = [v4 _sectionSettingsForSectionIdentifier:v5];

  if ([v6 contentPreviewSetting] == 1)
  {
    unint64_t v7 = [v3 allNotificationRequests];
    id v8 = v7;
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v9 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);

      id v8 = (void *)v9;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (*(unsigned char *)(a1 + 48)) {
            objc_msgSend(v3, "removeNotificationRequest:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          }
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v15, (void)v16);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    if (!*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) _removeNotificationGroupList:v3];
    }
  }
}

- (BOOL)_shouldPreloadNotificationRequest:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationStructuredSectionList *)self preloadsNotificationRequests])
  {
    id v5 = [v4 sectionIdentifier];
    BOOL v6 = ![(NCNotificationStructuredSectionList *)self _areNotificationsLoadedForSectionIdentifier:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_groupListForPreloadedNotificationRequest:(id)a3 createNewIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 sectionIdentifier];
  id v8 = [v6 threadIdentifier];
  uint64_t v9 = [(NCNotificationStructuredSectionList *)self preloadedNotificationGroups];
  id v10 = [v9 objectForKey:v7];

  if (v10)
  {
    unint64_t v11 = [(NCNotificationStructuredSectionList *)self _existingIndexOfGroupForNotificationRequest:v6 withSectionIdentifier:v7 threadIdentifier:v8 inNotificationGroupLists:v10];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = [v10 objectAtIndex:v11];
      if (v12) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  else
  {
    if (!v4)
    {
      id v10 = 0;
      id v12 = 0;
      goto LABEL_11;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = [(NCNotificationStructuredSectionList *)self preloadedNotificationGroups];
    [v13 setObject:v10 forKey:v7];
  }
  id v12 = 0;
LABEL_8:
  if (v4)
  {
    id v12 = [(NCNotificationStructuredSectionList *)self _newGroupListForNotificationRequest:v6];
    [v10 addObject:v12];
  }
LABEL_11:

  return v12;
}

- (void)_insertPreloadedNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self _groupListForPreloadedNotificationRequest:v4 createNewIfNecessary:1];
  [v5 insertNotificationRequest:v4];
}

- (void)_modifyPreloadedNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self _groupListForPreloadedNotificationRequest:v4 createNewIfNecessary:0];
  [v5 modifyNotificationRequest:v4];
}

- (void)_removePreloadedNotificationRequest:(id)a3
{
  id v8 = a3;
  id v4 = [(NCNotificationStructuredSectionList *)self _groupListForPreloadedNotificationRequest:v8 createNewIfNecessary:0];
  [v4 removeNotificationRequest:v8];
  if (![v4 count])
  {
    id v5 = [(NCNotificationStructuredSectionList *)self preloadedNotificationGroups];
    id v6 = [v8 sectionIdentifier];
    unint64_t v7 = [v5 objectForKey:v6];

    [v7 removeObject:v4];
  }
}

- (void)_postPreloadedNotificationRequestsForSectionIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self preloadedNotificationGroups];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    unint64_t v7 = (os_log_t *)MEMORY[0x1E4FB3778];
    id v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      id v10 = [(NCNotificationStructuredSectionList *)self logDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v10;
      __int16 v34 = 2048;
      uint64_t v35 = [v6 count];
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting preloaded notification requests [group count:%lu] for section %{public}@", buf, 0x20u);
    }
    long long v25 = v6;
    id v26 = v4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v16, "count", v25))
          {
            objc_msgSend(v16, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
            os_log_t v17 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
            {
              long long v18 = v17;
              long long v19 = [(NCNotificationStructuredSectionList *)self logDescription];
              uint64_t v20 = [v16 logDescription];
              *(_DWORD *)buf = 138543618;
              __int16 v33 = v19;
              __int16 v34 = 2114;
              uint64_t v35 = (uint64_t)v20;
              _os_log_impl(&dword_1D7C04000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting preload notification group %{public}@", buf, 0x16u);
            }
            unint64_t v21 = [(NCNotificationStructuredSectionList *)self count];
            [(NCNotificationStructuredSectionList *)self _updatePositionOfGroup:v16 atIndex:0x7FFFFFFFFFFFFFFFLL];
            unint64_t v22 = [(NCNotificationStructuredSectionList *)self count];
            if (!v21 && v22)
            {
              long long v23 = [(NCNotificationStructuredSectionList *)self listView];
              [v23 reloadHeaderView];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    long long v24 = [(NCNotificationStructuredSectionList *)self preloadedNotificationGroups];
    id v4 = v26;
    [v24 removeObjectForKey:v26];

    id v6 = v25;
  }
}

- (BOOL)isShowingSummarizedStackForNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__NCNotificationStructuredSectionList_isShowingSummarizedStackForNotificationRequest___block_invoke;
  v8[3] = &unk_1E6A91D78;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __86__NCNotificationStructuredSectionList_isShowingSummarizedStackForNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isLeadingNotificationRequest:*(void *)(a1 + 32)]
    && [v6 summarizedNotificationCountForLeadingRequest])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isShowingSummaryForNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__NCNotificationStructuredSectionList_isShowingSummaryForNotificationRequest___block_invoke;
  v8[3] = &unk_1E6A91D78;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __78__NCNotificationStructuredSectionList_isShowingSummaryForNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isShowingSummaryForRequest:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)setListView:(id)a3
{
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (NSString)logDescription
{
  return self->_logDescription;
}

- (BOOL)deviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategordouble y = a3;
}

- (NCNotificationListComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)supportsDynamicGrouping
{
  return self->_supportsDynamicGrouping;
}

- (void)setSupportsDynamicGrouping:(BOOL)a3
{
  self->_supportsDynamicGrouping = a3;
}

- (BOOL)isHistorySection
{
  return self->_historySection;
}

- (void)setHistorySection:(BOOL)a3
{
  self->_historySection = a3;
}

- (BOOL)isNotificationListViewRevealed
{
  return self->_notificationListViewRevealed;
}

- (void)setNotificationListViewRevealed:(BOOL)a3
{
  self->_notificationListViewRevealed = a3;
}

- (BOOL)preloadsNotificationRequests
{
  return self->_preloadsNotificationRequests;
}

- (void)setPreloadsNotificationRequests:(BOOL)a3
{
  self->_preloadsNotificationRequests = a3;
}

- (NSString)sectionListDestination
{
  return self->_sectionListDestination;
}

- (void)setSectionListDestination:(id)a3
{
}

- (BOOL)isSectionListViewGroupedWithContentShown
{
  return self->_sectionListViewGroupedWithContentShown;
}

- (BOOL)allowSectionListViewGroupedWithContentShownAnimations
{
  return self->_allowSectionListViewGroupedWithContentShownAnimations;
}

- (void)setAllowSectionListViewGroupedWithContentShownAnimations:(BOOL)a3
{
  self->_allowSectionListViewGroupedWithContentShownAnimations = a3;
}

- (NSMutableSet)hiddenNotificationGroups
{
  return self->_hiddenNotificationGroups;
}

- (void)setHiddenNotificationGroups:(id)a3
{
}

- (NSMutableSet)hiddenNotificationRequests
{
  return self->_hiddenNotificationRequests;
}

- (void)setHiddenNotificationRequests:(id)a3
{
}

- (NSMutableDictionary)filteredNotificationRequests
{
  return self->_filteredNotificationRequests;
}

- (void)setFilteredNotificationRequests:(id)a3
{
}

- (NSMutableDictionary)preloadedNotificationGroups
{
  return self->_preloadedNotificationGroups;
}

- (void)setPreloadedNotificationGroups:(id)a3
{
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewHeight = a3;
}

- (BOOL)isHeaderViewHeightValid
{
  return self->_headerViewHeightValid;
}

- (void)setHeaderViewHeightValid:(BOOL)a3
{
  self->_headerViewHeightValid = a3;
}

- (void)setDynamicGroupingThreshold:(unint64_t)a3
{
  self->_dynamicGroupingThreshold = a3;
}

- (void)setPerformingDynamicGrouping:(BOOL)a3
{
  self->_performingDynamicGrouping = a3;
}

- (BOOL)isDynamicGroupingActive
{
  return self->_dynamicGroupingActive;
}

- (void)setDynamicGroupingActive:(BOOL)a3
{
  self->_dynamicGroupingActive = a3;
}

- (NCNotificationListComponent)groupListPresentingLongLook
{
  return self->_groupListPresentingLongLook;
}

- (void)setGroupListPresentingLongLook:(id)a3
{
}

- (NCNotificationListBaseComponent)groupListWithActionsRevealed
{
  return self->_groupListWithActionsRevealed;
}

- (void)setGroupListWithActionsRevealed:(id)a3
{
}

- (BOOL)deferDynamicGroupingForPresentedLongLookOnDeviceLock
{
  return self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock;
}

- (void)setDeferDynamicGroupingForPresentedLongLookOnDeviceLock:(BOOL)a3
{
  self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock = a3;
}

- (NCNotificationListSectionHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (NSMutableArray)notificationGroups
{
  return self->_notificationGroups;
}

- (void)setNotificationGroups:(id)a3
{
}

- (NSMutableSet)groupListsToSort
{
  return self->_groupListsToSort;
}

- (void)setGroupListsToSort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupListsToSort, 0);
  objc_storeStrong((id *)&self->_notificationGroups, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_groupListWithActionsRevealed, 0);
  objc_storeStrong((id *)&self->_groupListPresentingLongLook, 0);
  objc_storeStrong((id *)&self->_preloadedNotificationGroups, 0);
  objc_storeStrong((id *)&self->_filteredNotificationRequests, 0);
  objc_storeStrong((id *)&self->_hiddenNotificationRequests, 0);
  objc_storeStrong((id *)&self->_hiddenNotificationGroups, 0);
  objc_storeStrong((id *)&self->_sectionListDestination, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);

  objc_storeStrong((id *)&self->_listView, 0);
}

void __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 logDescription];
  id v8 = [a3 logDescription];
  id v9 = NCNotificationListSectionTypeString([*(id *)(a1 + 32) sectionType]);
  id v10 = [a3 listView];
  [v10 isRevealed];
  uint64_t v11 = [a3 listView];
  [v11 revealPercentage];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D7C04000, v12, v13, "%{public}@ merged thread '%{public}@' in '%{public}@' is not reveal correctly; isRevealed: %{public}d; revealPercentage: %{public}f",
    v14,
    v15,
    v16,
    v17,
    v18);
}

- (void)insertNotificationRequest:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = [a2 logDescription];
  unint64_t v7 = [a3 logDescription];
  id v8 = NCNotificationListSectionTypeString([a2 sectionType]);
  id v9 = [a3 listView];
  [v9 isRevealed];
  id v10 = [a3 listView];
  [v10 revealPercentage];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D7C04000, v11, v12, "%{public}@ thread '%{public}@' in '%{public}@' is not reveal correctly; isRevealed: %{public}d; revealPercentage: %{public}f",
    v13,
    v14,
    v15,
    v16,
    v17);
}

@end