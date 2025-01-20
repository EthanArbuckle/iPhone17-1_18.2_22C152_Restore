@interface PBItemCollection
+ (BOOL)supportsSecureCoding;
+ (id)allowedClassesForSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)establishConnectionToDataProviderCompletionBlock:(SEL)a3;
- (BOOL)canInstantiateObjectOfClass:(Class)a3;
- (BOOL)hasItemWithRepresentationConformingToType:(id)a3;
- (BOOL)hasItemWithRepresentationOfType:(id)a3;
- (BOOL)isDataProvider;
- (BOOL)isDeviceLockedPasteboard;
- (BOOL)isGeneralPasteboard;
- (BOOL)isLocalOnly;
- (BOOL)isOrWasRemote;
- (BOOL)isPersistent;
- (BOOL)isRemote;
- (BOOL)isRemoteDataLoaded;
- (BOOL)isRemoteMetadataLoaded;
- (BOOL)isSystemPasteboard;
- (BOOL)itemQueue_isDataProvider;
- (BOOL)itemQueue_isDeviceLockedPasteboard;
- (BOOL)itemQueue_isOrWasRemote;
- (BOOL)itemQueue_loadsDataSynchronously;
- (BOOL)itemQueue_originatorAllowedToCopyOnPaste;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)loadsDataSynchronously;
- (BOOL)originatorAllowedToCopyOnPaste;
- (NSArray)itemQueue_items;
- (NSArray)items;
- (NSData)itemQueue_originatorPersistentID;
- (NSData)originatorPersistentID;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDictionary)itemQueue_metadata;
- (NSDictionary)itemQueue_privateMetadata;
- (NSDictionary)metadata;
- (NSDictionary)privateMetadata;
- (NSHashTable)itemQueue_invalidationDelegates;
- (NSString)description;
- (NSString)itemQueue_originatorBundleID;
- (NSString)itemQueue_originatorLocalizedName;
- (NSString)itemQueue_originatorTeamID;
- (NSString)itemQueue_remoteDeviceName;
- (NSString)name;
- (NSString)originatorBundleID;
- (NSString)originatorLocalizedName;
- (NSString)originatorTeamID;
- (NSString)persistenceName;
- (NSString)remoteDeviceName;
- (NSUUID)UUID;
- (NSUUID)itemQueue_UUID;
- (NSUUID)itemQueue_saveBootSession;
- (NSUUID)saveBootSession;
- (NSXPCConnection)itemQueue_remoteDataProviderConnection;
- (NSXPCListener)itemQueue_dataConsumersListener;
- (NSXPCListenerEndpoint)dataConsumersEndpoint;
- (NSXPCListenerEndpoint)itemQueue_remoteDataProviderEndpoint;
- (PBItemCollection)init;
- (PBItemCollection)initWithCoder:(id)a3;
- (PBItemCollection)initWithItems:(id)a3;
- (PBItemCollectionDataTransferDelegate)dataTransferDelegate;
- (PBItemCollectionDataTransferDelegate)itemQueue_dataTransferDelegate;
- (UISPasteSharingToken)itemQueue_sharingToken;
- (UISPasteSharingToken)sharingToken;
- (id)_remoteDataProviderConnection;
- (id)availableRepresentationTypes;
- (id)copyWithDoNothingLoaders;
- (id)copyWithItems:(id)a3;
- (id)dataConsumersListener;
- (int64_t)changeCount;
- (int64_t)itemQueue_originatorDataOwner;
- (int64_t)itemQueue_remotePasteboardState;
- (int64_t)originatorDataOwner;
- (unint64_t)itemQueue_saveTimestamp;
- (unint64_t)saveTimestamp;
- (void)_setMetadataValue:(id)a3 forKey:(id)a4;
- (void)addInvalidationDelegate:(id)a3;
- (void)addItems:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)item:(id)a3 representation:(id)a4 beganDataTransferWithProgress:(id)a5;
- (void)item:(id)a3 representationFinishedDataTransfer:(id)a4;
- (void)registerLocalAvailableDerivedRepresentations;
- (void)removeInvalidationDelegate:(id)a3;
- (void)setChangeCount:(int64_t)a3;
- (void)setDataProviderEndpoint:(id)a3;
- (void)setDataTransferDelegate:(id)a3;
- (void)setDeviceLockedPasteboard:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIsOrWasRemote:(BOOL)a3;
- (void)setIsRemote:(BOOL)a3;
- (void)setItemQueue_UUID:(id)a3;
- (void)setItemQueue_dataConsumersListener:(id)a3;
- (void)setItemQueue_dataTransferDelegate:(id)a3;
- (void)setItemQueue_deviceLockedPasteboard:(BOOL)a3;
- (void)setItemQueue_invalidationDelegates:(id)a3;
- (void)setItemQueue_isDataProvider:(BOOL)a3;
- (void)setItemQueue_isOrWasRemote:(BOOL)a3;
- (void)setItemQueue_items:(id)a3;
- (void)setItemQueue_loadsDataSynchronously:(BOOL)a3;
- (void)setItemQueue_metadata:(id)a3;
- (void)setItemQueue_originatorAllowedToCopyOnPaste:(BOOL)a3;
- (void)setItemQueue_originatorBundleID:(id)a3;
- (void)setItemQueue_originatorDataOwner:(int64_t)a3;
- (void)setItemQueue_originatorLocalizedName:(id)a3;
- (void)setItemQueue_originatorPersistentID:(id)a3;
- (void)setItemQueue_originatorTeamID:(id)a3;
- (void)setItemQueue_privateMetadata:(id)a3;
- (void)setItemQueue_remoteDataProviderConnection:(id)a3;
- (void)setItemQueue_remoteDataProviderEndpoint:(id)a3;
- (void)setItemQueue_remoteDeviceName:(id)a3;
- (void)setItemQueue_remotePasteboardState:(int64_t)a3;
- (void)setItemQueue_saveBootSession:(id)a3;
- (void)setItemQueue_saveTimestamp:(unint64_t)a3;
- (void)setItemQueue_sharingToken:(id)a3;
- (void)setItems:(id)a3;
- (void)setLoadsDataSynchronously:(BOOL)a3;
- (void)setLocalOnly:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginatorAllowedToCopyOnPaste:(BOOL)a3;
- (void)setOriginatorBundleID:(id)a3;
- (void)setOriginatorDataOwner:(int64_t)a3;
- (void)setOriginatorLocalizedName:(id)a3;
- (void)setOriginatorPersistentID:(id)a3;
- (void)setOriginatorTeamID:(id)a3;
- (void)setPersistent:(BOOL)a3;
- (void)setPrivateMetadata:(id)a3;
- (void)setRemoteDataLoaded;
- (void)setRemoteDeviceName:(id)a3;
- (void)setRemoteMetadataLoaded;
- (void)setSaveBootSession:(id)a3;
- (void)setSaveTimestamp:(unint64_t)a3;
- (void)setSharingToken:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUsesServerConnectionToLoadDataWithAuthenticationBlock:(id)a3;
- (void)setUsesServerConnectionToLoadDataWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4;
- (void)shutdown;
- (void)waitForItemRequestsDeliveryCompletion:(id)a3;
@end

