@interface PXVideoComparisonViewController
- (AVPlayerItem)inputPlayerItem;
- (AVPlayerItem)variantPlayerItem;
- (BOOL)useVariantVideoByDefaultInToggle;
- (NSError)inputVideoError;
- (NSError)variantVideoError;
- (NSString)inputVideoButtonsTitle;
- (NSString)inputVideoDescription;
- (NSString)radarClassification;
- (NSString)radarComponentID;
- (NSString)radarComponentName;
- (NSString)radarComponentVersion;
- (NSString)radarTitle;
- (NSString)variantVideoButtonsTitle;
- (NSString)variantVideoDescription;
- (NSURL)inputVideoURL;
- (PHAsset)inputAsset;
- (PXSettings)settings;
- (PXVideoComparisonViewController)initWithCoder:(id)a3;
- (PXVideoComparisonViewController)initWithInputAsset:(id)a3;
- (PXVideoComparisonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIAlertAction)extraAlertAction;
- (int)videoRequestID;
- (int64_t)modalPresentationStyle;
- (void)_exportInputVideo;
- (void)_exportVariantVideo;
- (void)_exportVariantVideoWithCompletionHandler:(id)a3;
- (void)_fileRadar;
- (void)_handleActionButton:(id)a3;
- (void)_handleResultButton:(id)a3;
- (void)_handleSettingsButton:(id)a3;
- (void)_handleSettingsDone:(id)a3;
- (void)_hideProgressAndStatus;
- (void)_prepareInputAndVariantVideos;
- (void)_prepareVariantVideo;
- (void)_reloadInputAndVariantVideos;
- (void)_showAlertWithMessage:(id)a3;
- (void)_showProgressAndStatus;
- (void)_updateDisplayedPlayerItem;
- (void)_updatePlayerItem:(id)a3 error:(id)a4;
- (void)_updateProgress:(float)a3 status:(id)a4;
- (void)invalidateInputAndVariantReferences;
- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4;
- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4;
- (void)setInputPlayerItem:(id)a3;
- (void)setInputVideoError:(id)a3;
- (void)setInputVideoURL:(id)a3;
- (void)setVariantPlayerItem:(id)a3;
- (void)setVariantVideoError:(id)a3;
- (void)setVideoRequestID:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PXVideoComparisonViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantVideoError, 0);
  objc_storeStrong((id *)&self->_variantPlayerItem, 0);
  objc_storeStrong((id *)&self->_inputVideoError, 0);
  objc_storeStrong((id *)&self->_inputPlayerItem, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarComponentID, 0);
  objc_storeStrong((id *)&self->_radarClassification, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_extraAlertAction, 0);
  objc_storeStrong((id *)&self->_inputVideoURL, 0);
  objc_storeStrong((id *)&self->_inputAsset, 0);
  objc_storeStrong((id *)&self->_statusBackgroundView, 0);
  objc_storeStrong((id *)&self->_variantSegmentedControl, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

- (void)setVariantVideoError:(id)a3
{
}

- (NSError)variantVideoError
{
  return self->_variantVideoError;
}

- (void)setVariantPlayerItem:(id)a3
{
}

- (AVPlayerItem)variantPlayerItem
{
  return self->_variantPlayerItem;
}

- (void)setVideoRequestID:(int)a3
{
  self->_videoRequestID = a3;
}

- (int)videoRequestID
{
  return self->_videoRequestID;
}

- (void)setInputVideoError:(id)a3
{
}

- (NSError)inputVideoError
{
  return self->_inputVideoError;
}

- (void)setInputPlayerItem:(id)a3
{
}

- (AVPlayerItem)inputPlayerItem
{
  return self->_inputPlayerItem;
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (NSString)radarComponentID
{
  return self->_radarComponentID;
}

- (NSString)radarClassification
{
  return self->_radarClassification;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (PXSettings)settings
{
  return self->_settings;
}

- (UIAlertAction)extraAlertAction
{
  return self->_extraAlertAction;
}

- (BOOL)useVariantVideoByDefaultInToggle
{
  return self->_useVariantVideoByDefaultInToggle;
}

- (void)setInputVideoURL:(id)a3
{
}

- (NSURL)inputVideoURL
{
  return self->_inputVideoURL;
}

- (PHAsset)inputAsset
{
  return self->_inputAsset;
}

- (void)invalidateInputAndVariantReferences
{
  [(PXVideoComparisonViewController *)self setInputVideoURL:0];
  [(PXVideoComparisonViewController *)self setInputPlayerItem:0];
  [(PXVideoComparisonViewController *)self setInputVideoError:0];
  [(PXVideoComparisonViewController *)self setVariantPlayerItem:0];
  [(PXVideoComparisonViewController *)self setVariantVideoError:0];
  v3 = [MEMORY[0x1E4F390D0] defaultManager];
  objc_msgSend(v3, "cancelImageRequest:", -[PXVideoComparisonViewController videoRequestID](self, "videoRequestID"));

  [(PXVideoComparisonViewController *)self setVideoRequestID:0];
}

- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXVideoComparisonViewController.m", 408, @"Method %s is a responsibility of subclass %@", "-[PXVideoComparisonViewController prepareVariantVideoForExportWithProgress:completion:]", v11 object file lineNumber description];

  abort();
}

- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXVideoComparisonViewController.m", 404, @"Method %s is a responsibility of subclass %@", "-[PXVideoComparisonViewController prepareVariantVideoWithProgress:completion:]", v11 object file lineNumber description];

  abort();
}

- (NSString)variantVideoButtonsTitle
{
  return (NSString *)@"B";
}

- (NSString)inputVideoButtonsTitle
{
  return (NSString *)@"A";
}

- (NSString)variantVideoDescription
{
  return 0;
}

- (NSString)inputVideoDescription
{
  v2 = [(PXVideoComparisonViewController *)self inputAsset];
  v3 = [v2 debugDescription];

  return (NSString *)v3;
}

- (void)_updatePlayerItem:(id)a3 error:(id)a4
{
  id v11 = a4;
  [(ISWrappedAVPlayer *)self->_videoPlayer replaceCurrentItemWithPlayerItem:a3];
  LODWORD(v6) = 1.0;
  [(ISWrappedAVPlayer *)self->_videoPlayer setRate:v6];
  id v7 = v11;
  if (v11)
  {
    uint64_t v8 = [v11 description];
    v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = @"Unable to display video – no error passed";
    }
    [(PXVideoComparisonViewController *)self _showAlertWithMessage:v10];

    id v7 = v11;
  }
}

