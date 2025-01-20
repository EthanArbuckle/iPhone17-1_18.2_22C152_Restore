@interface ISAVPlayerUIView
+ (Class)layerClass;
@end

@implementation ISAVPlayerUIView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end