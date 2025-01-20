@interface SSBag
+ (NSMutableDictionary)cache;
+ (SSBag)bagWithProfileConfig:(id)a3;
+ (unint64_t)_AMSBagValueTypeFromSSBagValueType:(unint64_t)a3;
- (BOOL)URLIsTrusted:(id)a3;
- (BOOL)canHandleTrustedDomains;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (SSBagProfileConfig)profileConfig;
- (id)BOOLForKey:(id)a3 error:(id *)a4;
- (id)BOOLPromiseForKey:(id)a3;
- (id)URLForKey:(id)a3 error:(id *)a4;
- (id)URLPromiseForKey:(id)a3;
- (id)_AMSBag;
- (id)_initWithProfile:(id)a3 profileVersion:(id)a4;
- (id)arrayForKey:(id)a3 error:(id *)a4;
- (id)arrayPromiseForKey:(id)a3;
- (id)description;
- (id)dictionaryForKey:(id)a3 error:(id *)a4;
- (id)dictionaryPromiseForKey:(id)a3;
- (id)doubleForKey:(id)a3 error:(id *)a4;
- (id)doublePromiseForKey:(id)a3;
- (id)integerForKey:(id)a3 error:(id *)a4;
- (id)integerPromiseForKey:(id)a3;
- (id)resetCaches;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (id)stringPromiseForKey:(id)a3;
- (void)BOOLForKey:(id)a3 withCompletion:(id)a4;
- (void)URLForKey:(id)a3 withCompletion:(id)a4;
- (void)_bagChanged:(id)a3;
- (void)arrayForKey:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)dictionaryForKey:(id)a3 withCompletion:(id)a4;
- (void)doubleForKey:(id)a3 withCompletion:(id)a4;
- (void)integerForKey:(id)a3 withCompletion:(id)a4;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
- (void)stringForKey:(id)a3 withCompletion:(id)a4;
@end

@implementation SSBag

+ (SSBag)bagWithProfileConfig:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F4DD98]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = [v4 bagKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v10 = [v4 bagKeyForStringRepresentation:v9];
        v11 = v10;
        if (v10)
        {
          uint64_t v12 = objc_msgSend(a1, "_AMSBagValueTypeFromSSBagValueType:", objc_msgSend(v10, "valueType"));
          v13 = [v11 defaultValue];
          [v29 addBagKey:v9 valueType:v12 defaultValue:v13];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  v14 = (void *)MEMORY[0x1E4F4DBE0];
  v15 = [v4 profile];
  v16 = [v4 profileVersion];
  [v14 registerBagKeySet:v29 forProfile:v15 profileVersion:v16];

  id v17 = a1;
  objc_sync_enter(v17);
  v18 = NSString;
  v19 = [v4 profile];
  v20 = [v4 profileVersion];
  v21 = [v18 stringWithFormat:@"%@:%@", v19, v20];

  v22 = [v17 cache];
  v23 = [v22 objectForKeyedSubscript:v21];

  if (!v23)
  {
    id v24 = objc_alloc((Class)v17);
    v25 = [v4 profile];
    v26 = [v4 profileVersion];
    v23 = (void *)[v24 _initWithProfile:v25 profileVersion:v26];

    v27 = [v17 cache];
    [v27 setObject:v23 forKeyedSubscript:v21];
  }
  objc_sync_exit(v17);

  return (SSBag *)v23;
}

- (id)_initWithProfile:(id)a3 profileVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SSBag;
  uint64_t v9 = [(SSBag *)&v15 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong(p_isa + 2, a4);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v12 = *MEMORY[0x1E4F4DA08];
    v13 = [p_isa _AMSBag];
    [v11 addObserver:p_isa selector:sel__bagChanged_ name:v12 object:v13];
  }
  return p_isa;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SSBag;
  [(SSBag *)&v4 dealloc];
}

+ (NSMutableDictionary)cache
{
  if (cache_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&cache_ss_once_token___COUNTER__, &__block_literal_global_9);
  }
  v2 = (void *)cache_ss_once_object___COUNTER__;
  return (NSMutableDictionary *)v2;
}

void __14__SSBag_cache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)cache_ss_once_object___COUNTER__;
  cache_ss_once_object___COUNTER__ = (uint64_t)v0;
}

- (NSDate)expirationDate
{
  v2 = [(SSBag *)self _AMSBag];
  v3 = [v2 expirationDate];

  return (NSDate *)v3;
}

- (BOOL)isExpired
{
  v2 = [(SSBag *)self _AMSBag];
  char v3 = [v2 isExpired];

  return v3;
}

- (SSBagProfileConfig)profileConfig
{
  char v3 = objc_alloc_init(SSMutableBagProfileConfig);
  objc_super v4 = [(SSBag *)self _AMSBag];
  v5 = [v4 profile];
  [(SSBagProfileConfig *)v3 setProfile:v5];

  uint64_t v6 = [(SSBag *)self _AMSBag];
  id v7 = [v6 profileVersion];
  [(SSBagProfileConfig *)v3 setProfileVersion:v7];

  id v8 = (void *)[(SSMutableBagProfileConfig *)v3 copy];
  return (SSBagProfileConfig *)v8;
}

- (id)resetCaches
{
  return +[SSBinaryPromise promiseWithSuccess];
}

