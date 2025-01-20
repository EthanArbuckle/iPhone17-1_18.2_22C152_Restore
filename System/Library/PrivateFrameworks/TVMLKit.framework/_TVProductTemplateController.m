@interface _TVProductTemplateController
- (BOOL)_backgroundImageRequiresBlur;
- (BOOL)_isBackdropNeeded;
- (BOOL)_shouldShowTopHeroImage;
- (BOOL)_shouldUsePartialScrollingTemplate;
- (BOOL)_sportsLandscapePhone;
- (BOOL)_sportsLandscapePhoneIsOverlaySection:(id)a3;
- (BOOL)automaticallyAdjustsScrollViewInsets;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)_backgroundImageProxySize;
- (CGSize)_maxContentSize;
- (CGSize)_topHeroImageViewSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)_cellMarginForIndex:(int64_t)a3 partialMargins:(UIEdgeInsets *)a4;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)_largeTitleHeight;
- (id)_adamIDForElement:(id)a3;
- (id)_backgroundImageProxy;
- (id)_canonicalIDForElement:(id)a3;
- (id)_relatedSectionHeaderView;
- (id)_spacingMetricsForViewControllers:(id)a3 contentSize:(CGSize *)a4;
- (id)_yOffsetForView:(id)a3 withScrollView:(id)a4 targetYOffset:(double)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_blurEffectStyle;
- (int64_t)_overrideLargeTitleDisplayMode;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)_lastFocusableCellIndex;
- (void)_cancelImpressionsUpdate;
- (void)_configureBackgroundTintView;
- (void)_configureTopHeroImage:(id)a3;
- (void)_configureWithBannerElement:(id)a3;
- (void)_configureWithBgElement:(id)a3;
- (void)_recordImpressionsForVisibleView;
- (void)_updateBackgroundTintView;
- (void)_updateBackgroundTintViewEffects;
- (void)_updateImpressions;
- (void)_updateTopHeroImageOverlay;
- (void)_updateTopHeroImageVisibility:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureAppearanceTransition;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _TVProductTemplateController

