@interface WGCarouselListViewController
- (BOOL)_hasEnoughContentToScroll;
- (BOOL)_isViewControllerVisible;
- (BOOL)headerVisible;
- (BOOL)isFooterVisible;
- (BOOL)isRevealed;
- (BOOL)isVisuallyRevealed;
- (BOOL)shouldAnimateFirstTwoViewsAsOne;
- (BOOL)shouldShowTeachingView;
- (BOOL)visuallyRevealedPriorToEditingIcons;
- (CGRect)_cellFrameInScrollBoundsForCell:(id)a3;
- (NSMutableDictionary)cachedThresholds;
- (NSMutableDictionary)catchupProperties;
- (NSMutableDictionary)catchupTimers;
- (WGCarouselListViewController)initWithWidgetDiscoveryController:(id)a3 listSettings:(WGWidgetListSettings)a4;
- (WGWidgetListSettings)listSettings;
- (WGWidgetPinningTeachingView)teachingView;
- (double)dismissProgress;
- (double)easedOutValueForValue:(double)a3;
- (double)revealProgress;
- (id)_animatablePropertiesForStackViewUpdate;
- (id)_identifierForCell:(id)a3;
- (id)_newCatchupPropertyForCell:(id)a3;
- (id)_thresholdsForCell:(id)a3;
- (id)extraViews;
- (unint64_t)_indexForNextCellAfterContentOffset:(double)a3;
- (unint64_t)_indexOfFirstNonFavoritedWidgetInStackView;
- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5;
- (void)_animatablePropertiesForStackViewUpdate;
- (void)_createPropertiesForStackViewUpdate;
- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3;
- (void)_stackViewArrangedSubviewsTransformPresentationValueChanged;
- (void)_styleCroppedAndScaledCellForBottomEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 thresholds:(id)a6;
- (void)_styleCroppedAndScaledCellForTopEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 thresholds:(id)a5;
- (void)_styleCroppedCellForBottomEdge:(id)a3 intersectionRect:(CGRect)a4 thresholds:(id)a5;
- (void)_styleCroppedCellForTopEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 thresholds:(id)a6;
- (void)_styleDisapearingCellForBottomEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 previousCellFrameInContainerView:(CGRect)a5 thresholds:(id)a6;
- (void)_styleFooterView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 containerHeight:(double)a6;
- (void)_styleFullyInvisibleBottomCell:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 thresholds:(id)a5;
- (void)_styleFullyInvisibleTopCell:(id)a3;
- (void)_styleFullyVisibleCell:(id)a3;
- (void)_styleHeaderView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5;
- (void)_styleTeachingView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5;
- (void)_updateCarouselEffect;
- (void)_updateRevealState;
- (void)_updateScrollViewContentSize;
- (void)_updateTeachingViewVisibilityAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCachedThresholds:(id)a3;
- (void)setCatchupProperties:(id)a3;
- (void)setCatchupTimers:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDismissProgress:(double)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setFooterVisible:(BOOL)a3;
- (void)setHeaderVisible:(BOOL)a3;
- (void)setListSettings:(WGWidgetListSettings)a3;
- (void)setRevealProgress:(double)a3;
- (void)setRevealed:(BOOL)a3;
- (void)setTeachingView:(id)a3;
- (void)setVisuallyRevealed:(BOOL)a3;
- (void)setVisuallyRevealed:(BOOL)a3 withSlowAnimation:(BOOL)a4;
- (void)setVisuallyRevealedPriorToEditingIcons:(BOOL)a3;
- (void)updateCarouselAndRevealState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)widgetPinningTeachingViewDidSelectNo:(id)a3;
- (void)widgetPinningTeachingViewDidSelectYes:(id)a3;
@end

@implementation WGCarouselListViewController

- (WGCarouselListViewController)initWithWidgetDiscoveryController:(id)a3 listSettings:(WGWidgetListSettings)a4
{
  uint64_t v4 = *(void *)&a4.useFavorites;
  unint64_t carouselEdges = a4.carouselEdges;
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WGCarouselListViewController;
  v8 = [(WGWidgetListViewController *)&v20 initWithWidgetDiscoveryController:v7];
  v9 = v8;
  if (v8)
  {
    v8->_listSettings.unint64_t carouselEdges = carouselEdges;
    *(void *)&v8->_listSettings.useFavorites = v4;
    objc_initWeak(&location, v8);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v12 = *MEMORY[0x263F1D158];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__WGCarouselListViewController_initWithWidgetDiscoveryController_listSettings___block_invoke;
    v17[3] = &unk_264676CA0;
    objc_copyWeak(&v18, &location);
    uint64_t v13 = [v10 addObserverForName:v12 object:0 queue:v11 usingBlock:v17];
    id sizeChangeObserver = v9->_sizeChangeObserver;
    v9->_id sizeChangeObserver = (id)v13;

    v15 = v9;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __79__WGCarouselListViewController_initWithWidgetDiscoveryController_listSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedThresholds:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_sizeChangeObserver];

  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  [(WGWidgetListViewController *)&v4 dealloc];
}

- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v6 _repopulateStackViewWithWidgetIdentifiers:a3];
  objc_super v4 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(WGCarouselListViewController *)self _updateTeachingViewVisibilityAnimated:0 withCompletion:0];
  }
  [(WGWidgetListViewController *)self _didUpdateStackViewArrangedSubviews];
}

- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)WGCarouselListViewController;
  unint64_t v6 = [(WGMajorListViewController *)&v11 _insertionIndexofListItem:a3 intoWidgetViews:a4 withOrderedIdentifiers:a5];
  id v7 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
  v8 = v7;
  if (self->_teachingView)
  {
    if (objc_msgSend(v7, "containsObject:")) {
      BOOL v9 = v6 == 1;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      if ((unint64_t)[v8 count] <= 1) {
        unint64_t v6 = 1;
      }
      else {
        unint64_t v6 = 2;
      }
    }
  }

  return v6;
}

- (NSMutableDictionary)catchupTimers
{
  catchupTimers = self->_catchupTimers;
  if (!catchupTimers)
  {
    objc_super v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v5 = self->_catchupTimers;
    self->_catchupTimers = v4;

    catchupTimers = self->_catchupTimers;
  }
  return catchupTimers;
}

