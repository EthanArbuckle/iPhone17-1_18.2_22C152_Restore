@interface VUICountDownProgressIndicator
- (BOOL)isAnimating;
- (CADisplayLink)displayLink;
- (CAShapeLayer)backgroundLayer;
- (CAShapeLayer)centerLayer;
- (CAShapeLayer)progressLayer;
- (CAShapeLayer)progressMaskLayer;
- (UIColor)backgroundTintColor;
- (UIColor)centerTintColor;
- (UIColor)progressTintColor;
- (UIEdgeInsets)backgroundImageInset;
- (UIEdgeInsets)centerImageInset;
- (UIEdgeInsets)progressInset;
- (UIImage)backgroundImage;
- (UIImage)centerImage;
- (UIImageView)centerImageView;
- (UIVisualEffectView)visualEffectView;
- (VUICountDownProgressIndicator)initWithFrame:(CGRect)a3 duration:(double)a4;
- (double)autoFillDelta;
- (double)autoFillStartTimeStamp;
- (double)duration;
- (double)progress;
- (double)progressWidth;
- (id)completion;
- (unint64_t)countDownProgressDirection;
- (void)_animateValueOnDisplayLink:(id)a3;
- (void)_configureBackground;
- (void)_configureProgressLayer;
- (void)_setProgress:(double)a3 animated:(BOOL)a4;
- (void)_stopAutoAnimation;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)restartWithAnimation:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAutoFillDelta:(double)a3;
- (void)setAutoFillStartTimeStamp:(double)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageInset:(UIEdgeInsets)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setBackgroundTintColor:(id)a3;
- (void)setCenterImage:(id)a3;
- (void)setCenterImageInset:(UIEdgeInsets)a3;
- (void)setCenterImageView:(id)a3;
- (void)setCenterLayer:(id)a3;
- (void)setCenterTintColor:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCountDownProgressDirection:(unint64_t)a3;
- (void)setDisplayLink:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressInset:(UIEdgeInsets)a3;
- (void)setProgressLayer:(id)a3;
- (void)setProgressMaskLayer:(id)a3;
- (void)setProgressTintColor:(id)a3;
- (void)setProgressWidth:(double)a3;
- (void)setTintColor:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation VUICountDownProgressIndicator

- (VUICountDownProgressIndicator)initWithFrame:(CGRect)a3 duration:(double)a4
{
  v17.receiver = self;
  v17.super_class = (Class)VUICountDownProgressIndicator;
  v5 = -[VUICountDownProgressIndicator initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (VUICountDownProgressIndicator *)v5;
  if (v5)
  {
    *((double *)v5 + 52) = a4;
    *((void *)v5 + 70) = 0xBFF0000000000000;
    *((void *)v5 + 67) = 0;
    *((void *)v5 + 54) = 0x4008000000000000;
    v7 = v5 + 568;
    UIEdgeInsetsMakeWithEdges();
    void *v7 = v8;
    v6->_progressInset.left = v9;
    v6->_progressInset.bottom = v10;
    v6->_progressInset.right = v11;
    UIEdgeInsetsMakeWithEdges();
    v6->_centerImageInset.top = v12;
    v6->_centerImageInset.left = v13;
    v6->_centerImageInset.bottom = v14;
    v6->_centerImageInset.right = v15;
    [(VUICountDownProgressIndicator *)v6 setClipsToBounds:1];
  }
  return v6;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)VUICountDownProgressIndicator;
  [(VUICountDownProgressIndicator *)&v4 didMoveToSuperview];
  v3 = [(VUICountDownProgressIndicator *)self superview];

  if (v3)
  {
    [(VUICountDownProgressIndicator *)self _configureProgressLayer];
    [(VUICountDownProgressIndicator *)self restartWithAnimation:1];
  }
  else
  {
    [(VUICountDownProgressIndicator *)self _stopAutoAnimation];
  }
}

- (void)restartWithAnimation:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)VUICountDownProgressIndicator;
  [(VUICountDownProgressIndicator *)&v40 layoutSubviews];
  [(VUICountDownProgressIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VUICountDownProgressIndicator *)self progressInset];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  v19 = [(VUICountDownProgressIndicator *)self progressLayer];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [(VUICountDownProgressIndicator *)self bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [(VUICountDownProgressIndicator *)self centerImageInset];
  double v29 = v21 + v28;
  double v31 = v23 + v30;
  double v33 = v25 - (v28 + v32);
  double v35 = v27 - (v30 + v34);
  v36 = [(VUICountDownProgressIndicator *)self centerImageView];
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  [(VUICountDownProgressIndicator *)self bounds];
  double v38 = v37 * 0.5;
  v39 = [(VUICountDownProgressIndicator *)self layer];
  [v39 setCornerRadius:v38];
}

