@interface _UINavigationBarTransitionContext
+ (CAMediaTimingFunction)fadeInFunction;
+ (CAMediaTimingFunction)fadeOutFunction;
+ (id)contextForTransition:(int64_t)a3 withIdiom:(int64_t)a4 completion:(id)a5;
- (BOOL)allowLargeTitles;
- (BOOL)beginWithLargeTitle;
- (BOOL)beginWithTransparencyAllowed;
- (BOOL)compact;
- (BOOL)endWithLargeTitle;
- (BOOL)endWithTransparencyAllowed;
- (BOOL)isPushOperation;
- (BOOL)isRTL;
- (BOOL)observedScrollViewOffsetIsApplicable;
- (BOOL)sharesContentViewLayouts;
- (BOOL)shouldPerformTwoPartCrossfadeTransition;
- (BOOL)shouldSlideBarBackground;
- (BOOL)twoPart;
- (CGPoint)startingContentOffsetForObservedScrollView;
- (UINavigationBar)navigationBar;
- (UIView)tabBarHostedView;
- (UIView)transitionOverlayView;
- (UIView)viewFadingInFromCustomAlpha;
- (UIView)viewUsingEaseInCurve;
- (_UIBarBackground)backgroundView;
- (_UINavigationBarContentView)contentView;
- (_UINavigationBarItemStack)stack;
- (_UINavigationBarLargeTitleView)largeTitleView;
- (_UINavigationBarLayout)fromLayout;
- (_UINavigationBarLayout)toLayout;
- (_UINavigationBarModernPromptView)promptView;
- (double)backgroundAlpha;
- (id)completionHandler;
- (id)description;
- (id)prepareForInterruption;
- (int64_t)apiVersion;
- (uint64_t)_removeAllClippingViews;
- (unint64_t)_animationOptions;
- (void)_addClippingView:(uint64_t)a1;
- (void)_animateAsTwoPartsWithOverlap:(double)a3 partOne:(id)a4 partTwo:(id)a5;
- (void)_animateAsTwoPartsWithOverlapIfNecessaryPartOne:(id)a3 partTwo:(id)a4;
- (void)_animateAsTwoPartsWithoutOverlap:(id)a3 partTwo:(id)a4;
- (void)_animateBackgroundView;
- (void)_animateInProcessAsTwoPartsWithKeyframeID:(id)a3 overlap:(double)a4 partOne:(id)a5 partTwo:(id)a6;
- (void)_animateInProcessAsTwoPartsWithOverlapIfNecessaryWithKeyframeID:(id)a3 fractionComplete:(double)a4 partOne:(id)a5 partTwo:(id)a6;
- (void)_animatePalettes;
- (void)_preparePalettes;
- (void)_resetContentAndLargeTitleViewCompleted:(BOOL)a3;
- (void)_resetPalettes;
- (void)_updateIncomingLayoutWidthToMatchOutgoingLayout;
- (void)cancel;
- (void)complete;
- (void)prepare;
- (void)recordUpdates:(id)a3;
- (void)setAllLargeTitleLayoutsVisible;
- (void)setAllowLargeTitles:(BOOL)a3;
- (void)setApiVersion:(int64_t)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundView:(id)a3 isBarBackground:(BOOL)a4;
- (void)setBeginWithLargeTitle:(BOOL)a3;
- (void)setBeginWithTransparencyAllowed:(BOOL)a3;
- (void)setCompact:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContentView:(id)a3;
- (void)setEndWithLargeTitle:(BOOL)a3;
- (void)setEndWithTransparencyAllowed:(BOOL)a3;
- (void)setFromLayout:(id)a3;
- (void)setLargeTitleView:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setObservedScrollViewOffsetIsApplicable:(BOOL)a3;
- (void)setPromptView:(id)a3;
- (void)setPushOperation:(BOOL)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSharesContentViewLayouts:(BOOL)a3;
- (void)setStack:(id)a3;
- (void)setStartingContentOffsetForObservedScrollView:(CGPoint)a3;
- (void)setTabBarHostedView:(id)a3;
- (void)setToLayout:(id)a3;
- (void)setTransitionOverlayView:(id)a3;
- (void)setTwoPart:(BOOL)a3;
@end

@implementation _UINavigationBarTransitionContext

