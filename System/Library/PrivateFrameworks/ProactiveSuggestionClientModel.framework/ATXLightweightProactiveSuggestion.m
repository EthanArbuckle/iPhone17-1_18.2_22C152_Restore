@interface ATXLightweightProactiveSuggestion
+ (id)lightWeightSuggestionDescriptionsFromLightWeightSuggestions:(id)a3;
+ (id)lightWeightSuggestionsFromProtoLightWeightSuggestions:(id)a3;
+ (id)lightWeightSuggestionsFromSuggestions:(id)a3;
+ (id)protoLightWeightSuggestionsFromLightWeightSuggestions:(id)a3;
- (ATXLightweightProactiveSuggestion)initWithExecutableIdentifier:(id)a3 executableType:(int64_t)a4 scoreSpecification:(id)a5 predictionReasons:(unint64_t)a6;
- (ATXLightweightProactiveSuggestion)initWithProactiveSuggestion:(id)a3;
- (ATXLightweightProactiveSuggestion)initWithProto:(id)a3;
- (ATXLightweightProactiveSuggestion)initWithProtoData:(id)a3;
- (ATXProactiveSuggestionScoreSpecification)scoreSpecification;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXLightweightProactiveSuggestion:(id)a3;
- (NSString)executableIdentifier;
- (id)description;
- (id)encodeAsProto;
- (id)proto;
- (int64_t)executableType;
- (unint64_t)predictionReasons;
- (unsigned)consumerSubType;
- (void)setConsumerSubType:(unsigned __int8)a3;
@end

@implementation ATXLightweightProactiveSuggestion

- (ATXLightweightProactiveSuggestion)initWithProactiveSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 executableSpecification];
  v6 = [v5 executableIdentifier];
  v7 = [v4 executableSpecification];
  uint64_t v8 = [v7 executableType];
  v9 = [v4 scoreSpecification];
  v10 = [v4 uiSpecification];

  v11 = -[ATXLightweightProactiveSuggestion initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:](self, "initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:", v6, v8, v9, [v10 predictionReasons]);
  return v11;
}

- (ATXLightweightProactiveSuggestion)initWithExecutableIdentifier:(id)a3 executableType:(int64_t)a4 scoreSpecification:(id)a5 predictionReasons:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXLightweightProactiveSuggestion;
  v13 = [(ATXLightweightProactiveSuggestion *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_executableIdentifier, a3);
    v14->_executableType = a4;
    objc_storeStrong((id *)&v14->_scoreSpecification, a5);
    v14->_predictionReasons = a6;
  }

  return v14;
}

- (id)description
{
  v2 = NSString;
  executableIdentifier = self->_executableIdentifier;
  unint64_t executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5F017A0[executableType];
  }
  v6 = [v2 stringWithFormat:@"%@ (%@)", executableIdentifier, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXLightweightProactiveSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXLightweightProactiveSuggestion *)self isEqualToATXLightweightProactiveSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXLightweightProactiveSuggestion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_executableType != *((void *)v4 + 3) || self->_predictionReasons != *((void *)v4 + 5)) {
    goto LABEL_5;
  }
  scoreSpecification = self->_scoreSpecification;
  v7 = (ATXProactiveSuggestionScoreSpecification *)*((id *)v4 + 4);
  if (scoreSpecification == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    v9 = scoreSpecification;
    BOOL v10 = [(ATXProactiveSuggestionScoreSpecification *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_5:
      char v11 = 0;
      goto LABEL_6;
    }
  }
  v13 = self->_executableIdentifier;
  v14 = v13;
  if (v13 == (NSString *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSString isEqual:](v13, "isEqual:");
  }

LABEL_6:
  return v11;
}

