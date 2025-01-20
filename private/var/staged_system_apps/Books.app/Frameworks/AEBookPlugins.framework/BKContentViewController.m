@interface BKContentViewController
- (AEBookInfo)book;
- (BKContentLoadingView)loadingView;
- (BKContentReloadView)reloadView;
- (BKContentViewController)init;
- (BKContentViewControllerDelegate)delegate;
- (BKContentViewControllerLayoutDelegate)layoutDelegate;
- (BKDocument)document;
- (BKFlowingBookLayoutConfiguration)configuration;
- (BKLocation)searchLocation;
- (BKPageLocation)assignedPageLocation;
- (BOOL)contentNeedsFilter;
- (BOOL)currentlyHighlighting;
- (BOOL)hasHighlightedText;
- (BOOL)hasTextSelected;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isContentLoadPending;
- (BOOL)isContentLoaded;
- (BOOL)isLoading;
- (BOOL)isLocationFromThisDocument:(id)a3;
- (BOOL)isLocationOnCurrentPage:(id)a3;
- (BOOL)isPlayingMedia;
- (BOOL)isReusable;
- (BOOL)isTOCContent;
- (BOOL)isUpsellContent;
- (BOOL)locationIsVertical:(id)a3;
- (BOOL)prefersSinglePagePresentation;
- (BOOL)shouldApplyPageColor;
- (BOOL)showsLoadingIndicator;
- (CGRect)cachedRectForAnnotation:(id)a3;
- (CGRect)cachedVisibleRectForAnnotation:(id)a3;
- (CGRect)rectForAnnotation:(id)a3;
- (CGRect)rectForAnnotation:(id)a3 visible:(BOOL)a4;
- (CGRect)rectForLocation:(id)a3;
- (CGRect)visibleRectForLocation:(id)a3;
- (CGSize)estimatedContentSize;
- (IMBaseRenderingCache)contentViewImageCache;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)separatorInsets;
- (UIView)contentView;
- (id)annotations;
- (id)currentLocation;
- (id)highlightViews;
- (id)pageTitlesForPageOffset:(int64_t)a3;
- (id)pathForSoundtrack;
- (id)snapshot;
- (int)pageProgressionDirection;
- (int)selectionHighlightType;
- (int64_t)ordinal;
- (int64_t)pageOffset;
- (int64_t)totalPages;
- (int64_t)visiblePageCount;
- (unint64_t)pageOffsetForLocation:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setThemeIfNeeded:(id)a3;
- (void)addHighlightView:(id)a3 forWK2:(BOOL)a4;
- (void)applyPageColor;
- (void)clearSearchLocation;
- (void)contentLoadFailed;
- (void)contentReady;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)ensureLocationVisible:(id)a3 adjustForSearchResultRevealMode:(BOOL)a4 completion:(id)a5;
- (void)ensureLocationVisible:(id)a3 completion:(id)a4;
- (void)hideLoadingViewAnimated:(BOOL)a3;
- (void)hideReloadUIAnimated:(BOOL)a3;
- (void)highlightSearchLocation:(id)a3;
- (void)isLocationVisible:(id)a3 annotation:(id)a4 completion:(id)a5;
- (void)load;
- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4;
- (void)prepareForReuse;
- (void)rectForAnnotation:(id)a3 visible:(BOOL)a4 withCompletion:(id)a5;
- (void)rectForAnnotation:(id)a3 withCompletion:(id)a4;
- (void)rectForLocation:(id)a3 completion:(id)a4;
- (void)releaseViews;
- (void)reloadViewDidBeginReloading:(id)a3;
- (void)removeHighlightView:(id)a3;
- (void)selectLocation:(id)a3 completion:(id)a4;
- (void)setBook:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentLoadPending:(BOOL)a3;
- (void)setContentLoaded:(BOOL)a3;
- (void)setContentViewImageCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)setEstimatedContentSize:(CGSize)a3;
- (void)setHighlightViews:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setOrdinal:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setPrefersSinglePagePresentation:(BOOL)a3;
- (void)setReloadView:(id)a3;
- (void)setSearchLocation:(id)a3;
- (void)setSelectionHighlightType:(int)a3;
- (void)setSelectionHighlightsVisible:(BOOL)a3;
- (void)setSeparatorInsets:(UIEdgeInsets)a3;
- (void)setShowsLoadingIndicator:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setTheme:(id)a3 force:(BOOL)a4;
- (void)setTotalPages:(int64_t)a3;
- (void)showLoadFailureUI;
- (void)showLoadingViewAnimated:(BOOL)a3;
- (void)showReloadUIAnimated:(BOOL)a3;
- (void)updateSelectionHighlights;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)visibleRectForLocation:(id)a3 completion:(id)a4;
@end

