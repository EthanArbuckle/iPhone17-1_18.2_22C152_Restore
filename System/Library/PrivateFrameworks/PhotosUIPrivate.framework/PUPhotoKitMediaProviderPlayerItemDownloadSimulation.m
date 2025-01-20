@interface PUPhotoKitMediaProviderPlayerItemDownloadSimulation
- (AVPlayerItem)_resultPlayerItem;
- (NSDictionary)_resultInfo;
- (PUPhotoKitMediaProviderPlayerItemDownloadSimulation)init;
- (id)externalProgressHandler;
- (id)externalResultHandler;
- (id)internalProgressHandler;
- (id)internalResultHandler;
- (void)_handleResultPlayerItem:(id)a3 info:(id)a4;
- (void)_setResultInfo:(id)a3;
- (void)_setResultPlayerItem:(id)a3;
- (void)endSimulationWithError:(id)a3;
- (void)setExternalProgressHandler:(id)a3;
- (void)setExternalResultHandler:(id)a3;
- (void)updateSimulationWithProgress:(double)a3;
@end

@implementation PUPhotoKitMediaProviderPlayerItemDownloadSimulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultPlayerItem, 0);
  objc_storeStrong(&self->_internalResultHandler, 0);
  objc_storeStrong(&self->_externalResultHandler, 0);
  objc_storeStrong(&self->_internalProgressHandler, 0);
  objc_storeStrong(&self->_externalProgressHandler, 0);
}

- (void)_setResultInfo:(id)a3
{
}

- (NSDictionary)_resultInfo
{
  return self->__resultInfo;
}

- (void)_setResultPlayerItem:(id)a3
{
}

- (AVPlayerItem)_resultPlayerItem
{
  return self->__resultPlayerItem;
}

- (id)internalResultHandler
{
  return self->_internalResultHandler;
}

- (void)setExternalResultHandler:(id)a3
{
}

- (id)externalResultHandler
{
  return self->_externalResultHandler;
}

- (id)internalProgressHandler
{
  return self->_internalProgressHandler;
}

- (void)setExternalProgressHandler:(id)a3
{
}

- (id)externalProgressHandler
{
  return self->_externalProgressHandler;
}

- (void)endSimulationWithError:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderPlayerItemDownloadSimulation;
  [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 endSimulationWithError:v4];
  v5 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)self _resultPlayerItem];
  v6 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)self _resultInfo];
  if (v4)
  {

    uint64_t v11 = *MEMORY[0x1E4F39698];
    v12[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    v5 = 0;
    v6 = (void *)v7;
  }
  v8 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)self externalResultHandler];
  ((void (**)(void, void *, void *))v8)[2](v8, v5, v6);

  id internalResultHandler = self->_internalResultHandler;
  self->_id internalResultHandler = 0;
}

- (void)updateSimulationWithProgress:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderPlayerItemDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  v5 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)self externalProgressHandler];

  if (v5)
  {
    char v7 = 0;
    v6 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)self externalProgressHandler];
    ((void (**)(void, void, char *, void, double))v6)[2](v6, 0, &v7, 0, a3);
  }
}

- (void)_handleResultPlayerItem:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PUPhotoKitMediaProviderPlayerItemDownloadSimulation__handleResultPlayerItem_info___block_invoke;
  block[3] = &unk_1E5F2E908;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__PUPhotoKitMediaProviderPlayerItemDownloadSimulation__handleResultPlayerItem_info___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setResultPlayerItem:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setResultInfo:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  return [v2 beginSimulation];
}

- (PUPhotoKitMediaProviderPlayerItemDownloadSimulation)init
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoKitMediaProviderPlayerItemDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(PUPhotoKitMediaProviderDownloadSimulation *)v2 downloadDuration];
    [(PUPhotoKitMediaProviderDownloadSimulation *)v3 setDownloadDuration:v4 * 2.5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PUPhotoKitMediaProviderPlayerItemDownloadSimulation_init__block_invoke;
    v9[3] = &unk_1E5F29CB0;
    v5 = v3;
    objc_super v10 = v5;
    uint64_t v6 = [v9 copy];
    id internalResultHandler = v5->_internalResultHandler;
    v5->_id internalResultHandler = (id)v6;
  }
  return v3;
}

uint64_t __59__PUPhotoKitMediaProviderPlayerItemDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResultPlayerItem:a2 info:a3];
}

@end