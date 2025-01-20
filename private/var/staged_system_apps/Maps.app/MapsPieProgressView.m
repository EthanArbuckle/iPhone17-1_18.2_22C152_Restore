@interface MapsPieProgressView
+ (Class)layerClass;
- (MapsPieProgressView)initWithFrame:(CGRect)a3;
- (UIColor)progressColor;
- (double)borderLineWidth;
- (double)progress;
- (double)progressLineWidth;
- (double)progressPresentationValue;
- (void)animateProgressCompletedWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setBorderLineWidth:(double)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setProgress:(double)a3 animated:(BOOL)a4 forced:(BOOL)a5 completion:(id)a6;
- (void)setProgressColor:(id)a3;
- (void)setProgressLineWidth:(double)a3;
@end

@implementation MapsPieProgressView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (MapsPieProgressView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MapsPieProgressView;
  v3 = -[MapsPieProgressView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(MapsPieProgressView *)v3 setBackgroundColor:v4];

    v5 = [(MapsPieProgressView *)v3 layer];
    v6 = +[UIScreen mainScreen];
    [v6 scale];
    [v5 setContentsScale:];
  }
  return v3;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)MapsPieProgressView;
  [(MapsPieProgressView *)&v2 layoutSubviews];
}

- (void)setProgressColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsPieProgressView *)self layer];
  [v5 setProgressColor:v4];
}

- (UIColor)progressColor
{
  objc_super v2 = [(MapsPieProgressView *)self layer];
  v3 = [v2 progressColor];

  return (UIColor *)v3;
}

- (void)setProgressLineWidth:(double)a3
{
  id v4 = [(MapsPieProgressView *)self layer];
  [v4 setBorderLineWidth:a3];
}

- (double)progressLineWidth
{
  objc_super v2 = [(MapsPieProgressView *)self layer];
  [v2 borderLineWidth];
  double v4 = v3;

  return v4;
}

- (double)progress
{
  objc_super v2 = [(MapsPieProgressView *)self layer];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (void)setProgress:(double)a3
{
  id v4 = [(MapsPieProgressView *)self layer];
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
    v11 = &stru_101315AF0;
  }
  v12 = [(MapsPieProgressView *)self layer];
  [v12 progress];
  double v14 = v13;

  if (v14 == a3 && !v6) {
    goto LABEL_13;
  }
  if (!v7)
  {
    v20 = [(MapsPieProgressView *)self layer];
    [v20 removeAnimationForKey:@"MapsPieProgressViewAnimationKey"];

    [(MapsPieProgressView *)self setProgress:a3];
LABEL_13:
    v11->invoke(v11);
    goto LABEL_21;
  }
  [(MapsPieProgressView *)self progressPresentationValue];
  double v17 = v16;
  double v18 = vabdd_f64(a3, v16);
  double v19 = 1.0;
  if (v18 <= 0.9)
  {
    if (v18 <= 0.5)
    {
      double v19 = 0.25;
      if (v18 > 0.2) {
        double v19 = 0.4;
      }
    }
    else
    {
      double v19 = 0.7;
    }
  }
  v21 = [(MapsPieProgressView *)self layer];
  v22 = [v21 animationKeys];
  unsigned int v23 = [v22 containsObject:@"MapsPieProgressViewAnimationKey"];

  v24 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
  if (v23) {
    v24 = (id *)&kCAMediaTimingFunctionEaseOut;
  }
  id v25 = *v24;
  if (v17 < a3)
  {
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
    v31[2] = sub_100A7414C;
    v31[3] = &unk_1012E6EA8;
    v32 = v11;
    +[CATransaction setCompletionBlock:v31];
    v30 = [(MapsPieProgressView *)self layer];
    [v30 addAnimation:v26 forKey:@"MapsPieProgressViewAnimationKey"];

    +[CATransaction commit];
  }
  [(MapsPieProgressView *)self setProgress:a3];

LABEL_21:
}

- (void)animateProgressCompletedWithCompletion:(id)a3
{
  id v4 = (Block_layout *)a3;
  if (!v4) {
    id v4 = &stru_101315B10;
  }
  BOOL v6 = (void (**)(void))v4;
  [(MapsPieProgressView *)self progressPresentationValue];
  if (v5 == 1.0) {
    v6[2]();
  }
  else {
    [(MapsPieProgressView *)self setProgress:1 animated:1 forced:v6 completion:1.0];
  }
}

- (double)progressPresentationValue
{
  objc_super v2 = [(MapsPieProgressView *)self layer];
  double v3 = [v2 presentationLayer];
  [v3 progress];
  double v5 = v4;

  return v5;
}

- (double)borderLineWidth
{
  return self->_borderLineWidth;
}

- (void)setBorderLineWidth:(double)a3
{
  self->_borderLineWidth = a3;
}

@end