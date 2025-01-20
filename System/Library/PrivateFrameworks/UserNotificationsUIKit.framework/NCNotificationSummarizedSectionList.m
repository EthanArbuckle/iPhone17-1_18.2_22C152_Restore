@interface NCNotificationSummarizedSectionList
- (BOOL)_shouldHideNotificationGroupList:(id)a3;
- (BOOL)_shouldHideNotificationRequest:(id)a3;
- (BOOL)_shouldPerformSwipeClipping;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3;
- (BOOL)isHorizontallyDisplaced;
- (BOOL)isPerformingClearAll;
- (BOOL)isViewVisibleForNotificationGroupList:(id)a3;
- (BOOL)notificationGroupListShouldReloadNotificationCells:(id)a3;
- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4;
- (BOOL)shouldAdjustIndex;
- (BOOL)shouldContinuePresentingActionButtonsForSwipeInteraction:(id)a3;
- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3;
- (BOOL)swipeInteraction:(id)a3 shouldRevealActionsFromLayoutLocation:(unint64_t)a4;
- (NCNotificationSummaryOrderProvider)summaryOrderProvider;
- (NCNotificationSummaryPlatterContainingView)summaryPlatterContainingView;
- (NSUUID)atxUUID;
- (PLSwipeInteraction)summaryPlatterViewSwipeInteraction;
- (double)buttonsCornerRadiusForSwipeInteraction:(id)a3;
- (double)collapsedHeight;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_clearAction;
- (id)_newSectionHeaderView;
- (id)_notificationGroupsForDigestRankOrdering;
- (id)comparisonDate;
- (id)materialGroupNameBaseForNotificationSummaryOrderProvider:(id)a3;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)swipeInteraction:(id)a3 actionsToRevealFromLayoutLocation:(unint64_t)a4;
- (id)titlesForSectionListsInSummaryForSummaryOrderProvider:(id)a3;
- (id)viewToMoveForSwipeInteraction:(id)a3;
- (unint64_t)notificationListViewNumberOfItems:(id)a3;
- (void)_collapseAllGroupListViews;
- (void)_collapseAllSectionListViews;
- (void)_collapseSection;
- (void)_configureSectionListView:(id)a3;
- (void)_configureSummaryPlatterViewSwipeInteractionIfNecessary;
- (void)_configureSwipeClippingIfNecessary;
- (void)_didPerformSignificantUserInteraction;
- (void)_expandSection;
- (void)_hideSummaryPlatterView;
- (void)_insertViewToListAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_reloadGroupListLeadingNotificationRequests;
- (void)_removeViewFromListAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5;
- (void)_resetSwipeClipping;
- (void)_setupSwipeClipping;
- (void)_showSummaryPlatterView;
- (void)_updateSectionForRankOrderedIfNecessaryAndReloadDigest:(BOOL)a3;
- (void)clearAll;
- (void)insertNotificationRequest:(id)a3;
- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4;
- (void)notificationSummaryOrderProvider:(id)a3 didUpdateOrderedNotificationGroupLists:(id)a4;
- (void)notificationSummaryOrderProvider:(id)a3 requestsPerformingDefaultActionForNotificationRequest:(id)a4 inGroupList:(id)a5;
- (void)notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)sectionHeaderViewDidRequestCollapsing:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setHorizontallyDisplaced:(BOOL)a3;
- (void)setPerformingClearAll:(BOOL)a3;
- (void)setShouldAdjustIndex:(BOOL)a3;
- (void)setSummaryOrderProvider:(id)a3;
- (void)setSummaryPlatterContainingView:(id)a3;
- (void)setSummaryPlatterViewSwipeInteraction:(id)a3;
- (void)swipeInteraction:(id)a3 didMoveToNewXPosition:(double)a4;
- (void)swipeInteractionDidBeginHidingActions:(id)a3;
- (void)swipeInteractionDidBeginRevealingActions:(id)a3;
- (void)swipeInteractionDidSignificantUserInteraction:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
@end

@implementation NCNotificationSummarizedSectionList

- (NSUUID)atxUUID
{
  return [(NCNotificationSummaryOrderProvider *)self->_summaryOrderProvider atxUUID];
}

