@interface CRLanguageCorrection
+ (id)supportedLanguagesForRevision:(unint64_t)a3 error:(id *)a4;
- (BOOL)isLanguageCorrectionSupportedForLanguage:(id)a3 revision:(unint64_t)a4;
- (BOOL)preferAllLowercase:(id)a3;
- (BOOL)preferAllUppercase:(id)a3;
- (CRCHPatternNetwork)patternFST;
- (CRLanguageCorrection)initWithRevision:(unint64_t)a3 localeCode:(id)a4 customWords:(id)a5;
- (NSCharacterSet)confusableCharacters;
- (NSLocale)locale;
- (NSString)invalidSingleCharCNNCode;
- (_LXLexicon)createDynamicLexiconForLocale:(id)a3 error:(id *)a4;
- (_LXLexicon)dynamicLexicon;
- (_LXLexicon)staticLexicon;
- (id)correctTextFeature:(id)a3 inImage:(id)a4 withTextPieces:(id)a5 withMaxWidthPerRegion:(double)a6 withMedianCharSpacing:(double)a7 withBreakpoints:(const void *)a8 segmenter:(void *)a9 options:(id)a10 numCharCandidates:(int)a11 downscaleSpaceRatio:(BOOL)a12 latticePresetIdx:(int)a13 latticeResults:(id)a14;
- (id)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:;
- (id)findBestPathsForTextResults:(id)a3 numPathsToExtract:(unint64_t)a4 ngramsize:(unint64_t)a5;
- (uint64_t)correctTextFeature:(uint64_t *)a3 inImage:(uint64_t)a4 withTextPieces:(char)a5 withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:;
- (uint64_t)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:;
- (void)adjustCaseConfusions:(id)a3;
- (void)characterLanguageModel;
- (void)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:;
- (void)dealloc;
- (void)loadCharacterNgramModel:(id)a3;
- (void)setCharacterLanguageModel:(void *)a3;
- (void)setDynamicLexicon:(_LXLexicon *)a3;
- (void)setInvalidSingleCharCNNCode:(id)a3;
- (void)setPatternFST:(id)a3;
- (void)setStaticLexicon:(_LXLexicon *)a3;
@end

@implementation CRLanguageCorrection

+ (id)supportedLanguagesForRevision:(unint64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 3uLL:
      v11 = @"en-US";
      v12 = @"fr-FR";
      v13 = @"it-IT";
      v14 = @"de-DE";
      v15 = @"es-ES";
      v16 = @"pt-BR";
      v4 = (void *)MEMORY[0x1E4F1C978];
      v5 = &v11;
LABEL_7:
      uint64_t v6 = 6;
      goto LABEL_8;
    case 2uLL:
      v17 = @"en-US";
      v18 = @"fr-FR";
      v19 = @"it-IT";
      v20 = @"de-DE";
      v21 = @"es-ES";
      v22 = @"pt-BR";
      v4 = (void *)MEMORY[0x1E4F1C978];
      v5 = &v17;
      goto LABEL_7;
    case 1uLL:
      v23 = @"en-US";
      v4 = (void *)MEMORY[0x1E4F1C978];
      v5 = &v23;
      uint64_t v6 = 1;
LABEL_8:
      v7 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_9;
  }
  if (a4)
  {
    id v10 = +[CRImageReader errorWithErrorCode:-4];
    v7 = 0;
    *a4 = v10;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:
  return v7;
}

