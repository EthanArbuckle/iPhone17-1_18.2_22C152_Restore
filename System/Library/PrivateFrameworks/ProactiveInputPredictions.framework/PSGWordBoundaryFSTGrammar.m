@interface PSGWordBoundaryFSTGrammar
+ (id)sharedInstance;
- (PSGWordBoundaryFSTGrammar)init;
- (id)_getLMWrapper:(id)a3;
- (id)_getPrimingToken:(void *)a3 transientTokenID:(unsigned int)a4;
- (id)getOTAPathForProactiveBundle:(id)a3;
- (id)triggerAttributesForContext:(id)a3 localeIdentifier:(id)a4;
- (void)_createLanguageModel:(id)a3;
- (void)_createLexicon:(id)a3;
- (void)clearLMCache;
- (void)warmUpForLocaleIdentifier:(id)a3;
- (void)warmUpForLocaleIdentifier:(id)a3 waitForCompletion:(BOOL)a4;
@end

@implementation PSGWordBoundaryFSTGrammar

- (void)clearLMCache
{
  v3 = psg_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_20A02A000, v3, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] Clearing LM cache", v4, 2u);
  }

  [(NSCache *)self->_lmWrapperCache removeAllObjects];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSGWordBoundaryFSTGrammar_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasOnceToken5 != -1) {
    dispatch_once(&+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasOnceToken5, block);
  }
  v2 = (void *)+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasExprOnceResult;
  return v2;
}

- (void)warmUpForLocaleIdentifier:(id)a3 waitForCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = psg_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_debug_impl(&dword_20A02A000, v7, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] warming up for %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = [(PSGWordBoundaryFSTGrammar *)self _getLMWrapper:v6];
  if (v4)
  {
    dispatch_sync((dispatch_queue_t)self->_lmWrapperQueue, &__block_literal_global);
    uint64_t v9 = [(NSCache *)self->_lmWrapperCache objectForKey:v6];

    v8 = (void *)v9;
  }
  v10 = psg_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_debug_impl(&dword_20A02A000, v10, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] wrapper instance %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)warmUpForLocaleIdentifier:(id)a3
{
}

- (id)_getLMWrapper:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_lmWrapperCache objectForKey:v4];
  if (!v5)
  {
    lmWrapperQueue = self->_lmWrapperQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__PSGWordBoundaryFSTGrammar__getLMWrapper___block_invoke;
    v8[3] = &unk_263FCF898;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(lmWrapperQueue, v8);
  }
  return v5;
}

void __43__PSGWordBoundaryFSTGrammar__getLMWrapper___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _createLanguageModel:*(void *)(a1 + 40)];
    if (v3 && [*(id *)(a1 + 40) hasPrefix:@"zh"]) {
      uint64_t v4 = [*(id *)(a1 + 32) _createLexicon:*(void *)(a1 + 40)];
    }
    else {
      uint64_t v4 = 0;
    }
    v2 = [[PSGLMWrapper alloc] initWithLangModel:v3 lexicon:v4];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKey:*(void *)(a1 + 40)];
    v5 = psg_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(PSGLMWrapper *)v2 langModel];
      uint64_t v7 = [(PSGLMWrapper *)v2 lexicon];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138413058;
      v10 = v2;
      __int16 v11 = 1024;
      BOOL v12 = v6 != 0;
      __int16 v13 = 1024;
      BOOL v14 = v7 != 0;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_debug_impl(&dword_20A02A000, v5, OS_LOG_TYPE_DEBUG, "[PSGWordBoundaryFSTGrammar] created wrapper instance %@ (model? %d; lexicon? %d) for %@",
        (uint8_t *)&v9,
        0x22u);
    }
  }
}

