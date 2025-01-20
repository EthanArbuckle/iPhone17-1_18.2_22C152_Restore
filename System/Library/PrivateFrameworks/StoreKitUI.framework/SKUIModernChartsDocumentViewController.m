@interface SKUIModernChartsDocumentViewController
- (CGRect)_computedFrameForActivityIndicatorView;
- (SKUIModernChartsDocumentViewController)initWithTemplateElement:(id)a3;
- (UIEdgeInsets)_contentInset;
- (id)_layoutCache;
- (id)_newColumnViewControllersWithReusableViewControllers:(id)a3;
- (id)_resourceLoader;
- (id)_viewLayoutContext;
- (id)contentScrollView;
- (void)_hideActivityIndicator;
- (void)_reloadWithTemplateElement:(id)a3;
- (void)_showActivityIndicator;
- (void)documentDidUpdate:(id)a3;
- (void)documentMediaQueriesDidUpdate:(id)a3;
- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4;
- (void)loadView;
- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4;
- (void)resourceLoaderDidBeginLoading:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SKUIModernChartsDocumentViewController

- (SKUIModernChartsDocumentViewController)initWithTemplateElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIModernChartsDocumentViewController initWithTemplateElement:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIModernChartsDocumentViewController;
  v5 = [(SKUIModernChartsDocumentViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SKUIModernChartsDocumentViewController *)v5 _reloadWithTemplateElement:v4];
  }

  return v6;
}

- (void)documentDidUpdate:(id)a3
{
  id v4 = [a3 templateElement];
  -[SKUIModernChartsDocumentViewController _reloadWithTemplateElement:](self, "_reloadWithTemplateElement:");
  if ([(SKUIResourceLoader *)self->_resourceLoader isIdleForReason:1]) {
    [(SKUIModernChartsDocumentViewController *)self resourceLoader:self->_resourceLoader didLoadAllForReason:1];
  }
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_columnViewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "invalidateAndReload", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_columnViewControllers;
  uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  uint64_t v7 = 0;
  if (v25)
  {
    uint64_t v24 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "sections", v22);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
            v16 = [v15 pageComponent];
            v17 = [v16 viewElement];

            v18 = [v17 elementWithIdentifier:v6];

            if (v18) {
              break;
            }

            uint64_t v7 = 0;
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
              uint64_t v7 = 0;
              v19 = 0;
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_18;
            }
          }
          id v20 = v15;

          if (!v20)
          {
            uint64_t v7 = v18;
            continue;
          }

          v21 = v22;
          [v20 getModalSourceViewForViewElement:v18 completionBlock:v22];

          goto LABEL_23;
        }
        v19 = v7;
LABEL_18:

        uint64_t v7 = v19;
      }
      uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  v21 = v22;
  (*((void (**)(id, void))v22 + 2))(v22, 0);
  v18 = v7;
LABEL_23:
}

- (id)contentScrollView
{
  return 0;
}

- (void)loadView
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v5 setAutoresizingMask:18];
  v3 = objc_alloc_init(SKUIModernChartsView);
  chartsView = self->_chartsView;
  self->_chartsView = v3;

  [(SKUIModernChartsView *)self->_chartsView setAutoresizingMask:18];
  [(SKUIModernChartsView *)self->_chartsView setColumnViewControllers:self->_columnViewControllers];
  [v5 addSubview:self->_chartsView];
  [(SKUIModernChartsDocumentViewController *)self setView:v5];
}

