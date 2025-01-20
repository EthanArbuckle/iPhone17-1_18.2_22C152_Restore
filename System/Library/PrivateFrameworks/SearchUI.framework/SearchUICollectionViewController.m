@interface SearchUICollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canHighlightRowAtIndexPath:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionViewAnimating;
- (BOOL)doesIndexPathExist:(id)a3;
- (BOOL)dragInteractionEnabled;
- (BOOL)forwardFeedbackForSelector:(SEL)a3;
- (BOOL)inPreviewPlatter;
- (BOOL)isActiveRunningShortcutForIndexPath:(id)a3;
- (BOOL)isEntitySearch;
- (BOOL)isExpandedForSectionModel:(id)a3;
- (BOOL)isVisibleFeedbackEnabled;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldUseInsetRoundedSections;
- (BOOL)shouldUseStandardSectionInsets;
- (BOOL)threeDTouchEnabled;
- (BOOL)updateMustAccountForLayout;
- (CGRect)lastVisibleBounds;
- (CGRect)scrollToIndexPath:(id)a3;
- (Class)restorationContextClass;
- (NSIndexPath)focusableIndexPath;
- (NSIndexPath)lastSelectedIndexPath;
- (NSMutableDictionary)potentiallyVisibleCells;
- (NSMutableDictionary)potentiallyVisibleHeaders;
- (NSMutableSet)expandedCollectionSections;
- (NSOrderedSet)latestVisibleCardSectionsAccountedForInFeedback;
- (NSOrderedSet)latestVisibleResultsAccountedForInFeedback;
- (NSOrderedSet)latestVisibleSectionHeadersAccountedForInFeedback;
- (NSString)activeVoiceShortcutIdentifier;
- (NSString)queryString;
- (SearchUICardViewDelegate)cardViewDelegate;
- (SearchUICollectionPeekDelegate)peekDelegate;
- (SearchUICollectionViewAttributes)searchUIAttributes;
- (SearchUICollectionViewController)init;
- (SearchUICollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SearchUICollectionViewDataSource)dataSource;
- (SearchUICommandDelegate)commandDelegate;
- (SearchUICommandEnvironment)commandEnvironment;
- (SearchUIFeedbackDelegate)feedbackListener;
- (SearchUIResultsViewDelegate)resultsViewDelegate;
- (SearchUISizingDelegate)sizingDelegate;
- (SearchUITableModel)tableModel;
- (TLKTableViewScrollTester)scrollTester;
- (UIContextMenuInteraction)contextInteraction;
- (UIView)footerView;
- (WFWorkflowRunViewSource)activeRunViewSource;
- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4;
- (id)commandEnvironmentForIndexPath:(id)a3;
- (id)currentSnapshotLayoutConfiguration;
- (id)expandedSections;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)indexPathForFocusView:(id)a3;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusSystem;
- (id)restorationContext;
- (id)viewDidUpdateHandler;
- (id)viewForRowModel:(id)a3;
- (id)viewWillUpdateHandler;
- (id)visibleViewsInPotentiallyVisibleViews:(id)a3 withinRegion:(CGRect)a4;
- (int64_t)numberOfSections;
- (int64_t)preferredPunchoutIndex;
- (unint64_t)lastVisibleFeedbackTrigger;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)addOrbInteractionIfNeeded;
- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)contentSizeDidChange:(CGSize)a3;
- (void)copy:(id)a3;
- (void)deselectSelectedRowsIfNeeded;
- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)invalidateLayout;
- (void)iterateIndexPaths:(id)a3;
- (void)lockupViewEngagedForAppIdentifier:(id)a3;
- (void)lockupViewForAppIdentifier:(id)a3 didChangeState:(id)a4;
- (void)lockupViewForAppIdentifier:(id)a3 didFailRequestWithError:(id)a4;
- (void)performExpansion:(BOOL)a3 withSection:(id)a4;
- (void)performRecapScrollTestWithTestName:(id)a3 completion:(id)a4;
- (void)performScrollTestWithCompletion:(id)a3;
- (void)performScrollTestWithHandlerForFirstScrollCompletion:(id)a3 completion:(id)a4;
- (void)purgeMemory;
- (void)removeRowModel:(id)a3 completion:(id)a4;
- (void)removeSectionContainingRowModel:(id)a3 completion:(id)a4;
- (void)removeSectionModel:(id)a3 completion:(id)a4;
- (void)resetVisibleFeedback;
- (void)resignTextField;
- (void)scrollAndFocusAtIndexPath:(id)a3;
- (void)scrollAndSelectLastSelectedIndexPath;
- (void)scrollRowModelToVisible:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)sendVisibleFeedbackIfNecessary;
- (void)setActiveRunViewSource:(id)a3;
- (void)setActiveVoiceShortcutIdentifier:(id)a3;
- (void)setCardViewDelegate:(id)a3;
- (void)setCollectionViewAnimating:(BOOL)a3;
- (void)setCommandDelegate:(id)a3;
- (void)setContextInteraction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDragInteractionEnabled:(BOOL)a3;
- (void)setExpandedCollectionSections:(id)a3;
- (void)setFeedbackListener:(id)a3;
- (void)setFocusableIndexPath:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setInPreviewPlatter:(BOOL)a3;
- (void)setIsVisibleFeedbackEnabled:(BOOL)a3;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setLastVisibleBounds:(CGRect)a3;
- (void)setLastVisibleFeedbackTrigger:(unint64_t)a3;
- (void)setLatestVisibleCardSectionsAccountedForInFeedback:(id)a3;
- (void)setLatestVisibleResultsAccountedForInFeedback:(id)a3;
- (void)setLatestVisibleSectionHeadersAccountedForInFeedback:(id)a3;
- (void)setPeekDelegate:(id)a3;
- (void)setPotentiallyVisibleCells:(id)a3;
- (void)setPotentiallyVisibleHeaders:(id)a3;
- (void)setPreferredPunchoutIndex:(int64_t)a3;
- (void)setQueryString:(id)a3;
- (void)setRestorationContext:(id)a3;
- (void)setRestorationContextClass:(Class)a3;
- (void)setResultsViewDelegate:(id)a3;
- (void)setScrollTester:(id)a3;
- (void)setSectionBackgroundHighlighted:(BOOL)a3 indexPath:(id)a4;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
- (void)setShouldUseStandardSectionInsets:(BOOL)a3;
- (void)setSizingDelegate:(id)a3;
- (void)setTableModel:(id)a3;
- (void)setTableModel:(id)a3 animated:(BOOL)a4;
- (void)setTableModel:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setTableModelWithoutReset:(id)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
- (void)setViewDidUpdateHandler:(id)a3;
- (void)setViewWillUpdateHandler:(id)a3;
- (void)shortcutDidEnd:(id)a3;
- (void)showViewController:(id)a3;
- (void)skipDown;
- (void)skipUp;
- (void)tapAtIndexPath:(id)a3;
- (void)toggleExpansionForSectionModel:(id)a3;
- (void)toggleShowMoreForSection:(unint64_t)a3;
- (void)updateContentScrolledOffScreenStatus;
- (void)updateTableForNewCellHeightAnimated:(BOOL)a3;
- (void)updateViewControllerTitle:(id)a3;
- (void)updateWithCardSection:(id)a3;
- (void)updateWithResultSections:(id)a3;
- (void)updateWithSnapshot:(id)a3;
- (void)updateWithSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateWithTableModel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SearchUICollectionViewController

- (BOOL)respondsToSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICollectionViewController;
  return -[SearchUICollectionViewController respondsToSelector:](&v6, sel_respondsToSelector_)
      || [(SearchUICollectionViewController *)self forwardFeedbackForSelector:a3];
}

