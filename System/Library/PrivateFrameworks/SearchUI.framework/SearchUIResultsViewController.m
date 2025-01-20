@interface SearchUIResultsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)dragInteractionEnabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)immediatelyShowCardForSingleResult;
- (BOOL)scrollEnabled;
- (BOOL)shouldHideResultsUnderKeyboard;
- (BOOL)shouldMonitorScrollingPastBottomOfContent;
- (BOOL)shouldUseInsetRoundedSections;
- (BOOL)shouldUseStandardSectionInsets;
- (BOOL)showsVerticalScrollIndicator;
- (CGRect)scrollToIndexPath:(id)a3;
- (CGSize)contentSize;
- (Class)restorationContextClass;
- (NSArray)sections;
- (NSString)previousSearchString;
- (NSString)queryString;
- (SFFeedbackListener)feedbackListener;
- (SearchUICommandDelegate)commandDelegate;
- (SearchUIResultsCollectionViewController)resultsTableViewController;
- (SearchUIResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SearchUIResultsViewDelegate)delegate;
- (UISearchTextField)searchField;
- (UIView)footerView;
- (double)additionalKeyboardHeight;
- (double)contentHeightForWidth:(double)a3 maxHeight:(double)a4;
- (double)distanceToTopOfAppIcons;
- (id)contentScrollView;
- (id)restorationContext;
- (id)viewDidUpdateHandler;
- (id)viewWillUpdateHandler;
- (int64_t)numberOfSections;
- (unint64_t)style;
- (void)contentSizeDidChange:(CGSize)a3 animated:(BOOL)a4;
- (void)didBeginScrolling;
- (void)didFocusOnCell:(id)a3;
- (void)didPresentToResumeSearch:(BOOL)a3;
- (void)didScrollPastBottomOfContent;
- (void)didTap;
- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4;
- (void)highlightResult:(id)a3;
- (void)iterateIndexPaths:(id)a3;
- (void)performRecapScrollTestWithTestName:(id)a3 completion:(id)a4;
- (void)performReturnKeyPressAction;
- (void)performScrollTestWithCompletion:(id)a3;
- (void)performScrollTestWithHandlerForFirstScrollCompletion:(id)a3 completion:(id)a4;
- (void)purgeMemory;
- (void)replaceResult:(id)a3 withResult:(id)a4;
- (void)restoreResultsIfNeeded;
- (void)scrollAndSelectLastSelectedIndexPath;
- (void)setAdditionalKeyboardHeight:(double)a3;
- (void)setCommandDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragInteractionEnabled:(BOOL)a3;
- (void)setFeedbackListener:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setImmediatelyShowCardForSingleResult:(BOOL)a3;
- (void)setPreviousSearchString:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setRestorationContext:(id)a3;
- (void)setRestorationContextClass:(Class)a3;
- (void)setResultsTableViewController:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSearchField:(id)a3;
- (void)setSections:(id)a3;
- (void)setShouldHideResultsUnderKeyboard:(BOOL)a3;
- (void)setShouldMonitorScrollingPastBottomOfContent:(BOOL)a3;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
- (void)setShouldUseStandardSectionInsets:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setViewDidUpdateHandler:(id)a3;
- (void)setViewWillUpdateHandler:(id)a3;
- (void)tapAtIndexPath:(id)a3;
- (void)toggleShowMoreForSection:(unint64_t)a3;
- (void)updateWithResultSections:(id)a3;
- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4;
- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4 animated:(BOOL)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)willDismiss;
@end

@implementation SearchUIResultsViewController

- (id)contentScrollView
{
  v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  v3 = [v2 majorScrollView];

  return v3;
}

- (SearchUIResultsCollectionViewController)resultsTableViewController
{
  return self->_resultsTableViewController;
}

- (NSArray)sections
{
  return self->_sections;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)footerView
{
  v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  v3 = [v2 footerView];

  return (UIView *)v3;
}

- (double)distanceToTopOfAppIcons
{
  v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 headerHeight];
  double v4 = v3;
  +[SearchUITableViewCell distanceToTopOfAppIconsForMultiResultCell];
  double v6 = v4 + v5;

  return v6;
}

- (void)didPresentToResumeSearch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 didPresentToResumeSearch:v3];
}

- (void)setCommandDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setCommandDelegate:v4];
}

void __65__SearchUIResultsViewController_setShowsVerticalScrollIndicator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  BOOL v3 = [v2 window];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) resultsTableViewController];
    id v4 = [v5 majorScrollView];
    [v4 flashScrollIndicators];
  }
}