- (CRLanguageCorrection)initWithRevision:(unint64_t)a3 localeCode:(id)a4 customWords:(id)a5
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)CRLanguageCorrection;
  id v10 = [(CRLanguageCorrection *)&v43 init];
  if (v10)
  {
    __int16 v42 = -1;
    uint64_t v11 = [NSString stringWithCharacters:&v42 length:1];
    invalidSingleCharCNNCode = v10->_invalidSingleCharCNNCode;
    v10->_invalidSingleCharCNNCode = (NSString *)v11;

    if (!v8)
    {
      id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Locale was not provided for language correction" userInfo:0];
      objc_exception_throw(v34);
    }
    if (![(CRLanguageCorrection *)v10 isLanguageCorrectionSupportedForLanguage:v8 revision:a3])
    {
      v32 = 0;
      goto LABEL_33;
    }
    uint64_t v13 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v13;

    v15 = [(NSLocale *)v10->_locale languageCode];
    [(CRLanguageCorrection *)v10 loadCharacterNgramModel:v8];
    uint64_t v16 = *MEMORY[0x1E4F72358];
    v47[0] = *MEMORY[0x1E4F723C8];
    v47[1] = v16;
    v48[0] = v15;
    v48[1] = MEMORY[0x1E4F1CC28];
    v47[2] = *MEMORY[0x1E4F723F0];
    v48[2] = MEMORY[0x1E4F1CC28];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
    v41[1] = 0;
    uint64_t v18 = LXLexiconCreate();
    v10->_staticLexicon = (_LXLexicon *)v18;
    if (!v18)
    {
      v19 = CROSLogForCategory(3);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v15;
        _os_log_impl(&dword_1DD733000, v19, OS_LOG_TYPE_ERROR, "[WARNING] Unable to load lexicon for language '%@'. Lexicon checks will be disabled during language correction.", buf, 0xCu);
      }
    }
    v10->_dynamicLexicon = 0;
    id v20 = v9;
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = v15;
        v21 = [(CRLanguageCorrection *)v10 locale];
        v41[0] = 0;
        uint64_t v22 = [(CRLanguageCorrection *)v10 createDynamicLexiconForLocale:v21 error:v41];
        id v23 = v41[0];
        v10->_dynamicLexicon = (_LXLexicon *)v22;

        v15 = v36;
        if (v23)
        {
          uint64_t v24 = CROSLogForCategory(3);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v46 = v23;
            _os_log_impl(&dword_1DD733000, v24, OS_LOG_TYPE_ERROR, "[WARNING] Unable to create custom lexicon: %@", buf, 0xCu);
          }
        }
        if (v10->_dynamicLexicon)
        {
          id v35 = v23;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v25 = v20;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v44 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v38 != v27) {
                  objc_enumerationMutation(v25);
                }
                if (LXLexiconAdd()) {
                  LXLexiconIncrementUsageCount();
                }
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v44 count:16];
            }
            while (v26);
          }

          id v23 = v35;
          v15 = v36;
        }
      }
    }
    v29 = [[CRCHPatternNetwork alloc] initWithFile:@"P.bin"];
    patternFST = v10->_patternFST;
    v10->_patternFST = v29;

    if (!v10->_patternFST)
    {
      v31 = CROSLogForCategory(3);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v31, OS_LOG_TYPE_ERROR, "[WARNING] Unable to load pattern network", buf, 2u);
      }
    }
  }
  v32 = v10;
LABEL_33:

  return v32;
}

- (void)loadCharacterNgramModel:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [(NSLocale *)v4 languageCode];
  v5 = [(NSLocale *)v4 countryCode];
  uint64_t v6 = [v5 uppercaseString];

  v7 = [NSString stringWithFormat:@"%@_%@", v24, v6];
  id v8 = [v7 stringByAppendingPathExtension:@"lm"];
  bzero(v29, 0x400uLL);
  id v9 = v8;
  if (pathForResource((const char *)[v9 cStringUsingEncoding:4], 0, v29))
  {
    id v10 = firstMatchingResourceForLocale(v4, &stru_1F38EED68.isa, &cfstr_Lm.isa, v29);
    if (!v10)
    {

      id v10 = 0;
      goto LABEL_14;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [NSString stringWithUTF8String:v29];
    uint64_t v13 = [v11 fileURLWithPath:v12];
  }
  else
  {
    v12 = CROSLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_ERROR, "[WARNING] Resource path not found for '%@'. Character LM will be disabled during language correction.", buf, 0xCu);
    }
    id v10 = 0;
    uint64_t v13 = 0;
  }

  if (v13)
  {
    v14 = [v13 path];
    v15 = [v14 lastPathComponent];
    uint64_t v16 = [v15 stringByDeletingPathExtension];

    v17 = [v14 stringByDeletingLastPathComponent];
    uint64_t v18 = *MEMORY[0x1E4F72358];
    v25[0] = *MEMORY[0x1E4F723C8];
    v25[1] = v18;
    v26[0] = v10;
    v26[1] = MEMORY[0x1E4F1CC28];
    uint64_t v19 = *MEMORY[0x1E4F72370];
    v25[2] = *MEMORY[0x1E4F72380];
    v25[3] = v19;
    v26[2] = v17;
    v26[3] = v16;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
    v21 = (void *)LMLanguageModelCreate();
    self->_characterLanguageModel = v21;
    if (!v21)
    {
      uint64_t v22 = CROSLogForCategory(3);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v29 = 138412290;
        v30 = v10;
        _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_ERROR, "[WARNING] Unable to load character language model for language '%@'. Character LM will be disabled during language correction.", v29, 0xCu);
      }
    }
    goto LABEL_17;
  }
