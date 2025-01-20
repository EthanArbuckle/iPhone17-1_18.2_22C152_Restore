@interface NTKFaceSnapshotter
+ (id)defaultModernSnapshotOptions;
+ (id)renderSnapshotAndTexture:(id *)a3 fromWindow:(id)a4;
+ (id)renderSnapshotFromWindow:(id)a3;
- (NTKFaceSnapshotter)init;
- (id)viewControllerForFace:(id)a3 withOptions:(id)a4;
- (void)_hideSnapshotWindow;
- (void)_mainQueue_serviceRequest:(id)a3 completion:(id)a4;
- (void)_queue_serviceRequestIfIdle;
- (void)_setupNotificationForCollectionLoadForDevice:(id)a3 completion:(id)a4;
- (void)_showSnapshotWindowForDevice:(id)a3;
- (void)complicationCollectionDidLoad:(id)a3;
- (void)dealloc;
- (void)provideSnapshotOfFace:(id)a3 completion:(id)a4;
- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation NTKFaceSnapshotter

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_101(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.faceSnapshotRenderer" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)defaultModernSnapshotOptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"NTKSnapshotPersistableKey";
  v5[0] = MEMORY[0x1E4F1CC38];
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (NTKFaceSnapshotter)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKFaceSnapshotter;
  id v2 = [(NTKFaceSnapshotter *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__NTKFaceSnapshotter_init__block_invoke;
    block[3] = &unk_1E62BFF20;
    v6 = v2;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
  }
  return v3;
}

void __26__NTKFaceSnapshotter_init__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(1);
  v3 = (void *)NTKFaceSnapshotterSemaphore;
  NTKFaceSnapshotterSemaphore = (uint64_t)v2;

  id v4 = [NSString stringWithFormat:@"com.apple.ntkd.facesnapshotter"];
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
  v6 = (void *)NTKFaceSnapshotterQueue;
  NTKFaceSnapshotterQueue = (uint64_t)v5;

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = (void *)NTKFaceSnapshotterRequests;
  NTKFaceSnapshotterRequests = v7;

  NTKFaceSnapshotterServicingRequest = 0;
  uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v10 = (void *)NTKFaceSnapshotterComplicationCollections;
  NTKFaceSnapshotterComplicationCollections = v9;

  NTKFaceSnapshotterCompanionAppLibraryLoaded = 0;
  v11 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Waiting on NTKCompanionAppLibrary (AppConduit) so apps are known before we snapshot", buf, 2u);
  }

  v12 = +[NTKCompanionAppLibrary sharedAppLibrary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __26__NTKFaceSnapshotter_init__block_invoke_80;
  v13[3] = &unk_1E62BFF20;
  id v14 = *(id *)(a1 + 32);
  [v12 prewarmCompanionDaemonWithCompletion:v13];
}

void __26__NTKFaceSnapshotter_init__block_invoke_80(uint64_t a1)
{
  v1 = NTKFaceSnapshotterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__NTKFaceSnapshotter_init__block_invoke_2;
  block[3] = &unk_1E62BFF20;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);
}

uint64_t __26__NTKFaceSnapshotter_init__block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary loaded!", v4, 2u);
  }

  NTKFaceSnapshotterCompanionAppLibraryLoaded = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

- (void)_setupNotificationForCollectionLoadForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__NTKFaceSnapshotter__setupNotificationForCollectionLoadForDevice_completion___block_invoke;
  block[3] = &unk_1E62C0098;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__NTKFaceSnapshotter__setupNotificationForCollectionLoadForDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) nrDeviceUUID];
  if (v2)
  {
    id v3 = [(id)NTKFaceSnapshotterComplicationCollections objectForKey:v2];
    if (!v3)
    {
      id v3 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:*(void *)(a1 + 32)];
      [(id)NTKFaceSnapshotterComplicationCollections setObject:v3 forKey:v2];
      id v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        id v6 = v2;
        _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Listening for collection load of device uuid %@", (uint8_t *)&v5, 0xCu);
      }

      if (([v3 hasLoaded] & 1) == 0) {
        [v3 addObserver:*(void *)(a1 + 40)];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "dispatching to face snapshotter queue", buf, 2u);
  }

  v12 = [v8 device];
  if (v12)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke;
    v22[3] = &unk_1E62BFF20;
    v22[4] = self;
    [(NTKFaceSnapshotter *)self _setupNotificationForCollectionLoadForDevice:v12 completion:v22];
  }
  id v13 = NTKFaceSnapshotterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_3;
  block[3] = &unk_1E62C1F70;
  id v18 = v8;
  id v19 = v9;
  v20 = self;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, block);
}

void __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_2;
  block[3] = &unk_1E62BFF20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)NTKFaceSnapshotterQueue, block);
}

