@interface PXCPLStatusSource
- (BOOL)isCapturingSnapshot;
- (BOOL)isCellularDataDisabled;
- (BOOL)isClientNotAuthenticated;
- (BOOL)isClientVersionTooOld;
- (BOOL)isExceedingBatteryQuota;
- (BOOL)isExceedingCellularQuota;
- (BOOL)isExceedingQuota;
- (BOOL)isExceedingSharedLibraryQuota;
- (BOOL)isInAirplaneMode;
- (BOOL)isInHeavyThermalPressure;
- (BOOL)isInLowBattery;
- (BOOL)isInLowDataMode;
- (BOOL)isInLowPowerMode;
- (BOOL)isInModerateThermalPressure;
- (BOOL)isInPoorNetworkConnection;
- (BOOL)isLowDiskSpace;
- (BOOL)isOffline;
- (BOOL)isOptimizingSystemPerformance;
- (BOOL)isUpgradeSuggestedToAccessAllPhotos;
- (BOOL)isVeryLowDiskSpace;
- (NSDate)exitDate;
- (NSDate)syncDate;
- (PXCPLStatusSource)initWithStatus:(id)a3;
- (unint64_t)numberOfOtherAssets;
- (unint64_t)numberOfPhotoAssets;
- (unint64_t)numberOfVideoAssets;
- (unint64_t)sharedLibraryExitingWithNumberOfAssetsRemaining;
- (void)_updateStatus;
- (void)setExitDate:(id)a3;
- (void)setIsCapturingSnapshot:(BOOL)a3;
- (void)setIsCellularDataDisabled:(BOOL)a3;
- (void)setIsClientNotAuthenticated:(BOOL)a3;
- (void)setIsClientVersionTooOld:(BOOL)a3;
- (void)setIsExceedingBatteryQuota:(BOOL)a3;
- (void)setIsExceedingCellularQuota:(BOOL)a3;
- (void)setIsExceedingQuota:(BOOL)a3;
- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3;
- (void)setIsInAirplaneMode:(BOOL)a3;
- (void)setIsInHeavyThermalPressure:(BOOL)a3;
- (void)setIsInLowBattery:(BOOL)a3;
- (void)setIsInLowDataMode:(BOOL)a3;
- (void)setIsInLowPowerMode:(BOOL)a3;
- (void)setIsInModerateThermalPressure:(BOOL)a3;
- (void)setIsInPoorNetworkConnection:(BOOL)a3;
- (void)setIsLowDiskSpace:(BOOL)a3;
- (void)setIsOffline:(BOOL)a3;
- (void)setIsOptimizingSystemPerformance:(BOOL)a3;
- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3;
- (void)setIsVeryLowDiskSpace:(BOOL)a3;
- (void)setNumberOfOtherAssets:(unint64_t)a3;
- (void)setNumberOfPhotoAssets:(unint64_t)a3;
- (void)setNumberOfVideoAssets:(unint64_t)a3;
- (void)setSharedLibraryExitingWithNumberOfAssetsRemaining:(unint64_t)a3;
- (void)setSyncDate:(id)a3;
- (void)statusDidChange:(id)a3;
@end

@implementation PXCPLStatusSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDate, 0);
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (unint64_t)numberOfOtherAssets
{
  return self->_numberOfOtherAssets;
}

- (unint64_t)numberOfVideoAssets
{
  return self->_numberOfVideoAssets;
}

- (unint64_t)numberOfPhotoAssets
{
  return self->_numberOfPhotoAssets;
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return self->_isUpgradeSuggestedToAccessAllPhotos;
}

- (BOOL)isInLowBattery
{
  return self->_isInLowBattery;
}

- (BOOL)isInHeavyThermalPressure
{
  return self->_isInHeavyThermalPressure;
}

- (BOOL)isInModerateThermalPressure
{
  return self->_isInModerateThermalPressure;
}

- (BOOL)isInPoorNetworkConnection
{
  return self->_isInPoorNetworkConnection;
}

- (BOOL)isOptimizingSystemPerformance
{
  return self->_isOptimizingSystemPerformance;
}

- (BOOL)isCapturingSnapshot
{
  return self->_isCapturingSnapshot;
}

- (unint64_t)sharedLibraryExitingWithNumberOfAssetsRemaining
{
  return self->_sharedLibraryExitingWithNumberOfAssetsRemaining;
}

- (BOOL)isVeryLowDiskSpace
{
  return self->_isVeryLowDiskSpace;
}

