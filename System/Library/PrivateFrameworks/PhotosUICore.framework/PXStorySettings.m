@interface PXStorySettings
+ (id)availableClipCompositions;
+ (id)possibleClipCompositionFallbacks;
+ (id)possibleDefaultHUDTypes;
+ (id)possibleFeedHUDTypes;
+ (id)possibleNormalizationModes;
+ (id)possibleNormalizationTechniques;
+ (id)possiblePaperTrailOptions;
+ (id)possibleTransitionFallbackTitles;
+ (id)possibleTransitionFallbacks;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (id)transientProperties;
- (BOOL)adjustToWallClockTime;
- (BOOL)allowAspectModeToggle;
- (BOOL)allowCustomUserAssets;
- (BOOL)allowLimitingImagesTo3MP;
- (BOOL)allowNonFillingCompositionsForKeyAsset;
- (BOOL)allowOnDemandVideoAnalysis;
- (BOOL)allowRelatedProductionBeforeReadyToPlay;
- (BOOL)allowsContinuousKenBurnsAnimations;
- (BOOL)allowsDefaultBehaviorForShowcaseMode:(int64_t)a3;
- (BOOL)allowsFormSheetPresentation;
- (BOOL)allowsNUpBackground;
- (BOOL)allowsRandomFallbackForShowcaseMode:(int64_t)a3;
- (BOOL)allowsShowcase;
- (BOOL)allowsTimelineRecombination;
- (BOOL)areRelatedHUDsVisible;
- (BOOL)autoEditDisableNUp;
- (BOOL)autoEditUseMomentRecipes;
- (BOOL)chromeAllowAutoHide;
- (BOOL)colorNormalizationUseColorCube;
- (BOOL)debugShowAudioPlaybackDetails;
- (BOOL)debugShowColorNormalizationValues;
- (BOOL)debugShowVideoPlaybackDetails;
- (BOOL)detectVideoLags;
- (BOOL)disableColorGrading;
- (BOOL)disableShowcaseBadge;
- (BOOL)disableVideoPlayback;
- (BOOL)enableBrowseViewColorNormalization;
- (BOOL)enableColorNormalizationWithoutColorGrade;
- (BOOL)enableDemoAction;
- (BOOL)enableFalseColorNormalization;
- (BOOL)enableProtoPlayground;
- (BOOL)enableScrubberColorNormalization;
- (BOOL)enableTitlePositioningLogs;
- (BOOL)estimateTimeLeftPerPlaybackStyle;
- (BOOL)exaggerateResourceDownloadTimes;
- (BOOL)forceFlexForNonPHMemory;
- (BOOL)forceFlexForPHMemory;
- (BOOL)forceFlexIncludesAppleMusic;
- (BOOL)forceLivePhotoVideo;
- (BOOL)forceMinDurationKenBurnsAnimations;
- (BOOL)forcePacingToSegmentMaxDuration;
- (BOOL)forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset;
- (BOOL)includeDeviceDiagnosticsForTTR;
- (BOOL)includeImagesInVisualDiagnosticsForTTR;
- (BOOL)isAppleMusicAllowed;
- (BOOL)isExportHUDEnabled;
- (BOOL)isFeedHUDVisible;
- (BOOL)isHUDEnabled;
- (BOOL)isHUDVisible;
- (BOOL)limitKeyAssetAspectRatioToFeedCard;
- (BOOL)musicDemoVolumeAdjustment;
- (BOOL)muteBackgroundMusic;
- (BOOL)needs79067616Workaround;
- (BOOL)overrideDurations;
- (BOOL)overrideLegibilityGradientHeights;
- (BOOL)playbackShouldWaitForBufferingToBeReady;
- (BOOL)playerShowsBufferingStatus;
- (BOOL)preferAssetLocationAndCreationDateForClipTitleAndSubtitle;
- (BOOL)preferTopChromeItemsInAppNavigationBar;
- (BOOL)preloadNonKeyRelated;
- (BOOL)renderTitlesForRelated;
- (BOOL)reportColorNormalizationErrors;
- (BOOL)scrubberDimsMainContent;
- (BOOL)scrubberLayoutStretchesSmallNumberOfAssets;
- (BOOL)scrubberSelectionStartsPlayback;
- (BOOL)shouldHideSidebarWhenDisplayed;
- (BOOL)shouldPauseInStyleSwitcher;
- (BOOL)shouldRecombineTimelineWithSameVisibleSegments;
- (BOOL)shouldShowAppleMusicRelatedUI;
- (BOOL)shouldStylesAlwaysIncludePersistedSong;
- (BOOL)showErrorAlertsDuringTestExecution;
- (BOOL)showFeedChromeOnHover;
- (BOOL)showMusicAndColorGradeEditor;
- (BOOL)showStyleSwitcher;
- (BOOL)showTVPreviewInDiagnostics;
- (BOOL)simulateLongChromeStrings;
- (BOOL)simulateNoAppleMusicSubscription;
- (BOOL)simulateResourcesBufferingError;
- (BOOL)simulateSlowResourcesBuffering;
- (BOOL)simulateSlowTextLayout;
- (BOOL)smartGradientEnabled;
- (BOOL)smartGradientRepeatEdges;
- (BOOL)smartGradientUseSimpleBlur;
- (BOOL)smartGradientUseSmartColor;
- (BOOL)titleUseCenterAlignment;
- (BOOL)useBestHighlightTrim;
- (BOOL)useBottomLegibilityGradientForBufferingIndicator;
- (BOOL)useCommonActionInfrastructureForActionMenu;
- (BOOL)useFakeAppleMusicAndPrivacyPrompt;
- (BOOL)useFeedPlaceholderItems;
- (BOOL)useMusicCuesForPacing;
- (BOOL)useMusicCuesForTimeline;
- (BOOL)useReferenceWidthBasedTitleLayout;
- (BOOL)useSimpleOverlayFeedLayout;
- (BOOL)useVerboseStyleHUDText;
- (BOOL)validationShouldWaitForTimelineToBeReadyToPlay;
- (BOOL)videoInlineStabilization;
- (BOOL)wantsAnimations;
- (BOOL)wantsAudioFade;
- (BOOL)wantsAudioFromVideo;
- (BOOL)wantsAudioJLCuts;
- (BOOL)wantsBufferingIndicatorOverScrubber;
- (BOOL)wantsFeedItemShadow;
- (BOOL)wantsFullscreenFeedExperience;
- (BOOL)wantsGridLayout;
- (BOOL)wantsHighContrastColors;
- (BOOL)wantsInlinePlayback;
- (BOOL)wantsMovieHighlights;
- (BOOL)wantsPersistence;
- (BOOL)wantsRelated;
- (BOOL)wantsRelatedCountdown;
- (BOOL)wantsResourcesPreloading;
- (BOOL)wantsScrubber;
- (BOOL)wantsTitles;
- (BOOL)wantsTransitions;
- (BOOL)wantsValidation;
- (CGSize)inlinePlaybackCriticalInsets;
- (NSString)clipCompositionFallback;
- (NSString)playButtonRewindSymbolName;
- (PXStoryChapterSettings)chapterSettings;
- (PXStoryConcreteTimelineSettings)concreteTimelineSettings;
- (PXStoryMultipartPanoramaSettings)multipartPanoramaSettings;
- (PXStoryScrubberLayoutSettings)scrubberLayoutSettings;
- (PXStoryTransitionsSettings)transitionsSettings;
- (double)aestheticsScorePercentileThreshold;
- (double)aspectFillOneUpCropTolerance;
- (double)audioFadeMaxDuration;
- (double)audioFadeMinDuration;
- (double)audioJCutDuration;
- (double)audioLCutDuration;
- (double)autoEditDiptychCropAspectMax;
- (double)autoEditDoublePlaceMultiplier;
- (double)autoEditHighCurationScoreThreshold;
- (double)autoEditPortraitAreaMin;
- (double)autoEditPortraitAspectLargeVerticalFaceAreaMin;
- (double)autoEditProductionSimulatedDelay;
- (double)autoEditSceneConfidenceThreshold;
- (double)autoEditTriptychCropAspectMax;
- (double)backgroundAudioLoudnessTarget;
- (double)backgroundQualityScale;
- (double)bottomLegibilityGradientHeight;
- (double)bufferingHUDAutoPresentationTimeout;
- (double)chromeAutoHideDelay;
- (double)continuousKenBurnsAnimationsTolerance;
- (double)curationScorePercentileThreshold;
- (double)duckingFadeDuration;
- (double)estimatedMinimumDurationPerCuratedAsset;
- (double)exposeToBlackRecipeRelativeFrequency;
- (double)feedCardLandscapeAspectRatio;
- (double)feedCardPortraitAspectRatio;
- (double)feedCardWideLandscapeAspectRatio;
- (double)feedItemCornerRadius;
- (double)focusChangeFadeDuration;
- (double)foregroundAudioLoudnessTarget;
- (double)inlinePlaybackCriticalInsetX;
- (double)inlinePlaybackCriticalInsetY;
- (double)legibilityGradientOpacity;
- (double)legibilityPlaybackEndDimming;
- (double)legibilityPlaybackEndDimmingDuration;
- (double)legibilityPlaybackEndDimmingDurationAutoReplay;
- (double)legibilityPlaybackEndUndimmingDuration;
- (double)legibilityPlaybackEndUndimmingDurationAutoReplay;
- (double)legibilityRelatedDimming;
- (double)livePhotoOppositeOrientationCompactMaximumScale;
- (double)livePhotoOppositeOrientationRegularMaximumScale;
- (double)livePhotoSameOrientationCompactMaximumScale;
- (double)livePhotoSameOrientationRegularMaximumScale;
- (double)maximumAppBackgroundDurationBeforeAutoPause;
- (double)movementAnimationLinearFraction;
- (double)movementAnimationPauseDeceleration;
- (double)movementAnimationPausedVelocity;
- (double)movementAnimationResumeAcceleration;
- (double)musicTouchDuckingDelay;
- (double)muteToggleButtonAutoHideDelay;
- (double)noncriticalBufferingTimeout;
- (double)panRecipeRelativeFrequency;
- (double)persistenceConfirmationDuration;
- (double)pressedScale;
- (double)relatedAnimationDuration;
- (double)relatedProductionPlaybackFractionCompletedThreshold;
- (double)scaleRecipeRelativeFrequency;
- (double)scrubberAutoHideDelay;
- (double)scrubberEdgeFadeDistance;
- (double)scrubberEdgeFadeOffset;
- (double)showcaseSegmentDuration;
- (double)showcaseTransitionDuration;
- (double)significantPlayedDuration;
- (double)simulatedAudioCuesLoadingDelay;
- (double)simulatedSlowResourcesBufferingDelay;
- (double)smartGradientBlurRadius;
- (double)smartGradientEdgeStretchFactor;
- (double)smartGradientExposureValue;
- (double)subtitleMinimumScale;
- (double)subtitleSizeScale;
- (double)swipeDownDismissalDelay;
- (double)swipeDownDismissalDistanceThreshold;
- (double)swipeDownSignificantDuration;
- (double)swipeDownThresholdFadeDuration;
- (double)tapNavigationAreaFraction;
- (double)titleFarthestDistanceThreshold;
- (double)titleFeedLandscapeWidthScale;
- (double)titleFeedPortraitWidthScale;
- (double)titleFullScreenLandscapeWidthScale;
- (double)titleFullScreenPortraitWidthScale;
- (double)titleMinimumScale;
- (double)titlePaddingTopScale;
- (double)titleReferenceWidthLandscape;
- (double)titleReferenceWidthPortrait;
- (double)titleRegularPaddingBottomScale;
- (double)titleSizeScale;
- (double)titleWidthMax;
- (double)titleWidthMin;
- (double)topLegibilityGradientHeight;
- (double)videoMaximumAspectFillScale;
- (double)viewModeTransitionAccessoryFadepoint;
- (double)viewModeTransitionSpringStiffness;
- (float)audioQualityMin;
- (float)colorGradeBlendingFactor;
- (float)colorGradeSmoothingFactor;
- (float)colorNormalizationIntensity;
- (float)musicBackgroundVolume;
- (float)musicDuckedVolume;
- (float)musicFadeOutVolume;
- (float)musicTargetLoudnessLKFS;
- (id)feedItemShadow;
- (id)parentSettings;
- (id)possibleClipCompositionsForFallback:(id)a3;
- (id)possibleTransitionKindsForFallback:(int64_t)a3;
- (int64_t)appleMusicPromptTrigger;
- (int64_t)audioFadeCurve;
- (int64_t)audioJCutStrategy;
- (int64_t)audioLCutStrategy;
- (int64_t)autoEditEmptySpaceLengthMax;
- (int64_t)autoEditModuleLengthMax;
- (int64_t)autoEditRotateMotionMax;
- (int64_t)autoEditSongPaceOverride;
- (int64_t)clipCompositionShowcaseMode;
- (int64_t)colorGradeEditorPreviewMode;
- (int64_t)colorGradeSmoothingPasses;
- (int64_t)colorNormalizationCubeEdgeSize;
- (int64_t)colorNormalizationMode;
- (int64_t)colorNormalizationTechnique;
- (int64_t)curatedAssetsLimit;
- (int64_t)defaultHUDType;
- (int64_t)exportHUDType;
- (int64_t)exportVideoQuality;
- (int64_t)feedHUDType;
- (int64_t)feedInitialLimit;
- (int64_t)kashidaTextMode;
- (int64_t)kenBurnsShowcaseMode;
- (int64_t)keyAssetAspectRatioOverride;
- (int64_t)livePhotoAudioStrategy;
- (int64_t)livePhotoLocalVideoQuality;
- (int64_t)loopingVideoAudioStrategy;
- (int64_t)minPreloadedeSegments;
- (int64_t)movementAnimationCurve;
- (int64_t)musicSimulatedFailureMode;
- (int64_t)otherAssetsAspectRatioOverride;
- (int64_t)preloadingEstimationStrategy;
- (int64_t)preloadingSegmentsBatchSize;
- (int64_t)relatedProducerKind;
- (int64_t)scrubberDisplayMode;
- (int64_t)scrubberEdgeFadeMode;
- (int64_t)separatorEffectsShowcaseMode;
- (int64_t)simulatedError;
- (int64_t)simultaneousPreloadingOperationsCount;
- (int64_t)slomoVideoAudioStrategy;
- (int64_t)songsProducerKind;
- (int64_t)swipeDownAction;
- (int64_t)swipeDownBehavior;
- (int64_t)timelineManagerPaperTrailLength;
- (int64_t)timelineProducerKind;
- (int64_t)titleMaximumNumberOfLines;
- (int64_t)transitionFallback;
- (int64_t)transitionShowcaseMode;
- (int64_t)twoFingerTapAction;
- (int64_t)verticalTextMode;
- (int64_t)videoAudioStrategy;
- (int64_t)videoQuality;
- (unint64_t)currentFeedPPTPreset;
- (unint64_t)currentPPTPreset;
- (unint64_t)currentPPTSubpreset;
- (unint64_t)disabledClipMotionStyles;
- (unint64_t)fullsizePaperTrailOptions;
- (unint64_t)preferredFullsizePaperTrailOptions;
- (unsigned)feedPresentationType;
- (unsigned)playerPresentationType;
- (void)createChildren;
- (void)didChangeValueForKey:(id)a3;
- (void)performPostSaveActions;
- (void)setAdjustToWallClockTime:(BOOL)a3;
- (void)setAestheticsScorePercentileThreshold:(double)a3;
- (void)setAllowAspectModeToggle:(BOOL)a3;
- (void)setAllowCustomUserAssets:(BOOL)a3;
- (void)setAllowLimitingImagesTo3MP:(BOOL)a3;
- (void)setAllowNonFillingCompositionsForKeyAsset:(BOOL)a3;
- (void)setAllowOnDemandVideoAnalysis:(BOOL)a3;
- (void)setAllowRelatedProductionBeforeReadyToPlay:(BOOL)a3;
- (void)setAllowsContinuousKenBurnsAnimations:(BOOL)a3;
- (void)setAllowsFormSheetPresentation:(BOOL)a3;
- (void)setAllowsNUpBackground:(BOOL)a3;
- (void)setAllowsShowcase:(BOOL)a3;
- (void)setAllowsTimelineRecombination:(BOOL)a3;
- (void)setAppleMusicPromptTrigger:(int64_t)a3;
- (void)setAreRelatedHUDsVisible:(BOOL)a3;
- (void)setAspectFillOneUpCropTolerance:(double)a3;
- (void)setAudioFadeCurve:(int64_t)a3;
- (void)setAudioFadeMaxDuration:(double)a3;
- (void)setAudioFadeMinDuration:(double)a3;
- (void)setAudioJCutDuration:(double)a3;
- (void)setAudioJCutStrategy:(int64_t)a3;
- (void)setAudioLCutDuration:(double)a3;
- (void)setAudioLCutStrategy:(int64_t)a3;
- (void)setAudioQualityMin:(float)a3;
- (void)setAutoEditDiptychCropAspectMax:(double)a3;
- (void)setAutoEditDisableNUp:(BOOL)a3;
- (void)setAutoEditDoublePlaceMultiplier:(double)a3;
- (void)setAutoEditEmptySpaceLengthMax:(int64_t)a3;
- (void)setAutoEditHighCurationScoreThreshold:(double)a3;
- (void)setAutoEditModuleLengthMax:(int64_t)a3;
- (void)setAutoEditPortraitAreaMin:(double)a3;
- (void)setAutoEditPortraitAspectLargeVerticalFaceAreaMin:(double)a3;
- (void)setAutoEditProductionSimulatedDelay:(double)a3;
- (void)setAutoEditRotateMotionMax:(int64_t)a3;
- (void)setAutoEditSceneConfidenceThreshold:(double)a3;
- (void)setAutoEditSongPaceOverride:(int64_t)a3;
- (void)setAutoEditTriptychCropAspectMax:(double)a3;
- (void)setAutoEditUseMomentRecipes:(BOOL)a3;
- (void)setBackgroundAudioLoudnessTarget:(double)a3;
- (void)setBackgroundQualityScale:(double)a3;
- (void)setBottomLegibilityGradientHeight:(double)a3;
- (void)setBufferingHUDAutoPresentationTimeout:(double)a3;
- (void)setChapterSettings:(id)a3;
- (void)setChromeAllowAutoHide:(BOOL)a3;
- (void)setChromeAutoHideDelay:(double)a3;
- (void)setClipCompositionFallback:(id)a3;
- (void)setClipCompositionShowcaseMode:(int64_t)a3;
- (void)setColorGradeBlendingFactor:(float)a3;
- (void)setColorGradeEditorPreviewMode:(int64_t)a3;
- (void)setColorGradeSmoothingFactor:(float)a3;
- (void)setColorGradeSmoothingPasses:(int64_t)a3;
- (void)setColorNormalizationCubeEdgeSize:(int64_t)a3;
- (void)setColorNormalizationIntensity:(float)a3;
- (void)setColorNormalizationMode:(int64_t)a3;
- (void)setColorNormalizationTechnique:(int64_t)a3;
- (void)setColorNormalizationUseColorCube:(BOOL)a3;
- (void)setConcreteTimelineSettings:(id)a3;
- (void)setContinuousKenBurnsAnimationsTolerance:(double)a3;
- (void)setCuratedAssetsLimit:(int64_t)a3;
- (void)setCurationScorePercentileThreshold:(double)a3;
- (void)setCurrentFeedPPTPreset:(unint64_t)a3;
- (void)setCurrentPPTPreset:(unint64_t)a3;
- (void)setCurrentPPTSubpreset:(unint64_t)a3;
- (void)setDebugShowAudioPlaybackDetails:(BOOL)a3;
- (void)setDebugShowColorNormalizationValues:(BOOL)a3;
- (void)setDebugShowVideoPlaybackDetails:(BOOL)a3;
- (void)setDefaultHUDType:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDetectVideoLags:(BOOL)a3;
- (void)setDisableColorGrading:(BOOL)a3;
- (void)setDisableShowcaseBadge:(BOOL)a3;
- (void)setDisableVideoPlayback:(BOOL)a3;
- (void)setDisabledClipMotionStyles:(unint64_t)a3;
- (void)setDuckingFadeDuration:(double)a3;
- (void)setEnableBrowseViewColorNormalization:(BOOL)a3;
- (void)setEnableColorNormalizationWithoutColorGrade:(BOOL)a3;
- (void)setEnableDemoAction:(BOOL)a3;
- (void)setEnableFalseColorNormalization:(BOOL)a3;
- (void)setEnableProtoPlayground:(BOOL)a3;
- (void)setEnableScrubberColorNormalization:(BOOL)a3;
- (void)setEnableTitlePositioningLogs:(BOOL)a3;
- (void)setEstimateTimeLeftPerPlaybackStyle:(BOOL)a3;
- (void)setEstimatedMinimumDurationPerCuratedAsset:(double)a3;
- (void)setExaggerateResourceDownloadTimes:(BOOL)a3;
- (void)setExportHUDType:(int64_t)a3;
- (void)setExportVideoQuality:(int64_t)a3;
- (void)setExposeToBlackRecipeRelativeFrequency:(double)a3;
- (void)setFeedCardLandscapeAspectRatio:(double)a3;
- (void)setFeedCardPortraitAspectRatio:(double)a3;
- (void)setFeedCardWideLandscapeAspectRatio:(double)a3;
- (void)setFeedHUDType:(int64_t)a3;
- (void)setFeedInitialLimit:(int64_t)a3;
- (void)setFeedItemCornerRadius:(double)a3;
- (void)setFeedPresentationType:(unsigned __int8)a3;
- (void)setFocusChangeFadeDuration:(double)a3;
- (void)setForceFlexForNonPHMemory:(BOOL)a3;
- (void)setForceFlexForPHMemory:(BOOL)a3;
- (void)setForceFlexIncludesAppleMusic:(BOOL)a3;
- (void)setForceLivePhotoVideo:(BOOL)a3;
- (void)setForceMinDurationKenBurnsAnimations:(BOOL)a3;
- (void)setForcePacingToSegmentMaxDuration:(BOOL)a3;
- (void)setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:(BOOL)a3;
- (void)setForegroundAudioLoudnessTarget:(double)a3;
- (void)setIncludeDeviceDiagnosticsForTTR:(BOOL)a3;
- (void)setIncludeImagesInVisualDiagnosticsForTTR:(BOOL)a3;
- (void)setInlinePlaybackCriticalInsetX:(double)a3;
- (void)setInlinePlaybackCriticalInsetY:(double)a3;
- (void)setIsAppleMusicAllowed:(BOOL)a3;
- (void)setIsExportHUDEnabled:(BOOL)a3;
- (void)setIsFeedHUDVisible:(BOOL)a3;
- (void)setIsHUDEnabled:(BOOL)a3;
- (void)setIsHUDVisible:(BOOL)a3;
- (void)setKashidaTextMode:(int64_t)a3;
- (void)setKenBurnsShowcaseMode:(int64_t)a3;
- (void)setKeyAssetAspectRatioOverride:(int64_t)a3;
- (void)setLegibilityGradientOpacity:(double)a3;
- (void)setLegibilityPlaybackEndDimming:(double)a3;
- (void)setLegibilityPlaybackEndDimmingDuration:(double)a3;
- (void)setLegibilityPlaybackEndDimmingDurationAutoReplay:(double)a3;
- (void)setLegibilityPlaybackEndUndimmingDuration:(double)a3;
- (void)setLegibilityPlaybackEndUndimmingDurationAutoReplay:(double)a3;
- (void)setLegibilityRelatedDimming:(double)a3;
- (void)setLimitKeyAssetAspectRatioToFeedCard:(BOOL)a3;
- (void)setLivePhotoAudioStrategy:(int64_t)a3;
- (void)setLivePhotoLocalVideoQuality:(int64_t)a3;
- (void)setLivePhotoOppositeOrientationCompactMaximumScale:(double)a3;
- (void)setLivePhotoOppositeOrientationRegularMaximumScale:(double)a3;
- (void)setLivePhotoSameOrientationCompactMaximumScale:(double)a3;
- (void)setLivePhotoSameOrientationRegularMaximumScale:(double)a3;
- (void)setLoopingVideoAudioStrategy:(int64_t)a3;
- (void)setMaximumAppBackgroundDurationBeforeAutoPause:(double)a3;
- (void)setMinPreloadedeSegments:(int64_t)a3;
- (void)setMovementAnimationCurve:(int64_t)a3;
- (void)setMovementAnimationLinearFraction:(double)a3;
- (void)setMovementAnimationPauseDeceleration:(double)a3;
- (void)setMovementAnimationPausedVelocity:(double)a3;
- (void)setMovementAnimationResumeAcceleration:(double)a3;
- (void)setMultipartPanoramaSettings:(id)a3;
- (void)setMusicBackgroundVolume:(float)a3;
- (void)setMusicDemoVolumeAdjustment:(BOOL)a3;
- (void)setMusicDuckedVolume:(float)a3;
- (void)setMusicFadeOutVolume:(float)a3;
- (void)setMusicSimulatedFailureMode:(int64_t)a3;
- (void)setMusicTargetLoudnessLKFS:(float)a3;
- (void)setMusicTouchDuckingDelay:(double)a3;
- (void)setMuteBackgroundMusic:(BOOL)a3;
- (void)setMuteToggleButtonAutoHideDelay:(double)a3;
- (void)setNeeds79067616Workaround:(BOOL)a3;
- (void)setNoncriticalBufferingTimeout:(double)a3;
- (void)setOtherAssetsAspectRatioOverride:(int64_t)a3;
- (void)setOverrideDurations:(BOOL)a3;
- (void)setOverrideLegibilityGradientHeights:(BOOL)a3;
- (void)setPanRecipeRelativeFrequency:(double)a3;
- (void)setPersistenceConfirmationDuration:(double)a3;
- (void)setPlayButtonRewindSymbolName:(id)a3;
- (void)setPlaybackShouldWaitForBufferingToBeReady:(BOOL)a3;
- (void)setPlayerPresentationType:(unsigned __int8)a3;
- (void)setPlayerShowsBufferingStatus:(BOOL)a3;
- (void)setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:(BOOL)a3;
- (void)setPreferTopChromeItemsInAppNavigationBar:(BOOL)a3;
- (void)setPreferredFullsizePaperTrailOptions:(unint64_t)a3;
- (void)setPreloadNonKeyRelated:(BOOL)a3;
- (void)setPreloadingEstimationStrategy:(int64_t)a3;
- (void)setPreloadingSegmentsBatchSize:(int64_t)a3;
- (void)setPressedScale:(double)a3;
- (void)setRelatedAnimationDuration:(double)a3;
- (void)setRelatedProducerKind:(int64_t)a3;
- (void)setRelatedProductionPlaybackFractionCompletedThreshold:(double)a3;
- (void)setRenderTitlesForRelated:(BOOL)a3;
- (void)setReportColorNormalizationErrors:(BOOL)a3;
- (void)setScaleRecipeRelativeFrequency:(double)a3;
- (void)setScrubberAutoHideDelay:(double)a3;
- (void)setScrubberDimsMainContent:(BOOL)a3;
- (void)setScrubberDisplayMode:(int64_t)a3;
- (void)setScrubberEdgeFadeDistance:(double)a3;
- (void)setScrubberEdgeFadeMode:(int64_t)a3;
- (void)setScrubberEdgeFadeOffset:(double)a3;
- (void)setScrubberLayoutSettings:(id)a3;
- (void)setScrubberLayoutStretchesSmallNumberOfAssets:(BOOL)a3;
- (void)setScrubberSelectionStartsPlayback:(BOOL)a3;
- (void)setSeparatorEffectsShowcaseMode:(int64_t)a3;
- (void)setShouldHideSidebarWhenDisplayed:(BOOL)a3;
- (void)setShouldPauseInStyleSwitcher:(BOOL)a3;
- (void)setShouldRecombineTimelineWithSameVisibleSegments:(BOOL)a3;
- (void)setShouldStylesAlwaysIncludePersistedSong:(BOOL)a3;
- (void)setShowErrorAlertsDuringTestExecution:(BOOL)a3;
- (void)setShowFeedChromeOnHover:(BOOL)a3;
- (void)setShowMusicAndColorGradeEditor:(BOOL)a3;
- (void)setShowStyleSwitcher:(BOOL)a3;
- (void)setShowTVPreviewInDiagnostics:(BOOL)a3;
- (void)setShowcaseSegmentDuration:(double)a3;
- (void)setShowcaseTransitionDuration:(double)a3;
- (void)setSignificantPlayedDuration:(double)a3;
- (void)setSimulateLongChromeStrings:(BOOL)a3;
- (void)setSimulateNoAppleMusicSubscription:(BOOL)a3;
- (void)setSimulateResourcesBufferingError:(BOOL)a3;
- (void)setSimulateSlowResourcesBuffering:(BOOL)a3;
- (void)setSimulateSlowTextLayout:(BOOL)a3;
- (void)setSimulatedAudioCuesLoadingDelay:(double)a3;
- (void)setSimulatedError:(int64_t)a3;
- (void)setSimulatedSlowResourcesBufferingDelay:(double)a3;
- (void)setSimultaneousPreloadingOperationsCount:(int64_t)a3;
- (void)setSlomoVideoAudioStrategy:(int64_t)a3;
- (void)setSmartGradientBlurRadius:(double)a3;
- (void)setSmartGradientEdgeStretchFactor:(double)a3;
- (void)setSmartGradientEnabled:(BOOL)a3;
- (void)setSmartGradientExposureValue:(double)a3;
- (void)setSmartGradientRepeatEdges:(BOOL)a3;
- (void)setSmartGradientUseSimpleBlur:(BOOL)a3;
- (void)setSmartGradientUseSmartColor:(BOOL)a3;
- (void)setSongsProducerKind:(int64_t)a3;
- (void)setSubtitleMinimumScale:(double)a3;
- (void)setSubtitleSizeScale:(double)a3;
- (void)setSwipeDownAction:(int64_t)a3;
- (void)setSwipeDownBehavior:(int64_t)a3;
- (void)setSwipeDownDismissalDelay:(double)a3;
- (void)setSwipeDownDismissalDistanceThreshold:(double)a3;
- (void)setSwipeDownSignificantDuration:(double)a3;
- (void)setSwipeDownThresholdFadeDuration:(double)a3;
- (void)setTapNavigationAreaFraction:(double)a3;
- (void)setTimelineManagerPaperTrailLength:(int64_t)a3;
- (void)setTimelineProducerKind:(int64_t)a3;
- (void)setTitleFarthestDistanceThreshold:(double)a3;
- (void)setTitleFeedLandscapeWidthScale:(double)a3;
- (void)setTitleFeedPortraitWidthScale:(double)a3;
- (void)setTitleFullScreenLandscapeWidthScale:(double)a3;
- (void)setTitleFullScreenPortraitWidthScale:(double)a3;
- (void)setTitleMaximumNumberOfLines:(int64_t)a3;
- (void)setTitleMinimumScale:(double)a3;
- (void)setTitlePaddingTopScale:(double)a3;
- (void)setTitleReferenceWidthLandscape:(double)a3;
- (void)setTitleReferenceWidthPortrait:(double)a3;
- (void)setTitleRegularPaddingBottomScale:(double)a3;
- (void)setTitleSizeScale:(double)a3;
- (void)setTitleUseCenterAlignment:(BOOL)a3;
- (void)setTitleWidthMax:(double)a3;
- (void)setTitleWidthMin:(double)a3;
- (void)setTopLegibilityGradientHeight:(double)a3;
- (void)setTransitionFallback:(int64_t)a3;
- (void)setTransitionShowcaseMode:(int64_t)a3;
- (void)setTransitionsSettings:(id)a3;
- (void)setTwoFingerTapAction:(int64_t)a3;
- (void)setUseBestHighlightTrim:(BOOL)a3;
- (void)setUseBottomLegibilityGradientForBufferingIndicator:(BOOL)a3;
- (void)setUseCommonActionInfrastructureForActionMenu:(BOOL)a3;
- (void)setUseFakeAppleMusicAndPrivacyPrompt:(BOOL)a3;
- (void)setUseFeedPlaceholderItems:(BOOL)a3;
- (void)setUseMusicCuesForPacing:(BOOL)a3;
- (void)setUseMusicCuesForTimeline:(BOOL)a3;
- (void)setUseReferenceWidthBasedTitleLayout:(BOOL)a3;
- (void)setUseSimpleOverlayFeedLayout:(BOOL)a3;
- (void)setUseVerboseStyleHUDText:(BOOL)a3;
- (void)setValidationShouldWaitForTimelineToBeReadyToPlay:(BOOL)a3;
- (void)setVerticalTextMode:(int64_t)a3;
- (void)setVideoAudioStrategy:(int64_t)a3;
- (void)setVideoInlineStabilization:(BOOL)a3;
- (void)setVideoMaximumAspectFillScale:(double)a3;
- (void)setVideoQuality:(int64_t)a3;
- (void)setViewModeTransitionAccessoryFadepoint:(double)a3;
- (void)setViewModeTransitionSpringStiffness:(double)a3;
- (void)setWantsAnimations:(BOOL)a3;
- (void)setWantsAudioFade:(BOOL)a3;
- (void)setWantsAudioFromVideo:(BOOL)a3;
- (void)setWantsAudioJLCuts:(BOOL)a3;
- (void)setWantsBufferingIndicatorOverScrubber:(BOOL)a3;
- (void)setWantsFeedItemShadow:(BOOL)a3;
- (void)setWantsFullscreenFeedExperience:(BOOL)a3;
- (void)setWantsGridLayout:(BOOL)a3;
- (void)setWantsHighContrastColors:(BOOL)a3;
- (void)setWantsInlinePlayback:(BOOL)a3;
- (void)setWantsMovieHighlights:(BOOL)a3;
- (void)setWantsPersistence:(BOOL)a3;
- (void)setWantsRelated:(BOOL)a3;
- (void)setWantsRelatedCountdown:(BOOL)a3;
- (void)setWantsResourcesPreloading:(BOOL)a3;
- (void)setWantsScrubber:(BOOL)a3;
- (void)setWantsTitles:(BOOL)a3;
- (void)setWantsTransitions:(BOOL)a3;
- (void)setWantsValidation:(BOOL)a3;
@end

