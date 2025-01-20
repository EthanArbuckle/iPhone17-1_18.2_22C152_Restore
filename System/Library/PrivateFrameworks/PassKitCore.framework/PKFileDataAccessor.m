@interface PKFileDataAccessor
- (BOOL)ownsFileURL;
- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3;
- (BOOL)remoteAssetsDownloadedForScreenScale:(double)a3 seids:(id)a4 suffix:(id)a5;
- (NSString)explicitDataTypeIdentifier;
- (NSURL)fileURL;
- (PKFileDataAccessor)init;
- (PKFileDataAccessor)initWithFileURL:(id)a3 error:(id *)a4;
- (PKFileDataAccessor)initWithFileURL:(id)a3 error:(id *)a4 coordinator:(id)a5;
- (id)archiveData;
- (id)bundle;
- (id)content;
- (id)dataForBundleResource:(id)a3;
- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4;
- (id)dataForBundleResources:(id)a3;
- (id)dictionary;
- (id)displayProfileOfType:(int64_t)a3;
- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7;
- (id)manifestHash;
- (id)passLocalizedStringForKey:(id)a3;
- (id)remoteAssetManager;
- (id)remoteAssetManagerForSEIDs:(id)a3;
- (id)resourceValueForKey:(id)a3;
- (id)serializedFileWrapper;
- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4;
- (void)contentWithCompletion:(id)a3;
- (void)dealloc;
- (void)dictionaryWithCompletion:(id)a3;
- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8;
- (void)revocationStatusWithCompletion:(id)a3;
- (void)setExplicitDataTypeIdentifier:(id)a3;
- (void)setOwnsFileURL:(BOOL)a3;
@end

@implementation PKFileDataAccessor

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_ownsFileURL && self->_fileURL)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    fileURL = self->_fileURL;
    id v10 = 0;
    char v5 = [v3 removeItemAtURL:fileURL error:&v10];
    id v6 = v10;

    if ((v5 & 1) == 0)
    {
      v7 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_fileURL;
        *(_DWORD *)buf = 138412546;
        v12 = v8;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Couldn't remove disk representation at %@:%@", buf, 0x16u);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PKFileDataAccessor;
  [(PKFileDataAccessor *)&v9 dealloc];
}