- (void)setRTL:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)isRTL
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)setCompact:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)compact
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setAllowLargeTitles:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)allowLargeTitles
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)setTwoPart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)twoPart
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setBeginWithLargeTitle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)beginWithLargeTitle
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (void)setEndWithLargeTitle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)endWithLargeTitle
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (void)setObservedScrollViewOffsetIsApplicable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)observedScrollViewOffsetIsApplicable
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)setSharesContentViewLayouts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)sharesContentViewLayouts
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (void)setBeginWithTransparencyAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)beginWithTransparencyAllowed
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (void)setEndWithTransparencyAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)endWithTransparencyAllowed
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (void)setPushOperation:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)isPushOperation
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setBackgroundView:(id)a3 isBarBackground:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_backgroundView, a3);
  if (v4) {
    __int16 v6 = 2048;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v6;
}

- (id)description
{
  __int16 v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTransitionContext;
  BOOL v4 = [(_UINavigationBarTransitionContext *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ from=%p to=%p", v4, self->_fromLayout, self->_toLayout];

  return v5;
}

- (BOOL)shouldSlideBarBackground
{
  if (self->_apiVersion < 1)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v2 = [(_UINavigationBarTransitionContext *)self navigationBar];
    int v3 = [v2 _shouldCrossFadeBackgroundVisility] ^ 1;
  }
  return v3;
}

+ (id)contextForTransition:(int64_t)a3 withIdiom:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  switch(a3)
  {
    case 0:
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"_UINavigationBarTransitionContext.m" lineNumber:213 description:@"_UINavigationBarTransitionDefault is not valid as a requested transition"];

      goto LABEL_4;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      v12 = (objc_class *)objc_opt_class();
      break;
    default:
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UINavigationBarTransitionContext.m", 217, @"Unknown transition %li", a3);

LABEL_4:
      v12 = 0;
      break;
  }
  id v13 = objc_alloc_init(v12);
  v14 = v13;
  if (a4 == 6) {
    *((_WORD *)v13 + 80) |= 0x10u;
  }
  *((_OWORD *)v13 + 8) = xmmword_186B93770;
  [v13 setCompletionHandler:v9];

  return v14;
}

- (void)recordUpdates:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v26 = v4;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    id v13 = v4;
    contentView = self->_contentView;
    if (contentView)
    {
      v15 = [(_UINavigationBarContentView *)contentView layout];
      if (!v15)
      {
        fromLayout = self->_fromLayout;
        if (fromLayout && (v15 = fromLayout->_contentViewLayout) != 0
          || (toLayout = self->_toLayout) != 0 && (v15 = toLayout->_contentViewLayout) != 0)
        {
          [(_UINavigationBarContentView *)self->_contentView adoptLayout:v15];
        }
        else
        {
          [(_UINavigationBarContentView *)self->_contentView adoptNewLayout];
          v15 = [(_UINavigationBarContentView *)self->_contentView layout];
        }
      }
      objc_storeStrong((id *)&self->_fromContentLayout, v15);
      -[_UINavigationBarLayout setContentViewLayout:]((id *)&self->_fromLayout->super.isa, v15);
      toContentLayout = self->_toContentLayout;
      self->_toContentLayout = v15;
      v19 = v15;

      -[_UINavigationBarLayout setContentViewLayout:]((id *)&self->_toLayout->super.isa, v19);
      id v13 = v26;
    }
    largeTitleView = self->_largeTitleView;
    if (largeTitleView)
    {
      v21 = [(_UINavigationBarLargeTitleView *)largeTitleView layout];
      if (!v21)
      {
        v22 = self->_fromLayout;
        if (v22 && (v21 = v22->_largeTitleViewLayout) != 0
          || (v23 = self->_toLayout) != 0 && (v21 = v23->_largeTitleViewLayout) != 0)
        {
          [(_UINavigationBarLargeTitleView *)self->_largeTitleView adoptLayout:v21];
        }
        else
        {
          [(_UINavigationBarLargeTitleView *)self->_largeTitleView adoptNewLayout];
          v21 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView layout];
        }
      }
      objc_storeStrong((id *)&self->_fromLargeTitleLayout, v21);
      -[_UINavigationBarLayout setLargeTitleViewLayout:]((id *)&self->_fromLayout->super.isa, v21);
      toLargeTitleLayout = self->_toLargeTitleLayout;
      self->_toLargeTitleLayout = v21;
      v25 = v21;

      -[_UINavigationBarLayout setLargeTitleViewLayout:]((id *)&self->_toLayout->super.isa, v25);
      id v13 = v26;
    }
    ((void (*)(void (**)(void)))v13[2])(v13);
  }
  else
  {
    [(_UINavigationBarLayout *)self->_fromLayout recordFromStateForTransition:self];
    v5 = self->_fromLayout;
    if (v5) {
      contentViewLayout = v5->_contentViewLayout;
    }
    else {
      contentViewLayout = 0;
    }
    objc_storeStrong((id *)&self->_fromContentLayout, contentViewLayout);
    objc_super v7 = self->_fromLayout;
    if (v7) {
      largeTitleViewLayout = v7->_largeTitleViewLayout;
    }
    else {
      largeTitleViewLayout = 0;
    }
    objc_storeStrong((id *)&self->_fromLargeTitleLayout, largeTitleViewLayout);
    [(_UINavigationBarLayout *)self->_toLayout prepareToRecordToState:self];
    v26[2]();
    if ([(_UINavigationBarContentViewLayout *)self->_fromContentLayout titleAlignment] == 1) {
      [(_UINavigationBarContentViewLayout *)self->_fromContentLayout replaceTitleViewWithSnapshot];
    }
    [(_UINavigationBarContentViewLayout *)self->_fromContentLayout replaceLeadingBarWithSnapshot];
    [(_UINavigationBarContentViewLayout *)self->_fromContentLayout replaceTrailingBarWithSnapshot];
    [(_UINavigationBarLayout *)self->_toLayout recordToStateForTransition:self];
    id v9 = self->_toLayout;
    if (v9) {
      v10 = v9->_contentViewLayout;
    }
    else {
      v10 = 0;
    }
    objc_storeStrong((id *)&self->_toContentLayout, v10);
    v11 = self->_toLayout;
    if (v11) {
      v12 = v11->_largeTitleViewLayout;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&self->_toLargeTitleLayout, v12);
  }
}

