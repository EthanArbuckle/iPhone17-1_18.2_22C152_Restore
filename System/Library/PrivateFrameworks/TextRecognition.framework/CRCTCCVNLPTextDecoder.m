@interface CRCTCCVNLPTextDecoder
+ (id)_cvnlpDecodingResultByRerankingCandidates:(id)a3 decodingLocale:(id)a4;
+ (id)lmSupportedLanguages;
+ (unint64_t)_disambiguatedScriptForString:(id)a3;
+ (unordered_map<CRDisambiguatedScript,)_disambiguatedScriptFeatureIndicesWithInfo:()std:()std:(std:(std:(id)a2 :(SEL)a3 vector<unsigned long>>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)CRDisambiguatedScript :equal_to<CRDisambiguatedScript> :hash<CRDisambiguatedScript>;
+ (void)_adjustBeamSearchResults:(id *)a3 tokens:(id)a4 greedyCandidateString:(id)a5 greedyCandidateTokens:(id)a6 decodingLocale:(id)a7;
- (AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>)_createBeamScorerWithBundle:(SEL)a3 beamSearchConfig:(id)a4 lmConfig:(id)a5;
- (BOOL)_decodeFeaturesWithInfo:(id)a3 imageSize:(CGSize)a4 error:(id *)a5;
- (BOOL)_decodeSingleFeatureWithInfo:(id)a3 decodingLocale:(id)a4 greedyDecoder:(id)a5 greedyConfig:(id)a6 beamSearchConfig:(id)a7 imageSize:(CGSize)a8 useCharacterBoxes:(BOOL)a9 lmConfig:(id)a10 error:(id *)a11;
- (BOOL)_shouldUseCharacterDecodingToken;
- (BOOL)_wordLMShouldFilterCandidate:(id)a3 inLocale:(id)a4 lmConfig:(id)a5;
- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 error:(id *)a5;
- (BOOL)isLocaleRTL;
- (BOOL)shouldDecodeWithLM;
- (BOOL)shouldReverseActivationMatrix;
- (BOOL)shouldUseFalsePositiveFiltering;
- (BOOL)shouldUseLM;
- (BOOL)shouldUseModernizedDecoder;
- (CRBiDiTransform)bidiTransform;
- (CRCTCCVNLPTextDecoder)initWithConfiguration:(id)a3 model:(id)a4 error:(id *)a5;
- (CRNeuralRecognizerConfiguration)configuration;
- (CRTextSequenceRecognizerModel)model;
- (CVNLPTextDecodingPruningPolicy)pruningPolicy;
- (NSLocale)locale;
- (NSMutableSet)subscribedLocales;
- (NSOrderedSet)characterObservations;
- (id).cxx_construct;
- (id)_commitActionBehavior;
- (id)_cvnlpDecodingResultForActivationMatrix:(id)a3 decodingLocale:(id)a4 beamSearchConfig:(id)a5 lmConfig:(id)a6 error:(id *)a7;
- (id)_cvnlpGreedyModernizedDecodingResultForActivationMatrix:(const void *)a3;
- (id)_cvnlpModernizedDecodingResultForActivationMatrix:(const void *)a3 decodingLocale:(id)a4 beamSearchConfig:(id)a5 lmConfig:(id)a6 error:(id *)a7;
- (id)newLanguageRecognizerSession;
- (void)_buildActivationMatrices:(id)a3;
- (void)_create2DArraysFromInputArray:(id)a3 classSize:(unint64_t *)a4 outputArrays:(void *)a5;
- (void)computeLanguageRecognitionForSession:(id)a3 output:(id)a4 imageSize:(CGSize)a5;
- (void)dealloc;
- (void)releaseUnusedResources;
- (void)setConfiguration:(id)a3;
- (void)setModel:(id)a3;
- (void)setShouldUseFalsePositiveFiltering:(BOOL)a3;
- (void)setShouldUseLM:(BOOL)a3;
@end

@implementation CRCTCCVNLPTextDecoder

- (CRCTCCVNLPTextDecoder)initWithConfiguration:(id)a3 model:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v54 = a4;
  v65.receiver = self;
  v65.super_class = (Class)CRCTCCVNLPTextDecoder;
  v10 = [(CRCTCCVNLPTextDecoder *)&v65 init];
  if (!v10)
  {
LABEL_50:
    v51 = v10;
    goto LABEL_54;
  }
  v55 = [v9 locale];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  locale = v10->_locale;
  v10->_locale = (NSLocale *)v11;

  int v13 = [v9 decodeWithLM];
  if (v55) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  if (v14 == 1)
  {
    v15 = [(id)objc_opt_class() lmSupportedLanguages];
    v10->_shouldUseLM = [v15 containsObject:v55];
    p_shouldUseLM = &v10->_shouldUseLM;
  }
  else
  {
    v10->_shouldUseLM = 0;
    p_shouldUseLM = &v10->_shouldUseLM;
  }
  v10->_shouldUseFalsePositiveFiltering = [v9 falsePositiveFilteringDisabled] ^ 1;
  objc_storeStrong((id *)&v10->_configuration, a3);
  *(_WORD *)&v10->_shouldReverseActivationMatrix = 0;
  if (v55 && +[CRImageReader languageIsArabic:v55])
  {
    *(_WORD *)&v10->_shouldReverseActivationMatrix = 257;
    v17 = objc_alloc_init(CRBiDiTransform);
    bidiTransform = v10->_bidiTransform;
    v10->_bidiTransform = v17;
  }
  objc_storeStrong((id *)&v10->_model, a4);
  uint64_t v19 = [(CRTextSequenceRecognizerModel *)v10->_model codemapArray];
  v10->_codemapArray = (int *)v19;
  if (v19)
  {
    uint64_t v20 = [(CRTextSequenceRecognizerModel *)v10->_model codemapSize];
    v10->_codemapSize = v20;
    v53 = unicodeArrayToNSStringArray(v10->_codemapArray, v20);
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:");
    characterObservations = v10->_characterObservations;
    v10->_characterObservations = (NSOrderedSet *)v21;

    if ([(CRCTCCVNLPTextDecoder *)v10 shouldUseModernizedDecoder])
    {
      p_begin = (void **)&v10->_spaceLabels.__begin_;
      v10->_spaceLabels.__end_ = v10->_spaceLabels.__begin_;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v23 = [&unk_1F3935D58 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v62 != v24) {
              objc_enumerationMutation(&unk_1F3935D58);
            }
            uint64_t v26 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            v27 = [(CRCTCCVNLPTextDecoder *)v10 characterObservations];
            uint64_t v28 = [v27 indexOfObject:v26];

            if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            {
              end = (uint64_t *)v10->_spaceLabels.__end_;
              unint64_t value = (unint64_t)v10->_spaceLabels.__end_cap_.__value_;
              if ((unint64_t)end >= value)
              {
                begin = (uint64_t *)*p_begin;
                uint64_t v33 = ((char *)end - (unsigned char *)*p_begin) >> 3;
                unint64_t v34 = v33 + 1;
                if ((unint64_t)(v33 + 1) >> 61) {
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v35 = value - (void)begin;
                if (v35 >> 2 > v34) {
                  unint64_t v34 = v35 >> 2;
                }
                if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v36 = v34;
                }
                if (v36)
                {
                  v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v10->_spaceLabels.__end_cap_, v36);
                  begin = (uint64_t *)v10->_spaceLabels.__begin_;
                  end = (uint64_t *)v10->_spaceLabels.__end_;
                }
                else
                {
                  v37 = 0;
                }
                v38 = (uint64_t *)&v37[8 * v33];
                uint64_t *v38 = v28;
                v31 = (unint64_t *)(v38 + 1);
                while (end != begin)
                {
                  uint64_t v39 = *--end;
                  *--v38 = v39;
                }
                v10->_spaceLabels.__begin_ = (unint64_t *)v38;
                v10->_spaceLabels.__end_ = v31;
                v10->_spaceLabels.__end_cap_.__value_ = (unint64_t *)&v37[8 * v36];
                if (begin) {
                  operator delete(begin);
                }
              }
              else
              {
                uint64_t *end = v28;
                v31 = (unint64_t *)(end + 1);
              }
              v10->_spaceLabels.__end_ = v31;
            }
          }
          uint64_t v23 = [&unk_1F3935D58 countByEnumeratingWithState:&v61 objects:v67 count:16];
        }
        while (v23);
      }
    }
    v40 = (void *)MEMORY[0x1E4F1CA80];
    v41 = [(NSLocale *)v10->_locale localeIdentifier];
    uint64_t v42 = [v40 setWithObject:v41];
    subscribedLocales = v10->_subscribedLocales;
    v10->_subscribedLocales = (NSMutableSet *)v42;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v44 = v10->_subscribedLocales;
    uint64_t v45 = [(NSMutableSet *)v44 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v58 != v46) {
            objc_enumerationMutation(v44);
          }
          uint64_t v48 = *(void *)(*((void *)&v57 + 1) + 8 * j);
          if (*p_shouldUseLM)
          {
            v49 = +[CRLanguageResourcesManager sharedManager];
            [v49 addSubscriber:v10 forLocale:v48];
          }
          if ([v9 filterWithLM])
          {
            v50 = +[CRLanguageResourcesManager postProcessManager];
            [v50 addSubscriber:v10 forLocale:v48];
          }
        }
        uint64_t v45 = [(NSMutableSet *)v44 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v45);
    }

    goto LABEL_50;
  }
  if (a5)
  {
    *a5 = +[CRImageReader errorWithErrorCode:-8];
  }

  v51 = 0;
LABEL_54:

  return v51;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_subscribedLocales;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (self->_shouldUseLM)
        {
          v8 = +[CRLanguageResourcesManager sharedManager];
          [v8 removeSubscriber:self forLocale:v7];
        }
        if ([(CRNeuralRecognizerConfiguration *)self->_configuration filterWithLM])
        {
          id v9 = +[CRLanguageResourcesManager postProcessManager];
          [v9 removeSubscriber:self forLocale:v7];
        }
      }
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  v10.receiver = self;
  v10.super_class = (Class)CRCTCCVNLPTextDecoder;
  [(CRCTCCVNLPTextDecoder *)&v10 dealloc];
}

- (CVNLPTextDecodingPruningPolicy)pruningPolicy
{
  *(_OWORD *)&retstr->var0 = xmmword_1DD8CF2E0;
  *(void *)&retstr->var3 = 20;
  return self;
}

+ (id)lmSupportedLanguages
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldDecodeWithLM
{
  return self->_shouldUseLM;
}

- (BOOL)shouldUseModernizedDecoder
{
  v2 = [(CRCTCCVNLPTextDecoder *)self model];
  v3 = [v2 outputFormatVersion];
  BOOL v4 = [v3 intValue] == 2;

  return v4;
}

- (id)newLanguageRecognizerSession
{
  v2 = [(CRCTCCVNLPTextDecoder *)self configuration];
  unint64_t v3 = [v2 revision];

  if (v3 < 3) {
    return 0;
  }
  return (id)objc_opt_new();
}

- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 error:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  objc_super v10 = [v9 textFeatureInfo];
  [(CRCTCCVNLPTextDecoder *)self _buildActivationMatrices:v9];
  LOBYTE(a5) = -[CRCTCCVNLPTextDecoder _decodeFeaturesWithInfo:imageSize:error:](self, "_decodeFeaturesWithInfo:imageSize:error:", v10, a5, width, height);

  return (char)a5;
}

- (void)computeLanguageRecognitionForSession:(id)a3 output:(id)a4 imageSize:(CGSize)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v66 = a4;
  v71 = [v66 textFeatureInfo];
  [(CRCTCCVNLPTextDecoder *)self _buildActivationMatrices:v66];
  uint64_t v7 = [(CRCTCCVNLPTextDecoder *)self configuration];
  unint64_t v8 = [v7 revision];

  if (v8 < 3) {
    goto LABEL_78;
  }
  if (![(CRCTCCVNLPTextDecoder *)self shouldUseModernizedDecoder])
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F56750]) initWithLanguageResourceBundle:0];
    id obja = [(CRCTCCVNLPTextDecoder *)self _commitActionBehavior];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F56780]) initWithCommitActionBehavior:obja];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v21 = v71;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v72 objects:v102 count:16];
    if (!v23) {
      goto LABEL_41;
    }
    uint64_t v24 = *(void *)v73;
    while (1)
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v73 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v72 + 1) + 8 * v25);
        if (v26)
        {
          id Property = objc_getProperty(v26, v22, 80, 1);
          v29 = Property;
          if (Property)
          {
            id Property = objc_getProperty(Property, v28, 360, 1);
            char v30 = 0;
            goto LABEL_34;
          }
        }
        else
        {
          v29 = 0;
          id Property = 0;
        }
        char v30 = 1;
LABEL_34:
        id v31 = Property;
        [v19 setActivationMatrix:v31];

        uint64_t v33 = [v19 greedyDecodingResultWithConfiguration:v20];
        if ((v30 & 1) == 0) {
          objc_setProperty_atomic(v29, v32, v33, 352);
        }

        ++v25;
      }
      while (v23 != v25);
      uint64_t v34 = [v21 countByEnumeratingWithState:&v72 objects:v102 count:16];
      uint64_t v23 = v34;
      if (!v34)
      {
LABEL_41:

        goto LABEL_42;
      }
    }
  }
  id v9 = [(CRCTCCVNLPTextDecoder *)self model];
  uint64_t v10 = [v9 ctcBlankLabelIndex];

  BYTE8(v82) = 0;
  *(void *)&long long v82 = &unk_1F38ED2E0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v84 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(__p, self->_spaceLabels.__begin_, (uint64_t)self->_spaceLabels.__end_, self->_spaceLabels.__end_ - self->_spaceLabels.__begin_);
  LOBYTE(v85) = 0;
  v94[0] = &unk_1F38ED080;
  v94[1] = v10;
  char v96 = 0;
  v95 = &unk_1F38ED2E0;
  v97 = 0;
  v98 = 0;
  uint64_t v99 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v97, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
  char v100 = (char)v85;
  *(void *)&long long v82 = &unk_1F38ED2E0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  CFTypeRef cf = 0;
  uint64_t v92 = 0;
  uint64_t v93 = 0;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v71;
  uint64_t v12 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v88 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(*((void *)&v87 + 1) + 8 * i);
        if (v15) {
          id v15 = objc_getProperty(v15, v11, 80, 1);
        }
        id v16 = v15;
        if ([(CRCTCCVNLPTextDecoder *)self shouldReverseActivationMatrix])
        {
          CoreRecognition::decoder::ActivationMatrix::reverseInTime((unint64_t *)&v82);
        }
        CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode(v94, (uint64_t *)&v82, v81);
        uint64_t v76 = MEMORY[0x1E4F143A8];
        uint64_t v77 = 3221225472;
        v78 = __79__CRCTCCVNLPTextDecoder_computeLanguageRecognitionForSession_output_imageSize___block_invoke;
        v79 = &unk_1E6CDC628;
        v80 = self;
        v18 = convertToCVNLPTextDecodingResult();
        if (v16) {
          objc_setProperty_atomic(v16, v17, v18, 352);
        }

        v101 = (void **)v81;
        std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v101);
        if (v85)
        {
          v86 = v85;
          operator delete(v85);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
    }
    while (v12);
  }

  if (cf) {
    CFRelease(cf);
  }
  v94[0] = &unk_1F38ED080;
  v95 = &unk_1F38ED2E0;
  if (v97)
  {
    v98 = v97;
    operator delete(v97);
  }
