@interface NCNotificationListSupplementaryViewsSection
+ (NSSet)presentableTypes;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3;
- (BOOL)supportsViewGrouping;
- (CGSize)allowedSupplementaryViewSize;
- (NCAnimator)animator;
- (NCNotificationListBaseComponentDelegate)delegate;
- (NCNotificationListCache)notificationListCache;
- (NCNotificationListSupplementaryViewsContainingDelegate)supplementaryContainerDelegate;
- (NCNotificationListSupplementaryViewsSection)initWithPosition:(unint64_t)a3;
- (NCNotificationListViewProtocol)listView;
- (NSArray)groupingIdentifiers;
- (NSArray)supplementaryViewControllers;
- (NSDictionary)supplementaryViewControllersByGroupingIdentifiers;
- (NSMutableArray)orderedSupplementaryViewsGroups;
- (NSString)descriptionString;
- (NSString)identifier;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_logDescription;
- (id)groupSortComparator;
- (id)hostingPlatterViewForSupplementaryViewController:(id)a3;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)viewControllerSortComparator;
- (unint64_t)_indexOfExistingSupplementaryViewsGroupForGroupingIdentifier:(id)a3;
- (unint64_t)_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:(id)a3;
- (unint64_t)_sortedIndexForGroupingIdentifier:(id)a3;
- (unint64_t)count;
- (unint64_t)notificationListViewNumberOfItems:(id)a3;
- (unint64_t)position;
- (unint64_t)supplementaryViewControllersCount;
- (void)_removeNotificationViewsGroup:(id)a3 animated:(BOOL)a4;
- (void)_updatePositionOfGroupAtIndex:(unint64_t)a3;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)cancelTouchesOnHostedViews:(BOOL)a3;
- (void)clearAll;
- (void)collapseAllExpandedSupplementaryViewsGroups;
- (void)forwardInvocation:(id)a3;
- (void)insertSupplementaryViewController:(id)a3 withConfiguration:(id)a4;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4;
- (void)notificationListSupplementaryViewsGroup:(id)a3 cancelTouches:(BOOL)a4 onHostedViewController:(id)a5;
- (void)notificationListSupplementaryViewsGroup:(id)a3 didSetGrouped:(BOOL)a4;
- (void)notificationListSupplementaryViewsGroupDidChangePreferredContentSize:(id)a3;
- (void)presentViewControllerModally:(id)a3 fromSupplementaryViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)recycleView:(id)a3;
- (void)removeSupplementaryViewController:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionString:(id)a3;
- (void)setGroupSortComparator:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNotificationListCache:(id)a3;
- (void)setOrderedSupplementaryViewsGroups:(id)a3;
- (void)setSupplementaryContainerDelegate:(id)a3;
- (void)setSupportsViewGrouping:(BOOL)a3;
- (void)setViewControllerSortComparator:(id)a3;
- (void)updatePositionIfNeededForSupplementaryViewController:(id)a3;
- (void)updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4;
@end

@implementation NCNotificationListSupplementaryViewsSection

- (NCNotificationListSupplementaryViewsSection)initWithPosition:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListSupplementaryViewsSection;
  v4 = [(NCNotificationListSupplementaryViewsSection *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_position = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedSupplementaryViewsGroups = v5->_orderedSupplementaryViewsGroups;
    v5->_orderedSupplementaryViewsGroups = v6;
  }
  return v5;
}

- (NCNotificationListViewProtocol)listView
{
  listView = self->_listView;
  if (!listView)
  {
    v4 = [[NCNotificationListView alloc] initWithModelType:objc_opt_class() purpose:self->_identifier];
    v5 = self->_listView;
    self->_listView = (NCNotificationListViewProtocol *)v4;

    [(NCNotificationListViewProtocol *)self->_listView setGrouped:0];
    [(NCNotificationListViewProtocol *)self->_listView setDataSource:self];
    [(NCNotificationListViewProtocol *)self->_listView setRevealed:1];
    [(NCNotificationListViewProtocol *)self->_listView setRevealPercentage:1.0];
    listView = self->_listView;
  }

  return listView;
}

