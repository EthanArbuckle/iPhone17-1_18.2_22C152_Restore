@interface NTKCFacesBundleArrayGalleryCollection
- (CLKDevice)device;
- (NTKCFacesBundleArrayGalleryCollection)initWithDevice:(id)a3 faceBundle:(id)a4;
- (NTKFaceBundle)faceBundle;
- (void)dealloc;
- (void)galleryFacesDidUpdate;
- (void)loadFaces;
@end

@implementation NTKCFacesBundleArrayGalleryCollection

- (NTKCFacesBundleArrayGalleryCollection)initWithDevice:(id)a3 faceBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKCFacesBundleArrayGalleryCollection;
  v9 = [(NTKCFacesBundleArrayGalleryCollection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_faceBundle, a4);
    v11 = [v8 galleryTitleForDevice:v7];
    [(NTKGalleryCollection *)v10 setTitle:v11];

    v12 = [v8 galleryDescriptionForDevice:v7];
    [(NTKGalleryCollection *)v10 setDescriptionText:v12];

    [(NTKFaceBundle *)v10->_faceBundle addObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(NTKFaceBundle *)self->_faceBundle removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKCFacesBundleArrayGalleryCollection;
  [(NTKCFacesBundleArrayGalleryCollection *)&v3 dealloc];
}

- (void)loadFaces
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(NTKCFacesBundleArrayGalleryCollection *)self device];
  v4 = [(NTKCFacesBundleArrayGalleryCollection *)self faceBundle];
  v5 = [(id)objc_opt_class() identifier];
  v6 = _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Loading faces for %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke;
  block[3] = &unk_1E62C09E8;
  objc_copyWeak(&v17, (id *)buf);
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  id v14 = v8;
  id v9 = v3;
  id v15 = v9;
  v16 = self;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, -1, block);
  v11 = NTKFacesArrayGalleryCollectionLoadQueue();
  dispatch_async(v11, v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v4 = [a1[5] galleryFacesForDevice:a1[6]];
    if ([a1[6] supportsWidgetMigration])
    {
      v5 = +[NTKBundleComplicationFaceMigrator sharedInstance];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_2;
      v20[3] = &unk_1E62C62E0;
      id v6 = v4;
      id v21 = v6;
      id v22 = a1[4];
      objc_copyWeak(&v23, v2);
      [v5 migrateFaces:v6 completion:v20];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "companionGalleryName", (void)v16);
            BOOL v12 = v11 == 0;

            if (!v12)
            {

              [a1[7] setCalloutName:&__block_literal_global_113];
              goto LABEL_18;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

LABEL_18:
      objc_destroyWeak(&v23);
    }
    else
    {
      id v14 = _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = a1[4];
        *(_DWORD *)buf = 138543362;
        id v28 = v15;
        _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "Skipped widget migration for %{public}@", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_3;
      block[3] = &unk_1E62C09C0;
      void block[4] = a1[7];
      id v7 = v4;
      v25 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    id v7 = _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = a1[4];
      *(_DWORD *)buf = 138543362;
      id v28 = v13;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Skipped loading faces for %{public}@ - dealloc'd", buf, 0xCu);
    }
  }
}

uint64_t __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFaces:*(void *)(a1 + 40)];
}

void __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Loaded %lu faces for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setFaces:*(void *)(a1 + 32)];
}

uint64_t __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 companionGalleryName];
}

- (void)galleryFacesDidUpdate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Reloading faces for collection: %@", (uint8_t *)&v4, 0xCu);
  }

  [(NTKCFacesBundleArrayGalleryCollection *)self loadFaces];
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKFaceBundle)faceBundle
{
  return self->_faceBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBundle, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end