LABEL_42:
  uint64_t v35 = objc_opt_class();
  if (v35)
  {
    [v35 _disambiguatedScriptFeatureIndicesWithInfo:v71];
    unint64_t v36 = __p[0];
    id v37 = v67;
    if (v36)
    {
      id objb = v37;
      while (v36[4] == v36[3])
      {
LABEL_74:
        unint64_t v36 = (void *)*v36;
        if (!v36) {
          goto LABEL_77;
        }
      }
      uint64_t v38 = v36[2];
      uint64_t v39 = [(CRCTCCVNLPTextDecoder *)self locale];
      v40 = [v39 localeIdentifier];

      if (v38 == 3)
      {
        id v54 = @"uk-UA";
      }
      else
      {
        if (v38 != 2)
        {
          if (v38 == 1)
          {
            v41 = [(CRCTCCVNLPTextDecoder *)self locale];
            uint64_t v42 = [v41 localeIdentifier];
            BOOL v43 = +[CRImageReader languageIsCyrillic:v42];

            if (v43)
            {
              uint64_t v45 = @"en-US";

              v40 = v45;
            }
            id v46 = objb;
            if (objb) {
              id v46 = objc_getProperty(objb, v44, 8, 1);
            }
            id v47 = v46;
            BOOL v48 = v47 == 0;

            if (v48)
            {
              v51 = -[CRLanguageRecognitionContext initWithScript:defaultLocale:]((id *)[CRLanguageRecognitionContext alloc], (void *)1, v40);
              if (objb) {
                objc_setProperty_atomic(objb, v50, v51, 8);
              }
            }
            id v52 = objb;
            if (objb) {
              id v52 = objc_getProperty(objb, v49, 8, 1);
            }
            id v53 = v52;
          }
          else
          {
            id v53 = 0;
          }
          goto LABEL_64;
        }
        id v54 = @"ru-RU";
      }
      id v53 = 0;
      v40 = v54;
LABEL_64:
      v55 = (uint64_t *)v36[3];
      v56 = (uint64_t *)v36[4];
      while (v55 != v56)
      {
        uint64_t v57 = *v55;
        long long v58 = [v71 objectAtIndexedSubscript:*v55];
        long long v60 = v58;
        if (v58)
        {
          id v61 = objc_getProperty(v58, v59, 80, 1);
          long long v63 = v61;
          if (v61) {
            objc_setProperty_atomic(v61, v62, v40, 368);
          }
        }
        else
        {
          long long v63 = 0;
        }

        if (v53)
        {
          long long v64 = [v71 objectAtIndexedSubscript:v57];
          -[CRLanguageRecognitionSession processFeature:context:](objb, v64, v53);
        }
        ++v55;
      }

      goto LABEL_74;
    }
  }
  else
  {
    uint64_t v84 = 0;
    long long v82 = 0u;
    *(_OWORD *)__p = 0u;
    id v65 = v67;
  }
LABEL_77:

  std::__hash_table<std::__hash_value_type<int,std::vector<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<int>>>>::~__hash_table((uint64_t)&v82);
LABEL_78:
}

id __79__CRCTCCVNLPTextDecoder_computeLanguageRecognitionForSession_output_imageSize___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [*(id *)(a1 + 32) characterObservations];
  BOOL v4 = [v3 objectAtIndexedSubscript:a2];

  return v4;
}

- (void)_buildActivationMatrices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 textFeatureInfo];
  v85 = v5;
  v6 = [v5 firstObject];
  unint64_t v8 = v6;
  if (v6) {
    id Property = objc_getProperty(v6, v7, 80, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;

  if (!v10)
  {
    __p = 0;
    v122 = 0;
    uint64_t v124 = 0;
    id v81 = v4;
    [(CRCTCCVNLPTextDecoder *)self _create2DArraysFromInputArray:v4 classSize:&self->_codemapSize outputArrays:&v122];
    long long v11 = [(CRCTCCVNLPTextDecoder *)self model];
    uint64_t v83 = [v11 ctcBlankLabelIndex];

    long long v120 = 0uLL;
    uint64_t v121 = 0;
    [(CRCTCCVNLPTextDecoder *)self pruningPolicy];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v12 = [(CRCTCCVNLPTextDecoder *)self shouldUseModernizedDecoder];
    uint64_t v13 = (char *)__p;
    if (__p != v122)
    {
      unint64_t v14 = 0;
      unint64_t v15 = 0xCF3CF3CF3CF3CF3DLL * (((unsigned char *)__p - v122) >> 3);
      uint64_t v13 = v122;
      BOOL v82 = v12;
      do
      {
        id v16 = &v13[168 * v14];
        if (isKindOfClass)
        {
          unint64_t v17 = v14 + 1;
          if (v15 <= v14 + 1) {
            std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
          }
          id v18 = objc_alloc(MEMORY[0x1E4F56748]);
          uint64_t v19 = &v13[168 * v17];
          long long v20 = *(_OWORD *)v16;
          long long v21 = *((_OWORD *)v16 + 2);
          v118[1] = *((_OWORD *)v16 + 1);
          v118[2] = v21;
          v118[0] = v20;
          long long v22 = *((_OWORD *)v16 + 3);
          long long v23 = *((_OWORD *)v16 + 4);
          long long v24 = *((_OWORD *)v16 + 5);
          v118[6] = *((_OWORD *)v16 + 6);
          v118[5] = v24;
          v118[4] = v23;
          v118[3] = v22;
          long long v25 = *((_OWORD *)v16 + 7);
          long long v26 = *((_OWORD *)v16 + 8);
          long long v27 = *((_OWORD *)v16 + 9);
          uint64_t v119 = *((void *)v16 + 20);
          v118[9] = v27;
          v118[8] = v26;
          v118[7] = v25;
          long long v28 = *(_OWORD *)v19;
          long long v29 = *((_OWORD *)v19 + 2);
          v116[1] = *((_OWORD *)v19 + 1);
          v116[2] = v29;
          v116[0] = v28;
          long long v30 = *((_OWORD *)v19 + 3);
          long long v31 = *((_OWORD *)v19 + 4);
          long long v32 = *((_OWORD *)v19 + 6);
          v116[5] = *((_OWORD *)v19 + 5);
          v116[6] = v32;
          v116[3] = v30;
          v116[4] = v31;
          long long v33 = *((_OWORD *)v19 + 7);
          long long v34 = *((_OWORD *)v19 + 8);
          long long v35 = *((_OWORD *)v19 + 9);
          uint64_t v117 = *((void *)v19 + 20);
          v116[8] = v34;
          v116[9] = v35;
          v116[7] = v33;
          unint64_t v36 = [(CRCTCCVNLPTextDecoder *)self characterObservations];
          long long v114 = v120;
          uint64_t v115 = v121;
          id v37 = (void *)[v18 initWithBuffer:v118 indexBuffer:v116 domainType:v82 characterObservations:v36 blankIndex:v83 pruningPolicy:&v114];

          uint64_t v38 = [CRCVNLPTransientResult alloc];
          uint64_t v39 = [(CRCTCCVNLPTextDecoder *)self configuration];
          v40 = [v39 locale];
          long long v41 = *((_OWORD *)v16 + 9);
          long long v111 = *((_OWORD *)v16 + 8);
          long long v112 = v41;
          uint64_t v113 = *((void *)v16 + 20);
          long long v42 = *((_OWORD *)v16 + 5);
          long long v107 = *((_OWORD *)v16 + 4);
          long long v108 = v42;
          long long v43 = *((_OWORD *)v16 + 7);
          long long v109 = *((_OWORD *)v16 + 6);
          long long v110 = v43;
          long long v44 = *((_OWORD *)v16 + 1);
          long long v103 = *(_OWORD *)v16;
          long long v104 = v44;
          long long v45 = *((_OWORD *)v16 + 3);
          long long v105 = *((_OWORD *)v16 + 2);
          long long v106 = v45;
          long long v46 = *((_OWORD *)v19 + 9);
          long long v100 = *((_OWORD *)v19 + 8);
          long long v101 = v46;
          uint64_t v102 = *((void *)v19 + 20);
          long long v47 = *((_OWORD *)v19 + 5);
          long long v96 = *((_OWORD *)v19 + 4);
          long long v97 = v47;
          long long v48 = *((_OWORD *)v19 + 7);
          long long v98 = *((_OWORD *)v19 + 6);
          long long v99 = v48;
          long long v49 = *((_OWORD *)v19 + 1);
          long long v92 = *(_OWORD *)v19;
          long long v93 = v49;
          long long v50 = *((_OWORD *)v19 + 3);
          long long v94 = *((_OWORD *)v19 + 2);
          long long v95 = v50;
          id v51 = v37;
          id v52 = v40;
          if (v38)
          {
            v125[8] = v111;
            v125[9] = v112;
            uint64_t v126 = v113;
            v125[4] = v107;
            v125[5] = v108;
            v125[6] = v109;
            v125[7] = v110;
            v125[0] = v103;
            v125[1] = v104;
            v125[2] = v105;
            v125[3] = v106;
            uint64_t v5 = v85;
            id v53 = -[CRCVNLPTransientResult initWithActivationMatrix:decodingLocale:activationsBuffer:]((char *)v38, v51, v52, v125);
            uint64_t v38 = (CRCVNLPTransientResult *)v53;
            if (v53)
            {
              int v54 = v53[344];
              long long v55 = v101;
              *((_OWORD *)v53 + 19) = v100;
              *((_OWORD *)v53 + 20) = v55;
              *((void *)v53 + 42) = v102;
              long long v56 = v97;
              *((_OWORD *)v53 + 15) = v96;
              *((_OWORD *)v53 + 16) = v56;
              long long v57 = v99;
              *((_OWORD *)v53 + 17) = v98;
              *((_OWORD *)v53 + 18) = v57;
              long long v58 = v93;
              *((_OWORD *)v53 + 11) = v92;
              *((_OWORD *)v53 + 12) = v58;
              long long v59 = v95;
              *((_OWORD *)v53 + 13) = v94;
              *((_OWORD *)v53 + 14) = v59;
              if (!v54) {
                v53[344] = 1;
              }
            }
          }
          else
          {
            uint64_t v5 = v85;
          }

          long long v60 = [v5 objectAtIndexedSubscript:v14 >> 1];
          long long v62 = v60;
          if (v60) {
            objc_setProperty_atomic(v60, v61, v38, 80);
          }
        }
        else
        {
          id v63 = objc_alloc(MEMORY[0x1E4F56748]);
          long long v64 = *(_OWORD *)v16;
          long long v65 = *((_OWORD *)v16 + 2);
          v90[1] = *((_OWORD *)v16 + 1);
          v90[2] = v65;
          v90[0] = v64;
          long long v66 = *((_OWORD *)v16 + 3);
          long long v67 = *((_OWORD *)v16 + 4);
          long long v68 = *((_OWORD *)v16 + 6);
          v90[5] = *((_OWORD *)v16 + 5);
          v90[6] = v68;
          v90[3] = v66;
          v90[4] = v67;
          long long v69 = *((_OWORD *)v16 + 7);
          long long v70 = *((_OWORD *)v16 + 8);
          long long v71 = *((_OWORD *)v16 + 9);
          uint64_t v91 = *((void *)v16 + 20);
          v90[8] = v70;
          v90[9] = v71;
          v90[7] = v69;
          long long v72 = [(CRCTCCVNLPTextDecoder *)self characterObservations];
          long long v88 = v120;
          uint64_t v89 = v121;
          id v51 = (id)[v63 initWithBuffer:v90 domainType:v82 characterObservations:v72 blankIndex:v83 pruningPolicy:&v88];

          long long v73 = [CRCVNLPTransientResult alloc];
          uint64_t v39 = [(CRCTCCVNLPTextDecoder *)self configuration];
          id v52 = [v39 locale];
          long long v74 = *((_OWORD *)v16 + 9);
          v86[8] = *((_OWORD *)v16 + 8);
          v86[9] = v74;
          uint64_t v87 = *((void *)v16 + 20);
          long long v75 = *((_OWORD *)v16 + 5);
          v86[4] = *((_OWORD *)v16 + 4);
          v86[5] = v75;
          long long v76 = *((_OWORD *)v16 + 7);
          v86[6] = *((_OWORD *)v16 + 6);
          v86[7] = v76;
          long long v77 = *((_OWORD *)v16 + 1);
          v86[0] = *(_OWORD *)v16;
          v86[1] = v77;
          long long v78 = *((_OWORD *)v16 + 3);
          v86[2] = *((_OWORD *)v16 + 2);
          v86[3] = v78;
          uint64_t v38 = (CRCVNLPTransientResult *)-[CRCVNLPTransientResult initWithActivationMatrix:decodingLocale:activationsBuffer:]((char *)v73, v51, v52, v86);
          uint64_t v5 = v85;
          v79 = [v85 objectAtIndexedSubscript:v14];
          long long v62 = v79;
          if (v79) {
            objc_setProperty_atomic(v79, v80, v38, 80);
          }
          unint64_t v17 = v14;
        }

        unint64_t v14 = v17 + 1;
        uint64_t v13 = v122;
        unint64_t v15 = 0xCF3CF3CF3CF3CF3DLL * (((unsigned char *)__p - v122) >> 3);
      }
      while (v17 + 1 < v15);
    }
    if (v13)
    {
      __p = v13;
      operator delete(v13);
    }
    id v4 = v81;
  }
}

- (void)_create2DArraysFromInputArray:(id)a3 classSize:(unint64_t *)a4 outputArrays:(void *)a5
{
  id v70 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v70;
  id v9 = v8;
  char v86 = isKindOfClass;
  long long v71 = v8;
  if (isKindOfClass)
  {
    if (v8)
    {
      objc_msgSend(v8, "output_label_prob_map", v70);
      uint64_t v83 = (float *)v114;
      unint64_t v104 = v117;
      uint64_t v105 = v118;
      uint64_t v106 = v116;
      uint64_t v10 = v119;
      unint64_t v85 = v120;
      uint64_t v101 = v122;
      uint64_t v102 = v121;
      uint64_t v99 = v124;
      uint64_t v100 = v123;
      uint64_t v97 = *((void *)&v114 + 1);
      uint64_t v98 = v125;
      int v96 = v126;
      objc_msgSend(v9, "output_topk_indices");
      uint64_t v72 = v114;
    }
    else
    {
      uint64_t v72 = 0;
      uint64_t v83 = 0;
      uint64_t v97 = 0;
      uint64_t v98 = 0;
      uint64_t v105 = 0;
      uint64_t v106 = 0;
      unint64_t v104 = 0;
      uint64_t v10 = 0;
      unint64_t v85 = 0;
      uint64_t v101 = 0;
      uint64_t v102 = 0;
      uint64_t v99 = 0;
      uint64_t v100 = 0;
      int v96 = 0;
    }
  }
  else if (v8)
  {
    objc_msgSend(v8, "output_label_prob_map", v70);
    uint64_t v83 = (float *)v114;
    unint64_t v104 = v117;
    uint64_t v105 = v118;
    uint64_t v106 = v116;
    uint64_t v10 = v119;
    unint64_t v85 = v120;
    uint64_t v101 = v122;
    uint64_t v102 = v121;
    uint64_t v99 = v124;
    uint64_t v100 = v123;
    uint64_t v97 = *((void *)&v114 + 1);
    uint64_t v98 = v125;
    int v96 = v126;
  }
  else
  {
    int v96 = 0;
    uint64_t v98 = 0;
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    unint64_t v85 = 0;
    uint64_t v10 = 0;
    unint64_t v104 = 0;
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    uint64_t v97 = 0;
    uint64_t v83 = 0;
  }

  long long v107 = [v71 textFeatureInfo];
  if (isKindOfClass) {
    unint64_t v11 = 2 * [v107 count];
  }
  else {
    unint64_t v11 = [v107 count];
  }
  std::vector<espresso_buffer_t>::resize((uint64_t)a5, v11);
  if ([(CRCTCCVNLPTextDecoder *)self shouldUseModernizedDecoder])
  {
    unint64_t v12 = v104 * v106 * v105 * v10;
    if (v12)
    {
      uint64_t v13 = 4 * v12;
      unint64_t v14 = v83;
      do
      {
        float v15 = *v14;
        float v16 = logf(*v14);
        if (v15 <= 0.0) {
          float v16 = -INFINITY;
        }
        *v14++ = v16;
        v13 -= 4;
      }
      while (v13);
    }
  }
  unint64_t v17 = 0;
  char v84 = v86 & 1;
  while (v17 < objc_msgSend(v107, "count", v70))
  {
    id v18 = [v107 objectAtIndexedSubscript:v17];
    double v19 = -[CRFeatureSequenceRecognitionInfo featureImageSize]((uint64_t)v18);
    if (v18) {
      float v20 = v18[2];
    }
    else {
      float v20 = 0.0;
    }
    long long v21 = [(CRCTCCVNLPTextDecoder *)self model];
    long long v22 = [v21 outputWidthDownscale];
    [v22 floatValue];
    float v24 = v23;
    long long v25 = [(CRCTCCVNLPTextDecoder *)self model];
    long long v26 = [v25 outputWidthOffset];
    [v26 floatValue];
    float v28 = v27;

    long long v29 = [(CRCTCCVNLPTextDecoder *)self model];
    long long v30 = [v29 outputFormatVersion];
    BOOL v31 = [v30 intValue] == 1;

    unint64_t v32 = v85;
    uint64_t v34 = v105;
    uint64_t v33 = v106;
    unint64_t v35 = v104;
    uint64_t v37 = v101;
    uint64_t v36 = v102;
    unint64_t v38 = (unint64_t)(ceil(v19 * v20 / v24) + v28 + 2.0);
    unint64_t v40 = v99;
    uint64_t v39 = v100;
    uint64_t v41 = v98;
    if (!v31)
    {
      long long v42 = [(CRCTCCVNLPTextDecoder *)self model];
      long long v43 = [v42 outputFormatVersion];
      BOOL v44 = [v43 intValue] == 2;

      if (!v44)
      {
        unint64_t v45 = 0;
        uint64_t v33 = v94;
        long long v46 = v95;
        uint64_t v34 = v92;
        unint64_t v35 = v93;
        uint64_t v48 = v90;
        uint64_t v47 = v91;
        unint64_t v40 = v88;
        uint64_t v39 = v89;
        uint64_t v41 = v87;
        goto LABEL_29;
      }
      unint64_t v32 = v104;
      unint64_t v35 = v105;
      uint64_t v33 = v105;
      uint64_t v41 = v106;
      uint64_t v34 = v106;
      uint64_t v36 = 1;
      uint64_t v37 = 1;
      uint64_t v39 = 1;
      unint64_t v40 = v104 * v106;
    }
    if (v32 >= v38) {
      unint64_t v5 = v38;
    }
    else {
      unint64_t v5 = v32;
    }
    unint64_t v45 = v17 * v40;
    long long v46 = &v83[v17 * v40];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v47 = v36;
    uint64_t v48 = v37;
    unint64_t v38 = v5;
LABEL_29:
    uint64_t v49 = *(void *)a5 + 168 * (v17 << v84);
    uint64_t v94 = v33;
    long long v95 = v46;
    *(void *)uint64_t v49 = v46;
    *(void *)(v49 + 8) = v97;
    *(_OWORD *)(v49 + 16) = v114;
    *(_OWORD *)(v49 + 32) = v115;
    *(_OWORD *)(v49 + 48) = v112;
    *(_OWORD *)(v49 + 64) = v113;
    *(void *)(v49 + 80) = v33;
    *(void *)(v49 + 88) = v35;
    uint64_t v92 = v34;
    unint64_t v93 = v35;
    *(void *)(v49 + 96) = v34;
    *(void *)(v49 + 104) = 1;
    *(void *)(v49 + 112) = v5;
    *(void *)(v49 + 120) = v47;
    uint64_t v90 = v48;
    uint64_t v91 = v47;
    *(void *)(v49 + 128) = v48;
    *(void *)(v49 + 136) = v39;
    unint64_t v88 = v40;
    uint64_t v89 = v39;
    *(void *)(v49 + 144) = v40;
    *(void *)(v49 + 152) = v41;
    uint64_t v87 = v41;
    *(_DWORD *)(v49 + 160) = v96;
    if ((v86 & 1) == 0) {
      goto LABEL_35;
    }
    long long v50 = [(CRCTCCVNLPTextDecoder *)self model];
    id v51 = [v50 outputFormatVersion];
    BOOL v52 = [v51 intValue] == 1;

    uint64_t v53 = v98;
    uint64_t v54 = v99;
    uint64_t v55 = v100;
    uint64_t v56 = v101;
    uint64_t v57 = v102;
    unint64_t v59 = v104;
    uint64_t v58 = v105;
    uint64_t v60 = v106;
    if (v52) {
      goto LABEL_33;
    }
    id v61 = [(CRCTCCVNLPTextDecoder *)self model];
    long long v62 = [v61 outputFormatVersion];
    BOOL v63 = [v62 intValue] == 2;

    uint64_t v54 = v81;
    uint64_t v53 = v82;
    uint64_t v65 = v79;
    uint64_t v64 = v80;
    unint64_t v67 = v77;
    uint64_t v66 = v78;
    unint64_t v59 = v75;
    uint64_t v58 = v76;
    uint64_t v68 = v73;
    uint64_t v60 = v74;
    if (v63)
    {
      uint64_t v60 = v105;
      uint64_t v58 = v106;
      uint64_t v53 = v106;
      uint64_t v54 = v106 * v106;
      uint64_t v55 = 1;
      uint64_t v56 = 1;
      uint64_t v57 = 1;
      unint64_t v59 = v105;
LABEL_33:
      uint64_t v64 = v55;
      long long v110 = 0u;
      long long v111 = 0u;
      uint64_t v65 = v56;
      uint64_t v66 = v57;
      unint64_t v67 = v38;
      long long v108 = 0u;
      long long v109 = 0u;
      uint64_t v68 = v72 + 4 * v45;
    }
    uint64_t v69 = *(void *)a5 + 168 * ((v17 << v84) + 1);
    uint64_t v73 = v68;
    uint64_t v74 = v60;
    *(void *)uint64_t v69 = v68;
    *(void *)(v69 + 8) = v97;
    *(_OWORD *)(v69 + 16) = v110;
    *(_OWORD *)(v69 + 32) = v111;
    *(_OWORD *)(v69 + 48) = v108;
    *(_OWORD *)(v69 + 64) = v109;
    *(void *)(v69 + 80) = v60;
    *(void *)(v69 + 88) = v59;
    unint64_t v75 = v59;
    uint64_t v76 = v58;
    *(void *)(v69 + 96) = v58;
    *(void *)(v69 + 104) = 1;
    unint64_t v77 = v67;
    uint64_t v78 = v66;
    *(void *)(v69 + 112) = v67;
    *(void *)(v69 + 120) = v66;
    uint64_t v79 = v65;
    uint64_t v80 = v64;
    *(void *)(v69 + 128) = v65;
    *(void *)(v69 + 136) = v64;
    uint64_t v81 = v54;
    uint64_t v82 = v53;
    *(void *)(v69 + 144) = v54;
    *(void *)(v69 + 152) = v53;
    *(_DWORD *)(v69 + 160) = v96;
LABEL_35:

    ++v17;
  }
}

- (BOOL)_wordLMShouldFilterCandidate:(id)a3 inLocale:(id)a4 lmConfig:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [v9 fullString];
  uint64_t v13 = [v9 fullString];
  unint64_t v14 = [v13 length];
  if (v14 > 0x80)
  {
    uint64_t v15 = 128;
  }
  else
  {
    unint64_t v5 = [v9 fullString];
    uint64_t v15 = [v5 length];
  }
  float v16 = objc_msgSend(v12, "substringWithRange:", 0, v15);
  if (v14 <= 0x80) {

  }
  uint64_t v17 = [v16 length];
  if (self->_shouldUseLM || [(CRCTCCVNLPTextDecoder *)self shouldUseModernizedDecoder])
  {
    [v9 activationScore];
  }
  else
  {
    [v9 activationScore];
    double v19 = v31;
    if (!v17) {
      goto LABEL_10;
    }
    double v18 = pow(v31, 1.0 / (double)v17);
  }
  double v19 = v18;
LABEL_10:
  if (v17 < [v11 filteringMinimumLength]
    || ([v11 filteringActivationThreshold], float v20 = v19, v21 <= v20))
  {
    BOOL v25 = 0;
  }
  else
  {
    long long v22 = +[CRLanguageResourcesManager postProcessManager];
    uint64_t v37 = 0;
    unint64_t v38 = (float *)&v37;
    uint64_t v39 = 0x2020000000;
    int v40 = 1065353216;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __72__CRCTCCVNLPTextDecoder__wordLMShouldFilterCandidate_inLocale_lmConfig___block_invoke;
    v33[3] = &unk_1E6CDC880;
    unint64_t v35 = &v37;
    uint64_t v36 = v17;
    id v34 = v16;
    [v22 lockResourcesForLocale:v10 sender:self block:v33];
    float v23 = v38[6];
    [v11 lmThresholdForLength:v17];
    BOOL v25 = v23 < v24;
    if (v23 < v24)
    {
      long long v26 = CROSLogForCategory(3);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        float v27 = [(CRCTCCVNLPTextDecoder *)self configuration];
        float v28 = [v27 locale];
        [v9 activationScore];
        double v29 = v38[6];
        *(_DWORD *)buf = 138413058;
        long long v42 = v28;
        __int16 v43 = 2048;
        uint64_t v44 = v17;
        __int16 v45 = 2048;
        uint64_t v46 = v30;
        __int16 v47 = 2048;
        double v48 = v29;
        _os_log_impl(&dword_1DD733000, v26, OS_LOG_TYPE_DEBUG, "Filtering candidate: lang = %@ | length = %ld | activation = %.3f | lmScore = %.3f", buf, 0x2Au);
      }
    }
    else
    {
    }
    _Block_object_dispose(&v37, 8);
  }
  return v25;
}

