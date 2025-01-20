@interface SCMLPeopleDetector
- (NSLocale)locale;
- (SCMLPeopleDetector)initWithConfiguration:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)detectPeople:(id)a3 error:(id *)a4;
- (uint64_t)initWithConfiguration:error:;
- (void)_detectPeopleAsynchronously:(id)a3 completionHandler:(id)a4;
- (void)detectPeopleAsynchronously:(id)a3 completionHandler:(id)a4;
- (void)initWithConfiguration:error:;
@end

@implementation SCMLPeopleDetector

- (SCMLPeopleDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v32);
  v6 = v32;
  v7 = v6;
  os_signpost_id_t v8 = v33;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SCMLPeopleDetector.init", "", buf, 2u);
  }

  v31[0] = &unk_270973828;
  v31[1] = &v32;
  v31[3] = v31;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v34, (uint64_t)v31);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v31);
  v9 = +[SCMLLog textAnalyzer];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v5 locale];
    v11 = [v10 localeIdentifier];
    *(_DWORD *)buf = 134218242;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_25BF41000, v9, OS_LOG_TYPE_DEFAULT, "Begin SCMLPeopleDetector init inst=%p loc=%@", buf, 0x16u);
  }
  v26.receiver = self;
  v26.super_class = (Class)SCMLPeopleDetector;
  v12 = [(SCMLPeopleDetector *)&v26 init];
  if (v12)
  {
    uint64_t v13 = [v5 locale];
    locale = v12->_locale;
    v12->_locale = (NSLocale *)v13;

    v15 = v12->_locale;
    if (v15)
    {
      v16 = [(NSLocale *)v15 languageCode];
      v17 = [v16 lowercaseString];
      char v18 = [v17 isEqualToString:@"en"];

      if (v18)
      {
        v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v20 = scml::strToNSString((uint64_t)"person_overrides", 16);
        [v19 pathForResource:v20 ofType:@"gaze"];
        objc_claimAutoreleasedReturnValue();

        operator new();
      }
    }
    exception = __cxa_allocate_exception(0x10uLL);
    v24 = [(NSLocale *)v12->_locale localeIdentifier];
    scml::strFromNSString(v24, v25);
    scml::strCat<char const(&)[38],std::string>("Unsupported locale: ", (uint64_t)v25, buf);
    MEMORY[0x26117A7E0](exception, buf);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v21 = (SCMLPeopleDetector *)0;
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v32);

  return v21;
}

- (void)detectPeopleAsynchronously:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v5 = a3;
  scml::SignpostInterval::createAsync((scml::SignpostInterval *)a4);
}

void __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = +[SCMLLog textAnalyzer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v8 = [v5 spans];
      uint64_t v9 = [v8 count];
      v10 = [*(id *)(a1 + 32) string];
      v12 = scml::strEscape(v10, v11);
      *(_DWORD *)buf = 134283779;
      uint64_t v20 = v9;
      __int16 v21 = 2117;
      v22 = v12;
      _os_log_impl(&dword_25BF41000, v7, OS_LOG_TYPE_DEFAULT, "End detectPeople spans=%{private}lu %{sensitive}@", buf, 0x16u);
    }
  }
  else
  {
    v7 = +[SCMLLog textAnalyzer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }

  uint64_t v13 = **(id **)(a1 + 48);
  v14 = v13;
  os_signpost_id_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v14, OS_SIGNPOST_INTERVAL_END, v15, "SCMLPeopleDetector.detectPeople", "", buf, 2u);
  }

  uint64_t v16 = *(void *)(a1 + 48);
  v18[0] = &unk_270973CF8;
  v18[3] = v18;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((void *)(v16 + 16), (uint64_t)v18);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v18);
  v17 = *(scml::SignpostInterval **)(a1 + 48);
  if (v17)
  {
    scml::SignpostInterval::~SignpostInterval(v17);
    MEMORY[0x26117ABD0]();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_detectPeopleAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handler = self->_handler;
  value = self->_personOverrides.__ptr_.__value_;
  v10 = [v6 string];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__SCMLPeopleDetector__detectPeopleAsynchronously_completionHandler___block_invoke;
  v13[3] = &unk_2654A90B0;
  uint64_t v16 = value;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [(SCMLVisualGenerationHandling *)handler predictWithText:v10 completionHandler:v13];
}

