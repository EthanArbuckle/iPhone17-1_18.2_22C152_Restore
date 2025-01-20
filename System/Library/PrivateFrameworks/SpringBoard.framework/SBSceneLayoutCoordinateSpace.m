@interface SBSceneLayoutCoordinateSpace
+ (id)coordinateSpaceForFrame:(CGRect)a3 withinCoordinateSpace:(id)a4;
+ (id)coordinateSpaceForInterfaceOrientation:(int64_t)a3 withReferenceCoordinateSpace:(id)a4 inOrientation:(int64_t)a5;
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (NSString)description;
- (SBSceneLayoutCoordinateSpace)initWithParentCoordinateSpace:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBSceneLayoutCoordinateSpace

- (void).cxx_destruct
{
}

+ (id)coordinateSpaceForInterfaceOrientation:(int64_t)a3 withReferenceCoordinateSpace:(id)a4 inOrientation:(int64_t)a5
{
  id v7 = a4;
  v8 = [[SBSceneLayoutOrientationCoordinateSpace alloc] initWithInterfaceOrientation:a3 withReferenceCoordinateSpace:v7 inOrientation:a5];

  return v8;
}

- (SBSceneLayoutCoordinateSpace)initWithParentCoordinateSpace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneLayoutCoordinateSpace;
  v6 = [(SBSceneLayoutCoordinateSpace *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parentCoordinateSpace, a3);
  }

  return v7;
}

+ (id)coordinateSpaceForFrame:(CGRect)a3 withinCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_super v9 = -[SBSceneLayoutFrameCoordinateSpace initWithFrame:withinCoordinateSpace:]([SBSceneLayoutFrameCoordinateSpace alloc], "initWithFrame:withinCoordinateSpace:", v8, x, y, width, height);

  return v9;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  -[SBSceneLayoutCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  -[SBSceneLayoutCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v6 handleFailureInMethod:a2 object:self file:@"SBSceneLayoutCoordinateSpace.m" lineNumber:61 description:@"don't use the base implementation"];

  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v6 handleFailureInMethod:a2 object:self file:@"SBSceneLayoutCoordinateSpace.m" lineNumber:66 description:@"don't use the base implementation"];

  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)bounds
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSceneLayoutCoordinateSpace.m" lineNumber:71 description:@"don't use the base implementation"];

  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (NSString)description
{
  return (NSString *)[(SBSceneLayoutCoordinateSpace *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSceneLayoutCoordinateSpace *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSceneLayoutCoordinateSpace *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

@end