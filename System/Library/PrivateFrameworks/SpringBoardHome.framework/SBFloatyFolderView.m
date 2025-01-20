@interface SBFloatyFolderView
+ (Class)_scrollViewClass;
+ (double)defaultCornerRadius;
+ (id)defaultIconLocation;
+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection;
- (BOOL)_shouldUseScrollableIconViewInteraction;
- (BOOL)_showsTitle;
- (BOOL)_tapToCloseGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)locationCountsAsInsideFolder:(CGPoint)a3;
- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9;
- (CGPoint)visibleFolderRelativeImageCenterForIcon:(id)a3;
- (CGRect)_frameForScalingView;
- (CGRect)_pageBackgroundFrameForPageRect:(CGRect)a3;
- (SBFloatyFolderView)initWithConfiguration:(id)a3;
- (UIScribbleInteraction)titleScribbleInteraction;
- (double)_rubberBandIntervalForOverscroll;
- (double)_titleFontSize;
- (double)cornerRadius;
- (id)_newPageBackgroundView;
- (id)accessibilityTintColorForBackgroundView:(id)a3;
- (id)floatyFolderConfiguration;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)legibilitySettings;
- (id)legibilitySettingsForIconListViews;
- (unint64_t)backgroundEffect;
- (void)_configureGesturesIfNecessary;
- (void)_didAddIconListView:(id)a3;
- (void)_handleLongPressGesture:(id)a3;
- (void)_handleOutsideTap:(id)a3;
- (void)_handlePinchGesture:(id)a3;
- (void)_layoutSubviews;
- (void)_setScrollViewNeedsToClipCorners:(BOOL)a3;
- (void)_updateScalingViewFrame;
- (void)_updateScrollingState:(BOOL)a3;
- (void)dealloc;
- (void)enumeratePageBackgroundViewsUsingBlock:(id)a3;
- (void)fadeContentForMagnificationFraction:(double)a3;
- (void)fadeContentForMinificationFraction:(double)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundEffect:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setTitleScribbleInteraction:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateAccessibilityTintColors;
@end

@implementation SBFloatyFolderView

+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SBFloatyFolderView;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_countOfAdditionalPagesToKeepVisibleInOneDirection) + 1;
}

- (SBFloatyFolderView)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBFloatyFolderView;
  v5 = [(SBFolderView *)&v30 initWithConfiguration:v4];
  if (v5)
  {
    v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      v5->_backgroundEffect = [v4 backgroundEffect];
    }
    v8 = objc_alloc_init(SBFloatyFolderBackgroundClipView);
    scrollClipView = v5->_scrollClipView;
    v5->_scrollClipView = v8;

    [(SBFloatyFolderBackgroundClipView *)v5->_scrollClipView setBackgroundEffect:v5->_backgroundEffect];
    v10 = [(SBFloatyFolderBackgroundClipView *)v5->_scrollClipView backgroundView];
    [v10 setDelegate:v5];

    v11 = v5->_scrollClipView;
    v12 = [(SBFolderView *)v5 scrollView];
    [(SBFloatyFolderBackgroundClipView *)v11 addSubview:v12];

    v13 = [(SBFolderView *)v5 scalingView];
    [v13 addSubview:v5->_scrollClipView];
    v14 = [(SBFolderView *)v5 pageControl];
    [v13 addSubview:v14];

    v15 = [(SBFolderView *)v5 _titleTextField];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1BB8]) initWithDelegate:v5];
    titleScribbleInteraction = v5->_titleScribbleInteraction;
    v5->_titleScribbleInteraction = (UIScribbleInteraction *)v16;

    [v15 addInteraction:v5->_titleScribbleInteraction];
    [(SBFloatyFolderView *)v5 addSubview:v15];
    v18 = [(SBFloatyFolderView *)v5 floatyFolderConfiguration];
    [v18 pageControlCustomPadding];
    double v20 = v19;
    double v22 = v21;

    v23 = [(SBFolderView *)v5 pageControl];
    v24 = v23;
    if (v20 > 0.0) {
      [v23 _setCustomHorizontalPadding:v20];
    }
    if (v22 > 0.0) {
      [v24 _setCustomVerticalPadding:v22];
    }
    v25 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v26 = [v25 folderSettings];
    folderSettings = v5->_folderSettings;
    v5->_folderSettings = (SBHFolderSettings *)v26;

    [(PTSettings *)v5->_folderSettings addKeyObserver:v5];
    [(SBFloatyFolderView *)v5 _configureGesturesIfNecessary];
    [(SBFolderView *)v5 _updateTitleLegibilitySettings];
    [(SBFolderView *)v5 _updateIconListLegibilitySettings];
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v5 selector:sel_accessibilityReduceTransparencyDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
  }
  return v5;
}

