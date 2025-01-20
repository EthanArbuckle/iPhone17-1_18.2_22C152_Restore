@interface TIFavoniusTypingSessionAnalyzer
+ (id)favoniusTypingSessionAnalyzerForUserModel:(id)a3;
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (BOOL)isPathable:(id)a3 context:(id)a4;
- (BOOL)updatePQTCountersForCandidate:(id)a3 withText:(id)a4 andContext:(id)a5;
- (NSString)lastMessage;
- (TIFavoniusTypingSessionAnalyzer)initWithUserModel:(id)a3;
- (TIKeyboardState)lastMessageKeyboardState;
- (TITypingSession)currentSession;
- (TIUserModeling)userModel;
- (double)lastMessageEndTime;
- (double)lastMessageStartTime;
- (id)deleteLengthMetrics:(id)a3 nextWordEntryCandText:(id)a4;
- (int)durationInMillisecondsFromStartTime:(double)a3 endTime:(double)a4;
- (int)lastMessageWordsEntered;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)addDoubleToTransientCounter:(double)a3 forKey:(id)a4 andContext:(id)a5 andCandidateString:(id)a6;
- (void)addIntegerToTransientCounter:(int)a3 forKey:(id)a4 andContext:(id)a5 andCandidateString:(id)a6;
- (void)handleDeleteWord:(id)a3 nextAction:(id)a4;
- (void)handlePath:(id)a3;
- (void)handleWordEntry:(id)a3;
- (void)incrementTransientCounterForKey:(id)a3 andContext:(id)a4 andCandidateString:(id)a5;
- (void)logPathedCandidate:(id)a3 forKey:(id)a4 isCompletion:(BOOL)a5;
- (void)reportLastMessage;
- (void)setCurrentSession:(id)a3;
- (void)setLastMessage:(id)a3;
- (void)setLastMessageEndTime:(double)a3;
- (void)setLastMessageKeyboardState:(id)a3;
- (void)setLastMessageStartTime:(double)a3;
- (void)setLastMessageWordsEntered:(int)a3;
- (void)setUserModel:(id)a3;
- (void)trackMessagesForAction:(id)a3;
- (void)updateDurationCounterForWord:(id)a3 forTypingContext:(id)a4;
- (void)updateSourceCountersForCandidate:(id)a3 withText:(id)a4 andContext:(id)a5 hasPQTSource:(BOOL)a6;
@end

@implementation TIFavoniusTypingSessionAnalyzer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastMessageKeyboardState);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_testingParameters, 0);

  objc_storeStrong((id *)&self->_activeInputModes, 0);
}

- (void)setLastMessageWordsEntered:(int)a3
{
  self->_lastMessageWordsEntered = a3;
}

- (int)lastMessageWordsEntered
{
  return self->_lastMessageWordsEntered;
}

- (void)setLastMessageEndTime:(double)a3
{
  self->_lastMessageEndTime = a3;
}

- (double)lastMessageEndTime
{
  return self->_lastMessageEndTime;
}

- (void)setLastMessageStartTime:(double)a3
{
  self->_lastMessageStartTime = a3;
}

- (double)lastMessageStartTime
{
  return self->_lastMessageStartTime;
}

- (void)setLastMessageKeyboardState:(id)a3
{
}

- (TIKeyboardState)lastMessageKeyboardState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastMessageKeyboardState);

  return (TIKeyboardState *)WeakRetained;
}

- (void)setLastMessage:(id)a3
{
}

- (NSString)lastMessage
{
  return self->_lastMessage;
}

- (void)setCurrentSession:(id)a3
{
}

- (TITypingSession)currentSession
{
  return self->_currentSession;
}

- (void)setUserModel:(id)a3
{
}

