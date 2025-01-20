@interface TPSNRDeviceCapabilityCondition
- (TPSNRDeviceCapabilityCondition)init;
- (id)_valuesFromValuesArray:(id)a3;
- (id)targetingValidations;
@end

@implementation TPSNRDeviceCapabilityCondition

- (id)_valuesFromValuesArray:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1E6E6B690;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];

  return v7;
}

void __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[TPSNRDeviceCapability alloc] initWithDictionary:v3];
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    v5 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
}

- (id)targetingValidations
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(TPSCondition *)self values];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  v7 = [(TPSCondition *)self values];
  v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  v9 = [(TPSCondition *)self values];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke;
  v17[3] = &unk_1E6E6BDE0;
  id v10 = v8;
  id v18 = v10;
  v20 = &v21;
  id v11 = v5;
  id v19 = v11;
  [v9 enumerateObjectsUsingBlock:v17];

  if ([v10 count])
  {
    v12 = [(TPSDeviceCapabilityValidation *)[TPSNRDeviceCapabilityValidation alloc] initWithQueries:v10];
    [(TPSTargetingValidation *)v12 setJoinType:[(TPSCondition *)self joinType]];
    [v11 insertObject:v12 atIndex:0];
  }
  if (*((unsigned char *)v22 + 24))
  {
    v13 = objc_alloc_init(TPSTargetingValidation);
    [v11 insertObject:v13 atIndex:0];
  }
  v14 = v19;
  id v15 = v11;

  _Block_object_dispose(&v21, 8);

  return v15;
}

void __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  if (v4 == 4)
  {
    v8 = +[TPSCustomCapabilityValidationBuilder targetValidationForNRDeviceCapability:v3];
    [*(id *)(a1 + 40) addObject:v8];
    goto LABEL_7;
  }
  if (v4 != 3)
  {
    id v11 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_1(v3);
    }
    goto LABEL_12;
  }
  uint64_t v5 = [v3 key];
  if (!v5
    || (id v6 = (void *)v5,
        [v3 value],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    id v11 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_2(v3);
    }
LABEL_12:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_13;
  }
  v8 = [v3 value];
  v9 = *(void **)(a1 + 32);
  id v10 = [v3 key];
  [v9 setObject:v8 forKeyedSubscript:v10];

LABEL_7:
LABEL_13:
}

- (TPSNRDeviceCapabilityCondition)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSNRDeviceCapabilityCondition;
  v2 = [(TPSNRDeviceCapabilityCondition *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(TPSCondition *)v2 setType:8];
  }
  return v3;
}

void __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_1(void *a1)
{
  v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0(&dword_1E4492000, v2, v3, "Unknown NRDevice Capability Type: %@", v4, v5, v6, v7, 2u);
}

void __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_2(void *a1)
{
  v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0(&dword_1E4492000, v2, v3, "Invalid NRDevice Capability: %@", v4, v5, v6, v7, 2u);
}

void __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for NRDevice capability condition: %@", (uint8_t *)&v2, 0xCu);
}

@end