@interface TIAsteriskCorrectionMessageEvent
- (BOOL)hasText:(id)a3;
- (BOOL)hasTextInWordEntry:(id)a3;
- (NSString)asteriskCorrectionType;
- (NSString)bundleId;
- (NSString)messageText;
- (NSString)wordCountType;
- (TIAsteriskCorrectionMessageEvent)initWithSession:(id)a3 andPrevMsgAutocorrectionType:(unint64_t)a4 andBundleId:(id)a5;
- (TITypingSession)messageSession;
- (TITypingSessionAligned)messageAlignedSession;
- (id)assessAsteriskCorrection;
- (int)finalWordsEnteredCount;
- (int)wordsEnteredCount;
- (unint64_t)prevMsgAutocorrectionType;
- (void)adjustEmojiCountsFromKeyboardInputForWordAligned:(id)a3;
- (void)analyzeEvent;
- (void)analyzeWordEntry:(id)a3;
- (void)analyzeWordEntryAligned:(id)a3;
- (void)dispatchAsteriskEventWithFeatureUsageMetricsCache:(id)a3 andContext:(id)a4 assetAvailabilityStatus:(int64_t)a5;
- (void)setAsteriskCorrectionType:(id)a3;
- (void)setFinalWordsEnteredCount:(int)a3;
- (void)setMessageAlignedSession:(id)a3;
- (void)setMessageSession:(id)a3;
- (void)setMessageText:(id)a3;
- (void)setWordCountType:(id)a3;
- (void)setWordsEnteredCount:(int)a3;
@end

@implementation TIAsteriskCorrectionMessageEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageAlignedSession, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_wordCountType, 0);
  objc_storeStrong((id *)&self->_asteriskCorrectionType, 0);

  objc_storeStrong((id *)&self->_messageText, 0);
}

- (void)setMessageAlignedSession:(id)a3
{
}

- (TITypingSessionAligned)messageAlignedSession
{
  return (TITypingSessionAligned *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMessageSession:(id)a3
{
}

- (TITypingSession)messageSession
{
  return (TITypingSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFinalWordsEnteredCount:(int)a3
{
  self->_finalWordsEnteredCount = a3;
}

- (int)finalWordsEnteredCount
{
  return self->_finalWordsEnteredCount;
}

- (void)setWordsEnteredCount:(int)a3
{
  self->_wordsEnteredCount = a3;
}

- (int)wordsEnteredCount
{
  return self->_wordsEnteredCount;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)prevMsgAutocorrectionType
{
  return self->_prevMsgAutocorrectionType;
}

- (void)setWordCountType:(id)a3
{
}

- (NSString)wordCountType
{
  return self->_wordCountType;
}

- (void)setAsteriskCorrectionType:(id)a3
{
}

- (NSString)asteriskCorrectionType
{
  return self->_asteriskCorrectionType;
}

- (void)setMessageText:(id)a3
{
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)dispatchAsteriskEventWithFeatureUsageMetricsCache:(id)a3 andContext:(id)a4 assetAvailabilityStatus:(int64_t)a5
{
  v34[17] = *MEMORY[0x1E4F143B8];
  if (self->_finalWordsEnteredCount >= 1)
  {
    id v8 = a4;
    id v9 = a3;
    v34[0] = [(TIAsteriskCorrectionMessageEvent *)self assessAsteriskCorrection];
    v32 = (void *)v34[0];
    v33[0] = @"correctionType";
    v33[1] = @"prevMessageAutoCorrectionType";
    v31 = [NSNumber numberWithUnsignedInteger:self->_prevMsgAutocorrectionType];
    bundleId = self->_bundleId;
    v34[1] = v31;
    v34[2] = bundleId;
    v33[2] = @"bundleId";
    v33[3] = kFeatureKeyboardUsage;
    v30 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v34[3] = v30;
    v33[4] = kFeatureContinuousPathUsage;
    v29 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v34[4] = v29;
    v33[5] = kFeatureAutocorrectionUsage;
    v28 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v34[5] = v28;
    v33[6] = kFeatureCandidateBarUsage;
    v27 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v34[6] = v27;
    v33[7] = kFeatureMultilingualUsage;
    v26 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v34[7] = v26;
    v33[8] = kFeatureStringTypingSpeed;
    v25 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");

    v34[8] = v25;
    v33[9] = kFeatureStringAssetAvailabilityStatus;
    v11 = @"Installed";
    if (!a5) {
      v11 = @"Unavailable";
    }
    v12 = v11;
    v34[9] = v12;
    v33[10] = kFeatureStringKeyboardLanguage;
    v13 = [v8 inputLanguage];
    v34[10] = v13;
    v33[11] = kFeatureStringKeyboardRegion;
    v14 = [v8 inputRegion];
    v34[11] = v14;
    v33[12] = kFeatureStringKeyboardVariant;
    v15 = [v8 inputVariant];
    v34[12] = v15;
    v33[13] = kFeatureStringKeyboardSecondaryLanguage;
    v16 = [v8 secondaryLanguage];
    v34[13] = v16;
    v33[14] = kFeatureStringKeyboardSecondaryRegion;
    v17 = [v8 secondaryRegion];
    v34[14] = v17;
    v33[15] = kFeatureStringKeyboardLayout;
    v18 = [v8 layoutName];
    v34[15] = v18;
    v33[16] = kFeatureStringKeyboardType;
    v19 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", [v8 keyboardType]);
    v34[16] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:17];

    v21 = [MEMORY[0x1E4FAE260] sharedInstance];
    v22 = [v8 testingParameters];

    [v21 dispatchEventToInputAnalyticsDomainWithName:@"asteriskCorrection" payload:v20 testingParameters:v22 allowSparsePayload:0];
    v23 = +[TIProactiveQuickTypeManager sharedInstance];
    v24 = [NSString stringWithUTF8String:"SpeedMetric"];
    [v23 propogateMetrics:v24 data:v20];
  }
}

- (void)adjustEmojiCountsFromKeyboardInputForWordAligned:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend(a3, "alignedKeyboardInputs", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) string];
        if ([v12 _containsEmoji])
        {
          ++v9;
          if (v7 > 0) {
            ++v8;
          }
          int v7 = 0;
        }
        else
        {
          v7 += [(TIAsteriskCorrectionMessageEvent *)self hasText:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);

    if (v7 <= 0) {
      int v13 = v8;
    }
    else {
      int v13 = v8 + 1;
    }
    if (v9 >= 1)
    {
      v13 += v9;
      self->_wordsEnteredCount = v13 + self->_wordsEnteredCount - 1;
    }
  }
  else
  {

    int v13 = 0;
  }
  self->_finalWordsEnteredCount += v13;
}

- (BOOL)hasText:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 whitespaceCharacterSet];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

  int v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  int v8 = [v6 stringByTrimmingCharactersInSet:v7];

  LOBYTE(v7) = [v8 length] != 0;
  return (char)v7;
}