@implementation PXStorySettings

- (void)createChildren
{
  v3 = [(PTSettings *)[PXStoryConcreteTimelineSettings alloc] initWithDefaultValues];
  concreteTimelineSettings = self->_concreteTimelineSettings;
  self->_concreteTimelineSettings = v3;

  v5 = [(PTSettings *)[PXStoryScrubberLayoutSettings alloc] initWithDefaultValues];
  scrubberLayoutSettings = self->_scrubberLayoutSettings;
  self->_scrubberLayoutSettings = v5;

  v7 = [(PTSettings *)[PXStoryTransitionsSettings alloc] initWithDefaultValues];
  transitionsSettings = self->_transitionsSettings;
  self->_transitionsSettings = v7;

  v9 = [(PTSettings *)[PXStoryMultipartPanoramaSettings alloc] initWithDefaultValues];
  multipartPanoramaSettings = self->_multipartPanoramaSettings;
  self->_multipartPanoramaSettings = v9;

  v11 = [(PTSettings *)[PXStoryChapterSettings alloc] initWithDefaultValues];
  chapterSettings = self->_chapterSettings;
  self->_chapterSettings = v11;
}

- (void)setDefaultValues
{
  v11.receiver = self;
  v11.super_class = (Class)PXStorySettings;
  [(PTSettings *)&v11 setDefaultValues];
  if (PXStoryIsSlowDevice_onceToken != -1) {
    dispatch_once(&PXStoryIsSlowDevice_onceToken, &__block_literal_global_1658);
  }
  [(PXStorySettings *)self setAllowsShowcase:0];
  [(PXStorySettings *)self setClipCompositionShowcaseMode:1];
  [(PXStorySettings *)self setClipCompositionFallback:@"All"];
  [(PXStorySettings *)self setTransitionShowcaseMode:1];
  [(PXStorySettings *)self setTransitionFallback:-1];
  [(PXStorySettings *)self setSeparatorEffectsShowcaseMode:1];
  [(PXStorySettings *)self setKenBurnsShowcaseMode:1];
  [(PXStorySettings *)self setOverrideDurations:0];
  [(PXStorySettings *)self setShowcaseSegmentDuration:5.0];
  double v3 = 1.0;
  [(PXStorySettings *)self setShowcaseTransitionDuration:1.0];
  [(PXStorySettings *)self setDisableShowcaseBadge:0];
  [(PXStorySettings *)self setIncludeImagesInVisualDiagnosticsForTTR:0];
  [(PXStorySettings *)self setIncludeDeviceDiagnosticsForTTR:1];
  [(PXStorySettings *)self setSimulatedError:0];
  [(PXStorySettings *)self setAllowLimitingImagesTo3MP:1];
  [(PXStorySettings *)self setAllowAspectModeToggle:0];
  [(PXStorySettings *)self setIsHUDEnabled:0];
  [(PXStorySettings *)self setIsHUDVisible:0];
  [(PXStorySettings *)self setAreRelatedHUDsVisible:0];
  [(PXStorySettings *)self setDefaultHUDType:1];
  [(PXStorySettings *)self setIsExportHUDEnabled:0];
  [(PXStorySettings *)self setExportHUDType:0];
  [(PXStorySettings *)self setFeedHUDType:19];
  [(PXStorySettings *)self setEnableDemoAction:0];
  [(PXStorySettings *)self setEnableProtoPlayground:0];
  [(PXStorySettings *)self setWantsTitles:1];
  [(PXStorySettings *)self setWantsRelated:1];
  [(PXStorySettings *)self setWantsResourcesPreloading:1];
  [(PXStorySettings *)self setWantsScrubber:1];
  [(PXStorySettings *)self setWantsGridLayout:1];
  [(PXStorySettings *)self setWantsPersistence:1];
  [(PXStorySettings *)self setPersistenceConfirmationDuration:2.0];
  [(PXStorySettings *)self setWantsAnimations:1];
  [(PXStorySettings *)self setWantsTransitions:1];
  [(PXStorySettings *)self setWantsHighContrastColors:0];
  [(PXStorySettings *)self setWantsValidation:PFOSVariantHasInternalDiagnostics()];
  [(PXStorySettings *)self setTwoFingerTapAction:0];
  [(PXStorySettings *)self setPreferredFullsizePaperTrailOptions:1];
  [(PXStorySettings *)self setSwipeDownAction:1];
  [(PXStorySettings *)self setRenderTitlesForRelated:1];
  [(PXStorySettings *)self setMaximumAppBackgroundDurationBeforeAutoPause:30.0];
  [(PXStorySettings *)self setFeedPresentationType:0];
  [(PXStorySettings *)self setPlayerPresentationType:0];
  [(PXStorySettings *)self setAllowCustomUserAssets:_os_feature_enabled_impl()];
  [(PXStorySettings *)self setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:0];
  [(PXStorySettings *)self setShouldHideSidebarWhenDisplayed:0];
  [(PXStorySettings *)self setTimelineProducerKind:0];
  [(PXStorySettings *)self setAllowsTimelineRecombination:1];
  [(PXStorySettings *)self setShouldRecombineTimelineWithSameVisibleSegments:0];
  [(PXStorySettings *)self setValidationShouldWaitForTimelineToBeReadyToPlay:1];
  [(PXStorySettings *)self setAllowNonFillingCompositionsForKeyAsset:1];
  [(PXStorySettings *)self setLimitKeyAssetAspectRatioToFeedCard:1];
  [(PXStorySettings *)self setKeyAssetAspectRatioOverride:0];
  [(PXStorySettings *)self setOtherAssetsAspectRatioOverride:0];
  [(PXStorySettings *)self setAspectFillOneUpCropTolerance:0.9];
  [(PXStorySettings *)self setLivePhotoSameOrientationCompactMaximumScale:1.7];
  [(PXStorySettings *)self setLivePhotoSameOrientationRegularMaximumScale:1.3];
  [(PXStorySettings *)self setLivePhotoOppositeOrientationCompactMaximumScale:1.45];
  [(PXStorySettings *)self setLivePhotoOppositeOrientationRegularMaximumScale:1.1];
  [(PXStorySettings *)self setViewModeTransitionSpringStiffness:150.0];
  [(PXStorySettings *)self setViewModeTransitionAccessoryFadepoint:0.5];
  [(PXStorySettings *)self setTimelineManagerPaperTrailLength:20];
  [(PXStorySettings *)self setEstimatedMinimumDurationPerCuratedAsset:1.0];
  [(PXStorySettings *)self setCuratedAssetsLimit:2000];
  [(PXStorySettings *)self setShowStyleSwitcher:1];
  [(PXStorySettings *)self setShowMusicAndColorGradeEditor:1];
  [(PXStorySettings *)self setShouldStylesAlwaysIncludePersistedSong:1];
  LODWORD(v4) = 1060453346;
  [(PXStorySettings *)self setMusicDuckedVolume:v4];
  LODWORD(v5) = 1048615863;
  [(PXStorySettings *)self setMusicBackgroundVolume:v5];
  LODWORD(v6) = 1048615863;
  [(PXStorySettings *)self setMusicFadeOutVolume:v6];
  [(PXStorySettings *)self setDuckingFadeDuration:1.0];
  [(PXStorySettings *)self setFocusChangeFadeDuration:0.5];
  [(PXStorySettings *)self setMusicSimulatedFailureMode:0];
  LODWORD(v7) = -24.0;
  [(PXStorySettings *)self setMusicTargetLoudnessLKFS:v7];
  [(PXStorySettings *)self setMusicTouchDuckingDelay:0.3];
  [(PXStorySettings *)self setSimulateNoAppleMusicSubscription:0];
  [(PXStorySettings *)self setSongsProducerKind:0];
  [(PXStorySettings *)self setUseMusicCuesForPacing:1];
  [(PXStorySettings *)self setUseMusicCuesForTimeline:1];
  [(PXStorySettings *)self setForcePacingToSegmentMaxDuration:0];
  [(PXStorySettings *)self setAdjustToWallClockTime:1];
  [(PXStorySettings *)self setMusicDemoVolumeAdjustment:1];
  [(PXStorySettings *)self setAppleMusicPromptTrigger:1];
  [(PXStorySettings *)self setUseFakeAppleMusicAndPrivacyPrompt:0];
  [(PXStorySettings *)self setForceFlexForNonPHMemory:0];
  [(PXStorySettings *)self setForceFlexForPHMemory:0];
  [(PXStorySettings *)self setForceFlexIncludesAppleMusic:1];
  [(PXStorySettings *)self setAllowsContinuousKenBurnsAnimations:1];
  [(PXStorySettings *)self setContinuousKenBurnsAnimationsTolerance:0.1];
  [(PXStorySettings *)self setForceMinDurationKenBurnsAnimations:0];
  [(PXStorySettings *)self setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:0];
  [(PXStorySettings *)self setDisableVideoPlayback:0];
  [(PXStorySettings *)self setForceLivePhotoVideo:0];
  [(PXStorySettings *)self setWantsMovieHighlights:1];
  [(PXStorySettings *)self setUseBestHighlightTrim:1];
  [(PXStorySettings *)self setAllowOnDemandVideoAnalysis:0];
  [(PXStorySettings *)self setVideoInlineStabilization:1];
  [(PXStorySettings *)self setDebugShowVideoPlaybackDetails:0];
  [(PXStorySettings *)self setVideoMaximumAspectFillScale:1.4];
  [(PXStorySettings *)self setLivePhotoLocalVideoQuality:1];
  [(PXStorySettings *)self setExportVideoQuality:1];
  [(PXStorySettings *)self setVideoQuality:1];
  [(PXStorySettings *)self setDetectVideoLags:0];
  [(PXStorySettings *)self setSignificantPlayedDuration:1.0];
  [(PXStorySettings *)self setMuteToggleButtonAutoHideDelay:4.0];
  [(PXStorySettings *)self setIsAppleMusicAllowed:1];
  [(PXStorySettings *)self setWantsAudioFromVideo:1];
  [(PXStorySettings *)self setMuteBackgroundMusic:1];
  [(PXStorySettings *)self setForegroundAudioLoudnessTarget:-15.0];
  [(PXStorySettings *)self setBackgroundAudioLoudnessTarget:-35.0];
  [(PXStorySettings *)self setVideoAudioStrategy:5];
  [(PXStorySettings *)self setSlomoVideoAudioStrategy:0];
  [(PXStorySettings *)self setLivePhotoAudioStrategy:5];
  [(PXStorySettings *)self setLoopingVideoAudioStrategy:1];
  [(PXStorySettings *)self setWantsAudioFade:1];
  [(PXStorySettings *)self setAudioFadeMinDuration:0.167];
  [(PXStorySettings *)self setAudioFadeMaxDuration:0.667];
  [(PXStorySettings *)self setAudioFadeCurve:2];
  [(PXStorySettings *)self setWantsAudioJLCuts:1];
  [(PXStorySettings *)self setAudioJCutStrategy:3];
  [(PXStorySettings *)self setAudioLCutStrategy:3];
  [(PXStorySettings *)self setAudioJCutDuration:0.5];
  [(PXStorySettings *)self setAudioLCutDuration:0.25];
  [(PXStorySettings *)self setDebugShowAudioPlaybackDetails:0];
  [(PXStorySettings *)self setSimulatedAudioCuesLoadingDelay:0.0];
  LODWORD(v8) = 0.5;
  [(PXStorySettings *)self setAudioQualityMin:v8];
  [(PXStorySettings *)self setWantsBufferingIndicatorOverScrubber:1];
  [(PXStorySettings *)self setNoncriticalBufferingTimeout:3.0];
  [(PXStorySettings *)self setBufferingHUDAutoPresentationTimeout:10.0];
  [(PXStorySettings *)self setPlayerShowsBufferingStatus:1];
  [(PXStorySettings *)self setSimulateResourcesBufferingError:0];
  [(PXStorySettings *)self setSimulateSlowResourcesBuffering:0];
  [(PXStorySettings *)self setSimulatedSlowResourcesBufferingDelay:2.5];
  [(PXStorySettings *)self setExaggerateResourceDownloadTimes:0];
  [(PXStorySettings *)self setPlaybackShouldWaitForBufferingToBeReady:1];
  [(PXStorySettings *)self setSimultaneousPreloadingOperationsCount:4];
  [(PXStorySettings *)self setPreloadingSegmentsBatchSize:2];
  [(PXStorySettings *)self setPreloadingEstimationStrategy:0];
  [(PXStorySettings *)self setMinPreloadedeSegments:4];
  [(PXStorySettings *)self setPreloadNonKeyRelated:0];
  [(PXStorySettings *)self setEstimateTimeLeftPerPlaybackStyle:0];
  [(PXStorySettings *)self setScrubberDisplayMode:0];
  [(PXStorySettings *)self setScrubberDimsMainContent:0];
  [(PXStorySettings *)self setScrubberEdgeFadeMode:0];
  [(PXStorySettings *)self setScrubberEdgeFadeDistance:50.0];
  [(PXStorySettings *)self setScrubberEdgeFadeOffset:15.0];
  [(PXStorySettings *)self setScrubberAutoHideDelay:1.5];
  [(PXStorySettings *)self setScrubberLayoutStretchesSmallNumberOfAssets:0];
  [(PXStorySettings *)self setScrubberSelectionStartsPlayback:0];
  [(PXStorySettings *)self setChromeAllowAutoHide:1];
  [(PXStorySettings *)self setChromeAutoHideDelay:4.0];
  [(PXStorySettings *)self setLegibilityGradientOpacity:0.2];
  [(PXStorySettings *)self setOverrideLegibilityGradientHeights:0];
  [(PXStorySettings *)self setTopLegibilityGradientHeight:200.0];
  [(PXStorySettings *)self setBottomLegibilityGradientHeight:260.0];
  [(PXStorySettings *)self setUseBottomLegibilityGradientForBufferingIndicator:0];
  [(PXStorySettings *)self setLegibilityRelatedDimming:0.7];
  [(PXStorySettings *)self setLegibilityPlaybackEndDimming:0.7];
  [(PXStorySettings *)self setLegibilityPlaybackEndDimmingDuration:0.5];
  [(PXStorySettings *)self setLegibilityPlaybackEndDimmingDurationAutoReplay:1.0];
  [(PXStorySettings *)self setLegibilityPlaybackEndUndimmingDuration:0.3];
  [(PXStorySettings *)self setLegibilityPlaybackEndUndimmingDurationAutoReplay:0.6];
  [(PXStorySettings *)self setPlayButtonRewindSymbolName:@"play.fill"];
  [(PXStorySettings *)self setSimulateLongChromeStrings:0];
  [(PXStorySettings *)self setPreferTopChromeItemsInAppNavigationBar:0];
  [(PXStorySettings *)self setTapNavigationAreaFraction:0.1];
  [(PXStorySettings *)self setRelatedProducerKind:0];
  [(PXStorySettings *)self setRelatedProductionPlaybackFractionCompletedThreshold:0.25];
  [(PXStorySettings *)self setAllowRelatedProductionBeforeReadyToPlay:0];
  [(PXStorySettings *)self setWantsRelatedCountdown:1];
  [(PXStorySettings *)self setRelatedAnimationDuration:1.0];
  [(PXStorySettings *)self setSmartGradientEnabled:1];
  [(PXStorySettings *)self setSmartGradientUseSmartColor:0];
  [(PXStorySettings *)self setSmartGradientUseSimpleBlur:1];
  [(PXStorySettings *)self setSmartGradientBlurRadius:40.0];
  [(PXStorySettings *)self setSmartGradientExposureValue:-0.4];
  [(PXStorySettings *)self setSmartGradientRepeatEdges:1];
  [(PXStorySettings *)self setSmartGradientEdgeStretchFactor:8.0];
  [(PXStorySettings *)self setBackgroundQualityScale:1.0];
  [(PXStorySettings *)self setAllowsNUpBackground:1];
  [(PXStorySettings *)self setMovementAnimationCurve:5];
  if (![(PXStorySettings *)self useMusicCuesForTimeline])
  {
    if ([(PXStorySettings *)self useMusicCuesForPacing]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.85;
    }
  }
  [(PXStorySettings *)self setMovementAnimationLinearFraction:v3];
  [(PXStorySettings *)self setMovementAnimationPauseDeceleration:1.25];
  [(PXStorySettings *)self setMovementAnimationPausedVelocity:0.0];
  [(PXStorySettings *)self setMovementAnimationResumeAcceleration:2.5];
  [(PXStorySettings *)self setCurrentPPTPreset:2];
  [(PXStorySettings *)self setCurrentPPTSubpreset:0];
  [(PXStorySettings *)self setCurrentFeedPPTPreset:3];
  [(PXStorySettings *)self setShowErrorAlertsDuringTestExecution:0];
  [(PXStorySettings *)self setDisableColorGrading:0];
  [(PXStorySettings *)self setColorGradeEditorPreviewMode:0];
  [(PXStorySettings *)self setColorGradeSmoothingFactor:0.0];
  [(PXStorySettings *)self setColorGradeSmoothingPasses:0];
  [(PXStorySettings *)self setColorGradeBlendingFactor:0.0];
  [(PXStorySettings *)self setColorNormalizationMode:2];
  [(PXStorySettings *)self setColorNormalizationTechnique:0];
  [(PXStorySettings *)self setEnableBrowseViewColorNormalization:1];
  [(PXStorySettings *)self setEnableScrubberColorNormalization:1];
  [(PXStorySettings *)self setDebugShowColorNormalizationValues:0];
  [(PXStorySettings *)self setEnableFalseColorNormalization:0];
  [(PXStorySettings *)self setColorNormalizationUseColorCube:0];
  [(PXStorySettings *)self setColorNormalizationCubeEdgeSize:32];
  [(PXStorySettings *)self setEnableColorNormalizationWithoutColorGrade:0];
  LODWORD(v9) = 1.0;
  [(PXStorySettings *)self setColorNormalizationIntensity:v9];
  [(PXStorySettings *)self setReportColorNormalizationErrors:0];
  [(PXStorySettings *)self setWantsFullscreenFeedExperience:0];
  [(PXStorySettings *)self setShowFeedChromeOnHover:0];
  [(PXStorySettings *)self setWantsInlinePlayback:1];
  [(PXStorySettings *)self setInlinePlaybackCriticalInsetX:90.0];
  [(PXStorySettings *)self setInlinePlaybackCriticalInsetY:30.0];
  [(PXStorySettings *)self setPressedScale:0.96];
  [(PXStorySettings *)self setFeedInitialLimit:500];
  [(PXStorySettings *)self setFeedCardLandscapeAspectRatio:1.5];
  [(PXStorySettings *)self setFeedCardPortraitAspectRatio:0.75];
  [(PXStorySettings *)self setFeedCardWideLandscapeAspectRatio:2.9];
  [(PXStorySettings *)self setFeedItemCornerRadius:23.0];
  [(PXStorySettings *)self setUseSimpleOverlayFeedLayout:0];
  [(PXStorySettings *)self setUseFeedPlaceholderItems:0];
  [(PXStorySettings *)self setWantsFeedItemShadow:1];
  [(PXStorySettings *)self setAllowsFormSheetPresentation:0];
  [(PXStorySettings *)self setSwipeDownBehavior:0];
  [(PXStorySettings *)self setSwipeDownDismissalDelay:0.5];
  [(PXStorySettings *)self setSwipeDownDismissalDistanceThreshold:250.0];
  [(PXStorySettings *)self setSwipeDownSignificantDuration:0.0];
  [(PXStorySettings *)self setSwipeDownThresholdFadeDuration:0.3];
  [(PXStorySettings *)self setNeeds79067616Workaround:1];
  [(PXStorySettings *)self setAutoEditDiptychCropAspectMax:1.5];
  [(PXStorySettings *)self setAutoEditTriptychCropAspectMax:2.25];
  [(PXStorySettings *)self setAutoEditPortraitAreaMin:0.0289];
  [(PXStorySettings *)self setAutoEditPortraitAspectLargeVerticalFaceAreaMin:0.3];
  [(PXStorySettings *)self setAutoEditModuleLengthMax:4];
  [(PXStorySettings *)self setAutoEditRotateMotionMax:3];
  [(PXStorySettings *)self setAutoEditEmptySpaceLengthMax:5];
  [(PXStorySettings *)self setAutoEditProductionSimulatedDelay:0.0];
  [(PXStorySettings *)self setAutoEditDisableNUp:0];
  [(PXStorySettings *)self setDisabledClipMotionStyles:0];
  [(PXStorySettings *)self setAutoEditSongPaceOverride:0];
  [(PXStorySettings *)self setAutoEditUseMomentRecipes:0];
  [(PXStorySettings *)self setScaleRecipeRelativeFrequency:1.0];
  [(PXStorySettings *)self setPanRecipeRelativeFrequency:1.0];
  [(PXStorySettings *)self setExposeToBlackRecipeRelativeFrequency:1.0];
  [(PXStorySettings *)self setAutoEditSceneConfidenceThreshold:0.5];
  [(PXStorySettings *)self setAutoEditHighCurationScoreThreshold:0.75];
  [(PXStorySettings *)self setAutoEditDoublePlaceMultiplier:0.5];
  [(PXStorySettings *)self setUseReferenceWidthBasedTitleLayout:1];
  [(PXStorySettings *)self setTitleReferenceWidthPortrait:260.0];
  [(PXStorySettings *)self setTitleReferenceWidthLandscape:285.0];
  [(PXStorySettings *)self setTitleFeedPortraitWidthScale:0.0];
  [(PXStorySettings *)self setTitleFeedLandscapeWidthScale:0.0];
  [(PXStorySettings *)self setTitleFullScreenPortraitWidthScale:0.0];
  [(PXStorySettings *)self setTitleFullScreenLandscapeWidthScale:0.0];
  [(PXStorySettings *)self setTitleRegularPaddingBottomScale:0.21];
  [(PXStorySettings *)self setTitlePaddingTopScale:0.0];
  [(PXStorySettings *)self setTitleWidthMin:0.0];
  [(PXStorySettings *)self setTitleWidthMax:0.0];
  [(PXStorySettings *)self setTitleSizeScale:0.0];
  [(PXStorySettings *)self setSubtitleSizeScale:0.0];
  [(PXStorySettings *)self setTitleMinimumScale:0.4];
  [(PXStorySettings *)self setSubtitleMinimumScale:0.5];
  [(PXStorySettings *)self setTitleUseCenterAlignment:0];
  [(PXStorySettings *)self setTitleFarthestDistanceThreshold:0.06];
  [(PXStorySettings *)self setEnableTitlePositioningLogs:0];
  [(PXStorySettings *)self setTitleMaximumNumberOfLines:3];
  uint64_t v10 = _os_feature_enabled_impl() ^ 1;
  [(PXStorySettings *)self setVerticalTextMode:v10];
  [(PXStorySettings *)self setKashidaTextMode:v10];
  [(PXStorySettings *)self setSimulateSlowTextLayout:0];
  [(PXStorySettings *)self setShowTVPreviewInDiagnostics:1];
  [(PXStorySettings *)self setCurationScorePercentileThreshold:*MEMORY[0x1E4F39410]];
  [(PXStorySettings *)self setAestheticsScorePercentileThreshold:*MEMORY[0x1E4F39408]];
  [(PXStorySettings *)self setUseCommonActionInfrastructureForActionMenu:0];
}

- (BOOL)useMusicCuesForTimeline
{
  return self->_useMusicCuesForTimeline;
}

- (void)setWantsValidation:(BOOL)a3
{
  self->_wantsValidation = a3;
}

- (void)setWantsTransitions:(BOOL)a3
{
  self->_wantsTransitions = a3;
}

- (void)setWantsTitles:(BOOL)a3
{
  self->_wantsTitles = a3;
}

- (void)setWantsScrubber:(BOOL)a3
{
  self->_wantsScrubber = a3;
}

- (void)setWantsResourcesPreloading:(BOOL)a3
{
  self->_wantsResourcesPreloading = a3;
}

- (void)setWantsRelatedCountdown:(BOOL)a3
{
  self->_wantsRelatedCountdown = a3;
}

- (void)setWantsRelated:(BOOL)a3
{
  self->_wantsRelated = a3;
}

- (void)setWantsPersistence:(BOOL)a3
{
  self->_wantsPersistence = a3;
}

- (void)setWantsMovieHighlights:(BOOL)a3
{
  self->_wantsMovieHighlights = a3;
}

- (void)setWantsInlinePlayback:(BOOL)a3
{
  self->_wantsInlinePlayback = a3;
}

- (void)setWantsHighContrastColors:(BOOL)a3
{
  self->_wantsHighContrastColors = a3;
}

- (void)setWantsGridLayout:(BOOL)a3
{
  self->_wantsGridLayout = a3;
}

- (void)setWantsFullscreenFeedExperience:(BOOL)a3
{
  self->_wantsFullscreenFeedExperience = a3;
}

- (void)setWantsFeedItemShadow:(BOOL)a3
{
  self->_wantsFeedItemShadow = a3;
}

- (void)setWantsBufferingIndicatorOverScrubber:(BOOL)a3
{
  self->_wantsBufferingIndicatorOverScrubber = a3;
}

- (void)setWantsAudioJLCuts:(BOOL)a3
{
  self->_wantsAudioJLCuts = a3;
}

