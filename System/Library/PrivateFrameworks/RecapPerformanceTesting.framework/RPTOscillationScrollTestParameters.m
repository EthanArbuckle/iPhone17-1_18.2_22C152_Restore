@interface RPTOscillationScrollTestParameters
- (BOOL)finishWithHalfIteration;
- (BOOL)preventDismissalGestures;
- (BOOL)shouldFlick;
- (CAMediaTimingFunction)curveFunction;
- (CGPoint)_incrementPoint:(CGPoint)a3 final:(BOOL)a4;
- (CGPoint)finalFingerPosition;
- (CGPoint)initialFingerPosition;
- (CGRect)scrollingBounds;
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12;
- (RPTOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12 completionHandler:(id)a13;
- (double)amplitudeVariationPerIteration;
- (double)initialAmplitude;
- (double)iterationDuration;
- (double)useDefaultDurationForFlick;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)initialDirection;
- (unint64_t)iterations;
- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6;
- (void)setAmplitudeVariationPerIteration:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setCurveFunction:(id)a3;
- (void)setFinishWithHalfIteration:(BOOL)a3;
- (void)setInitialAmplitude:(double)a3;
- (void)setInitialDirection:(int64_t)a3;
- (void)setIterationDuration:(double)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setPreventDismissalGestures:(BOOL)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setShouldFlick:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setUseDefaultDurationForFlick:(double)a3;
@end

@implementation RPTOscillationScrollTestParameters

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__RPTOscillationScrollTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