@implementation BKContentViewController

- (BKContentViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKContentViewController;
  result = [(BKContentViewController *)&v3 init];
  if (result)
  {
    result->_totalPages = -1;
    result->_ordinal = -1;
    result->_pageOffset = -1;
    result->_selectionHighlightType = 0;
  }
  return result;
}

- (void)dealloc
{
  [(BKContentViewController *)self releaseViews];
  [(BKContentViewController *)self setBook:0];
  [(BKContentViewController *)self setDocument:0];
  style = self->_style;
  self->_style = 0;

  [(BKContentViewController *)self setSearchLocation:0];
  [(IMBaseRenderingCache *)self->_contentViewImageCache cancelRenderingCacheOperationsForTarget:self];
  contentViewImageCache = self->_contentViewImageCache;
  self->_contentViewImageCache = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKContentViewController;
  [(BKViewController *)&v5 dealloc];
}

- (void)releaseViews
{
  highlightViews = self->_highlightViews;
  self->_highlightViews = 0;

  [(BKContentReloadView *)self->_reloadView removeFromSuperview];
  reloadView = self->_reloadView;
  self->_reloadView = 0;

  [(BKContentLoadingView *)self->_loadingView removeFromSuperview];
  loadingView = self->_loadingView;
  self->_loadingView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKContentViewController;
  [(BKViewController *)&v6 releaseViews];
}

- (void)didReceiveMemoryWarning
{
  v6.receiver = self;
  v6.super_class = (Class)BKContentViewController;
  [(BKContentViewController *)&v6 didReceiveMemoryWarning];
  if ([(BKContentViewController *)self isViewLoaded])
  {
    objc_super v3 = [(BKContentViewController *)self view];
    v4 = [v3 window];
    if (v4)
    {
    }
    else
    {
      unsigned __int8 v5 = [(BKContentViewController *)self isContentLoaded];

      if ((v5 & 1) == 0) {
        [(BKContentViewController *)self contentLoadFailed];
      }
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKContentViewController;
  [(BKContentViewController *)&v3 viewDidLoad];
  [(BKContentViewController *)self applyPageColor];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKContentViewController;
  [(BKContentViewController *)&v4 viewDidAppear:a3];
  if ([(BKContentViewController *)self showsLoadingIndicator])
  {
    if (![(BKContentViewController *)self isContentLoaded]) {
      [(BKContentViewController *)self showLoadingViewAnimated:1];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKContentViewController;
  [(BKContentViewController *)&v4 viewWillDisappear:a3];
  [(BKContentViewController *)self clearSelection];
  [(IMBaseRenderingCache *)self->_contentViewImageCache cancelRenderingCacheOperationsForTarget:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKContentViewController;
  [(BKContentViewController *)&v4 viewDidDisappear:a3];
  [(BKContentViewController *)self clearHighlightsForSearchResults];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  unsigned __int8 v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v6)
    {
      v7 = v6;
      unsigned __int8 v8 = [(BKContentViewController *)self isContentLoaded];

      if ((v8 & 1) == 0) {
        [(BKContentViewController *)self contentLoadFailed];
      }
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    unsigned __int8 v5 = obj;
  }
}

- (BOOL)isReusable
{
  return 1;
}

- (void)prepareForReuse
{
  [(BKContentViewController *)self setSearchLocation:0];
  [(BKContentViewController *)self setPageOffset:-1];
  self->_contentLoaded = 0;
  self->_contentLoadPending = 0;

  [(BKContentViewController *)self setDocument:0];
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  return 0;
}

- (void)isLocationVisible:(id)a3 annotation:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v5 = v6;
  }
}

- (BOOL)isAnnotationVisible:(id)a3
{
  return 0;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BKContentViewController cachedRectForAnnotation:]");
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BKContentViewController cachedVisibleRectForAnnotation:]");
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isLocationFromThisDocument:(id)a3
{
  return 0;
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4
{
  id v4 = objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 0x7FFFFFFFFFFFFFFFLL, 0);
    id v4 = v5;
  }
}