- (void)setWantsAudioFromVideo:(BOOL)a3
{
  self->_wantsAudioFromVideo = a3;
}

- (void)setWantsAudioFade:(BOOL)a3
{
  self->_wantsAudioFade = a3;
}

- (void)setWantsAnimations:(BOOL)a3
{
  self->_wantsAnimations = a3;
}

- (void)setViewModeTransitionSpringStiffness:(double)a3
{
  self->_viewModeTransitionSpringStiffness = a3;
}

- (void)setViewModeTransitionAccessoryFadepoint:(double)a3
{
  self->_viewModeTransitionAccessoryFadepoint = a3;
}

- (void)setVideoQuality:(int64_t)a3
{
  self->_videoQuality = a3;
}

- (void)setVideoMaximumAspectFillScale:(double)a3
{
  self->_videoMaximumAspectFillScale = a3;
}

- (void)setVideoInlineStabilization:(BOOL)a3
{
  self->_videoInlineStabilization = a3;
}

- (void)setVideoAudioStrategy:(int64_t)a3
{
  self->_videoAudioStrategy = a3;
}

- (void)setVerticalTextMode:(int64_t)a3
{
  self->_verticalTextMode = a3;
}

- (void)setValidationShouldWaitForTimelineToBeReadyToPlay:(BOOL)a3
{
  self->_validationShouldWaitForTimelineToBeReadyToPlay = a3;
}

- (void)setUseSimpleOverlayFeedLayout:(BOOL)a3
{
  self->_useSimpleOverlayFeedLayout = a3;
}

- (void)setUseReferenceWidthBasedTitleLayout:(BOOL)a3
{
  self->_useReferenceWidthBasedTitleLayout = a3;
}

- (void)setUseMusicCuesForTimeline:(BOOL)a3
{
  self->_useMusicCuesForTimeline = a3;
}

- (void)setUseMusicCuesForPacing:(BOOL)a3
{
  self->_useMusicCuesForPacing = a3;
}

- (void)setUseFeedPlaceholderItems:(BOOL)a3
{
  self->_useFeedPlaceholderItems = a3;
}

- (void)setUseFakeAppleMusicAndPrivacyPrompt:(BOOL)a3
{
  self->_useFakeAppleMusicAndPrivacyPrompt = a3;
}

- (void)setUseCommonActionInfrastructureForActionMenu:(BOOL)a3
{
  self->_useCommonActionInfrastructureForActionMenu = a3;
}

- (void)setUseBottomLegibilityGradientForBufferingIndicator:(BOOL)a3
{
  self->_useBottomLegibilityGradientForBufferingIndicator = a3;
}

- (void)setUseBestHighlightTrim:(BOOL)a3
{
  self->_useBestHighlightTrim = a3;
}

- (void)setTwoFingerTapAction:(int64_t)a3
{
  self->_twoFingerTapAction = a3;
}

- (void)setTransitionShowcaseMode:(int64_t)a3
{
  self->_transitionShowcaseMode = a3;
}

- (void)setTransitionFallback:(int64_t)a3
{
  self->_transitionFallback = a3;
}

- (void)setTopLegibilityGradientHeight:(double)a3
{
  self->_topLegibilityGradientHeight = a3;
}

- (void)setTitleWidthMin:(double)a3
{
  self->_titleWidthMin = a3;
}

- (void)setTitleWidthMax:(double)a3
{
  self->_titleWidthMax = a3;
}

- (void)setTitleUseCenterAlignment:(BOOL)a3
{
  self->_titleUseCenterAlignment = a3;
}

- (void)setTitleSizeScale:(double)a3
{
  self->_titleSizeScale = a3;
}

- (void)setTitleRegularPaddingBottomScale:(double)a3
{
  self->_titleRegularPaddingBottomScale = a3;
}

- (void)setTitleReferenceWidthPortrait:(double)a3
{
  self->_titleReferenceWidthPortrait = a3;
}

- (void)setTitleReferenceWidthLandscape:(double)a3
{
  self->_titleReferenceWidthLandscape = a3;
}

- (void)setTitlePaddingTopScale:(double)a3
{
  self->_titlePaddingTopScale = a3;
}

- (void)setTitleMinimumScale:(double)a3
{
  self->_titleMinimumScale = a3;
}

- (void)setTitleMaximumNumberOfLines:(int64_t)a3
{
  self->_titleMaximumNumberOfLines = a3;
}

- (void)setTitleFullScreenPortraitWidthScale:(double)a3
{
  self->_titleFullScreenPortraitWidthScale = a3;
}

- (void)setTitleFullScreenLandscapeWidthScale:(double)a3
{
  self->_titleFullScreenLandscapeWidthScale = a3;
}

- (void)setTitleFeedPortraitWidthScale:(double)a3
{
  self->_titleFeedPortraitWidthScale = a3;
}

- (void)setTitleFeedLandscapeWidthScale:(double)a3
{
  self->_titleFeedLandscapeWidthScale = a3;
}

- (void)setTitleFarthestDistanceThreshold:(double)a3
{
  self->_titleFarthestDistanceThreshold = a3;
}

- (void)setTimelineProducerKind:(int64_t)a3
{
  self->_timelineProducerKind = a3;
}

- (void)setTimelineManagerPaperTrailLength:(int64_t)a3
{
  self->_timelineManagerPaperTrailLength = a3;
}

- (void)setTapNavigationAreaFraction:(double)a3
{
  self->_tapNavigationAreaFraction = a3;
}

- (void)setSwipeDownThresholdFadeDuration:(double)a3
{
  self->_swipeDownThresholdFadeDuration = a3;
}

- (void)setSwipeDownSignificantDuration:(double)a3
{
  self->_swipeDownSignificantDuration = a3;
}

- (void)setSwipeDownDismissalDistanceThreshold:(double)a3
{
  self->_swipeDownDismissalDistanceThreshold = a3;
}

- (void)setSwipeDownDismissalDelay:(double)a3
{
  self->_swipeDownDismissalDelay = a3;
}

- (void)setSwipeDownBehavior:(int64_t)a3
{
  self->_swipeDownBehavior = a3;
}

- (void)setSwipeDownAction:(int64_t)a3
{
  self->_swipeDownAction = a3;
}

- (void)setSubtitleSizeScale:(double)a3
{
  self->_subtitleSizeScale = a3;
}

- (void)setSubtitleMinimumScale:(double)a3
{
  self->_subtitleMinimumScale = a3;
}

- (void)setSongsProducerKind:(int64_t)a3
{
  self->_songsProducerKind = a3;
}

- (void)setSmartGradientUseSmartColor:(BOOL)a3
{
  self->_smartGradientUseSmartColor = a3;
}

- (void)setSmartGradientUseSimpleBlur:(BOOL)a3
{
  self->_smartGradientUseSimpleBlur = a3;
}

- (void)setSmartGradientRepeatEdges:(BOOL)a3
{
  self->_smartGradientRepeatEdges = a3;
}

- (void)setSmartGradientExposureValue:(double)a3
{
  self->_smartGradientExposureValue = a3;
}

- (void)setSmartGradientEnabled:(BOOL)a3
{
  self->_smartGradientEnabled = a3;
}

- (void)setSmartGradientEdgeStretchFactor:(double)a3
{
  self->_smartGradientEdgeStretchFactor = a3;
}

- (void)setSmartGradientBlurRadius:(double)a3
{
  self->_smartGradientBlurRadius = a3;
}

- (void)setSlomoVideoAudioStrategy:(int64_t)a3
{
  self->_slomoVideoAudioStrategy = a3;
}

- (void)setSimultaneousPreloadingOperationsCount:(int64_t)a3
{
  self->_simultaneousPreloadingOperationsCount = a3;
}

- (void)setSimulatedSlowResourcesBufferingDelay:(double)a3
{
  self->_simulatedSlowResourcesBufferingDelay = a3;
}

- (void)setSimulatedError:(int64_t)a3
{
  self->_simulatedError = a3;
}

- (void)setSimulatedAudioCuesLoadingDelay:(double)a3
{
  self->_simulatedAudioCuesLoadingDelay = a3;
}

- (void)setSimulateSlowTextLayout:(BOOL)a3
{
  self->_simulateSlowTextLayout = a3;
}

- (void)setSimulateSlowResourcesBuffering:(BOOL)a3
{
  self->_simulateSlowResourcesBuffering = a3;
}

- (void)setSimulateResourcesBufferingError:(BOOL)a3
{
  self->_simulateResourcesBufferingError = a3;
}

- (void)setSimulateNoAppleMusicSubscription:(BOOL)a3
{
  self->_simulateNoAppleMusicSubscription = a3;
}

- (void)setSimulateLongChromeStrings:(BOOL)a3
{
  self->_simulateLongChromeStrings = a3;
}

- (void)setSignificantPlayedDuration:(double)a3
{
  self->_significantPlayedDuration = a3;
}

- (void)setShowcaseTransitionDuration:(double)a3
{
  self->_showcaseTransitionDuration = a3;
}

- (void)setShowcaseSegmentDuration:(double)a3
{
  self->_showcaseSegmentDuration = a3;
}

- (void)setShowTVPreviewInDiagnostics:(BOOL)a3
{
  self->_showTVPreviewInDiagnostics = a3;
}

- (void)setShowStyleSwitcher:(BOOL)a3
{
  self->_showStyleSwitcher = a3;
}

- (void)setShowMusicAndColorGradeEditor:(BOOL)a3
{
  self->_showMusicAndColorGradeEditor = a3;
}

- (void)setShowFeedChromeOnHover:(BOOL)a3
{
  self->_showFeedChromeOnHover = a3;
}

- (void)setShowErrorAlertsDuringTestExecution:(BOOL)a3
{
  self->_showErrorAlertsDuringTestExecution = a3;
}

- (void)setShouldStylesAlwaysIncludePersistedSong:(BOOL)a3
{
  self->_shouldStylesAlwaysIncludePersistedSong = a3;
}

- (void)setShouldRecombineTimelineWithSameVisibleSegments:(BOOL)a3
{
  self->_shouldRecombineTimelineWithSameVisibleSegments = a3;
}

- (void)setShouldHideSidebarWhenDisplayed:(BOOL)a3
{
  self->_shouldHideSidebarWhenDisplayed = a3;
}

- (void)setSeparatorEffectsShowcaseMode:(int64_t)a3
{
  self->_separatorEffectsShowcaseMode = a3;
}

- (void)setScrubberSelectionStartsPlayback:(BOOL)a3
{
  self->_scrubberSelectionStartsPlayback = a3;
}

- (void)setScrubberLayoutStretchesSmallNumberOfAssets:(BOOL)a3
{
  self->_scrubberLayoutStretchesSmallNumberOfAssets = a3;
}

- (void)setScrubberEdgeFadeOffset:(double)a3
{
  self->_scrubberEdgeFadeOffset = a3;
}

- (void)setScrubberEdgeFadeMode:(int64_t)a3
{
  self->_scrubberEdgeFadeMode = a3;
}

- (void)setScrubberEdgeFadeDistance:(double)a3
{
  self->_scrubberEdgeFadeDistance = a3;
}

- (void)setScrubberDisplayMode:(int64_t)a3
{
  self->_scrubberDisplayMode = a3;
}

- (void)setScrubberDimsMainContent:(BOOL)a3
{
  self->_scrubberDimsMainContent = a3;
}

- (void)setScrubberAutoHideDelay:(double)a3
{
  self->_scrubberAutoHideDelay = a3;
}

- (void)setScaleRecipeRelativeFrequency:(double)a3
{
  self->_scaleRecipeRelativeFrequency = a3;
}

- (void)setReportColorNormalizationErrors:(BOOL)a3
{
  self->_reportColorNormalizationErrors = a3;
}

- (void)setRenderTitlesForRelated:(BOOL)a3
{
  self->_renderTitlesForRelated = a3;
}

- (void)setRelatedProductionPlaybackFractionCompletedThreshold:(double)a3
{
  self->_relatedProductionPlaybackFractionCompletedThreshold = a3;
}

- (void)setRelatedProducerKind:(int64_t)a3
{
  self->_relatedProducerKind = a3;
}

- (void)setRelatedAnimationDuration:(double)a3
{
  self->_relatedAnimationDuration = a3;
}

- (void)setPressedScale:(double)a3
{
  self->_pressedScale = a3;
}

- (void)setPreloadingSegmentsBatchSize:(int64_t)a3
{
  self->_preloadingSegmentsBatchSize = a3;
}

- (void)setPreloadingEstimationStrategy:(int64_t)a3
{
  self->_preloadingEstimationStrategy = a3;
}

- (void)setPreloadNonKeyRelated:(BOOL)a3
{
  self->_preloadNonKeyRelated = a3;
}

- (void)setPreferredFullsizePaperTrailOptions:(unint64_t)a3
{
  self->_preferredFullsizePaperTrailOptions = a3;
}

- (void)setPreferTopChromeItemsInAppNavigationBar:(BOOL)a3
{
  self->_preferTopChromeItemsInAppNavigationBar = a3;
}

- (void)setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:(BOOL)a3
{
  self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle = a3;
}

- (void)setPlayerShowsBufferingStatus:(BOOL)a3
{
  self->_playerShowsBufferingStatus = a3;
}

- (void)setPlayerPresentationType:(unsigned __int8)a3
{
  self->_playerPresentationType = a3;
}

- (void)setPlaybackShouldWaitForBufferingToBeReady:(BOOL)a3
{
  self->_playbackShouldWaitForBufferingToBeReady = a3;
}

- (void)setPlayButtonRewindSymbolName:(id)a3
{
}

- (void)setPersistenceConfirmationDuration:(double)a3
{
  self->_persistenceConfirmationDuration = a3;
}

- (void)setPanRecipeRelativeFrequency:(double)a3
{
  self->_panRecipeRelativeFrequency = a3;
}

- (void)setOverrideLegibilityGradientHeights:(BOOL)a3
{
  self->_overrideLegibilityGradientHeights = a3;
}

- (void)setOverrideDurations:(BOOL)a3
{
  self->_overrideDurations = a3;
}

- (void)setOtherAssetsAspectRatioOverride:(int64_t)a3
{
  self->_otherAssetsAspectRatioOverride = a3;
}

- (void)setNoncriticalBufferingTimeout:(double)a3
{
  self->_noncriticalBufferingTimeout = a3;
}

- (void)setNeeds79067616Workaround:(BOOL)a3
{
  self->_needs79067616Workaround = a3;
}

- (void)setMuteToggleButtonAutoHideDelay:(double)a3
{
  self->_muteToggleButtonAutoHideDelay = a3;
}

- (void)setMuteBackgroundMusic:(BOOL)a3
{
  self->_muteBackgroundMusic = a3;
}

- (void)setMusicTouchDuckingDelay:(double)a3
{
  self->_musicTouchDuckingDelay = a3;
}

- (void)setMusicTargetLoudnessLKFS:(float)a3
{
  self->_musicTargetLoudnessLKFS = a3;
}

- (void)setMusicSimulatedFailureMode:(int64_t)a3
{
  self->_musicSimulatedFailureMode = a3;
}

- (void)setMusicFadeOutVolume:(float)a3
{
  self->_musicFadeOutVolume = a3;
}

- (void)setMusicDuckedVolume:(float)a3
{
  self->_musicDuckedVolume = a3;
}

- (void)setMusicDemoVolumeAdjustment:(BOOL)a3
{
  self->_musicDemoVolumeAdjustment = a3;
}

- (void)setMusicBackgroundVolume:(float)a3
{
  self->_musicBackgroundVolume = a3;
}

- (void)setMovementAnimationResumeAcceleration:(double)a3
{
  self->_movementAnimationResumeAcceleration = a3;
}

- (void)setMovementAnimationPausedVelocity:(double)a3
{
  self->_movementAnimationPausedVelocity = a3;
}

- (void)setMovementAnimationPauseDeceleration:(double)a3
{
  self->_movementAnimationPauseDeceleration = a3;
}

- (void)setMovementAnimationLinearFraction:(double)a3
{
  self->_movementAnimationLinearFraction = a3;
}

- (void)setMovementAnimationCurve:(int64_t)a3
{
  self->_movementAnimationCurve = a3;
}

- (void)setMinPreloadedeSegments:(int64_t)a3
{
  self->_minPreloadedeSegments = a3;
}

- (void)setMaximumAppBackgroundDurationBeforeAutoPause:(double)a3
{
  self->_maximumAppBackgroundDurationBeforeAutoPause = a3;
}

- (void)setLoopingVideoAudioStrategy:(int64_t)a3
{
  self->_loopingVideoAudioStrategy = a3;
}

- (void)setLivePhotoSameOrientationRegularMaximumScale:(double)a3
{
  self->_livePhotoSameOrientationRegularMaximumScale = a3;
}

- (void)setLivePhotoSameOrientationCompactMaximumScale:(double)a3
{
  self->_livePhotoSameOrientationCompactMaximumScale = a3;
}

- (void)setLivePhotoOppositeOrientationRegularMaximumScale:(double)a3
{
  self->_livePhotoOppositeOrientationRegularMaximumScale = a3;
}

- (void)setLivePhotoOppositeOrientationCompactMaximumScale:(double)a3
{
  self->_livePhotoOppositeOrientationCompactMaximumScale = a3;
}

- (void)setLivePhotoLocalVideoQuality:(int64_t)a3
{
  self->_livePhotoLocalVideoQuality = a3;
}

- (void)setLivePhotoAudioStrategy:(int64_t)a3
{
  self->_livePhotoAudioStrategy = a3;
}

- (void)setLimitKeyAssetAspectRatioToFeedCard:(BOOL)a3
{
  self->_limitKeyAssetAspectRatioToFeedCard = a3;
}

- (void)setLegibilityRelatedDimming:(double)a3
{
  self->_legibilityRelatedDimming = a3;
}

- (void)setLegibilityPlaybackEndUndimmingDurationAutoReplay:(double)a3
{
  self->_legibilityPlaybackEndUndimmingDurationAutoReplay = a3;
}

- (void)setLegibilityPlaybackEndUndimmingDuration:(double)a3
{
  self->_legibilityPlaybackEndUndimmingDuration = a3;
}

- (void)setLegibilityPlaybackEndDimmingDurationAutoReplay:(double)a3
{
  self->_legibilityPlaybackEndDimmingDurationAutoReplay = a3;
}

- (void)setLegibilityPlaybackEndDimmingDuration:(double)a3
{
  self->_legibilityPlaybackEndDimmingDuration = a3;
}

- (void)setLegibilityPlaybackEndDimming:(double)a3
{
  self->_legibilityPlaybackEndDimming = a3;
}

- (void)setLegibilityGradientOpacity:(double)a3
{
  self->_legibilityGradientOpacity = a3;
}

- (void)setKeyAssetAspectRatioOverride:(int64_t)a3
{
  self->_keyAssetAspectRatioOverride = a3;
}

- (void)setKenBurnsShowcaseMode:(int64_t)a3
{
  self->_kenBurnsShowcaseMode = a3;
}

- (void)setKashidaTextMode:(int64_t)a3
{
  self->_kashidaTextMode = a3;
}

- (void)setIsHUDVisible:(BOOL)a3
{
  self->_isHUDVisible = a3;
}

- (void)setIsHUDEnabled:(BOOL)a3
{
  self->_isHUDEnabled = a3;
}

- (void)setIsExportHUDEnabled:(BOOL)a3
{
  self->_isExportHUDEnabled = a3;
}

- (void)setIsAppleMusicAllowed:(BOOL)a3
{
  self->_isAppleMusicAllowed = a3;
}

- (void)setInlinePlaybackCriticalInsetY:(double)a3
{
  self->_inlinePlaybackCriticalInsetY = a3;
}

- (void)setInlinePlaybackCriticalInsetX:(double)a3
{
  self->_inlinePlaybackCriticalInsetX = a3;
}

- (void)setIncludeImagesInVisualDiagnosticsForTTR:(BOOL)a3
{
  self->_includeImagesInVisualDiagnosticsForTTR = a3;
}

- (void)setIncludeDeviceDiagnosticsForTTR:(BOOL)a3
{
  self->_includeDeviceDiagnosticsForTTR = a3;
}

- (void)setForegroundAudioLoudnessTarget:(double)a3
{
  self->_foregroundAudioLoudnessTarget = a3;
}

- (void)setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:(BOOL)a3
{
  self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset = a3;
}

- (void)setForcePacingToSegmentMaxDuration:(BOOL)a3
{
  self->_forcePacingToSegmentMaxDuration = a3;
}

- (void)setForceMinDurationKenBurnsAnimations:(BOOL)a3
{
  self->_forceMinDurationKenBurnsAnimations = a3;
}

- (void)setForceLivePhotoVideo:(BOOL)a3
{
  self->_forceLivePhotoVideo = a3;
}

- (void)setForceFlexIncludesAppleMusic:(BOOL)a3
{
  self->_forceFlexIncludesAppleMusic = a3;
}

- (void)setForceFlexForPHMemory:(BOOL)a3
{
  self->_forceFlexForPHMemory = a3;
}

- (void)setForceFlexForNonPHMemory:(BOOL)a3
{
  self->_forceFlexForNonPHMemory = a3;
}

- (void)setFocusChangeFadeDuration:(double)a3
{
  self->_focusChangeFadeDuration = a3;
}

- (void)setFeedPresentationType:(unsigned __int8)a3
{
  self->_feedPresentationType = a3;
}

- (void)setFeedItemCornerRadius:(double)a3
{
  self->_feedItemCornerRadius = a3;
}

- (void)setFeedInitialLimit:(int64_t)a3
{
  self->_feedInitialLimit = a3;
}

- (void)setFeedHUDType:(int64_t)a3
{
  self->_feedHUDType = a3;
}

- (void)setFeedCardWideLandscapeAspectRatio:(double)a3
{
  self->_feedCardWideLandscapeAspectRatio = a3;
}

- (void)setFeedCardPortraitAspectRatio:(double)a3
{
  self->_feedCardPortraitAspectRatio = a3;
}

- (void)setFeedCardLandscapeAspectRatio:(double)a3
{
  self->_feedCardLandscapeAspectRatio = a3;
}

- (void)setExposeToBlackRecipeRelativeFrequency:(double)a3
{
  self->_exposeToBlackRecipeRelativeFrequency = a3;
}

- (void)setExportVideoQuality:(int64_t)a3
{
  self->_exportVideoQuality = a3;
}

- (void)setExportHUDType:(int64_t)a3
{
  self->_exportHUDType = a3;
}

- (void)setExaggerateResourceDownloadTimes:(BOOL)a3
{
  self->_exaggerateResourceDownloadTimes = a3;
}

- (void)setEstimatedMinimumDurationPerCuratedAsset:(double)a3
{
  self->_estimatedMinimumDurationPerCuratedAsset = a3;
}

- (void)setEstimateTimeLeftPerPlaybackStyle:(BOOL)a3
{
  self->_estimateTimeLeftPerPlaybackStyle = a3;
}

- (void)setEnableTitlePositioningLogs:(BOOL)a3
{
  self->_enableTitlePositioningLogs = a3;
}

- (void)setEnableScrubberColorNormalization:(BOOL)a3
{
  self->_enableScrubberColorNormalization = a3;
}

- (void)setEnableProtoPlayground:(BOOL)a3
{
  self->_enableProtoPlayground = a3;
}

- (void)setEnableFalseColorNormalization:(BOOL)a3
{
  self->_enableFalseColorNormalization = a3;
}

- (void)setEnableDemoAction:(BOOL)a3
{
  self->_enableDemoAction = a3;
}

- (void)setEnableColorNormalizationWithoutColorGrade:(BOOL)a3
{
  self->_enableColorNormalizationWithoutColorGrade = a3;
}

- (void)setEnableBrowseViewColorNormalization:(BOOL)a3
{
  self->_enableBrowseViewColorNormalization = a3;
}

- (void)setDuckingFadeDuration:(double)a3
{
  self->_duckingFadeDuration = a3;
}

- (void)setDisabledClipMotionStyles:(unint64_t)a3
{
  self->_disabledClipMotionStyles = a3;
}

- (void)setDisableVideoPlayback:(BOOL)a3
{
  self->_disableVideoPlayback = a3;
}

- (void)setDisableShowcaseBadge:(BOOL)a3
{
  self->_disableShowcaseBadge = a3;
}

- (void)setDisableColorGrading:(BOOL)a3
{
  self->_disableColorGrading = a3;
}

- (void)setDetectVideoLags:(BOOL)a3
{
  self->_detectVideoLags = a3;
}

- (void)setDefaultHUDType:(int64_t)a3
{
  self->_defaultHUDType = a3;
}

- (void)setDebugShowVideoPlaybackDetails:(BOOL)a3
{
  self->_debugShowVideoPlaybackDetails = a3;
}

- (void)setDebugShowColorNormalizationValues:(BOOL)a3
{
  self->_debugShowColorNormalizationValues = a3;
}

- (void)setDebugShowAudioPlaybackDetails:(BOOL)a3
{
  self->_debugShowAudioPlaybackDetails = a3;
}

- (void)setCurrentPPTSubpreset:(unint64_t)a3
{
  self->_currentPPTSubpreset = a3;
}

- (void)setCurrentPPTPreset:(unint64_t)a3
{
  self->_currentPPTPreset = a3;
}

- (void)setCurrentFeedPPTPreset:(unint64_t)a3
{
  self->_currentFeedPPTPreset = a3;
}

- (void)setCurationScorePercentileThreshold:(double)a3
{
  self->_curationScorePercentileThreshold = a3;
}

- (void)setCuratedAssetsLimit:(int64_t)a3
{
  self->_curatedAssetsLimit = a3;
}

- (void)setContinuousKenBurnsAnimationsTolerance:(double)a3
{
  self->_continuousKenBurnsAnimationsTolerance = a3;
}

- (void)setColorNormalizationUseColorCube:(BOOL)a3
{
  self->_colorNormalizationUseColorCube = a3;
}

- (void)setColorNormalizationTechnique:(int64_t)a3
{
  self->_colorNormalizationTechnique = a3;
}

- (void)setColorNormalizationMode:(int64_t)a3
{
  self->_colorNormalizationMode = a3;
}

- (void)setColorNormalizationIntensity:(float)a3
{
  self->_colorNormalizationIntensity = a3;
}

- (void)setColorNormalizationCubeEdgeSize:(int64_t)a3
{
  self->_colorNormalizationCubeEdgeSize = a3;
}

- (void)setColorGradeSmoothingPasses:(int64_t)a3
{
  self->_colorGradeSmoothingPasses = a3;
}

- (void)setColorGradeSmoothingFactor:(float)a3
{
  self->_colorGradeSmoothingFactor = a3;
}

- (void)setColorGradeEditorPreviewMode:(int64_t)a3
{
  self->_colorGradeEditorPreviewMode = a3;
}

- (void)setColorGradeBlendingFactor:(float)a3
{
  self->_colorGradeBlendingFactor = a3;
}

- (void)setClipCompositionShowcaseMode:(int64_t)a3
{
  self->_clipCompositionShowcaseMode = a3;
}

- (void)setClipCompositionFallback:(id)a3
{
}

- (void)setChromeAutoHideDelay:(double)a3
{
  self->_chromeAutoHideDelay = a3;
}

- (void)setChromeAllowAutoHide:(BOOL)a3
{
  self->_chromeAllowAutoHide = a3;
}

- (void)setBufferingHUDAutoPresentationTimeout:(double)a3
{
  self->_bufferingHUDAutoPresentationTimeout = a3;
}

- (void)setBottomLegibilityGradientHeight:(double)a3
{
  self->_bottomLegibilityGradientHeight = a3;
}

- (void)setBackgroundQualityScale:(double)a3
{
  self->_backgroundQualityScale = a3;
}

- (void)setBackgroundAudioLoudnessTarget:(double)a3
{
  self->_backgroundAudioLoudnessTarget = a3;
}

- (void)setAutoEditUseMomentRecipes:(BOOL)a3
{
  self->_autoEditUseMomentRecipes = a3;
}

- (void)setAutoEditTriptychCropAspectMax:(double)a3
{
  self->_autoEditTriptychCropAspectMax = a3;
}

- (void)setAutoEditSongPaceOverride:(int64_t)a3
{
  self->_autoEditSongPaceOverride = a3;
}

- (void)setAutoEditSceneConfidenceThreshold:(double)a3
{
  self->_autoEditSceneConfidenceThreshold = a3;
}

- (void)setAutoEditRotateMotionMax:(int64_t)a3
{
  self->_autoEditRotateMotionMax = a3;
}

- (void)setAutoEditProductionSimulatedDelay:(double)a3
{
  self->_autoEditProductionSimulatedDelay = a3;
}

- (void)setAutoEditPortraitAspectLargeVerticalFaceAreaMin:(double)a3
{
  self->_autoEditPortraitAspectLargeVerticalFaceAreaMin = a3;
}

- (void)setAutoEditPortraitAreaMin:(double)a3
{
  self->_autoEditPortraitAreaMin = a3;
}

- (void)setAutoEditModuleLengthMax:(int64_t)a3
{
  self->_autoEditModuleLengthMax = a3;
}

- (void)setAutoEditHighCurationScoreThreshold:(double)a3
{
  self->_autoEditHighCurationScoreThreshold = a3;
}

- (void)setAutoEditEmptySpaceLengthMax:(int64_t)a3
{
  self->_autoEditEmptySpaceLengthMax = a3;
}

- (void)setAutoEditDoublePlaceMultiplier:(double)a3
{
  self->_autoEditDoublePlaceMultiplier = a3;
}

- (void)setAutoEditDisableNUp:(BOOL)a3
{
  self->_autoEditDisableNUp = a3;
}

- (void)setAutoEditDiptychCropAspectMax:(double)a3
{
  self->_autoEditDiptychCropAspectMax = a3;
}