- (void)updateWithViewElement:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v96.receiver = self;
  v96.super_class = (Class)_TVProductTemplateController;
  [(_TVBgImageLoadingViewController *)&v96 updateWithViewElement:v5];
  objc_storeStrong((id *)&self->_templateElement, a3);
  p_templateElement = &self->_templateElement;
  v6 = [(IKViewElement *)self->_templateElement elementName];
  self->_sportsProductTemplate = [v6 isEqualToString:@"productSportsBundleTemplate"];

  v7 = [v5 appDocument];
  [v7 impressionThreshold];
  self->_impressionThreshold = v8;

  id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
  v80 = (void *)[(NSArray *)self->_viewControllers mutableCopy];
  topHeroImageElement = self->_topHeroImageElement;
  self->_topHeroImageElement = 0;

  backdropTintElement = self->_backdropTintElement;
  location = (id *)&self->_backdropTintElement;
  self->_backdropTintElement = 0;

  backdropTintViewController = self->_backdropTintViewController;
  p_backdropTintViewController = (id *)&self->_backdropTintViewController;
  self->_backdropTintViewController = 0;

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v71 = v5;
  v12 = [v5 children];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v92 objects:v99 count:16];
  if (!v13)
  {
    v79 = 0;
    id v15 = 0;
    obuint64_t j = 0;
    goto LABEL_56;
  }
  uint64_t v14 = v13;
  v79 = 0;
  id v15 = 0;
  obuint64_t j = 0;
  uint64_t v16 = *(void *)v93;
  v74 = self;
  v78 = v12;
  uint64_t v81 = *(void *)v93;
  do
  {
    uint64_t v17 = 0;
    uint64_t v82 = v14;
    do
    {
      if (*(void *)v93 != v16) {
        objc_enumerationMutation(v12);
      }
      id v18 = *(id *)(*((void *)&v92 + 1) + 8 * v17);
      uint64_t v19 = objc_msgSend(v18, "tv_elementType");
      switch(v19)
      {
        case 16:
          [(_TVProductTemplateController *)self _configureTopHeroImage:v18];
          goto LABEL_52;
        case 12:
          if (v15) {
            goto LABEL_52;
          }
          id v15 = v18;
          v20 = [v15 autoHighlightIdentifier];
          uint64_t v21 = [v20 length];

          if (v21)
          {
            if (!obj)
            {
              obuint64_t j = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
            }
            [v15 resetProperty:2];
          }
          break;
        case 4:
          [(_TVProductTemplateController *)self _configureWithBgElement:v18];
          goto LABEL_52;
        default:
          if (v15 != v18)
          {
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v22 = v80;
            v23 = (UIViewController *)[v22 countByEnumeratingWithState:&v88 objects:v98 count:16];
            if (v23)
            {
              id v76 = v15;
              uint64_t v24 = *(void *)v89;
              while (2)
              {
                for (i = 0; i != v23; i = (UIViewController *)((char *)i + 1))
                {
                  if (*(void *)v89 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  v26 = *(void **)(*((void *)&v88 + 1) + 8 * i);
                  v27 = objc_msgSend(v26, "tv_associatedIKViewElement");
                  v28 = [[_TVShadowViewElementID alloc] initWithViewElement:v27];
                  v29 = [[_TVShadowViewElementID alloc] initWithViewElement:v18];
                  if ([(_TVShadowViewElementID *)v28 isEqual:v29])
                  {
                    v23 = v26;

                    goto LABEL_28;
                  }
                }
                v23 = (UIViewController *)[v22 countByEnumeratingWithState:&v88 objects:v98 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
LABEL_28:
              self = v74;
              id v15 = v76;
              v12 = v78;
            }

            int v30 = 0;
            goto LABEL_30;
          }
          break;
      }
      v23 = self->_bannerViewController;
      int v30 = 1;
LABEL_30:
      v31 = +[TVInterfaceFactory sharedInterfaceFactory];
      v32 = [v31 _viewControllerFromElement:v18 existingController:v23];

      if (v32) {
        goto LABEL_31;
      }
      id v38 = v15;
      v39 = +[TVInterfaceFactory sharedInterfaceFactory];
      v40 = [(UIViewController *)v23 view];
      v41 = [v39 _viewFromElement:v18 existingView:v40];

      if (!v41)
      {
        v32 = 0;
        id v15 = v38;
        v12 = v78;
        goto LABEL_48;
      }
      objc_opt_class();
      v42 = (objc_opt_isKindOfClass() & 1) != 0
          ? v23
          : (UIViewController *)objc_alloc_init(MEMORY[0x263F1CB68]);
      v32 = v42;
      [(UIViewController *)v42 setView:v41];
      [(UIViewController *)v32 tv_setAssociatedIKViewElement:v18];

      id v15 = v38;
      v12 = v78;
      if (v32)
      {
LABEL_31:
        if (!v30)
        {
          v33 = [v18 attributes];
          v34 = [v33 objectForKeyedSubscript:@"markBackgroundSegment"];
          int v35 = [v34 BOOLValue];

          if (v35)
          {
            objc_storeStrong(location, v18);
            objc_storeStrong(p_backdropTintViewController, v32);
          }
          v36 = [v18 autoHighlightIdentifier];
          uint64_t v37 = [v36 length];

          if (v37)
          {
            uint64_t v16 = v81;
            uint64_t v14 = v82;
            if (!obj)
            {
              objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v75, "count"), 1);
              obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
            }
            [v18 resetProperty:2];
          }
          else
          {
            uint64_t v16 = v81;
            uint64_t v14 = v82;
          }
          [v75 addObject:v32];
          if (!v23) {
            goto LABEL_51;
          }
LABEL_49:
          if (v23 == v32) {
            [v80 removeObjectIdenticalTo:v23];
          }
          goto LABEL_51;
        }
        v32 = v32;

        v79 = v32;
      }
LABEL_48:
      uint64_t v16 = v81;
      uint64_t v14 = v82;
      if (v23) {
        goto LABEL_49;
      }
LABEL_51:

LABEL_52:
      ++v17;
    }
    while (v17 != v14);
    uint64_t v14 = [v12 countByEnumeratingWithState:&v92 objects:v99 count:16];
  }
  while (v14);
LABEL_56:

  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  self->_lastFocusedIndexPath = 0;

  objc_storeStrong((id *)&self->_autoHighlightIndexPath, obj);
  if ([v80 count])
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v44 = v80;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v84 objects:v97 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v85 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v84 + 1) + 8 * j);
          [v49 willMoveToParentViewController:0];
          v50 = [v49 view];
          [v50 removeFromSuperview];

          [v49 removeFromParentViewController];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v84 objects:v97 count:16];
      }
      while (v46);
    }

    BOOL v51 = 1;
    v52 = v71;
  }
  else
  {
    v52 = v71;
    BOOL v51 = [v71 updateType] != 1;
  }
  v53 = (NSArray *)[v75 copy];
  viewControllers = self->_viewControllers;
  self->_viewControllers = v53;

  CGSize v83 = (CGSize)*MEMORY[0x263F001B0];
  v55 = [(_TVProductTemplateController *)self _spacingMetricsForViewControllers:self->_viewControllers contentSize:&v83];
  rowSpacingMetricsList = self->_rowSpacingMetricsList;
  self->_rowSpacingMetricsList = v55;

  if (self->_preloadContentSize.width != v83.width || self->_preloadContentSize.height != v83.height)
  {
    self->_preloadOnLayout = 1;
    self->_preloadContentSize = v83;
  }
  [(_TVProductTemplateController *)self _configureWithBannerElement:v15];
  objc_storeStrong((id *)&self->_bannerViewController, v79);
  self->_preloadContentSize.double height = self->_productBannerHeight + self->_preloadContentSize.height;
  if ([(_TVProductTemplateController *)self _shouldUsePartialScrollingTemplate])
  {
    double height = self->_preloadContentSize.height;
  }
  else
  {
    NSUInteger v59 = [(NSArray *)self->_viewControllers count];
    double height = self->_preloadContentSize.height;
    if (v59) {
      double height = height + 70.0 + 89.0;
    }
  }
  self->_preloadContentSize.double height = height + 500.0;
  if ([(_TVProductTemplateController *)self isViewLoaded])
  {
    collectionView = self->_collectionView;
    if (v51)
    {
      [(UICollectionView *)collectionView reloadData];
    }
    else
    {
      v61 = [(UICollectionView *)collectionView collectionViewLayout];
      [v61 invalidateLayout];
    }
    [v52 updateType];
  }
  id v62 = (id)[(_TVProductTemplateController *)self view];
  [(UICollectionView *)self->_collectionView setSemanticContentAttribute:[(IKViewElement *)*p_templateElement tv_semanticContentAttribute]];
  v63 = [(_TVProductTemplateController *)self _adamIDForElement:*p_templateElement];
  if (v63)
  {
    v64 = (void *)[objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:@"com.apple.iTunes.externalMediaContent"];
    [v64 setExternalMediaContentIdentifier:v63];
    [(_TVProductTemplateController *)self setUserActivity:v64];
  }
  else
  {
    v64 = [(_TVProductTemplateController *)self _canonicalIDForElement:*p_templateElement];
    if (v64)
    {
      v65 = (void *)[objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:@"com.apple.UMC.externalMediaContent"];
      [v65 setExternalMediaContentIdentifier:v64];
      [(_TVProductTemplateController *)self setUserActivity:v65];
    }
  }

  [(_TVProductTemplateController *)self _configureBackgroundTintView];
  v66 = [v52 style];
  v67 = objc_msgSend(v66, "tv_backgroundColor");
  v68 = [v67 color];

  v69 = [(_TVProductTemplateController *)self view];
  [v69 setBackgroundColor:v68];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  id v13 = (id)objc_msgSend(v3, "initWithFrame:");

  [(_TVProductTemplateController *)self setView:v13];
  id v5 = objc_alloc_init(_TVCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v5 setMinimumLineSpacing:0.0];
  [(UICollectionViewFlowLayout *)v5 setMinimumInteritemSpacing:0.0];
  v6 = [_TVStackCollectionView alloc];
  v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 bounds];
  double v8 = -[_TVStackCollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v5);

  v9 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)v8 setBackgroundColor:v9];

  [(UICollectionView *)v8 setDelegate:self];
  [(UICollectionView *)v8 setDataSource:self];
  [(UICollectionView *)v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TVProductCellIdentifier"];
  [(UICollectionView *)v8 setAutoresizingMask:18];
  [(UICollectionView *)v8 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x263F1D120] withReuseIdentifier:@"TVProductHeaderCellIdentifier"];
  [(UICollectionView *)v8 setShowsVerticalScrollIndicator:0];
  v10 = [MEMORY[0x263F1C550] whiteColor];
  [(UICollectionView *)v8 setBackgroundColor:v10];

  [(UICollectionView *)v8 setAlwaysBounceVertical:1];
  [(UICollectionView *)v8 _setContentInsetAdjustmentBehavior:0];
  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v12 = v8;

  [v13 addSubview:self->_collectionView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVProductTemplateController;
  [(_TVBgImageLoadingViewController *)&v6 viewDidAppear:a3];
  if (self->_bgImageElement && !self->_fadedIn)
  {
    self->_fadedIn = 1;
    dispatch_time_t v4 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46___TVProductTemplateController_viewDidAppear___block_invoke;
    block[3] = &unk_264BA69A0;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
    [(_TVProductTemplateController *)self performSelector:sel__updateImpressions withObject:0 afterDelay:0.7];
  }
  else
  {
    [(_TVProductTemplateController *)self _updateImpressions];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[CALayer setFilters:](self->_bgBlurSublayer, "setFilters:", 0, a4);
  [(CALayer *)self->_bgBlurSublayer removeAnimationForKey:@"blurRadiusAnimation"];
  bgBlurSublayer = self->_bgBlurSublayer;
  [(CALayer *)bgBlurSublayer removeFromSuperlayer];
}

- (void)viewWillAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)_TVProductTemplateController;
  [(_TVBgImageLoadingViewController *)&v16 viewWillAppear:a3];
  if (self->_autoHighlightIndexPath)
  {
    double v4 = *MEMORY[0x263F00148];
    id v5 = -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:");
    [v5 frame];
    -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v4, CGRectGetMinY(v18));
    [(_TVProductTemplateController *)self scrollViewDidScroll:self->_collectionView];
  }
  if (self->_bgImageElement && !self->_fadedIn && !self->_bgBlurSublayer)
  {
    id v6 = objc_alloc(MEMORY[0x263F157C8]);
    v7 = (void *)[v6 initWithType:*MEMORY[0x263F15BC8]];
    [v7 setValue:&unk_26E59EC48 forKey:@"inputRadius"];
    [v7 setValue:@"low" forKey:@"inputQuality"];
    [v7 setValue:&unk_26E59E368 forKey:@"inputHardEdges"];
    [v7 setName:@"blurFilter"];
    double v8 = [MEMORY[0x263F157E8] layer];
    bgBlurSublayer = self->_bgBlurSublayer;
    self->_bgBlurSublayer = v8;

    [(CALayer *)self->_bgBlurSublayer setContents:[(UIImage *)self->_bgImage CGImage]];
    v10 = self->_bgBlurSublayer;
    v17[0] = v7;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(CALayer *)v10 setFilters:v11];

    v12 = self->_bgBlurSublayer;
    id v13 = [(UIImageView *)self->_bgImageView layer];
    [v13 frame];
    -[CALayer setFrame:](v12, "setFrame:");

    uint64_t v14 = [(UIImageView *)self->_bgImageView layer];
    [v14 addSublayer:self->_bgBlurSublayer];
  }
  id v15 = [(_TVProductTemplateController *)self userActivity];
  [v15 becomeCurrent];
}

