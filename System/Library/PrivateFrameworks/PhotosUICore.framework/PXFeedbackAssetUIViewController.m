@interface PXFeedbackAssetUIViewController
- (BOOL)shouldDisplaySecondaryFeedbackButtons;
- (BOOL)userLikedIt;
- (NSArray)autoLoopFrameworkDiagnosticFileURLs;
- (NSDictionary)negativeFeedback;
- (NSDictionary)positiveFeedback;
- (PHAsset)asset;
- (PXAutoloopVideoProcessTask)autoLoopFrameworkDiagnosticsCurrentTask;
- (PXFeedbackAssetUIViewController)initWithAsset:(id)a3 delegate:(id)a4;
- (PXFeedbackAssetUIViewControllerDelegate)delegate;
- (PXFeedbackLikeItOrNotComboUIViewController)feedbackController;
- (UINavigationController)navigationController;
- (id)longTitleText;
- (id)negativeFeedbackKeys;
- (id)positiveFeedbackKeys;
- (id)viewTitleForRadar;
- (void)_fileRadarWithAutoLoopAsset:(id)a3 positiveFeedback:(id)a4 negativeFeedback:(id)a5;
- (void)_startAutoLoopVideoTaskForDiagnosticsWithAsset:(id)a3;
- (void)autoloopVideoTaskStatusDidChange:(id)a3;
- (void)continueFiling;
- (void)setAsset:(id)a3;
- (void)setAutoLoopFrameworkDiagnosticFileURLs:(id)a3;
- (void)setAutoLoopFrameworkDiagnosticsCurrentTask:(id)a3;
- (void)setFeedbackController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNegativeFeedback:(id)a3;
- (void)setPositiveFeedback:(id)a3;
- (void)setUserLikedIt:(BOOL)a3;
- (void)userDidFinish:(BOOL)a3;
- (void)userIndicatedDislike;
- (void)userIndicatedLike;
- (void)userSentPositiveFeedback:(id)a3 negativeFeedback:(id)a4 customFeedback:(id)a5;
- (void)viewDidLoad;
@end

@implementation PXFeedbackAssetUIViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoLoopFrameworkDiagnosticFileURLs, 0);
  objc_storeStrong((id *)&self->_autoLoopFrameworkDiagnosticsCurrentTask, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_negativeFeedback, 0);
  objc_storeStrong((id *)&self->_positiveFeedback, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setAutoLoopFrameworkDiagnosticFileURLs:(id)a3
{
}

- (NSArray)autoLoopFrameworkDiagnosticFileURLs
{
  return self->_autoLoopFrameworkDiagnosticFileURLs;
}

- (void)setAutoLoopFrameworkDiagnosticsCurrentTask:(id)a3
{
}

- (PXAutoloopVideoProcessTask)autoLoopFrameworkDiagnosticsCurrentTask
{
  return self->_autoLoopFrameworkDiagnosticsCurrentTask;
}

- (void)setFeedbackController:(id)a3
{
}

- (PXFeedbackLikeItOrNotComboUIViewController)feedbackController
{
  return self->_feedbackController;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNegativeFeedback:(id)a3
{
}

- (NSDictionary)negativeFeedback
{
  return self->_negativeFeedback;
}

- (void)setPositiveFeedback:(id)a3
{
}

- (NSDictionary)positiveFeedback
{
  return self->_positiveFeedback;
}

- (void)setUserLikedIt:(BOOL)a3
{
  self->_userLikedIt = a3;
}

- (BOOL)userLikedIt
{
  return self->_userLikedIt;
}

- (PXFeedbackAssetUIViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFeedbackAssetUIViewControllerDelegate *)WeakRetained;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)autoloopVideoTaskStatusDidChange:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXFeedbackAssetUIViewController *)self autoLoopFrameworkDiagnosticsCurrentTask];
  if (v5 == v4)
  {
    uint64_t v6 = [v4 status];

    if (v6 == 4)
    {
      v7 = objc_opt_new();
      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      v9 = (void *)MEMORY[0x1E4F1CB10];
      v10 = [v4 temporaryFilesDirectory];
      uint64_t v11 = [v9 fileURLWithPath:v10 isDirectory:1];

      uint64_t v12 = *MEMORY[0x1E4F1C670];
      v30[0] = *MEMORY[0x1E4F1C670];
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      v22 = (void *)v11;
      v23 = v8;
      v14 = [v8 enumeratorAtURL:v11 includingPropertiesForKeys:v13 options:4 errorHandler:&__block_literal_global_265];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
            id v24 = 0;
            [v20 getResourceValue:&v24 forKey:v12 error:0];
            id v21 = v24;
            if ([v21 BOOLValue]) {
              [v7 addObject:v20];
            }
            else {
              [v15 skipDescendants];
            }

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }

      [(PXFeedbackAssetUIViewController *)self setAutoLoopFrameworkDiagnosticFileURLs:v7];
      [(PXFeedbackAssetUIViewController *)self continueFiling];
    }
  }
  else
  {
  }
}

