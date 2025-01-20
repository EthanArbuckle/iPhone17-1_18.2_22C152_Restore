@interface PXGenerativeStorySettings
+ (BOOL)isMemoryCreationEnabled;
+ (BOOL)isMemoryCreationTimeEventDisambiguationEnabled;
+ (id)internal_deleteGenerativeMemories;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (int64_t)defaultIntelligenceLightMode;
- (BOOL)_isAppleInternal;
- (BOOL)ambiguousTokensBlockStoryGeneration;
- (BOOL)ambiguousTokensPauseStoryGeneration;
- (BOOL)automaticallyExpandDisambiguationMenu;
- (BOOL)automaticallyRestartStoryGenerationAfterUserDisambiguation;
- (BOOL)enableLocationDisambiguation;
- (BOOL)internal_isMemoryCreationEnabled;
- (BOOL)isMemoryCreationCellRepositioningEnabled;
- (BOOL)preferInternalEvaluationUI;
- (BOOL)preferMockSuggestionsData;
- (BOOL)replaceMemoryCreationWithMockData;
- (BOOL)saveCurationInFolder;
- (BOOL)shouldCancelGenerationAfterMaxDuration;
- (BOOL)shouldForceDiagnosticAsSeedOrFCS;
- (BOOL)shouldForceFallbackMemoryGeneration;
- (BOOL)shouldLoadStoriesFromCache;
- (BOOL)shouldOverrideAvailabilityPollingInterval;
- (BOOL)shouldShowSuggestionSourceBadge;
- (BOOL)shouldUseAvailabilityMonitor;
- (BOOL)shouldUseExtendedAssetsForLoadingAnimation;
- (BOOL)shouldUseGlobalTraitsForLoadingAnimation;
- (BOOL)shouldUsePersonalTraitsForLoadingAnimation;
- (BOOL)shouldUsePlaceholderAssetsForLoadingAnimation;
- (BOOL)shouldUseProcessingStatusInAvailabilityMonitor;
- (BOOL)shouldUseRetrievedAssetsForLoadingAnimation;
- (BOOL)showAllBackgroundAssets;
- (BOOL)showAssetGridForTimeEventDisambiguation;
- (BOOL)showChapterTitles;
- (BOOL)showDebugErrorUI;
- (BOOL)showDebugUIGenerationProgress;
- (BOOL)showFreeformMemoryCreationButtonInMemoryFeed;
- (BOOL)showFreeformMemoryCreationButtonInMemoryShelf;
- (BOOL)showFreeformMemoryCreationCellInMemoryShelf;
- (BOOL)showIntelligenceLightingInSuggestions;
- (BOOL)showPerformanceTTRIfGenerationSlowOrHanging;
- (BOOL)simulateCreationError;
- (BOOL)simulateSlowCreation;
- (BOOL)simulateSlowFetchForBackgroundAssets;
- (BOOL)simulateSlowFetchForPromptSuggestion;
- (BOOL)simulateSlowPrewarmForLoadingAnimation;
- (BOOL)suggestionToolEnabled;
- (BOOL)unresolvableAmbiguityShowsContinueButton;
- (BOOL)uploadVisualDiagnostics;
- (BOOL)useOverlayNavigationType;
- (BOOL)useSystemPromptInputTextField;
- (BOOL)vfxQualityPostProcessingFXHighQuality;
- (BOOL)vfxQualityUseBestCrop;
- (double)availabilityPollingInterval;
- (double)backgroundBlurRadius;
- (double)maxDurationForGeneration;
- (double)numberOfSuggestions;
- (double)playbackRateFactor;
- (id)parentSettings;
- (int64_t)autocompleteSuggestionsMode;
- (int64_t)centralizedFeedbackUI;
- (int64_t)entryPointBackgroundMode;
- (int64_t)fullScreenBackgroundMode;
- (int64_t)intelligenceLightModeInPromptTextField;
- (int64_t)memoryCreationCellPositionInMemoryShelf;
- (int64_t)promptSuggestionRefetchFrequency;
- (int64_t)vfxQualityFrameRate;
- (int64_t)vfxQualityResolution;
- (void)setAmbiguousTokensBlockStoryGeneration:(BOOL)a3;
- (void)setAmbiguousTokensPauseStoryGeneration:(BOOL)a3;
- (void)setAutocompleteSuggestionsMode:(int64_t)a3;
- (void)setAutomaticallyExpandDisambiguationMenu:(BOOL)a3;
- (void)setAutomaticallyRestartStoryGenerationAfterUserDisambiguation:(BOOL)a3;
- (void)setAvailabilityPollingInterval:(double)a3;
- (void)setBackgroundBlurRadius:(double)a3;
- (void)setCentralizedFeedbackUI:(int64_t)a3;
- (void)setDefaultValues;
- (void)setEnableLocationDisambiguation:(BOOL)a3;
- (void)setEntryPointBackgroundMode:(int64_t)a3;
- (void)setFullScreenBackgroundMode:(int64_t)a3;
- (void)setIntelligenceLightModeInPromptTextField:(int64_t)a3;
- (void)setInternal_isMemoryCreationEnabled:(BOOL)a3;
- (void)setIsMemoryCreationCellRepositioningEnabled:(BOOL)a3;
- (void)setMaxDurationForGeneration:(double)a3;
- (void)setMemoryCreationCellPositionInMemoryShelf:(int64_t)a3;
- (void)setNumberOfSuggestions:(double)a3;
- (void)setPlaybackRateFactor:(double)a3;
- (void)setPreferInternalEvaluationUI:(BOOL)a3;
- (void)setPreferMockSuggestionsData:(BOOL)a3;
- (void)setPromptSuggestionRefetchFrequency:(int64_t)a3;
- (void)setReplaceMemoryCreationWithMockData:(BOOL)a3;
- (void)setSaveCurationInFolder:(BOOL)a3;
- (void)setShouldCancelGenerationAfterMaxDuration:(BOOL)a3;
- (void)setShouldForceDiagnosticAsSeedOrFCS:(BOOL)a3;
- (void)setShouldForceFallbackMemoryGeneration:(BOOL)a3;
- (void)setShouldLoadStoriesFromCache:(BOOL)a3;
- (void)setShouldOverrideAvailabilityPollingInterval:(BOOL)a3;
- (void)setShouldShowSuggestionSourceBadge:(BOOL)a3;
- (void)setShouldUseAvailabilityMonitor:(BOOL)a3;
- (void)setShouldUseExtendedAssetsForLoadingAnimation:(BOOL)a3;
- (void)setShouldUseGlobalTraitsForLoadingAnimation:(BOOL)a3;
- (void)setShouldUsePersonalTraitsForLoadingAnimation:(BOOL)a3;
- (void)setShouldUsePlaceholderAssetsForLoadingAnimation:(BOOL)a3;
- (void)setShouldUseProcessingStatusInAvailabilityMonitor:(BOOL)a3;
- (void)setShouldUseRetrievedAssetsForLoadingAnimation:(BOOL)a3;
- (void)setShowAllBackgroundAssets:(BOOL)a3;
- (void)setShowAssetGridForTimeEventDisambiguation:(BOOL)a3;
- (void)setShowChapterTitles:(BOOL)a3;
- (void)setShowDebugErrorUI:(BOOL)a3;
- (void)setShowDebugUIGenerationProgress:(BOOL)a3;
- (void)setShowFreeformMemoryCreationButtonInMemoryFeed:(BOOL)a3;
- (void)setShowFreeformMemoryCreationButtonInMemoryShelf:(BOOL)a3;
- (void)setShowFreeformMemoryCreationCellInMemoryShelf:(BOOL)a3;
- (void)setShowIntelligenceLightingInSuggestions:(BOOL)a3;
- (void)setShowPerformanceTTRIfGenerationSlowOrHanging:(BOOL)a3;
- (void)setSimulateCreationError:(BOOL)a3;
- (void)setSimulateSlowCreation:(BOOL)a3;
- (void)setSimulateSlowFetchForBackgroundAssets:(BOOL)a3;
- (void)setSimulateSlowFetchForPromptSuggestion:(BOOL)a3;
- (void)setSimulateSlowPrewarmForLoadingAnimation:(BOOL)a3;
- (void)setSuggestionToolEnabled:(BOOL)a3;
- (void)setUnresolvableAmbiguityShowsContinueButton:(BOOL)a3;
- (void)setUploadVisualDiagnostics:(BOOL)a3;
- (void)setUseOverlayNavigationType:(BOOL)a3;
- (void)setUseSystemPromptInputTextField:(BOOL)a3;
- (void)setVfxQualityFrameRate:(int64_t)a3;
- (void)setVfxQualityPostProcessingFXHighQuality:(BOOL)a3;
- (void)setVfxQualityResolution:(int64_t)a3;
- (void)setVfxQualityUseBestCrop:(BOOL)a3;
@end

