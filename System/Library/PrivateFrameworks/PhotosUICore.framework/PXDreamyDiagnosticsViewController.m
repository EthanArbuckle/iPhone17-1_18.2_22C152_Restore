@interface PXDreamyDiagnosticsViewController
- (BOOL)useVariantVideoByDefaultInToggle;
- (NSURL)variantVideoURL;
- (PHAsset)variantAsset;
- (id)_loadAndCacheVariantAssetWithError:(id *)a3;
- (id)inputVideoButtonsTitle;
- (id)radarComponentID;
- (id)radarComponentName;
- (id)radarComponentVersion;
- (id)radarTitle;
- (id)variantVideoButtonsTitle;
- (id)variantVideoDescription;
- (int)variantVideoRequestID;
- (void)_loadAndCacheVariantVideoURLFromAsset:(id)a3 completion:(id)a4;
- (void)invalidateInputAndVariantReferences;
- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4;
- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4;
- (void)setVariantAsset:(id)a3;
- (void)setVariantVideoRequestID:(int)a3;
- (void)setVariantVideoURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXDreamyDiagnosticsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantVideoURL, 0);
  objc_storeStrong((id *)&self->_variantAsset, 0);
}

- (void)setVariantVideoRequestID:(int)a3
{
  self->_variantVideoRequestID = a3;
}

- (int)variantVideoRequestID
{
  return self->_variantVideoRequestID;
}

- (void)setVariantVideoURL:(id)a3
{
}

- (NSURL)variantVideoURL
{
  return self->_variantVideoURL;
}

- (void)setVariantAsset:(id)a3
{
}

- (PHAsset)variantAsset
{
  return self->_variantAsset;
}

- (id)_loadAndCacheVariantAssetWithError:(id *)a3
{
  v5 = [(PXDreamyDiagnosticsViewController *)self variantAsset];
  if (!v5)
  {
    v6 = [(PXVideoComparisonViewController *)self inputAsset];
    [v6 fetchPropertySetsIfNeeded];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__198435;
    v27 = __Block_byref_object_dispose__198436;
    id v28 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __72__PXDreamyDiagnosticsViewController__loadAndCacheVariantAssetWithError___block_invoke;
    v20 = &unk_1E5DC3FD0;
    v22 = &v23;
    v8 = v7;
    v21 = v8;
    [v6 getMasterFingerPrintWithCompletionHandler:&v17];
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v8, v9);
    if (!v24[5])
    {
      if (!a3)
      {
        v5 = 0;
LABEL_18:

        _Block_object_dispose(&v23, 8);
        goto LABEL_19;
      }
      v13 = (void *)MEMORY[0x1E4F28C58];
      v11 = [v6 uuid];
      objc_msgSend(v13, "px_genericErrorWithDebugDescription:", @"Unable to load master fingerprint for Asset with UUID: %@", v11);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v11 = [v10 librarySpecificFetchOptions];

    if ([v6 sourceType] == 16)
    {
      uint64_t v12 = 1;
    }
    else
    {
      if ([v6 sourceType] != 1)
      {
LABEL_10:
        v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"additionalAttributes.originalStableHash", v24[5], v17, v18, v19, v20];
        [v11 setInternalPredicate:v14];

        v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v11];
        if ([v15 count])
        {
          v5 = [v15 firstObject];
        }
        else if (a3)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No asset was found with a matching master fingerprint");
          v5 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }
        [(PXDreamyDiagnosticsViewController *)self setVariantAsset:v5];

        goto LABEL_17;
      }
      uint64_t v12 = 16;
    }
    [v11 setIncludeAssetSourceTypes:v12];
    goto LABEL_10;
  }
LABEL_19:
  return v5;
}

void __72__PXDreamyDiagnosticsViewController__loadAndCacheVariantAssetWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadAndCacheVariantVideoURLFromAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, void *))a4;
  v8 = [(PXDreamyDiagnosticsViewController *)self variantVideoURL];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    dispatch_time_t v9 = [MEMORY[0x1E4F390D0] defaultManager];
    objc_msgSend(v9, "cancelImageRequest:", -[PXDreamyDiagnosticsViewController variantVideoRequestID](self, "variantVideoRequestID"));

    id v10 = objc_alloc_init(MEMORY[0x1E4F39348]);
    [v10 setNetworkAccessAllowed:1];
    [v10 setVideoComplementAllowed:1];
    [v10 setStreamingAllowed:0];
    objc_initWeak(&location, self);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    v11 = [MEMORY[0x1E4F390D0] defaultManager];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __86__PXDreamyDiagnosticsViewController__loadAndCacheVariantVideoURLFromAsset_completion___block_invoke;
    uint64_t v17 = &unk_1E5DC3FA8;
    v19 = &v21;
    objc_copyWeak(&v20, &location);
    uint64_t v18 = v7;
    uint64_t v12 = [v11 requestURLForVideo:v6 options:v10 resultHandler:&v14];

    *((_DWORD *)v22 + 6) = v12;
    id v13 = objc_loadWeakRetained(&location);
    objc_msgSend(v13, "setVariantVideoRequestID:", v12, v14, v15, v16, v17);

    _Block_object_dispose(&v21, 8);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __86__PXDreamyDiagnosticsViewController__loadAndCacheVariantVideoURLFromAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v5;
  *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
}

