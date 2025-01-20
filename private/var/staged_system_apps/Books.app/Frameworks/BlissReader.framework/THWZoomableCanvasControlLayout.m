@interface THWZoomableCanvasControlLayout
- (Class)repClassOverride;
@end

@implementation THWZoomableCanvasControlLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

@end