- (NCAnimator)animator
{
  v3 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 animator];
  }
  else
  {
    if (_NCReactiveListUI())
    {
      v5 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_FAULT)) {
        [(NCNotificationListSupplementaryViewsGroup *)(uint64_t)v3 animator];
      }
    }
    uint64_t v4 = NCDefaultAnimator();
  }
  v6 = (void *)v4;

  return (NCAnimator *)v6;
}

- (void)collapseAllExpandedSupplementaryViewsGroups
{
}

void __90__NCNotificationListSupplementaryViewsSection_collapseAllExpandedSupplementaryViewsGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isGrouped] & 1) == 0) {
    [v2 setGrouped:1 animated:1];
  }
}

- (void)cancelTouchesOnHostedViews:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supplementaryContainerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained supplementaryViewsContainer:self requestsCancelTouchesOnAllSupplementaryViewControllers:v3];
  }
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__NCNotificationListSupplementaryViewsSection_adjustForLegibilitySettingsChange___block_invoke;
  v7[3] = &unk_1E6A954C0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v7];
}

uint64_t __81__NCNotificationListSupplementaryViewsSection_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForLegibilitySettingsChange:*(void *)(a1 + 32)];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

uint64_t __81__NCNotificationListSupplementaryViewsSection_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

- (void)setViewControllerSortComparator:(id)a3
{
  id v4 = _Block_copy(a3);
  id viewControllerSortComparator = self->_viewControllerSortComparator;
  self->_id viewControllerSortComparator = v4;

  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NCNotificationListSupplementaryViewsSection_setViewControllerSortComparator___block_invoke;
  v7[3] = &unk_1E6A954C0;
  void v7[4] = self;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v7];
}

uint64_t __79__NCNotificationListSupplementaryViewsSection_setViewControllerSortComparator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setViewControllerSortComparator:*(void *)(*(void *)(a1 + 32) + 48)];
}

- (unint64_t)supplementaryViewControllersCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersCount__block_invoke;
  v5[3] = &unk_1E6A954E8;
  v5[4] = &v6;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (NSArray)groupingIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__NCNotificationListSupplementaryViewsSection_groupingIdentifiers__block_invoke;
  v7[3] = &unk_1E6A954C0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __66__NCNotificationListSupplementaryViewsSection_groupingIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 groupingIdentifier];
  [v2 addObject:v3];
}

- (NSDictionary)supplementaryViewControllersByGroupingIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersByGroupingIdentifiers__block_invoke;
  v7[3] = &unk_1E6A954C0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v7];

  return (NSDictionary *)v5;
}

void __96__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersByGroupingIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 groupingIdentifier];
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 supplementaryViewControllers];
    [v4 setObject:v5 forKey:v3];
  }
}

- (NSArray)supplementaryViewControllers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__NCNotificationListSupplementaryViewsSection_supplementaryViewControllers__block_invoke;
  v7[3] = &unk_1E6A954C0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __75__NCNotificationListSupplementaryViewsSection_supplementaryViewControllers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 supplementaryViewControllers];
  [v2 addObjectsFromArray:v3];
}

