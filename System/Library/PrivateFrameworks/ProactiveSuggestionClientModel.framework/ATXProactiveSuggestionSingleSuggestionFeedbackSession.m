@interface ATXProactiveSuggestionSingleSuggestionFeedbackSession
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestion)suggestion;
- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithCoder:(id)a3;
- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithProactiveSuggestion:(id)a3 clientModelCacheUUID:(id)a4 feedbackMetadata:(id)a5;
- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithProactiveSuggestion:(id)a3 feedbackMetadata:(id)a4 matchingSuggestionUUIDs:(id)a5 associatedBlendingCacheUUIDs:(id)a6 associatedClientModelCacheUUIDs:(id)a7 sessionContextStatuses:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionSingleSuggestionFeedbackSession:(id)a3;
- (BOOL)tryUpdateEngagementType:(int64_t)a3 consumerSubType:(unsigned __int8)a4;
- (NSData)feedbackMetadata;
- (NSMutableDictionary)sessionContextStatusByConsumerSubType;
- (NSMutableOrderedSet)associatedBlendingCacheUUIDs;
- (NSMutableOrderedSet)associatedClientModelCacheUUIDs;
- (NSMutableOrderedSet)matchingSuggestionUUIDs;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock:(id)a3;
@end

@implementation ATXProactiveSuggestionSingleSuggestionFeedbackSession

- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithProactiveSuggestion:(id)a3 clientModelCacheUUID:(id)a4 feedbackMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v13 = [v10 uuid];
  [v11 addObject:v13];

  [v12 addObject:v9];
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = [(ATXProactiveSuggestionSingleSuggestionFeedbackSession *)self initWithProactiveSuggestion:v10 feedbackMetadata:v8 matchingSuggestionUUIDs:v11 associatedBlendingCacheUUIDs:v14 associatedClientModelCacheUUIDs:v12 sessionContextStatuses:v15];

  return v16;
}

- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithProactiveSuggestion:(id)a3 feedbackMetadata:(id)a4 matchingSuggestionUUIDs:(id)a5 associatedBlendingCacheUUIDs:(id)a6 associatedClientModelCacheUUIDs:(id)a7 sessionContextStatuses:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ATXProactiveSuggestionSingleSuggestionFeedbackSession;
  v18 = [(ATXProactiveSuggestionSingleSuggestionFeedbackSession *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestion, a3);
    objc_storeStrong((id *)&v19->_feedbackMetadata, a4);
    objc_storeStrong((id *)&v19->_matchingSuggestionUUIDs, a5);
    objc_storeStrong((id *)&v19->_associatedBlendingCacheUUIDs, a6);
    objc_storeStrong((id *)&v19->_associatedClientModelCacheUUIDs, a7);
    objc_storeStrong((id *)&v19->_sessionContextStatusByConsumerSubType, a8);
  }

  return v19;
}

- (BOOL)tryUpdateEngagementType:(int64_t)a3 consumerSubType:(unsigned __int8)a4
{
  v6 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a4];
  v7 = [(NSMutableDictionary *)self->_sessionContextStatusByConsumerSubType objectForKey:v6];
  id v8 = v7;
  if (v7) {
    v7 = (void *)[v7 integerValue];
  }
  if (a3 >= 1 && !v7 || (BOOL v9 = 0, a3 > 1) && v7 == (void *)1)
  {
    sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
    v11 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)sessionContextStatusByConsumerSubType setObject:v11 forKey:v6];

    BOOL v9 = 1;
  }

  return v9;
}

- (void)enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock:(id)a3
{
  id v4 = a3;
  sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __125__ATXProactiveSuggestionSingleSuggestionFeedbackSession_enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock___block_invoke;
  v7[3] = &unk_1E5F01640;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sessionContextStatusByConsumerSubType enumerateKeysAndObjectsUsingBlock:v7];
}