LABEL_14:
  v14 = CROSLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v29 = 138412546;
    v30 = v10;
    __int16 v31 = 2112;
    id v32 = v23;
    _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_ERROR, "[WARNING] Resource not found for '%@'. Character LM will be disabled during language correction. Requested locale '%@'.", v29, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_17:
}

- (BOOL)isLanguageCorrectionSupportedForLanguage:(id)a3 revision:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() supportedLanguagesForRevision:a4 error:0];
  char v7 = [v6 containsObject:v5];

  return v7;
}

- (void)dealloc
{
  if (self->_characterLanguageModel)
  {
    LMLanguageModelRelease();
    self->_characterLanguageModel = 0;
  }
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  dynamicLexicon = self->_dynamicLexicon;
  if (dynamicLexicon)
  {
    CFRelease(dynamicLexicon);
    self->_dynamicLexicon = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLanguageCorrection;
  [(CRLanguageCorrection *)&v5 dealloc];
}

- (id)correctTextFeature:(id)a3 inImage:(id)a4 withTextPieces:(id)a5 withMaxWidthPerRegion:(double)a6 withMedianCharSpacing:(double)a7 withBreakpoints:(const void *)a8 segmenter:(void *)a9 options:(id)a10 numCharCandidates:(int)a11 downscaleSpaceRatio:(BOOL)a12 latticePresetIdx:(int)a13 latticeResults:(id)a14
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v38 = a4;
  id v33 = a5;
  id v19 = a10;
  id v40 = a14;
  id v32 = v19;
  id v20 = [v19 objectForKeyedSubscript:@"CRImageReaderNumTopStringCandidates"];
  int v21 = [v20 intValue];
  if (v21 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v21;
  }
  uint64_t v39 = v22;

  long long v37 = objc_alloc_init(TextResults);
  memset(v48, 0, sizeof(v48));
  id obj = v33;
  if ([obj countByEnumeratingWithState:v48 objects:v50 count:16])
  {
    id v23 = (void *)**((void **)&v48[0] + 1);
    [(CRLanguageCorrection *)self adjustCaseConfusions:**((void **)&v48[0] + 1)];
    uint64_t v24 = *(uint64_t ***)a8;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a8 + 1) - *(void *)a8) >> 3))
    {
      id v25 = [(CRLanguageCorrection *)self invalidSingleCharCNNCode];
      CRLattice::CRLattice((uint64_t)v47, v38, v23, v24, v25, (uint64_t)a9, a6, a7);
    }
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }

  uint64_t v26 = [(CRLanguageCorrection *)self findBestPathsForTextResults:v37 numPathsToExtract:v39 ngramsize:6];
  [v42 topLeft];
  objc_msgSend(v26, "setTopLeft:");
  [v42 topRight];
  objc_msgSend(v26, "setTopRight:");
  [v42 bottomLeft];
  objc_msgSend(v26, "setBottomLeft:");
  [v42 bottomRight];
  objc_msgSend(v26, "setBottomRight:");
  objc_msgSend(v26, "setFeatureMapID:", objc_msgSend(v42, "featureMapID"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v27 = [v26 subFeatures];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "setFeatureMapID:", objc_msgSend(v42, "featureMapID"));
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v28);
  }

  return v26;
}

- (NSCharacterSet)confusableCharacters
{
  return (NSCharacterSet *)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"cosuvwxzCOSUVWXZ"];
}

- (BOOL)preferAllUppercase:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [a3 subFeatures];
  int v4 = 0;
  int v5 = 0;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) stringValueCandidates];
        id v10 = [v9 firstObject];

        if ([v10 length])
        {
          unsigned __int16 v12 = 0;
          objc_msgSend(v10, "getCharacters:range:", &v12, 0, 1);
          if (v12 - 65 < 0x1A) {
            ++v4;
          }
          ++v5;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4 > v5 - v4;
}

