@interface WFCoercionVariableAggrandizement
- (BOOL)isEqual:(id)a3;
- (Class)coercionItemClass;
- (WFCoercionVariableAggrandizement)initWithCoercionItemClass:(Class)a3;
- (WFCoercionVariableAggrandizement)initWithDictionary:(id)a3;
- (id)coercionItemClasses;
- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4;
@end

@implementation WFCoercionVariableAggrandizement

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = (objc_class *)[v6 coercionItemClass];

  BOOL v8 = v7 == [(WFCoercionVariableAggrandizement *)self coercionItemClass];
  return v8;
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(WFCoercionVariableAggrandizement *)self coercionItemClasses];
  v9 = [v8 array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__WFCoercionVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v11[3] = &unk_1E6556D50;
  id v12 = v6;
  id v10 = v6;
  [v7 generateCollectionByCoercingToItemClasses:v9 completionHandler:v11];
}

uint64_t __79__WFCoercionVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)coercionItemClasses
{
  v2 = [(WFCoercionVariableAggrandizement *)self coercionItemClass];
  if ([(objc_class *)v2 isSubclassOfClass:objc_opt_class()]) {
    objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", objc_opt_class(), v2, 0);
  }
  else {
  v3 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v2];
  }
  return v3;
}

- (Class)coercionItemClass
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"CoercionItemClass"];
  id v4 = NSClassFromString(v3);

  return (Class)v4;
}

- (WFCoercionVariableAggrandizement)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"CoercionItemClass"];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "WFEnforceClass";
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      id v10 = v19;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = (NSString *)v7;
  }

  if (v8 && NSClassFromString(v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)WFCoercionVariableAggrandizement;
    self = [(WFVariableAggrandizement *)&v13 initWithDictionary:v4];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WFCoercionVariableAggrandizement)initWithCoercionItemClass:(Class)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v8 = @"CoercionItemClass";
  id v4 = NSStringFromClass(a3);
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  uint64_t v6 = [(WFCoercionVariableAggrandizement *)self initWithDictionary:v5];
  return v6;
}

@end