@interface BKDisplayAnnotationTextStyle
- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4;
@end

@implementation BKDisplayAnnotationTextStyle

- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4
{
  double y = CGPointZero.y;
  id v7 = a3;
  [v7 preferredFrameSize];
  [v7 setFrame:CGPointZero.x, y, v5, v6];
}

@end