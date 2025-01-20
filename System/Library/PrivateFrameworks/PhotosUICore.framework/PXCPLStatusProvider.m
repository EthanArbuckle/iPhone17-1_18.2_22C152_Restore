@interface PXCPLStatusProvider
+ (id)sharedQueue;
- (PXCPLStatus)status;
- (PXCPLStatusProvider)init;
- (PXCPLStatusProvider)initWithPhotoLibrary:(id)a3;
- (double)nextOverrideResumeTimeInterval;
- (id)_updateStatus:(id)a3 requestedTypes:(unint64_t)a4;
- (void)_main_handleUpdatedStatus:(id)a3 producedForUpdateType:(unint64_t)a4 timeIntervalProducingUpdatedStatus:(double)a5;
- (void)_performUpdate;
- (void)_queue_performUpdateWithStatus:(id)a3 updateType:(unint64_t)a4;
- (void)_schedulePendingUpdates;
- (void)_scheduleUpdateForType:(unint64_t)a3;
- (void)_setStatus:(id)a3 producedForUpdateType:(unint64_t)a4 timeIntervalProducingUpdatedStatus:(double)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXCPLStatusProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_premiumOfferProvider, 0);
  objc_storeStrong((id *)&self->_offerProvider, 0);
  objc_storeStrong((id *)&self->_cloudQuotaSource, 0);
  objc_storeStrong((id *)&self->_numberOfReferencedItemsObserver, 0);
  objc_storeStrong((id *)&self->_sharedLibraryActivity, 0);
  objc_storeStrong((id *)&self->_syncActivity, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
  objc_storeStrong((id *)&self->_cplStatusSource, 0);
  objc_storeStrong((id *)&self->_serialUpdateQueue, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (PXCPLStatus)status
{
  return self->_status;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXCPLPhotoLibrarySourceObservationContext == a5)
  {
    if ((v6 & 0xF) != 0)
    {
      id v13 = v9;
      uint64_t v11 = 1;
    }
    else
    {
      if ((v6 & 0x10) == 0) {
        goto LABEL_24;
      }
      id v13 = v9;
      uint64_t v11 = 16;
    }
  }
  else if ((void *)PXCPLStatusSourceObservationContext == a5)
  {
    id v13 = v9;
    uint64_t v11 = 2;
  }
  else if ((void *)PXCPLSyncActivityObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_24;
    }
    id v13 = v9;
    uint64_t v11 = 512;
  }
  else if ((void *)PXCPLSharedLibraryActivityObservationContext == a5)
  {
    if ((v6 & 7) == 0) {
      goto LABEL_24;
    }
    id v13 = v9;
    uint64_t v11 = 2048;
  }
  else
  {
    if ((void *)PXCPLCloudQuotaSourceObservationContext == a5)
    {
      if ((v6 & 0xF) == 0) {
        goto LABEL_24;
      }
      id v13 = v9;
    }
    else
    {
      id v13 = v9;
      if ((void *)PXCloudQuotaOfferProviderObservationContext == a5)
      {
        v10 = [(PXCloudQuotaOfferProvider *)self->_offerProvider offer];
      }
      else
      {
        if ((void *)PXCloudQuotaPremiumOfferProviderObservationContext != a5)
        {
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:a2 object:self file:@"PXCPLStatusProvider.m" lineNumber:673 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        v10 = [(PXCloudQuotaPremiumOfferProvider *)self->_premiumOfferProvider premiumOffer];
      }
      self->_hasCloudQuotaOffer = v10 != 0;
    }
    uint64_t v11 = 128;
  }
  [(PXCPLStatusProvider *)self _scheduleUpdateForType:v11];
  id v9 = v13;
LABEL_24:
}

- (void)_scheduleUpdateForType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXCPLStatusProvider.m", 575, @"Invalid parameter not satisfying: %@", @"updateType != PXCPLStatusUpdateTypeNone" object file lineNumber description];
  }
  char v6 = PLUserStatusGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = PXCPLStatusUpdateTypeDebugDescription(a3);
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%@ Request update [reason: %{public}@]", buf, 0x16u);
  }
  self->_needsUpdate |= a3;
  [(PXCPLStatusProvider *)self _schedulePendingUpdates];
}

