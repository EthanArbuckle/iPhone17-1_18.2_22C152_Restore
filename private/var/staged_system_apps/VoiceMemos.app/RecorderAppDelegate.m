@interface RecorderAppDelegate
+ (RecorderAppDelegate)sharedAppDelegate;
- (BOOL)_isScrollingTest:(id)a3;
- (BOOL)_selectFirstVoiceMemoInCollectionViewController:(id)a3 errorString:(id *)a4;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)isLockScreenActive;
- (RCDefaultSceneDelegate)defaultSceneDelegate;
- (RCPlatterSceneDelegate)dynamicIslandSceneDelegate;
- (RCPlatterSceneDelegate)platterSceneDelegate;
- (RCRecorderAppDelegateDependencyContainer)dependencyContainer;
- (UIWindow)window;
- (id)_mainViewController;
- (id)_recordingViewController;
- (id)_recordingsCollectionView;
- (id)_splitViewController;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)currentSelectedRecordingCell;
- (id)defaultScene;
- (id)lockScreenSceneDelegate;
- (void)_closeEditCardAndFinishTest;
- (void)_finishGlitchRecording;
- (void)_performTest:(id)a3 options:(id)a4;
- (void)_selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)defaultSceneDidBecomeActive;
- (void)glitchStartRecordNewVoiceMemoTest:(id)a3;
- (void)openCloseEditCardTest:(id)a3;
- (void)performCornobbleScrollTestForCollectionView:(id)a3 withOptions:(id)a4;
- (void)performDeferredInitialization;
- (void)performLegacyScrollTestForCollectionView:(id)a3 withOptions:(id)a4;
- (void)ppt_didEndCyclerRecording;
- (void)ppt_didFinishPostLaunchTasks:(id)a3;
- (void)ppt_didShowVoiceMemoEditor;
- (void)ppt_didShowVoiceMemosList;
- (void)ppt_didStartCyclerRecording;
- (void)ppt_didStartRecording;
- (void)ppt_didStartVoiceMemoPreviewPlayback;
- (void)reconcileApplicationState;
- (void)startCornobbleScrollAllRecordingsTest:(id)a3;
- (void)startCyclerEndRecordingTest:(id)a3;
- (void)startCyclerRecordNewVoiceMemoTest:(id)a3;
- (void)startOpenFoldersSidebarTest:(id)a3;
- (void)startPagingScrollPlaybackCardWaveformTest:(id)a3;
- (void)startPlaySelectedVoiceMemoTest:(id)a3;
- (void)startRecordNewVoiceMemoTest:(id)a3;
- (void)startScrollVoiceMemosEditListTest:(id)a3;
- (void)startScrollVoiceMemosListTest:(id)a3;
- (void)startSelectFirstVoiceMemoInRecordingsList:(id)a3;
- (void)startShowVoiceMemosListTest:(id)a3 warm:(BOOL)a4;
@end

@implementation RecorderAppDelegate

- (void)defaultSceneDidBecomeActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
  [WeakRetained defaultSceneDidBecomeActive];
}

- (void)performDeferredInitialization
{
  v3 = objc_alloc_init(RCRecorderAppDelegateDependencyContainer);
  dependencyContainer = self->_dependencyContainer;
  self->_dependencyContainer = v3;

  v5 = self->_dependencyContainer;

  objc_storeWeak((id *)&self->_stateObserver, v5);
}

+ (RecorderAppDelegate)sharedAppDelegate
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 delegate];

  return (RecorderAppDelegate *)v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if ((RCIsBeingUnitTested() & 1) == 0)
  {
    v5 = +[TranscriptionAvailabilityProvider shared];
    [v5 updateDeviceIsSupported];

    v6 = [(RecorderAppDelegate *)self defaultSceneDelegate];
    v7 = [v6 window];
    v8 = [v7 windowScene];
    +[RCAppIntentsManager setupIntentSceneConfiguratorWithWindowScene:v8];

    +[RCAppIntentsManager registerDependencies];
    +[TipKitManager setupTips];
  }
  return 1;
}

- (UIWindow)window
{
  v2 = [(RecorderAppDelegate *)self defaultSceneDelegate];
  v3 = [v2 window];

  return (UIWindow *)v3;
}

