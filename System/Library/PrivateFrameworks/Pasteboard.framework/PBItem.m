@interface PBItem
+ (BOOL)supportsSecureCoding;
+ (id)allowedClassesForSecureCoding;
+ (id)item;
+ (id)itemWithContentsOfFileURL:(id)a3 type:(id)a4 outError:(id *)a5;
+ (id)itemWithData:(id)a3 type:(id)a4;
+ (id)itemWithObject:(id)a3;
- (BOOL)_canInstantiateObjectOfClass:(Class)a3;
- (BOOL)_canInstantiateObjectOfClass:(Class)a3 excludingCoercionsFromTypes:(id)a4;
- (BOOL)hasRepresentationConformingToType:(id)a3;
- (BOOL)hasRepresentationOfType:(id)a3;
- (BOOL)isDataAvailableImmediatelyForType:(id)a3;
- (BOOL)itemQueue_canInstantiateObjectOfClass:(Class)a3 excludingCoercionsFromTypes:(id)a4;
- (BOOL)itemQueue_hasRepresentationConformingToType:(id)a3;
- (BOOL)itemQueue_hasRepresentationOfType:(id)a3;
- (BOOL)itemQueue_isStoredOnServer;
- (NSArray)availableTypes;
- (NSArray)representations;
- (NSData)itemQueue_primaryData;
- (NSDictionary)itemQueue_metadata;
- (NSDictionary)itemQueue_privateMetadata;
- (NSDictionary)metadata;
- (NSDictionary)privateMetadata;
- (NSMutableDictionary)itemQueue_dataAvailabilityByType;
- (NSMutableDictionary)itemQueue_patternDetections;
- (NSMutableDictionary)itemQueue_preferredRepresentationByType;
- (NSMutableDictionary)itemQueue_representationByType;
- (NSMutableDictionary)itemQueue_visibilityByType;
- (NSMutableOrderedSet)itemQueue_typeOrder;
- (NSObject)itemQueue_localObject;
- (NSString)description;
- (NSString)suggestedName;
- (NSURL)itemQueue_primaryFileURL;
- (NSUUID)UUID;
- (PBItem)init;
- (PBItem)initWithCoder:(id)a3;
- (PBItem)initWithContentsOfFileURL:(id)a3 type:(id)a4 outError:(id *)a5;
- (PBItem)initWithData:(id)a3 type:(id)a4;
- (PBItem)initWithNSItemProvider:(id)a3;
- (PBItem)initWithObject:(id)a3;
- (PBItemDataTransferDelegate)dataTransferDelegate;
- (PBItemDataTransferDelegate)itemQueue_dataTransferDelegate;
- (id)_itemQueue_copyWithDoNothingRepresentations;
- (id)_loadObjectOfClass:(Class)a3 context:(id)a4 completionBlock:(id)a5;
- (id)_representationForType:(id)a3;
- (id)availableTypesWithPreferredRepresentation:(unint64_t)a3;
- (id)copyWithDoNothingRepresentations;
- (id)enumeratePatternDetectionsForPatterns:(id)a3 usingBlock:(id)a4;
- (id)initDoNothing;
- (id)itemQueue_availableTypes;
- (id)itemQueue_localUserInfo;
- (id)itemQueue_representationForType:(id)a3;
- (id)loadObjectOfClass:(Class)a3 completionBlock:(id)a4;
- (id)localObject;
- (id)localUserInfo;
- (id)representationConformingToType:(id)a3;
- (id)uikit_loadObjectOfClass:(Class)a3 completionBlock:(id)a4;
- (id)uikit_v2_loadObjectOfClass:(Class)a3 completionBlock:(id)a4;
- (int64_t)visibilityForType:(id)a3;
- (unint64_t)preferredRepresentationForType:(id)a3;
- (void)_addRepresentationType:(id)a3 loaderBlock:(id)a4;
- (void)_commonInitGenerateUUID:(BOOL)a3;
- (void)_loadRepresentationAsType:(id)a3 context:(id)a4 completionBlock:(id)a5;
- (void)addDataRepresentationType:(id)a3 loader:(id)a4;
- (void)addFileCopyRepresentationType:(id)a3 loader:(id)a4;
- (void)addOpenInPlaceRepresentationType:(id)a3 loader:(id)a4;
- (void)addPatternDetections:(id)a3;
- (void)addRepresentation:(id)a3;
- (void)addRepresentationType:(id)a3 loader:(id)a4;
- (void)addRepresentationType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)itemQueue_registerLocalAvailableDerivedRepresentations;
- (void)itemQueue_removeRepresentationOfType:(id)a3;
- (void)itemQueue_setDataTransferDelegate:(id)a3;
- (void)itemQueue_setItemRepresentation:(id)a3;
- (void)itemRepresentation:(id)a3 beganDataTransferWithProgress:(id)a4;
- (void)itemRepresentationFinishedDataTransfer:(id)a3;
- (void)loadRepresentationAsType:(id)a3 completionBlock:(id)a4;
- (void)removeRepresentationOfType:(id)a3;
- (void)setDataTransferDelegate:(id)a3;
- (void)setItemQueue_dataAvailabilityByType:(id)a3;
- (void)setItemQueue_dataTransferDelegate:(id)a3;
- (void)setItemQueue_isStoredOnServer:(BOOL)a3;
- (void)setItemQueue_localObject:(id)a3;
- (void)setItemQueue_localUserInfo:(id)a3;
- (void)setItemQueue_metadata:(id)a3;
- (void)setItemQueue_patternDetections:(id)a3;
- (void)setItemQueue_preferredRepresentationByType:(id)a3;
- (void)setItemQueue_primaryData:(id)a3;
- (void)setItemQueue_primaryFileURL:(id)a3;
- (void)setItemQueue_privateMetadata:(id)a3;
- (void)setItemQueue_representationByType:(id)a3;
- (void)setItemQueue_typeOrder:(id)a3;
- (void)setItemQueue_visibilityByType:(id)a3;
- (void)setLocalObject:(id)a3;
- (void)setLocalUserInfo:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPrivateMetadata:(id)a3;
- (void)uikit_loadRepresentationAsType:(id)a3 completionBlock:(id)a4;
- (void)uikit_v2_loadRepresentationAsType:(id)a3 completionBlock:(id)a4;
- (void)v2_addFileCopyRepresentationType:(id)a3 loader:(id)a4;
- (void)v2_addRepresentationType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5;
@end

@implementation PBItem

+ (id)allowedClassesForSecureCoding
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (id)localUserInfo
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__PBItem_localUserInfo__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __23__PBItem_localUserInfo__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_localUserInfo");
  return MEMORY[0x1F41817F8]();
}

- (void)setLocalUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__PBItem_setLocalUserInfo___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __27__PBItem_setLocalUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_localUserInfo:", *(void *)(a1 + 40));
}

