@interface PUCompositeVideoActivity
+ (BOOL)canPerformWithAssets:(id)a3;
- (AVAssetExportSession)exportSession;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isCancelled;
- (PUCompositeVideoGenerator)generator;
- (PXAlertController)progressController;
- (UIViewController)presenterViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)_exportGeneratedVideo;
- (void)_finishWithSuccess:(BOOL)a3 cancelled:(BOOL)a4;
- (void)_sucessfullyFinishedSaving:(BOOL)a3 error:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareWithActivityItems:(id)a3;
- (void)prepareWithViewController:(id)a3 assets:(id)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setExportSession:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setPresenterViewController:(id)a3;
- (void)setProgressController:(id)a3;
@end

@implementation PUCompositeVideoActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_presenterViewController, 0);
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setExportSession:(id)a3
{
}

- (AVAssetExportSession)exportSession
{
  return self->_exportSession;
}

- (void)setGenerator:(id)a3
{
}

- (PUCompositeVideoGenerator)generator
{
  return self->_generator;
}

- (void)setProgressController:(id)a3
{
}

- (PXAlertController)progressController
{
  return self->_progressController;
}

- (void)setPresenterViewController:(id)a3
{
}

- (UIViewController)presenterViewController
{
  return self->_presenterViewController;
}

- (void)_finishWithSuccess:(BOOL)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(PUCompositeVideoActivity *)self setCancelled:a4];
  [(PUCompositeVideoActivity *)self setGenerator:0];
  [(PUCompositeVideoActivity *)self setExportSession:0];
  [(PUCompositeVideoActivity *)self setPresenterViewController:0];
  [(UIActivity *)self activityDidFinish:v5];
  v7 = [(PXActivity *)self actionDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    v9 = [(PXActivity *)self actionDelegate];
    if (v4) {
      id v10 = v11;
    }
    else {
      id v10 = 0;
    }
    [v9 activity:self didFinishWithSuccess:v5 error:v10];
  }
}

- (void)_sucessfullyFinishedSaving:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  if (![(PUCompositeVideoActivity *)self isCancelled])
  {
    id v6 = v5;
    px_dispatch_on_main_queue();
  }
}

void __61__PUCompositeVideoActivity__sucessfullyFinishedSaving_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    [v2 _finishWithSuccess:1 cancelled:0];
  }
  else
  {
    v3 = PLShareSheetGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_ERROR, "Unable to generate video with error: %@", buf, 0xCu);
    }

    id v5 = PULocalizedString(@"SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_ERROR_TITLE");
    id v6 = [*(id *)(a1 + 40) localizedDescription];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      PULocalizedString(@"SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_ERROR_MESSAGE");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    id v10 = PULocalizedString(@"OK");
    id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v9 preferredStyle:1];
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v12 = (void *)MEMORY[0x1E4FB1410];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__PUCompositeVideoActivity__sucessfullyFinishedSaving_error___block_invoke_227;
    v15[3] = &unk_1E5F2DCA8;
    objc_copyWeak(&v16, (id *)buf);
    v13 = [v12 actionWithTitle:v10 style:0 handler:v15];
    [v11 addAction:v13];

    v14 = [*(id *)(a1 + 32) presenterViewController];
    objc_msgSend(v14, "px_presentOverTopmostPresentedViewController:animated:completion:", v11, 1, 0);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __61__PUCompositeVideoActivity__sucessfullyFinishedSaving_error___block_invoke_227(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithSuccess:0 cancelled:0];
}

