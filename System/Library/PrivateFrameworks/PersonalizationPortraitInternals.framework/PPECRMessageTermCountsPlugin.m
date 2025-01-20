@interface PPECRMessageTermCountsPlugin
+ (id)classLock;
+ (id)sharedInstance;
+ (void)reduceUnigramCountSetSizeIfNeeded:(id)a3 maxUniqueTokens:(unint64_t)a4;
- (PPECRMessageTermCountsPlugin)initWithMaxUniqueTokens:(unint64_t)a3;
- (id)consumeMailContentWithContext:(id)a3;
- (id)consumeMessagesContentWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (id)generateTermCountsFromUnigramCounts:(id)a3;
- (void)_deleteEventsMatchingTest:(id)a3;
- (void)_sendEvent:(id)a3;
- (void)_updateUnigramCountsFromText:(id)a3 unigramCounts:(id)a4 totalTokenCount:(unint64_t *)a5;
@end

@implementation PPECRMessageTermCountsPlugin

- (void)_updateUnigramCountsFromText:(id)a3 unigramCounts:(id)a4 totalTokenCount:(unint64_t *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 length])
  {
    v11 = (void *)MEMORY[0x1E4F5DF88];
    unint64_t v12 = [v9 length];
    if (v12 >= 0xC8000) {
      uint64_t v13 = 819200;
    }
    else {
      uint64_t v13 = v12;
    }
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __91__PPECRMessageTermCountsPlugin__updateUnigramCountsFromText_unigramCounts_totalTokenCount___block_invoke;
    v24 = &unk_1E65D7550;
    id v14 = v10;
    id v25 = v14;
    v26 = self;
    v27 = a5;
    SEL v28 = a2;
    objc_msgSend(v11, "enumerateTokensInString:withRange:block:", v9, 0, v13, &v21);
    if (objc_msgSend(v14, "count", v21, v22, v23, v24) > self->_maxUniqueTokens)
    {
      v15 = pp_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        v18 = NSStringFromSelector(a2);
        uint64_t v19 = [v14 count];
        unint64_t maxUniqueTokens = self->_maxUniqueTokens;
        *(_DWORD *)buf = 138413058;
        v30 = v17;
        __int16 v31 = 2112;
        v32 = v18;
        __int16 v33 = 2048;
        uint64_t v34 = v19;
        __int16 v35 = 2048;
        unint64_t v36 = maxUniqueTokens;
        _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_INFO, "%@: %@ pruning unique unigram counts from %tu to %llu before writing to Biome", buf, 0x2Au);
      }
      +[PPECRMessageTermCountsPlugin reduceUnigramCountSetSizeIfNeeded:v14 maxUniqueTokens:self->_maxUniqueTokens];
    }
  }
}

void __91__PPECRMessageTermCountsPlugin__updateUnigramCountsFromText_unigramCounts_totalTokenCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  v4 = _PASRemoveCharacterSet();

  if ([v4 length])
  {
    v5 = [v4 localizedLowercaseString];
    [*(id *)(a1 + 32) addObject:v5];
    ++**(void **)(a1 + 48);
    if ([*(id *)(a1 + 32) count] > (unint64_t)(3 * *(void *)(*(void *)(a1 + 40) + 8)))
    {
      v6 = pp_default_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v11 = [*(id *)(a1 + 32) count];
        int v12 = 138413058;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 2048;
        uint64_t v19 = v11;
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ exceeded 3x max unique unigram count of %llu: %tu unique tokens -- pruning", (uint8_t *)&v12, 0x2Au);
      }
      +[PPECRMessageTermCountsPlugin reduceUnigramCountSetSizeIfNeeded:*(void *)(a1 + 32) maxUniqueTokens:(unint64_t)((double)*(unint64_t *)(*(void *)(a1 + 40) + 8) * 1.5)];
    }
  }
}

- (void)_deleteEventsMatchingTest:(id)a3
{
  id v3 = a3;
  v4 = BiomeLibrary();
  v5 = [v4 IntelligencePlatform];
  v6 = [v5 MessageTerms];

  v7 = +[PPECRMessageTermCountsPlugin classLock];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke;
  v10[3] = &unk_1E65D7528;
  id v11 = v6;
  id v12 = v3;
  id v8 = v3;
  id v9 = v6;
  [v7 runWithLockAcquired:v10];
}

