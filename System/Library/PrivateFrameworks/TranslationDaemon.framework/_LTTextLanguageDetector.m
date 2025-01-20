@interface _LTTextLanguageDetector
- (NSArray)availableLocales;
- (_LTTextLanguageDetector)init;
- (_LTTextLanguageDetector)initWithModel:(unint64_t)a3;
- (id)_mapSupportedLocales:(id)a3;
- (id)detectionForString:(id)a3;
- (id)detectionForStrings:(id)a3;
- (id)detectionForStrings:(id)a3 strategy:(unint64_t)a4;
- (void)setAvailableLocales:(id)a3;
@end

@implementation _LTTextLanguageDetector

- (_LTTextLanguageDetector)init
{
  v3.receiver = self;
  v3.super_class = (Class)_LTTextLanguageDetector;
  result = [(_LTTextLanguageDetector *)&v3 init];
  if (result) {
    return [(_LTTextLanguageDetector *)result initWithModel:0];
  }
  return result;
}

- (_LTTextLanguageDetector)initWithModel:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_LTTextLanguageDetector;
  v4 = [(_LTTextLanguageDetector *)&v15 init];
  if (v4)
  {
    if (a3 != 2
      && (a3
       || ([MEMORY[0x263EFFA40] standardUserDefaults],
           v5 = objc_claimAutoreleasedReturnValue(),
           int v6 = [v5 BOOLForKey:@"TextLIDUseLSTM"],
           v5,
           v6)))
    {
      v7 = _LTOSLogLID();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_DEFAULT, "Using LSTM text lid engine", v14, 2u);
      }
      v8 = (objc_class *)MEMORY[0x263F14018];
    }
    else
    {
      v9 = _LTOSLogLID();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_DEFAULT, "Using CFRO text lid engine", v14, 2u);
      }
      v8 = (objc_class *)MEMORY[0x263F13FE8];
    }
    v10 = (NLLanguageRecognizer *)objc_alloc_init(v8);
    recognizer = v4->_recognizer;
    v4->_recognizer = v10;

    v12 = v4;
  }

  return v4;
}

- (id)detectionForString:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _LTOSLogLID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_LTTextLanguageDetector detectionForString:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  [(NLLanguageRecognizer *)self->_recognizer reset];
  [(NLLanguageRecognizer *)self->_recognizer processString:v4];
  v13 = [(NLLanguageRecognizer *)self->_recognizer dominantLanguage];
  v14 = _LTOSLogLID();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v13;
    _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Dominant language: %{public}@", buf, 0xCu);
  }
  objc_super v15 = [(NLLanguageRecognizer *)self->_recognizer languageHypothesesWithMaximum:4];
  v16 = _LTOSLogLID();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v15;
    _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Language confidences: %{public}@", buf, 0xCu);
  }
  v17 = [(_LTTextLanguageDetector *)self availableLocales];
  v18 = _LTLanguageCodeToSupportedLocale();

  v19 = _LTOSLogLID();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v18;
    _os_log_impl(&dword_2600DC000, v19, OS_LOG_TYPE_INFO, "Mapped language: %{public}@", buf, 0xCu);
  }
  if (v18)
  {
    v33 = v18;
    v34 = v13;
    id v35 = v4;
    v20 = [MEMORY[0x263EFF9A0] dictionary];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v21 = [v15 allKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v27 = [(_LTTextLanguageDetector *)self availableLocales];
          v28 = _LTLanguageCodeToSupportedLocale();

          if (v28)
          {
            v29 = [v15 objectForKeyedSubscript:v26];
            [v20 setObject:v29 forKeyedSubscript:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v23);
    }

    v30 = (void *)[objc_alloc(MEMORY[0x263F1C0D0]) initWithConfidences:v20 isConfident:1 dominantLanguage:0 isFinal:1];
    v18 = v33;
    [v30 setDominantLanguage:v33];

    v13 = v34;
    id v4 = v35;
  }
  else
  {
    v31 = _LTOSLogLID();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      [(_LTTextLanguageDetector *)(uint64_t)v13 detectionForString:self];
    }
    v30 = 0;
  }

  return v30;
}

- (id)detectionForStrings:(id)a3
{
  return [(_LTTextLanguageDetector *)self detectionForStrings:a3 strategy:0];
}