- (id)pageTitlesForPageOffset:(int64_t)a3
{
  return 0;
}

- (void)ensureLocationVisible:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (void)ensureLocationVisible:(id)a3 adjustForSearchResultRevealMode:(BOOL)a4 completion:(id)a5
{
  id v5 = (void (**)(void))objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    v5[2]();
    id v5 = v6;
  }
}

- (int64_t)visiblePageCount
{
  return 1;
}

- (void)load
{
  [(BKContentViewController *)self setContentLoadPending:1];
  if (([(BKContentViewController *)self isViewLoaded] & 1) == 0)
  {
    id v3 = [(BKContentViewController *)self view];
  }
}

- (BOOL)isLoading
{
  return 0;
}

- (void)setContentLoaded:(BOOL)a3
{
  if (self->_contentLoaded != a3)
  {
    self->_contentLoaded = a3;
    if (a3)
    {
      if (self->_loadingView)
      {
        [(BKContentViewController *)self hideLoadingViewAnimated:1];
      }
    }
    else if ([(BKContentViewController *)self showsLoadingIndicator] {
           && [(BKContentViewController *)self isViewLoaded])
    }
    {
      [(BKContentViewController *)self showLoadingViewAnimated:0];
    }
  }
}

- (void)contentReady
{
  [(BKContentViewController *)self hideLoadingViewAnimated:1];
  if (![(BKContentViewController *)self isContentLoaded])
  {
    [(BKContentViewController *)self setContentLoaded:1];
    [(BKContentViewController *)self setContentLoadPending:0];
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:BKContentReadyNotification object:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contentViewReady:self];
  }
}

- (void)contentLoadFailed
{
  [(BKContentViewController *)self setContentLoadPending:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:BKContentFAILNotification object:self];
}

- (BOOL)shouldApplyPageColor
{
  return 0;
}

- (void)applyPageColor
{
  if ([(BKContentViewController *)self isViewLoaded])
  {
    if ([(BKContentViewController *)self shouldApplyPageColor])
    {
      id v14 = [(BKContentViewController *)self themePage];
      id v3 = [v14 backgroundColorForTraitEnvironment:self];
      id v4 = objc_alloc((Class)CAFilter);
      id v5 = [v4 initWithType:kCAFilterMultiplyColor];
      id v6 = v3;
      objc_msgSend(v5, "setValue:forKeyPath:", objc_msgSend(v6, "CGColor"), @"inputColor");
      v7 = +[NSArray arrayWithObject:v5];
      unsigned __int8 v8 = [(BKContentViewController *)self view];
      v9 = [v8 layer];
      [v9 setFilters:v7];

      v10 = [(BKContentViewController *)self view];
      v11 = [v10 layer];
      [v11 setCreatesCompositingGroup:1];
    }
    else
    {
      v12 = [(BKContentViewController *)self view];
      v13 = [v12 layer];
      [v13 setFilters:0];

      id v14 = [(BKContentViewController *)self view];
      id v6 = [v14 layer];
      [v6 setCreatesCompositingGroup:0];
    }
  }
}

- (void)setTheme:(id)a3
{
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
}

