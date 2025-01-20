@interface TPSContentStatusCondition
+ (id)_contextualEventFromConditionDictionary:(id)a3;
- (TPSContentStatusCondition)init;
- (id)_valuesFromValuesArray:(id)a3;
- (id)targetingValidations;
@end

@implementation TPSContentStatusCondition

- (id)targetingValidations
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(TPSCondition *)self values];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  v6 = [(TPSCondition *)self values];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__TPSContentStatusCondition_targetingValidations__block_invoke;
  v9[3] = &unk_1E6E6BB10;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

- (id)_valuesFromValuesArray:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke;
  v13 = &unk_1E6E6BB38;
  v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(id)objc_opt_class() _contextualEventFromConditionDictionary:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
}

+ (id)_contextualEventFromConditionDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 TPSSafeStringForKey:@"contentID"];
  uint64_t v5 = [v3 TPSSafeIntegerForKey:@"statusType"];
  uint64_t v6 = [v3 TPSSafeIntegerForKey:@"status"];

  id v7 = objc_alloc(MEMORY[0x1E4FAF438]);
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  uint64_t v10 = (void *)[v7 initWithEventIdentifier:v9 contentIdentifier:v4 statusType:v5 status:v6];

  return v10;
}

void __49__TPSContentStatusCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[TPSContextualEventValidation alloc] initWithContextualEvent:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (TPSContentStatusCondition)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContentStatusCondition;
  v2 = [(TPSContentStatusCondition *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(TPSCondition *)v2 setType:11];
  }
  return v3;
}

void __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for content status condition: %@", (uint8_t *)&v2, 0xCu);
}

@end