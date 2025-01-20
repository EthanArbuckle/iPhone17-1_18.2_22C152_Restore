@interface ATXSuggestionRequest
+ (BOOL)supportsSecureCoding;
- (ATXSuggestionRequest)initWithCoder:(id)a3;
- (ATXSuggestionRequest)initWithProto:(id)a3;
- (ATXSuggestionRequest)initWithProtoData:(id)a3;
- (ATXSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5;
- (ATXSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 timeout:(double)a6;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)originatorId;
- (NSUUID)requestUUID;
- (double)timeout;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)consumerSubType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSuggestionRequest

- (ATXSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5
{
  return [(ATXSuggestionRequest *)self initWithUUID:a3 originatorId:a4 consumerSubType:a5 timeout:0.5];
}

- (ATXSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 timeout:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXSuggestionRequest;
  v13 = [(ATXSuggestionRequest *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestUUID, a3);
    uint64_t v15 = [v12 copy];
    originatorId = v14->_originatorId;
    v14->_originatorId = (NSString *)v15;

    v14->_consumerSubType = a5;
    v14->_timeout = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSuggestionRequest *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      requestUUID = self->_requestUUID;
      v7 = (NSUUID *)v5[2];
      if (requestUUID == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = requestUUID;
        char v10 = [(NSUUID *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_11;
        }
      }
      originatorId = self->_originatorId;
      v13 = (NSString *)v5[3];
      if (originatorId == v13)
      {
      }
      else
      {
        v14 = v13;
        uint64_t v15 = originatorId;
        char v16 = [(NSString *)v15 isEqual:v14];

        if ((v16 & 1) == 0)
        {
LABEL_11:
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      int consumerSubType = self->_consumerSubType;
      BOOL v11 = consumerSubType == [v5 consumerSubType];
      goto LABEL_14;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_requestUUID hash];
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
    uint64_t v15 = [v12 error];

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
      objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  id v5 = [(ATXSuggestionRequest *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSuggestionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXSuggestionRequest *)self initWithProtoData:v5];
  return v6;
}

- (ATXSuggestionRequest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBRequestForSuggestions alloc] initWithData:v4];

    self = [(ATXSuggestionRequest *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSuggestionRequest)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 consumerSubTypeString];
      char v16 = 0;
      uint64_t v7 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v6 found:&v16];
      v8 = 0;
      if (v16)
      {
        uint64_t v9 = v7;
        if (v7)
        {
          if (v7 != 48)
          {
            char v10 = [v5 uuidString];
            id v11 = [v5 originatorId];
            double v12 = 0.5;
            if ([v5 hasTimeout])
            {
              [v5 timeout];
              double v12 = v13;
            }
            BOOL v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
            self = [(ATXSuggestionRequest *)self initWithUUID:v14 originatorId:v11 consumerSubType:v9 timeout:v12];

            v8 = self;
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
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  [v3 setConsumerSubTypeString:v4];

  [v3 setOriginatorId:self->_originatorId];
  id v5 = [(NSUUID *)self->_requestUUID UUIDString];
  [v3 setUuidString:v5];

  [v3 setTimeout:self->_timeout];
  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXSuggestionRequest *)self proto];
  v3 = [v2 data];

  return v3;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSString)originatorId
{
  return self->_originatorId;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end