- (TIUserModeling)userModel
{
  return self->_userModel;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v8 = a3;
  if (a5)
  {
    objc_storeStrong((id *)&self->_currentSession, a3);
    v9 = [v8 sessionParams];
    v10 = [v9 activeInputModes];
    activeInputModes = self->_activeInputModes;
    self->_activeInputModes = v10;

    v12 = [v8 sessionParams];
    v13 = [v12 testingParameters];
    testingParameters = self->_testingParameters;
    self->_testingParameters = v13;

    v15 = [v8 userActionHistory];
    unsigned int v16 = [v15 count];

    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = 0;
      v19 = 0;
      uint64_t v20 = (int)(v16 - 1);
      do
      {
        v21 = v19;
        v22 = [v8 userActionHistory];
        v19 = [v22 objectAtIndex:v18];

        if (v18 >= v20)
        {
          v24 = 0;
        }
        else
        {
          v23 = [v8 userActionHistory];
          v24 = [v23 objectAtIndex:v18 + 1];
        }
        int v25 = [v19 actionType];
        switch(v25)
        {
          case 4:
            [(TIFavoniusTypingSessionAnalyzer *)self handlePath:v19];
            break;
          case 1:
            [(TIFavoniusTypingSessionAnalyzer *)self handleDeleteWord:v21 nextAction:v24];
            break;
          case 0:
            [(TIFavoniusTypingSessionAnalyzer *)self handleWordEntry:v19];
            break;
        }
        [(TIFavoniusTypingSessionAnalyzer *)self trackMessagesForAction:v19];

        ++v18;
      }
      while (v17 != v18);
    }
    [(TIFavoniusTypingSessionAnalyzer *)self reportLastMessage];
  }

  return a5 != 0;
}

- (int)durationInMillisecondsFromStartTime:(double)a3 endTime:(double)a4
{
  return (int)((a4 - a3) * 1000.0 + 0.5);
}

- (void)reportLastMessage
{
  v3 = [(TIFavoniusTypingSessionAnalyzer *)self lastMessage];

  if (v3)
  {
    [(TIFavoniusTypingSessionAnalyzer *)self lastMessageStartTime];
    double v5 = v4;
    [(TIFavoniusTypingSessionAnalyzer *)self lastMessageEndTime];
    uint64_t v7 = [(TIFavoniusTypingSessionAnalyzer *)self durationInMillisecondsFromStartTime:v5 endTime:v6];
    id v8 = [TIKBAnalyticsMetricsContext alloc];
    v9 = [(TIFavoniusTypingSessionAnalyzer *)self lastMessageKeyboardState];
    v12 = [(TIKBAnalyticsMetricsContext *)v8 initWithKeyboardState:v9 activeInputModes:self->_activeInputModes testingParameters:self->_testingParameters];

    [(TIUserModeling *)self->_userModel addIntegerToTransientCounter:1 forKey:@"messageCount" andCandidateLength:0 andContext:v12];
    userModel = self->_userModel;
    v11 = [(TIFavoniusTypingSessionAnalyzer *)self lastMessage];
    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", [v11 length], @"messageLength", 0, v12);

    [(TIUserModeling *)self->_userModel addIntegerToTransientCounter:[(TIFavoniusTypingSessionAnalyzer *)self lastMessageWordsEntered] forKey:@"messageWords" andCandidateLength:0 andContext:v12];
    [(TIUserModeling *)self->_userModel addIntegerToTransientCounter:v7 forKey:@"messageDuration" andCandidateLength:0 andContext:v12];
    [(TIFavoniusTypingSessionAnalyzer *)self setLastMessage:0];
    [(TIFavoniusTypingSessionAnalyzer *)self setLastMessageKeyboardState:0];
    [(TIFavoniusTypingSessionAnalyzer *)self setLastMessageStartTime:-1.0];
    [(TIFavoniusTypingSessionAnalyzer *)self setLastMessageEndTime:-1.0];
    [(TIFavoniusTypingSessionAnalyzer *)self setLastMessageWordsEntered:0];
  }
}

