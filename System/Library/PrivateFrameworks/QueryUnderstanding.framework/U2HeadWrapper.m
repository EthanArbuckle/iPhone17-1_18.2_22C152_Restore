@interface U2HeadWrapper
+ (BOOL)useSpotlightResources;
+ (NSBundle)U2HeadBundle;
+ (id)log;
+ (id)signpostLog;
+ (void)setU2HeadBundle:(id)a3;
+ (void)setUseSpotlightResources:(BOOL)a3;
- (NSDictionary)metadata;
- (U2HeadWrapper)initWithLocale:(id)a3;
- (id)argmaxWithIndex:(id)a3;
- (id)assetURL;
- (id)getU2PredictionsForEmbedding:(id)a3 queryString:(id)a4 spans:(id)a5 tokens:(id)a6 tokenRanges:(id)a7 subtokenLenForTokens:(id)a8 subtokens:(id)a9 error:(id *)a10;
- (id)mapLogitsToLabels:(id)a3 queryString:(id)a4 tokens:(id)a5 subtokenLenForTokens:(id)a6 subtokens:(id)a7;
- (vector<float,)getTokenScoresfromScoreTensor:(U2HeadWrapper *)self intentIndex:(SEL)a3 tokens:(id)a4 subtokenLenForTokens:(int)a5 subtokens:(id)a6 scoreFromSubtokenScores:(id)a7;
- (void)loadWithCompletionHandler:(id)a3;
@end

@implementation U2HeadWrapper

- (NSDictionary)metadata
{
  v2 = [(U2Head *)self->_u2Head model];
  v3 = [v2 modelDescription];
  v4 = [v3 metadata];

  return (NSDictionary *)v4;
}

void __43__U2HeadWrapper_loadWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      v23 = v7;
      _os_log_impl(&dword_25AC98000, v8, OS_LOG_TYPE_ERROR, "[QPNLU] Failed to load U2 Model Error: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    v9 = [v5 model];
    v10 = [v9 modelDescription];
    v8 = [v10 metadata];

    v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F00D08]];
    v12 = [v11 componentsSeparatedByString:@"."];
    v13 = [v12 firstObject];
    char v14 = [v13 isEqualToString:@"5"];

    if (v14)
    {
      v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        v23 = v8;
        _os_log_impl(&dword_25AC98000, v15, OS_LOG_TYPE_DEFAULT, "[QPNLU] U2 Model Loaded with metadata: %@", (uint8_t *)&v22, 0xCu);
      }

      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = v5;
      v7 = 0;
      v18 = *(NSObject **)(v16 + 16);
      *(void *)(v16 + 16) = v17;
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QueryParser.QUModelError" code:-9001 userInfo:0];
      v18 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        int v22 = 138412290;
        v23 = v8;
        _os_log_impl(&dword_25AC98000, v18, OS_LOG_TYPE_FAULT, "[QPNLU] Failed to load U2 Model incompatible version. %@", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v19 = [(id)objc_opt_class() signpostLog];
  v20 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, *(const void **)(a1 + 32));

  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_25AC98000, v19, OS_SIGNPOST_INTERVAL_END, v21, "U2Head initialization", (const char *)&unk_25ACA0EB2, (uint8_t *)&v22, 2u);
  }
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__U2HeadWrapper_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[U2HeadWrapper signpostLog]::onceToken != -1) {
    dispatch_once(&+[U2HeadWrapper signpostLog]::onceToken, block);
  }
  v2 = (void *)+[U2HeadWrapper signpostLog]::log;
  return v2;
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__U2HeadWrapper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[U2HeadWrapper log]::onceToken != -1) {
    dispatch_once(&+[U2HeadWrapper log]::onceToken, block);
  }
  v2 = (void *)+[U2HeadWrapper log]::log;
  return v2;
}

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() signpostLog];
  v6 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25AC98000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "U2Head initialization", (const char *)&unk_25ACA0EB2, buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x263F00D98]);
  [v8 setComputeUnits:0];
  [v8 setExperimentalMLE5EngineUsage:0];
  v9 = [(U2HeadWrapper *)self assetURL];
  v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v11;
    _os_log_impl(&dword_25AC98000, v10, OS_LOG_TYPE_DEFAULT, "[QPNLU] Loading U2Head from %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__U2HeadWrapper_loadWithCompletionHandler___block_invoke;
  v13[3] = &unk_265483740;
  v13[4] = self;
  id v12 = v4;
  id v14 = v12;
  +[U2Head loadContentsOfURL:v9 configuration:v8 completionHandler:v13];
}

