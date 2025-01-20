@interface _LTSpeechRecognitionResult(Daemon)
+ (id)emptyResultWithLocale:()Daemon isFinal:;
+ (id)resultWithPackage:()Daemon locale:modelVersion:isFinal:;
+ (id)resultWithResult:()Daemon locale:modelVersion:isFinal:;
- (id)_transcriptionWithResult:()Daemon locale:;
- (void)initEmptyResultWithLocale:()Daemon isFinal:;
- (void)initWithPackage:()Daemon locale:modelVersion:isFinal:;
- (void)initWithResult:()Daemon locale:modelVersion:isFinal:;
@end

@implementation _LTSpeechRecognitionResult(Daemon)

- (void)initWithPackage:()Daemon locale:modelVersion:isFinal:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = a1;
  v33.super_class = (Class)&off_270C59048;
  id v13 = objc_msgSendSuper2(&v33, sel_init);
  v14 = v13;
  if (v13)
  {
    [v13 setLocale:v11];
    [v14 setFinal:a6];
    [v14 setStable:1];
    [v14 setModelVersion:v12];
    v15 = [MEMORY[0x263EFF980] array];
    [v14 setTranscriptions:v15];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v16 = objc_msgSend(v10, "nBestResults", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [v14 _transcriptionWithResult:*(void *)(*((void *)&v29 + 1) + 8 * v20) locale:v11];
          [v15 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v18);
    }

    uint64_t v22 = _LTPreferencesOfflineASRWordLevelConfidenceThreshold(v11, v12);
    v23 = _LTOSLogSpeech();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[_LTSpeechRecognitionResult(Daemon) initWithPackage:locale:modelVersion:isFinal:](v23, v11, v22);
    }
    id v24 = objc_alloc(MEMORY[0x263F1C138]);
    v25 = [v10 recognition];
    v26 = (void *)[v24 initWithRecognition:v25 wordConfidenceThreshold:v22];
    [v14 setBestRecognitionAlternatives:v26];

    id v27 = v14;
  }

  return v14;
}

- (void)initWithResult:()Daemon locale:modelVersion:isFinal:
{
  v20[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = a1;
  v19.super_class = (Class)&off_270C59048;
  id v13 = objc_msgSendSuper2(&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    [v13 setLocale:v11];
    [v14 setFinal:a6];
    [v14 setStable:1];
    [v14 setModelVersion:v12];
    v15 = [v14 _transcriptionWithResult:v10 locale:v11];
    v20[0] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [v14 setTranscriptions:v16];

    id v17 = v14;
  }

  return v14;
}

- (void)initEmptyResultWithLocale:()Daemon isFinal:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_270C59048;
  id v7 = objc_msgSendSuper2(&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    [v7 setFinal:a4];
    [v8 setStable:1];
    [v8 setLocale:v6];
    v9 = (void *)[objc_alloc(MEMORY[0x263F1C148]) initWithFormattedString:&stru_270C008E8 locale:v6 confidence:0.0 minConfidence:0.0 maxConfidence:0.0];
    v14[0] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v8 setTranscriptions:v10];

    id v11 = v8;
  }

  return v8;
}

+ (id)resultWithPackage:()Daemon locale:modelVersion:isFinal:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  objc_super v13 = (void *)[[a1 alloc] initWithPackage:v12 locale:v11 modelVersion:v10 isFinal:a6];

  return v13;
}

+ (id)resultWithResult:()Daemon locale:modelVersion:isFinal:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  objc_super v13 = (void *)[[a1 alloc] initWithResult:v12 locale:v11 modelVersion:v10 isFinal:a6];

  return v13;
}

+ (id)emptyResultWithLocale:()Daemon isFinal:
{
  id v6 = a3;
  id v7 = (void *)[[a1 alloc] initEmptyResultWithLocale:v6 isFinal:a4];

  return v7;
}

- (id)_transcriptionWithResult:()Daemon locale:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F089D8] string];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v8 = [v5 tokens];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    double v12 = 0.0;
    double v13 = 1000.0;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v16 confidence];
        double v18 = v17;
        [v16 confidence];
        if (v13 >= v19) {
          double v13 = v19;
        }
        [v16 confidence];
        if (v12 < v20) {
          double v12 = v20;
        }
        v21 = [v16 tokenName];
        [v7 appendString:v21];

        if ([v16 hasSpaceAfter]) {
          [v7 appendString:@" "];
        }
        double v14 = v14 + v18;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
    double v13 = 1000.0;
    double v14 = 0.0;
  }

  uint64_t v22 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v23 = [v7 stringByTrimmingCharactersInSet:v22];

  if ([a1 isFinal])
  {
    id v24 = [v5 tokens];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      v26 = [v5 tokens];
      double v27 = v14 / (double)(unint64_t)[v26 count];
    }
    else
    {
      double v12 = 0.0;
      double v13 = 0.0;
      double v27 = 0.0;
    }
  }
  else
  {
    [v5 confidence];
    double v27 = v28;
  }
  long long v29 = (void *)[objc_alloc(MEMORY[0x263F1C148]) initWithFormattedString:v23 locale:v6 confidence:v27 minConfidence:v13 maxConfidence:v12];

  return v29;
}

- (void)initWithPackage:()Daemon locale:modelVersion:isFinal:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = [a2 localeIdentifier];
  int v7 = 134218242;
  uint64_t v8 = a3;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEBUG, "Sausage conf %zd for locale %{public}@", (uint8_t *)&v7, 0x16u);
}

@end