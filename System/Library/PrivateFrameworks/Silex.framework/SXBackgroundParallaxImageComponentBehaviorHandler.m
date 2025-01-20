@interface SXBackgroundParallaxImageComponentBehaviorHandler
- (SXBackgroundParallaxImageComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4;
- (UIView)clippingView;
- (UIView)windowedScrollContentView;
- (double)amplitude;
- (double)originalYCenter;
- (unint64_t)viewHierarchyIndex;
- (void)destroyWindowedScroll;
- (void)destroyWithBehaviorController:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setOriginalYCenter:(double)a3;
- (void)setViewHierarchyIndex:(unint64_t)a3;
- (void)setWindowedScrollContentView:(id)a3;
- (void)setupWindowedScroll;
- (void)setupWithBehaviorController:(id)a3;
- (void)updateWithBehaviorController:(id)a3;
@end

@implementation SXBackgroundParallaxImageComponentBehaviorHandler

- (SXBackgroundParallaxImageComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  v4 = [(SXComponentBehaviorHandler *)&v9 initWithComponentView:a3 withBehavior:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SXComponentBehaviorHandler *)v4 behavior];
    [v6 amplitude];
    v5->_amplitude = v7;

    v5->_viewHierarchyIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v4 setupWithBehaviorController:a3];
  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self setupWindowedScroll];
}

- (void)updateWithBehaviorController:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v33 updateWithBehaviorController:v4];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    v5 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
    [v5 center];
    double v7 = v6;
    [(SXBackgroundParallaxImageComponentBehaviorHandler *)self originalYCenter];
    double v9 = v8;
  }
  else
  {
    [(SXBackgroundParallaxImageComponentBehaviorHandler *)self amplitude];
    double v11 = v10;
    v12 = [v4 viewport];
    [v12 dynamicBounds];

    v13 = [v4 viewport];
    [v13 bounds];
    double v15 = v14;

    v16 = [v4 viewport];
    v17 = [(SXComponentBehaviorHandler *)self componentView];
    [v17 center];
    double v19 = v18;
    double v21 = v20;
    v22 = [(SXComponentBehaviorHandler *)self componentView];
    v23 = [v22 superview];
    objc_msgSend(v16, "convertPoint:fromView:", v23, v19, v21);
    double v25 = v24;

    v26 = [v4 viewport];
    [v26 dynamicBounds];
    double v28 = v25 - v27;

    double v29 = v28 / v15 * 2.0 + -1.0;
    v5 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
    [v5 center];
    double v7 = v30;
    [(SXBackgroundParallaxImageComponentBehaviorHandler *)self originalYCenter];
    double v9 = v31 - v29 * v11;
  }
  v32 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  objc_msgSend(v32, "setCenter:", v7, v9);
}

- (void)setupWindowedScroll
{
  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self amplitude];
  double v4 = v3;
  v5 = [(SXComponentBehaviorHandler *)self behaviorView];
  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self setWindowedScrollContentView:v5];

  double v6 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [(SXBackgroundParallaxImageComponentBehaviorHandler *)self setClippingView:v7];

    double v8 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];
    [v8 setClipsToBounds:1];
  }
  double v9 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];
  double v10 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  [v10 frame];
  objc_msgSend(v9, "setFrame:");

  double v11 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  [v11 bounds];
  CGRect v34 = CGRectInset(v33, -v4, -v4);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  uint64_t v16 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  objc_msgSend((id)v16, "setFrame:", x, y, width, height);

  v17 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  objc_opt_class();
  LOBYTE(v16) = objc_opt_isKindOfClass();

  if (v16)
  {
    double v18 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
    double v19 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
    [v19 frame];
    objc_msgSend(v18, "fillFrameWithBoundingSize:", v20, v21);
    objc_msgSend(v18, "setContentFrame:");
  }
  v22 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  [v22 frame];
  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self setOriginalYCenter:CGRectGetMidY(v35)];

  v23 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  double v24 = [v23 superview];
  double v25 = [v24 subviews];
  v26 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  -[SXBackgroundParallaxImageComponentBehaviorHandler setViewHierarchyIndex:](self, "setViewHierarchyIndex:", [v25 indexOfObject:v26]);

  double v27 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  double v28 = [v27 superview];
  double v29 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];
  objc_msgSend(v28, "insertSubview:atIndex:", v29, -[SXBackgroundParallaxImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

  id v31 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];
  double v30 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  [v31 addSubview:v30];
}

- (void)destroyWindowedScroll
{
  double v3 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];
  double v4 = [v3 superview];
  v5 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  objc_msgSend(v4, "insertSubview:atIndex:", v5, -[SXBackgroundParallaxImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

  double v6 = [(SXComponentBehaviorHandler *)self componentView];
  id v7 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  double v8 = [(SXComponentBehaviorHandler *)self behavior];
  [v6 originalFrameForContentView:v7 behavior:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self windowedScrollContentView];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self setWindowedScrollContentView:0];
  double v18 = [(SXBackgroundParallaxImageComponentBehaviorHandler *)self clippingView];
  [v18 removeFromSuperview];

  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self setViewHierarchyIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)destroyWithBehaviorController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v4 destroyWithBehaviorController:a3];
  [(SXBackgroundParallaxImageComponentBehaviorHandler *)self destroyWindowedScroll];
}

- (UIView)windowedScrollContentView
{
  return self->_windowedScrollContentView;
}

- (void)setWindowedScrollContentView:(id)a3
{
}

- (double)originalYCenter
{
  return self->_originalYCenter;
}

- (void)setOriginalYCenter:(double)a3
{
  self->_originalYCenter = a3;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (unint64_t)viewHierarchyIndex
{
  return self->_viewHierarchyIndex;
}

- (void)setViewHierarchyIndex:(unint64_t)a3
{
  self->_viewHierarchyIndedouble x = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_windowedScrollContentView, 0);
}

@end