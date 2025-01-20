@interface WFSystemShortcutPickerParameter
- (Class)singleStateClass;
@end

@implementation WFSystemShortcutPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end