@interface PLPhotosApplication
- (BOOL)_purgeVariationsCaches;
- (BOOL)launchedToTest;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)shouldRecordExtendedLaunchTime;
- (id)_extendLaunchTest;
- (id)_oneUpViewControllerForViewController:(id)a3;
- (id)_scrollViewToTestForViewController:(id)a3;
- (id)_tungstenViewToTestForViewController:(id)a3;
- (id)rootViewController;
- (int)_scrollTestDelta:(id)a3 options:(id)a4;
- (int)_scrollTestLength:(id)a3 options:(id)a4;
- (int64_t)_zoomLevelFromTestDefinitionZoomLevelName:(id)a3;
- (unint64_t)_scrollAxisForTestWithOptions:(id)a3;
- (unint64_t)ppt_determineAxisForScrollView:(id)a3 withOptions:(id)a4;
- (void)_addTest:(id)a3 completionHandler:(id)a4;
- (void)_callCompletionHandlersForTest:(id)a3;
- (void)_computeFibonnaciNumbersForDuration:(double)a3;
- (void)_configureLibraryFilterModeWithTestOptions:(id)a3;
- (void)_convertAsset:(id)a3 toVariationType:(int64_t)a4 completionHandler:(id)a5;
- (void)_curatedLibraryVC:(id)a3 transitionToZoomLevel:(int64_t)a4 animationSubTestName:(id)a5 task:(id)a6 then:(id)a7;
- (void)_dismissStoryFeed:(id)a3 completion:(id)a4;
- (void)_dismissStoryPlayer:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_endedTest:(id)a3;
- (void)_gridView:(id)a3 performBlockAfterAnimationsCompleted:(id)a4;
- (void)_installWillFinishTestHandler:(id)a3;
- (void)_launchUIImagePickerControllerWithOptions:(id)a3 sourceType:(int64_t)a4 mediaTypes:(id)a5;
- (void)_navigateToAlbumForCurrentTest:(id)a3;
- (void)_navigateToAssetForCurrentTestInOneUp:(BOOL)a3 startFromEnd:(BOOL)a4 completion:(id)a5;
- (void)_navigateToAssetInOneUpForCurrentTest:(id)a3;
- (void)_navigateToAssetInOneUpPreferLocationAndFace:(BOOL)a3 forCurrentTest:(id)a4;
- (void)_navigateToCuratedLibraryTabForCurrentTest:(id)a3;
- (void)_navigateToDestination:(id)a3 completionHandler:(id)a4;
- (void)_navigateToLivePhotosForCurrentTest:(id)a3;
- (void)_navigateToPhotosDetailsForCurrentTestAnimated:(BOOL)a3 willTapHandler:(id)a4 willTransitionHandler:(id)a5 didTransitionHandler:(id)a6 completion:(id)a7;
- (void)_navigateToStoryFeedWithConfiguration:(id)a3 completion:(id)a4;
- (void)_navigateToStoryPlayerWithConfiguration:(id)a3 completion:(id)a4;
- (void)_oneUpDetailsTransitionWith:(id)a3 testOptions:(id)a4;
- (void)_performActionsWithCuratedLibraryVC:(id)a3 actionsTypesAndNames:(id)a4 completionHandler:(id)a5;
- (void)_performBlockWhenImportSourceIsReady:(id)a3;
- (void)_performTestWithBlock:(id)a3;
- (void)_runAssetViewTest:(id)a3 usingBlock:(id)a4;
- (void)_runHeadlessStoryTest:(id)a3 usingBlock:(id)a4;
- (void)_runImportTestCommonInit:(id)a3 navigateToImportTab:(BOOL)a4 completionHandler:(id)a5;
- (void)_runLoadOneUpDocumentMenuActionsSubTest:(id)a3;
- (void)_runPhotoEditTestWithOptions:(id)a3 afterEditOpenedBlock:(id)a4;
- (void)_runRequestImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 options:(id)a5;
- (void)_runRotationTestWithViewController:(id)a3;
- (void)_runScrollTestWithOneUpViewController:(id)a3 options:(id)a4;
- (void)_runScrubTestWithOneUpViewController:(id)a3 options:(id)a4;
- (void)_runSelectedSliderTestForViewController:(id)a3 withOptions:(id)a4;
- (void)_runSharingTest:(id)a3 withActivityType:(id)a4;
- (void)_runStoryFeedTest:(id)a3 usingBlock:(id)a4;
- (void)_runStoryPlayerTest:(id)a3 usingBlock:(id)a4;
- (void)_transitionCuratedLibraryVC:(id)a3 toZoomLevelsWithSubTestNames:(id)a4 taskHandler:(id)a5 completionHandler:(id)a6;
- (void)failedCurrentTest;
- (void)failedCurrentTestWithFailure:(id)a3;
- (void)failedTest:(id)a3 withFailureFormat:(id)a4;
- (void)finishedCurrentTest;
- (void)finishedCurrentTestWithExtraResults:(id)a3;
- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6;
- (void)installNotificationObserverForNotificationName:(id)a3 notificationName:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6;
- (void)launchUIImagePickerControllerWithPhotoLibrary:(id)a3;
- (void)launchUIImagePickerControllerWithSavedPhotosAlbum:(id)a3;
- (void)measureScrollingOfScrollView:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)ppt_beginPausingChanges;
- (void)ppt_endPausingChanges;
- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 gridView:(id)a5 completionHandler:(id)a6;
- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollBounds:(CGRect)a5;
- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 completionHandler:(id)a6;
- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 scrollAxis:(unint64_t)a6 completionHandler:(id)a7;
- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 scrollAxis:(unint64_t)a6 extraResultsBlock:(id)a7 completionHandler:(id)a8;
- (void)runActivityFeedRotationTest:(id)a3;
- (void)runAssetViewLocalizedTitleTest:(id)a3;
- (void)runAssetViewScrubbingTest:(id)a3;
- (void)runAutoLoopGenerationTest:(id)a3;
- (void)runBaselineScrollTest:(id)a3;
- (void)runBaselineTransitionTest:(id)a3;
- (void)runCMMInvitationsScrollTest:(id)a3;
- (void)runCuratedLibraryFilterTest:(id)a3;
- (void)runCuratedLibraryRotationTest:(id)a3;
- (void)runCuratedLibraryZoomLevelTest:(id)a3;
- (void)runHyperionHardResetSyncTest:(id)a3;
- (void)runHyperionInitialSyncTest:(id)a3;
- (void)runHyperionSoftResetSyncTest:(id)a3;
- (void)runImagePicker:(id)a3;
- (void)runImportCycleImportSource:(id)a3;
- (void)runImportGridContentLoadingTest:(id)a3;
- (void)runImportGridDeleteAssets:(id)a3;
- (void)runImportGridImportAssetsToLibrary:(id)a3;
- (void)runImportGridScrollLoadingAssetsTest:(id)a3;
- (void)runImportGridThumbnailTests:(id)a3;
- (void)runInteractiveMemoryExportTest:(id)a3;
- (void)runInteractiveMemoryFeedScrollingTest:(id)a3;
- (void)runInteractiveMemoryPlaybackStartTest:(id)a3;
- (void)runInteractiveMemoryPlaybackTest:(id)a3;
- (void)runInteractiveMemoryRecipeProductionTest:(id)a3;
- (void)runInteractiveMemoryScrollingTest:(id)a3;
- (void)runInteractiveMemoryScrubbingTest:(id)a3;
- (void)runInteractiveMemoryTimelineProductionTest:(id)a3;
- (void)runLaunchAssetPickerTest:(id)a3;
- (void)runLivePhotoPlaybackInEditTest:(id)a3;
- (void)runLivePhotoPlaybackTest:(id)a3;
- (void)runLoadFullScreenSharingOneUpTest:(id)a3;
- (void)runLoadOneUpDocumentMenuTest:(id)a3;
- (void)runLoadPhotoEditorApplyAutoenhanceTest:(id)a3;
- (void)runLoadPhotoEditorDepthTest:(id)a3;
- (void)runLoadPhotoEditorOneUpTest:(id)a3;
- (void)runLoadPhotoEditorOneUpTestWaitUntilRendered:(id)a3;
- (void)runLoadPhotoEditorOpenAdjustmentsTest:(id)a3;
- (void)runLoadPhotoEditorOpenCropTest:(id)a3;
- (void)runLoadPhotoEditorOpenFiltersTest:(id)a3;
- (void)runLoadPhotoEditorOpenPerspectiveTest:(id)a3;
- (void)runLoadSearchZeroKeywordsTest:(id)a3;
- (void)runMailSharingTest:(id)a3;
- (void)runMessageSharingTest:(id)a3;
- (void)runOneUpDetailsTransitionSyndicationTest:(id)a3;
- (void)runOneUpToggleDetailsTest:(id)a3;
- (void)runPageSwipeOneUpTest:(id)a3;
- (void)runPerformSearchPlainText:(id)a3;
- (void)runPrepareForSharingTest:(id)a3;
- (void)runRequestFullscreenTest:(id)a3;
- (void)runRequestGridSizeTest:(id)a3;
- (void)runRequestOriginalTest:(id)a3;
- (void)runScrollActivityFeedTest:(id)a3;
- (void)runScrollAlbumTest:(id)a3;
- (void)runScrollAssetPickerTest:(id)a3;
- (void)runScrollBWAdjustmentTest:(id)a3;
- (void)runScrollColorAdjustmentTest:(id)a3;
- (void)runScrollContentSyndicationAllAssetsGridTest:(id)a3;
- (void)runScrollCuratedLibraryTabTest:(id)a3;
- (void)runScrollIncomingCMMInvitationViewSelectingTest:(id)a3;
- (void)runScrollIncomingCMMInvitationViewTest:(id)a3;
- (void)runScrollLightAdjustmentTest:(id)a3;
- (void)runScrollMemoriesTest:(id)a3;
- (void)runScrollMessagesStackTest:(id)a3;
- (void)runScrollOneUpTest:(id)a3;
- (void)runScrollOutgoingCMMInvitationViewTest:(id)a3;
- (void)runScrollSearchHomeTest:(id)a3;
- (void)runScrollSearchResultsTest:(id)a3;
- (void)runScrollShareSheetCarouselTest:(id)a3;
- (void)runScrollShareSheetTestNatural:(id)a3;
- (void)runScrollSyndicatedContentOneUpTest:(id)a3;
- (void)runScrollTestOnScrollView:(id)a3 withOptions:(id)a4 subTestName:(id)a5 completion:(id)a6;
- (void)runScrubOneUpTest:(id)a3;
- (void)runScrubSyndicatedContentOneUpTest:(id)a3;
- (void)runSelectPhotosTest:(id)a3;
- (void)runSelectPhotosVisualIntelligenceTest:(id)a3;
- (void)runShowOneUpDetailsSyndicationTest:(id)a3;
- (void)runShowOneUpDetailsTest:(id)a3;
- (void)runShowSearchHomeTest:(id)a3;
- (void)runSkimFullQualityOneUpPhotosTest:(id)a3;
- (void)runTransitionToFullscreenInteractiveMemoryTest:(id)a3;
- (void)runTungstenAnimationTest:(id)a3;
- (void)runTungstenEditorialLayoutGenerationTest:(id)a3;
- (void)runTungstenGridLayoutGenerationTest:(id)a3;
- (void)runTungstenRenderTextTest:(id)a3;
- (void)runTungstenScrollingTest:(id)a3;
- (void)runTungstenVideoPlaybackAndScrollingTest:(id)a3;
- (void)startedCurrentTest;
- (void)startedTest:(id)a3;
- (void)tearDownSharingTest:(id)a3;
@end