- (void)_schedulePendingUpdates
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdate && !self->_isUpdating)
  {
    self->_isUpdating = 1;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = self->_lastUpdate + 1.0 - v3;
    if (v4 <= 0.0)
    {
      [(PXCPLStatusProvider *)self _performUpdate];
    }
    else
    {
      v5 = PLUserStatusGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v10 = self;
        __int16 v11 = 2048;
        double v12 = v4;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%@ - Delaying update: %.2fs", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__PXCPLStatusProvider__schedulePendingUpdates__block_invoke;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v8, (id *)buf);
      dispatch_after(v6, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __46__PXCPLStatusProvider__schedulePendingUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performUpdate];
}

- (void)_main_handleUpdatedStatus:(id)a3 producedForUpdateType:(unint64_t)a4 timeIntervalProducingUpdatedStatus:(double)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __106__PXCPLStatusProvider__main_handleUpdatedStatus_producedForUpdateType_timeIntervalProducingUpdatedStatus___block_invoke;
  uint64_t v13 = &unk_1E5DAF590;
  v14 = self;
  id v15 = v8;
  unint64_t v16 = a4;
  double v17 = a5;
  id v9 = v8;
  [(PXCPLStatusProvider *)self performChanges:&v10];
  self->_isUpdating = 0;
  [(PXCPLStatusProvider *)self _schedulePendingUpdates];
}

uint64_t __106__PXCPLStatusProvider__main_handleUpdatedStatus_producedForUpdateType_timeIntervalProducingUpdatedStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatus:*(void *)(a1 + 40) producedForUpdateType:*(void *)(a1 + 48) timeIntervalProducingUpdatedStatus:*(double *)(a1 + 56)];
}

