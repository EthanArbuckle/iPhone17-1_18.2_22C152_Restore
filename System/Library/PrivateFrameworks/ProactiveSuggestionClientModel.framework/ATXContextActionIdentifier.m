@interface ATXContextActionIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)_actionTypeFromShortcutsActionSuggestion:(id)a3;
+ (id)_stringsWithPredictionReasons:(unint64_t)a3;
+ (id)actionTypeFromSpotlightActionType:(id)a3;
+ (unint64_t)_instanceIdentifierFromShortcutsActionSuggestion:(id)a3;
- (ATXContextActionIdentifier)initWithCoder:(id)a3;
- (ATXContextActionIdentifier)initWithContext:(id)a3 subType:(id)a4 instanceIdentifierInteger:(unint64_t)a5;
- (ATXContextActionIdentifier)initWithContext:(id)a3 subtype:(id)a4 instanceIdentifier:(id)a5;
- (ATXContextActionIdentifier)initWithProactiveSuggestion:(id)a3;
- (ATXContextActionIdentifier)initWithUniqueIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXContextActionIdentifier:(id)a3;
- (NSString)context;
- (NSString)instanceId;
- (NSString)subtype;
- (NSString)uniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXContextActionIdentifier

- (NSString)uniqueIdentifier
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@:%@:%@", self->_context, self->_subtype, self->_instanceId];
  return (NSString *)v2;
}

- (ATXContextActionIdentifier)initWithContext:(id)a3 subtype:(id)a4 instanceIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXContextActionIdentifier;
  v12 = [(ATXContextActionIdentifier *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_subtype, a4);
    objc_storeStrong((id *)&v13->_instanceId, a5);
  }

  return v13;
}

- (ATXContextActionIdentifier)initWithContext:(id)a3 subType:(id)a4 instanceIdentifierInteger:(unint64_t)a5
{
  v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend([v8 alloc], "initWithFormat:", @"%lu", a5);
  v12 = [(ATXContextActionIdentifier *)self initWithContext:v10 subtype:v9 instanceIdentifier:v11];

  return v12;
}

- (ATXContextActionIdentifier)initWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 componentsSeparatedByString:@":"];
    if ([v6 count] == 3)
    {
      v7 = [v6 objectAtIndexedSubscript:0];
      v8 = [v6 objectAtIndexedSubscript:1];
      id v9 = [v6 objectAtIndexedSubscript:2];
      if (-[NSObject length](v7, "length") && [v8 length] && objc_msgSend(v9, "length"))
      {
        self = [(ATXContextActionIdentifier *)self initWithContext:v7 subtype:v8 instanceIdentifier:v9];
        id v10 = self;
      }
      else
      {
        id v11 = __atxlog_handle_blending();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[ATXContextActionIdentifier initWithUniqueIdentifier:]();
        }

        id v10 = 0;
      }
    }
    else
    {
      v7 = __atxlog_handle_blending();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[ATXContextActionIdentifier initWithUniqueIdentifier:]();
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (ATXContextActionIdentifier)initWithProactiveSuggestion:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 executableSpecification];
    uint64_t v7 = [v6 executableType];

    switch(v7)
    {
      case 0:
      case 1:
      case 3:
      case 4:
      case 6:
      case 7:
      case 10:
      case 11:
        v8 = __atxlog_handle_blending();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          -[ATXContextActionIdentifier initWithProactiveSuggestion:](v5, v8);
        }
        break;
      case 2:
        id v11 = objc_opt_class();
        v12 = [v5 uiSpecification];
        v13 = objc_msgSend(v11, "_stringsWithPredictionReasons:", objc_msgSend(v12, "predictionReasons"));
        v8 = [v13 firstObject];

        v14 = [v5 atxActionExecutableObject];
        uint64_t v15 = [v14 actionType];

        if (v15)
        {
          v16 = [v5 atxActionExecutableObject];
          uint64_t v17 = [v16 actionType];

          if (v17 == 1) {
            id v9 = @"NSUA";
          }
          else {
            id v9 = 0;
          }
        }
        else
        {
          id v9 = @"Intent";
        }
        goto LABEL_17;
      case 5:
        v18 = objc_opt_class();
        v19 = [v5 uiSpecification];
        v20 = objc_msgSend(v18, "_stringsWithPredictionReasons:", objc_msgSend(v19, "predictionReasons"));
        v8 = [v20 firstObject];

        v21 = [v5 executableSpecification];
        v22 = [v21 executableIdentifier];
        uint64_t v10 = [v22 hash];

        id v9 = @"AppClip";
        goto LABEL_18;
      case 8:
        v23 = objc_opt_class();
        v24 = [v5 uiSpecification];
        v25 = objc_msgSend(v23, "_stringsWithPredictionReasons:", objc_msgSend(v24, "predictionReasons"));
        v8 = [v25 firstObject];

        v26 = objc_opt_class();
        v27 = [v5 executableSpecification];
        v28 = [v27 executableIdentifier];
        id v9 = [v26 actionTypeFromSpotlightActionType:v28];

