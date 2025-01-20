@interface PXStoryMuteStateController
- (PXStoryModel)mainModel;
- (PXStoryMuteStateController)initWithObservableModel:(id)a3;
- (PXStoryMuteStateController)initWithViewModel:(id)a3 volumeController:(id)a4 userDefaults:(id)a5;
- (PXStoryViewModel)viewModel;
- (PXUserDefaultsDataSource)userDefaults;
- (PXVolumeController)volumeController;
- (void)_invalidateMainModel;
- (void)_saveMutedStatePreference;
- (void)_updateMainModel;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setMainModel:(id)a3;
@end

@implementation PXStoryMuteStateController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXUserDefaultsDataSource)userDefaults
{
  return self->_userDefaults;
}

- (PXVolumeController)volumeController
{
  return self->_volumeController;
}

- (PXStoryViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXStoryViewModel *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)VolumeControllerObservationContext == a5)
  {
    if (a4)
    {
      v13 = NSNumber;
      v14 = [(PXStoryMuteStateController *)self volumeController];
      v9 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isInSilentMode"));

      if ((a4 & 2) == 0)
      {
        if (!v9) {
          goto LABEL_15;
        }
        uint64_t v15 = 3;
LABEL_14:
        v16 = [(PXStoryMuteStateController *)self viewModel];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __59__PXStoryMuteStateController_observable_didChange_context___block_invoke;
        v19[3] = &unk_1E5DB3340;
        id v20 = v9;
        uint64_t v21 = v15;
        id v17 = v9;
        [v16 performChanges:v19];

        goto LABEL_15;
      }
    }
    else
    {
      if ((a4 & 2) == 0) {
        goto LABEL_15;
      }
      v9 = 0;
    }

    v9 = (void *)MEMORY[0x1E4F1CC28];
    uint64_t v15 = 2;
    goto LABEL_14;
  }
  if ((void *)MainModelObservationContext == a5)
  {
    if ((a4 & 0x800000000000) != 0)
    {
      v10 = [(PXStoryMuteStateController *)self mainModel];
      v11 = [v10 editorPreviewSong];

      if (v11)
      {
        v12 = [(PXStoryMuteStateController *)self viewModel];
        [v12 performChanges:&__block_literal_global_17_43463];
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PXStoryMuteStateController;
    [(PXStoryController *)&v18 observable:v8 didChange:a4 context:a5];
  }
LABEL_15:
}

void __59__PXStoryMuteStateController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setMuted:reason:", objc_msgSend(v3, "BOOLValue"), *(void *)(a1 + 40));
}

uint64_t __59__PXStoryMuteStateController_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setMuted:0 reason:4];
}

- (void)handleModelChange:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryMuteStateController;
  -[PXStoryController handleModelChange:](&v8, sel_handleModelChange_);
  if ((a3 & 0x400000000000000) != 0)
  {
    v5 = [(PXStoryMuteStateController *)self viewModel];
    unint64_t v6 = [v5 lastMutedChangeReason];

    if (v6 <= 4 && ((1 << v6) & 0x16) != 0) {
      [(PXStoryMuteStateController *)self _saveMutedStatePreference];
    }
  }
  if ((a3 & 0x40) != 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__PXStoryMuteStateController_handleModelChange___block_invoke;
    v7[3] = &unk_1E5DD1E50;
    v7[4] = self;
    [(PXStoryController *)self performChanges:v7];
  }
}

uint64_t __48__PXStoryMuteStateController_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateMainModel];
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryMuteStateController *)self viewModel];
  v3 = [v4 mainModel];
  [(PXStoryMuteStateController *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModel];
}

- (void)_saveMutedStatePreference
{
  v3 = [(PXStoryMuteStateController *)self viewModel];
  uint64_t v4 = [v3 isMuted];

  v5 = [(PXStoryMuteStateController *)self volumeController];
  int v6 = [v5 isInSilentMode];

  if (v4 == v6)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [NSNumber numberWithBool:v4];
  }
  v7 = [(PXStoryMuteStateController *)self userDefaults];
  [v7 setPersistedValue:v8 forKey:@"PXStoryPlaybackMutedStatePreference"];
}

- (void)setMainModel:(id)a3
{
  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    [(PXStoryModel *)mainModel unregisterChangeObserver:self context:MainModelObservationContext];
    objc_storeStrong((id *)&self->_mainModel, a3);
    [(PXStoryModel *)self->_mainModel registerChangeObserver:self context:MainModelObservationContext];
    v5 = v7;
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryMuteStateController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel, v4.receiver, v4.super_class);
}

- (PXStoryMuteStateController)initWithViewModel:(id)a3 volumeController:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryMuteStateController;
  v11 = [(PXStoryController *)&v19 initWithObservableModel:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_viewModel, v8);
    objc_storeStrong((id *)&v12->_volumeController, a4);
    [(PXVolumeController *)v12->_volumeController registerChangeObserver:v12 context:VolumeControllerObservationContext];
    objc_storeStrong((id *)&v12->_userDefaults, a5);
    v13 = [(PXStoryMuteStateController *)v12 userDefaults];
    v14 = [v13 persistedValueForKey:@"PXStoryPlaybackMutedStatePreference"];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v15 = v14;

      if (v15)
      {
        v16 = v15;
        if (![v15 BOOLValue]) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v15 = 0;
    v16 = 0;
    if (![(PXVolumeController *)v12->_volumeController isInSilentMode])
    {
LABEL_10:
      [(PXStoryMuteStateController *)v12 _updateMainModel];

      goto LABEL_11;
    }
LABEL_9:
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_viewModel);
    [WeakRetained performChanges:&__block_literal_global_43476];

    v16 = v15;
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

void __78__PXStoryMuteStateController_initWithViewModel_volumeController_userDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setMuted:1 reason:5];
  [v2 temporarilyShowMuteToggleButtonWhenChromeIsHidden];
}

- (PXStoryMuteStateController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMuteStateController.m", 32, @"%s is not available as initializer", "-[PXStoryMuteStateController initWithObservableModel:]");

  abort();
}

@end