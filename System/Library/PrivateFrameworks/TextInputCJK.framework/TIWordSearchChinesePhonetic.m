@interface TIWordSearchChinesePhonetic
+ (id)pinyinCharacterSetWithTones;
- (BOOL)fuzzyPinyinEnabled;
- (BOOL)shareVocabulary;
- (BOOL)tenKeyPinyinEnabled;
- (NSArray)fuzzyPinyinPairs;
- (id)candidatesCacheKeyForOperation:(id)a3;
- (id)uncachedCandidatesForOperation:(id)a3;
- (int)mecabraInputMethodType;
- (int)shuangpinType;
- (unint64_t)mecabraAnalysisOptionsWithAutocorrectionEnabled:(BOOL)a3 firstSyllableLocked:(BOOL)a4 reanalysisMode:(BOOL)a5 hardwareKeyboardMode:(BOOL)a6 predictionEnabled:(BOOL)a7;
- (unsigned)nameReadingPairGenerationMode;
- (void)clearCacheForInputString:(id)a3 keyboardInput:(id)a4 unambiguousSyllableCount:(unint64_t)a5 selectedDisambiguationCandidateIndex:(unint64_t)a6;
- (void)dealloc;
- (void)setCustomDialectLanguageModel:(id)a3;
- (void)setFuzzyPinyinEnabled:(BOOL)a3;
- (void)setFuzzyPinyinPairs:(id)a3;
- (void)setShuangpinType:(int)a3;
- (void)setTenKeyPinyinEnabled:(BOOL)a3;
- (void)updateFuzzyPinyinSettings;
- (void)updateMecabraState;
- (void)updateShuangpinTypeWithReanalysisMode:(BOOL)a3;
@end

@implementation TIWordSearchChinesePhonetic

- (void).cxx_destruct
{
}

- (void)setFuzzyPinyinPairs:(id)a3
{
}

- (NSArray)fuzzyPinyinPairs
{
  return self->_fuzzyPinyinPairs;
}

- (void)setShuangpinType:(int)a3
{
  self->_shuangpinType = a3;
}

- (int)shuangpinType
{
  return self->_shuangpinType;
}

- (void)setTenKeyPinyinEnabled:(BOOL)a3
{
  self->_tenKeyPinyinEnabled = a3;
}

- (BOOL)tenKeyPinyinEnabled
{
  return self->_tenKeyPinyinEnabled;
}

- (void)setFuzzyPinyinEnabled:(BOOL)a3
{
  self->_fuzzyPinyinEnabled = a3;
}

