@interface CRLFreehandDrawingPathCreator
- ($EB457B8D156C558632463A5C38AABCB2)p_drawingInputPoint:(SEL)a3 atTime:(CGPoint)a4 predicted:(double)a5;
- (BOOL)p_shouldSaveAllPoints;
- (CGRect)takeDirtyRect;
- (CRLFreehandDrawingPathCreator)init;
- (CRLFreehandDrawingPathCreator)initWithPencilKitSmoothing:(BOOL)a3;
- (double)minimumLengthForFinalCreatedPath;
- (id).cxx_construct;
- (id)commitAllAvailablePoints;
- (id)copyOfCommittedPath;
- (id)copyOfEntirePath;
- (id)copyOfUncommittedPath;
- (id)handoffToNewPathCreator;
- (id)p_pathWithLength:(double)a3 fromPoint:(CGPoint)a4;
- (unint64_t)inputPointCount;
- (unint64_t)p_immutableUncommittedCountNotAdjustedForLastPoint;
- (unint64_t)pointCountAvailableToCommit;
- (void)beginDrawingWithViewScale:(double)a3 inputType:(int64_t)a4;
- (void)drawToPoint:(CGPoint)a3 atTime:(double)a4 predicted:(BOOL)a5;
- (void)endDrawing;
- (void)p_nonUpdatingDrawToPoint:(CGPoint)a3 atTime:(double)a4 predicted:(BOOL)a5;
- (void)p_updatePath;
- (void)setMinimumLengthForFinalCreatedPath:(double)a3;
- (void)setPointReductionFilterThresholdMultiplier:(double)a3;
- (void)setSmoothingThresholdMultiplier:(double)a3;
@end

@implementation CRLFreehandDrawingPathCreator

- (CRLFreehandDrawingPathCreator)initWithPencilKitSmoothing:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingPathCreator;
  v4 = [(CRLFreehandDrawingPathCreator *)&v15 init];
  if (v4)
  {
    if (v3)
    {
      v5 = objc_alloc_init(CRLPKStrokeGenerator);
      strokeGenerator = v4->_strokeGenerator;
      v4->_strokeGenerator = v5;

      [(CRLPKStrokeGenerator *)v4->_strokeGenerator setSmoothingThresholdMultiplier:1.0];
      [(CRLPKStrokeGenerator *)v4->_strokeGenerator setPointReductionFilterThresholdMultiplier:1.0];
    }
    v4->_immutablePointCount = 0;
    uint64_t v7 = +[CRLBezierPath bezierPath];
    immutableBezierPath = v4->_immutableBezierPath;
    v4->_immutableBezierPath = (CRLBezierPath *)v7;

    uint64_t v9 = +[CRLBezierPath bezierPath];
    mutableBezierPath = v4->_mutableBezierPath;
    v4->_mutableBezierPath = (CRLBezierPath *)v9;

    uint64_t v11 = +[CRLBezierPath bezierPath];
    committedPath = v4->_committedPath;
    v4->_committedPath = (CRLBezierPath *)v11;

    v4->_initialPoint = (CGPoint)xmmword_101175160;
    v4->_creatorState = 0;
    CGSize size = CGRectNull.size;
    v4->_lastMutableDirtyRect.origin = CGRectNull.origin;
    v4->_lastMutableDirtyRect.CGSize size = size;
    v4->_nextImmutablePointIndexForDirtyRect = 0;
    v4->_minimumLengthForFinalCreatedPath = 0.100000001;
  }
  return v4;
}

- (CRLFreehandDrawingPathCreator)init
{
  return [(CRLFreehandDrawingPathCreator *)self initWithPencilKitSmoothing:1];
}

