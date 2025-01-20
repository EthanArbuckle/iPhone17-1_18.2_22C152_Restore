@interface SYDocumentAttributes
+ (BOOL)_removeDocumentAttributesForFileAtURL:(id)a3 keepDocumentRelatedUniqueIdentifierKey:(BOOL)a4 error:(id *)a5;
+ (BOOL)removeDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)documentAttributesForFileAtURL:(id)a3;
+ (id)documentAttributesForFileAtURL:(id)a3 error:(id *)a4;
+ (id)documentAttributesFromData:(id)a3;
+ (id)documentAttributesFromData:(id)a3 error:(id *)a4;
+ (void)_removeDocumentAttributesForFileAtURL:(int)a3 keepDocumentRelatedUniqueIdentifierKey:(void *)a4 completion:;
+ (void)fetchDocumentAttributesForFileAtURL:(id)a3 completion:(id)a4;
- (BOOL)saveToFileURL:(id)a3 additionalAttributes:(id)a4 error:(id *)a5;
- (BOOL)saveToFileURL:(id)a3 error:(id *)a4;
- (NSDate)receivedDate;
- (NSString)indexKey;
- (NSString)sourceBundleIdentifier;
- (NSURL)originalFileURL;
- (SYDocumentAttributes)initWithCoder:(id)a3;
- (SYDocumentAttributes)initWithSourceBundleIdentifier:(id)a3 indexKey:(id)a4 originalFileURL:(id)a5 receivedDate:(id)a6 sender:(id)a7;
- (SYDocumentSender)sender;
- (id)dataRepresentationWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithSourceBundleIdentifier:(uint64_t)a3 indexKey:(uint64_t)a4 fileURL:(uint64_t)a5 receivedDate:(uint64_t)a6 sender:;
- (void)saveToFileURL:(id)a3 additionalAttributes:(id)a4 completion:(id)a5;
@end

@implementation SYDocumentAttributes

+ (id)documentAttributesFromData:(id)a3
{
  return (id)[a1 documentAttributesFromData:a3 error:0];
}

+ (id)documentAttributesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 length])
  {
    id v12 = 0;
    v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v12];
    id v9 = v12;
    if (!v8)
    {
      v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[SYDocumentAttributes documentAttributesFromData:error:]((objc_class *)a1, (uint64_t)v9, v10);
      }

      if (a4 && v9) {
        *a4 = v9;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)saveToFileURL:(id)a3 error:(id *)a4
{
  return [(SYDocumentAttributes *)self saveToFileURL:a3 additionalAttributes:0 error:a4];
}

- (BOOL)saveToFileURL:(id)a3 additionalAttributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_error___block_invoke;
  v15[3] = &unk_1E64638F0;
  v17 = &v18;
  v11 = v10;
  v16 = v11;
  [(SYDocumentAttributes *)self saveToFileURL:v8 additionalAttributes:v9 completion:v15];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = (void *)v19[5];
  if (a5 && v12)
  {
    *a5 = v12;
    id v12 = (void *)v19[5];
  }
  BOOL v13 = v12 == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __74__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)saveToFileURL:(id)a3 additionalAttributes:(id)a4 completion:(id)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"fileURL must not be nil" userInfo:0];
    objc_exception_throw(v20);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke;
  v25[3] = &unk_1E64636F0;
  id v11 = v10;
  id v26 = v11;
  id v12 = (void (**)(void, void))MEMORY[0x1C8769940](v25);
  id v24 = 0;
  BOOL v13 = [(SYDocumentAttributes *)self dataRepresentationWithError:&v24];
  id v14 = v24;
  if (v13)
  {
    v27[0] = @"com.apple.synapse:DocumentAttributes";
    v27[1] = @"SYDocumentRelatedUniqueIdentifierKey";
    v28[0] = v13;
    v15 = [(SYDocumentAttributes *)self indexKey];
    v28[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

    if (v9)
    {
      v17 = (void *)[v16 mutableCopy];
      [v17 addEntriesFromDictionary:v9];
      uint64_t v18 = [v17 copy];

      v16 = (void *)v18;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_9;
    v21[3] = &unk_1E6463918;
    id v22 = v8;
    id v23 = v12;
    +[SYFileExtendedAttributes setPrivateAttributes:v16 forFileURL:v22 completion:v21];
  }
  else
  {
    v19 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentAttributes(Writing) saveToFileURL:additionalAttributes:completion:]((uint64_t)v14, v19);
    }

    ((void (**)(void, id))v12)[2](v12, v14);
  }
}

