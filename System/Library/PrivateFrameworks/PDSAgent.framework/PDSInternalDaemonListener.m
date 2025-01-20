@interface PDSInternalDaemonListener
- (PDSInternalDaemonListener)initWithKVStore:(id)a3;
- (PDSKVStore)kvStore;
- (void)kvStateDumpWithCompletion:(id)a3;
- (void)setDataValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5;
- (void)setKvStore:(id)a3;
- (void)setNumberValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5;
- (void)setStringValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5;
- (void)stringRepresentationForKey:(id)a3 withCompletion:(id)a4;
@end

@implementation PDSInternalDaemonListener

- (PDSInternalDaemonListener)initWithKVStore:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PDSInternalDaemonListener.m", 22, @"Invalid parameter not satisfying: %@", @"kvStore" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PDSInternalDaemonListener;
  v7 = [(PDSInternalDaemonListener *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_kvStore, a3);
  }

  return v8;
}

- (void)setStringValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = (void (**)(id, void))a5;
    v10 = [(PDSInternalDaemonListener *)self kvStore];
    [v10 setString:v14 forKey:v8];

    v9[2](v9, 0);
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F5BA30];
    id v13 = a5;
    v9 = [v11 errorWithDomain:v12 code:-305 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(v13, v9);
  }
}

- (void)setNumberValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = (void (**)(id, void))a5;
    v10 = [(PDSInternalDaemonListener *)self kvStore];
    [v10 setNumber:v14 forKey:v8];

    v9[2](v9, 0);
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F5BA30];
    id v13 = a5;
    v9 = [v11 errorWithDomain:v12 code:-305 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(v13, v9);
  }
}

- (void)setDataValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = (void (**)(id, void))a5;
    v10 = [(PDSInternalDaemonListener *)self kvStore];
    [v10 setData:v14 forKey:v8];

    v9[2](v9, 0);
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F5BA30];
    id v13 = a5;
    v9 = [v11 errorWithDomain:v12 code:-305 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(v13, v9);
  }
}

- (void)stringRepresentationForKey:(id)a3 withCompletion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  if (v14)
  {
    v7 = [(PDSInternalDaemonListener *)self kvStore];
    id v8 = [v7 stringForKey:v14];

    if (v8)
    {
      v6[2](v6, v8, 0);
    }
    else
    {
      v9 = [(PDSInternalDaemonListener *)self kvStore];
      v10 = [v9 dataForKey:v14];

      if (v10)
      {
        objc_super v11 = objc_msgSend(v10, "__imHexString");
        v6[2](v6, v11, 0);
      }
      else
      {
        uint64_t v12 = [(PDSInternalDaemonListener *)self kvStore];
        objc_super v11 = [v12 numberForKey:v14];

        if (v11)
        {
          id v13 = [v11 stringValue];
          v6[2](v6, v13, 0);
        }
        else
        {
          v6[2](v6, 0, 0);
        }
      }
    }
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-305 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v8);
  }
}

- (void)kvStateDumpWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v16 = (void (**)(id, id, void))a3;
  v4 = [(PDSInternalDaemonListener *)self kvStore];
  v5 = [v4 allStoredValues];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v7 objectForKeyedSubscript:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 setObject:v13 forKeyedSubscript:v12];
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 stringValue];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
          uint64_t v14 = objc_msgSend(v13, "__imHexString");
        }
        v15 = (void *)v14;
        [v6 setObject:v14 forKeyedSubscript:v12];

LABEL_13:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v16[2](v16, v6, 0);
}

- (PDSKVStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end