@implementation PLPhotosApplication

- (void)_endedTest:(id)a3
{
  id v6 = a3;
  v4 = [(PLPhotosApplication *)self currentTestName];
  unsigned int v5 = [v6 isEqualToString:v4];

  if (v5)
  {
    [(PLPhotosApplication *)self setCurrentTestName:0];
    [(PLPhotosApplication *)self setCurrentTestOptions:0];
    [(PLPhotosApplication *)self ppt_endPausingChanges];
    PXPPTDidEndTest();
  }
  [(PLPhotosApplication *)self _callCompletionHandlersForTest:v6];
}

- (void)_callCompletionHandlersForTest:(id)a3
{
  id v3 = a3;
  v4 = [(id)qword_100073360 objectForKeyedSubscript:v3];
  id v5 = [v4 copy];

  id v6 = [(id)qword_100073360 objectForKeyedSubscript:v3];
  [v6 removeAllObjects];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)launchedToTest
{
  if (PFProcessIsLaunchedToExecuteTests()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLPhotosApplication;
  return [(PLPhotosApplication *)&v4 launchedToTest];
}

- (void)startedTest:(id)a3
{
  id v4 = a3;
  id v5 = PLPPTGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PLPhotosApplication *)self px_firstKeyWindow];
    id v7 = [v6 windowScene];
    id v8 = sub_100005874((unint64_t)[v7 interfaceOrientation]);
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    long long v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started Test:%@ Device Orientation:%@", buf, 0x16u);
  }
  id v9 = [v4 lowercaseString];
  unsigned int v10 = [v9 containsString:@"scroll"];

  if (v10) {
    [(PLPhotosApplication *)self ppt_beginPausingChanges];
  }
  PXPPTWillStartTest();
  v11.receiver = self;
  v11.super_class = (Class)PLPhotosApplication;
  [(PLPhotosApplication *)&v11 startedTest:v4];
}

- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_100073358)
  {
    (*(void (**)(void))(qword_100073358 + 16))();
    __int16 v14 = (void *)qword_100073358;
    qword_100073358 = 0;
  }
  long long v15 = PLPPTGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(PLPhotosApplication *)self px_firstKeyWindow];
    v17 = [v16 windowScene];
    v18 = sub_100005874((unint64_t)[v17 interfaceOrientation]);
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Finished Test:%@ Device Orientation:%@", buf, 0x16u);
  }
  v19.receiver = self;
  v19.super_class = (Class)PLPhotosApplication;
  [(PLPhotosApplication *)&v19 finishedTest:v10 extraResults:v11 waitForNotification:v12 withTeardownBlock:v13];
  [(PLPhotosApplication *)self _endedTest:v10];
}

- (id)_extendLaunchTest
{
  return @"PhotosApplicationLaunchExtended";
}

- (void)runPrepareForSharingTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100025B70;
  v3[3] = &unk_1000644A8;
  v3[4] = self;
  [(PLPhotosApplication *)self _navigateToAlbumForCurrentTest:v3];
}

- (void)runCMMInvitationsScrollTest:(id)a3
{
}

- (void)runImportCycleImportSource:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  [(PLPhotosApplication *)self startedCurrentTest];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100025F84;
  objc_super v19 = sub_100025FB0;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100025FB8;
  v14[3] = &unk_1000643C8;
  v14[5] = &v15;
  v14[6] = 20;
  v14[4] = self;
  id v5 = objc_retainBlock(v14);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000260B0;
  v10[3] = &unk_100064440;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v13 = &v21;
  id v8 = objc_retainBlock(v10);
  id v9 = (void *)v16[5];
  v16[5] = (uint64_t)v8;

  ((void (*)(void *, uint64_t, uint64_t))v7[2])(v7, 1, v22[3]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)runImportGridThumbnailTests:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self startedCurrentTest];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000263CC;
  v6[3] = &unk_100064378;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PLPhotosApplication *)self _runImportTestCommonInit:v5 navigateToImportTab:1 completionHandler:v6];
}

- (void)runImportGridImportAssetsToLibrary:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self startedCurrentTest];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026528;
  v6[3] = &unk_100064378;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PLPhotosApplication *)self _runImportTestCommonInit:v5 navigateToImportTab:1 completionHandler:v6];
}

- (void)runImportGridDeleteAssets:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self startedCurrentTest];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026684;
  v6[3] = &unk_100064378;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PLPhotosApplication *)self _runImportTestCommonInit:v5 navigateToImportTab:1 completionHandler:v6];
}

- (void)runImportGridContentLoadingTest:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self startedCurrentTest];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000267D0;
  v5[3] = &unk_100064350;
  v5[4] = self;
  [(PLPhotosApplication *)self _runImportTestCommonInit:v4 navigateToImportTab:1 completionHandler:v5];
}

- (void)runImportGridScrollLoadingAssetsTest:(id)a3
{
}

- (void)_runImportTestCommonInit:(id)a3 navigateToImportTab:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 mutableCopy];
  id v11 = [v9 objectForKeyedSubscript:@"ImportWaitForAllAssets"];

  LODWORD(v9) = [v11 BOOLValue];
  id v12 = &PUImportPPTDriverReplyWhenAllContentIsReadyKey;
  if (!v9) {
    id v12 = &PUImportPPTDriverReplyWhenAnyContentIsReadyKey;
  }
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:*v12];
  if (v5) {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PUImportPPTDriverNavigateToImportTabKey];
  }
  id v13 = +[PUImportPPTDriver sharedInstance];
  [v13 setTestOptions:v10];
  if (-[PLPhotosApplication conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___PXImportViewControllerProvider))[v13 setImportViewControllerProvider:self]; {
  v16[0] = _NSConcreteStackBlock;
  }
  v16[1] = 3221225472;
  v16[2] = sub_1000269E4;
  v16[3] = &unk_100064328;
  id v17 = v13;
  id v18 = v8;
  v16[4] = self;
  id v14 = v13;
  id v15 = v8;
  [v14 ppt_insertImportDataSourceWithOptions:v10 completionHandler:v16];
}

- (void)_runAssetViewTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UIViewController);
  id v9 = +[UIColor systemBackgroundColor];
  id v10 = [v8 view];
  [v10 setBackgroundColor:v9];

  [v8 setModalPresentationStyle:5];
  id v11 = +[PXDisplayAssetViewPPTConfiguration defaultConfigurations];
  id v12 = [(PLPhotosApplication *)self rootViewController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100026B94;
  v17[3] = &unk_100064300;
  id v18 = v8;
  objc_super v19 = self;
  id v21 = v11;
  id v22 = v7;
  id v20 = v6;
  id v13 = v11;
  id v14 = v7;
  id v15 = v6;
  id v16 = v8;
  [v12 presentViewController:v16 animated:1 completion:v17];
}

- (void)runAssetViewLocalizedTitleTest:(id)a3
{
}

- (void)runAssetViewScrubbingTest:(id)a3
{
}

- (void)_runStoryFeedTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = PLPPTGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Testing obsolete implementation, see rdar://134325003", buf, 2u);
  }

  id v9 = [objc_alloc((Class)PXStoryPPTPerformer) initWithDelegate:self testOptions:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026E9C;
  v12[3] = &unk_100064250;
  id v13 = v9;
  id v14 = v6;
  v12[4] = self;
  id v10 = v9;
  id v11 = v6;
  [v10 enumerateFeedConfigurationsUsingBlock:v12 completion:0];
}

- (void)runInteractiveMemoryFeedScrollingTest:(id)a3
{
}

- (void)_runHeadlessStoryTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)PXStoryPPTPerformer) initWithDelegate:self testOptions:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027250;
  v11[3] = &unk_1000641C0;
  id v12 = v8;
  id v13 = v6;
  id v9 = v8;
  id v10 = v6;
  [v9 enumerateStoryConfigurationsUsingBlock:v11 completion:0];
}

- (void)_runStoryPlayerTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)PXStoryPPTPerformer) initWithDelegate:self testOptions:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027468;
  v11[3] = &unk_100064170;
  id v12 = v8;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v8;
  id v10 = v6;
  [v9 enumerateStoryConfigurationsUsingBlock:v11 completion:0];
}

- (void)runInteractiveMemoryTimelineProductionTest:(id)a3
{
}

- (void)runInteractiveMemoryRecipeProductionTest:(id)a3
{
}

- (void)runInteractiveMemoryExportTest:(id)a3
{
}

- (void)runTransitionToFullscreenInteractiveMemoryTest:(id)a3
{
}

- (void)runInteractiveMemoryPlaybackTest:(id)a3
{
}

- (void)runInteractiveMemoryPlaybackStartTest:(id)a3
{
}

- (void)runInteractiveMemoryScrollingTest:(id)a3
{
}

- (void)runInteractiveMemoryScrubbingTest:(id)a3
{
}

- (void)runTungstenVideoPlaybackAndScrollingTest:(id)a3
{
  id v3 = a3;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  id v4 = (void *)qword_100073390;
  uint64_t v48 = qword_100073390;
  if (!qword_100073390)
  {
    v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472;
    uint64_t v41 = (uint64_t)sub_100027C34;
    v42 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000643A0;
    v43 = (void (*)(uint64_t))&v45;
    sub_100027C34((uint64_t)&v39);
    id v4 = (void *)v46[3];
  }
  v25 = v3;
  BOOL v5 = v4;
  _Block_object_dispose(&v45, 8);
  id v28 = objc_alloc_init(v5);
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  for (uint64_t i = 0; i != 5; ++i)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v39 = 0;
    uint64_t v40 = (uint64_t)&v39;
    uint64_t v41 = 0x3032000000;
    v42 = sub_100027DEC;
    v43 = sub_100027DFC;
    id v44 = 0;
    id v8 = +[NSNumber numberWithUnsignedInteger:i];
    id v9 = [v8 stringValue];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100027E04;
    v36[3] = &unk_100063F80;
    v38 = &v39;
    id v10 = v7;
    v37 = v10;
    [v28 generateVideoWithFileNameSuffix:v9 completionHandler:v36];

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(v40 + 40))
    {
      id v11 = objc_alloc((Class)PXFileBackedAssetDescription);
      id v12 = [v11 initWithURL:*(void *)(v40 + 40)];
      [v12 setObject:&off_1000681A0 forKeyedSubscript:@"mediaType"];
      [v12 setObject:&off_1000681E8 forKeyedSubscript:@"playbackStyle"];
      if (v12)
      {
        id v49 = v12;
        id v13 = +[NSArray arrayWithObjects:&v49 count:1];
        id v14 = +[NSNumber numberWithUnsignedInteger:i];
        [v27 setObject:v13 forKeyedSubscript:v14];
      }
    }

    _Block_object_dispose(&v39, 8);
  }
  id v15 = [objc_alloc((Class)PXFileBackedAssetsDataSource) initWithFileBackedAssetDescriptionsBySection:v27];
  id v16 = [objc_alloc((Class)PXGPPTVideoPlaybackViewController) initWithAssetsDataSource:v15];
  id v17 = [(PLPhotosApplication *)self rootViewController];
  id v18 = +[PXCuratedLibrarySettings sharedInstance];
  unsigned __int8 v19 = [v18 enableInlinePlayback];
  BOOL v20 = [v18 maxNumberOfPlayingItems] != 0;
  [v18 setEnableInlinePlayback:1];
  [v18 setMaxNumberOfPlayingItems:0x7FFFFFFFFFFFFFFFLL];
  [(PLPhotosApplication *)self startedCurrentTest];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100027CFC;
  v29[3] = &unk_100063FF8;
  v29[4] = self;
  id v30 = v25;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  unsigned __int8 v34 = v19;
  BOOL v35 = v20;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v25;
  [v22 presentViewController:v23 animated:1 completion:v29];
}