- (void)_configureGesturesIfNecessary
{
  if (!self->_tapGesture)
  {
    objc_super v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleOutsideTap_];
    tapGesture = self->_tapGesture;
    self->_tapGesture = v3;

    [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
    [(SBFloatyFolderView *)self addGestureRecognizer:self->_tapGesture];
  }
  BOOL v5 = [(SBHFolderSettings *)self->_folderSettings pinchToClose];
  pinchGesture = self->_pinchGesture;
  if (v5)
  {
    if (!pinchGesture)
    {
      v7 = (UIPinchGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__handlePinchGesture_];
      v8 = self->_pinchGesture;
      self->_pinchGesture = v7;

      [(UIPinchGestureRecognizer *)self->_pinchGesture setDelegate:self];
      [(SBFloatyFolderView *)self addGestureRecognizer:self->_pinchGesture];
    }
  }
  else if (pinchGesture)
  {
    [(UIPinchGestureRecognizer *)pinchGesture setDelegate:0];
    [(SBFloatyFolderView *)self removeGestureRecognizer:self->_pinchGesture];
    v9 = self->_pinchGesture;
    self->_pinchGesture = 0;
  }
  if (!self->_longPressGesture)
  {
    v10 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPressGesture_];
    longPressGesture = self->_longPressGesture;
    self->_longPressGesture = v10;

    [(UILongPressGestureRecognizer *)self->_longPressGesture setDelegate:self];
    [(UILongPressGestureRecognizer *)self->_longPressGesture setMinimumPressDuration:0.75];
    v12 = self->_longPressGesture;
    [(SBFloatyFolderView *)self addGestureRecognizer:v12];
  }
}

- (void)fadeContentForMinificationFraction:(double)a3
{
  BOOL v5 = [(SBFolderView *)self pageControl];
  double v6 = 1.0 - a3;
  [v5 setAlpha:v6];

  id v7 = [(SBFolderView *)self _titleTextField];
  [v7 setAlpha:v6];
}

- (id)floatyFolderConfiguration
{
  objc_super v3 = [(SBFolderView *)self listLayoutProvider];
  id v4 = [(SBFolderView *)self iconLocation];
  BOOL v5 = [v3 layoutForIconLocation:v4];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [v5 floatyFolderVisualConfiguration];
  }
  else
  {
    double v6 = objc_alloc_init(SBHFloatyFolderVisualConfiguration);
  }
  id v7 = v6;

  return v7;
}

+ (id)defaultIconLocation
{
  return @"SBIconLocationFolder";
}

- (void)_updateScalingViewFrame
{
  v3.receiver = self;
  v3.super_class = (Class)SBFloatyFolderView;
  [(SBFolderView *)&v3 _updateScalingViewFrame];
  [(SBFloatyFolderView *)self enumeratePageBackgroundViewsUsingBlock:&__block_literal_global_38_0];
}

- (void)enumeratePageBackgroundViewsUsingBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, SBFloatyFolderBackgroundClipView *, char *))a3 + 2))(a3, self->_scrollClipView, &v3);
}

void __45__SBFloatyFolderView__updateScalingViewFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 backgroundView];
  [v2 updateTintEffectColor];
}