- (void)configureAppearanceTransition
{
  v40[1] = *MEMORY[0x263EF8340];
  BOOL v3 = self->_topHeroImageVisible
    && [(_TVProductTemplateController *)self _shouldShowTopHeroImage];
  double v4 = [(_TVProductTemplateController *)self parentViewController];
  id v5 = [v4 navigationItem];

  id v6 = [(_TVProductTemplateController *)self navigationController];
  v7 = [v6 visibleViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [(_TVProductTemplateController *)self navigationController];
    v9 = [v8 visibleViewController];
    v10 = [v9 templateViewController];
    int v11 = [v10 isEqual:self];
  }
  else
  {
    int v11 = 0;
  }

  v12 = [(_TVProductTemplateController *)self transitionCoordinator];
  if (v12 && (topHeroImageView = self->_topHeroImageView, v12, topHeroImageView))
  {
    self->_lightStatusBar = v3;
    objc_initWeak(location, self);
    uint64_t v14 = [(_TVProductTemplateController *)self transitionCoordinator];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __61___TVProductTemplateController_configureAppearanceTransition__block_invoke;
    v35[3] = &unk_264BA76F8;
    char v38 = v11;
    objc_copyWeak(&v37, location);
    BOOL v39 = v3;
    id v15 = v5;
    id v36 = v15;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __61___TVProductTemplateController_configureAppearanceTransition__block_invoke_2;
    v30[3] = &unk_264BA76F8;
    char v33 = v11;
    objc_copyWeak(&v32, location);
    BOOL v34 = v3;
    id v31 = v15;
    [v14 animateAlongsideTransition:v35 completion:v30];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v37);
    objc_destroyWeak(location);
  }
  else if (self->_topHeroImageView)
  {
    if (v11)
    {
      objc_super v16 = [(_TVProductTemplateController *)self navigationController];
      uint64_t v17 = [v16 navigationBar];
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (v3) {
      double v18 = 0.0;
    }
    else {
      double v18 = 1.0;
    }
    [v17 _setBackgroundOpacity:v18];
    [v17 _setTitleOpacity:v18];
    if (v3)
    {
      [v5 setTitle:0];
      [MEMORY[0x263F1C550] whiteColor];
    }
    else
    {
      uint64_t v19 = [(_TVProductTemplateController *)self navigationItem];
      v20 = [v19 title];
      [v5 setTitle:v20];

      objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
    uint64_t v21 = };
    [v17 setTintColor:v21];

    self->_lightStatusBar = v3;
    [(_TVProductTemplateController *)self setNeedsStatusBarAppearanceUpdate];
    if (self->_sportsProductTemplate)
    {
      if ([(_TVProductTemplateController *)self _sportsLandscapePhone])
      {
        id v22 = [(UICollectionView *)self->_collectionView visibleSupplementaryViewsOfKind:*MEMORY[0x263F1D120]];
        v23 = [v22 firstObject];
        uint64_t v24 = [(UIViewController *)self->_bannerViewController view];
        [v23 addSubview:v24];

        [(_TVProductTemplateController *)self _updateTopHeroImageOverlay];
      }
      collectionView = self->_collectionView;
      v26 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
      v40[0] = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
      [(UICollectionView *)collectionView reloadItemsAtIndexPaths:v27];

      *(_OWORD *)location = *MEMORY[0x263F00148];
      -[_TVProductTemplateController scrollViewWillEndDragging:withVelocity:targetContentOffset:](self, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", self->_collectionView, location, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", *(double *)location, *(double *)&location[1]);
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)_TVProductTemplateController;
    [(_TVBgImageLoadingViewController *)&v28 configureAppearanceTransition];
  }
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVProductTemplateController;
  [(_TVProductTemplateController *)&v5 viewWillDisappear:a3];
  double v4 = [(_TVProductTemplateController *)self userActivity];
  [v4 resignCurrent];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVProductTemplateController;
  [(_TVBgImageLoadingViewController *)&v4 viewDidDisappear:a3];
  [(_TVProductTemplateController *)self _cancelImpressionsUpdate];
}

