@interface _UIScreenFixedCoordinateSpace
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (UIScreen)_screen;
- (void)_setScreen:(id)a3;
@end

@implementation _UIScreenFixedCoordinateSpace

- (void)_setScreen:(id)a3
{
  self->_screen = (UIScreen *)a3;
}

- (CGRect)bounds
{
  v2 = [(_UIScreenFixedCoordinateSpace *)self _screen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIScreen)_screen
{
  return self->_screen;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  -[_UIScreenFixedCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  -[_UIScreenFixedCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    id v9 = a4;
    double v10 = [(_UIScreenFixedCoordinateSpace *)self _screen];
    [v10 _referenceBounds];
    double v12 = v11;
    double v14 = v13;
    v15 = [(_UIScreenFixedCoordinateSpace *)self _screen];
    double v16 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace([v15 _interfaceOrientation], x, y, width, height, v12, v14);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    v23 = [(_UIScreenFixedCoordinateSpace *)self _screen];
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v23, v16, v18, v20, v22);
    double x = v24;
    double y = v25;
    double width = v26;
    double height = v27;
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    id v9 = a4;
    double v10 = [(_UIScreenFixedCoordinateSpace *)self _screen];
    objc_msgSend(v9, "convertRect:toCoordinateSpace:", v10, x, y, width, height);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    double v19 = [(_UIScreenFixedCoordinateSpace *)self _screen];
    [v19 _referenceBounds];
    double v21 = v20;
    double v23 = v22;
    double v24 = [(_UIScreenFixedCoordinateSpace *)self _screen];
    double x = _UIWindowConvertRectFromSceneSpaceToSceneReferenceSpace([v24 _interfaceOrientation], v12, v14, v16, v18, v21, v23);
    double y = v25;
    double width = v26;
    double height = v27;
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

@end