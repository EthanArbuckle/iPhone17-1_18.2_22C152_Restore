@interface SHBagContract
- (AMSBag)bag;
- (BOOL)throwOnError;
- (NSDictionary)defaultValues;
- (NSMutableDictionary)mutableDefaultValues;
- (NSNumberFormatter)numberFormatter;
- (NSString)baseDictionaryKey;
- (SHBagContract)initWithBaseDictionaryKey:(id)a3 bag:(id)a4;
- (SHBagContract)initWithBaseDictionaryKey:(id)a3 profile:(id)a4 profileVersion:(id)a5;
- (id)defaultValueForKey:(id)a3;
- (id)fullyQualifiedKey:(id)a3;
- (id)numberFromString:(id)a3 forKey:(id)a4;
- (void)BOOLeanBackedByStringForKey:(id)a3 completionHandler:(id)a4;
- (void)addBagKey:(id)a3 defaultValue:(id)a4;
- (void)doubleBackedByStringForKey:(id)a3 completionHandler:(id)a4;
- (void)integerBackedByStringForKey:(id)a3 completionHandler:(id)a4;
- (void)loadBaseDictionary:(id)a3;
- (void)setThrowOnError:(BOOL)a3;
- (void)stringForKey:(id)a3 withCompletionHandler:(id)a4;
- (void)valueForKey:(id)a3 bagValue:(id)a4 completionHandler:(id)a5;
@end

@implementation SHBagContract

- (SHBagContract)initWithBaseDictionaryKey:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHBagContract;
  v8 = [(SHBagContract *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    baseDictionaryKey = v8->_baseDictionaryKey;
    v8->_baseDictionaryKey = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableDefaultValues = v8->_mutableDefaultValues;
    v8->_mutableDefaultValues = v11;

    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = v8->_numberFormatter;
    v8->_numberFormatter = v13;

    [(NSNumberFormatter *)v8->_numberFormatter setNumberStyle:1];
    objc_storeStrong((id *)&v8->_bag, a4);
  }

  return v8;
}

- (SHBagContract)initWithBaseDictionaryKey:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  v8 = (void *)MEMORY[0x263F27C70];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [v8 setSuppressEngagement:1];
  v12 = [MEMORY[0x263F27B28] bagForProfile:v10 profileVersion:v9];

  v13 = [(SHBagContract *)self initWithBaseDictionaryKey:v11 bag:v12];
  return v13;
}

- (void)loadBaseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(SHBagContract *)self bag];
  id v6 = [(SHBagContract *)self baseDictionaryKey];
  id v7 = [v5 dictionaryForKey:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SHBagContract_loadBaseDictionary___block_invoke;
  v9[3] = &unk_2647E56D0;
  id v10 = v4;
  id v8 = v4;
  [v7 valueWithCompletion:v9];
}

uint64_t __36__SHBagContract_loadBaseDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fullyQualifiedKey:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [(SHBagContract *)self baseDictionaryKey];
  id v7 = [v4 stringWithFormat:@"%@/%@", v6, v5];

  return v7;
}

- (NSDictionary)defaultValues
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(SHBagContract *)self mutableDefaultValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = NSString;
        id v10 = [(SHBagContract *)self baseDictionaryKey];
        id v11 = [v9 stringWithFormat:@"%@/", v10];
        v12 = [v8 stringByReplacingOccurrencesOfString:v11 withString:&stru_26DAEBAC8];

        v13 = [(SHBagContract *)self mutableDefaultValues];
        v14 = [v13 objectForKeyedSubscript:v8];
        [v3 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (void)addBagKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v9 = [(SHBagContract *)self fullyQualifiedKey:a3];
  id v7 = [(SHBagContract *)self mutableDefaultValues];
  [v7 setValue:v6 forKey:v9];

  id v8 = [(SHBagContract *)self bag];
  [v8 setDefaultValue:v6 forKey:v9];
}

- (id)defaultValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHBagContract *)self mutableDefaultValues];
  id v6 = [(SHBagContract *)self fullyQualifiedKey:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)integerBackedByStringForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHBagContract *)self bag];
  id v9 = [(SHBagContract *)self fullyQualifiedKey:v6];
  id v10 = [v8 stringForKey:v9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke;
  v16[3] = &unk_2647E56F8;
  v16[4] = self;
  id v17 = v6;
  id v11 = v6;
  v12 = [v10 transformWithBlock:v16];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke_2;
  v14[3] = &unk_2647E5720;
  id v15 = v7;
  id v13 = v7;
  [(SHBagContract *)self valueForKey:v11 bagValue:v12 completionHandler:v14];
}

id __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F27E10];
  v3 = [*(id *)(a1 + 32) numberFromString:a2 forKey:*(void *)(a1 + 40)];
  id v4 = [v2 promiseWithResult:v3];

  return v4;
}

void __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 integerValue], v5);
}

- (void)doubleBackedByStringForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHBagContract *)self bag];
  id v9 = [(SHBagContract *)self fullyQualifiedKey:v6];
  id v10 = [v8 stringForKey:v9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke;
  v16[3] = &unk_2647E56F8;
  v16[4] = self;
  id v17 = v6;
  id v11 = v6;
  v12 = [v10 transformWithBlock:v16];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke_2;
  v14[3] = &unk_2647E5720;
  id v15 = v7;
  id v13 = v7;
  [(SHBagContract *)self valueForKey:v11 bagValue:v12 completionHandler:v14];
}

