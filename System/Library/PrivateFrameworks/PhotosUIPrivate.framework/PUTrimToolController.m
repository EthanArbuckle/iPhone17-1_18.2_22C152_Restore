@interface PUTrimToolController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentPlayerScaledTimeFromOriginalTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_frameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_originalTimeFromCurrentPlayerScaledTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedStillFrameTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentStillFrameTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)debugPlayerTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playheadTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)suggestedKeyFrameTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedAssetDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime;
- (AVAsset)currentVideoAsset;
- (AVVideoComposition)currentVideoComposition;
- (BOOL)_allowsKeyFrameCreation;
- (BOOL)_showKeyFrameSelection;
- (BOOL)disabled;
- (BOOL)isPerformingLiveInteraction;
- (BOOL)isPortraitVideo;
- (BOOL)isSlomoEnabled;
- (BOOL)objectTrackingShouldStop;
- (BOOL)playButtonEnabled;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)portraitVideoEnabled;
- (BOOL)slomoDraggingStartHandle;
- (BOOL)slowMotionEditorRequestForceZoom:(id)a3;
- (BOOL)trimScrubber:(id)a3 canBeginInteractivelyEditingElement:(int64_t)a4;
- (CGRect)_presentationRectFromLoupeRect;
- (NSArray)focusEventTimes;
- (NSLayoutConstraint)scrubberContainerToAuxiliaryContainerConstraint;
- (NSLayoutConstraint)scrubberContainerToSuperviewConstraint;
- (NSNumber)slomoTimeForPlayheadUpdate;
- (NSTimer)livePhotoKeyFramePickerAppearanceTimer;
- (PICompositionController)compositionController;
- (PLEditSource)editSource;
- (PLPhotoEditRenderer)renderer;
- (PULivePhotoKeyFrameSelectionViewController)livePhotoKeyFramePicker;
- (PULivePhotoTrimScrubberSnapStripControllerSpec)snapStripSpec;
- (PUTrimToolController)initWithPlayerWrapper:(id)a3 playButtonEnabled:(BOOL)a4 slomoEnabled:(BOOL)a5 portraitVideoEnabled:(BOOL)a6;
- (PUTrimToolControllerDelegate)delegate;
- (PXFocusTimelineAction)focusTimelineAction;
- (PXFocusTimelineView)focusTimelineView;
- (PXLivePhotoTrimScrubberSnapStripController)snapStripController;
- (PXTrimToolPlayerWrapper)playerWrapper;
- (UIButton)playPauseButton;
- (UIButton)trimScrubberTimelineOverlayButton;
- (UIImage)placeholderImage;
- (UILabel)debugOriginalTimeLabel;
- (UILabel)debugPlayerTimeLabel;
- (UILabel)debugTimeCodeLabel;
- (UILabel)debugTrimToolPlayheadStyleLabel;
- (UILabel)debugTrimToolStateLabel;
- (UIView)debugEndOffsetView;
- (UIView)debugEndRectView;
- (UIView)debugStartOffsetView;
- (UIView)debugStartRectView;
- (UIView)trimScrubberTimelineOverlayView;
- (UIVisualEffectView)auxilaryContainerView;
- (UIVisualEffectView)scrubberPlayButtonContainerView;
- (double)_frameRate;
- (double)cachedFrameRate;
- (double)scrubberHeight;
- (id)_playPauseButtonIfLoaded;
- (id)_slomoMapperForCurrentConfiguration;
- (id)axDescriptionForFocusEventATime:(id *)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)currentlyInteractingElement;
- (int64_t)layoutOrientation;
- (unint64_t)internalState;
- (unint64_t)playheadStyle;
- (unint64_t)state;
- (void)_createRendererIfNeeded;
- (void)_didCompleteInteractiveEditForElement:(int64_t)a3 atTime:(id *)a4 state:(unint64_t)a5;
- (void)_dismissKeyFramePickerAndResetToStillFrame;
- (void)_handlePlayPauseButton:(id)a3;
- (void)_handleScrubberTimelineOverlayButton:(id)a3;
- (void)_hideScrubberTimelineOverlay;
- (void)_livePhotoKeyFramePickerDidDismiss:(id)a3;
- (void)_resetScrubberToStillPhotoFrame;
- (void)_seekToTimeForElement:(int64_t)a3 exact:(BOOL)a4;
- (void)_seekToTimeForElement:(int64_t)a3 exact:(BOOL)a4 forceSeek:(BOOL)a5;
- (void)_setPosterFrameTime:(id *)a3 onCompositionController:(id)a4;
- (void)_setState:(unint64_t)a3;
- (void)_updateCompositionController;
- (void)_updateDebugPlayerTimeLabel;
- (void)_updateDebugPlayheadStyleLabel;
- (void)_updateDebugTimeCodeLabel;
- (void)_updateDebugTrimToolStateLabel;
- (void)_updatePlayPauseButton;
- (void)_updatePlayerWrapperTimeObserver;
- (void)_updatePlayerWrapperTrim;
- (void)_updatePlayheadStyle;
- (void)_updatePublicState;
- (void)_updateScrubberContents;
- (void)_updateScrubberFocusEventTimes;
- (void)_updateScrubberPresentedPlayhead;
- (void)_updateScrubberTimelineOverlayButtonOffset;
- (void)_updateScrubberTimes;
- (void)_updateSlomoViewAnimated:(BOOL)a3;
- (void)_updateSnapStripController;
- (void)_updateSnappingDots;
- (void)_updateTimeCodeOverlay;
- (void)_updateVideo;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)compositionDidUpdateForPlayerWrapper:(id)a3;
- (void)didUpdateFocusEventsWithTimes:(id)a3;
- (void)enableFocusTimeline:(BOOL)a3;
- (void)enableUIForCinematographyScriptLoad:(BOOL)a3;
- (void)focusTimeline:(id)a3 presentAction:(id)a4 locationInTimeline:(CGPoint)a5;
- (void)focusTimeline:(id)a3 updateTrackingProgressShouldStop:(BOOL *)a4;
- (void)livePhotoRenderDidChange:(BOOL)a3;
- (void)objectTrackingFinishedWithSuccess:(BOOL)a3;
- (void)objectTrackingStartedAtTime:(id *)a3;
- (void)pause;
- (void)play;
- (void)playerStatusChangedForPlayerWrapper:(id)a3;
- (void)playerWrapper:(id)a3 timeChanged:(id *)a4;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)releaseAVObjects;
- (void)resetTimeline;
- (void)setAdjustedStillFrameTime:(id *)a3;
- (void)setAuxilaryContainerView:(id)a3;
- (void)setCachedFrameDuration:(id *)a3;
- (void)setCachedFrameRate:(double)a3;
- (void)setCompositionController:(id)a3;
- (void)setDebugEndOffsetView:(id)a3;
- (void)setDebugEndRectView:(id)a3;
- (void)setDebugOriginalTimeLabel:(id)a3;
- (void)setDebugPlayerTime:(id *)a3;
- (void)setDebugPlayerTimeLabel:(id)a3;
- (void)setDebugStartOffsetView:(id)a3;
- (void)setDebugStartRectView:(id)a3;
- (void)setDebugTimeCodeLabel:(id)a3;
- (void)setDebugTrimToolPlayheadStyleLabel:(id)a3;
- (void)setDebugTrimToolStateLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEditSource:(id)a3;
- (void)setFocusEventTimes:(id)a3;
- (void)setFocusTimelineAction:(id)a3;
- (void)setFocusTimelineView:(id)a3;
- (void)setInternalState:(unint64_t)a3;
- (void)setIsPerformingLiveInteraction:(BOOL)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLivePhotoKeyFramePicker:(id)a3;
- (void)setLivePhotoKeyFramePickerAppearanceTimer:(id)a3;
- (void)setObjectTrackingShouldStop:(BOOL)a3;
- (void)setOriginalEndTime:(id *)a3;
- (void)setOriginalStartTime:(id *)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlayheadStyle:(unint64_t)a3;
- (void)setPlayheadTime:(id *)a3;
- (void)setPlayheadTime:(id *)a3 forceSeek:(BOOL)a4;
- (void)setPortraitVideoEnabled:(BOOL)a3;
- (void)setRenderer:(id)a3;
- (void)setScrubberContainerToAuxiliaryContainerConstraint:(id)a3;
- (void)setScrubberContainerToSuperviewConstraint:(id)a3;
- (void)setScrubberPlayButtonContainerView:(id)a3;
- (void)setSlomoDraggingStartHandle:(BOOL)a3;
- (void)setSlomoEnabled:(BOOL)a3;
- (void)setSlomoTimeForPlayheadUpdate:(id)a3;
- (void)setSnapStripController:(id)a3;
- (void)setSnapStripSpec:(id)a3;
- (void)setSuggestedKeyFrameTime:(id *)a3;
- (void)setTrimScrubberTimelineOverlayButton:(id)a3;
- (void)setTrimScrubberTimelineOverlayView:(id)a3;
- (void)setUnadjustedAssetDuration:(id *)a3;
- (void)setUnadjustedStillImageTime:(id *)a3;
- (void)showFocusTimeline:(BOOL)a3;
- (void)slowMotionEditorDidBeginEditing:(id)a3 withStartHandle:(BOOL)a4;
- (void)slowMotionEditorDidEndEditing:(id)a3;
- (void)slowMotionEditorEndValueChanged:(id)a3;
- (void)slowMotionEditorRequestForceUnzoom:(id)a3;
- (void)slowMotionEditorStartValueChanged:(id)a3;
- (void)stepByCount:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)trimScrubber:(id)a3 debugEndOffset:(CGRect)a4;
- (void)trimScrubber:(id)a3 debugEndRect:(CGRect)a4;
- (void)trimScrubber:(id)a3 debugStartOffset:(CGRect)a4;
- (void)trimScrubber:(id)a3 debugStartRect:(CGRect)a4;
- (void)trimScrubber:(id)a3 didBeginInteractivelyEditingElement:(int64_t)a4;
- (void)trimScrubber:(id)a3 didChangeTimeForElement:(int64_t)a4;
- (void)trimScrubber:(id)a3 didEndInteractivelyEditingElement:(int64_t)a4 successful:(BOOL)a5;
- (void)trimScrubber:(id)a3 didTapElement:(int64_t)a4;
- (void)trimScrubber:(id)a3 didTapTimelineAtTime:(id *)a4;
- (void)trimScrubber:(id)a3 didZoomToMinimumValue:(double)a4 maximumValue:(double)a5;
- (void)trimScrubberAssetDurationDidChange:(id)a3;
- (void)trimScrubberDidLayoutSubviews:(id)a3;
- (void)trimScrubberDidUnzoom:(id)a3;
- (void)trimScrubberPausePlayer:(id)a3;
- (void)updateFocusTimeline;
- (void)updateFocusTimelineWithEvent:(id *)a3 userInitiated:(BOOL)a4 shouldAnimate:(BOOL)a5;
- (void)updateFocusTimelineWithTimeRange:(id *)a3;
- (void)updateLivePortraitForKeyFrameChange:(id)a3;
- (void)updateObjectTrackingProgressAtTime:(id *)a3 shouldStop:(BOOL *)a4;
- (void)userDidRequestToMakeKeyPhoto:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willHideTrimTool;
- (void)willShowTrimTool;
@end

@implementation PUTrimToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusEventTimes, 0);
  objc_storeStrong((id *)&self->_focusTimelineAction, 0);
  objc_storeStrong((id *)&self->_trimScrubberTimelineOverlayButton, 0);
  objc_storeStrong((id *)&self->_trimScrubberTimelineOverlayView, 0);
  objc_storeStrong((id *)&self->_focusTimelineView, 0);
  objc_storeStrong((id *)&self->_debugEndOffsetView, 0);
  objc_storeStrong((id *)&self->_debugStartOffsetView, 0);
  objc_storeStrong((id *)&self->_debugEndRectView, 0);
  objc_storeStrong((id *)&self->_debugStartRectView, 0);
  objc_storeStrong((id *)&self->_debugTrimToolPlayheadStyleLabel, 0);
  objc_storeStrong((id *)&self->_debugTrimToolStateLabel, 0);
  objc_storeStrong((id *)&self->_debugOriginalTimeLabel, 0);
  objc_storeStrong((id *)&self->_debugPlayerTimeLabel, 0);
  objc_storeStrong((id *)&self->_debugTimeCodeLabel, 0);
  objc_storeStrong((id *)&self->_slomoTimeForPlayheadUpdate, 0);
  objc_storeStrong((id *)&self->_snapStripSpec, 0);
  objc_storeStrong((id *)&self->_snapStripController, 0);
  objc_storeStrong((id *)&self->_currentVideoComposition, 0);
  objc_storeStrong((id *)&self->_currentVideoAsset, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_livePhotoKeyFramePickerAppearanceTimer, 0);
  objc_destroyWeak((id *)&self->_livePhotoKeyFramePicker);
  objc_storeStrong((id *)&self->_scrubberContainerToSuperviewConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberContainerToAuxiliaryContainerConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberPlayButtonContainerView, 0);
  objc_storeStrong((id *)&self->_auxilaryContainerView, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_playerWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_updateVideoCoalescer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_timeCodeHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_timeCodeOverlayView, 0);
  objc_storeStrong((id *)&self->_slomoView, 0);
  objc_storeStrong((id *)&self->_trimScrubber, 0);
}

- (void)setFocusEventTimes:(id)a3
{
}

- (NSArray)focusEventTimes
{
  return self->_focusEventTimes;
}

- (void)setPortraitVideoEnabled:(BOOL)a3
{
  self->_portraitVideoEnabled = a3;
}

- (BOOL)portraitVideoEnabled
{
  return self->_portraitVideoEnabled;
}

- (void)setObjectTrackingShouldStop:(BOOL)a3
{
  self->_objectTrackingShouldStop = a3;
}

- (BOOL)objectTrackingShouldStop
{
  return self->_objectTrackingShouldStop;
}

- (void)setFocusTimelineAction:(id)a3
{
}

- (PXFocusTimelineAction)focusTimelineAction
{
  return self->_focusTimelineAction;
}

- (void)setTrimScrubberTimelineOverlayButton:(id)a3
{
}

- (UIButton)trimScrubberTimelineOverlayButton
{
  return self->_trimScrubberTimelineOverlayButton;
}

- (void)setTrimScrubberTimelineOverlayView:(id)a3
{
}

- (UIView)trimScrubberTimelineOverlayView
{
  return self->_trimScrubberTimelineOverlayView;
}

- (void)setFocusTimelineView:(id)a3
{
}

- (PXFocusTimelineView)focusTimelineView
{
  return self->_focusTimelineView;
}

- (void)setDebugEndOffsetView:(id)a3
{
}

- (UIView)debugEndOffsetView
{
  return self->_debugEndOffsetView;
}

- (void)setDebugStartOffsetView:(id)a3
{
}

- (UIView)debugStartOffsetView
{
  return self->_debugStartOffsetView;
}

- (void)setDebugEndRectView:(id)a3
{
}

- (UIView)debugEndRectView
{
  return self->_debugEndRectView;
}

- (void)setDebugStartRectView:(id)a3
{
}

- (UIView)debugStartRectView
{
  return self->_debugStartRectView;
}

- (void)setDebugTrimToolPlayheadStyleLabel:(id)a3
{
}

- (UILabel)debugTrimToolPlayheadStyleLabel
{
  return self->_debugTrimToolPlayheadStyleLabel;
}

- (void)setDebugTrimToolStateLabel:(id)a3
{
}

- (UILabel)debugTrimToolStateLabel
{
  return self->_debugTrimToolStateLabel;
}

- (void)setDebugOriginalTimeLabel:(id)a3
{
}

- (UILabel)debugOriginalTimeLabel
{
  return self->_debugOriginalTimeLabel;
}

- (void)setDebugPlayerTimeLabel:(id)a3
{
}

- (UILabel)debugPlayerTimeLabel
{
  return self->_debugPlayerTimeLabel;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)debugPlayerTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1480);
  return self;
}

- (void)setDebugTimeCodeLabel:(id)a3
{
}

- (UILabel)debugTimeCodeLabel
{
  return self->_debugTimeCodeLabel;
}

- (void)setSlomoTimeForPlayheadUpdate:(id)a3
{
}

- (NSNumber)slomoTimeForPlayheadUpdate
{
  return self->_slomoTimeForPlayheadUpdate;
}

- (BOOL)playButtonEnabled
{
  return self->_playButtonEnabled;
}

- (void)setSlomoDraggingStartHandle:(BOOL)a3
{
  self->_slomoDraggingStartHandle = a3;
}

- (BOOL)slomoDraggingStartHandle
{
  return self->_slomoDraggingStartHandle;
}

- (unint64_t)internalState
{
  return self->_internalState;
}