- (void)prepare
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0) {
    *(_WORD *)&self->___int16 flags = flags & 0xFF9F;
  }
  fromLayout = self->_fromLayout;
  if (fromLayout)
  {
    double backgroundAlpha = self->_backgroundAlpha;
    if (fromLayout->_requestedBackgroundViewAlpha != backgroundAlpha)
    {
      fromLayout->_requestedBackgroundViewAlpha = backgroundAlpha;
      [(_UINavigationBarLayout *)fromLayout _updateLayoutOutputs];
      fromLayout = self->_fromLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)fromLayout);
  toLayout = self->_toLayout;
  if (toLayout && toLayout->_layoutSize.width != 0.0) {
    goto LABEL_13;
  }
  objc_super v7 = self->_fromLayout;
  if (v7) {
    double width = v7->_layoutSize.width;
  }
  else {
    double width = 0.0;
  }
  [(_UINavigationBarLayout *)(uint64_t)toLayout setLayoutSize:10000.0];
  int v9 = *(_WORD *)&self->_flags & 0x48;
  double v10 = -[_UINavigationBarLayout layoutHeights]((uint64_t)self->_toLayout);
  if (v9 == 8) {
    double v11 = v10;
  }
  [(_UINavigationBarLayout *)(uint64_t)self->_toLayout setLayoutSize:v11];
  toLayout = self->_toLayout;
  if (toLayout)
  {
LABEL_13:
    double v12 = self->_backgroundAlpha;
    if (toLayout->_requestedBackgroundViewAlpha != v12)
    {
      toLayout->_requestedBackgroundViewAlpha = v12;
      [(_UINavigationBarLayout *)toLayout _updateLayoutOutputs];
      toLayout = self->_toLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)toLayout);
  id v13 = self->_fromLayout;
  v14 = self->_toLayout;
  navigationBar = self->_navigationBar;
  -[_UINavigationBarLayout interleaveViewsWithLayout:inNavigationBar:]((uint64_t)v13, v14, navigationBar);
}

- (BOOL)shouldPerformTwoPartCrossfadeTransition
{
  if ((*(_WORD *)&self->_flags & 0x600) == 0) {
    return 0;
  }
  toLayout = self->_toLayout;
  double v3 = 0.0;
  double chromelessTransitionProgress = 0.0;
  if (toLayout) {
    double chromelessTransitionProgress = toLayout->_chromelessTransitionProgress;
  }
  fromLayout = self->_fromLayout;
  if (fromLayout) {
    double v3 = fromLayout->_chromelessTransitionProgress;
  }
  return chromelessTransitionProgress != v3;
}

