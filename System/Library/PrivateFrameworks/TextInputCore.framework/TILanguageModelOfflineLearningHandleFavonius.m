@interface TILanguageModelOfflineLearningHandleFavonius
- (RefPtr<KB::DictionaryContainer>)dictionaries;
- (TILanguageModelOfflineLearningHandleFavonius)initWithInputMode:(id)a3;
- (id).cxx_construct;
- (shared_ptr<KB::LanguageModel>)currentModel;
- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5;
- (void)didFinishLearning;
- (void)load;
- (void)setCurrentModel:(shared_ptr<KB::LanguageModel>)a3;
- (void)updateAdaptationContext:(id)a3;
@end

@implementation TILanguageModelOfflineLearningHandleFavonius

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_currentModel.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  m_ptr = (unsigned int *)self->_dictionaries.m_ptr;
  if (m_ptr)
  {
    WTF::RefCounted<KB::DictionaryContainer>::deref(m_ptr);
  }
}

- (RefPtr<KB::DictionaryContainer>)dictionaries
{
  m_ptr = self->_dictionaries.m_ptr;
  *v2 = m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  }
  return (RefPtr<KB::DictionaryContainer>)self;
}

- (void)setCurrentModel:(shared_ptr<KB::LanguageModel>)a3
{
  p_currentModel = &self->_currentModel;
  v5 = *(LanguageModel **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_currentModel.__cntrl_;
  p_currentModel->__ptr_ = v5;
  p_currentModel->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<KB::LanguageModel>)currentModel
{
  cntrl = self->_currentModel.__cntrl_;
  *v2 = self->_currentModel.__ptr_;
  v2[1] = (LanguageModel *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LanguageModel *)self;
  return result;
}

- (void)didFinishLearning
{
  if ([(TILanguageModelOfflineLearningHandle *)self isValid])
  {
    [(TILanguageModelOfflineLearningHandleFavonius *)self currentModel];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    }
    if (v3) {
      TIDispatchSync();
    }
  }
}

void __65__TILanguageModelOfflineLearningHandleFavonius_didFinishLearning__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) currentModel];
  (*(void (**)(void))(*(void *)v1 + 592))();
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
}

- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5
{
  id v6 = a3;
  id v5 = v6;
  TIDispatchSync();
}

void __90__TILanguageModelOfflineLearningHandleFavonius_adaptToParagraph_timeStamp_adaptationType___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v6 = 0;
    v7 = 0;
    goto LABEL_5;
  }
  [v2 currentModel];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3)
  {
LABEL_5:
    id v5 = 0;
    goto LABEL_6;
  }
  [v3 dictionaries];
LABEL_6:
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length", v5) <= 0x3FFE)
  {
    if ((*(unsigned int (**)(uint64_t, void))(*(void *)v6 + 384))(v6, *(void *)(a1 + 40)))
    {
      uint64_t v4 = v6;
      KB::utf8_string(*(KB **)(a1 + 40), (uint64_t)v8);
      (*(void (**)(uint64_t, unsigned char *, unsigned int **, void, void, double))(*(void *)v4 + 392))(v4, v8, &v5, 0, *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
      if (v9)
      {
        if (v8[6] == 1) {
          free(v9);
        }
      }
    }
  }
  if (v5) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v5);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
}

- (void)load
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[TIAssetManager sharedAssetManager];
  uint64_t v4 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
  id v5 = [v3 ddsAssetContentItemsWithContentType:@"Lexicon" inputMode:v4 filteredWithRegion:0];

  long long v54 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v84 count:16];
  v46 = self;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v51 + 1) + 8 * i) path];
        v12 = [v11 path];

        if ([v12 hasSuffix:@".dat"])
        {
          v13 = [MEMORY[0x1E4F28CB8] defaultManager];
          char v14 = [v13 fileExistsAtPath:v12];

          if (v14) {
            goto LABEL_11;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v51 objects:v84 count:16];
    }
    while (v8);
    v12 = 0;
