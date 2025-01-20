@interface WFBackdropView
+ (Class)layerClass;
@end

@implementation WFBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end