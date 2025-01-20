@interface THFlowTOCViewController
- (BOOL)animatesPageDuringTransition;
- (BOOL)closeButtonIsNeeded;
- (BOOL)hasPaginatedData;
- (BOOL)introMediaControllerIsActive;
- (BOOL)introMediaControllerIsOffscreen;
- (BOOL)isSectionOpen:(id)a3;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)tableViewCellShouldStayHighlighted:(id)a3;
- (CGRect)frameForOrdinalAtIndentLevel:(int64_t)a3;
- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5;
- (CGSize)headerMaxSize;
- (NSMutableDictionary)chapterUIState;
- (NSURL)zipPackage;
- (PFDContext)drmContext;
- (THFlowTOCConfiguration)configuration;
- (THFlowTOCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THReflowablePaginationController)reflowablePaginationController;
- (THiOSIntroMediaViewController)introMediaViewController;
- (TSPData)headerImageData;
- (UIButton)backgroundButton;
- (UIButton)headerImageViews;
- (UIImage)closeSectionImage;
- (UIImage)openSectionImage;
- (double)bottomSeparatorYPositionForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)chapterTitleColor;
- (id)findVisibleCellInTable:(id)a3 forIndexPath:(id)a4;
- (id)labelFontForRow:(unint64_t)a3;
- (id)ordinalTextColor;
- (id)p_cellForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4;
- (id)p_circledButtonImageFromImage:(id)a3 radius:(double)a4;
- (id)p_displayPageNumberForTileEntry:(id)a3;
- (id)p_indexPathForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4;
- (id)p_maxAbsolutePageNumberForNodeAtTileEntry:(id)a3;
- (id)pageNumberColor;
- (id)pageNumberFont;
- (id)rasterizedImage;
- (id)subItemsForSection:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableViewCellBackgroundColor:(id)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)numberOfSubentriesForIndex:(int64_t)a3 inModel:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)accessoryTapped:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didTransitionFromCanvas;
- (void)initTOCSectionUIState;
- (void)introMediaControllerShouldAdvancePast:(id)a3;
- (void)makeSectionClosed:(id)a3 withSender:(id)a4;
- (void)makeSectionOpen:(id)a3 withSender:(id)a4;
- (void)p_applyTheme;
- (void)p_loadHeaderImageAndUpdateLayout;
- (void)p_releaseOutlets;
- (void)p_setupTransitionView;
- (void)p_showPageForModelLink:(id)a3;
- (void)p_tapOnBackground;
- (void)p_updateMaxPageNumberWidth;
- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4;
- (void)relinquishIntroMediaViewController;
- (void)scrollToRowForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)setBackgroundButton:(id)a3;
- (void)setChapterUIState:(id)a3;
- (void)setCloseSectionImage:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDrmContext:(id)a3;
- (void)setHasPaginatedData:(BOOL)a3;
- (void)setHeaderImageData:(id)a3;
- (void)setHeaderImageViews:(id)a3;
- (void)setHeaderMaxSize:(CGSize)a3;
- (void)setIntroMediaViewController:(id)a3;
- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4;
- (void)setOpenSectionImage:(id)a3;
- (void)setReflowablePaginationController:(id)a3;
- (void)setSectionOpenInUIState:(BOOL)a3 forSection:(id)a4;
- (void)setZipPackage:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableViewCell:(id)a3 hideSeparators:(BOOL)a4;
- (void)tableViewCellHighlightDidChange:(id)a3;
- (void)transitionDidFinish:(id)a3;
- (void)transitionWillFinish:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionFromChapterIndex:(unint64_t)a3;
@end

@implementation THFlowTOCViewController

- (THFlowTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  v6 = THBundle();
  v15.receiver = self;
  v15.super_class = (Class)THFlowTOCViewController;
  v7 = [(THFlowTOCViewController *)&v15 initWithNibName:v5 bundle:v6];

  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mModelToUIMap = v7->mModelToUIMap;
    v7->mModelToUIMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mUIToModelMap = v7->mUIToModelMap;
    v7->mUIToModelMap = v10;

    v12 = +[UITraitCollection bc_allAPITraits];
    id v13 = [(THFlowTOCViewController *)v7 registerForTraitChanges:v12 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

- (void)p_releaseOutlets
{
  mHeaderView = self->mHeaderView;
  self->mHeaderView = 0;

  mTOCTableView = self->mTOCTableView;
  self->mTOCTableView = 0;
}

- (void)dealloc
{
  [(THFlowTOCViewController *)self p_releaseOutlets];
  mModelToUIMap = self->mModelToUIMap;
  self->mModelToUIMap = 0;

  mUIToModelMap = self->mUIToModelMap;
  self->mUIToModelMap = 0;

  mZipPackage = self->mZipPackage;
  self->mZipPackage = 0;

  mHeaderImageData = self->mHeaderImageData;
  self->mHeaderImageData = 0;

  mBackgroundButton = self->mBackgroundButton;
  self->mBackgroundButton = 0;

  mChapterUIState = self->mChapterUIState;
  self->mChapterUIState = 0;

  mDrmContext = self->mDrmContext;
  self->mDrmContext = 0;

  mCloseSectionImage = self->mCloseSectionImage;
  self->mCloseSectionImage = 0;

  mOpenSectionImage = self->mOpenSectionImage;
  self->mOpenSectionImage = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  v13.receiver = self;
  v13.super_class = (Class)THFlowTOCViewController;
  [(THTOCViewController *)&v13 dealloc];
}

- (THFlowTOCConfiguration)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = self;
    id v5 = [[THFlowTOCConfiguration alloc] initWithContext:v4];
    v6 = self->_configuration;
    self->_configuration = v5;

    configuration = self->_configuration;
  }

  return configuration;
}

- (void)p_loadHeaderImageAndUpdateLayout
{
  if (self->mHeaderImageData)
  {
    v3 = [(THFlowTOCViewController *)self headerImageViews];

    if (!v3)
    {
      id v4 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [(THFlowTOCViewController *)self setHeaderImageViews:v4];

      id v5 = [(THFlowTOCViewController *)self headerImageViews];
      [v5 setAutoresizesSubviews:0];

      v6 = [(THFlowTOCViewController *)self headerImageViews];
      [v6 addTarget:self action:"p_tapOnBackground" forControlEvents:64];

      v7 = objc_alloc_init(THImageView);
      mHeaderView = self->mHeaderView;
      self->mHeaderView = v7;

      [(THImageView *)self->mHeaderView setUserInteractionEnabled:0];
      v9 = [(THFlowTOCViewController *)self headerImageViews];
      [v9 addSubview:self->mHeaderView];
    }
    [(TSWTableView *)self->mTOCTableView frame];
    double v11 = v10;
    TSUScreenScale();
    double v13 = v12 * v11;
    [(THFlowTOCViewController *)self headerMaxSize];
    if (v15 != v13 || v14 != 0.0)
    {
      -[THFlowTOCViewController setHeaderMaxSize:](self, "setHeaderMaxSize:", v13, 0.0);
      -[THImageView setImageData:maxSize:setLayerBounds:](self->mHeaderView, "setImageData:maxSize:setLayerBounds:", self->mHeaderImageData, 1, v13, 0.0);
    }
    [(THImageView *)self->mHeaderView frame];
    if (v16 <= 0.0)
    {
      v20 = [(THFlowTOCViewController *)self navigationController];
      v21 = [v20 navigationBar];
      [v21 bounds];
      double Height = CGRectGetHeight(v30);
    }
    else
    {
      float v18 = v11 * (v17 / v16);
      double Height = floorf(v18);
    }
    -[THImageView setFrame:](self->mHeaderView, "setFrame:", 0.0, 0.0, v11, Height);
    v22 = [(THFlowTOCViewController *)self headerImageViews];
    [v22 setFrame:CGRectMake(0.0, 0.0, v11, Height)];

    id v28 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithFrame:0.0, 0.0, v11, Height];
    v23 = [v28 contentView];
    v24 = [(THFlowTOCViewController *)self headerImageViews];
    [v23 addSubview:v24];

    [(TSWTableView *)self->mTOCTableView setTableHeaderView:v28];
    mTOCTableView = self->mTOCTableView;
    v26 = [(THFlowTOCViewController *)self view];
    [v26 frame];
    -[TSWTableView _setPinsTableHeaderView:](mTOCTableView, "_setPinsTableHeaderView:", Height / v27 < 0.3, Height / v27);
  }
}