@implementation PXGenerativeStorySettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_52751 != -1) {
    dispatch_once(&sharedInstance_onceToken_52751, &__block_literal_global_52752);
  }
  v2 = (void *)sharedInstance_sharedInstance_52753;
  return v2;
}

- (BOOL)shouldShowSuggestionSourceBadge
{
  return self->_shouldShowSuggestionSourceBadge;
}

- (BOOL)shouldUseAvailabilityMonitor
{
  return self->_shouldUseAvailabilityMonitor;
}

- (BOOL)showFreeformMemoryCreationCellInMemoryShelf
{
  return self->_showFreeformMemoryCreationCellInMemoryShelf;
}

+ (BOOL)isMemoryCreationEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    v3 = +[PXGenerativeStorySettings sharedInstance];
    char v4 = objc_msgSend(v3, "internal_isMemoryCreationEnabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)internal_isMemoryCreationEnabled
{
  return self->_internal_isMemoryCreationEnabled;
}

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)PXGenerativeStorySettings;
  [(PTSettings *)&v4 setDefaultValues];
  self->_internal_isMemoryCreationEnabled = 1;
  self->_preferInternalEvaluationUI = 0;
  self->_preferMockSuggestionsData = 0;
  self->_shouldShowSuggestionSourceBadge = 0;
  self->_simulateSlowFetchForPromptSuggestion = 0;
  self->_promptSuggestionRefetchFrequency = 0;
  self->_showFreeformMemoryCreationCellInMemoryShelf = 1;
  self->_memoryCreationCellPositionInMemoryShelf = 0;
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  self->_isMemoryCreationCellRepositioningEnabled = [v3 userInterfaceIdiom] == 0;

  self->_showFreeformMemoryCreationButtonInMemoryShelf = 1;
  self->_showFreeformMemoryCreationButtonInMemoryFeed = 1;
  self->_shouldForceFallbackMemoryGeneration = 0;
  self->_shouldLoadStoriesFromCache = [(PXGenerativeStorySettings *)self _isAppleInternal];
  self->_replaceMemoryCreationWithMockData = 0;
  self->_simulateCreationError = 0;
  self->_simulateSlowCreation = 0;
  self->_entryPointBackgroundMode = 1;
  self->_fullScreenBackgroundMode = 1;
  self->_showDebugUIGenerationProgress = 0;
  self->_showDebugErrorUI = 0;
  self->_showAllBackgroundAssets = 0;
  self->_backgroundBlurRadius = 40.0;
  self->_playbackRateFactor = 0.5;
  self->_simulateSlowFetchForBackgroundAssets = 0;
  self->_simulateSlowPrewarmForLoadingAnimation = 0;
  self->_shouldUsePlaceholderAssetsForLoadingAnimation = 1;
  self->_shouldUseRetrievedAssetsForLoadingAnimation = 1;
  self->_shouldUseExtendedAssetsForLoadingAnimation = 1;
  *(_WORD *)&self->_shouldUseGlobalTraitsForLoadingAnimation = 1;
  self->_vfxQualityPostProcessingFXHighQuality = 0;
  self->_vfxQualityResolution = 0;
  self->_vfxQualityFrameRate = 0;
  self->_vfxQualityUseBestCrop = 0;
  self->_automaticallyRestartStoryGenerationAfterUserDisambiguation = 1;
  self->_automaticallyExpandDisambiguationMenu = 1;
  self->_useOverlayNavigationType = 1;
  self->_showIntelligenceLightingInSuggestions = 1;
  self->_intelligenceLightModeInPromptTextField = +[PXGenerativeStorySettings defaultIntelligenceLightMode];
  self->_unresolvableAmbiguityShowsContinueButton = 0;
  self->_showAssetGridForTimeEventDisambiguation = 0;
  self->_enableLocationDisambiguation = 0;
  *(_WORD *)&self->_ambiguousTokensPauseStoryGeneration = 1;
  self->_useSystemPromptInputTextField = 1;
  self->_autocompleteSuggestionsMode = 1;
  self->_showChapterTitles = 0;
  self->_saveCurationInFolder = 0;
  self->_uploadVisualDiagnostics = 0;
  self->_shouldUseAvailabilityMonitor = 1;
  *(_WORD *)&self->_shouldUseProcessingStatusInAvailabilityMonitor = 1;
  self->_availabilityPollingInterval = 60.0;
  self->_showPerformanceTTRIfGenerationSlowOrHanging = 0;
  self->_shouldCancelGenerationAfterMaxDuration = 1;
  self->_maxDurationForGeneration = 60.0;
  self->_suggestionToolEnabled = 0;
  self->_numberOfSuggestions = 4.0;
  if ([(PXGenerativeStorySettings *)self _isAppleInternal])
  {
    self->_centralizedFeedbackUI = 0;
    self->_shouldForceDiagnosticAsSeedOrFCS = 0;
  }
  else
  {
    self->_shouldForceDiagnosticAsSeedOrFCS = 1;
    self->_centralizedFeedbackUI = 1;
  }
}