@implementation PBItemCollection

- (void)setName:(id)a3
{
}

uint64_t __28__PBItemCollection_isRemote__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result > 0;
  return result;
}

- (int64_t)itemQueue_remotePasteboardState
{
  return self->_itemQueue_remotePasteboardState;
}

uint64_t __47__PBItemCollection_setOriginatorLocalizedName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorLocalizedName:", *(void *)(a1 + 40));
}

uint64_t __46__PBItemCollection_setOriginatorPersistentID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorPersistentID:", *(void *)(a1 + 40));
}

uint64_t __43__PBItemCollection_setOriginatorDataOwner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorDataOwner:", *(void *)(a1 + 40));
}

uint64_t __42__PBItemCollection_setOriginatorBundleID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorBundleID:", *(void *)(a1 + 40));
}

uint64_t __40__PBItemCollection_setOriginatorTeamID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorTeamID:", *(void *)(a1 + 40));
}

uint64_t __39__PBItemCollection_setSaveBootSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_saveBootSession:", *(void *)(a1 + 40));
}

uint64_t __39__PBItemCollection_setPrivateMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_privateMetadata:", *(void *)(a1 + 40));
}

uint64_t __37__PBItemCollection_setSaveTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_saveTimestamp:", *(void *)(a1 + 40));
}

uint64_t __32__PBItemCollection_setMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_metadata:", *(void *)(a1 + 40));
}

uint64_t __28__PBItemCollection_setUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_UUID:", *(void *)(a1 + 40));
}

- (void)setItemQueue_saveTimestamp:(unint64_t)a3
{
  self->_itemQueue_saveTimestamp = a3;
}

- (void)setItemQueue_saveBootSession:(id)a3
{
}

- (void)setItemQueue_originatorTeamID:(id)a3
{
}

- (void)setItemQueue_originatorPersistentID:(id)a3
{
}

- (void)setItemQueue_originatorLocalizedName:(id)a3
{
}

- (void)setItemQueue_originatorDataOwner:(int64_t)a3
{
  self->_itemQueue_originatorDataOwner = a3;
}

- (void)setItemQueue_originatorBundleID:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __64__PBItemCollection_registerLocalAvailableDerivedRepresentations__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_items", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "itemQueue_registerLocalAvailableDerivedRepresentations");
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __28__PBItemCollection_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6++), "didInvalidateItemCollectionWithUUID:", *(void *)(*(void *)(a1 + 32) + 72), (void)v11);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

uint64_t __28__PBItemCollection_metadata__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  return MEMORY[0x1F41817F8]();
}

- (void)setSaveBootSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PBItemCollection_setSaveBootSession___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setOriginatorPersistentID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PBItemCollection_setOriginatorPersistentID___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSArray)items
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  long long v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__PBItemCollection_items__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setSaveTimestamp:(unint64_t)a3
{
  uint64_t v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PBItemCollection_setSaveTimestamp___block_invoke;
  v6[3] = &unk_1E5556550;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)setOriginatorLocalizedName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PBItemCollection_setOriginatorLocalizedName___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSUUID)UUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  long long v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__PBItemCollection_UUID__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSUUID *)v4;
}