- (id)extraViews
{
  v12.receiver = self;
  v12.super_class = (Class)WGCarouselListViewController;
  v3 = [(WGMajorListViewController *)&v12 extraViews];
  teachingView = self->_teachingView;
  if (teachingView
    && ([(WGWidgetPinningTeachingView *)teachingView contentView],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 alpha],
        char IsZero = BSFloatIsZero(),
        v5,
        (IsZero & 1) == 0))
  {
    id v7 = (void *)[v3 mutableCopy];
    BOOL v10 = 0;
    if ([v3 count])
    {
      v8 = [v7 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        BOOL v10 = 1;
      }
    }
    [v7 insertObject:self->_teachingView atIndex:v10];
  }
  else
  {
    id v7 = v3;
  }
  return v7;
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  v9.receiver = self;
  v9.super_class = (Class)WGCarouselListViewController;
  if ([(WGMajorListViewController *)&v9 shouldAnimateFirstTwoViewsAsOne])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    teachingView = self->_teachingView;
    if (teachingView)
    {
      uint64_t v5 = [(WGCarouselListViewController *)self extraViews];
      unint64_t v6 = [v5 firstObject];
      if (teachingView == v6)
      {
        id v7 = [(WGWidgetPinningTeachingView *)self->_teachingView contentView];
        [v7 alpha];
        int v3 = BSFloatIsOne() ^ 1;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WGCarouselListViewController;
  [(WGWidgetListViewController *)&v5 viewDidLoad];
  [(WGCarouselListViewController *)self _updateTeachingViewVisibilityAnimated:0 withCompletion:0];
  if (self->_listSettings.useFavorites) {
    BOOL v3 = [(WGWidgetDiscoveryController *)self->super.super._discoveryController areWidgetsPinned]
  }
      || [(WGWidgetDiscoveryController *)self->super.super._discoveryController alwaysShowsFavoriteWidgets];
  else {
    BOOL v3 = 0;
  }
  [(WGCarouselListViewController *)self setRevealed:v3];
  [(WGCarouselListViewController *)self setRevealed:v3 ^ 1];
  [(WGCarouselListViewController *)self setVisuallyRevealed:v3];
  [(WGCarouselListViewController *)self setVisuallyRevealed:v3 ^ 1];
  if ((self->_listSettings.carouselEdges & 4) != 0)
  {
    objc_super v4 = [(WGMajorListViewController *)self footerView];
    [v4 setShouldSizeContent:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v4 viewWillAppear:a3];
  [(WGCarouselListViewController *)self setCachedThresholds:0];
  [(WGCarouselListViewController *)self updateCarouselAndRevealState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v4 viewDidAppear:a3];
  [(WGWidgetPinningTeachingView *)self->_teachingView startAnimating];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v4 viewDidDisappear:a3];
  [(WGWidgetPinningTeachingView *)self->_teachingView stopAnimating];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WGCarouselListViewController;
  [(WGCarouselListViewController *)&v3 viewDidLayoutSubviews];
  [(WGCarouselListViewController *)self setCachedThresholds:0];
  if ([(WGCarouselListViewController *)self _appearState]) {
    [(WGCarouselListViewController *)self updateCarouselAndRevealState];
  }
}

- (void)setListSettings:(WGWidgetListSettings)a3
{
  uint64_t v3 = *(void *)&a3.useFavorites;
  unint64_t carouselEdges = a3.carouselEdges;
  p_listSettings = &self->_listSettings;
  if (!WGWidgetListSettingsEqualsToWidgetListSettings(self->_listSettings.carouselEdges, *(void *)&self->_listSettings.useFavorites, a3.carouselEdges, *(uint64_t *)&a3.useFavorites))
  {
    p_listSettings->unint64_t carouselEdges = carouselEdges;
    *(void *)&p_listSettings->useFavorites = v3;
    [(WGCarouselListViewController *)self updateCarouselAndRevealState];
  }
}

- (void)setRevealed:(BOOL)a3
{
  if (self->_revealed != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
      -[WGCarouselListViewController setRevealed:](v3, v5, v6, v7, v8, v9, v10, v11);
    }
    self->_revealed = v3;
    objc_super v12 = [(WGWidgetListViewController *)self widgetListView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v17 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);

    if (v17 != v14 || v18 != v16) {
      [(WGCarouselListViewController *)self _updateScrollViewContentSize];
    }
  }
}

- (void)setVisuallyRevealed:(BOOL)a3
{
}

- (void)setVisuallyRevealed:(BOOL)a3 withSlowAnimation:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  p_visuallyRevealed = (unsigned __int8 *)&self->_visuallyRevealed;
  if (self->_visuallyRevealed != a3)
  {
    unsigned __int8 *p_visuallyRevealed = a3;
    objc_super v5 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
      -[WGCarouselListViewController setVisuallyRevealed:withSlowAnimation:]((uint64_t)p_visuallyRevealed, v5, v6, v7, v8, v9, v10, v11);
    }
    unint64_t v37 = [(WGCarouselListViewController *)self _indexOfFirstNonFavoritedWidgetInStackView];
    [(UIStackView *)self->super.super._stackView arrangedSubviews];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v46;
      v36 = v42;
      uint64_t v35 = *MEMORY[0x263EFF588];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          char v18 = objc_opt_isKindOfClass();
          if (isKindOfClass & 1) != 0 || (v18)
          {
            v19 = -[WGCarouselListViewController _identifierForCell:](self, "_identifierForCell:", v16, v35, v36);
            objc_super v20 = [(WGCarouselListViewController *)self catchupTimers];
            v21 = [v20 objectForKey:v19];

            [v21 invalidate];
            v22 = [(WGCarouselListViewController *)self catchupTimers];
            [v22 removeObjectForKey:v19];

            v23 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
            uint64_t v24 = [v23 indexOfObject:v16];

            long double v25 = pow(0.9, (double)(v24 - v37));
            int v26 = *p_visuallyRevealed;
            double v27 = v25 * 0.05 * (double)(v24 - v37);
            v28 = (void *)MEMORY[0x263EFFA20];
            v41[0] = MEMORY[0x263EF8330];
            if (v26) {
              double v29 = v27;
            }
            else {
              double v29 = 0.0;
            }
            v41[1] = 3221225472;
            v42[0] = __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke;
            v42[1] = &unk_264676CF0;
            BOOL v44 = a4;
            v42[2] = self;
            id v43 = v19;
            id v30 = v19;
            v31 = [v28 timerWithTimeInterval:0 repeats:v41 block:v29];
            v32 = [(WGCarouselListViewController *)self catchupTimers];
            [v32 setObject:v31 forKey:v30];

            v33 = [MEMORY[0x263EFF9F0] mainRunLoop];
            [v33 addTimer:v31 forMode:v35];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v13);
    }
    [(WGCarouselListViewController *)self _updateScrollViewContentSize];
  }
  v34 = [(WGWidgetListViewController *)self widgetListView];
  if (([v34 isTracking] & 1) == 0) {
    [(WGCarouselListViewController *)self setRevealed:*p_visuallyRevealed];
  }
}

