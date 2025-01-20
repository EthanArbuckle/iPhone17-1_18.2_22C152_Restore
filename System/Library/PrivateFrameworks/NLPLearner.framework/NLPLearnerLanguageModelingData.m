@interface NLPLearnerLanguageModelingData
+ (unint64_t)defaultMaxSequenceLength;
+ (void)initialize;
- (BOOL)addExamples:(id)a3;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (NLPLearnerLanguageModelingData)initWithLocale:(id)a3;
- (NSString)tokenIDMapPath;
- (id).cxx_construct;
- (id)nextEvaluationDataPoint;
- (id)nextTrainingDataBatch:(unint64_t)a3;
- (void)addPreprocessedExample:(void *)a3;
- (void)setTokenIDMapPath:(id)a3;
@end

@implementation NLPLearnerLanguageModelingData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.NLP", "NLPLearnerLanguageModelingData");
    MEMORY[0x270F9A758]();
  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 50;
}

- (NLPLearnerLanguageModelingData)initWithLocale:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLPLearnerLanguageModelingData;
  v5 = [(NLPLearnerTextData *)&v12 initWithLocale:v4];
  if (!v5) {
    goto LABEL_3;
  }
  -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  uint64_t v13 = *MEMORY[0x263F51318];
  v6 = [(NLPLearnerTextData *)v5 locale];
  v7 = [v6 languageCode];
  v14[0] = v7;
  [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v8 = (const void *)LXLexiconCreate();
  nlp::CFScopedPtr<_LXLexicon const*>::reset((const void **)&v5->_lexicon.m_ref, v8);

  if (!v5->_lexicon.m_ref)
  {
    v10 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[NLPLearnerLanguageModelingData initWithLocale:](0, v10);
    }

    v9 = 0;
  }
  else
  {
LABEL_3:
    v9 = v5;
  }

  return v9;
}

- (void)addPreprocessedExample:(void *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [(NLPLearnerLanguageModelingData *)self tokenIDMapPath];

  if (v4)
  {
    v5 = [(NLPLearnerLanguageModelingData *)self tokenIDMapPath];
    CFDataRef v6 = (const __CFData *)LMCreateMontrealIDsFromLMTokenIDSequence();

    if (v6)
    {
      CFDataGetBytePtr(v6);
      [(NLPLearnerTextData *)self maxSequenceLength];
      v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
      v9 = (id)sLog;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = [v8 componentsJoinedByString:@" "];
        [(NLPLearnerLanguageModelingData *)v10 addPreprocessedExample:v9];
      }

      v11 = [(NLPLearnerTextData *)self sentences];
      [v11 addObject:v8];

      CFRelease(v6);
    }
    else
    {
      v7 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        -[NLPLearnerLanguageModelingData addPreprocessedExample:](v7);
      }
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  v11[5] = &unk_234545833;
  memset(&__p, 0, sizeof(__p));
  std::vector<unsigned int>::reserve(&__p, [(NLPLearnerTextData *)self maxSequenceLength]);
  v7 = [(NLPLearnerTextData *)self locale];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke;
  v10[3] = &unk_264BEEB58;
  v10[4] = self;
  v10[5] = v11;
  v9.receiver = self;
  v9.super_class = (Class)NLPLearnerLanguageModelingData;
  [(NLPLearnerTextData *)&v9 loadFromCoreDuet:v6 limitSamplesTo:a4 withLocale:v7 andLMStreamTokenizationBlock:v10];

  _Block_object_dispose(v11, 8);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }

  return 1;
}

void __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    int v5 = a4;
    if (a4 == 2)
    {
      v10 = *(void **)(*(void *)(a1 + 40) + 8);
      v11 = (char *)v10[7];
      unint64_t v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        v14 = (char *)v10[6];
        uint64_t v15 = (v11 - v14) >> 2;
        if ((unint64_t)(v15 + 1) >> 62) {
          goto LABEL_47;
        }
        unint64_t v16 = v12 - (void)v14;
        unint64_t v17 = (uint64_t)(v12 - (void)v14) >> 1;
        if (v17 <= v15 + 1) {
          unint64_t v17 = v15 + 1;
        }
        if (v16 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18)
        {
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v10 + 8), v18);
          v14 = (char *)v10[6];
          v11 = (char *)v10[7];
        }
        else
        {
          v19 = 0;
        }
        v20 = &v19[4 * v15];
        v21 = &v19[4 * v18];
        *(_DWORD *)v20 = 2;
        uint64_t v13 = v20 + 4;
        while (v11 != v14)
        {
          int v22 = *((_DWORD *)v11 - 1);
          v11 -= 4;
          *((_DWORD *)v20 - 1) = v22;
          v20 -= 4;
        }
        void v10[6] = v20;
        v10[7] = v13;
        v10[8] = v21;
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *(_DWORD *)v11 = 2;
        uint64_t v13 = v11 + 4;
      }
      v10[7] = v13;
      [*(id *)(a1 + 32) addPreprocessedExample:*(void *)(*(void *)(a1 + 40) + 8) + 48];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 48);
      return;
    }
    if (a4 == 1)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) != *(void *)(*(void *)(*(void *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 48))
        __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke_cold_1();
      int v5 = 1;
    }
  }
  else
  {
    id v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8217);
    v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:@"'"];

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    int v45 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__51;
    v40 = __Block_byref_object_dispose__52;
    id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
    LXLexiconEnumerateEntriesForString();
    int v5 = *((_DWORD *)v43 + 6);
    if (!v5)
    {
      if ([(id)v37[5] count] == 1)
      {
        objc_super v9 = [(id)v37[5] objectAtIndexedSubscript:0];
        int v5 = [v9 unsignedIntValue];
      }
      else
      {
        int v5 = *((_DWORD *)v43 + 6);
      }
    }
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
  v23 = *(void **)(*(void *)(a1 + 40) + 8);
  v24 = (int *)v23[7];
  unint64_t v25 = v23[8];
  if ((unint64_t)v24 >= v25)
  {
    v27 = (int *)v23[6];
    uint64_t v28 = v24 - v27;
    if (!((unint64_t)(v28 + 1) >> 62))
    {
      unint64_t v29 = v25 - (void)v27;
      unint64_t v30 = (uint64_t)(v25 - (void)v27) >> 1;
      if (v30 <= v28 + 1) {
        unint64_t v30 = v28 + 1;
      }
      if (v29 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31)
      {
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v23 + 8), v31);
        v27 = (int *)v23[6];
        v24 = (int *)v23[7];
      }
      else
      {
        v32 = 0;
      }
      v33 = (int *)&v32[4 * v28];
      v34 = &v32[4 * v31];
      int *v33 = v5;
      v26 = v33 + 1;
      while (v24 != v27)
      {
        int v35 = *--v24;
        *--v33 = v35;
      }
      v23[6] = v33;
      v23[7] = v26;
      v23[8] = v34;
      if (v27) {
        operator delete(v27);
      }
      goto LABEL_44;
    }