- (void)setOriginatorTeamID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PBItemCollection_setOriginatorTeamID___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PBItemCollection_setUUID___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setOriginatorBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PBItemCollection_setOriginatorBundleID___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (int64_t)changeCount
{
  id v2 = [(PBItemCollection *)self metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"changeCount"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSDictionary)metadata
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  long long v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__PBItemCollection_metadata__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (PBItemCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PBItemCollection;
  uint64_t v5 = [(PBItemCollection *)&v34 init];
  if (v5)
  {
    id v6 = +[PBItem allowedClassesForSecureCoding];
    uint64_t v7 = [v6 setByAddingObject:objc_opt_class()];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"items"];
    itemQueue_items = v5->_itemQueue_items;
    v5->_itemQueue_items = (NSArray *)v8;

    v10 = PBAllowedMetadataClasses();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"metadata"];
    itemQueue_metadata = v5->_itemQueue_metadata;
    v5->_itemQueue_metadata = (NSDictionary *)v11;

    long long v13 = PBAllowedMetadataClasses();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"privateMetadata"];
    itemQueue_privateMetadata = v5->_itemQueue_privateMetadata;
    v5->_itemQueue_privateMetadata = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    itemQueue_UUID = v5->_itemQueue_UUID;
    v5->_itemQueue_UUID = (NSUUID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saveBootSession"];
    itemQueue_saveBootSession = v5->_itemQueue_saveBootSession;
    v5->_itemQueue_saveBootSession = (NSUUID *)v20;

    v5->_itemQueue_saveTimestamp = [v4 decodeInt64ForKey:@"saveTimestamp"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentIdentifier"];
    itemQueue_originatorPersistentID = v5->_itemQueue_originatorPersistentID;
    v5->_itemQueue_originatorPersistentID = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    itemQueue_originatorBundleID = v5->_itemQueue_originatorBundleID;
    v5->_itemQueue_originatorBundleID = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    itemQueue_originatorTeamID = v5->_itemQueue_originatorTeamID;
    v5->_itemQueue_originatorTeamID = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    itemQueue_originatorLocalizedName = v5->_itemQueue_originatorLocalizedName;
    v5->_itemQueue_originatorLocalizedName = (NSString *)v28;

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceLocked"];
    v5->_itemQueue_deviceLockedPasteboard = [v30 BOOLValue];

    v5->_itemQueue_originatorAllowedToCopyOnPaste = [v4 decodeBoolForKey:@"allowedToCopyOnPaste"];
    v5->_itemQueue_isOrWasRemote = [v4 decodeBoolForKey:@"isOrWasRemote"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDeviceName"];
    itemQueue_remoteDeviceName = v5->_itemQueue_remoteDeviceName;
    v5->_itemQueue_remoteDeviceName = (NSString *)v31;

    v5->_itemQueue_originatorDataOwner = [v4 decodeIntegerForKey:@"originatorDataOwner"];
  }

  return v5;
}

+ (id)allowedClassesForSecureCoding
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = +[PBItem allowedClassesForSecureCoding];
  id v12 = [v10 setByAddingObjectsFromSet:v11];

  return v12;
}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PBItemCollection_Pasteboard___setMetadataValue_forKey___block_invoke;
  block[3] = &unk_1E55563B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)isRemote
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__PBItemCollection_isRemote__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__3;
  v98 = __Block_byref_object_dispose__3;
  id v99 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__3;
  v92 = __Block_byref_object_dispose__3;
  id v93 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__3;
  v86 = __Block_byref_object_dispose__3;
  id v87 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__3;
  v80 = __Block_byref_object_dispose__3;
  id v81 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__3;
  v74 = __Block_byref_object_dispose__3;
  id v75 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__3;
  v64 = __Block_byref_object_dispose__3;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3;
  v52 = __Block_byref_object_dispose__3;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v4 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PBItemCollection_encodeWithCoder___block_invoke;
  block[3] = &unk_1E5556690;
  void block[5] = &v94;
  block[4] = self;
  block[6] = &v88;
  block[7] = &v82;
  block[8] = &v76;
  block[9] = &v70;
  block[10] = &v66;
  block[11] = &v60;
  block[12] = &v54;
  block[13] = &v48;
  block[14] = &v42;
  block[15] = &v38;
  block[16] = &v34;
  block[17] = &v30;
  block[18] = &v24;
  block[19] = &v20;
  dispatch_sync(v4, block);

  uint64_t v5 = v95[5];
  if (v5) {
    [v3 encodeObject:v5 forKey:@"items"];
  }
  uint64_t v6 = v89[5];
  if (v6) {
    [v3 encodeObject:v6 forKey:@"metadata"];
  }
  uint64_t v7 = v83[5];
  if (v7) {
    [v3 encodeObject:v7 forKey:@"privateMetadata"];
  }
  uint64_t v8 = v77[5];
  if (v8) {
    [v3 encodeObject:v8 forKey:@"UUID"];
  }
  char v9 = [(PBItemCollection *)self creationDate];
  if (v9) {
    [v3 encodeObject:v9 forKey:@"creationDate"];
  }
  uint64_t v10 = v71[5];
  if (v10) {
    [v3 encodeObject:v10 forKey:@"saveBootSession"];
  }
  uint64_t v11 = v67[3];
  if (v11) {
    [v3 encodeInt64:v11 forKey:@"saveTimestamp"];
  }
  uint64_t v12 = v61[5];
  if (v12) {
    [v3 encodeObject:v12 forKey:@"persistentIdentifier"];
  }
  uint64_t v13 = v55[5];
  if (v13) {
    [v3 encodeObject:v13 forKey:@"bundleIdentifier"];
  }
  uint64_t v14 = v49[5];
  if (v14) {
    [v3 encodeObject:v14 forKey:@"teamIdentifier"];
  }
  uint64_t v15 = v43[5];
  if (v15) {
    [v3 encodeObject:v15 forKey:@"localizedName"];
  }
  uint64_t v16 = v25[5];
  if (v16) {
    [v3 encodeObject:v16 forKey:@"remoteDeviceName"];
  }
  v17 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v35 + 24)];
  [v3 encodeObject:v17 forKey:@"deviceLocked"];

  [v3 encodeBool:*((unsigned __int8 *)v31 + 24) forKey:@"isOrWasRemote"];
  [v3 encodeBool:*((unsigned __int8 *)v21 + 24) forKey:@"allowedToCopyOnPaste"];
  [v3 encodeInteger:v39[3] forKey:@"originatorDataOwner"];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (id)copyWithItems:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  char v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = PBItemQueue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__PBItemCollection_copyWithItems___block_invoke;
  v8[3] = &unk_1E5556668;
  v8[4] = self;
  v8[5] = &v19;
  v8[6] = &v13;
  v8[7] = &v9;
  dispatch_sync(v5, v8);

  uint64_t v6 = [[PBItemCollection alloc] initWithItems:v4];
  [(PBItemCollection *)v6 setMetadata:v20[5]];
  [(PBItemCollection *)v6 setPrivateMetadata:v14[5]];
  [(PBItemCollection *)v6 setOriginatorDataOwner:v10[3]];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v6;
}

void __57__PBItemCollection_Pasteboard___setMetadataValue_forKey___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  id v6 = (id)[v2 mutableCopy];

  uint64_t v3 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = (id)v3;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = (void *)[v4 copy];
    [v7 setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  else
  {
    [v7 removeObjectForKey:*(void *)(a1 + 48)];
  }
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_metadata:", v7);
}

- (void)setItemQueue_metadata:(id)a3
{
}