- (id)localObject
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21__PBItem_localObject__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __21__PBItem_localObject__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_localObject");
  return MEMORY[0x1F41817F8]();
}

- (void)setLocalObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__PBItem_setLocalObject___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __25__PBItem_setLocalObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_localObject:", *(void *)(a1 + 40));
}

- (NSDictionary)metadata
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __18__PBItem_metadata__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __18__PBItem_metadata__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  return MEMORY[0x1F41817F8]();
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__PBItem_setMetadata___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __22__PBItem_setMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_metadata:", *(void *)(a1 + 40));
}

- (NSArray)availableTypes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__PBItem_availableTypes__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __24__PBItem_availableTypes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_availableTypes");
  return MEMORY[0x1F41817F8]();
}

- (id)availableTypesWithPreferredRepresentation:(unint64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PBItem_availableTypesWithPreferredRepresentation___block_invoke;
  block[3] = &unk_1E5555F58;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__PBItem_availableTypesWithPreferredRepresentation___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", v7, (void)v10);
        uint64_t v9 = v8;
        if (v8 && [v8 preferredRepresentation] == a1[6]) {
          [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (NSDictionary)privateMetadata
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__1;
  long long v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__PBItem_privateMetadata__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __25__PBItem_privateMetadata__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  return MEMORY[0x1F41817F8]();
}

- (void)setPrivateMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PBItem_setPrivateMetadata___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __29__PBItem_setPrivateMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_privateMetadata:", *(void *)(a1 + 40));
}

- (NSString)suggestedName
{
  id v2 = [(PBItem *)self metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"com.apple.Pasteboard.suggestedName"];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

+ (id)item
{
  id v2 = objc_alloc_init(PBItem);
  return v2;
}

+ (id)itemWithObject:(id)a3
{
  id v3 = a3;
  id v4 = [[PBItem alloc] initWithObject:v3];

  return v4;
}

+ (id)itemWithData:(id)a3 type:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[PBItem alloc] initWithData:v6 type:v5];

  return v7;
}

+ (id)itemWithContentsOfFileURL:(id)a3 type:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[PBItem alloc] initWithContentsOfFileURL:v8 type:v7 outError:a5];

  return v9;
}

- (PBItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)PBItem;
  id v2 = [(PBItem *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PBItem *)v2 _commonInitGenerateUUID:1];
  }
  return v3;
}

- (id)initDoNothing
{
  v3.receiver = self;
  v3.super_class = (Class)PBItem;
  return [(PBItem *)&v3 init];
}

- (void)dealloc
{
  if (self->_itemQueue_primaryFileURL)
  {
    objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtURL:self->_itemQueue_primaryFileURL error:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)PBItem;
  [(PBItem *)&v4 dealloc];
}

- (id)_itemQueue_copyWithDoNothingRepresentations
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [objc_alloc((Class)objc_opt_class()) initDoNothing];
  uint64_t v4 = [(NSMutableOrderedSet *)self->_itemQueue_typeOrder mutableCopy];
  objc_super v5 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v4;

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_itemQueue_representationByType, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = self->_itemQueue_representationByType;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        long long v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_itemQueue_representationByType, "objectForKeyedSubscript:", v12, (void)v30);
        id v14 = (void *)[v13 copyWithDoNothingLoaderBlock];
        [v6 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  uint64_t v15 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v6;
  id v16 = v6;

  uint64_t v17 = [(NSMutableDictionary *)self->_itemQueue_visibilityByType mutableCopy];
  v18 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v17;

  uint64_t v19 = [(NSMutableDictionary *)self->_itemQueue_preferredRepresentationByType mutableCopy];
  v20 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v19;

  uint64_t v21 = [(NSMutableDictionary *)self->_itemQueue_dataAvailabilityByType mutableCopy];
  v22 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v21;

  uint64_t v23 = [(NSUUID *)self->_UUID copy];
  v24 = *(void **)(v3 + 120);
  *(void *)(v3 + 120) = v23;

  uint64_t v25 = [(NSDictionary *)self->_itemQueue_metadata copy];
  v26 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v25;

  uint64_t v27 = [(NSDictionary *)self->_itemQueue_privateMetadata copy];
  v28 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v27;

  *(unsigned char *)(v3 + 8) = self->_itemQueue_isStoredOnServer;
  return (id)v3;
}

- (id)copyWithDoNothingRepresentations
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  long long v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PBItem_copyWithDoNothingRepresentations__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__PBItem_copyWithDoNothingRepresentations__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_itemQueue_copyWithDoNothingRepresentations");
  return MEMORY[0x1F41817F8]();
}

- (void)_commonInitGenerateUUID:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  itemQueue_typeOrder = self->_itemQueue_typeOrder;
  self->_itemQueue_typeOrder = v5;

  uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  itemQueue_representationByType = self->_itemQueue_representationByType;
  self->_itemQueue_representationByType = v7;

  uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  itemQueue_preferredRepresentationByType = self->_itemQueue_preferredRepresentationByType;
  self->_itemQueue_preferredRepresentationByType = v9;

  long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  itemQueue_visibilityByType = self->_itemQueue_visibilityByType;
  self->_itemQueue_visibilityByType = v11;

  long long v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  itemQueue_dataAvailabilityByType = self->_itemQueue_dataAvailabilityByType;
  self->_itemQueue_dataAvailabilityByType = v13;

  uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  itemQueue_patternDetections = self->_itemQueue_patternDetections;
  self->_itemQueue_patternDetections = v15;

  if (v3)
  {
    self->_UUID = [MEMORY[0x1E4F29128] UUID];
    MEMORY[0x1F41817F8]();
  }
}

