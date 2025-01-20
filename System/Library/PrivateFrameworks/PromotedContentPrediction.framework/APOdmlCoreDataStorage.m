@interface APOdmlCoreDataStorage
- (APOdmlCoreDataStorage)init;
- (BOOL)coreDataIsInitialized;
- (NSError)coreDataError;
- (NSPersistentContainer)persistentContainer;
- (id)storePrecheck;
- (int)numLaunchesAttempted;
- (void)createContainer;
- (void)initializeCoreDataStackForClient;
- (void)initializeCoreDataStackForDaemon;
- (void)launchContainer;
- (void)makeApplicationSupportDirectory;
- (void)setContainerDescriptionClient;
- (void)setContainerDescriptionDaemon:(id)a3;
- (void)setCoreDataError:(id)a3;
- (void)setCoreDataIsInitialized:(BOOL)a3;
- (void)setNumLaunchesAttempted:(int)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation APOdmlCoreDataStorage

- (APOdmlCoreDataStorage)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)APOdmlCoreDataStorage;
  v2 = [(APOdmlCoreDataStorage *)&v21 init];
  v5 = v2;
  if (v2)
  {
    v2->_numLaunchesAttempted = 0;
    v2->_coreDataIsInitialized = 0;
    v6 = objc_msgSend_sharedInstance(APOdmlDatabaseConfiguration, v3, v4);
    int isDaemonProcess = objc_msgSend_isDaemonProcess(v6, v7, v8);

    v10 = OdmlLogForCategory(4uLL);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (isDaemonProcess)
    {
      if (v11)
      {
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v23 = v12;
        id v13 = v12;
        _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing CoreData for daemon.", buf, 0xCu);
      }
      objc_msgSend_initializeCoreDataStackForDaemon(v5, v14, v15);
    }
    else
    {
      if (v11)
      {
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v23 = v16;
        id v17 = v16;
        _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing CoreData for client.", buf, 0xCu);
      }
      objc_msgSend_initializeCoreDataStackForClient(v5, v18, v19);
    }
  }
  return v5;
}

- (void)initializeCoreDataStackForClient
{
  objc_msgSend_createContainer(self, a2, v2);
  objc_msgSend_setContainerDescriptionClient(self, v4, v5);

  MEMORY[0x1F4181798](self, sel_launchContainer, v6);
}

- (void)setContainerDescriptionClient
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C190]);
  objc_msgSend_setOption_forKey_(v3, v4, @"com.apple.ap.adprivacyd.store", *MEMORY[0x1E4F1BFE8]);
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  objc_msgSend_setOption_forKey_(v3, v6, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BFC8]);
  objc_msgSend_setOption_forKey_(v3, v7, v5, *MEMORY[0x1E4F1BE80]);
  objc_msgSend_setType_(v3, v8, *MEMORY[0x1E4F1BFF8]);
  v12[0] = v3;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);
  objc_msgSend_setPersistentStoreDescriptions_(self->_persistentContainer, v11, (uint64_t)v10);
}

- (void)createContainer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  uint64_t v8 = objc_msgSend_URLForResource_withExtension_(v6, v7, @"FeatureModel", @"momd");
  v9 = OdmlLogForCategory(4uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138478083;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2112;
    objc_super v21 = v8;
    id v10 = v19;
    _os_log_impl(&dword_1BBC44000, v9, OS_LOG_TYPE_DEFAULT, "[%{private}@] Model URL: %@", (uint8_t *)&v18, 0x16u);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1C120]);
  id v13 = objc_msgSend_initWithContentsOfURL_(v11, v12, (uint64_t)v8);
  id v14 = objc_alloc(MEMORY[0x1E4F1C150]);
  v16 = (NSPersistentContainer *)objc_msgSend_initWithName_managedObjectModel_(v14, v15, @"FeatureModel", v13);
  persistentContainer = self->_persistentContainer;
  self->_persistentContainer = v16;
}