- (void)setSmoothingThresholdMultiplier:(double)a3
{
  p_creatorState = &self->_creatorState;
  if (self->_creatorState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE6E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA350();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE700);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setSmoothingThresholdMultiplier:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 129, 0, "Unexpected creator state, %lu", *p_creatorState);
  }
  strokeGenerator = self->_strokeGenerator;
  if (!strokeGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE720);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA2A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE740);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setSmoothingThresholdMultiplier:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 130, 0, "invalid nil value for '%{public}s'", "_strokeGenerator");

    strokeGenerator = self->_strokeGenerator;
  }
  [(CRLPKStrokeGenerator *)strokeGenerator setSmoothingThresholdMultiplier:a3];
}

- (void)setPointReductionFilterThresholdMultiplier:(double)a3
{
  p_creatorState = &self->_creatorState;
  if (self->_creatorState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE760);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA488();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE780);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setPointReductionFilterThresholdMultiplier:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 136, 0, "Unexpected creator state, %lu", *p_creatorState);
  }
  strokeGenerator = self->_strokeGenerator;
  if (!strokeGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE7A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA3E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE7C0);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setPointReductionFilterThresholdMultiplier:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 137, 0, "invalid nil value for '%{public}s'", "_strokeGenerator");

    strokeGenerator = self->_strokeGenerator;
  }
  [(CRLPKStrokeGenerator *)strokeGenerator setPointReductionFilterThresholdMultiplier:a3];
}

- (void)beginDrawingWithViewScale:(double)a3 inputType:(int64_t)a4
{
  if (self->_creatorState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE7E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA518();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE800);
    }
    uint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:143 isFatal:0 description:"beginDrawing should be called from the waiting state."];
  }
  self->_creatorState = 1;
  self->_viewScale = a3;
  self->_inputType = a4;
  if (self->_strokeGenerator)
  {
    v10 = objc_alloc_init(CRLPKStroke);
    uint64_t v11 = +[NSProcessInfo processInfo];
    [v11 systemUptime];
    -[CRLPKStroke setTimestamp:](v10, "setTimestamp:");

    [(CRLPKStrokeGenerator *)self->_strokeGenerator drawingBeganWithStroke:v10 inputType:a4 == 2 inputScale:&stru_1014FE820 start:1.0 / a3];
  }
}

- (void)drawToPoint:(CGPoint)a3 atTime:(double)a4 predicted:(BOOL)a5
{
  -[CRLFreehandDrawingPathCreator p_nonUpdatingDrawToPoint:atTime:predicted:](self, "p_nonUpdatingDrawToPoint:atTime:predicted:", a5, a3.x, a3.y, a4);

  [(CRLFreehandDrawingPathCreator *)self p_updatePath];
}

- (void)endDrawing
{
  if (self->_creatorState != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE840);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA5A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE860);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator endDrawing]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:186 isFatal:0 description:"endDrawing should be called from the started state."];
  }
  self->_creatorState = 2;
  if (self->_strokeGenerator)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = sub_1004AAC2C;
    v29 = sub_1004AAC3C;
    id v30 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    strokeGenerator = self->_strokeGenerator;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1004AAC44;
    v22 = &unk_1014DB078;
    v24 = &v25;
    v8 = v6;
    v23 = v8;
    [(CRLPKStrokeGenerator *)strokeGenerator drawingEndedWithCompletion:&v19];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v9 = (const CGPath *)[v26[5] newPathRepresentation:v19, v20, v21, v22];
    v10 = +[CRLBezierPath bezierPathWithCGPath:v9];
    immutableBezierPath = self->_immutableBezierPath;
    self->_immutableBezierPath = v10;

    CGPathRelease(v9);
    if ([(CRLBezierPath *)self->_immutableBezierPath isEmpty]
      || ([(CRLBezierPath *)self->_immutableBezierPath length],
          double v13 = v12,
          [(CRLFreehandDrawingPathCreator *)self minimumLengthForFinalCreatedPath],
          v13 < v14))
    {
      if (self->_initialPoint.x != INFINITY || self->_initialPoint.y != INFINITY)
      {
        [(CRLFreehandDrawingPathCreator *)self minimumLengthForFinalCreatedPath];
        -[CRLFreehandDrawingPathCreator p_pathWithLength:fromPoint:](self, "p_pathWithLength:fromPoint:");
        objc_super v15 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
        v16 = self->_immutableBezierPath;
        self->_immutableBezierPath = v15;
      }
    }
    v17 = +[CRLBezierPath bezierPath];
    mutableBezierPath = self->_mutableBezierPath;
    self->_mutableBezierPath = v17;

    self->_immutablePointCount = 0xCCCCCCCCCCCCCCCDLL
                               * (((char *)self->_filteredStrokePoints.__end_
                                 - (char *)self->_filteredStrokePoints.__begin_) >> 4);

    _Block_object_dispose(&v25, 8);
  }
}

