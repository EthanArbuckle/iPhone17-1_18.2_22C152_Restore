@interface SCMLTextSanitizer
+ (unsigned)violationCategoryForAdapterLabel:(id)a3;
- (NSLocale)locale;
- (SCMLTextSanitizer)initWithConfiguration:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)_sanitizeRequest:(id)a3 error:(id *)a4;
- (id)_sanitizeRequestAsynchronously:completionHandler:;
- (id)sanitizeText:(id)a3 error:(id *)a4;
- (uint64_t)_sanitizeRequestAsynchronously:(uint64_t)a1 completionHandler:(uint64_t)a2;
- (uint64_t)_sanitizeRequestAsynchronously:completionHandler:;
- (uint64_t)initWithConfiguration:error:;
- (void)_sanitizeRequestAsynchronously:(id)a3 completionHandler:(id)a4;
- (void)_sanitizeRequestAsynchronously:completionHandler:;
- (void)doLLMBackend:(id)a3 withText:(id)a4 isChildPresent:(BOOL)a5 withResponder:(void *)a6;
- (void)doModeration:(id)a3 withResponder:(void *)a4;
- (void)initWithConfiguration:error:;
- (void)sanitizeRequestAsynchronously:(id)a3 completionHandler:(id)a4;
- (void)sanitizeTextAsynchronously:(id)a3 completionHandler:(id)a4;
@end

@implementation SCMLTextSanitizer

- (SCMLTextSanitizer)initWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v33 = a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v38);
  v5 = v38;
  v6 = v5;
  os_signpost_id_t v7 = v39;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SCMLTextSanitizer.init", "", buf, 2u);
  }

  v37[0] = &unk_270973510;
  v37[1] = &v38;
  v37[3] = v37;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v40, (uint64_t)v37);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v37);
  v8 = +[SCMLLog textAnalyzer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v33 locale];
    v10 = [v9 localeIdentifier];
    int v11 = [v33 mode];
    int v12 = [v33 backends];
    v13 = [v33 modelManagerServicesUseCaseID];
    *(_DWORD *)buf = 134219011;
    *(void *)&buf[4] = self;
    __int16 v43 = 2112;
    v44 = v10;
    __int16 v45 = 1024;
    int v46 = v11;
    __int16 v47 = 1024;
    int v48 = v12;
    __int16 v49 = 2113;
    v50 = v13;
    _os_log_impl(&dword_25BF41000, v8, OS_LOG_TYPE_DEFAULT, "Begin SCMLTextSanitizer init inst=%p loc=%@ mode=%d backends=0x%x useCase=%{private}@", buf, 0x2Cu);
  }
  v36.receiver = self;
  v36.super_class = (Class)SCMLTextSanitizer;
  v34 = [(SCMLTextSanitizer *)&v36 init];

  if (v34)
  {
    uint64_t v14 = [v33 locale];
    v15 = (void *)*((void *)v34 + 9);
    *((void *)v34 + 9) = v14;

    v16 = v34;
    *((_DWORD *)v34 + 20) = [v33 mode];
    *((_DWORD *)v34 + 21) = [v33 granularity];
    int v17 = [v33 mode];
    uint64_t v18 = [v33 backends];
    if (v17 != 3)
    {
      if (v17 == 2)
      {
        int v19 = _os_feature_enabled_impl();
        v20 = +[SCMLLog textAnalyzer];
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
        if (v19)
        {
          if (v21) {
            -[SCMLTextSanitizer initWithConfiguration:error:](v20);
          }

          uint64_t v18 = 37;
        }
        else
        {
          if (v21) {
            -[SCMLTextSanitizer initWithConfiguration:error:](v20);
          }

          uint64_t v18 = 35;
        }
        v16 = v34;
      }
      else
      {
        uint64_t v18 = 3;
      }
    }
    *((void *)v16 + 11) = v18;
    uint64_t v22 = [MEMORY[0x263EFFA68] mutableCopy];
    v23 = (void *)*((void *)v16 + 17);
    *((void *)v16 + 17) = v22;

    v24 = v34;
    *((unsigned char *)v34 + 96) = [v33 throwInModerationLMAsyncHandler];
    *((unsigned char *)v34 + 97) = [v33 throwInAdapterAsyncHandler];
    v25 = (void *)*((void *)v34 + 9);
    if (v25)
    {
      v26 = [v25 languageCode];
      v27 = [v26 lowercaseString];
      char v28 = [v27 isEqualToString:@"en"];

      v24 = v34;
      if (v28)
      {
        objc_claimAutoreleasedReturnValue();
        operator new();
      }
    }
    exception = __cxa_allocate_exception(0x10uLL);
    v32 = [*((id *)v24 + 9) localeIdentifier];
    scml::strFromNSString(v32, v41);
    scml::strCat<char const(&)[38],std::string>("Unsupported locale: ", (uint64_t)v41, buf);
    MEMORY[0x26117A7E0](exception, buf);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v29 = +[SCMLLog textAnalyzer];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BF41000, v29, OS_LOG_TYPE_DEFAULT, "End SCMLTextSanitizer init", buf, 2u);
  }

  v35 = (SCMLTextSanitizer *)0;
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v38);

  return v35;
}

