@interface _TVStackTemplateController
- (BOOL)_didExtendContentForPeekMetrics:(id *)a3 above:(BOOL)a4 initial:(BOOL)a5;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)shouldAdjustForTabBarSafeAreaInsets;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGSize)_maxContentSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)_scrollableBoundsInset;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TVStackTemplateController)init;
- (double)_maxViewWidth;
- (double)_offsetToScrollStop:(id)a3;
- (double)showcaseFactor;
- (double)showcaseInset;
- (id)_updateWithCollectionListElement:(id)a3 commits:(id *)a4 autoHighlightIndexPath:(id *)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)scrollStopForEnteringSectionAtIndex:(int64_t)a3 fromEdge:(int64_t)a4;
- (id)scrollStopForShowcaseTransition;
- (id)tabBarObservedScrollView;
- (id)viewControllers;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfCollections;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_adjustedContentOffsetForRowIndex:(int64_t)a3 targetContentOffset:(CGPoint *)a4;
- (void)_buildStackSections;
- (void)_configureBackgroundTintView;
- (void)_invalidateSectionMetricsIfNeeded;
- (void)_preloadNext;
- (void)_scheduleNextPreloadConditional;
- (void)_scrollToTopAnimated:(BOOL)a3;
- (void)_updateBackgroundTintView;
- (void)_updateBackgroundTintViewEffects;
- (void)_updateFirstItemRowIndexes;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 showcaseFactorDidChangeForLayout:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)didUpdateSupplementarySectionInfo;
- (void)scrollViewDidScroll:(id)a3;
- (void)setShowcaseInset:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackgroundAndBackdrop;
- (void)updateBackgroundAndBackdropMaskFactor;
- (void)updateCollectionViewControllersAndForceReload:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation _TVStackTemplateController

- (_TVStackTemplateController)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVStackTemplateController;
  result = [(_TVStackTemplateController *)&v3 init];
  if (result) {
    result->_showcaseFactor = NAN;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = [(_TVStackCommonTemplateController *)self viewElement];
  v4 = [v3 appDocument];
  v5 = +[TVTemplateFeaturesManager featuresManagerForAppDocument:v4];

  [v5 popContext:self forFeature:&unk_26E5F54B0];
  v6.receiver = self;
  v6.super_class = (Class)_TVStackTemplateController;
  [(_TVStackCommonTemplateController *)&v6 dealloc];
}

- (id)viewControllers
{
  return self->_viewControllers;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_TVStackTemplateController;
  [(_TVStackCommonTemplateController *)&v26 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  p_lastFocusedIndexPath = &self->_lastFocusedIndexPath;
  v8 = self->_lastFocusedIndexPath;
  v9 = [v6 nextFocusedView];
  v10 = [(_TVStackCommonTemplateController *)self collectionView];
  int v11 = [v9 isDescendantOfView:v10];

  if (v11)
  {
    v12 = [v6 nextFocusedView];
    if (v12)
    {
      do
      {
        v13 = [v12 superview];
        v14 = [(_TVStackCommonTemplateController *)self collectionView];

        if (v13 == v14) {
          break;
        }
        uint64_t v15 = [v12 superview];

        v12 = (void *)v15;
      }
      while (v15);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    v16 = [(_TVStackCommonTemplateController *)self collectionView];
    uint64_t v17 = [v16 indexPathForCell:v12];

    v8 = (NSIndexPath *)v17;
    goto LABEL_9;
  }
  uint64_t v18 = [(_TVStackCommonTemplateController *)self focusedSupplementaryViewController];
  if (v18)
  {
    v16 = (void *)v18;
    v12 = v8;
    v8 = 0;
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  v22 = [v6 nextFocusedView];
  v23 = [(_TVStackTemplateController *)self tabBarController];
  v24 = [v23 tabBar];
  char v25 = [v22 isDescendantOfView:v24];

  if (v25)
  {
    v12 = v8;
    v8 = 0;
    goto LABEL_10;
  }
LABEL_11:
  objc_storeStrong((id *)p_lastFocusedIndexPath, v8);
  v19 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *p_lastFocusedIndexPath;
    if (v20)
    {
      objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](v20, "section"));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = @"-";
    }
    *(_DWORD *)buf = 138412290;
    v28 = v21;
    _os_log_impl(&dword_230B4C000, v19, OS_LOG_TYPE_INFO, "LFIP: from focus context: %@", buf, 0xCu);
    if (v20) {
  }
    }
}

- (void)viewDidLoad
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)_TVStackTemplateController;
  [(_TVStackTemplateController *)&v35 viewDidLoad];
  objc_super v3 = [_TVNeedsMoreContentEvaluator alloc];
  v4 = [(_TVStackCommonTemplateController *)self collectionView];
  v5 = [(_TVNeedsMoreContentEvaluator *)v3 initWithScrollView:v4 axis:2];
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  self->_needsMoreContentEvaluator = v5;

  v7 = self->_needsMoreContentEvaluator;
  v8 = [(_TVStackCommonTemplateController *)self viewElement];
  [(_TVNeedsMoreContentEvaluator *)v7 setViewElement:v8];

  v9 = [(_TVStackCommonTemplateController *)self viewElement];
  v10 = [v9 appDocument];
  int v11 = +[TVTemplateFeaturesManager featuresManagerForAppDocument:v10];

  [v11 pushContext:self forFeature:&unk_26E5F54B0];
  [(_TVStackTemplateController *)self didUpdateSupplementarySectionInfo];
  [(_TVStackTemplateController *)self _buildStackSections];
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    uint64_t v13 = [(IKChangeSet *)self->_filteredChangeSet newIndexForOldIndex:[(NSIndexPath *)lastFocusedIndexPath section]];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      v14 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v13];
    }
    uint64_t v15 = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = v14;

    v16 = (id)TVMLKitLogObject;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = self->_lastFocusedIndexPath;
      if (v17)
      {
        objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_lastFocusedIndexPath, "section"));
        uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v18 = @"-";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_230B4C000, v16, OS_LOG_TYPE_INFO, "LFIP: from view load: %@", buf, 0xCu);
      if (v17) {
    }
      }
    v19 = self->_lastFocusedIndexPath;
    if (v19)
    {
      unint64_t v20 = [(NSIndexPath *)v19 section];
      if (v20 < [(NSArray *)self->_stackSections count])
      {
        v21 = [(_TVStackCommonTemplateController *)self collectionView];
        [v21 contentOffset];
        *(void *)buf = v22;
        *(void *)&buf[8] = v23;

        v24 = [(NSArray *)self->_stackSections objectAtIndex:v20];
        -[_TVStackTemplateController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", [v24 firstItemRowIndex], buf);
        char v25 = [(_TVStackCommonTemplateController *)self collectionView];
        [v25 contentSize];
        double v27 = v26;
        double v29 = v28;
        uint64_t v30 = MEMORY[0x263F001B0];
        double v31 = *MEMORY[0x263F001B0];

        if (v27 == v31 && v29 == *(double *)(v30 + 8))
        {
          v32 = [(_TVStackCommonTemplateController *)self collectionView];
          [v32 layoutBelowIfNeeded];
        }
        v33 = [(_TVStackCommonTemplateController *)self collectionView];
        [v33 setContentOffset:*(_OWORD *)buf];
      }
    }
  }
  if ([(_TVStackCommonTemplateController *)self _isBackdropNeeded])
  {
    v34 = [(_TVStackCommonTemplateController *)self stackWrappingView];
    [v34 setBackdropMaskFactor:1.0];
  }
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_TVStackTemplateController;
  [(_TVStackTemplateController *)&v4 viewWillLayoutSubviews];
  objc_super v3 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  objc_msgSend(v3, "setShouldAdjustForTabBarSafeAreaInsets:", -[_TVStackTemplateController shouldAdjustForTabBarSafeAreaInsets](self, "shouldAdjustForTabBarSafeAreaInsets"));
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)_TVStackTemplateController;
  [(_TVBgImageLoadingViewController *)&v14 viewDidLayoutSubviews];
  [(_TVStackTemplateController *)self _invalidateSectionMetricsIfNeeded];
  if ([(NSArray *)self->_stackSections count])
  {
    objc_super v3 = [(_TVStackTemplateController *)self scrollStopForShowcaseTransition];
    if (v3)
    {
      [(_TVStackTemplateController *)self _offsetToScrollStop:v3];
      double v5 = v4;
      id v6 = [(_TVStackCommonTemplateController *)self collectionView];
      [v6 contentInset];
      double v8 = v5 + v7;
    }
    else
    {
      double v8 = 0.0;
    }
  }
  else
  {
    double v8 = 0.0;
  }
  v9 = [(_TVStackCommonTemplateController *)self _flowLayout];
  [v9 setShowcaseHeight:v8];

  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x263F158F8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51___TVStackTemplateController_viewDidLayoutSubviews__block_invoke;
  v11[3] = &unk_264BA6A38;
  objc_copyWeak(&v12, &location);
  [v10 setCompletionBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_TVStackTemplateController;
  [(_TVStackCommonTemplateController *)&v3 traitCollectionDidChange:a3];
}