- (PBItemCollection)initWithItems:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PBItemCollection;
  uint64_t v5 = [(PBItemCollection *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemQueue_items = v5->_itemQueue_items;
    v5->_itemQueue_items = (NSArray *)v6;

    v5->_itemQueue_isDataProvider = 1;
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    itemQueue_UUID = v5->_itemQueue_UUID;
    v5->_itemQueue_UUID = (NSUUID *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;
  }
  return v5;
}

- (void)setPrivateMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PBItemCollection_setPrivateMetadata___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setOriginatorDataOwner:(int64_t)a3
{
  uint64_t v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PBItemCollection_setOriginatorDataOwner___block_invoke;
  v6[3] = &unk_1E5556550;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__PBItemCollection_setMetadata___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setUsesServerConnectionToLoadDataWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke;
  block[3] = &unk_1E5556708;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)dealloc
{
  [(PBItemCollection *)self shutdown];
  v3.receiver = self;
  v3.super_class = (Class)PBItemCollection;
  [(PBItemCollection *)&v3 dealloc];
}

- (void)shutdown
{
  objc_super v3 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PBItemCollection_shutdown__block_invoke;
  block[3] = &unk_1E5555870;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemQueue_invalidationDelegates, 0);
  objc_destroyWeak((id *)&self->_itemQueue_dataTransferDelegate);
  objc_storeStrong((id *)&self->_itemQueue_remoteDeviceName, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorLocalizedName, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorTeamID, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorBundleID, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorPersistentID, 0);
  objc_storeStrong((id *)&self->_itemQueue_saveBootSession, 0);
  objc_storeStrong((id *)&self->_itemQueue_sharingToken, 0);
  objc_storeStrong((id *)&self->_itemQueue_UUID, 0);
  objc_storeStrong((id *)&self->_itemQueue_privateMetadata, 0);
  objc_storeStrong((id *)&self->_itemQueue_metadata, 0);
  objc_storeStrong((id *)&self->_itemQueue_items, 0);
  objc_storeStrong((id *)&self->_itemQueue_remoteDataProviderConnection, 0);
  objc_storeStrong((id *)&self->_itemQueue_remoteDataProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_itemQueue_dataConsumersListener, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)registerLocalAvailableDerivedRepresentations
{
  objc_super v3 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PBItemCollection_registerLocalAvailableDerivedRepresentations__block_invoke;
  block[3] = &unk_1E5555870;
  block[4] = self;
  dispatch_async(v3, block);
}

void __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(a1[4], "itemQueue_items");
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = 0;
    do
    {
      uint64_t v5 = objc_msgSend(a1[4], "itemQueue_items");
      id v6 = [v5 objectAtIndexedSubscript:v4];

      objc_msgSend(v6, "setItemQueue_isStoredOnServer:", 1);
      id v7 = objc_msgSend(v6, "itemQueue_typeOrder");
      id v8 = [v7 array];
      id v9 = (void *)[v8 copy];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v9;
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
            objc_initWeak(&location, a1[4]);
            uint64_t v14 = [PBItemRepresentation alloc];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_2;
            v20[3] = &unk_1E55566E0;
            objc_copyWeak(v23, &location);
            id v21 = a1[5];
            id v15 = a1[6];
            v23[1] = v4;
            id v22 = v15;
            v20[4] = v13;
            uint64_t v16 = [(PBItemRepresentation *)v14 initWithType:v13 preferredRepresentation:1 v3_loader:v20];
            objc_msgSend(v6, "itemQueue_setItemRepresentation:", v16);

            objc_destroyWeak(v23);
            objc_destroyWeak(&location);
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      v17 = objc_msgSend(a1[4], "itemQueue_items");
      unint64_t v18 = [v17 count];

      ++v4;
    }
    while ((unint64_t)v4 < v18);
  }
}

uint64_t __34__PBItemCollection_copyWithItems___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorDataOwner");
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __36__PBItemCollection_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_items");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_UUID");
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveBootSession");
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveTimestamp");
  uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorPersistentID");
  uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorBundleID");
  uint64_t v21 = *(void *)(*(void *)(a1 + 96) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  uint64_t v23 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorTeamID");
  uint64_t v24 = *(void *)(*(void *)(a1 + 104) + 8);
  long long v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v26 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorLocalizedName");
  uint64_t v27 = *(void *)(*(void *)(a1 + 112) + 8);
  long long v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;

  *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorDataOwner");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isDeviceLockedPasteboard");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isOrWasRemote");
  uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDeviceName");
  uint64_t v30 = *(void *)(*(void *)(a1 + 144) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorAllowedToCopyOnPaste");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = result;
  return result;
}

- (NSDictionary)itemQueue_metadata
{
  return self->_itemQueue_metadata;
}

- (NSArray)itemQueue_items
{
  return self->_itemQueue_items;
}

- (NSDictionary)itemQueue_privateMetadata
{
  return self->_itemQueue_privateMetadata;
}

- (int64_t)itemQueue_originatorDataOwner
{
  return self->_itemQueue_originatorDataOwner;
}

- (NSUUID)itemQueue_UUID
{
  return self->_itemQueue_UUID;
}

- (unint64_t)itemQueue_saveTimestamp
{
  return self->_itemQueue_saveTimestamp;
}

- (NSUUID)itemQueue_saveBootSession
{
  return self->_itemQueue_saveBootSession;
}

- (NSString)itemQueue_remoteDeviceName
{
  return self->_itemQueue_remoteDeviceName;
}

- (NSString)itemQueue_originatorTeamID
{
  return self->_itemQueue_originatorTeamID;
}

- (NSData)itemQueue_originatorPersistentID
{
  return self->_itemQueue_originatorPersistentID;
}

- (NSString)itemQueue_originatorLocalizedName
{
  return self->_itemQueue_originatorLocalizedName;
}

- (NSString)itemQueue_originatorBundleID
{
  return self->_itemQueue_originatorBundleID;
}

- (BOOL)itemQueue_originatorAllowedToCopyOnPaste
{
  return self->_itemQueue_originatorAllowedToCopyOnPaste;
}

- (BOOL)itemQueue_isOrWasRemote
{
  return self->_itemQueue_isOrWasRemote;
}

- (BOOL)itemQueue_isDeviceLockedPasteboard
{
  return self->_itemQueue_deviceLockedPasteboard;
}

- (void)setItemQueue_privateMetadata:(id)a3
{
}

- (void)setItemQueue_UUID:(id)a3
{
}