void __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)v3[1];
  v3[1] = 0;

  unint64_t v6 = 2 * v3[2];
  if (v6 <= 0x80) {
    unint64_t v6 = 128;
  }
  if (v6 >= 0x342A2) {
    unint64_t v7 = 213666;
  }
  else {
    unint64_t v7 = v6;
  }
  LODWORD(v5) = 1008981770;
  id v8 = [MEMORY[0x1E4F93AB8] bloomFilterInMemoryWithNumberOfValuesN:v7 errorRateP:v5];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v9 = [*(id *)(a1 + 32) pruner];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke_2;
  v14[3] = &unk_1E65D7500;
  id v16 = *(id *)(a1 + 40);
  id v10 = v8;
  id v15 = v10;
  uint64_t v17 = &v18;
  [v9 deleteEventsPassingTest:v14];

  unint64_t v11 = v19[3];
  if (!v11 || v11 < v7 >> 2)
  {

    id v10 = 0;
    unint64_t v11 = v19[3];
  }
  id v12 = (void *)v3[1];
  v3[1] = v10;
  v3[2] = v11;
  id v13 = v10;

  _Block_object_dispose(&v18, 8);
}

uint64_t __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1CB79D060]();
  double v5 = [v3 eventBody];
  unint64_t v6 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v7 = (*(uint64_t (**)(void))(a1[5] + 16))();
  if ((v7 & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1CB79D060]();
    id v9 = (void *)MEMORY[0x1E4F937A0];
    id v10 = [v5 bundleID];
    unint64_t v11 = [v5 domain];
    id v12 = [v5 spotlightIdentifier];
    [v9 addDeletableContentWithBundleIdentifier:v10 domainIdentifier:v11 uniqueIdentifier:v12 toBloomFilter:a1[4]];

    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }

  return v7;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(id)objc_opt_class() classLock];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v10[3] = &unk_1E65D74D8;
  id v11 = v5;
  id v12 = self;
  SEL v13 = a2;
  id v7 = v5;
  [v6 runWithLockAcquired:v10];

  id v8 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v8;
}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  if (v4 && ([*(id *)(a1 + 32) matchesBloomFilter:v4] & 1) == 0)
  {
    id v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = [*(id *)(a1 + 32) bundleIdentifier];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412803;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2113;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "%@: deletion in bundle id %@ (%{private}@) bypassed by bloom filter!", buf, 0x20u);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_101;
    v14[3] = &unk_1E65D7438;
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = v6;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2;
    v13[3] = &unk_1E65D7488;
    v13[4] = v15;
    v13[5] = v6;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_107;
    v12[3] = &unk_1E65D74B0;
    v12[4] = v15;
    v12[5] = v6;
    [v5 accessCriteriaUsingBundleIdentifierBlock:v14 domainSelectionBlock:v13 uniqueIdentifiersBlock:v12];
  }
}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    SEL v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ deletion requested for bundle id %@", buf, 0x20u);
  }
  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_102;
  v10[3] = &unk_1E65D7410;
  id v11 = v3;
  id v9 = v3;
  [v8 _deleteEventsMatchingTest:v10];
}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138413059;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2113;
    id v24 = v6;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ deletion requested for bundle id %@ domain selection %{private}@", buf, 0x2Au);
  }
  id v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_105;
  v14[3] = &unk_1E65D7460;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  [v11 _deleteEventsMatchingTest:v14];
}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_107(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138413059;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2113;
    id v24 = v6;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ deletion requested for bundle id %@ unique identifiers %{private}@", buf, 0x2Au);
  }
  id v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_108;
  v14[3] = &unk_1E65D7460;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  [v11 _deleteEventsMatchingTest:v14];
}

