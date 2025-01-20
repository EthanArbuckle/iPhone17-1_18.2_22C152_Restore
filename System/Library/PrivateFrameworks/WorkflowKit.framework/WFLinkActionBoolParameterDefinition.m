@interface WFLinkActionBoolParameterDefinition
- (Class)parameterClass;
- (WFLinkActionBoolParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)falseDisplayName;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (id)trueDisplayName;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionBoolParameterDefinition

- (WFLinkActionBoolParameterDefinition)initWithParameterMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  v6 = [v4 BOOLValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionBoolParameterDefinition;
  v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v9 = [v8 number];
    v10 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v9];
  }
  else
  {

    v12.receiver = self;
    v12.super_class = (Class)WFLinkActionBoolParameterDefinition;
    v10 = [(WFLinkActionParameterDefinition *)&v12 linkValueFromParameterState:v8 action:v7];
  }

  return v10;
}

- (id)parameterDefinitionDictionary
{
  v3 = objc_opt_new();
  v4 = [(WFLinkActionBoolParameterDefinition *)self trueDisplayName];
  id v5 = objc_msgSend(v4, "wf_localizedString");
  [v3 setValue:v5 forKey:@"OnDisplayName"];

  id v6 = [(WFLinkActionBoolParameterDefinition *)self falseDisplayName];
  id v7 = objc_msgSend(v6, "wf_localizedString");
  [v3 setValue:v7 forKey:@"OffDisplayName"];

  v11.receiver = self;
  v11.super_class = (Class)WFLinkActionBoolParameterDefinition;
  id v8 = [(WFLinkActionParameterDefinition *)&v11 parameterDefinitionDictionary];
  objc_super v9 = [v8 definitionByAddingEntriesInDictionary:v3];

  return v9;
}

- (id)trueDisplayName
{
  uint64_t v3 = *MEMORY[0x1E4F729B0];
  uint64_t v4 = objc_opt_class();
  return [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:v3 ofClass:v4];
}

- (id)falseDisplayName
{
  uint64_t v3 = *MEMORY[0x1E4F729A8];
  uint64_t v4 = objc_opt_class();
  return [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:v3 ofClass:v4];
}

- (id)localizedTitleForLinkValue:(id)a3
{
  uint64_t v4 = [a3 value];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  int v7 = [v6 BOOLValue];
  if (v7)
  {
    id v8 = [(WFLinkActionBoolParameterDefinition *)self trueDisplayName];
    if (v8)
    {
      objc_super v9 = [(WFLinkActionBoolParameterDefinition *)self trueDisplayName];
LABEL_11:
      v10 = v9;
      objc_super v11 = objc_msgSend(v9, "wf_localizedString");

      goto LABEL_15;
    }
    objc_super v12 = @"True";
  }
  else
  {
    id v8 = [(WFLinkActionBoolParameterDefinition *)self falseDisplayName];
    if (v8)
    {
      objc_super v9 = [(WFLinkActionBoolParameterDefinition *)self falseDisplayName];
      goto LABEL_11;
    }
    objc_super v12 = @"False";
  }
  objc_super v11 = WFLocalizedString(v12);
LABEL_15:

  return v11;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 value];
  if (v4)
  {
    id v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      int v7 = -[WFBooleanSubstitutableState initWithBoolValue:]([WFBooleanSubstitutableState alloc], "initWithBoolValue:", [v4 BOOLValue]);
      goto LABEL_8;
    }
    id v8 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_super v9 = [(WFLinkActionParameterDefinition *)self valueType];
      int v11 = 136315650;
      objc_super v12 = "-[WFLinkActionBoolParameterDefinition parameterStateFromLinkValue:]";
      __int16 v13 = 2114;
      v14 = v4;
      __int16 v15 = 2114;
      v16 = v9;
        (uint8_t *)&v11,
        0x20u);
    }
  }
  int v7 = 0;
LABEL_8:

  return v7;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  if (a3 || a6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFLinkActionBoolParameterDefinition;
    id v13 = a7;
    [(WFLinkActionParameterDefinition *)&v14 getLinkValueFromProcessedParameterValue:a3 parameterState:a4 permissionRequestor:a5 runningFromToolKit:v8 completionHandler:v13];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFLinkActionBoolParameterDefinition;
    id v12 = a7;
    id v13 = [(WFLinkActionParameterDefinition *)&v15 linkValueWithValue:MEMORY[0x1E4F1CC28]];
    (*((void (**)(id, id, void))a7 + 2))(v12, v13, 0);
  }
}

@end