- (void)viewDidLayoutSubviews
{
  v64.receiver = self;
  v64.super_class = (Class)_TVProductTemplateController;
  [(_TVBgImageLoadingViewController *)&v64 viewDidLayoutSubviews];
  if (self->_preloadContentSize.width > 0.0 && self->_preloadContentSize.height > 0.0)
  {
    if (self->_preloadOnLayout)
    {
      self->_preloadOnLayout = 0;
      -[UICollectionView _ensureViewsAreLoadedInRect:](self->_collectionView, "_ensureViewsAreLoadedInRect:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    BOOL v3 = [(_TVProductTemplateController *)self view];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v65.origin.x = v5;
    v65.origin.y = v7;
    v65.size.width = v9;
    v65.size.double height = v11;
    double Height = CGRectGetHeight(v65);
    double v13 = Height - self->_productBannerHeight;
    [(UICollectionView *)self->_collectionView contentOffset];
    double v15 = fmin(v13 + v14, Height);
    double v16 = Height - v15;
    v66.origin.x = v5;
    v66.origin.y = v7;
    v66.size.width = v9;
    v66.size.double height = v11;
    -[UIView setFrame:](self->_backdropView, "setFrame:", 0.0, v16, CGRectGetWidth(v66), v15);
    uint64_t v17 = [(UIImageView *)self->_vignetteView image];
    [v17 size];
    double v19 = v18;
    double v21 = v20;

    -[UIImageView setFrame:](self->_vignetteView, "setFrame:", 0.0, v16 - v21, v19, v21);
  }
  id v22 = [(IKViewElement *)self->_templateElement style];
  objc_msgSend(v22, "tv_margin");
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  if (!self->_topHeroImageView)
  {
    topHeroImageView = 0;
LABEL_18:
    [(UIImageView *)topHeroImageView setHidden:1];
    [(UIImageView *)self->_topHeroGradientView setHidden:1];
    [(UIView *)self->_topHeroSeparatorView setHidden:1];
    [(UICollectionView *)self->_collectionView _setContentInsetAdjustmentBehavior:0];
    goto LABEL_21;
  }
  if (![(_TVProductTemplateController *)self _shouldShowTopHeroImage])
  {
    topHeroImageView = self->_topHeroImageView;
    goto LABEL_18;
  }
  [(UICollectionView *)self->_collectionView _setContentInsetAdjustmentBehavior:2];
  id v31 = [(_TVProductTemplateController *)self view];
  [v31 safeAreaInsets];
  double v33 = v32;

  if (([(UICollectionView *)self->_collectionView isDragging] & 1) == 0
    && ([(UICollectionView *)self->_collectionView isDecelerating] & 1) == 0)
  {
    [(_TVProductTemplateController *)self _topHeroImageViewSize];
    double v35 = v34;
    CGFloat rect = v34;
    id v36 = [(_TVProductTemplateController *)self view];
    [v36 bounds];
    double Width = CGRectGetWidth(v67);

    -[UIImageView setFrame:](self->_topHeroImageView, "setFrame:", 0.0, 0.0, Width, v35);
    [(UIImageView *)self->_topHeroGradientView frame];
    uint64_t v61 = v39;
    uint64_t v62 = v38;
    v40 = [(_TVProductTemplateController *)self view];
    [v40 bounds];
    CGFloat v41 = CGRectGetWidth(v68);

    v42 = [(UIImageView *)self->_topHeroGradientView image];
    [v42 size];
    double v44 = v43;

    uint64_t v45 = [(_TVProductTemplateController *)self view];
    [v45 safeAreaInsets];
    double v47 = v46 + 30.0;

    if (v44 >= v47) {
      double v48 = v44;
    }
    else {
      double v48 = v47;
    }
    topHeroGradientView = self->_topHeroGradientView;
    uint64_t v51 = v61;
    uint64_t v50 = v62;
    CGFloat v52 = v41;
    CGRect v69 = CGRectIntegral(*(CGRect *)(&v48 - 3));
    -[UIImageView setFrame:](topHeroGradientView, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    v70.origin.x = 0.0;
    v70.origin.y = 0.0;
    v70.size.width = Width;
    v70.size.double height = rect;
    double MaxY = CGRectGetMaxY(v70);
    v54 = [(_TVProductTemplateController *)self view];
    [v54 bounds];
    double v55 = CGRectGetWidth(v71);
    v56 = [MEMORY[0x263F1C920] mainScreen];
    [v56 scale];
    double v58 = 1.0 / v57;

    -[UIView setFrame:](self->_topHeroSeparatorView, "setFrame:", 0.0, MaxY, v55, v58);
  }
  [(UIImageView *)self->_topHeroImageView setHidden:0];
  NSUInteger v59 = self->_topHeroGradientView;
  if (self->_sportsProductTemplate)
  {
    [(UIImageView *)v59 setHidden:1];
    [(_TVProductTemplateController *)self _updateTopHeroImageOverlay];
  }
  else
  {
    [(UIImageView *)v59 setHidden:0];
  }
  double v28 = v28 + v33;
  [(UIView *)self->_topHeroSeparatorView setHidden:0];
  double v24 = 0.0;
LABEL_21:
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v24, v26, v28, v30);
}

- (int64_t)_overrideLargeTitleDisplayMode
{
  if (self->_topHeroImageView) {
    return 2;
  }
  v3.receiver = self;
  v3.super_class = (Class)_TVProductTemplateController;
  return [(_TVBgImageLoadingViewController *)&v3 _overrideLargeTitleDisplayMode];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_TVProductTemplateController;
  id v7 = a4;
  -[_TVProductTemplateController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83___TVProductTemplateController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264BA6BC0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"TVProductCellIdentifier" forIndexPath:v5];
  if ([v5 section])
  {
    uint64_t v7 = [v5 item];
    double v8 = [(NSArray *)self->_viewControllers objectAtIndex:v7];
    long long v9 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    long long v21 = *MEMORY[0x263F1D1C0];
    long long v22 = v9;
    [(_TVProductTemplateController *)self _cellMarginForIndex:v7 partialMargins:&v21];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    objc_msgSend(v6, "setPartialMargins:", v21, v22);
    objc_msgSend(v6, "setMargins:", v11, v13, v15, v17);
    if (!v7) {
      objc_msgSend(v6, "enableWithMargins:", v11, v13, v15, v17);
    }
  }
  else
  {
    double v8 = self->_bannerViewController;
    [(_TVProductCollectionViewCell *)self->_bannerCell setViewController:0];
    objc_storeStrong((id *)&self->_bannerCell, v6);
  }
  if ([(_TVProductTemplateController *)self _sportsLandscapePhoneIsOverlaySection:v5])
  {
    [v6 setViewController:0];
  }
  else
  {
    [v6 setViewController:v8];
    double v18 = [v6 contentView];
    double v19 = [(UIViewController *)v8 view];
    [v18 addSubview:v19];
  }
  return v6;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  collectionView = self->_collectionView;
  uint64_t v7 = *MEMORY[0x263F1D120];
  id v8 = a5;
  long long v9 = [(UICollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:v7 withReuseIdentifier:@"TVProductHeaderCellIdentifier" forIndexPath:v8];
  [v9 addSubview:self->_topHeroImageView];
  [v9 addSubview:self->_topHeroSeparatorView];
  LODWORD(v7) = [(_TVProductTemplateController *)self _sportsLandscapePhoneIsOverlaySection:v8];

  if (v7)
  {
    double v10 = [(UIViewController *)self->_bannerViewController view];
    [v9 addSubview:v10];

    [(_TVProductTemplateController *)self _updateTopHeroImageOverlay];
  }
  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return [(NSArray *)self->_viewControllers count];
  }
  else {
    return self->_bannerViewController != 0;
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  autoHighlightIndexPath = self->_autoHighlightIndexPath;
  if (!autoHighlightIndexPath) {
    autoHighlightIndexPath = self->_lastFocusedIndexPath;
  }
  return autoHighlightIndexPath;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  self->_autoHighlightIndexPath = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6 = objc_msgSend(a4, "viewController", a3);
  uint64_t v7 = v6;
  if (v6)
  {
    double v10 = (UIViewController *)v6;
    id v8 = [(_TVProductTemplateController *)self childViewControllers];
    char v9 = [v8 containsObject:v10];

    uint64_t v7 = (uint64_t)v10;
    if ((v9 & 1) == 0)
    {
      [(_TVProductTemplateController *)self addChildViewController:v10];
      uint64_t v6 = [(UIViewController *)v10 didMoveToParentViewController:self];
      uint64_t v7 = (uint64_t)v10;
      if (v10 == self->_backdropTintViewController)
      {
        uint64_t v6 = [(_TVProductTemplateController *)self _updateBackgroundTintView];
        uint64_t v7 = (uint64_t)v10;
      }
    }
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  uint64_t v6 = [v10 viewController];
  if (v6)
  {
    uint64_t v7 = [(_TVProductTemplateController *)self childViewControllers];
    if ([v7 containsObject:v6])
    {
      id v8 = [v6 view];
      int v9 = [v8 isDescendantOfView:v10];

      if (v9)
      {
        [v6 willMoveToParentViewController:0];
        [v6 removeFromParentViewController];
      }
    }
    else
    {
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v9 = (double *)MEMORY[0x263F001B0];
  if ([v8 section])
  {
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", [v8 item]);
    id v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = self->_bannerViewController;
  }
  double v11 = v10;
  double v12 = *v9;
  double v13 = v9[1];
  if (v10)
  {
    double v14 = [(UIViewController *)v10 view];
    [v7 bounds];
    double Width = CGRectGetWidth(v24);
    double v16 = Width;
    if (v14)
    {
      objc_msgSend(v14, "tv_sizeThatFits:", Width, 0.0);
      double v12 = v17;
      double v13 = v18;
    }
    if (![(_TVProductTemplateController *)self _shouldUsePartialScrollingTemplate]
      && [v8 section] == 1
      && ![v8 item])
    {
      double v13 = v13 + 70.0 + 89.0;
    }
    if ([v8 section] == 1)
    {
      -[_TVProductTemplateController _cellMarginForIndex:partialMargins:](self, "_cellMarginForIndex:partialMargins:", [v8 item], 0);
      double v13 = v13 + v19 + v20;
    }
    if ([(_TVProductTemplateController *)self _sportsLandscapePhoneIsOverlaySection:v8])
    {
      double v13 = 1.0;
      double v12 = v16;
    }
  }
  double v21 = v12;
  double v22 = v13;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  if (a5)
  {
    double v5 = *MEMORY[0x263F1D1C0];
    double v6 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v7 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v8 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  else
  {
    int v9 = [(IKViewElement *)self->_productBannerElement style];
    objc_msgSend(v9, "tv_margin");
    double v5 = v10;
    double v6 = v11;
    double v7 = v12;
    double v8 = v13;
  }
  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  double v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_topHeroImageViewSize
{
  [(IKImageElement *)self->_topHeroImageElement tv_imageScaleToSize];
  double v4 = v3;
  double v6 = v5;
  if ([(_TVProductTemplateController *)self _sportsLandscapePhone])
  {
    double v7 = [(_TVProductTemplateController *)self view];
    [v7 frame];
    double v9 = v8;
    double v10 = [(_TVProductTemplateController *)self view];
    [v10 safeAreaInsets];
    double v6 = v9 - v11;
  }
  double v12 = v4;
  double v13 = v6;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if (a5 || ![(_TVProductTemplateController *)self _shouldShowTopHeroImage])
  {
    double v6 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    [(_TVProductTemplateController *)self _topHeroImageViewSize];
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v7 = (uint64_t)a3;
  uint64_t v8 = v7;
  if (self->_topHeroImageView)
  {
    uint64_t v18 = v7;
    uint64_t v7 = [(_TVProductTemplateController *)self _shouldShowTopHeroImage];
    uint64_t v8 = v18;
    if (v7)
    {
      [(_TVProductTemplateController *)self _topHeroImageViewSize];
      double v10 = v9;
      [(_TVProductTemplateController *)self _largeTitleHeight];
      double v12 = v10 + v11;
      uint64_t v7 = [(UICollectionView *)self->_collectionView safeAreaInsets];
      uint64_t v8 = v18;
      double v14 = v12 - v13;
      double y = a5->y;
      BOOL v16 = y >= v10 * 0.5 && y < v14;
      if (v16 || ((double v14 = 0.0, y >= 0.0) ? (v17 = y < v10 * 0.5) : (v17 = 0), v17)) {
        a5->double y = v14;
      }
    }
  }
  MEMORY[0x270F9A758](v7, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(_TVProductTemplateController *)self _updateImpressions];
  if (self->_impressionThreshold > 0.0) {
    [(NSArray *)self->_viewControllers enumerateObjectsUsingBlock:&__block_literal_global_24];
  }
  [(_TVProductTemplateController *)self _updateTopHeroImageVisibility:v4];
  [(_TVProductTemplateController *)self _updateBackgroundTintViewEffects];
}

- (double)_largeTitleHeight
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_largeTitleHeight <= 0.0)
  {
    collectionView = self->_collectionView;
    id v4 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    double v5 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v4];

    objc_opt_class();
    id v6 = 0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v5 viewController];
      uint64_t v8 = [v7 view];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        double v9 = [v8 components];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          double v21 = v8;
          double v22 = v5;
          id v6 = 0;
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              if (self->_sportsProductTemplate)
              {
                if (!v6)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    id v6 = v14;
                  }
                  else {
                    id v6 = 0;
                  }
                }
                NSClassFromString(&cfstr_Wlkuiproductsp.isa);
              }
              else
              {
                objc_opt_class();
              }
              if (objc_opt_isKindOfClass())
              {
                id v15 = v14;

                id v6 = v15;
                goto LABEL_21;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v11) {
              continue;
            }
            break;
          }
LABEL_21:

          if (v6)
          {
            BOOL v16 = self->_collectionView;
            [v6 bounds];
            -[UICollectionView convertRect:fromView:](v16, "convertRect:fromView:", v6);
            double MaxY = CGRectGetMaxY(v29);
            [(_TVProductTemplateController *)self _topHeroImageViewSize];
            self->_largeTitledouble Height = MaxY - v18 + 10.0;
          }
          double v5 = v22;
          goto LABEL_26;
        }
      }
      id v6 = 0;
    }
LABEL_26:
  }
  BOOL v19 = [(_TVProductTemplateController *)self _sportsLandscapePhone];
  double result = 10.0;
  if (!v19)
  {
    double result = self->_largeTitleHeight;
    if (result == 0.0) {
      return 54.0;
    }
  }
  return result;
}

