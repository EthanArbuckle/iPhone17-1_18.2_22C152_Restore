@interface BKThumbnailDirectory
+ (CGSize)defaultCellSize;
+ (double)defaultCellAspectRatio;
- (BKThumbnailDirectory)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)cell:(id)a3 matchesPageNumber:(int64_t)a4;
- (BOOL)hidesSpine;
- (BOOL)showSpreads;
- (CGRect)frameForThumbnailAtLocation:(id)a3;
- (CGSize)cellSize;
- (CGSize)imageSize;
- (Class)cellClass;
- (IMGridView)gridView;
- (double)cellAspectRatio;
- (double)cellWidth;
- (double)pNumColumnsForSize:(CGSize)a3;
- (id)gridView:(id)a3 cellForIndex:(int64_t)a4;
- (id)locationAtIndex:(unint64_t)a3;
- (id)thumbnailForPageNumber:(int64_t)a3 size:(CGSize)a4;
- (int64_t)gridView:(id)a3 numberOfColumnsForSize:(CGSize)a4;
- (int64_t)leftPageNumberAtIndex:(unint64_t)a3;
- (int64_t)numberOfCellsInGridView:(id)a3;
- (int64_t)pageNumberForCellIndex:(unint64_t)a3;
- (int64_t)rightPageNumberAtIndex:(unint64_t)a3;
- (unint64_t)indexForLocation:(id)a3;
- (void)_updateColors;
- (void)adjustGridMetrics;
- (void)adjustToNewSize:(CGSize)a3;
- (void)animateRotationWithDuration:(double)a3;
- (void)configureCell:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
- (void)didRotate;
- (void)gridView:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)loadView;
- (void)releaseViews;
- (void)reloadCellAtIndex:(unint64_t)a3;
- (void)reloadData;
- (void)scrollToLocation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCellAspectRatio:(double)a3;
- (void)setCellWidth:(double)a3;
- (void)setHidesSpine:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setShowSpreads:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setThumbnail:(id)a3 forPage:(int64_t)a4;
- (void)updateVisibleArtwork;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKThumbnailDirectory

- (BKThumbnailDirectory)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailDirectory;
  v4 = [(BKViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    [(id)objc_opt_class() defaultCellAspectRatio];
    -[BKThumbnailDirectory setCellAspectRatio:](v4, "setCellAspectRatio:");
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKThumbnailDirectory *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)dealloc
{
  [(BKThumbnailDirectory *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailDirectory;
  [(BKContentViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  [(BKContentViewController *)&v4 releaseViews];
  [(IMGridView *)self->_gridView setDelegate:0];
  [(IMGridView *)self->_gridView setDataSource:0];
  gridView = self->_gridView;
  self->_gridView = 0;
}

- (void)loadView
{
  v22.receiver = self;
  v22.super_class = (Class)BKThumbnailDirectory;
  [(BKThumbnailDirectory *)&v22 loadView];
  objc_super v3 = [(BKThumbnailDirectory *)self view];
  id v4 = objc_alloc((Class)IMGridView);
  [v3 bounds];
  v5 = [v4 initWithFrame:];
  gridView = self->_gridView;
  self->_gridView = v5;

  [(IMGridView *)self->_gridView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(IMGridView *)self->_gridView setDelegate:self];
  [(IMGridView *)self->_gridView setDataSource:self];
  [(IMGridView *)self->_gridView setLayoutDirection:[(BKViewController *)self layoutDirection]];
  [v3 addSubview:self->_gridView];
  v7 = [v3 safeAreaLayoutGuide];
  [(IMGridView *)self->_gridView leadingAnchor];
  v21 = v20 = v7;
  v19 = [v7 leadingAnchor];
  v18 = [v21 constraintEqualToAnchor:v19];
  v23[0] = v18;
  v17 = [(IMGridView *)self->_gridView trailingAnchor];
  v16 = [v7 trailingAnchor];
  objc_super v8 = [v17 constraintEqualToAnchor:v16];
  v23[1] = v8;
  v9 = [(IMGridView *)self->_gridView topAnchor];
  v10 = [v3 topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[2] = v11;
  v12 = [(IMGridView *)self->_gridView bottomAnchor];
  v13 = [v3 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v23[3] = v14;
  v15 = +[NSArray arrayWithObjects:v23 count:4];
  +[NSLayoutConstraint activateConstraints:v15];

  [(BKThumbnailDirectory *)self _updateColors];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  [(BKThumbnailDirectory *)&v4 viewWillAppear:a3];
  [(BKThumbnailDirectory *)self reloadData];
  [(IMGridView *)self->_gridView flashScrollIndicators];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  [(BKContentViewController *)&v4 viewDidAppear:a3];
  [(IMGridView *)self->_gridView flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailDirectory;
  [(BKThumbnailDirectory *)&v3 viewDidLayoutSubviews];
  [(BKThumbnailDirectory *)self adjustGridMetrics];
}

- (void)animateRotationWithDuration:(double)a3
{
}

- (void)didRotate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_7977C;
  v2[3] = &unk_1DAB88;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [v7 transitionDuration];
  double v9 = v8;
  if (v8 > 0.0) {
    -[IMGridView prepareToRotateWithDestinationSize:](self->_gridView, "prepareToRotateWithDestinationSize:", width, height);
  }
  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailDirectory;
  -[BKThumbnailDirectory viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_79900;
  v11[3] = &unk_1DC868;
  v11[4] = self;
  *(double *)&v11[5] = v9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_79910;
  v10[3] = &unk_1DAA18;
  v10[4] = self;
  [v7 animateAlongsideTransition:v11 completion:v10];
}

- (void)setLayoutDirection:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailDirectory;
  [(BKViewController *)&v5 setLayoutDirection:"setLayoutDirection:"];
  [(IMGridView *)self->_gridView setLayoutDirection:a3];
}

- (double)pNumColumnsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(IMGridView *)self->_gridView bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat v8 = v16.size.width;
  CGFloat v9 = v16.size.height;
  double v10 = CGRectGetWidth(v16);
  int v11 = 2;
  if (![(BKThumbnailDirectory *)self showSpreads])
  {
    [(BKThumbnailDirectory *)self cellAspectRatio];
    if (v12 <= 1.0) {
      int v11 = 3;
    }
    else {
      int v11 = 2;
    }
  }
  if (!isMegaPad()) {
    goto LABEL_10;
  }
  if (v10 > 1024.0)
  {
    BOOL v13 = 1;
    goto LABEL_11;
  }
  if (v10 == 1024.0)
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.double width = v8;
    v17.size.double height = v9;
    BOOL v13 = CGRectGetHeight(v17) > 1024.0;
  }
  else
  {
LABEL_10:
    BOOL v13 = 0;
  }
LABEL_11:
  if (width / height < 1.0) {
    int v14 = v11;
  }
  else {
    int v14 = v11 + 1;
  }
  return (double)(v14 + v13);
}

- (void)adjustGridMetrics
{
  if ([(BKThumbnailDirectory *)self im_isCompactWidth]) {
    double v3 = 16.0;
  }
  else {
    double v3 = 32.0;
  }
  -[IMGridView setGridInset:](self->_gridView, "setGridInset:", v3, v3, v3, v3);
  -[IMGridView setMinimumGridSpacing:](self->_gridView, "setMinimumGridSpacing:", v3, v3);
  [(IMGridView *)self->_gridView bounds];
  double width = v14.size.width;
  double height = v14.size.height;
  double v6 = CGRectGetWidth(v14);
  [(IMGridView *)self->_gridView gridInset];
  double v8 = v6 - v7;
  [(IMGridView *)self->_gridView gridInset];
  double v10 = v8 - v9;
  -[BKThumbnailDirectory pNumColumnsForSize:](self, "pNumColumnsForSize:", width, height);
  if (v10 > 0.0)
  {
    [(BKThumbnailDirectory *)self setCellWidth:floor((v10 - (v11 + -1.0) * v3) / v11)];
    [(BKThumbnailDirectory *)self cellSize];
    gridView = self->_gridView;
    -[IMGridView setCellSize:](gridView, "setCellSize:");
  }
}

+ (double)defaultCellAspectRatio
{
  return *(double *)&BKThumbnailDirectoryDefaultAspectRatio;
}

+ (CGSize)defaultCellSize
{
  int v3 = isPad();
  objc_super v4 = (double *)&BKThumbnailDirectoryCellWidth_iPad;
  if (!v3) {
    objc_super v4 = (double *)&BKThumbnailDirectoryCellWidth_iPhone;
  }
  double v5 = *v4;
  [a1 defaultCellAspectRatio];
  *(float *)&double v6 = v5 / v6;
  double v7 = roundf(*(float *)&v6);
  double v8 = v5;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (CGSize)cellSize
{
  [(BKThumbnailDirectory *)self cellWidth];
  double v4 = v3;
  [(BKThumbnailDirectory *)self cellAspectRatio];
  double v5 = v4;
  if (v6 > 0.0)
  {
    [(BKThumbnailDirectory *)self cellAspectRatio];
    double v5 = v4 / v7;
  }
  if ([(BKThumbnailDirectory *)self showSpreads]) {
    double v8 = v5 * 0.5;
  }
  else {
    double v8 = v5;
  }
  double v9 = ceil(v4);
  double v10 = ceil(v8);
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)imageSize
{
  unsigned int v3 = [(BKThumbnailDirectory *)self showSpreads];
  int v4 = isPad();
  double v5 = (double *)&BKThumbnailDirectoryCellSpreadWidth_iPad;
  if (!v3) {
    double v5 = (double *)&BKThumbnailDirectoryCellWidth_iPad;
  }
  double v6 = (double *)&BKThumbnailDirectoryCellSpreadWidth_iPhone;
  if (!v3) {
    double v6 = (double *)&BKThumbnailDirectoryCellWidth_iPhone;
  }
  if (!v4) {
    double v5 = v6;
  }
  double v7 = *v5;
  [(BKThumbnailDirectory *)self cellAspectRatio];
  double v8 = v7;
  if (v9 > 0.0)
  {
    [(BKThumbnailDirectory *)self cellAspectRatio];
    double v8 = v7 / v10;
  }
  unsigned int v11 = [(BKThumbnailDirectory *)self showSpreads];
  double v12 = v8 * 0.5;
  double v13 = v7 * 0.5;
  if (!v11)
  {
    double v13 = v7;
    double v12 = v8;
  }
  double v14 = ceil(v13);
  double v15 = ceil(v12);
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (Class)cellClass
{
  [(BKThumbnailDirectory *)self showSpreads];
  v2 = objc_opt_class();

  return (Class)v2;
}

- (void)reloadData
{
}

- (CGRect)frameForThumbnailAtLocation:(id)a3
{
  unint64_t v4 = [(BKThumbnailDirectory *)self indexForLocation:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  else
  {
    [(IMGridView *)self->_gridView rectForCellAtIndex:v4];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGRect v17 = [(BKThumbnailDirectory *)self view];
    [v17 convertRect:self->_gridView fromView:v10, v12, v14, v16];
    CGFloat x = v18;
    CGFloat y = v19;
    CGFloat width = v20;
    CGFloat height = v21;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)scrollToLocation:(id)a3
{
  unint64_t v4 = [(BKThumbnailDirectory *)self indexForLocation:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v6 = [(BKThumbnailDirectory *)self gridView];
    [v6 scrollToCellAtIndex:v5 animated:0];
  }
}

- (id)locationAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexForLocation:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)cell:(id)a3 matchesPageNumber:(int64_t)a4
{
  id v6 = a3;
  if ([(BKThumbnailDirectory *)self showSpreads])
  {
    id v7 = v6;
    double v8 = [v7 spreadView];
    double v9 = [v8 leftPageView];
    if ([v9 pageNumber] == (id)a4)
    {
      char v10 = 1;
    }
    else
    {
      double v11 = [v7 spreadView];
      double v12 = [v11 rightPageView];
      char v10 = [v12 pageNumber] == (id)a4;
    }
  }
  else
  {
    id v7 = [v6 pageView];
    char v10 = [v7 pageNumber] == (id)a4;
  }

  return v10;
}

- (void)reloadCellAtIndex:(unint64_t)a3
{
  -[IMGridView cellForIndex:](self->_gridView, "cellForIndex:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(BKThumbnailDirectory *)self configureCell:v5 atIndex:a3];
}

- (void)adjustToNewSize:(CGSize)a3
{
  -[IMGridView prepareToRotateWithDestinationSize:](self->_gridView, "prepareToRotateWithDestinationSize:", a3.width, a3.height);
  [(BKThumbnailDirectory *)self animateRotationWithDuration:0.0];

  [(BKThumbnailDirectory *)self didRotate];
}

- (void)setThumbnail:(id)a3 forPage:(int64_t)a4
{
  if (a3)
  {
    id v6 = objc_alloc((Class)NSIndexSet);
    id v7 = [(IMGridView *)self->_gridView rangeOfVisibleCells];
    id v12 = [v6 initWithIndexesInRange:v7, v8];
    id v9 = [v12 firstIndex];
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = v9;
      while (1)
      {
        double v11 = [(IMGridView *)self->_gridView cellForIndex:v10];
        if ([(BKThumbnailDirectory *)self cell:v11 matchesPageNumber:a4]) {
          break;
        }
        id v10 = [v12 indexGreaterThanIndex:v10];

        if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_9;
        }
      }
      [(IMGridView *)self->_gridView reloadCellAtIndex:v10];
    }
LABEL_9:
  }
}

- (id)thumbnailForPageNumber:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v8 = [(BKDirectoryContent *)self directoryDelegate];
  id v9 = [v8 thumbnailDirectory:self thumbnailForPage:a3 size:self context:width height];

  return v9;
}

- (void)updateVisibleArtwork
{
  unsigned int v3 = [(BKDirectoryContent *)self directoryDelegate];
  [v3 thumbnailDirectory:self cancelPreviousRenderRequestsWithContext:self];

  unint64_t v4 = (char *)[(IMGridView *)self->_gridView rangeOfVisibleCells];
  if (v4 < &v4[v5])
  {
    id v6 = v4;
    uint64_t v7 = v5;
    do
    {
      [(BKThumbnailDirectory *)self reloadCellAtIndex:v6++];
      --v7;
    }
    while (v7);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (([v4 isDragging] & 1) == 0
    && ([v4 isDecelerating] & 1) == 0)
  {
    [(BKThumbnailDirectory *)self updateVisibleArtwork];
  }
}

- (int64_t)gridView:(id)a3 numberOfColumnsForSize:(CGSize)a4
{
  -[BKThumbnailDirectory pNumColumnsForSize:](self, "pNumColumnsForSize:", a3, a4.width, a4.height);
  return (uint64_t)v4;
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  return 0;
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v43 = v6;
    [(BKThumbnailDirectory *)self imageSize];
    double v8 = v7;
    double v10 = v9;
    if ([(BKThumbnailDirectory *)self showSpreads])
    {
      id v11 = v43;
      BOOL v12 = [(BKThumbnailDirectory *)self hidesSpine];
      double v13 = [v11 spreadView];
      [v13 setHidesSpine:v12];

      int64_t v14 = [(BKThumbnailDirectory *)self leftPageNumberAtIndex:a4];
      int64_t v15 = [(BKThumbnailDirectory *)self rightPageNumberAtIndex:a4];
      double v16 = [v11 spreadView];
      CGRect v17 = [v16 leftPageView];
      [v17 setPageNumber:v14];

      double v18 = [v11 spreadView];
      double v19 = [v18 rightPageView];
      [v19 setPageNumber:v15];

      double v20 = [(BKDirectoryContent *)self pageTitleForPageNumber:v14];
      double v21 = [v11 spreadView];
      double v22 = [v21 leftPageView];
      [v22 setPageTitle:v20];

      double v23 = [(BKDirectoryContent *)self pageTitleForPageNumber:v15];
      double v24 = [v11 spreadView];
      double v25 = [v24 rightPageView];
      [v25 setPageTitle:v23];

      v26 = -[BKThumbnailDirectory thumbnailForPageNumber:size:](self, "thumbnailForPageNumber:size:", v14, v8, v10);
      v27 = [v11 spreadView];
      v28 = [v27 leftPageView];
      [v28 setImage:v26];

      v29 = -[BKThumbnailDirectory thumbnailForPageNumber:size:](self, "thumbnailForPageNumber:size:", v15, v8, v10);
      v30 = [v11 spreadView];
      v31 = [v30 rightPageView];
      [v31 setImage:v29];

      v32 = [v11 spreadView];
      v33 = [v32 leftPageView];
      [v33 setShowsPageNumber:1];

      v34 = [v11 spreadView];
      v35 = [v34 rightPageView];
      [v35 setShowsPageNumber:1];

      v36 = [v11 spreadView];

      [v36 setNeedsLayout];
    }
    else
    {
      int64_t v37 = [(BKThumbnailDirectory *)self pageNumberForCellIndex:a4];
      v38 = -[BKThumbnailDirectory thumbnailForPageNumber:size:](self, "thumbnailForPageNumber:size:", v37, v8, v10);
      v39 = [v43 pageView];
      [v39 setImage:v38];

      v40 = [v43 pageView];
      [v40 setPageNumber:v37];

      v41 = [(BKDirectoryContent *)self pageTitleForPageNumber:v37];
      v42 = [v43 pageView];
      [v42 setPageTitle:v41];

      v36 = [v43 pageView];
      [v36 setShowsPageNumber:1];
    }

    id v6 = v43;
  }
}

- (id)gridView:(id)a3 cellForIndex:(int64_t)a4
{
  id v6 = [a3 dequeueReusableCell];
  if (!v6)
  {
    [(BKThumbnailDirectory *)self cellSize];
    id v6 = [objc_alloc(-[BKThumbnailDirectory cellClass](self, "cellClass")) initWithFrame:0.0, 0.0, v7, v8];
  }
  [(BKThumbnailDirectory *)self configureCell:v6 atIndex:a4];

  return v6;
}

- (void)gridView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v5 = [(BKThumbnailDirectory *)self locationAtIndex:a4];
  [(BKDirectoryContent *)self didSelectLocation:v5];
}

- (void)_updateColors
{
  unsigned int v3 = [(BKThumbnailDirectory *)self theme];
  id v6 = [v3 backgroundColorForTraitEnvironment:self];

  uint64_t v4 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v4 = +[UIColor bc_booksBackground];
  }
  id v7 = (id)v4;
  [(IMGridView *)self->_gridView setBackgroundColor:v4];
  id v5 = [(BKThumbnailDirectory *)self viewIfLoaded];
  [v5 setBackgroundColor:v7];
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  [(BKContentViewController *)&v4 setTheme:a3];
  [(BKThumbnailDirectory *)self _updateColors];
}

- (double)cellAspectRatio
{
  return self->_cellAspectRatio;
}

- (void)setCellAspectRatio:(double)a3
{
  self->_cellAspectRatio = a3;
}

- (BOOL)showSpreads
{
  return self->_showSpreads;
}

- (void)setShowSpreads:(BOOL)a3
{
  self->_showSpreads = a3;
}

- (BOOL)hidesSpine
{
  return self->_hidesSpine;
}

- (void)setHidesSpine:(BOOL)a3
{
  self->_hidesSpine = a3;
}

- (IMGridView)gridView
{
  return self->_gridView;
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_cellWidth = a3;
}

- (void).cxx_destruct
{
}

@end