- (PBItem)initWithObject:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PBItem;
  val = [(PBItem *)&v55 init];
  if (val)
  {
    if ([v31 conformsToProtocol:&unk_1EDBDC700]) {
      id v4 = [v31 copyWithZone:0];
    }
    else {
      id v4 = v31;
    }
    itemQueue_localObject = val->_itemQueue_localObject;
    val->_itemQueue_localObject = v4;

    [(PBItem *)val _commonInitGenerateUUID:1];
    id v6 = +[PBCoercionRegistry defaultRegistry];
    uint64_t v7 = [v6 availableRepresentationTypesForClass:objc_opt_class()];

    objc_initWeak(&location, val);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          long long v13 = (void *)MEMORY[0x192F9A800]();
          id v14 = [PBItemRepresentation alloc];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __25__PBItem_initWithObject___block_invoke;
          v48[3] = &unk_1E5555FD0;
          objc_copyWeak(&v49, &location);
          v48[4] = v12;
          uint64_t v15 = [(PBItemRepresentation *)v14 initWithType:v12 preferredRepresentation:0 v3_loader:v48];
          [(PBItemRepresentation *)v15 setIsDataAvailableImmediately:1];
          [(PBItem *)val itemQueue_setItemRepresentation:v15];

          objc_destroyWeak(&v49);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v9);
    }

    id v16 = +[PBCoercionRegistry defaultRegistry];
    uint64_t v17 = [v16 _availableClassesToCoerceFromClass:objc_opt_class()];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v18)
    {
      uint64_t v33 = *(void *)v45;
      do
      {
        uint64_t v19 = 0;
        uint64_t v34 = v18;
        do
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v19;
          uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * v19);
          context = (void *)MEMORY[0x192F9A800]();
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          uint64_t v21 = +[PBCoercionRegistry defaultRegistry];
          v22 = [v21 availableRepresentationTypesForClass:v20];

          uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v56 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * j);
                uint64_t v27 = (void *)MEMORY[0x192F9A800]();
                if (([v8 containsObject:v26] & 1) == 0)
                {
                  v28 = [PBItemRepresentation alloc];
                  v38[0] = MEMORY[0x1E4F143A8];
                  v38[1] = 3221225472;
                  v38[2] = __25__PBItem_initWithObject___block_invoke_4;
                  v38[3] = &unk_1E5555FD0;
                  objc_copyWeak(&v39, &location);
                  v38[4] = v26;
                  v29 = [(PBItemRepresentation *)v28 initWithType:v26 preferredRepresentation:0 v3_loader:v38];
                  [(PBItem *)val itemQueue_setItemRepresentation:v29];

                  objc_destroyWeak(&v39);
                }
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v56 count:16];
            }
            while (v23);
          }

          uint64_t v19 = v36 + 1;
        }
        while (v36 + 1 != v34);
        uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v18);
    }

    objc_destroyWeak(&location);
  }

  return val;
}

uint64_t __25__PBItem_initWithObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = +[PBCoercionRegistry defaultRegistry];
    uint64_t v7 = [WeakRetained localObject];
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __25__PBItem_initWithObject___block_invoke_2;
    v10[3] = &unk_1E5555FA8;
    id v11 = v4;
    [v6 loadRepresentationOfObject:v7 asType:v8 completionBlock:v10];
  }
  return 0;
}

void __25__PBItem_initWithObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__PBItem_initWithObject___block_invoke_3;
    v9[3] = &unk_1E5555F80;
    id v12 = v8;
    id v10 = v6;
    id v11 = v7;
    PBDispatchAsyncCallback(v9);
  }
}

uint64_t __25__PBItem_initWithObject___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5], 0);
}

uint64_t __25__PBItem_initWithObject___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = +[PBCoercionRegistry defaultRegistry];
    id v7 = [WeakRetained localObject];
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __25__PBItem_initWithObject___block_invoke_5;
    v10[3] = &unk_1E5555FA8;
    id v11 = v4;
    [v6 loadRepresentationOfObject:v7 asType:v8 completionBlock:v10];
  }
  return 0;
}

void __25__PBItem_initWithObject___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__PBItem_initWithObject___block_invoke_6;
    v9[3] = &unk_1E5555F80;
    id v12 = v8;
    id v10 = v6;
    id v11 = v7;
    PBDispatchAsyncCallback(v9);
  }
}

uint64_t __25__PBItem_initWithObject___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5], 0);
}

- (PBItem)initWithData:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PBItem;
  uint64_t v8 = [(PBItem *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    itemQueue_primaryData = v8->_itemQueue_primaryData;
    v8->_itemQueue_primaryData = (NSData *)v9;

    [(PBItem *)v8 _commonInitGenerateUUID:1];
    id v11 = [PBItemRepresentation alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__PBItem_initWithData_type___block_invoke;
    v14[3] = &unk_1E5556020;
    id v15 = v6;
    id v12 = [(PBItemRepresentation *)v11 initWithType:v7 preferredRepresentation:0 v3_loader:v14];
    [(PBItemRepresentation *)v12 setIsDataAvailableImmediately:1];
    [(PBItem *)v8 itemQueue_setItemRepresentation:v12];
  }
  return v8;
}

uint64_t __28__PBItem_initWithData_type___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __28__PBItem_initWithData_type___block_invoke_2;
    v7[3] = &unk_1E5555FF8;
    id v9 = v4;
    id v8 = *(id *)(a1 + 32);
    PBDispatchAsyncCallback(v7);
  }
  return 0;
}

uint64_t __28__PBItem_initWithData_type___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 0, 0);
}

- (PBItem)initWithContentsOfFileURL:(id)a3 type:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PBItem;
  id v10 = [(PBItem *)&v36 init];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = NSTemporaryDirectory();
    long long v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v13 UUIDString];
    id v15 = [v12 stringByAppendingPathComponent:v14];
    objc_super v16 = [v11 fileURLWithPath:v15];

    id v17 = v8;
    uint64_t v18 = (const char *)[v17 fileSystemRepresentation];
    id v19 = v16;
    if (copyfile(v18, (const char *)[v19 fileSystemRepresentation], 0, 0x100000Fu))
    {
      uint64_t v20 = NSString;
      uint64_t v21 = __error();
      v22 = [v20 stringWithUTF8String:strerror(*v21)];
      uint64_t v23 = PBCannotCopyFileError(v17, v22, 0);

      if (!v23)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (a5)
      {
        uint64_t v24 = NSString;
        uint64_t v25 = __error();
        uint64_t v26 = [v24 stringWithUTF8String:strerror(*v25)];
        PBCannotCopyFileError(v17, v26, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v10 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v10->_itemQueue_primaryFileURL, v19);
      [(PBItem *)v10 _commonInitGenerateUUID:1];
      uint64_t v27 = [PBItemRepresentation alloc];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      long long v32 = __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke;
      uint64_t v33 = &unk_1E5556070;
      id v34 = v19;
      id v35 = v9;
      v28 = [(PBItemRepresentation *)v27 initWithType:v35 preferredRepresentation:1 v3_loader:&v30];
      -[PBItemRepresentation setIsDataAvailableImmediately:](v28, "setIsDataAvailableImmediately:", 1, v30, v31, v32, v33);
      [(PBItem *)v10 itemQueue_setItemRepresentation:v28];

      uint64_t v23 = v34;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

uint64_t __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v20 = 0;
  id v21 = 0;
  id v7 = PBCloneURLToTemporaryFolder(v5, @"com.apple.pasteboard", v6, 0, &v21, &v20);
  id v8 = v21;
  id v9 = v20;
  id v10 = 0;
  id v11 = 0;
  if (!v9)
  {
    id v10 = [[PBSecurityScopedURLWrapper alloc] initWithURL:v7 readonly:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_2;
    v18[3] = &unk_1E5555870;
    id v19 = v8;
    id v11 = (void *)MEMORY[0x192F9AA30](v18);

    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_3;
    v13[3] = &unk_1E5556048;
    id v16 = v4;
    id v14 = v10;
    id v15 = v9;
    id v17 = v11;
    PBDispatchAsyncCallback(v13);
  }
LABEL_4:

  return 0;
}

void __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

uint64_t __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], 0, a1[5], a1[7]);
}

