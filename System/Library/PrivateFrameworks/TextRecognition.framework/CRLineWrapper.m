@interface CRLineWrapper
+ (id)joiningDelimiterForLine:(id)a3;
+ (id)joiningDelimiterForLine:(id)a3 useLineSeparatorAsLineBreak:(BOOL)a4;
- (BOOL)_shouldInsertLineBreakForResult:(id)a3 parameters:(id)a4 context:(id)a5 reason:(id *)a6;
- (BOOL)_shouldInsertLineBreakForResult:(id)a3 withOverwrappingCorrection:(BOOL)a4 parameters:(id)a5 context:(id)a6 reason:(id *)a7;
- (BOOL)_validateGroups:(id)a3;
- (CRLineWrapper)initWithConfiguration:(id)a3;
- (id)_allLinesInGroups:(id)a3 groupMapping:(id *)a4;
- (id)paragraphsByUpdatingLineWrappingTypesInGroups:(id)a3;
- (id)paragraphsByUpdatingLineWrappingTypesInGroups:(id)a3 useHandwritingConfig:(BOOL)a4;
- (unint64_t)_lineWrappingTypeForResult:(id)a3 parameters:(id)a4 strictParameters:(id)a5 context:(id)a6 reason:(id *)a7;
- (void)predictLineWrappingTypesForAllLinesInGroups:(id)a3 useHandwritingConfig:(BOOL)a4;
@end

@implementation CRLineWrapper

+ (id)joiningDelimiterForLine:(id)a3 useLineSeparatorAsLineBreak:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unint64_t v6 = [v5 lineWrappingType];
  if (v6 <= 5 && ((1 << v6) & 0x23) != 0)
  {
    if (v4) {
      v8 = @"\u2028";
    }
    else {
      v8 = @"\n";
    }
    goto LABEL_13;
  }
  v9 = [v5 locale];
  v10 = [v9 languageIdentifier];
  if (+[CRImageReader languageIsChinese:v10])
  {

LABEL_10:
LABEL_12:
    v8 = &stru_1F38EED68;
    goto LABEL_13;
  }
  v11 = [v5 locale];
  v12 = [v11 languageIdentifier];
  BOOL v13 = +[CRImageReader languageIsJapanese:v12];

  if (v13) {
    goto LABEL_12;
  }
  if (v6 == 3)
  {
    v9 = [v5 text];
    if (([v9 _crEndsWithHyphen] & 1) == 0) {
      goto LABEL_10;
    }
    v15 = [v5 text];
    unint64_t v16 = [v15 length];

    v8 = &stru_1F38EED68;
    if (v16 >= 2)
    {
      v17 = [v5 text];
      v18 = [v5 text];
      uint64_t v19 = objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v18, "length") - 2);

      v20 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      LODWORD(v19) = [v20 characterIsMember:v19];

      if (v19) {
        v8 = @" ";
      }
    }
  }
  else
  {
    v8 = @" ";
    if (v6 == 4) {
      v8 = @"\b";
    }
  }
LABEL_13:

  return v8;
}

+ (id)joiningDelimiterForLine:(id)a3
{
  v3 = [a1 joiningDelimiterForLine:a3 useLineSeparatorAsLineBreak:0];
  return v3;
}

- (CRLineWrapper)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLineWrapper;
  unint64_t v6 = [(CRLineWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7->_debugLineWrapping = [v8 BOOLForKey:@"com.apple.CoreRecognition.DebugLineWrapping"];
  }
  return v7;
}

