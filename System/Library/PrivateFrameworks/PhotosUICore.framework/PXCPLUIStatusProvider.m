@interface PXCPLUIStatusProvider
- (NSDate)currentDateForTesting;
- (PXCPLActionManager)actionManager;
- (PXCPLUIStatus)status;
- (PXCPLUIStatusProvider)init;
- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3;
- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4;
- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4 countsController:(id)a5 presentationStyle:(unint64_t)a6;
- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4 presentationStyle:(unint64_t)a5;
- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 countsController:(id)a4;
- (PXCPLUIStatusProvider)initWithStatusProvider:(id)a3 actionManager:(id)a4 countsController:(id)a5 presentationStyle:(unint64_t)a6;
- (unint64_t)presentationStyle;
- (void)_statusDidChange:(id)a3;
- (void)_updateStatus;
- (void)_updateStatusProviderMonitor;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCurrentDateForTesting:(id)a3;
@end

@implementation PXCPLUIStatusProvider

- (PXCPLUIStatus)status
{
  return self->_status;
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 countsController:(id)a4
{
  return [(PXCPLUIStatusProvider *)self initWithPhotoLibrary:a3 actionManager:0 countsController:a4 presentationStyle:0];
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4
{
  return [(PXCPLUIStatusProvider *)self initWithPhotoLibrary:a3 actionManager:a4 countsController:0 presentationStyle:0];
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3
{
  return [(PXCPLUIStatusProvider *)self initWithPhotoLibrary:a3 actionManager:0];
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4 countsController:(id)a5 presentationStyle:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXCPLUIStatusProvider.m", 81, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v14 = [[PXCPLStatusProviderMonitor alloc] initWithPhotoLibrary:v11];
  v15 = [(PXCPLStatusProviderMonitor *)v14 statusProvider];
  v16 = [(PXCPLUIStatusProvider *)self initWithStatusProvider:v15 actionManager:v12 countsController:v13 presentationStyle:a6];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_statusProviderMonitor, v14);
    [(PXCPLStatusProviderMonitor *)v17->_statusProviderMonitor registerChangeObserver:v17 context:PXCPLStatusProviderMonitorObservationContext];
    objc_storeStrong((id *)&v17->_countsController, a5);
    [(PXAssetsDataSourceCountsController *)v17->_countsController registerChangeObserver:v17 context:PXAssetsDataSourceCountsControllerObserverContext_282480];
    [(PXAssetsDataSourceCountsController *)v17->_countsController prepareCountsIfNeeded];
  }

  return v17;
}

- (PXCPLUIStatusProvider)initWithStatusProvider:(id)a3 actionManager:(id)a4 countsController:(id)a5 presentationStyle:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXCPLUIStatusProvider;
  v14 = [(PXCPLUIStatusProvider *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_actionManager, a4);
    objc_storeStrong((id *)&v15->_statusProvider, a3);
    objc_storeStrong((id *)&v15->_countsController, a5);
    v15->_presentationStyle = a6;
    [(PXCPLStatusProvider *)v15->_statusProvider registerChangeObserver:v15 context:PXCPLStatusProviderObservationContext];
    v16 = [(PXCPLStatusProvider *)v15->_statusProvider status];
    if (v16) {
      [(PXCPLUIStatusProvider *)v15 _statusDidChange:v16];
    }
  }
  return v15;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXCPLStatusProviderMonitorObservationContext == a5)
  {
    id v11 = v9;
    [(PXCPLUIStatusProvider *)self _updateStatusProviderMonitor];
    goto LABEL_7;
  }
  if ((void *)PXCPLStatusProviderObservationContext == a5) {
    goto LABEL_5;
  }
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext_282480 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCPLUIStatusProvider.m" lineNumber:1241 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
LABEL_5:
    id v11 = v9;
    [(PXCPLUIStatusProvider *)self _updateStatus];
LABEL_7:
    id v9 = v11;
  }
}

- (void)_updateStatus
{
  id v3 = [(PXCPLStatusProvider *)self->_statusProvider status];
  [(PXCPLUIStatusProvider *)self _statusDidChange:v3];
}