- (void)_setThemeIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(BKContentViewController *)self theme];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKContentViewController;
    [(BKContentViewController *)&v8 setTheme:v4];
    [(BKContentViewController *)self applyPageColor];
    v7 = [(BKContentViewController *)self themePage];
    [(BKContentLoadingView *)self->_loadingView setTheme:v7];
    [(BKContentReloadView *)self->_reloadView setTheme:v7];
  }
}

- (id)snapshot
{
  if ([(BKContentViewController *)self isViewLoaded])
  {
    id v3 = [(BKContentViewController *)self view];
    id v4 = [v3 im_snapshotInContext];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)contentNeedsFilter
{
  return 0;
}

- (id)currentLocation
{
  return 0;
}

- (BOOL)isTOCContent
{
  return 0;
}

- (BOOL)isUpsellContent
{
  return 0;
}

- (BKPageLocation)assignedPageLocation
{
  unint64_t v3 = [(BKContentViewController *)self pageOffset];
  if (v3 <= 0x7FFFFFFFFFFFFFFELL) {
    id v4 = [[BKPageLocation alloc] initWithOrdinal:[(BKContentViewController *)self ordinal] andOffset:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (int)pageProgressionDirection
{
  v2 = [(BKContentViewController *)self book];
  int v3 = [v2 bkPageProgressionDirection];

  return v3;
}

- (BOOL)locationIsVertical:(id)a3
{
  return 0;
}

- (void)selectLocation:(id)a3 completion:(id)a4
{
  id v4 = objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v4 = v5;
  }
}

- (CGRect)rectForLocation:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)rectForLocation:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(double, double, double, double))objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    v4[2](CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v4 = v5;
  }
}

- (CGRect)visibleRectForLocation:(id)a3
{
  [(BKContentViewController *)self rectForLocation:a3];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  if (!CGRectIsNull(v17))
  {
    objc_super v8 = [(BKContentViewController *)self view];
    [v8 bounds];
    v21.origin.CGFloat x = v9;
    v21.origin.CGFloat y = v10;
    v21.size.CGFloat width = v11;
    v21.size.CGFloat height = v12;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRect v19 = CGRectIntersection(v18, v21);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)visibleRectForLocation:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_66EE8;
  v6[3] = &unk_1DB1C0;
  v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(BKContentViewController *)v7 rectForLocation:a3 completion:v6];
}

- (CGRect)rectForAnnotation:(id)a3
{
  [(BKContentViewController *)self rectForAnnotation:a3 visible:1];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)rectForAnnotation:(id)a3 withCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_67094;
  v7[3] = &unk_1DC180;
  id v8 = a4;
  id v6 = v8;
  [(BKContentViewController *)self rectForAnnotation:a3 visible:1 withCompletion:v7];
}

- (void)rectForAnnotation:(id)a3 visible:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  CGFloat v9 = [a3 location];
  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_67238;
    v15[3] = &unk_1DC180;
    CGFloat v10 = &v16;
    id v16 = v8;
    id v11 = v8;
    [(BKContentViewController *)self visibleRectForLocation:v9 completion:v15];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_672B4;
    v13[3] = &unk_1DC180;
    CGFloat v10 = &v14;
    id v14 = v8;
    id v12 = v8;
    [(BKContentViewController *)self rectForLocation:v9 completion:v13];
  }
}

- (CGRect)rectForAnnotation:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 location];
  if (v4) {
    [(BKContentViewController *)self visibleRectForLocation:v6];
  }
  else {
    [(BKContentViewController *)self rectForLocation:v6];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)highlightSearchLocation:(id)a3
{
  id v5 = a3;
  id v4 = [(BKContentViewController *)self ordinal];
  if (v4 == [v5 ordinal]) {
    [(BKContentViewController *)self setSearchLocation:v5];
  }
}

- (id)annotations
{
  return 0;
}

- (id)highlightViews
{
  return self->_highlightViews;
}

