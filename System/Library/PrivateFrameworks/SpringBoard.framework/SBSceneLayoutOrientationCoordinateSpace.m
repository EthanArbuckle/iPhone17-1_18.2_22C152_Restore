@interface SBSceneLayoutOrientationCoordinateSpace
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (SBSceneLayoutOrientationCoordinateSpace)initWithInterfaceOrientation:(int64_t)a3 withReferenceCoordinateSpace:(id)a4 inOrientation:(int64_t)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
@end

@implementation SBSceneLayoutOrientationCoordinateSpace

- (SBSceneLayoutOrientationCoordinateSpace)initWithInterfaceOrientation:(int64_t)a3 withReferenceCoordinateSpace:(id)a4 inOrientation:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SBSceneLayoutOrientationCoordinateSpace;
  result = [(SBSceneLayoutCoordinateSpace *)&v8 initWithParentCoordinateSpace:a4];
  if (result)
  {
    result->_orientation = a3;
    result->_referenceOrientation = a5;
  }
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  id v5 = a4;
  [(UICoordinateSpace *)self->super._parentCoordinateSpace bounds];
  _UIWindowConvertRectFromOrientationToOrientation();
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  if (v5)
  {
    objc_msgSend(v5, "convertRect:fromCoordinateSpace:", self->super._parentCoordinateSpace, v6, v7, v8, v9);
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
    double v13 = v17;
  }

  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  if (a4) {
    objc_msgSend(a4, "convertRect:toCoordinateSpace:", self->super._parentCoordinateSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  [(UICoordinateSpace *)self->super._parentCoordinateSpace bounds];
  _UIWindowConvertRectFromOrientationToOrientation();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)bounds
{
  [(UICoordinateSpace *)self->super._parentCoordinateSpace bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat Width = v6;
  if ((unint64_t)(self->_orientation - 3) <= 1)
  {
    CGFloat Height = CGRectGetHeight(*(CGRect *)&v3);
    v16.origin.x = v7;
    v16.origin.y = v8;
    v16.size.width = v9;
    v16.size.height = Width;
    CGFloat Width = CGRectGetWidth(v16);
    CGFloat v8 = 0.0;
    CGFloat v9 = Height;
    CGFloat v7 = 0.0;
  }
  double v12 = v7;
  double v13 = v8;
  double v14 = v9;
  double v15 = Width;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBSceneLayoutOrientationCoordinateSpace;
  id v4 = a3;
  double v5 = [(SBSceneLayoutCoordinateSpace *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SBSceneLayoutOrientationCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __81__SBSceneLayoutOrientationCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  CGFloat v3 = NSStringFromCGRect(v8);
  id v4 = (id)[v2 appendObject:v3 withName:@"bounds"];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 24);
  switch(v5)
  {
    case 1:
      id v6 = @"UIInterfaceOrientationPortrait";
      break;
    case 3:
      id v6 = @"UIInterfaceOrientationLandscapeRight";
      break;
    case 4:
      id v6 = @"UIInterfaceOrientationLandscapeLeft";
      break;
    case 2:
      id v6 = @"UIInterfaceOrientationPortraitUpsideDown";
      break;
    default:
      id v6 = 0;
      break;
  }
  return (id)[*(id *)(a1 + 32) appendObject:v6 withName:@"interfaceOrientation"];
}

@end