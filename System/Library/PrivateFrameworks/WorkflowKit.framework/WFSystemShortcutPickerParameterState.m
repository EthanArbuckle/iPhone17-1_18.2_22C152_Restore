@interface WFSystemShortcutPickerParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFSystemShortcutPickerParameterState

+ (id)serializedRepresentationFromValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFSystemShortcutPickerParameterState.m", 44, @"Invalid parameter not satisfying: %@", @"[action isKindOfClass:[WFConfiguredSystemAction class]]" object file lineNumber description];
  }
  v6 = [v5 asLNValue];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 wfSerializedRepresentation];
  }
  else
  {
    v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "+[WFSystemShortcutPickerParameterState serializedRepresentationFromValue:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Could not get value from system action: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v7;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;
  id v12 = v9;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  id v15 = v11;
  id v16 = v15;
  if (!v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = 0;
    }
    else {
      id v16 = v7;
    }
  }
  v17 = (void *)MEMORY[0x1E4F72E10];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F72C58]) initWithIdentifier:@"ConfiguredShortcut"];
  v19 = [v17 valueFromSerializedRepresentation:v16 valueType:v18 variableProvider:v8 parameter:v14 bundleIdentifier:*MEMORY[0x1E4FB4BB8]];

  if (v19)
  {
    v20 = [MEMORY[0x1E4FB4608] systemActionWithValue:v19];
  }
  else
  {
    v21 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      v24 = "+[WFSystemShortcutPickerParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
      _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to system shortcut value", (uint8_t *)&v23, 0xCu);
    }

    v20 = 0;
  }

  return v20;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v13 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  id v9 = (void (**)(id, void *, void))a5;
  v10 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v10)
  {
    id v11 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = [v11 prompt];
      v8[2](v8, v12, 0);
    }
    else
    {

      id v11 = [(WFVariableSubstitutableParameterState *)self variable];
      [v11 getContentWithContext:v13 completionHandler:v9];
    }
  }
  else
  {
    id v11 = [(WFVariableSubstitutableParameterState *)self value];
    v9[2](v9, v11, 0);
  }
}

@end