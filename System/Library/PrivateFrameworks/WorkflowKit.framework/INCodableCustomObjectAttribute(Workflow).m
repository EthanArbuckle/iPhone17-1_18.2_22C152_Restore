@interface INCodableCustomObjectAttribute(Workflow)
- (id)wf_contentItemClass;
- (id)wf_contentItemForValue:()Workflow;
- (id)wf_parameterClass;
- (uint64_t)wf_facadeClass;
- (uint64_t)wf_objectClass;
@end

@implementation INCodableCustomObjectAttribute(Workflow)

- (id)wf_contentItemForValue:()Workflow
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass())
    {
      v7 = objc_msgSend(a1, "wf_contentItemClass");
      v8 = INObjectWithTypedObject();
      v9 = [v7 itemWithObject:v8];

      goto LABEL_8;
    }
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315906;
      v14 = "WFEnforceClass";
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      uint64_t v20 = v5;
      id v11 = v18;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (id)wf_contentItemClass
{
  v2 = [a1 codableDescription];
  v3 = [a1 objectTypeNamespace];
  id v4 = objc_msgSend(v2, "wf_contentItemClassForCustomObjectWithNamespace:", v3);

  return v4;
}

- (id)wf_parameterClass
{
  [a1 modifier];
  id v1 = (id)objc_opt_class();
  return v1;
}

- (uint64_t)wf_facadeClass
{
  return objc_opt_class();
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end