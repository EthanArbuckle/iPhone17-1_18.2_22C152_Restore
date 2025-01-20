@interface NCNotificationListSupplementaryViewsGroup
+ (id)presentableTypes;
- (BOOL)_shouldAllowHostedViewControllersUserInteraction;
- (BOOL)containsSupplementaryViewController:(id)a3;
- (BOOL)isClearingAllNotificationRequestsForCellHorizontalSwipe;
- (BOOL)shouldContinuePresentingActionButtonsForNotificationListCell:(id)a3;
- (BOOL)shouldImmediatelyReveal;
- (BOOL)shouldShowDefaultActionForNotificationListCell:(id)a3;
- (BOOL)shouldShowSupplementaryActionsForNotificationListCell:(id)a3;
- (BOOL)shouldVerticallyStackActionButtonsForNotificationListCell:(id)a3;
- (NCNotificationListSupplementaryViewsGroup)init;
- (NSArray)hostingViewControllers;
- (NSArray)supplementaryViewControllers;
- (NSMutableArray)orderedCells;
- (NSString)groupName;
- (NSString)groupingIdentifier;
- (NSString)sectionIdentifier;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_cellAtIndex:(unint64_t)a3;
- (id)_clearActionForCell:(id)a3;
- (id)_configurationAtIndex:(unint64_t)a3;
- (id)_configurationForCell:(id)a3;
- (id)_hostingViewControllerAtIndex:(unint64_t)a3;
- (id)_hostingViewControllerForCell:(id)a3;
- (id)_logDescription;
- (id)_supplementaryViewControllerAtIndex:(unint64_t)a3;
- (id)animator;
- (id)clearAllText;
- (id)defaultActionForNotificationListCell:(id)a3;
- (id)headerText;
- (id)hostingPlatterViewForSupplementaryViewController:(id)a3;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)purposeWithSensitiveTextHashed:(BOOL)a3;
- (id)supplementaryActionsForNotificationListCell:(id)a3;
- (id)viewControllerSortComparator;
- (unint64_t)_existingIndexMatchingSupplementaryViewController:(id)a3;
- (unint64_t)_indexOfHostingViewController:(id)a3;
- (unint64_t)_sortedIndexForViewController:(id)a3;
- (unint64_t)count;
- (void)_clearCell:(id)a3;
- (void)_matchStyleOfCell:(id)a3 toHostingViewController:(id)a4;
- (void)_removeSupplementaryViewControllerAtIndex:(unint64_t)a3;
- (void)_setGrouped:(BOOL)a3;
- (void)_updateHostingViewController:(id)a3 cell:(id)a4 withConfiguration:(id)a5;
- (void)_updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4 existingIndex:(unint64_t)a5 proposedIndex:(unint64_t)a6;
- (void)_updateUserInteraction;
- (void)animator;
- (void)clearAll;
- (void)insertSupplementaryViewController:(id)a3 withConfiguration:(id)a4;
- (void)notificationListCell:(id)a3 didBeginHidingActionsForSwipeInteraction:(id)a4;
- (void)notificationListCell:(id)a3 didBeginRevealingActionsForSwipeInteraction:(id)a4;
- (void)recycleView:(id)a3;
- (void)removeSupplementaryViewController:(id)a3;
- (void)setClearingAllNotificationRequestsForCellHorizontalSwipe:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setOrderedCells:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setViewControllerSortComparator:(id)a3;
- (void)supplementaryHostingViewControllerPreferredContentSizeChanged:(id)a3;
- (void)supplementaryHostingViewControllerWasTapped:(id)a3;
- (void)toggleGroupedState;
- (void)updatePositionIfNeededForSupplementaryViewController:(id)a3;
- (void)updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4;
@end

@implementation NCNotificationListSupplementaryViewsGroup

- (NCNotificationListSupplementaryViewsGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  v2 = [(NCNotificationListSupplementaryViewsGroup *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedCells = v2->_orderedCells;
    v2->_orderedCells = v3;
  }
  return v2;
}

- (void)insertSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NCNotificationListSupplementaryViewsGroup *)self _existingIndexMatchingSupplementaryViewController:v6];
  unint64_t v9 = [(NCNotificationListSupplementaryViewsGroup *)self _sortedIndexForViewController:v6];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = [(NCNotificationListSupplementaryViewsGroup *)self _logDescription];
      int v20 = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting new supplementary view view controller", (uint8_t *)&v20, 0xCu);
    }
    v14 = [(NCNotificationListPresentableGroup *)self delegate];
    v15 = [[NCNotificationListSupplementaryHostingViewController alloc] initWithHostedViewController:v6 sectionIdentifier:self->_sectionIdentifier];
    [(NCNotificationListSupplementaryHostingViewController *)v15 setDelegate:self];
    [(NCNotificationListSupplementaryHostingViewController *)v15 setConfiguration:v7 animated:0];
    if (objc_opt_respondsToSelector())
    {
      v16 = [v14 backgroundGroupNameBaseForNotificationListBaseComponent:self];
      [(NCNotificationListSupplementaryHostingViewController *)v15 setMaterialGroupNameBase:v16];
    }
    if (objc_opt_respondsToSelector()) {
      [v14 notificationListBaseComponent:self didAddViewController:v15];
    }
    v17 = [NCNotificationListCell alloc];
    v18 = -[NCNotificationListCell initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(NCNotificationListCell *)v18 setActionProvider:self];
    [(NCNotificationListCell *)v18 setActionHandler:self];
    [(NSMutableArray *)self->_orderedCells insertObject:v18 atIndex:v10];
    [(NCNotificationListCell *)v18 setContentViewController:v15];
    [(NCNotificationListSupplementaryViewsGroup *)self _matchStyleOfCell:v18 toHostingViewController:v15];
    v19 = [(NCNotificationListPresentableGroup *)self listView];
    [v19 insertViewAtIndex:v10 animated:1];

    [(NCNotificationListSupplementaryViewsGroup *)self _updateUserInteraction];
  }
  else
  {
    [(NCNotificationListSupplementaryViewsGroup *)self _updateSupplementaryViewController:v6 withConfiguration:v7 existingIndex:v8 proposedIndex:v10];
  }
}

- (void)updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t v7 = [(NCNotificationListSupplementaryViewsGroup *)self _existingIndexMatchingSupplementaryViewController:v8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NCNotificationListSupplementaryViewsGroup *)self _updateSupplementaryViewController:v8 withConfiguration:v6 existingIndex:v7 proposedIndex:[(NCNotificationListSupplementaryViewsGroup *)self _sortedIndexForViewController:v8]];
  }
}

- (void)updatePositionIfNeededForSupplementaryViewController:(id)a3
{
  id v5 = a3;
  unint64_t v4 = -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NCNotificationListSupplementaryViewsGroup *)self _updateSupplementaryViewController:v5 withConfiguration:0 existingIndex:v4 proposedIndex:[(NCNotificationListSupplementaryViewsGroup *)self _sortedIndexForViewController:v5]];
  }
}

- (void)removeSupplementaryViewController:(id)a3
{
  unint64_t v4 = [(NCNotificationListSupplementaryViewsGroup *)self _existingIndexMatchingSupplementaryViewController:a3];

  [(NCNotificationListSupplementaryViewsGroup *)self _removeSupplementaryViewControllerAtIndex:v4];
}

- (BOOL)containsSupplementaryViewController:(id)a3
{
  return [(NCNotificationListSupplementaryViewsGroup *)self _existingIndexMatchingSupplementaryViewController:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)hostingPlatterViewForSupplementaryViewController:(id)a3
{
  unint64_t v4 = [(NCNotificationListSupplementaryViewsGroup *)self _existingIndexMatchingSupplementaryViewController:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:v4];
    id v5 = [v6 platterView];
  }

  return v5;
}

- (NSArray)hostingViewControllers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NCNotificationListSupplementaryViewsGroup *)self count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(NCNotificationListSupplementaryViewsGroup *)self count]);
  }

  return (NSArray *)v3;
}

- (NSArray)supplementaryViewControllers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NCNotificationListSupplementaryViewsGroup *)self count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NCNotificationListSupplementaryViewsGroup *)self _supplementaryViewControllerAtIndex:v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(NCNotificationListSupplementaryViewsGroup *)self count]);
  }

  return (NSArray *)v3;
}

