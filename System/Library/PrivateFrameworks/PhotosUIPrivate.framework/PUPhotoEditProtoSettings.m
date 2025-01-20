@interface PUPhotoEditProtoSettings
+ (BOOL)isCapableOfLivePhotoRender;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)affectManuallyEditedSlidersOnly;
- (BOOL)allAssetsCanUseHDRPipeline;
- (BOOL)allowAnyPlugin;
- (BOOL)allowApertureRedEye;
- (BOOL)allowDisabledTools;
- (BOOL)allowMakePosterFrameForVideo;
- (BOOL)allowSpillMatteOnOlderPortraitV2Captures;
- (BOOL)allowSynchronousBatchRendering;
- (BOOL)alwaysAllowKeyPhotoEditing;
- (BOOL)alwaysShowDoneButton;
- (BOOL)alwaysShowValueWhenAdjustmentIsSelected;
- (BOOL)apertureSliderHasOffPosition;
- (BOOL)applyVideoOrientationAsMetadata;
- (BOOL)attemptEditExtensionUndoAutoSetup;
- (BOOL)autoCropEnabled;
- (BOOL)autoPerspectiveDisableOnFrontFacingCameraImages;
- (BOOL)autoPerspectiveDisableOnPanos;
- (BOOL)blurToolBackgrounds;
- (BOOL)changeLightingDisablesLive;
- (BOOL)cropMaskBlurred;
- (BOOL)debugTrackerMask;
- (BOOL)decodeMeteorPlusAsLinear;
- (BOOL)disableAsynchronousRenderingVideos;
- (BOOL)disableIOSurfacePortaitExport;
- (BOOL)disablePacked10BitPixelFormats;
- (BOOL)disableRenderMeteorPlusAsHDR;
- (BOOL)disableTimelineAnimations;
- (BOOL)disableVideoFilmstrip;
- (BOOL)editMenuEnabled;
- (BOOL)enableCoreImageDebugInputs;
- (BOOL)enableCoreImageDebugIntermediates;
- (BOOL)enableCoreImageDebugMode;
- (BOOL)enableCoreImageDebugOutputs;
- (BOOL)enableCoreImageDebugTiming;
- (BOOL)enableDash5;
- (BOOL)enableDynamicVideoScaling;
- (BOOL)enableEnterEditCropAutoCalc;
- (BOOL)enableEnterEditDepthEffectAutoCalc;
- (BOOL)enableEnterEditFilterThumbnailGeneration;
- (BOOL)enableEnterEditPerspectiveAutoCalc;
- (BOOL)enableEnterEditPortraitAutoCalc;
- (BOOL)enableEnterEditSemanticStyleAutoCalc;
- (BOOL)enableEnterEditSmartColorAutoCalc;
- (BOOL)enableEnterEditSmartToneAutoCalc;
- (BOOL)enableFinalizerGesture;
- (BOOL)enableFlexRange;
- (BOOL)enableFuzzball;
- (BOOL)enableLiveVideoRender;
- (BOOL)enableLiveVideoRenderAtSetSize;
- (BOOL)enableNURenderJobDebug;
- (BOOL)enablePerfDebugHUD;
- (BOOL)enablePerfTTRButton;
- (BOOL)enableSelectiveCopyEdits;
- (BOOL)enableSemanticDevelopmentHUD;
- (BOOL)enableSemanticStyleInEdit;
- (BOOL)enableSpatialMediaEditing;
- (BOOL)enableVideoStabilizion;
- (BOOL)feedbackUIFCS;
- (BOOL)fetchAndSendScenePrintsForSliderNet;
- (BOOL)forceGlassesMatteOff;
- (BOOL)forceMeteorPlusPlus;
- (BOOL)forceSpillMatteOff;
- (BOOL)hideTrackersDuringPlayback;
- (BOOL)hideUIForInteractionEnabled;
- (BOOL)isStyleCaptureEnabled;
- (BOOL)lightModeEditor;
- (BOOL)loopBounceTrimAllowed;
- (BOOL)maintainCropAspectLockState;
- (BOOL)mediaViewDebugMode;
- (BOOL)nuRenderJobDebugCapture5PercentOfJobs;
- (BOOL)nuRenderJobDebugCaptureCanceledJobs;
- (BOOL)nuRenderJobDebugCaptureNodeCache;
- (BOOL)nuRenderJobDebugCaptureNodeGraphs;
- (BOOL)nuRenderJobDebugCaptureOnlyPerfStats;
- (BOOL)nuRenderJobDebugCapturePerfStatHistory;
- (BOOL)overrideCleanupHardwareCheck;
- (BOOL)overrideSemanticStylesHardwareCheck;
- (BOOL)overrideVideoEditability;
- (BOOL)pauseAfterMovingPlayhead;
- (BOOL)perspectiveViewDebugCropEnabled;
- (BOOL)previewOriginalTimesOut;
- (BOOL)renderBackfillBlue;
- (BOOL)renderZoomPurple;
- (BOOL)requireTapToShowMakePosterFrame;
- (BOOL)retouchDumpsCoreImageInputs;
- (BOOL)retouchEnablesSensitivityCheck;
- (BOOL)retouchPixellatesFaces;
- (BOOL)retouchShowVFXControls;
- (BOOL)retouchShowsBrushButton;
- (BOOL)retouchShowsFaceRects;
- (BOOL)retouchShowsIntersectedMasks;
- (BOOL)retouchShowsMaskBoundingBox;
- (BOOL)retouchShowsTargetPointBrushPoints;
- (BOOL)retouchStrokeDisableObjectStrokes;
- (BOOL)runNeutrinoSynchronously;
- (BOOL)shouldConstraintDpadValuesToGrid;
- (BOOL)shouldEnableStylesForProRaw;
- (BOOL)shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation;
- (BOOL)shouldUseFlipAnimationForValuePlatter;
- (BOOL)showAutoEnhanceAction;
- (BOOL)showFileRadarButtonForEditEntryOnInternalInstalls;
- (BOOL)showFrameNumberOnVideoScrubber;
- (BOOL)showHDRDebugAdjustment;
- (BOOL)showHDRDebugAdjustments;
- (BOOL)showHDRHeadroomControl;
- (BOOL)showResetToolButton;
- (BOOL)showRotateAction;
- (BOOL)showSemanticDevelopmentSwitch;
- (BOOL)showSmartBlackAndWhiteAdjustment;
- (BOOL)showStabilizationWatermark;
- (BOOL)showSuggestedKeyFrame;
- (BOOL)showVideoScrubberDebugOverlay;
- (BOOL)simulateDownload;
- (BOOL)simulateDownloadFailure;
- (BOOL)simulateEditEntryError;
- (BOOL)skipPHContentEditingInputDisplaySizeImage;
- (BOOL)smartCopyPasteCaptureTimeGating;
- (BOOL)smartCopyPasteReviewUIEnabled;
- (BOOL)swipeToExitEdit;
- (BOOL)synchronousLivePhotoStylesCopyPaste;
- (BOOL)synchronousStylesCopyPaste;
- (BOOL)tapTimelineToSeek;
- (BOOL)toolbarShadowsEnabled;
- (BOOL)useAsynchronousRenderingPhotos;
- (BOOL)useEditToastProgress;
- (double)adjustmentLabelPlatterAlpha;
- (double)autoPerspectiveMaxAngle;
- (double)autoPerspectiveMaxFaceSize;
- (double)autoPerspectiveMaxPitch;
- (double)autoPerspectiveMaxYaw;
- (double)autoStraightenMaxAngle;
- (double)cropRecomposeDelay;
- (double)cropSideMargins;
- (double)cropWheelSize;
- (double)hideUIForInteractionFadeInDuration;
- (double)hideUIForInteractionFadeOutDelay;
- (double)hideUIForInteractionFadeOutDuration;
- (double)mainToolbarShadowLength;
- (double)previewOriginalDuration;
- (double)secondaryToolbarShadowLength;
- (double)selectionRingStrokeWidth;
- (double)smartCopyPasteSimilarityGating;
- (double)strokeWidth;
- (double)trackBallSize;
- (double)ttrButtonDurationThreshold;
- (double)videoStabilizeMaxCropFraction;
- (id)parentSettings;
- (int64_t)cleanupMaskDisplayMode;
- (int64_t)renderPriority;
- (int64_t)simulatedEditingEntryErrorType;
- (int64_t)simulatedModelCatalogDownload;
- (unint64_t)videoCompositorDebugMode;
- (void)setAdjustmentLabelPlatterAlpha:(double)a3;
- (void)setAffectManuallyEditedSlidersOnly:(BOOL)a3;
- (void)setAllAssetsCanUseHDRPipeline:(BOOL)a3;
- (void)setAllowAnyPlugin:(BOOL)a3;
- (void)setAllowApertureRedEye:(BOOL)a3;
- (void)setAllowDisabledTools:(BOOL)a3;
- (void)setAllowMakePosterFrameForVideo:(BOOL)a3;
- (void)setAllowSpillMatteOnOlderPortraitV2Captures:(BOOL)a3;
- (void)setAllowSynchronousBatchRendering:(BOOL)a3;
- (void)setAlwaysAllowKeyPhotoEditing:(BOOL)a3;
- (void)setAlwaysShowDoneButton:(BOOL)a3;
- (void)setAlwaysShowValueWhenAdjustmentIsSelected:(BOOL)a3;
- (void)setApertureSliderHasOffPosition:(BOOL)a3;
- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3;
- (void)setAttemptEditExtensionUndoAutoSetup:(BOOL)a3;
- (void)setAutoCropEnabled:(BOOL)a3;
- (void)setAutoPerspectiveDisableOnFrontFacingCameraImages:(BOOL)a3;
- (void)setAutoPerspectiveDisableOnPanos:(BOOL)a3;
- (void)setAutoPerspectiveMaxAngle:(double)a3;
- (void)setAutoPerspectiveMaxFaceSize:(double)a3;
- (void)setAutoPerspectiveMaxPitch:(double)a3;
- (void)setAutoPerspectiveMaxYaw:(double)a3;
- (void)setAutoStraightenMaxAngle:(double)a3;
- (void)setBlurToolBackgrounds:(BOOL)a3;
- (void)setChangeLightingDisablesLive:(BOOL)a3;
- (void)setCleanupMaskDisplayMode:(int64_t)a3;
- (void)setCropMaskBlurred:(BOOL)a3;
- (void)setCropRecomposeDelay:(double)a3;
- (void)setCropSideMargins:(double)a3;
- (void)setCropWheelSize:(double)a3;
- (void)setDebugTrackerMask:(BOOL)a3;
- (void)setDecodeMeteorPlusAsLinear:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDisableAsynchronousRenderingVideos:(BOOL)a3;
- (void)setDisableIOSurfacePortaitExport:(BOOL)a3;
- (void)setDisablePacked10BitPixelFormats:(BOOL)a3;
- (void)setDisableRenderMeteorPlusAsHDR:(BOOL)a3;
- (void)setDisableTimelineAnimations:(BOOL)a3;
- (void)setDisableVideoFilmstrip:(BOOL)a3;
- (void)setEditMenuEnabled:(BOOL)a3;
- (void)setEnableCoreImageDebugInputs:(BOOL)a3;
- (void)setEnableCoreImageDebugIntermediates:(BOOL)a3;
- (void)setEnableCoreImageDebugMode:(BOOL)a3;
- (void)setEnableCoreImageDebugOutputs:(BOOL)a3;
- (void)setEnableCoreImageDebugTiming:(BOOL)a3;
- (void)setEnableDash5:(BOOL)a3;
- (void)setEnableDynamicVideoScaling:(BOOL)a3;
- (void)setEnableEnterEditCropAutoCalc:(BOOL)a3;
- (void)setEnableEnterEditDepthEffectAutoCalc:(BOOL)a3;
- (void)setEnableEnterEditFilterThumbnailGeneration:(BOOL)a3;
- (void)setEnableEnterEditPerspectiveAutoCalc:(BOOL)a3;
- (void)setEnableEnterEditPortraitAutoCalc:(BOOL)a3;
- (void)setEnableEnterEditSemanticStyleAutoCalc:(BOOL)a3;
- (void)setEnableEnterEditSmartColorAutoCalc:(BOOL)a3;
- (void)setEnableEnterEditSmartToneAutoCalc:(BOOL)a3;
- (void)setEnableFinalizerGesture:(BOOL)a3;
- (void)setEnableFlexRange:(BOOL)a3;
- (void)setEnableFuzzball:(BOOL)a3;
- (void)setEnableLiveVideoRender:(BOOL)a3;
- (void)setEnableLiveVideoRenderAtSetSize:(BOOL)a3;
- (void)setEnableNURenderJobDebug:(BOOL)a3;
- (void)setEnablePerfDebugHUD:(BOOL)a3;
- (void)setEnablePerfTTRButton:(BOOL)a3;
- (void)setEnableSelectiveCopyEdits:(BOOL)a3;
- (void)setEnableSemanticDevelopmentHUD:(BOOL)a3;
- (void)setEnableSemanticStyleInEdit:(BOOL)a3;
- (void)setEnableSpatialMediaEditing:(BOOL)a3;
- (void)setEnableVideoStabilizion:(BOOL)a3;
- (void)setFeedbackUIFCS:(BOOL)a3;
- (void)setFetchAndSendScenePrintsForSliderNet:(BOOL)a3;
- (void)setForceGlassesMatteOff:(BOOL)a3;
- (void)setForceMeteorPlusPlus:(BOOL)a3;
- (void)setForceSpillMatteOff:(BOOL)a3;
- (void)setHideTrackersDuringPlayback:(BOOL)a3;
- (void)setHideUIForInteractionEnabled:(BOOL)a3;
- (void)setHideUIForInteractionFadeInDuration:(double)a3;
- (void)setHideUIForInteractionFadeOutDelay:(double)a3;
- (void)setHideUIForInteractionFadeOutDuration:(double)a3;
- (void)setLightModeEditor:(BOOL)a3;
- (void)setLoopBounceTrimAllowed:(BOOL)a3;
- (void)setMainToolbarShadowLength:(double)a3;
- (void)setMaintainCropAspectLockState:(BOOL)a3;
- (void)setMediaViewDebugMode:(BOOL)a3;
- (void)setNuRenderJobDebugCapture5PercentOfJobs:(BOOL)a3;
- (void)setNuRenderJobDebugCaptureCanceledJobs:(BOOL)a3;
- (void)setNuRenderJobDebugCaptureNodeCache:(BOOL)a3;
- (void)setNuRenderJobDebugCaptureNodeGraphs:(BOOL)a3;
- (void)setNuRenderJobDebugCaptureOnlyPerfStats:(BOOL)a3;
- (void)setNuRenderJobDebugCapturePerfStatHistory:(BOOL)a3;
- (void)setOverrideCleanupHardwareCheck:(BOOL)a3;
- (void)setOverrideSemanticStylesHardwareCheck:(BOOL)a3;
- (void)setOverrideVideoEditability:(BOOL)a3;
- (void)setPauseAfterMovingPlayhead:(BOOL)a3;
- (void)setPerspectiveViewDebugCropEnabled:(BOOL)a3;
- (void)setPreviewOriginalDuration:(double)a3;
- (void)setPreviewOriginalTimesOut:(BOOL)a3;
- (void)setRenderBackfillBlue:(BOOL)a3;
- (void)setRenderPriority:(int64_t)a3;
- (void)setRenderZoomPurple:(BOOL)a3;
- (void)setRequireTapToShowMakePosterFrame:(BOOL)a3;
- (void)setRetouchDumpsCoreImageInputs:(BOOL)a3;
- (void)setRetouchEnablesSensitivityCheck:(BOOL)a3;
- (void)setRetouchPixellatesFaces:(BOOL)a3;
- (void)setRetouchShowVFXControls:(BOOL)a3;
- (void)setRetouchShowsBrushButton:(BOOL)a3;
- (void)setRetouchShowsFaceRects:(BOOL)a3;
- (void)setRetouchShowsIntersectedMasks:(BOOL)a3;
- (void)setRetouchShowsMaskBoundingBox:(BOOL)a3;
- (void)setRetouchShowsTargetPointBrushPoints:(BOOL)a3;
- (void)setRetouchStrokeDisableObjectStrokes:(BOOL)a3;
- (void)setRunNeutrinoSynchronously:(BOOL)a3;
- (void)setSecondaryToolbarShadowLength:(double)a3;
- (void)setSelectionRingStrokeWidth:(double)a3;
- (void)setShouldConstraintDpadValuesToGrid:(BOOL)a3;
- (void)setShouldEnableStylesForProRaw:(BOOL)a3;
- (void)setShouldMoveToolbarToRevealStylesDPadInLandscapeOrientation:(BOOL)a3;
- (void)setShouldUseFlipAnimationForValuePlatter:(BOOL)a3;
- (void)setShowAutoEnhanceAction:(BOOL)a3;
- (void)setShowFileRadarButtonForEditEntryOnInternalInstalls:(BOOL)a3;
- (void)setShowFrameNumberOnVideoScrubber:(BOOL)a3;
- (void)setShowHDRDebugAdjustments:(BOOL)a3;
- (void)setShowHDRHeadroomControl:(BOOL)a3;
- (void)setShowResetToolButton:(BOOL)a3;
- (void)setShowRotateAction:(BOOL)a3;
- (void)setShowSemanticDevelopmentSwitch:(BOOL)a3;
- (void)setShowSmartBlackAndWhiteAdjustment:(BOOL)a3;
- (void)setShowStabilizationWatermark:(BOOL)a3;
- (void)setShowSuggestedKeyFrame:(BOOL)a3;
- (void)setShowVideoScrubberDebugOverlay:(BOOL)a3;
- (void)setSimulateDownload:(BOOL)a3;
- (void)setSimulateDownloadFailure:(BOOL)a3;
- (void)setSimulateEditEntryError:(BOOL)a3;
- (void)setSimulatedEditingEntryErrorType:(int64_t)a3;
- (void)setSimulatedModelCatalogDownload:(int64_t)a3;
- (void)setSkipPHContentEditingInputDisplaySizeImage:(BOOL)a3;
- (void)setSmartCopyPasteCaptureTimeGating:(BOOL)a3;
- (void)setSmartCopyPasteReviewUIEnabled:(BOOL)a3;
- (void)setSmartCopyPasteSimilarityGating:(double)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setSwipeToExitEdit:(BOOL)a3;
- (void)setSynchronousLivePhotoStylesCopyPaste:(BOOL)a3;
- (void)setSynchronousStylesCopyPaste:(BOOL)a3;
- (void)setTapTimelineToSeek:(BOOL)a3;
- (void)setToolbarShadowsEnabled:(BOOL)a3;
- (void)setTrackBallSize:(double)a3;
- (void)setTtrButtonDurationThreshold:(double)a3;
- (void)setUseAsynchronousRenderingPhotos:(BOOL)a3;
- (void)setUseEditToastProgress:(BOOL)a3;
- (void)setVideoCompositorDebugMode:(unint64_t)a3;
- (void)setVideoStabilizeMaxCropFraction:(double)a3;
- (void)updateCoreImageDebug;
@end

