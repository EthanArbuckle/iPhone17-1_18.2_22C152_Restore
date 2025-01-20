@interface BKFinishedContentViewController
- (BKFinishedButton)finishedButton;
- (BKFinishedContentViewController)init;
- (BKFinishedContentViewController)initWithCoder:(id)a3;
- (BKFinishedContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)fixedLayout;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isContentLoadPending;
- (BOOL)isContentLoaded;
- (BOOL)isReusable;
- (BOOL)isUpsellContent;
- (BOOL)visibleInScrollMode;
- (CGRect)cachedRectForAnnotation:(id)a3;
- (CGRect)cachedVisibleRectForAnnotation:(id)a3;
- (CGSize)contentSize;
- (NSLayoutConstraint)bodyLeadingConstraint;
- (NSLayoutConstraint)bodyTopConstraint;
- (NSLayoutConstraint)bodyTrailingConstraint;
- (NSLayoutConstraint)bodyWidthConstraint;
- (NSLayoutConstraint)checkmarkHeightConstraint;
- (NSLayoutConstraint)checkmarkTopConstraint;
- (NSLayoutConstraint)checkmarkWidthConstraint;
- (NSLayoutConstraint)finishedButtonBottomConstraint;
- (NSLayoutConstraint)finishedButtonLeadingConstraint;
- (NSLayoutConstraint)finishedButtonTopConstraint;
- (NSLayoutConstraint)finishedButtonTrailingConstraint;
- (NSLayoutConstraint)titleLeadingConstraint;
- (NSLayoutConstraint)titleTopConstraint;
- (NSLayoutConstraint)titleTrailingConstraint;
- (NSLayoutConstraint)titleWidthConstraint;
- (UIImageView)checkmarkImageView;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (double)contentScale;
- (double)zoomScale;
- (id)currentLocation;
- (id)styleManager;
- (int64_t)pageOffset;
- (void)_didChangeStyle:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)dealloc;
- (void)finishedPressed:(id)a3;
- (void)releaseViews;
- (void)setBodyLabel:(id)a3;
- (void)setBodyLeadingConstraint:(id)a3;
- (void)setBodyTopConstraint:(id)a3;
- (void)setBodyTrailingConstraint:(id)a3;
- (void)setBodyWidthConstraint:(id)a3;
- (void)setCheckmarkHeightConstraint:(id)a3;
- (void)setCheckmarkImageView:(id)a3;
- (void)setCheckmarkTopConstraint:(id)a3;
- (void)setCheckmarkWidthConstraint:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setFinishedButton:(id)a3;
- (void)setFinishedButtonBottomConstraint:(id)a3;
- (void)setFinishedButtonLeadingConstraint:(id)a3;
- (void)setFinishedButtonTopConstraint:(id)a3;
- (void)setFinishedButtonTrailingConstraint:(id)a3;
- (void)setFixedLayout:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setTheme:(id)a3 force:(BOOL)a4;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLeadingConstraint:(id)a3;
- (void)setTitleTopConstraint:(id)a3;
- (void)setTitleTrailingConstraint:(id)a3;
- (void)setTitleWidthConstraint:(id)a3;
- (void)setVisibleInScrollMode:(BOOL)a3;
- (void)setZoomScale:(double)a3;
- (void)updateAppearance;
- (void)updateButtonAppearance;
- (void)updateButtonTitle;
- (void)updateFonts;
- (void)updateViewConstraints;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BKFinishedContentViewController

