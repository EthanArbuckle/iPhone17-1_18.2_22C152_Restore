@interface SUUIProductPageHeaderViewController
- (BOOL)_isRestricted;
- (BOOL)askPermission;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIItem)item;
- (SUUIProductPageHeaderFloatingView)floatingView;
- (SUUIProductPageHeaderViewController)initWithItem:(id)a3;
- (SUUIProductPageHeaderViewDelegate)delegate;
- (UIImage)iconImage;
- (id)_activeItem;
- (id)_ageBandString;
- (id)_artworkContext;
- (id)_contentRatingResourceLoader;
- (id)_segmentedControlTitles;
- (int64_t)selectedSectionIndex;
- (void)_artistButtonAction:(id)a3;
- (void)_destroyPopoverController;
- (void)_disableItemOfferButtonWithTitle:(id)a3 animated:(BOOL)a4;
- (void)_itemOfferButtonAction:(id)a3;
- (void)_loadUberImageIfAvailable;
- (void)_reloadItemStateAnimated:(BOOL)a3;
- (void)_sectionControlAction:(id)a3;
- (void)_sendDidReloadOffer;
- (void)_setArtworkWithImage:(id)a3 error:(id)a4;
- (void)_setItemState:(id)a3 animated:(BOOL)a4;
- (void)_setPersonalizedOffer:(id)a3;
- (void)_setUberWithImage:(id)a3 error:(id)a4;
- (void)_shareButtonAction:(id)a3;
- (void)_showActivityViewControllerFromView:(id)a3;
- (void)_showAskPermissionBanner;
- (void)_showSynthesizedItemStateWithFlag:(unint64_t)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)itemStateCenterRestrictionsChanged:(id)a3;
- (void)loadView;
- (void)reloadData;
- (void)setAskPermission:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setProductPage:(id)a3;
- (void)setSelectedSectionIndex:(int64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUUIProductPageHeaderViewController

- (SUUIProductPageHeaderViewController)initWithItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageHeaderViewController;
  v6 = [(SUUIProductPageHeaderViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v7->_itemIdentifier = [(SUUIItem *)v7->_item itemIdentifier];
    v8 = +[SUUIItemStateCenter defaultCenter];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[SUUIItemStateCenter defaultCenter];
  [v3 removeObserver:self];
  [(UIPopoverController *)self->_activityPopoverController setDelegate:0];
  [(UIPopoverController *)self->_activityPopoverController dismissPopoverAnimated:0];
  v4 = [(SUUIProductPageHeaderView *)self->_headerView itemOfferButton];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  id v5 = [(SUUIProductPageHeaderView *)self->_headerView shareButton];
  [v5 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v6 = [(SUUIProductPageHeaderFloatingView *)self->_floatingView sectionControl];
  [v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v7.receiver = self;
  v7.super_class = (Class)SUUIProductPageHeaderViewController;
  [(SUUIProductPageHeaderViewController *)&v7 dealloc];
}

- (SUUIProductPageHeaderFloatingView)floatingView
{
  floatingView = self->_floatingView;
  if (!floatingView)
  {
    v4 = [(SUUIProductPageHeaderViewController *)self _segmentedControlTitles];
    id v5 = [[SUUIProductPageHeaderFloatingView alloc] initWithSectionTitles:v4 isPad:SUUIUserInterfaceIdiom(self->_clientContext) == 1];
    v6 = self->_floatingView;
    self->_floatingView = v5;

    objc_super v7 = self->_floatingView;
    v8 = [(SUUIProductPage *)self->_productPage uber];
    v9 = [v8 colorScheme];
    [(SUUIProductPageHeaderFloatingView *)v7 setColorScheme:v9];

    objc_super v10 = [(SUUIProductPageHeaderFloatingView *)self->_floatingView sectionControl];
    [v10 addTarget:self action:sel__sectionControlAction_ forControlEvents:4096];

    [(SUUIProductPageHeaderFloatingView *)self->_floatingView sizeToFit];
    floatingView = self->_floatingView;
  }
  return floatingView;
}

- (UIImage)iconImage
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  iconImage = self->_iconImage;
  if (iconImage)
  {
    v3 = iconImage;
  }
  else
  {
    id v5 = [(SUUIProductPageHeaderViewController *)self _activeItem];
    v6 = v5;
    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
    {
      v29 = [v5 artworksProvider];
      +[SUUIArtworkProvidingFactory artworkCacheCandidatesForProvider:](SUUIArtworkProvidingFactory, "artworkCacheCandidatesForProvider:");
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        v28 = v6;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            id v14 = objc_alloc(MEMORY[0x263F7B3A0]);
            v15 = [v13 URL];
            v16 = (void *)[v14 initWithURL:v15];
            v17 = [v16 cachedURLResponse];

            if (v17)
            {
              v18 = [(SUUIProductPageHeaderViewController *)self _artworkContext];
              v6 = v28;
              v19 = [v18 dataConsumerForItem:v28];

              v20 = [v17 data];
              v21 = [v17 response];
              v22 = [v19 objectForData:v20 response:v21 error:0];
              v23 = self->_placeholderImage;
              self->_placeholderImage = v22;

              goto LABEL_14;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
          v6 = v28;
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      placeholderImage = self->_placeholderImage;
      if (!placeholderImage)
      {
        v24 = [(SUUIProductPageHeaderViewController *)self _artworkContext];
        v25 = [v24 placeholderImageForItem:v6];
        v26 = self->_placeholderImage;
        self->_placeholderImage = v25;

        placeholderImage = self->_placeholderImage;
      }
    }
    v3 = placeholderImage;
  }
  return v3;
}

- (void)reloadData
{
  v3 = [(SUUIProductPageHeaderViewController *)self _activeItem];
  v4 = v3;
  if (!self->_personalizationState)
  {
    if ([v3 itemKind] == 17)
    {
      id v5 = [[SUUIPersonalizeOfferOperation alloc] initWithItemIdentifier:self->_itemIdentifier clientContext:self->_clientContext];
      objc_initWeak(&location, self);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke;
      v28[3] = &unk_265402DB0;
      objc_copyWeak(&v29, &location);
      [(SUUIPersonalizeOfferOperation *)v5 setOutputBlock:v28];
      self->_personalizationState = 1;
      v6 = [(SUUIProductPageHeaderViewController *)self operationQueue];
      [v6 addOperation:v5];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_personalizationState = 2;
    }
  }
  if (!self->_iconImage && !self->_loadIconOperation)
  {
    objc_super v7 = [(SUUIProductPageHeaderViewController *)self _artworkContext];
    id v8 = [(SUUIProductPage *)self->_productPage item];
    if (v8)
    {
      uint64_t v9 = [v7 URLForItem:v8];
      if (!v9) {
        goto LABEL_16;
      }
    }
    else
    {
      [v7 imageSizeForItem:self->_item];
      double v11 = v10;
      double v13 = v12;
      id v14 = [MEMORY[0x263F82B60] mainScreen];
      [v14 scale];
      double v16 = v15;

      v17 = [v7 artworkForItem:self->_item];
      double v18 = (double)[v17 width];
      double v19 = v11 * v16;
      if (v11 * v16 <= v18 || (double v18 = (double)objc_msgSend(v17, "height", v18, v19), v19 = v13 * v16, v13 * v16 <= v18))
      {
        uint64_t v9 = objc_msgSend(v17, "URL", v18, v19);
      }
      else
      {
        uint64_t v9 = 0;
      }

      if (!v9) {
        goto LABEL_16;
      }
    }
    v20 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v9];
    loadIconOperation = self->_loadIconOperation;
    self->_loadIconOperation = v20;

    v22 = self->_loadIconOperation;
    v23 = [v7 dataConsumerForItem:v4];
    [(SSVLoadURLOperation *)v22 setDataConsumer:v23];

    [(SSVLoadURLOperation *)self->_loadIconOperation setQueuePriority:4];
    objc_initWeak(&location, self);
    v24 = self->_loadIconOperation;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_3;
    v26[3] = &unk_265400BC0;
    objc_copyWeak(&v27, &location);
    [(SSVLoadURLOperation *)v24 setOutputBlock:v26];
    v25 = [(SUUIProductPageHeaderViewController *)self operationQueue];
    [v25 addOperation:self->_loadIconOperation];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
LABEL_16:
  }
  [(SUUIProductPageHeaderViewController *)self _loadUberImageIfAvailable];
}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_2;
  v5[3] = &unk_2654022F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setPersonalizedOffer:*(void *)(a1 + 32)];
}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_4;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setArtworkWithImage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (int64_t)selectedSectionIndex
{
  return [(SUUIProductPageHeaderFloatingView *)self->_floatingView selectedSectionIndex];
}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    [(SUUIProductPageHeaderViewController *)self _reloadItemStateAnimated:0];
    id v4 = [(SUUIProductPageHeaderView *)self->_headerView artistButton];
    [v4 setEnabled:!self->_askPermission];

    id v5 = [(SUUIProductPageHeaderView *)self->_headerView shareButton];
    [v5 setHidden:self->_askPermission];
  }
}

