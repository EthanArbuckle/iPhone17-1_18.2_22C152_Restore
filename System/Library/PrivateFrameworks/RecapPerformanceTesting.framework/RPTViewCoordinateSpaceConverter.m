@interface RPTViewCoordinateSpaceConverter
- (CGPoint)convertPoint:(CGPoint)a3;
- (CGRect)convertRect:(CGRect)a3;
- (CGSize)convertSize:(CGSize)a3;
- (CGVector)convertVector:(CGVector)a3;
- (UIView)view;
- (id)initFromView:(id)a3;
- (void)setView:(id)a3;
@end

@implementation RPTViewCoordinateSpaceConverter

- (id)initFromView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPTViewCoordinateSpaceConverter;
  v6 = [(RPTViewCoordinateSpaceConverter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

- (CGPoint)convertPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(RPTViewCoordinateSpaceConverter *)self view];
  objc_msgSend(v5, "convertPoint:toView:", 0, x, y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGSize)convertSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(RPTViewCoordinateSpaceConverter *)self view];
  objc_msgSend(v5, "convertRect:toView:", 0, 0.0, 0.0, width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGRect)convertRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(RPTViewCoordinateSpaceConverter *)self view];
  objc_msgSend(v7, "convertRect:toView:", 0, x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGVector)convertVector:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  -[RPTViewCoordinateSpaceConverter convertPoint:](self, "convertPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v7 = v6;
  double v9 = v8;
  -[RPTViewCoordinateSpaceConverter convertPoint:](self, "convertPoint:", dx, dy);
  double v11 = v10 - v7;
  double v13 = v12 - v9;
  result.ddouble y = v13;
  result.ddouble x = v11;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end