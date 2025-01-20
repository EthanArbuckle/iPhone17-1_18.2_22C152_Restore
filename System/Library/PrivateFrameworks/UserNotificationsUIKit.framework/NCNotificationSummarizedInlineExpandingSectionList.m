@interface NCNotificationSummarizedInlineExpandingSectionList
- (BOOL)_shouldCombineAppSectionLists;
- (BOOL)_shouldInsertNotificationRequestToCombinedAppSectionList:(id)a3;
- (BOOL)_shouldSplitCombinedAppSectionList;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)isCombinedAppSectionListActive;
- (BOOL)notificationStructuredSectionList:(id)a3 areNotificationsLoadedForSectionIdentifier:(id)a4;
- (BOOL)notificationStructuredSectionList:(id)a3 shouldFilterNotificationRequest:(id)a4;
- (BOOL)reloadCombinedAppSectionListOnCollapse;
- (BOOL)reloadOrderingOnCollapse;
- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3;
- (NCNotificationAppSectionList)combinedAppSectionList;
- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate;
- (NCNotificationSummarizedInlineExpandingSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4;
- (NCNotificationSummaryExpandedHeaderView)expandedHeaderView;
- (NCToggleControl)leadingPlatterViewClearControl;
- (NSMutableDictionary)appSectionLists;
- (NSMutableSet)appSectionListsToReloadOnCollapse;
- (PLPlatterView)backgroundPlatterView;
- (UIView)collapseButtonView;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (id)_newAppSectionListForRequest:(id)a3;
- (id)_newCombinedAppSectionListForRequest;
- (id)_notificationGroupsForDigestRankOrdering;
- (id)_notificationGroupsForDigestRankOrderingShouldMerge:(BOOL)a3;
- (id)allNotificationGroups;
- (id)backgroundViewForNotificationList:(id)a3;
- (id)clearControlViewForLeadingSummaryPlatterViewForSummaryOrderProvider:(id)a3;
- (id)containerViewForClickInteractionPresentedContentForNotificationSummaryExpandedHeaderView:(id)a3;
- (id)headerViewForNotificationList:(id)a3;
- (id)hoverViewForNotificationList:(id)a3;
- (id)materialGroupNameBaseForNotificationSummaryExpandedHeaderView:(id)a3;
- (id)notificationStructuredSectionList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5;
- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5;
- (void)_appSectionListDidRemoveNotificationRequests:(id)a3;
- (void)_collapseAllSectionListViews;
- (void)_collapseButtonTapped:(id)a3;
- (void)_combineAppSectionLists;
- (void)_configureBackgroundPlatterViewIfNecessary;
- (void)_configureCollapseButtonIfNecessary;
- (void)_configureExpandedHeaderViewIfNecessary;
- (void)_configureLeadingPlatterViewClearControlIfNecessary;
- (void)_configureSectionListView:(id)a3;
- (void)_handleClearControlPrimaryAction:(id)a3;
- (void)_handleClearControlTouchUpInside:(id)a3;
- (void)_insertNotificationRequestToAppSectionList:(id)a3;
- (void)_insertNotificationRequestToCombinedAppSectionList:(id)a3;
- (void)_modifyNotificationInCombinedAppSectionList:(id)a3;
- (void)_modifyNotificationRequestInAppSectionList:(id)a3;
- (void)_removeAppSectionListsIfEmpty;
- (void)_removeNotificationFromCombinedAppSectionList:(id)a3;
- (void)_removeNotificationRequestFromAppSectionList:(id)a3;
- (void)_splitCombinedAppSectionList;
- (void)_toggleCombinedAppSectionListIfNecessary;
- (void)_updateAppSectionListsOnCollapse;
- (void)_updateAppSectionListsOnExpand;
- (void)_updateAppSectionsForOrderedNotificationGroupLists:(id)a3;
- (void)insertNotificationRequest:(id)a3;
- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4;
- (void)notificationStructuredSectionList:(id)a3 transitionedGroupedStateIsGrouped:(BOOL)a4;
- (void)notificationStructuredSectionListDidClearAllNotificationRequests:(id)a3;
- (void)notificationStructuredSectionListRequestsClearingSection:(id)a3;
- (void)notificationSummaryExpandedHeaderView:(id)a3 acceptedSummaryOnboarding:(BOOL)a4;
- (void)notificationSummaryExpandedHeaderView:(id)a3 didTransitionToClearState:(BOOL)a4;
- (void)notificationSummaryExpandedHeaderViewDidBeginClickInteraction:(id)a3;
- (void)notificationSummaryExpandedHeaderViewDidDismssClickInteractionPresentedContent:(id)a3;
- (void)notificationSummaryExpandedHeaderViewDidPresentClickInteractionPresentedContent:(id)a3;
- (void)notificationSummaryExpandedHeaderViewRequestsClearAll:(id)a3;
- (void)notificationSummaryOrderProvider:(id)a3 didUpdateOrderedNotificationGroupLists:(id)a4;
- (void)removeNotificationRequest:(id)a3;
- (void)resetClearButtonStateAnimated:(BOOL)a3;
- (void)setAppSectionLists:(id)a3;
- (void)setAppSectionListsToReloadOnCollapse:(id)a3;
- (void)setBackgroundPlatterView:(id)a3;
- (void)setCollapseButtonView:(id)a3;
- (void)setCombinedAppSectionList:(id)a3;
- (void)setCombinedAppSectionListActive:(BOOL)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setExpandedHeaderView:(id)a3;
- (void)setHandlerDelegate:(id)a3;
- (void)setLeadingPlatterViewClearControl:(id)a3;
- (void)setReloadCombinedAppSectionListOnCollapse:(BOOL)a3;
- (void)setReloadOrderingOnCollapse:(BOOL)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
@end

@implementation NCNotificationSummarizedInlineExpandingSectionList

- (NCNotificationSummarizedInlineExpandingSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  result = [(NCNotificationCombinedSectionList *)&v5 initWithTitle:a3 sectionType:a4];
  if (result) {
    result->_combinedAppSectionListActive = 1;
  }
  return result;
}

- (id)allNotificationGroups
{
  return [(NCNotificationSummarizedInlineExpandingSectionList *)self _notificationGroupsForDigestRankOrderingShouldMerge:0];
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke;
  v5[3] = &unk_1E6A91B40;
  v5[4] = self;
  BOOL v6 = a4;
  [a3 enumerateObjectsUsingBlock:v5];
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
}

void __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 sectionIdentifier];
  objc_super v5 = [*(id *)(a1 + 32) appSectionLists];
  BOOL v6 = [v5 objectForKey:v4];

  if (v6
    && ([*(id *)(a1 + 32) listView],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isGrouped],
        v7,
        v8))
  {
    v11[0] = v3;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v6 mergeNotificationGroups:v9 reorderGroupNotifications:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    v9 = [v3 allNotificationRequests];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2;
    v10[3] = &unk_1E6A91B18;
    v10[4] = *(void *)(a1 + 32);
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

uint64_t __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertNotificationRequest:a2];
}

- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive])
  {
    v11 = [(NCNotificationSummarizedInlineExpandingSectionList *)self combinedAppSectionList];
    v12 = [v11 removeNotificationGroupListsForMigrationPassingTest:v8 filterRequestsPassingTest:v9 animate:v5];
    [v10 addObjectsFromArray:v12];
  }
  else
  {
    v13 = [(NCNotificationSummarizedInlineExpandingSectionList *)self appSectionLists];
    v14 = [v13 allValues];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __140__NCNotificationSummarizedInlineExpandingSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke;
    v19 = &unk_1E6A91B68;
    id v20 = v10;
    id v21 = v8;
    id v22 = v9;
    BOOL v23 = v5;
    [v14 enumerateObjectsUsingBlock:&v16];
  }
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _removeAppSectionListsIfEmpty];

  return v10;
}

void __140__NCNotificationSummarizedInlineExpandingSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 removeNotificationGroupListsForMigrationPassingTest:*(void *)(a1 + 40) filterRequestsPassingTest:*(void *)(a1 + 48) animate:*(unsigned __int8 *)(a1 + 56)];
  [v2 addObjectsFromArray:v3];
}

- (void)insertNotificationRequest:(id)a3
{
  id v6 = a3;
  if (![(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive])goto LABEL_6; {
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self _shouldInsertNotificationRequestToCombinedAppSectionList:v6])
  }
  {
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _insertNotificationRequestToCombinedAppSectionList:v6];
    goto LABEL_7;
  }
  v4 = [(NCNotificationStructuredSectionList *)self listView];
  int v5 = [v4 isGrouped];

  if (v5)
  {
    [(NCNotificationSummarizedInlineExpandingSectionList *)self setCombinedAppSectionListActive:0];
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _splitCombinedAppSectionList];
LABEL_6:
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _insertNotificationRequestToAppSectionList:v6];
    goto LABEL_7;
  }
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _insertNotificationRequestToCombinedAppSectionList:v6];
  [(NCNotificationSummarizedInlineExpandingSectionList *)self setReloadCombinedAppSectionListOnCollapse:1];
LABEL_7:
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
  [(NCNotificationSummarizedSectionList *)self _configureSummaryPlatterViewSwipeInteractionIfNecessary];
}

- (void)modifyNotificationRequest:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive])
  {
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _modifyNotificationInCombinedAppSectionList:v4];
  }
  else
  {
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _modifyNotificationRequestInAppSectionList:v4];
  }

  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
}

- (void)removeNotificationRequest:(id)a3
{
  id v6 = a3;
  if (-[NCNotificationCombinedSectionList containsNotificationRequest:](self, "containsNotificationRequest:"))
  {
    if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive])
    {
      [(NCNotificationSummarizedInlineExpandingSectionList *)self _removeNotificationFromCombinedAppSectionList:v6];
    }
    else
    {
      [(NCNotificationSummarizedInlineExpandingSectionList *)self _removeNotificationRequestFromAppSectionList:v6];
      if ([(NCNotificationSummarizedInlineExpandingSectionList *)self _shouldCombineAppSectionLists])
      {
        id v4 = [(NCNotificationStructuredSectionList *)self listView];
        int v5 = [v4 isGrouped];

        if (v5)
        {
          [(NCNotificationSummarizedInlineExpandingSectionList *)self setCombinedAppSectionListActive:1];
          [(NCNotificationSummarizedInlineExpandingSectionList *)self _combineAppSectionLists];
        }
        else
        {
          [(NCNotificationSummarizedInlineExpandingSectionList *)self setReloadCombinedAppSectionListOnCollapse:1];
        }
      }
    }
    [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:0];
  }
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  [(NCNotificationSummarizedSectionList *)&v5 updateNotificationSectionSettings:a3 previousSectionSettings:a4];
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _removeAppSectionListsIfEmpty];
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  -[NCNotificationSummarizedSectionList setDeviceAuthenticated:](&v7, sel_setDeviceAuthenticated_);
  if (!a3)
  {
    leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
    if (leadingPlatterViewClearControl)
    {
      if ([(NCToggleControl *)leadingPlatterViewClearControl isExpanded])
      {
        [(NCToggleControl *)self->_leadingPlatterViewClearControl setExpanded:0];
        id v6 = [(NCNotificationStructuredSectionList *)self delegate];
        [v6 notificationListBaseComponent:self didTransitionCoalescingControlsHandler:self toClearState:0];
      }
    }
  }
}

- (id)headerViewForNotificationList:(id)a3
{
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureExpandedHeaderViewIfNecessary];
  expandedHeaderView = self->_expandedHeaderView;

  return expandedHeaderView;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureExpandedHeaderViewIfNecessary];
  -[NCNotificationSummaryExpandedHeaderView sizeThatFits:](self->_expandedHeaderView, "sizeThatFits:", a4, 0.0);
  return v6;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 8.0;
}

- (id)backgroundViewForNotificationList:(id)a3
{
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureBackgroundPlatterViewIfNecessary];
  backgroundPlatterView = self->_backgroundPlatterView;

  return backgroundPlatterView;
}

- (id)hoverViewForNotificationList:(id)a3
{
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureCollapseButtonIfNecessary];
  collapseButtonView = self->_collapseButtonView;

  return collapseButtonView;
}

- (void)notificationSummaryOrderProvider:(id)a3 didUpdateOrderedNotificationGroupLists:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(NCNotificationStructuredSectionList *)self listView];
  int v7 = [v6 isGrouped];

  id v8 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = v8;
      v11 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ updating app sections for digest ordered notifications", (uint8_t *)&v14, 0xCu);
    }
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _updateAppSectionsForOrderedNotificationGroupLists:v5];
  }
  else
  {
    if (v9)
    {
      v12 = v8;
      v13 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring updating app sections for digest ordered notifications because it is expanded", (uint8_t *)&v14, 0xCu);
    }
    [(NCNotificationSummarizedInlineExpandingSectionList *)self setReloadOrderingOnCollapse:1];
  }
}

- (id)clearControlViewForLeadingSummaryPlatterViewForSummaryOrderProvider:(id)a3
{
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureLeadingPlatterViewClearControlIfNecessary];
  leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;

  return leadingPlatterViewClearControl;
}