- (void)_updateTopHeroImageOverlay
{
  if ([(_TVProductTemplateController *)self _sportsLandscapePhone])
  {
    double v3 = [(UIViewController *)self->_bannerViewController view];
    [v3 frame];

    id v4 = [(UIViewController *)self->_bannerViewController view];
    double v5 = [(_TVProductTemplateController *)self view];
    [v5 frame];
    objc_msgSend(v4, "sizeThatFits:", v6, 0.0);

    uint64_t v7 = [(_TVProductTemplateController *)self view];
    [v7 frame];

    [(_TVProductTemplateController *)self _topHeroImageViewSize];
    UIRectCenteredYInRect();
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    BOOL v16 = [(_TVProductTemplateController *)self view];
    [v16 frame];
    double MaxX = CGRectGetMaxX(v21);
    v22.origin.x = v9;
    v22.origin.double y = v11;
    v22.size.double width = v13;
    v22.size.double height = v15;
    CGFloat v18 = MaxX - CGRectGetWidth(v22);

    id v19 = [(UIViewController *)self->_bannerViewController view];
    v23.origin.x = v18;
    v23.origin.double y = v11;
    v23.size.double width = v13;
    v23.size.double height = v15;
    CGRect v24 = CGRectIntegral(v23);
    objc_msgSend(v19, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  }
}

- (void)_updateTopHeroImageVisibility:(id)a3
{
  [a3 contentOffset];
  double v5 = v4;
  double v6 = [(_TVProductTemplateController *)self navigationController];
  uint64_t v7 = [v6 navigationBar];

  [(_TVProductTemplateController *)self _topHeroImageViewSize];
  double v9 = v8;
  double v11 = v10;
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (v5 <= 0.0 && ![(_TVProductTemplateController *)self _sportsLandscapePhone])
  {
    CGFloat v13 = [(_TVProductTemplateController *)self view];
    [v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v88.origin.double x = v15;
    v88.origin.double y = v17;
    v88.size.double width = v19;
    CGFloat v80 = v21;
    v88.size.double height = v21;
    double Width = CGRectGetWidth(v88);
    double x = 0.0;
    CGFloat v79 = v19;
    if (IsReduceMotionEnabled)
    {
      CGFloat v24 = v17;
      CGFloat v25 = v15;
      double height = v11;
    }
    else
    {
      UIRectCenteredXInRect();
      CGRect v90 = CGRectInset(v89, v5 * 0.45, v5 * 0.45);
      double x = v90.origin.x;
      double Width = v90.size.width;
      CGFloat v24 = v17;
      CGFloat v25 = v15;
      double height = v90.size.height;
    }
    -[UIImageView setFrame:](self->_topHeroImageView, "setFrame:", x, v5, Width, height);
    v91.origin.double x = x;
    v91.origin.double y = v5;
    v91.size.double width = Width;
    v91.size.double height = height;
    double MaxY = CGRectGetMaxY(v91);
    v92.origin.double x = v25;
    v92.origin.double y = v24;
    v92.size.double width = v79;
    v92.size.double height = v80;
    double v28 = CGRectGetWidth(v92);
    CGRect v29 = [MEMORY[0x263F1C920] mainScreen];
    [v29 scale];
    double v31 = 1.0 / v30;

    -[UIView setFrame:](self->_topHeroSeparatorView, "setFrame:", 0.0, MaxY, v28, v31);
  }
  int v32 = v5 > v11 || IsReduceMotionEnabled;
  if (v32 != 1) {
    -[UIImageView _setContentRectInPixels:forContentSize:](self->_topHeroImageView, "_setContentRectInPixels:forContentSize:", 0.0, fmin(v5 * -0.28, 0.0), v9, v11, v9, v11);
  }
  if (self->_topHeroImageView)
  {
    BOOL v33 = [(_TVProductTemplateController *)self _shouldShowTopHeroImage];
    [(UICollectionView *)self->_collectionView safeAreaInsets];
    double v35 = v11 - v34;
    [(_TVProductTemplateController *)self _largeTitleHeight];
    double v37 = v36;
    if (v5 - v35 >= 0.0) {
      double v38 = v5 - v35;
    }
    else {
      double v38 = 0.0;
    }
    if (v33)
    {
      double v39 = fmin(v38 / (v36 * 0.5), 1.0);
      [(UIImageView *)self->_topHeroGradientView setAlpha:1.0 - v39];
      [v7 _setBackgroundOpacity:v39];
      v40 = [MEMORY[0x263F1C550] whiteColor];
      CGFloat v41 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
      v42 = [v40 blendWithColor:v41 percentage:v39];
      [v7 setTintColor:v42];

      BOOL v43 = [(_TVProductTemplateController *)self _sportsLandscapePhone];
      if (v5 <= 0.0 && v43)
      {
        double v44 = [(_TVProductTemplateController *)self view];
        [v44 safeAreaInsets];
        double v46 = v5 + v45;

        if (v46 < 0.0) {
          double v46 = 0.0;
        }
        double v47 = [(_TVProductTemplateController *)self view];
        [v47 safeAreaInsets];
        double v49 = v46 / (v48 * 0.5);

        uint64_t v50 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
        uint64_t v51 = [MEMORY[0x263F1C550] whiteColor];
        CGFloat v52 = objc_msgSend(v50, "blendWithColor:percentage:", v51, fmin(v49, 1.0));
        [v7 setTintColor:v52];
      }
      self->_lightStatusBar = v39 <= 0.3;
      [(_TVProductTemplateController *)self setNeedsStatusBarAppearanceUpdate];
    }
    v53 = [(_TVProductTemplateController *)self navigationItem];
    v54 = [v53 title];

    double v55 = [(_TVProductTemplateController *)self parentViewController];
    v56 = [v55 navigationItem];

    if (fmin(v38 / v37, 1.0) >= 1.0)
    {
      if (!self->_topHeroImageVisible) {
        goto LABEL_34;
      }
      if (!v7) {
        goto LABEL_34;
      }
      self->_topHeroImageVisible = 0;
      if (!v33) {
        goto LABEL_34;
      }
      v60 = (void *)MEMORY[0x263F1CB60];
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke;
      v84[3] = &unk_264BA7740;
      double v58 = &v85;
      id v85 = v7;
      NSUInteger v59 = &v86;
      id v86 = v56;
      id v87 = v54;
      [v60 animateWithDuration:7 delay:v84 options:0 animations:0.15 completion:0.0];
    }
    else
    {
      if (v38 / v37 >= 1.0) {
        goto LABEL_34;
      }
      if (self->_topHeroImageVisible) {
        goto LABEL_34;
      }
      if (!v7) {
        goto LABEL_34;
      }
      self->_topHeroImageVisible = 1;
      if (!v33) {
        goto LABEL_34;
      }
      double v57 = (void *)MEMORY[0x263F1CB60];
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke_2;
      v81[3] = &unk_264BA64A0;
      double v58 = &v82;
      id v82 = v7;
      NSUInteger v59 = &v83;
      id v83 = v56;
      [v57 animateWithDuration:7 delay:v81 options:0 animations:0.15 completion:0.0];
    }

LABEL_34:
    double v61 = v37 + v35;
    [(UICollectionView *)self->_collectionView frame];
    double v62 = v37 + v35 + CGRectGetHeight(v93);
    [(UICollectionView *)self->_collectionView contentSize];
    if (v62 > v63)
    {
      [(UICollectionView *)self->_collectionView contentInset];
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      CGRect v70 = [(_TVProductTemplateController *)self view];
      [v70 safeAreaInsets];
      double v72 = v71;
      v73 = [(IKViewElement *)self->_templateElement style];
      objc_msgSend(v73, "tv_margin");
      double v75 = v72 + v74;

      [(UICollectionView *)self->_collectionView frame];
      double v76 = v61 + CGRectGetHeight(v94);
      [(UICollectionView *)self->_collectionView contentSize];
      if (v75 >= v76 - v77) {
        double v78 = v75;
      }
      else {
        double v78 = v76 - v77;
      }
      -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v65, v67, v78, v69);
    }
  }
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  v4.receiver = self;
  v4.super_class = (Class)_TVProductTemplateController;
  int64_t result = [(_TVBgImageLoadingViewController *)&v4 preferredStatusBarStyle];
  if (self->_topHeroImageView) {
    return self->_lightStatusBar;
  }
  return result;
}

- (void)_updateImpressions
{
  [(_TVProductTemplateController *)self _cancelImpressionsUpdate];
  if (self->_impressionThreshold > 0.0)
  {
    -[_TVProductTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
  }
}

- (void)_cancelImpressionsUpdate
{
}

- (void)_recordImpressionsForVisibleView
{
  double v3 = [(_TVProductTemplateController *)self view];
  objc_super v4 = [v3 window];

  if (v4)
  {
    id v6 = [(IKViewElement *)self->_templateElement appDocument];
    double v5 = -[_TVProductTemplateController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    if ([v5 count]) {
      [v6 recordImpressionsForViewElements:v5];
    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(IKViewElement *)self->_templateElement appDocument];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    uint64_t v7 = [(UICollectionView *)self->_collectionView visibleCells];
    double v8 = [MEMORY[0x263EFF980] array];
    if ([(_TVProductTemplateController *)self isViewLoaded])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      CGFloat v24 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            CGFloat v15 = [v14 viewController];
            double v16 = objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
            [v8 addObjectsFromArray:v16];

            uint64_t v17 = [v14 titleView];
            if (v17)
            {
              double v18 = (void *)v17;
              int v19 = [v14 isShowingTitleView];

              if (v19)
              {
                double v20 = [v14 titleView];
                CGFloat v21 = objc_msgSend(v20, "tv_impressionableElementsForDocument:", v4);
                [v8 addObjectsFromArray:v21];
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v11);
      }

      uint64_t v7 = v24;
    }
    if ([v8 count])
    {
      CGRect v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      CGRect v22 = 0;
    }
  }
  else
  {
    CGRect v22 = 0;
  }

  return v22;
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_collectionView)
  {
    v4[0] = self->_collectionView;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (id)_adamIDForElement:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 attributes];
  double v5 = objc_msgSend(v4, "tv_stringForKey:", @"data-siri");

  if (v5)
  {
    double v16 = v5;
    id v17 = v3;
    int v6 = [v5 componentsSeparatedByString:@","];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v12 count] == 2)
          {
            CGFloat v13 = [v12 objectAtIndex:0];
            if ([v13 isEqualToString:@"adamid"])
            {
              uint64_t v14 = [v12 objectAtIndex:1];

              id v9 = (void *)v14;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    double v5 = v16;
    id v3 = v17;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_canonicalIDForElement:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 attributes];
  double v5 = objc_msgSend(v4, "tv_stringForKey:", @"data-siri");

  if (v5)
  {
    double v16 = v5;
    id v17 = v3;
    int v6 = [v5 componentsSeparatedByString:@","];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v12 count] == 2)
          {
            CGFloat v13 = [v12 objectAtIndex:0];
            if ([v13 isEqualToString:@"canonicalId"])
            {
              uint64_t v14 = [v12 objectAtIndex:1];

              id v9 = (void *)v14;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    double v5 = v16;
    id v3 = v17;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_yOffsetForView:(id)a3 withScrollView:(id)a4 targetYOffset:(double)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!self->_bannerViewController || ![(NSArray *)self->_viewControllers count])
  {
    uint64_t v23 = 0;
    goto LABEL_50;
  }
  collectionView = self->_collectionView;
  uint64_t v11 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  uint64_t v12 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v11];

  CGFloat v13 = self->_collectionView;
  uint64_t v14 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:1];
  uint64_t v15 = [(UICollectionView *)v13 cellForItemAtIndexPath:v14];

  double v16 = self->_collectionView;
  id v17 = [MEMORY[0x263F088C8] indexPathForItem:1 inSection:1];
  uint64_t v64 = [(UICollectionView *)v16 cellForItemAtIndexPath:v17];

  productBannerdouble Height = self->_productBannerHeight;
  uint64_t v19 = [(_TVProductTemplateController *)self _lastFocusableCellIndex];
  if (v19 < 1)
  {
    CGRect v22 = 0;
  }
  else
  {
    long long v20 = self->_collectionView;
    long long v21 = [MEMORY[0x263F088C8] indexPathForItem:v19 inSection:1];
    CGRect v22 = [(UICollectionView *)v20 cellForItemAtIndexPath:v21];
  }
  BOOL v25 = v19 > 0 && self->_isPartialScrollingTemplate;
  long long v26 = [(IKViewElement *)self->_templateElement attributes];
  long long v27 = [v26 objectForKey:@"partialScrollingEnabled"];

  if (v27) {
    int v28 = 0;
  }
  else {
    int v28 = v25;
  }
  if (v27 && v25)
  {
    CGRect v29 = [(IKViewElement *)self->_templateElement attributes];
    uint64_t v30 = [v29 objectForKey:@"partialScrollingEnabled"];
    int v28 = [v30 BOOLValue];
  }
  if ([v8 isDescendantOfView:v12])
  {
    double v31 = NSNumber;
    [v12 frame];
    double MinY = CGRectGetMinY(v77);
    BOOL v33 = v31;
    goto LABEL_21;
  }
  double v35 = (void *)v15;
  if (v22 && [v8 isDescendantOfView:v22])
  {
    [v9 contentInset];
    double v37 = v36;
    [v22 frame];
    double v38 = CGRectGetMinY(v78);
    [v9 contentSize];
    double v40 = v39;
    [v9 frame];
    double v41 = v37 + v40 - CGRectGetHeight(v79);
    if (v38 < v41) {
      double v41 = v38;
    }
    uint64_t v23 = [NSNumber numberWithDouble:v41];
    [v23 doubleValue];
    if (v42 < productBannerHeight)
    {
      uint64_t v43 = [NSNumber numberWithDouble:productBannerHeight];

      uint64_t v23 = (void *)v43;
    }
    double v34 = (void *)v64;
    goto LABEL_49;
  }
  if (productBannerHeight > a5) {
    int v44 = v28;
  }
  else {
    int v44 = 0;
  }
  double v34 = (void *)v64;
  if (v44 != 1) {
    goto LABEL_46;
  }
  if (![v8 isDescendantOfView:v15]
    || ([v9 contentOffset], double v46 = v45, objc_msgSend(v12, "frame"), v46 >= CGRectGetHeight(v80) * 0.5))
  {
    if ([v8 isDescendantOfView:v64])
    {
LABEL_48:
      uint64_t v23 = [NSNumber numberWithDouble:productBannerHeight];
      goto LABEL_49;
    }
LABEL_46:
    if (productBannerHeight <= a5 && ![v8 isDescendantOfView:v15])
    {
      uint64_t v23 = 0;
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  double v47 = [(IKViewElement *)self->_templateElement children];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (!v48)
  {
LABEL_44:

LABEL_65:
    uint64_t v23 = 0;
    goto LABEL_22;
  }
  uint64_t v49 = v48;
  uint64_t v50 = *(void *)v70;
LABEL_38:
  uint64_t v51 = 0;
  while (1)
  {
    if (*(void *)v70 != v50) {
      objc_enumerationMutation(v47);
    }
    CGFloat v52 = *(void **)(*((void *)&v69 + 1) + 8 * v51);
    if (objc_msgSend(v52, "tv_elementType") == 12) {
      break;
    }
    if (v49 == ++v51)
    {
      uint64_t v49 = [v47 countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v49) {
        goto LABEL_38;
      }
      goto LABEL_44;
    }
  }
  double v63 = v47;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v54 = [v52 children];
  uint64_t v55 = [v54 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (!v55)
  {
LABEL_62:

    goto LABEL_65;
  }
  uint64_t v56 = v55;
  uint64_t v57 = *(void *)v66;
LABEL_56:
  uint64_t v58 = 0;
  while (1)
  {
    if (*(void *)v66 != v57) {
      objc_enumerationMutation(v54);
    }
    NSUInteger v59 = *(void **)(*((void *)&v65 + 1) + 8 * v58);
    if (objc_msgSend(v59, "tv_elementType") == 54) {
      break;
    }
    if (v56 == ++v58)
    {
      uint64_t v56 = [v54 countByEnumeratingWithState:&v65 objects:v73 count:16];
      if (v56) {
        goto LABEL_56;
      }
      goto LABEL_62;
    }
  }
  v60 = [v59 style];
  objc_msgSend(v60, "tv_margin");
  double v62 = v61 + 144.0;

  if (v62 == 0.0) {
    goto LABEL_65;
  }
  BOOL v33 = NSNumber;
  double MinY = v62;
LABEL_21:
  uint64_t v23 = [v33 numberWithDouble:MinY];
LABEL_22:
  double v34 = (void *)v64;
  double v35 = (void *)v15;
LABEL_49:

LABEL_50:
  return v23;
}

- (unint64_t)_lastFocusableCellIndex
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_viewControllers count] < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSArray *)self->_viewControllers reverseObjectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "tv_associatedIKViewElement");
        if (objc_msgSend(v9, "tv_elementType") != 52 && objc_msgSend(v9, "tv_elementType") != 38)
        {
          unint64_t v10 = [(NSArray *)self->_viewControllers indexOfObject:v8];

          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v10;
}