LABEL_11:
    self = v46;
  }
  else
  {
    v12 = 0;
  }

  v15 = &knownAssetRegionAttributes_assetRegionAttributes;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  v16 = TIOSLogFacility();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v44 = [NSString stringWithFormat:@"%s DDS found static dict path: %@", "-[TILanguageModelOfflineLearningHandleFavonius load]", v12];
    *(_DWORD *)buf = 138412290;
    v68 = v44;
    _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  if (!v12)
  {
    v17 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
    v18 = [v17 languageWithRegion];
    v12 = UIKeyboardStaticUnigramsFile(v18);
  }
  v19 = +[TIAssetManager sharedAssetManager];
  v20 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
  v21 = [v19 ddsAssetContentItemsWithContentType:@"LexiconDelta" inputMode:v20 filteredWithRegion:0];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v83 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v47 + 1) + 8 * j) path];
        v28 = [v27 path];

        if ([v28 hasSuffix:@".dat"])
        {
          v29 = [MEMORY[0x1E4F28CB8] defaultManager];
          char v30 = [v29 fileExistsAtPath:v28];

          if (v30) {
            goto LABEL_29;
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v83 count:16];
    }
    while (v24);
    v28 = 0;
LABEL_29:
    self = v46;
    v15 = &knownAssetRegionAttributes_assetRegionAttributes;
  }
  else
  {
    v28 = 0;
  }

  if (v15[149] != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  v31 = TIOSLogFacility();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v45 = [NSString stringWithFormat:@"%s DDS found delta dict path: %@", "-[TILanguageModelOfflineLearningHandleFavonius load]", v28];
    *(_DWORD *)buf = 138412290;
    v68 = v45;
    _os_log_debug_impl(&dword_1E3F0E000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  if (!v28)
  {
    v32 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
    v33 = [v32 languageWithRegion];
    v34 = +[TIInputMode inputModeWithIdentifier:v33];
    v28 = UIKeyboardDeltaLexiconPathForInputMode(v34);
  }
  v35 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
  v36 = [v35 locale];
  v37 = [v36 localeIdentifier];

  id v38 = v37;
  int v39 = TILexiconIDForLocaleIdentifier((char *)[v38 UTF8String]);
  v40 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
  if ([v40 wantsMultilingualUnionOVS])
  {
    v41 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
    char v42 = [v41 wantsMultilingualUnionOVS];
  }
  else
  {
    char v42 = 0;
  }

  KB::utf8_string((KB *)v38, (uint64_t)buf);
  KB::utf8_string((KB *)v12, (uint64_t)v69);
  KB::utf8_string((KB *)v28, (uint64_t)v70);
  int v71 = 0x100000;
  __int16 v72 = 0;
  char v73 = 0;
  v74 = 0;
  char v75 = 0;
  int v76 = 0x100000;
  __int16 v77 = 0;
  char v78 = 0;
  v79 = 0;
  char v80 = 0;
  LODWORD(v81) = v39;
  BYTE4(v81) = v42;
  int v82 = 1065353216;
  KB::String::String((KB::String *)&v55, (const KB::String *)buf);
  KB::String::String((KB::String *)v57, (const KB::String *)v69);
  KB::String::String((KB::String *)v59, (const KB::String *)v70);
  KB::String::String((KB::String *)v61, (const KB::String *)&v71);
  KB::String::String((KB::String *)v63, (const KB::String *)&v76);
  uint64_t v65 = v81;
  int v66 = v82;
  v43 = operator new(0xB0uLL);
  std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v43, (uint64_t)&v55);
  if (v64 && v63[6] == 1) {
    free(v64);
  }
  if (v62 && v61[6] == 1) {
    free(v62);
  }
  if (v60 && v59[6] == 1) {
    free(v60);
  }
  if (v58 && v57[6] == 1) {
    free(v58);
  }
  if (v56)
  {
    if (BYTE6(v55) == 1) {
      free(v56);
    }
  }
  operator new();
}

- (void)updateAdaptationContext:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x4012000000;
  v21 = __Block_byref_object_copy__17653;
  id v22 = __Block_byref_object_dispose__17654;
  uint64_t v23 = "";
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __72__TILanguageModelOfflineLearningHandleFavonius_updateAdaptationContext___block_invoke;
  char v14 = &unk_1E6E2E2A8;
  v15 = self;
  v17 = &v18;
  id v5 = v4;
  id v16 = v5;
  TIDispatchSync();
  (*(void (**)(uint64_t))(*(void *)v19[6] + 96))(v19[6]);
  id v6 = (std::__shared_weak_count *)v19[7];
  uint64_t v9 = v19[6];
  uint64_t v10 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(TILanguageModelOfflineLearningHandleFavonius *)self setCurrentModel:&v9];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v10);
  }
  [(TILanguageModelOfflineLearningHandle *)self setCurrentAdaptationContext:v5];
  uint64_t v7 = [(TILanguageModelOfflineLearningHandle *)self lastAdaptationDate];

  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F14428];
    TIDispatchSync();
  }
  _Block_object_dispose(&v18, 8);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v25);
  }
}