- (void)runTungstenScrollingTest:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PXGPPTSettings scrollingPresetNames];
  id v6 = [v4 objectForKeyedSubscript:@"preset"];
  unsigned int v7 = [v6 isEqual:@"<currentSettings>"];

  if (v7)
  {

    BOOL v5 = &off_1000683D0;
  }
  id v8 = +[PXGPPTSettings sharedInstance];
  id v9 = [(PLPhotosApplication *)self rootViewController];
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [(PLPhotosApplication *)self startedCurrentTest];
  id v11 = [(PLPhotosApplication *)self currentTestName];
  [v5 count];
  unsigned __int8 v19 = v5;
  BOOL v20 = v8;
  id v21 = v9;
  id v22 = v4;
  id v18 = v10;
  id v12 = v18;
  id v13 = v4;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  id v17 = v5;
  PXIterateAsynchronously();
}

- (void)runTungstenAnimationTest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"numberOfSprites"];
  id v6 = [v5 px_integerValues];

  unsigned int v7 = [v4 objectForKeyedSubscript:@"animationDuration"];
  [v7 doubleValue];
  uint64_t v9 = v8;

  id v10 = [v4 objectForKeyedSubscript:@"iterations"];

  id v11 = [v10 integerValue];
  id v12 = objc_alloc_init((Class)PXGPPTAnimationLayout);
  id v13 = [objc_alloc((Class)PXGPPTViewController) initWithLayout:v12];
  id v14 = [(PLPhotosApplication *)self currentTestName];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100028CA8;
  v31[3] = &unk_100063DF0;
  id v15 = v12;
  id v32 = v15;
  id v33 = self;
  id v34 = v14;
  id v16 = v13;
  id v35 = v16;
  uint64_t v36 = v9;
  id v17 = v14;
  id v18 = objc_retainBlock(v31);
  [(PLPhotosApplication *)self startedCurrentTest];
  unsigned __int8 v19 = [(PLPhotosApplication *)self rootViewController];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100028DFC;
  v24[3] = &unk_100063E90;
  id v25 = v6;
  id v26 = v15;
  id v29 = v18;
  id v30 = v11;
  id v27 = v16;
  id v28 = self;
  id v20 = v16;
  id v21 = v18;
  id v22 = v15;
  id v23 = v6;
  [v19 presentViewController:v20 animated:1 completion:v24];
}

- (void)runTungstenEditorialLayoutGenerationTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)PXGPPTLayoutTester);
  [(PLPhotosApplication *)self startedCurrentTest];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002945C;
  v8[3] = &unk_100063DA0;
  id v9 = v5;
  id v7 = v5;
  [v6 runEditorialLayoutTestWithOptions:v4 completionHandler:v8];

  [(PLPhotosApplication *)self finishedCurrentTestWithExtraResults:v7];
}

- (void)runTungstenGridLayoutGenerationTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)PXGPPTLayoutTester);
  [(PLPhotosApplication *)self startedCurrentTest];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000296FC;
  v8[3] = &unk_100063DA0;
  id v9 = v5;
  id v7 = v5;
  [v6 runGridLayoutTestWithOptions:v4 completionHandler:v8];

  [(PLPhotosApplication *)self finishedCurrentTestWithExtraResults:v7];
}

- (void)runTungstenRenderTextTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PXGPPTTextRenderingTester);
  +[PXPPTLoadingLatencyMeter startMeasurementsForOutputType:@"Texture"];
  [(PLPhotosApplication *)self startedCurrentTest];
  +[PXPPTLoadingLatencyMeter sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000299E8;
  v8[3] = &unk_100064710;
  void v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029A3C;
  v7[3] = &unk_100063D78;
  v7[4] = self;
  id v6 = v9;
  [v5 runRenderTextTestWithOptions:v4 latencyMeter:v6 completionHandler:v8 failureHandler:v7];
}

- (void)_convertAsset:(id)a3 toVariationType:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAsset:a3];
  uint64_t v8 = [v7 dataSource];
  v17[0] = [v8 identifier];
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v9 = +[PXIndexPathSet indexPathSetWithIndexPath:v17];
  id v10 = [objc_alloc((Class)PXSectionedSelectionManager) initWithDataSourceManager:v7];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029BF0;
  v15[3] = &unk_100063D50;
  id v16 = v9;
  id v11 = v9;
  [v10 performChanges:v15];
  id v12 = [objc_alloc((Class)PXPhotoKitAssetActionManager) initWithSelectionManager:v10];
  id v13 = PXAssetActionTypeForSelectingAssetVariationType();
  id v14 = [v12 actionPerformerForActionType:v13];

  [v14 performActionWithCompletionHandler:v6];
}

- (void)runAutoLoopGenerationTest:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"iterations"];
  id v5 = [v4 integerValue];

  if ([(PLPhotosApplication *)self _purgeVariationsCaches])
  {
    id v6 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
    id v7 = [v6 librarySpecificFetchOptions];
    uint64_t v8 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:213 options:v7];

    id v9 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
    id v10 = [v9 librarySpecificFetchOptions];

    uint64_t v26 = PHAssetPropertySetOriginalMetadata;
    id v11 = +[NSArray arrayWithObjects:&v26 count:1];
    [v10 setFetchPropertySets:v11];

    id v12 = [v8 firstObject];
    id v13 = +[PHAsset fetchAssetsInAssetCollection:v12 options:v10];

    +[NSMutableArray array];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100029F04;
    v23[3] = &unk_100063CB0;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = v14;
    id v25 = v5;
    [v13 enumerateObjectsUsingBlock:v23];
    id v15 = [v14 copy];
    id v16 = [v15 mutableCopy];
    if ([v16 count] >= v5)
    {
      [(PLPhotosApplication *)self startedCurrentTest];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100029F8C;
      v20[3] = &unk_100063D28;
      id v21 = v16;
      id v22 = self;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10002A0BC;
      v17[3] = &unk_100064710;
      id v18 = v15;
      unsigned __int8 v19 = self;
      [(PLPhotosApplication *)self ppt_startIterationWithBlock:v20 completion:v17];
    }
    else
    {
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", @"Library only contains %lu live photos that can be converted to autoloops, need %ld.", [v16 count], v5);
    }
  }
}

- (void)_launchUIImagePickerControllerWithOptions:(id)a3 sourceType:(int64_t)a4 mediaTypes:(id)a5
{
}

- (void)launchUIImagePickerControllerWithSavedPhotosAlbum:(id)a3
{
  id v4 = a3;
  id v5 = [UTTypeImage identifier];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(PLPhotosApplication *)self _launchUIImagePickerControllerWithOptions:v4 sourceType:2 mediaTypes:v6];
}

- (void)launchUIImagePickerControllerWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [UTTypeImage identifier];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(PLPhotosApplication *)self _launchUIImagePickerControllerWithOptions:v4 sourceType:0 mediaTypes:v6];
}

- (void)runScrollAssetPickerTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PHPickerConfiguration);
  id v6 = [objc_alloc((Class)PUPickerCoordinator) initWithPHConfiguration:v5 coordinatorActionHandler:0 loadingStatusManager:0];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A704;
  v9[3] = &unk_100063C88;
  id v7 = v6;
  id v10 = v7;
  objc_copyWeak(&v12, &location);
  id v8 = v4;
  id v11 = v8;
  [(PLPhotosApplication *)self _navigateToCuratedLibraryTabForCurrentTest:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)runLaunchAssetPickerTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002AAB4;
  v5[3] = &unk_100063C38;
  objc_copyWeak(&v6, &location);
  [(PLPhotosApplication *)self _navigateToCuratedLibraryTabForCurrentTest:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)runLoadSearchZeroKeywordsTest:(id)a3
{
}

- (void)runShowSearchHomeTest:(id)a3
{
}

- (void)runPerformSearchPlainText:(id)a3
{
}

- (void)installNotificationObserverForNotificationName:(id)a3 notificationName:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[NSOperationQueue mainQueue];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100027DEC;
  uint64_t v26 = sub_100027DFC;
  id v27 = 0;
  objc_initWeak(&location, v9);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002B064;
  v16[3] = &unk_100063BE8;
  id v18 = &v22;
  BOOL v20 = a5;
  objc_copyWeak(&v19, &location);
  id v13 = v11;
  id v17 = v13;
  uint64_t v14 = [v9 addObserverForName:v10 object:0 queue:v12 usingBlock:v16];
  id v15 = (void *)v23[5];
  v23[5] = v14;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);
}

- (void)runImagePicker:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"sourceType"];
  if ([v5 isEqualToString:@"SavedPhotosAlbum"])
  {
    uint64_t v4 = 2;
  }
  else
  {
    [v5 isEqualToString:@"PhotoLibrary"];
    uint64_t v4 = 0;
  }
  if (+[UIImagePickerController isSourceTypeAvailable:v4])
  {
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"rdar://133850282"];
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTest];
  }
}

- (void)runHyperionHardResetSyncTest:(id)a3
{
  [(PLPhotosApplication *)self startedCurrentTest];
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B250;
  block[3] = &unk_1000646C0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)runHyperionSoftResetSyncTest:(id)a3
{
  [(PLPhotosApplication *)self startedCurrentTest];
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B394;
  block[3] = &unk_1000646C0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)runHyperionInitialSyncTest:(id)a3
{
  [(PLPhotosApplication *)self startedCurrentTest];
  uint64_t v4 = [(PLPhotosApplication *)self currentTestName];
  [(PLPhotosApplication *)self startedSubTest:@"createMaster" forTest:v4];

  id v5 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B500;
  block[3] = &unk_1000646C0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_runRequestImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 options:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v42 = a5;
  id v44 = [(PLPhotosApplication *)self currentTestOptions];
  id v7 = [v44 objectForKeyedSubscript:@"speed"];
  unsigned int v8 = [v7 isEqual:@"fast"];

  if (v8) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  uint64_t v10 = 10;
  if (v8) {
    uint64_t v10 = 200;
  }
  unint64_t v49 = v10;
  v43 = [v44 objectForKeyedSubscript:@"imageType"];
  if ([v43 isEqualToString:@"jpeg"])
  {
    v89 = UTTypeJPEG;
    v50 = +[NSArray arrayWithObjects:&v89 count:1];
  }
  else if ([v43 isEqualToString:@"heif"])
  {
    v88[0] = UTTypeHEIC;
    id v11 = +[UTType typeWithIdentifier:@"public.avci"];
    v88[1] = v11;
    v88[2] = UTTypeHEIF;
    v50 = +[NSArray arrayWithObjects:v88 count:3];
  }
  else
  {
    if (([v43 isEqualToString:@"*"] & 1) == 0)
    {
      [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"Invalid image type:%@", v43];
      goto LABEL_40;
    }
    v50 = 0;
  }
  id v12 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  uint64_t v45 = [v12 librarySpecificFetchOptions];

  id v13 = +[NSSortDescriptor sortDescriptorWithKey:@"addedDate" ascending:0];
  v87 = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:&v87 count:1];
  [v45 setInternalSortDescriptors:v14];

  [v45 setWantsIncrementalChangeDetails:0];
  [v45 setIncludeAssetSourceTypes:1];
  [v45 setIncludeHiddenAssets:1];
  id v15 = +[PHAsset fetchAssetsWithMediaType:1 options:v45];
  v51 = +[NSMutableArray array];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v15;
  id v48 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v82;
