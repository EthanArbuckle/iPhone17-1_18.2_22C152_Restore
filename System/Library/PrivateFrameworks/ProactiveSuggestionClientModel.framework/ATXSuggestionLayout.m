@interface ATXSuggestionLayout
+ (BOOL)isCompositeLayout:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)maxSuggestionLayoutTypesForUILayoutType:(int64_t)a3;
+ (id)minSuggestionLayoutTypesForUILayoutType:(int64_t)a3;
+ (id)stringFromUILayoutType:(int64_t)a3;
- (ATXSuggestionLayout)initWithCoder:(id)a3;
- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10;
- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10 uuid:(id)a11;
- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10 uuid:(id)a11 layoutScore:(double)a12 isValidForSuggestionsWidget:(BOOL)a13 confidenceWarrantsSnappingOrNPlusOne:(BOOL)a14 isNPlusOne:(BOOL)a15 isLowConfidenceStackRotationForStaleStack:(BOOL)a16 widgetUniqueId:(id)a17 uuidOfHighestConfidenceSuggestion:(id)a18 numWidgetsInStack:(unint64_t)a19;
- (ATXSuggestionLayout)initWithProto:(id)a3;
- (ATXSuggestionLayout)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)confidenceWarrantsSnappingOrNPlusOne;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowConfidenceStackRotationForStaleStack;
- (BOOL)isNPlusOne;
- (BOOL)isShortcutConversion;
- (BOOL)isValidForSuggestionsWidget;
- (NSArray)fourByEightSuggestions;
- (NSArray)fourByFourSuggestions;
- (NSArray)oneByFourSuggestions;
- (NSArray)oneByOneSuggestions;
- (NSArray)oneByTwoSuggestions;
- (NSArray)twoByFourSuggestions;
- (NSArray)twoByTwoSuggestions;
- (NSString)description;
- (NSString)widgetUniqueId;
- (NSUUID)uuid;
- (NSUUID)uuidOfHighestConfidenceSuggestion;
- (double)layoutScore;
- (id)allSuggestionsInLayout;
- (id)arrayOfJSONFromSuggestionArray:(id)a3;
- (id)compactDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)jsonRawData;
- (id)minSuggestionListInLayout;
- (id)proto;
- (id)suggestionWithUUID:(id)a3;
- (int)_protoLayoutTypeFromLayoutType:(int64_t)a3;
- (int64_t)_layoutTypeFromProtoLayoutType:(int)a3;
- (int64_t)layoutType;
- (unint64_t)numWidgetsInStack;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceWarrantsSnappingOrNPlusOne:(BOOL)a3;
- (void)setFourByEightSuggestions:(id)a3;
- (void)setFourByFourSuggestions:(id)a3;
- (void)setIsLowConfidenceStackRotationForStaleStack:(BOOL)a3;
- (void)setIsNPlusOne:(BOOL)a3;
- (void)setIsValidForSuggestionsWidget:(BOOL)a3;
- (void)setLayoutScore:(double)a3;
- (void)setNumWidgetsInStack:(unint64_t)a3;
- (void)setOneByFourSuggestions:(id)a3;
- (void)setOneByOneSuggestions:(id)a3;
- (void)setOneByTwoSuggestions:(id)a3;
- (void)setTwoByFourSuggestions:(id)a3;
- (void)setTwoByTwoSuggestions:(id)a3;
- (void)setUuid:(id)a3;
- (void)setUuidOfHighestConfidenceSuggestion:(id)a3;
- (void)setWidgetUniqueId:(id)a3;
@end

@implementation ATXSuggestionLayout

- (id)allSuggestionsInLayout
{
  NSUInteger v3 = [(NSArray *)self->_oneByOneSuggestions count];
  NSUInteger v4 = [(NSArray *)self->_oneByTwoSuggestions count] + v3;
  NSUInteger v5 = [(NSArray *)self->_twoByTwoSuggestions count];
  NSUInteger v6 = v4 + v5 + [(NSArray *)self->_oneByFourSuggestions count];
  NSUInteger v7 = v6 + [(NSArray *)self->_twoByFourSuggestions count];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  v9 = v8;
  if (self->_oneByOneSuggestions) {
    objc_msgSend(v8, "addObjectsFromArray:");
  }
  if (self->_oneByTwoSuggestions) {
    objc_msgSend(v9, "addObjectsFromArray:");
  }
  if (self->_twoByTwoSuggestions) {
    objc_msgSend(v9, "addObjectsFromArray:");
  }
  if (self->_oneByFourSuggestions) {
    objc_msgSend(v9, "addObjectsFromArray:");
  }
  if (self->_twoByFourSuggestions) {
    objc_msgSend(v9, "addObjectsFromArray:");
  }
  if (self->_fourByFourSuggestions) {
    objc_msgSend(v9, "addObjectsFromArray:");
  }
  if (self->_fourByEightSuggestions) {
    objc_msgSend(v9, "addObjectsFromArray:");
  }
  return v9;
}

- (ATXSuggestionLayout)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSUInteger v5 = [[ATXPBSuggestionLayout alloc] initWithData:v4];

    self = [(ATXSuggestionLayout *)self initWithProto:v5];
    NSUInteger v6 = self;
  }
  else
  {
    NSUInteger v6 = 0;
  }

  return v6;
}

