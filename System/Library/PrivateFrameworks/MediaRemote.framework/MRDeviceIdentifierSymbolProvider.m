@interface MRDeviceIdentifierSymbolProvider
+ (id)currentDeviceRoutingSymbolName;
+ (id)sharedProvider;
- (MRDeviceIdentifierSymbolProvider)init;
- (NSMutableDictionary)cache;
- (id)symbolNameForModelID:(id)a3;
- (id)symbolNameForProductIdentifier:(id)a3;
- (os_unfair_lock_s)lock;
@end

@implementation MRDeviceIdentifierSymbolProvider

+ (id)sharedProvider
{
  if (sharedProvider___once != -1) {
    dispatch_once(&sharedProvider___once, &__block_literal_global_108);
  }
  v2 = (void *)sharedProvider___provider;

  return v2;
}

uint64_t __50__MRDeviceIdentifierSymbolProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(MRDeviceIdentifierSymbolProvider);
  uint64_t v1 = sharedProvider___provider;
  sharedProvider___provider = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (MRDeviceIdentifierSymbolProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRDeviceIdentifierSymbolProvider;
  v2 = [(MRDeviceIdentifierSymbolProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    cache = v3->_cache;
    v3->_cache = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)symbolNameForModelID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = [(MRDeviceIdentifierSymbolProvider *)self cache];
    id v7 = [v6 objectForKeyedSubscript:v4];

    os_unfair_lock_unlock(&self->_lock);
    if (!v7)
    {
      v8 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:v4];
      v9 = (void *)MEMORY[0x1E4F6F260];
      v10 = [v8 identifier];
      id v18 = 0;
      v11 = [v9 symbolForTypeIdentifier:v10 withResolutionStrategy:1 variantOptions:1 error:&v18];
      id v12 = v18;

      uint64_t v13 = [v11 name];
      v14 = (void *)v13;
      if (v12)
      {
        v15 = _MRLogForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v20 = v4;
          __int16 v21 = 2114;
          v22 = v8;
          __int16 v23 = 2114;
          id v24 = v12;
          _os_log_error_impl(&dword_194F3C000, v15, OS_LOG_TYPE_ERROR, "Failed to find product symbol with model: %{public}@ uti: %{public}@ error: %{public}@", buf, 0x20u);
        }
      }
      else if (v13)
      {
        os_unfair_lock_lock(&self->_lock);
        v16 = [(MRDeviceIdentifierSymbolProvider *)self cache];
        [v16 setObject:v14 forKeyedSubscript:v4];

        os_unfair_lock_unlock(p_lock);
      }
      id v7 = v14;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)symbolNameForProductIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v9 = [(MRDeviceIdentifierSymbolProvider *)self cache];
    id v10 = [v9 objectForKeyedSubscript:v7];

    os_unfair_lock_unlock(&self->_lock);
    if (!v10)
    {
      v11 = [v7 componentsSeparatedByString:@","];
      id v12 = [v11 firstObject];
      uint64_t v13 = [v11 lastObject];
      v14 = v13;
      if (v12 && v13)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F442D8], "_typeWithBluetoothProductID:vendorID:", objc_msgSend(v13, "intValue"), (unsigned __int16)objc_msgSend(v12, "intValue"));
        v16 = (void *)MEMORY[0x1E4F6F260];
        v17 = [v15 identifier];
        id v25 = 0;
        id v18 = [v16 symbolForTypeIdentifier:v17 withResolutionStrategy:1 variantOptions:1 error:&v25];
        id v19 = v25;

        uint64_t v20 = [v18 name];
        __int16 v21 = (void *)v20;
        if (v19)
        {
          v22 = _MRLogForCategory(0);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v27 = v7;
            __int16 v28 = 2114;
            v29 = v15;
            __int16 v30 = 2114;
            id v31 = v19;
            _os_log_error_impl(&dword_194F3C000, v22, OS_LOG_TYPE_ERROR, "Failed to find bluetooth symbol with model: %{public}@ uti: %{public}@ error: %{public}@", buf, 0x20u);
          }
        }
        else if (v20)
        {
          os_unfair_lock_lock(&self->_lock);
          __int16 v23 = [(MRDeviceIdentifierSymbolProvider *)self cache];
          [v23 setObject:v21 forKeyedSubscript:v7];

          os_unfair_lock_unlock(p_lock);
        }
        id v10 = v21;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)currentDeviceRoutingSymbolName
{
  if (currentDeviceRoutingSymbolName_onceToken != -1) {
    dispatch_once(&currentDeviceRoutingSymbolName_onceToken, &__block_literal_global_17_2);
  }
  v2 = (void *)currentDeviceRoutingSymbolName___symbolName;

  return v2;
}

void __66__MRDeviceIdentifierSymbolProvider_currentDeviceRoutingSymbolName__block_invoke()
{
  v0 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
  uint64_t v1 = [v0 identifier];

  id v7 = 0;
  v2 = [MEMORY[0x1E4F6F260] symbolForTypeIdentifier:v1 withResolutionStrategy:1 variantOptions:1 error:&v7];
  id v3 = v7;
  if (v3)
  {
    id v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__MRDeviceIdentifierSymbolProvider_currentDeviceRoutingSymbolName__block_invoke_cold_1((uint64_t)v1, (uint64_t)v3, v4);
    }
  }
  uint64_t v5 = [v2 name];
  v6 = (void *)currentDeviceRoutingSymbolName___symbolName;
  currentDeviceRoutingSymbolName___symbolName = v5;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

void __66__MRDeviceIdentifierSymbolProvider_currentDeviceRoutingSymbolName__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "Failed to find symbol with uti: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end