- (void)setSummaryOrderProvider:(id)a3
{
  v7 = (NCNotificationSummaryOrderProvider *)a3;
  if (self->_summaryOrderProvider != v7)
  {
    objc_storeStrong((id *)&self->_summaryOrderProvider, a3);
    [(NCNotificationSummaryOrderProvider *)v7 setDelegate:self];
    [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
    v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 invalidateData];

    v6 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
    [v6 setNeedsLayout];

    [(NCNotificationSummarizedSectionList *)self _configureSummaryPlatterViewSwipeInteractionIfNecessary];
  }
}

- (double)collapsedHeight
{
  v3 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
  [v3 bounds];
  double v5 = v4;

  v6 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
  objc_msgSend(v6, "sizeThatFits:", v5, INFINITY);
  double v8 = v7;

  return v8;
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v5 mergeNotificationGroups:a3 reorderGroupNotifications:a4];
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v5 updateNotificationSectionSettings:a3 previousSectionSettings:a4];
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:0];
}

- (void)clearAll
{
  [(NCNotificationSummarizedSectionList *)self setPerformingClearAll:1];
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v3 clearAll];
  [(NCNotificationSummarizedSectionList *)self setPerformingClearAll:0];
}

- (void)insertNotificationRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationStructuredSectionList *)&v4 insertNotificationRequest:a3];
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:1];
  [(NCNotificationSummarizedSectionList *)self _configureSummaryPlatterViewSwipeInteractionIfNecessary];
}

- (void)removeNotificationRequest:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationCombinedSectionList *)self containsNotificationRequest:v4])
  {
    v5.receiver = self;
    v5.super_class = (Class)NCNotificationSummarizedSectionList;
    [(NCNotificationStructuredSectionList *)&v5 removeNotificationRequest:v4];
    [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:0];
  }
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](self->_summaryOrderProvider, "setDeviceAuthenticated:");
  if ([(NCNotificationStructuredSectionList *)self deviceAuthenticated] != v3)
  {
    if (v3)
    {
      objc_super v5 = [(NCNotificationStructuredSectionList *)self listView];
      [v5 setPerformingContentRevealAnimation:1];
    }
    else
    {
      [(NCNotificationSummarizedSectionList *)self _collapseSection];
    }
    if (_NCReactiveListUI())
    {
      v6 = [(NCNotificationStructuredSectionList *)self delegate];
      [v6 notificationListComponentChangedContent:self];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v7 setDeviceAuthenticated:v3];
}

- (id)comparisonDate
{
  v2 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
  BOOL v3 = [v2 summaryDate];

  return v3;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  id v8 = a3;
  BOOL v9 = [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex];
  BOOL v10 = [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex];
  if (a4 || !v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)NCNotificationSummarizedSectionList;
    [(NCNotificationCombinedSectionList *)&v16 notificationListView:v8 heightForItemAtIndex:a4 - v9 withWidth:a5];
    double v13 = v14;
  }
  else
  {
    v11 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
    objc_msgSend(v11, "sizeThatFits:", a5, 0.0);
    double v13 = v12;
  }
  return v13;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex];
  BOOL v8 = [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex];
  if (a4 || !v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationSummarizedSectionList;
    uint64_t v9 = [(NCNotificationCombinedSectionList *)&v12 notificationListView:v6 viewForItemAtIndex:a4 - v7];
  }
  else
  {
    uint64_t v9 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
  }
  BOOL v10 = (void *)v9;

  return v10;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummarizedSectionList;
  id v4 = [(NCNotificationStructuredSectionList *)&v6 notificationListViewNumberOfItems:a3];
  return (unint64_t)v4 + [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex];
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 40.0;
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v10 notificationListComponent:a3 didRemoveNotificationRequest:a4];
  if (![(NCNotificationCombinedSectionList *)self notificationCount])
  {
    objc_super v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 setGrouped:1];

    objc_super v6 = [(NCNotificationStructuredSectionList *)self listView];
    [v6 reloadHeaderView];

    BOOL v7 = +[NCNotificationEventTracker sharedInstance];
    unint64_t v8 = [(NCNotificationStructuredSectionList *)self sectionType];
    uint64_t v9 = [(NCNotificationSummarizedSectionList *)self atxUUID];
    [v7 dismissedSectionType:v8 withUUID:v9];
  }
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:0];
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v9 notificationListBaseComponentDidRemoveAll:a3];
  if (![(NCNotificationCombinedSectionList *)self notificationCount])
  {
    id v4 = [(NCNotificationStructuredSectionList *)self listView];
    [v4 setGrouped:1];

    objc_super v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 reloadHeaderView];

    objc_super v6 = +[NCNotificationEventTracker sharedInstance];
    unint64_t v7 = [(NCNotificationStructuredSectionList *)self sectionType];
    unint64_t v8 = [(NCNotificationSummarizedSectionList *)self atxUUID];
    [v6 dismissedSectionType:v7 withUUID:v8];
  }
  [(NCNotificationSummarizedSectionList *)self _updateSectionForRankOrderedIfNecessaryAndReloadDigest:0];
}

- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NCNotificationStructuredSectionList *)self listView];
  char v9 = [v8 isGrouped];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationSummarizedSectionList;
    BOOL v10 = [(NCNotificationStructuredSectionList *)&v12 notificationListComponent:v6 shouldAllowInteractionsForNotificationRequest:v7];
  }

  return v10;
}

- (BOOL)notificationGroupListShouldReloadNotificationCells:(id)a3
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self listView];
  char v4 = [v3 isGrouped] ^ 1;

  return v4;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NCNotificationStructuredSectionList *)self listView];
  char v6 = [v5 isGrouped];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationSummarizedSectionList;
    BOOL v7 = [(NCNotificationStructuredSectionList *)&v9 shouldNotificationGroupListPanHorizontally:v4];
  }

  return v7;
}

- (void)sectionHeaderViewDidRequestCollapsing:(id)a3
{
  [(NCNotificationSummarizedSectionList *)self _didPerformSignificantUserInteraction];

  [(NCNotificationSummarizedSectionList *)self _collapseSection];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationCombinedSectionList *)&v5 adjustForContentSizeCategoryChange];
  [(NCNotificationSummaryOrderProvider *)self->_summaryOrderProvider adjustForContentSizeCategoryChange];
  BOOL v3 = [(NCNotificationStructuredSectionList *)self listView];
  [v3 reloadViewAtIndex:0];

  return 1;
}

- (void)notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self listView];
  int v5 = [v4 isGrouped];

  if (v5)
  {
    char v6 = [(NCNotificationStructuredSectionList *)self listView];
    [v6 reloadViewAtIndex:0];

    id v8 = [(NCNotificationStructuredSectionList *)self listView];
    BOOL v7 = [v8 superview];
    [v7 setNeedsLayout];
  }
}

- (id)materialGroupNameBaseForNotificationSummaryOrderProvider:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  int v5 = [v4 backgroundGroupNameBaseForNotificationListBaseComponent:self];

  return v5;
}

- (void)notificationSummaryOrderProvider:(id)a3 requestsPerformingDefaultActionForNotificationRequest:(id)a4 inGroupList:(id)a5
{
  char v6 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v7 = NSNumber;
  id v8 = a4;
  objc_super v9 = [v7 numberWithBool:1];
  id v12 = [v6 dictionaryWithObject:v9 forKey:@"NCNotificationActionDeferClearForNotificationSummaryKey"];

  BOOL v10 = [(NCNotificationStructuredSectionList *)self delegate];
  v11 = [v8 defaultAction];
  [v10 notificationListComponent:self requestsExecuteAction:v11 forNotificationRequest:v8 requestAuthentication:1 withParameters:v12 completion:0];
}

- (void)notificationSummaryOrderProvider:(id)a3 didUpdateOrderedNotificationGroupLists:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [(NCNotificationStructuredSectionList *)self listView];
  if (([v6 isGrouped] & 1) == 0) {
    goto LABEL_8;
  }
  BOOL v7 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  uint64_t v8 = [v7 count];
  if (v8 != [v5 count])
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_super v9 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  char v10 = [v9 isEqualToArray:v5];

  if ((v10 & 1) == 0)
  {
    v11 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      double v13 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering notification group lists", (uint8_t *)&v16, 0xCu);
    }
    double v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
    [(NCNotificationStructuredSectionList *)self setNotificationGroups:v14];

    v15 = [(NCNotificationStructuredSectionList *)self listView];
    [v15 invalidateData];
  }