- (void)setShowcaseInset:(double)a3
{
  if (self->_showcaseInset != a3)
  {
    self->_showcaseInset = a3;
    if ([(_TVStackTemplateController *)self isViewLoaded])
    {
      [(_TVStackTemplateController *)self didUpdateSupplementarySectionInfo];
      [(_TVStackTemplateController *)self _buildStackSections];
    }
  }
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (void)updateCollectionViewControllersAndForceReload:(BOOL)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  double v5 = [(_TVStackCommonTemplateController *)self collectionListElement];
  if (!a3)
  {
    id v6 = [(_TVStackCommonTemplateController *)self viewElement];
    if ([v6 updateType])
    {
      uint64_t v7 = [v5 updateType];

      if (!v7) {
        goto LABEL_55;
      }
    }
    else
    {
    }
  }
  double v8 = [(_TVStackCommonTemplateController *)self collectionView];
  uint64_t v57 = 0;
  v58 = (id *)&v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__12;
  v61 = __Block_byref_object_dispose__12;
  id v62 = 0;
  NSUInteger v48 = [(NSArray *)self->_stackRows count];
  v9 = [(_TVStackCommonTemplateController *)self collectionListElement];
  v10 = v58 + 5;
  id obj = v58[5];
  id v56 = 0;
  int v11 = [(_TVStackTemplateController *)self _updateWithCollectionListElement:v9 commits:&v56 autoHighlightIndexPath:&obj];
  id v12 = (void (**)(void))v56;
  objc_storeStrong(v10, obj);

  uint64_t v13 = [(_TVStackTemplateController *)self scrollStopForShowcaseTransition];
  self->_requiresShowcasing = v13 != 0;

  if (![(_TVStackTemplateController *)self isViewLoaded])
  {
    v12[2](v12);
    objc_storeStrong((id *)&self->_lastFocusedIndexPath, v58[5]);
    v19 = (id)TVMLKitLogObject;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      lastFocusedIndexPath = self->_lastFocusedIndexPath;
      if (lastFocusedIndexPath)
      {
        objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_lastFocusedIndexPath, "section"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = @"-";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_230B4C000, v19, OS_LOG_TYPE_INFO, "LFIP: from auto highlight w/o view: %@", buf, 0xCu);
      if (lastFocusedIndexPath) {
    }
      }
    goto LABEL_53;
  }
  objc_super v14 = [v5 attributes];
  uint64_t v15 = [v14 objectForKey:@"animationsEnabled"];

  if (v15)
  {
    v16 = [v5 attributes];
    uint64_t v17 = [v16 objectForKey:@"animationsEnabled"];
    int v18 = [v17 BOOLValue];

    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
    int v18 = 1;
    if (!v11)
    {
LABEL_18:
      v12[2](v12);
      [(_TVStackTemplateController *)self _buildStackSections];
      id v22 = v58[5];
      if (v22)
      {
        uint64_t v23 = -[IKChangeSet newIndexForOldIndex:](self->_filteredChangeSet, "newIndexForOldIndex:", [v22 section]);
        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = 0;
        }
        else
        {
          v24 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v23];
        }
        objc_storeStrong(v58 + 5, v24);
        if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
      }
        }
      id v25 = v58[5];
      p_lastFocusedIndexPath = &self->_lastFocusedIndexPath;
      if (v25)
      {
        objc_storeStrong((id *)&self->_lastFocusedIndexPath, v25);
        double v27 = (id)TVMLKitLogObject;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [(NSIndexPath *)*p_lastFocusedIndexPath section];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v28;
          _os_log_impl(&dword_230B4C000, v27, OS_LOG_TYPE_INFO, "LFIP: from auto highlight w/o changeset: %ld", buf, 0xCu);
        }
      }
      else
      {
        if (!*p_lastFocusedIndexPath) {
          goto LABEL_44;
        }
        uint64_t v29 = [(NSArray *)self->_viewControllers count];
        uint64_t v30 = [(NSIndexPath *)*p_lastFocusedIndexPath section];
        if (v29 < 1)
        {
          uint64_t v32 = 0;
        }
        else
        {
          if (v30 >= v29 - 1) {
            uint64_t v31 = v29 - 1;
          }
          else {
            uint64_t v31 = v30;
          }
          uint64_t v32 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v31];
        }
        v33 = *p_lastFocusedIndexPath;
        *p_lastFocusedIndexPath = (NSIndexPath *)v32;

        double v27 = (id)TVMLKitLogObject;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v34 = *p_lastFocusedIndexPath;
          if (*p_lastFocusedIndexPath)
          {
            objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](*p_lastFocusedIndexPath, "section"));
            objc_super v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_super v35 = @"-";
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v35;
          _os_log_impl(&dword_230B4C000, v27, OS_LOG_TYPE_INFO, "LFIP: from update w/o changeset: %@", buf, 0xCu);
          if (v34) {
        }
          }
      }

LABEL_44:
      if (*p_lastFocusedIndexPath)
      {
        unint64_t v36 = [(NSIndexPath *)*p_lastFocusedIndexPath section];
        if (v36 < [(NSArray *)self->_stackSections count])
        {
          uint64_t v37 = [(_TVStackCommonTemplateController *)self collectionView];
          [v37 contentOffset];
          *(void *)buf = v38;
          *(void *)&buf[8] = v39;

          v40 = [(NSArray *)self->_stackSections objectAtIndex:v36];
          -[_TVStackTemplateController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", [v40 firstItemRowIndex], buf);
          v41 = [(_TVStackCommonTemplateController *)self collectionView];
          [v41 setContentOffset:*(_OWORD *)buf];
        }
      }
      self->_shouldInvalidateMetrics = 0;
      [v8 reloadData];
      goto LABEL_48;
    }
  }
  if (a3 || !v18 || ![(NSArray *)self->_viewControllers count]) {
    goto LABEL_18;
  }
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke;
  v50[3] = &unk_264BA9828;
  v53 = v12;
  v50[4] = self;
  id v51 = v11;
  v54 = &v57;
  id v52 = v8;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_3;
  v49[3] = &unk_264BA6D78;
  v49[4] = self;
  [v52 performBatchUpdates:v50 completion:v49];

LABEL_48:
  v42 = [(_TVStackCommonTemplateController *)self collectionView];
  char v43 = objc_msgSend(v42, "tv_isFocusOnNonOwnedCell");

  if ((v43 & 1) == 0) {
    [(_TVStackTemplateController *)self setNeedsFocusUpdate];
  }
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  v45 = [(_TVStackCommonTemplateController *)self viewElement];
  [(_TVNeedsMoreContentEvaluator *)needsMoreContentEvaluator setViewElement:v45];

  if ([(NSArray *)self->_stackRows count] == v48)
  {
    v46 = [(_TVStackCommonTemplateController *)self collectionListElement];
    BOOL v47 = (unint64_t)[v46 updateType] > 2;

    if (!v47) {
      goto LABEL_54;
    }
  }
  [(_TVNeedsMoreContentEvaluator *)self->_needsMoreContentEvaluator reset];
  v19 = [(_TVStackTemplateController *)self view];
  [v19 setNeedsLayout];
LABEL_53:

LABEL_54:
  [(_TVStackTemplateController *)self _configureBackgroundTintView];

  _Block_object_dispose(&v57, 8);
LABEL_55:
}

- (int64_t)numberOfCollections
{
  return [(NSArray *)self->_stackSections count];
}

