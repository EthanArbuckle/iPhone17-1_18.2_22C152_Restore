@interface WFVariableAggrandizement
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionary;
- (WFVariableAggrandizement)initWithDictionary:(id)a3;
- (id)processedContentClasses:(id)a3;
- (unint64_t)hash;
- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4;
@end

@implementation WFVariableAggrandizement

- (void).cxx_destruct
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (unint64_t)hash
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  unint64_t v3 = [v2 hash] ^ 0x5620140A;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFVariableAggrandizement *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFVariableAggrandizement *)v4 dictionary];
      v6 = [(WFVariableAggrandizement *)self dictionary];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)processedContentClasses:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
}

- (WFVariableAggrandizement)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"Type"];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "WFEnforceClass";
      __int16 v23 = 2114;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      uint64_t v28 = v6;
      id v10 = v26;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    v8 = 0;
  }
  else
  {
    v8 = (NSString *)v7;
  }

  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    v12 = NSClassFromString(v8);
    if ([(objc_class *)v12 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v13 = [[v12 alloc] initWithDictionary:v4];
      if (v13)
      {
        uint64_t v14 = v13;
LABEL_15:

        goto LABEL_16;
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)WFVariableAggrandizement;
  uint64_t v14 = [(WFVariableAggrandizement *)&v20 init];
  if (v14)
  {
    if (!v8)
    {
      v15 = (void *)[v4 mutableCopy];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v15 setObject:v17 forKey:@"Type"];

      id v4 = v15;
    }
    uint64_t v18 = [v4 copy];
    self = *(WFVariableAggrandizement **)(v14 + 8);
    *(void *)(v14 + 8) = v18;
    goto LABEL_15;
  }
LABEL_16:

  return (WFVariableAggrandizement *)v14;
}

@end