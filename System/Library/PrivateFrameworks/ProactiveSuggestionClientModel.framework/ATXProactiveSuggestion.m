@interface ATXProactiveSuggestion
+ (BOOL)suggestionsHaveChangedFromPreviousSuggestions:(id)a3 newSuggestions:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)protoSuggestionsFromSuggestions:(id)a3;
+ (id)suggestionsFromProtoSuggestions:(id)a3;
- (ATXProactiveSuggestion)initWithClientModelSpecification:(id)a3 executableSpecification:(id)a4 uiSpecification:(id)a5 scoreSpecification:(id)a6;
- (ATXProactiveSuggestion)initWithClientModelSpecification:(id)a3 executableSpecification:(id)a4 uiSpecification:(id)a5 scoreSpecification:(id)a6 uuid:(id)a7;
- (ATXProactiveSuggestion)initWithCoder:(id)a3;
- (ATXProactiveSuggestion)initWithProto:(id)a3;
- (ATXProactiveSuggestion)initWithProtoData:(id)a3;
- (ATXProactiveSuggestionClientModelSpecification)clientModelSpecification;
- (ATXProactiveSuggestionExecutableSpecification)executableSpecification;
- (ATXProactiveSuggestionScoreSpecification)scoreSpecification;
- (ATXProactiveSuggestionUISpecification)uiSpecification;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)fuzzyIsEqualToProactiveSuggestion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForSuggestionsWidget;
- (INIntent)intent;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (NSString)appBundleIdentifier;
- (NSString)criterion;
- (NSString)suggestionIdentifier;
- (NSString)widgetBundleIdentifier;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)infoSuggestion;
- (id)jsonRawData;
- (id)proto;
- (unint64_t)applicableLayouts;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
@end

@implementation ATXProactiveSuggestion

- (ATXProactiveSuggestionExecutableSpecification)executableSpecification
{
  return self->_executableSpecification;
}

+ (id)suggestionsFromProtoSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [[ATXProactiveSuggestion alloc] initWithProto:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = __atxlog_handle_default();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
              +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](&v13, v14);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ATXProactiveSuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:].cold.7();
      }
      v21 = 0;
      goto LABEL_37;
    }
    id v5 = v4;
    if (!-[ATXPBProactiveSuggestion hasUuidString]((BOOL)v5))
    {
      uint64_t v8 = __atxlog_handle_blending();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:].cold.6();
      }
      v21 = 0;
      goto LABEL_36;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = -[ATXPBProactiveSuggestion uuidString]((uint64_t)v5);
    uint64_t v8 = [v6 initWithUUIDString:v7];

    if (!v8)
    {
      v11 = __atxlog_handle_blending();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:]();
      }
      v21 = 0;
      goto LABEL_35;
    }
    v9 = [ATXProactiveSuggestionClientModelSpecification alloc];
    v10 = -[ATXPBProactiveSuggestion clientModelSpecification]((uint64_t)v5);
    v11 = [(ATXProactiveSuggestionClientModelSpecification *)v9 initWithProto:v10];

    if (!v11)
    {
      v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:]();
      }
      v21 = 0;
      goto LABEL_34;
    }
    v12 = [ATXProactiveSuggestionExecutableSpecification alloc];
    char v13 = -[ATXPBProactiveSuggestion executableSpecification]((uint64_t)v5);
    v14 = [(ATXProactiveSuggestionExecutableSpecification *)v12 initWithProto:v13];

    if (!v14)
    {
      long long v17 = __atxlog_handle_blending();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:]();
      }
      v21 = 0;
      goto LABEL_33;
    }
    long long v15 = [ATXProactiveSuggestionUISpecification alloc];
    long long v16 = -[ATXPBProactiveSuggestion uiSpecification]((uint64_t)v5);
    long long v17 = [(ATXProactiveSuggestionUISpecification *)v15 initWithProto:v16];

    if (v17)
    {
      long long v18 = [ATXProactiveSuggestionScoreSpecification alloc];
      v19 = -[ATXPBProactiveSuggestion scoreSpecification]((uint64_t)v5);
      uint64_t v20 = [(ATXProactiveSuggestionScoreSpecification *)v18 initWithProto:v19];

      if (v20)
      {
        self = [(ATXProactiveSuggestion *)self initWithClientModelSpecification:v11 executableSpecification:v14 uiSpecification:v17 scoreSpecification:v20 uuid:v8];
        v21 = self;
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      v22 = __atxlog_handle_blending();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:].cold.5();
      }
    }
    else
    {
      uint64_t v20 = __atxlog_handle_blending();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestion initWithProto:].cold.4();
      }
    }
    v21 = 0;
    goto LABEL_32;
  }
  v21 = 0;