- (id)headerText
{
  return self->_groupName;
}

- (id)clearAllText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL_SUPPLEMENTARY" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (BOOL)shouldImmediatelyReveal
{
  return 1;
}

- (id)purposeWithSensitiveTextHashed:(BOOL)a3
{
  groupingIdentifier = self->_groupingIdentifier;
  if (groupingIdentifier)
  {
    if (a3)
    {
      id v5 = [(NSString *)groupingIdentifier un_logDigest];
    }
    else
    {
      id v5 = groupingIdentifier;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = @"<Nil>";
  }
  unint64_t v7 = [NSString stringWithFormat:@"Bundle:%@;Group:%@", self->_sectionIdentifier, v6];

  return v7;
}

- (void)toggleGroupedState
{
  id v3 = [(NCNotificationListPresentableGroup *)self listView];
  int v4 = [v3 isGrouped];

  id v5 = [(NCNotificationListPresentableGroup *)self listView];
  unint64_t v6 = [v5 count];

  if (v6 == 1) {
    char v7 = v4;
  }
  else {
    char v7 = 1;
  }
  if (v6 > 1 || (v7 & 1) == 0)
  {
    [(NCNotificationListSupplementaryViewsGroup *)self _setGrouped:v4 ^ 1u];
    [(NCNotificationListSupplementaryViewsGroup *)self _updateUserInteraction];
  }
}

- (id)animator
{
  id v3 = [(NCNotificationListPresentableGroup *)self delegate];
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
  unint64_t v6 = (void *)v4;

  return v6;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  unint64_t v6 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:a4];
  char v7 = v6;
  if (v6)
  {
    id v8 = [v6 view];
    objc_msgSend(v8, "sizeThatFits:", a5, 1.79769313e308);
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  unint64_t v6 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:a4];
  [v6 setContentVisible:1];
  char v7 = [(NCNotificationListSupplementaryViewsGroup *)self _cellAtIndex:a4];

  return v7;
}

- (void)recycleView:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  [(NCNotificationListPresentableGroup *)&v6 recycleView:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerForCell:v4];
    [v5 setContentVisible:0];
  }
}

- (BOOL)shouldContinuePresentingActionButtonsForNotificationListCell:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListSupplementaryViewsGroup *)self _cellAtIndex:0];

  if (v5 == v4) {
    return 1;
  }
  else {
    return ![(NCNotificationListPresentableGroup *)self isGrouped];
  }
}

- (BOOL)shouldShowSupplementaryActionsForNotificationListCell:(id)a3
{
  id v3 = [(NCNotificationListSupplementaryViewsGroup *)self _configurationForCell:a3];
  id v4 = [v3 supplementaryActions];
  uint64_t v5 = [v4 count];

  int v6 = [v3 preventsUserDismissal] ^ 1;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (id)supplementaryActionsForNotificationListCell:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NCNotificationListSupplementaryViewsGroup *)self _configurationForCell:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v7 = objc_msgSend(v5, "supplementaryActions", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v10) {
          char v10 = 1;
        }
        else {
          char v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "pl_isDefaultAction");
        }
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
  }

  if (([v5 preventsUserDismissal] & 1) == 0)
  {
    v14 = [(NCNotificationListSupplementaryViewsGroup *)self _clearActionForCell:v4];
    v15 = v14;
    if ((v10 & 1) == 0) {
      objc_msgSend(v14, "setPl_defaultAction:", 1);
    }
    [v6 addObject:v15];
  }

  return v6;
}

- (id)defaultActionForNotificationListCell:(id)a3
{
  id v3 = [(NCNotificationListSupplementaryViewsGroup *)self _configurationForCell:a3];
  id v4 = [v3 defaultAction];

  return v4;
}

