@interface NTKDeviceSpecificFacesArrayGalleryCollection
- (CLKDevice)device;
- (NTKDeviceSpecificFacesArrayGalleryCollection)initWithDevice:(id)a3;
- (id)descriptionText;
- (id)facesForDevice:(id)a3;
- (id)title;
- (void)loadFacesWithCompletion:(id)a3;
@end

@implementation NTKDeviceSpecificFacesArrayGalleryCollection

- (NTKDeviceSpecificFacesArrayGalleryCollection)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKDeviceSpecificFacesArrayGalleryCollection;
  v6 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)descriptionText
{
  return 0;
}

- (void)loadFacesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)self device];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62C4A00;
  objc_copyWeak(&v14, &location);
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = v4;
  id v13 = v7;
  v8 = _Block_copy(aBlock);
  objc_super v9 = NTKFacesArrayGalleryCollectionLoadQueue();
  dispatch_async(v9, v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained facesForDevice:*(void *)(a1 + 32)];
    id v6 = +[NTKBundleComplicationFaceMigrator sharedInstance];
    dispatch_group_t v7 = dispatch_group_create();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_2;
    v18[3] = &unk_1E62C49D8;
    dispatch_group_t v19 = v7;
    id v20 = v6;
    id v8 = v6;
    objc_super v9 = v7;
    [v5 enumerateObjectsUsingBlock:v18];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_4;
    v13[3] = &unk_1E62C4A00;
    objc_copyWeak(&v17, v2);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v14 = v5;
    uint64_t v15 = v10;
    id v16 = v11;
    id v12 = v5;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], v13);

    objc_destroyWeak(&v17);
  }
}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_3;
  v6[3] = &unk_1E62C0E48;
  id v5 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v5 migrateFace:v4 completion:v6];
}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_3(uint64_t a1)
{
}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setFaces:*(void *)(a1 + 32)];
  v3 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) count];
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Finished loading %@ (%p) with %lu faces", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

- (id)title
{
  return &stru_1F1635E90;
}

- (id)facesForDevice:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end