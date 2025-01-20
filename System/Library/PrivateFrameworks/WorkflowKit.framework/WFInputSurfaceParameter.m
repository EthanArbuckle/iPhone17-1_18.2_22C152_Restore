@interface WFInputSurfaceParameter
- (Class)singleStateClass;
- (id)defaultSupportedVariableTypes;
@end

@implementation WFInputSurfaceParameter

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end