- (RCDefaultSceneDelegate)defaultSceneDelegate
{
  p_defaultSceneDelegate = &self->_defaultSceneDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSceneDelegate);

  if (!WeakRetained)
  {
    v4 = +[UIApplication sharedApplication];
    v5 = [v4 connectedScenes];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) delegate];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeWeak((id *)p_defaultSceneDelegate, v10);
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    id v11 = objc_loadWeakRetained((id *)p_defaultSceneDelegate);

    if (!v11)
    {
      v12 = OSLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000368BC(v12);
      }
    }
  }
  id v13 = objc_loadWeakRetained((id *)p_defaultSceneDelegate);

  return (RCDefaultSceneDelegate *)v13;
}

- (void)ppt_didShowVoiceMemosList
{
  if ((byte_10026A718 & 1) == 0
    && (([(id)qword_10026A708 containsString:@"ShowVoiceMemosList"] & 1) != 0
     || [(id)qword_10026A708 containsString:@"WarmShowVoiceMemosList"]))
  {
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10026A708;
    _[v2 finishedTest:v3];
  }
}

- (void)applicationWillTerminate:(id)a3
{
  p_stateObserver = &self->_stateObserver;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_stateObserver);
  [WeakRetained applicationWillTerminateWithApplication:v4];
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UISceneConfiguration);
  id v7 = [v5 role];
  id v8 = [v6 initWithName:0 sessionRole:v7];

  v9 = [v5 role];
  unsigned __int8 v10 = [v9 isEqualToString:UIWindowSceneSessionRoleApplication];

  if ((v10 & 1) != 0
    || ([v5 role],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isEqualToString:_UIWindowSceneSessionTypeCoverSheet],
        v11,
        v12))
  {
    [v8 setDelegateClass:objc_opt_class()];
  }

  return v8;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v7 = a3;
  uint64_t v3 = [v7 system];
  id v4 = +[UIMenuSystem mainSystem];
  unsigned int v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = +[RCMenuBarManager sharedMenuBarManager];
    [v6 buildMenuWithBuilder:v7];
  }
}

- (id)defaultScene
{
  v2 = [(RecorderAppDelegate *)self defaultSceneDelegate];
  uint64_t v3 = [v2 window];
  id v4 = [v3 windowScene];

  return v4;
}

- (BOOL)isLockScreenActive
{
  v2 = [(RecorderAppDelegate *)self lockScreenSceneDelegate];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (void)reconcileApplicationState
{
  id v4 = [(RecorderAppDelegate *)self defaultSceneDelegate];
  v2 = [v4 mainViewController];
  unsigned __int8 v3 = [v2 mainControllerHelper];
  [v3 reconcileApplicationState];
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = [(RecorderAppDelegate *)self defaultSceneDelegate];
  unsigned __int8 v3 = [v2 performActionForMagicTap];

  return v3;
}

- (id)lockScreenSceneDelegate
{
  p_lockScreenSceneDelegate = &self->_lockScreenSceneDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenSceneDelegate);

  if (!WeakRetained)
  {
    id v4 = +[UIApplication sharedApplication];
    unsigned int v5 = [v4 connectedScenes];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned __int8 v10 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) delegate];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeWeak((id *)p_lockScreenSceneDelegate, v10);
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  id v11 = objc_loadWeakRetained((id *)p_lockScreenSceneDelegate);

  return v11;
}

- (RCPlatterSceneDelegate)dynamicIslandSceneDelegate
{
  v2 = +[UIApplication sharedApplication];
  [v2 connectedScenes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) delegate];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          unsigned __int8 v10 = [v9 platterViewController];
          id v11 = [v10 presentationStyle];

          if (!v11)
          {
            unsigned int v12 = [v9 platterViewController];
            id v13 = [v12 activeLayoutMode];

            if (v13 != (id)-1)
            {

              goto LABEL_14;
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_14:

  return (RCPlatterSceneDelegate *)v9;
}

- (RCPlatterSceneDelegate)platterSceneDelegate
{
  v2 = +[UIApplication sharedApplication];
  [v2 connectedScenes];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) delegate];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v8 = 0;
  }

  return (RCPlatterSceneDelegate *)v8;
}