- (PKFileDataAccessor)initWithFileURL:(id)a3 error:(id *)a4
{
  return [(PKFileDataAccessor *)self initWithFileURL:a3 error:a4 coordinator:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_explicitDataTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_seids, 0);
  objc_storeStrong((id *)&self->_remoteAssetManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (id)bundle
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__PKFileDataAccessor_bundle__block_invoke;
  v5[3] = &unk_1E56DC2F8;
  v5[4] = self;
  v5[5] = &v6;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__PKFileDataAccessor_manifestHash__block_invoke(uint64_t a1)
{
  uint64_t v2 = PKManifestHash(*(void **)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __32__PKFileDataAccessor_dictionary__block_invoke(uint64_t a1)
{
  uint64_t v2 = PKObjectDictionary(*(void **)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __28__PKFileDataAccessor_bundle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setOwnsFileURL:(BOOL)a3
{
  self->_ownsFileURL = a3;
}

- (PKFileDataAccessor)initWithFileURL:(id)a3 error:(id *)a4 coordinator:(id)a5
{
  id v9 = a3;
  v17 = (PKDirectoryCoordinator *)a5;
  if (v17)
  {
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    v17 = [[PKDirectoryCoordinator alloc] initWithURL:v9];
    if (!v9)
    {
LABEL_8:
      if (a4)
      {
        PKValidationErrorWithReason(0, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v21.receiver);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v19 = 0;
      goto LABEL_11;
    }
  }
  if (!v17) {
    goto LABEL_8;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKFileDataAccessor;
  v18 = [(PKFileDataAccessor *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fileURL, a3);
    objc_storeStrong((id *)&v19->_coordinator, v17);
  }
LABEL_11:

  return v19;
}

- (void)setExplicitDataTypeIdentifier:(id)a3
{
}

- (id)manifestHash
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PKFileDataAccessor_manifestHash__block_invoke;
  v5[3] = &unk_1E56DC2F8;
  v5[4] = self;
  v5[5] = &v6;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dictionary
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  id v3 = (void *)MEMORY[0x192FDC630](self, a2);
  coordinator = self->_coordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__PKFileDataAccessor_dictionary__block_invoke;
  v7[3] = &unk_1E56DC2F8;
  v7[4] = self;
  v7[5] = &v8;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (PKFileDataAccessor)init
{
  return 0;
}

- (void)revocationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  coordinator = self->_coordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PKFileDataAccessor_revocationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E56DC2D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v7];
}

void __53__PKFileDataAccessor_revocationStatusWithCompletion___block_invoke(uint64_t a1)
{
}

- (void)dictionaryWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(PKFileDataAccessor *)self dictionary];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)content
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  id v3 = (void *)MEMORY[0x192FDC630](self, a2);
  coordinator = self->_coordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PKFileDataAccessor_content__block_invoke;
  v7[3] = &unk_1E56DC2F8;
  v7[4] = self;
  void v7[5] = &v8;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__PKFileDataAccessor_content__block_invoke(uint64_t a1)
{
  id v2 = +[PKContent createWithFileURL:*(void *)(*(void *)(a1 + 32) + 56) dataTypeIdentifier:*(void *)(*(void *)(a1 + 32) + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)contentWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(PKFileDataAccessor *)self content];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  coordinator = self->_coordinator;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PKFileDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke;
  v18[3] = &unk_1E56DC320;
  v22 = &v25;
  int64_t v23 = a3;
  double v24 = a4;
  id v14 = v11;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  objc_super v21 = self;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v18];
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __80__PKFileDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = (void *)MEMORY[0x192FDC630]();
  uint64_t v4 = +[PKImageSet imageSetForType:*(void *)(a1 + 64) screenScale:*(void *)(a1 + 32) suffix:*(void *)(a1 + 40) displayProfile:*(void *)(*(void *)(a1 + 48) + 56) fileURL:*(double *)(a1 + 72)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8
{
  if (a8)
  {
    BOOL v9 = a7;
    id v15 = a8;
    id v16 = [(PKFileDataAccessor *)self imageSetForType:a3 screenScale:a5 suffix:a6 displayProfile:v9 preheat:a4];
    (*((void (**)(id, id))a8 + 2))(v15, v16);
  }
}

- (id)resourceValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  coordinator = self->_coordinator;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PKFileDataAccessor_resourceValueForKey___block_invoke;
  v9[3] = &unk_1E56DC348;
  v9[4] = self;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__PKFileDataAccessor_resourceValueForKey___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  id v2 = *(void **)(a1[4] + 56);
  uint64_t v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  [v2 getResourceValue:&obj forKey:v1 error:0];
  objc_storeStrong(v3, obj);
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKFileDataAccessor *)self bundle];
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int64_t v23 = __Block_byref_object_copy__2;
  double v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  coordinator = self->_coordinator;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__PKFileDataAccessor_dataForBundleResourceNamed_withExtension___block_invoke;
  v15[3] = &unk_1E56DC370;
  id v10 = v8;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  id v12 = v7;
  id v18 = v12;
  id v19 = &v20;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __63__PKFileDataAccessor_dataForBundleResourceNamed_withExtension___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) URLForResource:*(void *)(a1 + 40) withExtension:*(void *)(a1 + 48)];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dataForBundleResource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = [v4 extension];

  id v7 = [(PKFileDataAccessor *)self dataForBundleResourceNamed:v5 withExtension:v6];

  return v7;
}

- (id)dataForBundleResources:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 count];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
    id v7 = (void *)MEMORY[0x192FDC630]();
    uint64_t v8 = [(PKFileDataAccessor *)self bundle];
    coordinator = self->_coordinator;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__PKFileDataAccessor_dataForBundleResources___block_invoke;
    v13[3] = &unk_1E56DC398;
    id v14 = v4;
    id v15 = v8;
    id v10 = v6;
    id v16 = v10;
    id v11 = v8;
    [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v13];

    if ([v10 count]) {
      id v5 = (void *)[v10 copy];
    }
    else {
      id v5 = 0;
    }
  }
  return v5;
}