@implementation PUPhotoEditProtoSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditProtoSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(PUPhotoEditProtoSettings *)self setEnableVideoStabilizion:0];
  [(PUPhotoEditProtoSettings *)self setVideoStabilizeMaxCropFraction:0.2];
  [(PUPhotoEditProtoSettings *)self setEnableFinalizerGesture:0];
  [(PUPhotoEditProtoSettings *)self setUseAsynchronousRenderingPhotos:0];
  [(PUPhotoEditProtoSettings *)self setDisableAsynchronousRenderingVideos:0];
  [(PUPhotoEditProtoSettings *)self setEnableLiveVideoRender:+[PUPhotoEditProtoSettings isCapableOfLivePhotoRender]];
  [(PUPhotoEditProtoSettings *)self setEnableLiveVideoRenderAtSetSize:0];
  [(PUPhotoEditProtoSettings *)self setEnableDynamicVideoScaling:0];
  [(PUPhotoEditProtoSettings *)self setUseEditToastProgress:1];
  [(PUPhotoEditProtoSettings *)self setAllowSynchronousBatchRendering:1];
  [(PUPhotoEditProtoSettings *)self setShowResetToolButton:0];
  [(PUPhotoEditProtoSettings *)self setEnableSelectiveCopyEdits:1];
  [(PUPhotoEditProtoSettings *)self setAllowAnyPlugin:0];
  [(PUPhotoEditProtoSettings *)self setAttemptEditExtensionUndoAutoSetup:0];
  [(PUPhotoEditProtoSettings *)self setCropSideMargins:10.0];
  [(PUPhotoEditProtoSettings *)self setCropWheelSize:380.0];
  [(PUPhotoEditProtoSettings *)self setCropMaskBlurred:1];
  [(PUPhotoEditProtoSettings *)self setAutoCropEnabled:1];
  [(PUPhotoEditProtoSettings *)self setTrackBallSize:100.0];
  [(PUPhotoEditProtoSettings *)self setCropRecomposeDelay:1.0];
  [(PUPhotoEditProtoSettings *)self setSimulateDownload:0];
  [(PUPhotoEditProtoSettings *)self setSimulateDownloadFailure:0];
  [(PUPhotoEditProtoSettings *)self setSkipPHContentEditingInputDisplaySizeImage:1];
  [(PUPhotoEditProtoSettings *)self setSimulateEditEntryError:0];
  [(PUPhotoEditProtoSettings *)self setSimulatedEditingEntryErrorType:0];
  [(PUPhotoEditProtoSettings *)self setShowFileRadarButtonForEditEntryOnInternalInstalls:1];
  [(PUPhotoEditProtoSettings *)self setAutoStraightenMaxAngle:10.0];
  [(PUPhotoEditProtoSettings *)self setAutoPerspectiveMaxYaw:5.0];
  [(PUPhotoEditProtoSettings *)self setAutoPerspectiveMaxPitch:20.0];
  [(PUPhotoEditProtoSettings *)self setAutoPerspectiveMaxAngle:10.0];
  [(PUPhotoEditProtoSettings *)self setAutoPerspectiveMaxFaceSize:0.0];
  [(PUPhotoEditProtoSettings *)self setAutoPerspectiveDisableOnPanos:1];
  [(PUPhotoEditProtoSettings *)self setAutoPerspectiveDisableOnFrontFacingCameraImages:1];
  [(PUPhotoEditProtoSettings *)self setPerspectiveViewDebugCropEnabled:0];
  [(PUPhotoEditProtoSettings *)self setPreviewOriginalDuration:1.25];
  [(PUPhotoEditProtoSettings *)self setPreviewOriginalTimesOut:1];
  [(PUPhotoEditProtoSettings *)self setAlwaysShowDoneButton:0];
  [(PUPhotoEditProtoSettings *)self setChangeLightingDisablesLive:0];
  [(PUPhotoEditProtoSettings *)self setApertureSliderHasOffPosition:1];
  [(PUPhotoEditProtoSettings *)self setLoopBounceTrimAllowed:0];
  [(PUPhotoEditProtoSettings *)self setRenderPriority:3];
  [(PUPhotoEditProtoSettings *)self setLightModeEditor:1];
  [(PUPhotoEditProtoSettings *)self setBlurToolBackgrounds:1];
  [(PUPhotoEditProtoSettings *)self setSwipeToExitEdit:0];
  [(PUPhotoEditProtoSettings *)self setPauseAfterMovingPlayhead:1];
  [(PUPhotoEditProtoSettings *)self setRetouchShowsIntersectedMasks:0];
  [(PUPhotoEditProtoSettings *)self setRetouchEnablesSensitivityCheck:1];
  [(PUPhotoEditProtoSettings *)self setRetouchShowsTargetPointBrushPoints:0];
  [(PUPhotoEditProtoSettings *)self setRetouchShowsBrushButton:0];
  [(PUPhotoEditProtoSettings *)self setRetouchStrokeDisableObjectStrokes:0];
  [(PUPhotoEditProtoSettings *)self setRetouchShowVFXControls:0];
  [(PUPhotoEditProtoSettings *)self setSimulatedModelCatalogDownload:0];
  [(PUPhotoEditProtoSettings *)self setCleanupMaskDisplayMode:0];
  [(PUPhotoEditProtoSettings *)self setFeedbackUIFCS:0];
  [(PUPhotoEditProtoSettings *)self setRetouchShowsFaceRects:0];
  [(PUPhotoEditProtoSettings *)self setRetouchPixellatesFaces:1];
  [(PUPhotoEditProtoSettings *)self setAlwaysAllowKeyPhotoEditing:0];
  [(PUPhotoEditProtoSettings *)self setRequireTapToShowMakePosterFrame:0];
  [(PUPhotoEditProtoSettings *)self setAllowMakePosterFrameForVideo:0];
  [(PUPhotoEditProtoSettings *)self setShowVideoScrubberDebugOverlay:0];
  [(PUPhotoEditProtoSettings *)self setStrokeWidth:2.0];
  [(PUPhotoEditProtoSettings *)self setSelectionRingStrokeWidth:2.0];
  [(PUPhotoEditProtoSettings *)self setAdjustmentLabelPlatterAlpha:1.0];
  [(PUPhotoEditProtoSettings *)self setAlwaysShowValueWhenAdjustmentIsSelected:0];
  [(PUPhotoEditProtoSettings *)self setShowSuggestedKeyFrame:0];
  [(PUPhotoEditProtoSettings *)self setShowSmartBlackAndWhiteAdjustment:0];
  [(PUPhotoEditProtoSettings *)self setShowHDRDebugAdjustments:0];
  [(PUPhotoEditProtoSettings *)self setShowHDRHeadroomControl:0];
  [(PUPhotoEditProtoSettings *)self setEnablePerfDebugHUD:0];
  [(PUPhotoEditProtoSettings *)self setEnablePerfTTRButton:1];
  [(PUPhotoEditProtoSettings *)self setTtrButtonDurationThreshold:2.0];
  [(PUPhotoEditProtoSettings *)self setShowSemanticDevelopmentSwitch:0];
  [(PUPhotoEditProtoSettings *)self setEnableSemanticDevelopmentHUD:0];
  [(PUPhotoEditProtoSettings *)self setShowStabilizationWatermark:0];
  [(PUPhotoEditProtoSettings *)self setApplyVideoOrientationAsMetadata:1];
  [(PUPhotoEditProtoSettings *)self setOverrideVideoEditability:0];
  [(PUPhotoEditProtoSettings *)self setHideTrackersDuringPlayback:0];
  [(PUPhotoEditProtoSettings *)self setDebugTrackerMask:0];
  [(PUPhotoEditProtoSettings *)self setDisableVideoFilmstrip:0];
  [(PUPhotoEditProtoSettings *)self setShowFrameNumberOnVideoScrubber:0];
  [(PUPhotoEditProtoSettings *)self setTapTimelineToSeek:0];
  [(PUPhotoEditProtoSettings *)self setToolbarShadowsEnabled:1];
  [(PUPhotoEditProtoSettings *)self setHideUIForInteractionEnabled:1];
  [(PUPhotoEditProtoSettings *)self setEditMenuEnabled:1];
  [(PUPhotoEditProtoSettings *)self setMainToolbarShadowLength:140.0];
  [(PUPhotoEditProtoSettings *)self setSecondaryToolbarShadowLength:240.0];
  [(PUPhotoEditProtoSettings *)self setHideUIForInteractionFadeInDuration:0.2];
  [(PUPhotoEditProtoSettings *)self setHideUIForInteractionFadeOutDuration:0.5];
  [(PUPhotoEditProtoSettings *)self setHideUIForInteractionFadeOutDelay:0.0];
  [(PUPhotoEditProtoSettings *)self setShouldMoveToolbarToRevealStylesDPadInLandscapeOrientation:0];
  [(PUPhotoEditProtoSettings *)self setMaintainCropAspectLockState:1];
  [(PUPhotoEditProtoSettings *)self setAllowDisabledTools:0];
  [(PUPhotoEditProtoSettings *)self setEnableSpatialMediaEditing:1];
  [(PUPhotoEditProtoSettings *)self setEnableSemanticStyleInEdit:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditSemanticStyleAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setShouldConstraintDpadValuesToGrid:0];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditSmartToneAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditSmartColorAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditCropAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditPerspectiveAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditDepthEffectAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditPortraitAutoCalc:1];
  [(PUPhotoEditProtoSettings *)self setEnableEnterEditFilterThumbnailGeneration:1];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 registerDefaults:&unk_1F078B980];
}