LABEL_17:
        v34 = [v5 executableSpecification];
        v35 = [v34 executableIdentifier];
        uint64_t v10 = [v35 hash];

        goto LABEL_18;
      case 9:
        v29 = [v5 uiSpecification];
        uint64_t v30 = [v29 predictionReasons];

        if (v30)
        {
          v31 = objc_opt_class();
          v32 = [v5 uiSpecification];
          v33 = objc_msgSend(v31, "_stringsWithPredictionReasons:", objc_msgSend(v32, "predictionReasons"));
          v8 = [v33 firstObject];

          id v9 = [(id)objc_opt_class() _actionTypeFromShortcutsActionSuggestion:v5];
          uint64_t v10 = [(id)objc_opt_class() _instanceIdentifierFromShortcutsActionSuggestion:v5];
LABEL_18:
          if ([v8 length] && [(__CFString *)v9 length] && v10)
          {
            self = [(ATXContextActionIdentifier *)self initWithContext:v8 subType:v9 instanceIdentifierInteger:v10];

            v36 = self;
            goto LABEL_27;
          }
          v37 = __atxlog_handle_blending();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            v44 = [v5 executableSpecification];
            v40 = [v44 executableClassString];
            v41 = [v5 executableSpecification];
            v42 = [v41 executableIdentifier];
            v43 = [v5 uiSpecification];
            *(_DWORD *)buf = 138413570;
            v46 = v40;
            __int16 v47 = 2112;
            v48 = v8;
            __int16 v49 = 2112;
            v50 = v9;
            __int16 v51 = 2048;
            uint64_t v52 = v10;
            __int16 v53 = 2112;
            v54 = v42;
            __int16 v55 = 2048;
            uint64_t v56 = [v43 predictionReasons];
            _os_log_fault_impl(&dword_1AE67F000, v37, OS_LOG_TYPE_FAULT, "ATXContextActionIdentifier suggestion unhandled: %@: %@, %@, %lu, %@, %llu", buf, 0x3Eu);
          }
          goto LABEL_25;
        }
        v8 = __atxlog_handle_blending();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v5 executableSpecification];
          v39 = [(__CFString *)v9 executableIdentifier];
          *(_DWORD *)buf = 138412290;
          v46 = v39;
          _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "ATXContextActionIdentifier: App Shortcut skipped: %@", buf, 0xCu);

LABEL_25:
          break;
        }
        break;
      default:
        v8 = 0;
        id v9 = 0;
        uint64_t v10 = 0;
        goto LABEL_18;
    }
  }
  else
  {
    v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "ATXContextActionIdentifier suggestion is nil", buf, 2u);
    }
  }
  v36 = 0;
LABEL_27:

  return v36;
}

+ (id)actionTypeFromSpotlightActionType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(&unk_1F0627FE8, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
      if ([v3 hasPrefix:v9]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v10 = [&unk_1F0627FE8 objectForKeyedSubscript:v9];

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  id v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    +[ATXContextActionIdentifier actionTypeFromSpotlightActionType:]();
  }

  uint64_t v10 = 0;
LABEL_14:

  return v10;
}

+ (id)_actionTypeFromShortcutsActionSuggestion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 executableSpecification];
  id v4 = [v3 executableIdentifier];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(&unk_1F0628010, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
      if ([v4 hasPrefix:v10]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = [&unk_1F0628010 objectForKeyedSubscript:v10];

    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  v12 = __atxlog_handle_blending();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    +[ATXContextActionIdentifier _actionTypeFromShortcutsActionSuggestion:]();
  }

  id v11 = 0;
LABEL_14:

  return v11;
}