- (NSArray)representations
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  BOOL v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__PBItem_representations__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __25__PBItem_representations__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) allValues];
  return MEMORY[0x1F41817F8]();
}

- (void)addDataRepresentationType:(id)a3 loader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PBItem_addDataRepresentationType_loader___block_invoke;
  block[3] = &unk_1E55560C0;
  long long v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __43__PBItem_addDataRepresentationType_loader___block_invoke(uint64_t a1)
{
  id v2 = [PBItemRepresentation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PBItem_addDataRepresentationType_loader___block_invoke_2;
  v5[3] = &unk_1E5555758;
  id v6 = *(id *)(a1 + 48);
  id v4 = [(PBItemRepresentation *)v2 initWithType:v3 preferredRepresentation:0 v3_loader:v5];
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v4);
}

id __43__PBItem_addDataRepresentationType_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PBItem_addDataRepresentationType_loader___block_invoke_3;
  v10[3] = &unk_1E5556098;
  id v11 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  id v8 = v6(v5, v10);

  return v8;
}

uint64_t __43__PBItem_addDataRepresentationType_loader___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addFileCopyRepresentationType:(id)a3 loader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PBItem_addFileCopyRepresentationType_loader___block_invoke;
  v10[3] = &unk_1E5556110;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(PBItem *)self v2_addFileCopyRepresentationType:v8 loader:v10];
}

id __47__PBItem_addFileCopyRepresentationType_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PBItem_addFileCopyRepresentationType_loader___block_invoke_2;
  v9[3] = &unk_1E55560E8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  uint64_t v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  id v7 = v5(v4, v9);

  return v7;
}

void __47__PBItem_addFileCopyRepresentationType_loader___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (!v5 || v6)
  {
    if (v5 | v6)
    {
      id v8 = 0;
      id v12 = (void *)v6;
    }
    else
    {
      id v12 = PBCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
      id v8 = 0;
    }
  }
  else
  {
    id v8 = CPTemporaryFileWithUniqueName();
    id v9 = NSString;
    id v10 = __error();
    id v11 = objc_msgSend(v9, "stringWithFormat:", @"%s", strerror(*v10));
    id v12 = PBCannotCreateTemporaryFile((uint64_t)v11, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v8)
  {
    long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v13 removeItemAtURL:v8 error:0];
  }
}

- (void)v2_addFileCopyRepresentationType:(id)a3 loader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke;
  block[3] = &unk_1E55560C0;
  long long v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke(id *a1)
{
  id v2 = [PBItemRepresentation alloc];
  id v3 = a1[4];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_2;
  id v8 = &unk_1E5556160;
  id v10 = a1[6];
  id v9 = a1[4];
  uint64_t v4 = [(PBItemRepresentation *)v2 initWithType:v3 preferredRepresentation:1 v3_loader:&v5];
  objc_msgSend(a1[5], "itemQueue_setItemRepresentation:", v4, v5, v6, v7, v8);
}

id __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_3;
  v10[3] = &unk_1E5556138;
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v12 = v4;
  uint64_t v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  id v8 = v6(v5, v10);

  return v8;
}

void __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v8 = 0;
  id v9 = v6;
  id v10 = 0;
  if (v5 && !v6)
  {
    id v11 = *(void **)(a1 + 32);
    id v17 = 0;
    id v18 = 0;
    id v12 = PBCloneURLToTemporaryFolder(v5, @"com.apple.pasteboard", v11, 0, &v18, &v17);
    id v13 = v18;
    id v14 = v17;
    if (v14)
    {
      id v9 = PBCannotCopyFileError(v5, 0, v14);
      id v10 = 0;
      id v8 = 0;
    }
    else
    {
      id v10 = [[PBSecurityScopedURLWrapper alloc] initWithURL:v12 readonly:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_4;
      v15[3] = &unk_1E5555870;
      id v16 = v13;
      id v8 = (void *)MEMORY[0x192F9AA30](v15);

      id v9 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

- (void)addOpenInPlaceRepresentationType:(id)a3 loader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke;
  block[3] = &unk_1E55560C0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke(uint64_t a1)
{
  id v2 = [PBItemRepresentation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_2;
  v5[3] = &unk_1E5555758;
  id v6 = *(id *)(a1 + 48);
  id v4 = [(PBItemRepresentation *)v2 initWithType:v3 preferredRepresentation:2 v3_loader:v5];
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v4);
}

id __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_3;
  v10[3] = &unk_1E5556188;
  id v11 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  id v8 = v6(v5, v10);

  return v8;
}

void __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = a2;
    uint64_t v5 = [[PBSecurityScopedURLWrapper alloc] initWithURL:v6 readonly:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)v2_addRepresentationType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PBItemQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke;
  v13[3] = &unk_1E55561B0;
  id v16 = v9;
  unint64_t v17 = a4;
  id v14 = v8;
  id v15 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

void __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke(uint64_t a1)
{
  id v2 = [PBItemRepresentation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v6[3] = &unk_1E5555758;
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  uint64_t v5 = [(PBItemRepresentation *)v2 initWithType:v3 preferredRepresentation:v4 v3_loader:v6];
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v5);
}

id __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_3;
  v10[3] = &unk_1E5555708;
  id v11 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  id v8 = v6(v5, v10);

  return v8;
}

uint64_t __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addRepresentationType:(id)a3 loader:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PBItem_addRepresentationType_loader___block_invoke;
  v8[3] = &unk_1E5556200;
  id v9 = v6;
  id v7 = v6;
  [(PBItem *)self v2_addRepresentationType:a3 preferredRepresentation:0 loader:v8];
}

id __39__PBItem_addRepresentationType_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PBItem_addRepresentationType_loader___block_invoke_2;
  v9[3] = &unk_1E55561D8;
  id v10 = v3;
  uint64_t v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  id v7 = v5(v4, v9);

  return v7;
}

uint64_t __39__PBItem_addRepresentationType_loader___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addRepresentationType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke;
  v10[3] = &unk_1E5556200;
  id v11 = v8;
  id v9 = v8;
  [(PBItem *)self v2_addRepresentationType:a3 preferredRepresentation:a4 loader:v10];
}

id __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v9[3] = &unk_1E55561D8;
  id v10 = v3;
  uint64_t v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  id v7 = v5(v4, v9);

  return v7;
}