- (BOOL)shouldShowDefaultActionForNotificationListCell:(id)a3
{
  id v4 = [(NCNotificationListSupplementaryViewsGroup *)self _configurationForCell:a3];
  uint64_t v5 = [(NCNotificationListPresentableGroup *)self delegate];
  id v6 = [v4 defaultAction];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v7 = [v5 shouldHintDefaultActionForNotificationListBaseComponent:self];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldVerticallyStackActionButtonsForNotificationListCell:(id)a3
{
  return 0;
}

- (void)notificationListCell:(id)a3 didBeginRevealingActionsForSwipeInteraction:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  id v6 = a3;
  [(NCNotificationListPresentableGroup *)&v10 notificationListCell:v6 didBeginRevealingActionsForSwipeInteraction:a4];
  char v7 = -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", v6, v10.receiver, v10.super_class);

  uint64_t v8 = [v7 hostedViewController];

  uint64_t v9 = [(NCNotificationListPresentableGroup *)self delegate];
  [v9 notificationListSupplementaryViewsGroup:self cancelTouches:1 onHostedViewController:v8];
}

- (void)notificationListCell:(id)a3 didBeginHidingActionsForSwipeInteraction:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  id v6 = a3;
  [(NCNotificationListPresentableGroup *)&v10 notificationListCell:v6 didBeginHidingActionsForSwipeInteraction:a4];
  char v7 = -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", v6, v10.receiver, v10.super_class);

  uint64_t v8 = [v7 hostedViewController];

  uint64_t v9 = [(NCNotificationListPresentableGroup *)self delegate];
  [v9 notificationListSupplementaryViewsGroup:self cancelTouches:0 onHostedViewController:v8];
}

- (void)supplementaryHostingViewControllerWasTapped:(id)a3
{
  id v10 = a3;
  if ([(NCNotificationListPresentableGroup *)self isGrouped])
  {
    [(NCNotificationListSupplementaryViewsGroup *)self _setGrouped:0];
    [(NCNotificationListSupplementaryViewsGroup *)self _updateUserInteraction];
  }
  else
  {
    id v4 = [v10 configuration];
    uint64_t v5 = [v4 defaultAction];

    if (v5)
    {
      id v6 = [(NCNotificationListPresentableGroup *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v6 shouldHintDefaultActionForNotificationListBaseComponent:self])
      {
        char v7 = [v10 hostedViewController];
        unint64_t v8 = [(NCNotificationListSupplementaryViewsGroup *)self _existingIndexMatchingSupplementaryViewController:v7];

        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = [(NCNotificationListSupplementaryViewsGroup *)self _cellAtIndex:v8];
          [v9 hintSideSwipeForDefaultAction];
        }
      }
      else
      {
        [v5 performWithSender:self target:0];
      }
    }
  }
}

- (void)supplementaryHostingViewControllerPreferredContentSizeChanged:(id)a3
{
  unint64_t v4 = [(NCNotificationListSupplementaryViewsGroup *)self _indexOfHostingViewController:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    if (v4 < [(NCNotificationListSupplementaryViewsGroup *)self count])
    {
      id v6 = [(NCNotificationListPresentableGroup *)self listView];
      [v6 reloadViewAtIndex:v5];

      id v7 = [(NCNotificationListPresentableGroup *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v7 notificationListSupplementaryViewsGroupDidChangePreferredContentSize:self];
      }
    }
  }
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_orderedCells count];
}

+ (id)presentableTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 setWithObject:v3];
}

- (void)clearAll
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v4 = [(NCNotificationListSupplementaryViewsGroup *)self count];
  if ((uint64_t)(v4 - 1) < 0)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = v4;
    char v6 = 1;
    do
    {
      id v7 = [(NCNotificationListSupplementaryViewsGroup *)self _configurationAtIndex:--v5];
      char v8 = [v7 preventsUserDismissal];

      if (v8)
      {
        char v6 = 0;
      }
      else
      {
        uint64_t v9 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:v5];
        if (v9) {
          [v3 addObject:v9];
        }
        [(NCNotificationListSupplementaryViewsGroup *)self _removeSupplementaryViewControllerAtIndex:v5];
      }
    }
    while (v5 > 0);
  }
  id v10 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 notificationListBaseComponent:self requestsClearingPresentables:v3];
  }
  if (v6)
  {
    uint64_t v11 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      uint64_t v13 = [(NCNotificationListSupplementaryViewsGroup *)self _logDescription];
      v14 = [(NCNotificationListSupplementaryViewsGroup *)self groupingIdentifier];
      v15 = objc_msgSend(v14, "un_logDigest");
      int v16 = 138543618;
      long long v17 = v13;
      __int16 v18 = 2114;
      long long v19 = v15;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ all cells are removed in group %{public}@; clean up group from section.",
        (uint8_t *)&v16,
        0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [v10 notificationListBaseComponentDidRemoveAll:self];
    }
  }
}