- (void)_updateDisplayedPlayerItem
{
  if ([(UISegmentedControl *)self->_variantSegmentedControl selectedSegmentIndex])
  {
    id v4 = [(PXVideoComparisonViewController *)self variantPlayerItem];
    [(PXVideoComparisonViewController *)self variantVideoError];
  }
  else
  {
    id v4 = [(PXVideoComparisonViewController *)self inputPlayerItem];
    [(PXVideoComparisonViewController *)self inputVideoError];
  v3 = };
  [(PXVideoComparisonViewController *)self _updatePlayerItem:v4 error:v3];
}

- (void)_prepareVariantVideo
{
  v3 = NSString;
  id v4 = [(PXVideoComparisonViewController *)self variantVideoButtonsTitle];
  v5 = [v3 stringWithFormat:@"Loading %@ Video", v4];

  LODWORD(v6) = 0.5;
  [(PXVideoComparisonViewController *)self _updateProgress:v5 status:v6];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke;
  v9[3] = &unk_1E5DC2698;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke_2;
  v7[3] = &unk_1E5DC2710;
  objc_copyWeak(&v8, &location);
  [(PXVideoComparisonViewController *)self prepareVariantVideoWithProgress:v9 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke(uint64_t a1, void *a2, float a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  *(float *)&double v6 = a3;
  [WeakRetained _updateProgress:v5 status:v6];
}

void __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setVariantPlayerItem:v6];

  id v8 = objc_loadWeakRetained(v4);
  [v8 setVariantVideoError:v5];

  id v9 = objc_loadWeakRetained(v4);
  [v9 _hideProgressAndStatus];

  id v10 = objc_loadWeakRetained(v4);
  [v10 _updateDisplayedPlayerItem];
}

