@interface SXMotionImageComponentBehaviorHandler
- (BOOL)horizontal;
- (BOOL)vertical;
- (BOOL)windowed;
- (SXMotionImageComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4;
- (UIInterpolatingMotionEffect)xMotionEffect;
- (UIInterpolatingMotionEffect)yMotionEffect;
- (UIView)clippingView;
- (UIView)motionContentView;
- (double)amplitude;
- (unint64_t)viewHierarchyIndex;
- (void)destroyMotionDetection;
- (void)destroyWithBehaviorController:(id)a3;
- (void)setAmplitude:(double)a3;
- (void)setClippingView:(id)a3;
- (void)setHorizontal:(BOOL)a3;
- (void)setMotionContentView:(id)a3;
- (void)setVertical:(BOOL)a3;
- (void)setViewHierarchyIndex:(unint64_t)a3;
- (void)setWindowed:(BOOL)a3;
- (void)setXMotionEffect:(id)a3;
- (void)setYMotionEffect:(id)a3;
- (void)setupMotionDetection;
- (void)setupWithBehaviorController:(id)a3;
- (void)updateEdgeAntialiasingForViewport:(id)a3;
@end

@implementation SXMotionImageComponentBehaviorHandler

- (SXMotionImageComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SXMotionImageComponentBehaviorHandler;
  v4 = [(SXComponentBehaviorHandler *)&v12 initWithComponentView:a3 withBehavior:a4];
  v5 = v4;
  if (v4)
  {
    v4->_viewHierarchyIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = [(SXComponentBehaviorHandler *)v4 behavior];
    [v6 amplitude];
    v5->_amplitude = v7;

    v8 = [(SXComponentBehaviorHandler *)v5 behavior];
    v5->_windowed = [v8 windowed];

    v9 = [(SXComponentBehaviorHandler *)v5 behavior];
    v5->_horizontal = [v9 horizontal];

    v10 = [(SXComponentBehaviorHandler *)v5 behavior];
    v5->_vertical = [v10 vertical];
  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXMotionImageComponentBehaviorHandler;
  id v4 = a3;
  [(SXComponentBehaviorHandler *)&v7 setupWithBehaviorController:v4];
  [(SXMotionImageComponentBehaviorHandler *)self setupMotionDetection];
  v5 = [v4 viewport];
  [(SXMotionImageComponentBehaviorHandler *)self updateEdgeAntialiasingForViewport:v5];

  v6 = [v4 viewport];

  [v6 addViewportChangeListener:self forOptions:8];
}

- (void)destroyWithBehaviorController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXMotionImageComponentBehaviorHandler;
  id v4 = a3;
  [(SXComponentBehaviorHandler *)&v6 destroyWithBehaviorController:v4];
  [(SXMotionImageComponentBehaviorHandler *)self destroyMotionDetection];
  v5 = [v4 viewport];

  [v5 removeViewportChangeListener:self forOptions:8];
}

- (void)setupMotionDetection
{
  v3 = [(SXComponentBehaviorHandler *)self behaviorView];
  [(SXMotionImageComponentBehaviorHandler *)self setMotionContentView:v3];

  [(SXMotionImageComponentBehaviorHandler *)self amplitude];
  double v5 = v4;
  BOOL v6 = [(SXMotionImageComponentBehaviorHandler *)self windowed];
  if ([(SXMotionImageComponentBehaviorHandler *)self windowed])
  {
    objc_super v7 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v8 = [v7 superview];
    v9 = [v8 subviews];
    v10 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    -[SXMotionImageComponentBehaviorHandler setViewHierarchyIndex:](self, "setViewHierarchyIndex:", [v9 indexOfObject:v10]);

    v11 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];

    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [(SXMotionImageComponentBehaviorHandler *)self setClippingView:v12];

      v13 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
      [v13 setClipsToBounds:1];
    }
    v14 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
    v15 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    [v15 frame];
    objc_msgSend(v14, "setFrame:");

    v16 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    [v16 bounds];
    CGRect v51 = CGRectInset(v50, -v5, -v5);
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;
    uint64_t v21 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    objc_msgSend((id)v21, "setFrame:", x, y, width, height);

    v22 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    objc_opt_class();
    LOBYTE(v21) = objc_opt_isKindOfClass();

    if (v21)
    {
      v23 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
      v24 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
      [v24 frame];
      objc_msgSend(v23, "fillFrameWithBoundingSize:", v25, v26);
      objc_msgSend(v23, "setContentFrame:");
    }
    v27 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v28 = [v27 superview];
    v29 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
    objc_msgSend(v28, "insertSubview:atIndex:", v29, -[SXMotionImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

    v30 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
    v31 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    [v30 addSubview:v31];
  }
  if ([(SXMotionImageComponentBehaviorHandler *)self horizontal])
  {
    v32 = (void *)[objc_alloc(MEMORY[0x263F1C6F0]) initWithKeyPath:@"center.x" type:0];
    [(SXMotionImageComponentBehaviorHandler *)self setXMotionEffect:v32];

    if (v6) {
      double v33 = v5;
    }
    else {
      double v33 = -v5;
    }
    if (v6) {
      double v34 = -v5;
    }
    else {
      double v34 = v5;
    }
    v35 = [NSNumber numberWithDouble:v33];
    v36 = [(SXMotionImageComponentBehaviorHandler *)self xMotionEffect];
    [v36 setMinimumRelativeValue:v35];

    v37 = [NSNumber numberWithDouble:v34];
    v38 = [(SXMotionImageComponentBehaviorHandler *)self xMotionEffect];
    [v38 setMaximumRelativeValue:v37];

    v39 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v40 = [(SXMotionImageComponentBehaviorHandler *)self xMotionEffect];
    [v39 addMotionEffect:v40];
  }
  if ([(SXMotionImageComponentBehaviorHandler *)self vertical])
  {
    v41 = (void *)[objc_alloc(MEMORY[0x263F1C6F0]) initWithKeyPath:@"center.y" type:1];
    [(SXMotionImageComponentBehaviorHandler *)self setYMotionEffect:v41];

    if (v6) {
      double v42 = v5;
    }
    else {
      double v42 = -v5;
    }
    if (v6) {
      double v5 = -v5;
    }
    v43 = [NSNumber numberWithDouble:v42];
    v44 = [(SXMotionImageComponentBehaviorHandler *)self yMotionEffect];
    [v44 setMinimumRelativeValue:v43];

    v45 = [NSNumber numberWithDouble:v5];
    v46 = [(SXMotionImageComponentBehaviorHandler *)self yMotionEffect];
    [v46 setMaximumRelativeValue:v45];

    id v48 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v47 = [(SXMotionImageComponentBehaviorHandler *)self yMotionEffect];
    [v48 addMotionEffect:v47];
  }
}

- (void)destroyMotionDetection
{
  v3 = [(SXMotionImageComponentBehaviorHandler *)self xMotionEffect];

  if (v3)
  {
    double v4 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    double v5 = [(SXMotionImageComponentBehaviorHandler *)self xMotionEffect];
    [v4 removeMotionEffect:v5];

    [(SXMotionImageComponentBehaviorHandler *)self setXMotionEffect:0];
  }
  BOOL v6 = [(SXMotionImageComponentBehaviorHandler *)self yMotionEffect];

  if (v6)
  {
    objc_super v7 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v8 = [(SXMotionImageComponentBehaviorHandler *)self yMotionEffect];
    [v7 removeMotionEffect:v8];

    [(SXMotionImageComponentBehaviorHandler *)self setYMotionEffect:0];
  }
  v9 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];

  if (v9)
  {
    v10 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
    v11 = [v10 superview];
    id v12 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    objc_msgSend(v11, "insertSubview:atIndex:", v12, -[SXMotionImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

    v13 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
    [v13 removeFromSuperview];

    [(SXMotionImageComponentBehaviorHandler *)self setViewHierarchyIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  v14 = [(SXComponentBehaviorHandler *)self componentView];
  v15 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
  v16 = [(SXComponentBehaviorHandler *)self behavior];
  [v14 originalFrameForContentView:v15 behavior:v16];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  [(SXMotionImageComponentBehaviorHandler *)self setMotionContentView:0];
}

- (void)updateEdgeAntialiasingForViewport:(id)a3
{
  uint64_t v4 = [a3 appearState];
  double v5 = [(SXMotionImageComponentBehaviorHandler *)self clippingView];
  BOOL v6 = [v5 layer];
  objc_super v7 = v6;
  if (v4 == 2)
  {
    [v6 setAllowsEdgeAntialiasing:1];

    id v11 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v8 = [v11 layer];
    v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    [v6 setAllowsEdgeAntialiasing:0];

    id v11 = [(SXMotionImageComponentBehaviorHandler *)self motionContentView];
    v8 = [v11 layer];
    v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setAllowsEdgeAntialiasing:v10];
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (UIView)motionContentView
{
  return self->_motionContentView;
}

- (void)setMotionContentView:(id)a3
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

- (UIInterpolatingMotionEffect)xMotionEffect
{
  return self->_xMotionEffect;
}

- (void)setXMotionEffect:(id)a3
{
}

- (UIInterpolatingMotionEffect)yMotionEffect
{
  return self->_yMotionEffect;
}

- (void)setYMotionEffect:(id)a3
{
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (BOOL)windowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (BOOL)horizontal
{
  return self->_horizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yMotionEffect, 0);
  objc_storeStrong((id *)&self->_xMotionEffect, 0);
  objc_storeStrong((id *)&self->_motionContentView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end