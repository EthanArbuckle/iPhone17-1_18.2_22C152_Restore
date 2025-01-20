@interface INCodableObjectAttribute
@end

@implementation INCodableObjectAttribute

id __90__INCodableObjectAttribute_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 metadata];
  v6 = objc_msgSend(v5, "wf_parameterStateForIntentValue:parameterDefinition:", v4, *(void *)(a1 + 40));

  return v6;
}

@end