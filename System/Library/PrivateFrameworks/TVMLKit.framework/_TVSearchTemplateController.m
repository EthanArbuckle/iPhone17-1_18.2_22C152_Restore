@interface _TVSearchTemplateController
- (BOOL)_isAtWordEnd;
- (BOOL)_searchBarContainsFocus;
- (IKViewElement)viewElement;
- (_TVSearchTemplateController)init;
- (id)_sanitizedText;
- (id)collectionView;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (void)_cancelImpressionsUpdate;
- (void)_keyboardDidChangeFrame:(id)a3;
- (void)_recordImpressionsForVisibleView;
- (void)_scrollToTopAnimated:(BOOL)a3;
- (void)_setNonResultsView:(id)a3;
- (void)_updateImpressions;
- (void)_updateKeyboardText;
- (void)_updateSearchFieldText;
- (void)dealloc;
- (void)loadView;
- (void)updateNavigationItem:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation _TVSearchTemplateController

- (_TVSearchTemplateController)init
{
  v14.receiver = self;
  v14.super_class = (Class)_TVSearchTemplateController;
  v2 = [(_TVSearchTemplateController *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TVStackCollectionViewController);
    resultsViewController = v2->_resultsViewController;
    v2->_resultsViewController = v3;

    [(_TVStackCollectionViewController *)v2->_resultsViewController setDelegate:v2];
    [(_TVStackCollectionViewController *)v2->_resultsViewController setDefinesPresentationContext:1];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F1C958]) initWithSearchResultsController:0];
    searchController = v2->_searchController;
    v2->_searchController = (UISearchController *)v5;

    [(UISearchController *)v2->_searchController setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)v2->_searchController setSearchResultsUpdater:v2];
    v7 = [(UISearchController *)v2->_searchController searchBar];
    [v7 setKeyboardType:0];
    [v7 setSearchBarStyle:2];
    [v7 setEnablesReturnKeyAutomatically:0];
    [v7 setCenterPlaceholder:0];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel__keyboardDidChangeFrame_ name:*MEMORY[0x263F1D408] object:0];

    uint64_t v9 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v9;

    [MEMORY[0x263F1C3D8] defaultSizeForStyle:100];
    -[UIActivityIndicatorView setFrame:](v2->_spinner, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v11, v12);
    [(UIActivityIndicatorView *)v2->_spinner startAnimating];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardText object:0];
  v4.receiver = self;
  v4.super_class = (Class)_TVSearchTemplateController;
  [(_TVBgImageLoadingViewController *)&v4 dealloc];
}

