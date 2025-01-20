@interface RPTPagingScrollTestParameters
- (BOOL)useFlicks;
- (CGRect)scrollingBounds;
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTPagingScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 iterationDuration:(double)a8 useFlicks:(BOOL)a9 completionHandler:(id)a10;
- (double)amplitude;
- (double)iterationDuration;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)direction;
- (int64_t)realDirection;
- (pair<CGPoint,)initialAndFinalPositions;
- (unint64_t)iterations;
- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6;
- (void)setAmplitude:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setIterationDuration:(double)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setTestName:(id)a3;
- (void)setUseFlicks:(BOOL)a3;
@end

@implementation RPTPagingScrollTestParameters

- (RPTPagingScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 iterationDuration:(double)a8 useFlicks:(BOOL)a9 completionHandler:(id)a10
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v21 = a3;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)RPTPagingScrollTestParameters;
  v23 = [(RPTPagingScrollTestParameters *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v21 copy];
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_iterations = a4;
    v23->_scrollingBounds.origin.CGFloat x = x;
    v23->_scrollingBounds.origin.CGFloat y = y;
    v23->_scrollingBounds.size.CGFloat width = width;
    v23->_scrollingBounds.size.CGFloat height = height;
    v23->_amplitude = a6;
    v23->_useFlicks = a9;
    v23->_direction = a7;
    v23->_iterationDuration = a8;
    uint64_t v26 = MEMORY[0x1BA9B23F0](v22);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = (id)v26;

    uint64_t v28 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v28;

    v30 = [MEMORY[0x1E4F42738] sharedApplication];
    v31 = [v30 windows];
    v32 = [v31 firstObject];

    uint64_t v33 = +[RPTCoordinateSpaceConverter converterFromWindow:v32];
    v34 = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v33;

    if (a7 == 6 || a7 == 5)
    {
      v35 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v36 = [v35 userInterfaceLayoutDirection];
      uint64_t v37 = 1;
      if (v36) {
        uint64_t v37 = 2;
      }
      v23->_realDirection = v37;
    }
    else
    {
      v23->_realDirection = a7;
    }
  }
  return v23;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__RPTPagingScrollTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF28;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

void __46__RPTPagingScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [*(id *)(a1 + 32) initialAndFinalPositions];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  for (unint64_t i = 1; i <= [*(id *)(a1 + 32) iterations]; ++i)
  {
    v12 = *(void **)(a1 + 32);
    [v12 iterationDuration];
    objc_msgSend(v12, "scrollWithComposer:fromPoint:toPoint:duration:", v14, v4, v6, v8, v10, v13);
  }
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v30 = a3;
  if ([(RPTPagingScrollTestParameters *)self useFlicks]
    && ([v30 interactionOptions],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 prefersPointer],
        v12,
        (v13 & 1) == 0))
  {
    id v22 = [(RPTPagingScrollTestParameters *)self conversion];
    objc_msgSend(v22, "convertPoint:", v10, v9);
    double v24 = v23;
    double v26 = v25;
    v27 = [(RPTPagingScrollTestParameters *)self conversion];
    objc_msgSend(v27, "convertPoint:", x, y);
    objc_msgSend(v30, "sendFlickWithStartPoint:endPoint:duration:", v24, v26, v28, v29, 0.5);

    [v30 advanceTime:a6 + -0.5];
  }
  else
  {
    id v14 = [(RPTPagingScrollTestParameters *)self conversion];
    objc_msgSend(v14, "convertPoint:", v10, v9);
    double v16 = v15;
    double v18 = v17;
    v19 = [(RPTPagingScrollTestParameters *)self conversion];
    objc_msgSend(v19, "convertVector:", x - v10, y - v9);
    objc_msgSend(v30, "pointerOrFingerScrollAt:byDelta:duration:", v16, v18, v20, v21, a6);

    [v30 advanceTime:0.2];
  }
}

- (pair<CGPoint,)initialAndFinalPositions
{
  [(RPTPagingScrollTestParameters *)self scrollingBounds];
  double Midpoint = RPTCGRectGetMidpoint(v3, v4, v5, v6);
  double v9 = v8;
  switch([(RPTPagingScrollTestParameters *)self realDirection])
  {
    case 2:
      [(RPTPagingScrollTestParameters *)self scrollingBounds];
      double Midpoint = CGRectGetMinX(v19) + 1.5;
      [(RPTPagingScrollTestParameters *)self amplitude];
      double v11 = Midpoint + v12;
      goto LABEL_4;
    case 3:
      [(RPTPagingScrollTestParameters *)self scrollingBounds];
      double v9 = CGRectGetMaxY(v20) + -1.5;
      [(RPTPagingScrollTestParameters *)self amplitude];
      double v13 = v9 - v14;
      goto LABEL_7;
    case 4:
      [(RPTPagingScrollTestParameters *)self scrollingBounds];
      double v9 = CGRectGetMinY(v21) + 1.5;
      [(RPTPagingScrollTestParameters *)self amplitude];
      double v13 = v9 + v15;
LABEL_7:
      double v11 = Midpoint;
      break;
    default:
      [(RPTPagingScrollTestParameters *)self scrollingBounds];
      double Midpoint = CGRectGetMaxX(v18) + -1.5;
      [(RPTPagingScrollTestParameters *)self amplitude];
      double v11 = Midpoint - v10;
LABEL_4:
      double v13 = v9;
      break;
  }
  double v16 = Midpoint;
  double v17 = v9;
  result.var1.double y = v13;
  result.var1.double x = v11;
  result.var0.double y = v17;
  result.var0.double x = v16;
  return result;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
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

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
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

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (BOOL)useFlicks
{
  return self->_useFlicks;
}

- (void)setUseFlicks:(BOOL)a3
{
  self->_useFlicks = a3;
}

- (int64_t)realDirection
{
  return self->_realDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end