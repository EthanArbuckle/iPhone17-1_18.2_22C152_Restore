@interface WBSParsecSchema
+ (id)schemaForArrayWithElementSchema:(id)a3;
+ (id)schemaForArrayWithElementSchema:(id)a3 associatedError:(id)a4;
+ (id)schemaForArrayWithElementSchema:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5;
+ (id)schemaForDictionaryWithStructure:(id)a3;
+ (id)schemaForDictionaryWithStructure:(id)a3 associatedError:(id)a4;
+ (id)schemaForDictionaryWithStructure:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5;
+ (id)schemaWithConstantValue:(id)a3;
+ (id)schemaWithExpectedClass:(Class)a3;
+ (id)schemaWithExpectedClass:(Class)a3 associatedError:(id)a4;
+ (id)schemaWithExpectedClass:(Class)a3 associatedError:(id)a4 isOptional:(BOOL)a5;
- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6;
- (BOOL)isOptional;
- (Class)expectedClass;
- (NSError)associatedError;
- (id)_initWithExpectedClass:(Class)a3 associatedError:(id)a4 isOptional:(BOOL)a5;
- (id)specializedSchemaBlock;
- (id)validationBlock;
- (void)setAssociatedError:(id)a3;
- (void)setExpectedClass:(Class)a3;
- (void)setOptional:(BOOL)a3;
- (void)setSpecializedSchemaBlock:(id)a3;
- (void)setValidationBlock:(id)a3;
- (void)validateObject:(id)a3 withErrorHandler:(id)a4;
@end

@implementation WBSParsecSchema

+ (id)schemaWithConstantValue:(id)a3
{
  id v4 = a3;
  v5 = [a1 schemaWithExpectedClass:objc_opt_class()];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__WBSParsecSchema_schemaWithConstantValue___block_invoke;
  v8[3] = &unk_1E5C9E5D0;
  id v9 = v4;
  id v6 = v4;
  [v5 setValidationBlock:v8];

  return v5;
}

uint64_t __43__WBSParsecSchema_schemaWithConstantValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

+ (id)schemaForArrayWithElementSchema:(id)a3
{
  return (id)[a1 schemaForArrayWithElementSchema:a3 associatedError:0];
}

+ (id)schemaForDictionaryWithStructure:(id)a3
{
  return (id)[a1 schemaForDictionaryWithStructure:a3 associatedError:0];
}

+ (id)schemaWithExpectedClass:(Class)a3
{
  return (id)[a1 schemaWithExpectedClass:a3 associatedError:0];
}

+ (id)schemaForArrayWithElementSchema:(id)a3 associatedError:(id)a4
{
  return (id)[a1 schemaForArrayWithElementSchema:a3 associatedError:a4 isOptional:0];
}

+ (id)schemaForDictionaryWithStructure:(id)a3 associatedError:(id)a4
{
  return (id)[a1 schemaForDictionaryWithStructure:a3 associatedError:a4 isOptional:0];
}

+ (id)schemaWithExpectedClass:(Class)a3 associatedError:(id)a4
{
  return (id)[a1 schemaWithExpectedClass:a3 associatedError:a4 isOptional:0];
}

+ (id)schemaForArrayWithElementSchema:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[_WBSParsecArraySchema alloc] initWithElementSchema:v8 associatedError:v7 isOptional:v5];

  return v9;
}

+ (id)schemaForDictionaryWithStructure:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[_WBSParsecDictionarySchema alloc] initWithSchemaDictionary:v8 associatedError:v7 isOptional:v5];

  return v9;
}

+ (id)schemaWithExpectedClass:(Class)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)a1) _initWithExpectedClass:a3 associatedError:v8 isOptional:v5];

  return v9;
}

- (id)_initWithExpectedClass:(Class)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSParsecSchema;
  v10 = [(WBSParsecSchema *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_expectedClass, a3);
    objc_storeStrong((id *)&v11->_associatedError, a4);
    v11->_optional = a5;
    v12 = v11;
  }

  return v11;
}

- (void)validateObject:(id)a3 withErrorHandler:(id)a4
{
}

- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (NSError *)a5;
  v13 = (void (**)(id, id))a6;
  associatedError = self->_associatedError;
  if (!associatedError) {
    associatedError = v12;
  }
  v15 = associatedError;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        Class expectedClass = self->_expectedClass;
        v18 = v16;
        int v29 = 134349826;
        id v30 = v10;
        __int16 v31 = 2050;
        id v32 = v11;
        __int16 v33 = 2114;
        Class v34 = expectedClass;
        __int16 v35 = 2114;
        id v36 = (id)objc_opt_class();
        id v19 = v36;
        _os_log_error_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_ERROR, "Child %{public}p of parent %{public}p: expected class %{public}@, actual class %{public}@", (uint8_t *)&v29, 0x2Au);
      }
LABEL_19:
      v13[2](v13, v15);
LABEL_20:
      BOOL v24 = 0;
      goto LABEL_21;
    }
  }
  else if (!self->_optional)
  {
    v26 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:]((uint64_t)v11, v26);
    }
    goto LABEL_19;
  }
  validationBlock = (uint64_t (**)(id, id, id))self->_validationBlock;
  if (validationBlock && (validationBlock[2](validationBlock, v10, v11) & 1) == 0)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:]();
    }
    goto LABEL_19;
  }
  specializedSchemaBlock = (void (**)(id, id, id))self->_specializedSchemaBlock;
  if (specializedSchemaBlock)
  {
    v22 = specializedSchemaBlock[2](specializedSchemaBlock, v10, v11);
    v23 = v22;
    if (v22
      && ([v22 _validateChild:v10 ofParent:v11 withParentAssociatedError:v15 errorHandler:v13] & 1) == 0)
    {
      v28 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:]();
      }

      goto LABEL_20;
    }
  }
  BOOL v24 = 1;
LABEL_21:

  return v24;
}

- (id)validationBlock
{
  return self->_validationBlock;
}

- (void)setValidationBlock:(id)a3
{
}

- (id)specializedSchemaBlock
{
  return self->_specializedSchemaBlock;
}

- (void)setSpecializedSchemaBlock:(id)a3
{
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (Class)expectedClass
{
  return self->_expectedClass;
}

- (void)setExpectedClass:(Class)a3
{
}

- (NSError)associatedError
{
  return self->_associatedError;
}

- (void)setAssociatedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedError, 0);
  objc_storeStrong((id *)&self->_expectedClass, 0);
  objc_storeStrong(&self->_specializedSchemaBlock, 0);
  objc_storeStrong(&self->_validationBlock, 0);
}

- (void)_validateChild:(uint64_t)a1 ofParent:(NSObject *)a2 withParentAssociatedError:errorHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Non-optional child of parent %{public}p was missing", (uint8_t *)&v2, 0xCu);
}

- (void)_validateChild:ofParent:withParentAssociatedError:errorHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_17(&dword_1A6B5F000, v0, v1, "Specialized schema validation failed on child %{public}p of parent %{public}p");
}

- (void)_validateChild:ofParent:withParentAssociatedError:errorHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_17(&dword_1A6B5F000, v0, v1, "Primary schema validation failed on child %{public}p of parent %{public}p");
}

@end