- (unint64_t)playheadStyle
{
  return self->_playheadStyle;
}

- (void)setUnadjustedAssetDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_unadjustedAssetDuration.value = *(_OWORD *)&a3->var0;
  self->_unadjustedAssetDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedAssetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1456);
  return self;
}

- (void)setSnapStripSpec:(id)a3
{
}

- (PULivePhotoTrimScrubberSnapStripControllerSpec)snapStripSpec
{
  return self->_snapStripSpec;
}

- (void)setSnapStripController:(id)a3
{
}

- (PXLivePhotoTrimScrubberSnapStripController)snapStripController
{
  return self->_snapStripController;
}

- (void)setCachedFrameRate:(double)a3
{
  self->_cachedFrameRate = a3;
}

- (double)cachedFrameRate
{
  return self->_cachedFrameRate;
}

- (void)setCachedFrameDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_cachedFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_cachedFrameDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1432);
  return self;
}

- (AVVideoComposition)currentVideoComposition
{
  return self->_currentVideoComposition;
}

- (AVAsset)currentVideoAsset
{
  return self->_currentVideoAsset;
}

- (void)setRenderer:(id)a3
{
}

- (PLPhotoEditRenderer)renderer
{
  return self->_renderer;
}

- (void)setLivePhotoKeyFramePickerAppearanceTimer:(id)a3
{
}

- (NSTimer)livePhotoKeyFramePickerAppearanceTimer
{
  return self->_livePhotoKeyFramePickerAppearanceTimer;
}

- (void)setLivePhotoKeyFramePicker:(id)a3
{
}

- (PULivePhotoKeyFrameSelectionViewController)livePhotoKeyFramePicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_livePhotoKeyFramePicker);
  return (PULivePhotoKeyFrameSelectionViewController *)WeakRetained;
}

- (void)setScrubberContainerToSuperviewConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrubberContainerToSuperviewConstraint
{
  return self->_scrubberContainerToSuperviewConstraint;
}

- (void)setScrubberContainerToAuxiliaryContainerConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrubberContainerToAuxiliaryContainerConstraint
{
  return self->_scrubberContainerToAuxiliaryContainerConstraint;
}

- (void)setScrubberPlayButtonContainerView:(id)a3
{
}

- (UIVisualEffectView)scrubberPlayButtonContainerView
{
  return self->_scrubberPlayButtonContainerView;
}

- (void)setAuxilaryContainerView:(id)a3
{
}

- (UIVisualEffectView)auxilaryContainerView
{
  return self->_auxilaryContainerView;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (BOOL)isPortraitVideo
{
  return self->_isPortraitVideo;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setIsPerformingLiveInteraction:(BOOL)a3
{
  self->_isPerformingLiveInteraction = a3;
}

- (BOOL)isPerformingLiveInteraction
{
  return self->_isPerformingLiveInteraction;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setSuggestedKeyFrameTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_suggestedKeyFrameTime.value = *(_OWORD *)&a3->var0;
  self->_suggestedKeyFrameTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)suggestedKeyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1408);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1384);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1360);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1336);
  return self;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (PXTrimToolPlayerWrapper)playerWrapper
{
  return self->_playerWrapper;
}

- (void)setDelegate:(id)a3
{
}

- (PUTrimToolControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUTrimToolControllerDelegate *)WeakRetained;
}

- (id)axDescriptionForFocusEventATime:(id *)a3
{
  v4 = [(PUTrimToolController *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  v5 = [v4 axDescriptionForFocusDecisionAtTime:&v7];

  return v5;
}

- (void)focusTimeline:(id)a3 updateTrackingProgressShouldStop:(BOOL *)a4
{
  if (self->_objectTrackingShouldStop) {
    *a4 = 1;
  }
}

- (void)focusTimeline:(id)a3 presentAction:(id)a4 locationInTimeline:(CGPoint)a5
{
  id v7 = a4;
  v8 = [(PUTrimToolController *)self playerWrapper];
  [v8 pause];

  v9 = [(PUTrimToolController *)self playerWrapper];
  if (v7) {
    [v7 time];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  [v9 seekToTime:v16];

  if ([v7 kind] == 2)
  {
    [(PUTrimToolController *)self _hideScrubberTimelineOverlay];
  }
  else
  {
    objc_storeStrong((id *)&self->_focusTimelineAction, a4);
    self->_objectTrackingShouldStop = 0;
    if ([v7 kind]) {
      v10 = @"xmark";
    }
    else {
      v10 = @"trash";
    }
    v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v10];
    v12 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    v13 = [v11 imageWithSymbolConfiguration:v12];

    [(UIButton *)self->_trimScrubberTimelineOverlayButton setImage:v13 forState:0];
    [(PUTrimToolController *)self _updateScrubberTimelineOverlayButtonOffset];
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setPlayheadStyle:0];
    [(UIView *)self->_trimScrubberTimelineOverlayView setHidden:0];
    v14 = [(PUTrimToolController *)self playPauseButton];
    [v14 setEnabled:0];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__PUTrimToolController_focusTimeline_presentAction_locationInTimeline___block_invoke;
    v15[3] = &unk_1E5F2ED10;
    v15[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v15 animations:0.2];
  }
}

uint64_t __71__PUTrimToolController_focusTimeline_presentAction_locationInTimeline___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1304) setAlpha:1.0];
}

- (void)_hideScrubberTimelineOverlay
{
  if (![(UIView *)self->_trimScrubberTimelineOverlayView isHidden])
  {
    focusTimelineAction = self->_focusTimelineAction;
    self->_focusTimelineAction = 0;

    v4 = [(PUTrimToolController *)self playPauseButton];
    [v4 setEnabled:1];

    [(PUTrimToolController *)self _updateScrubberPresentedPlayhead];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__PUTrimToolController__hideScrubberTimelineOverlay__block_invoke;
    v5[3] = &unk_1E5F2ED10;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.2];
  }
}

uint64_t __52__PUTrimToolController__hideScrubberTimelineOverlay__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1304) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1304);
  return [v2 setHidden:1];
}

- (void)_updateScrubberTimelineOverlayButtonOffset
{
  if ([(PUTrimToolController *)self isPortraitVideo] && self->_focusTimelineAction)
  {
    if ([(PXLivePhotoTrimScrubber *)self->_trimScrubber useMiniScrubber]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 4.0;
    }
    [(PUTrimToolController *)self scrubberHeight];
    double v5 = v4 + v3 * -2.0;
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber frame];
    double MidY = CGRectGetMidY(v12);
    trimScrubber = self->_trimScrubber;
    focusTimelineAction = self->_focusTimelineAction;
    if (focusTimelineAction) {
      [(PXFocusTimelineAction *)focusTimelineAction time];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    [(PXLivePhotoTrimScrubber *)trimScrubber offsetForTime:v11];
    -[UIButton setFrame:](self->_trimScrubberTimelineOverlayButton, "setFrame:", v9 - v5 * 0.5, MidY - v5 * 0.5, v5, v5);
    v10 = [(UIButton *)self->_trimScrubberTimelineOverlayButton layer];
    [v10 setCornerRadius:v5 * 0.5];
  }
}

- (void)_handleScrubberTimelineOverlayButton:(id)a3
{
  focusTimelineAction = self->_focusTimelineAction;
  if (focusTimelineAction)
  {
    uint64_t v5 = [(PXFocusTimelineAction *)focusTimelineAction kind];
    if (v5 == 1)
    {
      self->_objectTrackingShouldStop = 1;
    }
    else if (!v5)
    {
      v6 = [(PUTrimToolController *)self delegate];
      id v7 = self->_focusTimelineAction;
      if (v7) {
        [(PXFocusTimelineAction *)v7 time];
      }
      else {
        memset(v8, 0, sizeof(v8));
      }
      [v6 removeFocusDecisionAtTime:v8];
    }
    [(PUTrimToolController *)self _hideScrubberTimelineOverlay];
  }
}

- (void)slowMotionEditorRequestForceUnzoom:(id)a3
{
}

- (BOOL)slowMotionEditorRequestForceZoom:(id)a3
{
  BOOL v4 = [(PUTrimToolController *)self slomoDraggingStartHandle];
  slomoView = self->_slomoView;
  if (v4) {
    [(PXSlowMotionEditor *)slomoView startValue];
  }
  else {
    [(PXSlowMotionEditor *)slomoView endValue];
  }
  trimScrubber = self->_trimScrubber;
  CMTimeMakeWithSeconds(&v9, v6, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
  return [(PXLivePhotoTrimScrubber *)trimScrubber tryZoomAtTime:&v9];
}

- (void)slowMotionEditorEndValueChanged:(id)a3
{
  [(PXSlowMotionEditor *)self->_slomoView endValue];
  CMTimeMakeWithSeconds(&v8, v4, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
  CMTime v7 = v8;
  [(PUTrimToolController *)self setPlayheadTime:&v7];
  uint64_t v5 = NSNumber;
  [(PXSlowMotionEditor *)self->_slomoView endValue];
  Float64 v6 = objc_msgSend(v5, "numberWithDouble:");
  [(PUTrimToolController *)self setSlomoTimeForPlayheadUpdate:v6];

  [(PUTrimToolController *)self _updateTimeCodeOverlay];
}

- (void)slowMotionEditorStartValueChanged:(id)a3
{
  [(PXSlowMotionEditor *)self->_slomoView startValue];
  CMTimeMakeWithSeconds(&v8, v4, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
  CMTime v7 = v8;
  [(PUTrimToolController *)self setPlayheadTime:&v7];
  uint64_t v5 = NSNumber;
  [(PXSlowMotionEditor *)self->_slomoView startValue];
  Float64 v6 = objc_msgSend(v5, "numberWithDouble:");
  [(PUTrimToolController *)self setSlomoTimeForPlayheadUpdate:v6];

  [(PUTrimToolController *)self _updateTimeCodeOverlay];
}

- (void)slowMotionEditorDidEndEditing:(id)a3
{
  [(PUTrimToolController *)self setInternalState:0];
  Float64 v4 = [(PUTrimToolController *)self compositionController];
  uint64_t v5 = *MEMORY[0x1E4F8A580];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PUTrimToolController_slowMotionEditorDidEndEditing___block_invoke;
  void v8[3] = &unk_1E5F2D698;
  v8[4] = self;
  [v4 modifyAdjustmentWithKey:v5 modificationBlock:v8];

  [(PUTrimToolController *)self _updateCompositionController];
  [(PUTrimToolController *)self _updateDebugTimeCodeLabel];
  PLSAggregateDictionaryAddValueForScalarKey();
  Float64 v6 = [(PUTrimToolController *)self delegate];
  CMTime v7 = PULocalizedString(@"PHOTOEDIT_SLOMO_ACTION_TITLE");
  [v6 didModifyAdjustmentWithLocalizedName:v7];
}

void __54__PUTrimToolController_slowMotionEditorDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(*(void *)(a1 + 32) + 984);
  id v4 = a2;
  [v3 startValue];
  CMTimeMakeWithSeconds(&v10, v5, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
  CMTime v9 = v10;
  [v4 setStartTime:&v9];
  [*(id *)(*(void *)(a1 + 32) + 984) endValue];
  CMTimeMakeWithSeconds(&v8, v6, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
  CMTime v7 = v8;
  [v4 setEndTime:&v7];
}

- (void)slowMotionEditorDidBeginEditing:(id)a3 withStartHandle:(BOOL)a4
{
  BOOL v4 = a4;
  Float64 v6 = [(PUTrimToolController *)self delegate];
  [v6 willModifyAdjustment];

  [(PUTrimToolController *)self setInternalState:3];
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setPlayheadStyle:0];
  [(PUTrimToolController *)self setSlomoDraggingStartHandle:v4];
  [(PUTrimToolController *)self _updateTimeCodeOverlay];
  [(PUTrimToolController *)self _dismissKeyFramePickerAndResetToStillFrame];
}

- (void)updateLivePortraitForKeyFrameChange:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PUTrimToolController *)self delegate];
  Float64 v5 = [v4 livePortraitBehaviorController];

  if (v5) {
    [v5 applySideEffectsForAction:5 compositionController:v6];
  }
}

- (void)userDidRequestToMakeKeyPhoto:(id)a3
{
  id v4 = a3;
  id v5 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

  if (v5 == v4)
  {
    id v6 = [(PUTrimToolController *)self delegate];
    [v6 willModifyAdjustment];

    trimScrubber = self->_trimScrubber;
    if (trimScrubber)
    {
      [(PXLivePhotoTrimScrubber *)trimScrubber keyTime];
    }
    else
    {
      long long v23 = 0uLL;
      uint64_t v24 = 0;
    }
    long long v21 = v23;
    uint64_t v22 = v24;
    [(PUTrimToolController *)self setAdjustedStillFrameTime:&v21];
    [(PUTrimToolController *)self _updateCompositionController];
    CMTime v8 = [(PUTrimToolController *)self compositionController];
    [(PUTrimToolController *)self updateLivePortraitForKeyFrameChange:v8];

    [(PUTrimToolController *)self _updateScrubberTimes];
    CMTime v9 = [(PUTrimToolController *)self delegate];
    CMTime v10 = PULocalizedString(@"PHOTOEDIT_MAKE_KEY_FRAME_ACTION_TITLE");
    [v9 didModifyAdjustmentWithLocalizedName:v10];

    v11 = self->_trimScrubber;
    if (v11) {
      [(PXLivePhotoTrimScrubber *)v11 keyTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    [(PUTrimToolController *)self unadjustedStillImageTime];
    int32_t v12 = CMTimeCompare(&time1, &time2);
    v13 = [(PUTrimToolController *)self delegate];
    v14 = v13;
    if (v12) {
      [v13 removeCropToolGainMap];
    }
    else {
      [v13 addCropToolGainMapIfNeeded];
    }

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__PUTrimToolController_userDidRequestToMakeKeyPhoto___block_invoke;
    v15[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    [v16 dismissViewControllerAnimated:1 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __53__PUTrimToolController_userDidRequestToMakeKeyPhoto___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _livePhotoKeyFramePickerDidDismiss:*(void *)(a1 + 32)];
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = [a3 presentedViewController];
  id v5 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

  if (v4 == v5)
  {
    id v6 = [(PUTrimToolController *)self livePhotoKeyFramePicker];
    [(PUTrimToolController *)self _livePhotoKeyFramePickerDidDismiss:v6];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)playerWrapper:(id)a3 timeChanged:(id *)a4
{
}

uint64_t __50__PUTrimToolController_playerWrapper_timeChanged___block_invoke(uint64_t a1)
{
  v2 = (long long *)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 56);
  if (![*(id *)(*(void *)(a1 + 32) + 976) currentlyInteractingElement])
  {
    long long v12 = 0uLL;
    uint64_t v13 = 0;
    double v3 = *(void **)(a1 + 32);
    long long v10 = v14;
    uint64_t v11 = v15;
    [v3 _originalTimeFromCurrentPlayerScaledTime:&v10];
    id v4 = *(void **)(*(void *)(a1 + 32) + 976);
    long long v8 = v12;
    uint64_t v9 = v13;
    [v4 setKeyTime:&v8];
  }
  long long v6 = *v2;
  uint64_t v7 = *((void *)v2 + 2);
  return [*(id *)(a1 + 32) setDebugPlayerTime:&v6];
}

- (void)playerStatusChangedForPlayerWrapper:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __60__PUTrimToolController_playerStatusChangedForPlayerWrapper___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] != 2) {
    objc_msgSend(*(id *)(a1 + 32), "setInternalState:", objc_msgSend(*(id *)(a1 + 40), "isPlaying"));
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _updatePlayPauseButton];
}

- (void)compositionDidUpdateForPlayerWrapper:(id)a3
{
}

void __61__PUTrimToolController_compositionDidUpdateForPlayerWrapper___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[993])
  {
    id v4 = [v2 currentVideoAsset];

    if (v4) {
      return;
    }
    v2 = *(unsigned char **)(a1 + 32);
  }
  v2[993] = 0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 1032);
  [v3 update];
}