uint64_t __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_9_cold_1(a1);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)removeDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  return [a1 _removeDocumentAttributesForFileAtURL:a3 keepDocumentRelatedUniqueIdentifierKey:0 error:a4];
}

+ (BOOL)_removeDocumentAttributesForFileAtURL:(id)a3 keepDocumentRelatedUniqueIdentifierKey:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    id v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __116__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_error___block_invoke;
    v14[3] = &unk_1E6463940;
    v16 = &v24;
    v17 = &v18;
    os_log_t v10 = v9;
    os_log_t v15 = v10;
    +[SYDocumentAttributes _removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:completion:]((uint64_t)a1, v8, v6, v14);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a5)
    {
      id v11 = (void *)v19[5];
      if (v11) {
        *a5 = v11;
      }
    }
    BOOL v12 = *((unsigned char *)v25 + 24) != 0;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    os_log_t v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SYDocumentAttributes(Writing) _removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:error:](v10);
    }
    BOOL v12 = 0;
  }

  return v12;
}

void __116__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_removeDocumentAttributesForFileAtURL:(int)a3 keepDocumentRelatedUniqueIdentifierKey:(void *)a4 completion:
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke;
  v21[3] = &unk_1E6463968;
  id v8 = v7;
  id v22 = v8;
  dispatch_semaphore_t v9 = (void *)MEMORY[0x1C8769940](v21);
  id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v27[0] = @"com.apple.synapse:DocumentAttributes";
  id v11 = [MEMORY[0x1E4F1C9B8] data];
  v27[1] = @"SYDocumentRelatedUniqueIdentifierKey";
  v28[0] = v11;
  v28[1] = &stru_1F1E16740;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  BOOL v13 = (void *)[v10 initWithDictionary:v12];

  if (a3) {
    [v13 removeObjectForKey:@"SYDocumentRelatedUniqueIdentifierKey"];
  }
  id v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    os_log_t v15 = [v6 path];
    *(_DWORD *)buf = 138478083;
    uint64_t v24 = v15;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_INFO, "Removing document attributes from file path: %{private}@, keepRelatedUniqueId: %{BOOL}d", buf, 0x12u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_16;
  v18[3] = &unk_1E6463918;
  id v19 = v6;
  id v20 = v9;
  id v16 = v9;
  id v17 = v6;
  +[SYFileExtendedAttributes setPrivateAttributes:v13 forFileURL:v17 completion:v18];
}

uint64_t __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_16_cold_1(a1);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)initWithSourceBundleIdentifier:(uint64_t)a3 indexKey:(uint64_t)a4 fileURL:(uint64_t)a5 receivedDate:(uint64_t)a6 sender:
{
  if (a1) {
    return (void *)[a1 initWithSourceBundleIdentifier:a2 indexKey:a3 originalFileURL:a4 receivedDate:a5 sender:a6];
  }
  return a1;
}

- (SYDocumentAttributes)initWithSourceBundleIdentifier:(id)a3 indexKey:(id)a4 originalFileURL:(id)a5 receivedDate:(id)a6 sender:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SYDocumentAttributes;
  id v17 = [(SYDocumentAttributes *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    sourceBundleIdentifier = v17->_sourceBundleIdentifier;
    v17->_sourceBundleIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    indexKey = v17->_indexKey;
    v17->_indexKey = (NSString *)v20;

    objc_storeStrong((id *)&v17->_originalFileURL, a5);
    objc_storeStrong((id *)&v17->_receivedDate, a6);
    objc_storeStrong((id *)&v17->_sender, a7);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDocumentAttributes *)self sourceBundleIdentifier];
  [v4 encodeObject:v5 forKey:@"SYDocumentAttributeSourceBundleIdentifierKey"];

  id v6 = [(SYDocumentAttributes *)self indexKey];
  [v4 encodeObject:v6 forKey:@"SYDocumentAttributeIndexKey"];

  id v7 = [(SYDocumentAttributes *)self originalFileURL];
  [v4 encodeObject:v7 forKey:@"SYDocumentAttributeFileURLKey"];

  id v8 = [(SYDocumentAttributes *)self receivedDate];
  [v4 encodeObject:v8 forKey:@"SYDocumentAttributesReceivedDateKey"];

  id v9 = [(SYDocumentAttributes *)self sender];
  [v4 encodeObject:v9 forKey:@"SYDocumentAttributeSenderKey"];
}