void __72__CRCTCCVNLPTextDecoder__wordLMShouldFilterCandidate_inLocale_lmConfig___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 cvnlpCharacterLanguageModel])
  {
    [v4 cvnlpCharacterLanguageModel];
    CVNLPLanguageModelLogJointProbability();
    *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = expf(v3 / (float)*(uint64_t *)(a1 + 48));
  }
}

+ (unint64_t)_disambiguatedScriptForString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0;
  int v5 = 0;
  int v6 = 0;
  int v7 = 0;
  while ([v3 length] > v4)
  {
    int v8 = [v3 characterAtIndex:v4];
    if ((v8 - 1024) > 0x12F)
    {
      int v9 = (unsigned __int16)((v8 & 0xFFDF) - 65) < 0x1Au || (v8 - 248) < 0x158;
      if ((unsigned __int16)(v8 - 192) < 0x17u) {
        int v9 = 1;
      }
      if ((v8 - 216) < 0x1F) {
        int v9 = 1;
      }
      v7 += v9;
    }
    else
    {
      ++v5;
      v6 += utf16CheckIsCyrillicUkrainianOnly(v8);
    }
    ++v4;
  }
  if (v5 | v7 && (double)v5 * 1.5 >= (double)v7)
  {
    if (v6 <= 0) {
      unint64_t v10 = 2;
    }
    else {
      unint64_t v10 = 3;
    }
  }
  else
  {
    unint64_t v10 = 1;
  }

  return v10;
}

