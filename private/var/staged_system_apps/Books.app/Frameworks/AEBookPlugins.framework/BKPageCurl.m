@interface BKPageCurl
- (BKPageCurl)init;
- (BKPageCurlConfiguration)configuration;
- (BKPageCurlDelegate)delegate;
- (BOOL)cancelledManualCurl;
- (BOOL)curlStartNotificationSent;
- (BOOL)finished;
- (BOOL)forwardCurl;
- (BOOL)ignoreManualUpdates;
- (BOOL)inUncurl;
- (BOOL)isGoingToNextPage;
- (BOOL)nightMode;
- (BOOL)secondHalf;
- (BOOL)setupEndNotificationSent;
- (CABasicAnimation)curlAnimationAngle;
- (CABasicAnimation)curlAnimationBackColor0;
- (CABasicAnimation)curlAnimationBackColor1;
- (CABasicAnimation)curlAnimationRadius;
- (CABasicAnimation)curlAnimationShadowColor;
- (CABasicAnimation)curlAnimationTime;
- (CABasicAnimation)uncurlAnimationAngle;
- (CABasicAnimation)uncurlAnimationRadius;
- (CABasicAnimation)uncurlAnimationShadowColor;
- (CABasicAnimation)uncurlAnimationTime;
- (CAFilter)curlFilter;
- (CGPoint)lastPoint;
- (CGPoint)manualStartPoint;
- (NSArray)backPages;
- (NSArray)curlPages;
- (UIColor)backColor;
- (UIColor)pageColor;
- (UIView)backPage;
- (UIView)container;
- (UIView)extraView;
- (double)delay;
- (double)diagonalAngle;
- (double)diagonalLengthPixels;
- (double)duration;
- (double)initialCurlRadius;
- (double)k;
- (double)projectedDiagonal;
- (double)stabilization;
- (id)_backColor0AtPosition:(double)a3;
- (id)_backColor1AtPosition:(double)a3;
- (id)existingPages;
- (int)didEndCount;
- (int)type;
- (int64_t)spineLocation;
- (int64_t)state;
- (void)_animationDidStop:(BOOL)a3;
- (void)_beginAnimation;
- (void)_finishManualCurl;
- (void)_setupViews;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginManualCurlAtLocation:(CGPoint)a3;
- (void)cancelManualCurl;
- (void)cleanup;
- (void)ensureCurlFilterOnLayer:(id)a3;
- (void)finishManualCurl;
- (void)fullCleanup;
- (void)killCurl;
- (void)setBackColor:(id)a3;
- (void)setBackPage:(id)a3;
- (void)setBackPages:(id)a3;
- (void)setCancelledManualCurl:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurlAnimationAngle:(id)a3;
- (void)setCurlAnimationBackColor0:(id)a3;
- (void)setCurlAnimationBackColor1:(id)a3;
- (void)setCurlAnimationRadius:(id)a3;
- (void)setCurlAnimationShadowColor:(id)a3;
- (void)setCurlAnimationTime:(id)a3;
- (void)setCurlFilter:(id)a3;
- (void)setCurlPages:(id)a3;
- (void)setCurlStartNotificationSent:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagonalAngle:(double)a3;
- (void)setDiagonalLengthPixels:(double)a3;
- (void)setDidEndCount:(int)a3;
- (void)setDuration:(double)a3;
- (void)setExistingPages:(id)a3;
- (void)setExtraView:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setIgnoreManualUpdates:(BOOL)a3;
- (void)setInUncurl:(BOOL)a3;
- (void)setInitialCurlRadius:(double)a3;
- (void)setK:(double)a3;
- (void)setLastPoint:(CGPoint)a3;
- (void)setManualStartPoint:(CGPoint)a3;
- (void)setNightMode:(BOOL)a3;
- (void)setPageColor:(id)a3;
- (void)setProjectedDiagonal:(double)a3;
- (void)setSecondHalf:(BOOL)a3;
- (void)setSetupEndNotificationSent:(BOOL)a3;
- (void)setSpineLocation:(int64_t)a3;
- (void)setStabilization:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setType:(int)a3;
- (void)setUncurlAnimationAngle:(id)a3;
- (void)setUncurlAnimationRadius:(id)a3;
- (void)setUncurlAnimationShadowColor:(id)a3;
- (void)setUncurlAnimationTime:(id)a3;
- (void)startAutoCurl;
- (void)updateManualCurlToLocation:(CGPoint)a3;
@end

@implementation BKPageCurl

- (BKPageCurl)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKPageCurl;
  result = [(BKPageCurl *)&v3 init];
  if (result) {
    result->_duration = 0.3;
  }
  return result;
}

- (BOOL)forwardCurl
{
  return (self->_type & 0xFFFFFFFD) == 0;
}

- (CABasicAnimation)curlAnimationTime
{
  curlAnimationTime = self->_curlAnimationTime;
  if (!curlAnimationTime)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationTime;
    self->_curlAnimationTime = v4;

    v6 = +[CAMediaTimingFunction functionWithControlPoints:&kCurlSmoothControlPoints];
    [(CABasicAnimation *)self->_curlAnimationTime setTimingFunction:v6];

    [(CABasicAnimation *)self->_curlAnimationTime setKeyPath:@"filters.curl.inputTime"];
    [(BKPageCurl *)self duration];
    -[CABasicAnimation setDuration:](self->_curlAnimationTime, "setDuration:");
    [(CABasicAnimation *)self->_curlAnimationTime setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)self->_curlAnimationTime setRemovedOnCompletion:0];
    [(CABasicAnimation *)self->_curlAnimationTime setDelegate:self];
    v7 = +[NSNumber numberWithFloat:0.0];
    [(CABasicAnimation *)self->_curlAnimationTime setFromValue:v7];

    LODWORD(v8) = 1.0;
    v9 = +[NSNumber numberWithFloat:v8];
    [(CABasicAnimation *)self->_curlAnimationTime setToValue:v9];

    curlAnimationTime = self->_curlAnimationTime;
  }

  return curlAnimationTime;
}

- (CABasicAnimation)uncurlAnimationTime
{
  uncurlAnimationTime = self->_uncurlAnimationTime;
  if (!uncurlAnimationTime)
  {
    v4 = [(BKPageCurl *)self curlAnimationTime];
    v5 = (CABasicAnimation *)[v4 copy];
    v6 = self->_uncurlAnimationTime;
    self->_uncurlAnimationTime = v5;

    [(CABasicAnimation *)self->_uncurlAnimationTime ae_reverseValues];
    uncurlAnimationTime = self->_uncurlAnimationTime;
  }

  return uncurlAnimationTime;
}

- (CABasicAnimation)curlAnimationRadius
{
  curlAnimationRadius = self->_curlAnimationRadius;
  if (!curlAnimationRadius)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationRadius;
    self->_curlAnimationRadius = v4;

    v6 = +[CAMediaTimingFunction functionWithControlPoints:&kCurlSmoothControlPoints];
    [(CABasicAnimation *)self->_curlAnimationRadius setTimingFunction:v6];

    [(CABasicAnimation *)self->_curlAnimationRadius setKeyPath:@"filters.curl.inputRadius"];
    [(BKPageCurl *)self duration];
    -[CABasicAnimation setDuration:](self->_curlAnimationRadius, "setDuration:");
    [(CABasicAnimation *)self->_curlAnimationRadius setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)self->_curlAnimationRadius setRemovedOnCompletion:0];
    v7 = [(BKPageCurl *)self container];
    unsigned int v8 = [v7 im_isCompactWidth];
    LODWORD(v9) = 1125515264;
    if (v8) {
      *(float *)&double v9 = 40.0;
    }
    v10 = +[NSNumber numberWithFloat:v9];
    [(CABasicAnimation *)self->_curlAnimationRadius setFromValue:v10];

    v11 = [(BKPageCurl *)self container];
    unsigned int v12 = [v11 im_isCompactWidth];
    LODWORD(v13) = 1120403456;
    if (v12) {
      *(float *)&double v13 = 300.0;
    }
    v14 = +[NSNumber numberWithFloat:v13];
    [(CABasicAnimation *)self->_curlAnimationRadius setToValue:v14];

    curlAnimationRadius = self->_curlAnimationRadius;
  }

  return curlAnimationRadius;
}

