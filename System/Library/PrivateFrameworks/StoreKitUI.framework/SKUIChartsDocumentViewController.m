@interface SKUIChartsDocumentViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (SKUIChartsDocumentViewController)initWithTemplateElement:(id)a3;
- (UIEdgeInsets)_chartInsets;
- (id)_columnViewControllers;
- (id)_newColumnViewControllersWithReusableViewControllers:(id)a3;
- (id)_resourceLoader;
- (id)contentScrollView;
- (int64_t)_visibleColumnCountForWidth:(double)a3;
- (void)documentDidUpdate:(id)a3;
- (void)documentMediaQueriesDidUpdate:(id)a3;
- (void)loadView;
- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4;
- (void)resourceLoaderDidBeginLoading:(id)a3;
- (void)skui_viewWillAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIChartsDocumentViewController

- (SKUIChartsDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIChartsDocumentViewController initWithTemplateElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIChartsDocumentViewController;
  v6 = [(SKUIChartsDocumentViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateElement, a3);
  }

  return v7;
}

- (void)documentDidUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  v6 = self->_columnViewControllers;
  v7 = [(SKUIChartsDocumentViewController *)self _newColumnViewControllersWithReusableViewControllers:v6];
  columnViewControllers = self->_columnViewControllers;
  self->_columnViewControllers = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v9 = v6;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_columnViewControllers, "containsObject:", v14, (void)v16) & 1) == 0) {
          [v14 removeFromParentViewController];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  chartsView = self->_chartsView;
  if (chartsView) {
    [(SKUIChartColumnsView *)chartsView setChartViewControllers:self->_columnViewControllers];
  }
  if (-[SKUIResourceLoader isIdleForReason:](self->_resourceLoader, "isIdleForReason:", 1, (void)v16)) {
    [(SKUIChartsDocumentViewController *)self resourceLoader:self->_resourceLoader didLoadAllForReason:1];
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

- (void)skui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_columnViewControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "skui_viewWillAppear:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SKUIChartsDocumentViewController;
  [(SKUIViewController *)&v10 skui_viewWillAppear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)contentScrollView
{
  if (self->_chartsView)
  {
    v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SKUIChartsDocumentViewController;
    v2 = [(SKUIChartsDocumentViewController *)&v4 contentScrollView];
  }

  return v2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIChartsDocumentViewController;
  [(SKUIChartsDocumentViewController *)&v5 loadView];
  BOOL v3 = [(SKUIChartsDocumentViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  float v5 = a4.width
     / (double)[(SKUIChartsDocumentViewController *)self _visibleColumnCountForWidth:a3];
  double v6 = floorf(v5);
  double v7 = height;
  result.CGFloat height = v7;
  result.width = v6;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = [(SKUIChartColumnsView *)self->_chartsView effectView];
  double v6 = [(SKUIChartsDocumentViewController *)self navigationController];
  double v7 = [v6 navigationBar];
  uint64_t v8 = [v7 _backdropViewLayerGroupName];
  [v5 _setGroupName:v8];

  v9.receiver = self;
  v9.super_class = (Class)SKUIChartsDocumentViewController;
  [(SKUIViewController *)&v9 viewWillAppear:v3];
}

- (void)viewWillLayoutSubviews
{
  chartsView = self->_chartsView;
  if (chartsView)
  {
    [(SKUIChartColumnsView *)self->_chartsView frame];
    [(SKUIChartColumnsView *)chartsView setNumberOfVisibleColumns:[(SKUIChartsDocumentViewController *)self _visibleColumnCountForWidth:v4]];
  }
  else
  {
    float v5 = [(SKUIChartsDocumentViewController *)self view];
    double v6 = [SKUIChartColumnsView alloc];
    [v5 bounds];
    double v7 = -[SKUIChartColumnsView initWithFrame:](v6, "initWithFrame:");
    uint64_t v8 = self->_chartsView;
    self->_chartsView = v7;

    [(SKUIChartColumnsView *)self->_chartsView setAutoresizingMask:18];
    objc_super v9 = self->_chartsView;
    objc_super v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(SKUIChartColumnsView *)v9 setBackgroundColor:v10];

    long long v11 = self->_chartsView;
    [(SKUIChartsDocumentViewController *)self _chartInsets];
    -[SKUIChartColumnsView setContentInset:](v11, "setContentInset:");
    long long v12 = self->_chartsView;
    [(SKUIChartColumnsView *)v12 frame];
    [(SKUIChartColumnsView *)v12 setNumberOfVisibleColumns:[(SKUIChartsDocumentViewController *)self _visibleColumnCountForWidth:v13]];
    long long v14 = self->_chartsView;
    v15 = [(SKUIChartsDocumentViewController *)self _columnViewControllers];
    [(SKUIChartColumnsView *)v14 setChartViewControllers:v15];

    uint64_t v16 = [(SKUIChartColumnsView *)self->_chartsView effectView];
    long long v17 = [(SKUIChartsDocumentViewController *)self navigationController];
    long long v18 = [v17 navigationBar];
    long long v19 = [v18 _backdropViewLayerGroupName];
    [v16 _setGroupName:v19];

    [v5 addSubview:self->_chartsView];
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIChartsDocumentViewController;
  [(SKUIChartsDocumentViewController *)&v20 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [(SKUIChartsDocumentViewController *)self _visibleColumnCountForWidth:width];
  [(SKUIChartColumnsView *)self->_chartsView beginColumnChangeAnimationToNumberOfVisibleColumns:v8];
  [(SKUIChartColumnsView *)self->_chartsView setNumberOfVisibleColumns:v8];
  v21[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__SKUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v22[3] = &unk_1E6422278;
  v22[4] = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__SKUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v21[3] = &unk_1E6422278;
  [v7 animateAlongsideTransition:v22 completion:v21];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v9 = self->_columnViewControllers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    float v12 = width / (double)v8;
    double v13 = floorf(v12);
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "setPreferredContentSize:", v13, height);
      }
      while (v11 != v15);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  v16.receiver = self;
  v16.super_class = (Class)SKUIChartsDocumentViewController;
  -[SKUIChartsDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __87__SKUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[131];
  [v1 _chartInsets];

  return objc_msgSend(v2, "setContentInset:");
}

void __87__SKUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1048) endColumnChangeAnimation];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];
}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  id v5 = a3;
  double v4 = [(SKUIChartsDocumentViewController *)self parentViewController];
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
  double v6 = [(SKUIChartsDocumentViewController *)self parentViewController];
  if [v6 conformsToProtocol:&unk_1F1DAE308] && (objc_opt_respondsToSelector()) {
    [v6 resourceLoader:v7 didLoadAllForReason:a4];
  }
}