- (void)setVideoStabilizeMaxCropFraction:(double)a3
{
  self->_videoStabilizeMaxCropFraction = a3;
}

- (void)setUseEditToastProgress:(BOOL)a3
{
  self->_useEditToastProgress = a3;
}

- (void)setUseAsynchronousRenderingPhotos:(BOOL)a3
{
  self->_useAsynchronousRenderingPhotos = a3;
}

- (void)setTtrButtonDurationThreshold:(double)a3
{
  self->_ttrButtonDurationThreshold = a3;
}

- (void)setTrackBallSize:(double)a3
{
  self->_trackBallSize = a3;
}

- (void)setToolbarShadowsEnabled:(BOOL)a3
{
  self->_toolbarShadowsEnabled = a3;
}

- (void)setTapTimelineToSeek:(BOOL)a3
{
  self->_tapTimelineToSeek = a3;
}

- (void)setSwipeToExitEdit:(BOOL)a3
{
  self->_swipeToExitEdit = a3;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void)setSkipPHContentEditingInputDisplaySizeImage:(BOOL)a3
{
  self->_skipPHContentEditingInputDisplaySizeImage = a3;
}

- (void)setSimulatedModelCatalogDownload:(int64_t)a3
{
  self->_simulatedModelCatalogDownload = a3;
}

- (void)setSimulatedEditingEntryErrorType:(int64_t)a3
{
  self->_simulatedEditingEntryErrorType = a3;
}

- (void)setSimulateEditEntryError:(BOOL)a3
{
  self->_simulateEditEntryError = a3;
}

- (void)setSimulateDownloadFailure:(BOOL)a3
{
  self->_simulateDownloadFailure = a3;
}

- (void)setSimulateDownload:(BOOL)a3
{
  self->_simulateDownload = a3;
}

- (void)setShowVideoScrubberDebugOverlay:(BOOL)a3
{
  self->_showVideoScrubberDebugOverlay = a3;
}

- (void)setShowSuggestedKeyFrame:(BOOL)a3
{
  self->_showSuggestedKeyFrame = a3;
}

- (void)setShowStabilizationWatermark:(BOOL)a3
{
  self->_showStabilizationWatermark = a3;
}

- (void)setShowSmartBlackAndWhiteAdjustment:(BOOL)a3
{
  self->_showSmartBlackAndWhiteAdjustment = a3;
}

- (void)setShowSemanticDevelopmentSwitch:(BOOL)a3
{
  self->_showSemanticDevelopmentSwitch = a3;
}

- (void)setShowResetToolButton:(BOOL)a3
{
  self->_showResetToolButton = a3;
}

- (void)setShowHDRHeadroomControl:(BOOL)a3
{
  self->_showHDRHeadroomControl = a3;
}

- (void)setShowHDRDebugAdjustments:(BOOL)a3
{
  self->_showHDRDebugAdjustments = a3;
}

- (void)setShowFrameNumberOnVideoScrubber:(BOOL)a3
{
  self->_showFrameNumberOnVideoScrubber = a3;
}

- (void)setShowFileRadarButtonForEditEntryOnInternalInstalls:(BOOL)a3
{
  self->_showFileRadarButtonForEditEntryOnInternalInstalls = a3;
}

- (void)setShouldMoveToolbarToRevealStylesDPadInLandscapeOrientation:(BOOL)a3
{
  self->_shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation = a3;
}

- (void)setShouldConstraintDpadValuesToGrid:(BOOL)a3
{
  self->_shouldConstraintDpadValuesToGrid = a3;
}

- (void)setSelectionRingStrokeWidth:(double)a3
{
  self->_selectionRingStrokeWidth = a3;
}

- (void)setSecondaryToolbarShadowLength:(double)a3
{
  self->_secondaryToolbarShadowLength = a3;
}

- (void)setRetouchStrokeDisableObjectStrokes:(BOOL)a3
{
  self->_retouchStrokeDisableObjectStrokes = a3;
}

- (void)setRetouchShowsTargetPointBrushPoints:(BOOL)a3
{
  self->_retouchShowsTargetPointBrushPoints = a3;
}

- (void)setRetouchShowsIntersectedMasks:(BOOL)a3
{
  self->_retouchShowsIntersectedMasks = a3;
}

- (void)setRetouchShowsFaceRects:(BOOL)a3
{
  self->_retouchShowsFaceRects = a3;
}

- (void)setRetouchShowsBrushButton:(BOOL)a3
{
  self->_retouchShowsBrushButton = a3;
}

- (void)setRetouchShowVFXControls:(BOOL)a3
{
  self->_retouchShowVFXControls = a3;
}

- (void)setRetouchPixellatesFaces:(BOOL)a3
{
  self->_retouchPixellatesFaces = a3;
}

- (void)setRetouchEnablesSensitivityCheck:(BOOL)a3
{
  self->_retouchEnablesSensitivityCheck = a3;
}

- (void)setRequireTapToShowMakePosterFrame:(BOOL)a3
{
  self->_requireTapToShowMakePosterFrame = a3;
}

- (void)setRenderPriority:(int64_t)a3
{
  self->_renderPriority = a3;
}

- (void)setPreviewOriginalTimesOut:(BOOL)a3
{
  self->_previewOriginalTimesOut = a3;
}

- (void)setPreviewOriginalDuration:(double)a3
{
  self->_previewOriginalDuration = a3;
}

- (void)setPerspectiveViewDebugCropEnabled:(BOOL)a3
{
  self->_perspectiveViewDebugCropEnabled = a3;
}

- (void)setPauseAfterMovingPlayhead:(BOOL)a3
{
  self->_pauseAfterMovingPlayhead = a3;
}

- (void)setOverrideVideoEditability:(BOOL)a3
{
  self->_overrideVideoEditability = a3;
}

- (void)setMaintainCropAspectLockState:(BOOL)a3
{
  self->_maintainCropAspectLockState = a3;
}

- (void)setMainToolbarShadowLength:(double)a3
{
  self->_mainToolbarShadowLength = a3;
}

- (void)setLoopBounceTrimAllowed:(BOOL)a3
{
  self->_loopBounceTrimAllowed = a3;
}

- (void)setLightModeEditor:(BOOL)a3
{
  self->_lightModeEditor = a3;
}

- (void)setHideUIForInteractionFadeOutDuration:(double)a3
{
  self->_hideUIForInteractionFadeOutDuration = a3;
}

- (void)setHideUIForInteractionFadeOutDelay:(double)a3
{
  self->_hideUIForInteractionFadeOutDelay = a3;
}

- (void)setHideUIForInteractionFadeInDuration:(double)a3
{
  self->_hideUIForInteractionFadeInDuration = a3;
}

- (void)setHideUIForInteractionEnabled:(BOOL)a3
{
  self->_hideUIForInteractionEnabled = a3;
}

- (void)setHideTrackersDuringPlayback:(BOOL)a3
{
  self->_hideTrackersDuringPlayback = a3;
}

- (void)setFeedbackUIFCS:(BOOL)a3
{
  self->_feedbackUIFCS = a3;
}

- (void)setEnableVideoStabilizion:(BOOL)a3
{
  self->_enableVideoStabilizion = a3;
}

- (void)setEnableSpatialMediaEditing:(BOOL)a3
{
}

- (void)setEnableSemanticStyleInEdit:(BOOL)a3
{
  self->_enableSemanticStyleInEdit = a3;
}

- (void)setEnableSemanticDevelopmentHUD:(BOOL)a3
{
  self->_enableSemanticDevelopmentHUD = a3;
}

- (void)setEnableSelectiveCopyEdits:(BOOL)a3
{
  self->_enableSelectiveCopyEdits = a3;
}

- (void)setEnablePerfTTRButton:(BOOL)a3
{
  self->_enablePerfTTRButton = a3;
}

- (void)setEnablePerfDebugHUD:(BOOL)a3
{
  self->_enablePerfDebugHUD = a3;
}

- (void)setEnableLiveVideoRenderAtSetSize:(BOOL)a3
{
  self->_enableLiveVideoRenderAtSetSize = a3;
}

- (void)setEnableLiveVideoRender:(BOOL)a3
{
  self->_enableLiveVideoRender = a3;
}

- (void)setEnableFinalizerGesture:(BOOL)a3
{
  self->_enableFinalizerGesture = a3;
}

- (void)setEnableEnterEditSmartToneAutoCalc:(BOOL)a3
{
  self->_enableEnterEditSmartToneAutoCalc = a3;
}

- (void)setEnableEnterEditSmartColorAutoCalc:(BOOL)a3
{
  self->_enableEnterEditSmartColorAutoCalc = a3;
}

- (void)setEnableEnterEditSemanticStyleAutoCalc:(BOOL)a3
{
  self->_enableEnterEditSemanticStyleAutoCalc = a3;
}

- (void)setEnableEnterEditPortraitAutoCalc:(BOOL)a3
{
  self->_enableEnterEditPortraitAutoCalc = a3;
}

- (void)setEnableEnterEditPerspectiveAutoCalc:(BOOL)a3
{
  self->_enableEnterEditPerspectiveAutoCalc = a3;
}

