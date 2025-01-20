@interface SiriNLUTypesConverter
+ (id)convertAsrHypothesis:(id)a3;
+ (id)convertAsrOutputs:(id)a3;
+ (id)convertAsrTokenInformation:(id)a3;
+ (id)convertAsrTokens:(id)a3;
+ (id)convertEntityCandidate:(id)a3;
+ (id)convertEntityCandidates:(id)a3;
+ (id)convertLegacyNLContext:(id)a3;
+ (id)convertMatchingSpan:(id)a3;
+ (id)convertMatchingSpans:(id)a3;
+ (id)convertNLContext:(id)a3;
+ (id)convertParser:(id)a3;
+ (id)convertRRAnnotation:(id)a3;
+ (id)convertRRAnnotations:(id)a3;
+ (id)convertRRGroupIdentifer:(id)a3;
+ (id)convertRepetitionResult:(id)a3;
+ (id)convertRepetitionResults:(id)a3;
+ (id)convertRequest:(id)a3;
+ (id)convertRequestID:(id)a3;
+ (id)convertResponse:(id)a3;
+ (id)convertResponseStatus:(id)a3;
+ (id)convertTask:(id)a3;
+ (id)convertTasks:(id)a3;
+ (id)convertTurnContext:(id)a3;
+ (id)convertTurnInput:(id)a3;
+ (id)convertTurnInputs:(id)a3;
+ (id)convertUUID:(id)a3;
+ (id)convertUserParse:(id)a3;
+ (id)convertUserParses:(id)a3;
+ (void)convertRewrittenUtterance:(id)a3;
@end

@implementation SiriNLUTypesConverter

+ (id)convertMatchingSpans:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertMatchingSpan:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertMatchingSpan:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasLabel])
    {
      id v5 = [v4 label];
    }
    else
    {
      id v5 = &stru_1F23304F0;
    }
    if ([v4 hasInput])
    {
      uint64_t v7 = [v4 input];
    }
    else
    {
      uint64_t v7 = &stru_1F23304F0;
    }
    if ([v4 hasStartTokenIndex]) {
      uint64_t v8 = [v4 startTokenIndex];
    }
    else {
      uint64_t v8 = 0;
    }
    if ([v4 hasEndTokenIndex]) {
      uint64_t v9 = [v4 endTokenIndex];
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = [v4 usoGraph];

    if (v10)
    {
      v11 = [v4 usoGraph];
      v10 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v11];
    }
    double v12 = 0.0;
    if ([v4 hasScore])
    {
      [v4 score];
      double v12 = v13;
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (unint64_t i = 0; [v4 matcherNamesCount] > i; ++i)
    {
      v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "matcherNamesAtIndex:", i));
      [v14 addObject:v16];
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA39E0]) initWithLabel:v5 input:v7 startTokenIndex:v8 endTokenIndex:v9 usoGraph:v10 score:v14 matcherNames:v12];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)convertLegacyNLContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = objc_msgSend(v3, "renderedTexts", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v10 = [v9 value];
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            double v12 = [v9 value];
            [v4 addObject:v12];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }

    unsigned int v13 = [v3 legacyContextSource];
    if (v13 - 1 >= 3) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v13;
    }
    id v15 = objc_alloc(MEMORY[0x1E4FA3980]);
    uint64_t v16 = [v3 dictationPrompt];
    uint64_t v17 = [v3 strictPrompt];
    v18 = [v3 previousDomainName];
    id v19 = (id)objc_msgSend(v15, "initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:renderedTexts:legacyContextSource:", v16, v17, v18, objc_msgSend(v3, "listenAfterSpeaking"), v4, v14);
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4FA3980]);
  }

  return v19;
}

+ (id)convertNLContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA3988]);
    id v15 = [v4 systemDialogActs];
    uint64_t v6 = +[SiriNLUTypesSDAConverter convertSystemDialogActs:v15];
    uint64_t v7 = [v4 activeTasks];
    uint64_t v8 = [a1 convertTasks:v7];
    uint64_t v9 = [v4 executedTasks];
    v10 = [a1 convertTasks:v9];
    BOOL v11 = [v4 salientEntities];
    double v12 = [a1 convertEntityCandidates:v11];
    id v13 = (id)[v5 initWithSystemDialogActs:v6 activeTasks:v8 executedTasks:v10 salientEntities:v12];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FA3988]);
  }

  return v13;
}