- (void)didUpdateSupplementarySectionInfo
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(_TVStackTemplateController *)self isViewLoaded])
  {
    [(_TVStackCommonTemplateController *)self supplementaryViewControllers];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v8 = objc_msgSend(v7, "tv_associatedIKViewElement");
          v9 = [v8 style];
          v10 = objc_msgSend(v9, "tv_transition");
          int v11 = [v10 isEqualToString:@"dissolve"];

          if (v11) {
            uint64_t v12 = 2;
          }
          else {
            uint64_t v12 = 0;
          }
          [(_TVStackTemplateController *)self showcaseInset];
          v15[0] = 0;
          v15[1] = v12;
          v15[2] = v13;
          objc_msgSend(v7, "tv_setShowcaseConfig:", v15);
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v4);
    }
  }
}

- (void)updateBackgroundAndBackdrop
{
  uint64_t v3 = [(_TVStackCommonTemplateController *)self bgImgElement];
  uint64_t v4 = [v3 style];
  uint64_t v5 = objc_msgSend(v4, "tv_imageTreatment");
  if (![v5 isEqualToString:@"blurOverlay"])
  {

    goto LABEL_6;
  }
  BOOL requiresShowcasing = self->_requiresShowcasing;

  if (!requiresShowcasing)
  {
LABEL_6:
    v11.receiver = self;
    v11.super_class = (Class)_TVStackTemplateController;
    [(_TVStackCommonTemplateController *)&v11 updateBackgroundAndBackdrop];
    return;
  }
  id v10 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  uint64_t v7 = [(_TVStackCommonTemplateController *)self mediaPlayer];
  char v8 = [v7 isPlaying];

  if (v8)
  {
    int64_t v9 = 4009;
  }
  else if ([(_TVStackCommonTemplateController *)self _backgroundImageRequiresBlur])
  {
    int64_t v9 = 0x8000000000000000;
  }
  else
  {
    int64_t v9 = [(_TVStackCommonTemplateController *)self _blurEffectStyle];
  }
  [v10 setBackdropBlurEffectStyle:v9];
  [v10 setBackdropInitialPeek:540.0];
  [v10 setBackdropPeekGradient:270.0];
}

- (void)updateBackgroundAndBackdropMaskFactor
{
  if (self->_requiresShowcasing)
  {
    [(_TVStackTemplateController *)self showcaseFactor];
    id v3 = [(_TVStackCommonTemplateController *)self stackWrappingView];
    [(_TVStackTemplateController *)self showcaseFactor];
    objc_msgSend(v3, "setBackdropMaskFactor:");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_TVStackTemplateController;
    [(_TVStackCommonTemplateController *)&v4 updateBackgroundAndBackdropMaskFactor];
  }
}

- (BOOL)shouldAdjustForTabBarSafeAreaInsets
{
  return 0;
}

- (id)scrollStopForShowcaseTransition
{
  id v3 = [(_TVStackCommonTemplateController *)self viewElement];
  objc_super v4 = [v3 style];
  char v5 = [v4 edgeFlagForStyle:@"tv-scrollable-bounds-inset"];

  if (v5)
  {
    id v6 = objc_opt_new();
    [v6 setSectionIndex:0x7FFFFFFFFFFFFFFFLL];
    [v6 setEdge:0];
    [(_TVStackTemplateController *)self _scrollableBoundsInset];
    objc_msgSend(v6, "setOffset:");
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)scrollStopForEnteringSectionAtIndex:(int64_t)a3 fromEdge:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  viewControllers = self->_viewControllers;
  id v5 = a3;
  uint64_t v6 = [(NSArray *)viewControllers count];
  v9.receiver = self;
  v9.super_class = (Class)_TVStackTemplateController;
  id v7 = [(_TVStackCommonTemplateController *)&v9 numberOfSectionsInCollectionView:v5];

  return (int64_t)v7 + v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(NSArray *)self->_viewControllers count] <= a4)
  {
    v9.receiver = self;
    v9.super_class = (Class)_TVStackTemplateController;
    int64_t v7 = [(_TVStackCommonTemplateController *)&v9 collectionView:v6 numberOfItemsInSection:a4];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 section];
  if (v8 >= [(NSArray *)self->_viewControllers count])
  {
    v24.receiver = self;
    v24.super_class = (Class)_TVStackTemplateController;
    id v10 = [(_TVStackCommonTemplateController *)&v24 collectionView:v6 cellForItemAtIndexPath:v7];
  }
  else
  {
    objc_super v9 = [(_TVStackCommonTemplateController *)self collectionView];
    id v10 = [v9 dequeueReusableCellWithReuseIdentifier:@"TVStackViewCollectionCellIdentifier" forIndexPath:v7];

    objc_super v11 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", [v7 section]);
    uint64_t v12 = [v11 view];
    [v10 bounds];
    objc_msgSend(v12, "setFrame:");
    uint64_t v13 = objc_msgSend(v11, "tv_associatedIKViewElement");
    objc_super v14 = [v13 attributes];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"markBackgroundSegment"];
    char v16 = [v15 BOOLValue];

    long long v17 = [MEMORY[0x263F1C550] clearColor];
    long long v18 = [v13 style];
    long long v19 = objc_msgSend(v18, "tv_backgroundColor");

    if (v19 && (v16 & 1) == 0)
    {
      unint64_t v20 = [v13 style];
      uint64_t v21 = objc_msgSend(v20, "tv_backgroundColor");
      uint64_t v22 = [v21 color];

      long long v17 = (void *)v22;
    }
    [v10 setBackgroundColor:v17];

    [v10 setViewController:v11];
  }

  return v10;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v4 = [(_TVStackCommonTemplateController *)self collectionView];
  if (objc_msgSend(v4, "tv_isFocusOnNonOwnedCell")) {
    lastFocusedIndexPath = 0;
  }
  else {
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
  }
  id v6 = lastFocusedIndexPath;

  id v7 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6)
    {
      objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](v6, "section"));
      unint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v8 = @"-";
    }
    int v10 = 138412290;
    objc_super v11 = v8;
    _os_log_impl(&dword_230B4C000, v7, OS_LOG_TYPE_INFO, "LFIP: returned: %@", (uint8_t *)&v10, 0xCu);
    if (v6) {
  }
    }
  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v10 section];
  if (v11 >= [(NSArray *)self->_viewControllers count])
  {
    v30.receiver = self;
    v30.super_class = (Class)_TVStackTemplateController;
    [(_TVStackCommonTemplateController *)&v30 collectionView:v8 willDisplayCell:v9 forItemAtIndexPath:v10];
  }
  else
  {
    uint64_t v12 = [v9 viewController];
    if (v12)
    {
      uint64_t v13 = [(_TVStackTemplateController *)self childViewControllers];
      char v14 = [v13 containsObject:v12];

      if ((v14 & 1) == 0)
      {
        [(_TVStackTemplateController *)self addChildViewController:v12];
        [(UIViewController *)v12 didMoveToParentViewController:self];
        [(NSMutableArray *)self->_preloadQueue removeObject:v12];
        if (v12 == self->_backdropTintViewController) {
          [(_TVStackTemplateController *)self _updateBackgroundTintView];
        }
        uint64_t v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        double v26 = __80___TVStackTemplateController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
        double v27 = &unk_264BA64A0;
        uint64_t v28 = v12;
        id v29 = v9;
        dispatch_async(MEMORY[0x263EF83A0], &v24);
      }
    }
    uint64_t v15 = [(_TVStackCommonTemplateController *)self collectionView];
    char v16 = [v15 collectionViewLayout];

    long long v17 = [v16 layoutAttributesForItemAtIndexPath:v10];
    [v9 frame];
    CGRect v33 = CGRectIntegral(v32);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
    [v17 frame];
    CGRect v36 = CGRectIntegral(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    if (!CGRectEqualToRect(v35, v36))
    {
      id v22 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
      v31[0] = v10;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      [v22 invalidateItemsAtIndexPaths:v23];

      [v16 invalidateLayoutWithContext:v22];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v10 section];
  if (v11 >= [(NSArray *)self->_viewControllers count])
  {
    v16.receiver = self;
    v16.super_class = (Class)_TVStackTemplateController;
    [(_TVStackCommonTemplateController *)&v16 collectionView:v8 willDisplayCell:v9 forItemAtIndexPath:v10];
  }
  else
  {
    uint64_t v12 = [v9 viewController];
    if (v12)
    {
      uint64_t v13 = [(_TVStackTemplateController *)self childViewControllers];
      if ([v13 containsObject:v12])
      {
        char v14 = [v12 view];
        int v15 = [v14 isDescendantOfView:v9];

        if (v15)
        {
          [v12 willMoveToParentViewController:0];
          [v12 removeFromParentViewController];
        }
      }
      else
      {
      }
    }
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGPoint v11 = a4;
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    unint64_t v6 = [(NSIndexPath *)lastFocusedIndexPath section];
    if (v6 < [(NSArray *)self->_stackSections count])
    {
      id v7 = [(NSArray *)self->_stackSections objectAtIndex:v6];
      -[_TVStackTemplateController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", [v7 firstItemRowIndex], &v11);
    }
    id v8 = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = 0;
  }
  double x = v11.x;
  double y = v11.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForSectionAtIndex:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = [(_TVStackTemplateController *)self view];
  [v7 bounds];
  double v9 = v8;
  id v10 = [(NSArray *)self->_stackSections objectAtIndexedSubscript:a5];
  [v10 sectionHeight];
  double v12 = v11;

  if (self->_requiresShowcasing)
  {
    uint64_t v13 = [(NSArray *)self->_stackSections objectAtIndexedSubscript:a5];
    [v13 showcaseSectionHeight];
    double v15 = v14;

    objc_super v16 = [(_TVStackCommonTemplateController *)self _flowLayout];
    [v16 showcaseFactor];
    double v12 = v15 + (1.0 - v17) * (v12 - v15);
  }
  if (v9 < 0.0 || v12 < 0.0)
  {
    long long v18 = [(_TVStackTemplateController *)self viewControllers];
    long long v19 = [v18 objectAtIndexedSubscript:a5];
    unint64_t v20 = objc_msgSend(v19, "tv_associatedIKViewElement");

    uint64_t v21 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v21;
      uint64_t v25 = [v20 debugDescription];
      int v26 = 134218498;
      double v27 = v9;
      __int16 v28 = 2048;
      double v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v25;
      _os_log_error_impl(&dword_230B4C000, v24, OS_LOG_TYPE_ERROR, "StackLayout: invalid cell size: {%lf, %lf} for: %@", (uint8_t *)&v26, 0x20u);
    }
  }
  double v22 = v9;
  double v23 = v12;
  result.CGFloat height = v23;
  result.CGFloat width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5, a4);
  [v7 sectionSpacing];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if (self->_requiresShowcasing)
  {
    objc_super v16 = [(NSArray *)self->_stackSections objectAtIndexedSubscript:a5];
    [v16 showcaseSectionSpacing];
    double v18 = v17;
    double v20 = v19;

    uint64_t v21 = [(_TVStackCommonTemplateController *)self _flowLayout];
    [v21 showcaseFactor];
    double v9 = v18 + (1.0 - v22) * (v9 - v18);

    double v23 = [(_TVStackCommonTemplateController *)self _flowLayout];
    [v23 showcaseFactor];
    double v13 = v20 + (1.0 - v24) * (v13 - v20);
  }
  double v25 = v9;
  double v26 = v11;
  double v27 = v13;
  double v28 = v15;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)collectionView:(id)a3 showcaseFactorDidChangeForLayout:(id)a4
{
  id v5 = [(_TVStackCommonTemplateController *)self _flowLayout];
  [v5 showcaseFactor];
  double v7 = v6;

  if (self->_showcaseFactor != v7)
  {
    self->_showcaseFactor = v7;
    [(_TVStackTemplateController *)self _scheduleNextPreloadConditional];
    double v8 = [(_TVStackCommonTemplateController *)self observableEventController];
    [v8 dispatchEvent:@"TVShowcaseFactorDidChangeEvent" sender:self withUserInfo:0];

    [(_TVStackTemplateController *)self showcaseFactorDidChange];
  }
}

