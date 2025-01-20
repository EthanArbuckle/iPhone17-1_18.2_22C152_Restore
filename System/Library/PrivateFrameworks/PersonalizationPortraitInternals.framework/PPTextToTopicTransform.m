@interface PPTextToTopicTransform
+ (PPTextToTopicTransform)sharedInstance;
- (BOOL)_updateFromAssetData;
- (float)threshold;
- (id)_init;
- (id)_initWithVocabulary:(id)a3 weights:(id)a4;
- (id)_payloadForTopic:(unsigned int)a3;
- (unint64_t)outputTopicCount;
- (void)dealloc;
- (void)iterateTopicsForText:(id)a3 block:(id)a4;
@end

@implementation PPTextToTopicTransform

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUpdateNotificationToken, 0);
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_weightsPath, 0);
  objc_storeStrong((id *)&self->_vocabularyPath, 0);
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)_payloadForTopic:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14167;
  v13 = __Block_byref_object_dispose__14168;
  id v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PPTextToTopicTransform__payloadForTopic___block_invoke;
  v8[3] = &unk_1E65D8030;
  v8[4] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  v6 = [v5 payloadForTopic:v3];

  return v6;
}

void __43__PPTextToTopicTransform__payloadForTopic___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)iterateTopicsForText:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke;
  v12[3] = &unk_1E65D8080;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  [(_PASLock *)lock runWithLockAcquired:v12];
}

void __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", 4 * objc_msgSend(*(id *)(a1 + 32), "outputTopicCount"));
  v4 = *(__CFString **)(a1 + 40);
  v53.length = [(__CFString *)v4 length];
  v53.location = 0;
  id v5 = CFStringTokenizerCreate(0, v4, v53, 0, 0);
  if (!v5)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v31 = *(const char **)(a1 + 56);
    uint64_t v32 = *(void *)(a1 + 32);
    v33 = NSStringFromSelector(v31);
    [v30 handleFailureInMethod:v31, v32, @"PPTextToTopicTransform.m", 161, @"tokenizer was nil in %@", v33 object file lineNumber description];
  }
  v6 = objc_opt_new();
  bzero(chars, 0x3E8uLL);
  CFAllocatorRef externalCharactersAllocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, chars, 0, 500, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  while (CFStringTokenizerAdvanceToNextToken(v5))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v5);
    if (CurrentTokenRange.length <= 500)
    {
      CFStringGetCharacters(*(CFStringRef *)(a1 + 40), CurrentTokenRange, chars);
      CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, chars, CurrentTokenRange.length, 500);
      CFStringFold(MutableWithExternalCharactersNoCopy, 0x181uLL, 0);
      CFStringNormalize(MutableWithExternalCharactersNoCopy, kCFStringNormalizationFormKC);
      if (CFStringGetCharactersPtr(MutableWithExternalCharactersNoCopy) == chars)
      {
        int v9 = [v3[1] payloadForString:MutableWithExternalCharactersNoCopy];
        if (v9)
        {
          uint64_t v10 = (v9 - 1);
          id v11 = NSNumber;
          v12 = [NSNumber numberWithUnsignedInt:v10];
          id v13 = [v6 objectForKeyedSubscript:v12];
          id v14 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
          SEL v15 = [NSNumber numberWithUnsignedInt:v10];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
      }
      else
      {
        CFRelease(MutableWithExternalCharactersNoCopy);
        CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, chars, 0, 500, externalCharactersAllocator);
      }
    }
  }
  CFRelease(MutableWithExternalCharactersNoCopy);
  CFRelease(v5);
  if ([v6 count])
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    v16 = malloc_type_malloc(4 * [v6 count], 0x100004052888210uLL);
    if (!v16)
    {
      id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v34);
    }
    v48[3] = (uint64_t)v16;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    v17 = malloc_type_malloc(4 * [v6 count], 0x100004052888210uLL);
    if (!v17)
    {
      id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v35);
    }
    v44[3] = (uint64_t)v17;
    uint64_t v39 = 0;
    v40 = (int *)&v39;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke_2;
    v38[3] = &unk_1E65D8058;
    v38[4] = &v47;
    v38[5] = &v39;
    v38[6] = &v43;
    [v6 enumerateKeysAndObjectsUsingBlock:v38];
    [v3[2] applyFeatureSmoothing:v44[3] vectorLength:v40[6]];
    [v3[2] applyFeatureScaling:v44[3] vectorLength:v40[6]];
    [v3[2] applyFeatureNormalization:v44[3] vectorLength:v40[6]];
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", 2 * objc_msgSend(*(id *)(a1 + 32), "outputTopicCount"));
    uint64_t v19 = [v37 mutableBytes];
    id v20 = v18;
    uint64_t v21 = [v20 mutableBytes];
    if (v40[6] >= 1)
    {
      uint64_t v23 = 0;
      do
      {
        LODWORD(v22) = *(_DWORD *)(v44[3] + 4 * v23);
        [v3[2] addWeightedTopicScoreToBuffer:v19 countNonZeroComponentsInBuffer:v21 qid:*(unsigned int *)(v48[3] + 4 * v23++) score:v22];
      }
      while (v23 < v40[6]);
    }
    free((void *)v48[3]);
    free((void *)v44[3]);
    [v3[2] addBias:v19];
    objc_msgSend(v3[2], "applyOutputScaling:vectorLength:", v19, objc_msgSend(*(id *)(a1 + 32), "outputTopicCount"));
    [v3[2] applyOutputActivation:v19];
    [v3[2] applyOutputAttenuation:v19 nonzeroCounts:v21];
    for (unsigned int i = 0; ; unsigned int i = v25 + 1)
    {
      uint64_t v25 = i;
      if ([*(id *)(a1 + 32) outputTopicCount] <= (unint64_t)i) {
        break;
      }
      v26 = (void *)MEMORY[0x1CB79D060]();
      float v27 = *(float *)(v19 + 4 * i);
      [v3[2] threshold];
      if (v27 >= v28)
      {
        v29 = [*(id *)(a1 + 32) _payloadForTopic:i];
        (*(void (**)(float))(*(void *)(a1 + 48) + 16))(*(float *)(v19 + 4 * v25));
      }
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }
}