+ (id)convertTurnContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA3A20]);
    uint64_t v6 = [v4 nlContext];
    uint64_t v7 = [a1 convertNLContext:v6];
    uint64_t v8 = [v4 legacyNlContext];
    uint64_t v9 = [a1 convertLegacyNLContext:v8];
    id v10 = (id)[v5 initWithNLContext:v7 legacyNLContext:v9];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA3A20]);
  }

  return v10;
}

+ (id)convertRepetitionResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = objc_msgSend(a1, "convertRepetitionResult:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertRepetitionResult:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA39B0]), "initWithAsrHypothesisIndex:repetitionType:", objc_msgSend(v3, "asrHypothesisIndex"), objc_msgSend(v3, "repetitionType"));
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA39B0]);
  }
  id v5 = v4;

  return v5;
}

+ (id)convertUserParses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = objc_msgSend(a1, "convertUserParse:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUserParse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA3A48]);
    id v6 = [v4 userDialogActs];
    uint64_t v7 = +[SiriNLUTypesUDAConverter convertUserDialogActs:v6];
    [v4 probability];
    double v9 = v8;
    id v10 = [v4 idA];
    BOOL v11 = +[SiriNLUTypesConverter convertUUID:v10];
    long long v12 = [v4 parserId];
    long long v13 = [v4 repetitionResult];
    long long v14 = [a1 convertRepetitionResult:v13];
    [v4 comparableProbability];
    uint64_t v16 = (void *)[v5 initWithUserDialogActs:v7 probability:v11 nsUUID:v12 parserId:v14 repetitionResult:v9 comparableProbability:v15];

    uint64_t v17 = [v4 parser];
    v18 = +[SiriNLUTypesConverter convertParser:v17];
    [v16 setParser:v18];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)convertParser:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA3990]);
    uint64_t v5 = [v3 algorithm];
    if (v5 < 3) {
      [v4 setAlgorithmType:v5];
    }
    uint64_t v6 = objc_msgSend(v3, "parserId", v5);
    if (v6 <= 7) {
      [v4 setParserIdentifier:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertEntityCandidates:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = objc_msgSend(a1, "convertEntityCandidate:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertEntityCandidate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 entity];

    if (v6)
    {
      uint64_t v7 = [v5 entity];
      long long v22 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v7];
    }
    else
    {
      long long v22 = 0;
    }
    double v9 = 0.0;
    if ([v5 hasScore])
    {
      id v10 = [v5 score];
      [v10 value];
      double v9 = v11;
    }
    id v12 = objc_alloc(MEMORY[0x1E4FA3978]);
    long long v21 = [v5 entityId];
    long long v13 = [v21 value];
    long long v14 = [v5 appBundleId];
    long long v15 = [v14 value];
    uint64_t v16 = [v5 groupId];
    uint64_t v17 = [a1 convertRRGroupIdentifer:v16];
    v18 = [v5 annotations];
    id v19 = [a1 convertRRAnnotations:v18];
    uint64_t v8 = (void *)[v12 initWithEntity:v22 score:v13 entityId:v15 appBundleId:v17 groupId:v19 annotations:v9];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)convertRRGroupIdentifer:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA39A0]);
    id v5 = [v3 groupId];
    id v6 = [v5 value];
    uint64_t v7 = objc_msgSend(v4, "initWithGroupId:seq:", v6, objc_msgSend(v3, "seq"));
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)convertRRAnnotations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = objc_msgSend(a1, "convertRRAnnotation:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertRRAnnotation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3998]);
    id v5 = [v3 key];
    id v6 = [v5 value];
    uint64_t v7 = [v3 value];
    uint64_t v8 = [v7 value];
    double v9 = (void *)[v4 initWithKey:v6 value:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

+ (id)convertTasks:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = objc_msgSend(a1, "convertTask:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertTask:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasTask])
    {
      id v5 = [v4 task];
      id v6 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v5];
    }
    else
    {
      id v6 = 0;
    }
    double v8 = 0.0;
    if ([v4 hasScore])
    {
      double v9 = [v4 score];
      [v9 value];
      double v8 = v10;
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA3A18]) initWithTask:v6 score:v8];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)convertRewrittenUtterance:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = loggerContext(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "+[SiriNLUTypesConverter convertRewrittenUtterance:]";
    _os_log_impl(&dword_1C8881000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: RewrittenUtterance was added on Nov 9 It doesn't have a hand-crafted SIRINLU equivalent", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)convertAsrTokens:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = objc_msgSend(a1, "convertAsrTokenInformation:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertAsrTokenInformation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3968]);
    long long v13 = [v3 postItnText];
    id v5 = [v3 phoneSequence];
    id v6 = [v3 ipaPhoneSequence];
    uint64_t v7 = [v3 addSpaceAfter];
    uint64_t v8 = [v3 removeSpaceAfter];
    uint64_t v9 = [v3 removeSpaceBefore];
    [v3 confidenceScore];
    double v11 = objc_msgSend(v4, "initWithPostITNText:phoneSequence:ipaPhoneSequence:addSpaceAfter:removeSpaceAfter:removeSpaceBefore:confidenceScore:beginIndex:endIndex:startMilliSeconds:endMilliSeconds:", v13, v5, v6, v7, v8, v9, v10, __PAIR64__(objc_msgSend(v3, "endIndex"), objc_msgSend(v3, "beginIndex")), __PAIR64__(objc_msgSend(v3, "endMilliSeconds"), objc_msgSend(v3, "startMilliSeconds")));
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

+ (id)convertAsrOutputs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = objc_msgSend(a1, "convertAsrHypothesis:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertAsrHypothesis:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA3960]);
    id v6 = [v4 utterance];
    [v4 probability];
    double v8 = v7;
    uint64_t v9 = [v4 asrTokens];
    double v10 = [a1 convertAsrTokens:v9];
    double v11 = [v4 idA];
    long long v12 = [a1 convertUUID:v11];
    long long v13 = (void *)[v5 initWithUtterance:v6 probability:v10 asrTokens:v12 uuid:v8];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

+ (id)convertTurnInputs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = objc_msgSend(a1, "convertTurnInput:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertTurnInput:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 hasLocale])
    {
      id v6 = [v5 locale];
    }
    else
    {
      uint64_t v8 = loggerContext(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        v18 = "+[SiriNLUTypesConverter convertTurnInput:]";
        _os_log_impl(&dword_1C8881000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: Not expecting nil locale, defaulting to en_US", (uint8_t *)&v17, 0xCu);
      }

      id v6 = @"en_US";
    }
    uint64_t v9 = loggerContext(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      v18 = "+[SiriNLUTypesConverter convertTurnInput:]";
      _os_log_impl(&dword_1C8881000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: SIRINLUEXTERNALTurnInput doesn't have EntityCandidates", (uint8_t *)&v17, 0xCu);
    }

    id v10 = objc_alloc(MEMORY[0x1E4FA3A28]);
    double v11 = [v5 asrOutputs];
    long long v12 = [a1 convertAsrOutputs:v11];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    long long v14 = [v5 turnContext];
    long long v15 = [a1 convertTurnContext:v14];
    id v7 = (id)objc_msgSend(v10, "initWithAsrOutputs:salientEntities:turnContext:locale:tapToEdit:startTimestamp:", v12, v13, v15, v6, objc_msgSend(v5, "tapToEdit"), objc_msgSend(v5, "startTimestamp"));
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA3A28]);
  }

  return v7;
}

+ (id)convertRequestID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA39C0]);
    id v5 = [v3 idA];
    id v6 = [v3 nluRequestId];
    id v7 = +[SiriNLUTypesConverter convertUUID:v6];
    uint64_t v8 = [v3 connectionId];
    uint64_t v9 = (void *)[v4 initWithIdAsString:v5 nluRequestId:v7 connectionID:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)convertUUID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v7[1] = objc_msgSend(v3, "highInt", objc_msgSend(v3, "lowInt"));
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertResponseStatus:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 code];
    if (v5 > 299)
    {
      switch(v5)
      {
        case 300:
          id v6 = objc_alloc(MEMORY[0x1E4FA39D0]);
          id v7 = [v4 descriptionA];
          uint64_t v8 = [v6 initStatusCode:300 statusDescription:v7];
          goto LABEL_16;
        case 301:
          id v12 = objc_alloc(MEMORY[0x1E4FA39D0]);
          id v7 = [v4 descriptionA];
          uint64_t v8 = [v12 initStatusCode:301 statusDescription:v7];
          goto LABEL_16;
        case 302:
          id v13 = objc_alloc(MEMORY[0x1E4FA39D0]);
          id v7 = [v4 descriptionA];
          uint64_t v8 = [v13 initStatusCode:302 statusDescription:v7];
          goto LABEL_16;
        case 303:
          id v14 = objc_alloc(MEMORY[0x1E4FA39D0]);
          id v7 = [v4 descriptionA];
          uint64_t v8 = [v14 initStatusCode:303 statusDescription:v7];
          goto LABEL_16;
        default:
          if (v5 != 500) {
            goto LABEL_17;
          }
          id v10 = objc_alloc(MEMORY[0x1E4FA39D0]);
          id v7 = [v4 descriptionA];
          uint64_t v8 = [v10 initStatusCode:500 statusDescription:v7];
          break;
      }
      goto LABEL_16;
    }
    switch(v5)
    {
      case 0:
        id v11 = objc_alloc(MEMORY[0x1E4FA39D0]);
        id v7 = [v4 descriptionA];
        uint64_t v8 = [v11 initStatusCode:0 statusDescription:v7];
        goto LABEL_16;
      case 100:
        id v15 = objc_alloc(MEMORY[0x1E4FA39D0]);
        id v7 = [v4 descriptionA];
        uint64_t v8 = [v15 initStatusCode:100 statusDescription:v7];
        goto LABEL_16;
      case 101:
        id v9 = objc_alloc(MEMORY[0x1E4FA39D0]);
        id v7 = [v4 descriptionA];
        uint64_t v8 = [v9 initStatusCode:101 statusDescription:v7];
LABEL_16:
        uint64_t v16 = (void *)v8;

        goto LABEL_21;
    }
