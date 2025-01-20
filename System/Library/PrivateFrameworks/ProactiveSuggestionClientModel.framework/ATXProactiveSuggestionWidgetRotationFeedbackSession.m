@interface ATXProactiveSuggestionWidgetRotationFeedbackSession
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionWidgetRotationFeedbackSession)init;
- (ATXProactiveSuggestionWidgetRotationFeedbackSession)initWithCoder:(id)a3;
- (ATXProactiveSuggestionWidgetRotationFeedbackSession)initWithEngagementType:(int64_t)a3 metadata:(id)a4 engagementHistory:(id)a5 systemSuggestSuggestionLayout:(id)a6 sessionStartDate:(id)a7 sessionEndDate:(id)a8 dwellStartDate:(id)a9 longestDwell:(double)a10;
- (ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata)metadata;
- (ATXSuggestionLayout)systemSuggestSuggestionLayout;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionWidgetRotationFeedbackSession:(id)a3;
- (NSDate)dwellStartDate;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartDate;
- (NSMutableArray)engagementHistory;
- (double)longestDwell;
- (id)description;
- (int64_t)engagementType;
- (void)encodeWithCoder:(id)a3;
- (void)markRotationSessionEndedAtDate:(id)a3 wasUserScroll:(BOOL)a4;
- (void)markRotationSessionStartedAtDate:(id)a3;
- (void)markStackHiddenAtDate:(id)a3;
- (void)markStackShownAtDate:(id)a3;
- (void)markStackTapped;
- (void)tryUpdateStackRotationEngagementType:(int64_t)a3;
- (void)updateSessionMetadata:(id)a3;
- (void)updateWithSystemSuggestSuggestionLayout:(id)a3;
@end

@implementation ATXProactiveSuggestionWidgetRotationFeedbackSession

- (ATXProactiveSuggestionWidgetRotationFeedbackSession)init
{
  v3 = objc_opt_new();
  v4 = [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self initWithEngagementType:0 metadata:0 engagementHistory:v3 systemSuggestSuggestionLayout:0 sessionStartDate:0 sessionEndDate:0 dwellStartDate:0.0 longestDwell:0];

  return v4;
}

- (ATXProactiveSuggestionWidgetRotationFeedbackSession)initWithEngagementType:(int64_t)a3 metadata:(id)a4 engagementHistory:(id)a5 systemSuggestSuggestionLayout:(id)a6 sessionStartDate:(id)a7 sessionEndDate:(id)a8 dwellStartDate:(id)a9 longestDwell:(double)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXProactiveSuggestionWidgetRotationFeedbackSession;
  v20 = [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_engagementType = a3;
    objc_storeStrong((id *)&v20->_metadata, a4);
    objc_storeStrong((id *)&v21->_engagementHistory, a5);
    objc_storeStrong((id *)&v21->_systemSuggestSuggestionLayout, a6);
    objc_storeStrong((id *)&v21->_sessionStartDate, a7);
    objc_storeStrong((id *)&v21->_sessionEndDate, a8);
    objc_storeStrong((id *)&v21->_dwellStartDate, a9);
    v21->_longestDwell = a10;
  }

  return v21;
}

- (void)markRotationSessionStartedAtDate:(id)a3
{
}

- (void)updateWithSystemSuggestSuggestionLayout:(id)a3
{
}

- (void)markStackShownAtDate:(id)a3
{
  objc_storeStrong((id *)&self->_dwellStartDate, a3);
  [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self tryUpdateStackRotationEngagementType:1];
}

- (void)markStackHiddenAtDate:(id)a3
{
  id v4 = a3;
  dwellStartDate = self->_dwellStartDate;
  id v8 = v4;
  if (v4 && dwellStartDate)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    double v7 = v6;
    if (v6 >= *(double *)&kATXWidgetRotationFeedbackMinTimeIntervalToBeConsideredDwell) {
      [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self tryUpdateStackRotationEngagementType:3];
    }
    if (v7 > self->_longestDwell) {
      self->_longestDwell = v7;
    }
    dwellStartDate = self->_dwellStartDate;
  }
  self->_dwellStartDate = 0;
}

- (void)markStackTapped
{
}

