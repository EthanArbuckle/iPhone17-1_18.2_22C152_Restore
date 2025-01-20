@interface NTKCompanionFaceRenderer
+ (id)_snapshotNameForFace:(id)a3 detailMode:(int64_t)a4;
+ (id)_storagePath;
+ (id)snapshotPathForFace:(id)a3 detailMode:(int64_t)a4;
- (BOOL)isQueueActive;
- (NSMutableArray)pendingTaskList;
- (NTKCompanionFaceRenderer)init;
- (NTKFace)currentFace;
- (id)faceBatchCompletionHandler;
- (void)_notifyFinishedFaceBatchIfNeeded;
- (void)_startNextWorkItem;
- (void)requestSnapshotOfFace:(id)a3 completion:(id)a4;
- (void)setCurrentFace:(id)a3;
- (void)setFaceBatchCompletionHandler:(id)a3;
- (void)setPendingTaskList:(id)a3;
- (void)setQueueActive:(BOOL)a3;
@end

@implementation NTKCompanionFaceRenderer

- (NTKCompanionFaceRenderer)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCompanionFaceRenderer;
  v2 = [(NTKCompanionFaceRenderer *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanotimekitcompaniond.render-queue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    pendingTaskList = v2->_pendingTaskList;
    v2->_pendingTaskList = (NSMutableArray *)v6;

    v2->_queueActive = 0;
  }
  return v2;
}

- (void)requestSnapshotOfFace:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = [(id)objc_opt_class() snapshotPathForFace:v6 detailMode:0x7FFFFFFFFFFFFFFFLL];
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    v7[2](v7);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NTKCompanionFaceRenderer_requestSnapshotOfFace_completion___block_invoke;
    block[3] = &unk_1E62C0FE0;
    id v12 = v6;
    v13 = self;
    v14 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __61__NTKCompanionFaceRenderer_requestSnapshotOfFace_completion___block_invoke(uint64_t a1)
{
  v8 = [[_NTKCompanionFaceRenderingTask alloc] initWithFace:*(void *)(a1 + 32) detailMode:0x7FFFFFFFFFFFFFFFLL completionHandler:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "addObject:");
  uint64_t v2 = +[NTKFaceView numberOfDetailModesForFaceStyle:](NTKFaceView, "numberOfDetailModesForFaceStyle:", [*(id *)(a1 + 32) faceStyle]);
  if (v2 >= 1)
  {
    uint64_t v3 = v2;
    for (uint64_t i = 0; i != v3; ++i)
    {
      v5 = *(void **)(*(void *)(a1 + 40) + 32);
      id v6 = [[_NTKCompanionFaceRenderingTask alloc] initWithFace:*(void *)(a1 + 32) detailMode:i completionHandler:0];
      [v5 addObject:v6];
    }
  }
  v7 = *(unsigned char **)(a1 + 40);
  if (!v7[24]) {
    [v7 _startNextWorkItem];
  }
}

+ (id)_snapshotNameForFace:(id)a3 detailMode:(int64_t)a4
{
  v5 = [a3 dailySnapshotKey];
  id v6 = v5;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = objc_msgSend(v5, "stringByAppendingFormat:", @"~mode%d", a4);

    id v6 = (void *)v7;
  }

  return v6;
}

+ (id)snapshotPathForFace:(id)a3 detailMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _storagePath];
  v8 = [a1 _snapshotNameForFace:v6 detailMode:a4];

  objc_super v9 = [v8 stringByAppendingPathExtension:@"png"];
  int v10 = [v7 stringByAppendingPathComponent:v9];

  return v10;
}

+ (id)_storagePath
{
  if (_storagePath_onceToken != -1) {
    dispatch_once(&_storagePath_onceToken, &__block_literal_global_123);
  }
  uint64_t v2 = (void *)_storagePath___storagePath;

  return v2;
}

void __40__NTKCompanionFaceRenderer__storagePath__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v0 = NTKCacheDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"SnapshotImages"];
  uint64_t v2 = (void *)_storagePath___storagePath;
  _storagePath___storagePath = v1;

  [v3 createDirectoryAtPath:_storagePath___storagePath withIntermediateDirectories:1 attributes:0 error:0];
}

