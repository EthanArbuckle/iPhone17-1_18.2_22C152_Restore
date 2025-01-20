@interface SBTouchRegionManager
+ (id)sharedInstance;
- (CGAffineTransform)_queue_hitTestRegionTransformWithDisplayLayout:(SEL)a3;
- (CGAffineTransform)rootWindowTransform;
- (SBTouchRegionManager)init;
- (double)edgeTouchRegionBuffer;
- (double)touchRegionBuffer;
- (id)_initWithBKSInterface:(id)a3 displayLayoutMonitor:(id)a4;
- (id)_queue_calculateBorderHitTestRegionsWithDisplayLayout:(id)a3;
- (id)_queue_calculateHitTestRegionsFromSceneRects:(id)a3;
- (id)_queue_calculateTouchRegionsFromSceneRects:(id)a3;
- (id)_queue_floatingHitTestRegionForLayoutRect:(CGRect)a3;
- (id)_queue_transformHitTestRegions:(id)a3 withDisplayLayout:(id)a4;
- (id)displayLayoutMonitor;
- (void)_queue_displayLayoutDidUpdate:(id)a3;
- (void)_queue_handleChamoisUILayout:(id)a3;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setEdgeTouchRegionBuffer:(double)a3;
- (void)setRootWindowTransform:(CGAffineTransform *)a3;
- (void)setTouchRegionBuffer:(double)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBTouchRegionManager

uint64_t __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_displayLayoutDidUpdate:", *(void *)(a1 + 40));
}

void __54__SBTouchRegionManager__queue_displayLayoutDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 layoutRole];
  if ((unint64_t)(v3 - 7) >= 2)
  {
    if (v3 == 2)
    {
      [v14 referenceFrame];
      v5 = v14;
      uint64_t v10 = *(void *)(a1 + 56);
    }
    else
    {
      BOOL v4 = v3 == 1;
      v5 = v14;
      if (!v4) {
        goto LABEL_11;
      }
      [v14 referenceFrame];
      v5 = v14;
      uint64_t v10 = *(void *)(a1 + 48);
    }
    v13 = *(void **)(v10 + 8);
    v13[4] = v6;
    v13[5] = v7;
    v13[6] = v8;
    v13[7] = v9;
    goto LABEL_11;
  }
  v11 = *(void **)(a1 + 32);
  [v14 referenceFrame];
  v12 = objc_msgSend(v11, "_queue_floatingHitTestRegionForLayoutRect:");
  if (v12) {
    [*(id *)(a1 + 40) addObject:v12];
  }

  v5 = v14;
LABEL_11:
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