- (void)_statusDidChange:(id)a3
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 isEnabled])
  {
    v7 = 0;
    goto LABEL_202;
  }
  if ([v5 isInSoftResetSync]) {
    int v6 = 1;
  }
  else {
    int v6 = [v5 isInHardResetSync];
  }
  [v5 fractionCompletedForLibraryRebuild];
  float v9 = v8;
  v192 = [v5 syncDate];

  v178 = [v5 syncDate];
  uint64_t v10 = [v5 exitDate];
  uint64_t v181 = [v5 numberOfItemsFailingToUpload];
  uint64_t v189 = [v5 numberOfPhotoAssets];
  uint64_t v188 = [v5 numberOfVideoAssets];
  uint64_t v187 = [v5 numberOfOtherAssets];
  uint64_t v11 = [v5 numberOfReferencedItems];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = _PXCPLUIStatusLocalizedString(@"PXCPLStatus_Referenced_NItems");
    uint64_t v173 = v12;
    uint64_t v14 = PXLocalizedStringWithValidatedFormat(v13, @"%lu");
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = objc_msgSend(v5, "sharedLibraryState", v173);
  unsigned int v180 = [v5 isUpgradeSuggestedToAccessAllPhotos];
  BOOL v16 = ([v5 isExceedingQuota] & 1) != 0 || objc_msgSend(v5, "cloudQuotaState") == 2;
  if ([v5 sharedLibraryMovingToShared]) {
    int v17 = [v5 isExceedingSharedLibraryQuota];
  }
  else {
    int v17 = 1;
  }
  if ([v5 numberOfItemsToUpload]) {
    int v18 = !v16 | v17;
  }
  else {
    int v18 = 0;
  }
  uint64_t v19 = [v5 sharedLibraryMovingToPersonal];
  if ([v5 sharedLibraryMovingToShared])
  {
    int v20 = [v5 isExceedingSharedLibraryQuota] ^ 1;
    if (!v19) {
      int v20 = 1;
    }
    int v21 = v20 | v16;
  }
  else
  {
    int v21 = 0;
  }
  BOOL v22 = (v15 & 0xFFFFFFFFFFFFFFFELL) == 2 && v10 == 0;
  int v23 = !v22;
  v193 = (void *)v10;
  v194 = self;
  unsigned int v195 = v6;
  v177 = (void *)v14;
  int v197 = v23;
  if (v22)
  {
    uint64_t v27 = [v5 sharedLibraryExitingWithNumberOfAssetsRemaining];
    int v32 = 0;
    int v28 = 0;
    int v190 = 0;
    int v30 = 0;
    int v31 = 0;
    int v29 = 1;
    float v24 = -1.0;
    uint64_t v33 = 7;
LABEL_38:
    unint64_t v196 = v33;
    goto LABEL_39;
  }
  if (v18)
  {
    [v5 fractionCompletedForUpload];
    float v24 = -1.0;
    if (v25 != -1.0)
    {
      [v5 fractionCompletedForUpload];
      float v24 = v26;
    }
    uint64_t v27 = [v5 numberOfItemsToUpload];
    int v28 = 0;
    int v190 = 0;
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 1;
    uint64_t v33 = 3;
    goto LABEL_38;
  }
  if ([v5 numberOfItemsToAdd])
  {
    uint64_t v27 = [v5 numberOfItemsToAdd];
    int v32 = 0;
    int v28 = 0;
    int v190 = 0;
    int v30 = 0;
    int v31 = 0;
    int v29 = 1;
    float v24 = -1.0;
    uint64_t v33 = 2;
    goto LABEL_38;
  }
  if (v21)
  {
    uint64_t v27 = [v5 sharedLibraryMovingToShared];
    int v32 = 0;
    int v28 = 0;
    int v30 = 0;
    int v31 = 0;
    int v190 = 1;
    float v24 = -1.0;
    uint64_t v38 = 5;
LABEL_53:
    unint64_t v196 = v38;
    int v29 = 1;
    goto LABEL_39;
  }
  if ([v5 sharedLibraryMovingToPersonal])
  {
    uint64_t v27 = [v5 sharedLibraryMovingToPersonal];
    int v32 = 0;
    int v190 = 0;
    int v30 = 0;
    int v31 = 0;
    int v28 = 1;
    float v24 = -1.0;
    uint64_t v38 = 6;
    goto LABEL_53;
  }
  if ([v5 numberOfOriginalsToDownload])
  {
    uint64_t v27 = [v5 numberOfOriginalsToDownload];
    int v32 = 0;
    int v28 = 0;
    int v190 = 0;
    int v31 = 0;
    int v29 = 1;
    float v24 = -1.0;
    unint64_t v196 = 4;
    int v30 = 1;
  }
  else
  {
    int v122 = [v5 isSyncing];
    uint64_t v27 = 0;
    int v32 = 0;
    int v28 = 0;
    int v190 = 0;
    int v30 = 0;
    if (v192) {
      int v123 = v122;
    }
    else {
      int v123 = 1;
    }
    unint64_t v196 = v123 | v195;
    int v31 = v196 ^ 1;
    int v29 = 1;
    float v24 = -1.0;
  }
LABEL_39:
  int v34 = [v5 isExceedingSharedLibraryQuota];
  v183 = v5;
  if ([v5 isInHeavyThermalPressure])
  {
    int v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 17;
LABEL_61:
    uint64_t v198 = v37;
    v39 = v194;
    unsigned int v40 = v195;
    goto LABEL_62;
  }
  if ([v5 isInAirplaneMode])
  {
    int v35 = 0;
    uint64_t v36 = 6;
    uint64_t v37 = 12;
    goto LABEL_61;
  }
  if ([v5 isOffline])
  {
    int v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 11;
    goto LABEL_61;
  }
  if ([v5 isCellularDataDisabled])
  {
    int v35 = 0;
    uint64_t v36 = 5;
    uint64_t v37 = 10;
    goto LABEL_61;
  }
  if ([v5 isClientVersionTooOld])
  {
    int v35 = 0;
    uint64_t v36 = 9;
    uint64_t v37 = 8;
    goto LABEL_61;
  }
  if ([v5 isClientNotAuthenticated])
  {
    int v35 = 0;
    uint64_t v36 = 10;
    uint64_t v37 = 9;
    goto LABEL_61;
  }
  if (([v5 isVeryLowDiskSpace] & 1) != 0
    || (v29 & [v5 isLowDiskSpace] & 1) != 0)
  {
    int v35 = 0;
    uint64_t v36 = 4;
    uint64_t v37 = 3;
    goto LABEL_61;
  }
  if ((v16 & (v32 | v28) | v190 & v34))
  {
    v39 = v194;
    unsigned int v40 = v195;
    if ([v5 isExceedingSharedLibraryQuota])
    {
      int v35 = 0;
      uint64_t v36 = 0;
    }
    else
    {
      int v35 = 0;
      if ([v5 hasCloudQuotaOffer]) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = 3;
      }
    }
    uint64_t v198 = 2;