- (void)setAudioQualityMin:(float)a3
{
  self->_audioQualityMin = a3;
}

- (void)setAudioLCutStrategy:(int64_t)a3
{
  self->_audioLCutStrategy = a3;
}

- (void)setAudioLCutDuration:(double)a3
{
  self->_audioLCutDuration = a3;
}

- (void)setAudioJCutStrategy:(int64_t)a3
{
  self->_audioJCutStrategy = a3;
}

- (void)setAudioJCutDuration:(double)a3
{
  self->_audioJCutDuration = a3;
}

- (void)setAudioFadeMinDuration:(double)a3
{
  self->_audioFadeMinDuration = a3;
}

- (void)setAudioFadeMaxDuration:(double)a3
{
  self->_audioFadeMaxDuration = a3;
}

- (void)setAudioFadeCurve:(int64_t)a3
{
  self->_audioFadeCurve = a3;
}

- (void)setAspectFillOneUpCropTolerance:(double)a3
{
  self->_aspectFillOneUpCropTolerance = a3;
}

- (void)setAreRelatedHUDsVisible:(BOOL)a3
{
  self->_areRelatedHUDsVisible = a3;
}

- (void)setAppleMusicPromptTrigger:(int64_t)a3
{
  self->_appleMusicPromptTrigger = a3;
}

- (void)setAllowsTimelineRecombination:(BOOL)a3
{
  self->_allowsTimelineRecombination = a3;
}

- (void)setAllowsShowcase:(BOOL)a3
{
  self->_allowsShowcase = a3;
}

- (void)setAllowsNUpBackground:(BOOL)a3
{
  self->_allowsNUpBackground = a3;
}

- (void)setAllowsFormSheetPresentation:(BOOL)a3
{
  self->_allowsFormSheetPresentation = a3;
}

- (void)setAllowsContinuousKenBurnsAnimations:(BOOL)a3
{
  self->_allowsContinuousKenBurnsAnimations = a3;
}

- (void)setAllowRelatedProductionBeforeReadyToPlay:(BOOL)a3
{
  self->_allowRelatedProductionBeforeReadyToPlay = a3;
}

- (void)setAllowOnDemandVideoAnalysis:(BOOL)a3
{
  self->_allowOnDemandVideoAnalysis = a3;
}

- (void)setAllowNonFillingCompositionsForKeyAsset:(BOOL)a3
{
  self->_allowNonFillingCompositionsForKeyAsset = a3;
}

- (void)setAllowLimitingImagesTo3MP:(BOOL)a3
{
  self->_allowLimitingImagesTo3MP = a3;
}

- (void)setAllowCustomUserAssets:(BOOL)a3
{
  self->_allowCustomUserAssets = a3;
}

- (void)setAllowAspectModeToggle:(BOOL)a3
{
  self->_allowAspectModeToggle = a3;
}

- (void)setAestheticsScorePercentileThreshold:(double)a3
{
  self->_aestheticsScorePercentileThreshold = a3;
}

- (void)setAdjustToWallClockTime:(BOOL)a3
{
  self->_adjustToWallClockTime = a3;
}

void __33__PXStorySettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 storySettings];
  v1 = (void *)sharedInstance_sharedInstance_54485;
  sharedInstance_sharedInstance_54485 = v0;
}

- (int64_t)verticalTextMode
{
  return self->_verticalTextMode;
}

- (int64_t)kashidaTextMode
{
  return self->_kashidaTextMode;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_54483 != -1) {
    dispatch_once(&sharedInstance_onceToken_54483, &__block_literal_global_54484);
  }
  id v2 = (void *)sharedInstance_sharedInstance_54485;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterSettings, 0);
  objc_storeStrong((id *)&self->_playButtonRewindSymbolName, 0);
  objc_storeStrong((id *)&self->_scrubberLayoutSettings, 0);
  objc_storeStrong((id *)&self->_transitionsSettings, 0);
  objc_storeStrong((id *)&self->_concreteTimelineSettings, 0);
  objc_storeStrong((id *)&self->_multipartPanoramaSettings, 0);
  objc_storeStrong((id *)&self->_clipCompositionFallback, 0);
}

- (BOOL)useCommonActionInfrastructureForActionMenu
{
  return self->_useCommonActionInfrastructureForActionMenu;
}

- (double)aestheticsScorePercentileThreshold
{
  return self->_aestheticsScorePercentileThreshold;
}

- (double)curationScorePercentileThreshold
{
  return self->_curationScorePercentileThreshold;
}

- (BOOL)showTVPreviewInDiagnostics
{
  return self->_showTVPreviewInDiagnostics;
}

- (void)setChapterSettings:(id)a3
{
}

- (PXStoryChapterSettings)chapterSettings
{
  return self->_chapterSettings;
}

- (BOOL)simulateSlowTextLayout
{
  return self->_simulateSlowTextLayout;
}

- (int64_t)titleMaximumNumberOfLines
{
  return self->_titleMaximumNumberOfLines;
}

- (BOOL)enableTitlePositioningLogs
{
  return self->_enableTitlePositioningLogs;
}

- (double)titleFarthestDistanceThreshold
{
  return self->_titleFarthestDistanceThreshold;
}

- (BOOL)titleUseCenterAlignment
{
  return self->_titleUseCenterAlignment;
}

- (double)subtitleMinimumScale
{
  return self->_subtitleMinimumScale;
}

- (double)titleMinimumScale
{
  return self->_titleMinimumScale;
}

- (double)subtitleSizeScale
{
  return self->_subtitleSizeScale;
}

- (double)titleSizeScale
{
  return self->_titleSizeScale;
}

- (double)titleWidthMax
{
  return self->_titleWidthMax;
}

- (double)titleWidthMin
{
  return self->_titleWidthMin;
}

- (double)titlePaddingTopScale
{
  return self->_titlePaddingTopScale;
}

- (double)titleRegularPaddingBottomScale
{
  return self->_titleRegularPaddingBottomScale;
}

- (double)titleFullScreenLandscapeWidthScale
{
  return self->_titleFullScreenLandscapeWidthScale;
}

- (double)titleFullScreenPortraitWidthScale
{
  return self->_titleFullScreenPortraitWidthScale;
}

- (double)titleFeedLandscapeWidthScale
{
  return self->_titleFeedLandscapeWidthScale;
}

- (double)titleFeedPortraitWidthScale
{
  return self->_titleFeedPortraitWidthScale;
}

- (double)titleReferenceWidthLandscape
{
  return self->_titleReferenceWidthLandscape;
}

- (double)titleReferenceWidthPortrait
{
  return self->_titleReferenceWidthPortrait;
}

- (BOOL)useReferenceWidthBasedTitleLayout
{
  return self->_useReferenceWidthBasedTitleLayout;
}

- (double)autoEditDoublePlaceMultiplier
{
  return self->_autoEditDoublePlaceMultiplier;
}

- (double)autoEditHighCurationScoreThreshold
{
  return self->_autoEditHighCurationScoreThreshold;
}

- (double)autoEditSceneConfidenceThreshold
{
  return self->_autoEditSceneConfidenceThreshold;
}

- (double)exposeToBlackRecipeRelativeFrequency
{
  return self->_exposeToBlackRecipeRelativeFrequency;
}

- (double)panRecipeRelativeFrequency
{
  return self->_panRecipeRelativeFrequency;
}

- (double)scaleRecipeRelativeFrequency
{
  return self->_scaleRecipeRelativeFrequency;
}

- (BOOL)autoEditUseMomentRecipes
{
  return self->_autoEditUseMomentRecipes;
}

- (int64_t)autoEditSongPaceOverride
{
  return self->_autoEditSongPaceOverride;
}

- (unint64_t)disabledClipMotionStyles
{
  return self->_disabledClipMotionStyles;
}

- (BOOL)autoEditDisableNUp
{
  return self->_autoEditDisableNUp;
}

- (double)autoEditProductionSimulatedDelay
{
  return self->_autoEditProductionSimulatedDelay;
}

- (int64_t)autoEditEmptySpaceLengthMax
{
  return self->_autoEditEmptySpaceLengthMax;
}

- (int64_t)autoEditRotateMotionMax
{
  return self->_autoEditRotateMotionMax;
}

- (int64_t)autoEditModuleLengthMax
{
  return self->_autoEditModuleLengthMax;
}

- (double)autoEditPortraitAspectLargeVerticalFaceAreaMin
{
  return self->_autoEditPortraitAspectLargeVerticalFaceAreaMin;
}

- (double)autoEditPortraitAreaMin
{
  return self->_autoEditPortraitAreaMin;
}

- (double)autoEditTriptychCropAspectMax
{
  return self->_autoEditTriptychCropAspectMax;
}

- (double)autoEditDiptychCropAspectMax
{
  return self->_autoEditDiptychCropAspectMax;
}

- (BOOL)needs79067616Workaround
{
  return self->_needs79067616Workaround;
}

- (double)swipeDownThresholdFadeDuration
{
  return self->_swipeDownThresholdFadeDuration;
}

- (double)swipeDownDismissalDelay
{
  return self->_swipeDownDismissalDelay;
}

- (double)swipeDownSignificantDuration
{
  return self->_swipeDownSignificantDuration;
}

- (double)swipeDownDismissalDistanceThreshold
{
  return self->_swipeDownDismissalDistanceThreshold;
}

- (int64_t)swipeDownBehavior
{
  return self->_swipeDownBehavior;
}

- (BOOL)allowsFormSheetPresentation
{
  return self->_allowsFormSheetPresentation;
}

- (BOOL)wantsFeedItemShadow
{
  return self->_wantsFeedItemShadow;
}

- (BOOL)useFeedPlaceholderItems
{
  return self->_useFeedPlaceholderItems;
}

- (BOOL)useSimpleOverlayFeedLayout
{
  return self->_useSimpleOverlayFeedLayout;
}

- (double)feedItemCornerRadius
{
  return self->_feedItemCornerRadius;
}

- (double)feedCardWideLandscapeAspectRatio
{
  return self->_feedCardWideLandscapeAspectRatio;
}

- (double)feedCardPortraitAspectRatio
{
  return self->_feedCardPortraitAspectRatio;
}

- (double)feedCardLandscapeAspectRatio
{
  return self->_feedCardLandscapeAspectRatio;
}

- (int64_t)feedInitialLimit
{
  return self->_feedInitialLimit;
}

- (double)pressedScale
{
  return self->_pressedScale;
}

- (double)inlinePlaybackCriticalInsetY
{
  return self->_inlinePlaybackCriticalInsetY;
}

- (double)inlinePlaybackCriticalInsetX
{
  return self->_inlinePlaybackCriticalInsetX;
}

- (BOOL)wantsInlinePlayback
{
  return self->_wantsInlinePlayback;
}

- (BOOL)showFeedChromeOnHover
{
  return self->_showFeedChromeOnHover;
}

- (BOOL)wantsFullscreenFeedExperience
{
  return self->_wantsFullscreenFeedExperience;
}

- (BOOL)reportColorNormalizationErrors
{
  return self->_reportColorNormalizationErrors;
}

- (float)colorNormalizationIntensity
{
  return self->_colorNormalizationIntensity;
}

- (BOOL)enableColorNormalizationWithoutColorGrade
{
  return self->_enableColorNormalizationWithoutColorGrade;
}

- (BOOL)enableScrubberColorNormalization
{
  return self->_enableScrubberColorNormalization;
}

- (BOOL)enableBrowseViewColorNormalization
{
  return self->_enableBrowseViewColorNormalization;
}

- (int64_t)colorNormalizationCubeEdgeSize
{
  return self->_colorNormalizationCubeEdgeSize;
}

- (BOOL)colorNormalizationUseColorCube
{
  return self->_colorNormalizationUseColorCube;
}

- (BOOL)enableFalseColorNormalization
{
  return self->_enableFalseColorNormalization;
}

- (BOOL)debugShowColorNormalizationValues
{
  return self->_debugShowColorNormalizationValues;
}

- (int64_t)colorNormalizationTechnique
{
  return self->_colorNormalizationTechnique;
}

- (int64_t)colorNormalizationMode
{
  return self->_colorNormalizationMode;
}

- (float)colorGradeBlendingFactor
{
  return self->_colorGradeBlendingFactor;
}

- (int64_t)colorGradeSmoothingPasses
{
  return self->_colorGradeSmoothingPasses;
}

- (float)colorGradeSmoothingFactor
{
  return self->_colorGradeSmoothingFactor;
}

- (int64_t)colorGradeEditorPreviewMode
{
  return self->_colorGradeEditorPreviewMode;
}

- (BOOL)disableColorGrading
{
  return self->_disableColorGrading;
}

- (BOOL)showMusicAndColorGradeEditor
{
  return self->_showMusicAndColorGradeEditor;
}

- (BOOL)showErrorAlertsDuringTestExecution
{
  return self->_showErrorAlertsDuringTestExecution;
}

- (unint64_t)currentFeedPPTPreset
{
  return self->_currentFeedPPTPreset;
}

- (unint64_t)currentPPTSubpreset
{
  return self->_currentPPTSubpreset;
}

- (unint64_t)currentPPTPreset
{
  return self->_currentPPTPreset;
}

- (double)movementAnimationResumeAcceleration
{
  return self->_movementAnimationResumeAcceleration;
}

- (double)movementAnimationPausedVelocity
{
  return self->_movementAnimationPausedVelocity;
}

- (double)movementAnimationPauseDeceleration
{
  return self->_movementAnimationPauseDeceleration;
}

- (double)movementAnimationLinearFraction
{
  return self->_movementAnimationLinearFraction;
}

- (int64_t)movementAnimationCurve
{
  return self->_movementAnimationCurve;
}

- (double)backgroundQualityScale
{
  return self->_backgroundQualityScale;
}

- (BOOL)allowsNUpBackground
{
  return self->_allowsNUpBackground;
}

- (double)smartGradientEdgeStretchFactor
{
  return self->_smartGradientEdgeStretchFactor;
}

- (BOOL)smartGradientRepeatEdges
{
  return self->_smartGradientRepeatEdges;
}

- (double)smartGradientExposureValue
{
  return self->_smartGradientExposureValue;
}

- (double)smartGradientBlurRadius
{
  return self->_smartGradientBlurRadius;
}

- (BOOL)smartGradientUseSimpleBlur
{
  return self->_smartGradientUseSimpleBlur;
}

- (BOOL)smartGradientUseSmartColor
{
  return self->_smartGradientUseSmartColor;
}

- (BOOL)smartGradientEnabled
{
  return self->_smartGradientEnabled;
}

- (double)relatedAnimationDuration
{
  return self->_relatedAnimationDuration;
}

- (BOOL)wantsRelatedCountdown
{
  return self->_wantsRelatedCountdown;
}

- (BOOL)allowRelatedProductionBeforeReadyToPlay
{
  return self->_allowRelatedProductionBeforeReadyToPlay;
}

- (double)relatedProductionPlaybackFractionCompletedThreshold
{
  return self->_relatedProductionPlaybackFractionCompletedThreshold;
}

- (int64_t)relatedProducerKind
{
  return self->_relatedProducerKind;
}

- (double)tapNavigationAreaFraction
{
  return self->_tapNavigationAreaFraction;
}

- (BOOL)preferTopChromeItemsInAppNavigationBar
{
  return self->_preferTopChromeItemsInAppNavigationBar;
}

- (BOOL)simulateLongChromeStrings
{
  return self->_simulateLongChromeStrings;
}

- (NSString)playButtonRewindSymbolName
{
  return self->_playButtonRewindSymbolName;
}

- (double)legibilityPlaybackEndUndimmingDurationAutoReplay
{
  return self->_legibilityPlaybackEndUndimmingDurationAutoReplay;
}

- (double)legibilityPlaybackEndUndimmingDuration
{
  return self->_legibilityPlaybackEndUndimmingDuration;
}

- (double)legibilityPlaybackEndDimmingDurationAutoReplay
{
  return self->_legibilityPlaybackEndDimmingDurationAutoReplay;
}

- (double)legibilityPlaybackEndDimmingDuration
{
  return self->_legibilityPlaybackEndDimmingDuration;
}

- (double)legibilityPlaybackEndDimming
{
  return self->_legibilityPlaybackEndDimming;
}

- (double)legibilityRelatedDimming
{
  return self->_legibilityRelatedDimming;
}

- (BOOL)useBottomLegibilityGradientForBufferingIndicator
{
  return self->_useBottomLegibilityGradientForBufferingIndicator;
}

- (double)bottomLegibilityGradientHeight
{
  return self->_bottomLegibilityGradientHeight;
}

- (double)topLegibilityGradientHeight
{
  return self->_topLegibilityGradientHeight;
}

- (BOOL)overrideLegibilityGradientHeights
{
  return self->_overrideLegibilityGradientHeights;
}

- (double)legibilityGradientOpacity
{
  return self->_legibilityGradientOpacity;
}

- (double)chromeAutoHideDelay
{
  return self->_chromeAutoHideDelay;
}

- (BOOL)chromeAllowAutoHide
{
  return self->_chromeAllowAutoHide;
}

- (BOOL)scrubberSelectionStartsPlayback
{
  return self->_scrubberSelectionStartsPlayback;
}

- (BOOL)scrubberLayoutStretchesSmallNumberOfAssets
{
  return self->_scrubberLayoutStretchesSmallNumberOfAssets;
}

- (void)setScrubberLayoutSettings:(id)a3
{
}

- (PXStoryScrubberLayoutSettings)scrubberLayoutSettings
{
  return self->_scrubberLayoutSettings;
}

- (double)scrubberAutoHideDelay
{
  return self->_scrubberAutoHideDelay;
}

- (double)scrubberEdgeFadeOffset
{
  return self->_scrubberEdgeFadeOffset;
}

- (double)scrubberEdgeFadeDistance
{
  return self->_scrubberEdgeFadeDistance;
}

- (int64_t)scrubberEdgeFadeMode
{
  return self->_scrubberEdgeFadeMode;
}

- (BOOL)scrubberDimsMainContent
{
  return self->_scrubberDimsMainContent;
}

- (int64_t)scrubberDisplayMode
{
  return self->_scrubberDisplayMode;
}

- (BOOL)estimateTimeLeftPerPlaybackStyle
{
  return self->_estimateTimeLeftPerPlaybackStyle;
}

- (BOOL)preloadNonKeyRelated
{
  return self->_preloadNonKeyRelated;
}

- (int64_t)minPreloadedeSegments
{
  return self->_minPreloadedeSegments;
}

- (int64_t)preloadingEstimationStrategy
{
  return self->_preloadingEstimationStrategy;
}

- (int64_t)preloadingSegmentsBatchSize
{
  return self->_preloadingSegmentsBatchSize;
}

- (int64_t)simultaneousPreloadingOperationsCount
{
  return self->_simultaneousPreloadingOperationsCount;
}

- (BOOL)playbackShouldWaitForBufferingToBeReady
{
  return self->_playbackShouldWaitForBufferingToBeReady;
}

- (BOOL)exaggerateResourceDownloadTimes
{
  return self->_exaggerateResourceDownloadTimes;
}

- (double)simulatedSlowResourcesBufferingDelay
{
  return self->_simulatedSlowResourcesBufferingDelay;
}

- (BOOL)simulateSlowResourcesBuffering
{
  return self->_simulateSlowResourcesBuffering;
}

- (BOOL)simulateResourcesBufferingError
{
  return self->_simulateResourcesBufferingError;
}

- (BOOL)playerShowsBufferingStatus
{
  return self->_playerShowsBufferingStatus;
}

- (double)bufferingHUDAutoPresentationTimeout
{
  return self->_bufferingHUDAutoPresentationTimeout;
}

- (double)noncriticalBufferingTimeout
{
  return self->_noncriticalBufferingTimeout;
}

- (BOOL)wantsBufferingIndicatorOverScrubber
{
  return self->_wantsBufferingIndicatorOverScrubber;
}

- (float)audioQualityMin
{
  return self->_audioQualityMin;
}

- (double)simulatedAudioCuesLoadingDelay
{
  return self->_simulatedAudioCuesLoadingDelay;
}

- (BOOL)debugShowAudioPlaybackDetails
{
  return self->_debugShowAudioPlaybackDetails;
}

- (double)audioLCutDuration
{
  return self->_audioLCutDuration;
}

- (double)audioJCutDuration
{
  return self->_audioJCutDuration;
}

- (int64_t)audioLCutStrategy
{
  return self->_audioLCutStrategy;
}

- (int64_t)audioJCutStrategy
{
  return self->_audioJCutStrategy;
}

- (BOOL)wantsAudioJLCuts
{
  return self->_wantsAudioJLCuts;
}

- (int64_t)audioFadeCurve
{
  return self->_audioFadeCurve;
}

- (double)audioFadeMinDuration
{
  return self->_audioFadeMinDuration;
}

- (double)audioFadeMaxDuration
{
  return self->_audioFadeMaxDuration;
}

- (BOOL)wantsAudioFade
{
  return self->_wantsAudioFade;
}

- (int64_t)slomoVideoAudioStrategy
{
  return self->_slomoVideoAudioStrategy;
}

- (int64_t)loopingVideoAudioStrategy
{
  return self->_loopingVideoAudioStrategy;
}

- (int64_t)livePhotoAudioStrategy
{
  return self->_livePhotoAudioStrategy;
}

- (int64_t)videoAudioStrategy
{
  return self->_videoAudioStrategy;
}

- (double)backgroundAudioLoudnessTarget
{
  return self->_backgroundAudioLoudnessTarget;
}

- (double)foregroundAudioLoudnessTarget
{
  return self->_foregroundAudioLoudnessTarget;
}

- (BOOL)muteBackgroundMusic
{
  return self->_muteBackgroundMusic;
}

- (BOOL)wantsAudioFromVideo
{
  return self->_wantsAudioFromVideo;
}

- (double)muteToggleButtonAutoHideDelay
{
  return self->_muteToggleButtonAutoHideDelay;
}

- (double)significantPlayedDuration
{
  return self->_significantPlayedDuration;
}

- (BOOL)detectVideoLags
{
  return self->_detectVideoLags;
}

- (int64_t)exportVideoQuality
{
  return self->_exportVideoQuality;
}

- (int64_t)videoQuality
{
  return self->_videoQuality;
}

- (int64_t)livePhotoLocalVideoQuality
{
  return self->_livePhotoLocalVideoQuality;
}

- (double)videoMaximumAspectFillScale
{
  return self->_videoMaximumAspectFillScale;
}

- (BOOL)debugShowVideoPlaybackDetails
{
  return self->_debugShowVideoPlaybackDetails;
}

- (BOOL)videoInlineStabilization
{
  return self->_videoInlineStabilization;
}

- (BOOL)allowOnDemandVideoAnalysis
{
  return self->_allowOnDemandVideoAnalysis;
}

- (BOOL)useBestHighlightTrim
{
  return self->_useBestHighlightTrim;
}

- (BOOL)wantsMovieHighlights
{
  return self->_wantsMovieHighlights;
}

- (BOOL)forceLivePhotoVideo
{
  return self->_forceLivePhotoVideo;
}

- (BOOL)disableVideoPlayback
{
  return self->_disableVideoPlayback;
}

- (BOOL)forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset
{
  return self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset;
}

- (BOOL)forceMinDurationKenBurnsAnimations
{
  return self->_forceMinDurationKenBurnsAnimations;
}

- (double)continuousKenBurnsAnimationsTolerance
{
  return self->_continuousKenBurnsAnimationsTolerance;
}

- (BOOL)allowsContinuousKenBurnsAnimations
{
  return self->_allowsContinuousKenBurnsAnimations;
}

- (BOOL)forceFlexIncludesAppleMusic
{
  return self->_forceFlexIncludesAppleMusic;
}

- (BOOL)forceFlexForPHMemory
{
  return self->_forceFlexForPHMemory;
}

- (BOOL)forceFlexForNonPHMemory
{
  return self->_forceFlexForNonPHMemory;
}

- (int64_t)musicSimulatedFailureMode
{
  return self->_musicSimulatedFailureMode;
}

- (BOOL)simulateNoAppleMusicSubscription
{
  return self->_simulateNoAppleMusicSubscription;
}

- (BOOL)isAppleMusicAllowed
{
  return self->_isAppleMusicAllowed;
}

- (int64_t)songsProducerKind
{
  return self->_songsProducerKind;
}

- (BOOL)useFakeAppleMusicAndPrivacyPrompt
{
  return self->_useFakeAppleMusicAndPrivacyPrompt;
}

- (int64_t)appleMusicPromptTrigger
{
  return self->_appleMusicPromptTrigger;
}

- (double)musicTouchDuckingDelay
{
  return self->_musicTouchDuckingDelay;
}

- (double)focusChangeFadeDuration
{
  return self->_focusChangeFadeDuration;
}

- (double)duckingFadeDuration
{
  return self->_duckingFadeDuration;
}

- (float)musicTargetLoudnessLKFS
{
  return self->_musicTargetLoudnessLKFS;
}

- (BOOL)musicDemoVolumeAdjustment
{
  return self->_musicDemoVolumeAdjustment;
}

- (float)musicFadeOutVolume
{
  return self->_musicFadeOutVolume;
}

- (float)musicBackgroundVolume
{
  return self->_musicBackgroundVolume;
}

- (float)musicDuckedVolume
{
  return self->_musicDuckedVolume;
}

- (BOOL)adjustToWallClockTime
{
  return self->_adjustToWallClockTime;
}

- (BOOL)forcePacingToSegmentMaxDuration
{
  return self->_forcePacingToSegmentMaxDuration;
}

- (BOOL)useMusicCuesForPacing
{
  return self->_useMusicCuesForPacing;
}

- (BOOL)shouldStylesAlwaysIncludePersistedSong
{
  return self->_shouldStylesAlwaysIncludePersistedSong;
}

- (void)setUseVerboseStyleHUDText:(BOOL)a3
{
  self->_useVerboseStyleHUDText = a3;
}

- (BOOL)useVerboseStyleHUDText
{
  return self->_useVerboseStyleHUDText;
}

- (void)setShouldPauseInStyleSwitcher:(BOOL)a3
{
  self->_shouldPauseInStyleSwitcher = a3;
}

- (BOOL)shouldPauseInStyleSwitcher
{
  return self->_shouldPauseInStyleSwitcher;
}

- (BOOL)showStyleSwitcher
{
  return self->_showStyleSwitcher;
}

- (void)setTransitionsSettings:(id)a3
{
}

- (PXStoryTransitionsSettings)transitionsSettings
{
  return self->_transitionsSettings;
}

- (int64_t)curatedAssetsLimit
{
  return self->_curatedAssetsLimit;
}

- (double)estimatedMinimumDurationPerCuratedAsset
{
  return self->_estimatedMinimumDurationPerCuratedAsset;
}

- (int64_t)timelineManagerPaperTrailLength
{
  return self->_timelineManagerPaperTrailLength;
}

- (BOOL)validationShouldWaitForTimelineToBeReadyToPlay
{
  return self->_validationShouldWaitForTimelineToBeReadyToPlay;
}

- (void)setConcreteTimelineSettings:(id)a3
{
}

- (PXStoryConcreteTimelineSettings)concreteTimelineSettings
{
  return self->_concreteTimelineSettings;
}

- (void)setMultipartPanoramaSettings:(id)a3
{
}

- (PXStoryMultipartPanoramaSettings)multipartPanoramaSettings
{
  return self->_multipartPanoramaSettings;
}

- (BOOL)shouldRecombineTimelineWithSameVisibleSegments
{
  return self->_shouldRecombineTimelineWithSameVisibleSegments;
}

- (BOOL)allowsTimelineRecombination
{
  return self->_allowsTimelineRecombination;
}

- (double)livePhotoOppositeOrientationRegularMaximumScale
{
  return self->_livePhotoOppositeOrientationRegularMaximumScale;
}

- (double)livePhotoOppositeOrientationCompactMaximumScale
{
  return self->_livePhotoOppositeOrientationCompactMaximumScale;
}

- (double)livePhotoSameOrientationRegularMaximumScale
{
  return self->_livePhotoSameOrientationRegularMaximumScale;
}

- (double)livePhotoSameOrientationCompactMaximumScale
{
  return self->_livePhotoSameOrientationCompactMaximumScale;
}

- (double)aspectFillOneUpCropTolerance
{
  return self->_aspectFillOneUpCropTolerance;
}

- (int64_t)otherAssetsAspectRatioOverride
{
  return self->_otherAssetsAspectRatioOverride;
}

- (int64_t)keyAssetAspectRatioOverride
{
  return self->_keyAssetAspectRatioOverride;
}

- (BOOL)limitKeyAssetAspectRatioToFeedCard
{
  return self->_limitKeyAssetAspectRatioToFeedCard;
}

- (BOOL)allowNonFillingCompositionsForKeyAsset
{
  return self->_allowNonFillingCompositionsForKeyAsset;
}

- (int64_t)timelineProducerKind
{
  return self->_timelineProducerKind;
}

- (BOOL)shouldHideSidebarWhenDisplayed
{
  return self->_shouldHideSidebarWhenDisplayed;
}

- (BOOL)preferAssetLocationAndCreationDateForClipTitleAndSubtitle
{
  return self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle;
}

- (BOOL)allowCustomUserAssets
{
  return self->_allowCustomUserAssets;
}

- (unsigned)feedPresentationType
{
  return self->_feedPresentationType;
}

- (unsigned)playerPresentationType
{
  return self->_playerPresentationType;
}

- (double)maximumAppBackgroundDurationBeforeAutoPause
{
  return self->_maximumAppBackgroundDurationBeforeAutoPause;
}

- (BOOL)renderTitlesForRelated
{
  return self->_renderTitlesForRelated;
}

- (double)viewModeTransitionAccessoryFadepoint
{
  return self->_viewModeTransitionAccessoryFadepoint;
}

