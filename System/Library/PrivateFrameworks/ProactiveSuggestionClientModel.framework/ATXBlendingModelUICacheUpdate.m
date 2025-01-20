@interface ATXBlendingModelUICacheUpdate
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXBlendingModelUICacheUpdate)initWithCoder:(id)a3;
- (ATXBlendingModelUICacheUpdate)initWithHomeScreenCachedSuggestions:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5;
- (ATXBlendingModelUICacheUpdate)initWithProto:(id)a3;
- (ATXBlendingModelUICacheUpdate)initWithProtoData:(id)a3;
- (ATXBlendingModelUICacheUpdate)initWithSpotlightSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5;
- (ATXBlendingModelUICacheUpdate)initWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5;
- (ATXBlendingModelUICacheUpdate)initWithUICache:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdateUUIDs:(id)a5 uuid:(id)a6 cacheCreationDate:(id)a7;
- (ATXBlendingModelUICacheUpdate)initWithUICache:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5;
- (ATXUICacheProtocol)uiCache;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForint:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXBlendingModelUICacheUpdate:(id)a3;
- (NSDate)cacheCreationDate;
- (NSDictionary)clientModelCacheUpdateUUIDs;
- (NSUUID)uuid;
- (id)_initWithCoder:(id)a3;
- (id)clientModelCacheUpdateUUIDsDictionaryFromProto:(id)a3;
- (id)clientModelCacheUpdateUUIDsFromCacheUpdates:(id)a3;
- (id)encodeAsProto;
- (id)encodeAsProtoForBiome;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (id)protoForBiome;
- (unint64_t)hash;
- (unsigned)consumerSubType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setClientModelCacheUpdateUUIDsDictionaryOnProto:(id)a3;
- (void)setUICacheObjectOnProto:(id)a3;
- (void)setUICacheObjectOnProtoForBiome:(id)a3;
@end

@implementation ATXBlendingModelUICacheUpdate

- (id)clientModelCacheUpdateUUIDsFromCacheUpdates:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsFromCacheUpdates___block_invoke;
  v7[3] = &unk_1E5F01918;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __77__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsFromCacheUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 uuid];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (ATXBlendingModelUICacheUpdate)initWithHomeScreenCachedSuggestions:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [(ATXBlendingModelUICacheUpdate *)self clientModelCacheUpdateUUIDsFromCacheUpdates:a5];
  v10 = [v8 uuid];
  v11 = objc_opt_new();
  v12 = [(ATXBlendingModelUICacheUpdate *)self initWithUICache:v8 consumerSubType:v6 clientModelCacheUpdateUUIDs:v9 uuid:v10 cacheCreationDate:v11];

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [(ATXBlendingModelUICacheUpdate *)self clientModelCacheUpdateUUIDsFromCacheUpdates:a5];
  v10 = [v8 uuid];
  v11 = objc_opt_new();
  v12 = [(ATXBlendingModelUICacheUpdate *)self initWithUICache:v8 consumerSubType:v6 clientModelCacheUpdateUUIDs:v9 uuid:v10 cacheCreationDate:v11];

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithSpotlightSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [(ATXBlendingModelUICacheUpdate *)self clientModelCacheUpdateUUIDsFromCacheUpdates:a5];
  v10 = [v8 uuid];
  v11 = objc_opt_new();
  v12 = [(ATXBlendingModelUICacheUpdate *)self initWithUICache:v8 consumerSubType:v6 clientModelCacheUpdateUUIDs:v9 uuid:v10 cacheCreationDate:v11];

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithUICache:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [(ATXBlendingModelUICacheUpdate *)self clientModelCacheUpdateUUIDsFromCacheUpdates:a5];
  v10 = [v8 uuid];
  v11 = objc_opt_new();
  v12 = [(ATXBlendingModelUICacheUpdate *)self initWithUICache:v8 consumerSubType:v6 clientModelCacheUpdateUUIDs:v9 uuid:v10 cacheCreationDate:v11];

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithUICache:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdateUUIDs:(id)a5 uuid:(id)a6 cacheCreationDate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXBlendingModelUICacheUpdate;
  v17 = [(ATXBlendingModelUICacheUpdate *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uiCache, a3);
    v18->_consumerSubType = a4;
    objc_storeStrong((id *)&v18->_clientModelCacheUpdateUUIDs, a5);
    if (v15) {
      v19 = (NSUUID *)v15;
    }
    else {
      v19 = (NSUUID *)objc_opt_new();
    }
    uuid = v18->_uuid;
    v18->_uuid = v19;

    [v16 timeIntervalSince1970];
    v18->_absoluteCacheCreationDate = v21;
  }

  return v18;
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

