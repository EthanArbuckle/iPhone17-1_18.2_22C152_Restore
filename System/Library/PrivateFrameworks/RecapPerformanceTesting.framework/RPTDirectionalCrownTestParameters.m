@interface RPTDirectionalCrownTestParameters
- (BOOL)adjustRotationDurationForRevolution;
- (CGSize)scrollingSize;
- (NSString)testName;
- (RPTDirectionalCrownTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5;
- (RPTDirectionalCrownTestParameters)initWithTestName:(id)a3 scrollingSize:(CGSize)a4 screenSpaceMultiplier:(double)a5 rotationDuration:(double)a6 direction:(int64_t)a7 completionHandler:(id)a8;
- (double)rotationDuration;
- (double)screenSpaceMultiplier;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)direction;
- (void)setAdjustRotationDurationForRevolution:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setRotationDuration:(double)a3;
- (void)setScreenSpaceMultiplier:(double)a3;
- (void)setScrollingSize:(CGSize)a3;
- (void)setTestName:(id)a3;
@end

@implementation RPTDirectionalCrownTestParameters

- (RPTDirectionalCrownTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = RPTDefaultScrollDirection(v9);
  [v9 contentSize];
  double v13 = v12;
  double v15 = v14;

  v16 = -[RPTDirectionalCrownTestParameters initWithTestName:scrollingSize:screenSpaceMultiplier:rotationDuration:direction:completionHandler:](self, "initWithTestName:scrollingSize:screenSpaceMultiplier:rotationDuration:direction:completionHandler:", v10, v11, v8, v13, v15, 1.0, 1.0);
  v17 = v16;

  return v17;
}

- (RPTDirectionalCrownTestParameters)initWithTestName:(id)a3 scrollingSize:(CGSize)a4 screenSpaceMultiplier:(double)a5 rotationDuration:(double)a6 direction:(int64_t)a7 completionHandler:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)RPTDirectionalCrownTestParameters;
  v17 = [(RPTDirectionalCrownTestParameters *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(RPTDirectionalCrownTestParameters *)v17 setTestName:v15];
    -[RPTDirectionalCrownTestParameters setScrollingSize:](v18, "setScrollingSize:", width, height);
    [(RPTDirectionalCrownTestParameters *)v18 setScreenSpaceMultiplier:a5];
    [(RPTDirectionalCrownTestParameters *)v18 setRotationDuration:a6];
    [(RPTDirectionalCrownTestParameters *)v18 setDirection:a7];
    [(RPTDirectionalCrownTestParameters *)v18 setCompletionHandler:v16];
    [(RPTDirectionalCrownTestParameters *)v18 setAdjustRotationDurationForRevolution:1];
  }

  return v18;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__RPTDirectionalCrownTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

uint64_t __50__RPTDirectionalCrownTestParameters_composerBlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) direction];
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (CGSize)scrollingSize
{
  double width = self->_scrollingSize.width;
  double height = self->_scrollingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScrollingSize:(CGSize)a3
{
  self->_scrollingSize = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)screenSpaceMultiplier
{
  return self->_screenSpaceMultiplier;
}

- (void)setScreenSpaceMultiplier:(double)a3
{
  self->_screenSpaceMultiplier = a3;
}

- (double)rotationDuration
{
  return self->_rotationDuration;
}

- (void)setRotationDuration:(double)a3
{
  self->_rotationDuration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)adjustRotationDurationForRevolution
{
  return self->_adjustRotationDurationForRevolution;
}

- (void)setAdjustRotationDurationForRevolution:(BOOL)a3
{
  self->_adjustRotationDurationForRevolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end