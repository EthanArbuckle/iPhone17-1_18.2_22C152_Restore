@interface WFLinkActionEnumParameterDefinition
- (Class)parameterClass;
- (WFLinkActionEnumParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)enumMetadata;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionEnumParameterDefinition

- (WFLinkActionEnumParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v5 = a3;
  v6 = [v5 valueType];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v7 = [v5 valueType];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v9 = v8;

    v10 = [v9 memberValueType];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = v10;
      v6 = v11;
    }
    else
    {

      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"WFLinkActionEnumParameterDefinition.m", 58, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];
      v6 = 0;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)WFLinkActionEnumParameterDefinition;
  v12 = [(WFLinkActionParameterDefinition *)&v14 initWithValueType:v6 parameterMetadata:v5];

  return v12;
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
    id v9 = [v8 value];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(WFLinkActionEnumParameterDefinition *)self enumMetadata];
    id v6 = [v5 cases];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__WFLinkActionEnumParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke;
    v11[3] = &unk_1E65581D0;
    id v12 = v4;
    id v7 = v4;
    id v8 = objc_msgSend(v6, "if_firstObjectPassingTest:", v11);

    id v9 = [v8 identifier];
  }
  else
  {

    id v9 = 0;
  }

  return v9;
}

- (id)parameterDefinitionDictionary
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [(WFLinkActionEnumParameterDefinition *)self enumMetadata];
  v29 = self;
  id v4 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A10] ofClass:objc_opt_class()];
  v35 = objc_opt_new();
  v34 = objc_opt_new();
  v33 = objc_opt_new();
  v32 = objc_opt_new();
  v30 = v3;
  v31 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v3 cases];
  uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (v4)
        {
          id v7 = [*(id *)(*((void *)&v40 + 1) + 8 * i) identifier];
          int v8 = [v4 containsObject:v7];

          if (!v8) {
            continue;
          }
        }
        id v9 = [v6 identifier];
        v10 = objc_msgSend(v6, "wf_localizedDisplayName");
        uint64_t v11 = objc_msgSend(v6, "wf_localizedSubtitle");
        id v12 = (void *)v11;
        if (v11) {
          v13 = (__CFString *)v11;
        }
        else {
          v13 = &stru_1F229A4D8;
        }
        objc_super v14 = v13;

        uint64_t v15 = objc_msgSend(v6, "wf_symbolName");
        v16 = (void *)v15;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        else {
          v17 = &stru_1F229A4D8;
        }
        v18 = v17;

        v19 = [v6 displayRepresentation];
        v20 = [v19 image];
        v21 = objc_msgSend(v20, "wf_image");
        v22 = v21;
        if (v21)
        {
          id v23 = v21;
        }
        else
        {
          id v23 = [MEMORY[0x1E4F1CA98] null];
        }
        v24 = v23;

        if (v9 && v10)
        {
          [v35 addObject:v9];
          [v34 addObject:v10];
          [v33 addObject:v14];
          [v32 addObject:v18];
          [v31 addObject:v24];
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v38);
  }

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v25 setValue:v35 forKey:@"Items"];
  [v25 setValue:v34 forKey:@"ItemDisplayNames"];
  [v25 setValue:v33 forKey:@"ItemSubtitles"];
  [v25 setValue:v32 forKey:@"ItemIconNames"];
  [v25 setValue:v31 forKey:@"ItemImages"];
  v39.receiver = v29;
  v39.super_class = (Class)WFLinkActionEnumParameterDefinition;
  v26 = [(WFLinkActionParameterDefinition *)&v39 parameterDefinitionDictionary];
  v27 = [v26 definitionByAddingEntriesInDictionary:v25];

  return v27;
}

- (id)enumMetadata
{
  uint64_t v3 = objc_opt_class();
  return [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:@"LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata" ofClass:v3];
}

uint64_t __104__WFLinkActionEnumParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 displayRepresentation];
  id v6 = [v5 title];
  id v7 = objc_msgSend(v6, "wf_localizedString");

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [(WFLinkActionEnumParameterDefinition *)self enumMetadata];
    v10 = [v9 cases];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__WFLinkActionEnumParameterDefinition_localizedTitleForLinkValue___block_invoke;
    v13[3] = &unk_1E65581D0;
    id v14 = v4;
    uint64_t v11 = objc_msgSend(v10, "if_firstObjectPassingTest:", v13);
    objc_msgSend(v11, "wf_localizedDisplayName");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

uint64_t __66__WFLinkActionEnumParameterDefinition_localizedTitleForLinkValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) value];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 value];
  if (!v4)
  {
LABEL_12:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [(WFLinkActionParameterDefinition *)self valueType];
  char v6 = [v5 objectIsMemberOfType:v4];

  if ((v6 & 1) == 0)
  {
    id v12 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(WFLinkActionParameterDefinition *)self valueType];
      int v15 = 136315650;
      v16 = "-[WFLinkActionEnumParameterDefinition parameterStateFromLinkValue:]";
      __int16 v17 = 2114;
      v18 = v4;
      __int16 v19 = 2114;
      v20 = v13;
        (uint8_t *)&v15,
        0x20u);
    }
    goto LABEL_12;
  }
  id v7 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = 0;
  if (isKindOfClass) {
    uint64_t v11 = [(WFVariableSubstitutableParameterState *)[WFLinkEnumerationSubstitutableState alloc] initWithValue:v7];
  }

LABEL_13:
  return v11;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v9 = (void (**)(id, void *, void))a7;
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v13;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;
  id v12 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v11];

  v9[2](v9, v12, 0);
}

@end