- (BOOL)fuzzyPinyinEnabled
{
  return self->_fuzzyPinyinEnabled;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7EB68]);
  id v6 = v4;
  v7 = [v6 inputString];
  uint64_t v8 = [v6 segmentBreakIndex];
  v9 = [v6 target];
  v130 = [v6 geometryModelData];
  v138 = v6;
  uint64_t v128 = [v6 unambiguousSyllableCount];
  context = (void *)MEMORY[0x2611ED640]();
  v10 = [(id)objc_opt_class() pinyinCharacterSetWithTones];
  uint64_t v11 = [v7 rangeOfCharacterFromSet:v10];

  obuint64_t j = (id)arc4random();
  uint64_t v134 = v11;
  if ([v7 length]
    || ([v138 keyboardInput], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [v7 substringFromIndex:v8];
      uint64_t v14 = [v7 substringToIndex:v8];

      v7 = (void *)v14;
    }
    v131 = (void *)v13;
    v15 = self;
    BOOL v16 = [(TIWordSearch *)self addFacemarkCandidatesToResultSet:v5 forInput:v7];
    v17 = v9;
    if (v16)
    {
      v18 = 0;
      v19 = 0;
LABEL_13:

      id v21 = v7;
      char v22 = 0;
      int v23 = 1;
      v133 = v21;
LABEL_14:
      v9 = v17;
      self = v15;
      goto LABEL_15;
    }
    v19 = +[TIKeyboardInputManagerChinese GB18030CandidateFromString:v7];
    if ([v19 length])
    {
      v20 = 0;
      v18 = v19;
LABEL_12:
      [v5 addSyntheticMecabraCandidateWithSurface:v18 input:v7];
      v18 = v20;
      goto LABEL_13;
    }
    v18 = +[TIKeyboardInputManagerChinese unicodeCandidateFromString:v7];
    if ([v18 length])
    {
      v20 = v18;
      goto LABEL_12;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_13;
    }
    uint64_t v43 = -[TIWordSearchChinesePhonetic mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:](v15, "mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:", 0, v128 != 0, [v138 reanalysisMode], objc_msgSend(v138, "hardwareKeyboardMode"), objc_msgSend(v138, "predictionEnabled"));
    v44 = [v138 logger];
    [v44 markTime:2];

    v45 = [v138 keyboardInput];

    if (v45)
    {
      kdebug_trace();
      kac_get_log();
      v46 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v47 = os_signpost_id_make_with_pointer(v46, obj);
      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v48 = v47;
        if (os_signpost_enabled(v46))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_25EC0A000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v48, "kbdCPMecabraCandidates", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v49 = [v138 keyboardInput];
      v50 = [v49 asSearchString];

      v51 = [(TIWordSearch *)v15 mecabraEnvironment];
      v52 = [v138 keyboardInput];
      char v53 = [v51 analyzeInput:v52 options:v43];

      id v54 = v50;
    }
    else
    {
      v119 = [(TIWordSearch *)v15 mecabraEnvironment];
      [v119 setGeometryModel:v17 modelData:v130];

      v120 = [(TIWordSearch *)v15 mecabraEnvironment];
      char v53 = [v120 analyzeString:v7 options:v43];

      id v54 = v7;
    }
    id v21 = v54;
    if ((v53 & 1) == 0)
    {
      BOOL v16 = 0;
      char v22 = 0;
      int v23 = 1;
      v133 = v54;
      goto LABEL_14;
    }
    v36 = v131;
  }
  else
  {
    id v35 = v7;
    id v21 = v35;
    v36 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v131 = 0;
      BOOL v16 = 0;
      char v22 = 0;
      int v23 = 1;
      v133 = v35;
      goto LABEL_15;
    }
    v15 = self;
    v17 = v9;
  }
  v131 = v36;
  v37 = v5;
  char v38 = 0;
  if ([v138 isCancelled])
  {
    v39 = v21;
    v133 = v21;
  }
  else
  {
    char v55 = 0;
    unint64_t v56 = 0x263F7E000uLL;
    v39 = v21;
    v133 = v21;
    while (1)
    {
      [(TIWordSearch *)v15 mecabra];
      uint64_t NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate) {
        break;
      }
      uint64_t v58 = NextCandidate;
      if (MecabraCandidateGetType() == 6)
      {
        [v37 addMecabraProactiveCandidate:v58 triggerSourceType:0];
        if ([v138 isCancelled]) {
          break;
        }
      }
      else
      {
        v59 = (void *)[objc_alloc(*(Class *)(v56 + 1696)) initWithMecabraCandidate:v58];
        [v37 addMecabraCandidate:v59 mecabraCandidateRef:v58];
        if (v55)
        {
          char v55 = 1;
        }
        else if ([(TIWordSearchChinesePhonetic *)v15 tenKeyPinyinEnabled])
        {
          if ([v39 length])
          {
            v60 = [MEMORY[0x263F7E6A0] convertedInputFromMecabraCandidate:v58];

            unint64_t v61 = [v60 length];
            unint64_t v62 = [v39 length];
            if (v62 <= v61)
            {
              char v55 = 1;
              v133 = v60;
            }
            else
            {
              v63 = +[TIKeyboardInputManagerChinesePhonetic stringFallBackForTenKeyInput:range:](TIKeyboardInputManagerChinesePhonetic, "stringFallBackForTenKeyInput:range:", v39, v61, v62 - v61);
              v64 = v63;
              if (v61)
              {
                id v65 = [v60 stringByAppendingString:v63];
              }
              else
              {
                id v65 = v63;
              }
              v133 = v65;

              char v55 = 1;
            }
          }
          else
          {
            char v55 = 0;
          }
          unint64_t v56 = 0x263F7E000;
        }
        else
        {
          char v55 = 0;
        }
        if ((v38 & 1) == 0)
        {
          v66 = [v59 candidate];
          unint64_t v67 = v56;
          uint64_t v68 = [v66 compare:v133];

          BOOL v69 = v68 == 0;
          unint64_t v56 = v67;
          if (v69) {
            char v38 = 1;
          }
        }

        if ([v138 isCancelled]) {
          break;
        }
      }
    }
  }
  id v5 = v37;
  v40 = [v37 proactiveTriggers];
  uint64_t v41 = [v40 count];

  v9 = v17;
  self = v15;
  id v21 = v39;
  if (v41 && TICanLogMessageAtLevel())
  {
    v42 = TIOSLogFacility();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v121 = NSString;
      v122 = [v5 proactiveTriggers];
      v123 = [v121 stringWithFormat:@"%s ProactiveQuickType:TI: Mecabra found conversion proactive triggers: %@", "-[TIWordSearchChinesePhonetic uncachedCandidatesForOperation:]", v122];
      *(_DWORD *)buf = 138412290;
      v155 = v123;
      _os_log_debug_impl(&dword_25EC0A000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  int v23 = 0;
  BOOL v16 = 0;
  char v22 = v38 & 1;
LABEL_15:
  v24 = [v138 keyboardInput];

  if (v24)
  {
    kdebug_trace();
    kac_get_log();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, obj);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v27 = v26;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25EC0A000, v25, OS_SIGNPOST_INTERVAL_END, v27, "kbdCPMecabraCandidates", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  v28 = v138;
  v29 = [v138 logger];
  [v29 markTime:3];

  v132 = [v5 candidates];
  unint64_t v30 = [v132 count];
  if ([(TIWordSearchChinesePhonetic *)self tenKeyPinyinEnabled]
    && !v30
    && [v21 length])
  {
    uint64_t v31 = +[TIKeyboardInputManagerChinesePhonetic stringFallBackForTenKeyInput:range:](TIKeyboardInputManagerChinesePhonetic, "stringFallBackForTenKeyInput:range:", v21, 0, [v21 length]);

    v133 = (void *)v31;
  }
  if (([v138 isCancelled] & 1) == 0)
  {
    if ((v22 & 1) == 0)
    {
      if ([(TIWordSearchChinesePhonetic *)self mecabraInputMethodType] == 5
        && (unint64_t)[v21 length] <= 4
        && [v21 length])
      {
        if (v30 >= 6) {
          uint64_t v32 = 6;
        }
        else {
          uint64_t v32 = v30;
        }
        if (v30 < 7)
        {
          v33 = 0;
        }
        else
        {
          v33 = 0;
          while (1)
          {
            v34 = v33;
            v33 = [v132 objectAtIndex:v32];

            if (![v33 isEmojiCandidate]) {
              break;
            }
            if (v30 == ++v32)
            {
              uint64_t v32 = v30;
              break;
            }
          }
        }
        [v5 insertSyntheticMecabraCandidateWithSurface:v133 input:v133 atIndex:v32];

        v28 = v138;
      }
      else if ([v133 length])
      {
        [v5 addSyntheticMecabraCandidateWithSurface:v133 input:v133];
      }
    }
    char v70 = v134 != 0x7FFFFFFFFFFFFFFFLL || v16;
    if ((v70 & 1) == 0)
    {
      v71 = [v133 _stringByConvertingFromHalfWidthToFullWidth];
      if (([v21 isEqualToString:v71] & 1) == 0) {
        [v5 addSyntheticMecabraCandidateWithSurface:v71 input:v133 isExtension:1];
      }
    }
  }
  if (([v28 isCancelled] & 1) == 0
    && [(TIWordSearchChinesePhonetic *)self tenKeyPinyinEnabled]
    && ((v23 | [v28 reanalysisMode]) & 1) == 0)
  {
    if (([v28 regenerateDisambiguationCandidates] & 1) != 0
      || ([v28 disambiguationCandidates],
          v72 = objc_claimAutoreleasedReturnValue(),
          uint64_t v73 = [v72 count],
          v72,
          !v73))
    {
      id v127 = v21;
      if (v128)
      {
        v124 = v9;
        v125 = v5;
        v126 = self;
        [(TIWordSearch *)self mecabra];
        SyllableSequences = (void *)MecabraCreateSyllableSequences();
        v135 = [MEMORY[0x263EFF9C0] set];
        long long v143 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        id obja = SyllableSequences;
        uint64_t v76 = [obja countByEnumeratingWithState:&v143 objects:v152 count:16];
        if (v76)
        {
          uint64_t v77 = v76;
          uint64_t v78 = *(void *)v144;
          do
          {
            for (uint64_t i = 0; i != v77; ++i)
            {
              if (*(void *)v144 != v78) {
                objc_enumerationMutation(obja);
              }
              v80 = [*(id *)(*((void *)&v143 + 1) + 8 * i) componentsSeparatedByString:@"' "];
              unint64_t v81 = [v80 count];
              if (v81 > [v28 unambiguousSyllableCount])
              {
                v82 = objc_msgSend(v80, "objectAtIndexedSubscript:", objc_msgSend(v28, "unambiguousSyllableCount"));
                v83 = [v82 componentsSeparatedByString:@" "];
                v84 = [v83 firstObject];
                int v85 = [v84 isEqualToString:@""]);

                if (v85)
                {
                  uint64_t v86 = objc_msgSend(v83, "subarrayWithRange:", 1, objc_msgSend(v83, "count") - 1);

                  v83 = (void *)v86;
                }
                v87 = [v83 firstObject];
                if (objc_msgSend(v87, "hasPrefix:", @"(")
                  && [v87 hasSuffix:@""]))
                {
                  uint64_t v88 = objc_msgSend(v87, "substringWithRange:", 1, objc_msgSend(v87, "length") - 2);

                  v87 = (void *)v88;
                }
                if (v87 && ([v87 isEqualToString:@"Mixed"] & 1) == 0) {
                  [v135 addObject:v87];
                }

                v28 = v138;
              }
            }
            uint64_t v77 = [obja countByEnumeratingWithState:&v143 objects:v152 count:16];
          }
          while (v77);
        }

        v89 = [v135 allObjects];
        v90 = [v89 sortedArrayUsingComparator:&__block_literal_global_67];

        v91 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v90, "count"));
        long long v139 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id v92 = v90;
        uint64_t v93 = [v92 countByEnumeratingWithState:&v139 objects:v151 count:16];
        v9 = v124;
        id v21 = v127;
        if (v93)
        {
          uint64_t v94 = v93;
          uint64_t v95 = *(void *)v140;
          do
          {
            for (uint64_t j = 0; j != v94; ++j)
            {
              if (*(void *)v140 != v95) {
                objc_enumerationMutation(v92);
              }
              v97 = [MEMORY[0x263F7E6C0] candidateWithPinyinSyllable:*(void *)(*((void *)&v139 + 1) + 8 * j)];
              [v91 addObject:v97];
            }
            uint64_t v94 = [v92 countByEnumeratingWithState:&v139 objects:v151 count:16];
          }
          while (v94);
        }

        if ([v91 count])
        {
          id v5 = v125;
          [v125 setDisambiguationCandidates:v91];
        }
        else
        {
          v108 = [v138 disambiguationCandidates];
          id v5 = v125;
          [v125 setDisambiguationCandidates:v108];

          objc_msgSend(v125, "setSelectedDisambiguationCandidateIndex:", objc_msgSend(v138, "selectedDisambiguationCandidateIndex"));
        }
        self = v126;

        v28 = v138;
      }
      else
      {
        v98 = self;
        v99 = v5;
        v100 = [MEMORY[0x263EFF980] array];
        v101 = v98;
        [(TIWordSearch *)v98 mecabra];
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        id v102 = (id)MecabraCreatePinyinSyllableArray();
        uint64_t v103 = [v102 countByEnumeratingWithState:&v147 objects:v153 count:16];
        if (v103)
        {
          uint64_t v104 = v103;
          uint64_t v105 = *(void *)v148;
          do
          {
            for (uint64_t k = 0; k != v104; ++k)
            {
              if (*(void *)v148 != v105) {
                objc_enumerationMutation(v102);
              }
              v107 = [MEMORY[0x263F7E6C0] candidateWithPinyinSyllable:*(void *)(*((void *)&v147 + 1) + 8 * k)];
              [v100 addObject:v107];
            }
            uint64_t v104 = [v102 countByEnumeratingWithState:&v147 objects:v153 count:16];
          }
          while (v104);
        }

        id v5 = v99;
        [v99 setDisambiguationCandidates:v100];

        v28 = v138;
        self = v101;
        id v21 = v127;
      }
    }
    else
    {
      v74 = [v28 disambiguationCandidates];
      [v5 setDisambiguationCandidates:v74];

      objc_msgSend(v5, "setSelectedDisambiguationCandidateIndex:", objc_msgSend(v28, "selectedDisambiguationCandidateIndex"));
    }
  }
  if ([v131 length])
  {
    unint64_t v109 = -[TIWordSearchChinesePhonetic mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:](self, "mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:", 0, v128 != 0, [v28 reanalysisMode], objc_msgSend(v28, "hardwareKeyboardMode"), 0);
    v110 = [v28 logger];
    [v110 markTime:2];

    v111 = [(TIWordSearch *)self mecabraEnvironment];
    LODWORD(v109) = [v111 analyzeString:v131 options:v109];

    if (v109)
    {
      while (([v28 isCancelled] & 1) == 0)
      {
        [(TIWordSearch *)self mecabra];
        uint64_t v112 = MecabraGetNextCandidate();
        if (!v112) {
          break;
        }
        uint64_t v113 = v112;
        if (MecabraCandidateGetType() != 6)
        {
          v114 = (void *)[objc_alloc(MEMORY[0x263F7E6A0]) initWithMecabraCandidate:v113];
          [v28 setCandidateAfterSegmentBreak:v114];
          [v5 setCandidateAfterSegmentBreak:v114];
          v115 = [v5 candidateRefsDictionary];
          v116 = [v114 mecabraCandidatePointerValue];
          [v115 setObject:v113 forKey:v116];

          v28 = v138;
          break;
        }
      }
    }
    v117 = [v28 logger];
    [v117 markTime:3];
  }

  return v5;
}