- (ATXSuggestionLayout)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v8);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  id v23 = v4;
  if (-[ATXPBSuggestionLayout hasUuidOfHighestConfidenceSuggestion]((BOOL)v5))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    NSUInteger v7 = -[ATXPBSuggestionLayout uuidOfHighestConfidenceSuggestion]((uint64_t)v5);
    v39 = (void *)[v6 initWithUUIDString:v7];
  }
  else
  {
    v39 = 0;
  }
  int64_t v33 = -[ATXSuggestionLayout _layoutTypeFromProtoLayoutType:](self, "_layoutTypeFromProtoLayoutType:", -[ATXPBSuggestionLayout layoutType]((uint64_t)v5));
  v37 = -[ATXPBSuggestionLayout oneByOneSuggestions]((uint64_t)v5);
  v38 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v37];
  v36 = -[ATXPBSuggestionLayout oneByTwoSuggestions]((uint64_t)v5);
  v31 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v36];
  v35 = -[ATXPBSuggestionLayout twoByTwoSuggestions]((uint64_t)v5);
  v29 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v35];
  v34 = -[ATXPBSuggestionLayout oneByFourSuggestions]((uint64_t)v5);
  v28 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v34];
  v32 = -[ATXPBSuggestionLayout twoByFourSuggestions]((uint64_t)v5);
  v26 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v32];
  v30 = -[ATXPBSuggestionLayout fourByFourSuggestions]((uint64_t)v5);
  v24 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v30];
  v27 = -[ATXPBSuggestionLayout fourByEightSuggestions]((uint64_t)v5);
  uint64_t v10 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v27];
  id v11 = objc_alloc(MEMORY[0x1E4F29128]);
  v25 = -[ATXPBSuggestionLayout uuidString]((uint64_t)v5);
  v12 = (void *)[v11 initWithUUIDString:v25];
  double v13 = -[ATXPBSuggestionLayout layoutScore]((uint64_t)v5);
  BOOL v14 = -[ATXPBSuggestionLayout isValidForSuggestionsWidget]((BOOL)v5);
  BOOL v15 = -[ATXPBSuggestionLayout confidenceWarrantsSnappingOrNPlusOne]((BOOL)v5);
  BOOL v16 = -[ATXPBSuggestionLayout isNPlusOne]((BOOL)v5);
  BOOL v17 = -[ATXPBSuggestionLayout isLowConfidenceStackRotationForStaleStack]((BOOL)v5);
  v18 = -[ATXPBSuggestionLayout widgetUniqueId]((uint64_t)v5);
  BYTE3(v22) = v17;
  BYTE2(v22) = v16;
  BYTE1(v22) = v15;
  LOBYTE(v22) = v14;
  v19 = (void *)v10;
  v20 = objc_retain(-[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:](self, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:", v33, v38, v31, v29, v28, v26, v13, v24, v10, v12, v22, v18, v39,
            -[ATXPBSuggestionLayout numWidgetsInStack]((uint64_t)v5)));

  self = v20;
  v9 = v20;
  id v4 = v23;
LABEL_11:

  return v9;
}

- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10 uuid:(id)a11 layoutScore:(double)a12 isValidForSuggestionsWidget:(BOOL)a13 confidenceWarrantsSnappingOrNPlusOne:(BOOL)a14 isNPlusOne:(BOOL)a15 isLowConfidenceStackRotationForStaleStack:(BOOL)a16 widgetUniqueId:(id)a17 uuidOfHighestConfidenceSuggestion:(id)a18 numWidgetsInStack:(unint64_t)a19
{
  id v24 = a4;
  id v25 = a5;
  id v53 = a6;
  id v26 = a7;
  id v27 = a8;
  v28 = v25;
  id v29 = a9;
  id v30 = a10;
  id v52 = a11;
  id v31 = a17;
  id v32 = a18;
  v54.receiver = self;
  v54.super_class = (Class)ATXSuggestionLayout;
  int64_t v33 = [(ATXSuggestionLayout *)&v54 init];
  v34 = v33;
  if (v33)
  {
    v33->_layoutType = a3;
    uint64_t v35 = [v24 copy];
    oneByOneSuggestions = v34->_oneByOneSuggestions;
    v34->_oneByOneSuggestions = (NSArray *)v35;

    uint64_t v37 = [v28 copy];
    oneByTwoSuggestions = v34->_oneByTwoSuggestions;
    v34->_oneByTwoSuggestions = (NSArray *)v37;

    uint64_t v39 = [v53 copy];
    twoByTwoSuggestions = v34->_twoByTwoSuggestions;
    v34->_twoByTwoSuggestions = (NSArray *)v39;

    uint64_t v41 = [v26 copy];
    oneByFourSuggestions = v34->_oneByFourSuggestions;
    v34->_oneByFourSuggestions = (NSArray *)v41;

    uint64_t v43 = [v27 copy];
    twoByFourSuggestions = v34->_twoByFourSuggestions;
    v34->_twoByFourSuggestions = (NSArray *)v43;

    uint64_t v45 = [v29 copy];
    fourByFourSuggestions = v34->_fourByFourSuggestions;
    v34->_fourByFourSuggestions = (NSArray *)v45;

    uint64_t v47 = [v30 copy];
    fourByEightSuggestions = v34->_fourByEightSuggestions;
    v34->_fourByEightSuggestions = (NSArray *)v47;

    objc_storeStrong((id *)&v34->_uuid, a11);
    v34->_layoutScore = a12;
    v34->_isValidForSuggestionsWidget = a13;
    v34->_confidenceWarrantsSnappingOrNPlusOne = a14;
    v34->_isNPlusOne = a15;
    v34->_isLowConfidenceStackRotationForStaleStack = a16;
    objc_storeStrong((id *)&v34->_widgetUniqueId, a17);
    objc_storeStrong((id *)&v34->_uuidOfHighestConfidenceSuggestion, a18);
    v34->_numWidgetsInStack = a19;
  }

  return v34;
}

- (int64_t)_layoutTypeFromProtoLayoutType:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 0x11) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_fourByEightSuggestions, 0);
  objc_storeStrong((id *)&self->_fourByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_twoByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_twoByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByOneSuggestions, 0);
  objc_storeStrong((id *)&self->_uuidOfHighestConfidenceSuggestion, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = objc_opt_new();
  id v25 = [(ATXSuggestionLayout *)self initWithLayoutType:a3 oneByOneSuggestions:v23 oneByTwoSuggestions:v22 twoByTwoSuggestions:v21 oneByFourSuggestions:v20 twoByFourSuggestions:v19 fourByFourSuggestions:v18 fourByEightSuggestions:v17 uuid:v24];

  return v25;
}

- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10 uuid:(id)a11
{
  LODWORD(v12) = 0;
  return -[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:](self, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:", a3, a4, a5, a6, a7, a8, -1.0, a9, a10, a11, v12, 0, 0, 0);
}

- (id)compactDescription
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(ATXSuggestionLayout *)self layoutType];
  return (id)[v3 stringFromUILayoutType:v4];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_new();
  uuid = self->_uuid;
  id v5 = +[ATXSuggestionLayout stringFromUILayoutType:self->_layoutType];
  [(ATXSuggestionLayout *)self layoutScore];
  [v3 appendFormat:@"UUID: %@, Layout type: %@, Score:%.2f\n", uuid, v5, v6];

  if (self->_oneByOneSuggestions) {
    [v3 appendFormat:@"[1 x 1] : %@\n", self->_oneByOneSuggestions];
  }
  if (self->_oneByTwoSuggestions) {
    [v3 appendFormat:@"[1 x 2] : %@\n", self->_oneByTwoSuggestions];
  }
  if (self->_twoByTwoSuggestions) {
    [v3 appendFormat:@"[2 x 2] : %@\n", self->_twoByTwoSuggestions];
  }
  if (self->_oneByFourSuggestions) {
    [v3 appendFormat:@"[1 x 4] : %@\n", self->_oneByFourSuggestions];
  }
  if (self->_twoByFourSuggestions) {
    [v3 appendFormat:@"[2 x 4] : %@\n", self->_twoByFourSuggestions];
  }
  if (self->_fourByFourSuggestions) {
    [v3 appendFormat:@"[4 x 4] : %@\n", self->_fourByFourSuggestions];
  }
  if (self->_fourByEightSuggestions) {
    [v3 appendFormat:@"[4 x 8] : %@\n", self->_fourByEightSuggestions];
  }
  return (NSString *)v3;
}

