@interface PXImportSettings
+ (PXImportSettings)sharedInstance;
- (BOOL)alwaysShowCPLOptimizedMessage;
- (BOOL)disableAssetDeletion;
- (BOOL)externalOneUpForceEnable;
- (BOOL)externalOneUpSimulateDeletionFailure;
- (BOOL)groupItemsByEXIFDate;
- (BOOL)hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem;
- (BOOL)importSourceSimulationViaDiagnosticsEnabled;
- (BOOL)interactive1upPresentationEnabled;
- (BOOL)lazyLoadAllAssets;
- (BOOL)loadActualThumbnails;
- (BOOL)loadRetinaThumbnails;
- (BOOL)longPressForOneUpInCompactMode;
- (BOOL)longPressForOneUpInPadSpec;
- (BOOL)showImportItemFilenames;
- (BOOL)showNewestItemsInGridUntilScrolled;
- (BOOL)showProgressTitles;
- (BOOL)simulateEmptyImportSource;
- (BOOL)simulateLongDiskSpacePreparation;
- (BOOL)usePhotosOneUp;
- (BOOL)useThumbnailSizesAsImageSizeHints;
- (double)assetEnumerationBatchInterval;
- (double)delayBeforeShowingPreparationAlert;
- (id)parentSettings;
- (int64_t)alreadyImportedTruncationMode;
- (int64_t)assetEnumerationBehavior;
- (int64_t)simulatedBatteryLevel;
- (int64_t)simulatedDiskSpace;
- (unint64_t)assetEnumerationBatchSize;
- (void)setAlreadyImportedTruncationMode:(int64_t)a3;
- (void)setAlwaysShowCPLOptimizedMessage:(BOOL)a3;
- (void)setAssetEnumerationBatchInterval:(double)a3;
- (void)setAssetEnumerationBatchSize:(unint64_t)a3;
- (void)setAssetEnumerationBehavior:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDelayBeforeShowingPreparationAlert:(double)a3;
- (void)setDisableAssetDeletion:(BOOL)a3;
- (void)setExternalOneUpForceEnable:(BOOL)a3;
- (void)setExternalOneUpSimulateDeletionFailure:(BOOL)a3;
- (void)setGroupItemsByEXIFDate:(BOOL)a3;
- (void)setHide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem:(BOOL)a3;
- (void)setImportSourceSimulationViaDiagnosticsEnabled:(BOOL)a3;
- (void)setInteractive1upPresentationEnabled:(BOOL)a3;
- (void)setLazyLoadAllAssets:(BOOL)a3;
- (void)setLoadActualThumbnails:(BOOL)a3;
- (void)setLoadRetinaThumbnails:(BOOL)a3;
- (void)setLongPressForOneUpInCompactMode:(BOOL)a3;
- (void)setLongPressForOneUpInPadSpec:(BOOL)a3;
- (void)setShowImportItemFilenames:(BOOL)a3;
- (void)setShowNewestItemsInGridUntilScrolled:(BOOL)a3;
- (void)setShowProgressTitles:(BOOL)a3;
- (void)setSimulateEmptyImportSource:(BOOL)a3;
- (void)setSimulateLongDiskSpacePreparation:(BOOL)a3;
- (void)setSimulatedBatteryLevel:(int64_t)a3;
- (void)setSimulatedDiskSpace:(int64_t)a3;
- (void)setUsePhotosOneUp:(BOOL)a3;
- (void)setUseThumbnailSizesAsImageSizeHints:(BOOL)a3;
@end

