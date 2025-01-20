@interface SKUITrendingSearchDocumentViewController
- (SKUITrendingSearchDocumentViewController)initWithTemplateElement:(id)a3;
- (SKUITrendingSearchTemplateElement)template;
- (SKUITrendingSearchView)resultsView;
- (UIEdgeInsets)_resultsViewContentInset;
- (UIViewController)privacyViewController;
- (id)impressionableViewElements;
- (void)_reloadResultsView;
- (void)documentDidUpdate:(id)a3;
- (void)loadView;
- (void)resultsViewTapRecognized:(id)a3;
- (void)searchResultButtonTapped:(id)a3;
- (void)setPrivacyViewController:(id)a3;
- (void)setResultsView:(id)a3;
- (void)setTemplate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SKUITrendingSearchDocumentViewController

- (SKUITrendingSearchDocumentViewController)initWithTemplateElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrendingSearchDocumentViewController initWithTemplateElement:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUITrendingSearchDocumentViewController;
  v5 = [(SKUITrendingSearchDocumentViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SKUITrendingSearchDocumentViewController *)v5 setTemplate:v4];
  }

  return v6;
}

- (void)documentDidUpdate:(id)a3
{
  id v4 = [a3 templateElement];
  [(SKUITrendingSearchDocumentViewController *)self setTemplate:v4];

  [(SKUITrendingSearchDocumentViewController *)self _reloadResultsView];
}

- (id)impressionableViewElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)loadView
{
  [(SKUITrendingSearchDocumentViewController *)self _reloadResultsView];
  id v3 = [(SKUITrendingSearchDocumentViewController *)self resultsView];
  [(SKUITrendingSearchDocumentViewController *)self setView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKUITrendingSearchDocumentViewController;
  [(SKUITrendingSearchDocumentViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillLayoutSubviews
{
  objc_super v3 = [(SKUITrendingSearchDocumentViewController *)self resultsView];
  [(SKUITrendingSearchDocumentViewController *)self _resultsViewContentInset];
  objc_msgSend(v3, "setLayoutMargins:");

  v4.receiver = self;
  v4.super_class = (Class)SKUITrendingSearchDocumentViewController;
  [(SKUITrendingSearchDocumentViewController *)&v4 viewWillLayoutSubviews];
}

- (SKUITrendingSearchView)resultsView
{
  resultsView = self->_resultsView;
  if (resultsView)
  {
    objc_super v3 = resultsView;
  }
  else
  {
    v5 = objc_alloc_init(SKUITrendingSearchView);
    v6 = self->_resultsView;
    self->_resultsView = v5;

    v7 = self->_resultsView;
    objc_super v8 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
    [(SKUITrendingSearchView *)v7 setBackgroundColor:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_resultsViewTapRecognized_];
    [(SKUITrendingSearchView *)self->_resultsView addGestureRecognizer:v9];
    objc_super v3 = self->_resultsView;
  }

  return v3;
}

- (void)resultsViewTapRecognized:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 sendAction:sel_resignFirstResponder to:0 from:0 forEvent:0];
}

- (void)searchResultButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = [(SKUITrendingSearchDocumentViewController *)self template];
  id v10 = [v5 buttons];

  v6 = [(SKUITrendingSearchDocumentViewController *)self resultsView];
  v7 = [v6 trendingSearchViews];
  unint64_t v8 = [v7 indexOfObjectIdenticalTo:v4];

  if (v8 < [v10 count])
  {
    v9 = [v10 objectAtIndex:v8];
    [v9 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)_reloadResultsView
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(SKUITrendingSearchDocumentViewController *)self template];
  uint64_t v4 = [v3 titleLabel];

  v18 = (void *)v4;
  v5 = objc_msgSend(MEMORY[0x1E4FB1930], "SKUITrending_titleLabelWithElement:", v4);
  v6 = [(SKUITrendingSearchDocumentViewController *)self resultsView];
  [v6 setTrendingTitleView:v5];

  v7 = [(SKUITrendingSearchDocumentViewController *)self template];
  unint64_t v8 = [v7 buttons];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
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
        v15 = objc_msgSend(MEMORY[0x1E4FB14D0], "SKUITrending_searchButtonWithElement:", *(void *)(*((void *)&v19 + 1) + 8 * i));
        [v15 addTarget:self action:sel_searchResultButtonTapped_ forControlEvents:64];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v16 = [(SKUITrendingSearchDocumentViewController *)self resultsView];
  [v16 setTrendingSearchViews:v9];

  v17 = [(SKUITrendingSearchDocumentViewController *)self resultsView];
  [(SKUITrendingSearchDocumentViewController *)self _resultsViewContentInset];
  objc_msgSend(v17, "setLayoutMargins:");
}

- (UIEdgeInsets)_resultsViewContentInset
{
  double v2 = 50.0;
  double v3 = 40.0;
  double v4 = 50.0;
  double v5 = 40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setResultsView:(id)a3
{
}

- (SKUITrendingSearchTemplateElement)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
}

- (UIViewController)privacyViewController
{
  return self->_privacyViewController;
}

- (void)setPrivacyViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyViewController, 0);
  objc_storeStrong((id *)&self->_template, 0);

  objc_storeStrong((id *)&self->_resultsView, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITrendingSearchDocumentViewController initWithTemplateElement:]";
}

@end