- (id)detectionForStrings:(id)a3 strategy:(unint64_t)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _LTOSLogLID();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_LTTextLanguageDetector detectionForStrings:strategy:].cold.4(v7, v6, a4);
  }
  if (a4 == 1)
  {
    uint64_t v8 = [_LTTextLanguageDetectorScorer alloc];
    uint64_t v9 = [(_LTTextLanguageDetector *)self availableLocales];
    uint64_t v10 = [(_LTTextLanguageDetectorScorer *)v8 initWithSupportedLocales:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v12 = [v11 BOOLForKey:@"TextLIDAggregateEvaluation"];

  v13 = _LTOSLogLID();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      -[_LTTextLanguageDetector detectionForStrings:strategy:](v13, v15, v16, v17, v18, v19, v20, v21);
    }
    [(NLLanguageRecognizer *)self->_recognizer reset];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v22 = v6;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v63 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          [(NLLanguageRecognizer *)self->_recognizer processString:v27];
          [(_LTTextLanguageDetectorScorer *)v10 append:v27 recognizer:self->_recognizer];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v24);
    }

    id v28 = [(NLLanguageRecognizer *)self->_recognizer dominantLanguage];
    if (!v28) {
      id v28 = (id)*MEMORY[0x263F1C200];
    }
    id v29 = objc_alloc(MEMORY[0x263F1C150]);
    v30 = v29;
    if (a4 == 1)
    {
      v31 = (void *)[v29 initWithScorer:v10];
      goto LABEL_44;
    }
    v49 = (void *)MEMORY[0x263F08760];
    id v67 = v28;
    id v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
    v50 = [v49 setWithArray:v48];
    v51 = [(_LTTextLanguageDetector *)self availableLocales];
    v31 = (void *)[v30 initWithDetectionCounts:v50 availableLocales:v51 lowConfidenceLocales:0 strategy:a4];
  }
  else
  {
    unint64_t v56 = a4;
    if (v14) {
      -[_LTTextLanguageDetector detectionForStrings:strategy:](v13, v15, v16, v17, v18, v19, v20, v21);
    }
    id v28 = objc_alloc_init(MEMORY[0x263F08760]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v57 = v6;
    id v32 = v6;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v59;
      long long v36 = (void *)*MEMORY[0x263F1C200];
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v59 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * j);
          [(NLLanguageRecognizer *)self->_recognizer reset];
          [(NLLanguageRecognizer *)self->_recognizer processString:v38];
          id v39 = [(NLLanguageRecognizer *)self->_recognizer dominantLanguage];
          if (!v39) {
            id v39 = v36;
          }
          [v28 addObject:v39];
          [(_LTTextLanguageDetectorScorer *)v10 append:v38 recognizer:self->_recognizer];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v34);
    }

    if ([v32 count] == 1)
    {
      v40 = [(NLLanguageRecognizer *)self->_recognizer languageHypothesesWithMaximum:10];
      v41 = _LTOSLogLID();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[_LTTextLanguageDetector detectionForStrings:strategy:]((uint64_t)v40, v41);
      }
      v42 = [(NLLanguageRecognizer *)self->_recognizer dominantLanguage];
      uint64_t v43 = [v40 objectForKeyedSubscript:v42];
      v44 = [v40 keysSortedByValueUsingComparator:&__block_literal_global_27];
      v45 = [(_LTTextLanguageDetector *)self _mapSupportedLocales:v44];
      double v46 = _LTPreferencesTextLIDScorerConfidenceThreshold();
      [v43 doubleValue];
      if (v47 >= v46) {
        id v48 = 0;
      }
      else {
        id v48 = v45;
      }
    }
    else
    {
      id v48 = 0;
    }
    id v52 = objc_alloc(MEMORY[0x263F1C150]);
    v53 = v52;
    id v6 = v57;
    if (v56 == 1)
    {
      v31 = (void *)[v52 initWithScorer:v10];
    }
    else
    {
      v54 = [(_LTTextLanguageDetector *)self availableLocales];
      v31 = (void *)[v53 initWithDetectionCounts:v28 availableLocales:v54 lowConfidenceLocales:v48 strategy:v56];
    }
  }

LABEL_44:
  return v31;
}

- (id)_mapSupportedLocales:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48___LTTextLanguageDetector__mapSupportedLocales___block_invoke;
  v5[3] = &unk_2655481F0;
  v5[4] = self;
  objc_super v3 = [a3 _ltCompactMap:v5];
  return v3;
}

- (NSArray)availableLocales
{
  return self->_availableLocales;
}

- (void)setAvailableLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLocales, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)detectionForString:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = a2;
  id v6 = [a3 availableLocales];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2600DC000, v5, OS_LOG_TYPE_ERROR, "Could not find locale for %{public}@ in available: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)detectionForString:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)detectionForStrings:(uint64_t)a3 strategy:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)detectionForStrings:(uint64_t)a1 strategy:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Language confidences: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)detectionForStrings:(uint64_t)a3 strategy:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)detectionForStrings:(unint64_t)a3 strategy:.cold.4(void *a1, void *a2, unint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = a1;
  uint64_t v6 = [a2 count];
  if (a3 > 2) {
    int v7 = @"undefined";
  }
  else {
    int v7 = off_265548210[a3];
  }
  int v8 = 134218242;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEBUG, "Detection for %zd string array using strategy: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end