- (void)_queue_performUpdateWithStatus:(id)a3 updateType:(unint64_t)a4
{
  serialUpdateQueue = self->_serialUpdateQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(serialUpdateQueue);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  uint64_t v10 = [(PXCPLStatusProvider *)self _updateStatus:v7 requestedTypes:a4];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v12 = v11 - v9;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXCPLStatusProvider__queue_performUpdateWithStatus_updateType___block_invoke;
  block[3] = &unk_1E5DB9660;
  objc_copyWeak(v16, &location);
  id v15 = v10;
  v16[1] = (id)a4;
  v16[2] = *(id *)&v12;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __65__PXCPLStatusProvider__queue_performUpdateWithStatus_updateType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_main_handleUpdatedStatus:producedForUpdateType:timeIntervalProducingUpdatedStatus:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_performUpdate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    double v4 = PXCPLStatusUpdateTypeDebugDescription(self->_needsUpdate);
    *(_DWORD *)buf = 138412546;
    unint64_t v16 = self;
    __int16 v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%@ Perform update [reason: %{public}@]", buf, 0x16u);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastUpdate = v5;
  needsUpdate = (void *)self->_needsUpdate;
  self->_needsUpdate = 0;
  id v7 = [(PXCPLStatusProvider *)self status];
  double v8 = (void *)[v7 copy];

  objc_initWeak((id *)buf, self);
  serialUpdateQueue = self->_serialUpdateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PXCPLStatusProvider__performUpdate__block_invoke;
  block[3] = &unk_1E5DCCBD8;
  objc_copyWeak(v14, (id *)buf);
  id v13 = v8;
  v14[1] = needsUpdate;
  id v10 = v8;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(serialUpdateQueue, v11);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __37__PXCPLStatusProvider__performUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_performUpdateWithStatus:updateType:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

- (double)nextOverrideResumeTimeInterval
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39228] nextOverrideTimeIntervalForSystemBudgets:18487];
  double v4 = v3;
  double v5 = PLUserStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    double v8 = self;
    __int16 v9 = 2048;
    double v10 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%@ < Did get next override time interval: %f", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)_updateStatus:(id)a3 requestedTypes:(unint64_t)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = v7;
  if (!a4)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCPLStatusProvider.m", 286, @"Invalid parameter not satisfying: %@", @"updateType != PXCPLStatusUpdateTypeNone" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    __int16 v9 = objc_alloc_init(PXCPLStatus);
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  __int16 v9 = (PXCPLStatus *)[v8 copy];
LABEL_6:
  uint64_t v11 = v9;
  if ((a4 & 1) != 0 && v9)
  {
    double v12 = PLUserStatusGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "%@ > Will update PhotoLibrary", buf, 0xCu);
    }

    [(PXCPLStatus *)v11 setIsEnabled:[(PXCPLPhotoLibrarySource *)self->_photoLibrarySource isCloudPhotosEnabled]];
    [(PXCPLStatus *)v11 setIsLocalModeEnabled:[(PXCPLPhotoLibrarySource *)self->_photoLibrarySource isLocalModeEnabled]];
    [(PXCPLPhotoLibrarySource *)self->_photoLibrarySource fractionCompletedForRebuild];
    -[PXCPLStatus setFractionCompletedForLibraryRebuild:](v11, "setFractionCompletedForLibraryRebuild:");
    [(PXCPLStatus *)v11 setIsRebuildingThumbnails:[(PXCPLPhotoLibrarySource *)self->_photoLibrarySource isRebuildingThumbnails]];
    id v13 = PLUserStatusGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "%@ < Did update PhotoLibrary", buf, 0xCu);
    }
  }
  if ((a4 & 2) != 0 && v11)
  {
    BOOL v14 = self->_cplStatusSource == 0;
    id v15 = PLUserStatusGetLog();
    unint64_t v16 = v15;
    if (v14)
    {
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

        goto LABEL_24;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      uint64_t v19 = "%{public}@ Failed to get CPL status: No PXCPLStatusSource";
      v20 = v16;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "%@ > Will update CPLStatus", buf, 0xCu);
      }

      __int16 v17 = [(PXCPLStatusSource *)self->_cplStatusSource exitDate];
      [(PXCPLStatus *)v11 setExitDate:v17];

      v18 = [(PXCPLStatusSource *)self->_cplStatusSource syncDate];
      [(PXCPLStatus *)v11 setSyncDate:v18];

      [(PXCPLStatus *)v11 setIsExceedingQuota:[(PXCPLStatusSource *)self->_cplStatusSource isExceedingQuota]];
      [(PXCPLStatus *)v11 setIsExceedingSharedLibraryQuota:[(PXCPLStatusSource *)self->_cplStatusSource isExceedingSharedLibraryQuota]];
      [(PXCPLStatus *)v11 setIsClientVersionTooOld:[(PXCPLStatusSource *)self->_cplStatusSource isClientVersionTooOld]];
      [(PXCPLStatus *)v11 setIsClientNotAuthenticated:[(PXCPLStatusSource *)self->_cplStatusSource isClientNotAuthenticated]];
      [(PXCPLStatus *)v11 setIsExceedingBatteryQuota:[(PXCPLStatusSource *)self->_cplStatusSource isExceedingBatteryQuota]];
      [(PXCPLStatus *)v11 setIsExceedingCellularQuota:[(PXCPLStatusSource *)self->_cplStatusSource isExceedingCellularQuota]];
      [(PXCPLStatus *)v11 setIsCellularDataDisabled:[(PXCPLStatusSource *)self->_cplStatusSource isCellularDataDisabled]];
      [(PXCPLStatus *)v11 setIsInAirplaneMode:[(PXCPLStatusSource *)self->_cplStatusSource isInAirplaneMode]];
      [(PXCPLStatus *)v11 setIsOffline:[(PXCPLStatusSource *)self->_cplStatusSource isOffline]];
      [(PXCPLStatus *)v11 setIsInLowDataMode:[(PXCPLStatusSource *)self->_cplStatusSource isInLowDataMode]];
      [(PXCPLStatus *)v11 setIsInLowPowerMode:[(PXCPLStatusSource *)self->_cplStatusSource isInLowPowerMode]];
      [(PXCPLStatus *)v11 setIsLowDiskSpace:[(PXCPLStatusSource *)self->_cplStatusSource isLowDiskSpace]];
      [(PXCPLStatus *)v11 setIsVeryLowDiskSpace:[(PXCPLStatusSource *)self->_cplStatusSource isVeryLowDiskSpace]];
      [(PXCPLStatus *)v11 setSharedLibraryExitingWithNumberOfAssetsRemaining:[(PXCPLStatusSource *)self->_cplStatusSource sharedLibraryExitingWithNumberOfAssetsRemaining]];
      [(PXCPLStatus *)v11 setIsCapturingSnapshot:[(PXCPLStatusSource *)self->_cplStatusSource isCapturingSnapshot]];
      [(PXCPLStatus *)v11 setIsOptimizingSystemPerformance:[(PXCPLStatusSource *)self->_cplStatusSource isOptimizingSystemPerformance]];
      [(PXCPLStatus *)v11 setIsInPoorNetworkConnection:[(PXCPLStatusSource *)self->_cplStatusSource isInPoorNetworkConnection]];
      [(PXCPLStatus *)v11 setIsInModerateThermalPressure:[(PXCPLStatusSource *)self->_cplStatusSource isInModerateThermalPressure]];
      [(PXCPLStatus *)v11 setIsInHeavyThermalPressure:[(PXCPLStatusSource *)self->_cplStatusSource isInHeavyThermalPressure]];
      [(PXCPLStatus *)v11 setIsInLowBattery:[(PXCPLStatusSource *)self->_cplStatusSource isInLowBattery]];
      [(PXCPLStatus *)v11 setIsUpgradeSuggestedToAccessAllPhotos:[(PXCPLStatusSource *)self->_cplStatusSource isUpgradeSuggestedToAccessAllPhotos]];
      [(PXCPLStatus *)v11 setNumberOfPhotoAssets:[(PXCPLStatusSource *)self->_cplStatusSource numberOfPhotoAssets]];
      [(PXCPLStatus *)v11 setNumberOfVideoAssets:[(PXCPLStatusSource *)self->_cplStatusSource numberOfVideoAssets]];
      [(PXCPLStatus *)v11 setNumberOfOtherAssets:[(PXCPLStatusSource *)self->_cplStatusSource numberOfOtherAssets]];
      unint64_t v16 = PLUserStatusGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      uint64_t v19 = "%@ < Did update CPLStatus";
      v20 = v16;
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl(&dword_1A9AE7000, v20, v21, v19, buf, 0xCu);
    goto LABEL_23;
  }