+ (unordered_map<CRDisambiguatedScript,)_disambiguatedScriptFeatureIndicesWithInfo:()std:()std:(std:(std:(id)a2 :(SEL)a3 vector<unsigned long>>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)CRDisambiguatedScript :equal_to<CRDisambiguatedScript> :hash<CRDisambiguatedScript>
{
  id v70 = a2;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = 0;
  uint64_t v71 = 1;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 2;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  uint64_t v79 = 3;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  retstr->var0.unint64_t var0 = 0u;
  retstr->var0.var3.unint64_t var0 = 1.0;
  *(_OWORD *)&retstr->var0.var1.var0.unint64_t var0 = 0u;
  p_var1 = &retstr->var0.var1;
  do
  {
    unint64_t v9 = *(&v71 + 4 * v7);
    unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
    if (var0)
    {
      uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)var0);
      v11.i16[0] = vaddlv_u8(v11);
      if (v11.u32[0] > 1uLL)
      {
        unint64_t v4 = *(&v71 + 4 * v7);
        if (var0 <= v9) {
          unint64_t v4 = v9 % var0;
        }
      }
      else
      {
        unint64_t v4 = (var0 - 1) & v9;
      }
      unint64_t v12 = retstr->var0.var0.var0.var0[v4];
      if (v12)
      {
        for (uint64_t i = (void *)*v12; i; uint64_t i = (void *)*i)
        {
          unint64_t v14 = i[1];
          if (v14 == v9)
          {
            if (i[2] == v9) {
              goto LABEL_74;
            }
          }
          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= var0) {
                v14 %= var0;
              }
            }
            else
            {
              v14 &= var0 - 1;
            }
            if (v14 != v4) {
              break;
            }
          }
        }
      }
    }
    uint64_t v15 = operator new(0x30uLL);
    void *v15 = 0;
    v15[1] = v9;
    v15[2] = v9;
    v15[4] = 0;
    v15[5] = 0;
    v15[3] = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v15 + 3, (const void *)*(&v71 + 4 * v7 + 1), *(&v73 + 4 * v7), (*(&v73 + 4 * v7) - *(&v71 + 4 * v7 + 1)) >> 3);
    float v16 = (float)(retstr->var0.var2.var0 + 1);
    float v17 = retstr->var0.var3.var0;
    if (!var0 || (float)(v17 * (float)var0) < v16)
    {
      BOOL v18 = (var0 & (var0 - 1)) != 0;
      if (var0 < 3) {
        BOOL v18 = 1;
      }
      unint64_t v19 = v18 | (2 * var0);
      unint64_t v20 = vcvtps_u32_f32(v16 / v17);
      if (v19 <= v20) {
        int8x8_t prime = (int8x8_t)v20;
      }
      else {
        int8x8_t prime = (int8x8_t)v19;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      }
      unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
      if (*(void *)&prime > var0) {
        goto LABEL_30;
      }
      if (*(void *)&prime < var0)
      {
        unint64_t v28 = vcvtps_u32_f32((float)retstr->var0.var2.var0 / retstr->var0.var3.var0);
        if (var0 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)var0), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
        {
          unint64_t v28 = std::__next_prime(v28);
        }
        else
        {
          uint64_t v30 = 1 << -(char)__clz(v28 - 1);
          if (v28 >= 2) {
            unint64_t v28 = v30;
          }
        }
        if (*(void *)&prime <= v28) {
          int8x8_t prime = (int8x8_t)v28;
        }
        if (*(void *)&prime >= var0)
        {
          unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
        }
        else
        {
          if (prime)
          {
LABEL_30:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            long long v22 = (void **)operator new(8 * *(void *)&prime);
            float v23 = retstr->var0.var0.var0.var0;
            retstr->var0.var0.var0.unint64_t var0 = v22;
            if (v23) {
              operator delete(v23);
            }
            uint64_t v24 = 0;
            retstr->var0.var0.var0.var1.var0.unint64_t var0 = (unint64_t)prime;
            do
              retstr->var0.var0.var0.var0[v24++] = 0;
            while (*(void *)&prime != v24);
            BOOL v25 = p_var1->var0.var0;
            if (p_var1->var0.var0)
            {
              unint64_t v26 = v25[1];
              uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
              v27.i16[0] = vaddlv_u8(v27);
              if (v27.u32[0] > 1uLL)
              {
                if (v26 >= *(void *)&prime) {
                  v26 %= *(void *)&prime;
                }
              }
              else
              {
                v26 &= *(void *)&prime - 1;
              }
              retstr->var0.var0.var0.var0[v26] = p_var1;
              long double v31 = (void *)*v25;
              if (*v25)
              {
                do
                {
                  unint64_t v32 = v31[1];
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v32 >= *(void *)&prime) {
                      v32 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v32 &= *(void *)&prime - 1;
                  }
                  if (v32 != v26)
                  {
                    if (!retstr->var0.var0.var0.var0[v32])
                    {
                      retstr->var0.var0.var0.var0[v32] = v25;
                      goto LABEL_55;
                    }
                    *BOOL v25 = *v31;
                    void *v31 = *(void *)retstr->var0.var0.var0.var0[v32];
                    *(void *)retstr->var0.var0.var0.var0[v32] = v31;
                    long double v31 = v25;
                  }
                  unint64_t v32 = v26;
LABEL_55:
                  BOOL v25 = v31;
                  long double v31 = (void *)*v31;
                  unint64_t v26 = v32;
                }
                while (v31);
              }
            }
            unint64_t var0 = (unint64_t)prime;
            goto LABEL_59;
          }
          uint64_t v36 = retstr->var0.var0.var0.var0;
          retstr->var0.var0.var0.unint64_t var0 = 0;
          if (v36) {
            operator delete(v36);
          }
          unint64_t var0 = 0;
          retstr->var0.var0.var0.var1.var0.unint64_t var0 = 0;
        }
      }
LABEL_59:
      if ((var0 & (var0 - 1)) != 0)
      {
        if (var0 <= v9) {
          unint64_t v4 = v9 % var0;
        }
        else {
          unint64_t v4 = v9;
        }
      }
      else
      {
        unint64_t v4 = (var0 - 1) & v9;
      }
    }
    uint64_t v33 = retstr->var0.var0.var0.var0;
    id v34 = (void **)retstr->var0.var0.var0.var0[v4];
    if (v34)
    {
      void *v15 = *v34;
LABEL_72:
      *id v34 = v15;
      goto LABEL_73;
    }
    void *v15 = p_var1->var0.var0;
    p_var1->var0.unint64_t var0 = v15;
    v33[v4] = p_var1;
    if (*v15)
    {
      unint64_t v35 = *(void *)(*v15 + 8);
      if ((var0 & (var0 - 1)) != 0)
      {
        if (v35 >= var0) {
          v35 %= var0;
        }
      }
      else
      {
        v35 &= var0 - 1;
      }
      id v34 = &retstr->var0.var0.var0.var0[v35];
      goto LABEL_72;
    }
LABEL_73:
    ++retstr->var0.var2.var0;
LABEL_74:
    ++v7;
  }
  while (v7 != 3);
  for (uint64_t j = 0; j != -96; j -= 32)
  {
    unint64_t v38 = *(void **)((char *)&v80 + j);
    if (v38)
    {
      *(uint64_t *)((char *)&v81 + j) = (uint64_t)v38;
      operator delete(v38);
    }
  }
  unint64_t v39 = 0;
LABEL_89:
  if (v39 < objc_msgSend(v6, "count", v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83))
  {
    int v40 = (void *)MEMORY[0x1E01BF820]();
    uint64_t v41 = [v6 objectAtIndexedSubscript:v39];
    __int16 v43 = v41;
    if (v41)
    {
      id Property = objc_getProperty(v41, v42, 80, 1);
      uint64_t v46 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v45, 352, 1);
      }
    }
    else
    {
      uint64_t v46 = 0;
      id Property = 0;
    }
    id v47 = Property;
    double v48 = [v47 candidates];
    uint64_t v49 = [v48 firstObject];
    long long v50 = [v49 fullString];

    unint64_t v51 = [(id)objc_opt_class() _disambiguatedScriptForString:v50];
    unint64_t v52 = retstr->var0.var0.var0.var1.var0.var0;
    if (!v52) {
      goto LABEL_129;
    }
    uint8x8_t v53 = (uint8x8_t)vcnt_s8((int8x8_t)v52);
    v53.i16[0] = vaddlv_u8(v53);
    if (v53.u32[0] > 1uLL)
    {
      unint64_t v54 = v51;
      if (v51 >= v52) {
        unint64_t v54 = v51 % v52;
      }
    }
    else
    {
      unint64_t v54 = (v52 - 1) & v51;
    }
    uint64_t v55 = retstr->var0.var0.var0.var0[v54];
    if (!v55 || (uint64_t v56 = (void *)*v55) == 0) {
LABEL_129:
    }
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    while (1)
    {
      unint64_t v57 = v56[1];
      if (v57 == v51)
      {
        if (v56[2] == v51)
        {
          unint64_t v58 = v56[5];
          unint64_t v59 = (unint64_t *)v56[4];
          if ((unint64_t)v59 >= v58)
          {
            id v61 = (unint64_t *)v56[3];
            uint64_t v62 = v59 - v61;
            if ((unint64_t)(v62 + 1) >> 61) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v63 = v58 - (void)v61;
            unint64_t v64 = (uint64_t)(v58 - (void)v61) >> 2;
            if (v64 <= v62 + 1) {
              unint64_t v64 = v62 + 1;
            }
            if (v63 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v65 = v64;
            }
            if (v65)
            {
              uint64_t v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v56 + 5), v65);
              id v61 = (unint64_t *)v56[3];
              unint64_t v59 = (unint64_t *)v56[4];
            }
            else
            {
              uint64_t v66 = 0;
            }
            unint64_t v67 = (unint64_t *)&v66[8 * v62];
            *unint64_t v67 = v39;
            uint64_t v60 = v67 + 1;
            while (v59 != v61)
            {
              unint64_t v68 = *--v59;
              *--unint64_t v67 = v68;
            }
            v56[3] = v67;
            v56[4] = v60;
            v56[5] = &v66[8 * v65];
            if (v61) {
              operator delete(v61);
            }
          }
          else
          {
            *unint64_t v59 = v39;
            uint64_t v60 = v59 + 1;
          }
          v56[4] = v60;

          ++v39;
          goto LABEL_89;
        }
      }
      else
      {
        if (v53.u32[0] > 1uLL)
        {
          if (v57 >= v52) {
            v57 %= v52;
          }
        }
        else
        {
          v57 &= v52 - 1;
        }
        if (v57 != v54) {
          goto LABEL_129;
        }
      }
      uint64_t v56 = (void *)*v56;
      if (!v56) {
        goto LABEL_129;
      }
    }
  }

  return result;
}

- (BOOL)_shouldUseCharacterDecodingToken
{
  id v3 = [(CRCTCCVNLPTextDecoder *)self model];
  if ([v3 supportCharacterBoxes]) {
    BOOL v4 = [(CRCTCCVNLPTextDecoder *)self shouldUseLM];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_commitActionBehavior
{
  if ([(CRCTCCVNLPTextDecoder *)self _shouldUseCharacterDecodingToken]) {
    [MEMORY[0x1E4F56780] defaultCharacterCommitActionBehavior];
  }
  else {
  v2 = [MEMORY[0x1E4F56780] defaultWhitespaceCommitActionBehavior];
  }
  return v2;
}

- (BOOL)_decodeFeaturesWithInfo:(id)a3 imageSize:(CGSize)a4 error:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  unint64_t v9 = [(CRCTCCVNLPTextDecoder *)self configuration];
  uint64_t v10 = [v9 numTopStringCandidates];
  if (v10 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v10;
  }

  if (v11 <= 3) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = [(CRCTCCVNLPTextDecoder *)self _commitActionBehavior];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F56778]) initWithCommitActionBehavior:v13 beamWidth:v12 pathCount:v11 shouldOptimizeAlignment:0 pruneProblematicMixedScriptWordPaths:1];
  [v14 setShouldApplyWordLMToLastWord:1];
  __int16 v43 = (void *)[objc_alloc(MEMORY[0x1E4F56780]) initWithCommitActionBehavior:v13];
  if ([(CRCTCCVNLPTextDecoder *)self shouldUseLM]) {
    long long v42 = 0;
  }
  else {
    long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F56750]) initWithLanguageResourceBundle:0];
  }
  uint64_t v15 = [(CRCTCCVNLPTextDecoder *)self model];
  uint64_t v41 = v14;
  unint64_t v39 = (void *)v13;
  uint64_t v16 = [v15 supportCharacterBoxes];

  unint64_t v17 = 0;
  do
  {
    unint64_t v18 = v17;
    unint64_t v19 = [v8 count];
    if (v18 >= v19) {
      break;
    }
    unint64_t v20 = [v8 objectAtIndexedSubscript:v18];
    long long v22 = v20;
    if (v20) {
      id Property = objc_getProperty(v20, v21, 80, 1);
    }
    else {
      id Property = 0;
    }
    id v24 = Property;

    if (v24 && objc_getProperty(v24, v25, 376, 1))
    {
      uint8x8_t v27 = objc_getProperty(v24, v26, 376, 1);
      dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      objc_setProperty_atomic(v24, v28, 0, 376);
    }
    uint8x8_t v29 = [(CRCTCCVNLPTextDecoder *)self locale];
    uint64_t v30 = [v29 localeIdentifier];

    if (v24 && objc_getProperty(v24, v31, 368, 1))
    {
      id v33 = objc_getProperty(v24, v32, 368, 1);

      uint64_t v30 = v33;
    }
    id v34 = [(CRCTCCVNLPTextDecoder *)self configuration];
    unint64_t v35 = +[CRLanguageModelConfiguration configurationForLanguageIdentifier:rev:](CRLanguageModelConfiguration, "configurationForLanguageIdentifier:rev:", v30, [v34 revision]);

    uint64_t v36 = [v8 objectAtIndexedSubscript:v18];
    BOOL v37 = -[CRCTCCVNLPTextDecoder _decodeSingleFeatureWithInfo:decodingLocale:greedyDecoder:greedyConfig:beamSearchConfig:imageSize:useCharacterBoxes:lmConfig:error:](self, "_decodeSingleFeatureWithInfo:decodingLocale:greedyDecoder:greedyConfig:beamSearchConfig:imageSize:useCharacterBoxes:lmConfig:error:", v36, v30, v42, v43, v41, v16, width, height, v35, a5);

    unint64_t v17 = v18 + 1;
  }
  while (v37);

  return v18 >= v19;
}

- (id)_cvnlpDecodingResultForActivationMatrix:(id)a3 decodingLocale:(id)a4 beamSearchConfig:(id)a5 lmConfig:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v30 = 0;
  long double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__25;
  id v34 = __Block_byref_object_dispose__25;
  id v35 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __112__CRCTCCVNLPTextDecoder__cvnlpDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke;
  v25[3] = &unk_1E6CDC8A8;
  v25[4] = self;
  id v16 = v15;
  id v26 = v16;
  id v17 = v12;
  id v27 = v17;
  uint8x8_t v29 = &v30;
  id v18 = v14;
  id v28 = v18;
  unint64_t v19 = (void *)MEMORY[0x1E01BFAC0](v25);
  unint64_t v20 = +[CRLanguageResourcesManager sharedManager];
  char v21 = [v20 lockResourcesForLocale:v13 sender:self block:v19];
  if (a7) {
    char v22 = v21;
  }
  else {
    char v22 = 1;
  }
  if (v22)
  {
    id v23 = (id)v31[5];
  }
  else
  {
    +[CRImageReader errorWithErrorCode:-6];
    id v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v30, 8);
  return v23;
}

