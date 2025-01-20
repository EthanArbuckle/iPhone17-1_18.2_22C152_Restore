@interface ATXProactiveSuggestionClientModelSpecification
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionClientModelSpecification)initWithClientModelId:(id)a3 clientModelVersion:(id)a4;
- (ATXProactiveSuggestionClientModelSpecification)initWithClientModelId:(id)a3 clientModelVersion:(id)a4 engagementResetPolicy:(unint64_t)a5;
- (ATXProactiveSuggestionClientModelSpecification)initWithCoder:(id)a3;
- (ATXProactiveSuggestionClientModelSpecification)initWithProto:(id)a3;
- (ATXProactiveSuggestionClientModelSpecification)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)clientModelId;
- (NSString)clientModelVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)jsonRawData;
- (id)proto;
- (unint64_t)engagementResetPolicy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionClientModelSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelVersion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (ATXProactiveSuggestionClientModelSpecification)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestion initWithProto:].cold.7();
    }

    goto LABEL_9;
  }
  id v5 = v4;
  v6 = -[ATXPBProactiveSuggestionClientModelSpecification clientModelId]((uint64_t)v5);
  v7 = -[ATXPBProactiveSuggestionClientModelSpecification clientModelVersion]((uint64_t)v5);
  uint64_t v8 = -[ATXPBProactiveSuggestionClientModelSpecification engagementResetPolicy]((uint64_t)v5);
  if (v8)
  {
    if (v8 == 1)
    {
      v9 = @"WhenNotPredicted";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = @"OnCacheUpdate";
  }
  v12 = v9;
  if ([(__CFString *)v12 isEqualToString:@"OnCacheUpdate"]) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = [(__CFString *)v12 isEqualToString:@"WhenNotPredicted"];
  }

  self = [(ATXProactiveSuggestionClientModelSpecification *)self initWithClientModelId:v6 clientModelVersion:v7 engagementResetPolicy:v13];
  v11 = self;
LABEL_16:

  return v11;
}

- (ATXProactiveSuggestionClientModelSpecification)initWithClientModelId:(id)a3 clientModelVersion:(id)a4 engagementResetPolicy:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXProactiveSuggestionClientModelSpecification;
  v10 = [(ATXProactiveSuggestionClientModelSpecification *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    clientModelId = v10->_clientModelId;
    v10->_clientModelId = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    clientModelVersion = v10->_clientModelVersion;
    v10->_clientModelVersion = (NSString *)v13;

    v10->_engagementResetPolicy = a5;
  }

  return v10;
}

- (ATXProactiveSuggestionClientModelSpecification)initWithClientModelId:(id)a3 clientModelVersion:(id)a4
{
  return [(ATXProactiveSuggestionClientModelSpecification *)self initWithClientModelId:a3 clientModelVersion:a4 engagementResetPolicy:0];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Client Model: %@ (version: %@)   Recently Engaged Policy: %lu", self->_clientModelId, self->_clientModelVersion, self->_engagementResetPolicy];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXProactiveSuggestionClientModelSpecification allocWithZone:a3];
  id v5 = (void *)[(NSString *)self->_clientModelId copy];
  v6 = (void *)[(NSString *)self->_clientModelVersion copy];
  v7 = [(ATXProactiveSuggestionClientModelSpecification *)v4 initWithClientModelId:v5 clientModelVersion:v6 engagementResetPolicy:self->_engagementResetPolicy];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientModelId hash];
  NSUInteger v4 = [(NSString *)self->_clientModelVersion hash];
  return self->_engagementResetPolicy - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXProactiveSuggestionClientModelSpecification *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      clientModelId = self->_clientModelId;
      v7 = (NSString *)v5[1];
      if (clientModelId == v7)
      {
      }
      else
      {
        id v8 = v7;
        id v9 = clientModelId;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_11;
        }
      }
      clientModelVersion = self->_clientModelVersion;
      uint64_t v13 = (NSString *)v5[2];
      if (clientModelVersion == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = clientModelVersion;
        char v16 = [(NSString *)v15 isEqual:v14];

        if ((v16 & 1) == 0)
        {
LABEL_11:
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      unint64_t engagementResetPolicy = self->_engagementResetPolicy;
      BOOL v11 = engagementResetPolicy == [v5 engagementResetPolicy];
      goto LABEL_14;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)encodeAsProto
{
  v2 = [(ATXProactiveSuggestionClientModelSpecification *)self proto];
  NSUInteger v3 = [v2 data];

  return v3;
}

- (ATXProactiveSuggestionClientModelSpecification)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBProactiveSuggestionClientModelSpecification alloc] initWithData:v4];

    self = [(ATXProactiveSuggestionClientModelSpecification *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  NSUInteger v3 = objc_opt_new();
  -[ATXPBProactiveSuggestionClientModelSpecification setClientModelId:]((uint64_t)v3, self->_clientModelId);
  -[ATXPBProactiveSuggestionClientModelSpecification setClientModelVersion:]((uint64_t)v3, self->_clientModelVersion);
  unint64_t engagementResetPolicy = self->_engagementResetPolicy;
  if (engagementResetPolicy)
  {
    if (engagementResetPolicy == 1)
    {
      id v5 = @"WhenNotPredicted";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_engagementResetPolicy);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = @"OnCacheUpdate";
  }
  v6 = v5;
  if ([(__CFString *)v6 isEqualToString:@"OnCacheUpdate"]) {
    int v7 = 0;
  }
  else {
    int v7 = [(__CFString *)v6 isEqualToString:@"WhenNotPredicted"];
  }

  -[ATXPBProactiveSuggestionClientModelSpecification setEngagementResetPolicy:]((uint64_t)v3, v7);
  return v3;
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
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
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

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
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
  id v5 = [(ATXProactiveSuggestionClientModelSpecification *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestionClientModelSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXProactiveSuggestionClientModelSpecification *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"clientModelId";
  v5[1] = @"clientModelVersion";
  clientModelVersion = self->_clientModelVersion;
  v6[0] = self->_clientModelId;
  v6[1] = clientModelVersion;
  NSUInteger v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSString)clientModelVersion
{
  return self->_clientModelVersion;
}

- (unint64_t)engagementResetPolicy
{
  return self->_engagementResetPolicy;
}

@end