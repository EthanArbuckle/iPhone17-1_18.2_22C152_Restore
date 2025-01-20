@interface CRLIndeterminateProgressRingView_i
+ (Class)layerClass;
- (CRLIndeterminateProgressRingView_i)initWithCoder:(id)a3;
- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3;
- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3 color:(id)a4 strokeWidth:(double)a5;
- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3 style:(unint64_t)a4 strokeWidth:(double)a5;
- (UIColor)color;
- (double)gapAngle;
- (double)strokeWidth;
- (id)p_strokeColorForStyle:(unint64_t)a3;
- (unint64_t)style;
- (void)_updateShapePath;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setGapAngle:(double)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setup;
- (void)updateForAppearance;
@end

@implementation CRLIndeterminateProgressRingView_i

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)p_strokeColorForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      self = self->_color;
      break;
    case 1uLL:
      self = +[UIColor labelColor];
      break;
    case 0uLL:
      self = +[UIColor systemBackgroundColor];
      break;
  }

  return self;
}

- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3
{
  return -[CRLIndeterminateProgressRingView_i initWithFrame:style:strokeWidth:](self, "initWithFrame:style:strokeWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 3.0);
}

- (CRLIndeterminateProgressRingView_i)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLIndeterminateProgressRingView_i;
  v3 = [(CRLIndeterminateProgressRingView_i *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_style = 0;
    v3->_strokeWidth = 2.0;
    v3->_gapAngle = 26.0;
    uint64_t v5 = [(CRLIndeterminateProgressRingView_i *)v3 p_strokeColorForStyle:v3->_style];
    color = v4->_color;
    v4->_color = (UIColor *)v5;

    [(CRLIndeterminateProgressRingView_i *)v4 setup];
  }
  return v4;
}

- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3 style:(unint64_t)a4 strokeWidth:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12 = [(CRLIndeterminateProgressRingView_i *)self p_strokeColorForStyle:self->_style];
  v13 = -[CRLIndeterminateProgressRingView_i initWithFrame:color:strokeWidth:](self, "initWithFrame:color:strokeWidth:", v12, x, y, width, height, a5);

  if (v13)
  {
    v13->_style = a4;
    v13->_strokeWidth = a5;
    v13->_gapAngle = 26.0;
    uint64_t v14 = [(CRLIndeterminateProgressRingView_i *)v13 p_strokeColorForStyle:v13->_style];
    color = v13->_color;
    v13->_color = (UIColor *)v14;

    [(CRLIndeterminateProgressRingView_i *)v13 setup];
  }
  return v13;
}

- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3 color:(id)a4 strokeWidth:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLIndeterminateProgressRingView_i;
  v13 = -[CRLIndeterminateProgressRingView_i initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_style = 2;
    v13->_strokeWidth = a5;
    v13->_gapAngle = 26.0;
    objc_storeStrong((id *)&v13->_color, a4);
    [(CRLIndeterminateProgressRingView_i *)v14 setup];
  }

  return v14;
}

- (void)setup
{
  id v13 = [(CRLIndeterminateProgressRingView_i *)self layer];
  [(CRLIndeterminateProgressRingView_i *)self strokeWidth];
  [v13 setLineWidth:];
  [v13 setLineCap:kCALineCapRound];
  id v3 = +[UIColor clearColor];
  [v13 setFillColor:[v3 CGColor]];

  [v13 setStrokeColor:[self->_color CGColor]];
  id v4 = +[UIColor clearColor];
  [v13 setBackgroundColor:[v4 CGColor]];

  [(CRLIndeterminateProgressRingView_i *)self _updateShapePath];
  uint64_t v5 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
  v6 = [v5 keyPath];
  v7 = [v13 valueForKeyPath:v6];

  [v5 setFromValue:v7];
  [v7 floatValue];
  v9 = +[NSNumber numberWithDouble:(double)(fmod(v8, 6.28318531) + 6.28318531)];
  [v5 setToValue:v9];

  [v5 setRemovedOnCompletion:0];
  LODWORD(v10) = 2139095040;
  [v5 setRepeatCount:v10];
  [v5 setFillMode:kCAFillModeBoth];
  [v5 setDuration:1.0];
  [v13 addAnimation:v5 forKey:@"CRLiOSIndeterminateProgressRingViewSpinnerAnimationKey"];
  v11 = +[UITraitCollection systemTraitsAffectingColorAppearance];
  id v12 = [(CRLIndeterminateProgressRingView_i *)self registerForTraitChanges:v11 withTarget:self action:"updateForAppearance"];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CRLIndeterminateProgressRingView_i;
  [(CRLIndeterminateProgressRingView_i *)&v5 layoutSubviews];
  id v3 = [(CRLIndeterminateProgressRingView_i *)self traitCollection];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100104BD0;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];

  [(CRLIndeterminateProgressRingView_i *)self _updateShapePath];
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  [(CRLIndeterminateProgressRingView_i *)self setColor:v4];
  v5.receiver = self;
  v5.super_class = (Class)CRLIndeterminateProgressRingView_i;
  [(CRLIndeterminateProgressRingView_i *)&v5 setTintColor:v4];
}

- (void)setColor:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  objc_super v5 = (void *)v4;
  if (v4 | (unint64_t)self->_color)
  {
    v11 = (void *)v4;
    unsigned __int8 v6 = [v4 isEqual:];
    objc_super v5 = v11;
    if ((v6 & 1) == 0)
    {
      if (v11)
      {
        v7 = v11;
      }
      else
      {
        v7 = [(CRLIndeterminateProgressRingView_i *)self p_strokeColorForStyle:[(CRLIndeterminateProgressRingView_i *)self style]];
      }
      color = self->_color;
      self->_color = v7;

      v9 = [(CRLIndeterminateProgressRingView_i *)self layer];
      [v9 setStrokeColor:[self->_color CGColor]];
      double v10 = [(CRLIndeterminateProgressRingView_i *)self layer];
      [v10 setNeedsDisplay];

      objc_super v5 = v11;
    }
  }
}

- (void)setGapAngle:(double)a3
{
  self->_gapAngle = a3;
  [(CRLIndeterminateProgressRingView_i *)self setNeedsLayout];
}

- (void)_updateShapePath
{
  id v18 = [(CRLIndeterminateProgressRingView_i *)self layer];
  [(CRLIndeterminateProgressRingView_i *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 * 0.5;
  double v12 = sub_100065738(v3, v5, v7, v9);
  double v14 = v13;
  v15 = +[UIBezierPath bezierPath];
  [(CRLIndeterminateProgressRingView_i *)self gapAngle];
  [v15 addArcWithCenter:1 radius:v12 startAngle:v14 endAngle:v11 clockwise:0.0];
  id v17 = v15;
  [v18 setPath:[v17 CGPath]];
  [v18 setBounds:v4, v6, v8, v10];
}

- (void)updateForAppearance
{
}

- (UIColor)color
{
  return self->_color;
}

- (double)gapAngle
{
  return self->_gapAngle;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
}

@end