@interface SUUINavigationBarController
- (NSArray)existingSearchBarControllers;
- (SUUIClientContext)clientContext;
- (SUUINavigationBarController)initWithNavigationBarViewElement:(id)a3;
- (SUUINavigationBarControllerDelegate)delegate;
- (SUUINavigationBarViewElement)navigationBarViewElement;
- (UIView)navigationPaletteView;
- (UIViewController)parentViewController;
- (double)_availableWidth;
- (id)_addSearchBarControllerWithViewElement:(id)a3;
- (id)_attributedStringForButton:(id)a3;
- (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5;
- (id)_barButtonItemWithButtonViewElement:(id)a3;
- (id)_barButtonItemWithSearchBarViewElement:(id)a3;
- (id)_barButtonItemWithViewElement:(id)a3;
- (id)_buttonWithElement:(id)a3 width:(double)a4;
- (id)_navigationBarContext;
- (id)_resourceImageForImageElement:(id)a3;
- (id)barButtonItemForElementIdentifier:(id)a3;
- (id)fallbackTitleView;
- (id)titleViewWithViewElement:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_fullyReloadSections:(id)a3 withNavigationItem:(id)a4;
- (void)_titleButtonAction:(id)a3;
- (void)_viewElementEventNotification:(id)a3;
- (void)attachToNavigationItem:(id)a3;
- (void)dealloc;
- (void)detachFromNavigationItem:(id)a3;
- (void)detachNavigationItemControllers;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutCacheDidFinishBatch:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationBarViewElement:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setReusableSearchBarControllers:(id)a3;
- (void)updateNavigationItem:(id)a3;
@end

@implementation SUUINavigationBarController

- (SUUINavigationBarController)initWithNavigationBarViewElement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUINavigationBarController;
  v6 = [(SUUINavigationBarController *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sections = v6->_sections;
    v6->_sections = v7;

    objc_storeStrong((id *)&v6->_viewElement, a3);
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel__viewElementEventNotification_ name:0x2704FD0D0 object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:0x2704FD0D0 object:0];
  [(SUUINavigationBarButtonsController *)self->_buttonsController disconnectAllButtons];
  v4 = [(SUUINavigationBarContext *)self->_navigationBarContext textLayoutCache];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationBarController;
  [(SUUINavigationBarController *)&v5 dealloc];
}

- (void)attachToNavigationItem:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__73;
  v76 = __Block_byref_object_dispose__73;
  id v77 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__73;
  v70 = __Block_byref_object_dispose__73;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__73;
  v64 = __Block_byref_object_dispose__73;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__73;
  v58 = __Block_byref_object_dispose__73;
  id v59 = 0;
  viewElement = self->_viewElement;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __54__SUUINavigationBarController_attachToNavigationItem___block_invoke;
  v46[3] = &unk_2654071C0;
  v51 = &v72;
  v52 = &v60;
  v50 = &v66;
  v46[4] = self;
  id v9 = v5;
  id v47 = v9;
  id v10 = v7;
  id v48 = v10;
  id v37 = v6;
  id v49 = v37;
  v53 = &v54;
  [(SUUIViewElement *)viewElement enumerateChildrenUsingBlock:v46];
  if (!v55[5])
  {
    uint64_t v11 = [(SUUINavigationBarController *)self fallbackTitleView];
    v12 = (void *)v55[5];
    v55[5] = v11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v14 = [WeakRetained additionalLeftBarButtonItemForNavigationBarController:self];
    if (v14) {
      [v9 insertObject:v14 atIndex:0];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v15 = [WeakRetained additionalRightBarButtonItemForNavigationBarController:self];
    if (v15) {
      [v10 insertObject:v15 atIndex:0];
    }
  }
  v16 = [(SUUINavigationBarController *)self _navigationBarContext];
  if (v67[5])
  {
    v17 = [SUUINavigationBarSegmentsController alloc];
    v18 = [(SUUINavigationBarSegmentsController *)v17 initWithViewElement:v67[5]];
    [(SUUINavigationBarSectionController *)v18 setContext:v16];
    [(NSMutableArray *)self->_sections addObject:v18];
    uint64_t v19 = [(SUUINavigationBarSegmentsController *)v18 view];
    v20 = (void *)v55[5];
    v55[5] = v19;
  }
  if (!v55[5] && [v37 count])
  {
    v21 = [[SUUINavigationBarMenusController alloc] initWithMenuViewElements:v37];
    [(SUUINavigationBarSectionController *)v21 setContext:v16];
    [(NSMutableArray *)self->_sections addObject:v21];
    uint64_t v22 = [(SUUINavigationBarMenusController *)v21 view];
    v23 = (void *)v55[5];
    v55[5] = v22;
  }
  if (self->_buttonsController) {
    -[NSMutableArray addObject:](self->_sections, "addObject:");
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v24 = self->_sections;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v42 objects:v79 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v43;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v27++) willAppearInNavigationBar];
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v42 objects:v79 count:16];
    }
    while (v25);
  }

  if (![(id)v61[5] length])
  {
    id v28 = objc_loadWeakRetained((id *)&self->_parentViewController);
    uint64_t v29 = [v28 title];
    v30 = (void *)v61[5];
    v61[5] = v29;
  }
  SUUINavigationBarController_SetTitleView(v4, (void *)v55[5]);
  uint64_t v31 = v73[5];
  if (!v31) {
    uint64_t v31 = v61[5];
  }
  [v4 setBackButtonTitle:v31];
  [v4 setLeftItemsSupplementBackButton:1];
  [v4 setLeftBarButtonItems:v9 animated:0];
  [v4 setRightBarButtonItems:v10 animated:0];
  [v4 setTitle:v61[5]];
  v32 = [v16 textLayoutCache];
  [v32 commitLayoutRequests];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v33 = self->_sections;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v38 objects:v78 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v36++) reloadSectionViews];
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v38 objects:v78 count:16];
    }
    while (v34);
  }

  [(SUUINavigationPaletteController *)self->_paletteController reloadSectionViews];
  [(id)v55[5] sizeToFit];

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
}

