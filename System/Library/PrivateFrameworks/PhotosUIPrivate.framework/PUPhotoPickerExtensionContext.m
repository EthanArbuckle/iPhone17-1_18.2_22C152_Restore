@interface PUPhotoPickerExtensionContext
+ (void)configureImageManagerLimit;
- (NSOperationQueue)multipleMediaConversionConcurrentQueue;
- (NSString)temporaryDirectoryInHost;
- (OS_dispatch_queue)multipleMediaIsolationQueue;
- (PUPhotoPickerExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (id)_createSandboxTokenForPath:(id)a3;
- (id)_createSandboxTokenForURL:(id)a3;
- (id)_host;
- (void)_createPhotoPickerInfoDictionaryFromInfoDictionary:(id)a3 appendTo:(id)a4 completion:(id)a5;
- (void)_handleLivePhotoImageUrlFetch:(id)a3 appendTo:(id)a4 completion:(id)a5;
- (void)_handleLivePhotoVideoUrlFetch:(id)a3 appendTo:(id)a4 completion:(id)a5;
- (void)_handleMutlipleMediaCompletion:(id)a3;
- (void)_photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:(id)a3 completion:(id)a4;
- (void)_saveImageURLForLivePhoto:(id)a3 fileURL:(id)a4 appendTo:(id)a5 completion:(id)a6;
- (void)_saveVideoURLForLivePhoto:(id)a3 fileURL:(id)a4 appendTo:(id)a5 completion:(id)a6;
- (void)cancelPhotoPicker;
- (void)didDisplayPhotoPickerPreview;
- (void)didDisplayPhotoPickerSourceType:(id)a3;
- (void)didSelectMediaWithInfoDictionary:(id)a3;
- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3;
- (void)didSetOnboardingHeaderDismissed:(BOOL)a3;
- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3;
- (void)initiatePhotoPickerSelection;
- (void)invalidatePhotoPickerHostServices;
- (void)invalidatePhotoPickerRemoteServices;
- (void)performPhotoPickerPreviewOfFirstAsset;
- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4;
- (void)requestedViewControllerOptionsWithCompletionHandler:(id)a3;
- (void)setTemporaryDirectoryInHost:(id)a3;
@end

@implementation PUPhotoPickerExtensionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryInHost, 0);
  objc_storeStrong((id *)&self->_multipleMediaConversionConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_multipleMediaIsolationQueue, 0);
}

- (void)setTemporaryDirectoryInHost:(id)a3
{
}

- (NSString)temporaryDirectoryInHost
{
  return self->_temporaryDirectoryInHost;
}

- (id)_createSandboxTokenForPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerExtensionContext.m" lineNumber:452 description:@"path cannot be nil"];
  }
  v6 = PLGetSandboxExtensionToken();

  return v6;
}

- (id)_createSandboxTokenForURL:(id)a3
{
  v4 = [a3 path];
  id v5 = [(PUPhotoPickerExtensionContext *)self _createSandboxTokenForPath:v4];

  return v5;
}

- (void)_saveVideoURLForLivePhoto:(id)a3 fileURL:(id)a4 appendTo:(id)a5 completion:(id)a6
{
  v14 = (void (**)(id, void *))a6;
  id v9 = a4;
  v10 = (void *)[a5 mutableCopy];
  v11 = [v9 path];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F39A40]];

  v12 = [(PUPhotoPickerExtensionContext *)self _createSandboxTokenForURL:v9];

  [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F39A48]];
  if (v14)
  {
    v13 = (void *)[v10 copy];
    v14[2](v14, v13);
  }
}

- (void)_handleLivePhotoVideoUrlFetch:(id)a3 appendTo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUPhotoPickerExtensionContext__handleLivePhotoVideoUrlFetch_appendTo_completion___block_invoke;
  aBlock[3] = &unk_1E5F29E50;
  objc_copyWeak(&v21, &location);
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  v14 = _Block_copy(aBlock);
  uint64_t v15 = [v11 videoFileLoader];
  v16 = (void *)v15;
  if (v15) {
    (*(void (**)(uint64_t, void, void, void *))(v15 + 16))(v15, 0, 0, v14);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __83__PUPhotoPickerExtensionContext__handleLivePhotoVideoUrlFetch_appendTo_completion___block_invoke(void *a1, void *a2)
{
  v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _saveVideoURLForLivePhoto:a1[4] fileURL:v4 appendTo:a1[5] completion:a1[6]];
}