- (unint64_t)_lineWrappingTypeForResult:(id)a3 parameters:(id)a4 strictParameters:(id)a5 context:(id)a6 reason:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(CRLineWrapper *)self _shouldInsertLineBreakForResult:v12 withOverwrappingCorrection:1 parameters:v13 context:v15 reason:a7])
  {
    unint64_t v16 = 1;
  }
  else
  {
    if (!v14
      || ![(CRLineWrapper *)self _shouldInsertLineBreakForResult:v12 withOverwrappingCorrection:1 parameters:v14 context:v15 reason:a7])
    {
      if ([v12 isHyphenatedPrefixOfWord])
      {
        v17 = @"hyphenatedPrefixOfWord";
        unint64_t v16 = 4;
      }
      else
      {
        v18 = [v15 text];
        char v19 = [v18 _crEndsWithHyphen];

        if (v19)
        {
          v17 = @"endsWithHyphen";
        }
        else
        {
          if ([v12 shouldAllowWhitespaceDelimiter])
          {
            unint64_t v16 = 2;
            goto LABEL_15;
          }
          v17 = @"wrapWithNoDelimiter";
        }
        unint64_t v16 = 3;
      }
      *a7 = v17;
      goto LABEL_15;
    }
    unint64_t v16 = 5;
  }
LABEL_15:

  return v16;
}

- (BOOL)_validateGroups:(id)a3
{
  id v4 = a3;
  if (![(CRLineWrappingConfiguration *)self->_configuration mergeOversegmentedTokens]) {
    goto LABEL_7;
  }
  id v5 = [v4 firstObject];
  if (v5 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "removeSubregion is not implemented although mergeOversegmentedTokens is enabled.", buf, 2u);
    }
    goto LABEL_13;
  }
  unint64_t v6 = [v5 subregions];
  v7 = [v6 firstObject];

  if (v7 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = CROSLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_FAULT, "mergeWithLine is not implemented although mergeOversegmentedTokens is enabled.", v11, 2u);
    }

LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }

LABEL_7:
  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (void)predictLineWrappingTypesForAllLinesInGroups:(id)a3 useHandwritingConfig:(BOOL)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  if (!-[CRLineWrapper _validateGroups:](self, "_validateGroups:")) {
    goto LABEL_35;
  }
  id v74 = 0;
  id v5 = [(CRLineWrapper *)self _allLinesInGroups:v42 groupMapping:&v74];
  id v46 = v74;
  v47 = v5;
  if (![v5 count]) {
    goto LABEL_34;
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__14;
  v72 = __Block_byref_object_dispose__14;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__14;
  v66 = __Block_byref_object_dispose__14;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__14;
  v60 = __Block_byref_object_dispose__14;
  id v61 = 0;
  unint64_t v6 = objc_alloc_init(CRLineWrappingContextCache);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __82__CRLineWrapper_predictLineWrappingTypesForAllLinesInGroups_useHandwritingConfig___block_invoke;
  v50[3] = &unk_1E6CDBBA8;
  BOOL v55 = a4;
  v52 = &v62;
  v53 = &v56;
  v54 = &v68;
  v41 = v6;
  v51 = v41;
  v44 = (void (**)(void, void))MEMORY[0x1E01BFAC0](v50);
  v7 = [v5 firstObject];
  for (uint64_t i = 1; i - 1 < (unint64_t)([v47 count] - 1); ++i)
  {
    v9 = [v47 objectAtIndexedSubscript:i];
    objc_super v10 = [(CRWrappingEvaluationResult *)v7 uuid];
    v11 = [v46 objectForKeyedSubscript:v10];

    id v12 = [v9 uuid];
    v48 = [v46 objectForKeyedSubscript:v12];

    if (v11 == v48 || ([v11 canWrapToNextGroup] & 1) != 0)
    {
      id v13 = (void *)v69[5];
      if (!v13 || ([v13 active] & 1) == 0) {
        ((void (**)(void, CRWrappingEvaluationResult *))v44)[2](v44, v7);
      }
      id v14 = [CRWrappingEvaluationResult alloc];
      uint64_t v15 = v69[5];
      unint64_t v16 = [(CRWrappingEvaluationResult *)v7 boundingQuad];
      [v16 normalizationSize];
      v17 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:](v14, "initWithTextFeature:context:imageSize:parameters:", v9, v15, v63[5]);

      if ([(CRWrappingEvaluationResult *)v7 lineWrappingType])
      {
        if (self->_debugLineWrapping)
        {
          v18 = CROSLogForCategory(4);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = [v47 count];
            uint64_t v20 = [(CRWrappingEvaluationResult *)v7 lineWrappingType];
            v21 = [(CRWrappingEvaluationResult *)v7 text];
            v22 = [v9 text];
            *(_DWORD *)buf = 136316419;
            v76 = "-[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:useHandwritingConfig:]";
            __int16 v77 = 2048;
            uint64_t v78 = i;
            __int16 v79 = 2048;
            uint64_t v80 = v19;
            __int16 v81 = 2048;
            unint64_t v82 = v20;
            __int16 v83 = 2117;
            v84 = v21;
            __int16 v85 = 2117;
            v86 = v22;
            _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_DEBUG, "%s: Line %lu/%lu - Keeping lineWrappingType %lu: '%{sensitive}@' | '%{sensitive}@'.", buf, 0x3Eu);
          }
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v28 = v63[5];
        uint64_t v29 = v57[5];
        uint64_t v30 = v69[5];
        id v49 = 0;
        unint64_t v31 = [(CRLineWrapper *)self _lineWrappingTypeForResult:v17 parameters:v28 strictParameters:v29 context:v30 reason:&v49];
        v18 = v49;
        [(CRWrappingEvaluationResult *)v7 setLineWrappingType:v31];
        if (self->_debugLineWrapping)
        {
          log = CROSLogForCategory(4);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v32 = [v47 count];
            v33 = [(CRWrappingEvaluationResult *)v7 text];
            v34 = [v9 text];
            *(_DWORD *)buf = 136316675;
            v76 = "-[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:useHandwritingConfig:]";
            __int16 v77 = 2048;
            uint64_t v78 = i;
            __int16 v79 = 2048;
            uint64_t v80 = v32;
            __int16 v81 = 2048;
            unint64_t v82 = v31;
            __int16 v83 = 2117;
            v84 = v33;
            __int16 v85 = 2117;
            v86 = v34;
            __int16 v87 = 2112;
            v88 = (__CFString *)v18;
            _os_log_impl(&dword_1DD733000, log, OS_LOG_TYPE_DEBUG, "%s: Line %lu/%lu - Updating lineWrappingType %lu: '%{sensitive}@' | '%{sensitive}@' (%@).", buf, 0x48u);
          }
        }
LABEL_23:
      }
      if ([(CRWrappingEvaluationResult *)v7 lineWrappingType] == 1)
      {
        [(id)v69[5] resetContext];
        goto LABEL_30;
      }
      objc_msgSend((id)v69[5], "addResult:mergeOversegmentation:", v17, -[CRLineWrappingConfiguration mergeOversegmentedTokens](self->_configuration, "mergeOversegmentedTokens"));
      if ([(CRWrappingEvaluationResult *)v17 isOversegmented]
        && [(CRLineWrappingConfiguration *)self->_configuration mergeOversegmentedTokens])
      {
        [(CRWrappingEvaluationResult *)v7 setLineWrappingType:0];
        v35 = [v9 uuid];
        v36 = [v46 objectForKeyedSubscript:v35];
        char v37 = objc_opt_respondsToSelector();

        if ((v37 & 1) == 0) {
          goto LABEL_32;
        }
        v38 = [v9 uuid];
        v39 = [v46 objectForKeyedSubscript:v38];
        [v39 removeSubregion:v9];
      }
      else
      {
LABEL_30:
        v38 = v7;
        v7 = v9;
      }

      goto LABEL_32;
    }
    [(CRWrappingEvaluationResult *)v7 setLineWrappingType:1];
    if (self->_debugLineWrapping)
    {
      v23 = CROSLogForCategory(4);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = [v47 count];
        uint64_t v25 = [(CRWrappingEvaluationResult *)v7 lineWrappingType];
        v26 = [(CRWrappingEvaluationResult *)v7 text];
        v27 = [v9 text];
        *(_DWORD *)buf = 136316675;
        v76 = "-[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:useHandwritingConfig:]";
        __int16 v77 = 2048;
        uint64_t v78 = i;
        __int16 v79 = 2048;
        uint64_t v80 = v24;
        __int16 v81 = 2048;
        unint64_t v82 = v25;
        __int16 v83 = 2117;
        v84 = v26;
        __int16 v85 = 2117;
        v86 = v27;
        __int16 v87 = 2112;
        v88 = @"blockBoundary";
        _os_log_impl(&dword_1DD733000, v23, OS_LOG_TYPE_DEBUG, "%s: Line %lu/%lu - Updating lineWrappingType %lu: '%{sensitive}@' | '%{sensitive}@' (%@).", buf, 0x48u);
      }
    }
    [(id)v69[5] resetContext];
    v17 = v7;
    v7 = v9;