uint64_t __62__TIWordSearchChinesePhonetic_uncachedCandidatesForOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 length];
  if (v6 == [v4 length])
  {
    uint64_t v7 = [v5 compare:v4];
  }
  else
  {
    unint64_t v8 = [v5 length];

    if (v8 > [v4 length]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (id)candidatesCacheKeyForOperation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 selectedDisambiguationCandidateIndex] == 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [v3 inputString];
  uint64_t v6 = [v3 keyboardInput];
  uint64_t v7 = [v3 unambiguousSyllableCount];
  int v8 = [v3 reanalysisMode];
  int v9 = [v3 predictionEnabled];
  uint64_t v10 = [v3 segmentBreakIndex];

  uint64_t v11 = GetCacheKey(v5, v6, v4, v7, v8, v9, v10);

  return v11;
}

- (void)clearCacheForInputString:(id)a3 keyboardInput:(id)a4 unambiguousSyllableCount:(unint64_t)a5 selectedDisambiguationCandidateIndex:(unint64_t)a6
{
  BOOL v9 = a6 == 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = (MCKeyboardInput *)a4;
  uint64_t v11 = (NSString *)a3;
  id v13 = [(TIWordSearch *)self candidatesCache];
  v12 = GetCacheKey(v11, v10, v9, a5, 0, 0, 0x7FFFFFFFFFFFFFFFLL);

  [v13 removeObjectForKey:v12];
}