- (void)_saveImageURLForLivePhoto:(id)a3 fileURL:(id)a4 appendTo:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v16 = (id)[a5 mutableCopy];
  id v13 = [v11 path];
  [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F39A30]];

  v14 = [(PUPhotoPickerExtensionContext *)self _createSandboxTokenForURL:v11];

  [v16 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F39A38]];
  uint64_t v15 = (void *)[v16 copy];
  [(PUPhotoPickerExtensionContext *)self _handleLivePhotoVideoUrlFetch:v12 appendTo:v15 completion:v10];
}

- (void)_handleLivePhotoImageUrlFetch:(id)a3 appendTo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUPhotoPickerExtensionContext__handleLivePhotoImageUrlFetch_appendTo_completion___block_invoke;
  aBlock[3] = &unk_1E5F29E50;
  objc_copyWeak(&v21, &location);
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  v14 = _Block_copy(aBlock);
  uint64_t v15 = [v11 imageFileLoader];
  id v16 = (void *)v15;
  if (v15) {
    (*(void (**)(uint64_t, void, void, void *))(v15 + 16))(v15, 0, 0, v14);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __83__PUPhotoPickerExtensionContext__handleLivePhotoImageUrlFetch_appendTo_completion___block_invoke(void *a1, void *a2)
{
  v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _saveImageURLForLivePhoto:a1[4] fileURL:v4 appendTo:a1[5] completion:a1[6]];
}

