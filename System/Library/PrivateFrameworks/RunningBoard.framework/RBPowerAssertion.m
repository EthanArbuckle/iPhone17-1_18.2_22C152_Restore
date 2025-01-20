@interface RBPowerAssertion
+ (__CFString)_nameForPreventIdleSleepIdentifiers:(uint64_t)a1;
- (RBPowerAssertion)init;
- (id)_calculateNewName;
- (id)_preventIdleSleepIdentifiers;
- (id)description;
- (int)_targetPid;
- (uint64_t)invalidateWithHandler:(uint64_t)a1;
- (void)dealloc;
- (void)updateWithAcquisitionHandler:(void *)a3 invalidationHander:;
@end

@implementation RBPowerAssertion

uint64_t __56__RBPowerAssertion__nameForPreventIdleSleepIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (__CFString)_nameForPreventIdleSleepIdentifiers:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  if ([v2 count])
  {
    if ([v2 count] == 1)
    {
      v3 = [v2 anyObject];
    }
    else
    {
      v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v5 = v2;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) description];
            [v4 addObject:v10];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v7);
      }

      [v4 sortUsingComparator:&__block_literal_global_1];
      unint64_t v11 = [v4 count];
      if (v11 >= 0x14) {
        uint64_t v12 = 20;
      }
      else {
        uint64_t v12 = v11;
      }
      v3 = [MEMORY[0x263F089D8] string];
      if (v12)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          v14 = [v4 objectAtIndexedSubscript:j];
          [(__CFString *)v3 appendFormat:@";%@", v14];
        }
      }
    }
  }
  else
  {
    v3 = &stru_26DA9D688;
  }

  return v3;
}

- (void)updateWithAcquisitionHandler:(void *)a3 invalidationHander:
{
  v33[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    uint64_t v7 = [(id)a1 _targetPid];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    if ((int)v7 < 1 || *(unsigned char *)(a1 + 40))
    {
      v9 = (IOPMAssertionID *)(a1 + 8);
      IOPMAssertionID v8 = *(_DWORD *)(a1 + 8);
      if (v8)
      {
        if (v6)
        {
          v6[2](v6);
          IOPMAssertionID v8 = *v9;
        }
        if (IOPMAssertionRelease(v8))
        {
          v10 = rbs_power_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:]((_DWORD *)(a1 + 8));
          }
        }
        else
        {
          v10 = rbs_ttl_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            IOPMAssertionID v17 = *v9;
            *(_DWORD *)buf = 67240192;
            IOPMAssertionID v27 = v17;
            _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Released power assertion with ID %{public}d", buf, 8u);
          }
        }

        *(_DWORD *)(a1 + 8) = 0;
        long long v18 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = 0;

        long long v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;
      }
    }
    else
    {
      unint64_t v11 = (IOPMAssertionID *)(a1 + 8);
      if (*(_DWORD *)(a1 + 8))
      {
        uint64_t v12 = -[RBPowerAssertion _calculateNewName]((void *)a1);
        if (([*(id *)(a1 + 24) isEqualToString:v12] & 1) == 0)
        {
          v13 = rbs_ttl_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            IOPMAssertionID v14 = *(_DWORD *)(a1 + 8);
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 67240706;
            IOPMAssertionID v27 = v14;
            __int16 v28 = 2114;
            uint64_t v29 = v15;
            __int16 v30 = 2114;
            v31 = v12;
            _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to rename power assertion %{public}d for target %{public}@ to %{public}@", buf, 0x1Cu);
          }

          if (IOPMAssertionSetProperty(*v11, @"AssertName", v12))
          {
            long long v16 = rbs_power_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:](v11);
            }
          }
          objc_storeStrong((id *)(a1 + 24), v12);
        }
      }
      else
      {
        uint64_t v12 = -[RBPowerAssertion _calculateNewName]((void *)a1);
        v20 = [MEMORY[0x263EFF9A0] dictionary];
        v32[0] = @"AssertName";
        v32[1] = @"AssertionOnBehalfOfPID";
        v33[0] = v12;
        uint64_t v21 = [NSNumber numberWithInt:v7];
        v33[1] = v21;
        v22 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
        [v20 addEntriesFromDictionary:v22];

        if (IOPMAssertionDeclareSystemActivityWithProperties())
        {
          v23 = rbs_power_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:](v7);
          }
        }
        else
        {
          v24 = rbs_power_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240448;
            IOPMAssertionID v27 = 0;
            __int16 v28 = 1026;
            LODWORD(v29) = v7;
            _os_log_impl(&dword_226AB3000, v24, OS_LOG_TYPE_DEFAULT, "Acquired process power assertion with ID %{public}d for pid %{public}d", buf, 0xEu);
          }

          uint64_t v25 = [MEMORY[0x263EFF910] date];
          v23 = *(NSObject **)(a1 + 16);
          *(void *)(a1 + 16) = v25;
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
  }
}

- (id)_calculateNewName
{
  id v1 = a1;
  if (a1)
  {
    id v2 = (__CFString *)a1[4];
    if (!v2) {
      id v2 = @"unknown";
    }
    v3 = v2;
    v4 = [v1 _preventIdleSleepIdentifiers];
    id v5 = +[RBPowerAssertion _nameForPreventIdleSleepIdentifiers:]((uint64_t)RBPowerAssertion, v4);
    id v1 = [(__CFString *)v3 stringByAppendingString:v5];
  }
  return v1;
}

- (RBPowerAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBPowerAssertion;
  result = [(RBPowerAssertion *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (uint64_t)invalidateWithHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && !*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(a1 + 40) = 1;
    -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:](a1, 0, v3);
  }
  return MEMORY[0x270F9A790]();
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"RBPowerAssertionManager.m" lineNumber:207 description:@"invalidate not called"];
  }
  v5.receiver = self;
  v5.super_class = (Class)RBPowerAssertion;
  [(RBPowerAssertion *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_acquisitionDate, 0);
}

- (int)_targetPid
{
  return 0;
}

- (id)_preventIdleSleepIdentifiers
{
  return 0;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [NSString alloc];
  objc_super v5 = [(id)objc_opt_class() description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"<%@| id:%u name:%@ acquisitionDate:%@>", v5, self->_identifier, self->_name, self->_acquisitionDate];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)updateWithAcquisitionHandler:(int)a1 invalidationHander:.cold.1(int a1)
{
  LODWORD(v3) = 67240448;
  HIDWORD(v3) = a1;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_226AB3000, v1, v2, "Error acquiring process power assertion for pid %{public}d: 0x%{public}x", v3);
}

- (void)updateWithAcquisitionHandler:(_DWORD *)a1 invalidationHander:.cold.2(_DWORD *a1)
{
  LODWORD(v3) = 67240448;
  HIDWORD(v3) = *a1;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_226AB3000, v1, v2, "Error renaming power assertion with ID %{public}d: 0x%{public}x", v3);
}

- (void)updateWithAcquisitionHandler:(_DWORD *)a1 invalidationHander:.cold.3(_DWORD *a1)
{
  LODWORD(v3) = 67240448;
  HIDWORD(v3) = *a1;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_226AB3000, v1, v2, "Error releasing power assertion with ID %{public}d: 0x%{public}x", v3);
}

@end