@interface SXComponentBehaviorClassRegister
+ (void)registerClasses;
@end

@implementation SXComponentBehaviorClassRegister

+ (void)registerClasses
{
  uint64_t v2 = objc_opt_class();
  +[SXClassFactory registerClass:v2 type:&stru_26D5311C0 baseClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();
  +[SXClassFactory registerClass:v3 type:@"background_parallax" baseClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  +[SXClassFactory registerClass:v4 type:@"motion" baseClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  +[SXClassFactory registerClass:v5 type:@"parallax" baseClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  +[SXClassFactory registerClass:v6 type:@"springy" baseClass:v7];
}

@end