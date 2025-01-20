@interface WFLinkDynamicEnumerationParameter
- (Class)singleStateClass;
@end

@implementation WFLinkDynamicEnumerationParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end