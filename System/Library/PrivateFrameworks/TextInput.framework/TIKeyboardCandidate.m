@interface TIKeyboardCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (BOOL)isAddress;
- (BOOL)isAlternativeInput;
- (BOOL)isAsIsCandidate;
- (BOOL)isAutocorrection;
- (BOOL)isBilingualCandidate;
- (BOOL)isCompletionCandidate;
- (BOOL)isContinuousPathConversion;
- (BOOL)isEmojiCandidate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtensionCandidate;
- (BOOL)isFacemarkCandidate;
- (BOOL)isForShortcutConversion;
- (BOOL)isFullwidthCandidate;
- (BOOL)isInlineCandidate;
- (BOOL)isInlineCompletionCandidate;
- (BOOL)isMeCardCandidate;
- (BOOL)isMecabraCandidate;
- (BOOL)isNotAutocorrectedSinceTopCandidateVulgar;
- (BOOL)isOTAWordListCandidate;
- (BOOL)isPartialCandidate;
- (BOOL)isPrefixMatched;
- (BOOL)isPunctuation;
- (BOOL)isPunctuationCompletionCandidate;
- (BOOL)isPunctuationKeyCandidate;
- (BOOL)isRegionalCandidate;
- (BOOL)isResponseKitCandidate;
- (BOOL)isSecureContentCandidate;
- (BOOL)isSendCurrentLocation;
- (BOOL)isStickerCandidate;
- (BOOL)isSupplementalItemCandidate;
- (BOOL)isToucanInlineCompletionCandidate;
- (BOOL)isTransliterationCandidate;
- (BOOL)isWubixingConvertedByPinyin;
- (BOOL)shouldAccept;
- (BOOL)shouldHintAtAlternativeInput;
- (BOOL)shouldInsertSpaceAfterSelection;
- (NSArray)supplementalItemIdentifiers;
- (NSNumber)staticLinguisticLikelihood;
- (NSString)altDSID;
- (NSString)alternativeText;
- (NSString)annotationText;
- (NSString)applicationBundleId;
- (NSString)applicationKey;
- (NSString)candidate;
- (NSString)description;
- (NSString)input;
- (NSString)inputWithoutSupplementalItemPrefix;
- (NSString)latinCandidate;
- (NSString)lexiconLocale;
- (NSString)rawInput;
- (NSString)responseKitCategory;
- (NSString)shortDescription;
- (NSUUID)stickerIdentifier;
- (TIKeyboardCandidate)init;
- (TIKeyboardCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TIKeyboardCandidate)initWithCoder:(id)a3;
- (TIKeyboardCandidate)smartReplySourceCandidate;
- (TIProactiveTrigger)proactiveTrigger;
- (double)secureCandidateWidth;
- (id)candidateByReplacingWithCandidate:(id)a3;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5;
- (id)candidateByReplacingWithSourceMask:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)confidence;
- (int64_t)cursorMovement;
- (unint64_t)candidateProperty;
- (unint64_t)customInfoType;
- (unint64_t)deleteCount;
- (unint64_t)hash;
- (unint64_t)indexForMetrics;
- (unint64_t)learningFlagsMask;
- (unint64_t)secureCandidateHash;
- (unint64_t)wordOriginFeedbackID;
- (unsigned)slotID;
- (unsigned)sourceMask;
- (unsigned)supplementalItemPrefix;
- (unsigned)typingEngine;
- (unsigned)usageTrackingMask;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeText:(id)a3;
- (void)setAnnotationText:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setCustomInfoType:(unint64_t)a3;
- (void)setIndexForMetrics:(unint64_t)a3;
- (void)setIsAlternativeInput:(BOOL)a3;
- (void)setIsMeCardCandidate:(BOOL)a3;
- (void)setIsSendCurrentLocation:(BOOL)a3;
- (void)setLexiconLocale:(id)a3;
- (void)setSecureCandidateHash:(unint64_t)a3;
- (void)setSecureCandidateWidth:(double)a3;
- (void)setShouldHintAtAlternativeInput:(BOOL)a3;
- (void)setSlotID:(unsigned int)a3;
- (void)setSmartReplySourceCandidate:(id)a3;
- (void)setStaticLinguisticLikelihood:(id)a3;
- (void)setSupplementalItemIdentifiers:(id)a3;
- (void)setSupplementalItemPrefix:(unsigned __int16)a3;
- (void)setTypingEngine:(unsigned int)a3;
@end

