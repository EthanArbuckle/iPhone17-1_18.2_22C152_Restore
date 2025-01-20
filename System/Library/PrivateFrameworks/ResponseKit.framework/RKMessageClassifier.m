@interface RKMessageClassifier
+ (BOOL)questionClassification:(id)a3 withLanguageIdentifier:(id)a4;
+ (id)messageClassification:(id)a3 withLanguageIdentifier:(id)a4;
+ (id)messageClassification:(id)a3 withLanguageIdentifier:(id)a4 conversationTurns:(id)a5;
+ (id)preferredLanguages;
+ (void)setPreferredLanguages:(id)a3;
@end

@implementation RKMessageClassifier

+ (void)setPreferredLanguages:(id)a3
{
}

+ (id)preferredLanguages
{
  return (id)preferredLanguages;
}

+ (id)messageClassification:(id)a3 withLanguageIdentifier:(id)a4
{
  return +[RKMessageClassifier messageClassification:a3 withLanguageIdentifier:a4 conversationTurns:0];
}

+ (id)messageClassification:(id)a3 withLanguageIdentifier:(id)a4 conversationTurns:(id)a5
{
  v78[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v53 = a4;
  id v52 = a5;
  v57 = v7;
  if ([v7 length])
  {
    id v54 = (id)objc_opt_new();
    v8 = [MEMORY[0x263EFF980] array];
    context = (void *)MEMORY[0x21D45BF80]();
    v9 = +[RKUtilities getDeviceModel];
    BOOL v10 = +[RKUtilities isDeviceSupportedForLSTMBasedLanguageIdentification:v9];
    id v11 = objc_alloc(MEMORY[0x263F08948]);
    uint64_t v12 = *MEMORY[0x263F082B8];
    uint64_t v13 = *MEMORY[0x263F082A8];
    if (v10)
    {
      v78[0] = *MEMORY[0x263F082B8];
      v78[1] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
      uint64_t v15 = [v11 initWithTagSchemes:v14 options:536870916];
    }
    else
    {
      v77[0] = *MEMORY[0x263F082B8];
      v77[1] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
      uint64_t v15 = [v11 initWithTagSchemes:v14 options:4];
    }
    v16 = (void *)v15;

    [v16 setString:v7];
    v17 = [v16 string];
    uint64_t v18 = [v17 length];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke;
    v68[3] = &unk_2642D2C30;
    id v19 = v8;
    id v69 = v19;
    objc_msgSend(v16, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v18, v12, 4, v68);

    if (+[RKUtilities isLanguageSupportedByNSLinguisticTaggerForLanguageIdentification:v53])
    {
      id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [v21 addObject:v7];
      *(void *)buf = 0;
      v72 = buf;
      uint64_t v73 = 0x3032000000;
      v74 = __Block_byref_object_copy__5;
      v75 = __Block_byref_object_dispose__5;
      id v76 = 0;
      if ([v52 count])
      {
        v22 = [v52 objectAtIndexedSubscript:0];
        uint64_t v23 = [v22 timestamp];
        v24 = (void *)*((void *)v72 + 5);
        *((void *)v72 + 5) = v23;
      }
      else
      {
        uint64_t v26 = [MEMORY[0x263EFF910] date];
        v22 = (void *)*((void *)v72 + 5);
        *((void *)v72 + 5) = v26;
      }

      v67[0] = 0;
      v67[1] = v67;
      v67[2] = 0x2020000000;
      v67[3] = 0;
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke_2;
      v62[3] = &unk_2642D2C58;
      v65 = buf;
      v66 = v67;
      id v27 = v21;
      id v63 = v27;
      id v28 = v20;
      id v64 = v28;
      [v52 enumerateObjectsWithOptions:0 usingBlock:v62];
      v29 = [v28 componentsJoinedByString:@" "];
      uint64_t v30 = [v7 length];
      if ([v7 isEqualToString:&stru_26C8AEFC8])
      {
        v25 = @"und";
      }
      else
      {
        objc_msgSend(v16, "languageOfRange:withAdditionalContext:withPreferredLanguages:", 0, v30, v29, preferredLanguages);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(v67, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v25 = @"und";
    }

    v31 = v25;
    v51 = v31;
    if (v31)
    {
      if (([(__CFString *)v31 isEqualToString:@"und"] & 1) != 0
        || (+[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v53], v32 = objc_claimAutoreleasedReturnValue(), int v33 = [(__CFString *)v51 isEqualToString:v32], v32, v34 = v51, v33))
      {
        v34 = (__CFString *)v53;
      }
    }
    else
    {
      v34 = 0;
    }
    v35 = [MEMORY[0x263EFF980] array];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id contexta = v19;
    uint64_t v36 = [contexta countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v59 != v37) {
            objc_enumerationMutation(contexta);
          }
          uint64_t v39 = [*(id *)(*((void *)&v58 + 1) + 8 * i) rangeValue];
          v41 = objc_msgSend(v57, "substringWithRange:", v39, v40);
          if (v41)
          {
            v42 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v34];
            v43 = +[RKSentenceClassifier preProcessTextMessageForLinguisticTagger:v41 withLocale:v42];
            v44 = +[RKSentenceClassifier sentenceClassification:v43 withLanguageIdentifier:v34 options:1];
            [v35 addObject:v44];
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            +[RKMessageClassifier messageClassification:withLanguageIdentifier:conversationTurns:](buf, (uint64_t)v57, &buf[4]);
          }
        }
        uint64_t v36 = [contexta countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v36);
    }

    v45 = [v35 sortedArrayUsingComparator:&__block_literal_global_10];
    if ([v45 count])
    {
      uint64_t v46 = [v45 objectAtIndexedSubscript:0];

      id v54 = (id)v46;
    }
    v47 = [v35 valueForKeyPath:@"@unionOfObjects.taggedText"];
    v48 = [v47 componentsJoinedByString:@" "];
    [v54 setTaggedText:v48];

    v49 = [v35 valueForKeyPath:@"@max.isSensitive"];
    objc_msgSend(v54, "setSensitive:", objc_msgSend(v49, "BOOLValue"));
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      +[RKMessageClassifier messageClassification:withLanguageIdentifier:conversationTurns:]();
    }
    id v54 = 0;
  }

  return v54;
}