- (void)updateWithViewElement:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_TVSearchTemplateController;
  [(_TVBgImageLoadingViewController *)&v69 updateWithViewElement:v5];
  objc_storeStrong((id *)&self->_viewElement, a3);
  v6 = [v5 appDocument];
  [v6 impressionThreshold];
  self->_impressionThreshold = v7;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v64 = v5;
  v8 = [v5 children];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    double v12 = 0;
    v13 = 0;
    uint64_t v14 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "tv_elementType");
        if (v17 == 10)
        {
          id v19 = v16;

          double v12 = v19;
        }
        else if (v17 == 45)
        {
          id v18 = v16;

          v13 = v18;
        }
        else if (v13 && !v12 && !v11)
        {
          id v11 = v16;
          double v12 = 0;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
    double v12 = 0;
    v13 = 0;
  }

  p_searchFieldElement = &self->_searchFieldElement;
  objc_storeStrong((id *)&self->_searchFieldElement, v13);
  p_collectionListElement = &self->_collectionListElement;
  objc_storeStrong((id *)&self->_collectionListElement, v12);
  p_nonResultsElement = &self->_nonResultsElement;
  objc_storeStrong((id *)&self->_nonResultsElement, v11);
  ikKeyboard = self->_ikKeyboard;
  v24 = [(IKTextFieldElement *)self->_searchFieldElement keyboard];

  if (ikKeyboard != v24)
  {
    [(IKAppKeyboard *)self->_ikKeyboard setDelegate:0];
    v25 = [(IKTextFieldElement *)*p_searchFieldElement keyboard];
    v26 = self->_ikKeyboard;
    self->_ikKeyboard = v25;

    [(IKAppKeyboard *)self->_ikKeyboard setDelegate:self];
  }
  if (*p_nonResultsElement)
  {
    v27 = +[TVInterfaceFactory sharedInterfaceFactory];
    v28 = [v27 _viewFromElement:*p_nonResultsElement existingView:self->_nonResultsView];
    [(_TVSearchTemplateController *)self _setNonResultsView:v28];
  }
  else
  {
    [(_TVSearchTemplateController *)self _setNonResultsView:0];
  }
  if ([(_TVSearchTemplateController *)self _searchBarContainsFocus]
    && [(IKViewElement *)*p_collectionListElement updateType] != 2)
  {
    [(_TVStackCollectionViewController *)self->_resultsViewController resetLastFocusedIndexPath];
  }
  [(_TVStackCollectionViewController *)self->_resultsViewController updateWithViewElement:*p_collectionListElement];
  v29 = [(UISearchController *)self->_searchController searchBar];
  v30 = [(IKTextFieldElement *)*p_searchFieldElement text];
  v31 = [v30 string];
  [v29 setPlaceholder:v31];

  v32 = [(IKTextFieldElement *)*p_searchFieldElement style];
  objc_msgSend(v32, "tv_padding");
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  objc_msgSend(v29, "setContentInset:", v34, v36, v38, v40);
  v41 = [(IKTextFieldElement *)*p_searchFieldElement attributes];
  v42 = [v41 objectForKeyedSubscript:@"showSpinner"];
  int v43 = [v42 BOOLValue];

  if (v43)
  {
    if (!self->_originalSearchFieldRightView)
    {
      v44 = [v29 searchField];
      v45 = [v44 rightView];
      spinner = self->_spinner;

      if (v45 != spinner)
      {
        v47 = [v29 searchField];
        v48 = [v47 rightView];
        originalSearchFieldRightView = self->_originalSearchFieldRightView;
        self->_originalSearchFieldRightView = v48;

        v50 = [v29 searchField];
        self->_originalSearchFieldRightViewMode = [v50 rightViewMode];
      }
    }
    v51 = [v29 searchField];
    p_spinner = &self->_spinner;
    [v51 setRightView:self->_spinner];

    v53 = [v29 searchField];
    v54 = v53;
    uint64_t v55 = 3;
    goto LABEL_31;
  }
  v56 = [v29 searchField];
  v57 = [v56 rightView];
  p_spinner = &self->_spinner;
  v58 = self->_spinner;

  if (v57 == v58)
  {
    v60 = self->_originalSearchFieldRightView;
    v61 = [v29 searchField];
    v62 = v61;
    if (v60)
    {
      [v61 setRightView:self->_originalSearchFieldRightView];

      v63 = [v29 searchField];
      [v63 setRightViewMode:self->_originalSearchFieldRightViewMode];

      v54 = self->_originalSearchFieldRightView;
      self->_originalSearchFieldRightView = 0;
      goto LABEL_32;
    }
    [v61 setRightView:0];

    v53 = [v29 searchField];
    v54 = v53;
    uint64_t v55 = 0;
LABEL_31:
    [(UIView *)v53 setRightViewMode:v55];
LABEL_32:

    [(UIActivityIndicatorView *)*p_spinner setHidden:v43 ^ 1u];
  }
  if ([(_TVSearchTemplateController *)self isViewLoaded])
  {
    v59 = [(_TVSearchTemplateController *)self view];
    [v59 setNeedsLayout];
  }
  [(_TVSearchTemplateController *)self _updateImpressions];
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)_TVSearchTemplateController;
  [(_TVSearchTemplateController *)&v6 loadView];
  v3 = [(_TVSearchTemplateController *)self view];
  objc_super v4 = self->_resultsViewController;
  [(_TVSearchTemplateController *)self addChildViewController:v4];
  id v5 = [(_TVStackCollectionViewController *)v4 view];
  [v5 setAutoresizingMask:18];
  [v3 addSubview:v5];
  [(_TVStackCollectionViewController *)v4 didMoveToParentViewController:self];
  if (self->_nonResultsView) {
    objc_msgSend(v3, "addSubview:");
  }
  [(_TVSearchTemplateController *)self _updateSearchFieldText];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVSearchTemplateController;
  [(_TVBgImageLoadingViewController *)&v4 viewDidAppear:a3];
  [(_TVSearchTemplateController *)self _updateImpressions];
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_TVSearchTemplateController;
  [(_TVBgImageLoadingViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(_TVSearchTemplateController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(_TVStackCollectionViewController *)self->_resultsViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  [v12 setHidden:self->_nonResultsView != 0];
  [v3 safeAreaInsets];
  -[UIView setFrame:](self->_nonResultsView, "setFrame:", v5, v7 + v13, v9, v11 - (v13 + fmax(v11 - self->_keyboardFrame.origin.y, v14)));
}

- (void)updateNavigationItem:(id)a3
{
  searchController = self->_searchController;
  id v4 = a3;
  [v4 setSearchController:searchController];
  [v4 setHidesSearchBarWhenScrolling:0];
}

- (id)collectionView
{
  return (id)[(_TVStackCollectionViewController *)self->_resultsViewController collectionView];
}

- (void)_scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(_TVStackCollectionViewController *)self->_resultsViewController collectionView];
  [v8 adjustedContentInset];
  objc_msgSend(v8, "setContentOffset:animated:", v3, 0.0, -v5);
  double v6 = [v8 collectionViewLayout];
  [v8 bounds];
  double v7 = objc_msgSend(v6, "invalidationContextForBoundsChange:");
  [v6 invalidateLayoutWithContext:v7];

  [(_TVStackCollectionViewController *)self->_resultsViewController resetLastFocusedIndexPath];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardText object:0];
  if ([(_TVSearchTemplateController *)self _isAtWordEnd])
  {
    [(_TVSearchTemplateController *)self _updateKeyboardText];
  }
  else
  {
    [(_TVSearchTemplateController *)self performSelector:sel__updateKeyboardText withObject:0 afterDelay:0.5];
  }
}