- (CABasicAnimation)uncurlAnimationRadius
{
  uncurlAnimationRadius = self->_uncurlAnimationRadius;
  if (!uncurlAnimationRadius)
  {
    v4 = [(BKPageCurl *)self curlAnimationRadius];
    v5 = (CABasicAnimation *)[v4 copy];
    v6 = self->_uncurlAnimationRadius;
    self->_uncurlAnimationRadius = v5;

    [(CABasicAnimation *)self->_uncurlAnimationRadius ae_reverseValues];
    uncurlAnimationRadius = self->_uncurlAnimationRadius;
  }

  return uncurlAnimationRadius;
}

- (CABasicAnimation)curlAnimationAngle
{
  if (!self->_curlAnimationAngle)
  {
    objc_super v3 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    curlAnimationAngle = self->_curlAnimationAngle;
    self->_curlAnimationAngle = v3;

    v5 = +[CAMediaTimingFunction functionWithControlPoints:&kCurlEaseOutControlPoints];
    [(CABasicAnimation *)self->_curlAnimationAngle setTimingFunction:v5];

    [(CABasicAnimation *)self->_curlAnimationAngle setKeyPath:@"filters.curl.inputAngle"];
    [(BKPageCurl *)self duration];
    -[CABasicAnimation setDuration:](self->_curlAnimationAngle, "setDuration:");
    [(CABasicAnimation *)self->_curlAnimationAngle setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)self->_curlAnimationAngle setRemovedOnCompletion:0];
    unint64_t v6 = [(BKPageCurl *)self spineLocation];
    if (v6 >= 3)
    {
      if (v6 != 3) {
        goto LABEL_7;
      }
      LODWORD(v7) = -1095583550;
      v10 = +[NSNumber numberWithFloat:v7];
      [(CABasicAnimation *)self->_curlAnimationAngle setFromValue:v10];

      double v9 = 0.0 - self->_stabilization;
    }
    else
    {
      LODWORD(v7) = 1079994099;
      unsigned int v8 = +[NSNumber numberWithFloat:v7];
      [(CABasicAnimation *)self->_curlAnimationAngle setFromValue:v8];

      double v9 = self->_stabilization + 3.14159265;
    }
    *(float *)&double v9 = v9;
    v11 = +[NSNumber numberWithFloat:v9];
    [(CABasicAnimation *)self->_curlAnimationAngle setToValue:v11];
  }
LABEL_7:
  unsigned int v12 = self->_curlAnimationAngle;

  return v12;
}

- (CABasicAnimation)uncurlAnimationAngle
{
  uncurlAnimationAngle = self->_uncurlAnimationAngle;
  if (!uncurlAnimationAngle)
  {
    v4 = [(BKPageCurl *)self curlAnimationAngle];
    v5 = (CABasicAnimation *)[v4 copy];
    unint64_t v6 = self->_uncurlAnimationAngle;
    self->_uncurlAnimationAngle = v5;

    double v7 = +[CAMediaTimingFunction functionWithControlPoints:&kCurlEaseInControlPoints];
    [(CABasicAnimation *)self->_uncurlAnimationAngle setTimingFunction:v7];

    [(CABasicAnimation *)self->_uncurlAnimationAngle ae_reverseValues];
    uncurlAnimationAngle = self->_uncurlAnimationAngle;
  }

  return uncurlAnimationAngle;
}

- (CABasicAnimation)curlAnimationShadowColor
{
  if (!self->_curlAnimationShadowColor)
  {
    objc_super v3 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    curlAnimationShadowColor = self->_curlAnimationShadowColor;
    self->_curlAnimationShadowColor = v3;

    v12[0] = xmmword_18EDA0;
    v12[1] = unk_18EDB0;
    v5 = +[CAMediaTimingFunction functionWithControlPoints:v12];
    [(CABasicAnimation *)self->_curlAnimationShadowColor setTimingFunction:v5];

    [(CABasicAnimation *)self->_curlAnimationShadowColor setKeyPath:@"filters.curl.inputShadowColor"];
    [(BKPageCurl *)self duration];
    -[CABasicAnimation setDuration:](self->_curlAnimationShadowColor, "setDuration:");
    [(CABasicAnimation *)self->_curlAnimationShadowColor setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)self->_curlAnimationShadowColor setRemovedOnCompletion:0];
    id v6 = +[UIColor colorWithWhite:0.0 alpha:0.0];
    -[CABasicAnimation setToValue:](self->_curlAnimationShadowColor, "setToValue:", [v6 CGColor]);

    if ([(BKPageCurl *)self nightMode]) {
      double v7 = 0.7;
    }
    else {
      double v7 = 0.25;
    }
    if (![(BKPageCurl *)self nightMode]
      || (double v8 = 0.5, [(BKPageCurl *)self type]) && [(BKPageCurl *)self type] != 1)
    {
      double v8 = 0.0;
    }
    id v9 = +[UIColor colorWithWhite:v8 alpha:v7];
    -[CABasicAnimation setFromValue:](self->_curlAnimationShadowColor, "setFromValue:", [v9 CGColor]);
  }
  v10 = self->_curlAnimationShadowColor;

  return v10;
}

- (CABasicAnimation)uncurlAnimationShadowColor
{
  uncurlAnimationShadowColor = self->_uncurlAnimationShadowColor;
  if (!uncurlAnimationShadowColor)
  {
    v4 = [(BKPageCurl *)self curlAnimationShadowColor];
    v5 = (CABasicAnimation *)[v4 copy];
    id v6 = self->_uncurlAnimationShadowColor;
    self->_uncurlAnimationShadowColor = v5;

    v9[0] = xmmword_18ED80;
    v9[1] = unk_18ED90;
    double v7 = +[CAMediaTimingFunction functionWithControlPoints:v9];
    [(CABasicAnimation *)self->_uncurlAnimationShadowColor setTimingFunction:v7];

    [(CABasicAnimation *)self->_uncurlAnimationShadowColor ae_reverseValues];
    uncurlAnimationShadowColor = self->_uncurlAnimationShadowColor;
  }

  return uncurlAnimationShadowColor;
}