- (BOOL)_isAppleInternal
{
  if (_isAppleInternal_onceToken != -1) {
    dispatch_once(&_isAppleInternal_onceToken, &__block_literal_global_257);
  }
  return _isAppleInternal_isAppleInternal;
}

void __43__PXGenerativeStorySettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 generativeStorySettings];
  v1 = (void *)sharedInstance_sharedInstance_52753;
  sharedInstance_sharedInstance_52753 = v0;
}

uint64_t __45__PXGenerativeStorySettings__isAppleInternal__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  _isAppleInternal_isAppleInternal = result;
  return result;
}

+ (id)settingsControllerModule
{
}

+ (int64_t)defaultIntelligenceLightMode
{
  return 0;
}

- (void)setMaxDurationForGeneration:(double)a3
{
  self->_maxDurationForGeneration = a3;
}

- (double)maxDurationForGeneration
{
  return self->_maxDurationForGeneration;
}

- (void)setShouldCancelGenerationAfterMaxDuration:(BOOL)a3
{
  self->_shouldCancelGenerationAfterMaxDuration = a3;
}

- (BOOL)shouldCancelGenerationAfterMaxDuration
{
  return self->_shouldCancelGenerationAfterMaxDuration;
}

- (void)setShowPerformanceTTRIfGenerationSlowOrHanging:(BOOL)a3
{
  self->_showPerformanceTTRIfGenerationSlowOrHanging = a3;
}

