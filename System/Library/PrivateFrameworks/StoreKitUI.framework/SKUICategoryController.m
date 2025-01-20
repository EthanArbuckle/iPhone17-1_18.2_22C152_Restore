@interface SKUICategoryController
- (BOOL)isLoading;
- (NSOperationQueue)operationQueue;
- (NSURL)defaultURL;
- (NSURL)selectedURL;
- (SKUICategory)category;
- (SKUICategoryController)initWithContentsController:(id)a3;
- (SKUICategoryControllerDelegate)delegate;
- (SKUIClientContext)clientContext;
- (UIBarButtonItem)categoryButton;
- (UISegmentedControl)segmentedControl;
- (id)_artworkLoader;
- (id)_metricsLocationsWithIndex:(int64_t)a3;
- (id)_rootMetricsLocations;
- (id)_tableViewControllerWithCategory:(id)a3;
- (id)metricsPageContextForCategoryTableView:(id)a3;
- (int64_t)segmentedControlLength;
- (void)_precacheArtworkForCategory:(id)a3;
- (void)_recordClickEventWithCategory:(id)a3 index:(int64_t)a4;
- (void)_reloadSegmentedControl;
- (void)_reloadSelectedSegment;
- (void)_setResponse:(id)a3 error:(id)a4;
- (void)buttonAction:(id)a3;
- (void)categoryTableView:(id)a3 didSelectCategory:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)loadFromURL:(id)a3 withCompletionBlock:(id)a4;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)segmentedControlAction:(id)a3;
- (void)setCategory:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDefaultURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setSegmentedControlLength:(int64_t)a3;
- (void)setSelectedURL:(id)a3;
@end

@implementation SKUICategoryController

- (SKUICategoryController)initWithContentsController:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICategoryController initWithContentsController:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUICategoryController;
  v5 = [(SKUICategoryController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_contentsController, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(SKUICategoryController *)self dismiss];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SKUICategoryController;
  [(SKUICategoryController *)&v3 dealloc];
}

- (UIBarButtonItem)categoryButton
{
  button = self->_button;
  if (!button)
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"CATEGORIES_BUTTON"];
    }
    else {
    v5 = +[SKUIClientContext localizedStringForKey:@"CATEGORIES_BUTTON" inBundles:0];
    }
    v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v5 style:0 target:self action:sel_buttonAction_];
    v7 = self->_button;
    self->_button = v6;

    button = self->_button;
  }

  return button;
}

- (void)dismiss
{
  [(UIPopoverController *)self->_popover setDelegate:0];
  [(UIPopoverController *)self->_popover dismissPopoverAnimated:1];
  popover = self->_popover;
  self->_popover = 0;

  [(SKUICategoryTableViewController *)self->_tableViewController dismissViewControllerAnimated:1 completion:0];
  [(SKUICategoryTableViewController *)self->_tableViewController setDelegate:0];
  tableViewController = self->_tableViewController;
  self->_tableViewController = 0;
}

- (BOOL)isLoading
{
  return self->_loadOperation != 0;
}

- (void)loadFromURL:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  [(SSVLoadURLOperation *)self->_loadOperation cancel];
  objc_super v8 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v6];
  loadOperation = self->_loadOperation;
  self->_loadOperation = v8;

  v10 = self->_loadOperation;
  v11 = +[SSVURLDataConsumer consumer];
  [(SSVLoadURLOperation *)v10 setDataConsumer:v11];

  v12 = self->_loadOperation;
  v13 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [(SSVLoadURLOperation *)v12 setStoreFrontSuffix:v13];

  objc_initWeak(&location, self);
  v14 = self->_loadOperation;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__SKUICategoryController_loadFromURL_withCompletionBlock___block_invoke;
  v17[3] = &unk_1E6429998;
  objc_copyWeak(&v19, &location);
  id v15 = v7;
  id v18 = v15;
  [(SSVLoadURLOperation *)v14 setOutputBlock:v17];
  v16 = [(SKUICategoryController *)self operationQueue];
  [v16 addOperation:self->_loadOperation];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __58__SKUICategoryController_loadFromURL_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SKUICategoryController_loadFromURL_withCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E6425308;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