void __112__CRCTCCVNLPTextDecoder__cvnlpDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) configuration];
  BOOL v4 = [v9 cvnlpLanguageResourceBundle:v3 lmConfig:*(void *)(a1 + 40)];

  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F56750]) initWithLanguageResourceBundle:v4];
  [v5 setActivationMatrix:*(void *)(a1 + 48)];
  uint64_t v6 = [v5 decodingResultWithConfiguration:*(void *)(a1 + 56) withContext:0];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>)_createBeamScorerWithBundle:(SEL)a3 beamSearchConfig:(id)a4 lmConfig:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  *(_OWORD *)&retstr->var1 = xmmword_1DD8CF2C0;
  retstr->unint64_t var0 = (void **)&unk_1F38ED330;
  retstr->var3.unint64_t var0 = 0;
  retstr->var3.var1 = 0;
  retstr->var3.var2.unint64_t var0 = 0;
  codemapArray = self->_codemapArray;
  unint64_t codemapSize = self->_codemapSize;
  uint64_t v101 = 0;
  uint64_t v102 = 0;
  __p = 0;
  if (codemapSize)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](&__p, codemapSize);
    uint64_t v15 = 0;
    id v16 = v101;
    do
    {
      *(_DWORD *)&v16[v15 * 4] = codemapArray[v15];
      ++v15;
    }
    while (codemapSize != v15);
    uint64_t v101 = &v16[v15 * 4];
  }
  id v17 = [(CRCTCCVNLPTextDecoder *)self characterObservations];
  [v17 indexOfObject:@" "];

  id v18 = [v12 characterLMWeight];
  if (v18)
  {
    unint64_t v19 = [v12 characterLMWeight];
    [v19 doubleValue];
    BOOL v21 = v20 > 0.0;
  }
  else
  {
    BOOL v21 = 0;
  }

  if ([v10 lmCharacterLanguageModel]) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = 0;
  }
  if (v22)
  {
    id v23 = (void **)[v10 lmCharacterLanguageModel];
    id v24 = v23;
    if (v23) {
      CFRetain(v23);
    }
    long long v95 = (std::vector<unsigned int> *)v24;
    operator new();
  }
  if ([v10 cvnlpCharacterLanguageModel]) {
    BOOL v25 = v21;
  }
  else {
    BOOL v25 = 0;
  }
  if (v25)
  {
    id v26 = (void **)[v10 cvnlpCharacterLanguageModel];
    id v27 = v26;
    if (v26) {
      CFRetain(v26);
    }
    long long v95 = (std::vector<unsigned int> *)v27;
    operator new();
  }
  if ([v11 pruneProblematicMixedScriptWordPaths])
  {
    id v28 = [v10 locale];
    uint8x8_t v29 = [v28 localeIdentifier];
    BOOL v30 = +[CRImageReader languageIsArabic:v29];

    if (v30)
    {
      memset(&v103, 0, sizeof(v103));
      std::vector<unsigned int>::reserve(&v103, (v101 - (unsigned char *)__p) >> 2);
      long double v31 = (unsigned __int16 *)__p;
      uint64_t v32 = (unsigned __int16 *)v101;
      v105[0] = (uint64_t)&v103;
      if (__p != v101)
      {
        do
        {
          int v33 = *v31;
          if ((v33 - 48) >= 0xA)
          {
            if ((v33 - 1632) >= 0xA)
            {
              int v34 = 2;
              if ((v33 - 42) >= 6)
              {
                unsigned int v35 = v33 - 1642;
                unsigned int v36 = v33 - 1548;
                if ((v33 - 151) >= 0x8C && (v33 - 101) >= 0x2C) {
                  int v38 = 4;
                }
                else {
                  int v38 = 3;
                }
                if (v36 < 2) {
                  int v38 = 2;
                }
                if (v35 >= 4) {
                  int v34 = v38;
                }
                else {
                  int v34 = 2;
                }
              }
            }
            else
            {
              int v34 = 1;
            }
          }
          else
          {
            int v34 = 0;
          }
          int v104 = v34;
          std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](v105, &v104);
          v31 += 2;
        }
        while (v31 != v32);
      }
      long long v96 = xmmword_1DD8CF2C0;
      long long v97 = 0uLL;
      uint64_t v98 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v97, v103.__begin_, (uint64_t)v103.__end_, v103.__end_ - v103.__begin_);
      unint64_t v99 = 0xC08F400000000000;
      long long v95 = (std::vector<unsigned int> *)&unk_1F38EC3D0;
      if (v103.__begin_)
      {
        v103.__end_ = v103.__begin_;
        operator delete(v103.__begin_);
      }
      operator new();
    }
    unint64_t v39 = [v10 locale];
    int v40 = [v39 localeIdentifier];
    if (+[CRImageReader languageIsLatin:v40])
    {

LABEL_48:
      memset(&v103, 0, sizeof(v103));
      std::vector<unsigned int>::reserve(&v103, (v101 - (unsigned char *)__p) >> 2);
      uint64_t v44 = (char *)__p;
      __int16 v45 = v101;
      v105[0] = (uint64_t)&v103;
      while (v44 != v45)
      {
        int v104 = CVNLPCodepointToScriptCode();
        std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](v105, &v104);
        v44 += 4;
      }
      long long v96 = xmmword_1DD8CF2C0;
      long long v97 = 0uLL;
      uint64_t v98 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v97, v103.__begin_, (uint64_t)v103.__end_, v103.__end_ - v103.__begin_);
      unint64_t v99 = 0xC08F400000000000;
      long long v95 = (std::vector<unsigned int> *)&unk_1F38ED478;
      if (v103.__begin_)
      {
        v103.__end_ = v103.__begin_;
        operator delete(v103.__begin_);
      }
      operator new();
    }
    uint64_t v41 = [v10 locale];
    long long v42 = [v41 localeIdentifier];
    BOOL v43 = +[CRImageReader languageIsCyrillic:v42];

    if (v43) {
      goto LABEL_48;
    }
  }
  uint64_t v46 = [v12 lexiconWeight];
  if (v46)
  {
    id v47 = [v12 lexiconWeight];
    [v47 doubleValue];
    double v49 = v48;

    if (v49 > 0.0)
    {
      memset(&v103, 0, sizeof(v103));
      if ([v10 staticLexicon])
      {
        long long v50 = (const void *)[v10 staticLexicon];
        uint64_t v51 = (uint64_t)v50;
        if (v50) {
          CFRetain(v50);
        }
        v105[0] = v51;
        std::vector<unsigned int>::pointer end = v103.__end_;
        if (v103.__end_ >= v103.__end_cap_.__value_)
        {
          std::vector<unsigned int>::pointer begin = v103.__begin_;
          int64_t v55 = ((char *)v103.__end_ - (char *)v103.__begin_) >> 3;
          unint64_t v56 = v55 + 1;
          if ((unint64_t)(v55 + 1) >> 61) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          int64_t v57 = (char *)v103.__end_cap_.__value_ - (char *)v103.__begin_;
          if (v103.__end_cap_.__value_ - v103.__begin_ > v56) {
            unint64_t v56 = v57 >> 2;
          }
          if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v58 = v56;
          }
          *((void *)&v97 + 1) = &v103.__end_cap_;
          if (v58)
          {
            unint64_t v58 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v58);
            std::vector<unsigned int>::pointer begin = v103.__begin_;
            std::vector<unsigned int>::pointer end = v103.__end_;
          }
          else
          {
            uint64_t v59 = 0;
          }
          uint64_t v60 = (unsigned int *)(v58 + 8 * v55);
          *(void *)&long long v97 = v58 + 8 * v59;
          *(void *)uint64_t v60 = v51;
          *((void *)&v96 + 1) = v60 + 2;
          if (end == begin)
          {
            uint8x8_t v53 = v60 + 2;
          }
          else
          {
            do
            {
              uint64_t v61 = *((void *)end - 1);
              end -= 2;
              *((void *)v60 - 1) = v61;
              v60 -= 2;
              *(void *)std::vector<unsigned int>::pointer end = 0;
            }
            while (end != begin);
            uint8x8_t v53 = (unsigned int *)*((void *)&v96 + 1);
          }
          long long v62 = *(_OWORD *)&v103.__begin_;
          v103.__begin_ = v60;
          v103.__end_ = v53;
          long long v96 = v62;
          unint64_t value = v103.__end_cap_.__value_;
          v103.__end_cap_.__value_ = (unsigned int *)v97;
          *(void *)&long long v97 = value;
          long long v95 = (std::vector<unsigned int> *)v62;
          std::__split_buffer<applesauce::CF::ObjectRef<_LXLexicon const*>>::~__split_buffer((uint64_t)&v95);
        }
        else
        {
          *(void *)v103.__end_ = v51;
          uint8x8_t v53 = end + 2;
        }
        v103.__end_ = v53;
      }
      unint64_t v64 = [(CRCTCCVNLPTextDecoder *)self configuration];
      unint64_t v65 = [v64 customWords];
      if (v65)
      {
        uint64_t v66 = [(CRCTCCVNLPTextDecoder *)self configuration];
        unint64_t v67 = [v66 customWords];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v68 = [v10 isCustomWordsSupported];

          if (!v68)
          {
LABEL_100:
            if (v103.__begin_ != v103.__end_) {
              operator new();
            }
            long long v95 = &v103;
            std::vector<applesauce::CF::ObjectRef<_LXLexicon const*>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v95);
            goto LABEL_103;
          }
          unint64_t v64 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
          uint64_t v69 = [(CRCTCCVNLPTextDecoder *)self configuration];
          id v70 = [v69 customWords];
          unint64_t v65 = [v70 filteredArrayUsingPredicate:v64];

          if ([v65 count])
          {
            uint64_t v71 = [(CRCTCCVNLPTextDecoder *)self locale];
            uint64_t v72 = +[CRLanguageUtils createDynamicLexicon:v65 forLocale:v71 error:0];
            uint64_t v73 = v72;
            v105[0] = (uint64_t)v72;
            std::vector<unsigned int>::pointer v74 = v103.__end_;
            if (v103.__end_ >= v103.__end_cap_.__value_)
            {
              std::vector<unsigned int>::pointer v76 = v103.__begin_;
              int64_t v77 = ((char *)v103.__end_ - (char *)v103.__begin_) >> 3;
              unint64_t v78 = v77 + 1;
              if ((unint64_t)(v77 + 1) >> 61) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              int64_t v79 = (char *)v103.__end_cap_.__value_ - (char *)v103.__begin_;
              if (v103.__end_cap_.__value_ - v103.__begin_ > v78) {
                unint64_t v78 = v79 >> 2;
              }
              if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v80 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v80 = v78;
              }
              *((void *)&v97 + 1) = &v103.__end_cap_;
              if (v80)
              {
                unint64_t v80 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v80);
                std::vector<unsigned int>::pointer v76 = v103.__begin_;
                std::vector<unsigned int>::pointer v74 = v103.__end_;
              }
              else
              {
                uint64_t v81 = 0;
              }
              uint64_t v82 = (unsigned int *)(v80 + 8 * v77);
              *(void *)&long long v97 = v80 + 8 * v81;
              *(void *)uint64_t v82 = v73;
              *((void *)&v96 + 1) = v82 + 2;
              if (v74 == v76)
              {
                uint64_t v75 = v82 + 2;
              }
              else
              {
                do
                {
                  uint64_t v83 = *((void *)v74 - 1);
                  v74 -= 2;
                  *((void *)v82 - 1) = v83;
                  v82 -= 2;
                  *(void *)std::vector<unsigned int>::pointer v74 = 0;
                }
                while (v74 != v76);
                uint64_t v75 = (unsigned int *)*((void *)&v96 + 1);
              }
              long long v84 = *(_OWORD *)&v103.__begin_;
              v103.__begin_ = v82;
              v103.__end_ = v75;
              long long v96 = v84;
              unint64_t v85 = v103.__end_cap_.__value_;
              v103.__end_cap_.__value_ = (unsigned int *)v97;
              *(void *)&long long v97 = v85;
              long long v95 = (std::vector<unsigned int> *)v84;
              std::__split_buffer<applesauce::CF::ObjectRef<_LXLexicon const*>>::~__split_buffer((uint64_t)&v95);
            }
            else
            {
              *(void *)v103.__end_ = v72;
              uint64_t v75 = v74 + 2;
            }
            v103.__end_ = v75;
          }
        }
        else
        {
        }
      }

      goto LABEL_100;
    }
  }
LABEL_103:
  if ([v10 wordLanguageModel])
  {
    char v86 = [v12 wordLMWeight];
    if (v86)
    {
      uint64_t v87 = [v12 wordLMWeight];
      [v87 doubleValue];
      double v89 = v88;

      if (v89 > 0.0)
      {
        uint64_t v90 = (void **)[v10 wordLanguageModel];
        uint64_t v91 = v90;
        if (v90) {
          CFRetain(v90);
        }
        long long v95 = (std::vector<unsigned int> *)v91;
        uint64_t v92 = (unsigned int *)[v10 wordTokenizer];
        unint64_t v93 = v92;
        if (v92) {
          CFRetain(v92);
        }
        v103.__begin_ = v93;
        operator new();
      }
    }
  }
  if (__p)
  {
    uint64_t v101 = __p;
    operator delete(__p);
  }

  return result;
}

- (id)_cvnlpGreedyModernizedDecodingResultForActivationMatrix:(const void *)a3
{
  int v5 = [(CRCTCCVNLPTextDecoder *)self model];
  uint64_t v6 = [v5 ctcBlankLabelIndex];

  long long v25 = 0uLL;
  id v26 = 0;
  if ([(CRCTCCVNLPTextDecoder *)self _shouldUseCharacterDecodingToken])
  {
    id v14 = (void **)&unk_1F38ED0A8;
    uint64_t v15 = v6;
    char v17 = 0;
    id v16 = &unk_1F38ED428;
    CFTypeRef v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::CharacterSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode((uint64_t)&v14, (unint64_t *)a3, (uint64_t *)&v9);
    std::vector<CoreRecognition::decoder::DecodingPath>::__vdeallocate((void ***)&v25);
    long long v25 = v9;
    id v26 = __p;
    id v27 = (void **)&v9;
    __p = 0;
    long long v9 = 0uLL;
    std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v27);
  }
  else
  {
    BYTE8(v9) = 0;
    *(void *)&long long v9 = &unk_1F38ED2E0;
    __p = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, self->_spaceLabels.__begin_, (uint64_t)self->_spaceLabels.__end_, self->_spaceLabels.__end_ - self->_spaceLabels.__begin_);
    char v13 = 0;
    uint64_t v15 = v6;
    id v14 = (void **)&unk_1F38ED080;
    char v17 = 0;
    id v16 = &unk_1F38ED2E0;
    id v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v18, __p, (uint64_t)v11, (v11 - (unsigned char *)__p) >> 3);
    char v21 = v13;
    *(void *)&long long v9 = &unk_1F38ED2E0;
    if (__p)
    {
      id v11 = __p;
      operator delete(__p);
    }
    CFTypeRef v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode(&v14, (uint64_t *)a3, (uint64_t *)&v9);
    std::vector<CoreRecognition::decoder::DecodingPath>::__vdeallocate((void ***)&v25);
    long long v25 = v9;
    id v26 = __p;
    id v27 = (void **)&v9;
    __p = 0;
    long long v9 = 0uLL;
    std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v27);
    if (v22) {
      CFRelease(v22);
    }
    id v14 = (void **)&unk_1F38ED080;
    id v16 = &unk_1F38ED2E0;
    if (v18)
    {
      unint64_t v19 = v18;
      operator delete(v18);
    }
  }
  uint64_t v7 = convertToCVNLPTextDecodingResult();
  id v14 = (void **)&v25;
  std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v14);
  return v7;
}

id __81__CRCTCCVNLPTextDecoder__cvnlpGreedyModernizedDecodingResultForActivationMatrix___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) characterObservations];
  BOOL v4 = [v3 objectAtIndexedSubscript:a2];

  return v4;
}

- (id)_cvnlpModernizedDecodingResultForActivationMatrix:(const void *)a3 decodingLocale:(id)a4 beamSearchConfig:(id)a5 lmConfig:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v28 = 0;
  uint8x8_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long double v31 = __Block_byref_object_copy__25;
  uint64_t v32 = __Block_byref_object_dispose__25;
  id v33 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __122__CRCTCCVNLPTextDecoder__cvnlpModernizedDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke;
  v23[3] = &unk_1E6CDC8D0;
  v23[4] = self;
  id v15 = v13;
  id v24 = v15;
  id v16 = v14;
  id v26 = &v28;
  id v27 = a3;
  id v25 = v16;
  char v17 = (void *)MEMORY[0x1E01BFAC0](v23);
  id v18 = +[CRLanguageResourcesManager sharedManager];
  char v19 = [v18 lockResourcesForLocale:v12 sender:self block:v17];
  if (a7) {
    char v20 = v19;
  }
  else {
    char v20 = 1;
  }
  if (v20)
  {
    id v21 = (id)v29[5];
  }
  else
  {
    +[CRImageReader errorWithErrorCode:-6];
    id v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v28, 8);
  return v21;
}

