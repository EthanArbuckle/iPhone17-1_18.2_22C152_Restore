@interface _UIScreenRectangularBoundingPathUtilities
+ (id)boundingPathForWindow:(id)a3 inScreenCoordinateSpace:(id)a4;
- (id)boundingPathForWindow:(id)a3;
@end

@implementation _UIScreenRectangularBoundingPathUtilities

- (id)boundingPathForWindow:(id)a3
{
  id v5 = a3;
  v6 = [(_UIScreenBoundingPathUtilities *)self _screen];
  v7 = [v5 screen];

  if (v7 != v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIScreenRectangularBoundingPathUtilities.m" lineNumber:21 description:@"Cannot provide the bounding path for a window associated with a different screen."];
  }
  v8 = [v6 coordinateSpace];
  v9 = +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:v5 inScreenCoordinateSpace:v8];

  return v9;
}

+ (id)boundingPathForWindow:(id)a3 inScreenCoordinateSpace:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v5 bounds];
  objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5);
  v36.origin.double x = v15;
  v36.origin.double y = v16;
  v36.size.double width = v17;
  v36.size.double height = v18;
  v34.origin.double x = v8;
  v34.origin.double y = v10;
  v34.size.double width = v12;
  v34.size.double height = v14;
  CGRect v35 = CGRectIntersection(v34, v36);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  if (CGRectIsNull(v35))
  {
    double v23 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5, x, y, width, height);
    double v23 = v27;
    double v24 = v28;
    double v25 = v29;
    double v26 = v30;
  }
  v31 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:]([_UIRectangularBoundingPath alloc], "initWithCoordinateSpace:boundingRect:", v5, v23, v24, v25, v26);

  return v31;
}

@end