- (void)_queue_displayLayoutDidUpdate:(id)a3
{
  id v5 = a3;
  id v6 = [v5 displayConfiguration];
  int v7 = [v6 isMainDisplay];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v44 = 0;
    v45 = (CGRect *)&v44;
    uint64_t v46 = 0x4010000000;
    v47 = &unk_1D90ED3C6;
    uint64_t v10 = (CGFloat *)MEMORY[0x1E4F1DB28];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v48 = *MEMORY[0x1E4F1DB28];
    long long v49 = v11;
    uint64_t v38 = 0;
    v39 = (CGRect *)&v38;
    uint64_t v40 = 0x4010000000;
    v41 = &unk_1D90ED3C6;
    long long v42 = v48;
    long long v43 = v11;
    v12 = [v5 elements];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __54__SBTouchRegionManager__queue_displayLayoutDidUpdate___block_invoke;
    v34[3] = &unk_1E6B02488;
    v36 = &v44;
    v37 = &v38;
    v34[4] = self;
    id v13 = v8;
    id v35 = v13;
    [v12 enumerateObjectsUsingBlock:v34];

    CGFloat v14 = *v10;
    CGFloat v15 = v10[1];
    CGFloat v16 = v10[2];
    CGFloat v17 = v10[3];
    v50.origin.x = *v10;
    v50.origin.y = v15;
    v50.size.width = v16;
    v50.size.height = v17;
    if (!CGRectEqualToRect(v50, v45[1]))
    {
      v18 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v45[1].origin.x, v45[1].origin.y, v45[1].size.width, v45[1].size.height);
      [v9 addObject:v18];
    }
    if (!CGRectIntersectsRect(v45[1], v39[1]))
    {
      v51.origin.x = v14;
      v51.origin.y = v15;
      v51.size.width = v16;
      v51.size.height = v17;
      if (!CGRectEqualToRect(v51, v39[1]))
      {
        v19 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v39[1].origin.x, v39[1].origin.y, v39[1].size.width, v39[1].size.height);
        [v9 addObject:v19];
      }
    }
    v20 = [(SBTouchRegionManager *)self _queue_calculateHitTestRegionsFromSceneRects:v9];
    v21 = [v20 allObjects];
    [v13 addObjectsFromArray:v21];

    v22 = [v5 displayConfiguration];
    if ([v22 isMainDisplay])
    {
      long long v23 = *(_OWORD *)&self->_queue_rootWindowTransform.c;
      *(_OWORD *)&v33.a = *(_OWORD *)&self->_queue_rootWindowTransform.a;
      *(_OWORD *)&v33.c = v23;
      *(_OWORD *)&v33.tx = *(_OWORD *)&self->_queue_rootWindowTransform.tx;
      BOOL IsIdentity = CGAffineTransformIsIdentity(&v33);

      if (IsIdentity)
      {
LABEL_15:
        v29 = [v5 displayConfiguration];
        v30 = [v29 hardwareIdentifier];

        [(SBBackBoardServicesInterface *)self->_queue_bksInterface setHitTestRegions:v13 forDisplay:v30];
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v44, 8);

        goto LABEL_16;
      }
      v22 = [(SBTouchRegionManager *)self _queue_transformHitTestRegions:v13 withDisplayLayout:v5];
      uint64_t v25 = [v22 count];
      if (v25 != [v13 count])
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTouchRegionManager.m", 507, @"Number of hit test regions before and after applying the root window transform are mismatched [%lu][%lu]", objc_msgSend(v13, "count"), objc_msgSend(v22, "count"));
      }
      [v13 removeAllObjects];
      v26 = [v22 allObjects];
      [v13 addObjectsFromArray:v26];

      v27 = [(SBTouchRegionManager *)self _queue_calculateBorderHitTestRegionsWithDisplayLayout:v5];
      if ([v27 count] != 4)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTouchRegionManager.m", 513, @"Unexpected number of border hit test regions [%lu]", objc_msgSend(v27, "count"));
      }
      v28 = [v27 allObjects];
      [v13 addObjectsFromArray:v28];
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_queue_calculateHitTestRegionsFromSceneRects:(id)a3
{
  double queue_touchRegionBuffer = self->_queue_touchRegionBuffer;
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  uint64_t v8 = [v6 set];
  id v9 = [(SBTouchRegionManager *)self _queue_calculateTouchRegionsFromSceneRects:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke;
  v15[3] = &unk_1E6B02460;
  double v19 = queue_touchRegionBuffer;
  SEL v20 = a2;
  id v16 = v9;
  CGFloat v17 = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  [v7 enumerateObjectsUsingBlock:v15];

  v12 = v18;
  id v13 = v10;

  return v13;
}

- (id)_queue_calculateTouchRegionsFromSceneRects:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  double queue_touchRegionBuffer = self->_queue_touchRegionBuffer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke;
  v12[3] = &unk_1E6B02410;
  id v13 = v4;
  double v15 = queue_touchRegionBuffer;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v8 enumerateObjectsUsingBlock:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_msgSend(v7, "bs_CGRectValue");
  uint64_t v4 = v3;
  if (BSFloatLessThanFloat() && BSFloatGreaterThanFloat())
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    id v6 = *(void **)(a1 + 32);
    id v5 = (id *)(a1 + 32);
    [v6 removeAllObjects];
  }
  else
  {
    if (!BSFloatEqualToFloat()) {
      goto LABEL_7;
    }
    id v5 = (id *)(a1 + 32);
  }
  [*v5 addObject:v7];
LABEL_7:
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_msgSend(v7, "bs_CGRectValue");
  uint64_t v4 = v3;
  if (BSFloatLessThanFloat() && BSFloatGreaterThanFloat())
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    id v6 = *(void **)(a1 + 32);
    id v5 = (id *)(a1 + 32);
    [v6 removeAllObjects];
  }
  else
  {
    if (!BSFloatEqualToFloat()) {
      goto LABEL_7;
    }
    id v5 = (id *)(a1 + 32);
  }
  [*v5 addObject:v7];