- (void)sanitizeTextAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_signpost_id_t v7 = objc_alloc_init(SCMLTextSanitizerRequest);
  [(SCMLTextSanitizerRequest *)v7 setText:v8];
  [(SCMLTextSanitizer *)self sanitizeRequestAsynchronously:v7 completionHandler:v6];
}

- (void)doModeration:(id)a3 withResponder:(void *)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 length] < 0x2EE1)
  {
    id v8 = +[SCMLLog textAnalyzer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25BF41000, v8, OS_LOG_TYPE_DEFAULT, "Begin TextModerationLM request", buf, 2u);
    }

    scml::SignpostInterval::createAsync(v9);
  }
  uint64_t v6 = scml::error(0xFu, (uint64_t)"Text too long for TextModerationLM", 34);
  os_signpost_id_t v7 = (void *)*((void *)a4 + 3);
  *((void *)a4 + 3) = v6;
}

void __48__SCMLTextSanitizer_doModeration_withResponder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v27 = a3;
  char v28 = v5;
  uint64_t v6 = *(void *)(a1 + 40);
  v37[0] = &unk_270973C48;
  v37[1] = v6;
  v37[3] = v37;
  scml::Deferred::Deferred(v38, v37);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v37);
  os_signpost_id_t v7 = **(id **)(a1 + 48);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SCMLTextSanitizer.sanitizeText.moderation_lm", "", buf, 2u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  v36[0] = &unk_270973CA0;
  v36[3] = v36;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((void *)(v10 + 16), (uint64_t)v36);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v36);
  int v11 = *(scml::SignpostInterval **)(a1 + 48);
  if (v11)
  {
    scml::SignpostInterval::~SignpostInterval(v11);
    MEMORY[0x26117ABD0]();
  }
  int v12 = +[SCMLLog textAnalyzer];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BF41000, v12, OS_LOG_TYPE_DEFAULT, "End TextModerationLM request", buf, 2u);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 96))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Forced failure");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v5)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v5 predictions];
    uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          int v17 = NSString;
          uint64_t v18 = [v16 nameP1];
          int v19 = [v17 stringWithFormat:@"%@.%@", @"npefsbujpo_mn", v18];

          id v20 = *(id *)(*(void *)(a1 + 40) + 16);
          uint64_t v21 = [v16 safe];
          [v16 probability];
          id v22 = (id)objc_msgSend(v20, "updateSignal:withSafe:withScore:", v19, v21);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }
    v23 = obj;
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = scml::error(0xFu, (uint64_t)"Failed to query TextModerationLM", 32, v27);
    v23 = *(void **)(v24 + 24);
    *(void *)(v24 + 24) = v25;
  }

  scml::Deferred::~Deferred((scml::Deferred *)v38);
}

