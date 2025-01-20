@interface ATXClientModelCacheUpdate
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 feedbackMetadata:(id)a5 responseForRealTimeRequest:(id)a6;
- (ATXClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 feedbackMetadata:(id)a5 responseForRealTimeRequest:(id)a6 uuid:(id)a7 cacheCreationDate:(id)a8;
- (ATXClientModelCacheUpdate)initWithCoder:(id)a3;
- (ATXClientModelCacheUpdate)initWithProto:(id)a3;
- (ATXClientModelCacheUpdate)initWithProtoData:(id)a3;
- (ATXSuggestionRequestResponse)suggestionRequestResponse;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXClientModelCacheUpdate:(id)a3;
- (NSArray)suggestions;
- (NSData)feedbackMetadata;
- (NSDate)cacheCreationDate;
- (NSString)clientModelId;
- (NSUUID)uuid;
- (id)_clientModelFromClientModelId:(id)a3 suggestions:(id)a4;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setFeedbackMetadata:(id)a3;
@end

@implementation ATXClientModelCacheUpdate

- (ATXClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 feedbackMetadata:(id)a5 responseForRealTimeRequest:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = [(ATXClientModelCacheUpdate *)self initWithClientModelId:v13 suggestions:v12 feedbackMetadata:v11 responseForRealTimeRequest:v10 uuid:v14 cacheCreationDate:v15];

  return v16;
}

- (ATXClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 feedbackMetadata:(id)a5 responseForRealTimeRequest:(id)a6 uuid:(id)a7 cacheCreationDate:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)ATXClientModelCacheUpdate;
  v19 = [(ATXClientModelCacheUpdate *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_suggestions, a4);
    objc_storeStrong((id *)&v20->_feedbackMetadata, a5);
    objc_storeStrong((id *)&v20->_uuid, a7);
    objc_storeStrong((id *)&v20->_clientModelId, a3);
    objc_msgSend(v18, "timeIntervalSince1970", v23, v24);
    v20->_absoluteCacheCreationDate = v21;
    objc_storeStrong((id *)&v20->_suggestionRequestResponse, a6);
  }

  return v20;
}

- (NSDate)cacheCreationDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteCacheCreationDate];
  return (NSDate *)v2;
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
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(ATXClientModelCacheUpdate *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXClientModelCacheUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXClientModelCacheUpdate *)self initWithProtoData:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXClientModelCacheUpdate *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXClientModelCacheUpdate *)self isEqualToATXClientModelCacheUpdate:v5];

  return v6;
}

- (BOOL)isEqualToATXClientModelCacheUpdate:(id)a3
{
  id v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSUUID *)v4[2];
  if (uuid == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = uuid;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_19;
    }
  }
  suggestions = self->_suggestions;
  id v11 = (NSArray *)v4[4];
  if (suggestions == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = suggestions;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_19;
    }
  }
  feedbackMetadata = self->_feedbackMetadata;
  id v16 = (NSData *)v4[5];
  if (feedbackMetadata == v16)
  {
  }
  else
  {
    id v17 = v16;
    id v18 = feedbackMetadata;
    char v19 = [(NSData *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_19;
    }
  }
  clientModelId = self->_clientModelId;
  uint64_t v21 = (NSString *)v4[3];
  if (clientModelId == v21)
  {
  }
  else
  {
    v22 = v21;
    id v23 = clientModelId;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
  }
  suggestionRequestResponse = self->_suggestionRequestResponse;
  v26 = (ATXSuggestionRequestResponse *)v4[6];
  if (suggestionRequestResponse == v26)
  {

    goto LABEL_22;
  }
  v27 = v26;
  v28 = suggestionRequestResponse;
  BOOL v29 = [(ATXSuggestionRequestResponse *)v28 isEqual:v27];

  if (v29)
  {
LABEL_22:
    BOOL v30 = self->_absoluteCacheCreationDate == *((double *)v4 + 1);
    goto LABEL_20;
  }
LABEL_19:
  BOOL v30 = 0;
LABEL_20:

  return v30;
}

