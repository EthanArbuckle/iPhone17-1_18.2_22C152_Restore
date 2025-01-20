@interface PXCPLStatus
+ (PXCPLStatus)statusWithStringRepresentation:(id)a3;
+ (PXCPLStatus)statusWithStringRepresentation:(id)a3 currentDate:(id)a4;
- (BOOL)_isEqualToCPLStatus:(id)a3;
- (BOOL)hasCloudQuotaOffer;
- (BOOL)isCapturingSnapshot;
- (BOOL)isCellularDataDisabled;
- (BOOL)isClientNotAuthenticated;
- (BOOL)isClientVersionTooOld;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExceedingBatteryQuota;
- (BOOL)isExceedingCellularQuota;
- (BOOL)isExceedingQuota;
- (BOOL)isExceedingSharedLibraryQuota;
- (BOOL)isInAirplaneMode;
- (BOOL)isInHardResetSync;
- (BOOL)isInHeavyThermalPressure;
- (BOOL)isInLowBattery;
- (BOOL)isInLowDataMode;
- (BOOL)isInLowPowerMode;
- (BOOL)isInModerateThermalPressure;
- (BOOL)isInPoorNetworkConnection;
- (BOOL)isInSoftResetSync;
- (BOOL)isLocalModeEnabled;
- (BOOL)isLowDiskSpace;
- (BOOL)isMockStatus;
- (BOOL)isOffline;
- (BOOL)isOptimizingSystemPerformance;
- (BOOL)isRebuildingThumbnails;
- (BOOL)isSyncing;
- (BOOL)isUpgradeSuggestedToAccessAllPhotos;
- (BOOL)isUserPaused;
- (BOOL)isVeryLowDiskSpace;
- (NSDate)exitDate;
- (NSDate)syncDate;
- (NSString)cloudQuotaCustomActionTitle;
- (NSString)cloudQuotaCustomMessage;
- (NSString)cloudQuotaCustomTitle;
- (NSString)stringRepresentation;
- (PXCPLStatus)init;
- (float)fractionCompletedForLibraryRebuild;
- (float)fractionCompletedForUpload;
- (id)_dictionaryRepresentation;
- (id)_initWithDictionaryRepresentation:(id)a3 currentDate:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cloudQuotaState;
- (int64_t)percentCompletedForLibraryRebuild;
- (int64_t)percentCompletedForUpload;
- (int64_t)sharedLibraryState;
- (unint64_t)numberOfItemsFailingToUpload;
- (unint64_t)numberOfItemsToAdd;
- (unint64_t)numberOfItemsToUpload;
- (unint64_t)numberOfOriginalsToDownload;
- (unint64_t)numberOfOtherAssets;
- (unint64_t)numberOfPhotoAssets;
- (unint64_t)numberOfReferencedItems;
- (unint64_t)numberOfVideoAssets;
- (unint64_t)sharedLibraryExitingWithNumberOfAssetsRemaining;
- (unint64_t)sharedLibraryMovingToPersonal;
- (unint64_t)sharedLibraryMovingToShared;
- (void)setCloudQuotaCustomActionTitle:(id)a3;
- (void)setCloudQuotaCustomMessage:(id)a3;
- (void)setCloudQuotaCustomTitle:(id)a3;
- (void)setCloudQuotaState:(int64_t)a3;
- (void)setExitDate:(id)a3;
- (void)setFractionCompletedForLibraryRebuild:(float)a3;
- (void)setFractionCompletedForUpload:(float)a3;
- (void)setHasCloudQuotaOffer:(BOOL)a3;
- (void)setIsCapturingSnapshot:(BOOL)a3;
- (void)setIsCellularDataDisabled:(BOOL)a3;
- (void)setIsClientNotAuthenticated:(BOOL)a3;
- (void)setIsClientVersionTooOld:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsExceedingBatteryQuota:(BOOL)a3;
- (void)setIsExceedingCellularQuota:(BOOL)a3;
- (void)setIsExceedingQuota:(BOOL)a3;
- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3;
- (void)setIsInAirplaneMode:(BOOL)a3;
- (void)setIsInHardResetSync:(BOOL)a3;
- (void)setIsInHeavyThermalPressure:(BOOL)a3;
- (void)setIsInLowBattery:(BOOL)a3;
- (void)setIsInLowDataMode:(BOOL)a3;
- (void)setIsInLowPowerMode:(BOOL)a3;
- (void)setIsInModerateThermalPressure:(BOOL)a3;
- (void)setIsInPoorNetworkConnection:(BOOL)a3;
- (void)setIsInSoftResetSync:(BOOL)a3;
- (void)setIsLocalModeEnabled:(BOOL)a3;
- (void)setIsLowDiskSpace:(BOOL)a3;
- (void)setIsMockStatus:(BOOL)a3;
- (void)setIsOffline:(BOOL)a3;
- (void)setIsOptimizingSystemPerformance:(BOOL)a3;
- (void)setIsRebuildingThumbnails:(BOOL)a3;
- (void)setIsSyncing:(BOOL)a3;
- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3;
- (void)setIsUserPaused:(BOOL)a3;
- (void)setIsVeryLowDiskSpace:(BOOL)a3;
- (void)setNumberOfItemsFailingToUpload:(unint64_t)a3;
- (void)setNumberOfItemsToAdd:(unint64_t)a3;
- (void)setNumberOfItemsToUpload:(unint64_t)a3;
- (void)setNumberOfOriginalsToDownload:(unint64_t)a3;
- (void)setNumberOfOtherAssets:(unint64_t)a3;
- (void)setNumberOfPhotoAssets:(unint64_t)a3;
- (void)setNumberOfReferencedItems:(unint64_t)a3;
- (void)setNumberOfVideoAssets:(unint64_t)a3;
- (void)setPercentCompletedForLibraryRebuild:(int64_t)a3;
- (void)setPercentCompletedForUpload:(int64_t)a3;
- (void)setSharedLibraryExitingWithNumberOfAssetsRemaining:(unint64_t)a3;
- (void)setSharedLibraryMovingToPersonal:(unint64_t)a3;
- (void)setSharedLibraryMovingToShared:(unint64_t)a3;
- (void)setSharedLibraryState:(int64_t)a3;
- (void)setSyncDate:(id)a3;
@end

@implementation PXCPLStatus