- (void)doLLMBackend:(id)a3 withText:(id)a4 isChildPresent:(BOOL)a5 withResponder:(void *)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v9 length] < 0x2EE1)
  {
    int v12 = [v8 bundleID];
    scml::strFromNSString(v12, __p);
    scml::strCat<char const(&)[38],std::string>("model manager query for model ", (uint64_t)__p, v16);
    if (v19 < 0) {
      operator delete(*(void **)__p);
    }

    uint64_t v13 = +[SCMLLog textAnalyzer];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v16;
      if (v17 < 0) {
        uint64_t v14 = (void **)v16[0];
      }
      *(_DWORD *)__p = 136315138;
      *(void *)&__p[4] = v14;
      _os_log_impl(&dword_25BF41000, v13, OS_LOG_TYPE_DEFAULT, "Begin %s", __p, 0xCu);
    }

    scml::SignpostInterval::createAsync(v15);
  }
  uint64_t v10 = scml::error(0xFu, (uint64_t)"Text too long for LLM backend", 29);
  int v11 = (void *)*((void *)a6 + 3);
  *((void *)a6 + 3) = v10;
}

void __72__SCMLTextSanitizer_doLLMBackend_withText_isChildPresent_withResponder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  v34[0] = &unk_2709745B0;
  v34[1] = v7;
  v34[3] = v34;
  scml::Deferred::Deferred(v35, v34);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v34);
  id v8 = **(id **)(a1 + 48);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(__p) = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SCMLTextSanitizer.sanitizeText.llm_backend", "", (uint8_t *)&__p, 2u);
  }

  uint64_t v11 = *(void *)(a1 + 48);
  v33[0] = &unk_270974630;
  v33[3] = v33;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((void *)(v11 + 16), (uint64_t)v33);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v33);
  int v12 = *(scml::SignpostInterval **)(a1 + 48);
  if (v12)
  {
    scml::SignpostInterval::~SignpostInterval(v12);
    MEMORY[0x26117ABD0]();
  }
  uint64_t v13 = +[SCMLLog textAnalyzer];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)(a1 + 56);
    if (*(char *)(a1 + 79) < 0) {
      uint64_t v14 = (void *)*v14;
    }
    LODWORD(__p) = 136315138;
    *(void *)((char *)&__p + 4) = v14;
    _os_log_impl(&dword_25BF41000, v13, OS_LOG_TYPE_DEFAULT, "End %s", (uint8_t *)&__p, 0xCu);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 97))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Forced failure");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v5)
  {
    if (([v5 safe] & 1) == 0)
    {
      v15 = [v5 labels];
      BOOL v16 = [v15 count] == 0;

      if (v16)
      {
        uint64_t v20 = &stru_2709753D8;
      }
      else
      {
        char v17 = +[SCMLImageLabelCoder instance];
        uint64_t v18 = [v5 labels];
        char v19 = [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = [v17 encodeToP1:v19];

        if (!v20)
        {
          uint64_t v21 = 0;
          uint64_t v22 = 0;
LABEL_29:
          id v29 = (id)[*(id *)(*(void *)(a1 + 40) + 16) updateSignal:kSCMLTextSanitizationSignalSafetyAdapter[0] withSafe:v21 withLabel:v20];
          [*(id *)(*(void *)(a1 + 40) + 16) setAdapterViolationCategory:v22];

          goto LABEL_30;
        }
      }
      uint64_t v28 = +[SCMLTextSanitizer violationCategoryForAdapterLabel:v20];
      uint64_t v22 = v28;
      uint64_t v21 = 0;
      if (*(unsigned char *)(a1 + 80) || v28 != 19) {
        goto LABEL_29;
      }
    }
    uint64_t v20 = 0;
    uint64_t v22 = 0;
    uint64_t v21 = 1;
    goto LABEL_29;
  }
  scml::strCat<char const(&)[38],std::string>("Failed ", a1 + 56, &__p);
  uint64_t v23 = *(void *)(a1 + 40);
  if ((v32 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (long long *)__p;
  }
  if ((v32 & 0x80u) == 0) {
    uint64_t v25 = v32;
  }
  else {
    uint64_t v25 = *((void *)&__p + 1);
  }
  uint64_t v26 = scml::error(0xFu, (uint64_t)p_p, v25, v6);
  id v27 = *(void **)(v23 + 24);
  *(void *)(v23 + 24) = v26;

  if ((char)v32 < 0) {
    operator delete((void *)__p);
  }
LABEL_30:
  scml::Deferred::~Deferred((scml::Deferred *)v35);
}

- (void)sanitizeRequestAsynchronously:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v5 = a3;
  scml::SignpostInterval::createAsync((scml::SignpostInterval *)a4);
}