- (id)suggestionWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(ATXSuggestionLayout *)self allSuggestionsInLayout];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "uuid", (void)v13);
          char v11 = [v4 isEqual:v10];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)minSuggestionListInLayout
{
  uint64_t v3 = objc_opt_new();
  id v4 = +[ATXSuggestionLayout minSuggestionLayoutTypesForUILayoutType:self->_layoutType];
  id v5 = [v4 objectForKeyedSubscript:&unk_1F0627C58];
  int v6 = [v5 intValue];

  if (v6 >= 1)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:&unk_1F0627C58];
    uint64_t v8 = [v7 unsignedIntegerValue];

    v9 = -[NSArray subarrayWithRange:](self->_oneByOneSuggestions, "subarrayWithRange:", 0, v8);
    [v3 addObjectsFromArray:v9];
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:&unk_1F0627C70];
  int v11 = [v10 intValue];

  if (v11 >= 1)
  {
    uint64_t v12 = [v4 objectForKeyedSubscript:&unk_1F0627C70];
    uint64_t v13 = [v12 unsignedIntegerValue];

    long long v14 = -[NSArray subarrayWithRange:](self->_oneByTwoSuggestions, "subarrayWithRange:", 0, v13);
    [v3 addObjectsFromArray:v14];
  }
  long long v15 = [v4 objectForKeyedSubscript:&unk_1F0627C88];
  int v16 = [v15 intValue];

  if (v16 >= 1)
  {
    id v17 = [v4 objectForKeyedSubscript:&unk_1F0627C88];
    uint64_t v18 = [v17 unsignedIntegerValue];

    id v19 = -[NSArray subarrayWithRange:](self->_twoByTwoSuggestions, "subarrayWithRange:", 0, v18);
    [v3 addObjectsFromArray:v19];
  }
  id v20 = [v4 objectForKeyedSubscript:&unk_1F0627CA0];
  int v21 = [v20 intValue];

  if (v21 >= 1)
  {
    id v22 = [v4 objectForKeyedSubscript:&unk_1F0627CA0];
    uint64_t v23 = [v22 unsignedIntegerValue];

    id v24 = -[NSArray subarrayWithRange:](self->_twoByFourSuggestions, "subarrayWithRange:", 0, v23);
    [v3 addObjectsFromArray:v24];
  }
  id v25 = [v4 objectForKeyedSubscript:&unk_1F0627CB8];
  int v26 = [v25 intValue];

  if (v26 >= 1)
  {
    id v27 = [v4 objectForKeyedSubscript:&unk_1F0627CB8];
    uint64_t v28 = [v27 unsignedIntegerValue];

    id v29 = -[NSArray subarrayWithRange:](self->_oneByFourSuggestions, "subarrayWithRange:", 0, v28);
    [v3 addObjectsFromArray:v29];
  }
  id v30 = [v4 objectForKeyedSubscript:&unk_1F0627CD0];
  int v31 = [v30 intValue];

  if (v31 >= 1)
  {
    id v32 = [v4 objectForKeyedSubscript:&unk_1F0627CD0];
    uint64_t v33 = [v32 unsignedIntegerValue];

    v34 = -[NSArray subarrayWithRange:](self->_fourByFourSuggestions, "subarrayWithRange:", 0, v33);
    [v3 addObjectsFromArray:v34];
  }
  uint64_t v35 = [v4 objectForKeyedSubscript:&unk_1F0627CE8];
  int v36 = [v35 intValue];

  if (v36 >= 1)
  {
    uint64_t v37 = [v4 objectForKeyedSubscript:&unk_1F0627CE8];
    uint64_t v38 = [v37 unsignedIntegerValue];

    uint64_t v39 = -[NSArray subarrayWithRange:](self->_fourByEightSuggestions, "subarrayWithRange:", 0, v38);
    [v3 addObjectsFromArray:v39];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXSuggestionLayout *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 layoutType];
      if (v6 == [(ATXSuggestionLayout *)self layoutType])
      {
        oneByOneSuggestions = self->_oneByOneSuggestions;
        uint64_t v8 = (NSArray *)v5[6];
        if (oneByOneSuggestions == v8)
        {
        }
        else
        {
          v9 = v8;
          uint64_t v10 = oneByOneSuggestions;
          char v11 = [(NSArray *)v10 isEqual:v9];

          if ((v11 & 1) == 0) {
            goto LABEL_48;
          }
        }
        oneByTwoSuggestions = self->_oneByTwoSuggestions;
        long long v14 = (NSArray *)v5[7];
        if (oneByTwoSuggestions == v14)
        {
        }
        else
        {
          long long v15 = v14;
          int v16 = oneByTwoSuggestions;
          char v17 = [(NSArray *)v16 isEqual:v15];

          if ((v17 & 1) == 0) {
            goto LABEL_48;
          }
        }
        twoByTwoSuggestions = self->_twoByTwoSuggestions;
        id v19 = (NSArray *)v5[8];
        if (twoByTwoSuggestions == v19)
        {
        }
        else
        {
          id v20 = v19;
          int v21 = twoByTwoSuggestions;
          char v22 = [(NSArray *)v21 isEqual:v20];

          if ((v22 & 1) == 0) {
            goto LABEL_48;
          }
        }
        oneByFourSuggestions = self->_oneByFourSuggestions;
        id v24 = (NSArray *)v5[9];
        if (oneByFourSuggestions == v24)
        {
        }
        else
        {
          id v25 = v24;
          int v26 = oneByFourSuggestions;
          char v27 = [(NSArray *)v26 isEqual:v25];

          if ((v27 & 1) == 0) {
            goto LABEL_48;
          }
        }
        twoByFourSuggestions = self->_twoByFourSuggestions;
        id v29 = (NSArray *)v5[10];
        if (twoByFourSuggestions == v29)
        {
        }
        else
        {
          id v30 = v29;
          int v31 = twoByFourSuggestions;
          char v32 = [(NSArray *)v31 isEqual:v30];

          if ((v32 & 1) == 0) {
            goto LABEL_48;
          }
        }
        fourByFourSuggestions = self->_fourByFourSuggestions;
        v34 = (NSArray *)v5[11];
        if (fourByFourSuggestions == v34)
        {
        }
        else
        {
          uint64_t v35 = v34;
          int v36 = fourByFourSuggestions;
          char v37 = [(NSArray *)v36 isEqual:v35];

          if ((v37 & 1) == 0) {
            goto LABEL_48;
          }
        }
        fourByEightSuggestions = self->_fourByEightSuggestions;
        uint64_t v39 = (NSArray *)v5[12];
        if (fourByEightSuggestions == v39)
        {
        }
        else
        {
          v40 = v39;
          uint64_t v41 = fourByEightSuggestions;
          char v42 = [(NSArray *)v41 isEqual:v40];

          if ((v42 & 1) == 0) {
            goto LABEL_48;
          }
        }
        uuid = self->_uuid;
        v44 = (NSUUID *)v5[4];
        if (uuid == v44)
        {
        }
        else
        {
          uint64_t v45 = v44;
          v46 = uuid;
          char v47 = [(NSUUID *)v46 isEqual:v45];

          if ((v47 & 1) == 0) {
            goto LABEL_48;
          }
        }
        double layoutScore = self->_layoutScore;
        [v5 layoutScore];
        if (layoutScore != v49) {
          goto LABEL_48;
        }
        int isValidForSuggestionsWidget = self->_isValidForSuggestionsWidget;
        if (isValidForSuggestionsWidget != [v5 isValidForSuggestionsWidget]) {
          goto LABEL_48;
        }
        int confidenceWarrantsSnappingOrNPlusOne = self->_confidenceWarrantsSnappingOrNPlusOne;
        if (confidenceWarrantsSnappingOrNPlusOne != [v5 confidenceWarrantsSnappingOrNPlusOne])goto LABEL_48; {
        int isNPlusOne = self->_isNPlusOne;
        }
        if (isNPlusOne != [v5 isNPlusOne]) {
          goto LABEL_48;
        }
        widgetUniqueId = self->_widgetUniqueId;
        objc_super v54 = (NSString *)v5[13];
        if (widgetUniqueId == v54)
        {
        }
        else
        {
          v55 = v54;
          v56 = widgetUniqueId;
          char v57 = [(NSString *)v56 isEqual:v55];

          if ((v57 & 1) == 0) {
            goto LABEL_48;
          }
        }
        uuidOfHighestConfidenceSuggestion = self->_uuidOfHighestConfidenceSuggestion;
        v59 = (NSUUID *)v5[5];
        if (uuidOfHighestConfidenceSuggestion == v59)
        {
        }
        else
        {
          v60 = v59;
          v61 = uuidOfHighestConfidenceSuggestion;
          char v62 = [(NSUUID *)v61 isEqual:v60];

          if ((v62 & 1) == 0) {
            goto LABEL_48;
          }
        }
        unint64_t numWidgetsInStack = self->_numWidgetsInStack;
        BOOL v12 = numWidgetsInStack == [v5 numWidgetsInStack];
        goto LABEL_49;
      }
