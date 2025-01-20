@interface PXInlineVideoStabilizationDiagnosticsViewController
- (BOOL)useVariantVideoByDefaultInToggle;
- (PXInlineVideoStabilizationDiagnosticsViewController)initWithInputAsset:(id)a3;
- (id)_newStabilizeOperation;
- (id)extraAlertAction;
- (id)inputVideoButtonsTitle;
- (id)radarComponentID;
- (id)radarComponentName;
- (id)radarComponentVersion;
- (id)radarTitle;
- (id)settings;
- (id)variantVideoButtonsTitle;
- (id)variantVideoDescription;
- (void)_exportRecipe;
- (void)_handleStabilizeOperationCompletedWithCompletionHandler:(id)a3;
- (void)invalidateInputAndVariantReferences;
- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4;
- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXInlineVideoStabilizationDiagnosticsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_exportOperation, 0);
  objc_storeStrong((id *)&self->_stabilizeOperation, 0);
}

- (id)_newStabilizeOperation
{
  v3 = [(PXVideoComparisonViewController *)self inputAsset];
  v4 = [(PXVideoComparisonViewController *)self inputVideoURL];
  if (v4)
  {
    long long v39 = 0uLL;
    uint64_t v40 = 0;
    v5 = [v3 photoIrisProperties];
    v6 = v5;
    if (v5)
    {
      [v5 photoIrisStillDisplayTime];
    }
    else
    {
      long long v39 = 0uLL;
      uint64_t v40 = 0;
    }

    v8 = (CMTime *)MEMORY[0x1E4F1FA48];
    if ((BYTE12(v39) & 0x1D) != 1)
    {
      long long v39 = *MEMORY[0x1E4F1FA48];
      uint64_t v40 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    }
    v9 = +[PXInlineVideoStabilizationSettings sharedInstance];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v36 = *MEMORY[0x1E4F1FA20];
    long long v37 = v10;
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    if ([v9 timeRangeEnabled])
    {
      memset(v35, 0, sizeof(v35));
      long long v34 = 0u;
      v11 = [v3 mediaAnalysisProperties];
      v12 = v11;
      if (v11)
      {
        [v11 bestVideoTimeRange];
      }
      else
      {
        memset(v35, 0, sizeof(v35));
        long long v34 = 0u;
      }

      if ((BYTE12(v34) & 1) != 0
        && (BYTE4(v35[1]) & 1) != 0
        && !*((void *)&v35[1] + 1)
        && (*((void *)&v35[0] + 1) & 0x8000000000000000) == 0)
      {
        CMTime time1 = *(CMTime *)((char *)v35 + 8);
        CMTime time2 = *v8;
        if (CMTimeCompare(&time1, &time2))
        {
          long long v36 = v34;
          long long v37 = v35[0];
          long long v38 = v35[1];
        }
      }
    }
    long long v34 = 0uLL;
    *(void *)&v35[0] = 0;
    if ([v9 crossfadeEnabled])
    {
      CMTimeMakeWithSeconds((CMTime *)&v34, 0.25, 600);
    }
    else
    {
      long long v34 = *(_OWORD *)&v8->value;
      *(void *)&v35[0] = v8->epoch;
    }
    if ([v9 useMediaAnalysisRecipe])
    {
      v13 = (void *)MEMORY[0x1E4F8CC38];
      uint64_t v14 = *MEMORY[0x1E4F15C18];
      id v15 = objc_alloc(MEMORY[0x1E4F166C8]);
      v16 = (void *)[v15 initWithURL:v4 options:MEMORY[0x1E4F1CC08]];
      v17 = [v13 tracksWithMediaType:v14 forAsset:v16];
      v18 = [v17 firstObject];
      [v18 naturalSize];
      double v20 = v19;
      double v22 = v21;

      v23 = -[PXMediaAnalysisVideoStabilizationRecipeSource initWithAsset:videoDimensions:]([PXMediaAnalysisVideoStabilizationRecipeSource alloc], "initWithAsset:videoDimensions:", v3, v20, v22);
    }
    else
    {
      v23 = [[PXURLVideoStabilizationRecipeSource alloc] initWithVideoURL:v4];
    }
    v24 = v23;
    [(PXVideoStabilizationRecipeSource *)v23 setAllowsOnDemandPixelAnalysis:1];
    -[PXVideoStabilizationRecipeSource setAllowedAnalysisTypes:](v24, "setAllowedAnalysisTypes:", [v9 allowedAnalysisTypes]);
    v25 = objc_alloc_init(PXVideoStabilizeOperationSpec);
    [(PXVideoProcessingOperationSpec *)v25 setInputVideoURL:v4];
    long long v30 = v39;
    uint64_t v31 = v40;
    [(PXVideoStabilizeOperationSpec *)v25 setStartTime:&v30];
    v29[0] = v36;
    v29[1] = v37;
    v29[2] = v38;
    [(PXVideoStabilizeOperationSpec *)v25 setTimeRange:v29];
    long long v27 = v34;
    uint64_t v28 = *(void *)&v35[0];
    [(PXVideoStabilizeOperationSpec *)v25 setCrossfadeDuration:&v27];
    [(PXVideoStabilizeOperationSpec *)v25 setRecipeSource:v24];
    v7 = [[PXVideoStabilizeOperation alloc] initWithSpec:v25];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_handleStabilizeOperationCompletedWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  stabilizeOperation = self->_stabilizeOperation;
  v5 = (void (**)(id, void *, void *))a3;
  v6 = [(PXVideoProcessingOperation *)stabilizeOperation result];
  v7 = [v6 outputVideoAsset];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithAsset:v7];
    v9 = [v6 outputVideoComposition];
    [v8 setVideoComposition:v9];

    long long v10 = [v6 outputAudioMix];
    [v8 setAudioMix:v10];

    v11 = [v8 asset];
    v12 = v11;
    if (v11) {
      [v11 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&v17, &start, &duration);
    CMTimeRange v15 = v17;
    [v8 setLoopTimeRange:&v15];

    v13 = 0;
  }
  else
  {
    v13 = [v6 error];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(start.value) = 138412290;
      *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v13;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "FAILED to stabilized video for diagnostics: %@", (uint8_t *)&start, 0xCu);
    }
    v8 = 0;
  }
  result = self->_result;
  self->_result = (PXVideoStabilizeResult *)v6;

  v5[2](v5, v8, v13);
}

