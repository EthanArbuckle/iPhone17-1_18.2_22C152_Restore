@interface _TVMLCollectionViewController
+ (id)_shadowViewElementForCollectionElement:(id)a3;
+ (id)footerElementFromCollectionElement:(id)a3;
+ (id)headerElementFromCollectionElement:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (BOOL)isIndexDisplayEnabled;
- (BOOL)shouldHeaderFloatByDefault;
- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4;
- (Class)cellClassForElement:(id)a3;
- (IKCollectionElement)collectionElement;
- (IKViewElement)footerElement;
- (IKViewElement)headerElement;
- (NSArray)sortedIndexTitles;
- (NSDictionary)indexPathsByIndexTitle;
- (NSIndexPath)lastFocusedIndexPath;
- (TVCellMetrics)cellMetrics;
- (TVShowcaseConfig)showcaseConfig;
- (UICollectionView)collectionView;
- (UIViewController)footerViewController;
- (UIViewController)headerViewController;
- (_TVCollectionWrappingView)collectionWrappingView;
- (_TVMLCollectionViewController)init;
- (_TVShadowViewElement)shadowViewElement;
- (id)_closestIndexPathToIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)preferredScrollPosition;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_cancelImpressionsUpdate;
- (void)_doUpdateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4;
- (void)_recordImpressionsForVisibleView;
- (void)_registerCellClassesInCollectionView:(id)a3;
- (void)_registerPreviewInteractionController;
- (void)_updateFooterView;
- (void)_updateHeaderView;
- (void)_updateImpressions;
- (void)adjustContentOffsetToDisplayIndexPath:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4 completionBlock:(id)a5;
- (void)loadView;
- (void)preloadCellsInRect:(CGRect)a3;
- (void)resetLastFocusedIndexPath;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCollectionView:(id)a3;
- (void)setFooterViewController:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setIndexDisplayEnabled:(BOOL)a3;
- (void)setIndexPathsByIndexTitle:(id)a3;
- (void)setLastFocusedIndexPath:(id)a3;
- (void)setShadowViewElement:(id)a3;
- (void)setShowcaseConfig:(TVShowcaseConfig *)a3;
- (void)setSortedIndexTitles:(id)a3;
- (void)tv_setShowcaseConfig:(TVShowcaseConfig *)a3;
- (void)tv_updateViewLayout;
- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)updateVisibleCell:(id)a3 atIndexPath:(id)a4 withElement:(id)a5;
- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _TVMLCollectionViewController

