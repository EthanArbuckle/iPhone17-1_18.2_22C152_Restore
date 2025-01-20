@interface INCodableAttributeMetadata(Workflow)
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_contentItemForValue:()Workflow;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:;
@end

@implementation INCodableAttributeMetadata(Workflow)

- (uint64_t)wf_contentItemForValue:()Workflow
{
  return 0;
}

- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  return 0;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  return 0;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 placeholder];

  if (v5)
  {
    v10 = @"Placeholder";
    v6 = [a1 placeholder];
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v8 = [v4 definitionByAddingEntriesInDictionary:v7];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (uint64_t)wf_parameterClass
{
  return 0;
}

- (uint64_t)wf_objectClass
{
  return 0;
}

@end