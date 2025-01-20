@interface _LTTranslationResult(Osprey)
- (void)initWithOspreyBatchResponse:()Osprey sourceText:;
- (void)initWithOspreyResponse:()Osprey;
- (void)initWithOspreySpeechTranslationMTResponse:()Osprey sourceText:censorSpeech:;
- (void)updateAlignmentWithSourceSpan:()Osprey targetSpan:;
@end

@implementation _LTTranslationResult(Osprey)

- (void)initWithOspreySpeechTranslationMTResponse:()Osprey sourceText:censorSpeech:
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[a1 init];
  v11 = v10;
  if (v10)
  {
    [v10 setRoute:2];
    v12 = objc_msgSend(v8, "translation_locale_pair");
    v13 = objc_msgSend(v12, "target_locale");

    v14 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v13];
    [v11 setLocale:v14];

    v15 = objc_msgSend(v8, "n_best_translated_phrases");
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __98___LTTranslationResult_Osprey__initWithOspreySpeechTranslationMTResponse_sourceText_censorSpeech___block_invoke;
    v25 = &unk_2655482C0;
    id v16 = v11;
    id v26 = v16;
    char v27 = a5;
    v17 = [v15 _ltCompactMap:&v22];
    objc_msgSend(v16, "setTranslations:", v17, v22, v23, v24, v25);
    v18 = objc_msgSend(v8, "request_id");
    [v16 setIdentifier:v18];

    objc_msgSend(v16, "setIsFinal:", objc_msgSend(v8, "is_final"));
    v19 = [MEMORY[0x263F1C0A8] resultFromFTSpeechResponse:v8 sourceText:v9 censorSpeech:a5];
    [v16 setDisambiguableResult:v19];

    id v20 = v16;
  }

  return v11;
}

- (void)initWithOspreyResponse:()Osprey
{
  id v4 = a3;
  v5 = (void *)[a1 init];
  v6 = v5;
  if (v5)
  {
    [v5 setRoute:2];
    v7 = objc_msgSend(v4, "n_best_translated_phrases");
    id v8 = [v7 _ltCompactMap:&__block_literal_global_29];
    [v6 setTranslations:v8];

    id v9 = [MEMORY[0x263F1C0A8] resultFromOspreyResponse:v4];
    [v6 setDisambiguableResult:v9];

    id v10 = v6;
  }

  return v6;
}

- (void)initWithOspreyBatchResponse:()Osprey sourceText:
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[a1 init];
  id v9 = v8;
  if (v8)
  {
    [v8 setRoute:2];
    id v10 = objc_msgSend(v6, "translated_text_romanized");
    if (![v10 length])
    {

      id v10 = 0;
    }
    id v11 = objc_alloc(MEMORY[0x263F1C170]);
    v12 = objc_msgSend(v6, "translated_text");
    v13 = (void *)[v11 initWithFormattedString:v12 sanitizedFormattedString:0 confidence:0 lowConfidence:v10 romanization:0 tokens:0 preToPostITN:1.0];

    v18[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    [v9 setTranslations:v14];

    v15 = [MEMORY[0x263F1C0A8] resultFromOspreyBatchResponse:v6 sourceText:v7];
    [v9 setDisambiguableResult:v15];

    id v16 = v9;
  }

  return v9;
}

- (void)updateAlignmentWithSourceSpan:()Osprey targetSpan:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  v28 = a1;
  id v9 = [a1 translations];
  id v10 = [v9 firstObject];
  id v11 = [v10 formattedString];

  if ([v7 count])
  {
    unint64_t v12 = 0;
    v29 = v7;
    id v30 = v6;
    do
    {
      if (v12 >= [v6 count]) {
        break;
      }
      v13 = [v6 objectAtIndexedSubscript:v12];
      unint64_t v32 = v12;
      v14 = [v7 objectAtIndexedSubscript:v12];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v31 = v14;
      id obj = [v14 span];
      uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v35;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
            id v20 = objc_alloc_init(MEMORY[0x263F1C098]);
            v21 = [v13 identifier];
            [v20 setIdentifier:v21];

            uint64_t v22 = [v13 range];
            objc_msgSend(v20, "setSourceRange:", v22, v23);
            uint64_t v24 = objc_msgSend(v11, "lt_codeUnitsRangeFromCodePointsRange:", (int)objc_msgSend(v19, "start_index"), (int)(objc_msgSend(v19, "end_index") - objc_msgSend(v19, "start_index") + 1));
            uint64_t v26 = v25;
            objc_msgSend(v20, "setTargetRange:", v24, v25);
            char v27 = objc_msgSend(v11, "substringWithRange:", v24, v26);
            [v20 setText:v27];

            objc_msgSend(v20, "setShouldTranslate:", objc_msgSend(v19, "do_not_translate") ^ 1);
            [v8 addObject:v20];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v16);
      }

      unint64_t v12 = v32 + 1;
      id v7 = v29;
      id v6 = v30;
    }
    while (v32 + 1 < [v29 count]);
  }
  [v8 sortUsingComparator:&__block_literal_global_19_1];
  [v28 setAlignments:v8];
}

@end