- (id)handoffToNewPathCreator
{
  if (self->_strokeGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE880);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA6B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE8A0);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator handoffToNewPathCreator]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:247 isFatal:0 description:"Can't handoff to a new path creator when using PencilKit."];
  }
  if (self->_inputPointCount <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE8C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA628();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE8E0);
    }
    dispatch_semaphore_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator handoffToNewPathCreator]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:248 isFatal:0 description:"Need at least two points to do a handoff."];
  }
  [(CRLFreehandDrawingPathCreator *)self endDrawing];
  uint64_t v9 = [[CRLFreehandDrawingPathCreator alloc] initWithPencilKitSmoothing:0];
  [(CRLFreehandDrawingPathCreator *)v9 beginDrawingWithViewScale:self->_inputType inputType:self->_viewScale];
  end = self->_allInputPoints.__end_;
  double v11 = *((double *)end - 11);
  double v12 = *((double *)end - 10);
  double v13 = *((double *)end - 5);
  char v14 = *((unsigned char *)end - 32);
  -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v9, "drawToPoint:atTime:predicted:", *((unsigned char *)end - 120) & 1, *((double *)end - 22), *((double *)end - 21), *((double *)end - 16));
  -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v9, "drawToPoint:atTime:predicted:", v14 & 1, v11, v12, v13);

  return v9;
}

- (id)copyOfEntirePath
{
  id v3 = [(CRLBezierPath *)self->_immutableBezierPath copy];
  [v3 appendBezierPath:self->_mutableBezierPath skippingInitialMoveIfPossible:1];
  return v3;
}

- (id)copyOfCommittedPath
{
  return [(CRLBezierPath *)self->_committedPath copy];
}

- (id)commitAllAvailablePoints
{
  id v3 = -[CRLBezierPath copyWithPointsInRange:](self->_immutableBezierPath, "copyWithPointsInRange:", [(CRLBezierPath *)self->_committedPath elementCount], [(CRLFreehandDrawingPathCreator *)self pointCountAvailableToCommit]);
  [(CRLBezierPath *)self->_committedPath appendBezierPath:v3 skippingInitialMoveIfPossible:1];

  return v3;
}

- (id)copyOfUncommittedPath
{
  id v3 = -[CRLBezierPath copyWithPointsInRange:](self->_immutableBezierPath, "copyWithPointsInRange:", [(CRLBezierPath *)self->_committedPath elementCount], [(CRLFreehandDrawingPathCreator *)self p_immutableUncommittedCountNotAdjustedForLastPoint]);
  [v3 appendBezierPath:self->_mutableBezierPath skippingInitialMoveIfPossible:1];
  return v3;
}