- (unint64_t)mecabraAnalysisOptionsWithAutocorrectionEnabled:(BOOL)a3 firstSyllableLocked:(BOOL)a4 reanalysisMode:(BOOL)a5 hardwareKeyboardMode:(BOOL)a6 predictionEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  BOOL v9 = a4;
  [(TIWordSearchChinesePhonetic *)self updateFuzzyPinyinSettings];
  [(TIWordSearchChinesePhonetic *)self updateShuangpinTypeWithReanalysisMode:v8];
  if (TI_IS_INTERNAL_INSTALL() && TI_IS_USING_CUSTOM_DIALECT_LM()) {
    [(TIWordSearchChinesePhonetic *)self setCustomDialectLanguageModel:TI_DIALECT_LM_PATH()];
  }
  if ([(TIWordSearchChinesePhonetic *)self fuzzyPinyinEnabled]) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = [(TIWordSearchChinesePhonetic *)self mecabraInputMethodType];
  uint64_t v13 = v11 | 2;
  if (v7) {
    uint64_t v13 = v11 | 0x800000;
  }
  if (v12 == 5) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v11;
  }
  if ([(TIWordSearch *)self autoCorrects]) {
    v14 |= 0x40uLL;
  }
  BOOL v15 = [(TIWordSearchChinesePhonetic *)self tenKeyPinyinEnabled];
  uint64_t v16 = 0x2000;
  if (v9) {
    uint64_t v16 = 40960;
  }
  if (!v15) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v16 | v14;
  if (v8) {
    uint64_t v18 = v17 | 0x4000;
  }
  else {
    uint64_t v18 = v17;
  }
  BOOL v19 = [(TIWordSearch *)self shouldLearnAcceptedCandidate];
  uint64_t v20 = v18 | 0x80;
  if (v19) {
    uint64_t v20 = v18;
  }
  return v20 | 0x80000;
}