void __68__SCMLPeopleDetector__detectPeopleAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v40 = v6;
  v41 = v5;
  uint64_t v39 = a1;
  if (!v5)
  {
    uint64_t v37 = *(void *)(a1 + 40);
    v38 = scml::error(0x13u, (uint64_t)"Failed to query VisualGenerationHandling", 40, v6);
    (*(void (**)(uint64_t, void, void *))(v37 + 16))(v37, 0, v38);

    goto LABEL_44;
  }
  v48 = *(scml::MultiwordGazetteer::Impl ***)(a1 + 48);
  id v45 = [*(id *)(a1 + 32) string];
  id v44 = v5;
  v51 = objc_alloc_init(SCMLPeopleDetection);
  v43 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = [v44 people];
  uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (!v49) {
    goto LABEL_42;
  }
  char v7 = 0;
  uint64_t v47 = *(void *)v57;
  do
  {
    for (uint64_t i = 0; i != v49; ++i)
    {
      if (*(void *)v57 != v47) {
        objc_enumerationMutation(obj);
      }
      os_signpost_id_t v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      if (!scml::MultiwordGazetteer::hasGazetteerMatch(v48, (NSString *)v8))
      {
        uint64_t v9 = (scml::_anonymous_namespace_ *)v45;
        v10 = v8;
        if ([(NSString *)v10 length])
        {
          if (v65 != v66)
          {
            uint64_t v11 = v65[1];
            uint64_t v55 = *v65;
            goto LABEL_13;
          }
          uint64_t v11 = 0;
          NSUInteger v54 = 0;
          uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
          if (v65)
          {
LABEL_13:
            v66 = v65;
            operator delete(v65);
            NSUInteger v54 = v11;
          }
        }
        else
        {
          NSUInteger v54 = 0;
          uint64_t v55 = 0;
        }

        if (v55 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = [v44 people];
          v53 = [v12 objectForKeyedSubscript:v10];

          if (v7) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = [v53 isGroup];
          }
          [(SCMLPeopleDetection *)v51 setHasMultiplePeople:v13];
          if ([(SCMLPeopleDetection *)v51 hasGenericPeople]) {
            uint64_t v14 = 1;
          }
          else {
            uint64_t v14 = [v53 specific] ^ 1;
          }
          [(SCMLPeopleDetection *)v51 setHasGenericPeople:v14];
          if ([(SCMLPeopleDetection *)v51 hasGender]) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = [v53 hasGender];
          }
          [(SCMLPeopleDetection *)v51 setHasGender:v15];
          if ([(SCMLPeopleDetection *)v51 hasEthnicity]) {
            uint64_t v16 = 1;
          }
          else {
            uint64_t v16 = [v53 hasEthnicity];
          }
          [(SCMLPeopleDetection *)v51 setHasEthnicity:v16];
          if ([(SCMLPeopleDetection *)v51 hasAge]) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = [v53 hasAge];
          }
          [(SCMLPeopleDetection *)v51 setHasAge:v17];
          char v18 = objc_alloc_init(SCMLPeopleDetectionSpan);
          -[SCMLPeopleDetectionSpan setRange:](v18, "setRange:", v55, v54);
          -[SCMLPeopleDetectionSpan setIsGeneric:](v18, "setIsGeneric:", [v53 specific] ^ 1);
          -[SCMLPeopleDetectionSpan setIsGroup:](v18, "setIsGroup:", [v53 isGroup]);
          -[SCMLPeopleDetectionSpan setHasAge:](v18, "setHasAge:", [v53 hasAge]);
          -[SCMLPeopleDetectionSpan setHasGender:](v18, "setHasGender:", [v53 hasGender]);
          -[SCMLPeopleDetectionSpan setHasEthnicity:](v18, "setHasEthnicity:", [v53 hasEthnicity]);
          v19 = [v53 age];
          uint64_t v20 = v50 = v18;
          [(SCMLPeopleDetectionSpan *)v18 setAgeSpans:v20];

          __int16 v21 = [v53 gender];
          v22 = v9;
          id v42 = v21;
          uint64_t v23 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v24 = v42;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v60 objects:&v65 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v61;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v61 != v26) {
                  objc_enumerationMutation(v24);
                }
                v28 = *(void **)(*((void *)&v60 + 1) + 8 * j);
                __int16 v29 = [v28 term];
                v68.location = v54;
                uint64_t v32 = v31;

                if (AttributeSpan != 0x7FFFFFFFFFFFFFFFLL)
                {
                  os_signpost_id_t v33 = objc_opt_new();
                  objc_msgSend(v33, "setRange:", AttributeSpan, v32);
                  objc_msgSend(v33, "setGender:", objc_msgSend(v28, "gender"));
                  [v23 addObject:v33];
                }
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v60 objects:&v65 count:16];
            }
            while (v25);
          }

          [(SCMLPeopleDetectionSpan *)v50 setGenderSpans:v23];
          v35 = v34 = [v53 ethnicity];
          [(SCMLPeopleDetectionSpan *)v50 setEthnicitySpans:v35];

          -[SCMLPeopleDetectionSpan setHasImplicitCategoryRequiringPersonalization:](v50, "setHasImplicitCategoryRequiringPersonalization:", [v53 hasImplicitCategoryRequiringPersonalization]);
          [v43 addObject:v50];

          char v7 = 1;
        }
        continue;
      }
    }
    uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  }
  while (v49);
LABEL_42:

  v36 = [v43 sortedArrayUsingComparator:&__block_literal_global_1];
  [(SCMLPeopleDetection *)v51 setSpans:v36];

  (*(void (**)(void))(*(void *)(v39 + 40) + 16))();
LABEL_44:
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)&self->_personOverrides, 0);

  objc_storeStrong((id *)&self->_handler, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
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

- (id)detectPeople:(id)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__SCMLPeopleDetector_Test__detectPeople_error___block_invoke;
  v11[3] = &unk_2654A9148;
  uint64_t v13 = &v21;
  uint64_t v14 = &v15;
  dispatch_semaphore_t v12 = v7;
  os_signpost_id_t v8 = v7;
  [(SCMLPeopleDetector *)self detectPeopleAsynchronously:v6 completionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__SCMLPeopleDetector_Test__detectPeople_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "End SCMLPeopleDetector init with error: %s", (uint8_t *)&v4, 0xCu);
}

void __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "End detectPeople with error: %@", (uint8_t *)&v2, 0xCu);
}

@end