- (CGRect)takeDirtyRect
{
  CGFloat x = self->_lastMutableDirtyRect.origin.x;
  CGFloat y = self->_lastMutableDirtyRect.origin.y;
  p_lastMutableDirtyRect = &self->_lastMutableDirtyRect;
  CGFloat width = self->_lastMutableDirtyRect.size.width;
  CGFloat height = self->_lastMutableDirtyRect.size.height;
  if (![(CRLBezierPath *)self->_immutableBezierPath isEmpty])
  {
    unint64_t nextImmutablePointIndexForDirtyRect = self->_nextImmutablePointIndexForDirtyRect;
    if (nextImmutablePointIndexForDirtyRect < [(CRLBezierPath *)self->_immutableBezierPath elementCount])
    {
      id v9 = -[CRLBezierPath copyWithPointsInRange:](self->_immutableBezierPath, "copyWithPointsInRange:", self->_nextImmutablePointIndexForDirtyRect, (char *)[(CRLBezierPath *)self->_immutableBezierPath elementCount]- self->_nextImmutablePointIndexForDirtyRect);
      [v9 bounds];
      v32.origin.CGFloat x = v10;
      v32.origin.CGFloat y = v11;
      v32.size.CGFloat width = v12;
      v32.size.CGFloat height = v13;
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGRect v28 = CGRectUnion(v27, v32);
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
      self->_unint64_t nextImmutablePointIndexForDirtyRect = [(CRLBezierPath *)self->_immutableBezierPath elementCount];
    }
  }
  if ([(CRLBezierPath *)self->_mutableBezierPath isEmpty])
  {
    CGSize size = CGRectNull.size;
    p_lastMutableDirtyRect->origin = CGRectNull.origin;
    p_lastMutableDirtyRect->CGSize size = size;
  }
  else
  {
    [(CRLBezierPath *)self->_mutableBezierPath bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    v33.origin.CGFloat x = v16;
    v33.origin.CGFloat y = v18;
    v33.size.CGFloat width = v20;
    v33.size.CGFloat height = v22;
    CGRect v30 = CGRectUnion(v29, v33);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
    self->_lastMutableDirtyRect.origin.CGFloat x = v16;
    self->_lastMutableDirtyRect.origin.CGFloat y = v18;
    self->_lastMutableDirtyRect.size.CGFloat width = v20;
    self->_lastMutableDirtyRect.size.CGFloat height = v22;
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (unint64_t)pointCountAvailableToCommit
{
  unint64_t result = [(CRLFreehandDrawingPathCreator *)self p_immutableUncommittedCountNotAdjustedForLastPoint];
  if (result) {
    result -= self->_creatorState != 2;
  }
  return result;
}

- (BOOL)p_shouldSaveAllPoints
{
  if (!self->_strokeGenerator) {
    return 1;
  }
  if (qword_101719D28 != -1) {
    dispatch_once(&qword_101719D28, &stru_1014FE900);
  }
  v2 = off_10166E980;

  return os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
}

- (unint64_t)p_immutableUncommittedCountNotAdjustedForLastPoint
{
  int64_t v3 = [(CRLBezierPath *)self->_immutableBezierPath elementCount];
  unint64_t result = v3 - [(CRLBezierPath *)self->_committedPath elementCount];
  if ((result & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE920);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA738();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE940);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    dispatch_semaphore_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator p_immutableUncommittedCountNotAdjustedForLastPoint]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:339 isFatal:0 description:"Out-of-bounds type assignment was clamped to min"];

    return 0;
  }
  return result;
}

