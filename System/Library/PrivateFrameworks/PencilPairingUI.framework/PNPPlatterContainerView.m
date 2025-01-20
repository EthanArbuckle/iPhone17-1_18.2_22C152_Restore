@interface PNPPlatterContainerView
- (BOOL)dismissUsingAlpha;
- (BOOL)presented;
- (CGAffineTransform)_dismissedTransformForEdge:(SEL)a3;
- (CGAffineTransform)animationTranslation;
- (CGRect)dismissedFrameForViewWithSize:(CGSize)a3 edge:(unint64_t)a4 inRect:(CGRect)a5;
- (CGRect)presentedFrameForViewWithSize:(CGSize)a3 edge:(unint64_t)a4 inRect:(CGRect)a5;
- (NSDate)autoDismissDate;
- (PNPPlatterContainerView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (double)_dismissedAlphaForEdge:(double)a3;
- (double)pencilOffset;
- (double)preferredCornerRadius;
- (id)autoDismissBlock;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)dimmingState;
- (unint64_t)edge;
- (void)_updateShadowForCenteredPlatter:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAnimationTranslation:(CGAffineTransform *)a3;
- (void)setAutoDismissBlock:(id)a3;
- (void)setAutoDismissDate:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDimmingState:(int64_t)a3;
- (void)setDismissUsingAlpha:(BOOL)a3;
- (void)setEdge:(unint64_t)a3;
- (void)setPencilOffset:(double)a3;
- (void)setPreferredCornerRadius:(double)a3;
- (void)setPresented:(BOOL)a3;
@end

@implementation PNPPlatterContainerView

- (CGRect)presentedFrameForViewWithSize:(CGSize)a3 edge:(unint64_t)a4 inRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  UIRectCenteredIntegralRect();
  double v13 = v12;
  double v14 = v10;
  double v15 = v11;
  double v16 = 24.0;
  switch(a4)
  {
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      double v13 = 24.0;
      goto LABEL_5;
    case 4uLL:
      double v16 = height - (v11 + 44.0);
      goto LABEL_6;
    case 8uLL:
      double v13 = width - (v10 + 24.0);
      goto LABEL_5;
    default:
LABEL_5:
      double v16 = v9;
LABEL_6:
      v17 = [MEMORY[0x263F1C408] sharedApplication];
      unint64_t v18 = [v17 statusBarOrientation] - 3;

      if (v18 <= 1 && (a4 == 4 || a4 == 1))
      {
        [(PNPPlatterContainerView *)self pencilOffset];
        double v13 = v13 + v19;
      }
      else
      {
        v20 = [MEMORY[0x263F1C408] sharedApplication];
        unint64_t v21 = [v20 statusBarOrientation] - 1;

        if (v21 <= 1 && (a4 == 8 || a4 == 2))
        {
          [(PNPPlatterContainerView *)self pencilOffset];
          double v16 = v16 + v22;
        }
      }
      double v23 = v13;
      double v24 = v16;
      double v25 = v14;
      double v26 = v15;
      result.size.double height = v26;
      result.size.double width = v25;
      result.origin.y = v24;
      result.origin.x = v23;
      return result;
  }
}

- (CGAffineTransform)_dismissedTransformForEdge:(SEL)a3
{
  if (!a4) {
    return CGAffineTransformMakeScale(retstr, 0.9, 0.9);
  }
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return self;
}

- (double)_dismissedAlphaForEdge:(double)a3
{
  return 0.0;
}