uint64_t __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_108(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleID];
  if ([v4 isEqualToString:v5])
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v3 spotlightIdentifier];
    uint64_t v8 = [v6 containsObject:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 bundleID];
    if ([v5 isEqualToString:v6])
    {
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v3 domain];
      uint64_t v9 = [v7 containsDomain:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_102(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleID];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (id)generateTermCountsFromUnigramCounts:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PPECRMessageTermCountsPlugin_generateTermCountsFromUnigramCounts___block_invoke;
  v10[3] = &unk_1E65D7378;
  id v11 = v3;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  [v6 enumerateObjectsUsingBlock:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __68__PPECRMessageTermCountsPlugin_generateTermCountsFromUnigramCounts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F4FE78];
  id v4 = a2;
  id v9 = (id)[[v3 alloc] initWithTermType:1 termString:v4 termID:0];
  id v5 = objc_alloc(NSNumber);
  uint64_t v6 = [*(id *)(a1 + 32) countForObject:v4];

  id v7 = (void *)[v5 initWithUnsignedInteger:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F4FE70]) initWithTerm:v9 termCount:v7];
  [*(id *)(a1 + 40) addObject:v8];
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    id v10 = [v5 content];
    *(_DWORD *)buf = 138413059;
    v54 = v8;
    __int16 v55 = 2112;
    v56 = v9;
    __int16 v57 = 2112;
    uint64_t v58 = (uint64_t)v5;
    __int16 v59 = 2117;
    uint64_t v60 = (uint64_t)v10;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@", buf, 0x2Au);
  }
  v51 = v5;
  id v11 = [v5 content];
  uint64_t v52 = 0;
  id v12 = objc_opt_new();
  id v13 = [v11 content];
  [(PPECRMessageTermCountsPlugin *)self _updateUnigramCountsFromText:v13 unigramCounts:v12 totalTokenCount:&v52];

  __int16 v14 = pp_default_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(a2);
    uint64_t v18 = self;
    uint64_t v19 = [v12 count];
    uint64_t v20 = v52;
    __int16 v21 = [v11 uniqueId];
    *(_DWORD *)buf = 138413314;
    v54 = v16;
    __int16 v55 = 2112;
    v56 = v17;
    __int16 v57 = 2048;
    uint64_t v58 = v19;
    self = v18;
    __int16 v59 = 2048;
    uint64_t v60 = v20;
    __int16 v61 = 2112;
    v62 = v21;
    _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ got %tu unique unigram counts from %lld tokens in %@", buf, 0x34u);
  }
  id v22 = [v11 fromHandle];
  uint64_t v23 = [v22 contactIdentifier];

  id v24 = [v11 toHandles];
  uint64_t v25 = objc_msgSend(v24, "_pas_mappedArrayWithTransform:", &__block_literal_global_97_11042);

  v26 = pp_default_log_handle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v29 = SEL v28 = self;
    v30 = NSStringFromSelector(a2);
    uint64_t v31 = [v25 count];
    v32 = [v11 uniqueId];
    *(_DWORD *)buf = 138413314;
    v54 = v29;
    __int16 v55 = 2112;
    v56 = v30;
    __int16 v57 = 2112;
    uint64_t v58 = v23;
    __int16 v59 = 2048;
    uint64_t v60 = v31;
    __int16 v61 = 2112;
    v62 = v32;
    _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ extracted sender with id of %@ with %tu recipients in %@", buf, 0x34u);

    self = v28;
  }

  __int16 v33 = [(PPECRMessageTermCountsPlugin *)self generateTermCountsFromUnigramCounts:v12];
  id v34 = objc_alloc(MEMORY[0x1E4F4FE68]);
  uint64_t v35 = *MEMORY[0x1E4F8A0A8];
  [v11 domainId];
  v37 = unint64_t v36 = self;
  v38 = [v11 uniqueId];
  id v39 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  v40 = v11;
  v50 = v11;
  v41 = v12;
  v42 = (void *)v23;
  id v43 = v39;
  [v40 absoluteTimestamp];
  v44 = objc_msgSend(v43, "initWithTimeIntervalSinceReferenceDate:");
  v45 = (void *)[v34 initWithProtoVersion:0 bundleID:v35 domain:v37 spotlightIdentifier:v38 timestamp:v44 sender:v42 recipients:v25 termCount:v33];

  [(PPECRMessageTermCountsPlugin *)v36 _sendEvent:v45];
  v46 = (void *)MEMORY[0x1E4F93758];
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v41, "count"));
  v48 = [v46 successWithNumberOfExtractions:v47];

  return v48;
}