+ (unint64_t)_instanceIdentifierFromShortcutsActionSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableIdentifier];
  unint64_t v6 = [v5 hash];

  uint64_t v7 = [v3 uiSpecification];
  uint64_t v8 = [v7 contextStartDate];

  if (v8)
  {
    uint64_t v9 = [v3 uiSpecification];
    uint64_t v10 = [v9 contextStartDate];
    unint64_t v6 = [v10 hash] - v6 + 32 * v6;
  }
  return v6;
}

+ (id)_stringsWithPredictionReasons:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ATXContextActionIdentifier__stringsWithPredictionReasons___block_invoke;
  v6[3] = &unk_1E5F00938;
  v6[4] = &v7;
  ATXSuggestionPredictionReasonEnumerateReasonCodes(a3, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__ATXContextActionIdentifier__stringsWithPredictionReasons___block_invoke(uint64_t a1, uint64_t a2)
{
  stringForATXSuggestionPredictionReasonCode(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXContextActionIdentifier *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXContextActionIdentifier *)self isEqualToATXContextActionIdentifier:v5];

  return v6;
}

- (BOOL)isEqualToATXContextActionIdentifier:(id)a3
{
  id v4 = (id *)a3;
  context = self->_context;
  BOOL v6 = (NSString *)v4[1];
  if (context == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = context;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  subtype = self->_subtype;
  id v11 = (NSString *)v4[2];
  if (subtype == v11)
  {
  }
  else
  {
    id v12 = v11;
    long long v13 = subtype;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  long long v16 = self->_instanceId;
  long long v17 = v16;
  if (v16 == v4[3]) {
    char v15 = 1;
  }
  else {
    char v15 = -[NSString isEqual:](v16, "isEqual:");
  }

LABEL_13:
  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_context hash];
  NSUInteger v4 = [(NSString *)self->_subtype hash] - v3 + 32 * v3;
  return [(NSString *)self->_instanceId hash] - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  context = self->_context;
  id v5 = a3;
  [v5 encodeObject:context forKey:@"context"];
  [v5 encodeObject:self->_subtype forKey:@"subtype"];
  [v5 encodeObject:self->_instanceId forKey:@"instanceId"];
}

- (ATXContextActionIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_blending();
  uint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"context" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXContextActionIdentifier" errorCode:-1 logHandle:v7];

  char v9 = [v4 error];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    long long v13 = __atxlog_handle_blending();
    char v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"subtype" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXContextActionIdentifier" errorCode:-1 logHandle:v13];

    char v15 = [v4 error];

    if (v15)
    {
      uint64_t v10 = 0;
    }
    else
    {
      long long v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = __atxlog_handle_blending();
      uint64_t v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"instanceId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXContextActionIdentifier" errorCode:-1 logHandle:v18];

      v20 = [v4 error];

      if (v20)
      {
        uint64_t v10 = 0;
      }
      else
      {
        self = [(ATXContextActionIdentifier *)self initWithContext:v8 subtype:v14 instanceIdentifier:v19];
        uint64_t v10 = self;
      }
    }
  }

  return v10;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithUniqueIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEBUG, "ATXContextActionIdentifier: expected component missing: %@", v1, 0xCu);
}

- (void)initWithUniqueIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEBUG, "ATXContextActionIdentifier: unsupported uniqueId format: %@", v1, 0xCu);
}

- (void)initWithProactiveSuggestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 executableSpecification];
  uint64_t v5 = [v4 executableType];
  uint64_t v6 = [a1 executableSpecification];
  uint64_t v7 = [v6 executableClassString];
  int v8 = 134218242;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "ATXContextActionIdentifier unsupported type: %lu, %@", (uint8_t *)&v8, 0x16u);
}

+ (void)actionTypeFromSpotlightActionType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "ATXContextActionIdentifier: unsupported Spotlight action id: %@", v1, 0xCu);
}

+ (void)_actionTypeFromShortcutsActionSuggestion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "ATXContextActionIdentifier: unsupported Shortcuts action id: %@", v1, 0xCu);
}

@end