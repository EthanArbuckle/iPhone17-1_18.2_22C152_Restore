@interface SXJSONActionClassRegister
+ (void)registerClasses;
@end

@implementation SXJSONActionClassRegister

+ (void)registerClasses
{
  uint64_t v2 = objc_opt_class();
  +[SXClassFactory registerClass:v2 type:@"close" baseClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();
  +[SXClassFactory registerClass:v3 type:@"link" baseClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  +[SXClassFactory registerClass:v4 type:@"subscribe" baseClass:v5];
}

@end