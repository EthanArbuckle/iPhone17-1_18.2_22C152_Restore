@interface RPTPagingScrollViewTestParameters
- (CAMediaTimingFunction)curveFunction;
- (CGRect)scrollingBounds;
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTPagingScrollViewTestParameters)initWithTestName:(id)a3 scrollBounds:(CGRect)a4 scrollContentLength:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7;
- (RPTPagingScrollViewTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5;
- (double)iterationDurationFactor;
- (double)scrollingContentLength;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)direction;
- (void)positionsForDirection:(int64_t)a3 startOut:(CGPoint *)a4 endOut:(CGPoint *)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setCurveFunction:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setIterationDurationFactor:(double)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setScrollingContentLength:(double)a3;
- (void)setTestName:(id)a3;
- (void)swipeWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6;
@end

@implementation RPTPagingScrollViewTestParameters

- (RPTPagingScrollViewTestParameters)initWithTestName:(id)a3 scrollBounds:(CGRect)a4 scrollContentLength:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  v17 = RPTLogTestRunning();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.double width = width;
    v45.size.double height = height;
    uint64_t v18 = _RPTStringFromCGRect(v45);
    v19 = (void *)v18;
    *(_DWORD *)buf = 138544386;
    v20 = @"YES";
    id v35 = v15;
    __int16 v36 = 2114;
    if (!v16) {
      v20 = @"NULL";
    }
    uint64_t v37 = v18;
    __int16 v38 = 2048;
    double v39 = a5;
    __int16 v40 = 2050;
    int64_t v41 = a6;
    __int16 v42 = 2114;
    v43 = v20;
    _os_log_impl(&dword_1B626C000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTPagingScrollViewTestParameters initWithTestName: %{public}@ scrollBounds: %{public}@ scrollContentLength: %f direction: %{public}ld completionHandler: %{public}@]", buf, 0x34u);
  }
  BOOL v21 = _RPTAxisFromScrollDirection(a6);
  if (RPTSizeAlongAxis(v21, width, height) * 1.5 > a5)
  {
    v22 = RPTLogTestRunning();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RPTPagingScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](v22, x, y, width, height, a5);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)RPTPagingScrollViewTestParameters;
  v23 = [(RPTPagingScrollViewTestParameters *)&v33 init];
  if (v23)
  {
    uint64_t v24 = [v15 copy];
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_scrollingBounds.origin.double x = x;
    v23->_scrollingBounds.origin.double y = y;
    v23->_scrollingBounds.size.double width = width;
    v23->_scrollingBounds.size.double height = height;
    v23->_scrollingContentLength = a5;
    v23->_direction = _UIScrollDirectionFromRPTScrollDirection(a6);
    uint64_t v26 = MEMORY[0x1BA9B23F0](v16);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = (id)v26;

    uint64_t v28 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v28;

    uint64_t v30 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    curveFunction = v23->_curveFunction;
    v23->_curveFunction = (CAMediaTimingFunction *)v30;

    v23->_iterationDurationFactor = 1.0;
  }

  return v23;
}

- (RPTPagingScrollViewTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = RPTLogTestRunning();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"YES";
    int v18 = 138543874;
    id v19 = v8;
    __int16 v20 = 2114;
    if (!v10) {
      v12 = @"NULL";
    }
    id v21 = v9;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1B626C000, v11, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTPagingScrollViewTestParameters initWithTestName: %{public}@ scrollView: %{public}@ completionHandler: %{public}@]", (uint8_t *)&v18, 0x20u);
  }

  uint64_t v13 = RPTDefaultScrollDirection(v9);
  RPTContentSizeInDirection(v9, v13);
  v14 = -[RPTPagingScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](self, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v8, v13, v10, RPTGetBoundsForView(v9));
  if (v14)
  {
    id v15 = [v9 window];
    id v16 = +[RPTCoordinateSpaceConverter converterFromWindow:v15];
    [(RPTPagingScrollViewTestParameters *)v14 setConversion:v16];
  }
  return v14;
}

- (id)composerBlock
{
  v3 = RPTLogTestRunning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B626C000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters composerBlock", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__RPTPagingScrollViewTestParameters_composerBlock__block_invoke;
  v6[3] = &unk_1E613DF78;
  v6[4] = self;
  v4 = (void *)MEMORY[0x1BA9B23F0](v6);
  return v4;
}

