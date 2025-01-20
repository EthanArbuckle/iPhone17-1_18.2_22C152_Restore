@interface SXParallaxScaleSceneAnimationHandler
- (BOOL)shouldFinishAtEndOfScrollView;
- (CGRect)fillContentFrameForScale:(double)a3 andTranslation:(double)a4;
- (SXContainerComponentView)headerComponent;
- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4;
- (unint64_t)attachmentType;
- (void)ensureScalabilityOfHeaderComponentFill;
- (void)prepareAnimation;
- (void)setAttachmentType:(unint64_t)a3;
- (void)setHeaderComponent:(id)a3;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXParallaxScaleSceneAnimationHandler

- (void)prepareAnimation
{
  v8.receiver = self;
  v8.super_class = (Class)SXParallaxScaleSceneAnimationHandler;
  [(SXComponentAnimationHandler *)&v8 prepareAnimation];
  v3 = [(SXComponentAnimationHandler *)self component];
  v4 = [v3 componentViewsForRole:12 recursive:1];

  v5 = [v4 firstObject];
  [v5 setAnimationsAndBehaviorsEnabled:0];
  [(SXParallaxScaleSceneAnimationHandler *)self setHeaderComponent:v5];
  v6 = [v5 fillView];
  v7 = [v6 fill];
  -[SXParallaxScaleSceneAnimationHandler setAttachmentType:](self, "setAttachmentType:", [v7 attachment]);

  [(SXParallaxScaleSceneAnimationHandler *)self ensureScalabilityOfHeaderComponentFill];
}

- (void)ensureScalabilityOfHeaderComponentFill
{
  v3 = [(SXParallaxScaleSceneAnimationHandler *)self headerComponent];
  id v4 = [v3 fillView];

  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsReduceMotionEnabled())
  {
    [(SXParallaxScaleSceneAnimationHandler *)self fillContentFrameForScale:1.25 andTranslation:0.0];
    objc_msgSend(v4, "setContentFrame:");
  }
}

- (void)updateAnimationWithFactor:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SXParallaxScaleSceneAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v9, sel_updateAnimationWithFactor_);
  v5 = [(SXParallaxScaleSceneAnimationHandler *)self headerComponent];
  v6 = [v5 fillView];

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    [v6 originalFrame];
  }
  else
  {
    double v7 = 0.0;
    if (![(SXParallaxScaleSceneAnimationHandler *)self attachmentType])
    {
      objc_super v8 = [(SXParallaxScaleSceneAnimationHandler *)self headerComponent];
      [v8 bounds];
      double v7 = CGRectGetHeight(v10) * 0.45 * a3;
    }
    [(SXParallaxScaleSceneAnimationHandler *)self fillContentFrameForScale:(1.0 - a3) * 0.25 + 1.0 andTranslation:v7];
  }
  objc_msgSend(v6, "setContentFrame:");
}

- (CGRect)fillContentFrameForScale:(double)a3 andTranslation:(double)a4
{
  v6 = [(SXParallaxScaleSceneAnimationHandler *)self headerComponent];
  double v7 = [v6 fillView];

  [v7 originalFrame];
  double x = v22.origin.x;
  double y = v22.origin.y;
  v22.size.CGFloat width = v12 * a3;
  CGFloat width = v22.size.width;
  v22.size.CGFloat height = v13 * a3;
  CGFloat height = v22.size.height;
  double v14 = CGRectGetWidth(v22);
  [v7 originalFrame];
  CGFloat v15 = x - (v14 - CGRectGetWidth(v23)) * 0.5;
  v24.origin.double x = v15;
  v24.origin.double y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v24);
  [v7 originalFrame];
  double v17 = y - (v16 - CGRectGetHeight(v25)) * 0.5 + a4 * a3;

  double v18 = v15;
  double v19 = v17;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4
{
  v5 = [(SXComponentAnimationHandler *)self component];
  v6 = [(SXParallaxScaleSceneAnimationHandler *)self headerComponent];
  [v6 frame];
  objc_msgSend(v5, "convertRect:toView:", 0);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v20.origin.double x = v8;
  v20.origin.double y = v10;
  v20.size.CGFloat width = v12;
  v20.size.CGFloat height = v14;
  double MaxY = CGRectGetMaxY(v20);
  v21.origin.double x = v8;
  v21.origin.double y = v10;
  v21.size.CGFloat width = v12;
  v21.size.CGFloat height = v14;
  double Height = CGRectGetHeight(v21);
  if (MaxY < Height) {
    double Height = MaxY;
  }
  if (Height >= 0.0) {
    double v17 = Height;
  }
  else {
    double v17 = 0.0;
  }
  v22.origin.double x = v8;
  v22.origin.double y = v10;
  v22.size.CGFloat width = v12;
  v22.size.CGFloat height = v14;
  double v18 = 1.0 - v17 / CGRectGetHeight(v22);
  if (v18 < 0.0) {
    double v18 = 0.0;
  }
  return fmin(v18, 1.0);
}

- (BOOL)shouldFinishAtEndOfScrollView
{
  return 0;
}

- (SXContainerComponentView)headerComponent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerComponent);
  return (SXContainerComponentView *)WeakRetained;
}

- (void)setHeaderComponent:(id)a3
{
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
}

@end