- (RPTOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12
{
  return -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:](self, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:", a3, a4, a6, a7, a10, a12, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8, a9, a11, 0);
}

- (RPTOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12 completionHandler:(id)a13
{
  BOOL v13 = a12;
  BOOL v15 = a7;
  BOOL v16 = a6;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v27 = a13;
  v28 = RPTLogTestRunning();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    uint64_t v29 = _RPTStringFromCGRect(v64);
    v30 = (void *)v29;
    v31 = @"YES";
    *(_DWORD *)buf = 138545922;
    id v42 = v26;
    __int16 v43 = 2050;
    if (!v27) {
      v31 = @"NULL";
    }
    unint64_t v44 = a4;
    __int16 v45 = 2114;
    uint64_t v46 = v29;
    __int16 v47 = 1024;
    BOOL v48 = v16;
    __int16 v49 = 1024;
    BOOL v50 = v15;
    __int16 v51 = 2048;
    double v52 = a8;
    __int16 v53 = 2048;
    double v54 = a9;
    __int16 v55 = 2050;
    int64_t v56 = a10;
    __int16 v57 = 2048;
    double v58 = a11;
    __int16 v59 = 1024;
    BOOL v60 = v13;
    __int16 v61 = 2114;
    v62 = v31;
    _os_log_impl(&dword_1B626C000, v28, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTOscillationScrollTestParameters initWithTestName: %{public}@ iterations: %{public}lul scrollingBounds: %{public}@ useFlicks: %{BOOL}u preventDismissalGestures: %{BOOL}u initialAmplitude: %f amplitudeVariationPerIteration: %f initialDirection: %{public}ld iterationDuration: %f finishWithHalfIteration: %{BOOL}u completionHandler: %{public}@]", buf, 0x64u);
  }
  v40.receiver = self;
  v40.super_class = (Class)RPTOscillationScrollTestParameters;
  v32 = [(RPTOscillationScrollTestParameters *)&v40 init];
  if (v32)
  {
    uint64_t v33 = [v26 copy];
    testName = v32->_testName;
    v32->_testName = (NSString *)v33;

    v32->_iterations = a4;
    v32->_scrollingBounds.origin.CGFloat y = y;
    v32->_scrollingBounds.size.CGFloat width = width;
    v32->_scrollingBounds.size.CGFloat height = height;
    v32->_shouldFlick = v16;
    v32->_useDefaultDurationForFlick = 1.0;
    v32->_preventDismissalGestures = v15;
    v32->_amplitudeVariationPerIteration = a9;
    v32->_initialAmplitude = a8;
    v32->_initialDirection = a10;
    v32->_iterationDuration = a11;
    v32->_scrollingBounds.origin.CGFloat x = x;
    v32->_finishWithHalfIteration = v13;
    uint64_t v35 = MEMORY[0x1BA9B23F0](v27);
    id completionHandler = v32->_completionHandler;
    v32->_id completionHandler = (id)v35;

    uint64_t v37 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v32->_conversion;
    v32->_conversion = (RPTCoordinateSpaceConverter *)v37;
  }
  return v32;
}

- (void)setConversion:(id)a3
{
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (CGPoint)initialFingerPosition
{
  [(RPTOscillationScrollTestParameters *)self scrollingBounds];
  double Midpoint = RPTCGRectGetMidpoint(v3, v4, v5, v6);
  double v9 = v8;
  [(RPTOscillationScrollTestParameters *)self initialAmplitude];
  double v11 = v10 * 0.5;
  uint64_t v12 = [(RPTOscillationScrollTestParameters *)self initialDirection];
  double v13 = RPTCGPointAdvanceInDirectionByAmount(v12, Midpoint, v9, v11);
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (CGPoint)finalFingerPosition
{
  [(RPTOscillationScrollTestParameters *)self scrollingBounds];
  double Midpoint = RPTCGRectGetMidpoint(v3, v4, v5, v6);
  double v9 = v8;
  [(RPTOscillationScrollTestParameters *)self initialAmplitude];
  double v11 = v10 * 0.5;
  uint64_t v12 = RPTOppositeDirectionFrom([(RPTOscillationScrollTestParameters *)self initialDirection]);
  double v13 = RPTCGPointAdvanceInDirectionByAmount(v12, Midpoint, v9, v11);
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (double)initialAmplitude
{
  return self->_initialAmplitude;
}

- (CGRect)scrollingBounds
{
  double x = self->_scrollingBounds.origin.x;
  double y = self->_scrollingBounds.origin.y;
  double width = self->_scrollingBounds.size.width;
  double height = self->_scrollingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)finishWithHalfIteration
{
  return self->_finishWithHalfIteration;
}

- (BOOL)preventDismissalGestures
{
  return self->_preventDismissalGestures;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (int64_t)initialDirection
{
  return self->_initialDirection;
}

- (double)amplitudeVariationPerIteration
{
  return self->_amplitudeVariationPerIteration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curveFunction, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

- (CGPoint)_incrementPoint:(CGPoint)a3 final:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = -(self->_amplitudeVariationPerIteration * 0.5);
  if (a4) {
    double v6 = self->_amplitudeVariationPerIteration * 0.5;
  }
  int64_t initialDirection = self->_initialDirection;
  if (initialDirection == 3 || initialDirection == 0) {
    double v9 = -v6;
  }
  else {
    double v9 = v6;
  }
  BOOL v10 = _RPTAxisFromScrollDirection(initialDirection);
  double v11 = -0.0;
  if (v10) {
    double v12 = v9;
  }
  else {
    double v12 = -0.0;
  }
  double v13 = x + v12;
  if (!v10) {
    double v11 = v9;
  }
  double v14 = y + v11;
  result.double y = v14;
  result.double x = v13;
  return result;
}

uint64_t __51__RPTOscillationScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGFloat v4 = *(void **)(a1 + 32);
  v28 = v3;
  if (v4[6])
  {
    objc_msgSend(v3, "setTouchCurveFunction:");
    char v5 = objc_opt_respondsToSelector();
    CGFloat v4 = *(void **)(a1 + 32);
    if (v5)
    {
      [v28 setValue:v4[6] forKey:@"pointerCurveFunction"];
      CGFloat v4 = *(void **)(a1 + 32);
    }
  }
  [v4 iterationDuration];
  double v7 = v6;
  [*(id *)(a1 + 32) initialFingerPosition];
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 32) finalFingerPosition];
  double v13 = v12;
  double v15 = v14;
  if ([*(id *)(a1 + 32) preventDismissalGestures])
  {
    uint64_t v16 = RPTOppositeDirectionFrom([*(id *)(a1 + 32) initialDirection]);
    double v17 = RPTCGPointAdvanceInDirectionByAmount(v16, v9, v11, 75.0);
    objc_msgSend(v28, "dragWithStartPoint:endPoint:duration:", v9, v11, v17, v18, 0.3);
  }
  if (([*(id *)(a1 + 32) shouldFlick] & 1) == 0)
  {
    v19 = [*(id *)(a1 + 32) conversion];
    objc_msgSend(v19, "convertPoint:", v9, v11);
    objc_msgSend(v28, "touchDown:");
  }
  double v20 = v7 * 0.5;
  if ([*(id *)(a1 + 32) iterations])
  {
    unint64_t v21 = 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v28, v9, v11, v13, v15, v20);
      objc_msgSend(*(id *)(a1 + 32), "_incrementPoint:final:", 0, v9, v11);
      double v9 = v22;
      double v11 = v23;
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v28, v13, v15, v22, v23, v20);
      objc_msgSend(*(id *)(a1 + 32), "_incrementPoint:final:", 1, v13, v15);
      double v13 = v24;
      double v15 = v25;
      ++v21;
    }
    while (v21 <= [*(id *)(a1 + 32) iterations]);
  }
  if ([*(id *)(a1 + 32) finishWithHalfIteration]) {
    objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v28, v9, v11, v13, v15, v20);
  }
  if (([*(id *)(a1 + 32) shouldFlick] & 1) == 0)
  {
    id v26 = [*(id *)(a1 + 32) conversion];
    objc_msgSend(v26, "convertPoint:", v13, v15);
    objc_msgSend(v28, "liftUp:");
  }
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    [v28 setTouchCurveFunction:0];
    if (objc_opt_respondsToSelector()) {
      [v28 setValue:*(void *)(*(void *)(a1 + 32) + 48) forKey:@"pointerCurveFunction"];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  double v13 = RPTLogTestRunning();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v37.double x = v10;
    v37.double y = v9;
    double v14 = _RPTStringFromCGPoint(v37);
    v38.double x = x;
    v38.double y = y;
    double v15 = _RPTStringFromCGPoint(v38);
    int v28 = 138544130;
    id v29 = v12;
    __int16 v30 = 2114;
    v31 = v14;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    __int16 v34 = 2048;
    double v35 = a6;
    _os_log_impl(&dword_1B626C000, v13, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTOscillationScrollTestParameters scrollWithComposer: %{public}@ fromPoint: %{public}@ toPoint: %{public}@ duration: %f]", (uint8_t *)&v28, 0x2Au);
  }
  double v16 = x - v10;
  double v17 = y - v9;
  BOOL v18 = [(RPTOscillationScrollTestParameters *)self shouldFlick];
  v19 = [(RPTOscillationScrollTestParameters *)self conversion];
  objc_msgSend(v19, "convertPoint:", v10, v9);
  double v21 = v20;
  double v23 = v22;
  double v24 = [(RPTOscillationScrollTestParameters *)self conversion];
  objc_msgSend(v24, "convertVector:", v16, v17);
  if (v18)
  {
    if (self->_useDefaultDurationForFlick == 0.0) {
      double v27 = a6;
    }
    else {
      double v27 = 0.5;
    }
    objc_msgSend(v12, "_pointerOrFingerFlickAt:byDelta:duration:", v21, v23, v25, v26, v27);
  }
  else
  {
    objc_msgSend(v12, "_pointerOrFingerScrollAt:byDelta:duration:touchDownAndLift:", 0, v21, v23, v25, v26, a6);
  }
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (CAMediaTimingFunction)curveFunction
{
  return self->_curveFunction;
}

- (void)setCurveFunction:(id)a3
{
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (double)useDefaultDurationForFlick
{
  return self->_useDefaultDurationForFlick;
}

- (void)setUseDefaultDurationForFlick:(double)a3
{
  self->_useDefaultDurationForFlick = a3;
}

- (void)setPreventDismissalGestures:(BOOL)a3
{
  self->_preventDismissalGestures = a3;
}

- (void)setFinishWithHalfIteration:(BOOL)a3
{
  self->_finishWithHalfIteration = a3;
}

- (void)setAmplitudeVariationPerIteration:(double)a3
{
  self->_amplitudeVariationPerIteration = a3;
}

- (void)setInitialAmplitude:(double)a3
{
  self->_initialAmplitude = a3;
}

- (void)setInitialDirection:(int64_t)a3
{
  self->_int64_t initialDirection = a3;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

@end