uint64_t __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)itemQueue_registerLocalAvailableDerivedRepresentations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = +[PBCoercionRegistry defaultRegistry];
  uint64_t v4 = [(NSMutableOrderedSet *)self->_itemQueue_typeOrder array];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          objc_enumerationMutation(obj);
        }
        id v10 = [(NSMutableDictionary *)self->_itemQueue_representationByType objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v9)];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke;
        v12[3] = &unk_1E5556228;
        id v13 = v5;
        id v14 = self;
        [v3 enumerateAvailableCoercionLoaderBlocksForRepresentation:v10 usingBlock:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    uint64_t v7 = [PBItemRepresentation alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_2;
    v9[3] = &unk_1E5555758;
    id v10 = v6;
    uint64_t v8 = [(PBItemRepresentation *)v7 initWithType:v5 preferredRepresentation:0 v3_loader:v9];
    [(PBItemRepresentation *)v8 setDerivedRepresentation:1];
    objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v8);
    [*(id *)(a1 + 32) addObject:v5];
  }
}

id __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_3;
  v10[3] = &unk_1E5556098;
  id v11 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  uint64_t v8 = v6(v5, v10);

  return v8;
}

uint64_t __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)itemQueue_setItemRepresentation:(id)a3
{
  id v14 = a3;
  id v4 = [v14 typeIdentifier];
  [(NSMutableOrderedSet *)self->_itemQueue_typeOrder addObject:v4];
  [(NSMutableDictionary *)self->_itemQueue_representationByType setObject:v14 forKeyedSubscript:v4];
  uint64_t v5 = [(NSMutableDictionary *)self->_itemQueue_preferredRepresentationByType objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    objc_msgSend(v14, "setPreferredRepresentation:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v14, "preferredRepresentation"));
    [(NSMutableDictionary *)self->_itemQueue_preferredRepresentationByType setObject:v7 forKeyedSubscript:v4];
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_itemQueue_visibilityByType objectForKeyedSubscript:v4];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_msgSend(v14, "setVisibility:", objc_msgSend(v8, "unsignedIntegerValue"));
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "visibility"));
    [(NSMutableDictionary *)self->_itemQueue_visibilityByType setObject:v10 forKeyedSubscript:v4];
  }
  id v11 = [(NSMutableDictionary *)self->_itemQueue_dataAvailabilityByType objectForKeyedSubscript:v4];
  id v12 = v11;
  if (v11)
  {
    objc_msgSend(v14, "setIsDataAvailableImmediately:", objc_msgSend(v11, "BOOLValue"));
  }
  else
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v14, "isDataAvailableImmediately"));
    [(NSMutableDictionary *)self->_itemQueue_dataAvailabilityByType setObject:v13 forKeyedSubscript:v4];
  }
}

- (void)itemQueue_removeRepresentationOfType:(id)a3
{
  id v4 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_itemQueue_typeOrder, "containsObject:"))
  {
    [(NSMutableOrderedSet *)self->_itemQueue_typeOrder removeObject:v4];
    [(NSMutableDictionary *)self->_itemQueue_representationByType removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_itemQueue_preferredRepresentationByType removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_itemQueue_visibilityByType removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_itemQueue_dataAvailabilityByType removeObjectForKey:v4];
  }
}

- (void)_addRepresentationType:(id)a3 loaderBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PBItem__addRepresentationType_loaderBlock___block_invoke;
  block[3] = &unk_1E55560C0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __45__PBItem__addRepresentationType_loaderBlock___block_invoke(uint64_t a1)
{
  id v2 = [PBItemRepresentation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PBItem__addRepresentationType_loaderBlock___block_invoke_2;
  v5[3] = &unk_1E5555758;
  id v6 = *(id *)(a1 + 48);
  id v4 = [(PBItemRepresentation *)v2 initWithType:v3 preferredRepresentation:0 v3_loader:v5];
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v4);
}

uint64_t __45__PBItem__addRepresentationType_loaderBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PBItem__addRepresentationType_loaderBlock___block_invoke_3;
  v9[3] = &unk_1E5555FA8;
  id v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  v6(v5, v9);

  return 0;
}

uint64_t __45__PBItem__addRepresentationType_loaderBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PBItem_addRepresentation___block_invoke;
  v7[3] = &unk_1E55559B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __28__PBItem_addRepresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemQueue_setItemRepresentation:", *(void *)(a1 + 40));
}

- (void)removeRepresentationOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__PBItem_removeRepresentationOfType___block_invoke;
  v7[3] = &unk_1E55559B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __37__PBItem_removeRepresentationOfType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemQueue_removeRepresentationOfType:", *(void *)(a1 + 40));
}

- (BOOL)itemQueue_hasRepresentationOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PBItem *)self itemQueue_typeOrder];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (unint64_t)preferredRepresentationForType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PBItem_preferredRepresentationForType___block_invoke;
  block[3] = &unk_1E5556250;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__PBItem_preferredRepresentationForType___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 unsignedIntegerValue];
}

- (BOOL)isDataAvailableImmediatelyForType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PBItem_isDataAvailableImmediatelyForType___block_invoke;
  block[3] = &unk_1E5556250;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __44__PBItem_isDataAvailableImmediatelyForType___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 BOOLValue];
}

- (int64_t)visibilityForType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PBItem_visibilityForType___block_invoke;
  block[3] = &unk_1E5556250;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __28__PBItem_visibilityForType___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 unsignedIntegerValue];
}

- (BOOL)hasRepresentationOfType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PBItem_hasRepresentationOfType___block_invoke;
  block[3] = &unk_1E5556250;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __34__PBItem_hasRepresentationOfType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_hasRepresentationOfType:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)itemQueue_hasRepresentationConformingToType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(PBItem *)self itemQueue_typeOrder];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (UTTypeConformsTo(*(CFStringRef *)(*((void *)&v10 + 1) + 8 * i), v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasRepresentationConformingToType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PBItem_hasRepresentationConformingToType___block_invoke;
  block[3] = &unk_1E5556250;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __44__PBItem_hasRepresentationConformingToType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_hasRepresentationConformingToType:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)itemQueue_canInstantiateObjectOfClass:(Class)a3 excludingCoercionsFromTypes:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(PBItem *)self itemQueue_localObject];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v9 = 1;
  }
  else
  {
    long long v10 = +[PBCoercionRegistry defaultRegistry];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [(PBItem *)self itemQueue_typeOrder];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (([v6 containsObject:v16] & 1) == 0
            && ([v10 canCoerceFromRepresentationConformingToType:v16 toObjectOfClass:a3] & 1) != 0)
          {
            BOOL v9 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 0;
LABEL_14:
  }
  return v9;
}

- (BOOL)_canInstantiateObjectOfClass:(Class)a3
{
  return [(PBItem *)self _canInstantiateObjectOfClass:a3 excludingCoercionsFromTypes:0];
}