uint64_t __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

void __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_3(uint64_t a1)
{
  id v4 = [[NTKFaceSnapshotRequest alloc] initWithFace:*(void *)(a1 + 32) options:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  id v2 = (id)NTKFaceSnapshotterRequests;
  uint64_t v3 = objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v2, "count"), 1024, &__block_literal_global_25);
  [(id)NTKFaceSnapshotterRequests insertObject:v4 atIndex:v3];
  objc_msgSend(*(id *)(a1 + 48), "_queue_serviceRequestIfIdle");
}

uint64_t __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 options];
  uint64_t v7 = [v6 objectForKey:@"NTKSnapshotPriorityKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = [v5 options];
  id v10 = [v9 objectForKey:@"NTKSnapshotPriorityKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v11 = [v10 unsignedIntegerValue];
  }
  else {
    unint64_t v11 = 0;
  }
  if (v8 == v11)
  {
    v12 = [v4 creationDate];
    id v13 = [v5 creationDate];
    uint64_t v14 = [v12 compare:v13];
  }
  else
  {
    uint64_t v14 = v8 < v11;
  }

  return v14;
}

- (void)_queue_serviceRequestIfIdle
{
  dispatch_assert_queue_V2((dispatch_queue_t)NTKFaceSnapshotterQueue);
  if ([(id)NTKFaceSnapshotterRequests count])
  {
    if (NTKFaceSnapshotterServicingRequest == 1)
    {
      uint64_t v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v4 = "Already servicing a face snapshot request.";
LABEL_10:
        _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
      }
    }
    else
    {
      uint64_t v5 = [(id)NTKFaceSnapshotterRequests indexOfObjectPassingTest:&__block_literal_global_88];
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(id)NTKFaceSnapshotterRequests objectAtIndex:v5];
        NTKFaceSnapshotterServicingRequest = 1;
        [(id)NTKFaceSnapshotterRequests removeObjectAtIndex:v6];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_89;
        v8[3] = &unk_1E62C09C0;
        v8[4] = self;
        id v9 = v7;
        uint64_t v3 = v7;
        dispatch_async(MEMORY[0x1E4F14428], v8);

        goto LABEL_12;
      }
      uint64_t v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v4 = "No complication snapshot requests are ready.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "No face snapshot requests to service.";
      goto LABEL_10;
    }
  }
LABEL_12:
}

uint64_t __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isReady];
}

uint64_t __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_89(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_2;
  v4[3] = &unk_1E62BFF20;
  v4[4] = v2;
  return objc_msgSend(v2, "_mainQueue_serviceRequest:completion:", v1, v4);
}

void __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_2(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Signalling waiting queue that main queue is ready", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_90;
  block[3] = &unk_1E62BFF20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)NTKFaceSnapshotterQueue, block);
}

uint64_t __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_90(uint64_t a1)
{
  NTKFaceSnapshotterServicingRequest = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

- (void)provideSnapshotOfFace:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v13 = @"NTKSnapshotUIOnlyKey";
  v14[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__NTKFaceSnapshotter_provideSnapshotOfFace_completion___block_invoke;
  v11[3] = &unk_1E62C1FB8;
  id v12 = v6;
  id v10 = v6;
  [(NTKFaceSnapshotter *)self provideSnapshotOfFace:v8 options:v9 completion:v11];
}

uint64_t __55__NTKFaceSnapshotter_provideSnapshotOfFace_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)viewControllerForFace:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v7 = [NTKFaceViewController alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__NTKFaceSnapshotter_viewControllerForFace_withOptions___block_invoke;
  v11[3] = &unk_1E62C1FE0;
  id v12 = v5;
  id v8 = v5;
  id v9 = [(NTKFaceViewController *)v7 initWithFace:v6 configuration:v11];

  [(NTKFaceViewController *)v9 freeze];
  return v9;
}

void __56__NTKFaceSnapshotter_viewControllerForFace_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  [v11 setDataMode:3];
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotUIOnlyKey"];
  objc_msgSend(v11, "setSupressesNonSnapshotUI:", objc_msgSend(v3, "BOOLValue"));

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotUseCanonicalContentKey"];
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }
  [v11 setShowsCanonicalContent:v6];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotShouldUseSampleComplicationTemplatesKey"];
  objc_msgSend(v11, "setShouldUseSampleTemplate:", objc_msgSend(v7, "BOOLValue"));

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotUnadornedContentKey"];
  objc_msgSend(v11, "setShowContentForUnadornedSnapshot:", objc_msgSend(v8, "BOOLValue"));

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotForcedLockedKey"];
  objc_msgSend(v11, "setShowsLockedUI:", objc_msgSend(v9, "BOOLValue"));

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotIgnoreSnapshotImages"];
  objc_msgSend(v11, "setIgnoreSnapshotImages:", objc_msgSend(v10, "BOOLValue"));
}

