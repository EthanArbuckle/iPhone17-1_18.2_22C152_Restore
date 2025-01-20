@interface SUUIStackDocumentViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_shouldShowIndexBar;
- (BOOL)_tryToScrollToSectionAtIndexPath:(id)a3;
- (BOOL)performTestWithName:(id)a3 options:(id)a4;
- (SUUIStackDocumentViewController)initWithTemplateElement:(id)a3 layoutStyle:(int64_t)a4;
- (SUUIStorePageSectionsViewController)sectionsViewController;
- (id)_colorScheme;
- (id)_indexBarControlController;
- (id)_indexBarViewElement;
- (id)_indexPathFromGlobalIndex:(int64_t)a3;
- (id)_pageComponentsWithViewElements:(id)a3;
- (id)_pageSplitsDescription;
- (id)_pullToRefreshElement;
- (id)_resourceLoader;
- (id)impressionableViewElements;
- (id)indexBarControlController:(id)a3 entryDescriptorAtIndexPath:(id)a4;
- (int64_t)_globalIndexFromIndexPath:(id)a3;
- (int64_t)_maxGlobalIndex;
- (int64_t)_pinningTransitionStyle;
- (int64_t)indexBarControlController:(id)a3 numberOfEntryDescriptorsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInIndexBarControlController:(id)a3;
- (void)_configureIndexBarControl:(id)a3;
- (void)_resetState;
- (void)_resetStateForDocumentNotification:(id)a3;
- (void)_updateEntryListControllersWithReload:(BOOL)a3;
- (void)_updateIndexBarVisibility;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)documentDidUpdate:(id)a3 withTemplate:(id)a4;
- (void)documentMediaQueriesDidUpdate:(id)a3;
- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4;
- (void)indexBarControlController:(id)a3 didSelectEntryDescriptorAtIndexPath:(id)a4;
- (void)indexBarControlControllerDidSelectBeyondBottom:(id)a3;
- (void)indexBarControlControllerDidSelectBeyondTop:(id)a3;
- (void)indexBarEntryListControllerDidInvalidate:(id)a3;
- (void)loadView;
- (void)refresh:(id)a3 refreshControl:(id)a4;
- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4;
- (void)resourceLoaderDidBeginLoading:(id)a3;
- (void)sectionsViewController:(id)a3 willScrollToOffset:(CGPoint)a4 visibleRange:(SUUIIndexPathRange *)a5;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)suui_viewWillAppear:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SUUIStackDocumentViewController

- (SUUIStackDocumentViewController)initWithTemplateElement:(id)a3 layoutStyle:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIStackDocumentViewController;
  v8 = [(SUUIStackDocumentViewController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_layoutStyle = a4;
    objc_storeStrong((id *)&v8->_templateElement, a3);
    [(SUUIStackDocumentViewController *)v9 _updateEntryListControllersWithReload:0];
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v9 selector:sel__resetStateForDocumentNotification_ name:@"SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification" object:0];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(SUUIIndexBarControlController *)self->_indexBarControlController setDataSource:0];
  [(SUUIIndexBarControlController *)self->_indexBarControlController setDelegate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMapTable *)self->_viewElementToEntryListController objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self name:@"SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification" object:0];

  v9.receiver = self;
  v9.super_class = (Class)SUUIStackDocumentViewController;
  [(SUUIViewController *)&v9 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIStackDocumentViewController;
  [(SUUIStackDocumentViewController *)&v4 viewDidAppear:a3];
  [(SUUIResourceLoader *)self->_resourceLoader enterForeground];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIStackDocumentViewController;
  [(SUUIStackDocumentViewController *)&v4 viewDidDisappear:a3];
  [(SUUIResourceLoader *)self->_resourceLoader enterBackground];
}