- (void)_createLanguageModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (__CFString *)a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFLocaleRef v6 = CFLocaleCreate(0, v4);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A8], v6);
  uint64_t v7 = (const void *)*MEMORY[0x263EFFB38];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51248], (const void *)*MEMORY[0x263EFFB38]);
  uint64_t v8 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51298], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512D8], v7);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512B0], v8);
  if ([(__CFString *)v4 hasPrefix:@"hi"])
  {
    int v9 = [(PSGWordBoundaryFSTGrammar *)self getOTAPathForProactiveBundle:v4];
    if (v9)
    {
      v10 = (void *)[objc_alloc(NSURL) initWithString:v9];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51268], (const void *)[v10 path]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51258], @"hi");
    }
  }
  __int16 v11 = (void *)LMLanguageModelCreate();
  if (v11)
  {
    LMVocabularyGetSharedVocabulary();
    LMLanguageModelAddTransientVocabulary();
  }
  else
  {
    BOOL v12 = psg_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      __int16 v15 = v4;
      _os_log_error_impl(&dword_20A02A000, v12, OS_LOG_TYPE_ERROR, "Cannot create language model for %@ locale.", (uint8_t *)&v14, 0xCu);
    }
  }
  CFRelease(v6);
  CFRelease(Mutable);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lmWrapperQueue, 0);
  objc_storeStrong((id *)&self->_lmWrapperCache, 0);
}

- (id)triggerAttributesForContext:(id)a3 localeIdentifier:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v55 = a4;
  CFLocaleRef v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if (![v7 length])
  {
    v28 = 0;
    goto LABEL_68;
  }
  uint64_t v8 = psg_default_log_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = psg_default_log_handle();
  __int16 v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A02A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PSGWordBoundaryFSTGrammar_initialization", (const char *)&unk_20A040562, buf, 2u);
  }

  v54 = [(PSGWordBoundaryFSTGrammar *)self _getLMWrapper:v55];
  BOOL v12 = psg_default_log_handle();
  __int16 v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A02A000, v13, OS_SIGNPOST_INTERVAL_END, v9, "PSGWordBoundaryFSTGrammar_initialization", (const char *)&unk_20A040562, buf, 2u);
  }

  uint64_t v14 = [v54 langModel];
  if (!v14)
  {
    v29 = psg_default_log_handle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v55;
      _os_log_error_impl(&dword_20A02A000, v29, OS_LOG_TYPE_ERROR, "Failed to create language model for locale: %@", buf, 0xCu);
    }

    v28 = 0;
    goto LABEL_67;
  }
  uint64_t v51 = [v54 lexicon];
  __int16 v15 = psg_default_log_handle();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  uint64_t v17 = psg_default_log_handle();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A02A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PSGWordBoundaryFSTGrammar_tokenization", (const char *)&unk_20A040562, buf, 2u);
  }

  v56 = 0;
  v57 = 0;
  uint64_t v58 = 0;
  id v19 = v7;
  id v20 = v55;
  v52 = v19;

  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x4812000000;
  v66 = __Block_byref_object_copy__60;
  v67 = __Block_byref_object_dispose__61;
  v68 = "";
  v70 = 0;
  uint64_t v71 = 0;
  __p = 0;
  if (!LMStreamTokenizerCreate())
  {
    v30 = psg_default_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v20;
      _os_log_error_impl(&dword_20A02A000, v30, OS_LOG_TYPE_ERROR, "Cannot create tokenizer for %@ locale.", buf, 0xCu);
    }
    goto LABEL_24;
  }
  id v21 = v19;
  uint64_t v22 = [v21 cStringUsingEncoding:4];
  uint64_t v23 = [v21 lengthOfBytesUsingEncoding:4];
  if (!v22 || !v23)
  {
    v30 = psg_default_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20A02A000, v30, OS_LOG_TYPE_ERROR, "Cannot convert input string with UTF8 encoding.", buf, 2u);
    }
