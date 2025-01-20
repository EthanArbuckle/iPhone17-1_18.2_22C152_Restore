@interface PBCoercionRegistry
+ (id)archivedDataFromObject:(id)a3 requestedType:(id)a4 outError:(id *)a5;
+ (id)defaultRegistry;
+ (id)objectFromArchivedData:(id)a3 URL:(id)a4 requestedClass:(Class)a5 typeIdentifier:(id)a6 outError:(id *)a7;
- (BOOL)canCoerceFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4;
- (BOOL)canCoerceObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4;
- (BOOL)canCoerceObjectOfClass:(Class)a3 toRepresentationConformingToType:(id)a4;
- (NSMutableArray)member_representationCoercions;
- (NSMutableDictionary)member_classCoercionByClass;
- (NSMutableDictionary)member_exporterByClass;
- (NSMutableDictionary)member_importerByClass;
- (OS_dispatch_queue)memberQueue;
- (PBCoercionRegistry)init;
- (id)_availableClassesToCoerceFromClass:(Class)a3;
- (id)_member_acceptableRepresentationTypesForCreatingObjectOfClass:(Class)a3;
- (id)_member_availableClassesToCoerceToFromClass:(Class)a3;
- (id)_member_availableDirectRepresentationTypesForClass:(Class)a3;
- (id)_member_exporterFromClass:(Class)a3 toType:(id)a4;
- (id)_newObjectOfClass:(Class)a3 fromData:(id)a4 URL:(id)a5 ofType:(id)a6 outError:(id *)a7;
- (id)acceptableRepresentationTypesForCreatingObjectOfClass:(Class)a3;
- (id)availableRepresentationTypesForClass:(Class)a3;
- (id)loadCoercionOfRepresentation:(id)a3 fromType:(id)a4 toType:(id)a5 usingCoercion:(id)a6 completionBlock:(id)a7;
- (id)newObjectOfClass:(Class)a3 fromContentsOfURL:(id)a4 ofType:(id)a5 outError:(id *)a6;
- (id)newObjectOfClass:(Class)a3 fromData:(id)a4 ofType:(id)a5 outError:(id *)a6;
- (void)_member_enumerateAvailableCoercionLoaderBlocksForRepresentation:(id)a3 usingBlock:(id)a4;
- (void)_member_registerCoercionFromObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5;
- (void)_member_registerCoercionFromObjectOfClass:(Class)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5;
- (void)_member_registerCoercionFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5;
- (void)_member_registerCoercionFromRepresentationConformingToType:(id)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5;
- (void)enumerateAvailableCoercionLoaderBlocksForRepresentation:(id)a3 usingBlock:(id)a4;
- (void)loadRepresentationOfObject:(id)a3 asType:(id)a4 completionBlock:(id)a5;
- (void)registerCoercionFromObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5;
- (void)registerCoercionFromObjectOfClass:(Class)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5;
- (void)registerCoercionFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5;
- (void)registerCoercionFromRepresentationConformingToType:(id)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5;
- (void)setMemberQueue:(id)a3;
- (void)setMember_classCoercionByClass:(id)a3;
- (void)setMember_exporterByClass:(id)a3;
- (void)setMember_importerByClass:(id)a3;
- (void)setMember_representationCoercions:(id)a3;
@end

@implementation PBCoercionRegistry

+ (id)defaultRegistry
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __37__PBCoercionRegistry_defaultRegistry__block_invoke;
  v8 = &unk_1E5556798;
  v9 = &v11;
  id v10 = a1;
  if (qword_1EB3B8680 != -1) {
    dispatch_once(&qword_1EB3B8680, &v5);
  }
  if (*((unsigned char *)v12 + 24))
  {
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)_MergedGlobals_7, "uikit_registerExtraCoercions", v5, v6, v7, v8, v9, v10, v11);
    }
    else
    {
      v2 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v5, v6, v7, v8, v9, v10, v11);
      [v2 postNotificationName:@"PBDefaultCoercionRegistryDidInstantiateNotification" object:_MergedGlobals_7];
    }
  }
  id v3 = (id)_MergedGlobals_7;
  _Block_object_dispose(&v11, 8);
  return v3;
}

