@interface ConversationHeaderView
- (BOOL)isCollapsed;
- (CADisplayLink)displayLink;
- (CGAffineTransform)_transformForLocation:(SEL)a3;
- (CGPoint)previousScrollViewContentOffset;
- (ConversationHeaderContentView)contentView;
- (ConversationHeaderView)initWithFrame:(CGRect)a3;
- (ConversationHeaderViewDelegate)delegate;
- (MFMessageDisplayMetrics)displayMetrics;
- (NSString)superTitle;
- (NSString)title;
- (UILabel)superTitleLabel;
- (UIScrollView)hostScrollView;
- (double)contentHeight;
- (double)contentViewTopToFirstBaseline;
- (double)currentProgress;
- (double)initialScrollPosition;
- (double)lastUpdateTimeInterval;
- (double)previousProgress;
- (double)targetProgress;
- (void)_displayLinkDidFire:(id)a3;
- (void)_fontMetricCacheDidInvalidate:(id)a3;
- (void)_layoutLabelsForProgress:(double)a3;
- (void)_processProgressUpdatesWithTargetTimestamp:(double)a3;
- (void)contentDidChange;
- (void)dealloc;
- (void)hostScrollViewWillBeginDragging:(id)a3;
- (void)hostScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)resetStateBasedOnCurrentStickySubjectPosition;
- (void)safeAreaInsetsDidChange;
- (void)setBounds:(CGRect)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentView:(id)a3;
- (void)setContentViewTopToFirstBaseline:(double)a3;
- (void)setCurrentProgress:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setHostScrollView:(id)a3;
- (void)setInitialScrollPosition:(double)a3;
- (void)setLastUpdateTimeInterval:(double)a3;
- (void)setPreviousProgress:(double)a3;
- (void)setPreviousScrollViewContentOffset:(CGPoint)a3;
- (void)setSuperTitle:(id)a3;
- (void)setSuperTitleLabel:(id)a3;
- (void)setTargetProgress:(double)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation ConversationHeaderView

- (ConversationHeaderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ConversationHeaderView;
  v3 = -[ConversationHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ConversationHeaderView *)v3 setAutoresizingMask:2];
    [(ConversationHeaderView *)v4 setHideStandardTitle:1];
    [(ConversationHeaderView *)v4 setInitialScrollPosition:1.79769313e308];
    sub_100065D38(v4);
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];

    [(ConversationHeaderView *)v4 setInsetsLayoutMarginsFromSafeArea:0];
  }
  return v4;
}

- (void)dealloc
{
  if (_UIUpdateCycleEnabled() && self->_updateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceItem = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_delegate, v5);
  v4 = [v5 hostScrollViewForConversationHeaderView:self];
  [(ConversationHeaderView *)self setHostScrollView:v4];
}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  sub_1000660A0(self);

  [(ConversationHeaderView *)self setNeedsLayout];
}

- (void)setSuperTitle:(id)a3
{
  id v10 = a3;
  if (([v10 isEqualToString:self->_superTitle] & 1) == 0)
  {
    v4 = (NSString *)[v10 copy];
    superTitle = self->_superTitle;
    self->_superTitle = v4;

    [(ConversationHeaderView *)self bounds];
    sub_1000665A8(self, v6, v7, v8, v9);
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView setBounds:](&v14, "setBounds:");
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v15);
  CGFloat v9 = [(ConversationHeaderView *)self contentView];
  [v9 bounds];
  double v10 = v8 - CGRectGetWidth(v16);
  if (v10 >= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = -v10;
  }

  if (v11 >= 2.22044605e-16)
  {
    v12 = [(ConversationHeaderView *)self contentView];
    [v12 setContentWidth:v8];

    v13 = [(ConversationHeaderView *)self contentView];
    [v13 invalidateIntrinsicContentSize];

    sub_1000665A8(self, x, y, width, height);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v3 layoutSubviews];
  sub_100066F50(self);
  [(ConversationHeaderView *)self currentProgress];
  [(ConversationHeaderView *)self _layoutLabelsForProgress:"_layoutLabelsForProgress:"];
}