- (void)setProductPage:(id)a3
{
  id v5 = (SUUIProductPage *)a3;
  p_productPage = &self->_productPage;
  if (self->_productPage != v5)
  {
    v47 = v5;
    objc_storeStrong((id *)&self->_productPage, a3);
    id v7 = [(SUUIProductPage *)*p_productPage item];
    if (v7 && self->_wantsActivityViewController)
    {
      id v8 = [(SUUIProductPageHeaderView *)self->_headerView shareButton];
      [(SUUIProductPageHeaderViewController *)self _showActivityViewControllerFromView:v8];
    }
    uint64_t v9 = [(SUUIProductPage *)*p_productPage uber];
    artworkContext = self->_artworkContext;
    id v11 = [v9 colorScheme];
    [(SUUIItemArtworkContext *)artworkContext setColorScheme:v11];

    floatingView = self->_floatingView;
    double v13 = [v9 colorScheme];
    [(SUUIProductPageHeaderFloatingView *)floatingView setColorScheme:v13];

    headerView = self->_headerView;
    double v15 = [(SUUIProductPage *)*p_productPage uber];
    double v16 = [v15 colorScheme];
    v17 = [v16 backgroundColor];
    if (v17)
    {
      [(SUUIProductPageHeaderView *)headerView setBackgroundColor:v17];
    }
    else
    {
      double v18 = [MEMORY[0x263F825C8] whiteColor];
      [(SUUIProductPageHeaderView *)headerView setBackgroundColor:v18];
    }
    double v19 = self->_headerView;
    v20 = [v9 colorScheme];
    [(SUUIProductPageHeaderView *)v19 setColorScheme:v20];

    v21 = self->_headerView;
    v22 = [v7 contentRating];
    [(SUUIProductPageHeaderView *)v21 setContentRating:v22];

    v23 = self->_headerView;
    if ([v7 hasInAppPurchases])
    {
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_HEADER" inTable:@"ProductPage"];
      }
      else {
      v25 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_HEADER" inBundles:0 inTable:@"ProductPage"];
      }
      [(SUUIProductPageHeaderView *)v23 setInAppPurchasesString:v25];
    }
    else
    {
      [(SUUIProductPageHeaderView *)v23 setInAppPurchasesString:0];
    }
    -[SUUIProductPageHeaderView setNumberOfUserRatings:](self->_headerView, "setNumberOfUserRatings:", [v7 numberOfUserRatings]);
    v26 = self->_headerView;
    [v7 userRating];
    [(SUUIProductPageHeaderView *)v26 setUserRating:(float)(v27 / 5.0)];
    v28 = [v7 secondaryContentRatings];
    if ([v28 count])
    {
      contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      if (!contentRatingArtworkLoader)
      {
        long long v30 = [(SUUIProductPageHeaderViewController *)self _contentRatingResourceLoader];
        long long v31 = self->_contentRatingArtworkLoader;
        self->_contentRatingArtworkLoader = v30;

        contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      }
      [(SUUIProductPageHeaderView *)self->_headerView setContentRatingArtworkLoader:contentRatingArtworkLoader];
      long long v32 = self->_headerView;
      long long v33 = [v28 lastObject];
      [(SUUIProductPageHeaderView *)v32 setSecondaryContentRating:v33];
    }
    v34 = [v9 artworkProvider];
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v35 = 630.0;
    }
    else {
      double v35 = 320.0;
    }
    v36 = [MEMORY[0x263F82B60] mainScreen];
    [v36 scale];
    v38 = [v34 artworkWithWidth:vcvtmd_s64_f64(v35 * v37)];

    if (v38)
    {
      v39 = self->_headerView;
      [v38 size];
      double v41 = v40;
      v42 = [MEMORY[0x263F82B60] mainScreen];
      [v42 scale];
      double v44 = v41 / v43;
      uint64_t v45 = SUUIUserInterfaceIdiom(self->_clientContext);
      double v46 = -60.0;
      if (v45 != 1) {
        double v46 = -30.0;
      }
      [(SUUIProductPageHeaderView *)v39 setHeaderImageHeight:v44 + v46];

      [(SUUIProductPageHeaderView *)self->_headerView setHeaderImage:self->_uberImage];
      [(SUUIProductPageHeaderView *)self->_headerView sizeToFit];
    }
    if (self->_performArtistActionOnLoad && SUUIViewControllerIsVisible(self))
    {
      [(SUUIProductPageHeaderViewController *)self _artistButtonAction:0];
      self->_performArtistActionOnLoad = 0;
    }
    [(SUUIProductPageHeaderViewController *)self _loadUberImageIfAvailable];
    [(SUUIProductPageHeaderViewController *)self _reloadItemStateAnimated:0];

    id v5 = v47;
  }
}

