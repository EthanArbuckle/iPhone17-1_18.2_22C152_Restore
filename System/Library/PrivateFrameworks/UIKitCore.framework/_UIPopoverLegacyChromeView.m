@interface _UIPopoverLegacyChromeView
+ (double)arrowBase;
+ (double)arrowHeight;
- (BOOL)hasComponentViews;
- (BOOL)isPinned;
- (BOOL)useShortMode;
- (CGSize)_shadowOffset;
- (UIEdgeInsets)_shadowInsets;
- (UIView)arrowView;
- (UIView)leftCapView;
- (UIView)rightCapView;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)arrowOffset;
- (double)maxNonPinnedOffset;
- (double)minNonPinnedOffset;
- (id)_shadowPath;
- (id)backgroundEffect;
- (int64_t)_resolvedBackgroundStyle;
- (int64_t)backgroundStyle;
- (void)_configureEffectView;
- (void)_layoutArrowViewsLeftOrRight;
- (void)_layoutArrowViewsNone;
- (void)_layoutArrowViewsUpOrDown;
- (void)_loadNecessaryViews;
- (void)_removeEffectView;
- (void)_resetComponentViews;
- (void)_updateBackgroundStyle;
- (void)_updateChrome;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setArrowBackgroundColor:(id)a3;
- (void)setArrowOffset:(double)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setPopoverBackgroundColor:(id)a3;
@end

@implementation _UIPopoverLegacyChromeView

+ (double)arrowHeight
{
  return 13.0;
}

+ (double)arrowBase
{
  return 37.0;
}

- (double)minNonPinnedOffset
{
  [(id)objc_opt_class() arrowBase];
  double v4 = floor(v3 * 0.5);
  unint64_t v5 = [(_UIPopoverStandardChromeView *)self arrowDirection];
  if (v5 - 1 < 2)
  {
    [(UIView *)self bounds];
    double v8 = floor(v9 * 0.5) + -8.0 - v4;
    return -v8;
  }
  if (v5 == 4 || (double result = 0.0, v5 == 8))
  {
    [(UIView *)self bounds];
    double v8 = floor(v7 * 0.5) + -24.0 + 16.0 - v4 + -2.0;
    return -v8;
  }
  return result;
}

- (double)maxNonPinnedOffset
{
  [(id)objc_opt_class() arrowBase];
  double v4 = floor(v3 * 0.5);
  unint64_t v5 = [(_UIPopoverStandardChromeView *)self arrowDirection];
  if (v5 - 1 < 2)
  {
    [(UIView *)self bounds];
    double v8 = floor(v10 * 0.5);
    double v9 = -8.0;
    return v8 + v9 - v4;
  }
  if (v5 == 4 || (double result = 0.0, v5 == 8))
  {
    [(UIView *)self bounds];
    double v8 = floor(v7 * 0.5);
    double v9 = -10.0;
    return v8 + v9 - v4;
  }
  return result;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPopoverLegacyChromeView;
  [(UIView *)&v5 didMoveToWindow];
  double v3 = [(UIView *)self window];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45___UIPopoverLegacyChromeView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
  }
}