- (unsigned)nameReadingPairGenerationMode
{
  v2 = [(TIWordSearch *)self inputMode];
  id v3 = [v2 variant];
  int v4 = [v3 isEqualToString:@"Zhuyin"];

  if (v4) {
    return 3;
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  [(TIWordSearch *)self completeOperationsInQueue];
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchChinesePhonetic;
  [(TIWordSearch *)&v3 dealloc];
}

- (int)mecabraInputMethodType
{
  v2 = [(TIWordSearch *)self inputMode];
  objc_super v3 = [v2 normalizedIdentifier];

  if (([v3 isEqualToString:@"zh_Hans-Pinyin"] & 1) != 0
    || ([v3 isEqualToString:@"zh_Hans-Shuangpin"] & 1) != 0
    || ([v3 isEqualToString:@"zh_Hans"] & 1) != 0)
  {
    int v4 = 2;
  }
  else if (([v3 isEqualToString:@"zh_Hant-Pinyin"] & 1) != 0 {
         || ([v3 isEqualToString:@"zh_Hant-Shuangpin"] & 1) != 0
  }
         || ([v3 isEqualToString:@"zh_Hant"] & 1) != 0)
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"zh_Hant-Zhuyin"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"yue_Hant-Phonetic"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)updateShuangpinTypeWithReanalysisMode:(BOOL)a3
{
  id v5 = [(TIWordSearch *)self inputMode];
  id v10 = [v5 normalizedIdentifier];

  if (([v10 isEqualToString:@"zh_Hans-Shuangpin"] & 1) != 0
    || [v10 isEqualToString:@"zh_Hant-Shuangpin"])
  {
    if (a3)
    {
      uint64_t v6 = 0;
    }
    else
    {
      BOOL v7 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      BOOL v8 = [v7 valueForPreferenceKey:*MEMORY[0x263F7E860]];

      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        uint64_t v6 = [v8 integerValue];
      }
      else {
        uint64_t v6 = 0;
      }
    }
    if (v6 != [(TIWordSearchChinesePhonetic *)self shuangpinType])
    {
      [(TIWordSearchChinesePhonetic *)self setShuangpinType:v6];
      BOOL v9 = [(TIWordSearch *)self mecabraEnvironment];
      [v9 setShuangpinType:v6];
    }
  }
}