id __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F27E10];
  v3 = [*(id *)(a1 + 32) numberFromString:a2 forKey:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 promiseWithResult:v3];

  return v4;
}

void __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [a2 doubleValue];
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

- (void)BOOLeanBackedByStringForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHBagContract *)self bag];
  id v9 = [(SHBagContract *)self fullyQualifiedKey:v7];
  id v10 = [v8 stringForKey:v9];
  id v11 = [v10 transformWithBlock:&__block_literal_global];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__SHBagContract_BOOLeanBackedByStringForKey_completionHandler___block_invoke_2;
  v13[3] = &unk_2647E5720;
  id v14 = v6;
  id v12 = v6;
  [(SHBagContract *)self valueForKey:v7 bagValue:v11 completionHandler:v13];
}

id __63__SHBagContract_BOOLeanBackedByStringForKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F27E10];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a2, "BOOLValue"));
  uint64_t v4 = [v2 promiseWithResult:v3];

  return v4;
}

void __63__SHBagContract_BOOLeanBackedByStringForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (void)stringForKey:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHBagContract *)self bag];
  id v9 = [(SHBagContract *)self fullyQualifiedKey:v7];
  id v10 = [v8 stringForKey:v9];

  [(SHBagContract *)self valueForKey:v7 bagValue:v10 completionHandler:v6];
}

- (void)valueForKey:(id)a3 bagValue:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isLoaded])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__SHBagContract_valueForKey_bagValue_completionHandler___block_invoke;
    v16[3] = &unk_2647E5768;
    v16[4] = self;
    id v17 = v8;
    id v18 = v10;
    [v9 valueWithCompletion:v16];
  }
  else
  {
    id v11 = shcore_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SHBagContract *)self fullyQualifiedKey:v8];
      *(_DWORD *)buf = 138412290;
      long long v20 = v12;
      _os_log_impl(&dword_226D94000, v11, OS_LOG_TYPE_ERROR, "%@ was not loaded when we tried to access it, attempting to return default...", buf, 0xCu);
    }
    id v13 = [(SHBagContract *)self defaultValueForKey:v8];
    if (!v13)
    {
      id v14 = shcore_log_object();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [(SHBagContract *)self fullyQualifiedKey:v8];
        *(_DWORD *)buf = 138412290;
        long long v20 = v15;
        _os_log_impl(&dword_226D94000, v14, OS_LOG_TYPE_ERROR, "NO DEFAULT SUPPLIED for %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void *, void))v10 + 2))(v10, v13, 0);
  }
}

void __56__SHBagContract_valueForKey_bagValue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v7 && [*(id *)(a1 + 32) throwOnError])
    {
      id v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF498];
      objc_super v16 = [NSString stringWithFormat:@"Failed to fetch key %@ with error %@", *(void *)(a1 + 40), v8];
      id v17 = [v14 exceptionWithName:v15 reason:v16 userInfo:0];

      objc_exception_throw(v17);
    }
    id v6 = [*(id *)(a1 + 32) defaultValueForKey:*(void *)(a1 + 40)];
    id v9 = shcore_log_object();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10)
      {
        id v11 = [*(id *)(a1 + 32) fullyQualifiedKey:*(void *)(a1 + 40)];
        *(_DWORD *)buf = 138412546;
        long long v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        _os_log_impl(&dword_226D94000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch key %@ from bag with error %@, using default", buf, 0x16u);
      }
      v6;
      id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      if (v10)
      {
        id v13 = [*(id *)(a1 + 32) fullyQualifiedKey:*(void *)(a1 + 40)];
        *(_DWORD *)buf = 138412546;
        long long v19 = v13;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        _os_log_impl(&dword_226D94000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch key %@ from bag with error %@, NO DEFAULT SUPPLIED", buf, 0x16u);
      }
      id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v12();
  }
}

- (id)numberFromString:(id)a3 forKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHBagContract *)self numberFormatter];
  id v9 = [v8 numberFromString:v6];

  if (v9)
  {
    id v10 = v9;
    goto LABEL_10;
  }
  id v10 = [(SHBagContract *)self defaultValueForKey:v7];
  id v11 = shcore_log_object();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v12)
    {
      int v15 = 138412290;
      id v16 = v6;
      id v13 = "Failed to convert string %@, to number using default";
LABEL_8:
      _os_log_impl(&dword_226D94000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v12)
  {
    int v15 = 138412290;
    id v16 = v6;
    id v13 = "Failed to convert string %@, to number using default, NO DEFAULT SUPPLIED";
    goto LABEL_8;
  }

LABEL_10:
  return v10;
}

- (BOOL)throwOnError
{
  return self->_throwOnError;
}

- (void)setThrowOnError:(BOOL)a3
{
  self->_throwOnError = a3;
}

- (NSString)baseDictionaryKey
{
  return self->_baseDictionaryKey;
}

- (NSMutableDictionary)mutableDefaultValues
{
  return self->_mutableDefaultValues;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_mutableDefaultValues, 0);
  objc_storeStrong((id *)&self->_baseDictionaryKey, 0);
}

@end