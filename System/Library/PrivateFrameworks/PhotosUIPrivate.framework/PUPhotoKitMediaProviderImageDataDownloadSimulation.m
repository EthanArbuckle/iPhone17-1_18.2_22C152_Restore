@interface PUPhotoKitMediaProviderImageDataDownloadSimulation
- (NSData)_resultImageData;
- (NSDictionary)_resultInfo;
- (NSString)_resultDataUTI;
- (PUPhotoKitMediaProviderImageDataDownloadSimulation)init;
- (id)externalProgressHandler;
- (id)externalResultHandler;
- (id)internalProgressHandler;
- (id)internalResultHandler;
- (int64_t)_resultOrientaton;
- (void)_handleResultImageData:(id)a3 dataUTI:(id)a4 orientation:(int64_t)a5 info:(id)a6;
- (void)_setResultDataUTI:(id)a3;
- (void)_setResultImageData:(id)a3;
- (void)_setResultInfo:(id)a3;
- (void)_setResultOrientation:(int64_t)a3;
- (void)endSimulationWithError:(id)a3;
- (void)setExternalProgressHandler:(id)a3;
- (void)setExternalResultHandler:(id)a3;
- (void)updateSimulationWithProgress:(double)a3;
@end

@implementation PUPhotoKitMediaProviderImageDataDownloadSimulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultDataUTI, 0);
  objc_storeStrong((id *)&self->__resultImageData, 0);
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

- (void)_setResultOrientation:(int64_t)a3
{
  self->__resultOrientaton = a3;
}

- (int64_t)_resultOrientaton
{
  return self->__resultOrientaton;
}

- (void)_setResultDataUTI:(id)a3
{
}

- (NSString)_resultDataUTI
{
  return self->__resultDataUTI;
}

- (void)_setResultImageData:(id)a3
{
}

- (NSData)_resultImageData
{
  return self->__resultImageData;
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
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoKitMediaProviderImageDataDownloadSimulation;
  [(PUPhotoKitMediaProviderDownloadSimulation *)&v12 endSimulationWithError:v4];
  v5 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _resultImageData];
  v6 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _resultDataUTI];
  int64_t v7 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _resultOrientaton];
  v8 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _resultInfo];
  if (v4)
  {

    uint64_t v13 = *MEMORY[0x1E4F39698];
    v14[0] = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

    v5 = 0;
    v8 = (void *)v9;
  }
  v10 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self externalResultHandler];
  ((void (**)(void, void *, void *, int64_t, void *))v10)[2](v10, v5, v6, v7, v8);

  id internalResultHandler = self->_internalResultHandler;
  self->_id internalResultHandler = 0;
}

- (void)updateSimulationWithProgress:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderImageDataDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  v5 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self externalProgressHandler];

  if (v5)
  {
    char v7 = 0;
    v6 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self externalProgressHandler];
    ((void (**)(void, void, char *, void, double))v6)[2](v6, 0, &v7, 0, a3);
  }
}

- (void)_handleResultImageData:(id)a3 dataUTI:(id)a4 orientation:(int64_t)a5 info:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _setResultImageData:a3];
  [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _setResultDataUTI:v11];

  [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _setResultOrientation:a5];
  [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)self _setResultInfo:v10];

  [(PUPhotoKitMediaProviderDownloadSimulation *)self beginSimulation];
}

- (PUPhotoKitMediaProviderImageDataDownloadSimulation)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderImageDataDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PUPhotoKitMediaProviderImageDataDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E5F29C88;
    id v4 = v2;
    uint64_t v9 = v4;
    uint64_t v5 = [v8 copy];
    id internalResultHandler = v4->_internalResultHandler;
    v4->_id internalResultHandler = (id)v5;
  }
  return v3;
}

uint64_t __58__PUPhotoKitMediaProviderImageDataDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleResultImageData:a2 dataUTI:a3 orientation:a4 info:a5];
}

@end