void __122__CRCTCCVNLPTextDecoder__cvnlpModernizedDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) model];
  int v5 = (void *)[v4 ctcBlankLabelIndex];

  unsigned int v6 = [*(id *)(a1 + 40) beamWidth];
  unsigned int v7 = [*(id *)(a1 + 40) pathCount];
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 pruningPolicy];
    float v9 = *((float *)&v48 + 1);
    unsigned int v10 = v49;
  }
  else
  {
    unsigned int v10 = 0;
    float v9 = 0.0;
  }
  float v11 = logf(v9);
  v45[3] = 0uLL;
  uint64_t v46 = 0;
  if ([*(id *)(a1 + 32) _shouldUseCharacterDecodingToken])
  {
    LOBYTE(v22) = 0;
    CFTypeRef v21 = &unk_1F38ED3D8;
    id v12 = *(void **)(a1 + 32);
    if (v12)
    {
      [v12 _createBeamScorerWithBundle:v3 beamSearchConfig:*(void *)(a1 + 40) lmConfig:*(void *)(a1 + 48)];
      long long v13 = *(_OWORD *)((char *)&v45[1] + 8);
      id v14 = (const void *)*((void *)&v45[2] + 1);
      char v15 = v22;
    }
    else
    {
      char v15 = 0;
      id v14 = 0;
      long long v13 = 0uLL;
      memset(v45, 0, 48);
    }
    id v25 = &unk_1F38ED1D8;
    id v26 = v5;
    long long v28 = *(_OWORD *)((char *)v45 + 8);
    long long v29 = v13;
    id v27 = &unk_1F38ED330;
    CFTypeRef v30 = v14;
    memset((char *)&v45[1] + 8, 0, 24);
    char v32 = v15;
    long double v31 = &unk_1F38ED3D8;
    __p = v5;
    unint64_t v34 = __PAIR64__(v7, v6);
    unint64_t v35 = 0xFFF0000000000000;
    float v36 = v11;
    unint64_t v37 = v10;
    LOBYTE(v38) = 1;
    LOBYTE(v40) = 1;
    *(void *)&v45[0] = &unk_1F38ED330;
    cf[0] = (char *)&v45[1] + 8;
    std::vector<std::unique_ptr<CoreRecognition::decoder::BaseBeamScorer>>::__destroy_vector::operator()[abi:ne180100]((void ***)cf);
    memset(cf, 0, 24);
    CoreRecognition::decoder::CTCBeamSearchDecoder<CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>,CoreRecognition::decoder::CharacterSegmentedPathBuilder<CoreRecognition::decoder::CombinedBeamState>>::decode();
  }
  uint64_t v16 = *(void *)(a1 + 32);
  BYTE8(v45[0]) = 0;
  *(void *)&v45[0] = &unk_1F38ED290;
  memset(&v45[1], 0, 24);
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v45[1], *(const void **)(v16 + 8), *(void *)(v16 + 16), (uint64_t)(*(void *)(v16 + 16) - *(void *)(v16 + 8)) >> 3);
  BYTE8(v45[2]) = 0;
  char v17 = *(void **)(a1 + 32);
  if (v17)
  {
    [v17 _createBeamScorerWithBundle:v3 beamSearchConfig:*(void *)(a1 + 40) lmConfig:*(void *)(a1 + 48)];
    uint64_t v18 = v10;
    long long v19 = *(_OWORD *)&cf[3];
    CFTypeRef v20 = cf[5];
  }
  else
  {
    uint64_t v18 = v10;
    CFTypeRef v20 = 0;
    long long v19 = 0uLL;
    memset(cf, 0, 48);
  }
  id v25 = &unk_1F38ED1B0;
  id v26 = v5;
  long long v28 = *(_OWORD *)&cf[1];
  long long v29 = v19;
  id v27 = &unk_1F38ED330;
  CFTypeRef v30 = v20;
  memset(&cf[3], 0, 24);
  char v32 = BYTE8(v45[0]);
  long double v31 = &unk_1F38ED290;
  __p = 0;
  unint64_t v34 = 0;
  unint64_t v35 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, *(const void **)&v45[1], *((uint64_t *)&v45[1] + 1), (uint64_t)(*((void *)&v45[1] + 1) - *(void *)&v45[1]) >> 3);
  LOBYTE(v36) = BYTE8(v45[2]);
  unint64_t v37 = (unint64_t)v5;
  unsigned int v38 = v6;
  unsigned int v39 = v7;
  unint64_t v40 = 0xFFF0000000000000;
  float v41 = v11;
  uint64_t v42 = v18;
  char v43 = 1;
  char v44 = 1;
  cf[0] = &unk_1F38ED330;
  CFTypeRef v21 = &cf[3];
  std::vector<std::unique_ptr<CoreRecognition::decoder::BaseBeamScorer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
  CFTypeRef v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  CoreRecognition::decoder::CTCBeamSearchDecoder<CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>,CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::CombinedBeamState>>::decode();
}

id __122__CRCTCCVNLPTextDecoder__cvnlpModernizedDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) characterObservations];
  BOOL v4 = [v3 objectAtIndexedSubscript:a2];

  return v4;
}

+ (id)_cvnlpDecodingResultByRerankingCandidates:(id)a3 decodingLocale:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  unint64_t v35 = v5;
  unsigned int v6 = [v5 candidates];
  uint64_t v7 = [v6 mutableCopy];

  char v32 = (void *)v7;
  if (+[CRImageReader languageIsLatin:v34])
  {
    id v8 = [v35 candidates];
    float v9 = [v8 lastObject];
    unsigned int v10 = [v9 tokens];
    uint64_t v37 = [v10 count];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    float v11 = [v35 candidates];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (!v12)
    {
LABEL_10:

      if (!v37) {
        goto LABEL_37;
      }
      uint64_t v17 = 0;
      while (1)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v18 = [v35 candidates];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v19)
        {
          uint64_t v20 = 0;
          char v21 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = *(void *)v39;
          while (2)
          {
            uint64_t v24 = 0;
            uint64_t v36 = v22;
            uint64_t v33 = v19 + v22;
            do
            {
              if (*(void *)v39 != v23) {
                objc_enumerationMutation(v18);
              }
              id v25 = [*(id *)(*((void *)&v38 + 1) + 8 * v24) tokens];
              id v26 = [v25 objectAtIndexedSubscript:v17];
              id v27 = [v26 string];

              if ((unint64_t)[v27 length] < 0x11
                || (unint64_t)[v27 length] > 0x13
                || [v27 characterAtIndex:0] != 49
                || [v27 characterAtIndex:1] != 90
                && [v27 characterAtIndex:1] != 50
                && [v27 characterAtIndex:1] != 55)
              {

                goto LABEL_31;
              }
              if ([v27 length] == 18)
              {
                BOOL v28 = [v27 characterAtIndex:1] == 90 && v36 + v24 != 0;
                if (v28) {
                  uint64_t v20 = v36 + v24;
                }
                v21 |= v28;
              }

              ++v24;
            }
            while (v19 != v24);
            uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
            uint64_t v22 = v33;
            if (v19) {
              continue;
            }
            break;
          }

LABEL_31:
          if (v21)
          {
            long double v31 = [v32 objectAtIndexedSubscript:v20];
            [v32 insertObject:v31 atIndex:0];

            [v32 removeObjectAtIndex:v20 + 1];
            goto LABEL_37;
          }
        }
        else
        {
        }
        if (++v17 == v37) {
          goto LABEL_37;
        }
      }
    }
    uint64_t v13 = *(void *)v43;
LABEL_4:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v43 != v13) {
        objc_enumerationMutation(v11);
      }
      char v15 = [*(id *)(*((void *)&v42 + 1) + 8 * v14) tokens];
      BOOL v16 = [v15 count] == v37;

      if (!v16) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (!v12) {
          goto LABEL_10;
        }
        goto LABEL_4;
      }
    }
  }
LABEL_37:
  long long v29 = (void *)[objc_alloc(MEMORY[0x1E4F56798]) initWithCandidates:v32];

  return v29;
}

+ (void)_adjustBeamSearchResults:(id *)a3 tokens:(id)a4 greedyCandidateString:(id)a5 greedyCandidateTokens:(id)a6 decodingLocale:(id)a7
{
  id v36 = a4;
  id v11 = a5;
  id v35 = a6;
  long long v29 = v11;
  id v34 = a7;
  +[CRTextDecodingUtils adjustedBeamSearchDecodedString:greedyDecodedString:decodingLocale:](CRTextDecodingUtils, "adjustedBeamSearchDecodedString:greedyDecodedString:decodingLocale:", *a3, v11);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  if (([v30 isEqualToString:*a3] & 1) == 0)
  {
    unint64_t v12 = 0;
    *a3 = v30;
    while (v12 < [v36 count])
    {
      uint64_t v13 = [v36 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v13 string];
      char v15 = [v35 objectAtIndexedSubscript:v12];
      uint64_t v16 = [v15 string];
      uint64_t v17 = +[CRTextDecodingUtils adjustedBeamSearchDecodedString:v14 greedyDecodedString:v16 decodingLocale:v34];

      uint64_t v18 = [v36 objectAtIndexedSubscript:v12];
      uint64_t v19 = [v18 string];
      LOBYTE(v16) = [v17 isEqualToString:v19];

      if ((v16 & 1) == 0)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F567A0]);
        uint64_t v33 = [v36 objectAtIndexedSubscript:v12];
        char v32 = [v33 score];
        long double v31 = [v36 objectAtIndexedSubscript:v12];
        char v21 = [v31 alignmentScore];
        uint64_t v22 = [v36 objectAtIndexedSubscript:v12];
        uint64_t v23 = [v22 activationRange];
        uint64_t v25 = v24;
        id v26 = [v36 objectAtIndexedSubscript:v12];
        id v27 = [v26 terminatingCharacter];
        BOOL v28 = objc_msgSend(v20, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v17, v32, v21, v23, v25, v27);

        [v36 replaceObjectAtIndex:v12 withObject:v28];
      }

      ++v12;
    }
  }
}

