@interface _TVCarouselViewController
+ (id)headerElementFromCollectionElement:(id)a3;
- (BOOL)_needsDefaultCarouselCells;
- (CGSize)viewSizeThatFits:(CGSize)a3;
- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (unint64_t)numberOfItemsInCarouselView:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_cancelImpressionsUpdate;
- (void)_dispatchEvent:(id)a3 forItemAtIndex:(unint64_t)a4 cell:(id)a5;
- (void)_playButtonAction:(id)a3;
- (void)_recordImpressionsForVisibleView;
- (void)_registerCellClasses;
- (void)_selectButtonAction:(id)a3;
- (void)_updateAutoScrollInterval;
- (void)_updateHeaderView;
- (void)_updateImpressions;
- (void)_updateLayout;
- (void)_updateLayoutAndReload;
- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(unint64_t)a5;
- (void)carouselView:(id)a3 didEndDisplayingItemAtIndex:(unint64_t)a4;
- (void)carouselView:(id)a3 didFocusItemAtIndex:(unint64_t)a4;
- (void)carouselView:(id)a3 didSelectItemAtIndex:(unint64_t)a4;
- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(unint64_t)a5;
- (void)carouselView:(id)a3 willDisplayItemAtIndex:(unint64_t)a4;
- (void)carouselViewDidScroll:(id)a3;
- (void)centerItemAtPageIndex:(int64_t)a3;
- (void)dealloc;
- (void)loadView;
- (void)updateWithViewElement:(id)a3 layout:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation _TVCarouselViewController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselViewController;
  [(_TVCarouselViewController *)&v4 dealloc];
}

- (void)_updateHeaderView
{
  id v5 = [(_TVCarouselView *)self->_carouselView headerView];
  v3 = +[TVInterfaceFactory sharedInterfaceFactory];
  objc_super v4 = [v3 _viewFromElement:self->_headerElement existingView:v5];

  [(_TVCarouselView *)self->_carouselView setHeaderView:v4];
}

- (void)loadView
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = -[TVMLCarouselView initWithFrame:]([TVMLCarouselView alloc], "initWithFrame:", v5, v7, v9, v11);
  carouselView = self->_carouselView;
  self->_carouselView = &v12->super;

  [(_TVCarouselView *)self->_carouselView setDataSource:self];
  [(_TVCarouselView *)self->_carouselView setDelegate:self];
  [(_TVCarouselView *)self->_carouselView setAutoscrollInterval:10.0];
  [(_TVCarouselViewController *)self setView:self->_carouselView];
  [(_TVCarouselViewController *)self _registerCellClasses];
  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  id v17 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__selectButtonAction_];
  [v17 setAllowedPressTypes:&unk_26E59EB48];
  [(_TVCarouselView *)self->_carouselView addGestureRecognizer:v17];
  v16 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__playButtonAction_];
  [v16 setAllowedPressTypes:&unk_26E59EB60];
  [(_TVCarouselView *)self->_carouselView addGestureRecognizer:v16];
  [(_TVCarouselViewController *)self _updateHeaderView];
  [(_TVCarouselViewController *)self _updateAutoScrollInterval];
  [(_TVCarouselViewController *)self _updateLayoutAndReload];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselViewController;
  [(_TVCarouselViewController *)&v4 viewDidAppear:a3];
  self->_flags.didAppear = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselViewController;
  [(_TVCarouselViewController *)&v4 viewDidDisappear:a3];
  [(_TVCarouselViewController *)self _cancelImpressionsUpdate];
}