- (UISearchTextField)searchField
{
  v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  BOOL v3 = [v2 textField];

  return (UISearchTextField *)v3;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)SearchUIResultsViewController;
  [(SearchUIResultsViewController *)&v23 viewDidLayoutSubviews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = [(SearchUIResultsViewController *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        v9 = [(SearchUIResultsViewController *)self view];
        [v9 bounds];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        v18 = [v8 view];
        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (SearchUIResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SearchUIResultsViewController;
  uint64_t v4 = [(SearchUIResultsViewController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    [(SearchUIResultsViewController *)v4 setView:v5];

    uint64_t v6 = objc_opt_new();
    [v6 setInteractionDelegate:v4];
    [v6 setSizingDelegate:v4];
    [(SearchUIResultsViewController *)v4 addChildViewController:v6];
    uint64_t v7 = [(SearchUIResultsViewController *)v4 view];
    v8 = [v6 view];
    [v7 addSubview:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_didTap];
    [v9 setDelegate:v4];
    double v10 = [v6 view];
    [v10 addGestureRecognizer:v9];

    double v11 = [v6 majorScrollView];
    double v12 = [v11 panGestureRecognizer];
    [v9 requireGestureRecognizerToFail:v12];

    [(SearchUIResultsViewController *)v4 setResultsTableViewController:v6];
  }
  return v4;
}

- (void)setResultsTableViewController:(id)a3
{
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SearchUIResultsViewController *)self view];
  [v5 setShouldUseInsetRoundedSections:v3];

  uint64_t v6 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v6 setShouldUseInsetRoundedSections:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(SearchUIResultsViewController *)self navigationController];
  v8 = [v7 viewControllers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        double v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 setShouldUseInsetRoundedSections:v3];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)contentSizeDidChange:(CGSize)a3 animated:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = [(SearchUIResultsViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__SearchUIResultsViewController_contentSizeDidChange_animated___block_invoke;
    v10[3] = &unk_1E6E743F0;
    v10[4] = self;
    *(CGFloat *)&v10[5] = width;
    *(CGFloat *)&v10[6] = height;
    BOOL v11 = a4;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

- (void)setRestorationContextClass:(Class)a3
{
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 setRestorationContextClass:a3];
}

- (void)setAdditionalKeyboardHeight:(double)a3
{
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 setAdditionalKeyboardHeight:a3];
}

- (void)setFeedbackListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setFeedbackListener:v4];
}

- (void)setSearchField:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setTextField:v4];
}

- (void)highlightResult:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 highlightResult:v4];
}

void __63__SearchUIResultsViewController_contentSizeDidChange_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "resultsViewController:didChangeContentSize:animated:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(SearchUIResultsViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(SearchUIResultsViewController *)self delegate];
    [v9 didUpdateKeyboardFocusToResult:v10 cardSection:v6];
  }
}

- (SearchUIResultsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIResultsViewDelegate *)WeakRetained;
}

- (void)setViewDidUpdateHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setViewDidUpdateHandler:v4];
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  id v6 = [v5 majorScrollView];
  [v6 setShowsVerticalScrollIndicator:v3];

  if (v3)
  {
    dispatch_time_t v7 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SearchUIResultsViewController_setShowsVerticalScrollIndicator___block_invoke;
    block[3] = &unk_1E6E72730;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  objc_storeStrong((id *)&self->_sections, a3);
  id v9 = a3;
  id v10 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v10 updateWithResultSections:v9 scrollToTop:v6 animated:v5];
}

- (void)setFooterView:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setFooterView:v4];
}

- (void)setShouldMonitorScrollingPastBottomOfContent:(BOOL)a3
{
  self->_shouldMonitorScrollingPastBottomOfContent = a3;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
    [v5 setResultsViewDelegate:obj];
  }
}

- (void)restoreResultsIfNeeded
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 restoreResultsIfNeeded];
}

- (double)additionalKeyboardHeight
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 additionalKeyboardHeight];
  double v4 = v3;

  return v4;
}

- (void)didScrollPastBottomOfContent
{
  double v3 = [(SearchUIResultsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SearchUIResultsViewController *)self delegate];
    [v5 didScrollPastBottomOfContent];
  }
}

- (void)didBeginScrolling
{
  double v3 = [(SearchUIResultsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SearchUIResultsViewController *)self delegate];
    [v5 didBeginScrollingResults];
  }
}

- (void)didFocusOnCell:(id)a3
{
  id v4 = a3;
  id v6 = [v4 keyboardResultForFocus];
  id v5 = [v4 keyboardCardSectionForFocus];

  [(SearchUIResultsViewController *)self didUpdateKeyboardFocusToResult:v6 cardSection:v5];
}