uint64_t __54__SUUINavigationBarController_attachToNavigationItem___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  uint64_t v4 = [v21 elementType];
  if (v4 == 138)
  {
    id v8 = v21;
    uint64_t v9 = [v8 labelViewStyle];
    if (v9 == 5)
    {
      id v10 = [v8 text];
      uint64_t v11 = [v10 string];
      uint64_t v12 = *(void *)(a1 + 80);
    }
    else
    {
      if (v9 != 2)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v10 = [v8 text];
      uint64_t v11 = [v10 string];
      uint64_t v12 = *(void *)(a1 + 72);
    }
    uint64_t v15 = *(void *)(v12 + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v11;

    goto LABEL_12;
  }
  if (v4 == 109)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void *)(v5 + 40);
    id v6 = (id *)(v5 + 40);
    if (!v7) {
      objc_storeStrong(v6, a2);
    }
  }
  else
  {
    v13 = [v21 style];
    uint64_t v14 = [v13 elementAlignment];

    switch(v14)
    {
      case 0:
      case 4:
      case 5:
        NSLog(&cfstr_InvalidAlignme.isa, v21);
        break;
      case 1:
        id v8 = [*(id *)(a1 + 32) _barButtonItemWithViewElement:v21];
        if (v8) {
          [*(id *)(a1 + 40) addObject:v8];
        }
        goto LABEL_12;
      case 2:
        if (v4 == 69)
        {
          id v6 = (id *)[*(id *)(a1 + 56) addObject:v21];
        }
        else if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) {
               && !*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
        }
        {
          uint64_t v17 = [*(id *)(a1 + 32) titleViewWithViewElement:v21];
          uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
          uint64_t v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;
        }
        break;
      case 3:
        id v8 = [*(id *)(a1 + 32) _barButtonItemWithViewElement:v21];
        if (v8) {
          [*(id *)(a1 + 48) insertObject:v8 atIndex:0];
        }
        goto LABEL_12;
      default:
        break;
    }
  }
LABEL_13:
  return MEMORY[0x270F9A790](v6);
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_sections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "barButtonItemForElementIdentifier:", v4, (void)v13);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (void)detachFromNavigationItem:(id)a3
{
  id v4 = a3;
  [(SUUINavigationBarController *)self detachNavigationItemControllers];
  [v4 setLeftBarButtonItems:0 animated:0];
  [v4 setRightBarButtonItems:0 animated:0];
  [v4 setTitle:0];
  SUUINavigationBarController_SetTitleView(v4, 0);
}