- (void)dealloc
{
  double v3 = [(VUICountDownProgressIndicator *)self displayLink];
  [v3 invalidate];

  [(VUICountDownProgressIndicator *)self setDisplayLink:0];
  v4.receiver = self;
  v4.super_class = (Class)VUICountDownProgressIndicator;
  [(VUICountDownProgressIndicator *)&v4 dealloc];
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUICountDownProgressIndicator;
  id v3 = [(VUICountDownProgressIndicator *)&v4 tintColor];
}

- (void)setProgressTintColor:(id)a3
{
  double v6 = (UIColor *)a3;
  if (self->_progressTintColor != v6)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    double v5 = [(VUICountDownProgressIndicator *)self progressLayer];
    objc_msgSend(v5, "setStrokeColor:", -[UIColor CGColor](v6, "CGColor"));

    [(VUICountDownProgressIndicator *)self setNeedsDisplay];
  }
}

- (void)setCenterImageInset:(UIEdgeInsets)a3
{
  if (self->_centerImageInset.left != a3.left
    || self->_centerImageInset.top != a3.top
    || self->_centerImageInset.right != a3.right
    || self->_centerImageInset.bottom != a3.bottom)
  {
    self->_centerImageInset = a3;
    [(VUICountDownProgressIndicator *)self setNeedsDisplay];
  }
}

- (void)setCenterImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_centerImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    [(VUICountDownProgressIndicator *)self _configureBackground];
    double v5 = v6;
  }
}

- (void)setBackgroundTintColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_backgroundTintColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_backgroundTintColor, a3);
    [(VUICountDownProgressIndicator *)self setNeedsDisplay];
    double v5 = v6;
  }
}

- (void)_configureProgressLayer
{
  id v3 = [(VUICountDownProgressIndicator *)self progressLayer];

  if (!v3)
  {
    id v7 = (id)objc_opt_new();
    id v4 = [(VUICountDownProgressIndicator *)self progressTintColor];
    objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    id v5 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v7, "setFillColor:", objc_msgSend(v5, "CGColor"));

    [(VUICountDownProgressIndicator *)self progressWidth];
    objc_msgSend(v7, "setLineWidth:");
    double v6 = [(VUICountDownProgressIndicator *)self layer];
    [v6 addSublayer:v7];

    [(VUICountDownProgressIndicator *)self setProgressLayer:v7];
  }
}

- (void)_configureBackground
{
  id v3 = [(VUICountDownProgressIndicator *)self backgroundTintColor];

  if (v3)
  {
    id v4 = [(VUICountDownProgressIndicator *)self backgroundTintColor];
    [(VUICountDownProgressIndicator *)self setBackgroundColor:v4];
  }
  id v5 = [(VUICountDownProgressIndicator *)self centerImage];

  if (v5)
  {
    double v6 = [(VUICountDownProgressIndicator *)self centerImageView];
    id v7 = [v6 superview];

    if (v7 == self)
    {
      double v8 = [(VUICountDownProgressIndicator *)self centerImageView];
      [v8 removeFromSuperview];
    }
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v10 = [(VUICountDownProgressIndicator *)self centerImage];
    double v11 = (void *)[v9 initWithImage:v10];
    [(VUICountDownProgressIndicator *)self setCenterImageView:v11];

    id v12 = [(VUICountDownProgressIndicator *)self centerImageView];
    [(VUICountDownProgressIndicator *)self addSubview:v12];
  }
}

- (void)_setProgress:(double)a3 animated:(BOOL)a4
{
  if (a3 != 0.0 && self->_progress != a3)
  {
    if (a4)
    {
      [(VUICountDownProgressIndicator *)self setAnimating:1];
      double v6 = [(VUICountDownProgressIndicator *)self displayLink];

      if (!v6)
      {
        id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
        double v8 = [v7 displayLinkWithTarget:self selector:sel__animateValueOnDisplayLink_];

        id v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

        [(VUICountDownProgressIndicator *)self setDisplayLink:v8];
      }
    }
    else
    {
      [(VUICountDownProgressIndicator *)self setAnimating:0];
      double v10 = [(VUICountDownProgressIndicator *)self displayLink];
      [v10 invalidate];

      [(VUICountDownProgressIndicator *)self setDisplayLink:0];
    }
    [(VUICountDownProgressIndicator *)self setProgress:a3];
    [(VUICountDownProgressIndicator *)self setNeedsDisplay];
  }
}

