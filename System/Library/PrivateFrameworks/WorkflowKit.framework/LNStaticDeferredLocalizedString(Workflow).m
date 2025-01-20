@interface LNStaticDeferredLocalizedString(Workflow)
- (__CFString)wf_localizedString;
- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:;
- (id)serializedRepresentation;
- (void)wf_getLocalizedStringWithCompletionHandler:()Workflow;
@end

@implementation LNStaticDeferredLocalizedString(Workflow)

- (__CFString)wf_localizedString
{
  v1 = [a1 localizedStringWithPluralizationNumber:&unk_1F23167E8 forLocaleIdentifier:0];
  v2 = v1;
  if (!v1) {
    v1 = &stru_1F229A4D8;
  }
  v3 = v1;

  return v3;
}

- (id)serializedRepresentation
{
  v2 = objc_opt_new();
  v3 = [a1 localizedStringWithPluralizationNumber:&unk_1F23167E8 forLocaleIdentifier:0];
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v3, @"key");

  return v2;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (!v6)
  {
LABEL_10:
    id v11 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136315906;
      v16 = "WFEnforceClass";
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      uint64_t v22 = v5;
      id v10 = v20;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v15, 0x2Au);
    }
    goto LABEL_10;
  }
  v7 = [v6 objectForKey:@"key"];
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
  id v12 = v8;

  v13 = (void *)[a1 initWithKey:v12 table:0 bundleURL:0];
  a1 = v13;

  id v11 = a1;
LABEL_13:

  return v11;
}

- (void)wf_getLocalizedStringWithCompletionHandler:()Workflow
{
  uint64_t v5 = a3;
  objc_msgSend(a1, "wf_localizedString");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, void))a3)[2](v5, v6, 0);
}

@end