- (void)trackMessagesForAction:(id)a3
{
  id v18 = a3;
  double v4 = [v18 keyboardState];
  double v5 = [v4 clientIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.MobileSMS"];

  if (v6)
  {
    uint64_t v7 = [v18 documentState];
    id v8 = [v4 documentState];
    if ([v7 documentIsEmpty]) {
      [(TIFavoniusTypingSessionAnalyzer *)self reportLastMessage];
    }
    [v18 startTime];
    if (v9 > 0.0)
    {
      [v18 endTime];
      if (v10 > 0.0)
      {
        v11 = [v8 contextBeforeInput];
        [(TIFavoniusTypingSessionAnalyzer *)self setLastMessage:v11];

        [(TIFavoniusTypingSessionAnalyzer *)self setLastMessageKeyboardState:v4];
        [(TIFavoniusTypingSessionAnalyzer *)self lastMessageStartTime];
        v12 = v18;
        if (v13 == -1.0)
        {
          [v18 startTime];
          -[TIFavoniusTypingSessionAnalyzer setLastMessageStartTime:](self, "setLastMessageStartTime:");
          v12 = v18;
        }
        [v12 endTime];
        -[TIFavoniusTypingSessionAnalyzer setLastMessageEndTime:](self, "setLastMessageEndTime:");
        if (![v18 actionType])
        {
          v14 = [v18 acceptedCandidate];
          v15 = [v14 candidate];
          unsigned int v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v17 = [v15 stringByTrimmingCharactersInSet:v16];

          if ([v17 length]) {
            [(TIFavoniusTypingSessionAnalyzer *)self setLastMessageWordsEntered:[(TIFavoniusTypingSessionAnalyzer *)self lastMessageWordsEntered]+ 1];
          }
        }
      }
    }
  }
}

- (void)handlePath:(id)a3
{
  id v4 = a3;
  double v5 = [TIKBAnalyticsMetricsContext alloc];
  int v6 = [v4 keyboardState];
  double v10 = [(TIKBAnalyticsMetricsContext *)v5 initWithKeyboardState:v6 activeInputModes:self->_activeInputModes testingParameters:self->_testingParameters];

  userModel = self->_userModel;
  uint64_t v8 = kFeatureValueWithWordLenCandidatesPathed;
  uint64_t v9 = [v4 syllableCount];

  [(TIUserModeling *)userModel addIntegerToTransientCounter:1 forKey:v8 andCandidateLength:v9 andContext:v10];
}

- (void)handleDeleteWord:(id)a3 nextAction:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 actionType])
  {
    id v8 = v6;
    uint64_t v9 = [v8 acceptedCandidate];
    double v10 = [v9 candidate];
    v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v12 = [v10 stringByTrimmingCharactersInSet:v11];

    if ([v12 length])
    {
      double v13 = [v8 acceptedCandidate];
      int v14 = [v13 isContinuousPathConversion];

      if (v14)
      {
        v15 = [TIKBAnalyticsMetricsContext alloc];
        unsigned int v16 = [v8 keyboardState];
        uint64_t v17 = [(TIKBAnalyticsMetricsContext *)v15 initWithKeyboardState:v16 activeInputModes:self->_activeInputModes testingParameters:self->_testingParameters];

        if (v7 && ![v7 actionType])
        {
          id v18 = v7;
          v19 = [v18 acceptedCandidate];
          int v20 = [v19 isContinuousPathConversion];

          v21 = &kFeatureValueWithWordLenPathedWordsCorrectedByDeleteRepath;
          if (!v20) {
            v21 = &kFeatureValueWithWordLenPathedWordsCorrectedByDeleteTapped;
          }
          [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:*v21 andContext:v17 andCandidateString:v12];
          v42 = v18;
          v22 = [v18 acceptedCandidate];
          [v22 candidate];
          v24 = v23 = v17;
          int v25 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v26 = [v24 stringByTrimmingCharactersInSet:v25];

          v27 = v26;
          if ([v26 length])
          {
            v41 = v23;
            v28 = [v8 candidatesOffered];
            v29 = [v28 lastObject];

            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            v40 = v29;
            id obj = [v29 predictions];
            uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
            unint64_t v31 = 0x1E4F28000uLL;
            if (v30)
            {
              uint64_t v32 = v30;
              uint64_t v44 = *(void *)v46;
              v39 = v12;
              while (2)
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  v34 = v27;
                  if (*(void *)v46 != v44) {
                    objc_enumerationMutation(obj);
                  }
                  v35 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "candidate", v39);
                  v36 = [*(id *)(v31 + 2952) whitespaceCharacterSet];
                  v37 = [v35 stringByTrimmingCharactersInSet:v36];

                  v27 = v34;
                  if ([v34 isEqualToString:v37])
                  {
                    v12 = v39;
                    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenPathedWordsShownInCandidateBar andContext:v41 andCandidateString:v39];

                    goto LABEL_21;
                  }

                  unint64_t v31 = 0x1E4F28000;
                }
                uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
                v12 = v39;
                if (v32) {
                  continue;
                }
                break;
              }
            }
LABEL_21:

            v38 = [(TIFavoniusTypingSessionAnalyzer *)self deleteLengthMetrics:v12 nextWordEntryCandText:v27];
            uint64_t v17 = v41;
            [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:v38 andContext:v41 andCandidateString:v12];
          }
          else
          {
            [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenPathedWordsCorrectedByOther andContext:v23 andCandidateString:v12];
            uint64_t v17 = v23;
          }
        }
        else
        {
          [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenPathedWordsCorrectedByOther andContext:v17 andCandidateString:v12];
        }
      }
    }
  }
}