uint64_t __37__PBCoercionRegistry_defaultRegistry__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(*(Class *)(a1 + 40));
  id v3 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  v4 = (void *)_MergedGlobals_7;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *MEMORY[0x1E4F22708];
  [v4 registerCoercionFromObjectOfClass:v5 toRepresentationOfType:*MEMORY[0x1E4F22708] coercionBlock:&__block_literal_global_8];
  [(id)_MergedGlobals_7 registerCoercionFromRepresentationConformingToType:v6 toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_3];
  [(id)_MergedGlobals_7 registerCoercionFromRepresentationConformingToType:*MEMORY[0x1E4F22700] toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_6];
  [(id)_MergedGlobals_7 registerCoercionFromRepresentationConformingToType:*MEMORY[0x1E4F22688] toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_8];
  [(id)_MergedGlobals_7 registerCoercionFromRepresentationConformingToType:*MEMORY[0x1E4F226F0] toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_10_0];
  uint64_t v7 = *MEMORY[0x1E4F226F8];
  [(id)_MergedGlobals_7 registerCoercionFromRepresentationConformingToType:*MEMORY[0x1E4F226F8] toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_12];
  v8 = (void *)_MergedGlobals_7;
  uint64_t v9 = objc_opt_class();
  [v8 registerCoercionFromObjectOfClass:v9 toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_16];
  [(id)_MergedGlobals_7 registerCoercionFromObjectOfClass:objc_opt_class() toRepresentationOfType:v7 coercionBlock:&__block_literal_global_18];
  id v10 = (void *)_MergedGlobals_7;
  uint64_t v11 = objc_opt_class();
  return [v10 registerCoercionFromRepresentationConformingToType:v7 toObjectOfClass:v11 coercionBlock:&__block_literal_global_23];
}