- (BOOL)_canInstantiateObjectOfClass:(Class)a3 excludingCoercionsFromTypes:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v7 = PBItemQueue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PBItem__canInstantiateObjectOfClass_excludingCoercionsFromTypes___block_invoke;
  v10[3] = &unk_1E5556278;
  uint64_t v12 = &v14;
  Class v13 = a3;
  void v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __67__PBItem__canInstantiateObjectOfClass_excludingCoercionsFromTypes___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_canInstantiateObjectOfClass:excludingCoercionsFromTypes:", *(void *)(a1 + 56), *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)itemQueue_availableTypes
{
  id v2 = (void *)[(NSMutableOrderedSet *)self->_itemQueue_typeOrder copy];
  uint64_t v3 = [v2 array];

  return v3;
}

- (id)itemQueue_representationForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PBItem *)self itemQueue_representationByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_representationForType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  Class v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PBItem__representationForType___block_invoke;
  block[3] = &unk_1E5556250;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __33__PBItem__representationForType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_representationForType:", *(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (id)representationConformingToType:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  long long v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v5 = PBItemQueue();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__PBItem_representationConformingToType___block_invoke;
  v9[3] = &unk_1E5555898;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = v20;
  Class v13 = &v14;
  id v6 = v4;
  dispatch_sync(v5, v9);

  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  return v7;
}

void __41__PBItem_representationConformingToType___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "itemQueue_typeOrder");
  id v4 = [v3 array];
  uint64_t v5 = _bestMatchType(v2, v4, &__block_literal_global_6);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "itemQueue_representationForType:");
    MEMORY[0x1F41817F8]();
  }
}

- (id)_loadObjectOfClass:(Class)a3 context:(id)a4 completionBlock:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PBItem *)self localObject];
  if (objc_opt_isKindOfClass())
  {
    id v11 = _PBLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = NSStringFromClass(a3);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18D208000, v11, OS_LOG_TYPE_INFO, "Returning local object of class %@", (uint8_t *)&buf, 0xCu);
    }
    if (!v9)
    {
      Class v13 = 0;
      goto LABEL_16;
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke;
    v40[3] = &unk_1E5555FF8;
    id v42 = v9;
    id v41 = v10;
    PBDispatchAsyncCallback(v40);

    Class v13 = 0;
    id v14 = v42;
  }
  else
  {
    uint64_t v15 = +[PBCoercionRegistry defaultRegistry];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    id v49 = __Block_byref_object_copy__1;
    long long v50 = __Block_byref_object_dispose__1;
    id v51 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__1;
    v38[4] = __Block_byref_object_dispose__1;
    id v39 = 0;
    uint64_t v16 = PBItemQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_2;
    block[3] = &unk_1E55562A0;
    id v17 = v15;
    p_long long buf = &buf;
    Class v37 = a3;
    id v33 = v17;
    id v34 = self;
    id v35 = v38;
    dispatch_sync(v16, block);

    long long v18 = *(void **)(*((void *)&buf + 1) + 40);
    if (v18)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_3;
      v27[3] = &unk_1E55562F0;
      id v28 = v17;
      uint64_t v30 = v38;
      Class v31 = a3;
      id v29 = v9;
      id v19 = [v18 loadDataWithContext:v8 completion:v27];

      id v20 = v28;
    }
    else
    {
      PBCannotInstantiateObjectOfClassError(a3, 0, 0);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = _PBLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = NSStringFromClass(a3);
        *(_DWORD *)long long v43 = 138412546;
        long long v44 = v23;
        __int16 v45 = 2112;
        id v46 = v20;
        _os_log_error_impl(&dword_18D208000, v21, OS_LOG_TYPE_ERROR, "There are no representations available to instantiate a class of type %@: %@", v43, 0x16u);
      }
      if (v9)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_53;
        v24[3] = &unk_1E5555FF8;
        id v26 = v9;
        id v20 = v20;
        id v25 = v20;
        PBDispatchAsyncCallback(v24);
      }
      id v19 = 0;
    }

    id v14 = v19;
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(&buf, 8);
    Class v13 = v14;
  }

LABEL_16:
  return v13;
}

uint64_t __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

void __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_2(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) acceptableRepresentationTypesForCreatingObjectOfClass:*(void *)(a1 + 64)];
  id v2 = objc_msgSend(*(id *)(a1 + 40), "itemQueue_availableTypes");
  uint64_t v3 = _bestMatchTypes(v9, v2, &__block_literal_global_17_0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "itemQueue_representationForType:");
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    id v11 = 0;
    uint64_t v12 = v9;
    goto LABEL_9;
  }
  if (!v7)
  {
    id v16 = 0;
    goto LABEL_7;
  }
  Class v13 = (void *)a1[4];
  uint64_t v14 = a1[7];
  uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v23 = 0;
  id v11 = (void *)[v13 newObjectOfClass:v14 fromData:v7 ofType:v15 outError:&v23];
  id v16 = v23;
  if (!v11)
  {
LABEL_7:
    uint64_t v12 = PBCannotInstantiateObjectOfClassError((objc_class *)a1[7], *(void **)(*(void *)(a1[6] + 8) + 40), v16);
    id v11 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
LABEL_8:

LABEL_9:
  id v17 = (void *)a1[5];
  if (v17)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_4;
    v18[3] = &unk_1E55562C8;
    id v22 = v17;
    id v19 = v11;
    id v20 = v8;
    id v21 = v12;
    PBDispatchAsyncCallback(v18);
  }
}

uint64_t __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (id)loadObjectOfClass:(Class)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PBItem_loadObjectOfClass_completionBlock___block_invoke;
  v10[3] = &unk_1E5556318;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(PBItem *)self _loadObjectOfClass:a3 context:0 completionBlock:v10];

  return v8;
}

uint64_t __44__PBItem_loadObjectOfClass_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)uikit_loadObjectOfClass:(Class)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PBItem_uikit_loadObjectOfClass_completionBlock___block_invoke;
  v10[3] = &unk_1E5556318;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(PBItem *)self _loadObjectOfClass:a3 context:0 completionBlock:v10];

  return v8;
}

uint64_t __50__PBItem_uikit_loadObjectOfClass_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)uikit_v2_loadObjectOfClass:(Class)a3 completionBlock:(id)a4
{
  return [(PBItem *)self _loadObjectOfClass:a3 context:0 completionBlock:a4];
}

- (void)_loadRepresentationAsType:(id)a3 context:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PBItem *)self representationConformingToType:v8];
  if (v11)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke;
    v17[3] = &unk_1E5555A00;
    uint64_t v12 = &v18;
    id v18 = v10;
    id v13 = (id)[v11 loadDataWithContext:v9 completion:v17];
LABEL_5:

    goto LABEL_6;
  }
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_3;
    v14[3] = &unk_1E5555FF8;
    uint64_t v12 = &v16;
    id v16 = v10;
    id v15 = v8;
    PBDispatchAsyncCallback(v14);

    goto LABEL_5;
  }
LABEL_6:
}