- (void)_prepareInputAndVariantVideos
{
  v3 = NSString;
  id v4 = [(PXVideoComparisonViewController *)self inputVideoButtonsTitle];
  id v5 = [v3 stringWithFormat:@"Loading %@ Video", v4];

  LODWORD(v6) = 1036831949;
  [(PXVideoComparisonViewController *)self _updateProgress:v5 status:v6];
  id v7 = [MEMORY[0x1E4F390D0] defaultManager];
  objc_msgSend(v7, "cancelImageRequest:", -[PXVideoComparisonViewController videoRequestID](self, "videoRequestID"));

  id v8 = [(PXVideoComparisonViewController *)self inputAsset];
  [v8 fetchPropertySetsIfNeeded];
  id v9 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v9 setNetworkAccessAllowed:1];
  [v9 setVideoComplementAllowed:1];
  [v9 setStreamingAllowed:0];
  objc_initWeak(&location, self);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  id v10 = [MEMORY[0x1E4F390D0] defaultManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PXVideoComparisonViewController__prepareInputAndVariantVideos__block_invoke;
  v12[3] = &unk_1E5DC26E8;
  v12[4] = &v14;
  objc_copyWeak(&v13, &location);
  uint64_t v11 = [v10 requestURLForVideo:v8 options:v9 resultHandler:v12];

  *((_DWORD *)v15 + 6) = v11;
  [(PXVideoComparisonViewController *)self setVideoRequestID:v11];
  _Block_object_dispose(&v14, 8);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __64__PXVideoComparisonViewController__prepareInputAndVariantVideos__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5;
  px_dispatch_on_main_queue();
}

void __64__PXVideoComparisonViewController__prepareInputAndVariantVideos__block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = [WeakRetained videoRequestID];

  if (v2 == v5)
  {
    if (*(void *)(a1 + 32))
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithURL:*(void *)(a1 + 32)];
      id v7 = [v6 asset];
      id v8 = v7;
      if (v7) {
        [v7 duration];
      }
      else {
        memset(&duration, 0, sizeof(duration));
      }
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTimeRangeMake(&v18, &start, &duration);
      CMTimeRange v15 = v18;
      [v6 setLoopTimeRange:&v15];

      id v9 = 0;
    }
    else
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to URL for Input Video");
      id v6 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = objc_loadWeakRetained(v3);
    [v11 setInputVideoURL:v10];

    id v12 = objc_loadWeakRetained(v3);
    [v12 setInputPlayerItem:v6];

    id v13 = objc_loadWeakRetained(v3);
    [v13 setInputVideoError:v9];

    id v14 = objc_loadWeakRetained(v3);
    [v14 _prepareVariantVideo];
  }
}

- (void)_reloadInputAndVariantVideos
{
  [(PXVideoComparisonViewController *)self _showProgressAndStatus];
  [(PXVideoComparisonViewController *)self invalidateInputAndVariantReferences];
  [(PXVideoComparisonViewController *)self _prepareInputAndVariantVideos];
}

- (void)_updateProgress:(float)a3 status:(id)a4
{
  progressView = self->_progressView;
  id v8 = a4;
  *(float *)&double v7 = a3;
  [(UIProgressView *)progressView setProgress:v7];
  [(UILabel *)self->_statusLabel setText:v8];
}

- (void)_showProgressAndStatus
{
  [(UIProgressView *)self->_progressView setProgress:0.0];
  [(UILabel *)self->_statusLabel setText:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PXVideoComparisonViewController__showProgressAndStatus__block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.1];
}