uint64_t __58__SKUICategoryController_loadFromURL_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _setResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (UISegmentedControl)segmentedControl
{
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    id v4 = [SKUISegmentedControl alloc];
    id v5 = [(SKUISegmentedControl *)v4 initWithItems:MEMORY[0x1E4F1CBF0]];
    id v6 = self->_segmentedControl;
    self->_segmentedControl = v5;

    [(SKUISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
    [(SKUISegmentedControl *)self->_segmentedControl addTarget:self action:sel_segmentedControlAction_ forControlEvents:4096];
    [(SKUISegmentedControl *)self->_segmentedControl _setAutosizeText:1];
    [(SKUICategoryController *)self _reloadSegmentedControl];
    segmentedControl = self->_segmentedControl;
  }

  return (UISegmentedControl *)segmentedControl;
}

- (void)setCategory:(id)a3
{
  id v5 = (SKUICategory *)a3;
  p_rootCategory = &self->_rootCategory;
  if (self->_rootCategory != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_rootCategory, a3);
    [(SKUICategoryController *)self _precacheArtworkForCategory:self->_rootCategory];
    p_rootCategory = (SKUICategory **)[(SKUICategoryController *)self _reloadSegmentedControl];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_rootCategory, v5);
}

- (void)setSegmentedControlLength:(int64_t)a3
{
  if (self->_segmentedControlLength != a3)
  {
    self->_segmentedControlLength = a3;
    [(SKUICategoryController *)self _reloadSegmentedControl];
  }
}

- (void)setSelectedURL:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_selectedURL] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedURL, a3);
    [(SKUICategoryController *)self _reloadSelectedSegment];
  }
}

- (void)setDefaultURL:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_defaultURL] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_defaultURL, a3);
    [(SKUICategoryController *)self _reloadSelectedSegment];
  }
}

- (void)buttonAction:(id)a3
{
  [(SKUICategoryController *)self dismiss];
  id v26 = [(SKUICategoryController *)self _rootMetricsLocations];
  id v4 = [(SKUICategoryController *)self _tableViewControllerWithCategory:self->_rootCategory];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v4;

  [(SKUICategoryTableViewController *)self->_tableViewController setMetricsLocations:v26];
  id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1AF8]);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_tableViewController];
    id v10 = (UIPopoverController *)[v8 initWithContentViewController:v9];
    popover = self->_popover;
    self->_popover = v10;

    [(UIPopoverController *)self->_popover _setPopoverBackgroundStyle:3];
    [(UIPopoverController *)self->_popover setDelegate:self];
    [(UIPopoverController *)self->_popover presentPopoverFromBarButtonItem:self->_button permittedArrowDirections:1 animated:1];
  }
  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_tableViewController];
    [v12 _setClipUnderlapWhileTransitioning:1];
    id v13 = self->_rootCategory;
    uint64_t v14 = [(SKUICategory *)v13 subcategoryContainingURL:self->_selectedURL];
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = *MEMORY[0x1E4FA88E8];
      while (1)
      {
        v17 = [v15 children];
        uint64_t v18 = [v17 count];

        if (!v18) {
          break;
        }
        id v19 = [(SKUICategoryController *)self _tableViewControllerWithCategory:v15];
        v20 = [(SKUICategory *)v13 children];
        uint64_t v21 = [v20 indexOfObjectIdenticalTo:v15];

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4FA8228]);
          [v22 setLocationPosition:v21 + 1];
          [v22 setLocationType:v16];
          [v26 insertObject:v22 atIndex:0];
          [v19 setMetricsLocations:v26];
        }
        [v12 pushViewController:v19 animated:0];
        v23 = v15;

        id v15 = [(SKUICategory *)v23 subcategoryContainingURL:self->_selectedURL];

        id v13 = v23;
        if (!v15)
        {
          id v13 = v23;
          break;
        }
      }
    }
    v24 = [[SKUIBackdropContentViewController alloc] initWithContentViewController:v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
    [WeakRetained presentViewController:v24 animated:1 completion:0];
  }
}

