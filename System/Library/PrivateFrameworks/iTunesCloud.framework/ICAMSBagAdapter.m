@interface ICAMSBagAdapter
+ (BOOL)_value:(id)a3 matchesExpectedType:(unint64_t)a4;
+ (id)_valueForBagKey:(id)a3 valueType:(unint64_t)a4 fromURLBag:(id)a5 urlBagLoadingError:(id)a6 valueRetrievingError:(id *)a7;
+ (id)_valueFromICURLBag:(id)a3 forKeyPath:(id)a4 valueType:(unint64_t)a5;
- (BOOL)isExpired;
- (ICAMSBagAdapter)initWithRequestContext:(id)a3;
- (ICStoreRequestContext)requestContext;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)_didFinishLoadingBag:(id)a3 error:(id)a4;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation ICAMSBagAdapter

- (id)doubleForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:2];
}

- (id)integerForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:3];
}

- (id)BOOLForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:1];
}

- (id)arrayForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:0];
}

- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (*(_OWORD *)&self->_urlBag == 0)
  {
    if (!self->_pendingBagValuePromises)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      pendingBagValuePromises = self->_pendingBagValuePromises;
      self->_pendingBagValuePromises = v15;
    }
    v12 = [[ICAMSBagValuePromise alloc] initWithBagKey:v6 bagValueType:a4];
    [(NSMutableArray *)self->_pendingBagValuePromises addObject:v12];
    if ([(NSMutableArray *)self->_pendingBagValuePromises count] == 1)
    {
      v17 = +[ICURLBagProvider sharedBagProvider];
      requestContext = self->_requestContext;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __45__ICAMSBagAdapter__bagValueForKey_valueType___block_invoke;
      v19[3] = &unk_1E5ACD950;
      v19[4] = self;
      [v17 getBagForRequestContext:requestContext withCompletionHandler:v19];
    }
    v13 = [MEMORY[0x1E4F4DBE8] bagValueWithKey:v6 valueType:a4 valuePromise:v12];
  }
  else
  {
    v8 = objc_opt_class();
    urlBag = self->_urlBag;
    urlBagLoadingError = self->_urlBagLoadingError;
    id v20 = 0;
    v11 = [v8 _valueForBagKey:v6 valueType:a4 fromURLBag:urlBag urlBagLoadingError:urlBagLoadingError valueRetrievingError:&v20];
    v12 = (ICAMSBagValuePromise *)v20;
    if (v12) {
      [MEMORY[0x1E4F4DBE8] failingBagValueWithKey:v6 valueType:a4 error:v12];
    }
    else {
    v13 = [MEMORY[0x1E4F4DBE8] frozenBagValueWithKey:v6 value:v11 valueType:a4];
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v13;
}

+ (id)_valueForBagKey:(id)a3 valueType:(unint64_t)a4 fromURLBag:(id)a5 urlBagLoadingError:(id)a6 valueRetrievingError:(id *)a7
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v13)
  {
    uint64_t v16 = [a1 _valueFromICURLBag:v13 forKeyPath:v12 valueType:a4];
    if (!v16)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28228];
      v19 = [NSString stringWithFormat:@"No value for bag key '%@'", v12];
      v29[0] = v19;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      v21 = v24;
      uint64_t v22 = -7201;
      goto LABEL_8;
    }
    v17 = (void *)v16;
    if (([a1 _value:v16 matchesExpectedType:a4] & 1) == 0)
    {

      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28228];
      v19 = [NSString stringWithFormat:@"value for bag key '%@' is unexpected type '%@'", v12, objc_opt_class()];
      v27 = v19;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v21 = v18;
      uint64_t v22 = -7202;
LABEL_8:
      id v23 = [v21 errorWithDomain:@"ICError" code:v22 userInfo:v20];

LABEL_9:
      v17 = 0;
      if (!a7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    if (v14)
    {
      id v23 = v14;
      goto LABEL_9;
    }
    v17 = 0;
  }
  id v23 = 0;
  if (a7) {
LABEL_10:
  }
    *a7 = v23;
LABEL_11:

  return v17;
}