- (id)tabBarObservedScrollView
{
  v2 = [(_TVStackCommonTemplateController *)self stackWrappingView];
  id v3 = [v2 stackView];

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVStackTemplateController;
  [(_TVStackCommonTemplateController *)&v4 scrollViewDidScroll:a3];
  [(_TVNeedsMoreContentEvaluator *)self->_needsMoreContentEvaluator evaluateForState:2];
  [(_TVStackTemplateController *)self _updateBackgroundTintViewEffects];
}

- (void)_scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(_TVStackCommonTemplateController *)self collectionView];
  [v5 contentInset];
  objc_msgSend(v5, "setContentOffset:animated:", v3, 0.0, -v6);
  double v7 = [(_TVStackCommonTemplateController *)self _flowLayout];
  [v5 bounds];
  double v8 = objc_msgSend(v7, "invalidationContextForBoundsChange:");
  [v7 invalidateLayoutWithContext:v8];

  if ([v5 numberOfSections] < 1 || objc_msgSend(v5, "numberOfItemsInSection:", 0) < 1)
  {
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = 0;
  }
  else
  {
    lastFocusedIndexPath = [(_TVStackTemplateController *)self viewControllers];
    uint64_t v10 = [lastFocusedIndexPath count];
    if (v10)
    {
      double v11 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    }
    else
    {
      double v11 = 0;
    }
    objc_storeStrong((id *)&self->_lastFocusedIndexPath, v11);
    if (v10) {
  }
    }
  double v12 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = self->_lastFocusedIndexPath;
    if (v13)
    {
      objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](v13, "section"));
      double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v14 = @"-";
    }
    int v15 = 138412290;
    objc_super v16 = v14;
    _os_log_impl(&dword_230B4C000, v12, OS_LOG_TYPE_INFO, "LFIP: from scroll to top: %@", (uint8_t *)&v15, 0xCu);
    if (v13) {
  }
    }
}

