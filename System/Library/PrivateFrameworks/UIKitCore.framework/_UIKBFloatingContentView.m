@interface _UIKBFloatingContentView
+ (Class)layerClass;
@end

@implementation _UIKBFloatingContentView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end