@interface NSString__UIKitStringObserver__Foundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)drawAtPoint:(CGPoint)a3 withAttributes:(id)a4;
@end

@implementation NSString__UIKitStringObserver__Foundation

+ (id)safeCategoryTargetClassName
{
  return @"NSString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)drawAtPoint:(CGPoint)a3 withAttributes:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (AXCaptureStringDrawingText == 1) {
    [(id)AXCapturedString appendString:self];
  }
  v8.receiver = self;
  v8.super_class = (Class)NSString__UIKitStringObserver__Foundation;
  -[NSString__UIKitStringObserver__Foundation drawAtPoint:withAttributes:](&v8, sel_drawAtPoint_withAttributes_, v7, x, y);
}

@end