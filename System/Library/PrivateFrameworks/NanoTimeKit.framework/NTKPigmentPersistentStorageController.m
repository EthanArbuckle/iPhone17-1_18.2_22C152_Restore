@interface NTKPigmentPersistentStorageController
+ (id)faceColorRootFolder;
+ (id)globalStoresFolder;
+ (id)perDeviceFolder;
+ (id)syncStoresFolder;
- (BOOL)createColorSyncFolderIfNeededForDeviceUUID:(id)a3;
- (BOOL)createFolderIfNeeded:(id)a3;
- (NTKPigmentPersistentStorageController)init;
- (NTKPigmentPersistentStorageController)initWithRootDirectory:(id)a3;
- (id)_sharedCollections;
- (id)colorDomainFilePath:(id)a3 deviceUUID:(id)a4;
- (id)colorSyncFolderPathWithDeviceUUID:(id)a3;
- (id)device;
- (id)facePigmentSetForDomain:(id)a3 sharedCollections:(id)a4;
- (id)readPigmentSetFromData:(id)a3 sharedCollections:(id)a4;
- (id)readSharedCollectionsFromData:(id)a3;
- (id)serializeFacePigmentSet:(id)a3;
- (id)sharedCollections;
- (id)transactionLockerFileNameForDeviceUUID:(id)a3;
- (void)_sharedCollections;
- (void)_writeData:(id)a3 toFile:(id)a4;
- (void)closeTransactionForDeviceUUID:(id)a3;
- (void)deleteContent;
- (void)persistFacePigmentSet:(id)a3 deviceUUID:(id)a4;
- (void)persistFacePigmentSetData:(id)a3 domain:(id)a4 deviceUUID:(id)a5;
- (void)persistSharedCollections:(id)a3 deviceUUID:(id)a4;
- (void)persistSharedCollectionsData:(id)a3 deviceUUID:(id)a4;
- (void)startTransactionForDeviceUUID:(id)a3;
@end

@implementation NTKPigmentPersistentStorageController

- (NTKPigmentPersistentStorageController)init
{
  v3 = [(id)objc_opt_class() perDeviceFolder];
  v4 = [(NTKPigmentPersistentStorageController *)self initWithRootDirectory:v3];

  return v4;
}

- (NTKPigmentPersistentStorageController)initWithRootDirectory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKPigmentPersistentStorageController;
  v6 = [(NTKPigmentPersistentStorageController *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentPersistentStorageController", v7);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_rootDirectory, a3);
  }

  return v6;
}

- (id)facePigmentSetForDomain:(id)a3 sharedCollections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__48;
  v21 = __Block_byref_object_dispose__48;
  id v22 = 0;
  privateQueue = self->_privateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke;
  v13[3] = &unk_1E62C2928;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(privateQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A30] currentDevice];
  v3 = [v2 nrDevice];
  v4 = [v3 valueForProperty:*MEMORY[0x1E4F79E10]];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = (uint64_t *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) colorDomainFilePath:*(void *)(a1 + 40) deviceUUID:v4];
  if ([v5 fileExistsAtPath:v7])
  {
    id v14 = 0;
    dispatch_queue_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:1 error:&v14];
    id v9 = v14;
    if (v8)
    {
      uint64_t v10 = [*(id *)(a1 + 32) readPigmentSetFromData:v8 sharedCollections:*(void *)(a1 + 48)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      v12 = *(NSObject **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke_cold_1(v6);
      }
    }
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *v6;
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_INFO, "#persistence No stored color data for domain %{public}@", buf, 0xCu);
    }
  }
}

- (id)sharedCollections
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__48;
  uint64_t v10 = __Block_byref_object_dispose__48;
  id v11 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__NTKPigmentPersistentStorageController_sharedCollections__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__NTKPigmentPersistentStorageController_sharedCollections__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _sharedCollections];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_sharedCollections
{
  uint64_t v3 = [MEMORY[0x1E4F19A30] currentDevice];
  v4 = [v3 nrDevice];
  id v5 = [v4 valueForProperty:*MEMORY[0x1E4F79E10]];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [(NTKPigmentPersistentStorageController *)self colorDomainFilePath:@"sharedCollections" deviceUUID:v5];
  if ([v6 fileExistsAtPath:v7])
  {
    id v13 = 0;
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:1 error:&v13];
    id v9 = v13;
    if (v8)
    {
      uint64_t v10 = [(NTKPigmentPersistentStorageController *)self readSharedCollectionsFromData:v8];

      goto LABEL_10;
    }
    id v11 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController _sharedCollections]();
    }
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController _sharedCollections]();
    }
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