- (NSString)stringRepresentation
{
  v2 = [(PXCPLStatus *)self _dictionaryRepresentation];
  v3 = _DictionaryRepresentationToString(v2);

  return (NSString *)v3;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = [(PXCPLStatus *)self isEnabled];
  v5 = [NSNumber numberWithBool:v4];
  v6 = [v5 stringValue];
  [v3 setObject:v6 forKeyedSubscript:@"enabled"];

  int64_t v7 = [(PXCPLStatus *)self percentCompletedForLibraryRebuild];
  if (v7 != -1)
  {
    v8 = [NSNumber numberWithInteger:v7];
    v9 = [v8 stringValue];
    [v3 setObject:v9 forKeyedSubscript:@"rebuild"];
  }
  if ([(PXCPLStatus *)self isRebuildingThumbnails])
  {
    v10 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v10 forKeyedSubscript:@"thumbnails"];
  }
  if ([(PXCPLStatus *)self isSyncing])
  {
    v11 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v11 forKeyedSubscript:@"syncing"];
  }
  unint64_t v12 = [(PXCPLStatus *)self numberOfItemsToUpload];
  if (v12)
  {
    v13 = [NSNumber numberWithInteger:v12];
    v14 = [v13 stringValue];
    [v3 setObject:v14 forKeyedSubscript:@"upload"];
  }
  int64_t v15 = [(PXCPLStatus *)self percentCompletedForUpload];
  if (v15 != -1)
  {
    v16 = [NSNumber numberWithInteger:v15];
    v17 = [v16 stringValue];
    [v3 setObject:v17 forKeyedSubscript:@"progress"];
  }
  unint64_t v18 = [(PXCPLStatus *)self numberOfItemsToAdd];
  if (v18)
  {
    v19 = [NSNumber numberWithInteger:v18];
    v20 = [v19 stringValue];
    [v3 setObject:v20 forKeyedSubscript:@"add"];
  }
  unint64_t v21 = [(PXCPLStatus *)self numberOfOriginalsToDownload];
  if (v21)
  {
    v22 = [NSNumber numberWithInteger:v21];
    v23 = [v22 stringValue];
    [v3 setObject:v23 forKeyedSubscript:@"download"];
  }
  if ([(PXCPLStatus *)self isOffline])
  {
    v24 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v24 forKeyedSubscript:@"offline"];
  }
  if ([(PXCPLStatus *)self isInSoftResetSync])
  {
    v25 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v25 forKeyedSubscript:@"soft-reset"];
  }
  if ([(PXCPLStatus *)self isInHardResetSync])
  {
    v26 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v26 forKeyedSubscript:@"hard-reset"];
  }
  if ([(PXCPLStatus *)self isExceedingQuota])
  {
    v27 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v27 forKeyedSubscript:@"cloud-quota"];
  }
  if ([(PXCPLStatus *)self hasCloudQuotaOffer])
  {
    v28 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v28 forKeyedSubscript:@"offer"];
  }
  int64_t v29 = [(PXCPLStatus *)self cloudQuotaState];
  if (v29 == 1)
  {
    v30 = @"almost-full";
  }
  else
  {
    if (v29 != 2) {
      goto LABEL_30;
    }
    v30 = @"full";
  }
  [v3 setObject:v30 forKeyedSubscript:@"quota-state"];
LABEL_30:
  v31 = [(PXCPLStatus *)self cloudQuotaCustomTitle];
  if ([v31 length]) {
    [v3 setObject:v31 forKeyedSubscript:@"quota-custom-title"];
  }

  v32 = [(PXCPLStatus *)self cloudQuotaCustomMessage];
  if ([v32 length]) {
    [v3 setObject:v32 forKeyedSubscript:@"quota-custom-message"];
  }

  v33 = [(PXCPLStatus *)self cloudQuotaCustomActionTitle];
  if ([v33 length]) {
    [v3 setObject:v33 forKeyedSubscript:@"quota-custom-action-title"];
  }

  if ([(PXCPLStatus *)self isLowDiskSpace])
  {
    v34 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v34 forKeyedSubscript:@"low-disk-space"];
  }
  if ([(PXCPLStatus *)self isVeryLowDiskSpace])
  {
    v35 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v35 forKeyedSubscript:@"very-low-disk-space"];
  }
  if ([(PXCPLStatus *)self isExceedingBatteryQuota])
  {
    v36 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v36 forKeyedSubscript:@"battery-budget"];
  }
  if ([(PXCPLStatus *)self isExceedingCellularQuota])
  {
    v37 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v37 forKeyedSubscript:@"cellular-budget"];
  }
  if ([(PXCPLStatus *)self isCellularDataDisabled])
  {
    v38 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v38 forKeyedSubscript:@"cellular-disabled"];
  }
  if ([(PXCPLStatus *)self isInAirplaneMode])
  {
    v39 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v39 forKeyedSubscript:@"airplane-mode"];
  }
  if ([(PXCPLStatus *)self isUserPaused])
  {
    v40 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v40 forKeyedSubscript:@"user"];
  }
  if ([(PXCPLStatus *)self isInLowDataMode])
  {
    v41 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v41 forKeyedSubscript:@"low-data-mode"];
  }
  if ([(PXCPLStatus *)self isInLowPowerMode])
  {
    v42 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v42 forKeyedSubscript:@"low-power-mode"];
  }
  if ([(PXCPLStatus *)self isClientVersionTooOld])
  {
    v43 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v43 forKeyedSubscript:@"version"];
  }
  if ([(PXCPLStatus *)self isClientNotAuthenticated])
  {
    v44 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v44 forKeyedSubscript:@"authenticate"];
  }
  if ([(PXCPLStatus *)self isCapturingSnapshot])
  {
    v45 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v45 forKeyedSubscript:@"capture-snapshot"];
  }
  if ([(PXCPLStatus *)self isOptimizingSystemPerformance])
  {
    v46 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v46 forKeyedSubscript:@"optimizing-system-performance"];
  }
  if ([(PXCPLStatus *)self isInPoorNetworkConnection])
  {
    v47 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v47 forKeyedSubscript:@"poor-network-connection"];
  }
  if ([(PXCPLStatus *)self isInModerateThermalPressure])
  {
    v48 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v48 forKeyedSubscript:@"moderate-thermal-pressure"];
  }
  if ([(PXCPLStatus *)self isInHeavyThermalPressure])
  {
    v49 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v49 forKeyedSubscript:@"heavy-thermal-pressure"];
  }
  if ([(PXCPLStatus *)self isInLowBattery])
  {
    v50 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v50 forKeyedSubscript:@"low-battery"];
  }
  v51 = [(PXCPLStatus *)self syncDate];
  if (v51)
  {
    v52 = _SerializationDateFormatter();
    v53 = [v52 stringFromDate:v51];
    [v3 setObject:v53 forKeyedSubscript:@"sync-date"];
  }
  v54 = [(PXCPLStatus *)self exitDate];
  if (v54)
  {
    v55 = _SerializationDateFormatter();
    v56 = [v55 stringFromDate:v54];
    [v3 setObject:v56 forKeyedSubscript:@"exit-date"];
  }
  unint64_t v57 = [(PXCPLStatus *)self numberOfItemsFailingToUpload];
  if (v57)
  {
    v58 = [NSNumber numberWithInteger:v57];
    v59 = [v58 stringValue];
    [v3 setObject:v59 forKeyedSubscript:@"failed"];
  }
  unint64_t v60 = [(PXCPLStatus *)self numberOfReferencedItems];
  if (v60)
  {
    v61 = [NSNumber numberWithInteger:v60];
    v62 = [v61 stringValue];
    [v3 setObject:v62 forKeyedSubscript:@"referenced"];
  }
  unint64_t v63 = [(PXCPLStatus *)self numberOfPhotoAssets];
  if (v63)
  {
    v64 = [NSNumber numberWithInteger:v63];
    v65 = [v64 stringValue];
    [v3 setObject:v65 forKeyedSubscript:@"photos"];
  }
  unint64_t v66 = [(PXCPLStatus *)self numberOfVideoAssets];
  if (v66)
  {
    v67 = [NSNumber numberWithInteger:v66];
    v68 = [v67 stringValue];
    [v3 setObject:v68 forKeyedSubscript:@"videos"];
  }
  unint64_t v69 = [(PXCPLStatus *)self numberOfOtherAssets];
  if (v69)
  {
    v70 = [NSNumber numberWithInteger:v69];
    v71 = [v70 stringValue];
    [v3 setObject:v71 forKeyedSubscript:@"others"];
  }
  unint64_t v72 = [(PXCPLStatus *)self sharedLibraryState] - 1;
  if (v72 <= 2) {
    [v3 setObject:off_1E5DBC690[v72] forKeyedSubscript:@"shared-library-state"];
  }
  unint64_t v73 = [(PXCPLStatus *)self sharedLibraryExitingWithNumberOfAssetsRemaining];
  if (v73)
  {
    v74 = [NSNumber numberWithInteger:v73];
    v75 = [v74 stringValue];
    [v3 setObject:v75 forKeyedSubscript:@"shared-library-exiting-count"];
  }
  unint64_t v76 = [(PXCPLStatus *)self sharedLibraryMovingToShared];
  if (v76)
  {
    v77 = [NSNumber numberWithInteger:v76];
    v78 = [v77 stringValue];
    [v3 setObject:v78 forKeyedSubscript:@"move-to-shared"];
  }
  unint64_t v79 = [(PXCPLStatus *)self sharedLibraryMovingToPersonal];
  if (v79)
  {
    v80 = [NSNumber numberWithInteger:v79];
    v81 = [v80 stringValue];
    [v3 setObject:v81 forKeyedSubscript:@"move-to-personal"];
  }
  if ([(PXCPLStatus *)self isExceedingSharedLibraryQuota])
  {
    v82 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v82 forKeyedSubscript:@"shared-library-cloud-quota"];
  }
  if ([(PXCPLStatus *)self isLocalModeEnabled])
  {
    v83 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v83 forKeyedSubscript:@"local-mode"];
  }
  if ([(PXCPLStatus *)self isUpgradeSuggestedToAccessAllPhotos])
  {
    v84 = [MEMORY[0x1E4F1CC38] stringValue];
    [v3 setObject:v84 forKeyedSubscript:@"upgrade-suggested"];
  }
  id v85 = v3;

  return v85;
}