- (void)insertSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v10 = [(NCNotificationListSupplementaryViewsSection *)self _logDescription];
    int v19 = 138543874;
    v20 = v10;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting supplementary view controller with configuration = %{public}@ [viewController=%{public}@]", (uint8_t *)&v19, 0x20u);
  }
  v11 = [v7 groupingIdentifier];
  unint64_t v12 = [(NCNotificationListSupplementaryViewsSection *)self _indexOfExistingSupplementaryViewsGroupForGroupingIdentifier:v11];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = objc_alloc_init(NCNotificationListSupplementaryViewsGroup);
    [(NCNotificationListPresentableGroup *)v13 setNotificationListCache:self->_notificationListCache];
    [(NCNotificationListSupplementaryViewsGroup *)v13 setSectionIdentifier:self->_identifier];
    [(NCNotificationListPresentableGroup *)v13 setDelegate:self];
    [(NCNotificationListSupplementaryViewsGroup *)v13 setGroupingIdentifier:v11];
    v14 = [v7 groupName];
    [(NCNotificationListSupplementaryViewsGroup *)v13 setGroupName:v14];

    [(NCNotificationListSupplementaryViewsGroup *)v13 setViewControllerSortComparator:self->_viewControllerSortComparator];
    unint64_t v15 = [(NCNotificationListSupplementaryViewsSection *)self _sortedIndexForGroupingIdentifier:v11];
    [(NSMutableArray *)self->_orderedSupplementaryViewsGroups insertObject:v13 atIndex:v15];
    v16 = [(NCNotificationListSupplementaryViewsSection *)self listView];
    [v16 insertViewAtIndex:v15 animated:1];
  }
  else
  {
    unint64_t v17 = v12;
    v13 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:v12];
    [(NCNotificationListSupplementaryViewsSection *)self _updatePositionOfGroupAtIndex:v17];
  }
  [(NCNotificationListSupplementaryViewsGroup *)v13 insertSupplementaryViewController:v6 withConfiguration:v7];
  v18 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v18 supplementaryViewSectionDidChangeContent:self];
  }
}

- (void)updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unint64_t v7 = [(NCNotificationListSupplementaryViewsSection *)self _indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = v7;
    uint64_t v9 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:v7];
    [v9 updateSupplementaryViewController:v11 withConfiguration:v6];
    [(NCNotificationListSupplementaryViewsSection *)self _updatePositionOfGroupAtIndex:v8];
  }
  v10 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 supplementaryViewSectionDidChangeContent:self];
  }
}

- (void)updatePositionIfNeededForSupplementaryViewController:(id)a3
{
  id v7 = a3;
  unint64_t v4 = -[NCNotificationListSupplementaryViewsSection _indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:](self, "_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v6 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:v4];
    [v6 updatePositionIfNeededForSupplementaryViewController:v7];
    [(NCNotificationListSupplementaryViewsSection *)self _updatePositionOfGroupAtIndex:v5];
  }
}

- (void)removeSupplementaryViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(NCNotificationListSupplementaryViewsSection *)self _logDescription];
    int v13 = 138543618;
    v14 = v7;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing supplementary view controller [viewController=%{public}@]", (uint8_t *)&v13, 0x16u);
  }
  unint64_t v8 = [(NCNotificationListSupplementaryViewsSection *)self _indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:v4];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = v8;
    v10 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:v8];
    [v10 removeSupplementaryViewController:v4];
    if (![v10 count])
    {
      [(NSMutableArray *)self->_orderedSupplementaryViewsGroups removeObjectAtIndex:v9];
      id v11 = [(NCNotificationListSupplementaryViewsSection *)self listView];
      [v11 removeViewAtIndex:v9 animated:1];
    }
  }
  unint64_t v12 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v12 supplementaryViewSectionDidChangeContent:self];
  }
}

- (void)presentViewControllerModally:(id)a3 fromSupplementaryViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v13 = [[NCModalNavigationController alloc] initWithRootViewController:v14];
    [WeakRetained notificationListBaseComponent:self requestsModalPresentationOfNavigationController:v13 sender:v10 animated:v7 completion:v11];
  }
}

- (id)hostingPlatterViewForSupplementaryViewController:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__16;
  id v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__NCNotificationListSupplementaryViewsSection_hostingPlatterViewForSupplementaryViewController___block_invoke;
  v9[3] = &unk_1E6A95510;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableArray *)orderedSupplementaryViewsGroups enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __96__NCNotificationListSupplementaryViewsSection_hostingPlatterViewForSupplementaryViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = [a2 hostingPlatterViewForSupplementaryViewController:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (CGSize)allowedSupplementaryViewSize
{
  id v2 = [(NCNotificationListSupplementaryViewsSection *)self listView];
  [v2 frame];
  CGFloat Width = CGRectGetWidth(v7);

  double v4 = 0.0;
  double v5 = Width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  double v8 = 0.0;
  if ([(NSMutableArray *)self->_orderedSupplementaryViewsGroups count] > a4)
  {
    unint64_t v9 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:a4];
    id v10 = [v9 listView];
    objc_msgSend(v10, "sizeThatFits:", a5, 0.0);
    double v8 = v11;
  }
  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  if ([(NSMutableArray *)self->_orderedSupplementaryViewsGroups count] <= a4)
  {
    CGRect v7 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:a4];
    CGRect v7 = [v6 listView];
  }

  return v7;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  return [(NSMutableArray *)self->_orderedSupplementaryViewsGroups count];
}

