@interface WFHomeAccessoryPickerParameter(UIKitEditingController)
+ (uint64_t)uikitEditingControllerClass;
@end

@implementation WFHomeAccessoryPickerParameter(UIKitEditingController)

+ (uint64_t)uikitEditingControllerClass
{
  return objc_opt_class();
}

@end