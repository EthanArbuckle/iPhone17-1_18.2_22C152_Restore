@interface SXParallaxFadeSceneAnimationHandler
- (BOOL)shouldFinishAtEndOfScrollView;
- (SXComponentView)headerComponentView;
- (UIView)overlayView;
- (double)alphaDistance;
- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4;
- (double)scrollDistance;
- (id)componentViewToAnimate;
- (unint64_t)attachmentType;
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)setAlphaDistance:(double)a3;
- (void)setAttachmentType:(unint64_t)a3;
- (void)setHeaderComponentView:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setScrollDistance:(double)a3;
- (void)startAnimation;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXParallaxFadeSceneAnimationHandler

- (void)prepareAnimation
{
  v30.receiver = self;
  v30.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  [(SXComponentAnimationHandler *)&v30 prepareAnimation];
  v3 = [(SXComponentAnimationHandler *)self component];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v29[0] = *MEMORY[0x263F000D0];
  v29[1] = v4;
  v29[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v29];

  v5 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];

  if (!v5)
  {
    v6 = [(SXComponentAnimationHandler *)self animation];
    v7 = [v6 fadeColor];
    if (v7)
    {
      v8 = [(SXComponentAnimationHandler *)self animation];
      v9 = [v8 fadeColor];
    }
    else
    {
      v9 = [MEMORY[0x263F1C550] blackColor];
    }

    v10 = [(SXComponentAnimationHandler *)self component];
    v11 = [v10 componentViewsForRole:12 recursive:1];

    v12 = [v11 firstObject];
    [v12 setAnimationsAndBehaviorsEnabled:0];
    [(SXParallaxFadeSceneAnimationHandler *)self setHeaderComponentView:v12];
    v13 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
    v14 = [v13 fillView];
    v15 = [v14 fill];
    -[SXParallaxFadeSceneAnimationHandler setAttachmentType:](self, "setAttachmentType:", [v15 attachment]);

    id v16 = objc_alloc(MEMORY[0x263F1CB60]);
    [v12 bounds];
    v17 = objc_msgSend(v16, "initWithFrame:");
    [(SXParallaxFadeSceneAnimationHandler *)self setOverlayView:v17];

    v18 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];
    [v18 setAutoresizingMask:18];

    v19 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];
    [v19 setBackgroundColor:v9];

    v20 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];
    [v20 setAlpha:0.0];

    v21 = [v12 fillView];

    if (v21)
    {
      v22 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];
      v23 = [v12 fillView];
      [v12 insertSubview:v22 aboveSubview:v23];
    }
    else
    {
      if (!v12)
      {
LABEL_10:

        goto LABEL_11;
      }
      v22 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];
      [v12 insertSubview:v22 atIndex:0];
    }

    goto LABEL_10;
  }
LABEL_11:
  v24 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
  [v24 bounds];
  double Height = CGRectGetHeight(v31);

  v26 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
  v27 = [v26 viewport];
  [v27 bounds];
  double v28 = CGRectGetHeight(v32);

  if (Height >= v28) {
    double Height = v28;
  }
  [(SXParallaxFadeSceneAnimationHandler *)self setScrollDistance:Height];
  [(SXParallaxFadeSceneAnimationHandler *)self setAlphaDistance:Height];
}

- (void)startAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  [(SXComponentAnimationHandler *)&v2 startAnimation];
}