void __86__PXDreamyDiagnosticsViewController__loadAndCacheVariantVideoURLFromAsset_completion___block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = [WeakRetained variantVideoRequestID];

  if (v2 == v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setVariantVideoRequestID:0];

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_loadWeakRetained(v3);
    [v8 setVariantVideoURL:v7];

    dispatch_time_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
}

- (void)invalidateInputAndVariantReferences
{
  v4.receiver = self;
  v4.super_class = (Class)PXDreamyDiagnosticsViewController;
  [(PXVideoComparisonViewController *)&v4 invalidateInputAndVariantReferences];
  [(PXDreamyDiagnosticsViewController *)self setVariantAsset:0];
  [(PXDreamyDiagnosticsViewController *)self setVariantVideoURL:0];
  v3 = [MEMORY[0x1E4F390D0] defaultManager];
  objc_msgSend(v3, "cancelImageRequest:", -[PXDreamyDiagnosticsViewController variantVideoRequestID](self, "variantVideoRequestID"));

  [(PXDreamyDiagnosticsViewController *)self setVariantVideoRequestID:0];
}

- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v11 = 0;
  id v6 = [(PXDreamyDiagnosticsViewController *)self _loadAndCacheVariantAssetWithError:&v11];
  id v7 = v11;
  id v8 = v7;
  if (!v6 || v7)
  {
    (*((void (**)(id, void, void, id))v5 + 2))(v5, 0, 0, v7);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__PXDreamyDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke;
    v9[3] = &unk_1E5DC3F80;
    id v10 = v5;
    [(PXDreamyDiagnosticsViewController *)self _loadAndCacheVariantVideoURLFromAsset:v6 completion:v9];
  }
}

uint64_t __89__PXDreamyDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v11 = 0;
  id v6 = [(PXDreamyDiagnosticsViewController *)self _loadAndCacheVariantAssetWithError:&v11];
  id v7 = v11;
  id v8 = v7;
  if (!v6 || v7)
  {
    v5[2](v5, 0, v7);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__PXDreamyDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke;
    v9[3] = &unk_1E5DC3F80;
    id v10 = v5;
    [(PXDreamyDiagnosticsViewController *)self _loadAndCacheVariantVideoURLFromAsset:v6 completion:v9];
  }
}

void __80__PXDreamyDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F16620];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithURL:v4];

  id v6 = [v5 asset];
  id v7 = v6;
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeRangeMake(&v11, &start, &duration);
  CMTimeRange v8 = v11;
  [v5 setLoopTimeRange:&v8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)variantVideoDescription
{
  int v2 = [(PXDreamyDiagnosticsViewController *)self variantAsset];
  v3 = [v2 debugDescription];

  return v3;
}

- (id)variantVideoButtonsTitle
{
  int v2 = [(PXVideoComparisonViewController *)self inputAsset];
  uint64_t v3 = [v2 sourceType];

  if (v3 == 16) {
    return @"Original";
  }
  else {
    return @"Dreamy";
  }
}

- (id)inputVideoButtonsTitle
{
  int v2 = [(PXVideoComparisonViewController *)self inputAsset];
  uint64_t v3 = [v2 sourceType];

  if (v3 == 16) {
    return @"Dreamy";
  }
  else {
    return @"Original";
  }
}

- (BOOL)useVariantVideoByDefaultInToggle
{
  return 0;
}

- (id)radarComponentVersion
{
  return @"iOS";
}

- (id)radarComponentName
{
  return @"Photos UI Live Photos";
}

- (id)radarComponentID
{
  return @"659839";
}

- (id)radarTitle
{
  return @"[Dreamy] Feedback: ";
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PXDreamyDiagnosticsViewController;
  [(PXVideoComparisonViewController *)&v3 viewDidLoad];
  [(PXDreamyDiagnosticsViewController *)self setTitle:@"Dreamy"];
}

@end