- (U2HeadWrapper)initWithLocale:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)U2HeadWrapper;
  v6 = [(U2HeadWrapper *)&v9 init];
  os_signpost_id_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locale, a3);
  }

  return v7;
}

- (id)assetURL
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (gUseSpotlightResources)
  {
    v3 = [MEMORY[0x263F78D00] sharedResourcesManager];
    [v3 loadAllParametersForClient:@"Parser" locale:self->_locale];
    id v4 = [v3 resourcesForClient:@"Parser" locale:self->_locale options:&unk_270891EF0];
    id v15 = 0;
    id v5 = [v4 filePathArrayForKey:@"QueryUnderstanding" didFailWithError:&v15];
    id v6 = v15;
    if (v6)
    {
      os_signpost_id_t v7 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_25AC98000, v7, OS_LOG_TYPE_ERROR, "[QPNLU] Failed to find U2 Model in resource Error: %@", buf, 0xCu);
      }
    }
    id v8 = [v5 firstObject];
    if (v8)
    {
      objc_super v9 = [NSURL fileURLWithPath:v8];
    }
    else
    {
      objc_super v9 = 0;
    }
  }
  else
  {
    v10 = (void *)gU2HeadBundle;
    v11 = [(NSLocale *)self->_locale localeIdentifier];
    objc_super v9 = [v10 URLForResource:@"U2Head" withExtension:@"mlmodelc" subdirectory:0 localization:v11];

    if (!v9)
    {
      id v12 = (void *)gU2HeadBundle;
      v13 = [(NSLocale *)self->_locale languageCode];
      objc_super v9 = [v12 URLForResource:@"U2Head" withExtension:@"mlmodelc" subdirectory:0 localization:v13];
    }
  }
  return v9;
}

void __20__U2HeadWrapper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.queryunderstanding", (const char *)[v3 UTF8String]);
  v2 = (void *)+[U2HeadWrapper log]::log;
  +[U2HeadWrapper log]::log = (uint64_t)v1;
}

void __28__U2HeadWrapper_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.spotlight.QueryParser", (const char *)[v3 UTF8String]);
  v2 = (void *)+[U2HeadWrapper signpostLog]::log;
  +[U2HeadWrapper signpostLog]::log = (uint64_t)v1;
}

+ (BOOL)useSpotlightResources
{
  return gUseSpotlightResources;
}

+ (void)setUseSpotlightResources:(BOOL)a3
{
  gUseSpotlightResources = a3;
}

+ (NSBundle)U2HeadBundle
{
  return (NSBundle *)(id)gU2HeadBundle;
}

+ (void)setU2HeadBundle:(id)a3
{
}

- (id)argmaxWithIndex:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  float v6 = 0.0;
  while ([v3 count] > v4)
  {
    os_signpost_id_t v7 = [v3 objectAtIndexedSubscript:v4];
    [v7 floatValue];
    float v9 = v8;

    if (v9 <= v6)
    {
      uint64_t v5 = v5;
    }
    else
    {
      float v6 = v9;
      uint64_t v5 = v4;
    }
    ++v4;
  }
  v10 = [NSNumber numberWithInt:v5];
  v15[0] = v10;
  *(float *)&double v11 = v6;
  id v12 = [NSNumber numberWithFloat:v11];
  v15[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  return v13;
}

