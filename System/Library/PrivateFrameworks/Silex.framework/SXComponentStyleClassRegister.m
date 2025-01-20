@interface SXComponentStyleClassRegister
+ (void)registerClasses;
@end

@implementation SXComponentStyleClassRegister

+ (void)registerClasses
{
  uint64_t v2 = objc_opt_class();
  +[SXClassFactory registerClass:v2 type:@"mask" baseClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();
  +[SXClassFactory registerClass:v3 type:@"corners" baseClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  +[SXClassFactory registerClass:v4 type:@"fill" baseClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  +[SXClassFactory registerClass:v5 type:@"gradient" baseClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  +[SXClassFactory registerClass:v6 type:@"image" baseClass:objc_opt_class()];
  uint64_t v7 = objc_opt_class();
  +[SXClassFactory registerClass:v7 type:@"linear_gradient" baseClass:objc_opt_class()];
  uint64_t v8 = objc_opt_class();
  +[SXClassFactory registerClass:v8 type:@"repeatable_image" baseClass:objc_opt_class()];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  +[SXClassFactory registerClass:v9 type:@"video" baseClass:v10];
}

@end