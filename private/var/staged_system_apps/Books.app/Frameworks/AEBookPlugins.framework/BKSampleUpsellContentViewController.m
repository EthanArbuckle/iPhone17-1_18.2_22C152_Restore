@interface BKSampleUpsellContentViewController
- (BCBuyGetTwoStateButton)buyButton;
- (BCFutureValue)profileFuture;
- (BKSampleUpsellContentViewController)init;
- (BKUpsellBuyDelegate)buyDelegate;
- (BOOL)fixedLayout;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isCloud;
- (BOOL)isContentLoadPending;
- (BOOL)isContentLoaded;
- (BOOL)isDownloading;
- (BOOL)isLocal;
- (BOOL)isReusable;
- (BOOL)isSample;
- (BOOL)isStore;
- (BOOL)isUpsellContent;
- (BOOL)visibleInScrollMode;
- (BOOL)wasPreordered;
- (CGRect)cachedRectForAnnotation:(id)a3;
- (CGRect)cachedVisibleRectForAnnotation:(id)a3;
- (CGSize)contentSize;
- (NSLayoutConstraint)bookAuthorTopConstraint;
- (NSLayoutConstraint)bookTitleTopConstraint;
- (NSLayoutConstraint)bookTitleWidthConstraint;
- (NSLayoutConstraint)buyButtonTopConstraint;
- (UILabel)bookAuthorLabel;
- (UILabel)bookTitleLabel;
- (UILabel)continueLabel;
- (double)_calculateLineNumbersForLabel:(id)a3 withFont:(id)a4;
- (double)contentScale;
- (double)zoomScale;
- (id)currentLocation;
- (id)styleManager;
- (int64_t)pageOffset;
- (void)_didChangeStyle:(id)a3;
- (void)buyButton:(id)a3 initialBuy:(id)a4 completion:(id)a5;
- (void)configureWithProfile:(id)a3;
- (void)dealloc;
- (void)releaseViews;
- (void)setBookAuthorLabel:(id)a3;
- (void)setBookAuthorTopConstraint:(id)a3;
- (void)setBookTitleLabel:(id)a3;
- (void)setBookTitleTopConstraint:(id)a3;
- (void)setBookTitleWidthConstraint:(id)a3;
- (void)setBuyButton:(id)a3;
- (void)setBuyButtonTopConstraint:(id)a3;
- (void)setBuyDelegate:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContinueLabel:(id)a3;
- (void)setFixedLayout:(BOOL)a3;
- (void)setProfileFuture:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTheme:(id)a3 force:(BOOL)a4;
- (void)setVisibleInScrollMode:(BOOL)a3;
- (void)setZoomScale:(double)a3;
- (void)updateAppearance;
- (void)updateButtonAppearance;
- (void)updateFonts;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKSampleUpsellContentViewController

- (BKSampleUpsellContentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKSampleUpsellContentViewController;
  v2 = [(BKContentViewController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"reachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(BKSampleUpsellContentViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKContentViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  continueLabel = self->_continueLabel;
  self->_continueLabel = 0;

  bookTitleLabel = self->_bookTitleLabel;
  self->_bookTitleLabel = 0;

  bookAuthorLabel = self->_bookAuthorLabel;
  self->_bookAuthorLabel = 0;

  buyButton = self->_buyButton;
  self->_buyButton = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKContentViewController *)&v7 releaseViews];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKContentViewController *)&v28 viewDidLoad];
  v24 = [(BKSampleUpsellContentViewController *)self buyButton];
  [v24 setDelegate:self];
  objc_super v3 = [(BKSampleUpsellContentViewController *)self profileFuture];
  v23 = [v3 getNonBlockingError:0];

  [(BKSampleUpsellContentViewController *)self configureWithProfile:v23];
  objc_initWeak(&location, self);
  v4 = [(BKSampleUpsellContentViewController *)self profileFuture];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_327B4;
  v25[3] = &unk_1DB6D8;
  objc_copyWeak(&v26, &location);
  [v4 get:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  [(BKSampleUpsellContentViewController *)self updateAppearance];
  objc_super v5 = [(BKSampleUpsellContentViewController *)self view];
  v22 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  v21 = [v22 leadingAnchor];
  v20 = [v5 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:45.0];
  v29[0] = v19;
  v18 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  v17 = [v18 trailingAnchor];
  v16 = [v5 trailingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 constant:-45.0];
  v29[1] = v15;
  v6 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  objc_super v7 = [v6 leadingAnchor];
  v8 = [v5 leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:45.0];
  v29[2] = v9;
  v10 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  v11 = [v10 trailingAnchor];
  v12 = [v5 trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:-45.0];
  v29[3] = v13;
  v14 = +[NSArray arrayWithObjects:v29 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKSampleUpsellContentViewController *)&v9 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = BKStyleManagerDidChangeStyleNotification[0];
  v6 = [(BKSampleUpsellContentViewController *)self styleManager];
  [v4 addObserver:self selector:"_didChangeStyle:" name:v5 object:v6];

  [(BKSampleUpsellContentViewController *)self updateFonts];
  [(BKSampleUpsellContentViewController *)self updateAppearance];
  objc_super v7 = [(BKSampleUpsellContentViewController *)self view];
  [v7 layoutIfNeeded];

  [(BKSampleUpsellContentViewController *)self updateButtonAppearance];
  v8 = [(BKSampleUpsellContentViewController *)self buyButton];
  [v8 resetButtonState];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKSampleUpsellContentViewController *)&v3 viewDidLayoutSubviews];
  [(BKSampleUpsellContentViewController *)self updateButtonAppearance];
}

