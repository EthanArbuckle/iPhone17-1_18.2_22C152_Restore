@interface WFFileEntityPickerParameter
- (Class)singleStateClass;
@end

@implementation WFFileEntityPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end