void __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = +[SCMLLog textAnalyzer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 unsafeReason];
      id v9 = [*(id *)(a1 + 32) text];
      uint64_t v11 = scml::strEscape(v9, v10);
      *(_DWORD *)buf = 138478339;
      id v19 = v5;
      __int16 v20 = 2117;
      uint64_t v21 = v8;
      __int16 v22 = 2117;
      uint64_t v23 = v11;
      _os_log_impl(&dword_25BF41000, v7, OS_LOG_TYPE_DEFAULT, "End sanitizeText %{private}@ (%{sensitive}@): %{sensitive}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = +[SCMLLog textAnalyzer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }

  int v12 = **(id **)(a1 + 48);
  uint64_t v13 = v12;
  os_signpost_id_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SCMLTextSanitizer.sanitizeText", "", buf, 2u);
  }

  uint64_t v15 = *(void *)(a1 + 48);
  v17[0] = &unk_270973D50;
  v17[3] = v17;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((void *)(v15 + 16), (uint64_t)v17);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v17);
  BOOL v16 = *(scml::SignpostInterval **)(a1 + 48);
  if (v16)
  {
    scml::SignpostInterval::~SignpostInterval(v16);
    MEMORY[0x26117ABD0]();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sanitizeRequestAsynchronously:(id)a3 completionHandler:(id)a4
{
  v111[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v83 = a4;
  v90 = self;
  v81 = (std::mutex *)((char *)self + 8);
  v86 = v6;
  std::mutex::lock((std::mutex *)((char *)self + 8));
  uint64_t v7 = [v6 text];
  id v8 = [(SCMLTextSanitizer *)self locale];
  uint64_t v9 = (*((void *)self + 11) >> 4) & 1;
  id v10 = v7;
  id v11 = v8;
  buf.__r_.__value_.__r.__words[0] = 0;
  uint64_t v12 = +[SCMLNormalizer normalizeText:v10 locale:v11 lite:v9 error:&buf];
  uint64_t v13 = buf.__r_.__value_.__l.__data_;
  os_signpost_id_t v14 = v13;
  v89 = (NSString *)v12;
  if (!v12)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    scml::makeException("failed to normalize text", 0x18uLL, v14, (uint64_t)exception);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }

  int v15 = [v86 keepGoing];
  v82 = [[SCMLTextSanitization alloc] initWithGranularOutput:*((_DWORD *)v90 + 21) != 0];
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v109);
  BOOL v16 = v109;
  char v17 = v16;
  os_signpost_id_t v18 = v110;
  if (v110 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SCMLTextSanitizer.sanitizeText.rules", "", (uint8_t *)&buf, 2u);
  }

  v108[0] = &unk_270973880;
  v108[1] = &v109;
  v108[3] = v108;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v111, (uint64_t)v108);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v108);
  uint64_t v19 = *((void *)v90 + 15);
  int v85 = [v86 isPersonalized];
  int v84 = [v86 isChildPresent];
  __int16 v20 = v89;
  uint64_t v21 = v82;
  __int16 v22 = v20;
  v88 = v21;
  uint64_t v23 = v22;
  v112.length = CFStringGetLength(v23);
  v112.location = 0;
  CFStringTokenizerSetString(*(CFStringTokenizerRef *)v19, v23, v112);
  uint64_t v24 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)v19))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(void *)v19);
    uint64_t v26 = (__CFString *)CFStringCreateWithSubstring(v25, v23, CurrentTokenRange);
    [v24 addObject:v26];
  }
  id v27 = [v24 componentsJoinedByString:@" "];

  if ((unint64_t)[v27 length] <= 0x3E8)
  {
    uint64_t v28 = [*(id *)(v19 + 80) labelForString:v27];
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      id v30 = [(SCMLTextSanitization *)v88 updateSignal:kSCMLTextSanitizationSignalFullAllow[0] withSafe:1];

      char v31 = 1;
      goto LABEL_69;
    }
    unsigned __int8 v32 = [*(id *)(v19 + 88) labelForString:v27];
    BOOL v33 = v32 == 0;

    id v34 = [(SCMLTextSanitization *)v88 updateSignal:kSCMLTextSanitizationSignalFullDisallow[0] withSafe:v33];
  }

  if ((v15 & 1) == 0 && ![(SCMLTextSanitization *)v88 safe] || (*(unsigned char *)(v19 + 96) & 0x21) == 0) {
    goto LABEL_68;
  }
  v114.length = CFStringGetLength(v23);
  v114.location = 0;
  CFStringTokenizerSetString(*(CFStringTokenizerRef *)v19, v23, v114);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v91);
  std::string::basic_string[abi:ne180100]<0>(&buf, "");
  LODWORD(v93) = 1;
  MEMORY[0x26117A4C0](v91, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  uint64_t v87 = 0;
  int hasGazetteerMatch = 0;
  int v36 = 0;
  v80 = &buf.__r_.__value_.__s.__data_[16];
  while (CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)v19))
  {
    CFRange v115 = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(void *)v19);
    v37 = (id)CFStringCreateWithSubstring(v25, v23, v115);
    if (*(unsigned char *)(v19 + 96))
    {
      id v38 = objc_msgSend(*(id *)(v19 + 72), "labelForString:", v37, v80, v81);
      BOOL v39 = v38 == 0;

      if (v39)
      {
        v40 = v88;
        __p.__r_.__value_.__r.__words[0] = 0;
        __p.__r_.__value_.__l.__size_ = (std::string::size_type)&__p;
        __p.__r_.__value_.__r.__words[2] = 0x2020000000;
        char v106 = 1;
        uint64_t v101 = 0;
        v102 = &v101;
        uint64_t v103 = 0x2020000000;
        char v104 = 1;
        v99[0] = 0;
        v99[1] = v99;
        v99[2] = 0x2020000000;
        char v100 = 1;
        buf.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
        buf.__r_.__value_.__l.__size_ = 3221225472;
        buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN4scml12_GLOBAL__N_122RuleBasedTextSanitizer20updateWithOvsMatchesEPK10__CFStringjbP20SCMLTextSanitization_block_invoke;
        v93 = &unk_2654A9330;
        p_p = &__p;
        v95 = &v101;
        v96 = v99;
        v97 = v37;
        char v98 = v15;
        v41 = _Block_copy(&buf);
        LXLexiconEnumerateEntriesForString();
        id v42 = [(SCMLTextSanitization *)v40 updateSignal:kSCMLTextSanitizationSignalOVSOffensive[0] withSafe:*(unsigned __int8 *)(__p.__r_.__value_.__l.__size_ + 24)];
        id v43 = [(SCMLTextSanitization *)v40 updateSignal:kSCMLTextSanitizationSignalOVSVulgar[0] withSafe:*((unsigned __int8 *)v102 + 24)];

        _Block_object_dispose(v99, 8);
        _Block_object_dispose(&v101, 8);
        _Block_object_dispose(&__p, 8);

        if ((v15 & 1) == 0 && ![(SCMLTextSanitization *)v40 safe]) {
          goto LABEL_47;
        }
      }
    }
    if ((*(unsigned char *)(v19 + 96) & 0x20) == 0) {
      goto LABEL_50;
    }
    v44 = v88;
    __int16 v45 = *(uint64_t **)(v19 + 16);
    uint64_t v46 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
    id v48 = [(SCMLTextSanitization *)v44 updateSignal:kSCMLTextSanitizationSignalCustomWords[0] withSafe:scml::MultiwordGazetteer::hasGazetteerMatch(v45, v37, v46, v47) ^ 1];
    if (v85)
    {
      __int16 v49 = *(uint64_t **)(v19 + 64);
      uint64_t v50 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
      id v52 = [(SCMLTextSanitization *)v44 updateSignal:kSCMLTextSanitizationSignalPersonalizationBlocklist[0] withSafe:scml::MultiwordGazetteer::hasGazetteerMatch(v49, v37, v50, v51) ^ 1];
    }
    if (v84)
    {
      v53 = *(uint64_t **)(v19 + 24);
      uint64_t v54 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
      id v56 = [(SCMLTextSanitization *)v44 updateSignal:kSCMLTextSanitizationSignalMinorBlocklist[0] withSafe:scml::MultiwordGazetteer::hasGazetteerMatch(v53, v37, v54, v55) ^ 1];
    }

    if ((v15 & 1) == 0 && ![(SCMLTextSanitization *)v44 safe])
    {
LABEL_47:
      char v71 = 0;
      goto LABEL_58;
    }
    if ((v87 & 0x100000000) != 0)
    {
      HIDWORD(v87) = 1;
    }
    else
    {
      v57 = *(uint64_t **)(v19 + 32);
      uint64_t v58 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
      HIDWORD(v87) = scml::MultiwordGazetteer::hasGazetteerMatch(v57, v37, v58, v59);
    }
    if (hasGazetteerMatch)
    {
      int hasGazetteerMatch = 1;
      if (v36) {
        goto LABEL_35;
      }
    }
    else
    {
      v60 = *(uint64_t **)(v19 + 40);
      uint64_t v61 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
      int hasGazetteerMatch = scml::MultiwordGazetteer::hasGazetteerMatch(v60, v37, v61, v62);
      if (v36)
      {
LABEL_35:
        int v36 = 1;
        goto LABEL_38;
      }
    }
    v63 = *(uint64_t **)(v19 + 48);
    uint64_t v64 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
    int v36 = scml::MultiwordGazetteer::hasGazetteerMatch(v63, v37, v64, v65);
