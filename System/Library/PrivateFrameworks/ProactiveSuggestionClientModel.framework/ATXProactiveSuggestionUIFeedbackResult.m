@interface ATXProactiveSuggestionUIFeedbackResult
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionUIFeedbackResult)initWithCoder:(id)a3;
- (ATXProactiveSuggestionUIFeedbackResult)initWithEngagementType:(int64_t)a3 shownSuggestions:(id)a4 engagedSuggestions:(id)a5 rejectedSuggestions:(id)a6 session:(id)a7 consumerSubType:(unsigned __int8)a8 clientCacheUpdate:(id)a9 uiCacheUpdate:(id)a10 context:(id)a11;
- (ATXProactiveSuggestionUIFeedbackResult)initWithShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5 session:(id)a6 consumerSubType:(unsigned __int8)a7 clientCacheUpdate:(id)a8 uiCacheUpdate:(id)a9 context:(id)a10;
- (ATXProactiveSuggestionUIFeedbackSession)session;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionUIFeedbackResult:(id)a3;
- (NSArray)engagedSuggestions;
- (NSArray)rejectedSuggestions;
- (NSArray)shownSuggestions;
- (id)description;
- (id)suggestionExecutableObjectListFromSuggestions:(id)a3;
- (int64_t)engagementType;
- (int64_t)uiEngagementTypeFromShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionUIFeedbackResult

- (ATXProactiveSuggestionUIFeedbackResult)initWithShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5 session:(id)a6 consumerSubType:(unsigned __int8)a7 clientCacheUpdate:(id)a8 uiCacheUpdate:(id)a9 context:(id)a10
{
  uint64_t v11 = a7;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [(ATXProactiveSuggestionUIFeedbackResult *)self initWithEngagementType:[(ATXProactiveSuggestionUIFeedbackResult *)self uiEngagementTypeFromShownSuggestions:v23 engagedSuggestions:v22 rejectedSuggestions:v21] shownSuggestions:v23 engagedSuggestions:v22 rejectedSuggestions:v21 session:v20 consumerSubType:v11 clientCacheUpdate:v19 uiCacheUpdate:v18 context:v17];

  return v24;
}

- (ATXProactiveSuggestionUIFeedbackResult)initWithEngagementType:(int64_t)a3 shownSuggestions:(id)a4 engagedSuggestions:(id)a5 rejectedSuggestions:(id)a6 session:(id)a7 consumerSubType:(unsigned __int8)a8 clientCacheUpdate:(id)a9 uiCacheUpdate:(id)a10 context:(id)a11
{
  uint64_t v11 = a8;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXProactiveSuggestionUIFeedbackResult;
  id v18 = [(ATXProactiveSuggestionFeedbackResult *)&v25 initWithConsumerSubType:v11 sessionType:0 clientCacheUpdate:a9 uiCacheUpdate:a10 context:a11];
  id v19 = v18;
  if (v18)
  {
    v18->_engagementType = a3;
    objc_storeStrong((id *)&v18->_shownSuggestions, a4);
    objc_storeStrong((id *)&v19->_engagedSuggestions, a5);
    objc_storeStrong((id *)&v19->_rejectedSuggestions, a6);
    objc_storeStrong((id *)&v19->_session, a7);
  }

  return v19;
}

- (int64_t)uiEngagementTypeFromShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5
{
  id v6 = a4;
  int64_t v7 = [a5 count] != 0;
  uint64_t v8 = [v6 count];

  if (v8) {
    return 2;
  }
  else {
    return v7;
  }
}

