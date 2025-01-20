@interface DebugLocationAnnotationView
- (DebugLocationAnnotation)debugLocationAnnotation;
- (DebugLocationAnnotationView)initWithAnnotation:(id)a3 debugLocationAnnotation:(id)a4 reuseIdentifier:(id)a5;
- (void)_setMapPitchRadians:(double)a3;
- (void)_setMapRotationRadians:(double)a3;
- (void)_updateAccuracy;
- (void)_updateCourse;
- (void)_updateFillColor;
- (void)setDebugLocationAnnotation:(id)a3;
@end

@implementation DebugLocationAnnotationView

- (void)_updateFillColor
{
  switch([(DebugLocationAnnotation *)self->_debugLocationAnnotation locationType])
  {
    case 0u:
      double v3 = 0.200000003;
      double v4 = 1.0;
      goto LABEL_5;
    case 1u:
      double v3 = 0.200000003;
      double v4 = 1.0;
      goto LABEL_7;
    case 2u:
      double v3 = 0.400000006;
      double v4 = 0.0;
LABEL_5:
      double v5 = 0.0;
      goto LABEL_8;
    case 3u:
      double v3 = 0.200000003;
      double v4 = 0.0;
LABEL_7:
      double v5 = 1.0;
LABEL_8:
      id v6 = +[UIColor colorWithRed:v4 green:0.0 blue:v5 alpha:v3];
      [(UIView *)self->_circleView setBackgroundColor:v6];

      break;
    default:
      return;
  }
}

- (void)_updateCourse
{
  [(DebugLocationAnnotation *)self->_debugLocationAnnotation course];
  double v4 = v3;
  [(DebugLocationAnnotationView *)self _mapRotationRadians];
  CATransform3DMakeRotation(&v8, -(v5 - v4 * 0.0174532925), 0.0, 0.0, 1.0);
  id v6 = [(UIImageView *)self->_courseImageView layer];
  CATransform3D v7 = v8;
  [v6 setTransform:&v7];
}

- (void)_updateAccuracy
{
  if ([(DebugLocationAnnotation *)self->_debugLocationAnnotation locationType])
  {
    outerCircleView = self->_outerCircleView;
    [(UIView *)outerCircleView removeFromSuperview];
  }
  else
  {
    double v4 = [(DebugLocationAnnotation *)self->_debugLocationAnnotation location];
    [v4 horizontalAccuracy];
    -[DebugLocationAnnotationView _pointsForDistance:](self, "_pointsForDistance:");
    double v6 = v5;

    [(DebugLocationAnnotationView *)self bounds];
    double MidX = CGRectGetMidX(v17);
    [(DebugLocationAnnotationView *)self bounds];
    double MidY = CGRectGetMidY(v18);
    v9 = [(UIView *)self->_outerCircleView layer];
    [v9 setPosition:MidX, MidY];

    -[UIView setBounds:](self->_outerCircleView, "setBounds:", 0.0, 0.0, v6 + v6, v6 + v6);
    [(UIView *)self->_outerCircleView bounds];
    double v11 = v10 * 0.5;
    v12 = [(UIView *)self->_outerCircleView layer];
    [v12 setCornerRadius:v11];

    v13 = [(UIView *)self->_outerCircleView superview];

    if (!v13)
    {
      v14 = self->_outerCircleView;
      circleView = self->_circleView;
      [(DebugLocationAnnotationView *)self insertSubview:v14 belowSubview:circleView];
    }
  }
}

