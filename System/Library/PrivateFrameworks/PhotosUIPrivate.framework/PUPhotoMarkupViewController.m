@interface PUPhotoMarkupViewController
- (BOOL)updatingUndoButtons;
- (MarkupViewControllerPrivateProtocol)_markupViewController;
- (NSURL)_workaroundInputWriteURL;
- (PUMediaProvider)mediaProvider;
- (PUObserverRegistry)_observerRegistry;
- (PUPhotoMarkupViewController)initWithReviewAsset:(id)a3 mediaProvider:(id)a4;
- (PUReviewAsset)reviewAsset;
- (UIBarButtonItem)redoButton;
- (UIBarButtonItem)undoButton;
- (id)controller:(id)a3 willSetToolbarItems:(id)a4;
- (int64_t)_sourceImageVersion;
- (void)_handleCancelButton:(id)a3;
- (void)_handleDoneButton:(id)a3;
- (void)_handleRedoButton:(id)a3;
- (void)_handleUndoButton:(id)a3;
- (void)_notifyObserversDidFinishWithSavedAsset:(id)a3;
- (void)_setSourceImageVersion:(int64_t)a3;
- (void)_setWorkaroundInputWriteURL:(id)a3;
- (void)_updateUndoRedoButtons;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setRedoButton:(id)a3;
- (void)setUndoButton:(id)a3;
- (void)setUpdatingUndoButtons:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUPhotoMarkupViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->__workaroundInputWriteURL, 0);
  objc_storeStrong((id *)&self->__observerRegistry, 0);
  objc_storeStrong((id *)&self->__markupViewController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

- (void)setUpdatingUndoButtons:(BOOL)a3
{
  self->_updatingUndoButtons = a3;
}

- (BOOL)updatingUndoButtons
{
  return self->_updatingUndoButtons;
}

- (void)setRedoButton:(id)a3
{
}

- (UIBarButtonItem)redoButton
{
  return self->_redoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)_setWorkaroundInputWriteURL:(id)a3
{
}

- (NSURL)_workaroundInputWriteURL
{
  return self->__workaroundInputWriteURL;
}

- (void)_setSourceImageVersion:(int64_t)a3
{
  self->__sourceImageVersion = a3;
}

- (int64_t)_sourceImageVersion
{
  return self->__sourceImageVersion;
}

- (PUObserverRegistry)_observerRegistry
{
  return self->__observerRegistry;
}

- (MarkupViewControllerPrivateProtocol)_markupViewController
{
  return self->__markupViewController;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v4 = a4;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C978] array];
  }
  v7 = v6;

  return v7;
}

- (void)unregisterObserver:(id)a3
{
}

- (void)registerObserver:(id)a3
{
}

- (void)_updateUndoRedoButtons
{
  if (![(PUPhotoMarkupViewController *)self updatingUndoButtons])
  {
    [(PUPhotoMarkupViewController *)self setUpdatingUndoButtons:1];
    BOOL v3 = [(NSUndoManager *)self->_undoManager canUndo];
    id v4 = [(PUPhotoMarkupViewController *)self undoButton];
    [v4 setEnabled:v3];

    BOOL v5 = [(NSUndoManager *)self->_undoManager canRedo];
    id v6 = [(PUPhotoMarkupViewController *)self redoButton];
    [v6 setEnabled:v5];

    [(PUPhotoMarkupViewController *)self setUpdatingUndoButtons:0];
  }
}

- (void)_handleRedoButton:(id)a3
{
}

- (void)_handleUndoButton:(id)a3
{
}

- (void)_notifyObserversDidFinishWithSavedAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PUPhotoMarkupViewController *)self _workaroundInputWriteURL];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    [v6 removeItemAtURL:v5 error:&v13];
    id v7 = v13;

    if (v7)
    {
      v8 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        __int16 v16 = 2114;
        id v17 = v7;
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@: %{public}@", buf, 0x16u);
      }
    }
    [(PUPhotoMarkupViewController *)self _setWorkaroundInputWriteURL:0];
  }
  observerRegistry = self->__observerRegistry;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PUPhotoMarkupViewController__notifyObserversDidFinishWithSavedAsset___block_invoke;
  v11[3] = &unk_1E5F29D70;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(PUObserverRegistry *)observerRegistry enumerateObserversWithBlock:v11];
}