- (void)replaceResult:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v8 replaceResult:v7 withResult:v6];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  id v6 = [v5 majorScrollView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  BOOL v11 = [(SearchUIResultsViewController *)self resultsTableViewController];
  uint64_t v12 = [v11 majorScrollView];
  [v12 contentSize];
  char v14 = v10 > v13;

  long long v15 = [(SearchUIResultsViewController *)self resultsTableViewController];
  long long v16 = [v15 majorScrollView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v18 = [(SearchUIResultsViewController *)self resultsTableViewController];
    uint64_t v19 = [v18 majorScrollView];

    [v19 contentSize];
    double v21 = v20;
    [v19 sectionFooterHeight];
    if (v10 <= v21 - v22)
    {
      objc_super v23 = objc_msgSend(v19, "indexPathForRowAtPoint:", v8, v10);
      if (v23)
      {
        v24 = [v19 cellForRowAtIndexPath:v23];
        char v14 = [v24 isHidden];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 1;
    }
  }
  return v14;
}

- (void)didTap
{
  double v3 = [(SearchUIResultsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SearchUIResultsViewController *)self delegate];
    [v5 didTapInEmptyRegion];
  }
}

- (SFFeedbackListener)feedbackListener
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  double v3 = [v2 feedbackListener];

  return (SFFeedbackListener *)v3;
}

- (SearchUICommandDelegate)commandDelegate
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  double v3 = [v2 commandDelegate];

  return (SearchUICommandDelegate *)v3;
}

- (void)setShouldHideResultsUnderKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 setShouldHideTableCellsUnderKeyboard:v3];
}

- (BOOL)shouldHideResultsUnderKeyboard
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  char v3 = [v2 shouldHideTableCellsUnderKeyboard];

  return v3;
}

- (BOOL)shouldUseInsetRoundedSections
{
  id v2 = [(SearchUIResultsViewController *)self view];
  char v3 = [v2 shouldUseInsetRoundedSections];

  return v3;
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 setDragInteractionEnabled:v3];
}

- (BOOL)dragInteractionEnabled
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  char v3 = [v2 dragInteractionEnabled];

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  id v4 = [v5 majorScrollView];
  [v4 setScrollEnabled:v3];
}

- (BOOL)scrollEnabled
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  BOOL v3 = [v2 majorScrollView];
  char v4 = [v3 isScrollEnabled];

  return v4;
}

- (BOOL)showsVerticalScrollIndicator
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  BOOL v3 = [v2 majorScrollView];
  char v4 = [v3 showsVerticalScrollIndicator];

  return v4;
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 setShouldUseStandardSectionInsets:v3];
}

- (BOOL)shouldUseStandardSectionInsets
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  char v3 = [v2 shouldUseStandardSectionInsets];

  return v3;
}

- (void)updateWithResultSections:(id)a3
{
}

- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4
{
}

- (NSString)queryString
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  char v3 = [v2 queryString];

  return (NSString *)v3;
}

- (void)setQueryString:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setQueryString:v4];
}