- (void)setSelectedSectionIndex:(int64_t)a3
{
  id v4 = [(SUUIProductPageHeaderViewController *)self floatingView];
  [v4 setSelectedSectionIndex:a3];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SUUIProductPageHeaderViewController;
  [(SUUIProductPageHeaderViewController *)&v15 didRotateFromInterfaceOrientation:a3];
  if ([(UIPopoverController *)self->_activityPopoverController isPopoverVisible])
  {
    id v4 = [(SUUIProductPageHeaderView *)self->_headerView shareButton];
    activityPopoverController = self->_activityPopoverController;
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [v4 superview];
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](activityPopoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v14, 15, 1, v7, v9, v11, v13);
  }
}

- (void)loadView
{
  id v56 = [(SUUIProductPage *)self->_productPage uber];
  headerView = self->_headerView;
  if (!headerView)
  {
    id v4 = [(SUUIProductPageHeaderViewController *)self _activeItem];
    id v5 = [(SUUIProductPage *)self->_productPage item];
    double v6 = [[SUUIProductPageHeaderView alloc] initWithClientContext:self->_clientContext];
    double v7 = self->_headerView;
    self->_headerView = v6;

    double v8 = self->_headerView;
    double v9 = [v56 colorScheme];
    [(SUUIProductPageHeaderView *)v8 setColorScheme:v9];

    double v10 = self->_headerView;
    double v11 = [v4 artistName];
    [(SUUIProductPageHeaderView *)v10 setArtistName:v11];

    double v12 = self->_headerView;
    double v13 = [(SUUIProductPageHeaderViewController *)self _ageBandString];
    [(SUUIProductPageHeaderView *)v12 setAgeBandString:v13];

    id v14 = self->_headerView;
    objc_super v15 = [(SUUIProductPageHeaderViewController *)self iconImage];
    [(SUUIProductPageHeaderView *)v14 setIconImage:v15];

    double v16 = self->_headerView;
    v17 = [v4 title];
    [(SUUIProductPageHeaderView *)v16 setTitle:v17];

    double v18 = self->_headerView;
    double v19 = [v4 editorialBadge];
    [(SUUIProductPageHeaderView *)v18 setEditorialBadge:v19];

    v20 = self->_headerView;
    v21 = [v5 contentRating];
    [(SUUIProductPageHeaderView *)v20 setContentRating:v21];

    v22 = self->_headerView;
    if ([v5 hasInAppPurchases])
    {
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_HEADER" inTable:@"ProductPage"];
      }
      else {
      v24 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_HEADER" inBundles:0 inTable:@"ProductPage"];
      }
      [(SUUIProductPageHeaderView *)v22 setInAppPurchasesString:v24];
    }
    else
    {
      [(SUUIProductPageHeaderView *)v22 setInAppPurchasesString:0];
    }
    v25 = self->_headerView;
    [v4 userRating];
    [(SUUIProductPageHeaderView *)v25 setUserRating:(float)(v26 / 5.0)];
    -[SUUIProductPageHeaderView setNumberOfUserRatings:](self->_headerView, "setNumberOfUserRatings:", [v4 numberOfUserRatings]);
    float v27 = [v5 secondaryContentRatings];
    if ([v27 count])
    {
      contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      if (!contentRatingArtworkLoader)
      {
        id v29 = [(SUUIProductPageHeaderViewController *)self _contentRatingResourceLoader];
        long long v30 = self->_contentRatingArtworkLoader;
        self->_contentRatingArtworkLoader = v29;

        contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      }
      [(SUUIProductPageHeaderView *)self->_headerView setContentRatingArtworkLoader:contentRatingArtworkLoader];
      long long v31 = self->_headerView;
      long long v32 = [v27 lastObject];
      [(SUUIProductPageHeaderView *)v31 setSecondaryContentRating:v32];
    }
    long long v33 = [v56 artworkProvider];
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v34 = 630.0;
    }
    else {
      double v34 = 320.0;
    }
    double v35 = [MEMORY[0x263F82B60] mainScreen];
    [v35 scale];
    double v37 = [v33 artworkWithWidth:vcvtmd_s64_f64(v34 * v36)];

    if (v37)
    {
      v38 = self->_headerView;
      [v37 size];
      double v40 = v39;
      double v41 = [MEMORY[0x263F82B60] mainScreen];
      [v41 scale];
      double v43 = v40 / v42;
      uint64_t v44 = SUUIUserInterfaceIdiom(self->_clientContext);
      double v45 = -60.0;
      if (v44 != 1) {
        double v45 = -30.0;
      }
      [(SUUIProductPageHeaderView *)v38 setHeaderImageHeight:v43 + v45];

      [(SUUIProductPageHeaderView *)self->_headerView setHeaderImage:self->_uberImage];
    }
    [(SUUIProductPageHeaderView *)self->_headerView setRestricted:[(SUUIProductPageHeaderViewController *)self _isRestricted]];
    [(SUUIProductPageHeaderViewController *)self _reloadItemStateAnimated:0];
    double v46 = [(SUUIProductPageHeaderView *)self->_headerView itemOfferButton];
    objc_msgSend(v46, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v4, "deviceFamilies")));

    [(SUUIProductPageHeaderView *)self->_headerView sizeToFit];
    v47 = [(SUUIProductPageHeaderView *)self->_headerView shareButton];
    [v47 addTarget:self action:sel__shareButtonAction_ forControlEvents:64];

    v48 = [(SUUIProductPageHeaderView *)self->_headerView shareButton];
    [v48 setHidden:self->_askPermission];

    v49 = [(SUUIProductPageHeaderView *)self->_headerView artistButton];
    [v49 addTarget:self action:sel__artistButtonAction_ forControlEvents:64];

    v50 = [(SUUIProductPageHeaderView *)self->_headerView artistButton];
    [v50 setEnabled:!self->_askPermission];

    headerView = self->_headerView;
  }
  [(SUUIProductPageHeaderViewController *)self setView:headerView];
  v51 = self->_headerView;
  v52 = [(SUUIProductPage *)self->_productPage uber];
  v53 = [v52 colorScheme];
  v54 = [v53 backgroundColor];
  if (v54)
  {
    [(SUUIProductPageHeaderView *)v51 setBackgroundColor:v54];
  }
  else
  {
    v55 = [MEMORY[0x263F825C8] whiteColor];
    [(SUUIProductPageHeaderView *)v51 setBackgroundColor:v55];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIProductPageHeaderViewController *)self reloadData];
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageHeaderViewController;
  [(SUUIProductPageHeaderViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIProductPageHeaderViewController *)self _destroyPopoverController];
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageHeaderViewController;
  [(SUUIProductPageHeaderViewController *)&v5 viewWillDisappear:v3];
}

