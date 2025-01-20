@interface U2OwlModel
+ (id)log;
- (NSDictionary)modelMetadata;
- (NSLocale)locale;
- (U2OwlModel)initWithLocale:(id)a3;
- (void)getUnderstandingForQueryString:(id)a3 spans:(id)a4 withCompletionHandler:(id)a5;
- (void)loadWithCompletionHandler:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation U2OwlModel

void __40__U2OwlModel_loadWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_25AC98000, v5, OS_LOG_TYPE_ERROR, "[QPNLU] Failed to load EmbeddingService error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    BOOL v7 = WeakRetained == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, WeakRetained, v3);
  }
}

void __40__U2OwlModel_loadWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    uint64_t v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      _os_log_impl(&dword_25AC98000, v6, OS_LOG_TYPE_DEBUG, "[QPNLU] Failed to load U2Head error: %@", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7 && v5) {
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v3);
    }
  }
  else
  {
    int v8 = [*((id *)WeakRetained + 2) metadata];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"nlx_embeddings_version"];

    uint64_t v11 = [objc_alloc(MEMORY[0x263F3B450]) initWithLocale:v5[3] version:v10];
    v12 = (void *)v5[1];
    v5[1] = v11;

    v13 = (void *)v5[1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __40__U2OwlModel_loadWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_2654837D8;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v14 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v14;
    [v13 loadWithCompletionHandler:v15];

    objc_destroyWeak(&v17);
  }
}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_25AC98000, v5, OS_LOG_TYPE_DEBUG, "[QPNLU] Loading OWLBERT EmbeddingService", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_25AC98000, v6, OS_LOG_TYPE_DEBUG, "[QPNLU] Loading U2Head", v12, 2u);
  }

  u2headWrapper = self->_u2headWrapper;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__U2OwlModel_loadWithCompletionHandler___block_invoke;
  v9[3] = &unk_2654837D8;
  objc_copyWeak(&v11, buf);
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [(U2HeadWrapper *)u2headWrapper loadWithCompletionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__U2OwlModel_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return v2;
}

- (U2OwlModel)initWithLocale:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)U2OwlModel;
  uint64_t v6 = [(U2OwlModel *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    id v8 = [[U2HeadWrapper alloc] initWithLocale:v5];
    u2headWrapper = v7->_u2headWrapper;
    v7->_u2headWrapper = v8;
  }
  return v7;
}

void __17__U2OwlModel_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.queryunderstanding", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (NSDictionary)modelMetadata
{
  v2 = [(U2HeadWrapper *)self->_u2headWrapper metadata];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];

  return (NSDictionary *)v3;
}

- (void)getUnderstandingForQueryString:(id)a3 spans:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = mach_absolute_time();
  embeddingService = self->_embeddingService;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__U2OwlModel_getUnderstandingForQueryString_spans_withCompletionHandler___block_invoke;
  v16[3] = &unk_265483800;
  id v19 = v10;
  uint64_t v20 = v11;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(QUEmbeddingService *)embeddingService getEmbeddingForQuery:v14 completionHandler:v16];
}

void __73__U2OwlModel_getUnderstandingForQueryString_spans_withCompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[8];
  uint64_t v8 = mach_absolute_time();
  if (QPTimingNanosecondsSinceAbsoluteTime_onceToken == -1)
  {
    if (v6)
    {
LABEL_3:
      (*(void (**)(void))(a1[7] + 16))();
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&QPTimingNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_0);
    if (v6) {
      goto LABEL_3;
    }
  }
  v21 = *(void **)(a1[4] + 16);
  unint64_t v22 = (v8 - v7) * QPTimingNanosecondsSinceAbsoluteTime_sTimebaseInfo / *(unsigned int *)algn_26B33210C;
  uint64_t v20 = [v5 embedding];
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  uint64_t v11 = [v5 tokens];
  v12 = [v5 tokenRanges];
  id v13 = [v5 subtokenLenForTokens];
  id v14 = [v5 subtokens];
  id v23 = 0;
  id v15 = [v21 getU2PredictionsForEmbedding:v20 queryString:v9 spans:v10 tokens:v11 tokenRanges:v12 subtokenLenForTokens:v13 subtokens:v14 error:&v23];
  id v16 = v23;

  id v17 = [v5 tokenRanges];
  [v15 setTokenRanges:v17];

  [v15 setEmbeddingsTime:v22];
  uint64_t v18 = a1[8];
  uint64_t v19 = mach_absolute_time();
  if (QPTimingNanosecondsSinceAbsoluteTime_onceToken != -1) {
    dispatch_once(&QPTimingNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_0);
  }
  [v15 setPredictionTime:(v19 - v18) * QPTimingNanosecondsSinceAbsoluteTime_sTimebaseInfo / *(unsigned int *)algn_26B33210C];
  (*(void (**)(void))(a1[7] + 16))();

LABEL_8:
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_u2headWrapper, 0);
  objc_storeStrong((id *)&self->_embeddingService, 0);
}

@end