- (void)_photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:(id)a3 completion:(id)a4
{
  v121[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v89 = (void (**)(id, void *))a4;
  v86 = v6;
  v7 = (void *)[v6 mutableCopy];
  v98 = self;
  v96 = [(PUPhotoPickerExtensionContext *)self _principalObject];
  uint64_t v8 = [v96 savingOptions];
  id v9 = [NSNumber numberWithUnsignedInteger:v8];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F39A90]];

  v88 = [v96 properties];
  uint64_t v10 = *MEMORY[0x1E4FB3220];
  v87 = [v88 objectForKeyedSubscript:*MEMORY[0x1E4FB3220]];
  [v7 setObject:v87 forKeyedSubscript:v10];
  uint64_t v11 = *MEMORY[0x1E4FB2A28];
  v94 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A28]];
  if (v94)
  {
    id v111 = 0;
    id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v94 requiringSecureCoding:1 error:&v111];
    id v13 = v111;
    if (v13)
    {
      v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "%s Unable to archive original image %@", buf, 0x16u);
      }
    }
    [v7 setObject:v12 forKeyedSubscript:v11];
  }
  uint64_t v15 = *MEMORY[0x1E4FB2A08];
  id v16 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A08]];
  v97 = v16;
  if (v16)
  {
    v17 = [v16 path];
    [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F39A60]];
    [v7 setObject:0 forKeyedSubscript:v15];

    id v16 = v97;
  }
  BOOL v18 = v16 != 0;
  v95 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F39A88]];
  char v19 = !v18;
  if (!v95) {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    id v92 = objc_alloc_init(MEMORY[0x1E4F74898]);
    v120[0] = *MEMORY[0x1E4F749F0];
    id v21 = [MEMORY[0x1E4F748D0] policyWithLocation:0];
    v121[0] = v21;
    v120[1] = *MEMORY[0x1E4F74A20];
    v22 = [NSString stringWithFormat:@"UIImagePickerController downscaling image to target length: %@", v95];
    v121[1] = v22;
    uint64_t v23 = *MEMORY[0x1E4F749E0];
    v120[2] = *MEMORY[0x1E4F74988];
    v120[3] = v23;
    v121[2] = MEMORY[0x1E4F1CC38];
    v121[3] = v95;
    v120[4] = *MEMORY[0x1E4F749D8];
    v121[4] = &unk_1F078CA28;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:5];

    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x2020000000;
    uint64_t v110 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v117 = __Block_byref_object_copy__63456;
    v118 = __Block_byref_object_dispose__63457;
    id v119 = 0;
    v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    v26 = [v25 temporaryDirectory];
    v27 = [MEMORY[0x1E4F29128] UUID];
    v28 = [v27 UUIDString];
    v29 = [v26 URLByAppendingPathComponent:v28 isDirectory:0];

    v30 = [MEMORY[0x1E4F748C8] collectionWithMainResourceURL:v97];
    v31 = [MEMORY[0x1E4F748C8] collectionWithMainResourceURL:v29];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __112__PUPhotoPickerExtensionContext__photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary_completion___block_invoke;
    v103[3] = &unk_1E5F29E28;
    v105 = &v107;
    v106 = buf;
    v32 = v20;
    v104 = v32;
    [v92 convertImageAtSourceURLCollection:v30 toDestinationURLCollection:v31 options:v24 completionHandler:v103];
    dispatch_time_t v33 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v32, v33);
    v34 = [v29 path];
    uint64_t v35 = PLGetSandboxExtensionToken();
    v36 = (void *)v35;
    if (v108[3] == 1 && v34 && v35)
    {
      [v7 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F39A60]];
      [v7 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F39A68]];
    }
    else
    {
      v37 = PLUIGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
        *(_DWORD *)v112 = 136315394;
        v113 = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:completion:]";
        __int16 v114 = 2112;
        v115 = v38;
        _os_log_impl(&dword_1AE9F8000, v37, OS_LOG_TYPE_ERROR, "%s Unable to scale image with error: %@", v112, 0x16u);
      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v107, 8);
  }
  uint64_t v39 = *MEMORY[0x1E4FB2A00];
  v93 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A00]];
  if (v93)
  {
    id v102 = 0;
    v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v93 requiringSecureCoding:1 error:&v102];
    id v41 = v102;
    if (v41)
    {
      v42 = PLUIGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v41;
        _os_log_impl(&dword_1AE9F8000, v42, OS_LOG_TYPE_ERROR, "%s Unable to archive edited image %@", buf, 0x16u);
      }
    }
    [v7 setObject:v40 forKeyedSubscript:v39];
  }
  uint64_t v43 = *MEMORY[0x1E4FB3218];
  v91 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB3218]];
  if (v91)
  {
    id v101 = 0;
    v44 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v91 requiringSecureCoding:1 error:&v101];
    id v45 = v101;
    if (v45)
    {
      v46 = PLUIGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        _os_log_impl(&dword_1AE9F8000, v46, OS_LOG_TYPE_ERROR, "%s Unable to archive fullscreen image %@", buf, 0x16u);
      }
    }
    [v7 setObject:v44 forKeyedSubscript:v43];
  }
  uint64_t v47 = *MEMORY[0x1E4FB29F8];
  v90 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB29F8]];
  if (v90)
  {
    id v100 = 0;
    v48 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v90 requiringSecureCoding:1 error:&v100];
    id v49 = v100;
    if (v49)
    {
      v50 = PLUIGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v49;
        _os_log_impl(&dword_1AE9F8000, v50, OS_LOG_TYPE_ERROR, "%s Unable to archive crop rect %@", buf, 0x16u);
      }
    }
    [v7 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F39A10]];
    [v7 setObject:0 forKeyedSubscript:v47];
  }
  uint64_t v51 = *MEMORY[0x1E4FB2A38];
  v52 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A38]];
  v53 = v52;
  if (v52)
  {
    v54 = [v52 absoluteString];
    [v7 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F39A80]];
  }
  [v7 setObject:0 forKeyedSubscript:v51];
  uint64_t v55 = *MEMORY[0x1E4FB2A20];
  v56 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A20]];
  v57 = v56;
  if (v56)
  {
    v58 = [v56 path];
    [v7 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F39A50]];

    v59 = [(PUPhotoPickerExtensionContext *)v98 _createSandboxTokenForURL:v57];
    [v7 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F39A58]];
  }
  [v7 setObject:0 forKeyedSubscript:v55];
  uint64_t v60 = *MEMORY[0x1E4FB3228];
  v61 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB3228]];
  v62 = v61;
  if (v61)
  {
    v63 = [v61 path];
    [v7 setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F39A70]];

    v64 = [(PUPhotoPickerExtensionContext *)v98 _createSandboxTokenForURL:v62];
    [v7 setObject:v64 forKeyedSubscript:*MEMORY[0x1E4F39A78]];
  }
  [v7 setObject:0 forKeyedSubscript:v60];
  uint64_t v65 = *MEMORY[0x1E4FB31F0];
  v66 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB31F0]];
  v67 = v66;
  if (v66)
  {
    v68 = [v66 path];
    [v7 setObject:v68 forKeyedSubscript:*MEMORY[0x1E4F39A18]];

    v69 = [(PUPhotoPickerExtensionContext *)v98 _createSandboxTokenForURL:v67];
    [v7 setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F39A20]];
  }
  [v7 setObject:0 forKeyedSubscript:v65];
  v70 = [v7 objectForKeyedSubscript:@"_UIImagePickerDebugSidecarFileURLs"];
  if (v70)
  {
    v71 = [(PUPhotoPickerExtensionContext *)v98 _auxiliaryConnection];
    v72 = [v71 valueForEntitlement:@"com.apple.photos.debugsidecar"];
    BOOL v73 = v72 == 0;

    if (!v73)
    {
      id v99 = 0;
      v74 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v70 requiringSecureCoding:1 error:&v99];
      id v75 = v99;
      [v7 setObject:v74 forKeyedSubscript:@"_UIImagePickerDebugSidecarFileURLsData"];

      if (v75)
      {
        v76 = PLUIGetLog();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfo"
                               "Dictionary:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v75;
          _os_log_impl(&dword_1AE9F8000, v76, OS_LOG_TYPE_ERROR, "%s Unable to archive debug sidecar files %@", buf, 0x16u);
        }
      }
    }
    [v7 removeObjectForKey:@"_UIImagePickerDebugSidecarFileURLs"];
  }
  uint64_t v77 = *MEMORY[0x1E4FB2A10];
  v78 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A10]];
  if (v78)
  {
    [v7 setObject:0 forKeyedSubscript:v77];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F39A28]];
    v79 = [v78 imageURL];
    uint64_t v80 = [v78 videoURL];
    v81 = (void *)v80;
    if (!v79 || !v80)
    {
      [(PUPhotoPickerExtensionContext *)v98 _handleLivePhotoImageUrlFetch:v78 appendTo:v7 completion:v89];

      goto LABEL_61;
    }
    v82 = [v79 path];
    [v7 setObject:v82 forKeyedSubscript:*MEMORY[0x1E4F39A30]];

    v83 = [(PUPhotoPickerExtensionContext *)v98 _createSandboxTokenForURL:v79];
    [v7 setObject:v83 forKeyedSubscript:*MEMORY[0x1E4F39A38]];

    v84 = [v81 path];
    [v7 setObject:v84 forKeyedSubscript:*MEMORY[0x1E4F39A40]];

    v85 = [(PUPhotoPickerExtensionContext *)v98 _createSandboxTokenForURL:v81];
    [v7 setObject:v85 forKeyedSubscript:*MEMORY[0x1E4F39A48]];
  }
  if (v89)
  {
    v79 = (void *)[v7 copy];
    v89[2](v89, v79);
LABEL_61:
  }
}