void __45__PKFileDataAccessor_dataForBundleResources___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 40);
        BOOL v9 = objc_msgSend(v7, "name", (void)v13);
        id v10 = [v7 extension];
        id v11 = [v8 URLForResource:v9 withExtension:v10];

        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v11];
        if (v12) {
          [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)archiveData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PKFileDataAccessor_archiveData__block_invoke;
  v5[3] = &unk_1E56DC2F8;
  v5[4] = self;
  v5[5] = &v6;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__PKFileDataAccessor_archiveData__block_invoke(uint64_t a1)
{
  uint64_t v2 = PKArchiverZipData(*(NSURL **)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)serializedFileWrapper
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PKFileDataAccessor_serializedFileWrapper__block_invoke;
  v5[3] = &unk_1E56DC3C0;
  v5[4] = self;
  v5[5] = &v6;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__PKFileDataAccessor_serializedFileWrapper__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:*(void *)(*(void *)(a1 + 32) + 56) options:1 error:0];
  uint64_t v5 = [v4 serializedRepresentation];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(PKFileDataAccessor *)self remoteAssetsDownloadedForScreenScale:v4 seids:0 suffix:PKScreenScale()];

  return (char)self;
}

- (BOOL)remoteAssetsDownloadedForScreenScale:(double)a3 seids:(id)a4 suffix:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  BOOL v9 = [(PKFileDataAccessor *)self remoteAssetManagerForSEIDs:a4];
  [v9 deviceSpecificItemsForScreenScale:v8 suffix:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!objc_msgSend(v9, "assetExistsLocally:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void, float))a4;
  id v8 = [v6 seids];
  if (v8) {
    goto LABEL_9;
  }
  if (PKSecureElementIsAvailable())
  {
    if (PKRunningInPassd())
    {
      id v8 = +[PKSecureElement secureElementIdentifiers];
      goto LABEL_9;
    }
    BOOL v9 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v16 = 134349314;
      long long v17 = self;
      __int16 v18 = 2112;
      long long v19 = v10;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKFileDataAccessor (%{public}p): downloadRemoteAssets should always be called with a seids outside of passd, falling back to downloading everything. Called from: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v8 = 0;
LABEL_9:
  uint64_t v11 = [(PKFileDataAccessor *)self remoteAssetManagerForSEIDs:v8];
  if (v11)
  {
    [v6 screenScale];
    double v13 = v12;
    long long v14 = [v6 suffix];
    BOOL v15 = [v6 cloudStoreCoordinatorDelegate];
    objc_msgSend(v11, "downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:ignoreRequiredAssetDownloadFailures:completion:", v14, v15, objc_msgSend(v6, "ignoreRequiredAssetDownloadFailures"), v7, v13);
  }
  else
  {
    v7[2](v7, 1, 0, 1.0);
  }
}

- (id)remoteAssetManagerForSEIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PKRemoteAssetManager alloc] initWithDirectoryCoordinator:self->_coordinator];
  [(PKRemoteAssetManager *)v5 setSeids:v4];

  return v5;
}

- (id)remoteAssetManager
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PKFileDataAccessor_remoteAssetManager__block_invoke;
  v5[3] = &unk_1E56DC3C0;
  v5[4] = self;
  v5[5] = &v6;
  [(PKDirectoryCoordinator *)coordinator performCoordinatedAction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__PKFileDataAccessor_remoteAssetManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 16))
  {
    *(unsigned char *)(v2 + 16) = 1;
    id v3 = [[PKRemoteAssetManager alloc] initWithDirectoryCoordinator:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(void **)(v2 + 24);
  id v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v7, v6);
}

- (id)displayProfileOfType:(int64_t)a3
{
  uint64_t v5 = [(PKFileDataAccessor *)self dictionary];
  uint64_t v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = [(PKFileDataAccessor *)self fileURL];
  uint64_t v8 = [v6 bundleWithURL:v7];
  BOOL v9 = +[PKDisplayProfile displayProfileOfType:a3 withDictionary:v5 bundle:v8];

  return v9;
}

- (id)passLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKFileDataAccessor *)self bundle];
  uint64_t v6 = [v5 localizedStringForKey:v4 value:&stru_1EE0F5368 table:@"pass_localizable"];

  return v6;
}

- (BOOL)ownsFileURL
{
  return self->_ownsFileURL;
}

- (NSString)explicitDataTypeIdentifier
{
  return self->_explicitDataTypeIdentifier;
}

@end