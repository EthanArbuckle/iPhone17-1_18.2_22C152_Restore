@interface WFLinkActionPersonParameterDefinition
- (Class)parameterClass;
- (WFLinkActionPersonParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValues:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkArrayValuesFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
- (void)getPeopleFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
@end

@implementation WFLinkActionPersonParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = [a3 value];
  if (!v4)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v5 = [(WFLinkActionParameterDefinition *)self valueType];
  char v6 = [v5 objectIsMemberOfType:v4];

  if ((v6 & 1) == 0)
  {
    v10 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = [(WFLinkActionParameterDefinition *)self valueType];
      *(_DWORD *)buf = 136315650;
      v20 = "-[WFLinkActionPersonParameterDefinition parameterStateFromLinkValue:]";
      __int16 v21 = 2114;
      v22 = v4;
      __int16 v23 = 2114;
      v24 = v16;
        buf,
        0x20u);
    }
    goto LABEL_11;
  }
  id v7 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  v10 = v9;

  if ((isKindOfClass & 1) == 0)
  {
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v11 = [MEMORY[0x1E4F5A7F0] cnContactWithINPerson:v7];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F5A800]) initWithContact:v11];
  v13 = [WFContactSubstitutableState alloc];
  v18 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v15 = [(WFMultipleValueParameterState *)v13 initWithParameterStates:v14];

LABEL_12:
LABEL_13:

  return v15;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValues:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;

    char v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_19356);
    id v7 = [(WFMultipleValueParameterState *)[WFContactSubstitutableState alloc] initWithParameterStates:v6];
    v8 = [(WFContactSubstitutableState *)v7 serializedRepresentation];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __107__WFLinkActionPersonParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValues___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  if (!v2)
  {
    v4 = 0;
    id v5 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = 0;
    v4 = v2;
    v2 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = [MEMORY[0x1E4F5A7F0] cnContactWithINPerson:v2];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A800]) initWithContact:v3];
LABEL_7:

    goto LABEL_8;
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (void)getPeopleFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v13 = v8;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;
    if (isKindOfClass)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F5A9E8]);
      id v16 = (id)[objc_alloc(MEMORY[0x1E4F5A800]) initWithContact:v8];
      v28[0] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      id v18 = (id)[v15 initWithEntries:v17];
    }
    else
    {
      id v16 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v16;
      }
      else {
        v19 = 0;
      }
      id v18 = v19;
    }

    if (v18)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __131__WFLinkActionPersonParameterDefinition_getPeopleFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke;
      v22[3] = &unk_1E654FBB8;
      __int16 v23 = v11;
      [v18 getRecipientsWithPermissionRequestor:v9 completionHandler:v22];
    }
    else
    {
      v20 = getWFActionsLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[WFLinkActionPersonParameterDefinition getPeopleFromProcessedParameterValue:parameterState:permissionRequ"
              "estor:completionHandler:]";
        __int16 v26 = 2112;
        id v27 = (id)objc_opt_class();
        id v21 = v27;
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Expected WFProcessedContacts as processed parameter type for Person, but got %@ instead", buf, 0x16u);
      }
      v11[2](v11, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

uint64_t __131__WFLinkActionPersonParameterDefinition_getPeopleFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLinkArrayValuesFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke;
  v12[3] = &unk_1E6558040;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [(WFLinkActionPersonParameterDefinition *)self getPeopleFromProcessedParameterValue:a3 parameterState:a4 permissionRequestor:a5 completionHandler:v12];
}

void __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke_191;
    v8[3] = &unk_1E654FB90;
    v8[4] = *(void *)(a1 + 32);
    id v5 = a3;
    objc_msgSend(a2, "if_map:", v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = a3;
    id v7 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[WFLinkActionPersonParameterDefinition getLinkArrayValuesFromProcessedParameterValue:parameterState:permiss"
            "ionRequestor:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not make INPerson from processedContacts.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F72E10];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) valueType];
  id v7 = (void *)[v5 initWithValue:v4 valueType:v6];

  return v7;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __153__WFLinkActionPersonParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
  v13[3] = &unk_1E6558040;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  [(WFLinkActionPersonParameterDefinition *)self getPeopleFromProcessedParameterValue:a3 parameterState:a4 permissionRequestor:a5 completionHandler:v13];
}

void __153__WFLinkActionPersonParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_alloc(MEMORY[0x1E4F72E10]);
    id v9 = [v5 firstObject];
    id v10 = [*(id *)(a1 + 32) valueType];
    id v11 = (void *)[v8 initWithValue:v9 valueType:v10];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
  }
  else
  {
    id v12 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      id v14 = "-[WFLinkActionPersonParameterDefinition getLinkValueFromProcessedParameterValue:parameterState:permissionReq"
            "uestor:runningFromToolKit:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Could not make INPerson from processedContacts.", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }

    id v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  int v13 = [v12 value];

  id v14 = [v13 firstObject];
  uint64_t v15 = [v14 parameterState];

  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v18 = 0;
    goto LABEL_22;
  }
  id v9 = v15;