- (BOOL)_decodeSingleFeatureWithInfo:(id)a3 decodingLocale:(id)a4 greedyDecoder:(id)a5 greedyConfig:(id)a6 beamSearchConfig:(id)a7 imageSize:(CGSize)a8 useCharacterBoxes:(BOOL)a9 lmConfig:(id)a10 error:(id *)a11
{
  BOOL v299 = a9;
  uint64_t v374 = *MEMORY[0x1E4F143B8];
  selfa = a3;
  id v312 = a4;
  id v293 = a5;
  id v292 = a6;
  id v294 = a7;
  id v296 = a10;
  if (qword_1EB58CEF8 != -1) {
    dispatch_once(&qword_1EB58CEF8, &__block_literal_global_43);
  }
  context = (void *)MEMORY[0x1E01BF820]();
  if (selfa)
  {
    id Property = objc_getProperty(selfa, v16, 80, 1);
    if (Property)
    {
      id v298 = Property;
      id Property = objc_getProperty(Property, v18, 352, 1);
      char v19 = 0;
      goto LABEL_6;
    }
    id v298 = 0;
  }
  else
  {
    id v298 = 0;
    id Property = 0;
  }
  char v19 = 1;
LABEL_6:
  id v20 = Property;

  v341 = self;
  if (v20)
  {
    uint64_t v301 = 0;
  }
  else if ([(CRCTCCVNLPTextDecoder *)self shouldUseModernizedDecoder])
  {
    id v22 = selfa;
    if (selfa) {
      id v22 = objc_getProperty(selfa, v21, 80, 1);
    }
    id v23 = v22;
    [(CRCVNLPTransientResult *)(uint64_t)v370 modernizedActivationMatrix];

    uint64_t v301 = *(void *)v370;
    if ([(CRCTCCVNLPTextDecoder *)self shouldReverseActivationMatrix]) {
      CoreRecognition::decoder::ActivationMatrix::reverseInTime((unint64_t *)v370);
    }
    uint64_t v25 = [(CRCTCCVNLPTextDecoder *)self _cvnlpGreedyModernizedDecodingResultForActivationMatrix:v370];
    if ((v19 & 1) == 0) {
      objc_setProperty_atomic(v298, v24, v25, 352);
    }

    if (v372)
    {
      v373 = v372;
      operator delete(v372);
    }
    if (*(void *)&v370[16])
    {
      id v371 = *(id *)&v370[16];
      operator delete(*(void **)&v370[16]);
    }
  }
  else
  {
    if (selfa)
    {
      id v26 = objc_getProperty(selfa, v21, 80, 1);
      BOOL v28 = v26;
      if (v26) {
        id v26 = objc_getProperty(v26, v27, 360, 1);
      }
    }
    else
    {
      BOOL v28 = 0;
      id v26 = 0;
    }
    id v29 = v26;
    [v293 setActivationMatrix:v29];

    id v30 = [v293 activationMatrix];
    uint64_t v301 = [v30 timestepCount];

    char v32 = [v293 greedyDecodingResultWithConfiguration:v292];
    if ((v19 & 1) == 0) {
      objc_setProperty_atomic(v298, v31, v32, 352);
    }
  }
  if ([(CRCTCCVNLPTextDecoder *)self shouldUseLM])
  {
    id v34 = [(CRCTCCVNLPTextDecoder *)self subscribedLocales];
    objc_sync_enter(v34);
    id v35 = [(CRCTCCVNLPTextDecoder *)self subscribedLocales];
    char v36 = [v35 containsObject:v312];

    if ((v36 & 1) == 0)
    {
      uint64_t v37 = [(CRCTCCVNLPTextDecoder *)self subscribedLocales];
      [v37 addObject:v312];

      long long v38 = +[CRLanguageResourcesManager sharedManager];
      [v38 addSubscriber:self forLocale:v312];

      long long v39 = [(CRCTCCVNLPTextDecoder *)self configuration];
      int v40 = [v39 filterWithLM];

      if (v40)
      {
        long long v41 = +[CRLanguageResourcesManager postProcessManager];
        [v41 addSubscriber:self forLocale:v312];
      }
    }
    objc_sync_exit(v34);

    if ([(CRCTCCVNLPTextDecoder *)self shouldUseModernizedDecoder])
    {
      id v43 = selfa;
      if (selfa) {
        id v43 = objc_getProperty(selfa, v42, 80, 1);
      }
      id v44 = v43;
      [(CRCVNLPTransientResult *)(uint64_t)v370 modernizedActivationMatrix];

      uint64_t v301 = *(void *)v370;
      id v365 = 0;
      long long v45 = [(CRCTCCVNLPTextDecoder *)self _cvnlpModernizedDecodingResultForActivationMatrix:v370 decodingLocale:v312 beamSearchConfig:v294 lmConfig:v296 error:&v365];
      id v297 = v365;
      if (v372)
      {
        v373 = v372;
        operator delete(v372);
      }
      if (*(void *)&v370[16])
      {
        id v371 = *(id *)&v370[16];
        operator delete(*(void **)&v370[16]);
      }
    }
    else
    {
      if (selfa)
      {
        id v48 = objc_getProperty(selfa, v42, 80, 1);
        long long v50 = v48;
        if (v48) {
          id v48 = objc_getProperty(v48, v49, 360, 1);
        }
      }
      else
      {
        long long v50 = 0;
        id v48 = 0;
      }
      id v51 = v48;

      uint64_t v301 = [v51 timestepCount];
      id v364 = 0;
      long long v45 = [(CRCTCCVNLPTextDecoder *)self _cvnlpDecodingResultForActivationMatrix:v51 decodingLocale:v312 beamSearchConfig:v294 lmConfig:v296 error:&v364];
      id v297 = v364;
    }
    uint64_t v52 = +[CRCTCCVNLPTextDecoder _cvnlpDecodingResultByRerankingCandidates:v45 decodingLocale:v312];

    id v47 = (id)v52;
    if (v52)
    {
LABEL_45:
      id v290 = v47;
      v295 = [v47 candidates];
      BOOL v315 = [(CRCTCCVNLPTextDecoder *)self _shouldUseCharacterDecodingToken];
      if (![v295 count])
      {
        unint64_t v56 = v295;
LABEL_246:

        id v47 = v290;
        goto LABEL_247;
      }
      v309 = [MEMORY[0x1E4F1CA48] array];
      if (v299)
      {
        uint8x8_t v53 = [v295 firstObject];
        [v53 tokens];
        if (v315)
        {
          id v54 = (id)objc_claimAutoreleasedReturnValue();
          id v55 = +[CRTextDecodingUtils wordTokensFromCharacterTokens:v54];
        }
        else
        {
          id v54 = (id)objc_claimAutoreleasedReturnValue();
          id v55 = v54;
        }

        long long v362 = 0u;
        long long v363 = 0u;
        long long v360 = 0u;
        long long v361 = 0u;
        id v57 = v55;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v360 objects:v369 count:16];
        if (v58)
        {
          uint64_t v59 = *(void *)v361;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v361 != v59) {
                objc_enumerationMutation(v57);
              }
              uint64_t v61 = *(void **)(*((void *)&v360 + 1) + 8 * i);
              long long v62 = [v61 fullString];
              if ([v62 hasPrefix:@" "])
              {
                unint64_t v63 = [v61 fullString];
                BOOL v64 = (unint64_t)[v63 length] > 1;

                if (v64)
                {
                  v325 = 0;
                  unint64_t v65 = v57;
                  goto LABEL_72;
                }
              }
              else
              {
              }
            }
            uint64_t v58 = [v57 countByEnumeratingWithState:&v360 objects:v369 count:16];
          }
          while (v58);
        }

        if (v315)
        {
          unint64_t v65 = v57;
        }
        else
        {
          unint64_t v65 = +[CRTextDecodingUtils graphemeClusterTokensFromTokens:v57];
        }
        id v57 = +[CRTextDecodingUtils filteredTokensFromTokens:v65 falsePositiveFiltering:[(CRCTCCVNLPTextDecoder *)v341 shouldUseFalsePositiveFiltering] keepWhitespaceToken:[(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]];
        if (selfa)
        {
          id v67 = objc_getProperty(selfa, v66, 80, 1);
          uint64_t v69 = v67;
          if (v67) {
            id v67 = objc_getProperty(v67, v68, 360, 1);
          }
        }
        else
        {
          uint64_t v69 = 0;
          id v67 = 0;
        }
        id v70 = v67;
        v325 = +[CRTextDecodingUtils characterRangesForTokens:v57 fromActivation:v70 usingCharacterTokens:[(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]];

        if (v315)
        {
          uint64_t v71 = [v325 firstObject];
          BOOL v315 = [v71 count] == 0;
        }
        else
        {
          BOOL v315 = 0;
        }
LABEL_72:

        self = v341;
      }
      else
      {
        v325 = 0;
      }
      uint64_t v72 = [(CRCTCCVNLPTextDecoder *)self configuration];
      if ([v72 filterWithLM])
      {
        uint64_t v73 = [v295 objectAtIndexedSubscript:0];
        BOOL v74 = [(CRCTCCVNLPTextDecoder *)self _wordLMShouldFilterCandidate:v73 inLocale:v312 lmConfig:v296];

        if (!v74) {
          goto LABEL_77;
        }
        uint64_t v72 = v295;
        v295 = (void *)MEMORY[0x1E4F1CBF0];
      }

LABEL_77:
      int v303 = [v312 isEqualToString:@"uk-UA"];
      v311 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      if (v19) {
        id v76 = 0;
      }
      else {
        id v76 = objc_getProperty(v298, v75, 352, 1);
      }
      id v77 = v76;
      unint64_t v78 = [v77 candidates];
      v314 = [v78 firstObject];

      long long v358 = 0u;
      long long v359 = 0u;
      long long v356 = 0u;
      long long v357 = 0u;
      obuint64_t j = v295;
      uint64_t v79 = [obj countByEnumeratingWithState:&v356 objects:v368 count:16];
      unint64_t v80 = v341;
      uint64_t v81 = off_1E6CDA000;
      if (v79)
      {
        uint64_t v322 = v79;
        unint64_t v307 = 0;
        char v310 = 0;
        uint64_t v318 = *(void *)v357;
        do
        {
          uint64_t v333 = 0;
          do
          {
            if (*(void *)v357 != v318) {
              objc_enumerationMutation(obj);
            }
            uint64_t v82 = *(void **)(*((void *)&v356 + 1) + 8 * v333);
            v339 = [v82 tokens];
            [v82 score];
            long double v84 = v83;
            id newValue = [v82 fullString];
            v326 = v82;
            [v82 activationScore];
            double v86 = v85;
            if (![(CRCTCCVNLPTextDecoder *)v80 shouldUseLM]
              && ![(CRCTCCVNLPTextDecoder *)v80 shouldUseModernizedDecoder])
            {
              uint64_t v87 = [newValue length];
              if (v87) {
                long double v84 = pow(v84, 1.0 / (double)v87);
              }
              uint64_t v88 = [newValue length];
              if (v88) {
                double v86 = pow(v86, 1.0 / (double)v88);
              }
            }
            if ([(CRCTCCVNLPTextDecoder *)v80 shouldUseLM])
            {
              uint64_t v89 = [v339 count];
              uint64_t v90 = [v314 tokens];
              LODWORD(v89) = v89 == [v90 count];

              if (v89)
              {
                uint64_t v91 = (void *)[v339 mutableCopy];
                id v355 = newValue;
                uint64_t v92 = [v314 fullString];
                unint64_t v93 = [v314 tokens];
                +[CRCTCCVNLPTextDecoder _adjustBeamSearchResults:&v355 tokens:v91 greedyCandidateString:v92 greedyCandidateTokens:v93 decodingLocale:v312];
                id v94 = v355;

                id v95 = v91;
                id newValue = v94;
                v339 = v95;
              }
              unint64_t v80 = v341;
              uint64_t v81 = off_1E6CDA000;
            }
            long long v96 = v81[62];
            long long v97 = [NSNumber numberWithDouble:(double)v84];
            uint64_t v98 = [(CRCTCCVNLPTextDecoder *)v80 configuration];
            [v98 precisionThreshold];
            LODWORD(v96) = [(__objc2_class *)v96 validateProbability:v97 precisionThreshold:[(CRCTCCVNLPTextDecoder *)v80 shouldUseLM] withLM:v99];

            if (v96)
            {
              [newValue stringByTrimmingCharactersInSet:v311];
              v316 = uint64_t v100 = v341;
              if ([v316 length])
              {
                if ([(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken])
                {
                  uint64_t v101 = +[CRTextDecodingUtils graphemeClusterTokensFromTokens:v339];

                  v339 = (void *)v101;
                  uint64_t v100 = v341;
                }
                uint64_t v102 = +[CRTextDecodingUtils filteredTokensFromTokens:v339 falsePositiveFiltering:[(CRCTCCVNLPTextDecoder *)v100 shouldUseFalsePositiveFiltering] keepWhitespaceToken:[(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]];
                v330 = +[CRTextDecodingUtils tokenSequenceStringForTokens:v102 usingCharacterTokens:[(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]];
                std::vector<unsigned int> v103 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v102, "count"));
                long long v353 = 0u;
                long long v354 = 0u;
                long long v351 = 0u;
                long long v352 = 0u;
                id v104 = v102;
                uint64_t v105 = [v104 countByEnumeratingWithState:&v351 objects:v367 count:16];
                if (v105)
                {
                  uint64_t v106 = 0;
                  uint64_t v107 = *(void *)v352;
                  do
                  {
                    for (uint64_t j = 0; j != v105; ++j)
                    {
                      if (*(void *)v352 != v107) {
                        objc_enumerationMutation(v104);
                      }
                      long long v109 = *(void **)(*((void *)&v351 + 1) + 8 * j);
                      long long v110 = [v109 string];
                      uint64_t v111 = [v110 length];

                      long long v112 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v106, v111);
                      [v103 addObject:v112];

                      long long v113 = [v109 fullString];
                      uint64_t v114 = [v113 length];

                      v106 += v114;
                    }
                    uint64_t v105 = [v104 countByEnumeratingWithState:&v351 objects:v367 count:16];
                  }
                  while (v105);
                }

                long long v115 = off_1E6CDA000;
                if ([(CRCTCCVNLPTextDecoder *)v341 shouldReverseActivationMatrix])
                {
                  uint64_t v116 = +[CRTextDecodingUtils reversedTokens:v104 numTimeSteps:v301];

                  id v104 = (id)v116;
                }
                if (![(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]|| v315)
                {
                  unint64_t v117 = +[CRTextDecodingUtils tokenDelimiterRangesForTokens:v104 usingCharacterTokens:[(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]];
                }
                else
                {
                  uint64_t v118 = +[CRTextDecodingUtils wordTokensFromCharacterTokens:v104];
                  uint64_t v119 = +[CRTextDecodingUtils filteredTokensFromTokens:v118 falsePositiveFiltering:[(CRCTCCVNLPTextDecoder *)v341 shouldUseFalsePositiveFiltering] keepWhitespaceToken:0];
                  unint64_t v120 = [obj firstObject];
                  BOOL v121 = v326 == v120;

                  if (v121)
                  {
                    if (selfa)
                    {
                      id v123 = objc_getProperty(selfa, v122, 80, 1);
                      uint64_t v125 = v123;
                      if (v123) {
                        id v123 = objc_getProperty(v123, v124, 360, 1);
                      }
                    }
                    else
                    {
                      uint64_t v125 = 0;
                      id v123 = 0;
                    }
                    id v126 = v123;
                    uint64_t v127 = +[CRTextDecodingUtils characterRangesForTokens:v119 fromActivation:v126 usingCharacterTokens:0];

                    v325 = (void *)v127;
                  }
                  unint64_t v117 = +[CRTextDecodingUtils tokenDelimiterRangesForTokens:v119 usingCharacterTokens:0];
                }
                if ([v117 count])
                {
                  if ([(CRCTCCVNLPTextDecoder *)v341 shouldUseFalsePositiveFiltering])
                  {
                    v128 = [MEMORY[0x1E4F28B88] _crUnknownScriptCharacterSet];
                    BOOL v327 = [v330 rangeOfCharacterFromSet:v128] != 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else
                  {
                    BOOL v327 = 0;
                  }
                  if (+[CRImageReader languageIsChinese:v312])
                  {
                    v130 = [MEMORY[0x1E4F28B88] _crJapaneseKoreanAsUnknownScriptCharacterSet];
                    BOOL v131 = [v330 rangeOfCharacterFromSet:v130] == 0x7FFFFFFFFFFFFFFFLL;

                    if (!v131)
                    {
                      v132 = [MEMORY[0x1E4F28B88] _crJapaneseKoreanAsUnknownScriptCharacterSet];
                      v133 = [v330 componentsSeparatedByCharactersInSet:v132];
                      uint64_t v134 = [v133 count];

                      double v86 = v86 * fmax((double)(unint64_t)(v134 - 1) * -0.1 + 1.0, 0.1);
                    }
                  }
                  if ([(CRCTCCVNLPTextDecoder *)v341 isLocaleRTL])
                  {
                    v370[0] = 1;
                    v135 = [(CRCTCCVNLPTextDecoder *)v341 bidiTransform];
                    id v350 = 0;
                    uint64_t v136 = [v135 transformVisualToLogical:v330 visualDirectionality:2 logicalBaseDirectionality:v307 baseDirectionalityPredictionMode:1 outTokenizedLogicalOrderIndexes:0 outReorderingPermutation:&v350 outMirroredVisualString:0 outLogicalBaseDirection:v370];
                    id v137 = v350;

                    if (!v307) {
                      unint64_t v307 = +[CRBiDiTransform layoutDirectionForVisualString:v136 visualDirectionality:2 logicalBaseDirection:v370[0]];
                    }
                    v138 = +[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:v137 toRanges:v103];
                    v139 = +[CRTextDecodingUtils invertedPermutation:v138];
                    v140 = +[CRTextDecodingUtils reversedPermutation:numTimeSteps:](CRTextDecodingUtils, "reversedPermutation:numTimeSteps:", v139, [v103 count]);

                    v330 = (void *)v136;
                    long long v115 = off_1E6CDA000;
                  }
                  else
                  {
                    v140 = 0;
                  }
                  if (v303)
                  {
                    uint64_t v141 = [v330 _crReplacedUkrainianApostrophes];

                    v330 = (void *)v141;
                  }
                  if ([(CRCTCCVNLPTextDecoder *)v341 _shouldUseCharacterDecodingToken]&& !v315)
                  {
                    uint64_t v142 = [v330 combinedTokenSequenceString];

                    v330 = (void *)v142;
                  }
                  if (+[CRImageReader languageSupportsFullWidthPunctuation:v312])
                  {
                    uint64_t v143 = [(__objc2_class *)v115[62] halfWidthToFullWidthNormalizationForTextString:v330];

                    v330 = (void *)v143;
                  }
                  if ([(CRCTCCVNLPTextDecoder *)v341 isLocaleRTL])
                  {
                    v144 = [v330 _crStringByRemovingInvalidArabicDiacritics];

                    uint64_t v145 = +[CRBiDiTransform rearrangeNumericRunsInLogicalString:v144 layoutDirection:v307];

                    v330 = (void *)v145;
                  }
                  v146 = [CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo alloc];
                  id v129 = v330;
                  id v147 = v117;
                  id v148 = v140;
                  if (v146)
                  {
                    *(void *)v370 = v146;
                    *(void *)&v370[8] = CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo;
                    v149 = (CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo *)objc_msgSendSuper2((objc_super *)v370, sel_init);
                    v146 = v149;
                    if (v149)
                    {
                      v149->_prob = v84;
                      v149->_activationProb = v86;
                      objc_setProperty_atomic(v149, v150, v129, 24);
                      objc_setProperty_atomic(v146, v151, v147, 32);
                      objc_setProperty_atomic(v146, v152, v148, 40);
                    }
                  }

                  [v309 addObject:v146];
                  v310 |= v327;
                }
                else
                {
                  id v129 = v330;
                }
              }
            }

            ++v333;
            unint64_t v80 = v341;
            uint64_t v81 = off_1E6CDA000;
          }
          while (v333 != v322);
          uint64_t v153 = [obj countByEnumeratingWithState:&v356 objects:v368 count:16];
          uint64_t v322 = v153;
        }
        while (v153);
      }
      else
      {
        unint64_t v307 = 0;
        char v310 = 0;
      }

      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_40);
      v154 = v341;
      if ([(CRCTCCVNLPTextDecoder *)v341 isLocaleRTL])
      {
        if (!v307 && [v309 count])
        {
          v156 = CROSLogForCategory(0);
          if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v370 = 0;
            _os_log_impl(&dword_1DD733000, v156, OS_LOG_TYPE_FAULT, "Unexpectedly unknown layout direction!", v370, 2u);
          }

          v154 = v341;
        }
        v157 = selfa;
        if (!selfa) {
          goto LABEL_161;
        }
        *((void *)selfa + 9) = v307;
      }
      else
      {
        v157 = selfa;
        if (!selfa) {
          goto LABEL_161;
        }
      }
      id v158 = objc_getProperty(v157, v155, 64, 1);
      if (v158)
      {
        v160 = v158;
        id v161 = objc_getProperty(selfa, v159, 64, 1);
        [v161 activationProbability];
        double v163 = v162;
        v164 = [v309 firstObject];
        double v165 = v164 ? v164[2] : 0.0;
        BOOL v166 = v163 < v165;

        v154 = v341;
        if (!v166)
        {
          uint64_t v180 = objc_opt_new();

          newValuea = 0;
          v309 = (void *)v180;
          v154 = v341;
          goto LABEL_171;
        }
      }
LABEL_161:
      if ([v309 count])
      {
        v167 = [CRMutableRecognizedTextRegion alloc];
        v168 = [selfa lineRegion];
        newValuea = [(CRRecognizedTextRegion *)v167 initWithType:2 detectedLineRegion:v168];

        v169 = [v309 firstObject];
        v171 = v169;
        if (v169) {
          id v172 = objc_getProperty(v169, v170, 24, 1);
        }
        else {
          id v172 = 0;
        }
        id v173 = v172;
        [(CRRecognizedTextRegion *)newValuea setText:v173];

        uint64_t v174 = [v309 firstObject];
        v175 = (void *)v174;
        if (v174) {
          double v176 = *(double *)(v174 + 16);
        }
        else {
          double v176 = 0.0;
        }
        [(CRRecognizedTextRegion *)newValuea setActivationProbability:v176];

        uint64_t v177 = [v309 firstObject];
        v178 = (void *)v177;
        if (v177) {
          double v179 = *(double *)(v177 + 8);
        }
        else {
          double v179 = 0.0;
        }
        [(CRRecognizedTextRegion *)newValuea setConfidence:v179];

        [(CRRecognizedTextRegion *)newValuea setLocale:v312];
        v154 = v341;
      }
      else
      {
        newValuea = 0;
      }
LABEL_171:
      v302 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v309, "count"));
      v181 = [(CRCTCCVNLPTextDecoder *)v154 model];
      [v181 wordBoxesOffsets];
      if (v315) {
        double v184 = v183;
      }
      else {
        double v184 = v182;
      }

      unint64_t v185 = 0;
      double v300 = (double)(uint64_t)v184;
      while (v185 < [v309 count])
      {
        v186 = [v309 objectAtIndexedSubscript:v185];
        v188 = v186;
        if (v186) {
          id v189 = objc_getProperty(v186, v187, 24, 1);
        }
        else {
          id v189 = 0;
        }
        id v340 = v189;
        v190 = [(CRRecognizedTextRegion *)newValuea boundingQuad];
        [v190 baselineAngle];
        double v334 = v191;

        if (v188) {
          id v193 = objc_getProperty(v188, v192, 32, 1);
        }
        else {
          id v193 = 0;
        }
        id v194 = v193;
        id v348 = 0;
        id v349 = 0;
        if (selfa) {
          int v195 = *((_DWORD *)selfa + 2);
        }
        else {
          int v195 = 0;
        }
        int v331 = v195;
        double v328 = -[CRFeatureSequenceRecognitionInfo featureImageSize]((uint64_t)selfa);
        double v323 = v196;
        double v319 = -[CRFeatureSequenceRecognitionInfo bounds]((uint64_t)selfa);
        uint64_t v198 = v197;
        uint64_t v200 = v199;
        uint64_t v202 = v201;
        double v203 = -[CRFeatureSequenceRecognitionInfo rotatedROI]((uint64_t)selfa);
        uint64_t v205 = v204;
        uint64_t v207 = v206;
        uint64_t v209 = v208;
        v210 = [(CRCTCCVNLPTextDecoder *)v341 model];
        v211 = [(CRCTCCVNLPTextDecoder *)v341 configuration];
        v212 = [(CRCTCCVNLPTextDecoder *)v341 model];
        [v212 wordBoxesOffsets];
        uint64_t v214 = v213;
        v215 = [(CRCTCCVNLPTextDecoder *)v341 model];
        [v215 wordBoxesOffsets];
        float v216 = v334;
        float v317 = -v216;
        *(float *)&uint64_t v289 = -v216;
        LODWORD(v217) = v331;
        +[CRTextDecodingUtils getWordBoundariesForWhiteSpaceRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:](CRTextDecodingUtils, "getWordBoundariesForWhiteSpaceRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:", v194, &v349, &v348, v210, v211, a8.width, a8.height, v217, v328, v323, *(void *)&v319, v198, v200, v202, *(void *)&v203, v205,
          v207,
          v209,
          v289,
          v214,
          v218,
          *(void *)&v300);
        id v320 = v349;
        id v324 = v348;

        if (v188) {
          id v220 = objc_getProperty(v188, v219, 40, 1);
        }
        else {
          id v220 = 0;
        }
        id v221 = v220;
        v222 = [(CRRecognizedTextRegion *)newValuea createSubregionsForString:v340 topWhiteSpacePoints:v320 bottomWhiteSpacePoints:v324 hasBoundarySpacePoints:1 hasCharacterAndWordBoundaries:v315 tokenPermutation:v221];

        if (v188) {
          id v224 = objc_getProperty(v188, v223, 40, 1);
        }
        else {
          id v224 = 0;
        }
        id v225 = v224;
        BOOL v226 = v225 == 0;

        if (!v226)
        {
          if (v188) {
            id v228 = objc_getProperty(v188, v227, 40, 1);
          }
          else {
            id v228 = 0;
          }
          id v229 = v228;
          v335 = +[CRTextDecodingUtils invertedPermutation:v229];

          v230 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v222, "count"));
          long long v346 = 0u;
          long long v347 = 0u;
          long long v344 = 0u;
          long long v345 = 0u;
          id v231 = v335;
          uint64_t v232 = [v231 countByEnumeratingWithState:&v344 objects:v366 count:16];
          if (v232)
          {
            uint64_t v233 = *(void *)v345;
            while (2)
            {
              for (uint64_t k = 0; k != v232; ++k)
              {
                if (*(void *)v345 != v233) {
                  objc_enumerationMutation(v231);
                }
                v235 = *(void **)(*((void *)&v344 + 1) + 8 * k);
                unint64_t v236 = [v235 unsignedIntegerValue];
                if (v236 >= [v222 count])
                {
                  v238 = CROSLogForCategory(3);
                  if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v239 = [v235 unsignedIntegerValue];
                    uint64_t v240 = [v222 count];
                    *(_DWORD *)v370 = 134218498;
                    *(void *)&v370[4] = v239;
                    *(_WORD *)&v370[12] = 2048;
                    *(void *)&v370[14] = v240;
                    *(_WORD *)&v370[22] = 2112;
                    id v371 = v231;
                    _os_log_impl(&dword_1DD733000, v238, OS_LOG_TYPE_ERROR, "Invalid permutation index when reordering subregions. Index %ld must be less than number of subregions %ld. Permutation: %@", v370, 0x20u);
                  }

                  goto LABEL_201;
                }
                v237 = objc_msgSend(v222, "objectAtIndexedSubscript:", objc_msgSend(v235, "unsignedIntegerValue"));
                [v230 addObject:v237];
              }
              uint64_t v232 = [v231 countByEnumeratingWithState:&v344 objects:v366 count:16];
              if (v232) {
                continue;
              }
              break;
            }
          }
