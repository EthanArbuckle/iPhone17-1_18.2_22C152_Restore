@interface ATXSuggestionRequestResponse
+ (BOOL)supportsSecureCoding;
- (ATXSuggestionRequest)originalRequest;
- (ATXSuggestionRequestResponse)initWithCoder:(id)a3;
- (ATXSuggestionRequestResponse)initWithProto:(id)a3;
- (ATXSuggestionRequestResponse)initWithProtoData:(id)a3;
- (ATXSuggestionRequestResponse)initWithSuggestions:(id)a3 feedbackMetadata:(id)a4 originalRequest:(id)a5 responseCode:(int)a6 error:(id)a7;
- (ATXSuggestionRequestResponse)initWithSuggestions:(id)a3 feedbackMetadata:(id)a4 originalRequest:(id)a5 responseCode:(int)a6 error:(id)a7 uuid:(id)a8;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)suggestions;
- (NSData)feedbackMetadata;
- (NSError)error;
- (NSUUID)uuid;
- (id)dataFromNSError:(id)a3;
- (id)encodeAsProto;
- (id)proto;
- (id)unarchivedNSErrorFromData:(id)a3;
- (int)responseCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSuggestionRequestResponse

- (ATXSuggestionRequestResponse)initWithSuggestions:(id)a3 feedbackMetadata:(id)a4 originalRequest:(id)a5 responseCode:(int)a6 error:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  v17 = [(ATXSuggestionRequestResponse *)self initWithSuggestions:v15 feedbackMetadata:v14 originalRequest:v13 responseCode:v7 error:v12 uuid:v16];

  return v17;
}

- (ATXSuggestionRequestResponse)initWithSuggestions:(id)a3 feedbackMetadata:(id)a4 originalRequest:(id)a5 responseCode:(int)a6 error:(id)a7 uuid:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXSuggestionRequestResponse;
  v18 = [(ATXSuggestionRequestResponse *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestions, a3);
    objc_storeStrong((id *)&v19->_feedbackMetadata, a4);
    objc_storeStrong((id *)&v19->_originalRequest, a5);
    v19->_responseCode = a6;
    objc_storeStrong((id *)&v19->_error, a7);
    uint64_t v20 = objc_opt_new();
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;
  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSuggestionRequestResponse *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSArray *)self->_suggestions count])
      {
        v6 = [(ATXSuggestionRequestResponse *)v5 suggestions];
        uint64_t v7 = [v6 count];

        if (v7)
        {
          suggestions = self->_suggestions;
          v9 = v5->_suggestions;
          if (suggestions == v9)
          {
          }
          else
          {
            v10 = v9;
            v11 = suggestions;
            char v12 = [(NSArray *)v11 isEqual:v10];

            if ((v12 & 1) == 0) {
              goto LABEL_22;
            }
          }
        }
      }
      feedbackMetadata = self->_feedbackMetadata;
      id v15 = v5->_feedbackMetadata;
      if (feedbackMetadata == v15)
      {
      }
      else
      {
        id v16 = v15;
        id v17 = feedbackMetadata;
        char v18 = [(NSData *)v17 isEqual:v16];

        if ((v18 & 1) == 0) {
          goto LABEL_22;
        }
      }
      originalRequest = self->_originalRequest;
      uint64_t v20 = v5->_originalRequest;
      if (originalRequest == v20)
      {
      }
      else
      {
        v21 = v20;
        v22 = originalRequest;
        BOOL v23 = [(ATXSuggestionRequest *)v22 isEqual:v21];

        if (!v23) {
          goto LABEL_22;
        }
      }
      if ([(ATXSuggestionRequestResponse *)v5 responseCode] == self->_responseCode)
      {
        v24 = self->_error;
        v25 = v24;
        if (v24 == v5->_error) {
          char v13 = 1;
        }
        else {
          char v13 = -[NSError isEqual:](v24, "isEqual:");
        }

        goto LABEL_25;
      }
LABEL_22:
      char v13 = 0;
LABEL_25:

      goto LABEL_26;
    }
    char v13 = 0;
  }
LABEL_26:

  return v13;
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
      char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  id v5 = [(ATXSuggestionRequestResponse *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSuggestionRequestResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXSuggestionRequestResponse *)self initWithProtoData:v5];
  return v6;
}