- (void)_layoutArrowViewsUpOrDown
{
  [(UIView *)self->_arrowView bounds];
  double v4 = v3;
  [(UIView *)self bounds];
  double v6 = v5;
  [(UIView *)self bounds];
  double v8 = v7;
  [(UIView *)self bounds];
  double MidX = CGRectGetMidX(v40);
  if ([(_UIPopoverLegacyChromeView *)self isPinned])
  {
    -[UIView setFrame:](self->_leftCapView, "setFrame:", 0.0, 0.0, v8 - v4, v6);
    arrowView = self->_arrowView;
    [(UIView *)self->_leftCapView frame];
    -[UIView setFrame:](arrowView, "setFrame:", CGRectGetMaxX(v41), 0.0, v4, v6);
    [(_UIPopoverLegacyChromeView *)self arrowOffset];
    if (v11 < 0.0)
    {
      maskView = self->_maskView;
      CATransform3DMakeScale(&v38, -1.0, 1.0, 1.0);
      CATransform3DGetAffineTransform(&v39, &v38);
      [(UIView *)maskView setTransform:&v39];
    }
  }
  else
  {
    double v13 = floor(MidX);
    [(_UIPopoverLegacyChromeView *)self arrowOffset];
    if (v14 >= 0.0)
    {
      [(_UIPopoverLegacyChromeView *)self maxNonPinnedOffset];
      double v19 = v18;
      [(_UIPopoverLegacyChromeView *)self arrowOffset];
      if (v19 < v17) {
        double v17 = v19;
      }
    }
    else
    {
      [(_UIPopoverLegacyChromeView *)self minNonPinnedOffset];
      double v16 = v15;
      [(_UIPopoverLegacyChromeView *)self arrowOffset];
      if (v16 >= v17) {
        double v17 = v16;
      }
    }
    -[UIView setFrame:](self->_arrowView, "setFrame:", v13 + v17 - floor(v4 * 0.5), 0.0, v4, v6);
    leftCapView = self->_leftCapView;
    [(UIView *)self->_arrowView frame];
    -[UIView setFrame:](leftCapView, "setFrame:", 0.0, 0.0, v21, v6);
    rightCapView = self->_rightCapView;
    [(UIView *)self->_arrowView frame];
    double MaxX = CGRectGetMaxX(v42);
    [(UIView *)self bounds];
    double v25 = v24 - v4;
    [(UIView *)self->_leftCapView frame];
    -[UIView setFrame:](rightCapView, "setFrame:", MaxX, 0.0, v25 - v26, v6);
  }
  [(UIView *)self->_arrowView frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  +[_UIPopoverLegacyChromeView arrowHeight];
  double v36 = v35;
  if ([(_UIPopoverStandardChromeView *)self arrowDirection] == 2) {
    double v37 = v34 - v36;
  }
  else {
    double v37 = v30;
  }
  -[UIView setFrame:](self->_arrowBackgroundView, "setFrame:", v28, v37, v32, v36);
}

- (void)_layoutArrowViewsLeftOrRight
{
  [(UIView *)self->_arrowView bounds];
  double MaxY = v3;
  [(UIView *)self bounds];
  double v6 = v5;
  [(UIView *)self bounds];
  double v8 = v7;
  [(UIView *)self bounds];
  double MidY = CGRectGetMidY(v34);
  if ([(_UIPopoverStandardChromeView *)self isRightArrowPinnedToTop])
  {
    -[UIView setFrame:](self->_arrowView, "setFrame:", 0.0, 0.0, v8, MaxY);
    rightCapView = self->_rightCapView;
    double MinY = v6 - MaxY;
LABEL_16:
    double v13 = MaxY;
    goto LABEL_17;
  }
  if ([(_UIPopoverStandardChromeView *)self isRightArrowPinnedToBottom])
  {
    -[UIView setFrame:](self->_arrowView, "setFrame:", 0.0, v6 - MaxY, v8, MaxY);
    leftCapView = self->_leftCapView;
    [(UIView *)self->_arrowView frame];
    double MinY = CGRectGetMinY(v35);
    double v13 = 0.0;
    rightCapView = leftCapView;
LABEL_17:
    double v14 = v8;
    goto LABEL_18;
  }
  if (![(_UIPopoverLegacyChromeView *)self useShortMode])
  {
    double v15 = floor(MidY);
    [(_UIPopoverLegacyChromeView *)self arrowOffset];
    if (v16 >= 0.0)
    {
      [(_UIPopoverLegacyChromeView *)self maxNonPinnedOffset];
      double v21 = v20;
      [(_UIPopoverLegacyChromeView *)self arrowOffset];
      if (v21 < v19) {
        double v19 = v21;
      }
    }
    else
    {
      [(_UIPopoverLegacyChromeView *)self minNonPinnedOffset];
      double v18 = v17;
      [(_UIPopoverLegacyChromeView *)self arrowOffset];
      if (v18 >= v19) {
        double v19 = v18;
      }
    }
    -[UIView setFrame:](self->_arrowView, "setFrame:", 0.0, v15 + v19 - floor(MaxY * 0.5), v8, MaxY);
    v22 = self->_leftCapView;
    [(UIView *)self->_arrowView frame];
    -[UIView setFrame:](v22, "setFrame:", 0.0, 0.0, v8, CGRectGetMinY(v36));
    v23 = self->_rightCapView;
    [(UIView *)self->_arrowView frame];
    double MaxY = CGRectGetMaxY(v37);
    [(UIView *)self->_arrowView frame];
    double MinY = v6 - CGRectGetMaxY(v38);
    rightCapView = v23;
    goto LABEL_16;
  }
  rightCapView = self->_arrowView;
  double v13 = 2.0;
  if (self->_blurView) {
    double v13 = 0.0;
  }
  double v14 = v8;
  double MinY = MaxY;
LABEL_18:
  -[UIView setFrame:](rightCapView, "setFrame:", 0.0, v13, v14, MinY);
  [(UIView *)self->_arrowView frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  +[_UIPopoverLegacyChromeView arrowHeight];
  -[UIView setFrame:](self->_arrowBackgroundView, "setFrame:", v27 - v30, v25, v30, v29);
  if ([(_UIPopoverStandardChromeView *)self arrowDirection] == 4)
  {
    maskView = self->_maskView;
    CATransform3DMakeScale(&v32, -1.0, 1.0, 1.0);
    CATransform3DGetAffineTransform(&v33, &v32);
    [(UIView *)maskView setTransform:&v33];
  }
}

- (void)_layoutArrowViewsNone
{
  [(UIView *)self bounds];
  CGRectGetMidX(v10);
  UIRoundToViewScale(self);
  double v4 = v3;
  [(UIView *)self bounds];
  double v6 = v5;
  -[UIView setFrame:](self->_leftCapView, "setFrame:", 0.0, 0.0, v4);
  rightCapView = self->_rightCapView;
  [(UIView *)self bounds];
  double v8 = CGRectGetWidth(v11) - v4;
  -[UIView setFrame:](rightCapView, "setFrame:", v4, 0.0, v8, v6);
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_blurView, "setFrame:");
  [(UIView *)self->_blurView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGRect v11 = [(UIView *)self->_blurView maskView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if ([(_UIPopoverStandardChromeView *)self arrowDirection] != -1)
  {
    BOOL wasPinned = self->_wasPinned;
    [(_UIPopoverLegacyChromeView *)self arrowOffset];
    if (wasPinned != -[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
    {
      [(_UIPopoverLegacyChromeView *)self _resetComponentViews];
      [(_UIPopoverLegacyChromeView *)self _loadNecessaryViews];
    }
  }
  self->_BOOL wasPinned = [(_UIPopoverLegacyChromeView *)self isPinned];
  switch([(_UIPopoverStandardChromeView *)self arrowDirection])
  {
    case 0uLL:
      [(_UIPopoverLegacyChromeView *)self _layoutArrowViewsNone];
      break;
    case 1uLL:
    case 2uLL:
      [(_UIPopoverLegacyChromeView *)self _layoutArrowViewsUpOrDown];
      break;
    case 4uLL:
    case 8uLL:
      [(_UIPopoverLegacyChromeView *)self _layoutArrowViewsLeftOrRight];
      break;
    default:
      double v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      double v15 = _NSFullMethodName();
      [v13 raise:v14, @"%@: Cannot lay out popover chrome with unrecognized direction or UIPopoverArrowDirectionUnknown.", v15 format];

      break;
  }
  v19.receiver = self;
  v19.super_class = (Class)_UIPopoverLegacyChromeView;
  [(UIPopoverBackgroundView *)&v19 layoutSubviews];
  [(_UIPopoverLegacyChromeView *)self _updateBackgroundStyle];
  double v16 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];

  if (v16)
  {
    maskView = self->_maskView;
    double v18 = [(UIVisualEffectView *)self->_blurView contentView];
    [v18 frame];
    -[UIView setFrame:](maskView, "setFrame:");
  }
}

- (double)arrowOffset
{
  BOOL v3 = [(_UIPopoverLegacyChromeView *)self useShortMode];
  double result = 0.0;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPopoverLegacyChromeView;
    [(_UIPopoverStandardChromeView *)&v5 arrowOffset];
  }
  return result;
}

- (void)setArrowOffset:(double)a3
{
  if (![(_UIPopoverLegacyChromeView *)self useShortMode])
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPopoverLegacyChromeView;
    [(_UIPopoverStandardChromeView *)&v5 setArrowOffset:a3];
    [(UIView *)self setNeedsLayout];
  }
}

- (UIEdgeInsets)_shadowInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPath
{
  return 0;
}

- (void)_updateChrome
{
  BOOL v3 = [(UIPopoverBackgroundView *)self _chromeHidden];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  [(UIView *)self->_blurView setAlpha:v4];
  id v5 = [(_UIPopoverLegacyChromeView *)self backgroundEffect];
  [(UIVisualEffectView *)self->_blurView setEffect:v5];
}

- (BOOL)useShortMode
{
  if ([(_UIPopoverStandardChromeView *)self arrowDirection] == 1
    || [(_UIPopoverStandardChromeView *)self arrowDirection] == 2)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverLegacyChromeView;
  return [(_UIPopoverStandardChromeView *)&v4 useShortMode];
}

- (void)_configureEffectView
{
  if (self->_blurView)
  {
    [(_UIPopoverLegacyChromeView *)self _updateChrome];
  }
  else
  {
    BOOL v3 = [UIVisualEffectView alloc];
    objc_super v4 = [(_UIPopoverLegacyChromeView *)self backgroundEffect];
    id v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];
    blurView = self->_blurView;
    self->_blurView = v5;

    BOOL v7 = [(UIPopoverBackgroundView *)self _chromeHidden];
    double v8 = 1.0;
    if (v7) {
      double v8 = 0.0;
    }
    [(UIView *)self->_blurView setAlpha:v8];
    [(UIVisualEffectView *)self->_blurView _setUseLiveMasking:1];
    double v9 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
    double v10 = [(UIVisualEffectView *)self->_blurView contentView];
    [v10 setBackgroundColor:v9];
  }
  CGRect v11 = self->_blurView;
  [(UIView *)self insertSubview:v11 atIndex:0];
}

- (void)_removeEffectView
{
  [(UIView *)self->_blurView removeFromSuperview];
  blurView = self->_blurView;
  self->_blurView = 0;
}

- (id)backgroundEffect
{
  int64_t backgroundStyle = self->_backgroundStyle;
  switch(backgroundStyle)
  {
    case 100:
      BOOL v3 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
      uint64_t v4 = 1200;
      goto LABEL_7;
    case 7:
      BOOL v3 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
      uint64_t v4 = 99;
      goto LABEL_7;
    case 6:
      BOOL v3 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
      uint64_t v4 = 0;
LABEL_7:
      id v5 = +[_UIPopoverBackgroundVisualEffect effectWithStyle:v4 tint:v3];

      goto LABEL_9;
  }
  id v5 = 0;
LABEL_9:
  return v5;
}

- (int64_t)backgroundStyle
{
  return self->_requestedBackgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_requestedBackgroundStyle = a3;
  [(_UIPopoverLegacyChromeView *)self _updateBackgroundStyle];
}

- (int64_t)_resolvedBackgroundStyle
{
  int64_t result = self->_requestedBackgroundStyle;
  if ((unint64_t)(result - 8) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (dyld_program_sdk_at_least())
    {
      return 100;
    }
    else
    {
      uint64_t v4 = [(UIView *)self traitCollection];
      uint64_t v5 = [v4 userInterfaceStyle];

      if (v5 == 2) {
        return 7;
      }
      else {
        return 6;
      }
    }
  }
  return result;
}

- (void)_updateBackgroundStyle
{
  int64_t v3 = [(_UIPopoverLegacyChromeView *)self _resolvedBackgroundStyle];
  if (v3 != self->_backgroundStyle)
  {
    int64_t v4 = v3;
    self->_int64_t backgroundStyle = v3;
    uint64_t v5 = [(UIView *)self window];

    if (v5)
    {
      double v24 = [[_UIPopoverViewArtworkLoader alloc] initWithBackgroundStyle:v4];
      double v6 = self->_leftCapView;
      BOOL v7 = [(UIView *)v6 directionSelector];
      BOOL v8 = [(_UIPopoverLegacyChromeView *)self useShortMode];
      double v9 = [(UIView *)self traitCollection];
      double v10 = [(_UIPopoverViewArtworkLoader *)v24 templateImageForDirection:v7 shortArtwork:v8 traitCollection:v9];

      CGRect v11 = [(UIView *)v6 layer];
      objc_msgSend(v11, "setContents:", objc_msgSend(v10, "CGImage"));

      v12 = self->_arrowView;
      double v13 = [(UIView *)v12 directionSelector];
      BOOL v14 = [(_UIPopoverLegacyChromeView *)self useShortMode];
      double v15 = [(UIView *)self traitCollection];
      double v16 = [(_UIPopoverViewArtworkLoader *)v24 templateImageForDirection:v13 shortArtwork:v14 traitCollection:v15];

      double v17 = [(UIView *)v12 layer];
      objc_msgSend(v17, "setContents:", objc_msgSend(v16, "CGImage"));

      double v18 = self->_rightCapView;
      objc_super v19 = [(UIView *)v18 directionSelector];
      BOOL v20 = [(_UIPopoverLegacyChromeView *)self useShortMode];
      double v21 = [(UIView *)self traitCollection];
      v22 = [(_UIPopoverViewArtworkLoader *)v24 templateImageForDirection:v19 shortArtwork:v20 traitCollection:v21];

      v23 = [(UIView *)v18 layer];

      objc_msgSend(v23, "setContents:", objc_msgSend(v22, "CGImage"));
      if ((unint64_t)(v4 - 6) < 2 || v4 == 100) {
        [(_UIPopoverLegacyChromeView *)self _configureEffectView];
      }
      else {
        [(_UIPopoverLegacyChromeView *)self _removeEffectView];
      }
    }
  }
}

- (void)_resetComponentViews
{
  [(UIView *)self->_leftCapView removeFromSuperview];
  leftCapView = self->_leftCapView;
  self->_leftCapView = 0;

  [(UIView *)self->_rightCapView removeFromSuperview];
  rightCapView = self->_rightCapView;
  self->_rightCapView = 0;

  [(UIView *)self->_arrowView removeFromSuperview];
  arrowView = self->_arrowView;
  self->_arrowView = 0;
}

- (void)_loadNecessaryViews
{
  if (![(_UIPopoverLegacyChromeView *)self hasComponentViews])
  {
    v54 = [[_UIPopoverViewArtworkLoader alloc] initWithBackgroundStyle:self->_backgroundStyle];
    switch([(_UIPopoverStandardChromeView *)self arrowDirection])
    {
      case 0uLL:
        int64_t v4 = [(_UIPopoverViewArtworkLoader *)v54 bottomArrowLeftEndCapView];
        leftCapView = self->_leftCapView;
        self->_leftCapView = v4;

        int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 bottomArrowRightEndCapView];
        uint64_t v6 = 560;
        goto LABEL_23;
      case 1uLL:
        BOOL v7 = [(_UIPopoverViewArtworkLoader *)v54 topArrowLeftEndCapView];
        BOOL v8 = self->_leftCapView;
        self->_leftCapView = v7;

        [(_UIPopoverLegacyChromeView *)self arrowOffset];
        if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
        {
          int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 topArrowPinnedView];
          goto LABEL_10;
        }
        v23 = [(_UIPopoverViewArtworkLoader *)v54 topArrowView];
        arrowView = self->_arrowView;
        self->_arrowView = v23;

        int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 topArrowRightEndCapView];
        goto LABEL_22;
      case 2uLL:
        double v9 = [(_UIPopoverViewArtworkLoader *)v54 bottomArrowLeftEndCapView];
        double v10 = self->_leftCapView;
        self->_leftCapView = v9;

        [(_UIPopoverLegacyChromeView *)self arrowOffset];
        if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
        {
          int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 bottomArrowPinnedView];
          goto LABEL_10;
        }
        double v25 = [(_UIPopoverViewArtworkLoader *)v54 bottomArrowView];
        double v26 = self->_arrowView;
        self->_arrowView = v25;

        int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 bottomArrowRightEndCapView];
        goto LABEL_22;
      case 4uLL:
      case 8uLL:
        if ([(_UIPopoverLegacyChromeView *)self useShortMode])
        {
          int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 shortRightArrowView];
