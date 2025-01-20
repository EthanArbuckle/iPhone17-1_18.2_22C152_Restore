@interface WFConditionalSubjectParameter(UIKitEditingController)
+ (uint64_t)uikitEditingControllerClass;
@end

@implementation WFConditionalSubjectParameter(UIKitEditingController)

+ (uint64_t)uikitEditingControllerClass
{
  return objc_opt_class();
}

@end