- (CGSize)viewSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(_TVCarouselViewController *)self view];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_carouselView)
  {
    v4[0] = self->_carouselView;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (BOOL)_needsDefaultCarouselCells
{
  return [(TVCarouselLayout *)self->_carouselLayout layoutType] == 0;
}

- (unint64_t)numberOfItemsInCarouselView:(id)a3
{
  v3 = [(IKCollectionElement *)self->_collectionElement sections];
  objc_super v4 = [v3 firstObject];
  unint64_t v5 = [v4 numberOfItems];

  return v5;
}

- (void)_registerCellClasses
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(IKCollectionElement *)self->_collectionElement sections];
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v4;
        unint64_t v5 = *(void **)(*((void *)&v23 + 1) + 8 * v4);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        double v6 = [v5 prototypes];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              double v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
              v12 = +[TVInterfaceFactory sharedInterfaceFactory];
              uint64_t v13 = [v12 _collectionViewCellClassForElement:v11];

              v14 = [v11 elementName];
              if (([v3 containsObject:v14] & 1) == 0)
              {
                [v3 addObject:v14];
                [(_TVCarouselView *)self->_carouselView registerClass:v13 forCellWithReuseIdentifier:v14];
              }

              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  collectionElement = self->_collectionElement;
  id v7 = a3;
  uint64_t v8 = [(IKCollectionElement *)collectionElement sections];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = [v9 elementForItemAtIndex:a4];
  double v11 = [v10 elementName];
  v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndex:a4];

  [v12 transferLayoutStylesFromElement:v10];
  uint64_t v13 = (void *)MEMORY[0x263F08D40];
  [(TVCarouselLayout *)self->_carouselLayout cellPadding];
  v14 = objc_msgSend(v13, "valueWithUIEdgeInsets:");
  [v12 setValue:v14 forTVViewStyle:@"padding"];

  objc_msgSend(v12, "tv_setAssociatedIKViewElement:", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 setSelectSubviews:0];
    [v12 setDelegate:self];
  }
  v15 = objc_opt_new();
  objc_msgSend(v15, "setCenterGrowth:", -[TVCarouselLayout layoutType](self->_carouselLayout, "layoutType") == 0);
  uint64_t v16 = +[TVInterfaceFactory sharedInterfaceFactory];
  id v17 = (id)[v16 _viewFromElement:v10 layout:v15 existingView:v12];

  return v12;
}

- (void)carouselViewDidScroll:(id)a3
{
  if (self->_flags.didAppear) {
    [(_TVCarouselViewController *)self _updateImpressions];
  }
}

- (void)carouselView:(id)a3 didFocusItemAtIndex:(unint64_t)a4
{
  id v6 = [a3 focusedCell];
  [(_TVCarouselViewController *)self _dispatchEvent:@"highlight" forItemAtIndex:a4 cell:v6];
}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  unint64_t v5 = (void *)*MEMORY[0x263F1D020];
  id v6 = a4;
  objc_msgSend(v6, "tv_setDisplayed:", objc_msgSend(v5, "applicationState") == 0);
}

- (void)carouselView:(id)a3 willDisplayItemAtIndex:(unint64_t)a4
{
  unint64_t v5 = [(IKCollectionElement *)self->_collectionElement sections];
  id v6 = [v5 firstObject];

  [v6 loadIndex:a4];
}

- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
}

- (void)carouselView:(id)a3 didEndDisplayingItemAtIndex:(unint64_t)a4
{
  if (!self->_flags.indexesDirty)
  {
    unint64_t v5 = [(IKCollectionElement *)self->_collectionElement sections];
    id v6 = [v5 firstObject];

    [v6 unloadIndex:a4];
  }
}

- (void)carouselView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [a3 focusedCell];
    [(_TVCarouselViewController *)self _dispatchEvent:@"select" forItemAtIndex:a4 cell:v7];
  }
}

- (void)_updateImpressions
{
  v3 = [(IKCollectionElement *)self->_collectionElement appDocument];
  [v3 impressionThreshold];
  double v5 = v4;

  [(_TVCarouselViewController *)self _cancelImpressionsUpdate];
  if (v5 > 0.0)
  {
    [(_TVCarouselViewController *)self performSelector:sel__recordImpressionsForVisibleView withObject:0 afterDelay:v5];
  }
}

- (void)_cancelImpressionsUpdate
{
}