- (void)setCustomDialectLanguageModel:(id)a3
{
  id v7 = a3;
  if (-[TIWordSearch mecabra](self, "mecabra") && [v7 hasSuffix:@"Chinese.lm"])
  {
    int v4 = [MEMORY[0x263EFF980] array];
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
    uint64_t v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x263F8C528], 0);
    [v4 addObject:v6];
    [(TIWordSearch *)self mecabra];
    MecabraSetAssetDataItemsForType();
  }
}

- (void)updateFuzzyPinyinSettings
{
  objc_super v3 = [(TIWordSearch *)self inputMode];
  id v20 = [v3 normalizedIdentifier];

  if (([v20 isEqualToString:@"zh_Hans-Pinyin"] & 1) != 0
    || ([v20 isEqualToString:@"zh_Hans-Shuangpin"] & 1) != 0
    || ([v20 isEqualToString:@"zh_Hant-Pinyin"] & 1) != 0
    || [v20 isEqualToString:@"zh_Hant-Shuangpin"])
  {
    int v4 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
    id v5 = [v4 valueForKey:100];

    BOOL v6 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinEnabled];
    if (v5 && (int v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v7 == [v5 BOOLValue])
      {
        BOOL v9 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinPairs];
        if (v7) {
          goto LABEL_21;
        }
      }
      else
      {
        char v8 = [v5 BOOLValue];
        BOOL v9 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinPairs];
        if (v8)
        {
LABEL_21:
          uint64_t v14 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
          BOOL v15 = [v14 valueForKey:102];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinPairs];
            char v17 = [v15 isEqualToArray:v16];

            if (v17) {
              goto LABEL_26;
            }
            uint64_t v18 = [v15 copy];
          }
          else
          {
            uint64_t v18 = [MEMORY[0x263F7E528] defaultFuzzyPinyinPairs];
          }
          BOOL v19 = (void *)v18;

          BOOL v9 = v19;