uint64_t __57__PXVideoComparisonViewController__showProgressAndStatus__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:1.0];
  int v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  return [v2 setAlpha:1.0];
}

- (void)_hideProgressAndStatus
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__PXVideoComparisonViewController__hideProgressAndStatus__block_invoke;
  v2[3] = &unk_1E5DD36F8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.1];
}

uint64_t __57__PXVideoComparisonViewController__hideProgressAndStatus__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:0.0];
  int v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  return [v2 setAlpha:0.0];
}

- (void)_exportVariantVideoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = NSString;
  id v6 = [(PXVideoComparisonViewController *)self variantVideoButtonsTitle];
  double v7 = [v5 stringWithFormat:@"Preparing %@ Video for Export", v6];

  [(PXVideoComparisonViewController *)self _updateProgress:v7 status:0.0];
  [(PXVideoComparisonViewController *)self _showProgressAndStatus];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5DC2698;
  objc_copyWeak(&v13, &location);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5DC26C0;
  id v8 = v4;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [(PXVideoComparisonViewController *)self prepareVariantVideoForExportWithProgress:v12 completion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  *(float *)&double v6 = a3;
  [WeakRetained _updateProgress:v5 status:v6];
}

void __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _hideProgressAndStatus];
}

- (void)_exportVariantVideo
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PXVideoComparisonViewController__exportVariantVideo__block_invoke;
  v3[3] = &unk_1E5DC2670;
  objc_copyWeak(&v4, &location);
  [(PXVideoComparisonViewController *)self _exportVariantVideoWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__PXVideoComparisonViewController__exportVariantVideo__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = v6;
  if (!a2 || v6)
  {
    id v14 = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v16 = NSString;
    uint64_t v17 = [v7 description];
    CMTimeRange v18 = (void *)v17;
    v19 = @"<empty>";
    if (v17) {
      v19 = (__CFString *)v17;
    }
    v20 = [v16 stringWithFormat:@"Export failed with error: %@", v19];

    [WeakRetained _showAlertWithMessage:v20];
  }
  else
  {
    id v8 = (objc_class *)MEMORY[0x1E4F9F2E8];
    id v9 = a2;
    id v10 = [v8 alloc];
    v21[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    id v12 = (void *)[v10 initWithActivityItems:v11 applicationActivities:0];
    id v13 = objc_loadWeakRetained((id *)(a1 + 32));
    [v13 presentViewController:v12 animated:1 completion:0];
  }
}

- (void)_exportInputVideo
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_inputVideoURL)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v6[0] = self->_inputVideoURL;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    id v5 = (void *)[v3 initWithActivityItems:v4 applicationActivities:0];

    [(PXVideoComparisonViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_fileRadar
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PXVideoComparisonViewController__fileRadar__block_invoke;
  v2[3] = &unk_1E5DC2648;
  v2[4] = self;
  [(PXVideoComparisonViewController *)self _exportVariantVideoWithCompletionHandler:v2];
}

void __45__PXVideoComparisonViewController__fileRadar__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [v7 path];
  int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    id v13 = objc_alloc_init(PXFeedbackTapToRadarViewController);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__PXVideoComparisonViewController__fileRadar__block_invoke_2;
    v20[3] = &unk_1E5DC2620;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v7;
    id v22 = v8;
    [(PXFeedbackTapToRadarViewController *)v13 setFileRadarHandler:v20];
    [*(id *)(a1 + 32) presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    CMTimeRange v15 = NSString;
    uint64_t v16 = [v9 description];
    uint64_t v17 = (void *)v16;
    CMTimeRange v18 = @"<empty>";
    if (v16) {
      CMTimeRange v18 = (__CFString *)v16;
    }
    v19 = [v15 stringWithFormat:@"Export failed with error: %@", v18];
    [v14 _showAlertWithMessage:v19];
  }
}