- (id)_slomoMapperForCurrentConfiguration
{
  id v3 = [(PUTrimToolController *)self compositionController];
  id v4 = [v3 slomoAdjustmentController];

  memset(&v24, 0, sizeof(v24));
  if (v4)
  {
    [v4 startTime];
    [v4 endTime];
  }
  else
  {
    memset(&start, 0, sizeof(start));
    memset(&end, 0, sizeof(end));
  }
  CMTimeRangeFromTimeToTime(&v24, &start, &end);
  long long v20 = 0uLL;
  CMTimeEpoch v21 = 0;
  id v5 = [(PUTrimToolController *)self currentVideoAsset];
  long long v6 = v5;
  if (v5)
  {
    [v5 duration];
  }
  else
  {
    long long v20 = 0uLL;
    CMTimeEpoch v21 = 0;
  }

  uint64_t v7 = [(PUTrimToolController *)self compositionController];
  long long v8 = [v7 trimAdjustmentController];

  if (v8)
  {
    memset(&v19, 0, sizeof(v19));
    [v8 startTime];
    *(_OWORD *)&v15.start.value = *(_OWORD *)&v24.start.value;
    v15.start.epoch = v24.start.epoch;
    CMTime rhs = v19;
    CMTimeSubtract(&time.start, &v15.start, &rhs);
    *(_OWORD *)&v24.start.value = *(_OWORD *)&time.start.value;
    v24.start.epoch = time.start.epoch;
    *(_OWORD *)&time.start.value = *MEMORY[0x1E4F1FA48];
    time.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&v15.start.value = *MEMORY[0x1E4F1FA10];
    v15.start.epoch = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    CMTimeRangeMake(&otherRange, &time.start, &v15.start);
    CMTimeRange v15 = v24;
    CMTimeRangeGetIntersection(&time, &v15, &otherRange);
    CMTimeRange v24 = time;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F8CDA0];
  *(_OWORD *)&time.start.value = v20;
  time.start.epoch = v21;
  double Seconds = CMTimeGetSeconds(&time.start);
  [v4 rate];
  *(float *)&double v12 = v11;
  CMTimeRange time = v24;
  uint64_t v13 = [v9 timeRangeMapperForSourceDuration:&time slowMotionRate:1 slowMotionTimeRange:Seconds forExport:v12];

  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_originalTimeFromCurrentPlayerScaledTime:(SEL)a3
{
  *retstr = *a4;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PUTrimToolController *)self isSlomoEnabled];
  if (result && (a4->var2 & 0x1D) == 1)
  {
    long long v8 = [(PUTrimToolController *)self compositionController];
    uint64_t v9 = [v8 trimAdjustmentController];

    if (v9)
    {
      [v9 startTime];
      CMTime lhs = (CMTime)*a4;
      CMTimeSubtract(&time, &lhs, &rhs);
      *(CMTime *)a4 = time;
    }
    long long v10 = [(PUTrimToolController *)self _slomoMapperForCurrentConfiguration];
    if (v10)
    {
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(float *)&Float64 Seconds = Seconds;
      [v10 originalTimeForScaledTime:Seconds];
      CMTimeMakeWithSeconds(&time, v12, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
      *(CMTime *)retstr = time;
    }
    if (v9)
    {
      [v9 startTime];
      CMTime lhs = (CMTime)*retstr;
      CMTimeAdd(&time, &lhs, &v13);
      *(CMTime *)retstr = time;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentPlayerScaledTimeFromOriginalTime:(SEL)a3
{
  *retstr = *a4;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PUTrimToolController *)self isSlomoEnabled];
  if (result && (a4->var2 & 0x1D) == 1)
  {
    long long v8 = [(PUTrimToolController *)self compositionController];
    uint64_t v9 = [v8 trimAdjustmentController];

    if (v9)
    {
      [v9 startTime];
      CMTime lhs = (CMTime)*a4;
      CMTimeSubtract(&time, &lhs, &rhs);
      *(CMTime *)a4 = time;
    }
    long long v10 = [(PUTrimToolController *)self _slomoMapperForCurrentConfiguration];
    if (v10)
    {
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(float *)&Float64 Seconds = Seconds;
      [v10 scaledTimeForOriginalTime:Seconds];
      CMTimeMakeWithSeconds(&time, v12, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
      *(CMTime *)retstr = time;
    }
    if (v9)
    {
      [v9 startTime];
      CMTime lhs = (CMTime)*retstr;
      CMTimeAdd(&time, &lhs, &v13);
      *(CMTime *)retstr = time;
    }
  }
  return result;
}

- (void)stepByCount:(int64_t)a3
{
  id v5 = [(PUTrimToolController *)self playerWrapper];
  [(PUTrimToolController *)self playheadTime];
  [v5 stepByCount:a3 playheadTime:v10];
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PUTrimToolController_stepByCount___block_invoke;
  block[3] = &unk_1E5F2ECC8;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __36__PUTrimToolController_stepByCount___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    [*(id *)(a1 + 40) currentTime];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  return [v1 playerWrapper:v2 timeChanged:v4];
}

- (void)pause
{
  id v2 = [(PUTrimToolController *)self playerWrapper];
  [v2 pause];
}

- (void)play
{
  id v2 = [(PUTrimToolController *)self playerWrapper];
  [v2 play];
}

- (void)_handlePlayPauseButton:(id)a3
{
  id v3 = [(PUTrimToolController *)self playerWrapper];
  if ([v3 isPlaying]) {
    [v3 pause];
  }
  else {
    [v3 play];
  }
}

- (void)_updatePlayPauseButton
{
  id v7 = [(PUTrimToolController *)self _playPauseButtonIfLoaded];
  if (v7)
  {
    id v3 = [(PUTrimToolController *)self playerWrapper];
    if ([v3 isReadyToPlay])
    {
      [v7 setEnabled:1];
      if ([v3 isPlaying]) {
        id v4 = @"PUVideoEditPauseButton";
      }
      else {
        id v4 = @"PUVideoEditPlayButton";
      }
      id v5 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", v4);
      dispatch_time_t v6 = [v5 imageWithRenderingMode:2];

      [v7 setImage:v6 forState:0];
    }
    else
    {
      [v7 setEnabled:0];
    }
  }
}

- (void)_livePhotoKeyFramePickerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

  if (v5 == v4)
  {
    [(PUTrimToolController *)self setInternalState:0];
    [(PUTrimToolController *)self setLivePhotoKeyFramePicker:0];
    if ([(PXLivePhotoTrimScrubber *)self->_trimScrubber currentlyInteractingElement] != 3)
    {
      dispatch_time_t v6 = [(PUTrimToolController *)self currentEditSource];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        [(PUTrimToolController *)self _resetScrubberToStillPhotoFrame];
      }
    }
    id v8 = [(PUTrimToolController *)self snapStripController];
    [v8 updateSnapStripView];
  }
}

- (CGRect)_presentationRectFromLoupeRect
{
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber loupeRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PXLivePhotoTrimScrubber *)self->_trimScrubber superview];
  objc_msgSend(v11, "convertPoint:fromView:", self->_trimScrubber, v4, v6);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_resetScrubberToStillPhotoFrame
{
  double v3 = self->_trimScrubber;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  [(PUTrimToolController *)self currentStillFrameTime];
  double v4 = [(PUTrimToolController *)self compositionController];
  double v5 = [v4 trimAdjustmentController];

  long long v12 = 0uLL;
  uint64_t v13 = 0;
  if (v5)
  {
    [v5 startTime];
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    [v5 endTime];
    if (BYTE12(v12))
    {
      long long v8 = v12;
      uint64_t v9 = v13;
      [(PXLivePhotoTrimScrubber *)v3 setTrimStartTime:&v8];
    }
  }
  else
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
  }
  if (BYTE12(v10))
  {
    long long v6 = v10;
    uint64_t v7 = v11;
    [(PXLivePhotoTrimScrubber *)v3 setTrimEndTime:&v6];
  }
}

uint64_t __55__PUTrimToolController__resetScrubberToStillPhotoFrame__block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  return [*(id *)(a1 + 32) setKeyTime:&v2];
}

- (double)_frameRate
{
  [(PUTrimToolController *)self cachedFrameRate];
  double v4 = v3;
  if (v3 == 0.0)
  {
    double v5 = (void *)MEMORY[0x1E4F8CC38];
    uint64_t v6 = *MEMORY[0x1E4F15C18];
    uint64_t v7 = [(PUTrimToolController *)self currentVideoAsset];
    long long v8 = [v5 tracksWithMediaType:v6 forAsset:v7];
    uint64_t v9 = [v8 firstObject];
    [v9 nominalFrameRate];
    double v4 = v10;

    [(PUTrimToolController *)self setCachedFrameRate:v4];
  }
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_frameDuration
{
  long long v13 = 0uLL;
  int64_t v14 = 0;
  CGRect result = [(PUTrimToolController *)self cachedFrameDuration];
  if (BYTE12(v13))
  {
    *(_OWORD *)&retstr->var0 = v13;
    retstr->int64_t var3 = v14;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F8CC38];
    uint64_t v7 = *MEMORY[0x1E4F15C18];
    long long v8 = [(PUTrimToolController *)self currentVideoAsset];
    uint64_t v9 = [v6 tracksWithMediaType:v7 forAsset:v8];

    float v10 = [v9 firstObject];
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
    retstr->var0 = 0;
    [MEMORY[0x1E4F7A718] minimumFrameDurationForAssetTrack:v10];
    long long v11 = *(_OWORD *)&retstr->var0;
    int64_t var3 = retstr->var3;
    [(PUTrimToolController *)self setCachedFrameDuration:&v11];
  }
  return result;
}

- (void)_updateSlomoViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUTrimToolController *)self isSlomoEnabled])
  {
    if (!self->_slomoView)
    {
      double v5 = (PXSlowMotionEditor *)objc_alloc_init(MEMORY[0x1E4F90880]);
      slomoView = self->_slomoView;
      self->_slomoView = v5;

      [(PXSlowMotionEditor *)self->_slomoView setClipsToBounds:1];
      [(PXSlowMotionEditor *)self->_slomoView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PXSlowMotionEditor *)self->_slomoView setDelegate:self];
      [(PXSlowMotionEditor *)self->_slomoView setRegionEditorStyle:1];
      [(PXSlowMotionEditor *)self->_slomoView setTrimHandleWidth:0.0];
      uint64_t v7 = [(UIVisualEffectView *)self->_auxilaryContainerView contentView];
      [v7 addSubview:self->_slomoView];

      long long v8 = [(PXSlowMotionEditor *)self->_slomoView leftAnchor];
      uint64_t v9 = [(UIVisualEffectView *)self->_auxilaryContainerView leftAnchor];
      double v10 = 66.0;
      if (!self->_playButtonEnabled) {
        double v10 = 24.0;
      }
      long long v11 = [v8 constraintEqualToAnchor:v9 constant:v10];
      [v11 setActive:1];

      long long v12 = [(PXSlowMotionEditor *)self->_slomoView rightAnchor];
      long long v13 = [(UIVisualEffectView *)self->_auxilaryContainerView rightAnchor];
      int64_t v14 = [v12 constraintEqualToAnchor:v13 constant:-18.0];
      [v14 setActive:1];

      uint64_t v15 = [(PXSlowMotionEditor *)self->_slomoView centerYAnchor];
      uint64_t v16 = [(UIVisualEffectView *)self->_auxilaryContainerView centerYAnchor];
      double v17 = [v15 constraintEqualToAnchor:v16];
      [v17 setActive:1];
    }
    [(PUTrimToolController *)self _updateScrubberTimes];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUTrimToolController__updateSlomoViewAnimated___block_invoke;
  aBlock[3] = &unk_1E5F2ED10;
  aBlock[4] = self;
  double v18 = _Block_copy(aBlock);
  double v19 = v18;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v18 animations:0.2];
  }
  else {
    (*((void (**)(void *))v18 + 2))(v18);
  }
}

uint64_t __49__PUTrimToolController__updateSlomoViewAnimated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isSlomoEnabled];
  double v3 = 0.0;
  if (v2) {
    double v3 = 1.0;
  }
  double v4 = *(void **)(*(void *)(a1 + 32) + 1104);
  return [v4 setAlpha:v3];
}

- (void)_updateVideo
{
  double v3 = [(PUTrimToolController *)self playerWrapper];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PUTrimToolController__updateVideo__block_invoke;
  void v4[3] = &unk_1E5F2D648;
  v4[4] = self;
  [v3 requestAssetWithCompletion:v4];
}

void __36__PUTrimToolController__updateVideo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v7 = a3;
  id v5 = v7;
  id v6 = v4;
  px_dispatch_on_main_queue();
}

void __36__PUTrimToolController__updateVideo__block_invoke_2(id *a1)
{
  if (a1[4])
  {
    id v2 = [a1[5] currentVideoComposition];
    double v3 = v2;
    if (v2 == a1[6])
    {
      id v4 = [a1[5] currentVideoAsset];
      id v5 = a1[4];

      if (v4 == v5) {
        return;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)a1[5] + 146, a1[6]);
    objc_storeStrong((id *)a1[5] + 145, a1[4]);
    id v6 = a1[5];
    long long v7 = *MEMORY[0x1E4F1F9F8];
    uint64_t v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v6 setCachedFrameDuration:&v7];
    [a1[5] setCachedFrameRate:0.0];
    [a1[5] _updateScrubberContents];
    [a1[5] _updateDebugTimeCodeLabel];
    [a1[5] _updateDebugPlayerTimeLabel];
    *((unsigned char *)a1[5] + 993) = 1;
  }
}

- (void)_updateSnappingDots
{
  if ([(PUTrimToolController *)self _allowsKeyFrameCreation])
  {
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:2];
    [(PUTrimToolController *)self unadjustedStillImageTime];
    if ((v10[36] & 0x1D) == 1)
    {
      id v4 = (void *)MEMORY[0x1E4F29238];
      [(PUTrimToolController *)self unadjustedStillImageTime];
      id v5 = [v4 valueWithCMTime:v10];
      [v3 addObject:v5];
    }
    [(PUTrimToolController *)self adjustedStillFrameTime];
    if ((v9[36] & 0x1D) == 1)
    {
      id v6 = (void *)MEMORY[0x1E4F29238];
      [(PUTrimToolController *)self adjustedStillFrameTime];
      long long v7 = [v6 valueWithCMTime:v9];
      [v3 addObject:v7];
    }
    if ([v3 count])
    {
      uint64_t v8 = [v3 array];
      [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapKeyTimes:v8];
    }
  }
}

- (void)_updateScrubberFocusEventTimes
{
  focusEventTimes = self->_focusEventTimes;
  double v3 = [(PXLivePhotoTrimScrubber *)self->_trimScrubber focusEventTimes];
  if (focusEventTimes == v3)
  {
  }
  else
  {
    char v4 = [(NSArray *)focusEventTimes isEqual:v3];

    if ((v4 & 1) == 0)
    {
      if ([(NSArray *)self->_focusEventTimes count] && self->_isPortraitVideo && self->_portraitVideoEnabled) {
        id v5 = self->_focusEventTimes;
      }
      else {
        id v5 = 0;
      }
      [(PXLivePhotoTrimScrubber *)self->_trimScrubber setFocusEventTimes:v5];
      [(PUTrimToolController *)self _updateSnappingDots];
      [(PUTrimToolController *)self _hideScrubberTimelineOverlay];
    }
  }
}

- (void)_updateScrubberTimes
{
  v65[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(PUTrimToolController *)self compositionController];
  char v4 = [v3 trimAdjustmentController];

  long long v62 = 0uLL;
  uint64_t v63 = 0;
  if (!v4)
  {
    long long v62 = *MEMORY[0x1E4F1FA48];
    uint64_t v63 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    memset(&v61, 0, sizeof(v61));
LABEL_7:
    id v5 = [(PUTrimToolController *)self currentVideoAsset];
    id v6 = v5;
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&v60, 0, sizeof(v60));
    }
    CMTime v61 = v60;

    goto LABEL_11;
  }
  [v4 startTime];
  if ((BYTE12(v62) & 1) == 0)
  {
    long long v62 = *MEMORY[0x1E4F1FA48];
    uint64_t v63 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  }
  memset(&v61, 0, sizeof(v61));
  [v4 endTime];
  if (!((unsigned __int128)0 >> 96)) {
    goto LABEL_7;
  }