+ (id)headerElementFromCollectionElement:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "children", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "tv_elementType") == 15)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)footerElementFromCollectionElement:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "children", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "tv_elementType") == 13)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (_TVMLCollectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVMLCollectionViewController;
  v2 = [(_TVMLCollectionViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_indexDisplayEnabled = 1;
    [(_TVMLCollectionViewController *)v2 setRestoresFocusAfterTransition:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(_TVMLCollectionViewController *)self collectionView];
  [v4 setDelegate:0];

  objc_super v5 = [(_TVMLCollectionViewController *)self collectionView];
  [v5 setDataSource:0];

  v6.receiver = self;
  v6.super_class = (Class)_TVMLCollectionViewController;
  [(_TVMLCollectionViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)_TVMLCollectionViewController;
  [(_TVMLCollectionViewController *)&v14 viewDidLoad];
  v3 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  [(_TVMLCollectionViewController *)self showcaseConfig];
  [v3 setShowcaseConfig:v13];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  if ([(_TVMLCollectionViewController *)self contentFlowsVertically]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  v7 = [_TVNeedsMoreContentEvaluator alloc];
  v8 = [(_TVMLCollectionViewController *)self collectionView];
  long long v9 = [(_TVNeedsMoreContentEvaluator *)v7 initWithScrollView:v8 axis:v6];
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  self->_needsMoreContentEvaluator = v9;

  long long v11 = self->_needsMoreContentEvaluator;
  long long v12 = [(_TVMLCollectionViewController *)self collectionElement];
  [(_TVNeedsMoreContentEvaluator *)v11 setViewElement:v12];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_TVMLCollectionViewController;
  [(_TVMLCollectionViewController *)&v8 viewDidLayoutSubviews];
  if (self->_didUpdateFocus)
  {
    self->_didUpdateFocus = 0;
    v3 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    [(_TVMLCollectionViewController *)self adjustContentOffsetToDisplayIndexPath:v3];
  }
  [(_TVMLCollectionViewController *)self setLastFocusedIndexPath:0];
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x263F158F8];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54___TVMLCollectionViewController_viewDidLayoutSubviews__block_invoke;
  v5[3] = &unk_264BA6A38;
  objc_copyWeak(&v6, &location);
  [v4 setCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  uint64_t v217 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id location = (id *)&self->_shadowViewElement;
  v133 = self->_shadowViewElement;
  v140 = self;
  v136 = v7;
  obuint64_t j = [(id)objc_opt_class() _shadowViewElementForCollectionElement:v7];
  p_collectionElement = &self->_collectionElement;
  objc_storeStrong((id *)&self->_collectionElement, a3);
  objc_super v8 = [(IKCollectionElement *)self->_collectionElement attributes];
  long long v9 = [v8 objectForKey:@"remembersFocus"];

  if (v9)
  {
    long long v10 = [(_TVMLCollectionViewController *)self collectionView];
    long long v11 = [(IKCollectionElement *)*p_collectionElement attributes];
    long long v12 = [v11 objectForKey:@"remembersFocus"];
    objc_msgSend(v10, "setRemembersLastFocusedIndexPath:", objc_msgSend(v12, "BOOLValue"));
  }
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController) {
    [(TVPreviewInteractionController *)previewInteractionController updatePresentingElement:*p_collectionElement];
  }
  objc_super v14 = [v136 appDocument];
  [v14 impressionThreshold];
  self->_impressionThreshold = v15;

  self->_cellMetrics.cellSize = a4->cellSize;
  long long v16 = *(_OWORD *)&a4->cellInset.bottom;
  long long v18 = *(_OWORD *)&a4->cellPadding.top;
  long long v17 = *(_OWORD *)&a4->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a4->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottouint64_t m = v16;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v18;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottouint64_t m = v17;
  long long v19 = *(_OWORD *)&a4->cellMargin.bottom;
  long long v21 = *(_OWORD *)&a4->cellInsetAlt.top;
  long long v20 = *(_OWORD *)&a4->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a4->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottouint64_t m = v19;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v21;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottouint64_t m = v20;
  uint64_t v206 = 0;
  v207 = &v206;
  uint64_t v208 = 0x3032000000;
  v209 = __Block_byref_object_copy__6;
  v210 = __Block_byref_object_dispose__6;
  id v211 = 0;
  v22 = [v136 sections];
  v205[0] = MEMORY[0x263EF8330];
  v205[1] = 3221225472;
  v205[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke;
  v205[3] = &unk_264BA8A18;
  v205[4] = &v206;
  [v22 enumerateObjectsUsingBlock:v205];

  if (!v207[5])
  {
    v23 = [v136 attributes];
    v24 = [v23 objectForKey:@"firstItem"];

    uint64_t v25 = +[TVMLUtilities indexPathForFirstItemAttributeValue:v24];
    v26 = (void *)v207[5];
    v207[5] = v25;
  }
  v27 = [(id)objc_opt_class() headerElementFromCollectionElement:v136];
  headerElement = self->_headerElement;
  self->_headerElement = v27;

  v29 = [(id)objc_opt_class() footerElementFromCollectionElement:v136];
  footerElement = self->_footerElement;
  self->_footerElement = v29;

  v31 = [MEMORY[0x263EFF9A0] dictionary];
  v32 = [v136 sections];
  v203[0] = MEMORY[0x263EF8330];
  v203[1] = 3221225472;
  v203[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2;
  v203[3] = &unk_264BA8A90;
  id v134 = v31;
  id v204 = v134;
  [v32 enumerateObjectsUsingBlock:v203];

  uint64_t v33 = [v134 count];
  if (v33) {
    v34 = (void *)[v134 copy];
  }
  else {
    v34 = 0;
  }
  [(_TVMLCollectionViewController *)self setIndexPathsByIndexTitle:v34];
  if (v33) {

  }
  v35 = [(_TVMLCollectionViewController *)self indexPathsByIndexTitle];
  v36 = [v35 allKeys];
  v202[0] = MEMORY[0x263EF8330];
  v202[1] = 3221225472;
  v202[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4;
  v202[3] = &unk_264BA8AB8;
  v202[4] = self;
  v37 = [v36 sortedArrayUsingComparator:v202];
  [(_TVMLCollectionViewController *)self setSortedIndexTitles:v37];

  if (![(_TVMLCollectionViewController *)self isViewLoaded])
  {
    objc_storeStrong(location, obj);
    v53 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    self->_didUpdateFocus = [v53 isEqual:v207[5]] ^ 1;

    [(_TVMLCollectionViewController *)self setLastFocusedIndexPath:v207[5]];
    goto LABEL_109;
  }
  self->_isPreparingCollectionUpdates = 1;
  v38 = [(_TVMLCollectionViewController *)self collectionView];
  [(_TVMLCollectionViewController *)self _registerCellClassesInCollectionView:v38];

  v39 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  v40 = [v39 collectionView];

  objc_msgSend(v40, "setSemanticContentAttribute:", objc_msgSend(v136, "tv_semanticContentAttribute"));
  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x2020000000;
  char v201 = 0;
  uint64_t v194 = 0;
  v195 = &v194;
  uint64_t v196 = 0x2020000000;
  char v197 = 0;
  uint64_t v188 = 0;
  v189 = &v188;
  uint64_t v190 = 0x3032000000;
  v191 = __Block_byref_object_copy__26;
  v192 = __Block_byref_object_dispose__27;
  id v193 = 0;
  v138 = [MEMORY[0x263EFF980] array];
  v139 = [MEMORY[0x263EFF980] array];
  v41 = [(_TVShadowViewElement *)v133 elementID];
  v42 = [obj elementID];
  if ([v41 isEqual:v42])
  {
    v43 = [(_TVMLCollectionViewController *)self view];
    v44 = [v43 window];
    BOOL v45 = v44 == 0;

    if (!v45)
    {
      v129 = [(_TVShadowViewElement *)v133 children];
      v46 = [obj children];
      v47 = [MEMORY[0x263F089C8] indexSet];
      v48 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v46, "count"));
      v49 = [MEMORY[0x263EFF9A0] dictionary];
      v50 = [MEMORY[0x263EFF9A0] dictionary];
      v182[0] = MEMORY[0x263EF8330];
      v182[1] = 3221225472;
      v182[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_30;
      v182[3] = &unk_264BA8AE0;
      id v125 = v46;
      id v183 = v125;
      id v51 = v47;
      id v184 = v51;
      id v127 = v48;
      id v185 = v127;
      id v52 = v50;
      id v186 = v52;
      id v128 = v49;
      id v187 = v128;
      [v129 enumerateObjectsUsingBlock:v182];
      v130 = [(_TVMLCollectionViewController *)v140 lastFocusedIndexPath];
      if (v207[5])
      {
        if (([v130 isEqual:v125] & 1) == 0)
        {
          v140->_didUpdateFocus = 1;
          [(_TVMLCollectionViewController *)v140 setLastFocusedIndexPath:v207[5]];
        }
      }
      else if (v130)
      {
        uint64_t v54 = [v130 section];
        if ([v51 containsIndex:v54])
        {
          uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v55 = [NSNumber numberWithInteger:v54];
          v56 = [v128 objectForKeyedSubscript:v55];
          if (v56)
          {
            v57 = [NSNumber numberWithInteger:v54];
            v58 = [v128 objectForKeyedSubscript:v57];
            uint64_t v54 = [v58 integerValue];
          }
        }
        uint64_t v59 = objc_msgSend(v130, "item", v125);
        if (v54 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_31;
        }
        uint64_t v60 = v59;
        v61 = [v125 objectAtIndex:v54];
        v62 = [v61 elementID];
        v63 = [v62 viewElement];

        v64 = [v63 itemsChangeSet];
        v65 = v64;
        if (v64) {
          uint64_t v60 = [v64 newIndexForOldIndex:v60];
        }

        if (v60 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_31:
          v66 = [(_TVMLCollectionViewController *)v140 _closestIndexPathToIndexPath:v130];
          [(_TVMLCollectionViewController *)v140 setLastFocusedIndexPath:v66];
        }
        else
        {
          v66 = [MEMORY[0x263F088C8] indexPathForItem:v60 inSection:v54];
          [(_TVMLCollectionViewController *)v140 setLastFocusedIndexPath:v66];
        }

        v67 = [(_TVMLCollectionViewController *)v140 lastFocusedIndexPath];
        char v68 = [v130 isEqual:v67];

        if ((v68 & 1) == 0) {
          v140->_didUpdateFocus = 1;
        }
      }
      long long v180 = 0u;
      long long v181 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      v69 = objc_msgSend(v40, "indexPathsForVisibleItems", v125);
      uint64_t v70 = [v69 countByEnumeratingWithState:&v178 objects:v216 count:16];
      if (v70)
      {
        uint64_t v71 = *(void *)v179;
        do
        {
          for (uint64_t i = 0; i != v70; ++i)
          {
            if (*(void *)v179 != v71) {
              objc_enumerationMutation(v69);
            }
            v73 = *(void **)(*((void *)&v178 + 1) + 8 * i);
            if (objc_msgSend(v51, "containsIndex:", objc_msgSend(v73, "section"))) {
              [v138 addObject:v73];
            }
          }
          uint64_t v70 = [v69 countByEnumeratingWithState:&v178 objects:v216 count:16];
        }
        while (v70);
      }

      v74 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
      v168[0] = MEMORY[0x263EF8330];
      v168[1] = 3221225472;
      v168[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2_33;
      v168[3] = &unk_264BA8B30;
      id v75 = v129;
      id v169 = v75;
      id v76 = v126;
      id v170 = v76;
      id v171 = v138;
      v172 = v140;
      id v77 = v40;
      id v173 = v77;
      v176 = &v194;
      id v174 = v139;
      v177 = &v198;
      id v78 = v74;
      id v175 = v78;
      [v52 enumerateKeysAndObjectsUsingBlock:v168];
      if (!*((unsigned char *)v199 + 24)
        && ([v78 count]
         || [v51 count]
         || [v127 count]
         || [v128 count]))
      {
        v162[0] = MEMORY[0x263EF8330];
        v162[1] = 3221225472;
        v162[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4_36;
        v162[3] = &unk_264BA74A8;
        id v163 = v77;
        id v164 = v51;
        id v165 = v127;
        id v166 = v128;
        id v167 = v78;
        uint64_t v79 = MEMORY[0x230FC9DC0](v162);
        v80 = (void *)v189[5];
        v189[5] = v79;
      }
      goto LABEL_51;
    }
  }
  else
  {
  }
  *((unsigned char *)v199 + 24) = 1;
LABEL_51:
  v161[0] = MEMORY[0x263EF8330];
  v161[1] = 3221225472;
  v161[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_9;
  v161[3] = &unk_264BA8BF0;
  v161[4] = v140;
  v161[5] = &v194;
  v131 = (void (**)(void))MEMORY[0x230FC9DC0](v161);
  if (*((unsigned char *)v199 + 24))
  {
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    v81 = [v40 visibleCells];
    uint64_t v82 = [v81 countByEnumeratingWithState:&v145 objects:v213 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v82; ++j)
        {
          if (*(void *)v146 != v83) {
            objc_enumerationMutation(v81);
          }
          objc_msgSend(*(id *)(*((void *)&v145 + 1) + 8 * j), "tv_setBelongsToOldIndexPath:", 1);
        }
        uint64_t v82 = [v81 countByEnumeratingWithState:&v145 objects:v213 count:16];
      }
      while (v82);
    }

    uint64_t v85 = [(_TVMLCollectionViewController *)v140 lastFocusedIndexPath];
    v86 = (void *)v85;
    if (v207[5])
    {
      -[_TVMLCollectionViewController setLastFocusedIndexPath:](v140, "setLastFocusedIndexPath:");
    }
    else if (v85)
    {
      v93 = [(_TVMLCollectionViewController *)v140 _closestIndexPathToIndexPath:v85];
      [(_TVMLCollectionViewController *)v140 setLastFocusedIndexPath:v93];
    }
    v94 = [(_TVMLCollectionViewController *)v140 lastFocusedIndexPath];
    char v95 = [v86 isEqual:v94];

    if ((v95 & 1) == 0) {
      v140->_didUpdateFocus = 1;
    }
    v131[2]();
    [v40 reloadData];
  }
  else
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v87 = v138;
    uint64_t v88 = [v87 countByEnumeratingWithState:&v157 objects:v215 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v158;
      do
      {
        for (uint64_t k = 0; k != v88; ++k)
        {
          if (*(void *)v158 != v89) {
            objc_enumerationMutation(v87);
          }
          v91 = [v40 cellForItemAtIndexPath:*(void *)(*((void *)&v157 + 1) + 8 * k)];
          objc_msgSend(v91, "tv_setBelongsToOldIndexPath:", 1);
        }
        uint64_t v88 = [v87 countByEnumeratingWithState:&v157 objects:v215 count:16];
      }
      while (v88);
    }

    if (v189[5] || *((unsigned char *)v195 + 24))
    {
      v153[0] = MEMORY[0x263EF8330];
      v153[1] = 3221225472;
      v153[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_10;
      v153[3] = &unk_264BA8C40;
      id v154 = v40;
      v155 = v131;
      v156 = &v188;
      v92 = (void (**)(void))MEMORY[0x230FC9DC0](v153);
      if ([MEMORY[0x263F1CB60] _isInAnimationBlock]) {
        [MEMORY[0x263F1CB60] performWithoutAnimation:v92];
      }
      else {
        v92[2](v92);
      }
    }
    else
    {
      v131[2]();
    }
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    v86 = [v40 preparedCells];
    uint64_t v96 = [v86 countByEnumeratingWithState:&v149 objects:v214 count:16];
    if (v96)
    {
      uint64_t v97 = *(void *)v150;
      double v98 = *MEMORY[0x263F00148];
      double v99 = *(double *)(MEMORY[0x263F00148] + 8);
      do
      {
        for (uint64_t m = 0; m != v96; ++m)
        {
          if (*(void *)v150 != v97) {
            objc_enumerationMutation(v86);
          }
          v101 = *(void **)(*((void *)&v149 + 1) + 8 * m);
          v102 = [v40 indexPathForCell:v101];
          if (v102 || (objc_opt_respondsToSelector() & 1) == 0)
          {
            id v103 = v102;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v101, "performSelector:", sel__layoutAttributes), "indexPath");
            id v103 = (id)objc_claimAutoreleasedReturnValue();
          }
          v104 = v103;

          if (v104 && [v139 containsObject:v104])
          {
            v105 = [(IKCollectionElement *)*p_collectionElement sections];
            v106 = objc_msgSend(v105, "objectAtIndexedSubscript:", objc_msgSend(v104, "section"));

            v107 = objc_msgSend(v106, "elementForItemAtIndex:", objc_msgSend(v104, "item"));
            [v101 center];
            double v109 = v108;
            double v111 = v110;
            [(_TVMLCollectionViewController *)v140 expectedCellSizeForElement:v107 atIndexPath:v104];
            objc_msgSend(v101, "setBounds:", v98, v99, v112, v113);
            objc_msgSend(v101, "setCenter:", v109, v111);
            [(_TVMLCollectionViewController *)v140 updateVisibleCell:v101 atIndexPath:v104 withElement:v107];
          }
        }
        uint64_t v96 = [v86 countByEnumeratingWithState:&v149 objects:v214 count:16];
      }
      while (v96);
    }
  }

  objc_storeStrong(location, obj);
  [(_TVMLCollectionViewController *)v140 didUpdateCollectionViewByNeedingReload:*((unsigned __int8 *)v199 + 24) focusUpdate:v140->_didUpdateFocus];
  [(_TVNeedsMoreContentEvaluator *)v140->_needsMoreContentEvaluator setViewElement:v136];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v114 = [v136 sections];
  uint64_t v115 = [v114 countByEnumeratingWithState:&v141 objects:v212 count:16];
  if (v115)
  {
    uint64_t v116 = *(void *)v142;
    while (2)
    {
      for (uint64_t n = 0; n != v115; ++n)
      {
        if (*(void *)v142 != v116) {
          objc_enumerationMutation(v114);
        }
        v118 = *(void **)(*((void *)&v141 + 1) + 8 * n);
        v119 = [v118 itemsChangeSet];
        if ([v118 updateType] == 4) {
          goto LABEL_107;
        }
        v120 = [v119 addedIndexes];
        if ([v120 count]) {
          goto LABEL_106;
        }
        v121 = [v119 removedIndexes];
        if ([v121 count])
        {

LABEL_106:
LABEL_107:

          [(_TVNeedsMoreContentEvaluator *)v140->_needsMoreContentEvaluator reset];
          v114 = [(_TVMLCollectionViewController *)v140 view];
          [v114 setNeedsLayout];
          goto LABEL_108;
        }
        v122 = [v119 movedIndexesByNewIndex];
        BOOL v123 = [v122 count] == 0;

        if (!v123) {
          goto LABEL_107;
        }
      }
      uint64_t v115 = [v114 countByEnumeratingWithState:&v141 objects:v212 count:16];
      if (v115) {
        continue;
      }
      break;
    }
  }
LABEL_108:

  _Block_object_dispose(&v188, 8);
  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v198, 8);

LABEL_109:
  if (v140->_didUpdateFocus && [(_TVMLCollectionViewController *)v140 isViewLoaded])
  {
    [(_TVMLCollectionViewController *)v140 setNeedsFocusUpdate];
    v124 = [(_TVMLCollectionViewController *)v140 view];
    [v124 setNeedsLayout];
  }
  _Block_object_dispose(&v206, 8);
}

- (_TVCollectionWrappingView)collectionWrappingView
{
  if ([(_TVMLCollectionViewController *)self isViewLoaded])
  {
    v3 = [(_TVMLCollectionViewController *)self view];
  }
  else
  {
    v3 = 0;
  }
  return (_TVCollectionWrappingView *)v3;
}

- (void)tv_setShowcaseConfig:(TVShowcaseConfig *)a3
{
  TVShowcaseConfig v6 = *a3;
  [(_TVMLCollectionViewController *)self setShowcaseConfig:&v6];
  objc_super v5 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  TVShowcaseConfig v6 = *a3;
  [v5 setShowcaseConfig:&v6];
}

- (unint64_t)preferredScrollPosition
{
  return 0;
}

- (BOOL)shouldHeaderFloatByDefault
{
  return 1;
}

- (Class)cellClassForElement:(id)a3
{
  return 0;
}

- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(_TVMLCollectionViewController *)self cellMetrics];
  double v9 = v34;
  double v8 = v35;
  if (v34 == 0.0)
  {
    long long v10 = [v6 style];
    objc_msgSend(v10, "tv_width");
    double v9 = v11;

    long long v12 = [v6 style];
    objc_msgSend(v12, "tv_height");
    double v14 = v13;

    if (v14 <= 0.0 || v9 <= 0.0)
    {
      double v15 = [v6 objectForKeyedSubscript:@"TVFactoryKeyCellMetrics"];
      long long v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "tv_cellMetricsValue");
        double v9 = *(double *)&v25;
      }
      else
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        double v9 = 0.0;
        long long v25 = 0u;
      }
    }
    else
    {
      double v8 = v14;
    }
  }
  if (v9 < 0.0 || v8 < 0.0)
  {
    long long v17 = [(_TVMLCollectionViewController *)self collectionElement];
    long long v18 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
    {
      long long v21 = v18;
      uint64_t v22 = [v7 section];
      uint64_t v23 = [v7 item];
      v24 = [v17 debugDescription];
      *(_DWORD *)buf = 134219010;
      double v37 = v9;
      __int16 v38 = 2048;
      double v39 = v8;
      __int16 v40 = 2048;
      uint64_t v41 = v22;
      __int16 v42 = 2048;
      uint64_t v43 = v23;
      __int16 v44 = 2112;
      BOOL v45 = v24;
      _os_log_error_impl(&dword_230B4C000, v21, OS_LOG_TYPE_ERROR, "CollectionLayout: invalid cell size: {%lf, %lf} for [%ld, %ld] in: %@", buf, 0x34u);
    }
  }

  double v19 = v9;
  double v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateVisibleCell:(id)a3 atIndexPath:(id)a4 withElement:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = v8;
  if (v7)
  {
    long long v10 = (void *)MEMORY[0x263F08D40];
    double v11 = [v8 style];
    objc_msgSend(v11, "tv_focusMargin");
    long long v12 = objc_msgSend(v10, "valueWithUIEdgeInsets:");
    [v7 setValue:v12 forTVViewStyle:@"tv-focus-margin"];

    double v13 = (void *)MEMORY[0x263F08D40];
    [(_TVMLCollectionViewController *)self cellMetrics];
    double v14 = objc_msgSend(v13, "valueWithUIEdgeInsets:", v20, v21, v22, v23);
    [v7 setValue:v14 forTVViewStyle:@"padding"];

    double v15 = NSNumber;
    long long v16 = [(IKCollectionElement *)self->_collectionElement style];
    long long v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "tv_contentAlignment"));
    [v7 setValue:v17 forTVViewStyle:@"tv-content-align"];

    long long v18 = +[TVInterfaceFactory sharedInterfaceFactory];
    id v19 = (id)[v18 _viewFromElement:v9 existingView:v7];
  }
}

- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v10 = a3;
  objc_super v5 = [(_TVMLCollectionViewController *)self view];
  uint64_t v6 = [v5 window];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v10 nextFocusedIndexPath];

    if (!v8) {
      goto LABEL_5;
    }
    double v9 = [v10 nextFocusedIndexPath];
    [(_TVMLCollectionViewController *)self setLastFocusedIndexPath:v9];

    objc_super v5 = [v10 nextFocusedIndexPath];
    [(_TVMLCollectionViewController *)self dispatchEvent:@"highlight" forItemAtIndexPath:v5 completionBlock:0];
  }

LABEL_5:
}

- (void)dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4 completionBlock:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(_TVMLCollectionViewController *)self collectionElement];
  double v11 = [v10 sections];
  long long v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v9, "section"));

  double v13 = objc_msgSend(v12, "elementForItemAtIndex:", objc_msgSend(v9, "row"));
  double v14 = [(_TVMLCollectionViewController *)self collectionView];
  double v15 = [v14 cellForItemAtIndexPath:v9];

  if (([v13 isDisabled] & 1) == 0) {
    objc_msgSend(v13, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", v16, 1, 1, 0, v15, v8);
  }
}

- (void)loadView
{
  v3 = [_TVCollectionWrappingView alloc];
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  double v13 = -[_TVCollectionWrappingView initWithFrame:](v3, "initWithFrame:");

  [(_TVCollectionWrappingView *)v13 setAutoresizingMask:18];
  objc_super v5 = [(IKCollectionElement *)self->_collectionElement style];
  uint64_t v6 = objc_msgSend(v5, "tv_backgroundColor");

  [(_TVCollectionWrappingView *)v13 setIkBackgroundColor:v6];
  [(_TVMLCollectionViewController *)self setView:v13];
  [(_TVCollectionWrappingView *)v13 bounds];
  id v7 = -[_TVMLCollectionViewController makeCollectionViewWithFrame:](self, "makeCollectionViewWithFrame:");
  [(_TVMLCollectionViewController *)self _registerCellClassesInCollectionView:v7];
  objc_msgSend(v7, "setSemanticContentAttribute:", -[IKCollectionElement tv_semanticContentAttribute](self->_collectionElement, "tv_semanticContentAttribute"));
  [v7 setAutoresizingMask:18];
  [v7 setShowsHorizontalScrollIndicator:0];
  [v7 setShowsVerticalScrollIndicator:0];
  [v7 setDelegate:self];
  [v7 setDataSource:self];
  [v7 _setContentInsetAdjustmentBehavior:2];
  id v8 = [(IKCollectionElement *)self->_collectionElement attributes];
  id v9 = [v8 objectForKey:@"remembersFocus"];

  if (v9)
  {
    id v10 = [(IKCollectionElement *)self->_collectionElement attributes];
    double v11 = [v10 objectForKey:@"remembersFocus"];
    objc_msgSend(v7, "setRemembersLastFocusedIndexPath:", objc_msgSend(v11, "BOOLValue"));
  }
  [(_TVMLCollectionViewController *)self setCollectionView:v7];
  [(_TVCollectionWrappingView *)v13 setCollectionView:v7];
  if ([(_TVMLCollectionViewController *)self contentFlowsVertically])
  {
    long long v12 = [(_TVMLCollectionViewController *)self collectionView];
    -[_TVCollectionWrappingView setHeaderAuxiliarySelecting:](v13, "setHeaderAuxiliarySelecting:", [v12 isScrollEnabled] ^ 1);
  }
  else
  {
    [(_TVCollectionWrappingView *)v13 setHeaderAuxiliarySelecting:1];
  }
  [(_TVMLCollectionViewController *)self _updateHeaderView];
  [(_TVMLCollectionViewController *)self _updateFooterView];
  [(_TVMLCollectionViewController *)self _registerPreviewInteractionController];
  [(_TVMLCollectionViewController *)self _doUpdateViewLayoutAnimated:0 relayout:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVMLCollectionViewController;
  [(_TVMLCollectionViewController *)&v4 viewDidAppear:a3];
  self->_didAppear = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVMLCollectionViewController;
  [(_TVMLCollectionViewController *)&v4 viewDidDisappear:a3];
  [(_TVMLCollectionViewController *)self _cancelImpressionsUpdate];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController) {
    [(TVPreviewInteractionController *)previewInteractionController dismissInteractionView];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVMLCollectionViewController;
  [(_TVMLCollectionViewController *)&v5 viewWillDisappear:a3];
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController) {
    [(TVPreviewInteractionController *)previewInteractionController dismissInteractionView];
  }
}