void __45__PXVideoComparisonViewController__fileRadar__block_invoke_2(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    v28[0] = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = [*(id *)(a1 + 32) radarTitle];
  uint64_t v9 = [*(id *)(a1 + 32) radarClassification];
  id v10 = (void *)v9;
  id v11 = @"Other Bug";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  int v12 = v11;

  uint64_t v13 = [*(id *)(a1 + 32) radarComponentID];
  id v14 = (void *)v13;
  CMTimeRange v15 = @"937049";
  if (v13) {
    CMTimeRange v15 = (__CFString *)v13;
  }
  uint64_t v16 = v15;

  uint64_t v17 = [*(id *)(a1 + 32) radarComponentName];
  CMTimeRange v18 = (void *)v17;
  v19 = @"Photos UI Library";
  if (v17) {
    v19 = (__CFString *)v17;
  }
  v20 = v19;

  uint64_t v21 = [*(id *)(a1 + 32) radarComponentVersion];
  id v22 = (void *)v21;
  v23 = @"iOS";
  if (v21) {
    v23 = (__CFString *)v21;
  }
  v24 = v23;

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26 = v25;
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v25, "addObject:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v26, "addObject:");
  }
  if (*(void *)(*(void *)(a1 + 32) + 1040)) {
    objc_msgSend(v26, "addObject:");
  }
  LOWORD(v27) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v8, &stru_1F00B0030, v12, v16, v20, v24, 0, 0, v26, v27, v7, 0);
}

- (void)_showAlertWithMessage:(id)a3
{
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Error" message:a3 preferredStyle:1];
  id v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v5 addAction:v4];

  [(PXVideoComparisonViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_handleResultButton:(id)a3
{
  if ([(UISegmentedControl *)self->_variantSegmentedControl selectedSegmentIndex]) {
    [(PXVideoComparisonViewController *)self variantVideoDescription];
  }
  else {
  id v4 = [(PXVideoComparisonViewController *)self inputVideoDescription];
  }
  id v5 = (void *)MEMORY[0x1E4FB1EC0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PXVideoComparisonViewController__handleResultButton___block_invoke;
  v8[3] = &unk_1E5DC5600;
  id v9 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "px_viewControllerWithOutput:", v8);
  [(PXVideoComparisonViewController *)self presentViewController:v7 animated:1 completion:0];
}

__CFString *__55__PXVideoComparisonViewController__handleResultButton___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return (__CFString *)*(id *)(a1 + 32);
  }
  else {
    return &stru_1F00B0030;
  }
}

- (void)_handleActionButton:(id)a3
{
  id v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__PXVideoComparisonViewController__handleActionButton___block_invoke;
  v18[3] = &unk_1E5DD0030;
  v18[4] = self;
  id v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"File Radar" style:0 handler:v18];
  [v4 addAction:v5];

  id v6 = NSString;
  id v7 = [(PXVideoComparisonViewController *)self inputVideoButtonsTitle];
  id v8 = [v6 stringWithFormat:@"Export %@ Video", v7];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__PXVideoComparisonViewController__handleActionButton___block_invoke_2;
  v17[3] = &unk_1E5DD0030;
  v17[4] = self;
  id v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:0 handler:v17];
  [v4 addAction:v9];

  id v10 = NSString;
  id v11 = [(PXVideoComparisonViewController *)self variantVideoButtonsTitle];
  int v12 = [v10 stringWithFormat:@"Export %@ Video", v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PXVideoComparisonViewController__handleActionButton___block_invoke_3;
  v16[3] = &unk_1E5DD0030;
  v16[4] = self;
  uint64_t v13 = [MEMORY[0x1E4FB1410] actionWithTitle:v12 style:0 handler:v16];
  [v4 addAction:v13];

  id v14 = [(PXVideoComparisonViewController *)self extraAlertAction];
  if (v14) {
    [v4 addAction:v14];
  }
  CMTimeRange v15 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v4 addAction:v15];

  [(PXVideoComparisonViewController *)self presentViewController:v4 animated:1 completion:0];
}