- (void)_updateImpressions
{
  [(_TVSearchTemplateController *)self _cancelImpressionsUpdate];
  if (self->_impressionThreshold > 0.0)
  {
    -[_TVSearchTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
  }
}

- (void)_cancelImpressionsUpdate
{
}

- (void)_recordImpressionsForVisibleView
{
  if ([(_TVSearchTemplateController *)self isViewLoaded])
  {
    BOOL v3 = [(_TVSearchTemplateController *)self view];
    id v4 = [v3 window];

    if (v4)
    {
      id v6 = [(IKViewElement *)self->_viewElement appDocument];
      double v5 = -[_TVSearchTemplateController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
      if ([v5 count]) {
        [v6 recordImpressionsForViewElements:v5];
      }
    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(IKViewElement *)self->_viewElement appDocument];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    double v7 = [(_TVStackCollectionViewController *)self->_resultsViewController collectionView];
    id v8 = [v7 visibleCells];
    double v9 = [MEMORY[0x263EFF980] array];
    if ([(_TVSearchTemplateController *)self isViewLoaded])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_super v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "viewController", (void)v19);
            v16 = objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
            [v9 addObjectsFromArray:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
    }
    if (objc_msgSend(v9, "count", (void)v19))
    {
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (void)_updateSearchFieldText
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardText object:0];
  id v4 = [(UISearchController *)self->_searchController searchBar];
  BOOL v3 = [(IKAppKeyboard *)self->_ikKeyboard text];
  [v4 setText:v3];
}

- (void)_updateKeyboardText
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardText object:0];
  BOOL v3 = [(UISearchController *)self->_searchController searchBar];
  uint64_t v4 = [v3 _textInputSource];

  double v5 = @"dictation";
  if (v4 != 2) {
    double v5 = 0;
  }
  if (v4 == 1) {
    int v6 = @"keyboard";
  }
  else {
    int v6 = v5;
  }
  [(IKAppKeyboard *)self->_ikKeyboard _setSource:v6];
  id v7 = [(_TVSearchTemplateController *)self _sanitizedText];
  [(IKAppKeyboard *)self->_ikKeyboard setText:v7];
}

- (BOOL)_isAtWordEnd
{
  if (_isAtWordEnd_onceToken != -1) {
    dispatch_once(&_isAtWordEnd_onceToken, &__block_literal_global_31);
  }
  BOOL v3 = [(_TVSearchTemplateController *)self _sanitizedText];
  uint64_t v4 = [v3 length];
  if (v4) {
    char v5 = objc_msgSend((id)_isAtWordEnd_wordDelimiters, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v4 - 1));
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)_sanitizedText
{
  __int16 v7 = -4;
  v2 = [(UISearchController *)self->_searchController searchBar];
  BOOL v3 = [v2 text];

  uint64_t v4 = [NSString stringWithCharacters:&v7 length:1];
  char v5 = [v3 stringByReplacingOccurrencesOfString:v4 withString:&stru_26E5657A8];

  return v5;
}

- (BOOL)_searchBarContainsFocus
{
  if ([(_TVSearchTemplateController *)self isViewLoaded])
  {
    BOOL v3 = [MEMORY[0x263F1C920] mainScreen];
    uint64_t v4 = [v3 focusedView];

    char v5 = [(_TVSearchTemplateController *)self view];
    if ([v4 isDescendantOfView:v5])
    {
      int v6 = [(_TVStackCollectionViewController *)self->_resultsViewController view];
      int v7 = [v4 isDescendantOfView:v6] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_setNonResultsView:(id)a3
{
  id v7 = a3;
  p_nonResultsView = &self->_nonResultsView;
  [(UIView *)self->_nonResultsView removeFromSuperview];
  objc_storeStrong((id *)&self->_nonResultsView, a3);
  if ([(_TVSearchTemplateController *)self isViewLoaded] && *p_nonResultsView)
  {
    int v6 = [(_TVSearchTemplateController *)self view];
    [v6 addSubview:*p_nonResultsView];
  }
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  p_keyboardFrame = &self->_keyboardFrame;
  char v5 = [a3 userInfo];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
  [v6 CGRectValue];
  p_keyboardFrame->origin.x = v7;
  p_keyboardFrame->origin.y = v8;
  p_keyboardFrame->size.width = v9;
  p_keyboardFrame->size.height = v10;

  if ([(_TVSearchTemplateController *)self isViewLoaded] && self->_nonResultsView)
  {
    id v11 = [(_TVSearchTemplateController *)self view];
    [v11 setNeedsLayout];
  }
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSearchFieldRightView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_nonResultsView, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_nonResultsElement, 0);
  objc_storeStrong((id *)&self->_collectionListElement, 0);
  objc_storeStrong((id *)&self->_ikKeyboard, 0);
  objc_storeStrong((id *)&self->_searchFieldElement, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end