@interface SEMAppCustomVocabularySearcher
+ (void)initialize;
- (BOOL)_validateAppIds:(id)a3 andAddToCriteria:(id)a4;
- (BOOL)_validateCustomTypes:(id)a3 andAddToCriteria:(id)a4;
- (SEMAppCustomVocabularySearcher)init;
- (SEMAppCustomVocabularySearcher)initWithFtsMatcher:(id)a3;
- (SEMAppCustomVocabularySearcher)initWithUserId:(id)a3;
- (id)searchAppCustomVocabularyFTS:(id)a3 appIds:(id)a4 types:(id)a5;
- (id)searchAppCustomVocabularyFTSWithWildcardPatterns:(id)a3 appIds:(id)a4 types:(id)a5;
@end

@implementation SEMAppCustomVocabularySearcher

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMAppCustomVocabularySearcher)init
{
  v5 = objc_msgSend_defaultSharedInstance(SEMIndexSiteReadAccess, a2, v2, v3);
  v6 = [SEMFTSMatcher alloc];
  v9 = objc_msgSend_initWithFTSAccessProvider_(v6, v7, (uint64_t)v5, v8);
  v12 = (SEMAppCustomVocabularySearcher *)objc_msgSend_initWithFtsMatcher_(self, v10, (uint64_t)v9, v11);

  return v12;
}

- (SEMAppCustomVocabularySearcher)initWithUserId:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      v12 = "-[SEMAppCustomVocabularySearcher initWithUserId:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s Ignoring userId (%@) from deprecated API", (uint8_t *)&v11, 0x16u);
    }
  }
  v9 = (SEMAppCustomVocabularySearcher *)objc_msgSend_init(self, v4, v5, v6);

  return v9;
}

- (SEMAppCustomVocabularySearcher)initWithFtsMatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SEMAppCustomVocabularySearcher;
  uint64_t v6 = [(SEMAppCustomVocabularySearcher *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ftsMatcher, a3);
  }

  return v7;
}

- (id)searchAppCustomVocabularyFTS:(id)a3 appIds:(id)a4 types:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (v8 && objc_msgSend_length(v8, v10, v11, v12))
  {
    v16 = objc_msgSend_builderWithMatchTerm_(SEMFTSCriteria, v14, (uint64_t)v8, v15);
    if (objc_msgSend__validateAppIds_andAddToCriteria_(self, v17, (uint64_t)v9, (uint64_t)v16)
      && objc_msgSend__validateCustomTypes_andAddToCriteria_(self, v18, (uint64_t)v13, (uint64_t)v16))
    {
      os_signpost_id_t v19 = os_signpost_id_generate((os_log_t)qword_26B3549D8);
      v20 = (id)qword_26B3549D8;
      v21 = v20;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25C7CA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "searchAppCustomVocabularyFTS", (const char *)&unk_25C84405F, buf, 2u);
      }

      ftsMatcher = self->_ftsMatcher;
      v26 = objc_msgSend_build(v16, v23, v24, v25);
      id v43 = 0;
      v28 = objc_msgSend_searchFTSWithCriteria_error_(ftsMatcher, v27, (uint64_t)v26, (uint64_t)&v43);
      id v29 = v43;

      v30 = (id)qword_26B3549D8;
      v31 = v30;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        int v35 = objc_msgSend_length(v8, v32, v33, v34);
        int v39 = objc_msgSend_count(v28, v36, v37, v38);
        *(_DWORD *)buf = 67240448;
        *(_DWORD *)v45 = v35;
        *(_WORD *)&v45[4] = 1026;
        *(_DWORD *)&v45[6] = v39;
        _os_signpost_emit_with_name_impl(&dword_25C7CA000, v31, OS_SIGNPOST_INTERVAL_END, v19, "searchAppCustomVocabularyFTS", " queryCharCnt=%{public,signpost.telemetry:number1}d  resultCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", buf, 0xEu);
      }

      if (v29)
      {
        v40 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v45 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTS:appIds:types:]";
          *(_WORD *)&v45[8] = 2112;
          id v46 = v29;
          _os_log_error_impl(&dword_25C7CA000, v40, OS_LOG_TYPE_ERROR, "%s search service encountered error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v41 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v45 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTS:appIds:types:]";
      _os_log_error_impl(&dword_25C7CA000, v41, OS_LOG_TYPE_ERROR, "%s Input validity check failed. The search term cannot be empty!", buf, 0xCu);
    }
    v28 = (void *)MEMORY[0x263EFFA68];
  }

  return v28;
}