LABEL_10:
          uint64_t v6 = 544;
        }
        else
        {
          [(_UIPopoverLegacyChromeView *)self arrowOffset];
          if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:")
            && ([(_UIPopoverLegacyChromeView *)self arrowOffset], v14 < 0.0))
          {
            double v15 = [(_UIPopoverViewArtworkLoader *)v54 rightArrowPinnedTopView];
            uint64_t v16 = 544;
          }
          else
          {
            [(_UIPopoverLegacyChromeView *)self arrowOffset];
            if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
            {
              [(_UIPopoverLegacyChromeView *)self arrowOffset];
              if (v17 > 0.0)
              {
                double v18 = [(_UIPopoverViewArtworkLoader *)v54 rightArrowPinnedBottomView];
                objc_super v19 = self->_arrowView;
                self->_arrowView = v18;

                int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 rightArrowTopEndCapView];
                uint64_t v6 = 552;
                goto LABEL_23;
              }
            }
            BOOL v20 = [(_UIPopoverViewArtworkLoader *)v54 rightArrowView];
            double v21 = self->_arrowView;
            self->_arrowView = v20;

            double v15 = [(_UIPopoverViewArtworkLoader *)v54 rightArrowTopEndCapView];
            uint64_t v16 = 552;
          }
          v22 = *(Class *)((char *)&self->super.super.super.super.super.isa + v16);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v16) = v15;

          int64_t v3 = [(_UIPopoverViewArtworkLoader *)v54 rightArrowBottomEndCapView];