- (void)documentDidUpdate:(id)a3 withTemplate:(id)a4
{
  id v50 = a3;
  uint64_t v7 = (SUUIStackTemplateElement *)a4;
  objc_storeStrong((id *)&self->_document, a3);
  p_templateElement = &self->_templateElement;
  templateElement = self->_templateElement;
  BOOL v10 = [(SUUIStackTemplateElement *)v7 needsStateReset];
  if (templateElement == v7)
  {
    if (v10)
    {
      if (!self->_hasResetState) {
        goto LABEL_3;
      }
    }
    else
    {
      self->_hasResetState = 0;
    }
  }
  else
  {
    if (v10)
    {
LABEL_3:
      [(SUUIStackDocumentViewController *)self _resetState];
      self->_hasResetState = 1;
      goto LABEL_9;
    }
    self->_hasResetState = 0;
  }
LABEL_9:
  objc_storeStrong((id *)&self->_templateElement, a4);
  long long v11 = [(SUUIStackDocumentViewController *)self view];
  long long v12 = [(SUUIStackDocumentViewController *)self _colorScheme];
  long long v13 = [v12 backgroundColor];
  if (v13)
  {
    [v11 setBackgroundColor:v13];
  }
  else
  {
    v14 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v11 setBackgroundColor:v14];
  }
  uint64_t v15 = [(SUUIStackDocumentViewController *)self _indexBarViewElement];

  if (v15)
  {
    double v17 = *MEMORY[0x263F001B0];
    double v16 = *(double *)(MEMORY[0x263F001B0] + 8);
    v18 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
    [v18 bounds];
    double v48 = v20;
    double v49 = v19;
    v21 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
    [v21 contentInset];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    v30 = [(SUUIIndexBarControlController *)self->_indexBarControlController indexBarControl];

    double v31 = v16;
    double v32 = v17;
    if (v30)
    {
      v33 = [(SUUIIndexBarControlController *)self->_indexBarControlController indexBarControl];
      [v33 frame];
      double v32 = v34;
      double v31 = v35;
    }
    v36 = [(SUUIIndexBarControlController *)self->_indexBarControlController indexBarControl];
    [(SUUIStackDocumentViewController *)self _configureIndexBarControl:v36];

    v37 = [(SUUIIndexBarControlController *)self->_indexBarControlController indexBarControl];

    if (v37)
    {
      v38 = [(SUUIIndexBarControlController *)self->_indexBarControlController indexBarControl];
      objc_msgSend(v38, "sizeThatFits:", v49 - (v25 + v29), v48 - (v23 + v27));
      double v17 = v39;
      double v16 = v40;
    }
    BOOL v41 = v31 != v16 || v32 != v17;
  }
  else
  {
    BOOL v41 = 0;
  }
  [(SUUIStackDocumentViewController *)self _updateEntryListControllersWithReload:1];
  [(SUUIStackDocumentViewController *)self _updateIndexBarVisibility];
  [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setColorScheme:v12];
  [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setPinningTransitionStyle:[(SUUIStackDocumentViewController *)self _pinningTransitionStyle]];
  [(SUUIStorePageSectionsViewController *)self->_sectionsViewController _setRendersWithPerspective:[(SUUIViewElement *)*p_templateElement rendersWithPerspective]];
  [(SUUIStorePageSectionsViewController *)self->_sectionsViewController _setRendersWithParallax:[(SUUIViewElement *)*p_templateElement rendersWithParallax]];
  sectionsViewController = self->_sectionsViewController;
  v43 = [(SUUIStackDocumentViewController *)self _pageSplitsDescription];
  [(SUUIStorePageSectionsViewController *)sectionsViewController setSectionsWithSplitsDescription:v43];

  if (v41)
  {
    v44 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
    v45 = [v44 collectionViewLayout];
    [v45 invalidateLayout];
  }
  v46 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController sections];
  int64_t v47 = [v46 count];

  if (self->_lastNeedsMoreCount >= v47) {
    self->_lastNeedsMoreCount = 0;
  }
}