- (void)_layoutSubviews
{
  char v3 = [(SBFloatyFolderView *)self floatyFolderConfiguration];
  [(SBFloatyFolderView *)self bounds];
  double v53 = v5;
  double v54 = v4;
  double v55 = v6;
  double v56 = v7;
  v8 = [(SBFloatyFolderView *)self traitCollection];
  [v8 displayScale];
  uint64_t v57 = v9;

  v10 = [(SBFolderView *)self scalingView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[SBFloatyFolderBackgroundClipView setFrame:](self->_scrollClipView, "setFrame:");
  -[SBFloatyFolderBackgroundClipView convertRect:fromView:](self->_scrollClipView, "convertRect:fromView:", v10, v12, v14, v16, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(SBFolderView *)self scrollView];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  v28 = [(SBFolderView *)self pageControl];
  [v3 pageControlAreaHeight];
  CGFloat v30 = v29;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v62.origin.x = v12;
  v62.origin.y = v14;
  v62.size.width = v16;
  v62.size.height = v18;
  CGRectDivide(v62, &slice, &remainder, v30, CGRectMaxYEdge);
  [v28 sizeToFit];
  UIRectGetCenter();
  objc_msgSend(v28, "setCenter:");
  [(SBFloatyFolderView *)self _frameForScalingView];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat rect = v37;
  [(SBFloatyFolderView *)self safeAreaInsets];
  CGFloat v40 = v54 + v39;
  CGFloat v42 = v53 + v41;
  CGFloat v44 = v55 - (v39 + v43);
  memset(&v59, 0, sizeof(v59));
  CGFloat v46 = v56 - (v41 + v45);
  memset(&v58, 0, sizeof(v58));
  v63.origin.x = v32;
  v63.origin.y = v34;
  v63.size.width = v36;
  v63.size.height = v38;
  double MinY = CGRectGetMinY(v63);
  v64.origin.x = v40;
  v64.origin.y = v42;
  v64.size.width = v44;
  v64.size.height = v46;
  CGFloat v48 = MinY - CGRectGetMinY(v64);
  v65.origin.x = v40;
  v65.origin.y = v42;
  v65.size.width = v44;
  v65.size.height = v46;
  CGRectDivide(v65, &v59, &v58, v48, CGRectMinYEdge);
  v49 = [(SBFolderView *)self _titleTextField];
  objc_msgSend(v49, "sizeThatFits:", v59.size.width, v59.size.height);
  double v51 = v50;
  [v3 titleHorizontalInset];
  v66.origin.x = v32;
  v66.origin.y = v34;
  v66.size.width = v36;
  v66.size.height = rect;
  CGRectGetWidth(v66);
  if (v51 > CGRectGetHeight(v59)) {
    CGRectGetHeight(v59);
  }
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  BSRectWithSize();
  [v49 setBounds:v57];
  UIRectGetCenter();
  objc_msgSend(v49, "setCenter:");
}

- (CGRect)_pageBackgroundFrameForPageRect:(CGRect)a3
{
  double v4 = [(SBFloatyFolderView *)self floatyFolderConfiguration];
  double v5 = [(SBFloatyFolderView *)self traitCollection];
  [v5 displayScale];

  [v4 contentBackgroundSize];
  UIRectCenteredIntegralRectScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  BSFloatFloorForScale();
  double v13 = v12;

  double v14 = v7;
  double v15 = v13;
  double v16 = v9;
  double v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_frameForScalingView
{
  [(SBFloatyFolderView *)self bounds];
  -[SBFloatyFolderView _pageBackgroundFrameForPageRect:](self, "_pageBackgroundFrameForPageRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void __51__SBFloatyFolderView_updateAccessibilityTintColors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 backgroundView];
  [v2 updateTintEffectColor];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (SBFloatyFolderView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if ([v7 type] == 9)
    {
      double v8 = [(SBFolderView *)self currentIconListView];
    }
    else
    {
      double v8 = self;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UILongPressGestureRecognizer *)a3;
  id v7 = a4;
  double v8 = v7;
  if ((UILongPressGestureRecognizer *)self->_tapGesture == v6)
  {
    LOBYTE(self) = [(SBFloatyFolderView *)self _tapToCloseGestureRecognizer:v6 shouldReceiveTouch:v7];
  }
  else if (self->_longPressGesture == v6)
  {
    double v9 = [v7 view];
    objc_super v10 = [(SBFolderView *)self _titleTextField];
    if (v9 == v10) {
      LODWORD(self) = ![(SBFolderView *)self isEditing];
    }
    else {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)_tapToCloseGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  [v5 locationInView:self];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(SBFloatyFolderView *)self _frameForScalingView];
  v15.double x = v7;
  v15.double y = v9;
  if (CGRectContainsPoint(v16, v15))
  {
    char v10 = 0;
  }
  else
  {
    double v11 = [v5 view];
    double v12 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    char v10 = isKindOfClass ^ 1;
  }

  return v10 & 1;
}

- (double)_titleFontSize
{
  id v2 = [(SBFloatyFolderView *)self floatyFolderConfiguration];
  [v2 titleFontSize];
  double v4 = v3;

  return v4;
}

- (BOOL)_showsTitle
{
  return 1;
}

- (BOOL)_shouldUseScrollableIconViewInteraction
{
  return 1;
}

- (void)_didAddIconListView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFloatyFolderView;
  [(SBFolderView *)&v4 _didAddIconListView:a3];
  [(SBFolderView *)self setNeedsLayout];
}

+ (Class)_scrollViewClass
{
  return (Class)self;
}

- (id)legibilitySettingsForIconListViews
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    [(SBFloatyFolderView *)self _frameForScalingView];
    double v3 = -[SBFolderView accessibilityLegibilitySettingsForRect:tintStyle:](self, "accessibilityLegibilitySettingsForRect:tintStyle:", 2);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFloatyFolderView;
    double v3 = [(SBFolderView *)&v5 legibilitySettingsForIconListViews];
  }
  return v3;
}

- (id)legibilitySettings
{
  return (id)[MEMORY[0x1E4FB21E0] sharedInstanceForStyle:1];
}

- (void)updateAccessibilityTintColors
{
  v3.receiver = self;
  v3.super_class = (Class)SBFloatyFolderView;
  [(SBFolderView *)&v3 updateAccessibilityTintColors];
  [(SBFloatyFolderView *)self enumeratePageBackgroundViewsUsingBlock:&__block_literal_global_26];
}

- (void)dealloc
{
  [(PTSettings *)self->_folderSettings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBFloatyFolderView;
  [(SBFolderView *)&v3 dealloc];
}

- (void)setBackgroundAlpha:(double)a3
{
  id v4 = [(SBFloatyFolderBackgroundClipView *)self->_scrollClipView backgroundView];
  [v4 setAlpha:a3];
}

- (void)setCornerRadius:(double)a3
{
}

+ (double)defaultCornerRadius
{
  +[SBFolderBackgroundView cornerRadiusToInsetContent];
  return result;
}

- (double)cornerRadius
{
  id v2 = [(SBFloatyFolderView *)self floatyFolderConfiguration];
  [v2 continuousCornerRadius];
  double v4 = v3;

  return v4;
}

- (CGPoint)visibleFolderRelativeImageCenterForIcon:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBFolderView *)self currentIconListView];
  if ([v5 containsIcon:v4])
  {
    [v5 centerForIcon:v4];
    double v7 = v6;
    double v9 = v8;
    char v10 = [(SBFolderView *)self scalingView];
    objc_msgSend(v10, "convertPoint:fromView:", v5, v7, v9);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFloatyFolderView;
  [(SBFolderView *)&v4 setLegibilitySettings:a3];
  [(SBFloatyFolderView *)self enumeratePageBackgroundViewsUsingBlock:&__block_literal_global_31];
}