void __37__PBCoercionRegistry_defaultRegistry__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void (**a4)(void, void, void, void))
{
  uint64_t v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  ((void (**)(void, id, void, void))a4)[2](v6, v7, 0, 0);
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_3(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (v11)
  {
    char v14 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    char v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_4(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (v11)
  {
    char v14 = (void *)[[NSString alloc] initWithData:v11 encoding:10];
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    char v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_5(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (v11)
  {
    char v14 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    char v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_6(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (v11)
  {
    char v14 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    char v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_7(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (v11)
  {
    char v14 = PBURLFromURLArchive(v11);
    v15 = [v14 absoluteString];

    if (!a6) {
      goto LABEL_10;
    }
  }
  else
  {
    v15 = 0;
    if (!a6) {
      goto LABEL_10;
    }
  }
  if (!v15)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v15;
}

uint64_t __37__PBCoercionRegistry_defaultRegistry__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 absoluteString];
}

void __37__PBCoercionRegistry_defaultRegistry__block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 baseURL];
  if (v7)
  {
    v8 = [v6 relativeString];

    v13[0] = v8;
    uint64_t v9 = [v7 absoluteString];
    v13[1] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    v8 = [v6 absoluteString];

    v12[0] = v8;
    v12[1] = &stru_1EDBD7C58;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }

  id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:0];
  if (v5) {
    (*((void (**)(id, void *, void, void))v5 + 2))(v5, v11, 0, 0);
  }
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_10(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (!v11 || (PBURLFromURLArchive(v11), (char v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (*a6)
    {
      PBCannotInstantiateObjectOfClassError(a2, v10, 0);
      char v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (PBCoercionRegistry)init
{
  v14.receiver = self;
  v14.super_class = (Class)PBCoercionRegistry;
  id v2 = [(PBCoercionRegistry *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.pasteboard.PBCoercionRegistry-member-queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    member_exporterByClass = v2->_member_exporterByClass;
    v2->_member_exporterByClass = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    member_importerByClass = v2->_member_importerByClass;
    v2->_member_importerByClass = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    member_classCoercionByClass = v2->_member_classCoercionByClass;
    v2->_member_classCoercionByClass = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    member_representationCoercions = v2->_member_representationCoercions;
    v2->_member_representationCoercions = (NSMutableArray *)v11;
  }
  return v2;
}

- (void)_member_registerCoercionFromObjectOfClass:(Class)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  uint64_t v9 = NSStringFromClass(a3);
  id v10 = [(PBCoercionRegistry *)self member_exporterByClass];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    uint64_t v11 = [[PBObjectToRepresentationCoercion alloc] initWithClass:a3];
    id v12 = [(PBCoercionRegistry *)self member_exporterByClass];
    [v12 setObject:v11 forKeyedSubscript:v9];
  }
  [(PBObjectToRepresentationCoercion *)v11 addCoercionToType:v13 block:v8];
}

- (void)registerCoercionFromObjectOfClass:(Class)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PBCoercionRegistry *)self memberQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__PBCoercionRegistry_registerCoercionFromObjectOfClass_toRepresentationOfType_coercionBlock___block_invoke;
  void v13[3] = &unk_1E55567C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  Class v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

uint64_t __93__PBCoercionRegistry_registerCoercionFromObjectOfClass_toRepresentationOfType_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_member_registerCoercionFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  id v9 = NSStringFromClass(a4);
  id v10 = [(PBCoercionRegistry *)self member_importerByClass];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    id v11 = [[PBRepresentationToObjectCoercion alloc] initWithClass:a4];
    id v12 = [(PBCoercionRegistry *)self member_importerByClass];
    [v12 setObject:v11 forKeyedSubscript:v9];
  }
  [(PBRepresentationToObjectCoercion *)v11 addCoercionFromType:v13 block:v8];
}

- (void)registerCoercionFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PBCoercionRegistry *)self memberQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toObjectOfClass_coercionBlock___block_invoke;
  void v13[3] = &unk_1E55567E8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  Class v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

uint64_t __103__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toObjectOfClass_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_member_registerCoercionFromObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v12 = a5;
  id v8 = NSStringFromClass(a3);
  id v9 = [(PBCoercionRegistry *)self member_classCoercionByClass];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    id v10 = [[PBObjectToObjectCoercion alloc] initWithClass:a3];
    id v11 = [(PBCoercionRegistry *)self member_classCoercionByClass];
    [v11 setObject:v10 forKeyedSubscript:v8];
  }
  [(PBObjectToObjectCoercion *)v10 addCoercionToClass:a4 block:v12];
}

- (void)registerCoercionFromObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v8 = a5;
  id v9 = [(PBCoercionRegistry *)self memberQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PBCoercionRegistry_registerCoercionFromObjectOfClass_toObjectOfClass_coercionBlock___block_invoke;
  v11[3] = &unk_1E5556810;
  Class v13 = a3;
  Class v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(v9, v11);
}

uint64_t __86__PBCoercionRegistry_registerCoercionFromObjectOfClass_toObjectOfClass_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromObjectOfClass:toObjectOfClass:coercionBlock:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
}

- (id)_member_availableDirectRepresentationTypesForClass:(Class)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(PBCoercionRegistry *)self member_exporterByClass];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(NSString **)(*((void *)&v17 + 1) + 8 * i);
        if ([(objc_class *)a3 isSubclassOfClass:NSClassFromString(v11)])
        {
          id v12 = [(PBCoercionRegistry *)self member_exporterByClass];
          Class v13 = [v12 objectForKeyedSubscript:v11];
          Class v14 = [v13 availableExportTypes];

          if (v14) {
            [v5 addObjectsFromArray:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 array];

  return v15;
}

- (void)registerCoercionFromRepresentationConformingToType:(id)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PBCoercionRegistry *)self memberQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke;
  v15[3] = &unk_1E55564F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

uint64_t __110__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_member_registerCoercionFromRepresentationConformingToType:(id)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PBCoercionRegistry *)self member_representationCoercions];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __118__PBCoercionRegistry__member_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke;
  uint64_t v22 = &unk_1E5556838;
  id v12 = v8;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  uint64_t v14 = [v11 indexOfObjectPassingTest:&v19];

  id v15 = [PBRepresentationToRepresentationCoercion alloc];
  id v16 = -[PBRepresentationToRepresentationCoercion initWithSourceType:destinationType:conversionBlock:](v15, "initWithSourceType:destinationType:conversionBlock:", v12, v13, v10, v19, v20, v21, v22);

  id v17 = [(PBCoercionRegistry *)self member_representationCoercions];
  id v18 = v17;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    [v17 addObject:v16];
  }
  else {
    [v17 replaceObjectAtIndex:v14 withObject:v16];
  }
}

