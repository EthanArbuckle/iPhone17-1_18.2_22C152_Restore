@interface BSUIProgressSeparatorController
- (BSUIProgressSeparatorController)initWithProgressView:(id)a3 frame:(CGRect)a4;
- (BSUIWeeklyProgressMetrics)metrics;
- (BSUIWeeklyProgressView)progressView;
- (CALayer)backgroundLayer;
- (CALayer)separatorLayer;
- (CGRect)bounds;
- (CGRect)frame;
- (id)_gradientSeparatorWithColors:(id)a3 backgroundColor:(id)a4;
- (id)_separatorWithColor:(id)a3;
- (id)description;
- (void)_setupBackgroundLayer;
- (void)_setupSeparatorForLayoutType:(int64_t)a3;
- (void)configureWithType:(int64_t)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMetrics:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setSeparatorLayer:(id)a3;
- (void)updateProgress:(double)a3 animate:(BOOL)a4;
@end

@implementation BSUIProgressSeparatorController

- (BSUIProgressSeparatorController)initWithProgressView:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BSUIProgressSeparatorController;
  v11 = [(BSUIProgressSeparatorController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_progressView, a3);
    uint64_t v13 = [v10 metrics];
    metrics = v12->_metrics;
    v12->_metrics = (BSUIWeeklyProgressMetrics *)v13;

    v12->_frame.origin.CGFloat x = x;
    v12->_frame.origin.CGFloat y = y;
    v12->_frame.size.CGFloat width = width;
    v12->_frame.size.CGFloat height = height;
  }

  return v12;
}

- (void)updateProgress:(double)a3 animate:(BOOL)a4
{
  v6 = [(BSUIProgressSeparatorController *)self metrics];
  v7 = v6;
  if (a3 >= 1.0) {
    [v6 progressColor];
  }
  else {
  v8 = [v6 controlColor];
  }
  v9 = [(BSUIProgressSeparatorController *)self progressView];
  id v10 = [v9 traitCollection];
  v11 = [v8 resolvedColorWithTraitCollection:v10];

  v12 = [(BSUIProgressSeparatorController *)self separatorLayer];
  uint64_t v13 = (CGColor *)[v12 backgroundColor];
  id v16 = v11;
  LOBYTE(v13) = CGColorEqualToColor(v13, (CGColorRef)[v16 CGColor]);

  if ((v13 & 1) == 0)
  {
    id v14 = [v16 CGColor];
    v15 = [(BSUIProgressSeparatorController *)self separatorLayer];
    [v15 setBackgroundColor:v14];
  }
}

- (void)configureWithType:(int64_t)a3
{
  [(BSUIProgressSeparatorController *)self frame];
  double Width = CGRectGetWidth(v7);
  [(BSUIProgressSeparatorController *)self frame];
  -[BSUIProgressSeparatorController setBounds:](self, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v8));
  [(BSUIProgressSeparatorController *)self _setupBackgroundLayer];

  [(BSUIProgressSeparatorController *)self _setupSeparatorForLayoutType:a3];
}

- (void)_setupBackgroundLayer
{
  v3 = [(BSUIProgressSeparatorController *)self backgroundLayer];

  if (!v3)
  {
    v4 = +[CALayer layer];
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v4;
  }
  [(BSUIProgressSeparatorController *)self bounds];
  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:");
  [(BSUIProgressSeparatorController *)self frame];
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:");
  id v6 = +[UIColor clearColor];
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", [v6 CGColor]);

  if (self->_debugBounds)
  {
    id v7 = +[UIColor blueColor];
    -[CALayer setBorderColor:](self->_backgroundLayer, "setBorderColor:", [v7 CGColor]);

    [(CALayer *)self->_backgroundLayer setBorderWidth:0.5];
  }
  [(CALayer *)self->_backgroundLayer setMasksToBounds:1];
  id v9 = [(BSUIProgressSeparatorController *)self progressView];
  CGRect v8 = [v9 presentationLayer];
  [v8 addSublayer:self->_backgroundLayer];
}

- (void)_setupSeparatorForLayoutType:(int64_t)a3
{
  v5 = [(BSUIProgressSeparatorController *)self separatorLayer];
  [v5 removeFromSuperlayer];

  [(BSUIProgressSeparatorController *)self setSeparatorLayer:0];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    CGRect v8 = [(BSUIProgressSeparatorController *)self metrics];
    id v9 = v8;
    if (a3 == 6) {
      [v8 controlColor];
    }
    else {
    v15 = [v8 progressColor];
    }

    id v16 = [(BSUIProgressSeparatorController *)self progressView];
    v17 = [v16 traitCollection];
    uint64_t v13 = [v15 resolvedColorWithTraitCollection:v17];

    id v14 = [(BSUIProgressSeparatorController *)self metrics];
    v18 = [v14 backgroundColor];
    v19 = [(BSUIProgressSeparatorController *)self _gradientSeparatorWithColors:v13 backgroundColor:v18];
    [(BSUIProgressSeparatorController *)self setSeparatorLayer:v19];
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4) {
      goto LABEL_12;
    }
    id v6 = [(BSUIProgressSeparatorController *)self metrics];
    id v7 = v6;
    if (a3 == 4) {
      [v6 controlColor];
    }
    else {
    id v10 = [v6 progressColor];
    }

    v11 = [(BSUIProgressSeparatorController *)self progressView];
    v12 = [v11 traitCollection];
    uint64_t v13 = [v10 resolvedColorWithTraitCollection:v12];

    id v14 = [(BSUIProgressSeparatorController *)self _separatorWithColor:v13];
    [(BSUIProgressSeparatorController *)self setSeparatorLayer:v14];
  }

LABEL_12:
  id v21 = [(BSUIProgressSeparatorController *)self backgroundLayer];
  v20 = [(BSUIProgressSeparatorController *)self separatorLayer];
  [v21 addSublayer:v20];
}

- (id)_gradientSeparatorWithColors:(id)a3 backgroundColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGRect v8 = [(BSUIProgressSeparatorController *)self metrics];
  id v9 = [v8 rightToLeft];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = objc_alloc_init((Class)CAGradientLayer);
  id v12 = v6;
  id v13 = [v12 CGColor];

  v18[0] = v13;
  id v14 = v7;
  id v15 = [v14 CGColor];

  v18[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v18 count:2];
  [v11 setColors:v16];

  [(BSUIProgressSeparatorController *)self bounds];
  [v11 setFrame:];
  [v11 setStartPoint:(double)v10, 0.5];
  [v11 setEndPoint:(v10 ^ 1) :0.5];

  return v11;
}

- (id)_separatorWithColor:(id)a3
{
  id v4 = a3;
  v5 = +[CALayer layer];
  id v6 = v4;
  id v7 = [v6 CGColor];

  [v5 setBackgroundColor:v7];
  [(BSUIProgressSeparatorController *)self bounds];
  [v5 setBounds:];
  [(BSUIProgressSeparatorController *)self bounds];
  [v5 setFrame:];

  return v5;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(BSUIProgressSeparatorController *)self frame];
  id v4 = NSStringFromCGRect(v8);
  v5 = +[NSString stringWithFormat:@"%@: %p frame=%@", v3, self, v4];

  return v5;
}

- (BSUIWeeklyProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (BSUIWeeklyProgressMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CALayer)separatorLayer
{
  return self->_separatorLayer;
}

- (void)setSeparatorLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end