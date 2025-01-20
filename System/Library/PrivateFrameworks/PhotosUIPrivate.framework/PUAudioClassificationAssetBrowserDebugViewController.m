@interface PUAudioClassificationAssetBrowserDebugViewController
- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4;
- (NSString)audioClassificationName;
- (id)_cloneAsset:(id)a3 toDirectory:(id)a4;
- (void)_fileRadarWithIncorrectAssets:(id)a3;
- (void)_presentTapToRadar;
- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7;
- (void)setAudioClassificationName:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUAudioClassificationAssetBrowserDebugViewController

- (void).cxx_destruct
{
}

- (void)setAudioClassificationName:(id)a3
{
}

- (NSString)audioClassificationName
{
  return self->_audioClassificationName;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = [MEMORY[0x1E4F38F60] assetResourcesForAsset:v5];
  id v8 = (id)[v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      if ([v11 type] == 9) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = (id)[v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v11;

    if (v8)
    {
      v13 = [MEMORY[0x1E4F29128] UUID];
      v14 = [v13 UUIDString];
      v15 = [v8 originalFilename];
      v16 = [v15 pathExtension];
      v7 = [v14 stringByAppendingPathExtension:v16];

      v17 = [v6 URLByAppendingPathComponent:v7];
      id v18 = objc_alloc_init(MEMORY[0x1E4F38F98]);
      [v18 setNetworkAccessAllowed:1];
      v19 = [MEMORY[0x1E4F38F78] defaultManager];
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__21961;
      v27[4] = __Block_byref_object_dispose__21962;
      id v28 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __80__PUAudioClassificationAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke;
      v23[3] = &unk_1E5F24910;
      v26 = v27;
      id v12 = v17;
      id v24 = v12;
      v21 = v20;
      v25 = v21;
      [v19 writeDataForAssetResource:v8 toFile:v12 options:v18 completionHandler:v23];
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

      _Block_object_dispose(v27, 8);
      goto LABEL_12;
    }
    id v12 = 0;
  }
  else
  {
LABEL_9:
    id v12 = 0;
LABEL_12:
  }
  return v12;
}

void __80__PUAudioClassificationAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Failed to write asset data to URL: %@, error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v42 = 0;
  v36 = v6;
  char v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v42];
  id v10 = v42;

  if (v9)
  {
    uint64_t v11 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v34 = v7;
    id obj = v7;
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          v16 = v11;
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v18 = [(PUAudioClassificationAssetBrowserDebugViewController *)self _cloneAsset:v17 toDirectory:v36];
          v19 = [v17 mediaAnalysisProperties];
          [v19 audioClassification];
          dispatch_semaphore_t v20 = PHAssetMediaAnalysisStringsWithMultipleAudioClassifications();

          v47[0] = @"image";
          uint64_t v21 = [v18 lastPathComponent];
          v22 = (void *)v21;
          if (v21) {
            v23 = (__CFString *)v21;
          }
          else {
            v23 = &stru_1F06BE7B8;
          }
          v47[1] = @"audioClassifications";
          v48[0] = v23;
          v48[1] = v20;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

          uint64_t v11 = v16;
          [v16 addObject:v24];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
      }
      while (v13);
    }

    v45[0] = @"type";
    v45[1] = @"audioClassificationName";
    audioClassificationName = self->_audioClassificationName;
    v46[0] = @"audioClassifications";
    v46[1] = audioClassificationName;
    v45[2] = @"report";
    v43 = @"FP";
    v44 = v11;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v46[2] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];

    v37 = v10;
    id v28 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v27 options:1 error:&v37];
    long long v29 = v37;

    if (v28)
    {
      long long v30 = [v36 URLByAppendingPathComponent:@"report.json"];
      BOOL v31 = 1;
      if (([v28 writeToURL:v30 atomically:1] & 1) == 0)
      {
        long long v32 = PLUIGetLog();
        id v7 = v34;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v30;
          __int16 v52 = 2112;
          v53 = v29;
          _os_log_impl(&dword_1AE9F8000, v32, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
        }

        BOOL v31 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      long long v30 = PLUIGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v29;
        _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
      BOOL v31 = 0;
    }
    id v7 = v34;
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v11 = PLUIGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v36;
    __int16 v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  BOOL v31 = 0;
  long long v29 = v10;
LABEL_25:

  return v31;
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Collecting data for radar..." preferredStyle:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E5F2E908;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PUAudioClassificationAssetBrowserDebugViewController *)self presentViewController:v6 animated:1 completion:v8];
}

