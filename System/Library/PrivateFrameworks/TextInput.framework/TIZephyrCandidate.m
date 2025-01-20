@interface TIZephyrCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (BOOL)isAutocorrection;
- (BOOL)isContinuousPathConversion;
- (BOOL)isFromPhraseDictionary;
- (BOOL)isFromTextChecker;
- (BOOL)isSecureContentCandidate;
- (BOOL)isToucanInlineCompletionCandidate;
- (BOOL)shouldAccept;
- (BOOL)shouldInsertSpaceAfterSelection;
- (NSNumber)staticLinguisticLikelihood;
- (NSString)fromBundleId;
- (NSString)label;
- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6;
- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8;
- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 learningFlagsMask:(unint64_t)a9;
- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 secureContentCandidate:(BOOL)a9 proactiveTrigger:(id)a10 proactivePredictedItem:(id)a11;
- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 secureContentCandidate:(BOOL)a9 proactiveTrigger:(id)a10 proactivePredictedItem:(id)a11 responseKitCategory:(id)a12;
- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 wordOriginFeedbackID:(unint64_t)a5;
- (TIZephyrCandidate)initWithCandidate:(id)a3 responseKitCategory:(id)a4;
- (TIZephyrCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TIZephyrCandidate)initWithCoder:(id)a3;
- (_ICPredictedItem)proactivePredictedItem;
- (double)excessPathRatio;
- (double)geometryScore;
- (double)wordScore;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 label:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)proactiveTrigger;
- (id)responseKitCategory;
- (int)dynamicPenaltyCount;
- (int)dynamicUsageCount;
- (unint64_t)ageForConnectionsMetrics;
- (unint64_t)wordOriginFeedbackID;
- (unsigned)usageTrackingMask;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAgeForConnectionsMetrics:(unint64_t)a3;
- (void)setContinuousPathConversion:(BOOL)a3;
- (void)setDynamicPenaltyCount:(int)a3;
- (void)setDynamicUsageCount:(int)a3;
- (void)setExcessPathRatio:(double)a3;
- (void)setFromBundleId:(id)a3;
- (void)setGeometryScore:(double)a3;
- (void)setIsFromPhraseDictionary:(BOOL)a3;
- (void)setIsFromTextChecker:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setProactivePredictedItem:(id)a3;
- (void)setShouldAccept:(BOOL)a3;
- (void)setShouldInsertSpaceAfterSelection:(BOOL)a3;
- (void)setStaticLinguisticLikelihood:(id)a3;
- (void)setToucanInlineCompletionCandidate:(BOOL)a3;
- (void)setWordScore:(double)a3;
@end

@implementation TIZephyrCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticLinguisticLikelihood, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_proactivePredictedItem, 0);
  objc_storeStrong((id *)&self->_fromBundleId, 0);
  objc_storeStrong((id *)&self->_responseKitCategory, 0);

  objc_storeStrong((id *)&self->_proactiveTrigger, 0);
}

- (void)setDynamicPenaltyCount:(int)a3
{
  self->_dynamicPenaltyCount = a3;
}

- (int)dynamicPenaltyCount
{
  return self->_dynamicPenaltyCount;
}

- (void)setDynamicUsageCount:(int)a3
{
  self->_dynamicUsageCount = a3;
}

- (int)dynamicUsageCount
{
  return self->_dynamicUsageCount;
}

- (void)setWordScore:(double)a3
{
  self->_wordScore = a3;
}

- (double)wordScore
{
  return self->_wordScore;
}

- (void)setGeometryScore:(double)a3
{
  self->_geometryScore = a3;
}

- (double)geometryScore
{
  return self->_geometryScore;
}

- (void)setStaticLinguisticLikelihood:(id)a3
{
}

- (NSNumber)staticLinguisticLikelihood
{
  return self->_staticLinguisticLikelihood;
}