LABEL_38:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_uiSpecification, 0);
  objc_storeStrong((id *)&self->_executableSpecification, 0);
  objc_storeStrong((id *)&self->_clientModelSpecification, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (ATXProactiveSuggestion)initWithClientModelSpecification:(id)a3 executableSpecification:(id)a4 uiSpecification:(id)a5 scoreSpecification:(id)a6 uuid:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXProactiveSuggestion;
  long long v17 = [(ATXProactiveSuggestion *)&v21 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientModelSpecification, a3);
    objc_storeStrong((id *)&v18->_executableSpecification, a4);
    objc_storeStrong((id *)&v18->_uiSpecification, a5);
    objc_storeStrong((id *)&v18->_scoreSpecification, a6);
    objc_storeStrong((id *)&v18->_uuid, a7);
  }

  return v18;
}

- (id)infoSuggestion
{
  v2 = [(ATXProactiveSuggestion *)self executableSpecification];
  id v3 = [v2 executableObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestion(ATXProactiveCardSuggestionClient) infoSuggestion](v5);
    }

    id v4 = 0;
  }

  return v4;
}

- (NSString)appBundleIdentifier
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  id v3 = [v2 appBundleIdentifier];

  return (NSString *)v3;
}

- (NSString)widgetBundleIdentifier
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  id v3 = [v2 widgetBundleIdentifier];

  return (NSString *)v3;
}

- (NSString)criterion
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  id v3 = [v2 criterion];

  return (NSString *)v3;
}

- (unint64_t)applicableLayouts
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  unint64_t v3 = [v2 layouts];

  return v3;
}

- (NSString)suggestionIdentifier
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  unint64_t v3 = [v2 suggestionIdentifier];

  return (NSString *)v3;
}

- (NSDate)startDate
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  unint64_t v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  unint64_t v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (INIntent)intent
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  unint64_t v3 = [v2 intent];

  return (INIntent *)v3;
}

- (NSDictionary)metadata
{
  v2 = [(ATXProactiveSuggestion *)self infoSuggestion];
  unint64_t v3 = [v2 metadata];

  return (NSDictionary *)v3;
}

- (ATXProactiveSuggestion)initWithClientModelSpecification:(id)a3 executableSpecification:(id)a4 uiSpecification:(id)a5 scoreSpecification:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = [(ATXProactiveSuggestion *)self initWithClientModelSpecification:v13 executableSpecification:v12 uiSpecification:v11 scoreSpecification:v10 uuid:v14];

  return v15;
}

- (BOOL)isValidForSuggestionsWidget
{
  int64_t v3 = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification executableType];
  if (v3) {
    LOBYTE(v3) = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification executableType] != 3&& [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification executableType] != 4&& [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification executableType] != 11;
  }
  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  clientModelSpecification = self->_clientModelSpecification;
  id v5 = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification executableIdentifier];
  id v6 = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification executableDescription];
  uint64_t v7 = (void *)[v3 initWithFormat:@"Client Model Spec: %@   Executable ID: %@   Executable Description: %@   UI Spec: %@   Score Spec: %@", clientModelSpecification, v5, v6, self->_uiSpecification, self->_scoreSpecification];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXProactiveSuggestion allocWithZone:a3];
  id v5 = (void *)[(ATXProactiveSuggestionClientModelSpecification *)self->_clientModelSpecification copy];
  id v6 = (void *)[(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification copy];
  uint64_t v7 = (void *)[(ATXProactiveSuggestionUISpecification *)self->_uiSpecification copy];
  uint64_t v8 = (void *)[(ATXProactiveSuggestionScoreSpecification *)self->_scoreSpecification copy];
  v9 = (void *)[(NSUUID *)self->_uuid copy];
  id v10 = [(ATXProactiveSuggestion *)v4 initWithClientModelSpecification:v5 executableSpecification:v6 uiSpecification:v7 scoreSpecification:v8 uuid:v9];

  return v10;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    unint64_t v4 = [(ATXProactiveSuggestionClientModelSpecification *)self->_clientModelSpecification hash];
    unint64_t v5 = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification hash] - v4 + 32 * v4;
    unint64_t v6 = [(ATXProactiveSuggestionUISpecification *)self->_uiSpecification hash] - v5 + 32 * v5;
    unint64_t result = [(ATXProactiveSuggestionScoreSpecification *)self->_scoreSpecification hash] - v6 + 32 * v6;
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ATXProactiveSuggestion *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      clientModelSpecification = self->_clientModelSpecification;
      uint64_t v7 = v5->_clientModelSpecification;
      if (clientModelSpecification == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        v9 = clientModelSpecification;
        BOOL v10 = [(ATXProactiveSuggestionClientModelSpecification *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_19;
        }
      }
      executableSpecification = self->_executableSpecification;
      id v13 = v5->_executableSpecification;
      if (executableSpecification == v13)
      {
      }
      else
      {
        id v14 = v13;
        id v15 = executableSpecification;
        BOOL v16 = [(ATXProactiveSuggestionExecutableSpecification *)v15 isEqual:v14];

        if (!v16) {
          goto LABEL_19;
        }
      }
      uiSpecification = self->_uiSpecification;
      long long v18 = v5->_uiSpecification;
      if (uiSpecification == v18)
      {
      }
      else
      {
        v19 = v18;
        id v20 = uiSpecification;
        BOOL v21 = [(ATXProactiveSuggestionUISpecification *)v20 isEqual:v19];

        if (!v21) {
          goto LABEL_19;
        }
      }
      scoreSpecification = self->_scoreSpecification;
      v23 = v5->_scoreSpecification;
      if (scoreSpecification == v23)
      {
      }
      else
      {
        v24 = v23;
        v25 = scoreSpecification;
        BOOL v26 = [(ATXProactiveSuggestionScoreSpecification *)v25 isEqual:v24];

        if (!v26)
        {
LABEL_19:
          char v11 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      v27 = self->_uuid;
      v28 = v27;
      if (v27 == v5->_uuid) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSUUID isEqual:](v27, "isEqual:");
      }

      goto LABEL_25;
    }
    char v11 = 0;
  }