LABEL_47:
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  int *v24 = v5;
  v26 = v24 + 1;
LABEL_44:
  v23[7] = v26;
}

- (id)nextTrainingDataBatch:(unint64_t)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(NLPLearnerTextData *)self iterator] + a3;
  if (v5 <= [(NLPLearnerTextData *)self numSamples])
  {
    v7 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    if (a3)
    {
      uint64_t v8 = 0;
      objc_super v9 = (void *)MEMORY[0x263F565F0];
      v10 = (uint64_t *)MEMORY[0x263F565E8];
      do
      {
        v11 = [(NLPLearnerTextData *)self sentences];
        unint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", v8 + -[NLPLearnerTextData iterator](self, "iterator"));

        uint64_t v13 = objc_msgSend(v12, "subarrayWithRange:", 0, objc_msgSend(v12, "count") - 1);
        v14 = objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
        uint64_t v15 = *v10;
        v20[0] = *v9;
        v20[1] = v15;
        v21[0] = v13;
        v21[1] = v14;
        unint64_t v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        [v7 addObject:v16];

        ++v8;
      }
      while (a3 != v8);
    }
    [(NLPLearnerTextData *)self setIterator:[(NLPLearnerTextData *)self iterator] + a3];
    uint64_t v18 = *MEMORY[0x263F565D0];
    v19 = v7;
    id v6 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)nextEvaluationDataPoint
{
  v18[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NLPLearnerTextData *)self iterator];
  if (v3 >= [(NLPLearnerTextData *)self numSamples])
  {
    v11 = 0;
  }
  else
  {
    id v4 = [(NLPLearnerTextData *)self sentences];
    unint64_t v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));

    id v6 = objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - 1);
    v7 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    id v8 = v6;
    objc_super v9 = v8;
    if (v8) {
      CFRetain(v8);
    }
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v9);

    if (!cf)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x237DBF0E0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    applesauce::CF::convert_to<std::vector<float>,0>(cf, (uint64_t)&__p);
    v17[0] = *MEMORY[0x263F56630];
    v10 = [MEMORY[0x263EFF8F8] dataWithBytes:__p length:v15 - (unsigned char *)__p];
    v17[1] = *MEMORY[0x263F56638];
    v18[0] = v10;
    v18[1] = v7;
    v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    [(NLPLearnerTextData *)self setIterator:[(NLPLearnerTextData *)self iterator] + 1];
    if (__p)
    {
      uint64_t v15 = __p;
      operator delete(__p);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  return v11;
}

- (NSString)tokenIDMapPath
{
  return self->_tokenIDMapPath;
}

- (void)setTokenIDMapPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIDMapPath, 0);
  nlp::CFScopedPtr<_LXLexicon const*>::reset((const void **)&self->_lexicon.m_ref, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

- (BOOL)addExamples:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v4 setNumberStyle:1];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v18;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v6 = 0;
      uint64_t v20 = v5;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
        if ([v7 length])
        {
          id v8 = [v7 componentsSeparatedByString:@" "];
          objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v23;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              v14 = [v4 numberFromString:*(void *)(*((void *)&v22 + 1) + 8 * v13)];
              [v9 addObject:v14];
              unint64_t v15 = [v9 count];
              LOBYTE(v15) = v15 < [(NLPLearnerTextData *)self maxSequenceLength];

              if ((v15 & 1) == 0) {
                break;
              }
              if (v11 == ++v13)
              {
                uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }

          unint64_t v16 = [(NLPLearnerTextData *)self sentences];
          [v16 addObject:v9];

          uint64_t v5 = v20;
        }
        ++v6;
      }
      while (v6 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  return 1;
}

- (void)initWithLocale:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "Lexicon load failed %@", (uint8_t *)&v2, 0xCu);
}

- (void)addPreprocessedExample:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "Token id mapping failed", v1, 2u);
}

- (void)addPreprocessedExample:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_234530000, log, OS_LOG_TYPE_DEBUG, "Tokens: '%@'", buf, 0xCu);
}

void __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke_cold_1()
{
  __assert_rtn("-[NLPLearnerLanguageModelingData loadFromCoreDuet:limitSamplesTo:]_block_invoke", "NLPLearnerLanguageModelingData.mm", 145, "tokens.size() == 0 && \"unexpected sentence beginning\"");
}

@end