- (void)detachNavigationItemControllers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_sections removeAllObjects];
  [(SUUINavigationBarButtonsController *)self->_buttonsController disconnectAllButtons];
  buttonsController = self->_buttonsController;
  self->_buttonsController = 0;

  paletteController = self->_paletteController;
  self->_paletteController = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_searchBarControllers;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v10 setParentViewController:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSMapTable *)self->_searchBarControllers removeAllObjects];
}

- (NSArray)existingSearchBarControllers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_searchBarControllers;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMapTable *)self->_searchBarControllers objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_reusableSearchBarControllers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  return (NSArray *)v3;
}

- (id)fallbackTitleView
{
  return 0;
}

- (UIView)navigationPaletteView
{
  paletteController = self->_paletteController;
  if (!paletteController)
  {
    id v4 = [(SUUINavigationBarViewElement *)self->_viewElement navigationPalettes];
    uint64_t v5 = [v4 firstObject];

    if (v5)
    {
      uint64_t v6 = [v5 flattenedChildren];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        uint64_t v8 = [(SUUINavigationBarController *)self _navigationBarContext];
        uint64_t v9 = [[SUUINavigationPaletteController alloc] initWithPaletteViewElement:v5];
        uint64_t v10 = self->_paletteController;
        self->_paletteController = v9;

        [(SUUINavigationBarSectionController *)self->_paletteController setContext:v8];
        [(SUUINavigationPaletteController *)self->_paletteController willAppearInNavigationBar];
        uint64_t v11 = [v8 textLayoutCache];
        [v11 commitLayoutRequests];
      }
    }

    paletteController = self->_paletteController;
  }
  return (UIView *)[(SUUINavigationPaletteController *)paletteController view];
}

- (void)setReusableSearchBarControllers:(id)a3
{
  if (self->_reusableSearchBarControllers != a3)
  {
    id v4 = (NSMutableArray *)[a3 mutableCopy];
    reusableSearchBarControllers = self->_reusableSearchBarControllers;
    self->_reusableSearchBarControllers = v4;
    MEMORY[0x270F9A758](v4, reusableSearchBarControllers);
  }
}

- (id)titleViewWithViewElement:(id)a3
{
  id v5 = a3;
  [(SUUINavigationBarController *)self _availableWidth];
  double v7 = v6;
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    uint64_t v8 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v9 = [v8 keyWindow];
    [v9 bounds];
    BOOL v11 = v10 > SUUICompactThreshold();

    if (v11 && v7 > 314.0) {
      double v7 = 314.0;
    }
  }
  if ([v5 elementType] == 106)
  {
    id v12 = [(SUUINavigationBarController *)self _addSearchBarControllerWithViewElement:v5];
    uint64_t v13 = [v12 searchBar];
    long long v14 = [v13 searchField];
    if (([v14 isDescendantOfView:v13] & 1) == 0) {
      [v13 addSubview:v14];
    }
    [v13 setPretendsIsInBar:1];
    long long v15 = [v5 style];
    long long v16 = [v15 itemWidth];

    if (v16)
    {
      long long v17 = [v5 style];
      long long v18 = [v17 itemWidth];
      [v18 floatValue];
      double v20 = v19;

      double v21 = *MEMORY[0x263F001A8];
      double v22 = *(double *)(MEMORY[0x263F001A8] + 8);
      objc_msgSend(v13, "sizeThatFits:", v20, 1.79769313e308);
      double v24 = v23;
      objc_msgSend(v13, "setFrame:", v21, v22, v20, v23);
      [v13 setAutoresizingMask:2];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 setIntrinsicWidth:v20];
      }
      id v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v21, v22, v20, v24);
      [v25 addSubview:v13];
    }
    else
    {
      id v25 = v13;
      double v34 = *MEMORY[0x263F001A8];
      double v35 = *(double *)(MEMORY[0x263F001A8] + 8);
      objc_msgSend(v25, "sizeThatFits:", v7, 1.79769313e308);
      objc_msgSend(v25, "setFrame:", v34, v35, v7, v36);
    }
  }
  else
  {
    if ([v5 elementType] != 12)
    {
      id v25 = 0;
      goto LABEL_17;
    }
    objc_storeStrong((id *)&self->_titleButtonViewElement, a3);
    uint64_t v26 = [(SUUINavigationBarController *)self _buttonWithElement:self->_titleButtonViewElement width:v7];
    [v26 addTarget:self action:sel__titleButtonAction_ forControlEvents:64];
    uint64_t v27 = [MEMORY[0x263F825C8] clearColor];
    [v26 setBackgroundColor:v27];

    double v28 = *MEMORY[0x263F001A8];
    double v29 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v30 = *MEMORY[0x263F001B0];
    double v31 = *(double *)(MEMORY[0x263F001B0] + 8);
    id v12 = v26;
    objc_msgSend(v12, "sizeThatFits:", v30, v31);
    objc_msgSend(v12, "setFrame:", v28, v29, v32, v33);
    id v25 = v12;
  }

