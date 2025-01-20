@interface _LTLanguageDetectionResult(Daemon)
- (id)initWithConfidences:()Daemon isConfident:dominantLanguage:isFinal:;
@end

@implementation _LTLanguageDetectionResult(Daemon)

- (id)initWithConfidences:()Daemon isConfident:dominantLanguage:isFinal:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v33.receiver = a1;
  v33.super_class = (Class)&off_270C58570;
  id v12 = objc_msgSendSuper2(&v33, sel_init);
  if (v12)
  {
    v13 = (void *)[v10 copy];
    [v12 setConfidences:v13];

    [v12 setIsConfident:a4];
    [v12 setDominantLanguage:v11];
    [v12 setIsFinal:a6];
    v14 = [v12 dominantLanguage];

    if (!v14)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v15 = objc_msgSend(v10, "allKeys", 0);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v18 = 0;
        uint64_t v19 = *(void *)v30;
        double v20 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v15);
            }
            v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v23 = [v10 objectForKeyedSubscript:v22];
            [v23 doubleValue];
            double v25 = v24;

            if (v25 > v20)
            {
              id v26 = v22;

              v18 = v26;
              double v20 = v25;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      [v12 setDominantLanguage:v18];
    }
    id v27 = v12;
  }

  return v12;
}

@end