- (CABasicAnimation)curlAnimationBackColor0
{
  curlAnimationBackColor0 = self->_curlAnimationBackColor0;
  if (!curlAnimationBackColor0)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationBackColor0;
    self->_curlAnimationBackColor0 = v4;

    v10[0] = xmmword_18EDA0;
    v10[1] = unk_18EDB0;
    id v6 = +[CAMediaTimingFunction functionWithControlPoints:v10];
    [(CABasicAnimation *)self->_curlAnimationBackColor0 setTimingFunction:v6];

    [(CABasicAnimation *)self->_curlAnimationBackColor0 setKeyPath:@"filters.curl.inputBackColor0"];
    [(BKPageCurl *)self duration];
    -[CABasicAnimation setDuration:](self->_curlAnimationBackColor0, "setDuration:");
    [(CABasicAnimation *)self->_curlAnimationBackColor0 setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)self->_curlAnimationBackColor0 setRemovedOnCompletion:0];
    id v7 = [(BKPageCurl *)self _backColor0AtPosition:0.0];
    -[CABasicAnimation setFromValue:](self->_curlAnimationBackColor0, "setFromValue:", [v7 CGColor]);

    id v8 = [(BKPageCurl *)self _backColor0AtPosition:1.0];
    -[CABasicAnimation setToValue:](self->_curlAnimationBackColor0, "setToValue:", [v8 CGColor]);

    curlAnimationBackColor0 = self->_curlAnimationBackColor0;
  }

  return curlAnimationBackColor0;
}

- (CABasicAnimation)curlAnimationBackColor1
{
  curlAnimationBackColor1 = self->_curlAnimationBackColor1;
  if (!curlAnimationBackColor1)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationBackColor1;
    self->_curlAnimationBackColor1 = v4;

    v10[0] = xmmword_18EDA0;
    v10[1] = unk_18EDB0;
    id v6 = +[CAMediaTimingFunction functionWithControlPoints:v10];
    [(CABasicAnimation *)self->_curlAnimationBackColor1 setTimingFunction:v6];

    [(CABasicAnimation *)self->_curlAnimationBackColor1 setKeyPath:@"filters.curl.inputBackColor1"];
    [(BKPageCurl *)self duration];
    -[CABasicAnimation setDuration:](self->_curlAnimationBackColor1, "setDuration:");
    [(CABasicAnimation *)self->_curlAnimationBackColor1 setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)self->_curlAnimationBackColor1 setRemovedOnCompletion:0];
    id v7 = [(BKPageCurl *)self _backColor1AtPosition:0.0];
    -[CABasicAnimation setFromValue:](self->_curlAnimationBackColor1, "setFromValue:", [v7 CGColor]);

    id v8 = [(BKPageCurl *)self _backColor1AtPosition:1.0];
    -[CABasicAnimation setToValue:](self->_curlAnimationBackColor1, "setToValue:", [v8 CGColor]);

    curlAnimationBackColor1 = self->_curlAnimationBackColor1;
  }

  return curlAnimationBackColor1;
}

- (BOOL)isGoingToNextPage
{
  return ![(BKPageCurl *)self type] || [(BKPageCurl *)self type] == 2;
}

- (void)ensureCurlFilterOnLayer:(id)a3
{
  id v4 = a3;
  if (!self->_curlFilter)
  {
    id v5 = objc_alloc((Class)CAFilter);
    id v6 = (CAFilter *)[v5 initWithType:kCAFilterPageCurl];
    curlFilter = self->_curlFilter;
    self->_curlFilter = v6;

    [(CAFilter *)self->_curlFilter setName:@"curl"];
    id v8 = self->_curlFilter;
    id v9 = +[UIColor whiteColor];
    -[CAFilter setValue:forKeyPath:](v8, "setValue:forKeyPath:", [v9 CGColor], @"inputFrontColor");

    if ([(BKPageCurl *)self nightMode]) {
      double v10 = 0.7;
    }
    else {
      double v10 = 0.25;
    }
    unsigned int v11 = [(BKPageCurl *)self nightMode];
    double v12 = 0.15;
    if (v11) {
      double v12 = 0.0;
    }
    double v13 = +[UIColor colorWithWhite:v12 alpha:v10];
    v14 = [(BKPageCurl *)self _backColor0AtPosition:0.0];
    v15 = [(BKPageCurl *)self _backColor1AtPosition:0.0];
    v16 = self->_curlFilter;
    id v17 = v14;
    -[CAFilter setValue:forKeyPath:](v16, "setValue:forKeyPath:", [v17 CGColor], @"inputBackColor0");
    v18 = self->_curlFilter;
    id v19 = v15;
    -[CAFilter setValue:forKeyPath:](v18, "setValue:forKeyPath:", [v19 CGColor], @"inputBackColor1");
    v20 = self->_curlFilter;
    id v21 = v13;
    -[CAFilter setValue:forKeyPath:](v20, "setValue:forKeyPath:", [v21 CGColor], @"inputShadowColor");
  }
  v22 = [v4 filters];
  id v23 = [v22 count];

  if (!v23)
  {
    id v24 = [(CAFilter *)self->_curlFilter copy];
    id v26 = v24;
    v25 = +[NSArray arrayWithObjects:&v26 count:1];
    [v4 setFilters:v25];
  }
}

- (void)_setupViews
{
  int64_t v3 = [(BKPageCurl *)self spineLocation];
  id v4 = [(BKPageCurl *)self backPage];
  if (![(BKPageCurl *)self type])
  {
    id v5 = [(BKPageCurl *)self existingPages];
    uint64_t v6 = [v5 lastObject];
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    id v5 = [(BKPageCurl *)self existingPages];
    uint64_t v6 = [v5 objectAtIndex:0];
LABEL_5:
    id v7 = (void *)v6;

    id v8 = v4;
    id v4 = v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  int64_t v18 = v3;
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  [v9 addObject:v4];
  if (v8) {
    [v9 addObject:v8];
  }
  [(BKPageCurl *)self setCurlPages:v9];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v10 = [(BKPageCurl *)self existingPages];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v14);
        v16 = [(BKPageCurl *)self container];
        [v16 insertSubview:v15 atIndex:0];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  if ([(BKPageCurl *)self type] == 1 && v18 != 2)
  {
    id v17 = [(BKPageCurl *)self container];
    [v17 addSubview:v4];
  }
}

- (id)_backColor0AtPosition:(double)a3
{
  int64_t v5 = [(BKPageCurl *)self spineLocation];
  if ([(BKPageCurl *)self nightMode])
  {
    if (v5 == 2)
    {
      double v6 = 0.125;
      double v7 = 0.65;
      if (a3 > 0.75) {
        double v6 = (1.0 - a3) * 4.0 * 0.125;
      }
    }
    else
    {
      unsigned int v8 = [(BKPageCurl *)self type];
      if (v8 && [(BKPageCurl *)self type] != 1)
      {
        double v6 = 0.6;
        double v7 = 0.15;
      }
      else
      {
        double v6 = 0.425;
        double v7 = 0.4;
      }
    }
  }
  else
  {
    if (v5 != 2)
    {
      id v9 = [(BKPageCurl *)self pageColor];
      double v10 = [v9 colorWithAlphaComponent:0.8];

      goto LABEL_14;
    }
    double v7 = 1.0;
    double v6 = 0.0;
  }
  double v10 = +[UIColor colorWithWhite:v7 alpha:v6];
LABEL_14:

  return v10;
}

- (id)_backColor1AtPosition:(double)a3
{
  if ([(BKPageCurl *)self nightMode]) {
    double v4 = 0.7;
  }
  else {
    double v4 = 0.55;
  }
  int64_t v5 = [(BKPageCurl *)self backColor];
  double v6 = [v5 colorWithAlphaComponent:v4];

  return v6;
}