- (void)setEnableEnterEditFilterThumbnailGeneration:(BOOL)a3
{
  self->_enableEnterEditFilterThumbnailGeneration = a3;
}

- (void)setEnableEnterEditDepthEffectAutoCalc:(BOOL)a3
{
  self->_enableEnterEditDepthEffectAutoCalc = a3;
}

- (void)setEnableEnterEditCropAutoCalc:(BOOL)a3
{
  self->_enableEnterEditCropAutoCalc = a3;
}

- (void)setEnableDynamicVideoScaling:(BOOL)a3
{
  self->_enableDynamicVideoScaling = a3;
}

- (void)setEditMenuEnabled:(BOOL)a3
{
  self->_editMenuEnabled = a3;
}

- (void)setDisableVideoFilmstrip:(BOOL)a3
{
  self->_disableVideoFilmstrip = a3;
}

- (void)setDisableAsynchronousRenderingVideos:(BOOL)a3
{
  self->_disableAsynchronousRenderingVideos = a3;
}

- (void)setDebugTrackerMask:(BOOL)a3
{
  self->_debugTrackerMask = a3;
}

- (void)setCropWheelSize:(double)a3
{
  self->_cropWheelSize = a3;
}

- (void)setCropSideMargins:(double)a3
{
  self->_cropSideMargins = a3;
}

- (void)setCropRecomposeDelay:(double)a3
{
  self->_cropRecomposeDelay = a3;
}

- (void)setCropMaskBlurred:(BOOL)a3
{
  self->_cropMaskBlurred = a3;
}

- (void)setCleanupMaskDisplayMode:(int64_t)a3
{
  self->_cleanupMaskDisplayMode = a3;
}

- (void)setChangeLightingDisablesLive:(BOOL)a3
{
  self->_changeLightingDisablesLive = a3;
}

- (void)setBlurToolBackgrounds:(BOOL)a3
{
  self->_blurToolBackgrounds = a3;
}

- (void)setAutoStraightenMaxAngle:(double)a3
{
  self->_autoStraightenMaxAngle = a3;
}

- (void)setAutoPerspectiveMaxYaw:(double)a3
{
  self->_autoPerspectiveMaxYaw = a3;
}

- (void)setAutoPerspectiveMaxPitch:(double)a3
{
  self->_autoPerspectiveMaxPitch = a3;
}

- (void)setAutoPerspectiveMaxFaceSize:(double)a3
{
  self->_autoPerspectiveMaxFaceSize = a3;
}

- (void)setAutoPerspectiveMaxAngle:(double)a3
{
  self->_autoPerspectiveMaxAngle = a3;
}

- (void)setAutoPerspectiveDisableOnPanos:(BOOL)a3
{
  self->_autoPerspectiveDisableOnPanos = a3;
}

- (void)setAutoPerspectiveDisableOnFrontFacingCameraImages:(BOOL)a3
{
  self->_autoPerspectiveDisableOnFrontFacingCameraImages = a3;
}

- (void)setAutoCropEnabled:(BOOL)a3
{
  self->_autoCropEnabled = a3;
}

- (void)setAttemptEditExtensionUndoAutoSetup:(BOOL)a3
{
  self->_attemptEditExtensionUndoAutoSetup = a3;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (void)setApertureSliderHasOffPosition:(BOOL)a3
{
  self->_apertureSliderHasOffPosition = a3;
}

- (void)setAlwaysShowValueWhenAdjustmentIsSelected:(BOOL)a3
{
  self->_alwaysShowValueWhenAdjustmentIsSelected = a3;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (void)setAlwaysAllowKeyPhotoEditing:(BOOL)a3
{
  self->_alwaysAllowKeyPhotoEditing = a3;
}

- (void)setAllowSynchronousBatchRendering:(BOOL)a3
{
  self->_allowSynchronousBatchRendering = a3;
}

- (void)setAllowMakePosterFrameForVideo:(BOOL)a3
{
  self->_allowMakePosterFrameForVideo = a3;
}

- (void)setAllowDisabledTools:(BOOL)a3
{
  self->_allowDisabledTools = a3;
}

- (void)setAllowAnyPlugin:(BOOL)a3
{
  self->_allowAnyPlugin = a3;
}

- (void)setAdjustmentLabelPlatterAlpha:(double)a3
{
  self->_adjustmentLabelPlatterAlpha = a3;
}

+ (BOOL)isCapableOfLivePhotoRender
{
  return MGGetBoolAnswer();
}

- (BOOL)shouldConstraintDpadValuesToGrid
{
  return self->_shouldConstraintDpadValuesToGrid;
}

- (BOOL)enableSemanticStyleInEdit
{
  return self->_enableSemanticStyleInEdit;
}

- (BOOL)allowDisabledTools
{
  return self->_allowDisabledTools;
}

- (BOOL)shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation
{
  return self->_shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation;
}

- (double)hideUIForInteractionFadeOutDelay
{
  return self->_hideUIForInteractionFadeOutDelay;
}

- (double)hideUIForInteractionFadeOutDuration
{
  return self->_hideUIForInteractionFadeOutDuration;
}

- (double)hideUIForInteractionFadeInDuration
{
  return self->_hideUIForInteractionFadeInDuration;
}

- (BOOL)hideUIForInteractionEnabled
{
  return self->_hideUIForInteractionEnabled;
}

- (BOOL)editMenuEnabled
{
  return self->_editMenuEnabled;
}

- (double)secondaryToolbarShadowLength
{
  return self->_secondaryToolbarShadowLength;
}

- (double)mainToolbarShadowLength
{
  return self->_mainToolbarShadowLength;
}

- (BOOL)toolbarShadowsEnabled
{
  return self->_toolbarShadowsEnabled;
}

- (unint64_t)videoCompositorDebugMode
{
  return self->_videoCompositorDebugMode;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (BOOL)showStabilizationWatermark
{
  return self->_showStabilizationWatermark;
}

- (BOOL)showSemanticDevelopmentSwitch
{
  return self->_showSemanticDevelopmentSwitch;
}

- (void)setEnableFlexRange:(BOOL)a3
{
  self->_enableFlexRange = a3;
}

- (BOOL)enableFlexRange
{
  return self->_enableFlexRange;
}

- (BOOL)forceMeteorPlusPlus
{
  return self->_forceMeteorPlusPlus;
}

- (BOOL)decodeMeteorPlusAsLinear
{
  return self->_decodeMeteorPlusAsLinear;
}

- (BOOL)disablePacked10BitPixelFormats
{
  return self->_disablePacked10BitPixelFormats;
}

- (BOOL)allAssetsCanUseHDRPipeline
{
  return self->_allAssetsCanUseHDRPipeline;
}

- (BOOL)showHDRDebugAdjustments
{
  return self->_showHDRDebugAdjustments;
}

- (BOOL)maintainCropAspectLockState
{
  return self->_maintainCropAspectLockState;
}

- (BOOL)runNeutrinoSynchronously
{
  return self->_runNeutrinoSynchronously;
}

- (BOOL)showSuggestedKeyFrame
{
  return self->_showSuggestedKeyFrame;
}

- (BOOL)alwaysShowValueWhenAdjustmentIsSelected
{
  return self->_alwaysShowValueWhenAdjustmentIsSelected;
}

- (double)adjustmentLabelPlatterAlpha
{
  return self->_adjustmentLabelPlatterAlpha;
}

- (double)selectionRingStrokeWidth
{
  return self->_selectionRingStrokeWidth;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (BOOL)showVideoScrubberDebugOverlay
{
  return self->_showVideoScrubberDebugOverlay;
}

- (BOOL)allowMakePosterFrameForVideo
{
  return self->_allowMakePosterFrameForVideo;
}

- (BOOL)requireTapToShowMakePosterFrame
{
  return self->_requireTapToShowMakePosterFrame;
}

- (int64_t)cleanupMaskDisplayMode
{
  return self->_cleanupMaskDisplayMode;
}

- (BOOL)retouchShowsFaceRects
{
  return self->_retouchShowsFaceRects;
}

- (BOOL)feedbackUIFCS
{
  return self->_feedbackUIFCS;
}

- (int64_t)simulatedModelCatalogDownload
{
  return self->_simulatedModelCatalogDownload;
}

- (BOOL)retouchShowVFXControls
{
  return self->_retouchShowVFXControls;
}

- (BOOL)retouchPixellatesFaces
{
  return self->_retouchPixellatesFaces;
}

- (BOOL)retouchStrokeDisableObjectStrokes
{
  return self->_retouchStrokeDisableObjectStrokes;
}

- (BOOL)retouchShowsBrushButton
{
  return self->_retouchShowsBrushButton;
}

- (BOOL)retouchShowsTargetPointBrushPoints
{
  return self->_retouchShowsTargetPointBrushPoints;
}

- (BOOL)retouchShowsIntersectedMasks
{
  return self->_retouchShowsIntersectedMasks;
}

- (BOOL)retouchEnablesSensitivityCheck
{
  return self->_retouchEnablesSensitivityCheck;
}

- (void)setAllowApertureRedEye:(BOOL)a3
{
  self->_allowApertureRedEye = a3;
}

- (BOOL)allowApertureRedEye
{
  return self->_allowApertureRedEye;
}

- (BOOL)swipeToExitEdit
{
  return self->_swipeToExitEdit;
}

- (BOOL)blurToolBackgrounds
{
  return self->_blurToolBackgrounds;
}

- (BOOL)alwaysAllowKeyPhotoEditing
{
  return self->_alwaysAllowKeyPhotoEditing;
}

- (BOOL)pauseAfterMovingPlayhead
{
  return self->_pauseAfterMovingPlayhead;
}

- (BOOL)loopBounceTrimAllowed
{
  return self->_loopBounceTrimAllowed;
}

- (BOOL)apertureSliderHasOffPosition
{
  return self->_apertureSliderHasOffPosition;
}

- (BOOL)changeLightingDisablesLive
{
  return self->_changeLightingDisablesLive;
}

- (BOOL)disableIOSurfacePortaitExport
{
  return self->_disableIOSurfacePortaitExport;
}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (double)previewOriginalDuration
{
  return self->_previewOriginalDuration;
}

- (BOOL)previewOriginalTimesOut
{
  return self->_previewOriginalTimesOut;
}

- (BOOL)showFileRadarButtonForEditEntryOnInternalInstalls
{
  return self->_showFileRadarButtonForEditEntryOnInternalInstalls;
}

- (int64_t)simulatedEditingEntryErrorType
{
  return self->_simulatedEditingEntryErrorType;
}

- (BOOL)simulateEditEntryError
{
  return self->_simulateEditEntryError;
}

- (BOOL)skipPHContentEditingInputDisplaySizeImage
{
  return self->_skipPHContentEditingInputDisplaySizeImage;
}

- (BOOL)simulateDownloadFailure
{
  return self->_simulateDownloadFailure;
}

- (BOOL)simulateDownload
{
  return self->_simulateDownload;
}

- (BOOL)autoPerspectiveDisableOnFrontFacingCameraImages
{
  return self->_autoPerspectiveDisableOnFrontFacingCameraImages;
}

- (BOOL)autoPerspectiveDisableOnPanos
{
  return self->_autoPerspectiveDisableOnPanos;
}

- (double)autoPerspectiveMaxFaceSize
{
  return self->_autoPerspectiveMaxFaceSize;
}

- (double)autoPerspectiveMaxAngle
{
  return self->_autoPerspectiveMaxAngle;
}

- (double)autoPerspectiveMaxPitch
{
  return self->_autoPerspectiveMaxPitch;
}

- (double)autoPerspectiveMaxYaw
{
  return self->_autoPerspectiveMaxYaw;
}

- (double)autoStraightenMaxAngle
{
  return self->_autoStraightenMaxAngle;
}

- (double)cropRecomposeDelay
{
  return self->_cropRecomposeDelay;
}

- (double)trackBallSize
{
  return self->_trackBallSize;
}

- (BOOL)autoCropEnabled
{
  return self->_autoCropEnabled;
}

- (BOOL)cropMaskBlurred
{
  return self->_cropMaskBlurred;
}

- (double)cropWheelSize
{
  return self->_cropWheelSize;
}

- (double)cropSideMargins
{
  return self->_cropSideMargins;
}

- (BOOL)attemptEditExtensionUndoAutoSetup
{
  return self->_attemptEditExtensionUndoAutoSetup;
}

- (BOOL)allowAnyPlugin
{
  return self->_allowAnyPlugin;
}

- (BOOL)showResetToolButton
{
  return self->_showResetToolButton;
}

- (BOOL)enableSelectiveCopyEdits
{
  return self->_enableSelectiveCopyEdits;
}

- (void)setShowRotateAction:(BOOL)a3
{
  self->_showRotateAction = a3;
}

- (BOOL)showRotateAction
{
  return self->_showRotateAction;
}

- (void)setShowAutoEnhanceAction:(BOOL)a3
{
  self->_showAutoEnhanceAction = a3;
}

- (BOOL)showAutoEnhanceAction
{
  return self->_showAutoEnhanceAction;
}

- (BOOL)allowSynchronousBatchRendering
{
  return self->_allowSynchronousBatchRendering;
}

- (BOOL)useEditToastProgress
{
  return self->_useEditToastProgress;
}

- (BOOL)allowSpillMatteOnOlderPortraitV2Captures
{
  return self->_allowSpillMatteOnOlderPortraitV2Captures;
}

- (BOOL)forceSpillMatteOff
{
  return self->_forceSpillMatteOff;
}

- (BOOL)forceGlassesMatteOff
{
  return self->_forceGlassesMatteOff;
}

- (double)ttrButtonDurationThreshold
{
  return self->_ttrButtonDurationThreshold;
}

- (BOOL)enablePerfTTRButton
{
  return self->_enablePerfTTRButton;
}

- (BOOL)debugTrackerMask
{
  return self->_debugTrackerMask;
}

- (BOOL)hideTrackersDuringPlayback
{
  return self->_hideTrackersDuringPlayback;
}

- (BOOL)overrideVideoEditability
{
  return self->_overrideVideoEditability;
}

- (BOOL)enableSemanticDevelopmentHUD
{
  return self->_enableSemanticDevelopmentHUD;
}

- (int64_t)renderPriority
{
  return self->_renderPriority;
}

- (double)videoStabilizeMaxCropFraction
{
  return self->_videoStabilizeMaxCropFraction;
}

- (BOOL)enableVideoStabilizion
{
  return self->_enableVideoStabilizion;
}

- (BOOL)enableCoreImageDebugTiming
{
  return self->_enableCoreImageDebugTiming;
}

- (BOOL)enableCoreImageDebugIntermediates
{
  return self->_enableCoreImageDebugIntermediates;
}

- (BOOL)enableCoreImageDebugOutputs
{
  return self->_enableCoreImageDebugOutputs;
}

- (BOOL)enableCoreImageDebugInputs
{
  return self->_enableCoreImageDebugInputs;
}

- (BOOL)enableCoreImageDebugMode
{
  return self->_enableCoreImageDebugMode;
}

- (BOOL)mediaViewDebugMode
{
  return self->_mediaViewDebugMode;
}

- (BOOL)renderZoomPurple
{
  return self->_renderZoomPurple;
}

- (BOOL)renderBackfillBlue
{
  return self->_renderBackfillBlue;
}

- (BOOL)nuRenderJobDebugCapture5PercentOfJobs
{
  return self->_nuRenderJobDebugCapture5PercentOfJobs;
}

- (BOOL)nuRenderJobDebugCaptureOnlyPerfStats
{
  return self->_nuRenderJobDebugCaptureOnlyPerfStats;
}

- (BOOL)nuRenderJobDebugCapturePerfStatHistory
{
  return self->_nuRenderJobDebugCapturePerfStatHistory;
}

- (BOOL)nuRenderJobDebugCaptureCanceledJobs
{
  return self->_nuRenderJobDebugCaptureCanceledJobs;
}

- (BOOL)nuRenderJobDebugCaptureNodeCache
{
  return self->_nuRenderJobDebugCaptureNodeCache;
}

- (BOOL)nuRenderJobDebugCaptureNodeGraphs
{
  return self->_nuRenderJobDebugCaptureNodeGraphs;
}

- (BOOL)enableNURenderJobDebug
{
  return self->_enableNURenderJobDebug;
}

- (void)setShouldUseFlipAnimationForValuePlatter:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setShouldUseFlipAnimationForValuePlatter:v3];
}

- (BOOL)shouldUseFlipAnimationForValuePlatter
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 shouldUseFlipAnimationForValuePlatter];

  return v3;
}