- (id)_updateWithCollectionListElement:(id)a3 commits:(id *)a4 autoHighlightIndexPath:(id *)a5
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v72 = a3;
  v75 = self;
  v71 = self->_unfilteredViewControllers;
  double v6 = [MEMORY[0x263EFF980] array];
  double v7 = [MEMORY[0x263EFF980] array];
  id v73 = [v72 unfilteredChildrenChangeSet];
  if (v73 && v71)
  {
    [v6 addObjectsFromArray:v71];
    double v8 = [v73 removedIndexes];
    double v9 = (void *)[v8 mutableCopy];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x263F089C8] indexSet];
    }
    id v21 = v11;

    v74 = v21;
    v69 = [v6 objectsAtIndexes:v21];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    double v22 = [v73 movedIndexesByNewIndex];
    double v23 = [v22 allValues];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v105 objects:v112 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v106 != v25) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(v74, "addIndex:", objc_msgSend(*(id *)(*((void *)&v105 + 1) + 8 * i), "integerValue"));
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v105 objects:v112 count:16];
      }
      while (v24);
    }

    [v6 removeObjectsAtIndexes:v74];
    double v27 = [v73 addedIndexes];
    double v28 = (void *)[v27 mutableCopy];
    double v29 = v28;
    if (v28)
    {
      id v30 = v28;
    }
    else
    {
      id v30 = [MEMORY[0x263F089C8] indexSet];
    }
    uint64_t v31 = v30;

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    uint64_t v32 = [v73 movedIndexesByNewIndex];
    CGRect v33 = [v32 allKeys];

    uint64_t v34 = [v33 countByEnumeratingWithState:&v101 objects:v111 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v102;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v102 != v35) {
            objc_enumerationMutation(v33);
          }
          objc_msgSend(v31, "addIndex:", objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * j), "integerValue"));
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v101 objects:v111 count:16];
      }
      while (v34);
    }

    uint64_t v37 = [MEMORY[0x263EFF980] array];
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_2;
    v93[3] = &unk_264BA9870;
    id v38 = v72;
    id v94 = v38;
    id v39 = v73;
    id v95 = v39;
    id v66 = v37;
    id v96 = v66;
    id v100 = &__block_literal_global_47;
    v97 = v71;
    v98 = v75;
    id v70 = v7;
    id v99 = v70;
    [v31 enumerateIndexesUsingBlock:v93];
    [v6 insertObjects:v66 atIndexes:v31];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v40 = [v39 updatedIndexesByNewIndex];
    v41 = [v40 allKeys];

    uint64_t v42 = [v41 countByEnumeratingWithState:&v89 objects:v110 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v90;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v90 != v43) {
            objc_enumerationMutation(v41);
          }
          uint64_t v45 = objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * k), "integerValue", v66);
          v46 = [v38 unfilteredChildren];
          BOOL v47 = [v46 objectAtIndexedSubscript:v45];

          NSUInteger v48 = [v6 objectAtIndexedSubscript:v45];
          v49 = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke((uint64_t)v48, v47);
          id v50 = [(_TVStackCommonTemplateController *)v75 viewControllerWithElement:v47 layout:v49 existingController:v48];
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v89 objects:v110 count:16];
      }
      while (v42);
    }
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    double v12 = [v72 unfilteredChildren];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v85 objects:v109 count:16];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = *(void *)v86;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v86 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v85 + 1) + 8 * v16);
          double v18 = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke(v13, v17);
          double v19 = [(_TVStackCommonTemplateController *)v75 viewControllerWithElement:v17 layout:v18 existingController:0];
          if (v19)
          {
            [v6 addObject:v19];
          }
          else
          {
            double v20 = objc_opt_new();
            [v6 addObject:v20];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v85 objects:v109 count:16];
        uint64_t v14 = v13;
      }
      while (v13);
    }

    id v70 = v6;
    v69 = v71;
  }
  id v51 = [(_TVStackCommonTemplateController *)v75 viewElement];
  id v52 = [v51 attributes];
  v53 = [v52 objectForKeyedSubscript:@"preloading"];

  if (v53 && ![v53 BOOLValue])
  {
    [(NSMutableArray *)v75->_preloadQueue removeAllObjects];
  }
  else
  {
    if (!v75->_preloadQueue)
    {
      uint64_t v54 = [MEMORY[0x263EFF980] array];
      preloadQueue = v75->_preloadQueue;
      v75->_preloadQueue = (NSMutableArray *)v54;
    }
    if ([(NSArray *)v69 count]) {
      [(NSMutableArray *)v75->_preloadQueue removeObjectsInArray:v69];
    }
    id v56 = [v70 indexesOfObjectsPassingTest:&__block_literal_global_126];
    uint64_t v57 = v75->_preloadQueue;
    v58 = [v70 objectsAtIndexes:v56];
    [(NSMutableArray *)v57 addObjectsFromArray:v58];
  }
  [(_TVStackTemplateController *)v75 _scheduleNextPreloadConditional];
  if (a5)
  {
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2020000000;
    uint64_t v84 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v59 = [v72 unfilteredChildren];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_4;
    v80[3] = &unk_264BA98B8;
    v80[4] = &v81;
    [v59 enumerateObjectsUsingBlock:v80];

    if (v82[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      *a5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0);
      id v60 = objc_claimAutoreleasedReturnValue();
      *a5 = v60;
    }
    _Block_object_dispose(&v81, 8);
  }
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_5;
  v76[3] = &unk_264BA7740;
  v77 = v69;
  v78 = v75;
  v79 = v6;
  id v61 = v6;
  id v62 = v69;
  *a4 = (id)MEMORY[0x230FC9DC0](v76);
  v63 = v79;
  id v64 = v73;

  return v64;
}