- (double)viewModeTransitionSpringStiffness
{
  return self->_viewModeTransitionSpringStiffness;
}

- (int64_t)swipeDownAction
{
  return self->_swipeDownAction;
}

- (int64_t)twoFingerTapAction
{
  return self->_twoFingerTapAction;
}

- (unint64_t)preferredFullsizePaperTrailOptions
{
  return self->_preferredFullsizePaperTrailOptions;
}

- (BOOL)enableProtoPlayground
{
  return self->_enableProtoPlayground;
}

- (BOOL)enableDemoAction
{
  return self->_enableDemoAction;
}

- (int64_t)feedHUDType
{
  return self->_feedHUDType;
}

- (void)setIsFeedHUDVisible:(BOOL)a3
{
  self->_isFeedHUDVisible = a3;
}

- (BOOL)isFeedHUDVisible
{
  return self->_isFeedHUDVisible;
}

- (int64_t)exportHUDType
{
  return self->_exportHUDType;
}

- (BOOL)isExportHUDEnabled
{
  return self->_isExportHUDEnabled;
}

- (int64_t)defaultHUDType
{
  return self->_defaultHUDType;
}

- (BOOL)areRelatedHUDsVisible
{
  return self->_areRelatedHUDsVisible;
}

- (BOOL)isHUDVisible
{
  return self->_isHUDVisible;
}

- (BOOL)isHUDEnabled
{
  return self->_isHUDEnabled;
}

- (BOOL)wantsValidation
{
  return self->_wantsValidation;
}

- (BOOL)wantsHighContrastColors
{
  return self->_wantsHighContrastColors;
}

- (BOOL)wantsTransitions
{
  return self->_wantsTransitions;
}

- (BOOL)wantsAnimations
{
  return self->_wantsAnimations;
}

- (double)persistenceConfirmationDuration
{
  return self->_persistenceConfirmationDuration;
}

- (BOOL)wantsPersistence
{
  return self->_wantsPersistence;
}

- (BOOL)wantsGridLayout
{
  return self->_wantsGridLayout;
}

- (BOOL)wantsScrubber
{
  return self->_wantsScrubber;
}

- (BOOL)wantsResourcesPreloading
{
  return self->_wantsResourcesPreloading;
}

- (BOOL)wantsRelated
{
  return self->_wantsRelated;
}

- (BOOL)wantsTitles
{
  return self->_wantsTitles;
}

- (BOOL)allowAspectModeToggle
{
  return self->_allowAspectModeToggle;
}

- (BOOL)allowLimitingImagesTo3MP
{
  return self->_allowLimitingImagesTo3MP;
}

- (int64_t)simulatedError
{
  return self->_simulatedError;
}

- (BOOL)includeDeviceDiagnosticsForTTR
{
  return self->_includeDeviceDiagnosticsForTTR;
}

- (BOOL)includeImagesInVisualDiagnosticsForTTR
{
  return self->_includeImagesInVisualDiagnosticsForTTR;
}

- (BOOL)disableShowcaseBadge
{
  return self->_disableShowcaseBadge;
}

- (double)showcaseTransitionDuration
{
  return self->_showcaseTransitionDuration;
}

- (double)showcaseSegmentDuration
{
  return self->_showcaseSegmentDuration;
}

- (BOOL)overrideDurations
{
  return self->_overrideDurations;
}

- (int64_t)kenBurnsShowcaseMode
{
  return self->_kenBurnsShowcaseMode;
}

- (int64_t)separatorEffectsShowcaseMode
{
  return self->_separatorEffectsShowcaseMode;
}

- (int64_t)transitionFallback
{
  return self->_transitionFallback;
}

- (int64_t)transitionShowcaseMode
{
  return self->_transitionShowcaseMode;
}

- (NSString)clipCompositionFallback
{
  return self->_clipCompositionFallback;
}

- (int64_t)clipCompositionShowcaseMode
{
  return self->_clipCompositionShowcaseMode;
}

- (BOOL)allowsShowcase
{
  return self->_allowsShowcase;
}

- (BOOL)shouldShowAppleMusicRelatedUI
{
  if (![(PXStorySettings *)self forceFlexForPHMemory]
    && ![(PXStorySettings *)self forceFlexForNonPHMemory])
  {
    return 1;
  }
  return [(PXStorySettings *)self forceFlexIncludesAppleMusic];
}

- (id)possibleTransitionKindsForFallback:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    double v4 = +[PXStoryTransitionsSettings supportedTransitions];
  }
  else
  {
    double v3 = [NSNumber numberWithChar:(char)a3];
    v6[0] = v3;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  return v4;
}

- (id)possibleClipCompositionsForFallback:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [(id)objc_opt_class() availableClipCompositions];
  if (![v3 isEqualToString:@"All"])
  {
    v3;
    PXFilter();
  }
  id v5 = v4;
  if (![v5 count])
  {
    double v6 = +[PXStoryClipCompositionFactory oneUpComposition];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

    id v5 = (id)v7;
  }

  return v5;
}

uint64_t __55__PXStorySettings_possibleClipCompositionsForFallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 label];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (CGSize)inlinePlaybackCriticalInsets
{
  [(PXStorySettings *)self inlinePlaybackCriticalInsetX];
  double v4 = v3;
  [(PXStorySettings *)self inlinePlaybackCriticalInsetY];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)feedItemShadow
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0858]);
  double v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.25];
  [v3 setShadowColor:v4];

  objc_msgSend(v3, "setShadowOffset:", 0.0, 8.0);
  [v3 setShadowBlurRadius:20.0];
  if ([(PXStorySettings *)self wantsHighContrastColors])
  {
    double v5 = [MEMORY[0x1E4FB1618] redColor];
    double v6 = [v5 colorWithAlphaComponent:0.75];
    [v3 setShadowColor:v6];
  }
  return v3;
}

- (BOOL)allowsRandomFallbackForShowcaseMode:(int64_t)a3
{
  BOOL result = [(PXStorySettings *)self allowsShowcase];
  if ((unint64_t)(a3 - 1) >= 2) {
    return 0;
  }
  return result;
}

- (BOOL)allowsDefaultBehaviorForShowcaseMode:(int64_t)a3
{
  BOOL v4 = ![(PXStorySettings *)self allowsShowcase];
  return a3 != 2 || v4;
}

- (unint64_t)fullsizePaperTrailOptions
{
  id v3 = +[PXRootSettings sharedInstance];
  int v4 = [v3 canShowInternalUI];

  if (!v4) {
    return 0;
  }
  return [(PXStorySettings *)self preferredFullsizePaperTrailOptions];
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStorySettings;
  [(PXStorySettings *)&v10 didChangeValueForKey:v4];
  NSStringFromSelector(sel_curationScorePercentileThreshold);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
LABEL_7:

    goto LABEL_8;
  }
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    NSStringFromSelector(sel_aestheticsScorePercentileThreshold);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 != v4)
    {
      double v8 = v7;
      char v9 = [v4 isEqualToString:v7];

      if ((v9 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }

    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  [(PXStorySettings *)self performPostSaveActions];
LABEL_10:
}

- (void)performPostSaveActions
{
  v11.receiver = self;
  v11.super_class = (Class)PXStorySettings;
  [(PXSettings *)&v11 performPostSaveActions];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = *MEMORY[0x1E4F283E0];
  id v5 = [v3 persistentDomainForName:*MEMORY[0x1E4F283E0]];
  char v6 = (void *)[v5 mutableCopy];

  id v7 = NSNumber;
  [(PXStorySettings *)self curationScorePercentileThreshold];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v6 setObject:v8 forKey:*MEMORY[0x1E4F39400]];

  char v9 = NSNumber;
  [(PXStorySettings *)self aestheticsScorePercentileThreshold];
  objc_super v10 = objc_msgSend(v9, "numberWithDouble:");
  [v6 setObject:v10 forKey:*MEMORY[0x1E4F393F8]];

  [v3 setPersistentDomain:v6 forName:v4];
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)possibleNormalizationTechniques
{
  return &unk_1F02D3A78;
}

+ (id)possibleNormalizationModes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getPIColorNormalizationFilterClass_softClass_54457;
  uint64_t v9 = getPIColorNormalizationFilterClass_softClass_54457;
  if (!getPIColorNormalizationFilterClass_softClass_54457)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getPIColorNormalizationFilterClass_block_invoke_54458;
    v5[3] = &unk_1E5DD2B08;
    v5[4] = &v6;
    __getPIColorNormalizationFilterClass_block_invoke_54458((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  if ([v3 isAnalysisAvailable]) {
    return &unk_1F02D3A48;
  }
  else {
    return &unk_1F02D3A60;
  }
}

+ (id)possibleTransitionFallbackTitles
{
}

__CFString *__51__PXStorySettings_possibleTransitionFallbackTitles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  if (v2 == -1)
  {
    uint64_t v4 = @"All";
  }
  else
  {
    if (v2 > 0xAu) {
      id v3 = @"??";
    }
    else {
      id v3 = off_1E5DC5088[v2];
    }
    uint64_t v4 = v3;
  }
  return v4;
}

+ (id)possibleTransitionFallbacks
{
  uint64_t v2 = +[PXStoryTransitionsSettings supportedTransitions];
  id v3 = [v2 arrayByAddingObject:&unk_1F02D6A60];

  return v3;
}

+ (id)possibleClipCompositionFallbacks
{
}

uint64_t __51__PXStorySettings_possibleClipCompositionFallbacks__block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

+ (id)availableClipCompositions
{
  return +[PXStoryClipCompositionFactory allSupportedCompositions];
}

+ (id)possiblePaperTrailOptions
{
  return &unk_1F02D3A30;
}

+ (id)possibleFeedHUDTypes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "px_integersFrom:to:", 18, 19);
}

+ (id)possibleDefaultHUDTypes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "px_integersFrom:to:", 1, 18);
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PXStorySettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_54479 != -1) {
    dispatch_once(&transientProperties_onceToken_54479, block);
  }
  uint64_t v2 = (void *)transientProperties_transientProperties_54480;
  return v2;
}

void __38__PXStorySettings_transientProperties__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___PXStorySettings;
  v1 = objc_msgSendSuper2(&v6, sel_transientProperties);
  uint64_t v2 = NSStringFromSelector(sel_fullsizePaperTrailOptions);
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v4 = [v1 setByAddingObjectsFromArray:v3];
  id v5 = (void *)transientProperties_transientProperties_54480;
  transientProperties_transientProperties_54480 = v4;
}

