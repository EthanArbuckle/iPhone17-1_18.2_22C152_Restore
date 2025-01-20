@interface CRLDataDetectorStrokeLayer
+ (Class)crl_renderableClass;
@end

@implementation CRLDataDetectorStrokeLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end