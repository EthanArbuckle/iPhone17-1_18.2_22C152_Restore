@interface PUPhotoKitMediaProviderImageDownloadSimulation
- (NSDictionary)_resultInfo;
- (PUPhotoKitMediaProviderImageDownloadSimulation)init;
- (UIImage)_resultImage;
- (id)externalProgressHandler;
- (id)externalResultHandler;
- (id)internalProgressHandler;
- (id)internalResultHandler;
- (void)_handleResultImage:(id)a3 info:(id)a4;
- (void)_setResultImage:(id)a3;
- (void)_setResultInfo:(id)a3;
- (void)endSimulationWithError:(id)a3;
- (void)setExternalProgressHandler:(id)a3;
- (void)setExternalResultHandler:(id)a3;
- (void)updateSimulationWithProgress:(double)a3;
@end

@implementation PUPhotoKitMediaProviderImageDownloadSimulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultImage, 0);
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

- (void)_setResultImage:(id)a3
{
}

- (UIImage)_resultImage
{
  return self->__resultImage;
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
  v10.super_class = (Class)PUPhotoKitMediaProviderImageDownloadSimulation;
  [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 endSimulationWithError:v4];
  v5 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)self _resultImage];
  v6 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)self _resultInfo];
  if (v4)
  {

    uint64_t v11 = *MEMORY[0x1E4F39698];
    v12[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    v5 = 0;
    v6 = (void *)v7;
  }
  v8 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)self externalResultHandler];
  ((void (**)(void, void *, void *))v8)[2](v8, v5, v6);

  id internalResultHandler = self->_internalResultHandler;
  self->_id internalResultHandler = 0;
}

- (void)updateSimulationWithProgress:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderImageDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  v5 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)self externalProgressHandler];

  if (v5)
  {
    char v7 = 0;
    v6 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)self externalProgressHandler];
    ((void (**)(void, void, char *, void, double))v6)[2](v6, 0, &v7, 0, a3);
  }
}

- (void)_handleResultImage:(id)a3 info:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  char v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  char v8 = [v7 BOOLValue];

  v9 = (void *)MEMORY[0x1E4F8B938];
  objc_super v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F396E8]];
  uint64_t v11 = objc_msgSend(v9, "formatWithID:", (unsigned __int16)objc_msgSend(v10, "integerValue"));

  int v12 = [v11 isThumbnail];
  if ((v8 & 1) != 0 || v12)
  {
    v13 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)self externalResultHandler];
    ((void (**)(void, id, id))v13)[2](v13, v14, v6);
  }
  else
  {
    [(PUPhotoKitMediaProviderImageDownloadSimulation *)self _setResultImage:v14];
    [(PUPhotoKitMediaProviderImageDownloadSimulation *)self _setResultInfo:v6];
    [(PUPhotoKitMediaProviderDownloadSimulation *)self beginSimulation];
  }
}

- (PUPhotoKitMediaProviderImageDownloadSimulation)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderImageDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PUPhotoKitMediaProviderImageDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E5F29C60;
    id v4 = v2;
    v9 = v4;
    uint64_t v5 = [v8 copy];
    id internalResultHandler = v4->_internalResultHandler;
    v4->_id internalResultHandler = (id)v5;
  }
  return v3;
}

uint64_t __54__PUPhotoKitMediaProviderImageDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResultImage:a2 info:a3];
}

@end