- (SYDocumentAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentAttributeSourceBundleIdentifierKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentAttributeIndexKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentAttributeFileURLKey"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentAttributesReceivedDateKey"];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] now];
  }
  id v11 = v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentAttributeSenderKey"];
  id v13 = (void *)v12;
  id v14 = 0;
  if (v5 && v6 && v7 && v11 && v12)
  {
    self = [(SYDocumentAttributes *)self initWithSourceBundleIdentifier:v5 indexKey:v6 originalFileURL:v7 receivedDate:v11 sender:v12];
    id v14 = self;
  }

  return v14;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)indexKey
{
  return self->_indexKey;
}

- (NSURL)originalFileURL
{
  return self->_originalFileURL;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (SYDocumentSender)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_originalFileURL, 0);
  objc_storeStrong((id *)&self->_indexKey, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

+ (id)documentAttributesForFileAtURL:(id)a3
{
  return (id)[a1 documentAttributesForFileAtURL:a3 error:0];
}

+ (id)documentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v22 = 0;
  objc_super v23 = &v22;
  uint64_t v24 = 0x3032000000;
  __int16 v25 = __Block_byref_object_copy__1;
  int v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__SYDocumentAttributes_Reading__documentAttributesForFileAtURL_error___block_invoke;
  v12[3] = &unk_1E6463AE0;
  id v14 = &v22;
  id v15 = &v16;
  id v8 = v7;
  id v13 = v8;
  [a1 fetchDocumentAttributesForFileAtURL:v6 completion:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    id v9 = (void *)v17[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __70__SYDocumentAttributes_Reading__documentAttributesForFileAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)fetchDocumentAttributesForFileAtURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"fileURL must not be nil" userInfo:0];
    objc_exception_throw(v11);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke;
  v15[3] = &unk_1E6463B08;
  id v16 = v6;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x1C8769940](v15);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2;
  v12[3] = &unk_1E6463B30;
  id v13 = v5;
  id v14 = v8;
  id v9 = v8;
  id v10 = v5;
  +[SYFileExtendedAttributes fetchPrivateAttributesForFileURL:v10 completion:v12];
}

uint64_t __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 objectForKey:@"com.apple.synapse:DocumentAttributes"];
    if (!v6
      || ([MEMORY[0x1E4F1CA98] null],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      id v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_3();
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v6 length])
        {
          id v14 = 0;
          id v8 = +[SYDocumentAttributes documentAttributesFromData:v6 error:&v14];
          id v9 = v14;
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_20:
          goto LABEL_21;
        }
        id v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_4();
        }
      }
      else
      {
        id v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_5();
        }
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
  int v11 = [*(id *)(a1 + 32) isFileReferenceURL];
  id v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13) {
      __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_1();
    }
  }
  else if (v13)
  {
    __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_21:
}

void __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_9_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Unable to write document attributes to: %@, error: %@", v4, v5, v6, v7, v8);
}

void __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_16_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Unable to remove document attributes from file path: %{private}@, error: %@", v4, v5, v6, v7, v8);
}

+ (void)documentAttributesFromData:(NSObject *)a3 error:.cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromClass(a1);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_ERROR, "Unable to init '%@' from data, error: %@", (uint8_t *)&v6, 0x16u);
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  v1 = [*v0 absoluteString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1C2C5F000, v2, v3, "No private attributes at URL: %{public}@, error: %@", v4, v5, v6, v7, v8);
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2();
  v1 = [*v0 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1C2C5F000, v2, v3, "No private attributes at URL: %@, error: %@", v4, v5, v6, v7, v8);
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2();
  v1 = [*(id *)(v0 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "No private attributes data at URL: %@, error: %@", v4, v5, v6, v7, v8);
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_2();
  v1 = [*(id *)(v0 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Found empty private attributes data at URL: %@, error: %@", v4, v5, v6, v7, v8);
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_2();
  v1 = [*(id *)(v0 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Unexpected private attributes data type at URL: %@, error: %@", v4, v5, v6, v7, v8);
}

@end