- (RCRecorderAppDelegateDependencyContainer)dependencyContainer
{
  return self->_dependencyContainer;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateObserver);
  objc_storeStrong((id *)&self->_dependencyContainer, 0);
  objc_destroyWeak((id *)&self->_lockScreenSceneDelegate);

  objc_destroyWeak((id *)&self->_defaultSceneDelegate);
}

- (id)_splitViewController
{
  v2 = [(RecorderAppDelegate *)self _mainViewController];
  id v3 = [v2 splitViewController];

  return v3;
}

- (id)_mainViewController
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 delegate];

  id v4 = [v3 defaultSceneDelegate];
  id v5 = [v4 mainViewController];

  return v5;
}

- (id)_recordingViewController
{
  v2 = [(RecorderAppDelegate *)self _mainViewController];
  id v3 = [v2 activeFolderViewController];
  id v4 = [v3 recordingViewController];

  return v4;
}

- (id)currentSelectedRecordingCell
{
  id v3 = [(RecorderAppDelegate *)self _recordingsCollectionView];
  id v4 = +[NSIndexPath indexPathForItem:0 inSection:0];
  id v5 = [v3 cellForItemAtIndexPath:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = 0;
  if (isKindOfClass)
  {
    uint64_t v8 = [(RecorderAppDelegate *)self _recordingsCollectionView];
    id v9 = +[NSIndexPath indexPathForItem:0 inSection:0];
    uint64_t v7 = [v8 cellForItemAtIndexPath:v9];
  }

  return v7;
}

- (id)_recordingsCollectionView
{
  v2 = [(RecorderAppDelegate *)self _mainViewController];
  id v3 = [v2 activeFolderViewController];
  id v4 = [v3 recordingsCollectionViewController];
  id v5 = [v4 collectionView];

  return v5;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&qword_10026A708, a4);
  objc_storeStrong(&qword_10026A710, a5);
  [v9 containsString:@"Landscape"];
  byte_10026A718 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v18, &location);
  id v11 = v9;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  long long v13 = [(RecorderAppDelegate *)self _mainViewController];
  [v13 setForegroundCompletionBlock:&v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_performTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 containsString:@"ScrollVoiceMemosList"])
  {
    [(RecorderAppDelegate *)self startScrollVoiceMemosListTest:v6];
  }
  else if ([v7 containsString:@"CornobbleScrollAllRecordings"])
  {
    [(RecorderAppDelegate *)self startCornobbleScrollAllRecordingsTest:v6];
  }
  else if ([v7 containsString:@"ScrollVoiceMemosEditList"])
  {
    [(RecorderAppDelegate *)self startScrollVoiceMemosEditListTest:v6];
  }
  else if ([v7 containsString:@"RecordNewVoiceMemo"])
  {
    [(RecorderAppDelegate *)self startRecordNewVoiceMemoTest:v6];
  }
  else if ([v7 containsString:@"GlitchRecordNewVoiceMemo"])
  {
    [(RecorderAppDelegate *)self glitchStartRecordNewVoiceMemoTest:v6];
  }
  else if ([v7 containsString:@"OpenCloseEditCard"])
  {
    [(RecorderAppDelegate *)self openCloseEditCardTest:v6];
  }
  else if ([v7 containsString:@"CyclerRecordNewVoiceMemo"])
  {
    [(RecorderAppDelegate *)self startCyclerRecordNewVoiceMemoTest:v6];
  }
  else if ([v7 containsString:@"CyclerStopRecordingVoiceMemo"])
  {
    [(RecorderAppDelegate *)self startCyclerEndRecordingTest:v6];
  }
  else if ([v7 containsString:@"PlaySelectedVoiceMemo"])
  {
    [(RecorderAppDelegate *)self startPlaySelectedVoiceMemoTest:v6];
  }
  else if ([v7 containsString:@"OpenFoldersSidebar"])
  {
    [(RecorderAppDelegate *)self startOpenFoldersSidebarTest:v6];
  }
  else if ([v7 containsString:@"PagingScrollPlaybackCardWaveform"])
  {
    [(RecorderAppDelegate *)self startPagingScrollPlaybackCardWaveformTest:v6];
  }
}

- (void)ppt_didFinishPostLaunchTasks:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"VoiceMemosLaunchPostTasksCompleted" object:self];
}

- (void)ppt_didShowVoiceMemoEditor
{
  if ([(id)qword_10026A708 isEqualToString:@"OpenCloseEditCard"])
  {
    [(RecorderAppDelegate *)self _closeEditCardAndFinishTest];
  }
}

