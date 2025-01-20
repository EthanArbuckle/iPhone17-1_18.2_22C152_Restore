@interface RCRecordingViewController
- (BOOL)_compactDisplayStyle;
- (BOOL)_supportsTimelineGeneration;
- (BOOL)accessibilityPerformEscape;
- (BOOL)hasShareableComposition;
- (BOOL)isDisplayingTranscriptView;
- (BOOL)isLockScreenController;
- (BOOL)isRecording;
- (BOOL)isSilencing;
- (BOOL)recordingTitleHasBeenEdited;
- (BOOL)supportsAppEntityInteraction;
- (BOOL)willRecordIntoTrackTwo;
- (Class)_viewClass;
- (NSMutableDictionary)editingStatusDict;
- (NSString)UUID;
- (RCAVWaveformViewController)overviewWaveformViewController;
- (RCComposition)composition;
- (RCDebugOverlay)alwaysOnDebugOverlay;
- (RCElapsedRecordingTimeInfo)elapsedRecordingTimeInfo;
- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate;
- (RCTimeController)activeTimeController;
- (RCTimelineGenerator)timelineGenerator;
- (RCToolBarController)toolBarController;
- (RCWaveformContainerArray)waveformContainerViewControllers;
- (RCWaveformDataSource)waveformDataSource;
- (UIInteraction)entityInteraction;
- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription;
- (_TtC10VoiceMemos25TranscriptViewCoordinator)transcriptViewCoordinator;
- (_TtC10VoiceMemos30RCRecordingTrackInfoRepository)trackInfoRepository;
- (_TtP10VoiceMemos18TrackIndexSettable_)multipleWaveformsViewController;
- (id)_timelinesForDateInterval:(id)a3;
- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4 isCompact:(BOOL)a5 waveformOnly:(BOOL)a6;
- (int64_t)preferredStatusBarStyle;
- (int64_t)recordingControlState;
- (unint64_t)_trackIndexForCurrentTrackState;
- (void)_beginFileTranscriptionIfNeeded;
- (void)_clearTranscriptView;
- (void)_configureTranscriptViewForLiveTranscription:(id)a3;
- (void)_configureWaveformViewWithDataSource:(id)a3;
- (void)_configureWaveformViewWithDataSources:(id)a3 secondTrackDataSource:(id)a4 overviewDataSource:(id)a5;
- (void)_registerForSceneStateChanges:(id)a3;
- (void)_reset;
- (void)_sceneDidEnterBackgroundNotification:(id)a3;
- (void)_sceneWillEnterForegroundNotification:(id)a3;
- (void)_setupTranscriptViewDependenciesIfNeeded;
- (void)_styleView;
- (void)_syncEditingInFlight;
- (void)_syncWaveformCompactness;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateRecordButtonViewState:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)actionActivated:(int64_t)a3;
- (void)audioWaveformControllerDidChangeAVTimes:(id)a3;
- (void)cleanupAfterDismiss;
- (void)cleanupAfterExitTrim;
- (void)collapseTranscriptView;
- (void)copyDataSourcesFromRecordingViewController:(id)a3;
- (void)didUpdateRecordingCenterContentViewState;
- (void)didUpdateRecordingViewDisplayStyle;
- (void)didUpdateRecordingViewState;
- (void)expandTranscriptView;
- (void)handleCancel;
- (void)handleDeleteForUUID:(id)a3;
- (void)handleDone;
- (void)handleRemovalOfUUID:(id)a3;
- (void)loadView;
- (void)performAction:(int64_t)a3 atPosition:(double)a4 source:(id)a5;
- (void)performRenameWithNewTitle:(id)a3;
- (void)prepareForPresent:(BOOL)a3;
- (void)recordingViewWidthDidChange:(double)a3;
- (void)registerAppEntityInteraction;
- (void)reloadWaveformsFromComposition:(id)a3;
- (void)removeAppEntityInteraction;
- (void)renameForUUID:(id)a3 toNewTitle:(id)a4;
- (void)reset;
- (void)restyle;
- (void)setActiveTimeController:(id)a3;
- (void)setAlwaysOnDebugOverlay:(id)a3;
- (void)setComposition:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setEditingStatusDict:(id)a3;
- (void)setElapsedRecordingTimeInfo:(id)a3;
- (void)setEntityInteraction:(id)a3;
- (void)setInPointToCurrentTime;
- (void)setLiveTranscription:(id)a3;
- (void)setMultipleWaveformsViewController:(id)a3;
- (void)setOutPointToCurrentTime;
- (void)setOverviewWaveformViewController:(id)a3;
- (void)setRecordingViewControllerDelegate:(id)a3;
- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setTimelineGenerator:(id)a3;
- (void)setToolBarController:(id)a3;
- (void)setTrackInfoRepository:(id)a3;
- (void)setTranscriptViewCoordinator:(id)a3;
- (void)setUUID:(id)a3;
- (void)setWaveformContainerViewControllers:(id)a3;
- (void)showIdleForUUID:(id)a3;
- (void)showPlayingForUUID:(id)a3;
- (void)startEditWithComposition:(id)a3 displayModel:(id)a4;
- (void)stopScrolling;
- (void)toggleTranscriptView;
- (void)trackInfoStateDidChangeWithOldState:(unint64_t)a3 newState:(unint64_t)a4;
- (void)updateAfterRecordingWithRecordingModel:(id)a3;
- (void)updateCurrentTimeForUUID:(id)a3 toTime:(double)a4;
- (void)updateCurrentTrackTimeRange;
- (void)updateForRecordingAppend;
- (void)updateForRecordingEnd:(BOOL)a3;
- (void)updateForRecordingPause;
- (void)updateForRecordingPauseAtEnd;
- (void)updateForRecordingReplace;
- (void)updateForRecordingStart:(BOOL)a3;
- (void)updateForSizeChange;
- (void)updateForTrimMode;
- (void)updateToEditingInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5;
- (void)updateTrimSaveState:(BOOL)a3;
- (void)updateUndoState:(BOOL)a3 isNewRecording:(BOOL)a4;
- (void)updateWithPlaybackSettings:(id)a3;
- (void)updateWithRecordingModel:(id)a3;
- (void)updateWithRecordingModel:(id)a3 requireMatchingUUID:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willUpdateRecordingCenterContentViewState:(int64_t)a3;
- (void)willUpdateRecordingViewTranscriptState:(int64_t)a3;
@end

@implementation RCRecordingViewController

- (BOOL)supportsAppEntityInteraction
{
  v2 = [(RCRecordingViewController *)self view];
  unint64_t v3 = (unint64_t)[v2 displayStyle];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  [(RCRecordingViewController *)&v4 viewDidLayoutSubviews];
  if (RCSupportsDebugAODOverlay())
  {
    alwaysOnDebugOverlay = self->_alwaysOnDebugOverlay;
    if (alwaysOnDebugOverlay) {
      [(RCDebugOverlay *)alwaysOnDebugOverlay needsUpdateForBoundsChange];
    }
  }
}

- (void)_styleView
{
  unint64_t v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v4 = [v3 playbackCardHasInsets];

  id v5 = [(RCRecordingViewController *)self view];
  [v5 setClipsToBounds:v4];
}

