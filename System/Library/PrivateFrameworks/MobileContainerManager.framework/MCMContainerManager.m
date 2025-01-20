@interface MCMContainerManager
+ (id)defaultManager;
- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5;
- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5 withCompletion:(id)a6;
- (MCMContainerManager)init;
- (id)_containersWithClass:(int64_t)a3 temporary:(BOOL)a4 error:(id *)a5;
- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 createIfNecessary:(BOOL)a5 existed:(BOOL *)a6 error:(id *)a7;
- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 error:(id *)a5;
- (id)containersWithClass:(int64_t)a3 error:(id *)a4;
- (id)deleteContainers:(id)a3 withCompletion:(id)a4;
- (id)temporaryContainerWithContentClass:(int64_t)a3 identifier:(id)a4 existed:(BOOL *)a5 error:(id *)a6;
- (id)temporaryContainersWithClass:(int64_t)a3 error:(id *)a4;
@end

@implementation MCMContainerManager

- (id)_containersWithClass:(int64_t)a3 temporary:(BOOL)a4 error:(id *)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v8 = 1;
  uint64_t v7 = 0;
  container_get_all_with_class_for_current_user();
  v5 = objc_opt_new();
  container_free_array_of_containers();

  return v5;
}

- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5 withCompletion:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  [v9 getLowLevelContainerObject];
  [v11 getLowLevelContainerObject];

  uint64_t v17 = MEMORY[0x263EF8330];
  id v18 = v10;
  id v12 = v10;
  uint64_t v13 = container_replace();
  if (v13 == 1)
  {
    objc_msgSend(v9, "markDeleted", v17, 3221225472, __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke, &unk_26479CF78, v18, v20);
    id v14 = 0;
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCMErrorDomain", v13, 0, v17, 3221225472, __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke, &unk_26479CF78, v18, v20);
    id v14 = v15;
    if (a5 && v15)
    {
      id v14 = v15;
      *a5 = v14;
    }
  }

  return v14 == 0;
}

uint64_t __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:a2 userInfo:0];
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5
{
  return [(MCMContainerManager *)self replaceContainer:a3 withContainer:a4 error:a5 withCompletion:0];
}

- (id)deleteContainers:(id)a3 withCompletion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  size_t v7 = [v5 count];
  size_t v8 = v7;
  if (v7 <= 1) {
    size_t v7 = 1;
  }
  id v9 = malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
  __s = v9;
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      id v11 = [v5 objectAtIndex:i];
      v9[i] = [v11 getLowLevelContainerObject];
    }
  }
  uint64_t v21 = MEMORY[0x263EF8330];
  id v12 = v6;
  uint64_t v13 = container_delete_array_of_containers();
  if (v13 != 1)
  {
    v19 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCMErrorDomain", v13, 0, v21, 3221225472, __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke, &unk_26479CF78, v12, __s);
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v5;
  uint64_t v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v24, 16, v21, 3221225472, __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke, &unk_26479CF78, v12, __s);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * j) markDeleted];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v16);
  }

  v19 = 0;
  if (v9)
  {
LABEL_17:
    free(v9);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
LABEL_18:

  return v19;
}

uint64_t __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:a2 userInfo:0];
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (id)temporaryContainersWithClass:(int64_t)a3 error:(id *)a4
{
  return [(MCMContainerManager *)self _containersWithClass:a3 temporary:1 error:a4];
}

- (id)containersWithClass:(int64_t)a3 error:(id *)a4
{
  return [(MCMContainerManager *)self _containersWithClass:a3 temporary:0 error:a4];
}

- (id)temporaryContainerWithContentClass:(int64_t)a3 identifier:(id)a4 existed:(BOOL *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = [_containerClassForContentClass(a3) temporaryContainerWithIdentifier:v9 existed:a5 error:a6];

  return v10;
}

- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 createIfNecessary:(BOOL)a5 existed:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = [_containerClassForContentClass(a3) containerWithIdentifier:v11 createIfNecessary:v9 existed:a6 error:a7];

  return v12;
}

- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  size_t v8 = [_containerClassForContentClass(a3) containerWithIdentifier:v7 error:a5];

  return v8;
}

- (MCMContainerManager)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_fault_impl(&dword_226325000, v2, OS_LOG_TYPE_FAULT, "Aborting because you tried to init MobileContainerManager singleton!", v3, 2u);
  }

  abort();
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_121);
  }
  v2 = (void *)defaultManager_sharedInstance;
  return v2;
}

uint64_t __37__MCMContainerManager_defaultManager__block_invoke()
{
  defaultManager_sharedInstance = [MCMContainerManager alloc];
  return MEMORY[0x270F9A758]();
}

@end