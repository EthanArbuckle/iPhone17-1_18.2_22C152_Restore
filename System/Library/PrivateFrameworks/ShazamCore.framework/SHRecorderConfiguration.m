@interface SHRecorderConfiguration
- (AMSPromise)promise;
- (NSDictionary)cacheValues;
- (SHRecorderConfiguration)initWithPromise:(id)a3;
- (SHRecorderConfiguration)initWithValues:(id)a3;
- (id)cacheValuesForIdentifier:(id)a3;
- (int64_t)availableRecordersForClientIdentifier:(id)a3;
@end

@implementation SHRecorderConfiguration

- (int64_t)availableRecordersForClientIdentifier:(id)a3
{
  v3 = [(SHRecorderConfiguration *)self cacheValuesForIdentifier:a3];
  v4 = v3;
  if (!v3
    || (int v5 = [v3 containsObject:@"internal"],
        (int v6 = [v4 containsObject:@"external"]) != 0)
    && (v5 & 1) != 0)
  {
    int64_t v7 = 3;
  }
  else
  {
    uint64_t v8 = 2;
    if (!v6) {
      uint64_t v8 = 0;
    }
    if (v5) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = v8;
    }
  }

  return v7;
}

- (id)cacheValuesForIdentifier:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@.%@", @"recorders", a3];
  int v5 = [(SHRecorderConfiguration *)self cacheValues];
  int v6 = [v5 objectForKeyedSubscript:v4];
  int64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(SHRecorderConfiguration *)self cacheValues];
    id v8 = [v9 objectForKeyedSubscript:@"recorders"];
  }
  return v8;
}

- (SHRecorderConfiguration)initWithValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRecorderConfiguration;
  int v6 = [(SHRecorderConfiguration *)&v9 init];
  int64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cacheValues, a3);
  }

  return v7;
}

- (SHRecorderConfiguration)initWithPromise:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHRecorderConfiguration;
  int v6 = [(SHRecorderConfiguration *)&v13 init];
  int64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_promise, a3);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy_;
    v11[4] = __Block_byref_object_dispose_;
    v12 = v7;
    promise = v7->_promise;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__SHRecorderConfiguration_initWithPromise___block_invoke;
    v10[3] = &unk_2647E5790;
    v10[4] = v11;
    [(AMSPromise *)promise addSuccessBlock:v10];
    _Block_object_dispose(v11, 8);
  }
  return v7;
}

void __43__SHRecorderConfiguration_initWithPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    id v9 = v3;
    id v5 = v3;
    int v6 = (void *)v4[1];
    v4[1] = v5;
    int64_t v7 = v4;

    id v8 = (void *)v7[2];
    v7[2] = 0;

    id v3 = v9;
  }
}

- (NSDictionary)cacheValues
{
  return self->_cacheValues;
}

- (AMSPromise)promise
{
  return self->_promise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_cacheValues, 0);
}

@end