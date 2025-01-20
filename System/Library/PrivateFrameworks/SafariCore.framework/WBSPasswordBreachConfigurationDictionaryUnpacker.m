@interface WBSPasswordBreachConfigurationDictionaryUnpacker
- (BOOL)errorOccurred;
- (BOOL)optionalBoolForKey:(id)a3 defaultValue:(BOOL)a4;
- (WBSPasswordBreachConfigurationDictionaryUnpacker)initWithDictionary:(id)a3;
- (id)URLForKey:(id)a3;
- (id)_valueOfClass:(Class)a3 forKey:(id)a4 required:(BOOL)a5;
- (id)dataFromHexStringForKey:(id)a3 expectedLength:(id)a4;
- (id)sortedUnsignedIntegerArrayForKey:(id)a3 minimumValue:(unint64_t)a4 maximumValue:(unint64_t)a5 ascending:(BOOL)a6;
- (id)stringForKey:(id)a3 minimumLength:(unint64_t)a4;
- (unint64_t)unsignedIntegerForKey:(id)a3 minimumValue:(unint64_t)a4 maximumValue:(unint64_t)a5;
@end

@implementation WBSPasswordBreachConfigurationDictionaryUnpacker

- (WBSPasswordBreachConfigurationDictionaryUnpacker)initWithDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachConfigurationDictionaryUnpacker;
  v6 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_valueOfClass:(Class)a3 forKey:(id)a4 required:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:v7];
  if (v8)
  {
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      goto LABEL_11;
    }
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:]();
    }
    goto LABEL_9;
  }
  if (v5)
  {
    objc_super v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:]();
    }
LABEL_9:
    id v9 = 0;
    self->_errorOccurred = 1;
    goto LABEL_11;
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)stringForKey:(id)a3 minimumLength:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)self _valueOfClass:objc_opt_class() forKey:v6 required:1];
  v8 = v7;
  if (v7)
  {
    if ([v7 length] < a4)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachConfigurationDictionaryUnpacker stringForKey:minimumLength:]();
      }
      self->_errorOccurred = 1;
    }
    objc_super v10 = v8;
  }
  else
  {
    objc_super v10 = &stru_1F105D3F0;
  }

  return v10;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)self _valueOfClass:objc_opt_class() forKey:v4 required:1];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      objc_super v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachConfigurationDictionaryUnpacker URLForKey:]();
      }
      self->_errorOccurred = 1;
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
    }
    id v9 = v8;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
  }

  return v9;
}

- (unint64_t)unsignedIntegerForKey:(id)a3 minimumValue:(unint64_t)a4 maximumValue:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)self _valueOfClass:objc_opt_class() forKey:v8 required:1];
  unint64_t v10 = [v9 unsignedIntegerValue];
  if (v10 < a4 || v10 > a5)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v8;
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      __int16 v19 = 2048;
      unint64_t v20 = a5;
      _os_log_error_impl(&dword_1B728F000, v12, OS_LOG_TYPE_ERROR, "Value for configuration key %@ must be between %ld and %ld (inclusive).", (uint8_t *)&v15, 0x20u);
    }
    self->_errorOccurred = 1;
  }
  unint64_t v13 = [v9 unsignedIntegerValue];

  return v13;
}

- (id)sortedUnsignedIntegerArrayForKey:(id)a3 minimumValue:(unint64_t)a4 maximumValue:(unint64_t)a5 ascending:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(WBSPasswordBreachConfigurationDictionaryUnpacker *)self _valueOfClass:objc_opt_class() forKey:v10 required:1];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = v6 - 1;
    uint64_t v15 = *(void *)v27;
    id v25 = v10;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v11);
      }
      __int16 v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v21 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        id v10 = v25;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[WBSPasswordBreachConfigurationDictionaryUnpacker sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:]();
        }
        goto LABEL_24;
      }
      unint64_t v18 = [v17 unsignedIntegerValue];
      if (v18 < a4 || v18 > a5) {
        break;
      }
      if (v6)
      {
        if (v18 < v14) {
          goto LABEL_22;
        }
      }
      else if (v18 > v14)
      {
LABEL_22:
        v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        id v10 = v25;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[WBSPasswordBreachConfigurationDictionaryUnpacker sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:]();
        }
LABEL_24:
        self->_errorOccurred = 1;

        id v20 = 0;
        goto LABEL_25;
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
        id v10 = v25;
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    v22 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    id v10 = v25;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v25;
      __int16 v32 = 2048;
      unint64_t v33 = a4;
      __int16 v34 = 2048;
      unint64_t v35 = a5;
      _os_log_error_impl(&dword_1B728F000, v22, OS_LOG_TYPE_ERROR, "Value for configuration key %@ must be between %ld and %ld (inclusive).", buf, 0x20u);
    }
    goto LABEL_24;
  }
LABEL_17:

  id v20 = v11;
LABEL_25:

  return v20;
}

- (id)dataFromHexStringForKey:(id)a3 expectedLength:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)self _valueOfClass:objc_opt_class() forKey:v6 required:1];
  if ([v8 length])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "safari_dataWithHexString:", v8);
    id v10 = v9;
    if (v7 && (uint64_t v11 = [v9 length], v11 != objc_msgSend(v7, "unsignedLongValue")))
    {
      unint64_t v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = v14;
        int v17 = 138412802;
        id v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = [v7 unsignedLongValue];
        __int16 v21 = 2048;
        uint64_t v22 = [v10 length];
        _os_log_error_impl(&dword_1B728F000, v16, OS_LOG_TYPE_ERROR, "Value for configuration key %@ has unexpected length: %lu != %lu.", (uint8_t *)&v17, 0x20u);
      }
      id v12 = 0;
      self->_errorOccurred = 1;
    }
    else
    {
      id v12 = v10;
    }
  }
  else
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachConfigurationDictionaryUnpacker dataFromHexStringForKey:expectedLength:]();
    }
    id v12 = 0;
    self->_errorOccurred = 1;
  }

  return v12;
}

- (BOOL)optionalBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)self _valueOfClass:objc_opt_class() forKey:v6 required:0];

  if (v7) {
    a4 = [v7 BOOLValue];
  }

  return a4;
}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void).cxx_destruct
{
}

- (void)_valueOfClass:forKey:required:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Configuration missing required key %@", v2, v3, v4, v5, v6);
}

- (void)_valueOfClass:forKey:required:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Value for configuration key %@ is not of expected type %@.");
}

- (void)stringForKey:minimumLength:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Value for configuration key %@ must contain at least %lu characters.");
}

- (void)URLForKey:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Value for configuration key %@ is not a valid URL.", v2, v3, v4, v5, v6);
}

- (void)sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Value for configuration key %@ must be sorted.", v2, v3, v4, v5, v6);
}

- (void)sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Value for configuration key %@ contains a non-number.", v2, v3, v4, v5, v6);
}

- (void)dataFromHexStringForKey:expectedLength:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Value for configuration key %@ is not a string.", v2, v3, v4, v5, v6);
}

@end