LABEL_17:
  return v25;
}

- (void)updateNavigationItem:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUUINavigationBarViewElement *)self->_viewElement updateType];
  switch(v5)
  {
    case 1:
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      BOOL v11 = self->_searchBarControllers;
      uint64_t v12 = [(NSMapTable *)v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v51 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = [(NSMapTable *)self->_searchBarControllers objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * i)];
            [v16 reloadAfterDocumentUpdate];
          }
          uint64_t v13 = [(NSMapTable *)v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v13);
      }

      long long v17 = (void *)[(NSMutableArray *)self->_sections mutableCopy];
      double v6 = v17;
      if (self->_paletteController) {
        objc_msgSend(v17, "addObject:");
      }
      [(SUUINavigationBarController *)self _fullyReloadSections:v6 withNavigationItem:v4];
      if (self->_titleButtonViewElement)
      {
        [(SUUINavigationBarController *)self _availableWidth];
        double v19 = v18;
        if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
        {
          double v20 = [MEMORY[0x263F82438] sharedApplication];
          double v21 = [v20 keyWindow];
          [v21 bounds];
          BOOL v23 = v22 > SUUICompactThreshold();

          if (v23 && v19 > 314.0) {
            double v19 = 314.0;
          }
        }
        double v24 = [(SUUINavigationBarController *)self _buttonWithElement:self->_titleButtonViewElement width:v19];
        [v24 addTarget:self action:sel__titleButtonAction_ forControlEvents:64];
        id v25 = [MEMORY[0x263F825C8] clearColor];
        [v24 setBackgroundColor:v25];

        double v26 = *MEMORY[0x263F001A8];
        double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v28 = *MEMORY[0x263F001B0];
        double v29 = *(double *)(MEMORY[0x263F001B0] + 8);
        id v30 = v24;
        objc_msgSend(v30, "sizeThatFits:", v28, v29);
        objc_msgSend(v30, "setFrame:", v26, v27, v31, v32);
        SUUINavigationBarController_SetTitleView(v4, v30);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
      double v34 = [WeakRetained navigationController];
      double v35 = [v34 navigationBar];
      [v35 setNeedsLayout];

      goto LABEL_44;
    case 4:
      [(SUUINavigationBarController *)self detachFromNavigationItem:v4];
      double v36 = [(SUUINavigationBarController *)self parentViewController];
      id v37 = [v36 presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v39 = [(SUUINavigationBarController *)self parentViewController];
        long long v40 = [v39 presentedViewController];
        [v40 dismissViewControllerAnimated:0 completion:0];
      }
      [(SUUINavigationBarController *)self attachToNavigationItem:v4];
      break;
    case 3:
      double v6 = [(SUUIViewElement *)self->_viewElement firstChildForElementType:106];
      uint64_t v7 = [(SUUIViewElement *)self->_viewElement firstChildForElementType:75];
      uint64_t v8 = [(SUUIViewElement *)self->_viewElement firstChildForElementType:138];
      if ([(NSMapTable *)self->_searchBarControllers count] != 1)
      {
LABEL_42:
        [(SUUINavigationBarController *)self detachFromNavigationItem:v4];
        [(SUUINavigationBarController *)self attachToNavigationItem:v4];
LABEL_43:

LABEL_44:
        break;
      }
      uint64_t v9 = [(SUUIViewElement *)self->_viewElement flattenedChildren];
      uint64_t v10 = [v9 count];

      if (v10 == 3)
      {
        if (!v6 || !v7 || !v8) {
          goto LABEL_42;
        }
      }
      else if (v10 == 2)
      {
        if (!v6 || !(v7 | v8)) {
          goto LABEL_42;
        }
      }
      else if (v10 != 1 || !v6)
      {
        goto LABEL_42;
      }
      uint64_t v49 = v8;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v41 = self->_searchBarControllers;
      uint64_t v42 = [(NSMapTable *)v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        long long v44 = 0;
        uint64_t v45 = *(void *)v55;
        do
        {
          uint64_t v46 = 0;
          id v47 = v44;
          do
          {
            if (*(void *)v55 != v45) {
              objc_enumerationMutation(v41);
            }
            long long v44 = [(NSMapTable *)self->_searchBarControllers objectForKey:*(void *)(*((void *)&v54 + 1) + 8 * v46)];

            ++v46;
            id v47 = v44;
          }
          while (v43 != v46);
          uint64_t v43 = [(NSMapTable *)v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v43);
      }
      else
      {
        long long v44 = 0;
      }

      [v44 setSearchBarViewElement:v6];
      [(NSMapTable *)self->_searchBarControllers removeAllObjects];
      [(NSMapTable *)self->_searchBarControllers setObject:v44 forKey:v6];
      paletteController = self->_paletteController;
      if (v7)
      {
        uint64_t v8 = v49;
        if (!paletteController)
        {
LABEL_52:

          goto LABEL_43;
        }
        paletteController = (SUUINavigationPaletteController *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", self->_paletteController, 0);
        [(SUUINavigationBarController *)self _fullyReloadSections:paletteController withNavigationItem:v4];
      }
      else
      {
        self->_paletteController = 0;
        uint64_t v8 = v49;
      }

      goto LABEL_52;
  }
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  paletteController = self->_paletteController;
  if (!paletteController
    || ([(SUUINavigationPaletteController *)paletteController viewForElementIdentifier:v4],
        (double v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = self->_sections;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "viewForElementIdentifier:", v4, (void)v14);
          if (v12)
          {
            double v6 = (void *)v12;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    double v6 = 0;
LABEL_13:
  }
  return v6;
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 superview];
  if (v3)
  {
    id v4 = (void *)v3;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 superview];

      id v4 = (void *)v5;
      if (!v5) {
        goto LABEL_7;
      }
    }
    [v6 sizeToFit];
    [v4 layoutSubviews];
  }
LABEL_7:
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_sections;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "reloadSectionViews", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(SUUINavigationPaletteController *)self->_paletteController reloadSectionViews];
}

