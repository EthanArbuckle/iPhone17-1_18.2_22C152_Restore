@interface ATXContextualActionSuggestionRequest
+ (BOOL)supportsSecureCoding;
- (ATXContextualActionSuggestionRequest)initWithCoder:(id)a3;
- (ATXContextualActionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 caxPredictionContext:(id)a5 maxSuggestions:(unint64_t)a6 timeout:(double)a7;
- (ATXContextualActionSuggestionRequest)initWithProto:(id)a3;
- (ATXContextualActionSuggestionRequest)initWithProtoData:(id)a3;
- (ATXContextualActionSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 caxPredictionContext:(id)a6 maxSuggestions:(unint64_t)a7 timeout:(double)a8;
- (ATXSuggestionExecutableProtocol)caxPredictionContext;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (id)archivePredictionContext;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)maxSuggestions;
- (void)archivePredictionContext;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxSuggestions:(unint64_t)a3;
@end

@implementation ATXContextualActionSuggestionRequest

- (ATXContextualActionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 caxPredictionContext:(id)a5 maxSuggestions:(unint64_t)a6 timeout:(double)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = objc_opt_new();
  v15 = [(ATXContextualActionSuggestionRequest *)self initWithUUID:v14 originatorId:v13 consumerSubType:v9 caxPredictionContext:v12 maxSuggestions:a6 timeout:a7];

  return v15;
}

- (ATXContextualActionSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 caxPredictionContext:(id)a6 maxSuggestions:(unint64_t)a7 timeout:(double)a8
{
  uint64_t v11 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ATXContextualActionSuggestionRequest;
  v16 = [(ATXSuggestionRequest *)&v19 initWithUUID:a3 originatorId:a4 consumerSubType:v11 timeout:a8];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_caxPredictionContext, a6);
    v17->_maxSuggestions = a7;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXContextualActionSuggestionRequest *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ATXSuggestionRequest *)self requestUUID];
      v7 = [(ATXSuggestionRequest *)v5 requestUUID];
      int v8 = [v6 isEqual:v7];

      if (v8
        && ([(ATXSuggestionRequest *)self originatorId],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [(ATXSuggestionRequest *)v5 originatorId],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqualToString:v10],
            v10,
            v9,
            v11))
      {
        id v12 = self->_caxPredictionContext;
        id v13 = v12;
        if (v12 == v5->_caxPredictionContext) {
          char v14 = 1;
        }
        else {
          char v14 = -[ATXSuggestionExecutableProtocol isEqual:](v12, "isEqual:");
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
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
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      objc_super v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(ATXContextualActionSuggestionRequest *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXContextualActionSuggestionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXContextualActionSuggestionRequest *)self initWithProtoData:v5];
  return v6;
}

- (ATXContextualActionSuggestionRequest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBRequestForContextualActionSuggestions alloc] initWithData:v4];

    self = [(ATXContextualActionSuggestionRequest *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXContextualActionSuggestionRequest)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXSuggestionRequestResponse initWithProto:]((uint64_t)self, v5);
      }
      int v8 = 0;
      goto LABEL_24;
    }
    id v5 = v4;
    v6 = [v5 consumerSubTypeString];
    char v31 = 0;
    uint64_t v7 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v6 found:&v31];
    int v8 = 0;
    if (!v31 || (uint64_t v9 = v7, !v7) || v7 == 48)
    {
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    v10 = [v5 uuidString];
    id v11 = [v5 originatorId];
    if (![v5 hasCaxPredictionContext])
    {
      objc_super v19 = 0;
LABEL_22:
      uint64_t v22 = (int)[v5 maxSuggestions];
      [v5 timeout];
      double v24 = v23;
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      self = [(ATXContextualActionSuggestionRequest *)self initWithUUID:v25 originatorId:v11 consumerSubType:v9 caxPredictionContext:v19 maxSuggestions:v22 timeout:v24];

      int v8 = self;
      goto LABEL_23;
    }
    v29 = v10;
    id v12 = [v5 caxPredictionContext];
    Class v13 = NSClassFromString(&cfstr_Caxpredictionc_0.isa);
    if (v13)
    {
      Class v14 = v13;
      context = (void *)MEMORY[0x1B3E6F520]();
      id v15 = (void *)MEMORY[0x1E4F28DC0];
      v28 = v12;
      uint64_t v16 = MEMORY[0x1B3E6F520]();
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v14, 0);
      v18 = (void *)v16;
      id v12 = v28;
      id v30 = 0;
      objc_super v19 = [v15 unarchivedObjectOfClasses:v17 fromData:v28 error:&v30];
      v20 = v30;

      if (!v20)
      {
LABEL_21:

        v10 = v29;
        goto LABEL_22;
      }
      uint64_t v21 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ATXContextualActionSuggestionRequest initWithProto:]((uint64_t)v20, v21);
      }

      id v12 = v28;
    }
    else
    {
      v20 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ATXContextualActionSuggestionRequest initWithProto:](v20);
      }
      objc_super v19 = 0;
    }

    goto LABEL_21;
  }
  int v8 = 0;
LABEL_25:

  return v8;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", -[ATXSuggestionRequest consumerSubType](self, "consumerSubType"));
  [v3 setConsumerSubTypeString:v4];

  id v5 = [(ATXSuggestionRequest *)self originatorId];
  [v3 setOriginatorId:v5];

  v6 = [(ATXSuggestionRequest *)self requestUUID];
  uint64_t v7 = [v6 UUIDString];
  [v3 setUuidString:v7];

  int v8 = [(ATXContextualActionSuggestionRequest *)self archivePredictionContext];
  [v3 setCaxPredictionContext:v8];

  [v3 setMaxSuggestions:LODWORD(self->_maxSuggestions)];
  [(ATXSuggestionRequest *)self timeout];
  objc_msgSend(v3, "setTimeout:");
  return v3;
}

- (id)archivePredictionContext
{
  if (self->_caxPredictionContext)
  {
    v3 = (void *)MEMORY[0x1B3E6F520]();
    caxPredictionContext = self->_caxPredictionContext;
    id v10 = 0;
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:caxPredictionContext requiringSecureCoding:1 error:&v10];
    id v6 = v10;
    if (v6)
    {
      uint64_t v7 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(ATXContextualActionSuggestionRequest *)(uint64_t)v6 archivePredictionContext];
      }

      id v8 = 0;
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)encodeAsProto
{
  v2 = [(ATXContextualActionSuggestionRequest *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXSuggestionExecutableProtocol)caxPredictionContext
{
  return self->_caxPredictionContext;
}

- (unint64_t)maxSuggestions
{
  return self->_maxSuggestions;
}

- (void)setMaxSuggestions:(unint64_t)a3
{
  self->_maxSuggestions = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "Unable to access class for CAXPredictionContext", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Error when deserializing CAXPredictionContext: %@", (uint8_t *)&v2, 0xCu);
}

- (void)archivePredictionContext
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Error when archiving caxPredictionContext in ATXContextualActionSuggestionRequest. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end