- (void)_updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4 existingIndex:(unint64_t)a5 proposedIndex:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    v12 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:a5];
    uint64_t v13 = [(NCNotificationListSupplementaryViewsGroup *)self _cellAtIndex:a5];
    [(NCNotificationListSupplementaryViewsGroup *)self _updateHostingViewController:v12 cell:v13 withConfiguration:v11];
  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = (__PAIR128__(a6, a5) - a6) >> 64;
    if (v14 != a5)
    {
      v15 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = v15;
        long long v17 = [(NCNotificationListSupplementaryViewsGroup *)self _logDescription];
        int v21 = 138543874;
        uint64_t v22 = v17;
        __int16 v23 = 2050;
        unint64_t v24 = a5;
        __int16 v25 = 2050;
        uint64_t v26 = v14;
        _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ updating position for existing supplementary view controller, '%{public}lu' -> '%{public}lu'", (uint8_t *)&v21, 0x20u);
      }
      __int16 v18 = [(NCNotificationListSupplementaryViewsGroup *)self _cellAtIndex:a5];
      [(NSMutableArray *)self->_orderedCells removeObjectAtIndex:a5];
      long long v19 = [(NCNotificationListPresentableGroup *)self listView];
      [v19 removeViewAtIndex:a5 animated:0];

      [(NSMutableArray *)self->_orderedCells insertObject:v18 atIndex:v14];
      uint64_t v20 = [(NCNotificationListPresentableGroup *)self listView];
      [v20 insertViewAtIndex:v14 animated:0];
    }
  }
}

- (void)_updateUserInteraction
{
  if ([(NCNotificationListSupplementaryViewsGroup *)self count])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:v3];
      objc_msgSend(v4, "setHostedViewControllerUserInteractionEnabled:", -[NCNotificationListSupplementaryViewsGroup _shouldAllowHostedViewControllersUserInteraction](self, "_shouldAllowHostedViewControllersUserInteraction"));

      ++v3;
    }
    while (v3 < [(NCNotificationListSupplementaryViewsGroup *)self count]);
  }
}

- (BOOL)_shouldAllowHostedViewControllersUserInteraction
{
  return ![(NCNotificationListPresentableGroup *)self isGrouped];
}

- (void)_clearCell:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerForCell:a3];
  if (v4)
  {
    [(NCNotificationListSupplementaryViewsGroup *)self _removeSupplementaryViewControllerAtIndex:[(NCNotificationListSupplementaryViewsGroup *)self _indexOfHostingViewController:v4]];
    uint64_t v5 = [(NCNotificationListPresentableGroup *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      char v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
      [v5 notificationListBaseComponent:self requestsClearingPresentables:v6];
    }
    if (![(NCNotificationListSupplementaryViewsGroup *)self count])
    {
      id v7 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        char v8 = v7;
        uint64_t v9 = [(NCNotificationListSupplementaryViewsGroup *)self _logDescription];
        id v10 = [(NCNotificationListSupplementaryViewsGroup *)self groupingIdentifier];
        id v11 = objc_msgSend(v10, "un_logDigest");
        int v12 = 138543618;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ all cells are removed in group %{public}@; clean up group from section.",
          (uint8_t *)&v12,
          0x16u);
      }
      if (objc_opt_respondsToSelector()) {
        [v5 notificationListBaseComponentDidRemoveAll:self];
      }
    }
  }
}