LABEL_7:
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "bs_CGRectValue");
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0x7FEFFFFFFFFFFFFFLL;
  v12 = [MEMORY[0x1E4F1CA80] set];
  id v13 = *(void **)(a1 + 32);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_2;
  v40[3] = &unk_1E6B023C0;
  long long v42 = v47;
  uint64_t v43 = v5;
  uint64_t v44 = v7;
  uint64_t v45 = v9;
  uint64_t v46 = v11;
  id v14 = v12;
  id v41 = v14;
  [v13 enumerateObjectsUsingBlock:v40];
  if ([v14 count])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_3;
    v33[3] = &unk_1E6B023E8;
    uint64_t v35 = v5;
    uint64_t v36 = v7;
    uint64_t v37 = v9;
    uint64_t v38 = v11;
    uint64_t v39 = *(void *)(a1 + 48);
    id v34 = *(id *)(a1 + 40);
    [v14 enumerateObjectsUsingBlock:v33];
  }
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0x7FEFFFFFFFFFFFFFLL;
  double v15 = [MEMORY[0x1E4F1CA80] set];
  id v16 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_4;
  v25[3] = &unk_1E6B023C0;
  v27 = v32;
  uint64_t v28 = v5;
  uint64_t v29 = v7;
  uint64_t v30 = v9;
  uint64_t v31 = v11;
  id v17 = v15;
  id v26 = v17;
  [v16 enumerateObjectsUsingBlock:v25];
  if ([v17 count])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_5;
    v18[3] = &unk_1E6B023E8;
    uint64_t v20 = v5;
    uint64_t v21 = v7;
    uint64_t v22 = v9;
    uint64_t v23 = v11;
    uint64_t v24 = *(void *)(a1 + 48);
    id v19 = *(id *)(a1 + 40);
    [v17 enumerateObjectsUsingBlock:v18];
  }
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v47, 8);
}

void __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "bs_CGRectValue");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v12 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke_2;
  v18[3] = &unk_1E6B02438;
  *(double *)&v18[9] = v4;
  *(double *)&v18[10] = v6;
  *(double *)&v18[11] = v8;
  *(double *)&v18[12] = v10;
  v18[13] = *(void *)(a1 + 56);
  v18[6] = &v31;
  v18[7] = &v19;
  v18[8] = &v27;
  v18[14] = *(void *)(a1 + 64);
  void v18[4] = *(void *)(a1 + 40);
  v18[5] = &v23;
  [v12 enumerateObjectsUsingBlock:v18];
  if (*((unsigned char *)v32 + 24))
  {
    double v13 = *(double *)(a1 + 56);
    double v14 = v11 - v13;
  }
  else
  {
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v14 = v11;
  }
  if (*((unsigned char *)v28 + 24)) {
    double v14 = v14 - *(double *)(a1 + 56);
  }
  if (*((unsigned char *)v24 + 24))
  {
    double v15 = *(double *)(a1 + 56);
    double v16 = v9 - v15;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v16 = v9;
  }
  if (*((unsigned char *)v20 + 24)) {
    double v16 = v16 - *(double *)(a1 + 56);
  }
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:exclusiveTouchSubRect:", v5, v7, v9, v11, v15, v13, v16, v14);
  [*(id *)(a1 + 48) addObject:v17];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
}

void __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) displayConfiguration];
  id v3 = [v2 identity];

  double v4 = [(id)SBApp windowSceneManager];
  double v5 = [v4 windowSceneForDisplayIdentity:v3];

  double v6 = [v5 switcherController];
  int v7 = [v6 isChamoisWindowingUIEnabled];

  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(NSObject **)(v8 + 8);
  if (v7)
  {
    double v10 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    double v11 = __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2;
  }
  else
  {
    double v10 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    double v11 = __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_3;
  }
  v10[2] = v11;
  v10[3] = &unk_1E6AF5290;
  v10[4] = v8;
  v10[5] = *(id *)(a1 + 32);
  dispatch_async(v9, v10);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1) {
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_165);
  }
  v2 = (void *)sharedInstance___shared;
  return v2;
}