LABEL_11:
  long long v58 = v62;
  uint64_t v59 = v63;
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setTrimStartTime:&v58];
  CMTime v57 = v61;
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setTrimEndTime:&v57];
  memset(&v60, 0, sizeof(v60));
  [(PUTrimToolController *)self originalStartTime];
  CMTime v56 = v60;
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setOriginalStartTime:&v56];
  if (v60.flags)
  {
    CMTime v55 = v60;
    long long v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&v55];
    v65[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimStartTimes:v8];
  }
  else
  {
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimStartTimes:0];
  }
  memset(&v55, 0, sizeof(v55));
  [(PUTrimToolController *)self originalEndTime];
  CMTime v54 = v55;
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setOriginalEndTime:&v54];
  if (v55.flags)
  {
    CMTime v53 = v55;
    uint64_t v9 = [MEMORY[0x1E4F29238] valueWithCMTime:&v53];
    v64 = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimEndTimes:v10];
  }
  else
  {
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimEndTimes:0];
  }
  long long v11 = [(PUTrimToolController *)self compositionController];
  long long v12 = [v11 composition];
  uint64_t v13 = [v12 mediaType];

  if (v13 != 2 && ([(PUTrimToolController *)self currentStillFrameTime], (v50 & 1) != 0)) {
    [(PUTrimToolController *)self currentStillFrameTime];
  }
  else {
    [(PUTrimToolController *)self playheadTime];
  }
  trimScrubber = self->_trimScrubber;
  long long v48 = v51;
  uint64_t v49 = v52;
  [(PXLivePhotoTrimScrubber *)trimScrubber setKeyTime:&v48];
  unint64_t v15 = [(PUTrimToolController *)self playheadStyle];
  if (v15 == 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2 * (v15 == 2);
  }
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setPlayheadStyle:v16];
  double v17 = +[PUPhotoEditProtoSettings sharedInstance];
  char v18 = [v17 disableVideoFilmstrip];

  if ((v18 & 1) == 0)
  {
    double v19 = self->_trimScrubber;
    long long v20 = [(PUTrimToolController *)self playerWrapper];
    CMTimeEpoch v21 = [v20 loupePlayerView];
    [(PXLivePhotoTrimScrubber *)v19 setLoupePlayerView:v21];
  }
  [(PUTrimToolController *)self _updateSnappingDots];
  [(PUTrimToolController *)self suggestedKeyFrameTime];
  if ((v47 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v22 = +[PUPhotoEditProtoSettings sharedInstance];
  int v23 = [v22 showSuggestedKeyFrame];

  if (!v23) {
    goto LABEL_33;
  }
  CMTimeRange v24 = self->_trimScrubber;
  if (v24) {
    [(PXLivePhotoTrimScrubber *)v24 suggestedKeyTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  [(PUTrimToolController *)self suggestedKeyFrameTime];
  if (CMTimeCompare(&time1, &time2))
  {
    [(PUTrimToolController *)self suggestedKeyFrameTime];
    v25 = self->_trimScrubber;
    long long v41 = v43;
    uint64_t v42 = v44;
    [(PXLivePhotoTrimScrubber *)v25 setSuggestedKeyTime:&v41];
    int v26 = 1;
  }
  else
  {
LABEL_33:
    int v26 = 0;
  }
  if ([(PUTrimToolController *)self isSlomoEnabled])
  {
    [(PXSlowMotionEditor *)self->_slomoView setMinValue:0.0];
    [(PUTrimToolController *)self unadjustedAssetDuration];
    double Seconds = 1.0;
    if ((v40 & 0x1D) == 1)
    {
      [(PUTrimToolController *)self unadjustedAssetDuration];
      double Seconds = CMTimeGetSeconds(&time);
    }
    [(PXSlowMotionEditor *)self->_slomoView setMaxValue:Seconds];
    v28 = [(PUTrimToolController *)self compositionController];
    v29 = [v28 slomoAdjustmentController];

    memset(&v53, 0, sizeof(v53));
    if (v29)
    {
      [v29 startTime];
      if ((v53.flags & 0x1D) == 1)
      {
        CMTime v38 = v53;
        [(PXSlowMotionEditor *)self->_slomoView setStartValue:CMTimeGetSeconds(&v38)];
      }
      memset(&v38, 0, sizeof(v38));
      [v29 endTime];
      if ((v38.flags & 0x1D) == 1)
      {
        CMTime v37 = v38;
        [(PXSlowMotionEditor *)self->_slomoView setEndValue:CMTimeGetSeconds(&v37)];
      }
    }
    else
    {
      memset(&v38, 0, sizeof(v38));
    }
    v30 = [(PUTrimToolController *)self slomoTimeForPlayheadUpdate];

    if (v30)
    {
      v31 = [(PUTrimToolController *)self slomoTimeForPlayheadUpdate];
      [v31 floatValue];
      float v33 = v32;

      CMTimeMakeWithSeconds(&v36, v33, 600);
      CMTime v35 = v36;
      [(PUTrimToolController *)self setPlayheadTime:&v35];
    }
    [(PUTrimToolController *)self setSlomoTimeForPlayheadUpdate:0];
  }
  if (v26)
  {
    v34 = [(PUTrimToolController *)self snapStripController];
    [v34 updateSnapStripView];
  }
}

- (void)_updateScrubberContents
{
  trimScrubber = self->_trimScrubber;
  char v4 = [(PUTrimToolController *)self currentVideoAsset];
  id v5 = [(PUTrimToolController *)self currentVideoComposition];
  [(PXLivePhotoTrimScrubber *)trimScrubber setAsset:v4 videoComposition:v5];

  [(PUTrimToolController *)self _updateScrubberTimes];
  [(PUTrimToolController *)self _updateSnapStripController];
}

- (void)_updatePlayerWrapperTrim
{
  double v3 = [(PUTrimToolController *)self compositionController];
  char v4 = [v3 trimAdjustmentController];

  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v13 = *MEMORY[0x1E4F1FA20];
  long long v14 = v5;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  if ([v4 enabled])
  {
    long long v7 = 0uLL;
    *(void *)&long long v8 = 0;
    if (v4)
    {
      [v4 startTime];
      memset(&v12, 0, sizeof(v12));
      [v4 endTime];
    }
    else
    {
      memset(&v12, 0, sizeof(v12));
    }
    long long v13 = v7;
    *(void *)&long long v14 = v8;
    CMTime lhs = v12;
    *(_OWORD *)&rhs.value = v7;
    rhs.epoch = v8;
    CMTimeSubtract((CMTime *)((char *)&v14 + 8), &lhs, &rhs);
  }
  id v6 = [(PUTrimToolController *)self playerWrapper];
  long long v7 = v13;
  long long v8 = v14;
  long long v9 = v15;
  [v6 applyTrimTimeRange:&v7];
}

- (void)_updateCompositionController
{
  double v3 = [(PUTrimToolController *)self delegate];
  [v3 willModifyAdjustment];

  char v4 = self->_trimScrubber;
  long long v5 = v4;
  long long v44 = 0uLL;
  CMTimeEpoch v45 = 0;
  if (v4)
  {
    [(PXLivePhotoTrimScrubber *)v4 trimStartTime];
    memset(&v43, 0, sizeof(v43));
    [(PXLivePhotoTrimScrubber *)v5 trimEndTime];
  }
  else
  {
    memset(&v43, 0, sizeof(v43));
  }
  memset(&v42, 0, sizeof(v42));
  *(_OWORD *)&start.start.value = v44;
  start.start.epoch = v45;
  CMTime end = v43;
  CMTimeRangeFromTimeToTime(&v42, &start.start, &end);
  memset(&end, 0, sizeof(end));
  if (v5) {
    [(PXLivePhotoTrimScrubber *)v5 keyTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CMTimeRange start = v42;
  CMTimeClampToRange(&end, &time, &start);
  CMTime v38 = end;
  [(PXLivePhotoTrimScrubber *)v5 setKeyTime:&v38];
  if (v5) {
    [(PXLivePhotoTrimScrubber *)v5 keyTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  start.CMTimeRange start = v43;
  if (!CMTimeCompare(&time1, &start.start))
  {
    memset(&start, 0, 24);
    [(PUTrimToolController *)self _frameDuration];
    if (v5) {
      [(PXLivePhotoTrimScrubber *)v5 keyTime];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTime rhs = start.start;
    CMTimeSubtract(&v36, &lhs, &rhs);
    CMTime v33 = v36;
    [(PXLivePhotoTrimScrubber *)v5 setKeyTime:&v33];
    if (v5)
    {
      [(PXLivePhotoTrimScrubber *)v5 keyTime];
    }
    else
    {
      long long v31 = 0uLL;
      uint64_t v32 = 0;
    }
    long long v29 = v31;
    uint64_t v30 = v32;
    [(PXLivePhotoTrimScrubber *)v5 setKeyTime:&v29];
  }
  [(PUTrimToolController *)self currentStillFrameTime];
  CMTimeRange start = v42;
  int v6 = CMTimeRangeContainsTime(&start, &v28);
  CMTime rhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (!v6)
  {
    memset(&v27, 0, sizeof(v27));
    [(PUTrimToolController *)self currentStillFrameTime];
    CMTimeRange start = v42;
    CMTimeClampToRange(&v27, &v26, &start);
    CMTime rhs = v27;
    start.CMTimeRange start = v27;
    CMTime time2 = v43;
    if (!CMTimeCompare(&start.start, &time2))
    {
      memset(&start, 0, 24);
      [(PUTrimToolController *)self _frameDuration];
      CMTime time2 = rhs;
      CMTime v24 = start.start;
      CMTimeSubtract(&rhs, &time2, &v24);
    }
  }
  BOOL v7 = v6 == 0;
  uint64_t v8 = [(PXLivePhotoTrimScrubber *)v5 trimStatus];
  [(PUTrimToolController *)self _createRendererIfNeeded];
  long long v9 = [(PUTrimToolController *)self renderer];
  double v10 = [(PUTrimToolController *)self currentEditSource];
  long long v11 = [(PUTrimToolController *)self compositionController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__PUTrimToolController__updateCompositionController__block_invoke;
  v15[3] = &unk_1E5F2D620;
  BOOL v23 = v7;
  CMTime v19 = rhs;
  id v16 = v10;
  double v17 = self;
  uint64_t v18 = v8;
  long long v20 = v44;
  CMTimeEpoch v21 = v45;
  CMTime v22 = v43;
  id v12 = v10;
  [v9 applySourceChangesToCompositionAsynchronously:v11 source:v12 withBlock:v15 completionBlock:0];

  [(PUTrimToolController *)self _updatePlayerWrapperTrim];
  [(PUTrimToolController *)self _updateSnappingDots];
  long long v13 = [(PUTrimToolController *)self delegate];
  long long v14 = PULocalizedString(@"PHOTOEDIT_TRIM_ACTION_TITLE");
  [v13 didModifyAdjustmentWithLocalizedName:v14];
}

void __52__PUTrimToolController__updateCompositionController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [MEMORY[0x1E4F8A358] adjustmentConstants];
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v26 = 0;
    CMTime v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*(unsigned char *)(a1 + 68))
      {
        uint64_t v9 = *MEMORY[0x1E4F8A480];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __52__PUTrimToolController__updateCompositionController__block_invoke_2;
        v23[3] = &unk_1E5F2D5B8;
        long long v24 = *(_OWORD *)(a1 + 56);
        uint64_t v25 = *(void *)(a1 + 72);
        v23[4] = &v26;
        [v3 modifyAdjustmentWithKey:v9 modificationBlock:v23];
      }
      else
      {
        long long v5 = [v3 livePhotoKeyFrameAdjustmentController];

        if (v5) {
          *((unsigned char *)v27 + 24) = 1;
        }
        [v3 removeAdjustmentWithKey:*MEMORY[0x1E4F8A480]];
      }
    }
    else
    {
      int v6 = +[PUPhotoEditProtoSettings sharedInstance];
      int v7 = [v6 allowMakePosterFrameForVideo];

      if (v7)
      {
        uint64_t v8 = *(void **)(a1 + 40);
        long long v21 = *(_OWORD *)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 72);
        [v8 _setPosterFrameTime:&v21 onCompositionController:v3];
      }
    }
    if (*((unsigned char *)v27 + 24)) {
      [*(id *)(a1 + 40) updateLivePortraitForKeyFrameChange:v3];
    }
    _Block_object_dispose(&v26, 8);
  }
  if (*(void *)(a1 + 48) == 2)
  {
    if (*(unsigned char *)(a1 + 92) & 1) != 0 && (*(unsigned char *)(a1 + 116))
    {
      uint64_t v14 = *MEMORY[0x1E4F8A5A0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__PUTrimToolController__updateCompositionController__block_invoke_3;
      void v16[3] = &__block_descriptor_80_e36_v16__0__PITrimAdjustmentController_8l;
      long long v17 = *(_OWORD *)(a1 + 80);
      uint64_t v18 = *(void *)(a1 + 96);
      long long v19 = *(_OWORD *)(a1 + 104);
      uint64_t v20 = *(void *)(a1 + 120);
      [v3 modifyAdjustmentWithKey:v14 modificationBlock:v16];
    }
    else
    {
      [v3 removeAdjustmentWithKey:*MEMORY[0x1E4F8A5A0]];
    }
  }
  else
  {
    double v10 = [v4 PITrimAdjustmentKey];
    [v3 removeAdjustmentWithKey:v10];
  }
  long long v11 = [v4 PITrimAdjustmentKey];
  id v12 = [v3 adjustmentControllerForKey:v11];

  if (v12)
  {
    long long v13 = [v4 PITrimAdjustmentKey];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__PUTrimToolController__updateCompositionController__block_invoke_4;
    v15[3] = &__block_descriptor_40_e32_v16__0__PIAdjustmentController_8l;
    void v15[4] = *(void *)(a1 + 48);
    [v3 modifyAdjustmentWithKey:v13 modificationBlock:v15];
  }
}

void __52__PUTrimToolController__updateCompositionController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (v3) {
    [v3 keyFrameTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime time2 = *(CMTime *)(a1 + 40);
  if (CMTimeCompare(&time1, &time2)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  [v4 setKeyFrameTime:&v5];
}

void __52__PUTrimToolController__updateCompositionController__block_invoke_3(uint64_t a1, void *a2)
{
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v3 = a2;
  [v3 setStartTime:&v6];
  long long v4 = *(_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  [v3 setEndTime:&v4];
}

uint64_t __52__PUTrimToolController__updateCompositionController__block_invoke_4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [a2 setEnabled:v2 == 2];
  }
  return result;
}

- (void)_updateTimeCodeOverlay
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUTrimToolController *)self internalState] == 2
    || [(PUTrimToolController *)self internalState] == 3
    || [(PUTrimToolController *)self internalState] == 4
    || [(PUTrimToolController *)self internalState] == 5;
  long long v4 = [(PUTrimToolController *)self editSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  timeCodeOverlayView = self->_timeCodeOverlayView;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    if (!timeCodeOverlayView)
    {
      uint64_t v7 = objc_alloc_init(PUTimeCodeOverlayView);
      uint64_t v8 = self->_timeCodeOverlayView;
      self->_timeCodeOverlayView = v7;

      uint64_t v9 = [(PUTrimToolController *)self view];
      [v9 addSubview:self->_timeCodeOverlayView];

      double v10 = [(PXLivePhotoTrimScrubber *)self->_trimScrubber topAnchor];
      long long v11 = [(PUTimeCodeOverlayView *)self->_timeCodeOverlayView bottomAnchor];
      id v12 = [v10 constraintEqualToAnchor:v11 constant:4.0];
      [v12 setActive:1];

      long long v13 = [(PUTimeCodeOverlayView *)self->_timeCodeOverlayView centerXAnchor];
      uint64_t v14 = [(PXLivePhotoTrimScrubber *)self->_trimScrubber leftAnchor];
      long long v15 = [v13 constraintEqualToAnchor:v14];
      timeCodeHorizontalConstraint = self->_timeCodeHorizontalConstraint;
      self->_timeCodeHorizontalConstraint = v15;

      [(NSLayoutConstraint *)self->_timeCodeHorizontalConstraint setActive:1];
    }
    if ([(PUTrimToolController *)self internalState] == 3)
    {
      if ([(PUTrimToolController *)self slomoDraggingStartHandle])
      {
        [(PXSlowMotionEditor *)self->_slomoView startValue];
        CMTimeMakeWithSeconds(&v32, v17, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
        CMTimeValue value = v32.value;
        CMTimeFlags flags = v32.flags;
        CMTimeScale timescale = v32.timescale;
        CMTimeEpoch epoch = v32.epoch;
        [(PXSlowMotionEditor *)self->_slomoView startHandleFrame];
        double MinX = CGRectGetMinX(v37);
        [(PXLivePhotoTrimScrubberSpec *)self->_spec handleWidth];
        double v22 = -5.0;
      }
      else
      {
        [(PXSlowMotionEditor *)self->_slomoView endValue];
        CMTimeMakeWithSeconds(&v32, v27, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
        CMTimeValue value = v32.value;
        CMTimeFlags flags = v32.flags;
        CMTimeScale timescale = v32.timescale;
        CMTimeEpoch epoch = v32.epoch;
        [(PXSlowMotionEditor *)self->_slomoView endHandleFrame];
        double MinX = CGRectGetMinX(v38);
        [(PXLivePhotoTrimScrubberSpec *)self->_spec handleWidth];
        double v22 = -6.0;
      }
      double v28 = MinX + v21 + v22;
    }
    else
    {
      uint64_t v25 = [(PXLivePhotoTrimScrubber *)self->_trimScrubber currentlyInteractingElement];
      trimScrubber = self->_trimScrubber;
      if (trimScrubber)
      {
        [(PXLivePhotoTrimScrubber *)trimScrubber timeForElement:v25];
        CMTimeFlags flags = v32.flags;
        CMTimeEpoch epoch = v32.epoch;
        trimScrubber = self->_trimScrubber;
      }
      else
      {
        CMTimeEpoch epoch = 0;
        CMTimeFlags flags = 0;
        memset(&v32, 0, sizeof(v32));
      }
      v32.CMTimeEpoch epoch = epoch;
      CMTimeValue value = v32.value;
      CMTimeScale timescale = v32.timescale;
      v32.CMTimeFlags flags = flags;
      [(PXLivePhotoTrimScrubber *)trimScrubber horizontalOffsetForTime:&v32];
      double v28 = v29;
    }
    if ((flags & 0x1D) != 1)
    {
      CMTimeValue value = *MEMORY[0x1E4F1FA48];
      CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
      CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
      CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      double v28 = 0.0;
    }
    v32.CMTimeValue value = value;
    v32.CMTimeScale timescale = timescale;
    v32.CMTimeFlags flags = flags;
    v32.CMTimeEpoch epoch = epoch;
    [(PUTimeCodeOverlayView *)self->_timeCodeOverlayView setDisplayedTimeInterval:CMTimeGetSeconds(&v32)];
    uint64_t v30 = +[PUPhotoEditProtoSettings sharedInstance];
    int v31 = [v30 showFrameNumberOnVideoScrubber];

    if (v31)
    {
      [(PUTrimToolController *)self _frameRate];
      -[PUTimeCodeOverlayView setFrameRate:](self->_timeCodeOverlayView, "setFrameRate:");
    }
    [(NSLayoutConstraint *)self->_timeCodeHorizontalConstraint setConstant:v28];
  }
  else if (timeCodeOverlayView)
  {
    [(PUTimeCodeOverlayView *)timeCodeOverlayView removeFromSuperview];
    BOOL v23 = self->_timeCodeOverlayView;
    self->_timeCodeOverlayView = 0;

    long long v24 = self->_timeCodeHorizontalConstraint;
    self->_timeCodeHorizontalConstraint = 0;
  }
}

- (void)_updateScrubberPresentedPlayhead
{
  unint64_t v3 = [(PUTrimToolController *)self playheadStyle];
  if (v3 <= 2)
  {
    unint64_t v4 = v3;
    trimScrubber = self->_trimScrubber;
    [(PXLivePhotoTrimScrubber *)trimScrubber setPlayheadStyle:v4];
  }
}

- (void)_updatePlayerWrapperTimeObserver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUTrimToolController__updatePlayerWrapperTimeObserver__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__PUTrimToolController__updatePlayerWrapperTimeObserver__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playheadStyle];
  unint64_t v3 = [*(id *)(a1 + 32) playerWrapper];
  id v4 = v3;
  if (v2 == 1) {
    [v3 startPeriodicTimeObserver];
  }
  else {
    [v3 stopPeriodicTimeObserver];
  }
}

- (void)_updateSnapStripController
{
  unint64_t v3 = [(PUTrimToolController *)self delegate];
  id v6 = [v3 livePortraitBehaviorController];

  uint64_t v4 = [v6 hasLivePortrait];
  uint64_t v5 = [(PUTrimToolController *)self snapStripSpec];
  [v5 setLivePortraitStyle:v4];
}

- (void)_updatePlayheadStyle
{
  unint64_t v3 = [(PUTrimToolController *)self currentEditSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if ([(PUTrimToolController *)self internalState] == 2)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = [(PUTrimToolController *)self compositionController];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 autoLoopAdjustmentController];
        double v10 = [v9 flavor];
        BOOL v11 = PIAutoLoopFlavorFromString() == 0;

        uint64_t v6 = 2 * v11;
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    goto LABEL_15;
  }
  unint64_t v5 = [(PUTrimToolController *)self state];
  if (v5 >= 2)
  {
    if (v5 == 3)
    {
      uint64_t v6 = 2;
      goto LABEL_15;
    }
    if (v5 != 2) {
      return;
    }
    if ([(PUTrimToolController *)self internalState] != 4)
    {
      uint64_t v6 = [(PUTrimToolController *)self internalState] == 5;
      goto LABEL_15;
    }
  }
  uint64_t v6 = 1;
LABEL_15:
  [(PUTrimToolController *)self setPlayheadStyle:v6];
}

- (void)_updatePublicState
{
  unint64_t v3 = [(PUTrimToolController *)self internalState];
  if (v3 > 6) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = qword_1AEFF85A0[v3];
  }
  [(PUTrimToolController *)self _setState:v4];
}

- (void)_updateDebugPlayheadStyleLabel
{
  unint64_t v3 = [(PUTrimToolController *)self debugTrimToolPlayheadStyleLabel];

  if (v3)
  {
    unint64_t v4 = [(PUTrimToolController *)self playheadStyle];
    if (v4 == 2)
    {
      unint64_t v5 = [(PUTrimToolController *)self debugTrimToolPlayheadStyleLabel];
      id v7 = v5;
      uint64_t v6 = @"Loupe";
    }
    else if (v4 == 1)
    {
      unint64_t v5 = [(PUTrimToolController *)self debugTrimToolPlayheadStyleLabel];
      id v7 = v5;
      uint64_t v6 = @"Bar";
    }
    else
    {
      if (v4) {
        return;
      }
      unint64_t v5 = [(PUTrimToolController *)self debugTrimToolPlayheadStyleLabel];
      id v7 = v5;
      uint64_t v6 = @"None";
    }
    [v5 setText:v6];
  }
}

- (void)_updateDebugTrimToolStateLabel
{
  unint64_t v3 = [(PUTrimToolController *)self debugTrimToolStateLabel];

  if (v3)
  {
    switch([(PUTrimToolController *)self state])
    {
      case 0uLL:
        unint64_t v4 = [(PUTrimToolController *)self debugTrimToolStateLabel];
        [v4 setText:@"Paused"];

        uint64_t v5 = [MEMORY[0x1E4FB1618] redColor];
        goto LABEL_11;
      case 1uLL:
        uint64_t v8 = [(PUTrimToolController *)self debugTrimToolStateLabel];
        [v8 setText:@"Playing"];

        uint64_t v5 = [MEMORY[0x1E4FB1618] greenColor];
        goto LABEL_11;
      case 2uLL:
        unint64_t v6 = [(PUTrimToolController *)self internalState];
        if (v6 - 2 > 3) {
          id v7 = @"Unknown";
        }
        else {
          id v7 = off_1E5F2D6B8[v6 - 2];
        }
        double v10 = [NSString stringWithFormat:@"Interacting(%@)", v7];
        BOOL v11 = [(PUTrimToolController *)self debugTrimToolStateLabel];
        [v11 setText:v10];

        uint64_t v5 = [MEMORY[0x1E4FB1618] yellowColor];
        goto LABEL_11;
      case 3uLL:
        uint64_t v9 = [(PUTrimToolController *)self debugTrimToolStateLabel];
        [v9 setText:@"Picking"];

        uint64_t v5 = [MEMORY[0x1E4FB1618] magentaColor];
LABEL_11:
        id v13 = (id)v5;
        id v12 = [(PUTrimToolController *)self debugTrimToolStateLabel];
        [v12 setTextColor:v13];

        break;
      default:
        return;
    }
  }
}

- (void)_updateDebugPlayerTimeLabel
{
  unint64_t v3 = [(PUTrimToolController *)self debugPlayerTimeLabel];

  if (v3)
  {
    memset(&v33, 0, sizeof(v33));
    unint64_t v4 = [(PUTrimToolController *)self currentVideoAsset];
    uint64_t v5 = v4;
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&v33, 0, sizeof(v33));
    }

    [(PUTrimToolController *)self debugPlayerTime];
    if ((v32 & 0x1D) == 1 && (v33.flags & 0x1D) == 1)
    {
      unint64_t v6 = NSString;
      [(PUTrimToolController *)self debugPlayerTime];
      CMTimeGetSeconds(&time);
      id v7 = PXTrimTimeCodeStringFromSecondsAndRound();
      CMTime v30 = v33;
      CMTimeGetSeconds(&v30);
      uint64_t v8 = PXTrimTimeCodeStringFromSecondsAndRound();
      uint64_t v9 = [v6 stringWithFormat:@"P:%@/%@", v7, v8];
      double v10 = [(PUTrimToolController *)self debugPlayerTimeLabel];
      [v10 setText:v9];

      memset(&v30, 0, sizeof(v30));
      [(PUTrimToolController *)self debugPlayerTime];
      [(PUTrimToolController *)self _originalTimeFromCurrentPlayerScaledTime:v29];
      memset(&v28, 0, sizeof(v28));
      CMTime v27 = v33;
      [(PUTrimToolController *)self _originalTimeFromCurrentPlayerScaledTime:&v27];
      BOOL v11 = NSString;
      CMTime v27 = v30;
      CMTimeGetSeconds(&v27);
      id v12 = PXTrimTimeCodeStringFromSecondsAndRound();
      CMTime v27 = v28;
      CMTimeGetSeconds(&v27);
      id v13 = PXTrimTimeCodeStringFromSecondsAndRound();
      uint64_t v14 = [v11 stringWithFormat:@"O:%@/%@", v12, v13];
      long long v15 = [(PUTrimToolController *)self debugOriginalTimeLabel];
      [v15 setText:v14];
    }
    else
    {
      id v16 = NSString;
      Float64 v17 = PXTrimTimeCodeStringFromSecondsAndRound();
      uint64_t v18 = [v16 stringWithFormat:@"P:%@", v17];
      long long v19 = [(PUTrimToolController *)self debugPlayerTimeLabel];
      [v19 setText:v18];

      uint64_t v20 = NSString;
      id v12 = PXTrimTimeCodeStringFromSecondsAndRound();
      double v21 = [v20 stringWithFormat:@"O:%@", v12];
      double v22 = [(PUTrimToolController *)self debugOriginalTimeLabel];
      [v22 setText:v21];
    }
    BOOL v23 = [MEMORY[0x1E4FB1618] greenColor];
    long long v24 = [(PUTrimToolController *)self debugPlayerTimeLabel];
    [v24 setTextColor:v23];

    uint64_t v25 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v26 = [(PUTrimToolController *)self debugOriginalTimeLabel];
    [v26 setTextColor:v25];
  }
}