uint64_t __118__PBCoercionRegistry__member_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 sourceType];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v3 destinationType];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)availableRepresentationTypesForClass:(Class)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v6 = [(PBCoercionRegistry *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PBCoercionRegistry_availableRepresentationTypesForClass___block_invoke;
  block[3] = &unk_1E5556860;
  id v11 = v5;
  id v12 = self;
  Class v13 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = [v7 array];

  return v8;
}

void __59__PBCoercionRegistry_availableRepresentationTypesForClass___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "_member_availableDirectRepresentationTypesForClass:", *(void *)(a1 + 48));
  [v2 addObjectsFromArray:v3];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "member_classCoercionByClass");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      uint64_t v18 = v5;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(NSString **)(*((void *)&v24 + 1) + 8 * v7);
        if ([*(id *)(a1 + 48) isSubclassOfClass:NSClassFromString(v8)])
        {
          id v9 = objc_msgSend(*(id *)(a1 + 40), "member_classCoercionByClass");
          id v10 = [v9 objectForKeyedSubscript:v8];

          id v11 = [v10 availableClasses];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(a1 + 32);
                id v17 = objc_msgSend(*(id *)(a1 + 40), "_member_availableDirectRepresentationTypesForClass:", NSClassFromString(*(NSString **)(*((void *)&v20 + 1) + 8 * i)));
                [v16 addObjectsFromArray:v17];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v13);
          }

          uint64_t v5 = v18;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
}