@implementation TIKeyboardCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lexiconLocale, 0);
  objc_storeStrong((id *)&self->_staticLinguisticLikelihood, 0);
  objc_storeStrong((id *)&self->_smartReplySourceCandidate, 0);
  objc_storeStrong((id *)&self->_supplementalItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_latinCandidate, 0);
  objc_storeStrong((id *)&self->_responseKitCategory, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);

  objc_storeStrong((id *)&self->_alternativeText, 0);
}

- (void)setLexiconLocale:(id)a3
{
}

- (NSString)lexiconLocale
{
  return self->_lexiconLocale;
}

- (void)setShouldHintAtAlternativeInput:(BOOL)a3
{
  self->_shouldHintAtAlternativeInput = a3;
}

- (BOOL)shouldHintAtAlternativeInput
{
  return self->_shouldHintAtAlternativeInput;
}

- (void)setIsAlternativeInput:(BOOL)a3
{
  self->_isAlternativeInput = a3;
}

- (BOOL)isAlternativeInput
{
  return self->_isAlternativeInput;
}

- (void)setStaticLinguisticLikelihood:(id)a3
{
}

- (void)setTypingEngine:(unsigned int)a3
{
  self->_typingEngine = a3;
}

- (unsigned)typingEngine
{
  return self->_typingEngine;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setSmartReplySourceCandidate:(id)a3
{
}

- (TIKeyboardCandidate)smartReplySourceCandidate
{
  return self->_smartReplySourceCandidate;
}

- (unint64_t)candidateProperty
{
  return self->_candidateProperty;
}

- (BOOL)isPrefixMatched
{
  return self->_prefixMatched;
}

- (BOOL)isWubixingConvertedByPinyin
{
  return self->_wubixingConvertedByPinyin;
}

- (BOOL)isAsIsCandidate
{
  return self->_asIsCandidate;
}

- (void)setSupplementalItemPrefix:(unsigned __int16)a3
{
  self->_supplementalItemPrefix = a3;
}

- (unsigned)supplementalItemPrefix
{
  return self->_supplementalItemPrefix;
}

- (void)setSupplementalItemIdentifiers:(id)a3
{
}

- (NSArray)supplementalItemIdentifiers
{
  return self->_supplementalItemIdentifiers;
}

- (void)setIsSendCurrentLocation:(BOOL)a3
{
  self->_isSendCurrentLocation = a3;
}

- (BOOL)isSendCurrentLocation
{
  return self->_isSendCurrentLocation;
}

- (void)setIsMeCardCandidate:(BOOL)a3
{
  self->_isMeCardCandidate = a3;
}

- (BOOL)isMeCardCandidate
{
  return self->_isMeCardCandidate;
}

- (NSString)latinCandidate
{
  return self->_latinCandidate;
}

- (void)setIndexForMetrics:(unint64_t)a3
{
  self->_indexForMetrics = a3;
}

- (unint64_t)indexForMetrics
{
  return self->_indexForMetrics;
}

- (void)setCustomInfoType:(unint64_t)a3
{
  self->_customInfoType = a3;
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

- (void)setSecureCandidateHash:(unint64_t)a3
{
  self->_secureCandidateHash = a3;
}

- (unint64_t)secureCandidateHash
{
  return self->_secureCandidateHash;
}

- (void)setSecureCandidateWidth:(double)a3
{
  self->_secureCandidateWidth = a3;
}

- (double)secureCandidateWidth
{
  return self->_secureCandidateWidth;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setAnnotationText:(id)a3
{
}

- (NSString)annotationText
{
  return self->_annotationText;
}

- (void)setAlternativeText:(id)a3
{
}

- (NSString)alternativeText
{
  return self->_alternativeText;
}

- (id)candidateByReplacingWithSourceMask:(unsigned int)a3
{
  return 0;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5
{
  return 0;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4
{
  return 0;
}

- (id)candidateByReplacingWithCandidate:(id)a3
{
  return 0;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "encodeByte:", objc_msgSend((id)objc_opt_class(), "type"));
  v5 = [(TIKeyboardCandidate *)self alternativeText];
  [v4 encodeString:v5];

  v6 = [(TIKeyboardCandidate *)self annotationText];
  [v4 encodeString:v6];

  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate slotID](self, "slotID"));
  [(TIKeyboardCandidate *)self secureCandidateWidth];
  objc_msgSend(v4, "encodeDouble:");
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidate secureCandidateHash](self, "secureCandidateHash"));
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidate customInfoType](self, "customInfoType"));
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate indexForMetrics](self, "indexForMetrics"));
  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidate isResponseKitCandidate](self, "isResponseKitCandidate"));
  v7 = [(TIKeyboardCandidate *)self responseKitCategory];
  [v4 encodeString:v7];

  [v4 encodeShort:self->_supplementalItemPrefix];
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate typingEngine](self, "typingEngine"));
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidate confidence](self, "confidence"));
  objc_msgSend(v4, "encodeUInt64:", -[NSArray count](self->_supplementalItemIdentifiers, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_supplementalItemIdentifiers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v4, "encodeUInt64:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "unsignedLongLongValue", (void)v13));
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (TIKeyboardCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TIKeyboardCandidate;
  v5 = [(TIKeyboardCandidate *)&v22 init];
  if (v5)
  {
    [v4 decodeByte];
    v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    alternativeText = v5->_alternativeText;
    v5->_alternativeText = (NSString *)v7;

    uint64_t v9 = [v4 decodeString];
    uint64_t v10 = [v9 copy];
    annotationText = v5->_annotationText;
    v5->_annotationText = (NSString *)v10;

    v5->_slotID = [v4 decodeUInt32];
    [v4 decodeDouble];
    v5->_secureCandidateWidth = v12;
    v5->_secureCandidateHash = [v4 decodeUInt64];
    v5->_customInfoType = [v4 decodeUInt64];
    v5->_indexForMetrics = [v4 decodeUInt32];
    v5->_responseKitCandidate = [v4 decodeBool];
    long long v13 = [v4 decodeString];
    uint64_t v14 = [v13 copy];
    responseKitCategory = v5->_responseKitCategory;
    v5->_responseKitCategory = (NSString *)v14;

    v5->_supplementalItemPrefix = [v4 decodeShort];
    v5->_typingEngine = [v4 decodeUInt32];
    v5->_confidence = [v4 decodeUInt32];
    uint64_t v16 = [v4 decodeUInt64];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
      do
      {
        v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "decodeUInt64"));
        [(NSArray *)v18 addObject:v19];

        --v17;
      }
      while (v17);
      supplementalItemIdentifiers = v5->_supplementalItemIdentifiers;
      v5->_supplementalItemIdentifiers = v18;
    }
  }

  return v5;
}