- (void)_notifyFinishedFaceBatchIfNeeded
{
  faceBatchCompletionHandler = (void (**)(id, SEL))self->_faceBatchCompletionHandler;
  if (faceBatchCompletionHandler)
  {
    faceBatchCompletionHandler[2](faceBatchCompletionHandler, a2);
    id v4 = self->_faceBatchCompletionHandler;
    self->_faceBatchCompletionHandler = 0;
  }
}

- (void)_startNextWorkItem
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(NSMutableArray *)self->_pendingTaskList firstObject];
  if (v3)
  {
    self->_queueActive = 1;
    [(NSMutableArray *)self->_pendingTaskList removeObjectAtIndex:0];
    id v4 = [v3 completionHandler];
    int v5 = [v3 isMemberOfBatch];
    id v6 = [v3 face];
    char v7 = [v6 isEquivalentToFace:self->_currentFace];

    if (v7)
    {
      v8 = [(NTKFaceSnapshottingWindow *)self->_window rootViewController];
    }
    else
    {
      [(NTKCompanionFaceRenderer *)self _notifyFinishedFaceBatchIfNeeded];
      int v10 = objc_alloc_init(NTKFaceSnapshottingWindow);
      window = self->_window;
      self->_window = v10;

      id v12 = self->_window;
      v13 = [v3 face];
      v14 = [v13 device];
      [(NTKFaceSnapshottingWindow *)v12 updateForDevice:v14];

      v15 = [NTKFaceViewController alloc];
      v16 = [v3 face];
      v8 = [(NTKFaceViewController *)v15 initWithFace:v16 configuration:&__block_literal_global_43_0];

      [(NTKFaceSnapshottingWindow *)self->_window setRootViewController:v8];
      [(NTKFaceSnapshottingWindow *)self->_window setHidden:0];
      if (v5 && v4)
      {
        v17 = _Block_copy(v4);
        id faceBatchCompletionHandler = self->_faceBatchCompletionHandler;
        self->_id faceBatchCompletionHandler = v17;
      }
    }
    v19 = [v3 face];
    currentFace = self->_currentFace;
    self->_currentFace = v19;

    v21 = [(NTKFaceViewController *)v8 faceView];
    uint64_t v22 = [v3 detailMode];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [v21 setDetailMode:v22];
    [(NTKFaceSnapshottingWindow *)self->_window setNeedsLayout];
    [(NTKFaceSnapshottingWindow *)self->_window layoutIfNeeded];
    [(NTKFaceSnapshottingWindow *)self->_window setNeedsDisplay];
    [v21 setNeedsRender];
    [MEMORY[0x1E4F39CF8] commit];
    [MEMORY[0x1E4F39CF8] flush];
    [(NTKFaceSnapshottingWindow *)self->_window bounds];
    double v24 = v23;
    double v26 = v25;
    [(NTKFaceSnapshottingWindow *)self->_window contentScaleFactor];
    double v28 = v27;
    double v29 = v24 * v27;
    double v30 = v26 * v27;
    int v31 = [(NTKFaceSnapshottingWindow *)self->_window _contextId];
    v32 = objc_opt_class();
    v33 = [v3 face];
    v34 = [v32 _snapshotNameForFace:v33 detailMode:v22];

    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2;
    block[3] = &unk_1E62C6EB0;
    int v46 = v31;
    double v42 = v28;
    double v43 = v29;
    double v44 = v30;
    void block[4] = self;
    id v39 = v3;
    id v40 = v34;
    uint64_t v45 = v22;
    id v41 = v4;
    char v47 = v5;
    id v36 = v4;
    id v37 = v34;
    dispatch_async(workQueue, block);
  }
  else
  {
    self->_queueActive = 0;
    objc_super v9 = self->_currentFace;
    self->_currentFace = 0;

    [(NTKCompanionFaceRenderer *)self _notifyFinishedFaceBatchIfNeeded];
  }
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDataMode:3];
  [v2 setShowsCanonicalContent:1];
  [v2 freeze];
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2(uint64_t a1)
{
  location[6] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1C1875BE0]();
  int v33 = *(_DWORD *)(a1 + 96);
  CATransform3DMakeScale(&v34, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  id v3 = [MEMORY[0x1E4F39B60] mainDisplay];
  [v3 name];

  float v4 = *(double *)(a1 + 72);
  unint64_t v5 = llroundf(v4);
  float v6 = *(double *)(a1 + 80);
  unint64_t v7 = llroundf(v6);
  uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  unint64_t v9 = AlignedBytesPerRow * v7;
  v35[0] = *MEMORY[0x1E4F2F2C0];
  int v10 = [NSNumber numberWithUnsignedLong:v5];
  location[0] = v10;
  v35[1] = *MEMORY[0x1E4F2F0E8];
  v11 = [NSNumber numberWithUnsignedLong:v7];
  location[1] = v11;
  v35[2] = *MEMORY[0x1E4F2EFE0];
  id v12 = [NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
  location[2] = v12;
  v35[3] = *MEMORY[0x1E4F2EFB8];
  v13 = [NSNumber numberWithUnsignedLong:v9];
  uint64_t v14 = *MEMORY[0x1E4F2EFD8];
  location[3] = v13;
  location[4] = &unk_1F16E2760;
  uint64_t v15 = *MEMORY[0x1E4F2F150];
  v35[4] = v14;
  v35[5] = v15;
  location[5] = &unk_1F16E2778;
  CFDictionaryRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:location forKeys:v35 count:6];

  v17 = IOSurfaceCreate(v16);
  if (v17)
  {
    IOSurfaceLock(v17, 0, 0);
    CARenderServerRenderDisplayClientListWithTransformList();
    IOSurfaceUnlock(v17, 0, 0);
    v18 = (CGImage *)_UICreateCGImageFromIOSurfaceWithOptions();
    CFRelease(v17);
    if (v18)
    {
      v19 = (UIImage *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v18];
      CGImageRelease(v18);
      v20 = objc_opt_class();
      v21 = [*(id *)(a1 + 40) face];
      uint64_t v22 = [v20 snapshotPathForFace:v21 detailMode:*(void *)(a1 + 88)];

      double v23 = UIImagePNGRepresentation(v19);
      id v32 = 0;
      char v24 = [v23 writeToFile:v22 options:1 error:&v32];
      id v25 = v32;

      if ((v24 & 1) == 0)
      {
        double v26 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_3(a1, (uint64_t)v25, v26);
        }
      }
      goto LABEL_13;
    }
  }
  else
  {
    double v27 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_2(v27);
    }
  }
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v19 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR)) {
    __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_1(a1, &v19->super);
  }