LABEL_14:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v82 != v47) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v81 + 1) + 8 * v16);
      if (v50)
      {
        id v18 = +[PHAsset originalUniformTypeIdentifierForAsset:v17];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v19 = v50;
        id v20 = [v19 countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v78;
          while (2)
          {
            for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v78 != v21) {
                objc_enumerationMutation(v19);
              }
              if (v18)
              {
                uint64_t v23 = *(void *)(*((void *)&v77 + 1) + 8 * i);
                uint64_t v24 = +[UTType typeWithIdentifier:v18];
                LOBYTE(v23) = [v24 isEqual:v23];

                if (v23)
                {

                  goto LABEL_29;
                }
              }
            }
            id v20 = [v19 countByEnumeratingWithState:&v77 objects:v85 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
LABEL_29:
        [v51 addObject:v17];
      }
      BOOL v25 = (unint64_t)[v51 count] < v49;
      if (!v25) {
        break;
      }
      if ((id)++v16 == v48)
      {
        id v48 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
        if (v48) {
          goto LABEL_14;
        }
        break;
      }
    }
  }

  if ((unint64_t)[v51 count] >= v49)
  {
    id v28 = [v44 objectForKeyedSubscript:@"preview"];
    unsigned int v29 = [v28 isEqual:@"true"];

    if (v29)
    {
      id v30 = +[UIApplication sharedApplication];
      id v31 = [v30 windows];
      id v32 = [v31 firstObject];

      id v33 = objc_alloc((Class)UIImageView);
      [v32 bounds];
      PXRectGetCenter();
      id v34 = [v32 screen];
      [v34 scale];
      PXSizeScale();
      PXRectWithCenterAndSize();
      id v35 = [v33 initWithFrame:];

      [v35 setContentMode:1];
      uint64_t v36 = +[UIColor yellowColor];
      [v35 setBackgroundColor:v36];

      [v32 addSubview:v35];
    }
    else
    {
      id v35 = 0;
    }
    v37 = +[PHImageManager defaultManager];
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x2020000000;
    v76[3] = 0;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    v75[3] = 0;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    v74[3] = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    v73[3] = 0;
    +[PXPPTLoadingLatencyMeter startMeasurementsForOutputType:@"Image"];
    [(PLPhotosApplication *)self startedCurrentTest];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10002CA04;
    v58[3] = &unk_100063AF0;
    v64 = v76;
    SEL v68 = a2;
    id v59 = v51;
    v60 = self;
    double v69 = v9;
    id v38 = v37;
    id v61 = v38;
    CGFloat v70 = width;
    CGFloat v71 = height;
    int64_t v72 = a4;
    id v62 = v42;
    v65 = v75;
    v66 = v74;
    id v63 = v35;
    v67 = v73;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10002CCF0;
    v53[3] = &unk_100063B18;
    v55 = v73;
    v56 = v74;
    v53[4] = self;
    v57 = v75;
    id v27 = v63;
    id v54 = v27;
    [(PLPhotosApplication *)self ppt_startIterationWithBlock:v58 completion:v53];

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(v74, 8);
    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v76, 8);
  }
  else
  {
    id v26 = [v51 count];
    id v27 = [v50 componentsJoinedByString:@", "];
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"Need %lu but only found %lu assets of specified types:[%@]", v49, v26, v27];
  }

LABEL_40:
}

- (void)runRequestGridSizeTest:(id)a3
{
  id v22 = objc_alloc_init((Class)PHImageRequestOptions);
  [v22 setDeliveryMode:0];
  [v22 setNetworkAccessAllowed:1];
  uint64_t v4 = +[UIApplication sharedApplication];
  id v5 = [v4 windows];
  id v6 = [v5 firstObject];

  id v7 = +[UIDevice currentDevice];
  unint64_t v8 = (unint64_t)[v7 userInterfaceIdiom];

  double v9 = (Class *)PUPhotosGridViewControllerPadSpec_ptr;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v9 = (Class *)PUPhotosGridViewControllerPhoneSpec_ptr;
  }
  id v10 = objc_alloc_init(*v9);
  id v11 = objc_alloc_init((Class)PUSectionedGridLayout);
  [v6 bounds];
  double Width = CGRectGetWidth(v24);
  [v6 safeAreaInsets];
  [v10 configureCollectionViewGridLayout:v11 forWidth:Width safeAreaInsets:v13, v14, v15, v16];
  [v11 itemSize];
  uint64_t v17 = [v6 screen];
  [v17 scale];
  PXSizeScale();
  double v19 = v18;
  double v21 = v20;

  -[PLPhotosApplication _runRequestImageWithTargetSize:contentMode:options:](self, "_runRequestImageWithTargetSize:contentMode:options:", 1, v22, v19, v21);
}

- (void)runRequestFullscreenTest:(id)a3
{
  id v10 = objc_alloc_init((Class)PHImageRequestOptions);
  [v10 setDeliveryMode:0];
  [v10 setNetworkAccessAllowed:1];
  [v10 setAllowSecondaryDegradedImage:1];
  uint64_t v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v5 = +[UIScreen mainScreen];
  [v5 scale];
  PXSizeScale();
  double v7 = v6;
  double v9 = v8;

  -[PLPhotosApplication _runRequestImageWithTargetSize:contentMode:options:](self, "_runRequestImageWithTargetSize:contentMode:options:", 0, v10, v7, v9);
}

- (void)runRequestOriginalTest:(id)a3
{
  id v4 = objc_alloc_init((Class)PHImageRequestOptions);
  [v4 setVersion:2];
  [v4 setDeliveryMode:1];
  [v4 setResizeMode:0];
  [v4 setNetworkAccessAllowed:1];
  -[PLPhotosApplication _runRequestImageWithTargetSize:contentMode:options:](self, "_runRequestImageWithTargetSize:contentMode:options:", 0, v4, PHImageManagerMaximumSize.width, PHImageManagerMaximumSize.height);
}

- (void)_dismissStoryFeed:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002D60C;
  v6[3] = &unk_100064570;
  id v7 = a4;
  id v5 = v7;
  [a3 dismissViewControllerAnimated:0 completion:v6];
}

- (void)_navigateToStoryFeedWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[PXStoryUIFactory feedViewControllerWithConfiguration:a3];
  [v7 setModalPresentationStyle:0];
  double v8 = [(PLPhotosApplication *)self rootViewController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002D714;
  v11[3] = &unk_100063870;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 presentViewController:v9 animated:0 completion:v11];
}

- (void)_dismissStoryPlayer:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002D7CC;
  v8[3] = &unk_100064570;
  id v9 = a5;
  id v7 = v9;
  [a3 dismissViewControllerAnimated:v5 completion:v8];
}

- (void)_navigateToStoryPlayerWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v15 = 0;
  id v7 = +[PXStoryUIFactory viewControllerWithConfiguration:a3 contentViewController:&v15];
  id v8 = v15;
  id v9 = [(PLPhotosApplication *)self rootViewController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D8E4;
  v12[3] = &unk_100063870;
  id v13 = v8;
  id v14 = v6;
  id v10 = v8;
  id v11 = v6;
  [v9 presentViewController:v7 animated:0 completion:v12];
}

- (void)_navigateToPhotosDetailsForCurrentTestAnimated:(BOOL)a3 willTapHandler:(id)a4 willTransitionHandler:(id)a5 didTransitionHandler:(id)a6 completion:(id)a7
{
  if (a4) {
    id v11 = (Block_layout *)a4;
  }
  else {
    id v11 = &stru_100063908;
  }
  id v12 = (Block_layout *)a7;
  id v13 = (Block_layout *)a6;
  id v14 = (Block_layout *)a5;
  id v15 = objc_retainBlock(v11);
  if (v14) {
    double v16 = v14;
  }
  else {
    double v16 = &stru_100063928;
  }
  uint64_t v17 = objc_retainBlock(v16);

  if (v13) {
    double v18 = v13;
  }
  else {
    double v18 = &stru_100063948;
  }
  double v19 = objc_retainBlock(v18);

  if (v12) {
    double v20 = v12;
  }
  else {
    double v20 = &stru_100063988;
  }
  double v21 = objc_retainBlock(v20);

  [(PLPhotosApplication *)self currentTestOptions];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10002DB44;
  v37[3] = &unk_1000639D8;
  BOOL v42 = a3;
  v37[4] = self;
  v39 = v17;
  uint64_t v40 = v19;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v38 = v22;
  uint64_t v41 = v21;
  uint64_t v23 = v21;
  CGRect v24 = v19;
  BOOL v25 = v17;
  id v26 = objc_retainBlock(v37);
  dispatch_time_t v27 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DDF8;
  block[3] = &unk_100063A28;
  id v32 = v22;
  id v33 = self;
  BOOL v36 = a3;
  id v34 = v15;
  id v35 = v26;
  id v28 = v26;
  unsigned int v29 = v15;
  id v30 = v22;
  dispatch_after(v27, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_navigateToCuratedLibraryTabForCurrentTest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithType:1 revealMode:3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E304;
  v7[3] = &unk_1000638E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLPhotosApplication *)self _navigateToDestination:v5 completionHandler:v7];
}

- (void)_navigateToAlbumForCurrentTest:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotosApplication *)self currentTestOptions];
  id v6 = [v5 valueForKey:@"album"];
  id v7 = [v6 lowercaseString];
  if (([(__CFString *)v7 isEqualToString:@"all photos"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"recents"] & 1) != 0
    || (id v8 = v7, [(__CFString *)v7 isEqualToString:@"camera roll"]))
  {

    id v8 = @"camera-roll";
  }
  if ([(__CFString *)v7 isEqualToString:@"import history"])
  {
    id v9 = (__CFString *)PXProgrammaticNavigationWellKnownNameImportHistory;

    id v8 = v9;
  }
  if (v7)
  {
    CFStringRef v10 = @"album";
    if (v8)
    {
LABEL_9:
      id v11 = [objc_alloc((Class)NSString) initWithFormat:@"photos://%@?name=%@", v10, v8];
      id v12 = objc_alloc((Class)PXProgrammaticNavigationDestination);
      id v13 = +[NSURL URLWithString:v11];
      id v14 = [v12 initWithURL:v13];

      [(PLPhotosApplication *)self _navigateToDestination:v14 completionHandler:v4];
      goto LABEL_17;
    }
  }
  else
  {
    id v15 = [v5 valueForKey:@"userAlbum"];
    double v16 = v15;
    if (v15)
    {
      uint64_t v17 = v15;

      CFStringRef v10 = @"userAlbum";
      id v8 = v17;
    }
    else
    {
      CFStringRef v10 = @"album";
    }

    if (v8) {
      goto LABEL_9;
    }
  }
  double v18 = PLPPTGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    double v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to navigate to album %@", buf, 0xCu);
  }

  [(PLPhotosApplication *)self failedCurrentTest];