- (void)analyzeWordEntryAligned:(id)a3
{
  id v17 = a3;
  id v4 = [v17 originalWord];
  uint64_t v5 = [v4 editedEntry];
  uint64_t v6 = [v17 originalWord];
  int v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 editedEntry];

    int v7 = (void *)v8;
  }

  int v9 = [v7 acceptedCandidate];
  uint64_t v10 = [v9 candidate];
  v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v12 = [v10 stringByTrimmingCharactersInSet:v11];

  int v13 = [v7 keyboardState];
  int v14 = [v13 emojiSearchMode];

  long long v15 = [v7 keyboardState];
  int v16 = [v15 emojiPopoverMode];

  if ([v12 _containsEmoji])
  {
    if (v16 || v14 || ([v7 wordEntryType] & 4) != 0) {
      goto LABEL_7;
    }
  }
  else
  {
    if (v14) {
      goto LABEL_11;
    }
    if ([v9 isContinuousPathConversion])
    {
LABEL_7:
      ++self->_finalWordsEnteredCount;
      goto LABEL_11;
    }
  }
  [(TIAsteriskCorrectionMessageEvent *)self adjustEmojiCountsFromKeyboardInputForWordAligned:v17];
LABEL_11:
}

- (BOOL)hasTextInWordEntry:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 acceptedCandidate];
  uint64_t v6 = [v5 candidate];
  BOOL v7 = [(TIAsteriskCorrectionMessageEvent *)self hasText:v6];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v9 = objc_msgSend(v4, "allKeyboardInputs", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) string];
          BOOL v15 = [(TIAsteriskCorrectionMessageEvent *)self hasText:v14];

          if (v15)
          {
            BOOL v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_13:
  }
  return v8;
}

- (void)analyzeWordEntry:(id)a3
{
  id v4 = a3;
  id v18 = [v4 keyboardState];
  uint64_t v5 = [v18 documentState];
  uint64_t v6 = [v5 contextBeforeInput];
  if (v6)
  {
    BOOL v7 = [v5 contextBeforeInput];
  }
  else
  {
    BOOL v7 = &stru_1F3F7A998;
  }

  BOOL v8 = [v5 contextAfterInput];
  if (v8)
  {
    int v9 = [v5 contextAfterInput];
  }
  else
  {
    int v9 = &stru_1F3F7A998;
  }

  uint64_t v10 = [v5 selectedText];
  if (v10)
  {
    uint64_t v11 = [v5 selectedText];
  }
  else
  {
    uint64_t v11 = &stru_1F3F7A998;
  }

  uint64_t v12 = [(__CFString *)v11 stringByAppendingString:v9];
  int v13 = [(__CFString *)v7 stringByAppendingString:v12];
  messageText = self->_messageText;
  self->_messageText = v13;

  BOOL v15 = [v4 keyboardState];
  char v16 = [v15 emojiSearchMode];

  BOOL v17 = [(TIAsteriskCorrectionMessageEvent *)self hasTextInWordEntry:v4];
  if ((v16 & 1) == 0 && v17) {
    ++self->_wordsEnteredCount;
  }
}