LABEL_62:
    v41 = [(PXCPLUIStatusProvider *)v39 currentDateForTesting];
    v42 = v41;
    if (v41)
    {
      v43 = v41;
    }
    else
    {
      v43 = [MEMORY[0x1E4F1C9C8] now];
    }
    _RegisterServiceActivity(v196, v43);
    _PXCPLStatusPendingStateDescription(2, v196, v198, v40, v27, v15, [(PXCPLUIStatusProvider *)v39 presentationStyle] == 1);
    v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    char v44 = [v5 hasCloudQuotaOffer];
    switch(v198)
    {
      case 2:
        if (v190)
        {
          v45 = @"PXCPLStatusPauseReasonSharedLibraryCloudStorageBudget";
          goto LABEL_85;
        }
        if (v44) {
          goto LABEL_131;
        }
        v45 = @"PXCPLStatusCloudStorageFull";
        goto LABEL_85;
      case 3:
        v46 = PXLocalizationKeyByAddingDeviceModelSuffix(@"PXCPLStatusPauseReasonLowDiskSpace_");
        PXLocalizedStringFromTable(v46, @"PhotosUICore");
        v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_81;
      case 4:
        v45 = @"PXCPLStatusPauseReasonBatteryBudget";
        goto LABEL_85;
      case 5:
        v45 = @"PXCPLStatusPauseReasonCellularBudget";
        goto LABEL_85;
      case 6:
        v45 = @"PXCPLStatusPauseReasonLowDataMode";
        goto LABEL_85;
      case 7:
        v45 = @"PXCPLStatusPauseReasonLowPowerMode";
        goto LABEL_85;
      case 8:
        v46 = +[PXLocalization currentDeviceCanonicalModel];
        v47 = @"PXCPLStatusPauseReasonClientVersionTooOld_";
        goto LABEL_80;
      case 9:
        v46 = +[PXLocalization currentDeviceCanonicalModel];
        v47 = @"PXCPLStatusPauseReasonClientNotAuthenticated_";
LABEL_80:
        v48 = [(__CFString *)v47 stringByAppendingString:v46];
        _PXCPLUIStatusLocalizedString(v48);
        v182 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_81:
        break;
      case 10:
        v45 = @"PXCPLStatusPauseReasonCellularDataDisabled";
        goto LABEL_85;
      case 11:
        v45 = @"PXCPLStatusPauseReasonOffline";
        goto LABEL_85;
      case 12:
        v45 = @"PXCPLStatusPauseReasonAirplaneMode";
        goto LABEL_85;
      case 13:
        v45 = @"PXCPLStatusPauseReasonCapturingSnapshot";
        goto LABEL_85;
      case 14:
        v45 = @"PXCPLStatusPauseReasonOptimizingSystemPerformance";
        goto LABEL_85;
      case 15:
        v45 = @"PXCPLStatusPauseReasonPoorNetworkConnection";
        goto LABEL_85;
      case 16:
      case 17:
        v45 = @"PXCPLStatusPauseReasonThermalPressure";
        goto LABEL_85;
      case 18:
        v45 = @"PXCPLStatusPauseReasonLowBattery";
LABEL_85:
        _PXCPLUIStatusLocalizedString(v45);
        v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_131:
        v182 = 0;
        break;
    }
    if (v35) {
      float v49 = v24;
    }
    else {
      float v49 = -1.0;
    }
    if (v40) {
      float v24 = -1.0;
    }
    else {
      float v24 = v49;
    }
    uint64_t v50 = 1;
    unint64_t v51 = 2;
    goto LABEL_93;
  }
  if ([v5 isCapturingSnapshot])
  {
    int v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 13;
    goto LABEL_61;
  }
  if ([v5 isUserPaused])
  {
    int v35 = 1;
    uint64_t v36 = 2;
    uint64_t v37 = 1;
    goto LABEL_61;
  }
  if ([v5 isInLowPowerMode])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v37 = 7;
    goto LABEL_61;
  }
  if ([v5 isInLowDataMode])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v37 = 6;
    goto LABEL_61;
  }
  if ([v5 isExceedingBatteryQuota])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v124 = 4;