uint64_t __25__PBItemCollection_items__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_items");
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__PBItemCollection_UUID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_UUID");
  return MEMORY[0x1F41817F8]();
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PBItemCollection_setItems___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __29__PBItemCollection_setItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_items:", *(void *)(a1 + 40));
}

- (NSDictionary)privateMetadata
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PBItemCollection_privateMetadata__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __35__PBItemCollection_privateMetadata__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  return MEMORY[0x1F41817F8]();
}

- (NSXPCListenerEndpoint)dataConsumersEndpoint
{
  uint64_t v2 = [(PBItemCollection *)self dataConsumersListener];
  uint64_t v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (BOOL)isDataProvider
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PBItemCollection_isDataProvider__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __34__PBItemCollection_isDataProvider__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isDataProvider");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSUUID)saveBootSession
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PBItemCollection_saveBootSession__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSUUID *)v4;
}

uint64_t __35__PBItemCollection_saveBootSession__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveBootSession");
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)saveTimestamp
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PBItemCollection_saveTimestamp__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__PBItemCollection_saveTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveTimestamp");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSData)originatorPersistentID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PBItemCollection_originatorPersistentID__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

uint64_t __42__PBItemCollection_originatorPersistentID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorPersistentID");
  return MEMORY[0x1F41817F8]();
}

- (NSString)originatorBundleID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PBItemCollection_originatorBundleID__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __38__PBItemCollection_originatorBundleID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorBundleID");
  return MEMORY[0x1F41817F8]();
}

- (NSString)originatorTeamID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PBItemCollection_originatorTeamID__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __36__PBItemCollection_originatorTeamID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorTeamID");
  return MEMORY[0x1F41817F8]();
}

- (NSString)originatorLocalizedName
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PBItemCollection_originatorLocalizedName__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __43__PBItemCollection_originatorLocalizedName__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorLocalizedName");
  return MEMORY[0x1F41817F8]();
}

- (BOOL)originatorAllowedToCopyOnPaste
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PBItemCollection_originatorAllowedToCopyOnPaste__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __50__PBItemCollection_originatorAllowedToCopyOnPaste__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorAllowedToCopyOnPaste");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setOriginatorAllowedToCopyOnPaste:(BOOL)a3
{
  uint64_t v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PBItemCollection_setOriginatorAllowedToCopyOnPaste___block_invoke;
  v6[3] = &unk_1E5556578;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __54__PBItemCollection_setOriginatorAllowedToCopyOnPaste___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorAllowedToCopyOnPaste:", *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)originatorDataOwner
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PBItemCollection_originatorDataOwner__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__PBItemCollection_originatorDataOwner__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorDataOwner");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isDeviceLockedPasteboard
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PBItemCollection_isDeviceLockedPasteboard__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __44__PBItemCollection_isDeviceLockedPasteboard__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isDeviceLockedPasteboard");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDeviceLockedPasteboard:(BOOL)a3
{
  uint64_t v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PBItemCollection_setDeviceLockedPasteboard___block_invoke;
  v6[3] = &unk_1E5556578;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __46__PBItemCollection_setDeviceLockedPasteboard___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_deviceLockedPasteboard:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isOrWasRemote
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PBItemCollection_isOrWasRemote__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __33__PBItemCollection_isOrWasRemote__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isOrWasRemote");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setIsOrWasRemote:(BOOL)a3
{
  uint64_t v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PBItemCollection_setIsOrWasRemote___block_invoke;
  v6[3] = &unk_1E5556578;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __37__PBItemCollection_setIsOrWasRemote___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_isOrWasRemote:", *(unsigned __int8 *)(a1 + 40));
}

- (NSString)remoteDeviceName
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PBItemCollection_remoteDeviceName__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __36__PBItemCollection_remoteDeviceName__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDeviceName");
  return MEMORY[0x1F41817F8]();
}

- (void)setRemoteDeviceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PBItemCollection_setRemoteDeviceName___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __40__PBItemCollection_setRemoteDeviceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDeviceName:", *(void *)(a1 + 40));
}

- (UISPasteSharingToken)sharingToken
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PBItemCollection_sharingToken__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (UISPasteSharingToken *)v4;
}

uint64_t __32__PBItemCollection_sharingToken__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_sharingToken");
  return MEMORY[0x1F41817F8]();
}

- (void)setSharingToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PBItemCollection_setSharingToken___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __36__PBItemCollection_setSharingToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_sharingToken:", *(void *)(a1 + 40));
}

- (BOOL)loadsDataSynchronously
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PBItemCollection_loadsDataSynchronously__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __42__PBItemCollection_loadsDataSynchronously__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_loadsDataSynchronously");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setLoadsDataSynchronously:(BOOL)a3
{
  uint64_t v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PBItemCollection_setLoadsDataSynchronously___block_invoke;
  v6[3] = &unk_1E5556578;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __46__PBItemCollection_setLoadsDataSynchronously___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_loadsDataSynchronously:", *(unsigned __int8 *)(a1 + 40));
}

- (id)dataConsumersListener
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PBItemCollection_dataConsumersListener__block_invoke;
  v6[3] = &unk_1E5555BC0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__PBItemCollection_dataConsumersListener__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    [v3 setDelegate:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;
    id v6 = v3;

    [v6 resume];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(v2, "itemQueue_dataConsumersListener");
  return MEMORY[0x1F41817F8]();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;

  [v5 resume];
  return 1;
}