- (void)ppt_didStartRecording
{
  if ([(id)qword_10026A708 isEqualToString:@"RecordNewVoiceMemo"])
  {
    id v3 = (void *)UIApp;
    [v3 finishedTest:];
  }
  else if ([(id)qword_10026A708 isEqualToString:@"GlitchRecordNewVoiceMemo"])
  {
    [(RecorderAppDelegate *)self _finishGlitchRecording];
  }
}

- (void)ppt_didStartCyclerRecording
{
  if ([(id)qword_10026A708 isEqualToString:@"CyclerRecordNewVoiceMemo"])
  {
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10026A708;
    _[v2 finishedTest:v3];
  }
}

- (void)ppt_didEndCyclerRecording
{
  if ([(id)qword_10026A708 isEqualToString:@"CyclerStopRecordingVoiceMemo"])
  {
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10026A708;
    _[v2 finishedTest:v3];
  }
}

- (void)ppt_didStartVoiceMemoPreviewPlayback
{
  if ([(id)qword_10026A708 isEqualToString:@"PlaySelectedVoiceMemo"])
  {
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10026A708;
    _[v2 finishedTest:v3];
  }
}

- (void)startShowVoiceMemosListTest:(id)a3 warm:(BOOL)a4
{
  byte_10026A718 = 1;
}

- (void)startScrollVoiceMemosListTest:(id)a3
{
  id v4 = a3;
  id v5 = [(RecorderAppDelegate *)self _mainViewController];
  id v6 = [v5 activeFolderViewController];
  id v7 = [v6 recordingsCollectionViewController];

  uint64_t v9 = 0;
  if ([(RecorderAppDelegate *)self _selectFirstVoiceMemoInCollectionViewController:v7 errorString:&v9])
  {
    id v8 = [v7 collectionView];
    [(RecorderAppDelegate *)self performLegacyScrollTestForCollectionView:v8 withOptions:v4];
  }
}

- (void)startCornobbleScrollAllRecordingsTest:(id)a3
{
  id v4 = a3;
  id v5 = [(RecorderAppDelegate *)self _mainViewController];
  id v6 = [v5 activeFolderViewController];
  id v7 = [v6 recordingsCollectionViewController];

  uint64_t v9 = 0;
  if ([(RecorderAppDelegate *)self _selectFirstVoiceMemoInCollectionViewController:v7 errorString:&v9])
  {
    id v8 = [v7 collectionView];
    [(RecorderAppDelegate *)self performCornobbleScrollTestForCollectionView:v8 withOptions:v4];
  }
}

- (void)startRecordNewVoiceMemoTest:(id)a3
{
  uint64_t v3 = [(RecorderAppDelegate *)self _recordingViewController];
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003BB10;
    block[3] = &unk_100221278;
    id v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)glitchStartRecordNewVoiceMemoTest:(id)a3
{
  uint64_t v3 = [(RecorderAppDelegate *)self _recordingViewController];
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003BC40;
    block[3] = &unk_100221278;
    id v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_finishGlitchRecording
{
  v2 = [(RecorderAppDelegate *)self _recordingViewController];
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003BD74;
    block[3] = &unk_100221278;
    id v5 = v2;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)openCloseEditCardTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003BE70;
  v3[3] = &unk_100221278;
  v3[4] = self;
  [(RecorderAppDelegate *)self _selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:v3];
}

- (void)_closeEditCardAndFinishTest
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BFB0;
  block[3] = &unk_100221278;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startCyclerRecordNewVoiceMemoTest:(id)a3
{
  dispatch_time_t v3 = [(RecorderAppDelegate *)self _recordingViewController];
  dispatch_time_t v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C120;
    block[3] = &unk_100221278;
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)startCyclerEndRecordingTest:(id)a3
{
  dispatch_time_t v3 = [(RecorderAppDelegate *)self _recordingViewController];
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C250;
    block[3] = &unk_100221278;
    id v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)startSelectFirstVoiceMemoInRecordingsList:(id)a3
{
  dispatch_time_t v4 = [(RecorderAppDelegate *)self _mainViewController];
  id v5 = [v4 activeFolderViewController];
  id v6 = [v5 recordingsCollectionViewController];
  uint64_t v7 = 0;
  [(RecorderAppDelegate *)self _selectFirstVoiceMemoInCollectionViewController:v6 errorString:&v7];
}