- (void)setHighlightViews:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  if (([(NSMutableArray *)self->_highlightViews isEqualToArray:v4] & 1) == 0)
  {
    highlightViews = self->_highlightViews;
    if (highlightViews != v4
      && ([(NSMutableArray *)highlightViews count] || [(NSMutableArray *)v4 count]))
    {
      if ([(NSMutableArray *)self->_highlightViews count])
      {
        id v6 = [(NSMutableArray *)self->_highlightViews copy];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            double v11 = 0;
            do
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              [(BKContentViewController *)self removeHighlightView:*(void *)(*((void *)&v23 + 1) + 8 * (void)v11)];
              double v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v9);
        }
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      double v12 = v4;
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          double v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v18 = [v17 copy:v19];
              [(BKContentViewController *)self addHighlightView:v18 forWK2:1];
            }
            double v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v14);
      }
    }
  }
}

- (BOOL)currentlyHighlighting
{
  return 0;
}

- (void)addHighlightView:(id)a3 forWK2:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v12 = v6;
    if (!self->_highlightViews)
    {
      id v7 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:30];
      highlightViews = self->_highlightViews;
      self->_highlightViews = v7;
    }
    if (a4) {
      [(BKContentViewController *)self highlightViewContainerWK2];
    }
    else {
    id v9 = [(BKContentViewController *)self highlightViewContainer];
    }
    uint64_t v10 = [(BKContentViewController *)self view];

    if (v10 != v9)
    {
      double v11 = [(BKContentViewController *)self view];
      [v12 frame];
      [v11 convertRect:v9 toView:];
      [v12 setFrame:];
    }
    [v9 addSubview:v12];
    [(NSMutableArray *)self->_highlightViews addObject:v12];

    id v6 = v12;
  }
}

- (void)removeHighlightView:(id)a3
{
  if (a3)
  {
    highlightViews = self->_highlightViews;
    id v4 = a3;
    [(NSMutableArray *)highlightViews removeObject:v4];
    [v4 removeFromSuperview];
  }
}

- (void)updateSelectionHighlights
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BKContentViewController *)self highlightViews];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updateHighlightImage];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setSelectionHighlightsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BKContentViewController *)self highlightViews];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    BOOL v8 = !v3;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setHidden:v8];
        long long v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)clearSearchLocation
{
}

- (BOOL)hasTextSelected
{
  return 0;
}

- (BOOL)hasHighlightedText
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BKContentViewController *)self highlightViews];
  BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isPlayingMedia
{
  return 0;
}

- (void)showLoadingViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKContentViewController *)self loadingView];
  double v6 = 0.0;
  [v5 setAlpha:0.0];
  long long v7 = [v5 superview];

  if (!v7)
  {
    long long v8 = [(BKContentViewController *)self view];
    [v8 addSubview:v5];
  }
  long long v9 = [(BKContentViewController *)self view];
  [v9 bounds];
  [v5 setFrame:];

  if (v3) {
    double v6 = 0.2;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_67C44;
  v11[3] = &unk_1DAB88;
  id v12 = v5;
  id v10 = v5;
  +[UIView animateWithDuration:v11 animations:v6];
}

- (void)hideLoadingViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(BKContentViewController *)self loadingView];
  if (v3) {
    double v5 = 0.2;
  }
  else {
    double v5 = 0.0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_67D60;
  v9[3] = &unk_1DAB88;
  id v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_67D6C;
  v7[3] = &unk_1DABD8;
  id v8 = v10;
  id v6 = v10;
  +[UIView animateWithDuration:v9 animations:v7 completion:v5];
}

- (BKContentLoadingView)loadingView
{
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    uint64_t v4 = [BKContentLoadingView alloc];
    double v5 = [(BKContentViewController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(BKContentViewController *)self themePage];
    uint64_t v15 = -[BKContentLoadingView initWithFrame:theme:](v4, "initWithFrame:theme:", v14, v7, v9, v11, v13);
    double v16 = self->_loadingView;
    self->_loadingView = v15;

    [(BKContentLoadingView *)self->_loadingView setAutoresizingMask:18];
    loadingView = self->_loadingView;
  }

  return loadingView;
}

- (void)showLoadFailureUI
{
}