+ (id)settingsControllerModule
{
  MEMORY[0x1F4188790](a1, a2);
  id v3 = v2;
  v1286[32] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = NSStringFromSelector(sel_allowsShowcase);
  v1251 = objc_msgSend(v4, "predicateWithFormat:", @"%K != 0", v5);

  objc_super v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = NSStringFromSelector(sel_wantsScrubber);
  v1254 = objc_msgSend(v6, "predicateWithFormat:", @"%K != 0", v7);

  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = NSStringFromSelector(sel_swipeDownBehavior);
  v1249 = objc_msgSend(v8, "predicateWithFormat:", @"%K == %li", v9, 1);

  objc_super v10 = (void *)MEMORY[0x1E4F28F60];
  objc_super v11 = NSStringFromSelector(sel_overrideDurations);
  v1252 = objc_msgSend(v10, "predicateWithFormat:", @"%K != 0", v11);

  v12 = (void *)MEMORY[0x1E4F28F60];
  v13 = NSStringFromSelector(sel_overrideLegibilityGradientHeights);
  v1250 = objc_msgSend(v12, "predicateWithFormat:", @"%K != 0", v13);

  id v14 = &unk_1F02D3A90;
  v1253 = +[PXStorySettings possiblePaperTrailOptions];
  v15 = (void *)MEMORY[0x1E4F94160];
  id v950 = (id)MEMORY[0x1E4F94160];
  v16 = (void *)MEMORY[0x1E4F941F0];
  v1246 = NSStringFromSelector(sel_allowsShowcase);
  v1245 = [v16 rowWithTitle:@"Showcase Mode" valueKeyPath:v1246];
  v1285 = v1245;
  v1244 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1285 count:1];
  v1243 = [v15 sectionWithRows:v1244];
  v1286[0] = v1243;
  v1200 = (void *)MEMORY[0x1E4F94160];
  v17 = (void *)MEMORY[0x1E4F94108];
  v1242 = NSStringFromSelector(sel_clipCompositionShowcaseMode);
  v1241 = [v17 rowWithTitle:@"Clip Compositions" valueKeyPath:v1242];
  v1240 = objc_msgSend(v1241, "px_possibleValues:formatter:", &unk_1F02D3A90, &__block_literal_global_220223);
  v1284[0] = v1240;
  v18 = (void *)MEMORY[0x1E4F94108];
  v1239 = NSStringFromSelector(sel_clipCompositionFallback);
  v1238 = [v18 rowWithTitle:@"Fallback Composition(s)" valueKeyPath:v1239];
  v19 = v3;
  v1237 = [v3 possibleClipCompositionFallbacks];
  v1236 = [v3 possibleClipCompositionFallbackTitles];
  v1234 = [v1238 possibleValues:v1237 titles:v1236];
  v20 = (void *)MEMORY[0x1E4F28F60];
  v1235 = NSStringFromSelector(sel_clipCompositionShowcaseMode);
  v1233 = objc_msgSend(v20, "predicateWithFormat:", @"%K != %li", v1235, 0);
  v1232 = [v1234 condition:v1233];
  v1284[1] = v1232;
  v21 = (void *)MEMORY[0x1E4F94108];
  v1231 = NSStringFromSelector(sel_transitionShowcaseMode);
  v1230 = [v21 rowWithTitle:@"Transitions" valueKeyPath:v1231];
  v1229 = objc_msgSend(v1230, "px_possibleValues:formatter:", &unk_1F02D3A90, &__block_literal_global_220223);
  v1284[2] = v1229;
  v22 = (void *)MEMORY[0x1E4F94108];
  v1228 = NSStringFromSelector(sel_transitionFallback);
  v1227 = [v22 rowWithTitle:@"Fallback Transition(s)" valueKeyPath:v1228];
  v1247 = v19;
  v1226 = [v19 possibleTransitionFallbacks];
  v1225 = [v19 possibleTransitionFallbackTitles];
  v1223 = [v1227 possibleValues:v1226 titles:v1225];
  v23 = (void *)MEMORY[0x1E4F28F60];
  v1224 = NSStringFromSelector(sel_transitionShowcaseMode);
  v1222 = objc_msgSend(v23, "predicateWithFormat:", @"%K != %li", v1224, 0);
  v1221 = [v1223 condition:v1222];
  v1284[3] = v1221;
  v24 = (void *)MEMORY[0x1E4F94108];
  v1220 = NSStringFromSelector(sel_separatorEffectsShowcaseMode);
  v1219 = [v24 rowWithTitle:@"Separator Effects" valueKeyPath:v1220];
  v1218 = objc_msgSend(v1219, "px_possibleValues:formatter:", &unk_1F02D3A90, &__block_literal_global_220223);
  v1284[4] = v1218;
  v25 = (void *)MEMORY[0x1E4F94108];
  v1217 = NSStringFromSelector(sel_kenBurnsShowcaseMode);
  v1216 = [v25 rowWithTitle:@"Ken Burns" valueKeyPath:v1217];
  v1215 = objc_msgSend(v1216, "px_possibleValues:formatter:", &unk_1F02D3A90, &__block_literal_global_220223);
  v1284[5] = v1215;
  v26 = (void *)MEMORY[0x1E4F941F0];
  NSStringFromSelector(sel_overrideDurations);
  aSelector = (char *)objc_claimAutoreleasedReturnValue();
  v1213 = [v26 rowWithTitle:@"Override Durations" valueKeyPath:aSelector];
  v1284[6] = v1213;
  v27 = (void *)MEMORY[0x1E4F941D8];
  v1212 = NSStringFromSelector(sel_showcaseSegmentDuration);
  v1211 = [v27 rowWithTitle:@"Segment Duration" valueKeyPath:v1212];
  v1210 = [v1211 minValue:1.0 maxValue:10.0];
  v1209 = [v1210 condition:v1252];
  v1284[7] = v1209;
  v28 = (void *)MEMORY[0x1E4F941D8];
  v1208 = NSStringFromSelector(sel_showcaseTransitionDuration);
  v1207 = [v28 rowWithTitle:@"Transition Duration" valueKeyPath:v1208];
  v1206 = [v1207 minValue:0.3 maxValue:10.0];
  v1205 = [v1206 condition:v1252];
  v1284[8] = v1205;
  v29 = (void *)MEMORY[0x1E4F941F0];
  v1204 = NSStringFromSelector(sel_disableShowcaseBadge);
  v1203 = [v29 rowWithTitle:@"Disable Badge" valueKeyPath:v1204];
  v1284[9] = v1203;
  v1202 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1284 count:10];
  v1201 = [v1200 sectionWithRows:v1202 title:@"Showcase Mode" condition:v1251];
  v1286[1] = v1201;
  v30 = (void *)MEMORY[0x1E4F94160];
  v31 = (void *)MEMORY[0x1E4F941F0];
  v1199 = NSStringFromSelector(sel_allowLimitingImagesTo3MP);
  v1198 = [v31 rowWithTitle:@"Allow limiting images to 3MP" valueKeyPath:v1199];
  v1283[0] = v1198;
  v32 = (void *)MEMORY[0x1E4F941F0];
  v1197 = NSStringFromSelector(sel_allowAspectModeToggle);
  v1196 = [v32 rowWithTitle:@"Aspect Mode Toggle" valueKeyPath:v1197];
  v1283[1] = v1196;
  v33 = (void *)MEMORY[0x1E4F941F0];
  v1195 = NSStringFromSelector(sel_isHUDEnabled);
  v1194 = [v33 rowWithTitle:@"HUD Enabled" valueKeyPath:v1195];
  v1283[2] = v1194;
  v34 = (void *)MEMORY[0x1E4F941F0];
  v1193 = NSStringFromSelector(sel_isHUDVisible);
  v1191 = [v34 rowWithTitle:@"HUD Visible" valueKeyPath:v1193];
  v35 = (void *)MEMORY[0x1E4F28F60];
  v1192 = NSStringFromSelector(sel_isHUDEnabled);
  v1190 = objc_msgSend(v35, "predicateWithFormat:", @"%K != 0", v1192);
  v1189 = [v1191 condition:v1190];
  v1283[3] = v1189;
  v36 = (void *)MEMORY[0x1E4F94108];
  v1188 = NSStringFromSelector(sel_defaultHUDType);
  v1187 = [v36 rowWithTitle:@"HUD Type" valueKeyPath:v1188];
  v1186 = [v19 possibleDefaultHUDTypes];
  v1184 = objc_msgSend(v1187, "px_possibleValues:formatter:", v1186, &__block_literal_global_319_220239);
  v37 = (void *)MEMORY[0x1E4F28F60];
  v1185 = NSStringFromSelector(sel_isHUDEnabled);
  v1183 = objc_msgSend(v37, "predicateWithFormat:", @"%K != 0", v1185);
  v1182 = [v1184 condition:v1183];
  v1283[4] = v1182;
  v38 = (void *)MEMORY[0x1E4F941F0];
  v1181 = NSStringFromSelector(sel_isExportHUDEnabled);
  v1180 = [v38 rowWithTitle:@"Export HUD Enabled" valueKeyPath:v1181];
  v1283[5] = v1180;
  v39 = (void *)MEMORY[0x1E4F94108];
  v1179 = NSStringFromSelector(sel_exportHUDType);
  v1178 = [v39 rowWithTitle:@"Export HUD Type" valueKeyPath:v1179];
  v1177 = [v19 possibleDefaultHUDTypes];
  v1175 = objc_msgSend(v1178, "px_possibleValues:formatter:", v1177, &__block_literal_global_331);
  v40 = (void *)MEMORY[0x1E4F28F60];
  v1176 = NSStringFromSelector(sel_isExportHUDEnabled);
  v1174 = objc_msgSend(v40, "predicateWithFormat:", @"%K != 0", v1176);
  v1173 = [v1175 condition:v1174];
  v1283[6] = v1173;
  v41 = (void *)MEMORY[0x1E4F941F0];
  v1172 = NSStringFromSelector(sel_enableDemoAction);
  v1171 = [v41 rowWithTitle:@"Demo Action" valueKeyPath:v1172];
  v1283[7] = v1171;
  v42 = (void *)MEMORY[0x1E4F941F0];
  v1170 = NSStringFromSelector(sel_enableProtoPlayground);
  v1169 = [v42 rowWithTitle:@"Proto Playground" valueKeyPath:v1170];
  v1283[8] = v1169;
  v1167 = objc_msgSend(MEMORY[0x1E4F94130], "px_rowWithTitle:action:", @"Proto Playground Settings", &__block_literal_global_348_220245);
  v43 = (void *)MEMORY[0x1E4F28F60];
  v1168 = NSStringFromSelector(sel_enableProtoPlayground);
  v1166 = objc_msgSend(v43, "predicateWithFormat:", @"%K != 0", v1168);
  v1165 = [v1167 condition:v1166];
  v1283[9] = v1165;
  v44 = (void *)MEMORY[0x1E4F94108];
  v1164 = NSStringFromSelector(sel_preferredFullsizePaperTrailOptions);
  v1163 = [v44 rowWithTitle:@"Fullsize Paper Trail" valueKeyPath:v1164];
  v1162 = objc_msgSend(v1163, "px_possibleValues:formatter:", v1253, &__block_literal_global_230_220247);
  v1283[10] = v1162;
  v45 = (void *)MEMORY[0x1E4F941F0];
  v1161 = NSStringFromSelector(sel_wantsTitles);
  v1160 = [v45 rowWithTitle:@"Titles" valueKeyPath:v1161];
  v1283[11] = v1160;
  v46 = (void *)MEMORY[0x1E4F941F0];
  v1159 = NSStringFromSelector(sel_wantsRelated);
  v1158 = [v46 rowWithTitle:@"Related" valueKeyPath:v1159];
  v1283[12] = v1158;
  v47 = (void *)MEMORY[0x1E4F941F0];
  v1157 = NSStringFromSelector(sel_wantsResourcesPreloading);
  v1156 = [v47 rowWithTitle:@"Resources Preloading" valueKeyPath:v1157];
  v1283[13] = v1156;
  v48 = (void *)MEMORY[0x1E4F941F0];
  NSStringFromSelector(sel_wantsScrubber);
  v1155 = (char *)objc_claimAutoreleasedReturnValue();
  v1154 = [v48 rowWithTitle:@"Scrubber" valueKeyPath:v1155];
  v1283[14] = v1154;
  v49 = (void *)MEMORY[0x1E4F941F0];
  v1153 = NSStringFromSelector(sel_wantsGridLayout);
  v1152 = [v49 rowWithTitle:@"Grid" valueKeyPath:v1153];
  v1283[15] = v1152;
  v50 = (void *)MEMORY[0x1E4F941F0];
  v1151 = NSStringFromSelector(sel_wantsPersistence);
  v1150 = [v50 rowWithTitle:@"Persistence" valueKeyPath:v1151];
  v1283[16] = v1150;
  v51 = (void *)MEMORY[0x1E4F941D8];
  v1149 = NSStringFromSelector(sel_persistenceConfirmationDuration);
  v1148 = [v51 rowWithTitle:@"Persistence Confirmation Duration" valueKeyPath:v1149];
  v1147 = [v1148 minValue:0.0 maxValue:10.0];
  v1146 = objc_msgSend(v1147, "px_increment:", 0.5);
  v1283[17] = v1146;
  v52 = (void *)MEMORY[0x1E4F941F0];
  v1145 = NSStringFromSelector(sel_wantsAnimations);
  v1144 = [v52 rowWithTitle:@"Animations" valueKeyPath:v1145];
  v1283[18] = v1144;
  v53 = (void *)MEMORY[0x1E4F941F0];
  v1143 = NSStringFromSelector(sel_wantsHighContrastColors);
  v1142 = [v53 rowWithTitle:@"High Contrast Colors" valueKeyPath:v1143];
  v1283[19] = v1142;
  v54 = (void *)MEMORY[0x1E4F941F0];
  v1141 = NSStringFromSelector(sel_wantsValidation);
  v1140 = [v54 rowWithTitle:@"Validation" valueKeyPath:v1141];
  v1283[20] = v1140;
  v55 = (void *)MEMORY[0x1E4F94108];
  v1139 = NSStringFromSelector(sel_twoFingerTapAction);
  v1138 = [v55 rowWithTitle:@"Two Finger Tap" valueKeyPath:v1139];
  v1137 = [v1138 possibleValues:&unk_1F02D4F48 titles:&unk_1F02D4F60];
  v1283[21] = v1137;
  v56 = (void *)MEMORY[0x1E4F941D8];
  v1136 = NSStringFromSelector(sel_maximumAppBackgroundDurationBeforeAutoPause);
  v1135 = [v56 rowWithTitle:@"App Background Auto-Pause Delay" valueKeyPath:v1136];
  v1134 = [v1135 minValue:1.0 maxValue:300.0];
  v1283[22] = v1134;
  v57 = (void *)MEMORY[0x1E4F94108];
  v1133 = NSStringFromSelector(sel_playerPresentationType);
  v1132 = [v57 rowWithTitle:@"Player Presentation Type" valueKeyPath:v1133];
  v1131 = [v1132 possibleValues:&unk_1F02D4F78 titles:&unk_1F02D4F90];
  v1283[23] = v1131;
  v58 = (void *)MEMORY[0x1E4F94108];
  v1130 = NSStringFromSelector(sel_feedPresentationType);
  v1129 = [v58 rowWithTitle:@"Feed Presentation Type" valueKeyPath:v1130];
  v1128 = [v1129 possibleValues:&unk_1F02D4FA8 titles:&unk_1F02D4FC0];
  v1283[24] = v1128;
  v59 = (void *)MEMORY[0x1E4F941F0];
  v1127 = NSStringFromSelector(sel_allowCustomUserAssets);
  v1126 = [v59 rowWithTitle:@"Allow Custom User Assets" valueKeyPath:v1127];
  v1283[25] = v1126;
  v60 = (void *)MEMORY[0x1E4F941F0];
  v1125 = NSStringFromSelector(sel_preferAssetLocationAndCreationDateForClipTitleAndSubtitle);
  v1124 = [v60 rowWithTitle:@"Location & Date For Clip Title and Subtitle" valueKeyPath:v1125];
  v1283[26] = v1124;
  v1123 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1283 count:27];
  v1122 = [v30 sectionWithRows:v1123 title:@"General"];
  v1286[2] = v1122;
  v61 = (void *)MEMORY[0x1E4F94160];
  v62 = (void *)MEMORY[0x1E4F941F0];
  v1121 = NSStringFromSelector(sel_includeImagesInVisualDiagnosticsForTTR);
  v1120 = [v62 rowWithTitle:@"Include photos in Visual Diagnosics" valueKeyPath:v1121];
  v1282 = v1120;
  v1119 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1282 count:1];
  v1118 = [v61 sectionWithRows:v1119 title:@"Tap-To-Radar"];
  v1286[3] = v1118;
  v63 = (void *)MEMORY[0x1E4F94160];
  v64 = (void *)MEMORY[0x1E4F94108];
  v1117 = NSStringFromSelector(sel_simulatedError);
  v1116 = [v64 rowWithTitle:@"Simulated Error" valueKeyPath:v1117];
  id v65 = &unk_1F02D3AA8;
  v1115 = objc_msgSend(v1116, "px_possibleValues:formatter:", &unk_1F02D3AA8, &__block_literal_global_504);
  v1281 = v1115;
  v1114 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1281 count:1];
  v1113 = [v63 sectionWithRows:v1114 title:@"Errors"];
  v1286[4] = v1113;
  v1057 = (void *)MEMORY[0x1E4F94160];
  v66 = (void *)MEMORY[0x1E4F94108];
  v1112 = NSStringFromSelector(sel_timelineProducerKind);
  v1111 = [v66 rowWithTitle:@"Producer Kind" valueKeyPath:v1112];
  v1110 = [v1111 possibleValues:&unk_1F02D4FD8 titles:&unk_1F02D4FF0];
  v1280[0] = v1110;
  v67 = (void *)MEMORY[0x1E4F941F0];
  v1109 = NSStringFromSelector(sel_allowsTimelineRecombination);
  v1108 = [v67 rowWithTitle:@"Timeline Recombination" valueKeyPath:v1109];
  v1280[1] = v1108;
  v68 = (void *)MEMORY[0x1E4F941F0];
  v1107 = NSStringFromSelector(sel_shouldRecombineTimelineWithSameVisibleSegments);
  v1105 = [v68 rowWithTitle:@"Recombine with Same Visible Segments" valueKeyPath:v1107];
  v69 = (void *)MEMORY[0x1E4F28F60];
  v1106 = NSStringFromSelector(sel_allowsTimelineRecombination);
  v1104 = objc_msgSend(v69, "predicateWithFormat:", @"%K != 0", v1106);
  v1103 = [v1105 condition:v1104];
  v1280[2] = v1103;
  v70 = (void *)MEMORY[0x1E4F94130];
  v1102 = NSStringFromSelector(sel_multipartPanoramaSettings);
  v1101 = [v70 rowWithTitle:@"Multipart Panoramas" childSettingsKeyPath:v1102];
  v1280[3] = v1101;
  v71 = (void *)MEMORY[0x1E4F941F0];
  v1100 = NSStringFromSelector(sel_validationShouldWaitForTimelineToBeReadyToPlay);
  v1099 = [v71 rowWithTitle:@"Validate When Ready" valueKeyPath:v1100];
  v1280[4] = v1099;
  v72 = (void *)MEMORY[0x1E4F941F0];
  v1098 = NSStringFromSelector(sel_allowNonFillingCompositionsForKeyAsset);
  v1097 = [v72 rowWithTitle:@"Non-Filling Key Asset" valueKeyPath:v1098];
  v1280[5] = v1097;
  v73 = (void *)MEMORY[0x1E4F941F0];
  v1096 = NSStringFromSelector(sel_limitKeyAssetAspectRatioToFeedCard);
  v1094 = [v73 rowWithTitle:@"Limit A/R to Card" valueKeyPath:v1096];
  v74 = (void *)MEMORY[0x1E4F28F60];
  v1095 = NSStringFromSelector(sel_allowNonFillingCompositionsForKeyAsset);
  v1093 = objc_msgSend(v74, "predicateWithFormat:", @"%K != 0", v1095);
  v1092 = [v1094 condition:v1093];
  v1280[6] = v1092;
  v75 = (void *)MEMORY[0x1E4F94108];
  v1091 = NSStringFromSelector(sel_keyAssetAspectRatioOverride);
  v1090 = [v75 rowWithTitle:@"Key Asset Aspect Ratio Override" valueKeyPath:v1091];
  id v76 = &unk_1F02D3B08;
  v1089 = objc_msgSend(v1090, "px_possibleValues:formatter:", &unk_1F02D3B08, &__block_literal_global_562);
  v1280[7] = v1089;
  v77 = (void *)MEMORY[0x1E4F94108];
  v1088 = NSStringFromSelector(sel_otherAssetsAspectRatioOverride);
  v1087 = [v77 rowWithTitle:@"Other Assets Aspect Ratio Override" valueKeyPath:v1088];
  id v78 = &unk_1F02D3B08;
  v1086 = objc_msgSend(v1087, "px_possibleValues:formatter:", &unk_1F02D3B08, &__block_literal_global_570);
  v1280[8] = v1086;
  v79 = (void *)MEMORY[0x1E4F941D8];
  v1085 = NSStringFromSelector(sel_aspectFillOneUpCropTolerance);
  v1084 = [v79 rowWithTitle:@"Aspect Fill 1-Up Crop Tolerance" valueKeyPath:v1085];
  v1083 = [v1084 minValue:0.0 maxValue:1.0];
  v1280[9] = v1083;
  v80 = (void *)MEMORY[0x1E4F941D8];
  v1082 = NSStringFromSelector(sel_livePhotoSameOrientationCompactMaximumScale);
  v1081 = [v80 rowWithTitle:@"LP ||C Max Scale" valueKeyPath:v1082];
  v1080 = [v1081 minValue:1.0 maxValue:3.0];
  v1280[10] = v1080;
  v81 = (void *)MEMORY[0x1E4F941D8];
  v1079 = NSStringFromSelector(sel_livePhotoSameOrientationRegularMaximumScale);
  v1078 = [v81 rowWithTitle:@"LP ||R Max Scale" valueKeyPath:v1079];
  v1077 = [v1078 minValue:1.0 maxValue:3.0];
  v1280[11] = v1077;
  v82 = (void *)MEMORY[0x1E4F941D8];
  v1076 = NSStringFromSelector(sel_livePhotoOppositeOrientationCompactMaximumScale);
  v1075 = [v82 rowWithTitle:@"LP –|C Max Scale" valueKeyPath:v1076];
  v1074 = [v1075 minValue:1.0 maxValue:3.0];
  v1280[12] = v1074;
  v83 = (void *)MEMORY[0x1E4F941D8];
  v1073 = NSStringFromSelector(sel_livePhotoOppositeOrientationRegularMaximumScale);
  v1072 = [v83 rowWithTitle:@"LP –|R Max Scale" valueKeyPath:v1073];
  v1071 = [v1072 minValue:1.0 maxValue:3.0];
  v1280[13] = v1071;
  v84 = (void *)MEMORY[0x1E4F94130];
  v1070 = NSStringFromSelector(sel_concreteTimelineSettings);
  v1069 = [v84 rowWithTitle:@"Concrete Timeline" childSettingsKeyPath:v1070];
  v1280[14] = v1069;
  v85 = (void *)MEMORY[0x1E4F94108];
  v1068 = NSStringFromSelector(sel_timelineManagerPaperTrailLength);
  v1067 = [v85 rowWithTitle:@"Paper Trail Length" valueKeyPath:v1068];
  v1066 = objc_msgSend(v1067, "px_possibleValues:", &unk_1F02D5008);
  v1280[15] = v1066;
  v86 = (void *)MEMORY[0x1E4F941D8];
  v1065 = NSStringFromSelector(sel_estimatedMinimumDurationPerCuratedAsset);
  v1064 = [v86 rowWithTitle:@"Estim Min Asset Duration" valueKeyPath:v1065];
  v1063 = [v1064 minValue:0.0 maxValue:3.0];
  v1280[16] = v1063;
  v87 = (void *)MEMORY[0x1E4F94108];
  v1062 = NSStringFromSelector(sel_curatedAssetsLimit);
  v1061 = [v87 rowWithTitle:@"Curated Assets Limit" valueKeyPath:v1062];
  v1060 = objc_msgSend(v1061, "px_possibleValues:", &unk_1F02D5020);
  v1280[17] = v1060;
  v1059 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1280 count:18];
  v1058 = [v1057 sectionWithRows:v1059 title:@"Timeline"];
  v1286[5] = v1058;
  v88 = (void *)MEMORY[0x1E4F94160];
  v89 = (void *)MEMORY[0x1E4F941D8];
  v1056 = NSStringFromSelector(sel_viewModeTransitionSpringStiffness);
  v1055 = [v89 rowWithTitle:@"Spring Stiffness" valueKeyPath:v1056];
  v1054 = [v1055 minValue:0.0 maxValue:300.0];
  v1053 = objc_msgSend(v1054, "px_increment:", 1.0);
  v1279[0] = v1053;
  v90 = (void *)MEMORY[0x1E4F941D8];
  v1052 = NSStringFromSelector(sel_viewModeTransitionAccessoryFadepoint);
  v1051 = [v90 rowWithTitle:@"Accessory Fadepoint" valueKeyPath:v1052];
  v1050 = [v1051 minValue:0.0 maxValue:1.0];
  v1049 = objc_msgSend(v1050, "px_increment:", 0.05);
  v1279[1] = v1049;
  v1048 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1279 count:2];
  v1047 = [v88 sectionWithRows:v1048 title:@"Player <-> Grid Transition"];
  v1286[6] = v1047;
  v91 = (void *)MEMORY[0x1E4F94160];
  v92 = (void *)MEMORY[0x1E4F941F0];
  v1046 = NSStringFromSelector(sel_wantsTransitions);
  v1045 = [v92 rowWithTitle:@"Enabled" valueKeyPath:v1046];
  v1278[0] = v1045;
  v93 = (void *)MEMORY[0x1E4F94130];
  v1044 = NSStringFromSelector(sel_transitionsSettings);
  v1043 = [v93 rowWithTitle:@"Transitions Settings" childSettingsKeyPath:v1044];
  v1278[1] = v1043;
  v1042 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1278 count:2];
  v1041 = [v91 sectionWithRows:v1042 title:@"Transitions"];
  v1286[7] = v1041;
  v94 = (void *)MEMORY[0x1E4F94160];
  v95 = (void *)MEMORY[0x1E4F941F0];
  v1040 = NSStringFromSelector(sel_showStyleSwitcher);
  v1039 = [v95 rowWithTitle:@"Show Style Switcher" valueKeyPath:v1040];
  v1277[0] = v1039;
  v96 = (void *)MEMORY[0x1E4F941F0];
  v1038 = NSStringFromSelector(sel_shouldPauseInStyleSwitcher);
  v1037 = [v96 rowWithTitle:@"Pause In Switcher" valueKeyPath:v1038];
  v1277[1] = v1037;
  v97 = (void *)MEMORY[0x1E4F941F0];
  v1036 = NSStringFromSelector(sel_useVerboseStyleHUDText);
  v1035 = [v97 rowWithTitle:@"Verbose Style/Movement HUD Text" valueKeyPath:v1036];
  v1277[2] = v1035;
  v98 = (void *)MEMORY[0x1E4F941F0];
  v1034 = NSStringFromSelector(sel_shouldStylesAlwaysIncludePersistedSong);
  v1033 = [v98 rowWithTitle:@"Mixes Include Persisted Song" valueKeyPath:v1034];
  v1277[3] = v1033;
  v1032 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1277 count:4];
  v1031 = [v94 sectionWithRows:v1032 title:@"Style"];
  v1286[8] = v1031;
  v99 = (void *)MEMORY[0x1E4F94160];
  v100 = (void *)MEMORY[0x1E4F941F0];
  v1030 = NSStringFromSelector(sel_useMusicCuesForTimeline);
  v1029 = [v100 rowWithTitle:@"Timeline Sync" valueKeyPath:v1030];
  v1276[0] = v1029;
  v101 = (void *)MEMORY[0x1E4F941F0];
  v1028 = NSStringFromSelector(sel_useMusicCuesForPacing);
  v1027 = [v101 rowWithTitle:@"Live Sync" valueKeyPath:v1028];
  v1276[1] = v1027;
  v102 = (void *)MEMORY[0x1E4F941F0];
  v1026 = NSStringFromSelector(sel_forcePacingToSegmentMaxDuration);
  v1025 = [v102 rowWithTitle:@"Force Segment Durations To Max" valueKeyPath:v1026];
  v1276[2] = v1025;
  v103 = (void *)MEMORY[0x1E4F941F0];
  v1024 = NSStringFromSelector(sel_adjustToWallClockTime);
  v1023 = [v103 rowWithTitle:@"Adjust to Wall Clock Time" valueKeyPath:v1024];
  v1276[3] = v1023;
  v104 = (void *)MEMORY[0x1E4F941D8];
  v1022 = NSStringFromSelector(sel_musicDuckedVolume);
  v1021 = [v104 rowWithTitle:@"Ducked Volume" valueKeyPath:v1022];
  v1020 = [v1021 minValue:0.0 maxValue:1.0];
  v1276[4] = v1020;
  v105 = (void *)MEMORY[0x1E4F941D8];
  v1019 = NSStringFromSelector(sel_musicFadeOutVolume);
  v1018 = [v105 rowWithTitle:@"Fade-Out Volume" valueKeyPath:v1019];
  v1017 = [v1018 minValue:0.0 maxValue:1.0];
  v1276[5] = v1017;
  v106 = (void *)MEMORY[0x1E4F941D8];
  v1016 = NSStringFromSelector(sel_musicBackgroundVolume);
  v1015 = [v106 rowWithTitle:@"Background Volume" valueKeyPath:v1016];
  v1014 = [v1015 minValue:0.0 maxValue:1.0];
  v1276[6] = v1014;
  v107 = (void *)MEMORY[0x1E4F941D8];
  v1013 = NSStringFromSelector(sel_duckingFadeDuration);
  v1012 = [v107 rowWithTitle:@"Duck Fade" valueKeyPath:v1013];
  v1011 = [v1012 minValue:0.3 maxValue:1.5];
  v1276[7] = v1011;
  v108 = (void *)MEMORY[0x1E4F941D8];
  v1010 = NSStringFromSelector(sel_musicTouchDuckingDelay);
  v1009 = [v108 rowWithTitle:@"Touch Duck Delay" valueKeyPath:v1010];
  v1008 = [v1009 minValue:0.0 maxValue:1.0];
  v1276[8] = v1008;
  v109 = (void *)MEMORY[0x1E4F941D8];
  v1007 = NSStringFromSelector(sel_focusChangeFadeDuration);
  v1006 = [v109 rowWithTitle:@"Style Fade" valueKeyPath:v1007];
  v1005 = [v1006 minValue:0.3 maxValue:1.5];
  v1276[9] = v1005;
  v110 = (void *)MEMORY[0x1E4F941D8];
  v1004 = NSStringFromSelector(sel_musicTargetLoudnessLKFS);
  v1003 = [v110 rowWithTitle:@"Music Loudness LKFS" valueKeyPath:v1004];
  v1002 = [v1003 minValue:-60.0 maxValue:0.0];
  v1276[10] = v1002;
  v111 = (void *)MEMORY[0x1E4F941D8];
  v1001 = NSStringFromSelector(sel_musicDemoVolumeAdjustment);
  v1000 = [v111 rowWithTitle:@"Demo Volume Adjustment" valueKeyPath:v1001];
  v999 = [v1000 minValue:0.0 maxValue:1.0];
  v1276[11] = v999;
  v112 = (void *)MEMORY[0x1E4F94198];
  v998 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_758];
  v997 = [v112 rowWithTitle:@"Flex Music Library" action:v998];
  v1276[12] = v997;
  v113 = (void *)MEMORY[0x1E4F941A0];
  v996 = NSStringFromSelector(sel_appleMusicPromptTrigger);
  v995 = [v113 rowWithTitle:@"Apple Music Prompt Trigger" valueKeyPath:v996];
  v994 = [v995 possibleValues:&unk_1F02D5038 titles:&unk_1F02D5050];
  v1276[13] = v994;
  v114 = (void *)MEMORY[0x1E4F941F0];
  v993 = NSStringFromSelector(sel_useFakeAppleMusicAndPrivacyPrompt);
  v992 = [v114 rowWithTitle:@"Use Fake AM&P Alert" valueKeyPath:v993];
  v1276[14] = v992;
  v991 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1276 count:15];
  v990 = [v99 sectionWithRows:v991 title:@"Music"];
  v1286[9] = v990;
  v115 = (void *)MEMORY[0x1E4F94160];
  v116 = (void *)MEMORY[0x1E4F94108];
  v989 = NSStringFromSelector(sel_songsProducerKind);
  v988 = [v116 rowWithTitle:@"Producer Kind" valueKeyPath:v989];
  v987 = [v988 possibleValues:&unk_1F02D5068 titles:&unk_1F02D5080];
  v1275[0] = v987;
  v117 = (void *)MEMORY[0x1E4F941F0];
  v986 = NSStringFromSelector(sel_isAppleMusicAllowed);
  v985 = [v117 rowWithTitle:@"Allow  Music" valueKeyPath:v986];
  v1275[1] = v985;
  v118 = (void *)MEMORY[0x1E4F941A0];
  v984 = NSStringFromSelector(sel_musicSimulatedFailureMode);
  v983 = [v118 rowWithTitle:@"Simulated Error" valueKeyPath:v984];
  v982 = [v983 possibleValues:&unk_1F02D5098 titles:&unk_1F02D50B0];
  v1275[2] = v982;
  v119 = (void *)MEMORY[0x1E4F941F0];
  v981 = NSStringFromSelector(sel_forceFlexForPHMemory);
  v980 = [v119 rowWithTitle:@"Force Flex for PHMemory" valueKeyPath:v981];
  v1275[3] = v980;
  v120 = (void *)MEMORY[0x1E4F941F0];
  v979 = NSStringFromSelector(sel_forceFlexForNonPHMemory);
  v978 = [v120 rowWithTitle:@"Force Flex for non-PHMemory" valueKeyPath:v979];
  v1275[4] = v978;
  v121 = (void *)MEMORY[0x1E4F941F0];
  v977 = NSStringFromSelector(sel_forceFlexIncludesAppleMusic);
  v976 = [v121 rowWithTitle:@"Force Flex includes Music" valueKeyPath:v977];
  v1275[5] = v976;
  v975 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1275 count:6];
  v974 = [v115 sectionWithRows:v975 title:@"Music Curation"];
  v1286[10] = v974;
  v122 = (void *)MEMORY[0x1E4F94160];
  v123 = (void *)MEMORY[0x1E4F941F0];
  v973 = NSStringFromSelector(sel_allowsContinuousKenBurnsAnimations);
  v972 = [v123 rowWithTitle:@"Continuous Animations" valueKeyPath:v973];
  v1274[0] = v972;
  v124 = (void *)MEMORY[0x1E4F941D8];
  v971 = NSStringFromSelector(sel_continuousKenBurnsAnimationsTolerance);
  v970 = [v124 rowWithTitle:@"Tolerance" valueKeyPath:v971];
  v968 = [v970 minValue:0.0 maxValue:1.0];
  v125 = (void *)MEMORY[0x1E4F28F60];
  v969 = NSStringFromSelector(sel_allowsContinuousKenBurnsAnimations);
  v967 = objc_msgSend(v125, "predicateWithFormat:", @"%K != 0", v969);
  v966 = [v968 condition:v967];
  v1274[1] = v966;
  v126 = (void *)MEMORY[0x1E4F941F0];
  v965 = NSStringFromSelector(sel_forceMinDurationKenBurnsAnimations);
  v964 = [v126 rowWithTitle:@"Force Short Animations" valueKeyPath:v965];
  v1274[2] = v964;
  v127 = (void *)MEMORY[0x1E4F941F0];
  v963 = NSStringFromSelector(sel_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset);
  v962 = [v127 rowWithTitle:@"Pan Up Or Down Portrait Aspect Asset" valueKeyPath:v963];
  v1274[3] = v962;
  v961 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1274 count:4];
  v960 = [v122 sectionWithRows:v961 title:@"Ken Burns"];
  v1286[11] = v960;
  v128 = (void *)MEMORY[0x1E4F94160];
  v129 = (void *)MEMORY[0x1E4F941F0];
  v959 = NSStringFromSelector(sel_disableVideoPlayback);
  v958 = [v129 rowWithTitle:@"Disable Video Playback" valueKeyPath:v959];
  v1273[0] = v958;
  v130 = (void *)MEMORY[0x1E4F941F0];
  v957 = NSStringFromSelector(sel_forceLivePhotoVideo);
  v956 = [v130 rowWithTitle:@"Force LP Video" valueKeyPath:v957];
  v1273[1] = v956;
  v131 = (void *)MEMORY[0x1E4F941F0];
  v955 = NSStringFromSelector(sel_wantsMovieHighlights);
  v954 = [v131 rowWithTitle:@"Movie Highlights" valueKeyPath:v955];
  v1273[2] = v954;
  v132 = (void *)MEMORY[0x1E4F941F0];
  v953 = NSStringFromSelector(sel_useBestHighlightTrim);
  v952 = [v132 rowWithTitle:@"Best Highlight Trim" valueKeyPath:v953];
  v1273[3] = v952;
  v133 = (void *)MEMORY[0x1E4F941F0];
  v949 = NSStringFromSelector(sel_allowOnDemandVideoAnalysis);
  v948 = [v133 rowWithTitle:@"On-Demand Video Analysis" valueKeyPath:v949];
  v1273[4] = v948;
  v134 = (void *)MEMORY[0x1E4F941F0];
  v947 = NSStringFromSelector(sel_videoInlineStabilization);
  v946 = [v134 rowWithTitle:@"Inline Stabilization" valueKeyPath:v947];
  v1273[5] = v946;
  v135 = (void *)MEMORY[0x1E4F941F0];
  v945 = NSStringFromSelector(sel_debugShowVideoPlaybackDetails);
  v944 = [v135 rowWithTitle:@"Show Video Playback Details" valueKeyPath:v945];
  v1273[6] = v944;
  v136 = (void *)MEMORY[0x1E4F941D8];
  v943 = NSStringFromSelector(sel_videoMaximumAspectFillScale);
  v942 = [v136 rowWithTitle:@"Max Aspect Fill Scale" valueKeyPath:v943];
  v941 = [v942 minValue:1.0 maxValue:2.0];
  v1273[7] = v941;
  v137 = (void *)MEMORY[0x1E4F94108];
  v940 = NSStringFromSelector(sel_livePhotoLocalVideoQuality);
  v939 = [v137 rowWithTitle:@"LP Local Quality" valueKeyPath:v940];
  id v138 = &unk_1F02D3B20;
  v938 = objc_msgSend(v939, "px_possibleValues:formatter:", &unk_1F02D3B20, &__block_literal_global_227_220332);
  v1273[8] = v938;
  v139 = (void *)MEMORY[0x1E4F94108];
  v937 = NSStringFromSelector(sel_exportVideoQuality);
  v936 = [v139 rowWithTitle:@"Export Quality" valueKeyPath:v937];
  id v140 = &unk_1F02D3B20;
  v935 = objc_msgSend(v936, "px_possibleValues:formatter:", &unk_1F02D3B20, &__block_literal_global_227_220332);
  v1273[9] = v935;
  v141 = (void *)MEMORY[0x1E4F94108];
  v934 = NSStringFromSelector(sel_videoQuality);
  v933 = [v141 rowWithTitle:@"Quality" valueKeyPath:v934];
  id v142 = &unk_1F02D3B20;
  v932 = objc_msgSend(v933, "px_possibleValues:formatter:", &unk_1F02D3B20, &__block_literal_global_227_220332);
  v1273[10] = v932;
  v143 = (void *)MEMORY[0x1E4F941F0];
  v931 = NSStringFromSelector(sel_detectVideoLags);
  v930 = [v143 rowWithTitle:@"Detect Video Lags" valueKeyPath:v931];
  v1273[11] = v930;
  v144 = (void *)MEMORY[0x1E4F941D8];
  v929 = NSStringFromSelector(sel_significantPlayedDuration);
  v928 = [v144 rowWithTitle:@"Significant Played Duration" valueKeyPath:v929];
  v927 = [v928 minValue:0.0 maxValue:2.0];
  v926 = objc_msgSend(v927, "px_increment:", 0.1);
  v1273[12] = v926;
  v925 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1273 count:13];
  v924 = [v128 sectionWithRows:v925 title:@"Video"];
  v1286[12] = v924;
  v145 = (void *)MEMORY[0x1E4F94160];
  v146 = (void *)MEMORY[0x1E4F941D8];
  v923 = NSStringFromSelector(sel_muteToggleButtonAutoHideDelay);
  v922 = [v146 rowWithTitle:@"Mute Button Auto-Hide Delay" valueKeyPath:v923];
  v921 = [v922 minValue:0.0 maxValue:10.0];
  v920 = objc_msgSend(v921, "px_increment:", 0.5);
  v1272[0] = v920;
  v147 = (void *)MEMORY[0x1E4F941F0];
  v919 = NSStringFromSelector(sel_wantsAudioFromVideo);
  v918 = [v147 rowWithTitle:@"Play Audio from Video" valueKeyPath:v919];
  v1272[1] = v918;
  v148 = (void *)MEMORY[0x1E4F94108];
  v917 = NSStringFromSelector(sel_videoAudioStrategy);
  v916 = [v148 rowWithTitle:@"Video Audio Strategy" valueKeyPath:v917];
  id v149 = &unk_1F02D3AC0;
  v915 = objc_msgSend(v916, "px_possibleValues:formatter:", &unk_1F02D3AC0, &__block_literal_global_954);
  v1272[2] = v915;
  v150 = (void *)MEMORY[0x1E4F94108];
  v914 = NSStringFromSelector(sel_slomoVideoAudioStrategy);
  v913 = [v150 rowWithTitle:@"Slomo Audio Strategy" valueKeyPath:v914];
  id v151 = &unk_1F02D3AC0;
  v912 = objc_msgSend(v913, "px_possibleValues:formatter:", &unk_1F02D3AC0, &__block_literal_global_962);
  v1272[3] = v912;
  v152 = (void *)MEMORY[0x1E4F94108];
  v911 = NSStringFromSelector(sel_livePhotoAudioStrategy);
  v910 = [v152 rowWithTitle:@"Live Photo Audio Strategy" valueKeyPath:v911];
  id v153 = &unk_1F02D3AC0;
  v909 = objc_msgSend(v910, "px_possibleValues:formatter:", &unk_1F02D3AC0, &__block_literal_global_970);
  v1272[4] = v909;
  v154 = (void *)MEMORY[0x1E4F94108];
  v908 = NSStringFromSelector(sel_loopingVideoAudioStrategy);
  v907 = [v154 rowWithTitle:@"Looping Video Audio Strategy" valueKeyPath:v908];
  id v155 = &unk_1F02D3AC0;
  v906 = objc_msgSend(v907, "px_possibleValues:formatter:", &unk_1F02D3AC0, &__block_literal_global_978);
  v1272[5] = v906;
  v156 = (void *)MEMORY[0x1E4F941F0];
  v905 = NSStringFromSelector(sel_muteBackgroundMusic);
  v904 = [v156 rowWithTitle:@"Mute Background Music" valueKeyPath:v905];
  v1272[6] = v904;
  v157 = (void *)MEMORY[0x1E4F941D8];
  v903 = NSStringFromSelector(sel_foregroundAudioLoudnessTarget);
  v902 = [v157 rowWithTitle:@"Loudness Target Foreground" valueKeyPath:v903];
  v901 = [v902 minValue:-60.0 maxValue:0.0];
  v1272[7] = v901;
  v158 = (void *)MEMORY[0x1E4F941D8];
  v900 = NSStringFromSelector(sel_backgroundAudioLoudnessTarget);
  v899 = [v158 rowWithTitle:@"Loudness Target Background" valueKeyPath:v900];
  v898 = [v899 minValue:-60.0 maxValue:0.0];
  v1272[8] = v898;
  v159 = (void *)MEMORY[0x1E4F941F0];
  v897 = NSStringFromSelector(sel_wantsAudioFade);
  v896 = [v159 rowWithTitle:@"Fade Audio In/Out" valueKeyPath:v897];
  v1272[9] = v896;
  v160 = (void *)MEMORY[0x1E4F941D8];
  v895 = NSStringFromSelector(sel_audioFadeMinDuration);
  v894 = [v160 rowWithTitle:@"Min Fade Duration" valueKeyPath:v895];
  v892 = [v894 minValue:0.0 maxValue:1.0];
  v161 = (void *)MEMORY[0x1E4F28F60];
  v893 = NSStringFromSelector(sel_wantsAudioFade);
  v891 = objc_msgSend(v161, "predicateWithFormat:", @"%K != 0", v893);
  v890 = [v892 condition:v891];
  v1272[10] = v890;
  v162 = (void *)MEMORY[0x1E4F941D8];
  v889 = NSStringFromSelector(sel_audioFadeMaxDuration);
  v888 = [v162 rowWithTitle:@"Max Fade Duration" valueKeyPath:v889];
  v886 = [v888 minValue:0.0 maxValue:1.0];
  v163 = (void *)MEMORY[0x1E4F28F60];
  v887 = NSStringFromSelector(sel_wantsAudioFade);
  v885 = objc_msgSend(v163, "predicateWithFormat:", @"%K != 0", v887);
  v884 = [v886 condition:v885];
  v1272[11] = v884;
  v164 = (void *)MEMORY[0x1E4F94108];
  v883 = NSStringFromSelector(sel_audioFadeCurve);
  v882 = [v164 rowWithTitle:@"Fade Curve" valueKeyPath:v883];
  id v165 = &unk_1F02D3AF0;
  v880 = objc_msgSend(v882, "px_possibleValues:formatter:", &unk_1F02D3AF0, &__block_literal_global_1016);
  v166 = (void *)MEMORY[0x1E4F28F60];
  v881 = NSStringFromSelector(sel_wantsAudioFade);
  v879 = objc_msgSend(v166, "predicateWithFormat:", @"%K != 0", v881);
  v878 = [v880 condition:v879];
  v1272[12] = v878;
  v167 = (void *)MEMORY[0x1E4F941F0];
  v877 = NSStringFromSelector(sel_wantsAudioJLCuts);
  v876 = [v167 rowWithTitle:@"Enable J&L Cuts" valueKeyPath:v877];
  v1272[13] = v876;
  v168 = (void *)MEMORY[0x1E4F94108];
  v875 = NSStringFromSelector(sel_audioJCutStrategy);
  v874 = [v168 rowWithTitle:@"J Cut Strategy" valueKeyPath:v875];
  id v169 = &unk_1F02D3AD8;
  v872 = objc_msgSend(v874, "px_possibleValues:formatter:", &unk_1F02D3AD8, &__block_literal_global_1029);
  v170 = (void *)MEMORY[0x1E4F28F60];
  v873 = NSStringFromSelector(sel_wantsAudioJLCuts);
  v871 = objc_msgSend(v170, "predicateWithFormat:", @"%K != 0", v873);
  v870 = [v872 condition:v871];
  v1272[14] = v870;
  v171 = (void *)MEMORY[0x1E4F94108];
  v869 = NSStringFromSelector(sel_audioLCutStrategy);
  v868 = [v171 rowWithTitle:@"L Cut Strategy" valueKeyPath:v869];
  id v172 = &unk_1F02D3AD8;
  v866 = objc_msgSend(v868, "px_possibleValues:formatter:", &unk_1F02D3AD8, &__block_literal_global_1036);
  v173 = (void *)MEMORY[0x1E4F28F60];
  v867 = NSStringFromSelector(sel_wantsAudioJLCuts);
  v865 = objc_msgSend(v173, "predicateWithFormat:", @"%K != 0", v867);
  v864 = [v866 condition:v865];
  v1272[15] = v864;
  v174 = (void *)MEMORY[0x1E4F941D8];
  v863 = NSStringFromSelector(sel_audioJCutDuration);
  v862 = [v174 rowWithTitle:@"J Cut Duration" valueKeyPath:v863];
  v860 = [v862 minValue:0.0 maxValue:2.0];
  v175 = (void *)MEMORY[0x1E4F28F60];
  v861 = NSStringFromSelector(sel_wantsAudioJLCuts);
  v859 = objc_msgSend(v175, "predicateWithFormat:", @"%K != 0", v861);
  v858 = [v860 condition:v859];
  v1272[16] = v858;
  v176 = (void *)MEMORY[0x1E4F941D8];
  v857 = NSStringFromSelector(sel_audioLCutDuration);
  v856 = [v176 rowWithTitle:@"L Cut Duration" valueKeyPath:v857];
  v854 = [v856 minValue:0.0 maxValue:2.0];
  v177 = (void *)MEMORY[0x1E4F28F60];
  v855 = NSStringFromSelector(sel_wantsAudioJLCuts);
  v853 = objc_msgSend(v177, "predicateWithFormat:", @"%K != 0", v855);
  v852 = [v854 condition:v853];
  v1272[17] = v852;
  v178 = (void *)MEMORY[0x1E4F941F0];
  v851 = NSStringFromSelector(sel_debugShowAudioPlaybackDetails);
  v850 = [v178 rowWithTitle:@"Show Audio Playback Details" valueKeyPath:v851];
  v1272[18] = v850;
  v179 = (void *)MEMORY[0x1E4F941D8];
  v849 = NSStringFromSelector(sel_simulatedAudioCuesLoadingDelay);
  v848 = [v179 rowWithTitle:@"Simulated Cues Loading Delay" valueKeyPath:v849];
  v847 = [v848 minValue:0.0 maxValue:30.0];
  v1272[19] = v847;
  v180 = (void *)MEMORY[0x1E4F941D8];
  v846 = NSStringFromSelector(sel_audioQualityMin);
  v845 = [v180 rowWithTitle:@"Minimum Audio Score" valueKeyPath:v846];
  v844 = [v845 minValue:0.0 maxValue:1.0];
  v1272[20] = v844;
  v843 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1272 count:21];
  v842 = [v145 sectionWithRows:v843 title:@"Audio"];
  v1286[13] = v842;
  v181 = (void *)MEMORY[0x1E4F94160];
  v182 = (void *)MEMORY[0x1E4F941F0];
  v841 = NSStringFromSelector(sel_wantsBufferingIndicatorOverScrubber);
  v840 = [v182 rowWithTitle:@"Spinner Over Scrubber" valueKeyPath:v841];
  v1271[0] = v840;
  v183 = (void *)MEMORY[0x1E4F941D8];
  v839 = NSStringFromSelector(sel_noncriticalBufferingTimeout);
  v837 = [v183 rowWithTitle:@"Noncritical Buffering Timeout" valueKeyPath:v839];
  v836 = [v837 minValue:0.0 maxValue:10.0];
  v1271[1] = v836;
  v184 = (void *)MEMORY[0x1E4F941D8];
  v835 = NSStringFromSelector(sel_bufferingHUDAutoPresentationTimeout);
  v834 = [v184 rowWithTitle:@"Show Spinner HUD After" valueKeyPath:v835];
  v833 = [v834 minValue:2.0 maxValue:20.0];
  v1271[2] = v833;
  v185 = (void *)MEMORY[0x1E4F941F0];
  v832 = NSStringFromSelector(sel_playerShowsBufferingStatus);
  v831 = [v185 rowWithTitle:@"Player Shows Buffering Status" valueKeyPath:v832];
  v1271[3] = v831;
  v186 = (void *)MEMORY[0x1E4F941F0];
  v830 = NSStringFromSelector(sel_simulateResourcesBufferingError);
  v829 = [v186 rowWithTitle:@"Simulate Assets Buffering Error" valueKeyPath:v830];
  v1271[4] = v829;
  v187 = (void *)MEMORY[0x1E4F941F0];
  v828 = NSStringFromSelector(sel_simulateSlowResourcesBuffering);
  v827 = [v187 rowWithTitle:@"Simulate Slow Assets Buffering" valueKeyPath:v828];
  v1271[5] = v827;
  v188 = (void *)MEMORY[0x1E4F941D8];
  v826 = NSStringFromSelector(sel_simulatedSlowResourcesBufferingDelay);
  v825 = [v188 rowWithTitle:@"Assets Buffering Delay" valueKeyPath:v826];
  v823 = [v825 minValue:0.0 maxValue:20.0];
  v189 = (void *)MEMORY[0x1E4F28F60];
  v824 = NSStringFromSelector(sel_simulateSlowResourcesBuffering);
  v822 = objc_msgSend(v189, "predicateWithFormat:", @"%K != 0", v824);
  v821 = [v823 condition:v822];
  v1271[6] = v821;
  v190 = (void *)MEMORY[0x1E4F941F0];
  v820 = NSStringFromSelector(sel_exaggerateResourceDownloadTimes);
  v819 = [v190 rowWithTitle:@"Exaggerate Resource Download Times" valueKeyPath:v820];
  v1271[7] = v819;
  v191 = (void *)MEMORY[0x1E4F941F0];
  v818 = NSStringFromSelector(sel_playbackShouldWaitForBufferingToBeReady);
  v817 = [v191 rowWithTitle:@"Prevents Playback" valueKeyPath:v818];
  v1271[8] = v817;
  v192 = (void *)MEMORY[0x1E4F941D8];
  v816 = NSStringFromSelector(sel_simultaneousPreloadingOperationsCount);
  v815 = [v192 rowWithTitle:@"Simultaneous Preloading Operations" valueKeyPath:v816];
  v814 = [v815 minValue:1.0 maxValue:10.0];
  v1271[9] = v814;
  v193 = (void *)MEMORY[0x1E4F941D8];
  v813 = NSStringFromSelector(sel_preloadingSegmentsBatchSize);
  v812 = [v193 rowWithTitle:@"Simultaneous Segments Preloading" valueKeyPath:v813];
  v811 = [v812 minValue:1.0 maxValue:4.0];
  v1271[10] = v811;
  v194 = (void *)MEMORY[0x1E4F94108];
  v810 = NSStringFromSelector(sel_preloadingEstimationStrategy);
  v809 = [v194 rowWithTitle:@"Estimation Strategy" valueKeyPath:v810];
  v808 = [v809 possibleValues:&unk_1F02D50C8 titles:&unk_1F02D50E0];
  v1271[11] = v808;
  v195 = (void *)MEMORY[0x1E4F941D8];
  v807 = NSStringFromSelector(sel_minPreloadedeSegments);
  v806 = [v195 rowWithTitle:@"Min Preloaded Segments" valueKeyPath:v807];
  v804 = [v806 minValue:1.0 maxValue:8.0];
  v196 = (void *)MEMORY[0x1E4F28F60];
  v805 = NSStringFromSelector(sel_preloadingEstimationStrategy);
  v803 = [v196 predicateWithFormat:@"%K == %@", v805, &unk_1F02D9490];
  v802 = [v804 condition:v803];
  v1271[12] = v802;
  v197 = (void *)MEMORY[0x1E4F941F0];
  v801 = NSStringFromSelector(sel_preloadNonKeyRelated);
  v800 = [v197 rowWithTitle:@"Preload Non-Key Related" valueKeyPath:v801];
  v1271[13] = v800;
  v799 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1271 count:14];
  v798 = [v181 sectionWithRows:v799 title:@"Buffering"];
  v1286[14] = v798;
  v198 = (void *)MEMORY[0x1E4F94160];
  v199 = (void *)MEMORY[0x1E4F94108];
  v797 = NSStringFromSelector(sel_scrubberDisplayMode);
  v796 = [v199 rowWithTitle:@"Display Mode" valueKeyPath:v797];
  v795 = [v796 possibleValues:&unk_1F02D50F8 titles:&unk_1F02D5110];
  v1270[0] = v795;
  v200 = (void *)MEMORY[0x1E4F941D8];
  v794 = NSStringFromSelector(sel_scrubberAutoHideDelay);
  v793 = [v200 rowWithTitle:@"Auto-Hide Delay" valueKeyPath:v794];
  v792 = [v793 minValue:0.0 maxValue:10.0];
  v1270[1] = v792;
  v201 = (void *)MEMORY[0x1E4F941F0];
  v791 = NSStringFromSelector(sel_scrubberDimsMainContent);
  v790 = [v201 rowWithTitle:@"Dims Main Content When Present" valueKeyPath:v791];
  v1270[2] = v790;
  v202 = (void *)MEMORY[0x1E4F94108];
  v789 = NSStringFromSelector(sel_scrubberEdgeFadeMode);
  v788 = [v202 rowWithTitle:@"Edge Fade Mode" valueKeyPath:v789];
  v787 = [v788 possibleValues:&unk_1F02D5128 titles:&unk_1F02D5140];
  v1270[3] = v787;
  v203 = (void *)MEMORY[0x1E4F941D8];
  v786 = NSStringFromSelector(sel_scrubberEdgeFadeDistance);
  v785 = [v203 rowWithTitle:@"Edge Fade Distance" valueKeyPath:v786];
  v784 = [v785 minValue:0.0 maxValue:250.0];
  v1270[4] = v784;
  v204 = (void *)MEMORY[0x1E4F941D8];
  v783 = NSStringFromSelector(sel_scrubberEdgeFadeOffset);
  v782 = [v204 rowWithTitle:@"Edge Fade Offset" valueKeyPath:v783];
  v781 = [v782 minValue:0.0 maxValue:250.0];
  v1270[5] = v781;
  v205 = (void *)MEMORY[0x1E4F94130];
  v780 = NSStringFromSelector(sel_scrubberLayoutSettings);
  v779 = [v205 rowWithTitle:@"Layout Settings" childSettingsKeyPath:v780];
  v1270[6] = v779;
  v778 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1270 count:7];
  v777 = [v198 sectionWithRows:v778 title:@"Scrubber" condition:v1254];
  v1286[15] = v777;
  v206 = (void *)MEMORY[0x1E4F94160];
  v207 = (void *)MEMORY[0x1E4F941F0];
  v776 = NSStringFromSelector(sel_chromeAllowAutoHide);
  v775 = [v207 rowWithTitle:@"Allow Auto-Hide" valueKeyPath:v776];
  v1269[0] = v775;
  v208 = (void *)MEMORY[0x1E4F941D8];
  v774 = NSStringFromSelector(sel_chromeAutoHideDelay);
  v773 = [v208 rowWithTitle:@"Auto-Hide Delay" valueKeyPath:v774];
  v771 = [v773 minValue:0.0 maxValue:10.0];
  v209 = (void *)MEMORY[0x1E4F28F60];
  v772 = NSStringFromSelector(sel_chromeAllowAutoHide);
  v770 = objc_msgSend(v209, "predicateWithFormat:", @"%K != 0", v772);
  v769 = [v771 condition:v770];
  v1269[1] = v769;
  v210 = (void *)MEMORY[0x1E4F941D8];
  v768 = NSStringFromSelector(sel_legibilityGradientOpacity);
  v767 = [v210 rowWithTitle:@"Gradient Opacity" valueKeyPath:v768];
  v766 = [v767 minValue:0.0 maxValue:1.0];
  v1269[2] = v766;
  v211 = (void *)MEMORY[0x1E4F941F0];
  NSStringFromSelector(sel_overrideLegibilityGradientHeights);
  v765 = (char *)objc_claimAutoreleasedReturnValue();
  v764 = [v211 rowWithTitle:@"Override Gradient Heights" valueKeyPath:v765];
  v1269[3] = v764;
  v212 = (void *)MEMORY[0x1E4F941D8];
  v763 = NSStringFromSelector(sel_topLegibilityGradientHeight);
  v762 = [v212 rowWithTitle:@"Top Gradient" valueKeyPath:v763];
  v761 = [v762 minValue:0.0 maxValue:300.0];
  v760 = objc_msgSend(v761, "px_increment:", 10.0);
  v759 = [v760 condition:v1250];
  v1269[4] = v759;
  v213 = (void *)MEMORY[0x1E4F941D8];
  v758 = NSStringFromSelector(sel_bottomLegibilityGradientHeight);
  v757 = [v213 rowWithTitle:@"Bottom Gradient" valueKeyPath:v758];
  v756 = [v757 minValue:0.0 maxValue:300.0];
  v755 = objc_msgSend(v756, "px_increment:", 10.0);
  v754 = [v755 condition:v1250];
  v1269[5] = v754;
  v214 = (void *)MEMORY[0x1E4F941F0];
  v753 = NSStringFromSelector(sel_useBottomLegibilityGradientForBufferingIndicator);
  v752 = [v214 rowWithTitle:@"Bottom Gradient for Buffering Indicator" valueKeyPath:v753];
  v1269[6] = v752;
  v215 = (void *)MEMORY[0x1E4F941D8];
  v751 = NSStringFromSelector(sel_legibilityRelatedDimming);
  v750 = [v215 rowWithTitle:@"Related Dimming" valueKeyPath:v751];
  v749 = [v750 minValue:0.0 maxValue:1.0];
  v1269[7] = v749;
  v216 = (void *)MEMORY[0x1E4F941D8];
  v748 = NSStringFromSelector(sel_legibilityPlaybackEndDimming);
  v747 = [v216 rowWithTitle:@"End Dimming" valueKeyPath:v748];
  v746 = [v747 minValue:0.0 maxValue:1.0];
  v1269[8] = v746;
  v217 = (void *)MEMORY[0x1E4F941D8];
  v745 = NSStringFromSelector(sel_legibilityPlaybackEndDimmingDuration);
  v744 = [v217 rowWithTitle:@"End Dimming Duration" valueKeyPath:v745];
  v743 = [v744 minValue:0.0 maxValue:1.0];
  v1269[9] = v743;
  v218 = (void *)MEMORY[0x1E4F941D8];
  v742 = NSStringFromSelector(sel_legibilityPlaybackEndDimmingDurationAutoReplay);
  v741 = [v218 rowWithTitle:@"[Loop] End Dimming Duration" valueKeyPath:v742];
  v740 = [v741 minValue:0.0 maxValue:3.0];
  v1269[10] = v740;
  v219 = (void *)MEMORY[0x1E4F941D8];
  v739 = NSStringFromSelector(sel_legibilityPlaybackEndUndimmingDuration);
  v738 = [v219 rowWithTitle:@"End Undimming Duration" valueKeyPath:v739];
  v737 = [v738 minValue:0.0 maxValue:1.0];
  v1269[11] = v737;
  v220 = (void *)MEMORY[0x1E4F941D8];
  v736 = NSStringFromSelector(sel_legibilityPlaybackEndUndimmingDurationAutoReplay);
  v735 = [v220 rowWithTitle:@"[Loop] End Undimming Duration" valueKeyPath:v736];
  v734 = [v735 minValue:0.0 maxValue:1.0];
  v1269[12] = v734;
  v221 = (void *)MEMORY[0x1E4F94108];
  v733 = NSStringFromSelector(sel_playButtonRewindSymbolName);
  v732 = [v221 rowWithTitle:@"Play Button Rewind Symbol" valueKeyPath:v733];
  v731 = objc_msgSend(v732, "px_possibleValues:", &unk_1F02D5158);
  v1269[13] = v731;
  v222 = (void *)MEMORY[0x1E4F941F0];
  v730 = NSStringFromSelector(sel_simulateLongChromeStrings);
  v729 = [v222 rowWithTitle:@"Simulate Long Chrome Strings" valueKeyPath:v730];
  v1269[14] = v729;
  v728 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1269 count:15];
  v727 = [v206 sectionWithRows:v728 title:@"Chrome"];
  v1286[16] = v727;
  v223 = (void *)MEMORY[0x1E4F94160];
  v224 = (void *)MEMORY[0x1E4F941D8];
  v726 = NSStringFromSelector(sel_tapNavigationAreaFraction);
  v725 = [v224 rowWithTitle:@"Tappable Width" valueKeyPath:v726];
  v724 = [v725 minValue:0.0 maxValue:0.5];
  v723 = objc_msgSend(v724, "px_increment:", 0.05);
  v722 = [v723 valueStringFormatter:&__block_literal_global_1301];
  v1268 = v722;
  v721 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1268 count:1];
  v720 = [v223 sectionWithRows:v721 title:@"Side Tap Navigation"];
  v1286[17] = v720;
  v225 = (void *)MEMORY[0x1E4F94160];
  v226 = (void *)MEMORY[0x1E4F94108];
  v719 = NSStringFromSelector(sel_relatedProducerKind);
  v718 = [v226 rowWithTitle:@"Producer Kind" valueKeyPath:v719];
  v717 = [v718 possibleValues:&unk_1F02D5170 titles:&unk_1F02D5188];
  v1267[0] = v717;
  v227 = (void *)MEMORY[0x1E4F941D8];
  v716 = NSStringFromSelector(sel_relatedProductionPlaybackFractionCompletedThreshold);
  v715 = [v227 rowWithTitle:@"Completed Playback Threshold" valueKeyPath:v716];
  v714 = [v715 minValue:0.0 maxValue:0.9];
  v1267[1] = v714;
  v228 = (void *)MEMORY[0x1E4F941F0];
  v713 = NSStringFromSelector(sel_allowRelatedProductionBeforeReadyToPlay);
  v712 = [v228 rowWithTitle:@"Produce Before Playback Ready" valueKeyPath:v713];
  v1267[2] = v712;
  v229 = (void *)MEMORY[0x1E4F941F0];
  v711 = NSStringFromSelector(sel_wantsRelatedCountdown);
  v710 = [v229 rowWithTitle:@"Countdown" valueKeyPath:v711];
  v1267[3] = v710;
  v230 = (void *)MEMORY[0x1E4F941D8];
  v709 = NSStringFromSelector(sel_relatedAnimationDuration);
  v708 = [v230 rowWithTitle:@"Animation Duration" valueKeyPath:v709];
  v707 = [v708 minValue:0.0 maxValue:2.0];
  v1267[4] = v707;
  v231 = (void *)MEMORY[0x1E4F941F0];
  v706 = NSStringFromSelector(sel_areRelatedHUDsVisible);
  v705 = [v231 rowWithTitle:@"Related HUDs" valueKeyPath:v706];
  v1267[5] = v705;
  v704 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1267 count:6];
  v703 = [v225 sectionWithRows:v704 title:@"Related"];
  v1286[18] = v703;
  v232 = (void *)MEMORY[0x1E4F94160];
  v233 = (void *)MEMORY[0x1E4F941F0];
  v702 = NSStringFromSelector(sel_smartGradientEnabled);
  v701 = [v233 rowWithTitle:@"Smart Gradient" valueKeyPath:v702];
  v1266[0] = v701;
  v234 = (void *)MEMORY[0x1E4F941F0];
  v700 = NSStringFromSelector(sel_smartGradientUseSmartColor);
  v699 = [v234 rowWithTitle:@"Single Color Smart Gradient" valueKeyPath:v700];
  v1266[1] = v699;
  v235 = (void *)MEMORY[0x1E4F941F0];
  v698 = NSStringFromSelector(sel_smartGradientUseSimpleBlur);
  v697 = [v235 rowWithTitle:@"Use Simple Blur" valueKeyPath:v698];
  v1266[2] = v697;
  v236 = (void *)MEMORY[0x1E4F941D8];
  v696 = NSStringFromSelector(sel_smartGradientBlurRadius);
  v695 = [v236 rowWithTitle:@"Simple Blur Radius" valueKeyPath:v696];
  v694 = [v695 minValue:0.0 maxValue:100.0];
  v1266[3] = v694;
  v237 = (void *)MEMORY[0x1E4F941D8];
  v693 = NSStringFromSelector(sel_smartGradientExposureValue);
  v692 = [v237 rowWithTitle:@"Simple Blur Exposure" valueKeyPath:v693];
  v691 = [v692 minValue:-2.0 maxValue:2.0];
  v1266[4] = v691;
  v238 = (void *)MEMORY[0x1E4F941F0];
  v690 = NSStringFromSelector(sel_smartGradientRepeatEdges);
  v689 = [v238 rowWithTitle:@"Simple Blur Edge Only" valueKeyPath:v690];
  v1266[5] = v689;
  v239 = (void *)MEMORY[0x1E4F941D8];
  v688 = NSStringFromSelector(sel_smartGradientEdgeStretchFactor);
  v687 = [v239 rowWithTitle:@"Edge Stretch Factor" valueKeyPath:v688];
  v686 = [v687 minValue:1.0 maxValue:10.0];
  v1266[6] = v686;
  v240 = (void *)MEMORY[0x1E4F941F0];
  v685 = NSStringFromSelector(sel_allowsNUpBackground);
  v684 = [v240 rowWithTitle:@"N-Up Background" valueKeyPath:v685];
  v1266[7] = v684;
  v241 = (void *)MEMORY[0x1E4F941D8];
  v683 = NSStringFromSelector(sel_backgroundQualityScale);
  v682 = [v241 rowWithTitle:@"Quality Scale" valueKeyPath:v683];
  v681 = [v682 minValue:0.1 maxValue:1.0];
  v1266[8] = v681;
  v680 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1266 count:9];
  v679 = [v232 sectionWithRows:v680 title:@"Background"];
  v1286[19] = v679;
  v242 = (void *)MEMORY[0x1E4F94160];
  v243 = (void *)MEMORY[0x1E4F94108];
  v678 = NSStringFromSelector(sel_movementAnimationCurve);
  v677 = [v243 rowWithTitle:@"Curve" valueKeyPath:v678];
  id v244 = &unk_1F02D35C8;
  v676 = objc_msgSend(v677, "px_possibleValues:formatter:", &unk_1F02D35C8, &__block_literal_global_1399);
  v1265[0] = v676;
  v245 = (void *)MEMORY[0x1E4F941D8];
  v675 = NSStringFromSelector(sel_movementAnimationLinearFraction);
  v674 = [v245 rowWithTitle:@"Linear Fraction" valueKeyPath:v675];
  v673 = [v674 minValue:0.0 maxValue:1.0];
  v1265[1] = v673;
  v246 = (void *)MEMORY[0x1E4F941D8];
  v672 = NSStringFromSelector(sel_movementAnimationPauseDeceleration);
  v671 = [v246 rowWithTitle:@"Pause Deceleration" valueKeyPath:v672];
  v670 = [v671 minValue:0.1 maxValue:5.0];
  v1265[2] = v670;
  v247 = (void *)MEMORY[0x1E4F941D8];
  v669 = NSStringFromSelector(sel_movementAnimationPausedVelocity);
  v668 = [v247 rowWithTitle:@"Paused Velocity" valueKeyPath:v669];
  v667 = [v668 minValue:0.0 maxValue:0.9];
  v1265[3] = v667;
  v248 = (void *)MEMORY[0x1E4F941D8];
  v666 = NSStringFromSelector(sel_movementAnimationResumeAcceleration);
  v665 = [v248 rowWithTitle:@"Resume Acceleration" valueKeyPath:v666];
  v664 = [v665 minValue:0.1 maxValue:5.0];
  v1265[4] = v664;
  v663 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1265 count:5];
  v662 = [v242 sectionWithRows:v663 title:@"Movement Animations"];
  v1286[20] = v662;
  v249 = (void *)MEMORY[0x1E4F94160];
  v250 = (void *)MEMORY[0x1E4F94108];
  v661 = NSStringFromSelector(sel_currentPPTPreset);
  v660 = [v250 rowWithTitle:@"Player Configuration(s)" valueKeyPath:v661];
  v659 = PXStoryPPTPresetPossibleValues();
  v658 = objc_msgSend(v660, "px_possibleValues:formatter:", v659, &__block_literal_global_1429);
  v1264[0] = v658;
  v251 = (void *)MEMORY[0x1E4F94108];
  v657 = NSStringFromSelector(sel_currentPPTSubpreset);
  v656 = [v251 rowWithTitle:@"Player Subconfiguration" valueKeyPath:v657];
  v655 = PXStoryPPTSubpresetPossibleValues();
  v654 = objc_msgSend(v656, "px_possibleValues:formatter:", v655, &__block_literal_global_1436);
  v1264[1] = v654;
  v252 = (void *)MEMORY[0x1E4F94108];
  v653 = NSStringFromSelector(sel_currentFeedPPTPreset);
  v652 = [v252 rowWithTitle:@"Feed Configuration(s)" valueKeyPath:v653];
  v651 = PXFeedPPTPresetPossibleValues();
  v650 = objc_msgSend(v652, "px_possibleValues:formatter:", v651, &__block_literal_global_1443);
  v1264[2] = v650;
  v253 = (void *)MEMORY[0x1E4F941F0];
  v649 = NSStringFromSelector(sel_showErrorAlertsDuringTestExecution);
  v648 = [v253 rowWithTitle:@"Show Error Alerts" valueKeyPath:v649];
  v1264[3] = v648;
  v647 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1264 count:4];
  v646 = [v249 sectionWithRows:v647 title:@"Performance Testing"];
  v1286[21] = v646;
  v254 = (void *)MEMORY[0x1E4F94160];
  v255 = (void *)MEMORY[0x1E4F941F0];
  v645 = NSStringFromSelector(sel_showMusicAndColorGradeEditor);
  v644 = [v255 rowWithTitle:@"Enable Edit Sheet" valueKeyPath:v645];
  v1263 = v644;
  v643 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1263 count:1];
  v642 = [v254 sectionWithRows:v643 title:@"Edit Sheet"];
  v1286[22] = v642;
  v256 = (void *)MEMORY[0x1E4F94160];
  v257 = (void *)MEMORY[0x1E4F941F0];
  v641 = NSStringFromSelector(sel_disableColorGrading);
  v640 = [v257 rowWithTitle:@"Disable Color Grading" valueKeyPath:v641];
  v1262[0] = v640;
  v258 = (void *)MEMORY[0x1E4F94108];
  v639 = NSStringFromSelector(sel_colorGradeEditorPreviewMode);
  v638 = [v258 rowWithTitle:@"Preview Mode" valueKeyPath:v639];
  v637 = [v638 possibleValues:&unk_1F02D51A0 titles:&unk_1F02D51B8];
  v1262[1] = v637;
  v259 = (void *)MEMORY[0x1E4F941D8];
  v636 = NSStringFromSelector(sel_colorGradeSmoothingFactor);
  v635 = [v259 rowWithTitle:@"Color Grade Smoothing Amount" valueKeyPath:v636];
  v634 = [v635 minValue:0.0 maxValue:1.0];
  v1262[2] = v634;
  v260 = (void *)MEMORY[0x1E4F941D8];
  v633 = NSStringFromSelector(sel_colorGradeSmoothingPasses);
  v632 = [v260 rowWithTitle:@"Color Grade Smoothing Passes" valueKeyPath:v633];
  v631 = [v632 minValue:0.0 maxValue:10.0];
  v630 = objc_msgSend(v631, "px_increment:", 1.0);
  v1262[3] = v630;
  v261 = (void *)MEMORY[0x1E4F941D8];
  v629 = NSStringFromSelector(sel_colorGradeBlendingFactor);
  v628 = [v261 rowWithTitle:@"Color Grade Neutral Blending" valueKeyPath:v629];
  v627 = [v628 minValue:0.0 maxValue:1.0];
  v1262[4] = v627;
  v626 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1262 count:5];
  v625 = [v256 sectionWithRows:v626 title:@"Color Grade"];
  v1286[23] = v625;
  v262 = (void *)MEMORY[0x1E4F94160];
  v263 = (void *)MEMORY[0x1E4F94108];
  v624 = NSStringFromSelector(sel_colorNormalizationMode);
  v623 = [v263 rowWithTitle:@"Mode" valueKeyPath:v624];
  v622 = [v1247 possibleNormalizationModes];
  v621 = objc_msgSend(v623, "px_possibleValues:formatter:", v622, &__block_literal_global_1509);
  v1261[0] = v621;
  v264 = (void *)MEMORY[0x1E4F94108];
  v620 = NSStringFromSelector(sel_colorNormalizationTechnique);
  v619 = [v264 rowWithTitle:@"Technique" valueKeyPath:v620];
  v618 = [v1247 possibleNormalizationTechniques];
  v617 = objc_msgSend(v619, "px_possibleValues:formatter:", v618, &__block_literal_global_1516);
  v1261[1] = v617;
  v265 = (void *)MEMORY[0x1E4F941F0];
  v616 = NSStringFromSelector(sel_enableScrubberColorNormalization);
  v615 = [v265 rowWithTitle:@"Scrubber" valueKeyPath:v616];
  v1261[2] = v615;
  v266 = (void *)MEMORY[0x1E4F941F0];
  v614 = NSStringFromSelector(sel_enableBrowseViewColorNormalization);
  v613 = [v266 rowWithTitle:@"Browse View" valueKeyPath:v614];
  v1261[3] = v613;
  v267 = (void *)MEMORY[0x1E4F941F0];
  v612 = NSStringFromSelector(sel_debugShowColorNormalizationValues);
  v611 = [v267 rowWithTitle:@"Show Values in HUD" valueKeyPath:v612];
  v1261[4] = v611;
  v268 = (void *)MEMORY[0x1E4F941F0];
  v610 = NSStringFromSelector(sel_enableFalseColorNormalization);
  v609 = [v268 rowWithTitle:@"False Colors" valueKeyPath:v610];
  v1261[5] = v609;
  v269 = (void *)MEMORY[0x1E4F941F0];
  v608 = NSStringFromSelector(sel_colorNormalizationUseColorCube);
  v607 = [v269 rowWithTitle:@"CI Adjustment Use Color Cube" valueKeyPath:v608];
  v1261[6] = v607;
  v270 = (void *)MEMORY[0x1E4F941D8];
  v606 = NSStringFromSelector(sel_colorNormalizationCubeEdgeSize);
  v605 = [v270 rowWithTitle:@"LUT Cube Size" valueKeyPath:v606];
  v604 = [v605 minValue:2.0 maxValue:64.0];
  v603 = objc_msgSend(v604, "px_increment:", 2.0);
  v1261[7] = v603;
  v271 = (void *)MEMORY[0x1E4F941F0];
  v602 = NSStringFromSelector(sel_enableColorNormalizationWithoutColorGrade);
  v601 = [v271 rowWithTitle:@"Apply to Original" valueKeyPath:v602];
  v1261[8] = v601;
  v272 = (void *)MEMORY[0x1E4F941D8];
  v600 = NSStringFromSelector(sel_colorNormalizationIntensity);
  v599 = [v272 rowWithTitle:@"Intensity" valueKeyPath:v600];
  v598 = [v599 minValue:0.0 maxValue:1.0];
  v1261[9] = v598;
  v273 = (void *)MEMORY[0x1E4F941F0];
  v597 = NSStringFromSelector(sel_reportColorNormalizationErrors);
  v596 = [v273 rowWithTitle:@"Report Errors" valueKeyPath:v597];
  v1261[10] = v596;
  v595 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1261 count:11];
  v594 = [v262 sectionWithRows:v595 title:@"Color Normalization"];
  v1286[24] = v594;
  v274 = (void *)MEMORY[0x1E4F94160];
  v275 = (void *)MEMORY[0x1E4F941F0];
  v593 = NSStringFromSelector(sel_wantsFullscreenFeedExperience);
  v592 = [v275 rowWithTitle:@"Fullscreen Experience" valueKeyPath:v593];
  v1260[0] = v592;
  v276 = (void *)MEMORY[0x1E4F941F0];
  v591 = NSStringFromSelector(sel_showFeedChromeOnHover);
  v590 = [v276 rowWithTitle:@"Show Chrome on Hover" valueKeyPath:v591];
  v1260[1] = v590;
  v277 = (void *)MEMORY[0x1E4F941F0];
  v589 = NSStringFromSelector(sel_wantsInlinePlayback);
  v588 = [v277 rowWithTitle:@"Inline Playback" valueKeyPath:v589];
  v1260[2] = v588;
  v278 = (void *)MEMORY[0x1E4F941D8];
  v587 = NSStringFromSelector(sel_pressedScale);
  v586 = [v278 rowWithTitle:@"Pressed Scale" valueKeyPath:v587];
  v585 = [v586 minValue:0.7 maxValue:1.0];
  v1260[3] = v585;
  v279 = (void *)MEMORY[0x1E4F941F0];
  v584 = NSStringFromSelector(sel_isFeedHUDVisible);
  v583 = [v279 rowWithTitle:@"HUD" valueKeyPath:v584];
  v1260[4] = v583;
  v280 = (void *)MEMORY[0x1E4F94108];
  v582 = NSStringFromSelector(sel_feedHUDType);
  v581 = [v280 rowWithTitle:@"HUD Type" valueKeyPath:v582];
  v1248 = [v1247 possibleFeedHUDTypes];
  v579 = objc_msgSend(v581, "px_possibleValues:formatter:", v1248, &__block_literal_global_1590);
  v281 = (void *)MEMORY[0x1E4F28F60];
  v580 = NSStringFromSelector(sel_isFeedHUDVisible);
  v578 = objc_msgSend(v281, "predicateWithFormat:", @"%K != 0", v580);
  v577 = [v579 condition:v578];
  v1260[5] = v577;
  v282 = (void *)MEMORY[0x1E4F941D8];
  v576 = NSStringFromSelector(sel_feedInitialLimit);
  v575 = [v282 rowWithTitle:@"Initial Memories" valueKeyPath:v576];
  v574 = [v575 minValue:0.0 maxValue:1000.0];
  v573 = objc_msgSend(v574, "px_increment:", 100.0);
  v1260[6] = v573;
  v283 = (void *)MEMORY[0x1E4F941D8];
  v572 = NSStringFromSelector(sel_feedCardLandscapeAspectRatio);
  v571 = [v283 rowWithTitle:@"Landscape A/R" valueKeyPath:v572];
  v570 = [v571 minValue:1.0 maxValue:2.0];
  v1260[7] = v570;
  v284 = (void *)MEMORY[0x1E4F941D8];
  v569 = NSStringFromSelector(sel_feedCardPortraitAspectRatio);
  v568 = [v284 rowWithTitle:@"Portrait A/R" valueKeyPath:v569];
  v567 = [v568 minValue:0.5 maxValue:1.0];
  v1260[8] = v567;
  v285 = (void *)MEMORY[0x1E4F941D8];
  v566 = NSStringFromSelector(sel_feedCardWideLandscapeAspectRatio);
  v565 = [v285 rowWithTitle:@"Wide Landscape A/R" valueKeyPath:v566];
  v564 = [v565 minValue:2.0 maxValue:4.0];
  v1260[9] = v564;
  v286 = (void *)MEMORY[0x1E4F941D8];
  v563 = NSStringFromSelector(sel_feedItemCornerRadius);
  v562 = [v286 rowWithTitle:@"Item Corner Radius" valueKeyPath:v563];
  v561 = [v562 minValue:0.0 maxValue:30.0];
  v1260[10] = v561;
  v287 = (void *)MEMORY[0x1E4F941F0];
  v560 = NSStringFromSelector(sel_useSimpleOverlayFeedLayout);
  v559 = [v287 rowWithTitle:@"Use Simple Overlay Feed Layout" valueKeyPath:v560];
  v1260[11] = v559;
  v288 = (void *)MEMORY[0x1E4F941F0];
  v558 = NSStringFromSelector(sel_wantsFeedItemShadow);
  v557 = [v288 rowWithTitle:@"Item Drop Shadow" valueKeyPath:v558];
  v1260[12] = v557;
  v289 = (void *)MEMORY[0x1E4F941D8];
  v556 = NSStringFromSelector(sel_inlinePlaybackCriticalInsetX);
  v555 = [v289 rowWithTitle:@"Playback Inset X" valueKeyPath:v556];
  v554 = [v555 minValue:0.0 maxValue:1000.0];
  v553 = objc_msgSend(v554, "px_increment:", 1.0);
  v1260[13] = v553;
  v290 = (void *)MEMORY[0x1E4F941D8];
  v552 = NSStringFromSelector(sel_inlinePlaybackCriticalInsetY);
  v551 = [v290 rowWithTitle:@"Playback Inset Y" valueKeyPath:v552];
  v550 = [v551 minValue:0.0 maxValue:1000.0];
  v549 = objc_msgSend(v550, "px_increment:", 1.0);
  v1260[14] = v549;
  v291 = (void *)MEMORY[0x1E4F941F0];
  v548 = NSStringFromSelector(sel_useFeedPlaceholderItems);
  v547 = [v291 rowWithTitle:@"Placeholder Items" valueKeyPath:v548];
  v1260[15] = v547;
  v546 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1260 count:16];
  v545 = [v274 sectionWithRows:v546 title:@"For You & Feed"];
  v1286[25] = v545;
  v292 = (void *)MEMORY[0x1E4F94160];
  v293 = (void *)MEMORY[0x1E4F941F0];
  v544 = NSStringFromSelector(sel_allowsFormSheetPresentation);
  v543 = [v293 rowWithTitle:@"Sheet Presentation" valueKeyPath:v544];
  v1259[0] = v543;
  v294 = (void *)MEMORY[0x1E4F94108];
  NSStringFromSelector(sel_swipeDownBehavior);
  v838 = (char *)objc_claimAutoreleasedReturnValue();
  v542 = [v294 rowWithTitle:@"Swipe Down" valueKeyPath:v838];
  v541 = [v542 possibleValues:&unk_1F02D51D0 titles:&unk_1F02D51E8];
  v1259[1] = v541;
  v295 = (void *)MEMORY[0x1E4F941D8];
  v540 = NSStringFromSelector(sel_swipeDownSignificantDuration);
  v539 = [v295 rowWithTitle:@"Significant Duration" valueKeyPath:v540];
  v538 = [v539 minValue:0.0 maxValue:0.5];
  v537 = objc_msgSend(v538, "px_increment:", 0.01);
  v536 = [v537 condition:v1249];
  v1259[2] = v536;
  v296 = (void *)MEMORY[0x1E4F941D8];
  v535 = NSStringFromSelector(sel_swipeDownDismissalDistanceThreshold);
  v534 = [v296 rowWithTitle:@"Distance Threshold" valueKeyPath:v535];
  v533 = [v534 minValue:0.0 maxValue:600.0];
  v532 = objc_msgSend(v533, "px_increment:", 20.0);
  v531 = [v532 condition:v1249];
  v1259[3] = v531;
  v297 = (void *)MEMORY[0x1E4F941D8];
  v530 = NSStringFromSelector(sel_swipeDownDismissalDelay);
  v529 = [v297 rowWithTitle:@"Delay" valueKeyPath:v530];
  v528 = [v529 minValue:0.0 maxValue:2.0];
  v527 = objc_msgSend(v528, "px_increment:", 0.1);
  v526 = [v527 condition:v1249];
  v1259[4] = v526;
  v298 = (void *)MEMORY[0x1E4F941D8];
  v525 = NSStringFromSelector(sel_swipeDownThresholdFadeDuration);
  v524 = [v298 rowWithTitle:@"Fade Duration" valueKeyPath:v525];
  v523 = [v524 minValue:0.0 maxValue:2.0];
  v522 = objc_msgSend(v523, "px_increment:", 0.1);
  v521 = [v522 condition:v1249];
  v1259[5] = v521;
  v299 = (void *)MEMORY[0x1E4F941F0];
  v520 = NSStringFromSelector(sel_needs79067616Workaround);
  v519 = [v299 rowWithTitle:@"79067616 Workaround" valueKeyPath:v520];
  v1259[6] = v519;
  v518 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1259 count:7];
  v517 = [v292 sectionWithRows:v518 title:@"View Controller Transition"];
  v1286[26] = v517;
  v300 = (void *)MEMORY[0x1E4F94160];
  v301 = (void *)MEMORY[0x1E4F941D8];
  v516 = NSStringFromSelector(sel_autoEditPortraitAreaMin);
  v515 = [v301 rowWithTitle:@"Portrait Min Face Area" valueKeyPath:v516];
  v514 = [v515 minValue:0.0 maxValue:1.0];
  v1258[0] = v514;
  v302 = (void *)MEMORY[0x1E4F941D8];
  v513 = NSStringFromSelector(sel_autoEditPortraitAspectLargeVerticalFaceAreaMin);
  v512 = [v302 rowWithTitle:@"Portrait Aspect Asset Min Large Vertical Face Area" valueKeyPath:v513];
  v511 = [v512 minValue:0.0 maxValue:1.0];
  v1258[1] = v511;
  v303 = (void *)MEMORY[0x1E4F941D8];
  v510 = NSStringFromSelector(sel_autoEditModuleLengthMax);
  v509 = [v303 rowWithTitle:@"Module Max Length" valueKeyPath:v510];
  v508 = [v509 minValue:1.0 maxValue:20.0];
  v507 = objc_msgSend(v508, "px_increment:", 1.0);
  v1258[2] = v507;
  v304 = (void *)MEMORY[0x1E4F941D8];
  v506 = NSStringFromSelector(sel_autoEditRotateMotionMax);
  v505 = [v304 rowWithTitle:@"Rotate Max Length" valueKeyPath:v506];
  v504 = [v505 minValue:1.0 maxValue:20.0];
  v503 = objc_msgSend(v504, "px_increment:", 1.0);
  v1258[3] = v503;
  v305 = (void *)MEMORY[0x1E4F941D8];
  v502 = NSStringFromSelector(sel_autoEditEmptySpaceLengthMax);
  v501 = [v305 rowWithTitle:@"Empty Space Max" valueKeyPath:v502];
  v500 = [v501 minValue:1.0 maxValue:20.0];
  v499 = objc_msgSend(v500, "px_increment:", 1.0);
  v1258[4] = v499;
  v306 = (void *)MEMORY[0x1E4F941D8];
  v498 = NSStringFromSelector(sel_autoEditDiptychCropAspectMax);
  v497 = [v306 rowWithTitle:@"2-Up Crop Ratio" valueKeyPath:v498];
  v496 = [v497 minValue:1.0 maxValue:10.0];
  v1258[5] = v496;
  v307 = (void *)MEMORY[0x1E4F941D8];
  v495 = NSStringFromSelector(sel_autoEditTriptychCropAspectMax);
  v494 = [v307 rowWithTitle:@"3-Up Crop Ratio" valueKeyPath:v495];
  v493 = [v494 minValue:1.0 maxValue:10.0];
  v1258[6] = v493;
  v308 = (void *)MEMORY[0x1E4F941D8];
  v492 = NSStringFromSelector(sel_autoEditProductionSimulatedDelay);
  v491 = [v308 rowWithTitle:@"Simulated Delay" valueKeyPath:v492];
  v490 = [v491 minValue:0.0 maxValue:30.0];
  v489 = objc_msgSend(v490, "px_increment:", 1.0);
  v1258[7] = v489;
  v309 = (void *)MEMORY[0x1E4F941F0];
  v488 = NSStringFromSelector(sel_autoEditDisableNUp);
  v487 = [v309 rowWithTitle:@"Disable N-Up" valueKeyPath:v488];
  v1258[8] = v487;
  v310 = (void *)MEMORY[0x1E4F94108];
  v486 = NSStringFromSelector(sel_disabledClipMotionStyles);
  v485 = [v310 rowWithTitle:@"Disabled Motion Styles" valueKeyPath:v486];
  v484 = [v485 possibleValues:&unk_1F02D5200 titles:&unk_1F02D5218];
  v1258[9] = v484;
  v311 = (void *)MEMORY[0x1E4F94108];
  v483 = NSStringFromSelector(sel_autoEditSongPaceOverride);
  v482 = [v311 rowWithTitle:@"Song Pace" valueKeyPath:v483];
  v481 = [v482 possibleValues:&unk_1F02D5230 titles:&unk_1F02D5248];
  v1258[10] = v481;
  v312 = (void *)MEMORY[0x1E4F941F0];
  v480 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v479 = [v312 rowWithTitle:@"Use Moment Recipes" valueKeyPath:v480];
  v1258[11] = v479;
  v313 = (void *)MEMORY[0x1E4F941D8];
  v478 = NSStringFromSelector(sel_scaleRecipeRelativeFrequency);
  v477 = [v313 rowWithTitle:@"Scale Recipe Relative Frequency" valueKeyPath:v478];
  v475 = [v477 minValue:0.0 maxValue:1.0];
  v314 = (void *)MEMORY[0x1E4F28F60];
  v476 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v474 = objc_msgSend(v314, "predicateWithFormat:", @"%K != 0", v476);
  v473 = [v475 condition:v474];
  v1258[12] = v473;
  v315 = (void *)MEMORY[0x1E4F941D8];
  v472 = NSStringFromSelector(sel_panRecipeRelativeFrequency);
  v471 = [v315 rowWithTitle:@"Pan Recipe Relative Frequency" valueKeyPath:v472];
  v469 = [v471 minValue:0.0 maxValue:1.0];
  v316 = (void *)MEMORY[0x1E4F28F60];
  v470 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v468 = objc_msgSend(v316, "predicateWithFormat:", @"%K != 0", v470);
  v467 = [v469 condition:v468];
  v1258[13] = v467;
  v317 = (void *)MEMORY[0x1E4F941D8];
  v466 = NSStringFromSelector(sel_exposeToBlackRecipeRelativeFrequency);
  v465 = [v317 rowWithTitle:@"Exposure-Bleed/Fade-to-Black Recipe Relative Frequency" valueKeyPath:v466];
  v463 = [v465 minValue:0.0 maxValue:1.0];
  v318 = (void *)MEMORY[0x1E4F28F60];
  v464 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v462 = objc_msgSend(v318, "predicateWithFormat:", @"%K != 0", v464);
  v461 = [v463 condition:v462];
  v1258[14] = v461;
  v319 = (void *)MEMORY[0x1E4F941D8];
  v460 = NSStringFromSelector(sel_autoEditSceneConfidenceThreshold);
  v459 = [v319 rowWithTitle:@"Scene Confidence Threshold" valueKeyPath:v460];
  v457 = [v459 minValue:0.0 maxValue:1.0];
  v320 = (void *)MEMORY[0x1E4F28F60];
  v458 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v456 = objc_msgSend(v320, "predicateWithFormat:", @"%K != 0", v458);
  v455 = [v457 condition:v456];
  v1258[15] = v455;
  v321 = (void *)MEMORY[0x1E4F941D8];
  v454 = NSStringFromSelector(sel_autoEditHighCurationScoreThreshold);
  v453 = [v321 rowWithTitle:@"High Curation Score Threshold" valueKeyPath:v454];
  v451 = [v453 minValue:0.0 maxValue:1.0];
  v322 = (void *)MEMORY[0x1E4F28F60];
  v452 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v450 = objc_msgSend(v322, "predicateWithFormat:", @"%K != 0", v452);
  v449 = [v451 condition:v450];
  v1258[16] = v449;
  v323 = (void *)MEMORY[0x1E4F941D8];
  v448 = NSStringFromSelector(sel_autoEditDoublePlaceMultiplier);
  v447 = [v323 rowWithTitle:@"Double-Pace Multiplier" valueKeyPath:v448];
  v445 = [v447 minValue:0.1 maxValue:1.0];
  v324 = (void *)MEMORY[0x1E4F28F60];
  v446 = NSStringFromSelector(sel_autoEditUseMomentRecipes);
  v444 = objc_msgSend(v324, "predicateWithFormat:", @"%K != 0", v446);
  v443 = [v445 condition:v444];
  v1258[17] = v443;
  v442 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1258 count:18];
  v441 = [v300 sectionWithRows:v442 title:@"Auto Edit"];
  v1286[27] = v441;
  v325 = (void *)MEMORY[0x1E4F94160];
  v326 = (void *)MEMORY[0x1E4F941D8];
  v440 = NSStringFromSelector(sel_titleRegularPaddingBottomScale);
  v439 = [v326 rowWithTitle:@"Full Screen Padding Bottom Scale" valueKeyPath:v440];
  v438 = [v439 minValue:0.0 maxValue:1.0];
  v1257[0] = v438;
  v327 = (void *)MEMORY[0x1E4F941D8];
  v437 = NSStringFromSelector(sel_titlePaddingTopScale);
  v436 = [v327 rowWithTitle:@"Top Padding Scale" valueKeyPath:v437];
  v435 = [v436 minValue:0.0 maxValue:1.0];
  v1257[1] = v435;
  v328 = (void *)MEMORY[0x1E4F941D8];
  v434 = NSStringFromSelector(sel_titleWidthMin);
  v433 = [v328 rowWithTitle:@"Width Min" valueKeyPath:v434];
  v432 = [v433 minValue:0.0 maxValue:300.0];
  v1257[2] = v432;
  v329 = (void *)MEMORY[0x1E4F941D8];
  v431 = NSStringFromSelector(sel_titleWidthMax);
  v430 = [v329 rowWithTitle:@"Width Max" valueKeyPath:v431];
  v429 = [v430 minValue:0.0 maxValue:900.0];
  v1257[3] = v429;
  v330 = (void *)MEMORY[0x1E4F941D8];
  v428 = NSStringFromSelector(sel_titleMinimumScale);
  v427 = [v330 rowWithTitle:@"Title Min Scale" valueKeyPath:v428];
  v426 = [v427 minValue:0.0 maxValue:1.0];
  v1257[4] = v426;
  v331 = (void *)MEMORY[0x1E4F941D8];
  v425 = NSStringFromSelector(sel_subtitleMinimumScale);
  v424 = [v331 rowWithTitle:@"Subtitle Min Scale" valueKeyPath:v425];
  v423 = [v424 minValue:0.0 maxValue:1.0];
  v1257[5] = v423;
  v332 = (void *)MEMORY[0x1E4F941F0];
  v422 = NSStringFromSelector(sel_titleUseCenterAlignment);
  v421 = [v332 rowWithTitle:@"Use Center Alignment" valueKeyPath:v422];
  v1257[6] = v421;
  v333 = (void *)MEMORY[0x1E4F941D8];
  v420 = NSStringFromSelector(sel_titleFarthestDistanceThreshold);
  v419 = [v333 rowWithTitle:@"Farthest Distance Threshold" valueKeyPath:v420];
  v418 = [v419 minValue:0.0 maxValue:2.0];
  v1257[7] = v418;
  v334 = (void *)MEMORY[0x1E4F941F0];
  v417 = NSStringFromSelector(sel_enableTitlePositioningLogs);
  v416 = [v334 rowWithTitle:@"Enable Title Positioning Logs" valueKeyPath:v417];
  v1257[8] = v416;
  v335 = (void *)MEMORY[0x1E4F94108];
  v415 = NSStringFromSelector(sel_verticalTextMode);
  v414 = [v335 rowWithTitle:@"Vertical Text Mode" valueKeyPath:v415];
  v413 = [v414 possibleValues:&unk_1F02D5260 titles:&unk_1F02D5278];
  v1257[9] = v413;
  v336 = (void *)MEMORY[0x1E4F94108];
  v412 = NSStringFromSelector(sel_kashidaTextMode);
  v411 = [v336 rowWithTitle:@"Kashida Mode" valueKeyPath:v412];
  v410 = [v411 possibleValues:&unk_1F02D5290 titles:&unk_1F02D52A8];
  v1257[10] = v410;
  v337 = (void *)MEMORY[0x1E4F941D8];
  v409 = NSStringFromSelector(sel_titleMaximumNumberOfLines);
  v408 = [v337 rowWithTitle:@"Title Max num Of Lines" valueKeyPath:v409];
  v407 = [v408 minValue:1.0 maxValue:5.0];
  v406 = objc_msgSend(v407, "px_increment:", 1.0);
  v1257[11] = v406;
  v338 = (void *)MEMORY[0x1E4F941F0];
  v405 = NSStringFromSelector(sel_useReferenceWidthBasedTitleLayout);
  v404 = [v338 rowWithTitle:@"Use Reference Width Based Title Layout" valueKeyPath:v405];
  v1257[12] = v404;
  v339 = (void *)MEMORY[0x1E4F941D8];
  v403 = NSStringFromSelector(sel_titleReferenceWidthPortrait);
  v402 = [v339 rowWithTitle:@"Reference Width Portrait" valueKeyPath:v403];
  v401 = [v402 minValue:0.0 maxValue:500.0];
  v1257[13] = v401;
  v340 = (void *)MEMORY[0x1E4F941D8];
  v400 = NSStringFromSelector(sel_titleReferenceWidthLandscape);
  v399 = [v340 rowWithTitle:@"Reference Width Landscape" valueKeyPath:v400];
  v398 = [v399 minValue:0.0 maxValue:500.0];
  v1257[14] = v398;
  v341 = (void *)MEMORY[0x1E4F941D8];
  v397 = NSStringFromSelector(sel_titleFullScreenPortraitWidthScale);
  v396 = [v341 rowWithTitle:@"Full Screen Portrait Width Scale" valueKeyPath:v397];
  v395 = [v396 minValue:0.0 maxValue:1.0];
  v1257[15] = v395;
  v342 = (void *)MEMORY[0x1E4F941D8];
  v394 = NSStringFromSelector(sel_titleFullScreenLandscapeWidthScale);
  v393 = [v342 rowWithTitle:@"Full Screen Landscape Width Scale" valueKeyPath:v394];
  v392 = [v393 minValue:0.0 maxValue:1.0];
  v1257[16] = v392;
  v343 = (void *)MEMORY[0x1E4F941D8];
  v391 = NSStringFromSelector(sel_titleFeedPortraitWidthScale);
  v390 = [v343 rowWithTitle:@"Feed Portrait Width Scale" valueKeyPath:v391];
  v389 = [v390 minValue:0.0 maxValue:1.0];
  v1257[17] = v389;
  v344 = (void *)MEMORY[0x1E4F941D8];
  v388 = NSStringFromSelector(sel_titleFeedLandscapeWidthScale);
  v387 = [v344 rowWithTitle:@"Feed Landscape Width Scale" valueKeyPath:v388];
  v386 = [v387 minValue:0.0 maxValue:1.0];
  v1257[18] = v386;
  v345 = (void *)MEMORY[0x1E4F941D8];
  v385 = NSStringFromSelector(sel_titleSizeScale);
  v384 = [v345 rowWithTitle:@"(Old Version)Full Screen Title Font Size Scale" valueKeyPath:v385];
  v383 = [v384 minValue:0.0 maxValue:4.0];
  v1257[19] = v383;
  v346 = (void *)MEMORY[0x1E4F941D8];
  v382 = NSStringFromSelector(sel_subtitleSizeScale);
  v381 = [v346 rowWithTitle:@"(Old Version)Full Screen Subtitle Font Size Scale" valueKeyPath:v382];
  v380 = [v381 minValue:0.0 maxValue:4.0];
  v1257[20] = v380;
  v347 = (void *)MEMORY[0x1E4F941F0];
  v379 = NSStringFromSelector(sel_simulateSlowTextLayout);
  v378 = [v347 rowWithTitle:@"Simulate Slow Layout" valueKeyPath:v379];
  v1257[21] = v378;
  v348 = (void *)MEMORY[0x1E4F94130];
  v377 = NSStringFromSelector(sel_chapterSettings);
  v376 = [v348 rowWithTitle:@"Chapters" childSettingsKeyPath:v377];
  v1257[22] = v376;
  v375 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1257 count:23];
  v374 = [v325 sectionWithRows:v375 title:@"Titles"];
  v1286[28] = v374;
  v349 = (void *)MEMORY[0x1E4F94160];
  v350 = (void *)MEMORY[0x1E4F941F0];
  v373 = NSStringFromSelector(sel_showTVPreviewInDiagnostics);
  v372 = [v350 rowWithTitle:@"Show TV Preview in Diagnostics" valueKeyPath:v373];
  v1256[0] = v372;
  v351 = (void *)MEMORY[0x1E4F941D8];
  v371 = NSStringFromSelector(sel_curationScorePercentileThreshold);
  v370 = [v351 rowWithTitle:@"Curation Score Threshold" valueKeyPath:v371];
  v369 = [v370 minValue:0.0 maxValue:1.0];
  v368 = objc_msgSend(v369, "px_increment:", 0.05);
  v1256[1] = v368;
  v352 = (void *)MEMORY[0x1E4F941D8];
  v367 = NSStringFromSelector(sel_aestheticsScorePercentileThreshold);
  v366 = [v352 rowWithTitle:@"Aesthetic Score Threshold" valueKeyPath:v367];
  v353 = [v366 minValue:0.0 maxValue:1.0];
  v354 = objc_msgSend(v353, "px_increment:", 0.05);
  v1256[2] = v354;
  v355 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1256 count:3];
  v356 = [v349 sectionWithRows:v355 title:@"TV Preview"];
  v1286[29] = v356;
  v357 = (void *)MEMORY[0x1E4F94160];
  v358 = (void *)MEMORY[0x1E4F941F0];
  v359 = NSStringFromSelector(sel_useCommonActionInfrastructureForActionMenu);
  v360 = [v358 rowWithTitle:@"Common Infra. for Menu" valueKeyPath:v359];
  v1255 = v360;
  v361 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1255 count:1];
  v362 = [v357 sectionWithRows:v361 title:@"Actions"];
  v1286[30] = v362;
  v363 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v1286[31] = v363;
  v364 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1286 count:32];
  id v951 = [v950 moduleWithTitle:@"Interactive Memories" contents:v364];

  return v951;
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  if ((unint64_t)(v2 - 1) > 0x12) {
    return @"None";
  }
  else {
    return off_1E5DC50E0[v2 - 1];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  id v3 = @"??";
  if (v2 == 1) {
    id v3 = @"CoreImage Adjustment";
  }
  if (v2) {
    return v3;
  }
  else {
    return @"Shader LUT";
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_13(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 4) {
    return @"??";
  }
  else {
    return off_1E5DB42E8[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_12(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3) {
    return @"??";
  }
  else {
    return off_1E5DD04C0[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_11(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3) {
    return @"??";
  }
  else {
    return off_1E5DB70D0[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 7) {
    return @"??";
  }
  else {
    return off_1E5DB7090[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 6) {
    return @"??";
  }
  else {
    return off_1E5DB2448[v2];
  }
}

uint64_t __47__PXStorySettings_UI__settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  unint64_t v2 = NSString;
  [a2 floatValue];
  return objc_msgSend(v2, "stringWithFormat:", @"%d%%", (int)(float)(v3 * 100.0));
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3) {
    return @"??";
  }
  else {
    return off_1E5DB4340[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_6_1027(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3) {
    return @"??";
  }
  else {
    return off_1E5DB4340[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_5_1014(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 4) {
    return @"??";
  }
  else {
    return off_1E5DC05A0[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_4_976(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 5) {
    return @"??";
  }
  else {
    return off_1E5DB4310[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_3_968(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 5) {
    return @"??";
  }
  else {
    return off_1E5DB4310[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_2_960(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 5) {
    return @"??";
  }
  else {
    return off_1E5DB4310[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_952(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 5) {
    return @"??";
  }
  else {
    return off_1E5DB4310[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 5) {
    return @"??";
  }
  else {
    return off_1E5DB43B0[v2];
  }
}

uint64_t __47__PXStorySettings_UI__settingsControllerModule__block_invoke_755(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(PXFlexMusicViewController);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v3 presentViewController:v5 animated:1 completion:0];

  return 1;
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_3_568(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 9) {
    return @"??";
  }
  else {
    return off_1E5DB4360[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_2_560(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 9) {
    return @"??";
  }
  else {
    return off_1E5DB4360[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_502(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3) {
    return @"??";
  }
  else {
    return off_1E5DB42C8[v2];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  char v2 = [a2 integerValue];
  return PXStoryPaperTrailOptionsDescription(v2);
}

void __47__PXStorySettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PXSoftLinkedProtoRootSettingsLoadIfNecessary(1);
  id v5 = [NSClassFromString(&cfstr_Pxprotomemorie_0.isa) sharedInstance];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1EC0], "px_viewControllerWithSettings:", v5);
  [v2 pushViewController:v4 animated:1];
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  if ((unint64_t)(v2 - 1) > 0x12) {
    return @"None";
  }
  else {
    return off_1E5DC50E0[v2 - 1];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  if ((unint64_t)(v2 - 1) > 0x12) {
    return @"None";
  }
  else {
    return off_1E5DC50E0[v2 - 1];
  }
}

__CFString *__47__PXStorySettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 2) {
    return @"??";
  }
  else {
    return off_1E5DB42B0[v2];
  }
}

@end