- (id)notificationStructuredSectionList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(NCNotificationStructuredSectionList *)self delegate];
  BOOL v9 = [v8 notificationStructuredSectionList:self requestsAuxiliaryOptionsContentProviderForNotificationRequest:v7 isLongLook:v5];

  return v9;
}

- (BOOL)notificationStructuredSectionList:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  id v5 = a4;
  double v6 = [(NCNotificationStructuredSectionList *)self delegate];
  LOBYTE(self) = [v6 notificationStructuredSectionList:self shouldFilterNotificationRequest:v5];

  return (char)self;
}

- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = [(NCNotificationStructuredSectionList *)self delegate];
  [v8 notificationListBaseComponent:self requestsScrollingToContentOffset:v7 withCompletion:a4];
}

- (BOOL)notificationStructuredSectionList:(id)a3 areNotificationsLoadedForSectionIdentifier:(id)a4
{
  id v5 = a4;
  double v6 = [(NCNotificationStructuredSectionList *)self delegate];
  LOBYTE(self) = [v6 notificationStructuredSectionList:self areNotificationsLoadedForSectionIdentifier:v5];

  return (char)self;
}

- (void)notificationStructuredSectionList:(id)a3 transitionedGroupedStateIsGrouped:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(NCNotificationStructuredSectionList *)self delegate];
  [v6 notificationStructuredSectionList:self transitionedGroupedStateIsGrouped:v4];
}

- (void)notificationStructuredSectionListRequestsClearingSection:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationStructuredSectionListRequestsClearingSection:v4];
}

- (void)notificationStructuredSectionListDidClearAllNotificationRequests:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationStructuredSectionListDidClearAllNotificationRequests:v4];
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _appSectionListDidRemoveNotificationRequests:v6];
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  [(NCNotificationSummarizedSectionList *)&v7 notificationListBaseComponentDidRemoveAll:v4];
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _appSectionListDidRemoveNotificationRequests:v9];
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  [(NCNotificationSummarizedSectionList *)&v10 notificationListComponent:v7 didRemoveNotificationRequest:v6];
}

- (void)notificationSummaryExpandedHeaderView:(id)a3 acceptedSummaryOnboarding:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(NCNotificationStructuredSectionList *)self delegate];
  if (v6)
  {
    id v7 = v6;
    [v6 notificationListComponent:self acceptedSummaryOnboarding:v4];
    id v6 = v7;
  }
}

- (id)materialGroupNameBaseForNotificationSummaryExpandedHeaderView:(id)a3
{
  BOOL v4 = [(NCNotificationStructuredSectionList *)self delegate];
  id v5 = [v4 backgroundGroupNameBaseForNotificationListBaseComponent:self];

  return v5;
}

- (void)notificationSummaryExpandedHeaderViewRequestsClearAll:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  [v4 notificationListBaseComponentRequestsClearingAll:self];
}

- (id)containerViewForClickInteractionPresentedContentForNotificationSummaryExpandedHeaderView:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  id v5 = [v4 containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:self];

  return v5;
}

- (void)notificationSummaryExpandedHeaderViewDidBeginClickInteraction:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  [v4 notificationListBaseComponent:self didBeginUserInteractionWithViewController:0];
}

- (void)notificationSummaryExpandedHeaderViewDidPresentClickInteractionPresentedContent:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListBaseComponent:self didPresentCoalescingControlsHandler:v4 inForceTouchState:1];
}

- (void)notificationSummaryExpandedHeaderViewDidDismssClickInteractionPresentedContent:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListBaseComponent:self didPresentCoalescingControlsHandler:v4 inForceTouchState:0];

  [v5 notificationListBaseComponent:self didEndUserInteractionWithViewController:0];
}

- (void)notificationSummaryExpandedHeaderView:(id)a3 didTransitionToClearState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NCNotificationStructuredSectionList *)self delegate];
  [v7 notificationListBaseComponent:self didTransitionCoalescingControlsHandler:v6 toClearState:v4];

  [v7 notificationListBaseComponentDidSignificantUserInteraction:self];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  [(NCNotificationSummarizedSectionList *)&v10 adjustForContentSizeCategoryChange];
  [(NCNotificationSummaryExpandedHeaderView *)self->_expandedHeaderView adjustForContentSizeCategoryChange];
  id v3 = [(NCNotificationSummarizedInlineExpandingSectionList *)self appSectionLists];
  BOOL v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_2];

  collapseButtonView = self->_collapseButtonView;
  self->_collapseButtonView = 0;

  id v6 = [(NCNotificationStructuredSectionList *)self listView];
  [v6 reloadHoverView];

  leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
  self->_leadingPlatterViewClearControl = 0;

  id v8 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
  [v8 updateLeadingSummaryPlatterView];

  return 1;
}

uint64_t __88__NCNotificationSummarizedInlineExpandingSectionList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCToggleControl *)self->_leadingPlatterViewClearControl isExpanded])
  {
    if (v3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __84__NCNotificationSummarizedInlineExpandingSectionList_resetClearButtonStateAnimated___block_invoke;
      v6[3] = &unk_1E6A91BB0;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v6 interactive:0 animations:200.0 completion:25.0];
    }
    else
    {
      leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
      [(NCToggleControl *)leadingPlatterViewClearControl setExpanded:0];
    }
  }
}

void __84__NCNotificationSummarizedInlineExpandingSectionList_resetClearButtonStateAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) leadingPlatterViewClearControl];
  [v1 setExpanded:0];
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return 0;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
  id v7 = [(id)v6 leadingSummaryPlatterView];
  id v8 = [(NCNotificationSummarizedInlineExpandingSectionList *)self leadingPlatterViewClearControl];
  [v8 frame];
  objc_msgSend(v7, "convertRect:toView:", 0);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.CGFloat x = v10;
  v19.origin.CGFloat y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  v18.CGFloat x = x;
  v18.CGFloat y = y;
  LOBYTE(v6) = CGRectContainsPoint(v19, v18);
  return [(NCToggleControl *)self->_leadingPlatterViewClearControl isExpanded] & v6;
}

