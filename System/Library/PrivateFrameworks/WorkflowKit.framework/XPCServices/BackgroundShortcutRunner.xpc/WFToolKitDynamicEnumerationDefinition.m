@interface WFToolKitDynamicEnumerationDefinition
- (NSString)actionIdentifier;
- (NSString)parameterKey;
- (WFToolKitDynamicEnumerationDefinition)init;
- (void)setActionIdentifier:(id)a3;
- (void)setParameterKey:(id)a3;
@end

@implementation WFToolKitDynamicEnumerationDefinition

- (NSString)actionIdentifier
{
  id v2 = ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.getter();
  return (NSString *)v2;
}

- (void)setActionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.setter(v4);
}

- (NSString)parameterKey
{
  id v2 = ToolKitHelper.DynamicEnumerationDefinition.parameterKey.getter();
  return (NSString *)v2;
}

- (void)setParameterKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolKitHelper.DynamicEnumerationDefinition.parameterKey.setter(v4);
}

- (WFToolKitDynamicEnumerationDefinition)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFToolKitDynamicEnumerationDefinition_parameterKey);
}

@end