- (BOOL)isLowDiskSpace
{
  return self->_isLowDiskSpace;
}

- (BOOL)isInLowPowerMode
{
  return self->_isInLowPowerMode;
}

- (BOOL)isInLowDataMode
{
  return self->_isInLowDataMode;
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (BOOL)isInAirplaneMode
{
  return self->_isInAirplaneMode;
}

- (BOOL)isCellularDataDisabled
{
  return self->_isCellularDataDisabled;
}

- (BOOL)isExceedingCellularQuota
{
  return self->_isExceedingCellularQuota;
}

- (BOOL)isExceedingBatteryQuota
{
  return self->_isExceedingBatteryQuota;
}

- (BOOL)isClientNotAuthenticated
{
  return self->_isClientNotAuthenticated;
}

- (BOOL)isClientVersionTooOld
{
  return self->_isClientVersionTooOld;
}

- (BOOL)isExceedingSharedLibraryQuota
{
  return self->_isExceedingSharedLibraryQuota;
}

- (BOOL)isExceedingQuota
{
  return self->_isExceedingQuota;
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (void)statusDidChange:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__PXCPLStatusSource_statusDidChange___block_invoke;
  v3[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __37__PXCPLStatusSource_statusDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStatus];
}

- (void)_updateStatus
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__PXCPLStatusSource__updateStatus__block_invoke;
  v2[3] = &unk_1E5DAF758;
  v2[4] = self;
  [(PXCPLStatusSource *)self performChanges:v2];
}