- (void)updateButtonAppearance
{
  id v8 = [(BKSampleUpsellContentViewController *)self buyButton];
  [(BKSampleUpsellContentViewController *)self contentScale];
  double v4 = 40.0;
  double v5 = v3 * 40.0;
  BOOL v6 = v3 <= 0.0;
  if (v3 <= 0.0) {
    double v7 = 12.0;
  }
  else {
    double v7 = v3 * 12.0;
  }
  if (!v6) {
    double v4 = v5;
  }
  [v8 setContentEdgeInsets:v7, v4, v7, v4];
}

- (void)updateViewConstraints
{
  v31.receiver = self;
  v31.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKSampleUpsellContentViewController *)&v31 updateViewConstraints];
  double v3 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  double v4 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  double v5 = [v4 font];
  [(BKSampleUpsellContentViewController *)self _calculateLineNumbersForLabel:v3 withFont:v5];
  double v7 = v6;

  id v8 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  objc_super v9 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  v10 = [v9 font];
  [(BKSampleUpsellContentViewController *)self _calculateLineNumbersForLabel:v8 withFont:v10];
  double v12 = v11;

  if (![(BKSampleUpsellContentViewController *)self im_isCompactWidth])
  {
    v19 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
    if (v12 >= (double)(uint64_t)[v19 numberOfLines])
    {
      v20 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
      BOOL v21 = v7 >= (double)(uint64_t)[v20 numberOfLines];

      if (v21) {
        double v17 = 4.0;
      }
      else {
        double v17 = 12.0;
      }
      if (v21) {
        double v18 = 6.0;
      }
      else {
        double v18 = 28.0;
      }
      goto LABEL_30;
    }

    goto LABEL_12;
  }
  if (![(BKSampleUpsellContentViewController *)self im_isCompactHeight])
  {
LABEL_12:
    double v18 = 28.0;
    double v17 = 12.0;
    goto LABEL_30;
  }
  v13 = +[UIDevice currentDevice];
  v14 = (char *)[v13 orientation] - 1;

  v15 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v16 = [v15 hasSpreadPagesForContentViewController:self];
    if (v16) {
      double v17 = 10.0;
    }
    else {
      double v17 = 12.0;
    }
    if (v16) {
      double v18 = 14.0;
    }
    else {
      double v18 = 28.0;
    }
  }
  else
  {
    double v18 = 28.0;
    double v17 = 12.0;
  }
  if ((unint64_t)v14 >= 2)
  {
    v22 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
    if (v12 >= (double)(uint64_t)[v22 numberOfLines])
    {
      v23 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
      BOOL v24 = v7 >= (double)(uint64_t)[v23 numberOfLines];

      if (v24) {
        double v17 = 4.0;
      }
      else {
        double v17 = 10.0;
      }
      if (v24) {
        double v18 = 6.0;
      }
      else {
        double v18 = 14.0;
      }
    }
    else
    {

      double v18 = 14.0;
      double v17 = 10.0;
    }
  }

