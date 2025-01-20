@interface NSNull
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
@end

@implementation NSNull

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGRect PathBoundingBox = CGPathGetPathBoundingBox(a3);

  sub_1002F241C(a4, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
}

@end