LABEL_9:
}

- (id)titlesForSectionListsInSummaryForSummaryOrderProvider:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(NCNotificationCombinedSectionList *)self sectionLists];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__NCNotificationSummarizedSectionList_titlesForSectionListsInSummaryForSummaryOrderProvider___block_invoke;
  v8[3] = &unk_1E6A91C70;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __93__NCNotificationSummarizedSectionList_titlesForSectionListsInSummaryForSummaryOrderProvider___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 title];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    BOOL v3 = v4;
  }
}

- (BOOL)swipeInteraction:(id)a3 shouldRevealActionsFromLayoutLocation:(unint64_t)a4
{
  return a4 == 1;
}

- (BOOL)shouldContinuePresentingActionButtonsForSwipeInteraction:(id)a3
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self listView];
  char v4 = [v3 isGrouped];

  return v4;
}

- (id)swipeInteraction:(id)a3 actionsToRevealFromLayoutLocation:(unint64_t)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    char v4 = [(NCNotificationSummarizedSectionList *)self _clearAction];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)viewToMoveForSwipeInteraction:(id)a3
{
  BOOL v3 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
  char v4 = [v3 summaryPlatterView];

  return v4;
}

- (double)buttonsCornerRadiusForSwipeInteraction:(id)a3
{
  return 23.5;
}

- (void)swipeInteractionDidSignificantUserInteraction:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  [v4 notificationListBaseComponentDidSignificantUserInteraction:self];
}

- (void)swipeInteractionDidBeginRevealingActions:(id)a3
{
  id v4 = a3;
  [(NCNotificationSummarizedSectionList *)self setHorizontallyDisplaced:1];
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListBaseComponent:self didTransitionActionsForSwipeInteraction:v4 revealed:1];
}

- (void)swipeInteractionDidBeginHidingActions:(id)a3
{
  id v4 = a3;
  [(NCNotificationSummarizedSectionList *)self setHorizontallyDisplaced:0];
  id v5 = [(NCNotificationStructuredSectionList *)self delegate];
  [v5 notificationListBaseComponent:self didTransitionActionsForSwipeInteraction:v4 revealed:0];
}

- (void)swipeInteraction:(id)a3 didMoveToNewXPosition:(double)a4
{
  if (a4 == 0.0) {
    [(NCNotificationSummarizedSectionList *)self _resetSwipeClipping];
  }
  else {
    [(NCNotificationSummarizedSectionList *)self _configureSwipeClippingIfNecessary];
  }
}

- (void)_insertViewToListAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationStructuredSectionList *)&v4 _insertViewToListAtIndex:a3 + [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex] animated:a4];
}

- (void)_removeViewFromListAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  [(NCNotificationStructuredSectionList *)&v5 _removeViewFromListAtIndex:a3 + [(NCNotificationSummarizedSectionList *)self shouldAdjustIndex] animated:a4 isHorizontallyDisplaced:a5];
}

- (id)_newSectionHeaderView
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  id v2 = [(NCNotificationStructuredSectionList *)&v4 _newSectionHeaderView];
  [v2 setShowCollapseButton:1];
  return v2;
}

- (void)_configureSectionListView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  id v3 = a3;
  [(NCNotificationStructuredSectionList *)&v4 _configureSectionListView:v3];
  objc_msgSend(v3, "setSupportsGrouping:", 1, v4.receiver, v4.super_class);
}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  return 0;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  return 0;
}

- (id)_notificationGroupsForDigestRankOrdering
{
  id v2 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)shouldAdjustIndex
{
  id v2 = [(NCNotificationStructuredSectionList *)self listView];
  char v3 = [v2 isGrouped];

  return v3;
}