- (void)relinquishIntroMediaViewController
{
}

- (void)setIntroMediaViewController:(id)a3
{
  id v5 = (THiOSIntroMediaViewController *)a3;
  p_mIntroMediaViewController = &self->mIntroMediaViewController;
  mIntroMediaViewController = self->mIntroMediaViewController;
  if (mIntroMediaViewController != v5)
  {
    v9 = v5;
    v8 = [(THiOSIntroMediaViewController *)mIntroMediaViewController delegate];

    if (v8 == self) {
      [(THiOSIntroMediaViewController *)*p_mIntroMediaViewController setDelegate:0];
    }
    objc_storeStrong((id *)&self->mIntroMediaViewController, a3);
    mIntroMediaViewController = (THiOSIntroMediaViewController *)[(THiOSIntroMediaViewController *)*p_mIntroMediaViewController setDelegate:self];
    id v5 = v9;
  }

  _objc_release_x1(mIntroMediaViewController, v5);
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    [(THFlowTOCViewController *)self view];

    [(THFlowTOCViewController *)self setIntroMediaViewController:v5];
    [(THTOCViewController *)self setForceStatusBarVisible:0];
    v6 = [(THFlowTOCViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(THFlowTOCViewController *)self introMediaViewController];
    double v16 = [v15 view];
    [v16 setFrame:v8, v10, v12, v14];

    double v17 = [(THFlowTOCViewController *)self view];
    float v18 = [(THFlowTOCViewController *)self introMediaViewController];
    v19 = [v18 view];
    [v17 addSubview:v19];

    self->mForceTransitionCompletion = 0;
  }

  [(THFlowTOCViewController *)self refreshStatusBarAppearance];
}

- (BOOL)introMediaControllerIsActive
{
  v2 = [(THFlowTOCViewController *)self introMediaViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)introMediaControllerIsOffscreen
{
  return ![(THFlowTOCViewController *)self introMediaControllerIsActive];
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)THFlowTOCViewController;
  [(THFlowTOCViewController *)&v31 viewDidLoad];
  BOOL v3 = [(THFlowTOCViewController *)self view];
  [v3 setAutoresizingMask:18];

  mTOCTableView = self->mTOCTableView;
  if (!mTOCTableView)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController viewDidLoad]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:539 description:@"invalid nil value for '%s'", "mTOCTableView"];

    mTOCTableView = self->mTOCTableView;
  }
  [(TSWTableView *)mTOCTableView setDelegate:self];
  [(TSWTableView *)self->mTOCTableView setDataSource:self];
  [(TSWTableView *)self->mTOCTableView setIgnoresEventsOutsideCells:1];
  double v8 = [(THFlowTOCViewController *)self configuration];
  [v8 separatorColorWhite];
  double v10 = +[UIColor colorWithWhite:v9 / 255.0 alpha:1.0];
  [(TSWTableView *)self->mTOCTableView setSeparatorColor:v10];

  double v11 = [(THFlowTOCViewController *)self configuration];
  LODWORD(v8) = [v11 constrainTableWidthToLegacyiPadWidth];

  double v12 = 0.0;
  if (v8)
  {
    [(TSWTableView *)self->mTOCTableView bounds];
    double v14 = (v13 + -768.0) * 0.5;
    if (v13 <= 768.0) {
      double v14 = 0.0;
    }
    double v12 = ceil(v14);
  }
  -[TSWTableView _setSectionContentInset:](self->mTOCTableView, "_setSectionContentInset:", 0.0, v12, 0.0, v12);
  [(TSWTableView *)self->mTOCTableView _setPinsTableHeaderView:0];
  [(TSWTableView *)self->mTOCTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TSWTableView *)self->mTOCTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"TOCCellReuseIdentifier"];
  double y = CGRectZero.origin.y;
  double height = CGRectZero.size.height;
  [(TSWTableView *)self->mTOCTableView frame];
  id v18 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, v17, height];
  [v18 setAutoresizingMask:2];
  v19 = [(TSWTableView *)self->mTOCTableView backgroundColor];
  [v18 setBackgroundColor:v19];

  [(TSWTableView *)self->mTOCTableView setTableFooterView:v18];
  self->mMaxPageNumberWidth = 0.0;
  self->mMaxOrdinalWidth = 0.0;
  [(THFlowTOCViewController *)self initTOCSectionUIState];
  v20 = +[UIImage th_imageNamed:kTocArrowCloseImageN];
  v21 = [(THFlowTOCViewController *)self configuration];
  [v21 discloseButtonRadius];
  double v23 = v22;

  v24 = [(THFlowTOCViewController *)self p_circledButtonImageFromImage:v20 radius:v23];
  [(THFlowTOCViewController *)self setCloseSectionImage:v24];

  v25 = +[UIImage th_imageNamed:kTocArrowOpenImageN];
  v26 = [(THFlowTOCViewController *)self p_circledButtonImageFromImage:v25 radius:v23];
  [(THFlowTOCViewController *)self setOpenSectionImage:v26];

  double v27 = [(THTOCViewController *)self dataSource];
  id v28 = [v27 bookTOCHeaderImageDataForTOC:self];
  [(THFlowTOCViewController *)self setHeaderImageData:v28];

  [(THFlowTOCViewController *)self p_loadHeaderImageAndUpdateLayout];
  v29 = +[UIColor blackColor];
  CGRect v30 = [(THFlowTOCViewController *)self view];
  [v30 setBackgroundColor:v29];

  [(THFlowTOCViewController *)self p_applyTheme];
}

- (id)p_circledButtonImageFromImage:(id)a3 radius:(double)a4
{
  id v5 = a3;
  double v6 = a4 + a4;
  [v5 size];
  TSDCenterRectOverRect();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  id v15 = objc_alloc((Class)UIGraphicsImageRenderer);
  double v16 = +[UIGraphicsImageRendererFormat preferredFormat];
  id v17 = [v15 initWithSize:v16 format:v6, v6];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_CC294;
  v21[3] = &unk_4590A0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  double v25 = v6;
  double v26 = v6;
  id v22 = v5;
  uint64_t v27 = v8;
  uint64_t v28 = v10;
  uint64_t v29 = v12;
  uint64_t v30 = v14;
  id v18 = v5;
  v19 = [v17 imageWithActions:v21];

  return v19;
}

- (void)p_tapOnBackground
{
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    BOOL v3 = [(THTOCViewController *)self delegate];
    unsigned int v4 = [v3 isToolbarHidden];

    id v5 = [(THTOCViewController *)self delegate];
    id v6 = v5;
    if (v4) {
      [v5 showToolbarAnimated:1];
    }
    else {
      [v5 hideToolbarAnimated:1];
    }
  }
}