- (void)tryUpdateStackRotationEngagementType:(int64_t)a3
{
  engagementHistory = self->_engagementHistory;
  double v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  [(NSMutableArray *)engagementHistory addObject:v6];

  if (self->_engagementType < a3) {
    self->_engagementType = a3;
  }
}

- (void)markRotationSessionEndedAtDate:(id)a3 wasUserScroll:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_sessionEndDate, a3);
  [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self markStackHiddenAtDate:v7];
  if (v4) {
    [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self tryUpdateStackRotationEngagementType:2];
  }
}

- (void)updateSessionMetadata:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (ATXProactiveSuggestionWidgetRotationFeedbackSession *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self isEqualToATXProactiveSuggestionWidgetRotationFeedbackSession:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionWidgetRotationFeedbackSession:(id)a3
{
  BOOL v4 = (id *)a3;
  v5 = v4;
  if (self->_engagementType != v4[1]) {
    goto LABEL_24;
  }
  metadata = self->_metadata;
  id v7 = (ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *)v4[2];
  if (metadata == v7)
  {
  }
  else
  {
    id v8 = v7;
    v9 = metadata;
    char v10 = [(ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_24;
    }
  }
  engagementHistory = self->_engagementHistory;
  v12 = (NSMutableArray *)v5[3];
  if (engagementHistory == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = engagementHistory;
    char v15 = [(NSMutableArray *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_24;
    }
  }
  systemSuggestSuggestionLayout = self->_systemSuggestSuggestionLayout;
  v17 = (ATXSuggestionLayout *)v5[4];
  if (systemSuggestSuggestionLayout == v17)
  {
  }
  else
  {
    id v18 = v17;
    id v19 = systemSuggestSuggestionLayout;
    BOOL v20 = [(ATXSuggestionLayout *)v19 isEqual:v18];

    if (!v20) {
      goto LABEL_24;
    }
  }
  sessionStartDate = self->_sessionStartDate;
  v22 = (NSDate *)v5[5];
  if (sessionStartDate == v22)
  {
  }
  else
  {
    id v23 = v22;
    id v24 = sessionStartDate;
    char v25 = [(NSDate *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_24;
    }
  }
  sessionEndDate = self->_sessionEndDate;
  objc_super v27 = (NSDate *)v5[6];
  if (sessionEndDate == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = sessionEndDate;
    char v30 = [(NSDate *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_24;
    }
  }
  dwellStartDate = self->_dwellStartDate;
  v32 = (NSDate *)v5[7];
  if (dwellStartDate == v32)
  {

    goto LABEL_27;
  }
  v33 = v32;
  v34 = dwellStartDate;
  char v35 = [(NSDate *)v34 isEqual:v33];

  if (v35)
  {
LABEL_27:
    BOOL v36 = self->_longestDwell == *((double *)v5 + 8);
    goto LABEL_25;
  }
LABEL_24:
  BOOL v36 = 0;
LABEL_25:

  return v36;
}

- (id)description
{
  id v3 = [NSString alloc];
  BOOL v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = (void *)v5;
  id v7 = @"YES";
  if (!self->_systemSuggestSuggestionLayout) {
    id v7 = @"NO";
  }
  id v8 = (void *)[v3 initWithFormat:@"%@ - engagementType: %lu, metadata: %@, engagementHistory: %@, suggestionLayout: %@, sessionStartDate: %@, sessionEndDate: %@, dwellStartDate: %@, longestDwell: %f", v5, *(_OWORD *)&self->_engagementType, self->_engagementHistory, v7, self->_sessionStartDate, self->_sessionEndDate, self->_dwellStartDate, *(void *)&self->_longestDwell];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    char v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
    char v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  int64_t engagementType = self->_engagementType;
  id v5 = a3;
  [v5 encodeInteger:engagementType forKey:@"engagementType"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
  [v5 encodeObject:self->_engagementHistory forKey:@"engagementHistory"];
  [v5 encodeObject:self->_systemSuggestSuggestionLayout forKey:@"suggestionLayout"];
  [v5 encodeObject:self->_sessionStartDate forKey:@"startDate"];
  [v5 encodeObject:self->_sessionEndDate forKey:@"endDate"];
  [v5 encodeObject:self->_dwellStartDate forKey:@"dwellStartDate"];
  [v5 encodeDouble:@"longestDwell" forKey:self->_longestDwell];
}

- (ATXProactiveSuggestionWidgetRotationFeedbackSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"engagementType"];
  if ([(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self checkAndReportDecodingFailureIfNeededForNSInteger:v5 key:@"engagementType" coder:v4 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v8 = objc_opt_class();
    v9 = __atxlog_handle_blending_ecosystem();
    char v10 = [v7 robustDecodeObjectOfClass:v8 forKey:@"metadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1 logHandle:v9];

    id v11 = [v4 error];

    if (v11)
    {
      BOOL v6 = 0;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F93B90];
      id v13 = (void *)MEMORY[0x1B3E6F520]();
      id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v15 = objc_opt_class();
      id v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
      v17 = __atxlog_handle_blending_ecosystem();
      id v18 = [v12 robustDecodeObjectOfClasses:v16 forKey:@"engagementHistory" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1 logHandle:v17];

      if (v18
        && ([v4 error], id v19 = objc_claimAutoreleasedReturnValue(), v19, !v19))
      {
        BOOL v20 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v21 = objc_opt_class();
        v22 = __atxlog_handle_blending_ecosystem();
        id v23 = [v20 robustDecodeObjectOfClass:v21 forKey:@"suggestionLayout" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1 logHandle:v22];

        id v24 = [v4 error];

        if (v24)
        {
          BOOL v6 = 0;
        }
        else
        {
          char v25 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v26 = objc_opt_class();
          objc_super v27 = __atxlog_handle_blending_ecosystem();
          v28 = [v25 robustDecodeObjectOfClass:v26 forKey:@"startDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1 logHandle:v27];

          v29 = [v4 error];

          if (v29)
          {
            BOOL v6 = 0;
          }
          else
          {
            v44 = v28;
            char v30 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v31 = objc_opt_class();
            v32 = __atxlog_handle_blending_ecosystem();
            v33 = [v30 robustDecodeObjectOfClass:v31 forKey:@"endDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1 logHandle:v32];

            v34 = [v4 error];

            if (v34)
            {
              BOOL v6 = 0;
              v28 = v44;
            }
            else
            {
              v43 = v33;
              char v35 = (void *)MEMORY[0x1E4F93B90];
              uint64_t v36 = objc_opt_class();
              v37 = __atxlog_handle_blending_ecosystem();
              v38 = [v35 robustDecodeObjectOfClass:v36 forKey:@"dwellStartDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession" errorCode:-1 logHandle:v37];

              v39 = [v4 error];

              if (v39)
              {
                BOOL v6 = 0;
                v33 = v43;
                v28 = v44;
              }
              else
              {
                [v4 decodeDoubleForKey:@"longestDwell"];
                double v41 = v40;
                v28 = v44;
                if (-[ATXProactiveSuggestionWidgetRotationFeedbackSession checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"longestDwell", v4, @"com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession", -1))
                {
                  BOOL v6 = 0;
                  v33 = v43;
                }
                else
                {
                  v33 = v43;
                  self = [(ATXProactiveSuggestionWidgetRotationFeedbackSession *)self initWithEngagementType:v5 metadata:v10 engagementHistory:v18 systemSuggestSuggestionLayout:v23 sessionStartDate:v44 sessionEndDate:v43 dwellStartDate:v41 longestDwell:v38];
                  BOOL v6 = self;
                }
              }
            }
          }
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (int64_t)engagementType
{
  return self->_engagementType;
}

- (ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata)metadata
{
  return self->_metadata;
}

- (NSMutableArray)engagementHistory
{
  return self->_engagementHistory;
}

- (ATXSuggestionLayout)systemSuggestSuggestionLayout
{
  return self->_systemSuggestSuggestionLayout;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (NSDate)dwellStartDate
{
  return self->_dwellStartDate;
}

- (double)longestDwell
{
  return self->_longestDwell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dwellStartDate, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_systemSuggestSuggestionLayout, 0);
  objc_storeStrong((id *)&self->_engagementHistory, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end