- (id)_relatedSectionHeaderView
{
  id v3 = [(NSArray *)self->_viewControllers objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || ([(NSArray *)self->_viewControllers objectAtIndex:0],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(NSArray *)self->_viewControllers objectAtIndex:0];
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    uint64_t v5 = 0;
    if (v7)
    {
      id v8 = [(NSArray *)self->_viewControllers objectAtIndex:0];
      uint64_t v5 = [v8 shelfViewController];
    }
  }
  id v9 = [v5 collectionWrappingView];
  unint64_t v10 = [v9 headerView];

  return v10;
}

- (void)_configureTopHeroImage:(id)a3
{
  id v5 = a3;
  if (!self->_topHeroImageElement)
  {
    id v26 = v5;
    BOOL v6 = objc_msgSend(v5, "tv_elementType") == 16;
    id v5 = v26;
    if (v6)
    {
      BOOL v6 = objc_msgSend(v26, "tv_imageType") == 3;
      id v5 = v26;
      if (v6)
      {
        objc_storeStrong((id *)&self->_topHeroImageElement, a3);
        char v7 = +[TVInterfaceFactory sharedInterfaceFactory];
        id v8 = [v7 _viewFromElement:v26 existingView:self->_topHeroImageView];
        topHeroImageView = self->_topHeroImageView;
        self->_topHeroImageView = v8;

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(UIImageView *)self->_topHeroImageView _loadImage];
        }
        [(UIImageView *)self->_topHeroImageView setContentMode:2];
        self->_topHeroImageVisible = 1;
        [(UIImageView *)self->_topHeroImageView sizeToFit];
        unint64_t v10 = (void *)MEMORY[0x263F1C6B0];
        uint64_t v11 = +[TVMLUtilities TVMLKitBundle];
        long long v12 = [v10 imageNamed:@"content-gradient-uber" inBundle:v11];

        if (!self->_topHeroGradientView)
        {
          id v13 = objc_alloc(MEMORY[0x263F1C6D0]);
          long long v14 = objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
          long long v15 = (UIImageView *)[v13 initWithImage:v14];
          topHeroGradientView = self->_topHeroGradientView;
          self->_topHeroGradientView = v15;

          uint64_t v17 = self->_topHeroGradientView;
          [v12 size];
          -[UIImageView setFrame:](v17, "setFrame:", 0.0, 0.0, 1.0, v18);
          uint64_t v19 = [(_TVProductTemplateController *)self view];
          [v19 addSubview:self->_topHeroGradientView];
        }
        if (!self->_topHeroSeparatorView)
        {
          long long v20 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
          topHeroSeparatorView = self->_topHeroSeparatorView;
          self->_topHeroSeparatorView = v20;

          CGRect v22 = self->_topHeroSeparatorView;
          uint64_t v23 = [MEMORY[0x263F1C550] systemMidGrayColor];
          [(UIView *)v22 setBackgroundColor:v23];
        }
        CGFloat v24 = [(_TVProductTemplateController *)self navigationItem];
        [v24 setLargeTitleDisplayMode:2];

        self->_lightStatusBar = 1;
        [(_TVProductTemplateController *)self setNeedsStatusBarAppearanceUpdate];
        BOOL v25 = [(_TVProductTemplateController *)self view];
        [v25 setNeedsLayout];

        [(_TVProductTemplateController *)self _updateTopHeroImageVisibility:self->_collectionView];
        id v5 = v26;
      }
    }
  }
}