- (ATXSuggestionRequestResponse)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBResponseForRequestForSuggestions alloc] initWithData:v4];

    self = [(ATXSuggestionRequestResponse *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSuggestionRequestResponse)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXSuggestionRequestResponse initWithProto:]((uint64_t)self, v5);
      }
      id v12 = 0;
      goto LABEL_38;
    }
    id v5 = v4;
    v6 = [v5 uuidString];
    uint64_t v7 = [v5 suggestions];
    v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global);

    v9 = [v5 feedbackMetadata];
    uint64_t v10 = [v5 responseCode];
    if (v10 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = off_1E5F008D8[(int)v10];
    }
    id v13 = v11;
    if ([(__CFString *)v13 isEqualToString:@"Unknown"])
    {
      uint64_t v14 = 0;
    }
    else if ([(__CFString *)v13 isEqualToString:@"FallbackToCache"])
    {
      uint64_t v14 = 1;
    }
    else if ([(__CFString *)v13 isEqualToString:@"Success"])
    {
      uint64_t v14 = 2;
    }
    else if ([(__CFString *)v13 isEqualToString:@"Error"])
    {
      uint64_t v14 = 3;
    }
    else if ([(__CFString *)v13 isEqualToString:@"SuccessAndReplaceCache"])
    {
      uint64_t v14 = 4;
    }
    else if ([(__CFString *)v13 isEqualToString:@"Max"])
    {
      uint64_t v14 = 5;
    }
    else
    {
      uint64_t v14 = 0;
    }

    if ([v5 hasErrorData])
    {
      id v15 = [v5 errorData];
      id v16 = [(ATXSuggestionRequestResponse *)self unarchivedNSErrorFromData:v15];
    }
    else
    {
      id v16 = 0;
    }
    if ([v5 hasInteractionSuggestionRequest])
    {
      id v17 = [ATXInteractionSuggestionRequest alloc];
      uint64_t v18 = [v5 interactionSuggestionRequest];
    }
    else if ([v5 hasContextualActionSuggestionRequest])
    {
      id v17 = [ATXContextualActionSuggestionRequest alloc];
      uint64_t v18 = [v5 contextualActionSuggestionRequest];
    }
    else
    {
      if (![v5 hasIntentSuggestionRequest]) {
        goto LABEL_34;
      }
      id v17 = [ATXIntentSuggestionRequest alloc];
      uint64_t v18 = [v5 intentSuggestionRequest];
    }
    v19 = (void *)v18;
    uint64_t v20 = [(ATXInteractionSuggestionRequest *)v17 initWithProto:v18];

    if (v20)
    {
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
      self = [(ATXSuggestionRequestResponse *)self initWithSuggestions:v8 feedbackMetadata:v9 originalRequest:v20 responseCode:v14 error:v16 uuid:v21];

      id v12 = self;
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
LABEL_34:
    uint64_t v20 = __atxlog_handle_blending();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestionRequestResponse initWithProto:](v20, v22, v23, v24, v25, v26, v27, v28);
    }
    id v12 = 0;
    goto LABEL_37;
  }
  id v12 = 0;
LABEL_39:

  return v12;
}

ATXProactiveSuggestion *__46__ATXSuggestionRequestResponse_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXProactiveSuggestion alloc] initWithProto:v2];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __46__ATXSuggestionRequestResponse_initWithProto___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return v3;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuidString:v4];

  id v5 = [(NSArray *)self->_suggestions _pas_mappedArrayWithTransform:&__block_literal_global_23];
  uint64_t v6 = (void *)[v5 mutableCopy];
  [v3 setSuggestions:v6];

  [v3 setFeedbackMetadata:self->_feedbackMetadata];
  unsigned int v7 = self->_responseCode - 1;
  if (v7 > 4) {
    uint64_t v8 = @"Unknown";
  }
  else {
    uint64_t v8 = off_1E5F00908[v7];
  }
  if ([(__CFString *)v8 isEqualToString:@"Unknown"])
  {
    uint64_t v9 = 0;
  }
  else if ([(__CFString *)v8 isEqualToString:@"FallbackToCache"])
  {
    uint64_t v9 = 1;
  }
  else if ([(__CFString *)v8 isEqualToString:@"Success"])
  {
    uint64_t v9 = 2;
  }
  else if ([(__CFString *)v8 isEqualToString:@"Error"])
  {
    uint64_t v9 = 3;
  }
  else if ([(__CFString *)v8 isEqualToString:@"SuccessAndReplaceCache"])
  {
    uint64_t v9 = 4;
  }
  else if ([(__CFString *)v8 isEqualToString:@"Max"])
  {
    uint64_t v9 = 5;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v3 setResponseCode:v9];
  if (self->_error)
  {
    uint64_t v10 = -[ATXSuggestionRequestResponse dataFromNSError:](self, "dataFromNSError:");
    [v3 setErrorData:v10];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(ATXSuggestionRequest *)self->_originalRequest proto];
    [v3 setInteractionSuggestionRequest:v11];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [(ATXSuggestionRequest *)self->_originalRequest proto];
      [v3 setContextualActionSuggestionRequest:v11];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      uint64_t v11 = [(ATXSuggestionRequest *)self->_originalRequest proto];
      [v3 setIntentSuggestionRequest:v11];
    }
  }

LABEL_26:
  return v3;
}

id __37__ATXSuggestionRequestResponse_proto__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 proto];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __37__ATXSuggestionRequestResponse_proto__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return v3;
}

- (id)unarchivedNSErrorFromData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1B3E6F520]();
  id v10 = 0;
  id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestionRequestResponse unarchivedNSErrorFromData:]((uint64_t)v6, v7);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)dataFromNSError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1B3E6F520]();
  id v10 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestionRequestResponse dataFromNSError:]((uint64_t)v6, v7);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)encodeAsProto
{
  id v2 = [(ATXSuggestionRequestResponse *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (ATXSuggestionRequest)originalRequest
{
  return self->_originalRequest;
}

- (int)responseCode
{
  return self->_responseCode;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBUIEvent proto", (uint8_t *)&v5, 0xCu);
}

void __46__ATXSuggestionRequestResponse_initWithProto___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__ATXSuggestionRequestResponse_proto__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unarchivedNSErrorFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Unable to unarchive error from Suggestion Request Response. Unarchiving Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dataFromNSError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Unable to archive error from Suggestion Request Response. Archiving Error: %@", (uint8_t *)&v2, 0xCu);
}

@end