- (void)_exportRecipe
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXVideoStabilizeResult *)self->_result dictionaryRepresentation];
  v4 = [(PXVideoComparisonViewController *)self inputVideoURL];
  v5 = [v4 lastPathComponent];
  v6 = [v5 stringByDeletingPathExtension];

  if (v3) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    long long v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Error" message:@"Unable to retrieve recipe or input video URL" preferredStyle:1];
    v8 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v10 addAction:v8];

    [(PXInlineVideoStabilizationDiagnosticsViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v10 = [v9 temporaryDirectory];

    v11 = [v6 stringByAppendingString:@"_info"];
    v12 = [v10 URLByAppendingPathComponent:v11];
    v13 = [v12 URLByAppendingPathExtension:@"plist"];

    [v3 writeToURL:v13 error:0];
    id v14 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v17[0] = v13;
    CMTimeRange v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v16 = (void *)[v14 initWithActivityItems:v15 applicationActivities:0];

    [(PXInlineVideoStabilizationDiagnosticsViewController *)self presentViewController:v16 animated:1 completion:0];
  }
}

- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXInlineVideoStabilizationDiagnosticsViewController *)self _newStabilizeOperation];
  exportOperation = self->_exportOperation;
  self->_exportOperation = v8;

  long long v10 = [(PXVideoComparisonViewController *)self inputVideoURL];
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v12 = [v11 temporaryDirectory];

  long long v27 = v10;
  v13 = [v10 lastPathComponent];
  id v14 = [v13 stringByDeletingPathExtension];

  uint64_t v15 = [v14 stringByAppendingString:@"_render"];
  v16 = [v14 stringByAppendingString:@"_info"];
  v26 = (void *)v15;
  CMTimeRange v17 = [v12 URLByAppendingPathComponent:v15];
  v18 = [v17 URLByAppendingPathExtension:@"mov"];

  uint64_t v19 = [v12 URLByAppendingPathComponent:v16];
  double v20 = [v19 URLByAppendingPathExtension:@"plist"];

  double v21 = [(PXVideoProcessingOperation *)self->_exportOperation spec];
  [v21 setOutputURL:v18];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke;
  v34[3] = &unk_1E5DB1208;
  id v22 = v6;
  id v35 = v22;
  [(PXVideoProcessingOperation *)self->_exportOperation setProgressHandler:v34];
  objc_initWeak(&location, self->_exportOperation);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_3;
  v28[3] = &unk_1E5DD2078;
  objc_copyWeak(&v32, &location);
  id v23 = v20;
  id v29 = v23;
  id v24 = v7;
  id v31 = v24;
  id v25 = v18;
  id v30 = v25;
  [(PXVideoStabilizeOperation *)self->_exportOperation setCompletionBlock:v28];
  [(NSOperationQueue *)self->_operationQueue addOperation:self->_exportOperation];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 32);
  id v4 = v3;
  px_dispatch_on_main_queue();
}