- (void)_animateBackgroundView
{
  -[UIView setFrame:](self->_backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->_toLayout));
  toLayout = self->_toLayout;
  if (toLayout)
  {
    uint64_t v4 = 184;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      uint64_t v4 = 192;
    }
    toLayout = *(_UINavigationBarLayout **)((char *)&toLayout->super.isa + v4);
  }
  v5 = toLayout;
  __int16 v6 = v5;
  objc_super v7 = self->_toLayout;
  double computedBackgroundViewAlpha = 0.0;
  double chromelessTransitionProgress = 0.0;
  if (v7) {
    double chromelessTransitionProgress = v7->_chromelessTransitionProgress;
  }
  [(_UINavigationBarLayout *)v5 setBackgroundTransitionProgress:chromelessTransitionProgress];
  double v10 = self->_toLayout;
  if (v10) {
    double computedBackgroundViewAlpha = v10->_computedBackgroundViewAlpha;
  }
  [(_UINavigationBarLayout *)v6 setBackgroundAlpha:computedBackgroundViewAlpha];
  if ((*(_WORD *)&self->_flags & 0x800) != 0) {
    [(_UIBarBackground *)self->_backgroundView setLayout:v6];
  }
  if ([(_UINavigationBarTransitionContext *)self shouldPerformTwoPartCrossfadeTransition])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59___UINavigationBarTransitionContext__animateBackgroundView__block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    _UIBarsTwoPartCrossfadeTransitionProgress(v11, 0, chromelessTransitionProgress);
  }
  else
  {
    if ((*(_WORD *)&self->_flags & 0x800) != 0) {
      [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
    }
    [(UINavigationBar *)self->_navigationBar _updatePaletteBackgroundIfNecessary];
  }
}

- (void)setAllLargeTitleLayoutsVisible
{
  [(_UINavigationBarLargeTitleViewLayout *)self->_toLargeTitleLayout setContentHidden:0];
  fromLargeTitleLayout = self->_fromLargeTitleLayout;
  [(_UINavigationBarLargeTitleViewLayout *)fromLargeTitleLayout setContentHidden:0];
}

- (void)_resetContentAndLargeTitleViewCompleted:(BOOL)a3
{
  uint64_t v4 = 72;
  if (a3) {
    uint64_t v4 = 80;
  }
  [*(id *)((char *)&self->super.isa + v4) finalizeStateFromTransition:self];
  [(_UINavigationBarContentView *)self->_contentView clearTransitionContext];
  largeTitleView = self->_largeTitleView;
  [(_UINavigationBarLargeTitleView *)largeTitleView clearTransitionContext];
}

- (void)complete
{
  [(_UINavigationBarTransitionContext *)self _resetContentAndLargeTitleViewCompleted:1];
  [(_UINavigationBarTransitionContext *)self setAllLargeTitleLayoutsVisible];
  [(_UINavigationBarLayout *)(uint64_t)self->_fromLayout removeViewsNotInLayout:self->_toLayout];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) != 0)
  {
    toLayout = self->_toLayout;
    if (toLayout)
    {
      BOOL v5 = (flags & 4) == 0;
      uint64_t v6 = 184;
      if (v5) {
        uint64_t v6 = 192;
      }
      toLayout = *(_UINavigationBarLayout **)((char *)&toLayout->super.isa + v6);
    }
    objc_super v7 = toLayout;
    [(_UIBarBackground *)self->_backgroundView setLayout:v7];

    [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
  }
  -[_UINavigationBarTransitionContext _resetPalettes]((uint64_t)self);
}