- (void)p_applyTheme
{
  if ([(THFlowTOCViewController *)self isViewLoaded])
  {
    BOOL v3 = [(THFlowTOCViewController *)self theme];

    if (v3)
    {
      unsigned int v4 = [(THFlowTOCViewController *)self theme];
      id v10 = [v4 backgroundColorForTraitEnvironment:self];

      id v5 = [(THFlowTOCViewController *)self theme];
      id v6 = [v5 tableViewSeparatorColor];
      [(TSWTableView *)self->mTOCTableView setSeparatorColor:v6];
    }
    else
    {
      id v10 = +[UIColor systemBackgroundColor];
    }
    uint64_t v7 = [(THFlowTOCViewController *)self view];
    [v7 setBackgroundColor:v10];

    [(TSWTableView *)self->mTOCTableView setBackgroundColor:v10];
    uint64_t v8 = [(TSWTableView *)self->mTOCTableView tableFooterView];
    [v8 setBackgroundColor:v10];

    uint64_t v9 = [(TSWTableView *)self->mTOCTableView tableHeaderView];
    [v9 setBackgroundColor:v10];

    [(TSWTableView *)self->mTOCTableView reloadData];
    [(THFlowTOCViewController *)self setNeedsStatusBarAppearanceUpdate];
    [(THFlowTOCViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)THFlowTOCViewController;
  [(THFlowTOCViewController *)&v11 viewWillAppear:a3];
  unsigned int v4 = [(THFlowTOCViewController *)self configuration];
  [v4 invalidate];

  id v5 = [(THFlowTOCViewController *)self backgroundButton];

  if (!v5)
  {
    id v6 = objc_alloc((Class)UIButton);
    uint64_t v7 = [(THFlowTOCViewController *)self view];
    [v7 frame];
    id v8 = [v6 initWithFrame:];

    [v8 setAutoresizingMask:18];
    uint64_t v9 = [(THFlowTOCViewController *)self view];
    [v9 insertSubview:v8 belowSubview:self->mTOCTableView];

    [(THFlowTOCViewController *)self setBackgroundButton:v8];
    id v10 = [(THFlowTOCViewController *)self backgroundButton];
    [v10 addTarget:self action:"p_tapOnBackground" forControlEvents:64];
  }
}

- (void)setReflowablePaginationController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reflowablePaginationController);

  if (WeakRetained != obj)
  {
    id v5 = [(THFlowTOCViewController *)self reflowablePaginationController];
    [v5 unregisterObserver:self];

    objc_storeWeak((id *)&self->_reflowablePaginationController, obj);
    id v6 = [(THFlowTOCViewController *)self reflowablePaginationController];
    [v6 registerObserver:self];
  }
}

- (void)p_updateMaxPageNumberWidth
{
  BOOL v3 = [(THTOCViewController *)self dataSource];
  unsigned int v31 = [v3 showPageNumbers];

  uint64_t v30 = [(THFlowTOCViewController *)self pageNumberFont];
  unsigned int v4 = [(THFlowTOCViewController *)self labelFontForRow:0];
  id v5 = [(THFlowTOCViewController *)self labelFontForRow:1];
  id v6 = [(THTOCViewController *)self dataSource];
  id v7 = [v6 toc:self numberOfTilesInDivision:0];

  id v27 = v7;
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v29 = v4;
    do
    {
      uint64_t v9 = [(THTOCViewController *)self dataSource];
      uint64_t v28 = v8;
      id v10 = [v9 toc:self tileModelForChapterIndex:v8];

      objc_super v11 = [v10 portraitEntries];
      uint64_t v12 = (char *)[v11 count];

      if (v12)
      {
        for (i = 0; i != v12; ++i)
        {
          uint64_t v14 = [v10 portraitEntries];
          id v15 = [v14 objectAtIndex:i];

          if ([v15 includeInTOC])
          {
            double v16 = [v15 sectionIdentifier];
            if (i) {
              id v17 = v5;
            }
            else {
              id v17 = v4;
            }
            NSAttributedStringKey v34 = NSFontAttributeName;
            v35 = v17;
            id v18 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            [v16 sizeWithAttributes:v18];
            double v20 = v19;

            if (v20 > self->mMaxOrdinalWidth) {
              self->float mMaxOrdinalWidth = v20;
            }
            if (v31)
            {
              if ([(THFlowTOCViewController *)self hasPaginatedData]) {
                [(THFlowTOCViewController *)self p_displayPageNumberForTileEntry:v15];
              }
              else {
              v21 = [(THFlowTOCViewController *)self p_maxAbsolutePageNumberForNodeAtTileEntry:v15];
              }
              NSAttributedStringKey v32 = NSFontAttributeName;
              v33 = v30;
              id v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
              [v21 sizeWithAttributes:v22];
              double v24 = v23;

              if (v24 > self->mMaxPageNumberWidth) {
                self->float mMaxPageNumberWidth = v24;
              }

              unsigned int v4 = v29;
            }
          }
        }
      }

      uint64_t v8 = v28 + 1;
    }
    while ((id)(v28 + 1) != v27);
  }
  float mMaxOrdinalWidth = self->mMaxOrdinalWidth;
  self->float mMaxOrdinalWidth = ceilf(mMaxOrdinalWidth);
  float mMaxPageNumberWidth = self->mMaxPageNumberWidth;
  self->float mMaxPageNumberWidth = ceilf(mMaxPageNumberWidth);
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)THFlowTOCViewController;
  [(THFlowTOCViewController *)&v15 viewDidLayoutSubviews];
  BOOL v3 = [(THFlowTOCViewController *)self configuration];
  [v3 cellHeight];
  -[TSWTableView setRowHeight:](self->mTOCTableView, "setRowHeight:");

  [(THFlowTOCViewController *)self p_updateMaxPageNumberWidth];
  unsigned int v4 = [(THFlowTOCViewController *)self configuration];
  [v4 ordinalNumberLeftMargin];
  double v6 = v5;

  id v7 = [(THFlowTOCViewController *)self configuration];
  [v7 discloseButtonRightMargin];
  double v9 = v8;

  double v10 = 0.0;
  -[TSWTableView setSeparatorInset:](self->mTOCTableView, "setSeparatorInset:", 0.0, v6, 0.0, v9);
  objc_super v11 = [(THFlowTOCViewController *)self configuration];
  unsigned int v12 = [v11 constrainTableWidthToLegacyiPadWidth];

  if (v12)
  {
    [(TSWTableView *)self->mTOCTableView bounds];
    double v14 = (v13 + -768.0) * 0.5;
    if (v13 <= 768.0) {
      double v14 = 0.0;
    }
    double v10 = ceil(v14);
  }
  -[TSWTableView _setSectionContentInset:](self->mTOCTableView, "_setSectionContentInset:", 0.0, v10, 0.0, v10);
  [(THFlowTOCViewController *)self p_loadHeaderImageAndUpdateLayout];
  [(TSWTableView *)self->mTOCTableView reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCViewController;
  [(THFlowTOCViewController *)&v6 viewDidAppear:a3];
  unsigned int v4 = [(THTOCViewController *)self delegate];
  [v4 tocIsReadyToPresent:self];

  double v5 = [(THTOCViewController *)self delegate];
  [v5 setupDVCForTOCController:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THFlowTOCViewController;
  [(THFlowTOCViewController *)&v5 viewWillDisappear:a3];
  unsigned int v4 = [(THFlowTOCViewController *)self findVisibleCellInTable:self->mTOCTableView forIndexPath:self->mLastSelectedRow];
  [v4 stopProgressIndicator];
}

- (id)findVisibleCellInTable:(id)a3 forIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 indexPathsForVisibleRows];
  if ([v7 indexOfObject:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = 0;
  }
  else
  {
    double v8 = [v5 cellForRowAtIndexPath:v6];
  }

  return v8;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  id v5 = [(THFlowTOCViewController *)self configuration];
  [v5 invalidate];

  id v6 = [(THFlowTOCViewController *)self view];
  id v7 = [v6 superview];

  if (v7)
  {
    [(THFlowTOCViewController *)self setNeedsStatusBarAppearanceUpdate];
    [(THFlowTOCViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
  double v8 = [(THFlowTOCViewController *)self view];
  [v8 setNeedsUpdateConstraints];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [(THFlowTOCViewController *)self configuration];
  [v5 invalidate];

  [(THFlowTOCViewController *)self p_applyTheme];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = [(THTOCViewController *)self delegate];
  unsigned __int8 v3 = [v2 isToolbarHidden];

  return v3;
}

- (void)didReceiveMemoryWarning
{
  if (!self->mTransitionView)
  {
    v2.receiver = self;
    v2.super_class = (Class)THFlowTOCViewController;
    [(THFlowTOCViewController *)&v2 didReceiveMemoryWarning];
  }
}

- (BOOL)animatesPageDuringTransition
{
  return 0;
}

- (void)willTransitionFromChapterIndex:(unint64_t)a3
{
  id v5 = +[TSUAssertionHandler currentHandler];
  unsigned __int8 v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController willTransitionFromChapterIndex:]");
  unsigned int v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
  [v5 handleFailureInFunction:v3 file:v4 lineNumber:850 description:@"Not supported in flow TOC"];
}

- (void)didTransitionFromCanvas
{
  id v4 = +[TSUAssertionHandler currentHandler];
  objc_super v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController didTransitionFromCanvas]");
  unsigned __int8 v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
  [v4 handleFailureInFunction:v2 file:v3 lineNumber:854 description:@"Not supported in flow TOC"];
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController rectForPageThumbnailAtIndex:chapterIndex:inLayer:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
  [v5 handleFailureInFunction:v6 file:v7 lineNumber:858 description:@"Not supported in flow TOC"];

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

- (void)initTOCSectionUIState
{
  unsigned __int8 v3 = [(THTOCViewController *)self dataSource];
  double v19 = self;
  id v4 = (char *)[v3 toc:self numberOfTilesInDivision:0];

  id v20 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v4];
  id v18 = v4;
  if ((uint64_t)v4 >= 1)
  {
    id v5 = 0;
    do
    {
      id v6 = +[NSIndexPath indexPathForRow:0 inSection:v5];
      id v7 = +[NSIndexPath indexPathForRow:0 inSection:v5];
      double v8 = [(THTOCViewController *)v19 dataSource];
      objc_super v9 = [v8 toc:v19 tileModelForChapterIndex:v5];

      double v10 = [v9 portraitEntries];
      id v11 = [v10 count];

      unsigned int v12 = [[THFlowTOCChapterUIState alloc] initWithSection:v6];
      [(NSMutableDictionary *)v19->mModelToUIMap setObject:v7 forKey:v6];
      [(NSMutableDictionary *)v19->mUIToModelMap setObject:v6 forKey:v7];
      double v13 = +[NSMutableArray array];
      if ((unint64_t)v11 >= 2)
      {
        for (uint64_t i = 1; (id)i != v11; ++i)
        {
          objc_super v15 = [v9 portraitEntries];
          double v16 = [v15 objectAtIndex:i];

          if ([v16 indentLevel] == (char *)&dword_0 + 1
            && [v16 includeInTOC])
          {
            id v17 = +[NSIndexPath indexPathForRow:i inSection:v5];
            [v13 addObject:v17];
          }
        }
      }
      [(THFlowTOCChapterUIState *)v12 setSubItems:v13];
      [v20 setObject:v12 forKey:v7];

      ++v5;
    }
    while (v5 != v18);
  }
  [(THFlowTOCViewController *)v19 setChapterUIState:v20];
}

- (BOOL)isSectionOpen:(id)a3
{
  id v4 = a3;
  id v5 = [(THFlowTOCViewController *)self chapterUIState];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    unsigned __int8 v7 = [v6 opened];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)setSectionOpenInUIState:(BOOL)a3 forSection:(id)a4
{
  BOOL v4 = a3;
  id v21 = a4;
  id v6 = [(THFlowTOCViewController *)self chapterUIState];
  unsigned __int8 v7 = [v6 objectForKey:v21];

  if (!v7)
  {
    unsigned __int8 v7 = [[THFlowTOCChapterUIState alloc] initWithSection:v21];
    double v8 = [(THFlowTOCViewController *)self chapterUIState];
    [v8 setObject:v7 forKey:v21];
  }
  [(THFlowTOCChapterUIState *)v7 setOpened:v4];
  objc_super v9 = [(THFlowTOCChapterUIState *)v7 subItems];

  if (v9) {
    goto LABEL_12;
  }
  double v10 = [(THTOCViewController *)self dataSource];
  id v11 = [v10 toc:tileModelForChapterIndex:self, [v21 section]];

  unsigned int v12 = +[NSMutableArray array];
  double v13 = (char *)[v21 row] + 1;
  double v14 = [v11 portraitEntries];
  objc_super v15 = (char *)[v14 count];

  if (v13 >= v15) {
    goto LABEL_11;
  }
  while (1)
  {
    double v16 = [v11 portraitEntries];
    id v17 = [v16 objectAtIndex:v13];

    if ((uint64_t)[v17 indentLevel] < 2) {
      break;
    }
    id v18 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v13, [v21 section]);
    [v12 addObject:v18];

LABEL_8:
    ++v13;
    double v19 = [v11 portraitEntries];
    id v20 = (char *)[v19 count];

    if (v13 >= v20) {
      goto LABEL_11;
    }
  }
  if ([v17 indentLevel] != (char *)&dword_0 + 1) {
    goto LABEL_8;
  }

LABEL_11:
  [(THFlowTOCChapterUIState *)v7 setSubItems:v12];

LABEL_12:
}