- (BOOL)preferAllLowercase:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [a3 subFeatures];
  int v4 = 0;
  int v5 = 0;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) stringValueCandidates];
        id v10 = [v9 firstObject];

        if ([v10 length])
        {
          unsigned __int16 v12 = 0;
          objc_msgSend(v10, "getCharacters:range:", &v12, 0, 1);
          if (v12 - 97 < 0x1A) {
            ++v4;
          }
          ++v5;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4 > v5 - v4;
}

- (void)adjustCaseConfusions:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  long long v43 = [(CRLanguageCorrection *)self confusableCharacters];
  BOOL v41 = [(CRLanguageCorrection *)self preferAllUppercase:v38];
  BOOL v40 = [(CRLanguageCorrection *)self preferAllLowercase:v38];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v38 subFeatures];
  uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v4)
  {
    int v5 = 0;
    uint64_t v46 = *(void *)v54;
    do
    {
      uint64_t v6 = 0;
      uint64_t v47 = v4;
      int v39 = v5 + v4;
      do
      {
        if (*(void *)v54 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v53 + 1) + 8 * v6);
        uint64_t v8 = [v7 stringValueCandidates];
        id v9 = [v8 firstObject];

        if ([v9 length])
        {
          unsigned __int16 v52 = 0;
          objc_msgSend(v9, "getCharacters:range:", &v52, 0, 1);
          if ([v43 characterIsMember:v52])
          {
            long long v44 = [v9 uppercaseString];
            long long v45 = [v9 lowercaseString];
            id v10 = [v7 stringValueCandidates];
            uint64_t v11 = [v10 indexOfObject:v44];

            unsigned __int16 v12 = [v7 stringValueCandidates];
            uint64_t v13 = [v12 indexOfObject:v45];

            long long v14 = [v7 candidateProbs];
            long long v15 = (void *)[v14 mutableCopy];

            if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              int v16 = [v7 isUp];
              v17 = [v15 objectAtIndexedSubscript:v13];
              [v17 doubleValue];
              double v19 = v18;

              id v20 = [v15 objectAtIndexedSubscript:v11];
              [v20 doubleValue];
              double v22 = v21;

              if ((v41 | v16) == 1)
              {
                id v23 = [NSNumber numberWithDouble:v19 * 0.8];
                [v15 setObject:v23 atIndexedSubscript:v13];

                uint64_t v24 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v22 + v22, 1.0));
                [v15 setObject:v24 atIndexedSubscript:v11];
                goto LABEL_17;
              }
              if (v5 > 0 && v40)
              {
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v19 + v19, 1.0));
                [v15 setObject:v26 atIndexedSubscript:v13];

                uint64_t v24 = [NSNumber numberWithDouble:v22 * 0.8];
                [v15 setObject:v24 atIndexedSubscript:v11];
LABEL_17:
              }
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v27 = v15;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v28)
            {
              uint64_t v29 = *(void *)v49;
              double v30 = 0.0;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v49 != v29) {
                    objc_enumerationMutation(v27);
                  }
                  [*(id *)(*((void *)&v48 + 1) + 8 * i) doubleValue];
                  double v30 = v30 + v32;
                }
                uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v57 count:16];
              }
              while (v28);
            }
            else
            {
              double v30 = 0.0;
            }

            for (unint64_t j = 0; j < [v27 count]; ++j)
            {
              id v34 = [v27 objectAtIndexedSubscript:j];
              [v34 doubleValue];
              double v36 = v35;

              long long v37 = [NSNumber numberWithDouble:v36 / v30];
              [v27 setObject:v37 atIndexedSubscript:j];
            }
            [v7 setCandidateProbs:v27];
          }
        }

        ++v5;
        ++v6;
      }
      while (v6 != v47);
      uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      int v5 = v39;
    }
    while (v4);
  }
}

- (_LXLexicon)createDynamicLexiconForLocale:(id)a3 error:(id *)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F72458];
  v10[0] = *MEMORY[0x1E4F72460];
  v10[1] = v6;
  v11[0] = @"CR-Custom-Lexicon";
  v11[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  Mutable = (_LXLexicon *)LXLexiconCreateMutable();
  if (a4) {
    *a4 = 0;
  }

  return Mutable;
}

