@interface SXResourceClassRegister
+ (void)registerClasses;
@end

@implementation SXResourceClassRegister

+ (void)registerClasses
{
  uint64_t v2 = objc_opt_class();
  +[SXClassFactory registerClass:v2 type:@"resource" baseClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();
  +[SXClassFactory registerClass:v3 type:@"audio" baseClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  +[SXClassFactory registerClass:v4 type:@"oembed" baseClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  +[SXClassFactory registerClass:v5 type:@"font" baseClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  +[SXClassFactory registerClass:v6 type:@"html" baseClass:objc_opt_class()];
  uint64_t v7 = objc_opt_class();
  +[SXClassFactory registerClass:v7 type:@"image" baseClass:objc_opt_class()];
  uint64_t v8 = objc_opt_class();
  +[SXClassFactory registerClass:v8 type:@"image2" baseClass:objc_opt_class()];
  uint64_t v9 = objc_opt_class();
  +[SXClassFactory registerClass:v9 type:@"quicklook" baseClass:objc_opt_class()];
  uint64_t v10 = objc_opt_class();
  +[SXClassFactory registerClass:v10 type:@"remote_data" baseClass:objc_opt_class()];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  +[SXClassFactory registerClass:v11 type:@"video" baseClass:v12];
}

@end