LABEL_22:
          uint64_t v6 = 560;
        }
LABEL_23:
        double v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v6);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = v3;
LABEL_24:

        int64_t backgroundStyle = self->_backgroundStyle;
        if ((unint64_t)(backgroundStyle - 6) < 2 || backgroundStyle == 100)
        {
          double v28 = self;
          [(_UIPopoverLegacyChromeView *)v28 _configureEffectView];
          [(UIView *)v28 bounds];
          -[UIView setFrame:](v28->_blurView, "setFrame:");
          double v29 = [UIView alloc];
          double v30 = [(UIVisualEffectView *)v28->_blurView contentView];

          [v30 frame];
          double v31 = -[UIView initWithFrame:](v29, "initWithFrame:");

          [(UIView *)v31 setUserInteractionEnabled:0];
          arrowBackgroundView = v28->_arrowBackgroundView;
          if (!arrowBackgroundView)
          {
            CGAffineTransform v33 = objc_alloc_init(UIView);
            CGRect v34 = v28->_arrowBackgroundView;
            v28->_arrowBackgroundView = v33;

            arrowBackgroundView = v28->_arrowBackgroundView;
          }
          CGRect v35 = [(UIView *)arrowBackgroundView superview];
          CGRect v36 = [(UIVisualEffectView *)v28->_blurView contentView];

          if (v35 != v36)
          {
            CGRect v37 = [(UIVisualEffectView *)v28->_blurView contentView];
            [v37 addSubview:v28->_arrowBackgroundView];
          }
          CGRect v38 = v28->_arrowBackgroundView;
          CGAffineTransform v39 = [(_UIPopoverStandardChromeView *)v28 arrowBackgroundColor];
          [(UIView *)v38 setBackgroundColor:v39];

          int v40 = 1;
        }
        else
        {
          double v31 = self;
          int v40 = 0;
        }
        uint64_t v41 = [(UIView *)self->_arrowView superview];
        if ((_UIPopoverLegacyChromeView *)v41 == v31)
        {
        }
        else
        {
          CGRect v42 = (void *)v41;
          unint64_t v43 = [(_UIPopoverStandardChromeView *)self arrowDirection];

          if (v43) {
            [(UIView *)v31 addSubview:self->_arrowView];
          }
        }
        v44 = [(UIView *)self->_leftCapView superview];

        if (v44 != v31) {
          [(UIView *)v31 addSubview:self->_leftCapView];
        }
        v45 = [(UIView *)self->_rightCapView superview];

        if (v45 != v31) {
          [(UIView *)v31 addSubview:self->_rightCapView];
        }
        if (v40)
        {
          v46 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];

          if (v46)
          {
            v47 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];
            [v47 setMaskView:v31];
          }
          else
          {
            [(UIView *)self->_blurView setMaskView:v31];
          }
        }
        objc_storeStrong((id *)&self->_maskView, v31);
        if ([(_UIPopoverStandardChromeView *)self isDebugModeEnabled])
        {
          v48 = self->_arrowView;
          v49 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
          [(UIView *)v48 setBackgroundColor:v49];

          v50 = self->_leftCapView;
          v51 = +[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
          [(UIView *)v50 setBackgroundColor:v51];

          rightCapView = self->_rightCapView;
          v53 = +[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
          [(UIView *)rightCapView setBackgroundColor:v53];
        }

        break;
      default:
        CGRect v11 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v12 = *MEMORY[0x1E4F1C3C8];
        double v13 = _NSFullMethodName();
        [v11 raise:v12, @"%@: Cannot load popover chrome with unrecognized direction or UIPopoverArrowDirectionUnknown.", v13 format];
        goto LABEL_24;
    }
  }
}