- (id)deleteLengthMetrics:(id)a3 nextWordEntryCandText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 length];
  int v8 = [v6 length];
  if (v8 >= v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v9)
  {
    uint64_t v10 = 0;
    while (1)
    {
      int v11 = [v6 characterAtIndex:v10];
      if (v11 != [v5 characterAtIndex:v10]) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_8;
      }
    }
    LODWORD(v9) = v10;
    if (!v10) {
      goto LABEL_15;
    }
LABEL_8:
    if (v7 >= 0) {
      int v12 = v7;
    }
    else {
      int v12 = v7 + 1;
    }
    int v13 = v12 >> 1;
    if ((v7 & 1) != 0 || v9 != v13)
    {
      if ((int)v9 <= v13) {
        int v14 = &kFeatureValueWithWordLenMoreThanHalfOfWordDeleted;
      }
      else {
        int v14 = &kFeatureValueWithWordLenLessThanHalfOfWordDeleted;
      }
    }
    else
    {
      int v14 = &kFeatureValueWithWordLenHalfOfWordDeleted;
    }
  }
  else
  {
LABEL_15:
    int v14 = &kFeatureValueWithWordLenWholeWordDeleted;
  }
  v15 = *v14;

  return v15;
}

- (void)updateSourceCountersForCandidate:(id)a3 withText:(id)a4 andContext:(id)a5 hasPQTSource:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v14 isResponseKitCandidate]) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceResponseKitRaw andContext:v11 andCandidateString:v10];
  }
  if ([v14 isEmojiCandidate]) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceEmojiRaw andContext:v11 andCandidateString:v10];
  }
  if (v6) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourcePQTRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x8000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x20000) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceStaticDictionaryRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x10000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x40000) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceDynamicDictionaryRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 4) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceTextReplacementsRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 8) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceAddressBookRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x10) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceNamedEntitiesRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x20) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceOOVRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x400) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceSupplementalLexiconRaw andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x80) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceOffensive andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x100) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceVulgar andContext:v11 andCandidateString:v10];
  }
  if (([v14 sourceMask] & 0x200) != 0) {
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenCandidateSourceSensitive andContext:v11 andCandidateString:v10];
  }
  if ([v14 isResponseKitCandidate])
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceResponseKitOrdered;
LABEL_51:
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:*v12 andContext:v11 andCandidateString:v10];
    goto LABEL_52;
  }
  int v13 = [v14 isEmojiCandidate];
  int v12 = &kFeatureValueWithWordLenCandidateSourcePQTOrdered;
  if (v13) {
    int v12 = &kFeatureValueWithWordLenCandidateSourceEmojiOrdered;
  }
  if ((v13 & 1) != 0 || v6) {
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 0x400) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceSupplementalLexiconOrdered;
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 0x10) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceNamedEntitiesOrdered;
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 8) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceAddressBookOrdered;
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 4) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceTextReplacementsOrdered;
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 0x20) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceOOVOrdered;
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 0x10000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x40000) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceDynamicDictionaryOrdered;
    goto LABEL_51;
  }
  if (([v14 sourceMask] & 0x8000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x20000) != 0)
  {
    int v12 = &kFeatureValueWithWordLenCandidateSourceStaticDictionaryOrdered;
    goto LABEL_51;
  }
