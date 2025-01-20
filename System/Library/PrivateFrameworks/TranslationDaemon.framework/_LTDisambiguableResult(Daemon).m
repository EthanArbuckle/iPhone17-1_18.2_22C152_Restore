@interface _LTDisambiguableResult(Daemon)
+ (id)_resultWithSentence:()Daemon;
+ (id)_resultWithSentences:()Daemon;
+ (id)resultFromFTSpeechResponse:()Daemon sourceText:censorSpeech:;
+ (id)resultFromOspreyBatchResponse:()Daemon sourceText:;
+ (id)resultFromOspreyResponse:()Daemon;
@end

@implementation _LTDisambiguableResult(Daemon)

+ (id)_resultWithSentences:()Daemon
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (([MEMORY[0x263F1C0A8] isGenderDisambiguationEnabled] & 1) == 0)
  {
    v6 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      v7 = "Not creating disambiguation result because the feature flag is off";
LABEL_9:
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 2u);
    }
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if (![v3 count])
  {
    v6 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      v7 = "Not creating disambiguation result because there's no valid sentences in the result";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263F1C0A8]) initWithSentences:v3 joinedWithString:@" "];
  v5 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Created disambiguableResult (from Online Engine): %{public}@", (uint8_t *)&v9, 0xCu);
  }
LABEL_11:

  return v4;
}

+ (id)_resultWithSentence:()Daemon
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v9 = a3;
    v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v9 count:1];
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(a1, "_resultWithSentences:", v6, v9, v10);

  return v7;
}

+ (id)resultFromFTSpeechResponse:()Daemon sourceText:censorSpeech:
{
  v2 = objc_msgSend(MEMORY[0x263F1C0B0], "sentenceFromFTSpeechResponse:sourceText:censorSpeech:");
  id v3 = [a1 _resultWithSentence:v2];

  return v3;
}

+ (id)resultFromOspreyResponse:()Daemon
{
  v2 = objc_msgSend(MEMORY[0x263F1C0B0], "sentenceFromOspreyResponse:");
  id v3 = [a1 _resultWithSentence:v2];

  return v3;
}

+ (id)resultFromOspreyBatchResponse:()Daemon sourceText:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "translated_sentences");
  int v9 = [v8 _ltCompactMap:&__block_literal_global_6];
  if ([v8 count])
  {
    uint64_t v10 = [v8 count];
    if (v10 == [v9 count])
    {
LABEL_10:
      v22 = [a1 _resultWithSentences:v9];
      goto LABEL_14;
    }
    uint64_t v11 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      *(_DWORD *)buf = 134218240;
      uint64_t v28 = [v9 count];
      __int16 v29 = 2048;
      uint64_t v30 = [v8 count];
        buf,
        0x16u);
    }
  }
  else
  {
    v13 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
        buf,
        2u);
    }
  }
  v14 = objc_msgSend(v6, "translated_text");
  if ([v7 length] && objc_msgSend(v14, "length"))
  {
    id v15 = objc_alloc(MEMORY[0x263F1C0C0]);
    v16 = objc_msgSend(v6, "translated_text_romanized");
    v17 = (void *)[v15 initWithText:v14 links:MEMORY[0x263EFFA68] romanization:v16];

    id v18 = objc_alloc(MEMORY[0x263F1C0B0]);
    v26 = v17;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    v20 = (void *)[v18 initWithSourceText:v7 targetPhrases:v19 selectedPhraseIndex:0];

    v25 = v20;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];

    int v9 = (void *)v21;
    goto LABEL_10;
  }
  v23 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[_LTDisambiguableResult(Daemon) resultFromOspreyBatchResponse:sourceText:](v23, v7, v14);
  }

  v22 = 0;
LABEL_14:

  return v22;
}

+ (void)resultFromOspreyBatchResponse:()Daemon sourceText:.cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = [a2 length];
  __int16 v8 = 2048;
  uint64_t v9 = [a3 length];
  _os_log_error_impl(&dword_2600DC000, v5, OS_LOG_TYPE_ERROR, "Unable to create _LTDisambiguableResult from batch response since provided source or target text is empty; sourceTex"
    "t length: %zu; targetText length: %zu",
    (uint8_t *)&v6,
    0x16u);
}

@end