LABEL_13:

  objc_initWeak(location, *(id *)(a1 + 32));
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_48;
  v28[3] = &unk_1E62C6E88;
  id v29 = *(id *)(a1 + 56);
  char v31 = *(unsigned char *)(a1 + 100);
  objc_copyWeak(&v30, location);
  dispatch_async(MEMORY[0x1E4F14428], v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(location);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && !*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startNextWorkItem];
}

- (NSMutableArray)pendingTaskList
{
  return self->_pendingTaskList;
}

- (void)setPendingTaskList:(id)a3
{
}

- (BOOL)isQueueActive
{
  return self->_queueActive;
}

- (void)setQueueActive:(BOOL)a3
{
  self->_queueActive = a3;
}

- (NTKFace)currentFace
{
  return self->_currentFace;
}

- (void)setCurrentFace:(id)a3
{
}

- (id)faceBatchCompletionHandler
{
  return self->_faceBatchCompletionHandler;
}

- (void)setFaceBatchCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_faceBatchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentFace, 0);
  objc_storeStrong((id *)&self->_pendingTaskList, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "failed to generate snapshot image for face %@", (uint8_t *)&v3, 0xCu);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "couldn't create IOSurface for snapshot", v1, 2u);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "failed to write image for face %@: %@", (uint8_t *)&v4, 0x16u);
}

@end