- (void)viewWillLayoutSubviews
{
  chartsView = self->_chartsView;
  [(SKUIModernChartsDocumentViewController *)self _contentInset];
  -[SKUIModernChartsView setContentInset:](chartsView, "setContentInset:");
  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    [(SKUIModernChartsDocumentViewController *)self _computedFrameForActivityIndicatorView];
    -[SKUIActivityIndicatorView setFrame:](activityIndicatorView, "setFrame:");
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIModernChartsDocumentViewController;
  [(SKUIModernChartsDocumentViewController *)&v5 viewWillLayoutSubviews];
}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(SKUIModernChartsDocumentViewController *)self parentViewController];
  if [v4 conformsToProtocol:&unk_1F1DAE308] && (objc_opt_respondsToSelector()) {
    [v4 resourceLoaderDidBeginLoading:v5];
  }
}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 1) {
    [(SKUIChartsTemplateViewElement *)self->_templateElement dispatchEvent:@"visibleimagesloaded" eventAttribute:@"onvisibleimagesloaded" canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  id v6 = [(SKUIModernChartsDocumentViewController *)self parentViewController];
  if [v6 conformsToProtocol:&unk_1F1DAE308] && (objc_opt_respondsToSelector()) {
    [v6 resourceLoader:v7 didLoadAllForReason:a4];
  }
}

- (UIEdgeInsets)_contentInset
{
  v3 = [(SKUIModernChartsDocumentViewController *)self topLayoutGuide];
  [v3 length];
  double v5 = v4;

  id v6 = [(SKUIModernChartsDocumentViewController *)self bottomLayoutGuide];
  [v6 length];
  double v8 = v7;

  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v5;
  double v12 = v8;
  result.right = v10;
  result.bottom = v12;
  result.left = v9;
  result.top = v11;
  return result;
}

- (void)_hideActivityIndicator
{
  [(SKUIActivityIndicatorView *)self->_activityIndicatorView removeFromSuperview];
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = 0;
}

- (id)_layoutCache
{
  layoutCache = self->_layoutCache;
  if (!layoutCache)
  {
    double v4 = objc_alloc_init(SKUILayoutCache);
    double v5 = self->_layoutCache;
    self->_layoutCache = v4;

    layoutCache = self->_layoutCache;
  }

  return layoutCache;
}

- (id)_newColumnViewControllersWithReusableViewControllers:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = [(SKUIViewController *)self clientContext];
  [(SKUIChartsTemplateViewElement *)self->_templateElement columns];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v41;
    long long v30 = self;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        double v5 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v6 = objc_msgSend(objc_alloc((Class)SKUIPageComponentClassForComponentType(objc_msgSend(v5, "pageComponentType"))), "initWithViewElement:", v5);
        if (v6)
        {
          double v7 = [v5 headerElement];
          double v8 = [v7 titleLabels];
          double v9 = [v8 firstObject];

          v35 = v9;
          double v10 = [v9 text];
          double v11 = [v10 string];

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v12 = v31;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v37;
LABEL_9:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v36 + 1) + 8 * v16);
              v18 = [v17 title];
              char v19 = [v18 isEqualToString:v11];

              if (v19) {
                break;
              }
              if (v14 == ++v16)
              {
                uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
                if (v14) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            v21 = v17;

            id v20 = v30;
            if (v21) {
              goto LABEL_21;
            }
          }
          else
          {
LABEL_15:

            id v20 = v30;
          }
          v21 = [[SKUIStorePageSectionsViewController alloc] initWithLayoutStyle:0];
          [(SKUIViewController *)v21 setClientContext:v28];
          id v22 = [(SKUIViewController *)v20 operationQueue];
          [(SKUIViewController *)v21 setOperationQueue:v22];

          v23 = [(SKUIModernChartsDocumentViewController *)v20 _resourceLoader];
          [(SKUIStorePageSectionsViewController *)v21 setResourceLoader:v23];

          if (v11) {
            uint64_t v24 = v11;
          }
          else {
            uint64_t v24 = &stru_1F1C879E8;
          }
          [(SKUIStorePageSectionsViewController *)v21 setTitle:v24];
          uint64_t v25 = objc_alloc_init(SKUIMetricsImpressionSession);
          [(SKUIStorePageSectionsViewController *)v21 setActiveMetricsImpressionSession:v25];

LABEL_21:
          v44 = v6;
          long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
          [(SKUIStorePageSectionsViewController *)v21 setSectionsWithPageComponents:v26];

          [(SKUIModernChartsDocumentViewController *)v20 addChildViewController:v21];
          [v32 addObject:v21];
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v34);
  }

  return v32;
}