- (void)setSections:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SearchUIResultsViewController *)self updateWithResultSections:v4];
  if ([(SearchUIResultsViewController *)self immediatelyShowCardForSingleResult])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (!v6)
    {
      double v8 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v7 = v6;
    v36 = self;
    id v37 = v4;
    double v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        double v13 = [v12 bundleIdentifier];
        char v14 = [v13 hasPrefix:@"com.apple.lookup."];

        if ((v14 & 1) == 0)
        {
          long long v15 = [v12 results];
          v9 += [v15 count];

          if (v9 > 1)
          {
            id v4 = v37;
            goto LABEL_31;
          }
          if (v9 == 1)
          {
            id v16 = v12;

            double v8 = v16;
            uint64_t v9 = 1;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    id v4 = v37;
    if (v8)
    {
      long long v17 = [v8 results];
      v18 = [v17 firstObject];
      id v5 = +[SearchUITableModel tableModelWithResult:v18];

      uint64_t v35 = [v5 numberOfSections];
      if (v35 >= 1)
      {
        uint64_t v19 = 0;
        double v20 = 0;
        do
        {
          uint64_t v21 = [v5 numberOfRowsForSection:v19];
          if (v21 >= 1)
          {
            uint64_t v22 = v21;
            for (uint64_t j = 0; j != v22; ++j)
            {
              v24 = [MEMORY[0x1E4F28D58] indexPathForRow:j inSection:v19];
              uint64_t v25 = [v5 rowModelForIndexPath:v24];
              v26 = [v25 nextCard];

              if (v26) {
                BOOL v27 = v26 == v20;
              }
              else {
                BOOL v27 = 1;
              }
              if (!v27)
              {
                v28 = v20;
                if (v20) {
                  goto LABEL_28;
                }
                double v20 = v26;
              }
            }
          }
          ++v19;
        }
        while (v19 != v35);
        if (v20)
        {
          v29 = [SearchUICardViewController alloc];
          v30 = [(SearchUIResultsViewController *)v36 feedbackListener];
          v26 = [(SearchUICardViewController *)v29 initWithCard:v20 feedbackListener:v30];

          [(SearchUIResultsViewController *)v36 addChildViewController:v26];
          v31 = [(SearchUIResultsViewController *)v36 view];
          v32 = [(SearchUICardViewController *)v26 view];
          [v31 addSubview:v32];

          v33 = [(SearchUIResultsViewController *)v36 resultsTableViewController];
          v34 = [v33 view];
          [v34 setHidden:1];

          v28 = v20;
          id v4 = v37;
LABEL_28:
        }
      }
      goto LABEL_31;
    }
  }
LABEL_32:
}

- (double)contentHeightForWidth:(double)a3 maxHeight:(double)a4
{
  return 0.0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIResultsViewController;
  [(SearchUIResultsViewController *)&v5 viewDidDisappear:a3];
  if ([(SearchUIResultsViewController *)self shouldMonitorScrollingPastBottomOfContent])
  {
    id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
    [v4 scrollTableToTop];
  }
}

- (CGSize)contentSize
{
  char v3 = [(SearchUIResultsViewController *)self resultsTableViewController];
  id v4 = [v3 collectionView];
  objc_super v5 = [v4 collectionViewLayout];
  [v5 collectionViewContentSize];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(SearchUIResultsViewController *)self resultsTableViewController];
  BOOL v11 = [v10 tableModel];
  uint64_t v12 = [v11 numberOfSections];

  if (v12)
  {
    if (v7 == *MEMORY[0x1E4F1DB30] && v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      char v14 = [(SearchUIResultsViewController *)self view];
      [v14 frame];
      double v7 = v15;

      double v9 = 44.0;
    }
  }
  double v16 = v7;
  double v17 = v9;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)setViewWillUpdateHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setViewWillUpdateHandler:v4];
}

- (void)iterateIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 iterateIndexPaths:v4];
}

- (void)performScrollTestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 performScrollTestWithCompletion:v4];
}

- (int64_t)numberOfSections
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (void)performScrollTestWithHandlerForFirstScrollCompletion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v8 performScrollTestWithHandlerForFirstScrollCompletion:v7 completion:v6];
}

- (void)performRecapScrollTestWithTestName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v8 performRecapScrollTestWithTestName:v7 completion:v6];
}

- (void)tapAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 tapAtIndexPath:v4];
}

- (CGRect)scrollToIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 scrollToIndexPath:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)toggleShowMoreForSection:(unint64_t)a3
{
  id v4 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v4 toggleShowMoreForSection:a3];
}

- (void)purgeMemory
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 purgeMemory];
}

- (void)performReturnKeyPressAction
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 returnKeyPressed];
}

- (void)willDismiss
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 willDismiss];
}

- (void)scrollAndSelectLastSelectedIndexPath
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v2 scrollAndSelectLastSelectedIndexPath];
}

- (void)setRestorationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIResultsViewController *)self resultsTableViewController];
  [v5 setRestorationContext:v4];
}

- (id)restorationContext
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  int64_t v3 = [v2 restorationContext];

  return v3;
}

- (Class)restorationContextClass
{
  id v2 = [(SearchUIResultsViewController *)self resultsTableViewController];
  int64_t v3 = [v2 restorationContextClass];

  return (Class)v3;
}

- (id)viewDidUpdateHandler
{
  return self->viewDidUpdateHandler;
}

- (id)viewWillUpdateHandler
{
  return self->viewWillUpdateHandler;
}

- (BOOL)immediatelyShowCardForSingleResult
{
  return self->_immediatelyShowCardForSingleResult;
}

- (void)setImmediatelyShowCardForSingleResult:(BOOL)a3
{
  self->_immediatelyShowCardForSingleResult = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)previousSearchString
{
  return self->_previousSearchString;
}

- (void)setPreviousSearchString:(id)a3
{
}

- (BOOL)shouldMonitorScrollingPastBottomOfContent
{
  return self->_shouldMonitorScrollingPastBottomOfContent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousSearchString, 0);
  objc_storeStrong((id *)&self->_resultsTableViewController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong(&self->viewWillUpdateHandler, 0);
  objc_storeStrong(&self->viewDidUpdateHandler, 0);
}

@end