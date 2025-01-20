@interface WFFontPickerParameter
- (Class)singleStateClass;
- (id)defaultSerializedRepresentation;
@end

@implementation WFFontPickerParameter

- (id)defaultSerializedRepresentation
{
  return 0;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end