- (void)_configureWithBgElement:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(a3, "children", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        p_bgImageElement = &self->_bgImageElement;
        if (self->_bgImageElement
          || objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "tv_elementType") != 16
          || objc_msgSend(v9, "tv_imageType"))
        {
          p_bgImageElement = &self->_heroImageElement;
          if (self->_heroImageElement
            || objc_msgSend(v9, "tv_elementType") != 16
            || objc_msgSend(v9, "tv_imageType") != 3)
          {
            if (objc_msgSend(v9, "tv_elementType") != 3) {
              goto LABEL_15;
            }
            p_bgImageElement = &self->_bgAudioElement;
          }
        }
        objc_storeStrong((id *)p_bgImageElement, v9);
LABEL_15:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_configureWithBannerElement:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_productBannerElement, a3);
  uint64_t v6 = [(IKViewElement *)self->_productBannerElement style];
  objc_msgSend(v6, "tv_height");
  self->_productBannerdouble Height = v7;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v27 = v5;
  uint64_t v8 = [v5 children];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    int v28 = v8;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "tv_elementType");
        if (v14 > 23)
        {
          if (v14 == 24)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v17 = [v13 children];
            uint64_t v20 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v31;
              while (2)
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v31 != v22) {
                    objc_enumerationMutation(v17);
                  }
                  if (!self->_heroImageElement)
                  {
                    CGFloat v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                    if (objc_msgSend(v24, "tv_elementType") == 16 && objc_msgSend(v24, "tv_imageType") == 3)
                    {
                      objc_storeStrong((id *)&self->_heroImageElement, v24);
                      goto LABEL_30;
                    }
                  }
                }
                uint64_t v21 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
LABEL_30:
              uint64_t v8 = v28;
              uint64_t v11 = v29;
            }
          }
          else
          {
            if (v14 != 54) {
              continue;
            }
            double v18 = [v13 children];
            uint64_t v17 = [v18 firstObject];

            uint64_t v19 = [v17 style];
            if (objc_msgSend(v19, "tv_position") == 2)
            {

              goto LABEL_32;
            }
            BOOL v25 = [v17 style];
            uint64_t v26 = objc_msgSend(v25, "tv_position");

            uint64_t v11 = v29;
            if (v26 == 3) {
LABEL_32:
            }
              objc_storeStrong((id *)&self->_titleElement, v17);
          }
LABEL_33:

          continue;
        }
        if (v14 != 16)
        {
          if (v14 != 19) {
            continue;
          }
          uint64_t v15 = 1136;
LABEL_10:
          uint64_t v16 = v13;
          uint64_t v17 = *(Class *)((char *)&self->super.super.super.super.isa + v15);
          *(Class *)((char *)&self->super.super.super.super.isa + v15) = v16;
          goto LABEL_33;
        }
        uint64_t v15 = 1040;
        if (!self->_heroImageElement && objc_msgSend(v13, "tv_imageType") == 3) {
          goto LABEL_10;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }
}

- (int64_t)_blurEffectStyle
{
  return 0x8000000000000000;
}

- (CGSize)_backgroundImageProxySize
{
  if (self->_bgImageElement)
  {
    bgImageElement = self->_bgImageElement;
    [(IKImageElement *)bgImageElement tv_imageScaleToSize];
  }
  else if (self->_topHeroImageElement)
  {
    [(_TVProductTemplateController *)self _topHeroImageViewSize];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVProductTemplateController;
    [(_TVBgImageLoadingViewController *)&v5 _backgroundImageProxySize];
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 _graphicsQuality];

  if (v4 == 10)
  {
    objc_super v5 = 0;
  }
  else
  {
    uint64_t v6 = [(IKViewElement *)self->_templateElement attributes];
    double v7 = [v6 objectForKeyedSubscript:@"backgroundBlurDisabled"];

    if (objc_opt_respondsToSelector()) {
      [v7 BOOLValue];
    }
    if (self->_bgImageElement)
    {
      uint64_t v8 = [(IKViewElement *)self->_templateElement appDocument];
      objc_msgSend(v8, "tv_adjustedWindowSize");
      double v10 = v9;
      double v12 = v11;

      long long v13 = objc_opt_new();
      objc_msgSend(v13, "setImageSize:", v10, v12);
      id v14 = +[TVImageLayout layoutWithLayout:v13 element:self->_bgImageElement];
      objc_super v5 = [(IKImageElement *)self->_bgImageElement tv_imageProxyWithLayout:v13];
      uint64_t v15 = [(IKImageElement *)self->_bgImageElement style];
      uint64_t v16 = objc_msgSend(v15, "tv_imageTreatment");
      int v17 = [v16 isEqualToString:@"uber"];

      if (v17)
      {
        double v18 = objc_alloc_init(_TVUberBlurImageDecorator);
        [(_TVUberBlurImageDecorator *)v18 setBlurType:self->_infoListElement == 0];
        [(_TVUberBlurImageDecorator *)v18 setBlurStyle:+[TVMLUtilities interfaceStyleForTemplateElement:self->_templateElement] != 2];
        [v5 setDecorator:v18];
      }
    }
    else
    {
      objc_super v5 = 0;
    }
  }
  return v5;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_heroImageElement != 0;
}

- (BOOL)_isBackdropNeeded
{
  return 1;
}

