@interface PUPhotoKitMediaProviderAVAssetDownloadSimulation
- (AVAsset)_resultAVAsset;
- (AVAudioMix)_resultAudioMix;
- (NSDictionary)_resultInfo;
- (PUPhotoKitMediaProviderAVAssetDownloadSimulation)init;
- (id)externalProgressHandler;
- (id)externalResultHandler;
- (id)internalProgressHandler;
- (id)internalResultHandler;
- (void)_handleResultAVAsset:(id)a3 audioMix:(id)a4 info:(id)a5;
- (void)_setResultAVAsset:(id)a3;
- (void)_setResultAudioMix:(id)a3;
- (void)_setResultInfo:(id)a3;
- (void)endSimulationWithError:(id)a3;
- (void)setExternalProgressHandler:(id)a3;
- (void)setExternalResultHandler:(id)a3;
- (void)updateSimulationWithProgress:(double)a3;
@end

@implementation PUPhotoKitMediaProviderAVAssetDownloadSimulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultAudioMix, 0);
  objc_storeStrong((id *)&self->__resultAVAsset, 0);
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

- (void)_setResultAudioMix:(id)a3
{
}

- (AVAudioMix)_resultAudioMix
{
  return self->__resultAudioMix;
}

- (void)_setResultAVAsset:(id)a3
{
}

- (AVAsset)_resultAVAsset
{
  return self->__resultAVAsset;
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
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoKitMediaProviderAVAssetDownloadSimulation;
  [(PUPhotoKitMediaProviderDownloadSimulation *)&v11 endSimulationWithError:v4];
  v5 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)self _resultAVAsset];
  v6 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)self _resultAudioMix];
  v7 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)self _resultInfo];
  if (v4)
  {

    uint64_t v12 = *MEMORY[0x1E4F39698];
    v13[0] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    v5 = 0;
    v6 = 0;
    v7 = (void *)v8;
  }
  v9 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)self externalResultHandler];
  ((void (**)(void, void *, void *, void *))v9)[2](v9, v5, v6, v7);

  id internalResultHandler = self->_internalResultHandler;
  self->_id internalResultHandler = 0;
}

- (void)updateSimulationWithProgress:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderAVAssetDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  v5 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)self externalProgressHandler];

  if (v5)
  {
    char v7 = 0;
    v6 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)self externalProgressHandler];
    ((void (**)(void, void, char *, void, double))v6)[2](v6, 0, &v7, 0, a3);
  }
}

- (void)_handleResultAVAsset:(id)a3 audioMix:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PUPhotoKitMediaProviderAVAssetDownloadSimulation__handleResultAVAsset_audioMix_info___block_invoke;
  v14[3] = &unk_1E5F2D098;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

uint64_t __87__PUPhotoKitMediaProviderAVAssetDownloadSimulation__handleResultAVAsset_audioMix_info___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setResultAVAsset:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setResultAudioMix:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _setResultInfo:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 32);
  return [v2 beginSimulation];
}

- (PUPhotoKitMediaProviderAVAssetDownloadSimulation)init
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoKitMediaProviderAVAssetDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(PUPhotoKitMediaProviderDownloadSimulation *)v2 downloadDuration];
    [(PUPhotoKitMediaProviderDownloadSimulation *)v3 setDownloadDuration:v4 * 2.5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PUPhotoKitMediaProviderAVAssetDownloadSimulation_init__block_invoke;
    v9[3] = &unk_1E5F29CD8;
    v5 = v3;
    id v10 = v5;
    uint64_t v6 = [v9 copy];
    id internalResultHandler = v5->_internalResultHandler;
    v5->_id internalResultHandler = (id)v6;
  }
  return v3;
}

uint64_t __56__PUPhotoKitMediaProviderAVAssetDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleResultAVAsset:a2 audioMix:a3 info:a4];
}

@end