LABEL_10:
  switch([v9 type])
  {
    case 0:
      id v16 = [v9 contact];
      v17 = [v16 INPersonRepresentation];

      goto LABEL_20;
    case 1:
      id v26 = objc_alloc(MEMORY[0x1E4F305B8]);
      v20 = [v9 phoneNumber];
      id v21 = [v20 string];
      v22 = v26;
      __int16 v23 = v21;
      uint64_t v24 = 2;
      goto LABEL_19;
    case 2:
      id v19 = objc_alloc(MEMORY[0x1E4F305B8]);
      v20 = [v9 emailAddress];
      id v21 = [v20 address];
      v22 = v19;
      __int16 v23 = v21;
      uint64_t v24 = 1;
LABEL_19:
      id v27 = (void *)[v22 initWithValue:v23 type:v24];

      v17 = [objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v27 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
      goto LABEL_20;
    case 3:
      v17 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v29 = 136315138;
        v30 = "-[WFLinkActionPersonParameterDefinition linkValueFromParameterState:action:]";
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_FAULT, "%s Custom handles are not supported", (uint8_t *)&v29, 0xCu);
      }
      id v18 = 0;
      goto LABEL_21;
    case 4:
      uint64_t v25 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        int v29 = 136315138;
        v30 = "-[WFLinkActionPersonParameterDefinition linkValueFromParameterState:action:]";
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Message groups are not supported", (uint8_t *)&v29, 0xCu);
      }

      goto LABEL_17;
    default:
LABEL_17:
      v17 = 0;
LABEL_20:
      id v18 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v17];
LABEL_21:

      break;
  }
LABEL_22:

  return v18;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  uint64_t v3 = [a3 value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 displayName];

  return v6;
}

- (Class)parameterClass
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  uint64_t v3 = [v2 typeSpecificMetadata];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F72A58]];

  if ([v4 length]
    && ([v4 isEqualToString:@"contact"] & 1) == 0
    && ([v4 isEqualToString:@"email"] & 1) == 0
    && ([v4 isEqualToString:@"phone"] & 1) == 0
    && ([v4 isEqualToString:@"emailOrPhone"] & 1) == 0)
  {
    int v7 = [v4 isEqualToString:@"username"];
    id v8 = getWFAppIntentsLogObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v9)
      {
        int v13 = 136315138;
        id v14 = "-[WFLinkActionPersonParameterDefinition parameterClass]";
        id v10 = "%s username parameterMode is not implemented yet.";
        id v11 = v8;
        uint32_t v12 = 12;
LABEL_14:
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v13, v12);
      }
    }
    else if (v9)
    {
      int v13 = 136315394;
      id v14 = "-[WFLinkActionPersonParameterDefinition parameterClass]";
      __int16 v15 = 2112;
      id v16 = v4;
      id v10 = "%s Unhandled parameterMode %@ for Person parameter definition.";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_14;
    }
  }
  id v5 = objc_opt_class();

  return (Class)v5;
}

- (WFLinkActionPersonParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F72CB8];
  id v5 = a3;
  id v6 = [v4 personValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPersonParameterDefinition;
  int v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end