- (BOOL)URLIsTrusted:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 scheme];
  char v6 = [v5 isEqualToString:@"data"];

  if (v6)
  {
    LOBYTE(v7) = 1;
    goto LABEL_35;
  }
  id v8 = [v4 host];
  uint64_t v9 = objc_alloc_init(SSPromise);
  v10 = [(SSPromise *)v9 completionHandlerAdapter];
  [(SSBag *)self arrayForKey:@"trustedDomains" withCompletion:v10];

  id v38 = 0;
  v11 = [(SSPromise *)v9 resultWithError:&v38];
  id v12 = v38;
  if (v12)
  {
    id v13 = +[SSLogConfig sharedBagCacheConfig];
    if (!v13)
    {
      id v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (!v17) {
      goto LABEL_15;
    }
    long long v33 = v11;
    v18 = objc_opt_class();
    int v40 = 138543618;
    v41 = v18;
    __int16 v42 = 2114;
    id v43 = v12;
    id v19 = v18;
    LODWORD(v32) = 22;
    id v7 = (void *)_os_log_send_and_compose_impl();

    if (v7)
    {
      v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v40, v32);
      free(v7);
      SSFileLog(v13, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      v11 = v33;
LABEL_15:

LABEL_30:
      LOBYTE(v7) = 0;
      goto LABEL_33;
    }
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v11;
    uint64_t v26 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (!v26) {
      goto LABEL_30;
    }
    uint64_t v27 = v26;
    long long v33 = v11;
    uint64_t v28 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v13);
        }
        long long v30 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v30 length])
        {
          if ([v30 hasPrefix:@"."])
          {
            if ([v8 hasSuffix:v30]) {
              goto LABEL_31;
            }
          }
          else if (![v8 caseInsensitiveCompare:v30])
          {
LABEL_31:
            LOBYTE(v7) = 1;
            goto LABEL_32;
          }
        }
      }
      uint64_t v27 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v27) {
        continue;
      }
      break;
    }
    LOBYTE(v7) = 0;
  }
LABEL_32:
  v11 = v33;
LABEL_33:

  if (v12) {
    LOBYTE(v7) = 0;
  }
LABEL_35:

  return (char)v7;
}

- (void)arrayForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 arrayForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__SSBag_arrayForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9E20;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __36__SSBag_arrayForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)BOOLForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 BOOLForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__SSBag_BOOLForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9E48;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __35__SSBag_BOOLForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)dictionaryForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 dictionaryForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__SSBag_dictionaryForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9E70;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __41__SSBag_dictionaryForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)doubleForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 doubleForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__SSBag_doubleForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9E48;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __37__SSBag_doubleForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)integerForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 integerForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__SSBag_integerForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9E48;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __38__SSBag_integerForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)stringForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 stringForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__SSBag_stringForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9E98;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __37__SSBag_stringForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)URLForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSBag *)self _AMSBag];
  uint64_t v9 = [v8 URLForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__SSBag_URLForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E5BA9EC0;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

uint64_t __34__SSBag_URLForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (id)description
{
  v2 = [(SSBag *)self _AMSBag];
  char v3 = [v2 description];

  return v3;
}

- (id)arrayPromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self arrayForKey:v4 withCompletion:v6];

  return v5;
}

- (id)BOOLPromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self BOOLForKey:v4 withCompletion:v6];

  return v5;
}

- (id)dictionaryPromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self dictionaryForKey:v4 withCompletion:v6];

  return v5;
}

- (id)doublePromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self doubleForKey:v4 withCompletion:v6];

  return v5;
}

- (id)integerPromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self integerForKey:v4 withCompletion:v6];

  return v5;
}

- (id)stringPromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self stringForKey:v4 withCompletion:v6];

  return v5;
}

- (id)URLPromiseForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  id v6 = [(SSPromise *)v5 nilValueCompletionHandlerAdapter];
  [(SSBag *)self URLForKey:v4 withCompletion:v6];

  return v5;
}

- (id)arrayForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self arrayPromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (id)BOOLForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self BOOLPromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (id)dictionaryForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self dictionaryPromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (id)doubleForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self doublePromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (id)integerForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self integerPromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self stringPromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (id)URLForKey:(id)a3 error:(id *)a4
{
  v5 = [(SSBag *)self URLPromiseForKey:a3];
  id v6 = [v5 resultWithError:a4];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v8]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  return v10;
}

- (BOOL)canHandleTrustedDomains
{
  char v3 = objc_alloc_init(SSPromise);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__SSBag_canHandleTrustedDomains__block_invoke;
  v10[3] = &unk_1E5BA9EE8;
  id v4 = v3;
  v11 = v4;
  [(SSBag *)self arrayForKey:@"trustedDomains" withCompletion:v10];
  id v9 = 0;
  v5 = [(SSPromise *)v4 resultWithError:&v9];
  id v6 = v9;
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [v5 count] != 0;
  }

  return v7;
}

uint64_t __32__SSBag_canHandleTrustedDomains__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  if (a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  return [v3 finishWithResult:v5];
}

- (id)_AMSBag
{
  char v3 = (void *)MEMORY[0x1E4F4DBD8];
  id v4 = [(SSBag *)self profile];
  uint64_t v5 = [(SSBag *)self profileVersion];
  id v6 = [v3 bagForProfile:v4 profileVersion:v5];

  return v6;
}

+ (unint64_t)_AMSBagValueTypeFromSSBagValueType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return qword_1A52F63D0[a3 - 1];
  }
}

- (void)_bagChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"SSBagChangedNotification" object:self];
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end