- (BOOL)hasComponentViews
{
  return self->_arrowView || self->_leftCapView || self->_rightCapView != 0;
}

- (BOOL)isPinned
{
  [(_UIPopoverLegacyChromeView *)self arrowOffset];
  BOOL v3 = -[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:");
  if (v3)
  {
    if (self->_arrowView)
    {
      rightCapView = self->_rightCapView;
      BOOL v5 = self->_leftCapView == 0;
      BOOL v6 = rightCapView == 0;
      if (rightCapView) {
        LOBYTE(v7) = 1;
      }
      else {
        BOOL v7 = self->_leftCapView == 0;
      }
      if (v6) {
        BOOL v5 = 0;
      }
      LOBYTE(v3) = !v7 || v5;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIPopoverLegacyChromeView;
  id v4 = a3;
  [(_UIPopoverStandardChromeView *)&v8 setPopoverBackgroundColor:v4];
  if (self->_blurView)
  {
    BOOL v5 = [(_UIPopoverLegacyChromeView *)self backgroundEffect];
    [(UIVisualEffectView *)self->_blurView setEffect:v5];
    self->_popoverBackgroundColorIsOpaque = [v5 tintColorIsTranslucent] ^ 1;

    blurView = self->_blurView;
  }
  else
  {
    blurView = 0;
  }
  BOOL v7 = [(UIVisualEffectView *)blurView contentView];
  [v7 setBackgroundColor:v4];
}

- (void)setArrowBackgroundColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIPopoverLegacyChromeView;
  [(_UIPopoverStandardChromeView *)&v6 setArrowBackgroundColor:v4];
  arrowBackgroundView = self->_arrowBackgroundView;
  if (arrowBackgroundView) {
    [(UIView *)arrowBackgroundView setBackgroundColor:v4];
  }
}

- (UIView)arrowView
{
  return self->_arrowView;
}

- (UIView)leftCapView
{
  return self->_leftCapView;
}

- (UIView)rightCapView
{
  return self->_rightCapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCapView, 0);
  objc_storeStrong((id *)&self->_leftCapView, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
}

@end