- (void)recycleView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 recycleVisibleViews];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListSupplementaryViewsSection;
  if (-[NCNotificationListSupplementaryViewsSection respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListBaseComponentDelegateMethod:a3])
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
  if (+[NCNotificationStructuredListUtilities isNotificationListBaseComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListBaseComponentDelegateMethod:", [v4 selector]))
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
      v7.super_class = (Class)NCNotificationListSupplementaryViewsSection;
      [(NCNotificationListSupplementaryViewsSection *)&v7 forwardInvocation:v4];
    }
  }
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    objc_super v7 = [(NCNotificationListSupplementaryViewsSection *)self _logDescription];
    objc_super v8 = [v4 groupingIdentifier];
    unint64_t v9 = objc_msgSend(v8, "un_logDigest");
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ supplementary view groups %{public}@ did remove all cells; cleanup up the group",
      (uint8_t *)&v11,
      0x16u);
  }
  [(NCNotificationListSupplementaryViewsSection *)self _removeNotificationViewsGroup:v4 animated:1];
  id v10 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  [v10 notificationListBaseComponentDidRemoveAll:self];
}

- (void)_removeNotificationViewsGroup:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = -[NSMutableArray indexOfObject:](self->_orderedSupplementaryViewsGroups, "indexOfObject:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    [(NSMutableArray *)self->_orderedSupplementaryViewsGroups removeObjectAtIndex:v6];
    objc_super v8 = [(NCNotificationListSupplementaryViewsSection *)self listView];
    objc_msgSend(v8, "removeViewAtIndex:animated:isHorizontallyDisplaced:", v7, v4, objc_msgSend(v9, "isClearingAllNotificationRequestsForCellHorizontalSwipe"));
  }
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_orderedSupplementaryViewsGroups count];
}

+ (NSSet)presentableTypes
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();

  return (NSSet *)[v2 setWithObject:v3];
}

- (void)clearAll
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v4 = [(NCNotificationListSupplementaryViewsSection *)self orderedSupplementaryViewsGroups];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__NCNotificationListSupplementaryViewsSection_clearAll__block_invoke;
  v12[3] = &unk_1E6A954C0;
  id v5 = v3;
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained notificationListBaseComponent:self requestsClearingPresentables:v5];
  }
  uint64_t v7 = [(NCNotificationListSupplementaryViewsSection *)self orderedSupplementaryViewsGroups];
  uint64_t v8 = [v7 count];

  uint64_t v9 = v8 - 1;
  if (v8 - 1 >= 0)
  {
    do
    {
      id v10 = [(NCNotificationListSupplementaryViewsSection *)self listView];
      [v10 removeViewAtIndex:v9 animated:1];

      int v11 = [(NCNotificationListSupplementaryViewsSection *)self orderedSupplementaryViewsGroups];
      [v11 removeObjectAtIndex:v9];

      --v9;
    }
    while (v9 != -1);
  }
}

void __55__NCNotificationListSupplementaryViewsSection_clearAll__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 hostingViewControllers];
  [v2 addObjectsFromArray:v3];
}

- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4
{
  id v13 = (void (**)(void))a4;
  id v6 = a3;
  uint64_t v7 = [(NCNotificationListSupplementaryViewsSection *)self orderedSupplementaryViewsGroups];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13) {
      v13[2]();
    }
  }
  else
  {
    uint64_t v9 = [(NCNotificationListSupplementaryViewsSection *)self listView];
    [v9 layoutOffsetForViewAtIndex:v8];
    double v11 = v10;

    uint64_t v12 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
    [v12 notificationListBaseComponent:self requestsScrollingToContentOffset:v13 withCompletion:v11];
  }
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 1;
}