- (void)_scheduleNextPreloadConditional
{
  if (!self->_flags._preloadingScheduled && [(NSMutableArray *)self->_preloadQueue count])
  {
    [(_TVStackTemplateController *)self showcaseFactor];
    [(_TVStackTemplateController *)self showcaseFactor];
    if (v3 != 1.0)
    {
      self->_flags._preloadingScheduled = 1;
      objc_initWeak(&location, self);
      dispatch_time_t v4 = dispatch_time(0, 500000000);
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __61___TVStackTemplateController__scheduleNextPreloadConditional__block_invoke;
      v5[3] = &unk_264BA6A38;
      objc_copyWeak(&v6, &location);
      dispatch_after(v4, MEMORY[0x263EF83A0], v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_preloadNext
{
  id v9 = [(NSMutableArray *)self->_preloadQueue firstObject];
  if (v9)
  {
    [(NSMutableArray *)self->_preloadQueue removeObjectAtIndex:0];
    double v3 = [(_TVStackCommonTemplateController *)self viewElement];
    dispatch_time_t v4 = [v3 appDocument];
    objc_msgSend(v4, "tv_adjustedWindowSize");
    double v6 = v5;
    double v8 = v7;

    objc_msgSend(v9, "preloadCellsInRect:", 0.0, 0.0, v6, v8);
    [(_TVStackTemplateController *)self _scheduleNextPreloadConditional];
  }
}

- (void)_adjustedContentOffsetForRowIndex:(int64_t)a3 targetContentOffset:(CGPoint *)a4
{
  double v7 = -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:");
  double v8 = [(_TVStackCommonTemplateController *)self collectionView];
  char v9 = objc_msgSend(v8, "tv_isFocusOnNonOwnedCell");

  if (v9) {
    goto LABEL_99;
  }
  uint64_t v10 = [(_TVStackCommonTemplateController *)self collectionView];
  [v10 bounds];
  double v12 = v11;
  [v10 contentInset];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(_TVStackCommonTemplateController *)self collectionView];
  [v17 contentOffset];
  double v90 = v18;

  double contentHeight = self->_contentHeight;
  CGFloat x = a4->x;
  CGFloat y = a4->y;
  int64_t v21 = a3 - 1;
  v93 = a4;
  if (a3 < 1)
  {
    double v23 = 0.0;
  }
  else
  {
    uint64_t v22 = 0;
    double v23 = 0.0;
    do
    {
      uint64_t v24 = [(NSArray *)self->_stackRows objectAtIndexedSubscript:v22];
      uint64_t v25 = v24;
      if (v24)
      {
        [v24 rowMetrics];
        double v26 = *((double *)&v138 + 1);
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        double v26 = 0.0;
        long long v138 = 0u;
      }
      double v23 = v23 + v26;

      ++v22;
    }
    while (a3 != v22);
  }
  double v27 = [(NSArray *)self->_stackRows objectAtIndexedSubscript:a3];
  double v28 = v27;
  if (v27)
  {
    [v27 rowMetrics];
    uint64_t v29 = *((void *)&v133 + 1);
  }
  else
  {
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v133 = 0u;
    uint64_t v29 = 0;
  }
  uint64_t v86 = v29;
  double v30 = v16 + contentHeight;

  if ([(NSArray *)self->_stackSections count])
  {
    uint64_t v31 = 0;
    while (1)
    {
      uint64_t v32 = -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", v31, v86);
      if ([v32 firstRowIndex] <= a3)
      {
        uint64_t v33 = [v32 firstRowIndex];
        if ([v32 rowCount] + v33 > a3) {
          break;
        }
      }

      if (++v31 >= [(NSArray *)self->_stackSections count]) {
        goto LABEL_18;
      }
    }
    if ([v7 isBounded])
    {
      BOOL v34 = 1;
      BOOL v35 = 1;
    }
    else
    {
      BOOL v34 = [v32 firstRowIndex] == a3;
      uint64_t v36 = [v32 firstRowIndex];
      BOOL v35 = v36 + [v32 rowCount] - 1 == a3;
    }
    BOOL v88 = v35;
  }
  else
  {
LABEL_18:
    BOOL v34 = 0;
    BOOL v88 = 0;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v92 = -v14;
  double v37 = v30 - v12;
  uint64_t v132 = 0;
  long long v130 = 0u;
  long long v131 = 0u;
  CGFloat v91 = x;
  if (v7)
  {
    [v7 rowMetrics];
    *(void *)&long long v131 = *((void *)&v125 + 1);
    *((void *)&v131 + 1) = a3;
    uint64_t v132 = 1;
    [v7 rowMetrics];
    [v7 rowMetrics];
    [v7 rowMetrics];
    double v38 = *((double *)&v120 + 1) - (*(double *)&v116 + *((double *)&v111 + 1));
    [v7 rowMetrics];
    double v39 = *(double *)&v106;
  }
  else
  {
    long long v128 = 0uLL;
    long long v129 = 0uLL;
    long long v126 = 0uLL;
    long long v127 = 0uLL;
    long long v124 = 0uLL;
    long long v125 = 0uLL;
    long long v120 = 0uLL;
    long long v121 = 0uLL;
    long long v122 = 0uLL;
    long long v123 = 0uLL;
    long long v115 = 0uLL;
    long long v116 = 0uLL;
    long long v117 = 0uLL;
    long long v118 = 0uLL;
    long long v119 = 0uLL;
    long long v113 = 0uLL;
    long long v114 = 0uLL;
    long long v111 = 0uLL;
    long long v112 = 0uLL;
    long long v109 = 0uLL;
    long long v110 = 0uLL;
    long long v107 = 0uLL;
    long long v108 = 0uLL;
    long long v105 = 0uLL;
    long long v106 = 0uLL;
    double v39 = 0.0;
    double v38 = 0.0;
    *((void *)&v131 + 1) = a3;
    uint64_t v132 = 1;
  }
  BOOL v40 = 0;
  double v41 = fmax(v92, v37);
  double v42 = v23 + v39 + v38 * 0.5;
  double v43 = v42 - v90;
  double v44 = v12 * 0.5;
  double v45 = v93->y;
  if (v45 != v92 && v45 != v41)
  {
    BOOL v40 = 1;
    if (v45 == v90 && v14 + v45 <= v23)
    {
      double v46 = v12 + v45 - v16;
      if (v7)
      {
        double v47 = v41;
        [v7 rowMetrics];
        double v41 = v47;
        double v48 = *((double *)&v100 + 1);
      }
      else
      {
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v100 = 0u;
        double v48 = 0.0;
      }
      BOOL v40 = v46 < v23 + v48;
    }
  }
  if (v34 && v43 >= v44)
  {
    BOOL v49 = v42 - v90 < v12 * 0.5;
    double v50 = v41;
    uint64_t v51 = 0;
LABEL_42:
    double v53 = y;
    uint64_t v54 = -[_TVStackTemplateController scrollStopForEnteringSectionAtIndex:fromEdge:](self, "scrollStopForEnteringSectionAtIndex:fromEdge:", v31, v51, v86);
    goto LABEL_44;
  }
  BOOL v52 = v43 < v44 && v88;
  BOOL v49 = v42 - v90 < v12 * 0.5;
  double v50 = v41;
  if (v52)
  {
    uint64_t v51 = 1;
    goto LABEL_42;
  }
  uint64_t v54 = 0;
  double v53 = y;
LABEL_44:
  if (v54) {
    BOOL v55 = 0;
  }
  else {
    BOOL v55 = v40;
  }
  if (!v55) {
    goto LABEL_55;
  }
  id v56 = [(NSArray *)self->_stackSections objectAtIndexedSubscript:v31];
  if ([v56 firstRowIndex] != a3)
  {

    goto LABEL_59;
  }
  BOOL requiresShowcasing = self->_requiresShowcasing;

  if (requiresShowcasing)
  {
    while (v31-- >= 1)
    {
      uint64_t v59 = [(NSArray *)self->_stackSections objectAtIndexedSubscript:v31];
      [v59 showcaseSectionHeight];
      double v61 = v60;

      if (v61 > 1.0) {
        goto LABEL_59;
      }
    }
    uint64_t v54 = [(_TVStackTemplateController *)self scrollStopForShowcaseTransition];
LABEL_55:
    if (v54)
    {
      [(_TVStackTemplateController *)self _offsetToScrollStop:v54];
      double v63 = 0.0;
      if (v62 > v42) {
        double v63 = v12;
      }
      double v53 = fmax(v92, fmin(v50, v62 - v63));

      goto LABEL_88;
    }
  }
LABEL_59:
  if (!v40) {
    goto LABEL_88;
  }
  if (![v7 isHosted]) {
    goto LABEL_88;
  }
  double v53 = -v14;
  if (![(_TVStackTemplateController *)self _didExtendContentForPeekMetrics:&v130 above:1 initial:1])goto LABEL_88; {
  double v53 = v50;
  }
  if (![(_TVStackTemplateController *)self _didExtendContentForPeekMetrics:&v130 above:0 initial:1])goto LABEL_88; {
  double v64 = floor((v12 - *(double *)&v131) * 0.5);
  }
  if (v64 > 45.0)
  {
    int v65 = 0;
    int v66 = v49;
    while (1)
    {
      long long v97 = v130;
      long long v98 = v131;
      uint64_t v99 = v132;
      if (-[_TVStackTemplateController _didExtendContentForPeekMetrics:above:initial:](self, "_didExtendContentForPeekMetrics:above:initial:", &v97, (v66 ^ 1) & 1, 0, v86)&& (double v67 = floor((v12 - *(double *)&v98) * 0.5), v67 >= 45.0))
      {
        long long v130 = v97;
        long long v131 = v98;
        uint64_t v132 = v99;
        double v64 = v67;
      }
      else
      {
        BOOL v68 = v64 <= *(double *)&v130;
        if (v64 > *((double *)&v130 + 1)) {
          BOOL v68 = 0;
        }
        if ((v68 | v65)) {
          break;
        }
        int v65 = 1;
        v66 ^= 1u;
        double v67 = v64;
      }
      if (v67 <= 45.0) {
        goto LABEL_75;
      }
    }
  }
  double v67 = v64;
LABEL_75:
  int64_t v69 = *((void *)&v131 + 1);
  double v70 = v23;
  if (v21 > *((uint64_t *)&v131 + 1))
  {
    double v70 = v23;
    do
    {
      v71 = -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v21, v86);
      id v72 = v71;
      if (v71)
      {
        [v71 rowMetrics];
        double v73 = *((double *)&v96 + 1);
      }
      else
      {
        double v73 = 0.0;
        long long v96 = 0u;
      }
      double v70 = v70 - v73;

      --v21;
    }
    while (v21 > v69);
  }
  double v74 = *(double *)&v130;
  v75 = -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v69, v86);
  v76 = v75;
  if (v74 > 0.0)
  {
    if (v75)
    {
      [v75 rowMetrics];
      double v77 = v95;
      goto LABEL_87;
    }
LABEL_86:
    double v77 = 0.0;
    goto LABEL_87;
  }
  if (!v75) {
    goto LABEL_86;
  }
  [v75 rowMetrics];
  double v77 = v94;
LABEL_87:

  double v53 = fmin(fmax(v92, v70 - v77 - v67), v50);
LABEL_88:
  [(_TVStackTemplateController *)self _scrollableBoundsInset];
  double v79 = v78;
  v80 = [(_TVStackCommonTemplateController *)self viewElement];
  uint64_t v81 = [v80 style];
  if (([v81 edgeFlagForStyle:@"tv-scrollable-bounds-inset"] & 1) != 0 && v53 < v12 - v14)
  {

    v82 = v93;
    if (v12 - v14 + -45.0 >= v23 + v87) {
      double v53 = -v14;
    }
  }
  else
  {

    v82 = v93;
  }
  uint64_t v83 = [(_TVStackCommonTemplateController *)self viewElement];
  uint64_t v84 = [v83 style];
  if (([v84 edgeFlagForStyle:@"tv-scrollable-bounds-inset"] & 4) != 0
    && v12 + v53 > v12 + v50 - v79)
  {

    CGFloat v85 = v91;
    if (v50 + 45.0 <= v23) {
      double v53 = v50;
    }
  }
  else
  {

    CGFloat v85 = v91;
  }
  v82->CGFloat x = v85;
  v82->CGFloat y = v53;

LABEL_99:
}

- (UIEdgeInsets)_scrollableBoundsInset
{
  v2 = [(_TVStackCommonTemplateController *)self viewElement];
  double v3 = [v2 style];
  objc_msgSend(v3, "tv_scrollableBoundsInset");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)_didExtendContentForPeekMetrics:(id *)a3 above:(BOOL)a4 initial:(BOOL)a5
{
  BOOL v23 = a5;
  BOOL v5 = a4;
  if (a4) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = 1;
  }
  NSUInteger location = a3->var3.location;
  if (!a4) {
    NSUInteger location = location + a3->var3.length - 1;
  }
  double v10 = [(NSArray *)self->_stackRows objectAtIndexedSubscript:location];
  double v11 = v10;
  double v12 = 0.0;
  if (!v23)
  {
    if (v10) {
      [v10 rowMetrics];
    }
    double v12 = 0.0 - 0.0;
  }
  char v13 = 0;
  int64_t v14 = location + v8;
  if (v14 >= 0)
  {
    int64_t v15 = -v14;
    while (v14 < [(NSArray *)self->_stackRows count])
    {
      double v16 = [(NSArray *)self->_stackRows objectAtIndexedSubscript:v14];
      uint64_t v17 = v16;
      if (v16) {
        [v16 rowMetrics];
      }
      NSUInteger v18 = a3->var3.location;
      if (v5)
      {
        NSUInteger v19 = v15 + a3->var3.length + v18;
        a3->var3.NSUInteger location = v14;
      }
      else
      {
        NSUInteger v19 = v14 - v18 + 1;
      }
      a3->var3.length = v19;
      if (!v23
        || ![v11 isBounded]
        || (uint64_t v20 = [v11 sectionIndex], v20 != objc_msgSend(v17, "sectionIndex")))
      {
        a3->var2 = a3->var2 + v12 + 0.0;
        uint64_t v21 = 8;
        if (v5) {
          uint64_t v21 = 0;
        }
        *(double *)((char *)&a3->var0 + v21) = 0.0 - (0.0 + 0.0);

        char v13 = 1;
        break;
      }
      a3->var2 = a3->var2 + v12 + 0.0;
      char v13 = 1;
      double v12 = 0.0;

      v14 += v8;
      v15 -= v8;
      if (v14 < 0) {
        break;
      }
    }
  }

  return v13 & 1;
}

- (double)_maxViewWidth
{
  v2 = [(_TVStackCommonTemplateController *)self viewElement];
  double v3 = [v2 appDocument];
  objc_msgSend(v3, "tv_adjustedWindowSize");
  double v5 = v4;

  return v5;
}

- (void)_invalidateSectionMetricsIfNeeded
{
  if (self->_shouldInvalidateMetrics)
  {
    self->_shouldInvalidateMetrics = 0;
    double v5 = objc_alloc_init(_TVStackViewFlowLayoutInvalidationContext);
    [(_TVStackViewFlowLayoutInvalidationContext *)v5 setInvalidateSectionMetrics:1];
    double v3 = [(_TVStackCommonTemplateController *)self collectionView];
    double v4 = [v3 collectionViewLayout];
    [v4 invalidateLayoutWithContext:v5];

    [(_TVStackTemplateController *)self _updateBackgroundTintView];
  }
}

- (void)_buildStackSections
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  BOOL requiresShowcasing = self->_requiresShowcasing;
  BOOL v79 = requiresShowcasing;
  [(_TVStackTemplateController *)self _maxViewWidth];
  uint64_t v5 = v4;
  double v6 = self->_unfilteredViewControllers;
  double v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (2 * -[NSArray count](v6, "count")) | 1);
  double v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  double v10 = [MEMORY[0x263F089C8] indexSet];
  double v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  double v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v92[0] = MEMORY[0x263EF8330];
  v92[1] = 3221225472;
  v92[2] = __49___TVStackTemplateController__buildStackSections__block_invoke;
  v92[3] = &unk_264BA98E0;
  v92[4] = self;
  uint64_t v99 = v5;
  BOOL v106 = requiresShowcasing;
  id v13 = v11;
  id v93 = v13;
  id v14 = v12;
  id v94 = v14;
  id v15 = v9;
  id v95 = v15;
  uint64_t v100 = 1;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v105 = 0;
  id v16 = v8;
  id v96 = v16;
  id v17 = v7;
  id v97 = v17;
  id v18 = v10;
  id v98 = v18;
  double v74 = v6;
  [(NSArray *)v6 enumerateObjectsUsingBlock:v92];
  double v70 = v18;
  NSUInteger v19 = (IKChangeSet *)[objc_alloc(MEMORY[0x263F4B408]) initWithAddedIndexes:0 removedIndexes:v18 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];
  filteredChangeSet = self->_filteredChangeSet;
  self->_filteredChangeSet = v19;

  id v72 = v15;
  uint64_t v21 = (NSArray *)[v15 copy];
  viewControllers = self->_viewControllers;
  v75 = self;
  self->_viewControllers = v21;

  BOOL v23 = objc_alloc_init(_TVStackRow);
  memset((char *)v91 + 8, 0, 72);
  *(void *)&v91[0] = 1;
  [(_TVStackRow *)v23 setRowMetrics:v91];
  int64_t v69 = v23;
  [v16 addObject:v23];
  double v73 = v13;
  uint64_t v24 = +[TVMLUtilities rowSpacingMetricsForRowMetrics:v13];
  uint64_t v25 = v24;
  v71 = v14;
  if (v79)
  {
    id v26 = +[TVMLUtilities rowSpacingMetricsForRowMetrics:v14 forShowcase:1];
  }
  else
  {
    id v26 = v24;
  }
  double v27 = v26;
  double v28 = self->_viewControllers;
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __49___TVStackTemplateController__buildStackSections__block_invoke_2;
  v85[3] = &unk_264BA9908;
  id v29 = v17;
  id v86 = v29;
  id v30 = v16;
  id v87 = v30;
  BOOL v88 = self;
  id v68 = v25;
  id v89 = v68;
  id v67 = v27;
  id v90 = v67;
  [(NSArray *)v28 enumerateObjectsUsingBlock:v85];
  int v66 = [(_TVStackCommonTemplateController *)self collectionView];
  [v66 bounds];
  double v32 = v31;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v33 = v29;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v81 objects:v107 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v82;
    double v37 = 0.0;
    uint64_t v76 = *(void *)v82;
    id v77 = v33;
    do
    {
      uint64_t v38 = 0;
      uint64_t v78 = v35;
      do
      {
        if (*(void *)v82 != v36) {
          objc_enumerationMutation(v33);
        }
        double v39 = *(void **)(*((void *)&v81 + 1) + 8 * v38);
        uint64_t v40 = [v39 firstRowIndex];
        v80 = v39;
        uint64_t v41 = [v39 rowCount];
        if (v41 >= 2)
        {
          uint64_t v42 = v41;
          double v43 = [v30 objectAtIndexedSubscript:v40];
          int v44 = [v43 isBounded];

          if (v44)
          {
            [v80 sectionHeight];
            double v46 = v45;
            uint64_t v47 = v40 - 1;
            uint64_t v48 = -1;
            do
            {
              uint64_t v49 = v48;
              if (v48 >= 0) {
                uint64_t v50 = v42 - 1;
              }
              else {
                uint64_t v50 = 0;
              }
              unint64_t v51 = v50 + v47;
              do
              {
                if ((v51 & 0x8000000000000000) != 0 || v51 >= [v30 count]) {
                  break;
                }
                memset(v91, 0, sizeof(v91));
                BOOL v52 = [v30 objectAtIndexedSubscript:v51];
                double v53 = v52;
                if (v52) {
                  [v52 rowMetrics];
                }
                else {
                  memset(v91, 0, sizeof(v91));
                }

                uint64_t v54 = (char *)&v91[1] + 8;
                if (v49 >= 0) {
                  uint64_t v54 = (char *)&v91[1];
                }
                v51 += v49;
                BOOL v55 = *(void *)&v91[0] == 1 ? (double *)((char *)v91 + 8) : (double *)v54;
                double v46 = v46 + *v55;
              }
              while (*(void *)&v91[0] == 1);
              uint64_t v48 = v49 + 2;
              v47 += 2;
            }
            while (v49 < 0);
            uint64_t v36 = v76;
            id v33 = v77;
            uint64_t v35 = v78;
            if ((v32 - v46) * 0.5 < 45.0)
            {
              do
              {
                id v56 = [v30 objectAtIndexedSubscript:v40];
                [v56 setBounded:0];

                ++v40;
                --v42;
              }
              while (v42);
            }
          }
        }
        [v80 sectionSpacing];
        double v58 = v57;
        [v80 sectionHeight];
        double v60 = v58 + v59;
        [v80 sectionSpacing];
        double v37 = v37 + v60 + v61;
        ++v38;
      }
      while (v38 != v35);
      uint64_t v35 = [v33 countByEnumeratingWithState:&v81 objects:v107 count:16];
    }
    while (v35);
  }
  else
  {
    double v37 = 0.0;
  }

  v75->_shouldInvalidateMetrics = ![(NSArray *)v75->_stackRows isEqualToArray:v30];
  v75->_double contentHeight = v37;
  uint64_t v62 = [v33 copy];
  stackSections = v75->_stackSections;
  v75->_stackSections = (NSArray *)v62;

  uint64_t v64 = [v30 copy];
  stackRows = v75->_stackRows;
  v75->_stackRows = (NSArray *)v64;

  [(_TVStackTemplateController *)v75 didUpdateSectionInfo];
  [(_TVStackTemplateController *)v75 _configureBackgroundTintView];
}

