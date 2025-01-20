@interface _LTTranslationCandidate(Daemon)
- (void)initWithFormattedString:()Daemon sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:;
- (void)updateWithEngineMeta:()Daemon locale:;
@end

@implementation _LTTranslationCandidate(Daemon)

- (void)initWithFormattedString:()Daemon sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v25.receiver = a1;
  v25.super_class = (Class)&off_270C5A260;
  id v21 = objc_msgSendSuper2(&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    [v21 setFormattedString:v16];
    [v22 setSanitizedFormattedString:v17];
    [v22 setConfidence:a2];
    [v22 setLowConfidence:a6];
    [v22 setPreToPostITN:v20];
    [v22 setTokens:v19];
    [v22 setRomanization:v18];
    id v23 = v22;
  }

  return v22;
}

- (void)updateWithEngineMeta:()Daemon locale:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v8 = [v6 dataUsingEncoding:4];
    id v29 = 0;
    v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v29];
    id v10 = v29;
    v11 = _LTOSLogTranslationEngine();
    v12 = v11;
    if (!v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_LTTranslationCandidate(Daemon) updateWithEngineMeta:locale:]((uint64_t)v10, v12);
      }
      goto LABEL_26;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_LTTranslationCandidate(Daemon) updateWithEngineMeta:locale:]((uint64_t)v9, v12);
    }
    v13 = [MEMORY[0x263F1C1A8] statisticsWithEngineMeta:v9 locale:v7];
    [a1 setStatistics:v13];

    v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v15 = [v14 BOOLForKey:@"DisambiguationEnabled"];

    if ((v15 & 1) == 0)
    {
      id v18 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_INFO, "Skipping loading sense data from meta because it's disabled in user defaults", v28, 2u);
      }
      [a1 setSenses:0];
      goto LABEL_26;
    }
    id v16 = [v9 objectForKeyedSubscript:@"senses"];
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x263F1C198] sensesFromArray:v16];
    }
    else
    {
      id v19 = [v9 objectForKeyedSubscript:@"status"];
      int v20 = [v19 isEqualToString:@"phrasebook_exact"];

      if (!v20)
      {
LABEL_16:
        v22 = [v9 objectForKeyedSubscript:@"gender_alternatives"];
        if (v22)
        {
          id v23 = [MEMORY[0x263F1C180] genderAlternativesFromDictionary:v22];
          [a1 setGenderAlternatives:v23];
        }
        v24 = [v9 objectForKeyedSubscript:@"romanization"];
        objc_super v25 = [a1 sanitizedFormattedString];
        if (!v25 && v24 && [v24 length])
        {
          v26 = [a1 romanization];

          if (!v26)
          {
            [a1 setRomanization:v24];
            v27 = _LTOSLogTranslationEngine();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              -[_LTTranslationCandidate(Daemon) updateWithEngineMeta:locale:](v27, a1);
            }
          }
        }
        else
        {
        }
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v17 = [MEMORY[0x263F1C198] senseWithPhrasebookMatchMeta:v9];
    }
    id v21 = (void *)v17;
    [a1 setSenses:v17];

    goto LABEL_16;
  }
LABEL_27:
}

- (void)updateWithEngineMeta:()Daemon locale:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Skipping meta, failed to parse as JSON: %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateWithEngineMeta:()Daemon locale:.cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 romanization];
  int v5 = 138739971;
  id v6 = v4;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Setting romanization from meta JSON string: %{sensitive}@", (uint8_t *)&v5, 0xCu);
}

- (void)updateWithEngineMeta:()Daemon locale:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Translation candidate meta: %@", (uint8_t *)&v2, 0xCu);
}

@end