void __125__ATXProactiveSuggestionSingleSuggestionFeedbackSession_enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([MEMORY[0x1E4F4B680] consumerSubtypeForString:a2 found:0])
  {
    [v5 integerValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  suggestion = self->_suggestion;
  id v5 = a3;
  [v5 encodeObject:suggestion forKey:@"suggestion"];
  [v5 encodeObject:self->_feedbackMetadata forKey:@"feedbackMetadata"];
  [v5 encodeObject:self->_matchingSuggestionUUIDs forKey:@"matchingSuggestionUUIDs"];
  [v5 encodeObject:self->_associatedBlendingCacheUUIDs forKey:@"blendingUUIDs"];
  [v5 encodeObject:self->_associatedClientModelCacheUUIDs forKey:@"clientUUIDs"];
  [v5 encodeObject:self->_sessionContextStatusByConsumerSubType forKey:@"sessionStatuses"];
}

- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_metrics();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"suggestion" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], BOOL v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_metrics();
    uint64_t v49 = [v11 robustDecodeObjectOfClass:v12 forKey:@"feedbackMetadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession" errorCode:-1 logHandle:v13];

    v14 = (void *)MEMORY[0x1E4F93B90];
    id v15 = (void *)MEMORY[0x1B3E6F520]();
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    v19 = __atxlog_handle_metrics();
    v20 = [v14 robustDecodeObjectOfClasses:v18 forKey:@"matchingSuggestionUUIDs" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession" errorCode:-1 logHandle:v19];

    if (v20 && ([v4 error], id v21 = objc_claimAutoreleasedReturnValue(), v21, !v21))
    {
      id v23 = (void *)MEMORY[0x1E4F93B90];
      objc_super v24 = (void *)MEMORY[0x1B3E6F520]();
      id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v26 = objc_opt_class();
      v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
      v28 = __atxlog_handle_metrics();
      v29 = [v23 robustDecodeObjectOfClasses:v27 forKey:@"blendingUUIDs" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession" errorCode:-1 logHandle:v28];

      if (v29
        && ([v4 error], v30 = objc_claimAutoreleasedReturnValue(), v30, !v30))
      {
        context = (void *)MEMORY[0x1E4F93B90];
        v31 = (void *)MEMORY[0x1B3E6F520]();
        id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v33 = objc_opt_class();
        v34 = objc_msgSend(v32, "initWithObjects:", v33, objc_opt_class(), 0);
        v35 = __atxlog_handle_metrics();
        v36 = [context robustDecodeObjectOfClasses:v34 forKey:@"clientUUIDs" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession" errorCode:-1 logHandle:v35];

        if (v36
          && ([v4 error], v37 = objc_claimAutoreleasedReturnValue(), v37, !v37))
        {
          v38 = (void *)MEMORY[0x1E4F93B90];
          contexta = (void *)MEMORY[0x1B3E6F520]();
          id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v40 = objc_opt_class();
          uint64_t v41 = objc_opt_class();
          v42 = objc_msgSend(v39, "initWithObjects:", v40, v41, objc_opt_class(), 0);
          v43 = __atxlog_handle_metrics();
          v44 = [v38 robustDecodeObjectOfClasses:v42 forKey:@"sessionStatuses" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession" errorCode:-1 logHandle:v43];

          if (v44
            && ([v4 error], v45 = objc_claimAutoreleasedReturnValue(), v45, !v45))
          {
            id v22 = (void *)v49;
            self = [(ATXProactiveSuggestionSingleSuggestionFeedbackSession *)self initWithProactiveSuggestion:v8 feedbackMetadata:v49 matchingSuggestionUUIDs:v20 associatedBlendingCacheUUIDs:v29 associatedClientModelCacheUUIDs:v36 sessionContextStatuses:v44];
            id v10 = self;
          }
          else
          {
            id v10 = 0;
            id v22 = (void *)v49;
          }
        }
        else
        {
          id v10 = 0;
          id v22 = (void *)v49;
        }
      }
      else
      {
        id v10 = 0;
        id v22 = (void *)v49;
      }
    }
    else
    {
      id v10 = 0;
      id v22 = (void *)v49;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXProactiveSuggestionSingleSuggestionFeedbackSession *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionSingleSuggestionFeedbackSession *)self isEqualToATXProactiveSuggestionSingleSuggestionFeedbackSession:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionSingleSuggestionFeedbackSession:(id)a3
{
  id v4 = (id *)a3;
  suggestion = self->_suggestion;
  BOOL v6 = (ATXProactiveSuggestion *)v4[1];
  if (suggestion == v6)
  {
  }
  else
  {
    v7 = v6;
    id v8 = suggestion;
    BOOL v9 = [(ATXProactiveSuggestion *)v8 isEqual:v7];

    if (!v9) {
      goto LABEL_19;
    }
  }
  feedbackMetadata = self->_feedbackMetadata;
  v11 = (NSData *)v4[2];
  if (feedbackMetadata == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    v13 = feedbackMetadata;
    char v14 = [(NSData *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_19;
    }
  }
  matchingSuggestionUUIDs = self->_matchingSuggestionUUIDs;
  id v16 = (NSMutableOrderedSet *)v4[3];
  if (matchingSuggestionUUIDs == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    v18 = matchingSuggestionUUIDs;
    char v19 = [(NSMutableOrderedSet *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_19;
    }
  }
  associatedBlendingCacheUUIDs = self->_associatedBlendingCacheUUIDs;
  id v21 = (NSMutableOrderedSet *)v4[5];
  if (associatedBlendingCacheUUIDs == v21)
  {
  }
  else
  {
    id v22 = v21;
    id v23 = associatedBlendingCacheUUIDs;
    char v24 = [(NSMutableOrderedSet *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
  }
  associatedClientModelCacheUUIDs = self->_associatedClientModelCacheUUIDs;
  uint64_t v26 = (NSMutableOrderedSet *)v4[4];
  if (associatedClientModelCacheUUIDs == v26)
  {
  }
  else
  {
    v27 = v26;
    v28 = associatedClientModelCacheUUIDs;
    char v29 = [(NSMutableOrderedSet *)v28 isEqual:v27];

    if ((v29 & 1) == 0)
    {
LABEL_19:
      char v30 = 0;
      goto LABEL_20;
    }
  }
  id v32 = self->_sessionContextStatusByConsumerSubType;
  uint64_t v33 = v32;
  if (v32 == v4[6]) {
    char v30 = 1;
  }
  else {
    char v30 = -[NSMutableDictionary isEqual:](v32, "isEqual:");
  }

LABEL_20:
  return v30;
}

- (unint64_t)hash
{
  int64_t v2 = (char *)self->_feedbackMetadata - (char *)self->_suggestion + 32 * (uint64_t)self->_suggestion;
  v3 = (char *)&self->_matchingSuggestionUUIDs[4 * v2] - v2;
  int64_t v4 = (char *)self->_associatedBlendingCacheUUIDs - v3 + 32 * (void)v3;
  int64_t v5 = (int64_t)&self->_associatedClientModelCacheUUIDs[4 * v4] - v4;
  return (unint64_t)&self->_sessionContextStatusByConsumerSubType[4 * v5] - v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t v4 = [(ATXProactiveSuggestion *)self->_suggestion uuid];
  int64_t v5 = [(ATXProactiveSuggestion *)self->_suggestion clientModelSpecification];
  BOOL v6 = [v5 clientModelId];
  v7 = (void *)[v3 initWithFormat:@"uuid: %@, clientModelId: %@, statuses: %@, suggestionUUIDs: %@, blendingUUIDs: %@, clientUUIDs: %@", v4, v6, self->_sessionContextStatusByConsumerSubType, self->_matchingSuggestionUUIDs, self->_associatedBlendingCacheUUIDs, self->_associatedClientModelCacheUUIDs];

  return v7;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (NSMutableOrderedSet)matchingSuggestionUUIDs
{
  return self->_matchingSuggestionUUIDs;
}

- (NSMutableOrderedSet)associatedClientModelCacheUUIDs
{
  return self->_associatedClientModelCacheUUIDs;
}

- (NSMutableOrderedSet)associatedBlendingCacheUUIDs
{
  return self->_associatedBlendingCacheUUIDs;
}

- (NSMutableDictionary)sessionContextStatusByConsumerSubType
{
  return self->_sessionContextStatusByConsumerSubType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContextStatusByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_associatedBlendingCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_associatedClientModelCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_matchingSuggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end