void __112__PUPhotoPickerExtensionContext__photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerExtensionContext;
  v2 = [(PUPhotoPickerAbstractExtensionContext *)&v3 principalObject];
  if ([v2 conformsToProtocol:&unk_1F0880178]) {
    [v2 performPhotoPickerPreviewOfFirstAsset];
  }
}

- (void)initiatePhotoPickerSelection
{
  PLPhotoPickerGetLog();
  objc_super v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_EVENT, v5, "InitiateSelection", "", buf, 2u);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPickerExtensionContext;
  id v6 = [(PUPhotoPickerAbstractExtensionContext *)&v7 principalObject];
  if ([v6 conformsToProtocol:&unk_1F0880F90]) {
    [v6 performPhotosSelection];
  }
}

- (void)didSelectMediaWithInfoDictionary:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PUPhotoPickerExtensionContext_didSelectMediaWithInfoDictionary___block_invoke;
  v5[3] = &unk_1E5F29E00;
  objc_copyWeak(&v6, &location);
  [(PUPhotoPickerExtensionContext *)self _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:v4 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__PUPhotoPickerExtensionContext_didSelectMediaWithInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained _host];
  [v4 didSelectMediaWithInfoDictionary:v3];
}

- (void)_handleMutlipleMediaCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__63456;
  BOOL v18 = __Block_byref_object_dispose__63457;
  id v19 = 0;
  os_signpost_id_t v5 = [(PUPhotoPickerExtensionContext *)self multipleMediaIsolationQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __64__PUPhotoPickerExtensionContext__handleMutlipleMediaCompletion___block_invoke;
  uint64_t v11 = &unk_1E5F2E200;
  id v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, &v8);

  objc_super v7 = [(PUPhotoPickerExtensionContext *)self _host];
  [v7 didSelectMultipleMediaItemsWithInfoDictionaries:v15[5]];

  _Block_object_dispose(&v14, 8);
}