- (NCNotificationSummaryPlatterContainingView)summaryPlatterContainingView
{
  if (self->_summaryPlatterContainingView)
  {
    char v3 = [(NCNotificationSummaryOrderProvider *)self->_summaryOrderProvider leadingSummaryPlatterView];
    objc_super v4 = [(NCNotificationSummaryPlatterContainingView *)self->_summaryPlatterContainingView summaryPlatterView];

    if (v4 == v3) {
      goto LABEL_6;
    }
    objc_super v5 = [(NCNotificationSummaryPlatterContainingView *)self->_summaryPlatterContainingView summaryPlatterView];
    [v5 removeFromSuperview];
  }
  else
  {
    id v6 = objc_alloc_init(NCNotificationSummaryPlatterContainingView);
    summaryPlatterContainingView = self->_summaryPlatterContainingView;
    self->_summaryPlatterContainingView = v6;

    char v3 = [(NCNotificationSummaryOrderProvider *)self->_summaryOrderProvider leadingSummaryPlatterView];
  }
  [(NCNotificationSummaryPlatterContainingView *)self->_summaryPlatterContainingView addSubview:v3];
  [(NCNotificationSummaryPlatterContainingView *)self->_summaryPlatterContainingView setSummaryPlatterView:v3];
LABEL_6:

  uint64_t v8 = self->_summaryPlatterContainingView;

  return v8;
}

- (void)_hideSummaryPlatterView
{
  id v2 = [(NCNotificationStructuredSectionList *)self listView];
  [v2 removeViewAtIndex:0 animated:1];
}

- (void)_showSummaryPlatterView
{
  id v2 = [(NCNotificationStructuredSectionList *)self listView];
  [v2 insertViewAtIndex:0 animated:1];
}

- (void)_expandSection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(NCNotificationSummarizedSectionList *)self _didPerformSignificantUserInteraction];
  char v3 = [(NCNotificationStructuredSectionList *)self listView];
  int v4 = [v3 isGrouped];

  if ([(NCNotificationCombinedSectionList *)self count] && v4)
  {
    objc_super v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      BOOL v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Expanding summarized section %@", buf, 0xCu);
    }
    [(NCNotificationSummarizedSectionList *)self _prepareForExpand];
    BOOL v8 = [(NCNotificationStructuredSectionList *)self sectionType] == 3
      || [(NCNotificationStructuredSectionList *)self sectionType] == 5;
    id v9 = [(NCNotificationSummarizedSectionList *)self summaryOrderProvider];
    [v9 atxLogSummaryPlatterExpandedIsUpcoming:v8];

    char v10 = +[NCNotificationEventTracker sharedInstance];
    unint64_t v11 = [(NCNotificationStructuredSectionList *)self sectionType];
    id v12 = [(NCNotificationSummarizedSectionList *)self atxUUID];
    [v10 expandedSectionType:v11 withUUID:v12];

    objc_initWeak((id *)buf, self);
    double v13 = [(NCNotificationStructuredSectionList *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__NCNotificationSummarizedSectionList__expandSection__block_invoke;
    v15[3] = &unk_1E6A94388;
    objc_copyWeak(&v18, (id *)buf);
    char v19 = v4;
    id v14 = v13;
    id v16 = v14;
    v17 = self;
    [v14 notificationListComponent:self requestsAuthenticationAndPerformBlock:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

void __53__NCNotificationSummarizedSectionList__expandSection__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _reloadGroupListLeadingNotificationRequests];
    char v3 = [WeakRetained listView];
    [v3 setGrouped:*(unsigned char *)(a1 + 56) == 0];

    [WeakRetained _hideSummaryPlatterView];
    [*(id *)(a1 + 32) notificationStructuredSectionList:*(void *)(a1 + 40) transitionedGroupedStateIsGrouped:0];
    int v4 = [WeakRetained summaryPlatterViewSwipeInteraction];
    [v4 hideActionsAnimated:1 fastAnimation:0 completion:0];
  }
}

- (void)_collapseSection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = [(NCNotificationStructuredSectionList *)self listView];
  char v4 = [v3 isGrouped];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      BOOL v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v10 = 138412290;
      unint64_t v11 = v7;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Collapsing summarized section %@", (uint8_t *)&v10, 0xCu);
    }
    [(NCNotificationSummarizedSectionList *)self _collapseAllGroupListViews];
    [(NCNotificationSummarizedSectionList *)self _collapseAllSectionListViews];
    [(NCNotificationSummarizedSectionList *)self _showSummaryPlatterView];
    BOOL v8 = [(NCNotificationStructuredSectionList *)self listView];
    [v8 setGrouped:1];

    id v9 = [(NCNotificationStructuredSectionList *)self delegate];
    [v9 notificationStructuredSectionList:self transitionedGroupedStateIsGrouped:1];
  }
}

