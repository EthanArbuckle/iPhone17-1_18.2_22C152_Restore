@interface INCodableAttribute
@end

@implementation INCodableAttribute

id __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) arraySizeForSizeClass:a2];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSNumber numberWithInteger:v2];
  }
  return v3;
}

BOOL __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) arraySizeForSizeClass:a2] != 0x7FFFFFFFFFFFFFFFLL;
}

void __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];

  if (!v7)
  {
    v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v13 = v5;
    v14[0] = v6;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v10 = [v8 definitionByAddingEntriesInDictionary:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

@end