@interface SSScreenshotAssetManager
+ (id)sharedAssetManager;
- (id)backend;
- (void)imageWithPreviouslyRegisteredIdentifier:(id)a3 withAccessBlock:(id)a4;
- (void)recordEditsToPersistable:(id)a3 inTransition:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)recordEditsToPersistableForPDF:(id)a3 withCompletionBlock:(id)a4;
- (void)recordPersistableToTemporaryLocation:(id)a3 withCompletionBlock:(id)a4;
- (void)registerImageForPersistable:(id)a3 options:(id)a4 withRegistrationBlock:(id)a5;
- (void)removePersistable:(id)a3 deleteOptions:(unint64_t)a4 withCompletionBlock:(id)a5;
- (void)resetBackend;
- (void)setBackend:(id)a3;
@end

@implementation SSScreenshotAssetManager

+ (id)sharedAssetManager
{
  v2 = (void *)_sharedAssetManager;
  if (!_sharedAssetManager)
  {
    v3 = objc_alloc_init(SSScreenshotAssetManager);
    v4 = (void *)_sharedAssetManager;
    _sharedAssetManager = (uint64_t)v3;

    [(id)_sharedAssetManager resetBackend];
    v2 = (void *)_sharedAssetManager;
  }
  return v2;
}

- (void)setBackend:(id)a3
{
}

- (id)backend
{
  return self->_backend;
}

- (void)resetBackend
{
  self->_backend = (SSScreenshotAssetManagerBackend *)objc_alloc_init(SSScreenshotAssetManagerPhotoLibraryBackend);
  MEMORY[0x270F9A758]();
}

- (void)registerImageForPersistable:(id)a3 options:(id)a4 withRegistrationBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SSScreenshotAssetManager *)self backend];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__SSScreenshotAssetManager_registerImageForPersistable_options_withRegistrationBlock___block_invoke;
  v13[3] = &unk_2644EDD48;
  id v14 = v8;
  id v12 = v8;
  [v11 registerEntryWithImage:v10 options:v9 identifierHandler:v13];
}

uint64_t __86__SSScreenshotAssetManager_registerImageForPersistable_options_withRegistrationBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 == 0, a2);
  }
  return result;
}

- (void)imageWithPreviouslyRegisteredIdentifier:(id)a3 withAccessBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSScreenshotAssetManager *)self backend];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__SSScreenshotAssetManager_imageWithPreviouslyRegisteredIdentifier_withAccessBlock___block_invoke;
  v10[3] = &unk_2644EDD70;
  id v11 = v6;
  id v9 = v6;
  [v8 imageForPreviouslyRegisteredIdentifier:v7 imageHandler:v10];
}

uint64_t __84__SSScreenshotAssetManager_imageWithPreviouslyRegisteredIdentifier_withAccessBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recordEditsToPersistable:(id)a3 inTransition:(BOOL)a4 withCompletionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke;
  v12[3] = &unk_2644EDDC0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [v11 requestImageInTransition:v6 withBlock:v12];
}

void __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [a1[4] identifier];
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_21ECED000, v4, OS_LOG_TYPE_INFO, "Finished getting output image for %@.  Preparing to call update image on the backend", buf, 0xCu);
  }
  BOOL v6 = [a1[5] backend];
  id v7 = [a1[4] imageModificationData];
  id v8 = [a1[4] identifier];
  id v9 = [a1[4] registrationOptions];
  id v10 = [a1[4] imageDescription];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke_12;
  v11[3] = &unk_2644EDD98;
  id v12 = a1[6];
  [v6 updateImageData:v3 withModificationData:v7 forEntryWithIdentifier:v8 registrationOptions:v9 imageDescription:v10 completionHandler:v11];
}

uint64_t __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke_12(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recordPersistableToTemporaryLocation:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke;
  v10[3] = &unk_2644EDDC0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [v9 requestImageInTransition:0 withBlock:v10];
}

void __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 backend];
  id v6 = [MEMORY[0x263F1C6B0] imageWithData:v4];

  id v7 = [*(id *)(a1 + 40) filename];
  id v8 = [*(id *)(a1 + 40) imageDescription];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke_2;
  v9[3] = &unk_2644EDDE8;
  id v10 = *(id *)(a1 + 48);
  [v5 saveImageToTemporaryLocation:v6 withName:v7 imageDescription:v8 completionHandler:v9];
}

uint64_t __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 == 0, a2);
  }
  return result;
}

- (void)removePersistable:(id)a3 deleteOptions:(unint64_t)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 - 1 <= 1) {
    [v8 removePDF];
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v10 = [(SSScreenshotAssetManager *)self backend];
    id v11 = [v8 identifier];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __80__SSScreenshotAssetManager_removePersistable_deleteOptions_withCompletionBlock___block_invoke;
    v12[3] = &unk_2644EDD98;
    id v13 = v9;
    [v10 removeEntryWithIdentifier:v11 completionHandler:v12];
  }
}

uint64_t __80__SSScreenshotAssetManager_removePersistable_deleteOptions_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recordEditsToPersistableForPDF:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__SSScreenshotAssetManager_recordEditsToPersistableForPDF_withCompletionBlock___block_invoke;
  v7[3] = &unk_2644ED758;
  id v8 = v5;
  id v6 = v5;
  [a3 savePDFWithBlock:v7];
}

uint64_t __79__SSScreenshotAssetManager_recordEditsToPersistableForPDF_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end