- (void)_recordImpressionsForVisibleView
{
  v3 = [(_TVCarouselViewController *)self view];
  double v4 = [v3 window];

  if (v4)
  {
    id v6 = [(IKCollectionElement *)self->_collectionElement appDocument];
    double v5 = -[_TVCarouselViewController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    if ([v5 count]) {
      [v6 recordImpressionsForViewElements:v5];
    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(IKCollectionElement *)self->_collectionElement appDocument];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    id v7 = [(_TVCarouselView *)self->_carouselView subviews];
    uint64_t v8 = [v7 firstObject];

    uint64_t v9 = [v8 visibleCells];
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    if ([(_TVCarouselViewController *)self isViewLoaded])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4, (void)v19);
            [v10 addObjectsFromArray:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
    if (objc_msgSend(v10, "count", (void)v19))
    {
      id v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v10];
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_playButtonAction:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3);
  id v8 = [v4 focusedView];

  double v5 = v8;
  if (v8)
  {
    while (1)
    {
      id v9 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v9 superview];

      double v5 = (void *)v6;
      if (!v6) {
        goto LABEL_7;
      }
    }
    uint64_t v7 = [(_TVCarouselView *)self->_carouselView indexForCell:v9];
    double v5 = v9;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(_TVCarouselViewController *)self _dispatchEvent:@"play" forItemAtIndex:v7 cell:v9];
      double v5 = v9;
    }
  }
LABEL_7:
}

- (void)_selectButtonAction:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3);
  id v8 = [v4 focusedView];

  double v5 = v8;
  if (v8)
  {
    while (1)
    {
      id v9 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v9 superview];

      double v5 = (void *)v6;
      if (!v6) {
        goto LABEL_7;
      }
    }
    uint64_t v7 = [(_TVCarouselView *)self->_carouselView indexForCell:v9];
    double v5 = v9;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(_TVCarouselViewController *)self _dispatchEvent:@"select" forItemAtIndex:v7 cell:v9];
      double v5 = v9;
    }
  }
LABEL_7:
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(_TVCarouselView *)self->_carouselView visibleCells];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "tv_setDisplayed:", 1);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(_TVCarouselView *)self->_carouselView visibleCells];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "tv_setDisplayed:", 0);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_dispatchEvent:(id)a3 forItemAtIndex:(unint64_t)a4 cell:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  long long v9 = [(IKCollectionElement *)self->_collectionElement sections];
  long long v10 = [v9 firstObject];

  long long v11 = [v10 elementForItemAtIndex:a4];
  if (([v11 isDisabled] & 1) == 0) {
    objc_msgSend(v11, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", v12, 1, 1, 0, v8, 0);
  }
}

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
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
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

- (void)updateWithViewElement:(id)a3 layout:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v7 = (IKCollectionElement *)a3;
  id v8 = a4;
  long long v9 = [(id)objc_opt_class() headerElementFromCollectionElement:v7];
  headerElement = self->_headerElement;
  self->_headerElement = v9;

  p_collectionElement = (id *)&self->_collectionElement;
  v54 = self;
  id v48 = v8;
  if (self->_collectionElement != v7
    || [(IKCollectionElement *)v7 updateType] != 2
    || ([(_TVCarouselViewController *)self view],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        [v11 window],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    long long v26 = [(IKCollectionElement *)v7 sections];
    v27 = [v26 firstObject];

    id obj = v27;
    v28 = [v27 itemsChangeSet];
    uint64_t v29 = v28;
    if (v28)
    {
      v30 = [v28 addedIndexes];
      if ([v30 count])
      {
        int v31 = 1;
      }
      else
      {
        v32 = [v29 removedIndexes];
        if ([v32 count])
        {
          int v31 = 1;
        }
        else
        {
          v33 = [v29 movedIndexesByNewIndex];
          if ([v33 count]) {
            int v31 = 1;
          }
          else {
            int v31 = ![(TVCarouselLayout *)self->_carouselLayout isEqual:v8];
          }
        }
      }
    }
    else
    {
      int v31 = 1;
    }
    objc_storeStrong(p_collectionElement, a3);
    p_carouselLayout = &self->_carouselLayout;
    objc_storeStrong((id *)&self->_carouselLayout, a4);
    [(_TVCarouselViewController *)self _updateHeaderView];
    [(_TVCarouselViewController *)self _updateAutoScrollInterval];
    if (v31)
    {
      [(_TVCarouselViewController *)self _updateLayoutAndReload];
    }
    else
    {
      v47 = v29;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      locationa = [(_TVCarouselView *)self->_carouselView visibleCells];
      uint64_t v34 = [locationa countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v56 != v36) {
              objc_enumerationMutation(locationa);
            }
            uint64_t v38 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            uint64_t v39 = [(_TVCarouselView *)self->_carouselView indexForCell:v38];
            if (v39 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v40 = v39;
              v41 = [*p_collectionElement sections];
              v42 = [v41 firstObject];

              v43 = [v42 elementForItemAtIndex:v40];
              v44 = objc_opt_new();
              objc_msgSend(v44, "setCenterGrowth:", -[TVCarouselLayout layoutType](*p_carouselLayout, "layoutType") == 0);
              v45 = +[TVInterfaceFactory sharedInterfaceFactory];
              id v46 = (id)[v45 _viewFromElement:v43 layout:v44 existingView:v38];

              self = v54;
            }
          }
          uint64_t v35 = [locationa countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v35);
      }

      uint64_t v29 = v47;
    }

    goto LABEL_42;
  }
  location = (id *)&self->_carouselLayout;
  if (![(TVCarouselLayout *)self->_carouselLayout isEqual:v8])
  {
    objc_storeStrong(location, a4);
    [(_TVCarouselViewController *)self _updateLayout];
  }
  [(_TVCarouselViewController *)self _updateHeaderView];
  [(_TVCarouselViewController *)self _updateAutoScrollInterval];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [(_TVCarouselView *)self->_carouselView visibleCells];
  uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        uint64_t v18 = [(_TVCarouselView *)self->_carouselView indexForCell:v17];
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v19 = v18;
          long long v20 = [*p_collectionElement sections];
          long long v21 = [v20 firstObject];

          long long v22 = [v21 elementForItemAtIndex:v19];
          long long v23 = objc_opt_new();
          objc_msgSend(v23, "setCenterGrowth:", objc_msgSend(*location, "layoutType") == 0);
          uint64_t v24 = +[TVInterfaceFactory sharedInterfaceFactory];
          id v25 = (id)[v24 _viewFromElement:v22 layout:v23 existingView:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v14);