- (BOOL)checkAndReportDecodingFailureIfNeededForint:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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
  id v5 = [(ATXBlendingModelUICacheUpdate *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXBlendingModelUICacheUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];
  if (v5) {
    uint64_t v6 = [(ATXBlendingModelUICacheUpdate *)self initWithProtoData:v5];
  }
  else {
    uint64_t v6 = [(ATXBlendingModelUICacheUpdate *)self _initWithCoder:v4];
  }
  v7 = v6;

  return v7;
}

- (id)_initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1B3E6F520]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"codingKeyForUICache"];

  if (-[ATXBlendingModelUICacheUpdate checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v10, @"codingKeyForUICache", v4, @"com.apple.proactive.BlendingModelUICacheUpdate", -1)|| (unsigned __int8 v11 = [v4 decodeIntForKey:@"codingKeyForFeedbackMetadata"], -[ATXBlendingModelUICacheUpdate checkAndReportDecodingFailureIfNeededForint:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForint:key:coder:errorDomain:errorCode:", v11, @"codingKeyForFeedbackMetadata", v4, @"com.apple.proactive.BlendingModelUICacheUpdate", -1)))
  {
    id v12 = 0;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1B3E6F520]();
    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"codingKeyForClientModelCacheUpdateUUIDs"];

    if ([(ATXBlendingModelUICacheUpdate *)self checkAndReportDecodingFailureIfNeededForid:v18 key:@"codingKeyForClientModelCacheUpdateUUIDs" coder:v4 errorDomain:@"com.apple.proactive.BlendingModelUICacheUpdate" errorCode:-1])
    {
      id v12 = 0;
    }
    else
    {
      v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForUUID"];
      if ([(ATXBlendingModelUICacheUpdate *)self checkAndReportDecodingFailureIfNeededForid:v19 key:@"codingKeyForUUID" coder:v4 errorDomain:@"com.apple.proactive.BlendingModelUICacheUpdate" errorCode:-1])
      {
        id v12 = 0;
      }
      else
      {
        v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
        self = [(ATXBlendingModelUICacheUpdate *)self initWithUICache:v10 consumerSubType:v11 clientModelCacheUpdateUUIDs:v18 uuid:v19 cacheCreationDate:v20];

        id v12 = self;
      }
    }
  }

  return v12;
}

