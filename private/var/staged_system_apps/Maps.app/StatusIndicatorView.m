@interface StatusIndicatorView
- (BOOL)isProminent;
- (BOOL)isVisible;
- (BOOL)limitedMode;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showsDisclosure;
- (BOOL)touchInitiallyInside;
- (BOOL)touched;
- (CALayer)extraDisclosureShadowLayer;
- (CALayer)extraLabelShadowLayer;
- (NSDate)dateBecameProminent;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)labelTrailingConstraintWithDisclosureHidden;
- (NSLayoutConstraint)labelTrailingConstraintWithDisclosureShown;
- (SEL)action;
- (StatusIndicatorView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchInsets;
- (UIImageView)disclosure;
- (UILabel)label;
- (UIView)contentView;
- (double)_topPadding;
- (id)_labelFont;
- (id)constraintsForPositionInStatusBarBackgroundView:(id)a3;
- (id)initForLimitedMode:(BOOL)a3;
- (id)initialConstraintsForAnimatingPositionInStatusBarBackgroundView:(id)a3;
- (id)target;
- (int64_t)statusBarStyle;
- (unint64_t)type;
- (void)_updateIndicatorProminenceAnimated:(BOOL)a3;
- (void)_updateIndicatorWithType:(unint64_t)a3 animated:(BOOL)a4;
- (void)didTapStatusIndicatorView;
- (void)layoutSubviews;
- (void)setAction:(SEL)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setDateBecameProminent:(id)a3;
- (void)setDisclosure:(id)a3;
- (void)setExtraDisclosureShadowLayer:(id)a3;
- (void)setExtraLabelShadowLayer:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelTrailingConstraintWithDisclosureHidden:(id)a3;
- (void)setLabelTrailingConstraintWithDisclosureShown:(id)a3;
- (void)setProminent:(BOOL)a3;
- (void)setProminent:(BOOL)a3 allowSkip:(BOOL)a4 animated:(BOOL)a5;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setTarget:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
- (void)setTouchInitiallyInside:(BOOL)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setTouched:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
- (void)updateWithStatusBarStyle:(int64_t)a3;
@end

@implementation StatusIndicatorView

- (void)_updateIndicatorWithType:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = sub_10000BB78();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[StatusIndicatorView _updateIndicatorWithType:animated:]";
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s type = %lu", buf, 0x16u);
  }

  BOOL v8 = !self->_limitedMode && [(StatusIndicatorView *)self showsDisclosure];
  [(StatusIndicatorView *)self setProminent:v8 allowSkip:0 animated:v4];
  [(UIImageView *)self->_disclosure setHidden:v8 ^ 1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001082BC;
  v9[3] = &unk_1012E6300;
  v9[4] = self;
  BOOL v10 = v8;
  +[UIView performWithoutAnimation:v9];
}

- (void)_updateIndicatorProminenceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(StatusIndicatorView *)self isProminent];
  sub_1001097FC(self->_type);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007A720;
  v12[3] = &unk_1012E5CE0;
  v12[4] = self;
  unsigned __int8 v14 = v5;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  v7 = objc_retainBlock(v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001082A8;
  v10[3] = &unk_1012E6160;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  v9 = objc_retainBlock(v10);
  if (v3)
  {
    +[UIView animateWithDuration:v7 animations:v9 completion:0.25];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
    ((void (*)(void *, uint64_t))v9[2])(v9, 1);
  }
}

- (id)_labelFont
{
  if ([(StatusIndicatorView *)self showsDisclosure]
    && [(StatusIndicatorView *)self isProminent])
  {
    BOOL v3 = +[UIFont _maps_boldSystemFontWithFixedSize:15.0];
  }
  else
  {
    BOOL v3 = +[UIFont _maps_systemFontWithFixedSize:13.0];
  }

  return v3;
}

- (BOOL)showsDisclosure
{
  unint64_t type = self->_type;
  if (type < 8 && ((0x9Fu >> type) & 1) != 0) {
    return 0;
  }
  else {
    return ![(StatusIndicatorView *)self limitedMode];
  }
}