uint64_t __66__PPECRMessageTermCountsPlugin_consumeMessagesContentWithContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contactIdentifier];
}

- (id)consumeMailContentWithContext:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v9 = [v4 content];
    *(_DWORD *)buf = 138413059;
    v56 = v7;
    __int16 v57 = 2112;
    uint64_t v58 = v8;
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v4;
    __int16 v61 = 2117;
    uint64_t v62 = (uint64_t)v9;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@", buf, 0x2Au);
  }
  id v10 = [v4 content];
  uint64_t v54 = 0;
  id v11 = objc_alloc(MEMORY[0x1E4F5DF78]);
  id v12 = [v4 content];
  id v13 = [v4 contentProtection];
  v51 = v4;
  __int16 v14 = [v4 htmlParser];
  id v15 = (void *)[v11 initWithMailContentEvent:v12 contentProtection:v13 htmlParser:v14];

  id v16 = objc_opt_new();
  id v17 = [v15 subject];
  [(PPECRMessageTermCountsPlugin *)self _updateUnigramCountsFromText:v17 unigramCounts:v16 totalTokenCount:&v54];

  v50 = v15;
  uint64_t v18 = [v15 textContent];
  [(PPECRMessageTermCountsPlugin *)self _updateUnigramCountsFromText:v18 unigramCounts:v16 totalTokenCount:&v54];

  uint64_t v19 = pp_default_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = (objc_class *)objc_opt_class();
    __int16 v21 = NSStringFromClass(v20);
    id v22 = NSStringFromSelector(a2);
    uint64_t v23 = self;
    uint64_t v24 = [v16 count];
    uint64_t v25 = v54;
    v26 = [v10 uniqueId];
    *(_DWORD *)buf = 138413314;
    v56 = v21;
    __int16 v57 = 2112;
    uint64_t v58 = v22;
    __int16 v59 = 2048;
    uint64_t v60 = v24;
    self = v23;
    __int16 v61 = 2048;
    uint64_t v62 = v25;
    __int16 v63 = 2112;
    v64 = v26;
    _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ got %tu unique unigram counts from %lld tokens in %@", buf, 0x34u);
  }
  v27 = [v10 fromHandle];
  uint64_t v52 = [v27 handle];

  SEL v28 = [v10 toHandles];
  v29 = objc_msgSend(v28, "_pas_mappedArrayWithTransform:", &__block_literal_global_91_11051);

  v30 = pp_default_log_handle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    __int16 v33 = v32 = self;
    id v34 = NSStringFromSelector(a2);
    uint64_t v35 = [v29 count];
    unint64_t v36 = [v10 uniqueId];
    *(_DWORD *)buf = 138413314;
    v56 = v33;
    __int16 v57 = 2112;
    uint64_t v58 = v34;
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v52;
    __int16 v61 = 2048;
    uint64_t v62 = v35;
    __int16 v63 = 2112;
    v64 = v36;
    _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEFAULT, "%@: %@ extracted sender with id of %@ with %tu recipients in %@", buf, 0x34u);

    self = v32;
  }

  uint64_t v37 = [(PPECRMessageTermCountsPlugin *)self generateTermCountsFromUnigramCounts:v16];
  id v38 = objc_alloc(MEMORY[0x1E4F4FE68]);
  uint64_t v39 = *MEMORY[0x1E4F8A098];
  v40 = [v10 domainId];
  [v10 uniqueId];
  v42 = v41 = self;
  id v43 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v10 absoluteTimestamp];
  v44 = objc_msgSend(v43, "initWithTimeIntervalSinceReferenceDate:");
  v45 = (void *)[v38 initWithProtoVersion:0 bundleID:v39 domain:v40 spotlightIdentifier:v42 timestamp:v44 sender:v52 recipients:v29 termCount:v37];

  [(PPECRMessageTermCountsPlugin *)v41 _sendEvent:v45];
  v46 = (void *)MEMORY[0x1E4F93758];
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v48 = [v46 successWithNumberOfExtractions:v47];

  return v48;
}

