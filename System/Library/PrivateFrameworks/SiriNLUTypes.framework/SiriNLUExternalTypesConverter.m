@interface SiriNLUExternalTypesConverter
+ (id)convertFromAsrHypothesis:(id)a3;
+ (id)convertFromAsrOutputs:(id)a3;
+ (id)convertFromAsrTokenInformation:(id)a3;
+ (id)convertFromAsrTokens:(id)a3;
+ (id)convertFromContext:(id)a3;
+ (id)convertFromDouble:(double)a3;
+ (id)convertFromEntityCandidate:(id)a3;
+ (id)convertFromEntityCandidates:(id)a3;
+ (id)convertFromMatchingSpan:(id)a3;
+ (id)convertFromMatchingSpans:(id)a3;
+ (id)convertFromNluLegacyNLContext:(id)a3;
+ (id)convertFromNluRequest:(id)a3;
+ (id)convertFromNluResponse:(id)a3;
+ (id)convertFromNluTurnContext:(id)a3;
+ (id)convertFromNluTurnInput:(id)a3;
+ (id)convertFromNumber:(id)a3;
+ (id)convertFromRRAnnotation:(id)a3;
+ (id)convertFromRRAnnotations:(id)a3;
+ (id)convertFromRRGroupIdentifer:(id)a3;
+ (id)convertFromRepetitionResult:(id)a3;
+ (id)convertFromRepetitionResults:(id)a3;
+ (id)convertFromString:(id)a3;
+ (id)convertFromTask:(id)a3;
+ (id)convertFromTasks:(id)a3;
+ (id)convertFromUUID:(id)a3;
+ (id)convertFromUserParse:(id)a3;
+ (id)convertFromUserParses:(id)a3;
+ (id)convertParser:(id)a3;
+ (id)convertfromRequestID:(id)a3;
@end

@implementation SiriNLUExternalTypesConverter

