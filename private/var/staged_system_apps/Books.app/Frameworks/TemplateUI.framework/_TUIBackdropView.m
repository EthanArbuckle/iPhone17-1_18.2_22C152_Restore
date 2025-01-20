@interface _TUIBackdropView
+ (Class)layerClass;
@end

@implementation _TUIBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end