- (id)findBestPathsForTextResults:(id)a3 numPathsToExtract:(unint64_t)a4 ngramsize:(unint64_t)a5
{
  id v45 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v46 = 0;
  unint64_t v8 = a5 - 1;
  while (v46 < [v45 colCount])
  {
    id v9 = [v45 cols];
    id v10 = [v9 objectAtIndexedSubscript:v46];

    long long v44 = v10;
    uint64_t v11 = [v10 rows];
    unint64_t v12 = [v10 rowCount];
    if (v12 >= a4) {
      unint64_t v13 = a4;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13)
    {
      unint64_t v14 = 0;
      while (v14 < [v6 count])
      {
        long long v15 = [v6 objectAtIndexedSubscript:v14];
        uint64_t v16 = [v15 length];

        if (v16)
        {
          v17 = [v6 objectAtIndexedSubscript:v14];
          [v17 appendString:@" "];
LABEL_12:
        }
        double v19 = [v11 objectAtIndexedSubscript:v14];
        id v20 = [v19 string];

        double v21 = [v6 objectAtIndexedSubscript:v14];
        [v21 appendString:v20];

        double v22 = [v11 objectAtIndexedSubscript:v14];
        [v22 score];
        double v24 = __exp10(-v23 / (double)(v8 + [v20 length]));

        id v25 = NSNumber;
        uint64_t v26 = [v7 objectAtIndexedSubscript:v14];
        [v26 doubleValue];
        uint64_t v28 = [v25 numberWithDouble:v24 + v27];
        [v7 setObject:v28 atIndexedSubscript:v14];

        uint64_t v29 = [v47 objectAtIndexedSubscript:v14];
        double v30 = [v11 objectAtIndexedSubscript:v14];
        __int16 v31 = [v30 features];
        [v29 addObjectsFromArray:v31];

        if (v13 == ++v14) {
          goto LABEL_14;
        }
      }
      double v18 = [MEMORY[0x1E4F28E78] string];
      [v6 addObject:v18];

      [v7 addObject:&unk_1F3932CC8];
      v17 = [MEMORY[0x1E4F1CA48] array];
      [v47 addObject:v17];
      goto LABEL_12;
    }
LABEL_14:

    ++v46;
  }
  for (unint64_t i = 0; i < [v7 count]; ++i)
  {
    id v33 = NSNumber;
    id v34 = [v7 objectAtIndexedSubscript:i];
    [v34 doubleValue];
    double v36 = objc_msgSend(v33, "numberWithDouble:", v35 / (double)(unint64_t)objc_msgSend(v45, "colCount"));
    [v7 setObject:v36 atIndexedSubscript:i];
  }
  long long v37 = [CRTextFeature alloc];
  id v38 = [v47 objectAtIndexedSubscript:0];
  int v39 = [v6 objectAtIndexedSubscript:0];
  BOOL v40 = [(CRTextFeature *)v37 initWithSubfeatures:v38 stringValue:v39];

  [(CRTextFeature *)v40 setStringValueCandidates:v6];
  [(CRTextFeature *)v40 setCandidateProbs:v7];
  BOOL v41 = [v7 objectAtIndexedSubscript:0];
  [(CRTextFeature *)v40 setConfidence:v41];

  [(CRTextFeature *)v40 setSubFeatureCandidates:v47];
  return v40;
}

- (void)characterLanguageModel
{
  return self->_characterLanguageModel;
}

- (void)setCharacterLanguageModel:(void *)a3
{
  self->_characterLanguageModel = a3;
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)setStaticLexicon:(_LXLexicon *)a3
{
  self->_staticLexicon = a3;
}

- (_LXLexicon)dynamicLexicon
{
  return self->_dynamicLexicon;
}

- (void)setDynamicLexicon:(_LXLexicon *)a3
{
  self->_dynamicLexicon = a3;
}

- (NSString)invalidSingleCharCNNCode
{
  return self->_invalidSingleCharCNNCode;
}

- (void)setInvalidSingleCharCNNCode:(id)a3
{
}