void __64__PUPhotoPickerExtensionContext__handleMutlipleMediaCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_createPhotoPickerInfoDictionaryFromInfoDictionary:(id)a3 appendTo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke;
  v13[3] = &unk_1E5F29DD8;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(PUPhotoPickerExtensionContext *)self _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:v8 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = [v8 multipleMediaIsolationQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke_2;
    v11[3] = &unk_1E5F2ECC8;
    id v12 = *(id *)(a1 + 32);
    id v13 = v3;
    dispatch_sync(v9, v11);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v5, v6, v7);
  }
}

uint64_t __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLPhotoPickerGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v35 = [v4 count];
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ProcessingSelections", "%{public}ld", buf, 0xCu);
  }
  BOOL v18 = v8;
  id v19 = (void *)v6;

  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v10 = dispatch_group_create();
  objc_initWeak((id *)buf, self);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
        dispatch_group_enter(v10);
        id v15 = [(PUPhotoPickerExtensionContext *)self multipleMediaConversionConcurrentQueue];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke;
        v25[3] = &unk_1E5F2D3F0;
        objc_copyWeak(&v28, (id *)buf);
        v25[4] = v14;
        id v26 = v9;
        v27 = v10;
        [v15 addOperationWithBlock:v25];

        objc_destroyWeak(&v28);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_3;
  block[3] = &unk_1E5F2AEB0;
  v22 = v18;
  v24[1] = v19;
  id v16 = v18;
  objc_copyWeak(v24, (id *)buf);
  id v23 = v9;
  id v17 = v9;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

void __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_2;
  v5[3] = &unk_1E5F2ED10;
  id v6 = *(id *)(a1 + 48);
  [WeakRetained _createPhotoPickerInfoDictionaryFromInfoDictionary:v3 appendTo:v4 completion:v5];
}

void __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(id *)(a1 + 32);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ProcessingSelections", "", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleMutlipleMediaCompletion:*(void *)(a1 + 40)];
}

void __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_2(uint64_t a1)
{
}

- (void)didDisplayPhotoPickerPreview
{
  id v2 = [(PUPhotoPickerExtensionContext *)self _host];
  [v2 didDisplayPhotoPickerPreview];
}

- (void)didDisplayPhotoPickerSourceType:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoPickerExtensionContext *)self _host];
  [v5 didDisplayPhotoPickerSourceType:v4];
}

- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoPickerExtensionContext *)self _host];
  [v5 dismissCurrentViewControllerFromPhotoPickerAnimated:v4];
}

- (void)didSetOnboardingHeaderDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPhotoPickerExtensionContext *)self _host];
  [v4 didSetOnboardingHeaderDismissed:v3];
}