- (vector<float,)getTokenScoresfromScoreTensor:(U2HeadWrapper *)self intentIndex:(SEL)a3 tokens:(id)a4 subtokenLenForTokens:(int)a5 subtokens:(id)a6 scoreFromSubtokenScores:(id)a7
{
  uint64_t v13 = *(void *)&a5;
  id v14 = a4;
  id v15 = a6;
  id v45 = a7;
  id v51 = a8;
  uint64_t v16 = (float (**)(id, void *, uint64_t, uint64_t, uint64_t, uint64_t, void **))a9;
  v50 = v15;
  v52 = v14;
  uint64_t v17 = [v15 count];
  uint64_t v18 = [v14 shape];
  v19 = [v18 objectAtIndexedSubscript:3];
  LODWORD(v14) = [v19 intValue];

  uint64_t v43 = (int)v14;
  int v44 = (int)v14;
  std::vector<float>::vector(retstr, v17 * (int)v14);
  LODWORD(v57[0]) = 1065353216;
  std::vector<float>::vector(&v58, [v51 count], v57);
  unint64_t v46 = v17;
  if (v17)
  {
    uint64_t v20 = 0;
    int v48 = 0;
    do
    {
      os_signpost_id_t v21 = objc_msgSend(v45, "objectAtIndexedSubscript:", v20, v43);
      int v22 = [v21 intValue];

      int v47 = v22;
      if (v22 >= 2)
      {
        unint64_t v23 = 0;
        uint64_t v24 = v48;
        uint64_t v25 = -(uint64_t)v22;
        do
        {
          v26 = [v51 objectAtIndexedSubscript:v24];
          uint64_t v27 = [v26 length];
          v28 = [v50 objectAtIndexedSubscript:v20];
          unint64_t v29 = [v28 length];
          *((float *)v58 + v24) = (float)((__PAIR128__(v27, v23) - 1) >> 64) / (float)v29;

          --v23;
          ++v24;
        }
        while (v25 != v23);
      }
      v48 += v47;
      ++v20;
    }
    while (v20 != v46);
  }
  std::vector<float>::vector(v57, v46);
  if (v46)
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v49 = 4 * v43;
    do
    {
      v33 = objc_msgSend(v45, "objectAtIndexedSubscript:", v31, v43);
      uint64_t v34 = [v33 intValue];

      if (v44 >= 1)
      {
        for (uint64_t i = 0; i != v44; *(float *)((char *)&retstr->var0[i++] + v30) = v36)
        {
          __p = 0;
          v55 = 0;
          uint64_t v56 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v58, (uint64_t)v59, (v59 - (unsigned char *)v58) >> 2);
          float v36 = v16[2](v16, v52, v13, i, v32, v34, &__p);
          if (__p)
          {
            v55 = __p;
            operator delete(__p);
          }
          *((float *)v57[0] + v31) = v36 + *((float *)v57[0] + v31);
        }
      }
      uint64_t v32 = (v34 + v32);
      ++v31;
      v30 += v49;
    }
    while (v31 != v46);
    uint64_t v37 = 0;
    v38 = (float *)v57[0];
    var0 = retstr->var0;
    do
    {
      uint64_t v40 = v44;
      v41 = var0;
      if (v44 >= 1)
      {
        do
        {
          float *v41 = *v41 / v38[v37];
          ++v41;
          --v40;
        }
        while (v40);
      }
      ++v37;
      var0 = (float *)((char *)var0 + v49);
    }
    while (v37 != v46);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }

  return result;
}

- (id)mapLogitsToLabels:(id)a3 queryString:(id)a4 tokens:(id)a5 subtokenLenForTokens:(id)a6 subtokens:(id)a7
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v39 = a4;
  id v52 = a5;
  id v45 = a6;
  id v46 = a7;
  v38 = v12;
  v41 = objc_msgSend(v12, "top_arg_ids");
  int v47 = objc_msgSend(v12, "intent_scores");
  int v48 = objc_msgSend(v12, "arg_conf_scores");
  v42 = objc_msgSend(v12, "safety_head_scores");
  uint64_t v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v47;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v41;
    *(_WORD *)&buf[22] = 2112;
    v63 = v48;
    _os_log_impl(&dword_25AC98000, v13, OS_LOG_TYPE_DEBUG, "[QPNLU] got U2output-> intentScores: %@; topArgIds: %@; argConfidenceScores: %@",
      buf,
      0x20u);
  }

  uint64_t v40 = [(U2HeadWrapper *)self argmaxWithIndex:v47];
  uint64_t v43 = [v40 objectAtIndexedSubscript:0];
  int v44 = [v40 objectAtIndexedSubscript:1];
  -[U2HeadWrapper getTokenScoresfromScoreTensor:intentIndex:tokens:subtokenLenForTokens:subtokens:scoreFromSubtokenScores:](self, "getTokenScoresfromScoreTensor:intentIndex:tokens:subtokenLenForTokens:subtokens:scoreFromSubtokenScores:", v48, [v43 intValue], v52, v45, v46, &__block_literal_global_151);
  id v51 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v52, "count"));
  v50 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v52, "count"));
  id v14 = [v48 shape];
  id v15 = [v14 objectAtIndexedSubscript:3];
  int v49 = [v15 intValue];

  uint64_t v16 = 0;
  unint64_t v17 = 0;
  while ([v52 count] > v17)
  {
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    v19 = [MEMORY[0x263EFF980] array];
    unint64_t v53 = v17;
    if (v49 < 1)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      do
      {
        float v22 = v60[v16 + v20];
        if (v22 >= 0.02)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v63) = 0;
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __85__U2HeadWrapper_mapLogitsToLabels_queryString_tokens_subtokenLenForTokens_subtokens___block_invoke;
          v54[3] = &unk_265483788;
          float v58 = v22;
          id v23 = v19;
          id v55 = v23;
          id v24 = v18;
          int v59 = v20;
          id v56 = v24;
          v57 = buf;
          [v23 enumerateObjectsUsingBlock:v54];
          if (!*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            *(float *)&double v25 = v22;
            v26 = [NSNumber numberWithFloat:v25];
            [v23 addObject:v26];

            uint64_t v27 = [NSNumber numberWithInt:v20];
            [v24 addObject:v27];
          }
          _Block_object_dispose(buf, 8);
        }
        else if (v22 > v60[v53 * v49 + (int)v21])
        {
          uint64_t v21 = v20;
        }
        ++v20;
      }
      while (v49 != v20);
    }
    if (![v19 count])
    {
      v28 = [NSNumber numberWithInt:v21];
      [v18 addObject:v28];

      *(float *)&double v29 = v60[v53 * v49 + (int)v21];
      uint64_t v30 = [NSNumber numberWithFloat:v29];
      [v19 addObject:v30];
    }
    uint64_t v31 = (void *)[v18 copy];
    [v51 addObject:v31];

    uint64_t v32 = (void *)[v19 copy];
    [v50 addObject:v32];

    unint64_t v17 = v53 + 1;
    v16 += v49;
  }
  v33 = objc_alloc_init(U2Output);
  [(U2Output *)v33 setIntentId:v43];
  [(U2Output *)v33 setConfidenceScore:v44];
  [(U2Output *)v33 setTokens:v52];
  uint64_t v34 = [v42 objectAtIndexedSubscript:0];
  [(U2Output *)v33 setSafetyScore:v34];

  v35 = (void *)[v51 copy];
  [(U2Output *)v33 setArgIdsForTokens:v35];

  float v36 = (void *)[v50 copy];
  [(U2Output *)v33 setArgScoresForTokens:v36];

  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }

  return v33;
}

