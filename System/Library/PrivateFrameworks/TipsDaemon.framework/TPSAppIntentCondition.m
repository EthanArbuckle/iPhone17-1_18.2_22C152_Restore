@interface TPSAppIntentCondition
- (TPSAppIntentCondition)init;
- (id)_valuesFromValuesArray:(id)a3;
- (id)targetingValidations;
@end

@implementation TPSAppIntentCondition

- (TPSAppIntentCondition)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAppIntentCondition;
  v2 = [(TPSAppIntentCondition *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TPSCondition *)v2 setType:12];
  }
  return v3;
}

- (id)_valuesFromValuesArray:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  objc_super v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1E6E6B690;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];

  return v7;
}

void __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[TPSAppIntent alloc] initWithDictionary:v3];
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
}

- (id)targetingValidations
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(TPSCondition *)self values];
  objc_super v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(TPSCondition *)self values];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__TPSAppIntentCondition_targetingValidations__block_invoke;
  v9[3] = &unk_1E6E6CA10;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __45__TPSAppIntentCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[TPSAppIntentValidation alloc] initWithAppIntent:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

void __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for app intent condition: %@", (uint8_t *)&v2, 0xCu);
}

@end