- (id)encodeAsProto
{
  v2 = [(ATXClientModelCacheUpdate *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXClientModelCacheUpdate)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBClientModelCacheUpdate alloc] initWithData:v4];

    self = [(ATXClientModelCacheUpdate *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (ATXClientModelCacheUpdate)initWithProto:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_blending();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v5);
      }
      v26 = 0;
      goto LABEL_29;
    }
    id v5 = v4;
    if ([v5 hasUuidString])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F29128]);
      v7 = [v5 uuidString];
      v8 = [v6 initWithUUIDString:v7];

      if (v8)
      {
        v28 = v8;
        id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v10 = [v5 suggestions];
        id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v12 = [v5 suggestions];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = [[ATXProactiveSuggestion alloc] initWithProto:*(void *)(*((void *)&v29 + 1) + 8 * i)];
              if (!v17)
              {
                v20 = __atxlog_handle_blending();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
                  -[ATXClientModelCacheUpdate initWithProto:](v20);
                }
                v26 = 0;
                v8 = v28;
                goto LABEL_27;
              }
              id v18 = v17;
              [v11 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v12 = [v5 feedbackMetadata];
        char v19 = [v5 clientModelId];
        v20 = [(ATXClientModelCacheUpdate *)self _clientModelFromClientModelId:v19 suggestions:v11];

        id v21 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v5 cacheCreationDate];
        v22 = objc_msgSend(v21, "initWithTimeIntervalSince1970:");
        if ([v5 hasResponseForRequestForSuggestions])
        {
          id v23 = [ATXSuggestionRequestResponse alloc];
          char v24 = [v5 responseForRequestForSuggestions];
          objc_super v25 = [(ATXSuggestionRequestResponse *)v23 initWithProto:v24];
        }
        else
        {
          objc_super v25 = 0;
        }
        v8 = v28;
        self = [(ATXClientModelCacheUpdate *)self initWithClientModelId:v20 suggestions:v11 feedbackMetadata:v12 responseForRealTimeRequest:v25 uuid:v28 cacheCreationDate:v22];

        v26 = self;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      v8 = __atxlog_handle_blending();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXClientModelCacheUpdate initWithProto:](v8);
      }
    }
    v26 = 0;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  v26 = 0;
LABEL_30:

  return v26;
}

- (id)proto
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuidString:v4];

  if (([v3 hasUuidString] & 1) == 0)
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXClientModelCacheUpdate *)v3 proto];
    }
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_suggestions, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = self->_suggestions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 proto];
        if (v13)
        {
          uint64_t v14 = [v12 proto];
          [v6 addObject:v14];
        }
        else
        {
          uint64_t v14 = __atxlog_handle_blending();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            [(ATXClientModelCacheUpdate *)&v17 proto];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  [v3 setSuggestions:v6];
  [v3 setFeedbackMetadata:self->_feedbackMetadata];
  [v3 setClientModelId:self->_clientModelId];
  [v3 setCacheCreationDate:self->_absoluteCacheCreationDate];
  uint64_t v15 = [(ATXSuggestionRequestResponse *)self->_suggestionRequestResponse proto];
  [v3 setResponseForRequestForSuggestions:v15];

  return v3;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)MEMORY[0x1B3E6F520]();
    id v12 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:v6 error:&v12];
    id v9 = v12;
    id v10 = 0;
    if (!v9) {
      id v10 = v8;
    }
  }
  else
  {
    id v10 = (id)[objc_alloc((Class)a1) initWithProtoData:v6];
  }

  return v10;
}

- (id)jsonRawData
{
  v31[6] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v30[0] = @"clientModelId";
  uint64_t v4 = [(ATXClientModelCacheUpdate *)self clientModelId];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"nil";
  }
  v31[0] = v6;
  v30[1] = @"uuid";
  uint64_t v7 = [(NSUUID *)self->_uuid description];
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = @"nil";
  }
  v31[1] = v9;
  v31[2] = v3;
  v30[2] = @"suggestions";
  v30[3] = @"suggestion_count";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_suggestions, "count"));
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"nil";
  }
  v31[3] = v12;
  v30[4] = @"cacheCreationDate";
  uint64_t v13 = [(ATXClientModelCacheUpdate *)self cacheCreationDate];
  uint64_t v14 = [v13 description];
  uint64_t v15 = (void *)v14;
  v30[5] = @"responseForRequest";
  if (self->_suggestionRequestResponse) {
    id v16 = @"Was in response to a request";
  }
  else {
    id v16 = @"Not a real-time response";
  }
  v31[4] = v14;
  v31[5] = v16;
  uint8_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:6];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = self->_suggestions;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "jsonRawData", (void)v25);
        [v3 addObject:v23];
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v17;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXClientModelCacheUpdate *)self jsonRawData];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (id)_clientModelFromClientModelId:(id)a3 suggestions:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [a4 firstObject];
    id v9 = [v8 clientModelSpecification];
    id v7 = [v9 clientModelId];
  }
  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
}

- (ATXSuggestionRequestResponse)suggestionRequestResponse
{
  return self->_suggestionRequestResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionRequestResponse, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Attempting to decode ATXClientModelCacheUpdate from proto failed because the recovered PBCodable had an unrecoverable ATXProactiveSuggestion.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Attempting to decode ATXClientModelCacheUpdate from proto failed because the recovered PBCodable didn't have a uuidString.", v1, 2u);
}

- (void)proto
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 uuidString];
  id v6 = [*a2 UUIDString];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_FAULT, "Attempting to encode ATXClientModelCacheUpdate to proto failed because proto uuid: %@. Original uuid: %@", (uint8_t *)&v7, 0x16u);
}

@end