- (unint64_t)hash
{
  int64_t engagementType = self->_engagementType;
  uint64_t v4 = [(NSArray *)self->_engagedSuggestions hash] - engagementType + 32 * engagementType;
  uint64_t v5 = [(NSArray *)self->_shownSuggestions hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_rejectedSuggestions hash] - v5 + 32 * v5;
  unint64_t v7 = 31 * ([(ATXProactiveSuggestionUIFeedbackSession *)self->_session hash] - v6 + 32 * v6);
  unint64_t v8 = v7 + [(ATXProactiveSuggestionFeedbackResult *)self consumerSubType];
  v9 = [(ATXProactiveSuggestionFeedbackResult *)self clientCacheUpdate];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  uint64_t v11 = [(ATXProactiveSuggestionFeedbackResult *)self uiCacheUpdate];
  uint64_t v12 = [v11 hash] - v10 + 32 * v10;

  v13 = [(ATXProactiveSuggestionFeedbackResult *)self context];
  unint64_t v14 = [v13 hash] - v12 + 32 * v12;

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXProactiveSuggestionUIFeedbackResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionUIFeedbackResult *)self isEqualToATXProactiveSuggestionUIFeedbackResult:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionUIFeedbackResult:(id)a3
{
  uint64_t v4 = (id *)a3;
  int64_t engagementType = self->_engagementType;
  if (engagementType != [v4 engagementType]) {
    goto LABEL_25;
  }
  engagedSuggestions = self->_engagedSuggestions;
  unint64_t v7 = (NSArray *)v4[8];
  if (engagedSuggestions == v7)
  {
  }
  else
  {
    unint64_t v8 = v7;
    v9 = engagedSuggestions;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_25;
    }
  }
  shownSuggestions = self->_shownSuggestions;
  uint64_t v12 = (NSArray *)v4[7];
  if (shownSuggestions == v12)
  {
  }
  else
  {
    v13 = v12;
    unint64_t v14 = shownSuggestions;
    char v15 = [(NSArray *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_25;
    }
  }
  rejectedSuggestions = self->_rejectedSuggestions;
  id v17 = (NSArray *)v4[9];
  if (rejectedSuggestions == v17)
  {
  }
  else
  {
    id v18 = v17;
    id v19 = rejectedSuggestions;
    char v20 = [(NSArray *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_25;
    }
  }
  session = self->_session;
  id v22 = (ATXProactiveSuggestionUIFeedbackSession *)v4[10];
  if (session == v22)
  {
  }
  else
  {
    id v23 = v22;
    id v24 = session;
    BOOL v25 = [(ATXProactiveSuggestionUIFeedbackSession *)v24 isEqual:v23];

    if (!v25) {
      goto LABEL_25;
    }
  }
  int v26 = [(ATXProactiveSuggestionFeedbackResult *)self consumerSubType];
  if (v26 != [v4 consumerSubType])
  {
LABEL_25:
    char v39 = 0;
    goto LABEL_26;
  }
  v27 = [(ATXProactiveSuggestionFeedbackResult *)self clientCacheUpdate];
  uint64_t v28 = [v4 clientCacheUpdate];
  if (v27 == (void *)v28)
  {
  }
  else
  {
    v29 = (void *)v28;
    v30 = [(ATXProactiveSuggestionFeedbackResult *)self clientCacheUpdate];
    v31 = [v4 clientCacheUpdate];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_25;
    }
  }
  v33 = [(ATXProactiveSuggestionFeedbackResult *)self uiCacheUpdate];
  uint64_t v34 = [v4 uiCacheUpdate];
  if (v33 == (void *)v34)
  {
  }
  else
  {
    v35 = (void *)v34;
    v36 = [(ATXProactiveSuggestionFeedbackResult *)self uiCacheUpdate];
    v37 = [v4 uiCacheUpdate];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_25;
    }
  }
  v41 = [(ATXProactiveSuggestionFeedbackResult *)self context];
  uint64_t v42 = [v4 context];
  if (v41 == (void *)v42)
  {
    char v39 = 1;
    v43 = v41;
  }
  else
  {
    v43 = (void *)v42;
    v44 = [(ATXProactiveSuggestionFeedbackResult *)self context];
    v45 = [v4 context];
    char v39 = [v44 isEqual:v45];
  }
LABEL_26:

  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", -[ATXProactiveSuggestionFeedbackResult consumerSubType](self, "consumerSubType"));
  [v14 encodeObject:v4 forKey:@"consumerSubType"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXProactiveSuggestionFeedbackResult sessionType](self, "sessionType"));
  [v14 encodeObject:v5 forKey:@"sessionType"];

  BOOL v6 = [(ATXProactiveSuggestionFeedbackResult *)self clientCacheUpdate];
  [v14 encodeObject:v6 forKey:@"clientCache"];

  unint64_t v7 = [(ATXProactiveSuggestionFeedbackResult *)self uiCacheUpdate];
  [v14 encodeObject:v7 forKey:@"uiCache"];

  unint64_t v8 = [(ATXProactiveSuggestionFeedbackResult *)self context];
  [v14 encodeObject:v8 forKey:@"context"];

  v9 = [(ATXProactiveSuggestionFeedbackResult *)self context];

  if (v9)
  {
    char v10 = [(ATXProactiveSuggestionFeedbackResult *)self context];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v14 encodeObject:v12 forKey:@"contextString"];
  }
  v13 = [NSNumber numberWithInteger:self->_engagementType];
  [v14 encodeObject:v13 forKey:@"uiEngagementType"];

  [v14 encodeObject:self->_engagedSuggestions forKey:@"engaged"];
  [v14 encodeObject:self->_shownSuggestions forKey:@"shown"];
  [v14 encodeObject:self->_rejectedSuggestions forKey:@"dismissed"];
  [v14 encodeObject:self->_session forKey:@"session"];
}