LABEL_52:
}

- (BOOL)updatePQTCountersForCandidate:(id)a3 withText:(id)a4 andContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v8 proactiveTrigger];
    int v12 = v11;
    if (v11)
    {
      unsigned int v13 = [v11 triggerSourceType];
      if (v13 >= 3)
      {
        v21 = 0;
      }
      else
      {
        id v14 = off_1E6E2A350[v13];
        if ([(__CFString *)v14 isEqualToString:@"LanguageModeling"]) {
          [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveSourceLanguageModeling andContext:v10 andCandidateString:v9];
        }
        if ([(__CFString *)v14 isEqualToString:@"ResponseKit"]) {
          [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveSourceResponseKit andContext:v10 andCandidateString:v9];
        }
        v21 = v14;
        if ([(__CFString *)v14 isEqualToString:@"TaggedTextField"]) {
          -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveSourceTaggedTextField, v10, v9, v14);
        }
      }
      v22 = v12;
      TIStatisticsCategoriesForProactiveTrigger(v12);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      if (obj)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(obj);
              }
              v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if (objc_msgSend(v19, "isEqualToString:", @"1stPerson", v21, v22)) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryFirstPerson andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"3rdPerson"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryThirdPerson andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactAnyPhone"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactAnyPhone andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactSpecificPhone"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactSpecificPhone andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactFax"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactFax andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactAnyAddress"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactAnyAddress andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactAddressHome"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactAddressHome andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactAddressWork"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactAddressWork andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactEmail"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactEmail andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactFaceTime"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactFaceTime andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"contactBio"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryContactBio andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"socialMedia"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategorySocialMedia andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"locationAutocompleteSendCurrentButton"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryLocationAutocompleteSendCurrentButton andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"recentGenericAddress"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryRecentGenericAddress andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"recentPhone"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryRecentPhone andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"recentAddress"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryRecentAddress andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"eventAvailability"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryEventAvailability andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"eventNext"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryEventNext andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"money"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryMoney andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"health"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryHealth andContext:v10 andCandidateString:v9];
              }
              if ([v19 isEqualToString:@"navigation"]) {
                [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenProactiveCategoryNavigation andContext:v10 andCandidateString:v9];
              }
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v16);
        }
      }

      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return (char)v12;
}