- (void)_stopAutoAnimation
{
  [(VUICountDownProgressIndicator *)self setAnimating:0];
  id v3 = [(VUICountDownProgressIndicator *)self displayLink];
  [v3 invalidate];

  [(VUICountDownProgressIndicator *)self setDisplayLink:0];
}

- (void)_animateValueOnDisplayLink:(id)a3
{
  id v23 = a3;
  [(VUICountDownProgressIndicator *)self autoFillDelta];
  if (v4 == 0.0)
  {
    [v23 duration];
    double v6 = v5;
    [(VUICountDownProgressIndicator *)self duration];
    [(VUICountDownProgressIndicator *)self setAutoFillDelta:v6 / v7];
  }
  double v8 = 0.0;
  if ([(VUICountDownProgressIndicator *)self isAnimating])
  {
    [(VUICountDownProgressIndicator *)self progress];
    double v10 = v9;
    [(VUICountDownProgressIndicator *)self autoFillDelta];
    double v8 = v10 + v11;
    [(VUICountDownProgressIndicator *)self _setProgress:1 animated:v8];
  }
  if ([(VUICountDownProgressIndicator *)self isAnimating])
  {
    id v12 = [(VUICountDownProgressIndicator *)self progressLayer];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;

    double v17 = v8 * -6.28318531 + -1.57079633;
    if (self->_countDownProgressDirection != 1) {
      double v17 = v8 * 6.28318531 + -1.57079633;
    }
    double v18 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v14 * 0.5, v16 * 0.5, v16 * 0.5, -1.57079633, v17);
    v19 = [(VUICountDownProgressIndicator *)self progressLayer];
    id v20 = v18;
    objc_msgSend(v19, "setPath:", objc_msgSend(v20, "CGPath"));

    [(VUICountDownProgressIndicator *)self setNeedsDisplay];
  }
  if (v8 >= 1.0)
  {
    [(VUICountDownProgressIndicator *)self _stopAutoAnimation];
    double v21 = [(VUICountDownProgressIndicator *)self completion];

    if (v21)
    {
      double v22 = [(VUICountDownProgressIndicator *)self completion];
      v22[2]();
    }
  }
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)countDownProgressDirection
{
  return self->_countDownProgressDirection;
}

- (void)setCountDownProgressDirection:(unint64_t)a3
{
  self->_countDownProgressDirection = a3;
}

- (double)progressWidth
{
  return self->_progressWidth;
}

- (void)setProgressWidth:(double)a3
{
  self->_progressWidth = a3;
}

- (UIEdgeInsets)progressInset
{
  double top = self->_progressInset.top;
  double left = self->_progressInset.left;
  double bottom = self->_progressInset.bottom;
  double right = self->_progressInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setProgressInset:(UIEdgeInsets)a3
{
  self->_progressInset = a3;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIEdgeInsets)backgroundImageInset
{
  double top = self->_backgroundImageInset.top;
  double left = self->_backgroundImageInset.left;
  double bottom = self->_backgroundImageInset.bottom;
  double right = self->_backgroundImageInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBackgroundImageInset:(UIEdgeInsets)a3
{
  self->_backgroundImageInset = a3;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (UIEdgeInsets)centerImageInset
{
  double top = self->_centerImageInset.top;
  double left = self->_centerImageInset.left;
  double bottom = self->_centerImageInset.bottom;
  double right = self->_centerImageInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)centerTintColor
{
  return self->_centerTintColor;
}

- (void)setCenterTintColor:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CAShapeLayer)centerLayer
{
  return self->_centerLayer;
}

- (void)setCenterLayer:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (CAShapeLayer)progressMaskLayer
{
  return self->_progressMaskLayer;
}

- (void)setProgressMaskLayer:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)autoFillDelta
{
  return self->_autoFillDelta;
}

- (void)setAutoFillDelta:(double)a3
{
  self->_autoFillDelta = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
{
}

- (double)autoFillStartTimeStamp
{
  return self->_autoFillStartTimeStamp;
}

- (void)setAutoFillStartTimeStamp:(double)a3
{
  self->_autoFillStartTimeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_progressMaskLayer, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_centerLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_centerTintColor, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
}

@end