- (void)_mainQueue_serviceRequest:(id)a3 completion:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v42 = [v6 face];
  v41 = [v6 options];
  uint64_t v7 = [v42 description];
  id v8 = _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
  id v9 = (char *)os_signpost_id_generate(v8);
  id v10 = v8;
  id v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_signpost_emit_with_name_impl(&dword_1BC5A9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "FaceSnapshot", "%@", (uint8_t *)&buf, 0xCu);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v13 = [v41 objectForKeyedSubscript:@"NTKSnapshotOverrideDateKey"];
  uint64_t v14 = (void *)v13;
  if (v13)
  {
    id v15 = NTKRoundDateDownToNearestSecond();

    NTKSetIdealizedDate(v15);
    uint64_t v13 = CLKSetCompanionDisplayDate();
  }
  else
  {
    id v15 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  id v16 = (void *)MEMORY[0x1C1875BE0](v13);
  v17 = +[CLKRenderingContext sharedRenderingContext];
  id v18 = [v42 device];
  [v17 setDevice:v18];

  id v19 = [(NTKFaceSnapshotter *)self viewControllerForFace:v42 withOptions:v41];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke;
  v66[3] = &unk_1E62C2008;
  v66[4] = &buf;
  [v19 enumerateComplicationControllersAndDisplaysWithBlock:v66];
  v20 = [v42 device];
  [(NTKFaceSnapshotter *)self _showSnapshotWindowForDevice:v20];

  [v19 prepareForSnapshotting];
  id v21 = [MEMORY[0x1E4FB1618] clearColor];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setBackgroundColor:v21];

  _UIAppSetStatusBarOrientation();
  _UIAppSetStatusBarHeight();
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setRootViewController:v19];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:0];
  v22 = [v19 faceView];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setNeedsLayout];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow layoutIfNeeded];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setNeedsDisplay];
  [v22 setNeedsRender];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];

  objc_initWeak(&location, self);
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  char v64 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_99;
  aBlock[3] = &unk_1E62C2030;
  v60 = v63;
  id v38 = v15;
  id v55 = v38;
  objc_copyWeak(v62, &location);
  v62[1] = *(id *)&Current;
  p_long long buf = &buf;
  id v37 = v7;
  id v56 = v37;
  v23 = v11;
  v57 = v23;
  v62[2] = v9;
  id v24 = v6;
  id v58 = v24;
  id v40 = v39;
  id v59 = v40;
  v25 = _Block_copy(aBlock);
  dispatch_time_t v26 = dispatch_time(0, 20000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_101;
  block[3] = &unk_1E62C2058;
  v53 = v63;
  id v27 = v25;
  id v52 = v27;
  v28 = (void *)MEMORY[0x1E4F14428];
  dispatch_after(v26, MEMORY[0x1E4F14428], block);

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2;
  v46[3] = &unk_1E62C20D0;
  id v29 = v19;
  id v47 = v29;
  v49 = v63;
  objc_copyWeak(&v50, &location);
  id v30 = v27;
  id v48 = v30;
  v31 = (void (**)(void))_Block_copy(v46);
  v32 = [v24 options];
  v33 = [v32 valueForKey:@"NTKSnapshotPerformPrewarmRoutineKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v24 options],
        uint64_t v35 = objc_claimAutoreleasedReturnValue(),
        [(id)v35 valueForKey:@"NTKSnapshotPerformPrewarmRoutineKey"],
        v36 = objc_claimAutoreleasedReturnValue(),
        (id)v35,
        LOBYTE(v35) = [v36 BOOLValue],
        v36,
        (v35 & 1) != 0))
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_104;
    v43[3] = &unk_1E62C2058;
    v45 = v63;
    v44 = v31;
    [v29 performPrewarmRoutine:v43];
  }
  else
  {
    v31[2](v31);
  }

  objc_destroyWeak(&v50);
  objc_destroyWeak(v62);

  _Block_object_dispose(v63, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v7 = [a3 complication];
    if ([v7 complicationType] == 31)
    {
      id v8 = [v6 display];
      id v9 = [v8 complicationTemplate];

      if (!v9)
      {
        id v10 = _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v7 clientIdentifier];
          int v12 = 138412290;
          uint64_t v13 = v11;
          _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Missing complication template for %@", (uint8_t *)&v12, 0xCu);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
    }
  }
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    if (*(void *)(a1 + 32))
    {
      NTKSetIdealizedDate(0);
      CLKSetCompanionDisplayDate();
    }
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[1] setRootViewController:0];
      [v9 _hideSnapshotWindow];
    }
    double v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
    if (v5)
    {
      [v5 size];
      id v11 = NSStringFromCGSize(v35);
      int v12 = _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
          uint64_t v13 = @" hasBlankComplication";
        }
        else {
          uint64_t v13 = &stru_1F1635E90;
        }
        uint64_t v14 = [NSString stringWithFormat:@"snapshot succeeded%@", v13];
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 134218754;
        double v27 = v10;
        __int16 v28 = 2112;
        id v29 = v14;
        __int16 v30 = 2112;
        v31 = v11;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "%.2f seconds - %@: %@ %@", buf, 0x2Au);
      }
      id v16 = *(id *)(a1 + 48);
      v17 = v16;
      os_signpost_id_t v18 = *(void *)(a1 + 104);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        int v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)long long buf = 138412546;
        double v27 = *(double *)&v11;
        __int16 v28 = 1024;
        LODWORD(v29) = v19;
        _os_signpost_emit_with_name_impl(&dword_1BC5A9000, v17, OS_SIGNPOST_INTERVAL_END, v18, "FaceSnapshot", "size=%@ hasBlankComplication=%d", buf, 0x12u);
      }
    }
    else
    {
      v20 = _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v25 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 134218498;
        double v27 = v10;
        __int16 v28 = 2112;
        id v29 = v25;
        __int16 v30 = 2112;
        v31 = v6;
        _os_log_error_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_ERROR, "%.2f seconds - snapshot failed: %@, error: %@", buf, 0x20u);
      }

      id v21 = *(id *)(a1 + 48);
      id v11 = v21;
      os_signpost_id_t v22 = *(void *)(a1 + 104);
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)long long buf = 138412290;
        double v27 = *(double *)&v6;
        _os_signpost_emit_with_name_impl(&dword_1BC5A9000, v11, OS_SIGNPOST_INTERVAL_END, v22, "FaceSnapshot", "snapshot failed: %@", buf, 0xCu);
      }
    }

    v23 = [*(id *)(a1 + 56) completion];

    if (v23)
    {
      id v24 = [*(id *)(a1 + 56) completion];
      ((void (**)(void, void, id))v24)[2](v24, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_3;
  v3[3] = &unk_1E62C20A8;
  uint64_t v5 = *(void *)(a1 + 48);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  [v2 finalizeForSnapshotting:v3];

  objc_destroyWeak(&v6);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4;
  v5[3] = &unk_1E62C2080;
  uint64_t v8 = *(void *)(a1 + 40);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] synchronize];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = (uint64_t *)(a1 + 32);
    id v4 = _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4_cold_1(v2, v5);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "finalizeForSnapshotting completed after timeout", buf, 2u);
    }

    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = (void *)MEMORY[0x1C1875BE0]();
    id v7 = [(id)objc_opt_class() renderSnapshotFromWindow:WeakRetained[1]];
    if (!v7)
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.faceSnapshotRenderer" code:4 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      goto LABEL_14;
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.faceSnapshotRenderer" code:3 userInfo:0];
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
LABEL_14:
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_104(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2_105;
  block[3] = &unk_1E62C2058;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2_105(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v1 = _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1BC5A9000, v1, OS_LOG_TYPE_DEFAULT, "preform prewarm routine finished after timeout", v3, 2u);
    }
  }
  else
  {
    long long v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
}