- (BOOL)showPerformanceTTRIfGenerationSlowOrHanging
{
  return self->_showPerformanceTTRIfGenerationSlowOrHanging;
}

- (void)setShowChapterTitles:(BOOL)a3
{
  self->_showChapterTitles = a3;
}

- (BOOL)showChapterTitles
{
  return self->_showChapterTitles;
}

- (void)setShouldForceFallbackMemoryGeneration:(BOOL)a3
{
  self->_shouldForceFallbackMemoryGeneration = a3;
}

- (BOOL)shouldForceFallbackMemoryGeneration
{
  return self->_shouldForceFallbackMemoryGeneration;
}

- (void)setInternal_isMemoryCreationEnabled:(BOOL)a3
{
  self->_internal_isMemoryCreationEnabled = a3;
}

- (void)setUploadVisualDiagnostics:(BOOL)a3
{
  self->_uploadVisualDiagnostics = a3;
}

- (BOOL)uploadVisualDiagnostics
{
  return self->_uploadVisualDiagnostics;
}

- (void)setSaveCurationInFolder:(BOOL)a3
{
  self->_saveCurationInFolder = a3;
}

- (BOOL)saveCurationInFolder
{
  return self->_saveCurationInFolder;
}

- (void)setAvailabilityPollingInterval:(double)a3
{
  self->_availabilityPollingInterval = a3;
}