- (void)segmentedControlAction:(id)a3
{
  [(SKUICategoryController *)self dismiss];
  uint64_t v4 = [(SKUISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  v28 = [(NSArray *)self->_segmentedControlSegments objectAtIndex:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  rootCategory = self->_rootCategory;
  if (isKindOfClass)
  {
    uint64_t v7 = [(SKUICategoryController *)self _tableViewControllerWithCategory:rootCategory];
    tableViewController = self->_tableViewController;
    self->_tableViewController = v7;

    v9 = self->_tableViewController;
    id v10 = [(SKUICategoryController *)self _metricsLocationsWithIndex:v4];
    [(SKUICategoryTableViewController *)v9 setMetricsLocations:v10];

    [(SKUICategoryTableViewController *)self->_tableViewController setNumberOfHiddenRows:[(NSArray *)self->_segmentedControlSegments count] - 1];
LABEL_6:
    id v17 = objc_alloc(MEMORY[0x1E4FB1AF8]);
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_tableViewController];
    id v19 = (UIPopoverController *)[v17 initWithContentViewController:v18];
    popover = self->_popover;
    self->_popover = v19;

    [(UIPopoverController *)self->_popover _setPopoverBackgroundStyle:3];
    [(UIPopoverController *)self->_popover setDelegate:self];
    uint64_t v21 = self->_popover;
    [(SKUISegmentedControl *)self->_segmentedControl frameForSegmentAtIndex:v4];
    uint64_t v22 = -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v21, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_segmentedControl, 1, 1);
LABEL_7:
    v23 = v28;
    goto LABEL_8;
  }
  if (v28 == rootCategory)
  {
    v24 = [(SKUICategory *)v28 URL];
    if ([v24 isEqual:self->_selectedURL])
    {

      goto LABEL_7;
    }
    selectedURL = self->_selectedURL;
    defaultURL = self->_defaultURL;
  }
  else
  {
    id v11 = [(SKUICategory *)v28 children];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      id v13 = [(SKUICategoryController *)self _tableViewControllerWithCategory:v28];
      uint64_t v14 = self->_tableViewController;
      self->_tableViewController = v13;

      id v15 = self->_tableViewController;
      uint64_t v16 = [(SKUICategoryController *)self _metricsLocationsWithIndex:v4];
      [(SKUICategoryTableViewController *)v15 setMetricsLocations:v16];

      goto LABEL_6;
    }
    selectedURL = [(SKUICategory *)v28 URL];
    v24 = selectedURL;
    defaultURL = self->_selectedURL;
  }
  char v27 = [selectedURL isEqual:defaultURL];

  v23 = v28;
  if ((v27 & 1) == 0)
  {
    [(SKUICategoryController *)self _recordClickEventWithCategory:v28 index:v4];
    uint64_t v22 = [(SKUICategoryController *)self categoryTableView:0 didSelectCategory:v28];
    goto LABEL_7;
  }
LABEL_8:

  MEMORY[0x1F41817F8](v22, v23);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(SKUICategoryController *)self dismiss];

  [(SKUICategoryController *)self _reloadSelectedSegment];
}

- (void)categoryTableView:(id)a3 didSelectCategory:(id)a4
{
  id v8 = a4;
  [(SKUICategoryController *)self dismiss];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 categoryController:self didSelectCategory:v8];
  }
}

- (id)metricsPageContextForCategoryTableView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
  if (WeakRetained)
  {
    id v5 = [(SKUIClientContext *)self->_clientContext metricsPageContextForViewController:WeakRetained];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_artworkLoader
{
  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    uint64_t v4 = [[SKUIResourceLoader alloc] initWithClientContext:self->_clientContext];
    id v5 = [[SKUICategoryArtworkLoader alloc] initWithArtworkLoader:v4];
    char v6 = self->_artworkLoader;
    self->_artworkLoader = v5;

    id v7 = self->_artworkLoader;
    id v8 = +[SKUIStyledImageDataConsumer categoryIconConsumer];
    [(SKUICategoryArtworkLoader *)v7 setImageDataConsumer:v8];

    artworkLoader = self->_artworkLoader;
  }

  return artworkLoader;
}

