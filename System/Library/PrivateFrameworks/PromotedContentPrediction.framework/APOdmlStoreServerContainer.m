@interface APOdmlStoreServerContainer
+ (id)sharedInstance;
- (APOdmlStoreServerContainer)init;
- (APOdmlUnfairLock)listeningLock;
- (BOOL)isListening;
- (NSError)listeningError;
- (NSURL)modelURL;
- (NSXPCStoreServer)storeServer;
- (id)storeServerForModelURL:(id)a3;
- (void)_startListening:(id)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setListeningError:(id)a3;
- (void)setStoreServer:(id)a3;
- (void)startListening;
@end

@implementation APOdmlStoreServerContainer

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC69EA4;
  block[3] = &unk_1E624A510;
  block[4] = a1;
  if (qword_1EB9F98C0 != -1) {
    dispatch_once(&qword_1EB9F98C0, block);
  }
  v2 = (void *)qword_1EB9F98A8;

  return v2;
}

- (APOdmlStoreServerContainer)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)APOdmlStoreServerContainer;
  v2 = [(APOdmlStoreServerContainer *)&v26 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v4 = objc_opt_class();
    v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
    uint64_t v8 = objc_msgSend_URLForResource_withExtension_(v6, v7, @"FeatureModel", @"momd");
    modelURL = v2->_modelURL;
    v2->_modelURL = (NSURL *)v8;

    uint64_t v11 = (uint64_t)v2->_modelURL;
    if (!v11)
    {
      v12 = OdmlLogForCategory(4uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v28 = v13;
        id v14 = v13;
        _os_log_impl(&dword_1BBC44000, v12, OS_LOG_TYPE_ERROR, "[%{private}@] Error: CoreData model not found.", buf, 0xCu);
      }
      v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v15, @"APOdmlFeatureStorageErrorDomain", 5010, 0);
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v17, (uint64_t)v16, 0);

      uint64_t v11 = (uint64_t)v2->_modelURL;
    }
    uint64_t v18 = objc_msgSend_storeServerForModelURL_(v2, v10, v11);
    storeServer = v2->_storeServer;
    v2->_storeServer = (NSXPCStoreServer *)v18;

    v2->_isListening = 0;
    listeningError = v2->_listeningError;
    v2->_listeningError = 0;

    v21 = [APOdmlUnfairLock alloc];
    uint64_t v23 = objc_msgSend_initWithOptions_(v21, v22, 1);
    listeningLock = v2->_listeningLock;
    v2->_listeningLock = (APOdmlUnfairLock *)v23;
  }
  return v2;
}

- (id)storeServerForModelURL:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1BE80];
  v16[0] = *MEMORY[0x1E4F1BFD8];
  v16[1] = v3;
  v17[0] = MEMORY[0x1E4F1CC38];
  v17[1] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F1BFE8];
  v16[2] = *MEMORY[0x1E4F1BFC8];
  v16[3] = v4;
  v17[2] = MEMORY[0x1E4F1CC38];
  v17[3] = @"com.apple.ap.adprivacyd.store";
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v7, (uint64_t)v17, v16, 4);
  v10 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v9, @"/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/FeatureModel.sqlite");
  id v11 = objc_alloc(MEMORY[0x1E4F1C1B8]);
  v12 = objc_alloc_init(APOdmlStoreServerPolicy);
  id v14 = objc_msgSend_initForStoreWithURL_usingModelAtURL_options_policy_(v11, v13, (uint64_t)v10, v6, v8, v12);

  return v14;
}

- (void)startListening
{
  uint64_t v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC6A2D0;
  block[3] = &unk_1E624A800;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_startListening:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C120]);
  uint64_t v8 = objc_msgSend_modelURL(self, v6, v7);
  v10 = objc_msgSend_initWithContentsOfURL_(v5, v9, (uint64_t)v8);

  id v11 = objc_alloc(MEMORY[0x1E4F1C150]);
  v13 = objc_msgSend_initWithName_managedObjectModel_(v11, v12, @"FeatureModel", v10);
  v15 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v14, @"/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/FeatureModel.sqlite");
  id v16 = objc_alloc(MEMORY[0x1E4F1C190]);
  uint64_t v18 = objc_msgSend_initWithURL_(v16, v17, (uint64_t)v15);
  objc_msgSend_setType_(v18, v19, *MEMORY[0x1E4F1BF70]);
  objc_msgSend_setShouldInferMappingModelAutomatically_(v18, v20, 1);
  objc_msgSend_setShouldMigrateStoreAutomatically_(v18, v21, 1);
  uint64_t v22 = MEMORY[0x1E4F1CC38];
  objc_msgSend_setOption_forKey_(v18, v23, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BEF8]);
  objc_msgSend_setOption_forKey_(v18, v24, v22, *MEMORY[0x1E4F1BE80]);
  v32[0] = v18;
  objc_super v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v32, 1);
  objc_msgSend_setPersistentStoreDescriptions_(v13, v27, (uint64_t)v26);

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1BBC6A864;
  v30[3] = &unk_1E624B038;
  v30[4] = self;
  id v31 = v4;
  id v28 = v4;
  objc_msgSend_loadPersistentStoresWithCompletionHandler_(v13, v29, (uint64_t)v30);
}

- (NSXPCStoreServer)storeServer
{
  return self->_storeServer;
}

- (void)setStoreServer:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (NSError)listeningError
{
  return self->_listeningError;
}

- (void)setListeningError:(id)a3
{
}

- (APOdmlUnfairLock)listeningLock
{
  return self->_listeningLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningLock, 0);
  objc_storeStrong((id *)&self->_listeningError, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);

  objc_storeStrong((id *)&self->_storeServer, 0);
}

@end