- (void)_registerForSceneStateChanges:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_sceneWillEnterForegroundNotification:" name:UISceneWillEnterForegroundNotification object:v4];
    [v5 addObserver:self selector:"_sceneDidEnterBackgroundNotification:" name:UISceneDidEnterBackgroundNotification object:v4];
  }
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  [(RCRecordingViewController *)&v4 loadView];
  [(RCRecordingViewController *)self _viewClass];
  unint64_t v3 = objc_opt_new();
  [(RCRecordingViewController *)self setView:v3];
  [v3 setViewDelegate:self];
  [(RCRecordingViewController *)self _styleView];
  [(RCRecordingViewController *)self _classSpecificLoadView];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCRecordingViewController;
  [(RCRecordingViewController *)&v8 viewIsAppearing:a3];
  objc_super v4 = [(RCRecordingViewController *)self view];
  id v5 = [v4 window];
  v6 = [v5 windowScene];
  [(RCRecordingViewController *)self _registerForSceneStateChanges:v6];

  v7 = [(RCRecordingViewController *)self transcriptViewCoordinator];
  [v7 windowSceneWillEnterForeground];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)RCRecordingViewController;
  [(RCRecordingViewController *)&v14 viewDidLoad];
  [(RCRecordingViewController *)self _setupTranscriptViewDependenciesIfNeeded];
  unint64_t v3 = +[TranscriptionAvailabilityProvider shared];
  [v3 registerObserver:self];

  objc_super v4 = [RCDebugOverlay alloc];
  id v5 = [(RCRecordingViewController *)self view];
  v6 = [(RCDebugOverlay *)v4 initWithParentView:v5 shouldObserveChanges:1];
  alwaysOnDebugOverlay = self->_alwaysOnDebugOverlay;
  self->_alwaysOnDebugOverlay = v6;

  objc_super v8 = self;
  v15 = v8;
  v9 = +[NSArray arrayWithObjects:&v15 count:1];
  id v10 = [(RCRecordingViewController *)self registerForTraitChanges:v9 withAction:"_traitCollectionDidChange:previousTraitCollection:"];

  v11 = (RCWaveformContainerArray *)objc_opt_new();
  waveformContainerViewControllers = self->_waveformContainerViewControllers;
  self->_waveformContainerViewControllers = v11;

  v13 = +[RCRecordingTrackInfoRepository repositoryWithObserver:self];
  [(RCRecordingViewController *)self setTrackInfoRepository:v13];
}

- (void)_setupTranscriptViewDependenciesIfNeeded
{
  unint64_t v3 = +[TranscriptionAvailabilityProvider shared];
  unsigned int v4 = [v3 deviceIsSupported];

  if (v4)
  {
    id v5 = [(RCRecordingViewController *)self transcriptViewCoordinator];

    if (!v5)
    {
      v6 = objc_alloc_init(_TtC10VoiceMemos25TranscriptViewCoordinator);
      [(RCRecordingViewController *)self setTranscriptViewCoordinator:v6];

      v7 = [(RCRecordingViewController *)self transcriptViewCoordinator];
      [v7 setTranscriptViewHost:self];

      objc_super v8 = [(RCRecordingViewController *)self transcriptViewCoordinator];
      v9 = [v8 transcriptView];
      id v10 = [(RCRecordingViewController *)self view];
      [v10 setTranscriptView:v9];

      v11 = [(RCRecordingViewController *)self transcriptViewCoordinator];
      v12 = [(RCRecordingViewController *)self view];
      [v12 bounds];
      [v11 didChangeHostViewWidth:v13];

      objc_super v14 = [(RCRecordingViewController *)self view];
      v15 = [v14 window];
      id v17 = [v15 windowScene];

      if ([v17 activationState] == (id)1 || !objc_msgSend(v17, "activationState"))
      {
        v16 = [(RCRecordingViewController *)self transcriptViewCoordinator];
        [v16 windowSceneWillEnterForeground];
      }
    }
  }
}

- (_TtC10VoiceMemos25TranscriptViewCoordinator)transcriptViewCoordinator
{
  return self->_transcriptViewCoordinator;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  [(RCRecordingViewController *)&v4 viewDidAppear:a3];
  if ([(RCRecordingViewController *)self supportsAppEntityInteraction]) {
    [(RCRecordingViewController *)self registerAppEntityInteraction];
  }
}

- (void)setTranscriptViewCoordinator:(id)a3
{
}

- (void)setRecordingViewControllerDelegate:(id)a3
{
}

- (void)recordingViewWidthDidChange:(double)a3
{
  id v4 = [(RCRecordingViewController *)self transcriptViewCoordinator];
  [v4 didChangeHostViewWidth:a3];
}

- (Class)_viewClass
{
  return (Class)objc_opt_class();
}

- (void)setActiveTimeController:(id)a3
{
  p_activeTimeController = &self->_activeTimeController;
  id v8 = a3;
  id v5 = objc_storeWeak((id *)p_activeTimeController, v8);
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setActiveTimeController:v8];

  id WeakRetained = objc_loadWeakRetained((id *)p_activeTimeController);
  [(RCAVWaveformViewController *)self->_overviewWaveformViewController setActiveTimeController:WeakRetained];

  id v7 = objc_loadWeakRetained((id *)p_activeTimeController);
  [(TranscriptViewCoordinator *)self->_transcriptViewCoordinator setTimeController:v7];
}

- (void)setLiveTranscription:(id)a3
{
  p_liveTranscription = &self->_liveTranscription;
  id v5 = a3;
  objc_storeWeak((id *)p_liveTranscription, v5);
  [(RCRecordingViewController *)self _configureTranscriptViewForLiveTranscription:v5];
}

- (RCWaveformDataSource)waveformDataSource
{
  v2 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:0];
  unint64_t v3 = [v2 waveformDataSource];

  return (RCWaveformDataSource *)v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RCRecordingViewController;
  id v7 = a4;
  -[RCRecordingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007E128;
  v8[3] = &unk_100221960;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecordingViewController;
  [(RCRecordingViewController *)&v4 viewWillDisappear:a3];
  [(RCRecordingViewController *)self removeAppEntityInteraction];
}

- (void)_sceneWillEnterForegroundNotification:(id)a3
{
  id v3 = [(RCRecordingViewController *)self transcriptViewCoordinator];
  [v3 windowSceneWillEnterForeground];
}