LABEL_48:
      BOOL v12 = 0;
LABEL_49:

      goto LABEL_50;
    }
    BOOL v12 = 0;
  }
LABEL_50:

  return v12;
}

+ (id)minSuggestionLayoutTypesForUILayoutType:(int64_t)a3
{
  v42[7] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      v41[0] = &unk_1F0627C58;
      v41[1] = &unk_1F0627C70;
      v42[0] = &unk_1F0627D00;
      v42[1] = &unk_1F0627D18;
      v41[2] = &unk_1F0627CB8;
      v41[3] = &unk_1F0627C88;
      v42[2] = &unk_1F0627D18;
      v42[3] = &unk_1F0627D18;
      v41[4] = &unk_1F0627CA0;
      v41[5] = &unk_1F0627CD0;
      v42[4] = &unk_1F0627D18;
      v42[5] = &unk_1F0627D18;
      v41[6] = &unk_1F0627CE8;
      v42[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v42;
      id v5 = v41;
      goto LABEL_20;
    case 1:
      v39[0] = &unk_1F0627C58;
      v39[1] = &unk_1F0627C70;
      v40[0] = &unk_1F0627D30;
      v40[1] = &unk_1F0627D48;
      v39[2] = &unk_1F0627CB8;
      v39[3] = &unk_1F0627C88;
      v40[2] = &unk_1F0627D18;
      v40[3] = &unk_1F0627D18;
      v39[4] = &unk_1F0627CA0;
      v39[5] = &unk_1F0627CD0;
      v40[4] = &unk_1F0627D18;
      v40[5] = &unk_1F0627D18;
      v39[6] = &unk_1F0627CE8;
      v40[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v40;
      id v5 = v39;
      goto LABEL_20;
    case 2:
      v37[0] = &unk_1F0627C58;
      v37[1] = &unk_1F0627C70;
      v38[0] = &unk_1F0627D30;
      v38[1] = &unk_1F0627D18;
      v37[2] = &unk_1F0627CB8;
      v37[3] = &unk_1F0627C88;
      v38[2] = &unk_1F0627D18;
      v38[3] = &unk_1F0627D60;
      v37[4] = &unk_1F0627CA0;
      v37[5] = &unk_1F0627CD0;
      v38[4] = &unk_1F0627D18;
      v38[5] = &unk_1F0627D18;
      v37[6] = &unk_1F0627CE8;
      v38[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v38;
      id v5 = v37;
      goto LABEL_20;
    case 3:
      v35[0] = &unk_1F0627C58;
      v35[1] = &unk_1F0627C70;
      v36[0] = &unk_1F0627D18;
      v36[1] = &unk_1F0627D18;
      v35[2] = &unk_1F0627CB8;
      v35[3] = &unk_1F0627C88;
      v36[2] = &unk_1F0627D18;
      v36[3] = &unk_1F0627D18;
      v35[4] = &unk_1F0627CA0;
      v35[5] = &unk_1F0627CD0;
      v36[4] = &unk_1F0627D60;
      v36[5] = &unk_1F0627D18;
      v35[6] = &unk_1F0627CE8;
      v36[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v36;
      id v5 = v35;
      goto LABEL_20;
    case 4:
      v33[0] = &unk_1F0627C58;
      v33[1] = &unk_1F0627C70;
      v34[0] = &unk_1F0627D18;
      v34[1] = &unk_1F0627D48;
      v33[2] = &unk_1F0627CB8;
      v33[3] = &unk_1F0627C88;
      v34[2] = &unk_1F0627D18;
      v34[3] = &unk_1F0627D18;
      v33[4] = &unk_1F0627CA0;
      v33[5] = &unk_1F0627CD0;
      v34[4] = &unk_1F0627D18;
      v34[5] = &unk_1F0627D18;
      v33[6] = &unk_1F0627CE8;
      v34[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v34;
      id v5 = v33;
      goto LABEL_20;
    case 5:
      v31[0] = &unk_1F0627C58;
      v31[1] = &unk_1F0627C70;
      v32[0] = &unk_1F0627D18;
      v32[1] = &unk_1F0627D18;
      v31[2] = &unk_1F0627CB8;
      v31[3] = &unk_1F0627C88;
      v32[2] = &unk_1F0627D18;
      v32[3] = &unk_1F0627D60;
      v31[4] = &unk_1F0627CA0;
      v31[5] = &unk_1F0627CD0;
      v32[4] = &unk_1F0627D18;
      v32[5] = &unk_1F0627D18;
      v31[6] = &unk_1F0627CE8;
      v32[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v32;
      id v5 = v31;
      goto LABEL_20;
    case 6:
      v29[0] = &unk_1F0627C58;
      v29[1] = &unk_1F0627C70;
      v30[0] = &unk_1F0627D18;
      v30[1] = &unk_1F0627D18;
      v29[2] = &unk_1F0627CB8;
      v29[3] = &unk_1F0627C88;
      v30[2] = &unk_1F0627D18;
      v30[3] = &unk_1F0627D48;
      v29[4] = &unk_1F0627CA0;
      v29[5] = &unk_1F0627CD0;
      v30[4] = &unk_1F0627D18;
      v30[5] = &unk_1F0627D18;
      v29[6] = &unk_1F0627CE8;
      v30[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v30;
      id v5 = v29;
      goto LABEL_20;
    case 7:
      v27[0] = &unk_1F0627C58;
      v27[1] = &unk_1F0627C70;
      v28[0] = &unk_1F0627D18;
      v28[1] = &unk_1F0627D30;
      v27[2] = &unk_1F0627CB8;
      v27[3] = &unk_1F0627C88;
      v28[2] = &unk_1F0627D18;
      v28[3] = &unk_1F0627D18;
      v27[4] = &unk_1F0627CA0;
      v27[5] = &unk_1F0627CD0;
      v28[4] = &unk_1F0627D18;
      v28[5] = &unk_1F0627D18;
      v27[6] = &unk_1F0627CE8;
      v28[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v28;
      id v5 = v27;
      goto LABEL_20;
    case 8:
      v25[0] = &unk_1F0627C58;
      v25[1] = &unk_1F0627C70;
      v26[0] = &unk_1F0627D18;
      v26[1] = &unk_1F0627D18;
      v25[2] = &unk_1F0627CB8;
      v25[3] = &unk_1F0627C88;
      v26[2] = &unk_1F0627D60;
      v26[3] = &unk_1F0627D18;
      v25[4] = &unk_1F0627CA0;
      v25[5] = &unk_1F0627CD0;
      v26[4] = &unk_1F0627D18;
      v26[5] = &unk_1F0627D18;
      v25[6] = &unk_1F0627CE8;
      v26[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v26;
      id v5 = v25;
      goto LABEL_20;
    case 9:
      v23[0] = &unk_1F0627C58;
      v23[1] = &unk_1F0627C70;
      v24[0] = &unk_1F0627D18;
      v24[1] = &unk_1F0627D18;
      v23[2] = &unk_1F0627CB8;
      v23[3] = &unk_1F0627C88;
      v24[2] = &unk_1F0627D48;
      v24[3] = &unk_1F0627D18;
      v23[4] = &unk_1F0627CA0;
      v23[5] = &unk_1F0627CD0;
      v24[4] = &unk_1F0627D18;
      v24[5] = &unk_1F0627D18;
      v23[6] = &unk_1F0627CE8;
      v24[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v24;
      id v5 = v23;
      goto LABEL_20;
    case 10:
      v21[0] = &unk_1F0627C58;
      v21[1] = &unk_1F0627C70;
      v22[0] = &unk_1F0627D18;
      v22[1] = &unk_1F0627D18;
      v21[2] = &unk_1F0627CB8;
      v21[3] = &unk_1F0627C88;
      v22[2] = &unk_1F0627D18;
      v22[3] = &unk_1F0627D18;
      v21[4] = &unk_1F0627CA0;
      v21[5] = &unk_1F0627CD0;
      v22[4] = &unk_1F0627D18;
      v22[5] = &unk_1F0627D60;
      v21[6] = &unk_1F0627CE8;
      v22[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v22;
      id v5 = v21;
      goto LABEL_20;
    case 11:
      v19[0] = &unk_1F0627C58;
      v19[1] = &unk_1F0627C70;
      v20[0] = &unk_1F0627D18;
      v20[1] = &unk_1F0627D18;
      v19[2] = &unk_1F0627CB8;
      v19[3] = &unk_1F0627C88;
      v20[2] = &unk_1F0627D30;
      v20[3] = &unk_1F0627D18;
      v19[4] = &unk_1F0627CA0;
      v19[5] = &unk_1F0627CD0;
      v20[4] = &unk_1F0627D18;
      v20[5] = &unk_1F0627D18;
      v19[6] = &unk_1F0627CE8;
      v20[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v20;
      id v5 = v19;
      goto LABEL_20;
    case 12:
      v15[0] = &unk_1F0627C58;
      v15[1] = &unk_1F0627C70;
      v16[0] = &unk_1F0627D18;
      v16[1] = &unk_1F0627D18;
      v15[2] = &unk_1F0627CB8;
      v15[3] = &unk_1F0627C88;
      v16[2] = &unk_1F0627D18;
      v16[3] = &unk_1F0627D60;
      v15[4] = &unk_1F0627CA0;
      v15[5] = &unk_1F0627CD0;
      v16[4] = &unk_1F0627D18;
      v16[5] = &unk_1F0627D18;
      v15[6] = &unk_1F0627CE8;
      v16[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v16;
      id v5 = v15;
      goto LABEL_20;
    case 13:
      v13[0] = &unk_1F0627C58;
      v13[1] = &unk_1F0627C70;
      v14[0] = &unk_1F0627D18;
      v14[1] = &unk_1F0627D18;
      v13[2] = &unk_1F0627CB8;
      v13[3] = &unk_1F0627C88;
      v14[2] = &unk_1F0627D18;
      v14[3] = &unk_1F0627D18;
      v13[4] = &unk_1F0627CA0;
      v13[5] = &unk_1F0627CD0;
      v14[4] = &unk_1F0627D60;
      v14[5] = &unk_1F0627D18;
      v13[6] = &unk_1F0627CE8;
      v14[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v14;
      id v5 = v13;
      goto LABEL_20;
    case 14:
      v11[0] = &unk_1F0627C58;
      v11[1] = &unk_1F0627C70;
      v12[0] = &unk_1F0627D18;
      v12[1] = &unk_1F0627D18;
      v11[2] = &unk_1F0627CB8;
      v11[3] = &unk_1F0627C88;
      v12[2] = &unk_1F0627D18;
      v12[3] = &unk_1F0627D60;
      v11[4] = &unk_1F0627CA0;
      v11[5] = &unk_1F0627CD0;
      v12[4] = &unk_1F0627D60;
      v12[5] = &unk_1F0627D18;
      v11[6] = &unk_1F0627CE8;
      v12[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v12;
      id v5 = v11;
      goto LABEL_20;
    case 15:
      v17[0] = &unk_1F0627C58;
      v17[1] = &unk_1F0627C70;
      v18[0] = &unk_1F0627D60;
      v18[1] = &unk_1F0627D18;
      v17[2] = &unk_1F0627CB8;
      v17[3] = &unk_1F0627C88;
      v18[2] = &unk_1F0627D18;
      v18[3] = &unk_1F0627D18;
      v17[4] = &unk_1F0627CA0;
      v17[5] = &unk_1F0627CD0;
      v18[4] = &unk_1F0627D18;
      v18[5] = &unk_1F0627D18;
      v17[6] = &unk_1F0627CE8;
      v18[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v18;
      id v5 = v17;
      goto LABEL_20;
    case 16:
      v9[0] = &unk_1F0627C58;
      v9[1] = &unk_1F0627C70;
      v10[0] = &unk_1F0627D18;
      v10[1] = &unk_1F0627D18;
      v9[2] = &unk_1F0627CB8;
      v9[3] = &unk_1F0627C88;
      v10[2] = &unk_1F0627D18;
      v10[3] = &unk_1F0627D18;
      v9[4] = &unk_1F0627CA0;
      v9[5] = &unk_1F0627CD0;
      v10[4] = &unk_1F0627D18;
      v10[5] = &unk_1F0627D18;
      v9[6] = &unk_1F0627CE8;
      v10[6] = &unk_1F0627D60;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v10;
      id v5 = v9;
      goto LABEL_20;
    case 17:
      v7[0] = &unk_1F0627C58;
      v7[1] = &unk_1F0627C70;
      v8[0] = &unk_1F0627D18;
      v8[1] = &unk_1F0627D18;
      v7[2] = &unk_1F0627CB8;
      v7[3] = &unk_1F0627C88;
      v8[2] = &unk_1F0627D18;
      v8[3] = &unk_1F0627D18;
      v7[4] = &unk_1F0627CA0;
      v7[5] = &unk_1F0627CD0;
      v8[4] = &unk_1F0627D18;
      v8[5] = &unk_1F0627D18;
      v7[6] = &unk_1F0627CE8;
      v8[6] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v8;
      id v5 = v7;
LABEL_20:
      a1 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:7];
      break;
    default:
      break;
  }
  return a1;
}

+ (id)maxSuggestionLayoutTypesForUILayoutType:(int64_t)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 8:
      v21[0] = &unk_1F0627C58;
      v21[1] = &unk_1F0627C70;
      v22[0] = &unk_1F0627D18;
      v22[1] = &unk_1F0627D18;
      v21[2] = &unk_1F0627CB8;
      v21[3] = &unk_1F0627C88;
      v22[2] = &unk_1F0627D78;
      v22[3] = &unk_1F0627D18;
      v21[4] = &unk_1F0627CA0;
      v22[4] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v22;
      id v5 = v21;
      goto LABEL_11;
    case 9:
    case 10:
    case 11:
    case 16:
      goto LABEL_5;
    case 12:
      v15[0] = &unk_1F0627C58;
      v15[1] = &unk_1F0627C70;
      v16[0] = &unk_1F0627DA8;
      v16[1] = &unk_1F0627D18;
      v15[2] = &unk_1F0627CB8;
      v15[3] = &unk_1F0627C88;
      v16[2] = &unk_1F0627D18;
      v16[3] = &unk_1F0627D48;
      v15[4] = &unk_1F0627CA0;
      v15[5] = &unk_1F0627CD0;
      v16[4] = &unk_1F0627D18;
      v16[5] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v16;
      id v5 = v15;
      goto LABEL_9;
    case 13:
      v13[0] = &unk_1F0627C58;
      v13[1] = &unk_1F0627C70;
      v14[0] = &unk_1F0627DA8;
      v14[1] = &unk_1F0627D18;
      v13[2] = &unk_1F0627CB8;
      v13[3] = &unk_1F0627C88;
      v14[2] = &unk_1F0627D18;
      v14[3] = &unk_1F0627D18;
      v13[4] = &unk_1F0627CA0;
      v13[5] = &unk_1F0627CD0;
      v14[4] = &unk_1F0627D60;
      v14[5] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v14;
      id v5 = v13;
      goto LABEL_9;
    case 14:
      v11[0] = &unk_1F0627C58;
      v11[1] = &unk_1F0627C70;
      v12[0] = &unk_1F0627DA8;
      v12[1] = &unk_1F0627D18;
      v11[2] = &unk_1F0627CB8;
      v11[3] = &unk_1F0627C88;
      v12[2] = &unk_1F0627D18;
      v12[3] = &unk_1F0627D48;
      v11[4] = &unk_1F0627CA0;
      v11[5] = &unk_1F0627CD0;
      v12[4] = &unk_1F0627D60;
      v12[5] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v12;
      id v5 = v11;
LABEL_9:
      uint64_t v7 = 6;
      goto LABEL_13;
    case 15:
      v17[0] = &unk_1F0627C58;
      v17[1] = &unk_1F0627C70;
      v18[0] = &unk_1F0627D78;
      v18[1] = &unk_1F0627D18;
      v17[2] = &unk_1F0627CB8;
      v17[3] = &unk_1F0627C88;
      v18[2] = &unk_1F0627D18;
      v18[3] = &unk_1F0627D18;
      v17[4] = &unk_1F0627CA0;
      v18[4] = &unk_1F0627D18;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v18;
      id v5 = v17;
      goto LABEL_11;
    case 17:
      v9[0] = &unk_1F0627C58;
      v9[1] = &unk_1F0627C70;
      v10[0] = &unk_1F0627D90;
      v10[1] = &unk_1F0627D90;
      v9[2] = &unk_1F0627CB8;
      v9[3] = &unk_1F0627C88;
      v10[2] = &unk_1F0627D90;
      v10[3] = &unk_1F0627D90;
      v9[4] = &unk_1F0627CA0;
      v9[5] = &unk_1F0627CD0;
      v10[4] = &unk_1F0627D90;
      v10[5] = &unk_1F0627D90;
      v9[6] = &unk_1F0627CE8;
      v10[6] = &unk_1F0627D90;
      uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
      id v4 = v10;
      id v5 = v9;
      uint64_t v7 = 7;
      goto LABEL_13;
    default:
      if (a3)
      {
LABEL_5:
        uint64_t v6 = objc_msgSend(a1, "minSuggestionLayoutTypesForUILayoutType:");
      }
      else
      {
        v19[0] = &unk_1F0627C58;
        v19[1] = &unk_1F0627C70;
        v20[0] = &unk_1F0627D90;
        v20[1] = &unk_1F0627D18;
        v19[2] = &unk_1F0627CB8;
        v19[3] = &unk_1F0627C88;
        v20[2] = &unk_1F0627D18;
        v20[3] = &unk_1F0627D18;
        v19[4] = &unk_1F0627CA0;
        v20[4] = &unk_1F0627D18;
        uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
        id v4 = v20;
        id v5 = v19;
LABEL_11:
        uint64_t v7 = 5;
LABEL_13:
        uint64_t v6 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:v7];
      }
      return v6;
  }
}

+ (BOOL)isCompositeLayout:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x27000u >> a3);
}

+ (id)stringFromUILayoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10) {
    return @"ATXUILayoutTypeEight1x1";
  }
  else {
    return off_1E5F00BD8[a3 - 1];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXSuggestionLayout allocWithZone:a3];
  LODWORD(v6) = *(_DWORD *)&self->_isValidForSuggestionsWidget;
  return -[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:](v4, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:", self->_layoutType, self->_oneByOneSuggestions, self->_oneByTwoSuggestions, self->_twoByTwoSuggestions, self->_oneByFourSuggestions, self->_twoByFourSuggestions, self->_layoutScore, self->_fourByFourSuggestions, self->_fourByEightSuggestions, self->_uuid, v6, self->_widgetUniqueId, self->_uuidOfHighestConfidenceSuggestion, self->_numWidgetsInStack);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    long long v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    long long v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    long long v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    long long v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSuggestionLayout *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSuggestionLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  uint64_t v6 = [(ATXSuggestionLayout *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXSuggestionLayout *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  [(ATXPBSuggestionLayout *)(uint64_t)v3 setLayoutType:[(ATXSuggestionLayout *)self _protoLayoutTypeFromLayoutType:self->_layoutType]];
  [(ATXPBSuggestionLayout *)(uint64_t)v3 setLayoutScore:self->_layoutScore];
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBSuggestionLayout setUuidString:]((uint64_t)v3, v4);

  id v5 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_oneByOneSuggestions];
  -[ATXPBSuggestionLayout setOneByOneSuggestions:]((uint64_t)v3, v5);

  uint64_t v6 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_oneByTwoSuggestions];
  -[ATXPBSuggestionLayout setOneByTwoSuggestions:]((uint64_t)v3, v6);

  uint64_t v7 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_twoByTwoSuggestions];
  -[ATXPBSuggestionLayout setTwoByTwoSuggestions:]((uint64_t)v3, v7);

  uint64_t v8 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_oneByFourSuggestions];
  -[ATXPBSuggestionLayout setOneByFourSuggestions:]((uint64_t)v3, v8);

  v9 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_twoByFourSuggestions];
  -[ATXPBSuggestionLayout setTwoByFourSuggestions:]((uint64_t)v3, v9);

  uint64_t v10 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_fourByFourSuggestions];
  -[ATXPBSuggestionLayout setFourByFourSuggestions:]((uint64_t)v3, v10);

  id v11 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_fourByEightSuggestions];
  -[ATXPBSuggestionLayout setFourByEightSuggestions:]((uint64_t)v3, v11);

  -[ATXPBSuggestionLayout setIsValidForSuggestionsWidget:]((uint64_t)v3, self->_isValidForSuggestionsWidget);
  -[ATXPBSuggestionLayout setConfidenceWarrantsSnappingOrNPlusOne:]((uint64_t)v3, self->_confidenceWarrantsSnappingOrNPlusOne);
  -[ATXPBSuggestionLayout setIsNPlusOne:]((uint64_t)v3, self->_isNPlusOne);
  -[ATXPBSuggestionLayout setWidgetUniqueId:]((uint64_t)v3, self->_widgetUniqueId);
  -[ATXPBSuggestionLayout setIsLowConfidenceStackRotationForStaleStack:]((uint64_t)v3, self->_isLowConfidenceStackRotationForStaleStack);
  id v12 = [(NSUUID *)self->_uuidOfHighestConfidenceSuggestion UUIDString];
  -[ATXPBSuggestionLayout setUuidOfHighestConfidenceSuggestion:]((uint64_t)v3, v12);

  -[ATXPBSuggestionLayout setNumWidgetsInStack:]((uint64_t)v3, self->_numWidgetsInStack);
  return v3;
}

- (int)_protoLayoutTypeFromLayoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0x11) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)arrayOfJSONFromSuggestionArray:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_3);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

uint64_t __54__ATXSuggestionLayout_arrayOfJSONFromSuggestionArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRawData];
}

- (id)jsonRawData
{
  v28[17] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ATXSuggestionLayout *)self suggestionWithUUID:self->_uuidOfHighestConfidenceSuggestion];
  uuid = self->_uuid;
  id v5 = @"nil";
  int v26 = uuid;
  v27[0] = @"uuid";
  if (uuid)
  {
    uint64_t v6 = [(NSUUID *)uuid UUIDString];
  }
  else
  {
    uint64_t v6 = @"nil";
  }
  char v22 = v6;
  v28[0] = v6;
  v27[1] = @"layoutType";
  id v25 = [(id)objc_opt_class() stringFromUILayoutType:self->_layoutType];
  v28[1] = v25;
  v27[2] = @"layoutScore";
  uint64_t v7 = [NSNumber numberWithDouble:self->_layoutScore];
  if (self->_isValidForSuggestionsWidget) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  id v24 = (void *)v7;
  v28[2] = v7;
  v28[3] = v8;
  v27[3] = @"isValidForSuggestionsWidget";
  v27[4] = @"confidenceWarrantsSnappingOrNPlusOne";
  if (self->_confidenceWarrantsSnappingOrNPlusOne) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (self->_isNPlusOne) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v28[4] = v9;
  v28[5] = v10;
  v27[5] = @"isNPlusOne";
  v27[6] = @"isLowConfidenceStackRotationForStaleStack";
  if (self->_isLowConfidenceStackRotationForStaleStack) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  widgetUniqueId = (__CFString *)self->_widgetUniqueId;
  if (!widgetUniqueId) {
    widgetUniqueId = @"nil";
  }
  v28[6] = v11;
  void v28[7] = widgetUniqueId;
  void v27[7] = @"widgetUniqueId";
  v27[8] = @"[1 x 1]";
  uint64_t v23 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_oneByOneSuggestions];
  v28[8] = v23;
  v27[9] = @"[1 x 2]";
  id v13 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_oneByTwoSuggestions];
  v28[9] = v13;
  v27[10] = @"[2 x 2]";
  BOOL v14 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_twoByTwoSuggestions];
  v28[10] = v14;
  v27[11] = @"[1 x 4]";
  long long v15 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_oneByFourSuggestions];
  v28[11] = v15;
  v27[12] = @"[2 x 4]";
  id v16 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_twoByFourSuggestions];
  v28[12] = v16;
  v27[13] = @"[4 x 4]";
  char v17 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_fourByFourSuggestions];
  v28[13] = v17;
  v27[14] = @"[4 x 8]";
  uint64_t v18 = [(ATXSuggestionLayout *)self arrayOfJSONFromSuggestionArray:self->_fourByEightSuggestions];
  v28[14] = v18;
  v27[15] = @"highestConfidenceSuggestion";
  if (v3)
  {
    id v5 = [v3 jsonRawData];
  }
  v28[15] = v5;
  v27[16] = @"numWidgetsInStack";
  id v19 = [NSNumber numberWithUnsignedInteger:self->_numWidgetsInStack];
  v28[16] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:17];

  if (v3) {
  if (v26)
  }

  return v20;
}