- (void)updateTheme
{
  if ([(StatusIndicatorView *)self showsDisclosure]) {
    unsigned int v3 = [(StatusIndicatorView *)self isProminent];
  }
  else {
    unsigned int v3 = 0;
  }
  if ((id)[(StatusIndicatorView *)self statusBarStyle] != (id)1)
  {
    if ([(StatusIndicatorView *)self statusBarStyle])
    {
      BOOL v4 = 0;
      if (!v3) {
        goto LABEL_12;
      }
    }
    else
    {
      v12 = [(StatusIndicatorView *)self traitCollection];
      BOOL v4 = [v12 userInterfaceStyle] == (id)2;

      if (!v3) {
        goto LABEL_12;
      }
    }
LABEL_9:
    BOOL touched = self->_touched;
    id v6 = [(StatusIndicatorView *)self theme];
    v7 = [v6 statusIndicatorBackgroundColor:touched];
    [(UIView *)self->_contentView setBackgroundColor:v7];

    id v8 = [(StatusIndicatorView *)self theme];
    v9 = [v8 statusIndicatorTextColorForStyleLightContent:0];
    [(UILabel *)self->_label setTextColor:v9];

    BOOL v10 = [(StatusIndicatorView *)self theme];
    id v23 = v10;
    goto LABEL_10;
  }
  BOOL v4 = 1;
  if (v3) {
    goto LABEL_9;
  }
LABEL_12:
  id v13 = +[UIColor clearColor];
  [(UIView *)self->_contentView setBackgroundColor:v13];

  BOOL v14 = self->_touched;
  v15 = [(StatusIndicatorView *)self theme];
  v16 = v15;
  if (v4)
  {
    v17 = [v15 statusIndicatorTextColorForStyleLightContent:v14];
    [(UILabel *)self->_label setTextColor:v17];

    BOOL v18 = self->_touched;
    BOOL v10 = [(StatusIndicatorView *)self theme];
    id v23 = v10;
    if (v18)
    {
      uint64_t v11 = 1;
      goto LABEL_15;
    }
LABEL_10:
    uint64_t v11 = 0;
LABEL_15:
    uint64_t v19 = [v10 statusIndicatorTextColorForStyleLightContent:v11];
    goto LABEL_17;
  }
  v20 = [v15 statusIndicatorTextColorForStyleDefault:v14];
  [(UILabel *)self->_label setTextColor:v20];

  BOOL v21 = self->_touched;
  id v23 = [(StatusIndicatorView *)self theme];
  uint64_t v19 = [v23 statusIndicatorTextColorForStyleDefault:v21];
LABEL_17:
  v22 = (void *)v19;
  [(UIImageView *)self->_disclosure setTintColor:v19];
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (StatusIndicatorView)initWithFrame:(CGRect)a3
{
  v61.receiver = self;
  v61.super_class = (Class)StatusIndicatorView;
  unsigned int v3 = -[StatusIndicatorView initWithFrame:](&v61, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = (objc_class *)objc_opt_class();
    unsigned __int8 v5 = NSStringFromClass(v4);
    [(StatusIndicatorView *)v3 setAccessibilityIdentifier:v5];

    id v6 = (UIView *)objc_alloc_init((Class)UIView);
    contentView = v3->_contentView;
    v3->_contentView = v6;

    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_contentView setAccessibilityIdentifier:@"StatusIndicatorContent"];
    [(StatusIndicatorView *)v3 addSubview:v3->_contentView];
    id v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v8;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v10 = [(StatusIndicatorView *)v3 _labelFont];
    [(UILabel *)v3->_label setFont:v10];

    [(UILabel *)v3->_label setNumberOfLines:1];
    [(UILabel *)v3->_label setAccessibilityIdentifier:@"StatusIndicatorLabel"];
    [(UIView *)v3->_contentView addSubview:v3->_label];
    uint64_t v11 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    disclosure = v3->_disclosure;
    v3->_disclosure = v11;

    [(UIImageView *)v3->_disclosure setHidden:1];
    [(UIImageView *)v3->_disclosure setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_disclosure setAccessibilityIdentifier:@"StatusIndicatorDisclosure"];
    [(UIView *)v3->_contentView addSubview:v3->_disclosure];
    uint64_t v13 = +[CALayer layer];
    extraLabelShadowLayer = v3->_extraLabelShadowLayer;
    v3->_extraLabelShadowLayer = (CALayer *)v13;

    v15 = [(UILabel *)v3->_label layer];
    [v15 insertSublayer:v3->_extraLabelShadowLayer atIndex:0];

    [(CALayer *)v3->_extraLabelShadowLayer setActions:0];
    uint64_t v16 = +[CALayer layer];
    extraDisclosureShadowLayer = v3->_extraDisclosureShadowLayer;
    v3->_extraDisclosureShadowLayer = (CALayer *)v16;

    BOOL v18 = [(UIImageView *)v3->_disclosure layer];
    [v18 insertSublayer:v3->_extraDisclosureShadowLayer atIndex:0];

    [(CALayer *)v3->_extraDisclosureShadowLayer setActions:0];
    __asm { FMOV            V0.2D, #-8.0 }
    *(_OWORD *)&v3->_touchInsets.top = _Q0;
    *(_OWORD *)&v3->_touchInsets.bottom = _Q0;
    v24 = [(UILabel *)v3->_label trailingAnchor];
    v25 = [(UIView *)v3->_contentView trailingAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25 constant:-10.0];
    labelTrailingConstraintWithDisclosureHidden = v3->_labelTrailingConstraintWithDisclosureHidden;
    v3->_labelTrailingConstraintWithDisclosureHidden = (NSLayoutConstraint *)v26;

    v28 = [(UILabel *)v3->_label trailingAnchor];
    v29 = [(UIImageView *)v3->_disclosure leadingAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29 constant:-6.0];
    labelTrailingConstraintWithDisclosureShown = v3->_labelTrailingConstraintWithDisclosureShown;
    v3->_labelTrailingConstraintWithDisclosureShown = (NSLayoutConstraint *)v30;

    v32 = [(UIView *)v3->_contentView topAnchor];
    v33 = [(StatusIndicatorView *)v3 topAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    contentViewTopConstraint = v3->_contentViewTopConstraint;
    v3->_contentViewTopConstraint = (NSLayoutConstraint *)v34;

    v36 = [(UIView *)v3->_contentView bottomAnchor];
    v37 = [(StatusIndicatorView *)v3 bottomAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37];
    contentViewBottomConstraint = v3->_contentViewBottomConstraint;
    v3->_contentViewBottomConstraint = (NSLayoutConstraint *)v38;

    v54 = +[NSMutableArray array];
    v60 = [(UILabel *)v3->_label firstBaselineAnchor];
    v59 = [(UIView *)v3->_contentView topAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:20.0];
    v62[0] = v58;
    v57 = [(UILabel *)v3->_label firstBaselineAnchor];
    v56 = [(UIView *)v3->_contentView bottomAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:-10.0];
    v62[1] = v55;
    v53 = [(UILabel *)v3->_label leadingAnchor];
    v52 = [(UIView *)v3->_contentView leadingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:10.0];
    v62[2] = v51;
    v50 = [(UIImageView *)v3->_disclosure firstBaselineAnchor];
    v49 = [(UILabel *)v3->_label firstBaselineAnchor];
    v40 = [v50 constraintEqualToAnchor:v49];
    v62[3] = v40;
    v41 = [(UIImageView *)v3->_disclosure trailingAnchor];
    v42 = [(UIView *)v3->_contentView trailingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:-6.0];
    v62[4] = v43;
    v62[5] = v3->_contentViewTopConstraint;
    v62[6] = v3->_contentViewBottomConstraint;
    v44 = [(UIView *)v3->_contentView centerXAnchor];
    v45 = [(StatusIndicatorView *)v3 centerXAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v62[7] = v46;
    v47 = +[NSArray arrayWithObjects:v62 count:8];
    [v54 addObjectsFromArray:v47];

    +[NSLayoutConstraint activateConstraints:v54];
  }
  return v3;
}

- (void)setProminent:(BOOL)a3 allowSkip:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3)
  {
    if (self->_limitedMode) {
      return;
    }
    self->_prominent = 1;
    v7 = +[NSDate date];
    dateBecameProminent = self->_dateBecameProminent;
    self->_dateBecameProminent = v7;

    v9 = sub_10000BB78();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    int v18 = 136315138;
    uint64_t v19 = "-[StatusIndicatorView setProminent:allowSkip:animated:]";
    BOOL v10 = "%s became prominent";
    goto LABEL_16;
  }
  v12 = self->_dateBecameProminent;
  if (v12 || !a4)
  {
    [(NSDate *)v12 timeIntervalSinceNow];
    double v14 = v13;
    [(NSDate *)self->_dateBecameProminent timeIntervalSinceNow];
    if (v14 < 0.0) {
      double v15 = -v15;
    }
    if (v15 > 5.0 || !a4)
    {
      self->_prominent = 0;
      v17 = self->_dateBecameProminent;
      self->_dateBecameProminent = 0;

      v9 = sub_10000BB78();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_17:

        [(StatusIndicatorView *)self _updateIndicatorProminenceAnimated:v5];
        return;
      }
      int v18 = 136315138;
      uint64_t v19 = "-[StatusIndicatorView setProminent:allowSkip:animated:]";
      BOOL v10 = "%s resign prominent";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v18, 0xCu);
      goto LABEL_17;
    }
    uint64_t v16 = sub_10000BB78();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[StatusIndicatorView setProminent:allowSkip:animated:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s skip resign prominent", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)setProminent:(BOOL)a3
{
}

- (BOOL)isVisible
{
  return self->_type > 1;
}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    self->_unint64_t type = a3;
    -[StatusIndicatorView _updateIndicatorWithType:animated:](self, "_updateIndicatorWithType:animated:");
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  if (a4) {
    id v6 = a4;
  }
  else {
    id v6 = 0;
  }
  self->_action = v6;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (id)initForLimitedMode:(BOOL)a3
{
  id result = -[StatusIndicatorView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (result) {
    *((unsigned char *)result + 9) = a3;
  }
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)StatusIndicatorView;
  [(StatusIndicatorView *)&v3 layoutSubviews];
  [(UIView *)self->_contentView bounds];
  [(UIView *)self->_contentView _setContinuousCornerRadius:CGRectGetHeight(v4) * 0.5];
}

- (void)didTapStatusIndicatorView
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  p_action = &self->_action;
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(p_target);
    if (*p_action) {
      SEL v8 = *p_action;
    }
    else {
      SEL v8 = 0;
    }
    id v9 = v7;
    [v7 performSelector:v8 withObject:self];
  }
}