- (void)startAutoCurl
{
  [(BKPageCurl *)self _setupViews];
  [(BKPageCurl *)self delay];
  if (v3 == 0.0)
  {
    [(BKPageCurl *)self _beginAnimation];
  }
  else
  {
    [(BKPageCurl *)self delay];
    -[BKPageCurl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_beginAnimation", 0);
  }
}

- (void)_beginAnimation
{
  int64_t v3 = [(BKPageCurl *)self spineLocation];
  double v4 = [(BKPageCurl *)self curlPages];
  if ([v4 count])
  {
    int64_t v5 = [(BKPageCurl *)self curlPages];
    double v6 = [v5 objectAtIndex:0];
  }
  else
  {
    double v6 = 0;
  }

  double v7 = [(BKPageCurl *)self curlPages];
  if ((unint64_t)[v7 count] < 2)
  {
    id v9 = 0;
  }
  else
  {
    unsigned int v8 = [(BKPageCurl *)self curlPages];
    id v9 = [v8 objectAtIndex:1];
  }
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if (v6)
  {
    id v11 = [v6 layer];
    [v10 addObject:v11];
  }
  if (v9 && v9 != v6)
  {
    id v12 = [v9 layer];
    [v10 addObject:v12];
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v89;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v89 != v16) {
          objc_enumerationMutation(v13);
        }
        [(BKPageCurl *)self ensureCurlFilterOnLayer:*(void *)(*((void *)&v88 + 1) + 8 * i)];
      }
      id v15 = [v13 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v15);
  }

  v73 = self;
  v68 = v6;
  if ([(BKPageCurl *)self type] != 1 || v3 == 2)
  {
    int64_t v18 = [(BKPageCurl *)self curlAnimationTime];
    long long v19 = [(BKPageCurl *)self curlAnimationRadius];
    long long v20 = [(BKPageCurl *)self curlAnimationAngle];
    long long v21 = [(BKPageCurl *)self curlAnimationShadowColor];
    if ([(BKPageCurl *)self nightMode])
    {
      id v23 = [(BKPageCurl *)self curlAnimationBackColor0];
      long long v22 = [(BKPageCurl *)self curlAnimationBackColor1];
    }
    else
    {
      id v23 = 0;
      long long v22 = 0;
    }
    if (v3 == 2)
    {
      unsigned int v74 = [(BKPageCurl *)v73 type];
      LODWORD(v24) = 1125515264;
      v25 = +[NSNumber numberWithFloat:v24];
      [v19 setFromValue:v25];

      LODWORD(v26) = 1.0;
      v27 = +[NSNumber numberWithFloat:v26];
      [v19 setToValue:v27];

      if (v74)
      {
        LODWORD(v28) = -1095583550;
        v29 = +[NSNumber numberWithFloat:v28];
        [v20 setFromValue:v29];

        double v30 = 0.0 - v73->_stabilization;
        *(float *)&double v30 = v30;
        v31 = +[NSNumber numberWithFloat:v30];
        [v20 setToValue:v31];
      }
      v32 = [(BKPageCurl *)v73 container];
      [v32 insertSubview:v68 atIndex:1];

      v33 = [(BKPageCurl *)v73 container];
      [v33 addSubview:v67];

      v34 = [v67 layer];
      CATransform3DMakeScale(&v87, -1.0, 1.0, 1.0);
      CATransform3D v86 = v87;
      [v34 setSublayerTransform:&v86];
      v35 = [v68 layer];
      v75 = [v35 valueForKeyPath:@"filters.curl"];

      v36 = +[NSNumber numberWithBool:0];
      [v75 setValue:v36 forKey:@"inputBackEnabled"];

      v37 = [v34 valueForKeyPath:@"filters.curl"];
      v38 = +[NSNumber numberWithBool:0];
      [v37 setValue:v38 forKey:@"inputFrontEnabled"];
    }
  }
  else
  {
    int64_t v18 = [(BKPageCurl *)self uncurlAnimationTime];
    long long v19 = [(BKPageCurl *)self uncurlAnimationRadius];
    long long v20 = [(BKPageCurl *)self uncurlAnimationAngle];
    long long v21 = [(BKPageCurl *)self uncurlAnimationShadowColor];
    long long v22 = 0;
    id v23 = 0;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v13;
  id v76 = [obj countByEnumeratingWithState:&v82 objects:v93 count:16];
  if (v76)
  {
    uint64_t v71 = *(void *)v83;
    do
    {
      for (j = 0; j != v76; j = (char *)j + 1)
      {
        if (*(void *)v83 != v71) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v82 + 1) + 8 * (void)j);
        v41 = [v18 fromValue];
        v42 = [v18 keyPath];
        [v40 setValue:v41 forKeyPath:v42];

        v43 = [v19 fromValue];
        v44 = [v19 keyPath];
        [v40 setValue:v43 forKeyPath:v44];

        v45 = [v20 fromValue];
        v46 = [v20 keyPath];
        [v40 setValue:v45 forKeyPath:v46];

        v47 = [v21 fromValue];
        v48 = [v21 keyPath];
        [v40 setValue:v47 forKeyPath:v48];

        if (v23)
        {
          v49 = [v23 fromValue];
          v50 = [v23 keyPath];
          [v40 setValue:v49 forKeyPath:v50];
        }
        if (v22)
        {
          v51 = [v22 fromValue];
          v52 = [v22 keyPath];
          [v40 setValue:v51 forKeyPath:v52];
        }
      }
      id v76 = [obj countByEnumeratingWithState:&v82 objects:v93 count:16];
    }
    while (v76);
  }

  +[CATransaction begin];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obja = obj;
  id v77 = [obja countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (v77)
  {
    uint64_t v72 = *(void *)v79;
    do
    {
      for (k = 0; k != v77; k = (char *)k + 1)
      {
        if (*(void *)v79 != v72) {
          objc_enumerationMutation(obja);
        }
        v54 = *(void **)(*((void *)&v78 + 1) + 8 * (void)k);
        ++v73->_didEndCount;
        [v54 addAnimation:v18 forKey:@"curlTime"];
        [v54 addAnimation:v19 forKey:@"curlRadius"];
        [v54 addAnimation:v20 forKey:@"curlAngle"];
        [v54 addAnimation:v21 forKey:@"curlShadowColor"];
        if (v23) {
          [v54 addAnimation:v23 forKey:@"curlBackColor0"];
        }
        if (v22) {
          [v54 addAnimation:v22 forKey:@"curlBackColor1"];
        }
        v55 = [v18 toValue];
        v56 = [v18 keyPath];
        [v54 setValue:v55 forKeyPath:v56];

        v57 = [v19 toValue];
        v58 = [v19 keyPath];
        [v54 setValue:v57 forKeyPath:v58];

        v59 = [v20 toValue];
        v60 = [v20 keyPath];
        [v54 setValue:v59 forKeyPath:v60];

        v61 = [v21 toValue];
        v62 = [v21 keyPath];
        [v54 setValue:v61 forKeyPath:v62];

        if (v23)
        {
          v63 = [v23 toValue];
          v64 = [v23 keyPath];
          [v54 setValue:v63 forKeyPath:v64];
        }
        if (v22)
        {
          v65 = [v22 toValue];
          v66 = [v22 keyPath];
          [v54 setValue:v65 forKeyPath:v66];
        }
      }
      id v77 = [obja countByEnumeratingWithState:&v78 objects:v92 count:16];
    }
    while (v77);
  }

  +[CATransaction commit];
  v73->_state = 1;
}