- (void)notificationListSupplementaryViewsGroup:(id)a3 cancelTouches:(BOOL)a4 onHostedViewController:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supplementaryContainerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained supplementaryViewsContainer:self requestsCancelTouches:v5 onSupplementaryViewController:v8];
  }
}

- (void)notificationListSupplementaryViewsGroup:(id)a3 didSetGrouped:(BOOL)a4
{
  id v5 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 supplementaryViewSectionDidChangeContent:self];
  }
}

- (void)notificationListSupplementaryViewsGroupDidChangePreferredContentSize:(id)a3
{
  id v4 = [(NCNotificationListSupplementaryViewsSection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 supplementaryViewSectionDidChangeHeight:self];
  }
}

- (void)_updatePositionOfGroupAtIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v11 groupingIdentifier];
    unint64_t v7 = [(NCNotificationListSupplementaryViewsSection *)self _sortedIndexForGroupingIdentifier:v6];
    uint64_t v8 = (__PAIR128__(v7, a3) - v7) >> 64;
    if (v8 != a3)
    {
      [(NSMutableArray *)self->_orderedSupplementaryViewsGroups removeObjectAtIndex:a3];
      [(NSMutableArray *)self->_orderedSupplementaryViewsGroups insertObject:v11 atIndex:v8];
      uint64_t v9 = [(NCNotificationListSupplementaryViewsSection *)self listView];
      [v9 removeViewAtIndex:a3 animated:0];

      double v10 = [(NCNotificationListSupplementaryViewsSection *)self listView];
      [v10 insertViewAtIndex:v8 animated:1];
    }
  }
}

- (unint64_t)_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:(id)a3
{
  id v4 = a3;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __117__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForSupplementaryViewController___block_invoke;
  v9[3] = &unk_1E6A95538;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)orderedSupplementaryViewsGroups indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __117__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForSupplementaryViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsSupplementaryViewController:*(void *)(a1 + 32)];
}

- (unint64_t)_indexOfExistingSupplementaryViewsGroupForGroupingIdentifier:(id)a3
{
  id v4 = a3;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __108__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForGroupingIdentifier___block_invoke;
  v9[3] = &unk_1E6A95538;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)orderedSupplementaryViewsGroups indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __108__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForGroupingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 groupingIdentifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (unint64_t)_sortedIndexForGroupingIdentifier:(id)a3
{
  id v4 = a3;
  if (self->_groupSortComparator && [(NSMutableArray *)self->_orderedSupplementaryViewsGroups count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSMutableArray *)self->_orderedSupplementaryViewsGroups objectAtIndex:v5];
      unint64_t v7 = [v6 groupingIdentifier];

      uint64_t v8 = (*((uint64_t (**)(void))self->_groupSortComparator + 2))();
      if (v8 == 1) {
        break;
      }
      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_orderedSupplementaryViewsGroups count]);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_logDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@ [%@]", v5, self->_identifier];

  return v6;
}

- (NCNotificationListSupplementaryViewsContainingDelegate)supplementaryContainerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supplementaryContainerDelegate);

  return (NCNotificationListSupplementaryViewsContainingDelegate *)WeakRetained;
}

- (void)setSupplementaryContainerDelegate:(id)a3
{
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (void)setNotificationListCache:(id)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)supportsViewGrouping
{
  return self->_supportsViewGrouping;
}

- (void)setSupportsViewGrouping:(BOOL)a3
{
  self->_supportsViewGrouping = a3;
}

- (id)groupSortComparator
{
  return self->_groupSortComparator;
}

- (void)setGroupSortComparator:(id)a3
{
}

- (id)viewControllerSortComparator
{
  return self->_viewControllerSortComparator;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NCNotificationListBaseComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListBaseComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (NSMutableArray)orderedSupplementaryViewsGroups
{
  return self->_orderedSupplementaryViewsGroups;
}

- (void)setOrderedSupplementaryViewsGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSupplementaryViewsGroups, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_viewControllerSortComparator, 0);
  objc_storeStrong(&self->_groupSortComparator, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_listView, 0);

  objc_destroyWeak((id *)&self->_supplementaryContainerDelegate);
}

@end