LABEL_244:
    uint64_t v198 = v124;
    v39 = v194;
    unsigned int v40 = v195;
    goto LABEL_62;
  }
  if ([v5 isExceedingCellularQuota])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v124 = 5;
    goto LABEL_244;
  }
  if ([v5 isInLowBattery])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v124 = 18;
    goto LABEL_244;
  }
  if ([v5 isOptimizingSystemPerformance])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v124 = 14;
    goto LABEL_244;
  }
  if ([v5 isInPoorNetworkConnection])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v124 = 15;
    goto LABEL_244;
  }
  if ([v5 isInModerateThermalPressure])
  {
    int v35 = 0;
    uint64_t v36 = 2;
    uint64_t v124 = 16;
    goto LABEL_244;
  }
  if (!v31)
  {
    uint64_t v36 = (v28 | v190 | v32 | v30 | v197 ^ 1) & (v195 ^ 1);
    v125 = [(PXCPLUIStatusProvider *)v194 currentDateForTesting];
    v126 = v125;
    if (v125)
    {
      v43 = v125;
    }
    else
    {
      v43 = [MEMORY[0x1E4F1C9C8] now];
    }
    _RegisterServiceActivity(v196, v43);
    v39 = v194;
    unint64_t v51 = 1;
    LOBYTE(v40) = v195;
    _PXCPLStatusPendingStateDescription(1, v196, 0, v195, v27, v15, [(PXCPLUIStatusProvider *)v194 presentationStyle] == 1);
    v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v198 = 0;
    v182 = 0;
    uint64_t v50 = 0;
    if (v195) {
      float v24 = -1.0;
    }
    goto LABEL_93;
  }
  if (v181 && !v193)
  {
    v182 = 0;
    uint64_t v36 = 7;
    goto LABEL_264;
  }
  if ([v5 cloudQuotaState]) {
    uint64_t v36 = 3;
  }
  else {
    uint64_t v36 = 0;
  }
  if (!v193)
  {
    v182 = 0;
    goto LABEL_264;
  }
  if (PXCPLIsInTestReadonlyMode_onceToken != -1) {
    dispatch_once(&PXCPLIsInTestReadonlyMode_onceToken, &__block_literal_global_123255);
  }
  if (PXCPLIsInTestReadonlyMode_isInTestReadOnlyMode)
  {
    uint64_t v198 = 0;
    unint64_t v51 = 0;
    uint64_t v50 = 0;
    v179 = @"Read-Only iCloud Photos";
    float v24 = -1.0;
    uint64_t v36 = 8;
    v182 = @"Apple Internal. Some interactions with the Cloud might be limited.";
LABEL_316:
    v39 = v194;
    LOBYTE(v40) = v195;
    goto LABEL_94;
  }
  uint64_t v153 = [(PXCPLUIStatusProvider *)v194 presentationStyle];
  if (!v153)
  {
    v154 = @"PXCPLStatus_DisabledAndDeleted";
    goto LABEL_330;
  }
  if (v153 == 1)
  {
    v154 = @"PXCPLStatus_DisabledAndDeleted_Short";
LABEL_330:
    _PXCPLUIStatusLocalizedString(v154);
    v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_332;
  }
  v179 = 0;