- (void)_layoutLabelsForProgress:(double)a3
{
  id v5 = [(ConversationHeaderView *)self contentView];
  [v5 setAlpha:a3];

  CGFloat v6 = [(ConversationHeaderView *)self contentView];
  [v6 topToFirstBaseline];
  double v8 = v7;
  [(ConversationHeaderView *)self contentViewTopToFirstBaseline];
  double v9 = 1.0 - a3;
  double v11 = v8 - v10;

  *(void *)&long long v12 = -1;
  *((void *)&v12 + 1) = -1;
  *(_OWORD *)&v37.c = v12;
  *(_OWORD *)&v37.tCGFloat x = v12;
  *(_OWORD *)&v37.a = v12;
  CGAffineTransformMakeTranslation(&v37, v9 * 0.0, -(v11 * v9));
  *(void *)&long long v13 = -1;
  *((void *)&v13 + 1) = -1;
  *(_OWORD *)&v35.c = v13;
  *(_OWORD *)&v35.tCGFloat x = v13;
  *(_OWORD *)&v35.a = v13;
  CGAffineTransform v36 = v37;
  CGAffineTransformScale(&v35, &v36, v9 * -0.0 + 1.0, v9 * -0.0 + 1.0);
  CGAffineTransform v34 = v35;
  objc_super v14 = [(ConversationHeaderView *)self contentView];
  CGAffineTransform v33 = v34;
  [v14 setTransform:&v33];

  CGRect v15 = +[UIApplication sharedApplication];
  CGRect v16 = [v15 preferredContentSizeCategory];
  NSComparisonResult v17 = UIContentSizeCategoryCompareToCategory(v16, UIContentSizeCategoryLarge);

  if (v17 == NSOrderedDescending) {
    double v18 = 14.0;
  }
  else {
    double v18 = 11.0;
  }
  if (v17 == NSOrderedDescending) {
    double v19 = 21.0;
  }
  else {
    double v19 = 17.0;
  }
  v20 = [(ConversationHeaderView *)self displayMetrics];
  [v20 conversationHeaderViewCollapsedSuperTitleTopToFirstBaseline];
  double v22 = v21;
  [v20 conversationHeaderViewCollapsedTitleTopToFirstBaseline];
  *(void *)&long long v24 = -1;
  *((void *)&v24 + 1) = -1;
  *(_OWORD *)&v37.c = v24;
  *(_OWORD *)&v37.tCGFloat x = v24;
  *(_OWORD *)&v37.a = v24;
  CGAffineTransformMakeTranslation(&v37, 0.0, (v22 - v23 + 3.0) * a3);
  CGAffineTransform v36 = v37;
  CGAffineTransformScale(&v32, &v36, 1.0 - (1.0 - v18 / v19) * a3, 1.0 - (1.0 - v18 / v19) * a3);
  v25 = [(ConversationHeaderView *)self superTitleLabel];
  CGAffineTransform v31 = v32;
  [v25 setTransform:&v31];

  v26 = +[UIColor labelColor];
  v27 = +[UIColor secondaryLabelColor];
  *(float *)&double v28 = a3;
  v29 = +[UIColor mf_colorFromColor:v26 toColor:v27 progress:v28];
  v30 = [(ConversationHeaderView *)self superTitleLabel];
  [v30 setColor:v29];
}

- (void)setTargetProgress:(double)a3
{
  self->_targetProgress = fmax(fmin(a3, 1.0), 0.0);
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  kdebug_trace();
  double v7 = 0.0;
  if (v5) {
    double v7 = 1.0;
  }
  [(ConversationHeaderView *)self setTargetProgress:v7];
  [(ConversationHeaderView *)self setCollapsed:v5];
  if (!a4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000675C0;
    v8[3] = &unk_1006047A0;
    v8[4] = self;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)resetStateBasedOnCurrentStickySubjectPosition
{
  objc_super v3 = [(ConversationHeaderView *)self delegate];
  id v7 = [v3 hostScrollViewForConversationHeaderView:self];

  [v7 contentOffset];
  double v5 = v4;
  BOOL v6 = v4 + sub_1000676F0(self, v7) >= 0.0 || v5 < sub_1000677A4(self);
  [(ConversationHeaderView *)self setCollapsed:v6 animated:1];
}

- (void)hostScrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  [v7 contentOffset];
  [(ConversationHeaderView *)self setInitialScrollPosition:v4];
  [(ConversationHeaderView *)self targetProgress];
  double v6 = v5;
  -[ConversationHeaderView setCurrentProgress:](self, "setCurrentProgress:");
  [(ConversationHeaderView *)self setPreviousProgress:v6];
}

