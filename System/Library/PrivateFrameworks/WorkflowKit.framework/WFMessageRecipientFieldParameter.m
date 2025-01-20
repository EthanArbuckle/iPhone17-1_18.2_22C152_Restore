@interface WFMessageRecipientFieldParameter
- (Class)multipleStateClass;
@end

@implementation WFMessageRecipientFieldParameter

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

@end