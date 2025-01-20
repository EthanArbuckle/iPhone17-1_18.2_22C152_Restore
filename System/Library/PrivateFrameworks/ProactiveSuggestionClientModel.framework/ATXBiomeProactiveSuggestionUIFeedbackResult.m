@interface ATXBiomeProactiveSuggestionUIFeedbackResult
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProactiveSuggestionUIFeedbackResult:(id)a3;
- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProto:(id)a3;
- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProtoData:(id)a3;
- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithSessionId:(id)a3 blendingUICacheUpdateUUID:(id)a4 clientModelId:(id)a5 clientModelCacheCreationDate:(id)a6 consumerSubType:(unsigned __int8)a7 sessionStartDate:(id)a8 sessionEndDate:(id)a9 shownSuggestions:(id)a10 engagedSuggestions:(id)a11 rejectedSuggestions:(id)a12;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXBiomeProactiveSuggestionUIFeedbackResult:(id)a3;
- (NSArray)engagedSuggestions;
- (NSArray)rejectedSuggestions;
- (NSArray)shownSuggestions;
- (NSDate)clientModelCacheCreationDate;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartDate;
- (NSString)clientModelId;
- (NSString)description;
- (NSString)sessionId;
- (NSUUID)blendingUICacheUpdateUUID;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int64_t)suggestionExecutableType;
- (unsigned)consumerSubType;
- (unsigned)dataVersion;
@end

@implementation ATXBiomeProactiveSuggestionUIFeedbackResult

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProactiveSuggestionUIFeedbackResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 session];
  uint64_t v6 = [v5 blendingUICacheUpdateUUID];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v4 session];
    uint64_t v9 = [v8 sessionStartDate];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [v4 session];
      v12 = [v11 sessionEndDate];
      if (v12)
      {
        v13 = [v4 shownSuggestions];
        uint64_t v14 = [v13 count];

        if (!v14)
        {
          v12 = 0;
          goto LABEL_11;
        }
        v5 = [v4 session];
        v7 = [v5 sessionIdentifier];
        v8 = [v4 session];
        v10 = [v8 blendingUICacheUpdateUUID];
        v11 = [v4 clientCacheUpdate];
        v29 = [v11 clientModelId];
        v25 = [v4 clientCacheUpdate];
        v28 = [v25 cacheCreationDate];
        unsigned int v21 = [v4 consumerSubType];
        v24 = [v4 session];
        v27 = [v24 sessionStartDate];
        v23 = [v4 session];
        v26 = [v23 sessionEndDate];
        v22 = [v4 shownSuggestions];
        v19 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:v22];
        v20 = [v4 engagedSuggestions];
        v15 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:v20];
        v16 = [v4 rejectedSuggestions];
        v17 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:v16];
        self = [(ATXBiomeProactiveSuggestionUIFeedbackResult *)self initWithSessionId:v7 blendingUICacheUpdateUUID:v10 clientModelId:v29 clientModelCacheCreationDate:v28 consumerSubType:v21 sessionStartDate:v27 sessionEndDate:v26 shownSuggestions:v19 engagedSuggestions:v15 rejectedSuggestions:v17];

        v12 = self;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

