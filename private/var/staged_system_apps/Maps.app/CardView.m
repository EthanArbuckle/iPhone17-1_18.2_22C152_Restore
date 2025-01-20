@interface CardView
- (BOOL)hideGrabber;
- (BOOL)showFooterGrabber;
- (CGSize)intrinsicContentSize;
- (CardView)initWithThickBlur;
- (CardViewDelegate)delegate;
- (NSLayoutConstraint)heightConstraint;
- (NSString)blurGroupName;
- (UIView)contentView;
- (double)height;
- (double)overriddenIntrinsicHeight;
- (id)initAllowingBlurred:(BOOL)a3;
- (id)initAllowingBlurredForButton:(BOOL)a3;
- (void)_commonInitWithBlurType:(int64_t)a3;
- (void)_setCornerRadiusWithMaskedCorners:(unint64_t)a3 cornerRadius:(double)a4;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)setBlurGroupName:(id)a3;
- (void)setCaptureView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeight:(double)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHideGrabber:(BOOL)a3;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setOverriddenIntrinsicHeight:(double)a3;
- (void)setShowFooterGrabber:(BOOL)a3;
- (void)showShadow:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
@end

@implementation CardView

- (CGSize)intrinsicContentSize
{
  [(CardView *)self overriddenIntrinsicHeight];
  if (v3 == 0.0)
  {
    v13.receiver = self;
    v13.super_class = (Class)CardView;
    [(CardView *)&v13 intrinsicContentSize];
    CGFloat v4 = v9;
    CGFloat v6 = v10;
  }
  else
  {
    CGFloat v4 = UIViewNoIntrinsicMetric;
    [(CardView *)self overriddenIntrinsicHeight];
    CGFloat v6 = v5;
    v7 = sub_100BBEBB8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v16.width = UIViewNoIntrinsicMetric;
      v16.height = v6;
      v8 = NSStringFromSize(v16);
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Card view intrinsicContentSize - %@", buf, 0xCu);
    }
  }
  double v11 = v4;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)overriddenIntrinsicHeight
{
  return self->_overriddenIntrinsicHeight;
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  NSClassFromString(@"_UIDebugColorBoundsView");
  objc_opt_isKindOfClass();
  v5.receiver = self;
  v5.super_class = (Class)CardView;
  [(CardView *)&v5 didAddSubview:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CardView;
  [(CardView *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(CardView *)self traitCollection],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(CardView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(CardView *)self updateTheme];
  }
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_style = a3;
  if ([(CardCustomBorderView *)self->_customBorderView cardCustomBorder]) {
    double v5 = _UISheetCornerRadius;
  }
  else {
    double v5 = 9.0;
  }
  if (a3 == 7)
  {
    [(CardCustomBorderView *)self->_customBorderView setHidden:1];
    [(CardCustomBorderView *)self->_customBorderView setCardCustomBorder:0];
    double v8 = 0.0;
    id v6 = self;
    uint64_t v7 = 0;
  }
  else
  {
    if (a3 == 6)
    {
      [(CardCustomBorderView *)self->_customBorderView setHidden:0];
      [(CardCustomBorderView *)self->_customBorderView setCardCustomBorder:2];
      id v6 = self;
      uint64_t v7 = 15;
    }
    else
    {
      [(CardCustomBorderView *)self->_customBorderView setHidden:0];
      if (a3 - 2 >= 3) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 3;
      }
      [(CardCustomBorderView *)self->_customBorderView setCardCustomBorder:v9];
      id v6 = self;
      uint64_t v7 = 3;
    }
    double v8 = v5;
  }

  [(CardView *)v6 _setCornerRadiusWithMaskedCorners:v7 cornerRadius:v8];
}

- (id)initAllowingBlurredForButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[UIScreen mainScreen];
  [v5 bounds];
  v8.receiver = self;
  v8.super_class = (Class)CardView;
  id v6 = -[CardView initWithFrame:](&v8, "initWithFrame:");

  if (v6)
  {
    v6->_buttonCard = 1;
    [(CardView *)v6 _commonInitWithBlurType:v3];
  }
  return v6;
}