- (void)suui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  -[SUUIStorePageSectionsViewController suui_viewWillAppear:](self->_sectionsViewController, "suui_viewWillAppear:");
  v5.receiver = self;
  v5.super_class = (Class)SUUIStackDocumentViewController;
  [(SUUIViewController *)&v5 suui_viewWillAppear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  id v23 = objc_alloc_init(MEMORY[0x263F82E00]);
  BOOL v3 = [(SUUIStackDocumentViewController *)self _colorScheme];
  objc_super v4 = [v3 backgroundColor];
  if (v4)
  {
    [v23 setBackgroundColor:v4];
  }
  else
  {
    objc_super v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v23 setBackgroundColor:v5];
  }
  if (!self->_sectionsViewController)
  {
    uint64_t v6 = [[SUUIStorePageSectionsViewController alloc] initWithLayoutStyle:self->_layoutStyle];
    sectionsViewController = self->_sectionsViewController;
    self->_sectionsViewController = v6;

    v8 = self->_sectionsViewController;
    objc_super v9 = [(SUUIViewController *)self clientContext];
    [(SUUIViewController *)v8 setClientContext:v9];

    BOOL v10 = self->_sectionsViewController;
    long long v11 = [(SUUIStackDocumentViewController *)self _resourceLoader];
    [(SUUIStorePageSectionsViewController *)v10 setResourceLoader:v11];

    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setColorScheme:v3];
    long long v12 = self->_sectionsViewController;
    long long v13 = [(SUUIViewController *)self operationQueue];
    [(SUUIViewController *)v12 setOperationQueue:v13];

    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setPinningTransitionStyle:[(SUUIStackDocumentViewController *)self _pinningTransitionStyle]];
    v14 = self->_sectionsViewController;
    [(SUUIStackDocumentViewController *)self preferredContentSize];
    -[SUUIStorePageSectionsViewController setPreferredContentSize:](v14, "setPreferredContentSize:");
    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController _setRendersWithPerspective:[(SUUIViewElement *)self->_templateElement rendersWithPerspective]];
    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController _setRendersWithParallax:[(SUUIViewElement *)self->_templateElement rendersWithParallax]];
    uint64_t v15 = self->_sectionsViewController;
    double v16 = [(SUUIStackDocumentViewController *)self _pageSplitsDescription];
    [(SUUIStorePageSectionsViewController *)v15 setSectionsWithSplitsDescription:v16];

    double v17 = self->_sectionsViewController;
    v18 = objc_alloc_init(SUUIMetricsImpressionSession);
    [(SUUIStorePageSectionsViewController *)v17 setActiveMetricsImpressionSession:v18];

    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setDelegate:self];
    [(SUUIStackDocumentViewController *)self addChildViewController:self->_sectionsViewController];
  }
  double v19 = [(SUUIStackDocumentViewController *)self _indexBarViewElement];

  if (v19)
  {
    [(SUUIStackDocumentViewController *)self _updateEntryListControllersWithReload:1];
    [(SUUIStackDocumentViewController *)self _updateIndexBarVisibility];
    double v20 = [(SUUIIndexBarControlController *)self->_indexBarControlController indexBarControl];
    [(SUUIStackDocumentViewController *)self _configureIndexBarControl:v20];
  }
  v21 = [(SUUIStackDocumentViewController *)self _pullToRefreshElement];
  if (v21)
  {
    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setUsePullToRefresh:1];
    [(SUUIStorePageSectionsViewController *)self->_sectionsViewController setPullToRefreshDelegate:self];
  }
  double v22 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController view];
  [v22 setAutoresizingMask:18];
  [v23 bounds];
  objc_msgSend(v22, "setFrame:");
  [v23 addSubview:v22];
  [(SUUIStackDocumentViewController *)self setView:v23];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUIStackDocumentViewController;
  -[SUUIStackDocumentViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[SUUIStorePageSectionsViewController setPreferredContentSize:](self->_sectionsViewController, "setPreferredContentSize:", width, height);
}

- (void)documentDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 templateElement];
  -[SUUIStackDocumentViewController documentDidUpdate:withTemplate:](self, "documentDidUpdate:withTemplate:", v4);

  if ([(SUUIResourceLoader *)self->_resourceLoader isIdleForReason:1]) {
    [(SUUIStackDocumentViewController *)self resourceLoader:self->_resourceLoader didLoadAllForReason:1];
  }
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
}

- (id)impressionableViewElements
{
  return [(SUUIStorePageSectionsViewController *)self->_sectionsViewController _impressionableViewElements];
}

- (id)indexBarControlController:(id)a3 entryDescriptorAtIndexPath:(id)a4
{
  if (self->_indexBarControlController == a3)
  {
    entryListControllers = self->_entryListControllers;
    id v6 = a4;
    uint64_t v7 = -[NSArray objectAtIndex:](entryListControllers, "objectAtIndex:", [v6 section]);
    uint64_t v8 = [v6 item];

    id v4 = [v7 entryDescriptorAtIndex:v8];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (int64_t)indexBarControlController:(id)a3 numberOfEntryDescriptorsInSection:(int64_t)a4
{
  if (self->_indexBarControlController != a3) {
    return 0;
  }
  id v5 = [(NSArray *)self->_entryListControllers objectAtIndex:a4];
  int64_t v6 = [v5 numberOfEntryDescriptors];

  return v6;
}

- (int64_t)numberOfSectionsInIndexBarControlController:(id)a3
{
  if (self->_indexBarControlController == a3) {
    return [(NSArray *)self->_entryListControllers count];
  }
  else {
    return 0;
  }
}

- (void)indexBarControlController:(id)a3 didSelectEntryDescriptorAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (![(SUUIStackDocumentViewController *)self _tryToScrollToSectionAtIndexPath:v6])
  {
    int64_t v7 = [(SUUIStackDocumentViewController *)self _globalIndexFromIndexPath:v6];
    int64_t v8 = [(SUUIStackDocumentViewController *)self _maxGlobalIndex];
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      for (uint64_t i = -1; ; --i)
      {
        if (v7 + i >= 0)
        {
          long long v12 = [(SUUIStackDocumentViewController *)self _indexPathFromGlobalIndex:v7 + i];
          BOOL v13 = [(SUUIStackDocumentViewController *)self _tryToScrollToSectionAtIndexPath:v12];

          if (v13) {
            break;
          }
        }
        if (v7 + v10 + 1 <= v9)
        {
          v14 = -[SUUIStackDocumentViewController _indexPathFromGlobalIndex:](self, "_indexPathFromGlobalIndex:");
          BOOL v15 = [(SUUIStackDocumentViewController *)self _tryToScrollToSectionAtIndexPath:v14];

          if (v15) {
            break;
          }
        }
        if (v10 >= v9) {
          break;
        }
        ++v10;
      }
    }
  }
}