- (void)p_nonUpdatingDrawToPoint:(CGPoint)a3 atTime:(double)a4 predicted:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  if (self->_creatorState != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE960);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA7C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE980);
    }
    CGFloat v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    CGFloat v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator p_nonUpdatingDrawToPoint:atTime:predicted:]");
    CGFloat v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:343 isFatal:0 description:"continueDrawing should be called from the started state."];
  }
  if (self->_initialPoint.x == INFINITY && self->_initialPoint.y == INFINITY)
  {
    self->_initialPoint.double x = x;
    self->_initialPoint.double y = y;
  }
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  -[CRLFreehandDrawingPathCreator p_drawingInputPoint:atTime:predicted:](self, "p_drawingInputPoint:atTime:predicted:", v5, x, y, a4);
  if ([(CRLFreehandDrawingPathCreator *)self p_shouldSaveAllPoints])
  {
    value = self->_allInputPoints.__end_cap_.__value_;
    end = self->_allInputPoints.__end_;
    if (end >= value)
    {
      begin = self->_allInputPoints.__begin_;
      uint64_t v22 = 0x2E8BA2E8BA2E8BA3 * ((end - begin) >> 3);
      unint64_t v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) > 0x2E8BA2E8BA2E8BALL) {
        sub_100004E40();
      }
      unint64_t v24 = 0x2E8BA2E8BA2E8BA3 * ((value - begin) >> 3);
      if (2 * v24 > v23) {
        unint64_t v23 = 2 * v24;
      }
      if (v24 >= 0x1745D1745D1745DLL) {
        unint64_t v25 = 0x2E8BA2E8BA2E8BALL;
      }
      else {
        unint64_t v25 = v23;
      }
      if (v25) {
        double v26 = (char *)sub_100004EE8((uint64_t)&self->_allInputPoints.__end_cap_, v25);
      }
      else {
        double v26 = 0;
      }
      CGRect v27 = &v26[88 * v22];
      CGRect v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v26[88 * v25];
      long long v29 = v43;
      *(_OWORD *)CGRect v27 = v42;
      *((_OWORD *)v27 + 1) = v29;
      long long v30 = v44;
      long long v31 = v45;
      long long v32 = v46;
      *((void *)v27 + 10) = v47;
      *((_OWORD *)v27 + 3) = v31;
      *((_OWORD *)v27 + 4) = v32;
      *((_OWORD *)v27 + 2) = v30;
      CGFloat v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v27 + 88);
      v34 = self->_allInputPoints.__begin_;
      CGRect v33 = self->_allInputPoints.__end_;
      if (v33 != v34)
      {
        do
        {
          long long v35 = *(_OWORD *)((char *)v33 - 88);
          *(_OWORD *)(v27 - 72) = *(_OWORD *)((char *)v33 - 72);
          *(_OWORD *)(v27 - 88) = v35;
          long long v36 = *(_OWORD *)((char *)v33 - 56);
          long long v37 = *(_OWORD *)((char *)v33 - 40);
          long long v38 = *(_OWORD *)((char *)v33 - 24);
          *((void *)v27 - 1) = *((void *)v33 - 1);
          *(_OWORD *)(v27 - 24) = v38;
          *(_OWORD *)(v27 - 40) = v37;
          *(_OWORD *)(v27 - 56) = v36;
          v27 -= 88;
          CGRect v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v33 - 88);
        }
        while (v33 != v34);
        CGRect v33 = self->_allInputPoints.__begin_;
      }
      self->_allInputPoints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v27;
      self->_allInputPoints.__end_ = v20;
      self->_allInputPoints.__end_cap_.__value_ = v28;
      if (v33) {
        operator delete(v33);
      }
    }
    else
    {
      long long v16 = v43;
      *(_OWORD *)end = v42;
      *((_OWORD *)end + 1) = v16;
      long long v17 = v44;
      long long v18 = v45;
      long long v19 = v46;
      *((void *)end + 10) = v47;
      *((_OWORD *)end + 3) = v18;
      *((_OWORD *)end + 4) = v19;
      *((_OWORD *)end + 2) = v17;
      CGFloat v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 88);
    }
    self->_allInputPoints.__end_ = v20;
  }
  strokeGenerator = self->_strokeGenerator;
  if (strokeGenerator)
  {
    v40[2] = v44;
    v40[3] = v45;
    v40[4] = v46;
    uint64_t v41 = v47;
    v40[0] = v42;
    v40[1] = v43;
    [(CRLPKStrokeGenerator *)strokeGenerator addPoint:v40];
  }
  ++self->_inputPointCount;
}