- (void)_viewElementEventNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUUINavigationBarController *)self navigationPaletteView];
  uint64_t v6 = [v4 object];

  if (v5 && [v6 isDescendantOfView:v5])
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v7 = self->_searchBarControllers;
    if ([(NSMapTable *)v7 countByEnumeratingWithState:v9 objects:v10 count:16])
    {
      uint64_t v8 = -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", **((void **)&v9[0] + 1), *(void *)&v9[0]);
      [v8 resignActive:1];
    }
  }
}

- (id)_addSearchBarControllerWithViewElement:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->_reusableSearchBarControllers count]
    || ([(NSMutableArray *)self->_reusableSearchBarControllers firstObject],
        uint64_t v5 = (SUUISearchBarController *)objc_claimAutoreleasedReturnValue(),
        [(SUUISearchBarController *)v5 setSearchBarViewElement:v4],
        [(NSMutableArray *)self->_reusableSearchBarControllers removeObjectAtIndex:0],
        !v5))
  {
    uint64_t v5 = [[SUUISearchBarController alloc] initWithSearchBarViewElement:v4];
  }
  [(SUUISearchBarController *)v5 setClientContext:self->_clientContext];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  [(SUUISearchBarController *)v5 setParentViewController:WeakRetained];

  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    uint64_t v7 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v8 = [v7 keyWindow];
    [v8 bounds];
    if (v9 <= SUUICompactThreshold())
    {
    }
    else
    {
      BOOL v10 = [(SUUIClientContext *)self->_clientContext shouldForceTransientSearchControllerBahavior];

      if (!v10)
      {
        [(SUUISearchBarController *)v5 setShowsResultsForEmptyField:1];
        goto LABEL_10;
      }
    }
  }
  [(SUUISearchBarController *)v5 setDisplaysSearchBarInNavigationBar:1];