- (id)subItemsForSection:(id)a3
{
  id v4 = a3;
  id v5 = [(THFlowTOCViewController *)self chapterUIState];
  id v6 = [v5 objectForKey:v4];

  unsigned __int8 v7 = [v6 subItems];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(THTOCViewController *)self dataSource];
  id v5 = [v4 toc:self numberOfTilesInDivision:0];

  return (int64_t)v5;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  v20[0] = a3;
  v20[1] = 0;
  id v4 = +[NSIndexPath indexPathWithIndexes:v20 length:2];
  if ([(THFlowTOCViewController *)self isSectionOpen:v4])
  {
    id v5 = [(THFlowTOCViewController *)self subItemsForSection:v4];
    id v6 = (char *)[v5 count] + 1;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v12, (void)v15))
          {
            double v13 = [(THFlowTOCViewController *)self subItemsForSection:v12];
            id v6 = &v6[(void)[v13 count]];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = (unsigned char *)(&dword_0 + 1);
  }

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(THFlowTOCViewController *)self numberOfRowsInSection:a4];
}

- (CGRect)frameForOrdinalAtIndentLevel:(int64_t)a3
{
  id v5 = [(THFlowTOCViewController *)self configuration];
  [v5 ordinalNumberLeftMargin];
  double v7 = v6;

  id v8 = [(THFlowTOCViewController *)self configuration];
  unsigned int v9 = [v8 multiLevelIndent];

  if (v9)
  {
    uint64_t v10 = [(THFlowTOCViewController *)self configuration];
    [v10 ordinalWidthLevel1];
    double v12 = v11;

    if (a3 < 1)
    {
      double v17 = 0.0;
    }
    else
    {
      double v13 = [(THFlowTOCViewController *)self configuration];
      [v13 ordinalWidthLevel2];
      double v12 = v14;

      long long v15 = [(THFlowTOCViewController *)self configuration];
      [v15 ordinalWidthLevel1];
      double v17 = v16 + 0.0;

      if (a3 != 1)
      {
        long long v18 = [(THFlowTOCViewController *)self configuration];
        [v18 ordinalWidthLevel3];
        double v12 = v19;

        id v20 = [(THFlowTOCViewController *)self configuration];
        [v20 ordinalWidthLevel2];
        double v17 = v17 + v21;

        if ((unint64_t)a3 >= 3)
        {
          id v22 = [(THFlowTOCViewController *)self configuration];
          [v22 ordinalWidthLevel3];
          double v17 = v17 + v23 * (double)(a3 - 2);
        }
      }
    }
    double v7 = v7 + v17;
  }
  else
  {
    double v24 = [(THFlowTOCViewController *)self configuration];
    double v25 = v24;
    if (a3) {
      [v24 ordinalNumberRightMarginSection];
    }
    else {
      [v24 ordinalNumberRightMarginChapter];
    }
    double v27 = v26;

    double v12 = v27 + self->mMaxOrdinalWidth;
  }
  uint64_t v28 = [(THFlowTOCViewController *)self configuration];
  [v28 cellHeight];
  double v30 = v29;

  double v31 = 0.0;
  double v32 = v7;
  double v33 = v12;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v31;
  result.origin.double x = v32;
  return result;
}

- (int64_t)numberOfSubentriesForIndex:(int64_t)a3 inModel:(id)a4
{
  id v5 = [a4 portraitEntries];
  id v6 = [v5 count];
  double v7 = [v5 objectAtIndex:a3];
  id v8 = [v7 indentLevel];
  int64_t v9 = 0;
  int64_t v10 = a3 + 1;
  while (v10 < (uint64_t)v6)
  {
    double v11 = [v5 objectAtIndex:v10];

    if ([v11 includeInTOC] && (uint64_t)objc_msgSend(v11, "indentLevel") > (uint64_t)v8) {
      ++v9;
    }
    ++v10;
    double v7 = v11;
    if ((uint64_t)[v11 indentLevel] <= (uint64_t)v8) {
      goto LABEL_9;
    }
  }
  double v11 = v7;
LABEL_9:

  return v9;
}