- (void)_updateDebugTimeCodeLabel
{
  unint64_t v3 = [(PUTrimToolController *)self debugTimeCodeLabel];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v5 = [(PUTrimToolController *)self compositionController];
    unint64_t v6 = [v5 trimAdjustmentController];

    if (v6)
    {
      [v6 startTime];
      double Seconds = CMTimeGetSeconds(&time);
      [v6 endTime];
      double v21 = CMTimeGetSeconds(&v27);
      objc_msgSend(v4, "appendFormat:", @"Trim(s:%.1f,e:%.1f,d:%.1f)", *(void *)&Seconds, *(void *)&v21, v21 - Seconds);
    }
    else
    {
      uint64_t v8 = [(PUTrimToolController *)self currentVideoAsset];
      uint64_t v9 = v8;
      if (v8) {
        [v8 duration];
      }
      else {
        memset(&v26, 0, sizeof(v26));
      }
      Float64 v10 = CMTimeGetSeconds(&v26);

      objc_msgSend(v4, "appendFormat:", @"Trim(s:%.1f,e:%.1f,d:%.1f)", 0, *(void *)&v10, *(void *)&v10);
    }
    BOOL v11 = [(PUTrimToolController *)self compositionController];
    id v12 = [v11 slomoAdjustmentController];

    if (v12)
    {
      [v12 startTime];
      double v13 = CMTimeGetSeconds(&v25);
      [v12 endTime];
      Float64 v14 = CMTimeGetSeconds(&v24);
      objc_msgSend(v4, "appendFormat:", @" Slo(s:%.1f,e:%.1f,d:%.1f)", *(void *)&v13, *(void *)&v14, v14 - v13);
    }
    trimScrubber = self->_trimScrubber;
    if (trimScrubber) {
      [(PXLivePhotoTrimScrubber *)trimScrubber viewportMinTime];
    }
    else {
      memset(&v23, 0, sizeof(v23));
    }
    Float64 v16 = CMTimeGetSeconds(&v23);
    Float64 v17 = self->_trimScrubber;
    if (v17) {
      [(PXLivePhotoTrimScrubber *)v17 viewportMaxTime];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    [v4 appendFormat:@"VP(%.1f, %.1f)", *(void *)&v16, CMTimeGetSeconds(&v22)];
    uint64_t v18 = [(PUTrimToolController *)self debugTimeCodeLabel];
    [v18 setText:v4];

    long long v19 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v20 = [(PUTrimToolController *)self debugTimeCodeLabel];
    [v20 setTextColor:v19];
  }
}

- (void)setDebugPlayerTime:(id *)a3
{
  p_debugPlayerTime = &self->_debugPlayerTime;
  CMTime time1 = (CMTime)self->_debugPlayerTime;
  CMTime v7 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &v7))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_debugPlayerTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_debugPlayerTime->CMTimeValue value = v6;
    [(PUTrimToolController *)self _updateDebugPlayerTimeLabel];
  }
}

- (void)_setPosterFrameTime:(id *)a3 onCompositionController:(id)a4
{
  id v5 = a4;
  if ((a3->var2 & 1) != 0
    && (time1 = (CMTime)*a3, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2)))
  {
    uint64_t v6 = *MEMORY[0x1E4F8A5A8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PUTrimToolController__setPosterFrameTime_onCompositionController___block_invoke;
    v7[3] = &__block_descriptor_56_e48_v16__0__PIVideoPosterFrameAdjustmentController_8l;
    long long v8 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [v5 modifyAdjustmentWithKey:v6 modificationBlock:v7];
  }
  else
  {
    [v5 removeAdjustmentWithKey:*MEMORY[0x1E4F8A5A8]];
  }
}

uint64_t __68__PUTrimToolController__setPosterFrameTime_onCompositionController___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 setPosterFrameTime:&v3];
}

- (BOOL)_showKeyFrameSelection
{
  BOOL v3 = [(PUTrimToolController *)self _allowsKeyFrameCreation];
  if (v3)
  {
    uint64_t v4 = [(PUTrimToolController *)self livePhotoKeyFramePickerAppearanceTimer];

    if (v4)
    {
      id v5 = [(PUTrimToolController *)self livePhotoKeyFramePickerAppearanceTimer];
      [v5 invalidate];

      [(PUTrimToolController *)self setLivePhotoKeyFramePickerAppearanceTimer:0];
    }
    uint64_t v6 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

    if (v6)
    {
      CMTime v7 = [(PUTrimToolController *)self livePhotoKeyFramePicker];
      [v7 dismissViewControllerAnimated:0 completion:0];

      [(PUTrimToolController *)self setLivePhotoKeyFramePicker:0];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PUTrimToolController__showKeyFrameSelection__block_invoke;
    v10[3] = &unk_1E5F2D570;
    v10[4] = self;
    long long v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v10 block:1.0];
    [(PUTrimToolController *)self setLivePhotoKeyFramePickerAppearanceTimer:v8];
  }
  return v3;
}

void __46__PUTrimToolController__showKeyFrameSelection__block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1040))
  {
    uint64_t v2 = objc_alloc_init(PULivePhotoKeyFrameSelectionViewController);
    BOOL v3 = [*(id *)(a1 + 32) currentEditSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = @"PHOTOEDIT_MAKE_POSTER_FRAME";
    }
    else {
      uint64_t v4 = @"PHOTOEDIT_MAKE_KEY_FRAME";
    }
    id v5 = PULocalizedString(v4);
    [(PULivePhotoKeyFrameSelectionViewController *)v2 setSelectionTitle:v5];

    [(PULivePhotoKeyFrameSelectionViewController *)v2 setModalPresentationStyle:7];
    [(PULivePhotoKeyFrameSelectionViewController *)v2 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) _presentationRectFromLoupeRect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    Float64 v14 = [(PULivePhotoKeyFrameSelectionViewController *)v2 popoverPresentationController];
    [v14 setPermittedArrowDirections:2];
    [v14 setSourceView:*(void *)(*(void *)(a1 + 32) + 976)];
    objc_msgSend(v14, "setSourceRect:", v7, v9, v11, v13);
    [v14 setDelegate:*(void *)(a1 + 32)];
    long long v15 = [(PULivePhotoKeyFrameSelectionViewController *)v2 view];
    Float64 v16 = [v15 backgroundColor];
    [v14 setBackgroundColor:v16];

    Float64 v17 = [*(id *)(a1 + 32) view];
    v19[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v14 setPassthroughViews:v18];

    [*(id *)(a1 + 32) setLivePhotoKeyFramePicker:v2];
    [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
    [*(id *)(a1 + 32) setLivePhotoKeyFramePickerAppearanceTimer:0];
  }
}