- (void)_resetPalettes
{
  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    if (v2) {
      v2 = (void *)v2[32];
    }
    double v3 = v2;
    [v3 setTransitioning:0];

    uint64_t v4 = *(void **)(a1 + 72);
    if (v4) {
      uint64_t v4 = (void *)v4[32];
    }
    BOOL v5 = v4;
    [v5 setAlpha:1.0];

    uint64_t v6 = *(void **)(a1 + 72);
    if (v6) {
      uint64_t v6 = (void *)v6[33];
    }
    objc_super v7 = v6;
    [v7 setTransitioning:0];

    v8 = *(void **)(a1 + 72);
    if (v8) {
      v8 = (void *)v8[33];
    }
    int v9 = v8;
    [v9 setAlpha:1.0];

    double v10 = *(void **)(a1 + 80);
    if (v10) {
      double v10 = (void *)v10[32];
    }
    double v11 = v10;
    [v11 setTransitioning:0];

    double v12 = *(void **)(a1 + 80);
    if (v12) {
      double v12 = (void *)v12[32];
    }
    id v13 = v12;
    [v13 setAlpha:1.0];

    v14 = *(void **)(a1 + 80);
    if (v14) {
      v14 = (void *)v14[33];
    }
    v15 = v14;
    [v15 setTransitioning:0];

    v16 = *(void **)(a1 + 80);
    if (v16) {
      v16 = (void *)v16[33];
    }
    v17 = v16;
    [v17 setAlpha:1.0];
  }
}

- (void)cancel
{
  [(_UINavigationBarTransitionContext *)self _resetContentAndLargeTitleViewCompleted:0];
  [(_UINavigationBarTransitionContext *)self setAllLargeTitleLayoutsVisible];
  [(_UINavigationBarLayout *)(uint64_t)self->_toLayout removeViewsNotInLayout:self->_fromLayout];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) != 0)
  {
    fromLayout = self->_fromLayout;
    if (fromLayout)
    {
      BOOL v5 = (flags & 4) == 0;
      uint64_t v6 = 184;
      if (v5) {
        uint64_t v6 = 192;
      }
      fromLayout = *(_UINavigationBarLayout **)((char *)&fromLayout->super.isa + v6);
    }
    objc_super v7 = fromLayout;
    [(_UIBarBackground *)self->_backgroundView setLayout:v7];

    [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
  }
  -[_UINavigationBarTransitionContext _resetPalettes]((uint64_t)self);
}

- (id)prepareForInterruption
{
  return &__block_literal_global_65;
}

- (UIView)viewFadingInFromCustomAlpha
{
  if ([(_UINavigationBarTransitionContext *)self transition] != 2) {
    goto LABEL_5;
  }
  double v3 = [(_UINavigationBarContentViewLayout *)self->_toContentLayout backButton];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = v3;
  BOOL v5 = [(_UINavigationBarContentViewLayout *)self->_fromContentLayout backButton];

  if (v5)
  {
    double v3 = [(_UINavigationBarContentViewLayout *)self->_toContentLayout backButton];
  }
  else
  {
LABEL_5:
    double v3 = 0;
  }
LABEL_6:
  return (UIView *)v3;
}

- (UIView)viewUsingEaseInCurve
{
  return 0;
}

+ (CAMediaTimingFunction)fadeInFunction
{
  if (qword_1EB25B220 != -1) {
    dispatch_once(&qword_1EB25B220, &__block_literal_global_25_0);
  }
  v2 = (void *)_MergedGlobals_67;
  return (CAMediaTimingFunction *)v2;
}

+ (CAMediaTimingFunction)fadeOutFunction
{
  if (qword_1EB25B230 != -1) {
    dispatch_once(&qword_1EB25B230, &__block_literal_global_28);
  }
  v2 = (void *)qword_1EB25B228;
  return (CAMediaTimingFunction *)v2;
}

- (void)_addClippingView:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3)
  {
    BOOL v5 = *(void **)(a1 + 168);
    v8 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_super v7 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v6;

      BOOL v5 = *(void **)(a1 + 168);
    }
    [v5 addObject:v8];
    uint64_t v4 = v8;
  }
}

- (uint64_t)_removeAllClippingViews
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(result + 168);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return [*(id *)(v1 + 168) removeAllObjects];
  }
  return result;
}

- (void)_preparePalettes
{
  if (a1)
  {
    id v2 = (void *)a1[9];
    if (v2) {
      id v2 = (void *)v2[32];
    }
    uint64_t v3 = v2;
    uint64_t v4 = (void *)a1[10];
    if (v4) {
      uint64_t v4 = (void *)v4[32];
    }
    uint64_t v5 = v4;
    uint64_t v6 = (void *)a1[10];
    if (v6)
    {
      uint64_t v7 = v6[8];
      if (v7) {
        uint64_t v8 = *(void *)(v7 + 80);
      }
      else {
        uint64_t v8 = 90;
      }
      [v6 _layoutFrameFor:v7 withOrder:v8];
    }
    objc_msgSend(a1, "_prepareTransitionFromPalette:toPalette:toPaletteFrame:", v3, v5);

    long long v9 = (void *)a1[9];
    if (v9) {
      long long v9 = (void *)v9[33];
    }
    id v13 = v9;
    long long v10 = (void *)a1[10];
    if (v10) {
      long long v10 = (void *)v10[33];
    }
    double v11 = v10;
    uint64_t v12 = (void *)a1[10];
    if (v12) {
      [v12 _layoutFrameFor:v12[9] withOrder:30];
    }
    objc_msgSend(a1, "_prepareTransitionFromPalette:toPalette:toPaletteFrame:", v13, v11);
  }
}