uint64_t __38__SBTouchRegionManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBTouchRegionManager);
  v1 = (void *)sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v0;

  return kdebug_trace();
}

- (SBTouchRegionManager)init
{
  id v3 = objc_alloc_init(SBBackBoardServicesInterface);
  double v4 = [MEMORY[0x1E4F62940] sharedMonitorForDisplayType:0];
  double v5 = [(SBTouchRegionManager *)self _initWithBKSInterface:v3 displayLayoutMonitor:v4];

  return v5;
}

- (id)_initWithBKSInterface:(id)a3 displayLayoutMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBTouchRegionManager;
  double v9 = [(SBTouchRegionManager *)&v24 init];
  if (v9)
  {
    double v10 = +[SBMedusaDomain rootSettings];
    uint64_t v11 = [v10 medusa1oSettings];
    medusaSettings = v9->_medusaSettings;
    v9->_medusaSettings = (SBMedusa1oSettings *)v11;

    [(PTSettings *)v9->_medusaSettings addKeyObserver:v9];
    uint64_t v13 = +[SBScreenSharingOverlayUIDomain rootSettings];
    screenSharingSettings = v9->_screenSharingSettings;
    v9->_screenSharingSettings = (SBScreenSharingOverlayUISettings *)v13;

    [(PTSettings *)v9->_screenSharingSettings addKeyObserver:v9];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)Serial;

    objc_storeStrong((id *)&v9->_queue_bksInterface, a3);
    [(SBMedusa1oSettings *)v9->_medusaSettings gapSwipeBuffer];
    v9->_double queue_touchRegionBuffer = v17;
    [(SBScreenSharingOverlayUISettings *)v9->_screenSharingSettings edgeSwipeBuffer];
    v9->_queue_edgeTouchRegionBuffer = v18;
    objc_storeStrong((id *)&v9->_queue_displayLayoutMonitor, a4);
    [(FBSDisplayLayoutMonitor *)v9->_queue_displayLayoutMonitor addObserver:v9];
    uint64_t v19 = MEMORY[0x1E4F1DAB8];
    long long v20 = *MEMORY[0x1E4F1DAB8];
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v9->_rootWindowTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v9->_rootWindowTransform.c = v21;
    long long v22 = *(_OWORD *)(v19 + 32);
    *(_OWORD *)&v9->_rootWindowTransform.tx = v22;
    *(_OWORD *)&v9->_queue_rootWindowTransform.a = v20;
    *(_OWORD *)&v9->_queue_rootWindowTransform.c = v21;
    *(_OWORD *)&v9->_queue_rootWindowTransform.tx = v22;
  }

  return v9;
}

- (void)dealloc
{
  id v3 = self->_queue;
  double v4 = self->_queue_bksInterface;
  double v5 = self->_queue_displayLayoutMonitor;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBTouchRegionManager_dealloc__block_invoke;
  block[3] = &unk_1E6AF4E00;
  uint64_t v11 = v4;
  v12 = v5;
  uint64_t v13 = v3;
  double v6 = v3;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);

  v9.receiver = self;
  v9.super_class = (Class)SBTouchRegionManager;
  [(SBTouchRegionManager *)&v9 dealloc];
}

id __31__SBTouchRegionManager_dealloc__block_invoke()
{
  id v0 = self;
  id v1 = self;
  return self;
}

- (double)touchRegionBuffer
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SBTouchRegionManager_touchRegionBuffer__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __41__SBTouchRegionManager_touchRegionBuffer__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 96);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setTouchRegionBuffer:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SBTouchRegionManager_setTouchRegionBuffer___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __45__SBTouchRegionManager_setTouchRegionBuffer___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 96) = result;
  return result;
}

