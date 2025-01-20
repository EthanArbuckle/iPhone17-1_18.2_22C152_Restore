@interface RPTDirectionalSwipeTestParameters
- (BOOL)reverse;
- (BOOL)shouldFlick;
- (CGRect)scrollingBounds;
- (NSNumber)swipeSpeedFactor;
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5;
- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollingBounds:(CGRect)a4 swipeCount:(int64_t)a5 direction:(int64_t)a6 completionHandler:(id)a7;
- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollingBounds:(CGRect)a4 swipeCount:(int64_t)a5 reverse:(BOOL)a6 direction:(int64_t)a7 completionHandler:(id)a8;
- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 testType:(unint64_t)a4 scrollView:(id)a5 completionHandler:(id)a6;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)direction;
- (int64_t)swipeCount;
- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 swipeDuration:(double)a6;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setReverse:(BOOL)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setShouldFlick:(BOOL)a3;
- (void)setSwipeCount:(int64_t)a3;
- (void)setSwipeSpeedFactor:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation RPTDirectionalSwipeTestParameters

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollingBounds:(CGRect)a4 swipeCount:(int64_t)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a7;
  id v16 = a3;
  v17 = -[RPTDirectionalSwipeTestParameters initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:](self, "initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:", v16, a5, 0, _RPTScrollDirectionFromUIScrollDirection(a6), v15, x, y, width, height);

  return v17;
}

void __50__RPTDirectionalSwipeTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v29 = a2;
  v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v29 setTouchCurveFunction:v3];
  if (objc_opt_respondsToSelector()) {
    [v29 setValue:v3 forKey:@"pointerCurveFunction"];
  }
  [*(id *)(a1 + 32) scrollingBounds];
  double MidX = CGRectGetMidX(v31);
  [*(id *)(a1 + 32) scrollingBounds];
  double MidY = CGRectGetMidY(v32);
  [*(id *)(a1 + 32) scrollingBounds];
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = RPTAxisFromScrollDirection([*(id *)(a1 + 32) direction]);
  double v11 = RPTSizeAlongAxis(v10, v7, v9);
  v12 = [*(id *)(a1 + 32) swipeSpeedFactor];
  [v12 doubleValue];
  double v14 = v11 / 600.0 * v13;

  uint64_t v15 = _RPTScrollDirectionFromUIScrollDirection([*(id *)(a1 + 32) direction]);
  double v16 = v11 * 0.5 + 1.0;
  double v17 = RPTCGPointAdvanceInDirectionByAmount(v15, MidX, MidY, v16);
  double v19 = v18;
  uint64_t v20 = RPTOppositeDirectionFrom(v15);
  double v21 = RPTCGPointAdvanceInDirectionByAmount(v20, MidX, MidY, v16);
  double v23 = v22;
  if ([*(id *)(a1 + 32) swipeCount] < 1)
  {
    char v26 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    do
    {
      if (v24) {
        double v25 = 0.6666;
      }
      else {
        double v25 = 1.25;
      }
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:swipeDuration:", v29, v17, v19, v21, v23, v14 * v25);
      ++v24;
    }
    while (v24 < [*(id *)(a1 + 32) swipeCount]);
    char v26 = v24 & 1;
  }
  if ([*(id *)(a1 + 32) reverse] && objc_msgSend(*(id *)(a1 + 32), "swipeCount") >= 1)
  {
    uint64_t v27 = 0;
    do
    {
      if (v26) {
        double v28 = 0.6666;
      }
      else {
        double v28 = 1.5;
      }
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:swipeDuration:", v29, v21, v23, v17, v19, v14 * v28);
      v26 ^= 1u;
      ++v27;
    }
    while (v27 < [*(id *)(a1 + 32) swipeCount]);
  }
}