- (void)indexBarControlControllerDidSelectBeyondBottom:(id)a3
{
  id v4 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController sections];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v7 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
    [v7 contentSize];
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0, 0.0, v6 + -1.0, 0.0, 0.0);
  }
}

- (void)indexBarControlControllerDidSelectBeyondTop:(id)a3
{
  id v4 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController sections];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
    objc_msgSend(v6, "scrollRectToVisible:animated:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
}

- (void)indexBarEntryListControllerDidInvalidate:(id)a3
{
  if (a3)
  {
    entryListControllers = self->_entryListControllers;
    if (entryListControllers)
    {
      uint64_t v5 = -[NSArray indexOfObject:](entryListControllers, "indexOfObject:");
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        indexBarControlController = self->_indexBarControlController;
        id v7 = [MEMORY[0x263F088D0] indexSetWithIndex:v5];
        [(SUUIIndexBarControlController *)indexBarControlController reloadSections:v7];
      }
    }
  }
}

- (void)refresh:(id)a3 refreshControl:(id)a4
{
  id v5 = a4;
  id v6 = [(SUUIStackDocumentViewController *)self _pullToRefreshElement];
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke;
    v7[3] = &unk_265401368;
    id v8 = v5;
    [v6 dispatchEventOfType:15 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:v7];
  }
}

void __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke_2;
  block[3] = &unk_265400980;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

uint64_t __58__SUUIStackDocumentViewController_refresh_refreshControl___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRefreshing];
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  [(SUUIStorePageSectionsViewController *)self->_sectionsViewController sections];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      BOOL v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "pageComponent", (void)v19);
      BOOL v15 = [v14 viewElement];

      uint64_t v16 = [v15 elementWithIdentifier:v6];
      if (v16) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    double v17 = (void *)v16;
    id v18 = v13;

    if (!v18) {
      goto LABEL_12;
    }
    [v18 getModalSourceViewForViewElement:v17 completionBlock:v7];
  }
  else
  {
LABEL_9:

    double v17 = 0;
LABEL_12:
    v7[2](v7, 0);
  }
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SUUIStorePageSectionsViewController *)self->_sectionsViewController conformsToProtocol:&unk_270608798])BOOL v8 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController performTestWithName:v6 options:v7]; {
  else
  }
    BOOL v8 = 0;

  return v8;
}

- (void)sectionsViewController:(id)a3 willScrollToOffset:(CGPoint)a4 visibleRange:(SUUIIndexPathRange *)a5
{
  id v7 = a3;
  BOOL v8 = [v7 sections];
  int64_t v9 = [v8 count];

  uint64_t v10 = [v7 sections];

  id v14 = [v10 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v14 pageComponent];
    uint64_t v12 = [v11 viewElement];
    uint64_t v13 = [v12 elementType];

    v9 -= v13 == 4;
  }
  if (self->_lastNeedsMoreCount < v9 && a5->var2 + 2 >= v9)
  {
    self->_lastNeedsMoreCount = v9;
    [(SUUIStackTemplateElement *)self->_templateElement dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  id v5 = a3;
  id v4 = [(SUUIStackDocumentViewController *)self parentViewController];
  if [v4 conformsToProtocol:&unk_2705F1330] && (objc_opt_respondsToSelector()) {
    [v4 resourceLoaderDidBeginLoading:v5];
  }
}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 1) {
    [(SUUIStackTemplateElement *)self->_templateElement dispatchEvent:@"visibleimagesloaded" eventAttribute:@"onvisibleimagesloaded" canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  id v6 = [(SUUIStackDocumentViewController *)self parentViewController];
  if [v6 conformsToProtocol:&unk_2705F1330] && (objc_opt_respondsToSelector()) {
    [v6 resourceLoader:v7 didLoadAllForReason:a4];
  }
}

- (id)_colorScheme
{
  dispatch_time_t v2 = [(SUUIStackTemplateElement *)self->_templateElement style];
  BOOL v3 = [v2 ikBackgroundColor];
  id v4 = [v3 color];

  if (v4)
  {
    id v5 = objc_alloc_init(SUUIColorScheme);
    [(SUUIColorScheme *)v5 setBackgroundColor:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_configureIndexBarControl:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUUIStackDocumentViewController *)self _indexBarViewElement];
  id v6 = [v5 style];
  id v7 = [MEMORY[0x263F825C8] whiteColor];
  if (v6)
  {
    BOOL v8 = [v6 ikBackgroundColor];
    int64_t v9 = SUUIViewElementPlainColorWithIKColor(v8, 0);

    if (v9)
    {
      id v10 = v9;

      id v7 = v10;
    }
    uint64_t v11 = SUUIViewElementPlainColorWithStyle(v6, 0);
    uint64_t v12 = v11;
    if (v11) {
      id v13 = v11;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v4 setBackgroundColor:v7];
  [v4 setTintColor:v12];
  uint64_t v14 = SUUIViewElementFontWithStyle(v6);
  BOOL v15 = (void *)v14;
  if (v14)
  {
    uint64_t v17 = *MEMORY[0x263F814F0];
    v18[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v4 setDefaultTextAttributes:v16];
}

- (int64_t)_globalIndexFromIndexPath:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_entryListControllers count])
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSArray *)self->_entryListControllers objectAtIndex:v5];
      uint64_t v8 = [v7 numberOfEntryDescriptors];
      if (v5 == [v4 section]) {
        break;
      }
      v6 += v8;

      if (++v5 >= [(NSArray *)self->_entryListControllers count]) {
        goto LABEL_5;
      }
    }
    int64_t v9 = [v4 item] + v6;
  }
  else
  {
LABEL_5:
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)_indexBarControlController
{
  indexBarControlController = self->_indexBarControlController;
  if (!indexBarControlController)
  {
    id v4 = [SUUIIndexBarControl alloc];
    uint64_t v5 = -[SUUIIndexBarControl initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(SUUIIndexBarControl *)v5 contentEdgeInsets];
    [(SUUIIndexBarControl *)v5 setContentEdgeInsets:16.0];
    [(SUUIStackDocumentViewController *)self _configureIndexBarControl:v5];
    uint64_t v6 = [[SUUIIndexBarControlController alloc] initWithIndexBarControl:v5];
    id v7 = self->_indexBarControlController;
    self->_indexBarControlController = v6;

    [(SUUIIndexBarControlController *)self->_indexBarControlController setDataSource:self];
    [(SUUIIndexBarControlController *)self->_indexBarControlController setDelegate:self];
    uint64_t v8 = self->_indexBarControlController;
    int64_t v9 = [(SUUIStackDocumentViewController *)self _resourceLoader];
    [(SUUIIndexBarControlController *)v8 setResourceLoader:v9];

    indexBarControlController = self->_indexBarControlController;
  }
  return indexBarControlController;
}