- (double)edgeTouchRegionBuffer
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SBTouchRegionManager_edgeTouchRegionBuffer__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __45__SBTouchRegionManager_edgeTouchRegionBuffer__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 104);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setEdgeTouchRegionBuffer:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SBTouchRegionManager_setEdgeTouchRegionBuffer___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __49__SBTouchRegionManager_setEdgeTouchRegionBuffer___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 104) = result;
  return result;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBTouchRegionManager_setDisplayLayoutMonitor___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void *__48__SBTouchRegionManager_setDisplayLayoutMonitor___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double result = *(void **)(*(void *)(a1 + 40) + 24);
  if (v2 != result)
  {
    objc_msgSend(result, "removeObserver:");
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 32));
    id v4 = *(void **)(*(void *)(a1 + 40) + 24);
    return objc_msgSend(v4, "addObserver:");
  }
  return result;
}

- (void)setRootWindowTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v6 = *(_OWORD *)&self->_rootWindowTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_rootWindowTransform.a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_rootWindowTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v7 = *(_OWORD *)&a3->a;
    long long v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_rootWindowTransform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_rootWindowTransform.tx = v8;
    *(_OWORD *)&self->_rootWindowTransform.a = v7;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SBTouchRegionManager_setRootWindowTransform___block_invoke;
    block[3] = &unk_1E6AFAB40;
    void block[4] = self;
    long long v10 = *(_OWORD *)&a3->c;
    long long v12 = *(_OWORD *)&a3->a;
    long long v13 = v10;
    long long v14 = *(_OWORD *)&a3->tx;
    dispatch_async(queue, block);
  }
}

void __47__SBTouchRegionManager_setRootWindowTransform___block_invoke(uint64_t a1)
{
  v2 = *(_OWORD **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 72);
  v2[4] = *(_OWORD *)(a1 + 56);
  v2[5] = v4;
  v2[3] = v3;
  long long v5 = [*(id *)(*(void *)(a1 + 32) + 24) currentLayout];
  long long v6 = [v5 display];
  long long v7 = [v6 identity];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_2;
  block[3] = &unk_1E6AF4E00;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_2(uint64_t a1)
{
  v2 = [(id)SBApp windowSceneManager];
  long long v3 = [v2 windowSceneForDisplayIdentity:*(void *)(a1 + 32)];

  long long v4 = [v3 switcherController];
  char v5 = [v4 isChamoisWindowingUIEnabled];

  uint64_t v6 = *(void *)(a1 + 40);
  long long v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_3;
  block[3] = &unk_1E6AF5770;
  char v10 = v5;
  void block[4] = v6;
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v7, block);
}

uint64_t __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return objc_msgSend(v3, "_queue_handleChamoisUILayout:", v4);
  }
  else {
    return objc_msgSend(v3, "_queue_displayLayoutDidUpdate:", v4);
  }
}

- (id)displayLayoutMonitor
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__54;
  char v10 = __Block_byref_object_dispose__54;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SBTouchRegionManager_displayLayoutMonitor__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SBTouchRegionManager_displayLayoutMonitor__block_invoke(uint64_t a1)
{
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bs_CGRectValue");
  double v4 = v3;
  double y = v14.origin.y;
  v14.origin.x = *(CGFloat *)(a1 + 40);
  v16.origin.double y = *(CGFloat *)(a1 + 48);
  v16.size.width = *(CGFloat *)(a1 + 56);
  v16.size.double height = *(CGFloat *)(a1 + 64);
  v16.origin.x = v14.origin.x;
  CGRect v15 = CGRectIntersection(v14, v16);
  double v6 = v15.origin.y;
  double height = v15.size.height;
  if (!CGRectIsNull(v15))
  {
    double v8 = *(double *)(a1 + 72);
    id v9 = *(void **)(a1 + 32);
    char v10 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", *(double *)(a1 + 40) + *(double *)(a1 + 56) - v8, v6, v8, height);
    [v9 addObject:v10];

    id v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v4, y, v8, height);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 addObject:v12];
  }
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bs_CGRectValue");
  double x = v14.origin.x;
  double v5 = v4;
  v16.origin.double x = *(CGFloat *)(a1 + 40);
  v14.origin.double y = *(CGFloat *)(a1 + 48);
  v16.size.double width = *(CGFloat *)(a1 + 56);
  v16.size.double height = *(CGFloat *)(a1 + 64);
  v16.origin.double y = v14.origin.y;
  CGRect v15 = CGRectIntersection(v14, v16);
  double v6 = v15.origin.x;
  double width = v15.size.width;
  if (!CGRectIsNull(v15))
  {
    double v8 = *(double *)(a1 + 72);
    id v9 = *(void **)(a1 + 32);
    char v10 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v6, *(double *)(a1 + 48) + *(double *)(a1 + 64) - v8, width, v8);
    [v9 addObject:v10];

    id v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", x, v5, width, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 addObject:v12];
  }
}