LABEL_24:

    v57 = 0;
    uint64_t v58 = 0;
    v56 = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v56, (const void *)v64[6], v64[7], (v64[7] - v64[6]) >> 2);
    goto LABEL_30;
  }
  uint64_t SharedVocabulary = LMVocabularyGetSharedVocabulary();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy_;
  v61[4] = __Block_byref_object_dispose_;
  id v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy_;
  v59[4] = __Block_byref_object_dispose_;
  id v60 = 0;
  char v25 = [v20 hasPrefix:@"zh"];
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZL12tokenizeTextPvS_P8NSStringS1__block_invoke;
  v73 = &unk_263FCF848;
  uint64_t v78 = SharedVocabulary;
  uint64_t v79 = v51;
  char v80 = v25;
  v74 = &v63;
  v75 = v61;
  v76 = v59;
  uint64_t v77 = v14;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerRelease();
  v26 = (const void *)v64[6];
  uint64_t v27 = v64[7];
  if (v26 == (const void *)v27)
  {
    uint64_t v27 = v64[6];
  }
  else if (*(_DWORD *)(v27 - 4) == 2)
  {
    v27 -= 4;
    v64[7] = v27;
  }
  v56 = 0;
  v57 = 0;
  uint64_t v58 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v56, v26, v27, (v27 - (uint64_t)v26) >> 2);
  _Block_object_dispose(v59, 8);

  id v19 = v52;
  _Block_object_dispose(v61, 8);

LABEL_30:
  _Block_object_dispose(&v63, 8);
  if (__p)
  {
    v70 = __p;
    operator delete(__p);
  }

  v31 = psg_default_log_handle();
  v32 = v31;
  if (v16 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A02A000, v32, OS_SIGNPOST_INTERVAL_END, v16, "PSGWordBoundaryFSTGrammar_tokenization", (const char *)&unk_20A040562, buf, 2u);
  }

  v34 = v56;
  v33 = v57;
  v35 = psg_default_log_handle();
  v36 = v35;
  if (v34 == (_DWORD *)v33)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20A02A000, v36, OS_LOG_TYPE_ERROR, "Tokenizer returns no token.", buf, 2u);
    }

    uint64_t v46 = 0;
    v28 = 0;
    if (!v34) {
      goto LABEL_67;
    }
  }
  else
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [v52 length];
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (v33 - (unsigned char *)v34) >> 2;
      *(_WORD *)&buf[22] = 2112;
      v73 = v20;
      _os_log_impl(&dword_20A02A000, v36, OS_LOG_TYPE_DEFAULT, "Context length: %tu, #tokens: %lu, locale: %@", buf, 0x20u);
    }

    v38 = psg_default_log_handle();
    os_signpost_id_t v39 = os_signpost_id_generate(v38);

    v40 = psg_default_log_handle();
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A02A000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "PSGWordBoundaryFSTGrammar_prediction", (const char *)&unk_20A040562, buf, 2u);
    }

    uint64_t v42 = (v33 - (unsigned char *)v34) >> 2;
    if (!LMLanguageModelCreatePredictionEnumerator()) {
      goto LABEL_59;
    }
    for (unsigned int i = 0; ; ++i)
    {
      int v44 = LMPredictionEnumeratorAdvance();
      if (i < 0x64) {
        int v45 = v44;
      }
      else {
        int v45 = 0;
      }
      if (v45 != 1)
      {
        uint64_t v46 = 0;
        goto LABEL_56;
      }
      *(_DWORD *)buf = 0;
      LMPredictionEnumeratorGetPrediction();
      if (*(_DWORD *)buf)
      {
        if (LMLanguageModelTokenHasAttributes()) {
          break;
        }
      }
    }
    uint64_t v46 = LMLanguageModelCopyTokenAttributes();
LABEL_56:
    v47 = psg_default_log_handle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = i;
      _os_log_debug_impl(&dword_20A02A000, v47, OS_LOG_TYPE_DEBUG, "Prediction enumerator advance #: %d", buf, 8u);
    }

    LMPredictionEnumeratorRelease();
    if (!v46)
    {
LABEL_59:
      if ((v34[v42 - 1] & 0x80000000) != 0)
      {
        uint64_t v46 = -[PSGWordBoundaryFSTGrammar _getPrimingToken:transientTokenID:](self, "_getPrimingToken:transientTokenID:", v14);
      }
      else
      {
        uint64_t v46 = 0;
      }
    }
    v48 = psg_default_log_handle();
    v49 = v48;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A02A000, v49, OS_SIGNPOST_INTERVAL_END, v39, "PSGWordBoundaryFSTGrammar_prediction", (const char *)&unk_20A040562, buf, 2u);
    }
  }
  operator delete(v34);
  v28 = (void *)v46;
LABEL_67:

LABEL_68:
  return v28;
}