- (void)beginManualCurlAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(BKPageCurl *)self spineLocation];
  int64_t v7 = [(BKPageCurl *)self spineLocation];
  unsigned int v8 = [(BKPageCurl *)self curlPages];
  id v9 = [v8 lastObject];

  uint64_t v10 = [(BKPageCurl *)self backPage];
  long long v89 = (char *)v6;
  if (v6 == 2)
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    [v11 addObject:v9];
    if (v10) {
      [v11 addObject:v10];
    }
    [(BKPageCurl *)self setCurlPages:v11];
  }
  long long v88 = (void *)v10;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v12 = [(BKPageCurl *)self existingPages];
  id v13 = [v12 countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v107;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v107 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v106 + 1) + 8 * i);
        int64_t v18 = [(BKPageCurl *)self container];
        [v18 insertSubview:v17 atIndex:0];
      }
      id v14 = [v12 countByEnumeratingWithState:&v106 objects:v113 count:16];
    }
    while (v14);
  }

  if (v89 == (unsigned char *)&dword_0 + 2)
  {
    long long v19 = [(BKPageCurl *)self container];
    [v19 insertSubview:v9 atIndex:1];

    long long v20 = [(BKPageCurl *)self container];
    long long v21 = v88;
    [v20 addSubview:v88];
LABEL_21:

    goto LABEL_22;
  }
  long long v21 = v88;
  if ([(BKPageCurl *)self type] == 3)
  {
    long long v22 = [(BKPageCurl *)self existingPages];
    long long v20 = [v22 lastObject];

    id v23 = [(BKPageCurl *)self container];
    [v23 insertSubview:v9 aboveSubview:v20];

    goto LABEL_21;
  }
  unsigned int v24 = [(BKPageCurl *)self type];
  if (v24 == 2 && v88 && v88 != v9)
  {
    long long v20 = [(BKPageCurl *)self container];
    [v20 insertSubview:v88 belowSubview:v9];
    goto LABEL_21;
  }
LABEL_22:
  id v25 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  double v26 = [v9 layer];
  [v25 addObject:v26];
  if (v21 && v21 != v9 && v89 == (unsigned char *)&dword_0 + 2)
  {
    v27 = [v21 layer];
    [v25 addObject:v27];
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v28 = v25;
  id v29 = [v28 countByEnumeratingWithState:&v102 objects:v112 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v103;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v103 != v31) {
          objc_enumerationMutation(v28);
        }
        [(BKPageCurl *)self ensureCurlFilterOnLayer:*(void *)(*((void *)&v102 + 1) + 8 * (void)j)];
      }
      id v30 = [v28 countByEnumeratingWithState:&v102 objects:v112 count:16];
    }
    while (v30);
  }

  double v33 = 1.0;
  if (v89 == (unsigned char *)&dword_0 + 2)
  {
    v34 = [v21 layer];
    CATransform3DMakeScale(&v101, -1.0, 1.0, 1.0);
    CATransform3D v100 = v101;
    [v34 setSublayerTransform:&v100];
    v35 = [v26 valueForKeyPath:@"filters.curl"];
    v36 = +[NSNumber numberWithBool:0];
    [v35 setValue:v36 forKey:@"inputBackEnabled"];

    v37 = [v34 valueForKeyPath:@"filters.curl"];
    v38 = +[NSNumber numberWithBool:0];
    [v37 setValue:v38 forKey:@"inputFrontEnabled"];

    double v33 = 2.0;
  }
  [v9 bounds];
  CGFloat v39 = v114.origin.x;
  CGFloat v40 = v114.origin.y;
  long double width = v114.size.width;
  long double height = v114.size.height;
  double v43 = CGRectGetWidth(v114);
  self->_lastPoint.double x = x;
  self->_lastPoint.double y = y;
  if ([(BKPageCurl *)self type] != 3)
  {
    self->_manualStartPoint.double x = x;
    self->_manualStartPoint.double y = y;
    double v44 = width;
    if (v7 != 3) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  if (v7 == 3)
  {
    self->_manualStartPoint.double x = 0.0;
    self->_manualStartPoint.double y = y;
LABEL_39:
    double v44 = -width;
    goto LABEL_41;
  }
  self->_manualStartPoint.double x = v33 * v43 - x;
  self->_manualStartPoint.double y = y;
  double v44 = width;
LABEL_41:
  CATransform3D v86 = v9;
  CATransform3D v87 = v26;
  self->_diagonalAngle = atan2(height, v44);
  self->_diagonalLengthPixels = hypot(width, height);
  v115.origin.double x = v39;
  v115.origin.double y = v40;
  v115.size.long double width = width;
  v115.size.long double height = height;
  if (y < CGRectGetHeight(v115) * 0.5) {
    self->_diagonalAngle = -self->_diagonalAngle;
  }
  double v45 = 15.0;
  if (v89 != (unsigned char *)&dword_0 + 2) {
    double v45 = 20.0;
  }
  self->_initialCurlRadius = v45;
  self->_k = (150.0 - v45) / 20.0;
  v46 = [(BKPageCurl *)self curlAnimationTime];
  v47 = [(BKPageCurl *)self curlAnimationRadius];
  v48 = [(BKPageCurl *)self curlAnimationAngle];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v28;
  id v49 = [obj countByEnumeratingWithState:&v96 objects:v111 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v97;
    do
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(void *)v97 != v51) {
          objc_enumerationMutation(obj);
        }
        v53 = *(void **)(*((void *)&v96 + 1) + 8 * (void)k);
        v54 = [v46 fromValue];
        v55 = [v46 keyPath];
        [v53 setValue:v54 forKeyPath:v55];

        v56 = [v47 fromValue];
        v57 = [v47 keyPath];
        [v53 setValue:v56 forKeyPath:v57];

        v58 = [v48 fromValue];
        v59 = [v48 keyPath];
        [v53 setValue:v58 forKeyPath:v59];
      }
      id v50 = [obj countByEnumeratingWithState:&v96 objects:v111 count:16];
    }
    while (v50);
  }

  if ([(BKPageCurl *)self type] != 3 || v89 == (unsigned char *)&dword_0 + 2)
  {
    id v61 = v46;
    id v63 = v47;
    id v65 = v48;
  }
  else
  {
    self->_inUncurl = 1;
    -[BKPageCurl updateManualCurlToLocation:](self, "updateManualCurlToLocation:", x, y);
    self->_ignoreManualUpdates = 1;
    v60 = [(BKPageCurl *)self uncurlAnimationTime];
    id v61 = [v60 copy];

    v62 = [(BKPageCurl *)self uncurlAnimationRadius];
    id v63 = [v62 copy];

    v64 = [(BKPageCurl *)self uncurlAnimationAngle];
    id v65 = [v64 copy];

    [(BKPageCurl *)self duration];
    [v61 setDuration:v66 * 0.5];
    [(BKPageCurl *)self duration];
    [v63 setDuration:v67 * 0.5];
    [(BKPageCurl *)self duration];
    [v65 setDuration:v68 * 0.5];
    v69 = [v61 keyPath];
    v70 = [v87 valueForKeyPath:v69];
    [v61 setToValue:v70];

    uint64_t v71 = [v63 keyPath];
    uint64_t v72 = [v87 valueForKeyPath:v71];
    [v63 setToValue:v72];

    v73 = [v65 keyPath];
    unsigned int v74 = [v87 valueForKeyPath:v73];
    [v65 setToValue:v74];

    +[CATransaction begin];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v90 = obj;
    id v75 = [v90 countByEnumeratingWithState:&v92 objects:v110 count:16];
    if (v75)
    {
      id v76 = v75;
      uint64_t v77 = *(void *)v93;
      do
      {
        for (m = 0; m != v76; m = (char *)m + 1)
        {
          if (*(void *)v93 != v77) {
            objc_enumerationMutation(v90);
          }
          long long v79 = *(void **)(*((void *)&v92 + 1) + 8 * (void)m);
          ++self->_didEndCount;
          [v79 addAnimation:v61 forKey:@"curlTime"];
          [v79 addAnimation:v63 forKey:@"curlRadius"];
          [v79 addAnimation:v65 forKey:@"curlAngle"];
          long long v80 = [v61 fromValue];
          long long v81 = [v61 keyPath];
          [v79 setValue:v80 forKeyPath:v81];

          long long v82 = [v63 fromValue];
          long long v83 = [v63 keyPath];
          [v79 setValue:v82 forKeyPath:v83];

          long long v84 = [v65 fromValue];
          long long v85 = [v65 keyPath];
          [v79 setValue:v84 forKeyPath:v85];
        }
        id v76 = [v90 countByEnumeratingWithState:&v92 objects:v110 count:16];
      }
      while (v76);
    }

    +[CATransaction commit];
    self->_state = 1;
  }
}

