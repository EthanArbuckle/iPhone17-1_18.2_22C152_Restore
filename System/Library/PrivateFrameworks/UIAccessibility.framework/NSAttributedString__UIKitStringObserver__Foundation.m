@interface NSAttributedString__UIKitStringObserver__Foundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)drawAtPoint:(CGPoint)a3;
@end

@implementation NSAttributedString__UIKitStringObserver__Foundation

+ (id)safeCategoryTargetClassName
{
  return @"NSAttributedString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)drawAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (AXCaptureStringDrawingText == 1)
  {
    v6 = (void *)AXCapturedString;
    v7 = [(NSAttributedString__UIKitStringObserver__Foundation *)self string];
    [v6 appendString:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)NSAttributedString__UIKitStringObserver__Foundation;
  -[NSAttributedString__UIKitStringObserver__Foundation drawAtPoint:](&v8, sel_drawAtPoint_, x, y);
}

@end