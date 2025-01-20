@interface WFLinkActionSystemShortcutParameterDefinition
- (Class)parameterClass;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionSystemShortcutParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 value];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB4608] systemActionWithValue:v3];
    if (v5)
    {
      v6 = [(WFVariableSubstitutableParameterState *)[WFSystemShortcutPickerParameterState alloc] initWithValue:v5];
    }
    else
    {
      v7 = getWFGeneralLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        v10 = "-[WFLinkActionSystemShortcutParameterDefinition parameterStateFromLinkValue:]";
        __int16 v11 = 2112;
        id v12 = v3;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not get system action from link value: %@", (uint8_t *)&v9, 0x16u);
      }

      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a7;
  v10 = (void (**)(void, void, void))v9;
  if (v8)
  {
    objc_opt_class();
    int v11 = objc_opt_isKindOfClass() & 1;
    if (v11) {
      id v12 = v8;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    if (v11)
    {
      v14 = [v8 asLNValue];
      ((void (**)(void, void *, void))v10)[2](v10, v14, 0);
    }
    else
    {
      v15 = getWFGeneralLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 136315394;
        v17 = "-[WFLinkActionSystemShortcutParameterDefinition getLinkValueFromProcessedParameterValue:parameterState:per"
              "missionRequestor:runningFromToolKit:completionHandler:]";
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEBUG, "%s Could not get system action from processed parameter value: %@", (uint8_t *)&v16, 0x16u);
      }

      v10[2](v10, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v7 value];
    id v9 = [v8 asLNValue];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

@end