- (void)_reloadWithTemplateElement:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_templateElement, a3);
  id v6 = self->_columnViewControllers;
  double v7 = [(SKUIModernChartsDocumentViewController *)self _newColumnViewControllersWithReusableViewControllers:v6];
  columnViewControllers = self->_columnViewControllers;
  self->_columnViewControllers = v7;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v9 = v6;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_columnViewControllers, "containsObject:", v14, (void)v17) & 1) == 0) {
          [v14 removeFromParentViewController];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  chartsView = self->_chartsView;
  if (chartsView) {
    [(SKUIModernChartsView *)chartsView setColumnViewControllers:self->_columnViewControllers];
  }
  uint64_t v16 = [(SKUIChartsTemplateViewElement *)self->_templateElement activityIndicator];

  if (v16) {
    [(SKUIModernChartsDocumentViewController *)self _showActivityIndicator];
  }
  else {
    [(SKUIModernChartsDocumentViewController *)self _hideActivityIndicator];
  }
}

- (void)_showActivityIndicator
{
  id v14 = [(SKUIModernChartsDocumentViewController *)self view];
  if (!self->_activityIndicatorView)
  {
    v3 = objc_alloc_init(SKUIActivityIndicatorView);
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = v3;
  }
  id v5 = [(SKUIChartsTemplateViewElement *)self->_templateElement activityIndicator];
  id v6 = [(SKUIModernChartsDocumentViewController *)self _viewLayoutContext];
  double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double v9 = v8;

  [(id)objc_opt_class() requestLayoutForViewElement:v5 width:v6 context:v9];
  uint64_t v10 = [(SKUIModernChartsDocumentViewController *)self _layoutCache];
  [v10 commitLayoutRequests];

  [(SKUIActivityIndicatorView *)self->_activityIndicatorView reloadWithViewElement:v5 width:v6 context:v9];
  [(SKUIActivityIndicatorView *)self->_activityIndicatorView setAutoresizingMask:45];
  uint64_t v11 = self->_activityIndicatorView;
  uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(SKUIViewReuseView *)v11 setBackgroundColor:v12];

  uint64_t v13 = self->_activityIndicatorView;
  [(SKUIModernChartsDocumentViewController *)self _computedFrameForActivityIndicatorView];
  -[SKUIActivityIndicatorView setFrame:](v13, "setFrame:");
  [v14 addSubview:self->_activityIndicatorView];
}

- (CGRect)_computedFrameForActivityIndicatorView
{
  v3 = [(SKUIModernChartsDocumentViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(SKUIActivityIndicatorView *)self->_activityIndicatorView frame];
  -[SKUIActivityIndicatorView sizeThatFits:](self->_activityIndicatorView, "sizeThatFits:", v5, v7);
  double v9 = v8;
  double v11 = v10;
  *(float *)&double v8 = (v5 - v8) * 0.5;
  double v12 = floorf(*(float *)&v8);
  *(float *)&double v10 = v7 * 0.5 - v10;
  double v13 = floorf(*(float *)&v10);
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_viewLayoutContext
{
  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    double v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    double v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setParentViewController:self];
    double v6 = [(SKUIViewController *)self clientContext];
    [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setClientContext:v6];
    double v7 = [SKUIViewElementTextLayoutCache alloc];
    double v8 = [(SKUIModernChartsDocumentViewController *)self _layoutCache];
    double v9 = [(SKUIViewElementTextLayoutCache *)v7 initWithLayoutCache:v8];

    [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setLabelLayoutCache:v9];
    double v10 = [[SKUIResourceLoader alloc] initWithClientContext:v6];
    [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setResourceLoader:v10];

    viewLayoutContext = self->_viewLayoutContext;
  }

  return viewLayoutContext;
}

- (id)_resourceLoader
{
  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    double v4 = [SKUIResourceLoader alloc];
    double v5 = [(SKUIViewController *)self clientContext];
    double v6 = [(SKUIResourceLoader *)v4 initWithClientContext:v5];
    double v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    double v8 = self->_resourceLoader;
    double v9 = SKUIResourceLoaderGetNameForObject(self);
    [(SKUIResourceLoader *)v8 setName:v9];

    [(SKUIResourceLoader *)self->_resourceLoader setDelegate:self];
    resourceLoader = self->_resourceLoader;
  }

  return resourceLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_columnViewControllers, 0);
  objc_storeStrong((id *)&self->_chartsView, 0);

  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIModernChartsDocumentViewController initWithTemplateElement:]";
}

@end