- (void)_sceneDidEnterBackgroundNotification:(id)a3
{
  id v3 = [(RCRecordingViewController *)self transcriptViewCoordinator];
  [v3 windowSceneDidEnterBackground];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v16 = a4;
  id v5 = [(RCRecordingViewController *)self traitCollection];
  id v6 = [v5 isInAndromeda];

  if ([(RCRecordingViewController *)self _supportsTimelineGeneration]
    && v6 != [v16 isInAndromeda])
  {
    if (v6)
    {
      id v7 = [RCTimelineGenerator alloc];
      id v8 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      objc_super v9 = [v8 recordingStartTimeInfo];
      id v10 = [(RCRecordingViewController *)self elapsedRecordingTimeInfo];
      v11 = [(RCTimelineGenerator *)v7 initWithRecordingStartTimeInfo:v9 elapsedRecordingTimeInfo:v10];
      [(RCRecordingViewController *)self setTimelineGenerator:v11];

      [(RCRecordingViewController *)self setOverrideUserInterfaceStyle:2];
      if (RCSupportsDebugAODOverlay()) {
        [(RCDebugOverlay *)self->_alwaysOnDebugOverlay addToParentView];
      }
    }
    else
    {
      [(RCRecordingViewController *)self setTimelineGenerator:0];
      [(RCRecordingViewController *)self setOverrideUserInterfaceStyle:0];
      if (RCSupportsDebugAODOverlay()) {
        [(RCDebugOverlay *)self->_alwaysOnDebugOverlay removeFromParentView];
      }
    }
    [(RCRecordingViewController *)self updateTraitsIfNeeded];
    [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setBlurred:v6];
    uint64_t v12 = v6 & [(RCRecordingViewController *)self isRecording];
    double v13 = [(RCRecordingViewController *)self view];
    [v13 setShouldHideSubseconds:v12];

    objc_super v14 = [(RCRecordingViewController *)self view];
    [v14 setForceDisableRecordingControl:v6];

    v15 = [(RCRecordingViewController *)self view];
    [v15 restyle];

    [(RCRecordingViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return [(RCRecordingViewController *)self overrideUserInterfaceStyle] == (id)2;
}

- (BOOL)_supportsTimelineGeneration
{
  return 1;
}

- (void)restyle
{
  id v3 = [(RCRecordingViewController *)self viewIfLoaded];

  if (v3)
  {
    objc_super v4 = [(RCRecordingViewController *)self overviewWaveformViewController];

    if (v4)
    {
      id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
      unsigned int v6 = [v5 shouldShowOverviewWaveform];

      id v7 = [(RCRecordingViewController *)self overviewWaveformViewController];
      id v8 = [v7 view];
      objc_super v9 = [(RCRecordingViewController *)self view];
      id v10 = v9;
      if (v6) {
        [v9 setFixedOverviewWaveformView:v8];
      }
      else {
        [v9 setTrimOverviewWaveformView:v8];
      }
    }
    [(RCRecordingViewController *)self _styleView];
    id v11 = [(RCRecordingViewController *)self view];
    [v11 restyle];
  }
}

- (void)_reset
{
  id v3 = [(RCRecordingViewController *)self view];
  [v3 reset];

  [(RCRecordingViewController *)self _configureWaveformViewWithDataSource:0];
  [(RCRecordingViewController *)self _clearTranscriptView];

  [(RCRecordingViewController *)self updateWithRecordingModel:0];
}

- (int64_t)recordingControlState
{
  v2 = [(RCRecordingViewController *)self view];
  id v3 = [v2 recordingControlState];

  return (int64_t)v3;
}

- (void)actionActivated:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v8 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      unint64_t v5 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unsigned int v6 = v8;
      uint64_t v7 = 3;
      goto LABEL_7;
    case 2:
      id v8 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      unint64_t v5 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unsigned int v6 = v8;
      uint64_t v7 = 5;
      goto LABEL_7;
    case 3:
      id v8 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      unint64_t v5 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unsigned int v6 = v8;
      uint64_t v7 = 4;
      goto LABEL_7;
    case 4:
      id v8 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      unint64_t v5 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unsigned int v6 = v8;
      uint64_t v7 = 7;
      goto LABEL_7;
    case 5:
      id v8 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      unint64_t v5 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unsigned int v6 = v8;
      uint64_t v7 = 6;
LABEL_7:
      [v6 performAction:v7 atPosition:0 forUUID:0 sourceController:0 source:v5 trackIndex:0.0];

      break;
    default:
      return;
  }
}

- (void)updateForRecordingStart:(BOOL)a3
{
  BOOL v3 = a3;
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers resetZoomScale];
  id v6 = [(RCRecordingViewController *)self view];
  unint64_t v5 = [(RCRecordingViewController *)self view];
  [v5 setShouldSaveAsNew:v3];

  [v6 updateForRecordingStart];
}

- (void)_updateRecordButtonViewState:(id)a3
{
  id v4 = a3;
  id v7 = [(RCRecordingViewController *)self view];
  [v4 currentTime];
  double v6 = v5;

  [v7 updateRecordButtonViewStateWithCurrentTime:v6];
}

- (void)updateForRecordingPause
{
  BOOL v3 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:[(RCRecordingViewController *)self _trackIndexForCurrentTrackState]];
  [(RCRecordingViewController *)self _updateRecordButtonViewState:v3];

  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setIsEditMode:1];
  id v4 = [(RCRecordingViewController *)self overviewWaveformViewController];
  [v4 setIsEditMode:1];
}

- (void)updateForRecordingPauseAtEnd
{
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setIsEditMode:1];
  id v3 = [(RCRecordingViewController *)self overviewWaveformViewController];
  [v3 setIsEditMode:1];
}

- (void)updateForRecordingAppend
{
  id v3 = [(RCRecordingViewController *)self view];
  [v3 setRecordingViewState:6];

  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setIsEditMode:1];
  id v4 = [(RCRecordingViewController *)self overviewWaveformViewController];
  [v4 setIsEditMode:1];
}

- (void)updateForRecordingReplace
{
  id v3 = [(RCRecordingViewController *)self view];
  [v3 setRecordingViewState:7];

  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setIsEditMode:1];
  id v4 = [(RCRecordingViewController *)self overviewWaveformViewController];
  [v4 setIsEditMode:1];
}

- (void)updateForTrimMode
{
  id v2 = [(RCRecordingViewController *)self view];
  [v2 setRecordingViewState:8];
}

- (void)updateForRecordingEnd:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(RCRecordingViewController *)self view];
  [v5 updateForRecordingEnd:v3];

  double v6 = [(RCRecordingViewController *)self view];
  id v7 = [v6 displayStyle];

  if (v7 == (id)1)
  {
    [(RCWaveformContainerArray *)self->_waveformContainerViewControllers setCurrentTime:0.0];
    id v8 = [(RCRecordingViewController *)self view];
    [v8 setCurrentTime:0.0];

    [(RCRecordingViewController *)self _reset];
  }
  else
  {
    objc_super v9 = [(RCRecordingViewController *)self overviewWaveformViewController];
    [v9 setIsEditMode:1];

    waveformContainerViewControllers = self->_waveformContainerViewControllers;
    [(RCWaveformContainerArray *)waveformContainerViewControllers setIsEditMode:1];
  }
}

- (void)updateUndoState:(BOOL)a3 isNewRecording:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(RCRecordingViewController *)self view];
  [v6 undoStateChanged:v5 isNewRecording:v4];
}

- (void)updateTrimSaveState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCRecordingViewController *)self view];
  [v4 trimSaveStateChanged:v3];
}

- (void)prepareForPresent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCRecordingViewController *)self view];
  [v4 prepareForPresent:v3];
}

- (void)updateForSizeChange
{
  id v2 = [(RCRecordingViewController *)self view];
  [v2 updateForSizeChange];
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  -[RCWaveformContainerArray setSelectedTimeRange:animationDuration:](self->_waveformContainerViewControllers, "setSelectedTimeRange:animationDuration:");
  id v8 = [(RCRecordingViewController *)self overviewWaveformViewController];
  [v8 setSelectedTimeRange:var0 animationDuration:var1];
}

- (void)setInPointToCurrentTime
{
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers currentTime];
  double v4 = v3;
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers selectedTimeRange];
  if (v4 > v6 || v5 == v6) {
    double v6 = -1.0;
  }

  -[RCRecordingViewController setSelectedTimeRange:animationDuration:](self, "setSelectedTimeRange:animationDuration:", v4, v6, 0.0);
}

- (void)setOutPointToCurrentTime
{
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers currentTime];
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers selectedTimeRange];
  if (v3 != v4)
  {
    -[RCRecordingViewController setSelectedTimeRange:animationDuration:](self, "setSelectedTimeRange:animationDuration:");
  }
}

- (void)toggleTranscriptView
{
  double v3 = [(RCRecordingViewController *)self view];
  BOOL v4 = [v3 centerContentViewState] == 0;

  double v5 = [(RCRecordingViewController *)self view];
  [v5 setCenterContentViewState:v4];

  [(RCRecordingViewController *)self _didToggleTranscriptView];
}

- (void)_beginFileTranscriptionIfNeeded
{
  uint64_t v3 = [(RCRecordingViewController *)self UUID];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    unsigned int v5 = [(RCRecordingViewController *)self isDisplayingTranscriptView];

    if (v5)
    {
      unsigned int v6 = [(RCRecordingViewController *)self isRecording];
      id v7 = [(RCRecordingViewController *)self transcriptViewCoordinator];
      unsigned int v8 = [v7 isPerformingLiveTranscription];

      objc_super v9 = [(RCRecordingViewController *)self transcriptViewCoordinator];
      id v10 = [(RCRecordingViewController *)self UUID];
      unsigned int v11 = [v9 isProcessingOrDisplayingFileTranscriptionForUUID:v10];

      uint64_t v12 = [(RCRecordingViewController *)self composition];
      if (v12)
      {
        double v13 = [(RCRecordingViewController *)self composition];
        objc_super v14 = [v13 decomposedFragments];
        BOOL v15 = [v14 count] == 0;
      }
      else
      {
        BOOL v15 = 1;
      }

      if ((v6 | v8 | v11) != 1 && v15)
      {
        id v17 = [(RCRecordingViewController *)self transcriptViewCoordinator];
        id v16 = [(RCRecordingViewController *)self UUID];
        [v17 beginFileTranscriptionForRecordingUUID:v16];
      }
    }
  }
}