LABEL_17:
}

- (void)_navigateToAssetForCurrentTestInOneUp:(BOOL)a3 startFromEnd:(BOOL)a4 completion:(id)a5
{
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002E82C;
  v19[3] = &unk_100063848;
  BOOL v21 = a3;
  v19[4] = self;
  id v8 = a5;
  id v20 = v8;
  BOOL v22 = a4;
  id v9 = objc_retainBlock(v19);
  [(PLPhotosApplication *)self currentTestOptions];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E948;
  v12[3] = &unk_1000638C0;
  double v16 = v23;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v10;
  id v14 = self;
  id v11 = v9;
  id v15 = v11;
  BOOL v17 = a4;
  BOOL v18 = a3;
  [(PLPhotosApplication *)self _navigateToAlbumForCurrentTest:v12];

  _Block_object_dispose(v23, 8);
}

- (void)_navigateToAssetInOneUpPreferLocationAndFace:(BOOL)a3 forCurrentTest:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F47C;
  v5[3] = &unk_100063820;
  BOOL v8 = a3;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(PLPhotosApplication *)v6 _navigateToAssetForCurrentTestInOneUp:1 startFromEnd:0 completion:v5];
}

- (void)_navigateToAssetInOneUpForCurrentTest:(id)a3
{
}

- (void)runCuratedLibraryRotationTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002FA00;
  v3[3] = &unk_1000637A8;
  v3[4] = self;
  [(PLPhotosApplication *)self _navigateToCuratedLibraryTabForCurrentTest:v3];
}

- (void)runActivityFeedRotationTest:(id)a3
{
}

- (void)_runRotationTestWithViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotosApplication *)self currentTestOptions];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  id v11 = 0;
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  id v7 = [v6 integerValue];

  id v11 = v7;
  [(PLPhotosApplication *)self startedCurrentTest];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002FB70;
  v9[3] = &unk_100063780;
  void v9[4] = self;
  v9[5] = v10;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002FC24;
  v8[3] = &unk_1000646C0;
  void v8[4] = self;
  [(PLPhotosApplication *)self ppt_startIterationWithBlock:v9 completion:v8];
  _Block_object_dispose(v10, 8);
}

- (void)_curatedLibraryVC:(id)a3 transitionToZoomLevel:(int64_t)a4 animationSubTestName:(id)a5 task:(id)a6 then:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double v16 = [(PLPhotosApplication *)self currentTestName];
  BOOL v17 = [v12 viewProvider];
  BOOL v18 = [v17 gridView];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10003001C;
  v26[3] = &unk_100063708;
  id v19 = v13;
  id v27 = v19;
  id v28 = self;
  id v20 = v16;
  id v29 = v20;
  id v30 = v14;
  id v31 = v15;
  int64_t v32 = a4;
  id v21 = v15;
  id v22 = v14;
  [(PLPhotosApplication *)self _gridView:v18 performBlockAfterAnimationsCompleted:v26];
  if ([v19 length]) {
    [(PLPhotosApplication *)self pu_startedAnimationSubTest:v19 forTest:v20];
  }
  uint64_t v23 = [v12 viewProvider];
  char v24 = [v23 viewModel];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000300DC;
  v25[3] = &unk_100062D40;
  v25[4] = a4;
  [v24 performChanges:v25];
}

- (void)_transitionCuratedLibraryVC:(id)a3 toZoomLevelsWithSubTestNames:(id)a4 taskHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v12 count];
  if (!v15)
  {
    char v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PhotosApplication-Testing.m", 2275, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  double v16 = [v12 firstObject];
  BOOL v17 = [v16 first];
  id v18 = [v17 integerValue];

  id v19 = [v16 second];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000303A0;
  v25[3] = &unk_100063708;
  id v26 = v12;
  id v27 = self;
  id v28 = v11;
  id v29 = v14;
  id v30 = v13;
  id v31 = v15;
  id v20 = v13;
  id v21 = v11;
  id v22 = v12;
  id v23 = v14;
  [(PLPhotosApplication *)self _curatedLibraryVC:v21 transitionToZoomLevel:v18 animationSubTestName:v19 task:v20 then:v25];
}

- (void)_gridView:(id)a3 performBlockAfterAnimationsCompleted:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  BOOL v8 = objc_getAssociatedObject(self, &off_100071ED0);

  if (v8)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PhotosApplication-Testing.m" lineNumber:2262 description:@"Completion block already exists!"];
  }
  id v9 = [v13 engine];
  id v10 = [v9 ppt_animator];

  [v10 addObserver:self forKeyPath:@"animating" options:3 context:off_100071EC8];
  id v11 = objc_retainBlock(v7);

  objc_setAssociatedObject(self, &off_100071ED0, v11, (void *)0x303);
}

- (void)_performActionsWithCuratedLibraryVC:(id)a3 actionsTypesAndNames:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 viewProvider];
  id v12 = [v11 viewModel];

  id v13 = [v12 actionManager];
  id v14 = [v9 firstObject];
  id v15 = [v14 first];
  if ([v13 canPerformActionType:v15])
  {
    double v16 = [(PLPhotosApplication *)self currentTestName];
    [v12 zoomLevel];
    BOOL v17 = PXCuratedLibraryZoomLevelDescription();
    [v17 stringByReplacingOccurrencesOfString:@" " withString:&stru_1000654D8];
    v18 = char v24 = v8;

    [v14 second];
    id v19 = v25 = v10;
    id v20 = +[NSString stringWithFormat:@"Filter%@%@-Latency", v18, v19];

    [(PLPhotosApplication *)self startedSubTest:@"Latency" forTest:v16];
    [(PLPhotosApplication *)self startedSubTest:v20 forTest:v16];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100030840;
    v28[3] = &unk_100063690;
    v28[4] = self;
    id v29 = v16;
    id v30 = v20;
    id v31 = v9;
    id v33 = v25;
    id v32 = v24;
    id v21 = v20;
    id v22 = v16;
    [(PLPhotosApplication *)self installCACommitCompletionBlock:v28];
    id v23 = [v13 actionPerformerForActionType:v15];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100030938;
    v26[3] = &unk_1000636B8;
    void v26[4] = self;
    id v27 = v15;
    [v23 performActionWithCompletionHandler:v26];

    id v10 = v25;
    id v8 = v24;
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"Unable to perform action %@", v15];
  }
}

- (void)runCuratedLibraryFilterTest:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  id v9 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"iterations"];
  id v6 = [v5 integerValue];

  id v9 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030B18;
  v7[3] = &unk_1000635F0;
  v7[4] = self;
  void v7[5] = v8;
  [(PLPhotosApplication *)self _navigateToCuratedLibraryTabForCurrentTest:v7];
  _Block_object_dispose(v8, 8);
}

- (void)runCuratedLibraryZoomLevelTest:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  id v9 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"iterations"];
  id v6 = [v5 integerValue];

  id v9 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003104C;
  v7[3] = &unk_1000635F0;
  v7[4] = self;
  void v7[5] = v8;
  [(PLPhotosApplication *)self _navigateToCuratedLibraryTabForCurrentTest:v7];
  _Block_object_dispose(v8, 8);
}

- (void)runSelectPhotosVisualIntelligenceTest:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  id v11 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"iterations"];
  id v6 = [v5 integerValue];

  id v11 = v6;
  id v7 = [v4 objectForKeyedSubscript:@"maxPhotosCount"];
  id v8 = [v7 integerValue];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000315FC;
  v9[3] = &unk_1000635A0;
  void v9[4] = self;
  v9[5] = v10;
  void v9[6] = v8;
  [(PLPhotosApplication *)self _navigateToAlbumForCurrentTest:v9];
  _Block_object_dispose(v10, 8);
}

- (void)runSelectPhotosTest:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  id v11 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"iterations"];
  id v6 = [v5 integerValue];

  id v11 = v6;
  id v7 = [v4 objectForKeyedSubscript:@"maxPhotosCount"];
  id v8 = [v7 integerValue];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032370;
  v9[3] = &unk_1000635A0;
  void v9[4] = self;
  v9[5] = v10;
  void v9[6] = v8;
  [(PLPhotosApplication *)self _navigateToAlbumForCurrentTest:v9];
  _Block_object_dispose(v10, 8);
}

- (void)runBaselineTransitionTest:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)sub_1000344D0());
  if (v6)
  {
    id v7 = [objc_alloc((Class)PUNavigationController) initWithRootViewController:v6];
    id v8 = [(PLPhotosApplication *)self rootViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000345B4;
    void v10[3] = &unk_1000633E8;
    v10[4] = self;
    id v11 = v5;
    id v13 = v7;
    SEL v14 = a2;
    id v12 = v6;
    id v9 = v7;
    [v8 presentViewController:v9 animated:1 completion:v10];
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTest];
  }
}

- (void)_navigateToLivePhotosForCurrentTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000351C4;
  v4[3] = &unk_100063320;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _navigateToAssetForCurrentTestInOneUp:1 startFromEnd:1 completion:v4];
}

- (BOOL)_purgeVariationsCaches
{
  id v3 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  id v4 = [v3 variationCache];

  [v4 purgeAll];
  objc_opt_class();
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v5 = (void *)qword_100073380;
  uint64_t v23 = qword_100073380;
  if (!qword_100073380)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100035BC0;
    v19[3] = &unk_1000643A0;
    v19[4] = &v20;
    sub_100035BC0((uint64_t)v19);
    id v5 = (void *)v21[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v20, 8);
  [v6 clearCacheDirectory];
  id v7 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  id v8 = [v7 librarySpecificFetchOptions];

  id v9 = +[NSPredicate predicateWithFormat:@"additionalAttributes.variationSuggestionStates != 0"];
  [v8 setInternalPredicate:v9];

  id v10 = +[PHAsset fetchAssetsWithOptions:v8];
  if ([v10 count])
  {
    id v11 = [v10 photoLibrary];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100035DAC;
    v17[3] = &unk_1000646C0;
    id v12 = v10;
    id v18 = v12;
    id v16 = 0;
    unsigned __int8 v13 = [v11 performChangesAndWait:v17 error:&v16];
    id v14 = v16;
    if ((v13 & 1) == 0) {
      -[PLPhotosApplication failedCurrentTestWithFailure:](self, "failedCurrentTestWithFailure:", @"Unable to reset autoloop suggestion state error:%@ assets:%ld %@", v14, [v12 count], v12);
    }
  }
  else
  {
    unsigned __int8 v13 = 1;
  }

  return v13;
}

- (void)runLivePhotoPlaybackTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100035FC0;
  v3[3] = &unk_100063280;
  v3[4] = self;
  [(PLPhotosApplication *)self _navigateToLivePhotosForCurrentTest:v3];
}

- (void)runLivePhotoPlaybackInEditTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100036190;
  v3[3] = &unk_100063258;
  v3[4] = self;
  [(PLPhotosApplication *)self _runPhotoEditTestWithOptions:a3 afterEditOpenedBlock:v3];
}

- (void)runScrollBWAdjustmentTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003644C;
  v4[3] = &unk_100063230;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _runPhotoEditTestWithOptions:v3 afterEditOpenedBlock:v4];
}

- (void)runScrollColorAdjustmentTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000366F4;
  v4[3] = &unk_100063230;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _runPhotoEditTestWithOptions:v3 afterEditOpenedBlock:v4];
}

- (void)runScrollLightAdjustmentTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003699C;
  v4[3] = &unk_100063230;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _runPhotoEditTestWithOptions:v3 afterEditOpenedBlock:v4];
}

- (void)_runSelectedSliderTestForViewController:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"scrollSteps"];
  id v9 = [v8 integerValue];

  id v10 = [v7 objectForKeyedSubscript:@"scrollIterations"];
  id v11 = [v10 integerValue];

  id v12 = [v7 objectForKeyedSubscript:@"targetRate"];
  id v13 = [v12 integerValue];

  [v6 ppt_configureSelectedSliderWithSteps:v9];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100027DEC;
  id v30 = sub_100027DFC;
  id v31 = 0;
  id v14 = objc_alloc((Class)NSTimer);
  uint64_t v15 = (void)v11 * (void)v9;
  uint64_t v16 = v27[5];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100036DF8;
  v20[3] = &unk_100063208;
  uint64_t v23 = &v26;
  id v17 = v6;
  char v24 = v32;
  uint64_t v25 = v15;
  id v21 = v17;
  uint64_t v22 = self;
  id v18 = [v14 initWithFireDate:v16 interval:1 repeats:v20 block:1.0 / (double)(uint64_t)v13];
  id v19 = +[NSRunLoop currentRunLoop];
  [v19 addTimer:v18 forMode:kCFRunLoopDefaultMode];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);
}

- (void)runLoadPhotoEditorApplyAutoenhanceTest:(id)a3
{
}

- (void)runLoadPhotoEditorOpenPerspectiveTest:(id)a3
{
}

- (void)runLoadPhotoEditorOpenCropTest:(id)a3
{
}

- (void)runLoadPhotoEditorOpenAdjustmentsTest:(id)a3
{
}

- (void)runLoadPhotoEditorDepthTest:(id)a3
{
}

- (void)runLoadPhotoEditorOpenFiltersTest:(id)a3
{
}

- (void)runLoadPhotoEditorOneUpTestWaitUntilRendered:(id)a3
{
}

- (void)runLoadPhotoEditorOneUpTest:(id)a3
{
}

- (void)_runPhotoEditTestWithOptions:(id)a3 afterEditOpenedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  id v15 = 0;
  id v8 = [v6 objectForKeyedSubscript:@"iterations"];
  id v9 = [v8 integerValue];

  id v15 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000378A8;
  v11[3] = &unk_1000630C0;
  void v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  id v13 = v14;
  [(PLPhotosApplication *)self _navigateToAssetInOneUpForCurrentTest:v11];

  _Block_object_dispose(v14, 8);
}

- (void)_runLoadOneUpDocumentMenuActionsSubTest:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotosApplication *)self currentTestName];
  [(PLPhotosApplication *)self startedSubTest:@"LoadOneUpDocumentMenuActionsSubTest" forTest:v5];

  [v4 ppt_barsController];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v8 ppt_documentMenuActions];
  id v7 = [(PLPhotosApplication *)self currentTestName];
  [(PLPhotosApplication *)self finishedSubTest:@"LoadOneUpDocumentMenuActionsSubTest" forTest:v7];
}

- (void)runLoadOneUpDocumentMenuTest:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self startedCurrentTest];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100037E40;
  v6[3] = &unk_100062E18;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PLPhotosApplication *)self _navigateToAssetInOneUpForCurrentTest:v6];
}

- (void)runScrollShareSheetCarouselTest:(id)a3
{
}

- (void)runScrollShareSheetTestNatural:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000382EC;
  block[3] = &unk_1000646C0;
  void block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runMailSharingTest:(id)a3
{
}

- (void)runMessageSharingTest:(id)a3
{
}

- (void)_runSharingTest:(id)a3 withActivityType:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000383F0;
  v7[3] = &unk_100062FF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PLPhotosApplication *)v8 _navigateToAssetInOneUpForCurrentTest:v7];
}

- (void)tearDownSharingTest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100038B18;
  v5[3] = &unk_100064710;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(PLPhotosApplication *)self installCACommitCompletionBlock:v5];
}

- (void)runLoadFullScreenSharingOneUpTest:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  id v9 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"iterations"];
  id v6 = [v5 integerValue];

  id v9 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100038D30;
  v7[3] = &unk_100062F58;
  void v7[4] = self;
  void v7[5] = v8;
  [(PLPhotosApplication *)self _navigateToAssetInOneUpForCurrentTest:v7];
  _Block_object_dispose(v8, 8);
}

- (void)runSkimFullQualityOneUpPhotosTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039028;
  v3[3] = &unk_100062DD0;
  v3[4] = self;
  [(PLPhotosApplication *)self _navigateToAssetInOneUpForCurrentTest:v3];
}

- (void)runScrubOneUpTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003995C;
  v4[3] = &unk_100062E18;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _navigateToAssetInOneUpForCurrentTest:v4];
}

- (void)_runScrubTestWithOneUpViewController:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a3 ppt_scrubberView];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v7 subviews];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v9 delegate];
    [v13 scrollViewWillBeginDragging:v9];

    id v14 = [(PLPhotosApplication *)self currentTestName];
    [(PLPhotosApplication *)self ppt_performScrollTest:v14 withOptions:v6 scrollView:v9 scrollAxis:1 completionHandler:0];
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTest];
  }
}

- (void)runPageSwipeOneUpTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039BBC;
  v4[3] = &unk_100062E18;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _navigateToAssetInOneUpForCurrentTest:v4];
}

- (void)runScrollOneUpTest:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self _configureLibraryFilterModeWithTestOptions:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100039D6C;
  v6[3] = &unk_100062E18;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PLPhotosApplication *)self _navigateToAssetInOneUpForCurrentTest:v6];
}

- (void)_runScrollTestWithOneUpViewController:(id)a3 options:(id)a4
{
  id v9 = a4;
  id v6 = [a3 ppt_mainScrollView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 delegate];
    [v7 scrollViewWillBeginDragging:v6];

    id v8 = [(PLPhotosApplication *)self currentTestName];
    [(PLPhotosApplication *)self ppt_performScrollTest:v8 withOptions:v9 scrollView:v6 scrollAxis:1 completionHandler:0];
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTest];
  }
}

- (void)_oneUpDetailsTransitionWith:(id)a3 testOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLPhotosApplication *)self currentTestName];
  if (+[PhotosTestingRPTHelper shouldUseRPTScrollingForRPTOptions:v7])
  {
    [v6 ppt_scrollableBoundsForTesting];
    -[PLPhotosApplication ppt_performScrollTest:withOptions:scrollBounds:](self, "ppt_performScrollTest:withOptions:scrollBounds:", v8, v7, UIEdgeInsetsZero.left + v9, v10 + 50.0, v11 - (UIEdgeInsetsZero.left + UIEdgeInsetsZero.right), v12 + -220.0);
  }
  else
  {
    id v13 = [v7 objectForKeyedSubscript:@"iterations"];
    id v14 = [v13 integerValue];

    long long v15 = [v7 objectForKeyedSubscript:@"iterationDelta"];
    id v16 = [v15 integerValue];
    if (v16) {
      uint64_t v17 = (uint64_t)v16;
    }
    else {
      uint64_t v17 = 750;
    }

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = v14;
    long long v18 = [v6 browsingSession];
    id v19 = [v18 viewModel];
    uint64_t v20 = [v19 assetsDataSource];
    unsigned __int8 v21 = [v20 isEmpty];

    if (v21)
    {
      [(PLPhotosApplication *)self failedCurrentTest];
    }
    else
    {
      [v6 ppt_toggleAccessoryView];
      dispatch_time_t v22 = dispatch_time(0, 1000000 * v17);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003A128;
      block[3] = &unk_100062E90;
      uint64_t v28 = v17;
      id v24 = v6;
      uint64_t v25 = self;
      id v26 = v8;
      id v27 = v29;
      dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    _Block_object_dispose(v29, 8);
  }
}

- (void)runOneUpDetailsTransitionSyndicationTest:(id)a3
{
}

- (void)runOneUpToggleDetailsTest:(id)a3
{
  id v4 = a3;
  [(PLPhotosApplication *)self _configureLibraryFilterModeWithTestOptions:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003A644;
  v6[3] = &unk_100062E18;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PLPhotosApplication *)self _navigateToAssetInOneUpPreferLocationAndFace:1 forCurrentTest:v6];
}

- (void)_configureLibraryFilterModeWithTestOptions:(id)a3
{
  id v4 = [a3 objectForKey:@"libraryFilterMode"];
  id v5 = v4;
  if (v4)
  {
    if (([v4 isEqualToString:@"shared"] & 1) != 0
      || ([v5 isEqualToString:@"personal"] & 1) != 0
      || ([v5 isEqualToString:@"all"] & 1) != 0)
    {
      uint64_t LibraryFilterViewModeWithSharedLibraryOrPreview = PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview();
      id v7 = [(PLPhotosApplication *)self currentTestName];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10003A79C;
      void v8[3] = &unk_100062DF0;
      void v8[4] = LibraryFilterViewModeWithSharedLibraryOrPreview;
      [(PLPhotosApplication *)self _addTest:v7 completionHandler:v8];

      PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview();
    }
    else
    {
      [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"sharedLibraryMode option is invalid: %@", v5];
    }
  }
}

- (void)runShowOneUpDetailsSyndicationTest:(id)a3
{
}

- (void)runShowOneUpDetailsTest:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A870;
  v7[3] = &unk_100064710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)runScrollOutgoingCMMInvitationViewTest:(id)a3
{
}

- (void)runScrollIncomingCMMInvitationViewSelectingTest:(id)a3
{
}

- (void)runScrollIncomingCMMInvitationViewTest:(id)a3
{
}

- (void)runScrollMemoriesTest:(id)a3
{
}

- (void)runScrollActivityFeedTest:(id)a3
{
}

- (void)runScrubSyndicatedContentOneUpTest:(id)a3
{
}

- (void)runScrollSyndicatedContentOneUpTest:(id)a3
{
}

- (id)_oneUpViewControllerForViewController:(id)a3
{
  id v3 = [a3 navigationController];
  id v4 = [v3 topViewController];

  dispatch_time_t v5 = [v4 presentedViewController];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 topViewController];
    }
    else
    {
      id v6 = v5;
    }
    id v7 = v6;

    id v4 = v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v4;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)runScrollContentSyndicationAllAssetsGridTest:(id)a3
{
}

- (int64_t)_zoomLevelFromTestDefinitionZoomLevelName:(id)a3
{
  id v3 = [a3 lowercaseString];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1000654D8];

  if ([v4 isEqualToString:@"years"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"months"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"days"])
  {
    int64_t v5 = 3;
  }
  else if ([v4 isEqualToString:@"allphotos"])
  {
    int64_t v5 = 4;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)runScrollCuratedLibraryTabTest:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 objectForKeyedSubscript:@"zoomLevel"];
  int64_t v6 = [(PLPhotosApplication *)self _zoomLevelFromTestDefinitionZoomLevelName:v5];
  if (v6)
  {
    int64_t v7 = v6;
    [(PLPhotosApplication *)self currentTestName];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003AD04;
    v9[3] = &unk_100062DA8;
    int64_t v12 = v7;
    void v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v4;
    id v8 = v10;
    [(PLPhotosApplication *)self _navigateToCuratedLibraryTabForCurrentTest:v9];
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"invalid zoomLevel specified in test definition: ”%@”", v5];
  }
}

