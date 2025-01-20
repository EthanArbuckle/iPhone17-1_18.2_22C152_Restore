@interface WFLinkActionApplicationParameterDefinition
- (Class)parameterClass;
- (WFLinkActionApplicationParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionApplicationParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  v3 = [a3 value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  if ([v5 length])
  {
    v6 = [WFAppDescriptorParameterState alloc];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v5];
    v8 = [(WFVariableSubstitutableParameterState *)v6 initWithValue:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v17 = v11;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = [v17 bundleIdentifier];
    v16 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v15];
    v14[2](v14, v16, 0);
  }
  else
  {

    v14[2](v14, 0, 0);
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [v8 value];
    v10 = [v9 bundleIdentifier];

    if (v10)
    {
      id v11 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v10];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionApplicationParameterDefinition)initWithParameterMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F72CB8];
  id v5 = a3;
  id v6 = [v4 applicationValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionApplicationParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end