@interface PFXStop
- (void)start;
@end

@implementation PFXStop

- (void)start
{
  id v3 = [(PFXSvgElement *)self valueForAttributeName:"offset"];
  unsigned int v4 = [v3 hasSuffix:@"%"];
  [v3 doubleValue];
  if (v4) {
    double v6 = v5 / 100.0;
  }
  else {
    double v6 = v5;
  }
  id v7 = [objc_alloc((Class)TSDGradientStop) initWithColor:[PFXStyleUtilities htmlStringToColor:[self valueForAttributeName:@"stop-color"]] fraction:v6];
  [(PFXSvgElement *)self->super.mParent addStop:v7];
}

@end