- (DebugLocationAnnotationView)initWithAnnotation:(id)a3 debugLocationAnnotation:(id)a4 reuseIdentifier:(id)a5
{
  id v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)DebugLocationAnnotationView;
  double v10 = [(DebugLocationAnnotationView *)&v43 initWithAnnotation:a3 reuseIdentifier:a5];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_debugLocationAnnotation, a4);
    id v12 = [v9 navType];
    id v13 = objc_alloc((Class)UIView);
    if (v12) {
      double v14 = 50.0;
    }
    else {
      double v14 = 18.0;
    }
    v15 = [v13 initWithFrame:0.0, 0.0, v14, v14];
    circleView = v11->_circleView;
    v11->_circleView = v15;

    [(DebugLocationAnnotationView *)v11 bounds];
    double MidX = CGRectGetMidX(v44);
    [(DebugLocationAnnotationView *)v11 bounds];
    double MidY = CGRectGetMidY(v45);
    v19 = [(UIView *)v11->_circleView layer];
    [v19 setPosition:MidX, MidY];

    [(UIView *)v11->_circleView bounds];
    double v21 = v20 * 0.5;
    v22 = [(UIView *)v11->_circleView layer];
    [v22 setCornerRadius:v21];

    [(DebugLocationAnnotationView *)v11 addSubview:v11->_circleView];
    [(DebugLocationAnnotationView *)v11 _updateFillColor];
    if ([v9 navType] == (id)1 || objc_msgSend(v9, "navType") == (id)2)
    {
      id v23 = objc_alloc((Class)UIImageView);
      v24 = +[UIImage imageNamed:@"MN-CourseArrow.png"];
      v25 = (UIImageView *)[v23 initWithImage:v24];
      courseImageView = v11->_courseImageView;
      v11->_courseImageView = v25;

      [(UIImageView *)v11->_courseImageView sizeToFit];
      [(UIView *)v11->_circleView bounds];
      double v27 = CGRectGetMidX(v46);
      [(UIImageView *)v11->_courseImageView bounds];
      double v29 = v27 - v28 * 0.5;
      [(UIView *)v11->_circleView bounds];
      double v30 = CGRectGetMidY(v47);
      [(UIImageView *)v11->_courseImageView bounds];
      double v32 = v30 - v31 * 0.5;
      [(UIImageView *)v11->_courseImageView bounds];
      double v34 = v33;
      [(UIImageView *)v11->_courseImageView bounds];
      -[UIImageView setFrame:](v11->_courseImageView, "setFrame:", v29, v32, v34);
      [(UIView *)v11->_circleView addSubview:v11->_courseImageView];
    }
    v35 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    outerCircleView = v11->_outerCircleView;
    v11->_outerCircleView = v35;

    v37 = [(UIView *)v11->_outerCircleView layer];
    [v37 setBorderWidth:3.0];

    id v38 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.200000003];
    id v39 = [v38 CGColor];
    v40 = [(UIView *)v11->_outerCircleView layer];
    [v40 setBorderColor:v39];

    [(DebugLocationAnnotationView *)v11 _updateAccuracy];
    v41 = v11;
  }

  return v11;
}

- (void)setDebugLocationAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_debugLocationAnnotation, a3);
  [(DebugLocationAnnotationView *)self _updateFillColor];
  [(DebugLocationAnnotationView *)self _updateCourse];

  [(DebugLocationAnnotationView *)self _updateAccuracy];
}

- (void)_setMapPitchRadians:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DebugLocationAnnotationView;
  -[DebugLocationAnnotationView _setMapPitchRadians:](&v11, "_setMapPitchRadians:");
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  CATransform3DMakeRotation(&v10, a3, 1.0, 0.0, 0.0);
  double v5 = [(UIView *)self->_circleView layer];
  CATransform3D v9 = v10;
  [v5 setTransform:&v9];

  CATransform3DMakeRotation(&v8, a3, 1.0, 0.0, 0.0);
  double v6 = [(UIView *)self->_outerCircleView layer];
  CATransform3D v7 = v8;
  [v6 setTransform:&v7];

  +[CATransaction commit];
}

- (void)_setMapRotationRadians:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DebugLocationAnnotationView;
  [(DebugLocationAnnotationView *)&v4 _setMapRotationRadians:a3];
  [(DebugLocationAnnotationView *)self _updateCourse];
}

- (DebugLocationAnnotation)debugLocationAnnotation
{
  return self->_debugLocationAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_courseImageView, 0);
  objc_storeStrong((id *)&self->_outerCircleView, 0);
  objc_storeStrong((id *)&self->_circleView, 0);

  objc_storeStrong((id *)&self->_debugLocationAnnotation, 0);
}

@end