void __34__PXCPLStatusSource__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 96) exitDeleteTime];
  [v3 setExitDate:v4];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 96) initialSyncDate];
  if (v5
    && (v6 = (void *)v5,
        [*(id *)(*(void *)(a1 + 32) + 96) lastSuccessfulSyncDate],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [*(id *)(*(void *)(a1 + 32) + 96) initialSyncDate];
    v9 = [*(id *)(*(void *)(a1 + 32) + 96) lastSuccessfulSyncDate];
    v10 = [v8 laterDate:v9];
    [v3 setSyncDate:v10];
  }
  else
  {
    v8 = [*(id *)(*(void *)(a1 + 32) + 96) initialSyncDate];
    [v3 setSyncDate:v8];
  }

  int v11 = [*(id *)(*(void *)(a1 + 32) + 96) isExceedingQuota];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 96) isExceedingSharedLibraryQuota];
  [v3 setIsExceedingQuota:v11 & (v12 ^ 1)];
  [v3 setIsExceedingSharedLibraryQuota:v12];
  objc_msgSend(v3, "setIsClientVersionTooOld:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "iCloudLibraryClientVersionTooOld"));
  objc_msgSend(v3, "setIsClientNotAuthenticated:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "iCloudLibraryClientIsNotAuthenticated"));
  if ([*(id *)(*(void *)(a1 + 32) + 96) hasValidSystemBudget])
  {
    objc_msgSend(v3, "setIsExceedingBatteryQuota:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasBatteryBudget") ^ 1);
    uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 96) hasCellularBudget] ^ 1;
  }
  else
  {
    [v3 setIsExceedingBatteryQuota:0];
    uint64_t v13 = 0;
  }
  [v3 setIsExceedingCellularQuota:v13];
  objc_msgSend(v3, "setIsCellularDataDisabled:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "isCellularRestricted"));
  objc_msgSend(v3, "setIsInAirplaneMode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "isInAirplaneMode"));
  objc_msgSend(v3, "setIsOffline:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "isConnectedToNetwork") ^ 1);
  objc_msgSend(v3, "setIsInLowDataMode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "isConstrainedNetwork"));
  objc_msgSend(v3, "setIsInLowPowerMode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "isBlockedByLowPowerMode"));
  objc_msgSend(v3, "setIsLowDiskSpace:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "lowDiskSpace"));
  objc_msgSend(v3, "setIsVeryLowDiskSpace:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "veryLowDiskSpace"));
  objc_msgSend(v3, "setSharedLibraryExitingWithNumberOfAssetsRemaining:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "estimatedCountOfRemainingRecordsDuringSharedLibraryExit"));
  objc_msgSend(v3, "setIsCapturingSnapshot:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "isBlockedBySnapshot"));
  objc_msgSend(v3, "setIsOptimizingSystemPerformance:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasHeavyResourceUsage") | objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasPoorSystemConditions"));
  objc_msgSend(v3, "setIsInPoorNetworkConnection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasPoorNetworkQuality"));
  objc_msgSend(v3, "setIsInModerateThermalPressure:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasModerateThermalPressure"));
  objc_msgSend(v3, "setIsInHeavyThermalPressure:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasThermalPressure"));
  objc_msgSend(v3, "setIsInLowBattery:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "hasLowBatteryLevel"));
  objc_msgSend(v3, "setIsUpgradeSuggestedToAccessAllPhotos:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "clientFeatureCompatibleVersion") < objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "serverFeatureCompatibleVersion"));
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v14 = [*(id *)(*(void *)(a1 + 32) + 96) cloudAssetCountPerType];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__PXCPLStatusSource__updateStatus__block_invoke_2;
  v15[3] = &unk_1E5DAF730;
  v15[4] = &v24;
  v15[5] = &v20;
  v15[6] = &v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v15];
  [v3 setNumberOfPhotoAssets:v25[3]];
  [v3 setNumberOfVideoAssets:v21[3]];
  [v3 setNumberOfOtherAssets:v17[3]];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __34__PXCPLStatusSource__updateStatus__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = [a3 unsignedIntegerValue];
  v6 = [(id)*MEMORY[0x1E4F44400] identifier];
  int v7 = [v11 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = a1 + 32;
  }
  else
  {
    v9 = [(id)*MEMORY[0x1E4F44448] identifier];
    int v10 = [v11 isEqualToString:v9];

    if (v10) {
      uint64_t v8 = a1 + 40;
    }
    else {
      uint64_t v8 = a1 + 48;
    }
  }
  *(void *)(*(void *)(*(void *)v8 + 8) + 24) += v5;
}

- (void)setNumberOfOtherAssets:(unint64_t)a3
{
  if (self->_numberOfOtherAssets != a3)
  {
    self->_numberOfOtherAssets = a3;
    [(PXCPLStatusSource *)self signalChange:0x2000000];
  }
}

- (void)setNumberOfVideoAssets:(unint64_t)a3
{
  if (self->_numberOfVideoAssets != a3)
  {
    self->_numberOfVideoAssets = a3;
    [(PXCPLStatusSource *)self signalChange:0x1000000];
  }
}

- (void)setNumberOfPhotoAssets:(unint64_t)a3
{
  if (self->_numberOfPhotoAssets != a3)
  {
    self->_numberOfPhotoAssets = a3;
    [(PXCPLStatusSource *)self signalChange:0x800000];
  }
}

- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  if (self->_isUpgradeSuggestedToAccessAllPhotos != a3)
  {
    self->_isUpgradeSuggestedToAccessAllPhotos = a3;
    [(PXCPLStatusSource *)self signalChange:0x400000];
  }
}

- (void)setIsInLowBattery:(BOOL)a3
{
  if (self->_isInLowBattery != a3)
  {
    self->_isInLowBattery = a3;
    [(PXCPLStatusSource *)self signalChange:0x200000];
  }
}

- (void)setIsInHeavyThermalPressure:(BOOL)a3
{
  if (self->_isInHeavyThermalPressure != a3)
  {
    self->_isInHeavyThermalPressure = a3;
    [(PXCPLStatusSource *)self signalChange:0x100000];
  }
}

- (void)setIsInModerateThermalPressure:(BOOL)a3
{
  if (self->_isInModerateThermalPressure != a3)
  {
    self->_isInModerateThermalPressure = a3;
    [(PXCPLStatusSource *)self signalChange:0x80000];
  }
}

- (void)setIsInPoorNetworkConnection:(BOOL)a3
{
  if (self->_isInPoorNetworkConnection != a3)
  {
    self->_isInPoorNetworkConnection = a3;
    [(PXCPLStatusSource *)self signalChange:0x40000];
  }
}

- (void)setIsOptimizingSystemPerformance:(BOOL)a3
{
  if (self->_isOptimizingSystemPerformance != a3)
  {
    self->_isOptimizingSystemPerformance = a3;
    [(PXCPLStatusSource *)self signalChange:0x20000];
  }
}

- (void)setIsCapturingSnapshot:(BOOL)a3
{
  if (self->_isCapturingSnapshot != a3)
  {
    self->_isCapturingSnapshot = a3;
    [(PXCPLStatusSource *)self signalChange:0x10000];
  }
}

- (void)setSharedLibraryExitingWithNumberOfAssetsRemaining:(unint64_t)a3
{
  if (self->_sharedLibraryExitingWithNumberOfAssetsRemaining != a3)
  {
    self->_sharedLibraryExitingWithNumberOfAssetsRemaining = a3;
    [(PXCPLStatusSource *)self signalChange:0x8000];
  }
}

- (void)setIsVeryLowDiskSpace:(BOOL)a3
{
  if (self->_isVeryLowDiskSpace != a3)
  {
    self->_isVeryLowDiskSpace = a3;
    [(PXCPLStatusSource *)self signalChange:0x4000];
  }
}

- (void)setIsLowDiskSpace:(BOOL)a3
{
  if (self->_isLowDiskSpace != a3)
  {
    self->_isLowDiskSpace = a3;
    [(PXCPLStatusSource *)self signalChange:0x2000];
  }
}

- (void)setIsInLowPowerMode:(BOOL)a3
{
  if (self->_isInLowPowerMode != a3)
  {
    self->_isInLowPowerMode = a3;
    [(PXCPLStatusSource *)self signalChange:4096];
  }
}

- (void)setIsInLowDataMode:(BOOL)a3
{
  if (self->_isInLowDataMode != a3)
  {
    self->_isInLowDataMode = a3;
    [(PXCPLStatusSource *)self signalChange:2048];
  }
}

- (void)setIsOffline:(BOOL)a3
{
  if (self->_isOffline != a3)
  {
    self->_isOffline = a3;
    [(PXCPLStatusSource *)self signalChange:1024];
  }
}

- (void)setIsInAirplaneMode:(BOOL)a3
{
  if (self->_isInAirplaneMode != a3)
  {
    self->_isInAirplaneMode = a3;
    [(PXCPLStatusSource *)self signalChange:512];
  }
}

- (void)setIsCellularDataDisabled:(BOOL)a3
{
  if (self->_isCellularDataDisabled != a3)
  {
    self->_isCellularDataDisabled = a3;
    [(PXCPLStatusSource *)self signalChange:256];
  }
}

- (void)setIsExceedingCellularQuota:(BOOL)a3
{
  if (self->_isExceedingCellularQuota != a3)
  {
    self->_isExceedingCellularQuota = a3;
    [(PXCPLStatusSource *)self signalChange:128];
  }
}

- (void)setIsExceedingBatteryQuota:(BOOL)a3
{
  if (self->_isExceedingBatteryQuota != a3)
  {
    self->_isExceedingBatteryQuota = a3;
    [(PXCPLStatusSource *)self signalChange:64];
  }
}

- (void)setIsClientNotAuthenticated:(BOOL)a3
{
  if (self->_isClientNotAuthenticated != a3)
  {
    self->_isClientNotAuthenticated = a3;
    [(PXCPLStatusSource *)self signalChange:32];
  }
}

- (void)setIsClientVersionTooOld:(BOOL)a3
{
  if (self->_isClientVersionTooOld != a3)
  {
    self->_isClientVersionTooOld = a3;
    [(PXCPLStatusSource *)self signalChange:16];
  }
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  if (self->_isExceedingSharedLibraryQuota != a3)
  {
    self->_isExceedingSharedLibraryQuota = a3;
    [(PXCPLStatusSource *)self signalChange:8];
  }
}

- (void)setIsExceedingQuota:(BOOL)a3
{
  if (self->_isExceedingQuota != a3)
  {
    self->_isExceedingQuota = a3;
    [(PXCPLStatusSource *)self signalChange:4];
  }
}

- (void)setSyncDate:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  id v4 = self->_syncDate;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDate *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSDate *)[(NSDate *)v8 copy];
      syncDate = self->_syncDate;
      self->_syncDate = v6;

      [(PXCPLStatusSource *)self signalChange:2];
    }
  }
}

- (void)setExitDate:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  id v4 = self->_exitDate;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDate *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSDate *)[(NSDate *)v8 copy];
      exitDate = self->_exitDate;
      self->_exitDate = v6;

      [(PXCPLStatusSource *)self signalChange:1];
    }
  }
}

- (PXCPLStatusSource)initWithStatus:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCPLStatusSource.m", 26, @"Invalid parameter not satisfying: %@", @"status" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXCPLStatusSource;
  int v7 = [(PXCPLStatusSource *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_status, a3);
    [(CPLStatus *)v8->_status setDelegate:v8];
    [(PXCPLStatusSource *)v8 _updateStatus];
  }

  return v8;
}

@end