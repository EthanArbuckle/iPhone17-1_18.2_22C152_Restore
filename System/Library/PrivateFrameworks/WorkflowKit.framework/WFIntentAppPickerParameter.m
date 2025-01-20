@interface WFIntentAppPickerParameter
- (BOOL)alwaysShowsButton;
- (Class)singleStateClass;
- (NSString)intentName;
- (WFIntentAppPickerParameter)initWithDefinition:(id)a3;
- (void)possibleStatesDidChange;
@end

@implementation WFIntentAppPickerParameter

- (void).cxx_destruct
{
}

- (NSString)intentName
{
  return self->_intentName;
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (void)possibleStatesDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFIntentAppPickerParameter;
  [(WFDynamicEnumerationParameter *)&v3 possibleStatesDidChange];
  [(WFDynamicEnumerationParameter *)self defaultSerializedRepresentationDidChange];
}

- (WFIntentAppPickerParameter)initWithDefinition:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFIntentAppPickerParameter;
  v5 = [(WFEnumerationParameter *)&v16 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"IntentName"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        __int16 v19 = 2114;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v11;
        __int16 v23 = 2114;
        uint64_t v24 = v7;
        id v12 = v11;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      v9 = 0;
    }
    else
    {
      v9 = (NSString *)v8;
    }

    intentName = v5->_intentName;
    v5->_intentName = v9;

    v14 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end