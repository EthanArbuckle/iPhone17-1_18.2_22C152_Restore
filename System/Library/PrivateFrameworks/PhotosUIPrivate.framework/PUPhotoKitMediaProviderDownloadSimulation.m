@interface PUPhotoKitMediaProviderDownloadSimulation
- (BOOL)shouldSimulateFailure;
- (PUPhotoKitMediaProviderDownloadSimulation)init;
- (double)_simulatedProgress;
- (double)_updateInterval;
- (double)downloadDuration;
- (void)_setSimulatedProgress:(double)a3;
- (void)_updateSimulatedDownload;
- (void)beginSimulation;
- (void)setDownloadDuration:(double)a3;
- (void)setShouldSimulateFailure:(BOOL)a3;
@end

@implementation PUPhotoKitMediaProviderDownloadSimulation

- (void)_setSimulatedProgress:(double)a3
{
  self->__simulatedProgress = a3;
}

- (double)_simulatedProgress
{
  return self->__simulatedProgress;
}

- (double)_updateInterval
{
  return self->__updateInterval;
}

- (void)setDownloadDuration:(double)a3
{
  self->_downloadDuration = a3;
}

- (double)downloadDuration
{
  return self->_downloadDuration;
}

- (void)setShouldSimulateFailure:(BOOL)a3
{
  self->_shouldSimulateFailure = a3;
}

- (BOOL)shouldSimulateFailure
{
  return self->_shouldSimulateFailure;
}

- (void)_updateSimulatedDownload
{
  v18[1] = *MEMORY[0x1E4F143B8];
  [(PUPhotoKitMediaProviderDownloadSimulation *)self _simulatedProgress];
  double v5 = v4;
  [(PUPhotoKitMediaProviderDownloadSimulation *)self _updateInterval];
  double v7 = v6;
  [(PUPhotoKitMediaProviderDownloadSimulation *)self downloadDuration];
  double v9 = v5 + v7 / v8;
  if (v9 <= 1.0) {
    double v10 = v9;
  }
  else {
    double v10 = 1.0;
  }
  [(PUPhotoKitMediaProviderDownloadSimulation *)self _setSimulatedProgress:v10];
  [(PUPhotoKitMediaProviderDownloadSimulation *)self updateSimulationWithProgress:v10];
  BOOL v11 = [(PUPhotoKitMediaProviderDownloadSimulation *)self shouldSimulateFailure];
  double v12 = 0.75;
  if (!v11) {
    double v12 = 1.0;
  }
  if (v10 >= v12)
  {
    if ([(PUPhotoKitMediaProviderDownloadSimulation *)self shouldSimulateFailure])
    {
      v16 = PLUIGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "One Up: Simulating failure because of debug 1-up settings", v17, 2u);
      }

      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PUPhotoKitMediaProviderImageDownloadSimulation" code:1 userInfo:0];
    }
    else
    {
      v15 = 0;
    }
    [(PUPhotoKitMediaProviderDownloadSimulation *)self endSimulationWithError:v15];
  }
  else
  {
    [(PUPhotoKitMediaProviderDownloadSimulation *)self _updateInterval];
    double v14 = v13;
    v18[0] = *MEMORY[0x1E4F1C4B0];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(PUPhotoKitMediaProviderDownloadSimulation *)self performSelector:a2 withObject:self afterDelay:v15 inModes:v14];
  }
}

- (void)beginSimulation
{
  [(PUPhotoKitMediaProviderDownloadSimulation *)self _setSimulatedProgress:0.0];
  [(PUPhotoKitMediaProviderDownloadSimulation *)self _updateSimulatedDownload];
}

- (PUPhotoKitMediaProviderDownloadSimulation)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoKitMediaProviderDownloadSimulation;
  v2 = [(PUPhotoKitMediaProviderDownloadSimulation *)&v6 init];
  if (v2)
  {
    v3 = +[PUOneUpSettings sharedInstance];
    v2->_shouldSimulateFailure = [v3 simulateLoadingError];
    [v3 simulatedAssetContentLoadingDuration];
    v2->_downloadDuration = v4;
    v2->__updateInterval = 0.25;
  }
  return v2;
}

@end