- (void)_collapseAllSectionListViews
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NCNotificationSummarizedInlineExpandingSectionList *)self appSectionLists];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_19];

  [(NCNotificationSummarizedInlineExpandingSectionList *)self _updateAppSectionListsOnCollapse];
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self reloadCombinedAppSectionListOnCollapse])
  {
    [(NCNotificationSummarizedInlineExpandingSectionList *)self setReloadCombinedAppSectionListOnCollapse:0];
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _toggleCombinedAppSectionListIfNecessary];
    if (![(NCNotificationSummarizedInlineExpandingSectionList *)self reloadOrderingOnCollapse])
    {
      BOOL v4 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v4;
        uint64_t v6 = [(NCNotificationStructuredSectionList *)self logDescription];
        int v10 = 138543362;
        double v11 = v6;
        _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading ordering of app sections on collapse for combined app section", (uint8_t *)&v10, 0xCu);
      }
      [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
    }
  }
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self reloadOrderingOnCollapse])
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      double v9 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v10 = 138543362;
      double v11 = v9;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading ordering of app sections on collapse", (uint8_t *)&v10, 0xCu);
    }
    [(NCNotificationSummarizedInlineExpandingSectionList *)self setReloadOrderingOnCollapse:0];
    [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
  }
}

uint64_t __82__NCNotificationSummarizedInlineExpandingSectionList__collapseAllSectionListViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setExpanded:0];
}

- (id)_notificationGroupsForDigestRankOrdering
{
  return [(NCNotificationSummarizedInlineExpandingSectionList *)self _notificationGroupsForDigestRankOrderingShouldMerge:1];
}

- (void)_configureSectionListView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  id v4 = a3;
  [(NCNotificationSummarizedSectionList *)&v6 _configureSectionListView:v4];
  objc_msgSend(v4, "setGroupingAnimationStyle:", 1, v6.receiver, v6.super_class);
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 insetHorizontalMarginForNotificationListComponent:self];
  objc_msgSend(v4, "setBackgroundViewHorizontalOutsetMargin:");

  [v4 setShowStackBelowLeadingView:0];
  [v4 setSupportsBottomViewsRollUnder:0];
  [v4 setVisibleRectBottomMarginForRollUnder:-80.0];
}

- (void)_configureExpandedHeaderViewIfNecessary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  expandedHeaderView = self->_expandedHeaderView;
  if (!expandedHeaderView)
  {
    id v4 = objc_alloc_init(NCNotificationSummaryExpandedHeaderView);
    id v5 = self->_expandedHeaderView;
    self->_expandedHeaderView = v4;

    [(NCNotificationSummaryExpandedHeaderView *)self->_expandedHeaderView setDelegate:self];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v6 = [(NCNotificationListBaseContentView *)self->_expandedHeaderView requiredVisualStyleCategories];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v10) integerValue];
          uint64_t v12 = self->_expandedHeaderView;
          double v13 = [(PLPlatterView *)self->_backgroundPlatterView visualStylingProviderForCategory:v11];
          [(NCNotificationListBaseContentView *)v12 setVisualStylingProvider:v13 forCategory:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    expandedHeaderView = self->_expandedHeaderView;
  }
  CGFloat v14 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
  double v15 = [v14 summaryHeading];
  [(NCNotificationSummaryExpandedHeaderView *)expandedHeaderView setTitle:v15];

  CGFloat v16 = self->_expandedHeaderView;
  uint64_t v17 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
  -[NCNotificationSummaryExpandedHeaderView setOnboarding:](v16, "setOnboarding:", [v17 isOnboardingSummary]);

  CGPoint v18 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
  LODWORD(v17) = [v18 isOnboardingSummary];

  CGRect v19 = self->_expandedHeaderView;
  if (v17)
  {
    id v20 = NCUserNotificationsUIKitFrameworkBundle();
    id v21 = [v20 localizedStringForKey:@"NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_EXPLANATION" value:&stru_1F2F516F8 table:0];
    [(NCNotificationSummaryExpandedHeaderView *)v19 setSubtitle:v21];
  }
  else
  {
    [(NCNotificationSummaryExpandedHeaderView *)v19 setSubtitle:0];
  }
}

- (void)_configureBackgroundPlatterViewIfNecessary
{
  if (!self->_backgroundPlatterView)
  {
    BOOL v3 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:51];
    backgroundPlatterView = self->_backgroundPlatterView;
    self->_backgroundPlatterView = v3;

    [(PLPlatterView *)self->_backgroundPlatterView _setContinuousCornerRadius:28.0];
    id v5 = self->_backgroundPlatterView;
    id v7 = [(NCNotificationStructuredSectionList *)self delegate];
    objc_super v6 = [v7 backgroundGroupNameBaseForNotificationListBaseComponent:self];
    [(PLPlatterView *)v5 setMaterialGroupNameBase:v6];
  }
}

- (void)_configureCollapseButtonIfNecessary
{
  if (!self->_collapseButtonView)
  {
    BOOL v3 = (void *)MEMORY[0x1E4FB1830];
    id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
    id v14 = [v3 configurationWithFont:v4 scale:2];

    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down" withConfiguration:v14];
    objc_super v6 = (UIView *)[objc_alloc(MEMORY[0x1E4F91430]) initWithMaterialRecipe:1];
    [(UIView *)v6 setGlyph:v5];
    id v7 = [(NCNotificationStructuredSectionList *)self delegate];
    uint64_t v8 = [v7 backgroundGroupNameBaseForNotificationListBaseComponent:self];
    [(UIView *)v6 setMaterialGroupNameBase:v8];

    [(UIView *)v6 setAccessibilityIdentifier:@"notification-summary-collapse-control"];
    [(UIView *)v6 addTarget:self action:sel__collapseButtonTapped_ forControlEvents:0x2000];
    uint64_t v9 = [(UIView *)v6 _glyphView];
    objc_msgSend(v9, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    BSRectWithSize();
    -[UIView setBounds:](v6, "setBounds:");
    collapseButtonView = self->_collapseButtonView;
    self->_collapseButtonView = v6;
    uint64_t v11 = v6;

    uint64_t v12 = [(UIView *)self->_collapseButtonView layer];

    [v12 setShadowColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB60])];
    [v12 setShadowRadius:5.0];
    LODWORD(v13) = 1045220557;
    [v12 setShadowOpacity:v13];
    objc_msgSend(v12, "setShadowOffset:", 1.0, 3.0);
  }
}

- (void)_collapseButtonTapped:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__NCNotificationSummarizedInlineExpandingSectionList__collapseButtonTapped___block_invoke;
  v5[3] = &unk_1E6A91BB0;
  v5[4] = self;
  [v4 notificationListBaseComponent:self requestsScrollingToContentOffset:v5 withCompletion:0.0];
}

uint64_t __76__NCNotificationSummarizedInlineExpandingSectionList__collapseButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _collapseSection];
}