void __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 1145)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = (void *)MEMORY[0x263F1CB60];
  double v7 = dbl_222E98910[*(unsigned char *)(a1 + 48) == 0];
  if (*(unsigned char *)(a1 + 48)) {
    double v8 = 12.52;
  }
  else {
    double v8 = 24.0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke_2;
  v11[3] = &unk_264676CC8;
  v11[4] = v4;
  id v12 = *(id *)(a1 + 40);
  double v13 = v5;
  id v9 = a2;
  [v6 _animateUsingSpringWithTension:0 friction:v11 interactive:0 animations:v7 completion:v8];
  [v9 invalidate];

  uint64_t v10 = [*(id *)(a1 + 32) catchupTimers];
  [v10 removeObjectForKey:*(void *)(a1 + 40)];
}

void __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1168) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    [v2 setValue:*(double *)(a1 + 48)];
    v2 = v3;
  }
}

- (void)_updateScrollViewContentSize
{
  if ([(WGWidgetListViewController *)self shouldIncludeScrollView])
  {
    id v8 = [(WGWidgetListViewController *)self widgetListView];
    [v8 _setAutomaticContentOffsetAdjustmentEnabled:0];
    BOOL visuallyRevealed = self->_visuallyRevealed;
    uint64_t v4 = [(WGWidgetListViewController *)self stackViewBottomConstraint];
    double v5 = v4;
    if (visuallyRevealed)
    {
      [v4 setActive:1];

      [(UIStackView *)self->super.super._stackView layoutIfNeeded];
    }
    else
    {
      [v4 setActive:0];

      [v8 frame];
      objc_msgSend(v8, "setContentSize:", v6, v7);
    }
  }
  else
  {
    id v8 = [(WGWidgetListViewController *)self stackViewBottomConstraint];
    [v8 setActive:1];
  }
}

- (void)setContainerView:(id)a3
{
  id v4 = a3;
  id v5 = [(WGMajorListViewController *)self containerView];
  v6.receiver = self;
  v6.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v6 setContainerView:v4];

  if (v5 != v4) {
    [(WGCarouselListViewController *)self setCachedThresholds:0];
  }
}

- (BOOL)headerVisible
{
  v2 = [(WGMajorListViewController *)self headerView];
  id v3 = [v2 contentView];
  [v3 alpha];
  char v4 = BSFloatIsZero() ^ 1;

  return v4;
}

- (void)setHeaderVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WGMajorListViewController *)self headerView];
  objc_super v6 = [v5 contentView];

  LODWORD(v5) = [(WGCarouselListViewController *)self headerVisible];
  v11.receiver = self;
  v11.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v11 setHeaderVisible:v3];
  if (v5 != v3)
  {
    double v7 = (void *)MEMORY[0x263F1CB60];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__WGCarouselListViewController_setHeaderVisible___block_invoke;
    v8[3] = &unk_264676D18;
    id v9 = v6;
    BOOL v10 = v3;
    [v7 animateWithDuration:4 delay:v8 options:0 animations:0.3 completion:0.0];
  }
}

uint64_t __49__WGCarouselListViewController_setHeaderVisible___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __49__WGCarouselListViewController_setFooterVisible___block_invoke;
    v3[3] = &unk_264676D18;
    v3[4] = self;
    BOOL v4 = a3;
    [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v3 options:0 animations:0.3 completion:0.0];
  }
}

void __49__WGCarouselListViewController_setFooterVisible___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) footerView];
  v2 = [v5 contentView];
  BOOL v3 = v2;
  double v4 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  [v2 setAlpha:v4];
}

- (void)setEditingIcons:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WGWidgetListViewController *)self isEditingIcons] != a3)
  {
    if (v3)
    {
      [(WGCarouselListViewController *)self setVisuallyRevealedPriorToEditingIcons:[(WGCarouselListViewController *)self isVisuallyRevealed]];
    }
    else if (![(WGCarouselListViewController *)self visuallyRevealedPriorToEditingIcons])
    {
      objc_super v6 = [(WGWidgetListViewController *)self widgetListView];
      objc_msgSend(v6, "setContentOffset:animated:", 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

      uint64_t v5 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = 1;
LABEL_7:
    [(WGCarouselListViewController *)self setVisuallyRevealed:v5];
    v7.receiver = self;
    v7.super_class = (Class)WGCarouselListViewController;
    [(WGMajorListViewController *)&v7 setEditingIcons:v3];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  [(WGMajorListViewController *)&v4 scrollViewDidScroll:a3];
  [(WGCarouselListViewController *)self updateCarouselAndRevealState];
}

- (void)updateCarouselAndRevealState
{
  [(WGCarouselListViewController *)self _updateCarouselEffect];
  if (self->_listSettings.useFavorites)
  {
    [(WGCarouselListViewController *)self _updateRevealState];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WGCarouselListViewController;
  -[WGWidgetListViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v40, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
  BOOL v10 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = v10;
    BOOL v12 = [(WGCarouselListViewController *)self isRevealed];
    BOOL v13 = [(WGCarouselListViewController *)self isVisuallyRevealed];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    _os_log_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEFAULT, "Carousel scrollview will end dragging isRevealed: %{BOOL}d isVisuallyRevealed: %{BOOL}d", buf, 0xEu);
  }
  if ([(WGCarouselListViewController *)self isRevealed]
    || ![(WGCarouselListViewController *)self isVisuallyRevealed])
  {
    if ([(WGCarouselListViewController *)self isRevealed]
      && ![(WGCarouselListViewController *)self isVisuallyRevealed])
    {
      [(WGCarouselListViewController *)self setRevealed:0];
    }
  }
  else
  {
    [(WGCarouselListViewController *)self setRevealed:1];
    if ([(WGCarouselListViewController *)self _hasEnoughContentToScroll])
    {
      [v9 contentOffset];
      unint64_t v15 = [(WGCarouselListViewController *)self _indexForNextCellAfterContentOffset:v14];
      unint64_t v16 = [(WGCarouselListViewController *)self _indexForNextCellAfterContentOffset:a5->y];
      double v17 = [v9 panGestureRecognizer];
      [v17 velocityInView:v9];
      double v19 = v18;

      double v20 = fmin(fmax(v19 / -15000.0, 0.0), 1.0);
      unint64_t v21 = vcvtad_u64_f64(pow(v20, 3.0) * (double)(v16 - v15) + (double)v15);
      v22 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
      if ([v22 count] <= v21)
      {
        v23 = 0;
      }
      else
      {
        v23 = [v22 objectAtIndex:v21];
      }
      uint64_t v24 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        *(double *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v15;
        *(_WORD *)v42 = 2048;
        *(void *)&v42[2] = v16;
        *(_WORD *)&v42[10] = 2048;
        *(void *)&v42[12] = v21;
        _os_log_debug_impl(&dword_222E49000, v24, OS_LOG_TYPE_DEBUG, "gestureVelocity: %.2f normalizedVelocity: %.2f indexForCurrentContentOffset %lu indexForTargetContentOffset %lu, targetIndex %lu", buf, 0x34u);
        if (v23)
        {
LABEL_14:
          *(_OWORD *)v42 = 0u;
          memset(buf, 0, sizeof(buf));
          [v23 transform];
          long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
          long long v37 = *MEMORY[0x263F000D0];
          long long v38 = v25;
          long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
          [v23 setTransform:&v37];
          [v23 frame];
          double v27 = v26;
          double v29 = v28;
          [v9 contentSize];
          double v31 = v30;
          [v9 bounds];
          if (v19 < 0.0 && v29 < v31 - v32)
          {
            [v9 contentOffset];
            a5->double x = v33;
            a5->double y = v34;
            [v9 contentOffset];
            v36 = smoothDecelerationAnimation(fmin(-v19 / (v29 - v35), 15.0));
            objc_msgSend(v9, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 0, v36, v27, v29);
          }
          long long v37 = *(_OWORD *)buf;
          long long v38 = *(_OWORD *)&buf[16];
          long long v39 = *(_OWORD *)v42;
          [v23 setTransform:&v37];
        }
      }
      else if (v23)
      {
        goto LABEL_14;
      }
    }
  }
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
}

- (id)_newCatchupPropertyForCell:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F1CB70]);
  BOOL v5 = [(WGCarouselListViewController *)self isRevealed];
  double v6 = 1.0;
  if (v5) {
    double v6 = 0.0;
  }
  [v4 setValue:v6];
  return v4;
}

