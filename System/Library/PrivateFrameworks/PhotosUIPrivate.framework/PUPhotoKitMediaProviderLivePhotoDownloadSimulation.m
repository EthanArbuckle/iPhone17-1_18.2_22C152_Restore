@interface PUPhotoKitMediaProviderLivePhotoDownloadSimulation
- (NSDictionary)_resultInfo;
- (PHLivePhoto)_resultLivePhoto;
- (PUPhotoKitMediaProviderLivePhotoDownloadSimulation)init;
- (id)externalProgressHandler;
- (id)externalResultHandler;
- (id)internalProgressHandler;
- (id)internalResultHandler;
- (void)_handleResultLivePhoto:(id)a3 info:(id)a4;
- (void)_setResultInfo:(id)a3;
- (void)_setResultLivePhoto:(id)a3;
- (void)endSimulationWithError:(id)a3;
- (void)setExternalProgressHandler:(id)a3;
- (void)setExternalResultHandler:(id)a3;
- (void)updateSimulationWithProgress:(double)a3;
@end

@implementation PUPhotoKitMediaProviderLivePhotoDownloadSimulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultLivePhoto, 0);
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

- (void)_setResultLivePhoto:(id)a3
{
}

- (PHLivePhoto)_resultLivePhoto
{
  return self->__resultLivePhoto;
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
  v10.super_class = (Class)PUPhotoKitMediaProviderLivePhotoDownloadSimulation;
  [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 endSimulationWithError:v4];
  v5 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self _resultLivePhoto];
  v6 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self _resultInfo];
  if (v4)
  {

    uint64_t v11 = *MEMORY[0x1E4F39698];
    v12[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    v5 = 0;
    v6 = (void *)v7;
  }
  v8 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self externalResultHandler];
  ((void (**)(void, void *, void *))v8)[2](v8, v5, v6);

  id internalResultHandler = self->_internalResultHandler;
  self->_id internalResultHandler = 0;
}

- (void)updateSimulationWithProgress:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderLivePhotoDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  v5 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self externalProgressHandler];

  if (v5)
  {
    char v7 = 0;
    v6 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self externalProgressHandler];
    ((void (**)(void, void, char *, void, double))v6)[2](v6, 0, &v7, 0, a3);
  }
}

- (void)_handleResultLivePhoto:(id)a3 info:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  char v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  char v8 = [v7 BOOLValue];

  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F396E8]];
  unsigned __int16 v10 = [v9 integerValue];

  uint64_t v11 = [MEMORY[0x1E4F8B938] formatWithID:v10];
  v12 = v11;
  if ((v8 & 1) != 0 || [v11 isThumbnail])
  {
    v13 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self externalResultHandler];
    ((void (**)(void, id, id))v13)[2](v13, v14, v6);
  }
  else
  {
    [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self _setResultLivePhoto:v14];
    [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)self _setResultInfo:v6];
    [(PUPhotoKitMediaProviderDownloadSimulation *)self beginSimulation];
  }
}

- (PUPhotoKitMediaProviderLivePhotoDownloadSimulation)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderLivePhotoDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PUPhotoKitMediaProviderLivePhotoDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E5F29D00;
    id v4 = v2;
    v9 = v4;
    uint64_t v5 = [v8 copy];
    id internalResultHandler = v4->_internalResultHandler;
    v4->_id internalResultHandler = (id)v5;
  }
  return v3;
}

uint64_t __58__PUPhotoKitMediaProviderLivePhotoDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResultLivePhoto:a2 info:a3];
}

@end