- (id)_indexBarViewElement
{
  return [(SUUIStackTemplateElement *)self->_templateElement indexBarViewElement];
}

- (id)_indexPathFromGlobalIndex:(int64_t)a3
{
  if ([(NSArray *)self->_entryListControllers count])
  {
    unint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [(NSArray *)self->_entryListControllers objectAtIndex:v5];
      int64_t v7 = a3 - [v6 numberOfEntryDescriptors];
      if (v7 < 0) {
        break;
      }

      ++v5;
      a3 = v7;
      if (v5 >= [(NSArray *)self->_entryListControllers count]) {
        goto LABEL_5;
      }
    }
    uint64_t v8 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:v5];
  }
  else
  {
LABEL_5:
    uint64_t v8 = 0;
  }
  return v8;
}

- (int64_t)_maxGlobalIndex
{
  if (![(NSArray *)self->_entryListControllers count]) {
    return -1;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = [(NSArray *)self->_entryListControllers objectAtIndex:v4];
    v3 += [v5 numberOfEntryDescriptors];

    ++v4;
  }
  while (v4 < [(NSArray *)self->_entryListControllers count]);
  return v3 - 1;
}

- (id)_pageComponentsWithViewElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x263EFF980] array];
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
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = (objc_class *)SUUIPageComponentClassForComponentType(objc_msgSend(v10, "pageComponentType", (void)v14));
        if (v11)
        {
          uint64_t v12 = (void *)[[v11 alloc] initWithViewElement:v10];
          if (v12) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_pageSplitsDescription
{
  id v3 = objc_alloc_init(SUUIStorePageSplitsDescription);
  if ([(SUUIStackTemplateElement *)self->_templateElement numberOfSplits] == 2)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__44;
    v37[4] = __Block_byref_object_dispose__44;
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v38 = v5;
    uint64_t v31 = 0;
    double v32 = &v31;
    uint64_t v33 = 0x3032000000;
    double v34 = __Block_byref_object_copy__44;
    double v35 = __Block_byref_object_dispose__44;
    id v36 = 0;
    uint64_t v25 = 0;
    double v26 = &v25;
    uint64_t v27 = 0x3032000000;
    double v28 = __Block_byref_object_copy__44;
    double v29 = __Block_byref_object_dispose__44;
    id v30 = 0;
    templateElement = self->_templateElement;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __57__SUUIStackDocumentViewController__pageSplitsDescription__block_invoke;
    v20[3] = &unk_2654058D0;
    id v23 = &v25;
    uint64_t v24 = v37;
    long long v22 = &v31;
    v20[4] = self;
    id v7 = v4;
    id v21 = v7;
    [(SUUIViewElement *)templateElement enumerateChildrenUsingBlock:v20];
    if ([v5 count])
    {
      uint64_t v8 = objc_alloc_init(SUUIStorePageSplit);
      int64_t v9 = [(SUUIStackDocumentViewController *)self _pageComponentsWithViewElements:v5];
      [(SUUIStorePageSplit *)v8 setPageComponents:v9];

      [(SUUIStorePageSplitsDescription *)v3 setTopSplit:v8];
    }
    if ([v7 count])
    {
      id v10 = objc_alloc_init(SUUIStorePageSplit);
      uint64_t v11 = [(SUUIStackDocumentViewController *)self _pageComponentsWithViewElements:v7];
      [(SUUIStorePageSplit *)v10 setPageComponents:v11];

      [(SUUIStorePageSplitsDescription *)v3 setBottomSplit:v10];
    }
    [(id)v32[5] widthFraction];
    if (v12 < 0.00000011920929)
    {
      [(id)v26[5] widthFraction];
      if (v13 < 0.00000011920929) {
        [(id)v32[5] setWidthFraction:0.600000024];
      }
    }
    [(SUUIStorePageSplitsDescription *)v3 setLeftSplit:v32[5]];
    [(SUUIStorePageSplitsDescription *)v3 setRightSplit:v26[5]];

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(v37, 8);
  }
  else
  {
    long long v14 = objc_alloc_init(SUUIStorePageSplit);
    long long v15 = [MEMORY[0x263EFF980] array];
    long long v16 = [(SUUIStackTemplateElement *)self->_templateElement collectionHeaderViewElement];
    if (v16) {
      [v15 addObject:v16];
    }
    long long v17 = [(SUUIStackTemplateElement *)self->_templateElement collectionElements];
    [v15 addObjectsFromArray:v17];

    id v18 = [(SUUIStackDocumentViewController *)self _pageComponentsWithViewElements:v15];
    [(SUUIStorePageSplit *)v14 setPageComponents:v18];

    [(SUUIStorePageSplitsDescription *)v3 setTopSplit:v14];
  }
  return v3;
}