- (void)_createPropertiesForStackViewUpdate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)WGCarouselListViewController;
  [(WGWidgetListViewController *)&v15 _createPropertiesForStackViewUpdate];
  if (self->_listSettings.useFavorites)
  {
    if ([(NSMutableDictionary *)self->_catchupProperties count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      BOOL v3 = [(NSMutableDictionary *)self->_catchupProperties allValues];
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v12;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v12 != v6) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * v7++) invalidate];
          }
          while (v5 != v7);
          uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v5);
      }

      catchupProperties = self->_catchupProperties;
      self->_catchupProperties = 0;
    }
    if (!self->_catchupProperties)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      BOOL v10 = self->_catchupProperties;
      self->_catchupProperties = v9;
    }
  }
}

- (id)_animatablePropertiesForStackViewUpdate
{
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  v14.receiver = self;
  v14.super_class = (Class)WGCarouselListViewController;
  uint64_t v4 = [(WGWidgetListViewController *)&v14 _animatablePropertiesForStackViewUpdate];
  uint64_t v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__WGCarouselListViewController__animatablePropertiesForStackViewUpdate__block_invoke;
  v12[3] = &unk_264676D40;
  v12[4] = self;
  id v7 = v5;
  id v13 = v7;
  [v6 enumerateObjectsUsingBlock:v12];
  id v8 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
    [(WGCarouselListViewController *)(uint64_t)self _animatablePropertiesForStackViewUpdate];
  }
  id v9 = v13;
  id v10 = v7;

  return v10;
}

void __71__WGCarouselListViewController__animatablePropertiesForStackViewUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v3 = [*(id *)(a1 + 32) _identifierForCell:v7];
    uint64_t v4 = *(unsigned char **)(a1 + 32);
    if (v4[1208])
    {
      uint64_t v5 = (void *)[v4 _newCatchupPropertyForCell:v7];
      uint64_t v6 = [*(id *)(a1 + 32) catchupProperties];
      [v6 setObject:v5 forKey:v3];

      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

- (void)_stackViewArrangedSubviewsTransformPresentationValueChanged
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v3 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    p_responderFlags = &self->super.super.super.super._responderFlags;
    id v8 = &off_264676000;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v5;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        char v12 = objc_opt_isKindOfClass();
        if (isKindOfClass & 1) != 0 || (v12)
        {
          if (p_responderFlags[300])
          {
            if ((isKindOfClass & 1) == 0) {
              goto LABEL_12;
            }
            id v13 = [v10 platterView];
            objc_super v14 = [v13 listItem];
            [v14 widgetIdentifier];
            uint64_t v15 = v6;
            unint64_t v16 = v8;
            uint64_t v17 = p_responderFlags;
            v19 = double v18 = v3;

            LODWORD(v13) = [(WGWidgetDiscoveryController *)self->super.super._discoveryController isElementWithIdentifierFavorited:v19];
            BOOL v3 = v18;
            p_responderFlags = v17;
            id v8 = v16;
            uint64_t v6 = v15;
            uint64_t v5 = v24;
            if (v13)
            {
              long long v20 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
              *(_OWORD *)&v26.a = *MEMORY[0x263F000D0];
              *(_OWORD *)&v26.c = v20;
              *(_OWORD *)&v26.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
              [v10 setTransform:&v26];
            }
            else
            {
LABEL_12:
              unint64_t v21 = [(WGCarouselListViewController *)self _identifierForCell:v10];
              v22 = [(NSMutableDictionary *)self->_catchupProperties objectForKey:v21];
              memset(&v26, 0, sizeof(v26));
              [v22 presentationValue];
              CGAffineTransformMakeTranslation(&v26, 0.0, v23 * 160.0);
              CGAffineTransform v25 = v26;
              [v10 setTransform:&v25];
            }
          }
          [(WGWidgetListViewController *)self _resizeCell:v10];
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }
  [(UIStackView *)self->super.super._stackView layoutIfNeeded];
  [(WGCarouselListViewController *)self _updateCarouselEffect];
}

- (void)_updateCarouselEffect
{
  id v7 = a2;
  [a3 alpha];
  *a1 = 134217984;
  *a4 = v8;
  OUTLINED_FUNCTION_1_0(&dword_222E49000, v9, v10, "setting alpha to %.2f because not revealed");
}