LABEL_42:
    id v8 = v48;
  }
}

- (void)centerItemAtPageIndex:(int64_t)a3
{
  carouselView = self->_carouselView;
  if (carouselView) {
    [(_TVCarouselView *)carouselView centerItemAtPageIndex:a3];
  }
}

- (void)_updateAutoScrollInterval
{
  collectionElement = self->_collectionElement;
  if (collectionElement && self->_carouselView)
  {
    id v4 = [(IKCollectionElement *)collectionElement sections];
    id v5 = [v4 firstObject];

    if ((unint64_t)[v5 numberOfItems] >= 3) {
      [(_TVCarouselView *)self->_carouselView setAutoscrollInterval:10.0];
    }
  }
}

- (void)_updateLayout
{
  carouselView = self->_carouselView;
  if (carouselView)
  {
    [(_TVCarouselView *)carouselView transferLayoutStylesFromElement:self->_collectionElement];
    [(TVCarouselLayout *)self->_carouselLayout cellSize];
    if (v5 > 2.22044605e-16 && v4 > 2.22044605e-16) {
      -[_TVCarouselView setItemSize:](self->_carouselView, "setItemSize:");
    }
    uint64_t v7 = self->_carouselView;
    [(TVCarouselLayout *)self->_carouselLayout interitemSpacing];
    -[_TVCarouselView setInteritemSpacing:](v7, "setInteritemSpacing:");
    [(_TVCarouselView *)self->_carouselView setSemanticContentAttribute:[(IKCollectionElement *)self->_collectionElement tv_semanticContentAttribute]];
    [(_TVCarouselView *)self->_carouselView setScrollMode:[(TVCarouselLayout *)self->_carouselLayout scrollMode]];
    [(_TVCarouselView *)self->_carouselView setShowsPageControl:[(TVCarouselLayout *)self->_carouselLayout showsPageControl]];
    id v8 = [(TVCarouselLayout *)self->_carouselLayout pageControlMarginNumber];
    if (v8)
    {
      id v10 = v8;
      [v8 floatValue];
      [(_TVCarouselView *)self->_carouselView setPageControlMargin:v9];
      id v8 = v10;
    }
  }
}

- (void)_updateLayoutAndReload
{
  p_flags = &self->_flags;
  self->_flags.indexesDirty = 1;
  [(_TVCarouselView *)self->_carouselView reloadData];
  p_flags->indexesDirty = 0;
  [(_TVCarouselViewController *)self _updateLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerElement, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_collectionElement, 0);
  objc_storeStrong((id *)&self->_carouselLayout, 0);
}

@end