void __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_2;
    v11[3] = &unk_1E55562C8;
    id v15 = v10;
    id v12 = v7;
    id v13 = v8;
    id v14 = v9;
    PBDispatchAsyncCallback(v11);
  }
}

uint64_t __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], 0, a1[5], a1[6]);
}

void __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBTypeNotFoundError(*(void *)(a1 + 32), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

- (void)loadRepresentationAsType:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PBItem_loadRepresentationAsType_completionBlock___block_invoke;
  v8[3] = &unk_1E5556340;
  id v9 = v6;
  id v7 = v6;
  [(PBItem *)self _loadRepresentationAsType:a3 context:0 completionBlock:v8];
}

uint64_t __51__PBItem_loadRepresentationAsType_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uikit_loadRepresentationAsType:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PBItem_uikit_loadRepresentationAsType_completionBlock___block_invoke;
  v8[3] = &unk_1E5556340;
  id v9 = v6;
  id v7 = v6;
  [(PBItem *)self uikit_loadRepresentationAsType:a3 context:0 completionBlock:v8];
}

uint64_t __57__PBItem_uikit_loadRepresentationAsType_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uikit_v2_loadRepresentationAsType:(id)a3 completionBlock:(id)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PBItem;
  uint64_t v5 = [(PBItem *)&v43 init];
  id v6 = v5;
  if (v5)
  {
    [(PBItem *)v5 _commonInitGenerateUUID:0];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"typeOrder"];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v12];
      itemQueue_typeOrder = v6->_itemQueue_typeOrder;
      v6->_itemQueue_typeOrder = (NSMutableOrderedSet *)v13;
    }
    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    id v19 = [v4 decodeObjectOfClasses:v18 forKey:@"preferredRepresentation"];
    uint64_t v20 = [v19 mutableCopy];
    itemQueue_preferredRepresentationByType = v6->_itemQueue_preferredRepresentationByType;
    v6->_itemQueue_preferredRepresentationByType = (NSMutableDictionary *)v20;

    id v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    id v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    id v26 = [v4 decodeObjectOfClasses:v25 forKey:@"visibility"];
    uint64_t v27 = [v26 mutableCopy];
    itemQueue_visibilityByType = v6->_itemQueue_visibilityByType;
    v6->_itemQueue_visibilityByType = (NSMutableDictionary *)v27;

    id v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    long long v32 = objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    id v33 = [v4 decodeObjectOfClasses:v32 forKey:@"dataAvailability"];
    uint64_t v34 = [v33 mutableCopy];
    itemQueue_dataAvailabilityByType = v6->_itemQueue_dataAvailabilityByType;
    v6->_itemQueue_dataAvailabilityByType = (NSMutableDictionary *)v34;

    objc_super v36 = PBAllowedMetadataClasses();
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"metadata"];
    itemQueue_metadata = v6->_itemQueue_metadata;
    v6->_itemQueue_metadata = (NSDictionary *)v37;

    id v39 = PBAllowedMetadataClasses();
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"privateMetadata"];
    itemQueue_privateMetadata = v6->_itemQueue_privateMetadata;
    v6->_itemQueue_privateMetadata = (NSDictionary *)v40;

    v6->_itemQueue_isStoredOnServer = [v4 decodeBoolForKey:@"isStoredOnServer"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = __Block_byref_object_copy__1;
  uint64_t v52 = __Block_byref_object_dispose__1;
  id v53 = 0;
  uint64_t v42 = 0;
  objc_super v43 = &v42;
  uint64_t v44 = 0x3032000000;
  __int16 v45 = __Block_byref_object_copy__1;
  id v46 = __Block_byref_object_dispose__1;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__1;
  uint64_t v40 = __Block_byref_object_dispose__1;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__1;
  uint64_t v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  id v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v5 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PBItem_encodeWithCoder___block_invoke;
  block[3] = &unk_1E5556368;
  void block[4] = self;
  void block[5] = &v48;
  block[6] = &v42;
  void block[7] = &v36;
  block[8] = &v30;
  block[9] = &v24;
  block[10] = &v18;
  block[11] = &v14;
  dispatch_sync(v5, block);

  UUID = self->_UUID;
  if (UUID) {
    [v4 encodeObject:UUID forKey:@"UUID"];
  }
  uint64_t v7 = v49[5];
  if (v7) {
    [v4 encodeObject:v7 forKey:@"typeOrder"];
  }
  uint64_t v8 = v43[5];
  if (v8) {
    [v4 encodeObject:v8 forKey:@"preferredRepresentation"];
  }
  uint64_t v9 = v37[5];
  if (v9) {
    [v4 encodeObject:v9 forKey:@"visibility"];
  }
  uint64_t v10 = v31[5];
  if (v10) {
    [v4 encodeObject:v10 forKey:@"dataAvailability"];
  }
  uint64_t v11 = v25[5];
  if (v11) {
    [v4 encodeObject:v11 forKey:@"metadata"];
  }
  uint64_t v12 = v19[5];
  if (v12) {
    [v4 encodeObject:v12 forKey:@"privateMetadata"];
  }
  [v4 encodeBool:*((unsigned __int8 *)v15 + 24) forKey:@"isStoredOnServer"];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
}

uint64_t __26__PBItem_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) array];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  uint64_t v15 = [v14 copy];
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  char v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  uint64_t v19 = [v18 copy];
  uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isStoredOnServer");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = result;
  return result;
}

- (void)itemQueue_setDataTransferDelegate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    uint64_t v5 = self;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_itemQueue_representationByType allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setDataTransferDelegate:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  objc_storeWeak((id *)&self->_itemQueue_dataTransferDelegate, v4);
}

- (void)setDataTransferDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PBItem_setDataTransferDelegate___block_invoke;
  v7[3] = &unk_1E55559B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __34__PBItem_setDataTransferDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemQueue_setDataTransferDelegate:", *(void *)(a1 + 40));
}

- (PBItemDataTransferDelegate)dataTransferDelegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__PBItem_dataTransferDelegate__block_invoke;
  v6[3] = &unk_1E5555F30;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PBItemDataTransferDelegate *)v4;
}

uint64_t __30__PBItem_dataTransferDelegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)itemRepresentation:(id)a3 beganDataTransferWithProgress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PBItem *)self dataTransferDelegate];
  [v8 item:self representation:v7 beganDataTransferWithProgress:v6];
}

- (void)itemRepresentationFinishedDataTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [(PBItem *)self dataTransferDelegate];
  [v5 item:self representationFinishedDataTransfer:v4];
}

- (id)enumeratePatternDetectionsForPatterns:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_itemQueue_patternDetections;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = PBItemQueue();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__PBItem_enumeratePatternDetectionsForPatterns_usingBlock___block_invoke;
  v18[3] = &unk_1E5556390;
  id v19 = v6;
  uint64_t v20 = v8;
  id v22 = v7;
  id v11 = v9;
  id v21 = v11;
  id v12 = v7;
  long long v13 = v8;
  id v14 = v6;
  dispatch_sync(v10, v18);

  long long v15 = v21;
  id v16 = v11;

  return v16;
}