- (void)tv_updateViewLayout
{
  v3 = [(_TVMLCollectionViewController *)self collectionElement];
  +[_TVLockupFactory cellMetricsForCollectionElement:v3];

  BOOL v4 = self->_cellMetrics.cellSize.width == 0.0 && self->_cellMetrics.cellSize.height == 0.0;
  if (!v4
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)0, *(float64x2_t *)&self->_cellMetrics.cellPadding.top), (int32x4_t)vceqq_f64((float64x2_t)0, *(float64x2_t *)&self->_cellMetrics.cellPadding.bottom))), 0xFuLL))) & 1) == 0)
  {
    *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottouint64_t m = 0u;
    *(_OWORD *)&self->_cellMetrics.cellMargin.top = 0u;
    *(_OWORD *)&self->_cellMetrics.cellMargin.bottouint64_t m = 0u;
    *(_OWORD *)&self->_cellMetrics.cellPadding.bottouint64_t m = 0u;
    *(_OWORD *)&self->_cellMetrics.cellInset.top = 0u;
    *(_OWORD *)&self->_cellMetrics.cellInset.bottouint64_t m = 0u;
    *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = 0u;
    self->_cellMetrics.cellSize = 0u;
    *(_OWORD *)&self->_cellMetrics.cellPadding.top = 0u;
    if ([(_TVMLCollectionViewController *)self isViewLoaded]) {
      [(_TVMLCollectionViewController *)self _doUpdateViewLayoutAnimated:1 relayout:1];
    }
  }
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  if (v3)
  {
    BOOL v4 = [(_TVMLCollectionViewController *)self collectionWrappingView];
    v7[0] = v4;
    objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    objc_super v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = [(_TVMLCollectionViewController *)self collectionElement];
  BOOL v4 = [v3 sections];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v5 = [(_TVMLCollectionViewController *)self collectionElement];
  objc_super v6 = [v5 sections];
  id v7 = [v6 objectAtIndex:a4];

  int64_t v8 = [v7 numberOfItems];
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (self->_isPreparingCollectionUpdates)
  {
    objc_super v6 = [(_TVMLCollectionViewController *)self shadowViewElement];
    id v7 = [v6 children];
    int64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

    id v9 = [(_TVMLCollectionViewController *)self collectionView];
    id v10 = [v8 resourceName];
    double v11 = [v9 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v5];
  }
  else
  {
    long long v12 = [(_TVMLCollectionViewController *)self collectionElement];
    double v13 = [v12 sections];
    double v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v5, "section"));

    double v15 = objc_msgSend(v14, "elementForItemAtIndex:", objc_msgSend(v5, "item"));
    id v16 = [v15 elementName];
    if (objc_msgSend(v15, "tv_elementType") == 24)
    {
      double v39 = v16;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v17 = [v15 children];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v36 = v15;
        id v37 = v5;
        __int16 v38 = v14;
        uint64_t v20 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v45 != v20) {
              objc_enumerationMutation(v17);
            }
            double v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (objc_msgSend(v22, "tv_elementType") == 16 && !objc_msgSend(v22, "tv_imageType"))
            {
              id v23 = v22;
              v24 = [v23 url];
              if (objc_msgSend(v24, "tv_isResourceURL"))
              {
                long long v25 = +[TVInterfaceFactory sharedInterfaceFactory];
                long long v26 = objc_msgSend(v24, "tv_resourceName");
                uint64_t v27 = [v25 URLForResource:v26];

                v24 = (void *)v27;
              }
              if (v24)
              {
                if (objc_msgSend(v24, "tv_imageURLType") == 1)
                {
                  id v16 = [NSString stringWithFormat:@"%@-LCR", v39];

                  double v15 = v36;
                  id v5 = v37;
                }
                else
                {
                  double v15 = v36;
                  id v5 = v37;
                  id v16 = v39;
                }

                double v14 = v38;
                goto LABEL_23;
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v19) {
            continue;
          }
          break;
        }
        id v5 = v37;
        double v14 = v38;
        double v15 = v36;
      }
      id v16 = v39;