- (id)encodeAsProto
{
  v2 = [(ATXBlendingModelUICacheUpdate *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (id)encodeAsProtoForBiome
{
  v2 = [(ATXBlendingModelUICacheUpdate *)self protoForBiome];
  id v3 = [v2 data];

  return v3;
}

- (ATXBlendingModelUICacheUpdate)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBBlendingModelUICacheUpdate alloc] initWithData:v4];

    self = [(ATXBlendingModelUICacheUpdate *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ATXBlendingModelUICacheUpdate)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_blending();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXBlendingModelUICacheUpdate initWithProto:].cold.4();
      }
      unsigned __int8 v11 = 0;
      goto LABEL_35;
    }
    id v5 = v4;
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = -[ATXPBBlendingModelUICacheUpdate uuidString]((uint64_t)v5);
    uint64_t v8 = (void *)[v6 initWithUUIDString:v7];

    v9 = -[ATXPBBlendingModelUICacheUpdate consumerSubTypeString]((uint64_t)v5);
    char v53 = 0;
    uint64_t v10 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v9 found:&v53];
    unsigned __int8 v11 = 0;
    if (!v53 || (uint64_t v12 = v10, !v10) || v10 == 48)
    {
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    id v13 = [(ATXBlendingModelUICacheUpdate *)self clientModelCacheUpdateUUIDsDictionaryFromProto:v5];
    if (-[ATXPBBlendingModelUICacheUpdate hasSuggestionLayout]((BOOL)v5)
      && -[ATXPBBlendingModelUICacheUpdate hasHomeScreenCachedSuggestion]((BOOL)v5))
    {
      id v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[ATXBlendingModelUICacheUpdate initWithProto:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else if (-[ATXPBBlendingModelUICacheUpdate hasSuggestionLayout]((BOOL)v5) {
           && -[ATXPBBlendingModelUICacheUpdate hasSpotlightSuggestionLayout]((BOOL)v5))
    }
    {
      id v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[ATXBlendingModelUICacheUpdate initWithProto:](v14, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    else
    {
      if (!-[ATXPBBlendingModelUICacheUpdate hasHomeScreenCachedSuggestion]((BOOL)v5)
        || !-[ATXPBBlendingModelUICacheUpdate hasSpotlightSuggestionLayout]((BOOL)v5))
      {
        v52 = v13;
        v36 = -[ATXPBBlendingModelUICacheUpdate suggestionLayout]((uint64_t)v5);
        if (v36)
        {
          v37 = [ATXSuggestionLayout alloc];
          v38 = -[ATXPBBlendingModelUICacheUpdate suggestionLayout]((uint64_t)v5);
          id v14 = [(ATXSuggestionLayout *)v37 initWithProto:v38];
        }
        else
        {
          id v14 = 0;
        }

        v39 = -[ATXPBBlendingModelUICacheUpdate homeScreenCachedSuggestion]((uint64_t)v5);
        if (v39)
        {
          v40 = [ATXHomeScreenCachedSuggestions alloc];
          v41 = -[ATXPBBlendingModelUICacheUpdate homeScreenCachedSuggestion]((uint64_t)v5);
          uint64_t v42 = [(ATXHomeScreenCachedSuggestions *)v40 initWithProto:v41];

          id v14 = v42;
        }

        v43 = -[ATXPBBlendingModelUICacheUpdate spotlightSuggestionLayout]((uint64_t)v5);
        if (v43)
        {
          v44 = [ATXSpotlightSuggestionLayout alloc];
          v45 = -[ATXPBBlendingModelUICacheUpdate spotlightSuggestionLayout]((uint64_t)v5);
          uint64_t v46 = [(ATXSpotlightSuggestionLayout *)v44 initWithProto:v45];

          id v14 = v46;
        }
        id v13 = v52;

        int v47 = -[ATXPBBlendingModelUICacheUpdate hasCacheCreationDate]((uint64_t)v5);
        v48 = (void *)MEMORY[0x1E4F1C9C8];
        double v49 = 0.0;
        if (v47) {
          double v49 = -[ATXPBBlendingModelUICacheUpdate cacheCreationDate]((uint64_t)v5);
        }
        v50 = objc_msgSend(v48, "dateWithTimeIntervalSince1970:", v49, v52);
        self = [(ATXBlendingModelUICacheUpdate *)self initWithUICache:v14 consumerSubType:v12 clientModelCacheUpdateUUIDs:v13 uuid:v8 cacheCreationDate:v50];

        unsigned __int8 v11 = self;
        goto LABEL_33;
      }
      id v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[ATXBlendingModelUICacheUpdate initWithProto:](v14, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    unsigned __int8 v11 = 0;
LABEL_33:

    goto LABEL_34;
  }
  unsigned __int8 v11 = 0;
LABEL_36:

  return v11;
}

- (id)proto
{
  id v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBBlendingModelUICacheUpdate setUuidString:]((uint64_t)v3, v4);

  id v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  -[ATXPBBlendingModelUICacheUpdate setConsumerSubTypeString:]((uint64_t)v3, v5);

  -[ATXPBBlendingModelUICacheUpdate setCacheCreationDate:]((uint64_t)v3, self->_absoluteCacheCreationDate);
  [(ATXBlendingModelUICacheUpdate *)self setClientModelCacheUpdateUUIDsDictionaryOnProto:v3];
  [(ATXBlendingModelUICacheUpdate *)self setUICacheObjectOnProto:v3];
  return v3;
}

- (id)protoForBiome
{
  id v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBBlendingModelUICacheUpdate setUuidString:]((uint64_t)v3, v4);

  id v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  -[ATXPBBlendingModelUICacheUpdate setConsumerSubTypeString:]((uint64_t)v3, v5);

  -[ATXPBBlendingModelUICacheUpdate setCacheCreationDate:]((uint64_t)v3, self->_absoluteCacheCreationDate);
  [(ATXBlendingModelUICacheUpdate *)self setClientModelCacheUpdateUUIDsDictionaryOnProto:v3];
  [(ATXBlendingModelUICacheUpdate *)self setUICacheObjectOnProtoForBiome:v3];
  return v3;
}

- (id)clientModelCacheUpdateUUIDsDictionaryFromProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = -[ATXPBBlendingModelUICacheUpdate clientModelIds]((uint64_t)v3);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke;
  id v13 = &unk_1E5F01328;
  id v14 = v3;
  id v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

void __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  id v7 = -[ATXPBBlendingModelUICacheUpdate clientModelCacheUpdateUUIDStrings](*(void *)(a1 + 32));
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  v9 = (void *)[v6 initWithUUIDString:v8];

  if (v9)
  {
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke_cold_1();
    }
  }
}

- (void)setClientModelCacheUpdateUUIDsDictionaryOnProto:(id)a3
{
  clientModelCacheUpdateUUIDs = self->_clientModelCacheUpdateUUIDs;
  id v5 = a3;
  id v6 = [(NSDictionary *)clientModelCacheUpdateUUIDs allKeys];
  id v7 = (void *)[v6 mutableCopy];
  -[ATXPBBlendingModelUICacheUpdate setClientModelIds:]((uint64_t)v5, v7);

  id v10 = [(NSDictionary *)self->_clientModelCacheUpdateUUIDs allValues];
  uint64_t v8 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_17);
  v9 = (void *)[v8 mutableCopy];
  -[ATXPBBlendingModelUICacheUpdate setClientModelCacheUpdateUUIDStrings:]((uint64_t)v5, v9);
}

