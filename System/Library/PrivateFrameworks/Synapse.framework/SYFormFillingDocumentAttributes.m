@interface SYFormFillingDocumentAttributes
+ (BOOL)removeFormFillingDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4;
+ (id)dictionaryRepresentationWithNullValues;
+ (id)formFillingDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4;
+ (void)_formFillingDocumentAttributesForFileAtURL:(void *)a3 completion:;
+ (void)_removeFormFillingDocumentAttributesForFileAtURL:(void *)a3 completion:;
- (BOOL)formFillingCoachingDisabled;
- (BOOL)saveToFileURL:(id)a3 error:(id *)a4;
- (SYFormFillingDocumentAttributes)initWithFormFillingCoachingDisabled:(BOOL)a3;
- (id)dictionaryRepresentation;
- (uint64_t)_formFillingCoachingDisabledValueFromDictionary:(uint64_t)a1;
- (uint64_t)initWithDictionary:(uint64_t)result;
- (void)_saveToFileURL:(void *)a3 completion:;
@end

@implementation SYFormFillingDocumentAttributes

- (SYFormFillingDocumentAttributes)initWithFormFillingCoachingDisabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SYFormFillingDocumentAttributes;
  result = [(SYFormFillingDocumentAttributes *)&v5 init];
  if (result) {
    result->_formFillingCoachingDisabled = a3;
  }
  return result;
}

- (uint64_t)initWithDictionary:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    uint64_t v3 = -[SYFormFillingDocumentAttributes _formFillingCoachingDisabledValueFromDictionary:](result, a2);
    return [v2 initWithFormFillingCoachingDisabled:v3];
  }
  return result;
}

- (uint64_t)_formFillingCoachingDisabledValueFromDictionary:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [a2 objectForKey:@"SYFormFillingCoachingDisabled"];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  if (v2 == (void *)v3)
  {

    goto LABEL_7;
  }
  v4 = (void *)v3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [v2 isEqualToString:@"1"];
LABEL_8:

  return v6;
}

- (id)dictionaryRepresentation
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = @"SYFormFillingCoachingDisabled";
    int v1 = [a1 formFillingCoachingDisabled];
    v2 = @"0";
    if (v1) {
      v2 = @"1";
    }
    v5[0] = v2;
    a1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  return a1;
}

+ (id)dictionaryRepresentationWithNullValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  self;
  v2 = @"SYFormFillingCoachingDisabled";
  v3[0] = &stru_1F1E16740;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

+ (id)formFillingDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    v26 = __Block_byref_object_dispose__5;
    id v27 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__5;
    v20 = __Block_byref_object_dispose__5;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__SYFormFillingDocumentAttributes_formFillingDocumentAttributesForFileAtURL_error___block_invoke;
    v12[3] = &unk_1E64643A8;
    v14 = &v22;
    v15 = &v16;
    os_log_t v8 = v7;
    os_log_t v13 = v8;
    +[SYFormFillingDocumentAttributes _formFillingDocumentAttributesForFileAtURL:completion:]((uint64_t)a1, v6, v12);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v9 = (void *)v17[5];
      if (v9) {
        *a4 = v9;
      }
    }
    id v10 = (id)v23[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    os_log_t v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SYDocumentAttributes(Writing) _removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:error:](v8);
    }
    id v10 = 0;
  }

  return v10;
}

void __83__SYFormFillingDocumentAttributes_formFillingDocumentAttributesForFileAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  os_log_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_formFillingDocumentAttributesForFileAtURL:(void *)a3 completion:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_2;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v7 = [v6 objectForKey:@"SYFormFillingCoachingDisabled"];

  if (!v7)
  {

LABEL_2:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__SYFormFillingDocumentAttributes__formFillingDocumentAttributesForFileAtURL_completion___block_invoke;
    v11[3] = &unk_1E64643D0;
    id v12 = v5;
    +[SYFileExtendedAttributes fetchPrivateAttributesForFileURL:v4 completion:v11];
    id v6 = v12;
    goto LABEL_3;
  }
  uint64_t v8 = [v6 BOOLForKey:@"SYFormFillingCoachingDisabled"];
  uint64_t v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = @"SYFormFillingCoachingDisabled";
    __int16 v15 = 1024;
    int v16 = v8;
    _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_INFO, "Found internal setting to override %@ state to %{BOOL}d", buf, 0x12u);
  }

  if (v5)
  {
    id v10 = [[SYFormFillingDocumentAttributes alloc] initWithFormFillingCoachingDisabled:v8];
    (*((void (**)(id, SYFormFillingDocumentAttributes *, void))v5 + 2))(v5, v10, 0);
  }