LABEL_23:
    }
    long long v28 = [(_TVMLCollectionViewController *)self collectionView];
    double v11 = [v28 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v5];

    long long v29 = objc_opt_new();
    long long v30 = [v15 style];
    objc_msgSend(v30, "tv_focusMargin");
    objc_msgSend(v29, "setFocusMargin:");

    [(_TVMLCollectionViewController *)self cellMetrics];
    objc_msgSend(v29, "setPadding:", v40, v41, v42, v43);
    long long v31 = [(IKCollectionElement *)self->_collectionElement style];
    objc_msgSend(v29, "setContentAlignment:", objc_msgSend(v31, "tv_contentAlignment"));

    objc_msgSend(v11, "tv_setAssociatedIKViewElement:", 0);
    long long v32 = +[TVInterfaceFactory sharedInterfaceFactory];
    long long v33 = [v32 _viewFromElement:v15 layout:v29 existingView:v11];

    if (v33 != v11)
    {
      double v34 = [v11 contentView];
      [v34 addSubview:v33];
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v6 = a4;
  id v7 = [(_TVMLCollectionViewController *)self indexPathsByIndexTitle];
  int64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = (void *)*MEMORY[0x263F1D020];
  id v8 = a5;
  id v9 = a4;
  objc_msgSend(v9, "tv_setDisplayed:", objc_msgSend(v7, "applicationState") == 0);

  id v10 = [(_TVMLCollectionViewController *)self collectionElement];
  double v11 = [v10 sections];
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = [v8 item];
  [v13 loadIndex:v12];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  objc_msgSend(v11, "tv_setDisplayed:", 0);
  if ((objc_msgSend(v11, "tv_belongsToOldIndexPath") & 1) == 0)
  {
    id v8 = [(_TVMLCollectionViewController *)self collectionElement];
    id v9 = [v8 sections];
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    objc_msgSend(v10, "unloadIndex:", objc_msgSend(v7, "item"));
  }
  objc_msgSend(v11, "tv_setBelongsToOldIndexPath:", 0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v10[3] = &unk_264BA8C68;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_TVMLCollectionViewController *)self dispatchEvent:@"select" forItemAtIndexPath:v8 completionBlock:v10];
}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController) {
    return [(TVPreviewInteractionController *)previewInteractionController collectionView:a3 shouldHandleLongPressForItemAtIndexPath:a4];
  }
  else {
    return 1;
  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_TVMLCollectionViewController *)self view];
  id v11 = [v10 window];

  if (v11)
  {
    id v12 = [v8 previouslyFocusedIndexPath];
    id v13 = [v8 nextFocusedIndexPath];
    if (([v12 isEqual:v13] & 1) == 0)
    {
      double v14 = [v16 cellForItemAtIndexPath:v12];
      objc_msgSend(v14, "tv_setFocused:", 0);
      double v15 = [v16 cellForItemAtIndexPath:v13];
      objc_msgSend(v15, "tv_setFocused:", 1);
    }
  }
  [(_TVMLCollectionViewController *)self updateFocusInContext:v8 withAnimationCoordinator:v9];
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  if (objc_msgSend(a3, "tv_isFocusOnNonOwnedCell")) {
    lastFocusedIndexPath = 0;
  }
  else {
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
  }
  return lastFocusedIndexPath;
}