- (void)updateAnimationWithFactor:(double)a3
{
  v44.receiver = self;
  v44.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v44, sel_updateAnimationWithFactor_);
  v5 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
  long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v41 = *MEMORY[0x263F000D0];
  *(_OWORD *)&v43.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v43.c = v40;
  long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v43.tx = v39;
  [v5 setTransform:&v43];

  v6 = [(SXComponentAnimationHandler *)self component];
  v7 = [v6 viewport];
  v8 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
  v18 = [v17 superview];
  objc_msgSend(v7, "convertRect:fromView:", v18, v10, v12, v14, v16);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  [(SXParallaxFadeSceneAnimationHandler *)self scrollDistance];
  *(float *)&double v27 = v27 * a3;
  double v28 = roundf(*(float *)&v27);
  [(SXParallaxFadeSceneAnimationHandler *)self alphaDistance];
  double v30 = v29;
  CGRect v31 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
  CGRect v32 = [v31 viewport];
  [v32 documentSize];
  double v34 = v33;

  v45.origin.x = v20;
  v45.origin.y = v22;
  v45.size.width = v24;
  v45.size.height = v26;
  double MaxY = CGRectGetMaxY(v45);
  if (![(SXParallaxFadeSceneAnimationHandler *)self attachmentType])
  {
    memset(&v43.c, 0, 32);
    if (v34 - MaxY <= v28) {
      double v36 = v34 - MaxY;
    }
    else {
      double v36 = v28;
    }
    *(_OWORD *)&v43.a = 0uLL;
    CGAffineTransformMakeTranslation(&v43, 0.0, v36);
    if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
    {
      *(_OWORD *)&v43.a = v41;
      *(_OWORD *)&v43.c = v40;
      *(_OWORD *)&v43.tx = v39;
    }
    v37 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
    CGAffineTransform v42 = v43;
    [v37 setTransform:&v42];
  }
  v38 = [(SXParallaxFadeSceneAnimationHandler *)self overlayView];
  [v38 setAlpha:v28 / v30];
}

- (void)finishAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  [(SXComponentAnimationHandler *)&v2 finishAnimation];
}

- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];

  double v10 = 0.0;
  if (v9)
  {
    double v11 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
    [v11 bounds];
    double v40 = CGRectGetHeight(v43);

    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    CGFloat v41 = width;
    CGFloat v42 = height;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double v39 = CGRectGetHeight(v44);
    double v12 = [(SXComponentAnimationHandler *)self component];
    double v13 = [v12 viewport];
    double v14 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
    [v14 frameUsingCenterAndBounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];
    CGFloat v24 = [v23 superview];
    objc_msgSend(v13, "convertRectToViewportCoordinateSpace:fromView:", v24, v16, v18, v20, v22);
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v45.origin.CGFloat x = v26;
    v45.origin.CGFloat y = v28;
    v45.size.CGFloat width = v30;
    v45.size.CGFloat height = v32;
    double MaxY = CGRectGetMaxY(v45);
    v46.origin.CGFloat x = v26;
    v46.origin.CGFloat y = v28;
    v46.size.CGFloat width = v30;
    v46.size.CGFloat height = v32;
    double v34 = CGRectGetHeight(v46);
    if (MaxY < v34) {
      double v34 = MaxY;
    }
    if (v34 >= 0.0) {
      double v35 = v34;
    }
    else {
      double v35 = 0.0;
    }
    if (v40 >= v39)
    {
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = v41;
      v49.size.CGFloat height = v42;
      double v37 = CGRectGetHeight(v49);
    }
    else
    {
      v47.origin.CGFloat x = v26;
      v47.origin.CGFloat y = v28;
      v47.size.CGFloat width = v30;
      v47.size.CGFloat height = v32;
      double v36 = CGRectGetHeight(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = v41;
      v48.size.CGFloat height = v42;
      double v37 = CGRectGetHeight(v48);
      if (v36 < v37) {
        double v37 = v36;
      }
    }
    double v10 = 1.0 - v35 / v37;
  }
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  return fmin(v10, 1.0);
}

- (id)componentViewToAnimate
{
  v7.receiver = self;
  v7.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  v3 = [(SXComponentAnimationHandler *)&v7 componentViewToAnimate];
  long long v4 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];

  if (v4)
  {
    uint64_t v5 = [(SXParallaxFadeSceneAnimationHandler *)self headerComponentView];

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)shouldFinishAtEndOfScrollView
{
  return 0;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (SXComponentView)headerComponentView
{
  return self->_headerComponentView;
}

- (void)setHeaderComponentView:(id)a3
{
}

- (double)scrollDistance
{
  return self->_scrollDistance;
}

- (void)setScrollDistance:(double)a3
{
  self->_scrollDistance = a3;
}

- (double)alphaDistance
{
  return self->_alphaDistance;
}

- (void)setAlphaDistance:(double)a3
{
  self->_alphaDistance = a3;
}

- (unint64_t)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(unint64_t)a3
{
  self->_attachmentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerComponentView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end