- (id)_initWithDictionaryRepresentation:(id)a3 currentDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v158 = [MEMORY[0x1E4F28B00] currentHandler];
    [v158 handleFailureInMethod:a2, self, @"PXCPLStatus_Serialization.m", 298, @"Invalid parameter not satisfying: %@", @"dictionaryRepresentation" object file lineNumber description];
  }
  v9 = [(PXCPLStatus *)self init];

  if (v9)
  {
    v10 = [v7 objectForKeyedSubscript:@"enabled"];
    v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 BOOLValue];
    }
    else {
      uint64_t v12 = 0;
    }
    [(PXCPLStatus *)v9 setIsEnabled:v12];

    v13 = [v7 objectForKeyedSubscript:@"rebuild"];
    v14 = v13;
    if (v13 && ([v13 isEqualToString:@"-"] & 1) == 0) {
      uint64_t v15 = [v14 integerValue];
    }
    else {
      uint64_t v15 = -1;
    }
    [(PXCPLStatus *)v9 setPercentCompletedForLibraryRebuild:v15];

    v16 = [v7 objectForKeyedSubscript:@"thumbnails"];
    v17 = v16;
    if (v16) {
      uint64_t v18 = [v16 BOOLValue];
    }
    else {
      uint64_t v18 = 0;
    }
    [(PXCPLStatus *)v9 setIsRebuildingThumbnails:v18];

    v19 = [v7 objectForKeyedSubscript:@"syncing"];
    v20 = v19;
    if (v19) {
      uint64_t v21 = [v19 BOOLValue];
    }
    else {
      uint64_t v21 = 0;
    }
    [(PXCPLStatus *)v9 setIsSyncing:v21];

    v22 = [v7 objectForKeyedSubscript:@"upload"];
    v23 = v22;
    if (v22) {
      uint64_t v24 = [v22 integerValue];
    }
    else {
      uint64_t v24 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfItemsToUpload:v24];

    v25 = [v7 objectForKeyedSubscript:@"progress"];
    v26 = v25;
    if (v25 && ([v25 isEqualToString:@"-"] & 1) == 0) {
      uint64_t v27 = [v26 integerValue];
    }
    else {
      uint64_t v27 = -1;
    }
    [(PXCPLStatus *)v9 setPercentCompletedForUpload:v27];

    v28 = [v7 objectForKeyedSubscript:@"add"];
    int64_t v29 = v28;
    if (v28) {
      uint64_t v30 = [v28 integerValue];
    }
    else {
      uint64_t v30 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfItemsToAdd:v30];

    v31 = [v7 objectForKeyedSubscript:@"download"];
    v32 = v31;
    if (v31) {
      uint64_t v33 = [v31 integerValue];
    }
    else {
      uint64_t v33 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfOriginalsToDownload:v33];

    v34 = [v7 objectForKeyedSubscript:@"offline"];
    v35 = v34;
    if (v34) {
      uint64_t v36 = [v34 BOOLValue];
    }
    else {
      uint64_t v36 = 0;
    }
    [(PXCPLStatus *)v9 setIsOffline:v36];

    v37 = [v7 objectForKeyedSubscript:@"soft-reset"];
    v38 = v37;
    if (v37) {
      uint64_t v39 = [v37 BOOLValue];
    }
    else {
      uint64_t v39 = 0;
    }
    [(PXCPLStatus *)v9 setIsInSoftResetSync:v39];

    v40 = [v7 objectForKeyedSubscript:@"hard-reset"];
    v41 = v40;
    if (v40) {
      uint64_t v42 = [v40 BOOLValue];
    }
    else {
      uint64_t v42 = 0;
    }
    [(PXCPLStatus *)v9 setIsInHardResetSync:v42];

    v43 = [v7 objectForKeyedSubscript:@"cloud-quota"];
    v44 = v43;
    if (v43) {
      uint64_t v45 = [v43 BOOLValue];
    }
    else {
      uint64_t v45 = 0;
    }
    [(PXCPLStatus *)v9 setIsExceedingQuota:v45];

    v46 = [v7 objectForKeyedSubscript:@"offer"];
    v47 = v46;
    if (v46) {
      uint64_t v48 = [v46 BOOLValue];
    }
    else {
      uint64_t v48 = 0;
    }
    [(PXCPLStatus *)v9 setHasCloudQuotaOffer:v48];

    v49 = [v7 objectForKeyedSubscript:@"quota-state"];
    if ([v49 isEqualToString:@"almost-full"])
    {
      uint64_t v50 = 1;
    }
    else if ([v49 isEqualToString:@"full"])
    {
      uint64_t v50 = 2;
    }
    else
    {
      uint64_t v50 = 0;
    }
    [(PXCPLStatus *)v9 setCloudQuotaState:v50];

    v51 = [v7 objectForKeyedSubscript:@"quota-custom-title"];
    if ([v51 length] && (objc_msgSend(v51, "isEqualToString:", @"-") & 1) == 0) {
      id v52 = v51;
    }
    else {
      id v52 = 0;
    }
    [(PXCPLStatus *)v9 setCloudQuotaCustomTitle:v52];
    id v53 = v52;

    v54 = [v7 objectForKeyedSubscript:@"quota-custom-message"];
    if ([v54 length] && (objc_msgSend(v54, "isEqualToString:", @"-") & 1) == 0) {
      id v55 = v54;
    }
    else {
      id v55 = 0;
    }
    [(PXCPLStatus *)v9 setCloudQuotaCustomMessage:v55];
    id v56 = v55;

    unint64_t v57 = [v7 objectForKeyedSubscript:@"quota-custom-action-title"];
    if ([v57 length] && (objc_msgSend(v57, "isEqualToString:", @"-") & 1) == 0) {
      id v58 = v57;
    }
    else {
      id v58 = 0;
    }
    [(PXCPLStatus *)v9 setCloudQuotaCustomActionTitle:v58];
    id v59 = v58;

    unint64_t v60 = [v7 objectForKeyedSubscript:@"low-disk-space"];
    v61 = v60;
    if (v60) {
      uint64_t v62 = [v60 BOOLValue];
    }
    else {
      uint64_t v62 = 0;
    }
    [(PXCPLStatus *)v9 setIsLowDiskSpace:v62];

    unint64_t v63 = [v7 objectForKeyedSubscript:@"very-low-disk-space"];
    v64 = v63;
    if (v63) {
      uint64_t v65 = [v63 BOOLValue];
    }
    else {
      uint64_t v65 = 0;
    }
    [(PXCPLStatus *)v9 setIsVeryLowDiskSpace:v65];

    unint64_t v66 = [v7 objectForKeyedSubscript:@"battery-budget"];
    v67 = v66;
    if (v66) {
      uint64_t v68 = [v66 BOOLValue];
    }
    else {
      uint64_t v68 = 0;
    }
    [(PXCPLStatus *)v9 setIsExceedingBatteryQuota:v68];

    unint64_t v69 = [v7 objectForKeyedSubscript:@"cellular-budget"];
    v70 = v69;
    if (v69) {
      uint64_t v71 = [v69 BOOLValue];
    }
    else {
      uint64_t v71 = 0;
    }
    [(PXCPLStatus *)v9 setIsExceedingCellularQuota:v71];

    unint64_t v72 = [v7 objectForKeyedSubscript:@"cellular-disabled"];
    unint64_t v73 = v72;
    if (v72) {
      uint64_t v74 = [v72 BOOLValue];
    }
    else {
      uint64_t v74 = 0;
    }
    [(PXCPLStatus *)v9 setIsCellularDataDisabled:v74];

    v75 = [v7 objectForKeyedSubscript:@"airplane-mode"];
    unint64_t v76 = v75;
    if (v75) {
      uint64_t v77 = [v75 BOOLValue];
    }
    else {
      uint64_t v77 = 0;
    }
    [(PXCPLStatus *)v9 setIsInAirplaneMode:v77];

    v78 = [v7 objectForKeyedSubscript:@"user"];
    unint64_t v79 = v78;
    if (v78) {
      uint64_t v80 = [v78 BOOLValue];
    }
    else {
      uint64_t v80 = 0;
    }
    [(PXCPLStatus *)v9 setIsUserPaused:v80];

    v81 = [v7 objectForKeyedSubscript:@"low-data-mode"];
    v82 = v81;
    if (v81) {
      uint64_t v83 = [v81 BOOLValue];
    }
    else {
      uint64_t v83 = 0;
    }
    [(PXCPLStatus *)v9 setIsInLowDataMode:v83];

    v84 = [v7 objectForKeyedSubscript:@"low-power-mode"];
    id v85 = v84;
    if (v84) {
      uint64_t v86 = [v84 BOOLValue];
    }
    else {
      uint64_t v86 = 0;
    }
    [(PXCPLStatus *)v9 setIsInLowPowerMode:v86];

    v87 = [v7 objectForKeyedSubscript:@"version"];
    v88 = v87;
    if (v87) {
      uint64_t v89 = [v87 BOOLValue];
    }
    else {
      uint64_t v89 = 0;
    }
    [(PXCPLStatus *)v9 setIsClientVersionTooOld:v89];

    v90 = [v7 objectForKeyedSubscript:@"authenticate"];
    v91 = v90;
    if (v90) {
      uint64_t v92 = [v90 BOOLValue];
    }
    else {
      uint64_t v92 = 0;
    }
    [(PXCPLStatus *)v9 setIsClientNotAuthenticated:v92];

    v93 = [v7 objectForKeyedSubscript:@"capture-snapshot"];
    v94 = v93;
    if (v93) {
      uint64_t v95 = [v93 BOOLValue];
    }
    else {
      uint64_t v95 = 0;
    }
    [(PXCPLStatus *)v9 setIsCapturingSnapshot:v95];

    v96 = [v7 objectForKeyedSubscript:@"optimizing-system-performance"];
    v97 = v96;
    if (v96) {
      uint64_t v98 = [v96 BOOLValue];
    }
    else {
      uint64_t v98 = 0;
    }
    [(PXCPLStatus *)v9 setIsOptimizingSystemPerformance:v98];

    v99 = [v7 objectForKeyedSubscript:@"poor-network-connection"];
    v100 = v99;
    if (v99) {
      uint64_t v101 = [v99 BOOLValue];
    }
    else {
      uint64_t v101 = 0;
    }
    [(PXCPLStatus *)v9 setIsInPoorNetworkConnection:v101];

    v102 = [v7 objectForKeyedSubscript:@"moderate-thermal-pressure"];
    v103 = v102;
    if (v102) {
      uint64_t v104 = [v102 BOOLValue];
    }
    else {
      uint64_t v104 = 0;
    }
    [(PXCPLStatus *)v9 setIsInModerateThermalPressure:v104];

    v105 = [v7 objectForKeyedSubscript:@"heavy-thermal-pressure"];
    v106 = v105;
    if (v105) {
      uint64_t v107 = [v105 BOOLValue];
    }
    else {
      uint64_t v107 = 0;
    }
    [(PXCPLStatus *)v9 setIsInHeavyThermalPressure:v107];

    v108 = [v7 objectForKeyedSubscript:@"low-battery"];
    v109 = v108;
    if (v108) {
      uint64_t v110 = [v108 BOOLValue];
    }
    else {
      uint64_t v110 = 0;
    }
    [(PXCPLStatus *)v9 setIsInLowBattery:v110];

    v111 = [v7 objectForKeyedSubscript:@"sync-date"];
    v112 = v111;
    if (v111 && ([v111 isEqualToString:@"-"] & 1) == 0)
    {
      v113 = _DateForPlaceholderString(v112, v8);
      if (!v113)
      {
        v114 = _SerializationDateFormatter();
        v113 = [v114 dateFromString:v112];
      }
    }
    else
    {
      v113 = 0;
    }
    [(PXCPLStatus *)v9 setSyncDate:v113];
    id v115 = v113;

    v116 = [v7 objectForKeyedSubscript:@"exit-date"];
    v117 = v116;
    if (v116 && ([v116 isEqualToString:@"-"] & 1) == 0)
    {
      v118 = _DateForPlaceholderString(v117, v8);
      if (!v118)
      {
        v119 = _SerializationDateFormatter();
        v118 = [v119 dateFromString:v117];
      }
    }
    else
    {
      v118 = 0;
    }
    [(PXCPLStatus *)v9 setExitDate:v118];
    id v120 = v118;

    v121 = [v7 objectForKeyedSubscript:@"failed"];
    v122 = v121;
    if (v121) {
      uint64_t v123 = [v121 integerValue];
    }
    else {
      uint64_t v123 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfItemsFailingToUpload:v123];

    v124 = [v7 objectForKeyedSubscript:@"referenced"];
    v125 = v124;
    if (v124) {
      uint64_t v126 = [v124 integerValue];
    }
    else {
      uint64_t v126 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfReferencedItems:v126];

    v127 = [v7 objectForKeyedSubscript:@"photos"];
    v128 = v127;
    if (v127) {
      uint64_t v129 = [v127 integerValue];
    }
    else {
      uint64_t v129 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfPhotoAssets:v129];

    v130 = [v7 objectForKeyedSubscript:@"videos"];
    v131 = v130;
    if (v130) {
      uint64_t v132 = [v130 integerValue];
    }
    else {
      uint64_t v132 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfVideoAssets:v132];

    v133 = [v7 objectForKeyedSubscript:@"others"];
    v134 = v133;
    if (v133) {
      uint64_t v135 = [v133 integerValue];
    }
    else {
      uint64_t v135 = 0;
    }
    [(PXCPLStatus *)v9 setNumberOfOtherAssets:v135];

    v136 = [v7 objectForKeyedSubscript:@"shared-library-state"];
    if ([v136 isEqualToString:@"active"])
    {
      uint64_t v137 = 1;
    }
    else if ([v136 isEqualToString:@"deleting"])
    {
      uint64_t v137 = 2;
    }
    else if ([v136 isEqualToString:@"leaving"])
    {
      uint64_t v137 = 3;
    }
    else
    {
      uint64_t v137 = 0;
    }
    [(PXCPLStatus *)v9 setSharedLibraryState:v137];

    v138 = [v7 objectForKeyedSubscript:@"shared-library-exiting-count"];
    v139 = v138;
    if (v138) {
      uint64_t v140 = [v138 integerValue];
    }
    else {
      uint64_t v140 = 0;
    }
    [(PXCPLStatus *)v9 setSharedLibraryExitingWithNumberOfAssetsRemaining:v140];

    v141 = [v7 objectForKeyedSubscript:@"move-to-shared"];
    v142 = v141;
    if (v141) {
      uint64_t v143 = [v141 integerValue];
    }
    else {
      uint64_t v143 = 0;
    }
    [(PXCPLStatus *)v9 setSharedLibraryMovingToShared:v143];

    v144 = [v7 objectForKeyedSubscript:@"move-to-personal"];
    v145 = v144;
    if (v144) {
      uint64_t v146 = [v144 integerValue];
    }
    else {
      uint64_t v146 = 0;
    }
    [(PXCPLStatus *)v9 setSharedLibraryMovingToPersonal:v146];

    v147 = [v7 objectForKeyedSubscript:@"shared-library-cloud-quota"];
    v148 = v147;
    if (v147) {
      uint64_t v149 = [v147 BOOLValue];
    }
    else {
      uint64_t v149 = 0;
    }
    [(PXCPLStatus *)v9 setIsExceedingSharedLibraryQuota:v149];

    v150 = [v7 objectForKeyedSubscript:@"local-mode"];
    v151 = v150;
    if (v150) {
      uint64_t v152 = [v150 BOOLValue];
    }
    else {
      uint64_t v152 = 0;
    }
    [(PXCPLStatus *)v9 setIsLocalModeEnabled:v152];

    v153 = [v7 objectForKeyedSubscript:@"upgrade-suggested"];
    v154 = v153;
    if (v153) {
      uint64_t v155 = [v153 BOOLValue];
    }
    else {
      uint64_t v155 = 0;
    }
    [(PXCPLStatus *)v9 setIsUpgradeSuggestedToAccessAllPhotos:v155];
  }
  v156 = v9;

  return v156;
}