- (void)_exportGeneratedVideo
{
  if (![(PUCompositeVideoActivity *)self isCancelled]) {
    px_dispatch_on_main_queue();
  }
}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) generator];
  v3 = [v2 exportSession];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setOutputFileType:*MEMORY[0x1E4F15AB0]];
    id v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "px_tempDirectoryFileURLWithSubdirectory:fileExtension:", @"com.apple.mobileslideshow.combined-video", @"mov");
    [v4 setOutputURL:v5];

    id v6 = PLShareSheetGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 outputURL];
      id v8 = [v4 outputFileType];
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Begin to export asynchronously to URL: %@ (file type: %@)", buf, 0x16u);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_210;
    v14[3] = &unk_1E5F2E908;
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v2;
    [v9 exportAsynchronouslyWithCompletionHandler:v14];
    [*(id *)(a1 + 32) setExportSession:v9];

    id v11 = v15;
  }
  else
  {
    v12 = PLShareSheetGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Unable to create export session.", buf, 2u);
    }

    v13 = *(void **)(a1 + 32);
    id v11 = [v2 error];
    [v13 _sucessfullyFinishedSaving:0 error:v11];
  }
}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_210(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a1[4] status] == 3 && (objc_msgSend(a1[5], "isCancelled") & 1) == 0)
  {
    v7 = PLShareSheetGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Begin saving exported video to library", buf, 2u);
    }

    id v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_212;
    v10[3] = &unk_1E5F2ECC8;
    id v11 = a1[6];
    id v12 = a1[4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_2;
    v9[3] = &unk_1E5F2E3B8;
    v9[4] = a1[5];
    [v8 performChanges:v10 completionHandler:v9];

    id v6 = v11;
  }
  else
  {
    v2 = PLShareSheetGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [a1[4] error];
      uint64_t v4 = [a1[4] status];
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_ERROR, "Unable to export video with error: %@ (status %ld)", buf, 0x16u);
    }
    id v5 = a1[5];
    id v6 = [a1[4] error];
    [v5 _sucessfullyFinishedSaving:0 error:v6];
  }
}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_212(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F38F28] creationRequestForAsset];
  id v2 = objc_alloc_init(MEMORY[0x1E4F38F70]);
  [v2 setShouldMoveFile:1];
  v3 = [*(id *)(a1 + 32) assets];
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 creationDate];
  [v7 setCreationDate:v5];

  id v6 = [*(id *)(a1 + 40) outputURL];
  [v7 addResourceWithType:2 fileURL:v6 options:v2];
}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLShareSheetGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Unable to save exported video with error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _sucessfullyFinishedSaving:a2 error:v5];
}

- (void)prepareWithViewController:(id)a3 assets:(id)a4
{
  id v9 = a3;
  if (a4)
  {
    id v6 = a4;
    int v7 = [[PUCompositeVideoGenerator alloc] initWithAssets:v6 outputType:1 onlyAllowOverlappingAssets:0];

    [(PUCompositeVideoGenerator *)v7 registerChangeObserver:self context:generatorContext];
    [(PUCompositeVideoActivity *)self setGenerator:v7];
  }
  [(PUCompositeVideoActivity *)self setPresenterViewController:v9];
  id v8 = [(PUCompositeVideoActivity *)self generator];
  [v8 start];
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(PUCompositeVideoActivity *)self prepareWithViewController:v9 assets:0];
  v11.receiver = self;
  v11.super_class = (Class)PUCompositeVideoActivity;
  LOBYTE(v5) = [(PXActivity *)&v11 _presentActivityOnViewController:v9 animated:v5 completion:v8];

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)generatorContext == a5)
  {
    id v6 = [(PUCompositeVideoActivity *)self generator];
    uint64_t v7 = [v6 state];

    if (v7 == 2)
    {
      [(PUCompositeVideoActivity *)self _exportGeneratedVideo];
    }
  }
}

- (void)prepareWithActivityItems:(id)a3
{
  [(PUCompositeVideoActivity *)self setCancelled:0];
  uint64_t v4 = [(PXActivity *)self itemSourceController];
  BOOL v5 = [v4 assets];
  id v7 = [v5 array];

  id v6 = [[PUCompositeVideoGenerator alloc] initWithAssets:v7 outputType:1 onlyAllowOverlappingAssets:0];
  [(PUCompositeVideoGenerator *)v6 registerChangeObserver:self context:generatorContext];
  [(PUCompositeVideoActivity *)self setGenerator:v6];
}

- (id)activityViewController
{
  v3 = [(PUCompositeVideoActivity *)self progressController];
  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = PULocalizedString(@"SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_PROGRESS_ALERT_MESSAGE");
    BOOL v5 = (void *)MEMORY[0x1E4F8FF80];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __50__PUCompositeVideoActivity_activityViewController__block_invoke;
    uint64_t v10 = &unk_1E5F2E530;
    objc_copyWeak(&v11, &location);
    v3 = [v5 activityAlertControllerWithTitle:v4 cancelHandler:&v7];
    -[PUCompositeVideoActivity setProgressController:](self, "setProgressController:", v3, v7, v8, v9, v10);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __50__PUCompositeVideoActivity_activityViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithSuccess:0 cancelled:1];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = [(PXActivity *)self itemSourceController];
  int v5 = [v4 isPreparingIndividualItems];

  if (!v5) {
    return 0;
  }
  id v6 = [(PXActivity *)self itemSourceController];
  uint64_t v7 = [v6 assets];

  LOBYTE(v6) = +[PUCompositeVideoActivity canPerformWithAssets:v7];
  return (char)v6;
}

- (id)_systemImageName
{
  return @"video";
}

- (id)activityTitle
{
  return PULocalizedString(@"SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_TITLE");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90970];
}

+ (BOOL)canPerformWithAssets:(id)a3
{
  return [a3 indexOfObjectPassingTest:&__block_literal_global_98912] == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __49__PUCompositeVideoActivity_canPerformWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 playbackStyle] != 3 || objc_msgSend(v2, "playbackVariation") != 0;

  return v3;
}

@end