- (void)persistFacePigmentSetData:(id)a3 domain:(id)a4 deviceUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  privateQueue = self->_privateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__NTKPigmentPersistentStorageController_persistFacePigmentSetData_domain_deviceUUID___block_invoke;
  v15[3] = &unk_1E62C32F8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(privateQueue, v15);
}

void __85__NTKPigmentPersistentStorageController_persistFacePigmentSetData_domain_deviceUUID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) createColorSyncFolderIfNeededForDeviceUUID:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) colorDomainFilePath:*(void *)(a1 + 48) deviceUUID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _writeData:*(void *)(a1 + 56) toFile:v2];
}

- (void)_writeData:(id)a3 toFile:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v10 = 0;
  char v6 = [a3 writeToFile:v5 options:268435457 error:&v10];
  id v7 = v10;
  id v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_INFO, "#persistence Persisted synced pigment options %{public}@.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[NTKPigmentPersistentStorageController _writeData:toFile:]((uint64_t)v5);
  }
}

- (void)persistFacePigmentSet:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 collectionBySlots];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [v6 domain];
    if ([v10 length])
    {
      id v11 = [(NTKPigmentPersistentStorageController *)self serializeFacePigmentSet:v6];
      [(NTKPigmentPersistentStorageController *)self persistFacePigmentSetData:v11 domain:v10 deviceUUID:v7];
    }
    else
    {
      id v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NTKPigmentPersistentStorageController persistFacePigmentSet:deviceUUID:]();
      }
    }
  }
  else
  {
    id v10 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController persistFacePigmentSet:deviceUUID:]();
    }
  }
}

- (void)persistSharedCollections:(id)a3 deviceUUID:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = +[NTKProtoSharedCollections protoBufferFromSharedCollections:a3];
    id v8 = [v7 data];
    [(NTKPigmentPersistentStorageController *)self persistSharedCollectionsData:v8 deviceUUID:v6];
  }
  else
  {
    uint64_t v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController persistSharedCollections:deviceUUID:]();
    }
  }
}

- (void)persistSharedCollectionsData:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__NTKPigmentPersistentStorageController_persistSharedCollectionsData_deviceUUID___block_invoke;
  block[3] = &unk_1E62C04F0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(privateQueue, block);
}

void __81__NTKPigmentPersistentStorageController_persistSharedCollectionsData_deviceUUID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) createColorSyncFolderIfNeededForDeviceUUID:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) colorDomainFilePath:@"sharedCollections" deviceUUID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _writeData:*(void *)(a1 + 48) toFile:v2];
}

- (void)closeTransactionForDeviceUUID:(id)a3
{
  id v4 = a3;
  privateQueue = self->_privateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(privateQueue, v7);
}

void __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) transactionLockerFileNameForDeviceUUID:*(void *)(a1 + 40)];
  if ([v2 fileExistsAtPath:v3])
  {
    id v9 = 0;
    int v4 = [v2 removeItemAtPath:v3 error:&v9];
    id v5 = v9;
    if (!v4 || v5 != 0)
    {
      id v7 = v5;
      id v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke_cold_1();
      }
    }
  }
}

- (void)deleteContent
{
  [(NTKPigmentPersistentStorageController *)self resetCache];
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(privateQueue, block);
}

void __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#persistence Deleting root directory. %{public}@", buf, 0xCu);
  }

  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 16)])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    id v9 = 0;
    char v6 = [v4 removeItemAtPath:v5 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      id v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke_cold_1();
      }
    }
  }
}

- (void)startTransactionForDeviceUUID:(id)a3
{
  id v4 = a3;
  privateQueue = self->_privateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__NTKPigmentPersistentStorageController_startTransactionForDeviceUUID___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(privateQueue, v7);
}

void __71__NTKPigmentPersistentStorageController_startTransactionForDeviceUUID___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) createColorSyncFolderIfNeededForDeviceUUID:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) transactionLockerFileNameForDeviceUUID:*(void *)(a1 + 40)];
  if (([v2 fileExistsAtPath:v3] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) transactionLockerFileNameForDeviceUUID:*(void *)(a1 + 40)];
    uint64_t v6 = *MEMORY[0x1E4F28370];
    v7[0] = *MEMORY[0x1E4F28378];
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 createFileAtPath:v4 contents:0 attributes:v5];
  }
}

- (id)device
{
  id v2 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  uint64_t v3 = [v2 device];

  return v3;
}

- (id)transactionLockerFileNameForDeviceUUID:(id)a3
{
  uint64_t v3 = [(NTKPigmentPersistentStorageController *)self colorSyncFolderPathWithDeviceUUID:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"__TRANSACTION_IN_PROGRESS__"];

  return v4;
}