LABEL_10:
  searchBarControllers = self->_searchBarControllers;
  if (!searchBarControllers)
  {
    long long v12 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:512 capacity:0];
    uint64_t v13 = self->_searchBarControllers;
    self->_searchBarControllers = v12;

    searchBarControllers = self->_searchBarControllers;
  }
  [(NSMapTable *)searchBarControllers setObject:v5 forKey:v4];

  return v5;
}

- (id)_attributedStringForButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 buttonText];
  uint64_t v6 = [v4 buttonViewType];
  uint64_t v7 = [v4 buttonTitleStyle];
  if (v7)
  {
    uint64_t v8 = [(SUUINavigationBarController *)self _attributedStringForButtonText:v5 type:v6 style:v7];
  }
  else
  {
    double v9 = [v4 style];
    uint64_t v8 = [(SUUINavigationBarController *)self _attributedStringForButtonText:v5 type:v6 style:v9];
  }
  return v8;
}

- (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = SUUIViewElementFontWithStyle(v8);
  if (!v10)
  {
    if (a4) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 1;
    }
    BOOL v10 = SUUIFontPreferredFontForTextStyle(v11);
  }
  long long v12 = [(SUUINavigationBarViewElement *)self->_viewElement tintColor];
  uint64_t v13 = SUUIViewElementPlainColorWithStyle(v8, v12);

  uint64_t v14 = [v9 attributedStringWithDefaultFont:v10 foregroundColor:v13 style:v8];

  return v14;
}

- (double)_availableWidth
{
  p_parentViewController = &self->_parentViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  int v4 = [WeakRetained isViewLoaded];

  if (v4)
  {
    uint64_t v5 = objc_loadWeakRetained((id *)p_parentViewController);
    uint64_t v6 = [v5 view];
    [v6 bounds];
    double v8 = v7;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 bounds];
    double v8 = v9;
  }

  return v8;
}

- (id)_barButtonItemWithButtonViewElement:(id)a3
{
  id v4 = a3;
  buttonsController = self->_buttonsController;
  if (!buttonsController)
  {
    uint64_t v6 = [[SUUINavigationBarButtonsController alloc] initWithNavigationBarViewElement:self->_viewElement];
    double v7 = self->_buttonsController;
    self->_buttonsController = v6;

    double v8 = self->_buttonsController;
    double v9 = [(SUUINavigationBarController *)self _navigationBarContext];
    [(SUUINavigationBarSectionController *)v8 setContext:v9];

    buttonsController = self->_buttonsController;
  }
  BOOL v10 = [(SUUINavigationBarButtonsController *)buttonsController addButtonItemWithButtonViewElement:v4];

  return v10;
}

- (id)_barButtonItemWithSearchBarViewElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F824A8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = [(SUUINavigationBarController *)self _addSearchBarControllerWithViewElement:v5];

  [(SUUINavigationBarController *)self _availableWidth];
  if (v8 <= 1000.0) {
    double v9 = 150.0;
  }
  else {
    double v9 = 200.0;
  }
  BOOL v10 = [v7 searchBar];
  [v10 setPretendsIsInBar:1];
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  objc_msgSend(v10, "sizeThatFits:", v9, 1.79769313e308);
  objc_msgSend(v10, "setFrame:", v11, v12, v9, v13);
  [v6 setCustomView:v10];

  return v6;
}

- (id)_barButtonItemWithViewElement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 elementType];
  if (SUUIIKViewElementTypeIsButton(v5))
  {
    uint64_t v6 = [(SUUINavigationBarController *)self _barButtonItemWithButtonViewElement:v4];
LABEL_5:
    double v7 = (void *)v6;
    goto LABEL_7;
  }
  if (v5 == 106)
  {
    uint64_t v6 = [(SUUINavigationBarController *)self _barButtonItemWithSearchBarViewElement:v4];
    goto LABEL_5;
  }
  double v7 = 0;
LABEL_7:

  return v7;
}