- (id)assessAsteriskCorrection
{
  messageText = self->_messageText;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v5 = [(NSString *)messageText stringByTrimmingCharactersInSet:v4];

  if (![v5 length]) {
    goto LABEL_18;
  }
  BOOL v6 = [v5 _firstChar] == 42;
  int v7 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1);
  BOOL v8 = &kTIACMessageHasNoCorrectionSymbol;
  if (v7 == 42 && !v6) {
    BOOL v8 = &kTIACMessageEndsWithAsterisk;
  }
  if (v6 && v7 != 42) {
    uint64_t v10 = (id *)&kTIACMessageBeginsWithAsterisk;
  }
  else {
    uint64_t v10 = (id *)v8;
  }
  objc_storeStrong((id *)&self->_asteriskCorrectionType, *v10);
  int finalWordsEnteredCount = self->_finalWordsEnteredCount;
  if (finalWordsEnteredCount == 1)
  {
    uint64_t v12 = &kTIACSingleWordCountType;
LABEL_14:
    int v13 = *v12;
    wordCountType = self->_wordCountType;
    self->_wordCountType = v13;

    goto LABEL_15;
  }
  if (finalWordsEnteredCount >= 2)
  {
    uint64_t v12 = &kTIACMultiWordCountType;
    goto LABEL_14;
  }
LABEL_15:
  if ([(NSString *)self->_wordCountType isEqualToString:kTIACMultiWordCountType]
    && [(NSString *)self->_asteriskCorrectionType isEqualToString:kTIACMessageHasNoCorrectionSymbol])
  {
    id v15 = (id)kTIACCorrectionTypeNone;
    goto LABEL_19;
  }
LABEL_18:
  id v15 = [NSString stringWithFormat:@"%@%@", self->_wordCountType, self->_asteriskCorrectionType];
LABEL_19:
  char v16 = v15;

  return v16;
}

- (void)analyzeEvent
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v3 = [(TITypingSession *)self->_messageSession userActionHistory];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (![v9 actionType])
        {
          id v10 = v9;
          [(TIAsteriskCorrectionMessageEvent *)self analyzeWordEntry:v10];
          uint64_t v11 = [v10 keyboardState];

          BOOL v6 = (void *)v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = [(TITypingSessionAligned *)self->_messageAlignedSession alignedEntries];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        [(TIAsteriskCorrectionMessageEvent *)self analyzeWordEntryAligned:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v14);
  }

  BOOL v17 = [TIKBAnalyticsMetricsContext alloc];
  id v18 = [(TITypingSession *)self->_messageSession sessionParams];
  long long v19 = [v18 activeInputModes];
  long long v20 = [(TITypingSession *)self->_messageSession sessionParams];
  v21 = [v20 testingParameters];
  uint64_t v22 = [(TIKBAnalyticsMetricsContext *)v17 initWithKeyboardState:v6 activeInputModes:v19 testingParameters:v21];

  v23 = [(TITypingSession *)self->_messageSession featureUsageMetricsCache];
  v24 = [(TITypingSession *)self->_messageSession sessionParams];
  -[TIAsteriskCorrectionMessageEvent dispatchAsteriskEventWithFeatureUsageMetricsCache:andContext:assetAvailabilityStatus:](self, "dispatchAsteriskEventWithFeatureUsageMetricsCache:andContext:assetAvailabilityStatus:", v23, v22, [v24 assetAvailabilityStatus]);
}

- (TIAsteriskCorrectionMessageEvent)initWithSession:(id)a3 andPrevMsgAutocorrectionType:(unint64_t)a4 andBundleId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TIAsteriskCorrectionMessageEvent;
  uint64_t v11 = [(TIAsteriskCorrectionMessageEvent *)&v17 init];
  uint64_t v12 = v11;
  if (v11)
  {
    messageText = v11->_messageText;
    v11->_messageText = (NSString *)&stru_1F3F7A998;

    objc_storeStrong((id *)&v12->_asteriskCorrectionType, (id)kTIACUnknown);
    objc_storeStrong((id *)&v12->_wordCountType, (id)kTIACUnknownWordCountType);
    v12->_prevMsgAutocorrectionType = a4;
    objc_storeStrong((id *)&v12->_messageSession, a3);
    uint64_t v14 = [[TITypingSessionAligned alloc] initWithSession:v9];
    messageAlignedSession = v12->_messageAlignedSession;
    v12->_messageAlignedSession = v14;

    objc_storeStrong((id *)&v12->_bundleId, a5);
  }

  return v12;
}

@end