@interface LNActionParameterMetadata(Workflow)
- (id)wf_localizedDescription;
- (id)wf_localizedTitle;
- (id)wf_parameterDefinition;
- (id)wf_parameterDictionaryRepresentation;
- (id)wf_parameterMetadataWithTypeSpecificMetadata:()Workflow;
- (uint64_t)wf_isPersistentFileIdentifiableEntity;
- (uint64_t)wf_validateParameterValue:()Workflow error:;
@end

@implementation LNActionParameterMetadata(Workflow)

- (id)wf_parameterDictionaryRepresentation
{
  v1 = objc_msgSend(a1, "wf_parameterDefinition");
  v2 = [v1 parameterDefinitionDictionary];

  return v2;
}

- (id)wf_parameterDefinition
{
  v2 = [a1 valueType];
  v3 = objc_msgSend(v2, "wf_parameterDefinitionWithParameterMetadata:", a1);

  return v3;
}

- (uint64_t)wf_isPersistentFileIdentifiableEntity
{
  v1 = [a1 typeSpecificMetadata];
  v2 = [v1 objectForKeyedSubscript:@"LNValueTypeSpecificMetadataKeyLinkEntityMetadata"];

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [v2 systemProtocolMetadata];
    v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F72928]];

    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)wf_localizedTitle
{
  v2 = [a1 title];
  v3 = [v2 localizedStringWithPluralizationNumber:&unk_1F23171F0 forLocaleIdentifier:0];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 name];
  }
  v6 = v5;

  return v6;
}

- (id)wf_localizedDescription
{
  v1 = [a1 parameterDescription];
  v2 = [v1 localizedStringForLocaleIdentifier:0];

  return v2;
}

- (id)wf_parameterMetadataWithTypeSpecificMetadata:()Workflow
{
  v4 = (objc_class *)MEMORY[0x1E4F72AF0];
  id v5 = a3;
  id v18 = [v4 alloc];
  v17 = [a1 name];
  v6 = [a1 valueType];
  uint64_t v7 = [a1 isOptional];
  v8 = [a1 title];
  v9 = [a1 parameterDescription];
  v10 = [a1 resolvableInputTypes];
  uint64_t v11 = [a1 dynamicOptionsSupport];
  uint64_t v12 = [a1 inputConnectionBehavior];
  uint64_t v13 = [a1 capabilities];
  v14 = [a1 queryIdentifier];
  v15 = (void *)[v18 initWithName:v17 valueType:v6 optional:v7 title:v8 description:v9 resolvableInputTypes:v10 typeSpecificMetadata:v5 dynamicOptionsSupport:v11 inputConnectionBehavior:v12 capabilities:v13 queryIdentifier:v14];

  return v15;
}

- (uint64_t)wf_validateParameterValue:()Workflow error:
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [a1 isOptional];
  if (v6 || (v7 & 1) != 0)
  {
    if (v6
      && ([a1 valueType],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v6 value],
          id v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = [v17 objectIsMemberOfType:v18],
          v18,
          v17,
          (v19 & 1) == 0))
    {
      if (a4)
      {
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F728D0];
        v23[0] = *MEMORY[0x1E4F28568];
        v10 = WFLocalizedString(@"The value is invalid");
        v24[0] = v10;
        v23[1] = *MEMORY[0x1E4F285A0];
        uint64_t v11 = WFLocalizedString(@"Please ensure that a value is valid");
        v24[1] = v11;
        v23[2] = *MEMORY[0x1E4F728D8];
        uint64_t v12 = [a1 name];
        v24[2] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
        v14 = v20;
        uint64_t v15 = v21;
        uint64_t v16 = 2008;
        goto LABEL_10;
      }
    }
    else
    {
      a4 = 1;
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F728D0];
    v25[0] = *MEMORY[0x1E4F28568];
    v10 = WFLocalizedString(@"The value for a required parameter is missing");
    v26[0] = v10;
    v25[1] = *MEMORY[0x1E4F285A0];
    uint64_t v11 = WFLocalizedString(@"Please ensure that a value is provided for the parameter");
    v26[1] = v11;
    v25[2] = *MEMORY[0x1E4F728D8];
    uint64_t v12 = [a1 name];
    v26[2] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    v14 = v8;
    uint64_t v15 = v9;
    uint64_t v16 = 2005;
LABEL_10:
    *(void *)a4 = [v14 errorWithDomain:v15 code:v16 userInfo:v13];

    a4 = 0;
  }

  return a4;
}

@end