@interface WFAppDescriptorParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (id)legacySerializedRepresentation;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFAppDescriptorParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = WFLocalizedString(@"Select an app");
  v12 = [(WFVariableSubstitutableParameterState *)self value];
  int v13 = [v12 requiresUserConfirmation];

  if (v13)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    v14 = [(WFVariableSubstitutableParameterState *)self variable];

    if (v14)
    {
      v15 = [(WFVariableSubstitutableParameterState *)self variable];
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v16 = [v15 prompt];
        v9[2](v9, v16, 0);
      }
      else
      {

        v17 = [(WFVariableSubstitutableParameterState *)self variable];
        uint64_t v18 = objc_opt_class();
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __90__WFAppDescriptorParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v20[3] = &unk_1E6556F30;
        v22 = v9;
        id v21 = v11;
        id v23 = v10;
        [v17 getObjectRepresentationForClass:v18 context:v8 completionHandler:v20];

        v15 = v22;
      }
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)WFAppDescriptorParameterState;
      [(WFVariableSubstitutableParameterState *)&v19 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
    }
  }
}

void __90__WFAppDescriptorParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v13 = a5;
  v7 = (objc_class *)MEMORY[0x1E4F302A8];
  id v8 = a2;
  v9 = (void *)[[v7 alloc] initWithLocalizedName:v8 bundleIdentifier:v8 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 supportedIntents:0 bundleURL:0 documentTypes:0];

  id v10 = [MEMORY[0x1E4F302D0] sharedResolver];
  v11 = [v10 resolvedAppMatchingDescriptor:v9];

  if ([v11 requiresUserConfirmation]) {
    v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else {
    v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v12();
}

- (id)legacySerializedRepresentation
{
  v3 = [(WFVariableSubstitutableParameterState *)self value];
  v4 = v3;
  if (v3) {
    [v3 bundleIdentifier];
  }
  else {
  v5 = [(WFVariableSubstitutableParameterState *)self serializedRepresentation];
  }

  return v5;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFAppDescriptorParameterState.m", 46, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[INAppDescriptor class]]" object file lineNumber description];
  }
  id v6 = v5;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 serializedRepresentation];

  return v9;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  if (!v10)
  {
    id v13 = 0;
    id v15 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  id v13 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v12)
  {
    v16 = [objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v12];
    if (!v16)
    {
LABEL_12:
      v16 = getWFActionsLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315138;
        v22 = "+[WFAppDescriptorParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s No serialized representation to make an app descriptor", (uint8_t *)&v21, 0xCu);
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (!v15)
    {
      id v13 = 0;
      goto LABEL_12;
    }
    v16 = [objc_alloc(MEMORY[0x1E4F302A8]) initWithSerializedRepresentation:v15];
    id v15 = v13;
    id v13 = 0;
    if (!v16) {
      goto LABEL_12;
    }
  }
  v17 = [MEMORY[0x1E4F302D0] sharedResolver];
  uint64_t v18 = [v17 resolvedAppMatchingDescriptor:v16];

  if (v18) {
    goto LABEL_21;
  }
  objc_super v19 = getWFActionsLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315394;
    v22 = "+[WFAppDescriptorParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
    __int16 v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Unable to resolve descriptor: %@", (uint8_t *)&v21, 0x16u);
  }

LABEL_20:
  uint64_t v18 = 0;
LABEL_21:

  return v18;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end