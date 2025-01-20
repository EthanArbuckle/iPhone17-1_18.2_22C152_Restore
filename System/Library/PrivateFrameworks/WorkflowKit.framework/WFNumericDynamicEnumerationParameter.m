@interface WFNumericDynamicEnumerationParameter
- (Class)singleStateClass;
@end

@implementation WFNumericDynamicEnumerationParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end