- (double)availabilityPollingInterval
{
  return self->_availabilityPollingInterval;
}

- (void)setShouldOverrideAvailabilityPollingInterval:(BOOL)a3
{
  self->_shouldOverrideAvailabilityPollingInterval = a3;
}

- (BOOL)shouldOverrideAvailabilityPollingInterval
{
  return self->_shouldOverrideAvailabilityPollingInterval;
}

- (void)setShouldUseProcessingStatusInAvailabilityMonitor:(BOOL)a3
{
  self->_shouldUseProcessingStatusInAvailabilityMonitor = a3;
}

- (BOOL)shouldUseProcessingStatusInAvailabilityMonitor
{
  return self->_shouldUseProcessingStatusInAvailabilityMonitor;
}

- (void)setShouldUseAvailabilityMonitor:(BOOL)a3
{
  self->_shouldUseAvailabilityMonitor = a3;
}

- (void)setNumberOfSuggestions:(double)a3
{
  self->_numberOfSuggestions = a3;
}

- (double)numberOfSuggestions
{
  return self->_numberOfSuggestions;
}

- (void)setSuggestionToolEnabled:(BOOL)a3
{
  self->_suggestionToolEnabled = a3;
}

- (BOOL)suggestionToolEnabled
{
  return self->_suggestionToolEnabled;
}

- (void)setAutocompleteSuggestionsMode:(int64_t)a3
{
  self->_autocompleteSuggestionsMode = a3;
}

- (int64_t)autocompleteSuggestionsMode
{
  return self->_autocompleteSuggestionsMode;
}

- (void)setShouldForceDiagnosticAsSeedOrFCS:(BOOL)a3
{
  self->_shouldForceDiagnosticAsSeedOrFCS = a3;
}

- (BOOL)shouldForceDiagnosticAsSeedOrFCS
{
  return self->_shouldForceDiagnosticAsSeedOrFCS;
}

- (void)setCentralizedFeedbackUI:(int64_t)a3
{
  self->_centralizedFeedbackUI = a3;
}

- (int64_t)centralizedFeedbackUI
{
  return self->_centralizedFeedbackUI;
}

- (void)setIntelligenceLightModeInPromptTextField:(int64_t)a3
{
  self->_intelligenceLightModeInPromptTextField = a3;
}

- (int64_t)intelligenceLightModeInPromptTextField
{
  return self->_intelligenceLightModeInPromptTextField;
}

- (void)setShowIntelligenceLightingInSuggestions:(BOOL)a3
{
  self->_showIntelligenceLightingInSuggestions = a3;
}

- (BOOL)showIntelligenceLightingInSuggestions
{
  return self->_showIntelligenceLightingInSuggestions;
}

- (void)setUseOverlayNavigationType:(BOOL)a3
{
  self->_useOverlayNavigationType = a3;
}

- (BOOL)useOverlayNavigationType
{
  return self->_useOverlayNavigationType;
}

- (void)setAutomaticallyExpandDisambiguationMenu:(BOOL)a3
{
  self->_automaticallyExpandDisambiguationMenu = a3;
}

