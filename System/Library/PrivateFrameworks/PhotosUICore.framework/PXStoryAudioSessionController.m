@interface PXStoryAudioSessionController
- (AVAudioSession)audioSession;
- (BOOL)shouldMixWithOthers;
- (OS_dispatch_queue)workQueue;
- (PXAVResourceReclamationController)resourceReclamationController;
- (PXStoryAudioSessionController)initWithModel:(id)a3;
- (PXStoryAudioSessionController)initWithObservableModel:(id)a3;
- (PXStoryModel)model;
- (void)_invalidateAudioSession;
- (void)_invalidateShouldMixWithOthers;
- (void)_storyQueue_discardExistingAudioSession;
- (void)_updateAudioSession;
- (void)_updateShouldMixWithOthers;
- (void)_workQueue_createAudioSession;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)resourceReclamationEventDidOccur:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setShouldMixWithOthers:(BOOL)a3;
@end

@implementation PXStoryAudioSessionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_destroyWeak((id *)&self->_model);
}

- (BOOL)shouldMixWithOthers
{
  return self->_shouldMixWithOthers;
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (PXStoryAudioSessionController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryAudioSessionController.m", 153, @"%s is not available as initializer", "-[PXStoryAudioSessionController initWithObservableModel:]");

  abort();
}

- (void)handleModelChange:(unint64_t)a3
{
  __int16 v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryAudioSessionController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((v3 & 0x400) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PXStoryAudioSessionController_handleModelChange___block_invoke;
    v5[3] = &unk_1E5DD1E50;
    v5[4] = self;
    [(PXStoryController *)self performChanges:v5];
  }
}

uint64_t __51__PXStoryAudioSessionController_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateShouldMixWithOthers];
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryAudioSessionController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateShouldMixWithOthers, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateAudioSession];
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PXStoryController *)self storyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXStoryAudioSessionController_resourceReclamationEventDidOccur___block_invoke;
  v6[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__PXStoryAudioSessionController_resourceReclamationEventDidOccur___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_storyQueue_discardExistingAudioSession");
}

- (void)_storyQueue_discardExistingAudioSession
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __72__PXStoryAudioSessionController__storyQueue_discardExistingAudioSession__block_invoke;
  v2[3] = &unk_1E5DD1E50;
  v2[4] = self;
  [(PXStoryController *)self performChanges:v2];
}

uint64_t __72__PXStoryAudioSessionController__storyQueue_discardExistingAudioSession__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAudioSession:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAudioSession];
}

- (void)setAudioSession:(id)a3
{
  id v5 = (AVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    objc_storeStrong((id *)&self->_audioSession, a3);
    objc_super v6 = [(PXStoryAudioSessionController *)self model];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__PXStoryAudioSessionController_setAudioSession___block_invoke;
    v7[3] = &unk_1E5DCEE38;
    v8 = v5;
    [v6 performChanges:v7];
  }
}

uint64_t __49__PXStoryAudioSessionController_setAudioSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAudioSession:*(void *)(a1 + 32)];
}

- (void)_workQueue_createAudioSession
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryAudioSessionController *)self model];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F153E0] auxiliarySession];
    uint64_t v5 = [(PXStoryAudioSessionController *)self shouldMixWithOthers];
    id v6 = (id)*MEMORY[0x1E4F14F98];
    uint64_t v7 = *MEMORY[0x1E4F15050];
    id v19 = 0;
    LOBYTE(v5) = [v4 setCategory:v6 mode:v7 routeSharingPolicy:0 options:v5 error:&v19];
    id v8 = v19;
    if ((v5 & 1) == 0)
    {
      v9 = PLStoryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Failed to prepare shared audio session, error: %@", buf, 0xCu);
      }
    }
    id v18 = v8;
    char v10 = [v4 setPreferredOutputNumberOfChannels:2 error:&v18];
    id v11 = v18;

    if ((v10 & 1) == 0)
    {
      v12 = PLStoryGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to setPreferredOutputNumberOfChannels, error: %@", buf, 0xCu);
      }
    }
    objc_initWeak((id *)buf, self);
    v13 = [(PXStoryController *)self storyQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PXStoryAudioSessionController__workQueue_createAudioSession__block_invoke;
    v15[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v4;
    id v14 = v4;
    dispatch_async(v13, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __62__PXStoryAudioSessionController__workQueue_createAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAudioSession:v1];
}

- (void)_updateAudioSession
{
  id v3 = [(PXStoryAudioSessionController *)self model];
  id v4 = [v3 configuration];
  uint64_t v5 = ~[v4 options] & 3;

  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(PXStoryAudioSessionController *)self workQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PXStoryAudioSessionController__updateAudioSession__block_invoke;
    v7[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v8, &location);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __52__PXStoryAudioSessionController__updateAudioSession__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_createAudioSession");
}

- (void)_invalidateAudioSession
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAudioSession];
}

- (void)setShouldMixWithOthers:(BOOL)a3
{
  if (self->_shouldMixWithOthers != a3)
  {
    self->_shouldMixWithOthers = a3;
    [(PXStoryAudioSessionController *)self _invalidateAudioSession];
  }
}

- (void)_updateShouldMixWithOthers
{
  id v5 = [(PXStoryAudioSessionController *)self model];
  id v3 = [v5 activeSongResource];
  id v4 = objc_msgSend(v3, "px_storyResourceSongAsset");
  -[PXStoryAudioSessionController setShouldMixWithOthers:](self, "setShouldMixWithOthers:", [v4 catalog] == 2);
}

- (void)_invalidateShouldMixWithOthers
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldMixWithOthers];
}

- (PXStoryAudioSessionController)initWithModel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryAudioSessionController;
  id v5 = [(PXStoryController *)&v10 initWithObservableModel:v4];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    uint64_t v7 = (PXAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E4F8EB70]);
    resourceReclamationController = v6->_resourceReclamationController;
    v6->_resourceReclamationController = v7;

    px_dispatch_queue_create_serial();
  }

  return 0;
}

uint64_t __47__PXStoryAudioSessionController_initWithModel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateShouldMixWithOthers];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAudioSession];
}

@end