@implementation PXImportSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXImportSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXImportSettings *)self setUsePhotosOneUp:0];
  [(PXImportSettings *)self setInteractive1upPresentationEnabled:1];
  [(PXImportSettings *)self setImportSourceSimulationViaDiagnosticsEnabled:0];
  [(PXImportSettings *)self setSimulatedBatteryLevel:0];
  [(PXImportSettings *)self setSimulateEmptyImportSource:0];
  [(PXImportSettings *)self setDelayBeforeShowingPreparationAlert:1.0];
  [(PXImportSettings *)self setSimulateLongDiskSpacePreparation:0];
  [(PXImportSettings *)self setSimulatedDiskSpace:0];
  [(PXImportSettings *)self setShowImportItemFilenames:0];
  [(PXImportSettings *)self setDisableAssetDeletion:0];
  [(PXImportSettings *)self setLoadActualThumbnails:1];
  [(PXImportSettings *)self setLazyLoadAllAssets:1];
  [(PXImportSettings *)self setGroupItemsByEXIFDate:0];
  [(PXImportSettings *)self setShowNewestItemsInGridUntilScrolled:0];
  [(PXImportSettings *)self setAlreadyImportedTruncationMode:2];
  [(PXImportSettings *)self setHide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem:1];
  [(PXImportSettings *)self setLongPressForOneUpInCompactMode:1];
  [(PXImportSettings *)self setLongPressForOneUpInPadSpec:1];
  [(PXImportSettings *)self setUseThumbnailSizesAsImageSizeHints:1];
  [(PXImportSettings *)self setLoadRetinaThumbnails:0];
  [(PXImportSettings *)self setAlwaysShowCPLOptimizedMessage:0];
  [(PXImportSettings *)self setAssetEnumerationBehavior:0];
  [(PXImportSettings *)self setAssetEnumerationBatchInterval:0.25];
  [(PXImportSettings *)self setAssetEnumerationBatchSize:10];
  [(PXImportSettings *)self setShowProgressTitles:1];
  [(PXImportSettings *)self setExternalOneUpSimulateDeletionFailure:0];
  [(PXImportSettings *)self setExternalOneUpForceEnable:0];
}

- (void)setUseThumbnailSizesAsImageSizeHints:(BOOL)a3
{
  self->_useThumbnailSizesAsImageSizeHints = a3;
}

- (void)setUsePhotosOneUp:(BOOL)a3
{
  self->_usePhotosOneUp = a3;
}

- (void)setSimulatedDiskSpace:(int64_t)a3
{
  self->_simulatedDiskSpace = a3;
}

- (void)setSimulatedBatteryLevel:(int64_t)a3
{
  self->_simulatedBatteryLevel = a3;
}

- (void)setSimulateLongDiskSpacePreparation:(BOOL)a3
{
  self->_simulateLongDiskSpacePreparation = a3;
}

- (void)setSimulateEmptyImportSource:(BOOL)a3
{
  self->_simulateEmptyImportSource = a3;
}

- (void)setShowProgressTitles:(BOOL)a3
{
  self->_showProgressTitles = a3;
}

- (void)setShowNewestItemsInGridUntilScrolled:(BOOL)a3
{
  self->_showNewestItemsInGridUntilScrolled = a3;
}

- (void)setShowImportItemFilenames:(BOOL)a3
{
  self->_showImportItemFilenames = a3;
}

- (void)setLongPressForOneUpInPadSpec:(BOOL)a3
{
  self->_longPressForOneUpInPadSpec = a3;
}

- (void)setLongPressForOneUpInCompactMode:(BOOL)a3
{
  self->_longPressForOneUpInCompactMode = a3;
}

- (void)setLoadRetinaThumbnails:(BOOL)a3
{
  self->_loadRetinaThumbnails = a3;
}

- (void)setLoadActualThumbnails:(BOOL)a3
{
  self->_loadActualThumbnails = a3;
}

- (void)setLazyLoadAllAssets:(BOOL)a3
{
  self->_lazyLoadAllAssets = a3;
}

- (void)setInteractive1upPresentationEnabled:(BOOL)a3
{
  self->_interactive1upPresentationEnabled = a3;
}

- (void)setImportSourceSimulationViaDiagnosticsEnabled:(BOOL)a3
{
  self->_importSourceSimulationViaDiagnosticsEnabled = a3;
}

- (void)setHide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem:(BOOL)a3
{
  self->_hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem = a3;
}

- (void)setGroupItemsByEXIFDate:(BOOL)a3
{
  self->_groupItemsByEXIFDate = a3;
}

- (void)setExternalOneUpSimulateDeletionFailure:(BOOL)a3
{
  self->_externalOneUpSimulateDeletionFailure = a3;
}

- (void)setExternalOneUpForceEnable:(BOOL)a3
{
  self->_externalOneUpForceEnable = a3;
}

- (void)setDisableAssetDeletion:(BOOL)a3
{
  self->_disableAssetDeletion = a3;
}