- (void)_artistButtonAction:(id)a3
{
  productPage = self->_productPage;
  if (productPage)
  {
    objc_super v5 = [(SUUIProductPage *)productPage item];
    id v10 = [v5 artistPageURL];

    double v6 = v10;
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      double v6 = v10;
      if (v8)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_delegate);
        [v9 productPageHeaderView:self didSelectURL:v10];

        double v6 = v10;
      }
    }
  }
  else
  {
    self->_performArtistActionOnLoad = 1;
  }
}

- (void)_itemOfferButtonAction:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = [v7 metricsControllerForProductPageHeader:self];
  }
  else
  {
    char v8 = 0;
  }
  id v9 = [(SUUIProductPageHeaderViewController *)self _activeItem];
  id v10 = v9;
  personalizedOffer = self->_personalizedOffer;
  if (personalizedOffer)
  {
    double v12 = personalizedOffer;
  }
  else
  {
    double v12 = [v9 primaryItemOffer];
  }
  double v13 = v12;
  objc_initWeak(&location, self);
  if (!v8)
  {
    if (SUUIItemStateCenterUseAppstoredPurchases(v10))
    {
      double v19 = +[SUUIItemStateCenter defaultCenter];
      clientContext = self->_clientContext;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke;
      v31[3] = &unk_265402DD8;
      v21 = &v32;
      objc_copyWeak(&v32, &location);
      uint64_t v22 = [v19 performActionForSoftwareItem:v10 offer:v13 clientContext:clientContext completionBlock:v31];
    }
    else
    {
      double v19 = +[SUUIItemStateCenter defaultCenter];
      v24 = self->_clientContext;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_3;
      v29[3] = &unk_265402E00;
      v21 = &v30;
      objc_copyWeak(&v30, &location);
      uint64_t v22 = [v19 performActionForItem:v10 offer:v13 clientContext:v24 completionBlock:v29];
    }
    v23 = (void *)v22;

    objc_destroyWeak(v21);
    if (!v23) {
      goto LABEL_20;
    }
LABEL_19:
    [(SUUIProductPageHeaderViewController *)self _setItemState:v23 animated:1];
    goto LABEL_20;
  }
  id v14 = [v8 itemOfferClickEventWithItem:v10 locationPosition:0];
  if (v14) {
    [v8 recordEvent:v14];
  }
  BOOL v15 = SUUIItemStateCenterUseAppstoredPurchases(v10);
  double v16 = self->_clientContext;
  if (v15)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_5;
    v27[3] = &unk_265402DD8;
    v17 = &v28;
    objc_copyWeak(&v28, &location);
    uint64_t v18 = [v8 performActionForSoftwareItem:v10 offer:v13 clientContext:v16 completionBlock:v27];
  }
  else
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_7;
    v25[3] = &unk_265402E00;
    v17 = &v26;
    objc_copyWeak(&v26, &location);
    uint64_t v18 = [v8 performActionForItem:v10 offer:v13 clientContext:v16 completionBlock:v25];
  }
  v23 = (void *)v18;
  objc_destroyWeak(v17);

  if (v23) {
    goto LABEL_19;
  }
