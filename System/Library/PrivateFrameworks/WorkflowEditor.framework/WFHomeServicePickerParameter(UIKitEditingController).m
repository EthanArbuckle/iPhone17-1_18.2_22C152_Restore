@interface WFHomeServicePickerParameter(UIKitEditingController)
+ (uint64_t)uikitEditingControllerClass;
@end

@implementation WFHomeServicePickerParameter(UIKitEditingController)

+ (uint64_t)uikitEditingControllerClass
{
  return objc_opt_class();
}

@end