- (id)_getPrimingToken:(void *)a3 transientTokenID:(unsigned int)a4
{
  v18[4] = *MEMORY[0x263EF8340];
  LMVocabularyGetSharedVocabulary();
  int ClassForTokenID = LMVocabularyGetClassForTokenID();
  switch(ClassForTokenID)
  {
    case 'D':
      id v5 = (id *)MEMORY[0x263F511E0];
      break;
    case 'Y':
      id v5 = (id *)MEMORY[0x263F511D8];
      break;
    case 'E':
      id v5 = (id *)MEMORY[0x263F51228];
      break;
    default:
      __int16 v13 = 0;
      id v6 = 0;
      goto LABEL_11;
  }
  id v6 = *v5;
  StringForTokenID = (const void *)LMLanguageModelCreateStringForTokenID();
  if (StringForTokenID)
  {
    uint64_t v8 = *MEMORY[0x263F511F0];
    uint64_t v9 = *MEMORY[0x263F51220];
    v17[0] = *MEMORY[0x263F51238];
    v17[1] = v9;
    uint64_t v10 = *MEMORY[0x263F51230];
    v18[0] = v8;
    v18[1] = v10;
    v17[2] = *MEMORY[0x263F511B8];
    __int16 v11 = [MEMORY[0x263EFF9D0] null];
    v18[2] = v11;
    v17[3] = *MEMORY[0x263F51200];
    id v15 = v6;
    os_signpost_id_t v16 = StringForTokenID;
    BOOL v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v18[3] = v12;
    __int16 v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

    CFRelease(StringForTokenID);
  }
  else
  {
    __int16 v13 = 0;
  }
LABEL_11:

  return v13;
}

- (void)_createLexicon:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = (__CFString *)a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFLocaleRef v5 = CFLocaleCreate(0, v3);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A8], v5);
  id v6 = (void *)LMLexiconCreate();
  if (!v6)
  {
    uint64_t v7 = psg_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_error_impl(&dword_20A02A000, v7, OS_LOG_TYPE_ERROR, "Cannot create lexicon for %@ locale.", (uint8_t *)&v9, 0xCu);
    }
  }
  CFRelease(v5);
  CFRelease(Mutable);

  return v6;
}

- (id)getOTAPathForProactiveBundle:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  CFLocaleRef v4 = CFLocaleCreate(0, v3);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = __Block_byref_object_copy_;
  __int16 v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  LDEnumerateAssetDataItems();
  if (!v10[5])
  {
    CFLocaleRef v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
    id v6 = [v5 objectForKey:*MEMORY[0x263EFF508]];

    CFLocaleCreate(0, v6);
    LDEnumerateAssetDataItems();

    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v4) {
LABEL_5:
  }
    CFRelease(v4);
LABEL_6:
  id v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

void __58__PSGWordBoundaryFSTGrammar_getOTAPathForProactiveBundle___block_invoke(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, unsigned char *a6)
{
  if (CFEqual(cf1, @"ProactiveStatementGrammarFST"))
  {
    CFStringRef v9 = CFURLCopyPath(a2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

void __58__PSGWordBoundaryFSTGrammar_getOTAPathForProactiveBundle___block_invoke_2(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, unsigned char *a6)
{
  if (CFEqual(cf1, @"ProactiveStatementGrammarFST"))
  {
    CFStringRef v9 = CFURLCopyPath(a2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

- (PSGWordBoundaryFSTGrammar)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSGWordBoundaryFSTGrammar;
  v2 = [(PSGWordBoundaryFSTGrammar *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lmWrapperCache = v2->_lmWrapperCache;
    v2->_lmWrapperCache = (NSCache *)v3;

    [(NSCache *)v2->_lmWrapperCache setCountLimit:3];
    uint64_t v5 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGWordBoundaryFSTGrammar.LMWrapper" qosClass:9];
    lmWrapperQueue = v2->_lmWrapperQueue;
    v2->_lmWrapperQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

void __43__PSGWordBoundaryFSTGrammar_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)+[PSGWordBoundaryFSTGrammar sharedInstance]::_pasExprOnceResult;
  +[PSGWordBoundaryFSTGrammar sharedInstance]::_pasExprOnceResult = v1;
}

@end