- (BOOL)forwardFeedbackForSelector:(SEL)a3
{
  if ((unint64_t)protocol_getMethodDescription((Protocol *)&unk_1F407CEB8, a3, 0, 1).name)
  {
    v4 = [(SearchUICollectionViewController *)self feedbackListener];
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)sendVisibleFeedbackIfNecessary
{
  v2 = self;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if ([(SearchUICollectionViewController *)self isVisibleFeedbackEnabled])
  {
    if ([(SearchUICollectionViewController *)v2 _appearState] != 3)
    {
      if ([(SearchUICollectionViewController *)v2 _appearState])
      {
        v3 = [(SearchUICollectionViewController *)v2 dataSource];
        v4 = [v3 snapshot];
        uint64_t v5 = [v4 numberOfSections];

        if (v5 >= 1)
        {
          objc_super v6 = [(SearchUICollectionViewController *)v2 collectionView];
          [v6 visibleBounds];
          double v8 = v7;
          double v10 = v9;
          double v12 = v11;
          double v14 = v13;

          v15 = [(SearchUICollectionViewController *)v2 view];
          [v15 safeAreaInsets];
          double v17 = v16;

          double v18 = v10 + v17;
          [(SearchUIKeyboardableCollectionViewController *)v2 currentKeyboardHeight];
          double v20 = v14 - (v17 + v19);
          v21 = [(SearchUICollectionViewController *)v2 tableModel];
          uint64_t v69 = [v21 queryId];

          v22 = [(SearchUICollectionViewController *)v2 feedbackListener];
          if (objc_opt_respondsToSelector())
          {
            v23 = [(SearchUICollectionViewController *)v2 potentiallyVisibleCells];
            uint64_t v24 = [v23 count];

            if (v24)
            {
              v25 = [(SearchUICollectionViewController *)v2 potentiallyVisibleCells];
              v71 = v2;
              v26 = -[SearchUICollectionViewController visibleViewsInPotentiallyVisibleViews:withinRegion:](v2, "visibleViewsInPotentiallyVisibleViews:withinRegion:", v25, v8, v18, v12, v20);

              v27 = objc_opt_new();
              v28 = objc_opt_new();
              long long v77 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              id v29 = v26;
              uint64_t v30 = [v29 countByEnumeratingWithState:&v77 objects:v82 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v78;
                do
                {
                  for (uint64_t i = 0; i != v31; ++i)
                  {
                    if (*(void *)v78 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    v34 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v35 = [v34 visibleResults];
                      if (v35) {
                        [v27 addObjectsFromArray:v35];
                      }
                      v36 = objc_msgSend(v34, "rowModel", v69);
                      v37 = [v36 cardSection];

                      if (v37) {
                        [v28 addObject:v37];
                      }
                    }
                  }
                  uint64_t v31 = [v29 countByEnumeratingWithState:&v77 objects:v82 count:16];
                }
                while (v31);
              }

              v2 = v71;
              v38 = [(SearchUICollectionViewController *)v71 latestVisibleResultsAccountedForInFeedback];
              v39 = (void *)[v27 copy];
              [(SearchUICollectionViewController *)v71 setLatestVisibleResultsAccountedForInFeedback:v39];

              v40 = [(SearchUICollectionViewController *)v71 latestVisibleCardSectionsAccountedForInFeedback];
              v41 = (void *)[v28 copy];
              [(SearchUICollectionViewController *)v71 setLatestVisibleCardSectionsAccountedForInFeedback:v41];

              uint64_t v42 = [(SearchUICollectionViewController *)v71 lastVisibleFeedbackTrigger];
              int v43 = [v27 isEqual:v38];
              char v44 = [v28 isEqual:v40];
              if (!v43 || (v44 & 1) == 0)
              {
                id v45 = objc_alloc(MEMORY[0x1E4F9A540]);
                v46 = [v27 array];
                v47 = [v28 array];
                v48 = (void *)[v45 initWithResults:v46 triggerEvent:v42 visibleButtons:0 visibleCardSections:v47];

                v2 = v71;
                [v48 setQueryId:v69];
                v49 = [(SearchUICollectionViewController *)v71 feedbackListener];
                [v49 resultsDidBecomeVisible:v48];
              }
            }
          }
          else
          {
          }
          id v50 = [(SearchUICollectionViewController *)v2 feedbackListener];
          if (objc_opt_respondsToSelector())
          {
            v51 = [(SearchUICollectionViewController *)v2 potentiallyVisibleHeaders];
            uint64_t v52 = [v51 count];

            if (!v52) {
              return;
            }
            v53 = (void *)MEMORY[0x1E4F1CA70];
            v54 = [(SearchUICollectionViewController *)v2 potentiallyVisibleHeaders];
            v55 = -[SearchUICollectionViewController visibleViewsInPotentiallyVisibleViews:withinRegion:](v2, "visibleViewsInPotentiallyVisibleViews:withinRegion:", v54, v8, v18, v12, v20);
            v56 = [v53 orderedSetWithArray:v55];

            v57 = objc_opt_new();
            v72 = v2;
            v58 = [(SearchUICollectionViewController *)v2 latestVisibleSectionHeadersAccountedForInFeedback];
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            id v50 = v56;
            uint64_t v59 = [v50 countByEnumeratingWithState:&v73 objects:v81 count:16];
            if (v59)
            {
              uint64_t v60 = v59;
              uint64_t v61 = *(void *)v74;
              do
              {
                for (uint64_t j = 0; j != v60; ++j)
                {
                  if (*(void *)v74 != v61) {
                    objc_enumerationMutation(v50);
                  }
                  uint64_t v63 = *(void *)(*((void *)&v73 + 1) + 8 * j);
                  v64 = +[SearchUISupplementaryProvider sectionForHeaderView:v63];
                  if (v64)
                  {
                    [v57 addObject:v64];
                    if (([v58 containsObject:v64] & 1) == 0)
                    {
                      unint64_t v65 = +[SearchUISupplementaryProvider headerTypeForHeaderView:v63];
                      v66 = (void *)[objc_alloc(MEMORY[0x1E4F9A548]) initWithSection:v64 headerType:v65];
                      [v66 setQueryId:v70];
                      v67 = [(SearchUICollectionViewController *)v72 feedbackListener];
                      [v67 sectionHeaderDidBecomeVisible:v66];
                    }
                  }
                }
                uint64_t v60 = [v50 countByEnumeratingWithState:&v73 objects:v81 count:16];
              }
              while (v60);
            }

            v68 = (void *)[v57 copy];
            [(SearchUICollectionViewController *)v72 setLatestVisibleSectionHeadersAccountedForInFeedback:v68];
          }
        }
      }
    }
  }
}

- (SearchUICollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (SearchUIFeedbackDelegate)feedbackListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackListener);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (NSMutableDictionary)potentiallyVisibleHeaders
{
  return self->_potentiallyVisibleHeaders;
}

- (NSMutableDictionary)potentiallyVisibleCells
{
  return self->_potentiallyVisibleCells;
}

- (id)visibleViewsInPotentiallyVisibleViews:(id)a3 withinRegion:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __87__SearchUICollectionViewController_visibleViewsInPotentiallyVisibleViews_withinRegion___block_invoke;
  v27[3] = &unk_1E6E74098;
  CGFloat v29 = x;
  CGFloat v30 = y;
  CGFloat v31 = width;
  CGFloat v32 = height;
  v27[4] = self;
  id v11 = v10;
  id v28 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v27];
  double v12 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v13 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", 0, 1, 0);
  v33 = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v15 = [v11 sortedArrayUsingDescriptors:v14];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (v20) {
          [v12 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v17);
  }

  v21 = (void *)[v12 copy];
  return v21;
}

- (BOOL)isVisibleFeedbackEnabled
{
  return self->_isVisibleFeedbackEnabled;
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SearchUICollectionViewController;
  [(SearchUICollectionViewController *)&v18 viewDidLayoutSubviews];
  v3 = [(SearchUICollectionViewController *)self view];
  [v3 visibleBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(SearchUICollectionViewController *)self lastVisibleBounds];
  v20.origin.CGFloat x = v12;
  v20.origin.CGFloat y = v13;
  v20.size.CGFloat width = v14;
  v20.size.CGFloat height = v15;
  v19.origin.CGFloat x = v5;
  v19.origin.CGFloat y = v7;
  v19.size.CGFloat width = v9;
  v19.size.CGFloat height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[SearchUICollectionViewController setLastVisibleBounds:](self, "setLastVisibleBounds:", v5, v7, v9, v11);
    uint64_t v16 = [(SearchUICollectionViewController *)self latestVisibleCardSectionsAccountedForInFeedback];
    uint64_t v17 = [v16 count];

    if (v17) {
      [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:9];
    }
  }
  [(SearchUICollectionViewController *)self sendVisibleFeedbackIfNecessary];
}

- (CGRect)lastVisibleBounds
{
  double x = self->_lastVisibleBounds.origin.x;
  double y = self->_lastVisibleBounds.origin.y;
  double width = self->_lastVisibleBounds.size.width;
  double height = self->_lastVisibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSOrderedSet)latestVisibleCardSectionsAccountedForInFeedback
{
  return self->_latestVisibleCardSectionsAccountedForInFeedback;
}

- (void)setLatestVisibleSectionHeadersAccountedForInFeedback:(id)a3
{
}

- (void)setLatestVisibleResultsAccountedForInFeedback:(id)a3
{
}

- (void)setLatestVisibleCardSectionsAccountedForInFeedback:(id)a3
{
}

- (NSOrderedSet)latestVisibleSectionHeadersAccountedForInFeedback
{
  return self->_latestVisibleSectionHeadersAccountedForInFeedback;
}

- (NSOrderedSet)latestVisibleResultsAccountedForInFeedback
{
  return self->_latestVisibleResultsAccountedForInFeedback;
}

- (unint64_t)lastVisibleFeedbackTrigger
{
  return self->_lastVisibleFeedbackTrigger;
}

- (void)setLastVisibleBounds:(CGRect)a3
{
  self->_lastVisibleBounds = a3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)footerView
{
  return self->_footerView;
}