void __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bs_CGRectValue");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v27.origin.double x = v3;
  v27.origin.double y = v5;
  v27.size.double width = v7;
  v27.size.double height = v9;
  CGRect v25 = CGRectIntersection(*(CGRect *)(a1 + 72), v27);
  double x = v25.origin.x;
  double y = v25.origin.y;
  if (!CGRectIsNull(v25))
  {
    double v13 = *(double *)(a1 + 72);
    double v14 = *(double *)(a1 + 80);
    if (v13 == x && v14 == y)
    {
      if (BSFloatEqualToFloat())
      {
        uint64_t v18 = *(void *)(a1 + 40);
        goto LABEL_14;
      }
      if (BSFloatEqualToFloat())
      {
        uint64_t v18 = *(void *)(a1 + 48);
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 88);
      uint64_t v17 = *(void *)(a1 + 96);
      CGRectGetMaxX(*(CGRect *)&v13);
      if (BSFloatEqualToFloat())
      {
        uint64_t v18 = *(void *)(a1 + 56);
LABEL_14:
        *(unsigned char *)(*(void *)(v18 + 8) + 24) = 1;
        return;
      }
      CGRectGetMaxY(*(CGRect *)(a1 + 72));
      if (BSFloatEqualToFloat())
      {
        uint64_t v18 = *(void *)(a1 + 64);
        goto LABEL_14;
      }
    }
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = *(void *)(a1 + 112);
    uint64_t v20 = *(void *)(a1 + 32);
    v26.origin.double x = v4;
    v26.origin.double y = v6;
    v26.size.double width = v8;
    v26.size.double height = v10;
    long long v21 = NSStringFromCGRect(v26);
    long long v22 = NSStringFromCGRect(*(CGRect *)(a1 + 72));
    [v23 handleFailureInMethod:v19, v20, @"SBTouchRegionManager.m", 414, @"This touchRegion: %@ doesn't intersect this rect along the side: %@", v21, v22 object file lineNumber description];
  }
}

- (id)_queue_floatingHitTestRegionForLayoutRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    CGFloat v8 = 0;
  }
  else
  {
    double queue_touchRegionBuffer = self->_queue_touchRegionBuffer;
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRect v17 = CGRectInset(v16, -queue_touchRegionBuffer, 0.0);
    double v10 = v17.origin.x;
    double v11 = v17.origin.y;
    double v12 = v17.size.width;
    double v13 = v17.size.height;
    v17.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v17.origin.CGFloat y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    CGRect v18 = CGRectInset(v17, queue_touchRegionBuffer, 0.0);
    CGFloat v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:exclusiveTouchSubRect:", v10, v11, v12, v13, v18.origin.x, 0.0, v18.size.width, v13);
  }
  return v8;
}