void __57__SUUIStackDocumentViewController__pageSplitsDescription__block_invoke(uint64_t a1, void *a2)
{
  id v31 = a2;
  uint64_t v3 = [v31 elementType];
  if (v3 != 128)
  {
    if (v3 == 32
      && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      double v26 = [v31 style];
      uint64_t v27 = SUUIViewElementPlainColorWithStyle(v26, 0);
      double v28 = v27;
      if (v27)
      {
        id v29 = v27;
      }
      else
      {
        id v29 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      }
      id v30 = v29;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDividerColor:v30];
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v31];
    }
    goto LABEL_15;
  }
  id v4 = [v31 style];
  id v5 = [v4 itemWidth];

  uint64_t v6 = [v5 rangeOfString:@"%"];
  uint64_t v7 = [v5 length] - 1;
  [v5 floatValue];
  double v9 = v8;
  if (v6 == v7) {
    double v10 = v9 / 100.0;
  }
  else {
    double v10 = v9;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v19 = objc_alloc_init(SUUIStorePageSplit);
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    long long v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v23 = *(void **)(a1 + 32);
    uint64_t v24 = [v31 flattenedChildren];
    uint64_t v25 = [v23 _pageComponentsWithViewElements:v24];
    [v22 setPageComponents:v25];

    uint64_t v18 = *(void *)(a1 + 48);
    goto LABEL_13;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v11 = objc_alloc_init(SUUIStorePageSplit);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    double v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    long long v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    long long v15 = *(void **)(a1 + 32);
    long long v16 = [v31 flattenedChildren];
    long long v17 = [v15 _pageComponentsWithViewElements:v16];
    [v14 setPageComponents:v17];

    uint64_t v18 = *(void *)(a1 + 56);
LABEL_13:
    [*(id *)(*(void *)(v18 + 8) + 40) setWidthFraction:v10];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));

LABEL_15:
}