void __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v21 = a2;
  v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v7 = [v21 timestamp];
  [v6 timeIntervalSinceDate:v7];
  unint64_t v9 = (unint64_t)v8;

  uint64_t v10 = [v21 timestamp];
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (v9 > 0x12C || *(void *)(*(void *)(a1[7] + 8) + 24) >= 0x33uLL)
  {
    *a4 = 1;
LABEL_4:
    uint64_t v13 = v21;
    goto LABEL_5;
  }
  v14 = [v21 text];
  if (![v14 length])
  {
LABEL_11:

    goto LABEL_4;
  }
  uint64_t v15 = (void *)a1[4];
  v16 = [v21 text];
  LOBYTE(v15) = [v15 containsObject:v16];

  uint64_t v13 = v21;
  if ((v15 & 1) == 0)
  {
    v17 = (void *)a1[5];
    uint64_t v18 = [v21 text];
    [v17 addObject:v18];

    id v19 = (void *)a1[4];
    id v20 = [v21 text];
    [v19 addObject:v20];

    v14 = [v21 text];
    *(void *)(*(void *)(a1[7] + 8) + 24) += [v14 length];
    goto LABEL_11;
  }
LABEL_5:
}

uint64_t __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 sentenceType];
  if (v5 > 31)
  {
    if ((unint64_t)(v5 - 32) < 3 || v5 == 36)
    {
      unint64_t v6 = 2;
      goto LABEL_12;
    }
LABEL_10:
    unint64_t v6 = 1;
    goto LABEL_12;
  }
  if (!v5)
  {
    unint64_t v6 = 4;
    goto LABEL_12;
  }
  if (v5 != 6)
  {
    if (v5 == 31)
    {
      unint64_t v6 = 3;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  unint64_t v6 = 0;
LABEL_12:
  uint64_t v7 = [v4 sentenceType];

  if (v7 > 31)
  {
    if ((unint64_t)(v7 - 32) < 3 || v7 == 36)
    {
      unint64_t v8 = 2;
      goto LABEL_23;
    }
LABEL_21:
    unint64_t v8 = 1;
    goto LABEL_23;
  }
  if (!v7)
  {
    unint64_t v8 = 4;
    goto LABEL_23;
  }
  if (v7 != 6)
  {
    if (v7 == 31)
    {
      unint64_t v8 = 3;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  unint64_t v8 = 0;
LABEL_23:
  BOOL v9 = v6 >= v8;
  BOOL v10 = v6 > v8;
  if (v9) {
    return v10;
  }
  else {
    return -1;
  }
}

+ (BOOL)questionClassification:(id)a3 withLanguageIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x21D45BF80]();
  unint64_t v8 = +[RKMessageClassifier messageClassification:v5 withLanguageIdentifier:v6];
  BOOL v9 = [v8 language];
  BOOL v10 = +[RKUtilities isLanguageSupportedBySmartPunctuation:v9];

  if (v10
    && ((uint64_t v11 = [v8 sentenceType], (unint64_t)(v11 - 7) < 0x18) || (unint64_t)(v11 - 2) <= 2))
  {
    uint64_t v12 = [v8 matchedRanges];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v14 = objc_msgSend(v8, "matchedRanges", 0);
      uint64_t v13 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        uint64_t v15 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v14);
            }
            if (![*(id *)(*((void *)&v18 + 1) + 8 * i) range])
            {
              LOBYTE(v13) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v13 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v10 & v13;
}

+ (void)messageClassification:withLanguageIdentifier:conversationTurns:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "(RKMessageClassifier) Trying to classify empty text", v0, 2u);
}

+ (void)messageClassification:(uint8_t *)buf withLanguageIdentifier:(uint64_t)a2 conversationTurns:(void *)a3 .cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Sentence Ranges cannot be invalid: %@", buf, 0xCu);
}

@end