- (NSNumber)staticLinguisticLikelihood
{
  return 0;
}

- (BOOL)isToucanInlineCompletionCandidate
{
  return 0;
}

- (BOOL)isMecabraCandidate
{
  return 0;
}

- (BOOL)isInlineCandidate
{
  return 0;
}

- (BOOL)isPartialCandidate
{
  return 0;
}

- (BOOL)isTransliterationCandidate
{
  return 0;
}

- (BOOL)isSecureContentCandidate
{
  return [(TIKeyboardCandidate *)self slotID] != 0;
}

- (BOOL)isBilingualCandidate
{
  return 0;
}

- (BOOL)isResponseKitCandidate
{
  return self->_responseKitCandidate;
}

- (BOOL)isRegionalCandidate
{
  return 0;
}

- (BOOL)isOTAWordListCandidate
{
  return 0;
}

- (BOOL)isPunctuationCompletionCandidate
{
  BOOL v3 = [(TIKeyboardCandidate *)self isPunctuation];
  if (v3) {
    LOBYTE(v3) = [(TIKeyboardCandidate *)self deleteCount] == 0;
  }
  return v3;
}

- (BOOL)isPunctuationKeyCandidate
{
  BOOL v3 = [(TIKeyboardCandidate *)self isPunctuation];
  if (v3) {
    LOBYTE(v3) = [(TIKeyboardCandidate *)self deleteCount] != 0;
  }
  return v3;
}

- (BOOL)isPunctuation
{
  v2 = [(TIKeyboardCandidate *)self label];
  char v3 = [v2 _containsSymbolsAndPunctuationOnly];

  return v3;
}

- (BOOL)isFacemarkCandidate
{
  return 0;
}

- (BOOL)isFullwidthCandidate
{
  return 0;
}

- (unsigned)usageTrackingMask
{
  return 0;
}

- (BOOL)isInlineCompletionCandidate
{
  return 0;
}