- (ATXLightweightProactiveSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBLightweightProactiveSuggestion alloc] initWithData:v4];

    self = [(ATXLightweightProactiveSuggestion *)self initWithProto:v5];
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
  v2 = [(ATXLightweightProactiveSuggestion *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXLightweightProactiveSuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = __atxlog_handle_blending();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v5);
      }
      v14 = 0;
      goto LABEL_44;
    }
    v5 = v4;
    uint64_t v6 = [v5 executableIdentifier];
    if (v6)
    {
      v7 = (void *)v6;
      uint64_t v8 = [v5 executableType];

      if (v8)
      {
        int v9 = [v5 hasScoreSpecification];
        BOOL v10 = [ATXProactiveSuggestionScoreSpecification alloc];
        char v11 = v10;
        if (v9)
        {
          id v12 = [v5 scoreSpecification];
          v13 = [(ATXProactiveSuggestionScoreSpecification *)v11 initWithProto:v12];

          if (!v13)
          {
            v13 = __atxlog_handle_blending();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[ATXLightweightProactiveSuggestion initWithProto:](v5);
            }
LABEL_15:
            v14 = 0;
LABEL_43:

LABEL_44:
            goto LABEL_45;
          }
        }
        else
        {
          v13 = [(ATXProactiveSuggestionScoreSpecification *)v10 initWithRawScore:0 suggestedConfidenceCategory:0.0];
        }
        v15 = [v5 executableIdentifier];
        id v16 = [v5 executableType];
        if ([v16 isEqualToString:@"Unknown"])
        {
          uint64_t v17 = 0;
        }
        else if ([v16 isEqualToString:@"App"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"Action"])
        {
          uint64_t v17 = 2;
        }
        else if ([v16 isEqualToString:@"Widget"])
        {
          uint64_t v17 = 3;
        }
        else if ([v16 isEqualToString:@"Tip"])
        {
          uint64_t v17 = 4;
        }
        else if ([v16 isEqualToString:@"AppClip"])
        {
          uint64_t v17 = 5;
        }
        else if ([v16 isEqualToString:@"Interaction"])
        {
          uint64_t v17 = 6;
        }
        else if ([v16 isEqualToString:@"ContextualAction"])
        {
          uint64_t v17 = 7;
        }
        else if ([v16 isEqualToString:@"SpotlightAction"])
        {
          uint64_t v17 = 8;
        }
        else if ([v16 isEqualToString:@"ShortcutsAction"])
        {
          uint64_t v17 = 9;
        }
        else if ([v16 isEqualToString:@"LinkAction"])
        {
          uint64_t v17 = 10;
        }
        else if ([v16 isEqualToString:@"Max"])
        {
          uint64_t v17 = 11;
        }
        else
        {
          uint64_t v17 = 0;
        }

        self = [(ATXLightweightProactiveSuggestion *)self initWithExecutableIdentifier:v15 executableType:v17 scoreSpecification:v13 predictionReasons:[v5 predictionReasons]];
        v14 = self;
        goto LABEL_43;
      }
    }
    v13 = __atxlog_handle_blending();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXLightweightProactiveSuggestion initWithProto:](v5);
    }
    goto LABEL_15;
  }
  v14 = 0;
LABEL_45:

  return v14;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setExecutableIdentifier:self->_executableIdentifier];
  unint64_t executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5F017A0[executableType];
  }
  [v3 setExecutableType:v5];

  uint64_t v6 = [(ATXProactiveSuggestionScoreSpecification *)self->_scoreSpecification proto];
  [v3 setScoreSpecification:v6];

  [v3 setPredictionReasons:self->_predictionReasons];
  return v3;
}

- (NSString)executableIdentifier
{
  return self->_executableIdentifier;
}

- (int64_t)executableType
{
  return self->_executableType;
}

- (ATXProactiveSuggestionScoreSpecification)scoreSpecification
{
  return self->_scoreSpecification;
}

- (unint64_t)predictionReasons
{
  return self->_predictionReasons;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(unsigned __int8)a3
{
  self->_consumerSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
}

+ (id)lightWeightSuggestionDescriptionsFromLightWeightSuggestions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "description", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)lightWeightSuggestionsFromProtoLightWeightSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
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
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [[ATXLightweightProactiveSuggestion alloc] initWithProto:*(void *)(*((void *)&v15 + 1) + 8 * v9)];
        if (v10)
        {
          [v4 addObject:v10];
        }
        else
        {
          char v11 = __atxlog_handle_blending();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            +[ATXLightweightProactiveSuggestion(ArrayHelpers) lightWeightSuggestionsFromProtoLightWeightSuggestions:v11];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)protoLightWeightSuggestionsFromLightWeightSuggestions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "proto", v15, (void)v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          uint8_t v13 = __atxlog_handle_blending();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_fault_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_FAULT, "Unable to generate proto for ATXLightweightProactiveSuggestion: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)lightWeightSuggestionsFromSuggestions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v11 = [ATXLightweightProactiveSuggestion alloc];
        long long v12 = -[ATXLightweightProactiveSuggestion initWithProactiveSuggestion:](v11, "initWithProactiveSuggestion:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)initWithProto:(void *)a1 .cold.1(void *a1)
{
  v2 = [a1 executableIdentifier];
  id v3 = [a1 executableType];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_0(&dword_1AE67F000, v4, v5, "%s: Returning nil because proto is missing exeId and/or exeType. (exeID %@, type %@)", v6, v7, v8, v9, 2u);
}

- (void)initWithProto:(void *)a1 .cold.2(void *a1)
{
  v2 = [a1 executableIdentifier];
  id v3 = [a1 executableType];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_0(&dword_1AE67F000, v4, v5, "%s: Returning nil because scoreSpecification initialization from proto returned nil. (exeId %@, type %@)", v6, v7, v8, v9, 2u);
}

@end