- (BOOL)isShortcutConversion
{
  if (self->_isValidForSuggestionsWidget) {
    return 0;
  }
  uint64_t v3 = [(ATXSuggestionLayout *)self allSuggestionsInLayout];
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 executableSpecification];
    uint64_t v6 = [v5 executableType];

    if (v6 == 3)
    {
      uint64_t v7 = [v4 clientModelSpecification];
      uint64_t v8 = [v7 clientModelId];
      int64_t v9 = +[ATXProactiveSuggestionClientModel clientModelTypeFromClientModelId:v8];

      BOOL v2 = +[ATXProactiveSuggestionClientModel clientModelTypeIsShortcutConversion:v9];
    }
    else
    {
      BOOL v2 = 0;
    }
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (void)setLayoutScore:(double)a3
{
  self->_double layoutScore = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuidOfHighestConfidenceSuggestion
{
  return self->_uuidOfHighestConfidenceSuggestion;
}

- (void)setUuidOfHighestConfidenceSuggestion:(id)a3
{
}

- (NSArray)oneByOneSuggestions
{
  return self->_oneByOneSuggestions;
}

- (void)setOneByOneSuggestions:(id)a3
{
}

- (NSArray)oneByTwoSuggestions
{
  return self->_oneByTwoSuggestions;
}

- (void)setOneByTwoSuggestions:(id)a3
{
}

- (NSArray)twoByTwoSuggestions
{
  return self->_twoByTwoSuggestions;
}

- (void)setTwoByTwoSuggestions:(id)a3
{
}

- (NSArray)oneByFourSuggestions
{
  return self->_oneByFourSuggestions;
}

- (void)setOneByFourSuggestions:(id)a3
{
}

- (NSArray)twoByFourSuggestions
{
  return self->_twoByFourSuggestions;
}

- (void)setTwoByFourSuggestions:(id)a3
{
}

- (NSArray)fourByFourSuggestions
{
  return self->_fourByFourSuggestions;
}

- (void)setFourByFourSuggestions:(id)a3
{
}

- (NSArray)fourByEightSuggestions
{
  return self->_fourByEightSuggestions;
}

- (void)setFourByEightSuggestions:(id)a3
{
}

- (BOOL)isValidForSuggestionsWidget
{
  return self->_isValidForSuggestionsWidget;
}

- (void)setIsValidForSuggestionsWidget:(BOOL)a3
{
  self->_int isValidForSuggestionsWidget = a3;
}

- (BOOL)confidenceWarrantsSnappingOrNPlusOne
{
  return self->_confidenceWarrantsSnappingOrNPlusOne;
}

- (void)setConfidenceWarrantsSnappingOrNPlusOne:(BOOL)a3
{
  self->_int confidenceWarrantsSnappingOrNPlusOne = a3;
}

- (BOOL)isNPlusOne
{
  return self->_isNPlusOne;
}

- (void)setIsNPlusOne:(BOOL)a3
{
  self->_int isNPlusOne = a3;
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (void)setWidgetUniqueId:(id)a3
{
}

- (BOOL)isLowConfidenceStackRotationForStaleStack
{
  return self->_isLowConfidenceStackRotationForStaleStack;
}

- (void)setIsLowConfidenceStackRotationForStaleStack:(BOOL)a3
{
  self->_isLowConfidenceStackRotationForStaleStack = a3;
}

- (unint64_t)numWidgetsInStack
{
  return self->_numWidgetsInStack;
}

- (void)setNumWidgetsInStack:(unint64_t)a3
{
  self->_unint64_t numWidgetsInStack = a3;
}

@end