- (void)_queue_handleChamoisUILayout:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CGFloat v6 = [v5 displayConfiguration];
  CGFloat v7 = [v6 hardwareIdentifier];

  CGFloat v8 = [v5 displayConfiguration];
  if (![v8 isMainDisplay])
  {

    goto LABEL_9;
  }
  long long v9 = *(_OWORD *)&self->_queue_rootWindowTransform.c;
  *(_OWORD *)&v29.a = *(_OWORD *)&self->_queue_rootWindowTransform.a;
  *(_OWORD *)&v29.c = v9;
  *(_OWORD *)&v29.tCGFloat x = *(_OWORD *)&self->_queue_rootWindowTransform.tx;
  BOOL IsIdentity = CGAffineTransformIsIdentity(&v29);

  if (IsIdentity)
  {
LABEL_9:
    [(SBBackBoardServicesInterface *)self->_queue_bksInterface setHitTestRegions:MEMORY[0x1E4F1CBF0] forDisplay:v7];
    goto LABEL_10;
  }
  double v11 = [MEMORY[0x1E4F1CA48] array];
  double v12 = [v5 displayConfiguration];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:", v14, v16, v18, v20);
  objc_msgSend(v21, "setExclusiveTouchNormalizedSubRect:", 0.0, 0.0, 1.0, 1.0);
  v30[0] = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v23 = [(SBTouchRegionManager *)self _queue_transformHitTestRegions:v22 withDisplayLayout:v5];

  if ([v23 count] != 1)
  {
    CGRect v27 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTouchRegionManager.m", 537, @"Unexpected number of transformed hit test regions [%lu]", objc_msgSend(v23, "count"));
  }
  objc_super v24 = [v23 allObjects];
  [v11 addObjectsFromArray:v24];

  CGRect v25 = [(SBTouchRegionManager *)self _queue_calculateBorderHitTestRegionsWithDisplayLayout:v5];
  if ([v25 count] != 4)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTouchRegionManager.m", 542, @"Unexpected number of border hit test regions [%lu]", objc_msgSend(v25, "count"));
  }
  CGRect v26 = [v25 allObjects];
  [v11 addObjectsFromArray:v26];

  [(SBBackBoardServicesInterface *)self->_queue_bksInterface setHitTestRegions:v11 forDisplay:v7];
LABEL_10:
}

- (CGAffineTransform)_queue_hitTestRegionTransformWithDisplayLayout:(SEL)a3
{
  id v6 = a4;
  CGFloat v7 = [v6 displayConfiguration];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  double v12 = v11 * self->_queue_rootWindowTransform.c + self->_queue_rootWindowTransform.a * v9;
  double v13 = v11 * self->_queue_rootWindowTransform.d + self->_queue_rootWindowTransform.b * v9;
  double v14 = [v6 displayConfiguration];
  [v14 pointScale];
  double v16 = v15;

  double v17 = [v6 displayConfiguration];

  [v17 nativeOrientation];
  double v19 = v18;

  double v20 = 6.28318531 - v19;
  memset(&v29.c, 0, 32);
  if (v19 == 0.0) {
    double v20 = 0.0;
  }
  *(_OWORD *)&v29.a = 0uLL;
  CGAffineTransformMakeRotation(&v27, v20);
  UIIntegralTransform();
  double result = CGAffineTransformScale(&v29, &v28, 1.0 / v16, 1.0 / v16);
  tCGFloat x = self->_queue_rootWindowTransform.tx;
  tCGFloat y = self->_queue_rootWindowTransform.ty;
  CGFloat v24 = v29.tx + ty * v29.c + v29.a * tx;
  CGFloat v25 = v29.ty + ty * v29.d + v29.b * tx;
  long long v26 = *(_OWORD *)&self->_queue_rootWindowTransform.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->_queue_rootWindowTransform.a;
  *(_OWORD *)&retstr->c = v26;
  retstr->tCGFloat x = v24 + (v9 - v12) * 0.5;
  retstr->tCGFloat y = v25 + (v11 - v13) * 0.5;
  return result;
}

- (id)_queue_transformHitTestRegions:(id)a3 withDisplayLayout:(id)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  [(SBTouchRegionManager *)self _queue_hitTestRegionTransformWithDisplayLayout:a4];
  CGFloat v7 = [MEMORY[0x1E4F1CA80] set];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  long long v12 = v15;
  long long v13 = v16;
  v10[2] = __73__SBTouchRegionManager__queue_transformHitTestRegions_withDisplayLayout___block_invoke;
  v10[3] = &unk_1E6B024B0;
  long long v14 = v17;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __73__SBTouchRegionManager__queue_transformHitTestRegions_withDisplayLayout___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3 = (objc_class *)MEMORY[0x1E4F4F338];
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 rect];
  long long v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v16.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v16.c = v6;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)(a1 + 72);
  CGRect v18 = CGRectApplyAffineTransform(v17, &v16);
  CGFloat v7 = objc_msgSend(v5, "initWithRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  [v4 exclusiveTouchNormalizedSubRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v7, "setExclusiveTouchNormalizedSubRect:", v9, v11, v13, v15);
  [*(id *)(a1 + 32) addObject:v7];
}

