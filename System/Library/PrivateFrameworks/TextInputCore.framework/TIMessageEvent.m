@interface TIMessageEvent
- (BOOL)hasText:(id)a3;
- (BOOL)hasTextInWordEntry:(id)a3;
- (NSString)messageText;
- (TIMessageEvent)init;
- (double)endTime;
- (double)startTime;
- (int)addressBookCount;
- (int)durationInSecondsFromStartTime:(double)a3 endTime:(double)a4;
- (int)dynamicCount;
- (int)emojiPlaneCount;
- (int)emojiPopoverCount;
- (int)emojiPredictionCount;
- (int)emojiSearchCount;
- (int)finalWordsEnteredCount;
- (int)multilingualCount;
- (int)namedEntitiesCount;
- (int)oovCount;
- (int)pqtCount;
- (int)responseKitCount;
- (int)staticCount;
- (int)supplementalLexiconCount;
- (int)textReplacementsCount;
- (int)wordsEnteredCount;
- (void)adjustEmojiCountsFromKeyboardInputForWordAligned:(id)a3;
- (void)analyzeWordEntry:(id)a3;
- (void)analyzeWordEntryAligned:(id)a3;
- (void)dispatchWithFeatureUsageMetricsCache:(id)a3 andContext:(id)a4 assetAvailabilityStatus:(int64_t)a5;
- (void)setAddressBookCount:(int)a3;
- (void)setDynamicCount:(int)a3;
- (void)setEmojiPlaneCount:(int)a3;
- (void)setEmojiPopoverCount:(int)a3;
- (void)setEmojiPredictionCount:(int)a3;
- (void)setEmojiSearchCount:(int)a3;
- (void)setEndTime:(double)a3;
- (void)setFinalWordsEnteredCount:(int)a3;
- (void)setMessageText:(id)a3;
- (void)setMultilingualCount:(int)a3;
- (void)setNamedEntitiesCount:(int)a3;
- (void)setOovCount:(int)a3;
- (void)setPqtCount:(int)a3;
- (void)setResponseKitCount:(int)a3;
- (void)setStartTime:(double)a3;
- (void)setStaticCount:(int)a3;
- (void)setSupplementalLexiconCount:(int)a3;
- (void)setTextReplacementsCount:(int)a3;
- (void)setWordsEnteredCount:(int)a3;
@end

@implementation TIMessageEvent

- (void).cxx_destruct
{
}

- (void)setMultilingualCount:(int)a3
{
  self->_multilingualCount = a3;
}

- (int)multilingualCount
{
  return self->_multilingualCount;
}

- (void)setPqtCount:(int)a3
{
  self->_pqtCount = a3;
}

- (int)pqtCount
{
  return self->_pqtCount;
}

- (void)setResponseKitCount:(int)a3
{
  self->_responseKitCount = a3;
}

- (int)responseKitCount
{
  return self->_responseKitCount;
}

- (void)setEmojiPopoverCount:(int)a3
{
  self->_emojiPopoverCount = a3;
}

- (int)emojiPopoverCount
{
  return self->_emojiPopoverCount;
}

- (void)setEmojiSearchCount:(int)a3
{
  self->_emojiSearchCount = a3;
}

- (int)emojiSearchCount
{
  return self->_emojiSearchCount;
}

- (void)setEmojiPredictionCount:(int)a3
{
  self->_emojiPredictionCount = a3;
}

- (int)emojiPredictionCount
{
  return self->_emojiPredictionCount;
}

- (void)setEmojiPlaneCount:(int)a3
{
  self->_emojiPlaneCount = a3;
}

- (int)emojiPlaneCount
{
  return self->_emojiPlaneCount;
}

- (void)setSupplementalLexiconCount:(int)a3
{
  self->_supplementalLexiconCount = a3;
}

- (int)supplementalLexiconCount
{
  return self->_supplementalLexiconCount;
}

- (void)setOovCount:(int)a3
{
  self->_oovCount = a3;
}

- (int)oovCount
{
  return self->_oovCount;
}

- (void)setNamedEntitiesCount:(int)a3
{
  self->_namedEntitiesCount = a3;
}

- (int)namedEntitiesCount
{
  return self->_namedEntitiesCount;
}

- (void)setAddressBookCount:(int)a3
{
  self->_addressBookCount = a3;
}

- (int)addressBookCount
{
  return self->_addressBookCount;
}

- (void)setTextReplacementsCount:(int)a3
{
  self->_textReplacementsCount = a3;
}

- (int)textReplacementsCount
{
  return self->_textReplacementsCount;
}

- (void)setDynamicCount:(int)a3
{
  self->_dynamicCount = a3;
}