id __40__SearchUICollectionViewController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v7 = [WeakRetained dataSource];
  double v8 = [v7 sectionIdentifierForIndex:a2];

  double v9 = [WeakRetained dataSource];
  double v10 = [WeakRetained searchUIAttributes];
  double v11 = [v9 layoutSectionForSectionModel:v8 layoutEnvironment:v5 attributes:v10];

  return v11;
}

- (SearchUICommandEnvironment)commandEnvironment
{
  v3 = objc_opt_new();
  [v3 setFeedbackDelegate:self];
  objc_msgSend(v3, "setShouldUseInsetRoundedSections:", -[SearchUICollectionViewController shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections"));
  double v4 = [(SearchUICollectionViewController *)self resultsViewDelegate];
  [v3 setResultsViewDelegate:v4];

  objc_msgSend(v3, "setShouldUseStandardSectionInsets:", -[SearchUICollectionViewController shouldUseStandardSectionInsets](self, "shouldUseStandardSectionInsets"));
  [v3 setPresentingViewController:self];
  objc_msgSend(v3, "setSelectableGridPunchoutIndex:", -[SearchUICollectionViewController preferredPunchoutIndex](self, "preferredPunchoutIndex"));
  objc_msgSend(v3, "setThreeDTouchEnabled:", -[SearchUICollectionViewController threeDTouchEnabled](self, "threeDTouchEnabled"));
  id v5 = [(SearchUICollectionViewController *)self commandDelegate];
  [v3 setCommandDelegate:v5];

  [v3 setRowModelViewDelegate:self];
  double v6 = [(SearchUICollectionViewController *)self cardViewDelegate];
  [v3 setCardViewDelegate:v6];

  double v7 = [(SearchUICollectionViewController *)self searchUIAttributes];
  [v7 setCommandEnvironment:v3];

  return (SearchUICommandEnvironment *)v3;
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (SearchUICollectionViewAttributes)searchUIAttributes
{
  return self->_searchUIAttributes;
}

- (SearchUICardViewDelegate)cardViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewDelegate);
  return (SearchUICardViewDelegate *)WeakRetained;
}

- (BOOL)threeDTouchEnabled
{
  v2 = [(SearchUICollectionViewController *)self contextInteraction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUseStandardSectionInsets
{
  return self->_shouldUseStandardSectionInsets;
}

- (int64_t)preferredPunchoutIndex
{
  return self->_preferredPunchoutIndex;
}

- (SearchUICommandDelegate)commandDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandDelegate);
  return (SearchUICommandDelegate *)WeakRetained;
}

- (SearchUIResultsViewDelegate)resultsViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsViewDelegate);
  return (SearchUIResultsViewDelegate *)WeakRetained;
}

- (BOOL)isEntitySearch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(SearchUICollectionViewController *)self dataSource];
  BOOL v3 = [v2 snapshot];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = objc_msgSend(v3, "sectionIdentifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    char v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          char v6 = 1;
        }
        v7 |= [v10 drawPlattersIfNecessary] ^ 1;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
    LOBYTE(v5) = v7 & v6;
  }

  return v5 & 1;
}

- (void)setCommandDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_commandDelegate, a3);
  id v4 = [(SearchUICollectionViewController *)self commandEnvironment];
  [(SearchUICollectionViewAttributes *)self->_searchUIAttributes setCommandEnvironment:v4];
}

- (void)setFocusableIndexPath:(id)a3
{
  id v14 = a3;
  p_focusableIndexPath = &self->_focusableIndexPath;
  objc_storeStrong((id *)&self->_focusableIndexPath, a3);
  char v6 = [(SearchUICollectionViewController *)self view];
  int v7 = [v6 window];

  if (v7)
  {
    uint64_t v8 = [(SearchUIKeyboardableCollectionViewController *)self textField];

    double v9 = (void *)MEMORY[0x1E4FB1790];
    if (v8)
    {
      double v10 = [(SearchUIKeyboardableCollectionViewController *)self textField];
      double v11 = [v9 focusSystemForEnvironment:v10];

      long long v12 = [(SearchUIKeyboardableCollectionViewController *)self textField];
      [v11 requestFocusUpdateToEnvironment:v12];
    }
    else
    {
      double v11 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
      [v11 requestFocusUpdateToEnvironment:self];
    }
    [v11 updateFocusIfNeeded];

    long long v13 = *p_focusableIndexPath;
    *p_focusableIndexPath = 0;
  }
}

- (SearchUICollectionViewController)init
{
  v35.receiver = self;
  v35.super_class = (Class)SearchUICollectionViewController;
  v2 = [(SearchUIKeyboardableCollectionViewController *)&v35 init];
  if (v2)
  {
    BOOL v3 = objc_opt_new();
    [v3 setContentInsetsReference:2];
    objc_initWeak(&location, v2);
    id v4 = [SearchUICollectionViewLayout alloc];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    CGFloat v31 = __40__SearchUICollectionViewController_init__block_invoke;
    CGFloat v32 = &unk_1E6E74070;
    objc_copyWeak(&v33, &location);
    uint64_t v5 = [(SearchUICollectionViewLayout *)v4 initWithSectionProvider:&v29 configuration:v3];
    -[SearchUICollectionViewLayout setSizingDelegate:](v5, "setSizingDelegate:", v2, v29, v30, v31, v32);
    char v6 = [SearchUICollectionView alloc];
    int v7 = -[SearchUICollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SearchUIKeyboardableCollectionViewController *)v2 setCollectionView:v7];
    uint64_t v8 = [(SearchUICollectionViewController *)v2 collectionView];
    [v8 setBackgroundColor:0];

    double v9 = [(SearchUICollectionViewController *)v2 collectionView];
    [v9 _setShouldBecomeFocusedOnSelection:1];

    double v10 = [(SearchUICollectionViewController *)v2 collectionView];
    [v10 _setDelaysUserInitiatedItemSelection:1];

    double v11 = [[SearchUICollectionViewDataSource alloc] initWithController:v2];
    [(SearchUICollectionViewController *)v2 setDataSource:v11];

    long long v12 = [(SearchUICollectionViewController *)v2 dataSource];
    long long v13 = [(SearchUICollectionViewController *)v2 collectionView];
    [v13 setDataSource:v12];

    id v14 = [(SearchUICollectionViewController *)v2 collectionView];
    [v14 setContentInsetAdjustmentBehavior:1];

    long long v15 = [(SearchUICollectionViewController *)v2 collectionView];
    [v15 _setAutomaticContentOffsetAdjustmentEnabled:0];

    [(SearchUICollectionViewController *)v2 addOrbInteractionIfNeeded];
    uint64_t v16 = objc_opt_new();
    [(SearchUICollectionViewController *)v2 setPotentiallyVisibleCells:v16];

    uint64_t v17 = objc_opt_new();
    [(SearchUICollectionViewController *)v2 setPotentiallyVisibleHeaders:v17];

    objc_super v18 = (void *)MEMORY[0x1E4FAE060];
    CGRect v19 = [(SearchUICollectionViewController *)v2 view];
    CGRect v20 = [v18 bestAppearanceForView:v19];
    v21 = [(SearchUICollectionViewController *)v2 searchUIAttributes];
    [v21 setAppearance:v20];

    [(SearchUICollectionViewController *)v2 setIsVisibleFeedbackEnabled:1];
    v22 = [(SearchUICollectionViewController *)v2 view];
    long long v23 = [v22 layer];
    [v23 setAllowsGroupOpacity:0];

    long long v24 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0x100000 action:sel_skipDown];
    [v24 setWantsPriorityOverSystemBehavior:1];
    [(SearchUICollectionViewController *)v2 addKeyCommand:v24];
    long long v25 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0x100000 action:sel_skipUp];
    [v25 setWantsPriorityOverSystemBehavior:1];
    [(SearchUICollectionViewController *)v2 addKeyCommand:v25];
    long long v26 = objc_opt_new();
    [(SearchUICollectionViewController *)v2 setExpandedCollectionSections:v26];

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v2 selector:sel_deselectSelectedRowsIfNeeded name:*MEMORY[0x1E4FB2628] object:0];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setIsVisibleFeedbackEnabled:(BOOL)a3
{
  self->_isVisibleFeedbackEnabled = a3;
}

- (void)setSizingDelegate:(id)a3
{
}

- (void)setPotentiallyVisibleHeaders:(id)a3
{
}

- (void)setPotentiallyVisibleCells:(id)a3
{
}