- (void)scrollViewDidScroll:(id)a3
{
  BOOL v4 = [(_TVMLCollectionViewController *)self collectionView];
  [v4 bounds];
  CGFloat rect = v5;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  id v12 = [(_TVMLCollectionViewController *)self collectionView];
  [v12 contentInset];
  double v14 = v13;
  double v16 = v15;
  double v28 = v17;
  double v19 = v18;

  uint64_t v20 = [(_TVMLCollectionViewController *)self collectionView];
  [v20 contentSize];
  double v22 = v21;
  double v24 = v23;

  if (([(_TVMLCollectionViewController *)self contentFlowsVertically] & 1) == 0)
  {
    v31.origin.x = rect;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    if (v19 + v16 + v22 <= CGRectGetWidth(v31)) {
      goto LABEL_5;
    }
  }
  if ([(_TVMLCollectionViewController *)self contentFlowsVertically])
  {
    v32.origin.x = rect;
    v32.origin.y = v7;
    v32.size.width = v9;
    v32.size.height = v11;
    if (v28 + v14 + v24 <= CGRectGetHeight(v32))
    {
LABEL_5:
      long long v25 = [(_TVMLCollectionViewController *)self collectionView];
      objc_msgSend(v25, "setContentOffset:animated:", 0, -v16, -v14);
    }
  }
  [(_TVNeedsMoreContentEvaluator *)self->_needsMoreContentEvaluator evaluateForState:2];
  long long v26 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  [v26 reevaluateHeaderFrame];

  uint64_t v27 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  [v27 reevaluateFooterFrame];

  if (self->_didAppear)
  {
    [(_TVMLCollectionViewController *)self _updateImpressions];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v7 = [(_TVMLCollectionViewController *)self collectionView];
  char v8 = objc_msgSend(v7, "tv_isFocusOnNonOwnedCell");

  if (v8) {
    return;
  }
  CGFloat v9 = [MEMORY[0x263F1C920] mainScreen];
  id v30 = [v9 focusedView];

  double v10 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  if (![v10 isHeaderFloating]
    || ![(_TVMLCollectionViewController *)self contentFlowsVertically])
  {
    goto LABEL_6;
  }
  CGFloat v11 = [(_TVMLCollectionViewController *)self collectionView];
  int v12 = [v30 isDescendantOfView:v11];

  if (v12)
  {
    double v13 = [(_TVMLCollectionViewController *)self collectionView];
    [v30 bounds];
    objc_msgSend(v13, "convertRect:fromView:", v30);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    double MinY = CGRectGetMinY(v32);
    double v23 = [(_TVMLCollectionViewController *)self collectionView];
    [v23 _gradientMaskEdgeInsets];
    double v25 = v24;
    long long v26 = [(_TVMLCollectionViewController *)self collectionView];
    [v26 _gradientMaskLengths];
    double v28 = MinY - (v25 + v27);

    double v10 = [(_TVMLCollectionViewController *)self collectionView];
    [v10 contentInset];
    a5->y = fmin(fmax(v28, -v29), a5->y);
LABEL_6:
  }
}

- (void)_updateImpressions
{
  [(_TVMLCollectionViewController *)self _cancelImpressionsUpdate];
  if (self->_impressionThreshold > 0.0)
  {
    -[_TVMLCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
  }
}

- (void)_cancelImpressionsUpdate
{
}

- (void)_recordImpressionsForVisibleView
{
  v3 = [(_TVMLCollectionViewController *)self view];
  BOOL v4 = [v3 window];

  if (v4)
  {
    id v6 = [(IKCollectionElement *)self->_collectionElement appDocument];
    double v5 = -[_TVMLCollectionViewController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    if ([v5 count]) {
      [v6 recordImpressionsForViewElements:v5];
    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(IKCollectionElement *)self->_collectionElement appDocument];
  if ([v5 isEqual:v4])
  {
    id v6 = [(_TVMLCollectionViewController *)self collectionView];
    CGFloat v7 = [v6 visibleCells];

    char v8 = [MEMORY[0x263EFF980] array];
    if ([(_TVMLCollectionViewController *)self isViewLoaded])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            double v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4, (void)v20);
            [v8 addObjectsFromArray:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }

      CGFloat v15 = [(_TVMLCollectionViewController *)self collectionWrappingView];
      double v16 = [v15 headerView];
      CGFloat v17 = objc_msgSend(v16, "tv_impressionableElementsForDocument:", v4);
      [v8 addObjectsFromArray:v17];
    }
    if (objc_msgSend(v8, "count", (void)v20))
    {
      double v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      double v18 = 0;
    }
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

- (void)preloadCellsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v8 = [(_TVMLCollectionViewController *)self view];
  [v8 layoutBelowIfNeeded];

  id v9 = [(_TVMLCollectionViewController *)self collectionView];
  objc_msgSend(v9, "_ensureViewsAreLoadedInRect:", x, y, width, height);
}

- (void)resetLastFocusedIndexPath
{
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(_TVMLCollectionViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "tv_setDisplayed:", 1);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(_TVMLCollectionViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "tv_setDisplayed:", 0);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)adjustContentOffsetToDisplayIndexPath:(id)a3
{
  id v57 = a3;
  if (v57)
  {
    id v4 = [(_TVMLCollectionViewController *)self collectionView];
    [v4 layoutBelowIfNeeded];

    unint64_t v5 = [(_TVMLCollectionViewController *)self preferredScrollPosition];
    uint64_t v6 = [(_TVMLCollectionViewController *)self collectionView];
    uint64_t v7 = [v6 layoutAttributesForItemAtIndexPath:v57];
    [v7 frame];
    double v53 = v9;
    double v54 = v8;
    double v11 = v10;
    double v52 = v12;

    double v13 = [(_TVMLCollectionViewController *)self collectionView];
    [v13 contentInset];
    double v50 = v15;
    double v51 = v14;
    double v55 = v17;
    double v56 = v16;

    double v18 = [(_TVMLCollectionViewController *)self collectionView];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;

    long long v23 = [(_TVMLCollectionViewController *)self collectionView];
    [v23 contentOffset];
    double v25 = v24;
    double v27 = v26;
    double v28 = v24;
    double v29 = v26;

    id v30 = [(_TVMLCollectionViewController *)self collectionView];
    [v30 contentSize];
    double v49 = v31;
    double v33 = v32;

    if ([(_TVMLCollectionViewController *)self contentFlowsVertically])
    {
      double v34 = v11 + v52 + v50 - v22;
      double v35 = v11 - v51;
      double v36 = v11 + v52 * 0.5 - v22 * 0.5;
      if (v34 >= v36) {
        double v36 = v11 + v52 + v50 - v22;
      }
      if (v35 >= v36) {
        double v37 = v36;
      }
      else {
        double v37 = v11 - v51;
      }
      if (v27 < v34 || v29 > v35)
      {
        if (v5 == 1)
        {
          double v37 = v11 - v51;
        }
        else if (v5 != 2)
        {
          if (v5 == 4)
          {
            double v37 = v11 + v52 + v50 - v22;
          }
          else
          {
            double v37 = v11 + v52 + v50 - v22;
            if (v27 >= v34)
            {
              if (v27 <= v35) {
                double v37 = v27;
              }
              else {
                double v37 = v11 - v51;
              }
            }
          }
        }
        if (v37 >= v50 + v33 - v22) {
          double v47 = v50 + v33 - v22;
        }
        else {
          double v47 = v37;
        }
        if (v47 >= -v51) {
          double v29 = v47;
        }
        else {
          double v29 = -v51;
        }
      }
    }
    else
    {
      double v39 = v54 + v53 + v55 - v20;
      double v40 = v54 - v56;
      double v41 = v54 + v53 * 0.5 - v20 * 0.5;
      if (v39 >= v41) {
        double v41 = v54 + v53 + v55 - v20;
      }
      if (v40 >= v41) {
        double v42 = v41;
      }
      else {
        double v42 = v54 - v56;
      }
      double v43 = [(_TVMLCollectionViewController *)self view];
      uint64_t v44 = [v43 effectiveUserInterfaceLayoutDirection];

      if (v25 < v39 || v28 > v40)
      {
        double v46 = v55 + v49 - v20;
        if (v5 == 8)
        {
          double v42 = v54 - v56;
        }
        else if (v5 != 16)
        {
          if (v5 == 32)
          {
            double v42 = v54 + v53 + v55 - v20;
          }
          else if (v44 == 1)
          {
            double v42 = v54 + v53 + v55 - v20;
          }
          else
          {
            double v42 = v54 - v56;
          }
        }
        if (v42 < v46) {
          double v46 = v42;
        }
        if (v46 >= -v56) {
          double v28 = v46;
        }
        else {
          double v28 = -v56;
        }
      }
    }
    if (v25 != v28 || v27 != v29)
    {
      v48 = [(_TVMLCollectionViewController *)self collectionView];
      objc_msgSend(v48, "setContentOffset:animated:", 0, v28, v29);
    }
  }
}

+ (id)_shadowViewElementForCollectionElement:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(_TVShadowViewElement);
  double v17 = [[_TVShadowViewElementID alloc] initWithViewElement:v3];
  -[_TVShadowViewElement setElementID:](v4, "setElementID:");
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v18 = v3;
  uint64_t v6 = [v3 sections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 elementType] == 49)
        {
          double v12 = [[_TVShadowViewElementID alloc] initWithViewElement:v11];
          double v13 = objc_alloc_init(_TVShadowViewElement);
          [(_TVShadowViewElement *)v13 setElementID:v12];
          [(_TVShadowViewElement *)v13 setParent:v4];
          if ([v11 numberOfItems] >= 1)
          {
            double v14 = [v11 elementForItemAtIndex:0];
            double v15 = [v14 elementName];

            [(_TVShadowViewElement *)v13 setResourceName:v15];
          }
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [(_TVShadowViewElement *)v4 setChildren:v5];
  }

  return v4;
}

- (void)_doUpdateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(_TVMLCollectionViewController *)self view];
  uint64_t v8 = [(_TVMLCollectionViewController *)self collectionElement];
  [v7 transferLayoutStylesFromElement:v8];

  [(_TVMLCollectionViewController *)self updateViewLayoutAnimated:v5 relayout:v4];
}