- (void)_configureLeadingPlatterViewClearControlIfNecessary
{
  if (!self->_leadingPlatterViewClearControl)
  {
    BOOL v3 = NCUserNotificationsUIKitFrameworkBundle();
    id v4 = [v3 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];
    id v5 = +[NCToggleControl dismissControlWithMaterialRecipe:51 clearAllText:v4];
    leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
    self->_leadingPlatterViewClearControl = v5;

    id v7 = self->_leadingPlatterViewClearControl;
    uint64_t v8 = [(NCNotificationStructuredSectionList *)self delegate];
    uint64_t v9 = [v8 backgroundGroupNameBaseForNotificationListBaseComponent:self];
    [(PLGlyphControl *)v7 setMaterialGroupNameBase:v9];

    [(NCToggleControl *)self->_leadingPlatterViewClearControl setVisualStyle:0];
    [(NCToggleControl *)self->_leadingPlatterViewClearControl setOverrideUserInterfaceStyle:2];
    [(NCToggleControl *)self->_leadingPlatterViewClearControl addTarget:self action:sel__handleClearControlTouchUpInside_ forControlEvents:64];
    uint64_t v10 = self->_leadingPlatterViewClearControl;
    [(NCToggleControl *)v10 addTarget:self action:sel__handleClearControlPrimaryAction_ forControlEvents:0x2000];
  }
}

- (void)_handleClearControlTouchUpInside:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  objc_msgSend(v4, "notificationListBaseComponent:didTransitionCoalescingControlsHandler:toClearState:", self, self, -[NCToggleControl isExpanded](self->_leadingPlatterViewClearControl, "isExpanded") ^ 1);
}

- (void)_handleClearControlPrimaryAction:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    objc_super v6 = [(NCNotificationStructuredSectionList *)self logDescription];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing summary via leading platter clear button", (uint8_t *)&v7, 0xCu);
  }
  [(NCNotificationSummarizedSectionList *)self clearAll];
}

- (id)_notificationGroupsForDigestRankOrderingShouldMerge:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v6 = [(NCNotificationCombinedSectionList *)self sectionLists];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __106__NCNotificationSummarizedInlineExpandingSectionList__notificationGroupsForDigestRankOrderingShouldMerge___block_invoke;
  v11[3] = &unk_1E6A91BF8;
  BOOL v13 = a3;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  [v6 enumerateObjectsUsingBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __106__NCNotificationSummarizedInlineExpandingSectionList__notificationGroupsForDigestRankOrderingShouldMerge___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 allNotificationGroups];
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) listView];
    if ([v4 isGrouped])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_6;
      }
      [v6 groupListsForSmartOrdering];
      BOOL v3 = v4 = v3;
    }
  }
LABEL_6:
  [*(id *)(a1 + 40) addObjectsFromArray:v3];
}

- (id)_newAppSectionListForRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NCNotificationAppSectionList alloc];
  id v6 = [v4 content];
  id v7 = [v6 defaultHeader];
  uint64_t v8 = [(NCNotificationAppSectionList *)v5 initWithTitle:v7 sectionType:7];

  [(NCNotificationStructuredSectionList *)v8 setDelegate:self];
  id v9 = [v4 sectionIdentifier];
  [(NCNotificationAppSectionList *)v8 setSectionIdentifier:v9];

  [(NCNotificationAppSectionList *)v8 setDeviceAuthenticated:[(NCNotificationStructuredSectionList *)self deviceAuthenticated]];
  uint64_t v10 = [(NCNotificationStructuredSectionList *)self notificationListCache];
  [(NCNotificationStructuredSectionList *)v8 setNotificationListCache:v10];

  [(NCNotificationStructuredSectionList *)v8 setNotificationListViewRevealed:1];
  uint64_t v11 = [v4 sectionIdentifier];
  [(NCNotificationStructuredSectionList *)v8 setLogDescription:v11];

  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureBackgroundPlatterViewIfNecessary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = [(NCNotificationAppSectionList *)v8 requiredVisualStyleCategories];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v20 + 1) + 8 * v16) integerValue];
        CGPoint v18 = [(PLPlatterView *)self->_backgroundPlatterView visualStylingProviderForCategory:v17];
        [(NCNotificationAppSectionList *)v8 setVisualStylingProvider:v18 forCategory:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v8;
}

- (void)_insertNotificationRequestToAppSectionList:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (!self->_appSectionLists)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    appSectionLists = self->_appSectionLists;
    self->_appSectionLists = v5;

    id v4 = v16;
  }
  id v7 = [v4 sectionIdentifier];
  id v8 = [(NSMutableDictionary *)self->_appSectionLists objectForKey:v7];
  if (!v8)
  {
    id v8 = [(NCNotificationSummarizedInlineExpandingSectionList *)self _newAppSectionListForRequest:v16];
    [(NSMutableDictionary *)self->_appSectionLists setValue:v8 forKey:v7];
  }
  id v9 = [v8 comparisonDate];
  [v8 insertNotificationRequest:v16];
  uint64_t v10 = [v8 comparisonDate];
  uint64_t v11 = [(NCNotificationStructuredSectionList *)self listView];
  int v12 = [v11 isGrouped];

  if (v12)
  {
    if (([v9 isEqualToDate:v10] & 1) == 0
      && [(NCNotificationCombinedSectionList *)self containsSectionList:v8])
    {
      [(NCNotificationCombinedSectionList *)self removeNotificationSectionList:v8 animated:0];
    }
  }
  else
  {
    appSectionListsToReloadOnCollapse = self->_appSectionListsToReloadOnCollapse;
    if (!appSectionListsToReloadOnCollapse)
    {
      uint64_t v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v15 = self->_appSectionListsToReloadOnCollapse;
      self->_appSectionListsToReloadOnCollapse = v14;

      appSectionListsToReloadOnCollapse = self->_appSectionListsToReloadOnCollapse;
    }
    [(NSMutableSet *)appSectionListsToReloadOnCollapse addObject:v8];
    [v9 isEqualToDate:v10];
  }
  if (![(NCNotificationCombinedSectionList *)self containsSectionList:v8]) {
    [(NCNotificationCombinedSectionList *)self insertNotificationSectionList:v8 atIndex:0 animated:v12 ^ 1u];
  }
}

- (void)_modifyNotificationRequestInAppSectionList:(id)a3
{
  id v4 = a3;
  if (self->_appSectionLists)
  {
    id v8 = v4;
    id v5 = [v4 sectionIdentifier];
    id v6 = [(NSMutableDictionary *)self->_appSectionLists objectForKey:v5];
    id v7 = v6;
    if (v6) {
      [v6 modifyNotificationRequest:v8];
    }

    id v4 = v8;
  }
}