LABEL_17:
    int v17 = loggerContext(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "+[SiriNLUTypesConverter convertResponseStatus:]";
      __int16 v21 = 1024;
      int v22 = [v4 code];
      _os_log_impl(&dword_1C8881000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Unknown status code: %d", (uint8_t *)&v19, 0x12u);
    }
  }
  uint64_t v16 = 0;
LABEL_21:

  return v16;
}

+ (id)convertResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA39C8]);
    id v6 = [v4 requestId];
    id v7 = [a1 convertRequestID:v6];
    uint64_t v8 = [v4 parses];
    id v9 = +[SiriNLUTypesConverter convertUserParses:v8];
    id v10 = [v4 repetitionResults];
    id v11 = +[SiriNLUTypesConverter convertRepetitionResults:v10];
    id v12 = (void *)[v5 initWithRequestId:v7 parses:v9 repetitionResults:v11];

    id v13 = [v4 responseStatus];
    id v14 = [a1 convertResponseStatus:v13];
    [v12 setResponseStatus:v14];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)convertRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA39B8]);
    id v6 = [v4 requestId];
    id v7 = [a1 convertRequestID:v6];
    uint64_t v8 = [v4 currentTurnInput];
    id v9 = [a1 convertTurnInput:v8];
    id v10 = [v4 previousTurnInputs];
    id v11 = [a1 convertTurnInputs:v10];
    id v12 = (void *)[v5 initWithRequestId:v7 currentTurnInput:v9 previousTurnInputs:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end