void __44__SBFloatyFolderView_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 backgroundView];
  [v2 updateTintEffectColor];
}

- (void)setBackgroundEffect:(unint64_t)a3
{
  if ([(SBFloatyFolderView *)self backgroundEffect] != a3)
  {
    self->_backgroundEffect = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__SBFloatyFolderView_setBackgroundEffect___block_invoke;
    v5[3] = &__block_descriptor_40_e46_v24__0__SBFloatyFolderBackgroundClipView_8_B16l;
    v5[4] = a3;
    [(SBFloatyFolderView *)self enumeratePageBackgroundViewsUsingBlock:v5];
  }
}

uint64_t __42__SBFloatyFolderView_setBackgroundEffect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBackgroundEffect:*(void *)(a1 + 32)];
}

- (id)_newPageBackgroundView
{
  double v3 = objc_alloc_init(SBFloatyFolderBackgroundClipView);
  objc_super v4 = [(SBFloatyFolderBackgroundClipView *)v3 backgroundView];
  [v4 setDelegate:self];

  [(SBFloatyFolderBackgroundClipView *)v3 setBackgroundEffect:[(SBFloatyFolderView *)self backgroundEffect]];
  return v3;
}

- (BOOL)locationCountsAsInsideFolder:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBFloatyFolderView *)self _frameForScalingView];
  CGRect v10 = CGRectInset(v9, -80.0, 0.0);
  CGFloat v5 = x;
  CGFloat v6 = y;
  return CGRectContainsPoint(v10, *(CGPoint *)&v5);
}

- (double)_rubberBandIntervalForOverscroll
{
  id v2 = [(SBFloatyFolderView *)self floatyFolderConfiguration];
  [v2 rubberBandIntervalForOverscroll];
  double v4 = v3;

  return v4;
}

