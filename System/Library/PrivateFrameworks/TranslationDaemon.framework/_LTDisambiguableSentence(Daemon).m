@interface _LTDisambiguableSentence(Daemon)
+ (id)_sentenceWithSourceString:()Daemon targetPhrases:expectedNumberOfPhrases:;
+ (id)sentenceFromFTSpeechResponse:()Daemon sourceText:censorSpeech:;
+ (id)sentenceFromOspreyBatchSentence:()Daemon;
+ (id)sentenceFromOspreyResponse:()Daemon;
@end

@implementation _LTDisambiguableSentence(Daemon)

+ (id)_sentenceWithSourceString:()Daemon targetPhrases:expectedNumberOfPhrases:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x263F1C0A8] isGenderDisambiguationEnabled])
  {
    if (!v8)
    {
      v13 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[_LTDisambiguableSentence(Daemon) _sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:]();
      }
      goto LABEL_15;
    }
    if ([v9 count] != a5)
    {
      v14 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        int v17 = 134218240;
        uint64_t v18 = [v9 count];
        __int16 v19 = 2048;
        uint64_t v20 = a5;
        _os_log_impl(&dword_2600DC000, v15, OS_LOG_TYPE_INFO, "Not creating disambiguation sentence because only %zu out of %zu candidates could create disambiguation nodes", (uint8_t *)&v17, 0x16u);
      }
      goto LABEL_15;
    }
    if (a5)
    {
      v10 = (void *)[[a1 alloc] initWithSourceText:v8 targetPhrases:v9 selectedPhraseIndex:0];
      goto LABEL_16;
    }
    v11 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v12 = "Not creating a disambiguation sentence as there are no phrases to construct a sentence from";
      goto LABEL_8;
    }
  }
  else
  {
    v11 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v12 = "Not creating disambiguation sentence because the feature flag is off";
LABEL_8:
      _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 2u);
    }
  }
LABEL_15:
  v10 = 0;
LABEL_16:

  return v10;
}

+ (id)sentenceFromFTSpeechResponse:()Daemon sourceText:censorSpeech:
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend(v8, "is_final"))
  {
    v10 = objc_msgSend(v8, "n_best_translated_phrases");
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89___LTDisambiguableSentence_Daemon__sentenceFromFTSpeechResponse_sourceText_censorSpeech___block_invoke;
    v16[3] = &unk_265546728;
    id v17 = v8;
    id v11 = v9;
    id v18 = v11;
    char v19 = a5;
    v12 = [v10 _ltCompactMap:v16];
    v13 = objc_msgSend(a1, "_sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:", v11, v12, objc_msgSend(v10, "count"));
  }
  else
  {
    v14 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[_LTDisambiguableSentence(Daemon) sentenceFromFTSpeechResponse:sourceText:censorSpeech:]();
    }
    v13 = 0;
  }

  return v13;
}

+ (id)sentenceFromOspreyResponse:()Daemon
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "n_best_translated_phrases");
  v6 = objc_msgSend(v4, "engine_input");
  if (v6)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __63___LTDisambiguableSentence_Daemon__sentenceFromOspreyResponse___block_invoke;
    v15 = &unk_265546750;
    id v16 = v4;
    id v7 = v6;
    id v17 = v7;
    id v8 = [v5 _ltCompactMap:&v12];
    id v9 = objc_msgSend(a1, "_sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:", v7, v8, objc_msgSend(v5, "count", v12, v13, v14, v15));
  }
  else
  {
    v10 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_LTDisambiguableSentence(Daemon) _sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:]();
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)sentenceFromOspreyBatchSentence:()Daemon
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "engine_input");
  if (v5)
  {
    v6 = objc_msgSend(v4, "n_best_choices");
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __68___LTDisambiguableSentence_Daemon__sentenceFromOspreyBatchSentence___block_invoke;
    v15 = &unk_265546778;
    id v16 = v4;
    id v7 = v5;
    id v17 = v7;
    id v8 = [v6 _ltCompactMap:&v12];
    id v9 = objc_msgSend(a1, "_sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:", v7, v8, objc_msgSend(v6, "count", v12, v13, v14, v15));
  }
  else
  {
    v10 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_LTDisambiguableSentence(Daemon) sentenceFromOspreyBatchSentence:]();
    }
    id v9 = 0;
  }

  return v9;
}

+ (void)_sentenceWithSourceString:()Daemon targetPhrases:expectedNumberOfPhrases:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to create disambiguable sentence from speech response because the source string is nil", v2, v3, v4, v5, v6);
}

+ (void)sentenceFromFTSpeechResponse:()Daemon sourceText:censorSpeech:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Not creating disambiguable sentence because speech response isn't final", v1, 2u);
}

+ (void)sentenceFromOspreyBatchSentence:()Daemon .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to create disambiguable sentence from speech response because the source text is nil", v2, v3, v4, v5, v6);
}

@end