uint64_t __55__PXVideoComparisonViewController__handleActionButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadar];
}

uint64_t __55__PXVideoComparisonViewController__handleActionButton___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exportInputVideo];
}

uint64_t __55__PXVideoComparisonViewController__handleActionButton___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exportVariantVideo];
}

- (void)_handleSettingsDone:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PXVideoComparisonViewController__handleSettingsDone___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  void v3[4] = self;
  [(PXVideoComparisonViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __55__PXVideoComparisonViewController__handleSettingsDone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadInputAndVariantVideos];
}

- (void)_handleSettingsButton:(id)a3
{
  id v7 = [(PXVideoComparisonViewController *)self settings];
  if (v7)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F94208]) initWithRootSettings:v7];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleSettingsDone_];
    [v4 setDismissButton:v5];

    id v6 = [v4 presentationController];
    [v6 setDelegate:self];

    [(PXVideoComparisonViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXVideoComparisonViewController;
  [(PXVideoComparisonViewController *)&v4 viewDidAppear:a3];
  [(PXVideoComparisonViewController *)self _reloadInputAndVariantVideos];
}

- (void)viewDidLoad
{
  v71[3] = *MEMORY[0x1E4F143B8];
  v68.receiver = self;
  v68.super_class = (Class)PXVideoComparisonViewController;
  [(PXVideoComparisonViewController *)&v68 viewDidLoad];
  id v3 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E4F8EBD0]);
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = v3;

  id v5 = [(PXVideoComparisonViewController *)self view];
  id v6 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setBackgroundColor:v6];

  id v7 = objc_alloc_init(PXVideoPlayerView);
  videoView = self->_videoView;
  self->_videoView = v7;

  [v5 bounds];
  -[PXVideoPlayerView setFrame:](self->_videoView, "setFrame:");
  [(PXVideoPlayerView *)self->_videoView setAutoresizingMask:18];
  [(PXVideoPlayerView *)self->_videoView setVideoViewContentMode:1];
  [(PXVideoPlayerView *)self->_videoView setPlayer:self->_videoPlayer];
  id v9 = self->_videoPlayer;
  id v10 = [MEMORY[0x1E4F8EBC8] sharedAmbientInstance];
  [(ISWrappedAVPlayer *)v9 setWrappedAudioSession:v10];

  [v5 addSubview:self->_videoView];
  id v11 = (UIProgressView *)[objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
  progressView = self->_progressView;
  self->_progressView = v11;

  [v5 addSubview:self->_progressView];
  [(UIProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v13 = [(UIProgressView *)self->_progressView topAnchor];
  id v14 = [v5 safeAreaLayoutGuide];
  CMTimeRange v15 = [v14 topAnchor];
  uint64_t v16 = [v13 constraintEqualToAnchor:v15];

  uint64_t v17 = [(UIProgressView *)self->_progressView leftAnchor];
  CMTimeRange v18 = [v5 safeAreaLayoutGuide];
  v19 = [v18 leftAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];

  uint64_t v21 = [(UIProgressView *)self->_progressView rightAnchor];
  id v22 = [v5 safeAreaLayoutGuide];
  v23 = [v22 rightAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];

  id v25 = (void *)MEMORY[0x1E4F28DC8];
  v71[0] = v16;
  v71[1] = v20;
  v71[2] = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
  [v25 activateConstraints:v26];

  v67 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
  uint64_t v27 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v67];
  statusBackgroundView = self->_statusBackgroundView;
  self->_statusBackgroundView = v27;

  [(UIVisualEffectView *)self->_statusBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:self->_statusBackgroundView];
  v29 = [(UIVisualEffectView *)self->_statusBackgroundView topAnchor];
  v30 = [(UIProgressView *)self->_progressView bottomAnchor];
  uint64_t v31 = [v29 constraintEqualToAnchor:v30 constant:10.0];

  v32 = [(UIVisualEffectView *)self->_statusBackgroundView leftAnchor];
  v33 = [v5 safeAreaLayoutGuide];
  v34 = [v33 leftAnchor];
  uint64_t v35 = [v32 constraintEqualToAnchor:v34 constant:50.0];

  v36 = [(UIVisualEffectView *)self->_statusBackgroundView rightAnchor];
  v37 = [v5 safeAreaLayoutGuide];
  v38 = [v37 rightAnchor];
  v39 = [v36 constraintEqualToAnchor:v38 constant:-50.0];

  v40 = [(UIVisualEffectView *)self->_statusBackgroundView heightAnchor];
  v41 = [v40 constraintEqualToConstant:40.0];

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v65 = (void *)v35;
  v66 = (void *)v31;
  v70[0] = v31;
  v70[1] = v35;
  v70[2] = v39;
  v70[3] = v41;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
  [v42 activateConstraints:v43];

  [(UIVisualEffectView *)self->_statusBackgroundView setAlpha:0.0];
  v44 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v44;

  v46 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)self->_statusLabel setTextColor:v46];

  [(UILabel *)self->_statusLabel setTextAlignment:1];
  [(UILabel *)self->_statusLabel setAutoresizingMask:18];
  [(UIVisualEffectView *)self->_statusBackgroundView bounds];
  -[UILabel setFrame:](self->_statusLabel, "setFrame:");
  v47 = [(UIVisualEffectView *)self->_statusBackgroundView contentView];
  [v47 addSubview:self->_statusLabel];

  v48 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__handleActionButton_];
  id v49 = objc_alloc(MEMORY[0x1E4FB1C10]);
  v50 = [(PXVideoComparisonViewController *)self inputVideoButtonsTitle];
  v69[0] = v50;
  v51 = [(PXVideoComparisonViewController *)self variantVideoButtonsTitle];
  v69[1] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  v53 = (UISegmentedControl *)[v49 initWithItems:v52];
  variantSegmentedControl = self->_variantSegmentedControl;
  self->_variantSegmentedControl = v53;

  [(UISegmentedControl *)self->_variantSegmentedControl setSelectedSegmentIndex:[(PXVideoComparisonViewController *)self useVariantVideoByDefaultInToggle]];
  [(UISegmentedControl *)self->_variantSegmentedControl addTarget:self action:sel__handleVariantSegmentedControl_ forControlEvents:4096];
  v55 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_variantSegmentedControl];
  v56 = [(PXVideoComparisonViewController *)self navigationItem];
  [v56 setRightBarButtonItem:v55];

  v57 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v58 = [(PXVideoComparisonViewController *)self settings];

  if (v58)
  {
    id v59 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v60 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gear"];
    v58 = (void *)[v59 initWithImage:v60 style:0 target:self action:sel__handleSettingsButton_];
  }
  id v61 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v62 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info"];
  v63 = (void *)[v61 initWithImage:v62 style:0 target:self action:sel__handleResultButton_];

  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v64 addObject:v48];
  if (v58)
  {
    [v64 addObject:v57];
    [v64 addObject:v58];
  }
  [v64 addObject:v57];
  [v64 addObject:v63];
  [(PXVideoComparisonViewController *)self setToolbarItems:v64];
}

- (PXVideoComparisonViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoComparisonViewController.m", 68, @"%s is not available as initializer", "-[PXVideoComparisonViewController initWithCoder:]");

  abort();
}

- (PXVideoComparisonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoComparisonViewController.m", 64, @"%s is not available as initializer", "-[PXVideoComparisonViewController initWithNibName:bundle:]");

  abort();
}

- (PXVideoComparisonViewController)initWithInputAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoComparisonViewController;
  id v6 = [(PXVideoComparisonViewController *)&v9 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputAsset, a3);
    v7->_videoRequestID = 0;
    v7->_useVariantVideoByDefaultInToggle = 0;
  }

  return v7;
}

@end