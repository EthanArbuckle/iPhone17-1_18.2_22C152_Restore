@interface UIItemProvider
- (BOOL)canLoadObjectOfClass:(Class)a3;
- (BOOL)copyFileRepresentationForTypeIdentifier:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6;
- (NSDate)modificationDate;
- (NSDictionary)teamMetadata;
- (NSNumber)size;
- (NSString)name;
- (UIItemProvider)initWithPBItem:(id)a3;
- (UIItemProvider)initWithPBItem:(id)a3 loadRequestContext:(id)a4;
- (UIItemProvider)initWithPBItem:(id)a3 loadRequestContext:(id)a4 secureRetryHandler:(id)a5;
- (id)_availableTypes;
- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3;
- (id)copyDataRepresentationForTypeIdentifier:(id)a3 completionBlock:(id)a4;
- (id)copyDataRepresentationForTypeIdentifier:(id)a3 error:(id *)a4;
- (id)copyDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)copyFileRepresentationForTypeIdentifier:(id)a3 completionBlock:(id)a4;
- (id)copyFileRepresentationForTypeIdentifier:(id)a3 error:(id *)a4;
- (id)createObjectOfClass:(Class)a3 error:(id *)a4;
- (id)getInPlaceFileRepresentationForTypeIdentifier:(id)a3 inPlace:(BOOL *)a4 error:(id *)a5;
- (id)getInPlaceFileRepresentationForTypeIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)instantiateObjectOfClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)loadObjectOfClass:(Class)a3 completionHandler:(id)a4;
- (void)copyDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (void)copyFileRepresentationForTypeIdentifier:(id)a3 toURL:(id)a4 options:(id)a5 completionBlock:(id)a6;
- (void)instantiateObjectOfClass:(Class)a3 options:(id)a4 completionBlock:(id)a5;
- (void)registerDataRepresentationForTypeIdentifier:(id)a3 loadHandler:(id)a4;
- (void)registerDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 loadHandler:(id)a5;
- (void)registerFileRepresentationForTypeIdentifier:(id)a3 fileOptions:(int64_t)a4 loadHandler:(id)a5;
- (void)registerFileRepresentationForTypeIdentifier:(id)a3 fileOptions:(int64_t)a4 options:(id)a5 loadHandler:(id)a6;
- (void)registerObject:(id)a3 options:(id)a4;
- (void)registerObjectOfClass:(Class)a3 options:(id)a4 loadHandler:(id)a5;
- (void)setTeamMetadata:(id)a3;
@end

@implementation UIItemProvider

- (UIItemProvider)initWithPBItem:(id)a3 loadRequestContext:(id)a4 secureRetryHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v33 = a4;
  id v32 = a5;
  v42.receiver = self;
  v42.super_class = (Class)UIItemProvider;
  v9 = [(UIItemProvider *)&v42 init];
  if (v9)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [v8 availableTypes];
    uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v31 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v14 = [v8 representationConformingToType:v13];
          if ([v8 isDataAvailableImmediatelyForType:v13]) {
            [(NSItemProvider *)v9 setDataAvailability:1 forTypeIdentifier:v13];
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 isDerivedRepresentation]) {
            [(NSItemProvider *)v9 setDerivedRepresentation:1 forTypeIdentifier:v13];
          }
          [v8 preferredRepresentationForType:v13];
          uint64_t v15 = PBNSPreferredRepresentationFromPB();
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke;
          v34[3] = &unk_1E52FF738;
          id v16 = v14;
          id v35 = v16;
          id v36 = v33;
          id v37 = v32;
          [(UIItemProvider *)v9 _addRepresentationType_v2:v13 preferredRepresentation:v15 loader:v34];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v17 = [v16 visibility];
            v18 = [(UIItemProvider *)v9 _representationConformingToType:v13];
            [v18 setVisibility:v17];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v11);
    }

    v19 = [v8 metadata];
    v20 = (void *)[v19 mutableCopy];

    uint64_t v21 = *MEMORY[0x1E4F88228];
    v22 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F88228]];
    if (v22)
    {
      [v20 removeObjectForKey:v21];
      [(UIItemProvider *)v9 setSuggestedName:v22];
    }
    uint64_t v23 = *MEMORY[0x1E4F88230];
    v24 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F88230]];
    if (v24)
    {
      [v20 removeObjectForKey:v23];
      [(NSItemProvider *)v9 setTeamData:v24];
    }
    uint64_t v25 = *MEMORY[0x1E4F88218];
    v26 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F88218]];
    if (v26)
    {
      [v20 removeObjectForKey:v25];
      [(UIItemProvider *)v9 _setMetadataValue:v26 forKey:v25];
    }
    uint64_t v27 = *MEMORY[0x1E4F88220];
    v28 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F88220]];
    if (v28)
    {
      [v20 removeObjectForKey:v27];
      [(UIItemProvider *)v9 _setMetadataValue:v28 forKey:v27];
    }
    if ([v20 count]) {
      [(UIItemProvider *)v9 _setMetadataValue:v20 forKey:*MEMORY[0x1E4F88210]];
    }
  }
  return v9;
}