- (void)setExpandedCollectionSections:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (SearchUICollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewController;
  id v4 = [(SearchUICollectionViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    searchUIAttributes = v4->_searchUIAttributes;
    v4->_searchUIAttributes = (SearchUICollectionViewAttributes *)v5;

    int v7 = [(SearchUICollectionViewController *)v4 commandEnvironment];
    [(SearchUICollectionViewAttributes *)v4->_searchUIAttributes setCommandEnvironment:v7];

    [(SearchUICollectionViewAttributes *)v4->_searchUIAttributes setHeaderDelegate:v4];
    [(SearchUICollectionViewController *)v4 setDragInteractionEnabled:1];
    [(SearchUICollectionViewController *)v4 setPreferredPunchoutIndex:-1];
  }
  return v4;
}

- (void)setPreferredPunchoutIndex:(int64_t)a3
{
  self->_preferredPunchoutIndedouble x = a3;
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  self->_dragInteractionEnabled = a3;
}

- (void)addOrbInteractionIfNeeded
{
  BOOL v3 = [(SearchUICollectionViewController *)self contextInteraction];

  if (!v3)
  {
    id v4 = [[SearchUICollectionPeekDelegate alloc] initWithViewController:self];
    [(SearchUICollectionViewController *)self setPeekDelegate:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB1680]);
    char v6 = [(SearchUICollectionViewController *)self peekDelegate];
    int v7 = (void *)[v5 initWithDelegate:v6];
    [(SearchUICollectionViewController *)self setContextInteraction:v7];

    id v9 = [(SearchUICollectionViewController *)self collectionView];
    uint64_t v8 = [(SearchUICollectionViewController *)self contextInteraction];
    [v9 addInteraction:v8];
  }
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setPeekDelegate:(id)a3
{
}

- (void)setContextInteraction:(id)a3
{
}

- (SearchUICollectionPeekDelegate)peekDelegate
{
  return self->_peekDelegate;
}

- (SearchUITableModel)tableModel
{
  return self->_tableModel;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)updateContentScrolledOffScreenStatus
{
  uint64_t v3 = [(SearchUICollectionViewController *)self navigationController];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(SearchUICollectionViewController *)self resultsViewDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v9 = [(SearchUICollectionViewController *)self resultsViewDelegate];
      int v7 = [(SearchUICollectionViewController *)self collectionView];
      [v7 contentOffset];
      [v9 didUpdateContentScrolledOffScreenStatus:v8 > 0.5 animated:1];
    }
  }
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  if (self->_shouldUseInsetRoundedSections != a3)
  {
    self->_shouldUseInsetRoundedSections = a3;
    BOOL v4 = [(SearchUICollectionViewController *)self shouldUseInsetRoundedSections];
    id v5 = [(SearchUICollectionViewController *)self searchUIAttributes];
    [v5 setShouldUseInsetRoundedSections:v4];

    id v6 = [(SearchUICollectionViewController *)self dataSource];
    [v6 reloadModel];
  }
}

- (id)currentSnapshotLayoutConfiguration
{
  v2 = [(SearchUICollectionViewController *)self dataSource];
  uint64_t v3 = [v2 currentSnapshotLayoutConfiguration];

  return v3;
}

- (void)contentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(SearchUICollectionViewController *)self sizingDelegate];
  objc_msgSend(v6, "contentSizeDidChange:animated:", -[SearchUICollectionViewController collectionViewAnimating](self, "collectionViewAnimating"), width, height);
}

- (SearchUISizingDelegate)sizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizingDelegate);
  return (SearchUISizingDelegate *)WeakRetained;
}

- (BOOL)collectionViewAnimating
{
  return self->_collectionViewAnimating;
}

void __87__SearchUICollectionViewController_visibleViewsInPotentiallyVisibleViews_withinRegion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  int v7 = [v5 collectionView];
  BOOL v8 = +[SearchUIAutoLayout view:isVisibleInBounds:ofView:](SearchUIAutoLayout, "view:isVisibleInBounds:ofView:", v6, v7, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  if (v8) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (void)setRestorationContextClass:(Class)a3
{
}

- (void)setFeedbackListener:(id)a3
{
}

- (void)setViewDidUpdateHandler:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewController;
  id v4 = a3;
  [(SearchUIKeyboardableCollectionViewController *)&v9 scrollViewDidScroll:v4];
  id v5 = objc_msgSend(v4, "panGestureRecognizer", v9.receiver, v9.super_class);
  [v5 velocityInView:v4];
  double v7 = v6;

  if (v7 != 0.0)
  {
    if (v7 <= 0.0) {
      uint64_t v8 = 11;
    }
    else {
      uint64_t v8 = 10;
    }
    [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:v8];
  }
  [(SearchUICollectionViewController *)self updateContentScrolledOffScreenStatus];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUICollectionViewController;
  [(SearchUICollectionViewController *)&v4 viewWillAppear:a3];
  [(SearchUICollectionViewController *)self deselectSelectedRowsIfNeeded];
  [(SearchUICollectionViewController *)self updateContentScrolledOffScreenStatus];
}

- (void)setTableModel:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  long long v15 = (SearchUITableModel *)a3;
  if (self->_tableModel != v15)
  {
    objc_storeStrong((id *)&self->_tableModel, a3);
    id v9 = a5;
    double v10 = [SearchUIDataSourceSnapshotBuilder alloc];
    double v11 = [(SearchUICollectionViewController *)self expandedSections];
    long long v12 = [(SearchUICollectionViewController *)self expandedCollectionSections];
    long long v13 = [(SearchUIDataSourceSnapshotBuilder *)v10 initWithExpandedSections:v11 expandedCollectionSections:v12];

    id v14 = [(SearchUIDataSourceSnapshotBuilder *)v13 buildSnapshotFromTableModel:v15];
    [(SearchUICollectionViewController *)self updateWithSnapshot:v14 animated:v6 completion:v9];
  }
}

- (NSMutableSet)expandedCollectionSections
{
  return self->_expandedCollectionSections;
}

- (id)viewDidUpdateHandler
{
  return self->viewDidUpdateHandler;
}

- (id)viewWillUpdateHandler
{
  return self->viewWillUpdateHandler;
}

- (void)updateWithSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v21 = a3;
  id v8 = a5;
  if (![(SearchUICollectionViewController *)self updateMustAccountForLayout])
  {
    id v9 = [(SearchUICollectionViewController *)self viewWillUpdateHandler];

    if (v9)
    {
      double v10 = [(SearchUICollectionViewController *)self viewWillUpdateHandler];
      v10[2]();
    }
  }
  double v11 = [v21 itemIdentifiers];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    long long v13 = [v21 sectionIdentifiers];
    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    long long v15 = [v21 itemIdentifiersInSectionWithIdentifier:v14];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];

    uint64_t v17 = [v16 cardSection];
    objc_opt_class();
    LOBYTE(v14) = objc_opt_isKindOfClass();

    if (v14) {
      [(SearchUICollectionViewController *)self setShouldUseInsetRoundedSections:0];
    }
  }
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:1];
  objc_super v18 = [(SearchUICollectionViewController *)self dataSource];
  [v18 updateWithSnapshot:v21 animated:v6 completion:v8];

  if (![(SearchUICollectionViewController *)self updateMustAccountForLayout])
  {
    CGRect v19 = [(SearchUICollectionViewController *)self viewDidUpdateHandler];

    if (v19)
    {
      CGRect v20 = [(SearchUICollectionViewController *)self viewDidUpdateHandler];
      v20[2]();
    }
  }
}

- (void)setLastVisibleFeedbackTrigger:(unint64_t)a3
{
  self->_lastVisibleFeedbackTrigger = a3;
}

- (void)setTableModel:(id)a3 animated:(BOOL)a4
{
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v14 = a4;
  id v9 = a6;
  id v10 = a5;
  double v11 = +[SearchUISupplementaryIdentifiers sectionHeaderKind];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    long long v13 = [(SearchUICollectionViewController *)self potentiallyVisibleHeaders];
    [v13 setObject:v14 forKeyedSubscript:v9];
  }
}

- (void)setFooterView:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    BOOL v6 = [(SearchUICollectionViewController *)self collectionView];
    double v7 = [v6 collectionViewLayout];

    id v8 = [v7 configuration];
    id v9 = v8;
    if (v5)
    {
      id v10 = [(SearchUICollectionViewController *)self dataSource];
      double v11 = [v10 registerFooterView:v5];

      int v12 = (void *)MEMORY[0x1E4FB1338];
      long long v13 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
      id v14 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
      long long v15 = [v12 sizeWithWidthDimension:v13 heightDimension:v14];

      uint64_t v16 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v15 elementKind:v11 alignment:5];
      v19[0] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v9 setBoundarySupplementaryItems:v17];
    }
    else
    {
      [v8 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
    }
    objc_storeStrong((id *)&self->_footerView, a3);
    [v7 setConfiguration:v9];
  }
  objc_super v18 = [(SearchUICollectionViewController *)self searchUIAttributes];
  [v18 setHasFooter:v5 != 0];
}

- (void)setResultsViewDelegate:(id)a3
{
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SearchUICollectionViewController *)self dataSource];
  id v9 = [v8 cellForRowModel:v7 atIndexPath:v6];

  LODWORD(v7) = [(SearchUICollectionViewController *)self isActiveRunningShortcutForIndexPath:v6];
  if (v7)
  {
    id v10 = [(SearchUICollectionViewController *)self activeRunViewSource];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      int v12 = [(SearchUICollectionViewController *)self activeRunViewSource];
      long long v13 = [v9 contentView];
      [v12 updateSourceView:v13];
    }
  }
  return v9;
}

