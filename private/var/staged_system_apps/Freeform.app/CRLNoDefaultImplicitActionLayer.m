@interface CRLNoDefaultImplicitActionLayer
+ (Class)crl_renderableClass;
+ (id)defaultActionForKey:(id)a3;
@end

@implementation CRLNoDefaultImplicitActionLayer

+ (id)defaultActionForKey:(id)a3
{
  return kCFNull;
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end