- (id)_buttonWithElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 buttonViewType];
  if (v7 == 9)
  {
    double v9 = objc_alloc_init(SUUIStyledButton);
    [(SUUIStyledButton *)v9 setAlpha:1.0];
    [(SUUIStyledButton *)v9 setBorderStyle:0];
    uint64_t v18 = 1;
    [(SUUIStyledButton *)v9 setButtonType:1];
    uint64_t v19 = [(SUUINavigationBarController *)self _attributedStringForButton:v6];
    double v20 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v19];
    [(SUUIAttributedStringLayoutRequest *)v20 setWidth:a4];
    double v21 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v20];
    [(SUUIStyledButton *)v9 setTitleLayout:v21];
    if (![(SUUIStyledButton *)v9 isUsingItemOfferAppearance]) {
      uint64_t v18 = [v6 isEnabled];
    }
    [(SUUIStyledButton *)v9 setEnabled:v18];
    double v22 = [v6 style];
    BOOL v23 = SUUIViewElementPlainColorWithStyle(v22, 0);

    [(SUUIStyledButton *)v9 setTintColor:v23];
    goto LABEL_29;
  }
  uint64_t v8 = v7;
  if (v7 != 6)
  {
    if (v7 == 5)
    {
      double v9 = objc_alloc_init(SUUIStyledImageButton);
      BOOL v10 = [(SUUIStyledButton *)v9 imageView];
      double v11 = [v6 buttonImage];
      double v12 = [(SUUINavigationBarController *)self _resourceImageForImageElement:v11];
      [v10 setImage:v12];
      [v12 size];
      objc_msgSend(v10, "setImageSize:");
      double v13 = [v11 accessibilityText];
      if (!v13)
      {
        double v13 = [v6 accessibilityText];
      }
      [(SUUIStyledButton *)v9 setAccessibilityLabel:v13];
      uint64_t v14 = [v6 isEnabled];
      double v15 = 0.4;
      if (v14) {
        double v15 = 1.0;
      }
      [(SUUIStyledButton *)v9 setAlpha:v15];
      [(SUUIStyledButton *)v9 setEnabled:v14];
      long long v16 = [v6 style];
      long long v17 = SUUIViewElementPlainColorWithStyle(v16, 0);
      [(SUUIStyledButton *)v9 setTintColor:v17];

      goto LABEL_30;
    }
    double v9 = objc_alloc_init(SUUIStyledButton);
    uint64_t v19 = [(SUUINavigationBarController *)self _attributedStringForButton:v6];
    double v20 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v19];
    [(SUUIAttributedStringLayoutRequest *)v20 setWidth:a4];
    uint64_t v43 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v20];
    [(SUUIStyledButton *)v9 setTitleLayout:v43];
    if (v8 == 13) {
      uint64_t v44 = 7;
    }
    else {
      uint64_t v44 = 0;
    }
    [(SUUIStyledButton *)v9 setButtonType:v44];
    uint64_t v45 = [SUUIButtonBorderStyle alloc];
    uint64_t v46 = [v6 style];
    id v47 = [(SUUIButtonBorderStyle *)v45 initWithElementStyle:v46];

    [(SUUIStyledButton *)v9 setBorderStyle:v47];
    uint64_t v48 = [v6 isEnabled];
    [(SUUIStyledButton *)v9 setEnabled:v48];
    double v49 = 0.4;
    if (v48) {
      double v49 = 1.0;
    }
    [(SUUIStyledButton *)v9 setAlpha:v49];

