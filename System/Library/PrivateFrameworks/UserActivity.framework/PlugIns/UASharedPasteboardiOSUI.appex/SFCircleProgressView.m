@interface SFCircleProgressView
+ (Class)layerClass;
- (BOOL)showProgressTray;
- (SFCircleProgressView)initWithFrame:(CGRect)a3;
- (UIColor)progressColor;
- (double)progress;
- (double)progressLineWidth;
- (double)progressPresentationValue;
- (int64_t)progressStartPoint;
- (void)animateProgressCompletedWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setProgress:(double)a3 animated:(BOOL)a4 forced:(BOOL)a5 completion:(id)a6;
- (void)setProgressColor:(id)a3;
- (void)setProgressLineWidth:(double)a3;
- (void)setProgressStartPoint:(int64_t)a3;
- (void)setShowProgressTray:(BOOL)a3;
@end

@implementation SFCircleProgressView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFCircleProgressView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFCircleProgressView;
  v3 = -[SFCircleProgressView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(SFCircleProgressView *)v3 setBackgroundColor:v4];

    v5 = [(SFCircleProgressView *)v3 layer];
    v6 = +[UIScreen mainScreen];
    [v6 scale];
    objc_msgSend(v5, "setContentsScale:");
  }
  return v3;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)SFCircleProgressView;
  [(SFCircleProgressView *)&v2 layoutSubviews];
}

- (void)setProgressStartPoint:(int64_t)a3
{
  id v4 = [(SFCircleProgressView *)self layer];
  [v4 setProgressStartPoint:a3];
}

- (int64_t)progressStartPoint
{
  objc_super v2 = [(SFCircleProgressView *)self layer];
  id v3 = [v2 progressStartPoint];

  return (int64_t)v3;
}

- (void)setProgressColor:(id)a3
{
  id v4 = a3;
  id v5 = [(SFCircleProgressView *)self layer];
  [v5 setProgressColor:v4];
}

- (UIColor)progressColor
{
  objc_super v2 = [(SFCircleProgressView *)self layer];
  id v3 = [v2 progressColor];

  return (UIColor *)v3;
}

- (void)setProgressLineWidth:(double)a3
{
  id v4 = [(SFCircleProgressView *)self layer];
  [v4 setProgressLineWidth:a3];
}

- (double)progressLineWidth
{
  objc_super v2 = [(SFCircleProgressView *)self layer];
  [v2 progressLineWidth];
  double v4 = v3;

  return v4;
}

- (void)setShowProgressTray:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SFCircleProgressView *)self layer];
  [v4 setShowProgressTray:v3];
}

- (BOOL)showProgressTray
{
  objc_super v2 = [(SFCircleProgressView *)self layer];
  unsigned __int8 v3 = [v2 showProgressTray];

  return v3;
}

- (double)progress
{
  objc_super v2 = [(SFCircleProgressView *)self layer];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (void)setProgress:(double)a3
{
  id v4 = [(SFCircleProgressView *)self layer];
  [v4 setProgress:a3];
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 forced:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v10 = (Block_layout *)a6;
  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_100008320;
  }
  v12 = [(SFCircleProgressView *)self layer];
  [v12 progress];
  double v14 = v13;

  if (v14 == a3 && !v6) {
    goto LABEL_13;
  }
  if (!v7)
  {
    v20 = [(SFCircleProgressView *)self layer];
    [v20 removeAnimationForKey:@"SFCircleProgressViewAnimationKey"];

    [(SFCircleProgressView *)self setProgress:a3];
LABEL_13:
    v11->invoke(v11);
    goto LABEL_20;
  }
  [(SFCircleProgressView *)self progressPresentationValue];
  double v17 = v16;
  double v18 = vabdd_f64(a3, v16);
  double v19 = 1.0;
  if (v18 <= 0.9)
  {
    if (v18 <= 0.5)
    {
      if (v18 > 0.2) {
        double v19 = 0.5;
      }
      else {
        double v19 = 0.25;
      }
    }
    else
    {
      double v19 = 0.7;
    }
  }
  v21 = [(SFCircleProgressView *)self layer];
  v22 = [v21 animationKeys];
  unsigned int v23 = [v22 containsObject:@"SFCircleProgressViewAnimationKey"];

  v24 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
  if (v23) {
    v24 = (id *)&kCAMediaTimingFunctionEaseOut;
  }
  id v25 = *v24;
  v26 = +[CABasicAnimation animationWithKeyPath:@"progress"];
  v27 = +[CAMediaTimingFunction functionWithName:v25];
  [v26 setTimingFunction:v27];

  [v26 setDuration:v19];
  [v26 setFillMode:kCAFillModeBackwards];
  v28 = +[NSNumber numberWithDouble:v17];
  [v26 setFromValue:v28];

  v29 = +[NSNumber numberWithDouble:a3];
  [v26 setToValue:v29];

  +[CATransaction begin];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100005ED4;
  v31[3] = &unk_100008348;
  v32 = v11;
  +[CATransaction setCompletionBlock:v31];
  [(SFCircleProgressView *)self setProgress:a3];
  v30 = [(SFCircleProgressView *)self layer];
  [v30 addAnimation:v26 forKey:@"SFCircleProgressViewAnimationKey"];

  +[CATransaction commit];
LABEL_20:
}

- (void)animateProgressCompletedWithCompletion:(id)a3
{
  id v4 = (Block_layout *)a3;
  if (!v4) {
    id v4 = &stru_100008368;
  }
  BOOL v6 = (void (**)(void))v4;
  [(SFCircleProgressView *)self progressPresentationValue];
  if (v5 == 1.0) {
    v6[2]();
  }
  else {
    [(SFCircleProgressView *)self setProgress:1 animated:1 forced:v6 completion:1.0];
  }
}

- (double)progressPresentationValue
{
  objc_super v2 = [(SFCircleProgressView *)self layer];
  double v3 = [v2 presentationLayer];
  [v3 progress];
  double v5 = v4;

  return v5;
}

@end