uint64_t __53__WGCarouselListViewController__updateCarouselEffect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateRevealState
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WGWidgetListViewController *)self widgetListView];
  [v3 contentOffset];
  [(WGCarouselListViewController *)self setRevealProgress:fmin(fmax(v4 / 60.0, 0.0), 1.0)];
  [v3 contentOffset];
  [(WGCarouselListViewController *)self setDismissProgress:-fmin(fmax(v5 / 60.0, -1.0), 0.0)];
  BOOL v6 = [(WGCarouselListViewController *)self isRevealed];
  BOOL visuallyRevealed = self->_visuallyRevealed;
  if (v6) {
    int IsOne = 0;
  }
  else {
    int IsOne = BSFloatIsOne();
  }
  int v9 = BSFloatIsOne();
  int v10 = [v3 isDecelerating];
  long long v11 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
  {
    v14[0] = 67110144;
    v14[1] = v6;
    __int16 v15 = 1024;
    BOOL v16 = visuallyRevealed;
    __int16 v17 = 1024;
    int v18 = IsOne;
    __int16 v19 = 1024;
    int v20 = v9;
    __int16 v21 = 1024;
    int v22 = v10;
    _os_log_debug_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEBUG, "revealed: %{BOOL}u, wasVisuallyRevealed: %{BOOL}u, nowRevealed, %{BOOL}u, nowDismissed: %{BOOL}u, isDecelerating: %{BOOL}u", (uint8_t *)v14, 0x20u);
  }
  BOOL v12 = 1;
  if (self->_listSettings.pinned && !v6 | v9)
  {
    if ((v6 & v9 ^ 1 | v10) != 1
      || (v6 & v10 & 1) == 0
      && ((v10 & 1) != 0 || (!visuallyRevealed ? (int v13 = 1) : (int v13 = v9), (IsOne & 1) == 0 && v13)))
    {
      BOOL v12 = [(WGWidgetListViewController *)self isEditingIcons];
    }
  }
  [(WGCarouselListViewController *)self setVisuallyRevealed:v12];
}

- (double)easedOutValueForValue:(double)a3
{
  double v4 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  *(float *)&double v5 = a3;
  [v4 _solveForInput:v5];
  double v7 = v6;

  return v7;
}

- (unint64_t)_indexOfFirstNonFavoritedWidgetInStackView
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__2;
  BOOL v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  BOOL v3 = [(WGWidgetListViewController *)self visibleWidgetIdentifiers];
  double v4 = (void *)[v3 copy];

  for (unint64_t i = 0; i < [v4 count]; ++i)
  {
    float v6 = [v4 objectAtIndex:i];
    if (![(WGWidgetDiscoveryController *)self->super.super._discoveryController isElementWithIdentifierFavorited:v6])
    {
      double v7 = (void *)v13[5];
      v13[5] = (uint64_t)v6;

      break;
    }
  }
  uint64_t v8 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__WGCarouselListViewController__indexOfFirstNonFavoritedWidgetInStackView__block_invoke;
  v11[3] = &unk_264676DB0;
  v11[4] = &v12;
  unint64_t v9 = [v8 indexOfObjectPassingTest:v11];

  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __74__WGCarouselListViewController__indexOfFirstNonFavoritedWidgetInStackView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      float v6 = v5;
    }
    else {
      float v6 = 0;
    }
  }
  else
  {
    float v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 platterView];

  unint64_t v9 = [v8 listItem];
  int v10 = [v9 widgetIdentifier];
  uint64_t v11 = [v10 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v11;
}

- (unint64_t)_indexForNextCellAfterContentOffset:(double)a3
{
  id v5 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
  float v6 = (void *)[v5 copy];

  unint64_t v7 = [v6 count];
  unint64_t v8 = [(WGCarouselListViewController *)self _indexOfFirstNonFavoritedWidgetInStackView];
  unint64_t v9 = 0;
  if (v7 <= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v7;
  }
  while (1)
  {
    unint64_t v11 = v8;
    if (v10 == v8) {
      break;
    }
    uint64_t v12 = [v6 objectAtIndex:v8];

    [v12 frame];
    unint64_t v8 = v11 + 1;
    unint64_t v9 = v12;
    if (v13 >= a3) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = v9;
LABEL_8:

  return v11;
}

- (id)_identifierForCell:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v8 = v7;
      }
      else {
        unint64_t v8 = 0;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    id v11 = v8;

    uint64_t v12 = [v11 platterView];

    double v13 = [v12 listItem];
    unint64_t v10 = [v13 widgetIdentifier];

    if (v10) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (unint64_t v9 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v9),
        (unint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    __int16 v15 = [v5 recursiveDescription];
    [v14 handleFailureInMethod:a2, self, @"WGCarouselListViewController.m", 802, @"_identifierForCell: no identifier for cell with view hierarchy: %@", v15 object file lineNumber description];

LABEL_13:
    unint64_t v10 = 0;
  }
LABEL_14:

  return v10;
}

- (BOOL)_hasEnoughContentToScroll
{
  id v3 = [(WGWidgetListViewController *)self widgetListView];
  [v3 contentSize];
  double v5 = v4;
  uint64_t v6 = [(WGMajorListViewController *)self containerView];
  [v6 bounds];
  BOOL v8 = v5 > v7;

  return v8;
}

- (BOOL)_isViewControllerVisible
{
  return [(WGCarouselListViewController *)self _appearState] - 1 < 3;
}

- (void)_updateTeachingViewVisibilityAnimated:(BOOL)a3 withCompletion:(id)a4
{
  double v5 = (void (**)(void))a4;
  if (self->_listSettings.useFavorites
    && [(WGCarouselListViewController *)self shouldShowTeachingView])
  {
    if (!self->_teachingView)
    {
      uint64_t v6 = objc_alloc_init(WGWidgetPinningTeachingView);
      teachingView = self->_teachingView;
      self->_teachingView = v6;

      [(WGWidgetPinningTeachingView *)self->_teachingView setDelegate:self];
      BOOL v8 = [(UIStackView *)self->super.super._stackView arrangedSubviews];
      unint64_t v9 = [(WGMajorListViewController *)self headerView];
      uint64_t v10 = [v8 indexOfObject:v9];

      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = v10 + 1;
      }
      [(UIStackView *)self->super.super._stackView insertArrangedSubview:self->_teachingView atIndex:v11];
      if (v5) {
        v5[2](v5);
      }
    }
  }
  else if (self->_teachingView)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = (void *)MEMORY[0x263F1CB60];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke;
    v16[3] = &unk_2646766F8;
    objc_copyWeak(&v17, &location);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke_2;
    v13[3] = &unk_264676DD8;
    objc_copyWeak(&v15, &location);
    uint64_t v14 = v5;
    [v12 animateWithDuration:0 delay:v16 usingSpringWithDamping:v13 initialSpringVelocity:0.5 options:0.15 animations:1.0 completion:0.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[148] setHidden:1];
}