id __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_2;
  aBlock[3] = &unk_1E52FF6E8;
  id v18 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);
  id v7 = a1[4];
  id v8 = a1[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_3;
  v12[3] = &unk_1E52FF710;
  id v15 = a1[6];
  id v13 = a1[4];
  id v14 = a1[5];
  id v16 = v6;
  id v9 = v6;
  uint64_t v10 = [v7 loadWithContext:v8 completionHandler:v12];

  return v10;
}

void __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10 = (void *)MEMORY[0x1E4F28D80];
  id v11 = a6;
  id v12 = a5;
  id v13 = a2;
  id v14 = [a3 nsURLWrapper];
  id v15 = [v10 resultWithData:v13 urlWrapper:v14 cleanupHandler:v11 error:v12];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v11 = a2;
  unint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v11 | v12) {
    goto LABEL_7;
  }
  id v16 = [v14 domain];
  if (![v16 isEqualToString:*MEMORY[0x1E4F88208]] || objc_msgSend(v14, "code") != 20)
  {

    goto LABEL_7;
  }
  uint64_t v17 = *(void *)(a1 + 48);

  if (!v17)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_8;
  }
  uint64_t v18 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_4;
  v19[3] = &unk_1E52E3298;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_8:
}

id __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_4(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) loadWithContext:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (UIItemProvider)initWithPBItem:(id)a3
{
  return [(UIItemProvider *)self initWithPBItem:a3 loadRequestContext:0 secureRetryHandler:0];
}

- (UIItemProvider)initWithPBItem:(id)a3 loadRequestContext:(id)a4
{
  return [(UIItemProvider *)self initWithPBItem:a3 loadRequestContext:a4 secureRetryHandler:0];
}

- (id)loadObjectOfClass:(Class)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__UIItemProvider_loadObjectOfClass_completionHandler___block_invoke;
  v11[3] = &unk_1E52FF760;
  id v12 = v6;
  v10.receiver = self;
  v10.super_class = (Class)UIItemProvider;
  id v7 = v6;
  id v8 = [(UIItemProvider *)&v10 loadObjectOfClass:a3 completionHandler:v11];

  return v8;
}

void __54__UIItemProvider_loadObjectOfClass_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (([MEMORY[0x1E4F1CB10] _allowsCreationOfFileURLFromItemProvider] & 1) == 0)
  {
    id v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = v11;
      if ([v8 isFileURL])
      {

        uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:0];

        id v10 = 0;
        id v5 = (id)v9;
      }
      else
      {
        id v10 = v8;
      }
      id v11 = v10;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_availableTypes
{
  if ([MEMORY[0x1E4F28D78] instancesRespondToSelector:sel__availableTypes])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIItemProvider;
    v3 = [(UIItemProvider *)&v5 _availableTypes];
  }
  else
  {
    v3 = [(UIItemProvider *)self registeredTypeIdentifiers];
  }
  return v3;
}

