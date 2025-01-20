@interface WFPropertyVariableAggrandizement
- (BOOL)negativeProperty;
- (NSString)negativePropertyName;
- (NSString)propertyName;
- (WFPropertyListObject)propertyUserInfo;
- (WFPropertyVariableAggrandizement)initWithDictionary:(id)a3;
- (WFPropertyVariableAggrandizement)initWithPropertyName:(id)a3 propertyUserInfo:(id)a4;
- (WFPropertyVariableAggrandizement)initWithPropertyName:(id)a3 propertyUserInfo:(id)a4 negativeProperty:(BOOL)a5 negativePropertyName:(id)a6;
- (id)processedContentClasses:(id)a3;
- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4;
@end

@implementation WFPropertyVariableAggrandizement

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v4[3] = &unk_1E654CB10;
  v4[4] = self;
  [a3 transformItemsAndFlattenUsingBlock:v4 completionHandler:a4];
}

void __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = [*(id *)(a1 + 32) propertyName];
  v9 = [v7 propertyForName:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2;
    v10[3] = &unk_1E654CAE8;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    [v9 getValuesForObject:v5 completionHandler:v10];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_3;
  v4[3] = &unk_1E65572C8;
  v4[4] = *(void *)(a1 + 32);
  v3 = objc_msgSend(a2, "if_map:", v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = v3;
LABEL_4:
    id v5 = v4;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 localizedValue];
    goto LABEL_4;
  }
  id v5 = v3;
  if ([*(id *)(a1 + 32) negativeProperty])
  {
    v7 = NSNumber;
    uint64_t v8 = objc_opt_class();
    id v9 = v5;
    if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      id v11 = getWFGeneralLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315906;
        v14 = "WFEnforceClass";
        __int16 v15 = 2114;
        id v16 = v9;
        __int16 v17 = 2114;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2114;
        uint64_t v20 = v8;
        id v12 = v18;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);
      }
      id v10 = 0;
    }
    else
    {
      id v10 = v9;
    }

    objc_msgSend(v7, "numberWithBool:", objc_msgSend(v10, "BOOLValue") ^ 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:

  return v5;
}

- (id)processedContentClasses:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAA0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 array];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__WFPropertyVariableAggrandizement_processedContentClasses___block_invoke;
  v11[3] = &unk_1E654CAC0;
  v11[4] = self;
  uint64_t v8 = objc_msgSend(v7, "if_compactMap:", v11);
  id v9 = (void *)[v6 initWithArray:v8];

  return v9;
}

id __60__WFPropertyVariableAggrandizement_processedContentClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [*(id *)(a1 + 32) propertyName];
  id v4 = [a2 propertyForName:v3];
  id v5 = [v4 valueItemClass];

  return v5;
}

- (NSString)negativePropertyName
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  id v3 = [v2 objectForKey:@"NegativePropertyName"];

  return (NSString *)v3;
}

- (BOOL)negativeProperty
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  id v3 = [v2 objectForKey:@"NegativeProperty"];

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

  char v6 = [v5 BOOLValue];
  return v6;
}

- (WFPropertyListObject)propertyUserInfo
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  id v3 = [v2 objectForKey:@"PropertyUserInfo"];

  return (WFPropertyListObject *)v3;
}

- (NSString)propertyName
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  id v3 = [v2 objectForKey:@"PropertyName"];

  return (NSString *)v3;
}

- (WFPropertyVariableAggrandizement)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"PropertyName"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFPropertyVariableAggrandizement;
    self = [(WFVariableAggrandizement *)&v8 initWithDictionary:v4];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (WFPropertyVariableAggrandizement)initWithPropertyName:(id)a3 propertyUserInfo:(id)a4 negativeProperty:(BOOL)a5 negativePropertyName:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  int v13 = objc_opt_new();
  [v13 setObject:v12 forKey:@"PropertyName"];

  [v13 setValue:v11 forKey:@"PropertyUserInfo"];
  if (v6) {
    uint64_t v14 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v14 = 0;
  }
  if (v6) {
    id v15 = v10;
  }
  else {
    id v15 = 0;
  }
  [v13 setValue:v14 forKey:@"NegativeProperty"];
  [v13 setValue:v15 forKey:@"NegativePropertyName"];

  id v16 = [(WFPropertyVariableAggrandizement *)self initWithDictionary:v13];
  return v16;
}

- (WFPropertyVariableAggrandizement)initWithPropertyName:(id)a3 propertyUserInfo:(id)a4
{
  return [(WFPropertyVariableAggrandizement *)self initWithPropertyName:a3 propertyUserInfo:a4 negativeProperty:0 negativePropertyName:0];
}

@end