void __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[148] removeFromSuperview];
  id v2 = WeakRetained[148];
  WeakRetained[148] = 0;

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (CGRect)_cellFrameInScrollBoundsForCell:(id)a3
{
  id v4 = a3;
  double v5 = [(WGWidgetListViewController *)self widgetListView];
  uint64_t v6 = [(UIStackView *)self->super.super._stackView superview];

  if (v6 == v5)
  {
    [v4 frame];
    double v19 = v18;
    [v5 contentOffset];
    double v17 = v19 - v20;
  }
  else
  {
    [v4 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [(WGMajorListViewController *)self containerView];
    objc_msgSend(v4, "convertRect:toView:", v15, v8, v10, v12, v14);
    double v17 = v16;
  }
  [v4 frame];
  double v22 = v21;
  double v24 = v23;

  double v25 = 0.0;
  double v26 = v17;
  double v27 = v22;
  double v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)_styleFullyInvisibleTopCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 platterView];
  [v4 setClippingEdge:1];

  double v5 = [v3 contentView];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v11[0] = *MEMORY[0x263F000D0];
  v11[1] = v6;
  v11[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v5 setTransform:v11];

  double v7 = [v3 contentView];
  double v8 = [v7 layer];
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);

  double v9 = [v3 contentView];
  [v3 bounds];
  objc_msgSend(v9, "setFrame:");

  [v3 setTopMarginForLayout:0.0];
  double v10 = [v3 contentView];

  [v10 setAlpha:0.0];
}

- (void)_styleCroppedAndScaledCellForTopEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 thresholds:(id)a5
{
  CGFloat rect = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = (double *)a5;
  id v11 = a3;
  double v12 = [v11 platterView];
  [v12 setClippingEdge:1];

  double v13 = [v11 contentView];
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v38[0] = *MEMORY[0x263F000D0];
  v38[1] = v14;
  v38[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v13 setTransform:v38];
  id v15 = [v13 layer];
  objc_msgSend(v15, "setAnchorPoint:", 0.5, 0.0);

  double v16 = [(WGWidgetListViewController *)self widgetListView];
  [v11 frame];
  double v18 = v17;
  double v19 = v10[1];
  [v16 contentInset];
  double v21 = v20 + 0.0;
  double v23 = v22 - y;
  objc_msgSend(v13, "setBounds:", 0.0, -y, v18, v19);
  objc_msgSend(v13, "setOrigin:", v21, v23);
  [v11 setTopMarginForLayout:v23];

  v39.origin.CGFloat x = x;
  v39.origin.double y = y;
  v39.size.CGFloat width = width;
  v39.size.height = rect;
  CGFloat MaxY = CGRectGetMaxY(v39);
  double v25 = v10[2];
  double v26 = v10[3];
  CGFloat v27 = MaxY - v25;

  long long v35 = 0u;
  uint64_t v36 = 0x3FF0000000000000;
  BYTE8(v35) = 1;
  uint64_t v37 = 1;
  uint64_t v31 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v33 = 0x3FF0000000000000;
  uint64_t v32 = 1;
  uint64_t v34 = 1;
  BSIntervalMap();
  CGAffineTransformMakeScale(&v30, v28, v28);
  [v13 setTransform:&v30];
  [(WGCarouselListViewController *)self easedOutValueForValue:1.0 - v27 / (v26 - v25)];
  objc_msgSend(v13, "setAlpha:");
}

- (void)_styleCroppedCellForTopEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 thresholds:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a4.origin.y;
  double v10 = *((double *)a6 + 1);
  id v11 = a3;
  double v12 = [v11 platterView];
  [v12 setClippingEdge:1];

  double v13 = [v11 contentView];
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v24[0] = *MEMORY[0x263F000D0];
  v24[1] = v14;
  v24[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v13 setTransform:v24];

  id v15 = [v11 contentView];
  double v16 = [v15 layer];
  objc_msgSend(v16, "setAnchorPoint:", 0.5, 0.5);

  double v17 = [(WGWidgetListViewController *)self widgetListView];
  [v17 contentInset];
  double v19 = v18 + 0.0;
  double v21 = v20 - y;
  if (height < v10) {
    double height = v10;
  }
  double v22 = [v11 contentView];
  objc_msgSend(v22, "setFrame:", v19, v21, width, height);

  [v11 setTopMarginForLayout:v21];
  double v23 = [v11 contentView];

  [v23 setAlpha:1.0];
}

- (void)_styleFullyVisibleCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 platterView];
  [v4 setClippingEdge:4];

  double v5 = [v3 contentView];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v11[0] = *MEMORY[0x263F000D0];
  v11[1] = v6;
  v11[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v5 setTransform:v11];

  double v7 = [v3 contentView];
  double v8 = [v7 layer];
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);

  double v9 = [v3 contentView];
  [v3 bounds];
  objc_msgSend(v9, "setFrame:");

  [v3 setTopMarginForLayout:0.0];
  double v10 = [v3 contentView];

  [v10 setAlpha:1.0];
}

- (void)_styleCroppedCellForBottomEdge:(id)a3 intersectionRect:(CGRect)a4 thresholds:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v7 = *((double *)a5 + 1);
  id v8 = a3;
  double v9 = [v8 platterView];
  [v9 setClippingEdge:4];

  double v10 = [v8 contentView];
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v16[0] = *MEMORY[0x263F000D0];
  v16[1] = v11;
  v16[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v10 setTransform:v16];

  double v12 = [v8 contentView];
  double v13 = [v12 layer];
  objc_msgSend(v13, "setAnchorPoint:", 0.5, 0.5);

  if (height < v7) {
    double height = v7;
  }
  long long v14 = [v8 contentView];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, width, height);

  [v8 setTopMarginForLayout:0.0];
  id v15 = [v8 contentView];

  [v15 setAlpha:1.0];
}

- (void)_styleCroppedAndScaledCellForBottomEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 thresholds:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v12 = *((double *)a6 + 1);
  double v13 = (double *)a6;
  id v14 = a3;
  id v15 = [v14 platterView];
  [v15 setClippingEdge:4];

  double v16 = [v14 contentView];
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v37[0] = *MEMORY[0x263F000D0];
  v37[1] = v17;
  v37[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v16 setTransform:v37];
  double v18 = [v16 layer];
  objc_msgSend(v18, "setAnchorPoint:", 0.5, 1.0);

  v38.origin.CGFloat x = x;
  v38.origin.double y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v38);
  double v20 = v13[5];
  double v21 = v13[6];
  CGFloat v22 = MinY - v20;

  double v23 = fmin(fmax(v22 / (v21 - v20), 0.0), 1.0);
  double v24 = [(WGMajorListViewController *)self containerView];
  [v24 bounds];
  double v26 = v25 - v12 + -10.0 - y + v23 * 10.0;
  [v14 frame];
  objc_msgSend(v16, "setBounds:", 0.0, v26);
  objc_msgSend(v16, "setOrigin:", 0.0, v26);
  [v14 setTopMarginForLayout:v26];

  long long v34 = 0u;
  uint64_t v35 = 0x3FF0000000000000;
  BYTE8(v34) = 1;
  uint64_t v36 = 1;
  uint64_t v30 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v32 = 0x3FF0000000000000;
  uint64_t v31 = 1;
  uint64_t v33 = 1;
  BSIntervalMap();
  CGAffineTransformMakeScale(&v29, v27, v27);
  [v16 setTransform:&v29];
  [(WGCarouselListViewController *)self easedOutValueForValue:1.0 - v23];
  [v16 setAlpha:v28 * 0.3 + 0.7];
}

- (void)_styleDisapearingCellForBottomEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 previousCellFrameInContainerView:(CGRect)a5 thresholds:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v10 = a4.origin.y;
  double v13 = *((double *)a6 + 1);
  id v14 = (double *)a6;
  id v15 = a3;
  double v16 = [v15 platterView];
  [v16 setClippingEdge:4];

  long long v17 = [v15 contentView];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v29[0] = *MEMORY[0x263F000D0];
  v29[1] = v18;
  v29[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v17 setTransform:v29];
  double v19 = [v17 layer];
  objc_msgSend(v19, "setAnchorPoint:", 0.5, 1.0);

  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v30);
  double v21 = v14[7];
  double v22 = v14[8];
  CGFloat v23 = MinY - v21;

  double v24 = fmin(fmax(v23 / (v22 - v21), 0.0), 1.0);
  double v25 = [(WGMajorListViewController *)self containerView];
  [v25 bounds];
  double v27 = v26 - v13 - v10 + v24 * 6.0;
  [v15 frame];
  objc_msgSend(v17, "setBounds:", 0.0, v27);
  objc_msgSend(v17, "setOrigin:", 0.0, v27);
  [v15 setTopMarginForLayout:v27];

  CGAffineTransformMakeScale(&v28, 0.9, 0.9);
  [v17 setTransform:&v28];
  objc_msgSend(v17, "setAlpha:", fmin(fmax((v24 * -2.0 + 1.0) * 0.7, 0.0), 1.0));
}

- (void)_styleFullyInvisibleBottomCell:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 thresholds:(id)a5
{
  double y = a4.origin.y;
  double v7 = *((double *)a5 + 1);
  id v8 = a3;
  double v9 = [(WGMajorListViewController *)self containerView];
  [v9 bounds];
  double v10 = [v8 platterView];
  [v10 setClippingEdge:4];

  long long v11 = [v8 contentView];
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v17[0] = *MEMORY[0x263F000D0];
  v17[1] = v12;
  v17[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v11 setTransform:v17];
  double v13 = [v11 layer];
  objc_msgSend(v13, "setAnchorPoint:", 0.5, 1.0);

  [v9 bounds];
  double v15 = v14 - v7 - y;
  [v8 frame];
  objc_msgSend(v11, "setBounds:", 0.0, v15);
  objc_msgSend(v11, "setOrigin:", 0.0, v15);
  [v8 setTopMarginForLayout:v15];

  CGAffineTransformMakeScale(&v16, 0.9, 0.9);
  [v11 setTransform:&v16];
  [v11 setAlpha:0.0];
}

- (void)_styleFooterView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 containerHeight:(double)a6
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  long long v11 = [v10 contentView];
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.double height = height;
  CGFloat v12 = (CGRectGetMaxY(v29) - (a6 + 10.0)) / (height + a6 + 10.0 - (a6 + 10.0)) + 0.0;
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v26 = *MEMORY[0x263F000D0];
  long long v27 = v13;
  long long v28 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v11 setTransform:&v26];
  double v14 = [v11 layer];
  objc_msgSend(v14, "setAnchorPoint:", 0.5, 0.5);

  [v10 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_msgSend(v11, "setFrame:", v16, v18, v20, v22);
  long long v23 = *(_OWORD *)(MEMORY[0x263F29BA0] + 16);
  long long v26 = *MEMORY[0x263F29BA0];
  long long v27 = v23;
  BSUIConstrainValueToIntervalWithRubberBand();
  CGAffineTransformMakeScale(&v25, v24, v24);
  [v11 setTransform:&v25];
  objc_msgSend(v11, "setAlpha:", fmin(fmax(1.0 - v12, 0.0), 1.0));
}

- (void)_styleHeaderView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5
{
  CGRectGetMinY(a4);
  long long v11 = 0u;
  uint64_t v12 = 0x3FF0000000000000;
  BYTE8(v11) = 1;
  uint64_t v13 = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  CGFloat v7 = fmin(fmax(v6, 0.75), 1.25);
  id v8 = [(WGMajorListViewController *)self headerView];
  double v9 = [v8 contentView];
  CGAffineTransformMakeScale(&v10, v7, v7);
  [v9 setTransform:&v10];
}

