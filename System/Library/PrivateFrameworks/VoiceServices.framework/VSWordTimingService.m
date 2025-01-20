@interface VSWordTimingService
- (NSDictionary)wordTimings;
- (id)estimatedTTSWordTimingForText:(id)a3 withLanguage:(id)a4 voiceName:(id)a5;
- (id)timingInfosFrom:(id)a3 withText:(id)a4;
- (id)timingPlistForLanguage:(id)a3;
- (void)setWordTimings:(id)a3;
@end

@implementation VSWordTimingService

- (void).cxx_destruct
{
}

- (void)setWordTimings:(id)a3
{
}

- (NSDictionary)wordTimings
{
  return self->_wordTimings;
}

- (id)estimatedTTSWordTimingForText:(id)a3 withLanguage:(id)a4 voiceName:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [(VSWordTimingService *)self timingPlistForLanguage:a4];
  if (v10)
  {
    id v11 = v9;
    if (!v11
      || ([v10 objectForKeyedSubscript:v11],
          v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      v13 = [v10 allKeys];
      uint64_t v14 = [v13 firstObject];

      id v11 = (id)v14;
    }
    v15 = [v10 objectForKeyedSubscript:v11];
    v16 = [v15 objectForKey:v8];
    if (v16)
    {
      v17 = [(VSWordTimingService *)self timingInfosFrom:v16 withText:v8];
      if (v17)
      {
        v18 = VSGetLogDefault();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412546;
          id v21 = v11;
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEFAULT, "Found prepared word timing info for voice '%@', text: '%@'", (uint8_t *)&v20, 0x16u);
        }
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)timingPlistForLanguage:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 pathForResource:v4 ofType:@"plist" inDirectory:@"TTSWordTimings"];

  v7 = [NSDictionary dictionaryWithContentsOfFile:v6];

  return v7;
}

- (id)timingInfosFrom:(id)a3 withText:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF980] array];
  v31 = v5;
  [v5 objectForKeyedSubscript:@"word_timings"];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v33 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v13 = [v7 lastObject];
        uint64_t v14 = [v12 allKeys];
        v15 = [v14 firstObject];

        unint64_t v16 = objc_msgSend(v6, "rangeOfString:options:range:", v15, 0, v10, objc_msgSend(v6, "length") - v10);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = VSGetLogDefault();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = v15;
            __int16 v40 = 2112;
            id v41 = v6;
            _os_log_error_impl(&dword_20CABC000, v29, OS_LOG_TYPE_ERROR, "Unable to locate word '%@' in '%@'", buf, 0x16u);
          }

          id v28 = 0;
          v25 = obj;
          v27 = obj;
          goto LABEL_17;
        }
        unint64_t v18 = v16;
        uint64_t v19 = v17;
        if (v10 < v16) {
          objc_msgSend(v13, "setTextRange:", objc_msgSend(v13, "textRange"), v16 - objc_msgSend(v13, "textRange"));
        }
        int v20 = [v12 allValues];
        id v21 = [v20 firstObject];
        [v21 doubleValue];
        double v23 = v22;

        uint64_t v24 = objc_alloc_init(VSSpeechWordTimingInfo);
        -[VSSpeechWordTimingInfo setTextRange:](v24, "setTextRange:", v18, v19);
        [(VSSpeechWordTimingInfo *)v24 setStartTime:v23];
        [v7 addObject:v24];
        unint64_t v10 = v18 + v19;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  v25 = obj;

  v26 = [v7 lastObject];
  v27 = v26;
  if (v26) {
    objc_msgSend(v26, "setTextRange:", objc_msgSend(v26, "textRange"), objc_msgSend(v6, "length") - objc_msgSend(v26, "textRange"));
  }
  id v28 = v7;
LABEL_17:

  return v28;
}

@end