- (id)_queue_calculateBorderHitTestRegionsWithDisplayLayout:(id)a3
{
  double queue_edgeTouchRegionBuffer = self->_queue_edgeTouchRegionBuffer;
  id v5 = a3;
  long long v6 = [v5 displayConfiguration];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;

  [(SBTouchRegionManager *)self _queue_hitTestRegionTransformWithDisplayLayout:v5];
  v53.origin.double x = v8;
  double v49 = v12;
  v53.origin.double y = v10;
  v53.size.double width = v12;
  v53.size.double height = v14;
  CGRect v54 = CGRectApplyAffineTransform(v53, &v51);
  double x = v54.origin.x;
  double y = v54.origin.y;
  double width = v54.size.width;
  double height = v54.size.height;
  CGAffineTransform v16 = [MEMORY[0x1E4F1CA80] set];
  double v50 = v8;
  double v46 = x;
  double v17 = x - v8;
  CGRect v18 = (double *)MEMORY[0x1E4F1DB28];
  if (x - v8 <= queue_edgeTouchRegionBuffer)
  {
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v19 = v17 - queue_edgeTouchRegionBuffer;
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = v14;
  }
  id v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:exclusiveTouchSubRect:", v50, v10, v17, v14, v20, v21, v19, v22);
  [v16 addObject:v23];
  double v24 = v46 + width;
  double v25 = v50 + v49 - (v46 + width);
  if (v25 <= queue_edgeTouchRegionBuffer)
  {
    double v27 = *v18;
    double v26 = v18[1];
    double v28 = v18[3];
    double v44 = v18[2];
  }
  else
  {
    double v44 = v25 - queue_edgeTouchRegionBuffer;
    double v26 = 0.0;
    double v27 = queue_edgeTouchRegionBuffer;
    double v28 = v14;
  }
  double v47 = v14;
  CGAffineTransform v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:exclusiveTouchSubRect:", v24, v10, v25, v14, v27, v26, v44, v28);
  [v16 addObject:v29];
  double v30 = y - v10;
  if (y - v10 <= queue_edgeTouchRegionBuffer)
  {
    double v32 = *v18;
    double v33 = v18[1];
    double v35 = v18[2];
    double v31 = v18[3];
    double v34 = v49;
  }
  else
  {
    double v31 = v30 - queue_edgeTouchRegionBuffer;
    double v32 = 0.0;
    double v33 = 0.0;
    double v34 = v49;
    double v35 = v49;
  }
  uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:exclusiveTouchSubRect:", v50, v10, v34, v30, v32, v33, v35, v31);
  [v16 addObject:v36];
  double v37 = v10 + v47 - (y + height);
  if (v37 <= queue_edgeTouchRegionBuffer)
  {
    double v39 = *v18;
    double queue_edgeTouchRegionBuffer = v18[1];
    double v40 = v34;
    double v34 = v18[2];
    double v38 = v18[3];
  }
  else
  {
    double v38 = v37 - queue_edgeTouchRegionBuffer;
    double v39 = 0.0;
    double v40 = v34;
  }
  id v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F338]), "initWithRect:exclusiveTouchSubRect:", v50, y + height, v40, v37, v39, queue_edgeTouchRegionBuffer, v34, v38);
  [v16 addObject:v41];

  return v16;
}

uint64_t __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleChamoisUILayout:", *(void *)(a1 + 40));
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  double v7 = (SBScreenSharingOverlayUISettings *)a3;
  id v6 = a4;
  if ((SBScreenSharingOverlayUISettings *)self->_medusaSettings == v7
    && [v6 isEqual:@"gapSwipeBuffer"])
  {
    [(SBMedusa1oSettings *)self->_medusaSettings gapSwipeBuffer];
    -[SBTouchRegionManager setTouchRegionBuffer:](self, "setTouchRegionBuffer:");
  }
  else if (self->_screenSharingSettings == v7 && [v6 isEqual:@"edgeSwipeBuffer"])
  {
    [(SBScreenSharingOverlayUISettings *)self->_screenSharingSettings edgeSwipeBuffer];
    -[SBTouchRegionManager setEdgeTouchRegionBuffer:](self, "setEdgeTouchRegionBuffer:");
  }
}

- (CGAffineTransform)rootWindowTransform
{
  long long v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].a;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingSettings, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_queue_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_queue_bksInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end