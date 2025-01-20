@interface BSUIDailyReadingLayer
- (BOOL)_goalCompleted;
- (BOOL)_isVisible;
- (BOOL)dynamicCompletedReadingGoal;
- (BOOL)goalCompletedAnimationRequested;
- (BSUIDailyReadingMetrics)metrics;
- (CALayer)awardImageLayer;
- (CALayer)backgroundLayer;
- (CAShapeLayer)backgroundArcLayer;
- (CAShapeLayer)progressArcLayer;
- (CGRect)_workingInsetRect;
- (CGRect)lastWorkingRect;
- (CGRect)workingRect;
- (NSArray)symbolImageSublayers;
- (NSArray)textSublayers;
- (NSNumber)overrideReadingTimeToday;
- (TUIDynamicProgress)dynamicProgress;
- (TUIFeedControllerHosting)feedControllerHost;
- (TUIMicaPlayer)micaPlayer;
- (_BSUIDynamicTimeLayer)dynamicTimeLayer;
- (double)_actualReadingTimeSeconds;
- (double)_calculatedProgress;
- (double)_endCapHeight;
- (double)_visibleOrActualProgress;
- (double)visibleProgressToday;
- (id)detailLayer;
- (id)hiddenTimeLayer;
- (id)titleLayer;
- (int64_t)_readingTimeForVisibleOrActualProgress;
- (int64_t)dynamicStreakDayGoal;
- (int64_t)dynamicTimeReadToday;
- (int64_t)lastAXValue;
- (int64_t)lastGoals;
- (void)_animateArcLayer:(id)a3;
- (void)_animateProgressTodayIfNeededHonoringDelay:(BOOL)a3;
- (void)_animateTimeTextFade;
- (void)_backgroundArc;
- (void)_checkEnvironment;
- (void)_progressArc;
- (void)_setInitialTimeTextAnimate;
- (void)_setupBackgroundWithDebugBounds:(BOOL)a3;
- (void)_setupDailyReading;
- (void)_setupDynamicTimeLayerWithDebugBounds:(BOOL)a3;
- (void)_setupGoalArtwork;
- (void)_startMicaPlayer;
- (void)_updateArcLayer:(id)a3 color:(id)a4 percent:(double)a5;
- (void)_updateProgressNoAnimation;
- (void)_updateTimeTextAnimate:(BOOL)a3;
- (void)configureWithMetrics:(id)a3 timeTextYOffset:(double)a4 micaFileProvider:(id)a5;
- (void)configureWithSublayers:(id)a3;
- (void)dealloc;
- (void)didAddLayerWithFeedControllerHost:(id)a3;
- (void)dynamicProgressChanged:(id)a3;
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
- (void)setAwardImageLayer:(id)a3;
- (void)setBackgroundArcLayer:(id)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setDynamicProgress:(id)a3;
- (void)setDynamicTimeLayer:(id)a3;
- (void)setFeedControllerHost:(id)a3;
- (void)setGoalCompletedAnimationRequested:(BOOL)a3;
- (void)setLastAXValue:(int64_t)a3;
- (void)setLastGoals:(int64_t)a3;
- (void)setLastWorkingRect:(CGRect)a3;
- (void)setMetrics:(id)a3;
- (void)setMicaPlayer:(id)a3;
- (void)setOverrideReadingTimeToday:(id)a3;
- (void)setProgressArcLayer:(id)a3;
- (void)setSymbolImageSublayers:(id)a3;
- (void)setTextSublayers:(id)a3;
- (void)setVisibleProgressToday:(double)a3;
- (void)willRemoveLayerWithFeedControllerHost:(id)a3;
@end

@implementation BSUIDailyReadingLayer