LABEL_11:
  return v12;
}

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithSessionId:(id)a3 blendingUICacheUpdateUUID:(id)a4 clientModelId:(id)a5 clientModelCacheCreationDate:(id)a6 consumerSubType:(unsigned __int8)a7 sessionStartDate:(id)a8 sessionEndDate:(id)a9 shownSuggestions:(id)a10 engagedSuggestions:(id)a11 rejectedSuggestions:(id)a12
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a8;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  id v18 = a12;
  v31.receiver = self;
  v31.super_class = (Class)ATXBiomeProactiveSuggestionUIFeedbackResult;
  v19 = [(ATXBiomeProactiveSuggestionUIFeedbackResult *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionId, a3);
    objc_storeStrong((id *)&v20->_blendingUICacheUpdateUUID, a4);
    objc_storeStrong((id *)&v20->_clientModelId, a5);
    objc_storeStrong((id *)&v20->_clientModelCacheCreationDate, a6);
    v20->_consumerSubType = a7;
    objc_storeStrong((id *)&v20->_sessionStartDate, a8);
    objc_storeStrong((id *)&v20->_sessionEndDate, a9);
    objc_storeStrong((id *)&v20->_shownSuggestions, a10);
    objc_storeStrong((id *)&v20->_engagedSuggestions, a11);
    objc_storeStrong((id *)&v20->_rejectedSuggestions, a12);
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (NSString)description
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"sessionId: %@\n", self->_sessionId];
  id v4 = [(NSUUID *)self->_blendingUICacheUpdateUUID UUIDString];
  [v3 appendFormat:@"blendingUICacheUpdateUUID: %@\n", v4];

  [v3 appendFormat:@"clientModelId: %@\n", self->_clientModelId];
  [v3 appendFormat:@"clientModelCacheCreationDate: %@\n", self->_clientModelCacheCreationDate];
  id v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  [v3 appendFormat:@"consumerSubType: %@\n", v5];

  [v3 appendFormat:@"sessionStartDate: %@\n", self->_sessionStartDate];
  [v3 appendFormat:@"sessionEndDate: %@\n", self->_sessionEndDate];
  [v3 appendFormat:@"shownSuggestions: %@\n", self->_shownSuggestions];
  [v3 appendFormat:@"engagedSuggestions: %@\n", self->_engagedSuggestions];
  [v3 appendFormat:@"rejectedSuggestions: %@\n", self->_rejectedSuggestions];
  uint64_t v6 = (void *)[v3 copy];

  return (NSString *)v6;
}

- (id)jsonDict
{
  v26[10] = *MEMORY[0x1E4F143B8];
  sessionId = (__CFString *)self->_sessionId;
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  if (!sessionId) {
    sessionId = @"nil";
  }
  v26[0] = sessionId;
  v25[0] = @"sessionId";
  v25[1] = @"blendingUICacheUpdateUUID";
  uint64_t v5 = [(NSUUID *)blendingUICacheUpdateUUID UUIDString];
  uint64_t v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"nil";
  }
  clientModelId = (__CFString *)self->_clientModelId;
  clientModelCacheCreationDate = self->_clientModelCacheCreationDate;
  if (!clientModelId) {
    clientModelId = @"nil";
  }
  v26[1] = v7;
  v26[2] = clientModelId;
  v25[2] = @"clientModelId";
  v25[3] = @"clientModelCacheCreationDate";
  uint64_t v10 = [(NSDate *)clientModelCacheCreationDate description];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"nil";
  }
  v26[3] = v12;
  v25[4] = @"consumerSubType";
  v13 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  v26[4] = v13;
  v25[5] = @"sessionStartDate";
  uint64_t v14 = [(NSDate *)self->_sessionStartDate description];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"nil";
  }
  v26[5] = v16;
  v25[6] = @"sessionEndDate";
  uint64_t v17 = [(NSDate *)self->_sessionEndDate description];
  id v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"nil";
  }
  v26[6] = v19;
  v25[7] = @"shownSuggestions";
  v20 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:self->_shownSuggestions];
  v26[7] = v20;
  v25[8] = @"engagedSuggestions";
  unsigned int v21 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:self->_engagedSuggestions];
  v26[8] = v21;
  v25[9] = @"rejectedSuggestions";
  v22 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:self->_rejectedSuggestions];
  v26[9] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];

  return v23;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXBiomeProactiveSuggestionUIFeedbackResult *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXBiomeProactiveSuggestionUIFeedbackResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXBiomeProactiveSuggestionUIFeedbackResult *)self isEqualToATXBiomeProactiveSuggestionUIFeedbackResult:v5];

  return v6;
}