- (void)_updateFirstItemRowIndexes
{
  [(_TVStackTemplateController *)self _maxViewWidth];
  viewControllers = self->_viewControllers;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56___TVStackTemplateController__updateFirstItemRowIndexes__block_invoke;
  v5[3] = &unk_264BA6D00;
  v5[5] = v4;
  void v5[4] = self;
  [(NSArray *)viewControllers enumerateObjectsUsingBlock:v5];
}

- (double)_offsetToScrollStop:(id)a3
{
  id v4 = a3;
  if ([v4 sectionIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(_TVStackCommonTemplateController *)self collectionView];
    [v5 contentInset];
    double v7 = v6;
    double v9 = v8;

    if ([v4 edge]) {
      double contentHeight = self->_contentHeight;
    }
    else {
      double contentHeight = 0.0;
    }
    uint64_t v19 = [v4 edge];
    double v20 = -v9;
    if (!v19) {
      double v20 = v7;
    }
    double v21 = contentHeight - v20;
    [v4 offset];
    double v23 = v22 + v21;
  }
  else
  {
    if ([v4 sectionIndex] < 1)
    {
      double v12 = 0.0;
    }
    else
    {
      uint64_t v11 = 0;
      double v12 = 0.0;
      do
      {
        id v13 = [(NSArray *)self->_stackSections objectAtIndexedSubscript:v11];
        [v13 sectionSpacing];
        double v15 = v14;
        [v13 sectionHeight];
        double v17 = v15 + v16;
        [v13 sectionSpacing];
        double v12 = v12 + v17 + v18;

        ++v11;
      }
      while (v11 < [v4 sectionIndex]);
    }
    uint64_t v24 = -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", [v4 sectionIndex]);
    [v24 sectionSpacing];
    double v26 = v25;
    if ([v4 edge] == 1)
    {
      [v24 sectionHeight];
      double v28 = v27;
      if (v24)
      {
        [v24 compoundRowMetrics];
        double v29 = *((double *)&v40 + 1);
      }
      else
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v39 = 0u;
        double v29 = 0.0;
      }
      double v30 = v28 - v29;
    }
    else if (v24)
    {
      [v24 compoundRowMetrics];
      double v30 = *(double *)&v35;
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      double v30 = 0.0;
    }
    double v31 = v26 + v30;
    objc_msgSend(v4, "offset", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
    double v23 = v12 + v31 + v32;
  }
  return v23;
}