- (BOOL)automaticallyExpandDisambiguationMenu
{
  return self->_automaticallyExpandDisambiguationMenu;
}

- (void)setAutomaticallyRestartStoryGenerationAfterUserDisambiguation:(BOOL)a3
{
  self->_automaticallyRestartStoryGenerationAfterUserDisambiguation = a3;
}

- (BOOL)automaticallyRestartStoryGenerationAfterUserDisambiguation
{
  return self->_automaticallyRestartStoryGenerationAfterUserDisambiguation;
}

- (void)setUnresolvableAmbiguityShowsContinueButton:(BOOL)a3
{
  self->_unresolvableAmbiguityShowsContinueButton = a3;
}

- (BOOL)unresolvableAmbiguityShowsContinueButton
{
  return self->_unresolvableAmbiguityShowsContinueButton;
}

- (void)setEnableLocationDisambiguation:(BOOL)a3
{
  self->_enableLocationDisambiguation = a3;
}

- (BOOL)enableLocationDisambiguation
{
  return self->_enableLocationDisambiguation;
}

- (void)setShowAssetGridForTimeEventDisambiguation:(BOOL)a3
{
  self->_showAssetGridForTimeEventDisambiguation = a3;
}

- (BOOL)showAssetGridForTimeEventDisambiguation
{
  return self->_showAssetGridForTimeEventDisambiguation;
}

- (void)setAmbiguousTokensBlockStoryGeneration:(BOOL)a3
{
  self->_ambiguousTokensBlockStoryGeneration = a3;
}

- (BOOL)ambiguousTokensBlockStoryGeneration
{
  return self->_ambiguousTokensBlockStoryGeneration;
}

- (void)setAmbiguousTokensPauseStoryGeneration:(BOOL)a3
{
  self->_ambiguousTokensPauseStoryGeneration = a3;
}

- (BOOL)ambiguousTokensPauseStoryGeneration
{
  return self->_ambiguousTokensPauseStoryGeneration;
}

- (void)setShowDebugErrorUI:(BOOL)a3
{
  self->_showDebugErrorUI = a3;
}

- (BOOL)showDebugErrorUI
{
  return self->_showDebugErrorUI;
}

- (void)setShowDebugUIGenerationProgress:(BOOL)a3
{
  self->_showDebugUIGenerationProgress = a3;
}

- (BOOL)showDebugUIGenerationProgress
{
  return self->_showDebugUIGenerationProgress;
}

- (void)setSimulateSlowCreation:(BOOL)a3
{
  self->_simulateSlowCreation = a3;
}

- (BOOL)simulateSlowCreation
{
  return self->_simulateSlowCreation;
}

- (void)setSimulateCreationError:(BOOL)a3
{
  self->_simulateCreationError = a3;
}

- (BOOL)simulateCreationError
{
  return self->_simulateCreationError;
}

- (void)setReplaceMemoryCreationWithMockData:(BOOL)a3
{
  self->_replaceMemoryCreationWithMockData = a3;
}

- (BOOL)replaceMemoryCreationWithMockData
{
  return self->_replaceMemoryCreationWithMockData;
}

- (void)setUseSystemPromptInputTextField:(BOOL)a3
{
  self->_useSystemPromptInputTextField = a3;
}

- (BOOL)useSystemPromptInputTextField
{
  return self->_useSystemPromptInputTextField;
}

- (void)setVfxQualityUseBestCrop:(BOOL)a3
{
  self->_vfxQualityUseBestCrop = a3;
}

- (BOOL)vfxQualityUseBestCrop
{
  return self->_vfxQualityUseBestCrop;
}

- (void)setVfxQualityFrameRate:(int64_t)a3
{
  self->_vfxQualityFrameRate = a3;
}

- (int64_t)vfxQualityFrameRate
{
  return self->_vfxQualityFrameRate;
}

- (void)setVfxQualityResolution:(int64_t)a3
{
  self->_vfxQualityResolution = a3;
}