+ (PXCPLStatus)statusWithStringRepresentation:(id)a3 currentDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSDictionary<NSString *,id> * _Nullable _StringToDictionaryRepresentation(NSString *__strong)"];
    [v16 handleFailureInFunction:v17, @"PXCPLStatus_Serialization.m", 140, @"Invalid parameter not satisfying: %@", @"string" file lineNumber description];
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__123645;
  v23 = __Block_byref_object_dispose__123646;
  id v24 = 0;
  if ([v8 hasPrefix:@"{"]
    && [v8 hasSuffix:@"}"])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = (void *)v20[5];
    v20[5] = (uint64_t)v9;

    v11 = objc_msgSend(v8, "substringWithRange:", 1, objc_msgSend(v8, "length") - 2);
    uint64_t v12 = [v11 componentsSeparatedByString:@"; "];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___StringToDictionaryRepresentation_block_invoke;
    v18[3] = &unk_1E5DBC670;
    v18[4] = &v19;
    [v12 enumerateObjectsUsingBlock:v18];
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  if (v13) {
    v14 = (void *)[objc_alloc((Class)a1) _initWithDictionaryRepresentation:v13 currentDate:v7];
  }
  else {
    v14 = 0;
  }

  return (PXCPLStatus *)v14;
}

+ (PXCPLStatus)statusWithStringRepresentation:(id)a3
{
  return (PXCPLStatus *)[a1 statusWithStringRepresentation:a3 currentDate:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudQuotaCustomActionTitle, 0);
  objc_storeStrong((id *)&self->_cloudQuotaCustomMessage, 0);
  objc_storeStrong((id *)&self->_cloudQuotaCustomTitle, 0);
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_syncDate, 0);
}

