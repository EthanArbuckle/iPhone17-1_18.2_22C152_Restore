@interface CRLWPTextMagnifierRanged
- (BOOL)isMagnifierStopping;
- (BOOL)shouldHideCanvasLayer;
- (BOOL)terminalPointPlacedCarefully;
- (BOOL)wasPlacedCarefullyAtTime:(double)a3;
- (CGPoint)animationPoint;
- (CGPoint)magnificationPoint;
- (CGPoint)offset;
- (CGPoint)terminalPoint;
- (CRLCanvasRep)target;
- (CRLWPTextMagnifierRanged)initWithFrame:(CGRect)a3;
- (NSString)maskImageName;
- (double)currentOffset;
- (double)horizontalMovement;
- (double)horizontalMovementAtTime:(double)a3;
- (double)pointVelocity;
- (id)overlayImageName;
- (id)underlayImageName;
- (void)autoscrollWillNotStart;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)postAutoscrollPoint:(CGPoint)a3;
- (void)remove;
- (void)setAnimationPoint:(CGPoint)a3;
- (void)setAutoscrollDirections:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setNeedsDisplay;
- (void)setOffset:(CGPoint)a3;
- (void)setPointVelocity:(double)a3;
- (void)setTarget:(id)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrame;
@end

@implementation CRLWPTextMagnifierRanged

- (CRLWPTextMagnifierRanged)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CRLWPTextMagnifierRanged;
  v7 = -[CRLWPTextMagnifierRanged initWithFrame:](&v20, "initWithFrame:");
  if (v7)
  {
    v8 = +[UIColor clearColor];
    [(CRLWPTextMagnifierRanged *)v7 setBackgroundColor:v8];

    v9 = objc_alloc_init(CRLWPTextMagnifierTimeWeightedPoint);
    weightedPoint = v7->_weightedPoint;
    v7->_weightedPoint = v9;

    v11 = [(CRLWPTextMagnifierRanged *)v7 underlayImageName];
    v12 = +[UIImage imageNamed:v11];

    id v13 = [objc_alloc((Class)UIImageView) initWithImage:v12];
    [(CRLWPTextMagnifierRanged *)v7 addSubview:v13];
    v14 = -[CRLWPTextMagnifierRenderer initWithFrame:]([CRLWPTextMagnifierRenderer alloc], "initWithFrame:", x, y, width, height);
    magnifierRenderer = v7->_magnifierRenderer;
    v7->_magnifierRenderer = v14;

    [(CRLWPTextMagnifierRenderer *)v7->_magnifierRenderer setRendererDelegate:v7];
    [(CRLWPTextMagnifierRanged *)v7 addSubview:v7->_magnifierRenderer];
    v16 = [(CRLWPTextMagnifierRanged *)v7 overlayImageName];
    v17 = +[UIImage imageNamed:v16];

    id v18 = [objc_alloc((Class)UIImageView) initWithImage:v17];
    [(CRLWPTextMagnifierRanged *)v7 addSubview:v18];
  }
  return v7;
}

- (double)horizontalMovement
{
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint displacementInInterval:0.5];
  return result;
}

- (double)horizontalMovementAtTime:(double)a3
{
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:3.40282347e38];
  double v5 = v4;
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint displacementInInterval:0.5];
  double v7 = fabs(result);
  double v9 = fabs(v8) * 4.0;
  if (v5 > v7 * 1.5 || v9 > v7 || v7 < 16.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)wasPlacedCarefullyAtTime:(double)a3
{
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:0.5 priorTo:a3];
  return v3 < 10.0;
}