LABEL_30:
  [(BKSampleUpsellContentViewController *)self contentScale];
  if (v25 <= 0.0) {
    double v25 = 1.0;
  }
  double v26 = v17 * v25;
  double v27 = v18 * v25;
  objc_super v28 = [(BKSampleUpsellContentViewController *)self bookTitleTopConstraint];
  [v28 setConstant:v27];

  v29 = [(BKSampleUpsellContentViewController *)self bookAuthorTopConstraint];
  [v29 setConstant:v26];

  v30 = [(BKSampleUpsellContentViewController *)self buyButtonTopConstraint];
  [v30 setConstant:v27];
}

- (double)_calculateLineNumbersForLabel:(id)a3 withFont:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 text];
  [v6 frame];
  double v9 = v8;

  NSAttributedStringKey v17 = NSFontAttributeName;
  id v18 = v5;
  v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v7 boundingRectWithSize:1 options:v10 attributes:0 context:v9];
  double v12 = v11;

  [v5 lineHeight];
  double v14 = v13;

  float v15 = v12 / v14;
  return ceilf(v15);
}

- (id)styleManager
{
  v2 = [(BKContentViewController *)self book];
  double v3 = [v2 styleManager];

  return v3;
}

- (void)updateFonts
{
  double v3 = 1.0;
  if (![(BKSampleUpsellContentViewController *)self fixedLayout])
  {
    double v4 = [(BKSampleUpsellContentViewController *)self styleManager];
    [v4 fontSize];
    float v6 = v5;

    if (v6 > 0.0)
    {
      unsigned __int8 v7 = [(BKSampleUpsellContentViewController *)self im_isCompactWidth];
      LODWORD(v8) = 1.25;
      if ((v7 & 1) == 0)
      {
        unsigned int v9 = [(BKSampleUpsellContentViewController *)self im_isCompactHeight];
        LODWORD(v8) = 1.5;
        if (v9) {
          *(float *)&double v8 = 1.25;
        }
      }
      float v10 = fmaxf(v6, 0.1);
      if (*(float *)&v8 > v10) {
        *(float *)&double v8 = v10;
      }
      double v3 = *(float *)&v8;
    }
  }
  [(BKSampleUpsellContentViewController *)self contentScale];
  if (v11 <= 0.0) {
    double v11 = 1.0;
  }
  double v12 = v3 * v11;
  id v41 = [(BKSampleUpsellContentViewController *)self continueLabel];
  double v13 = +[UIFont systemFontOfSize:v12 * 13.0];
  [v41 setFont:v13];

  double v14 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  float v15 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  unsigned int v16 = +[TUIFontSpec fontSpecWithPostscriptName:@"BooksSerif-Heavy" size:v12 * 26.0];
  NSAttributedStringKey v17 = [v16 font];
  [v14 setFont:v17];

  id v18 = +[UIFont systemFontOfSize:v12 * 18.0];
  [v15 setFont:v18];

  v19 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  v20 = +[TUIFontSpec fontSpecWithPostscriptName:@"BooksSerif-Heavy" size:v12 * 26.0];
  BOOL v21 = [v20 font];
  [(BKSampleUpsellContentViewController *)self _calculateLineNumbersForLabel:v19 withFont:v21];
  double v23 = v22;

  BOOL v24 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  double v25 = +[UIFont systemFontOfSize:v12 * 18.0];
  [(BKSampleUpsellContentViewController *)self _calculateLineNumbersForLabel:v24 withFont:v25];
  double v27 = v26;

  objc_super v28 = +[UIDevice currentDevice];
  v29 = (char *)[v28 orientation];

  v30 = [(BKContentViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v30 hasSpreadPagesForContentViewController:self] & 1) != 0)
  {
    double v31 = 16.0;
    double v32 = 24.0;
LABEL_18:
    v36 = +[TUIFontSpec fontSpecWithPostscriptName:@"BooksSerif-Heavy" size:v12 * v32];
    v37 = [v36 font];
    [v14 setFont:v37];

    v33 = +[UIFont systemFontOfSize:v12 * v31];
    [v15 setFont:v33];
    goto LABEL_19;
  }
  v33 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  if (v23 < (double)(uint64_t)[v33 numberOfLines])
  {
LABEL_19:

    goto LABEL_20;
  }
  v34 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  double v35 = (double)(uint64_t)[v34 numberOfLines];

  if (v27 >= v35 && (unint64_t)(v29 - 1) >= 2)
  {
    double v31 = 14.0;
    double v32 = 20.0;
    goto LABEL_18;
  }
