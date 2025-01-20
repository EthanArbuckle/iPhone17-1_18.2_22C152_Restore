@interface THWScrollableCanvasControlLayout
- (Class)repClassOverride;
@end

@implementation THWScrollableCanvasControlLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

@end