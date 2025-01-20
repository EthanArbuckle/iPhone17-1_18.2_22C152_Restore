@interface RPTFluidSplitViewTestParameters
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTFluidSplitViewTestParameters)initWithTestName:(id)a3 splitViewController:(id)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (id)composerBlock;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation RPTFluidSplitViewTestParameters

- (RPTFluidSplitViewTestParameters)initWithTestName:(id)a3 splitViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RPTFluidSplitViewTestParameters;
  v10 = [(RPTFluidSplitViewTestParameters *)&v26 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_splitViewController, a4);
    uint64_t v12 = [v8 viewControllerForColumn:0];
    primaryController = v11->_primaryController;
    v11->_primaryController = (UIViewController *)v12;

    uint64_t v14 = [v8 viewControllerForColumn:1];
    supplementalController = v11->_supplementalController;
    v11->_supplementalController = (UIViewController *)v14;

    v16 = [v8 view];
    v17 = [v16 window];
    v18 = [v8 view];
    v19 = [v18 window];
    v20 = [v19 screen];
    uint64_t v21 = +[RPTCoordinateSpaceConverter converterFromWindow:v17 toScreen:v20];
    conversion = v11->_conversion;
    v11->_conversion = (RPTCoordinateSpaceConverter *)v21;

    uint64_t v23 = MEMORY[0x1BA9B23F0](v9);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v23;
  }
  return v11;
}

- (id)composerBlock
{
  v3 = [(UIViewController *)self->_supplementalController view];
  double v4 = RPTGetBoundsForView(v3);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v11 = [(RPTFluidSplitViewTestParameters *)self conversion];
  objc_msgSend(v11, "convertPoint:", RPTCGRectGetMidpointAlongSide(0, v4, v6, v8, v10));
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  v16 = [(RPTFluidSplitViewTestParameters *)self conversion];
  objc_msgSend(v16, "convertPoint:", RPTCGRectGetMidpointAlongSide(2, v4, v6, v8, v10));
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__RPTFluidSplitViewTestParameters_composerBlock__block_invoke;
  v23[3] = &__block_descriptor_64_e23_v16__0___RPTComposer__8l;
  v23[4] = v13;
  v23[5] = v15;
  v23[6] = v18;
  v23[7] = v20;
  uint64_t v21 = (void *)MEMORY[0x1BA9B23F0](v23);
  return v21;
}

void __48__RPTFluidSplitViewTestParameters_composerBlock__block_invoke(double *a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(v5, "pointerOrFingerTapDown:", a1[4], a1[5]);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[6], a1[7], 1.0);
  [v5 advanceTime:0.2];
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[4], a1[5], 1.0);
  [v5 advanceTime:0.2];
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[6], a1[7], 0.6);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[4], a1[5], 0.6);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[6], a1[7], 0.3);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[4], a1[5], 0.3);
  objc_msgSend(v5, "pointerOrFingerTapUp:", a1[4], a1[5]);
  v3 = [v5 interactionOptions];
  char v4 = [v3 prefersPointer];

  if ((v4 & 1) == 0)
  {
    [v5 advanceTime:0.5];
    objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.6);
    [v5 advanceTime:2.0];
    objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[6], a1[7], a1[4], a1[5], 0.6);
  }
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong((id *)&self->_primaryController, 0);
  objc_storeStrong((id *)&self->_supplementalController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
}

@end