- (void)setDelayBeforeShowingPreparationAlert:(double)a3
{
  self->_delayBeforeShowingPreparationAlert = a3;
}

- (void)setAssetEnumerationBehavior:(int64_t)a3
{
  self->_assetEnumerationBehavior = a3;
}

- (void)setAssetEnumerationBatchSize:(unint64_t)a3
{
  self->_assetEnumerationBatchSize = a3;
}

- (void)setAssetEnumerationBatchInterval:(double)a3
{
  self->_assetEnumerationBatchInterval = a3;
}

- (void)setAlwaysShowCPLOptimizedMessage:(BOOL)a3
{
  self->_alwaysShowCPLOptimizedMessage = a3;
}

- (void)setAlreadyImportedTruncationMode:(int64_t)a3
{
  self->_alreadyImportedTruncationMode = a3;
}

- (BOOL)externalOneUpForceEnable
{
  return self->_externalOneUpForceEnable;
}

- (BOOL)externalOneUpSimulateDeletionFailure
{
  return self->_externalOneUpSimulateDeletionFailure;
}

- (BOOL)showProgressTitles
{
  return self->_showProgressTitles;
}

- (unint64_t)assetEnumerationBatchSize
{
  return self->_assetEnumerationBatchSize;
}

- (double)assetEnumerationBatchInterval
{
  return self->_assetEnumerationBatchInterval;
}

- (int64_t)assetEnumerationBehavior
{
  return self->_assetEnumerationBehavior;
}

- (BOOL)alwaysShowCPLOptimizedMessage
{
  return self->_alwaysShowCPLOptimizedMessage;
}

- (BOOL)loadRetinaThumbnails
{
  return self->_loadRetinaThumbnails;
}

- (BOOL)useThumbnailSizesAsImageSizeHints
{
  return self->_useThumbnailSizesAsImageSizeHints;
}

- (BOOL)longPressForOneUpInPadSpec
{
  return self->_longPressForOneUpInPadSpec;
}

- (BOOL)longPressForOneUpInCompactMode
{
  return self->_longPressForOneUpInCompactMode;
}

- (BOOL)hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem
{
  return self->_hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem;
}

- (int64_t)alreadyImportedTruncationMode
{
  return self->_alreadyImportedTruncationMode;
}

- (BOOL)showNewestItemsInGridUntilScrolled
{
  return self->_showNewestItemsInGridUntilScrolled;
}

- (BOOL)groupItemsByEXIFDate
{
  return self->_groupItemsByEXIFDate;
}

- (BOOL)lazyLoadAllAssets
{
  return self->_lazyLoadAllAssets;
}

- (BOOL)loadActualThumbnails
{
  return self->_loadActualThumbnails;
}

- (BOOL)disableAssetDeletion
{
  return self->_disableAssetDeletion;
}

- (BOOL)showImportItemFilenames
{
  return self->_showImportItemFilenames;
}

- (int64_t)simulatedDiskSpace
{
  return self->_simulatedDiskSpace;
}

- (BOOL)simulateLongDiskSpacePreparation
{
  return self->_simulateLongDiskSpacePreparation;
}

- (double)delayBeforeShowingPreparationAlert
{
  return self->_delayBeforeShowingPreparationAlert;
}

- (BOOL)simulateEmptyImportSource
{
  return self->_simulateEmptyImportSource;
}

- (int64_t)simulatedBatteryLevel
{
  return self->_simulatedBatteryLevel;
}

- (BOOL)importSourceSimulationViaDiagnosticsEnabled
{
  return self->_importSourceSimulationViaDiagnosticsEnabled;
}

- (BOOL)interactive1upPresentationEnabled
{
  return self->_interactive1upPresentationEnabled;
}

- (BOOL)usePhotosOneUp
{
  return self->_usePhotosOneUp;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXImportSettings)sharedInstance
{
  if (sharedInstance_onceToken_247581 != -1) {
    dispatch_once(&sharedInstance_onceToken_247581, &__block_literal_global_247582);
  }
  v2 = (void *)sharedInstance_sharedInstance_247583;
  return (PXImportSettings *)v2;
}

void __34__PXImportSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 importSettings];
  v1 = (void *)sharedInstance_sharedInstance_247583;
  sharedInstance_sharedInstance_247583 = v0;
}

@end