- (id)labelFontForRow:(unint64_t)a3
{
  id v5 = [(THFlowTOCViewController *)self configuration];
  [v5 chapterLabelFontSize];
  double v7 = v6;

  id v8 = [(THFlowTOCViewController *)self configuration];
  [v8 sectionLabelFontSize];
  double v10 = v9;

  if (a3) {
    double v11 = v10;
  }
  else {
    double v11 = v7;
  }
  double v12 = +[UIFont systemFontOfSize:v11];

  return v12;
}

- (id)pageNumberFont
{
  objc_super v2 = [(THFlowTOCViewController *)self configuration];
  [v2 pageNumberFontSize];
  double v4 = v3;

  return +[UIFont systemFontOfSize:v4];
}

- (id)ordinalTextColor
{
  double v3 = [(THFlowTOCViewController *)self theme];
  if (v3)
  {
    double v4 = [(THFlowTOCViewController *)self theme];
    id v5 = [v4 tocPageNumberTextColor];
  }
  else
  {
    id v5 = +[UIColor bc_booksSecondaryLabelColor];
  }

  return v5;
}

- (id)chapterTitleColor
{
  double v3 = [(THFlowTOCViewController *)self theme];
  if (v3)
  {
    double v4 = [(THFlowTOCViewController *)self theme];
    id v5 = [v4 contentTextColor];
  }
  else
  {
    id v5 = +[UIColor bc_booksLabelColor];
  }

  return v5;
}

- (id)pageNumberColor
{
  double v3 = [(THFlowTOCViewController *)self theme];
  if (v3)
  {
    double v4 = [(THFlowTOCViewController *)self theme];
    id v5 = [v4 tocPageNumberTextColor];
  }
  else
  {
    id v5 = +[UIColor bc_booksSecondaryLabelColor];
  }

  return v5;
}

- (id)p_displayPageNumberForTileEntry:(id)a3
{
  id v4 = a3;
  id v5 = THBundle();
  double v6 = [v5 localizedStringForKey:@"-" value:&stru_46D7E8 table:0];

  if ([(THFlowTOCViewController *)self hasPaginatedData])
  {
    id v7 = [v4 displayPageNumberValue];
  }
  else
  {
    id v8 = [(THTOCViewController *)self delegate];
    double v9 = (char *)[v8 absolutePageIndexForTileEntry:v4];

    if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    id v7 = v9 + 1;
  }
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", v7, [v4 displayPageNumberFormat], 0);

    double v6 = (void *)v10;
  }
LABEL_7:

  return v6;
}

- (id)p_maxAbsolutePageNumberForNodeAtTileEntry:(id)a3
{
  id v4 = a3;
  id v5 = THBundle();
  double v6 = [v5 localizedStringForKey:@"-" value:&stru_46D7E8 table:0];

  if (![(THFlowTOCViewController *)self hasPaginatedData])
  {
    id v7 = [(THTOCViewController *)self delegate];
    uint64_t v8 = (uint64_t)[v7 maxAbsolutePageIndexForNodeAtTileEntry:v4];

    if (v8 <= 0x7FFFFFFFFFFFFFFDLL)
    {
      uint64_t v9 = +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", (v8 + 1), [v4 displayPageNumberFormat], 0);

      double v6 = (void *)v9;
    }
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(THTOCViewController *)self dataSource];
  unsigned int v9 = [v8 showPageNumbers];

  uint64_t v10 = [(THFlowTOCViewController *)self configuration];
  [v10 cellHeight];
  double v12 = v11;

  double v13 = [(THFlowTOCViewController *)self configuration];
  unsigned int v54 = v9;
  if ([v13 pageNumberDynamicWidth])
  {
    double mMaxPageNumberWidth = self->mMaxPageNumberWidth;
    long long v15 = [(THFlowTOCViewController *)self configuration];
    [v15 pageNumberLeftMargin];
    double v17 = mMaxPageNumberWidth + v16;
  }
  else
  {
    long long v15 = [(THFlowTOCViewController *)self configuration];
    [v15 pageNumberWidth];
    double v17 = v18;
  }

  [v7 bounds];
  double v20 = v19;
  double v21 = [(THFlowTOCViewController *)self configuration];
  unsigned int v22 = [v21 constrainTableWidthToLegacyiPadWidth];

  double v23 = fmin(v20, 768.0);
  if (v22) {
    double v20 = v23;
  }
  double v24 = [v7 dequeueReusableCellWithIdentifier:@"TOCCellReuseIdentifier" forIndexPath:v6];

  [v24 setFrame:0.0, 0.0, v20, v12];
  double v25 = [(THFlowTOCViewController *)self configuration];
  [v24 updateConstraintsWithConfiguration:v25];

  double v26 = [(THFlowTOCViewController *)self theme];

  if (v26)
  {
    double v27 = [(THFlowTOCViewController *)self theme];
    uint64_t v28 = [v27 backgroundColorForTraitEnvironment:self];
    [v24 setBackgroundColor:v28];
  }
  if (!v24)
  {
    double v29 = +[TSUAssertionHandler currentHandler];
    double v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController tableView:cellForRowAtIndexPath:]");
    double v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v29 handleFailureInFunction:v30 file:v31 lineNumber:1167 description:@"invalid nil value for '%s'", "cell"];
  }
  v56 = v6;
  double v32 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v6];
  double v33 = [(THTOCViewController *)self dataSource];
  double v34 = [v33 toc:tileModelForChapterIndex:self, [v32 section]];

  v55 = v34;
  v35 = [v34 portraitEntries];
  v36 = [v35 objectAtIndex:[v32 row]];

  v37 = +[UIColor clearColor];
  v38 = -[THFlowTOCViewController labelFontForRow:](self, "labelFontForRow:", [v32 row]);
  v39 = [v24 ordinalLabel];
  [v39 setFont:v38];
  v40 = [(THFlowTOCViewController *)self ordinalTextColor];
  [v39 setTextColor:v40];

  [v39 setBackgroundColor:v37];
  v41 = [v36 sectionIdentifier];
  [v39 setText:v41];

  -[THFlowTOCViewController frameForOrdinalAtIndentLevel:](self, "frameForOrdinalAtIndentLevel:", [v36 indentLevel]);
  [v24 updateOrdinalLabelFrame:];
  v42 = [v24 rowLabel];
  [v42 setFont:v38];
  v43 = [(THFlowTOCViewController *)self chapterTitleColor];
  [v42 setTextColor:v43];

  [v42 setBackgroundColor:v37];
  v44 = [v36 title];
  [v42 setText:v44];

  if (v54)
  {
    v45 = [v24 pageNumberLabel];
    v46 = [(THFlowTOCViewController *)self pageNumberFont];
    [v45 setFont:v46];

    v47 = [(THFlowTOCViewController *)self pageNumberColor];
    [v45 setTextColor:v47];

    [v45 setBackgroundColor:v37];
    [v45 setTextAlignment:2];
    v48 = [(THFlowTOCViewController *)self p_displayPageNumberForTileEntry:v36];
    [v45 setText:v48];

    [v45 setHidden:0];
    [v24 updatePageNumberLabelWidth:v17];
  }
  v49 = [v24 openCloseButton];
  if ((uint64_t)[v36 indentLevel] > 1
    || -[THFlowTOCViewController numberOfSubentriesForIndex:inModel:](self, "numberOfSubentriesForIndex:inModel:", [v32 row], v55) < 1)
  {
    uint64_t v50 = 1;
  }
  else
  {
    [v49 setBackgroundColor:v37];
    if ([(THFlowTOCViewController *)self isSectionOpen:v56]) {
      [(THFlowTOCViewController *)self closeSectionImage];
    }
    else {
    v51 = [(THFlowTOCViewController *)self openSectionImage];
    }
    [v49 setImage:v51 forState:0];

    [v49 setTag:[v56 section]];
    [v49 addTarget:self action:"accessoryTapped:" forControlEvents:64];
    uint64_t v50 = 0;
  }
  [v49 setHidden:v50];
  v52 = [v24 activityIndicatorView];
  [v52 setHidden:1];

  [v24 setDelegate:self];
  [v24 setIndexPath:v56];
  [v24 updateBackgroundImage];

  return v24;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = [(THFlowTOCViewController *)self configuration];
  [v4 cellHeight];
  double v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if ((TSUPadUI() & 1) == 0)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v7];
    id v9 = [v8 row];
    uint64_t v10 = [(THFlowTOCViewController *)self theme];

    if (!v10)
    {
      if (v9) {
        +[UIColor bc_booksSecondaryBackground];
      }
      else {
      double v11 = +[UIColor bc_booksBackground];
      }
      [v12 setBackgroundColor:v11];
    }
  }
}