- (void)setDataProviderEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke;
  v7[3] = &unk_1E55559B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderEndpoint:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderConnection:", 0);
  if (*(void *)(a1 + 40))
  {
    uint64_t v17 = a1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    for (i = 0; ; ++i)
    {
      uint64_t v3 = objc_msgSend(*(id *)(v17 + 32), "itemQueue_items", v17);
      BOOL v4 = (unint64_t)i < [v3 count];

      if (!v4) {
        break;
      }
      id v5 = objc_msgSend(*(id *)(v17 + 32), "itemQueue_items");
      id v6 = [v5 objectAtIndexedSubscript:i];

      uint64_t v7 = objc_msgSend(v6, "itemQueue_typeOrder");
      id v8 = [v7 array];
      uint64_t v9 = (void *)[v8 copy];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            uint64_t v15 = [PBItemRepresentation alloc];
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2;
            v18[3] = &unk_1E5556618;
            objc_copyWeak(v19, &location);
            v18[4] = v14;
            v19[1] = i;
            uint64_t v16 = [(PBItemRepresentation *)v15 initWithType:v14 preferredRepresentation:0 v3_loader:v18];
            objc_msgSend(v6, "itemQueue_setItemRepresentation:", v16);

            objc_destroyWeak(v19);
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }
    }
    objc_destroyWeak(&location);
  }
}

id __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained _remoteDataProviderConnection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_3;
    v25[3] = &unk_1E55565A0;
    v25[4] = *(void *)(a1 + 32);
    id v8 = v4;
    id v26 = v8;
    uint64_t v9 = (void *)MEMORY[0x192F9AA30](v25);
    id v19 = v4;
    if (objc_msgSend(v6, "itemQueue_loadsDataSynchronously")) {
      [v7 synchronousRemoteObjectProxyWithErrorHandler:v9];
    }
    else {
    uint64_t v12 = [v7 remoteObjectProxyWithErrorHandler:v9];
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_20;
    v24[3] = &unk_1E55565C8;
    v24[4] = *(void *)(a1 + 32);
    uint64_t v13 = (void *)MEMORY[0x192F9AA30](v24);
    uint64_t v14 = [v7 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v11 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [v11 becomeCurrentWithPendingUnitCount:100];
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_22;
    v21[3] = &unk_1E55565F0;
    id v22 = v14;
    id v23 = v8;
    id v17 = v14;
    [v12 loadRepresentationForItemAtIndex:v15 type:v16 completionBlock:v21];
    [v11 resignCurrent];

    id v4 = v19;
  }
  else
  {
    id v10 = _PBLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18D208000, v10, OS_LOG_TYPE_FAULT, "Cannot retrieve a strong reference to PBItemCollection.", buf, 2u);
    }

    uint64_t v7 = PBCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
    (*((void (**)(id, void, void, void, void *, void))v4 + 2))(v4, 0, 0, 0, v7, 0);
    uint64_t v11 = 0;
  }

  return v11;
}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_fault_impl(&dword_18D208000, v4, OS_LOG_TYPE_FAULT, "Could not retrieve data representation of type %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = PBCannotLoadRepresentationError(*(void *)(a1 + 32), v3);
    (*(void (**)(uint64_t, void, void, void, void *, void))(v5 + 16))(v5, 0, 0, 0, v6, 0);
  }
}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_fault_impl(&dword_18D208000, v4, OS_LOG_TYPE_FAULT, "Could not call cleanup block for type %@. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2_23;
  v13[3] = &unk_1E55559B0;
  id v14 = v9;
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v11 = *(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, void *))(v10 + 16);
  id v12 = v9;
  v11(v10, a2, a3, 0, a4, v13);
}

uint64_t __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2_23(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "callCleanupBlockWithUUID:");
  }
  return result;
}

- (void)waitForItemRequestsDeliveryCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PBItemQueue();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke;
    v6[3] = &unk_1E5555EE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_2;
    v7[3] = &unk_1E5555BE8;
    id v8 = *(id *)(a1 + 40);
    uint64_t v2 = (void *)MEMORY[0x192F9AA30](v7);
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxyWithErrorHandler:v2];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_26;
    v5[3] = &unk_1E55558C0;
    id v6 = *(id *)(a1 + 40);
    [v3 waitForItemRequestsDeliveryCompletion:v5];
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    PBDispatchAsyncCallback(v4);
  }
}

void __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_fault_impl(&dword_18D208000, v4, OS_LOG_TYPE_FAULT, "Could not wait for item requests delivery. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  PBDispatchAsyncCallback(*(void **)(a1 + 32));
}

void __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_26(uint64_t a1)
{
}

- (id)_remoteDataProviderConnection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PBItemCollection__remoteDataProviderConnection__block_invoke;
  v6[3] = &unk_1E5555BC0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__PBItemCollection__remoteDataProviderConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderConnection");
  if (v2)
  {
  }
  else
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderEndpoint");

    if (v3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F29268]);
      int v5 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderEndpoint");
      id v6 = (void *)[v4 initWithListenerEndpoint:v5];

      uint64_t v7 = PBNewDataProviderXPCInterface();
      [v6 setRemoteObjectInterface:v7];

      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __49__PBItemCollection__remoteDataProviderConnection__block_invoke_2;
      id v14 = &unk_1E5556640;
      objc_copyWeak(&v15, &location);
      [v6 setInvalidationHandler:&v11];
      objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderConnection:", v6, v11, v12, v13, v14);
      [v6 resume];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderConnection");
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __49__PBItemCollection__remoteDataProviderConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PBItemQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PBItemCollection__remoteDataProviderConnection__block_invoke_3;
    block[3] = &unk_1E5555870;
    block[4] = WeakRetained;
    dispatch_sync(v2, block);
  }
}

uint64_t __49__PBItemCollection__remoteDataProviderConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_fault_impl(&dword_18D208000, v2, OS_LOG_TYPE_FAULT, "Connection to data provider has been invalidated.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderConnection:", 0);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)establishConnectionToDataProviderCompletionBlock:(SEL)a3
{
  id v6 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke;
  v20[3] = &unk_1E55558C0;
  id v21 = v6;
  id v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x192F9AA30](v20);
  uint64_t v9 = [(PBItemCollection *)self _remoteDataProviderConnection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke_2;
  uint64_t v18 = &unk_1E5555BE8;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:&v15];

  objc_msgSend(v11, "helloCompletionBlock:", v10, v15, v16, v17, v18);
  uint64_t v12 = [(PBItemCollection *)self _remoteDataProviderConnection];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

uint64_t __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315394;
    id v6 = "-[PBItemCollection establishConnectionToDataProviderCompletionBlock:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_fault_impl(&dword_18D208000, v4, OS_LOG_TYPE_FAULT, "%s could not establish connection to data provider. Error: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PBItemCollection)init
{
  return [(PBItemCollection *)self initWithItems:0];
}