BOOL __68__PXFeedbackAssetUIViewController_autoloopVideoTaskStatusDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    NSLog(&cfstr_Error_3.isa, a3, a2);
  }
  return a3 == 0;
}

- (void)_startAutoLoopVideoTaskForDiagnosticsWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F390D0] defaultManager];
  id v6 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v6 setVideoComplementAllowed:1];
  [v6 setVersion:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__PXFeedbackAssetUIViewController__startAutoLoopVideoTaskForDiagnosticsWithAsset___block_invoke;
  v8[3] = &unk_1E5DB8940;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [v5 requestAVAssetForAsset:v7 options:v6 resultHandler:v8];
}

void __82__PXFeedbackAssetUIViewController__startAutoLoopVideoTaskForDiagnosticsWithAsset___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 mainFileURL];
  id v7 = +[PXAutoloopVideoInput inputWithAsset:v4 imageURL:v5];

  id v6 = objc_alloc_init(PXAutoloopVideoProcessTask);
  [(PXAutoloopVideoTask *)v6 setDelegate:*(void *)(a1 + 40)];
  [(PXAutoloopVideoProcessTask *)v6 setShouldExtractGateFeatures:1];
  [(PXAutoloopVideoTask *)v6 runWithInput:v7];
  [*(id *)(a1 + 40) setAutoLoopFrameworkDiagnosticsCurrentTask:v6];
}

- (void)continueFiling
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedbackAssetUIViewController *)self userLikedIt];
  id v4 = @"Negative";
  if (v3) {
    id v4 = @"Positive";
  }
  v29 = v4;
  long long v28 = [NSString stringWithFormat:@"AutoLoop Feedback: %@", v29];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v5 appendString:@"— AutoLoop Truthing Feedback —\n"];
  [v5 appendFormat:@"\nOverall impression: %@\n\n", v29];
  [v5 appendFormat:@"- Positive Feedback -\n"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = [(PXFeedbackAssetUIViewController *)self positiveFeedback];
  id v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v43;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * v10);
        uint64_t v12 = [(PXFeedbackAssetUIViewController *)self positiveFeedback];
        v13 = [v12 valueForKey:v11];
        [v5 appendFormat:@"%@: %@\n", v11, v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v8);
  }

  [v5 appendFormat:@"\n- Negative Feedback -\n"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  v14 = [(PXFeedbackAssetUIViewController *)self negativeFeedback];
  id v15 = [v14 allKeys];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v39;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * v18);
        v20 = [(PXFeedbackAssetUIViewController *)self negativeFeedback];
        id v21 = [v20 valueForKey:v19];
        [v5 appendFormat:@"%@: %@\n", v19, v21];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v16);
  }

  v22 = [MEMORY[0x1E4F390D0] defaultManager];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__90713;
  v36[4] = __Block_byref_object_dispose__90714;
  id v37 = (id)objc_opt_new();
  id v23 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v23 setVersion:2];
  [v23 setLoadingMode:0x10000];
  id v24 = [(PXFeedbackAssetUIViewController *)self asset];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke;
  void v30[3] = &unk_1E5DB8918;
  v35 = v36;
  id v25 = v22;
  id v31 = v25;
  v32 = self;
  id v26 = v28;
  id v33 = v26;
  id v27 = v5;
  id v34 = v27;
  objc_msgSend(v25, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v24, 0, v23, v30, *MEMORY[0x1E4F396D8], *(double *)(MEMORY[0x1E4F396D8] + 8));

  _Block_object_dispose(v36, 8);
}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F396C8]];
  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v4];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v5 setVideoComplementAllowed:1];
  [v5 setVersion:1];
  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) asset];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_2;
  v11[3] = &unk_1E5DB88F0;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v10;
  id v15 = *(id *)(a1 + 56);
  [v6 requestURLForVideo:v7 options:v5 resultHandler:v11];
}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:a2];
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v3 setVideoComplementAllowed:1];
  [v3 setVersion:0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) asset];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_3;
  v8[3] = &unk_1E5DB88C8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  void v8[4] = v6;
  id v9 = v7;
  id v10 = *(id *)(a1 + 56);
  [v4 requestURLForVideo:v5 options:v3 resultHandler:v8];
}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
  }
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v8 = [*(id *)(a1 + 32) autoLoopFrameworkDiagnosticFileURLs];
  [v7 addObjectsFromArray:v8];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_4;
  v13[3] = &unk_1E5DCE660;
  objc_copyWeak(&v14, &location);
  LOBYTE(v12) = 0;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:v9 description:v10 classification:@"Other Bug" componentID:@"832794" componentName:@"Photos - AutoLoops" componentVersion:@"Truthing" keyword:0 attachmentURLs:v11 includeSysDiagnose:v12 completionHandler:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];
  id v5 = objc_loadWeakRetained(v3);
  [v4 feedbackAssetUIViewController:v5 didFinish:a2];
}