- (id)searchAppCustomVocabularyFTSWithWildcardPatterns:(id)a3 appIds:(id)a4 types:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (v8 && objc_msgSend_count(v8, v10, v11, v12))
  {
    v16 = objc_msgSend_builderWithLikeTerms_(SEMFTSCriteria, v14, (uint64_t)v8, v15);
    if (objc_msgSend__validateAppIds_andAddToCriteria_(self, v17, (uint64_t)v9, (uint64_t)v16)
      && objc_msgSend__validateCustomTypes_andAddToCriteria_(self, v18, (uint64_t)v13, (uint64_t)v16))
    {
      os_signpost_id_t v19 = os_signpost_id_generate((os_log_t)qword_26B3549D8);
      v20 = (id)qword_26B3549D8;
      v21 = v20;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25C7CA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "searchAppCustomVocabularyFTSWithWildcardPatterns", (const char *)&unk_25C84405F, buf, 2u);
      }

      ftsMatcher = self->_ftsMatcher;
      v26 = objc_msgSend_build(v16, v23, v24, v25);
      id v46 = 0;
      v28 = objc_msgSend_searchFTSWithCriteria_error_(ftsMatcher, v27, (uint64_t)v26, (uint64_t)&v46);
      id v29 = v46;

      v30 = (id)qword_26B3549D8;
      v31 = v30;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        v45 = objc_msgSend_componentsJoinedByString_(v8, v32, @" ", v33);
        int v37 = objc_msgSend_length(v45, v34, v35, v36);
        int v41 = objc_msgSend_count(v28, v38, v39, v40);
        *(_DWORD *)buf = 67240448;
        *(_DWORD *)v48 = v37;
        *(_WORD *)&v48[4] = 1026;
        *(_DWORD *)&v48[6] = v41;
        _os_signpost_emit_with_name_impl(&dword_25C7CA000, v31, OS_SIGNPOST_INTERVAL_END, v19, "searchAppCustomVocabularyFTSWithWildcardPatterns", " queryCharCnt=%{public,signpost.telemetry:number1}d  resultCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", buf, 0xEu);
      }
      if (v29)
      {
        v42 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v48 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTSWithWildcardPatterns:appIds:types:]";
          *(_WORD *)&v48[8] = 2112;
          id v49 = v29;
          _os_log_error_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_ERROR, "%s search service encountered error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v43 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v48 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTSWithWildcardPatterns:appIds:types:]";
      _os_log_error_impl(&dword_25C7CA000, v43, OS_LOG_TYPE_ERROR, "%s Input validity check failed. The search patterns cannot be empty!", buf, 0xCu);
    }
    v28 = (void *)MEMORY[0x263EFFA68];
  }

  return v28;
}