- (void)makeSectionOpen:(id)a3 withSender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v6];
  int64_t v9 = -[THFlowTOCViewController numberOfRowsInSection:](self, "numberOfRowsInSection:", [v6 section]);
  [(THFlowTOCViewController *)self setSectionOpenInUIState:1 forSection:v8];
  uint64_t v10 = [(THFlowTOCViewController *)self closeSectionImage];
  v43 = v7;
  [v7 setImage:v10 forState:0];

  v42 = (void *)v8;
  id obj = [(THFlowTOCViewController *)self subItemsForSection:v8];
  double v11 = (char *)[obj count];
  id v12 = [(NSMutableDictionary *)self->mModelToUIMap count];
  if (v12 != [(NSMutableDictionary *)self->mUIToModelMap count])
  {
    double v13 = +[TSUAssertionHandler currentHandler];
    double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]");
    long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:1301 description:@"MAPS CORRUPT"];
  }
  int64_t v16 = v9 - 1;
  v44 = v6;
  if (v9 - 1 >= (unint64_t)[v6 row] + 1)
  {
    while (1)
    {
      double v17 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v16, [v6 section]);
      double v18 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", &v11[v16], [v6 section]);
      uint64_t v19 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v17];
      if (!v19) {
        break;
      }
      double v20 = (void *)v19;
      [(NSMutableDictionary *)self->mUIToModelMap removeObjectForKey:v17];
      [(NSMutableDictionary *)self->mUIToModelMap setObject:v20 forKey:v18];
      [(NSMutableDictionary *)self->mModelToUIMap setObject:v18 forKey:v20];
      id v21 = [(NSMutableDictionary *)self->mModelToUIMap count];
      if (v21 != [(NSMutableDictionary *)self->mUIToModelMap count])
      {
        unsigned int v22 = +[TSUAssertionHandler currentHandler];
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]");
        v24 = double v23 = v11;
        double v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
        [v22 handleFailureInFunction:v24 file:v25 lineNumber:1319 description:@"MAPS CORRUPT"];

        double v11 = v23;
        id v6 = v44;
      }
      if (--v16 < (unint64_t)[v6 row] + 1) {
        goto LABEL_10;
      }
    }
  }
LABEL_10:
  id v26 = [(NSMutableDictionary *)self->mModelToUIMap count];
  if (v26 != [(NSMutableDictionary *)self->mUIToModelMap count])
  {
    double v27 = +[TSUAssertionHandler currentHandler];
    uint64_t v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]");
    double v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v27 handleFailureInFunction:v28 file:v29 lineNumber:1321 description:@"MAPS CORRUPT"];
  }
  double v30 = (char *)[v6 row];
  double v31 = +[NSMutableArray array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = obj;
  id v32 = [obja countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v33; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(obja);
        }
        v36 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v37 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)i + (void)v30 + 1, [v36 section]);
        [v31 addObject:v37];
        [(NSMutableDictionary *)self->mModelToUIMap setObject:v37 forKey:v36];
        [(NSMutableDictionary *)self->mUIToModelMap setObject:v36 forKey:v37];
        id v38 = [(NSMutableDictionary *)self->mModelToUIMap count];
        if (v38 != [(NSMutableDictionary *)self->mUIToModelMap count])
        {
          v39 = +[TSUAssertionHandler currentHandler];
          v40 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]");
          v41 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
          [v39 handleFailureInFunction:v40 file:v41 lineNumber:1334 description:@"MAPS CORRUPT"];
        }
      }
      id v33 = [obja countByEnumeratingWithState:&v47 objects:v51 count:16];
      double v30 = (char *)i + (void)v30;
    }
    while (v33);
  }

  [(TSWTableView *)self->mTOCTableView beginUpdates];
  [(TSWTableView *)self->mTOCTableView insertRowsAtIndexPaths:v31 withRowAnimation:3];
  [(TSWTableView *)self->mTOCTableView endUpdates];
}

- (void)makeSectionClosed:(id)a3 withSender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v6];
  int64_t v9 = [(THFlowTOCViewController *)self subItemsForSection:v8];
  unint64_t v44 = -[THFlowTOCViewController numberOfRowsInSection:](self, "numberOfRowsInSection:", [v6 section]);
  v42 = (void *)v8;
  [(THFlowTOCViewController *)self setSectionOpenInUIState:0 forSection:v8];
  uint64_t v10 = [(THFlowTOCViewController *)self openSectionImage];
  v43 = v7;
  [v7 setImage:v10 forState:0];

  [v6 row];
  double v11 = +[NSMutableArray array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v62 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = [(NSMutableDictionary *)self->mModelToUIMap objectForKey:*(void *)(*((void *)&v61 + 1) + 8 * i)];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v14);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v12;
  id v18 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v58;
    uint64_t v45 = *(void *)v58;
    do
    {
      id v21 = 0;
      id v46 = v19;
      do
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * (void)v21);
        if ([(THFlowTOCViewController *)self isSectionOpen:v22])
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          double v23 = [(THFlowTOCViewController *)self subItemsForSection:v22];
          id v24 = [v23 countByEnumeratingWithState:&v53 objects:v66 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v54;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v54 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = [(NSMutableDictionary *)self->mModelToUIMap objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * (void)j)];
                [v11 addObject:v28];
              }
              id v25 = [v23 countByEnumeratingWithState:&v53 objects:v66 count:16];
            }
            while (v25);
          }

          [(THFlowTOCViewController *)self setSectionOpenInUIState:0 forSection:v22];
          uint64_t v20 = v45;
          id v19 = v46;
        }
        id v21 = (char *)v21 + 1;
      }
      while (v21 != v19);
      id v19 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v19);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v29 = v11;
  id v30 = [v29 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v50;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * (void)k);
        v35 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v34];
        [(NSMutableDictionary *)self->mModelToUIMap removeObjectForKey:v35];
        [(NSMutableDictionary *)self->mUIToModelMap removeObjectForKey:v34];
      }
      id v31 = [v29 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }
    while (v31);
  }

  v36 = v6;
  if (v44 >= 2)
  {
    uint64_t v37 = 1;
    id v38 = &isPad_ptr;
    unsigned int v47 = 1;
    do
    {
      v39 = [v38[396] indexPathForRow:v37 inSection:[v36 section]];
      v40 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v39];
      if (v40)
      {
        v41 = [v38[396] indexPathForRow:v47 inSection:[v36 section]];
        [(NSMutableDictionary *)self->mUIToModelMap setObject:v40 forKey:v41];
        [(NSMutableDictionary *)self->mModelToUIMap setObject:v41 forKey:v40];
        if ([v39 compare:v41]) {
          [(NSMutableDictionary *)self->mUIToModelMap removeObjectForKey:v39];
        }
        ++v47;

        v36 = v6;
        id v38 = &isPad_ptr;
      }

      ++v37;
    }
    while (v44 != v37);
  }
  [(TSWTableView *)self->mTOCTableView beginUpdates];
  [(TSWTableView *)self->mTOCTableView deleteRowsAtIndexPaths:v29 withRowAnimation:3];
  [(TSWTableView *)self->mTOCTableView endUpdates];
}

- (void)accessoryTapped:(id)a3
{
  mTOCTableView = self->mTOCTableView;
  id v5 = a3;
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v5 superview];
  -[TSWTableView convertPoint:fromView:](mTOCTableView, "convertPoint:fromView:", v10, v7, v9);
  -[TSWTableView indexPathForRowAtPoint:](mTOCTableView, "indexPathForRowAtPoint:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  double v11 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v12];
  if ([(THFlowTOCViewController *)self isSectionOpen:v11]) {
    [(THFlowTOCViewController *)self makeSectionClosed:v12 withSender:v5];
  }
  else {
    [(THFlowTOCViewController *)self makeSectionOpen:v12 withSender:v5];
  }
}