- (id)_spacingMetricsForViewControllers:(id)a3 contentSize:(CGSize *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [(IKViewElement *)self->_templateElement appDocument];
  objc_msgSend(v7, "tv_adjustedWindowSize");
  uint64_t v9 = v8;

  uint64_t v29 = 0;
  long long v30 = (CGSize *)&v29;
  uint64_t v31 = 0x3010000000;
  long long v32 = &unk_230C43B61;
  uint64_t v33 = v9;
  uint64_t v34 = 0;
  double v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78___TVProductTemplateController__spacingMetricsForViewControllers_contentSize___block_invoke;
  v25[3] = &unk_264BA7768;
  uint64_t v28 = v9;
  long long v27 = &v29;
  id v11 = v10;
  id v26 = v11;
  [v6 enumerateObjectsUsingBlock:v25];
  if ((unint64_t)[v6 count] < 2)
  {
    double v12 = 0;
  }
  else
  {
    double v12 = +[TVMLUtilities rowSpacingMetricsForRowMetrics:v11];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v17)
        {
          objc_msgSend(v17, "tv_rowMetricsValue");
          double v18 = *((double *)&v20 + 1);
        }
        else
        {
          double v18 = 0.0;
          long long v20 = 0u;
        }
        v30[2].double height = v18 + v30[2].height;
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v35 count:16];
    }
    while (v14);
  }

  if (a4) {
    *a4 = v30[2];
  }

  _Block_object_dispose(&v29, 8);
  return v13;
}

- (UIEdgeInsets)_cellMarginForIndex:(int64_t)a3 partialMargins:(UIEdgeInsets *)a4
{
  double v7 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  uint64_t v8 = objc_msgSend(v7, "tv_associatedIKViewElement");
  uint64_t v9 = [v8 style];
  objc_msgSend(v9, "tv_margin");
  double v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;

  double v18 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  if (a3)
  {
    double v11 = *MEMORY[0x263F1D1C0];
    if ([(NSArray *)self->_viewControllers count] - 1 == a3) {
      double v18 = v15;
    }
  }
  else if ([(_TVProductTemplateController *)self _shouldUsePartialScrollingTemplate])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v7 headerElement];

      if (v19)
      {
        double v11 = 0.0;
        if (a4)
        {
          a4->left = v13;
          a4->bottom = v18;
          a4->right = v17;
          a4->top = 0.0;
        }
      }
    }
  }
  if ([(NSArray *)self->_viewControllers count] - 1 > a3)
  {
    long long v20 = [(NSArray *)self->_viewControllers objectAtIndex:a3 + 1];
    long long v21 = objc_msgSend(v20, "tv_associatedIKViewElement");

    long long v22 = [v21 style];
    objc_msgSend(v22, "tv_margin");
    double v24 = v23;

    if (v15 > 0.0 || v24 > 0.0)
    {
      double v18 = fmax(v15, v24);
    }
    else
    {
      BOOL v25 = [(NSArray *)self->_rowSpacingMetricsList objectAtIndex:a3];
      id v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "tv_rowMetricsValue");
        double v18 = v31;
      }
      else
      {
        double v18 = 0.0;
      }
    }
  }

  double v27 = v11;
  double v28 = v13;
  double v29 = v18;
  double v30 = v17;
  result.right = v30;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

- (BOOL)_shouldUsePartialScrollingTemplate
{
  return self->_isPartialScrollingTemplate || self->_titleElement == 0;
}

- (BOOL)_shouldShowTopHeroImage
{
  double v3 = [(_TVProductTemplateController *)self traitCollection];
  BOOL v4 = [v3 verticalSizeClass] != 1 || self->_sportsProductTemplate;

  return v4;
}

- (BOOL)_sportsLandscapePhone
{
  if (!self->_sportsProductTemplate
    || (unint64_t)([(id)*MEMORY[0x263F1D020] interfaceOrientation] - 3) > 1)
  {
    return 0;
  }
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (BOOL)_sportsLandscapePhoneIsOverlaySection:(id)a3
{
  id v4 = a3;
  if ([(_TVProductTemplateController *)self _sportsLandscapePhone]) {
    BOOL v5 = [v4 section] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_configureBackgroundTintView
{
  if ([(NSArray *)self->_viewControllers count])
  {
    if (self->_backdropTintViewController)
    {
      if (self->_backdropTintView)
      {
        [(_TVProductTemplateController *)self _updateBackgroundTintView];
      }
      else
      {
        id v3 = objc_alloc(MEMORY[0x263F1CB60]);
        id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        backdropTintView = self->_backdropTintView;
        self->_backdropTintView = v4;

        [(UIView *)self->_backdropTintView setAutoresizingMask:50];
        [(UIView *)self->_backdropTintView setUserInteractionEnabled:0];
        [(UICollectionView *)self->_collectionView insertSubview:self->_backdropTintView atIndex:0];
      }
      id v6 = self->_backdropTintView;
      double v7 = [(IKViewElement *)self->_backdropTintElement style];
      uint64_t v8 = objc_msgSend(v7, "tv_backgroundColor");
      id v10 = [v8 color];

      uint64_t v9 = (uint64_t)v10;
      if (!v10)
      {
        uint64_t v9 = [MEMORY[0x263F1C550] colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
      }
      id v11 = (id)v9;
      [(UIView *)v6 setBackgroundColor:v9];
    }
    else
    {
      [(_TVProductTemplateController *)self _updateBackgroundTintView];
    }
  }
}

- (void)_updateBackgroundTintView
{
  if (self->_backdropTintViewController)
  {
    NSUInteger v3 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(UIView *)self->_backdropTintView removeFromSuperview];
      backdropTintViewController = self->_backdropTintViewController;
      self->_backdropTintViewController = 0;

      backdropTintView = self->_backdropTintView;
      self->_backdropTintView = 0;
    }
    else
    {
      double v14 = [MEMORY[0x263F088C8] indexPathForItem:v3 inSection:1];
      [(UICollectionView *)self->_collectionView frame];
      double v7 = v6;
      double v9 = v8;
      id v10 = [(UICollectionView *)self->_collectionView layoutAttributesForItemAtIndexPath:v14];
      [v10 frame];
      double v12 = v11;
      [(_TVProductTemplateController *)self _maxContentSize];
      -[UIView setFrame:](self->_backdropTintView, "setFrame:", v7, v12, v9, fmax(v13 - v12, 0.0));
      [(UICollectionView *)self->_collectionView sendSubviewToBack:self->_backdropTintView];
      [(_TVProductTemplateController *)self _updateBackgroundTintViewEffects];

      backdropTintView = v14;
    }
  }
  else
  {
    [(UIView *)self->_backdropTintView removeFromSuperview];
    backdropTintView = self->_backdropTintView;
    self->_backdropTintView = 0;
  }
}

- (void)_updateBackgroundTintViewEffects
{
  backdropTintView = self->_backdropTintView;
  if (backdropTintView)
  {
    [(UIView *)backdropTintView frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    [(_TVProductTemplateController *)self _maxContentSize];
    double v11 = v10;
    [(UIView *)self->_backdropTintView frame];
    double v13 = fmax(v11 - v12, 0.0);
    if (v13 > 0.0)
    {
      [(UICollectionView *)self->_collectionView contentSize];
      double v15 = v14;
      [(UICollectionView *)self->_collectionView bounds];
      double v17 = v15 - v16;
      [(UICollectionView *)self->_collectionView contentInset];
      double v19 = v17 - v18;
      [(UICollectionView *)self->_collectionView contentOffset];
      if (v20 > v19)
      {
        [(UICollectionView *)self->_collectionView contentOffset];
        double v13 = v13 + v21 - v19;
      }
    }
    long long v22 = self->_backdropTintView;
    -[UIView setFrame:](v22, "setFrame:", v5, v7, v9, v13);
  }
}

- (CGSize)_maxContentSize
{
  [(UICollectionView *)self->_collectionView contentSize];
  double v4 = v3;
  double v5 = [(_TVProductTemplateController *)self view];
  [v5 bounds];
  double v7 = v6;

  if (v4 < v7) {
    double v4 = v7;
  }
  [(UICollectionView *)self->_collectionView contentSize];
  double v9 = v8;
  double v10 = [(_TVProductTemplateController *)self view];
  [v10 bounds];
  double v12 = v11;

  if (v9 >= v12) {
    double v13 = v9;
  }
  else {
    double v13 = v12;
  }
  double v14 = v4;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerCell, 0);
  objc_storeStrong((id *)&self->_topHeroImageElement, 0);
  objc_storeStrong((id *)&self->_topHeroGradientView, 0);
  objc_storeStrong((id *)&self->_topHeroSeparatorView, 0);
  objc_storeStrong((id *)&self->_topHeroImageView, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_autoHighlightIndexPath, 0);
  objc_storeStrong((id *)&self->_rowSpacingMetricsList, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleElement, 0);
  objc_storeStrong((id *)&self->_infoListElement, 0);
  objc_storeStrong((id *)&self->_productBannerElement, 0);
  objc_storeStrong((id *)&self->_bgAudioElement, 0);
  objc_storeStrong((id *)&self->_tvVignetteView, 0);
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_backdropTintViewController, 0);
  objc_storeStrong((id *)&self->_backdropTintView, 0);
  objc_storeStrong((id *)&self->_backdropTintElement, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_bgBlurSublayer, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_bgImage, 0);
  objc_storeStrong((id *)&self->_heroImageElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end