LABEL_38:
    if (v87)
    {
      LODWORD(v87) = 1;
    }
    else
    {
      v66 = *(uint64_t **)(v19 + 56);
      uint64_t v67 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v91);
      LODWORD(v87) = scml::MultiwordGazetteer::hasGazetteerMatch(v66, v37, v67, v68);
    }
    if ((HIDWORD(v87) & hasGazetteerMatch) == 1
      && (id v69 = [(SCMLTextSanitization *)v44 updateSignal:kSCMLTextSanitizationSignalDesecration[0] withSafe:0], !v15))
    {
      char v71 = 0;
      HIDWORD(v87) = 1;
      int hasGazetteerMatch = 1;
    }
    else
    {
      if (!v36) {
        goto LABEL_50;
      }
      if (!v87)
      {
        LODWORD(v87) = 0;
        int v36 = 1;
        goto LABEL_50;
      }
      id v70 = [(SCMLTextSanitization *)v44 updateSignal:kSCMLTextSanitizationSignalNationalityFlags withSafe:0];
      int v36 = 1;
      if (v15)
      {
        LODWORD(v87) = 1;
LABEL_50:
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(__CFString *)v37 UTF8String]);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else {
          std::string buf = __p;
        }
        LODWORD(v93) = 0;
        MEMORY[0x26117A4C0](v91, &buf);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        char v71 = 1;
        goto LABEL_58;
      }
      char v71 = 0;
      LODWORD(v87) = 1;
    }