LABEL_32:
  }
  v40 = [v47 lastObject];
  [v40 setLineWrappingType:1];

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
LABEL_34:

LABEL_35:
}

void __82__CRLineWrapper_predictLineWrappingTypesForAllLinesInGroups_useHandwritingConfig___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v3 = [v18 locale];
  id v4 = [v3 languageIdentifier];

  id v5 = [[CRLineWrappingParameters alloc] initWithLocale:v4 useStrictConfig:0 useHandwritingConfig:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  BOOL v8 = [[CRLineWrappingParameters alloc] initWithLocale:v4 useStrictConfig:1];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [*(id *)(a1 + 32) contextForLocale:v4];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = [CRWrappingEvaluationResult alloc];
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  unint64_t v16 = [v18 boundingQuad];
  [v16 normalizationSize];
  v17 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:](v14, "initWithTextFeature:context:imageSize:parameters:", v18, v15, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "startWithResult:contextSize:", v17, (int)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "lmContextSize"));
}

- (BOOL)_shouldInsertLineBreakForResult:(id)a3 parameters:(id)a4 context:(id)a5 reason:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 featureInTest];
  id v13 = [v11 lastFeature];
  double v14 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v12 confidenceScore];
    double v14 = v15;
  }
  double v16 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v13 confidenceScore];
    double v16 = v17;
  }
  if (([v9 matchingLocales] & 1) == 0)
  {
    uint64_t v19 = @"localeMismatch";
    goto LABEL_9;
  }
  [v10 confidenceThreshold];
  if (v14 < v18)
  {
    uint64_t v19 = @"confidenceLow";
    goto LABEL_9;
  }
  [v10 contextConfidenceThreshold];
  if (v16 < v22)
  {
    uint64_t v19 = @"contextConfidenceLow";
    goto LABEL_9;
  }
  if (![v9 similarHeights] || (objc_msgSend(v9, "similarAngles") & 1) == 0)
  {
    if ([v9 similarHeights]) {
      v27 = @"geometryAngle";
    }
    else {
      v27 = @"geometryHeight";
    }
    uint64_t v28 = v27;
    goto LABEL_29;
  }
  if (([v9 isOversegmented] & 1) == 0)
  {
    [v9 widthGrowth];
    double v24 = v23;
    [v10 widthGrowthLimit];
    if (v24 >= v25)
    {
      unint64_t v26 = [v9 tokenCountDiff];
      if (v26 >= [v10 tokenCountIncreaseLimit])
      {
        v33 = NSString;
        [v9 widthGrowth];
        v35 = objc_msgSend(v33, "stringWithFormat:", @"widthGrowthAndTokenCount:%4.2f,%ld", v34, objc_msgSend(v9, "tokenCountDiff"));
LABEL_44:
        uint64_t v28 = v35;
LABEL_29:
        *a6 = v28;
        goto LABEL_10;
      }
    }
  }
  if (([v9 isOversegmented] & 1) == 0
    && ([v9 leadingAligned] & 1) == 0
    && ([v9 centerAligned] & 1) == 0
    && ([v9 continuesToNewColumn] & 1) == 0)
  {
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"textAlignment:%d%d%d%d", objc_msgSend(v9, "isOversegmented"), objc_msgSend(v9, "leadingAligned"), objc_msgSend(v9, "centerAligned"), objc_msgSend(v9, "continuesToNewColumn"));
    goto LABEL_44;
  }
  if ([v9 excessiveVerticalDistance])
  {
    uint64_t v19 = @"excessiveVerticalDistance";
  }
  else
  {
    uint64_t v29 = [v9 textBasedEvaluation];
    if (v29 > [v10 noWrappingEvaluationThreshold])
    {
      int v30 = [v9 continuesToNewColumn];
      if (v29 == 10) {
        int v31 = v30;
      }
      else {
        int v31 = 0;
      }
      if (v31 == 1)
      {
        char v20 = 0;
        uint64_t v32 = @"textEvaluationWithNewColumn";
      }
      else if (([v9 continuesToNewColumn] & 1) != 0 {
             || v29 < [v10 wrappingEvaluationThreshold])
      }
      {
        if ([v11 isClassifierAvailable])
        {
          *a6 = @"classifier";
          [v10 probabilityThreshold];
          char v20 = objc_msgSend(v11, "classifierShouldInsertLineBreakForEvaluationResult:threshold:", v9);
          goto LABEL_11;
        }
        [v9 lmScore];
        double v37 = v36;
        [v10 lmScoreThreshold];
        if (v37 <= v38 || v29 < 3)
        {
          if (v37 <= 0.0)
          {
            uint64_t v19 = @"LMUnknown";
          }
          else
          {
            [v9 eosLMScore];
            double v40 = v39;
            if (v39 > 0.0 && v37 > v39)
            {
              *a6 = @"LMScoreRatio";
              [v10 lmScoreEOSMinRatio];
              char v20 = v37 / v40 <= v41;
              goto LABEL_11;
            }
            uint64_t v19 = @"LMScoreEOS";
          }
          goto LABEL_9;
        }
        char v20 = 0;
        uint64_t v32 = @"LMScore";
      }
      else
      {
        char v20 = 0;
        uint64_t v32 = @"textEvaluationWithoutNewColumn";
      }
      *a6 = v32;
      goto LABEL_11;
    }
    uint64_t v19 = @"textEvaluation";
  }