LABEL_20:
  objc_destroyWeak(&location);
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_2;
  v5[3] = &unk_265402A38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) error];
  id WeakRetained = [v4 domain];
  if ([WeakRetained isEqualToString:*MEMORY[0x263F7B758]])
  {
    uint64_t v3 = [v4 code];

    if (v3 != 134) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _showAskPermissionBanner];
  }

LABEL_5:
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_4;
  v5[3] = &unk_265402A38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_4(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) error];
  id WeakRetained = [v4 domain];
  if ([WeakRetained isEqualToString:*MEMORY[0x263F7B758]])
  {
    uint64_t v3 = [v4 code];

    if (v3 != 134) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _showAskPermissionBanner];
  }

LABEL_5:
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_6;
  v5[3] = &unk_265402A38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_6(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) error];
  id WeakRetained = [v4 domain];
  if ([WeakRetained isEqualToString:*MEMORY[0x263F7B758]])
  {
    uint64_t v3 = [v4 code];

    if (v3 != 134) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _showAskPermissionBanner];
  }

LABEL_5:
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_8;
  v5[3] = &unk_265402A38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) error];
  id WeakRetained = [v4 domain];
  if ([WeakRetained isEqualToString:*MEMORY[0x263F7B758]])
  {
    uint64_t v3 = [v4 code];

    if (v3 != 134) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _showAskPermissionBanner];
  }

LABEL_5:
}

- (void)_sectionControlAction:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  int64_t v4 = [(SUUIProductPageHeaderFloatingView *)self->_floatingView selectedSectionIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = [v7 metricsControllerForProductPageHeader:self];

    if ([v8 canRecordEventWithType:*MEMORY[0x263F7BB50]])
    {
      id v9 = objc_alloc_init(MEMORY[0x263F7B228]);
      id v10 = [(SUUIProductPageHeaderViewController *)self _segmentedControlTitles];
      double v11 = [v10 objectAtIndex:v4];
      [v9 setActionDetails:v11];

      [v9 setActionType:*MEMORY[0x263F7BB38]];
      uint64_t v12 = *MEMORY[0x263F7BBC0];
      [v9 setTargetType:*MEMORY[0x263F7BBC0]];
      double v13 = [v8 locationWithPosition:0 type:@"tabBar" fieldData:0];
      id v14 = [v8 locationWithPosition:v4 type:v12 fieldData:0];
      v19[0] = v14;
      v19[1] = v13;
      BOOL v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
      [v9 setLocationWithEventLocations:v15];

      [v8 recordEvent:v9];
    }
  }
  id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 productPageHeaderView:self didSelectSectionIndex:v4];
  }
}

- (void)_shareButtonAction:(id)a3
{
  if (self->_productPage) {
    [(SUUIProductPageHeaderViewController *)self _showActivityViewControllerFromView:a3];
  }
  else {
    self->_wantsActivityViewController = 1;
  }
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__SUUIProductPageHeaderViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __73__SUUIProductPageHeaderViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1104) item];
  uint64_t v3 = [v2 childItemIdentifiers];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "itemIdentifier", (void)v11);
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 1048);
        if (v10 == [v9 longLongValue] || objc_msgSend(v3, "containsObject:", v9))
        {
          [*(id *)(a1 + 32) _reloadItemStateAnimated:1];
          [*(id *)(a1 + 32) _sendDidReloadOffer];

          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SUUIProductPageHeaderViewController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_265400980;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__SUUIProductPageHeaderViewController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[128];
  uint64_t v3 = [v1 _isRestricted];
  return [v2 setRestricted:v3];
}

- (id)_activeItem
{
  item = [(SUUIProductPage *)self->_productPage item];
  id v4 = item;
  if (!item) {
    item = self->_item;
  }
  id v5 = item;

  return v5;
}

- (id)_ageBandString
{
  uint64_t v3 = [(SUUIProductPageHeaderViewController *)self _activeItem];
  uint64_t v4 = [v3 ageBandRange];
  uint64_t v6 = v5;

  if (v4 == 0x7FFFFFFFFFFFFFFFLL || SUUIUserInterfaceIdiom(self->_clientContext) != 1)
  {
    long long v13 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v7 setNumberStyle:1];
    [v7 setUsesGroupingSeparator:0];
    id v8 = [NSNumber numberWithUnsignedInteger:v4];
    id v9 = [v7 stringFromNumber:v8];

    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v4 + v6];
    long long v11 = [v7 stringFromNumber:v10];

    clientContext = self->_clientContext;
    if (v4)
    {
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_HEADER_AGE_BAND" inTable:@"ProductPage"];
      }
      else {
      long long v14 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_HEADER_AGE_BAND" inBundles:0 inTable:@"ProductPage"];
      }
      [NSString stringWithValidatedFormat:v14, @"%@%@", 0, v9, v11 validFormatSpecifiers error];
    }
    else
    {
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_HEADER_AGE_MAX" inTable:@"ProductPage"];
      }
      else {
      long long v14 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_HEADER_AGE_MAX" inBundles:0 inTable:@"ProductPage"];
      }
      [NSString stringWithValidatedFormat:v14, @"%@", 0, v11, v16 validFormatSpecifiers error];
    long long v13 = };
  }
  return v13;
}