- (BOOL)isDisplayingTranscriptView
{
  id v2 = [(RCRecordingViewController *)self view];
  BOOL v3 = [v2 centerContentViewState] == (id)1;

  return v3;
}

- (void)showPlayingForUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RCRecordingViewController *)self UUID];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [(RCRecordingViewController *)self view];
    [v7 setPlayControlState:1];
  }
}

- (void)showIdleForUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RCRecordingViewController *)self UUID];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [(RCRecordingViewController *)self view];
    [v7 setPlayControlState:0];
  }
}

- (void)renameForUUID:(id)a3 toNewTitle:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(RCRecordingViewController *)self UUID];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    objc_super v9 = [(RCRecordingViewController *)self view];
    [v9 setRecordingTitle:v10];
  }
}

- (void)handleDeleteForUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RCRecordingViewController *)self UUID];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(RCRecordingViewController *)self _reset];
  }
}

- (void)updateCurrentTimeForUUID:(id)a3 toTime:(double)a4
{
  id v6 = a3;
  id v7 = [(RCRecordingViewController *)self UUID];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = [(RCRecordingViewController *)self view];
    [v9 setCurrentTime:a4];
  }
}

- (void)updateToEditingInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5
{
  BOOL v6 = a3;
  id v16 = a5;
  unsigned int v8 = [(RCRecordingViewController *)self editingStatusDict];

  if (!v8)
  {
    id v9 = objc_opt_new();
    [(RCRecordingViewController *)self setEditingStatusDict:v9];
  }
  id v10 = [(RCRecordingViewController *)self editingStatusDict];
  unsigned int v11 = v10;
  if (v6)
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:v16];

    if (!v12) {
      uint64_t v12 = objc_opt_new();
    }
    *(float *)&double v13 = a4;
    objc_super v14 = +[NSNumber numberWithFloat:v13];
    [v12 setProgress:v14];

    BOOL v15 = [(RCRecordingViewController *)self editingStatusDict];
    [v15 setObject:v12 forKeyedSubscript:v16];

    unsigned int v11 = v12;
  }
  else
  {
    [v10 setObject:0 forKeyedSubscript:v16];
  }

  [(RCRecordingViewController *)self _syncEditingInFlight];
}

- (void)_syncEditingInFlight
{
  BOOL v3 = [(RCRecordingViewController *)self editingStatusDict];
  id v4 = [(RCRecordingViewController *)self UUID];
  id v10 = [v3 objectForKeyedSubscript:v4];

  unsigned int v5 = [(RCRecordingViewController *)self view];
  if (v10)
  {
    [v5 setEditingInFlight:1];

    unsigned int v5 = [v10 progress];
    [v5 floatValue];
    int v7 = v6;
    unsigned int v8 = [(RCRecordingViewController *)self view];
    LODWORD(v9) = v7;
    [v8 setEditingProgress:v9];
  }
  else
  {
    [v5 setEditingInFlight:0];
  }
}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 source:(id)a5
{
  id v8 = a5;
  [(RCRecordingViewController *)self stopScrolling];
  id v10 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  double v9 = [(RCRecordingViewController *)self UUID];
  [v10 performAction:a3 atPosition:v9 forUUID:self sourceController:v8 source:[self _trackIndexForCurrentTrackState] trackIndex:a4];
}

- (void)performRenameWithNewTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  unsigned int v5 = [(RCRecordingViewController *)self UUID];
  [v6 performRenameWithNewTitle:v4 forUUID:v5];
}

- (void)updateAfterRecordingWithRecordingModel:(id)a3
{
  id v8 = a3;
  id v4 = [(RCRecordingViewController *)self view];
  if ([v4 recordingViewState] == (id)1)
  {
  }
  else
  {
    unsigned int v5 = [(RCRecordingViewController *)self view];
    id v6 = [v5 displayStyle];

    int v7 = v8;
    if (v6 != (id)3) {
      goto LABEL_5;
    }
  }
  [(RCRecordingViewController *)self updateWithRecordingModel:v8];
  int v7 = v8;
LABEL_5:
}

- (void)updateWithRecordingModel:(id)a3
{
}

- (void)updateWithRecordingModel:(id)a3 requireMatchingUUID:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if (!v4
    || ([v13 UUID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(RCRecordingViewController *)self UUID],
        int v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v6 isEqualToString:v7],
        v7,
        v6,
        v8))
  {
    double v9 = [v13 UUID];
    [(RCRecordingViewController *)self setUUID:v9];

    id v10 = [(RCRecordingViewController *)self view];
    unsigned int v11 = [v13 title];
    [v10 setRecordingTitle:v11];

    [v13 duration];
    [v10 setRecordingDuration:];
    uint64_t v12 = [v13 creationDate];
    [v10 setCreationDate:v12];

    [v10 setHasTranscription:[v13 hasTranscription]];
  }
}

- (void)updateWithPlaybackSettings:(id)a3
{
  id v10 = a3;
  id v4 = [v10 hasCustomizedPlaybackSettings];
  unsigned int v5 = [(RCRecordingViewController *)self view];
  [v5 setHasCustomizedPlaybackSettings:v4];

  [v10 layerMix];
  if (v6 == -1.0)
  {
    trackInfoRepository = self->_trackInfoRepository;
    uint64_t v8 = 1;
LABEL_5:
    [(RCRecordingTrackInfoRepository *)trackInfoRepository setMutedTrackIndexWithMutedIndex:v8];
    goto LABEL_6;
  }
  [v10 layerMix];
  trackInfoRepository = self->_trackInfoRepository;
  if (v9 == 1.0)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  [(RCRecordingTrackInfoRepository *)trackInfoRepository clearMutedTrackIndex];
LABEL_6:
}

- (void)setCurrentTime:(double)a3
{
  id v4 = [(RCRecordingViewController *)self view];
  [v4 setCurrentTime:a3];
}

- (void)reloadWaveformsFromComposition:(id)a3
{
  id v9 = a3;
  [(RCRecordingViewController *)self setComposition:v9];
  id v4 = [v9 hasMultipleTracks];
  unsigned int v5 = [(RCRecordingViewController *)self view];
  [v5 setHasMultipleTracks:v4];

  LODWORD(v5) = [v9 hasMultipleTracks];
  id v6 = [objc_alloc((Class)RCCompositionWaveformDataSource) initWithComposition:v9 trackIndex:0];
  if (v5)
  {
    id v7 = [objc_alloc((Class)RCCompositionWaveformDataSource) initWithComposition:v9 trackIndex:1];
    id v8 = [objc_alloc((Class)RCCompositionWaveformDataSource) initWithComposition:v9 trackIndex:-1];
    [(RCRecordingViewController *)self _configureWaveformViewWithDataSources:v6 secondTrackDataSource:v7 overviewDataSource:v8];
  }
  else
  {
    [(RCRecordingViewController *)self _configureWaveformViewWithDataSource:v6];
  }
}