LABEL_9:
  *a6 = v19;
LABEL_10:
  char v20 = 1;
LABEL_11:

  return v20;
}

- (BOOL)_shouldInsertLineBreakForResult:(id)a3 withOverwrappingCorrection:(BOOL)a4 parameters:(id)a5 context:(id)a6 reason:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [(CRLineWrapper *)self _shouldInsertLineBreakForResult:v12 parameters:v13 context:v14 reason:a7];
  if (v10 && !v15)
  {
    if (objc_msgSend(v14, "classifierShouldCorrectOverwrappingWithEvaluation:correctionMode:", objc_msgSend(v12, "textBasedEvaluation"), objc_msgSend(v13, "correctionMode"))&& (objc_msgSend(v13, "probabilityThreshold"), objc_msgSend(v14, "classifierShouldInsertLineBreakForEvaluationResult:threshold:", v12)))
    {
      *a7 = [*a7 stringByAppendingString:@"+overwrappingCorrected"];
      LOBYTE(v15) = 1;
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }

  return v15;
}

- (id)_allLinesInGroups:(id)a3 groupMapping:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v18;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = v6;
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = [v8 subregions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v14 = [v13 uuid];
              [v5 setObject:v8 forKeyedSubscript:v14];

              [v4 addObject:v13];
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v10);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  if ([v5 count]) {
    *a4 = (id)[v5 copy];
  }
  BOOL v15 = (void *)[v4 copy];

  return v15;
}

- (id)paragraphsByUpdatingLineWrappingTypesInGroups:(id)a3
{
  v3 = [(CRLineWrapper *)self paragraphsByUpdatingLineWrappingTypesInGroups:a3 useHandwritingConfig:0];
  return v3;
}

- (id)paragraphsByUpdatingLineWrappingTypesInGroups:(id)a3 useHandwritingConfig:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  -[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:useHandwritingConfig:](self, "predictLineWrappingTypesForAllLinesInGroups:useHandwritingConfig:");
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v18;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v10 = [v9 subregions];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              [v6 addObject:v14];
              if ([v14 lineWrappingType] == 1 || !objc_msgSend(v14, "lineWrappingType"))
              {
                BOOL v15 = [[CRLayoutParagraph alloc] initWithLines:v6];
                [v5 addObject:v15];

                [v6 removeAllObjects];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  if ([v6 count])
  {
    double v16 = [[CRLayoutParagraph alloc] initWithLines:v6];
    [v5 addObject:v16];
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end