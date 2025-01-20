@interface RPTDragTestParameters
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTDragTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5;
- (UIWindow)window;
- (id)completionHandler;
- (id)composerBlock;
- (void)_makeDraggableVectors:(CGVector *)a3 forWindow:(id)a4;
- (void)prepareWithComposer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setTestName:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPTDragTestParameters

- (void)prepareWithComposer:(id)a3
{
  v4 = [(RPTDragTestParameters *)self window];
  objc_msgSend(v4, "_rpt_safeVisibleFrameOfScreen");
  double v6 = v5;
  double v8 = v7;

  id v9 = [(RPTDragTestParameters *)self window];
  objc_msgSend(v9, "_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:", v6 * 0.5, v8 * 0.5);
}

- (RPTDragTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RPTDragTestParameters;
  v12 = [(RPTDragTestParameters *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_testName, a3);
    objc_storeStrong((id *)&v13->_window, a4);
    uint64_t v14 = MEMORY[0x1BA9B23F0](v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v14;

    uint64_t v16 = +[RPTCoordinateSpaceConverter converterFromWindow:v10];
    conversion = v13->_conversion;
    v13->_conversion = (RPTCoordinateSpaceConverter *)v16;
  }
  return v13;
}

- (void)_makeDraggableVectors:(CGVector *)a3 forWindow:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "_rpt_safeVisibleFrameOfScreen");
  CGFloat v7 = v6;
  CGFloat v27 = v8;
  CGFloat v28 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 nsWindowFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double Width = CGRectGetWidth(v29);
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  CGFloat v23 = Width - CGRectGetWidth(v30);
  v31.origin.y = v27;
  v31.origin.x = v28;
  v31.size.width = v11;
  v31.size.height = v13;
  double Height = CGRectGetHeight(v31);
  v32.origin.x = v15;
  v32.origin.y = v17;
  v32.size.width = v19;
  v32.size.height = v21;
  CGFloat v25 = CGRectGetHeight(v32);
  a3->dx = v23;
  CGFloat v26 = Height - v25;
  a3->dy = 0.0;
  a3[1].dx = 0.0;
  a3[1].dy = v26;
  a3[2].dx = -v23;
  a3[2].dy = 0.0;
  a3[3].dx = 0.0;
  a3[3].dy = -v26;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__RPTDragTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

void __38__RPTDragTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  v11[8] = *(double *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v4 window];
  [v4 _makeDraggableVectors:v11 forWindow:v5];

  double v6 = [RPTDragInteraction alloc];
  CGFloat v7 = [*(id *)(a1 + 32) window];
  id v8 = -[RPTDragInteraction initByDraggingWindow:byDelta:](v6, "initByDraggingWindow:byDelta:", v7, v11[0], v11[1]);

  [v8 invokeWithComposer:v3 duration:1.25];
  for (uint64_t i = 0; i != 6; i += 2)
  {
    double v10 = v8;
    objc_msgSend(v8, "_andThenDragBy:", v11[i + 2], v11[i + 3]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    [v8 invokeWithComposer:v3 duration:1.25];
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

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
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
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end