- (void)startEditWithComposition:(id)a3 displayModel:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  [(RCRecordingViewController *)self setComposition:v18];
  if ([v18 hasMultipleTracks]
    && ([(RCRecordingViewController *)self trackInfoRepository],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 state],
        v7,
        !v8))
  {
    id v9 = [(RCRecordingViewController *)self trackInfoRepository];
    id v10 = v9;
    uint64_t v11 = 1;
  }
  else
  {
    if ([v18 hasMultipleTracks]) {
      goto LABEL_7;
    }
    id v9 = [(RCRecordingViewController *)self trackInfoRepository];
    id v10 = v9;
    uint64_t v11 = 0;
  }
  [v9 setState:v11];

LABEL_7:
  [(RCRecordingViewController *)self updateCurrentTrackTimeRange];
  uint64_t v12 = [(RCRecordingViewController *)self view];
  [v12 updateForEditingStart];

  [(RCRecordingViewController *)self reloadWaveformsFromComposition:v18];
  waveformContainerViewControllers = self->_waveformContainerViewControllers;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [(RCWaveformContainerArray *)waveformContainerViewControllers setActiveTimeController:WeakRetained];

  BOOL v15 = [(RCRecordingViewController *)self overviewWaveformViewController];
  id v16 = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [v15 setActiveTimeController:v16];

  [(RCRecordingViewController *)self updateWithRecordingModel:v6];
  id v17 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:[(RCRecordingViewController *)self _trackIndexForCurrentTrackState]];
  [(RCRecordingViewController *)self audioWaveformControllerDidChangeAVTimes:v17];

  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers resetZoomScale];
  [(RCRecordingViewController *)self _beginFileTranscriptionIfNeeded];
}

- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4 isCompact:(BOOL)a5 waveformOnly:(BOOL)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v9 = a6;
  id v10 = a3;
  uint64_t v11 = [[RCAVWaveformViewController alloc] initWithWaveformDataSource:v10 displayStyle:v9 isOverview:v7 isCompact:v6 delegate:self];

  uint64_t v12 = [(RCAVWaveformViewController *)v11 waveformViewController];
  [v12 setIsOverview:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [(RCAVWaveformViewController *)v11 setActiveTimeController:WeakRetained];

  return v11;
}

- (void)_configureWaveformViewWithDataSources:(id)a3 secondTrackDataSource:(id)a4 overviewDataSource:(id)a5
{
  unint64_t v57 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = a5;
  if (self->_multipleWaveformsViewController) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = (v57 | v8) == 0;
  }
  if (!v10)
  {
    waveformContainerViewControllers = self->_waveformContainerViewControllers;
    v29 = [(RCRecordingViewController *)self trackInfoRepository];
    v30 = +[RCMultipleWaveformsViewController viewControllerWithWaveformContainers:waveformContainerViewControllers trackInfoRepository:v29];
    multipleWaveformsViewController = self->_multipleWaveformsViewController;
    self->_multipleWaveformsViewController = v30;

    [(RCRecordingViewController *)self addChildViewController:self->_multipleWaveformsViewController];
    [(TrackIndexSettable *)self->_multipleWaveformsViewController didMoveToParentViewController:self];
    v32 = [(RCRecordingViewController *)self view];
    [v32 centerContentVerticalHuggingPriority];
    float v34 = v33 + -10.0;

    v35 = [(TrackIndexSettable *)self->_multipleWaveformsViewController view];
    *(float *)&double v36 = v34;
    [v35 setContentHuggingPriority:1 forAxis:v36];

    v37 = [(TrackIndexSettable *)self->_multipleWaveformsViewController view];
    *(float *)&double v38 = v34;
    [v37 setContentHuggingPriority:0 forAxis:v38];

    v39 = [(TrackIndexSettable *)self->_multipleWaveformsViewController view];
    v40 = [(RCRecordingViewController *)self view];
    [v40 setWaveformView:v39];
  }
  BOOL v11 = [(RCRecordingViewController *)self _compactDisplayStyle];
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers cancelLoadingWaveformDataSource];
  unint64_t v12 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers count];
  if (v57 && !v12)
  {
    id v13 = self->_waveformContainerViewControllers;
    objc_super v14 = [(RCRecordingViewController *)self createNewWaveformViewControllerWithDataSource:v57 isOverview:0 isCompact:v11 waveformOnly:0];
    [(RCWaveformContainerArray *)v13 addContainer:v14];
  }
  unint64_t v15 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers count];
  if (v8 && v15 == 1)
  {
    id v16 = self->_waveformContainerViewControllers;
    id v17 = [(RCRecordingViewController *)self createNewWaveformViewControllerWithDataSource:v8 isOverview:0 isCompact:v11 waveformOnly:1];
    [(RCWaveformContainerArray *)v16 addContainer:v17];
  }
  if ([(RCRecordingViewController *)self isRecording])
  {
    if ([(RCRecordingViewController *)self _trackIndexForCurrentTrackState])
    {
      unint64_t v18 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unint64_t v19 = v57;
      if (v18 != 1) {
        goto LABEL_25;
      }
      v20 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
      [v20 reloadWaveformDataSource:v8 withActiveTimeController:WeakRetained];
    }
    else
    {
      v41 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:0];
      id v42 = objc_loadWeakRetained((id *)&self->_activeTimeController);
      [v41 reloadWaveformDataSource:v57 withActiveTimeController:v42];

      unsigned int v43 = [(RCRecordingViewController *)self isSilencing];
      unint64_t v19 = v57;
      if (!v43) {
        goto LABEL_25;
      }
      id v44 = [(id)v57 copyWithTrackIndex:1 emptyCopy:1];
      v45 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:1];
      id v46 = objc_loadWeakRetained((id *)&self->_activeTimeController);
      [v45 reloadWaveformDataSource:v44 withActiveTimeController:v46];
    }
    goto LABEL_24;
  }
  v22 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:0];
  id v23 = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [v22 reloadWaveformDataSource:v57 withActiveTimeController:v23];

  v24 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:1];
  id v25 = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [v24 reloadWaveformDataSource:v8 withActiveTimeController:v25];

  unint64_t v26 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers count];
  if (!v8 && v26 == 2) {
    [(RCWaveformContainerArray *)self->_waveformContainerViewControllers removeContainerAtIndex:1];
  }
  unint64_t v27 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers count];
  unint64_t v19 = v57;
  if (!v57 && v27 == 1)
  {
    [(RCWaveformContainerArray *)self->_waveformContainerViewControllers removeContainerAtIndex:0];
LABEL_24:
    unint64_t v19 = v57;
  }
LABEL_25:
  if (!(v19 | v8))
  {
    v47 = [(RCRecordingViewController *)self trackInfoRepository];
    [v47 setState:0];
  }
  overviewWaveformViewController = self->_overviewWaveformViewController;
  if (!overviewWaveformViewController)
  {
    v49 = [(RCRecordingViewController *)self createNewWaveformViewControllerWithDataSource:v9 isOverview:1 isCompact:1 waveformOnly:0];
    [(RCRecordingViewController *)self setOverviewWaveformViewController:v49];
    [(RCRecordingViewController *)self addChildViewController:v49];
    [v49 didMoveToParentViewController:self];
    v50 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v51 = [v50 shouldShowOverviewWaveform];

    v52 = [v49 view];
    v53 = [(RCRecordingViewController *)self view];
    v54 = v53;
    if (v51) {
      [v53 setFixedOverviewWaveformView:v52];
    }
    else {
      [v53 setTrimOverviewWaveformView:v52];
    }

    overviewWaveformViewController = self->_overviewWaveformViewController;
  }
  id v55 = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [(RCAVWaveformViewController *)overviewWaveformViewController reloadWaveformDataSource:v9 withActiveTimeController:v55];

  v56 = [(RCAVWaveformViewController *)self->_overviewWaveformViewController waveformViewController];
  [v56 setIsOverview:1];

  [(RCRecordingViewController *)self _syncWaveformCompactness];
}

