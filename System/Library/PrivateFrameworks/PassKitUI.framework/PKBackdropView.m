@interface PKBackdropView
+ (Class)layerClass;
@end

@implementation PKBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end