- (void)_animatePalettes
{
  if (a1)
  {
    id v2 = (void *)a1[9];
    if (v2) {
      id v2 = (void *)v2[32];
    }
    uint64_t v3 = v2;
    uint64_t v4 = (void *)a1[9];
    if (v4)
    {
      uint64_t v5 = v4[8];
      if (v5) {
        uint64_t v6 = *(void *)(v5 + 80);
      }
      else {
        uint64_t v6 = 90;
      }
      [v4 _layoutFrameFor:v5 withOrder:v6];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      double v10 = 0.0;
      double v12 = 0.0;
      double v14 = 0.0;
      double v8 = 0.0;
    }
    v15 = (void *)a1[10];
    if (v15) {
      v15 = (void *)v15[32];
    }
    v16 = v15;
    v17 = (void *)a1[10];
    if (v17)
    {
      uint64_t v18 = v17[8];
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 80);
      }
      else {
        uint64_t v19 = 90;
      }
      [v17 _layoutFrameFor:v18 withOrder:v19];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
    }
    else
    {
      double v23 = 0.0;
      double v25 = 0.0;
      double v27 = 0.0;
      double v21 = 0.0;
    }
    objc_msgSend(a1, "_animateFromPalette:fromPaletteFrame:toPalette:toPaletteFrame:", v3, v16, v8, v10, v12, v14, v21, v23, v25, v27);

    v28 = (void *)a1[9];
    if (v28) {
      v28 = (void *)v28[33];
    }
    v49 = v28;
    v29 = (void *)a1[9];
    if (v29)
    {
      [v29 _layoutFrameFor:v29[9] withOrder:30];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
    }
    else
    {
      double v33 = 0.0;
      double v35 = 0.0;
      double v37 = 0.0;
      double v31 = 0.0;
    }
    v38 = (void *)a1[10];
    if (v38) {
      v38 = (void *)v38[33];
    }
    v39 = v38;
    v40 = (void *)a1[10];
    if (v40)
    {
      [v40 _layoutFrameFor:v40[9] withOrder:30];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
    }
    else
    {
      double v44 = 0.0;
      double v46 = 0.0;
      double v48 = 0.0;
      double v42 = 0.0;
    }
    objc_msgSend(a1, "_animateFromPalette:fromPaletteFrame:toPalette:toPaletteFrame:", v49, v39, v31, v33, v35, v37, v42, v44, v46, v48);
  }
}

- (unint64_t)_animationOptions
{
  if ([(UINavigationBar *)self->_navigationBar _canPreemptTransition]) {
    return 327746;
  }
  else {
    return 327744;
  }
}

- (void)_animateAsTwoPartsWithOverlap:(double)a3 partOne:(id)a4 partTwo:(id)a5
{
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  if (v8 | v9)
  {
    unint64_t v10 = [(_UINavigationBarTransitionContext *)self _animationOptions];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83___UINavigationBarTransitionContext__animateAsTwoPartsWithOverlap_partOne_partTwo___block_invoke;
    v11[3] = &unk_1E52DE620;
    v11[4] = self;
    id v12 = (id)v8;
    double v14 = a3 * 0.5;
    id v13 = (id)v9;
    +[UIView animateKeyframesWithDuration:v10 delay:v11 options:0 animations:0.0 completion:0.0];
  }
}

- (void)_animateInProcessAsTwoPartsWithKeyframeID:(id)a3 overlap:(double)a4 partOne:(id)a5 partTwo:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a5;
  unint64_t v12 = (unint64_t)a6;
  if (v11 | v12)
  {
    unint64_t v13 = [(_UINavigationBarTransitionContext *)self _animationOptions];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103___UINavigationBarTransitionContext__animateInProcessAsTwoPartsWithKeyframeID_overlap_partOne_partTwo___block_invoke;
    v14[3] = &unk_1E52DE648;
    id v17 = (id)v11;
    id v15 = v10;
    v16 = self;
    double v19 = a4 * 0.5;
    id v18 = (id)v12;
    +[UIView _animateInProcessKeyframesAlongsideTransitionWithOptions:v13 animations:v14];
  }
}