- (double)currentOffset
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEC48);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C130();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEC68);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  double v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged currentOffset]");
  double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:85 isFatal:0 description:"Abstract method"];

  return 0.0;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPTextMagnifierRanged;
  -[CRLWPTextMagnifierRanged setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  [(CRLWPTextMagnifierRanged *)self bounds];
  -[CRLWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierRanged;
  [(CRLWPTextMagnifierRanged *)&v3 setNeedsDisplay];
  [(CRLWPTextMagnifierRenderer *)self->_magnifierRenderer setNeedsDisplay];
}

- (void)updateFrame
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEC88);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C1B8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CECA8);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  objc_super v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged updateFrame]");
  double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:100 isFatal:0 description:"Abstract method"];
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  id v25 = a3;
  -[CRLWPTextMagnifierRanged setTarget:](self, "setTarget:");
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint clearHistory];
  [(CRLWPTextMagnifierRanged *)self setAutoscrollDirections:0];
  [(CRLWPTextMagnifierRanged *)self setNeedsLayout];
  [(CRLWPTextMagnifierRanged *)self setNeedsDisplay];
  id v7 = objc_alloc((Class)UIWindow);
  double v8 = +[UIScreen mainScreen];
  [v8 bounds];
  double v9 = [v7 initWithFrame:];
  hostWindow = self->_hostWindow;
  self->_hostWindow = v9;

  [(UIWindow *)self->_hostWindow setWindowLevel:UIWindowLevelStatusBar + 1.0];
  v11 = +[UIColor clearColor];
  [(UIWindow *)self->_hostWindow setBackgroundColor:v11];

  uint64_t v12 = objc_opt_class();
  id v13 = [v25 interactiveCanvasController];
  v14 = [v13 delegate];
  v15 = sub_1002469D0(v12, v14);

  v16 = -[CRLWPTextMagnifierCaretController initWithPreferredStatusBarStyle:]([CRLWPTextMagnifierCaretController alloc], "initWithPreferredStatusBarStyle:", [v15 preferredStatusBarStyle]);
  [(CRLWPTextMagnifierCaretController *)v16 setView:self];
  [(UIWindow *)self->_hostWindow setRootViewController:v16];
  [(UIWindow *)self->_hostWindow addSubview:self];
  [(CRLWPTextMagnifierRanged *)self frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(UIWindow *)self->_hostWindow setHidden:0];
  -[CRLWPTextMagnifierRanged setFrame:](self, "setFrame:", v18, v20, v22, v24);
}

- (void)stopMagnifying:(BOOL)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CECC8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C240();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CECE8);
  }
  objc_super v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged stopMagnifying:]");
  objc_super v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:136 isFatal:0 description:"Abstract method"];
}

- (BOOL)isMagnifierStopping
{
  if (self->_magnificationPoint.x != INFINITY || self->_magnificationPoint.y != INFINITY) {
    return 0;
  }
  [(CRLWPTextMagnifierRanged *)self offset];
  if (v5 != CGPointZero.x || v4 != CGPointZero.y) {
    return 0;
  }
  [(CRLWPTextMagnifierRanged *)self alpha];
  return v8 == 0.25;
}

- (void)remove
{
  [(UIWindow *)self->_hostWindow setHidden:1];
  hostWindow = self->_hostWindow;
  self->_hostWindow = 0;
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
}

- (void)setAutoscrollDirections:(int)a3
{
}

- (void)autoscrollWillNotStart
{
}

- (CGPoint)terminalPoint
{
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint weightedPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3 = [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint historyCovers:0.5];
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:0.5];
  return v4 < 10.0 && v3;
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[CRLWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.double x = x;
    self->_magnificationPoint.double y = y;
    [(CRLWPTextMagnifierRanged *)self updateFrame];
    [(CRLWPTextMagnifierRenderer *)self->_magnifierRenderer setNeedsDisplay];
  }

  -[CRLWPTextMagnifierRanged setAnimationPoint:](self, "setAnimationPoint:", x, y);
}

- (id)underlayImageName
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CED08);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C2C8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CED28);
  }
  double v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  BOOL v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged underlayImageName]");
  double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:192 isFatal:0 description:"Abstract method"];

  return &stru_101538650;
}

- (id)overlayImageName
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CED48);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C350();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CED68);
  }
  double v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  BOOL v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged overlayImageName]");
  double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:197 isFatal:0 description:"Abstract method"];

  return &stru_101538650;
}

- (NSString)maskImageName
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CED88);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C3D8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEDA8);
  }
  double v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  BOOL v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged maskImageName]");
  double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:202 isFatal:0 description:"Abstract method"];

  return (NSString *)&stru_101538650;
}

- (BOOL)shouldHideCanvasLayer
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEDC8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C460();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEDE8);
  }
  double v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  BOOL v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged shouldHideCanvasLayer]");
  double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:207 isFatal:0 description:"Abstract method"];

  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEE08);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106C4E8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CEE28);
  }
  double v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextMagnifierRanged drawMagnifierClippedCanvasLayer:inContext:]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextMagnifierRanged.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:212 isFatal:0 description:"Abstract method"];
}

- (CRLCanvasRep)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (CGPoint)animationPoint
{
  double x = self->_animationPoint.x;
  double y = self->_animationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_animationPoint = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)pointVelocity
{
  return self->_pointVelocity;
}

- (void)setPointVelocity:(double)a3
{
  self->_pointVelocitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostWindow, 0);
  objc_storeStrong((id *)&self->_magnifierRenderer, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end