- (void)_styleTeachingView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5
{
  double height = a4.size.height;
  CGFloat rect = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  CGAffineTransform v10 = [v9 contentView];
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v33[0] = *MEMORY[0x263F000D0];
  v33[1] = v11;
  v33[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v10 setTransform:v33];
  uint64_t v12 = [v10 layer];
  objc_msgSend(v12, "setAnchorPoint:", 0.5, 0.5);

  uint64_t v13 = [(WGWidgetListViewController *)self widgetListView];
  [v9 frame];

  [v13 contentInset];
  double v15 = v14;
  double v17 = v16;
  int IsZero = BSFloatIsZero();
  double v19 = 0.0;
  if ((IsZero & 1) == 0)
  {
    v34.origin.CGFloat x = x;
    v34.origin.double y = y;
    v34.size.CGFloat width = rect;
    v34.size.double height = height;
    double v19 = (CGRectGetMaxY(v34) - v15) / height;
  }
  long long v30 = 0u;
  double v20 = fmin(fmax(v19, 0.0), 1.0);
  uint64_t v31 = 0x3FF0000000000000;
  BYTE8(v30) = 1;
  uint64_t v32 = 1;
  uint64_t v26 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v28 = 0x3FF0000000000000;
  uint64_t v27 = 1;
  uint64_t v29 = 1;
  BSIntervalMap();
  if (IsZero) {
    double v22 = 1.0;
  }
  else {
    double v22 = v21;
  }
  if (v22 < 1.0)
  {
    long long v23 = [v10 layer];
    objc_msgSend(v23, "setAnchorPoint:", 0.5, 0.0);
  }
  [v10 setBounds:0.0];
  objc_msgSend(v10, "setOrigin:", v17 + 0.0, fmax(v15 - y, 0.0));
  CGAffineTransformMakeScale(&v25, v22, v22);
  [v10 setTransform:&v25];
  [(WGCarouselListViewController *)self easedOutValueForValue:v20];
  objc_msgSend(v10, "setAlpha:");
}

- (id)_thresholdsForCell:(id)a3
{
  id v4 = a3;
  double v5 = [(WGCarouselListViewController *)self _identifierForCell:v4];
  cachedThresholds = self->_cachedThresholds;
  if (!cachedThresholds)
  {
    CGFloat v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = self->_cachedThresholds;
    self->_cachedThresholds = v7;

    cachedThresholds = self->_cachedThresholds;
  }
  id v9 = [(NSMutableDictionary *)cachedThresholds objectForKey:v5];
  if (!v9)
  {
    id v9 = objc_alloc_init(WGCarouselCellThresholds);
    CGAffineTransform v10 = [(WGMajorListViewController *)self containerView];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17 + -10.0;
    double v19 = [(WGWidgetListViewController *)self widgetListView];
    [v19 contentInset];
    double v21 = v20;

    double v22 = [v4 platterView];
    v28.origin.CGFloat x = v12;
    v28.origin.double y = v14;
    v28.size.CGFloat width = v16;
    v28.size.double height = v18;
    objc_msgSend(v22, "minimumSizeThatFits:", CGRectGetWidth(v28), 0.0);
    v9->_headerHeight = v23;

    v9->_threshold1 = v21 + v9->_headerHeight;
    [(UIStackView *)self->super.super._stackView spacing];
    v9->_threshold2 = v21 - v24;
    v9->_threshold3 = v18;
    double v25 = v18 - v9->_headerHeight;
    v9->_threshold4 = v25;
    v9->_threshold5 = v18;
    v9->_threshold6 = v25;
    v9->_threshold7 = v18;
    [(NSMutableDictionary *)self->_cachedThresholds setObject:v9 forKey:v5];
  }
  return v9;
}

- (void)widgetPinningTeachingViewDidSelectYes:(id)a3
{
  [(WGWidgetDiscoveryController *)self->super.super._discoveryController noteWidgetsPinningViewControllerDidDismiss:1];
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke;
  block[3] = &unk_264676588;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke_2;
  v3[3] = &unk_264676588;
  v3[4] = v1;
  return [v1 _updateTeachingViewVisibilityAnimated:1 withCompletion:v3];
}

uint64_t __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisuallyRevealed:0 withSlowAnimation:1];
}

- (void)widgetPinningTeachingViewDidSelectNo:(id)a3
{
  [(WGWidgetDiscoveryController *)self->super.super._discoveryController noteWidgetsPinningViewControllerDidDismiss:0];
  [(WGCarouselListViewController *)self _updateTeachingViewVisibilityAnimated:1 withCompletion:0];
}

- (BOOL)shouldShowTeachingView
{
  return [(WGWidgetDiscoveryController *)self->super.super._discoveryController shouldShowWidgetsPinningTeachingView];
}

- (WGWidgetListSettings)listSettings
{
  p_listSettings = &self->_listSettings;
  unint64_t carouselEdges = self->_listSettings.carouselEdges;
  uint64_t v4 = *(void *)&p_listSettings->useFavorites;
  result.useFavorites = v4;
  result.carouselIgnoresHeader = BYTE1(v4);
  result.pinned = BYTE2(v4);
  result.unint64_t carouselEdges = carouselEdges;
  return result;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (BOOL)isVisuallyRevealed
{
  return self->_visuallyRevealed;
}

- (double)revealProgress
{
  return self->_revealProgress;
}

- (void)setRevealProgress:(double)a3
{
  self->_revealProgress = a3;
}

- (double)dismissProgress
{
  return self->_dismissProgress;
}

- (void)setDismissProgress:(double)a3
{
  self->_dismissProgress = a3;
}

- (BOOL)visuallyRevealedPriorToEditingIcons
{
  return self->_visuallyRevealedPriorToEditingIcons;
}

- (void)setVisuallyRevealedPriorToEditingIcons:(BOOL)a3
{
  self->_visuallyRevealedPriorToEditingIcons = a3;
}

- (NSMutableDictionary)catchupProperties
{
  return self->_catchupProperties;
}

- (void)setCatchupProperties:(id)a3
{
}

- (void)setCatchupTimers:(id)a3
{
}

- (BOOL)isFooterVisible
{
  return self->_footerVisible;
}

- (WGWidgetPinningTeachingView)teachingView
{
  return self->_teachingView;
}

- (void)setTeachingView:(id)a3
{
}

- (NSMutableDictionary)cachedThresholds
{
  return self->_cachedThresholds;
}

- (void)setCachedThresholds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedThresholds, 0);
  objc_storeStrong((id *)&self->_teachingView, 0);
  objc_storeStrong((id *)&self->_catchupTimers, 0);
  objc_storeStrong((id *)&self->_catchupProperties, 0);
  objc_storeStrong(&self->_sizeChangeObserver, 0);
}

- (void)setRevealed:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setVisuallyRevealed:(uint64_t)a3 withSlowAnimation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_animatablePropertiesForStackViewUpdate
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1168);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222E49000, a2, OS_LOG_TYPE_DEBUG, "Created catchup properties: %@", (uint8_t *)&v3, 0xCu);
}

@end