- (void)_fileRadarWithAutoLoopAsset:(id)a3 positiveFeedback:(id)a4 negativeFeedback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PXFeedbackAssetUIViewController *)self setAsset:v10];
  [(PXFeedbackAssetUIViewController *)self setPositiveFeedback:v9];

  [(PXFeedbackAssetUIViewController *)self setNegativeFeedback:v8];
  [(PXFeedbackAssetUIViewController *)self setAutoLoopFrameworkDiagnosticFileURLs:0];
  [(PXFeedbackAssetUIViewController *)self setAutoLoopFrameworkDiagnosticsCurrentTask:0];
  id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Collecting data for radar..." message:0 preferredStyle:1];
  [(PXFeedbackAssetUIViewController *)self presentViewController:v11 animated:1 completion:&__block_literal_global_90749];
  [(PXFeedbackAssetUIViewController *)self _startAutoLoopVideoTaskForDiagnosticsWithAsset:v10];
}

- (void)userDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXFeedbackAssetUIViewController *)self delegate];
  [v5 feedbackAssetUIViewController:self didFinish:v3];
}

- (void)userSentPositiveFeedback:(id)a3 negativeFeedback:(id)a4 customFeedback:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PXFeedbackAssetUIViewController *)self asset];
  [(PXFeedbackAssetUIViewController *)self _fileRadarWithAutoLoopAsset:v9 positiveFeedback:v8 negativeFeedback:v7];
}

- (void)userIndicatedDislike
{
  [(PXFeedbackAssetUIViewController *)self setUserLikedIt:0];
  id v3 = [(PXFeedbackAssetUIViewController *)self feedbackController];
  [v3 showMoreFeedbackForm];
}

- (void)userIndicatedLike
{
  [(PXFeedbackAssetUIViewController *)self setUserLikedIt:1];
  id v3 = [(PXFeedbackAssetUIViewController *)self feedbackController];
  [v3 showMoreFeedbackForm];
}

- (id)negativeFeedbackKeys
{
  return +[PXFeedbackEntry negativeFeedbackForAutoLoopKeys];
}

- (id)positiveFeedbackKeys
{
  return +[PXFeedbackEntry positiveFeedbackForAutoLoopKeys];
}

- (BOOL)shouldDisplaySecondaryFeedbackButtons
{
  return 0;
}

- (id)viewTitleForRadar
{
  return @"AutoLoop Feedback";
}

- (id)longTitleText
{
  return PXLocalizedStringFromTable(@"FeedbackLikeItOrNotViewController.longTitle.AutoLoop", @"PXFeedbackCollection");
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PXFeedbackAssetUIViewController;
  [(PXFeedbackAssetUIViewController *)&v13 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
  [(PXFeedbackAssetUIViewController *)self setNavigationController:v3];

  id v4 = [(PXFeedbackAssetUIViewController *)self navigationController];
  [(PXFeedbackAssetUIViewController *)self addChildViewController:v4];

  id v5 = [(PXFeedbackAssetUIViewController *)self view];
  id v6 = [(PXFeedbackAssetUIViewController *)self navigationController];
  id v7 = [v6 view];
  [v5 addSubview:v7];

  id v8 = [(PXFeedbackAssetUIViewController *)self navigationController];
  [v8 didMoveToParentViewController:self];

  id v9 = [(PXFeedbackAssetUIViewController *)self navigationController];
  [v9 setToolbarHidden:0];

  id v10 = [[PXFeedbackLikeItOrNotComboUIViewController alloc] initWithDelegate:self];
  [(PXFeedbackAssetUIViewController *)self setFeedbackController:v10];

  id v11 = [(PXFeedbackAssetUIViewController *)self navigationController];
  uint64_t v12 = [(PXFeedbackAssetUIViewController *)self feedbackController];
  [v11 pushViewController:v12 animated:1];
}

- (PXFeedbackAssetUIViewController)initWithAsset:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedbackAssetUIViewController;
  id v9 = [(PXFeedbackAssetUIViewController *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

@end