- (void)_setCornerRadiusWithMaskedCorners:(unint64_t)a3 cornerRadius:(double)a4
{
  id v6 = self->_blurView;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIVisualEffectView *)v6 _setCornerRadius:0 continuous:a3 maskedCorners:a4];
  }
  else {
    [(UIVisualEffectView *)v6 _setCornerRadius:a4];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CardView;
  [(CardView *)&v19 layoutSubviews];
  [(CardView *)self bounds];
  v20.origin.x = v3;
  v20.origin.y = v4;
  v20.size.width = v5;
  v20.size.height = v6;
  if (!CGRectEqualToRect(self->_savedBounds, v20))
  {
    [(CardView *)self bounds];
    self->_savedBounds.origin.x = v7;
    self->_savedBounds.origin.y = v8;
    self->_savedBounds.size.width = v9;
    self->_savedBounds.size.height = v10;
    [(CardView *)self bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    -[UIView setFrame:](self->_shadowView, "setFrame:");
    -[CardCustomBorderView setFrame:](self->_customBorderView, "setFrame:", v12, v14, v16, v18);
    -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:", v12, v14, v16, v18);
  }
}

- (void)_commonInitWithBlurType:(int64_t)a3
{
  self->_canAddSubviews = 1;
  [(CardView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = +[UIColor clearColor];
  [(CardView *)self setBackgroundColor:v13];

  double v14 = -[CardCustomBorderView initWithFrame:]([CardCustomBorderView alloc], "initWithFrame:", v6, v8, v10, v12);
  customBorderView = self->_customBorderView;
  self->_customBorderView = v14;

  [(CardCustomBorderView *)self->_customBorderView setButtonCard:self->_buttonCard];
  [(CardView *)self addSubview:self->_customBorderView];
  if (a3 == 2)
  {
    id v16 = objc_alloc((Class)UIVisualEffectView);
    double v17 = +[UIBlurEffect effectWithStyle:8];
    double v18 = (UIVisualEffectView *)[v16 initWithEffect:v17];
    blurView = self->_blurView;
    self->_blurView = v18;

    [(UIVisualEffectView *)self->_blurView _setGroupName:@"CardView"];
  }
  else
  {
    +[MapsTheme visualEffectViewAllowingBlur:a3 != 0];
    CGRect v20 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    v21 = self->_blurView;
    self->_blurView = v20;
  }
  [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [(UIVisualEffectView *)self->_blurView contentView];
  v23 = [v22 layer];
  [v23 setAllowsGroupOpacity:0];

  v24 = [(UIVisualEffectView *)self->_blurView contentView];
  [v24 setClipsToBounds:1];

  [(CardView *)self addSubview:self->_blurView];
  id v25 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v29 = [v25 initWithFrame:CGRectZero.origin.x, y, width, height];
  contentView = self->_contentView;
  self->_contentView = v29;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = [(UIVisualEffectView *)self->_blurView contentView];
  [v31 addSubview:self->_contentView];

  v32 = [(UIView *)self->_contentView topAnchor];
  v33 = [(UIVisualEffectView *)self->_blurView contentView];
  v34 = [v33 topAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v35;

  v37 = [(UIVisualEffectView *)self->_blurView contentView];
  v38 = [v37 bottomAnchor];
  v39 = [(UIView *)self->_contentView bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v40;

  v42 = self->_bottomConstraint;
  v70[0] = self->_topConstraint;
  v70[1] = v42;
  v68 = [(UIView *)self->_contentView leadingAnchor];
  v69 = [(UIVisualEffectView *)self->_blurView contentView];
  v67 = [v69 leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v70[2] = v66;
  v64 = [(UIView *)self->_contentView trailingAnchor];
  v65 = [(UIVisualEffectView *)self->_blurView contentView];
  v63 = [v65 trailingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v70[3] = v62;
  v61 = [(CardView *)self topAnchor];
  v60 = [(UIVisualEffectView *)self->_blurView topAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v70[4] = v59;
  v58 = [(CardView *)self bottomAnchor];
  v57 = [(UIVisualEffectView *)self->_blurView bottomAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v70[5] = v56;
  v43 = [(CardView *)self leadingAnchor];
  v44 = [(UIVisualEffectView *)self->_blurView contentView];
  v45 = [v44 leadingAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  v70[6] = v46;
  v47 = [(CardView *)self trailingAnchor];
  v48 = [(UIVisualEffectView *)self->_blurView contentView];
  v49 = [v48 trailingAnchor];
  v50 = [v47 constraintEqualToAnchor:v49];
  v70[7] = v50;
  v51 = +[NSArray arrayWithObjects:v70 count:8];
  +[NSLayoutConstraint activateConstraints:v51];

  v52 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  shadowView = self->_shadowView;
  self->_shadowView = v52;

  v54 = +[UIColor colorWithWhite:0.0 alpha:0.0599999987];
  [(UIView *)self->_shadowView setBackgroundColor:v54];

  [(UIView *)self->_shadowView setUserInteractionEnabled:0];
  [(UIView *)self->_shadowView _setCornerRadius:_UISheetCornerRadius];
  v55 = [(CardView *)self contentView];
  [v55 addSubview:self->_shadowView];

  [(UIView *)self->_shadowView setAlpha:0.0];
  self->_canAddSubviews = 0;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setBlurGroupName:(id)a3
{
  id v6 = a3;
  CGFloat v4 = (NSString *)[v6 copy];
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  [(UIVisualEffectView *)self->_blurView _setGroupName:v6];
}

- (id)initAllowingBlurred:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[UIScreen mainScreen];
  [v5 bounds];
  v8.receiver = self;
  v8.super_class = (Class)CardView;
  id v6 = -[CardView initWithFrame:](&v8, "initWithFrame:");

  if (v6) {
    [(CardView *)v6 _commonInitWithBlurType:v3];
  }
  return v6;
}

- (void)setOverriddenIntrinsicHeight:(double)a3
{
  if (self->_overriddenIntrinsicHeight != a3)
  {
    double v5 = sub_100BBEBB8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double overriddenIntrinsicHeight = self->_overriddenIntrinsicHeight;
      int v7 = 134218240;
      double v8 = overriddenIntrinsicHeight;
      __int16 v9 = 2048;
      double v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cardview setting overidden height from - %f to - %f", (uint8_t *)&v7, 0x16u);
    }

    self->_double overriddenIntrinsicHeight = a3;
  }
}

- (CardView)initWithThickBlur
{
  BOOL v3 = +[UIScreen mainScreen];
  [v3 bounds];
  v6.receiver = self;
  v6.super_class = (Class)CardView;
  CGFloat v4 = -[CardView initWithFrame:](&v6, "initWithFrame:");

  if (v4) {
    [(CardView *)v4 _commonInitWithBlurType:2];
  }
  return v4;
}

- (NSLayoutConstraint)heightConstraint
{
  heightConstraint = self->_heightConstraint;
  if (!heightConstraint)
  {
    CGFloat v4 = [(UIView *)self->_contentView heightAnchor];
    double v5 = [v4 constraintEqualToConstant:self->_height];
    objc_super v6 = self->_heightConstraint;
    self->_heightConstraint = v5;

    [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
    heightConstraint = self->_heightConstraint;
  }

  return heightConstraint;
}

- (void)setCaptureView:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v4 = [(UIVisualEffectView *)self->_blurView _captureView];

    if (!v4)
    {
      [(UIVisualEffectView *)self->_blurView _setGroupName:self->_blurGroupName];
      [(UIVisualEffectView *)self->_blurView _setCaptureView:v5];
    }
  }
}

- (void)updateTheme
{
}

- (void)setHeight:(double)a3
{
  if (self->_height != a3)
  {
    id v5 = sub_100BBEBB8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double height = self->_height;
      int v8 = 134218240;
      double v9 = height;
      __int16 v10 = 2048;
      double v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Card view setHeight from - %f to - %f", (uint8_t *)&v8, 0x16u);
    }

    self->_double height = a3;
    int v7 = [(CardView *)self heightConstraint];
    [v7 setConstant:a3];
  }
}

- (void)showShadow:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      double v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      id v16 = sub_100BBF008;
      double v17 = &unk_1012E5D08;
      double v18 = self;
      CGFloat v4 = &stru_10131A870;
      double v5 = 0.25;
      objc_super v6 = &v14;
LABEL_6:
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v4, v5, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      return;
    }
    shadowView = self->_shadowView;
    double v8 = 1.0;
  }
  else
  {
    if (a4)
    {
      double v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      double v11 = sub_100BBF024;
      double v12 = &unk_1012E5D08;
      double v13 = self;
      CGFloat v4 = &stru_10131A890;
      double v5 = 0.25;
      objc_super v6 = &v9;
      goto LABEL_6;
    }
    shadowView = self->_shadowView;
    double v8 = 0.0;
  }

  [(UIView *)shadowView setAlpha:v8];
}

- (CardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (BOOL)hideGrabber
{
  return self->_hideGrabber;
}

- (void)setHideGrabber:(BOOL)a3
{
  self->_hideGrabber = a3;
}

- (BOOL)showFooterGrabber
{
  return self->_showFooterGrabber;
}

- (void)setShowFooterGrabber:(BOOL)a3
{
  self->_showFooterGrabber = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_customBorderView, 0);
}

@end