- (BOOL)isEqualToATXBiomeProactiveSuggestionUIFeedbackResult:(id)a3
{
  id v4 = (id *)a3;
  sessionId = self->_sessionId;
  BOOL v6 = (NSString *)v4[2];
  if (sessionId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = sessionId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_32;
    }
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  v11 = (NSUUID *)v4[3];
  if (blendingUICacheUpdateUUID == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = blendingUICacheUpdateUUID;
    char v14 = [(NSUUID *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
  }
  clientModelId = self->_clientModelId;
  v16 = (NSString *)v4[4];
  if (clientModelId == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    id v18 = clientModelId;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_32;
    }
  }
  clientModelCacheCreationDate = self->_clientModelCacheCreationDate;
  unsigned int v21 = (NSDate *)v4[5];
  if (clientModelCacheCreationDate == v21)
  {
  }
  else
  {
    v22 = v21;
    id v23 = clientModelCacheCreationDate;
    char v24 = [(NSDate *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_32;
    }
  }
  if (self->_consumerSubType != *((unsigned __int8 *)v4 + 8))
  {
LABEL_32:
    char v45 = 0;
    goto LABEL_33;
  }
  sessionStartDate = self->_sessionStartDate;
  id v26 = (NSDate *)v4[6];
  if (sessionStartDate == v26)
  {
  }
  else
  {
    id v27 = v26;
    id v28 = sessionStartDate;
    char v29 = [(NSDate *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_32;
    }
  }
  sessionEndDate = self->_sessionEndDate;
  objc_super v31 = (NSDate *)v4[7];
  if (sessionEndDate == v31)
  {
  }
  else
  {
    v32 = v31;
    v33 = sessionEndDate;
    char v34 = [(NSDate *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_32;
    }
  }
  shownSuggestions = self->_shownSuggestions;
  v36 = (NSArray *)v4[8];
  if (shownSuggestions == v36)
  {
  }
  else
  {
    v37 = v36;
    v38 = shownSuggestions;
    char v39 = [(NSArray *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_32;
    }
  }
  engagedSuggestions = self->_engagedSuggestions;
  v41 = (NSArray *)v4[9];
  if (engagedSuggestions == v41)
  {
  }
  else
  {
    v42 = v41;
    v43 = engagedSuggestions;
    char v44 = [(NSArray *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_32;
    }
  }
  v47 = self->_rejectedSuggestions;
  v48 = v47;
  if (v47 == v4[10]) {
    char v45 = 1;
  }
  else {
    char v45 = -[NSArray isEqual:](v47, "isEqual:");
  }

LABEL_33:
  return v45;
}

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[ATXPBBiomeProactiveSuggestionUIFeedbackResult alloc] initWithData:v4];

    self = [(ATXBiomeProactiveSuggestionUIFeedbackResult *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXBiomeProactiveSuggestionUIFeedbackResult *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v16);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  id v28 = [v5 sessionId];
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  id v27 = [v5 blendingUICacheUpdateUUID];
  id v25 = (void *)[v6 initWithUUIDString:v27];
  char v24 = [v5 clientModelId];
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 clientModelCacheCreationDate];
  id v23 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (void *)MEMORY[0x1E4F4B680];
  id v26 = [v5 consumerSubType];
  unsigned int v22 = [v8 consumerSubtypeForString:v26 found:0];
  char v9 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 sessionStartDate];
  v20 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 sessionEndDate];
  char v19 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  unsigned int v21 = [v5 shownSuggestions];
  id v18 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:v21];
  v11 = [v5 engagedSuggestions];
  v12 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:v11];
  v13 = [v5 rejectedSuggestions];

  char v14 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:v13];
  self = [(ATXBiomeProactiveSuggestionUIFeedbackResult *)self initWithSessionId:v28 blendingUICacheUpdateUUID:v25 clientModelId:v24 clientModelCacheCreationDate:v23 consumerSubType:v22 sessionStartDate:v20 sessionEndDate:v19 shownSuggestions:v18 engagedSuggestions:v12 rejectedSuggestions:v14];

  v15 = self;
LABEL_8:

  return v15;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setSessionId:self->_sessionId];
  id v4 = [(NSUUID *)self->_blendingUICacheUpdateUUID UUIDString];
  [v3 setBlendingUICacheUpdateUUID:v4];

  [v3 setClientModelId:self->_clientModelId];
  [(NSDate *)self->_clientModelCacheCreationDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setClientModelCacheCreationDate:");
  id v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  [v3 setConsumerSubType:v5];

  [(NSDate *)self->_sessionStartDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setSessionStartDate:");
  [(NSDate *)self->_sessionEndDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setSessionEndDate:");
  id v6 = +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:self->_shownSuggestions];
  v7 = (void *)[v6 copy];
  [v3 setShownSuggestions:v7];

  v8 = +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:self->_engagedSuggestions];
  char v9 = (void *)[v8 copy];
  [v3 setEngagedSuggestions:v9];

  uint64_t v10 = +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:self->_rejectedSuggestions];
  v11 = (void *)[v10 copy];
  [v3 setRejectedSuggestions:v11];

  return v3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSUUID)blendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSDate)clientModelCacheCreationDate
{
  return self->_clientModelCacheCreationDate;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
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

- (int64_t)suggestionExecutableType
{
  return self->_suggestionExecutableType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestions, 0);
  objc_storeStrong((id *)&self->_shownSuggestions, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_clientModelCacheCreationDate, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end