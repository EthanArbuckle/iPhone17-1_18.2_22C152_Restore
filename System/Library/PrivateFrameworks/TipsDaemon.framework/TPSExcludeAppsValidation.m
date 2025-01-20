@interface TPSExcludeAppsValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSExcludeAppsValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(TPSTargetingValidation *)self arrayValue];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke;
  v15[3] = &unk_1E6E6B690;
  id v7 = v6;
  id v16 = v7;
  [v5 enumerateObjectsUsingBlock:v15];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_5;
  aBlock[3] = &unk_1E6E6C160;
  aBlock[4] = self;
  id v8 = v4;
  id v14 = v8;
  v9 = _Block_copy(aBlock);
  if ([v7 count])
  {
    v10 = [(TPSTargetingValidation *)self name];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_8;
    v11[3] = &unk_1E6E6B5A8;
    id v12 = v9;
    +[TPSTargetingValidator validateConditions:v7 joinType:1 context:v10 cache:0 completionQueue:0 completionHandler:v11];
  }
  else
  {
    (*((void (**)(void *, uint64_t, void))v9 + 2))(v9, 1, 0);
  }
}

void __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[TPSInstalledAppInfo alloc] initWithDictionary:v3];
    v5 = [[TPSInstalledAppsValidation alloc] initWithInstalledAppInfo:v4];
    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_cold_1((uint64_t)v3, v6);
    }
  }
}

uint64_t __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_5(uint64_t a1, char a2)
{
  id v4 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(a1, a2, v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Unexpected value for exclude app condition: %@", (uint8_t *)&v2, 0xCu);
}

@end