void __85__U2HeadWrapper_mapLogitsToLabels_queryString_tokens_subtokenLenForTokens_subtokens___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  float v8 = *(float *)(a1 + 56);
  id v14 = v7;
  [v7 floatValue];
  if (v8 > *(float *)&v9)
  {
    v10 = *(void **)(a1 + 32);
    LODWORD(v9) = *(_DWORD *)(a1 + 56);
    double v11 = [NSNumber numberWithFloat:v9];
    [v10 insertObject:v11 atIndex:a3];

    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
    [v12 insertObject:v13 atIndex:a3];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)getU2PredictionsForEmbedding:(id)a3 queryString:(id)a4 spans:(id)a5 tokens:(id)a6 tokenRanges:(id)a7 subtokenLenForTokens:(id)a8 subtokens:(id)a9 error:(id *)a10
{
  v79[3] = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v53 = a4;
  id v51 = a5;
  id v55 = a6;
  id v52 = a7;
  id v56 = a8;
  id v58 = a9;
  uint64_t v16 = [(id)objc_opt_class() signpostLog];
  unint64_t v17 = [(id)objc_opt_class() signpostLog];
  ptr = self;
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, self);

  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25AC98000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "U2Head prediction", (const char *)&unk_25ACA0EB2, buf, 2u);
  }

  id v46 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v58, "count"));
  v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v58, "count"));
  *(void *)buf = 0;
  v73 = buf;
  uint64_t v74 = 0x2020000000;
  int v75 = 0;
  uint64_t v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v55, "count"));
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __120__U2HeadWrapper_getU2PredictionsForEmbedding_queryString_spans_tokens_tokenRanges_subtokenLenForTokens_subtokens_error___block_invoke;
  v65[3] = &unk_2654837B0;
  id v49 = v20;
  id v66 = v49;
  v71 = buf;
  id v48 = v52;
  id v67 = v48;
  id v47 = v51;
  id v68 = v47;
  id v60 = v46;
  id v69 = v60;
  id v59 = v19;
  id v70 = v59;
  [v56 enumerateObjectsUsingBlock:v65];
  id v64 = 0;
  v61 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_270891EC0 dataType:131104 error:&v64];
  id v21 = v64;
  for (uint64_t i = 0; i != 28; ++i)
  {
    if (i >= *((int *)v73 + 6) + 2) {
      id v23 = &unk_270891F18;
    }
    else {
      id v23 = &unk_270891F30;
    }
    [v61 setObject:v23 atIndexedSubscript:i];
  }
  id v63 = v21;
  id v24 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_270891ED8 dataType:131104 error:&v63];
  id v50 = v63;

  for (uint64_t j = 0; j != 28; ++j)
  {
    if (j)
    {
      if (j - 1 >= (unint64_t)[v60 count])
      {
        uint64_t v27 = 0;
      }
      else
      {
        v26 = [v60 objectAtIndexedSubscript:j - 1];
        uint64_t v27 = [v26 BOOLValue];
      }
      if (j - 1 >= (unint64_t)[v59 count])
      {
        uint64_t v28 = 0;
      }
      else
      {
        double v29 = [v59 objectAtIndexedSubscript:j - 1];
        uint64_t v28 = [v29 BOOLValue];
      }
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v27 = 0;
    }
    uint64_t v30 = [NSNumber numberWithBool:v27];
    v79[0] = &unk_270891F18;
    uint64_t v31 = [NSNumber numberWithInteger:j];
    v79[1] = v31;
    v79[2] = &unk_270891F18;
    uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:3];
    [v24 setObject:v30 forKeyedSubscript:v32];

    v33 = [NSNumber numberWithBool:v28];
    v78[0] = &unk_270891F18;
    uint64_t v34 = [NSNumber numberWithInteger:j];
    v78[1] = v34;
    v78[2] = &unk_270891F30;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
    [v24 setObject:v33 forKeyedSubscript:v35];
  }
  float v36 = [[U2HeadInput alloc] initWithInput_mask:v61 input_span_features:v24 sequence_output:v54];
  u2Head = ptr->_u2Head;
  id v62 = v50;
  v38 = [(U2Head *)u2Head predictionFromFeatures:v36 error:&v62];
  id v39 = v62;

  if (v38)
  {
    uint64_t v40 = [(U2HeadWrapper *)ptr mapLogitsToLabels:v38 queryString:v53 tokens:v55 subtokenLenForTokens:v56 subtokens:v58];
    v41 = [(id)objc_opt_class() signpostLog];
    v42 = [(id)objc_opt_class() signpostLog];
    os_signpost_id_t v43 = os_signpost_id_make_with_pointer(v42, ptr);

    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)v76 = 0;
      _os_signpost_emit_with_name_impl(&dword_25AC98000, v41, OS_SIGNPOST_INTERVAL_END, v43, "U2Head prediction", (const char *)&unk_25ACA0EB2, v76, 2u);
    }
  }
  else
  {
    int v44 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v76 = 138412290;
      id v77 = v39;
      _os_log_impl(&dword_25AC98000, v44, OS_LOG_TYPE_ERROR, "[QPNLU] U2Head prediction error: %@", v76, 0xCu);
    }

    uint64_t v40 = 0;
    if (a10) {
      *a10 = v39;
    }
  }

  _Block_object_dispose(buf, 8);
  return v40;
}