- (void)showReloadUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKContentViewController *)self reloadView];
  double v6 = 0.0;
  [v5 setAlpha:0.0];
  double v7 = [v5 superview];

  if (!v7)
  {
    double v8 = [(BKContentViewController *)self view];
    [v8 addSubview:v5];
  }
  double v9 = [(BKContentViewController *)self view];
  [v9 bounds];
  [v5 setFrame:];

  if (v3) {
    double v6 = 0.2;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_67F8C;
  v11[3] = &unk_1DAB88;
  id v12 = v5;
  id v10 = v5;
  +[UIView animateWithDuration:v11 animations:v6];
}

- (void)hideReloadUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(BKContentViewController *)self reloadView];
  if (v3) {
    double v5 = 0.2;
  }
  else {
    double v5 = 0.0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_680A8;
  v9[3] = &unk_1DAB88;
  id v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_680B4;
  v7[3] = &unk_1DABD8;
  id v8 = v10;
  id v6 = v10;
  +[UIView animateWithDuration:v9 animations:v7 completion:v5];
}

- (BKContentReloadView)reloadView
{
  reloadView = self->_reloadView;
  if (!reloadView)
  {
    uint64_t v4 = [BKContentReloadView alloc];
    double v5 = [(BKContentViewController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(BKContentViewController *)self themePage];
    uint64_t v15 = -[BKContentReloadView initWithFrame:theme:delegate:](v4, "initWithFrame:theme:delegate:", v14, self, v7, v9, v11, v13);
    double v16 = self->_reloadView;
    self->_reloadView = v15;

    [(BKContentReloadView *)self->_reloadView setAutoresizingMask:18];
    reloadView = self->_reloadView;
  }

  return reloadView;
}

- (void)reloadViewDidBeginReloading:(id)a3
{
  [(BKContentViewController *)self hideReloadUIAnimated:1];
  [(BKContentViewController *)self reload];

  [(BKContentViewController *)self showLoadingViewAnimated:1];
}

- (id)pathForSoundtrack
{
  return 0;
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (int64_t)totalPages
{
  return self->_totalPages;
}

- (void)setTotalPages:(int64_t)a3
{
  self->_totalPages = a3;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
}

- (BKDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (IMBaseRenderingCache)contentViewImageCache
{
  return self->_contentViewImageCache;
}

- (void)setContentViewImageCache:(id)a3
{
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isContentLoaded
{
  return self->_contentLoaded;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  self->_showsLoadingIndicator = a3;
}

- (BKContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKContentViewControllerDelegate *)WeakRetained;
}

- (int)selectionHighlightType
{
  return self->_selectionHighlightType;
}

- (void)setSelectionHighlightType:(int)a3
{
  self->_selectionHighlightType = a3;
}

- (BKLocation)searchLocation
{
  return self->_searchLocation;
}

- (void)setSearchLocation:(id)a3
{
}

- (BKContentViewControllerLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (BKContentViewControllerLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (UIEdgeInsets)separatorInsets
{
  double top = self->_separatorInsets.top;
  double left = self->_separatorInsets.left;
  double bottom = self->_separatorInsets.bottom;
  double right = self->_separatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)prefersSinglePagePresentation
{
  return self->_prefersSinglePagePresentation;
}

- (void)setPrefersSinglePagePresentation:(BOOL)a3
{
  self->_prefersSinglePagePresentation = a3;
}

- (CGSize)estimatedContentSize
{
  double width = self->_estimatedContentSize.width;
  double height = self->_estimatedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEstimatedContentSize:(CGSize)a3
{
  self->_estimatedContentSize = a3;
}

- (BOOL)isContentLoadPending
{
  return self->_contentLoadPending;
}

- (void)setContentLoadPending:(BOOL)a3
{
  self->_contentLoadPending = a3;
}

- (void)setLoadingView:(id)a3
{
}

- (void)setReloadView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_contentViewImageCache, 0);
  objc_storeStrong((id *)&self->_highlightViews, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_document, 0);

  objc_storeStrong((id *)&self->_book, 0);
}

@end