@interface TPSDeviceCapabilityCondition
- (TPSDeviceCapabilityCondition)init;
- (id)_valuesFromValuesArray:(id)a3;
- (id)targetingValidations;
- (id)targetingValidationsForType:(int64_t)a3;
@end

@implementation TPSDeviceCapabilityCondition

- (id)_valuesFromValuesArray:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1E6E6B690;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];

  return v7;
}

- (id)targetingValidations
{
  return [(TPSDeviceCapabilityCondition *)self targetingValidationsForType:0];
}

void __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[TPSDeviceCapability alloc] initWithDictionary:v3];
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    v5 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
}

- (TPSDeviceCapabilityCondition)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSDeviceCapabilityCondition;
  v2 = [(TPSDeviceCapabilityCondition *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(TPSCondition *)v2 setType:1];
  }
  return v3;
}

- (id)targetingValidationsForType:(int64_t)a3
{
  objc_super v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [(TPSCondition *)self values];
  v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v8 = (void *)MEMORY[0x1E4F1CA60];
  v9 = [(TPSCondition *)self values];
  id v10 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

  v11 = [(TPSCondition *)self values];
  BOOL v12 = a3 == 1;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke;
  v23 = &unk_1E6E6C670;
  BOOL v27 = a3 == 0;
  id v13 = v10;
  id v24 = v13;
  v26 = &v29;
  BOOL v28 = v12;
  id v14 = v7;
  id v25 = v14;
  [v11 enumerateObjectsUsingBlock:&v20];

  if (objc_msgSend(v13, "count", v20, v21, v22, v23))
  {
    v15 = [(TPSDeviceCapabilityValidation *)[TPSGestaltValidation alloc] initWithQueries:v13];
    [(TPSTargetingValidation *)v15 setJoinType:[(TPSCondition *)self joinType]];
    [v14 insertObject:v15 atIndex:0];
  }
  if (*((unsigned char *)v30 + 24))
  {
    v16 = objc_alloc_init(TPSTargetingValidation);
    [v14 insertObject:v16 atIndex:0];
  }
  v17 = v25;
  id v18 = v14;

  _Block_object_dispose(&v29, 8);

  return v18;
}

void __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  if (v4 == 2)
  {
    v8 = +[TPSCustomCapabilityValidationBuilder targetValidationForCapability:v3];
    if (*(unsigned char *)(a1 + 56)
      || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v11 = 0) : (v11 = v8),
          *(unsigned __int8 *)(a1 + 57) == [v11 isRegistrable]))
    {
      [*(id *)(a1 + 40) addObject:v8];
    }
    goto LABEL_13;
  }
  if (v4 != 1)
  {
    BOOL v12 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_1(v3);
    }
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = [v3 key];
    if (v5)
    {
      id v6 = (void *)v5;
      v7 = [v3 value];

      if (v7)
      {
        v8 = [v3 value];
        v9 = *(void **)(a1 + 32);
        id v10 = [v3 key];
        [v9 setObject:v8 forKeyedSubscript:v10];

LABEL_13:
        goto LABEL_19;
      }
    }
    BOOL v12 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_2(v3);
    }
LABEL_18:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_19:
}

void __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_1(void *a1)
{
  v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0(&dword_1E4492000, v2, v3, "Unknown Device Capability Type: %@", v4, v5, v6, v7, 2u);
}

void __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_2(void *a1)
{
  v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0(&dword_1E4492000, v2, v3, "Invalid Device Capability: %@", v4, v5, v6, v7, 2u);
}

void __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for device capability condition: %@", (uint8_t *)&v2, 0xCu);
}

@end