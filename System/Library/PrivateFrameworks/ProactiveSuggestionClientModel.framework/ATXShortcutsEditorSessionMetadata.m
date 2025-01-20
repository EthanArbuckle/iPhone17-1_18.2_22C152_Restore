@interface ATXShortcutsEditorSessionMetadata
+ (BOOL)supportsSecureCoding;
- (ATXShortcutsEditorSessionMetadata)initWithCoder:(id)a3;
- (ATXShortcutsEditorSessionMetadata)initWithNumStepsInShortcutAtStart:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXShortcutsEditorSessionMetadata:(id)a3;
- (BOOL)isLastSession;
- (BOOL)stepWasManuallyAdded;
- (NSString)description;
- (unint64_t)hash;
- (unint64_t)numStepsInShortcutAtEnd;
- (unint64_t)numStepsInShortcutAtStart;
- (void)encodeWithCoder:(id)a3;
- (void)setIsLastSession:(BOOL)a3;
- (void)setNumStepsInShortcutAtEnd:(unint64_t)a3;
- (void)setNumStepsInShortcutAtStart:(unint64_t)a3;
- (void)setStepWasManuallyAdded:(BOOL)a3;
@end

@implementation ATXShortcutsEditorSessionMetadata

- (ATXShortcutsEditorSessionMetadata)initWithNumStepsInShortcutAtStart:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXShortcutsEditorSessionMetadata;
  result = [(ATXShortcutsEditorSessionMetadata *)&v5 init];
  if (result) {
    result->_numStepsInShortcutAtStart = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t numStepsInShortcutAtStart = self->_numStepsInShortcutAtStart;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInteger:numStepsInShortcutAtStart];
  [v6 encodeObject:v7 forKey:@"numStepsInShortcutAtStart"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_numStepsInShortcutAtEnd];
  [v6 encodeObject:v8 forKey:@"numStepsInShortcutAtEnd"];

  v9 = [NSNumber numberWithBool:self->_stepWasManuallyAdded];
  [v6 encodeObject:v9 forKey:@"stepWasManuallyAdded"];

  id v10 = [NSNumber numberWithBool:self->_isLastSession];
  [v6 encodeObject:v10 forKey:@"isLastSession"];
}

- (ATXShortcutsEditorSessionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_feedback();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"numStepsInShortcutAtStart" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v7];

  if (v8 || ([v4 error], v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
  {
    v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    v11 = __atxlog_handle_feedback();
    v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"numStepsInShortcutAtEnd" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v11];

    if (!v12)
    {
      v23 = [v4 error];

      if (v23)
      {
        v16 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[ATXShortcutsEditorSessionMetadata initWithCoder:](v4);
        }
        v21 = 0;
        goto LABEL_23;
      }
    }
    v13 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v14 = objc_opt_class();
    v15 = __atxlog_handle_feedback();
    v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"stepWasManuallyAdded" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v15];

    if (v16 || ([v4 error], v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
    {
      v17 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v18 = objc_opt_class();
      v19 = __atxlog_handle_feedback();
      v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"isLastSession" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v19];

      if (v20
        || ([v4 error], v25 = objc_claimAutoreleasedReturnValue(), v25, !v25))
      {
        self = -[ATXShortcutsEditorSessionMetadata initWithNumStepsInShortcutAtStart:](self, "initWithNumStepsInShortcutAtStart:", [v8 unsignedIntegerValue]);
        [(ATXShortcutsEditorSessionMetadata *)self setNumStepsInShortcutAtEnd:[v12 unsignedIntegerValue]];
        [(ATXShortcutsEditorSessionMetadata *)self setStepWasManuallyAdded:[v16 BOOLValue]];
        [(ATXShortcutsEditorSessionMetadata *)self setIsLastSession:[v20 BOOLValue]];
        v21 = self;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v26 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[ATXShortcutsEditorSessionMetadata initWithCoder:](v4);
      }
    }
    else
    {
      v20 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[ATXShortcutsEditorSessionMetadata initWithCoder:](v4);
      }
    }
    v21 = 0;
    goto LABEL_22;
  }
  v12 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[ATXShortcutsEditorSessionMetadata initWithCoder:].cold.4(v4);
  }
  v21 = 0;
LABEL_24:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_numStepsInShortcutAtEnd - self->_numStepsInShortcutAtStart + 32 * self->_numStepsInShortcutAtStart;
  uint64_t v3 = self->_stepWasManuallyAdded - v2 + 32 * v2;
  return self->_isLastSession - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXShortcutsEditorSessionMetadata *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXShortcutsEditorSessionMetadata *)self isEqualToATXShortcutsEditorSessionMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXShortcutsEditorSessionMetadata:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  BOOL v5 = *(_OWORD *)&self->_numStepsInShortcutAtStart == *((_OWORD *)v4 + 1)
    && self->_stepWasManuallyAdded == v4[8]
    && self->_isLastSession == v4[9];

  return v5;
}

- (NSString)description
{
  uint64_t v3 = (void *)MEMORY[0x1B3E6F520](self, a2);
  id v4 = [NSString alloc];
  BOOL v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  v7 = (void *)[v4 initWithFormat:@"%@: \nnumStepsInShortcutAtStart: %lu \nnumStepsInShortcutAtEnd: %lu \nstepWasManaullyAdded: %{BOOL}d \nisLastSession: %{BOOL}d \n", v6, self->_numStepsInShortcutAtStart, self->_numStepsInShortcutAtEnd, self->_stepWasManuallyAdded, self->_isLastSession];

  return (NSString *)v7;
}

- (unint64_t)numStepsInShortcutAtStart
{
  return self->_numStepsInShortcutAtStart;
}

- (void)setNumStepsInShortcutAtStart:(unint64_t)a3
{
  self->_unint64_t numStepsInShortcutAtStart = a3;
}

- (unint64_t)numStepsInShortcutAtEnd
{
  return self->_numStepsInShortcutAtEnd;
}

- (void)setNumStepsInShortcutAtEnd:(unint64_t)a3
{
  self->_numStepsInShortcutAtEnd = a3;
}

- (BOOL)stepWasManuallyAdded
{
  return self->_stepWasManuallyAdded;
}

- (void)setStepWasManuallyAdded:(BOOL)a3
{
  self->_stepWasManuallyAdded = a3;
}

- (BOOL)isLastSession
{
  return self->_isLastSession;
}

- (void)setIsLastSession:(BOOL)a3
{
  self->_isLastSession = a3;
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Unable to deserialize boxedIsLastSession in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Unable to deserialize boxedStepWasManuallyAdded in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Unable to deserialize boxedNumStepsInShortcutAtEnd in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Unable to deserialize numStepsInShortcutAtStart in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);
}

@end