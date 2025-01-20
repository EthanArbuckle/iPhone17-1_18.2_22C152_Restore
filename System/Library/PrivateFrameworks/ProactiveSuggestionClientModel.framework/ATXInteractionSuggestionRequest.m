@interface ATXInteractionSuggestionRequest
+ (BOOL)supportsSecureCoding;
- (ATXInteractionSuggestionRequest)initWithCoder:(id)a3;
- (ATXInteractionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 psPredictionContext:(id)a5;
- (ATXInteractionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 psPredictionContext:(id)a5 timeout:(double)a6;
- (ATXInteractionSuggestionRequest)initWithProto:(id)a3;
- (ATXInteractionSuggestionRequest)initWithProtoData:(id)a3;
- (ATXInteractionSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 psPredictionContext:(id)a6 timeout:(double)a7;
- (ATXSuggestionExecutableProtocol)psPredictionContext;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (id)archivePredictionContext;
- (id)encodeAsProto;
- (id)proto;
- (void)archivePredictionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInteractionSuggestionRequest

- (ATXInteractionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 psPredictionContext:(id)a5
{
  return [(ATXInteractionSuggestionRequest *)self initWithOriginatorId:a3 consumerSubType:a4 psPredictionContext:a5 timeout:0.5];
}

- (ATXInteractionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 psPredictionContext:(id)a5 timeout:(double)a6
{
  uint64_t v7 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_opt_new();
  v13 = [(ATXInteractionSuggestionRequest *)self initWithUUID:v12 originatorId:v11 consumerSubType:v7 psPredictionContext:v10 timeout:a6];

  return v13;
}

- (ATXInteractionSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 psPredictionContext:(id)a6 timeout:(double)a7
{
  uint64_t v9 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ATXInteractionSuggestionRequest;
  v14 = [(ATXSuggestionRequest *)&v17 initWithUUID:a3 originatorId:a4 consumerSubType:v9 timeout:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_psPredictionContext, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXInteractionSuggestionRequest *)a3;
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
      uint64_t v7 = [(ATXSuggestionRequest *)v5 requestUUID];
      int v8 = [v6 isEqual:v7];

      if (v8
        && ([(ATXSuggestionRequest *)self originatorId],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [(ATXSuggestionRequest *)v5 originatorId],
            id v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqualToString:v10],
            v10,
            v9,
            v11))
      {
        v12 = self->_psPredictionContext;
        id v13 = v12;
        if (v12 == v5->_psPredictionContext) {
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
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      objc_super v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  id v5 = [(ATXInteractionSuggestionRequest *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXInteractionSuggestionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXInteractionSuggestionRequest *)self initWithProtoData:v5];
  return v6;
}

- (ATXInteractionSuggestionRequest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBRequestForInteractionSuggestions alloc] initWithData:v4];

    self = [(ATXInteractionSuggestionRequest *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXInteractionSuggestionRequest)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 consumerSubTypeString];
      char v27 = 0;
      uint64_t v7 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v6 found:&v27];
      int v8 = 0;
      if (v27)
      {
        uint64_t v9 = v7;
        if (v7)
        {
          if (v7 != 48)
          {
            id v10 = [v5 uuidString];
            id v11 = [v5 originatorId];
            if ([v5 hasPsPredictionContext])
            {
              id v12 = [v5 psPredictionContext];
              id v13 = NSClassFromString(&cfstr_Pspredictionco_0.isa);
              if (v13)
              {
                uint64_t v14 = MEMORY[0x1B3E6F520]();
                v23 = (void *)MEMORY[0x1E4F28DC0];
                v24 = (void *)v14;
                v15 = (void *)MEMORY[0x1B3E6F520]();
                v25 = v10;
                id v16 = v12;
                objc_super v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v13, 0);
                id v26 = 0;
                id v13 = [v23 unarchivedObjectOfClasses:v17 fromData:v16 error:&v26];
                id v18 = v26;

                id v12 = v16;
                id v10 = v25;
              }
            }
            else
            {
              id v13 = 0;
            }
            double v19 = 0.5;
            if ([v5 hasTimeout])
            {
              [v5 timeout];
              double v19 = v20;
            }
            uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
            self = [(ATXInteractionSuggestionRequest *)self initWithUUID:v21 originatorId:v11 consumerSubType:v9 psPredictionContext:v13 timeout:v19];

            int v8 = self;
          }
        }
      }
    }
    else
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXSuggestionRequestResponse initWithProto:]((uint64_t)self, v5);
      }
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }

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

  int v8 = [(ATXInteractionSuggestionRequest *)self archivePredictionContext];
  [v3 setPsPredictionContext:v8];

  [(ATXSuggestionRequest *)self timeout];
  objc_msgSend(v3, "setTimeout:");
  return v3;
}

- (id)archivePredictionContext
{
  if (self->_psPredictionContext)
  {
    v3 = (void *)MEMORY[0x1B3E6F520]();
    psPredictionContext = self->_psPredictionContext;
    id v10 = 0;
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:psPredictionContext requiringSecureCoding:1 error:&v10];
    id v6 = v10;
    if (v6)
    {
      uint64_t v7 = __atxlog_handle_blending();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(ATXInteractionSuggestionRequest *)(uint64_t)v6 archivePredictionContext];
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
  v2 = [(ATXInteractionSuggestionRequest *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXSuggestionExecutableProtocol)psPredictionContext
{
  return self->_psPredictionContext;
}

- (void).cxx_destruct
{
}

- (void)archivePredictionContext
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Error when archiving psPredictionContext in ATXInteractionSuggestionRequest. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end