- (void)setToucanInlineCompletionCandidate:(BOOL)a3
{
  self->_toucanInlineCompletionCandidate = a3;
}

- (BOOL)isToucanInlineCompletionCandidate
{
  return self->_toucanInlineCompletionCandidate;
}

- (void)setShouldInsertSpaceAfterSelection:(BOOL)a3
{
  self->_shouldInsertSpaceAfterSelection = a3;
}

- (BOOL)shouldInsertSpaceAfterSelection
{
  return self->_shouldInsertSpaceAfterSelection;
}

- (void)setShouldAccept:(BOOL)a3
{
  self->_shouldAccept = a3;
}

- (BOOL)shouldAccept
{
  return self->_shouldAccept;
}

- (void)setProactivePredictedItem:(id)a3
{
}

- (_ICPredictedItem)proactivePredictedItem
{
  return self->_proactivePredictedItem;
}

- (void)setExcessPathRatio:(double)a3
{
  self->_excessPathRatio = a3;
}

- (double)excessPathRatio
{
  return self->_excessPathRatio;
}

- (BOOL)isContinuousPathConversion
{
  return self->_continuousPathConversion;
}

- (void)setAgeForConnectionsMetrics:(unint64_t)a3
{
  self->_ageForConnectionsMetrics = a3;
}

- (unint64_t)ageForConnectionsMetrics
{
  return self->_ageForConnectionsMetrics;
}

- (void)setFromBundleId:(id)a3
{
}

- (NSString)fromBundleId
{
  return self->_fromBundleId;
}

- (id)responseKitCategory
{
  return self->_responseKitCategory;
}

- (id)proactiveTrigger
{
  return self->_proactiveTrigger;
}

- (BOOL)isSecureContentCandidate
{
  return self->_isSecureContentCandidate;
}

- (void)setIsFromTextChecker:(BOOL)a3
{
  self->_isFromTextChecker = a3;
}

- (BOOL)isFromTextChecker
{
  return self->_isFromTextChecker;
}

- (void)setIsFromPhraseDictionary:(BOOL)a3
{
  self->_isFromPhraseDictionary = a3;
}

- (BOOL)isFromPhraseDictionary
{
  return self->_isFromPhraseDictionary;
}

- (unsigned)usageTrackingMask
{
  return self->_usageTrackingMask;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIZephyrCandidate;
  id v4 = a3;
  [(TIKeyboardCandidateSingle *)&v6 encodeWithCandidateResultSetCoder:v4];
  objc_msgSend(v4, "encodeUInt64:", -[TIZephyrCandidate wordOriginFeedbackID](self, "wordOriginFeedbackID", v6.receiver, v6.super_class));
  [v4 encodeUInt32:self->_usageTrackingMask];
  objc_msgSend(v4, "encodeBool:", -[TIZephyrCandidate isFromPhraseDictionary](self, "isFromPhraseDictionary"));
  objc_msgSend(v4, "encodeBool:", -[TIZephyrCandidate isFromTextChecker](self, "isFromTextChecker"));
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = &stru_1EDBDCE38;
  }
  [v4 encodeString:label];
  [v4 encodeBool:self->_continuousPathConversion];
  [v4 encodeDouble:self->_excessPathRatio];
  [v4 encodeBool:self->_shouldAccept];
  [v4 encodeBool:self->_shouldInsertSpaceAfterSelection];
  [v4 encodeBool:self->_toucanInlineCompletionCandidate];
}