- (void)updateManualCurlToLocation:(CGPoint)a3
{
  [(UIView *)self->_container bounds];
  CGPointClipToRect();
  self->_lastPoint.double x = v4;
  self->_lastPoint.double y = v5;
  if (!self->_ignoreManualUpdates)
  {
    double v6 = v4;
    double v7 = v5;
    int64_t v8 = [(BKPageCurl *)self spineLocation];
    if (v8 == 2)
    {
      BOOL v9 = [(BKPageCurl *)self type] == 3;
      double v10 = 2.0;
    }
    else
    {
      BOOL v9 = 0;
      double v10 = 1.0;
    }
    int64_t v11 = [(BKPageCurl *)self spineLocation];
    id v12 = [(BKPageCurl *)self curlPages];
    id v13 = [v12 objectAtIndex:0];

    [v13 bounds];
    double v15 = v10 * v14;
    [v13 bounds];
    double v17 = v16;
    if (v9) {
      double v6 = v15 - v6;
    }
    double y = self->_manualStartPoint.y;
    __double x = self->_manualStartPoint.x - v6;
    double v19 = atan2(y - v7, __x) + 3.14159265;
    BOOL v20 = v11 == 3;
    BOOL v21 = v11 == 3;
    double v22 = v15 - v6;
    if (v20) {
      double v22 = v6;
    }
    double v23 = v22 / v15;
    if (v20) {
      double v24 = 0.0;
    }
    else {
      double v24 = 180.0;
    }
    if (v21 && v19 > 3.14159265) {
      double v25 = v19 + -6.28318531;
    }
    else {
      double v25 = v19;
    }
    double v26 = cos(y / v17 * 6.28318531) * 27.5 + 27.5 + 5.0;
    long double v27 = cos(v23 * 3.14159265);
    double v28 = v27 * 0.5 + 0.5;
    double v29 = v27 * 0.25 + 0.75;
    if (v8 == 2) {
      double v29 = v28;
    }
    double v30 = v26 * v29;
    double v31 = 1.0 - v23;
    if (v8 != 2) {
      double v31 = 1.0;
    }
    double v32 = v24 + v30;
    double v33 = v24 - v30;
    double v34 = v24 + v31 * 5.0;
    if (v21 != y <= v17 * 0.5)
    {
      double v35 = v33;
    }
    else
    {
      double v34 = v32;
      double v35 = v24 + v31 * -5.0;
    }
    double v36 = v35 * 0.0174532925;
    if (v25 >= v35 * 0.0174532925)
    {
      double v37 = v34 * 0.0174532925;
      double v36 = v25;
      if (v25 > v37) {
        double v36 = v37;
      }
    }
    v38 = [(BKPageCurl *)self configuration];
    [v38 heightAllowanceScalar];
    double v40 = v39;

    double v41 = 0.333333333;
    if (v8 != 2) {
      double v41 = 0.5;
    }
    double v42 = v41 * v40;
    double v43 = self->_manualStartPoint.y;
    double v44 = v43 - v17 * v42;
    double v45 = v43 + v17 * v42;
    if (v45 >= v7) {
      double v45 = v7;
    }
    if (v44 >= v45) {
      double v45 = v44;
    }
    double v46 = hypot(__x, v43 - v45);
    double initialCurlRadius = self->_initialCurlRadius;
    double k = self->_k;
    if ((v46 + initialCurlRadius * -3.14159265) / (k * 3.14159265 + 2.0) >= 0.0) {
      double v49 = (v46 + initialCurlRadius * -3.14159265) / (k * 3.14159265 + 2.0);
    }
    else {
      double v49 = 0.0;
    }
    double v50 = v36;
    double diagonalLengthPixels = self->_diagonalLengthPixels;
    double __xa = v50;
    double v52 = diagonalLengthPixels * cos(self->_diagonalAngle - (v50 + -3.14159265));
    if (v49 <= 20.0)
    {
      double v56 = initialCurlRadius + k * v49;
      double v57 = (v49 + v56 * 3.14159265) / (v56 + v52);
      self->_secondHalf = 0;
    }
    else
    {
      double v53 = -149.0 / (v52 + 1.0 + -20.0);
      double v54 = v53 * -20.0 + 150.0;
      if (!self->_secondHalf) {
        self->_secondHalf = 1;
      }
      double v55 = (v46 + v54 * -3.14159265) / (v53 * 3.14159265 + 2.0);
      double v56 = v54 + v53 * v55;
      double v57 = (v55 + v56 * 3.14159265) / (v52 + v56);
    }
    double v58 = __xa;
    if (v56 >= 1.0) {
      double v59 = v56;
    }
    else {
      double v59 = 1.0;
    }
    if (v9)
    {
      if (__xa >= 3.14159265) {
        double v58 = 6.28318531 - __xa + 3.14159265;
      }
      else {
        double v58 = 3.14159265 - __xa;
      }
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    __xb = [(BKPageCurl *)self curlPages];
    id v60 = [__xb countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v60)
    {
      id v61 = v60;
      double v62 = fmin(v57, 1.0);
      uint64_t v63 = *(void *)v88;
      float v64 = v58;
      float v65 = v62;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v88 != v63) {
            objc_enumerationMutation(__xb);
          }
          double v68 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          v69 = [v68 layer];
          *(float *)&double v70 = v64;
          uint64_t v71 = +[NSNumber numberWithFloat:v70];
          uint64_t v72 = [(BKPageCurl *)self curlAnimationAngle];
          v73 = [v72 keyPath];
          [v69 setValue:v71 forKeyPath:v73];

          *(float *)&double v74 = v65;
          id v75 = +[NSNumber numberWithFloat:v74];
          id v76 = [(BKPageCurl *)self curlAnimationTime];
          uint64_t v77 = [v76 keyPath];
          [v69 setValue:v75 forKeyPath:v77];

          float v66 = v59;
          *(float *)&double v78 = v66;
          long long v79 = +[NSNumber numberWithFloat:v78];
          long long v80 = [(BKPageCurl *)self curlAnimationRadius];
          long long v81 = [v80 keyPath];
          [v69 setValue:v79 forKeyPath:v81];

          [v68 updateCurlPercent:v23];
        }
        id v61 = [__xb countByEnumeratingWithState:&v87 objects:v91 count:16];
      }
      while (v61);
    }

    if (!self->_setupEndNotificationSent)
    {
      self->_setupEndNotificationSent = 1;
      long long v82 = +[AETestDriver shared];
      [v82 postEvent:kBETestDriverPageTurnSetupEnd sender:self];
    }
    if (!self->_curlStartNotificationSent && !self->_inUncurl)
    {
      self->_curlStartNotificationSent = 1;
      long long v83 = +[AETestDriver shared];
      [v83 postEvent:kBETestDriverPageTurnAnimationStart sender:self];
    }
  }
}