void __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = [WeakRetained result];

  id v4 = [v3 error];
  if (!v4)
  {
    v5 = [v3 dictionaryRepresentation];
    id v6 = a1[4];
    id v8 = 0;
    [v5 writeToURL:v6 error:&v8];
    id v4 = v8;
  }
  a1[6];
  a1[5];
  a1[4];
  id v7 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(float *)(a1 + 48));
}

- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXInlineVideoStabilizationDiagnosticsViewController *)self _newStabilizeOperation];
  stabilizeOperation = self->_stabilizeOperation;
  self->_stabilizeOperation = v8;

  long long v10 = self->_stabilizeOperation;
  if (v10)
  {
    v11 = [(PXVideoProcessingOperation *)v10 spec];
    [v11 setPerformStabilization:1];

    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke;
    v17[3] = &unk_1E5DD1848;
    objc_copyWeak(&v19, &location);
    id v18 = v7;
    [(PXVideoStabilizeOperation *)self->_stabilizeOperation setCompletionBlock:v17];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_3;
    uint64_t v15 = &unk_1E5DB1208;
    id v16 = v6;
    [(PXVideoProcessingOperation *)self->_stabilizeOperation setProgressHandler:&v12];
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_stabilizeOperation, v12, v13, v14, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 40));
  *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
}

void __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 32);
  id v4 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(float *)(a1 + 48));
}

void __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleStabilizeOperationCompletedWithCompletionHandler:*(void *)(a1 + 32)];
}

- (void)invalidateInputAndVariantReferences
{
  v4.receiver = self;
  v4.super_class = (Class)PXInlineVideoStabilizationDiagnosticsViewController;
  [(PXVideoComparisonViewController *)&v4 invalidateInputAndVariantReferences];
  result = self->_result;
  self->_result = 0;
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
  return @"[Stabilization] Feedback: ";
}

- (id)extraAlertAction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PXInlineVideoStabilizationDiagnosticsViewController_extraAlertAction__block_invoke;
  v4[3] = &unk_1E5DD0030;
  v4[4] = self;
  id v2 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Export Analysis Result" style:0 handler:v4];
  return v2;
}

uint64_t __71__PXInlineVideoStabilizationDiagnosticsViewController_extraAlertAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exportRecipe];
}

- (id)variantVideoDescription
{
  id v2 = [(PXVideoStabilizeResult *)self->_result dictionaryRepresentation];
  id v3 = [v2 description];

  return v3;
}

- (id)variantVideoButtonsTitle
{
  return @"Stabilized";
}

- (id)inputVideoButtonsTitle
{
  return @"Original";
}

- (BOOL)useVariantVideoByDefaultInToggle
{
  return 1;
}

- (id)settings
{
  return +[PXInlineVideoStabilizationSettings sharedInstance];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PXInlineVideoStabilizationDiagnosticsViewController;
  [(PXVideoComparisonViewController *)&v3 viewDidLoad];
  [(PXInlineVideoStabilizationDiagnosticsViewController *)self setTitle:@"Inline Stabilization"];
}

- (PXInlineVideoStabilizationDiagnosticsViewController)initWithInputAsset:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXInlineVideoStabilizationDiagnosticsViewController;
  objc_super v3 = [(PXVideoComparisonViewController *)&v7 initWithInputAsset:a3];
  if (v3)
  {
    objc_super v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v4;
  }
  return v3;
}

@end