- (BOOL)isActiveRunningShortcutForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewController *)self activeRunViewSource];

  if (v5)
  {
    id v6 = [(SearchUICollectionViewController *)self dataSource];
    id v7 = [v6 itemIdentifierForIndexPath:v4];

    id v8 = [v7 cardSection];
    id v9 = [v8 command];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 voiceShortcutIdentifier];
      char v11 = [(SearchUICollectionViewController *)self activeVoiceShortcutIdentifier];
      char v12 = [v10 isEqualToString:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (WFWorkflowRunViewSource)activeRunViewSource
{
  return self->_activeRunViewSource;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  +[SearchUIAppEntityAnnotator registerCollectionViewController:self];
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewController;
  [(SearchUICollectionViewController *)&v5 viewDidAppear:v3];
  [(SearchUICollectionViewController *)self sendVisibleFeedbackIfNecessary];
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v12 = a6;
  id v8 = a5;
  id v9 = +[SearchUISupplementaryIdentifiers sectionHeaderKind];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    char v11 = [(SearchUICollectionViewController *)self potentiallyVisibleHeaders];
    [v11 removeObjectForKey:v12];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  id v8 = [(SearchUICollectionViewController *)self potentiallyVisibleCells];
  [v8 setObject:v15 forKeyedSubscript:v7];

  if (objc_opt_respondsToSelector())
  {
    id v9 = [v15 embeddedViewController];

    if (v9)
    {
      int v10 = [v15 embeddedViewController];
      [v10 beginAppearanceTransition:1 animated:0];
      [(SearchUICollectionViewController *)self addChildViewController:v10];
      [v10 didMoveToParentViewController:self];
      [v10 endAppearanceTransition];
    }
  }
  char v11 = [v15 rowModel];
  int v12 = [v11 allowsAppEntityAnnotation];

  if (!v12
    || ([v15 rowModel],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = +[SearchUIAppEntityAnnotator annotateView:v15 withRowModel:v13], v13, !v14))
  {
    +[SearchUIAppEntityAnnotator resetAnnotationForView:v15];
  }
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ == a3)
  {
    objc_super v5 = [(SearchUICollectionViewController *)self preferredFocusSystem];
    id v6 = [v5 focusedItem];

    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUICollectionViewController;
    unsigned __int8 isKindOfClass = -[SearchUICollectionViewController canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return isKindOfClass & 1;
}

- (void)copy:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(SearchUICollectionViewController *)self preferredFocusSystem];
  objc_super v5 = [v4 focusedItem];

  id v6 = [v5 rowModel];
  id v7 = [(SearchUICollectionViewController *)self commandEnvironment];
  objc_super v8 = +[SearchUICommandHandler handlerForRowModel:v6 environment:v7];
  id v9 = [v8 itemProvider];

  if (v9)
  {
    v33[0] = v9;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    char v11 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v11 setItemProviders:v10];
  }
  else
  {
    int v12 = [v5 rowModel];
    long long v13 = [v12 cardSection];
    BOOL v14 = [v13 previewButtonItems];
    uint64_t v15 = [v14 count];

    if (!v15) {
      goto LABEL_4;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v16 = [v5 rowModel];
    uint64_t v17 = [v16 cardSection];
    int v10 = [v17 previewButtonItems];

    uint64_t v18 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v10);
          }
          v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v23 = [v22 command];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              long long v25 = [v22 command];
              long long v26 = [(SearchUICollectionViewController *)self commandEnvironment];
              v27 = +[SearchUICommandHandler handlerForCommand:v25 environment:v26];
              [v27 executeWithTriggerEvent:18];
            }
          }
        }
        uint64_t v19 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }
  }

LABEL_4:
}

- (void)skipDown
{
  BOOL v3 = [(SearchUICollectionViewController *)self preferredFocusSystem];
  id v15 = [v3 focusedItem];

  id v4 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  if (v15 == v4)
  {
    int v12 = [(SearchUICollectionViewController *)self dataSource];
    long long v13 = [v12 snapshot];
    uint64_t v14 = [v13 numberOfSections];

    if (v14 >= 1)
    {
      id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      [(SearchUICollectionViewController *)self setFocusableIndexPath:v6];
      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_super v5 = [(SearchUICollectionViewController *)self indexPathForFocusView:v15];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 section] + 1;
    objc_super v8 = [(SearchUICollectionViewController *)self dataSource];
    id v9 = [v8 snapshot];
    uint64_t v10 = [v9 numberOfSections];

    if (v7 < v10)
    {
      char v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v6, "section") + 1);
      [(SearchUICollectionViewController *)self scrollAndFocusAtIndexPath:v11];
    }
  }
LABEL_8:
}

- (void)skipUp
{
  BOOL v3 = [(SearchUICollectionViewController *)self preferredFocusSystem];
  uint64_t v8 = [v3 focusedItem];

  id v4 = [(SearchUIKeyboardableCollectionViewController *)self textField];

  if ((void *)v8 != v4)
  {
    objc_super v5 = -[SearchUICollectionViewController indexPathForFocusView:](self, "indexPathForFocusView:");
    id v6 = v5;
    if (v5 && [v5 section] >= 1)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v6, "section") - 1);
      [(SearchUICollectionViewController *)self scrollAndFocusAtIndexPath:v7];
    }
  }
  MEMORY[0x1F4181820]();
}

- (id)indexPathForFocusView:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewController *)self collectionView];

  id v6 = 0;
  if (v4)
  {
    if (v5 != v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([(SearchUICollectionViewController *)self collectionView],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            [v7 indexPathForCell:v4],
            id v6 = objc_claimAutoreleasedReturnValue(),
            v7,
            !v6))
      {
        uint64_t v8 = [v4 superview];
        id v6 = [(SearchUICollectionViewController *)self indexPathForFocusView:v8];
      }
    }
  }

  return v6;
}

- (void)scrollAndFocusAtIndexPath:(id)a3
{
  id v8 = a3;
  id v4 = [(SearchUICollectionViewController *)self collectionView];
  [v4 scrollToItemAtIndexPath:v8 atScrollPosition:4 animated:0];

  id v5 = [(SearchUICollectionViewController *)self collectionView];
  [v5 layoutIfNeeded];

  id v6 = [(SearchUICollectionViewController *)self collectionView];
  [v6 scrollToItemAtIndexPath:v8 atScrollPosition:4 animated:0];

  uint64_t v7 = [(SearchUICollectionViewController *)self collectionView];
  [v7 layoutIfNeeded];

  [(SearchUICollectionViewController *)self setFocusableIndexPath:v8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUICollectionViewController;
  [(SearchUICollectionViewController *)&v4 viewDidDisappear:a3];
  [(SearchUICollectionViewController *)self resetVisibleFeedback];
}

- (void)updateWithCardSection:(id)a3
{
  id v4 = +[SearchUITableModel tableModelWithCardSections:a3 isInline:1 queryId:0];
  [(SearchUICollectionViewController *)self updateWithTableModel:v4];
}

- (void)updateWithResultSections:(id)a3
{
  id v4 = +[SearchUITableModel tableModelWithSections:a3 expandedSections:0 expandedCollectionCardSections:0];
  [(SearchUICollectionViewController *)self updateWithTableModel:v4];
}

- (void)updateWithTableModel:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  id v5 = [v6 buildSnapshotFromTableModel:v4];

  [(SearchUICollectionViewController *)self updateWithSnapshot:v5];
}

- (void)shortcutDidEnd:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  uint64_t v7 = [v5 object];
  [v6 removeObserver:self name:@"SearchUICommandHandlerShortcutDidEndNotification" object:v7];

  id v8 = [(SearchUICollectionViewController *)self activeRunViewSource];
  id v9 = [v5 object];

  LODWORD(v5) = [v8 isEqual:v9];
  if (v5)
  {
    [(SearchUICollectionViewController *)self setActiveRunViewSource:0];
    [(SearchUICollectionViewController *)self setActiveVoiceShortcutIdentifier:0];
  }
}

