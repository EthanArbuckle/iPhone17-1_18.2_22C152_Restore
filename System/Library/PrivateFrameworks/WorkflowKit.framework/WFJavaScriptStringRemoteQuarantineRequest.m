@interface WFJavaScriptStringRemoteQuarantineRequest
+ (id)JSONKeyPathsByPropertyKey;
- (NSArray)actionList;
- (NSDictionary)preRuntimeJavaScriptSerializedRepresentation;
- (NSString)preRuntimeJavaScriptString;
- (NSString)runtimeJavaScriptString;
- (NSURL)targetURL;
- (WFJavaScriptStringRemoteQuarantineRequest)initWithWorkflow:(id)a3 runtimeType:(unint64_t)a4 targetURL:(id)a5 preRuntimeVariableString:(id)a6 runtimeString:(id)a7;
- (id)defaultLocalizedDeniedErrorMessage;
- (id)defaultLocalizedDeniedErrorTitle;
- (id)defaultLocalizedPromptMessage;
- (id)defaultLocalizedPromptTitle;
- (id)policyFunctionName;
- (unint64_t)runtimeType;
- (void)setActionList:(id)a3;
- (void)setRuntimeJavaScriptString:(id)a3;
- (void)setRuntimeType:(unint64_t)a3;
- (void)setTargetURL:(id)a3;
@end

@implementation WFJavaScriptStringRemoteQuarantineRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionList, 0);
  objc_storeStrong((id *)&self->_runtimeJavaScriptString, 0);
  objc_storeStrong((id *)&self->_preRuntimeJavaScriptString, 0);
  objc_storeStrong((id *)&self->_preRuntimeJavaScriptSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
}

- (void)setActionList:(id)a3
{
}

- (NSArray)actionList
{
  return self->_actionList;
}

- (void)setRuntimeJavaScriptString:(id)a3
{
}

- (NSString)runtimeJavaScriptString
{
  return self->_runtimeJavaScriptString;
}

- (NSString)preRuntimeJavaScriptString
{
  return self->_preRuntimeJavaScriptString;
}

- (NSDictionary)preRuntimeJavaScriptSerializedRepresentation
{
  return self->_preRuntimeJavaScriptSerializedRepresentation;
}

- (void)setTargetURL:(id)a3
{
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (void)setRuntimeType:(unint64_t)a3
{
  self->_runtimeType = a3;
}

- (unint64_t)runtimeType
{
  return self->_runtimeType;
}

- (id)defaultLocalizedDeniedErrorMessage
{
  return WFLocalizedString(@"This JavaScript is similar to a script that is known to be unsafe. For your security it will not run.");
}

- (id)defaultLocalizedDeniedErrorTitle
{
  return WFLocalizedString(@"Unsafe JavaScript");
}

- (id)defaultLocalizedPromptMessage
{
  return WFLocalizedString(@"This will give the JavaScript full access to the web page including all data");
}

- (id)defaultLocalizedPromptTitle
{
  return WFLocalizedString(@"Allow JavaScript access to the web page?");
}

- (id)policyFunctionName
{
  return @"decidePolicyForQuarantineRequest";
}

- (WFJavaScriptStringRemoteQuarantineRequest)initWithWorkflow:(id)a3 runtimeType:(unint64_t)a4 targetURL:(id)a5 preRuntimeVariableString:(id)a6 runtimeString:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)WFJavaScriptStringRemoteQuarantineRequest;
  v16 = [(WFBaseRemoteQuarantineRequest *)&v33 init];
  if (v16)
  {
    id v32 = v13;
    v17 = [v12 actions];
    v18 = [v17 valueForKey:@"identifier"];
    v19 = v18;
    if (!v18)
    {
      v19 = [MEMORY[0x1E4F1C978] array];
    }
    objc_storeStrong((id *)&v16->_actionList, v19);
    if (!v18) {

    }
    v16->_runtimeType = a4;
    objc_storeStrong((id *)&v16->_targetURL, a5);
    v20 = [v14 serializedRepresentation];
    uint64_t v21 = objc_opt_class();
    id v22 = v20;
    if (v22 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = getWFGeneralLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v35 = "WFEnforceClass";
        __int16 v36 = 2114;
        id v37 = v22;
        __int16 v38 = 2114;
        v39 = v25;
        __int16 v40 = 2114;
        uint64_t v41 = v21;
        id v26 = v25;
        _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      v23 = 0;
    }
    else
    {
      v23 = (NSDictionary *)v22;
    }

    preRuntimeJavaScriptSerializedRepresentation = v16->_preRuntimeJavaScriptSerializedRepresentation;
    v16->_preRuntimeJavaScriptSerializedRepresentation = v23;

    uint64_t v28 = [v14 stringByReplacingVariablesWithNames];
    preRuntimeJavaScriptString = v16->_preRuntimeJavaScriptString;
    v16->_preRuntimeJavaScriptString = (NSString *)v28;

    objc_storeStrong((id *)&v16->_runtimeJavaScriptString, a7);
    v30 = v16;
    id v13 = v32;
  }

  return v16;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFJavaScriptStringRemoteQuarantineRequest;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"runtimeType";
  v7[1] = @"targetURL";
  v8[0] = @"runtimeType";
  v8[1] = @"targetURL";
  v7[2] = @"preRuntimeJavaScriptSerializedRepresentation";
  v7[3] = @"preRuntimeJavaScriptString";
  v8[2] = @"preRuntimeJavaScriptSerializedRepresentation";
  v8[3] = @"preRuntimeJavaScriptString";
  v7[4] = @"runtimeJavaScriptString";
  v7[5] = @"actionList";
  v8[4] = @"runtimeJavaScriptString";
  v8[5] = @"actionList";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end