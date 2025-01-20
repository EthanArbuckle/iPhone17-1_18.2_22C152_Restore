@interface SEMSpanMatcher
+ (id)indexMatcher;
+ (id)injectedEntityMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5;
+ (id)itemMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)_isUserVaultEnabled;
- (BOOL)_searchIndexSiteWithType:(unsigned __int8)a3 addToResults:(id)a4 query:(id)a5 error:(id *)a6;
- (BOOL)setEntityPool:(id)a3 error:(id *)a4;
- (SEMSpanMatcher)init;
- (SEMSpanMatcher)initWithSkitAccessProvider:(id)a3 resultInterpreter:(id)a4;
- (id)_matchSpans:(id)a3 error:(id *)a4;
- (id)indexLocale:(id *)a3;
- (id)indexLocaleWithUserId:(id)a3 error:(id *)a4;
- (id)matchSpans:(id)a3 error:(id *)a4;
- (id)matchSpans:(id)a3 userId:(id)a4 error:(id *)a5;
- (void)prewarmIndex;
- (void)prewarmIndexWithUserId:(id)a3;
@end

@implementation SEMSpanMatcher

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

+ (id)indexMatcher
{
  v4 = objc_msgSend_defaultSharedInstance(SEMIndexSiteReadAccess, a2, v2, v3);
  v5 = objc_alloc_init(SEMSpanMatchResultInterpreter);
  id v6 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend_initWithSkitAccessProvider_resultInterpreter_(v6, v7, (uint64_t)v4, (uint64_t)v5);

  return v8;
}

+ (id)injectedEntityMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [SEMSkitInjector alloc];
  v11 = objc_msgSend_initWithTokenizer_error_(v9, v10, (uint64_t)v8, (uint64_t)a5);

  if (v11 && objc_msgSend_setEntityPool_error_(v11, v12, (uint64_t)v7, (uint64_t)a5))
  {
    v13 = objc_alloc_init(SEMSpanMatchResultInterpreter);
    id v14 = objc_alloc((Class)objc_opt_class());
    v16 = objc_msgSend_initWithSkitAccessProvider_resultInterpreter_(v14, v15, (uint64_t)v11, (uint64_t)v13);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)itemMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_class();
  v11 = objc_msgSend_injectedEntityMatcher_tokenizer_error_(v9, v10, (uint64_t)v8, (uint64_t)v7, a5);

  return v11;
}

- (SEMSpanMatcher)initWithSkitAccessProvider:(id)a3 resultInterpreter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SEMSpanMatcher;
  v9 = [(SEMSpanMatcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_skitProvider, a3);
    objc_storeStrong((id *)&v10->_interpreter, a4);
  }

  return v10;
}

- (SEMSpanMatcher)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)setEntityPool:(id)a3 error:(id *)a4
{
  return objc_msgSend_setEntityPool_error_(self->_skitProvider, a2, (uint64_t)a3, (uint64_t)a4);
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)qword_26B3549D8);
  id v8 = (id)qword_26B3549D8;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v31[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_25C7CA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "matchSpans", (const char *)&unk_25C84405F, (uint8_t *)v31, 2u);
  }

  v11 = objc_msgSend__matchSpans_error_(self, v10, (uint64_t)v6, (uint64_t)a4);
  objc_super v12 = (id)qword_26B3549D8;
  v13 = v12;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v17 = objc_msgSend_tokenCount(v6, v14, v15, v16);
    int v21 = objc_msgSend_count(v11, v18, v19, v20);
    v25 = objc_msgSend_locale(v6, v22, v23, v24);
    v29 = objc_msgSend_localeIdentifier(v25, v26, v27, v28);
    v31[0] = 67240706;
    v31[1] = v17;
    __int16 v32 = 1026;
    int v33 = v21;
    __int16 v34 = 2114;
    v35 = v29;
    _os_signpost_emit_with_name_impl(&dword_25C7CA000, v13, OS_SIGNPOST_INTERVAL_END, v7, "matchSpans", " queryTokenCnt=%{public,signpost.telemetry:number1}d  resultCnt=%{public,signpost.telemetry:number2}d  locale=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", (uint8_t *)v31, 0x18u);
  }
  return v11;
}

- (id)matchSpans:(id)a3 userId:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v10 = a4;
  if (v10)
  {
    v11 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[SEMSpanMatcher matchSpans:userId:error:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_INFO, "%s Ignoring userId (%@) from deprecated API", (uint8_t *)&v14, 0x16u);
    }
  }
  objc_super v12 = objc_msgSend_matchSpans_error_(self, v9, (uint64_t)v8, (uint64_t)a5);

  return v12;
}

