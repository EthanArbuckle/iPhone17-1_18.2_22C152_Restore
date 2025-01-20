@interface _LTDisambiguationNode(Daemon)
+ (id)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:;
+ (id)nodeFromEMTResult:()Daemon sourceText:romanization:;
+ (id)nodeFromFTSpeechTranslationPhrase:()Daemon descriptions:sourceText:censorSpeech:;
+ (id)nodeFromFTTranslationPhrase:()Daemon descriptions:sourceText:;
+ (id)nodeFromOspreyBatchPhrase:()Daemon descriptions:sourceText:;
+ (uint64_t)nodeWithText:()Daemon romanization:;
@end

@implementation _LTDisambiguationNode(Daemon)

+ (id)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (([MEMORY[0x263F1C0A8] isGenderDisambiguationEnabled] & 1) == 0)
  {
    v18 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      v19 = "Not attempting to parse disambiguation objects because the feature flag is disabled";
LABEL_22:
      _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v23, 2u);
    }
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  if (!a5)
  {
    v12 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:](v12);
      if (v9) {
        goto LABEL_5;
      }
LABEL_20:
      v18 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        v19 = "Got nil translation phrase source text; won't create _LTDisambiguationNode";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
  if (!v9) {
    goto LABEL_20;
  }
LABEL_5:
  if ([v10 count] != a5)
  {
    v13 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      int v23 = 134218240;
      uint64_t v24 = [v10 count];
      __int16 v25 = 2048;
      uint64_t v26 = a5;
      _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Only %zu out of %zu link configurations were valid; not adding any links to this disambiguable node",
        (uint8_t *)&v23,
        0x16u);
    }
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  id v15 = v11;
  v16 = v15;
  if (v15 && ![v15 length])
  {

    v20 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:](v20);
    }
    v16 = 0;
  }
  else
  {
    v17 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:]((uint64_t)v16, v17);
    }
  }
  v21 = (void *)[objc_alloc(MEMORY[0x263F1C0C0]) initWithText:v9 links:v10 romanization:v16];

LABEL_24:
  return v21;
}

+ (id)nodeFromEMTResult:()Daemon sourceText:romanization:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v8 alternativeSelectionSpans];
    v12 = [v8 tokens];
    v13 = [v12 _ltCompactMap:&__block_literal_global_8];

    v14 = [v13 componentsJoinedByString:@" "];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __75___LTDisambiguationNode_Daemon__nodeFromEMTResult_sourceText_romanization___block_invoke_2;
    int v23 = &unk_265546808;
    id v24 = v9;
    id v25 = v14;
    id v15 = v14;
    v16 = [v11 _ltCompactMap:&v20];
    v17 = objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v15, v16, objc_msgSend(v11, "count", v20, v21, v22, v23), v10);
  }
  else
  {
    v18 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[_LTDisambiguationNode(Daemon) nodeFromEMTResult:sourceText:romanization:](v18);
    }
    v17 = 0;
  }

  return v17;
}

+ (uint64_t)nodeWithText:()Daemon romanization:
{
  return [a1 _nodeWithText:a3 links:MEMORY[0x263EFFA68] numberOfSelectionSpans:0 romanization:a4];
}

+ (id)nodeFromFTSpeechTranslationPhrase:()Daemon descriptions:sourceText:censorSpeech:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  v13 = objc_msgSend(v12, "meta_info_data");
  v14 = objc_msgSend(v13, "selection_spans");

  id v15 = objc_msgSend(v12, "translation_phrase");
  v16 = objc_msgSend(v12, "meta_info_data");

  v17 = [v16 romanization];

  if (a6 && [MEMORY[0x263F1C160] stringContainsRedaction:v15])
  {
    v18 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_DEFAULT, "Removing all potential links from node because the target string appears to have redactions, and we don't currently support redactions and disambiguation in the same sentence", buf, 2u);
    }
    v19 = [a1 _nodeWithText:v15 links:MEMORY[0x263EFFA68] numberOfSelectionSpans:0 romanization:0];
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __104___LTDisambiguationNode_Daemon__nodeFromFTSpeechTranslationPhrase_descriptions_sourceText_censorSpeech___block_invoke;
    v23[3] = &unk_265546830;
    id v24 = v10;
    id v25 = v11;
    id v20 = v15;
    id v26 = v20;
    uint64_t v21 = [v14 _ltCompactMap:v23];
    v19 = objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v20, v21, objc_msgSend(v14, "count"), v17);
  }
  return v19;
}

+ (id)nodeFromFTTranslationPhrase:()Daemon descriptions:sourceText:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(v10, "meta_info_data");
  id v12 = objc_msgSend(v11, "selection_spans");

  v13 = objc_msgSend(v10, "lt_formattedString");
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85___LTDisambiguationNode_Daemon__nodeFromFTTranslationPhrase_descriptions_sourceText___block_invoke;
  v22[3] = &unk_265546830;
  id v23 = v8;
  id v24 = v9;
  id v25 = v13;
  id v14 = v13;
  id v15 = v9;
  id v16 = v8;
  v17 = [v12 _ltCompactMap:v22];
  v18 = objc_msgSend(v10, "meta_info_data");

  v19 = [v18 romanization];

  id v20 = objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v14, v17, objc_msgSend(v12, "count"), v19);

  return v20;
}

+ (id)nodeFromOspreyBatchPhrase:()Daemon descriptions:sourceText:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(v10, "meta_info_data");
  id v12 = objc_msgSend(v11, "selection_spans");

  v13 = objc_msgSend(v10, "translation_phrase");
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83___LTDisambiguationNode_Daemon__nodeFromOspreyBatchPhrase_descriptions_sourceText___block_invoke;
  v22[3] = &unk_265546830;
  id v23 = v8;
  id v24 = v9;
  id v25 = v13;
  id v14 = v13;
  id v15 = v9;
  id v16 = v8;
  v17 = [v12 _ltCompactMap:v22];
  v18 = objc_msgSend(v10, "meta_info_data");

  v19 = [v18 romanization];

  id v20 = objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v14, v17, objc_msgSend(v12, "count"), v19);

  return v20;
}

+ (void)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Setting romanization from meta_info_data: %{sensitive}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Phrase has no meta_info_data romanization", v1, 2u);
}

+ (void)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Phrase result has nil metadata for link configurations, meaning it likely isn't part of a disambiguable result; allo"
    "wing this to be a node, but this could represent an error in the translation engine",
    v1,
    2u);
}

+ (void)nodeFromEMTResult:()Daemon sourceText:romanization:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Can't create disambiguation info because the version of EmbeddedAcousticRecognition on the system is too old", v1, 2u);
}

@end