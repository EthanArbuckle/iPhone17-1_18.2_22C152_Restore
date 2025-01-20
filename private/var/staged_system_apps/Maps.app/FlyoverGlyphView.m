@interface FlyoverGlyphView
- (BOOL)isAnimating;
- (FlyoverGlyphView)initWithCoder:(id)a3;
- (FlyoverGlyphView)initWithFrame:(CGRect)a3;
- (double)stopAnimating;
- (void)applicationWillEnterForeground:(id)a3;
- (void)gv_commonInit;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)startAnimating;
@end

@implementation FlyoverGlyphView

- (void)gv_commonInit
{
  v3 = objc_alloc_init(FlyoverGlyphFrameList);
  frameList = self->_frameList;
  self->_frameList = v3;

  if (self->_frameList)
  {
    [(FlyoverGlyphView *)self setAccessibilityIdentifier:@"FlyoverGlyphView"];
    [(FlyoverGlyphFrameList *)self->_frameList frameDuration];
    double v6 = v5;
    [(FlyoverGlyphFrameList *)self->_frameList introFrameRange];
    self->_introDuration = v6 * (double)v7;
    [(FlyoverGlyphFrameList *)self->_frameList loopFrameRange];
    self->_loopDuration = v6 * (double)v8;
    [(FlyoverGlyphFrameList *)self->_frameList outroFrameRange];
    self->_outroDuration = v6 * (double)v9;
    v10 = +[CALayer layer];
    wrapperLayer = self->_wrapperLayer;
    self->_wrapperLayer = v10;

    [(CALayer *)self->_wrapperLayer setAllowsGroupBlending:0];
    -[CALayer setBounds:](self->_wrapperLayer, "setBounds:", 0.0, 0.0, 50.0, 50.0);
    v12 = [(FlyoverGlyphView *)self layer];
    [v12 addSublayer:self->_wrapperLayer];

    v13 = +[CALayer layer];
    imageLayer = self->_imageLayer;
    self->_imageLayer = v13;

    [(CALayer *)self->_imageLayer setCompositingFilter:kCAFilterPlusD];
    [(CALayer *)self->_imageLayer setContents:[(FlyoverGlyphFrameList *)self->_frameList atlasImage]];
    [(CALayer *)self->_wrapperLayer addSublayer:self->_imageLayer];
    *(_OWORD *)v20 = 0u;
    v15 = +[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorMatrix, 0, 0, 0, 0, 0, 0, 0, *(void *)&v20[12]);
    *(_DWORD *)&v20[16] = -1082130432;
    uint64_t v21 = 0;
    uint64_t v22 = 1065353216;
    v16 = +[NSValue valueWithCAColorMatrix:&v19];
    [v15 setValue:v16 forKey:@"inputColorMatrix"];

    v23 = v15;
    v17 = +[NSArray arrayWithObjects:&v23 count:1];
    [(CALayer *)self->_imageLayer setFilters:v17];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:self selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
}

- (FlyoverGlyphView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FlyoverGlyphView;
  v3 = [(FlyoverGlyphView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(FlyoverGlyphView *)v3 gv_commonInit];
    double v5 = v4;
  }

  return v4;
}

- (FlyoverGlyphView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FlyoverGlyphView;
  v3 = -[FlyoverGlyphView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FlyoverGlyphView *)v3 gv_commonInit];
    double v5 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  [(FlyoverGlyphView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v12);
  wrapperLayer = self->_wrapperLayer;

  -[CALayer setPosition:](wrapperLayer, "setPosition:", MidX, MidY);
}

- (void)startAnimating
{
  if (![(FlyoverGlyphView *)self isAnimating])
  {
    CFTimeInterval v3 = CACurrentMediaTime();
    double animationEndTime = self->_animationEndTime;
    if (v3 < animationEndTime && (BOOL v5 = v3 < animationEndTime - self->_outroDuration, v3 = self->_animationEndTime, v5))
    {
      [(CALayer *)self->_imageLayer removeAnimationForKey:@"outro", v3];
    }
    else
    {
      self->_animationStartTime = v3;
      frameList = self->_frameList;
      id v7 = [(FlyoverGlyphFrameList *)frameList introFrameRange];
      unint64_t v9 = sub_100A18D90(frameList, (unint64_t)v7, v8);
      [v9 setBeginTime:self->_animationStartTime];
      [(CALayer *)self->_imageLayer addAnimation:v9 forKey:@"intro"];
    }
    v10 = self->_frameList;
    id v11 = [(FlyoverGlyphFrameList *)v10 loopFrameRange];
    sub_100A18D90(v10, (unint64_t)v11, v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v14 setBeginTime:self->_animationStartTime + self->_introDuration];
    LODWORD(v13) = 2139095040;
    [v14 setRepeatCount:v13];
    [(CALayer *)self->_imageLayer addAnimation:v14 forKey:@"loop"];
    [(FlyoverGlyphView *)self setAnimating:1];
  }
}

- (double)stopAnimating
{
  double animationEndTime = -1.0;
  if ([(FlyoverGlyphView *)self isAnimating])
  {
    double v4 = fmax(ceil((CACurrentMediaTime() - self->_animationStartTime - self->_introDuration) / self->_loopDuration), 0.0);
    if (v4 >= 1.0)
    {
      frameList = self->_frameList;
      id v6 = [(FlyoverGlyphFrameList *)frameList loopFrameRange];
      unint64_t v8 = sub_100A18D90(frameList, (unint64_t)v6, v7);
      [v8 setBeginTime:self->_animationStartTime + self->_introDuration];
      *(float *)&double v9 = v4;
      [v8 setRepeatCount:v9];
      [(CALayer *)self->_imageLayer addAnimation:v8 forKey:@"loop"];
    }
    else
    {
      [(CALayer *)self->_imageLayer removeAnimationForKey:@"loop"];
    }
    v10 = self->_frameList;
    id v11 = [(FlyoverGlyphFrameList *)v10 outroFrameRange];
    double v13 = sub_100A18D90(v10, (unint64_t)v11, v12);
    [v13 setBeginTime:self->_animationStartTime + self->_introDuration + v4 * self->_loopDuration];
    [(CALayer *)self->_imageLayer addAnimation:v13 forKey:@"outro"];
    [v13 beginTime];
    self->_double animationEndTime = v14 + self->_outroDuration;
    [(FlyoverGlyphView *)self setAnimating:0];
    double animationEndTime = self->_animationEndTime;
  }
  return animationEndTime;
}

- (void)applicationWillEnterForeground:(id)a3
{
  if ([(FlyoverGlyphView *)self isAnimating])
  {
    frameList = self->_frameList;
    id v5 = [(FlyoverGlyphFrameList *)frameList loopFrameRange];
    sub_100A18D90(frameList, (unint64_t)v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 setBeginTime:self->_animationStartTime + self->_introDuration];
    LODWORD(v7) = 2139095040;
    [v8 setRepeatCount:v7];
    [(CALayer *)self->_imageLayer addAnimation:v8 forKey:@"loop"];
  }
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_wrapperLayer, 0);

  objc_storeStrong((id *)&self->_frameList, 0);
}

@end