LABEL_58:

    if (v37) {
      CFRelease(v37);
    }
    if ((v71 & 1) == 0) {
      goto LABEL_67;
    }
  }
  if ((HIDWORD(v87) & hasGazetteerMatch & 1) == 0) {
    id v72 = -[SCMLTextSanitization updateSignal:withSafe:](v88, "updateSignal:withSafe:", kSCMLTextSanitizationSignalDesecration[0], 1, v80, v81);
  }
  if ((v36 & v87 & 1) == 0) {
    id v73 = [(SCMLTextSanitization *)v88 updateSignal:kSCMLTextSanitizationSignalNationalityFlags withSafe:1];
  }
LABEL_67:
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v91);
LABEL_68:
  char v31 = 0;
LABEL_69:

  v74 = v109;
  v75 = v74;
  os_signpost_id_t v76 = v110;
  if (v110 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v75, OS_SIGNPOST_INTERVAL_END, v76, "SCMLTextSanitizer.sanitizeText.rules", "", (uint8_t *)&buf, 2u);
  }

  v107[0] = &unk_2709738D8;
  v107[3] = v107;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v111, (uint64_t)v107);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v107);
  if ((v31 & 1) == 0 && ((v15 & 1) != 0 || [(SCMLTextSanitization *)v88 safe]))
  {
    v77 = v88;
    id v78 = v83;
    operator new();
  }
  (*((void (**)(id, SCMLTextSanitization *, void))v83 + 2))(v83, v88, 0);
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v109);

  std::mutex::unlock(v81);
}

