@interface SXParallaxComponentBehaviorHandler
- (BOOL)inFirstViewport;
- (BOOL)inLastViewport;
- (BOOL)isRotating;
- (BOOL)requiresContinuousUpdates;
- (CGRect)absoluteContentViewFrame;
- (SXParallaxComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4;
- (double)factor;
- (int)direction;
- (void)destroyWithBehaviorController:(id)a3;
- (void)setAbsoluteContentViewFrame:(CGRect)a3;
- (void)setDirection:(int)a3;
- (void)setInFirstViewport:(BOOL)a3;
- (void)setInLastViewport:(BOOL)a3;
- (void)setupWithBehaviorController:(id)a3;
- (void)updateWithBehaviorController:(id)a3;
@end

@implementation SXParallaxComponentBehaviorHandler

- (SXParallaxComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SXParallaxComponentBehaviorHandler;
  v4 = [(SXComponentBehaviorHandler *)&v10 initWithComponentView:a3 withBehavior:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SXComponentBehaviorHandler *)v4 behavior];
    [v6 factor];
    v5->_factor = v7;

    v8 = [(SXComponentBehaviorHandler *)v5 behavior];
    v5->_direction = [v8 direction];
  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SXParallaxComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v30 setupWithBehaviorController:v4];
  v5 = [(SXComponentBehaviorHandler *)self behaviorView];
  v6 = [v4 viewport];
  [v6 documentSize];
  double v8 = v7;

  v9 = [v4 viewport];
  [v9 bounds];
  CGFloat v11 = v10;
  double v13 = v12;

  CGFloat v14 = *MEMORY[0x263F00148];
  CGFloat v15 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 absoluteFrame];
    -[SXParallaxComponentBehaviorHandler setAbsoluteContentViewFrame:](self, "setAbsoluteContentViewFrame:");
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v17 = [v4 viewport];
    if (isKindOfClass)
    {
      [v5 contentFrame];
      objc_msgSend(v17, "convertRect:fromView:", v5);
      -[SXParallaxComponentBehaviorHandler setAbsoluteContentViewFrame:](self, "setAbsoluteContentViewFrame:");
    }
    else
    {
      [v5 frameUsingCenterAndBounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v29 = v15;
      double v24 = v8;
      double v26 = v25;
      v27 = [v5 superview];
      double v28 = v26;
      double v8 = v24;
      CGFloat v15 = v29;
      objc_msgSend(v17, "convertRect:fromView:", v27, v19, v21, v23, v28);
      -[SXParallaxComponentBehaviorHandler setAbsoluteContentViewFrame:](self, "setAbsoluteContentViewFrame:");
    }
  }
  [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
  v33.origin.x = v14;
  v33.origin.y = v15;
  v33.size.width = v11;
  v33.size.height = v13;
  [(SXParallaxComponentBehaviorHandler *)self setInFirstViewport:CGRectIntersectsRect(v31, v33)];
  [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
  v34.origin.x = v14;
  v34.origin.y = v8 - v13;
  v34.size.width = v11;
  v34.size.height = v13;
  [(SXParallaxComponentBehaviorHandler *)self setInLastViewport:CGRectIntersectsRect(v32, v34)];
}

- (void)updateWithBehaviorController:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SXParallaxComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v45 updateWithBehaviorController:v4];
  v5 = [(SXComponentBehaviorHandler *)self behaviorView];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v44[0] = *MEMORY[0x263F000D0];
    v44[1] = v6;
    v44[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v5 setTransform:v44];
  }
  else
  {
    double v7 = [v4 viewport];
    [v7 dynamicBounds];
    double v9 = v8;

    double v10 = [v4 viewport];
    [v10 documentSize];
    double v12 = v11;

    double v13 = [v4 viewport];
    [v13 bounds];
    double v15 = v14;
    if ([(SXParallaxComponentBehaviorHandler *)self inFirstViewport])
    {
      [v13 contentFrame];
      double v16 = v9 - CGRectGetMinY(v46);
    }
    else if ([(SXParallaxComponentBehaviorHandler *)self inLastViewport])
    {
      double v17 = 0.0;
      if (v9 >= 0.0) {
        double v17 = v9;
      }
      double v16 = -(v12 - v15 - v17);
    }
    else
    {
      [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
      double MinY = CGRectGetMinY(v47);
      double v19 = v9 + -44.0;
      if (v9 + -44.0 < 0.0) {
        double v19 = 0.0;
      }
      double v20 = MinY - v19;
      [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
      double v16 = v20 + CGRectGetHeight(v48) * 0.5 - v15 * 0.5;
    }
    [(SXParallaxComponentBehaviorHandler *)self factor];
    double v22 = v21;
    if ([(SXParallaxComponentBehaviorHandler *)self direction] != 2 || (double v23 = 0.0, v16 >= 0.0))
    {
      int v24 = [(SXParallaxComponentBehaviorHandler *)self direction];
      BOOL v25 = v16 > 0.0 && v24 == 3;
      double v23 = 0.0;
      if (!v25) {
        double v23 = v16;
      }
    }
    double v26 = 0.1;
    if (v22 != 1.79769313e308) {
      double v26 = 1.0 - v22;
    }
    double v27 = v26 * v23;
    double v28 = [(SXComponentBehaviorHandler *)self componentView];
    double v29 = [v28 presentationDelegate];
    objc_super v30 = [v29 componentController];
    CGRect v31 = [v30 presentedBlueprint];
    int v32 = [v31 isComplete];

    [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
    double v33 = v27 + CGRectGetMinY(v49);
    [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
    double v34 = v33 + CGRectGetHeight(v50);
    [v13 documentSize];
    if (v34 > v35 && v32 != 0)
    {
      v37 = [(SXComponentBehaviorHandler *)self componentView];

      if (v5 == v37)
      {
        [v13 documentSize];
        double v39 = v38;
        [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
        double v40 = v39 - CGRectGetHeight(v51);
        [(SXParallaxComponentBehaviorHandler *)self absoluteContentViewFrame];
        double v27 = v40 - CGRectGetMinY(v52);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = v5;
      [v41 originalFrame];
      CGRect v54 = CGRectOffset(v53, 0.0, v27);
      objc_msgSend(v41, "setContentFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
    }
    else
    {
      CGAffineTransformMakeTranslation(&v43, 0.0, v27);
      CGAffineTransform v42 = v43;
      [v5 setTransform:&v42];
    }
  }
}

- (void)destroyWithBehaviorController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXParallaxComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v10 destroyWithBehaviorController:a3];
  id v4 = [(SXComponentBehaviorHandler *)self behaviorView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  long long v6 = [(SXComponentBehaviorHandler *)self behaviorView];
  double v7 = v6;
  if (isKindOfClass)
  {
    [v6 originalFrame];
    objc_msgSend(v7, "setContentFrame:");
  }
  else
  {
    long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v9[0] = *MEMORY[0x263F000D0];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v6 setTransform:v9];
  }
}

- (BOOL)requiresContinuousUpdates
{
  return 1;
}

- (BOOL)isRotating
{
  return self->_isRotating;
}

- (BOOL)inFirstViewport
{
  return self->_inFirstViewport;
}

- (void)setInFirstViewport:(BOOL)a3
{
  self->_inFirstViewport = a3;
}

- (BOOL)inLastViewport
{
  return self->_inLastViewport;
}

- (void)setInLastViewport:(BOOL)a3
{
  self->_inLastViewport = a3;
}

- (CGRect)absoluteContentViewFrame
{
  double x = self->_absoluteContentViewFrame.origin.x;
  double y = self->_absoluteContentViewFrame.origin.y;
  double width = self->_absoluteContentViewFrame.size.width;
  double height = self->_absoluteContentViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAbsoluteContentViewFrame:(CGRect)a3
{
  self->_absoluteContentViewFrame = a3;
}

- (int)direction
{
  return self->_direction;
}

- (void)setDirection:(int)a3
{
  self->_direction = a3;
}

- (double)factor
{
  return self->_factor;
}

@end