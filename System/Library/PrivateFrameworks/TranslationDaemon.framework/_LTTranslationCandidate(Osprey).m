@interface _LTTranslationCandidate(Osprey)
- (id)initWithOspreyMtResponsePhrase:()Osprey locale:censorSpeech:;
- (id)initWithOspreyMtResponsePhrase:()Osprey locale:injectingGenderTranslation:genderInjectedMetaInfo:;
- (id)initWithOspreyPhrase:()Osprey;
- (void)updateWithMetaInfoData:()Osprey;
@end

@implementation _LTTranslationCandidate(Osprey)

- (id)initWithOspreyPhrase:()Osprey
{
  id v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_270C5A260;
  id v5 = objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    [v4 confidence];
    [v5 setConfidence:v6];
    v7 = objc_msgSend(v4, "translated_tokens");
    v8 = [v7 _ltCompactMap:&__block_literal_global_28];
    [v5 setTokens:v8];

    v9 = objc_msgSend(v4, "lt_formattedString");
    [v5 setFormattedString:v9];

    v10 = objc_msgSend(v4, "meta_info_data");
    [v5 updateWithMetaInfoData:v10];

    id v11 = v5;
  }

  return v5;
}

- (id)initWithOspreyMtResponsePhrase:()Osprey locale:censorSpeech:
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = a1;
  v20.super_class = (Class)&off_270C5A260;
  id v10 = objc_msgSendSuper2(&v20, sel_init);
  if (v10)
  {
    [v8 confidence];
    [v10 setConfidence:v11];
    v12 = objc_msgSend(v8, "translation_phrase");
    [v10 setFormattedString:v12];

    if (a5)
    {
      objc_super v13 = (void *)MEMORY[0x263F1C160];
      v14 = [v10 formattedString];
      LODWORD(v13) = [v13 stringContainsRedaction:v14];

      if (v13)
      {
        v15 = [v10 formattedString];
        [v10 setSanitizedFormattedString:v15];
      }
    }
    objc_msgSend(v10, "setLowConfidence:", objc_msgSend(v8, "low_confidence"));
    v16 = objc_msgSend(v8, "meta_info_data");
    [v10 updateWithMetaInfoData:v16];

    v17 = objc_msgSend(v8, "meta_info");
    [v10 updateWithEngineMeta:v17 locale:v9];

    id v18 = v10;
  }

  return v10;
}

- (id)initWithOspreyMtResponsePhrase:()Osprey locale:injectingGenderTranslation:genderInjectedMetaInfo:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = a1;
  v19.super_class = (Class)&off_270C5A260;
  id v14 = objc_msgSendSuper2(&v19, sel_init);
  if (v14)
  {
    [v10 confidence];
    [v14 setConfidence:v15];
    [v14 setFormattedString:v12];
    objc_msgSend(v14, "setLowConfidence:", objc_msgSend(v10, "low_confidence"));
    v16 = objc_msgSend(v10, "meta_info_data");
    [v14 updateWithMetaInfoData:v16];

    [v14 updateWithEngineMeta:v13 locale:v11];
    id v17 = v14;
  }

  return v14;
}

- (void)updateWithMetaInfoData:()Osprey
{
  id v4 = a3;
  id v5 = [a1 sanitizedFormattedString];

  if (!v5)
  {
    float v6 = [v4 romanization];
    v7 = v6;
    if (v6 && [v6 length])
    {
      [a1 setRomanization:v7];
      id v8 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_LTTranslationCandidate(Osprey) updateWithMetaInfoData:](v8, a1);
      }
    }
    else
    {
      id v9 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:](v9);
      }
    }
  }
}

- (void)updateWithMetaInfoData:()Osprey .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 romanization];
  int v5 = 138739971;
  float v6 = v4;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Setting romanization from meta_info_data: %{sensitive}@", (uint8_t *)&v5, 0xCu);
}

@end