void __53__PPTextToTopicTransform_iterateTopicsForText_block___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1[4] + 8) + 24) + 4 * *(int *)(*(void *)(a1[5] + 8) + 24)) = [a2 integerValue];
  [v5 floatValue];
  int v7 = v6;

  *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * (int)(*(_DWORD *)(*(void *)(a1[5] + 8) + 24))++) = v7;
}

- (float)threshold
{
  uint64_t v6 = 0;
  int v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PPTextToTopicTransform_threshold__block_invoke;
  v5[3] = &unk_1E65D8030;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PPTextToTopicTransform_threshold__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 16) threshold];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (unint64_t)outputTopicCount
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PPTextToTopicTransform_outputTopicCount__block_invoke;
  v5[3] = &unk_1E65D8030;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PPTextToTopicTransform_outputTopicCount__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 16) outputTopicCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  unint64_t v3 = +[PPTrialWrapper sharedInstance];
  [v3 removeUpdateHandlerForToken:self->_trialToken];

  v4.receiver = self;
  v4.super_class = (Class)PPTextToTopicTransform;
  [(PPTextToTopicTransform *)&v4 dealloc];
}

- (id)_initWithVocabulary:(id)a3 weights:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PPTextToTopicTransform;
  uint64_t v9 = [(PPTextToTopicTransform *)&v21 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    objc_storeStrong((id *)&v9->_vocabularyPath, a3);
    objc_storeStrong((id *)&v9->_weightsPath, a4);
    mappingId = v9->_mappingId;
    v9->_mappingId = (NSString *)@"high-level-topics-extraction";

    id location = 0;
    objc_initWeak(&location, v9);
    SEL v15 = +[PPTrialWrapper sharedInstance];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__PPTextToTopicTransform__initWithVocabulary_weights___block_invoke;
    v18[3] = &unk_1E65DC540;
    objc_copyWeak(&v19, &location);
    id v16 = (id)[v15 addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS" block:v18];

    if (!-[PPTextToTopicTransform _updateFromAssetData](v9))
    {

      uint64_t v9 = 0;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __54__PPTextToTopicTransform__initWithVocabulary_weights___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPTextToTopicTransform _updateFromAssetData](WeakRetained);
}

- (BOOL)_updateFromAssetData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:a1[3]];
  if (v2)
  {
    unint64_t v3 = [[PPTopicTransform alloc] initWithPath:a1[4] mappingId:a1[5]];
    BOOL v4 = v3 != 0;
    if (v3)
    {
      id v5 = (void *)a1[1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__PPTextToTopicTransform__updateFromAssetData__block_invoke;
      v12[3] = &unk_1E65D8008;
      id v13 = v2;
      id v14 = v3;
      [v5 runWithLockAcquired:v12];

      uint64_t v6 = v13;
    }
    else
    {
      uint64_t v6 = pp_topics_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = a1[4];
        id v11 = NSStringFromSelector(sel__updateFromAssetData);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "nil topicTransform loaded from %@ in %@", buf, 0x16u);
      }
    }
  }
  else
  {
    pp_default_log_handle();
    unint64_t v3 = (PPTopicTransform *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[3];
      uint64_t v9 = NSStringFromSelector(sel__updateFromAssetData);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_1CA9A8000, &v3->super, OS_LOG_TYPE_ERROR, "nil vocabulary trie loaded from %@ in %@", buf, 0x16u);
    }
    BOOL v4 = 0;
  }

  return v4;
}

void __46__PPTextToTopicTransform__updateFromAssetData__block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 1, *(id *)(a1 + 32));
  BOOL v4 = a2;
  objc_storeStrong(v4 + 2, *(id *)(a1 + 40));
}

- (id)_init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[PPTrialWrapper sharedInstance];
  id v5 = [v4 filepathForFactor:@"highLevelTextTopics.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

  if (![v5 length])
  {
    id v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      int v13 = 138412290;
      id v14 = v9;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "trie path not found in %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v6 = +[PPTrialWrapper sharedInstance];
  id v7 = [v6 filepathForFactor:@"highLevelTextTopics.dat" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

  if (![v7 length])
  {
    uint64_t v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      int v13 = 138412290;
      id v14 = v12;
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "weights path not found in %@", (uint8_t *)&v13, 0xCu);
    }
LABEL_9:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  self = (PPTextToTopicTransform *)[(PPTextToTopicTransform *)self _initWithVocabulary:v5 weights:v7];
  uint64_t v8 = self;
LABEL_10:

  return v8;
}

+ (PPTextToTopicTransform)sharedInstance
{
  if (sharedInstance__pasOnceToken2_14209 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_14209, &__block_literal_global_14210);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_14211;
  return (PPTextToTopicTransform *)v2;
}

void __40__PPTextToTopicTransform_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = [[PPTextToTopicTransform alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult_14211;
  sharedInstance__pasExprOnceResult_14211 = (uint64_t)v1;
}

@end