- (id)copyWithDoNothingLoaders
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  id v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PBItemCollection_copyWithDoNothingLoaders__block_invoke;
  v6[3] = &unk_1E5555BC0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(PBItemCollection *)self copyWithItems:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__PBItemCollection_copyWithDoNothingLoaders__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "_itemQueue_copyWithDoNothingRepresentations", (void)v8);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PBItemCollection_addItems___block_invoke;
  v7[3] = &unk_1E55559B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __29__PBItemCollection_addItems___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) mutableCopy];
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (BOOL)hasItemWithRepresentationOfType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PBItemCollection *)self items];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
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
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "hasRepresentationOfType:", v4, (void)v10))
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

- (BOOL)hasItemWithRepresentationConformingToType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PBItemCollection *)self items];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
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
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "hasRepresentationConformingToType:", v4, (void)v10))
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

- (BOOL)canInstantiateObjectOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(PBItemCollection *)self items];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "canInstantiateObjectOfClass:", a3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)availableRepresentationTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(PBItemCollection *)self items];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "availableTypes", (void)v12);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = [v3 allObjects];

  return v10;
}

- (void)setUsesServerConnectionToLoadDataWithAuthenticationBlock:(id)a3
{
}

id __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [v8 becomeCurrentWithPendingUnitCount:100];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v19 = (*(void (**)(void))(v9 + 16))();
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      uint64_t v18 = (*(uint64_t (**)(void))(v11 + 16))();
    }
    else {
      uint64_t v18 = 0;
    }
    long long v12 = +[PBServerConnection defaultConnection];
    long long v13 = [WeakRetained name];
    long long v14 = [WeakRetained UUID];
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_3;
    v20[3] = &unk_1E55566B8;
    id v21 = v6;
    [v12 requestItemFromPasteboardWithName:v13 UUID:v14 authenticationMessage:v19 itemIndex:v15 typeIdentifier:v16 dataOwner:v18 loadContext:v5 completionBlock:v20];

    [v8 resignCurrent];
  }
  else
  {
    if (v6)
    {
      long long v10 = PBCannotLoadRepresentationError(*(void *)(a1 + 32), 0);
      (*((void (**)(id, void, void, void, void *, void))v6 + 2))(v6, 0, 0, 0, v10, 0);
    }
    id v8 = 0;
  }

  return v8;
}

uint64_t __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(result + 16))(result, a2, a3, a4, a5, 0);
  }
  return result;
}

- (void)addInvalidationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PBItemCollection_addInvalidationDelegate___block_invoke;
  v7[3] = &unk_1E55559B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__PBItemCollection_addInvalidationDelegate___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_invalidationDelegates");

  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    objc_msgSend(*(id *)(a1 + 32), "setItemQueue_invalidationDelegates:", v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_invalidationDelegates");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:*(void *)(a1 + 40)];
}

- (void)removeInvalidationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PBItemCollection_removeInvalidationDelegate___block_invoke;
  v7[3] = &unk_1E55559B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__PBItemCollection_removeInvalidationDelegate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_invalidationDelegates");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)setIsRemote:(BOOL)a3
{
  id v5 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PBItemCollection_setIsRemote___block_invoke;
  v6[3] = &unk_1E5556578;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __32__PBItemCollection_setIsRemote___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
    if (v2 <= 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = v2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remotePasteboardState:", v3);
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "setItemQueue_isOrWasRemote:", 1);
  }
  return result;
}

- (BOOL)isRemoteMetadataLoaded
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PBItemCollection_isRemoteMetadataLoaded__block_invoke;
  v5[3] = &unk_1E5555F30;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __42__PBItemCollection_isRemoteMetadataLoaded__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result > 1;
  return result;
}

- (void)setRemoteMetadataLoaded
{
  uint64_t v3 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PBItemCollection_setRemoteMetadataLoaded__block_invoke;
  block[3] = &unk_1E5555870;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __43__PBItemCollection_setRemoteMetadataLoaded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remotePasteboardState:", 2);
}

- (BOOL)isRemoteDataLoaded
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = PBItemQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PBItemCollection_isRemoteDataLoaded__block_invoke;
  v5[3] = &unk_1E5555F30;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __38__PBItemCollection_isRemoteDataLoaded__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 3;
  return result;
}

- (void)setRemoteDataLoaded
{
  uint64_t v3 = PBItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PBItemCollection_setRemoteDataLoaded__block_invoke;
  block[3] = &unk_1E5555870;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __39__PBItemCollection_setRemoteDataLoaded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remotePasteboardState:", 3);
}

- (void)setDataTransferDelegate:(id)a3
{
  id v4 = a3;
  id v5 = PBItemQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PBItemCollection_setDataTransferDelegate___block_invoke;
  v7[3] = &unk_1E55559B0;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__PBItemCollection_setDataTransferDelegate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = *(void **)(a1 + 40);
  }
  id v3 = v2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 40) + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "itemQueue_setDataTransferDelegate:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_storeWeak((id *)(*(void *)(a1 + 40) + 160), *(id *)(a1 + 32));
}

- (PBItemCollectionDataTransferDelegate)dataTransferDelegate
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__3;
  long long v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v3 = PBItemQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PBItemCollection_dataTransferDelegate__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PBItemCollectionDataTransferDelegate *)v4;
}

uint64_t __40__PBItemCollection_dataTransferDelegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  return MEMORY[0x1F41817F8]();
}

- (void)item:(id)a3 representation:(id)a4 beganDataTransferWithProgress:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PBItemCollection *)self dataTransferDelegate];
  [v11 itemCollection:self item:v10 representation:v9 beganDataTransferWithProgress:v8];
}

- (void)item:(id)a3 representationFinishedDataTransfer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PBItemCollection *)self dataTransferDelegate];
  [v8 itemCollection:self item:v7 representationFinishedDataTransfer:v6];
}