LABEL_20:
  v38 = [(BKSampleUpsellContentViewController *)self buyButton];
  v39 = +[UIFont boldSystemFontOfSize:v12 * 15.0];
  [v38 setButtonFont:v39];

  v40 = [(BKSampleUpsellContentViewController *)self view];
  [v40 setNeedsUpdateConstraints];
}

- (void)_didChangeStyle:(id)a3
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  [(BKSampleUpsellContentViewController *)self updateFonts];
  double v4 = [(BKSampleUpsellContentViewController *)self view];
  [v4 layoutIfNeeded];

  [(BKSampleUpsellContentViewController *)self updateButtonAppearance];
}

- (void)updateAppearance
{
  if ([(BKSampleUpsellContentViewController *)self isViewLoaded])
  {
    id v29 = [(BKSampleUpsellContentViewController *)self themePage];
    double v3 = [v29 backgroundColorForTraitEnvironment:self];
    double v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = +[UIColor whiteColor];
    }
    float v6 = v5;

    unsigned __int8 v7 = [(BKSampleUpsellContentViewController *)self view];
    [v7 setBackgroundColor:v6];

    double v8 = [v29 contentTextColor];
    unsigned int v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = +[UIColor blackColor];
    }
    double v11 = v10;

    double v12 = [(BKSampleUpsellContentViewController *)self continueLabel];
    [v12 setTextColor:v11];

    double v13 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
    [v13 setTextColor:v11];

    double v14 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
    [v14 setTextColor:v11];

    float v15 = [(BKSampleUpsellContentViewController *)self buyButton];
    unsigned int v16 = [v29 finishedButtonBackgroundColor];
    NSAttributedStringKey v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = +[UIColor blackColor];
    }
    v19 = v18;

    [v15 setBackgroundFillColor:v19];
    v20 = [v29 finishedButtonDisabledBackgroundColor];
    BOOL v21 = [v20 colorWithAlphaComponent:0.4];
    [v15 setDisabledBackgroundFillColor:v21];

    [v15 setFrameColor:v19];
    double v22 = +[UIColor whiteColor];
    [v15 setTextColor:v22];

    double v23 = +[UIColor whiteColor];
    BOOL v24 = [v23 colorWithAlphaComponent:0.4];
    [v15 setDisabledTextColor:v24];

    [v15 setTextHilightColor:v19];
    [v15 setBackgroundFillHighlightColor:v6];
    double v25 = [v29 buyButtonColor];
    double v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = +[UIColor bc_booksGreen];
    }
    objc_super v28 = v27;

    [v15 setBuyStateTextColor:v28];
    [v15 setBuyStateBackgroundFillColor:v6];
    [v15 setBuyStateFrameColor:v28];
    [v15 setFrameWidth:0.0];
    [v15 updateButton];
  }
}

- (void)setTheme:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSampleUpsellContentViewController *)self theme];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKSampleUpsellContentViewController;
    [(BKContentViewController *)&v7 setTheme:v4];
    [(BKSampleUpsellContentViewController *)self updateAppearance];
  }
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKSampleUpsellContentViewController;
  [(BKContentViewController *)&v5 setTheme:a3 force:a4];
  [(BKSampleUpsellContentViewController *)self updateAppearance];
}

- (void)setContentScale:(double)a3
{
  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    [(BKSampleUpsellContentViewController *)self updateFonts];
    id v4 = [(BKSampleUpsellContentViewController *)self view];
    [v4 layoutIfNeeded];

    [(BKSampleUpsellContentViewController *)self updateButtonAppearance];
  }
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

- (BOOL)isUpsellContent
{
  return 1;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  return 0;
}

- (CGRect)cachedRectForAnnotation:(id)a3
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

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
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

- (int64_t)pageOffset
{
  return 0;
}

- (id)currentLocation
{
  v2 = [[BKLocation alloc] initWithOrdinal:[(BKContentViewController *)self ordinal]];

  return v2;
}