- (BOOL)_allowsKeyFrameCreation
{
  uint64_t v2 = [(PUTrimToolController *)self currentEditSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = +[PUPhotoEditProtoSettings sharedInstance];
    char v4 = [v3 allowMakePosterFrameForVideo];
  }
  else
  {
    char v4 = 0;
  }
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass() | v4;

  return v5 & 1;
}

- (void)setInternalState:(unint64_t)a3
{
  if (self->_internalState != a3)
  {
    self->_internalState = a3;
    [(PUTrimToolController *)self _updatePublicState];
    [(PUTrimToolController *)self _updatePlayheadStyle];
    [(PUTrimToolController *)self _updateDebugTrimToolStateLabel];
    [(PUTrimToolController *)self _updateTimeCodeOverlay];
  }
}

- (void)setPlayheadStyle:(unint64_t)a3
{
  if (self->_playheadStyle != a3)
  {
    self->_playheadStyle = a3;
    [(PUTrimToolController *)self _updateScrubberPresentedPlayhead];
    [(PUTrimToolController *)self _updatePlayerWrapperTimeObserver];
    [(PUTrimToolController *)self _updateDebugPlayheadStyleLabel];
  }
}

- (void)_setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v5 = [(PUTrimToolController *)self delegate];
    [v5 trimToolControllerDidChange:self state:a3];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedStillFrameTime
{
  id v5 = [(PUTrimToolController *)self currentEditSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v7 = [(PUTrimToolController *)self compositionController];
  double v8 = v7;
  if (isKindOfClass)
  {
    id v12 = [v7 livePhotoKeyFrameAdjustmentController];

    double v9 = v12;
    if (v12)
    {
      [v12 keyFrameTime];
LABEL_6:
      double v9 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = [v7 videoPosterFrameAdjustmentController];

    double v9 = v12;
    if (v12)
    {
      [v12 posterFrameTime];
      goto LABEL_6;
    }
  }
  uint64_t v10 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
  retstr->int64_t var3 = *(void *)(v10 + 16);
LABEL_8:

  return result;
}

- (void)setAdjustedStillFrameTime:(id *)a3
{
  id v5 = [(PUTrimToolController *)self currentEditSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PUTrimToolController *)self unadjustedStillImageTime];
    CMTime time1 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2))
    {
      unsigned int var2 = a3->var2;
      double v7 = [(PUTrimToolController *)self compositionController];
      double v8 = v7;
      uint64_t v9 = *MEMORY[0x1E4F8A480];
      if (var2)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __50__PUTrimToolController_setAdjustedStillFrameTime___block_invoke;
        v13[3] = &__block_descriptor_56_e49_v16__0__PILivePhotoKeyFrameAdjustmentController_8l;
        long long v14 = *(_OWORD *)&a3->var0;
        int64_t var3 = a3->var3;
        [v7 modifyAdjustmentWithKey:v9 modificationBlock:v13];
      }
      else
      {
        [v7 removeAdjustmentWithKey:v9];
      }
    }
    else
    {
      double v8 = [(PUTrimToolController *)self compositionController];
      uint64_t v10 = [(PUTrimToolController *)self compositionController];
      double v11 = [v10 adjustmentConstants];
      id v12 = [v11 PILivePhotoKeyFrameAdjustmentKey];
      [v8 removeAdjustmentWithKey:v12];
    }
  }
  else
  {
    double v8 = [(PUTrimToolController *)self compositionController];
    CMTime time1 = (CMTime)*a3;
    [(PUTrimToolController *)self _setPosterFrameTime:&time1 onCompositionController:v8];
  }
}

uint64_t __50__PUTrimToolController_setAdjustedStillFrameTime___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 setKeyFrameTime:&v3];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentStillFrameTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  CGRect result = [(PUTrimToolController *)self adjustedStillFrameTime];
  if ((retstr->var2 & 1) == 0)
  {
    CGRect result = [(PUTrimToolController *)self unadjustedStillImageTime];
    *(_OWORD *)&retstr->var0 = v6;
    retstr->int64_t var3 = v7;
  }
  return result;
}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
}

- (void)updateObjectTrackingProgressAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  focusTimelineView = self->_focusTimelineView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(PXFocusTimelineView *)focusTimelineView updateObjectTrackingProgressAtTime:&v5 shouldStop:a4];
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  focusTimelineView = self->_focusTimelineView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PXFocusTimelineView *)focusTimelineView objectTrackingStartedAtTime:&v4];
}

- (void)didUpdateFocusEventsWithTimes:(id)a3
{
  objc_storeStrong((id *)&self->_focusEventTimes, a3);
  [(PUTrimToolController *)self _updateScrubberFocusEventTimes];
}

- (void)updateFocusTimelineWithEvent:(id *)a3 userInitiated:(BOOL)a4 shouldAnimate:(BOOL)a5
{
  focusTimelineView = self->_focusTimelineView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(PXFocusTimelineView *)focusTimelineView addFocusEvent:&v6 userInitiated:a4 shouldAnimate:a5];
}

- (void)updateFocusTimelineWithTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v4[0] = *(_OWORD *)&a3->var0.var0;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->var1.var1;
  [(PXFocusTimelineView *)self->_focusTimelineView setTimeRange:v4];
}

- (void)resetTimeline
{
}

- (void)updateFocusTimeline
{
}

- (void)showFocusTimeline:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 1.0;
  }
  [(UIVisualEffectView *)self->_auxilaryContainerView setAlpha:v3];
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
}

- (void)enableFocusTimeline:(BOOL)a3
{
  self->_portraitVideoEnabled = a3;
  BOOL v4 = !a3;
  [(PXFocusTimelineView *)self->_focusTimelineView setDimmed:!a3];
  if (v4)
  {
    [(PUTrimToolController *)self _hideScrubberTimelineOverlay];
  }
  else
  {
    [(PUTrimToolController *)self _updateScrubberFocusEventTimes];
  }
}

- (int64_t)currentlyInteractingElement
{
  return self->_currentlyInteractingElement;
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    BOOL v3 = a3;
    self->_disabled = a3;
    BOOL v5 = !a3;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(PUTrimToolController *)self view];
    [v6 setUserInteractionEnabled:v5];

    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setDisabled:v3];
    id v7 = [(PUTrimToolController *)self snapStripController];
    [v7 updateSnapStripView];
  }
}

- (void)setEditSource:(id)a3
{
  BOOL v5 = (PLEditSource *)a3;
  if (self->_editSource != v5)
  {
    objc_storeStrong((id *)&self->_editSource, a3);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(PUTrimToolController *)self currentEditSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CMTimeMake(&v21, 1, 2);
      trimScrubber = self->_trimScrubber;
      CMTime v20 = v21;
      double v8 = &v20;
    }
    else
    {
      CMTimeMake(&v19, 1, 1);
      trimScrubber = self->_trimScrubber;
      CMTime v18 = v19;
      double v8 = &v18;
    }
    [(PXLivePhotoTrimScrubber *)trimScrubber setMinimumTrimLength:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_14:
        [(PUTrimToolController *)self _updatePlayheadStyle];

        goto LABEL_15;
      }
      id v9 = [v6 videoEditSource];
    }
    uint64_t v10 = v9;
    if (v9)
    {
      double v11 = (void *)MEMORY[0x1E4F16330];
      id v12 = [v9 videoURL];
      double v13 = [v11 assetWithURL:v12];

      if (v13)
      {
        [v13 duration];
      }
      else
      {
        long long v16 = 0uLL;
        uint64_t v17 = 0;
      }
      long long v14 = v16;
      uint64_t v15 = v17;
      [(PUTrimToolController *)self setUnadjustedAssetDuration:&v14];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)setCompositionController:(id)a3
{
  BOOL v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    [(PUTrimToolController *)self _updatePlayheadStyle];
    [(PUTrimToolController *)self _updateScrubberContents];
    [(PUTrimToolController *)self _updatePlayerWrapperTrim];
    [(PUTrimToolController *)self _updateDebugTimeCodeLabel];
    [(PUTrimToolController *)self _updateSnapStripController];
    BOOL v5 = v6;
  }
}

- (void)setUnadjustedStillImageTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 unadjustedStillImageTime = &self->_unadjustedStillImageTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 unadjustedStillImageTime = self->_unadjustedStillImageTime;
  if (CMTimeCompare(&time1, (CMTime *)&unadjustedStillImageTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_unadjustedStillImageTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_unadjustedStillImageTime->CMTimeValue value = v6;
    [(PUTrimToolController *)self _updateScrubberContents];
    id v7 = [(PUTrimToolController *)self snapStripController];
    [v7 updateSnapStripView];
  }
}

- (void)releaseAVObjects
{
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber _releaseAVObjects];
  [(PXTrimToolPlayerWrapper *)self->_playerWrapper setPlayerObserver:0];
  playerWrapper = self->_playerWrapper;
  self->_playerWrapper = 0;

  currentVideoAsset = self->_currentVideoAsset;
  self->_currentVideoAsset = 0;

  currentVideoComposition = self->_currentVideoComposition;
  self->_currentVideoComposition = 0;
}

- (double)scrubberHeight
{
  [(PXLivePhotoTrimScrubberSpec *)self->_spec scrubberHeight];
  return result;
}

- (void)trimScrubberDidLayoutSubviews:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PUTrimToolController_trimScrubberDidLayoutSubviews___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __54__PUTrimToolController_trimScrubberDidLayoutSubviews___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) snapStripController];
  [v1 updateSnapStripView];
}

- (void)trimScrubberPausePlayer:(id)a3
{
  BOOL v4 = [(PUTrimToolController *)self _playPauseButtonIfLoaded];
  BOOL v5 = [v4 window];

  if (v5)
  {
    id v6 = [(PUTrimToolController *)self playerWrapper];
    [v6 pause];
  }
}

- (void)trimScrubberDidUnzoom:(id)a3
{
  slomoView = self->_slomoView;
  [(PXSlowMotionEditor *)slomoView maxValue];
  [(PXSlowMotionEditor *)slomoView setZoomMinValue:0.0 maxValue:v5];
  if ([(PUTrimToolController *)self isPortraitVideo]) {
    [(PXFocusTimelineView *)self->_focusTimelineView unzoom];
  }
  [(PUTrimToolController *)self _updateDebugTimeCodeLabel];
}

- (void)trimScrubber:(id)a3 didZoomToMinimumValue:(double)a4 maximumValue:(double)a5
{
  -[PXSlowMotionEditor setZoomMinValue:maxValue:](self->_slomoView, "setZoomMinValue:maxValue:", a3);
  if ([(PUTrimToolController *)self isPortraitVideo]) {
    [(PXFocusTimelineView *)self->_focusTimelineView setZoomMinValue:a4 maxValue:a5];
  }
  [(PUTrimToolController *)self _updateDebugTimeCodeLabel];
}

- (void)trimScrubberAssetDurationDidChange:(id)a3
{
  id v3 = [(PUTrimToolController *)self snapStripController];
  [v3 updateSnapStripView];
}

- (void)trimScrubber:(id)a3 didChangeTimeForElement:(int64_t)a4
{
  if ([a3 currentlyInteractingElement])
  {
    [(PUTrimToolController *)self _seekToTimeForElement:a4 exact:1];
    id v6 = [(PUTrimToolController *)self snapStripController];
    [v6 updateSnapStripView];

    [(PUTrimToolController *)self _updateTimeCodeOverlay];
  }
}

- (void)_didCompleteInteractiveEditForElement:(int64_t)a3 atTime:(id *)a4 state:(unint64_t)a5
{
  unint64_t v9 = a3 - 1;
  uint64_t v10 = [(PUTrimToolController *)self currentEditSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v9 <= 1 && (isKindOfClass & 1) != 0)
  {
    long long v13 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(PUTrimToolController *)self setPlayheadTime:&v13 forceSeek:1];
  }
  self->_currentlyInteractingElement = 0;
  [(PUTrimToolController *)self setInternalState:a5];
  id v12 = [(PUTrimToolController *)self delegate];
  [v12 trimToolController:self didEndInteractivelyEditingElement:a3];
}

- (void)trimScrubber:(id)a3 didEndInteractivelyEditingElement:(int64_t)a4 successful:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (a4 != 3)
  {
    unint64_t v9 = [(PUTrimToolController *)self _playPauseButtonIfLoaded];
    uint64_t v10 = [v9 window];

    if (a4 == 4)
    {
      if (v10)
      {
        double v11 = +[PUPhotoEditProtoSettings sharedInstance];
        int v12 = [v11 pauseAfterMovingPlayhead];

        if (v12)
        {
          long long v13 = [(PUTrimToolController *)self playerWrapper];
          [v13 pause];
        }
        [(PUTrimToolController *)self _seekToTimeForElement:4 exact:1 forceSeek:1];
      }
    }
  }
  memset(&location[1], 0, sizeof(CMTime));
  trimScrubber = self->_trimScrubber;
  if (trimScrubber) {
    [(PXLivePhotoTrimScrubber *)trimScrubber timeForElement:a4];
  }
  if ((unint64_t)(a4 - 1) > 1)
  {
    if ((unint64_t)(a4 - 3) <= 1)
    {
      if (v5)
      {
        memset(location, 0, 24);
        CMTime v20 = self->_trimScrubber;
        if (v20) {
          [(PXLivePhotoTrimScrubber *)v20 keyTime];
        }
        [(PUTrimToolController *)self currentStillFrameTime];
        CMTime v26 = location[0];
        int32_t v21 = CMTimeCompare(&v26, &time2);
        CMTime v22 = +[PUPhotoEditProtoSettings sharedInstance];
        char v23 = [v22 requireTapToShowMakePosterFrame];

        uint64_t v24 = 0;
        if (v21 && (v23 & 1) == 0)
        {
          if ([(PUTrimToolController *)self _showKeyFrameSelection]) {
            uint64_t v24 = 6;
          }
          else {
            uint64_t v24 = 0;
          }
        }
        goto LABEL_22;
      }
      [(PUTrimToolController *)self _resetScrubberToStillPhotoFrame];
    }
    uint64_t v24 = 0;
LABEL_22:
    location[0] = location[1];
    [(PUTrimToolController *)self _didCompleteInteractiveEditForElement:a4 atTime:location state:v24];
    goto LABEL_23;
  }
  [MEMORY[0x1E4F7A648] begin];
  [(PUTrimToolController *)self _updateCompositionController];
  uint64_t v15 = [(PUTrimToolController *)self playerWrapper];
  location[0] = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  [v15 seekToTime:location];

  objc_initWeak((id *)location, self);
  long long v16 = (void *)MEMORY[0x1E4F7A648];
  uint64_t v17 = MEMORY[0x1E4F14428];
  id v18 = MEMORY[0x1E4F14428];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__PUTrimToolController_trimScrubber_didEndInteractivelyEditingElement_successful___block_invoke;
  v28[3] = &unk_1E5F2D528;
  objc_copyWeak(v29, (id *)location);
  v29[1] = (id)a4;
  CMTime v30 = location[1];
  [v16 commitAndNotifyOnQueue:v17 withBlock:v28];

  CMTime v19 = [(PUTrimToolController *)self snapStripController];
  [v19 updateSnapStripView];

  [(PUTrimToolController *)self _updateDebugTimeCodeLabel];
  objc_destroyWeak(v29);
  objc_destroyWeak((id *)location);
LABEL_23:
  [(PUTrimToolController *)self setIsPerformingLiveInteraction:0];
  CMTime v25 = [(PUTrimToolController *)self delegate];
  objc_msgSend(v25, "trimToolController:didChangeIsPerformingLiveInteraction:", self, -[PUTrimToolController isPerformingLiveInteraction](self, "isPerformingLiveInteraction"));
}

void __82__PUTrimToolController_trimScrubber_didEndInteractivelyEditingElement_successful___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  [WeakRetained _didCompleteInteractiveEditForElement:v3 atTime:&v4 state:0];
}

- (void)trimScrubber:(id)a3 didBeginInteractivelyEditingElement:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = 0;
  self->_currentlyInteractingElement = a4;
  uint64_t v8 = 1;
  id v17 = v6;
  if ((unint64_t)(a4 - 1) < 2)
  {
    uint64_t v9 = 2;
  }
  else if (a4 == 4)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 1;
    uint64_t v9 = 4;
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_8;
    }
    uint64_t v7 = 0;
    uint64_t v9 = 5;
  }
  [(PUTrimToolController *)self setInternalState:v9];