LABEL_3:
}

void __89__SYFormFillingDocumentAttributes__formFillingDocumentAttributesForFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [SYFormFillingDocumentAttributes alloc];
  uint64_t v7 = v6;
  if (v6) {
    uint64_t v7 = -[SYFormFillingDocumentAttributes initWithFormFillingCoachingDisabled:](v6, "initWithFormFillingCoachingDisabled:", -[SYFormFillingDocumentAttributes _formFillingCoachingDisabledValueFromDictionary:]((uint64_t)v6, v9));
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, SYFormFillingDocumentAttributes *, id))(v8 + 16))(v8, v7, v5);
  }
}

- (BOOL)saveToFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__SYFormFillingDocumentAttributes_saveToFileURL_error___block_invoke;
  v12[3] = &unk_1E64643F8;
  v14 = &v22;
  __int16 v15 = &v16;
  uint64_t v8 = v7;
  os_log_t v13 = v8;
  -[SYFormFillingDocumentAttributes _saveToFileURL:completion:](self, v6, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    id v9 = (void *)v17[5];
    if (v9) {
      *a4 = v9;
    }
  }
  char v10 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __55__SYFormFillingDocumentAttributes_saveToFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_saveToFileURL:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = v6;
  if (a1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke;
    v14[3] = &unk_1E64636F0;
    id v15 = v6;
    uint64_t v8 = (void *)MEMORY[0x1C8769940](v14);
    id v9 = -[SYFormFillingDocumentAttributes dictionaryRepresentation](a1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2;
    v11[3] = &unk_1E6463918;
    id v12 = v5;
    id v13 = v8;
    id v10 = v8;
    +[SYFileExtendedAttributes setPrivateAttributes:v9 forFileURL:v12 completion:v11];
  }
}

uint64_t __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2_cold_1(a1);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)removeFormFillingDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__5;
    v20 = __Block_byref_object_dispose__5;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__SYFormFillingDocumentAttributes_removeFormFillingDocumentAttributesForFileAtURL_error___block_invoke;
    v12[3] = &unk_1E6463940;
    v14 = &v22;
    id v15 = &v16;
    os_log_t v8 = v7;
    os_log_t v13 = v8;
    +[SYFormFillingDocumentAttributes _removeFormFillingDocumentAttributesForFileAtURL:completion:]((uint64_t)a1, v6, v12);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      id v9 = (void *)v17[5];
      if (v9) {
        *a4 = v9;
      }
    }
    BOOL v10 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    os_log_t v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SYDocumentAttributes(Writing) _removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:error:](v8);
    }
    BOOL v10 = 0;
  }

  return v10;
}

void __89__SYFormFillingDocumentAttributes_removeFormFillingDocumentAttributesForFileAtURL_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_removeFormFillingDocumentAttributesForFileAtURL:(void *)a3 completion:
{
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = +[SYFormFillingDocumentAttributes dictionaryRepresentationWithNullValues]();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke;
  v9[3] = &unk_1E6463918;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  +[SYFileExtendedAttributes setPrivateAttributes:v6 forFileURL:v8 completion:v9];
}

void __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke_cold_1(a1);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3 == 0, v3);
  }
}

- (BOOL)formFillingCoachingDisabled
{
  return self->_formFillingCoachingDisabled;
}

void __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2_cold_1(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Unable to write form filling document attributes to: %@, error: %@", v4, v5, v6, v7, v8);
}

void __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke_cold_1(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Unable to remove form filling document attributes from file: %@, error: %@", v4, v5, v6, v7, v8);
}

@end