- (id)_artworkContext
{
  artworkContext = self->_artworkContext;
  if (!artworkContext)
  {
    uint64_t v4 = objc_alloc_init(SUUIItemArtworkContext);
    uint64_t v5 = self->_artworkContext;
    self->_artworkContext = v4;

    uint64_t v6 = self->_artworkContext;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v7 = 170.0;
    }
    else {
      double v7 = 100.0;
    }
    id v8 = +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", v7, v7);
    [(SUUIItemArtworkContext *)v6 setIconConsumer:v8];

    id v9 = self->_artworkContext;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v10 = 170.0;
    }
    else {
      double v10 = 100.0;
    }
    long long v11 = +[SUUIStyledImageDataConsumer productImageConsumerWithSize:](SUUIStyledImageDataConsumer, "productImageConsumerWithSize:", v10, v10);
    [(SUUIItemArtworkContext *)v9 setNewsstandConsumer:v11];

    long long v12 = self->_artworkContext;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v13 = 170.0;
    }
    else {
      double v13 = 100.0;
    }
    long long v14 = +[SUUIProductImageDataConsumer consumerWithSize:](SUUIProductImageDataConsumer, "consumerWithSize:", v13, v13);
    [(SUUIItemArtworkContext *)v12 setGeneralConsumer:v14];

    BOOL v15 = self->_artworkContext;
    uint64_t v16 = [(SUUIProductPage *)self->_productPage uber];
    char v17 = [v16 colorScheme];
    [(SUUIItemArtworkContext *)v15 setColorScheme:v17];

    artworkContext = self->_artworkContext;
  }
  return artworkContext;
}

- (void)_destroyPopoverController
{
  [(UIPopoverController *)self->_activityPopoverController setDelegate:0];
  [(UIPopoverController *)self->_activityPopoverController dismissPopoverAnimated:1];
  activityPopoverController = self->_activityPopoverController;
  self->_activityPopoverController = 0;
}

- (id)_contentRatingResourceLoader
{
  uint64_t v3 = [SUUIResourceLoader alloc];
  uint64_t v4 = [(SUUIProductPageHeaderViewController *)self clientContext];
  uint64_t v5 = [(SUUIResourceLoader *)v3 initWithClientContext:v4];

  uint64_t v6 = [[SUUIContentRatingArtworkResourceLoader alloc] initWithArtworkLoader:v5];
  double v7 = +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", 11.0, 11.0);
  [(SUUIContentRatingArtworkResourceLoader *)v6 setImageDataConsumer:v7];

  return v6;
}

- (void)_disableItemOfferButtonWithTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [[SUUIItemOffer alloc] initWithButtonText:v6];

  [(SUUIProductPageHeaderView *)self->_headerView setItemOffer:v7];
  [(SUUIProductPageHeaderViewController *)self _setItemState:0 animated:v4];
}

- (BOOL)_isRestricted
{
  v2 = [(SUUIProductPageHeaderViewController *)self _activeItem];
  uint64_t v3 = +[SUUIItemStateCenter defaultCenter];
  char v4 = objc_msgSend(v3, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v2, "parentalControlsRank"));

  return v4;
}

- (void)_loadUberImageIfAvailable
{
  if (!self->_uberImage && !self->_loadUberOperation)
  {
    uint64_t v3 = [(SUUIProductPage *)self->_productPage uber];
    char v4 = [v3 artworkProvider];
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v5 = 630.0;
    }
    else {
      double v5 = 320.0;
    }
    id v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 scale];
    id v8 = [v4 artworkWithWidth:vcvtmd_s64_f64(v5 * v7)];
    id v9 = [v8 URL];

    if (v9)
    {
      double v10 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v9];
      loadUberOperation = self->_loadUberOperation;
      self->_loadUberOperation = v10;

      [(SSVLoadURLOperation *)self->_loadUberOperation setQueuePriority:4];
      long long v12 = +[SSVURLDataConsumer consumer];
      double v13 = [(SUUIProductPage *)self->_productPage uber];
      if (v13)
      {
        long long v14 = [(SUUIProductPage *)self->_productPage uber];
        BOOL v15 = [v14 colorScheme];
        uint64_t v16 = [v15 backgroundColor];
        if (v16)
        {
          [v12 setBackgroundColor:v16];
        }
        else
        {
          char v17 = [MEMORY[0x263F825C8] whiteColor];
          [v12 setBackgroundColor:v17];
        }
      }
      else
      {
        [v12 setBackgroundColor:0];
      }

      [(SSVLoadURLOperation *)self->_loadUberOperation setDataConsumer:v12];
      objc_initWeak(&location, self);
      id v18 = self->_loadUberOperation;
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke;
      v23 = &unk_265400BC0;
      objc_copyWeak(&v24, &location);
      [(SSVLoadURLOperation *)v18 setOutputBlock:&v20];
      double v19 = [(SUUIProductPageHeaderViewController *)self operationQueue];
      [v19 addOperation:self->_loadUberOperation];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