- (void)setSynchronousLivePhotoStylesCopyPaste:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setSynchronousLivePhotoStylesCopyPaste:v3];
}

- (BOOL)synchronousLivePhotoStylesCopyPaste
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 synchronousLivePhotoStylesCopyPaste];

  return v3;
}

- (void)setSynchronousStylesCopyPaste:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setSynchronousStylesCopyPaste:v3];
}

- (BOOL)synchronousStylesCopyPaste
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 synchronousStylesCopyPaste];

  return v3;
}

- (void)setOverrideSemanticStylesHardwareCheck:(BOOL)a3
{
}

- (BOOL)overrideSemanticStylesHardwareCheck
{
  return [MEMORY[0x1E4F7A4A0] overrideSemanticStylesHardwareCheck];
}

- (BOOL)isStyleCaptureEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.camera"];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 valueForKey:@"CAMFeatureDevelopmentAllowSmartStyles"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v6 = [v4 valueForKey:@"CAMFeatureDevelopmentAllowSmartStyles"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (void)setShouldEnableStylesForProRaw:(BOOL)a3
{
}

- (BOOL)shouldEnableStylesForProRaw
{
  return [MEMORY[0x1E4F7A4A0] shouldEnableStylesForProRaw];
}

- (void)setRetouchDumpsCoreImageInputs:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreimage"];
  [v4 setBool:v3 forKey:@"dumpInpaintImages"];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
  CFPreferencesAppSynchronize(@"com.apple.coreimage");
}

- (BOOL)retouchDumpsCoreImageInputs
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreimage"];
  BOOL v3 = [v2 integerForKey:@"dumpInpaintImages"] != 0;

  return v3;
}

- (void)setRetouchShowsMaskBoundingBox:(BOOL)a3
{
}

- (BOOL)retouchShowsMaskBoundingBox
{
  return [MEMORY[0x1E4F7A4A0] inpaintShowsSurroundOutline];
}

- (void)setOverrideCleanupHardwareCheck:(BOOL)a3
{
}

- (BOOL)overrideCleanupHardwareCheck
{
  return [MEMORY[0x1E4F7A4A0] overrideCleanupHardwareCheck];
}

- (BOOL)enableSpatialMediaEditing
{
  return [MEMORY[0x1E4F7A4A0] enableSpatialMediaEditing];
}

- (void)setFetchAndSendScenePrintsForSliderNet:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setFetchAndSendScenePrintsForSliderNet:v3];
}

- (BOOL)fetchAndSendScenePrintsForSliderNet
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 fetchAndSendScenePrintsForSliderNet];

  return v3;
}

- (void)setAffectManuallyEditedSlidersOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setAffectManuallyEditedSlidersOnly:v3];
}

- (BOOL)affectManuallyEditedSlidersOnly
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 affectManuallyEditedSlidersOnly];

  return v3;
}

- (void)setSmartCopyPasteSimilarityGating:(double)a3
{
  double v3 = a3 / 100.0;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setSmartCopyPasteSimilarityGatingThreshold:v3];
}

- (double)smartCopyPasteSimilarityGating
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  [v2 smartCopyPasteSimilarityGatingThreshold];
  double v4 = v3 * 100.0;

  return v4;
}

- (void)setSmartCopyPasteCaptureTimeGating:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setSmartCopyPasteGateOnCaptureTime:v3];
}

- (BOOL)smartCopyPasteCaptureTimeGating
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 smartCopyPasteGateOnCaptureTime];

  return v3;
}

- (void)setSmartCopyPasteReviewUIEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F91148] globalSettings];
  [v4 setSmartCopyPasteReviewUIEnabled:v3];
}

- (BOOL)smartCopyPasteReviewUIEnabled
{
  v2 = [MEMORY[0x1E4F91148] globalSettings];
  char v3 = [v2 smartCopyPasteReviewUIEnabled];

  return v3;
}

- (BOOL)tapTimelineToSeek
{
  if (self->_tapTimelineToSeek) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"tapTimelineToSeek"];

  return v4;
}

- (BOOL)showFrameNumberOnVideoScrubber
{
  if (self->_showFrameNumberOnVideoScrubber) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"showFrameNumberOnVideoScrubber"];

  return v4;
}

- (BOOL)disableVideoFilmstrip
{
  if (self->_disableVideoFilmstrip) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"disableVideoFilmstrip"];

  return v4;
}

- (void)setDisableTimelineAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableTimelineAnimations = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"disableTimelineAnimations"];
}

- (void)setAllowSpillMatteOnOlderPortraitV2Captures:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowSpillMatteOnOlderPortraitV2Captures = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setAllowSpillMatteOnOlderPortraitV2Captures:v3];
}

- (void)setForceSpillMatteOff:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceSpillMatteOff = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setForceSpillMatteOff:v3];
}

- (void)setForceGlassesMatteOff:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceGlassesMatteOff = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setForceGlassesMatteOff:v3];
}

- (void)setVideoCompositorDebugMode:(unint64_t)a3
{
  self->_videoCompositorDebugMode = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setVideoCompositorDebugMode:");
}

- (void)setForceMeteorPlusPlus:(BOOL)a3
{
  self->_forceMeteorPlusPlus = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setForceMeteorPlusPlus:");
}

- (void)setDecodeMeteorPlusAsLinear:(BOOL)a3
{
  self->_decodeMeteorPlusAsLinear = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setForceMeteorPlusLinear:");
}

- (void)setDisableRenderMeteorPlusAsHDR:(BOOL)a3
{
}

- (BOOL)disableRenderMeteorPlusAsHDR
{
  return [MEMORY[0x1E4F7A4A0] renderMeteorPlusAsHDR] ^ 1;
}

- (void)setEnableDash5:(BOOL)a3
{
}

- (BOOL)enableDash5
{
  return [MEMORY[0x1E4F7A4A0] enableDash5];
}

- (void)setDisablePacked10BitPixelFormats:(BOOL)a3
{
  self->_disablePacked10BitPixelFormats = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setDisablePacked10BitPixelFormats:");
}

- (void)setAllAssetsCanUseHDRPipeline:(BOOL)a3
{
  self->_allAssetsCanUseHDRPipeline = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setAllAssetsCanUseHDRPipeline:");
}

- (BOOL)showHDRHeadroomControl
{
  if (self->_showHDRHeadroomControl) {
    return 1;
  }
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"showHDRHeadroomControl"];

  return v4;
}

- (BOOL)showHDRDebugAdjustment
{
  if (self->_showHDRDebugAdjustments) {
    return 1;
  }
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"showHDRDebugAdjustment"];

  return v4;
}

- (BOOL)showSmartBlackAndWhiteAdjustment
{
  if (self->_showSmartBlackAndWhiteAdjustment) {
    return 1;
  }
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"showSmartBlackAndWhiteAdjustment"];

  return v4;
}

- (BOOL)lightModeEditor
{
  if (self->_lightModeEditor) {
    return 1;
  }
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"lightModeEditor"];

  return v4;
}

- (void)updateCoreImageDebug
{
  BOOL v3 = [(PUPhotoEditProtoSettings *)self enableCoreImageDebugMode];
  BOOL v4 = [(PUPhotoEditProtoSettings *)self enableCoreImageDebugInputs];
  BOOL v5 = [(PUPhotoEditProtoSettings *)self enableCoreImageDebugOutputs];
  BOOL v6 = [(PUPhotoEditProtoSettings *)self enableCoreImageDebugIntermediates];
  BOOL v7 = [(PUPhotoEditProtoSettings *)self enableCoreImageDebugTiming];
  +[PURenderDebugController setCoreImageDebugMode:v3 dumpInputs:v4 dumpOutputs:v5 dumpIntermediates:v6 dumpTiming:v7];
}

- (void)setEnableCoreImageDebugTiming:(BOOL)a3
{
  self->_enableCoreImageDebugTiming = a3;
  [(PUPhotoEditProtoSettings *)self updateCoreImageDebug];
}

- (void)setEnableCoreImageDebugIntermediates:(BOOL)a3
{
  self->_enableCoreImageDebugIntermediates = a3;
  [(PUPhotoEditProtoSettings *)self updateCoreImageDebug];
}

- (void)setEnableCoreImageDebugOutputs:(BOOL)a3
{
  self->_enableCoreImageDebugOutputs = a3;
  [(PUPhotoEditProtoSettings *)self updateCoreImageDebug];
}

- (void)setEnableCoreImageDebugInputs:(BOOL)a3
{
  self->_enableCoreImageDebugInputs = a3;
  [(PUPhotoEditProtoSettings *)self updateCoreImageDebug];
}