- (void)deselectSelectedRowsIfNeeded
{
  if (([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] & 1) == 0)
  {
    id v6 = [(SearchUICollectionViewController *)self collectionView];
    BOOL v3 = [(SearchUICollectionViewController *)self collectionView];
    id v4 = [v3 indexPathsForSelectedItems];
    id v5 = [v4 firstObject];
    [v6 deselectItemAtIndexPath:v5 animated:1];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  id v8 = [(SearchUICollectionViewController *)self potentiallyVisibleCells];
  id v9 = [v8 objectForKey:v7];
  int v10 = [v9 isEqual:v17];

  if (v10)
  {
    char v11 = [(SearchUICollectionViewController *)self potentiallyVisibleCells];
    [v11 removeObjectForKey:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    int v12 = [v17 embeddedViewController];

    if (v12)
    {
      long long v13 = [v17 embeddedViewController];
      [v13 beginAppearanceTransition:0 animated:0];
      [v13 willMoveToParentViewController:0];
      [v13 removeFromParentViewController];
      [v13 endAppearanceTransition];
    }
  }
  if ([(SearchUICollectionViewController *)self isActiveRunningShortcutForIndexPath:v7])
  {
    uint64_t v14 = [(SearchUICollectionViewController *)self activeRunViewSource];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v16 = [(SearchUICollectionViewController *)self activeRunViewSource];
      [v16 updateSourceView:0];
    }
  }
  +[SearchUIAppEntityAnnotator resetAnnotationForView:v17];
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  [a4 _panGestureVelocityInView:a3];
  if (v6 != 0.0)
  {
    if (v6 <= 0.0) {
      uint64_t v7 = 17;
    }
    else {
      uint64_t v7 = 16;
    }
    [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:v7];
  }
}

- (BOOL)canHighlightRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewController *)self dataSource];
  double v6 = [v5 itemIdentifierForIndexPath:v4];

  uint64_t v7 = [(SearchUICollectionViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v4];

  id v9 = [(SearchUICollectionViewController *)self commandEnvironment];
  if (+[SearchUICommandHandler hasValidHandlerForRowModel:v6 environment:v9])
  {
    char v10 = 1;
  }
  else
  {
    char v10 = [v8 needsInternalFocus];
  }

  return v10;
}

- (void)scrollAndSelectLastSelectedIndexPath
{
  uint64_t v3 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(SearchUICollectionViewController *)self dataSource];
    double v6 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
    uint64_t v7 = [v5 itemIdentifierForIndexPath:v6];

    if (v7)
    {
      id v8 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
      BOOL v9 = [(SearchUICollectionViewController *)self doesIndexPathExist:v8];

      if (v9)
      {
        char v10 = [(SearchUICollectionViewController *)self collectionView];
        [v10 layoutIfNeeded];

        char v11 = [(SearchUICollectionViewController *)self collectionView];
        int v12 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
        [v11 selectItemAtIndexPath:v12 animated:0 scrollPosition:18];

        long long v13 = [(SearchUICollectionViewController *)self collectionView];
        [v13 layoutIfNeeded];

        uint64_t v14 = [(SearchUICollectionViewController *)self collectionView];
        char v15 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
        [v14 scrollToItemAtIndexPath:v15 atScrollPosition:18 animated:0];

        uint64_t v16 = [(SearchUICollectionViewController *)self collectionView];
        [v16 layoutIfNeeded];

        id v17 = [(SearchUICollectionViewController *)self collectionView];
        uint64_t v18 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
        [v17 selectItemAtIndexPath:v18 animated:0 scrollPosition:18];

        uint64_t v19 = [(SearchUICollectionViewController *)self collectionView];
        [v19 layoutBelowIfNeeded];

        dispatch_time_t v20 = dispatch_time(0, 250000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__SearchUICollectionViewController_scrollAndSelectLastSelectedIndexPath__block_invoke;
        block[3] = &unk_1E6E72730;
        block[4] = self;
        dispatch_after(v20, MEMORY[0x1E4F14428], block);
      }
    }
  }
}

uint64_t __72__SearchUICollectionViewController_scrollAndSelectLastSelectedIndexPath__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 lastSelectedIndexPath];
  LODWORD(v2) = [v2 doesIndexPathExist:v3];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) collectionView];
    id v5 = [*(id *)(a1 + 32) lastSelectedIndexPath];
    [v4 deselectItemAtIndexPath:v5 animated:1];
  }
  double v6 = *(void **)(a1 + 32);
  return [v6 setLastSelectedIndexPath:0];
}

- (BOOL)doesIndexPathExist:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewController *)self collectionView];
  double v6 = v5;
  if (v4 && (uint64_t v7 = [v5 numberOfSections], v7 > objc_msgSend(v4, "section")))
  {
    uint64_t v8 = objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
    BOOL v9 = v8 > [v4 item];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setRestorationContext:(id)a3
{
  id v4 = [a3 lastSelectedIndexPath];
  [(SearchUICollectionViewController *)self setLastSelectedIndexPath:v4];
}

- (id)restorationContext
{
  if (![(SearchUICollectionViewController *)self restorationContextClass]) {
    objc_opt_class();
  }
  uint64_t v3 = objc_opt_new();
  id v4 = [(SearchUICollectionViewController *)self lastSelectedIndexPath];
  [v3 setLastSelectedIndexPath:v4];

  return v3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(SearchUICollectionViewController *)self dataSource];
  id v21 = [v6 itemIdentifierForIndexPath:v5];

  uint64_t v7 = [(SearchUICollectionViewController *)self commandEnvironmentForIndexPath:v5];
  [(SearchUICollectionViewController *)self setLastSelectedIndexPath:v5];
  uint64_t v8 = +[SearchUICommandHandler handlerForRowModel:v21 environment:v7];
  BOOL v9 = [(SearchUICollectionViewController *)self collectionView];
  char v10 = [v9 cellForItemAtIndexPath:v5];

  char v11 = [v8 command];
  if (v11)
  {
  }
  else if ([v10 needsInternalFocus])
  {
    [v10 returnKeyPressed];
    goto LABEL_11;
  }
  int v12 = [v21 cardSection];
  long long v13 = [v12 command];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [v13 voiceShortcutIdentifier];
    [(SearchUICollectionViewController *)self setActiveVoiceShortcutIdentifier:v14];

    id v15 = objc_alloc(MEMORY[0x1E4FB4A88]);
    uint64_t v16 = [v7 sourceView];
    id v17 = [v16 contentView];
    uint64_t v18 = (void *)[v15 initWithView:v17];
    [(SearchUICollectionViewController *)self setActiveRunViewSource:v18];

    uint64_t v19 = [(SearchUICollectionViewController *)self activeRunViewSource];
    [v8 performSelector:sel_setRunViewSource_ withObject:v19];

    dispatch_time_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:self selector:sel_shortcutDidEnd_ name:@"SearchUICommandHandlerShortcutDidEndNotification" object:0];
  }
  [v8 executeWithTriggerEvent:2];
  if ([v8 shouldDeselectAfterExecution]) {
    [(SearchUICollectionViewController *)self deselectSelectedRowsIfNeeded];
  }

LABEL_11:
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SearchUICollectionViewController *)self canHighlightRowAtIndexPath:v5];
  BOOL v7 = v6;
  [(SearchUICollectionViewController *)self setSectionBackgroundHighlighted:v6 indexPath:v5];

  return v7;
}

- (void)setSectionBackgroundHighlighted:(BOOL)a3 indexPath:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  BOOL v6 = [(SearchUICollectionViewController *)self collectionView];
  BOOL v7 = [v6 cellForItemAtIndexPath:v11];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "searchui_focusStyle") == 5)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v11, "section"));
    BOOL v9 = [(SearchUICollectionViewController *)self collectionView];
    char v10 = [v9 _visibleSupplementaryViewOfKind:@"SearchUIBackgroundReuseIdentifer" atIndexPath:v8];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 setHighlighted:v4];
      }
    }
  }
}

- (void)setTableModelWithoutReset:(id)a3
{
}

- (void)setTableModel:(id)a3
{
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  if (self->_inPreviewPlatter != a3)
  {
    BOOL v3 = a3;
    self->_inPreviewPlatter = a3;
    id v4 = [(SearchUICollectionViewController *)self searchUIAttributes];
    [v4 setInPreviewPlatter:v3];
  }
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  if (self->_shouldUseStandardSectionInsets != a3)
  {
    self->_shouldUseStandardSectionInsets = a3;
    [(SearchUICollectionViewController *)self invalidateLayout];
  }
}

- (void)invalidateLayout
{
  BOOL v3 = [(SearchUICollectionViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];

  id v5 = [(SearchUICollectionViewController *)self collectionView];
  [v5 layoutIfNeeded];
}

- (BOOL)updateMustAccountForLayout
{
  return 0;
}

- (void)updateWithSnapshot:(id)a3
{
}

- (void)purgeMemory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SearchUICollectionViewController *)self dataSource];
  id v4 = [v3 snapshot];

  if (v4)
  {
    [(SearchUICollectionViewController *)self setTableModel:0];
    [(SearchUICollectionViewController *)self updateWithSnapshot:0];
    id v5 = [(SearchUICollectionViewController *)self collectionView];
    [v5 _purgeReuseQueues];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = [(SearchUICollectionViewController *)self childViewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v11 beginAppearanceTransition:0 animated:0];
        [v11 willMoveToParentViewController:0];
        [v11 removeFromParentViewController];
        [v11 endAppearanceTransition];
        int v12 = [v11 view];
        [v12 removeFromSuperview];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([(SearchUICollectionViewController *)self threeDTouchEnabled])
  {
    [(SearchUICollectionViewController *)self setThreeDTouchEnabled:0];
    [(SearchUICollectionViewController *)self setThreeDTouchEnabled:1];
  }
  long long v13 = [(SearchUICollectionViewController *)self potentiallyVisibleHeaders];
  [v13 removeAllObjects];

  uint64_t v14 = [(SearchUICollectionViewController *)self potentiallyVisibleCells];
  [v14 removeAllObjects];

  [(SearchUICollectionViewController *)self resetVisibleFeedback];
  +[SearchUIUtilities purgeMemory];
}

