@interface PUPhotoKitMediaProviderAnimatedImageDownloadSimulation
- (NSDictionary)_resultInfo;
- (PHAnimatedImage)_resultAnimatedImage;
- (PUPhotoKitMediaProviderAnimatedImageDownloadSimulation)init;
- (id)externalProgressHandler;
- (id)externalResultHandler;
- (id)internalProgressHandler;
- (id)internalResultHandler;
- (void)_handleResultAnimatedImage:(id)a3 info:(id)a4;
- (void)_setResultAnimatedImage:(id)a3;
- (void)_setResultInfo:(id)a3;
- (void)endSimulationWithError:(id)a3;
- (void)setExternalProgressHandler:(id)a3;
- (void)setExternalResultHandler:(id)a3;
- (void)updateSimulationWithProgress:(double)a3;
@end

@implementation PUPhotoKitMediaProviderAnimatedImageDownloadSimulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultAnimatedImage, 0);
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

- (void)_setResultAnimatedImage:(id)a3
{
}

- (PHAnimatedImage)_resultAnimatedImage
{
  return self->__resultAnimatedImage;
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
  v10.super_class = (Class)PUPhotoKitMediaProviderAnimatedImageDownloadSimulation;
  [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 endSimulationWithError:v4];
  v5 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)self _resultAnimatedImage];
  v6 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)self _resultInfo];
  if (v4)
  {

    uint64_t v11 = *MEMORY[0x1E4F39698];
    v12[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    v5 = 0;
    v6 = (void *)v7;
  }
  v8 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)self externalResultHandler];
  ((void (**)(void, void *, void *))v8)[2](v8, v5, v6);

  id internalResultHandler = self->_internalResultHandler;
  self->_id internalResultHandler = 0;
}

- (void)updateSimulationWithProgress:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderAnimatedImageDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  v5 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)self externalProgressHandler];

  if (v5)
  {
    char v7 = 0;
    v6 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)self externalProgressHandler];
    ((void (**)(void, void, char *, void, double))v6)[2](v6, 0, &v7, 0, a3);
  }
}

- (void)_handleResultAnimatedImage:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation__handleResultAnimatedImage_info___block_invoke;
  block[3] = &unk_1E5F2E908;
  id v11 = v7;
  v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation__handleResultAnimatedImage_info___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  char v3 = [v2 BOOLValue];

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396E8]];
  unsigned __int16 v5 = [v4 integerValue];

  id v7 = [MEMORY[0x1E4F8B938] formatWithID:v5];
  if ((v3 & 1) != 0 || [v7 isThumbnail])
  {
    id v6 = [*(id *)(a1 + 40) externalResultHandler];
    v6[2](v6, *(void *)(a1 + 48), *(void *)(a1 + 32));
  }
  else
  {
    [*(id *)(a1 + 40) _setResultAnimatedImage:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _setResultInfo:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) beginSimulation];
  }
}

- (PUPhotoKitMediaProviderAnimatedImageDownloadSimulation)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderAnimatedImageDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 init];
  char v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E5F29D28;
    id v4 = v2;
    id v9 = v4;
    uint64_t v5 = [v8 copy];
    id internalResultHandler = v4->_internalResultHandler;
    v4->_id internalResultHandler = (id)v5;
  }
  return v3;
}

uint64_t __62__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResultAnimatedImage:a2 info:a3];
}

@end