LABEL_201:

          uint64_t v241 = [v230 copy];
          v222 = (void *)v241;
        }
        if (!v299 || v315)
        {
          id v242 = v222;
        }
        else
        {
          v243 = [MEMORY[0x1E4F1CA48] array];
          v244 = [(CRCTCCVNLPTextDecoder *)v341 model];
          [v244 characterBoxesOffsets];
          uint64_t v308 = v245;

          v246 = [(CRCTCCVNLPTextDecoder *)v341 model];
          [v246 characterBoxesOffsets];
          SEL v305 = v247;

          v248 = [(CRCTCCVNLPTextDecoder *)v341 model];
          [v248 characterBoxesOffsets];
          uint64_t v304 = v249;

          for (unint64_t m = 0; m < [v222 count]; ++m)
          {
            if (v185 || ![v325 count] || m >= objc_msgSend(v325, "count"))
            {
              v251 = [v222 objectAtIndexedSubscript:m];
              objc_msgSend(v251, "createCharacterSubFeaturesTopWhiteSpacePoints:bottomWhiteSpacePoints:falsePositiveFiltering:", 0, 0, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](v341, "shouldUseFalsePositiveFiltering"));
              id v252 = (id)objc_claimAutoreleasedReturnValue();

              [v243 addObjectsFromArray:v252];
            }
            else
            {
              v253 = [v325 objectAtIndexedSubscript:m];
              id v342 = 0;
              id v343 = 0;
              if (selfa) {
                int v254 = *((_DWORD *)selfa + 2);
              }
              else {
                int v254 = 0;
              }
              int v336 = v254;
              double v255 = -[CRFeatureSequenceRecognitionInfo featureImageSize]((uint64_t)selfa);
              double v329 = v256;
              double v332 = v255;
              double v257 = -[CRFeatureSequenceRecognitionInfo bounds]((uint64_t)selfa);
              uint64_t v259 = v258;
              uint64_t v261 = v260;
              uint64_t v263 = v262;
              double v264 = -[CRFeatureSequenceRecognitionInfo rotatedROI]((uint64_t)selfa);
              uint64_t v266 = v265;
              uint64_t v268 = v267;
              uint64_t v270 = v269;
              v271 = [(CRCTCCVNLPTextDecoder *)v341 model];
              v272 = [(CRCTCCVNLPTextDecoder *)v341 configuration];
              *(float *)&uint64_t v289 = v317;
              LODWORD(v273) = v336;
              +[CRTextDecodingUtils getCharacterBoundariesForActivationRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:](CRTextDecodingUtils, "getCharacterBoundariesForActivationRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:", v253, &v343, &v342, v271, v272, a8.width, a8.height, v273, v332, v329, *(void *)&v257, v259, v261, v263, *(void *)&v264, v266,
                v268,
                v270,
                v289,
                v308,
                v305,
                v304);
              id v252 = v343;
              id v274 = v342;

              v275 = [v222 objectAtIndexedSubscript:m];
              v276 = objc_msgSend(v275, "createCharacterSubFeaturesTopWhiteSpacePoints:bottomWhiteSpacePoints:falsePositiveFiltering:", v252, v274, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](v341, "shouldUseFalsePositiveFiltering"));

              [v243 addObjectsFromArray:v276];
            }
          }
          id v242 = v243;
        }
        if (v315)
        {
          uint64_t v277 = [v340 combinedTokenSequenceString];

          id v340 = (id)v277;
        }
        v278 = (void *)[(CRMutableRecognizedTextRegion *)newValuea mutableCopy];
        [v278 setText:v340];
        [v278 setSubregions:v242];
        if (v188) {
          double v279 = v188[1];
        }
        else {
          double v279 = 0.0;
        }
        [v278 setConfidence:v279];
        if (v188) {
          double v280 = v188[2];
        }
        else {
          double v280 = 0.0;
        }
        [v278 setActivationProbability:v280];
        objc_msgSend(v278, "setWhitespaceInjected:", v315 | objc_msgSend(v278, "whitespaceInjected"));
        if (selfa && *((void *)selfa + 9)) {
          objc_msgSend(v278, "setLayoutDirection:");
        }
        if (v310)
        {
          if (!v299 || (uint64_t v281 = [v325 count], v282 = @" ", !v281)) {
            v282 = &stru_1F38EED68;
          }
          [v278 removeUnknownScriptMarkersFromTranscripts:v282];
        }
        if (!v185)
        {
          v283 = [v278 subregions];
          [(CRRecognizedTextRegion *)newValuea setSubregions:v283];

          v284 = [v278 text];
          [(CRRecognizedTextRegion *)newValuea setText:v284];

          -[CRRecognizedTextRegion setWhitespaceInjected:](newValuea, "setWhitespaceInjected:", [v278 whitespaceInjected]);
          if (selfa)
          {
            if (*((void *)selfa + 9)) {
              [(CRRecognizedTextRegion *)newValuea setLayoutDirection:"setLayoutDirection:"];
            }
          }
        }
        [v302 addObject:v278];

        ++v185;
      }
      [(CRRecognizedTextRegion *)newValuea setCandidates:v302];
      if (selfa) {
        objc_setProperty_atomic(selfa, v285, newValuea, 64);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_40);

      unint64_t v56 = obj;
      goto LABEL_246;
    }
  }
  else
  {
    if (v19) {
      id v46 = 0;
    }
    else {
      id v46 = objc_getProperty(v298, v33, 352, 1);
    }
    id v47 = v46;
    id v297 = 0;
    if (v47) {
      goto LABEL_45;
    }
  }
LABEL_247:
  id v286 = v47;

  v287 = v297;
  if (v286 && a11 && v297)
  {
    *a11 = v297;
    v287 = v297;
  }

  return v286 != 0;
}

void __156__CRCTCCVNLPTextDecoder__decodeSingleFeatureWithInfo_decodingLocale_greedyDecoder_greedyConfig_beamSearchConfig_imageSize_useCharacterBoxes_lmConfig_error___block_invoke()
{
  _MergedGlobals_40 = 0;
}

- (void)releaseUnusedResources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(CRCTCCVNLPTextDecoder *)self subscribedLocales];
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = self->_subscribedLocales;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (self->_shouldUseLM)
        {
          float v9 = +[CRLanguageResourcesManager sharedManager];
          [v9 subscriber:self willDeactivateForLocale:v8];
        }
        if ([(CRNeuralRecognizerConfiguration *)self->_configuration filterWithLM])
        {
          unsigned int v10 = +[CRLanguageResourcesManager postProcessManager];
          [v10 subscriber:self willDeactivateForLocale:v8];
        }
      }
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSMutableSet)subscribedLocales
{
  return self->_subscribedLocales;
}

- (CRTextSequenceRecognizerModel)model
{
  return (CRTextSequenceRecognizerModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setModel:(id)a3
{
}

- (BOOL)shouldUseLM
{
  return self->_shouldUseLM;
}

- (void)setShouldUseLM:(BOOL)a3
{
  self->_shouldUseLM = a3;
}

- (BOOL)shouldUseFalsePositiveFiltering
{
  return self->_shouldUseFalsePositiveFiltering;
}

- (void)setShouldUseFalsePositiveFiltering:(BOOL)a3
{
  self->_shouldUseFalsePositiveFiltering = a3;
}

- (BOOL)shouldReverseActivationMatrix
{
  return self->_shouldReverseActivationMatrix;
}

- (BOOL)isLocaleRTL
{
  return self->_isLocaleRTL;
}

- (CRBiDiTransform)bidiTransform
{
  return self->_bidiTransform;
}

- (NSOrderedSet)characterObservations
{
  return self->_characterObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterObservations, 0);
  objc_storeStrong((id *)&self->_bidiTransform, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_subscribedLocales, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  std::vector<unsigned int>::pointer begin = self->_spaceLabels.__begin_;
  if (begin)
  {
    self->_spaceLabels.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end