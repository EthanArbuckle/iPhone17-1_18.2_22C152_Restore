@interface WFEmailAddressFieldParameter
- (BOOL)allowsCustomHandles;
- (Class)multipleStateClass;
- (id)autocapitalizationType;
- (id)supportedContactProperties;
@end

@implementation WFEmailAddressFieldParameter

- (BOOL)allowsCustomHandles
{
  return 0;
}

- (id)supportedContactProperties
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Email";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)autocapitalizationType
{
  return (id)*MEMORY[0x1E4FB4DF0];
}

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

@end