LABEL_332:
  uint64_t v165 = PXCPLNumberOfCalendarUnitsUntilDate(16, v193);
  if (v165 < 1)
  {
    _PXCPLUIStatusLocalizedString(@"PXCPLStatus_DisabledAndDeleted_Soon");
    v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v166 = (void *)v165;
    v167 = _PXCPLUIStatusLocalizedString(@"PXCPLStatus_DisabledAndDeleted_NDays");
    v174 = v166;
    PXLocalizedStringWithValidatedFormat(v167, @"%lu");
    v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v36 = 8;
  if (!v179)
  {
LABEL_264:
    if (!_HasUploadActivityInLastSeconds(480.0)) {
      goto LABEL_272;
    }
    uint64_t v127 = [(PXCPLUIStatusProvider *)v194 presentationStyle];
    if (v127)
    {
      if (v127 != 1) {
        goto LABEL_272;
      }
      v128 = @"PXCPLStatus_UploadComplete_Short";
    }
    else
    {
      v128 = @"PXCPLStatus_UploadComplete";
    }
    _PXCPLUIStatusLocalizedString(v128);
    v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v179) {
      goto LABEL_296;
    }
LABEL_272:
    v129 = [(PXCPLUIStatusProvider *)v194 currentDateForTesting];
    v130 = v129;
    if (v129)
    {
      id v131 = v129;
    }
    else
    {
      id v131 = [MEMORY[0x1E4F1C9C8] now];
    }
    uint64_t v132 = [(PXCPLUIStatusProvider *)v194 presentationStyle];
    id v133 = v178;
    id v134 = v131;
    v135 = v134;
    if (v133)
    {
      if (v134) {
        goto LABEL_277;
      }
    }
    else
    {
      v169 = [MEMORY[0x1E4F28B00] currentHandler];
      v170 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *_PXCPLStatusLastUpdateDescription(NSDate *__strong, NSDate *__strong, BOOL)");
      [v169 handleFailureInFunction:v170, @"PXCPLUIStatusProvider.m", 417, @"Invalid parameter not satisfying: %@", @"lastSyncDate" file lineNumber description];

      if (v135) {
        goto LABEL_277;
      }
    }
    v171 = [MEMORY[0x1E4F28B00] currentHandler];
    v172 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *_PXCPLStatusLastUpdateDescription(NSDate *__strong, NSDate *__strong, BOOL)");
    [v171 handleFailureInFunction:v172, @"PXCPLUIStatusProvider.m", 418, @"Invalid parameter not satisfying: %@", @"currentDate" file lineNumber description];

LABEL_277:
    [v135 timeIntervalSinceDate:v133];
    double v137 = v136;
    v138 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v139 = PXCPLNumberOfCalendarUnitsBetweenDates(16, v133, v135, v138);
    if (v137 <= 60.0)
    {
      v143 = @"PXCPLStatus_JustNow";
      v144 = @"PXCPLStatus_JustNow_Short";
    }
    else
    {
      if (v137 < 3600.0)
      {
        unint64_t v140 = vcvtmd_s64_f64(v137 / 60.0);
        if (v132 == 1) {
          v141 = @"PXCPLStatus_LastUpdatedNMinutesAgo_Short";
        }
        else {
          v141 = @"PXCPLStatus_LastUpdatedNMinutesAgo";
        }
        v142 = _PXCPLUIStatusLocalizedString(v141);
        v174 = (void *)v140;
        PXLocalizedStringWithValidatedFormat(v142, @"%lu");
        v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_294:

LABEL_295:
        goto LABEL_296;
      }
      uint64_t v146 = v139;
      if (v139 != 1)
      {
        if (v139)
        {
          v158 = objc_opt_new();
          v159 = v158;
          if (v146 > 6)
          {
            [v158 setTimeStyle:0];
            [v159 setDateStyle:2];
            if (v132 == 1) {
              v168 = @"PXCPLStatus_Date_Short";
            }
            else {
              v168 = @"PXCPLStatus_Date";
            }
            v162 = _PXCPLUIStatusLocalizedString(v168);
            v164 = [v159 stringFromDate:v133];
            v174 = v164;
            PXLocalizedStringWithValidatedFormat(v162, @"%@");
            v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v160 = (void *)MEMORY[0x1E4F28C10];
            v161 = [MEMORY[0x1E4F1CA20] currentLocale];
            v162 = [v160 dateFormatFromTemplate:@"EEEE" options:0 locale:v161];

            [v159 setDateFormat:v162];
            if (v132 == 1) {
              v163 = @"PXCPLStatus_Weekday_Short";
            }
            else {
              v163 = @"PXCPLStatus_Weekday";
            }
            v164 = _PXCPLUIStatusLocalizedString(v163);
            v174 = [v159 stringFromDate:v133];
            PXLocalizedStringWithValidatedFormat(v164, @"%@");
            v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_295;
        }
        v142 = objc_opt_new();
        [v142 setTimeStyle:1];
        [v142 setDateStyle:0];
        if (v132 == 1) {
          v147 = @"PXCPLStatus_AtTime_Short";
        }
        else {
          v147 = @"PXCPLStatus_AtTime";
        }
        v148 = _PXCPLUIStatusLocalizedString(v147);
        v174 = [v142 stringFromDate:v133];
        PXLocalizedStringWithValidatedFormat(v148, @"%@");
        v179 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_294;
      }
      v143 = @"PXCPLStatus_Yesterday";
      v144 = @"PXCPLStatus_Yesterday_Short";
    }
    if (v132 == 1) {
      v145 = v144;
    }
    else {
      v145 = v143;
    }
    _PXCPLUIStatusLocalizedString(v145);
    v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_295;
  }
LABEL_296:
  unsigned int v149 = v180;
  if (v182) {
    unsigned int v149 = 0;
  }
  if (v149 == 1)
  {
    v150 = v179;
    PXLocalizedStringFromTable(@"PXCPLStatusUpgradeSuggestedToAccessAllPhotos", @"PhotosUICore");
    v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v182 = v150;

    uint64_t v36 = 11;
  }
  float v24 = -1.0;
  if (v182) {
    goto LABEL_315;
  }
  if ([v5 isRebuildingThumbnails])
  {
    PXLocalizedStringFromTable(@"PXCPLStatusRebuildingThumbnails", @"PhotosUICore");
    v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v182 = 0;
  }
  if (!v182 && v181)
  {
    uint64_t v151 = [(PXCPLUIStatusProvider *)v194 presentationStyle];
    if (v151)
    {
      if (v151 != 1) {
        goto LABEL_317;
      }
      v152 = @"PXCPLStatus_Push_Failed_NItems_Short";
    }
    else
    {
      v152 = @"PXCPLStatus_Push_Failed_NItems";
    }
    v155 = _PXCPLUIStatusLocalizedString(v152);
    v174 = (void *)v181;
    PXLocalizedStringWithValidatedFormat(v155, @"%lu");
    v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v182)
  {
LABEL_315:
    uint64_t v198 = 0;
    unint64_t v51 = 0;
    uint64_t v50 = 0;
    goto LABEL_316;
  }
LABEL_317:
  v156 = objc_msgSend(v5, "cloudQuotaCustomTitle", v174);
  if (!v156)
  {
    if ([v5 cloudQuotaState] == 1)
    {
      v157 = @"PXCPLStatusCloudStorageAlmostFull";
    }
    else
    {
      if ([v5 cloudQuotaState] != 2)
      {
        v43 = 0;
        uint64_t v198 = 0;
        unint64_t v51 = 0;
        v182 = 0;
        goto LABEL_346;
      }
      v157 = @"PXCPLStatusCloudStorageFull";
    }
    PXLocalizedStringFromTable(v157, @"PhotosUICore");
    v182 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    uint64_t v198 = 0;
    unint64_t v51 = 0;
LABEL_346:
    uint64_t v50 = 0;
    goto LABEL_347;
  }
  v43 = v156;
  uint64_t v198 = 0;
  unint64_t v51 = 0;
  uint64_t v50 = 0;
  v182 = v43;
LABEL_347:
  v39 = v194;
  LOBYTE(v40) = v195;
LABEL_93:

LABEL_94:
  v7 = objc_alloc_init(PXCPLUIStatus);
  v52 = [(PXCPLUIStatusProvider *)v39 actionManager];

  v191 = 0;
  id v53 = 0;
  if (!v36)
  {
    id v184 = 0;
    v185 = 0;
    goto LABEL_147;
  }
  id v184 = 0;
  v185 = 0;
  if (!v52) {
    goto LABEL_147;
  }
  unsigned int v186 = v50;
  id v54 = [v5 cloudQuotaCustomActionTitle];
  switch(v36)
  {
    case 1:
      v55 = @"PXCPLStatusActionPause_Title";
      goto LABEL_110;
    case 2:
      if (((1 << v198) & 0x5C0F0) != 0)
      {
        v55 = @"PXCPLStatusActionSyncNow_Title";
      }
      else
      {
        if (v198 != 1)
        {
          v117 = [MEMORY[0x1E4F28B00] currentHandler];
          v118 = [NSString stringWithUTF8String:"NSString * _Nullable _PXCPLStatusResumeActionTitle(PXCPLStatusPauseReason)"];
          v119 = v117;
          v120 = v118;
          uint64_t v121 = 697;
          goto LABEL_328;
        }
        v55 = @"PXCPLStatusActionResume_Title";
      }
LABEL_110:
      uint64_t v56 = _PXCPLUIStatusLocalizedString(v55);
LABEL_111:
      v191 = (void *)v56;
LABEL_112:

      if (v36 == 2)
      {
        [(PXCPLStatusProvider *)v39->_statusProvider nextOverrideResumeTimeInterval];
        uint64_t v62 = vcvtad_u64_f64(v61 / 3600.0);
        if (v62 > 11)
        {
          uint64_t v63 = v198;
          if (v62 != 12)
          {
            if (v62 == 24)
            {
              uint64_t v64 = 3;
              goto LABEL_128;
            }
            goto LABEL_125;
          }
          uint64_t v64 = 2;
        }
        else
        {
          uint64_t v63 = v198;
          if (v62 != 1)
          {
            if (v62 == 4)
            {
              uint64_t v64 = 1;
              goto LABEL_128;
            }
LABEL_125:
            uint64_t v64 = 4;
            goto LABEL_128;
          }
          uint64_t v64 = 0;
        }
LABEL_128:
        v65 = 0;
        v66 = @"PXCPLStatus_Resume_Update_Battery_AlertTitle_Description";
        switch(v63)
        {
          case 0:
          case 2:
          case 3:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 17:
            v117 = [MEMORY[0x1E4F28B00] currentHandler];
            v118 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *_PXCPLStatusResumeActionConfirmationAlertMessage(PXCPLStatusPauseReason, PXCPLUIStatusProviderResumeTime)");
            v119 = v117;
            v120 = v118;
            uint64_t v121 = 559;
            goto LABEL_328;
          case 4:
            goto LABEL_138;
          case 5:
            v66 = @"PXCPLStatus_Resume_Update_Cellular_AlertTitle_Description";
            goto LABEL_138;
          case 6:
            v66 = @"PXCPLStatus_Resume_Update_LowDataMode_AlertTitle_Description";
            goto LABEL_138;
          case 7:
            v66 = @"PXCPLStatus_Resume_Update_LowPowerMode_AlertTitle_Description";
            goto LABEL_138;
          case 14:
            v66 = @"PXCPLStatus_Resume_Update_OptimizingSystemPerformance_AlertTitle_Description";
            goto LABEL_138;
          case 15:
            v66 = @"PXCPLStatus_Resume_Update_PoorNetworkConnection_AlertTitle_Description";
            goto LABEL_138;
          case 16:
            v66 = @"PXCPLStatus_Resume_Update_ThermalPressure_AlertTitle_Description";
            goto LABEL_138;
          case 18:
            v66 = @"PXCPLStatus_Resume_Update_LowBattery_AlertTitle_Description";
LABEL_138:
            v65 = _PXCPLUIStatusLocalizedString(v66);
            break;
          default:
            break;
        }
        uint64_t v67 = _PXCPLUIStatusLocalizedString(off_1E5DD0530[v64]);
        v68 = (void *)v67;
        v69 = 0;
        if (v65 && v67)
        {
          v70 = _PXCPLUIStatusLocalizedString(@"PXCPLStatus_Resume_Update_TitleFormat");
          v174 = v65;
          v176 = v68;
          v69 = PXStringWithValidatedFormat();
        }
        v71 = 0;
        if (((1 << v198) & 0x5C0F0) != 0)
        {
          id v72 = v69;
          v71 = _PXCPLUIStatusLocalizedString(@"PXCPLStatus_Resume_AlertButtonTitle_iOS");
        }
        else
        {
          id v72 = 0;
          if (((1 << v198) & 0x23F01) != 0)
          {
            v117 = [MEMORY[0x1E4F28B00] currentHandler];
            v118 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PXCPLStatusResumeActionConfirmationAlertTitles(PXCPLStatusPauseReason, PXCPLUIStatusProviderResumeTime, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *)");
            v119 = v117;
            v120 = v118;
            uint64_t v121 = 518;
            goto LABEL_328;
          }
        }
        id v59 = v72;
        id v60 = v71;

        goto LABEL_145;
      }
      uint64_t v50 = v186;
      if (v36 == 1)
      {
        if (v196 > 2)
        {
          v57 = _PXCPLUIStatusLocalizedString(@"PXCPLStatus_Pause_AlertTitle_iOS");
          v58 = _PXCPLUIStatusLocalizedString(@"PXCPLStatus_Pause_AlertButtonTitle");
          id v59 = v57;
          id v60 = v58;
LABEL_145:

          id v53 = v59;
          id v184 = v60;
          uint64_t v50 = v186;
          goto LABEL_146;
        }
        v117 = [MEMORY[0x1E4F28B00] currentHandler];
        v118 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PXCPLStatusPauseActionConfirmationAlertTitles(PXCPLStatusActivity, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *)");
        v119 = v117;
        v120 = v118;
        uint64_t v121 = 476;
LABEL_328:
        objc_msgSend(v119, "handleFailureInFunction:file:lineNumber:description:", v120, @"PXCPLUIStatusProvider.m", v121, @"Code which should be unreachable has been reached", v174, v176);

        abort();
      }
      id v53 = 0;
      id v184 = 0;
LABEL_146:
      objc_initWeak((id *)location, v39);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __42__PXCPLUIStatusProvider__statusDidChange___block_invoke;
      aBlock[3] = &unk_1E5DD04E8;
      objc_copyWeak(v206, (id *)location);
      v206[1] = (id)v36;
      v185 = _Block_copy(aBlock);
      objc_destroyWeak(v206);
      objc_destroyWeak((id *)location);
LABEL_147:
      if (objc_msgSend(v5, "isLocalModeEnabled", v174, v176))
      {
        v74 = @"Local Mode Enabled";
      }
      else if ([v5 isMockStatus])
      {
        v74 = @"Mock Status";
      }
      else
      {
        v74 = 0;
      }
      if (v9 == -1.0) {
        char v75 = v40;
      }
      else {
        char v75 = 1;
      }
      if ((v75 & 1) != 0 || !v192)
      {
        countsController = v39->_countsController;
        if (countsController)
        {
          [(PXAssetsDataSourceCountsController *)countsController counts];
          uint64_t v79 = v202;
          unint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
          if (v202 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_165;
          }
          uint64_t v81 = v203;
          uint64_t v82 = v204;
        }
        else
        {
          uint64_t v82 = 0;
          uint64_t v81 = 0;
          uint64_t v79 = 0;
          uint64_t v202 = 0;
          uint64_t v203 = 0;
          uint64_t v204 = 0;
        }
        unint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
        if (v81 != 0x7FFFFFFFFFFFFFFFLL && v82 != 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v80 = v81 + v79 + v82;
        }
LABEL_165:
        [v5 fractionCompletedForLibraryRebuild];
        float v84 = v83;
        unint64_t v85 = v188 + v189 + v187;
        float v86 = -1.0;
        if (v85 != 0x7FFFFFFFFFFFFFFFLL && v80 != 0x7FFFFFFFFFFFFFFFLL && v80 && v85 && v85 != v80)
        {
          if (v85 > v80)
          {
            float v87 = (float)v80;
            float v88 = (float)v85;
          }
          else
          {
            float v87 = (float)v85;
            float v88 = (float)v80;
          }
          float v86 = v87 / v88;
        }
        if (v51 >= 2)
        {
          if (v40)
          {
            v76 = v53;
            v89 = @"PXCPLStatus_Rebuild_Paused_Short";
            goto LABEL_195;
          }
          if (v192
            || (+[PXFooterSettings sharedInstance],
                v108 = objc_claimAutoreleasedReturnValue(),
                [v108 minimumDisplayedProgress],
                float v110 = v109,
                v108,
                v86 > 0.99)
            || v86 < v110)
          {
            v76 = v53;
            if (v9 == -1.0
              || (+[PXFooterSettings sharedInstance],
                  v96 = objc_claimAutoreleasedReturnValue(),
                  [v96 minimumDisplayedProgress],
                  float v98 = v97,
                  v96,
                  v84 > 0.99)
              || v98 > v84)
            {
              v89 = @"PXCPLStatus_Sync_Paused_Short";
              goto LABEL_195;
            }
            v100 = (void *)MEMORY[0x1E4F28EE0];
            v101 = NSNumber;
            *(float *)&double v99 = v84;
          }
          else
          {
            v76 = v53;
            v100 = (void *)MEMORY[0x1E4F28EE0];
            v101 = NSNumber;
            *(float *)&double v99 = v86;
          }
          v111 = [v101 numberWithFloat:v99];
          v106 = [v100 localizedStringFromNumber:v111 numberStyle:3];

          v107 = @"PXCPLStatus_SyncingPausedPercent";
        }
        else
        {
          if (v40)
          {
            v76 = v53;
            v89 = @"PXCPLStatus_Rebuild_Short";
LABEL_195:
            v77 = _PXCPLUIStatusLocalizedString(v89);
            goto LABEL_201;
          }
          if (v192
            || (+[PXFooterSettings sharedInstance],
                v102 = objc_claimAutoreleasedReturnValue(),
                [v102 minimumDisplayedProgress],
                float v104 = v103,
                v102,
                v86 > 0.99)
            || v86 < v104)
          {
            v76 = v53;
            if (v9 == -1.0
              || (+[PXFooterSettings sharedInstance],
                  v90 = objc_claimAutoreleasedReturnValue(),
                  [v90 minimumDisplayedProgress],
                  float v92 = v91,
                  v90,
                  v84 > 0.99)
              || v92 > v84)
            {
              v89 = @"PXCPLStatus_Sync_Short";
              goto LABEL_195;
            }
            v94 = (void *)MEMORY[0x1E4F28EE0];
            v95 = NSNumber;
            *(float *)&double v93 = v84;
          }
          else
          {
            v76 = v53;
            v94 = (void *)MEMORY[0x1E4F28EE0];
            v95 = NSNumber;
            *(float *)&double v93 = v86;
          }
          v105 = [v95 numberWithFloat:v93];
          v106 = [v94 localizedStringFromNumber:v105 numberStyle:3];

          v107 = @"PXCPLStatus_SyncingPercent";
        }
        v112 = _PXCPLUIStatusLocalizedString(v107);
        v175 = v106;
        v77 = PXLocalizedStringWithValidatedFormat(v112, @"%@");

        goto LABEL_201;
      }
      v76 = v53;
      v77 = 0;
LABEL_201:
      LODWORD(v73) = -1.0;
      -[PXCPLUIStatus setStateDescription:](v7, "setStateDescription:", v179, v73, v175);
      [(PXCPLUIStatus *)v7 setStartSyncDescription:v77];
      [(PXCPLUIStatus *)v7 setFailureDescription:v182];
      [(PXCPLUIStatus *)v7 setInternalInformationMessage:v74];
      [(PXCPLUIStatus *)v7 setPaused:v50];
      *(float *)&double v113 = v24;
      [(PXCPLUIStatus *)v7 setProgress:v113];
      [(PXCPLUIStatus *)v7 setActionTitle:v191];
      [(PXCPLUIStatus *)v7 setActionConfirmationAlertTitle:v76];
      [(PXCPLUIStatus *)v7 setActionConfirmationAlertSubtitle:0];
      [(PXCPLUIStatus *)v7 setActionConfirmationAlertButtonTitle:v184];
      [(PXCPLUIStatus *)v7 setAction:v185];
      [(PXCPLUIStatus *)v7 setReferencedItemsDescription:v177];
      [(PXCPLUIStatus *)v7 setState:v51];
      [(PXCPLUIStatus *)v7 setActivity:v196];
      [(PXCPLUIStatus *)v7 setPauseReason:v198];
      [(PXCPLUIStatus *)v7 setServiceAction:v36];
      [(PXCPLUIStatus *)v7 setInResetSync:v195];
      [(PXCPLUIStatus *)v7 setIsRestoringLibrary:v9 != -1.0];
      [(PXCPLUIStatus *)v7 setHasCompletedInitialSync:v192 != 0];
      [(PXCPLUIStatus *)v7 setIsExiting:v193 != 0];
      [(PXCPLUIStatus *)v7 setNumberOfItemsFailingToUpload:v181];
      [(PXCPLUIStatus *)v7 setIsUpgradeSuggestedToAccessAllPhotos:v180];
      [(PXCPLUIStatus *)v7 setNumberOfPhotoAssets:v189];
      [(PXCPLUIStatus *)v7 setNumberOfVideoAssets:v188];
      [(PXCPLUIStatus *)v7 setNumberOfOtherAssets:v187];

      self = v194;
      v5 = v183;
LABEL_202:
      uint64_t v114 = PXCPLUIStatusDiff(self->_status, v7);
      if (v114)
      {
        uint64_t v115 = v114;
        v199[0] = MEMORY[0x1E4F143A8];
        v199[1] = 3221225472;
        v199[2] = __42__PXCPLUIStatusProvider__statusDidChange___block_invoke_2;
        v199[3] = &unk_1E5DD0510;
        v199[4] = self;
        v200 = v7;
        uint64_t v201 = v115;
        [(PXCPLUIStatusProvider *)self performChanges:v199];
      }
      else
      {
        v116 = PLUserStatusGetLog();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = self;
          __int16 v208 = 2112;
          v209 = v7;
          _os_log_impl(&dword_1A9AE7000, v116, OS_LOG_TYPE_DEBUG, "%@ Suppressing update that resulted in no change: %@", location, 0x16u);
        }
      }
      return;
    case 3:
      v55 = @"PXCPLStatusActionManageCloudStorage_Title";
      goto LABEL_110;
    case 4:
      v55 = @"PXCPLStatusActionManageLocalStorage_Title";
      goto LABEL_110;
    case 5:
      v55 = @"PXCPLStatusActionManageCellularDataDisabled_Title";
      goto LABEL_110;
    case 6:
      v55 = @"PXCPLStatusActionManageAirplaneMode_Title";
      goto LABEL_110;
    case 7:
      v55 = @"PXCPLStatusActionViewItemsFailingToUpload_Title";
      goto LABEL_110;
    case 8:
      v55 = @"PXCPLStatusActionManageExitMode_Title";
      goto LABEL_110;
    case 9:
      v55 = @"PXCPLStatusActionLearnMoreClientVersionTooOld_Title";
      goto LABEL_110;
    case 10:
      v55 = @"PXCPLStatusActionManageClientAuthentication_Title";
      goto LABEL_110;
    case 11:
      uint64_t v56 = PXLocalizedStringFromTable(@"PXCPLStatusActionLearnMoreUpgradeSuggested_Title", @"PhotosUICore");
      goto LABEL_111;
    default:
      v191 = 0;
      goto LABEL_112;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateForTesting, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_statusProviderMonitor, 0);
}