LABEL_24:
  if ((a4 & 4) != 0 && v11)
  {
    v22 = PLUserStatusGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEBUG, "%@ > Will update TransferCounts", buf, 0xCu);
    }

    *(void *)&long long v82 = 0;
    *(void *)v81 = 0;
    v23 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
    v24 = [v23 libraryBundle];
    v25 = [v24 indicatorFileCoordinator];

    [v25 getDownloadPhotoCount:&v82 downloadVideoCount:v81];
    [(PXCPLStatus *)v11 setNumberOfItemsToAdd:*(void *)v81 + (void)v82];
    v26 = PLUserStatusGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEBUG, "%@ < Did update TransferCounts", buf, 0xCu);
    }
  }
  if ((a4 & 8) != 0 && v11)
  {
    v27 = PLUserStatusGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_DEBUG, "%@ > Will update TransferBytes", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v86 = 0;
    *(void *)&long long v82 = 0;
    *((void *)&v82 + 1) = &v82;
    uint64_t v83 = 0x2020000000;
    int v84 = -1082130432;
    v28 = [(PXCPLStatus *)v11 exitDate];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      v32 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
      v33 = [v32 assetsdClient];
      v34 = [v33 cloudInternalClient];

      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke;
      v79[3] = &unk_1E5DAF568;
      v79[4] = self;
      v79[5] = buf;
      v79[6] = &v82;
      [v34 getCurrentTransferProgress:v79];
      [(PXCPLStatus *)v11 setNumberOfItemsToUpload:*(void *)(*(void *)&buf[8] + 24)];
      LODWORD(v35) = *(_DWORD *)(*((void *)&v82 + 1) + 24);
      [(PXCPLStatus *)v11 setFractionCompletedForUpload:v35];
    }
    else
    {
      v30 = PLUserStatusGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v81 = 138412290;
        *(void *)&v81[4] = self;
        _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEBUG, "%@ >> Ignoring upload counts when in exit mode", v81, 0xCu);
      }

      [(PXCPLStatus *)v11 setNumberOfItemsToUpload:*(void *)(*(void *)&buf[8] + 24)];
      LODWORD(v31) = *(_DWORD *)(*((void *)&v82 + 1) + 24);
      [(PXCPLStatus *)v11 setFractionCompletedForUpload:v31];
    }
    v36 = PLUserStatusGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v81 = 138412290;
      *(void *)&v81[4] = self;
      _os_log_impl(&dword_1A9AE7000, v36, OS_LOG_TYPE_DEBUG, "%@ < Did update TransferBytes", v81, 0xCu);
    }

    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(buf, 8);
  }
  if ((a4 & 0x10) != 0 && v11)
  {
    v37 = [(PXCPLPhotoLibrarySource *)self->_photoLibrarySource cplSettingsObserver];
    v38 = [v37 settings];
    int v39 = [v38 isKeepOriginalsEnabled];

    if (v39)
    {
      v40 = PLUserStatusGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_1A9AE7000, v40, OS_LOG_TYPE_DEBUG, "%@ > Will update NumberOfOriginals", buf, 0xCu);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v86 = 0;
      v41 = [(PHPhotoLibrary *)self->_photoLibrary managedObjectContextForCurrentQueueQoS];
      +[PXPhotosDataSource waitForAllBackgroundFetchingToFinish];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke_264;
      v76[3] = &unk_1E5DD0588;
      id v42 = v41;
      id v77 = v42;
      v78 = buf;
      [v42 performBlockAndWait:v76];
      uint64_t v43 = *(void *)(*(void *)&buf[8] + 24);
      v44 = PLUserStatusGetLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v82) = 138412290;
        *(void *)((char *)&v82 + 4) = self;
        _os_log_impl(&dword_1A9AE7000, v44, OS_LOG_TYPE_DEBUG, "%@ < Did update NumberOfOriginals", (uint8_t *)&v82, 0xCu);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v43 = 0;
    }
    [(PXCPLStatus *)v11 setNumberOfOriginalsToDownload:v43];
  }
  if ((a4 & 0x400) != 0 && v11)
  {
    v45 = PLUserStatusGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_DEBUG, "%@ > Will update ResetSyncState", buf, 0xCu);
    }

    v46 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
    v47 = [v46 assetsdClient];
    v48 = [v47 cloudInternalClient];

    id v75 = 0;
    uint64_t v49 = [v48 getResetSyncStatusWithError:&v75];
    id v50 = v75;
    if (v50)
    {
      v51 = PLUserStatusGetLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v50;
        _os_log_impl(&dword_1A9AE7000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cloud reset sync status %@", buf, 0x16u);
      }
    }
    else
    {
      switch(v49)
      {
        case 2:
          [(PXCPLStatus *)v11 setIsInSoftResetSync:0];
          [(PXCPLStatus *)v11 setIsInHardResetSync:1];
          break;
        case 1:
          [(PXCPLStatus *)v11 setIsInSoftResetSync:1];
          [(PXCPLStatus *)v11 setIsInHardResetSync:0];
          break;
        case 0:
          [(PXCPLStatus *)v11 setIsInSoftResetSync:0];
          [(PXCPLStatus *)v11 setIsInHardResetSync:0];
          break;
      }
    }
    v52 = PLUserStatusGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v52, OS_LOG_TYPE_DEBUG, "%@ < Did update ResetSyncState", buf, 0xCu);
    }
  }
  if ((a4 & 0x800) != 0 && v11)
  {
    v53 = PLUserStatusGetLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v53, OS_LOG_TYPE_DEBUG, "%@ > Will update SharedLibrary", buf, 0xCu);
    }

    [(PXCPLStatus *)v11 setSharedLibraryState:[(PXCPLSharedLibraryActivity *)self->_sharedLibraryActivity state]];
    [(PXCPLStatus *)v11 setSharedLibraryMovingToShared:[(PXCPLSharedLibraryActivity *)self->_sharedLibraryActivity movingToShared]];
    [(PXCPLStatus *)v11 setSharedLibraryMovingToPersonal:[(PXCPLSharedLibraryActivity *)self->_sharedLibraryActivity movingToPersonal]];
    v54 = PLUserStatusGetLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v54, OS_LOG_TYPE_DEBUG, "%@ < Did update SharedLibrary", buf, 0xCu);
    }
  }
  if (((v11 != 0) & _os_feature_enabled_impl() & (a4 >> 5)) == 1)
  {
    v55 = PLUserStatusGetLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v55, OS_LOG_TYPE_DEBUG, "%@ > Will update NumberOfFailures", buf, 0xCu);
    }

    v56 = (void *)MEMORY[0x1E4F28BA0];
    v57 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(cloudLocalState) IN %@", &unk_1F02D32C8];
    v80[0] = v57;
    v58 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAssetsEligibleForCloudKitTransport"), 0);
    v80[1] = v58;
    v59 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"trashedState", 2);
    v80[2] = v59;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
    v61 = [v56 andPredicateWithSubpredicates:v60];

    v62 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    [v62 setWantsIncrementalChangeDetails:0];
    [v62 setShouldPrefetchCount:1];
    [v62 setInternalPredicate:v61];
    v63 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v62];
    -[PXCPLStatus setNumberOfItemsFailingToUpload:](v11, "setNumberOfItemsFailingToUpload:", [v63 count]);
    v64 = PLUserStatusGetLog();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v64, OS_LOG_TYPE_DEBUG, "%@ < Did update NumberOfFailures", buf, 0xCu);
    }
  }
  if ((a4 & 0x80) != 0 && v11)
  {
    v65 = PLUserStatusGetLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v65, OS_LOG_TYPE_DEBUG, "%@ > Will update CloudQuota", buf, 0xCu);
    }

    [(PXCPLStatus *)v11 setHasCloudQuotaOffer:self->_hasCloudQuotaOffer];
    v66 = PLUserStatusGetLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v66, OS_LOG_TYPE_DEBUG, "%@ < Did update CloudQuota", buf, 0xCu);
    }
  }
  if ((a4 & 0x100) != 0 && v11)
  {
    v67 = PLUserStatusGetLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v67, OS_LOG_TYPE_DEBUG, "%@ > Will update PauseStates", buf, 0xCu);
    }

    v68 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
    v69 = [v68 libraryBundle];
    v70 = [v69 indicatorFileCoordinator];

    -[PXCPLStatus setIsUserPaused:](v11, "setIsUserPaused:", [v70 currentPauseReason] == 3);
    v71 = PLUserStatusGetLog();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v71, OS_LOG_TYPE_DEBUG, "%@ < Did update PauseStates", buf, 0xCu);
    }
  }
  if ((a4 & 0x200) != 0 && v11)
  {
    v72 = PLUserStatusGetLog();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v72, OS_LOG_TYPE_DEBUG, "%@ > Will update SyncProgress", buf, 0xCu);
    }

    [(PXCPLStatus *)v11 setIsSyncing:[(PXCPLSyncActivity *)self->_syncActivity isSyncing]];
    v73 = PLUserStatusGetLog();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A9AE7000, v73, OS_LOG_TYPE_DEBUG, "%@ < Did update SyncProgress", buf, 0xCu);
    }
  }
  return v11;
}

