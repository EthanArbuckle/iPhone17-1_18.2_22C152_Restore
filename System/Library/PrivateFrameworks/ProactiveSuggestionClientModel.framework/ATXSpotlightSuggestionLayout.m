@interface ATXSpotlightSuggestionLayout
+ (BOOL)isValidInputWithCollections:(id)a3 scores:(id)a4;
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestion)highestConfidenceSuggestion;
- (ATXSpotlightSuggestionLayout)initWithCoder:(id)a3;
- (ATXSpotlightSuggestionLayout)initWithCollections:(id)a3 scores:(id)a4 uuid:(id)a5;
- (ATXSpotlightSuggestionLayout)initWithProto:(id)a3;
- (ATXSpotlightSuggestionLayout)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSpotlightSuggestionLayout:(id)a3;
- (NSArray)collections;
- (NSArray)scores;
- (NSUUID)uuid;
- (id)compactDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setUuid:(id)a3;
@end

@implementation ATXSpotlightSuggestionLayout

- (ATXSpotlightSuggestionLayout)initWithCollections:(id)a3 scores:(id)a4 uuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXSpotlightSuggestionLayout;
  v11 = [(ATXSpotlightSuggestionLayout *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    collections = v11->_collections;
    v11->_collections = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    scores = v11->_scores;
    v11->_scores = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_uuid, a5);
  }

  return v11;
}

- (ATXProactiveSuggestion)highestConfidenceSuggestion
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = self->_collections;
  uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  v3 = 0;
  v4 = 0;
  if (v23)
  {
    uint64_t v5 = 0;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v25 = [v7 suggestions];
        uint64_t v8 = [v25 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v24 = i;
          uint64_t v10 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v25);
              }
              uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if (v5 + j >= [(NSArray *)self->_scores count])
              {
                v5 += j;
                goto LABEL_19;
              }
              v13 = [(NSArray *)self->_scores objectAtIndexedSubscript:v5 + j];
              uint64_t v14 = v13;
              if (!v4 || ([v13 doubleValue], double v16 = v15, objc_msgSend(v4, "doubleValue"), v16 > v17))
              {
                id v18 = v14;

                id v19 = v12;
                v3 = v19;
                v4 = v18;
              }
            }
            uint64_t v9 = [v25 countByEnumeratingWithState:&v26 objects:v34 count:16];
            v5 += j;
            if (v9) {
              continue;
            }
            break;
          }
LABEL_19:
          uint64_t i = v24;
        }
      }
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  return (ATXProactiveSuggestion *)v3;
}

+ (BOOL)isValidInputWithCollections:(id)a3 scores:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) suggestions];
        v9 += [v12 count];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  BOOL v13 = v9 == [v6 count];

  return v13;
}

- (id)compactDescription
{
  return @"ATXSpotlightLayout";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ATXSpotlightSuggestionLayout allocWithZone:a3];
  collections = self->_collections;
  scores = self->_scores;
  uuid = self->_uuid;
  return [(ATXSpotlightSuggestionLayout *)v4 initWithCollections:collections scores:scores uuid:uuid];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSpotlightSuggestionLayout *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSpotlightSuggestionLayout *)self isEqualToATXSpotlightSuggestionLayout:v5];

  return v6;
}

- (BOOL)isEqualToATXSpotlightSuggestionLayout:(id)a3
{
  v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSUUID *)v4[1];
  if (uuid == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = uuid;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  collections = self->_collections;
  v11 = (NSArray *)v4[2];
  if (collections == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    BOOL v13 = collections;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  long long v16 = self->_scores;
  long long v17 = v16;
  if (v16 == v4[3]) {
    char v15 = 1;
  }
  else {
    char v15 = -[NSArray isEqual:](v16, "isEqual:");
  }

LABEL_13:
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSpotlightSuggestionLayout *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSpotlightSuggestionLayout)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_default();
  uint64_t v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"protobufData" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXSpotlightSuggestionLayout" errorCode:-1 logHandle:v7];

  char v9 = [(ATXSpotlightSuggestionLayout *)self initWithProtoData:v8];
  return v9;
}

- (id)encodeAsProto
{
  v2 = [(ATXSpotlightSuggestionLayout *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXSpotlightSuggestionLayout)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 collections];
      uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v5 scoresCount])
      {
        unint64_t v9 = 0;
        do
        {
          [v5 scoresAtIndex:v9];
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v8 addObject:v10];

          ++v9;
        }
        while ([v5 scoresCount] > v9);
      }
      if (+[ATXSpotlightSuggestionLayout isValidInputWithCollections:v7 scores:v8])
      {
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v12 = [v5 uuidString];
        BOOL v13 = (void *)[v11 initWithUUIDString:v12];
        self = [(ATXSpotlightSuggestionLayout *)self initWithCollections:v7 scores:v8 uuid:v13];

        char v14 = self;
      }
      else
      {
        char v15 = __atxlog_handle_blending();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[ATXSpotlightSuggestionLayout initWithProto:](v15);
        }

        char v14 = 0;
      }
    }
    else
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v5);
      }
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

ATXSpotlightSuggestionCollection *__46__ATXSpotlightSuggestionLayout_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXSpotlightSuggestionCollection alloc] initWithProto:v2];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __46__ATXSpotlightSuggestionLayout_initWithProto___block_invoke_cold_1(v5);
    }
  }
  return v3;
}

- (ATXSpotlightSuggestionLayout)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBSpotlightSuggestionLayout alloc] initWithData:v4];

    self = [(ATXSpotlightSuggestionLayout *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuidString:v4];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_collections, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = self->_collections;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v26 + 1) + 8 * v10) proto];
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          uint64_t v12 = __atxlog_handle_default();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            [(ATXSpotlightSuggestionLayout *)&buf proto];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  BOOL v13 = (void *)[v5 copy];
  [v3 setCollections:v13];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v14 = self->_scores;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "doubleValue", (void)v20);
        objc_msgSend(v3, "addScores:");
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v16);
  }

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSArray)collections
{
  return self->_collections;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Attempting to decode ATXPBSpotlightSuggestionLayout from proto failed because the count of suggestions and scores should be the same", v1, 2u);
}

void __46__ATXSpotlightSuggestionLayout_initWithProto___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Attempting to decode ATXPBSpotlightSuggestionLayout from proto failed because the recovered PBCodable had an unrecoverable ATXSpotlightSuggestionCollection.", v1, 2u);
}

- (void)proto
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Unable to construct class ProtoBuf object from ATXProactiveSuggestion. Archived suggestion was nil.", buf, 2u);
}

@end