+ (id)convertFromUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    [v3 getUUIDBytes:&v9];
    uint64_t v6 = v9;
    uint64_t v5 = v10;
    v7 = objc_alloc_init(SIRINLUEXTERNALUUID);
    [(SIRINLUEXTERNALUUID *)v7 setLowInt:v6];
    [(SIRINLUEXTERNALUUID *)v7 setHighInt:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertFromMatchingSpans:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromMatchingSpan:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

+ (id)convertFromMatchingSpan:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRINLUEXTERNALSpan);
    id v5 = [v3 input];
    [(SIRINLUEXTERNALSpan *)v4 setInput:v5];

    id v6 = [v3 label];
    [(SIRINLUEXTERNALSpan *)v4 setLabel:v6];

    -[SIRINLUEXTERNALSpan setStartTokenIndex:](v4, "setStartTokenIndex:", [v3 startTokenIndex]);
    -[SIRINLUEXTERNALSpan setEndTokenIndex:](v4, "setEndTokenIndex:", [v3 endTokenIndex]);
    [v3 score];
    -[SIRINLUEXTERNALSpan setScore:](v4, "setScore:");
    uint64_t v7 = [v3 usoGraph];
    uint64_t v8 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v7];
    [(SIRINLUEXTERNALSpan *)v4 setUsoGraph:v8];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(v3, "matcherNames", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 intValue] == 1)
          {
            uint64_t v14 = 1;
          }
          else if ([v13 intValue] == 2)
          {
            uint64_t v14 = 2;
          }
          else if ([v13 intValue] == 3)
          {
            uint64_t v14 = 3;
          }
          else
          {
            uint64_t v14 = 0;
          }
          [(SIRINLUEXTERNALSpan *)v4 addMatcherNames:v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromRepetitionResults:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromRepetitionResult:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertFromRepetitionResult:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRINLUEXTERNALRepetitionResult);
    -[SIRINLUEXTERNALRepetitionResult setAsrHypothesisIndex:](v4, "setAsrHypothesisIndex:", [v3 asrHypothesisIndex]);
    -[SIRINLUEXTERNALRepetitionResult setRepetitionType:](v4, "setRepetitionType:", [v3 repetitionType]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromUserParses:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromUserParse:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertFromUserParse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALUserParse);
    id v6 = [v4 userDialogActs];
    uint64_t v7 = +[SiriNLUExternalTypesUDAConverter convertFromUserDialogActs:v6];
    [(SIRINLUEXTERNALUserParse *)v5 setUserDialogActs:v7];

    [v4 probability];
    -[SIRINLUEXTERNALUserParse setProbability:](v5, "setProbability:");
    uint64_t v8 = [v4 nsUUID];
    uint64_t v9 = [a1 convertFromUUID:v8];
    [(SIRINLUEXTERNALUserParse *)v5 setIdA:v9];

    uint64_t v10 = [v4 parserId];
    [(SIRINLUEXTERNALUserParse *)v5 setParserId:v10];

    uint64_t v11 = [v4 parser];
    long long v12 = [a1 convertParser:v11];
    [(SIRINLUEXTERNALUserParse *)v5 setParser:v12];

    long long v13 = [v4 repetitionResult];
    long long v14 = [a1 convertFromRepetitionResult:v13];
    [(SIRINLUEXTERNALUserParse *)v5 setRepetitionResult:v14];

    [v4 comparableProbability];
    -[SIRINLUEXTERNALUserParse setComparableProbability:](v5, "setComparableProbability:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertParser:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRINLUEXTERNALParser);
    uint64_t v5 = [v3 algorithmType];
    if (v5 < 3) {
      [(SIRINLUEXTERNALParser *)v4 setAlgorithm:v5];
    }
    uint64_t v6 = objc_msgSend(v3, "parserIdentifier", v5);
    if (v6 <= 7) {
      [(SIRINLUEXTERNALParser *)v4 setParserId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromAsrOutputs:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromAsrHypothesis:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

+ (id)convertFromAsrTokenInformation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRINLUEXTERNALAsrTokenInformation);
    id v5 = [v3 phoneSequence];
    [(SIRINLUEXTERNALAsrTokenInformation *)v4 setPhoneSequence:v5];

    [v3 confidenceScore];
    -[SIRINLUEXTERNALAsrTokenInformation setConfidenceScore:](v4, "setConfidenceScore:");
    -[SIRINLUEXTERNALAsrTokenInformation setBeginIndex:](v4, "setBeginIndex:", [v3 beginIndex]);
    -[SIRINLUEXTERNALAsrTokenInformation setEndIndex:](v4, "setEndIndex:", [v3 endIndex]);
    id v6 = [v3 ipaPhoneSequence];
    [(SIRINLUEXTERNALAsrTokenInformation *)v4 setIpaPhoneSequence:v6];

    uint64_t v7 = [v3 postITNText];
    [(SIRINLUEXTERNALAsrTokenInformation *)v4 setPostItnText:v7];

    -[SIRINLUEXTERNALAsrTokenInformation setAddSpaceAfter:](v4, "setAddSpaceAfter:", [v3 addSpaceAfter]);
    -[SIRINLUEXTERNALAsrTokenInformation setRemoveSpaceAfter:](v4, "setRemoveSpaceAfter:", [v3 removeSpaceAfter]);
    -[SIRINLUEXTERNALAsrTokenInformation setRemoveSpaceBefore:](v4, "setRemoveSpaceBefore:", [v3 removeSpaceBefore]);
    -[SIRINLUEXTERNALAsrTokenInformation setStartMilliSeconds:](v4, "setStartMilliSeconds:", [v3 startMilliSeconds]);
    -[SIRINLUEXTERNALAsrTokenInformation setEndMilliSeconds:](v4, "setEndMilliSeconds:", [v3 endMilliSeconds]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromAsrTokens:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromAsrTokenInformation:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

+ (id)convertFromAsrHypothesis:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALAsrHypothesis);
    id v6 = [v4 utterance];
    [(SIRINLUEXTERNALAsrHypothesis *)v5 setUtterance:v6];

    [v4 probability];
    -[SIRINLUEXTERNALAsrHypothesis setProbability:](v5, "setProbability:");
    uint64_t v7 = [v4 uuid];
    uint64_t v8 = [a1 convertFromUUID:v7];
    [(SIRINLUEXTERNALAsrHypothesis *)v5 setIdA:v8];

    uint64_t v9 = [v4 asrTokens];
    uint64_t v10 = [a1 convertFromAsrTokens:v9];
    [(SIRINLUEXTERNALAsrHypothesis *)v5 setAsrTokens:v10];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRICOMMONStringValue);
    [(SIRICOMMONStringValue *)v4 setValue:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromDouble:(double)a3
{
  id v4 = objc_alloc_init(SIRICOMMONDoubleValue);
  [(SIRICOMMONDoubleValue *)v4 setValue:a3];
  return v4;
}

+ (id)convertFromNumber:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRICOMMONInt64Value);
    -[SIRICOMMONInt64Value setValue:](v4, "setValue:", (int)[v3 intValue]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromTasks:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromTask:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

+ (id)convertFromTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALTask);
    [v4 score];
    id v6 = objc_msgSend(a1, "convertFromDouble:");
    [(SIRINLUEXTERNALTask *)v5 setScore:v6];

    uint64_t v7 = [v4 task];
    uint64_t v8 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v7];
    [(SIRINLUEXTERNALTask *)v5 setTask:v8];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromEntityCandidates:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromEntityCandidate:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