- (void)fadeContentForMagnificationFraction:(double)a3
{
  CGFloat v5 = [(SBFloatyFolderBackgroundClipView *)self->_scrollClipView backgroundView];
  double v6 = 1.0 - a3;
  [v5 setAlpha:v6];

  double v7 = [(SBFolderView *)self pageControl];
  [v7 setAlpha:v6];

  id v8 = [(SBFolderView *)self _titleTextField];
  [v8 setAlpha:v6];
}

- (void)_setScrollViewNeedsToClipCorners:(BOOL)a3
{
  double v4 = 0.0;
  if (a3) {
    [(SBFloatyFolderView *)self cornerRadius];
  }
  scrollClipView = self->_scrollClipView;
  [(SBFloatyFolderBackgroundClipView *)scrollClipView _setContinuousCornerRadius:v4];
}

- (void)_updateScrollingState:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView _updateScrollingState:](&v5, sel__updateScrollingState_);
  [(SBFolderView *)self _updateScrollingInteractionIsScrolling:v3];
  [(SBFloatyFolderView *)self _setScrollViewNeedsToClipCorners:v3];
}

- (void)scrollViewDidScroll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFloatyFolderView;
  id v4 = a3;
  [(SBFolderView *)&v5 scrollViewDidScroll:v4];
  -[SBFolderView _scrollingInteractionScrollViewDidScroll:](self, "_scrollingInteractionScrollViewDidScroll:", v4, v5.receiver, v5.super_class);
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  CGFloat y = a4.y;
  double x = a4.x;
  id v12 = a3;
  [v12 contentSize];
  double v14 = v13;
  [v12 bounds];
  double v16 = v15;

  if (x >= 0.0)
  {
    double v18 = v14 - v16;
    if (x > v18)
    {
      [(SBFloatyFolderView *)self _rubberBandIntervalForOverscroll];
      BSUIConstrainValueToIntervalWithRubberBand();
      double x = v18 + v19;
    }
  }
  else
  {
    [(SBFloatyFolderView *)self _rubberBandIntervalForOverscroll];
    BSUIConstrainValueToIntervalWithRubberBand();
    double x = v17;
  }
  double v20 = x;
  double v21 = y;
  result.CGFloat y = v21;
  result.double x = v20;
  return result;
}

- (void)_handleOutsideTap:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(SBFloatyFolderView *)self _frameForScalingView];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  if (![(SBFolderView *)self isEditing]
    || (v16.origin.x = v7, v16.origin.CGFloat y = v9, v16.size.width = v11, v16.size.height = v13, v5 >= CGRectGetMinY(v16)))
  {
    id v14 = [(SBFolderView *)self delegate];
    [v14 folderViewShouldClose:self withPinchGesture:0];
  }
}

- (void)_handlePinchGesture:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    double v4 = [(SBFolderView *)self delegate];
    [v4 folderViewShouldClose:self withPinchGesture:v5];
  }
}

- (void)_handleLongPressGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    id v4 = [(SBFolderView *)self delegate];
    [v4 folderViewShouldBeginEditing:self];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = objc_msgSend(a4, "view", a3);
  double v6 = [(SBFolderView *)self _titleTextField];

  if (v5 == v6) {
    return ![(SBFolderView *)self isEditing];
  }
  else {
    return 0;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_folderSettings == a3 && [a4 isEqualToString:@"pinchToClose"])
  {
    [(SBFloatyFolderView *)self _configureGesturesIfNecessary];
  }
}

- (id)accessibilityTintColorForBackgroundView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = [v4 superview];

  -[SBFloatyFolderView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  return -[SBFolderView accessibilityTintColorForRect:tintStyle:](self, "accessibilityTintColorForRect:tintStyle:", 2, v15, v17, v19, v21);
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = [(SBFloatyFolderView *)self titleScribbleInteraction];

  if (v6 == v5)
  {
    double v7 = [(SBFolderView *)self delegate];
    [v7 folderViewShouldBeginEditing:self];
  }
  return 1;
}

- (unint64_t)backgroundEffect
{
  return self->_backgroundEffect;
}

- (UIScribbleInteraction)titleScribbleInteraction
{
  return self->_titleScribbleInteraction;
}

- (void)setTitleScribbleInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleScribbleInteraction, 0);
  objc_storeStrong((id *)&self->_folderSettings, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_scrollClipView, 0);
}

@end