- (void)setPercentCompletedForUpload:(int64_t)a3
{
  self->_percentCompletedForUpload = a3;
}

- (int64_t)percentCompletedForUpload
{
  return self->_percentCompletedForUpload;
}

- (void)setPercentCompletedForLibraryRebuild:(int64_t)a3
{
  self->_percentCompletedForLibraryRebuild = a3;
}

- (int64_t)percentCompletedForLibraryRebuild
{
  return self->_percentCompletedForLibraryRebuild;
}

- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  self->_isUpgradeSuggestedToAccessAllPhotos = a3;
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return self->_isUpgradeSuggestedToAccessAllPhotos;
}

- (void)setIsMockStatus:(BOOL)a3
{
  self->_isMockStatus = a3;
}

- (BOOL)isMockStatus
{
  return self->_isMockStatus;
}

- (void)setIsLocalModeEnabled:(BOOL)a3
{
  self->_isLocalModeEnabled = a3;
}

- (BOOL)isLocalModeEnabled
{
  return self->_isLocalModeEnabled;
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  self->_isExceedingSharedLibraryQuota = a3;
}

- (BOOL)isExceedingSharedLibraryQuota
{
  return self->_isExceedingSharedLibraryQuota;
}

- (void)setSharedLibraryMovingToPersonal:(unint64_t)a3
{
  self->_sharedLibraryMovingToPersonal = a3;
}

- (unint64_t)sharedLibraryMovingToPersonal
{
  return self->_sharedLibraryMovingToPersonal;
}

- (void)setSharedLibraryMovingToShared:(unint64_t)a3
{
  self->_sharedLibraryMovingToShared = a3;
}

- (unint64_t)sharedLibraryMovingToShared
{
  return self->_sharedLibraryMovingToShared;
}

- (void)setSharedLibraryExitingWithNumberOfAssetsRemaining:(unint64_t)a3
{
  self->_sharedLibraryExitingWithNumberOfAssetsRemaining = a3;
}

- (unint64_t)sharedLibraryExitingWithNumberOfAssetsRemaining
{
  return self->_sharedLibraryExitingWithNumberOfAssetsRemaining;
}

- (void)setSharedLibraryState:(int64_t)a3
{
  self->_sharedLibraryState = a3;
}

- (int64_t)sharedLibraryState
{
  return self->_sharedLibraryState;
}

- (void)setCloudQuotaCustomActionTitle:(id)a3
{
}

- (NSString)cloudQuotaCustomActionTitle
{
  return self->_cloudQuotaCustomActionTitle;
}

- (void)setCloudQuotaCustomMessage:(id)a3
{
}

- (NSString)cloudQuotaCustomMessage
{
  return self->_cloudQuotaCustomMessage;
}

- (void)setCloudQuotaCustomTitle:(id)a3
{
}

- (NSString)cloudQuotaCustomTitle
{
  return self->_cloudQuotaCustomTitle;
}

- (void)setCloudQuotaState:(int64_t)a3
{
  self->_cloudQuotaState = a3;
}

- (int64_t)cloudQuotaState
{
  return self->_cloudQuotaState;
}

- (void)setHasCloudQuotaOffer:(BOOL)a3
{
  self->_hasCloudQuotaOffer = a3;
}

- (BOOL)hasCloudQuotaOffer
{
  return self->_hasCloudQuotaOffer;
}

- (void)setIsInLowBattery:(BOOL)a3
{
  self->_isInLowBattery = a3;
}

- (BOOL)isInLowBattery
{
  return self->_isInLowBattery;
}

- (void)setIsInHeavyThermalPressure:(BOOL)a3
{
  self->_isInHeavyThermalPressure = a3;
}

- (BOOL)isInHeavyThermalPressure
{
  return self->_isInHeavyThermalPressure;
}

- (void)setIsInModerateThermalPressure:(BOOL)a3
{
  self->_isInModerateThermalPressure = a3;
}

- (BOOL)isInModerateThermalPressure
{
  return self->_isInModerateThermalPressure;
}

- (void)setIsInPoorNetworkConnection:(BOOL)a3
{
  self->_isInPoorNetworkConnection = a3;
}

- (BOOL)isInPoorNetworkConnection
{
  return self->_isInPoorNetworkConnection;
}

- (void)setIsOptimizingSystemPerformance:(BOOL)a3
{
  self->_isOptimizingSystemPerformance = a3;
}

- (BOOL)isOptimizingSystemPerformance
{
  return self->_isOptimizingSystemPerformance;
}

- (void)setIsCapturingSnapshot:(BOOL)a3
{
  self->_isCapturingSnapshot = a3;
}