- (void)_removeNotificationRequestFromAppSectionList:(id)a3
{
  id v4 = a3;
  if (self->_appSectionLists)
  {
    id v11 = v4;
    id v5 = [v4 sectionIdentifier];
    id v6 = [(NCNotificationStructuredSectionList *)self listView];
    int v7 = [v6 isGrouped];

    id v8 = [(NSMutableDictionary *)self->_appSectionLists objectForKey:v5];
    id v9 = v8;
    if (v8)
    {
      [v8 removeNotificationRequest:v11];
      if (![v9 notificationCount])
      {
        [(NCNotificationCombinedSectionList *)self removeNotificationSectionList:v9 animated:v7 ^ 1u];
        [(NSMutableDictionary *)self->_appSectionLists removeObjectForKey:v5];
      }
      if (![(NSMutableDictionary *)self->_appSectionLists count])
      {
        appSectionLists = self->_appSectionLists;
        self->_appSectionLists = 0;
      }
    }

    id v4 = v11;
  }
}

- (void)_updateAppSectionsForOrderedNotificationGroupLists:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive])
  {
    id v5 = [(NCNotificationStructuredSectionList *)self->_combinedAppSectionList allNotificationGroups];
    if (([v4 isEqualToArray:v5] & 1) == 0)
    {
      id v6 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = v6;
        id v8 = [(NCNotificationStructuredSectionList *)self logDescription];
        id v9 = [(NCNotificationStructuredSectionList *)self->_combinedAppSectionList logDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v8;
        __int16 v26 = 2114;
        uint64_t v27 = v9;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering group lists for %{public}@", buf, 0x16u);
      }
      [(NCNotificationAppSectionList *)self->_combinedAppSectionList setGroupListsForSmartOrdering:v4];
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke;
    v21[3] = &unk_1E6A91C20;
    v21[4] = self;
    id v5 = v10;
    id v22 = v5;
    id v12 = v11;
    id v23 = v12;
    [v4 enumerateObjectsUsingBlock:v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_2;
    v20[3] = &unk_1E6A91C48;
    v20[4] = self;
    [v12 enumerateKeysAndObjectsUsingBlock:v20];
    uint64_t v13 = [(NCNotificationCombinedSectionList *)self sectionLists];
    char v14 = [v13 isEqualToArray:v5];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        uint64_t v17 = [(NCNotificationStructuredSectionList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v17;
        _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering app section lists", buf, 0xCu);
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_52;
      v19[3] = &unk_1E6A91C70;
      v19[4] = self;
      [v5 enumerateObjectsUsingBlock:v19];
      [(NCNotificationCombinedSectionList *)self setSectionLists:v5];
      CGPoint v18 = [(NCNotificationStructuredSectionList *)self listView];
      [v18 invalidateData];
    }
  }
}

void __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke(id *a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [v7 sectionIdentifier];
  id v4 = [a1[4] appSectionLists];
  id v5 = [v4 objectForKey:v3];

  if (v5 && ([a1[5] containsObject:v5] & 1) == 0) {
    [a1[5] addObject:v5];
  }
  id v6 = [a1[6] objectForKey:v3];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [a1[6] setValue:v6 forKey:v3];
  }
  [v6 addObject:v7];
}

void __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 appSectionLists];
  id v9 = [v8 objectForKey:v7];

  if (v9)
  {
    id v10 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = v10;
      uint64_t v13 = [v11 logDescription];
      char v14 = [v9 logDescription];
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2114;
      CGPoint v18 = v14;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering group lists for %{public}@", (uint8_t *)&v15, 0x16u);
    }
    [v9 setGroupListsForSmartOrdering:v5];
  }
}

uint64_t __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_52(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeNotificationSectionList:a2 animated:0];
}

- (void)_appSectionListDidRemoveNotificationRequests:(id)a3
{
  int v15 = (NCNotificationAppSectionList *)a3;
  if (v15)
  {
    uint64_t v4 = [(NCNotificationStructuredSectionList *)v15 notificationCount];
    id v5 = [(NCNotificationStructuredSectionList *)self listView];
    int v6 = [v5 isGrouped];
    char v7 = v6;
    if (!v4)
    {
      [(NCNotificationCombinedSectionList *)self removeNotificationSectionList:v15 animated:v6 ^ 1u];

      if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive]&& self->_combinedAppSectionList == v15)
      {
        self->_combinedAppSectionList = 0;
        appSectionLists = v15;
      }
      else
      {
        id v11 = [(NCNotificationSummarizedInlineExpandingSectionList *)self appSectionLists];
        id v12 = [(NCNotificationAppSectionList *)v15 sectionIdentifier];
        [v11 removeObjectForKey:v12];

        if ([(NSMutableDictionary *)self->_appSectionLists count]) {
          goto LABEL_13;
        }
        appSectionLists = self->_appSectionLists;
        self->_appSectionLists = 0;
      }
LABEL_12:

      goto LABEL_13;
    }

    if ((v7 & 1) == 0)
    {
      if (!self->_appSectionListsToReloadOnCollapse)
      {
        id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        appSectionListsToReloadOnCollapse = self->_appSectionListsToReloadOnCollapse;
        self->_appSectionListsToReloadOnCollapse = v8;
      }
      appSectionLists = [(NCNotificationSummarizedInlineExpandingSectionList *)self appSectionListsToReloadOnCollapse];
      [appSectionLists addObject:v15];
      goto LABEL_12;
    }
  }
LABEL_13:
  if (![(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive]&& [(NCNotificationSummarizedInlineExpandingSectionList *)self _shouldCombineAppSectionLists])
  {
    uint64_t v13 = [(NCNotificationStructuredSectionList *)self listView];
    int v14 = [v13 isGrouped];

    if (v14)
    {
      [(NCNotificationSummarizedInlineExpandingSectionList *)self setCombinedAppSectionListActive:1];
      [(NCNotificationSummarizedInlineExpandingSectionList *)self _combineAppSectionLists];
    }
    else
    {
      [(NCNotificationSummarizedInlineExpandingSectionList *)self setReloadCombinedAppSectionListOnCollapse:1];
    }
  }
}

- (void)_updateAppSectionListsOnCollapse
{
  BOOL v3 = [(NCNotificationSummarizedInlineExpandingSectionList *)self appSectionListsToReloadOnCollapse];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_55];

  [(NCNotificationSummarizedInlineExpandingSectionList *)self setAppSectionListsToReloadOnCollapse:0];
}

void __86__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionListsOnCollapse__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 groupListsForSmartOrdering];
  [v2 setGroupListsForSmartOrdering:v3];
}

- (void)_updateAppSectionListsOnExpand
{
  id v2 = [(NCNotificationCombinedSectionList *)self sectionLists];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_57];
}

void __84__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionListsOnExpand__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = v4;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    [v4 unmergeNotificationGroupListsIfNecessary];
    id v3 = v4;
  }
}

