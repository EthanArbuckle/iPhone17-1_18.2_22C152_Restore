@interface MonthWorkoutIndicator
+ (id)filledWorkoutCircleWithSize:(CGSize)a3;
+ (id)fitnessColors;
- (BOOL)hasWorkout;
- (MonthWorkoutIndicator)init;
- (id)actionForKey:(id)a3;
- (void)layoutSublayers;
- (void)setHasWorkout:(BOOL)a3;
@end

@implementation MonthWorkoutIndicator

- (MonthWorkoutIndicator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MonthWorkoutIndicator;
  v2 = [(MonthWorkoutIndicator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CALayer layer];
    backgroundLayer = v2->_backgroundLayer;
    v2->_backgroundLayer = (CALayer *)v3;

    -[CALayer setFrame:](v2->_backgroundLayer, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    [(MonthWorkoutIndicator *)v2 addSublayer:v2->_backgroundLayer];
  }
  return v2;
}

- (void)setHasWorkout:(BOOL)a3
{
  self->_hasWorkout = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CALayer *)self->_backgroundLayer setHidden:!self->_hasWorkout];

  +[CATransaction commit];
}

- (void)layoutSublayers
{
  v7.receiver = self;
  v7.super_class = (Class)MonthWorkoutIndicator;
  [(MonthWorkoutIndicator *)&v7 layoutSublayers];
  [(MonthWorkoutIndicator *)self bounds];
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:");
  uint64_t v3 = objc_opt_class();
  [(MonthWorkoutIndicator *)self bounds];
  [v3 filledWorkoutCircleWithSize:v4, v5];
  id v6 = objc_claimAutoreleasedReturnValue();
  -[CALayer setContents:](self->_backgroundLayer, "setContents:", [v6 CGImage]);
}

+ (id)filledWorkoutCircleWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  if (*(double *)&xmmword_10096B448 != a3.width || *((double *)&xmmword_10096B448 + 1) != a3.height)
  {
    xmmword_10096B448 = (__int128)a3;
    UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.double width = width;
    v20.size.CGFloat height = height;
    CGFloat MidX = CGRectGetMidX(v20);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.double width = width;
    v21.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v21);
    CGContextAddArc(CurrentContext, MidX, MidY, (width + -1.0) * 0.5, 0.0, 6.28318531, 1);
    CGContextClip(CurrentContext);
    v9 = [(id)objc_opt_class() fitnessColors];
    v10 = [v9 gradientLightColor];
    v11 = [v9 gradientDarkColor];
    v12 = (CGGradient *)+[ARUIMetricColors newGradientForStartColor:v10 endColor:v11];

    v18.y = 0.0;
    v18.x = width * 0.5;
    v19.x = width * 0.5;
    v19.y = height;
    CGContextDrawLinearGradient(CurrentContext, v12, v18, v19, 0);
    CGGradientRelease(v12);
    uint64_t v13 = UIGraphicsGetImageFromCurrentImageContext();
    v14 = (void *)qword_10096B440;
    qword_10096B440 = v13;

    UIGraphicsEndImageContext();
  }
  v15 = (void *)qword_10096B440;

  return v15;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)fitnessColors
{
  v2 = (void *)qword_10096B458;
  if (!qword_10096B458)
  {
    uint64_t v3 = +[ARUIMetricColors keyColors];
    double v4 = (void *)qword_10096B458;
    qword_10096B458 = v3;

    v2 = (void *)qword_10096B458;
  }

  return v2;
}

- (BOOL)hasWorkout
{
  return self->_hasWorkout;
}

- (void).cxx_destruct
{
}

@end