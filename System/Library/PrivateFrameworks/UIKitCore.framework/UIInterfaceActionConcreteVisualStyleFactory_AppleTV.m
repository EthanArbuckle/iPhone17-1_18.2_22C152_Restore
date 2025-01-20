@interface UIInterfaceActionConcreteVisualStyleFactory_AppleTV
+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
@end

@implementation UIInterfaceActionConcreteVisualStyleFactory_AppleTV

+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  if dyld_program_sdk_at_least() && (_os_feature_enabled_impl()) {
    v4 = off_1E52D3BC0;
  }
  else {
    v4 = off_1E52D3BB8;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

@end