- (void)p_showPageForModelLink:(id)a3
{
  id v4 = a3;
  id v5 = [(THTOCViewController *)self delegate];
  [v5 showPageForModelLink:v4 animated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  double v6 = (NSIndexPath *)a4;
  id v7 = a3;
  double v8 = [v7 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v8 animated:0];

  [v7 deselectRowAtIndexPath:self->mLastSelectedRow animated:0];
  id v18 = [(THFlowTOCViewController *)self findVisibleCellInTable:v7 forIndexPath:self->mLastSelectedRow];
  self->mSuppressLastSelectedRow = 1;
  mLastSelectedRow = self->mLastSelectedRow;
  self->mLastSelectedRow = v6;
  uint64_t v10 = v6;

  double v11 = [(THFlowTOCViewController *)self findVisibleCellInTable:v7 forIndexPath:self->mLastSelectedRow];

  [v18 updateBackgroundImage];
  [v11 updateBackgroundImage];
  [v11 startProgressIndicator];
  id v12 = [(NSMutableDictionary *)self->mUIToModelMap objectForKey:v10];
  id v13 = [(THTOCViewController *)self dataSource];
  id v14 = [v13 toc:self tileModelForChapterIndex:[v12 section]];

  uint64_t v15 = [v14 portraitEntries];
  int64_t v16 = [v15 objectAtIndex:[v12 row]];

  double v17 = [v16 modelLink];
  [(THFlowTOCViewController *)self performSelector:"p_showPageForModelLink:" withObject:v17 afterDelay:0.0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (self->mSuppressLastSelectedRow)
  {
    self->mSuppressLastSelectedRow = 0;
    id v4 = [(THFlowTOCViewController *)self findVisibleCellInTable:self->mTOCTableView forIndexPath:self->mLastSelectedRow];
    [v4 updateBackgroundImage];
  }
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(THFlowTOCViewController *)self isViewLoaded])
  {
    if (v4) {
      [(THFlowTOCViewController *)self p_updateMaxPageNumberWidth];
    }
    mTOCTableView = self->mTOCTableView;
    [(TSWTableView *)mTOCTableView reloadData];
  }
}

- (void)tableViewCellHighlightDidChange:(id)a3
{
  if ([a3 isHighlighted])
  {
    self->mSuppressLastSelectedRow = 1;
    id v4 = [(THFlowTOCViewController *)self findVisibleCellInTable:self->mTOCTableView forIndexPath:self->mLastSelectedRow];
    [v4 updateBackgroundImage];
  }
}

- (void)tableViewCell:(id)a3 hideSeparators:(BOOL)a4
{
  BOOL v4 = a4;
  mTOCTableView = self->mTOCTableView;
  id v6 = [(TSWTableView *)mTOCTableView indexPathForCell:a3];
  [(TSWTableView *)mTOCTableView setSeparatorsHidden:v4 forCellAtIndexPath:v6];
}

- (BOOL)tableViewCellShouldStayHighlighted:(id)a3
{
  BOOL v4 = [a3 indexPath];
  if ([v4 isEqual:self->mLastSelectedRow]) {
    BOOL v5 = !self->mSuppressLastSelectedRow;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)tableViewCellBackgroundColor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(THFlowTOCViewController *)self tableViewCellShouldStayHighlighted:v4];
  unsigned int v6 = [v4 isHighlighted];

  id v7 = +[UIColor clearColor];
  double v8 = [(THFlowTOCViewController *)self theme];

  int v9 = v6 | v5;
  if (v8)
  {
    uint64_t v10 = [(THFlowTOCViewController *)self theme];
    double v11 = v10;
    if (v9) {
      [v10 tableViewCellSelectedColor];
    }
    else {
    uint64_t v14 = [v10 backgroundColorForTraitEnvironment:self];
    }

    id v7 = (void *)v14;
    goto LABEL_9;
  }
  if (!v9) {
    goto LABEL_10;
  }
  if (v6)
  {
    double v12 = 0.882352941;
    double v13 = 0.929411765;
LABEL_15:
    +[UIColor colorWithRed:v12 green:v13 blue:1.0 alpha:1.0];
    v7 = double v11 = v7;
LABEL_9:

    goto LABEL_10;
  }
  if (v5)
  {
    double v12 = 0.929411765;
    double v13 = 0.956862745;
    goto LABEL_15;
  }
LABEL_10:

  return v7;
}

- (void)transitionWillFinish:(id)a3
{
  mTransitionView = (THTOCSplitTransitionView *)a3;
  double v8 = mTransitionView;
  if (self->mTransitionView != mTransitionView)
  {
    unsigned int v5 = +[TSUAssertionHandler currentHandler];
    unsigned int v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController transitionWillFinish:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:1584 description:@"unexpected transition view"];

    mTransitionView = self->mTransitionView;
  }
  if (![(THTOCSplitTransitionView *)mTransitionView wasReversed])
  {
    [(THTOCViewController *)self setForceStatusBarVisible:1];
    [(THFlowTOCViewController *)self refreshStatusBarAppearance];
  }
}

- (void)transitionDidFinish:(id)a3
{
  mTransitionView = (THTOCSplitTransitionView *)a3;
  uint64_t v20 = mTransitionView;
  if (self->mTransitionView != mTransitionView)
  {
    unsigned int v5 = +[TSUAssertionHandler currentHandler];
    unsigned int v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController transitionDidFinish:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:1594 description:@"unexpected transition view"];

    mTransitionView = self->mTransitionView;
  }
  if (![(THTOCSplitTransitionView *)mTransitionView wasReversed])
  {
    double v8 = [(THTOCViewController *)self delegate];
    [v8 TOCViewControllerDidShowChapter:self];

    int v9 = [(THTOCViewController *)self delegate];
    uint64_t v10 = [(THFlowTOCViewController *)self introMediaViewController];
    [v9 didTransitionFromViewController:v10 toTOCViewController:self];

    double v11 = [(THFlowTOCViewController *)self introMediaViewController];
    LODWORD(v10) = [v11 isPlaying];

    if (v10)
    {
      double v12 = [(THFlowTOCViewController *)self introMediaViewController];
      [v12 pause];
    }
    double v13 = [(THFlowTOCViewController *)self introMediaViewController];
    [v13 prepareControlsForTOC];

    uint64_t v14 = [(THFlowTOCViewController *)self introMediaViewController];
    [v14 prepareMovieForTOC];

    uint64_t v15 = [(THFlowTOCViewController *)self introMediaViewController];
    unsigned int v16 = [v15 isViewLoaded];

    if (v16)
    {
      double v17 = [(THFlowTOCViewController *)self introMediaViewController];
      id v18 = [v17 view];
      [v18 removeFromSuperview];
    }
    [(THFlowTOCViewController *)self setIntroMediaViewController:0];
  }
  id v19 = self->mTransitionView;
  self->mTransitionView = 0;
}

- (BOOL)closeButtonIsNeeded
{
  return 1;
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  self->mForceTransitionCompletion = 1;
  id v4 = [(THFlowTOCViewController *)self introMediaViewController];
  [v4 prepareControlsForTOC];

  if (!self->mTransitionView)
  {
    [(THFlowTOCViewController *)self p_setupTransitionView];
    mTransitionView = self->mTransitionView;
    if (!mTransitionView)
    {
      unsigned int v6 = +[TSUAssertionHandler currentHandler];
      id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController introMediaControllerShouldAdvancePast:]");
      double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
      [v6 handleFailureInFunction:v7 file:v8 lineNumber:1637 description:@"invalid nil value for '%s'", "mTransitionView"];

      mTransitionView = self->mTransitionView;
    }
    [(THTOCSplitTransitionView *)mTransitionView beginTransition];
  }
}