- (TIZephyrCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIZephyrCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v12 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    v5->_wordOriginFeedbackID = [v4 decodeUInt64];
    v5->_usageTrackingMask = [v4 decodeUInt32];
    v5->_isFromPhraseDictionary = [v4 decodeBool];
    v5->_isFromTextChecker = [v4 decodeBool];
    objc_super v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    if (![(NSString *)v5->_label length])
    {
      v9 = v5->_label;
      v5->_label = 0;
    }
    -[TIZephyrCandidate setContinuousPathConversion:](v5, "setContinuousPathConversion:", [v4 decodeBool]);
    [v4 decodeDouble];
    v5->_excessPathRatio = v10;
    v5->_shouldAccept = [v4 decodeBool];
    v5->_shouldInsertSpaceAfterSelection = [v4 decodeBool];
    v5->_toucanInlineCompletionCandidate = [v4 decodeBool];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TIKeyboardCandidateSingle *)self input];
  objc_super v6 = [(TIKeyboardCandidateSingle *)self candidate];
  BOOL v7 = [(TIKeyboardCandidateSingle *)self isExtensionCandidate];
  v8 = autoCorrectionTypeAsString([(TIZephyrCandidate *)self usageTrackingMask]);
  v9 = candidateSourceAsString([(TIKeyboardCandidateSingle *)self sourceMask]);
  v15.receiver = self;
  v15.super_class = (Class)TIZephyrCandidate;
  id v10 = [(TIZephyrCandidate *)&v15 class];
  v14.receiver = self;
  v14.super_class = (Class)TIZephyrCandidate;
  v11 = [(TIKeyboardCandidateSingle *)&v14 description];
  objc_super v12 = [v3 stringWithFormat:@"<%@: %p '%@' -> '%@' (extension: %d) UTM=%@, SM=%@> <%@: %@>", v4, self, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIZephyrCandidate;
  [(TIKeyboardCandidateSingle *)&v9 encodeWithCoder:v4];
  unint64_t wordOriginFeedbackID = self->_wordOriginFeedbackID;
  if (wordOriginFeedbackID) {
    [v4 encodeInteger:wordOriginFeedbackID forKey:@"wordOriginFeedbackID"];
  }
  uint64_t usageTrackingMask = self->_usageTrackingMask;
  if (usageTrackingMask) {
    [v4 encodeInteger:usageTrackingMask forKey:@"usageTrackingMask"];
  }
  if (self->_isFromPhraseDictionary) {
    [v4 encodeBool:1 forKey:@"isFromPhraseDictionary"];
  }
  if (self->_isFromTextChecker) {
    [v4 encodeBool:1 forKey:@"isFromTextChecker"];
  }
  label = self->_label;
  if (label) {
    [v4 encodeObject:label forKey:@"label"];
  }
  responseKitCategory = self->_responseKitCategory;
  if (responseKitCategory) {
    [v4 encodeObject:responseKitCategory forKey:@"responseKitCategory"];
  }
  if (self->_continuousPathConversion) {
    [v4 encodeBool:1 forKey:@"continuousPathConversion"];
  }
  if (self->_shouldAccept) {
    [v4 encodeBool:1 forKey:@"shouldAccept"];
  }
  if (self->_shouldInsertSpaceAfterSelection) {
    [v4 encodeBool:1 forKey:@"shouldInsertSpaceAfterSelection"];
  }
  [v4 encodeDouble:@"pathLengthDelta" forKey:self->_excessPathRatio];
  if (self->_toucanInlineCompletionCandidate) {
    [v4 encodeBool:1 forKey:@"toucanInlineCompletionCandidate"];
  }
}

