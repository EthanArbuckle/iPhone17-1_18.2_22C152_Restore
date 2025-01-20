@interface TVPPlayerLayerView
+ (Class)layerClass;
@end

@implementation TVPPlayerLayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end