- (id)_matchSpans:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend__searchIndexSiteWithType_addToResults_query_error_(self, v8, 1, (uint64_t)v7, v6, a4))
  {
    if (!objc_msgSend__isUserVaultEnabled(self, v9, v10, v11)) {
      goto LABEL_7;
    }
    if (objc_msgSend_currentPersonaIsDefault(SEMPersonaUtilities, v12, v13, v14))
    {
      __int16 v16 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        id v17 = v16;
        int v21 = objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, v18, v19, v20);
        int v24 = 136315394;
        v25 = "-[SEMSpanMatcher _matchSpans:error:]";
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        _os_log_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_INFO, "%s Current persona (%@) is default. Will not attempt to search a UserVault index", (uint8_t *)&v24, 0x16u);
      }
      goto LABEL_7;
    }
    if (objc_msgSend__searchIndexSiteWithType_addToResults_query_error_(self, v15, 2, (uint64_t)v7, v6, a4))
    {
LABEL_7:
      v22 = objc_msgSend_interpretSpanMatchResults_ofQuery_(self->_interpreter, v12, (uint64_t)v7, (uint64_t)v6);
      goto LABEL_9;
    }
  }
  v22 = 0;
LABEL_9:

  return v22;
}

- (BOOL)_isUserVaultEnabled
{
  int isUserVaultEnabled = objc_msgSend_isUserVaultEnabled(SEMSettings, a2, v2, v3);
  if (isUserVaultEnabled)
  {
    skitProvider = self->_skitProvider;
    LOBYTE(isUserVaultEnabled) = MEMORY[0x270F9A6D0](skitProvider, sel_supportsIndexSiteType_, 2, v6);
  }
  return isUserVaultEnabled;
}

- (BOOL)_searchIndexSiteWithType:(unsigned __int8)a3 addToResults:(id)a4 query:(id)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  uint64_t v14 = objc_msgSend_skitReadAccessWithIndexSiteType_(self->_skitProvider, v12, v8, v13);
  if (!objc_msgSend_isEmpty(v14, v15, v16, v17))
  {
    int v28 = objc_msgSend_useSensitiveLogging(SEMSettings, v18, v19, v20);
    v29 = (void *)qword_26B3549D8;
    BOOL v30 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (!v30) {
        goto LABEL_10;
      }
      skitProvider = self->_skitProvider;
      int v33 = v29;
      v37 = objc_msgSend_accessDescription(skitProvider, v34, v35, v36);
      *(_DWORD *)buf = 136315907;
      v70 = "-[SEMSpanMatcher _searchIndexSiteWithType:addToResults:query:error:]";
      __int16 v71 = 2112;
      v72 = v14;
      __int16 v73 = 2112;
      v74 = v37;
      __int16 v75 = 2117;
      id v76 = v11;
      v38 = "%s (%@) Searching SKIT %@: %{sensitive}@";
    }
    else
    {
      if (!v30) {
        goto LABEL_10;
      }
      v39 = self->_skitProvider;
      int v33 = v29;
      v37 = objc_msgSend_accessDescription(v39, v40, v41, v42);
      *(_DWORD *)buf = 136315906;
      v70 = "-[SEMSpanMatcher _searchIndexSiteWithType:addToResults:query:error:]";
      __int16 v71 = 2112;
      v72 = v14;
      __int16 v73 = 2112;
      v74 = v37;
      __int16 v75 = 2112;
      id v76 = v11;
      v38 = "%s (%@) Searching SKIT %@: %@";
    }
    _os_log_impl(&dword_25C7CA000, v33, OS_LOG_TYPE_INFO, v38, buf, 0x2Au);

LABEL_10:
    id v68 = 0;
    v43 = objc_msgSend_matchSpans_error_(v14, v31, (uint64_t)v11, (uint64_t)&v68);
    id v44 = v68;
    v45 = v44;
    BOOL v22 = v43 != 0;
    if (v43)
    {
      v46 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        v49 = self->_skitProvider;
        v50 = v46;
        v54 = objc_msgSend_accessDescription(v49, v51, v52, v53);
        int v58 = objc_msgSend_count(v43, v55, v56, v57);
        *(_DWORD *)buf = 136315906;
        v70 = "-[SEMSpanMatcher _searchIndexSiteWithType:addToResults:query:error:]";
        __int16 v71 = 2112;
        v72 = v14;
        __int16 v73 = 2112;
        v74 = v54;
        __int16 v75 = 1024;
        LODWORD(v76) = v58;
        _os_log_impl(&dword_25C7CA000, v50, OS_LOG_TYPE_INFO, "%s (%@) %@ search matched %u results", buf, 0x26u);
      }
      objc_msgSend_addObjectsFromArray_(v10, v47, (uint64_t)v43, v48);
      goto LABEL_19;
    }
    v59 = sub_25C813028(v44, 6, 0);
    v60 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v62 = self->_skitProvider;
      v63 = v60;
      v67 = objc_msgSend_accessDescription(v62, v64, v65, v66);
      *(_DWORD *)buf = 136315906;
      v70 = "-[SEMSpanMatcher _searchIndexSiteWithType:addToResults:query:error:]";
      __int16 v71 = 2112;
      v72 = v14;
      __int16 v73 = 2112;
      v74 = v67;
      __int16 v75 = 2112;
      id v76 = v59;
      _os_log_error_impl(&dword_25C7CA000, v63, OS_LOG_TYPE_ERROR, "%s (%@) Failed to search SKIT (%@) for matching spans. Error: %@", buf, 0x2Au);

      if (a6)
      {
LABEL_16:
        if (v59) {
          *a6 = v59;
        }
      }
    }
    else if (a6)
    {
      goto LABEL_16;
    }