- (void)setTestName:(id)a3
{
}

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 testType:(unint64_t)a4 scrollView:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = RPTDefaultScrollDirection(v11);
  double v14 = RPTContentSizeInDirection(v11, v13);
  double x = RPTGetBoundsForView(v11);
  double y = v16;
  double width = v18;
  double height = v20;
  if (a4 == 2)
  {
    uint64_t v22 = 1;
LABEL_8:
    uint64_t v26 = _UIScrollDirectionFromRPTScrollDirection(v13);
    BOOL v27 = RPTAxisFromScrollDirection(v26);
    double v28 = RPTSizeAlongAxis(v27, width, height);
    uint64_t v25 = vcvtpd_s64_f64(v14 / v28);
    double v29 = floor(v28 - v14 / (double)(uint64_t)ceil(v14 / v28));
    uint64_t v30 = _UIScrollDirectionFromRPTScrollDirection(v13);
    BOOL v31 = RPTAxisFromScrollDirection(v30);
    if (v31)
    {
      if (!v31) {
        goto LABEL_14;
      }
      CGFloat v32 = 0.0;
      double v33 = x;
      double v34 = y;
      double v35 = width;
      double v36 = height;
      CGFloat v37 = v29;
    }
    else
    {
      CGFloat v37 = 0.0;
      double v33 = x;
      double v34 = y;
      double v35 = width;
      double v36 = height;
      CGFloat v32 = v29;
    }
    CGRect v44 = CGRectInset(*(CGRect *)&v33, v37, v32);
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
    goto LABEL_14;
  }
  uint64_t v22 = 0;
  if (a4 == 1) {
    goto LABEL_8;
  }
  if (a4)
  {
    uint64_t v25 = 1;
  }
  else
  {
    BOOL v23 = _RPTAxisFromScrollDirection(v13);
    uint64_t v22 = 0;
    double v24 = ceil(v14 / RPTSizeAlongAxis(v23, width, height));
    if (v24 < 1.0) {
      double v24 = 1.0;
    }
    uint64_t v25 = (uint64_t)v24;
  }
LABEL_14:
  v38 = -[RPTDirectionalSwipeTestParameters initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:](self, "initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:", v10, v25, v22, v13, v12, x, y, width, height);
  v39 = [v11 window];
  v40 = [v11 window];
  v41 = [v40 screen];
  v42 = +[RPTCoordinateSpaceConverter converterFromWindow:v39 toScreen:v41];
  [(RPTDirectionalSwipeTestParameters *)v38 setConversion:v42];

  return v38;
}

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  return [(RPTDirectionalSwipeTestParameters *)self initWithTestName:a3 testType:0 scrollView:a4 completionHandler:a5];
}

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollingBounds:(CGRect)a4 swipeCount:(int64_t)a5 reverse:(BOOL)a6 direction:(int64_t)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a3;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)RPTDirectionalSwipeTestParameters;
  double v19 = [(RPTDirectionalSwipeTestParameters *)&v23 init];
  double v20 = v19;
  if (v19)
  {
    [(RPTDirectionalSwipeTestParameters *)v19 setTestName:v17];
    -[RPTDirectionalSwipeTestParameters setScrollingBounds:](v20, "setScrollingBounds:", x, y, width, height);
    [(RPTDirectionalSwipeTestParameters *)v20 setSwipeCount:a5];
    [(RPTDirectionalSwipeTestParameters *)v20 setReverse:v10];
    [(RPTDirectionalSwipeTestParameters *)v20 setDirection:_UIScrollDirectionFromRPTScrollDirection(a7)];
    [(RPTDirectionalSwipeTestParameters *)v20 setCompletionHandler:v18];
    [(RPTDirectionalSwipeTestParameters *)v20 setSwipeSpeedFactor:&unk_1F0F4AF38];
    double v21 = +[RPTCoordinateSpaceConverter identityConverter];
    [(RPTDirectionalSwipeTestParameters *)v20 setConversion:v21];
  }
  return v20;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__RPTDirectionalSwipeTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 swipeDuration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v30 = a3;
  if (self->_shouldFlick
    && ([v30 interactionOptions],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 prefersPointer],
        v12,
        (v13 & 1) == 0))
  {
    uint64_t v22 = [(RPTDirectionalSwipeTestParameters *)self conversion];
    objc_msgSend(v22, "convertPoint:", v10, v9);
    double v24 = v23;
    double v26 = v25;
    BOOL v27 = [(RPTDirectionalSwipeTestParameters *)self conversion];
    objc_msgSend(v27, "convertPoint:", x, y);
    objc_msgSend(v30, "sendFlickWithStartPoint:endPoint:duration:", v24, v26, v28, v29, a6 * 0.7);

    [v30 advanceTime:a6 * 0.3];
  }
  else
  {
    double v14 = [(RPTDirectionalSwipeTestParameters *)self conversion];
    objc_msgSend(v14, "convertPoint:", v10, v9);
    double v16 = v15;
    double v18 = v17;
    double v19 = [(RPTDirectionalSwipeTestParameters *)self conversion];
    objc_msgSend(v19, "convertVector:", x - v10, y - v9);
    objc_msgSend(v30, "pointerOrFingerScrollAt:byDelta:duration:", v16, v18, v20, v21, a6);
  }
}

- (NSString)testName
{
  return self->_testName;
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

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (int64_t)swipeCount
{
  return self->_swipeCount;
}

- (void)setSwipeCount:(int64_t)a3
{
  self->_swipeCount = a3;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (NSNumber)swipeSpeedFactor
{
  return self->_swipeSpeedFactor;
}

- (void)setSwipeSpeedFactor:(id)a3
{
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
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
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong((id *)&self->_swipeSpeedFactor, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end