- (UIEdgeInsets)_chartInsets
{
  BOOL v3 = [(SKUIChartsDocumentViewController *)self topLayoutGuide];
  [v3 length];
  double v5 = v4;
  double v6 = [(SKUIChartsDocumentViewController *)self bottomLayoutGuide];
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

- (id)_columnViewControllers
{
  columnViewControllers = self->_columnViewControllers;
  if (!columnViewControllers)
  {
    double v4 = [(SKUIChartsDocumentViewController *)self _newColumnViewControllersWithReusableViewControllers:0];
    double v5 = self->_columnViewControllers;
    self->_columnViewControllers = v4;

    columnViewControllers = self->_columnViewControllers;
  }

  return columnViewControllers;
}

- (id)_newColumnViewControllersWithReusableViewControllers:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35 = [(SKUIViewController *)self clientContext];
  [(SKUIChartColumnsView *)self->_chartsView bounds];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(SKUIChartsDocumentViewController *)self _visibleColumnCountForWidth:v4];
  [(SKUIChartsTemplateViewElement *)self->_templateElement columns];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v41)
  {
    float v9 = v5 / (double)v8;
    double v10 = floorf(v9);
    uint64_t v40 = *(void *)v48;
    v37 = self;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        double v13 = objc_msgSend(objc_alloc((Class)SKUIPageComponentClassForComponentType(objc_msgSend(v12, "pageComponentType"))), "initWithViewElement:", v12);
        if (v13)
        {
          uint64_t v14 = [v12 headerElement];
          uint64_t v15 = [v14 titleLabels];
          objc_super v16 = [v15 firstObject];

          v42 = v16;
          long long v17 = [v16 text];
          long long v18 = [v17 string];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v19 = v38;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v44;
LABEL_9:
            uint64_t v23 = 0;
            while (1)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
              v25 = [v24 title];
              char v26 = [v25 isEqualToString:v18];

              if (v26) {
                break;
              }
              if (v21 == ++v23)
              {
                uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v52 count:16];
                if (v21) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            v28 = v24;

            v27 = v37;
            if (v28) {
              goto LABEL_21;
            }
          }
          else
          {
LABEL_15:

            v27 = v37;
          }
          v28 = [[SKUIStorePageSectionsViewController alloc] initWithLayoutStyle:0];
          [(SKUIViewController *)v28 setClientContext:v35];
          v29 = [(SKUIViewController *)v27 operationQueue];
          [(SKUIViewController *)v28 setOperationQueue:v29];

          v30 = [(SKUIChartsDocumentViewController *)v27 _resourceLoader];
          [(SKUIStorePageSectionsViewController *)v28 setResourceLoader:v30];

          if (v18) {
            v31 = v18;
          }
          else {
            v31 = &stru_1F1C879E8;
          }
          [(SKUIStorePageSectionsViewController *)v28 setTitle:v31];
          v32 = objc_alloc_init(SKUIMetricsImpressionSession);
          [(SKUIStorePageSectionsViewController *)v28 setActiveMetricsImpressionSession:v32];

LABEL_21:
          -[SKUIStorePageSectionsViewController setPreferredContentSize:](v28, "setPreferredContentSize:", v10, v7);
          v51 = v13;
          v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
          [(SKUIStorePageSectionsViewController *)v28 setSectionsWithPageComponents:v33];

          [(SKUIChartsDocumentViewController *)v27 addChildViewController:v28];
          [v39 addObject:v28];
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v41);
  }

  return v39;
}

- (int64_t)_visibleColumnCountForWidth:(double)a3
{
  int64_t v3 = 3;
  if (a3 < 1023.0) {
    int64_t v3 = 2;
  }
  if (a3 < 682.0) {
    return 1;
  }
  else {
    return v3;
  }
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

    uint64_t v8 = self->_resourceLoader;
    float v9 = SKUIResourceLoaderGetNameForObject(self);
    [(SKUIResourceLoader *)v8 setName:v9];

    [(SKUIResourceLoader *)self->_resourceLoader setDelegate:self];
    resourceLoader = self->_resourceLoader;
  }

  return resourceLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_columnViewControllers, 0);

  objc_storeStrong((id *)&self->_chartsView, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIChartsDocumentViewController initWithTemplateElement:]";
}

@end