LABEL_8:
  [(PUTrimToolController *)self _seekToTimeForElement:a4 exact:v8 forceSeek:v7];
  uint64_t v10 = [(PUTrimToolController *)self snapStripController];
  [v10 updateSnapStripView];

  double v11 = [(PUTrimToolController *)self livePhotoKeyFramePickerAppearanceTimer];

  if (v11)
  {
    int v12 = [(PUTrimToolController *)self livePhotoKeyFramePickerAppearanceTimer];
    [v12 invalidate];

    [(PUTrimToolController *)self setLivePhotoKeyFramePickerAppearanceTimer:0];
  }
  long long v13 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

  if (v13)
  {
    long long v14 = [(PUTrimToolController *)self livePhotoKeyFramePicker];
    [v14 dismissViewControllerAnimated:0 completion:0];
  }
  uint64_t v15 = [(PUTrimToolController *)self delegate];
  [v15 trimToolController:self didBeginInteractivelyEditingElement:a4];

  [(PUTrimToolController *)self setIsPerformingLiveInteraction:1];
  long long v16 = [(PUTrimToolController *)self delegate];
  objc_msgSend(v16, "trimToolController:didChangeIsPerformingLiveInteraction:", self, -[PUTrimToolController isPerformingLiveInteraction](self, "isPerformingLiveInteraction"));
}

- (BOOL)trimScrubber:(id)a3 canBeginInteractivelyEditingElement:(int64_t)a4
{
  return a4 != 0;
}

- (void)trimScrubber:(id)a3 didTapTimelineAtTime:(id *)a4
{
  id v6 = +[PUPhotoEditProtoSettings sharedInstance];
  int v7 = [v6 tapTimelineToSeek];

  if (v7)
  {
    long long v8 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(PUTrimToolController *)self setPlayheadTime:&v8];
  }
}

- (void)trimScrubber:(id)a3 didTapElement:(int64_t)a4
{
  if ([(PUTrimToolController *)self internalState] != 6)
  {
    if ([(PUTrimToolController *)self _showKeyFrameSelection]) {
      uint64_t v5 = 6;
    }
    else {
      uint64_t v5 = 0;
    }
    [(PUTrimToolController *)self setInternalState:v5];
  }
}

- (void)setSlomoEnabled:(BOOL)a3
{
  if (self->_slomoEnabled != a3)
  {
    self->_slomoEnabled = a3;
    [(PUTrimToolController *)self _updateSlomoViewAnimated:1];
  }
}

- (BOOL)isSlomoEnabled
{
  return self->_slomoEnabled;
}

- (void)_dismissKeyFramePickerAndResetToStillFrame
{
  uint64_t v3 = [(PUTrimToolController *)self livePhotoKeyFramePickerAppearanceTimer];

  if (v3)
  {
    long long v4 = [(PUTrimToolController *)self livePhotoKeyFramePickerAppearanceTimer];
    [v4 invalidate];

    [(PUTrimToolController *)self setLivePhotoKeyFramePickerAppearanceTimer:0];
    uint64_t v5 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

    if (!v5) {
      [(PUTrimToolController *)self _resetScrubberToStillPhotoFrame];
    }
  }
  id v6 = [(PUTrimToolController *)self livePhotoKeyFramePicker];

  if (v6)
  {
    objc_initWeak(&location, self);
    int v7 = [(PUTrimToolController *)self livePhotoKeyFramePicker];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__PUTrimToolController__dismissKeyFramePickerAndResetToStillFrame__block_invoke;
    void v8[3] = &unk_1E5F2E530;
    objc_copyWeak(&v9, &location);
    [v7 dismissViewControllerAnimated:0 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __66__PUTrimToolController__dismissKeyFramePickerAndResetToStillFrame__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetScrubberToStillPhotoFrame];
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
  [(PUTrimToolController *)self _dismissKeyFramePickerAndResetToStillFrame];
  [(PUTrimToolController *)self _resetScrubberToStillPhotoFrame];
}

- (void)willHideTrimTool
{
  self->_isActive = 0;
  [(PUTrimToolController *)self _dismissKeyFramePickerAndResetToStillFrame];
}

- (void)willShowTrimTool
{
  self->_isActive = 1;
}

- (void)_seekToTimeForElement:(int64_t)a3 exact:(BOOL)a4 forceSeek:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  memset(&v17, 0, sizeof(v17));
  trimScrubber = self->_trimScrubber;
  if (trimScrubber) {
    [(PXLivePhotoTrimScrubber *)trimScrubber timeForElement:a3];
  }
  if (a3 == 4)
  {
    CMTime lhs = v17;
    [(PUTrimToolController *)self _currentPlayerScaledTimeFromOriginalTime:&lhs];
LABEL_11:
    CMTime v17 = time1;
    goto LABEL_12;
  }
  if (a3 == 3)
  {
    uint64_t v10 = self->_trimScrubber;
    if (v10) {
      [(PXLivePhotoTrimScrubber *)v10 trimEndTime];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = v17;
    if (!CMTimeCompare(&time1, &time2))
    {
      [(PUTrimToolController *)self _frameDuration];
      CMTime lhs = v17;
      CMTimeSubtract(&time1, &lhs, &rhs);
      goto LABEL_11;
    }
  }
LABEL_12:
  double v11 = [(PUTrimToolController *)self playerWrapper];
  CMTime time1 = v17;
  [v11 seekToTime:&time1 untrimmed:(unint64_t)(a3 - 1) < 2 exact:v6 forceSeek:v5];

  CMTime v12 = v17;
  [(PUTrimToolController *)self setDebugPlayerTime:&v12];
}

- (void)_seekToTimeForElement:(int64_t)a3 exact:(BOOL)a4
{
}

- (void)setPlayheadTime:(id *)a3 forceSeek:(BOOL)a4
{
  BOOL v4 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setKeyTime:&v6];
  [(PUTrimToolController *)self _seekToTimeForElement:4 exact:1 forceSeek:v4];
}

- (void)setPlayheadTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(PUTrimToolController *)self setPlayheadTime:&v3 forceSeek:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playheadTime
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_trimScrubber;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result keyTime];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  return result;
}

- (id)_playPauseButtonIfLoaded
{
  return self->_playPauseButton;
}

- (UIButton)playPauseButton
{
  playPauseButton = self->_playPauseButton;
  if (!playPauseButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
    BOOL v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = +[PUInterfaceManager currentTheme];
    int v7 = [v6 videoEditingToolbarToolButtonColor];
    [(UIButton *)v5 setTintColor:v7];

    long long v8 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUVideoEditPlayButton");
    id v9 = [v8 imageWithRenderingMode:2];

    [(UIButton *)v5 setImage:v9 forState:0];
    [(UIButton *)v5 addTarget:self action:sel__handlePlayPauseButton_ forControlEvents:64];
    uint64_t v10 = self->_playPauseButton;
    self->_playPauseButton = v5;

    [(PUTrimToolController *)self _updatePlayPauseButton];
    playPauseButton = self->_playPauseButton;
  }
  return playPauseButton;
}

- (void)setOriginalEndTime:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  p_originalEndTime = &self->_originalEndTime;
  CMTime time1 = (CMTime)self->_originalEndTime;
  CMTime time2 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_originalEndTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_originalEndTime->CMTimeValue value = v6;
    long long v9 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setOriginalEndTime:&v9];
    if (a3->var2)
    {
      CMTime time1 = (CMTime)*a3;
      int v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&time1];
      v13[0] = v7;
      long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimEndTimes:v8];
    }
    else
    {
      [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimEndTimes:0];
    }
  }
}

- (void)setOriginalStartTime:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  p_originalStartTime = &self->_originalStartTime;
  CMTime time1 = (CMTime)self->_originalStartTime;
  CMTime time2 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_originalStartTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_originalStartTime->CMTimeValue value = v6;
    long long v9 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setOriginalStartTime:&v9];
    if (a3->var2)
    {
      CMTime time1 = (CMTime)*a3;
      int v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&time1];
      v13[0] = v7;
      long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimStartTimes:v8];
    }
    else
    {
      [(PXLivePhotoTrimScrubber *)self->_trimScrubber setSnapTrimStartTimes:0];
    }
  }
}

- (void)_createRendererIfNeeded
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PUTrimToolController *)self renderer];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8AA60]);
    BOOL v5 = [(PUTrimToolController *)self editSource];
    id v6 = (id)[v4 initWithEditSource:v5];

    [(PUTrimToolController *)self setRenderer:v6];
  }
}

- (UIImage)placeholderImage
{
  return (UIImage *)[(PXLivePhotoTrimScrubber *)self->_trimScrubber placeholderImage];
}

- (void)setPlaceholderImage:(id)a3
{
  id v6 = a3;
  id v4 = +[PUPhotoEditProtoSettings sharedInstance];
  char v5 = [v4 disableVideoFilmstrip];

  if ((v5 & 1) == 0) {
    [(PXLivePhotoTrimScrubber *)self->_trimScrubber setPlaceholderImage:v6];
  }
}

- (void)livePhotoRenderDidChange:(BOOL)a3
{
  if (a3)
  {
    self->_needsUpdateRenderForVisualChanges = 1;
    id v3 = [(PUTrimToolController *)self playerWrapper];
    [v3 invalidateComposition];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PUTrimToolController;
  [(PUTrimToolController *)&v6 touchesBegan:a3 withEvent:a4];
  focusTimelineAction = self->_focusTimelineAction;
  if (focusTimelineAction)
  {
    if (![(PXFocusTimelineAction *)focusTimelineAction kind]) {
      [(PUTrimToolController *)self _hideScrubberTimelineOverlay];
    }
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "verticalSizeClass", a3);
  objc_super v6 = [(PUTrimToolController *)self traitCollection];
  uint64_t v7 = [v6 verticalSizeClass];

  if (v5 != v7)
  {
    long long v8 = [(PUTrimToolController *)self traitCollection];
    BOOL v9 = [v8 verticalSizeClass] == 1;

    trimScrubber = self->_trimScrubber;
    [(PXLivePhotoTrimScrubber *)trimScrubber setUseMiniScrubber:v9];
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUTrimToolController;
  [(PUTrimToolController *)&v8 viewDidLayoutSubviews];
  id v3 = [(PUTrimToolController *)self traitCollection];
  -[PXLivePhotoTrimScrubber setUseMiniScrubber:](self->_trimScrubber, "setUseMiniScrubber:", [v3 verticalSizeClass] == 1);

  uint64_t v4 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:0];
  uint64_t v5 = [(PUTrimToolController *)self snapStripController];
  [v5 updateSnapStripView];

  [MEMORY[0x1E4F39CF8] setDisableActions:v4];
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUTrimToolController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __45__PUTrimToolController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScrubberTimelineOverlayButtonOffset];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUTrimToolController;
  [(PUTrimToolController *)&v4 viewWillAppear:a3];
  [(PUTrimToolController *)self _updatePlayheadStyle];
}

- (void)trimScrubber:(id)a3 debugEndOffset:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(PUTrimToolController *)self view];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  debugEndOffsetView = self->_debugEndOffsetView;
  -[UIView setFrame:](debugEndOffsetView, "setFrame:", v12, v14, v16, v18);
}

- (void)trimScrubber:(id)a3 debugStartOffset:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(PUTrimToolController *)self view];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  debugStartOffsetView = self->_debugStartOffsetView;
  -[UIView setFrame:](debugStartOffsetView, "setFrame:", v12, v14, v16, v18);
}

- (void)trimScrubber:(id)a3 debugEndRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(PUTrimToolController *)self view];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  debugEndRectView = self->_debugEndRectView;
  -[UIView setFrame:](debugEndRectView, "setFrame:", v12, v14, v16, v18);
}

- (void)trimScrubber:(id)a3 debugStartRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(PUTrimToolController *)self view];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  debugStartRectView = self->_debugStartRectView;
  -[UIView setFrame:](debugStartRectView, "setFrame:", v12, v14, v16, v18);
}

