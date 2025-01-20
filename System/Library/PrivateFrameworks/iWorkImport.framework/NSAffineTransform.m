@interface NSAffineTransform
- (void)gqu_transformRect:(CGRect)a3 upperLeft:(CGPoint *)a4 lowerLeft:(CGPoint *)a5 lowerRight:(CGPoint *)a6 upperRight:(CGPoint *)a7;
@end

@implementation NSAffineTransform

- (void)gqu_transformRect:(CGRect)a3 upperLeft:(CGPoint *)a4 lowerLeft:(CGPoint *)a5 lowerRight:(CGPoint *)a6 upperRight:(CGPoint *)a7
{
  float x = a3.origin.x;
  float y = a3.origin.y;
  float v14 = a3.origin.x + a3.size.width;
  float v15 = a3.origin.y + a3.size.height;
  a4->float x = x;
  a4->float y = y;
  CGFloat v16 = v15;
  a5->float x = x;
  a5->float y = v16;
  CGFloat v17 = v14;
  a6->float x = v17;
  a6->float y = v16;
  a7->float x = v17;
  a7->float y = y;
  -[NSAffineTransform transformPoint:](self, "transformPoint:", a4->x, a4->y);
  a4->float x = v18;
  a4->float y = v19;
  -[NSAffineTransform transformPoint:](self, "transformPoint:", a5->x, a5->y);
  a5->float x = v20;
  a5->float y = v21;
  -[NSAffineTransform transformPoint:](self, "transformPoint:", a6->x, a6->y);
  a6->float x = v22;
  a6->float y = v23;
  -[NSAffineTransform transformPoint:](self, "transformPoint:", a7->x, a7->y);
  a7->float x = v24;
  a7->float y = v25;
}

@end