- (void)resetVisibleFeedback
{
  [(SearchUICollectionViewController *)self setLatestVisibleResultsAccountedForInFeedback:0];
  [(SearchUICollectionViewController *)self setLatestVisibleCardSectionsAccountedForInFeedback:0];
  [(SearchUICollectionViewController *)self setLatestVisibleSectionHeadersAccountedForInFeedback:0];
}

- (id)preferredFocusSystem
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1790];
  id v4 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  if (v4)
  {
    id v5 = [v3 focusSystemForEnvironment:v4];
  }
  else
  {
    BOOL v6 = [(SearchUICollectionViewController *)self collectionView];
    id v5 = [v3 focusSystemForEnvironment:v6];
  }
  return v5;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = [(SearchUICollectionViewController *)self collectionView];
  [v4 layoutIfNeeded];

  id v5 = self->_focusableIndexPath;
  focusableIndexPath = self->_focusableIndexPath;
  self->_focusableIndexPath = 0;

  return v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICollectionViewController;
  [(SearchUICollectionViewController *)&v7 viewWillDisappear:a3];
  id v4 = [(SearchUICollectionViewController *)self resultsViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(SearchUICollectionViewController *)self resultsViewDelegate];
    [v6 didUpdateContentScrolledOffScreenStatus:0 animated:1];
  }
}

- (id)viewForRowModel:(id)a3
{
  id v4 = a3;
  char v5 = [(SearchUICollectionViewController *)self dataSource];
  BOOL v6 = [v5 indexPathForItemIdentifier:v4];

  objc_super v7 = [(SearchUICollectionViewController *)self collectionView];
  uint64_t v8 = [v7 cellForItemAtIndexPath:v6];

  return v8;
}

- (void)scrollRowModelToVisible:(id)a3
{
  id v5 = [(SearchUICollectionViewController *)self viewForRowModel:a3];
  if (v5)
  {
    id v4 = [(SearchUICollectionViewController *)self collectionView];
    [v5 frame];
    objc_msgSend(v4, "scrollRectToVisible:animated:", 0);
  }
}

- (id)commandEnvironmentForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewController *)self commandEnvironment];
  if (v4)
  {
    BOOL v6 = [(SearchUICollectionViewController *)self dataSource];
    objc_super v7 = objc_msgSend(v6, "sectionIdentifierForIndex:", objc_msgSend(v4, "section"));
    [v5 setLastEngagedSection:v7];

    uint64_t v8 = [(SearchUICollectionViewController *)self collectionView];
    uint64_t v9 = [v8 cellForItemAtIndexPath:v4];
    [v5 setSourceView:v9];

    char v10 = [v5 lastEngagedSection];
    id v11 = [v10 section];
    int v12 = [v11 resultSection];
    long long v13 = [v12 title];
    [v5 setSectionTitle:v13];
  }
  return v5;
}

- (void)resignTextField
{
  id v2 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  [v2 resignFirstResponder];
}

- (void)showViewController:(id)a3
{
}

- (void)updateTableForNewCellHeightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  uint64_t v6 = v3 & v5;
  [(SearchUICollectionViewController *)self setCollectionViewAnimating:v6];
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v6];
  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke;
  v8[3] = &unk_1E6E72730;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke_2;
  v7[3] = &unk_1E6E72730;
  +[SearchUIUtilities performAnimatableChanges:v8 animated:1 completion:v7];
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v5];
}

void __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  BOOL v3 = [v2 collectionViewLayout];
  id v4 = [*(id *)(a1 + 32) collectionView];
  uint64_t v5 = [v4 collectionViewLayout];
  uint64_t v6 = [v5 _invalidationContextForRefreshingVisibleElementAttributes];
  [v3 invalidateLayoutWithContext:v6];

  id v7 = [*(id *)(a1 + 32) collectionView];
  [v7 layoutIfNeeded];
}

uint64_t __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCollectionViewAnimating:0];
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SearchUICollectionViewController *)self updateTableForNewCellHeightAnimated:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SearchUICollectionViewController_cardSectionViewDidInvalidateSize_animate___block_invoke;
  v10[3] = &unk_1E6E72730;
  v10[4] = self;
  +[SearchUIUtilities performAnimatableChanges:v10];
  id v7 = [(SearchUICollectionViewController *)self feedbackListener];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(SearchUICollectionViewController *)self feedbackListener];
    [v9 cardSectionViewDidInvalidateSize:v6 animate:v4];
  }
}

void __77__SearchUICollectionViewController_cardSectionViewDidInvalidateSize_animate___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 setAlpha:1.0];
}

- (void)removeRowModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:1];
  id v8 = [(SearchUICollectionViewController *)self dataSource];
  [v8 removeRowModel:v7 completion:v6];
}

- (void)removeSectionContainingRowModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:1];
  id v8 = [(SearchUICollectionViewController *)self dataSource];
  [v8 removeSectionContaining:v7 completion:v6];
}

- (void)removeSectionModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:1];
  id v8 = [(SearchUICollectionViewController *)self dataSource];
  [v8 removeSectionModel:v7 completion:v6];
}

- (void)updateViewControllerTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewController *)self parentViewController];
  [v5 setTitle:v4];
}

- (void)performScrollTestWithCompletion:(id)a3
{
}

- (void)performScrollTestWithHandlerForFirstScrollCompletion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [(SearchUICollectionViewController *)self setScrollTester:v8];

  id v10 = [(SearchUICollectionViewController *)self scrollTester];
  uint64_t v9 = [(SearchUICollectionViewController *)self collectionView];
  [v10 performScrollTestOnTableView:v9 firstScroll:v7 completion:v6];
}

- (void)performRecapScrollTestWithTestName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F94850] isRecapAvailable])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F94840]);
    uint64_t v9 = [(SearchUICollectionViewController *)self collectionView];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__SearchUICollectionViewController_performRecapScrollTestWithTestName_completion___block_invoke;
    v12[3] = &unk_1E6E73068;
    id v13 = v7;
    id v10 = (void *)[v8 initWithTestName:v6 scrollView:v9 completionHandler:v12];

    [v10 scrollingContentLength];
    [v10 setScrollingContentLength:v11 + v11];
    [MEMORY[0x1E4F94850] runTestWithParameters:v10];
  }
}

uint64_t __82__SearchUICollectionViewController_performRecapScrollTestWithTestName_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)numberOfSections
{
  BOOL v3 = [(SearchUICollectionViewController *)self dataSource];
  id v4 = [(SearchUICollectionViewController *)self collectionView];
  int64_t v5 = [v3 numberOfSectionsInCollectionView:v4];

  return v5;
}

- (void)iterateIndexPaths:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *, void *, void *))a3;
  if (v4)
  {
    int64_t v5 = [(SearchUICollectionViewController *)self dataSource];
    id v6 = [v5 snapshot];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v22 = v6;
    obuint64_t j = [v6 sectionIdentifiers];
    uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v23)
    {
      uint64_t v21 = *(void *)v32;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v7;
          long long v26 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
          id v8 = objc_msgSend(v22, "itemIdentifiersInSectionWithIdentifier:");
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v25 = v8;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v28;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v28 != v11) {
                  objc_enumerationMutation(v25);
                }
                id v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
                uint64_t v14 = [(SearchUICollectionViewController *)self dataSource];
                long long v15 = [v14 indexPathForItemIdentifier:v13];

                long long v16 = [v26 section];
                long long v17 = [v16 resultSection];
                long long v18 = [v13 identifyingResult];
                uint64_t v19 = [v13 cardSection];
                v4[2](v4, v17, v18, v19, v15);

                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v25 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v10);
          }

          uint64_t v7 = v24 + 1;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v23);
    }
  }
}

- (void)toggleShowMoreForSection:(unint64_t)a3
{
  id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
  -[SearchUICollectionViewController scrollToIndexPath:](self, "scrollToIndexPath:");
  int64_t v5 = [(SearchUICollectionViewController *)self dataSource];
  id v6 = [v5 snapshot];

  uint64_t v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 > a3)
  {
    uint64_t v9 = [v6 sectionIdentifiers];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];

    [(SearchUICollectionViewController *)self toggleExpansionForSectionModel:v10];
  }
}