- (int)dynamicCount
{
  return self->_dynamicCount;
}

- (void)setStaticCount:(int)a3
{
  self->_staticCount = a3;
}

- (int)staticCount
{
  return self->_staticCount;
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

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setMessageText:(id)a3
{
}

- (NSString)messageText
{
  return self->_messageText;
}

- (int)durationInSecondsFromStartTime:(double)a3 endTime:(double)a4
{
  return (int)(a4 - a3 + 0.5);
}

- (void)dispatchWithFeatureUsageMetricsCache:(id)a3 andContext:(id)a4 assetAvailabilityStatus:(int64_t)a5
{
  v92[36] = *MEMORY[0x1E4F143B8];
  if (self->_wordsEnteredCount >= 1)
  {
    messageText = self->_messageText;
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = [(NSString *)messageText _graphemeCount];
    uint64_t v11 = [(TIMessageEvent *)self durationInSecondsFromStartTime:self->_startTime endTime:self->_endTime];
    v91[0] = @"totalMessageDuration";
    v90 = [NSNumber numberWithInt:v11];
    v92[0] = v90;
    v91[1] = @"totalMessageLength";
    v89 = [NSNumber numberWithInt:v10];
    v92[1] = v89;
    v91[2] = @"totalWordsEntered";
    v88 = [NSNumber numberWithInt:self->_wordsEnteredCount];
    v92[2] = v88;
    v91[3] = @"totalFinalWordEntered";
    v87 = [NSNumber numberWithInt:self->_finalWordsEnteredCount];
    v92[3] = v87;
    v91[4] = @"messageDuration";
    v12 = (void *)MEMORY[0x1E4FAE268];
    v86 = [NSNumber numberWithInt:v11];
    v85 = [v12 bucketNumber:v86 bucketThresholds:&unk_1F3FA78F8 bucketValues:0];
    v92[4] = v85;
    v91[5] = @"messageLength";
    v13 = (void *)MEMORY[0x1E4FAE268];
    v84 = [NSNumber numberWithInt:v10];
    v83 = [v13 bucketNumber:v84 bucketThresholds:&unk_1F3FA7910 bucketValues:0];
    v92[5] = v83;
    v91[6] = @"wordsEntered";
    v14 = (void *)MEMORY[0x1E4FAE268];
    v82 = [NSNumber numberWithInt:self->_wordsEnteredCount];
    v81 = [v14 bucketNumber:v82 bucketThresholds:&unk_1F3FA7928 bucketValues:0];
    v92[6] = v81;
    v91[7] = @"finalWordEntered";
    v15 = (void *)MEMORY[0x1E4FAE268];
    v80 = [NSNumber numberWithInt:self->_finalWordsEnteredCount];
    v79 = [v15 bucketNumber:v80 bucketThresholds:&unk_1F3FA7928 bucketValues:0];
    v92[7] = v79;
    v91[8] = @"static";
    v16 = (void *)MEMORY[0x1E4FAE268];
    v78 = [NSNumber numberWithInt:self->_staticCount];
    v77 = [v16 bucketNumber:v78 bucketThresholds:&unk_1F3FA7928 bucketValues:0];
    v92[8] = v77;
    v91[9] = @"dynamic";
    v17 = (void *)MEMORY[0x1E4FAE268];
    v76 = [NSNumber numberWithInt:self->_dynamicCount];
    v75 = [v17 bucketNumber:v76 bucketThresholds:&unk_1F3FA7928 bucketValues:0];
    v92[9] = v75;
    v91[10] = @"textReplacements";
    v18 = (void *)MEMORY[0x1E4FAE268];
    v74 = [NSNumber numberWithInt:self->_textReplacementsCount];
    v73 = [v18 bucketNumber:v74 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[10] = v73;
    v91[11] = @"addressBook";
    v19 = (void *)MEMORY[0x1E4FAE268];
    v72 = [NSNumber numberWithInt:self->_addressBookCount];
    v71 = [v19 bucketNumber:v72 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[11] = v71;
    v91[12] = @"namedEntities";
    v20 = (void *)MEMORY[0x1E4FAE268];
    v68 = [NSNumber numberWithInt:self->_namedEntitiesCount];
    v67 = [v20 bucketNumber:v68 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[12] = v67;
    v91[13] = @"oov";
    v21 = (void *)MEMORY[0x1E4FAE268];
    v66 = [NSNumber numberWithInt:self->_oovCount];
    v65 = [v21 bucketNumber:v66 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[13] = v65;
    v91[14] = @"supplementalLexicon";
    v22 = (void *)MEMORY[0x1E4FAE268];
    v64 = [NSNumber numberWithInt:self->_supplementalLexiconCount];
    v63 = [v22 bucketNumber:v64 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[14] = v63;
    v91[15] = @"emojiPlane";
    v23 = (void *)MEMORY[0x1E4FAE268];
    v62 = [NSNumber numberWithInt:self->_emojiPlaneCount];
    v61 = [v23 bucketNumber:v62 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[15] = v61;
    v91[16] = @"emojiPrediction";
    v24 = (void *)MEMORY[0x1E4FAE268];
    v60 = [NSNumber numberWithInt:self->_emojiPredictionCount];
    v59 = [v24 bucketNumber:v60 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[16] = v59;
    v91[17] = @"emojiSearch";
    v25 = (void *)MEMORY[0x1E4FAE268];
    v58 = [NSNumber numberWithInt:self->_emojiSearchCount];
    v57 = [v25 bucketNumber:v58 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[17] = v57;
    v91[18] = @"emojiPopover";
    v26 = (void *)MEMORY[0x1E4FAE268];
    v56 = [NSNumber numberWithInt:self->_emojiPopoverCount];
    v55 = [v26 bucketNumber:v56 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[18] = v55;
    v91[19] = @"responseKit";
    v27 = (void *)MEMORY[0x1E4FAE268];
    v54 = [NSNumber numberWithInt:self->_responseKitCount];
    v53 = [v27 bucketNumber:v54 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[19] = v53;
    v91[20] = @"pqt";
    v28 = (void *)MEMORY[0x1E4FAE268];
    v52 = [NSNumber numberWithInt:self->_pqtCount];
    v51 = [v28 bucketNumber:v52 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[20] = v51;
    v91[21] = @"multilingual";
    v29 = (void *)MEMORY[0x1E4FAE268];
    v50 = [NSNumber numberWithInt:self->_multilingualCount];
    v49 = [v29 bucketNumber:v50 bucketThresholds:&unk_1F3FA7940 bucketValues:0];
    v92[21] = v49;
    v91[22] = kFeatureKeyboardUsage;
    v48 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v92[22] = v48;
    v91[23] = kFeatureContinuousPathUsage;
    v47 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v92[23] = v47;
    v91[24] = kFeatureAutocorrectionUsage;
    v46 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v92[24] = v46;
    v91[25] = kFeatureCandidateBarUsage;
    v45 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v92[25] = v45;
    v91[26] = kFeatureMultilingualUsage;
    v44 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v92[26] = v44;
    v91[27] = kFeatureStringTypingSpeed;
    v30 = objc_msgSend(v9, "featureUsageMetricFromName:forContext:");

    v92[27] = v30;
    v91[28] = kFeatureStringAssetAvailabilityStatus;
    v31 = @"Installed";
    if (!a5) {
      v31 = @"Unavailable";
    }
    v32 = v31;
    v92[28] = v32;
    v91[29] = kFeatureStringKeyboardLanguage;
    v33 = [v8 inputLanguage];
    v92[29] = v33;
    v91[30] = kFeatureStringKeyboardRegion;
    v34 = [v8 inputRegion];
    v92[30] = v34;
    v91[31] = kFeatureStringKeyboardVariant;
    v35 = [v8 inputVariant];
    v92[31] = v35;
    v91[32] = kFeatureStringKeyboardSecondaryLanguage;
    v36 = [v8 secondaryLanguage];
    v92[32] = v36;
    v91[33] = kFeatureStringKeyboardSecondaryRegion;
    v37 = [v8 secondaryRegion];
    v92[33] = v37;
    v91[34] = kFeatureStringKeyboardLayout;
    v38 = [v8 layoutName];
    v92[34] = v38;
    v91[35] = kFeatureStringKeyboardType;
    v39 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", [v8 keyboardType]);
    v92[35] = v39;
    v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:36];

    v40 = [MEMORY[0x1E4FAE260] sharedInstance];
    v41 = [v8 testingParameters];

    [v40 dispatchEventWithName:@"typingSpeedDetails" payload:v70 testingParameters:v41 allowSparsePayload:0];
    v42 = +[TIProactiveQuickTypeManager sharedInstance];
    v43 = [NSString stringWithUTF8String:"SpeedMetric"];
    [v42 propogateMetrics:v43 data:v70];
  }
}

- (BOOL)hasText:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 whitespaceCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  LOBYTE(v7) = [v8 length] != 0;
  return (char)v7;
}

- (void)adjustEmojiCountsFromKeyboardInputForWordAligned:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(a3, "alignedKeyboardInputs", 0);
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
          v7 += [(TIMessageEvent *)self hasText:v12];
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
      self->_emojiPlaneCount += v9;
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

- (void)analyzeWordEntryAligned:(id)a3
{
  id v18 = a3;
  id v4 = [v18 originalWord];
  uint64_t v5 = [v4 editedEntry];
  uint64_t v6 = [v18 originalWord];
  int v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 editedEntry];

    int v7 = (void *)v8;
  }

  int v9 = [v7 acceptedCandidate];
  uint64_t v10 = [v9 candidate];
  uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v12 = [v10 stringByTrimmingCharactersInSet:v11];

  int v13 = [v7 keyboardState];
  int v14 = [v13 emojiSearchMode];

  long long v15 = [v7 keyboardState];
  char v16 = [v15 emojiPopoverMode];

  if (![v12 _containsEmoji])
  {
    if (v14) {
      goto LABEL_12;
    }
    if ([v9 isContinuousPathConversion])
    {
      ++self->_finalWordsEnteredCount;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if ((v16 & 1) == 0)
  {
    if (v14)
    {
      ++self->_finalWordsEnteredCount;
      ++self->_emojiSearchCount;
LABEL_12:
      if (![v12 length]) {
        goto LABEL_41;
      }
      goto LABEL_17;
    }
    if (([v7 wordEntryType] & 4) != 0)
    {
      ++self->_finalWordsEnteredCount;
      ++self->_emojiPredictionCount;
      goto LABEL_17;
    }
LABEL_15:
    [(TIMessageEvent *)self adjustEmojiCountsFromKeyboardInputForWordAligned:v18];
    goto LABEL_17;
  }
  ++self->_finalWordsEnteredCount;
  ++self->_emojiPopoverCount;
  if (v14) {
    goto LABEL_12;
  }
LABEL_17:
  if (([v9 sourceMask] & 0x8000) != 0 || (objc_msgSend(v9, "sourceMask") & 0x20000) != 0) {
    ++self->_staticCount;
  }
  if (([v9 sourceMask] & 0x10000) != 0 || (objc_msgSend(v9, "sourceMask") & 0x40000) != 0) {
    ++self->_dynamicCount;
  }
  if (([v9 sourceMask] & 4) != 0) {
    ++self->_textReplacementsCount;
  }
  if (([v9 sourceMask] & 8) != 0) {
    ++self->_addressBookCount;
  }
  if (([v9 sourceMask] & 0x10) != 0) {
    ++self->_namedEntitiesCount;
  }
  if (([v9 sourceMask] & 0x20) != 0) {
    ++self->_oovCount;
  }
  if (([v9 sourceMask] & 0x400) != 0) {
    ++self->_supplementalLexiconCount;
  }
  if ([v9 isResponseKitCandidate]) {
    ++self->_responseKitCount;
  }
  if ([v7 isMultilingual]) {
    ++self->_multilingualCount;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = [v9 proactiveTrigger];
    if (v17) {
      ++self->_pqtCount;
    }
  }
LABEL_41:
}

- (BOOL)hasTextInWordEntry:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 acceptedCandidate];
  uint64_t v6 = [v5 candidate];
  BOOL v7 = [(TIMessageEvent *)self hasText:v6];

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
          BOOL v15 = [(TIMessageEvent *)self hasText:v14];

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
  id v23 = a3;
  id v4 = [v23 keyboardState];
  uint64_t v5 = [v4 documentState];
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

  uint64_t v10 = [(__CFString *)v7 stringByAppendingString:v9];
  messageText = self->_messageText;
  self->_messageText = v10;

  [v23 startTime];
  if (v12 > 0.0)
  {
    double startTime = self->_startTime;
    [v23 startTime];
    if (startTime >= v14) {
      double v15 = v14;
    }
    else {
      double v15 = startTime;
    }
    if (startTime != 0.0) {
      double v14 = v15;
    }
    self->_double startTime = v14;
  }
  [v23 endTime];
  if (v16 > 0.0)
  {
    double endTime = self->_endTime;
    [v23 endTime];
    if (endTime >= v18 && endTime != 0.0) {
      double v18 = endTime;
    }
    self->_double endTime = v18;
  }
  long long v20 = [v23 keyboardState];
  char v21 = [v20 emojiSearchMode];

  BOOL v22 = [(TIMessageEvent *)self hasTextInWordEntry:v23];
  if ((v21 & 1) == 0 && v22) {
    ++self->_wordsEnteredCount;
  }
}

- (TIMessageEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIMessageEvent;
  v2 = [(TIMessageEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    messageText = v2->_messageText;
    v2->_messageText = (NSString *)&stru_1F3F7A998;
  }
  return v3;
}

@end