- (id)_metricsLocationsWithIndex:(int64_t)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA8228]);
  [v4 setLocationPosition:a3];
  [v4 setLocationType:*MEMORY[0x1E4FA88E8]];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA8228]);
  [v5 setLocationPosition:0];
  [v5 setLocationType:@"topNav"];
  v8[0] = v4;
  v8[1] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (void)_reloadSegmentedControl
{
  if (self->_segmentedControl)
  {
    objc_super v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [(SKUICategory *)self->_rootCategory children];
    id v5 = [v4 objectEnumerator];

    char v6 = [(SKUICategory *)self->_rootCategory parentLabel];

    if (v6) {
      [(NSArray *)v3 addObject:self->_rootCategory];
    }
    uint64_t v7 = [v5 nextObject];
    if (v7)
    {
      id v8 = (void *)v7;
      while ([(NSArray *)v3 count] < self->_segmentedControlLength)
      {
        [(NSArray *)v3 addObject:v8];

        id v8 = [v5 nextObject];
        if (!v8) {
          goto LABEL_10;
        }
      }
      [(NSArray *)v3 removeLastObject];
      v9 = [MEMORY[0x1E4F1CA98] null];
      [(NSArray *)v3 addObject:v9];
    }
LABEL_10:
    segmentedControlSegments = self->_segmentedControlSegments;
    self->_segmentedControlSegments = v3;
    id v11 = v3;

    uint64_t v12 = [(SKUISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
    [(SKUISegmentedControl *)self->_segmentedControl removeAllSegments];
    id v13 = self->_segmentedControlSegments;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__SKUICategoryController__reloadSegmentedControl__block_invoke;
    v14[3] = &unk_1E64299C0;
    v14[4] = self;
    [(NSArray *)v13 enumerateObjectsUsingBlock:v14];
    [(SKUISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:v12];
    [(SKUICategoryController *)self _reloadSelectedSegment];
  }
}

void __49__SKUICategoryController__reloadSegmentedControl__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (*(id *)(*(void *)(a1 + 32) + 80) == v5)
  {
    uint64_t v6 = [v5 parentLabel];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v9 name];
    }
    else
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
      if (v7) {
        [v7 localizedStringForKey:@"CATEGORIES_MORE_SEGMENT"];
      }
      else {
      uint64_t v6 = +[SKUIClientContext localizedStringForKey:@"CATEGORIES_MORE_SEGMENT" inBundles:0];
      }
    }
  }
  id v8 = (void *)v6;
  [*(id *)(*(void *)(a1 + 32) + 96) insertSegmentWithTitle:v6 atIndex:a3 animated:0];
}

- (void)_precacheArtworkForCategory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SKUICategoryController *)self _artworkLoader];
  [v5 loadImageForCategory:v4 reason:-1];
  uint64_t v6 = [v4 children];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SKUICategoryController *)self _precacheArtworkForCategory:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_recordClickEventWithCategory:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentsController);
  if (WeakRetained)
  {
    uint64_t v8 = [(SKUIClientContext *)self->_clientContext metricsPageContextForViewController:WeakRetained];
  }
  else
  {
    uint64_t v8 = 0;
  }
  clientContext = self->_clientContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SKUICategoryController__recordClickEventWithCategory_index___block_invoke;
  v12[3] = &unk_1E64299E8;
  id v13 = v8;
  id v14 = v6;
  int64_t v15 = a4;
  id v10 = v6;
  id v11 = v8;
  [(SKUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:v12];
}

void __62__SKUICategoryController__recordClickEventWithCategory_index___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 canRecordEventWithType:*MEMORY[0x1E4FA8878]])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA8200]);
    [v4 setActionType:*MEMORY[0x1E4FA8868]];
    [v4 setPageContext:*(void *)(a1 + 32)];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(*(id *)(a1 + 40), "categoryIdentifier"));
    [v4 setTargetIdentifier:v5];

    uint64_t v6 = *MEMORY[0x1E4FA88E8];
    [v4 setTargetType:*MEMORY[0x1E4FA88E8]];
    uint64_t v7 = [*(id *)(a1 + 40) URL];
    uint64_t v8 = [v7 absoluteString];
    [v4 setTargetURL:v8];

    uint64_t v9 = [v3 locationWithPosition:0 type:@"topNav" fieldData:0];
    id v10 = [v3 locationWithPosition:*(void *)(a1 + 48) type:v6 fieldData:0];
    v12[0] = v10;
    v12[1] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v4 setLocationWithEventLocations:v11];

    [v3 recordEvent:v4];
  }
}