- (void)setCoreDataIsInitialized:(BOOL)a3
{
  self->_coreDataIsInitialized = a3;
}

- (void)launchContainer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_numLaunchesAttempted(self, a2, v2);
  objc_msgSend_setNumLaunchesAttempted_(self, v5, (v4 + 1));
  uint64_t v6 = OdmlLogForCategory(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = (id)objc_opt_class();
    id v7 = v11;
    _os_log_impl(&dword_1BBC44000, v6, OS_LOG_TYPE_DEFAULT, "[%{private}@] Launching CoreData Container", buf, 0xCu);
  }
  uint64_t v8 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC45644;
  block[3] = &unk_1E624A800;
  block[4] = self;
  dispatch_async(v8, block);
}

- (int)numLaunchesAttempted
{
  return self->_numLaunchesAttempted;
}

- (void)setNumLaunchesAttempted:(int)a3
{
  self->_numLaunchesAttempted = a3;
}

- (void)makeApplicationSupportDirectory
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  int v4 = @"/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/";
  char v22 = 1;
  if (objc_msgSend_fileExistsAtPath_isDirectory_(v3, v5, (uint64_t)v4, &v22))
  {
    id v7 = OdmlLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      uint64_t v24 = v8;
      id v9 = v8;
      _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] Directory already exists.", buf, 0xCu);
    }
  }
  else
  {
    id v10 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v6, (uint64_t)v4);
    id v21 = 0;
    objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v3, v11, (uint64_t)v10, 1, 0, &v21);
    id v12 = v21;
    id v7 = v21;
    id v13 = OdmlLogForCategory(4uLL);
    id v14 = v13;
    if (v7)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        *(_DWORD *)buf = 138478083;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        v26 = v7;
        id v16 = v15;
        _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to make appropriate directory with error: %@", buf, 0x16u);
      }
      id v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v17, @"APOdmlFeatureStorageErrorDomain", 5001, 0);
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v18, (uint64_t)v14, 0);
      objc_storeStrong((id *)&self->_coreDataError, v12);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      *(_DWORD *)buf = 138478083;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      v26 = v10;
      id v20 = v19;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_DEFAULT, "[%{private}@] Created directory at %@", buf, 0x16u);
    }
  }
}

- (void)initializeCoreDataStackForDaemon
{
  objc_msgSend_makeApplicationSupportDirectory(self, a2, v2);
  objc_msgSend_createContainer(self, v4, v5);
  objc_msgSend_setContainerDescriptionDaemon_(self, v6, *MEMORY[0x1E4F1BF70]);

  MEMORY[0x1F4181798](self, sel_launchContainer, v7);
}

- (void)setContainerDescriptionDaemon:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  uint64_t v7 = objc_msgSend_fileURLWithPath_(v4, v6, @"/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/FeatureModel.sqlite");
  id v8 = objc_alloc(MEMORY[0x1E4F1C190]);
  id v10 = objc_msgSend_initWithURL_(v8, v9, (uint64_t)v7);
  objc_msgSend_setOption_forKey_(v10, v11, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BE80]);
  objc_msgSend_setType_(v10, v12, (uint64_t)v5);

  v16[0] = v10;
  id v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v16, 1);
  objc_msgSend_setPersistentStoreDescriptions_(self->_persistentContainer, v15, (uint64_t)v14);
}

- (id)storePrecheck
{
  int v4 = objc_msgSend_coreDataError(self, a2, v2);

  if (v4)
  {
    uint64_t v7 = objc_msgSend_coreDataError(self, v5, v6);
  }
  else if (objc_msgSend_coreDataIsInitialized(self, v5, v6))
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = objc_msgSend_initWithDomain_code_userInfo_(v8, v9, @"APOdmlFeatureStorageErrorDomain", 5002, 0);
  }

  return v7;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSError)coreDataError
{
  return self->_coreDataError;
}

- (void)setCoreDataError:(id)a3
{
}

- (BOOL)coreDataIsInitialized
{
  return self->_coreDataIsInitialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataError, 0);

  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end