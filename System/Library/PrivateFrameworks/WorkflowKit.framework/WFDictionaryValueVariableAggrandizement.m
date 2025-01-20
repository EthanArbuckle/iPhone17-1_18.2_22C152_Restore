@interface WFDictionaryValueVariableAggrandizement
- (NSString)dictionaryKey;
- (WFDictionaryValueVariableAggrandizement)initWithDictionary:(id)a3;
- (WFDictionaryValueVariableAggrandizement)initWithDictionaryKey:(id)a3;
- (id)processedContentClasses:(id)a3;
- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4;
@end

@implementation WFDictionaryValueVariableAggrandizement

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__WFDictionaryValueVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v10[3] = &unk_1E6551C70;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 generateCollectionByCoercingToItemClass:v8 completionHandler:v10];
}

void __86__WFDictionaryValueVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [a2 items];
  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    id v9 = [v8 dictionary];
    v10 = [*(id *)(a1 + 32) dictionaryKey];
    id v11 = [v9 objectForKey:v10];

    if (v11)
    {
      id v12 = 0;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F5A948];
      v14 = [*(id *)(a1 + 32) dictionaryKey];
      v15 = [v8 dictionary];
      id v22 = 0;
      id v11 = [v13 evaluateKeyPath:v14 onObject:v15 error:&v22];
      id v12 = v22;

      if (!v11)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_7;
      }
    }
    v16 = (void *)MEMORY[0x1E4F5A8C0];
    v17 = [v8 preferredFileType];
    v18 = [v8 attributionSet];
    v19 = [v16 itemsWithPropertyListObject:v11 preferredDictionaryType:v17 attributionSet:v18];

    uint64_t v20 = *(void *)(a1 + 40);
    v21 = [MEMORY[0x1E4F5A830] collectionWithItems:v19];
    (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, 0);

LABEL_7:
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_8:
}

- (id)processedContentClasses:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return (id)objc_msgSend(v3, "orderedSetWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
}

- (NSString)dictionaryKey
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"DictionaryKey"];

  return (NSString *)v3;
}

- (WFDictionaryValueVariableAggrandizement)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"DictionaryKey"];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = getWFGeneralLogObject();
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
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFDictionaryValueVariableAggrandizement;
    self = [(WFVariableAggrandizement *)&v13 initWithDictionary:v4];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (WFDictionaryValueVariableAggrandizement)initWithDictionaryKey:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"DictionaryKey";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(WFDictionaryValueVariableAggrandizement *)self initWithDictionary:v6];
  return v7;
}

@end