+ (id)_valueFromICURLBag:(id)a3 forKeyPath:(id)a4 valueType:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 componentsSeparatedByString:@"/"];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  if (!v11)
  {
    id v14 = 0;
    goto LABEL_30;
  }
  id v12 = (void *)v11;
  if ([v10 count] == 1)
  {
    switch(a5)
    {
      case 0uLL:
        uint64_t v13 = [v8 arrayForBagKey:v12];
        goto LABEL_28;
      case 1uLL:
      case 2uLL:
      case 3uLL:
        uint64_t v13 = [v8 numberForBagKey:v12];
        goto LABEL_28;
      case 4uLL:
        uint64_t v13 = [v8 stringForBagKey:v12];
        goto LABEL_28;
      case 5uLL:
        uint64_t v16 = [v8 urlForBagKey:v12];
        goto LABEL_19;
      case 6uLL:
        uint64_t v13 = [v8 dictionaryForBagKey:v12];
LABEL_28:
        uint64_t v16 = (void *)v13;
        break;
      default:
        uint64_t v16 = 0;
        break;
    }
    goto LABEL_29;
  }
  v15 = [v8 dictionaryForBagKey:v12];
  if ((unint64_t)[v10 count] < 2)
  {
    uint64_t v16 = 0;
    goto LABEL_18;
  }
  id v24 = a1;
  uint64_t v16 = 0;
  uint64_t v17 = 1;
  while (1)
  {
    v18 = v12;
    v19 = v15;
    id v12 = [v10 objectAtIndexedSubscript:v17];

    v15 = [v15 objectForKeyedSubscript:v12];

    if (v17 != [v10 count] - 1) {
      break;
    }
    id v20 = v15;

    uint64_t v16 = v20;
LABEL_12:
    if (++v17 >= (unint64_t)[v10 count]) {
      goto LABEL_18;
    }
  }
  if (v15 && (_NSIsNSDictionary() & 1) != 0) {
    goto LABEL_12;
  }
  v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v24;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Encountered missing bag value at key path %{public}@", buf, 0x16u);
  }

LABEL_18:
LABEL_19:
  if (a5 == 5 && v16 && _NSIsNSString())
  {
    uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v16];

    uint64_t v16 = (void *)v22;
  }
LABEL_29:
  id v14 = v16;

LABEL_30:

  return v14;
}

+ (BOOL)_value:(id)a3 matchesExpectedType:(unint64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 0uLL:
      char isKindOfClass = _NSIsNSArray();
      goto LABEL_8;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      char isKindOfClass = _NSIsNSNumber();
      goto LABEL_8;
    case 4uLL:
      char isKindOfClass = _NSIsNSString();
      goto LABEL_8;
    case 5uLL:
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_8;
    case 6uLL:
      char isKindOfClass = _NSIsNSDictionary();
LABEL_8:
      char v7 = isKindOfClass;
      break;
    default:
      char v7 = 0;
      break;
  }

  return v7 & 1;
}

uint64_t __45__ICAMSBagAdapter__bagValueForKey_valueType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _didFinishLoadingBag:a2 error:a3];
}

- (void)_didFinishLoadingBag:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_urlBag, a3);
  objc_storeStrong((id *)&self->_urlBagLoadingError, a4);
  id v9 = (void *)[(NSMutableArray *)self->_pendingBagValuePromises copy];
  pendingBagValuePromises = self->_pendingBagValuePromises;
  self->_pendingBagValuePromises = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = [v15 bagKey];
        uint64_t v18 = [v15 bagValueType];
        id v22 = 0;
        v19 = [v16 _valueForBagKey:v17 valueType:v18 fromURLBag:v7 urlBagLoadingError:v8 valueRetrievingError:&v22];
        id v20 = v22;

        if (v20) {
          [v15 finishWithError:v20];
        }
        else {
          [v15 finishWithResult:v19];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
}

- (ICAMSBagAdapter)initWithRequestContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAMSBagAdapter;
  id v6 = [(ICAMSBagAdapter *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_requestContext, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_urlBagLoadingError, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);

  objc_storeStrong((id *)&self->_pendingBagValuePromises, 0);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke;
  v12[3] = &unk_1E5ACD2F0;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  uint64_t v6 = MEMORY[0x1A6240BF0](v12);
  id v7 = (void *)v6;
  if (*(_OWORD *)&self->_urlBag == 0)
  {
    id v8 = +[ICURLBagProvider sharedBagProvider];
    requestContext = self->_requestContext;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_3;
    v10[3] = &unk_1E5AC9E30;
    v10[4] = self;
    id v11 = v7;
    [v8 getBagForRequestContext:requestContext withCompletionHandler:v10];
  }
  else
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

void __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_2;
    v3[3] = &unk_1E5AC8478;
    id v4 = *(id *)(a1 + 40);
    [v1 createAMSSnapshotBagWithCompletion:v3];
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
}

uint64_t __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _didFinishLoadingBag:a2 error:a3];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)URLForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:5];
}

- (id)stringForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:4];
}

- (id)dictionaryForKey:(id)a3
{
  return [(ICAMSBagAdapter *)self _bagValueForKey:a3 valueType:6];
}

- (NSString)profileVersion
{
  v2 = [(ICRequestContext *)self->_requestContext clientInfo];
  v3 = [v2 bagProfileVersion];

  return (NSString *)v3;
}

- (NSString)profile
{
  v2 = [(ICRequestContext *)self->_requestContext clientInfo];
  v3 = [v2 bagProfile];

  return (NSString *)v3;
}

- (NSDate)expirationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urlBag = self->_urlBag;
  if (urlBag)
  {
    id v5 = [(ICURLBag *)urlBag expirationDate];
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return (NSDate *)v5;
}

- (BOOL)isExpired
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urlBag = self->_urlBag;
  if (urlBag) {
    BOOL v5 = [(ICURLBag *)urlBag isExpired];
  }
  else {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

@end