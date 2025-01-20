@interface SXAdditionClassRegister
+ (void)registerClasses;
@end

@implementation SXAdditionClassRegister

+ (void)registerClasses
{
  uint64_t v2 = objc_opt_class();
  +[SXClassFactory registerClass:v2 type:@"addition" baseClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();
  +[SXClassFactory registerClass:v3 type:@"calendar_event" baseClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  +[SXClassFactory registerClass:v4 type:@"email" baseClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  +[SXClassFactory registerClass:v5 type:@"link" baseClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  +[SXClassFactory registerClass:v6 type:@"phone_number" baseClass:objc_opt_class()];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  +[SXClassFactory registerClass:v7 type:@"product" baseClass:v8];
}

@end