- (int64_t)vfxQualityResolution
{
  return self->_vfxQualityResolution;
}

- (void)setVfxQualityPostProcessingFXHighQuality:(BOOL)a3
{
  self->_vfxQualityPostProcessingFXHighQuality = a3;
}

- (BOOL)vfxQualityPostProcessingFXHighQuality
{
  return self->_vfxQualityPostProcessingFXHighQuality;
}

- (void)setShouldUsePersonalTraitsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUsePersonalTraitsForLoadingAnimation = a3;
}

- (BOOL)shouldUsePersonalTraitsForLoadingAnimation
{
  return self->_shouldUsePersonalTraitsForLoadingAnimation;
}

- (void)setShouldUseGlobalTraitsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUseGlobalTraitsForLoadingAnimation = a3;
}

- (BOOL)shouldUseGlobalTraitsForLoadingAnimation
{
  return self->_shouldUseGlobalTraitsForLoadingAnimation;
}

- (void)setShouldUseExtendedAssetsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUseExtendedAssetsForLoadingAnimation = a3;
}

- (BOOL)shouldUseExtendedAssetsForLoadingAnimation
{
  return self->_shouldUseExtendedAssetsForLoadingAnimation;
}

- (void)setShouldUseRetrievedAssetsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUseRetrievedAssetsForLoadingAnimation = a3;
}

- (BOOL)shouldUseRetrievedAssetsForLoadingAnimation
{
  return self->_shouldUseRetrievedAssetsForLoadingAnimation;
}

- (void)setShouldUsePlaceholderAssetsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUsePlaceholderAssetsForLoadingAnimation = a3;
}

- (BOOL)shouldUsePlaceholderAssetsForLoadingAnimation
{
  return self->_shouldUsePlaceholderAssetsForLoadingAnimation;
}

- (void)setSimulateSlowPrewarmForLoadingAnimation:(BOOL)a3
{
  self->_simulateSlowPrewarmForLoadingAnimation = a3;
}

- (BOOL)simulateSlowPrewarmForLoadingAnimation
{
  return self->_simulateSlowPrewarmForLoadingAnimation;
}

- (void)setPlaybackRateFactor:(double)a3
{
  self->_playbackRateFactor = a3;
}

- (double)playbackRateFactor
{
  return self->_playbackRateFactor;
}

- (void)setBackgroundBlurRadius:(double)a3
{
  self->_backgroundBlurRadius = a3;
}

- (double)backgroundBlurRadius
{
  return self->_backgroundBlurRadius;
}

- (void)setSimulateSlowFetchForBackgroundAssets:(BOOL)a3
{
  self->_simulateSlowFetchForBackgroundAssets = a3;
}

- (BOOL)simulateSlowFetchForBackgroundAssets
{
  return self->_simulateSlowFetchForBackgroundAssets;
}

- (void)setShowAllBackgroundAssets:(BOOL)a3
{
  self->_showAllBackgroundAssets = a3;
}

- (BOOL)showAllBackgroundAssets
{
  return self->_showAllBackgroundAssets;
}

- (void)setFullScreenBackgroundMode:(int64_t)a3
{
  self->_fullScreenBackgroundMode = a3;
}

- (int64_t)fullScreenBackgroundMode
{
  return self->_fullScreenBackgroundMode;
}

- (void)setEntryPointBackgroundMode:(int64_t)a3
{
  self->_entryPointBackgroundMode = a3;
}

- (int64_t)entryPointBackgroundMode
{
  return self->_entryPointBackgroundMode;
}

- (void)setPromptSuggestionRefetchFrequency:(int64_t)a3
{
  self->_promptSuggestionRefetchFrequency = a3;
}

- (int64_t)promptSuggestionRefetchFrequency
{
  return self->_promptSuggestionRefetchFrequency;
}

- (void)setSimulateSlowFetchForPromptSuggestion:(BOOL)a3
{
  self->_simulateSlowFetchForPromptSuggestion = a3;
}