- (NSString)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PBItemCollection;
  id v3 = [(PBItemCollection *)&v26 description];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(PBItemCollection *)self name];
  BOOL v6 = [(PBItemCollection *)self isSystemPasteboard];
  id v7 = &stru_1EDBD7C58;
  if (v6) {
    id v7 = @" (System)";
  }
  [v4 appendFormat:@"\nName               : %@%@\n", v5, v7];

  id v8 = [(PBItemCollection *)self persistenceName];
  [v4 appendFormat:@"Persistence name   : %@\n", v8];

  id v9 = [(PBItemCollection *)self UUID];
  [v4 appendFormat:@"UUID               : %@\n", v9];

  id v10 = [(PBItemCollection *)self creationDate];
  [v4 appendFormat:@"Creation date      : %@\n", v10];

  id v11 = [(PBItemCollection *)self originatorBundleID];
  [v4 appendFormat:@"Originator BundleID: %@\n", v11];

  id v12 = [(PBItemCollection *)self originatorTeamID];
  [v4 appendFormat:@"Originator TeamID  : %@\n", v12];

  long long v13 = [(PBItemCollection *)self originatorLocalizedName];
  [v4 appendFormat:@"Originator localized name: %@\n", v13];

  uint64_t v14 = [(PBItemCollection *)self metadata];
  [v4 appendFormat:@"Metadata           : %@\n", v14];

  uint64_t v15 = [(PBItemCollection *)self items];
  objc_msgSend(v4, "appendFormat:", @"Items: %u\n", objc_msgSend(v15, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = [(PBItemCollection *)self items];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [v4 appendFormat:@"%@\n", *(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v18);
  }

  return (NSString *)v4;
}

- (NSXPCListener)itemQueue_dataConsumersListener
{
  return self->_itemQueue_dataConsumersListener;
}

- (void)setItemQueue_dataConsumersListener:(id)a3
{
}

- (NSXPCListenerEndpoint)itemQueue_remoteDataProviderEndpoint
{
  return self->_itemQueue_remoteDataProviderEndpoint;
}

- (void)setItemQueue_remoteDataProviderEndpoint:(id)a3
{
}

- (NSXPCConnection)itemQueue_remoteDataProviderConnection
{
  return self->_itemQueue_remoteDataProviderConnection;
}

- (void)setItemQueue_remoteDataProviderConnection:(id)a3
{
}

- (void)setItemQueue_items:(id)a3
{
}

- (UISPasteSharingToken)itemQueue_sharingToken
{
  return self->_itemQueue_sharingToken;
}

- (void)setItemQueue_sharingToken:(id)a3
{
}

- (BOOL)itemQueue_isDataProvider
{
  return self->_itemQueue_isDataProvider;
}

- (void)setItemQueue_isDataProvider:(BOOL)a3
{
  self->_itemQueue_isDataProvider = a3;
}

- (void)setItemQueue_originatorAllowedToCopyOnPaste:(BOOL)a3
{
  self->_itemQueue_originatorAllowedToCopyOnPaste = a3;
}

- (void)setItemQueue_deviceLockedPasteboard:(BOOL)a3
{
  self->_itemQueue_deviceLockedPasteboard = a3;
}

- (void)setItemQueue_isOrWasRemote:(BOOL)a3
{
  self->_itemQueue_isOrWasRemote = a3;
}

- (void)setItemQueue_remoteDeviceName:(id)a3
{
}

- (void)setItemQueue_remotePasteboardState:(int64_t)a3
{
  self->_itemQueue_remotePasteboardState = a3;
}

- (PBItemCollectionDataTransferDelegate)itemQueue_dataTransferDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemQueue_dataTransferDelegate);
  return (PBItemCollectionDataTransferDelegate *)WeakRetained;
}

- (void)setItemQueue_dataTransferDelegate:(id)a3
{
}

- (NSHashTable)itemQueue_invalidationDelegates
{
  return self->_itemQueue_invalidationDelegates;
}

- (void)setItemQueue_invalidationDelegates:(id)a3
{
}

- (BOOL)itemQueue_loadsDataSynchronously
{
  return self->_itemQueue_loadsDataSynchronously;
}

- (void)setItemQueue_loadsDataSynchronously:(BOOL)a3
{
  self->_itemQueue_loadsDataSynchronously = a3;
}

- (NSString)name
{
  uint64_t v2 = [(PBItemCollection *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:@"name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isSystemPasteboard
{
  uint64_t v2 = [(PBItemCollection *)self name];
  char v3 = [v2 isEqualToString:@"com.apple.UIKit.pboard.general"];

  return v3;
}

- (NSString)persistenceName
{
  char v3 = [(PBItemCollection *)self name];
  id v4 = [(PBItemCollection *)self originatorBundleID];
  uint64_t v5 = [(PBItemCollection *)self originatorTeamID];
  BOOL v6 = PBPasteboardPersistenceName(v3, v4, v5, [(PBItemCollection *)self isDeviceLockedPasteboard]);

  return (NSString *)v6;
}

- (void)setChangeCount:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(PBItemCollection *)self _setMetadataValue:v4 forKey:@"changeCount"];
}

- (BOOL)isGeneralPasteboard
{
  uint64_t v2 = [(PBItemCollection *)self name];
  char v3 = [v2 isEqualToString:@"com.apple.UIKit.pboard.general"];

  return v3;
}

- (void)setPersistent:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(PBItemCollection *)self _setMetadataValue:v4 forKey:@"persistent"];
}

- (BOOL)isPersistent
{
  if ([(PBItemCollection *)self isSystemPasteboard]) {
    return 1;
  }
  id v4 = [(PBItemCollection *)self metadata];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"persistent"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (NSDate)expirationDate
{
  uint64_t v2 = [(PBItemCollection *)self metadata];
  char v3 = [v2 objectForKeyedSubscript:@"expirationDate"];

  return (NSDate *)v3;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isLocalOnly
{
  uint64_t v2 = [(PBItemCollection *)self metadata];
  char v3 = [v2 objectForKeyedSubscript:@"localOnly"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setLocalOnly:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(PBItemCollection *)self _setMetadataValue:v4 forKey:@"localOnly"];
}

@end