- (id)_member_acceptableRepresentationTypesForCreatingObjectOfClass:(Class)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(PBCoercionRegistry *)self member_importerByClass];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(NSString **)(*((void *)&v17 + 1) + 8 * i);
        if ([(objc_class *)a3 isSubclassOfClass:NSClassFromString(v11)])
        {
          uint64_t v12 = [(PBCoercionRegistry *)self member_importerByClass];
          uint64_t v13 = [v12 objectForKeyedSubscript:v11];
          uint64_t v14 = [v13 availableImportTypes];

          if (v14) {
            [v5 addObjectsFromArray:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 array];

  return v15;
}

- (id)acceptableRepresentationTypesForCreatingObjectOfClass:(Class)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__4;
  uint64_t v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  uint64_t v5 = [(PBCoercionRegistry *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PBCoercionRegistry_acceptableRepresentationTypesForCreatingObjectOfClass___block_invoke;
  block[3] = &unk_1E5556888;
  void block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __76__PBCoercionRegistry_acceptableRepresentationTypesForCreatingObjectOfClass___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_member_acceptableRepresentationTypesForCreatingObjectOfClass:", *(void *)(a1 + 48));
  return MEMORY[0x1F41817F8]();
}

- (BOOL)canCoerceFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v7 = [(PBCoercionRegistry *)self memberQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PBCoercionRegistry_canCoerceFromRepresentationConformingToType_toObjectOfClass___block_invoke;
  v10[3] = &unk_1E55568B0;
  v10[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  Class v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(v6) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __82__PBCoercionRegistry_canCoerceFromRepresentationConformingToType_toObjectOfClass___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "member_importerByClass", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(NSString **)(*((void *)&v10 + 1) + 8 * i);
        if ([NSClassFromString(v7) isSubclassOfClass:*(void *)(a1 + 56)])
        {
          id v8 = objc_msgSend(*(id *)(a1 + 32), "member_importerByClass");
          uint64_t v9 = [v8 objectForKeyedSubscript:v7];

          if ([v9 canCoerceFromType:*(void *)(a1 + 40)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_14;
          }
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (BOOL)canCoerceObjectOfClass:(Class)a3 toRepresentationConformingToType:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v7 = [(PBCoercionRegistry *)self memberQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PBCoercionRegistry_canCoerceObjectOfClass_toRepresentationConformingToType___block_invoke;
  v10[3] = &unk_1E55568B0;
  v10[4] = self;
  id v11 = v6;
  long long v12 = &v14;
  Class v13 = a3;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(v6) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __78__PBCoercionRegistry_canCoerceObjectOfClass_toRepresentationConformingToType___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "member_exporterByClass", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(NSString **)(*((void *)&v10 + 1) + 8 * i);
        if ([*(id *)(a1 + 56) isSubclassOfClass:NSClassFromString(v7)])
        {
          id v8 = objc_msgSend(*(id *)(a1 + 32), "member_exporterByClass");
          uint64_t v9 = [v8 objectForKeyedSubscript:v7];

          if ([v9 canCoerceToType:*(void *)(a1 + 40)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_14;
          }
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (BOOL)canCoerceObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = [(PBCoercionRegistry *)self memberQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PBCoercionRegistry_canCoerceObjectOfClass_toObjectOfClass___block_invoke;
  v9[3] = &unk_1E55568D8;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v7, v9);

  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

void __61__PBCoercionRegistry_canCoerceObjectOfClass_toObjectOfClass___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(NSString **)(*((void *)&v10 + 1) + 8 * i);
        if ([*(id *)(a1 + 48) isSubclassOfClass:NSClassFromString(v7)])
        {
          id v8 = objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass");
          uint64_t v9 = [v8 objectForKeyedSubscript:v7];

          if ([v9 canCoerceToObjectOfClass:*(void *)(a1 + 56)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

            goto LABEL_14;
          }
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (id)_newObjectOfClass:(Class)a3 fromData:(id)a4 URL:(id)a5 ofType:(id)a6 outError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  uint64_t v15 = [(PBCoercionRegistry *)self memberQueue];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __69__PBCoercionRegistry__newObjectOfClass_fromData_URL_ofType_outError___block_invoke;
  long long v23 = &unk_1E55568B0;
  long long v24 = self;
  Class v27 = a3;
  id v16 = v14;
  id v25 = v16;
  long long v26 = &v28;
  dispatch_sync(v15, &v20);

  char v17 = (void *)v29[5];
  if (v17)
  {
    long long v18 = objc_msgSend(v17, "createObjectFromRepresentationConformingToType:data:URL:outError:", v16, v12, v13, a7, v20, v21, v22, v23, v24);
  }
  else
  {
    long long v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __69__PBCoercionRegistry__newObjectOfClass_fromData_URL_ofType_outError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "member_importerByClass", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(NSString **)(*((void *)&v12 + 1) + 8 * i);
        if ([NSClassFromString(v7) isSubclassOfClass:*(void *)(a1 + 56)])
        {
          id v8 = objc_msgSend(*(id *)(a1 + 32), "member_importerByClass");
          uint64_t v9 = [v8 objectForKeyedSubscript:v7];

          if ([v9 canCoerceFromType:*(void *)(a1 + 40)])
          {
            uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
            long long v11 = *(void **)(v10 + 40);
            *(void *)(v10 + 40) = v9;

            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (id)newObjectOfClass:(Class)a3 fromData:(id)a4 ofType:(id)a5 outError:(id *)a6
{
  return [(PBCoercionRegistry *)self _newObjectOfClass:a3 fromData:a4 URL:0 ofType:a5 outError:a6];
}

- (id)newObjectOfClass:(Class)a3 fromContentsOfURL:(id)a4 ofType:(id)a5 outError:(id *)a6
{
  return [(PBCoercionRegistry *)self _newObjectOfClass:a3 fromData:0 URL:a4 ofType:a5 outError:a6];
}

- (id)_member_exporterFromClass:(Class)a3 toType:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(PBCoercionRegistry *)self member_exporterByClass];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(NSString **)(*((void *)&v16 + 1) + 8 * i);
        if ([(objc_class *)a3 isSubclassOfClass:NSClassFromString(v12)])
        {
          long long v13 = [(PBCoercionRegistry *)self member_exporterByClass];
          long long v14 = [v13 objectForKeyedSubscript:v12];

          if ([v14 canCoerceToType:v6]) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  long long v14 = 0;
LABEL_12:

  return v14;
}

- (void)loadRepresentationOfObject:(id)a3 asType:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke;
  v29[3] = &unk_1E5556900;
  id v11 = v9;
  id v30 = v11;
  id v12 = v8;
  id v31 = v12;
  id v13 = v10;
  id v32 = v13;
  long long v14 = (void (**)(void, void, void, void))MEMORY[0x192F9AA30](v29);
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__47;
  Class v27 = __Block_byref_object_dispose__48;
  id v28 = 0;
  long long v15 = [(PBCoercionRegistry *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_49;
  block[3] = &unk_1E5556978;
  void block[4] = self;
  id v16 = v12;
  id v20 = v16;
  id v17 = v11;
  id v21 = v17;
  uint64_t v22 = &v23;
  dispatch_sync(v15, block);

  uint64_t v18 = v24[5];
  if (v18) {
    (*(void (**)(uint64_t, void (**)(void, void, void, void)))(v18 + 16))(v18, v14);
  }
  else {
    v14[2](v14, 0, 0, 0);
  }

  _Block_object_dispose(&v23, 8);
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a2;
  unint64_t v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9 || !(v7 | v8))
  {
    id v11 = [v9 domain];
    char v12 = [v11 isEqualToString:@"PBErrorDomain"];

    if ((v12 & 1) == 0)
    {
      id v13 = *(void **)(a1 + 32);
      long long v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = PBCannotCreateRepresentationError(v13, v14, v10);

      id v10 = (void *)v15;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2;
    v17[3] = &unk_1E55562C8;
    id v21 = v16;
    id v18 = (id)v7;
    id v19 = (id)v8;
    id v20 = v10;
    PBDispatchAsyncCallback(v17);
  }
}

uint64_t __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_49(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_member_exporterFromClass:toType:", objc_opt_class(), *(void *)(a1 + 48));
  uint64_t v3 = v2;
  if (v2)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2_50;
    v44[3] = &unk_1E5556928;
    id v45 = v2;
    id v46 = *(id *)(a1 + 48);
    id v47 = *(id *)(a1 + 40);
    uint64_t v4 = MEMORY[0x192F9AA30](v44);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  Class v27 = v3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
LABEL_5:
    uint64_t v10 = 0;
    uint64_t v28 = v8;
    while (1)
    {
      if (*(void *)v41 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(NSString **)(*((void *)&v40 + 1) + 8 * v10);
      NSClassFromString(v11);
      if (objc_opt_isKindOfClass())
      {
        char v12 = objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass");
        id v13 = [v12 objectForKeyedSubscript:v11];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v14 = [v13 availableClasses];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              Class v19 = NSClassFromString(*(NSString **)(*((void *)&v36 + 1) + 8 * i));
              uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "_member_exporterFromClass:toType:", v19, *(void *)(a1 + 48));
              if (v20)
              {
                id v21 = (void *)v20;
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                v30[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_5;
                v30[3] = &unk_1E5556950;
                id v31 = v13;
                id v22 = *(id *)(a1 + 40);
                Class v35 = v19;
                id v32 = v22;
                id v33 = v21;
                id v34 = *(id *)(a1 + 48);
                id v23 = v21;
                uint64_t v24 = MEMORY[0x192F9AA30](v30);
                uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
                long long v26 = *(void **)(v25 + 40);
                *(void *)(v25 + 40) = v24;

                goto LABEL_19;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_19:

        uint64_t v8 = v28;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        break;
      }
      if (++v10 == v8)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2_50(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_3;
  v8[3] = &unk_1E5555FA8;
  id v9 = v3;
  id v7 = v3;
  [v4 createRepresentationOfType:v5 fromObject:v6 completionBlock:v8];
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_4;
    v11[3] = &unk_1E55562C8;
    id v15 = v10;
    id v12 = v7;
    id v13 = v8;
    id v14 = v9;
    PBDispatchAsyncCallback(v11);
  }
}

uint64_t __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = 0;
  id v6 = a2;
  id v7 = [v3 coerceObject:v4 toObjectOfClass:v5 outError:&v9];
  id v8 = v9;
  if (v7) {
    [*(id *)(a1 + 48) createRepresentationOfType:*(void *)(a1 + 56) fromObject:v7 completionBlock:v6];
  }
  else {
    (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v8);
  }
}

- (id)_member_availableClassesToCoerceToFromClass:(Class)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [(PBCoercionRegistry *)self member_classCoercionByClass];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(NSString **)(*((void *)&v20 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x192F9A800]();
          if ([(objc_class *)a3 isSubclassOfClass:NSClassFromString(v10)])
          {
            id v12 = [(PBCoercionRegistry *)self member_classCoercionByClass];
            id v13 = [v12 objectForKeyedSubscript:v10];

            id v14 = [v13 availableClasses];
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __66__PBCoercionRegistry__member_availableClassesToCoerceToFromClass___block_invoke;
            v18[3] = &unk_1E55569A0;
            id v19 = v17;
            [v14 enumerateObjectsUsingBlock:v18];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    id v15 = [v17 array];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v15;
}

Class __66__PBCoercionRegistry__member_availableClassesToCoerceToFromClass___block_invoke(uint64_t a1, NSString *aClassName)
{
  Class result = NSClassFromString(aClassName);
  if (result)
  {
    Class v4 = result;
    uint64_t v5 = *(void **)(a1 + 32);
    return (Class)[v5 addObject:v4];
  }
  return result;
}

- (id)loadCoercionOfRepresentation:(id)a3 fromType:(id)a4 toType:(id)a5 usingCoercion:(id)a6 completionBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (v12)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __97__PBCoercionRegistry_loadCoercionOfRepresentation_fromType_toType_usingCoercion_completionBlock___block_invoke;
    v17[3] = &unk_1E55569C8;
    id v18 = v12;
    id v19 = v11;
    id v20 = v13;
    id v14 = [a3 loadWithCompletionHandler:v17];
  }
  else
  {
    id v15 = PBCannotLoadRepresentationError((uint64_t)a4, 0);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v15);

    id v14 = 0;
  }

  return v14;
}

void __97__PBCoercionRegistry_loadCoercionOfRepresentation_fromType_toType_usingCoercion_completionBlock___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  unint64_t v19 = a2;
  unint64_t v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!(v19 | v9) || v10)
  {
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_8;
  }
  if (v9)
  {
    id v12 = [(id)v9 url];
    int v13 = [v12 startAccessingSecurityScopedResource];

    id v14 = (void *)a1[4];
    id v15 = [(id)v9 url];
    [v14 coerceRepresentationData:v19 representationURL:v15 toRepresentationOfType:a1[5] completionBlock:a1[6]];

    if (v13)
    {
      uint64_t v16 = [(id)v9 url];
      [v16 stopAccessingSecurityScopedResource];

      if (!v11) {
        goto LABEL_10;
      }
LABEL_9:
      v11[2](v11);
      goto LABEL_10;
    }
LABEL_8:
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v17 = (void *)a1[4];
  id v18 = [0 url];
  [v17 coerceRepresentationData:v19 representationURL:v18 toRepresentationOfType:a1[5] completionBlock:a1[6]];

  if (v11) {
    goto LABEL_9;
  }
LABEL_10:
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (NSMutableDictionary)member_exporterByClass
{
  return self->_member_exporterByClass;
}

- (void)setMember_exporterByClass:(id)a3
{
}

- (NSMutableDictionary)member_importerByClass
{
  return self->_member_importerByClass;
}

- (void)setMember_importerByClass:(id)a3
{
}

- (NSMutableDictionary)member_classCoercionByClass
{
  return self->_member_classCoercionByClass;
}

- (void)setMember_classCoercionByClass:(id)a3
{
}

- (NSMutableArray)member_representationCoercions
{
  return self->_member_representationCoercions;
}

- (void)setMember_representationCoercions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member_representationCoercions, 0);
  objc_storeStrong((id *)&self->_member_classCoercionByClass, 0);
  objc_storeStrong((id *)&self->_member_importerByClass, 0);
  objc_storeStrong((id *)&self->_member_exporterByClass, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

- (void)enumerateAvailableCoercionLoaderBlocksForRepresentation:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PBCoercionRegistry *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PBCoercionRegistry_Private__enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke;
  block[3] = &unk_1E55569F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __98__PBCoercionRegistry_Private__enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_enumerateAvailableCoercionLoaderBlocksForRepresentation:usingBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_member_enumerateAvailableCoercionLoaderBlocksForRepresentation:(id)a3 usingBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  uint64_t v8 = [v6 typeIdentifier];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = self;
  id obj = [(PBCoercionRegistry *)self member_representationCoercions];
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = [v13 sourceType];
        id v15 = [v13 destinationType];
        if (UTTypeConformsTo(v8, v14))
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __106__PBCoercionRegistry_Private___member_enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke;
          v18[3] = &unk_1E5556A18;
          void v18[4] = v17;
          id v19 = v6;
          id v20 = v14;
          id v21 = v15;
          long long v22 = v13;
          v7[2](v7, v21, v18);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

uint64_t __106__PBCoercionRegistry_Private___member_enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) loadCoercionOfRepresentation:*(void *)(a1 + 40) fromType:*(void *)(a1 + 48) toType:*(void *)(a1 + 56) usingCoercion:*(void *)(a1 + 64) completionBlock:a2];
}

- (id)_availableClassesToCoerceFromClass:(Class)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__4;
  id v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  uint64_t v5 = [(PBCoercionRegistry *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PBCoercionRegistry_Private___availableClassesToCoerceFromClass___block_invoke;
  block[3] = &unk_1E5556888;
  void block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __66__PBCoercionRegistry_Private___availableClassesToCoerceFromClass___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_member_availableClassesToCoerceToFromClass:", *(void *)(a1 + 48));
  return MEMORY[0x1F41817F8]();
}

+ (id)archivedDataFromObject:(id)a3 requestedType:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  id v12 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v9 = v12;
  if (v8)
  {
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = PBCannotLoadRepresentationError((uint64_t)v7, v9);

  id v9 = (id)v11;
  if (a5) {
LABEL_3:
  }
    *a5 = v9;
LABEL_4:

  return v8;
}

+ (id)objectFromArchivedData:(id)a3 URL:(id)a4 requestedClass:(Class)a5 typeIdentifier:(id)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11 && v12)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (v11)
  {
    id v22 = 0;
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:&v22];
    id v15 = v22;
    [v14 setDecodingFailurePolicy:1];
    uint64_t v16 = *MEMORY[0x1E4F284E8];
    id v21 = v15;
    uint64_t v17 = [v14 decodeTopLevelObjectOfClass:a5 forKey:v16 error:&v21];
    id v18 = v21;

    if (v17)
    {
      if (!a7) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v20 = PBCannotInstantiateObjectOfClassError(a5, v13, v18);

  uint64_t v17 = 0;
  id v18 = (id)v20;
  if (a7) {
LABEL_7:
  }
    *a7 = v18;
LABEL_8:

  return v17;
}

@end