- (void)_removeAppSectionListsIfEmpty
{
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive]&& (id v3 = self->_combinedAppSectionList) != 0)
  {
    if (![(NCNotificationStructuredSectionList *)v3 notificationCount])
    {
      combinedAppSectionList = self->_combinedAppSectionList;
      id v5 = [(NCNotificationStructuredSectionList *)self listView];
      -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", combinedAppSectionList, [v5 isGrouped] ^ 1);

      int v6 = self->_combinedAppSectionList;
      self->_combinedAppSectionList = 0;
    }
  }
  else if (![(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive]&& [(NSMutableDictionary *)self->_appSectionLists count])
  {
    char v7 = [(NSMutableDictionary *)self->_appSectionLists allValues];
    id v8 = (void *)[v7 copy];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__NCNotificationSummarizedInlineExpandingSectionList__removeAppSectionListsIfEmpty__block_invoke;
    v10[3] = &unk_1E6A91CD8;
    v10[4] = self;
    [v8 enumerateObjectsUsingBlock:v10];
    if (![(NSMutableDictionary *)self->_appSectionLists count])
    {
      appSectionLists = self->_appSectionLists;
      self->_appSectionLists = 0;
    }
  }
}

void __83__NCNotificationSummarizedInlineExpandingSectionList__removeAppSectionListsIfEmpty__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (![v7 notificationCount])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 listView];
    objc_msgSend(v3, "removeNotificationSectionList:animated:", v7, objc_msgSend(v4, "isGrouped") ^ 1);

    id v5 = *(void **)(*(void *)(a1 + 32) + 240);
    int v6 = [v7 sectionIdentifier];
    [v5 removeObjectForKey:v6];
  }
}

- (id)_newCombinedAppSectionListForRequest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [[NCNotificationAppSectionList alloc] initWithTitle:0 sectionType:7];
  [(NCNotificationStructuredSectionList *)v3 setDelegate:self];
  [(NCNotificationAppSectionList *)v3 setCombinedAppSectionList:1];
  [(NCNotificationAppSectionList *)v3 setSectionIdentifier:@"combinedAppSectionList"];
  [(NCNotificationAppSectionList *)v3 setDeviceAuthenticated:[(NCNotificationStructuredSectionList *)self deviceAuthenticated]];
  id v4 = [(NCNotificationStructuredSectionList *)self notificationListCache];
  [(NCNotificationStructuredSectionList *)v3 setNotificationListCache:v4];

  [(NCNotificationStructuredSectionList *)v3 setNotificationListViewRevealed:1];
  [(NCNotificationStructuredSectionList *)v3 setLogDescription:@"Combined App Section"];
  [(NCNotificationSummarizedInlineExpandingSectionList *)self _configureBackgroundPlatterViewIfNecessary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NCNotificationAppSectionList *)v3 requiredVisualStyleCategories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) integerValue];
        id v11 = [(PLPlatterView *)self->_backgroundPlatterView visualStylingProviderForCategory:v10];
        [(NCNotificationAppSectionList *)v3 setVisualStylingProvider:v11 forCategory:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)_shouldInsertNotificationRequestToCombinedAppSectionList:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  BOOL v6 = 1;
  char v17 = 1;
  if (self->_combinedAppSectionList)
  {
    uint64_t v7 = [v4 sectionIdentifier];
    uint64_t v8 = [(NCNotificationStructuredSectionList *)self->_combinedAppSectionList allNotificationGroups];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __111__NCNotificationSummarizedInlineExpandingSectionList__shouldInsertNotificationRequestToCombinedAppSectionList___block_invoke;
    v11[3] = &unk_1E6A91D00;
    long long v13 = &v14;
    id v9 = v7;
    id v12 = v9;
    [v8 enumerateObjectsUsingBlock:v11];

    BOOL v6 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __111__NCNotificationSummarizedInlineExpandingSectionList__shouldInsertNotificationRequestToCombinedAppSectionList___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v6 = [a2 sectionIdentifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (void)_insertNotificationRequestToCombinedAppSectionList:(id)a3
{
  id v4 = a3;
  combinedAppSectionList = self->_combinedAppSectionList;
  id v8 = v4;
  if (!combinedAppSectionList)
  {
    BOOL v6 = [(NCNotificationSummarizedInlineExpandingSectionList *)self _newCombinedAppSectionListForRequest];
    uint64_t v7 = self->_combinedAppSectionList;
    self->_combinedAppSectionList = v6;

    [(NCNotificationCombinedSectionList *)self insertNotificationSectionList:self->_combinedAppSectionList atIndex:0 animated:0];
    id v4 = v8;
    combinedAppSectionList = self->_combinedAppSectionList;
  }
  [(NCNotificationAppSectionList *)combinedAppSectionList insertNotificationRequest:v4];
}

- (void)_removeNotificationFromCombinedAppSectionList:(id)a3
{
  id v4 = a3;
  combinedAppSectionList = self->_combinedAppSectionList;
  if (combinedAppSectionList)
  {
    id v9 = v4;
    BOOL v6 = [(NCNotificationStructuredSectionList *)combinedAppSectionList containsNotificationRequest:v4];
    id v4 = v9;
    if (v6)
    {
      [(NCNotificationAppSectionList *)self->_combinedAppSectionList removeNotificationRequest:v9];
      unint64_t v7 = [(NCNotificationStructuredSectionList *)self->_combinedAppSectionList count];
      id v4 = v9;
      if (!v7)
      {
        [(NCNotificationCombinedSectionList *)self removeNotificationSectionList:self->_combinedAppSectionList animated:1];
        id v8 = self->_combinedAppSectionList;
        self->_combinedAppSectionList = 0;

        id v4 = v9;
      }
    }
  }
}

- (void)_modifyNotificationInCombinedAppSectionList:(id)a3
{
  id v4 = a3;
  combinedAppSectionList = self->_combinedAppSectionList;
  if (combinedAppSectionList)
  {
    id v7 = v4;
    BOOL v6 = [(NCNotificationStructuredSectionList *)combinedAppSectionList containsNotificationRequest:v4];
    id v4 = v7;
    if (v6)
    {
      [(NCNotificationAppSectionList *)self->_combinedAppSectionList modifyNotificationRequest:v7];
      id v4 = v7;
    }
  }
}

- (BOOL)_shouldCombineAppSectionLists
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  if ([(NSMutableDictionary *)self->_appSectionLists count])
  {
    appSectionLists = self->_appSectionLists;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__NCNotificationSummarizedInlineExpandingSectionList__shouldCombineAppSectionLists__block_invoke;
    v6[3] = &unk_1E6A91D28;
    v6[4] = &v7;
    [(NSMutableDictionary *)appSectionLists enumerateKeysAndObjectsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __83__NCNotificationSummarizedInlineExpandingSectionList__shouldCombineAppSectionLists__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = [a3 allNotificationGroups];
  if ([v11 count] == 1)
  {
    BOOL v6 = [v11 firstObject];
    BOOL v7 = [v6 notificationCount] == 1;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v10 + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) ^ 1;
}

- (void)_combineAppSectionLists
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_appSectionLists count])
  {
    id v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      char v4 = v3;
      id v5 = [(NCNotificationStructuredSectionList *)self logDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ combining app section lists into a combined list", buf, 0xCu);
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    appSectionLists = self->_appSectionLists;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke;
    v10[3] = &unk_1E6A91D50;
    id v11 = v6;
    id v12 = self;
    id v8 = v6;
    [(NSMutableDictionary *)appSectionLists enumerateKeysAndObjectsUsingBlock:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke_2;
    v9[3] = &unk_1E6A91B18;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v4 = *(void **)(a1 + 32);
  id v6 = a3;
  id v5 = [v6 allNotificationRequests];
  [v4 addObjectsFromArray:v5];

  [*(id *)(a1 + 40) removeNotificationSectionList:v6 animated:0];
}

uint64_t __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertNotificationRequestToCombinedAppSectionList:a2];
}

- (BOOL)_shouldSplitCombinedAppSectionList
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  combinedAppSectionList = self->_combinedAppSectionList;
  if (combinedAppSectionList)
  {
    id v3 = [(NCNotificationStructuredSectionList *)combinedAppSectionList allNotificationGroups];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__NCNotificationSummarizedInlineExpandingSectionList__shouldSplitCombinedAppSectionList__block_invoke;
    v8[3] = &unk_1E6A91D78;
    id v5 = v4;
    id v9 = v5;
    uint64_t v10 = &v11;
    [v3 enumerateObjectsUsingBlock:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __88__NCNotificationSummarizedInlineExpandingSectionList__shouldSplitCombinedAppSectionList__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  BOOL v6 = [v7 sectionIdentifier];
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) != 0
    || (unint64_t)[v7 notificationCount] >= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)_splitCombinedAppSectionList
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_combinedAppSectionList)
  {
    id v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(NCNotificationStructuredSectionList *)self logDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ splitting combined app section list", buf, 0xCu);
    }
    BOOL v6 = [(NCNotificationStructuredSectionList *)self->_combinedAppSectionList allNotificationRequests];
    id v7 = (void *)[v6 copy];

    [(NCNotificationCombinedSectionList *)self removeNotificationSectionList:self->_combinedAppSectionList animated:0];
    combinedAppSectionList = self->_combinedAppSectionList;
    self->_combinedAppSectionList = 0;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__NCNotificationSummarizedInlineExpandingSectionList__splitCombinedAppSectionList__block_invoke;
    v9[3] = &unk_1E6A91B18;
    v9[4] = self;
    [v7 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t __82__NCNotificationSummarizedInlineExpandingSectionList__splitCombinedAppSectionList__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertNotificationRequestToAppSectionList:a2];
}

- (void)_toggleCombinedAppSectionListIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive]&& [(NCNotificationSummarizedInlineExpandingSectionList *)self _shouldSplitCombinedAppSectionList])
  {
    id v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ splitting combined app section", (uint8_t *)&v9, 0xCu);
    }
    [(NCNotificationSummarizedInlineExpandingSectionList *)self setCombinedAppSectionListActive:0];
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _splitCombinedAppSectionList];
  }
  else if (![(NCNotificationSummarizedInlineExpandingSectionList *)self isCombinedAppSectionListActive]&& [(NCNotificationSummarizedInlineExpandingSectionList *)self _shouldCombineAppSectionLists])
  {
    BOOL v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ combining app sections", (uint8_t *)&v9, 0xCu);
    }
    [(NCNotificationSummarizedInlineExpandingSectionList *)self setCombinedAppSectionListActive:1];
    [(NCNotificationSummarizedInlineExpandingSectionList *)self _combineAppSectionLists];
  }
}

- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->handlerDelegate);

  return (NCNotificationListCoalescingControlsHandlerDelegate *)WeakRetained;
}

- (void)setHandlerDelegate:(id)a3
{
}

- (NSMutableDictionary)appSectionLists
{
  return self->_appSectionLists;
}

- (void)setAppSectionLists:(id)a3
{
}

- (NSMutableSet)appSectionListsToReloadOnCollapse
{
  return self->_appSectionListsToReloadOnCollapse;
}

- (void)setAppSectionListsToReloadOnCollapse:(id)a3
{
}

- (PLPlatterView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
}

- (NCNotificationSummaryExpandedHeaderView)expandedHeaderView
{
  return self->_expandedHeaderView;
}

- (void)setExpandedHeaderView:(id)a3
{
}

- (UIView)collapseButtonView
{
  return self->_collapseButtonView;
}

- (void)setCollapseButtonView:(id)a3
{
}

- (BOOL)reloadOrderingOnCollapse
{
  return self->_reloadOrderingOnCollapse;
}

- (void)setReloadOrderingOnCollapse:(BOOL)a3
{
  self->_reloadOrderingOnCollapse = a3;
}

- (NCToggleControl)leadingPlatterViewClearControl
{
  return self->_leadingPlatterViewClearControl;
}

- (void)setLeadingPlatterViewClearControl:(id)a3
{
}

- (NCNotificationAppSectionList)combinedAppSectionList
{
  return self->_combinedAppSectionList;
}

- (void)setCombinedAppSectionList:(id)a3
{
}

- (BOOL)isCombinedAppSectionListActive
{
  return self->_combinedAppSectionListActive;
}

- (void)setCombinedAppSectionListActive:(BOOL)a3
{
  self->_combinedAppSectionListActive = a3;
}

- (BOOL)reloadCombinedAppSectionListOnCollapse
{
  return self->_reloadCombinedAppSectionListOnCollapse;
}

- (void)setReloadCombinedAppSectionListOnCollapse:(BOOL)a3
{
  self->_reloadCombinedAppSectionListOnCollapse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedAppSectionList, 0);
  objc_storeStrong((id *)&self->_leadingPlatterViewClearControl, 0);
  objc_storeStrong((id *)&self->_collapseButtonView, 0);
  objc_storeStrong((id *)&self->_expandedHeaderView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_appSectionListsToReloadOnCollapse, 0);
  objc_storeStrong((id *)&self->_appSectionLists, 0);

  objc_destroyWeak((id *)&self->handlerDelegate);
}

@end