- (void)startPlaySelectedVoiceMemoTest:(id)a3
{
  dispatch_time_t v4 = [(RecorderAppDelegate *)self _mainViewController];
  id v5 = [v4 activeFolderViewController];
  id v6 = [v5 recordingsCollectionViewController];

  uint64_t v7 = +[NSIndexPath indexPathForRow:0 inSection:0];
  [v6 selectItemAtIndexPath:v7 animated:0 scroll:1];

  id v8 = [(RecorderAppDelegate *)self currentSelectedRecordingCell];
  uint64_t v9 = v8;
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C450;
    block[3] = &unk_100221278;
    id v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)startScrollVoiceMemosEditListTest:(id)a3
{
  id v4 = a3;
  id v5 = [(RecorderAppDelegate *)self _mainViewController];
  id v6 = [v5 activeFolderViewController];
  uint64_t v7 = [v6 recordingsCollectionViewController];

  id v8 = [v7 collectionView];
  [v8 setEditing:1];
  uint64_t v9 = 0;
  if ([(RecorderAppDelegate *)self _selectFirstVoiceMemoInCollectionViewController:v7 errorString:&v9])
  {
    [(RecorderAppDelegate *)self performScrollTestForCollectionView:v8 withOptions:v4];
  }
}

- (void)startOpenFoldersSidebarTest:(id)a3
{
  id v4 = [(RecorderAppDelegate *)self _splitViewController];
  [UIApp startedTest:qword_10026A708];
  [v4 showColumn:0];
  dispatch_time_t v3 = [v4 transitionCoordinator];
  [v3 animateAlongsideTransition:0 completion:&stru_1002212F8];
}

- (void)startPagingScrollPlaybackCardWaveformTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003C6AC;
  v3[3] = &unk_100221278;
  v3[4] = self;
  [(RecorderAppDelegate *)self _selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:v3];
}

- (void)performLegacyScrollTestForCollectionView:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v10 = a3;
  id v6 = [v5 objectForKey:@"iterations"];
  id v7 = [v6 intValue];

  id v8 = [v5 objectForKey:@"offset"];

  id v9 = [v8 intValue];
  [v10 scrollToTop];
  [v10 _performScrollTest:qword_10026A708 iterations:v7 delta:v9];
}

- (void)performCornobbleScrollTestForCollectionView:(id)a3 withOptions:(id)a4
{
  id v4 = a3;
  [v4 scrollToTop];
  id v5 = objc_alloc((Class)RPTScrollViewTestParameters);
  id v6 = [v5 initWithTestName:qword_10026A708 scrollView:v4 completionHandler:0];

  +[RPTTestRunner runTestWithParameters:v6];
}

- (void)_selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(RecorderAppDelegate *)self _mainViewController];
  id v6 = [v5 activeFolderViewController];
  id v7 = [v6 recordingsCollectionViewController];

  if (v7)
  {
    uint64_t v9 = 0;
    if ([(RecorderAppDelegate *)self _selectFirstVoiceMemoInCollectionViewController:v7 errorString:&v9])
    {
      id v8 = +[UIApplication sharedApplication];
      [v8 installCACommitCompletionBlock:v4];
    }
    else
    {
      id v8 = OSLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10016A970(v8);
      }
    }
  }
}

- (BOOL)_selectFirstVoiceMemoInCollectionViewController:(id)a3 errorString:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 collectionView];
  id v7 = [v6 numberOfItemsInSection:0];
  if (v7)
  {
    id v8 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [v5 selectItemAtIndexPath:v8 animated:0 scroll:0];
    uint64_t v9 = [v5 collectionView];
    id v10 = [v9 delegate];
    [v10 collectionView:v6 didSelectItemAtIndexPath:v8];
  }
  else if (a4)
  {
    *a4 = @"No voice memos found.";
  }

  return v7 != 0;
}

- (BOOL)_isScrollingTest:(id)a3
{
  uint64_t v3 = qword_10026A728;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10026A728, &stru_100221318);
  }
  unsigned __int8 v5 = [(id)qword_10026A720 containsObject:v4];

  return v5;
}

@end