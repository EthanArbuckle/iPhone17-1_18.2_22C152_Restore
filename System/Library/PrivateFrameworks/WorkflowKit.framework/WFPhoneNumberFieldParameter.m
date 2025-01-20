@interface WFPhoneNumberFieldParameter
- (BOOL)allowsCustomHandles;
- (Class)multipleStateClass;
- (id)supportedContactProperties;
@end

@implementation WFPhoneNumberFieldParameter

- (BOOL)allowsCustomHandles
{
  return 0;
}

- (id)supportedContactProperties
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Phone";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

@end