uint64_t __71__PUPhotoMarkupViewController__notifyObserversDidFinishWithSavedAsset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 photoMarkupController:*(void *)(a1 + 32) didFinishWithSavedAsset:*(void *)(a1 + 40)];
}

- (void)_handleDoneButton:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [(PUPhotoMarkupViewController *)self reviewAsset];
  int64_t v5 = [(PUPhotoMarkupViewController *)self _sourceImageVersion];
  id v6 = [(PUPhotoMarkupViewController *)self _markupViewController];
  id v7 = [v6 createArchivedModelData];
  v8 = [v4 adjustmentOutputForInputBaseVersion:v5 withLivePhotoSupport:0];
  v9 = [v8 renderedImageFileURL];
  id v31 = 0;
  LOBYTE(v5) = [v6 writeToURL:v9 embeddingSourceImageAndEditModel:0 error:&v31];
  id v10 = v31;
  if ((v5 & 1) == 0)
  {
    v11 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v9;
      __int16 v34 = 2114;
      id v35 = v10;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Failed to write image to disk %{public}@: %{public}@", buf, 0x16u);
    }
  }
  if (([v4 mediaSubtypes] & 8) != 0)
  {
    v27 = [PUReviewAsset alloc];
    v25 = [v4 providedPreviewImage];
    unint64_t v23 = [v4 mediaSubtypes] & 0xFFFFFFFFFFFFFFF7;
    uint64_t v22 = [v4 pixelWidth];
    uint64_t v21 = [v4 pixelHeight];
    v20 = [v4 creationDate];
    v19 = [v4 providedImageMetadata];
    [v4 burstIdentifier];
    id v12 = v29 = v7;
    v30 = v6;
    uint64_t v13 = [v4 numberOfRepresentedAssets];
    [v4 providedFullsizeRenderImageURL];
    v14 = v28 = v9;
    v15 = [v4 providedFullsizeImageURL];
    [v4 assetAdjustments];
    __int16 v16 = v26 = v10;
    id v17 = [v4 identifier];
    uint64_t v24 = [(PUReviewAsset *)v27 initWithPhoto:v25 mediaSubtypes:v23 width:v22 height:v21 captureDate:v20 metadata:v19 burstIdentifier:v12 representedCount:v13 fullsizeImageURL:v14 fullsizeUnadjustedImageURL:v15 assetAdjustments:v16 identifier:v17];

    id v10 = v26;
    v9 = v28;

    id v7 = v29;
    id v4 = (void *)v24;
    id v6 = v30;
  }
  uint64_t v18 = [v4 reviewAssetWithAdjustmentOutput:v8 adjustmentData:v7 formatIdentifier:@"com.apple.Markup" version:@"1.0"];
  [(PUPhotoMarkupViewController *)self _notifyObserversDidFinishWithSavedAsset:v18];
}

