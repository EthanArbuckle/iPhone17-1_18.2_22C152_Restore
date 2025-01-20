@interface PPSentiment
+ (id)sharedInstance;
- (PPSentiment)init;
- (float)sentimentScoreForText:(id)a3;
@end

@implementation PPSentiment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUpdateNotificationToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (float)sentimentScoreForText:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0;
    v14 = (float *)&v13;
    uint64_t v15 = 0x2020000000;
    float intercept = self->_intercept;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__PPSentiment_sentimentScoreForText___block_invoke;
    v9[3] = &unk_1E65D71E8;
    id v10 = v4;
    v11 = self;
    v12 = &v13;
    [(_PASLock *)lock runWithLockAcquired:v9];
    float v7 = 2.0 / (exp((float)-v14[6]) + 1.0) + -1.0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    float v7 = INFINITY;
  }

  return v7;
}

void __37__PPSentiment_sentimentScoreForText___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id v4 = [v3[2] result];
  [v4 setString:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 32) length];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __37__PPSentiment_sentimentScoreForText___block_invoke_2;
  id v10 = &unk_1E65D71C0;
  id v11 = *(id *)(a1 + 32);
  v12 = v3;
  long long v13 = *(_OWORD *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v4, "enumerateTokensInRange:usingBlock:", 0, v5, &v7);
  objc_msgSend(v4, "setString:", @"⌘", v7, v8, v9, v10);
}

void __37__PPSentiment_sentimentScoreForText___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  uint64_t v8 = [v7 lowercaseString];

  int v9 = [*(id *)(*(void *)(a1 + 40) + 8) payloadForString:v8];
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      float v11 = *(float *)(v10 + 8) * (float)(v9 - 0x80000000);
    }
    else {
      float v11 = 0.0;
    }
    *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11
                                                               + *(float *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  }
}

- (PPSentiment)init
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PPSentiment;
  v2 = [(PPSentiment *)&v22 init];
  if (!v2) {
    goto LABEL_18;
  }
  v3 = +[PPTrialWrapper sharedInstance];
  id v4 = [v3 filepathForFactor:@"SentimentTokenWeight.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  uint64_t v5 = +[PPTrialWrapper sharedInstance];
  v6 = [v5 treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  if (!v4)
  {
    v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"SentimentTokenWeight.trie";
      _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "PPSentiment: Could not find asset path for %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_19;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  id v7 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v7 initWithGuardedData:v8];
  lock = v2->_lock;
  v2->_lock = (_PASLock *)v9;

  float v11 = v2->_lock;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __29__PPSentiment__loadAssetData__block_invoke;
  v24[3] = &unk_1E65D7198;
  id v12 = v6;
  id v25 = v12;
  id v13 = v4;
  id v26 = v13;
  v27 = &v30;
  p_long long buf = &buf;
  v29 = &v34;
  [(_PASLock *)v11 runWithLockAcquired:v24];
  if (*((unsigned char *)v31 + 24))
  {
    unsigned int v14 = *(_DWORD *)(*((void *)&buf + 1) + 24);
    if (v14)
    {
      uint64_t v15 = *((unsigned int *)v35 + 6);
      if (v15)
      {
        float v16 = ((double)v14 + (double)v14) / 4294967300.0;
        v2->_weightBucketSize = v16;
        v2->_float intercept = v16 * (float)(v15 - 0x80000000);
        int v17 = 1;
        goto LABEL_17;
      }
      v19 = pp_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPSentiment: Token weight trie does not contain intercept key", v23, 2u);
      }
    }
    else
    {
      v19 = pp_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPSentiment: Token weight trie does not contain range key", v23, 2u);
      }
    }
  }
  int v17 = 0;
LABEL_17:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&buf, 8);

  if (!v17)
  {
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }
LABEL_18:
  v20 = v2;
LABEL_20:

  return v20;
}

void __29__PPSentiment__loadAssetData__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  objc_storeStrong(v3 + 3, *(id *)(a1 + 32));
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:*(void *)(a1 + 40)];
  id v5 = v3[1];
  v3[1] = (id)v4;

  if (v3[1])
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_10799 idleTimeout:1.0];
    id v7 = v3[2];
    v3[2] = (id)v6;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3[1] payloadForString:@"_half_range_"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3[1] payloadForString:@"_intercept_"];
  }
  else
  {
    uint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 0;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPSentiment: Failed to create token weight trie", (uint8_t *)v9, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

id __29__PPSentiment__loadAssetData__block_invoke_22()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
  return v0;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_10814 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_10814, &__block_literal_global_29_10815);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_10816;
  return v2;
}

void __29__PPSentiment_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10816;
  sharedInstance__pasExprOnceResult_10816 = v1;
}

@end