- (BOOL)canLoadObjectOfClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(UIItemProvider *)self _readableTypeIdentifiersForItemProviderForClass:a3];
  id v6 = (void *)MEMORY[0x1E4F28D78];
  id v7 = [(UIItemProvider *)self _availableTypes];
  id v8 = objc_msgSend(v6, "_uikit_bestMatchConformingToTypes:availableTypes:", v5, v7);
  BOOL v9 = v8 != 0;

  return v9;
}

- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(objc_class *)a3 _uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:0];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(objc_class *)a3 readableTypeIdentifiersForItemProvider];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:
  if (objc_opt_respondsToSelector())
  {
    id v7 = (void *)[(objc_class *)a3 _ui_augmentingNSItemProviderReadingClass];
    id v8 = [v7 additionalLeadingReadableTypeIdentifiersForItemProvider];
    BOOL v9 = [v7 additionalTrailingReadableTypeIdentifiersForItemProvider];
    id v10 = [v6 arrayByAddingObjectsFromArray:v9];
    uint64_t v11 = [v8 arrayByAddingObjectsFromArray:v10];

    id v6 = (void *)v11;
  }
  if ([(NSItemProvider *)self hasDerivedRepresentations])
  {
    id v12 = [(UIItemProvider *)self registeredTypeIdentifiers];
    id v13 = (void *)[v6 mutableCopy];
    while (1)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28D78], "_uikit_bestMatchConformingToTypes:availableTypes:", v13, v12);
      if (!v14
        || ![(NSItemProvider *)self isDerivedRepresentationForTypeIdentifier:v14])
      {
        break;
      }
      [v13 removeObject:v14];

      if (![v13 count]) {
        goto LABEL_17;
      }
    }

    if ([v13 count])
    {
      id v15 = v13;

      id v6 = v15;
    }
LABEL_17:
  }
  if (v6) {
    id v16 = v6;
  }
  else {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v16;

  return v17;
}

- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)-[objc_class _ui_augmentingNSItemProviderReadingClass](a3, "_ui_augmentingNSItemProviderReadingClass"), "objectWithItemProviderData:typeIdentifier:requestedClass:error:", v9, v10, a3, a6), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v11 = [(objc_class *)a3 objectWithItemProviderData:v9 typeIdentifier:v10 error:a6];
  }

  return v11;
}

- (void)registerDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 loadHandler:(id)a5
{
}

- (void)registerFileRepresentationForTypeIdentifier:(id)a3 fileOptions:(int64_t)a4 options:(id)a5 loadHandler:(id)a6
{
}

- (void)registerDataRepresentationForTypeIdentifier:(id)a3 loadHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke;
  v8[3] = &unk_1E52FF788;
  id v9 = v6;
  id v7 = v6;
  [(UIItemProvider *)self registerDataRepresentationForTypeIdentifier:a3 visibility:0 loadHandler:v8];
}

uint64_t __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke_2;
  v8[3] = &unk_1E52FF4F0;
  id v9 = v3;
  uint64_t v5 = *(void (**)(uint64_t, void *, void))(v4 + 16);
  id v6 = v3;
  v5(v4, v8, 0);

  return 0;
}

uint64_t __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerFileRepresentationForTypeIdentifier:(id)a3 fileOptions:(int64_t)a4 loadHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke;
  v10[3] = &unk_1E52FF7B0;
  id v11 = v8;
  id v9 = v8;
  [(UIItemProvider *)self registerFileRepresentationForTypeIdentifier:a3 fileOptions:a4 visibility:0 loadHandler:v10];
}

uint64_t __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke_2;
  v8[3] = &unk_1E52FE248;
  id v9 = v3;
  uint64_t v5 = *(void (**)(uint64_t, void *, void))(v4 + 16);
  id v6 = v3;
  v5(v4, v8, 0);

  return 0;
}

uint64_t __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyDataRepresentationForTypeIdentifier:(id)a3 completionBlock:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)copyDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_completionBlock___block_invoke;
  v10[3] = &unk_1E52FF4F0;
  id v11 = v7;
  id v8 = v7;
  id v9 = (id)[(UIItemProvider *)self loadDataRepresentationForTypeIdentifier:a3 completionHandler:v10];
}