- (void)runScrollSearchResultsTest:(id)a3
{
}

- (void)runScrollSearchHomeTest:(id)a3
{
}

- (void)runScrollMessagesStackTest:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  int64_t v6 = [v5 librarySpecificFetchOptions];

  int64_t v7 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:203 options:v6];
  id v8 = [v7 firstObject];

  double v9 = +[PHAsset fetchAssetsInAssetCollection:v8 options:v6];
  id v10 = v9;
  if (v8 && (unint64_t)[v9 count] >= 0xA)
  {
    LOBYTE(v18) = 0;
    id v11 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:v8 existingAssetsFetchResult:v10 existingKeyAssetsFetchResult:0 fetchPropertySets:0 basePredicate:0 options:0 ignoreSharedLibraryFilters:v18];
    int64_t v12 = [v8 photoLibrary];
    id v13 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v12];

    id v14 = [objc_alloc((Class)PXMessagesStackBalloonViewController) initWithDataSourceManager:v11 mediaProvider:v13];
    long long v15 = [(PLPhotosApplication *)self rootViewController];
    id v16 = [v15 presentedViewController];

    if (v16)
    {
      [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"There is already a presented view controller in photos"];
    }
    else
    {
      uint64_t v17 = [(PLPhotosApplication *)self rootViewController];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10003B174;
      v19[3] = &unk_100062BE0;
      v19[4] = self;
      id v20 = v14;
      id v21 = v4;
      [v17 presentViewController:v20 animated:1 completion:v19];
    }
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"The favorites album must have at least 10 assets"];
  }
}

- (void)runScrollAlbumTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B318;
  v4[3] = &unk_100062D20;
  int64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PLPhotosApplication *)v5 _navigateToAlbumForCurrentTest:v4];
}

- (void)runBaselineScrollTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)sub_1000344D0());
  if (v5)
  {
    id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
    int64_t v7 = [(PLPhotosApplication *)self rootViewController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003B524;
    v9[3] = &unk_100062CF8;
    void v9[4] = self;
    id v10 = v5;
    id v11 = v4;
    id v12 = v6;
    id v8 = v6;
    [v7 presentViewController:v8 animated:1 completion:v9];
  }
  else
  {
    [(PLPhotosApplication *)self failedCurrentTest];
  }
}

- (void)measureScrollingOfScrollView:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotosApplication *)self currentTestName];
  double v9 = [(PLPhotosApplication *)self currentTestOptions];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B7B4;
  v12[3] = &unk_100062C80;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [(PLPhotosApplication *)self ppt_performScrollTest:v11 withOptions:v9 scrollView:v7 completionHandler:v12];
}

- (void)runScrollTestOnScrollView:(id)a3 withOptions:(id)a4 subTestName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  unint64_t v14 = [(PLPhotosApplication *)self ppt_determineAxisForScrollView:v10 withOptions:v13];
  PXPPTWillBeginScrollTestOnScrollView();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003B954;
  v17[3] = &unk_100062C80;
  id v18 = v10;
  id v19 = v11;
  id v15 = v11;
  id v16 = v10;
  [(PLPhotosApplication *)self ppt_performScrollTest:v12 withOptions:v13 scrollView:v16 scrollAxis:v14 extraResultsBlock:0 completionHandler:v17];
}

- (id)_tungstenViewToTestForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100027DEC;
  unint64_t v14 = sub_100027DFC;
  id v15 = 0;
  if ([v4 isViewLoaded])
  {
    id v5 = [v4 view];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003BB1C;
    v9[3] = &unk_100062C58;
    void v9[4] = &v10;
    [v5 px_enumerateDescendantSubviewsUsingBlock:v9];
  }
  id v6 = (void *)v11[5];
  if (!v6)
  {
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"Couldn't find a PXGView for view controller %@", v4];
    id v6 = (void *)v11[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_scrollViewToTestForViewController:(id)a3
{
  id v5 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_100027DEC;
  id v26 = sub_100027DFC;
  id v27 = [v5 contentScrollView];
  if (!v23[5] && [v5 isViewLoaded])
  {
    id v6 = [v5 view];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    double v21 = 0.0;
    [v6 bounds];
    PXSizeGetArea();
    double v21 = v7 * 0.5;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003BDD0;
    v12[3] = &unk_100062C30;
    id v8 = v6;
    id v15 = v19;
    id v16 = &v22;
    id v13 = v8;
    unint64_t v14 = self;
    uint64_t v17 = v20;
    SEL v18 = a2;
    [v8 px_enumerateDescendantSubviewsUsingBlock:v12];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }
  double v9 = (void *)v23[5];
  if (!v9)
  {
    [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"Couldn't find scroll view for view controller %@", v5];
    double v9 = (void *)v23[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)_navigateToDestination:(id)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003C090;
  v6[3] = &unk_100062C08;
  void v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  +[PXPPTNavigationHelper navigateToDestination:a3 options:0 completionHandler:v6];
}

- (unint64_t)_scrollAxisForTestWithOptions:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"scrollAxis"];
  unsigned int v4 = [v3 isEqualToString:@"horizontal"];

  if (v4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int)_scrollTestDelta:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:@"fullScreen"];
  unsigned int v8 = [v7 intValue];

  if (v8 == 1)
  {
    [v5 frame];
    double v10 = v9;
    [v5 frame];
    if (v10 < v11) {
      double v10 = v11;
    }
  }
  else
  {
    uint64_t v12 = [v6 objectForKey:@"offset"];
    id v13 = v12;
    if (v12) {
      double v14 = (double)(int)[v12 intValue];
    }
    else {
      double v14 = 50.0;
    }
    id v15 = +[CADisplay mainDisplay];
    [v15 refreshRate];
    double v17 = v16;

    double v10 = round(v14 * (v17 / 0.0166666667));
  }

  return (int)v10;
}

- (int)_scrollTestLength:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 contentSize];
  double v9 = v8;
  [v6 contentSize];
  if (v9 >= v10) {
    double v10 = v9;
  }
  int v11 = (int)v10;
  uint64_t v12 = [v7 objectForKeyedSubscript:@"fullLength"];
  unsigned int v13 = [v12 intValue];

  if (v13 != 1)
  {
    double v14 = [v7 objectForKeyedSubscript:@"scrollLength"];

    if (v14)
    {
      id v15 = [v7 objectForKeyedSubscript:@"scrollLength"];
      int v16 = [v15 intValue];
    }
    else
    {
      int v16 = (int)fmax((double)[(PLPhotosApplication *)self _scrollTestDelta:v6 options:v7]* 120.0, 10000.0);
    }
    if (v16 < v11) {
      int v11 = v16;
    }
  }

  return v11;
}

- (void)failedCurrentTestWithFailure:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v7];

  id v6 = [(PLPhotosApplication *)self currentTestName];
  [(PLPhotosApplication *)self failedTest:v6 withFailure:v5];
}

- (void)failedCurrentTest
{
}

- (void)finishedCurrentTestWithExtraResults:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotosApplication *)self currentTestName];
  [(PLPhotosApplication *)self finishedTest:v5 extraResults:v4];
}

- (void)finishedCurrentTest
{
  if (!+[NSThread isMainThread])
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PhotosApplication-Testing.m" lineNumber:665 description:@"%s must be called on the main thread" -[PLPhotosApplication(Testing) finishedCurrentTest]];
  }
  id v4 = [(PLPhotosApplication *)self currentTestName];
  unsigned __int8 v5 = +[PhotosTestingRPTHelper isRPTStyleTestName:v4];

  if ((v5 & 1) == 0)
  {
    [(PLPhotosApplication *)self finishedCurrentTestWithExtraResults:0];
  }
}

- (void)startedCurrentTest
{
  id v3 = [(PLPhotosApplication *)self currentTestName];
  if (!+[PhotosTestingRPTHelper isRPTStyleTestName:](PhotosTestingRPTHelper, "isRPTStyleTestName:")) {
    [(PLPhotosApplication *)self startedTest:v3];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (off_100071EC8 != a6)
  {
    v25.receiver = self;
    v25.super_class = (Class)PLPhotosApplication;
    [(PLPhotosApplication *)&v25 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
    goto LABEL_11;
  }
  id v14 = v12;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    id v20 = +[NSAssertionHandler currentHandler];
    uint64_t v23 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v23);
    uint64_t v24 = [v14 px_descriptionForAssertionMessage];
    [v20 handleFailureInMethod:a2, self, @"PhotosApplication-Testing.m", 632, @"%@ should be an instance inheriting from %@, but it is %@", @"object", v22, v24 object file lineNumber description];
  }
  else
  {
    id v20 = +[NSAssertionHandler currentHandler];
    double v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PhotosApplication-Testing.m", 632, @"%@ should be an instance inheriting from %@, but it is nil", @"object", v22 object file lineNumber description];
  }

LABEL_5:
  id v15 = [v13 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  unsigned int v16 = [v15 BOOLValue];

  double v17 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  unsigned __int8 v18 = [v17 BOOLValue];

  if (v16 && (v18 & 1) == 0)
  {
    [v14 removeObserver:self forKeyPath:@"animating"];
    objc_getAssociatedObject(self, &off_100071ED0);
    id v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_setAssociatedObject(self, &off_100071ED0, 0, (void *)0x303);
      v19[2](v19);
    }
  }
LABEL_11:
}

- (void)_performBlockWhenImportSourceIsReady:(id)a3
{
}

- (void)_performTestWithBlock:(id)a3
{
}