float __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke(void *a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v10 = PLUserStatusGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    int v13 = 138413314;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    unint64_t v16 = a2;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "%@ >> originalSize: %lu, originalSize: %lu, uploadedMasters: %lu, unpushedMasters: %lu", (uint8_t *)&v13, 0x34u);
  }

  if (a5 && a5 >= a4) {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a5 - a4;
  }
  if (a3)
  {
    if (a2 <= a3)
    {
      float result = (float)a2 / (float)a3;
      *(float *)(*(void *)(a1[6] + 8) + 24) = result;
    }
  }
  return result;
}

void __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke_264(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F8A8C0] entityName];
  double v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v2];
  double v4 = [MEMORY[0x1E4F8A8C0] predicateForOriginalsToDownload];
  [v3 setPredicate:v4];

  [v3 setResultType:4];
  double v5 = *(void **)(a1 + 32);
  id v8 = 0;
  uint64_t v6 = [v5 countForFetchRequest:v3 error:&v8];
  id v7 = v8;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

- (void)_setStatus:(id)a3 producedForUpdateType:(unint64_t)a4 timeIntervalProducingUpdatedStatus:(double)a5
{
  __int16 v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  __int16 v9 = (PXCPLStatus *)a3;
  double v10 = self->_status;
  if (v10 == v9)
  {
  }
  else
  {
    uint64_t v11 = v10;
    BOOL v12 = [(PXCPLStatus *)v10 isEqual:v9];

    if (!v12)
    {
      objc_storeStrong((id *)&self->_status, a3);
      int v13 = PLUserStatusGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        status = self->_status;
        __int16 v15 = PXCPLStatusUpdateTypeDebugDescription(v6);
        int v18 = 138544130;
        __int16 v19 = self;
        __int16 v20 = 2114;
        __int16 v21 = status;
        __int16 v22 = 2114;
        double v23 = *(double *)&v15;
        __int16 v24 = 2048;
        double v25 = a5;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ >> %{public}@ [reason: %{public}@, time: %.2f s]", (uint8_t *)&v18, 0x2Au);
      }
      [(PXCPLStatusProvider *)self signalChange:1];
      goto LABEL_10;
    }
  }
  unint64_t v16 = PLUserStatusGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    PXCPLStatusUpdateTypeDebugDescription(v6);
    __int16 v17 = (PXCPLStatus *)objc_claimAutoreleasedReturnValue();
    int v18 = 138412802;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v17;
    __int16 v22 = 2048;
    double v23 = a5;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "%@ Update resulted in no change [reason: %{public}@, time: %.2f s]", (uint8_t *)&v18, 0x20u);
  }