- (void)_collapseAllSectionListViews
{
  id v2 = [(NCNotificationCombinedSectionList *)self sectionLists];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_31];
}

void __67__NCNotificationSummarizedSectionList__collapseAllSectionListViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 collapseSummarizedSectionList];
  }
}

- (void)_collapseAllGroupListViews
{
  id v2 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_59_0];
}

void __65__NCNotificationSummarizedSectionList__collapseAllGroupListViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 listView];
  [v2 setGrouped:1];
}

- (void)_reloadGroupListLeadingNotificationRequests
{
  char v3 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_61_0];

  id v4 = [(NCNotificationStructuredSectionList *)self listView];
  [v4 setNeedsLayout];
}

uint64_t __82__NCNotificationSummarizedSectionList__reloadGroupListLeadingNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadLeadingNotificationRequestIfNecessaryWithAnimation:1];
}

- (void)_didPerformSignificantUserInteraction
{
  id v3 = [(NCNotificationStructuredSectionList *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 notificationListBaseComponentDidSignificantUserInteraction:self];
  }
}

- (BOOL)isViewVisibleForNotificationGroupList:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NCNotificationStructuredSectionList *)self listView];
  char v6 = [v5 isGrouped];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationSummarizedSectionList;
    BOOL v7 = [(NCNotificationStructuredSectionList *)&v9 isViewVisibleForNotificationGroupList:v4];
  }

  return v7;
}

- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NCNotificationStructuredSectionList *)self listView];
  int v6 = [v5 isGrouped];

  if (v6)
  {
    [(NCNotificationSummarizedSectionList *)self _expandSection];
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationSummarizedSectionList;
    BOOL v7 = [(NCNotificationStructuredSectionList *)&v9 handleTapOnNotificationListBaseComponent:v4];
  }

  return v7;
}

- (void)_updateSectionForRankOrderedIfNecessaryAndReloadDigest:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(NCNotificationSummarizedSectionList *)self _notificationGroupsForDigestRankOrdering];
  if (![(NCNotificationSummarizedSectionList *)self isPerformingClearAll]
    && [v5 count])
  {
    int v6 = objc_msgSend(v5, "bs_filter:", &__block_literal_global_70);
    if (v3
      || (-[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self->_summaryOrderProvider, "cachedOrderedNotificationGroupLists"), BOOL v7 = objc_claimAutoreleasedReturnValue(), v8 = [v6 isEqualToArray:v7], v7, (v8 & 1) == 0))
    {
      objc_super v9 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = v9;
        unint64_t v11 = [(NCNotificationStructuredSectionList *)self logDescription];
        int v13 = 138543618;
        id v14 = v11;
        __int16 v15 = 1024;
        BOOL v16 = v3;
        _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ updating summary and section rank ordering [reloadDigest=%{BOOL}d]", (uint8_t *)&v13, 0x12u);
      }
      [(NCNotificationSummaryOrderProvider *)self->_summaryOrderProvider updateSummaryOrderWithNotificationGroupLists:v6 reloadDigest:v3];
      if (_NCReactiveListUI())
      {
        uint64_t v12 = [(NCNotificationStructuredSectionList *)self delegate];
        [v12 notificationListComponentChangedContent:self];
      }
    }
  }
}

BOOL __94__NCNotificationSummarizedSectionList__updateSectionForRankOrderedIfNecessaryAndReloadDigest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