- (TIZephyrCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIZephyrCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t wordOriginFeedbackID = [v4 decodeIntegerForKey:@"wordOriginFeedbackID"];
    v5->_uint64_t usageTrackingMask = [v4 decodeIntegerForKey:@"usageTrackingMask"];
    v5->_isFromPhraseDictionary = [v4 decodeBoolForKey:@"isFromPhraseDictionary"];
    v5->_isFromTextChecker = [v4 decodeBoolForKey:@"isFromTextChecker"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseKitCategory"];
    responseKitCategory = v5->_responseKitCategory;
    v5->_responseKitCategory = (NSString *)v8;

    -[TIZephyrCandidate setContinuousPathConversion:](v5, "setContinuousPathConversion:", [v4 decodeBoolForKey:@"continuousPathConversion"]);
    [v4 decodeDoubleForKey:@"pathLengthDelta"];
    v5->_excessPathRatio = v10;
    v5->_shouldAccept = [v4 decodeBoolForKey:@"shouldAccept"];
    v5->_shouldInsertSpaceAfterSelection = [v4 decodeBoolForKey:@"shouldInsertSpaceAfterSelection"];
    v5->_toucanInlineCompletionCandidate = [v4 decodeBoolForKey:@"toucanInlineCompletionCandidate"];
  }

  return v5;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 label:(id)a5
{
  id v8 = a5;
  objc_super v9 = [(TIKeyboardCandidateSingle *)self candidateByReplacingWithCandidate:a3 input:a4];
  [v9 setLabel:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TIZephyrCandidate;
  v5 = -[TIKeyboardCandidateSingle copyWithZone:](&v18, sel_copyWithZone_);
  uint64_t v6 = v5;
  if (v5)
  {
    v5[31] = self->_wordOriginFeedbackID;
    *((_DWORD *)v5 + 58) = self->_usageTrackingMask;
    *((unsigned char *)v5 + 224) = self->_isFromPhraseDictionary;
    *((unsigned char *)v5 + 225) = self->_isFromTextChecker;
    uint64_t v7 = [(NSString *)self->_label copyWithZone:a3];
    id v8 = (void *)v6[38];
    v6[38] = v7;

    uint64_t v9 = [(TIProactiveTrigger *)self->_proactiveTrigger copyWithZone:a3];
    double v10 = (void *)v6[32];
    v6[32] = v9;

    uint64_t v11 = [(NSString *)self->_responseKitCategory copyWithZone:a3];
    objc_super v12 = (void *)v6[33];
    v6[33] = v11;

    uint64_t v13 = [(NSString *)self->_fromBundleId copyWithZone:a3];
    objc_super v14 = (void *)v6[34];
    v6[34] = v13;

    v6[35] = self->_ageForConnectionsMetrics;
    [v6 setContinuousPathConversion:self->_continuousPathConversion];
    v6[36] = *(void *)&self->_excessPathRatio;
    *((unsigned char *)v6 + 228) = self->_shouldAccept;
    *((unsigned char *)v6 + 229) = self->_shouldInsertSpaceAfterSelection;
    uint64_t v15 = [(_ICPredictedItem *)self->_proactivePredictedItem copyWithZone:a3];
    v16 = (void *)v6[37];
    v6[37] = v15;

    *((unsigned char *)v6 + 230) = self->_toucanInlineCompletionCandidate;
  }
  return v6;
}

- (BOOL)isAutocorrection
{
  v3 = [(TIKeyboardCandidateSingle *)self candidate];
  if (v3)
  {
    id v4 = [(TIKeyboardCandidateSingle *)self candidate];
    v5 = [(TIKeyboardCandidateSingle *)self input];
    int v6 = [v4 isEqualToString:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)wordOriginFeedbackID
{
  return self->_wordOriginFeedbackID;
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 responseKitCategory:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TIZephyrCandidate;
  id v8 = [(TIKeyboardCandidateSingle *)&v13 initWithResponseCandidate:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_unint64_t wordOriginFeedbackID = 0;
    v8->_uint64_t usageTrackingMask = 0;
    v8->_isSecureContentCandidate = 0;
    proactiveTrigger = v8->_proactiveTrigger;
    v8->_proactiveTrigger = 0;

    proactivePredictedItem = v9->_proactivePredictedItem;
    v9->_proactivePredictedItem = 0;

    objc_storeStrong((id *)&v9->_responseKitCategory, a4);
  }

  return v9;
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 secureContentCandidate:(BOOL)a9 proactiveTrigger:(id)a10 proactivePredictedItem:(id)a11
{
  LOBYTE(v12) = a9;
  return [(TIZephyrCandidate *)self initWithCandidate:a3 forInput:a4 rawInput:a5 wordOriginFeedbackID:a6 usageTrackingMask:*(void *)&a7 sourceMask:*(void *)&a8 secureContentCandidate:v12 proactiveTrigger:a10 proactivePredictedItem:a11 responseKitCategory:0];
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 secureContentCandidate:(BOOL)a9 proactiveTrigger:(id)a10 proactivePredictedItem:(id)a11 responseKitCategory:(id)a12
{
  uint64_t v12 = *(void *)&a8;
  id v24 = a10;
  id v23 = a11;
  id v18 = a12;
  v25.receiver = self;
  v25.super_class = (Class)TIZephyrCandidate;
  v19 = [(TIKeyboardCandidateSingle *)&v25 initWithCandidate:a3 forInput:a4 rawInput:a5 sourceMask:v12];
  v20 = v19;
  if (v19)
  {
    v19->_unint64_t wordOriginFeedbackID = a6;
    v19->_uint64_t usageTrackingMask = a7;
    v19->_isSecureContentCandidate = a9;
    objc_storeStrong((id *)&v19->_proactiveTrigger, a10);
    objc_storeStrong((id *)&v20->_proactivePredictedItem, a11);
    objc_storeStrong((id *)&v20->_responseKitCategory, a12);
    v20->_dynamicUsageCount = -1;
    v20->_dynamicPenaltyCount = -1;
  }

  return v20;
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8 learningFlagsMask:(unint64_t)a9
{
  v17.receiver = self;
  v17.super_class = (Class)TIZephyrCandidate;
  uint64_t v11 = [(TIKeyboardCandidateSingle *)&v17 initWithCandidate:a3 forInput:a4 rawInput:a5 sourceMask:*(void *)&a8 learningFlagsMask:a9];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_unint64_t wordOriginFeedbackID = a6;
    v11->_uint64_t usageTrackingMask = a7;
    v11->_isSecureContentCandidate = 0;
    proactiveTrigger = v11->_proactiveTrigger;
    v11->_proactiveTrigger = 0;

    proactivePredictedItem = v12->_proactivePredictedItem;
    v12->_proactivePredictedItem = 0;

    responseKitCategory = v12->_responseKitCategory;
    v12->_responseKitCategory = 0;

    v12->_dynamicUsageCount = -1;
    v12->_dynamicPenaltyCount = -1;
  }
  return v12;
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6 usageTrackingMask:(unsigned int)a7 sourceMask:(unsigned int)a8
{
  LOBYTE(v9) = 0;
  return [(TIZephyrCandidate *)self initWithCandidate:a3 forInput:a4 rawInput:a5 wordOriginFeedbackID:a6 usageTrackingMask:*(void *)&a7 sourceMask:*(void *)&a8 secureContentCandidate:v9 proactiveTrigger:0 proactivePredictedItem:0];
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 wordOriginFeedbackID:(unint64_t)a6
{
  return [(TIZephyrCandidate *)self initWithCandidate:a3 forInput:a4 rawInput:a5 wordOriginFeedbackID:a6 usageTrackingMask:0 sourceMask:0];
}

- (TIZephyrCandidate)initWithCandidate:(id)a3 forInput:(id)a4 wordOriginFeedbackID:(unint64_t)a5
{
  return [(TIZephyrCandidate *)self initWithCandidate:a3 forInput:a4 rawInput:0 wordOriginFeedbackID:a5];
}

- (void)setLabel:(id)a3
{
  self->_label = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)label
{
  label = self->_label;
  if (label)
  {
    v3 = label;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIZephyrCandidate;
    v3 = [(TIKeyboardCandidate *)&v5 label];
  }

  return v3;
}

- (void)setContinuousPathConversion:(BOOL)a3
{
  self->_continuousPathConversion = a3;
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_uint64_t usageTrackingMask = self->_usageTrackingMask & 0xFFF7FFFF | v3;
}

+ (int)type
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end