void __120__U2HeadWrapper_getU2PredictionsForEmbedding_queryString_spans_tokens_tokenRanges_subtokenLenForTokens_subtokens_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  float v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v6 addObject:v7];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v5 intValue];
  float v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  unint64_t v9 = [v8 rangeValue];
  uint64_t v11 = v10;

  if (v11)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = [*(id *)(a1 + 48) peopleNameRanges];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v12);
          }
          unint64_t v16 = [*(id *)(*((void *)&v38 + 1) + 8 * i) rangeValue];
          if (v16 <= v9 && v16 + v17 >= v9 + v11)
          {
            uint64_t v13 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v19 = objc_msgSend(*(id *)(a1 + 48), "locationNameRanges", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v35;
      unint64_t v22 = v9 + v11;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v19);
          }
          unint64_t v24 = [*(id *)(*((void *)&v34 + 1) + 8 * j) rangeValue];
          if (v24 <= v9 && v24 + v25 >= v22)
          {
            uint64_t v27 = 1;
            goto LABEL_28;
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    uint64_t v27 = 0;
LABEL_28:
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v27 = 0;
  }
  for (int k = 0; k < (int)[v5 intValue]; ++k)
  {
    double v29 = *(void **)(a1 + 56);
    uint64_t v30 = [NSNumber numberWithBool:v13];
    [v29 addObject:v30];
  }
  for (int m = 0; m < (int)[v5 intValue]; ++m)
  {
    uint64_t v32 = *(void **)(a1 + 64);
    v33 = [NSNumber numberWithBool:v27];
    [v32 addObject:v33];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_u2Head, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end