LABEL_26:

  return v11;
}

- (BOOL)fuzzyIsEqualToProactiveSuggestion:(id)a3
{
  unint64_t v4 = (ATXProactiveSuggestion *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    unint64_t v5 = [(ATXProactiveSuggestion *)self clientModelSpecification];
    unint64_t v6 = [(ATXProactiveSuggestion *)v4 clientModelSpecification];
    int v7 = [v5 fuzzyIsEqualToClientModelSpecification:v6];

    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v8 = [(ATXProactiveSuggestion *)self executableSpecification];
    v9 = [(ATXProactiveSuggestion *)v4 executableSpecification];
    int v10 = [v8 fuzzyIsEqualToExecutableSpecification:v9];

    if (!v10) {
      goto LABEL_7;
    }
    char v11 = [(ATXProactiveSuggestion *)self uiSpecification];
    id v12 = [(ATXProactiveSuggestion *)v4 uiSpecification];
    int v13 = [v11 fuzzyIsEqualToUISpecification:v12];

    if (v13)
    {
      id v14 = [(ATXProactiveSuggestion *)self scoreSpecification];
      id v15 = [(ATXProactiveSuggestion *)v4 scoreSpecification];
      char v16 = [v14 fuzzyIsEqualToScoreSpecification:v15];
    }
    else
    {
LABEL_7:
      char v16 = 0;
    }
  }

  return v16;
}

+ (BOOL)suggestionsHaveChangedFromPreviousSuggestions:(id)a3 newSuggestions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] || objc_msgSend(v5, "count"))
  {
    uint64_t v7 = [v6 count];
    if (v7 == [v5 count])
    {
      uint64_t v16 = 0;
      long long v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke;
      v13[3] = &unk_1E5F01398;
      id v14 = v5;
      id v15 = &v16;
      [v6 enumerateObjectsUsingBlock:v13];
      BOOL v8 = *((unsigned char *)v17 + 24) != 0;
      if (!*((unsigned char *)v17 + 24))
      {
        v9 = __atxlog_handle_blending();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:]();
        }
      }
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      int v10 = __atxlog_handle_blending();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:]();
      }

      BOOL v8 = 1;
    }
  }
  else
  {
    char v11 = __atxlog_handle_blending();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:]();
    }

    BOOL v8 = 0;
  }

  return v8;
}

void __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [v7 hash];
  v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  if (v8 == [v9 hash])
  {
    int v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    char v11 = [v7 fuzzyIsEqualToProactiveSuggestion:v10];

    if (v11) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v12 = __atxlog_handle_blending();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke_cold_1();
  }

  int v13 = __atxlog_handle_blending();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v7 uiSpecification];
    id v15 = [v14 title];
    uint64_t v16 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    long long v17 = [v16 uiSpecification];
    uint64_t v18 = [v17 title];
    int v19 = 138412546;
    id v20 = v15;
    __int16 v21 = 2112;
    v22 = v18;
    _os_log_debug_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_DEBUG, "Blending: New suggestion title: %@, Previous suggestion title: %@.", (uint8_t *)&v19, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;
LABEL_10:
}