- (BKFinishedContentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKFinishedContentViewController;
  v2 = [(BKContentViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    sub_74C24(v2);
  }
  return v3;
}

- (BKFinishedContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKFinishedContentViewController;
  v4 = [(BKViewController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    sub_74C24(v4);
  }
  return v5;
}

- (BKFinishedContentViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKFinishedContentViewController;
  v3 = [(BKFinishedContentViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    sub_74C24(v3);
  }
  return v4;
}

- (void)dealloc
{
  [(BKFinishedContentViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKFinishedContentViewController;
  [(BKContentViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  checkmarkImageView = self->_checkmarkImageView;
  self->_checkmarkImageView = 0;

  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = 0;

  finishedButton = self->_finishedButton;
  self->_finishedButton = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKFinishedContentViewController;
  [(BKContentViewController *)&v7 releaseViews];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)BKFinishedContentViewController;
  [(BKContentViewController *)&v6 viewDidLoad];
  objc_super v3 = +[UIImageSymbolConfiguration configurationWithPointSize:103.0];
  v4 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:v3];
  objc_super v5 = [(BKFinishedContentViewController *)self checkmarkImageView];
  [v5 setImage:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)BKFinishedContentViewController;
  [(BKFinishedContentViewController *)&v26 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = BKStyleManagerDidChangeStyleNotification[0];
  objc_super v6 = [(BKFinishedContentViewController *)self styleManager];
  [v4 addObserver:self selector:"_didChangeStyle:" name:v5 object:v6];

  [(BKFinishedContentViewController *)self updateFonts];
  [(BKFinishedContentViewController *)self updateAppearance];
  objc_super v7 = [(BKFinishedContentViewController *)self view];
  [v7 layoutIfNeeded];

  [(BKFinishedContentViewController *)self updateButtonAppearance];
  v8 = [(BKFinishedContentViewController *)self view];
  v25 = [(BKFinishedContentViewController *)self bodyLabel];
  v24 = [v25 leadingAnchor];
  v23 = [v8 leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:45.0];
  v27[0] = v22;
  v21 = [(BKFinishedContentViewController *)self bodyLabel];
  v20 = [v21 trailingAnchor];
  v19 = [v8 trailingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:-45.0];
  v27[1] = v18;
  v9 = [(BKFinishedContentViewController *)self titleLabel];
  v10 = [v9 leadingAnchor];
  v11 = [v8 leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:45.0];
  v27[2] = v12;
  v13 = [(BKFinishedContentViewController *)self titleLabel];
  v14 = [v13 trailingAnchor];
  v15 = [v8 trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:-45.0];
  v27[3] = v16;
  v17 = +[NSArray arrayWithObjects:v27 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKFinishedContentViewController;
  [(BKContentViewController *)&v7 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = BKStyleManagerDidChangeStyleNotification[0];
  objc_super v6 = [(BKFinishedContentViewController *)self styleManager];
  [v4 removeObserver:self name:v5 object:v6];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKFinishedContentViewController;
  [(BKFinishedContentViewController *)&v3 viewWillLayoutSubviews];
  [(BKFinishedContentViewController *)self updateButtonTitle];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKFinishedContentViewController;
  [(BKFinishedContentViewController *)&v3 viewDidLayoutSubviews];
  [(BKFinishedContentViewController *)self updateButtonAppearance];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
}

- (void)finishedPressed:(id)a3
{
  id v6 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [(BKContentViewController *)self book];
    objc_super v5 = [v4 assetID];

    [v6 contentViewController:self setFinishedAndCloseForAssetID:v5];
  }
}

- (void)updateButtonTitle
{
  unsigned int v3 = [(BKFinishedContentViewController *)self im_isCompactWidth];
  v4 = AEBundle();
  objc_super v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Finished";
  }
  else {
    CFStringRef v6 = @"Mark as Finished";
  }
  id v8 = [v4 localizedStringForKey:v6 value:&stru_1DF0D8 table:0];

  objc_super v7 = [(BKFinishedContentViewController *)self finishedButton];
  [v7 setTitle:v8 forState:0];
}

- (void)updateButtonAppearance
{
  id v10 = [(BKFinishedContentViewController *)self finishedButton];
  [(BKFinishedContentViewController *)self contentScale];
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
  [v10 setContentEdgeInsets:v7, v4, v7, v4];
  [v10 frame];
  CGFloat v8 = CGRectGetHeight(v12) * 0.5;
  v9 = [v10 layer];
  [v9 setCornerRadius:v8];
}

- (void)updateViewConstraints
{
  v39.receiver = self;
  v39.super_class = (Class)BKFinishedContentViewController;
  [(BKFinishedContentViewController *)&v39 updateViewConstraints];
  double v3 = [(BKFinishedContentViewController *)self traitCollection];
  double v4 = (char *)[v3 horizontalSizeClass];

  double v5 = [(BKFinishedContentViewController *)self traitCollection];
  BOOL v6 = (char *)[v5 verticalSizeClass];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    if (v6 == (unsigned char *)&dword_0 + 1)
    {
      double v7 = [(BKContentViewController *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v7 hasSpreadPagesForContentViewController:self] & 1) != 0)
      {
        double v8 = 24.0;
        double v9 = 16.0;
        double v10 = 16.0;
      }
      else
      {
        v18 = +[UIDevice currentDevice];
        v19 = (char *)[v18 orientation] - 1;

        if ((unint64_t)v19 >= 2)
        {
          v20 = [(BKFinishedContentViewController *)self view];
          [v20 bounds];
          double Height = CGRectGetHeight(v41);

          BOOL v22 = Height > 320.0;
          if (Height <= 320.0) {
            double v9 = 12.0;
          }
          else {
            double v9 = 16.0;
          }
          if (v22) {
            double v8 = 24.0;
          }
          else {
            double v8 = 20.0;
          }
          double v10 = v9;
        }
        else
        {
          double v10 = 20.0;
          double v9 = 24.0;
          double v8 = 32.0;
        }
      }

      double v14 = 44.0;
    }
    else
    {
      v15 = [(BKFinishedContentViewController *)self view];
      [v15 bounds];
      double Width = CGRectGetWidth(v40);

      BOOL v17 = Width > 320.0;
      if (Width <= 320.0) {
        double v9 = 16.0;
      }
      else {
        double v9 = 32.0;
      }
      if (v17) {
        double v10 = 24.0;
      }
      else {
        double v10 = 16.0;
      }
      if (v17) {
        double v8 = 47.0;
      }
      else {
        double v8 = 24.0;
      }
      double v11 = 44.0;
      double v12 = 96.0;
      if (v17) {
        double v14 = 96.0;
      }
      else {
        double v14 = 44.0;
      }
    }
  }
  else
  {
    double v11 = 24.0;
    double v12 = 120.0;
    double v13 = 47.0;
    if (v6 == (unsigned char *)&dword_0 + 1) {
      double v9 = 16.0;
    }
    else {
      double v9 = 32.0;
    }
    if (v6 == (unsigned char *)&dword_0 + 1) {
      double v10 = 16.0;
    }
    else {
      double v10 = 24.0;
    }
    if (v6 == (unsigned char *)&dword_0 + 1) {
      double v8 = 24.0;
    }
    else {
      double v8 = 47.0;
    }
    if (v6 == (unsigned char *)&dword_0 + 1) {
      double v14 = 44.0;
    }
    else {
      double v14 = 120.0;
    }
  }
  [(BKFinishedContentViewController *)self contentScale];
  BOOL v24 = v23 <= 0.0;
  double v25 = v14 * v23;
  double v26 = v8 * v23;
  double v27 = v10 * v23;
  double v28 = v23 * 4.0;
  if (v24) {
    double v29 = 4.0;
  }
  else {
    double v29 = v28;
  }
  if (!v24)
  {
    double v10 = v27;
    double v8 = v26;
    double v14 = v25;
  }
  v30 = [(BKFinishedContentViewController *)self checkmarkWidthConstraint];
  [v30 setConstant:v14];

  v31 = [(BKFinishedContentViewController *)self checkmarkHeightConstraint];
  [v31 setConstant:v14];

  v32 = [(BKFinishedContentViewController *)self checkmarkTopConstraint];
  [v32 setConstant:v29];

  v33 = [(BKFinishedContentViewController *)self titleTopConstraint];
  [v33 setConstant:v8];

  v34 = [(BKFinishedContentViewController *)self bodyTopConstraint];
  [v34 setConstant:v10];

  v35 = [(BKFinishedContentViewController *)self finishedButtonTopConstraint];
  [v35 setConstant:v9];

  v36 = [(BKFinishedContentViewController *)self finishedButtonBottomConstraint];
  [v36 setConstant:30.0];

  v37 = [(BKFinishedContentViewController *)self finishedButtonLeadingConstraint];
  [v37 setConstant:v29];

  v38 = [(BKFinishedContentViewController *)self finishedButtonTrailingConstraint];
  [v38 setConstant:v29];
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
  if (![(BKFinishedContentViewController *)self fixedLayout])
  {
    double v4 = [(BKFinishedContentViewController *)self styleManager];
    [v4 fontSize];
    float v6 = v5;

    if (v6 > 0.0)
    {
      unsigned int v7 = [(BKFinishedContentViewController *)self im_isCompactWidth];
      LODWORD(v8) = 1.5;
      if (v7)
      {
        unsigned int v9 = [(BKFinishedContentViewController *)self im_isCompactHeight];
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
  [(BKFinishedContentViewController *)self contentScale];
  if (v11 <= 0.0) {
    double v11 = 1.0;
  }
  double v12 = v3 * v11;
  id v21 = [(BKFinishedContentViewController *)self titleLabel];
  double v13 = +[TUIFontSpec fontSpecWithPostscriptName:@"BooksSerif-Heavy" size:v12 * 24.0];
  double v14 = [v13 font];
  [v21 setFont:v14];

  v15 = [(BKFinishedContentViewController *)self bodyLabel];
  v16 = +[UIFont systemFontOfSize:v12 * 13.0];
  [v15 setFont:v16];

  BOOL v17 = [(BKFinishedContentViewController *)self finishedButton];
  v18 = +[UIFont boldSystemFontOfSize:v12 * 15.0];
  v19 = [v17 titleLabel];
  [v19 setFont:v18];

  v20 = [(BKFinishedContentViewController *)self view];
  [v20 setNeedsUpdateConstraints];
}

- (void)_didChangeStyle:(id)a3
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  [(BKFinishedContentViewController *)self updateFonts];
  double v4 = [(BKFinishedContentViewController *)self view];
  [v4 layoutIfNeeded];

  [(BKFinishedContentViewController *)self updateButtonAppearance];
}

- (void)updateAppearance
{
  if ([(BKFinishedContentViewController *)self isViewLoaded])
  {
    id v22 = [(BKFinishedContentViewController *)self themePage];
    double v3 = [v22 backgroundColorForTraitEnvironment:self];
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

    unsigned int v7 = [(BKFinishedContentViewController *)self view];
    [v7 setBackgroundColor:v6];

    double v8 = [v22 finishedCheckmarkColor];
    unsigned int v9 = [(BKFinishedContentViewController *)self checkmarkImageView];
    [v9 setTintColor:v8];

    float v10 = [v22 contentTextColor];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[UIColor blackColor];
    }
    double v13 = v12;

    double v14 = [(BKFinishedContentViewController *)self titleLabel];
    [v14 setTextColor:v13];

    v15 = [(BKFinishedContentViewController *)self bodyLabel];
    [v15 setTextColor:v13];

    v16 = [v22 buttonColor];
    BOOL v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = +[UIColor blackColor];
    }
    v19 = v18;

    v20 = +[UIColor whiteColor];
    id v21 = [(BKFinishedContentViewController *)self finishedButton];
    [v21 setFrameWidth:0.0];
    [v21 setFrameColor:v19];
    [v21 setNormalBackgroundColor:v19];
    [v21 setHighlightBackgroundColor:v6];
    [v21 setTitleColor:v20 forState:0];
    [v21 setTitleColor:v19 forState:1];
  }
}

- (void)setTheme:(id)a3
{
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(BKFinishedContentViewController *)self theme];
  unsigned int v8 = [v6 isEqual:v7];

  if (!v8 || v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)BKFinishedContentViewController;
    [(BKContentViewController *)&v9 setTheme:v6 force:v4];
    [(BKFinishedContentViewController *)self updateAppearance];
  }
}

- (void)setContentScale:(double)a3
{
  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    [(BKFinishedContentViewController *)self updateFonts];
    BOOL v4 = [(BKFinishedContentViewController *)self view];
    [v4 layoutIfNeeded];

    [(BKFinishedContentViewController *)self updateButtonAppearance];
  }
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

- (int64_t)pageOffset
{
  return 0;
}

- (id)currentLocation
{
  v2 = [[BKLocation alloc] initWithOrdinal:[(BKContentViewController *)self ordinal]];

  return v2;
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

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (BKFinishedButton)finishedButton
{
  return self->_finishedButton;
}

- (void)setFinishedButton:(id)a3
{
}

- (NSLayoutConstraint)checkmarkWidthConstraint
{
  return self->_checkmarkWidthConstraint;
}

- (void)setCheckmarkWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)checkmarkHeightConstraint
{
  return self->_checkmarkHeightConstraint;
}

- (void)setCheckmarkHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleWidthConstraint
{
  return self->_titleWidthConstraint;
}

- (void)setTitleWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)bodyWidthConstraint
{
  return self->_bodyWidthConstraint;
}

- (void)setBodyWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)checkmarkTopConstraint
{
  return self->_checkmarkTopConstraint;
}