- (CGRect)dismissedFrameForViewWithSize:(CGSize)a3 edge:(unint64_t)a4 inRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  -[PNPPlatterContainerView presentedFrameForViewWithSize:edge:inRect:](self, "presentedFrameForViewWithSize:edge:inRect:", a3.width, a3.height, a5.origin.x, a5.origin.y);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (![(PNPPlatterContainerView *)self dismissUsingAlpha])
  {
    switch(a4)
    {
      case 1uLL:
        double v12 = v12 - (v16 + 48.0);
        break;
      case 2uLL:
        double v10 = v10 - (v14 + 48.0);
        break;
      case 4uLL:
        double v12 = height + 24.0;
        break;
      case 8uLL:
        double v10 = width + 24.0;
        break;
      default:
        break;
    }
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_updateShadowForCenteredPlatter:(BOOL)a3
{
  shadowView = self->_shadowView;
  if (a3)
  {
    double v5 = 0.0;
    [(PNPPlatterShadowView *)self->_shadowView setShadowRadius:0.0];
  }
  else
  {
    v6 = [MEMORY[0x263F1C550] platterShadowColor];
    [(PNPPlatterShadowView *)shadowView setShadowColor:v6];

    -[PNPPlatterShadowView setShadowOffset:](self->_shadowView, "setShadowOffset:", 0.0, 0.0);
    [(PNPPlatterShadowView *)self->_shadowView setShadowRadius:30.0];
    double v5 = 0.1;
  }
  v7 = self->_shadowView;
  [(PNPPlatterShadowView *)v7 setShadowOpacity:v5];
}

- (void)layoutSubviews
{
  [(UIView *)self->_contentView intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  long long v62 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v63 = *MEMORY[0x263F000D0];
  *(_OWORD *)&v67.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v67.c = v62;
  long long v61 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v67.tx = v61;
  BOOL v7 = [(PNPPlatterContainerView *)self presented];
  unint64_t v8 = [(PNPPlatterContainerView *)self edge];
  [(PNPPlatterContainerView *)self bounds];
  if (v7)
  {
    -[PNPPlatterContainerView presentedFrameForViewWithSize:edge:inRect:](self, "presentedFrameForViewWithSize:edge:inRect:", v8, v4, v6, v9, v10, v11, v12);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = 1.0;
  }
  else
  {
    -[PNPPlatterContainerView dismissedFrameForViewWithSize:edge:inRect:](self, "dismissedFrameForViewWithSize:edge:inRect:", v8, v4, v6, v9, v10, v11, v12);
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
    double v20 = v25;
    [(PNPPlatterContainerView *)self _dismissedTransformForEdge:[(PNPPlatterContainerView *)self edge]];
    [(PNPPlatterContainerView *)self _dismissedAlphaForEdge:(double)[(PNPPlatterContainerView *)self edge]];
    double v21 = v26;
  }
  CGAffineTransform t1 = v67;
  long long v27 = *(_OWORD *)&self->_animationTranslation.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_animationTranslation.a;
  *(_OWORD *)&t2.c = v27;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_animationTranslation.tx;
  CGAffineTransformConcat(&v66, &t1, &t2);
  CGAffineTransform v67 = v66;
  [(PNPPlatterContainerView *)self bounds];
  double v30 = 1.0;
  if (v28 == *MEMORY[0x263F001B0] && v29 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v30 = 0.0;
    double v21 = 0.0;
  }
  [(PNPPlatterShadowView *)self->_shadowView setAlpha:v30];
  contentViewContainerView = self->_contentViewContainerView;
  *(_OWORD *)&v66.a = v63;
  *(_OWORD *)&v66.c = v62;
  *(_OWORD *)&v66.tx = v61;
  [(UIView *)contentViewContainerView setTransform:&v66];
  -[UIView setFrame:](self->_contentViewContainerView, "setFrame:", v14, v16, v18, v20);
  v32 = self->_contentViewContainerView;
  CGAffineTransform v66 = v67;
  [(UIView *)v32 setTransform:&v66];
  [(UIView *)self->_contentViewContainerView setAlpha:v21];
  v33 = [(PNPPlatterContainerView *)self contentView];
  [(UIView *)self->_contentViewContainerView bounds];
  objc_msgSend(v33, "setFrame:");

  [(PNPPlatterContainerView *)self preferredCornerRadius];
  if (v34 == -1.0)
  {
    if (v4 >= v6) {
      double v37 = v6;
    }
    else {
      double v37 = v4;
    }
    double v36 = v37 * 0.5;
  }
  else
  {
    [(PNPPlatterContainerView *)self preferredCornerRadius];
    double v36 = v35;
  }
  [(UIView *)self->_contentViewContainerView _setContinuousCornerRadius:v36];
  -[PNPPlatterShadowView setFrame:](self->_shadowView, "setFrame:", v14, v16, v18, v20);
  [(PNPPlatterShadowView *)self->_shadowView _setCornerRadius:v36];
  v38 = (void *)MEMORY[0x263F1C478];
  [(PNPPlatterShadowView *)self->_shadowView bounds];
  v39 = objc_msgSend(v38, "bezierPathWithRoundedRect:cornerRadius:");
  [(PNPPlatterShadowView *)self->_shadowView setShadowPath:v39];
  unint64_t v40 = [(PNPPlatterContainerView *)self edge];
  id v41 = [MEMORY[0x263F1C550] platterStrokeColor];
  uint64_t v42 = [v41 CGColor];
  v43 = [(UIView *)self->_contentViewContainerView layer];
  [v43 setBorderColor:v42];

  BOOL v44 = v40 == 0;
  BOOL v45 = v40 == 0;
  double v46 = 0.0;
  if (v44) {
    double v47 = 0.0;
  }
  else {
    double v47 = 0.5;
  }
  v48 = [(UIView *)self->_contentViewContainerView layer];
  [v48 setBorderWidth:v47];

  [(PNPPlatterContainerView *)self _updateShadowForCenteredPlatter:v45];
  dimmingView = self->_dimmingView;
  [(PNPPlatterContainerView *)self bounds];
  -[UIView setFrame:](dimmingView, "setFrame:");
  if ([(PNPPlatterContainerView *)self presented])
  {
    int64_t dimmingState = self->_dimmingState;
    if (dimmingState == 1)
    {
      double v46 = 0.1;
    }
    else
    {
      if (dimmingState != 2) {
        goto LABEL_26;
      }
      double v46 = 0.4;
    }
  }
  v51 = self->_dimmingView;
  v52 = [MEMORY[0x263F1C550] dimmingViewColorWithAlpha:v46];
  [(UIView *)v51 setBackgroundColor:v52];

  effectView = self->_effectView;
  if (self->_dimmingState)
  {
    [(UIVisualEffectView *)effectView setHidden:1];
    v54 = [MEMORY[0x263F1C550] platterContainerColor];
    [(UIView *)self->_contentViewContainerView setBackgroundColor:v54];
  }
  else
  {
    [(UIVisualEffectView *)effectView setHidden:0];
    v55 = [(PNPPlatterContainerView *)self traitCollection];
    uint64_t v56 = [v55 userInterfaceStyle];

    if (v56 == 2)
    {
      v57 = [MEMORY[0x263F1C550] clearColor];
      [(UIVisualEffectView *)self->_effectView setBackgroundColor:v57];
      uint64_t v58 = 1203;
    }
    else
    {
      v57 = [MEMORY[0x263F1C550] systemWhiteColor];
      v59 = [v57 colorWithAlphaComponent:0.9];
      [(UIVisualEffectView *)self->_effectView setBackgroundColor:v59];

      uint64_t v58 = 1200;
    }

    v60 = [MEMORY[0x263F1C480] effectWithStyle:v58];
    [(UIVisualEffectView *)self->_effectView setEffect:v60];

    [(UIView *)self->_contentViewContainerView bounds];
    -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
  }
LABEL_26:
}

- (void)setDimmingState:(int64_t)a3
{
  self->_int64_t dimmingState = a3;
  [(PNPPlatterContainerView *)self setNeedsLayout];
}

- (void)setContentView:(id)a3
{
  id v5 = a3;
  [(UIView *)self->_contentView removeFromSuperview];
  objc_storeStrong((id *)&self->_contentView, a3);
  if (self->_contentView) {
    -[UIView addSubview:](self->_contentViewContainerView, "addSubview:");
  }
  [(PNPPlatterContainerView *)self setNeedsLayout];
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
  [(PNPPlatterContainerView *)self setNeedsLayout];
}

- (void)setPreferredCornerRadius:(double)a3
{
  self->_preferredCornerRadius = a3;
  [(PNPPlatterContainerView *)self setNeedsLayout];
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
  [(PNPPlatterContainerView *)self setNeedsLayout];
}

- (void)setAnimationTranslation:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_animationTranslation.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_animationTranslation.c = v4;
  *(_OWORD *)&self->_animationTranslation.tx = v3;
  [(PNPPlatterContainerView *)self setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unint64_t v8 = [(PNPPlatterContainerView *)self contentView];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = [(PNPPlatterContainerView *)self contentView];
  int v14 = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  if (v14)
  {
    v17.receiver = self;
    v17.super_class = (Class)PNPPlatterContainerView;
    double v15 = -[PNPPlatterContainerView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (PNPPlatterContainerView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PNPPlatterContainerView;
  long long v3 = -[PNPPlatterContainerView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *((void *)v3 + 60) = 0xBFF0000000000000;
  long long v4 = objc_alloc_init(PNPPlatterShadowView);
  id v5 = (void *)*((void *)v3 + 52);
  *((void *)v3 + 52) = v4;

  id v6 = objc_alloc_init(MEMORY[0x263F1CB60]);
  id v7 = (void *)*((void *)v3 + 53);
  *((void *)v3 + 53) = v6;

  unint64_t v8 = (void *)*((void *)v3 + 53);
  double v9 = [MEMORY[0x263F1C550] dimmingViewColorWithAlpha:0.5];
  [v8 setBackgroundColor:v9];

  uint64_t v10 = MEMORY[0x263F000D0];
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)(v3 + 504) = *MEMORY[0x263F000D0];
  *(_OWORD *)(v3 + 520) = v11;
  *(_OWORD *)(v3 + 536) = *(_OWORD *)(v10 + 32);
  double v12 = [MEMORY[0x263F1C480] effectWithStyle:1200];
  uint64_t v13 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v12];
  int v14 = (void *)*((void *)v3 + 54);
  *((void *)v3 + 54) = v13;

  double v15 = [MEMORY[0x263F1C550] systemWhiteColor];
  double v16 = [v15 colorWithAlphaComponent:0.8];
  [*((id *)v3 + 54) setBackgroundColor:v16];

  id v17 = objc_alloc_init(MEMORY[0x263F1CB60]);
  double v18 = (void *)*((void *)v3 + 51);
  *((void *)v3 + 51) = v17;

  [*((id *)v3 + 51) setClipsToBounds:1];
  [v3 addSubview:*((void *)v3 + 53)];
  [v3 addSubview:*((void *)v3 + 52)];
  [v3 addSubview:*((void *)v3 + 51)];
  [*((id *)v3 + 51) addSubview:*((void *)v3 + 54)];

  return (PNPPlatterContainerView *)v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (id)autoDismissBlock
{
  return self->_autoDismissBlock;
}

- (void)setAutoDismissBlock:(id)a3
{
}

- (NSDate)autoDismissDate
{
  return self->_autoDismissDate;
}

- (void)setAutoDismissDate:(id)a3
{
}

- (unint64_t)edge
{
  return self->_edge;
}

- (double)preferredCornerRadius
{
  return self->_preferredCornerRadius;
}

- (BOOL)presented
{
  return self->_presented;
}

- (int64_t)dimmingState
{
  return self->_dimmingState;
}

- (double)pencilOffset
{
  return self->_pencilOffset;
}

- (void)setPencilOffset:(double)a3
{
  self->_pencilOffset = a3;
}

- (BOOL)dismissUsingAlpha
{
  return self->_dismissUsingAlpha;
}

- (void)setDismissUsingAlpha:(BOOL)a3
{
  self->_dismissUsingAlpha = a3;
}

- (CGAffineTransform)animationTranslation
{
  long long v3 = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[11].b;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissDate, 0);
  objc_storeStrong(&self->_autoDismissBlock, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentViewContainerView, 0);
}

@end