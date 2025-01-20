@interface WFContactHandleFieldParameter
- (BOOL)allowsCustomHandles;
- (Class)multipleStateClass;
- (id)supportedContactProperties;
- (void)setAllowsCustomHandles:(BOOL)a3;
@end

@implementation WFContactHandleFieldParameter

- (void)setAllowsCustomHandles:(BOOL)a3
{
  if (self->super._allowsCustomHandles != a3)
  {
    self->super._allowsCustomHandles = a3;
    [(WFParameter *)self attributesDidChange];
  }
}

- (BOOL)allowsCustomHandles
{
  return self->super._allowsCustomHandles;
}

- (id)supportedContactProperties
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Email";
  v4[1] = @"Phone";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

@end