- (void)_reloadSelectedSegment
{
  if (!self->_segmentedControl || self->_popover) {
    return;
  }
  selectedURL = self->_selectedURL;
  id v4 = [(SKUICategory *)self->_rootCategory URL];
  if ([(NSURL *)selectedURL isEqual:v4])
  {
  }
  else
  {
    char v5 = [(NSURL *)self->_selectedURL isEqual:self->_defaultURL];

    if ((v5 & 1) == 0)
    {
      uint64_t v7 = [(SKUICategory *)self->_rootCategory children];
      if ([v7 count])
      {
        uint64_t v8 = 0;
        while (1)
        {
          uint64_t v9 = [v7 objectAtIndex:v8];
          int v10 = [v9 containsURL:self->_selectedURL];

          if (v10) {
            break;
          }
          if (++v8 >= (unint64_t)[v7 count]) {
            goto LABEL_12;
          }
        }
        segmentedControlSegments = self->_segmentedControlSegments;
        id v14 = [v7 objectAtIndex:v8];
        uint64_t v6 = [(NSArray *)segmentedControlSegments indexOfObject:v14];

        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v15 = self->_segmentedControlSegments;
          uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
          uint64_t v6 = [(NSArray *)v15 indexOfObject:v16];
        }
      }
      else
      {
LABEL_12:
        uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      }

      goto LABEL_14;
    }
  }
  uint64_t v6 = [(NSArray *)self->_segmentedControlSegments indexOfObject:self->_rootCategory];
LABEL_14:
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v6;
  }
  segmentedControl = self->_segmentedControl;

  [(SKUISegmentedControl *)segmentedControl setSelectedSegmentIndex:v11];
}

- (id)_rootMetricsLocations
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA8228]);
  [v2 setLocationPosition:0];
  [v2 setLocationType:@"topNav"];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:v2];

  return v3;
}

- (void)_setResponse:(id)a3 error:(id)a4
{
  id v8 = a3;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [[SKUICategory alloc] initWithCategoryDictionary:v8];
    rootCategory = self->_rootCategory;
    self->_rootCategory = v6;

    [(SKUICategoryController *)self _precacheArtworkForCategory:self->_rootCategory];
    [(SKUICategoryController *)self _reloadSegmentedControl];
  }
}

- (id)_tableViewControllerWithCategory:(id)a3
{
  id v4 = (SKUICategory *)a3;
  char v5 = objc_alloc_init(SKUICategoryTableViewController);
  uint64_t v6 = [(SKUICategoryController *)self _artworkLoader];
  [(SKUICategoryTableViewController *)v5 setArtworkLoader:v6];

  [(SKUICategoryTableViewController *)v5 setClientContext:self->_clientContext];
  [(SKUICategoryTableViewController *)v5 setCategory:v4];
  -[SKUICategoryTableViewController setPreferredContentSize:](v5, "setPreferredContentSize:", 320.0, 472.0);
  [(SKUICategoryTableViewController *)v5 setSelectedURL:self->_selectedURL];
  [(SKUICategoryTableViewController *)v5 setDefaultURL:self->_defaultURL];
  BOOL v7 = self->_rootCategory == v4;

  [(SKUICategoryTableViewController *)v5 setRoot:v7];
  [(SKUICategoryTableViewController *)v5 setDelegate:self];

  return v5;
}

- (SKUICategory)category
{
  return self->_rootCategory;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (SKUICategoryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUICategoryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setOperationQueue:(id)a3
{
}

- (int64_t)segmentedControlLength
{
  return self->_segmentedControlLength;
}

- (NSURL)selectedURL
{
  return self->_selectedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_segmentedControlSegments, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_selectedURL, 0);
  objc_storeStrong((id *)&self->_rootCategory, 0);
  objc_storeStrong((id *)&self->_popover, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_destroyWeak((id *)&self->_contentsController);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

- (void)initWithContentsController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICategoryController initWithContentsController:]";
}

@end