- (void)invalidatePhotoPickerHostServices
{
  id v2 = [(PUPhotoPickerExtensionContext *)self _host];
  [v2 invalidatePhotoPickerHostServices];
}

- (void)cancelPhotoPicker
{
  id v2 = [(PUPhotoPickerExtensionContext *)self _host];
  [v2 cancelPhotoPicker];
}

- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerExtensionContext.m" lineNumber:114 description:@"NSData may not be nil in setTraitCollectionWithData:completion"];
  }
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoPickerExtensionContext;
  id v9 = [(PUPhotoPickerAbstractExtensionContext *)&v11 principalObject];
  if ([v9 conformsToProtocol:&unk_1F0880F90]) {
    [v9 performTraitCollectionUpdateUsingData:v7 completion:v8];
  }
}

- (void)invalidatePhotoPickerRemoteServices
{
  BOOL v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobileslideshow.photo-picker" code:0 userInfo:MEMORY[0x1E4F1CC08]];
  [(PUPhotoPickerExtensionContext *)self cancelRequestWithError:v3];
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerExtensionContext;
  [(PUPhotoPickerAbstractExtensionContext *)&v4 invalidateContext];
}

- (id)_host
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerExtensionContext;
  id v2 = [(PUPhotoPickerAbstractExtensionContext *)&v4 proxy];
  return v2;
}

- (NSOperationQueue)multipleMediaConversionConcurrentQueue
{
  multipleMediaConversionConcurrentQueue = self->_multipleMediaConversionConcurrentQueue;
  if (!multipleMediaConversionConcurrentQueue)
  {
    objc_super v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v5 = self->_multipleMediaConversionConcurrentQueue;
    self->_multipleMediaConversionConcurrentQueue = v4;

    [(NSOperationQueue *)self->_multipleMediaConversionConcurrentQueue setMaxConcurrentOperationCount:2];
    multipleMediaConversionConcurrentQueue = self->_multipleMediaConversionConcurrentQueue;
  }
  return multipleMediaConversionConcurrentQueue;
}

- (OS_dispatch_queue)multipleMediaIsolationQueue
{
  id v2 = self;
  objc_sync_enter(v2);
  multipleMediaIsolationQueue = v2->_multipleMediaIsolationQueue;
  if (!multipleMediaIsolationQueue)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobileslideshow.photo-picker.multiplemediawrite", 0);
    id v5 = v2->_multipleMediaIsolationQueue;
    v2->_multipleMediaIsolationQueue = (OS_dispatch_queue *)v4;

    multipleMediaIsolationQueue = v2->_multipleMediaIsolationQueue;
  }
  id v6 = multipleMediaIsolationQueue;
  objc_sync_exit(v2);

  return v6;
}

- (void)requestedViewControllerOptionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoPickerExtensionContext *)self inputItems];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PUPhotoPickerExtensionContext_requestedViewControllerOptionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5F29DB0;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [(PUPhotoPickerAbstractExtensionContext *)self firstPayloadFromExtensionItems:v5 completion:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __85__PUPhotoPickerExtensionContext_requestedViewControllerOptionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
  else
  {
    id v7 = [v11 photoPickerProperties];
    id v8 = [v7 objectForKeyedSubscript:@"_UIImagePickerControllerTemporaryDirectoryUrl"];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setTemporaryDirectoryInHost:v8];

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v11, 0);
    }
  }
}

- (PUPhotoPickerExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPickerExtensionContext;
  id v5 = [(PUPhotoPickerExtensionContext *)&v7 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5) {
    [(id)objc_opt_class() configureImageManagerLimit];
  }
  return v5;
}

+ (void)configureImageManagerLimit
{
  if (configureImageManagerLimit_onceToken != -1) {
    dispatch_once(&configureImageManagerLimit_onceToken, &__block_literal_global_63546);
  }
}

uint64_t __59__PUPhotoPickerExtensionContext_configureImageManagerLimit__block_invoke()
{
  return [MEMORY[0x1E4F390C8] setMaxConcurrentDecodeCount:1];
}

@end