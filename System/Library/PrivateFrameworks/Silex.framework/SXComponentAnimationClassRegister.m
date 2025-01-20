@interface SXComponentAnimationClassRegister
+ (void)registerClasses;
@end

@implementation SXComponentAnimationClassRegister

+ (void)registerClasses
{
  uint64_t v2 = objc_opt_class();
  +[SXClassFactory registerClass:v2 type:@"animation" baseClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();
  +[SXClassFactory registerClass:v3 type:@"appear" baseClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  +[SXClassFactory registerClass:v4 type:@"fade_in" baseClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  +[SXClassFactory registerClass:v5 type:@"move_in" baseClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  +[SXClassFactory registerClass:v6 type:@"scale" baseClass:objc_opt_class()];
  uint64_t v7 = objc_opt_class();
  +[SXClassFactory registerClass:v7 type:@"scale_fade" baseClass:objc_opt_class()];
  uint64_t v8 = objc_opt_class();
  +[SXClassFactory registerClass:v8 type:@"fading_sticky_header" baseClass:objc_opt_class()];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  +[SXClassFactory registerClass:v9 type:@"parallax_scale" baseClass:v10];
}

@end