- (int64_t)_pinningTransitionStyle
{
  dispatch_time_t v2 = [(SUUIStackTemplateElement *)self->_templateElement navigationBarElement];
  int v3 = [v2 hidesShadow];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_pullToRefreshElement
{
  return [(SUUIViewElement *)self->_templateElement firstChildForElementType:99];
}

- (void)_resetState
{
  self->_lastNeedsMoreCount = 0;
}

- (void)_resetStateForDocumentNotification:(id)a3
{
  document = self->_document;
  id v5 = [a3 object];

  if (document == v5)
  {
    [(SUUIStackDocumentViewController *)self _resetState];
  }
}

- (id)_resourceLoader
{
  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    id v4 = [SUUIResourceLoader alloc];
    id v5 = [(SUUIViewController *)self clientContext];
    uint64_t v6 = [(SUUIResourceLoader *)v4 initWithClientContext:v5];
    uint64_t v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    float v8 = self->_resourceLoader;
    double v9 = SUUIResourceLoaderGetNameForObject(self);
    [(SUUIResourceLoader *)v8 setName:v9];

    [(SUUIResourceLoader *)self->_resourceLoader setDelegate:self];
    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (BOOL)_shouldShowIndexBar
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  dispatch_time_t v2 = self->_entryListControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "numberOfEntryDescriptors", (void)v11);
        char v8 = [v6 hidesIndexBar];
        char v9 = v8;
        if (v7 >= 1 && (v8 & 1) != 0)
        {
          LOBYTE(v3) = 0;
          goto LABEL_14;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
    if (v7 > 0) {
      LOBYTE(v3) = v9 ^ 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
LABEL_14:

  return v3;
}

- (BOOL)_tryToScrollToSectionAtIndexPath:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v72 = 0;
  id v5 = -[NSArray objectAtIndex:](self->_entryListControllers, "objectAtIndex:", [v4 section]);
  uint64_t v6 = objc_msgSend(v5, "targetIndexBarEntryIDForEntryDescriptorAtIndex:returningRelativeSectionIndex:", objc_msgSend(v4, "item"), &v72);
  if (v72 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    char v8 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController sections];
    uint64_t v7 = (void *)[v8 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v69;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v69 != v9) {
            objc_enumerationMutation(v8);
          }
          long long v11 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if ([v11 containsElementWithIndexBarEntryID:v6])
          {
            v62 = v5;
            id v63 = v4;
            uint64_t v7 = [v11 targetScrollingIndexPathForElementWithIndexBarEntryID:v6 relativeSectionIndex:v72];
            long long v12 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
            long long v13 = [v12 collectionViewLayout];
            long long v14 = [v13 layoutAttributesForUnpinnedItemAtIndexPath:v7];
            [v14 frame];
            CGFloat v16 = v15;
            CGFloat v18 = v17;
            CGFloat v20 = v19;
            CGFloat v22 = v21;

            [v12 bounds];
            CGFloat v24 = v23;
            CGFloat v26 = v25;
            CGFloat v28 = v27;
            CGFloat v30 = v29;
            [v12 contentSize];
            double v57 = v31;
            v76.origin.x = v16;
            v76.origin.y = v18;
            v76.size.double width = v20;
            v76.size.double height = v22;
            double MinX = CGRectGetMinX(v76);
            CGFloat v60 = v18;
            CGFloat v61 = v16;
            v77.origin.x = v16;
            v77.origin.y = v18;
            CGFloat v58 = v22;
            CGFloat v59 = v20;
            v77.size.double width = v20;
            v77.size.double height = v22;
            CGFloat v32 = v24;
            double MinY = CGRectGetMinY(v77);
            v78.origin.x = v24;
            v78.origin.y = v26;
            v78.size.double width = v28;
            v78.size.double height = v30;
            double Width = CGRectGetWidth(v78);
            v79.origin.x = v24;
            v79.origin.y = v26;
            v79.size.double width = v28;
            v79.size.double height = v30;
            double Height = CGRectGetHeight(v79);
            id v36 = [v12 collectionViewLayout];
            v37 = objc_msgSend(v36, "pinnedLayoutAttributesForItemsInRect:", MinX, MinY, Width, Height);

            id v38 = [v37 sortedArrayUsingComparator:&__block_literal_global_29];

            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v39 = v38;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v64 objects:v73 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v65;
              double v43 = 0.0;
              while (2)
              {
                for (uint64_t j = 0; j != v41; ++j)
                {
                  if (*(void *)v65 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v45 = *(void **)(*((void *)&v64 + 1) + 8 * j);
                  v46 = objc_msgSend(v45, "indexPath", *(void *)&MinX);
                  if ([v46 compare:v7] != -1)
                  {

                    goto LABEL_23;
                  }
                  [v45 frame];
                  double v43 = v43 - CGRectGetHeight(v80);
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v64 objects:v73 count:16];
                if (v41) {
                  continue;
                }
                break;
              }
            }
            else
            {
              double v43 = 0.0;
            }
LABEL_23:

            [v12 contentOffset];
            double v48 = v47;
            [v12 contentInset];
            double v50 = v49;
            double v52 = v51;
            v81.origin.y = v60;
            v81.origin.x = v61;
            v81.size.double height = v58;
            v81.size.double width = v59;
            double v53 = v43 + CGRectGetMinY(v81);
            v82.origin.x = v32;
            v82.origin.y = v26;
            v82.size.double width = v28;
            v82.size.double height = v30;
            double v54 = v52 + v50 + v57 - CGRectGetHeight(v82);
            if (v53 < v54) {
              double v54 = v53;
            }
            objc_msgSend(v12, "setContentOffset:animated:", 0, v48, v54 - v50, *(void *)&MinX);

            LOBYTE(v7) = 1;
            id v5 = v62;
            id v4 = v63;
            goto LABEL_26;
          }
        }
        uint64_t v7 = (void *)[v8 countByEnumeratingWithState:&v68 objects:v74 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  return (char)v7;
}

uint64_t __68__SUUIStackDocumentViewController__tryToScrollToSectionAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 indexPath];
  uint64_t v6 = [v4 indexPath];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_updateEntryListControllersWithReload:(BOOL)a3
{
  BOOL v22 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [(NSMapTable *)self->_viewElementToEntryListController keyEnumerator];
  id v5 = [v4 allObjects];
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
  char v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  uint64_t v9 = [(SUUIStackDocumentViewController *)self _indexBarViewElement];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __73__SUUIStackDocumentViewController__updateEntryListControllersWithReload___block_invoke;
  v28[3] = &unk_2654058F8;
  id v10 = v6;
  id v29 = v10;
  CGFloat v30 = self;
  id v11 = v7;
  id v31 = v11;
  long long v12 = v8;
  CGFloat v32 = v12;
  double v23 = v9;
  [v9 enumerateChildrenUsingBlock:v28];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        double v19 = [(NSMapTable *)self->_viewElementToEntryListController objectForKey:v18];
        [v19 setDelegate:0];
        [(NSMapTable *)self->_viewElementToEntryListController removeObjectForKey:v18];
        if (![(NSMapTable *)self->_viewElementToEntryListController count])
        {
          viewElementToEntryListController = self->_viewElementToEntryListController;
          self->_viewElementToEntryListController = 0;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v15);
  }

  if (![(NSArray *)v12 count])
  {

    long long v12 = 0;
  }
  entryListControllers = self->_entryListControllers;
  if (entryListControllers == v12 || [(NSArray *)entryListControllers isEqualToArray:v12])
  {
    if ([v11 count] && v22) {
      [(SUUIIndexBarControlController *)self->_indexBarControlController reloadSections:v11];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_entryListControllers, v12);
    if (v22) {
      [(SUUIIndexBarControlController *)self->_indexBarControlController reloadData];
    }
  }
}