- (BOOL)isCompletionCandidate
{
  char v3 = [(TIKeyboardCandidate *)self input];
  if ([v3 length]) {
    BOOL v4 = [(TIKeyboardCandidate *)self isInlineCompletionCandidate];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)isStickerCandidate
{
  return 0;
}

- (BOOL)isEmojiCandidate
{
  return 0;
}

- (BOOL)isExtensionCandidate
{
  return 0;
}

- (BOOL)shouldInsertSpaceAfterSelection
{
  return 0;
}

- (BOOL)isNotAutocorrectedSinceTopCandidateVulgar
{
  return [(TIKeyboardCandidate *)self learningFlagsMask] & 1;
}

- (BOOL)shouldAccept
{
  return 0;
}

- (BOOL)isContinuousPathConversion
{
  return 0;
}

- (BOOL)isAutocorrection
{
  return 0;
}

- (BOOL)isForShortcutConversion
{
  return 0;
}

- (unint64_t)hash
{
  char v3 = [(TIKeyboardCandidate *)self candidate];
  uint64_t v4 = [v3 hash];

  v5 = [(TIKeyboardCandidate *)self alternativeText];
  uint64_t v6 = 257 * [v5 hash];
  uint64_t v7 = [(TIKeyboardCandidate *)self annotationText];
  unint64_t v8 = v6 + v4 + 65537 * [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    uint64_t v6 = [(TIKeyboardCandidate *)self candidate];
    uint64_t v7 = [v5 candidate];
    int v8 = [v6 isEqualToString:v7];

    if (!v8) {
      goto LABEL_30;
    }
    uint64_t v9 = [(TIKeyboardCandidate *)self input];
    uint64_t v10 = [v5 input];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_30;
    }
    double v12 = [(TIKeyboardCandidate *)self alternativeText];
    uint64_t v13 = [v5 alternativeText];
    if (v12 == (void *)v13)
    {
    }
    else
    {
      uint64_t v14 = (void *)v13;
      long long v15 = [(TIKeyboardCandidate *)self alternativeText];
      uint64_t v16 = [v5 alternativeText];
      int v17 = [v15 isEqualToString:v16];

      if (!v17) {
        goto LABEL_30;
      }
    }
    v19 = [(TIKeyboardCandidate *)self annotationText];
    uint64_t v20 = [v5 annotationText];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      objc_super v22 = [(TIKeyboardCandidate *)self annotationText];
      v23 = [v5 annotationText];
      int v24 = [v22 isEqualToString:v23];

      if (!v24) {
        goto LABEL_30;
      }
    }
    unsigned int v25 = [(TIKeyboardCandidate *)self slotID];
    if (v25 == [v5 slotID])
    {
      [(TIKeyboardCandidate *)self secureCandidateWidth];
      double v27 = v26;
      [v5 secureCandidateWidth];
      if (v27 == v28)
      {
        unint64_t v29 = [(TIKeyboardCandidate *)self secureCandidateHash];
        if (v29 == [v5 secureCandidateHash])
        {
          unint64_t v30 = [(TIKeyboardCandidate *)self learningFlagsMask];
          if (v30 == [v5 learningFlagsMask])
          {
            int v31 = [(TIKeyboardCandidate *)self isContinuousPathConversion];
            if (v31 == [v5 isContinuousPathConversion])
            {
              int v32 = [(TIKeyboardCandidate *)self shouldAccept];
              if (v32 == [v5 shouldAccept])
              {
                unint64_t v33 = [(TIKeyboardCandidate *)self customInfoType];
                if (v33 == [v5 customInfoType])
                {
                  int v34 = [(TIKeyboardCandidate *)self isResponseKitCandidate];
                  if (v34 == [v5 isResponseKitCandidate])
                  {
                    int v35 = [(TIKeyboardCandidate *)self isTransliterationCandidate];
                    if (v35 == [v5 isTransliterationCandidate])
                    {
                      NSUInteger v36 = [(NSArray *)self->_supplementalItemIdentifiers count];
                      if ((v36 == [v5[14] count]
                         || [(NSArray *)self->_supplementalItemIdentifiers isEqualToArray:v5[14]])
                        && self->_supplementalItemPrefix == *((unsigned __int16 *)v5 + 16)
                        && self->_typingEngine == *((_DWORD *)v5 + 11)
                        && self->_confidence == *((_DWORD *)v5 + 10)
                        && self->_candidateProperty == v5[2]
                        && self->_isAlternativeInput == *((unsigned __int8 *)v5 + 29))
                      {
                        unsigned __int8 v18 = self->_shouldHintAtAlternativeInput == *((unsigned __int8 *)v5 + 30);
LABEL_31:

                        goto LABEL_32;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_30:
    unsigned __int8 v18 = 0;
    goto LABEL_31;
  }
  v38.receiver = self;
  v38.super_class = (Class)TIKeyboardCandidate;
  unsigned __int8 v18 = [(TIKeyboardCandidate *)&v38 isEqual:v4];
LABEL_32:

  return v18;
}

- (unsigned)sourceMask
{
  return 0;
}

- (int64_t)cursorMovement
{
  return 0;
}

- (unint64_t)deleteCount
{
  return 0;
}

- (unint64_t)wordOriginFeedbackID
{
  return 0;
}

- (NSString)rawInput
{
  return 0;
}

- (unint64_t)learningFlagsMask
{
  return 0;
}

- (NSString)input
{
  return 0;
}

- (BOOL)isAddress
{
  v2 = [(TIKeyboardCandidate *)self proactiveTrigger];
  char v3 = [v2 attributes];
  id v4 = [v3 objectForKey:@"field"];

  LOBYTE(v2) = [v4 containsString:@"ADDRESS"];
  return (char)v2;
}

- (NSString)inputWithoutSupplementalItemPrefix
{
  char v3 = [(TIKeyboardCandidate *)self input];
  uint64_t v4 = [v3 length];
  v5 = [(TIKeyboardCandidate *)self input];
  uint64_t v6 = v5;
  if (v4)
  {
    if ([v5 characterAtIndex:0] == self->_supplementalItemPrefix)
    {
      uint64_t v7 = [(TIKeyboardCandidate *)self input];
      uint64_t v8 = [v7 substringFromIndex:1];
    }
    else
    {
      uint64_t v8 = [(TIKeyboardCandidate *)self input];
    }

    uint64_t v6 = (void *)v8;
  }

  return (NSString *)v6;
}

- (BOOL)isSupplementalItemCandidate
{
  v2 = [(TIKeyboardCandidate *)self supplementalItemIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSString)responseKitCategory
{
  return self->_responseKitCategory;
}

- (TIProactiveTrigger)proactiveTrigger
{
  return 0;
}

- (NSUUID)stickerIdentifier
{
  return 0;
}

- (NSString)altDSID
{
  return 0;
}

- (NSString)applicationBundleId
{
  return 0;
}

- (NSString)applicationKey
{
  return 0;
}

- (NSString)candidate
{
  return 0;
}

- (NSString)shortDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = [(TIKeyboardCandidate *)self input];
  v5 = [(TIKeyboardCandidate *)self candidate];
  uint64_t v6 = [v3 stringWithFormat:@"'%@' -> '%@'", v4, v5];

  return (NSString *)v6;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TIKeyboardCandidate *)self input];
  uint64_t v6 = [(TIKeyboardCandidate *)self candidate];
  BOOL v7 = [(TIKeyboardCandidate *)self isExtensionCandidate];
  uint64_t v8 = [(NSArray *)self->_supplementalItemIdentifiers componentsJoinedByString:@", "];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p '%@' -> '%@' (extension: %d), supplementalItemIDs: [%@]>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  alternativeText = self->_alternativeText;
  id v16 = v4;
  if (alternativeText) {
    [v4 encodeObject:alternativeText forKey:@"alternativeText"];
  }
  annotationText = self->_annotationText;
  if (annotationText) {
    [v16 encodeObject:annotationText forKey:@"annotationText"];
  }
  BOOL v7 = [NSNumber numberWithUnsignedInt:self->_slotID];
  [v16 encodeObject:v7 forKey:@"slotID"];

  uint64_t v8 = [NSNumber numberWithDouble:self->_secureCandidateWidth];
  [v16 encodeObject:v8 forKey:@"secureCandidateWidth"];

  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_secureCandidateHash];
  [v16 encodeObject:v9 forKey:@"secureCandidateHash"];

  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:self->_customInfoType];
  [v16 encodeObject:v10 forKey:@"customInfoType"];

  int v11 = [NSNumber numberWithUnsignedInteger:self->_indexForMetrics];
  [v16 encodeObject:v11 forKey:@"indexForMetrics"];

  [v16 encodeBool:self->_responseKitCandidate forKey:@"responseKitCandidate"];
  responseKitCategory = self->_responseKitCategory;
  if (responseKitCategory) {
    [v16 encodeObject:responseKitCategory forKey:@"responseKitCategory"];
  }
  supplementalItemIdentifiers = self->_supplementalItemIdentifiers;
  if (supplementalItemIdentifiers) {
    [v16 encodeObject:supplementalItemIdentifiers forKey:@"supplementalItemIdentifiers"];
  }
  uint64_t v14 = [NSNumber numberWithUnsignedShort:self->_supplementalItemPrefix];
  [v16 encodeObject:v14 forKey:@"supplementalItemPrefix"];

  long long v15 = [NSNumber numberWithUnsignedInt:self->_typingEngine];
  [v16 encodeObject:v15 forKey:@"typingEngine"];

  [v16 encodeInt32:self->_confidence forKey:@"candidateConfidence"];
  [v16 encodeInt:LODWORD(self->_candidateProperty) forKey:@"candidateProperty"];
  if (self->_isAlternativeInput) {
    [v16 encodeBool:1 forKey:@"isAlternativeInput"];
  }
  if (self->_shouldHintAtAlternativeInput) {
    [v16 encodeBool:1 forKey:@"shouldHintAtAlternativeInput"];
  }
}

- (TIKeyboardCandidate)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardCandidate;
  v5 = [(TIKeyboardCandidate *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternativeText"];
    alternativeText = v5->_alternativeText;
    v5->_alternativeText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"annotationText"];
    annotationText = v5->_annotationText;
    v5->_annotationText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slotID"];
    v5->_slotID = [v10 unsignedIntValue];

    int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureCandidateWidth"];
    [v11 floatValue];
    v5->_secureCandidateWidth = v12;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureCandidateHash"];
    v5->_secureCandidateHash = [v13 unsignedLongValue];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customInfoType"];
    v5->_customInfoType = [v14 unsignedLongValue];

    long long v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexForMetrics"];
    v5->_indexForMetrics = [v15 unsignedIntValue];

    v5->_responseKitCandidate = [v4 decodeBoolForKey:@"responseKitCandidate"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseKitCategory"];
    responseKitCategory = v5->_responseKitCategory;
    v5->_responseKitCategory = (NSString *)v16;

    unsigned __int8 v18 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    uint64_t v20 = [v18 setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"supplementalItemIdentifiers"];
    supplementalItemIdentifiers = v5->_supplementalItemIdentifiers;
    v5->_supplementalItemIdentifiers = (NSArray *)v21;

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementalItemPrefix"];
    v5->_supplementalItemPrefix = [v23 unsignedShortValue];

    int v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typingEngine"];
    v5->_typingEngine = [v24 unsignedIntValue];

    v5->_confidence = [v4 decodeInt32ForKey:@"candidateConfidence"];
    v5->_candidateProperty = (int)[v4 decodeIntForKey:@"candidateProperty"];
    v5->_isAlternativeInput = [v4 decodeBoolForKey:@"isAlternativeInput"];
    v5->_shouldHintAtAlternativeInput = [v4 decodeBoolForKey:@"shouldHintAtAlternativeInput"];
    unsigned int v25 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_alternativeText copyWithZone:a3];
    BOOL v7 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v6;

    uint64_t v8 = [(NSString *)self->_annotationText copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    *(_DWORD *)(v5 + 36) = self->_slotID;
    *(double *)(v5 + 64) = self->_secureCandidateWidth;
    *(void *)(v5 + 72) = self->_secureCandidateHash;
    *(void *)(v5 + 80) = self->_customInfoType;
    *(void *)(v5 + 88) = self->_indexForMetrics;
    *(unsigned char *)(v5 + 8) = self->_responseKitCandidate;
    uint64_t v10 = [(NSString *)self->_responseKitCategory copyWithZone:a3];
    int v11 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v10;

    uint64_t v12 = [(NSArray *)self->_supplementalItemIdentifiers copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v12;

    *(_WORD *)(v5 + 32) = self->_supplementalItemPrefix;
    *(_DWORD *)(v5 + 44) = self->_typingEngine;
    *(_DWORD *)(v5 + 40) = self->_confidence;
    *(void *)(v5 + 16) = self->_candidateProperty;
    *(unsigned char *)(v5 + 29) = self->_isAlternativeInput;
    *(unsigned char *)(v5 + 30) = self->_shouldHintAtAlternativeInput;
    objc_storeStrong((id *)(v5 + 136), self->_lexiconLocale);
  }
  return (id)v5;
}

- (TIKeyboardCandidate)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardCandidate;
  result = [(TIKeyboardCandidate *)&v3 init];
  if (result) {
    result->_confidence = 3;
  }
  return result;
}

+ (int)type
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end