- (void)failedTest:(id)a3 withFailureFormat:(id)a4
{
  double v10 = &v11;
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v11];

  v9.receiver = self;
  v9.super_class = (Class)PLPhotosApplication;
  [(PLPhotosApplication *)&v9 failedTest:v7 withFailure:v8];
  [(PLPhotosApplication *)self _endedTest:v7];
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"parentTestName"];
  if (v8)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    objc_super v9 = [(PLPhotosApplication *)self ppt_testDefinitions];
    id v10 = [v9 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v10)
    {
      id v11 = v10;
      id v44 = self;
      id v45 = v6;
      uint64_t v12 = *(void *)v62;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v62 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v15 = [v14 objectForKeyedSubscript:@"testName" v44, v45];
          unsigned int v16 = [v15 isEqualToString:v8];

          if (v16)
          {
            id v17 = [v14 mutableCopy];
            [v17 addEntriesFromDictionary:v7];

            id v7 = v17;
            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_12:
      self = v44;
      id v6 = v45;
    }
  }
  unsigned __int8 v18 = [v7 objectForKeyedSubscript:@"ImageManager"];
  unsigned int v19 = [v18 isEqualToString:@"neutered"];

  if (v19)
  {
    id v20 = +[PHImageManagerSettings sharedSettings];
    unsigned __int8 v21 = [v20 allowImageRequests];
    unsigned __int8 v22 = [v20 allowCaching];
    [v20 setAllowImageRequests:0];
    [v20 setAllowCaching:0];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10003CEF8;
    v57[3] = &unk_100062B90;
    id v58 = v20;
    unsigned __int8 v59 = v21;
    unsigned __int8 v60 = v22;
    id v23 = v20;
    [(PLPhotosApplication *)self _addTest:v6 completionHandler:v57];
  }
  uint64_t v24 = [v7 objectForKeyedSubscript:@"ImageModulation"];
  unsigned int v25 = [v24 isEqualToString:@"all"];

  if (v25)
  {
    id v26 = +[PXImageModulationSettings sharedInstance];
    unsigned __int8 v27 = [v26 isEnabled];
    id v28 = [v26 HDRConsideration];
    [v26 setEnabled:1];
    [v26 setHDRConsideration:1];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10003CF3C;
    v53[3] = &unk_100062BB8;
    unsigned __int8 v56 = v27;
    id v54 = v26;
    id v55 = v28;
    id v29 = v26;
    [(PLPhotosApplication *)self _addTest:v6 completionHandler:v53];
  }
  id v30 = [v6 copy];
  [(PLPhotosApplication *)self setCurrentTestName:v30];

  id v31 = [v7 copy];
  [(PLPhotosApplication *)self setCurrentTestOptions:v31];

  id v32 = [v7 objectForKeyedSubscript:@"selector"];
  id v33 = v32;
  if (v32 && ([v32 isEqualToString:&stru_1000654D8] & 1) == 0)
  {
    v37 = self;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10003CF7C;
    v49[3] = &unk_100062BE0;
    id v50 = v33;
    id v38 = v37;
    v51 = v38;
    id v39 = v7;
    id v52 = v39;
    uint64_t v40 = objc_retainBlock(v49);
    uint64_t v41 = [v39 objectForKeyedSubscript:@"RequiresImportSource"];
    unsigned int v42 = [v41 BOOLValue];

    if (v42)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10003D03C;
      v47[3] = &unk_100063870;
      v47[4] = v38;
      id v48 = v40;
      [(PLPhotosApplication *)v38 _performBlockWhenImportSourceIsReady:v47];
    }
    else
    {
      [(PLPhotosApplication *)v38 _performTestWithBlock:v40];
    }

    goto LABEL_26;
  }
  id v34 = +[PhotosTestingRPTHelper gesturePerformerForTestWithName:v6 options:v7];
  char v35 = PXPhotosApplicationTryRunningSwiftPPTTest();

  if (v35)
  {
LABEL_26:
    BOOL v36 = 1;
    goto LABEL_27;
  }
  v46.receiver = self;
  v46.super_class = (Class)PLPhotosApplication;
  BOOL v36 = [(PLPhotosApplication *)&v46 runTest:v6 options:v7];
LABEL_27:

  return v36;
}

- (void)_computeFibonnaciNumbersForDuration:(double)a3
{
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  do
    [v4 timeIntervalSinceNow];
  while (v3 > 0.0);
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 scrollAxis:(unint64_t)a6 extraResultsBlock:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v16)
  {
    if (+[PhotosTestingRPTHelper shouldUseRPTScrollingForRPTOptions:v15])
    {
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10003D60C;
      v73[3] = &unk_100062AC8;
      void v73[4] = self;
      id v19 = v14;
      id v74 = v19;
      id v20 = v18;
      id v75 = v20;
      unsigned __int8 v21 = objc_retainBlock(v73);
      if (+[PhotosTestingRPTHelper isRPTAvailable])
      {
        unsigned __int8 v22 = [v16 superview];
        [v16 frame];
        [v22 convertRect:0 toView:0];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;

        [v16 adjustedContentInset];
        double v32 = v31 + 60.0;
        double v35 = v34 + 20.0;
        double v37 = v24 + v35;
        double v38 = v26 + v32;
        double v39 = v28 - (v35 + v36 + 20.0);
        double v40 = v30 - (v32 + v33 + 35.0);
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_10003D66C;
        v71[3] = &unk_100062AF0;
        id v72 = v20;
        +[PhotosTestingRPTHelper runTestWithName:RPTOptions:scrollBounds:completionHandler:](PhotosTestingRPTHelper, "runTestWithName:RPTOptions:scrollBounds:completionHandler:", v19, v15, v71, v37, v38, v39, v40);
      }
      else
      {
        ((void (*)(void *))v21[2])(v21);
      }
    }
    else
    {
      unint64_t v58 = a6;
      uint64_t v41 = +[PUPerformanceDiagnosticsSettings sharedInstance];
      [v41 scrollTestCPUWarmupDuration];
      double v43 = v42;

      id v44 = +[PUPerformanceDiagnosticsSettings sharedInstance];
      [v44 scrollTestCPUSustainDuration];
      double v46 = v45;

      if (v43 > 0.0 || v46 > 0.0)
      {
        if (v46 > 0.0)
        {
          uint64_t v47 = dispatch_get_global_queue(2, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10003D688;
          block[3] = &unk_100062B18;
          void block[4] = self;
          *(double *)&void block[5] = v43;
          *(double *)&block[6] = v46;
          dispatch_async(v47, block);
        }
        [(PLPhotosApplication *)self _computeFibonnaciNumbersForDuration:v43];
      }
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x2020000000;
      v69[3] = 0;
      id v48 = +[PUPerformanceDiagnosticsSettings sharedInstance];
      [v48 scrollTestRampUpDuration];
      double v50 = v49;

      dispatch_time_t v51 = dispatch_time(0, (uint64_t)(v50 * 1000000000.0));
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10003D69C;
      v65[3] = &unk_100062B40;
      SEL v68 = v69;
      v65[4] = self;
      v66 = @"steady";
      id v52 = v14;
      id v67 = v52;
      dispatch_after(v51, (dispatch_queue_t)&_dispatch_main_q, v65);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10003D758;
      v61[3] = &unk_100062B40;
      long long v64 = v69;
      v61[4] = self;
      long long v62 = @"steady";
      id v53 = v52;
      id v63 = v53;
      [(PLPhotosApplication *)self _installWillFinishTestHandler:v61];
      id v54 = [v15 objectForKeyedSubscript:@"iterations"];
      id v55 = [v54 intValue];
      uint64_t v56 = [(PLPhotosApplication *)self _scrollTestDelta:v16 options:v15];
      uint64_t v57 = [(PLPhotosApplication *)self _scrollTestLength:v16 options:v15];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_10003D7A8;
      v59[3] = &unk_100062B68;
      id v60 = v18;
      [v16 _performScrollTest:v53 iterations:v55 delta:v56 length:v57 scrollAxis:v58 extraResultsBlock:v17 completionBlock:v59];

      _Block_object_dispose(v69, 8);
    }
  }
  else
  {
    [(PLPhotosApplication *)self failedTest:v14];
    if (v18) {
      (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
    }
  }
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 scrollAxis:(unint64_t)a6 completionHandler:(id)a7
{
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollView:(id)a5 completionHandler:(id)a6
{
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 scrollBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10003D954;
  id v18 = &unk_100064710;
  id v19 = self;
  id v13 = v11;
  id v20 = v13;
  id v14 = objc_retainBlock(&v15);
  if (+[PhotosTestingRPTHelper shouldUseRPTScrollingForRPTOptions:](PhotosTestingRPTHelper, "shouldUseRPTScrollingForRPTOptions:", v12, v15, v16, v17, v18, v19)&& +[PhotosTestingRPTHelper isRPTAvailable])
  {
    +[PhotosTestingRPTHelper runTestWithName:RPTOptions:scrollBounds:completionHandler:](PhotosTestingRPTHelper, "runTestWithName:RPTOptions:scrollBounds:completionHandler:", v13, v12, 0, x, y, width, height);
  }
  else
  {
    ((void (*)(void ***))v14[2])(v14);
  }
}

- (unint64_t)ppt_determineAxisForScrollView:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKeyedSubscript:@"scrollAxis"];
  if ([v6 isEqualToString:@"horizontal"]) {
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"vertical"])
  {
    unint64_t v7 = 2;
    goto LABEL_10;
  }
  if (([v5 alwaysBounceHorizontal] & 1) != 0
    || !objc_msgSend(v5, "px_isScrolledAtEdge:", 0))
  {
LABEL_9:
    unint64_t v7 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "px_isScrolledAtEdge:", 2)) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }
LABEL_10:

  return v7;
}

- (void)ppt_performScrollTest:(id)a3 withOptions:(id)a4 gridView:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 scrollViewController];
  id v15 = [v14 scrollView];

  uint64_t v16 = +[PXGPPTSettings sharedInstance];
  unsigned int v17 = [v16 shouldTestNestedScrollView];

  if (v17)
  {
    uint64_t v29 = 0;
    double v30 = &v29;
    uint64_t v31 = 0x3032000000;
    double v32 = sub_100027DEC;
    double v33 = sub_100027DFC;
    id v34 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10003DC90;
    v26[3] = &unk_100062A78;
    id v15 = v15;
    id v27 = v15;
    double v28 = &v29;
    [v15 px_enumerateDescendantSubviewsUsingBlock:v26];
    id v18 = (void *)v30[5];
    if (v18)
    {
      id v19 = v18;

      id v15 = v19;
    }
    else
    {
      [(PLPhotosApplication *)self failedCurrentTestWithFailure:@"No nested scroll view found in %@", v15];
    }

    _Block_object_dispose(&v29, 8);
  }
  unint64_t v20 = [(PLPhotosApplication *)self ppt_determineAxisForScrollView:v15 withOptions:v11];
  [v12 ppt_prepareForTest:v10 withOptions:v11 isScrollTest:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10003DD8C;
  void v23[3] = &unk_100062AA0;
  id v24 = v12;
  id v25 = v10;
  id v21 = v12;
  id v22 = v10;
  [(PLPhotosApplication *)self ppt_performScrollTest:v22 withOptions:v11 scrollView:v15 scrollAxis:v20 extraResultsBlock:v23 completionHandler:v13];
}

- (void)ppt_endPausingChanges
{
  objc_getAssociatedObject(self, &unk_100073368);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    double v3 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
    [v3 px_endPausingChanges:v4];

    objc_setAssociatedObject(self, &unk_100073368, 0, (void *)0x301);
  }
}

- (void)ppt_beginPausingChanges
{
  objc_getAssociatedObject(self, &unk_100073368);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  id v4 = [v3 px_beginPausingChangesWithTimeout:@"PLPhotosApplication (Testing)" identifier:60.0];

  objc_setAssociatedObject(self, &unk_100073368, v4, (void *)0x301);
  if (v6)
  {
    id v5 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
    [v5 px_endPausingChanges:v6];
  }
}

- (void)_addTest:(id)a3 completionHandler:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = (void *)qword_100073360;
  if (!qword_100073360)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    id v8 = (void *)qword_100073360;
    qword_100073360 = (uint64_t)v7;

    id v6 = (void *)qword_100073360;
  }
  objc_super v9 = [v6 objectForKeyedSubscript:v12];
  if (!v9)
  {
    objc_super v9 = +[NSMutableArray array];
    [(id)qword_100073360 setObject:v9 forKeyedSubscript:v12];
  }
  id v10 = [v5 copy];
  id v11 = objc_retainBlock(v10);
  [v9 addObject:v11];
}

- (void)_installWillFinishTestHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003E0EC;
    v7[3] = &unk_100062A50;
    id v8 = objc_retainBlock((id)qword_100073358);
    id v9 = v3;
    id v4 = v8;
    id v5 = [v7 copy];
    id v6 = (void *)qword_100073358;
    qword_100073358 = (uint64_t)v5;
  }
}

- (id)rootViewController
{
  v2 = [(PLPhotosApplication *)self px_firstKeyWindow];
  id v3 = [v2 rootViewController];

  return v3;
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

@end