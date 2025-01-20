@interface _PXBackdropView
+ (Class)layerClass;
@end

@implementation _PXBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end