LABEL_10:
}

- (PXCPLStatusProvider)initWithPhotoLibrary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXCPLStatusProvider.m", 197, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  if (([v6 isCloudPhotoLibraryEnabled] & 1) == 0)
  {
    id v7 = PLUserStatusGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 photoLibraryURL];
      *(_DWORD *)buf = 138543874;
      v34 = self;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "%{public}@ ICPL is not enabled for library: %@, URL: \"%@\"", buf, 0x20u);
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)PXCPLStatusProvider;
  __int16 v9 = [(PXCPLStatusProvider *)&v32 init];
  if (v9)
  {
    uint64_t v10 = +[PXCPLStatusProvider sharedQueue];
    serialUpdateQueue = v9->_serialUpdateQueue;
    v9->_serialUpdateQueue = (OS_dispatch_queue *)v10;

    p_photoLibrary = &v9->_photoLibrary;
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    uint64_t v13 = [(PHPhotoLibrary *)v9->_photoLibrary cplStatus];
    if (v13)
    {
      uint64_t v14 = [[PXCPLStatusSource alloc] initWithStatus:v13];
      cplStatusSource = v9->_cplStatusSource;
      v9->_cplStatusSource = v14;

      [(PXCPLStatusSource *)v9->_cplStatusSource registerChangeObserver:v9 context:PXCPLStatusSourceObservationContext];
    }
    else
    {
      unint64_t v16 = PLUserStatusGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v34 = v9;
        __int16 v35 = 2112;
        id v36 = v6;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "%{public}@ No CPL status for library: %@", buf, 0x16u);
      }
    }
    __int16 v17 = [[PXCPLPhotoLibrarySource alloc] initWithPhotoLibrary:*p_photoLibrary];
    photoLibrarySource = v9->_photoLibrarySource;
    v9->_photoLibrarySource = v17;

    [(PXCPLPhotoLibrarySource *)v9->_photoLibrarySource registerChangeObserver:v9 context:PXCPLPhotoLibrarySourceObservationContext];
    uint64_t v19 = +[PXCPLSyncActivity sharedInstance];
    syncActivity = v9->_syncActivity;
    v9->_syncActivity = (PXCPLSyncActivity *)v19;

    [(PXCPLSyncActivity *)v9->_syncActivity registerChangeObserver:v9 context:PXCPLSyncActivityObservationContext];
    __int16 v21 = [[PXCPLSharedLibraryActivity alloc] initWithPhotoLibrary:*p_photoLibrary];
    sharedLibraryActivity = v9->_sharedLibraryActivity;
    v9->_sharedLibraryActivity = v21;

    [(PXCPLSharedLibraryActivity *)v9->_sharedLibraryActivity registerChangeObserver:v9 context:PXCPLSharedLibraryActivityObservationContext];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_uploadAndDownloadCountsDidChange, (CFStringRef)*MEMORY[0x1E4F8AD68], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_uploadByteCountsDidChange, (CFStringRef)*MEMORY[0x1E4F8AD70], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_pauseDidChange, (CFStringRef)*MEMORY[0x1E4F8AD60], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_numberOfOriginalsToDownloadDidChange, (CFStringRef)*MEMORY[0x1E4F8AD58], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_resetSyncStatusDidChange, (CFStringRef)*MEMORY[0x1E4F8AE50], 0, (CFNotificationSuspensionBehavior)1024);
    if (_os_feature_enabled_impl())
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_numberOfItemsFailingToUploadDidChange, (CFStringRef)*MEMORY[0x1E4F8AD30], 0, (CFNotificationSuspensionBehavior)1024);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_numberOfItemsFailingToUploadDidChange, (CFStringRef)*MEMORY[0x1E4F8AD28], 0, (CFNotificationSuspensionBehavior)1024);
    }
    uint64_t v24 = +[PXCloudQuotaOfferProvider currentOfferProvider];
    offerProvider = v9->_offerProvider;
    v9->_offerProvider = (PXCloudQuotaOfferProvider *)v24;

    uint64_t v26 = +[PXCloudQuotaPremiumOfferProvider currentPremiumOfferProvider];
    premiumOfferProvider = v9->_premiumOfferProvider;
    v9->_premiumOfferProvider = (PXCloudQuotaPremiumOfferProvider *)v26;

    v28 = [(PXCloudQuotaOfferProvider *)v9->_offerProvider offer];
    if (v28)
    {
      v9->_hasCloudQuotaOffer = 1;
    }
    else
    {
      BOOL v29 = [(PXCloudQuotaPremiumOfferProvider *)v9->_premiumOfferProvider premiumOffer];
      v9->_hasCloudQuotaOffer = v29 != 0;
    }
    [(PXCloudQuotaOfferProvider *)v9->_offerProvider registerChangeObserver:v9 context:PXCloudQuotaOfferProviderObservationContext];
    [(PXCloudQuotaPremiumOfferProvider *)v9->_premiumOfferProvider registerChangeObserver:v9 context:PXCloudQuotaPremiumOfferProviderObservationContext];
    v9;
    px_dispatch_on_main_queue();
  }

  return 0;
}

uint64_t __44__PXCPLStatusProvider_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleUpdateForType:4031];
}

- (PXCPLStatusProvider)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLStatusProvider.m", 193, @"%s is not available as initializer", "-[PXCPLStatusProvider init]");

  abort();
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1) {
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_7047);
  }
  v2 = (void *)sharedQueue_sharedQueue;
  return v2;
}

void __34__PXCPLStatusProvider_sharedQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.pxcplstatusprovider.update", attr);
  double v3 = (void *)sharedQueue_sharedQueue;
  sharedQueue_sharedQueue = (uint64_t)v2;

  double v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_237];
}

void __34__PXCPLStatusProvider_sharedQueue__block_invoke_2()
{
}

@end