void __50__RPTPagingScrollViewTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4[6])
  {
    objc_msgSend(v3, "setTouchCurveFunction:");
    char v5 = objc_opt_respondsToSelector();
    v4 = *(void **)(a1 + 32);
    if (v5)
    {
      [v3 setValue:v4[6] forKey:@"pointerCurveFunction"];
      v4 = *(void **)(a1 + 32);
    }
  }
  uint64_t v6 = _RPTScrollDirectionFromUIScrollDirection([v4 direction]);
  [*(id *)(a1 + 32) scrollingBounds];
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = _RPTAxisFromScrollDirection(v6);
  double v12 = RPTSizeAlongAxis(v11, v8, v10);
  uint64_t v13 = RPTLogTestRunning();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_1B626C000, v13, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters pageLength %f", buf, 0xCu);
  }

  double v14 = v12 * 10.0;
  [*(id *)(a1 + 32) scrollingContentLength];
  if (v15 >= v12 * 7.0) {
    double v16 = v12 * 7.0;
  }
  else {
    double v16 = v15;
  }
  v17 = RPTLogTestRunning();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_1B626C000, v17, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters reversalOffset %f", buf, 0xCu);
  }

  if (v14 > 0.0)
  {
    double v18 = fmax(v12 / 500.0, 1.5);
    if (v18 <= 0.5) {
      double v19 = v18;
    }
    else {
      double v19 = 0.5;
    }
    char v20 = 1;
    double v21 = 0.0;
    do
    {
      double v22 = v19;
      uint64_t v23 = v6;
      if ((uint64_t)(v21 / v16))
      {
        uint64_t v23 = RPTOppositeDirectionFrom(v6);
        double v22 = v19 * 0.5;
      }
      *(_OWORD *)buf = 0uLL;
      double v26 = 0.0;
      double v27 = 0.0;
      [*(id *)(a1 + 32) positionsForDirection:v23 startOut:buf endOut:&v26];
      if (v20) {
        double v22 = v19 + v19;
      }
      uint64_t v24 = *(void **)(a1 + 32);
      [v24 iterationDurationFactor];
      objc_msgSend(v24, "swipeWithComposer:fromPoint:toPoint:duration:", v3, *(_OWORD *)buf, v26, v27, v22 * v25);
      char v20 = 0;
      double v21 = (double)(unint64_t)(v12 + v21);
    }
    while (v14 > v21);
  }
}

- (void)positionsForDirection:(int64_t)a3 startOut:(CGPoint *)a4 endOut:(CGPoint *)a5
{
  [(RPTPagingScrollViewTestParameters *)self scrollingBounds];
  double Midpoint = RPTCGRectGetMidpoint(v9, v10, v11, v12);
  double v15 = v14;
  [(RPTPagingScrollViewTestParameters *)self scrollingBounds];
  double v17 = v16;
  double v19 = v18;
  BOOL v20 = _RPTAxisFromScrollDirection(a3);
  double v21 = (RPTSizeAlongAxis(v20, v17, v19) + -20.0) * 0.5;
  switch(a3)
  {
    case 0:
      double v22 = v15 - v21;
      double v15 = v15 + v21;
      goto LABEL_5;
    case 1:
      double v22 = v15 + v21;
      double v15 = v15 - v21;
LABEL_5:
      double v23 = Midpoint;
      break;
    case 2:
      double v23 = Midpoint + v21;
      double Midpoint = Midpoint - v21;
      goto LABEL_8;
    case 3:
      double v23 = Midpoint - v21;
      double Midpoint = Midpoint + v21;
LABEL_8:
      double v22 = v15;
      break;
    default:
      double v15 = 0.0;
      double Midpoint = 0.0;
      double v22 = 0.0;
      double v23 = 0.0;
      break;
  }
  a4->double x = v23;
  a4->double y = v22;
  a5->double x = Midpoint;
  a5->double y = v15;
}

- (void)swipeWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = RPTLogTestRunning();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v31.double x = v10;
    v31.double y = v9;
    double v14 = _RPTStringFromCGPoint(v31);
    v32.double x = x;
    v32.double y = y;
    double v15 = _RPTStringFromCGPoint(v32);
    int v24 = 138543874;
    double v25 = v14;
    __int16 v26 = 2114;
    double v27 = v15;
    __int16 v28 = 2048;
    double v29 = a6;
    _os_log_impl(&dword_1B626C000, v13, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters swipeFromPoint: %{public}@ toPoint: %{public}@ duration:%f ", (uint8_t *)&v24, 0x20u);
  }
  double v16 = [(RPTPagingScrollViewTestParameters *)self conversion];
  objc_msgSend(v16, "convertPoint:", v10, v9);
  double v18 = v17;
  double v20 = v19;
  double v21 = [(RPTPagingScrollViewTestParameters *)self conversion];
  objc_msgSend(v21, "convertVector:", x - v10, y - v9);
  objc_msgSend(v12, "pointerOrFingerScrollAt:byDelta:duration:", v18, v20, v22, v23, a6);

  [v12 advanceTime:0.4];
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
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

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (double)scrollingContentLength
{
  return self->_scrollingContentLength;
}

- (void)setScrollingContentLength:(double)a3
{
  self->_scrollingContentLength = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)iterationDurationFactor
{
  return self->_iterationDurationFactor;
}

- (void)setIterationDurationFactor:(double)a3
{
  self->_iterationDurationFactor = a3;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
}

- (CAMediaTimingFunction)curveFunction
{
  return self->_curveFunction;
}

- (void)setCurveFunction:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_curveFunction, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

- (void)initWithTestName:(double)a3 scrollBounds:(double)a4 scrollContentLength:(double)a5 direction:(double)a6 completionHandler:.cold.1(NSObject *a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v8 = _RPTStringFromCGRect(*(CGRect *)&a2);
  int v9 = 134218242;
  double v10 = a6;
  __int16 v11 = 2114;
  id v12 = v8;
  _os_log_error_impl(&dword_1B626C000, a1, OS_LOG_TYPE_ERROR, "RPT: RPTPagingScrollViewTestParameters scrollContentLength: %f too short for scrollBounds %{public}@ for a meaningful test.", (uint8_t *)&v9, 0x16u);
}

@end