- (void)_animateAsTwoPartsWithOverlapIfNecessaryPartOne:(id)a3 partTwo:(id)a4
{
  double v7 = (void (**)(void))a3;
  uint64_t v6 = (void (**)(void))a4;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    [(_UINavigationBarTransitionContext *)self _animateAsTwoPartsWithOverlap:v7 partOne:v6 partTwo:self->_twoPartAnimationOverlapDuration];
  }
  else
  {
    if (v7) {
      v7[2](v7);
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)_animateInProcessAsTwoPartsWithOverlapIfNecessaryWithKeyframeID:(id)a3 fractionComplete:(double)a4 partOne:(id)a5 partTwo:(id)a6
{
  id v12 = a3;
  id v10 = (void (**)(void, double))a5;
  unint64_t v11 = (void (**)(void, double))a6;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    [(_UINavigationBarTransitionContext *)self _animateInProcessAsTwoPartsWithKeyframeID:v12 overlap:v10 partOne:v11 partTwo:self->_twoPartAnimationOverlapDuration];
  }
  else
  {
    if (v10) {
      v10[2](v10, a4);
    }
    if (v11) {
      v11[2](v11, a4);
    }
  }
}

- (void)_animateAsTwoPartsWithoutOverlap:(id)a3 partTwo:(id)a4
{
}

- (void)_updateIncomingLayoutWidthToMatchOutgoingLayout
{
  toLayout = self->_toLayout;
  double width = 0.0;
  double height = 0.0;
  if (toLayout) {
    double height = toLayout->_layoutSize.height;
  }
  fromLayout = self->_fromLayout;
  if (fromLayout) {
    double width = fromLayout->_layoutSize.width;
  }
  [(_UINavigationBarLayout *)(uint64_t)toLayout setLayoutSize:height];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  self->_navigationBar = (UINavigationBar *)a3;
}

- (_UINavigationBarItemStack)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
}

- (int64_t)apiVersion
{
  return self->_apiVersion;
}

- (void)setApiVersion:(int64_t)a3
{
  self->_apiVersion = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void)setBackgroundAlpha:(double)a3
{
  self->_double backgroundAlpha = a3;
}

- (_UINavigationBarModernPromptView)promptView
{
  return self->_promptView;
}

- (void)setPromptView:(id)a3
{
}

- (_UINavigationBarContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (_UIBarBackground)backgroundView
{
  return self->_backgroundView;
}

- (_UINavigationBarLargeTitleView)largeTitleView
{
  return self->_largeTitleView;
}

- (void)setLargeTitleView:(id)a3
{
}

- (UIView)tabBarHostedView
{
  return self->_tabBarHostedView;
}

- (void)setTabBarHostedView:(id)a3
{
}

- (CGPoint)startingContentOffsetForObservedScrollView
{
  double x = self->_startingContentOffsetForObservedScrollView.x;
  double y = self->_startingContentOffsetForObservedScrollView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingContentOffsetForObservedScrollView:(CGPoint)a3
{
  self->_startingContentOffsetForObservedScrollView = a3;
}

- (_UINavigationBarLayout)fromLayout
{
  return self->_fromLayout;
}

- (void)setFromLayout:(id)a3
{
}

- (_UINavigationBarLayout)toLayout
{
  return self->_toLayout;
}

- (void)setToLayout:(id)a3
{
}

- (UIView)transitionOverlayView
{
  return self->_transitionOverlayView;
}

- (void)setTransitionOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_clippingViews, 0);
  objc_storeStrong((id *)&self->_toLargeTitleLayout, 0);
  objc_storeStrong((id *)&self->_fromLargeTitleLayout, 0);
  objc_storeStrong((id *)&self->_toContentLayout, 0);
  objc_storeStrong((id *)&self->_fromContentLayout, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
  objc_storeStrong((id *)&self->_fromLayout, 0);
  objc_storeStrong((id *)&self->_transitionOverlayView, 0);
  objc_storeStrong((id *)&self->_tabBarHostedView, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

@end