- (void)_configureSummaryPlatterViewSwipeInteractionIfNecessary
{
  id v12 = [(NCNotificationSummarizedSectionList *)self summaryPlatterViewSwipeInteraction];
  BOOL v3 = [v12 view];
  if (v12)
  {
    id v4 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];

    if (v3 != v4)
    {
      [v3 removeInteraction:v12];
      [(NCNotificationSummarizedSectionList *)self setSummaryPlatterViewSwipeInteraction:0];
    }
  }
  summaryPlatterViewSwipeInteraction = self->_summaryPlatterViewSwipeInteraction;
  if (summaryPlatterViewSwipeInteraction)
  {
    [(PLSwipeInteraction *)summaryPlatterViewSwipeInteraction hideActionsAnimated:0 fastAnimation:0 completion:0];
  }
  else
  {
    int v6 = (PLSwipeInteraction *)[objc_alloc(MEMORY[0x1E4F91468]) initWithDelegate:self];
    BOOL v7 = self->_summaryPlatterViewSwipeInteraction;
    self->_summaryPlatterViewSwipeInteraction = v6;

    char v8 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
    [v8 addInteraction:self->_summaryPlatterViewSwipeInteraction];

    objc_super v9 = self->_summaryPlatterViewSwipeInteraction;
    int v10 = [(NCNotificationStructuredSectionList *)self delegate];
    unint64_t v11 = [v10 backgroundGroupNameBaseForNotificationListBaseComponent:self];
    [(PLSwipeInteraction *)v9 setMaterialGroupNameBase:v11];
  }
}

- (id)_clearAction
{
  BOOL v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR" value:&stru_1F2F516F8 table:0];

  objc_initWeak(&location, self);
  objc_super v5 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __51__NCNotificationSummarizedSectionList__clearAction__block_invoke;
  unint64_t v11 = &unk_1E6A91930;
  objc_copyWeak(&v12, &location);
  int v6 = [v5 actionWithTitle:v4 image:0 identifier:@"NCNotificationSummarizedSectionListActionIdentifierClear" handler:&v8];
  objc_msgSend(v6, "setPl_defaultAction:", 1, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __51__NCNotificationSummarizedSectionList__clearAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 notificationStructuredSectionListRequestsClearingSection:v3];

    id WeakRetained = v3;
  }
}

- (void)_configureSwipeClippingIfNecessary
{
  if ([(NCNotificationSummarizedSectionList *)self _shouldPerformSwipeClipping])
  {
    [(NCNotificationSummarizedSectionList *)self _setupSwipeClipping];
  }
  else
  {
    [(NCNotificationSummarizedSectionList *)self _resetSwipeClipping];
  }
}

- (void)_setupSwipeClipping
{
  id v3 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
  id v2 = [v3 layer];
  [v2 setMaskedCorners:15];

  [v3 _setContinuousCornerRadius:23.5];
  [v3 setClipsToBounds:1];
}

- (void)_resetSwipeClipping
{
  id v3 = [(NCNotificationSummarizedSectionList *)self summaryPlatterContainingView];
  id v2 = [v3 layer];
  [v2 setMaskedCorners:0];

  [v3 setClipsToBounds:0];
}

- (BOOL)_shouldPerformSwipeClipping
{
  uint64_t v2 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v5 = [v3 userInterfaceIdiom] == 1 || (unint64_t)(v2 - 3) < 2;

  return v5;
}

- (BOOL)isHorizontallyDisplaced
{
  return self->_horizontallyDisplaced;
}

- (void)setHorizontallyDisplaced:(BOOL)a3
{
  self->_horizontallyDisplaced = a3;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationSummaryOrderProvider)summaryOrderProvider
{
  return self->_summaryOrderProvider;
}

- (void)setSummaryPlatterContainingView:(id)a3
{
}

- (void)setShouldAdjustIndex:(BOOL)a3
{
  self->_shouldAdjustIndex = a3;
}

- (PLSwipeInteraction)summaryPlatterViewSwipeInteraction
{
  return self->_summaryPlatterViewSwipeInteraction;
}

- (void)setSummaryPlatterViewSwipeInteraction:(id)a3
{
}

- (BOOL)isPerformingClearAll
{
  return self->_performingClearAll;
}

- (void)setPerformingClearAll:(BOOL)a3
{
  self->_performingClearAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryPlatterViewSwipeInteraction, 0);
  objc_storeStrong((id *)&self->_summaryPlatterContainingView, 0);

  objc_storeStrong((id *)&self->_summaryOrderProvider, 0);
}

@end