void __59__PBItem_enumeratePatternDetectionsForPatterns_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7, (void)v9);
        if (v8) {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        else {
          [*(id *)(a1 + 48) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)addPatternDetections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_itemQueue_patternDetections;
  id v6 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PBItem_addPatternDetections___block_invoke;
  block[3] = &unk_1E55563B8;
  long long v10 = v5;
  id v11 = v4;
  long long v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __31__PBItem_addPatternDetections___block_invoke(id *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1[4] addEntriesFromDictionary:a1[5]];
  id v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [a1[5] count];
    id v4 = [a1[6] UUID];
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_debug_impl(&dword_18D208000, v2, OS_LOG_TYPE_DEBUG, "Cached %lu detected patterns on item with UUID %@", (uint8_t *)&v5, 0x16u);
  }
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)PBItem;
  uint64_t v3 = [(PBItem *)&v9 description];
  id v4 = (void *)[v3 mutableCopy];

  int v5 = [(PBItem *)self UUID];
  [v4 appendFormat:@"\nUUID    : %@\n", v5];

  uint64_t v6 = [(PBItem *)self metadata];
  [v4 appendFormat:@"Metadata: %@\n", v6];

  __int16 v7 = [(PBItem *)self availableTypes];
  [v4 appendFormat:@"Types:\n%@\n", v7];

  return (NSString *)v4;
}

- (PBItem)initWithNSItemProvider:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(PBItem *)self init];
    uint64_t v30 = v5;
    if (v5)
    {
      uint64_t v6 = v5;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obuint64_t j = [v4 registeredTypeIdentifiers];
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v38 != v9) {
              objc_enumerationMutation(obj);
            }
            id v11 = objc_msgSend(v4, "_representationConformingToType:", *(void *)(*((void *)&v37 + 1) + 8 * i), v30);
            if (v11)
            {
              long long v12 = [[PBItemRepresentation alloc] initWithNSItemRepresentation:v11];
              if (objc_opt_respondsToSelector())
              {
                long long v13 = [(PBItemRepresentation *)v12 typeIdentifier];
                uint64_t v14 = [v4 isDataAvailableImmediatelyForTypeIdentifier:v13];

                uint64_t v6 = v30;
                [(PBItemRepresentation *)v12 setIsDataAvailableImmediately:v14];
              }
              [(PBItem *)v6 addRepresentation:v12];
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v8);
      }
    }
    long long v15 = objc_msgSend(v4, "_metadataValueForKey:", @"com.apple.Pasteboard.PBItemMetadata", v30);
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 mutableCopy];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v19 = (void *)v17;
    uint64_t v20 = [v4 suggestedName];
    id v21 = (void *)[v20 copy];

    if (v21) {
      [v19 setObject:v21 forKeyedSubscript:@"com.apple.Pasteboard.suggestedName"];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = PBNSIPTopLevelMetadataKeys();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          id v28 = [v4 _metadataValueForKey:v27];
          if (v28) {
            [v19 setObject:v28 forKeyedSubscript:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    [v31 setMetadata:v19];
    self = v31;

    uint64_t v18 = self;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (NSData)itemQueue_primaryData
{
  return self->_itemQueue_primaryData;
}

- (void)setItemQueue_primaryData:(id)a3
{
}

- (NSURL)itemQueue_primaryFileURL
{
  return self->_itemQueue_primaryFileURL;
}

- (void)setItemQueue_primaryFileURL:(id)a3
{
}

- (PBItemDataTransferDelegate)itemQueue_dataTransferDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemQueue_dataTransferDelegate);
  return (PBItemDataTransferDelegate *)WeakRetained;
}

- (void)setItemQueue_dataTransferDelegate:(id)a3
{
}

- (NSDictionary)itemQueue_privateMetadata
{
  return self->_itemQueue_privateMetadata;
}

- (void)setItemQueue_privateMetadata:(id)a3
{
}

- (NSMutableDictionary)itemQueue_representationByType
{
  return self->_itemQueue_representationByType;
}

- (void)setItemQueue_representationByType:(id)a3
{
}

- (NSMutableOrderedSet)itemQueue_typeOrder
{
  return self->_itemQueue_typeOrder;
}

- (void)setItemQueue_typeOrder:(id)a3
{
}

- (NSMutableDictionary)itemQueue_preferredRepresentationByType
{
  return self->_itemQueue_preferredRepresentationByType;
}

- (void)setItemQueue_preferredRepresentationByType:(id)a3
{
}

- (NSMutableDictionary)itemQueue_visibilityByType
{
  return self->_itemQueue_visibilityByType;
}

- (void)setItemQueue_visibilityByType:(id)a3
{
}

- (NSMutableDictionary)itemQueue_dataAvailabilityByType
{
  return self->_itemQueue_dataAvailabilityByType;
}

- (void)setItemQueue_dataAvailabilityByType:(id)a3
{
}

- (NSMutableDictionary)itemQueue_patternDetections
{
  return self->_itemQueue_patternDetections;
}

- (void)setItemQueue_patternDetections:(id)a3
{
}

- (id)itemQueue_localUserInfo
{
  return self->_itemQueue_localUserInfo;
}

- (void)setItemQueue_localUserInfo:(id)a3
{
}

- (NSObject)itemQueue_localObject
{
  return self->_itemQueue_localObject;
}

- (void)setItemQueue_localObject:(id)a3
{
}

- (NSDictionary)itemQueue_metadata
{
  return self->_itemQueue_metadata;
}

- (void)setItemQueue_metadata:(id)a3
{
}

- (BOOL)itemQueue_isStoredOnServer
{
  return self->_itemQueue_isStoredOnServer;
}

- (void)setItemQueue_isStoredOnServer:(BOOL)a3
{
  self->_itemQueue_isStoredOnServer = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_itemQueue_metadata, 0);
  objc_storeStrong((id *)&self->_itemQueue_localObject, 0);
  objc_storeStrong(&self->_itemQueue_localUserInfo, 0);
  objc_storeStrong((id *)&self->_itemQueue_patternDetections, 0);
  objc_storeStrong((id *)&self->_itemQueue_dataAvailabilityByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_visibilityByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_preferredRepresentationByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_typeOrder, 0);
  objc_storeStrong((id *)&self->_itemQueue_representationByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_privateMetadata, 0);
  objc_destroyWeak((id *)&self->_itemQueue_dataTransferDelegate);
  objc_storeStrong((id *)&self->_itemQueue_primaryFileURL, 0);
  objc_storeStrong((id *)&self->_itemQueue_primaryData, 0);
}

@end