void __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setUberWithImage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_reloadItemStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = self;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = [(SUUIProductPage *)self->_productPage item];
  item = v5;
  if (!v5) {
    item = v4->_item;
  }
  id v7 = item;
  id v8 = +[SUUIItemStateCenter defaultCenter];
  id v9 = objc_msgSend(v8, "stateForItemWithIdentifier:", -[SUUIItem itemIdentifier](v7, "itemIdentifier"));
  if ([(SUUIItem *)v7 itemKind] == 17)
  {
    if (v5 && v4->_personalizationState == 2)
    {
      BOOL v50 = v3;
      v52 = v9;
      v53 = v7;
      v57 = v4;
      v51 = v5;
      id v10 = [(SUUIItem *)v5 childItemIdentifiers];
      uint64_t v49 = [v10 count];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id obj = v10;
      uint64_t v11 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v60 != v17) {
              objc_enumerationMutation(obj);
            }
            double v19 = objc_msgSend(v8, "stateForItemWithIdentifier:", objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "longLongValue"));
            unint64_t v20 = [v19 state];

            if ((v20 & 2) != 0)
            {
              ++v16;
            }
            else if (v20)
            {
              ++v14;
            }
            else if ((v20 & 4) != 0)
            {
              ++v15;
            }
            else
            {
              v13 += (v20 >> 3) & 1;
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        }
        while (v12);
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
      }

      headerView = v57->_headerView;
      if (v57->_personalizedOffer)
      {
        -[SUUIProductPageHeaderView setItemOffer:](v57->_headerView, "setItemOffer:");
      }
      else
      {
        float v27 = [(SUUIItem *)v53 primaryItemOffer];
        [(SUUIProductPageHeaderView *)headerView setItemOffer:v27];
      }
      id v9 = v52;
      if (v14 > 0 || ([v52 state] & 1) != 0)
      {
        char v4 = v57;
        id v29 = v57;
        uint64_t v30 = 1;
LABEL_36:
        [(SUUIProductPageHeaderViewController *)v29 _showSynthesizedItemStateWithFlag:v30 animated:v50];
        id v5 = v51;
        id v7 = v53;
LABEL_37:

        goto LABEL_24;
      }
      if (v16 >= 1 && v16 + v15 == v49)
      {
        char v4 = v57;
        clientContext = v57->_clientContext;
        if (clientContext) {
          [(SUUIClientContext *)clientContext localizedStringForKey:@"APP_BUNDLE_DOWNLOADING" inTable:@"ProductPage"];
        }
        else {
        id v32 = +[SUUIClientContext localizedStringForKey:@"APP_BUNDLE_DOWNLOADING" inBundles:0 inTable:@"ProductPage"];
        }
        id v5 = v51;
        id v7 = v53;
        BOOL v33 = v50;
        double v34 = v57;
        double v35 = v32;
LABEL_51:
        [(SUUIProductPageHeaderViewController *)v34 _disableItemOfferButtonWithTitle:v35 animated:v33];

        goto LABEL_37;
      }
      if (v15 >= 1 && v15 == v49)
      {
        char v4 = v57;
        long long v31 = v57->_clientContext;
        if (v31) {
          [(SUUIClientContext *)v31 localizedStringForKey:@"APP_BUNDLE_INSTALLED" inTable:@"ProductPage"];
        }
        else {
        id v32 = +[SUUIClientContext localizedStringForKey:@"APP_BUNDLE_INSTALLED" inBundles:0 inTable:@"ProductPage"];
        }
        id v5 = v51;
        id v7 = v53;
        double v34 = v57;
        double v35 = v32;
        BOOL v33 = v50;
        goto LABEL_51;
      }
      if (v13 >= 1 && v15 + v13 == v49)
      {
        char v4 = v57;
        id v29 = v57;
        uint64_t v30 = 8;
        goto LABEL_36;
      }
      char v4 = v57;
      double v36 = v57->_clientContext;
      if (v36) {
        [(SUUIClientContext *)v36 localizedStringForKey:@"PRODUCT_PAGE_COMPLETE_MY_BUNDLE_ORIGINAL_OFFER" inTable:@"ProductPage"];
      }
      else {
      double v37 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_COMPLETE_MY_BUNDLE_ORIGINAL_OFFER" inBundles:0 inTable:@"ProductPage"];
      }
      id v7 = v53;
      if (v57->_personalizedOffer)
      {
        v54 = v57->_headerView;
        v38 = NSString;
        double v39 = [(SUUIItem *)v7 primaryItemOffer];
        double v40 = [v39 buttonText];
        double v41 = [v38 stringWithValidatedFormat:v37, @"%@", 0, v40 validFormatSpecifiers error];
        [(SUUIProductPageHeaderView *)v54 setItemOfferExplanationText:v41];

        double v42 = v57->_headerView;
        double v43 = v57->_clientContext;
        id v5 = v51;
        if (v43) {
          [(SUUIClientContext *)v43 localizedStringForKey:@"PRODUCT_PAGE_COMPLETE_MY_BUNDLE_TITLE" inTable:@"ProductPage"];
        }
        else {
        uint64_t v44 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_COMPLETE_MY_BUNDLE_TITLE" inBundles:0 inTable:@"ProductPage"];
        }
        BOOL v47 = v50;
        [(SUUIProductPageHeaderView *)v42 setItemOfferExplanationTitle:v44];
      }
      else
      {
        id v5 = v51;
        uint64_t v44 = [(SUUIItem *)v51 regularPriceString];
        if (!v44)
        {
          [(SUUIProductPageHeaderView *)v57->_headerView setItemOfferExplanationText:0];
          [(SUUIProductPageHeaderView *)v57->_headerView setItemOfferExplanationTitle:0];
          BOOL v47 = v50;
LABEL_65:

          [(SUUIProductPageHeaderViewController *)v57 _setItemState:v9 animated:v47];
          goto LABEL_37;
        }
        v55 = v57->_headerView;
        double v45 = [NSString stringWithValidatedFormat:v37, @"%@", 0, v44 validFormatSpecifiers error];
        [(SUUIProductPageHeaderView *)v55 setItemOfferExplanationText:v45];

        id v56 = v57->_headerView;
        double v46 = v57->_clientContext;
        if (v46) {
          [(SUUIClientContext *)v46 localizedStringForKey:@"PRODUCT_PAGE_BUNDLE_OFFER_TITLE" inTable:@"ProductPage"];
        }
        else {
        v48 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_BUNDLE_OFFER_TITLE" inBundles:0 inTable:@"ProductPage"];
        }
        BOOL v47 = v50;
        [(SUUIProductPageHeaderView *)v56 setItemOfferExplanationTitle:v48];
      }
      id v9 = v52;
      goto LABEL_65;
    }
    [(SUUIProductPageHeaderView *)v4->_headerView setItemOffer:0];
    [(SUUIProductPageHeaderView *)v4->_headerView setItemOfferExplanationText:0];
    [(SUUIProductPageHeaderView *)v4->_headerView setItemOfferExplanationTitle:0];
    v23 = v4;
    id v24 = 0;
  }
  else
  {
    uint64_t v21 = v4->_headerView;
    uint64_t v22 = [(SUUIItem *)v7 primaryItemOffer];
    [(SUUIProductPageHeaderView *)v21 setItemOffer:v22];

    [(SUUIProductPageHeaderView *)v4->_headerView setItemOfferExplanationText:0];
    [(SUUIProductPageHeaderView *)v4->_headerView setItemOfferExplanationTitle:0];
    v23 = v4;
    id v24 = v9;
  }
  [(SUUIProductPageHeaderViewController *)v23 _setItemState:v24 animated:v3];
