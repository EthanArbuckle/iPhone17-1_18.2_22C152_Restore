@interface SBSceneLayoutFrameCoordinateSpace
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (SBSceneLayoutFrameCoordinateSpace)initWithFrame:(CGRect)a3 withinCoordinateSpace:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
@end

@implementation SBSceneLayoutFrameCoordinateSpace

- (SBSceneLayoutFrameCoordinateSpace)initWithFrame:(CGRect)a3 withinCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBSceneLayoutFrameCoordinateSpace;
  v10 = [(SBSceneLayoutCoordinateSpace *)&v17 initWithParentCoordinateSpace:v9];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
    contentLayer = v10->_contentLayer;
    v10->_contentLayer = (CALayer *)v11;

    uint64_t v13 = [MEMORY[0x1E4F39BE8] layer];
    containerLayer = v10->_containerLayer;
    v10->_containerLayer = (CALayer *)v13;

    -[CALayer setFrame:](v10->_contentLayer, "setFrame:", x, y, width, height);
    v15 = v10->_containerLayer;
    [v9 bounds];
    -[CALayer setFrame:](v15, "setFrame:");
    [(CALayer *)v10->_containerLayer addSublayer:v10->_contentLayer];
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  if (a4) {
    objc_msgSend(a4, "convertRect:toCoordinateSpace:", self->super._parentCoordinateSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  containerLayer = self->_containerLayer;
  contentLayer = self->_contentLayer;
  -[CALayer convertRect:toLayer:](containerLayer, "convertRect:toLayer:", contentLayer, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)bounds
{
  [(CALayer *)self->_contentLayer bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  -[CALayer convertRect:fromLayer:](self->_containerLayer, "convertRect:fromLayer:", self->_contentLayer, x, y, width, height);
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  if (v9)
  {
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", self->super._parentCoordinateSpace, v10, v11, v12, v13);
    double v14 = v18;
    double v15 = v19;
    double v16 = v20;
    double v17 = v21;
  }

  double v22 = v14;
  double v23 = v15;
  double v24 = v16;
  double v25 = v17;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBSceneLayoutFrameCoordinateSpace;
  id v4 = a3;
  double v5 = [(SBSceneLayoutCoordinateSpace *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBSceneLayoutFrameCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __75__SBSceneLayoutFrameCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) frame];
  double v3 = NSStringFromCGRect(v9);
  id v4 = (id)[v2 appendObject:v3 withName:@"contentFrame"];

  double v5 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 16) bounds];
  NSStringFromCGRect(v10);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 appendObject:v7 withName:@"containerBounds"];
}

@end