@interface PXStorySongController
- (NSSet)failedAudioAssets;
- (PXStoryModel)model;
- (PXStorySongController)initWithModel:(id)a3;
- (PXStorySongController)initWithObservableModel:(id)a3;
- (PXStorySongResource)currentSongResource;
- (double)failedSongDelayBeforeSwitchingToFallback;
- (void)_invalidateCurrentSongResource;
- (void)_updateCurrentSongResource;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setCurrentSongResource:(id)a3;
- (void)setFailedAudioAssets:(id)a3;
- (void)setFailedSongDelayBeforeSwitchingToFallback:(double)a3;
@end

@implementation PXStorySongController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSongResource, 0);
  objc_storeStrong((id *)&self->_failedAudioAssets, 0);
  objc_destroyWeak((id *)&self->_model);
}

- (void)setFailedSongDelayBeforeSwitchingToFallback:(double)a3
{
  self->_failedSongDelayBeforeSwitchingToFallback = a3;
}

- (double)failedSongDelayBeforeSwitchingToFallback
{
  return self->_failedSongDelayBeforeSwitchingToFallback;
}

- (PXStorySongResource)currentSongResource
{
  return self->_currentSongResource;
}

- (NSSet)failedAudioAssets
{
  return self->_failedAudioAssets;
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)StyleManagerContext == a5)
  {
    if ((a4 & 0x120) == 0) {
      goto LABEL_9;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PXStorySongController_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD1E50;
    v12[4] = self;
    v9 = v12;
LABEL_8:
    [(PXStorySongController *)self performChanges:v9];
    goto LABEL_9;
  }
  if ((void *)RecipeManagerContext == a5)
  {
    if ((a4 & 1) == 0) {
      goto LABEL_9;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__PXStorySongController_observable_didChange_context___block_invoke_2;
    v11[3] = &unk_1E5DD1E50;
    v11[4] = self;
    v9 = v11;
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStorySongController;
  [(PXStoryController *)&v10 observable:v8 didChange:a4 context:a5];
LABEL_9:
}

uint64_t __54__PXStorySongController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentSongResource];
}

uint64_t __54__PXStorySongController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentSongResource];
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStorySongController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((a3 & 0x808000010200) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__PXStorySongController_handleModelChange___block_invoke;
    v5[3] = &unk_1E5DD1E50;
    v5[4] = self;
    [(PXStorySongController *)self performChanges:v5];
  }
}

uint64_t __43__PXStorySongController_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentSongResource];
}

- (void)_updateCurrentSongResource
{
  v3 = [(PXStorySongController *)self model];
  v4 = [v3 currentStyle];
  v5 = [v4 songResource];

  if (!v5)
  {
    objc_super v6 = [v3 recipeManager];
    v7 = [v6 recipe];
    v5 = [v7 initialSongResource];
  }
  id v8 = [(PXStorySongController *)self failedAudioAssets];
  v9 = objc_msgSend(v5, "px_storyResourceSongAsset");
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Current song resource has failed. Falling back to fallback song resource.", v21, 2u);
    }

    [(PXStorySongController *)self failedSongDelayBeforeSwitchingToFallback];
    if (v12 > 0.0)
    {
      double v13 = v12;
      [(PXStorySongController *)self setFailedSongDelayBeforeSwitchingToFallback:0.0];
      [MEMORY[0x1E4F29060] sleepForTimeInterval:v13];
    }
    v14 = [v3 recipeManager];
    v15 = [v14 recipe];
    uint64_t v16 = [v15 fallbackSongResource];

    v5 = (void *)v16;
  }
  if ([v3 isPresentingMusicEditor])
  {
    [v3 editorPreviewSong];
    v5 = v17 = v5;
LABEL_15:

    goto LABEL_16;
  }
  if ([v3 viewMode] == 4)
  {
    v17 = [v3 styleManager];
    v18 = [v17 selectionDataSource];
    if ([v18 numberOfStyles] >= 1)
    {
      v19 = objc_msgSend(v18, "styleInfoAtIndex:", objc_msgSend(v17, "focusedStyleIndex"));
      uint64_t v20 = [v19 songResource];

      v5 = (void *)v20;
    }

    goto LABEL_15;
  }
LABEL_16:
  [(PXStorySongController *)self setCurrentSongResource:v5];
}

- (void)_invalidateCurrentSongResource
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentSongResource];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStorySongController;
  [(PXStoryController *)&v3 performChanges:a3];
}

- (void)setFailedAudioAssets:(id)a3
{
  id v8 = (NSSet *)a3;
  v4 = self->_failedAudioAssets;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      objc_super v6 = (NSSet *)[(NSSet *)v8 copy];
      failedAudioAssets = self->_failedAudioAssets;
      self->_failedAudioAssets = v6;

      [(PXStorySongController *)self _invalidateCurrentSongResource];
    }
  }
}

- (void)setCurrentSongResource:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v5 = (PXStorySongResource *)a3;
  objc_super v6 = self->_currentSongResource;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(PXStorySongResource *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentSongResource, a3);
      v9 = [(PXStorySongResource *)v5 px_storyResourceSongAsset];
      int v10 = PLStoryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = PXAudioAssetDescription(v9);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "current song %@", buf, 0xCu);
      }
      double v12 = [(PXStorySongController *)self model];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__PXStorySongController_setCurrentSongResource___block_invoke;
      v13[3] = &unk_1E5DCEE38;
      v14 = v5;
      [v12 performChanges:v13];
    }
  }
}

uint64_t __48__PXStorySongController_setCurrentSongResource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActiveSongResource:*(void *)(a1 + 32)];
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStorySongController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCurrentSongResource, v4.receiver, v4.super_class);
}

- (PXStorySongController)initWithModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXStorySongController;
  char v5 = [(PXStoryController *)&v12 initWithObservableModel:v4];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v6->_failedSongDelayBeforeSwitchingToFallback = 0.0;
    v7 = [v4 recipeManager];
    [v7 registerChangeObserver:v6 context:RecipeManagerContext];

    char v8 = [v4 styleManager];
    [v8 registerChangeObserver:v6 context:StyleManagerContext];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__PXStorySongController_initWithModel___block_invoke;
    v10[3] = &unk_1E5DD1E50;
    v11 = v6;
    [(PXStorySongController *)v11 performChanges:v10];
  }
  return v6;
}

uint64_t __39__PXStorySongController_initWithModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentSongResource];
}

- (PXStorySongController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStorySongController.m", 32, @"%s is not available as initializer", "-[PXStorySongController initWithObservableModel:]");

  abort();
}

@end