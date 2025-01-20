@interface BKPDFTOCViewController
- (BKPDFTOCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)changeIsUserDriven;
- (BOOL)isContentLoadPending;
- (BOOL)isContentLoaded;
- (BOOL)isReusable;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSDateFormatter)dateFormatter;
- (NSIndexPath)recenteredIndexPath;
- (PDFDocument)pdfDocument;
- (PDFOutline)currentOutline;
- (PDFOutline)pdfOutlineRoot;
- (UITableView)tableView;
- (double)calculateFontSize;
- (double)preferredFontSize;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)chapterForIndexPath:(id)a3;
- (id)fontFamily;
- (id)fontForChapter:(id)a3;
- (id)reuseIdentifier;
- (id)scrollView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)countRowsOfChildren:(id)a3;
- (int64_t)findOutlineForRow:(int64_t)a3 fromRowCount:(int64_t)a4 fromOutline:(id)a5;
- (int64_t)indentationLevelForChapter:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)ordinal;
- (int64_t)pageNumberFromChapter:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)pageIndexFromChapter:(id)a3;
- (void)_updateColors;
- (void)_updateContentInsets;
- (void)dealloc;
- (void)loadView;
- (void)releaseViews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBook:(id)a3;
- (void)setChangeIsUserDriven:(BOOL)a3;
- (void)setCurrentOutline:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setNeedsRestyle;
- (void)setPdfDocument:(id)a3;
- (void)setPdfOutlineRoot:(id)a3;
- (void)setPreferredFontSize:(double)a3;
- (void)setRecenteredIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTheme:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateView;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKPDFTOCViewController

- (BKPDFTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKPDFTOCViewController;
  v4 = [(BKTOCViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKPDFTOCViewController *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)releaseViews
{
  [(PDFOutline *)self->_currentOutline setDelegate:0];
  [(PDFOutline *)self->_currentOutline setDataSource:0];
  currentOutline = self->_currentOutline;
  self->_currentOutline = 0;

  [(BKPDFTOCViewController *)self setRecenteredIndexPath:0];
  v4.receiver = self;
  v4.super_class = (Class)BKPDFTOCViewController;
  [(BKTOCViewController *)&v4 releaseViews];
}

- (void)dealloc
{
  [(BKPDFTOCViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKPDFTOCViewController;
  [(BKTOCViewController *)&v3 dealloc];
}

- (void)setPdfDocument:(id)a3
{
  id v6 = a3;
  if (*(id *)&self->_preferredFontSize != v6)
  {
    objc_storeStrong((id *)&self->_preferredFontSize, a3);
    v5 = [v6 outlineRoot];
    [(BKPDFTOCViewController *)self setPdfOutlineRoot:v5];
  }
}

- (id)scrollView
{
  return self->_currentOutline;
}

- (void)loadView
{
  v45.receiver = self;
  v45.super_class = (Class)BKPDFTOCViewController;
  [(BKPDFTOCViewController *)&v45 loadView];
  objc_super v3 = [(BKPDFTOCViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = [(BKTOCViewController *)self isVertical];
  if (v12)
  {
    CGAffineTransformMakeRotation(&v44, -1.57079633);
    CGAffineTransform v43 = v44;
    [v3 setTransform:&v43];
  }
  v13 = [objc_alloc((Class)UITableView) initWithFrame:0 style:v5];
  currentOutline = self->_currentOutline;
  self->_currentOutline = v13;

  [(PDFOutline *)self->_currentOutline setClipsToBounds:v12];
  [(PDFOutline *)self->_currentOutline setDelegate:self];
  [(PDFOutline *)self->_currentOutline setDataSource:self];
  [(PDFOutline *)self->_currentOutline setSeparatorStyle:1];
  [(PDFOutline *)self->_currentOutline setTranslatesAutoresizingMaskIntoConstraints:0];
  id v42 = [objc_alloc((Class)UIView) initWithFrame:v5, v7, v9, 0.0];
  -[PDFOutline setTableFooterView:](self->_currentOutline, "setTableFooterView:");
  if ([(BKTOCViewController *)self isVertical])
  {
    [(BKTOCViewController *)self verticalCenteringInsets];
    double v16 = v15;
    [(BKTOCViewController *)self verticalCenteringInsets];
    -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", v16, 0.0, v17, 0.0);
    [(BKTOCViewController *)self centeringInsets];
    double v19 = -v18;
    v20 = self->_currentOutline;
    double v21 = 0.0;
  }
  else
  {
    [(BKTOCViewController *)self centeringInsets];
    double v23 = v22;
    [(BKTOCViewController *)self centeringInsets];
    -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", v23, 0.0);
    [(BKTOCViewController *)self centeringInsets];
    double v21 = -v24;
    v20 = self->_currentOutline;
    double v19 = 0.0;
  }
  -[PDFOutline setContentOffset:](v20, "setContentOffset:", v19, v21);
  [v3 addSubview:self->_currentOutline];
  v25 = [v3 safeAreaLayoutGuide];
  v40 = [(PDFOutline *)self->_currentOutline leadingAnchor];
  v41 = v25;
  v39 = [v25 leadingAnchor];
  v37 = [v40 constraintEqualToAnchor:v39];
  v46[0] = v37;
  v36 = [(PDFOutline *)self->_currentOutline trailingAnchor];
  v26 = [v25 trailingAnchor];
  v27 = [v36 constraintEqualToAnchor:v26];
  v46[1] = v27;
  v28 = [(PDFOutline *)self->_currentOutline topAnchor];
  v38 = v3;
  v29 = [v3 topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v46[2] = v30;
  v31 = [(PDFOutline *)self->_currentOutline bottomAnchor];
  v32 = [v3 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v46[3] = v33;
  v34 = +[NSArray arrayWithObjects:v46 count:4];
  +[NSLayoutConstraint activateConstraints:v34];

  v35 = +[NSNotificationCenter defaultCenter];
  [v35 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(BKPDFTOCViewController *)self _updateColors];
}

- (void)_updateContentInsets
{
  objc_super v3 = [(BKContentViewController *)self layoutDelegate];

  if (v3)
  {
    double v4 = [(BKContentViewController *)self layoutDelegate];
    [v4 edgeInsetsForContentViewController:self];
    -[BKContentViewController setContentInsets:](self, "setContentInsets:");

    id v5 = [(BKContentViewController *)self layoutDelegate];
    [v5 separatorInsetsForContentViewController:self];
    -[BKContentViewController setSeparatorInsets:](self, "setSeparatorInsets:");
  }
}

- (void)updateView
{
  if ([(BKPDFTOCViewController *)self isViewLoaded]
    && [(BKPDFTOCViewController *)self isVisible])
  {
    [(BKPDFTOCViewController *)self _updateContentInsets];
    [(PDFOutline *)self->_currentOutline contentInset];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    [(BKContentViewController *)self contentInsets];
    double v10 = v9;
    if ([(BKTOCViewController *)self isVertical])
    {
      [(BKContentViewController *)self contentInsets];
      double v12 = v11;
      [(BKContentViewController *)self contentInsets];
      double v14 = v13;
      double v15 = [(BKPDFTOCViewController *)self view];
      [v15 bounds];
      double v17 = v16;
      double v19 = v12 + v18;
      double v21 = v20 + 0.0;
      double v23 = v22 - (v12 + v14);

      [(PDFOutline *)self->_currentOutline contentSize];
      if (v24 > 0.0)
      {
        [(PDFOutline *)self->_currentOutline contentSize];
        double v26 = v25;
        v40.origin.x = v19;
        v40.origin.y = v21;
        v40.size.width = v23;
        v40.size.height = v17;
        if (v26 < CGRectGetHeight(v40))
        {
          v41.origin.x = v19;
          v41.origin.y = v21;
          v41.size.width = v23;
          v41.size.height = v17;
          double Height = CGRectGetHeight(v41);
          [(PDFOutline *)self->_currentOutline contentSize];
          -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", round(Height - v28), 0.0, 0.0, 0.0);
        }
      }
      -[PDFOutline setFrame:](self->_currentOutline, "setFrame:", v19, v21, v23, v17);
    }
    else
    {
      -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", v10, v4, v6, v8);
    }
    [(BKContentViewController *)self separatorInsets];
    -[PDFOutline setSeparatorInset:](self->_currentOutline, "setSeparatorInset:");
    v29 = [(BKPDFTOCViewController *)self view];
    id v38 = [v29 viewWithTag:9999];

    [v38 removeFromSuperview];
    [(PDFOutline *)self->_currentOutline setAlpha:1.0];
    v30 = [(PDFOutline *)self->_currentOutline tableFooterView];
    [v30 frame];
    double v32 = v31;
    double v34 = v33;

    [(PDFOutline *)self->_currentOutline frame];
    double v36 = v35;
    v37 = [(PDFOutline *)self->_currentOutline tableFooterView];
    [v37 setFrame:v32, v34, v36, 0.0];
  }
}

- (void)_updateColors
{
  id v8 = [(BKPDFTOCViewController *)self themePage];
  double v3 = [v8 backgroundColorForTraitEnvironment:self];
  double v4 = [(BKPDFTOCViewController *)self viewIfLoaded];
  [v4 setBackgroundColor:v3];

  double v5 = [(PDFOutline *)self->_currentOutline tableFooterView];
  [v5 setBackgroundColor:v3];

  [(PDFOutline *)self->_currentOutline setBackgroundColor:v3];
  double v6 = [(PDFOutline *)self->_currentOutline tableFooterView];
  [v6 setBackgroundColor:v3];

  double v7 = [v8 tableViewSeparatorColor];
  [(PDFOutline *)self->_currentOutline setSeparatorColor:v7];

  [(PDFOutline *)self->_currentOutline reloadData];
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFTOCViewController;
  [(BKTOCViewController *)&v4 setTheme:a3];
  [(BKPDFTOCViewController *)self _updateColors];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFTOCViewController;
  [(BKTOCViewController *)&v4 viewWillAppear:a3];
  [(BKPDFTOCViewController *)self updateView];
  [(BKTOCViewController *)self reload];
}

- (void)scrollViewDidScroll:(id)a3
{
  if ([(BKTOCViewController *)self isVertical])
  {
    id v4 = [(PDFOutline *)self->_currentOutline visibleCells];
    id v6 = [(PDFOutline *)self->_currentOutline indexPathsForVisibleRows];
    double v5 = [v6 lastObject];
    [(BKPDFTOCViewController *)self setRecenteredIndexPath:v5];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFTOCViewController;
  id v7 = a4;
  -[BKTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_A7E80;
  v8[3] = &unk_1DAA18;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewDidLayoutSubviews
{
  [(BKPDFTOCViewController *)self updateView];
  unsigned int v3 = [(BKTOCViewController *)self isVertical];
  currentOutline = self->_currentOutline;
  if (currentOutline)
  {
    if (v3)
    {
      [(PDFOutline *)currentOutline frame];
      double v5 = CGRectGetWidth(v13) + -8.0;
      id v6 = self->_currentOutline;
      double v7 = 0.0;
    }
    else
    {
      [(PDFOutline *)currentOutline contentInset];
      id v6 = self->_currentOutline;
      double v5 = 0.0;
    }
    -[PDFOutline setScrollIndicatorInsets:](v6, "setScrollIndicatorInsets:", v7, 0.0, 0.0, v5);
  }
  if (BYTE5(self->super._verticalCenteringInsets.right))
  {
    [(PDFOutline *)self->_currentOutline flashScrollIndicators];
    char v8 = 0;
  }
  else
  {
    char v8 = 1;
  }
  BYTE5(self->super._verticalCenteringInsets.right) = v8;
  if (!BYTE4(self->super._verticalCenteringInsets.right))
  {
    if (v3)
    {
      objc_super v9 = (char *)[(PDFOutline *)self->_currentOutline numberOfRowsInSection:0];
      if (v9) {
        BOOL v10 = v9 == (char *)0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        double v11 = +[NSIndexPath indexPathForRow:v9 - 1 inSection:0];
        [(PDFOutline *)self->_currentOutline scrollToRowAtIndexPath:v11 atScrollPosition:1 animated:0];
      }
    }
    BYTE4(self->super._verticalCenteringInsets.right) = 1;
  }
  v12.receiver = self;
  v12.super_class = (Class)BKPDFTOCViewController;
  [(BKPDFTOCViewController *)&v12 viewDidLayoutSubviews];
}

- (unint64_t)pageIndexFromChapter:(id)a3
{
  id v4 = [a3 destination];
  double v5 = [v4 page];
  id v6 = [(BKPDFTOCViewController *)self pdfDocument];
  id v7 = [v6 indexForPage:v5];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = (unint64_t)v7;
  }

  return v8;
}

- (int64_t)pageNumberFromChapter:(id)a3
{
  unint64_t v3 = [(BKPDFTOCViewController *)self pageIndexFromChapter:a3];

  return +[BKPDFModernBookViewController pageNumberForPageIndex:v3];
}

- (id)fontFamily
{
  v2 = +[UIFont systemFontOfSize:17.0];
  unint64_t v3 = [v2 familyName];

  return v3;
}

- (double)calculateFontSize
{
  [(BKPDFTOCViewController *)self preferredFontSize];
  if (v3 == 0.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKPDFTOCViewController;
    [(BKTOCViewController *)&v5 calculateFontSize];
  }
  else
  {
    [(BKPDFTOCViewController *)self preferredFontSize];
  }
  return result;
}

- (int64_t)indentationLevelForChapter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 parent];
  if (v5)
  {
    id v6 = (void *)v5;
    int64_t v7 = 0;
    unint64_t v8 = v4;
    while (1)
    {
      objc_super v9 = [v8 parent];
      BOOL v10 = [(BKPDFTOCViewController *)self pdfOutlineRoot];

      if (v9 == v10) {
        break;
      }
      ++v7;
      id v4 = [v8 parent];

      id v6 = [v4 parent];
      unint64_t v8 = v4;
      if (!v6) {
        goto LABEL_8;
      }
    }
    id v4 = v8;
  }
  else
  {
    int64_t v7 = 0;
  }
LABEL_8:

  return v7;
}

- (id)fontForChapter:(id)a3
{
  id v4 = a3;
  [(BKTOCViewController *)self establishChapterFonts];
  uint64_t v5 = [(BKPDFTOCViewController *)self indentationLevelForChapter:v4];

  if (v5 < 2) {
    [(BKTOCViewController *)self chapterTopLevelFont];
  }
  else {
  id v6 = [(BKTOCViewController *)self chapterSubLevelFont];
  }

  return v6;
}

- (id)chapterForIndexPath:(id)a3
{
  id v4 = [a3 row];
  uint64_t v5 = [(BKPDFTOCViewController *)self pdfOutlineRoot];
  [(BKPDFTOCViewController *)self findOutlineForRow:v4 fromRowCount:0 fromOutline:v5];

  return [(BKPDFTOCViewController *)self currentOutline];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)countRowsOfChildren:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0;
  if ([v4 numberOfChildren])
  {
    unint64_t v6 = 0;
    do
    {
      int64_t v7 = [v4 childAtIndex:v6];
      [v7 setIsOpen:1];
      if ([v7 numberOfChildren]) {
        uint64_t v8 = [(BKPDFTOCViewController *)self countRowsOfChildren:v7] + 1;
      }
      else {
        uint64_t v8 = 1;
      }
      v5 += v8;

      ++v6;
    }
    while (v6 < (unint64_t)[v4 numberOfChildren]);
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(BKPDFTOCViewController *)self pdfOutlineRoot];
  id v6 = [v5 numberOfChildren];

  int64_t v7 = 0;
  if (v6)
  {
    unint64_t v8 = 0;
    do
    {
      objc_super v9 = [(BKPDFTOCViewController *)self pdfOutlineRoot];
      BOOL v10 = [v9 childAtIndex:v8];

      [v10 setIsOpen:1];
      if ([v10 numberOfChildren]) {
        uint64_t v11 = [(BKPDFTOCViewController *)self countRowsOfChildren:v10] + 1;
      }
      else {
        uint64_t v11 = 1;
      }
      v7 += v11;

      ++v8;
      objc_super v12 = [(BKPDFTOCViewController *)self pdfOutlineRoot];
      id v13 = [v12 numberOfChildren];
    }
    while (v8 < (unint64_t)v13);
  }
  return v7;
}

- (id)reuseIdentifier
{
  return @"tocCell";
}

- (int64_t)findOutlineForRow:(int64_t)a3 fromRowCount:(int64_t)a4 fromOutline:(id)a5
{
  id v8 = a5;
  if ([v8 numberOfChildren])
  {
    uint64_t v9 = 0;
    while (1)
    {
      BOOL v10 = [v8 childAtIndex:v9];
      uint64_t v11 = v10;
      if (a4 == a3) {
        break;
      }
      ++a4;
      if ([v10 numberOfChildren])
      {
        if ([v11 isOpen])
        {
          a4 = [(BKPDFTOCViewController *)self findOutlineForRow:a3 fromRowCount:a4 fromOutline:v11];
          if (a4 < 0) {
            goto LABEL_10;
          }
        }
      }

      if (++v9 >= (unint64_t)[v8 numberOfChildren]) {
        goto LABEL_11;
      }
    }
    [(BKPDFTOCViewController *)self setCurrentOutline:v10];
LABEL_10:

    a4 = -1;
  }
LABEL_11:

  return a4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKPDFTOCViewController *)self reuseIdentifier];
  objc_opt_class();
  v57 = v6;
  uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:v8];
  BUDynamicCast();
  BOOL v10 = (BKPDFTOCTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v10) {
    BOOL v10 = [(BKTOCTableViewCell *)[BKPDFTOCTableViewCell alloc] initWithStyle:0 reuseIdentifier:v8];
  }
  v56 = v7;
  id v11 = [v7 row];
  objc_super v12 = [(BKPDFTOCViewController *)self pdfOutlineRoot];
  [(BKPDFTOCViewController *)self findOutlineForRow:v11 fromRowCount:0 fromOutline:v12];

  id v13 = [(BKPDFTOCViewController *)self currentOutline];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  double v14 = [(BKPDFTOCTableViewCell *)v10 contentView];
  double v15 = [v14 subviews];

  id v16 = [v15 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v63;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v20 removeFromSuperview];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v17);
  }

  [v13 setIsOpen:1];
  [(BKTOCTableViewCell *)v10 setVertical:[(BKTOCViewController *)self isVertical]];
  [(BKPDFTOCTableViewCell *)v10 setPdfChapter:v13];
  if ([(BKTOCViewController *)self isVertical])
  {
    CGAffineTransformMakeRotation(&v61, 1.57079633);
    double v21 = [(BKPDFTOCTableViewCell *)v10 textLabel];
    CGAffineTransform v60 = v61;
    [v21 setTransform:&v60];

    CGAffineTransformMakeRotation(&v59, 1.57079633);
    double v22 = [(BKTOCTableViewCell *)v10 pageLabel];
    CGAffineTransform v58 = v59;
    [v22 setTransform:&v58];

    [(BKPDFTOCTableViewCell *)v10 setSelectionStyle:2];
  }
  uint64_t v23 = [v13 label];
  double v24 = (void *)v23;
  double v25 = @" ";
  if (v23) {
    double v25 = (__CFString *)v23;
  }
  double v26 = v25;

  v27 = +[NSNumber numberWithInteger:[(BKPDFTOCViewController *)self pageNumberFromChapter:v13]];
  double v28 = +[NSString stringWithFormat:@"%@", v27];

  [(BKTOCTableViewCell *)v10 setupSelectedBackgroundNil];
  [(BKContentViewController *)self contentInsets];
  double v30 = v29;
  [(BKContentViewController *)self contentInsets];
  -[BKTOCTableViewCell setContentInsets:](v10, "setContentInsets:", 0.0, v30, 0.0);
  double v31 = [(BKPDFTOCTableViewCell *)v10 textLabel];
  [v31 setText:v26];

  double v32 = [(BKPDFTOCViewController *)self fontForChapter:v13];
  double v33 = [(BKPDFTOCTableViewCell *)v10 textLabel];
  [v33 setFont:v32];

  double v34 = [(BKPDFTOCTableViewCell *)v10 textLabel];
  [v34 setLineBreakMode:0];

  double v35 = [(BKPDFTOCTableViewCell *)v10 textLabel];
  [v35 setAlpha:1.0];

  double v36 = [(BKPDFTOCTableViewCell *)v10 textLabel];
  [v36 setNumberOfLines:0];

  [(BKPDFTOCTableViewCell *)v10 setIndentationLevel:[(BKPDFTOCViewController *)self indentationLevelForChapter:v13]];
  [(BKPDFTOCTableViewCell *)v10 setIndentationWidth:16.0];
  v37 = (char *)[(BKPDFTOCTableViewCell *)v10 effectiveUserInterfaceLayoutDirection];
  [(BKContentViewController *)self separatorInsets];
  double v39 = v38;
  double v40 = (double)(uint64_t)[(BKPDFTOCTableViewCell *)v10 indentationLevel];
  [(BKPDFTOCTableViewCell *)v10 indentationWidth];
  double v42 = v39 + v40 * v41;
  [(BKContentViewController *)self separatorInsets];
  double v44 = v43;
  if (v37 == (unsigned char *)&dword_0 + 1 || [(BKTOCViewController *)self isVertical])
  {
    double v45 = v42;
  }
  else
  {
    double v45 = v44;
    double v44 = v42;
  }
  -[BKPDFTOCTableViewCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, v44, 0.0, v45);
  v46 = [(BKTOCTableViewCell *)v10 pageLabel];
  v47 = v46;
  if (v28)
  {
    [v46 setText:v28];
    v48 = [(BKTOCViewController *)self pageLabelFont];
    [v47 setFont:v48];
  }
  [v47 setHidden:v28 == 0];
  [(BKPDFTOCTableViewCell *)v10 setNeedsLayout];
  v49 = [(BKPDFTOCViewController *)self themePage];
  [(BKTOCTableViewCell *)v10 configureSelectedBackgroundView];
  v50 = [(PDFOutline *)self->_currentOutline backgroundColor];
  [(BKPDFTOCTableViewCell *)v10 setBackgroundColor:v50];

  v51 = [v49 primaryTextColor];
  v52 = [(BKPDFTOCTableViewCell *)v10 textLabel];
  [v52 setTextColor:v51];

  v53 = [v49 tocPageNumberTextColor];
  v54 = [(BKTOCTableViewCell *)v10 pageLabel];
  [v54 setTextColor:v53];

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 52.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  [(PDFOutline *)self->_currentOutline bounds];
  double Width = CGRectGetWidth(v30);
  [(BKContentViewController *)self contentInsets];
  double v9 = Width - (v7 + v8);
  if (v9 <= 0.0)
  {
    double height = CGSizeZero.height;
  }
  else
  {
    BOOL v10 = [(BKPDFTOCViewController *)self chapterForIndexPath:v5];
    id v11 = [(BKPDFTOCViewController *)self fontForChapter:v10];
    objc_super v12 = [(BKTOCViewController *)self pageLabelFont];
    if ([(BKTOCViewController *)self isVertical])
    {
      NSAttributedStringKey v28 = NSFontAttributeName;
      double v29 = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      [@"8888" boundingRectWithSize:0 options:v13 attributes:0 context:1.79769313e308 1.79769313e308];
      double height = v14 + 15.0;
    }
    else
    {
      id v16 = +[NSNumber numberWithInteger:[(BKPDFTOCViewController *)self pageNumberFromChapter:v10]];
      id v17 = +[NSString stringWithFormat:@"%@", v16];

      uint64_t v18 = [v10 label];
      double v19 = (__CFString *)[v18 copy];
      double v20 = v19;
      double v21 = @" ";
      if (v19) {
        double v21 = v19;
      }
      double v22 = v21;

      uint64_t v23 = +[NSCharacterSet newlineCharacterSet];
      double v24 = [(__CFString *)v22 stringByTrimmingCharactersInSet:v23];

      +[BKTOCTableViewCell pageLabelFrameForString:font:bounds:layoutDirection:](BKTOCTableViewCell, "pageLabelFrameForString:font:bounds:layoutDirection:", v17, v12, [(BKViewController *)self layoutDirection], CGRectZero.origin.x, CGRectZero.origin.y, v9, 52.0);
      +[BKTOCTableViewCell cellHeightForCellWidth:v24 pageLabelWidth:[(BKPDFTOCViewController *)self indentationLevelForChapter:v10] text:v11 indentationLevel:0 indentationWidth:v9 font:v25 usesPopoverStyle:16.0];
      double height = v26;
    }
  }

  return fmax(ceil(height), 52.0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  [a3 cellForRowAtIndexPath:];
  if (BYTE4(self->super._fetchedResultsController))
  {
    double v7 = [(BKPDFTOCViewController *)self chapterForIndexPath:v10];
    double v8 = [[BKPageLocation alloc] initWithOrdinal:[(BKPDFTOCViewController *)self ordinal] andOffset:[(BKPDFTOCViewController *)self pageIndexFromChapter:v7]];
    double v9 = [(BKDirectoryContent *)self directoryDelegate];
    [v9 directoryContent:self didSelectLocation:v8];

    [v6 setSelected:0 animated:0];
    [v6 setSelectionStyle:0];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)isReusable
{
  return 0;
}

- (BOOL)isContentLoaded
{
  return 1;
}

- (BOOL)isContentLoadPending
{
  return 0;
}

- (void)setNeedsRestyle
{
  v7.receiver = self;
  v7.super_class = (Class)BKPDFTOCViewController;
  [(BKContentViewController *)&v7 setNeedsRestyle];
  if ([(BKTOCViewController *)self isVertical])
  {
    id v3 = [(PDFOutline *)self->_currentOutline visibleCells];
    id v4 = [(PDFOutline *)self->_currentOutline indexPathsForVisibleRows];
    id v5 = [v4 sortedArrayUsingSelector:"compare:"];
    id v6 = [v5 lastObject];
    [(BKPDFTOCViewController *)self setRecenteredIndexPath:v6];
  }
  [(BKTOCViewController *)self reload];
}

- (int64_t)ordinal
{
  return -101;
}

- (void)setBook:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKPDFTOCViewController;
  [(BKContentViewController *)&v3 setBook:a3];
}

- (NSIndexPath)recenteredIndexPath
{
  return *(NSIndexPath **)&self->_setInitialScrollPosition;
}

- (void)setRecenteredIndexPath:(id)a3
{
}

- (double)preferredFontSize
{
  return *(double *)&self->_changeIsUserDriven;
}

- (void)setPreferredFontSize:(double)a3
{
  *(double *)&self->_changeIsUserDriven = a3;
}

- (PDFDocument)pdfDocument
{
  return *(PDFDocument **)&self->_preferredFontSize;
}

- (PDFOutline)pdfOutlineRoot
{
  return (PDFOutline *)self->_pdfDocument;
}

- (void)setPdfOutlineRoot:(id)a3
{
}

- (PDFOutline)currentOutline
{
  return self->_pdfOutlineRoot;
}

- (void)setCurrentOutline:(id)a3
{
}

- (UITableView)tableView
{
  return (UITableView *)self->_currentOutline;
}

- (void)setTableView:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)self->_tableView;
}

- (void)setDateFormatter:(id)a3
{
}

- (BOOL)changeIsUserDriven
{
  return (BOOL)self->_recenteredIndexPath;
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  LOBYTE(self->_recenteredIndexPath) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentOutline, 0);
  objc_storeStrong((id *)&self->_pdfOutlineRoot, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_preferredFontSize, 0);

  objc_storeStrong((id *)&self->_setInitialScrollPosition, 0);
}

@end