- (void)_updateHeaderView
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  id v4 = [(_TVMLCollectionViewController *)self headerViewController];
  BOOL v5 = +[TVInterfaceFactory sharedInterfaceFactory];
  uint64_t v6 = [(_TVMLCollectionViewController *)self headerElement];
  id v7 = [v5 _viewControllerFromElement:v6 existingController:v4];

  if (!v7)
  {
    uint64_t v8 = [v4 view];
    uint64_t v9 = +[TVInterfaceFactory sharedInterfaceFactory];
    double v10 = [(_TVMLCollectionViewController *)self headerElement];
    double v11 = [v9 _viewFromElement:v10 existingView:v8];

    if (v11)
    {
      if (v11 == v8)
      {
        id v7 = v4;
      }
      else
      {
        id v7 = objc_alloc_init(MEMORY[0x263F1CB68]);
        [v7 setView:v11];
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  if (v7 != v4)
  {
    [v4 willMoveToParentViewController:0];
    if (v7) {
      [(_TVMLCollectionViewController *)self addChildViewController:v7];
    }
    double v12 = [v4 view];
    [v12 removeFromSuperview];

    double v13 = [v7 view];
    [v3 setHeaderView:v13];

    [v4 removeFromParentViewController];
    [v7 didMoveToParentViewController:self];
  }
  [(_TVMLCollectionViewController *)self setHeaderViewController:v7];
  double v14 = [(IKViewElement *)self->_headerElement attributes];
  double v15 = [v14 objectForKeyedSubscript:@"floating"];

  if ([v15 length]) {
    uint64_t v16 = [v15 BOOLValue];
  }
  else {
    uint64_t v16 = [(_TVMLCollectionViewController *)self shouldHeaderFloatByDefault];
  }
  [v3 setHeaderFloating:v16];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v17 = [(IKViewElement *)self->_headerElement children];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "tv_elementType") == 50)
        {
          uint64_t v18 = 1;
          goto LABEL_25;
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  [v3 setHeaderCanBecomeFocused:v18];
  long long v21 = [v3 headerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v23 = [v3 headerView];
    [v23 setGestureTargetView:v3];
  }
}

- (void)_registerPreviewInteractionController
{
  if (!self->_previewInteractionController)
  {
    id v3 = [(_TVMLCollectionViewController *)self collectionView];

    if (v3)
    {
      id v8 = [(IKCollectionElement *)self->_collectionElement appDocument];
      id v4 = [(_TVMLCollectionViewController *)self collectionView];
      BOOL v5 = [(_TVMLCollectionViewController *)self collectionElement];
      objc_msgSend(v8, "tv_interactionPreviewControllerForViewController:presentingView:presentingElement:", self, v4, v5);
      uint64_t v6 = (TVPreviewInteractionController *)objc_claimAutoreleasedReturnValue();

      previewInteractionController = self->_previewInteractionController;
      self->_previewInteractionController = v6;
    }
  }
}

- (void)_updateFooterView
{
  id v13 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  id v3 = [(_TVMLCollectionViewController *)self footerViewController];
  id v4 = +[TVInterfaceFactory sharedInterfaceFactory];
  BOOL v5 = [(_TVMLCollectionViewController *)self footerElement];
  id v6 = [v4 _viewControllerFromElement:v5 existingController:v3];

  if (!v6)
  {
    id v7 = [v3 view];
    id v8 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v9 = [(_TVMLCollectionViewController *)self footerElement];
    double v10 = [v8 _viewFromElement:v9 existingView:v7];

    if (v10)
    {
      if (v10 == v7)
      {
        id v6 = v3;
      }
      else
      {
        id v6 = objc_alloc_init(MEMORY[0x263F1CB68]);
        [v6 setView:v10];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  if (v6 != v3)
  {
    [v3 willMoveToParentViewController:0];
    if (v6) {
      [(_TVMLCollectionViewController *)self addChildViewController:v6];
    }
    double v11 = [v3 view];
    [v11 removeFromSuperview];

    double v12 = [v6 view];
    [v13 setFooterView:v12];

    [v3 removeFromParentViewController];
    [v6 didMoveToParentViewController:self];
  }
  [(_TVMLCollectionViewController *)self setFooterViewController:v6];
}

- (void)_registerCellClassesInCollectionView:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF9C0] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v25 = self;
  id v6 = [(_TVMLCollectionViewController *)self collectionElement];
  id v7 = [v6 sections];

  obuint64_t j = v7;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v8;
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v10 = [v9 prototypes];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v16 = [v15 elementName];
              if (([v5 containsObject:v16] & 1) == 0)
              {
                [v5 addObject:v16];
                double v17 = +[TVInterfaceFactory sharedInterfaceFactory];
                uint64_t v18 = [v17 _collectionViewCellClassForElement:v15];
                if (v18)
                {
                  uint64_t v19 = v18;
                }
                else
                {
                  uint64_t v19 = [(_TVMLCollectionViewController *)v25 cellClassForElement:v15];

                  if (!v19)
                  {
                    uint64_t v19 = objc_opt_class();
                    if (!v19) {
                      goto LABEL_18;
                    }
                  }
                }
                [v4 registerClass:v19 forCellWithReuseIdentifier:v16];
                if (objc_msgSend(v15, "tv_elementType") == 24)
                {
                  long long v20 = [NSString stringWithFormat:@"%@-LCR", v16];
                  [v4 registerClass:v19 forCellWithReuseIdentifier:v20];
                }
              }
LABEL_18:
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }
}

- (id)_closestIndexPathToIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_TVMLCollectionViewController *)self collectionElement];
  id v6 = [v5 sections];

  unint64_t v7 = [v4 section];
  if (v7 >= [v6 count]
    || (objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 numberOfItems],
        v8,
        v9 < 1))
  {
    uint64_t v17 = [v4 section];
    while (++v17 < (unint64_t)[v6 count])
    {
      uint64_t v18 = [v6 objectAtIndexedSubscript:v17];
      uint64_t v19 = [v18 numberOfItems];

      if (v19 >= 1)
      {
        long long v20 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v17];
        if (v20) {
          goto LABEL_18;
        }
        break;
      }
    }
    uint64_t v21 = [v4 section] - 1;
    uint64_t v22 = [v6 count];
    if (v21 >= v22 - 1) {
      uint64_t v23 = v22 - 1;
    }
    else {
      uint64_t v23 = v21;
    }
    if (v23 < 0)
    {
LABEL_15:
      long long v20 = 0;
      goto LABEL_18;
    }
    while (1)
    {
      uint64_t v24 = [v6 objectAtIndexedSubscript:v23];
      uint64_t v25 = [v24 numberOfItems];

      if (v25 >= 1) {
        break;
      }
      if (v23-- <= 0) {
        goto LABEL_15;
      }
    }
    long long v27 = (void *)MEMORY[0x263F088C8];
    uint64_t v12 = [v6 objectAtIndexedSubscript:v23];
    uint64_t v16 = [v12 numberOfItems] - 1;
    double v15 = v27;
    uint64_t v14 = v23;
  }
  else
  {
    double v10 = (void *)MEMORY[0x263F088C8];
    double v11 = (double)[v4 item];
    uint64_t v12 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    uint64_t v13 = (uint64_t)fmin(v11, (double)([v12 numberOfItems] - 1));
    uint64_t v14 = [v4 section];
    double v15 = v10;
    uint64_t v16 = v13;
  }
  long long v20 = [v15 indexPathForItem:v16 inSection:v14];

