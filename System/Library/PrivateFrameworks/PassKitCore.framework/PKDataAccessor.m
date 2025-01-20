@interface PKDataAccessor
- (BOOL)remoteAssetsDownloaded;
- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3;
- (BOOL)remoteAssetsDownloadedForScreenScale:(double)a3 suffix:(id)a4;
- (NSBundle)bundle;
- (NSData)archiveData;
- (NSData)manifestHash;
- (NSData)serializedFileWrapper;
- (PKRemoteAssetManager)remoteAssetManager;
- (id)cachedImageSetForType:(int64_t)a3 withDisplayProfile:(id)a4 displayTraits:(id)a5;
- (id)content;
- (id)dataForBundleResource:(id)a3;
- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4;
- (id)dataForBundleResources:(id)a3;
- (id)dictionary;
- (id)displayProfileOfType:(int64_t)a3;
- (id)imageSetForType:(int64_t)a3 displayProfile:(id)a4 preheat:(BOOL)a5;
- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7;
- (id)passLocalizedStringForKey:(id)a3;
- (id)remoteAssetManagerForSEIDs:(id)a3;
- (id)resourceValueForKey:(id)a3;
- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4;
- (void)contentWithCompletion:(id)a3;
- (void)dictionaryWithCompletion:(id)a3;
- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4;
- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 seids:(id)a4 completion:(id)a5;
- (void)downloadRemoteAssetsWithCompletion:(id)a3;
- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4;
- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 completion:(id)a6;
- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 seids:(id)a6 completion:(id)a7;
- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 completion:(id)a5;
- (void)imageSetForType:(int64_t)a3 displayProfile:(id)a4 preheat:(BOOL)a5 withCompletion:(id)a6;
- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8;
- (void)noteShared;
- (void)requestUpdateWithCompletion:(id)a3;
- (void)revocationStatusWithCompletion:(id)a3;
- (void)updateSettings:(unint64_t)a3;
@end

@implementation PKDataAccessor

- (id)content
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__74;
  v14 = __Block_byref_object_dispose__74;
  id v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__PKDataAccessor_content__block_invoke;
  v7[3] = &unk_1E56F2B08;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  [(PKDataAccessor *)self contentWithCompletion:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __25__PKDataAccessor_content__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)dictionary
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__74;
  v14 = __Block_byref_object_dispose__74;
  id v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PKDataAccessor_dictionary__block_invoke;
  v7[3] = &unk_1E56F2B30;
  v9 = &v10;
  id v4 = v3;
  v8 = v4;
  [(PKDataAccessor *)self dictionaryWithCompletion:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __28__PKDataAccessor_dictionary__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)cachedImageSetForType:(int64_t)a3 withDisplayProfile:(id)a4 displayTraits:(id)a5
{
  return 0;
}

- (id)imageSetForType:(int64_t)a3 displayProfile:(id)a4 preheat:(BOOL)a5
{
  return [(PKDataAccessor *)self imageSetForType:a3 screenScale:0 suffix:a4 displayProfile:a5 preheat:0.0];
}

- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a6;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__74;
  v25 = __Block_byref_object_dispose__74;
  id v26 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__PKDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke;
  v18[3] = &unk_1E56F2B58;
  v20 = &v21;
  id v15 = v14;
  v19 = v15;
  [(PKDataAccessor *)self imageSetForType:a3 screenScale:v12 suffix:v13 displayProfile:v7 preheat:v18 withCompletion:a4];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  id v16 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __76__PKDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)noteShared
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    dispatch_semaphore_t v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v5 = 136315394;
    v6 = "-[PKDataAccessor noteShared]";
    __int16 v7 = 2114;
    v8 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)updateSettings:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    int v6 = 136315394;
    __int16 v7 = "-[PKDataAccessor updateSettings:]";
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_190E10000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)revocationStatusWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)requestUpdateWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = (void (**)(id, void))a3;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    __int16 v8 = "-[PKDataAccessor requestUpdateWithCompletion:]";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)dictionaryWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = (void (**)(id, void))a3;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    __int16 v8 = "-[PKDataAccessor dictionaryWithCompletion:]";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)contentWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = (void (**)(id, void))a3;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    __int16 v8 = "-[PKDataAccessor contentWithCompletion:]";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)imageSetForType:(int64_t)a3 displayProfile:(id)a4 preheat:(BOOL)a5 withCompletion:(id)a6
{
}

- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = (void (**)(id, void))a8;
  id v13 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    dispatch_semaphore_t v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    int v16 = 136315394;
    v17 = "-[PKDataAccessor imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:]";
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_error_impl(&dword_190E10000, v13, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v16, 0x16u);
  }
  if (v12) {
    v12[2](v12, 0);
  }
}

- (id)resourceValueForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    __int16 v8 = "-[PKDataAccessor resourceValueForKey:]";
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_error_impl(&dword_190E10000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (NSData)manifestHash
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    int v6 = 136315394;
    int v7 = "-[PKDataAccessor manifestHash]";
    __int16 v8 = 2114;
    __int16 v9 = v5;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

- (NSData)archiveData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    int v6 = 136315394;
    int v7 = "-[PKDataAccessor archiveData]";
    __int16 v8 = 2114;
    __int16 v9 = v5;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

- (NSData)serializedFileWrapper
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    int v6 = 136315394;
    int v7 = "-[PKDataAccessor serializedFileWrapper]";
    __int16 v8 = 2114;
    __int16 v9 = v5;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

- (NSBundle)bundle
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    int v6 = 136315394;
    int v7 = "-[PKDataAccessor bundle]";
    __int16 v8 = 2114;
    __int16 v9 = v5;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    int v8 = 136315394;
    __int16 v9 = "-[PKDataAccessor dataForBundleResourceNamed:withExtension:]";
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

- (id)dataForBundleResource:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    int v8 = "-[PKDataAccessor dataForBundleResource:]";
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_error_impl(&dword_190E10000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (id)dataForBundleResources:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    int v8 = "-[PKDataAccessor dataForBundleResources:]";
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_error_impl(&dword_190E10000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11) {
    int v7 = (PKDownloadRemoteAssetConfiguration *)v11;
  }
  else {
    int v7 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  }
  int v8 = v7;
  [(PKDownloadRemoteAssetConfiguration *)v7 screenScale];
  if (v9 == 0.0) {
    [(PKDownloadRemoteAssetConfiguration *)v8 setScreenScale:PKScreenScale()];
  }
  __int16 v10 = _Block_copy(v6);
  [(PKDataAccessor *)self _downloadRemoteAssetsWithConfiguration:v8 completion:v10];
}

- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
}

- (BOOL)remoteAssetsDownloaded
{
  return [(PKDataAccessor *)self remoteAssetsDownloadedForSEIDs:0];
}

- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3
{
  return 1;
}

- (BOOL)remoteAssetsDownloadedForScreenScale:(double)a3 suffix:(id)a4
{
  return 1;
}

- (id)remoteAssetManagerForSEIDs:(id)a3
{
  return 0;
}

- (PKRemoteAssetManager)remoteAssetManager
{
  return 0;
}

- (id)displayProfileOfType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = 136315394;
    int v8 = "-[PKDataAccessor displayProfileOfType:]";
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_error_impl(&dword_190E10000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (id)passLocalizedStringForKey:(id)a3
{
  return 0;
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 completion:(id)a5
{
}

- (void)downloadRemoteAssetsWithCompletion:(id)a3
{
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 completion:(id)a6
{
}

- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4
{
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 seids:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  int v16 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  [(PKDownloadRemoteAssetConfiguration *)v16 setScreenScale:a3];
  [(PKDownloadRemoteAssetConfiguration *)v16 setSuffix:v15];

  [(PKDownloadRemoteAssetConfiguration *)v16 setCloudStoreCoordinatorDelegate:v14];
  [(PKDownloadRemoteAssetConfiguration *)v16 setSeids:v13];

  [(PKDataAccessor *)self downloadRemoteAssetsWithConfiguration:v16 completion:v12];
}

- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 seids:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  [(PKDownloadRemoteAssetConfiguration *)v11 setCloudStoreCoordinatorDelegate:v10];

  [(PKDownloadRemoteAssetConfiguration *)v11 setSeids:v9];
  [(PKDataAccessor *)self downloadRemoteAssetsWithConfiguration:v11 completion:v8];
}

@end