- (void)_configureWaveformViewWithDataSource:(id)a3
{
  id v8 = a3;
  if ([(RCRecordingViewController *)self isRecording])
  {
    unint64_t v4 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
    if (v4) {
      id v5 = 0;
    }
    else {
      id v5 = v8;
    }
    if (v4 == 1) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
    BOOL v7 = self;
  }
  else
  {
    BOOL v7 = self;
    id v5 = v8;
    id v6 = 0;
  }
  -[RCRecordingViewController _configureWaveformViewWithDataSources:secondTrackDataSource:overviewDataSource:](v7, "_configureWaveformViewWithDataSources:secondTrackDataSource:overviewDataSource:", v5, v6);
}

- (void)copyDataSourcesFromRecordingViewController:(id)a3
{
  id v4 = a3;
  id v12 = [v4 waveformContainerViewControllers];
  id v5 = [v12 objectAtIndexedSubscript:0];
  id v6 = [v5 waveformDataSource];
  BOOL v7 = [v4 waveformContainerViewControllers];
  id v8 = [v7 objectAtIndexedSubscript:1];
  id v9 = [v8 waveformDataSource];
  BOOL v10 = [v4 overviewWaveformViewController];

  BOOL v11 = [v10 waveformDataSource];
  [(RCRecordingViewController *)self _configureWaveformViewWithDataSources:v6 secondTrackDataSource:v9 overviewDataSource:v11];
}

- (BOOL)_compactDisplayStyle
{
  id v2 = [(RCRecordingViewController *)self view];
  id v3 = [v2 displayStyle];

  if (v3 != (id)1) {
    return v3 == (id)2;
  }
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v6 = [v5 supportsCompactRecordingCard];

  return v6;
}

- (void)_syncWaveformCompactness
{
  unsigned __int8 v3 = [(RCRecordingViewController *)self _compactDisplayStyle];
  id v4 = [(RCRecordingViewController *)self view];
  BOOL v5 = [v4 displayStyle] == (id)3;

  unsigned __int8 v6 = [(RCRecordingViewController *)self view];
  BOOL v7 = (char *)[v6 recordingViewState];

  if ((unint64_t)(v7 - 2) < 6) {
    unsigned __int8 v8 = v3;
  }
  else {
    unsigned __int8 v8 = 0;
  }
  id v9 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers waveformViewControllers];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000805F0;
  v12[3] = &unk_1002224E0;
  unsigned __int8 v13 = v8;
  unsigned __int8 v14 = v3;
  BOOL v15 = v5;
  [v9 enumerateObjectsUsingBlock:v12];

  if (v3) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = RCOverdubRecordingIsEnabled() ^ 1;
  }
  [(TrackIndexSettable *)self->_multipleWaveformsViewController setHideTrackSwitch:v10];
  BOOL v11 = [(RCRecordingViewController *)self isRecording]
     || [(RCRecordingViewController *)self isLockScreenController];
  [(TrackIndexSettable *)self->_multipleWaveformsViewController setDisableTrackSwitch:v11];
}

- (void)_configureTranscriptViewForLiveTranscription:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingViewController *)self transcriptViewCoordinator];
  [v5 beginLiveTranscription:v4];
}

- (void)_clearTranscriptView
{
  id v2 = [(RCRecordingViewController *)self transcriptViewCoordinator];
  [v2 clearData];
}

- (void)handleCancel
{
  unsigned __int8 v3 = [(RCRecordingViewController *)self view];
  id v4 = [v3 recordingViewState];

  if (v4 == (id)8)
  {
    id v5 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
    [v5 cancelTrimMode];
  }
}

- (void)cleanupAfterExitTrim
{
  unsigned __int8 v3 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers objectAtIndexedSubscript:[(RCRecordingViewController *)self _trackIndexForCurrentTrackState]];
  id v4 = [v3 activeTimeController];
  [v4 currentRate];
  float v6 = v5;

  BOOL v7 = [(RCRecordingViewController *)self view];
  unsigned __int8 v8 = v7;
  if (v6 <= 0.0) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  [v7 setRecordingViewState:v9];

  id v10 = [(RCRecordingViewController *)self view];
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers currentTime];
  [v10 updateRecordButtonViewStateWithCurrentTime:];
}

- (void)handleDone
{
  id v7 = [(RCRecordingViewController *)self view];
  unint64_t v3 = (unint64_t)[v7 recordingViewState];
  if (v3 > 8) {
    goto LABEL_7;
  }
  if (((1 << v3) & 0x3C) != 0)
  {
    id v4 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
    [v4 endEditing];
    goto LABEL_6;
  }
  if (((1 << v3) & 0xC2) != 0)
  {
    id v4 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
    [v4 performAction:4 atPosition:0 forUUID:0 sourceController:0 source:[self _trackIndexForCurrentTrackState] trackIndex:0.0];
LABEL_6:

LABEL_7:
    float v5 = [(RCRecordingViewController *)self trackInfoRepository];
    [v5 setState:0];

    goto LABEL_8;
  }
  if (v3 != 8) {
    goto LABEL_7;
  }
  float v6 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  [v6 exitTrimMode];

  [v7 setRecordingViewState:5];
  +[RCAnalyticsUtilities sendDidTrimVoiceMemo];
  [(RCWaveformContainerArray *)self->_waveformContainerViewControllers currentTime];
  [v7 updateRecordButtonViewStateWithCurrentTime:];
LABEL_8:
}

- (void)cleanupAfterDismiss
{
  [(RCRecordingViewController *)self _reset];
  id v3 = [(RCRecordingViewController *)self view];
  [v3 cleanupAfterDismiss];
}

- (void)reset
{
  id v2 = [(RCRecordingViewController *)self view];
  [v2 reset];
}

- (BOOL)recordingTitleHasBeenEdited
{
  id v3 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  id v4 = [(RCRecordingViewController *)self UUID];
  unsigned __int8 v5 = [v3 recordingTitleHasBeenEditedForUUID:v4];

  return v5;
}

- (BOOL)isRecording
{
  id v2 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  unsigned __int8 v3 = [v2 isRecording];

  return v3;
}

- (BOOL)isSilencing
{
  id v2 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  unsigned __int8 v3 = [v2 isSilencing];

  return v3;
}

- (BOOL)willRecordIntoTrackTwo
{
  unsigned __int8 v3 = [(RCRecordingViewController *)self trackInfoRepository];
  if ([v3 state] == (id)2)
  {
    id v4 = [(RCRecordingViewController *)self composition];
    unsigned int v5 = [v4 hasMultipleTracks] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)didUpdateRecordingViewState
{
  unsigned __int8 v3 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  [v3 didUpdateRecordingViewState];

  multipleWaveformsViewController = self->_multipleWaveformsViewController;
  id v5 = [(RCRecordingViewController *)self view];
  -[TrackIndexSettable recordingViewStateDidUpdate:](multipleWaveformsViewController, "recordingViewStateDidUpdate:", [v5 recordingViewState]);
}

- (void)didUpdateRecordingViewDisplayStyle
{
  if ([(RCRecordingViewController *)self isDisplayingTranscriptView])
  {
    unsigned __int8 v3 = [(RCRecordingViewController *)self view];
    id v4 = [v3 displayStyle];

    if (v4 != (id)3) {
      [(RCRecordingViewController *)self toggleTranscriptView];
    }
  }
  id v5 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  [v5 didUpdateRecordingViewDisplayStyle];
}

- (void)willUpdateRecordingCenterContentViewState:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(RCRecordingViewController *)self transcriptViewCoordinator];
    [v4 willDisplayTranscriptView];
  }
}

- (void)didUpdateRecordingCenterContentViewState
{
  uint64_t v3 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  [v3 didUpdateRecordingCenterContentViewState];

  id v4 = [(RCRecordingViewController *)self view];
  id v5 = [v4 centerContentViewState];

  if (v5 != (id)1)
  {
    id v6 = [(RCRecordingViewController *)self transcriptViewCoordinator];
    [v6 didDismissTranscriptView];
  }
}

