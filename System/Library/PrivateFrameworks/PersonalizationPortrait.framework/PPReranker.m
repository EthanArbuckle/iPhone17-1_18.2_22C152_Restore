@interface PPReranker
- (PPReranker)init;
- (PPReranker)initWithNamedEntityStore:(id)a3;
- (id)_lazyLoadEntityRankMapWithError:(id *)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)rerankedMediaItems:(id)a3 error:(id *)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPReranker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock, 0);
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    v4 = self->_clientFeedbackHelper;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  v7 = pp_reranker_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138739971;
    id v9 = v5;
    _os_log_debug_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEBUG, "received feedback: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (id)rerankedMediaItems:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PPReranker.m", 97, @"Invalid parameter not satisfying: %@", @"mediaItems" object file lineNumber description];
  }
  int v8 = pp_locations_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = pp_locations_signpost_handle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPReranker.rerankedMediaItems", (const char *)&unk_18CB1211E, buf, 2u);
  }

  id v27 = 0;
  v12 = [(PPReranker *)self _lazyLoadEntityRankMapWithError:&v27];
  id v13 = v27;
  v14 = v13;
  if (v12)
  {
    v15 = pp_reranker_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v7 count];
      uint64_t v17 = [v12 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v29 = v16;
      __int16 v30 = 2048;
      uint64_t v31 = v17;
      _os_log_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEFAULT, "reranking %tu items with %tu entities", buf, 0x16u);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__PPReranker_rerankedMediaItems_error___block_invoke;
    v24[3] = &unk_1E550EA90;
    id v25 = v12;
    SEL v26 = a2;
    [v7 enumerateObjectsUsingBlock:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__PPReranker_rerankedMediaItems_error___block_invoke_2;
    v23[3] = &__block_descriptor_40_e37_q24__0__INMediaItem_8__INMediaItem_16l;
    v23[4] = a2;
    v18 = [v7 sortedArrayUsingComparator:v23];
    v19 = pp_locations_signpost_handle();
    v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18CAA6000, v20, OS_SIGNPOST_INTERVAL_END, v9, "PPReranker.rerankedMediaItems", (const char *)&unk_18CB1211E, buf, 2u);
    }
  }
  else
  {
    v18 = 0;
    if (a4) {
      *a4 = v13;
    }
  }

  return v18;
}

void __39__PPReranker_rerankedMediaItems_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 title];
  v6 = [v5 lowercaseString];
  id v7 = [v3 objectForKeyedSubscript:v6];
  [v7 doubleValue];
  double v9 = v8 + 0.0;

  uint64_t v10 = *(void **)(a1 + 32);
  v11 = [v4 artist];
  v12 = [v11 lowercaseString];
  id v13 = [v10 objectForKeyedSubscript:v12];
  [v13 doubleValue];
  double v15 = v9 + v14;

  uint64_t v16 = *(const void **)(a1 + 40);
  id v17 = [NSNumber numberWithDouble:v15];
  objc_setAssociatedObject(v4, v16, v17, (void *)1);
}

int64_t __39__PPReranker_rerankedMediaItems_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(const void **)(a1 + 32);
  id v6 = a3;
  id v7 = objc_getAssociatedObject(a2, v5);
  double v8 = objc_getAssociatedObject(v6, *(const void **)(a1 + 32));

  [v7 doubleValue];
  double v10 = v9;
  [v8 doubleValue];
  int64_t v12 = +[PPUtils reverseCompareDouble:v10 withDouble:v11];

  return v12;
}

- (id)_lazyLoadEntityRankMapWithError:(id *)a3
{
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5375;
  v18 = __Block_byref_object_dispose__5376;
  id v19 = 0;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__5375;
  int64_t v12 = __Block_byref_object_dispose__5376;
  id v13 = 0;
  dataLock = self->_dataLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke;
  v7[3] = &unk_1E550EA68;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  [(_PASLock *)dataLock runWithLockAcquired:v7];
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v5 = v3 + 1;
  id v4 = v3[1];
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
  else
  {
    id v6 = pp_reranker_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEFAULT, "loading the entity to rank map.", buf, 2u);
    }

    id v7 = objc_opt_new();
    [v7 setLimit:500];
    uint64_t v8 = objc_opt_new();
    double v9 = *(void **)(*(void *)(a1 + 32) + 8);
    id v21 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke_11;
    v19[3] = &unk_1E550EA40;
    id v10 = v8;
    id v20 = v10;
    char v11 = [v9 iterRankedNamedEntitiesWithQuery:v7 error:&v21 block:v19];
    id v12 = v21;
    if (v11)
    {
      objc_storeStrong(v5, v8);
      id v13 = *v5;
      uint64_t v14 = a1 + 40;
    }
    else
    {
      double v15 = pp_reranker_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_error_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_ERROR, "failed to get ranked named entities with query: %@ error: %@", buf, 0x16u);
      }

      uint64_t v14 = a1 + 48;
      id v13 = v12;
    }
    uint64_t v16 = *(void *)(*(void *)v14 + 8);
    id v17 = v13;
    v18 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
}

void __46__PPReranker__lazyLoadEntityRankMapWithError___block_invoke_11(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  id v4 = a2;
  [v4 score];
  objc_msgSend(v3, "numberWithDouble:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 item];

  id v7 = [v6 name];
  uint64_t v8 = [v7 lowercaseString];
  [v5 setObject:v9 forKeyedSubscript:v8];
}

- (PPReranker)initWithNamedEntityStore:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPReranker;
  id v6 = [(PPReranker *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_namedEntityStore, a3);
    uint64_t v8 = [[PPClientFeedbackHelper alloc] initWithParentObject:v7];
    clientFeedbackHelper = v7->_clientFeedbackHelper;
    v7->_clientFeedbackHelper = v8;

    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    char v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    dataLock = v7->_dataLock;
    v7->_dataLock = (_PASLock *)v12;
  }
  return v7;
}

- (PPReranker)init
{
  v3 = objc_opt_new();
  id v4 = [(PPReranker *)self initWithNamedEntityStore:v3];

  return v4;
}

@end