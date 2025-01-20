@interface WFRemindersSmartListParameterState
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (id)legacySerializedRepresentation;
@end

@implementation WFRemindersSmartListParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v23 = @"identifier";
    v12 = [NSString stringWithFormat:@"com.apple.reminders.smartlist.%@", v11];
    v24[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

    if (v13)
    {
      v14 = v11;
      id v11 = (id)v13;
    }
    else
    {
      v17 = getWFActionsLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "+[WFRemindersSmartListParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s Found unexpected Reminders Smart List: %{public}@", buf, 0x16u);
      }

      v14 = v11;
      id v11 = 0;
    }
  }
  else
  {

    v14 = 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___WFRemindersSmartListParameterState;
  v15 = objc_msgSendSuper2(&v18, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v11, v9, v10);

  return v15;
}

- (id)legacySerializedRepresentation
{
  v2 = [(WFVariableSubstitutableParameterState *)self value];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [v2 value];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = [v3 value];
      if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v5 = [v4 identifier];
        v6 = [v5 instanceIdentifier];

        if (v6)
        {
          v7 = [v6 componentsSeparatedByString:@"."];
          id v8 = [v7 lastObject];
        }
        else
        {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end