- (id)p_indexPathForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  if ((unint64_t)[(TSWTableView *)self->mTOCTableView numberOfSections] <= a3)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_indexPathForChapterIndex:lessonIndex:]");
    int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:1645 description:@"invalid chapter index"];
  }
  uint64_t v10 = +[NSIndexPath indexPathForRow:0 inSection:a3];
  if ([(THFlowTOCViewController *)self isSectionOpen:v10])
  {
    double v11 = [(THTOCViewController *)self dataSource];
    double v12 = [v11 toc:self tileModelForChapterIndex:a3];

    double v13 = [v12 portraitEntries];
    if ((unint64_t)[v13 count] <= a4)
    {
      uint64_t v14 = +[TSUAssertionHandler currentHandler];
      uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_indexPathForChapterIndex:lessonIndex:]");
      unsigned int v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
      [v14 handleFailureInFunction:v15 file:v16 lineNumber:1651 description:@"invalid lesson index"];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v13;
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v27;
LABEL_8:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v17);
        }
        v20 += [*(id *)(*((void *)&v26 + 1) + 8 * v23) includeInTOC];
        if (v21 + v23 + 1 >= a4) {
          break;
        }
        if (v19 == (id)++v23)
        {
          id v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          v21 += v23;
          if (v19) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v20 = 0;
    }

    uint64_t v24 = +[NSIndexPath indexPathForRow:v20 inSection:a3];

    uint64_t v10 = (void *)v24;
  }

  return v10;
}

- (id)p_cellForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  unsigned int v5 = [(THFlowTOCViewController *)self p_indexPathForChapterIndex:a3 lessonIndex:a4];
  objc_opt_class();
  unsigned int v6 = [(TSWTableView *)self->mTOCTableView cellForRowAtIndexPath:v5];
  id v7 = TSUDynamicCast();

  return v7;
}

- (double)bottomSeparatorYPositionForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  unsigned int v5 = [(THFlowTOCViewController *)self p_cellForChapterIndex:a3 lessonIndex:a4];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(THFlowTOCViewController *)self view];
  [v5 convertRect:v14 toView:v7];
  double MaxY = CGRectGetMaxY(v17);

  return MaxY;
}

- (void)scrollToRowForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  id v5 = [(THFlowTOCViewController *)self p_indexPathForChapterIndex:a3 lessonIndex:a4];
  [(TSWTableView *)self->mTOCTableView scrollToRowAtIndexPath:v5 atScrollPosition:2 animated:0];
}

- (id)rasterizedImage
{
  CATransform3DMakeTranslation(&v18, 10000.0, 10000.0, 0.0);
  double v3 = [(THFlowTOCViewController *)self introMediaViewController];
  id v4 = [v3 view];
  id v5 = [v4 layer];
  CATransform3D v17 = v18;
  [v5 setTransform:&v17];

  v16.receiver = self;
  v16.super_class = (Class)THFlowTOCViewController;
  double v6 = [(THFlowTOCViewController *)&v16 rasterizedImage];
  double v7 = [(THFlowTOCViewController *)self introMediaViewController];
  double v8 = [v7 view];
  double v9 = [v8 layer];
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m33;
  v15[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v15[5] = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m43;
  v15[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v15[7] = v11;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m13;
  v15[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v15[1] = v12;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m23;
  v15[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v15[3] = v13;
  [v9 setTransform:v15];

  return v6;
}

- (void)p_setupTransitionView
{
  if (self->mTransitionView)
  {
    double v3 = +[TSUAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_setupTransitionView]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:1706 description:@"expected nil value for '%s'", "mTransitionView"];
  }
  if (([(THFlowTOCViewController *)self isViewLoaded] & 1) == 0)
  {
    double v6 = +[TSUAssertionHandler currentHandler];
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_setupTransitionView]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:1707 description:@"THFlowTOCViewController view is not loaded"];
  }
  double v9 = [THTOCSplitTransitionView alloc];
  long long v10 = [(THFlowTOCViewController *)self view];
  [v10 bounds];
  long long v11 = -[THTOCSplitTransitionView initWithFrame:](v9, "initWithFrame:");
  mTransitionView = self->mTransitionView;
  self->mTransitionView = v11;

  [(THTransitionView *)self->mTransitionView setDelegate:self];
  long long v13 = [(THFlowTOCViewController *)self introMediaViewController];
  [(THTransitionView *)self->mTransitionView setFromViewController:v13];

  [(THTOCSplitTransitionView *)self->mTransitionView setKeepScaleAnimationView:1];
  uint64_t v14 = [(THFlowTOCViewController *)self introMediaViewController];
  uint64_t v15 = [v14 view];
  objc_super v16 = [v15 snapshotViewAfterScreenUpdates:0];
  [(THTOCSplitTransitionView *)self->mTransitionView setScaleAnimationView:v16];

  [(THTOCSplitTransitionView *)self->mTransitionView setKeepSplitAnimationView:1];
  CATransform3D v17 = [(TSWTableView *)self->mTOCTableView snapshotViewAfterScreenUpdates:0];
  [(THTOCSplitTransitionView *)self->mTransitionView setSplitAnimationView:v17];

  [(THTransitionView *)self->mTransitionView setToViewController:self];
  [(THTOCSplitTransitionView *)self->mTransitionView setReverse:1];
  [(THTOCSplitTransitionView *)self->mTransitionView slideAnimationScalar];
  [(THTOCSplitTransitionView *)self->mTransitionView setAnimationDuration:0.349999994 / v18];
  id v22 = [(THFlowTOCViewController *)self view];
  id v19 = [v22 superview];
  uint64_t v20 = self->mTransitionView;
  uint64_t v21 = [(THFlowTOCViewController *)self view];
  [v19 insertSubview:v20 aboveSubview:v21];
}

- (TSPData)headerImageData
{
  return self->mHeaderImageData;
}

- (void)setHeaderImageData:(id)a3
{
}

- (NSURL)zipPackage
{
  return self->mZipPackage;
}

- (void)setZipPackage:(id)a3
{
}

- (PFDContext)drmContext
{
  return self->mDrmContext;
}

- (void)setDrmContext:(id)a3
{
}

- (THiOSIntroMediaViewController)introMediaViewController
{
  return self->mIntroMediaViewController;
}

- (UIButton)backgroundButton
{
  return self->mBackgroundButton;
}

- (void)setBackgroundButton:(id)a3
{
}

- (UIImage)closeSectionImage
{
  return self->mCloseSectionImage;
}

- (void)setCloseSectionImage:(id)a3
{
}

- (UIImage)openSectionImage
{
  return self->mOpenSectionImage;
}

- (void)setOpenSectionImage:(id)a3
{
}

- (NSMutableDictionary)chapterUIState
{
  return self->mChapterUIState;
}

- (void)setChapterUIState:(id)a3
{
}

- (UIButton)headerImageViews
{
  return self->_headerImageViews;
}

- (void)setHeaderImageViews:(id)a3
{
}

- (THReflowablePaginationController)reflowablePaginationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reflowablePaginationController);

  return (THReflowablePaginationController *)WeakRetained;
}

- (BOOL)hasPaginatedData
{
  return self->_hasPaginatedData;
}

- (void)setHasPaginatedData:(BOOL)a3
{
  self->_hasPaginatedData = a3;
}

- (CGSize)headerMaxSize
{
  double width = self->_headerMaxSize.width;
  double height = self->_headerMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHeaderMaxSize:(CGSize)a3
{
  self->_headerMaxSize = a3;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_reflowablePaginationController);
  objc_storeStrong((id *)&self->_headerImageViews, 0);
  objc_storeStrong((id *)&self->mOpenSectionImage, 0);
  objc_storeStrong((id *)&self->mCloseSectionImage, 0);
  objc_storeStrong((id *)&self->mBackgroundButton, 0);
  objc_storeStrong((id *)&self->mDrmContext, 0);
  objc_storeStrong((id *)&self->mChapterUIState, 0);
  objc_storeStrong((id *)&self->mTransitionView, 0);
  objc_storeStrong((id *)&self->mLastSelectedRow, 0);
  objc_storeStrong((id *)&self->mIntroMediaViewController, 0);
  objc_storeStrong((id *)&self->mHeaderImageData, 0);
  objc_storeStrong((id *)&self->mZipPackage, 0);
  objc_storeStrong((id *)&self->mTableBottomFade, 0);
  objc_storeStrong((id *)&self->mTableTopFade, 0);
  objc_storeStrong((id *)&self->mUIToModelMap, 0);
  objc_storeStrong((id *)&self->mModelToUIMap, 0);
  objc_storeStrong((id *)&self->mTOCTableView, 0);

  objc_storeStrong((id *)&self->mHeaderView, 0);
}

@end