- (BOOL)simulateSlowFetchForPromptSuggestion
{
  return self->_simulateSlowFetchForPromptSuggestion;
}

- (void)setShouldShowSuggestionSourceBadge:(BOOL)a3
{
  self->_shouldShowSuggestionSourceBadge = a3;
}

- (void)setShowFreeformMemoryCreationButtonInMemoryFeed:(BOOL)a3
{
  self->_showFreeformMemoryCreationButtonInMemoryFeed = a3;
}

- (BOOL)showFreeformMemoryCreationButtonInMemoryFeed
{
  return self->_showFreeformMemoryCreationButtonInMemoryFeed;
}

- (void)setShowFreeformMemoryCreationButtonInMemoryShelf:(BOOL)a3
{
  self->_showFreeformMemoryCreationButtonInMemoryShelf = a3;
}

- (BOOL)showFreeformMemoryCreationButtonInMemoryShelf
{
  return self->_showFreeformMemoryCreationButtonInMemoryShelf;
}

- (void)setIsMemoryCreationCellRepositioningEnabled:(BOOL)a3
{
  self->_isMemoryCreationCellRepositioningEnabled = a3;
}

- (BOOL)isMemoryCreationCellRepositioningEnabled
{
  return self->_isMemoryCreationCellRepositioningEnabled;
}

- (void)setMemoryCreationCellPositionInMemoryShelf:(int64_t)a3
{
  self->_memoryCreationCellPositionInMemoryShelf = a3;
}

- (int64_t)memoryCreationCellPositionInMemoryShelf
{
  return self->_memoryCreationCellPositionInMemoryShelf;
}

- (void)setShowFreeformMemoryCreationCellInMemoryShelf:(BOOL)a3
{
  self->_showFreeformMemoryCreationCellInMemoryShelf = a3;
}

- (void)setPreferMockSuggestionsData:(BOOL)a3
{
  self->_preferMockSuggestionsData = a3;
}

- (BOOL)preferMockSuggestionsData
{
  return self->_preferMockSuggestionsData;
}

- (void)setPreferInternalEvaluationUI:(BOOL)a3
{
  self->_preferInternalEvaluationUI = a3;
}

- (BOOL)preferInternalEvaluationUI
{
  return self->_preferInternalEvaluationUI;
}

- (void)setShouldLoadStoriesFromCache:(BOOL)a3
{
  self->_shouldLoadStoriesFromCache = a3;
}

- (BOOL)shouldLoadStoriesFromCache
{
  return self->_shouldLoadStoriesFromCache;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)internal_deleteGenerativeMemories
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v3 = [v2 librarySpecificFetchOptions];
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"category", 32);
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"creationType", 1);
  v6 = (void *)MEMORY[0x1E4F28BA0];
  v24[0] = v4;
  v24[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v8 = [v6 orPredicateWithSubpredicates:v7];

  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 0", @"favorite");
  v10 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v8;
  v23[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];
  [v3 setPredicate:v12];

  [v3 setIncludeStoryMemories:1];
  v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__PXGenerativeStorySettings_internal_deleteGenerativeMemories__block_invoke;
  v21[3] = &unk_1E5DD36F8;
  id v14 = v13;
  id v22 = v14;
  id v20 = 0;
  char v15 = [v2 performChangesAndWait:v21 error:&v20];
  id v16 = v20;
  v17 = v16;
  if (v15)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"All your generative memories have been deleted (%lu memories removed).", objc_msgSend(v14, "count"));
  }
  else
  {
    v18 = [NSString stringWithFormat:@"Could not perform deletion, error: %@", v16];
    NSLog(&cfstr_FailedToCleanu.isa, v17);
  }

  return v18;
}

uint64_t __62__PXGenerativeStorySettings_internal_deleteGenerativeMemories__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39170] deleteMemories:*(void *)(a1 + 32)];
}

+ (BOOL)isMemoryCreationTimeEventDisambiguationEnabled
{
  int v2 = [a1 isMemoryCreationEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

@end