- (void)hostScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v15 = a3;
  double v7 = sub_1000676F0(self, v15);
  double v8 = sub_100067458(self);
  double y = a5->y;
  double v10 = sub_1000677A4(self);
  [(ConversationHeaderView *)self isCollapsed];
  double v11 = v7 + y;
  if (v7 + y < 0.0 || v11 > v8)
  {
    if (v11 >= 0.0 || a5->y < v10) {
      goto LABEL_11;
    }
    uint64_t v13 = 0;
  }
  else
  {
    a5->CGFloat x = 0.0;
    if (v11 / v8 > 0.5)
    {
      a5->double y = v8 - v7;
LABEL_11:
      double v14 = 1.0;
      uint64_t v13 = 1;
      goto LABEL_14;
    }
    uint64_t v13 = 0;
    a5->double y = -v7;
  }
  double v14 = 0.0;
LABEL_14:
  [(ConversationHeaderView *)self setTargetProgress:v14];
  [(ConversationHeaderView *)self setInitialScrollPosition:1.79769313e308];
  [(ConversationHeaderView *)self setCollapsed:v13];
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v19 willMoveToSuperview:v4];
  double v5 = [(ConversationHeaderView *)self displayLink];
  [v5 invalidate];

  [(ConversationHeaderView *)self setDisplayLink:0];
  if (_UIUpdateCycleEnabled() && self->_updateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceItem = 0;
  }
  if (v4)
  {
    [(ConversationHeaderView *)self setLastUpdateTimeInterval:CACurrentMediaTime()];
    double v6 = +[CADisplayLink displayLinkWithTarget:self selector:"_displayLinkDidFire:"];
    [(ConversationHeaderView *)self setDisplayLink:v6];

    CAFrameRateRange v20 = CAFrameRateRangeMake(48.0, 120.0, 0.0);
    float minimum = v20.minimum;
    float maximum = v20.maximum;
    float preferred = v20.preferred;
    double v10 = [(ConversationHeaderView *)self displayLink];
    *(float *)&double v11 = minimum;
    *(float *)&double v12 = maximum;
    *(float *)&double v13 = preferred;
    [v10 setPreferredFrameRateRange:v11, v12, v13];

    double v14 = [(ConversationHeaderView *)self displayLink];
    [v14 setHighFrameRateReason:1245185];

    id v15 = [(ConversationHeaderView *)self displayLink];
    CGRect v16 = +[NSRunLoop mainRunLoop];
    [v15 addToRunLoop:v16 forMode:NSRunLoopCommonModes];

    if (_UIUpdateCycleEnabled())
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      objc_copyWeak(&v17, &location);
      self->_updateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_displayLinkDidFire:(id)a3
{
  id v4 = a3;
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    [v4 targetTimestamp];
    -[ConversationHeaderView _processProgressUpdatesWithTargetTimestamp:](self, "_processProgressUpdatesWithTargetTimestamp:");
  }
}