- (ATXProactiveSuggestionUIFeedbackResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = __atxlog_handle_blending_ecosystem();
  unint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"consumerSubType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v7];

  if (v8)
  {
    v9 = [v4 error];

    if (!v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v8 found:0];
      if (v12)
      {
        uint64_t v13 = v12;
        id v14 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v15 = objc_opt_class();
        v16 = __atxlog_handle_blending_ecosystem();
        id v17 = [v14 robustDecodeObjectOfClass:v15 forKey:@"sessionType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v16];

        if (!v17
          || ([v4 error], id v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
        {
          char v10 = 0;
LABEL_50:

          goto LABEL_4;
        }
        id v19 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v20 = objc_opt_class();
        id v21 = __atxlog_handle_blending_ecosystem();
        id v22 = [v19 robustDecodeObjectOfClass:v20 forKey:@"clientCache" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v21];

        if (!v22
          || ([v4 error], id v23 = objc_claimAutoreleasedReturnValue(), v23, v23))
        {
          char v10 = 0;
LABEL_49:

          goto LABEL_50;
        }
        v73 = v22;
        id v24 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v25 = objc_opt_class();
        int v26 = __atxlog_handle_blending_ecosystem();
        v27 = [v24 robustDecodeObjectOfClass:v25 forKey:@"uiCache" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v26];

        if (!v27
          || ([v4 error], uint64_t v28 = objc_claimAutoreleasedReturnValue(), v28, v28))
        {
          char v10 = 0;
          id v22 = v73;
LABEL_48:

          goto LABEL_49;
        }
        v72 = v27;
        v29 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v30 = objc_opt_class();
        v31 = __atxlog_handle_blending_ecosystem();
        int v32 = [v29 robustDecodeObjectOfClass:v30 forKey:@"contextString" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v31];

        v33 = [v4 error];

        if (v33)
        {
          char v10 = 0;
          v27 = v72;
          id v22 = v73;
LABEL_47:

          goto LABEL_48;
        }
        id v22 = v73;
        if (v32
          && ([(ATXProactiveSuggestionFeedbackResult *)self validContextClassNames],
              uint64_t v34 = objc_claimAutoreleasedReturnValue(),
              int v35 = [v34 containsObject:v32],
              v34,
              v35))
        {
          v36 = NSClassFromString((NSString *)v32);
          if (!v36) {
            goto LABEL_22;
          }
          v70 = (void *)MEMORY[0x1E4F93B90];
          v37 = __atxlog_handle_blending_ecosystem();
          v36 = [v70 robustDecodeObjectOfClass:v36 forKey:@"context" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v37];

          if (!v36
            || ([v4 error], int v38 = objc_claimAutoreleasedReturnValue(), v38, v38))
          {
LABEL_22:
            char v10 = 0;
            v27 = v72;
LABEL_46:

            goto LABEL_47;
          }
          v68 = v32;
          v69 = v36;
        }
        else
        {
          v68 = v32;
          v69 = 0;
        }
        char v39 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v40 = objc_opt_class();
        v41 = __atxlog_handle_blending_ecosystem();
        uint64_t v42 = [v39 robustDecodeObjectOfClass:v40 forKey:@"uiEngagementType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v41];

        v71 = (void *)v42;
        if (v42
          && ([v4 error], v43 = objc_claimAutoreleasedReturnValue(), v43, !v43))
        {
          v44 = (void *)MEMORY[0x1B3E6F520]();
          id v45 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v46 = objc_opt_class();
          v47 = objc_msgSend(v45, "initWithObjects:", v46, objc_opt_class(), 0);
          v48 = (void *)MEMORY[0x1E4F93B90];
          v49 = __atxlog_handle_blending_ecosystem();
          v50 = [v48 robustDecodeObjectOfClasses:v47 forKey:@"engaged" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v49];

          if (v50
            && ([v4 error], v51 = objc_claimAutoreleasedReturnValue(), v51, !v51))
          {
            v52 = (void *)MEMORY[0x1E4F93B90];
            v53 = __atxlog_handle_blending_ecosystem();
            uint64_t v54 = [v52 robustDecodeObjectOfClasses:v47 forKey:@"shown" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v53];

            v67 = (void *)v54;
            if (v54
              && ([v4 error], v55 = objc_claimAutoreleasedReturnValue(), v55, !v55))
            {
              v56 = (void *)MEMORY[0x1E4F93B90];
              v57 = __atxlog_handle_blending_ecosystem();
              uint64_t v58 = [v56 robustDecodeObjectOfClasses:v47 forKey:@"dismissed" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v57];

              v59 = (void *)v58;
              if (v58
                && ([v4 error], v60 = objc_claimAutoreleasedReturnValue(),
                                               v60,
                                               !v60))
              {
                v66 = (void *)MEMORY[0x1E4F93B90];
                uint64_t v61 = objc_opt_class();
                v62 = __atxlog_handle_blending_ecosystem();
                uint64_t v63 = [v66 robustDecodeObjectOfClass:v61 forKey:@"session" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult" errorCode:-1 logHandle:v62];

                v64 = (void *)v63;
                if (v63
                  && ([v4 error],
                      v65 = objc_claimAutoreleasedReturnValue(),
                      v65,
                      !v65))
                {
                  self = -[ATXProactiveSuggestionUIFeedbackResult initWithEngagementType:shownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:](self, "initWithEngagementType:shownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:", [v71 integerValue], v67, v50, v59, v64, v13, v73, v72, v69);
                  char v10 = self;
                }
                else
                {
                  char v10 = 0;
                }
              }
              else
              {
                char v10 = 0;
              }
            }
            else
            {
              char v10 = 0;
            }
          }
          else
          {
            char v10 = 0;
          }

          id v22 = v73;
        }
        else
        {
          char v10 = 0;
        }
        v27 = v72;
        v36 = v69;

        int v32 = v68;
        goto LABEL_46;
      }
    }
  }
  char v10 = 0;
LABEL_4:

  return v10;
}

- (id)description
{
  id v24 = (void *)MEMORY[0x1B3E6F520](self, a2);
  id v20 = [NSString alloc];
  v3 = (objc_class *)objc_opt_class();
  id v19 = NSStringFromClass(v3);
  id v17 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", -[ATXProactiveSuggestionFeedbackResult consumerSubType](self, "consumerSubType"));
  int v26 = +[ATXProactiveSuggestionFeedbackTypes stringForUIFeedbackEngagementType:[(ATXProactiveSuggestionUIFeedbackResult *)self engagementType]];
  id v23 = [(ATXProactiveSuggestionUIFeedbackResult *)self session];
  uint64_t v25 = [v23 sessionStartDate];
  id v22 = [(ATXProactiveSuggestionUIFeedbackResult *)self session];
  id v14 = [v22 sessionEndDate];
  id v18 = [(ATXProactiveSuggestionUIFeedbackResult *)self engagedSuggestions];
  id v4 = [(ATXProactiveSuggestionUIFeedbackResult *)self suggestionExecutableObjectListFromSuggestions:v18];
  v16 = [(ATXProactiveSuggestionUIFeedbackResult *)self rejectedSuggestions];
  uint64_t v13 = [(ATXProactiveSuggestionUIFeedbackResult *)self suggestionExecutableObjectListFromSuggestions:v16];
  uint64_t v15 = [(ATXProactiveSuggestionUIFeedbackResult *)self shownSuggestions];
  uint64_t v5 = [(ATXProactiveSuggestionUIFeedbackResult *)self suggestionExecutableObjectListFromSuggestions:v15];
  uint64_t v6 = [(ATXProactiveSuggestionFeedbackResult *)self clientCacheUpdate];
  unint64_t v7 = [v6 clientModelId];
  unint64_t v8 = [(ATXProactiveSuggestionUIFeedbackResult *)self session];
  v9 = [v8 blendingUICacheUpdateUUID];
  char v10 = [(ATXProactiveSuggestionUIFeedbackResult *)self session];
  uint64_t v11 = [v10 sessionMetadata];
  id v21 = (void *)[v20 initWithFormat:@"%@: %@ - %@ \nsession start: %@, session end: %@ \nengaged suggestions: %@ \nrejected suggestions: %@ \nshown suggestions: %@ \nclient model id: %@ \nblending cache uuid: %@ \nmetadata: %@", v19, v17, v26, v25, v14, v4, v13, v5, v7, v9, v11];

  return v21;
}

- (id)suggestionExecutableObjectListFromSuggestions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1B3E6F520](v6);
        uint64_t v12 = objc_msgSend(v10, "executableSpecification", (void)v16);
        uint64_t v13 = [v12 executableIdentifier];
        [v4 addObject:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  id v14 = [v4 componentsJoinedByString:@","];

  return v14;
}

- (int64_t)engagementType
{
  return self->_engagementType;
}

- (NSArray)shownSuggestions
{
  return self->_shownSuggestions;
}

- (NSArray)engagedSuggestions
{
  return self->_engagedSuggestions;
}

- (NSArray)rejectedSuggestions
{
  return self->_rejectedSuggestions;
}

- (ATXProactiveSuggestionUIFeedbackSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestions, 0);
  objc_storeStrong((id *)&self->_shownSuggestions, 0);
}

@end