- (void)setEnableCoreImageDebugMode:(BOOL)a3
{
  self->_enableCoreImageDebugMode = a3;
  [(PUPhotoEditProtoSettings *)self updateCoreImageDebug];
}

- (void)setMediaViewDebugMode:(BOOL)a3
{
  self->_mediaViewDebugMode = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setViewDebugEnabled:");
}

- (void)setRenderZoomPurple:(BOOL)a3
{
  self->_renderZoomPurple = a3;
  if (a3) {
    [MEMORY[0x1E4F7A4A0] setDebugRenderPurple:@"roi"];
  }
}

- (void)setRenderBackfillBlue:(BOOL)a3
{
  self->_renderBackfillBlue = a3;
  if (a3) {
    [MEMORY[0x1E4F7A4A0] setDebugRenderBlue:@"zoomedToFit"];
  }
}

- (void)setNuRenderJobDebugCapture5PercentOfJobs:(BOOL)a3
{
  self->_nuRenderJobDebugCapture5PercentOfJobs = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebugCapture5PercentOfJobs:");
}

- (void)setNuRenderJobDebugCaptureOnlyPerfStats:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureOnlyPerfStats = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebugCaptureOnlyPerfStats:");
}

- (void)setNuRenderJobDebugCapturePerfStatHistory:(BOOL)a3
{
  self->_nuRenderJobDebugCapturePerfStatHistory = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebugCapturePerfStatHistory:");
}

- (void)setNuRenderJobDebugCaptureNodeCache:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureNodeCache = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebugCaptureNodeCache:");
}

- (void)setNuRenderJobDebugCaptureNodeGraphs:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureNodeGraphs = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebugCaptureNodeGraphs:");
}

- (void)setNuRenderJobDebugCaptureCanceledJobs:(BOOL)a3
{
  self->_nuRenderJobDebugCaptureCanceledJobs = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebugCaptureCanceledJobs:");
}

- (void)setEnableNURenderJobDebug:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enableNURenderJobDebug = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRenderJobDebug:");
  if (v3)
  {
    BOOL v4 = NSTemporaryDirectory();
    id v6 = [v4 stringByAppendingString:@"NURenderDebug/"];

    BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

    [MEMORY[0x1E4F7A4A0] setTempDir:v6];
  }
}

- (void)setRunNeutrinoSynchronously:(BOOL)a3
{
  self->_runNeutrinoSynchronously = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setRunNeutrinoSynchronously:");
}

- (BOOL)enableEnterEditFilterThumbnailGeneration
{
  if (!self->_enableEnterEditFilterThumbnailGeneration) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditFilterThumbnailGeneration"];

  return v3;
}

- (BOOL)enableEnterEditPortraitAutoCalc
{
  if (!self->_enableEnterEditPortraitAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditPortraitAutoCalc"];

  return v3;
}

- (BOOL)enableEnterEditDepthEffectAutoCalc
{
  if (!self->_enableEnterEditDepthEffectAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditDepthEffectAutoCalc"];

  return v3;
}

- (BOOL)enableEnterEditPerspectiveAutoCalc
{
  if (!self->_enableEnterEditPerspectiveAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditPerspectiveAutoCalc"];

  return v3;
}

- (BOOL)enableEnterEditCropAutoCalc
{
  if (!self->_enableEnterEditCropAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditCropAutoCalc"];

  return v3;
}

- (BOOL)enableEnterEditSemanticStyleAutoCalc
{
  if (!self->_enableEnterEditSemanticStyleAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditSemanticStyleAutoCalc"];

  return v3;
}

- (BOOL)enableEnterEditSmartColorAutoCalc
{
  if (!self->_enableEnterEditSmartColorAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditSmartColorAutoCalc"];

  return v3;
}

- (BOOL)enableEnterEditSmartToneAutoCalc
{
  if (!self->_enableEnterEditSmartToneAutoCalc) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableEnterEditSmartToneAutoCalc"];

  return v3;
}

- (BOOL)disableTimelineAnimations
{
  if (self->_disableTimelineAnimations) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"disableTimelineAnimations"];

  return v4;
}

- (BOOL)enablePerfDebugHUD
{
  if (self->_enablePerfDebugHUD) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"enablePerfDebugHUD"];

  return v4;
}

- (BOOL)perspectiveViewDebugCropEnabled
{
  if (self->_perspectiveViewDebugCropEnabled) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"perspectiveViewDebugCropEnabled"];

  return v4;
}

- (void)setDisableIOSurfacePortaitExport:(BOOL)a3
{
  self->_disableIOSurfacePortaitExport = a3;
  objc_msgSend(MEMORY[0x1E4F7A4A0], "setDisableIOSurfacePortaitExport:");
}

- (void)setEnableFuzzball:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setPortraitDisableFuzzball:v3];
}

- (BOOL)enableFuzzball
{
  v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v3 = [v2 portraitDisableFuzzball] ^ 1;

  return v3;
}

- (BOOL)enableDynamicVideoScaling
{
  if (self->_enableDynamicVideoScaling) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"enableDynamicVideoScaling"];

  return v4;
}

- (BOOL)enableLiveVideoRenderAtSetSize
{
  if (self->_enableLiveVideoRenderAtSetSize) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"enableLiveVideoRenderAtSetSize"];

  return v4;
}

- (BOOL)enableLiveVideoRender
{
  if (self->_enableLiveVideoRender) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"enableLiveVideoRender"];

  return v4;
}

- (BOOL)disableAsynchronousRenderingVideos
{
  if (self->_disableAsynchronousRenderingVideos) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"disableAsynchronousRenderingVideos"];

  return v4;
}

- (BOOL)useAsynchronousRenderingPhotos
{
  if (self->_useAsynchronousRenderingPhotos) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"useAsynchronousRenderingPhotos"];

  return v4;
}