LABEL_29:
    goto LABEL_30;
  }
  double v9 = objc_alloc_init(SUUIStyledButton);
  [(SUUIStyledButton *)v9 setBorderStyle:0];
  double v24 = [v6 children];
  id v25 = [v24 firstObject];

  long long v55 = v25;
  uint64_t v26 = [v25 elementType];
  if (v26 == 138) {
    uint64_t v27 = 5;
  }
  else {
    uint64_t v27 = 6;
  }
  [(SUUIStyledButton *)v9 setButtonType:v27];
  double v28 = [(SUUINavigationBarController *)self _attributedStringForButton:v6];
  double v29 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v28];
  [(SUUIAttributedStringLayoutRequest *)v29 setWidth:a4];
  id v30 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v29];
  [(SUUIStyledButton *)v9 setTitleLayout:v30];
  uint64_t v31 = [v6 isEnabled];
  [(SUUIStyledButton *)v9 setEnabled:v31];
  double v32 = 0.4;
  if (v31) {
    double v32 = 1.0;
  }
  [(SUUIStyledButton *)v9 setAlpha:v32];
  double v33 = [(SUUIStyledButton *)v9 imageView];
  double v34 = [v6 buttonImage];
  double v35 = [(SUUINavigationBarController *)self _resourceImageForImageElement:v34];
  [v33 setImage:v35];
  [v35 size];
  objc_msgSend(v33, "setImageSize:");
  char v56 = 0;
  double v36 = [v34 style];
  double v37 = SUUIViewElementMarginForStyle(v36, &v56);
  double v39 = v38;
  double v41 = v40;

  if (v56)
  {
    if (v26 == 138) {
      double v42 = v39;
    }
    else {
      double v42 = v41;
    }
    [(SUUIStyledButton *)v9 setImageTextPaddingInterior:v42];
    [(SUUIStyledButton *)v9 setImageYAdjustment:v37];
  }

LABEL_30:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v50 = v9;
    long long v51 = [v6 buttonTitleStyle];
    long long v52 = v51;
    if (!v51)
    {
      long long v52 = [v6 style];
    }
    long long v53 = [v52 ikColor];
    -[SUUIStyledButton setUsesTintColor:](v50, "setUsesTintColor:", [v53 colorType] == 1);

    if (!v51) {
  }
    }

  return v9;
}

- (void)_fullyReloadSections:(id)a3 withNavigationItem:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v12 reloadAfterDocumentUpdateWithNavigationItem:v7];
        [v12 willAppearInNavigationBar];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  double v13 = [(SUUINavigationBarController *)self _navigationBarContext];
  uint64_t v14 = [v13 textLayoutCache];
  [v14 commitLayoutRequests];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "reloadSectionViews", (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (id)_navigationBarContext
{
  navigationBarContext = self->_navigationBarContext;
  if (!navigationBarContext)
  {
    id v4 = objc_alloc_init(SUUINavigationBarContext);
    unint64_t v5 = self->_navigationBarContext;
    self->_navigationBarContext = v4;

    [(SUUINavigationBarContext *)self->_navigationBarContext setClientContext:self->_clientContext];
    id v6 = self->_navigationBarContext;
    id v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    [(SUUINavigationBarContext *)v6 setMaximumNavigationBarWidth:v8];

    uint64_t v9 = self->_navigationBarContext;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    [(SUUINavigationBarContext *)v9 setParentViewController:WeakRetained];

    id v11 = objc_alloc_init(MEMORY[0x263F08A48]);
    [(SUUINavigationBarContext *)self->_navigationBarContext setOperationQueue:v11];
    double v12 = [[SUUIResourceLoader alloc] initWithClientContext:self->_clientContext];
    [(SUUINavigationBarContext *)self->_navigationBarContext setResourceLoader:v12];
    double v13 = objc_alloc_init(SUUILayoutCache);
    [(SUUILayoutCache *)v13 setDelegate:self];
    [(SUUINavigationBarContext *)self->_navigationBarContext setTextLayoutCache:v13];

    navigationBarContext = self->_navigationBarContext;
  }
  return navigationBarContext;
}

- (id)_resourceImageForImageElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resourceName];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = SUUIImageWithResourceName(v4);
    id v7 = [v3 style];
    double v8 = [v7 imageMaskColor];

    if (v8)
    {
      uint64_t v9 = [v8 color];

      if (v9)
      {
        uint64_t v10 = [v8 color];
        uint64_t v11 = [v6 _flatImageWithColor:v10];

        id v6 = (void *)v11;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_titleButtonAction:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:0x2704FD0D0 object:self];
  [(SUUIButtonViewElement *)self->_titleButtonViewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUINavigationBarViewElement)navigationBarViewElement
{
  return self->_viewElement;
}

- (void)setNavigationBarViewElement:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (SUUINavigationBarControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUINavigationBarControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleButtonViewElement, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_searchBarControllers, 0);
  objc_storeStrong((id *)&self->_reusableSearchBarControllers, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_paletteController, 0);
  objc_storeStrong((id *)&self->_navigationBarContext, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_buttonsController, 0);
}

@end