- (BOOL)createColorSyncFolderIfNeededForDeviceUUID:(id)a3
{
  id v4 = [(NTKPigmentPersistentStorageController *)self colorSyncFolderPathWithDeviceUUID:a3];
  BOOL v5 = [(NTKPigmentPersistentStorageController *)self createFolderIfNeeded:v4];
  if (!v5)
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController createColorSyncFolderIfNeededForDeviceUUID:]();
    }
  }
  return v5;
}

+ (id)faceColorRootFolder
{
  return @"/var/mobile/Library/NanoTimeKit/FaceColorStores/";
}

+ (id)syncStoresFolder
{
  return @"/var/mobile/Library/NanoTimeKit/Sync/FaceColorStores/";
}

+ (id)globalStoresFolder
{
  id v2 = [a1 faceColorRootFolder];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"GlobalStores"];

  return v3;
}

+ (id)perDeviceFolder
{
  id v2 = [a1 faceColorRootFolder];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"PerDeviceStores"];

  return v3;
}

- (id)colorSyncFolderPathWithDeviceUUID:(id)a3
{
  id v4 = self->_rootDirectory;
  if (a3)
  {
    BOOL v5 = [a3 UUIDString];
    uint64_t v6 = [(NSString *)v4 stringByAppendingPathComponent:v5];

    id v4 = (NSString *)v6;
  }

  return v4;
}

- (id)colorDomainFilePath:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = [(NTKPigmentPersistentStorageController *)self colorSyncFolderPathWithDeviceUUID:a4];
  id v8 = [NSString stringWithFormat:@"%@.protobuffer", v6];

  id v9 = [v7 stringByAppendingPathComponent:v8];

  return v9;
}

- (BOOL)createFolderIfNeeded:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v13 = 0;
  if ([v4 fileExistsAtPath:v3 isDirectory:&v13]) {
    BOOL v5 = v13 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v14 = *MEMORY[0x1E4F28370];
    v15[0] = *MEMORY[0x1E4F28378];
    BOOL v10 = 1;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = 0;
    int v7 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v6 error:&v12];
    id v8 = v12;

    if (!v7 || v8)
    {
      id v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NTKPigmentPersistentStorageController createFolderIfNeeded:]((uint64_t)v3);
      }

      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)readPigmentSetFromData:(id)a3 sharedCollections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [[NTKProtoFacePigmentSet alloc] initWithData:v5];
  if (v7)
  {
    id v8 = +[NTKFacePigmentSet facePigmentSetFromProtoBuffer:v7 sharedCollections:v6];
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController readPigmentSetFromData:sharedCollections:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (id)readSharedCollectionsFromData:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKProtoSharedCollections alloc] initWithData:v3];

  id v5 = [(NTKProtoSharedCollections *)v4 sharedCollectionsDictionary];

  return v5;
}

- (id)serializeFacePigmentSet:(id)a3
{
  id v3 = a3;
  id v4 = [v3 protoBuffer];
  id v5 = [v4 data];

  if (!v5)
  {
    id v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKPigmentPersistentStorageController serializeFacePigmentSet:]();
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDirectory, 0);

  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v1, v2, "#persistence Failed to read color sync data for domain %{public}@ - %{public}@", (void)v3, DWORD2(v3));
}

- (void)_sharedCollections
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "#persistence No synced color data for shared collections", v2, v3, v4, v5, v6);
}

- (void)_writeData:(uint64_t)a1 toFile:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v1, v2, "#persistence Failed to write pigment options to file %{public}@ - %{public}@", (void)v3, DWORD2(v3));
}

- (void)persistFacePigmentSet:deviceUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "#persistence Synced empty options. Ignoring it.", v2, v3, v4, v5, v6);
}

- (void)persistFacePigmentSet:deviceUUID:.cold.2()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "#persistence No domain for synced pigment options. Ignoring it.", v2, v3, v4, v5, v6);
}

- (void)persistSharedCollections:deviceUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "#persistence Received empty shared collection to persist.", v2, v3, v4, v5, v6);
}

void __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#persistence Failed deleting file while closing transaction. %{public}@", v2, v3, v4, v5, v6);
}

void __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#persistence Failed deleting root directory. %{public}@", v2, v3, v4, v5, v6);
}

- (void)createColorSyncFolderIfNeededForDeviceUUID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#persistence Failed to create device specific folder at path %{public}@", v2, v3, v4, v5, v6);
}

- (void)createFolderIfNeeded:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v1, v2, "#persistence Failed to create directory at path %{public}@ - Error %{public}@", (void)v3, DWORD2(v3));
}

- (void)readPigmentSetFromData:sharedCollections:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#persistence NTKProtoFacePigmentSet decode failed. %{public}@", v2, v3, v4, v5, v6);
}

- (void)serializeFacePigmentSet:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#persistence NTKFacePigmentSet encode failed. %{public}@", v2, v3, v4, v5, v6);
}

@end