- (void)willUpdateRecordingViewTranscriptState:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    id v3 = [(RCRecordingViewController *)self transcriptViewCoordinator];
    [v3 willExpandTranscriptView];
  }
  else
  {
    id v3 = [(RCRecordingViewController *)self transcriptViewCoordinator];
    [v3 willCollapseTranscriptView];
  }
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(RCRecordingViewController *)self view];
  if ([v3 displayStyle] == (id)2)
  {

    return 0;
  }
  id v4 = [(RCRecordingViewController *)self view];
  id v5 = [v4 recordingViewState];

  if (v5 == (id)1) {
    return 0;
  }
  [(RCRecordingViewController *)self handleDone];
  return 1;
}

- (void)stopScrolling
{
}

- (BOOL)isLockScreenController
{
  return 0;
}

- (void)expandTranscriptView
{
  id v2 = [(RCRecordingViewController *)self view];
  [v2 setTranscriptViewState:1];
}

- (void)collapseTranscriptView
{
  id v2 = [(RCRecordingViewController *)self view];
  [v2 setTranscriptViewState:0];
}

- (void)trackInfoStateDidChangeWithOldState:(unint64_t)a3 newState:(unint64_t)a4
{
  id v6 = [(RCRecordingViewController *)self view];
  [v6 updateTrackState:a4];

  if ([(RCRecordingViewController *)self willRecordIntoTrackTwo])
  {
    id v7 = [(RCRecordingViewController *)self activeTimeController];
    [v7 setTargetTime:0.0];
  }
  if (a4)
  {
    unint64_t v8 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
    uint64_t v9 = [(RCRecordingViewController *)self waveformContainerViewControllers];
    id v10 = [v9 objectAtIndexedSubscript:v8];
    BOOL v11 = [v10 waveformViewController];
    [v11 bounceWaveform];
  }
  [(RCRecordingViewController *)self updateCurrentTrackTimeRange];
  id v13 = [(RCRecordingViewController *)self view];
  id v12 = [(RCRecordingViewController *)self waveformContainerViewControllers];
  [v12 currentTime];
  [v13 updateRecordButtonViewStateWithCurrentTime:];
}

- (void)audioWaveformControllerDidChangeAVTimes:(id)a3
{
  id v4 = a3;
  id v5 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers waveformViewControllers];
  if ([v5 containsObject:v4])
  {
  }
  else
  {
    id v6 = [(RCRecordingViewController *)self overviewWaveformViewController];

    if (v6 != v4) {
      goto LABEL_27;
    }
  }
  if (byte_10026A800) {
    goto LABEL_27;
  }
  byte_10026A800 = 1;
  id v7 = [(RCRecordingViewController *)self view];
  id v8 = [v7 playControlState];

  unsigned __int8 v9 = [(RCRecordingViewController *)self isRecording];
  id v10 = [(RCRecordingViewController *)self view];
  id v11 = [v10 recordingViewState];

  id v12 = [(RCRecordingViewController *)self activeTimeController];
  id v13 = [(RCRecordingViewController *)self elapsedRecordingTimeInfo];

  if (!v13)
  {
    unsigned __int8 v14 = objc_alloc_init(RCElapsedRecordingTimeInfo);
    [(RCRecordingViewController *)self setElapsedRecordingTimeInfo:v14];
  }
  uint64_t v15 = mach_absolute_time();
  id v16 = [(RCRecordingViewController *)self elapsedRecordingTimeInfo];
  [v16 setMachElapsedRecordingTime:v15];

  [v12 currentTime];
  double v18 = v17;
  unint64_t v19 = [(RCRecordingViewController *)self elapsedRecordingTimeInfo];
  [v19 setElapsedRecordingTime:v18];

  [v12 currentDuration];
  double v21 = v20;
  v22 = [(RCRecordingViewController *)self view];
  [v22 setRecordingDuration:v21];

  [v12 currentTime];
  double v24 = v23;
  id v25 = [(RCRecordingViewController *)self view];
  [v25 setCurrentTime:v24];

  if (v8) {
    char v26 = 1;
  }
  else {
    char v26 = v9;
  }
  if ((v26 & 1) == 0 && v11)
  {
    [(RCRecordingViewController *)self _updateRecordButtonViewState:v4];
    unint64_t v27 = [(RCRecordingViewController *)self traitCollection];
    if ([v27 isInAndromeda])
    {
      v28 = [(RCRecordingViewController *)self timelineGenerator];

      if (v28)
      {
        v29 = [(RCRecordingViewController *)self view];
        v30 = [v29 window];
        v31 = [v30 windowScene];
        v32 = [v31 _backlightSceneEnvironment];
        [v32 invalidateAllTimelinesForReason:@"Recording Stopped"];

        float v33 = [(RCRecordingViewController *)self view];
        [v33 setShouldHideSubseconds:0];

        [(RCRecordingViewController *)self setTimelineGenerator:0];
      }
    }
    else
    {
    }
  }
  float v34 = [(RCRecordingViewController *)self view];
  if ([v34 recordingViewState] != (id)8)
  {

    goto LABEL_20;
  }
  [v4 selectedTimeRange];
  [v12 currentDuration];
  RCTimeRangeMake();
  char v35 = RCTimeRangeEqualToTimeRange();

  if (v35)
  {
LABEL_20:
    double v36 = [(RCRecordingViewController *)self view];
    v37 = v36;
    uint64_t v38 = 0;
    goto LABEL_21;
  }
  double v36 = [(RCRecordingViewController *)self view];
  v37 = v36;
  uint64_t v38 = 1;
LABEL_21:
  [v36 setTrimEnabled:v38];

  id v39 = [(RCRecordingViewController *)self overviewWaveformViewController];

  if (v39 == v4)
  {
    waveformContainerViewControllers = self->_waveformContainerViewControllers;
    [v4 selectedTimeRange];
    -[RCWaveformContainerArray setSelectedTimeRange:animationDuration:](waveformContainerViewControllers, "setSelectedTimeRange:animationDuration:");
  }
  else
  {
    v40 = [(RCRecordingViewController *)self overviewWaveformViewController];
    v41 = [v40 waveformViewController];
    unsigned int v42 = [v41 isSelectionOverlayCurrentlyTracking];

    if (v42) {
      [(RCRecordingViewController *)self stopScrolling];
    }
    unsigned int v43 = [(RCWaveformContainerArray *)self->_waveformContainerViewControllers waveformViewControllers];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000814B0;
    v48[3] = &unk_100221528;
    id v44 = v4;
    id v49 = v44;
    [v43 enumerateObjectsUsingBlock:v48];

    v45 = [(RCRecordingViewController *)self overviewWaveformViewController];
    [v44 selectedTimeRange];
    [v45 setSelectedTimeRange:];
  }
  v47 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
  [v4 currentTime];
  [v47 waveformTimeUpdated:];

  byte_10026A800 = 0;
LABEL_27:
}

- (void)handleRemovalOfUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingViewController *)self UUID];
  unsigned int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    [(RCRecordingViewController *)self _reset];
  }
}

- (BOOL)hasShareableComposition
{
  id v2 = [(RCRecordingViewController *)self composition];
  unsigned __int8 v3 = [v2 compositionIsShareable];

  return v3;
}

- (unint64_t)_trackIndexForCurrentTrackState
{
  id v2 = [(RCRecordingViewController *)self trackInfoRepository];
  unint64_t v3 = (unint64_t)[v2 state];

  if (v3 < 3) {
    return qword_1001F0278[v3];
  }
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10016C8F4(v5);
  }

  return 0;
}