void __72__TILanguageModelOfflineLearningHandleFavonius_updateAdaptationContext___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = +[TIKeyboardInputManager keyboardUserDirectory];
  v2 = +[TIAssetManager sharedAssetManager];
  uint64_t v3 = [*(id *)(a1 + 32) inputMode];
  id v4 = [v2 ddsAssetContentItemsWithContentType:@"LanguageModel" inputMode:v3 filteredWithRegion:0];

  id v5 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSString stringWithFormat:@"%s updateAdaptationContext TI: %@", "-[TILanguageModelOfflineLearningHandleFavonius updateAdaptationContext:]_block_invoke", v4];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 32) inputMode];
  uint64_t v8 = [v7 preferredModelLocaleIdentifier];
  uint64_t v9 = [*(id *)(a1 + 32) inputMode];
  uint64_t v10 = [v9 preferredModelLocaleIsMultilingual];
  uint64_t v11 = [*(id *)(a1 + 32) inputMode];
  char v12 = [v11 isSiriMode];
  v13 = [*(id *)(a1 + 32) inputMode];
  LOBYTE(v23) = [v13 doesSupportInlineCompletion];
  BYTE2(v22) = v12;
  LOWORD(v22) = 0;
  char v14 = +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v8, v10, 0, v24, v4, 1, v22, 0, v23);

  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) inputMode];
  v17 = [v16 locale];
  uint64_t v25 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  if (v14)
  {
    [v14 languageModelForAdaptationContext:v15 languageLocales:v18];
    long long v19 = *(_OWORD *)buf;
  }
  else
  {
    long long v19 = 0uLL;
    *(_OWORD *)buf = 0u;
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  memset(buf, 0, sizeof(buf));
  v21 = *(std::__shared_weak_count **)(v20 + 56);
  *(_OWORD *)(v20 + 48) = v19;
  if (v21)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v21);
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
}

void __72__TILanguageModelOfflineLearningHandleFavonius_updateAdaptationContext___block_invoke_57(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  if ((*(unsigned int (**)(uint64_t))(*(void *)v2 + 16))(v2))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    (*(void (**)(uint64_t))(*(void *)v3 + 376))(v3);
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:Current];
  [*(id *)(a1 + 32) setLastAdaptationDate:v5];
}

- (TILanguageModelOfflineLearningHandleFavonius)initWithInputMode:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TILanguageModelOfflineLearningHandleFavonius;
  if ([(TILanguageModelOfflineLearningHandle *)&v12 initWithInputMode:v4])
  {
    id v5 = [v4 locale];
    id v6 = [v5 localeIdentifier];

    id v7 = v6;
    int v8 = TILexiconIDForLocaleIdentifier((char *)[v7 UTF8String]);
    if ([v4 wantsMultilingualUnionOVS]) {
      char v9 = [v4 wantsMultilingualUnionOVS];
    }
    else {
      char v9 = 0;
    }
    KB::utf8_string((KB *)v7, (uint64_t)v25);
    int v26 = 0x100000;
    __int16 v27 = 0;
    char v28 = 0;
    v29 = 0;
    char v30 = 0;
    int v31 = 0x100000;
    __int16 v32 = 0;
    char v33 = 0;
    v34 = 0;
    char v35 = 0;
    int v36 = 0x100000;
    __int16 v37 = 0;
    char v38 = 0;
    int v39 = 0;
    char v40 = 0;
    int v41 = 0x100000;
    __int16 v42 = 0;
    char v43 = 0;
    v44 = 0;
    char v45 = 0;
    LODWORD(v46) = v8;
    BYTE4(v46) = v9;
    int v47 = 1065353216;
    KB::String::String((KB::String *)&v13, (const KB::String *)v25);
    KB::String::String((KB::String *)v15, (const KB::String *)&v26);
    KB::String::String((KB::String *)v17, (const KB::String *)&v31);
    KB::String::String((KB::String *)v19, (const KB::String *)&v36);
    KB::String::String((KB::String *)v21, (const KB::String *)&v41);
    uint64_t v23 = v46;
    int v24 = v47;
    uint64_t v10 = operator new(0xB0uLL);
    std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v10, (uint64_t)&v13);
    if (v22 && v21[6] == 1) {
      free(v22);
    }
    if (v20 && v19[6] == 1) {
      free(v20);
    }
    if (v18 && v17[6] == 1) {
      free(v18);
    }
    if (v16 && v15[6] == 1) {
      free(v16);
    }
    if (v14)
    {
      if (BYTE6(v13) == 1) {
        free(v14);
      }
    }
    operator new();
  }

  return 0;
}

@end