- (void)p_updatePath
{
  unint64_t immutablePointCount = self->_immutablePointCount;
  strokeGenerator = self->_strokeGenerator;
  if (strokeGenerator)
  {
    unint64_t v5 = [(CRLPKStrokeGenerator *)strokeGenerator fetchFilteredPointsFromIndex:immutablePointCount intoVector:&self->_filteredStrokePoints];
    self->_unint64_t immutablePointCount = v5;
    if (v5 < immutablePointCount)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE9A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BA848();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE9C0);
      }
      dispatch_semaphore_t v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator p_updatePath]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:368 isFatal:0 description:"The immutable point count should only ever increase."];

      unint64_t v5 = self->_immutablePointCount;
    }
  }
  else
  {
    sub_10016BE28((uint64_t)&self->_filteredStrokePoints, 0x2E8BA2E8BA2E8BA3 * ((self->_allInputPoints.__end_ - self->_allInputPoints.__begin_) >> 3));
    unint64_t v9 = self->_immutablePointCount;
    begin = self->_allInputPoints.__begin_;
    if (v9 < 0x2E8BA2E8BA2E8BA3 * ((self->_allInputPoints.__end_ - begin) >> 3))
    {
      uint64_t v11 = 88 * v9;
      unint64_t v12 = v9;
      do
      {
        CGFloat v13 = (char *)begin + v11;
        long long v14 = *((_OWORD *)v13 + 1);
        v48[0] = *(_OWORD *)v13;
        v48[1] = v14;
        long long v16 = *((_OWORD *)v13 + 3);
        long long v15 = *((_OWORD *)v13 + 4);
        long long v17 = *((_OWORD *)v13 + 2);
        uint64_t v49 = *((void *)v13 + 10);
        v48[3] = v16;
        v48[4] = v15;
        v48[2] = v17;
        +[CRLPKStrokeGenerator outputPointFromInputPoint:v48];
        long long v18 = &self->_filteredStrokePoints.__begin_[v12];
        *(_OWORD *)&v18->timestamp = *(_OWORD *)v50;
        long long v19 = v51;
        long long v20 = v52;
        long long v21 = v54;
        *(_OWORD *)&v18->force = v53;
        *(_OWORD *)&v18->altitude = v21;
        *(_OWORD *)&v18->location.double y = v19;
        *(_OWORD *)&v18->aspectRatio = v20;
        ++v9;
        begin = self->_allInputPoints.__begin_;
        v11 += 88;
        ++v12;
      }
      while (v9 < 0x2E8BA2E8BA2E8BA3 * ((self->_allInputPoints.__end_ - begin) >> 3));
    }
    unint64_t v5 = 0xCCCCCCCCCCCCCCCDLL
       * (((char *)self->_filteredStrokePoints.__end_ - (char *)self->_filteredStrokePoints.__begin_) >> 4);
    self->_unint64_t immutablePointCount = v5;
  }
  if (v5 > immutablePointCount && v5 >= 2)
  {
    unint64_t v23 = self->_filteredStrokePoints.__begin_;
    v50[1] = 0;
    *(void *)&long long v51 = 0;
    v50[0] = 0;
    sub_1004AC2EC(v50, v23, (uint64_t)&v23[v5], v5);
    __p = 0;
    long long v46 = 0;
    uint64_t v47 = 0;
    sub_1004AC3BC(&__p, v50[0], (uint64_t)v50[1], 0xCCCCCCCCCCCCCCCDLL * (((char *)v50[1] - (char *)v50[0]) >> 4));
    unint64_t v24 = sub_10031C7B8(&__p, 0xCCCCCCCCCCCCCCCDLL* (((char *)self->_filteredStrokePoints.__end_ - (char *)self->_filteredStrokePoints.__begin_) >> 4) > self->_immutablePointCount);
    if (__p)
    {
      long long v46 = __p;
      operator delete(__p);
    }
    unint64_t v25 = +[CRLBezierPath bezierPathWithCGPath:v24];
    immutableBezierPath = self->_immutableBezierPath;
    self->_immutableBezierPath = v25;

    CGPathRelease(v24);
    if (v50[0])
    {
      v50[1] = v50[0];
      operator delete(v50[0]);
    }
  }
  CGRect v28 = self->_filteredStrokePoints.__begin_;
  end = self->_filteredStrokePoints.__end_;
  unint64_t v29 = 0xCCCCCCCCCCCCCCCDLL * (((char *)end - (char *)v28) >> 4);
  unint64_t v30 = self->_immutablePointCount;
  if (v29 > 1)
  {
    if (v29 <= v30)
    {
      v40 = +[CRLBezierPath bezierPath];
      mutableBezierPath = self->_mutableBezierPath;
      self->_mutableBezierPath = v40;
    }
    else
    {
      unint64_t v34 = v30 - 1;
      if (!v30) {
        unint64_t v34 = 0;
      }
      unint64_t v35 = v34 - 1;
      if (v30 >= 2) {
        unint64_t v36 = v35;
      }
      else {
        unint64_t v36 = 0;
      }
      v50[0] = 0;
      v50[1] = 0;
      *(void *)&long long v51 = 0;
      sub_1004AC2EC(v50, &v28[v36], (uint64_t)end, 0xCCCCCCCCCCCCCCCDLL * (((char *)end - (char *)&v28[v36]) >> 4));
      long long v42 = 0;
      long long v43 = 0;
      uint64_t v44 = 0;
      sub_1004AC3BC(&v42, v50[0], (uint64_t)v50[1], 0xCCCCCCCCCCCCCCCDLL * (((char *)v50[1] - (char *)v50[0]) >> 4));
      long long v37 = sub_10031C7B8(&v42, 0);
      if (v42)
      {
        long long v43 = v42;
        operator delete(v42);
      }
      long long v38 = +[CRLBezierPath bezierPathWithCGPath:v37];
      v39 = self->_mutableBezierPath;
      self->_mutableBezierPath = v38;

      CGPathRelease(v37);
      if (v50[0])
      {
        v50[1] = v50[0];
        operator delete(v50[0]);
      }
    }
  }
  else
  {
    BOOL v31 = v30 == 0;
    -[CRLFreehandDrawingPathCreator p_pathWithLength:fromPoint:](self, "p_pathWithLength:fromPoint:", 0.100000001, self->_initialPoint.x, self->_initialPoint.y);
    long long v32 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CGRect v33 = self->_mutableBezierPath;
      self->_mutableBezierPath = v32;
    }
    else
    {
      CGRect v33 = self->_immutableBezierPath;
      self->_immutableBezierPath = v32;
    }
  }
}