- (void)_processProgressUpdatesWithTargetTimestamp:(double)a3
{
  double v5 = sub_100067458(self);
  id v45 = [(ConversationHeaderView *)self hostScrollView];
  [(ConversationHeaderView *)self targetProgress];
  double v7 = v6;
  [(ConversationHeaderView *)self currentProgress];
  double v9 = v8;
  [(ConversationHeaderView *)self previousProgress];
  double v44 = v10;
  unsigned int v11 = [v45 isTracking];
  [v45 contentOffset];
  double v13 = v12;
  double v15 = v14;
  [(ConversationHeaderView *)self previousScrollViewContentOffset];
  double v17 = v16;
  double v19 = v18;
  unsigned int v20 = [v45 isDecelerating];
  BOOL v21 = v15 != v19 || v13 != v17;
  if (v9 - v7 >= 0.0) {
    double v22 = v9 - v7;
  }
  else {
    double v22 = -(v9 - v7);
  }
  [(ConversationHeaderView *)self lastUpdateTimeInterval];
  double v24 = v23;
  [(ConversationHeaderView *)self setLastUpdateTimeInterval:a3];
  int v25 = (v11 | ~v20) & v21;
  if (v5 <= 0.00000011920929) {
    int v25 = 0;
  }
  if (v25 != 1)
  {
    if (v22 < 2.22044605e-16) {
      goto LABEL_44;
    }
    double v35 = v7 - v9;
    goto LABEL_35;
  }
  [v45 contentOffset];
  -[ConversationHeaderView setPreviousScrollViewContentOffset:](self, "setPreviousScrollViewContentOffset:");
  [v45 contentOffset];
  double v27 = v26 + sub_1000676F0(self, v45);
  if (v27 >= v5)
  {
    double v28 = v7;
    if ([(ConversationHeaderView *)self isCollapsed]) {
      goto LABEL_14;
    }
    [v45 contentOffset];
    double v30 = v29;
    [(ConversationHeaderView *)self initialScrollPosition];
    double v27 = v30 - v31;
  }
  double v28 = fmax(fmin(v27 / v5, 1.0), 0.0);
LABEL_14:
  if (v11)
  {
    [v45 _verticalVelocity];
    if (v7 >= v28) {
      double v33 = v7;
    }
    else {
      double v33 = v28;
    }
    if (v7 >= v28) {
      double v34 = v28;
    }
    else {
      double v34 = v7;
    }
    if (v32 < 0.0) {
      double v7 = v34;
    }
    else {
      double v7 = v33;
    }
  }
  else
  {
    [(ConversationHeaderView *)self targetProgress];
    if (v36 >= v28) {
      double v7 = v28;
    }
    else {
      double v7 = v36;
    }
  }
  double v35 = v7 - v9;
  double v37 = -(v7 - v9);
  if (v7 - v9 >= 0.0) {
    double v37 = v7 - v9;
  }
  if (v37 >= 2.22044605e-16 || v22 >= 2.22044605e-16)
  {
LABEL_35:
    double v39 = (a3 - v24)
        * ((v44 - v9) / (a3 - v24)
         + ((v44 - v9) / (a3 - v24) * (1.0 / (a3 - v24) * -0.833333313) + 1.0 / (a3 - v24) * 15.0 * v35) * (a3 - v24));
    double v40 = -v39;
    if (v39 >= 0.0) {
      double v40 = v39;
    }
    double v41 = v7;
    if (v40 >= 0.00000011920929)
    {
      if (![v45 isTracking]) {
        goto LABEL_42;
      }
      double v42 = v9 - v7;
      if (v9 - v7 < 0.0) {
        double v42 = -(v9 - v7);
      }
      double v41 = v7;
      if (v42 >= 0.05) {
LABEL_42:
      }
        double v41 = v9 + v39;
    }
    sub_100067070(self);
    [(ConversationHeaderView *)self setPreviousProgress:v9];
    double v43 = fmax(fmin(v41, 1.0), 0.0);
    [(ConversationHeaderView *)self setCurrentProgress:v43];
    [(ConversationHeaderView *)self setTargetProgress:v7];
    [(ConversationHeaderView *)self _layoutLabelsForProgress:v43];
  }
LABEL_44:
}

- (double)contentHeight
{
  [(ConversationHeaderView *)self contentBaseHeight];
  return result;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_title] & 1) == 0)
  {
    id v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    double v6 = [(ConversationHeaderView *)self contentView];
    [v6 setText:self->_title];
  }
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v3 layoutMarginsDidChange];
  sub_100066F50(self);
}

- (void)contentDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v4 contentDidChange];
  objc_super v3 = [(ConversationHeaderView *)self window];

  if (v3) {
    sub_100066F50(self);
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v3 safeAreaInsetsDidChange];
  [(ConversationHeaderView *)self setDisplayMetrics:0];
  sub_1000660A0(self);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ConversationHeaderView;
  [(ConversationHeaderView *)&v6 traitCollectionDidChange:v4];
  [(ConversationHeaderView *)self setDisplayMetrics:0];
  double v5 = +[MFFontMetricCache sharedFontMetricCache];
  [v5 ensureCacheIsValid];

  sub_1000660A0(self);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  displayMetrics = self->_displayMetrics;
  if (!displayMetrics)
  {
    id v4 = [(ConversationHeaderView *)self traitCollection];
    [(ConversationHeaderView *)self layoutMargins];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(ConversationHeaderView *)self safeAreaInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    BOOL v21 = [(ConversationHeaderView *)self window];
    double v22 = [v21 windowScene];
    +[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v4, [v22 interfaceOrientation], v6, v8, v10, v12, v14, v16, v18, v20);
    double v23 = (MFMessageDisplayMetrics *)objc_claimAutoreleasedReturnValue();
    double v24 = self->_displayMetrics;
    self->_displayMetrics = v23;

    displayMetrics = self->_displayMetrics;
  }

  return displayMetrics;
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v5 = 1.0;
  uint64_t v6 = 1;
  uint64_t v7 = 2;
  if (a3) {
    uint64_t v7 = 0;
  }
  if (a3 != 1) {
    uint64_t v6 = v7;
  }
  if (a4)
  {
    double v5 = 0.0;
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v8 = 0;
  }
  -[ConversationHeaderView setAlpha:](self, "setAlpha:", v5, 0.0);
  [(ConversationHeaderView *)self _transformForLocation:v8];
  v9[0] = v9[3];
  v9[1] = v9[4];
  v9[2] = v9[5];
  [(ConversationHeaderView *)self setTransform:v9];
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v5 = 1.0;
  uint64_t v6 = 2;
  if (a3 != 1) {
    uint64_t v6 = a3 == 0;
  }
  if (a4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    double v5 = 0.0;
    uint64_t v7 = v6;
  }
  -[ConversationHeaderView setAlpha:](self, "setAlpha:", v5, 0.0);
  [(ConversationHeaderView *)self _transformForLocation:v7];
  v8[0] = v8[3];
  v8[1] = v8[4];
  v8[2] = v8[5];
  [(ConversationHeaderView *)self setTransform:v8];
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[ConversationHeaderView setTransform:](self, "setTransform:", v6, a4);
  [(ConversationHeaderView *)self setAlpha:1.0];
}