- (CRCHPatternNetwork)patternFST
{
  return self->_patternFST;
}

- (void)setPatternFST:(id)a3
{
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_patternFST, 0);
  objc_storeStrong((id *)&self->_invalidSingleCharCNNCode, 0);
}

- (uint64_t)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
}

- (id)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  *a2 = &off_1F38ED5C0;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (uint64_t)correctTextFeature:(uint64_t *)a3 inImage:(uint64_t)a4 withTextPieces:(char)a5 withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  uint64_t v11 = (uint64_t *)result;
LABEL_2:
  unint64_t v12 = v11;
  while (1)
  {
    uint64_t v11 = v12;
    uint64_t v13 = (char *)a2 - (char *)v12;
    unint64_t v14 = a2 - v12;
    if (v6 || !v5)
    {
      switch(v14)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v44 = *v12;
          uint64_t v45 = *(a2 - 1);
          if (*(double *)(**a3 + 8 * *v12) < *(double *)(**a3 + 8 * v45))
          {
            uint64_t *v12 = v45;
            *(a2 - 1) = v44;
          }
          break;
        case 3uLL:
          uint64_t v46 = **a3;
          id result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v12, v12 + 1, a2 - 1, v46);
          break;
        case 4uLL:
          id result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v12, v12 + 1, v12 + 2, a2 - 1, a3);
          break;
        case 5uLL:
          uint64_t v47 = v12 + 1;
          long long v48 = v12 + 2;
          long long v49 = v12 + 3;
          id result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v12, v12 + 1, v12 + 2, v12 + 3, a3);
          uint64_t v50 = v12[3];
          uint64_t v51 = **a3;
          uint64_t v52 = *(a2 - 1);
          if (*(double *)(v51 + 8 * v50) < *(double *)(v51 + 8 * v52))
          {
            *long long v49 = v52;
            *(a2 - 1) = v50;
            uint64_t v53 = *v48;
            uint64_t v54 = *v49;
            double v55 = *(double *)(v51 + 8 * *v49);
            if (*(double *)(v51 + 8 * *v48) < v55)
            {
              *long long v48 = v54;
              *long long v49 = v53;
              uint64_t v56 = *v47;
              if (*(double *)(v51 + 8 * *v47) < v55)
              {
                v12[1] = v54;
                v12[2] = v56;
                uint64_t v57 = *v12;
                if (*(double *)(v51 + 8 * *v12) < v55)
                {
                  uint64_t *v12 = v54;
                  v12[1] = v57;
                }
              }
            }
          }
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v13 <= 191) {
      break;
    }
    if (!a4)
    {
      if (v12 == a2) {
        return result;
      }
      int64_t v68 = (v14 - 2) >> 1;
      v69 = *a3;
      int64_t v70 = v68;
      do
      {
        int64_t v71 = v70;
        if (v68 >= v70)
        {
          uint64_t v72 = (2 * v70) | 1;
          v73 = &v12[v72];
          uint64_t v74 = 2 * v70 + 2;
          uint64_t v75 = *v69;
          if (v74 < (uint64_t)v14 && *(double *)(v75 + 8 * v73[1]) < *(double *)(v75 + 8 * *v73))
          {
            ++v73;
            uint64_t v72 = 2 * v71 + 2;
          }
          v76 = &v12[v71];
          uint64_t v77 = *v76;
          double v78 = *(double *)(v75 + 8 * *v76);
          id result = *v73;
          if (v78 >= *(double *)(v75 + 8 * *v73))
          {
            do
            {
              uint64_t *v76 = result;
              v76 = v73;
              if (v68 < v72) {
                break;
              }
              uint64_t v79 = 2 * v72;
              uint64_t v72 = (2 * v72) | 1;
              v73 = &v12[v72];
              uint64_t v80 = v79 + 2;
              if (v80 < (uint64_t)v14 && *(double *)(v75 + 8 * v73[1]) < *(double *)(v75 + 8 * *v73))
              {
                ++v73;
                uint64_t v72 = v80;
              }
              id result = *v73;
            }
            while (v78 >= *(double *)(v75 + 8 * *v73));
            uint64_t *v76 = v77;
          }
        }
        int64_t v70 = v71 - 1;
      }
      while (v71);
      uint64_t v81 = (unint64_t)v13 >> 3;
      while (2)
      {
        uint64_t v82 = 0;
        uint64_t v83 = *v12;
        v84 = *a3;
        v85 = v12;
        do
        {
          v86 = v85;
          v85 += v82 + 1;
          uint64_t v87 = 2 * v82;
          uint64_t v82 = (2 * v82) | 1;
          uint64_t v88 = v87 + 2;
          if (v88 < v81)
          {
            id result = *v84;
            if (*(double *)(*v84 + 8 * v85[1]) < *(double *)(*v84 + 8 * *v85))
            {
              ++v85;
              uint64_t v82 = v88;
            }
          }
          uint64_t *v86 = *v85;
        }
        while (v82 <= (uint64_t)((unint64_t)(v81 - 2) >> 1));
        if (v85 == --a2)
        {
LABEL_108:
          uint64_t *v85 = v83;
        }
        else
        {
          uint64_t *v85 = *a2;
          *a2 = v83;
          uint64_t v89 = (char *)v85 - (char *)v12 + 8;
          if (v89 >= 9)
          {
            unint64_t v90 = (((unint64_t)v89 >> 3) - 2) >> 1;
            v91 = &v12[v90];
            uint64_t v83 = *v85;
            uint64_t v92 = *v84;
            double v93 = *(double *)(v92 + 8 * *v85);
            uint64_t v94 = *v91;
            if (v93 < *(double *)(v92 + 8 * *v91))
            {
              do
              {
                uint64_t *v85 = v94;
                v85 = v91;
                if (!v90) {
                  break;
                }
                unint64_t v90 = (v90 - 1) >> 1;
                v91 = &v12[v90];
                uint64_t v94 = *v91;
              }
              while (v93 < *(double *)(v92 + 8 * *v91));
              goto LABEL_108;
            }
          }
        }
        if (v81-- <= 2) {
          return result;
        }
        continue;
      }
    }
    unint64_t v15 = v14 >> 1;
    uint64_t v16 = &v12[v14 >> 1];
    uint64_t v17 = **a3;
    if ((unint64_t)v13 >= 0x401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v11, &v11[v14 >> 1], a2 - 1, v17);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v11 + 1, v16 - 1, a2 - 2, **a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v11 + 2, &v11[v15 + 1], a2 - 3, **a3);
      id result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v16 - 1, v16, &v11[v15 + 1], **a3);
      uint64_t v18 = *v11;
      uint64_t *v11 = *v16;
      uint64_t *v16 = v18;
    }
    else
    {
      id result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(&v11[v14 >> 1], v11, a2 - 1, v17);
    }
    --a4;
    uint64_t v19 = *v11;
    uint64_t v20 = **a3;
    if (a5)
    {
      double v21 = *(double *)(v20 + 8 * v19);
LABEL_13:
      uint64_t v22 = 0;
      do
        uint64_t v23 = v11[++v22];
      while (v21 < *(double *)(v20 + 8 * v23));
      double v24 = &v11[v22];
      id v25 = a2;
      if (v22 == 1)
      {
        id v25 = a2;
        do
        {
          if (v24 >= v25) {
            break;
          }
          uint64_t v27 = *--v25;
        }
        while (v21 >= *(double *)(v20 + 8 * v27));
      }
      else
      {
        do
          uint64_t v26 = *--v25;
        while (v21 >= *(double *)(v20 + 8 * v26));
      }
      if (v24 >= v25)
      {
        id v33 = v24 - 1;
      }
      else
      {
        uint64_t v28 = *v25;
        uint64_t v29 = &v11[v22];
        double v30 = v25;
        do
        {
          uint64_t *v29 = v28;
          uint64_t *v30 = v23;
          do
          {
            uint64_t v31 = v29[1];
            ++v29;
            uint64_t v23 = v31;
          }
          while (v21 < *(double *)(v20 + 8 * v31));
          do
          {
            uint64_t v32 = *--v30;
            uint64_t v28 = v32;
          }
          while (v21 >= *(double *)(v20 + 8 * v32));
        }
        while (v29 < v30);
        id v33 = v29 - 1;
      }
      if (v33 != v11) {
        uint64_t *v11 = *v33;
      }
      *id v33 = v19;
      if (v24 < v25) {
        goto LABEL_34;
      }
      BOOL v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v11, v33, a3);
      unint64_t v12 = v33 + 1;
      id result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v33 + 1, a2, a3);
      if (result)
      {
        a2 = v33;
        if (v34) {
          return result;
        }
        goto LABEL_2;
      }
      if (!v34)
      {
LABEL_34:
        id result = std::__introsort<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *,false>(v11, v33, a3, a4, a5 & 1);
        a5 = 0;
        unint64_t v12 = v33 + 1;
      }
    }
    else
    {
      double v21 = *(double *)(v20 + 8 * v19);
      if (v21 < *(double *)(v20 + 8 * *(v11 - 1))) {
        goto LABEL_13;
      }
      if (*(double *)(v20 + 8 * *(a2 - 1)) >= v21)
      {
        double v36 = v11 + 1;
        do
        {
          unint64_t v12 = v36;
          if (v36 >= a2) {
            break;
          }
          ++v36;
        }
        while (*(double *)(v20 + 8 * *v12) >= v21);
      }
      else
      {
        unint64_t v12 = v11;
        do
        {
          uint64_t v35 = v12[1];
          ++v12;
        }
        while (*(double *)(v20 + 8 * v35) >= v21);
      }
      long long v37 = a2;
      if (v12 < a2)
      {
        long long v37 = a2;
        do
          uint64_t v38 = *--v37;
        while (*(double *)(v20 + 8 * v38) < v21);
      }
      if (v12 < v37)
      {
        uint64_t v39 = *v12;
        uint64_t v40 = *v37;
        do
        {
          uint64_t *v12 = v40;
          *long long v37 = v39;
          do
          {
            uint64_t v41 = v12[1];
            ++v12;
            uint64_t v39 = v41;
          }
          while (*(double *)(v20 + 8 * v41) >= v21);
          do
          {
            uint64_t v42 = *--v37;
            uint64_t v40 = v42;
          }
          while (*(double *)(v20 + 8 * v42) < v21);
        }
        while (v12 < v37);
      }
      long long v43 = v12 - 1;
      BOOL v5 = v12 - 1 >= v11;
      BOOL v6 = v12 - 1 == v11;
      if (v12 - 1 != v11) {
        uint64_t *v11 = *v43;
      }
      a5 = 0;
      *long long v43 = v19;
    }
  }
  if (a5)
  {
    if (v12 != a2)
    {
      v58 = v12 + 1;
      if (v12 + 1 != a2)
      {
        uint64_t v59 = **a3;
        uint64_t v60 = 8;
        v61 = v12;
        do
        {
          uint64_t v63 = *v61;
          uint64_t v62 = v61[1];
          v61 = v58;
          double v64 = *(double *)(v59 + 8 * v62);
          if (*(double *)(v59 + 8 * v63) < v64)
          {
            uint64_t v65 = v60;
            do
            {
              *(uint64_t *)((char *)v12 + v65) = v63;
              uint64_t v66 = v65 - 8;
              if (v65 == 8)
              {
                v67 = v12;
                goto LABEL_80;
              }
              uint64_t v63 = *(uint64_t *)((char *)v12 + v65 - 16);
              v65 -= 8;
            }
            while (*(double *)(v59 + 8 * v63) < v64);
            v67 = (uint64_t *)((char *)v12 + v66);
LABEL_80:
            uint64_t *v67 = v62;
          }
          v58 = v61 + 1;
          v60 += 8;
        }
        while (v61 + 1 != a2);
      }
    }
  }
  else if (v12 != a2)
  {
    v96 = v12 + 1;
    if (v12 + 1 != a2)
    {
      uint64_t v97 = **a3;
      do
      {
        uint64_t v99 = *v11;
        uint64_t v98 = v11[1];
        uint64_t v11 = v96;
        double v100 = *(double *)(v97 + 8 * v98);
        if (*(double *)(v97 + 8 * v99) < v100)
        {
          do
          {
            uint64_t *v96 = v99;
            uint64_t v99 = *(v96 - 2);
            --v96;
          }
          while (*(double *)(v97 + 8 * v99) < v100);
          uint64_t *v96 = v98;
        }
        v96 = v11 + 1;
      }
      while (v11 + 1 != a2);
    }
  }
  return result;
}

@end