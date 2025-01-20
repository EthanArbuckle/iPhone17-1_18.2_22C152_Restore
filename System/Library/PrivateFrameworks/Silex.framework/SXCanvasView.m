@interface SXCanvasView
+ (Class)layerClass;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SXCanvasView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end