- (void)setCheckmarkTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleTopConstraint
{
  return self->_titleTopConstraint;
}

- (void)setTitleTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bodyTopConstraint
{
  return self->_bodyTopConstraint;
}

- (void)setBodyTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)finishedButtonTopConstraint
{
  return self->_finishedButtonTopConstraint;
}

- (void)setFinishedButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)finishedButtonBottomConstraint
{
  return self->_finishedButtonBottomConstraint;
}

- (void)setFinishedButtonBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLeadingConstraint
{
  return self->_titleLeadingConstraint;
}

- (void)setTitleLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleTrailingConstraint
{
  return self->_titleTrailingConstraint;
}

- (void)setTitleTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bodyLeadingConstraint
{
  return self->_bodyLeadingConstraint;
}

- (void)setBodyLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bodyTrailingConstraint
{
  return self->_bodyTrailingConstraint;
}

- (void)setBodyTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)finishedButtonLeadingConstraint
{
  return self->_finishedButtonLeadingConstraint;
}

- (void)setFinishedButtonLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)finishedButtonTrailingConstraint
{
  return self->_finishedButtonTrailingConstraint;
}

- (void)setFinishedButtonTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bodyTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_bodyTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkTopConstraint, 0);
  objc_storeStrong((id *)&self->_bodyWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkHeightConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkWidthConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end