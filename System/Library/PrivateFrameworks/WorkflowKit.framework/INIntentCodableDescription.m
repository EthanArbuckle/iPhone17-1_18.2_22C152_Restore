@interface INIntentCodableDescription
@end

@implementation INIntentCodableDescription

id __103__INIntentCodableDescription_Workflow__wf_relationResourceDefinitionForAttribute_parameters_overrides___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 parentCodableAttribute];
  v7 = [v6 propertyName];
  v8 = [v3 objectForKeyedSubscript:v7];

  v9 = [*(id *)(a1 + 40) parentCodableAttribute];
  v10 = objc_msgSend(v9, "wf_parameterStateForIntentValue:parameterDefinition:", v5, v8);

  v11 = [v10 serializedRepresentation];
  v12 = v11;
  if (!v11) {
    v11 = v5;
  }
  id v13 = v11;

  return v13;
}

uint64_t __83__INIntentCodableDescription_Workflow__wf_actionParameterDefinitionsWithOverrides___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

@end