- (void)_configureBackgroundTintView
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  p_backdropTintViewController = &self->_backdropTintViewController;
  backdropTintViewController = self->_backdropTintViewController;
  self->_backdropTintViewController = 0;

  if ([(NSArray *)self->_viewControllers count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = self->_viewControllers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      NSUInteger location = (id *)p_backdropTintViewController;
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "tv_associatedIKViewElement", location);
          double v12 = [v11 attributes];
          id v13 = [v12 objectForKeyedSubscript:@"markBackgroundSegment"];
          int v14 = [v13 BOOLValue];

          if (v14)
          {
            p_backdropTintViewController = (UIViewController **)location;
            objc_storeStrong(location, v10);
            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      uint64_t v11 = 0;
      p_backdropTintViewController = (UIViewController **)location;
    }
    else
    {
      uint64_t v11 = 0;
    }
LABEL_13:

    if (*p_backdropTintViewController)
    {
      if (self->_backdropTintView)
      {
        [(_TVStackTemplateController *)self _updateBackgroundTintView];
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x263F1CB60]);
        double v16 = (UIView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        backdropTintView = self->_backdropTintView;
        self->_backdropTintView = v16;

        [(UIView *)self->_backdropTintView setAutoresizingMask:50];
        [(UIView *)self->_backdropTintView setUserInteractionEnabled:0];
        if ([(_TVStackTemplateController *)self isViewLoaded])
        {
          double v18 = [(_TVStackCommonTemplateController *)self collectionView];
          [v18 insertSubview:self->_backdropTintView atIndex:0];
        }
      }
      uint64_t v19 = self->_backdropTintView;
      double v20 = [v11 style];
      double v21 = objc_msgSend(v20, "tv_backgroundColor");
      double v22 = [v21 color];

      if (!v22)
      {
        double v22 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
      }
      [(UIView *)v19 setBackgroundColor:v22];
    }
    else
    {
      [(_TVStackTemplateController *)self _updateBackgroundTintView];
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
      double v21 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v3];
      uint64_t v6 = [(_TVStackCommonTemplateController *)self collectionView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;

      uint64_t v11 = [(_TVStackCommonTemplateController *)self collectionView];
      double v12 = [v11 layoutAttributesForItemAtIndexPath:v21];

      [v12 frame];
      double v14 = v13;
      [(_TVStackTemplateController *)self _maxContentSize];
      -[UIView setFrame:](self->_backdropTintView, "setFrame:", v8, v14, v10, fmax(v15 - v14, 0.0));
      double v16 = self->_backdropTintView;
      if (v16)
      {
        double v17 = [(_TVStackCommonTemplateController *)self collectionView];
        BOOL v18 = [(UIView *)v16 isDescendantOfView:v17];

        if (!v18)
        {
          uint64_t v19 = [(_TVStackCommonTemplateController *)self collectionView];
          [v19 insertSubview:self->_backdropTintView atIndex:0];
        }
      }
      double v20 = [(_TVStackCommonTemplateController *)self collectionView];
      [v20 sendSubviewToBack:self->_backdropTintView];

      [(_TVStackTemplateController *)self _updateBackgroundTintViewEffects];
      backdropTintView = v21;
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
    [(_TVStackTemplateController *)self _maxContentSize];
    double v11 = v10;
    [(UIView *)self->_backdropTintView frame];
    double v13 = fmax(v11 - v12, 0.0);
    if (v13 > 0.0)
    {
      double v14 = [(_TVStackCommonTemplateController *)self collectionView];
      [v14 contentSize];
      double v16 = v15;
      double v17 = [(_TVStackCommonTemplateController *)self collectionView];
      [v17 bounds];
      double v19 = v16 - v18;
      double v20 = [(_TVStackCommonTemplateController *)self collectionView];
      [v20 contentInset];
      double v22 = v19 - v21;

      double v23 = [(_TVStackCommonTemplateController *)self collectionView];
      [v23 contentOffset];
      double v25 = v24;

      if (v25 > v22)
      {
        long long v26 = [(_TVStackCommonTemplateController *)self collectionView];
        [v26 contentOffset];
        double v13 = v13 + v27 - v22;
      }
    }
    double v28 = self->_backdropTintView;
    -[UIView setFrame:](v28, "setFrame:", v5, v7, v9, v13);
  }
}

- (CGSize)_maxContentSize
{
  NSUInteger v3 = [(_TVStackCommonTemplateController *)self collectionView];
  [v3 contentSize];
  double v5 = v4;

  double v6 = [(_TVStackTemplateController *)self view];
  [v6 bounds];
  double v8 = v7;

  if (v5 < v8) {
    double v5 = v8;
  }
  double v9 = [(_TVStackCommonTemplateController *)self collectionView];
  [v9 contentSize];
  double v11 = v10;

  double v12 = [(_TVStackTemplateController *)self view];
  [v12 bounds];
  double v14 = v13;

  if (v11 >= v14) {
    double v15 = v11;
  }
  else {
    double v15 = v14;
  }
  double v16 = v5;
  result.CGFloat height = v15;
  result.CGFloat width = v16;
  return result;
}

- (double)showcaseInset
{
  return self->_showcaseInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropTintView, 0);
  objc_storeStrong((id *)&self->_backdropTintViewController, 0);
  objc_storeStrong((id *)&self->_needsMoreContentEvaluator, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_stackRows, 0);
  objc_storeStrong((id *)&self->_stackSections, 0);
  objc_storeStrong((id *)&self->_preloadQueue, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_filteredChangeSet, 0);
  objc_storeStrong((id *)&self->_unfilteredViewControllers, 0);
}

@end