- (void)configureWithProfile:(id)a3
{
  id v12 = a3;
  objc_super v5 = [v12 title];
  unsigned __int8 v6 = v5;
  if (!v5)
  {
    double v3 = [(BKContentViewController *)self book];
    unsigned __int8 v6 = [v3 bookTitle];
  }
  objc_super v7 = [(BKSampleUpsellContentViewController *)self bookTitleLabel];
  [v7 setText:v6];

  if (!v5)
  {
  }
  double v8 = [v12 author];
  unsigned int v9 = v8;
  if (!v8)
  {
    double v3 = [(BKContentViewController *)self book];
    unsigned int v9 = [v3 bookAuthor];
  }
  id v10 = [(BKSampleUpsellContentViewController *)self bookAuthorLabel];
  [v10 setText:v9];

  if (!v8)
  {
  }
  double v11 = [(BKSampleUpsellContentViewController *)self buyButton];
  [v11 setProductProfile:v12];
}

- (void)buyButton:(id)a3 initialBuy:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = [(BKSampleUpsellContentViewController *)self buyDelegate];
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_33A3C;
    v12[3] = &unk_1DB700;
    id v13 = v7;
    id v14 = v8;
    [v9 buyWithCompletion:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v8);
    double v11 = v10;
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (BOOL)isStore
{
  return 1;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isDownloading
{
  return 0;
}

- (BOOL)isCloud
{
  return 0;
}

- (BOOL)isSample
{
  return 1;
}

- (BOOL)isAudiobook
{
  return 0;
}

- (BOOL)wasPreordered
{
  v2 = [(BKContentViewController *)self book];
  double v3 = [v2 isPreorder];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (CGSize)contentSize
{
  double width = self->contentSize.width;
  double height = self->contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->contentSize = a3;
}

- (double)zoomScale
{
  return self->zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->zoomScale = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (BOOL)fixedLayout
{
  return self->_fixedLayout;
}

- (void)setFixedLayout:(BOOL)a3
{
  self->_fixedLayout = a3;
}

- (BOOL)visibleInScrollMode
{
  return self->visibleInScrollMode;
}

- (void)setVisibleInScrollMode:(BOOL)a3
{
  self->visibleInScrollMode = a3;
}

- (UILabel)continueLabel
{
  return self->_continueLabel;
}

- (void)setContinueLabel:(id)a3
{
}

- (UILabel)bookTitleLabel
{
  return self->_bookTitleLabel;
}

- (void)setBookTitleLabel:(id)a3
{
}

- (UILabel)bookAuthorLabel
{
  return self->_bookAuthorLabel;
}

- (void)setBookAuthorLabel:(id)a3
{
}

- (BCBuyGetTwoStateButton)buyButton
{
  return self->_buyButton;
}

- (void)setBuyButton:(id)a3
{
}

- (NSLayoutConstraint)bookTitleWidthConstraint
{
  return self->_bookTitleWidthConstraint;
}

- (void)setBookTitleWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)bookTitleTopConstraint
{
  return self->_bookTitleTopConstraint;
}

- (void)setBookTitleTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bookAuthorTopConstraint
{
  return self->_bookAuthorTopConstraint;
}

- (void)setBookAuthorTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)buyButtonTopConstraint
{
  return self->_buyButtonTopConstraint;
}

- (void)setBuyButtonTopConstraint:(id)a3
{
}

- (BKUpsellBuyDelegate)buyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buyDelegate);

  return (BKUpsellBuyDelegate *)WeakRetained;
}

- (void)setBuyDelegate:(id)a3
{
}

- (BCFutureValue)profileFuture
{
  return self->_profileFuture;
}

- (void)setProfileFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileFuture, 0);
  objc_destroyWeak((id *)&self->_buyDelegate);
  objc_storeStrong((id *)&self->_buyButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_bookAuthorTopConstraint, 0);
  objc_storeStrong((id *)&self->_bookTitleTopConstraint, 0);
  objc_storeStrong((id *)&self->_bookTitleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_buyButton, 0);
  objc_storeStrong((id *)&self->_bookAuthorLabel, 0);
  objc_storeStrong((id *)&self->_bookTitleLabel, 0);

  objc_storeStrong((id *)&self->_continueLabel, 0);
}

@end