- ($EB457B8D156C558632463A5C38AABCB2)p_drawingInputPoint:(SEL)a3 atTime:(CGPoint)a4 predicted:(double)a5
{
  retstr->var0 = (CGPoint)xmmword_101175C80;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)algn_101175C90;
  *(void *)&retstr->var9 = 0;
  *(_OWORD *)&retstr->var5 = unk_101175CB0;
  *(_OWORD *)&retstr->var7 = xmmword_101175CC0;
  *(_OWORD *)&retstr->var3 = xmmword_101175CA0;
  retstr->var0 = a4;
  retstr->var1 = -1.0;
  retstr->var5 = a5;
  retstr->var6 = a6;
  retstr->var7 = -1;
  return self;
}

- (id)p_pathWithLength:(double)a3 fromPoint:(CGPoint)a4
{
  double y = a4.y;
  CGFloat v6 = a4.x + a3 * -0.5;
  uint64_t v7 = +[CRLBezierPath bezierPath];
  [v7 moveToPoint:v6 y];
  [v7 curveToPoint:v6 + a3 controlPoint1:y controlPoint2:v6 + a3 / 3.0 + v6, y];

  return v7;
}

- (unint64_t)inputPointCount
{
  return self->_inputPointCount;
}

- (double)minimumLengthForFinalCreatedPath
{
  return self->_minimumLengthForFinalCreatedPath;
}

- (void)setMinimumLengthForFinalCreatedPath:(double)a3
{
  self->_minimumLengthForFinalCreatedPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedPath, 0);
  objc_storeStrong((id *)&self->_mutableBezierPath, 0);
  objc_storeStrong((id *)&self->_immutableBezierPath, 0);
  begin = self->_filteredStrokePoints.__begin_;
  if (begin)
  {
    self->_filteredStrokePoints.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_allInputPoints.__begin_;
  if (v4)
  {
    self->_allInputPoints.__end_ = v4;
    operator delete(v4);
  }

  objc_storeStrong((id *)&self->_strokeGenerator, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end