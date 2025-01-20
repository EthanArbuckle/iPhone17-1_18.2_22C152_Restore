@interface SiriNLUTypesUDAConverter
+ (id)convertDelegatedUserDialogAct:(id)a3;
+ (id)convertReferenceContext:(id)a3;
+ (id)convertRewriteMessage:(id)a3;
+ (id)convertRewriteMessages:(id)a3;
+ (id)convertUserAccepted:(id)a3;
+ (id)convertUserAcknowledged:(id)a3;
+ (id)convertUserCancelled:(id)a3;
+ (id)convertUserDialogAct:(id)a3;
+ (id)convertUserDialogActs:(id)a3;
+ (id)convertUserRejected:(id)a3;
+ (id)convertUserStatedTask:(id)a3;
+ (id)convertUserWantedToPause:(id)a3;
+ (id)convertUserWantedToProceed:(id)a3;
+ (id)convertUserWantedToRepeat:(id)a3;
+ (void)convertUtteranceAlignment:(id)a3;
@end

@implementation SiriNLUTypesUDAConverter

+ (void)convertUtteranceAlignment:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = loggerContext(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "+[SiriNLUTypesUDAConverter convertUtteranceAlignment:]";
    _os_log_impl(&dword_1C8881000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: UtteranceAlignment was recently and doesn't have a hand-crafted SIRINLU equivalent", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)convertUserStatedTask:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3A58]);
    v5 = [v3 task];
    uint64_t v6 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v5];
    v7 = (void *)[v4 initWithTask:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertDelegatedUserDialogAct:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 hasRewrittenUtterance])
    {
      uint64_t v6 = [v5 rewrittenUtterance];
      v7 = [v6 value];
    }
    else
    {
      v7 = 0;
    }
    if ([v5 hasAsrHypothesisIndex]) {
      uint64_t v9 = [v5 asrHypothesisIndex];
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = [v5 matchingSpans];

    if (v10)
    {
      v11 = [v5 matchingSpans];
      v12 = +[SiriNLUTypesConverter convertMatchingSpans:v11];
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v13 = [v5 rewrite];
    v14 = [a1 convertRewriteMessage:v13];

    v15 = [v5 referenceContext];
    v16 = [a1 convertReferenceContext:v15];

    id v17 = objc_alloc(MEMORY[0x1E4FA3970]);
    v18 = [v5 externalParserId];
    v8 = (void *)[v17 initWithAsrHypothesisIndex:v9 rewrittenUtterace:v7 externalParserId:v18 spans:v12 rewriteMessage:v14 referenceContext:v16];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)convertReferenceContext:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA39A8]), "initWithContextualReference:DisambiguationNeeded:", objc_msgSend(v3, "contextualReference"), objc_msgSend(v3, "disambiguationNeeded"));
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertRewriteMessage:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA39D8]);
    uint64_t v5 = [v3 rewriteType];
    uint64_t v6 = [v3 rewrittenUtterance];
    v7 = (void *)[v4 initWithType:v5 utterance:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertRewriteMessages:(id)a3
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
          v10 = objc_msgSend(a1, "convertRewriteMessage:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUserWantedToPause:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasTaskId])
    {
      id v5 = objc_alloc(MEMORY[0x1E4FA3A60]);
      id v6 = [v4 taskId];
      uint64_t v7 = +[SiriNLUTypesConverter convertUUID:v6];
      uint64_t v8 = [v4 reference];
      uint64_t v9 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v8];
      v10 = (void *)[v5 initWithTaskId:v7 reference:v9];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4FA3A60]);
      id v6 = [v4 reference];
      uint64_t v7 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v6];
      v10 = (void *)[v11 initWithReference:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUserWantedToProceed:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasTaskId])
    {
      id v5 = objc_alloc(MEMORY[0x1E4FA3A68]);
      id v6 = [v4 taskId];
      uint64_t v7 = +[SiriNLUTypesConverter convertUUID:v6];
      uint64_t v8 = [v4 reference];
      uint64_t v9 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v8];
      v10 = (void *)[v5 initWithTaskId:v7 reference:v9];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4FA3A68]);
      id v6 = [v4 reference];
      uint64_t v7 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v6];
      v10 = (void *)[v11 initWithReference:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUserAcknowledged:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3A38]);
    id v5 = [v3 systemDialogActId];
    id v6 = +[SiriNLUTypesConverter convertUUID:v5];
    uint64_t v7 = [v3 reference];
    uint64_t v8 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v7];
    uint64_t v9 = (void *)[v4 initWithSystemDialogActId:v6 reference:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)convertUserWantedToRepeat:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3A70]);
    id v5 = [v3 systemDialogActId];
    id v6 = +[SiriNLUTypesConverter convertUUID:v5];
    uint64_t v7 = [v3 reference];
    uint64_t v8 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v7];
    uint64_t v9 = (void *)[v4 initWithSystemDialogActId:v6 reference:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)convertUserCancelled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasTaskId])
    {
      id v5 = objc_alloc(MEMORY[0x1E4FA3A40]);
      id v6 = [v4 taskId];
      uint64_t v7 = +[SiriNLUTypesConverter convertUUID:v6];
      uint64_t v8 = [v4 reference];
      uint64_t v9 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v8];
      v10 = (void *)[v5 initWithTaskId:v7 reference:v9];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4FA3A40]);
      id v6 = [v4 reference];
      uint64_t v7 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v6];
      v10 = (void *)[v11 initWithReference:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUserRejected:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3A50]);
    id v5 = [v3 offerId];
    id v6 = +[SiriNLUTypesConverter convertUUID:v5];
    uint64_t v7 = [v3 reference];
    uint64_t v8 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v7];
    uint64_t v9 = (void *)[v4 initWithOfferId:v6 reference:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)convertUserAccepted:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3A30]);
    id v5 = [v3 offerId];
    id v6 = +[SiriNLUTypesConverter convertUUID:v5];
    uint64_t v7 = [v3 reference];
    uint64_t v8 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v7];
    uint64_t v9 = (void *)[v4 initWithOfferId:v6 reference:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)convertUserDialogActs:(id)a3
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
          v10 = objc_msgSend(a1, "convertUserDialogAct:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUserDialogAct:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 hasAlignment])
    {
      id v6 = [v5 alignment];
      [a1 convertUtteranceAlignment:v6];
    }
    if ([v5 hasAccepted])
    {
      uint64_t v7 = [v5 accepted];
      uint64_t v8 = [a1 convertUserAccepted:v7];
LABEL_22:
      uint64_t v9 = (void *)v8;

      goto LABEL_27;
    }
    if ([v5 hasRejected])
    {
      uint64_t v7 = [v5 rejected];
      uint64_t v8 = [a1 convertUserRejected:v7];
      goto LABEL_22;
    }
    if ([v5 hasCancelled])
    {
      uint64_t v7 = [v5 cancelled];
      uint64_t v8 = [a1 convertUserCancelled:v7];
      goto LABEL_22;
    }
    if ([v5 hasWantedToRepeat])
    {
      uint64_t v7 = [v5 wantedToRepeat];
      uint64_t v8 = [a1 convertUserWantedToRepeat:v7];
      goto LABEL_22;
    }
    if ([v5 hasAcknowledged])
    {
      uint64_t v7 = [v5 acknowledged];
      uint64_t v8 = [a1 convertUserAcknowledged:v7];
      goto LABEL_22;
    }
    if ([v5 hasWantedToProceed])
    {
      uint64_t v7 = [v5 wantedToProceed];
      uint64_t v8 = [a1 convertUserWantedToProceed:v7];
      goto LABEL_22;
    }
    if ([v5 hasWantedToPause])
    {
      uint64_t v7 = [v5 wantedToPause];
      uint64_t v8 = [a1 convertUserWantedToPause:v7];
      goto LABEL_22;
    }
    if ([v5 hasDelegated])
    {
      uint64_t v7 = [v5 delegated];
      uint64_t v8 = [a1 convertDelegatedUserDialogAct:v7];
      goto LABEL_22;
    }
    if ([v5 hasUserStatedTask])
    {
      uint64_t v7 = [v5 userStatedTask];
      uint64_t v8 = [a1 convertUserStatedTask:v7];
      goto LABEL_22;
    }
    v10 = loggerContext(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      long long v13 = "+[SiriNLUTypesUDAConverter convertUserDialogAct:]";
      __int16 v14 = 2112;
      long long v15 = v5;
      _os_log_impl(&dword_1C8881000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: Encountered an unknown UDA %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v9 = 0;
LABEL_27:

  return v9;
}

@end