void __73__SUUIStackDocumentViewController__updateEntryListControllersWithReload___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [*(id *)(a1 + 32) removeObject:v13];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 1112) objectForKey:v13];
  if (v3)
  {
    id v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 56), "count"));
LABEL_3:
    if ([v4 needsRootTargetViewElement])
    {
      id v5 = [v4 rootTargetIndexBarEntryID];
      uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 1104) firstDescendentWithIndexBarEntryID:v5];
      [v4 setRootTargetViewElement:v6];
    }
    [v4 reloadViewElementData];
    [*(id *)(a1 + 56) addObject:v4];
    id v7 = *(void **)(*(void *)(a1 + 40) + 1112);
    if (!v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:1];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 1112);
      *(void *)(v9 + 1112) = v8;

      id v7 = *(void **)(*(void *)(a1 + 40) + 1112);
    }
    [v7 setObject:v4 forKey:v13];

    goto LABEL_8;
  }
  uint64_t v11 = [v13 elementType];
  if (v11 == 54)
  {
    long long v12 = +[SUUIIndexBarEntryListController entryListControllerForEntryViewElement:v13];
  }
  else
  {
    if (v11 != 55)
    {
      [0 setDelegate:*(void *)(a1 + 40)];
      goto LABEL_8;
    }
    long long v12 = +[SUUIIndexBarEntryListController entryListControllerForEntryListViewElement:v13];
  }
  id v4 = v12;
  [v12 setDelegate:*(void *)(a1 + 40)];
  if (v4) {
    goto LABEL_3;
  }
LABEL_8:
}

- (void)_updateIndexBarVisibility
{
  BOOL v3 = [(SUUIStackDocumentViewController *)self _shouldShowIndexBar];
  id v4 = [(SUUIStorePageSectionsViewController *)self->_sectionsViewController indexBarControl];

  if (v3)
  {
    if (!v4)
    {
      sectionsViewController = self->_sectionsViewController;
      id v8 = [(SUUIStackDocumentViewController *)self _indexBarControlController];
      uint64_t v6 = [v8 indexBarControl];
      [(SUUIStorePageSectionsViewController *)sectionsViewController setIndexBarControl:v6];
    }
  }
  else if (v4)
  {
    id v7 = self->_sectionsViewController;
    [(SUUIStorePageSectionsViewController *)v7 setIndexBarControl:0];
  }
}

- (SUUIStorePageSectionsViewController)sectionsViewController
{
  return self->_sectionsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsViewController, 0);
  objc_storeStrong((id *)&self->_viewElementToEntryListController, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_indexBarControlController, 0);
  objc_storeStrong((id *)&self->_entryListControllers, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end