- (void)handleWordEntry:(id)a3
{
  id v24 = a3;
  id v4 = [TIKBAnalyticsMetricsContext alloc];
  id v5 = [v24 keyboardState];
  BOOL v6 = [(TIKBAnalyticsMetricsContext *)v4 initWithKeyboardState:v5 activeInputModes:self->_activeInputModes testingParameters:self->_testingParameters];

  int v7 = [v24 acceptedCandidate];
  id v8 = [v7 candidate];
  id v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  if ([v10 length])
  {
    [(TIUserModeling *)self->_userModel addToDurableCounter:1 forKey:kFeatureCounterTotalWordsTyped];
    [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureCounterWithWordLenWordsTyped andContext:v6 andCandidateString:v10];
    id v11 = [v24 acceptedCandidate];
    BOOL v12 = [(TIFavoniusTypingSessionAnalyzer *)self updatePQTCountersForCandidate:v11 withText:v10 andContext:v6];

    unsigned int v13 = [v24 acceptedCandidate];
    [(TIFavoniusTypingSessionAnalyzer *)self updateSourceCountersForCandidate:v13 withText:v10 andContext:v6 hasPQTSource:v12];

    if ([v24 wordEntryType])
    {
      [(TIUserModeling *)self->_userModel addToDurableCounter:1 forKey:kFeatureCounterTotalWordsAutocorrected];
      [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenWordsAutocorrected andContext:v6 andCandidateString:v10];
    }
    if (([v24 wordEntryType] & 4) != 0)
    {
      [(TIUserModeling *)self->_userModel addToDurableCounter:1 forKey:kFeatureCounterTotalWordsFromCandidateBar];
      [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenWordsFromCandidateBar andContext:v6 andCandidateString:v10];
    }
    id v14 = [v24 acceptedCandidate];
    int v15 = [v14 isContinuousPathConversion];

    if (v15)
    {
      [(TIUserModeling *)self->_userModel addToDurableCounter:1 forKey:kFeatureCounterTotalWordsPathed];
      uint64_t v16 = [v24 originalCandidate];

      if (v16)
      {
        uint64_t v17 = [v24 originalCandidate];
        -[TIFavoniusTypingSessionAnalyzer logPathedCandidate:forKey:isCompletion:](self, "logPathedCandidate:forKey:isCompletion:", v17, v6, [v24 isContinuousPathCompletion]);

        id v18 = [v24 originalCandidate];
        v19 = [v18 candidate];
        int v20 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v21 = [v19 stringByTrimmingCharactersInSet:v20];

        [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenPathedWordsCorrectedFromCandidateBar andContext:v6 andCandidateString:v21];
      }
      else
      {
        v23 = [v24 acceptedCandidate];
        -[TIFavoniusTypingSessionAnalyzer logPathedCandidate:forKey:isCompletion:](self, "logPathedCandidate:forKey:isCompletion:", v23, v6, [v24 isContinuousPathCompletion]);
      }
    }
    else if (([v24 wordEntryType] & 4) == 0)
    {
      if ([(TIFavoniusTypingSessionAnalyzer *)self isPathable:v10 context:v6]
        && ([v24 isOOV] & 1) == 0)
      {
        uint64_t v22 = kFeatureValueWithWordLenPathEligibleWordsTapped;
      }
      else
      {
        uint64_t v22 = kFeatureValueWithWordLenPathIneligibleWordsTapped;
      }
      [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:v22 andContext:v6 andCandidateString:v10];
    }
    if ([v24 isMultilingual])
    {
      [(TIUserModeling *)self->_userModel addToDurableCounter:1 forKey:kFeatureCounterTotalWordsTypedInSecondaryLanguage];
      [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureCounterWordsTypedInSecondaryLanguage andContext:v6 andCandidateString:v10];
    }
    if ([(TIKBAnalyticsMetricsContext *)v6 keyboardType] == 3)
    {
      [(TIUserModeling *)self->_userModel addToDurableCounter:1 forKey:kFeatureCounterTotalWordsTypedOnFloatingKeyboard];
      [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureCounterWithWordLenWordsTypedOnFloatingKeyboard andContext:v6 andCandidateString:v10];
    }
    [(TIFavoniusTypingSessionAnalyzer *)self updateDurationCounterForWord:v24 forTypingContext:v6];
  }
}

- (void)logPathedCandidate:(id)a3 forKey:(id)a4 isCompletion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 candidate];
  id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v12 = [v9 stringByTrimmingCharactersInSet:v10];

  [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:kFeatureValueWithWordLenPathedWordInsertions andContext:v8 andCandidateString:v12];
  id v11 = &kFeatureValueWithWordLenWordCompletionsPathed;
  if (!v5) {
    id v11 = &kFeatureValueWithWordLenWholeWordsPathed;
  }
  [(TIFavoniusTypingSessionAnalyzer *)self incrementTransientCounterForKey:*v11 andContext:v8 andCandidateString:v12];
}