uint64_t __82__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)copyDataRepresentationForTypeIdentifier:(id)a3 error:(id *)a4
{
  return [(UIItemProvider *)self copyDataRepresentationForTypeIdentifier:a3 options:0 error:a4];
}

- (id)copyDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__150;
  v29 = __Block_byref_object_dispose__150;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__150;
  uint64_t v23 = __Block_byref_object_dispose__150;
  id v24 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_error___block_invoke;
  v15[3] = &unk_1E52FF7D8;
  id v17 = &v25;
  uint64_t v18 = &v19;
  id v11 = v10;
  id v16 = v11;
  [(UIItemProvider *)self copyDataRepresentationForTypeIdentifier:v8 options:v9 completionBlock:v15];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
  {
    id v12 = (void *)v20[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __72__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)copyFileRepresentationForTypeIdentifier:(id)a3 completionBlock:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)copyFileRepresentationForTypeIdentifier:(id)a3 toURL:(id)a4 options:(id)a5 completionBlock:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_completionBlock___block_invoke;
  v14[3] = &unk_1E52FF800;
  id v15 = v9;
  id v16 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = (id)[(UIItemProvider *)self loadFileRepresentationForTypeIdentifier:a3 completionHandler:v14];
}

void __88__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = 0;
    [v8 copyItemAtURL:v5 toURL:v9 error:&v11];
    id v7 = v11;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v7 == 0, v7);
  }
}

- (id)copyFileRepresentationForTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _UITemporaryFileWithUniqueName(@"com.apple.UIKit.ItemProvider", v6, 0);
  LOBYTE(a4) = [(UIItemProvider *)self copyFileRepresentationForTypeIdentifier:v6 toURL:v7 options:0 error:a4];

  if ((a4 & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtURL:v7 error:0];

    return 0;
  }
  return v7;
}

- (BOOL)copyFileRepresentationForTypeIdentifier:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__150;
  v26 = __Block_byref_object_dispose__150;
  id v27 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_error___block_invoke;
  v18[3] = &unk_1E52FF828;
  id v20 = &v28;
  uint64_t v21 = &v22;
  id v14 = v13;
  uint64_t v19 = v14;
  [(UIItemProvider *)self copyFileRepresentationForTypeIdentifier:v10 toURL:v11 options:v12 completionBlock:v18];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    id v15 = (void *)v23[5];
    if (v15) {
      *a6 = v15;
    }
  }
  char v16 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __78__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getInPlaceFileRepresentationForTypeIdentifier:(id)a3 inPlace:(BOOL *)a4 error:(id *)a5
{
  return 0;
}

- (id)getInPlaceFileRepresentationForTypeIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)registerObject:(id)a3 options:(id)a4
{
}

- (void)registerObjectOfClass:(Class)a3 options:(id)a4 loadHandler:(id)a5
{
}

- (void)instantiateObjectOfClass:(Class)a3 options:(id)a4 completionBlock:(id)a5
{
  id v5 = [(UIItemProvider *)self loadObjectOfClass:a3 completionHandler:a5];
}

- (id)createObjectOfClass:(Class)a3 error:(id *)a4
{
  return [(UIItemProvider *)self instantiateObjectOfClass:a3 options:0 error:a4];
}

- (id)instantiateObjectOfClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__150;
  uint64_t v28 = __Block_byref_object_dispose__150;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__150;
  uint64_t v22 = __Block_byref_object_dispose__150;
  id v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__UIItemProvider_instantiateObjectOfClass_options_error___block_invoke;
  v14[3] = &unk_1E52FF850;
  char v16 = &v24;
  id v17 = &v18;
  id v10 = v9;
  id v15 = v10;
  [(UIItemProvider *)self instantiateObjectOfClass:a3 options:v8 completionBlock:v14];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
  {
    id v11 = (void *)v19[5];
    if (v11) {
      *a5 = v11;
    }
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __57__UIItemProvider_instantiateObjectOfClass_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (NSString)name
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (NSNumber)size
{
  return 0;
}

- (NSDictionary)teamMetadata
{
  return self->_teamMetadata;
}

- (void)setTeamMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end