+ (id)renderSnapshotFromWindow:(id)a3
{
  return NTKRenderSnapshotFromWindow(a3, 3);
}

+ (id)renderSnapshotAndTexture:(id *)a3 fromWindow:(id)a4
{
  return NTKRenderSnapshotAndTextureFromWindow(a4, 3, a3);
}

- (void)_showSnapshotWindowForDevice:(id)a3
{
  id v4 = a3;
  snapshotWindow = self->_snapshotWindow;
  id v8 = v4;
  if (!snapshotWindow)
  {
    id v6 = objc_alloc_init(NTKFaceSnapshottingWindow);
    id v7 = self->_snapshotWindow;
    self->_snapshotWindow = v6;

    id v4 = v8;
    snapshotWindow = self->_snapshotWindow;
  }
  [(NTKFaceSnapshottingWindow *)snapshotWindow updateForDevice:v4];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:0];
}

- (void)_hideSnapshotWindow
{
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:1];
  snapshotWindow = self->_snapshotWindow;
  self->_snapshotWindow = 0;
}

- (void)dealloc
{
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:1];
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceSnapshotter;
  [(NTKFaceSnapshotter *)&v3 dealloc];
}

- (void)complicationCollectionDidLoad:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKFaceSnapshotter_complicationCollectionDidLoad___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)NTKFaceSnapshotterQueue, block);
}

uint64_t __52__NTKFaceSnapshotter_complicationCollectionDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

- (void).cxx_destruct
{
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "finalizeForSnapshotting failed after timeout: %@", (uint8_t *)&v3, 0xCu);
}

@end