- (id)_clearActionForCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationListPresentableGroup *)self listView];
  if ([v5 isGrouped])
  {
    unint64_t v6 = [(NCNotificationListSupplementaryViewsGroup *)self count];

    if (v6 > 1)
    {
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      char v8 = [v7 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL_CELL" value:&stru_1F2F516F8 table:0];
      char v9 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = NCUserNotificationsUIKitFrameworkBundle();
  char v8 = [v7 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR" value:&stru_1F2F516F8 table:0];
  char v9 = 0;
LABEL_6:

  objc_initWeak(&location, self);
  id v10 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __65__NCNotificationListSupplementaryViewsGroup__clearActionForCell___block_invoke;
  long long v17 = &unk_1E6A92B28;
  objc_copyWeak(&v19, &location);
  char v20 = v9;
  id v11 = v4;
  id v18 = v11;
  int v12 = [v10 actionWithTitle:v8 image:0 identifier:@"tbd" handler:&v14];
  objc_msgSend(v12, "setPl_defaultAction:", 1, v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

void __65__NCNotificationListSupplementaryViewsGroup__clearActionForCell___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setClearingAllNotificationRequestsForCellHorizontalSwipe:1];
    if (*(unsigned char *)(a1 + 48)) {
      [v3 clearAll];
    }
    else {
      [v3 _clearCell:*(void *)(a1 + 32)];
    }
    id WeakRetained = v3;
  }
}

- (void)_updateHostingViewController:(id)a3 cell:(id)a4 withConfiguration:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(NCNotificationListSupplementaryViewsGroup *)self _configurationForCell:v9];
  char v11 = [v8 isEqual:v10];

  if (v11)
  {
    [v13 setConfiguration:v8 animated:1];
    [v9 setContentViewController:v13];
    [(NCNotificationListSupplementaryViewsGroup *)self _matchStyleOfCell:v9 toHostingViewController:v13];
  }
  else
  {
    int v12 = [(NCNotificationListPresentableGroup *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v12 notificationListBaseComponent:self willUpdateViewController:v13];
    }

    [v13 setConfiguration:v8 animated:1];
    [v9 setContentViewController:v13];
    [(NCNotificationListSupplementaryViewsGroup *)self _matchStyleOfCell:v9 toHostingViewController:v13];

    id v9 = [(NCNotificationListPresentableGroup *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 notificationListBaseComponent:self didUpdateViewController:v13];
    }
  }
}

- (void)_matchStyleOfCell:(id)a3 toHostingViewController:(id)a4
{
  id v5 = a4;
  id v10 = a3;
  unint64_t v6 = [v5 materialGroupNameBase];
  [v10 setMaterialGroupNameBase:v6];

  id v7 = [v5 materialTintColor];
  [v10 setMaterialTintColor:v7];

  id v8 = [v5 textColor];
  [v10 setTextColor:v8];

  uint64_t v9 = [v5 materialRecipe];
  [v10 setMaterialRecipe:v9];
}

- (unint64_t)_existingIndexMatchingSupplementaryViewController:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationListSupplementaryViewsGroup *)self count])
  {
    unint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NCNotificationListSupplementaryViewsGroup *)self _supplementaryViewControllerAtIndex:v5];

      if (v6 == v4) {
        break;
      }
      if (++v5 >= [(NCNotificationListSupplementaryViewsGroup *)self count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)_sortedIndexForViewController:(id)a3
{
  id v4 = a3;
  if (self->_viewControllerSortComparator)
  {
    for (unint64_t i = 0; i < [(NCNotificationListSupplementaryViewsGroup *)self count]; ++i)
    {
      id v6 = [(NCNotificationListSupplementaryViewsGroup *)self _supplementaryViewControllerAtIndex:i];
      uint64_t v7 = (*((uint64_t (**)(void))self->_viewControllerSortComparator + 2))();

      if (v7 == 1) {
        break;
      }
    }
  }
  else
  {
    unint64_t i = 0x7FFFFFFFFFFFFFFFLL;
  }

  return i;
}

- (id)_logDescription
{
  groupingIdentifier = (__CFString *)self->_groupingIdentifier;
  if (!groupingIdentifier) {
    groupingIdentifier = @"<Group w/ No ID>";
  }
  id v4 = NSString;
  unint64_t v5 = groupingIdentifier;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = [v4 stringWithFormat:@"%@ [%@: %@]", v7, self->_sectionIdentifier, v5];

  return v8;
}

- (id)_configurationAtIndex:(unint64_t)a3
{
  id v3 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:a3];
  id v4 = [v3 configuration];

  return v4;
}

