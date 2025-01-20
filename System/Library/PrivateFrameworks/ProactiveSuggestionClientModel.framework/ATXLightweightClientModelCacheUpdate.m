@interface ATXLightweightClientModelCacheUpdate
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXLightweightClientModelCacheUpdate)initWithClientModelCacheUpdate:(id)a3;
- (ATXLightweightClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 uuid:(id)a5 cacheCreationDate:(id)a6;
- (ATXLightweightClientModelCacheUpdate)initWithProto:(id)a3;
- (ATXLightweightClientModelCacheUpdate)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXLightweightClientModelCacheUpdate:(id)a3;
- (NSArray)suggestions;
- (NSDate)cacheCreationDate;
- (NSString)clientModelId;
- (NSString)description;
- (NSUUID)uuid;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation ATXLightweightClientModelCacheUpdate

- (ATXLightweightClientModelCacheUpdate)initWithClientModelCacheUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 clientModelId];
  v6 = [v4 suggestions];
  v7 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:v6];
  v8 = [v4 uuid];
  v9 = [v4 cacheCreationDate];

  v10 = [(ATXLightweightClientModelCacheUpdate *)self initWithClientModelId:v5 suggestions:v7 uuid:v8 cacheCreationDate:v9];
  return v10;
}

- (ATXLightweightClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 uuid:(id)a5 cacheCreationDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXLightweightClientModelCacheUpdate;
  v15 = [(ATXLightweightClientModelCacheUpdate *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientModelId, a3);
    objc_storeStrong((id *)&v16->_suggestions, a4);
    objc_storeStrong((id *)&v16->_uuid, a5);
    objc_storeStrong((id *)&v16->_cacheCreationDate, a6);
  }

  return v16;
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
    v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)description
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"clientModelId: %@\n", self->_clientModelId];
  id v4 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:self->_suggestions];
  [v3 appendFormat:@"suggestions: %@\n", v4];

  id v5 = [(NSUUID *)self->_uuid UUIDString];
  [v3 appendFormat:@"uuid: %@\n", v5];

  v6 = [(NSDate *)self->_cacheCreationDate description];
  [v3 appendFormat:@"cacheCreationDate: %@\n", v6];

  v7 = (void *)[v3 copy];
  return (NSString *)v7;
}

- (id)jsonDict
{
  v15[5] = *MEMORY[0x1E4F143B8];
  clientModelId = (__CFString *)self->_clientModelId;
  if (!clientModelId) {
    clientModelId = @"nil";
  }
  v15[0] = clientModelId;
  v14[0] = @"clientModelId";
  v14[1] = @"uuid";
  uint64_t v4 = [(NSUUID *)self->_uuid UUIDString];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"nil";
  }
  v15[1] = v6;
  v14[2] = @"suggestions";
  v7 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:self->_suggestions];
  v15[2] = v7;
  v14[3] = @"suggestionCount";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_suggestions, "count"));
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"nil";
  }
  v15[3] = v10;
  v14[4] = @"cacheCreationDate";
  id v11 = [(NSDate *)self->_cacheCreationDate description];
  v15[4] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v12;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXLightweightClientModelCacheUpdate *)self jsonDict];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXLightweightClientModelCacheUpdate *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXLightweightClientModelCacheUpdate *)self isEqualToATXLightweightClientModelCacheUpdate:v5];

  return v6;
}

- (BOOL)isEqualToATXLightweightClientModelCacheUpdate:(id)a3
{
  uint64_t v4 = (id *)a3;
  clientModelId = self->_clientModelId;
  BOOL v6 = (NSString *)v4[1];
  if (clientModelId == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = clientModelId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  suggestions = self->_suggestions;
  id v11 = (NSArray *)v4[2];
  if (suggestions == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = suggestions;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  uuid = self->_uuid;
  v16 = (NSUUID *)v4[3];
  if (uuid == v16)
  {
  }
  else
  {
    v17 = v16;
    objc_super v18 = uuid;
    char v19 = [(NSUUID *)v18 isEqual:v17];

    if ((v19 & 1) == 0)
    {
LABEL_11:
      char v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_cacheCreationDate;
  v22 = v21;
  if (v21 == v4[4]) {
    char v20 = 1;
  }
  else {
    char v20 = -[NSDate isEqual:](v21, "isEqual:");
  }

LABEL_17:
  return v20;
}

- (ATXLightweightClientModelCacheUpdate)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBLightweightClientModelCacheUpdate alloc] initWithData:v4];

    self = [(ATXLightweightClientModelCacheUpdate *)self initWithProto:v5];
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
  v2 = [(ATXLightweightClientModelCacheUpdate *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXLightweightClientModelCacheUpdate)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = __atxlog_handle_blending();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v17);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  BOOL v6 = [v5 clientModelId];
  v7 = [v5 suggestions];
  uint64_t v8 = +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:v7];
  id v9 = objc_alloc(MEMORY[0x1E4F29128]);
  v10 = [v5 uuidString];
  id v11 = (void *)[v9 initWithUUIDString:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v5 cacheCreationDate];
  double v14 = v13;

  v15 = (void *)[v12 initWithTimeIntervalSinceReferenceDate:v14];
  self = [(ATXLightweightClientModelCacheUpdate *)self initWithClientModelId:v6 suggestions:v8 uuid:v11 cacheCreationDate:v15];

  v16 = self;
LABEL_8:

  return v16;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setClientModelId:self->_clientModelId];
  id v4 = +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:self->_suggestions];
  id v5 = (void *)[v4 copy];
  [v3 setSuggestions:v5];

  BOOL v6 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuidString:v6];

  [(NSDate *)self->_cacheCreationDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setCacheCreationDate:");
  return v3;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)cacheCreationDate
{
  return self->_cacheCreationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCreationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

@end