- (CGRect)scrollToIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SearchUICollectionViewController *)self collectionView];
  [v5 scrollToItemAtIndexPath:v4 atScrollPosition:0 animated:0];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)tapAtIndexPath:(id)a3
{
  id v8 = a3;
  id v4 = [(SearchUICollectionViewController *)self dataSource];
  int64_t v5 = [v4 itemIdentifierForIndexPath:v8];

  if (v5)
  {
    double v6 = [(SearchUICollectionViewController *)self collectionView];
    [v6 selectItemAtIndexPath:v8 animated:0 scrollPosition:0];

    double v7 = [(SearchUICollectionViewController *)self collectionView];
    [(SearchUICollectionViewController *)self collectionView:v7 didSelectItemAtIndexPath:v8];
  }
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  if (a3)
  {
    [(SearchUICollectionViewController *)self addOrbInteractionIfNeeded];
  }
  else
  {
    id v4 = [(SearchUICollectionViewController *)self contextInteraction];

    if (v4)
    {
      int64_t v5 = [(SearchUICollectionViewController *)self collectionView];
      double v6 = [(SearchUICollectionViewController *)self contextInteraction];
      [v5 removeInteraction:v6];

      [(SearchUICollectionViewController *)self setPeekDelegate:0];
      [(SearchUICollectionViewController *)self setContextInteraction:0];
    }
  }
}

- (id)expandedSections
{
  return 0;
}

- (void)performExpansion:(BOOL)a3 withSection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 6;
  }
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:v7];
  if (v6)
  {
    id v8 = [v6 section];
    double v9 = [v8 resultSection];

    if (v9)
    {
      uint64_t v10 = [(SearchUICollectionViewController *)self resultsViewDelegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        uint64_t v12 = [(SearchUICollectionViewController *)self resultsViewDelegate];
        [v12 didChangeExpansionStateForSection:v9 expanded:v4];
      }
    }
    id v13 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v14 = [(SearchUICollectionViewController *)self dataSource];
    long long v15 = [v14 snapshot];
    long long v16 = objc_msgSend(v13, "indexPathForRow:inSection:", 0, objc_msgSend(v15, "indexOfSectionIdentifier:", v6));

    long long v17 = [(SearchUICollectionViewController *)self collectionView];
    long long v18 = [v17 cellForItemAtIndexPath:v16];

    if ([v18 isExpandable])
    {
      [v18 updateExpanded:v4 animated:1];
      [(SearchUICollectionViewController *)self updateTableForNewCellHeightAnimated:1];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v19 = [(SearchUICollectionViewController *)self tableModelForExpansion];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke;
      uint64_t v23 = &unk_1E6E73FB0;
      objc_copyWeak(&v26, &location);
      id v24 = v6;
      id v25 = v16;
      [(SearchUICollectionViewController *)self setTableModel:v19 animated:1 completion:&v20];

      [(SearchUICollectionViewController *)self didToggleExpansion];
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
}

void __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = [WeakRetained dataSource];
  BOOL v4 = [v3 snapshot];

  if ([v4 indexOfSectionIdentifier:*(void *)(a1 + 32)] != 0x7FFFFFFFFFFFFFFFLL
    && [v4 numberOfItemsInSection:*(void *)(a1 + 32)])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v5, objc_msgSend(*(id *)(a1 + 40), "section"));
      uint64_t v7 = [WeakRetained collectionView];
      id v8 = [v7 cellForItemAtIndexPath:v6];

      double v9 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke_2;
      v13[3] = &unk_1E6E72938;
      id v14 = v8;
      id v10 = v4;
      id v15 = v10;
      id v16 = v6;
      id v11 = v6;
      id v12 = v8;
      [v9 performWithoutAnimation:v13];

      ++v5;
    }
    while (v5 < [v10 numberOfItemsInSection:*(void *)(a1 + 32)]);
  }
}

void __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 40);
  id v7 = [v3 sectionIdentifiers];
  BOOL v4 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "section"));
  unint64_t v5 = [v3 itemIdentifiersInSectionWithIdentifier:v4];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "item"));
  [v2 updateWithRowModel:v6];
}

- (BOOL)isExpandedForSectionModel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [v5 collectionSection];

  if (v6)
  {
    id v7 = [(SearchUICollectionViewController *)self expandedCollectionSections];
    id v8 = [v4 section];
    uint64_t v9 = [v8 collectionSection];
LABEL_5:
    id v12 = (void *)v9;
    LOBYTE(v11) = [v7 containsObject:v9];

    goto LABEL_6;
  }
  id v10 = [v4 section];
  id v11 = [v10 resultSection];

  if (v11)
  {
    id v7 = [(SearchUICollectionViewController *)self expandedSections];
    id v8 = [v4 section];
    uint64_t v9 = [v8 resultSection];
    goto LABEL_5;
  }
LABEL_6:

  return (char)v11;
}

- (void)toggleExpansionForSectionModel:(id)a3
{
  id v12 = a3;
  id v4 = [v12 section];
  unint64_t v5 = [v4 collectionSection];

  if (v5)
  {
    id v6 = [v12 section];
    id v7 = [v6 collectionSection];

    id v8 = [(SearchUICollectionViewController *)self expandedCollectionSections];
    int v9 = [v8 containsObject:v7];

    id v10 = [(SearchUICollectionViewController *)self expandedCollectionSections];
    id v11 = v10;
    if (v9) {
      [v10 removeObject:v7];
    }
    else {
      [v10 addObject:v7];
    }

    [(SearchUICollectionViewController *)self performExpansion:v9 ^ 1u withSection:v12];
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(SearchUICollectionViewController *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  LOBYTE(v5) = [v7 isFocusable];
  return (char)v5;
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
    [v9 didUpdateKeyboardFocusToResult:v10 cardSection:v6];
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (-[SearchUICollectionViewController forwardFeedbackForSelector:](self, "forwardFeedbackForSelector:"))
  {
    id v5 = [(SearchUICollectionViewController *)self feedbackListener];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICollectionViewController;
    id v5 = [(SearchUICollectionViewController *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (void)lockupViewForAppIdentifier:(id)a3 didFailRequestWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_super v7 = [(SearchUICollectionViewController *)self feedbackListener];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(SearchUICollectionViewController *)self feedbackListener];
    [v9 lockupViewForAppIdentifier:v10 didFailRequestWithError:v6];
  }
}

- (void)lockupViewEngagedForAppIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = [(SearchUICollectionViewController *)self feedbackListener];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SearchUICollectionViewController *)self feedbackListener];
    [v6 lockupViewEngagedForAppIdentifier:v7];
  }
}

- (void)lockupViewForAppIdentifier:(id)a3 didChangeState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SearchUICollectionViewController *)self feedbackListener];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(SearchUICollectionViewController *)self feedbackListener];
    [v9 lockupViewForAppIdentifier:v10 didChangeState:v6];
  }
}

- (void)setViewWillUpdateHandler:(id)a3
{
}

- (void)setCardViewDelegate:(id)a3
{
}

- (BOOL)dragInteractionEnabled
{
  return self->_dragInteractionEnabled;
}

- (BOOL)inPreviewPlatter
{
  return self->_inPreviewPlatter;
}

- (NSIndexPath)focusableIndexPath
{
  return self->_focusableIndexPath;
}

- (void)setQueryString:(id)a3
{
}

- (Class)restorationContextClass
{
  return (Class)objc_getProperty(self, a2, 1176, 1);
}

- (void)setCollectionViewAnimating:(BOOL)a3
{
  self->_collectionViewAnimating = a3;
}

- (NSString)activeVoiceShortcutIdentifier
{
  return self->_activeVoiceShortcutIdentifier;
}

- (void)setActiveVoiceShortcutIdentifier:(id)a3
{
}

- (void)setActiveRunViewSource:(id)a3
{
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (TLKTableViewScrollTester)scrollTester
{
  return self->_scrollTester;
}

- (void)setScrollTester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollTester, 0);
  objc_storeStrong((id *)&self->_searchUIAttributes, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_activeRunViewSource, 0);
  objc_storeStrong((id *)&self->_activeVoiceShortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_latestVisibleSectionHeadersAccountedForInFeedback, 0);
  objc_storeStrong((id *)&self->_potentiallyVisibleHeaders, 0);
  objc_storeStrong((id *)&self->_latestVisibleCardSectionsAccountedForInFeedback, 0);
  objc_storeStrong((id *)&self->_latestVisibleResultsAccountedForInFeedback, 0);
  objc_storeStrong((id *)&self->_potentiallyVisibleCells, 0);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_peekDelegate, 0);
  objc_storeStrong((id *)&self->_restorationContextClass, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_expandedCollectionSections, 0);
  objc_storeStrong((id *)&self->_focusableIndexPath, 0);
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_destroyWeak((id *)&self->_resultsViewDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableModel, 0);
  objc_destroyWeak((id *)&self->_cardViewDelegate);
  objc_destroyWeak((id *)&self->_feedbackListener);
  objc_destroyWeak((id *)&self->_commandDelegate);
  objc_storeStrong(&self->viewDidUpdateHandler, 0);
  objc_storeStrong(&self->viewWillUpdateHandler, 0);
}

@end