- (void)finishManualCurl
{
}

- (void)cancelManualCurl
{
  self->_cancelledManualCurl = 1;
  [(BKPageCurl *)self _finishManualCurl];
}

- (void)_finishManualCurl
{
  BOOL cancelledManualCurl = self->_cancelledManualCurl;
  int64_t v4 = [(BKPageCurl *)self spineLocation];
  unsigned int v5 = [(BKPageCurl *)self type];
  int64_t v69 = v4;
  if (v4 == 2) {
    BOOL v6 = !cancelledManualCurl;
  }
  else {
    BOOL v6 = cancelledManualCurl;
  }
  if (v5 != 3) {
    BOOL v6 = !cancelledManualCurl;
  }
  BOOL v71 = v6;
  if (v6)
  {
    double v7 = [(BKPageCurl *)self curlAnimationTime];
    id v72 = [v7 copy];

    int64_t v8 = [(BKPageCurl *)self curlAnimationRadius];
    id v74 = [v8 copy];

    BOOL v9 = [(BKPageCurl *)self curlAnimationAngle];
    id v73 = [v9 copy];

    double v10 = [(BKPageCurl *)self curlAnimationShadowColor];
    id v11 = [v10 copy];

    id v12 = [(BKPageCurl *)self curlAnimationBackColor0];
    id v13 = [v12 copy];

    double v14 = [(BKPageCurl *)self curlAnimationBackColor1];
    id v15 = [v14 copy];
  }
  else
  {
    double v16 = [(BKPageCurl *)self uncurlAnimationTime];
    id v72 = [v16 copy];

    double v17 = [(BKPageCurl *)self uncurlAnimationRadius];
    id v74 = [v17 copy];

    int64_t v18 = [(BKPageCurl *)self uncurlAnimationAngle];
    id v73 = [v18 copy];

    double v14 = [(BKPageCurl *)self uncurlAnimationShadowColor];
    id v11 = [v14 copy];
    id v13 = 0;
    id v15 = 0;
  }
  double v19 = self;

  objc_opt_class();
  BOOL v20 = [(BKPageCurl *)self curlPages];
  BOOL v21 = [v20 objectAtIndex:0];
  double v22 = BUDynamicCast();
  double v23 = [v22 layer];

  +[CATransaction flush];
  double v24 = [v23 presentationLayer];

  if (v24)
  {
    double v25 = [v23 presentationLayer];
    double v26 = [v72 keyPath];
    long double v27 = [v25 valueForKeyPath:v26];
    [v72 setFromValue:v27];

    double v28 = [v23 presentationLayer];
    double v29 = [v74 keyPath];
    double v30 = [v28 valueForKeyPath:v29];
    [v74 setFromValue:v30];

    double v31 = [v23 presentationLayer];
    double v32 = [v73 keyPath];
    double v33 = [v31 valueForKeyPath:v32];
    [v73 setFromValue:v33];

    if (v13)
    {
      double v34 = [v23 presentationLayer];
      double v35 = [v13 keyPath];
      double v36 = [v34 valueForKeyPath:v35];
      [v13 setFromValue:v36];
    }
    if (v15)
    {
      double v37 = [v23 presentationLayer];
      v38 = [v15 keyPath];
      double v39 = [v37 valueForKeyPath:v38];
      [v15 setFromValue:v39];
    }
  }
  double v67 = v23;
  [(BKPageCurl *)v19 duration];
  double v41 = v40;
  [v72 setDuration:];
  [v74 setDuration:v41];
  [v73 setDuration:v41];
  [v11 setDuration:v41];
  if (v69 == 2)
  {
    LODWORD(v42) = 1.0;
    double v43 = +[NSNumber numberWithFloat:v42];
    [v74 setToValue:v43];

    if ([(BKPageCurl *)v19 type] == 3)
    {
      objc_opt_class();
      double v44 = [v73 fromValue];
      double v45 = BUDynamicCast();
      [v45 floatValue];
      BOOL v47 = v46 <= 3.14159265;
      double v48 = 6.28318531;
      if (v47) {
        double v48 = 0.0;
      }
      *(float *)&double v48 = v48;
      double v49 = +[NSNumber numberWithFloat:v48];
      [v73 setToValue:v49];
    }
  }
  +[CATransaction begin];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = [(BKPageCurl *)v19 curlPages];
  id v50 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v70 = *(void *)v76;
    do
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v76 != v70) {
          objc_enumerationMutation(obj);
        }
        double v53 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        double v54 = [v53 layer];
        ++v19->_didEndCount;
        [v54 addAnimation:v72 forKey:@"curlTime"];
        [v54 addAnimation:v74 forKey:@"curlRadius"];
        [v54 addAnimation:v73 forKey:@"curlAngle"];
        [v54 addAnimation:v11 forKey:@"curlShadowColor"];
        if (v13) {
          [v54 addAnimation:v13 forKey:@"curlBackColor0"];
        }
        if (v15) {
          [v54 addAnimation:v15 forKey:@"curlBackColor1"];
        }
        double v55 = [v72 toValue];
        double v56 = [v72 keyPath];
        [v54 setValue:v55 forKeyPath:v56];

        double v57 = [v74 toValue];
        double v58 = [v74 keyPath];
        [v54 setValue:v57 forKeyPath:v58];

        double v59 = [v73 toValue];
        id v60 = [v73 keyPath];
        [v54 setValue:v59 forKeyPath:v60];

        id v61 = [v11 toValue];
        double v62 = [v11 keyPath];
        [v54 setValue:v61 forKeyPath:v62];

        if (v13)
        {
          uint64_t v63 = [v13 toValue];
          float v64 = [v13 keyPath];
          [v54 setValue:v63 forKey:v64];
        }
        if (v15)
        {
          float v65 = [v15 toValue];
          float v66 = [v15 keyPath];
          [v54 setValue:v65 forKey:v66];
        }
        if (!v71) {
          [v53 pageCurlWillCancelWithDuration:v41];
        }
      }
      id v51 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v51);
  }

  +[CATransaction commit];
  v19->_state = 1;
}

- (void)killCurl
{
  self->_state = 4;
  int64_t v3 = [(BKPageCurl *)self delegate];
  [v3 pageCurl:self finished:0];

  [(BKPageCurl *)self fullCleanup];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_finished = v4;
  int v7 = self->_didEndCount - 1;
  self->_didEndCount = v7;
  if (self->_inUncurl)
  {
    self->_ignoreManualUpdates = 0;
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      int64_t v8 = [(BKPageCurl *)self curlPages];
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v14 + 1) + 8 * i) layer];
            [v13 removeAllAnimations];
          }
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }

      -[BKPageCurl updateManualCurlToLocation:](self, "updateManualCurlToLocation:", self->_lastPoint.x, self->_lastPoint.y);
    }
    self->_inUncurl = 0;
    kdebug_trace();
  }
  else if (!v7 && (int *)[(BKPageCurl *)self state] != &dword_4)
  {
    [(BKPageCurl *)self _animationDidStop:v4];
  }
}