LABEL_19:
    goto LABEL_20;
  }
  int v21 = (void *)qword_26B3549D8;
  BOOL v22 = 1;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = v21;
    uint64_t v27 = sub_25C7FBC68(v8, v24, v25, v26);
    *(_DWORD *)buf = 136315650;
    v70 = "-[SEMSpanMatcher _searchIndexSiteWithType:addToResults:query:error:]";
    __int16 v71 = 2112;
    v72 = v14;
    __int16 v73 = 2112;
    v74 = v27;
    _os_log_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_INFO, "%s Skipping (%@) as site (%@) is empty / nonexistent", buf, 0x20u);
  }
LABEL_20:

  return v22;
}

- (id)indexLocale:(id *)a3
{
  uint64_t v6 = objc_msgSend_skitReadAccessWithIndexSiteType_(self->_skitProvider, a2, 1, v3);
  objc_msgSend_indexLocale(v6, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend__isUserVaultEnabled(self, v11, v12, v13)) {
    goto LABEL_7;
  }
  uint64_t v16 = objc_msgSend_skitReadAccessWithIndexSiteType_(self->_skitProvider, v14, 2, v15);
  uint64_t v20 = objc_msgSend_indexLocale(v16, v17, v18, v19);
  uint64_t v23 = v20;
  if (!v20)
  {
LABEL_6:

LABEL_7:
    if (!v10)
    {
      int v28 = objc_msgSend_stringWithFormat_(NSString, v14, @"Failed to read index locale (%@)", v15, v6);
      v29 = sub_25C813028(0, 6, v28);

      if (a3 && v29) {
        *a3 = v29;
      }
    }
    id v10 = v10;
    BOOL v30 = v10;
    goto LABEL_13;
  }
  if (!v10 || objc_msgSend_isEqual_(v20, v21, (uint64_t)v10, v22))
  {
    id v27 = v23;

    id v10 = v27;
    goto LABEL_6;
  }
  __int16 v32 = NSString;
  int v33 = objc_msgSend_localeIdentifier(v10, v24, v25, v26);
  v37 = objc_msgSend_localeIdentifier(v23, v34, v35, v36);
  v40 = objc_msgSend_stringWithFormat_(v32, v38, @"Inconsistent locales (%@): %@ (%@): %@", v39, v6, v33, v16, v37);
  uint64_t v41 = sub_25C813028(0, 6, v40);

  if (a3 && v41) {
    *a3 = v41;
  }

  BOOL v30 = 0;
LABEL_13:

  return v30;
}

- (id)indexLocaleWithUserId:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[SEMSpanMatcher indexLocaleWithUserId:error:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Ignoring userId (%@) from deprecated API", (uint8_t *)&v12, 0x16u);
    }
  }
  id v10 = objc_msgSend_indexLocale_(self, v6, (uint64_t)a4, v7);

  return v10;
}

- (void)prewarmIndex
{
  v4 = objc_msgSend_skitReadAccessWithIndexSiteType_(self->_skitProvider, a2, 1, v2);
  objc_msgSend_prewarm(v4, v5, v6, v7);

  if (objc_msgSend__isUserVaultEnabled(self, v8, v9, v10))
  {
    objc_msgSend_skitReadAccessWithIndexSiteType_(self->_skitProvider, v11, 2, v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prewarm(v16, v13, v14, v15);
  }
}

- (void)prewarmIndexWithUserId:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[SEMSpanMatcher prewarmIndexWithUserId:]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s Ignoring userId (%@) from deprecated API", (uint8_t *)&v9, 0x16u);
    }
  }
  objc_msgSend_prewarmIndex(self, v4, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpreter, 0);
  objc_storeStrong((id *)&self->_skitProvider, 0);
}

@end