- (BOOL)_validateAppIds:(id)a3 andAddToCriteria:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v9 = a4;
  if (v5 && objc_msgSend_count(v5, v6, v7, v8))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v13 = objc_msgSend_allObjects(v5, v10, v11, v12);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v32, (uint64_t)v42, 16);
      if (v15)
      {
        uint64_t v17 = v15;
        uint64_t v18 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v13);
            }
            uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            id v31 = 0;
            id v21 = (id)objc_msgSend_addOriginAppFilterWithAppId_error_(v9, v16, v20, (uint64_t)&v31);
            id v22 = v31;
            if (v22)
            {
              uint64_t v25 = v22;
              v26 = qword_26B3549D8;
              if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                int v37 = "-[SEMAppCustomVocabularySearcher _validateAppIds:andAddToCriteria:]";
                __int16 v38 = 2112;
                uint64_t v39 = v20;
                _os_log_error_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_ERROR, "%s Received unsupported appId (%@) appIds must be non-empty strings.", buf, 0x16u);
                v26 = qword_26B3549D8;
              }
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                int v37 = "-[SEMAppCustomVocabularySearcher _validateAppIds:andAddToCriteria:]";
                __int16 v38 = 2112;
                uint64_t v39 = v20;
                __int16 v40 = 2112;
                int v41 = v25;
                _os_log_debug_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_DEBUG, "%s Criteria builder did not accept appId (%@) due to error: %@", buf, 0x20u);
              }

              BOOL v23 = 0;
              goto LABEL_22;
            }
          }
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v32, (uint64_t)v42, 16);
          if (v17) {
            continue;
          }
          break;
        }
      }
      BOOL v23 = 1;
LABEL_22:
    }
    else
    {
      uint64_t v24 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v28 = v24;
        id v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 136315394;
        int v37 = "-[SEMAppCustomVocabularySearcher _validateAppIds:andAddToCriteria:]";
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v30;
        _os_log_error_impl(&dword_25C7CA000, v28, OS_LOG_TYPE_ERROR, "%s appIds parameter must be of class NSSet. Found class=%@", buf, 0x16u);
      }
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 1;
  }

  return v23;
}

- (BOOL)_validateCustomTypes:(id)a3 andAddToCriteria:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v9 = a4;
  if (v5 && objc_msgSend_count(v5, v6, v7, v8))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v10 = v5;
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v35, (uint64_t)v45, 16);
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v36;
LABEL_6:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * v16);
          id v34 = 0;
          id v18 = (id)objc_msgSend_addFieldTypeFilterWithCustomTypeNumber_error_(v9, v13, v17, (uint64_t)&v34);
          id v19 = v34;
          if (v19) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v35, (uint64_t)v45, 16);
            if (v14) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        uint64_t v24 = v19;
        uint64_t v25 = objc_msgSend_code(v19, v13, v20, v21);
        v26 = qword_26B3549D8;
        BOOL v27 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR);
        if (v25 == 4)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v40 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
            __int16 v41 = 2112;
            uint64_t v42 = v17;
            v28 = "%s vocabularyType (%@) is invalid. Refer to the enum definition in SEMAppCustomVocabularyType.h for su"
                  "pported vocabulary types.";
LABEL_27:
            _os_log_error_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
          }
        }
        else if (v27)
        {
          *(_DWORD *)buf = 136315394;
          __int16 v40 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
          __int16 v41 = 2112;
          uint64_t v42 = v17;
          v28 = "%s Received unsupported vocabularyType (%@). vocabularyTypes must be valid SEMAppCustomVocabularyTypeNumber objects.";
          goto LABEL_27;
        }
        id v29 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v40 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
          __int16 v41 = 2112;
          uint64_t v42 = v17;
          __int16 v43 = 2112;
          v44 = v24;
          _os_log_debug_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_DEBUG, "%s Criteria builder did not accept vocabularyType (%@) due to error: %@", buf, 0x20u);
        }

        BOOL v22 = 0;
        goto LABEL_24;
      }
LABEL_12:
      BOOL v22 = 1;
LABEL_24:
    }
    else
    {
      BOOL v23 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        id v31 = v23;
        long long v32 = (objc_class *)objc_opt_class();
        long long v33 = NSStringFromClass(v32);
        *(_DWORD *)buf = 136315394;
        __int16 v40 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v33;
        _os_log_error_impl(&dword_25C7CA000, v31, OS_LOG_TYPE_ERROR, "%s vocabularyTypes parameter must be of class NSSet. Found class: %@", buf, 0x16u);
      }
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (void).cxx_destruct
{
}

@end