- (void)setCurrentDateForTesting:(id)a3
{
}

- (NSDate)currentDateForTesting
{
  return self->_currentDateForTesting;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (PXCPLActionManager)actionManager
{
  return self->_actionManager;
}

- (void)_updateStatusProviderMonitor
{
  [(PXCPLStatusProvider *)self->_statusProvider unregisterChangeObserver:self context:PXCPLStatusProviderObservationContext];
  id v3 = [(PXCPLStatusProviderMonitor *)self->_statusProviderMonitor statusProvider];
  statusProvider = self->_statusProvider;
  self->_statusProvider = v3;

  [(PXCPLStatusProvider *)self->_statusProvider registerChangeObserver:self context:PXCPLStatusProviderObservationContext];
  [(PXCPLUIStatusProvider *)self _updateStatus];
}

void __42__PXCPLUIStatusProvider__statusDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained actionManager];
  [v5 performAction:*(void *)(a1 + 40) forCPLUIStatus:v4];
}

uint64_t __42__PXCPLUIStatusProvider__statusDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 40));
  v2 = PLUserStatusGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 120);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ >> %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) signalChange:*(void *)(a1 + 48)];
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4 presentationStyle:(unint64_t)a5
{
  return [(PXCPLUIStatusProvider *)self initWithPhotoLibrary:a3 actionManager:a4 countsController:0 presentationStyle:a5];
}

- (PXCPLUIStatusProvider)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLUIStatusProvider.m", 43, @"%s is not available as initializer", "-[PXCPLUIStatusProvider init]");

  abort();
}

@end