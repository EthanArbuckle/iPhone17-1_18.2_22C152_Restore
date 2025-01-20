@interface VKVisualSearchViewController
- (BOOL)didShowResults;
- (NSArray)visualSearchResultItems;
- (UIActivityIndicatorView)loadingIndicator;
- (VKCVisualSearchResult)visualSearchResult;
- (VKVisualSearchViewController)initWithImage:(CGImage *)a3;
- (VKVisualSearchViewController)initWithVisualSearchResultItems:(id)a3;
- (VKVisualSearchViewControllerDelegate)delegate;
- (id)_resultSectionsForRecognitionResult:(id)a3;
- (id)_resultSectionsForRecognitionResultItems:(id)a3;
- (void)_showVisualSearchViewController;
- (void)presentSearchViewControllerForSections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidShowResults:(BOOL)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setVisualSearchResult:(id)a3;
- (void)setVisualSearchResultItems:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation VKVisualSearchViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)VKVisualSearchViewController;
  [(VKVisualSearchViewController *)&v9 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(VKVisualSearchViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  [(UIActivityIndicatorView *)self->_loadingIndicator setHidden:1];
  v7 = [(VKVisualSearchViewController *)self view];
  [v7 bounds];
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicator, "setFrame:");

  [(UIActivityIndicatorView *)self->_loadingIndicator setHidesWhenStopped:1];
  v8 = [(VKVisualSearchViewController *)self view];
  [v8 addSubview:self->_loadingIndicator];
}

- (VKVisualSearchViewController)initWithImage:(CGImage *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKVisualSearchViewController;
  result = [(VKVisualSearchViewController *)&v4 init];
  if (result) {
    result->_didShowResults = 0;
  }
  return result;
}

- (VKVisualSearchViewController)initWithVisualSearchResultItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKVisualSearchViewController;
  v5 = [(VKVisualSearchViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(VKVisualSearchViewController *)v5 setVisualSearchResultItems:v4];
    v6->_didShowResults = 0;
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKVisualSearchViewController;
  [(VKVisualSearchViewController *)&v6 viewWillAppear:a3];
  id v4 = [(VKVisualSearchViewController *)self visualSearchResult];
  if (v4)
  {
  }
  else
  {
    v5 = [(VKVisualSearchViewController *)self visualSearchResultItems];

    if (!v5)
    {
      [(UIActivityIndicatorView *)self->_loadingIndicator setHidden:0];
      [(UIActivityIndicatorView *)self->_loadingIndicator startAnimating];
      return;
    }
  }
  [(VKVisualSearchViewController *)self _showVisualSearchViewController];
}

- (void)setVisualSearchResultItems:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchResultItems, a3);
  id v5 = a3;
  [(UIActivityIndicatorView *)self->_loadingIndicator setHidden:1];
  [(UIActivityIndicatorView *)self->_loadingIndicator stopAnimating];

  [(VKVisualSearchViewController *)self _showVisualSearchViewController];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VKVisualSearchViewController;
  [(VKVisualSearchViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(VKVisualSearchViewController *)self view];
  [v3 bounds];
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicator, "setFrame:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKVisualSearchViewController;
  [(VKVisualSearchViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(VKVisualSearchViewController *)self delegate];
  [v4 didDismissViewController];
}

- (void)_showVisualSearchViewController
{
  v3 = [(VKVisualSearchViewController *)self visualSearchResult];

  if (v3)
  {
    objc_super v4 = [(VKVisualSearchViewController *)self visualSearchResult];
    uint64_t v5 = [(VKVisualSearchViewController *)self _resultSectionsForRecognitionResult:v4];
LABEL_6:
    id v10 = (id)v5;

    goto LABEL_8;
  }
  uint64_t v6 = [(VKVisualSearchViewController *)self visualSearchResultItems];
  if (v6)
  {
    v7 = (void *)v6;
    objc_super v8 = [(VKVisualSearchViewController *)self visualSearchResultItems];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      objc_super v4 = [(VKVisualSearchViewController *)self visualSearchResultItems];
      uint64_t v5 = [(VKVisualSearchViewController *)self _resultSectionsForRecognitionResultItems:v4];
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_8:
  [(VKVisualSearchViewController *)self presentSearchViewControllerForSections:v10];
}

- (void)presentSearchViewControllerForSections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_didShowResults)
  {
    if ([v4 count])
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      uint64_t v6 = (void *)getSearchUIResultsViewControllerClass_softClass;
      uint64_t v23 = getSearchUIResultsViewControllerClass_softClass;
      if (!getSearchUIResultsViewControllerClass_softClass)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __getSearchUIResultsViewControllerClass_block_invoke;
        v19[3] = &unk_1E6BF0A90;
        v19[4] = &v20;
        __getSearchUIResultsViewControllerClass_block_invoke((uint64_t)v19);
        uint64_t v6 = (void *)v21[3];
      }
      v7 = v6;
      _Block_object_dispose(&v20, 8);
      id v8 = objc_alloc_init(v7);
      [v8 setSections:v5];
      [v8 setShouldUseInsetRoundedSections:1];
      [v8 setShouldUseStandardSectionInsets:1];
      [(VKVisualSearchViewController *)self addChildViewController:v8];
      [v8 didMoveToParentViewController:self];
      uint64_t v9 = [v8 view];
      id v10 = [(VKVisualSearchViewController *)self view];
      [v10 bounds];
      double v12 = v11;
      v13 = [(VKVisualSearchViewController *)self view];
      [v13 bounds];
      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v12);

      v14 = [(VKVisualSearchViewController *)self view];
      v15 = [v8 view];
      [v14 addSubview:v15];
    }
    else
    {
      id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
      v16 = VKBundle();
      v17 = [v16 localizedStringForKey:@"VK_VISUAL_SEARCH_NO_RESULTS_MESSAGE" value:@"VK_VISUAL_SEARCH_NO_RESULTS_MESSAGE" table:@"Localizable"];
      [v8 setText:v17];

      v18 = [(VKVisualSearchViewController *)self view];
      [v18 center];
      objc_msgSend(v8, "setCenter:");

      [v8 setTextAlignment:1];
      v14 = [(VKVisualSearchViewController *)self view];
      [v14 addSubview:v8];
    }

    self->_didShowResults = 1;
  }
}

- (id)_resultSectionsForRecognitionResult:(id)a3
{
  id v4 = [a3 resultItems];
  uint64_t v5 = [(VKVisualSearchViewController *)self _resultSectionsForRecognitionResultItems:v4];

  return v5;
}

- (id)_resultSectionsForRecognitionResultItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "searchItem", (void)v14);
        double v11 = [v10 searchSections];

        if (v11) {
          [v4 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  double v12 = (void *)[v4 copy];
  return v12;
}

- (VKVisualSearchViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKVisualSearchViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)visualSearchResultItems
{
  return self->_visualSearchResultItems;
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (void)setVisualSearchResult:(id)a3
{
}

- (BOOL)didShowResults
{
  return self->_didShowResults;
}

- (void)setDidShowResults:(BOOL)a3
{
  self->_didShowResults = a3;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
  objc_storeStrong((id *)&self->_visualSearchResultItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end