void __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] assetCollectionAssets];
  unint64_t v3 = [v2 count];

  unint64_t v4 = [a1[5] count];
  id v5 = (void *)MEMORY[0x1E4F28EE0];
  id v6 = [NSNumber numberWithDouble:(double)v4 / (double)v3];
  id v7 = [v5 localizedStringFromNumber:v6 numberStyle:3];

  uint64_t v8 = [NSString stringWithFormat:@"\"%@\" Audio Classification has %ld incorrect classification(s)", *((void *)a1[4] + 222), v4];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"— Audio Classification Feedback —\n"];
  [v9 appendFormat:@"Audio Classification: \"%@\"\n", *((void *)a1[4] + 222)];
  [v9 appendFormat:@"Incorrect Classification(s): %ld of %ld (%@)\n", v4, v3, v7];
  id v10 = NSTemporaryDirectory();
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];
  uint64_t v13 = [v10 stringByAppendingPathComponent:v12];

  uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];
  if (([a1[4] _writeDiagnosticsToURL:v14 incorrectAssets:a1[5]] & 1) == 0)
  {
    v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v30 = v14;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }
  }
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = 0;
  v17 = [v16 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:0 options:4 error:&v28];
  id v18 = v28;
  if (!v17)
  {
    v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v30 = v14;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }
  }
  dispatch_semaphore_t v20 = (void *)MEMORY[0x1E4F90200];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_250;
  v24[3] = &unk_1E5F2B8C8;
  v24[4] = a1[4];
  id v25 = a1[6];
  id v26 = v16;
  id v27 = v14;
  id v21 = v14;
  id v22 = v16;
  LOBYTE(v23) = 0;
  [v20 fileRadarWithTitle:v8 description:v9 classification:@"Other Bug" componentID:@"994107" componentName:@"Audio - DSP Algorithm Machine Learning" componentVersion:@"All" keyword:@"1132540" attachmentURLs:v17 includeSysDiagnose:v23 completionHandler:v24];
}

void __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_250(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEditing:0 animated:0];
  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)_presentTapToRadar
{
  uint64_t v3 = [(PUPhotosGridViewController *)self photoSelectionManager];
  char v4 = [(PUPhotosAlbumViewController *)self assetCollection];
  char v5 = [v3 isAnyAssetSelectedInAssetCollection:v4];

  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E5F2CEE8;
    v9[4] = self;
    [MEMORY[0x1E4F90200] presentTermsAndConditionsForUIViewController:self completion:v9];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"File Radar" message:@"File radar without attaching photos?\nSelecting incorrect photos can help improve the audio classification feature." preferredStyle:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E5F2BF98;
    v10[4] = self;
    uint64_t v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"File Radar" style:0 handler:v10];
    id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v6 addAction:v7];
    [v6 addAction:v8];
    [(PUAudioClassificationAssetBrowserDebugViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

uint64_t __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:0];
}

void __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) selectedAssets];
    [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:v3];
  }
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUTTR");
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v13 style:0 target:self action:sel__presentTapToRadar];
  v15.receiver = self;
  v15.super_class = (Class)PUAudioClassificationAssetBrowserDebugViewController;
  [(PUPhotosGridViewController *)&v15 getTitle:a3 prompt:a4 shouldHideBackButton:a5 leftBarButtonItems:a6 rightBarButtonItems:a7];
  if (*a6)
  {
    [*a6 arrayByAddingObject:v14];
  }
  else
  {
    v16[0] = v14;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUAudioClassificationAssetBrowserDebugViewController;
  [(PUPhotosAlbumViewController *)&v4 viewDidLoad];
  id v3 = [(PUAudioClassificationAssetBrowserDebugViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];
}

@end