- (void)viewDidLoad
{
  v210[4] = *MEMORY[0x1E4F143B8];
  v209.receiver = self;
  v209.super_class = (Class)PUTrimToolController;
  [(PUTrimToolController *)&v209 viewDidLoad];
  v205 = [(PUTrimToolController *)self playerWrapper];
  [v205 setPlayerObserver:self];
  id v3 = (PXLivePhotoTrimScrubberSpec *)objc_alloc_init(MEMORY[0x1E4F90320]);
  spec = self->_spec;
  self->_spec = v3;

  uint64_t v5 = +[PUInterfaceManager currentTheme];
  dispatch_time_t v6 = [v5 photoEditingAdjustmentsBarDisabledColor];
  [(PXLivePhotoTrimScrubberSpec *)self->_spec setDisabledOverlayColor:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F90870]);
  uint64_t v8 = objc_opt_class();
  id v9 = self->_spec;
  uint64_t v10 = [(PUTrimToolController *)self px_extendedTraitCollection];
  double v11 = (PXLivePhotoTrimScrubber *)[v7 initWithFilmStripViewClass:v8 spec:v9 traitCollection:v10];
  trimScrubber = self->_trimScrubber;
  self->_trimScrubber = v11;

  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setAllowZoom:[(PUTrimToolController *)self playButtonEnabled]];
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setDelegate:self];
  double v13 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v14 = [v13 showVideoScrubberDebugOverlay];

  int v203 = v14;
  [(PXLivePhotoTrimScrubber *)self->_trimScrubber setShowVideoScrubberDebugOverlay:v14];
  double v15 = +[PUInterfaceManager currentTheme];
  double v16 = [(PUTrimToolController *)self view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v17 = self->_trimScrubber;
  [(PXLivePhotoTrimScrubber *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v18 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
  CMTime v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v18];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  CMTime v20 = [v19 layer];
  [v20 setCornerRadius:5.0];

  [v19 setClipsToBounds:1];
  int32_t v21 = [v15 photoEditingTrimControllerBackgroundColor];
  [v19 setBackgroundColor:v21];

  double v22 = 0.0;
  [v19 setAlpha:0.0];
  objc_storeStrong((id *)&self->_auxilaryContainerView, v19);
  [v16 addSubview:self->_auxilaryContainerView];
  v204 = (void *)v18;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v18];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v24 = [v23 layer];
  [v24 setCornerRadius:5.0];

  [v23 setClipsToBounds:1];
  CMTime v25 = [v15 photoEditingTrimControllerBackgroundColor];
  [v23 setBackgroundColor:v25];

  objc_storeStrong((id *)&self->_scrubberPlayButtonContainerView, v23);
  [v16 addSubview:v23];
  CMTime v26 = [v23 contentView];
  [v26 addSubview:v17];

  CMTime v27 = [v23 topAnchor];
  CMTime v28 = [(PXLivePhotoTrimScrubber *)v17 topAnchor];
  double v29 = [v27 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  CMTime v30 = [v23 bottomAnchor];
  int v31 = [(PXLivePhotoTrimScrubber *)v17 bottomAnchor];
  int v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  CMTime v33 = [v23 rightAnchor];
  v34 = [(PXLivePhotoTrimScrubber *)v17 rightAnchor];
  uint64_t v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  CMTime v36 = [v23 leftAnchor];
  CGRect v37 = [v16 leftAnchor];
  CGRect v38 = [v36 constraintEqualToAnchor:v37 constant:10.0];
  [v38 setActive:1];

  v39 = [v23 rightAnchor];
  int v40 = [v16 rightAnchor];
  long long v41 = [v39 constraintEqualToAnchor:v40 constant:-10.0];
  [v41 setActive:1];

  CMTimeRange v42 = [v19 leftAnchor];
  CMTime v43 = [v23 leftAnchor];
  long long v44 = [v42 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  CMTimeEpoch v45 = [v19 rightAnchor];
  v46 = [v23 rightAnchor];
  char v47 = [v45 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  if (self->_playButtonEnabled) {
    double v22 = *MEMORY[0x1E4F90EC0];
  }
  long long v48 = [v19 heightAnchor];
  uint64_t v49 = [v48 constraintEqualToConstant:v22];
  [v49 setActive:1];

  char v50 = [v19 bottomAnchor];
  v208 = v16;
  long long v51 = [v16 bottomAnchor];
  uint64_t v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v206 = v19;
  CMTime v53 = [v19 topAnchor];
  CMTime v54 = [v23 bottomAnchor];
  CMTime v55 = [v53 constraintEqualToAnchor:v54 constant:3.0];
  [v55 setActive:1];

  v207 = v17;
  if (self->_playButtonEnabled)
  {
    CMTime v56 = [(PUTrimToolController *)self playPauseButton];
    CMTime v57 = [v23 contentView];
    [v57 addSubview:v56];

    [v56 setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v58 = [v23 centerYAnchor];
    uint64_t v59 = [v56 centerYAnchor];
    CMTime v60 = [v58 constraintEqualToAnchor:v59 constant:0.0];
    [v60 setActive:1];

    CMTime v61 = [v23 leftAnchor];
    long long v62 = [v56 leftAnchor];
    uint64_t v63 = [v61 constraintEqualToAnchor:v62 constant:0.0];
    [v63 setActive:1];

    id v64 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v64 setTranslatesAutoresizingMaskIntoConstraints:0];
    v65 = [v64 widthAnchor];
    v66 = [v65 constraintEqualToConstant:1.0];
    [v66 setActive:1];

    v67 = [v23 contentView];
    [v67 addSubview:v64];

    v68 = [v64 leftAnchor];
    v69 = [v23 leftAnchor];
    v70 = [v68 constraintEqualToAnchor:v69 constant:47.0];
    [v70 setActive:1];

    v71 = [v64 topAnchor];
    v72 = [v23 topAnchor];
    v73 = [v71 constraintEqualToAnchor:v72 constant:0.0];
    [v73 setActive:1];

    v74 = [v64 bottomAnchor];
    v75 = [v23 bottomAnchor];
    v76 = [v74 constraintEqualToAnchor:v75 constant:0.0];
    [v76 setActive:1];

    v77 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v64 setBackgroundColor:v77];

    v78 = [(PXLivePhotoTrimScrubber *)v17 leftAnchor];
    v79 = [v64 rightAnchor];
    v80 = [v78 constraintEqualToAnchor:v79 constant:0.0];
    [v80 setActive:1];
  }
  else
  {
    CMTime v56 = [v23 leftAnchor];
    id v64 = [(PXLivePhotoTrimScrubber *)v17 leftAnchor];
    v78 = [v56 constraintEqualToAnchor:v64];
    [v78 setActive:1];
  }

  if ([(PUTrimToolController *)self isSlomoEnabled])
  {
    [(PUTrimToolController *)self _updateSlomoViewAnimated:0];
  }
  else if ([(PUTrimToolController *)self isPortraitVideo])
  {
    v81 = (PXFocusTimelineView *)objc_alloc_init(MEMORY[0x1E4F90868]);
    focusTimelineView = self->_focusTimelineView;
    self->_focusTimelineView = v81;

    [(PXFocusTimelineView *)self->_focusTimelineView setClipsToBounds:1];
    [(PXFocusTimelineView *)self->_focusTimelineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXFocusTimelineView *)self->_focusTimelineView setDelegate:self];
    v83 = [v206 contentView];
    [v83 addSubview:self->_focusTimelineView];

    [v206 setAlpha:1.0];
    focusTimelineAction = self->_focusTimelineAction;
    self->_focusTimelineAction = 0;

    double v85 = *MEMORY[0x1E4F90EB8] * 0.5;
    if (self->_playButtonEnabled) {
      double v86 = 66.0;
    }
    else {
      double v86 = 24.0;
    }
    v87 = [(PXFocusTimelineView *)self->_focusTimelineView leftAnchor];
    v88 = [v206 leftAnchor];
    v89 = [v87 constraintEqualToAnchor:v88 constant:v86 - v85];
    [v89 setActive:1];

    v90 = [(PXFocusTimelineView *)self->_focusTimelineView rightAnchor];
    v91 = [v206 rightAnchor];
    v92 = [v90 constraintEqualToAnchor:v91 constant:v85 + -18.0];
    [v92 setActive:1];

    v93 = [(PXFocusTimelineView *)self->_focusTimelineView topAnchor];
    v94 = [v206 topAnchor];
    v95 = [v93 constraintEqualToAnchor:v94];
    [v95 setActive:1];

    v96 = [(PXFocusTimelineView *)self->_focusTimelineView bottomAnchor];
    v97 = [v206 bottomAnchor];
    v98 = [v96 constraintEqualToAnchor:v97];
    [v98 setActive:1];

    v99 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    trimScrubberTimelineOverlayView = self->_trimScrubberTimelineOverlayView;
    self->_trimScrubberTimelineOverlayView = v99;

    v101 = [MEMORY[0x1E4FB1618] blackColor];
    v102 = [v101 colorWithAlphaComponent:0.6];
    [(UIView *)self->_trimScrubberTimelineOverlayView setBackgroundColor:v102];

    [(UIView *)self->_trimScrubberTimelineOverlayView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_trimScrubberTimelineOverlayView setHidden:1];
    [(UIView *)self->_trimScrubberTimelineOverlayView setAlpha:0.0];
    [(PXLivePhotoTrimScrubber *)v17 addSubview:self->_trimScrubberTimelineOverlayView];
    v196 = (void *)MEMORY[0x1E4F28DC8];
    v201 = [(UIView *)self->_trimScrubberTimelineOverlayView leadingAnchor];
    v200 = [(PXLivePhotoTrimScrubber *)v17 leadingAnchor];
    v199 = [v201 constraintEqualToAnchor:v200];
    v210[0] = v199;
    v198 = [(UIView *)self->_trimScrubberTimelineOverlayView trailingAnchor];
    v197 = [(PXLivePhotoTrimScrubber *)v17 trailingAnchor];
    v195 = [v198 constraintEqualToAnchor:v197];
    v210[1] = v195;
    v194 = [(UIView *)self->_trimScrubberTimelineOverlayView topAnchor];
    v103 = [(PXLivePhotoTrimScrubber *)v17 topAnchor];
    v104 = [v194 constraintEqualToAnchor:v103];
    v210[2] = v104;
    v105 = [(UIView *)self->_trimScrubberTimelineOverlayView bottomAnchor];
    v106 = [(PXLivePhotoTrimScrubber *)v17 bottomAnchor];
    v107 = [v105 constraintEqualToAnchor:v106];
    v210[3] = v107;
    v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:4];
    [v196 activateConstraints:v108];

    v109 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    trimScrubberTimelineOverlayButton = self->_trimScrubberTimelineOverlayButton;
    self->_trimScrubberTimelineOverlayButton = v109;

    v111 = [MEMORY[0x1E4FB1618] blackColor];
    v112 = [v111 colorWithAlphaComponent:0.4];
    [(UIButton *)self->_trimScrubberTimelineOverlayButton setBackgroundColor:v112];

    v113 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)self->_trimScrubberTimelineOverlayButton setTintColor:v113];

    v114 = [(UIButton *)self->_trimScrubberTimelineOverlayButton layer];
    [v114 setMasksToBounds:1];

    id v115 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
    uint64_t v116 = [v115 CGColor];
    v117 = [(UIButton *)self->_trimScrubberTimelineOverlayButton layer];
    [v117 setBorderColor:v116];

    v118 = [(UIButton *)self->_trimScrubberTimelineOverlayButton layer];
    [v118 setBorderWidth:1.0];

    [(UIButton *)self->_trimScrubberTimelineOverlayButton addTarget:self action:sel__handleScrubberTimelineOverlayButton_ forControlEvents:64];
    [(UIView *)self->_trimScrubberTimelineOverlayView addSubview:self->_trimScrubberTimelineOverlayButton];
  }
  id v119 = objc_alloc_init(MEMORY[0x1E4F906D8]);
  [v119 setTranslatesAutoresizingMaskIntoConstraints:0];
  v120 = v208;
  [v208 addSubview:v119];
  v121 = [v119 leftAnchor];
  v122 = [v208 leftAnchor];
  v123 = [v121 constraintEqualToAnchor:v122];
  [v123 setActive:1];

  v124 = [v119 rightAnchor];
  v125 = [v208 rightAnchor];
  v126 = [v124 constraintEqualToAnchor:v125];
  [v126 setActive:1];

  v127 = [v119 topAnchor];
  v128 = [v208 topAnchor];
  v129 = [v127 constraintEqualToAnchor:v128];
  [v129 setActive:1];

  v130 = [v119 heightAnchor];
  v131 = [v130 constraintEqualToConstant:12.0];
  [v131 setActive:1];

  v132 = [v23 topAnchor];
  v133 = [v119 bottomAnchor];
  v134 = [v132 constraintEqualToAnchor:v133 constant:5.0];
  [v134 setActive:1];

  v135 = objc_opt_new();
  v136 = objc_opt_new();
  [(PUTrimToolController *)self setSnapStripSpec:v136];

  v137 = [(PUTrimToolController *)self snapStripSpec];
  [v135 setSpec:v137];

  [v135 setTrimScrubber:self->_trimScrubber];
  [v135 setSnapStripView:v119];
  v138 = +[PUPhotoEditProtoSettings sharedInstance];
  objc_msgSend(v135, "setAllowStartEndTimeSnapIndicators:", objc_msgSend(v138, "loopBounceTrimAllowed"));

  [(PUTrimToolController *)self setSnapStripController:v135];
  if (v203)
  {
    uint64_t v139 = [MEMORY[0x1E4FB08E0] monospacedDigitSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D8]];
    v140 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    debugTimeCodeLabel = self->_debugTimeCodeLabel;
    self->_debugTimeCodeLabel = v140;

    [(UILabel *)self->_debugTimeCodeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_debugTimeCodeLabel setFont:v139];
    v142 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    debugPlayerTimeLabel = self->_debugPlayerTimeLabel;
    self->_debugPlayerTimeLabel = v142;

    [(UILabel *)self->_debugPlayerTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_debugPlayerTimeLabel setFont:v139];
    v144 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    debugOriginalTimeLabel = self->_debugOriginalTimeLabel;
    self->_debugOriginalTimeLabel = v144;

    [(UILabel *)self->_debugOriginalTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_debugOriginalTimeLabel setFont:v139];
    v146 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    debugTrimToolStateLabel = self->_debugTrimToolStateLabel;
    self->_debugTrimToolStateLabel = v146;

    [(UILabel *)self->_debugTrimToolStateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v202 = (void *)v139;
    [(UILabel *)self->_debugTrimToolStateLabel setFont:v139];
    v148 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    debugTrimToolPlayheadStyleLabel = self->_debugTrimToolPlayheadStyleLabel;
    self->_debugTrimToolPlayheadStyleLabel = v148;

    [(UILabel *)self->_debugTrimToolPlayheadStyleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v150 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_debugTrimToolPlayheadStyleLabel setTextColor:v150];

    [(UILabel *)self->_debugTrimToolPlayheadStyleLabel setFont:v139];
    v151 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    debugStartRectView = self->_debugStartRectView;
    self->_debugStartRectView = v151;

    v153 = [MEMORY[0x1E4FB1618] magentaColor];
    [(UIView *)self->_debugStartRectView setBackgroundColor:v153];

    v154 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    debugEndRectView = self->_debugEndRectView;
    self->_debugEndRectView = v154;

    v156 = [MEMORY[0x1E4FB1618] systemTealColor];
    v157 = [v156 colorWithAlphaComponent:0.5];
    [(UIView *)self->_debugEndRectView setBackgroundColor:v157];

    v158 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    debugStartOffsetView = self->_debugStartOffsetView;
    self->_debugStartOffsetView = v158;

    v160 = [MEMORY[0x1E4FB1618] redColor];
    [(UIView *)self->_debugStartOffsetView setBackgroundColor:v160];

    v161 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    debugEndOffsetView = self->_debugEndOffsetView;
    self->_debugEndOffsetView = v161;

    v163 = [MEMORY[0x1E4FB1618] blueColor];
    [(UIView *)self->_debugEndOffsetView setBackgroundColor:v163];

    [v208 addSubview:self->_debugTimeCodeLabel];
    [v208 addSubview:self->_debugPlayerTimeLabel];
    [v208 addSubview:self->_debugOriginalTimeLabel];
    [v208 addSubview:self->_debugTrimToolStateLabel];
    [v208 addSubview:self->_debugTrimToolPlayheadStyleLabel];
    [v208 addSubview:self->_debugStartRectView];
    [v208 addSubview:self->_debugEndRectView];
    [v208 addSubview:self->_debugStartOffsetView];
    [v208 addSubview:self->_debugEndOffsetView];
    v164 = [(UILabel *)self->_debugTimeCodeLabel leadingAnchor];
    v165 = [(UILabel *)self->_debugTrimToolStateLabel leadingAnchor];
    v166 = [v164 constraintEqualToAnchor:v165];
    [v166 setActive:1];

    v167 = [(UILabel *)self->_debugTimeCodeLabel bottomAnchor];
    v168 = [(UILabel *)self->_debugTrimToolStateLabel topAnchor];
    v169 = [v167 constraintEqualToAnchor:v168 constant:-4.0];
    [v169 setActive:1];

    v170 = [(UILabel *)self->_debugPlayerTimeLabel trailingAnchor];
    v171 = [(UILabel *)self->_debugTrimToolPlayheadStyleLabel trailingAnchor];
    v172 = [v170 constraintEqualToAnchor:v171];
    [v172 setActive:1];

    v173 = [(UILabel *)self->_debugPlayerTimeLabel bottomAnchor];
    v174 = [(UILabel *)self->_debugTimeCodeLabel bottomAnchor];
    v175 = [v173 constraintEqualToAnchor:v174];
    [v175 setActive:1];

    v176 = [(UILabel *)self->_debugOriginalTimeLabel trailingAnchor];
    v177 = [(UILabel *)self->_debugPlayerTimeLabel trailingAnchor];
    v178 = [v176 constraintEqualToAnchor:v177];
    [v178 setActive:1];

    v179 = [(UILabel *)self->_debugOriginalTimeLabel bottomAnchor];
    v180 = [(UILabel *)self->_debugPlayerTimeLabel topAnchor];
    v181 = [v179 constraintEqualToAnchor:v180 constant:-4.0];
    [v181 setActive:1];

    v182 = [(UILabel *)self->_debugTrimToolStateLabel leadingAnchor];
    v183 = [v208 leadingAnchor];
    v184 = [v182 constraintEqualToAnchor:v183 constant:10.0];
    [v184 setActive:1];

    v120 = v208;
    v185 = [(UILabel *)self->_debugTrimToolStateLabel bottomAnchor];
    v186 = [v208 topAnchor];
    v187 = [v185 constraintEqualToAnchor:v186];
    [v187 setActive:1];

    v188 = [(UILabel *)self->_debugTrimToolPlayheadStyleLabel trailingAnchor];
    v189 = [v208 trailingAnchor];
    v190 = [v188 constraintEqualToAnchor:v189 constant:-10.0];
    [v190 setActive:1];

    v191 = [(UILabel *)self->_debugTrimToolPlayheadStyleLabel bottomAnchor];
    v192 = [v208 topAnchor];
    v193 = [v191 constraintEqualToAnchor:v192];
    [v193 setActive:1];

    [(PUTrimToolController *)self _updateDebugTimeCodeLabel];
    [(PUTrimToolController *)self _updateDebugPlayerTimeLabel];
    [(PUTrimToolController *)self _updateDebugTrimToolStateLabel];
    [(PUTrimToolController *)self _updateDebugPlayheadStyleLabel];
  }
  [(PUTrimToolController *)self _updateScrubberContents];
  [(PUTrimToolController *)self _updatePlayheadStyle];
  [(PUTrimToolController *)self _updateScrubberPresentedPlayhead];
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(PUTrimToolController *)self compositionController];
  uint64_t v5 = [v4 adjustmentConstants];

  dispatch_time_t v6 = [v5 PITrimAdjustmentKey];
  if ([v10 containsObject:v6]) {
    goto LABEL_4;
  }
  id v7 = [v5 PILivePhotoKeyFrameAdjustmentKey];
  if ([v10 containsObject:v7])
  {

LABEL_4:
LABEL_5:
    [(PUTrimToolController *)self _updateScrubberTimes];
    goto LABEL_6;
  }
  uint64_t v8 = [v5 PISlomoAdjustmentKey];
  char v9 = [v10 containsObject:v8];

  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
}

- (PUTrimToolController)initWithPlayerWrapper:(id)a3 playButtonEnabled:(BOOL)a4 slomoEnabled:(BOOL)a5 portraitVideoEnabled:(BOOL)a6
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUTrimToolController;
  double v12 = [(PUTrimToolController *)&v19 initWithNibName:0 bundle:0];
  double v13 = v12;
  if (v12)
  {
    v12->_playButtonEnabled = a4;
    objc_storeStrong((id *)&v12->_playerWrapper, a3);
    v13->_slomoEnabled = a5;
    v13->_isPortraitVideo = a6;
    v13->_currentlyInteractingElement = 0;
    uint64_t v14 = [MEMORY[0x1E4F8A220] setCoalescerWithLabel:@"PUTrimToolController._updateVideoCoalescer" target:v13 queue:MEMORY[0x1E4F14428] action:&__block_literal_global_96581];
    updateVideoCoalescer = v13->_updateVideoCoalescer;
    v13->_updateVideoCoalescer = (PFCoalescer *)v14;

    [(PUTrimToolController *)v13 px_enableExtendedTraitCollection];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v17 = (id)[(PUTrimToolController *)v13 registerForTraitChanges:v16 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v13;
}

void __98__PUTrimToolController_initWithPlayerWrapper_playButtonEnabled_slomoEnabled_portraitVideoEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  [a4 delayNextInvocationByTimeInterval:0.5];
  [v5 _updateVideo];
}

@end