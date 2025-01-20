@interface WFOverridableLinkAction
+ (NSString)overrideInputParameterName;
+ (id)inputParameterMetadataWithActionMetadata:(id)a3;
+ (id)overrideInputParameterNames;
- (BOOL)isPlatformProvidedUnderstandingAction;
- (BOOL)shouldOverrideParameterLabels;
- (BOOL)shouldOverrideSubcategory;
- (NSDictionary)overrideDefaultValuesByParameter;
- (NSDictionary)overrideLabelsByParameter;
- (NSDictionary)parameterOverrides;
- (NSDictionary)serializationKeysByParameter;
- (NSString)appName;
- (NSString)overrideDescriptionSummary;
- (id)parameterDefinitions;
@end

@implementation WFOverridableLinkAction

- (id)parameterDefinitions
{
  v10.receiver = self;
  v10.super_class = (Class)WFOverridableLinkAction;
  v3 = [(WFLinkAction *)&v10 parameterDefinitions];
  v4 = [(WFOverridableLinkAction *)self parameterOverrides];
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__WFOverridableLinkAction_parameterDefinitions__block_invoke;
    v8[3] = &unk_1E654F418;
    id v9 = v4;
    objc_msgSend(v3, "if_map:", v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (NSDictionary)parameterOverrides
{
  v3 = objc_opt_new();
  v4 = [(WFOverridableLinkAction *)self overrideLabelsByParameter];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__WFOverridableLinkAction_parameterOverrides__block_invoke;
  v17[3] = &unk_1E654F3F0;
  id v5 = v3;
  id v18 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v17];

  id v6 = [(WFOverridableLinkAction *)self overrideDefaultValuesByParameter];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__WFOverridableLinkAction_parameterOverrides__block_invoke_2;
  v15[3] = &unk_1E6551130;
  id v7 = v5;
  id v16 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v15];

  v8 = [(WFOverridableLinkAction *)self serializationKeysByParameter];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__WFOverridableLinkAction_parameterOverrides__block_invoke_3;
  v13[3] = &unk_1E6554C00;
  id v9 = v7;
  id v14 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];

  objc_super v10 = v14;
  v11 = (NSDictionary *)v9;

  return v11;
}

- (NSDictionary)serializationKeysByParameter
{
  return 0;
}

- (NSDictionary)overrideLabelsByParameter
{
  return 0;
}

- (NSDictionary)overrideDefaultValuesByParameter
{
  return 0;
}

- (void).cxx_destruct
{
}

id __47__WFOverridableLinkAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKey:@"Key"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [v3 definitionByMergingWithDefinition:v5];

      goto LABEL_7;
    }
  }
  else
  {

    v4 = 0;
  }
  id v7 = v3;
LABEL_7:

  return v7;
}

+ (id)inputParameterMetadataWithActionMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 overrideInputParameterNames];
  if (v5)
  {
    id v6 = [v4 parameters];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__WFOverridableLinkAction_inputParameterMetadataWithActionMetadata___block_invoke;
    v9[3] = &unk_1E6555E18;
    id v10 = v5;
    id v7 = objc_msgSend(v6, "if_firstObjectPassingTest:", v9);

    id v4 = v6;
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___WFOverridableLinkAction;
    id v7 = objc_msgSendSuper2(&v11, sel_inputParameterMetadataWithActionMetadata_, v4);
  }

  return v7;
}

uint64_t __68__WFOverridableLinkAction_inputParameterMetadataWithActionMetadata___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)overrideInputParameterNames
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 overrideInputParameterName];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (NSString)overrideInputParameterName
{
  return 0;
}

- (NSString)overrideDescriptionSummary
{
  return self->_overrideDescriptionSummary;
}

- (BOOL)shouldOverrideSubcategory
{
  return self->_shouldOverrideSubcategory;
}

- (BOOL)shouldOverrideParameterLabels
{
  return self->_shouldOverrideParameterLabels;
}

- (BOOL)isPlatformProvidedUnderstandingAction
{
  return 1;
}

- (NSString)appName
{
  id v3 = [(WFAppIntentExecutionAction *)self displayableAppDescriptor];
  uint64_t v4 = [v3 localizedName];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(WFAppIntentExecutionAction *)self displayableAppDescriptor];
    id v7 = [v6 applicationRecord];

    v8 = [v7 infoDictionary];
    id v9 = self;
    id v10 = [v8 objectForKey:@"CFBundleDisplayName" ofClass:v9];
    objc_super v11 = v10;
    if (v10)
    {
      id v5 = v10;
    }
    else
    {
      v12 = [v7 infoDictionary];
      v13 = self;
      id v5 = [v12 objectForKey:@"CFBundleName" ofClass:v13];
    }
  }

  return (NSString *)v5;
}

void __45__WFOverridableLinkAction_parameterOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  v9[0] = @"Label";
  v9[1] = @"Placeholder";
  v10[0] = a3;
  v10[1] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 dictionaryWithObjects:v10 forKeys:v9 count:2];
  WFAddEntriesToDictionary(v4, v7, v8);
}

void __45__WFOverridableLinkAction_parameterOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = @"DefaultValue";
  v10[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  WFAddEntriesToDictionary(v4, v7, v8);
}

void __45__WFOverridableLinkAction_parameterOverrides__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = @"KeyForSerialization";
  v10[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  WFAddEntriesToDictionary(v4, v7, v8);
}

@end