- (void)_handleCancelButton:(id)a3
{
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoMarkupViewController;
  [(PUPhotoMarkupViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v54[3] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)PUPhotoMarkupViewController;
  [(PUPhotoMarkupViewController *)&v46 viewDidLoad];
  v45 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  BOOL v3 = [(PUPhotoMarkupViewController *)self view];
  [v3 setBackgroundColor:v45];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  id v12 = (void *)getPPKMarkupViewControllerClass_softClass;
  uint64_t v51 = getPPKMarkupViewControllerClass_softClass;
  if (!getPPKMarkupViewControllerClass_softClass)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __getPPKMarkupViewControllerClass_block_invoke;
    v47[3] = &unk_1E5F2E228;
    v47[4] = &v48;
    __getPPKMarkupViewControllerClass_block_invoke((uint64_t)v47);
    id v12 = (void *)v49[3];
  }
  uint64_t v13 = v12;
  _Block_object_dispose(&v48, 8);
  id v14 = objc_alloc_init(v13);
  v15 = PULocalizedString(@"PUPHOTOBROWSER_ASSET_EXPLORER_REVIEW_SCREEN_MARKUP_TITLE");
  [v14 setTitle:v15];

  if (objc_opt_respondsToSelector()) {
    [v14 setBackgroundColor:v45];
  }
  [v14 setAnnotationEditingEnabled:1];
  [v14 setPencilAlwaysDraws:1];
  [v14 setShowShareButtonInToolbar:0];
  [v14 setDelegate:self];
  [v14 setCentersIgnoringContentInsets:1];
  markupViewController = self->__markupViewController;
  self->__markupViewController = (MarkupViewControllerPrivateProtocol *)v14;
  id v17 = v14;

  v44 = [(PUPhotoMarkupViewController *)self reviewAsset];
  uint64_t v18 = [(PUPhotoMarkupViewController *)self mediaProvider];
  v19 = [v44 inputForAdjustmentWithMediaProvider:v18 canHandleAdjustments:&__block_literal_global_63289];

  v43 = [v19 baseImageFileURL];
  v20 = [v19 knownAdjustmentData];
  uint64_t v21 = [v19 currentPreviewImage];
  [v17 setFileURL:v43 withArchivedModelData:v20 placeholderImage:v21];

  -[PUPhotoMarkupViewController _setSourceImageVersion:](self, "_setSourceImageVersion:", [v19 adjustmentBaseVersion]);
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelButton_];
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:3 target:self action:sel__handleDoneButton_];
  uint64_t v24 = [v17 navigationItem];
  [v24 setRightBarButtonItem:v23];

  v25 = [v17 undoManager];
  undoManager = self->_undoManager;
  self->_undoManager = v25;

  id v27 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.backward.circle"];
  v29 = (void *)[v27 initWithImage:v28 style:0 target:self action:sel__handleUndoButton_];
  [(PUPhotoMarkupViewController *)self setUndoButton:v29];

  id v30 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v31 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.forward.circle"];
  v32 = (void *)[v30 initWithImage:v31 style:0 target:self action:sel__handleRedoButton_];
  [(PUPhotoMarkupViewController *)self setRedoButton:v32];

  v54[0] = v22;
  v33 = [(PUPhotoMarkupViewController *)self undoButton];
  v54[1] = v33;
  __int16 v34 = [(PUPhotoMarkupViewController *)self redoButton];
  v54[2] = v34;
  id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  uint64_t v36 = [v17 navigationItem];
  [v36 setLeftBarButtonItems:v35];

  v37 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v17];
  [(PUPhotoMarkupViewController *)self addChildViewController:v37];
  uint64_t v52 = *MEMORY[0x1E4FB0700];
  v38 = [MEMORY[0x1E4FB1618] labelColor];
  v53 = v38;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v40 = [v37 navigationBar];
  [v40 setTitleTextAttributes:v39];

  v41 = [v37 view];
  objc_msgSend(v41, "setFrame:", v5, v7, v9, v11);
  [v41 setAutoresizingMask:18];
  [v3 addSubview:v41];
  [v37 didMoveToParentViewController:self];
  v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v42 addObserver:self selector:sel__undoManagerCheckpoint_ name:*MEMORY[0x1E4F28A60] object:0];
}

uint64_t __42__PUPhotoMarkupViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 adjustmentFormatIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.Markup"];

  double v5 = [v2 adjustmentFormatVersion];
  char v6 = [v5 isEqualToString:@"1.0"];

  if (v4 && (v6 & 1) != 0)
  {
    uint64_t v7 = 1;
  }
  else
  {
    double v8 = [v2 adjustmentFormatIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.PaperKit.Markup"];

    double v10 = [v2 adjustmentFormatVersion];
    uint64_t v7 = v9 & [v10 isEqualToString:@"1.0"];
  }
  return v7;
}

- (PUPhotoMarkupViewController)initWithReviewAsset:(id)a3 mediaProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoMarkupViewController;
  double v10 = [(PUPhotoMarkupViewController *)&v15 initWithNibName:0 bundle:0];
  if (v10)
  {
    if (!v8)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v10, @"PUPhotoMarkupViewController.m", 91, @"Invalid parameter not satisfying: %@", @"reviewAsset" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_reviewAsset, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
    double v11 = objc_alloc_init(PUObserverRegistry);
    observerRegistry = v10->__observerRegistry;
    v10->__observerRegistry = v11;
  }
  return v10;
}

@end