LABEL_26:

          uint64_t v10 = 1;
          uint64_t v11 = 1;
          if (![(TIWordSearchChinesePhonetic *)self fuzzyPinyinEnabled]) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
      BOOL v9 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinPairs];
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    if ([(TIWordSearchChinesePhonetic *)self fuzzyPinyinEnabled]) {
      goto LABEL_13;
    }
LABEL_12:
    int v12 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinPairs];

    uint64_t v11 = v10;
    if (v12 == v9)
    {
LABEL_16:

      goto LABEL_17;
    }
LABEL_13:
    [(TIWordSearchChinesePhonetic *)self setFuzzyPinyinPairs:v9];
    [(TIWordSearchChinesePhonetic *)self setFuzzyPinyinEnabled:v11];
    [(TIWordSearch *)self mecabra];
    if ([(TIWordSearchChinesePhonetic *)self fuzzyPinyinEnabled])
    {
      uint64_t v13 = [(TIWordSearchChinesePhonetic *)self fuzzyPinyinPairs];
      MecabraSetFuzzyPinyinPairs();
    }
    else
    {
      MecabraSetFuzzyPinyinPairs();
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)shareVocabulary
{
  return 1;
}

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchChinesePhonetic;
  [(TIWordSearch *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateUserWordEntries];
  [(TIWordSearch *)self updateDictionaryPaths];
}

+ (id)pinyinCharacterSetWithTones
{
  if (+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__onceToken != -1) {
    dispatch_once(&+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__onceToken, &__block_literal_global_898);
  }
  v2 = (void *)+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__pinyinCharsWithTones;
  return v2;
}

uint64_t __58__TIWordSearchChinesePhonetic_pinyinCharacterSetWithTones__block_invoke()
{
  +[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__pinyinCharsWithTones = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"āáǎàēéěèìǐíīōòǒóūúǔùüǖǘǚǜĀÁǍÀĒÉĚÈÌǏÍĪÒǑÓŌÙǓÚŪǛǙǗǕÜ"];
  return MEMORY[0x270F9A758]();
}

@end