uint64_t __81__ATXBlendingModelUICacheUpdate_setClientModelCacheUpdateUUIDsDictionaryOnProto___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)setUICacheObjectOnProto:(id)a3
{
  id v4 = a3;
  uiCache = self->_uiCache;
  p_uiCache = &self->_uiCache;
  if (uiCache)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ATXUICacheProtocol *)*p_uiCache proto];
      -[ATXPBBlendingModelUICacheUpdate setHomeScreenCachedSuggestion:]((uint64_t)v4, v7);
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ATXUICacheProtocol *)*p_uiCache proto];
      -[ATXPBBlendingModelUICacheUpdate setSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ATXUICacheProtocol *)*p_uiCache proto];
      -[ATXPBBlendingModelUICacheUpdate setSpotlightSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXBlendingModelUICacheUpdate setUICacheObjectOnProto:]();
    }
  }
LABEL_9:
}

- (void)setUICacheObjectOnProtoForBiome:(id)a3
{
  id v4 = a3;
  uiCache = self->_uiCache;
  p_uiCache = &self->_uiCache;
  if (uiCache)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ATXUICacheProtocol *)*p_uiCache protoForBiome];
      -[ATXPBBlendingModelUICacheUpdate setHomeScreenCachedSuggestion:]((uint64_t)v4, v7);
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ATXUICacheProtocol *)*p_uiCache proto];
      -[ATXPBBlendingModelUICacheUpdate setSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ATXUICacheProtocol *)*p_uiCache proto];
      -[ATXPBBlendingModelUICacheUpdate setSpotlightSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXBlendingModelUICacheUpdate setUICacheObjectOnProto:]();
    }
  }
LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXBlendingModelUICacheUpdate *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXBlendingModelUICacheUpdate *)self isEqualToATXBlendingModelUICacheUpdate:v5];

  return v6;
}

- (BOOL)isEqualToATXBlendingModelUICacheUpdate:(id)a3
{
  id v4 = (id *)a3;
  uiCache = self->_uiCache;
  BOOL v6 = (ATXUICacheProtocol *)v4[3];
  if (uiCache == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = uiCache;
    char v9 = [(ATXUICacheProtocol *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if (self->_consumerSubType == *((unsigned __int8 *)v4 + 16))
  {
    clientModelCacheUpdateUUIDs = self->_clientModelCacheUpdateUUIDs;
    uint64_t v11 = (NSDictionary *)v4[4];
    if (clientModelCacheUpdateUUIDs == v11)
    {
    }
    else
    {
      uint64_t v12 = v11;
      id v13 = clientModelCacheUpdateUUIDs;
      char v14 = [(NSDictionary *)v13 isEqual:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_12;
      }
    }
    uuid = self->_uuid;
    uint64_t v16 = (NSUUID *)v4[5];
    if (uuid == v16)
    {
    }
    else
    {
      uint64_t v17 = v16;
      uint64_t v18 = uuid;
      char v19 = [(NSUUID *)v18 isEqual:v17];

      if ((v19 & 1) == 0) {
        goto LABEL_12;
      }
    }
    BOOL v20 = self->_absoluteCacheCreationDate == *((double *)v4 + 1);
    goto LABEL_13;
  }
LABEL_12:
  BOOL v20 = 0;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ATXUICacheProtocol *)self->_uiCache hash];
  uint64_t v4 = self->_consumerSubType - v3 + 32 * v3;
  uint64_t v5 = [(NSDictionary *)self->_clientModelCacheUpdateUUIDs hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSUUID *)self->_uuid hash];
  return (unint64_t)self->_absoluteCacheCreationDate - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (id)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1B3E6F520]();
    id v12 = 0;
    char v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:v6 error:&v12];
    id v10 = v12;
    id v7 = 0;
    if (!v10) {
      id v7 = v9;
    }
  }
  return v7;
}

- (id)jsonRawData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self->_clientModelCacheUpdateUUIDs;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v10 = -[NSDictionary objectForKeyedSubscript:](self->_clientModelCacheUpdateUUIDs, "objectForKeyedSubscript:", v9, (void)v17);
        uint64_t v11 = [v10 UUIDString];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  if (objc_opt_respondsToSelector())
  {
    id v12 = [(ATXUICacheProtocol *)self->_uiCache performSelector:sel_jsonRawData];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  v21[0] = @"uuid";
  id v13 = [(NSUUID *)self->_uuid UUIDString];
  v22[0] = v13;
  v21[1] = @"consumerSubType";
  char v14 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  v22[1] = v14;
  void v22[2] = v3;
  v21[2] = @"clientModelCacheUUIDs";
  v21[3] = @"uiCache";
  v22[3] = v12;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v15;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(ATXBlendingModelUICacheUpdate *)self jsonRawData];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXUICacheProtocol)uiCache
{
  return self->_uiCache;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (NSDictionary)clientModelCacheUpdateUUIDs
{
  return self->_clientModelCacheUpdateUUIDs;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_uiCache, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:.cold.4()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, v8);
}

void __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "Unable to rebuild clientModelCacheUpdateUUIDs dictionary from protobuf data because value of dictionary was nil. Client Model Id %@", v1, 0xCu);
}

- (void)setUICacheObjectOnProto:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Attempted to encode ATXBlendingModelUICacheUpdate's UICache to protobuf, but it was of unexpected type: %@", v4, v5, v6, v7, v8);
}

@end