- (void)_animationDidStop:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    if (([(BKPageCurl *)self type] == 2 || [(BKPageCurl *)self type] == 3) && self->_cancelledManualCurl) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 4;
  }
  self->_state = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained) {
    [(BKPageCurl *)self fullCleanup];
  }
  id v7 = [(BKPageCurl *)self delegate];
  [v7 pageCurl:self finished:v3];
}

- (void)fullCleanup
{
  BOOL v3 = [(BKPageCurl *)self existingPages];
  [v3 makeObjectsPerformSelector:"removeFromSuperview"];

  BOOL v4 = [(BKPageCurl *)self curlPages];
  [v4 makeObjectsPerformSelector:"removeFromSuperview"];

  int64_t v5 = [(BKPageCurl *)self backPage];
  [v5 removeFromSuperview];

  [(BKPageCurl *)self cleanup];
}

- (void)cleanup
{
  [(BKPageCurl *)self setCurlPages:0];
  [(BKPageCurl *)self setExistingPages:0];
  [(BKPageCurl *)self setBackPages:0];
  [(BKPageCurl *)self setBackPage:0];
  [(BKPageCurl *)self setContainer:0];
  self->_BOOL cancelledManualCurl = 0;
  [(CABasicAnimation *)self->_curlAnimationTime setDelegate:0];
  [(CABasicAnimation *)self->_curlAnimationRadius setDelegate:0];
  [(CABasicAnimation *)self->_curlAnimationAngle setDelegate:0];
  [(CABasicAnimation *)self->_curlAnimationShadowColor setDelegate:0];
  [(CABasicAnimation *)self->_curlAnimationBackColor0 setDelegate:0];
  [(CABasicAnimation *)self->_curlAnimationBackColor1 setDelegate:0];
  [(CABasicAnimation *)self->_uncurlAnimationTime setDelegate:0];
  [(CABasicAnimation *)self->_uncurlAnimationRadius setDelegate:0];
  [(CABasicAnimation *)self->_uncurlAnimationAngle setDelegate:0];
  uncurlAnimationShadowColor = self->_uncurlAnimationShadowColor;

  [(CABasicAnimation *)uncurlAnimationShadowColor setDelegate:0];
}

- (id)existingPages
{
  return self->_existingPages;
}

- (void)setExistingPages:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_deladouble y = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)stabilization
{
  return self->_stabilization;
}

- (void)setStabilization:(double)a3
{
  self->_stabilization = a3;
}

- (NSArray)curlPages
{
  return self->_curlPages;
}

- (void)setCurlPages:(id)a3
{
}

- (NSArray)backPages
{
  return self->_backPages;
}

- (void)setBackPages:(id)a3
{
}

- (UIView)backPage
{
  return self->_backPage;
}

- (void)setBackPage:(id)a3
{
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (UIColor)pageColor
{
  return self->_pageColor;
}

- (void)setPageColor:(id)a3
{
}

- (UIColor)backColor
{
  return self->_backColor;
}

- (void)setBackColor:(id)a3
{
}

- (BKPageCurlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKPageCurlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)extraView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraView);

  return (UIView *)WeakRetained;
}

- (void)setExtraView:(id)a3
{
}

- (int64_t)spineLocation
{
  return self->_spineLocation;
}

- (void)setSpineLocation:(int64_t)a3
{
  self->_spineLocation = a3;
}

- (BKPageCurlConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CAFilter)curlFilter
{
  return self->_curlFilter;
}

- (void)setCurlFilter:(id)a3
{
}

- (double)k
{
  return self->_k;
}

- (void)setK:(double)a3
{
  self->_double k = a3;
}

- (double)diagonalLengthPixels
{
  return self->_diagonalLengthPixels;
}

- (void)setDiagonalLengthPixels:(double)a3
{
  self->_double diagonalLengthPixels = a3;
}

- (double)diagonalAngle
{
  return self->_diagonalAngle;
}

- (void)setDiagonalAngle:(double)a3
{
  self->_diagonalAngle = a3;
}

- (double)projectedDiagonal
{
  return self->_projectedDiagonal;
}

- (void)setProjectedDiagonal:(double)a3
{
  self->_projectedDiagonal = a3;
}

- (double)initialCurlRadius
{
  return self->_initialCurlRadius;
}

- (void)setInitialCurlRadius:(double)a3
{
  self->_double initialCurlRadius = a3;
}

- (CGPoint)manualStartPoint
{
  double x = self->_manualStartPoint.x;
  double y = self->_manualStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setManualStartPoint:(CGPoint)a3
{
  self->_manualStartPoint = a3;
}

- (CGPoint)lastPoint
{
  double x = self->_lastPoint.x;
  double y = self->_lastPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPoint:(CGPoint)a3
{
  self->_lastPoint = a3;
}

- (int)didEndCount
{
  return self->_didEndCount;
}

- (void)setDidEndCount:(int)a3
{
  self->_didEndCount = a3;
}

- (BOOL)secondHalf
{
  return self->_secondHalf;
}

- (void)setSecondHalf:(BOOL)a3
{
  self->_secondHalf = a3;
}

- (BOOL)ignoreManualUpdates
{
  return self->_ignoreManualUpdates;
}

- (void)setIgnoreManualUpdates:(BOOL)a3
{
  self->_ignoreManualUpdates = a3;
}

- (BOOL)inUncurl
{
  return self->_inUncurl;
}

- (void)setInUncurl:(BOOL)a3
{
  self->_inUncurl = a3;
}

- (BOOL)cancelledManualCurl
{
  return self->_cancelledManualCurl;
}

- (void)setCancelledManualCurl:(BOOL)a3
{
  self->_BOOL cancelledManualCurl = a3;
}

- (BOOL)curlStartNotificationSent
{
  return self->_curlStartNotificationSent;
}

- (void)setCurlStartNotificationSent:(BOOL)a3
{
  self->_curlStartNotificationSent = a3;
}

- (BOOL)setupEndNotificationSent
{
  return self->_setupEndNotificationSent;
}

- (void)setSetupEndNotificationSent:(BOOL)a3
{
  self->_setupEndNotificationSent = a3;
}

- (void)setCurlAnimationTime:(id)a3
{
}

- (void)setUncurlAnimationTime:(id)a3
{
}

- (void)setCurlAnimationRadius:(id)a3
{
}

- (void)setUncurlAnimationRadius:(id)a3
{
}

- (void)setCurlAnimationAngle:(id)a3
{
}

- (void)setUncurlAnimationAngle:(id)a3
{
}

- (void)setCurlAnimationShadowColor:(id)a3
{
}

- (void)setUncurlAnimationShadowColor:(id)a3
{
}

- (void)setCurlAnimationBackColor0:(id)a3
{
}

- (void)setCurlAnimationBackColor1:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curlAnimationBackColor1, 0);
  objc_storeStrong((id *)&self->_curlAnimationBackColor0, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationShadowColor, 0);
  objc_storeStrong((id *)&self->_curlAnimationShadowColor, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationAngle, 0);
  objc_storeStrong((id *)&self->_curlAnimationAngle, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationRadius, 0);
  objc_storeStrong((id *)&self->_curlAnimationRadius, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationTime, 0);
  objc_storeStrong((id *)&self->_curlAnimationTime, 0);
  objc_storeStrong((id *)&self->_curlFilter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_extraView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_existingPages, 0);
  objc_storeStrong((id *)&self->_backColor, 0);
  objc_storeStrong((id *)&self->_pageColor, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_backPage, 0);
  objc_storeStrong((id *)&self->_backPages, 0);

  objc_storeStrong((id *)&self->_curlPages, 0);
}

@end