- (id)_supplementaryViewControllerAtIndex:(unint64_t)a3
{
  id v3 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:a3];
  id v4 = [v3 hostedViewController];

  return v4;
}

- (id)_hostingViewControllerAtIndex:(unint64_t)a3
{
  id v4 = [(NCNotificationListSupplementaryViewsGroup *)self _cellAtIndex:a3];
  if (v4)
  {
    unint64_t v5 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerForCell:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_cellAtIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_orderedCells count] <= a3)
  {
    id v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR))
    {
      id v8 = v6;
      uint64_t v9 = [(NCNotificationListSupplementaryViewsGroup *)self _logDescription];
      uint64_t v10 = [(NSMutableArray *)self->_orderedCells count];
      int v11 = 138543874;
      int v12 = v9;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_error_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_ERROR, "%{public}@ cannot vend list view for index: %lu. array count is: %lu.", (uint8_t *)&v11, 0x20u);
    }
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->_orderedCells objectAtIndex:a3];
  }

  return v5;
}

- (unint64_t)_indexOfHostingViewController:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  orderedCells = self->_orderedCells;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__NCNotificationListSupplementaryViewsGroup__indexOfHostingViewController___block_invoke;
  v9[3] = &unk_1E6A92B50;
  id v6 = v4;
  id v10 = v6;
  int v11 = &v12;
  [(NSMutableArray *)orderedCells enumerateObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__NCNotificationListSupplementaryViewsGroup__indexOfHostingViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = *(void **)(a1 + 32);
  id v8 = [a2 contentViewController];

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_configurationForCell:(id)a3
{
  id v3 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerForCell:a3];
  id v4 = [v3 configuration];

  return v4;
}

- (id)_hostingViewControllerForCell:(id)a3
{
  return (id)[a3 contentViewController];
}

- (void)_removeSupplementaryViewControllerAtIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      unint64_t v7 = [(NCNotificationListSupplementaryViewsGroup *)self _logDescription];
      int v13 = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing supplementary view controller at index %lu", (uint8_t *)&v13, 0x16u);
    }
    id v8 = [(NCNotificationListSupplementaryViewsGroup *)self _hostingViewControllerAtIndex:a3];
    uint64_t v9 = [(NSMutableArray *)self->_orderedCells objectAtIndex:a3];
    if (v9) {
      BOOL v10 = [(NCNotificationListPresentableGroup *)self actionsRevealedForNotificationListCell:v9];
    }
    else {
      BOOL v10 = 0;
    }
    [(NSMutableArray *)self->_orderedCells removeObjectAtIndex:a3];
    int v11 = [(NCNotificationListPresentableGroup *)self listView];
    [v11 removeViewAtIndex:a3 animated:1 isHorizontallyDisplaced:v10];

    uint64_t v12 = [(NCNotificationListPresentableGroup *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v12 notificationListBaseComponent:self didRemoveViewController:v8];
    }
  }
  if ([(NCNotificationListSupplementaryViewsGroup *)self count] == 1)
  {
    [(NCNotificationListSupplementaryViewsGroup *)self _setGrouped:1];
    [(NCNotificationListSupplementaryViewsGroup *)self _updateUserInteraction];
  }
}

- (void)_setGrouped:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NCNotificationListPresentableGroup *)self listView];
  [v5 setGrouped:v3];

  id v6 = [(NCNotificationListPresentableGroup *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 notificationListSupplementaryViewsGroup:self didSetGrouped:v3];
  }
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (id)viewControllerSortComparator
{
  return self->_viewControllerSortComparator;
}

- (void)setViewControllerSortComparator:(id)a3
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

- (NSMutableArray)orderedCells
{
  return self->_orderedCells;
}

- (void)setOrderedCells:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedCells, 0);
  objc_storeStrong(&self->_viewControllerSortComparator, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);

  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

- (void)animator
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D7C04000, log, OS_LOG_TYPE_FAULT, "Unexpectedly didn't recieve animator from delegate: %@, for object: %@", (uint8_t *)&v3, 0x16u);
}

@end