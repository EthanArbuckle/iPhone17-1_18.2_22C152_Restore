@interface _LTSpeechRecognitionResult(Osprey)
- (void)initWithOspreyPartialRecognitionResponse:()Osprey isSanitized:;
- (void)initWithOspreyResponse:()Osprey confidenceThreshold:isSanitized:;
@end

@implementation _LTSpeechRecognitionResult(Osprey)

- (void)initWithOspreyResponse:()Osprey confidenceThreshold:isSanitized:
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v44.receiver = a1;
  v44.super_class = (Class)&off_270C59048;
  id v9 = objc_msgSendSuper2(&v44, sel_init);
  v10 = v9;
  if (v9)
  {
    [v9 setFinal:1];
    [v10 setStable:1];
    v11 = (void *)MEMORY[0x263EFF960];
    v12 = objc_msgSend(v8, "source_locale");
    v13 = [v11 localeWithLocaleIdentifier:v12];
    [v10 setLocale:v13];

    [v10 setModelVersion:0];
    v14 = objc_msgSend(v8, "recognition_result");
    v15 = objc_msgSend(v14, "post_itn");
    v16 = objc_msgSend(v8, "recognition_text");
    int v17 = [v16 containsString:@"*"];
    v18 = [MEMORY[0x263EFF980] array];
    if (a5 && v17)
    {
      v19 = objc_msgSend(v14, "post_itn_nbest_choices");
      v20 = [v19 firstObject];

      if (v20)
      {
        v21 = (void *)[objc_alloc(MEMORY[0x263F1C148]) initWithRecognitionChoice:v20 inSausage:v15];
        v22 = [v10 locale];
        [v21 setLocale:v22];

        [v21 confidence];
        [v21 setLowConfidence:v23 <= (double)a4];
        [v21 setSanitizedFormattedString:v16];
        [v18 addObject:v21];
      }
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v20 = objc_msgSend(v14, "post_itn_nbest_choices");
      uint64_t v24 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        v38 = v16;
        id v39 = v8;
        uint64_t v26 = *(void *)v41;
        double v27 = (double)a4;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v41 != v26) {
              objc_enumerationMutation(v20);
            }
            v29 = (void *)[objc_alloc(MEMORY[0x263F1C148]) initWithRecognitionChoice:*(void *)(*((void *)&v40 + 1) + 8 * i) inSausage:v15];
            v30 = [v10 locale];
            [v29 setLocale:v30];

            [v29 confidence];
            [v29 setLowConfidence:v31 <= v27];
            [v18 addObject:v29];
          }
          uint64_t v25 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v25);
        id v8 = v39;
        v16 = v38;
      }
    }

    [v10 setTranscriptions:v18];
    id v32 = objc_alloc(MEMORY[0x263F1C138]);
    v33 = objc_msgSend(v14, "post_itn_nbest_choices");
    v34 = [v10 locale];
    v35 = (void *)[v32 initWithOspreySausage:v15 choices:v33 locale:v34];
    [v10 setBestRecognitionAlternatives:v35];

    id v36 = v10;
  }

  return v10;
}

- (void)initWithOspreyPartialRecognitionResponse:()Osprey isSanitized:
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v20.receiver = a1;
  v20.super_class = (Class)&off_270C59048;
  id v7 = objc_msgSendSuper2(&v20, sel_init);
  id v8 = v7;
  if (v7)
  {
    [v7 setFinal:0];
    objc_msgSend(v8, "setStable:", objc_msgSend(v6, "is_stable_result"));
    id v9 = (void *)MEMORY[0x263EFF960];
    v10 = objc_msgSend(v6, "source_locale");
    v11 = [v9 localeWithLocaleIdentifier:v10];

    [v8 setLocale:v11];
    [v8 setModelVersion:0];
    id v12 = objc_alloc_init(MEMORY[0x263F1C148]);
    [v12 setLocale:v11];
    v13 = objc_msgSend(v6, "recognition_text");
    [v12 setFormattedString:v13];

    if (a4)
    {
      v14 = [v12 formattedString];
      int v15 = [v14 containsString:@"*"];

      if (v15)
      {
        v16 = [v12 formattedString];
        [v12 setSanitizedFormattedString:v16];
      }
    }
    objc_msgSend(v12, "setConfidence:", (double)(int)objc_msgSend(v6, "confidence"));
    [v12 setMinConfidence:0.0];
    [v12 setMaxConfidence:0.0];
    [v12 setLowConfidence:0];
    v21[0] = v12;
    int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    [v8 setTranscriptions:v17];

    id v18 = v8;
  }

  return v8;
}

@end