- (void)dealloc
{
  [(TUIDynamicProgress *)self->_dynamicProgress unregisterProgressObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BSUIDailyReadingLayer;
  [(BSUIDailyReadingLayer *)&v3 dealloc];
}

- (void)configureWithMetrics:(id)a3 timeTextYOffset:(double)a4 micaFileProvider:(id)a5
{
  id v23 = a3;
  objc_storeStrong((id *)&self->_metrics, a3);
  self->_timeTextYOffset = a4;
  CGSize size = CGRectZero.size;
  self->_workingRect.origin = CGRectZero.origin;
  self->_workingRect.CGSize size = size;
  v9 = [(BSUIDailyReadingLayer *)self metrics];
  v10 = [v9 triggerName];

  if (!v10)
  {
    self->_lastTriggerState = 2;
    [(BSUIDailyReadingLayer *)self _updateProgressNoAnimation];
  }
  if ([(BSUIDailyReadingMetrics *)self->_metrics clockTicks])
  {
    v11 = +[BSUITemplate manager];
    v12 = [v11 dynamicRegistry];

    v13 = +[BCReadingTimeToday kind];
    v14 = [v12 progressProviderForKind:v13];
    v15 = [v14 dynamicProgressForKind:v13 instance:0 parameters:0];
    [v15 registerProgressObserver:self];
    dynamicProgress = self->_dynamicProgress;
    self->_dynamicProgress = (TUIDynamicProgress *)v15;
    id v17 = v15;

    v18 = [v17 progress];
    id v19 = [v18 integerValue];

    int64_t v20 = [(BSUIDailyReadingLayer *)self dynamicTimeReadToday];
    if ((uint64_t)v19 <= v20) {
      id v21 = (id)v20;
    }
    else {
      id v21 = v19;
    }
    v22 = +[NSNumber numberWithInteger:v21];

    [(BSUIDailyReadingLayer *)self setOverrideReadingTimeToday:v22];
  }
}

- (void)configureWithSublayers:(id)a3
{
  id v4 = a3;
  textSublayers = self->_textSublayers;
  if (textSublayers) {
    [(NSArray *)textSublayers enumerateObjectsUsingBlock:&stru_38F9C8];
  }
  symbolImageSublayers = self->_symbolImageSublayers;
  if (symbolImageSublayers) {
    [(NSArray *)symbolImageSublayers enumerateObjectsUsingBlock:&stru_38F9E8];
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_42EEC;
  v17[3] = &unk_38FA10;
  id v9 = v7;
  id v18 = v9;
  v10 = (NSArray *)v8;
  id v19 = v10;
  [v4 enumerateObjectsUsingBlock:v17];
  objc_storeStrong((id *)&self->_textSublayers, v7);
  v11 = self->_symbolImageSublayers;
  self->_symbolImageSublayers = v10;
  v12 = v10;

  [(BSUIDailyReadingLayer *)self _setupDailyReading];
  if ([(BSUIDailyReadingLayer *)self _isVisible]) {
    [(BSUIDailyReadingLayer *)self _animateProgressTodayIfNeededHonoringDelay:1];
  }
  v13 = self->_textSublayers;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_42F68;
  v16[3] = &unk_38FA38;
  v16[4] = self;
  [(NSArray *)v13 enumerateObjectsUsingBlock:v16];
  v14 = self->_symbolImageSublayers;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_42FC8;
  v15[3] = &unk_38FA38;
  v15[4] = self;
  [(NSArray *)v14 enumerateObjectsUsingBlock:v15];
}

- (double)_actualReadingTimeSeconds
{
  objc_super v3 = [(BSUIDailyReadingLayer *)self overrideReadingTimeToday];
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    id v7 = [(BSUIDailyReadingLayer *)self metrics];
    id v8 = [v7 actualReadingTimeSeconds];
    [v8 floatValue];
    float v6 = v9;
  }
  return v6;
}

- (double)_calculatedProgress
{
  uint64_t v3 = [(BSUIDailyReadingLayer *)self dynamicStreakDayGoal];
  if (v3 < 1) {
    return 0.0;
  }
  double v4 = (double)v3;
  [(BSUIDailyReadingLayer *)self _actualReadingTimeSeconds];
  return v5 / v4;
}

- (double)_visibleOrActualProgress
{
  uint64_t v3 = [(BSUIDailyReadingLayer *)self metrics];
  double v4 = [v3 lastVisibleProgressToday];

  if (v4)
  {
    [(BSUIDailyReadingLayer *)self visibleProgressToday];
  }
  else
  {
    [(BSUIDailyReadingLayer *)self _calculatedProgress];
  }
  return result;
}

- (BOOL)_goalCompleted
{
  [(BSUIDailyReadingLayer *)self _actualReadingTimeSeconds];
  return v3 >= (double)[(BSUIDailyReadingLayer *)self dynamicStreakDayGoal];
}

- (CGRect)workingRect
{
  p_workingRect = &self->_workingRect;
  if (CGRectIsEmpty(self->_workingRect))
  {
    [(BSUIDailyReadingLayer *)self _workingInsetRect];
    p_workingRect->origin.double x = x;
    p_workingRect->origin.double y = y;
    p_workingRect->size.double width = width;
    p_workingRect->size.double height = height;
  }
  else
  {
    double x = p_workingRect->origin.x;
    double y = p_workingRect->origin.y;
    double width = p_workingRect->size.width;
    double height = p_workingRect->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_workingInsetRect
{
  [(BSUIDailyReadingLayer *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(BSUIDailyReadingLayer *)self metrics];
  v12 = [v11 progressBarWidth];
  [v12 floatValue];
  double v14 = v13;

  v15 = [(BSUIDailyReadingLayer *)self metrics];
  v16 = [v15 arcWidth];
  [v16 floatValue];
  float v18 = v17;

  if (v18 > 0.0)
  {
    double v19 = v18;
    v40.origin.CGFloat x = v4;
    v40.origin.CGFloat y = v6;
    v40.size.CGFloat width = v8;
    v40.size.CGFloat height = v10;
    if (CGRectGetWidth(v40) > v19) {
      CGFloat v8 = v19;
    }
  }
  v41.origin.CGFloat x = v4;
  v41.origin.CGFloat y = v6;
  v41.size.CGFloat width = v8;
  v41.size.CGFloat height = v10;
  CGRect v42 = CGRectInset(v41, v14 * 0.5, v14 * 0.5);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  v24 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v25 = [v24 iconMode];

  CGFloat v26 = x;
  CGFloat v27 = y;
  CGFloat v28 = width;
  CGFloat v29 = height;
  if (v25)
  {
    double v30 = CGRectGetWidth(*(CGRect *)&v26);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double v31 = CGRectGetHeight(v43);
  }
  else
  {
    double v32 = CGRectGetHeight(*(CGRect *)&v26);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double v33 = CGRectGetWidth(v44) * 0.5;
    if (v32 < v33) {
      double v33 = v32;
    }
    double v30 = v14 + v33 * 2.0;
    double v31 = v33 + v14;
  }
  [(BSUIDailyReadingLayer *)self frame];
  double v34 = CGRectGetWidth(v45);
  double v35 = v34;
  double v36 = 0.0;
  if (v25)
  {
    [(BSUIDailyReadingLayer *)self frame];
    double v36 = (CGRectGetHeight(v46) - v31) * 0.5;
  }
  double v37 = (v35 - v30) * 0.5;
  double v38 = v30;
  double v39 = v31;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v37;
  return result;
}

- (double)_endCapHeight
{
  v2 = [(BSUIDailyReadingLayer *)self metrics];
  double v3 = [v2 progressBarWidth];
  [v3 floatValue];
  double v5 = v4 * 0.5;

  return v5;
}

- (void)_updateArcLayer:(id)a3 color:(id)a4 percent:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  [(BSUIDailyReadingLayer *)self workingRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  float v18 = [(BSUIDailyReadingLayer *)self metrics];
  double v19 = [v18 progressBarWidth];
  [v19 floatValue];
  float v21 = v20;

  v22 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v23 = [v22 iconMode];

  v24 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v25 = [v24 rightToLeft];
  unsigned int v26 = [v25 BOOLValue];

  double v27 = v11;
  double v28 = v13;
  double v29 = v15;
  double v30 = v17;
  if (v23)
  {
    double MidY = CGRectGetMidY(*(CGRect *)&v27);
  }
  else
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v27);
    [(BSUIDailyReadingLayer *)self _endCapHeight];
    double MidY = MaxY - v33;
  }
  v47.origin.CGFloat x = v11;
  v47.origin.CGFloat y = v13;
  v47.size.CGFloat width = v15;
  v47.size.CGFloat height = v17;
  double MidX = CGRectGetMidX(v47);
  double v35 = -1.57079633;
  if (v26) {
    double v36 = 4.71238898;
  }
  else {
    double v36 = -1.57079633;
  }
  if (!v26) {
    double v35 = 4.71238898;
  }
  double v37 = -3.14159265;
  if (v26) {
    double v38 = -6.28318531;
  }
  else {
    double v38 = -3.14159265;
  }
  if (!v26) {
    double v37 = 0.0;
  }
  if (v23) {
    double v39 = v35;
  }
  else {
    double v39 = v37;
  }
  if (!v23) {
    double v36 = v38;
  }
  double v40 = v21;
  CGRect v41 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v26 ^ 1, MidX, MidY, (v15 - v40) * 0.5, v36, v39, v38);
  id v42 = v8;
  id v43 = [v42 CGColor];

  [v9 setStrokeColor:v43];
  id v44 = +[UIColor clearColor];
  [v9 setFillColor:[v44 CGColor]];

  [v9 setBounds:v11, v13, v15, v17];
  [v9 setFrame:v11, v13, v15, v17];
  [v9 setLineWidth:v40];
  [v9 setLineCap:kCALineCapRound];
  [v9 setStrokeStart:0.0];
  [v9 setStrokeEnd:a5];
  [v9 setZPosition:1.0];
  id v45 = v41;
  [v9 setPath:[v45 CGPath]];
}

- (void)_animateArcLayer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(BSUIDailyReadingLayer *)self _calculatedProgress];
    double v6 = v5;
    double v7 = [(BSUIDailyReadingLayer *)self progressArcLayer];
    [v7 setStrokeEnd:v6];

    id v10 = +[CASpringAnimation animationWithKeyPath:@"strokeEnd"];
    [v10 setMass:1.0];
    [v10 setStiffness:55.0];
    [v10 setDamping:15.0];
    [v10 setInitialVelocity:0.0];
    [(BSUIDailyReadingLayer *)self _visibleOrActualProgress];
    id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setFromValue:v8];

    id v9 = +[NSNumber numberWithDouble:v6];
    [v10 setToValue:v9];

    [v10 settlingDuration];
    [v10 setDuration:];
    [v4 addAnimation:v10 forKey:@"strokeEnd"];

    [(BSUIDailyReadingLayer *)self setVisibleProgressToday:v6];
  }
}

