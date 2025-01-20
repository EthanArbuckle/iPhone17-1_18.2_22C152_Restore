@interface FCHeldPBCodableFetchedValueDescriptor
- (BOOL)isValue:(id)a3 equalToValue:(id)a4;
- (Class)codableClass;
- (FCContentContext)contentContext;
- (FCFetchedValueManager)resourceConfigurationManager;
- (FCHeldPBCodableFetchedValueDescriptor)init;
- (FCHeldPBCodableFetchedValueDescriptor)initWithCodableClass:(Class)a3 contentContext:(id)a4 resourceConfigurationManager:(id)a5;
- (id)fastCachedValue;
- (id)inputManagers;
- (void)_processFetchOperationResult:(id)a3 withBlock:(id)a4;
- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCHeldPBCodableFetchedValueDescriptor

uint64_t __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke_2;
  v4[3] = &unk_1E5B58E78;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 _processFetchOperationResult:a2 withBlock:v4];
}

- (void)_processFetchOperationResult:(id)a3 withBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "result");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCHeldPBCodableFetchedValueDescriptor _processFetchOperationResult:withBlock:]";
    __int16 v22 = 2080;
    v23 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v24 = 1024;
    int v25 = 130;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCHeldPBCodableFetchedValueDescriptor _processFetchOperationResult:withBlock:]";
    __int16 v22 = 2080;
    v23 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v24 = 1024;
    int v25 = 131;
    __int16 v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v8 = [v6 error];
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    v9 = [v6 fetchedObject];
    v10 = objc_msgSend(v9, "fc_onlyObject");
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v12 = [v10 fileURL];
    v13 = (void *)[v11 initWithContentsOfURL:v12];

    v14 = objc_msgSend(objc_alloc(-[FCHeldPBCodableFetchedValueDescriptor codableClass](self, "codableClass")), "initWithData:", v13);
    v15 = [FCShallowCopyPair alloc];
    v16 = [v10 assetHandle];
    v17 = [(FCPair *)v15 initWithFirst:v14 second:v16];

    ((void (**)(id, FCShallowCopyPair *, void *))v7)[2](v7, v17, 0);
  }
}

- (Class)codableClass
{
  return self->_codableClass;
}

uint64_t __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

uint64_t __95__FCHeldPBCodableFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processFetchOperationResult:a2 withBlock:*(void *)(a1 + 40)];
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "left");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCHeldPBCodableFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v15 = 2080;
    v16 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v17 = 1024;
    int v18 = 121;
    __int16 v19 = 2114;
    v20 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "right");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCHeldPBCodableFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v15 = 2080;
    v16 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v17 = 1024;
    int v18 = 122;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v7 = [v5 first];
  v8 = [v6 first];
  char v9 = [v7 isEqual:v8];

  return v9;
}

- (FCHeldPBCodableFetchedValueDescriptor)initWithCodableClass:(Class)a3 contentContext:(id)a4 resourceConfigurationManager:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "codableClass");
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:]";
    __int16 v20 = 2080;
    uint64_t v21 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v22 = 1024;
    int v23 = 35;
    __int16 v24 = 2114;
    int v25 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:]";
    __int16 v20 = 2080;
    uint64_t v21 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v22 = 1024;
    int v23 = 36;
    __int16 v24 = 2114;
    int v25 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "resourceConfigurationManager");
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:]";
    __int16 v20 = 2080;
    uint64_t v21 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v22 = 1024;
    int v23 = 37;
    __int16 v24 = 2114;
    int v25 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v17.receiver = self;
  v17.super_class = (Class)FCHeldPBCodableFetchedValueDescriptor;
  id v11 = [(FCFetchedValueDescriptor *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_codableClass = a3;
    objc_storeStrong((id *)&v11->_contentContext, a4);
    objc_storeStrong((id *)&v12->_resourceConfigurationManager, a5);
  }

  return v12;
}

- (id)fastCachedValue
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__58;
  objc_super v17 = __Block_byref_object_dispose__58;
  id v18 = 0;
  uint64_t v3 = [(FCHeldPBCodableFetchedValueDescriptor *)self resourceConfigurationManager];
  uint64_t v4 = [v3 value];

  if (v4)
  {
    id v5 = [FCResourcesFetchOperation alloc];
    id v6 = [(FCHeldPBCodableFetchedValueDescriptor *)self contentContext];
    v7 = [v4 resourceID];
    v19[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v9 = [(FCResourcesFetchOperation *)v5 initWithContext:v6 resourceIDs:v8 downloadAssets:0];

    [(FCFetchOperation *)v9 setCachePolicy:3];
    [(FCFetchOperation *)v9 setCanSendFetchCompletionSynchronously:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke;
    v12[3] = &unk_1E5B58EA0;
    v12[4] = self;
    v12[5] = &v13;
    [(FCFetchOperation *)v9 setFetchCompletionBlock:v12];
    [(FCOperation *)v9 start];
    [(FCResourcesFetchOperation *)v9 waitUntilFinished];
  }
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)inputManagers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(FCHeldPBCodableFetchedValueDescriptor *)self resourceConfigurationManager];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (FCFetchedValueManager)resourceConfigurationManager
{
  return self->_resourceConfigurationManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a3) {
    uint64_t v9 = a3 == 1;
  }
  else {
    uint64_t v9 = 5;
  }
  id v10 = [(FCHeldPBCodableFetchedValueDescriptor *)self resourceConfigurationManager];
  id v11 = [v10 value];

  v12 = [FCResourcesFetchOperation alloc];
  uint64_t v13 = [(FCHeldPBCodableFetchedValueDescriptor *)self contentContext];
  v14 = [v11 resourceID];
  v24[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v16 = [(FCResourcesFetchOperation *)v12 initWithContext:v13 resourceIDs:v15 downloadAssets:1];

  [(FCOperation *)v16 setQualityOfService:a4];
  [(FCFetchOperation *)v16 setCachePolicy:v9];
  -[FCFetchOperation setMaximumCachedAge:](v16, "setMaximumCachedAge:", (double)[v11 refreshRate]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  __int16 v20 = __95__FCHeldPBCodableFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke;
  uint64_t v21 = &unk_1E5B4CC58;
  __int16 v22 = self;
  id v23 = v8;
  id v17 = v8;
  [(FCFetchOperation *)v16 setFetchCompletionBlock:&v18];
  [(FCOperation *)v16 start];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceConfigurationManager, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

- (FCHeldPBCodableFetchedValueDescriptor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCHeldPBCodableFetchedValueDescriptor init]";
    __int16 v9 = 2080;
    id v10 = "FCHeldPBCodableFetchedValueDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 28;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCHeldPBCodableFetchedValueDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

@end