- (double)_topPadding
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 0.0;
  if (v2 == 5) {
    return 13.0;
  }
  return result;
}

- (id)constraintsForPositionInStatusBarBackgroundView:(id)a3
{
  id v4 = a3;
  int v18 = [(StatusIndicatorView *)self topAnchor];
  v17 = [v4 safeAreaTopLayoutAnchor];
  [(StatusIndicatorView *)self _topPadding];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  BOOL v5 = [(StatusIndicatorView *)self bottomAnchor];
  char v6 = [v4 bottomAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  SEL v8 = [(StatusIndicatorView *)self leadingAnchor];
  id v9 = [v4 leadingAnchor];
  BOOL v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  uint64_t v11 = [(StatusIndicatorView *)self trailingAnchor];
  v12 = [v4 trailingAnchor];

  double v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  double v14 = +[NSArray arrayWithObjects:v19 count:4];

  return v14;
}

- (id)initialConstraintsForAnimatingPositionInStatusBarBackgroundView:(id)a3
{
  id v4 = a3;
  int v18 = [(StatusIndicatorView *)self topAnchor];
  v17 = [v4 safeAreaTopLayoutAnchor];
  [(StatusIndicatorView *)self _topPadding];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  BOOL v5 = [(StatusIndicatorView *)self bottomAnchor];
  char v6 = [v4 safeAreaTopLayoutAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  SEL v8 = [(StatusIndicatorView *)self leadingAnchor];
  id v9 = [v4 leadingAnchor];
  BOOL v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  uint64_t v11 = [(StatusIndicatorView *)self trailingAnchor];
  v12 = [v4 trailingAnchor];

  double v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  double v14 = +[NSArray arrayWithObjects:v19 count:4];

  return v14;
}

- (void)updateWithStatusBarStyle:(int64_t)a3
{
  if ([(StatusIndicatorView *)self statusBarStyle] != a3)
  {
    [(StatusIndicatorView *)self setStatusBarStyle:a3];
    [(StatusIndicatorView *)self updateTheme];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)StatusIndicatorView;
  id v4 = a3;
  [(MapsThemeView *)&v8 traitCollectionDidChange:v4];
  BOOL v5 = [(StatusIndicatorView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(StatusIndicatorView *)self updateTheme];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(StatusIndicatorView *)self bounds];
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchInsets.right);
  double v16 = v15 - (top + self->_touchInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)setTouched:(BOOL)a3
{
  if (self->_touched != a3)
  {
    self->_BOOL touched = a3;
    [(StatusIndicatorView *)self updateTheme];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(StatusIndicatorView *)self window];
  id v7 = [v5 touchesForWindow:v6];

  id v20 = [v7 anyObject];

  objc_super v8 = [(StatusIndicatorView *)self contentView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  [v20 locationInView:self];
  v22.CGFloat x = v17;
  v22.CGFloat y = v18;
  v23.origin.CGFloat x = v10;
  v23.origin.CGFloat y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  self->_touchInitiallyInside = CGRectContainsPoint(v23, v22);
  BOOL v19 = [v20 tapCount] == (id)1
     && [(StatusIndicatorView *)self showsDisclosure]
     && self->_touchInitiallyInside;
  [(StatusIndicatorView *)self setTouched:v19];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(StatusIndicatorView *)self window];
  id v7 = [v5 touchesForWindow:v6];

  id v21 = [v7 anyObject];

  objc_super v8 = [(StatusIndicatorView *)self contentView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  [v21 locationInView:self];
  v23.CGFloat x = v17;
  v23.CGFloat y = v18;
  v24.origin.CGFloat x = v10;
  v24.origin.CGFloat y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  BOOL v19 = CGRectContainsPoint(v24, v23);
  if ([v21 tapCount] == (id)1 && -[StatusIndicatorView showsDisclosure](self, "showsDisclosure")) {
    BOOL v20 = self->_touchInitiallyInside && v19;
  }
  else {
    BOOL v20 = 0;
  }
  [(StatusIndicatorView *)self setTouched:v20];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(StatusIndicatorView *)self touched])
  {
    [(StatusIndicatorView *)self setTouched:0];
    if (!self->_limitedMode)
    {
      if ([(StatusIndicatorView *)self showsDisclosure])
      {
        [(StatusIndicatorView *)self didTapStatusIndicatorView];
      }
    }
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CALayer)extraLabelShadowLayer
{
  return self->_extraLabelShadowLayer;
}

- (void)setExtraLabelShadowLayer:(id)a3
{
}

- (UIImageView)disclosure
{
  return self->_disclosure;
}

- (void)setDisclosure:(id)a3
{
}

- (CALayer)extraDisclosureShadowLayer
{
  return self->_extraDisclosureShadowLayer;
}

- (void)setExtraDisclosureShadowLayer:(id)a3
{
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (NSLayoutConstraint)labelTrailingConstraintWithDisclosureHidden
{
  return self->_labelTrailingConstraintWithDisclosureHidden;
}

- (void)setLabelTrailingConstraintWithDisclosureHidden:(id)a3
{
}

- (NSLayoutConstraint)labelTrailingConstraintWithDisclosureShown
{
  return self->_labelTrailingConstraintWithDisclosureShown;
}

- (void)setLabelTrailingConstraintWithDisclosureShown:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (BOOL)limitedMode
{
  return self->_limitedMode;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_action = v3;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (BOOL)touched
{
  return self->_touched;
}

- (BOOL)touchInitiallyInside
{
  return self->_touchInitiallyInside;
}

- (void)setTouchInitiallyInside:(BOOL)a3
{
  self->_touchInitiallyInside = a3;
}

- (NSDate)dateBecameProminent
{
  return self->_dateBecameProminent;
}

- (void)setDateBecameProminent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateBecameProminent, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraintWithDisclosureShown, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraintWithDisclosureHidden, 0);
  objc_storeStrong((id *)&self->_extraDisclosureShadowLayer, 0);
  objc_storeStrong((id *)&self->_disclosure, 0);
  objc_storeStrong((id *)&self->_extraLabelShadowLayer, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end