- (void)updateCurrentTrackTimeRange
{
  unint64_t v3 = [(RCRecordingViewController *)self composition];
  if ([v3 hasMultipleTracks])
  {
    int IsEnabled = RCOverdubRecordingIsEnabled();

    if (IsEnabled)
    {
      unint64_t v5 = [(RCRecordingViewController *)self _trackIndexForCurrentTrackState];
      unsigned int v6 = [(RCRecordingViewController *)self composition];
      [v6 composedTimeRangeForTrackIndex:v5];
      double v8 = v7;
      double v10 = v9;

      goto LABEL_6;
    }
  }
  else
  {
  }
  double v8 = RCTimeRangeEverything[0];
  double v10 = RCTimeRangeEverything[1];
LABEL_6:
  id v11 = [(RCRecordingViewController *)self view];
  [v11 setCurrentTrackTimeRange:v8, v10];
}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4 = a3;
  if ([(RCRecordingViewController *)self isRecording])
  {
    unint64_t v5 = [(RCRecordingViewController *)self timelineGenerator];

    if (!v5)
    {
      unsigned int v6 = [RCTimelineGenerator alloc];
      double v7 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
      double v8 = [v7 recordingStartTimeInfo];
      double v9 = [(RCRecordingViewController *)self elapsedRecordingTimeInfo];
      double v10 = [(RCTimelineGenerator *)v6 initWithRecordingStartTimeInfo:v8 elapsedRecordingTimeInfo:v9];
      [(RCRecordingViewController *)self setTimelineGenerator:v10];
    }
    id v11 = [(RCRecordingViewController *)self timelineGenerator];
    id v12 = [(RCRecordingViewController *)self elapsedRecordingTimeInfo];
    [v12 elapsedRecordingTime];
    id v13 = [v11 timelinesForDateInterval:v4 displayedRecordingTime:@"RCAlwaysOnRecordingIdentifier"];
  }
  else
  {
    id v13 = +[RCTimelineGenerator emptyTimelineWithIdentifier:@"RCAlwaysOnEmptyIdentifier"];
  }

  return v13;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 entrySpecifierForTimelineIdentifier:@"RCAlwaysOnRecordingIdentifier"];
    uint64_t v7 = [(RCRecordingViewController *)self timelineGenerator];
    double v8 = (void *)v7;
    if (v6 && v7)
    {
      double v9 = [v6 timelineEntry];
      double v10 = [v9 userObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v12 = [v9 userObject];
        [v12 currentTime];
        double v14 = v13;
        [v12 recordingDuration];
        double v16 = v15;
      }
      else
      {
        double v17 = [(RCRecordingViewController *)self recordingViewControllerDelegate];
        id v12 = [v17 recordingStartTimeInfo];

        [v12 recordingTimeAtStartTime];
        double v19 = v18;
        [v12 recordingDurationAtStartTime];
        double v16 = v20;
        double v21 = [v6 timelineEntry];
        v22 = [v21 presentationTime];

        double v23 = [v8 recordingStartTime];
        [v22 timeIntervalSinceDate:v23];
        double v25 = v24;

        double v14 = v19 + v25;
        if (v16 < v14) {
          double v16 = v14;
        }
      }
      char v26 = [(RCRecordingViewController *)self view];
      [v26 setRecordingDuration:v16];

      unint64_t v27 = [(RCRecordingViewController *)self view];
      [v27 setCurrentTime:v14];

      if (RCSupportsDebugAODLogs())
      {
        v28 = OSLogForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = [v5 presentationInterval];
          float v33 = [v38 bls_shortLoggingString];
          v37 = [v6 timelineEntry];
          float v34 = [v37 presentationTime];
          char v35 = [v34 bls_shortLoggingString];
          double v36 = RCDebugStringForTimeInterval();
          *(_DWORD *)buf = 136315906;
          v40 = "-[RCRecordingViewController _updateWithFrameSpecifier:]";
          __int16 v41 = 2112;
          unsigned int v42 = v33;
          __int16 v43 = 2112;
          id v44 = v35;
          __int16 v45 = 2112;
          id v46 = v36;
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s -- presentationInterval = %@    presentationTime = %@    elapsedTime = %@", buf, 0x2Au);
        }
      }
      if (RCSupportsDebugAODOverlay())
      {
        alwaysOnDebugOverlay = self->_alwaysOnDebugOverlay;
        v30 = [v6 timelineEntry];
        v31 = [v30 presentationTime];
        v32 = [v5 presentationInterval];
        [(RCDebugOverlay *)alwaysOnDebugOverlay updateOverlayLayerStringWithPresentationTime:v31 presentationInterval:v32 elapsedRecordingTime:v14];
      }
    }
  }
}

- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingViewControllerDelegate);

  return (RCRecordingViewControllerDelegate *)WeakRetained;
}

- (RCTimeController)activeTimeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);

  return (RCTimeController *)WeakRetained;
}

- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveTranscription);

  return (_TtC10VoiceMemos19RCLiveTranscription *)WeakRetained;
}

- (RCWaveformContainerArray)waveformContainerViewControllers
{
  return self->_waveformContainerViewControllers;
}

- (void)setWaveformContainerViewControllers:(id)a3
{
}

- (RCAVWaveformViewController)overviewWaveformViewController
{
  return self->_overviewWaveformViewController;
}

- (void)setOverviewWaveformViewController:(id)a3
{
}

- (RCToolBarController)toolBarController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolBarController);

  return (RCToolBarController *)WeakRetained;
}

- (void)setToolBarController:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (NSMutableDictionary)editingStatusDict
{
  return self->_editingStatusDict;
}

- (void)setEditingStatusDict:(id)a3
{
}

- (RCTimelineGenerator)timelineGenerator
{
  return self->_timelineGenerator;
}

- (void)setTimelineGenerator:(id)a3
{
}

- (RCElapsedRecordingTimeInfo)elapsedRecordingTimeInfo
{
  return self->_elapsedRecordingTimeInfo;
}

- (void)setElapsedRecordingTimeInfo:(id)a3
{
}

- (RCDebugOverlay)alwaysOnDebugOverlay
{
  return self->_alwaysOnDebugOverlay;
}

- (void)setAlwaysOnDebugOverlay:(id)a3
{
}

- (_TtP10VoiceMemos18TrackIndexSettable_)multipleWaveformsViewController
{
  return self->_multipleWaveformsViewController;
}

- (void)setMultipleWaveformsViewController:(id)a3
{
}

- (UIInteraction)entityInteraction
{
  return self->_entityInteraction;
}

- (void)setEntityInteraction:(id)a3
{
}

- (_TtC10VoiceMemos30RCRecordingTrackInfoRepository)trackInfoRepository
{
  return self->_trackInfoRepository;
}

- (void)setTrackInfoRepository:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfoRepository, 0);
  objc_storeStrong((id *)&self->_entityInteraction, 0);
  objc_storeStrong((id *)&self->_multipleWaveformsViewController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDebugOverlay, 0);
  objc_storeStrong((id *)&self->_elapsedRecordingTimeInfo, 0);
  objc_storeStrong((id *)&self->_timelineGenerator, 0);
  objc_storeStrong((id *)&self->_transcriptViewCoordinator, 0);
  objc_storeStrong((id *)&self->_editingStatusDict, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_toolBarController);
  objc_storeStrong((id *)&self->_overviewWaveformViewController, 0);
  objc_storeStrong((id *)&self->_waveformContainerViewControllers, 0);
  objc_destroyWeak((id *)&self->_liveTranscription);
  objc_destroyWeak((id *)&self->_activeTimeController);

  objc_destroyWeak((id *)&self->_recordingViewControllerDelegate);
}

- (void)registerAppEntityInteraction
{
  id v2 = self;
  sub_100148520();
}

- (void)removeAppEntityInteraction
{
  id v2 = self;
  sub_1000DC448();
}

@end