- (id)sanitizeText:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SCMLTextSanitizerRequest);
  [(SCMLTextSanitizerRequest *)v7 setText:v6];
  id v8 = [(SCMLTextSanitizer *)self _sanitizeRequest:v7 error:a4];

  return v8;
}

- (id)_sanitizeRequest:(id)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  CFAllocatorRef v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  os_signpost_id_t v18 = __Block_byref_object_copy__4;
  uint64_t v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__SCMLTextSanitizer__sanitizeRequest_error___block_invoke;
  v11[3] = &unk_2654A9308;
  uint64_t v13 = &v21;
  os_signpost_id_t v14 = &v15;
  dispatch_semaphore_t v12 = v7;
  id v8 = v7;
  [(SCMLTextSanitizer *)self sanitizeRequestAsynchronously:v6 completionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __44__SCMLTextSanitizer__sanitizeRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (unsigned)violationCategoryForAdapterLabel:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (scml *)a3;
  scml::strFromNSString(v3, &__p);
  {
    operator new();
  }
  v4 = (void *)+[SCMLTextSanitizer violationCategoryForAdapterLabel:]::violationMap;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v10, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v10 = __p;
  }
  id v5 = std::__hash_table<std::__hash_value_type<std::string,scml::Config>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,scml::Config>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,scml::Config>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,scml::Config>>>::find<std::string>(v4, (unsigned __int8 *)&v10);
  id v6 = v5;
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v10.__r_.__value_.__l.__data_);
    if (v6) {
      goto LABEL_7;
    }
  }
  else if (v5)
  {
LABEL_7:
    unsigned int v7 = *((_DWORD *)v6 + 10);
    goto LABEL_10;
  }
  unsigned int v7 = 1;
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v7;
}

- (NSLocale)locale
{
  return (NSLocale *)*((void *)self + 9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)self + 14, 0);
  std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)self + 13, 0);
  objc_storeStrong((id *)self + 9, 0);

  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void)initWithConfiguration:error:
{
}

- (uint64_t)initWithConfiguration:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_sanitizeRequestAsynchronously:completionHandler:
{
  v2 = *a1;
}

- (uint64_t)_sanitizeRequestAsynchronously:completionHandler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)_sanitizeRequestAsynchronously:completionHandler:
{
  return a1;
}

- (uint64_t)_sanitizeRequestAsynchronously:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  *(void *)a1 = *(id *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "End SCMLTextSanitizer init with error: %s", (uint8_t *)&v4, 0xCu);
}

- (void)initWithConfiguration:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_25BF41000, log, OS_LOG_TYPE_DEBUG, "VisualGeneration adapter on", v1, 2u);
}

- (void)initWithConfiguration:(os_log_t)log error:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_25BF41000, log, OS_LOG_TYPE_DEBUG, "VisualGeneration adapter off", v1, 2u);
}

void __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "End sanitizeText with error: %@", (uint8_t *)&v2, 0xCu);
}

@end