- (void)_backgroundArc
{
  id v13 = +[UITraitCollection _currentTraitCollection];
  double v3 = [(BSUIDailyReadingLayer *)self metrics];
  id v4 = [v3 controlColor];
  double v5 = [v4 resolvedColorWithTraitCollection:v13];

  backgroundArcLayer = self->_backgroundArcLayer;
  if (backgroundArcLayer)
  {
    double v7 = [(CAShapeLayer *)backgroundArcLayer strokeColor];
    id v8 = v5;
    if (!CGColorEqualToColor(v7, (CGColorRef)[v8 CGColor])) {
      -[CAShapeLayer setStrokeColor:](self->_backgroundArcLayer, "setStrokeColor:", [v8 CGColor]);
    }
  }
  else
  {
    id v9 = +[CAShapeLayer layer];
    id v10 = self->_backgroundArcLayer;
    self->_backgroundArcLayer = v9;

    [(BSUIDailyReadingLayer *)self _updateArcLayer:self->_backgroundArcLayer color:v5 percent:1.0];
    double v11 = [(BSUIDailyReadingLayer *)self backgroundLayer];
    double v12 = [(BSUIDailyReadingLayer *)self backgroundArcLayer];
    [v11 addSublayer:v12];
  }
}

- (void)_progressArc
{
  id v15 = +[UITraitCollection _currentTraitCollection];
  double v3 = [(BSUIDailyReadingLayer *)self metrics];
  id v4 = [v3 progressColor];
  double v5 = [v4 resolvedColorWithTraitCollection:v15];

  [(BSUIDailyReadingLayer *)self _visibleOrActualProgress];
  progressArcLayer = self->_progressArcLayer;
  if (progressArcLayer)
  {
    id v8 = [(CAShapeLayer *)progressArcLayer strokeColor];
    id v9 = v5;
    if (!CGColorEqualToColor(v8, (CGColorRef)[v9 CGColor])) {
      -[CAShapeLayer setStrokeColor:](self->_progressArcLayer, "setStrokeColor:", [v9 CGColor]);
    }
  }
  else
  {
    double v10 = v6;
    double v11 = +[CAShapeLayer layer];
    double v12 = self->_progressArcLayer;
    self->_progressArcLayer = v11;

    [(BSUIDailyReadingLayer *)self _updateArcLayer:self->_progressArcLayer color:v5 percent:v10];
    id v13 = [(BSUIDailyReadingLayer *)self backgroundArcLayer];
    double v14 = [(BSUIDailyReadingLayer *)self progressArcLayer];
    [v13 addSublayer:v14];
  }
}