- (id)encodeAsProto
{
  v2 = [(ATXProactiveSuggestion *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXProactiveSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBProactiveSuggestion alloc] initWithData:v4];

    self = [(ATXProactiveSuggestion *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  id v4 = [(ATXProactiveSuggestionClientModelSpecification *)self->_clientModelSpecification proto];
  -[ATXPBProactiveSuggestion setClientModelSpecification:]((uint64_t)v3, v4);

  id v5 = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification proto];
  -[ATXPBProactiveSuggestion setExecutableSpecification:]((uint64_t)v3, v5);

  id v6 = [(ATXProactiveSuggestionScoreSpecification *)self->_scoreSpecification proto];
  -[ATXPBProactiveSuggestion setScoreSpecification:]((uint64_t)v3, v6);

  id v7 = [(ATXProactiveSuggestionUISpecification *)self->_uiSpecification proto];
  -[ATXPBProactiveSuggestion setUiSpecification:]((uint64_t)v3, v7);

  uint64_t v8 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBProactiveSuggestion setUuidString:]((uint64_t)v3, v8);

  v9 = -[ATXPBProactiveSuggestion uuidString]((uint64_t)v3);

  if (!v9)
  {
    int v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      [(ATXProactiveSuggestion *)(uint64_t *)&self->_uuid proto];
    }
  }
  return v3;
}

+ (id)protoSuggestionsFromSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) proto];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            char v11 = __atxlog_handle_default();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
              +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](&v13, v14);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
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
    long long v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      long long v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(ATXProactiveSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  uint64_t v6 = [(ATXProactiveSuggestion *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"uuid";
  id v3 = [(NSUUID *)self->_uuid UUIDString];
  v11[0] = v3;
  v10[1] = @"clientModelSpecification";
  id v4 = [(ATXProactiveSuggestionClientModelSpecification *)self->_clientModelSpecification jsonRawData];
  v11[1] = v4;
  v10[2] = @"uiSpecification";
  id v5 = [(ATXProactiveSuggestionUISpecification *)self->_uiSpecification jsonRawData];
  v11[2] = v5;
  v10[3] = @"scoreSpecification";
  uint64_t v6 = [(ATXProactiveSuggestionScoreSpecification *)self->_scoreSpecification jsonRawData];
  v11[3] = v6;
  v10[4] = @"executableSpecification";
  uint64_t v7 = [(ATXProactiveSuggestionExecutableSpecification *)self->_executableSpecification jsonRawData];
  v11[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (ATXProactiveSuggestionClientModelSpecification)clientModelSpecification
{
  return self->_clientModelSpecification;
}

- (ATXProactiveSuggestionUISpecification)uiSpecification
{
  return self->_uiSpecification;
}

- (ATXProactiveSuggestionScoreSpecification)scoreSpecification
{
  return self->_scoreSpecification;
}

+ (void)suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AE67F000, v0, v1, "Blending: New suggestions and previous suggestions were both empty.", v2, v3, v4, v5, v6);
}

+ (void)suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AE67F000, v0, v1, "Blending: New suggestions and previous suggestions were the same.", v2, v3, v4, v5, v6);
}

+ (void)suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:.cold.3()
{
  OUTLINED_FUNCTION_5();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = [v2 count];
  __int16 v5 = 2048;
  uint64_t v6 = [v1 count];
  _os_log_debug_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEBUG, "Blending: New suggestions and previous suggestions have different counts. New %lu, Previous %lu.", (uint8_t *)&v3, 0x16u);
}

void __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AE67F000, v0, v1, "Blending: New suggestions and previous suggestions have at least one different suggestion.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because uuid was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because clientModelSpecification was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because executableSpecification was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because uiSpecification was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because scoreSpecification was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because the recovered PBCodable didn't have a uuidString.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.7()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_1(&dword_1AE67F000, v4, v5, "Unable to construct class %@ from ProtoBuf object. Protobuf object was of class: %@", v6, v7, v8, v9, v10);
}

- (void)proto
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Proto uuidString not set for Proactive Suggestion with UUID: %@. Suggestion: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)suggestionsFromProtoSuggestions:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  _os_log_fault_impl(&dword_1AE67F000, v2, OS_LOG_TYPE_FAULT, "Unable to construct class ATXProactiveSuggestion from ProtoBuf object. Unarchived suggestion from proto was nil.", v3, 2u);
}

+ (void)protoSuggestionsFromSuggestions:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  _os_log_fault_impl(&dword_1AE67F000, v2, OS_LOG_TYPE_FAULT, "Unable to construct class ProtoBuf object from ATXProactiveSuggestion. Archived suggestion was nil.", v3, 2u);
}

@end