- (void)updateDurationCounterForWord:(id)a3 forTypingContext:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 acceptedCandidate];
  id v9 = [v8 candidate];
  id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];

  id v12 = [v6 acceptedCandidate];
  LODWORD(v10) = [v12 isContinuousPathConversion];

  unsigned int v13 = [v6 allTouches];
  int v14 = [v13 count];

  if (v10)
  {
    if (v14 >= 2)
    {
      int v15 = [v6 allTouches];
      uint64_t v16 = [v15 objectAtIndex:0];
      [v16 timestamp];
      double v18 = v17;

      v19 = [v6 allTouches];
      int v20 = [v19 objectAtIndex:(v14 - 1)];
      [v20 timestamp];
      double v22 = v21;

      uint64_t v23 = (int)((v22 - v18) * 1000.0);
      uint64_t v24 = kFeatureCounterDurationPathedWords;
      long long v25 = self;
LABEL_24:
      [(TIFavoniusTypingSessionAnalyzer *)v25 addIntegerToTransientCounter:v23 forKey:v24 andContext:v7 andCandidateString:v11];
    }
  }
  else if (v14 >= 2)
  {
    v42 = self;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v26 = [v6 allTouches];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      int v29 = 0;
      uint64_t v30 = *(void *)v44;
      double v31 = 0.0;
      double v32 = 0.0;
      double v33 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(v26);
          }
          v35 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (-v29 == i)
          {
            [*(id *)(*((void *)&v43 + 1) + 8 * i) timestamp];
            double v32 = v36;
            [v35 timestamp];
            double v31 = v37;
          }
          if (![v35 stage])
          {
            [v35 timestamp];
            double v32 = v38;
            double v39 = v38 - v31;
            if (v39 > 2.5) {
              double v39 = 2.5;
            }
            double v33 = v33 + v39;
          }
          if ([v35 stage] == 2 || objc_msgSend(v35, "stage") == 3)
          {
            [v35 timestamp];
            double v33 = v33 + v40 - v32;
            [v35 timestamp];
            double v31 = v41;
          }
        }
        v29 += v28;
        uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v28);
    }
    else
    {
      double v33 = 0.0;
    }

    uint64_t v23 = (int)(v33 * 1000.0);
    uint64_t v24 = kFeatureCounterDurationTappedWords;
    long long v25 = v42;
    goto LABEL_24;
  }
}

- (BOOL)isPathable:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28B88];
  id v7 = a3;
  id v8 = [v6 whitespaceAndNewlineCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  id v10 = [v5 inputLanguage];
  LODWORD(v7) = [v10 isEqualToString:@"zh"];

  if (!v7)
  {
    if ((unint64_t)[v9 length] >= 2) {
      goto LABEL_7;
    }
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  id v11 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v12 = [v9 rangeOfCharacterFromSet:v11];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  unsigned int v13 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
  if ([v9 rangeOfCharacterFromSet:v13] != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_11;
  }
  int v14 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
  uint64_t v15 = [v9 rangeOfCharacterFromSet:v14];

  if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v16 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  double v17 = [v9 stringByTrimmingCharactersInSet:v16];
  uint64_t v18 = [v17 length];

  if (v18) {
    goto LABEL_11;
  }
  int v19 = [v5 keyboardType];
  if ((v19 - 1) >= 2)
  {
    if (v19 == 3)
    {
      BOOL v20 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v20 = [v5 userInterfaceIdiom] == 0;
LABEL_12:

  return v20;
}

- (void)incrementTransientCounterForKey:(id)a3 andContext:(id)a4 andCandidateString:(id)a5
{
}

- (void)addDoubleToTransientCounter:(double)a3 forKey:(id)a4 andContext:(id)a5 andCandidateString:(id)a6
{
  id v11 = a4;
  id v10 = a5;
  if ([a6 length]) {
    -[TIUserModeling addDoubleToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addDoubleToTransientCounter:forKey:andCandidateLength:andContext:", v11, a3);
  }
}

- (void)addIntegerToTransientCounter:(int)a3 forKey:(id)a4 andContext:(id)a5 andCandidateString:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v11 = a4;
  id v10 = a5;
  if ([a6 length]) {
    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", v8, v11);
  }
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TIFavoniusTypingSessionAnalyzer)initWithUserModel:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIFavoniusTypingSessionAnalyzer;
  id v6 = [(TIFavoniusTypingSessionAnalyzer *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    currentSession = v6->_currentSession;
    v6->_currentSession = 0;

    objc_storeStrong((id *)&v7->_userModel, a3);
    lastMessage = v7->_lastMessage;
    v7->_lastMessage = 0;

    objc_storeWeak((id *)&v7->_lastMessageKeyboardState, 0);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v7->_lastMessageStartTime = _Q0;
    v7->_lastMessageWordsEntered = 0;
    activeInputModes = v7->_activeInputModes;
    v7->_activeInputModes = 0;

    testingParameters = v7->_testingParameters;
    v7->_testingParameters = 0;
  }
  return v7;
}

+ (id)favoniusTypingSessionAnalyzerForUserModel:(id)a3
{
  id v3 = a3;
  id v4 = [[TIFavoniusTypingSessionAnalyzer alloc] initWithUserModel:v3];

  return v4;
}

@end