- (void)_updateProgressNoAnimation
{
  [(BSUIDailyReadingLayer *)self _calculatedProgress];
  double v4 = v3;
  id v5 = [(BSUIDailyReadingLayer *)self progressArcLayer];
  [v5 setStrokeEnd:v4];
}

- (id)titleLayer
{
  if ((char *)[(NSArray *)self->_textSublayers count] == (char *)&dword_0 + 3)
  {
    double v3 = [(NSArray *)self->_textSublayers objectAtIndexedSubscript:0];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)hiddenTimeLayer
{
  if ((char *)[(NSArray *)self->_textSublayers count] == (char *)&dword_0 + 3)
  {
    double v3 = [(NSArray *)self->_textSublayers objectAtIndexedSubscript:1];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)detailLayer
{
  if ((char *)[(NSArray *)self->_textSublayers count] == (char *)&dword_0 + 3)
  {
    double v3 = [(NSArray *)self->_textSublayers objectAtIndexedSubscript:2];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (void)_setupGoalArtwork
{
  double v3 = [(BSUIDailyReadingLayer *)self awardImageLayer];
  [v3 removeFromSuperlayer];

  [(BSUIDailyReadingLayer *)self setAwardImageLayer:0];
  [(BSUIDailyReadingLayer *)self workingRect];
  CGFloat rect = v4;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m33;
  rect_8[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  rect_8[5] = v12;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m43;
  rect_8[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  rect_8[7] = v13;
  long long v14 = *(_OWORD *)&CATransform3DIdentity.m13;
  rect_8[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  rect_8[1] = v14;
  long long v15 = *(_OWORD *)&CATransform3DIdentity.m23;
  rect_8[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  rect_8[3] = v15;
  [v11 setTransform:rect_8];

  double v16 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
  [v16 frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v59.origin.CGFloat x = v18;
  v59.origin.CGFloat y = v20;
  v59.size.CGFloat width = v22;
  v59.size.CGFloat height = v24;
  double MidY = CGRectGetMidY(v59);
  v60.origin.CGFloat x = v18;
  v60.origin.CGFloat y = v20;
  v60.size.CGFloat width = v22;
  v60.size.CGFloat height = v24;
  double Height = CGRectGetHeight(v60);
  double v27 = [(BSUIDailyReadingLayer *)self metrics];
  if ([v27 isAX]) {
    double v28 = 22.0;
  }
  else {
    double v28 = 16.0;
  }

  double v29 = Height - v28;
  double v30 = [(BSUIDailyReadingLayer *)self metrics];
  if ([v30 isAX]) {
    double v31 = 4.0;
  }
  else {
    double v31 = 2.0;
  }

  v61.origin.CGFloat x = rect;
  v61.origin.CGFloat y = v6;
  v61.size.CGFloat width = v8;
  v61.size.CGFloat height = v10;
  CGFloat v32 = CGRectGetMidX(v61) - v29 * 0.5;
  id v33 = objc_alloc_init((Class)CALayer);
  [v33 setFrame:v32 MidY - v29 * 0.5 - v31, v29, v29];
  [(BSUIDailyReadingLayer *)self setAwardImageLayer:v33];
  double v34 = [(BSUIDailyReadingLayer *)self backgroundLayer];
  [v34 addSublayer:v33];

  double v35 = objc_alloc_init(BSUIMicaFileProvider);
  double v36 = [(BSUIDailyReadingLayer *)self micaPlayer];
  if (v36)
  {

LABEL_10:
    double v40 = [(BSUIDailyReadingLayer *)self micaPlayer];
    [v40 removeFromSuperlayer];

    id v41 = [objc_alloc((Class)TUIMicaPlayer) initWithPath:@"/mica/ic_ReadingMeter-Checkmark_58_v4~AMH.caar" retinaScale:v35 fileProvider:1.0];
    [(BSUIDailyReadingLayer *)self setMicaPlayer:v41];

    id v42 = [(BSUIDailyReadingLayer *)self metrics];
    id v43 = [v42 opacity];
    [v43 floatValue];
    int v45 = v44;
    CGRect v46 = [(BSUIDailyReadingLayer *)self micaPlayer];
    CGRect v47 = [v46 rootLayer];
    LODWORD(v48) = v45;
    [v47 setOpacity:v48];

    v49 = [(BSUIDailyReadingLayer *)self micaPlayer];
    v50 = [(BSUIDailyReadingLayer *)self awardImageLayer];
    [v49 addToLayer:v50 onTop:1 gravity:@"resize"];

    goto LABEL_11;
  }
  double v37 = [(BSUIDailyReadingLayer *)self micaPlayer];
  double v38 = [v37 path];
  unsigned __int8 v39 = [v38 isEqualToString:@"/mica/ic_ReadingMeter-Checkmark_58_v4~AMH.caar"];

  if ((v39 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:
  if ([(BSUIDailyReadingLayer *)self _goalCompleted])
  {
    [(BSUIDailyReadingLayer *)self _visibleOrActualProgress];
    if (v51 >= 1.0)
    {
      v52 = [(BSUIDailyReadingLayer *)self micaPlayer];
      [v52 documentDuration];
      double v54 = v53;
      v55 = [(BSUIDailyReadingLayer *)self micaPlayer];
      [v55 setPlaybackTime:v54];

      v56 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
      [v56 setOpacity:0.0];

      [(BSUIDailyReadingLayer *)self setGoalCompletedAnimationRequested:1];
    }
  }
}

- (void)_setupBackgroundWithDebugBounds:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BSUIDailyReadingLayer *)self backgroundLayer];

  if (!v5)
  {
    CGFloat v6 = +[CALayer layer];
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v6;
  }
  [(BSUIDailyReadingLayer *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v9, v11, v13, v15);
  double v16 = [(BSUIDailyReadingLayer *)self metrics];
  id v17 = [v16 backgroundColor];
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", [v17 CGColor]);

  if (v3)
  {
    id v18 = +[UIColor blueColor];
    -[CALayer setBorderColor:](self->_backgroundLayer, "setBorderColor:", [v18 CGColor]);

    [(CALayer *)self->_backgroundLayer setBorderWidth:0.5];
  }
  [(CALayer *)self->_backgroundLayer setMasksToBounds:1];
  [(BSUIDailyReadingLayer *)self addSublayer:self->_backgroundLayer];
  [(BSUIDailyReadingLayer *)self workingRect];

  -[BSUIDailyReadingLayer setLastWorkingRect:](self, "setLastWorkingRect:");
}

- (void)_checkEnvironment
{
  BOOL v3 = [(BSUIDailyReadingLayer *)self backgroundLayer];

  if (v3)
  {
    double v4 = [(BSUIDailyReadingLayer *)self metrics];
    double v5 = [v4 axValue];
    id v6 = [v5 integerValue];

    int64_t v7 = [(BSUIDailyReadingLayer *)self lastAXValue];
    BOOL v8 = v7 != (void)v6;
    if ((id)v7 != v6) {
      [(BSUIDailyReadingLayer *)self setLastAXValue:v6];
    }
    double v9 = [(BSUIDailyReadingLayer *)self dynamicStreakDayGoal];
    if ((void *)[(BSUIDailyReadingLayer *)self lastGoals] != v9)
    {
      if ((uint64_t)v9 >= 1)
      {
        double v10 = [(BSUIDailyReadingLayer *)self dynamicProgress];
        double v11 = [v10 progress];
        [v11 floatValue];
        float v13 = v12;

        [(BSUIDailyReadingLayer *)self _actualReadingTimeSeconds];
        if (v14 <= v13) {
          double v14 = v13;
        }
        [(BSUIDailyReadingLayer *)self setVisibleProgressToday:v14 / (double)(uint64_t)v9];
      }
      [(BSUIDailyReadingLayer *)self setLastGoals:v9];
      BOOL v8 = 1;
    }
    [(BSUIDailyReadingLayer *)self lastWorkingRect];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(BSUIDailyReadingLayer *)self workingRect];
    v30.origin.CGFloat x = v23;
    v30.origin.CGFloat y = v24;
    v30.size.CGFloat width = v25;
    v30.size.CGFloat height = v26;
    v29.origin.CGFloat x = v16;
    v29.origin.CGFloat y = v18;
    v29.size.CGFloat width = v20;
    v29.size.CGFloat height = v22;
    if (CGRectEqualToRect(v29, v30))
    {
      if (!v8) {
        return;
      }
    }
    else
    {
      [(BSUIDailyReadingLayer *)self workingRect];
      -[BSUIDailyReadingLayer setLastWorkingRect:](self, "setLastWorkingRect:");
    }
    double v27 = [(BSUIDailyReadingLayer *)self backgroundLayer];
    [v27 removeFromSuperlayer];

    [(BSUIDailyReadingLayer *)self setAwardImageLayer:0];
    [(BSUIDailyReadingLayer *)self setProgressArcLayer:0];
    [(BSUIDailyReadingLayer *)self setBackgroundArcLayer:0];
    [(BSUIDailyReadingLayer *)self setDynamicTimeLayer:0];
    [(BSUIDailyReadingLayer *)self setBackgroundLayer:0];
  }
}

- (void)_setupDailyReading
{
  [(BSUIDailyReadingLayer *)self _checkEnvironment];
  [(BSUIDailyReadingLayer *)self _setupBackgroundWithDebugBounds:0];
  [(BSUIDailyReadingLayer *)self _backgroundArc];
  [(BSUIDailyReadingLayer *)self _progressArc];
  [(BSUIDailyReadingLayer *)self _setupDynamicTimeLayerWithDebugBounds:0];
  BOOL v3 = [(BSUIDailyReadingLayer *)self hiddenTimeLayer];
  [v3 setHidden:1];

  double v4 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned __int8 v5 = [v4 iconMode];

  if ((v5 & 1) == 0)
  {
    [(BSUIDailyReadingLayer *)self _setupGoalArtwork];
  }
}

- (BOOL)_isVisible
{
  unint64_t lastTriggerState = self->_lastTriggerState;
  if ([(BSUIDailyReadingLayer *)self isHidden])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned __int8 v5 = [(BSUIDailyReadingLayer *)self superlayer];
    unsigned int v4 = [v5 isHidden] ^ 1;
  }
  if (lastTriggerState == 2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)setVisibleProgressToday:(double)a3
{
  id v6 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v4 = [v6 lastVisibleProgressToday];
  unsigned __int8 v5 = +[NSNumber numberWithDouble:a3];
  [v4 updateWithValueIfChanged:v5];
}

- (double)visibleProgressToday
{
  objc_opt_class();
  BOOL v3 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v4 = [v3 lastVisibleProgressToday];
  unsigned __int8 v5 = [v4 value];
  uint64_t v6 = BUDynamicCast();
  int64_t v7 = (void *)v6;
  BOOL v8 = &off_3A0B48;
  if (v6) {
    BOOL v8 = (_UNKNOWN **)v6;
  }
  double v9 = v8;

  [v9 floatValue];
  float v11 = v10;

  return v11;
}

- (int64_t)dynamicStreakDayGoal
{
  objc_opt_class();
  BOOL v3 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v4 = [v3 dynamicStreakDayGoal];
  unsigned __int8 v5 = [v4 value];
  uint64_t v6 = BUDynamicCast();
  int64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = [(BSUIDailyReadingLayer *)self metrics];
    id v8 = [v9 readingGoalSeconds];
  }
  id v10 = [v8 integerValue];

  return (int64_t)v10;
}

- (int64_t)dynamicTimeReadToday
{
  objc_opt_class();
  BOOL v3 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v4 = [v3 dynamicTimeReadToday];
  unsigned __int8 v5 = [v4 value];
  uint64_t v6 = BUDynamicCast();
  int64_t v7 = (void *)v6;
  id v8 = &off_3A0B48;
  if (v6) {
    id v8 = (_UNKNOWN **)v6;
  }
  double v9 = v8;

  id v10 = [v9 integerValue];
  return (int64_t)v10;
}

- (BOOL)dynamicCompletedReadingGoal
{
  objc_opt_class();
  BOOL v3 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned int v4 = [v3 dynamicCompletedReadingGoal];
  unsigned __int8 v5 = [v4 value];
  uint64_t v6 = BUDynamicCast();
  int64_t v7 = (void *)v6;
  id v8 = &off_3A0B48;
  if (v6) {
    id v8 = (_UNKNOWN **)v6;
  }
  double v9 = v8;

  unsigned __int8 v10 = [v9 BOOLValue];
  return v10;
}

- (void)_setupDynamicTimeLayerWithDebugBounds:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(BSUIDailyReadingLayer *)self metrics];
  unsigned __int8 v6 = [v5 iconMode];

  if ((v6 & 1) == 0)
  {
    int64_t v7 = [(BSUIDailyReadingLayer *)self metrics];
    id v8 = [v7 timeFontSpec];
    id v44 = [v8 font];

    double timeTextYOffset = self->_timeTextYOffset;
    [v44 capHeight];
    double v11 = timeTextYOffset + v10;
    [v44 ascender];
    double v13 = v11 - v12;
    [v44 ascender];
    double v15 = v14;
    [v44 capHeight];
    double v17 = (v15 - v16) * 0.5;
    [v44 ascender];
    double v19 = v18;
    [(CALayer *)self->_backgroundLayer frame];
    double v21 = v20;
    CGFloat v22 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];

    if (!v22)
    {
      CGFloat v23 = objc_opt_new();
      [(BSUIDailyReadingLayer *)self setDynamicTimeLayer:v23];
    }
    double v24 = v19 + v17 * 0.5;
    double v25 = v13 + v17;
    CGFloat v26 = +[UITraitCollection _currentTraitCollection];
    double v27 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
    [v27 setMasksToBounds:1];
    if (v3)
    {
      id v28 = +[UIColor redColor];
      objc_msgSend(v27, "setBorderColor:", objc_msgSend(v28, "CGColor"));

      [v27 setBorderWidth:0.5];
    }
    CGRect v29 = [(BSUIDailyReadingLayer *)self metrics];
    id v30 = [v29 useFontFallback];

    [v27 setFrame:0.0, v25, v21, v24];
    [v27 setBounds:0.0, v17, v21, v24];
    double v31 = [(BSUIDailyReadingLayer *)self metrics];
    CGFloat v32 = [v31 timeFontSpec];
    id v33 = [v32 font];
    [v27 setFont:v33 useFontFallback:v30];

    double v34 = [(BSUIDailyReadingLayer *)self metrics];
    double v35 = [v34 textColor];
    double v36 = [v35 resolvedColorWithTraitCollection:v26];
    [v27 setColor:v36];

    [v27 setHeight:v24];
    [v27 setUseFontFallback:v30];
    double v37 = [(BSUIDailyReadingLayer *)self metrics];
    double v38 = [v37 timeSeparator];
    [v27 setTimeSeparator:v38];

    unsigned __int8 v39 = [(BSUIDailyReadingLayer *)self metrics];
    double v40 = [v39 contentsScale];
    id v41 = v40;
    if (!v40) {
      double v40 = &off_3A0B60;
    }
    [v40 floatValue];
    [v27 setContentsScale:v42];

    id v43 = [(BSUIDailyReadingLayer *)self backgroundLayer];
    [v43 addSublayer:v27];

    [(BSUIDailyReadingLayer *)self _setInitialTimeTextAnimate];
  }
}

- (int64_t)_readingTimeForVisibleOrActualProgress
{
  [(BSUIDailyReadingLayer *)self _visibleOrActualProgress];
  return llround(v3 * (double)[(BSUIDailyReadingLayer *)self dynamicStreakDayGoal]);
}

- (void)_setInitialTimeTextAnimate
{
  if ([(BSUIDailyReadingLayer *)self _goalCompleted])
  {
    double v3 = [(BSUIDailyReadingLayer *)self dynamicProgress];
    unsigned int v4 = [v3 progress];
    [v4 floatValue];
    float v6 = v5;

    [(BSUIDailyReadingLayer *)self _actualReadingTimeSeconds];
    if (v7 <= v6) {
      double v8 = v6;
    }
    else {
      double v8 = v7;
    }
    double v9 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
    uint64_t v10 = (uint64_t)v8;
    id v12 = v9;
  }
  else
  {
    int64_t v11 = [(BSUIDailyReadingLayer *)self _readingTimeForVisibleOrActualProgress];
    double v9 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
    id v12 = v9;
    uint64_t v10 = v11;
  }
  [v9 setReadingTime:v10 animate:0];
}

- (void)_updateTimeTextAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = [(BSUIDailyReadingLayer *)self overrideReadingTimeToday];

  if (v5)
  {
    float v6 = [(BSUIDailyReadingLayer *)self overrideReadingTimeToday];
    id v7 = [v6 integerValue];

    if (![(BSUIDailyReadingLayer *)self goalCompletedAnimationRequested])
    {
      if ([(BSUIDailyReadingLayer *)self _goalCompleted])
      {
        double v8 = [(BSUIDailyReadingLayer *)self dynamicProgress];
        double v9 = [v8 progress];
        [v9 floatValue];
        float v11 = v10;

        [(BSUIDailyReadingLayer *)self _actualReadingTimeSeconds];
        if (v12 <= v11) {
          double v13 = v11;
        }
        else {
          double v13 = v12;
        }
        double v14 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
        uint64_t v15 = (uint64_t)v13;
        id v17 = v14;
        BOOL v16 = 0;
      }
      else
      {
        double v14 = [(BSUIDailyReadingLayer *)self dynamicTimeLayer];
        id v17 = v14;
        uint64_t v15 = (uint64_t)v7;
        BOOL v16 = v3;
      }
      [v14 setReadingTime:v15 animate:v16];
    }
  }
}

- (void)_animateTimeTextFade
{
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_44EA0;
  block[3] = &unk_38E738;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_startMicaPlayer
{
  dispatch_time_t v3 = [(BSUIDailyReadingLayer *)self micaPlayer];

  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_451B4;
    block[3] = &unk_38E738;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_animateProgressTodayIfNeededHonoringDelay:(BOOL)a3
{
  BOOL v3 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_453F4;
  v19[3] = &unk_38E738;
  v19[4] = self;
  float v5 = objc_retainBlock(v19);
  [(BSUIDailyReadingLayer *)self _visibleOrActualProgress];
  double v7 = v6;
  [(BSUIDailyReadingLayer *)self _calculatedProgress];
  if (v7 != v8)
  {
    double v9 = [(BSUIDailyReadingLayer *)self metrics];
    float v10 = [v9 triggerDelay];
    [v10 doubleValue];
    double v12 = v11;

    if (v3 && v12 > 0.0)
    {
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_45514;
      block[3] = &unk_38E0B8;
      double v18 = v5;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
      double v14 = (void (**)(void))v18;
    }
    else
    {
      double v14 = objc_retainBlock(v5);
      if (v14)
      {
        if (+[NSThread isMainThread])
        {
          v14[2](v14);
        }
        else
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_45524;
          v15[3] = &unk_38E0B8;
          double v14 = v14;
          id v16 = v14;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
        }
      }
    }
  }
}

- (void)didAddLayerWithFeedControllerHost:(id)a3
{
  id v10 = a3;
  -[BSUIDailyReadingLayer setFeedControllerHost:](self, "setFeedControllerHost:");
  dispatch_time_t v4 = [(BSUIDailyReadingLayer *)self metrics];
  float v5 = [v4 triggerName];
  id v6 = [v5 length];

  if (v6)
  {
    double v7 = [v10 triggerStateManager];
    double v8 = [(BSUIDailyReadingLayer *)self metrics];
    double v9 = [v8 triggerName];
    [v7 addObserver:self forTrigger:v9];
  }
}

- (void)willRemoveLayerWithFeedControllerHost:(id)a3
{
  id v10 = a3;
  dispatch_time_t v4 = [(BSUIDailyReadingLayer *)self metrics];
  float v5 = [v4 triggerName];
  id v6 = [v5 length];

  if (v6)
  {
    double v7 = [v10 triggerStateManager];
    double v8 = [(BSUIDailyReadingLayer *)self metrics];
    double v9 = [v8 triggerName];
    [v7 removeObserver:self forTrigger:v9];
  }
  [(BSUIDailyReadingLayer *)self setFeedControllerHost:0];
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v12 = a3;
  self->_unint64_t lastTriggerState = a4;
  double v7 = [(BSUIDailyReadingLayer *)self metrics];
  id v8 = [v7 targetTriggerState];
  if (a4 && v8 == (id)a4)
  {
    double v9 = [(BSUIDailyReadingLayer *)self metrics];
    id v10 = [v9 triggerName];
    unsigned int v11 = [v10 isEqualToString:v12];

    if (v11) {
      [(BSUIDailyReadingLayer *)self _animateProgressTodayIfNeededHonoringDelay:1];
    }
  }
  else
  {
  }
}

- (void)dynamicProgressChanged:(id)a3
{
  id v6 = a3;
  dispatch_time_t v4 = [v6 progress];

  if (v4)
  {
    float v5 = [v6 progress];
    [(BSUIDailyReadingLayer *)self setOverrideReadingTimeToday:v5];

    if ([(BSUIDailyReadingLayer *)self _isVisible])
    {
      if (![(BSUIDailyReadingLayer *)self goalCompletedAnimationRequested]) {
        [(BSUIDailyReadingLayer *)self _animateProgressTodayIfNeededHonoringDelay:0];
      }
    }
  }
}

- (BSUIDailyReadingMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (CALayer)awardImageLayer
{
  return self->_awardImageLayer;
}

- (void)setAwardImageLayer:(id)a3
{
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CAShapeLayer)backgroundArcLayer
{
  return self->_backgroundArcLayer;
}

- (void)setBackgroundArcLayer:(id)a3
{
}

- (CAShapeLayer)progressArcLayer
{
  return self->_progressArcLayer;
}

- (void)setProgressArcLayer:(id)a3
{
}

- (_BSUIDynamicTimeLayer)dynamicTimeLayer
{
  return self->_dynamicTimeLayer;
}

- (void)setDynamicTimeLayer:(id)a3
{
}

- (NSArray)textSublayers
{
  return self->_textSublayers;
}

- (void)setTextSublayers:(id)a3
{
}

- (NSArray)symbolImageSublayers
{
  return self->_symbolImageSublayers;
}

- (void)setSymbolImageSublayers:(id)a3
{
}

- (int64_t)lastAXValue
{
  return self->_lastAXValue;
}

- (void)setLastAXValue:(int64_t)a3
{
  self->_lastAXValue = a3;
}

- (int64_t)lastGoals
{
  return self->_lastGoals;
}

- (void)setLastGoals:(int64_t)a3
{
  self->_lastGoals = a3;
}

- (CGRect)lastWorkingRect
{
  double x = self->_lastWorkingRect.origin.x;
  double y = self->_lastWorkingRect.origin.y;
  double width = self->_lastWorkingRect.size.width;
  double height = self->_lastWorkingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastWorkingRect:(CGRect)a3
{
  self->_lastWorkingRect = a3;
}

- (TUIFeedControllerHosting)feedControllerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedControllerHost);

  return (TUIFeedControllerHosting *)WeakRetained;
}

- (void)setFeedControllerHost:(id)a3
{
}

- (TUIMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (NSNumber)overrideReadingTimeToday
{
  return self->_overrideReadingTimeToday;
}

- (void)setOverrideReadingTimeToday:(id)a3
{
}

- (BOOL)goalCompletedAnimationRequested
{
  return self->_goalCompletedAnimationRequested;
}

- (void)setGoalCompletedAnimationRequested:(BOOL)a3
{
  self->_goalCompletedAnimationRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideReadingTimeToday, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_micaPlayer, 0);
  objc_destroyWeak((id *)&self->_feedControllerHost);
  objc_storeStrong((id *)&self->_symbolImageSublayers, 0);
  objc_storeStrong((id *)&self->_textSublayers, 0);
  objc_storeStrong((id *)&self->_dynamicTimeLayer, 0);
  objc_storeStrong((id *)&self->_progressArcLayer, 0);
  objc_storeStrong((id *)&self->_backgroundArcLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_awardImageLayer, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end