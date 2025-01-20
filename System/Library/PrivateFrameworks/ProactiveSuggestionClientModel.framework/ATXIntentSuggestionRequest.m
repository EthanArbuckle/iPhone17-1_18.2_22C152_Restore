@interface ATXIntentSuggestionRequest
+ (BOOL)supportsSecureCoding;
- (ATXIntentSuggestionRequest)initWithCoder:(id)a3;
- (ATXIntentSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIds:(id)a5 intentClassNames:(id)a6 limit:(id)a7;
- (ATXIntentSuggestionRequest)initWithProto:(id)a3;
- (ATXIntentSuggestionRequest)initWithProtoData:(id)a3;
- (ATXIntentSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 bundleIds:(id)a6 intentClassNames:(id)a7 limit:(id)a8 timeout:(double)a9;
- (ATXIntentSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 timeout:(double)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)bundleIds;
- (NSArray)intentClassNames;
- (NSNumber)limit;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
@end

@implementation ATXIntentSuggestionRequest

- (ATXIntentSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 timeout:(double)a6
{
  return [(ATXIntentSuggestionRequest *)self initWithUUID:a3 originatorId:a4 consumerSubType:a5 bundleIds:0 intentClassNames:0 limit:0 timeout:a6];
}

- (ATXIntentSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIds:(id)a5 intentClassNames:(id)a6 limit:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = objc_opt_new();
  v17 = [(ATXIntentSuggestionRequest *)self initWithUUID:v16 originatorId:v15 consumerSubType:v9 bundleIds:v14 intentClassNames:v13 limit:v12 timeout:10.0];

  return v17;
}

- (ATXIntentSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 bundleIds:(id)a6 intentClassNames:(id)a7 limit:(id)a8 timeout:(double)a9
{
  uint64_t v13 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v22.receiver = self;
  v22.super_class = (Class)ATXIntentSuggestionRequest;
  v20 = [(ATXSuggestionRequest *)&v22 initWithUUID:a3 originatorId:a4 consumerSubType:v13 timeout:a9];
  if (v20)
  {
    if ([v17 count]) {
      objc_storeStrong((id *)&v20->_bundleIds, a6);
    }
    if ([v18 count]) {
      objc_storeStrong((id *)&v20->_intentClassNames, a7);
    }
    objc_storeStrong((id *)&v20->_limit, a8);
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXIntentSuggestionRequest *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ATXIntentSuggestionRequest;
    if ([(ATXSuggestionRequest *)&v20 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = v4;
        limit = self->_limit;
        v7 = v5->_limit;
        if (limit == v7)
        {
        }
        else
        {
          v8 = v7;
          uint64_t v9 = limit;
          char v10 = [(NSNumber *)v9 isEqual:v8];

          if ((v10 & 1) == 0) {
            goto LABEL_12;
          }
        }
        bundleIds = self->_bundleIds;
        uint64_t v13 = v5->_bundleIds;
        if (bundleIds == v13)
        {
        }
        else
        {
          id v14 = v13;
          id v15 = bundleIds;
          char v16 = [(NSArray *)v15 isEqual:v14];

          if ((v16 & 1) == 0)
          {
LABEL_12:
            char v11 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        id v17 = self->_intentClassNames;
        id v18 = v17;
        if (v17 == v5->_intentClassNames) {
          char v11 = 1;
        }
        else {
          char v11 = -[NSArray isEqual:](v17, "isEqual:");
        }

        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ATXIntentSuggestionRequest;
  unint64_t v3 = [(ATXSuggestionRequest *)&v7 hash];
  uint64_t v4 = [(NSArray *)self->_bundleIds hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSArray *)self->_intentClassNames hash] - v4 + 32 * v4;
  return [(NSNumber *)self->_limit hash] - v5 + 32 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXIntentSuggestionRequest *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXIntentSuggestionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXIntentSuggestionRequest *)self initWithProtoData:v5];
  return v6;
}

- (ATXIntentSuggestionRequest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBRequestForIntentSuggestions alloc] initWithData:v4];

    self = [(ATXIntentSuggestionRequest *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXIntentSuggestionRequest *)self proto];
  unint64_t v3 = [v2 data];

  return v3;
}

- (ATXIntentSuggestionRequest)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    char v16 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXIntentSuggestionRequest initWithProto:]();
    }

    goto LABEL_8;
  }
  id v5 = v4;
  v6 = [ATXSuggestionRequest alloc];
  objc_super v7 = [v5 base];
  v8 = [(ATXSuggestionRequest *)v6 initWithProto:v7];

  id v18 = [(ATXSuggestionRequest *)v8 requestUUID];
  uint64_t v9 = [(ATXSuggestionRequest *)v8 originatorId];
  uint64_t v10 = [(ATXSuggestionRequest *)v8 consumerSubType];
  char v11 = [v5 bundleIds];
  id v12 = [v5 intentClassNames];
  int v13 = [v5 hasLimit];
  if (v13)
  {
    id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "limit"));
  }
  else
  {
    id v14 = 0;
  }
  [(ATXSuggestionRequest *)v8 timeout];
  self = -[ATXIntentSuggestionRequest initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:](self, "initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:", v18, v9, v10, v11, v12, v14);
  if (v13) {

  }
  char v16 = self;
LABEL_13:

  return v16;
}

- (id)proto
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_new();
  v26.receiver = self;
  v26.super_class = (Class)ATXIntentSuggestionRequest;
  id v4 = [(ATXSuggestionRequest *)&v26 proto];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 setBase:v4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = self->_bundleIds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          [v3 addBundleIds:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v7);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = self->_intentClassNames;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v3, "addIntentClassNames:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v12);
    }

    if (self->_limit)
    {
      [v3 setHasLimit:1];
      objc_msgSend(v3, "setLimit:", -[NSNumber intValue](self->_limit, "intValue"));
    }
    else
    {
      [v3 setHasLimit:0];
    }
    id v16 = v3;
  }
  else
  {
    id v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXIntentSuggestionRequest proto]();
    }

    id v16 = 0;
  }

  return v16;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (NSArray)intentClassNames
{
  return self->_intentClassNames;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_intentClassNames, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1AE67F000, v0, v1, "%s: Returning nil because input proto is of unexpected class %{public}@", v2, v3, v4, v5, 2u);
}

- (void)proto
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1AE67F000, v0, v1, "%s: Returning nil because [super proto] is of unexpected class %{public}@", v2, v3, v4, v5, 2u);
}

@end