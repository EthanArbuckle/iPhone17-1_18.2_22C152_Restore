@interface NSString(UIItemProvider)
+ (uint64_t)_ui_augmentingNSItemProviderReadingClass;
@end

@implementation NSString(UIItemProvider)

+ (uint64_t)_ui_augmentingNSItemProviderReadingClass
{
  return objc_opt_class();
}

@end