- (BOOL)enableFinalizerGesture
{
  if (self->_enableFinalizerGesture) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"enableFinalizerGesture"];

  return v4;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v340[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  char v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Render Photo Adjustments Async" valueKeyPath:@"useAsynchronousRenderingPhotos"];
  v340[0] = v3;
  char v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Video Render Adjustments Async" valueKeyPath:@"disableAsynchronousRenderingVideos"];
  v340[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Live Video Render" valueKeyPath:@"enableLiveVideoRender"];
  v340[2] = v5;
  id v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Specify Live Video Render Size" valueKeyPath:@"enableLiveVideoRenderAtSetSize"];
  v340[3] = v6;
  BOOL v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Dynamic Video Scaling" valueKeyPath:@"enableDynamicVideoScaling"];
  v340[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v340 count:5];
  v307 = [v2 sectionWithRows:v8 title:@"Async Save Settings"];

  v305 = (void *)MEMORY[0x1E4F94160];
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable For All Assets (SDR/OpenExr/etc)" valueKeyPath:@"allAssetsCanUseHDRPipeline"];
  v339[0] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show HDR Debug Adjustments" valueKeyPath:@"showHDRDebugAdjustments"];
  v339[1] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show HDR Headroom Control" valueKeyPath:@"showHDRHeadroomControl"];
  v339[2] = v11;
  v12 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Packed 10-bit Pixel Formats" valueKeyPath:@"disablePacked10BitPixelFormats"];
  v339[3] = v12;
  v13 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Render M+ as HDR" valueKeyPath:@"disableRenderMeteorPlusAsHDR"];
  v339[4] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Decode M+ as Linear" valueKeyPath:@"decodeMeteorPlusAsLinear"];
  v339[5] = v14;
  v15 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force M++ Gain Map" valueKeyPath:@"forceMeteorPlusPlus"];
  v339[6] = v15;
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable HDR-5" valueKeyPath:@"enableDash5"];
  v339[7] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v339 count:8];
  v306 = [v305 sectionWithRows:v17 title:@"HDR Settings"];

  v18 = (void *)MEMORY[0x1E4F94160];
  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Fuzzball" valueKeyPath:@"enableFuzzball"];
  v338[0] = v19;
  v20 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Aperture Slider Has Off Position" valueKeyPath:@"apertureSliderHasOffPosition"];
  v338[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v338 count:2];
  v304 = [v18 sectionWithRows:v21 title:@"Portrait Settings"];

  v22 = (void *)MEMORY[0x1E4F94160];
  v23 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Override Video Editability Check" valueKeyPath:@"overrideVideoEditability"];
  v337[0] = v23;
  v24 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Trackers During Playback" valueKeyPath:@"hideTrackersDuringPlayback"];
  v337[1] = v24;
  v25 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Timeline Animations" valueKeyPath:@"disableTimelineAnimations"];
  v337[2] = v25;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Debug Tracker Mask" valueKeyPath:@"debugTrackerMask"];
  v337[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v337 count:4];
  v303 = [v22 sectionWithRows:v27 title:@"CPV Settings"];

  v28 = (void *)MEMORY[0x1E4F94160];
  v29 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Run Neutrino Synchronously" valueKeyPath:@"runNeutrinoSynchronously"];
  v336[0] = v29;
  v30 = [MEMORY[0x1E4F94108] rowWithTitle:@"Video Compositor Debug" valueKeyPath:@"videoCompositorDebugMode"];
  v31 = [v30 possibleValues:&unk_1F078B240 titles:&unk_1F078B258];
  v336[1] = v31;
  v32 = [MEMORY[0x1E4F94108] rowWithTitle:@"Render Priority" valueKeyPath:@"renderPriority"];
  v33 = [v32 possibleValues:&unk_1F078B270 titles:&unk_1F078B288];
  v336[2] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v336 count:3];
  v302 = [v28 sectionWithRows:v34 title:@"Neutrino Settings"];

  v35 = (void *)MEMORY[0x1E4F94160];
  v36 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Show 'Done' Button" valueKeyPath:@"alwaysShowDoneButton"];
  v335[0] = v36;
  v37 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Apply Video Orientation As Metadata" valueKeyPath:@"applyVideoOrientationAsMetadata"];
  v335[1] = v37;
  v38 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable IOSurface Portrait Export" valueKeyPath:@"disableIOSurfacePortaitExport"];
  v335[2] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v335 count:3];
  v301 = [v35 sectionWithRows:v39 title:@"Export Settings"];

  v299 = (void *)MEMORY[0x1E4F94160];
  v297 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Neutrino Debug" valueKeyPath:@"enableNURenderJobDebug"];
  v334[0] = v297;
  v295 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Node Graphs" valueKeyPath:@"nuRenderJobDebugCaptureNodeGraphs"];
  v292 = [v295 conditionFormat:@"enableNURenderJobDebug != 0"];
  v334[1] = v292;
  v288 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Node Cache" valueKeyPath:@"nuRenderJobDebugCaptureNodeCache"];
  v284 = [v288 conditionFormat:@"enableNURenderJobDebug != 0"];
  v334[2] = v284;
  v280 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Canceled Jobs" valueKeyPath:@"nuRenderJobDebugCaptureCanceledJobs"];
  v276 = [v280 conditionFormat:@"enableNURenderJobDebug != 0"];
  v334[3] = v276;
  v273 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Perf Stat History" valueKeyPath:@"nuRenderJobDebugCapturePerfStatHistory"];
  v270 = [v273 conditionFormat:@"enableNURenderJobDebug != 0"];
  v334[4] = v270;
  v267 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Only Perf Stats (fast)" valueKeyPath:@"nuRenderJobDebugCaptureOnlyPerfStats"];
  v264 = [v267 conditionFormat:@"enableNURenderJobDebug != 0"];
  v334[5] = v264;
  v262 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture 5% of Jobs (fast)" valueKeyPath:@"nuRenderJobDebugCapture5PercentOfJobs"];
  v259 = [v262 conditionFormat:@"enableNURenderJobDebug != 0"];
  v334[6] = v259;
  v255 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Core Image Debug (Must Relaunch)" valueKeyPath:@"enableCoreImageDebugMode"];
  v334[7] = v255;
  v251 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Inputs" valueKeyPath:@"enableCoreImageDebugInputs"];
  v248 = [v251 conditionFormat:@"enableCoreImageDebugMode != 0"];
  v334[8] = v248;
  v245 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Outputs" valueKeyPath:@"enableCoreImageDebugOutputs"];
  v243 = [v245 conditionFormat:@"enableCoreImageDebugMode != 0"];
  v334[9] = v243;
  v240 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Intermediates (Slow)" valueKeyPath:@"enableCoreImageDebugIntermediates"];
  v40 = [v240 conditionFormat:@"enableCoreImageDebugMode != 0"];
  v334[10] = v40;
  v41 = [MEMORY[0x1E4F941F0] rowWithTitle:@"   Capture Timing" valueKeyPath:@"enableCoreImageDebugTiming"];
  v42 = [v41 conditionFormat:@"enableCoreImageDebugMode != 0"];
  v334[11] = v42;
  v43 = (void *)MEMORY[0x1E4F940F8];
  v44 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_363];
  v45 = [v43 rowWithTitle:@"View" action:v44];
  v334[12] = v45;
  v46 = (void *)MEMORY[0x1E4F940F8];
  v47 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_369];
  v48 = [v46 rowWithTitle:@"Share" action:v47];
  v334[13] = v48;
  v49 = (void *)MEMORY[0x1E4F940F8];
  v50 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_374];
  v51 = [v49 rowWithTitle:@"Delete" action:v50];
  v334[14] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v334 count:15];
  v300 = [v299 sectionWithRows:v52 title:@"Render Debug"];

  v53 = (void *)MEMORY[0x1E4F94160];
  v54 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Render Backfill Blue" valueKeyPath:@"renderBackfillBlue"];
  v333[0] = v54;
  v55 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Render Zoom Purple" valueKeyPath:@"renderZoomPurple"];
  v333[1] = v55;
  v56 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Media View Debug Mode" valueKeyPath:@"mediaViewDebugMode"];
  v333[2] = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v333 count:3];
  v298 = [v53 sectionWithRows:v57 title:@"NUMediaView Settings"];

  v58 = (void *)MEMORY[0x1E4F94160];
  v59 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Glasses Matte Off (Robust Portait 2)" valueKeyPath:@"forceGlassesMatteOff"];
  v332[0] = v59;
  v60 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Spill Matte Off (Robust Portait 2)" valueKeyPath:@"forceSpillMatteOff"];
  v332[1] = v60;
  v61 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Spill Matte on older V2 Captures (Robust Portait 2)" valueKeyPath:@"allowSpillMatteOnOlderPortraitV2Captures"];
  v332[2] = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v332 count:3];
  v296 = [v58 sectionWithRows:v62 title:@"Portrait Settings"];

  v293 = (void *)MEMORY[0x1E4F94160];
  v289 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Light Mode Editor" valueKeyPath:@"lightModeEditor"];
  v331[0] = v289;
  v285 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Edit Toast progress" valueKeyPath:@"useEditToastProgress"];
  v331[1] = v285;
  v63 = (void *)MEMORY[0x1E4F941F0];
  v281 = NSStringFromSelector(sel_allowSynchronousBatchRendering);
  v277 = [v63 rowWithTitle:@"Allow synchronous batch rendering" valueKeyPath:v281];
  v331[2] = v277;
  v64 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Reset Tool Button" valueKeyPath:@"showResetToolButton"];
  v331[3] = v64;
  v65 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Smart B&W Adjustment" valueKeyPath:@"showSmartBlackAndWhiteAdjustment"];
  v331[4] = v65;
  v66 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Semantic Development Switch" valueKeyPath:@"showSemanticDevelopmentSwitch"];
  v331[5] = v66;
  v67 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Maintain Crop Aspect Lock State" valueKeyPath:@"maintainCropAspectLockState"];
  v331[6] = v67;
  v68 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Glass Tool Backgrounds" valueKeyPath:@"blurToolBackgrounds"];
  v331[7] = v68;
  v69 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Swipe to Exit Edit" valueKeyPath:@"swipeToExitEdit"];
  v331[8] = v69;
  v70 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Spatial Media Editing" valueKeyPath:@"enableSpatialMediaEditing"];
  v331[9] = v70;
  v71 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow disabled tools" valueKeyPath:@"allowDisabledTools"];
  v331[10] = v71;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v331 count:11];
  v294 = [v293 sectionWithRows:v72 title:@"Edit Tool Controller"];

  v290 = (void *)MEMORY[0x1E4F94160];
  v286 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable On All Hardware" valueKeyPath:@"overrideCleanupHardwareCheck"];
  v330[0] = v286;
  v282 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Sensitivity Check" valueKeyPath:@"retouchEnablesSensitivityCheck"];
  v330[1] = v282;
  v278 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Intersected Masks (debug)" valueKeyPath:@"retouchShowsIntersectedMasks"];
  v330[2] = v278;
  v274 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Target Point Brush (debug)" valueKeyPath:@"retouchShowsTargetPointBrushPoints"];
  v330[3] = v274;
  v271 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Brush Button" valueKeyPath:@"retouchShowsBrushButton"];
  v330[4] = v271;
  v268 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Object Detection From Strokes" valueKeyPath:@"retouchStrokeDisableObjectStrokes"];
  v330[5] = v268;
  v73 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Render Mask Bounding Box" valueKeyPath:@"retouchShowsMaskBoundingBox"];
  v330[6] = v73;
  v74 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Dump CoreImage Images" valueKeyPath:@"retouchDumpsCoreImageInputs"];
  v330[7] = v74;
  v75 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show VFX Controls" valueKeyPath:@"retouchShowVFXControls"];
  v330[8] = v75;
  v76 = [MEMORY[0x1E4F94108] rowWithTitle:@"Mask Display Mode" valueKeyPath:@"cleanupMaskDisplayMode"];
  v77 = [v76 possibleValues:&unk_1F078B2A0 titles:&unk_1F078B2B8];
  v330[9] = v77;
  v78 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Face Rects" valueKeyPath:@"retouchShowsFaceRects"];
  v330[10] = v78;
  v79 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Feedback Controls FCS Mode" valueKeyPath:@"feedbackUIFCS"];
  v330[11] = v79;
  v80 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Pixellate Faces" valueKeyPath:@"retouchPixellatesFaces"];
  v330[12] = v80;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v330 count:13];
  v291 = [v290 sectionWithRows:v81 title:@"Cleanup Tool"];

  v82 = (void *)MEMORY[0x1E4F94160];
  v83 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Styles Tab in Edit" valueKeyPath:@"enableSemanticStyleInEdit"];
  v329[0] = v83;
  v84 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Sync Styles Copy&Paste" valueKeyPath:@"synchronousStylesCopyPaste"];
  v329[1] = v84;
  v85 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Sync Live Photo Styles Copy&Paste" valueKeyPath:@"synchronousLivePhotoStylesCopyPaste"];
  v329[2] = v85;
  v86 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Should Use Flip Animation for Platter" valueKeyPath:@"shouldUseFlipAnimationForValuePlatter"];
  v329[3] = v86;
  v87 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Should Constraint Pad Values to Grid" valueKeyPath:@"shouldConstraintDpadValuesToGrid"];
  v329[4] = v87;
  v88 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Styles for ProRaw" valueKeyPath:@"shouldEnableStylesForProRaw"];
  v329[5] = v88;
  v89 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable On All Hardware" valueKeyPath:@"overrideSemanticStylesHardwareCheck"];
  v329[6] = v89;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v329 count:7];
  v287 = [v82 sectionWithRows:v90 title:@"Semantic Styles v2"];

  v91 = (void *)MEMORY[0x1E4F94160];
  v92 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Auto Enhance Action" valueKeyPath:@"showAutoEnhanceAction"];
  v328[0] = v92;
  v93 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Rotate Action" valueKeyPath:@"showRotateAction"];
  v328[1] = v93;
  v94 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Selective Copy Edits" valueKeyPath:@"enableSelectiveCopyEdits"];
  v328[2] = v94;
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v328 count:3];
  v283 = [v91 sectionWithRows:v95 title:@"Edit Actions"];

  v96 = (void *)MEMORY[0x1E4F94160];
  v97 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Preview Times Out" valueKeyPath:@"previewOriginalTimesOut"];
  v327[0] = v97;
  v98 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Preview Duration" valueKeyPath:@"previewOriginalDuration"];
  v99 = [v98 minValue:1.0 maxValue:3.0];
  v327[1] = v99;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v327 count:2];
  v279 = [v96 sectionWithRows:v100 title:@"Preview Original Tap"];

  v101 = (void *)MEMORY[0x1E4F94160];
  v102 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Download" valueKeyPath:@"simulateDownload"];
  v326[0] = v102;
  v103 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Failure" valueKeyPath:@"simulateDownloadFailure"];
  v104 = [v103 conditionFormat:@"simulateDownload != 0"];
  v326[1] = v104;
  v105 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Skip Loading displaySizeImage (Needs Relaunch)" valueKeyPath:@"skipPHContentEditingInputDisplaySizeImage"];
  v326[2] = v105;
  v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v326 count:3];
  v275 = [v101 sectionWithRows:v106 title:@"PhotoKit Settings"];

  v107 = (void *)MEMORY[0x1E4F94160];
  v108 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Error" valueKeyPath:@"simulateEditEntryError"];
  v325[0] = v108;
  v109 = [MEMORY[0x1E4F94108] rowWithTitle:@"Simulated Error" valueKeyPath:@"simulatedEditingEntryErrorType"];
  v110 = [v109 possibleValues:&unk_1F078B2D0 titles:&unk_1F078B2E8];
  v111 = [v110 conditionFormat:@"simulateEditEntryError != 0"];
  v325[1] = v111;
  v112 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show File Radar Button (Internal Only)" valueKeyPath:@"showFileRadarButtonForEditEntryOnInternalInstalls"];
  v325[2] = v112;
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v325 count:3];
  v272 = [v107 sectionWithRows:v113 title:@"Edit Entry Error Handling"];

  v114 = (void *)MEMORY[0x1E4F94160];
  v115 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Any Plugin" valueKeyPath:@"allowAnyPlugin"];
  v324[0] = v115;
  v116 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Attempt Extension Undo Auto-Setup" valueKeyPath:@"attemptEditExtensionUndoAutoSetup"];
  v324[1] = v116;
  v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v324 count:2];
  v269 = [v114 sectionWithRows:v117 title:@"Extension Settings"];

  v265 = (void *)MEMORY[0x1E4F94160];
  v118 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Stroke Width" valueKeyPath:@"strokeWidth"];
  v119 = [v118 minValue:0.0 maxValue:5.0];
  v323[0] = v119;
  v120 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Selection Ring Stroke" valueKeyPath:@"selectionRingStrokeWidth"];
  v121 = [v120 minValue:0.0 maxValue:5.0];
  v323[1] = v121;
  v122 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Label Platter Alpha" valueKeyPath:@"adjustmentLabelPlatterAlpha"];
  v123 = [v122 minValue:0.0 maxValue:1.0];
  v323[2] = v123;
  v124 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Show Adjustment Values" valueKeyPath:@"alwaysShowValueWhenAdjustmentIsSelected"];
  v323[3] = v124;
  v125 = (void *)MEMORY[0x1E4F940F8];
  v126 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_769];
  v127 = [v125 rowWithTitle:@"Clear Adjustments Pasteboard" action:v126];
  v323[4] = v127;
  v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:v323 count:5];
  v266 = [v265 sectionWithRows:v128 title:@"Adjustment Tool Settings"];

  v129 = (void *)MEMORY[0x1E4F94160];
  v130 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Debug HUD" valueKeyPath:@"enableSemanticDevelopmentHUD"];
  v322 = v130;
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v322 count:1];
  v263 = [v129 sectionWithRows:v131 title:@"Semantic Development Settings"];

  v260 = (void *)MEMORY[0x1E4F94160];
  v256 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Auto Crop" valueKeyPath:@"autoCropEnabled"];
  v321[0] = v256;
  v252 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Auto Crop (Degrees)" valueKeyPath:@"autoStraightenMaxAngle"];
  v249 = [v252 minValue:0.0 maxValue:10.0];
  v321[1] = v249;
  v246 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Crop Side Margins" valueKeyPath:@"cropSideMargins"];
  v132 = [v246 minValue:0.0 maxValue:32.0];
  v321[2] = v132;
  v133 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Straighten Wheel Radius" valueKeyPath:@"cropWheelSize"];
  v134 = [v133 minValue:300.0 maxValue:568.0];
  v321[3] = v134;
  v135 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Perspective Track Ball Radius" valueKeyPath:@"trackBallSize"];
  v136 = [v135 minValue:70.0 maxValue:150.0];
  v321[4] = v136;
  v137 = [MEMORY[0x1E4F941F0] rowWithTitle:@"New Perspective Debug Crop Rect" valueKeyPath:@"perspectiveViewDebugCropEnabled"];
  v321[5] = v137;
  v138 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Crop Mask Blur" valueKeyPath:@"cropMaskBlurred"];
  v321[6] = v138;
  v139 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Crop Recompose Delay" valueKeyPath:@"cropRecomposeDelay"];
  v140 = [v139 minValue:0.0 maxValue:1.5];
  v321[7] = v140;
  v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:v321 count:8];
  v261 = [v260 sectionWithRows:v141 title:@"Crop Tool Settings"];

  v257 = (void *)MEMORY[0x1E4F94160];
  v253 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Auto Yaw (Degrees)" valueKeyPath:@"autoPerspectiveMaxYaw"];
  v142 = [v253 minValue:0.0 maxValue:45.0];
  v320[0] = v142;
  v143 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Auto Pitch (Degrees)" valueKeyPath:@"autoPerspectiveMaxPitch"];
  v144 = [v143 minValue:0.0 maxValue:45.0];
  v320[1] = v144;
  v145 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Auto Angle (Degrees)" valueKeyPath:@"autoPerspectiveMaxAngle"];
  v146 = [v145 minValue:0.0 maxValue:45.0];
  v320[2] = v146;
  v147 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Face Size (% of image)" valueKeyPath:@"autoPerspectiveMaxFaceSize"];
  v148 = [v147 minValue:0.0 maxValue:100.0];
  v320[3] = v148;
  v149 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable On Panos (> 2:1 aspect)" valueKeyPath:@"autoPerspectiveDisableOnPanos"];
  v320[4] = v149;
  v150 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable On FFC Images" valueKeyPath:@"autoPerspectiveDisableOnFrontFacingCameraImages"];
  v320[5] = v150;
  v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:v320 count:6];
  v258 = [v257 sectionWithRows:v151 title:@"Auto Perspective Settings"];

  v152 = (void *)MEMORY[0x1E4F94160];
  v153 = [MEMORY[0x1E4F941F0] rowWithTitle:@"LPP: Changing lighting disables Live" valueKeyPath:@"changeLightingDisablesLive"];
  v319[0] = v153;
  v154 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Bounce/Loop Trim" valueKeyPath:@"loopBounceTrimAllowed"];
  v319[1] = v154;
  v155 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always allow key photo editing" valueKeyPath:@"alwaysAllowKeyPhotoEditing"];
  v319[2] = v155;
  v156 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Require tap to show Make Key/Poster Frame" valueKeyPath:@"requireTapToShowMakePosterFrame"];
  v319[3] = v156;
  v157 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Suggested Key Frames" valueKeyPath:@"showSuggestedKeyFrame"];
  v319[4] = v157;
  v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:v319 count:5];
  v254 = [v152 sectionWithRows:v158 title:@"Live Photo Settings"];

  v159 = (void *)MEMORY[0x1E4F94160];
  v160 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Pause after moving playhead" valueKeyPath:@"pauseAfterMovingPlayhead"];
  v318[0] = v160;
  v161 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Video: Allow Make Poster Frame" valueKeyPath:@"allowMakePosterFrameForVideo"];
  v318[1] = v161;
  v162 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Video Scrubber Debug Overlay" valueKeyPath:@"showVideoScrubberDebugOverlay"];
  v318[2] = v162;
  v163 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Filmstrip Thumbnails" valueKeyPath:@"disableVideoFilmstrip"];
  v318[3] = v163;
  v164 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Frame Number on Video Scrubber" valueKeyPath:@"showFrameNumberOnVideoScrubber"];
  v318[4] = v164;
  v165 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Tap Timeline to Seek" valueKeyPath:@"tapTimelineToSeek"];
  v318[5] = v165;
  v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:v318 count:6];
  v250 = [v159 sectionWithRows:v166 title:@"Video Settings"];

  v167 = (void *)MEMORY[0x1E4F94160];
  v168 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Stabilization Watermark" valueKeyPath:@"showStabilizationWatermark"];
  v317[0] = v168;
  v169 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Stabilization Adjustment" valueKeyPath:@"enableVideoStabilizion"];
  v317[1] = v169;
  v170 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Stabilize Crop Fraction" valueKeyPath:@"videoStabilizeMaxCropFraction"];
  v171 = [v170 minValue:0.0 maxValue:1.0];
  v317[2] = v171;
  v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:v317 count:3];
  v247 = [v167 sectionWithRows:v172 title:@"Video Stabilization Settings"];

  v173 = (void *)MEMORY[0x1E4F94160];
  v174 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Perf Debug HUD" valueKeyPath:@"enablePerfDebugHUD"];
  v316[0] = v174;
  v175 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Perf TTR Button" valueKeyPath:@"enablePerfTTRButton"];
  v316[1] = v175;
  v176 = [MEMORY[0x1E4F941D8] rowWithTitle:@"TTR Duration Threshold(s)" valueKeyPath:@"ttrButtonDurationThreshold"];
  v177 = [v176 minValue:0.1 maxValue:5.0];
  v316[2] = v177;
  v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:v316 count:3];
  v244 = [v173 sectionWithRows:v178 title:@"Edit Performance"];

  v241 = (void *)MEMORY[0x1E4F94160];
  v179 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable SmartTone AutoCalc" valueKeyPath:@"enableEnterEditSmartToneAutoCalc"];
  v315[0] = v179;
  v180 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable SmartColor AutoCalc" valueKeyPath:@"enableEnterEditSmartColorAutoCalc"];
  v315[1] = v180;
  v181 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable SemStyle AutoCalc" valueKeyPath:@"enableEnterEditSemanticStyleAutoCalc"];
  v315[2] = v181;
  v182 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Crop AutoCalc" valueKeyPath:@"enableEnterEditCropAutoCalc"];
  v315[3] = v182;
  v183 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Perspective AutoCalc" valueKeyPath:@"enableEnterEditPerspectiveAutoCalc"];
  v315[4] = v183;
  v184 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable DepthEffect AutoCalc" valueKeyPath:@"enableEnterEditDepthEffectAutoCalc"];
  v315[5] = v184;
  v185 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Portrait AutoCalc" valueKeyPath:@"enableEnterEditPortraitAutoCalc"];
  v315[6] = v185;
  v186 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Filter Thumbs" valueKeyPath:@"enableEnterEditFilterThumbnailGeneration"];
  v315[7] = v186;
  v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:v315 count:8];
  v242 = [v241 sectionWithRows:v187 title:@"Misc Enter Edit Perf"];

  v188 = (void *)MEMORY[0x1E4F94160];
  v189 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show SCAP Review Action" valueKeyPath:@"smartCopyPasteReviewUIEnabled"];
  v314[0] = v189;
  v190 = [MEMORY[0x1E4F941F0] rowWithTitle:@"[Gating] Use Capture Time Gating" valueKeyPath:@"smartCopyPasteCaptureTimeGating"];
  v314[1] = v190;
  v191 = [MEMORY[0x1E4F941D8] rowWithTitle:@"[Gating]  Similarity Gating Threshold" valueKeyPath:@"smartCopyPasteSimilarityGating"];
  v192 = [v191 minValue:0.0 maxValue:100.0];
  v193 = objc_msgSend(v192, "px_increment:", 0.5);
  v314[2] = v193;
  v194 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Affect Manually Edited Sliders Only" valueKeyPath:@"affectManuallyEditedSlidersOnly"];
  v314[3] = v194;
  v195 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Send ScenePrint if available" valueKeyPath:@"fetchAndSendScenePrintsForSliderNet"];
  v314[4] = v195;
  v196 = [MEMORY[0x1E4F1C978] arrayWithObjects:v314 count:5];
  v239 = [v188 sectionWithRows:v196 title:@"Smart Copy Paste"];

  v197 = (void *)MEMORY[0x1E4F94160];
  v198 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Toolbar Shadows Enabled" valueKeyPath:@"toolbarShadowsEnabled"];
  v313[0] = v198;
  v199 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Main Length" valueKeyPath:@"mainToolbarShadowLength"];
  v200 = [v199 minValue:0.0 maxValue:500.0];
  v313[1] = v200;
  v201 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Secondary Length" valueKeyPath:@"secondaryToolbarShadowLength"];
  v202 = [v201 minValue:0.0 maxValue:500.0];
  v313[2] = v202;
  v203 = [MEMORY[0x1E4F1C978] arrayWithObjects:v313 count:3];
  v238 = [v197 sectionWithRows:v203 title:@"Toolbar Shadow"];

  v204 = (void *)MEMORY[0x1E4F94160];
  v205 = (void *)MEMORY[0x1E4F941F0];
  v206 = NSStringFromSelector(sel_editMenuEnabled);
  v207 = [v205 rowWithTitle:@"Edit Menu Enabled" valueKeyPath:v206];
  v312 = v207;
  v208 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v312 count:1];
  v237 = [v204 sectionWithRows:v208 title:@"Edit Menu"];

  v235 = (void *)MEMORY[0x1E4F94160];
  v209 = (void *)MEMORY[0x1E4F941F0];
  v210 = NSStringFromSelector(sel_hideUIForInteractionEnabled);
  v211 = [v209 rowWithTitle:@"Enabled" valueKeyPath:v210];
  v311[0] = v211;
  v212 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade In" valueKeyPath:@"hideUIForInteractionFadeInDuration"];
  v213 = [v212 minValue:0.0 maxValue:3.0];
  v311[1] = v213;
  v214 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Out" valueKeyPath:@"hideUIForInteractionFadeOutDuration"];
  v215 = [v214 minValue:0.0 maxValue:3.0];
  v311[2] = v215;
  v216 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Delay" valueKeyPath:@"hideUIForInteractionFadeOutDelay"];
  v217 = [v216 minValue:0.0 maxValue:4.0];
  v311[3] = v217;
  v218 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Should Move toolbar offscreen in Landscape" valueKeyPath:@"shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation"];
  v311[4] = v218;
  v219 = [MEMORY[0x1E4F1C978] arrayWithObjects:v311 count:5];
  v236 = [v235 sectionWithRows:v219 title:@"Hide UI for Interaction"];

  v220 = (void *)MEMORY[0x1E4F94160];
  v221 = [MEMORY[0x1E4F94108] rowWithTitle:@"Simulated Download" valueKeyPath:@"simulatedModelCatalogDownload"];
  v222 = [v221 possibleValues:&unk_1F078B300 titles:&unk_1F078B318];
  v310 = v222;
  v223 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v310 count:1];
  v224 = [v220 sectionWithRows:v223 title:@"Model Catalog"];

  v225 = (void *)MEMORY[0x1E4F94160];
  v226 = (void *)MEMORY[0x1E4F940F8];
  v227 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v228 = [v226 rowWithTitle:@"Restore Defaults" action:v227];
  v309 = v228;
  v229 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v309 count:1];
  v230 = [v225 sectionWithRows:v229];

  id v233 = (id)MEMORY[0x1E4F94160];
  v308[0] = v294;
  v308[1] = v291;
  v308[2] = v287;
  v308[3] = v283;
  v308[4] = v307;
  v308[5] = v306;
  v308[6] = v304;
  v308[7] = v303;
  v308[8] = v302;
  v308[9] = v301;
  v308[10] = v300;
  v308[11] = v298;
  v308[12] = v296;
  v308[13] = v279;
  v308[14] = v275;
  v308[15] = v272;
  v308[16] = v239;
  v308[17] = v269;
  v308[18] = v263;
  v308[19] = v261;
  v308[20] = v258;
  v308[21] = v254;
  v308[22] = v250;
  v308[23] = v247;
  v308[24] = v244;
  v308[25] = v242;
  v308[26] = v266;
  v308[27] = v238;
  v308[28] = v237;
  v308[29] = v236;
  v308[30] = v224;
  v308[31] = v230;
  v231 = [MEMORY[0x1E4F1C978] arrayWithObjects:v308 count:32];
  id v234 = [v233 moduleWithTitle:@"Photo Editing" contents:v231];

  return v234;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_4()
{
  v0 = [MEMORY[0x1E4F910D8] sharedPresetManager];
  [v0 clearPasteboard];

  return 1;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_3()
{
  return 1;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  char v4 = +[PURenderDebugController shareSheetViewController];
  [v3 presentViewController:v4 animated:1 completion:0];

  return 1;
}

uint64_t __52__PUPhotoEditProtoSettings_settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  char v4 = +[PURenderDebugController listDebugFilesViewController];
  [v3 presentViewController:v4 animated:1 completion:0];

  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_59054 != -1) {
    dispatch_once(&sharedInstance_onceToken_59054, &__block_literal_global_59055);
  }
  v2 = (void *)sharedInstance_sharedInstance_59056;
  return v2;
}

void __42__PUPhotoEditProtoSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 photoEditingSettings];
  v1 = (void *)sharedInstance_sharedInstance_59056;
  sharedInstance_sharedInstance_59056 = v0;
}

@end