LABEL_18:
  return v20;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
}

- (IKCollectionElement)collectionElement
{
  return self->_collectionElement;
}

- (IKViewElement)headerElement
{
  return self->_headerElement;
}

- (TVCellMetrics)cellMetrics
{
  long long v3 = *(_OWORD *)&self[8].cellInsetAlt.top;
  *(_OWORD *)&retstr->cellInsetAlt.bottouint64_t m = *(_OWORD *)&self[8].cellInset.bottom;
  *(_OWORD *)&retstr->cellMargin.top = v3;
  *(_OWORD *)&retstr->cellMargin.bottouint64_t m = *(_OWORD *)&self[8].cellInsetAlt.bottom;
  long long v4 = *(_OWORD *)&self[8].cellPadding.top;
  *(CGSize *)&retstr->cellPadding.bottouint64_t m = self[8].cellSize;
  *(_OWORD *)&retstr->cellInset.top = v4;
  long long v5 = *(_OWORD *)&self[8].cellInset.top;
  *(_OWORD *)&retstr->cellInset.bottouint64_t m = *(_OWORD *)&self[8].cellPadding.bottom;
  *(_OWORD *)&retstr->cellInsetAlt.top = v5;
  long long v6 = *(_OWORD *)&self[7].cellMargin.bottom;
  retstr->cellSize = *(CGSize *)&self[7].cellMargin.top;
  *(_OWORD *)&retstr->cellPadding.top = v6;
  return self;
}

- (UIViewController)footerViewController
{
  return self->_footerViewController;
}

- (void)setFooterViewController:(id)a3
{
}

- (IKViewElement)footerElement
{
  return self->_footerElement;
}

- (NSIndexPath)lastFocusedIndexPath
{
  return self->_lastFocusedIndexPath;
}

- (void)setLastFocusedIndexPath:(id)a3
{
}

- (BOOL)isIndexDisplayEnabled
{
  return self->_indexDisplayEnabled;
}

- (void)setIndexDisplayEnabled:(BOOL)a3
{
  self->_indexDisplayEnabled = a3;
}

- (_TVShadowViewElement)shadowViewElement
{
  return self->_shadowViewElement;
}

- (void)setShadowViewElement:(id)a3
{
}

- (TVShowcaseConfig)showcaseConfig
{
  *retstr = *(TVShowcaseConfig *)((char *)self + 1096);
  return self;
}

- (void)setShowcaseConfig:(TVShowcaseConfig *)a3
{
  double inset = a3->inset;
  *(_OWORD *)&self->_showcaseConfig.flavor = *(_OWORD *)&a3->flavor;
  self->_showcaseConfig.double inset = inset;
}

- (NSDictionary)indexPathsByIndexTitle
{
  return self->_indexPathsByIndexTitle;
}

- (void)setIndexPathsByIndexTitle:(id)a3
{
}

- (NSArray)sortedIndexTitles
{
  return self->_sortedIndexTitles;
}

- (void)setSortedIndexTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedIndexTitles, 0);
  objc_storeStrong((id *)&self->_indexPathsByIndexTitle, 0);
  objc_storeStrong((id *)&self->_shadowViewElement, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_footerElement, 0);
  objc_storeStrong((id *)&self->_footerViewController, 0);
  objc_storeStrong((id *)&self->_headerElement, 0);
  objc_storeStrong((id *)&self->_collectionElement, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_storeStrong((id *)&self->_needsMoreContentEvaluator, 0);
}

@end