- (BOOL)isCapturingSnapshot
{
  return self->_isCapturingSnapshot;
}

- (void)setIsInHardResetSync:(BOOL)a3
{
  self->_isInHardResetSync = a3;
}

- (BOOL)isInHardResetSync
{
  return self->_isInHardResetSync;
}

- (void)setIsInSoftResetSync:(BOOL)a3
{
  self->_isInSoftResetSync = a3;
}

- (BOOL)isInSoftResetSync
{
  return self->_isInSoftResetSync;
}

- (void)setIsOffline:(BOOL)a3
{
  self->_isOffline = a3;
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (void)setIsClientNotAuthenticated:(BOOL)a3
{
  self->_isClientNotAuthenticated = a3;
}

- (BOOL)isClientNotAuthenticated
{
  return self->_isClientNotAuthenticated;
}

- (void)setIsClientVersionTooOld:(BOOL)a3
{
  self->_isClientVersionTooOld = a3;
}

- (BOOL)isClientVersionTooOld
{
  return self->_isClientVersionTooOld;
}

- (void)setIsInAirplaneMode:(BOOL)a3
{
  self->_isInAirplaneMode = a3;
}

- (BOOL)isInAirplaneMode
{
  return self->_isInAirplaneMode;
}

- (void)setIsCellularDataDisabled:(BOOL)a3
{
  self->_isCellularDataDisabled = a3;
}

- (BOOL)isCellularDataDisabled
{
  return self->_isCellularDataDisabled;
}

- (void)setIsExceedingQuota:(BOOL)a3
{
  self->_isExceedingQuota = a3;
}

- (BOOL)isExceedingQuota
{
  return self->_isExceedingQuota;
}

- (void)setIsVeryLowDiskSpace:(BOOL)a3
{
  self->_isVeryLowDiskSpace = a3;
}

- (BOOL)isVeryLowDiskSpace
{
  return self->_isVeryLowDiskSpace;
}

- (void)setIsLowDiskSpace:(BOOL)a3
{
  self->_isLowDiskSpace = a3;
}

- (BOOL)isLowDiskSpace
{
  return self->_isLowDiskSpace;
}

- (void)setIsExceedingCellularQuota:(BOOL)a3
{
  self->_isExceedingCellularQuota = a3;
}

- (BOOL)isExceedingCellularQuota
{
  return self->_isExceedingCellularQuota;
}

- (void)setIsExceedingBatteryQuota:(BOOL)a3
{
  self->_isExceedingBatteryQuota = a3;
}

- (BOOL)isExceedingBatteryQuota
{
  return self->_isExceedingBatteryQuota;
}

- (void)setIsInLowPowerMode:(BOOL)a3
{
  self->_isInLowPowerMode = a3;
}

- (BOOL)isInLowPowerMode
{
  return self->_isInLowPowerMode;
}

- (void)setIsInLowDataMode:(BOOL)a3
{
  self->_isInLowDataMode = a3;
}

- (BOOL)isInLowDataMode
{
  return self->_isInLowDataMode;
}

- (void)setIsUserPaused:(BOOL)a3
{
  self->_isUserPaused = a3;
}

- (BOOL)isUserPaused
{
  return self->_isUserPaused;
}

- (void)setNumberOfReferencedItems:(unint64_t)a3
{
  self->_numberOfReferencedItems = a3;
}

- (unint64_t)numberOfReferencedItems
{
  return self->_numberOfReferencedItems;
}

- (void)setNumberOfOtherAssets:(unint64_t)a3
{
  self->_numberOfOtherAssets = a3;
}

- (unint64_t)numberOfOtherAssets
{
  return self->_numberOfOtherAssets;
}

- (void)setNumberOfVideoAssets:(unint64_t)a3
{
  self->_numberOfVideoAssets = a3;
}

- (unint64_t)numberOfVideoAssets
{
  return self->_numberOfVideoAssets;
}

- (void)setNumberOfPhotoAssets:(unint64_t)a3
{
  self->_numberOfPhotoAssets = a3;
}

- (unint64_t)numberOfPhotoAssets
{
  return self->_numberOfPhotoAssets;
}

- (void)setNumberOfItemsFailingToUpload:(unint64_t)a3
{
  self->_numberOfItemsFailingToUpload = a3;
}

- (unint64_t)numberOfItemsFailingToUpload
{
  return self->_numberOfItemsFailingToUpload;
}

- (void)setNumberOfOriginalsToDownload:(unint64_t)a3
{
  self->_numberOfOriginalsToDownload = a3;
}

- (unint64_t)numberOfOriginalsToDownload
{
  return self->_numberOfOriginalsToDownload;
}

- (void)setNumberOfItemsToAdd:(unint64_t)a3
{
  self->_numberOfItemsToAdd = a3;
}

- (unint64_t)numberOfItemsToAdd
{
  return self->_numberOfItemsToAdd;
}

- (void)setNumberOfItemsToUpload:(unint64_t)a3
{
  self->_numberOfItemsToUpload = a3;
}

- (unint64_t)numberOfItemsToUpload
{
  return self->_numberOfItemsToUpload;
}

- (void)setExitDate:(id)a3
{
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (void)setSyncDate:(id)a3
{
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (void)setIsSyncing:(BOOL)a3
{
  self->_isSyncing = a3;
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (void)setIsRebuildingThumbnails:(BOOL)a3
{
  self->_isRebuildingThumbnails = a3;
}

- (BOOL)isRebuildingThumbnails
{
  return self->_isRebuildingThumbnails;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (float)fractionCompletedForUpload
{
  int64_t percentCompletedForUpload = self->_percentCompletedForUpload;
  if (percentCompletedForUpload < 0) {
    return -1.0;
  }
  float result = (double)percentCompletedForUpload / 100.0;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (void)setFractionCompletedForUpload:(float)a3
{
  if ((a3 > 1.0 || a3 < 0.0) && a3 != -1.0) {
    PXAssertGetLog();
  }
  if (a3 >= 0.0)
  {
    int64_t v5 = vcvtps_s32_f32(a3 * 100.0);
    if (v5 >= 100) {
      int64_t v5 = 100;
    }
  }
  else
  {
    int64_t v5 = -1;
  }
  self->_int64_t percentCompletedForUpload = v5;
}

- (float)fractionCompletedForLibraryRebuild
{
  int64_t percentCompletedForLibraryRebuild = self->_percentCompletedForLibraryRebuild;
  if (percentCompletedForLibraryRebuild < 0) {
    return -1.0;
  }
  float result = (double)percentCompletedForLibraryRebuild / 100.0;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (void)setFractionCompletedForLibraryRebuild:(float)a3
{
  if ((a3 > 1.0 || a3 < 0.0) && a3 != -1.0) {
    PXAssertGetLog();
  }
  if (a3 >= 0.0)
  {
    int64_t v5 = vcvtps_s32_f32(a3 * 100.0);
    if (v5 >= 100) {
      int64_t v5 = 100;
    }
  }
  else
  {
    int64_t v5 = -1;
  }
  self->_int64_t percentCompletedForLibraryRebuild = v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(PXCPLStatus *)self _isEqualToCPLStatus:v4];

  return v5;
}

- (BOOL)_isEqualToCPLStatus:(id)a3
{
  id v4 = a3;
  int isEnabled = self->_isEnabled;
  if (isEnabled != [v4 isEnabled]) {
    goto LABEL_65;
  }
  int64_t percentCompletedForLibraryRebuild = self->_percentCompletedForLibraryRebuild;
  if (percentCompletedForLibraryRebuild != [v4 percentCompletedForLibraryRebuild]) {
    goto LABEL_65;
  }
  int isRebuildingThumbnails = self->_isRebuildingThumbnails;
  if (isRebuildingThumbnails != [v4 isRebuildingThumbnails]) {
    goto LABEL_65;
  }
  int isSyncing = self->_isSyncing;
  if (isSyncing != [v4 isSyncing]) {
    goto LABEL_65;
  }
  syncDate = self->_syncDate;
  v10 = [v4 syncDate];
  if (syncDate == v10)
  {
  }
  else
  {
    v11 = v10;
    int v12 = [(NSDate *)syncDate isEqual:v10];

    if (!v12)
    {
LABEL_65:
      BOOL v69 = 0;
      goto LABEL_66;
    }
  }
  exitDate = self->_exitDate;
  v14 = [v4 exitDate];
  if (exitDate == v14)
  {
  }
  else
  {
    uint64_t v15 = v14;
    int v16 = [(NSDate *)exitDate isEqual:v14];

    if (!v16) {
      goto LABEL_65;
    }
  }
  unint64_t numberOfItemsToUpload = self->_numberOfItemsToUpload;
  if (numberOfItemsToUpload != [v4 numberOfItemsToUpload]) {
    goto LABEL_65;
  }
  int64_t percentCompletedForUpload = self->_percentCompletedForUpload;
  if (percentCompletedForUpload != [v4 percentCompletedForUpload]) {
    goto LABEL_65;
  }
  unint64_t numberOfItemsToAdd = self->_numberOfItemsToAdd;
  if (numberOfItemsToAdd != [v4 numberOfItemsToAdd]) {
    goto LABEL_65;
  }
  unint64_t numberOfOriginalsToDownload = self->_numberOfOriginalsToDownload;
  if (numberOfOriginalsToDownload != [v4 numberOfOriginalsToDownload]) {
    goto LABEL_65;
  }
  unint64_t numberOfItemsFailingToUpload = self->_numberOfItemsFailingToUpload;
  if (numberOfItemsFailingToUpload != [v4 numberOfItemsFailingToUpload]) {
    goto LABEL_65;
  }
  unint64_t numberOfPhotoAssets = self->_numberOfPhotoAssets;
  if (numberOfPhotoAssets != [v4 numberOfPhotoAssets]) {
    goto LABEL_65;
  }
  unint64_t numberOfVideoAssets = self->_numberOfVideoAssets;
  if (numberOfVideoAssets != [v4 numberOfVideoAssets]) {
    goto LABEL_65;
  }
  unint64_t numberOfOtherAssets = self->_numberOfOtherAssets;
  if (numberOfOtherAssets != [v4 numberOfOtherAssets]) {
    goto LABEL_65;
  }
  unint64_t numberOfReferencedItems = self->_numberOfReferencedItems;
  if (numberOfReferencedItems != [v4 numberOfReferencedItems]) {
    goto LABEL_65;
  }
  int isUserPaused = self->_isUserPaused;
  if (isUserPaused != [v4 isUserPaused]) {
    goto LABEL_65;
  }
  int isInLowDataMode = self->_isInLowDataMode;
  if (isInLowDataMode != [v4 isInLowDataMode]) {
    goto LABEL_65;
  }
  int isInLowPowerMode = self->_isInLowPowerMode;
  if (isInLowPowerMode != [v4 isInLowPowerMode]) {
    goto LABEL_65;
  }
  int isExceedingBatteryQuota = self->_isExceedingBatteryQuota;
  if (isExceedingBatteryQuota != [v4 isExceedingBatteryQuota]) {
    goto LABEL_65;
  }
  int isExceedingCellularQuota = self->_isExceedingCellularQuota;
  if (isExceedingCellularQuota != [v4 isExceedingCellularQuota]) {
    goto LABEL_65;
  }
  int isLowDiskSpace = self->_isLowDiskSpace;
  if (isLowDiskSpace != [v4 isLowDiskSpace]) {
    goto LABEL_65;
  }
  int isVeryLowDiskSpace = self->_isVeryLowDiskSpace;
  if (isVeryLowDiskSpace != [v4 isVeryLowDiskSpace]) {
    goto LABEL_65;
  }
  int isExceedingQuota = self->_isExceedingQuota;
  if (isExceedingQuota != [v4 isExceedingQuota]) {
    goto LABEL_65;
  }
  int isCellularDataDisabled = self->_isCellularDataDisabled;
  if (isCellularDataDisabled != [v4 isCellularDataDisabled]) {
    goto LABEL_65;
  }
  int isInAirplaneMode = self->_isInAirplaneMode;
  if (isInAirplaneMode != [v4 isInAirplaneMode]) {
    goto LABEL_65;
  }
  int isClientVersionTooOld = self->_isClientVersionTooOld;
  if (isClientVersionTooOld != [v4 isClientVersionTooOld]) {
    goto LABEL_65;
  }
  int isClientNotAuthenticated = self->_isClientNotAuthenticated;
  if (isClientNotAuthenticated != [v4 isClientNotAuthenticated]) {
    goto LABEL_65;
  }
  int isOffline = self->_isOffline;
  if (isOffline != [v4 isOffline]) {
    goto LABEL_65;
  }
  int isInSoftResetSync = self->_isInSoftResetSync;
  if (isInSoftResetSync != [v4 isInSoftResetSync]) {
    goto LABEL_65;
  }
  int isInHardResetSync = self->_isInHardResetSync;
  if (isInHardResetSync != [v4 isInHardResetSync]) {
    goto LABEL_65;
  }
  int isCapturingSnapshot = self->_isCapturingSnapshot;
  if (isCapturingSnapshot != [v4 isCapturingSnapshot]) {
    goto LABEL_65;
  }
  int isOptimizingSystemPerformance = self->_isOptimizingSystemPerformance;
  if (isOptimizingSystemPerformance != [v4 isOptimizingSystemPerformance]) {
    goto LABEL_65;
  }
  int isInPoorNetworkConnection = self->_isInPoorNetworkConnection;
  if (isInPoorNetworkConnection != [v4 isInPoorNetworkConnection]) {
    goto LABEL_65;
  }
  int isInModerateThermalPressure = self->_isInModerateThermalPressure;
  if (isInModerateThermalPressure != [v4 isInModerateThermalPressure]) {
    goto LABEL_65;
  }
  int isInHeavyThermalPressure = self->_isInHeavyThermalPressure;
  if (isInHeavyThermalPressure != [v4 isInHeavyThermalPressure]) {
    goto LABEL_65;
  }
  int isInLowBattery = self->_isInLowBattery;
  if (isInLowBattery != [v4 isInLowBattery]) {
    goto LABEL_65;
  }
  int hasCloudQuotaOffer = self->_hasCloudQuotaOffer;
  if (hasCloudQuotaOffer != [v4 hasCloudQuotaOffer]) {
    goto LABEL_65;
  }
  int64_t cloudQuotaState = self->_cloudQuotaState;
  if (cloudQuotaState != [v4 cloudQuotaState]) {
    goto LABEL_65;
  }
  cloudQuotaCustomTitle = self->_cloudQuotaCustomTitle;
  uint64_t v50 = [v4 cloudQuotaCustomTitle];
  if (cloudQuotaCustomTitle == v50)
  {
  }
  else
  {
    v51 = v50;
    BOOL v52 = [(NSString *)cloudQuotaCustomTitle isEqualToString:v50];

    if (!v52) {
      goto LABEL_65;
    }
  }
  cloudQuotaCustomMessage = self->_cloudQuotaCustomMessage;
  v54 = [v4 cloudQuotaCustomMessage];
  if (cloudQuotaCustomMessage == v54)
  {
  }
  else
  {
    id v55 = v54;
    BOOL v56 = [(NSString *)cloudQuotaCustomMessage isEqualToString:v54];

    if (!v56) {
      goto LABEL_65;
    }
  }
  cloudQuotaCustomActionTitle = self->_cloudQuotaCustomActionTitle;
  id v58 = [v4 cloudQuotaCustomActionTitle];
  if (cloudQuotaCustomActionTitle == v58)
  {
  }
  else
  {
    id v59 = v58;
    BOOL v60 = [(NSString *)cloudQuotaCustomActionTitle isEqualToString:v58];

    if (!v60) {
      goto LABEL_65;
    }
  }
  int64_t sharedLibraryState = self->_sharedLibraryState;
  if (sharedLibraryState != [v4 sharedLibraryState]) {
    goto LABEL_65;
  }
  unint64_t sharedLibraryExitingWithNumberOfAssetsRemaining = self->_sharedLibraryExitingWithNumberOfAssetsRemaining;
  if (sharedLibraryExitingWithNumberOfAssetsRemaining != [v4 sharedLibraryExitingWithNumberOfAssetsRemaining])goto LABEL_65; {
  unint64_t sharedLibraryMovingToShared = self->_sharedLibraryMovingToShared;
  }
  if (sharedLibraryMovingToShared != [v4 sharedLibraryMovingToShared]) {
    goto LABEL_65;
  }
  unint64_t sharedLibraryMovingToPersonal = self->_sharedLibraryMovingToPersonal;
  if (sharedLibraryMovingToPersonal != [v4 sharedLibraryMovingToPersonal]) {
    goto LABEL_65;
  }
  int isExceedingSharedLibraryQuota = self->_isExceedingSharedLibraryQuota;
  if (isExceedingSharedLibraryQuota != [v4 isExceedingSharedLibraryQuota]) {
    goto LABEL_65;
  }
  int isLocalModeEnabled = self->_isLocalModeEnabled;
  if (isLocalModeEnabled != [v4 isLocalModeEnabled]) {
    goto LABEL_65;
  }
  int isMockStatus = self->_isMockStatus;
  if (isMockStatus != [v4 isMockStatus]) {
    goto LABEL_65;
  }
  int isUpgradeSuggestedToAccessAllPhotos = self->_isUpgradeSuggestedToAccessAllPhotos;
  BOOL v69 = isUpgradeSuggestedToAccessAllPhotos == [v4 isUpgradeSuggestedToAccessAllPhotos];
LABEL_66:

  return v69;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PXCPLStatus);
  [(PXCPLStatus *)v4 setIsEnabled:self->_isEnabled];
  [(PXCPLStatus *)v4 setPercentCompletedForLibraryRebuild:self->_percentCompletedForLibraryRebuild];
  [(PXCPLStatus *)v4 setIsRebuildingThumbnails:self->_isRebuildingThumbnails];
  [(PXCPLStatus *)v4 setIsSyncing:self->_isSyncing];
  [(PXCPLStatus *)v4 setSyncDate:self->_syncDate];
  [(PXCPLStatus *)v4 setExitDate:self->_exitDate];
  [(PXCPLStatus *)v4 setNumberOfItemsToUpload:self->_numberOfItemsToUpload];
  [(PXCPLStatus *)v4 setPercentCompletedForUpload:self->_percentCompletedForUpload];
  [(PXCPLStatus *)v4 setNumberOfItemsToAdd:self->_numberOfItemsToAdd];
  [(PXCPLStatus *)v4 setNumberOfOriginalsToDownload:self->_numberOfOriginalsToDownload];
  [(PXCPLStatus *)v4 setNumberOfItemsFailingToUpload:self->_numberOfItemsFailingToUpload];
  [(PXCPLStatus *)v4 setNumberOfPhotoAssets:self->_numberOfPhotoAssets];
  [(PXCPLStatus *)v4 setNumberOfVideoAssets:self->_numberOfVideoAssets];
  [(PXCPLStatus *)v4 setNumberOfOtherAssets:self->_numberOfOtherAssets];
  [(PXCPLStatus *)v4 setNumberOfReferencedItems:self->_numberOfReferencedItems];
  [(PXCPLStatus *)v4 setIsUserPaused:self->_isUserPaused];
  [(PXCPLStatus *)v4 setIsInLowDataMode:self->_isInLowDataMode];
  [(PXCPLStatus *)v4 setIsInLowPowerMode:self->_isInLowPowerMode];
  [(PXCPLStatus *)v4 setIsExceedingBatteryQuota:self->_isExceedingBatteryQuota];
  [(PXCPLStatus *)v4 setIsExceedingCellularQuota:self->_isExceedingCellularQuota];
  [(PXCPLStatus *)v4 setIsLowDiskSpace:self->_isLowDiskSpace];
  [(PXCPLStatus *)v4 setIsVeryLowDiskSpace:self->_isVeryLowDiskSpace];
  [(PXCPLStatus *)v4 setIsExceedingQuota:self->_isExceedingQuota];
  [(PXCPLStatus *)v4 setIsCellularDataDisabled:self->_isCellularDataDisabled];
  [(PXCPLStatus *)v4 setIsInAirplaneMode:self->_isInAirplaneMode];
  [(PXCPLStatus *)v4 setIsClientVersionTooOld:self->_isClientVersionTooOld];
  [(PXCPLStatus *)v4 setIsClientNotAuthenticated:self->_isClientNotAuthenticated];
  [(PXCPLStatus *)v4 setIsOffline:self->_isOffline];
  [(PXCPLStatus *)v4 setIsInSoftResetSync:self->_isInSoftResetSync];
  [(PXCPLStatus *)v4 setIsInHardResetSync:self->_isInHardResetSync];
  [(PXCPLStatus *)v4 setIsCapturingSnapshot:self->_isCapturingSnapshot];
  [(PXCPLStatus *)v4 setIsOptimizingSystemPerformance:self->_isOptimizingSystemPerformance];
  [(PXCPLStatus *)v4 setIsInPoorNetworkConnection:self->_isInPoorNetworkConnection];
  [(PXCPLStatus *)v4 setIsInModerateThermalPressure:self->_isInModerateThermalPressure];
  [(PXCPLStatus *)v4 setIsInHeavyThermalPressure:self->_isInHeavyThermalPressure];
  [(PXCPLStatus *)v4 setIsInLowBattery:self->_isInLowBattery];
  [(PXCPLStatus *)v4 setHasCloudQuotaOffer:self->_hasCloudQuotaOffer];
  [(PXCPLStatus *)v4 setCloudQuotaState:self->_cloudQuotaState];
  [(PXCPLStatus *)v4 setCloudQuotaCustomTitle:self->_cloudQuotaCustomTitle];
  [(PXCPLStatus *)v4 setCloudQuotaCustomMessage:self->_cloudQuotaCustomMessage];
  [(PXCPLStatus *)v4 setCloudQuotaCustomActionTitle:self->_cloudQuotaCustomActionTitle];
  [(PXCPLStatus *)v4 setSharedLibraryState:self->_sharedLibraryState];
  [(PXCPLStatus *)v4 setSharedLibraryExitingWithNumberOfAssetsRemaining:self->_sharedLibraryExitingWithNumberOfAssetsRemaining];
  [(PXCPLStatus *)v4 setSharedLibraryMovingToShared:self->_sharedLibraryMovingToShared];
  [(PXCPLStatus *)v4 setSharedLibraryMovingToPersonal:self->_sharedLibraryMovingToPersonal];
  [(PXCPLStatus *)v4 setIsExceedingSharedLibraryQuota:self->_isExceedingSharedLibraryQuota];
  [(PXCPLStatus *)v4 setIsLocalModeEnabled:self->_isLocalModeEnabled];
  [(PXCPLStatus *)v4 setIsMockStatus:self->_isMockStatus];
  [(PXCPLStatus *)v4 setIsUpgradeSuggestedToAccessAllPhotos:self->_isUpgradeSuggestedToAccessAllPhotos];
  return v4;
}

- (PXCPLStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXCPLStatus;
  float result = [(PXCPLStatus *)&v3 init];
  if (result)
  {
    result->_int64_t percentCompletedForLibraryRebuild = -1;
    result->_int64_t percentCompletedForUpload = -1;
  }
  return result;
}

@end