LABEL_24:
  v25 = [(SUUIProductPageHeaderView *)v4->_headerView itemOfferButton];
  [v25 removeTarget:v4 action:0 forControlEvents:0x20000];
  [v25 addTarget:v4 action:sel__itemOfferButtonAction_ forControlEvents:0x20000];
  [v25 setHidden:v4->_askPermission];
}

- (id)_segmentedControlTitles
{
  v14[3] = *MEMORY[0x263EF8340];
  clientContext = self->_clientContext;
  if (clientContext)
  {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_DETAILS_TAB" inTable:@"ProductPage"];
  }
  else
  {
    id v4 = 0;
    +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_DETAILS_TAB" inBundles:0 inTable:@"ProductPage"];
  id v5 = };

  v14[0] = v5;
  id v6 = self->_clientContext;
  if (v6)
  {
    [(SUUIClientContext *)v6 localizedStringForKey:@"PRODUCT_PAGE_REVIEWS_TAB", @"ProductPage", v14[0] inTable];
  }
  else
  {
    id v7 = 0;
    +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_REVIEWS_TAB", 0, @"ProductPage", v14[0] inBundles inTable];
  id v8 = };

  v14[1] = v8;
  id v9 = self->_clientContext;
  if (v9)
  {
    [(SUUIClientContext *)v9 localizedStringForKey:@"PRODUCT_PAGE_RELATED_TAB" inTable:@"ProductPage"];
  }
  else
  {
    id v10 = 0;
    +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_RELATED_TAB" inBundles:0 inTable:@"ProductPage"];
  uint64_t v11 = };

  v14[2] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (void)_sendDidReloadOffer
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = [(SUUIProductPageHeaderViewController *)self _activeItem];
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    id v7 = v6;
    if (self->_personalizedOffer)
    {
      objc_msgSend(v6, "productPageHeaderView:didReloadItemOffer:", self);
    }
    else
    {
      id v8 = [v9 primaryItemOffer];
      [v7 productPageHeaderView:self didReloadItemOffer:v8];
    }
  }
}

- (void)_setArtworkWithImage:(id)a3 error:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    [(SUUIProductPageHeaderView *)self->_headerView setIconImage:self->_iconImage];
  }
  loadIconOperation = self->_loadIconOperation;
  self->_loadIconOperation = 0;
}

- (void)_setPersonalizedOffer:(id)a3
{
  self->_personalizationState = 2;
  objc_storeStrong((id *)&self->_personalizedOffer, a3);
  [(SUUIProductPageHeaderViewController *)self _reloadItemStateAnimated:0];
  [(SUUIProductPageHeaderViewController *)self _sendDidReloadOffer];
}

- (void)_setItemState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  headerView = self->_headerView;
  id v8 = a3;
  id v7 = [(SUUIProductPageHeaderView *)headerView itemOfferButton];
  [v7 setEnabled:1];

  [(SUUIProductPageHeaderView *)self->_headerView setItemState:v8 animated:v4];
}

- (void)_setUberWithImage:(id)a3 error:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_uberImage, a3);
    [(SUUIProductPageHeaderView *)self->_headerView setHeaderImage:self->_uberImage];
  }
  loadUberOperation = self->_loadUberOperation;
  self->_loadUberOperation = 0;
}

- (void)_showActivityViewControllerFromView:(id)a3
{
  id v4 = a3;
  if (!self->_activityPopoverController)
  {
    char v5 = [SUUIProductPageActivityViewController alloc];
    id v6 = [(SUUIProductPage *)self->_productPage item];
    id v7 = [(SUUIProductPageActivityViewController *)v5 initWithProductPageItem:v6 clientContext:self->_clientContext];

    objc_initWeak(&location, self);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __75__SUUIProductPageHeaderViewController__showActivityViewControllerFromView___block_invoke;
    id v24 = &unk_265402E28;
    objc_copyWeak(&v25, &location);
    [(SUUIProductPageActivityViewController *)v7 setCompletionWithItemsHandler:&v21];
    id v8 = objc_alloc(MEMORY[0x263F82AA0]);
    id v9 = (UIPopoverController *)objc_msgSend(v8, "initWithContentViewController:", v7, v21, v22, v23, v24);
    activityPopoverController = self->_activityPopoverController;
    self->_activityPopoverController = v9;

    uint64_t v11 = self->_activityPopoverController;
    [v4 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    unint64_t v20 = [v4 superview];
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v11, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v20, 15, 1, v13, v15, v17, v19);

    [(UIPopoverController *)self->_activityPopoverController setDelegate:self];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  self->_wantsActivityViewController = 0;
}

void __75__SUUIProductPageHeaderViewController__showActivityViewControllerFromView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _destroyPopoverController];
}

- (void)_showAskPermissionBanner
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 productPageHeaderViewDidWantAskPermissionBanner:self];
  }
  headerView = self->_headerView;
  [(SUUIProductPageHeaderView *)headerView setRestricted:1];
}

- (void)_showSynthesizedItemStateWithFlag:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = objc_alloc_init(SUUIItemState);
  id v7 = NSNumber;
  id v8 = [(SUUIProductPageHeaderViewController *)self _activeItem];
  id v9 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "itemIdentifier"));
  [(SUUIItemState *)v10 setItemIdentifier:v9];

  [(SUUIItemState *)v10 setState:a3];
  [(SUUIProductPageHeaderViewController *)self _setItemState:v10 animated:v4];
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIProductPageHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIProductPageHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUIItem)item
{
  return self->_item;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_uberImage, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_personalizedOffer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadUberOperation, 0);
  objc_storeStrong((id *)&self->_loadIconOperation, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);
  objc_storeStrong((id *)&self->_contentRatingArtworkLoader, 0);
  objc_storeStrong((id *)&self->_activityPopoverController, 0);
}

@end