- (CGAffineTransform)_transformForLocation:(SEL)a3
{
  if (a4 == 2)
  {
    if (![(ConversationHeaderView *)self mf_prefersRightToLeftInterfaceLayout])
    {
      [(ConversationHeaderView *)self bounds];
      double Width = CGRectGetWidth(v23);
      [(ConversationHeaderView *)self layoutMargins];
      double v9 = v16;
      double v10 = [(ConversationHeaderView *)self superTitleLabel];
      [v10 frame];
      double MinX = CGRectGetMinX(v24);
      goto LABEL_10;
    }
    [(ConversationHeaderView *)self layoutMargins];
    double v13 = v12;
    double v10 = [(ConversationHeaderView *)self superTitleLabel];
    [v10 frame];
    double MaxX = CGRectGetMaxX(v21);
  }
  else
  {
    double v6 = 0.0;
    if (a4 != 1) {
      goto LABEL_12;
    }
    if ([(ConversationHeaderView *)self mf_prefersRightToLeftInterfaceLayout])
    {
      [(ConversationHeaderView *)self bounds];
      double Width = CGRectGetWidth(v19);
      [(ConversationHeaderView *)self layoutMargins];
      double v9 = v8;
      double v10 = [(ConversationHeaderView *)self superTitleLabel];
      [v10 frame];
      double MinX = CGRectGetMaxX(v20);
LABEL_10:
      double v6 = Width - v9 - MinX;
      goto LABEL_11;
    }
    [(ConversationHeaderView *)self layoutMargins];
    double v13 = v15;
    double v10 = [(ConversationHeaderView *)self superTitleLabel];
    [v10 frame];
    double MaxX = CGRectGetMinX(v22);
  }
  double v6 = v13 - MaxX;
LABEL_11:

LABEL_12:

  return CGAffineTransformMakeTranslation(retstr, v6, 0.0);
}

- (ConversationHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ConversationHeaderViewDelegate *)WeakRetained;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)superTitle
{
  return self->_superTitle;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (ConversationHeaderContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIScrollView)hostScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setHostScrollView:(id)a3
{
}

- (UILabel)superTitleLabel
{
  return self->_superTitleLabel;
}

- (void)setSuperTitleLabel:(id)a3
{
}

- (double)initialScrollPosition
{
  return self->_initialScrollPosition;
}

- (void)setInitialScrollPosition:(double)a3
{
  self->_initialScrollPosition = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (double)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(double)a3
{
  self->_currentProgress = a3;
}

- (double)targetProgress
{
  return self->_targetProgress;
}

- (double)lastUpdateTimeInterval
{
  return self->_lastUpdateTimeInterval;
}

- (void)setLastUpdateTimeInterval:(double)a3
{
  self->_lastUpdateTimeInterval = a3;
}

- (CGPoint)previousScrollViewContentOffset
{
  double x = self->_previousScrollViewContentOffset.x;
  double y = self->_previousScrollViewContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousScrollViewContentOffset:(CGPoint)a3
{
  self->_previousScrollViewContentOffset = a3;
}

- (double)contentViewTopToFirstBaseline
{
  return self->_contentViewTopToFirstBaseline;
}

- (void)setContentViewTopToFirstBaseline:(double)a3
{
  self->_contentViewTopToFirstBaseline = a3;
}

- (void)setDisplayMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_superTitleLabel, 0);
  objc_destroyWeak((id *)&self->_hostScrollView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_superTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end