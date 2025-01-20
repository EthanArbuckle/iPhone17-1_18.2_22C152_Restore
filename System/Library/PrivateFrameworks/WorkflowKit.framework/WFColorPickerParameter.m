@interface WFColorPickerParameter
- (Class)singleStateClass;
- (id)defaultSerializedRepresentation;
@end

@implementation WFColorPickerParameter

- (id)defaultSerializedRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithSystemColor:22];
  v3 = [v2 serializedRepresentation];

  return v3;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end