uint64_t __62__PPECRMessageTermCountsPlugin_consumeMailContentWithContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handle];
}

- (void)_sendEvent:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() classLock];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PPECRMessageTermCountsPlugin__sendEvent___block_invoke;
  v10[3] = &unk_1E65D73C8;
  id v11 = v3;
  id v5 = v3;
  [v4 runWithLockAcquired:v10];

  uint64_t v6 = BiomeLibrary();
  id v7 = [v6 IntelligencePlatform];
  id v8 = [v7 MessageTerms];
  id v9 = [v8 source];
  [v9 sendEvent:v5];
}

void __43__PPECRMessageTermCountsPlugin__sendEvent___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = v8[1];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F937A0];
    id v5 = [*(id *)(a1 + 32) bundleID];
    uint64_t v6 = [*(id *)(a1 + 32) domain];
    id v7 = [*(id *)(a1 + 32) spotlightIdentifier];
    [v4 addDeletableContentWithBundleIdentifier:v5 domainIdentifier:v6 uniqueIdentifier:v7 toBloomFilter:v3];
  }
  v8[2] = (char *)v8[2] + 1;
}

- (id)consumerName
{
  return @"com.apple.proactive.PersonalizationPortrait.ECRMessageTermCountsPlugin";
}

- (PPECRMessageTermCountsPlugin)initWithMaxUniqueTokens:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PPECRMessageTermCountsPlugin;
  id v4 = [(PPECRMessageTermCountsPlugin *)&v9 init];
  if (v4)
  {
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      id v5 = +[PPConfiguration sharedInstance];
      int v6 = [v5 enableECRMessageTokenCountsPlugin];

      if (v6)
      {
        id v7 = [MEMORY[0x1E4F93750] defaultCoordinator];
        [v7 registerMailConsumer:v4 levelOfService:1];
        [v7 registerMessagesConsumer:v4 levelOfService:1];
        v4->_unint64_t maxUniqueTokens = a3;
      }
    }
  }
  return v4;
}

+ (void)reduceUnigramCountSetSizeIfNeeded:(id)a3 maxUniqueTokens:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] > a4)
  {
    int v6 = -[PPEvictingMaxTokenCountPriorityQueue initWithCapacity:]([PPEvictingMaxTokenCountPriorityQueue alloc], "initWithCapacity:", [v5 count] - a4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke;
    v11[3] = &unk_1E65D7378;
    id v7 = v5;
    id v12 = v7;
    id v13 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke_2;
    v9[3] = &unk_1E65D73A0;
    id v10 = v7;
    [(PPEvictingMaxTokenCountPriorityQueue *)v8 enumerateTokenCountsUsingBlock:v9];
  }
}

void __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[PPTokenCount initWithToken:count:]([PPTokenCount alloc], "initWithToken:count:", v3, [*(id *)(a1 + 32) countForObject:v3]);

  [*(id *)(a1 + 40) addObject:v4];
}

void __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [v6 token];
      [v4 removeObject:v5];

      ++v3;
    }
    while (v3 < [v6 count]);
  }
}

+ (id)classLock
{
  if (classLock__pasOnceToken3 != -1) {
    dispatch_once(&classLock__pasOnceToken3, &__block_literal_global_75_11068);
  }
  v2 = (void *)classLock__pasExprOnceResult;
  return v2;
}

void __41__PPECRMessageTermCountsPlugin_classLock__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  id v4 = (void *)classLock__pasExprOnceResult;
  classLock__pasExprOnceResult = v3;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_11072 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_11072, &__block_literal_global_11073);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_11074;
  return v2;
}

void __46__PPECRMessageTermCountsPlugin_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = [PPECRMessageTermCountsPlugin alloc];
  v2 = +[PPConfiguration sharedInstance];
  uint64_t v3 = -[PPECRMessageTermCountsPlugin initWithMaxUniqueTokens:](v1, "initWithMaxUniqueTokens:", [v2 maxUniqueTokensInECRTokenCounts]);
  id v4 = (void *)sharedInstance__pasExprOnceResult_11074;
  sharedInstance__pasExprOnceResult_11074 = v3;
}

@end