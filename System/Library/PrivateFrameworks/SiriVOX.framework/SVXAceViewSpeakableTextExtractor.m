@interface SVXAceViewSpeakableTextExtractor
- (BOOL)hasSpeakableTexts:(id)a3;
- (id)_speakableTextFromDisambiguationList:(id)a3;
- (id)extractWithAceView:(id)a3;
@end

@implementation SVXAceViewSpeakableTextExtractor

- (id)_speakableTextFromDisambiguationList:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 items];
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v6 = [v4 count];
  v24 = [v3 speakableDelimiter];
  v7 = (os_log_t *)MEMORY[0x263F28348];
  v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:]";
    __int16 v27 = 2112;
    unint64_t v28 = (unint64_t)v24;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s speakableDelimiter = %@", buf, 0x16u);
  }
  v23 = v3;
  v9 = [v3 speakableFinalDelimiter];
  v10 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:]";
    __int16 v27 = 2112;
    unint64_t v28 = (unint64_t)v9;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s speakableFinalDelimiter = %@", buf, 0x16u);
  }
  if ([v4 count])
  {
    char v12 = 0;
    unint64_t v13 = 0;
    uint64_t v14 = v6 - 1;
    *(void *)&long long v11 = 136315650;
    long long v22 = v11;
    do
    {
      v15 = objc_msgSend(v4, "objectAtIndexedSubscript:", v13, v22);
      v16 = [v15 speakableText];
      v17 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v22;
        v26 = "-[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:]";
        __int16 v27 = 2048;
        unint64_t v28 = v13;
        __int16 v29 = 2112;
        v30 = v16;
        _os_log_debug_impl(&dword_220062000, v17, OS_LOG_TYPE_DEBUG, "%s disambiguationListItems[%tu].speakableText = %@", buf, 0x20u);
      }
      if (![v16 length]) {
        goto LABEL_17;
      }
      if (v12)
      {
        if (v14 == v13)
        {
          uint64_t v18 = [v9 length];
          v19 = v9;
          if (!v18) {
            goto LABEL_16;
          }
LABEL_15:
          [v5 appendString:v19];
          goto LABEL_16;
        }
        uint64_t v20 = [v24 length];
        v19 = v24;
        if (v20) {
          goto LABEL_15;
        }
      }
LABEL_16:
      [v5 appendString:v16];
      char v12 = 1;
LABEL_17:

      ++v13;
    }
    while (v13 < [v4 count]);
  }

  return v5;
}

- (id)extractWithAceView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v6 = v4;
    v7 = [v6 speakableText];
    v8 = (os_log_t *)MEMORY[0x263F28348];
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "-[SVXAceViewSpeakableTextExtractor extractWithAceView:]";
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s speakablePrefix = %@", (uint8_t *)&v14, 0x16u);
    }
    if ([v7 length]) {
      [v5 appendString:v7];
    }
    v10 = [(SVXAceViewSpeakableTextExtractor *)self _speakableTextFromDisambiguationList:v6];
    [v5 appendString:v10];

    long long v11 = [v6 speakableSuffix];
    char v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "-[SVXAceViewSpeakableTextExtractor extractWithAceView:]";
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_220062000, v12, OS_LOG_TYPE_DEBUG, "%s speakableSuffix = %@", (uint8_t *)&v14, 0x16u);
    }
    if ([v11 length]) {
      [v5 appendString:v11];
    }
  }
  else
  {
    id v5 = [v4 speakableText];
  }

  return v5;
}

- (BOOL)hasSpeakableTexts:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(a3, "views", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [(SVXAceViewSpeakableTextExtractor *)self extractWithAceView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        uint64_t v10 = [v9 length];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

@end