+ (id)convertFromEntityCandidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALEntityCandidate);
    [v4 score];
    id v6 = objc_msgSend(a1, "convertFromDouble:");
    [(SIRINLUEXTERNALEntityCandidate *)v5 setScore:v6];

    uint64_t v7 = [v4 entity];
    uint64_t v8 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v7];
    [(SIRINLUEXTERNALEntityCandidate *)v5 setEntity:v8];

    uint64_t v9 = [v4 appBundleId];
    uint64_t v10 = [a1 convertFromString:v9];
    [(SIRINLUEXTERNALEntityCandidate *)v5 setAppBundleId:v10];

    uint64_t v11 = [v4 annotations];
    long long v12 = (void *)[v11 mutableCopy];
    long long v13 = [a1 convertFromRRAnnotations:v12];
    [(SIRINLUEXTERNALEntityCandidate *)v5 setAnnotations:v13];

    long long v14 = [v4 groupId];
    long long v15 = [a1 convertFromRRGroupIdentifer:v14];
    [(SIRINLUEXTERNALEntityCandidate *)v5 setGroupId:v15];

    long long v16 = [v4 entityId];
    uint64_t v17 = [a1 convertFromString:v16];
    [(SIRINLUEXTERNALEntityCandidate *)v5 setEntityId:v17];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromRRGroupIdentifer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v4 groupId];
    uint64_t v7 = [a1 convertFromString:v6];
    [v5 setGroupId:v7];

    objc_msgSend(v5, "setSeq:", objc_msgSend(v4, "seq"));
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromRRAnnotations:(id)a3
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
          uint64_t v10 = objc_msgSend(a1, "convertFromRRAnnotation:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

+ (id)convertFromRRAnnotation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v4 key];
    uint64_t v7 = [a1 convertFromString:v6];
    [v5 setKey:v7];

    uint64_t v8 = [v4 value];
    uint64_t v9 = [a1 convertFromString:v8];
    [v5 setValue:v9];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALNLContext);
    id v6 = [v4 activeTasks];
    uint64_t v7 = [a1 convertFromTasks:v6];
    [(SIRINLUEXTERNALNLContext *)v5 setActiveTasks:v7];

    uint64_t v8 = [v4 executedTasks];
    uint64_t v9 = [a1 convertFromTasks:v8];
    [(SIRINLUEXTERNALNLContext *)v5 setExecutedTasks:v9];

    uint64_t v10 = [v4 systemDialogActs];
    uint64_t v11 = +[SiriNLUExternalTypesSDAConverter convertFromSystemDialogActs:v10];
    [(SIRINLUEXTERNALNLContext *)v5 setSystemDialogActs:v11];

    long long v12 = [v4 salientEntities];
    long long v13 = [a1 convertFromEntityCandidates:v12];
    [(SIRINLUEXTERNALNLContext *)v5 setSalientEntities:v13];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromNluLegacyNLContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALLegacyNLContext);
    -[SIRINLUEXTERNALLegacyNLContext setListenAfterSpeaking:](v5, "setListenAfterSpeaking:", [v4 listenAfterSpeaking]);
    id v6 = [v4 previousDomainName];
    [(SIRINLUEXTERNALLegacyNLContext *)v5 setPreviousDomainName:v6];

    -[SIRINLUEXTERNALLegacyNLContext setStrictPrompt:](v5, "setStrictPrompt:", [v4 strictPrompt]);
    -[SIRINLUEXTERNALLegacyNLContext setDictationPrompt:](v5, "setDictationPrompt:", [v4 dictationPrompt]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(SIRINLUEXTERNALLegacyNLContext *)v5 setRenderedTexts:v7];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = objc_msgSend(v4, "renderedTexts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          long long v13 = [(SIRINLUEXTERNALLegacyNLContext *)v5 renderedTexts];
          long long v14 = [a1 convertFromString:v12];
          [v13 addObject:v14];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v4 legacyContextSource];
    switch((int)v15)
    {
      case 0:
        goto LABEL_14;
      case 1:
        uint64_t v15 = 1;
        goto LABEL_14;
      case 2:
        [(SIRINLUEXTERNALLegacyNLContext *)v5 setLegacyContextSource:2];
        goto LABEL_13;
      case 3:
LABEL_13:
        uint64_t v15 = 3;
LABEL_14:
        [(SIRINLUEXTERNALLegacyNLContext *)v5 setLegacyContextSource:v15];
        break;
      default:
        break;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromNluTurnContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_13;
  }
  id v5 = objc_alloc_init(SIRINLUEXTERNALTurnContext);
  id v6 = [v4 legacyNLContextNullable];

  if (v6)
  {
    id v7 = [v4 legacyNLContextNullable];
    uint64_t v8 = [a1 convertFromNluLegacyNLContext:v7];
    [(SIRINLUEXTERNALTurnContext *)v5 setLegacyNlContext:v8];
  }
  else
  {
    uint64_t v9 = [v4 legacyNLContext];

    if (!v9) {
      goto LABEL_8;
    }
    id v7 = [v4 legacyNLContext];
    uint64_t v8 = [a1 convertFromNluLegacyNLContext:v7];
    [(SIRINLUEXTERNALTurnContext *)v5 setLegacyNlContext:v8];
  }

LABEL_8:
  uint64_t v10 = [v4 nlContextNullable];

  if (v10)
  {
    uint64_t v11 = [v4 nlContextNullable];
    uint64_t v12 = [a1 convertFromContext:v11];
    [(SIRINLUEXTERNALTurnContext *)v5 setNlContext:v12];
  }
  else
  {
    long long v13 = [v4 nlContext];

    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v11 = [v4 nlContext];
    uint64_t v12 = [a1 convertFromContext:v11];
    [(SIRINLUEXTERNALTurnContext *)v5 setNlContext:v12];
  }

LABEL_13:
  return v5;
}

+ (id)convertFromNluTurnInput:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALTurnInput);
    id v6 = [v4 asrOutputs];
    id v7 = [a1 convertFromAsrOutputs:v6];
    [(SIRINLUEXTERNALTurnInput *)v5 setAsrOutputs:v7];

    uint64_t v8 = [v4 turnContext];
    uint64_t v9 = [a1 convertFromNluTurnContext:v8];
    [(SIRINLUEXTERNALTurnInput *)v5 setTurnContext:v9];

    uint64_t v10 = [v4 locale];
    [(SIRINLUEXTERNALTurnInput *)v5 setLocale:v10];

    -[SIRINLUEXTERNALTurnInput setTapToEdit:](v5, "setTapToEdit:", [v4 tapToEdit]);
    -[SIRINLUEXTERNALTurnInput setStartTimestamp:](v5, "setStartTimestamp:", [v4 startTimestamp]);
    uint64_t v11 = [v4 systemDialogActs];
    uint64_t v12 = [v11 count];

    if (v12 == 1)
    {
      long long v13 = [v4 systemDialogActs];
      long long v14 = +[SiriNLUExternalTypesSDAConverter convertFromSystemDialogActs:v13];

      uint64_t v15 = objc_alloc_init(SIRINLUEXTERNALSystemDialogActGroup);
      [(SIRINLUEXTERNALTurnInput *)v5 setSystemDialogActGroup:v15];

      long long v16 = [v14 firstObject];
      long long v17 = [(SIRINLUEXTERNALTurnInput *)v5 systemDialogActGroup];
      [v17 setSystemDialogAct:v16];
    }
    else
    {
      long long v18 = [v4 systemDialogActs];
      unint64_t v19 = [v18 count];

      if (v19 >= 2)
      {
        long long v20 = loggerContext(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v22 = 136315138;
          v23 = "+[SiriNLUExternalTypesConverter convertFromNluTurnInput:]";
          _os_log_impl(&dword_1C8881000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: The SIRINLUTurnInput contains multiple system dialog act, we are not converting them to SIRINLUEXTERNALTurnInput", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertfromRequestID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRINLUEXTERNALRequestID);
    id v5 = [v3 idAsString];
    [(SIRINLUEXTERNALRequestID *)v4 setIdA:v5];

    id v6 = [v3 connectionID];
    [(SIRINLUEXTERNALRequestID *)v4 setConnectionId:v6];

    id v7 = [v3 nluRequestId];
    uint64_t v8 = +[SiriNLUExternalTypesConverter convertFromUUID:v7];
    [(SIRINLUEXTERNALRequestID *)v4 setNluRequestId:v8];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromNluResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALCDMNluResponse);
    id v6 = [v4 requestId];
    id v7 = [a1 convertfromRequestID:v6];
    [(SIRINLUEXTERNALCDMNluResponse *)v5 setRequestId:v7];

    uint64_t v8 = [v4 parses];
    uint64_t v9 = [a1 convertFromUserParses:v8];
    [(SIRINLUEXTERNALCDMNluResponse *)v5 setParses:v9];

    uint64_t v10 = [v4 repetitionResults];
    uint64_t v11 = [a1 convertFromRepetitionResults:v10];
    [(SIRINLUEXTERNALCDMNluResponse *)v5 setRepetitionResults:v11];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromNluRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(SIRINLUEXTERNALCDMNluRequest);
    id v6 = [v4 requestId];
    id v7 = [a1 convertfromRequestID:v6];
    [(SIRINLUEXTERNALCDMNluRequest *)v5 setRequestId:v7];

    uint64_t v8 = [v4 currentTurnInput];
    uint64_t v9 = [a1 convertFromNluTurnInput:v8];
    [(SIRINLUEXTERNALCDMNluRequest *)v5 setCurrentTurnInput:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = objc_msgSend(v4, "previousTurnInputs", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = [a1 convertFromNluTurnInput:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v10 addObject:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [(SIRINLUEXTERNALCDMNluRequest *)v5 setPreviousTurnInputs:v10];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end