@interface UISSlotMachine
+ (id)allowedLocalizations;
- (NSSet)allTags;
- (UISSlotMachine)initWithSlotDrawer:(id)a3 options:(unint64_t)a4;
- (id)remoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5;
- (void)_getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 forceSync:(BOOL)a6 reply:(id)a7;
- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 reply:(id)a6;
- (void)removeContentForStyle:(id)a3 tag:(id)a4;
- (void)removeContentsForTag:(id)a3;
@end

@implementation UISSlotMachine

- (UISSlotMachine)initWithSlotDrawer:(id)a3 options:(unint64_t)a4
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UISSlotMachine;
  v9 = [(UISSlotMachine *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotDrawer, a3);
    char v11 = objc_opt_respondsToSelector();
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL | v11 & 1;
    char v14 = objc_opt_respondsToSelector();
    uint64_t v15 = 4;
    if ((v14 & 1) == 0) {
      uint64_t v15 = 0;
    }
    unint64_t v16 = v13 | v15;
    if (v16 > 5 || ((1 << v16) & 0x36) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v10 file:@"UISSlotMachine.m" lineNumber:75 description:@"Unsupported drawer method configuration."];
    }
    else
    {
      v10->_slotDrawerMethod = v16;
    }
    v10->_options = a4;
    *(void *)&v10->_cachedContentsLock._os_unfair_lock_opaque = 0;
    v10->_LRUTagsByClassLock._os_unfair_lock_opaque = 0;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedContents = v10->_cachedContents;
    v10->_cachedContents = v19;

    layerContext = v10->_layerContext;
    v10->_layerContext = 0;

    if ((a4 & 2) != 0)
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:258 valueOptions:0 capacity:0];
      LRUTagsByClass = v10->_LRUTagsByClass;
      v10->_LRUTagsByClass = (NSMapTable *)v22;
    }
  }

  return v10;
}

+ (id)allowedLocalizations
{
  if (qword_1EB288898 != -1) {
    dispatch_once(&qword_1EB288898, &__block_literal_global_8);
  }
  v2 = (void *)_MergedGlobals_11;
  return v2;
}

void __38__UISSlotMachine_allowedLocalizations__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:"/" isDirectory:1 relativeToURL:0];
  id v6 = [v0 fileURLWithFileSystemRepresentation:"System/Library/PrivateFrameworks/UIKitCore.framework" isDirectory:1 relativeToURL:v1];

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  CFArrayRef v3 = CFBundleCopyBundleLocalizations(Unique);
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  v5 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v4;

  if (v3) {
    CFRelease(v3);
  }
  if (Unique) {
    CFRelease(Unique);
  }
}

- (NSSet)allTags
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [(NSMutableDictionary *)self->_cachedContents allKeys];
  v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (void)_getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 forceSync:(BOOL)a6 reply:(id)a7
{
  BOOL v43 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke;
  v61[3] = &unk_1E57354C8;
  id v15 = v14;
  id v62 = v15;
  unint64_t v16 = (void (**)(void, void))MEMORY[0x192FE1660](v61);
  if (!a3)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"UISSlotMachine.m", 137, @"Invalid parameter not satisfying: %@", @"layerContextId" object file lineNumber description];
  }
  uint64_t v17 = [v13 failGradeForStyle:v12];
  if (v17)
  {
    uint64_t v18 = v17;
    if ((v17 & 0x100) != 0) {
      +[UISSlotMachine allowedLocalizations];
    }
    else {
    v19 = [MEMORY[0x1E4F1CAD0] set];
    }
    if ([v12 gradeWithOnlyFails:v18 allowedLocalizations:v19]) {
      v16[2](v16, 0);
    }
  }
  if (([v13 isValid] & 1) == 0) {
    v16[2](v16, 0);
  }
  v20 = objc_opt_class();
  v21 = v20;
  if ((self->_options & 2) != 0) {
    uint64_t v22 = [v20 cacheLimit];
  }
  else {
    uint64_t v22 = -1;
  }
  v23 = [v13 resolvedStyleForStyle:v12];
  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_2;
  v52[3] = &unk_1E57354F0;
  objc_copyWeak(v59, &location);
  id v24 = v16;
  id v57 = v24;
  id v25 = v13;
  id v53 = v25;
  id v26 = v23;
  id v54 = v26;
  v55 = self;
  v59[1] = (id)a2;
  v59[2] = (id)a3;
  id v45 = v12;
  id v56 = v45;
  v59[3] = (id)v22;
  v59[4] = v21;
  id v44 = v15;
  id v58 = v44;
  v27 = (void (**)(void, void, void))MEMORY[0x192FE1660](v52);
  if (v22)
  {
    os_unfair_lock_lock(&self->_cachedContentsLock);
    v28 = [(NSMutableDictionary *)self->_cachedContents objectForKeyedSubscript:v25];
    v29 = [v28 objectForKeyedSubscript:v26];

    os_unfair_lock_unlock(&self->_cachedContentsLock);
    if (v29)
    {
      ((void (**)(void, void *, void))v27)[2](v27, v29, 0);
      goto LABEL_33;
    }
  }
  switch(self->_slotDrawerMethod)
  {
    case 1uLL:
      uint64_t v30 = [(UISSlotDrawer *)self->_slotDrawer imageWithStyle:v26 tag:v25 forRemote:1];
      if (v30) {
        goto LABEL_30;
      }
      v38 = _UISSlotMachineServiceLogger();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191ABF000, v38, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty image.", buf, 2u);
      }

      (*((void (**)(id, void))v24 + 2))(v24, 0);
      v29 = 0;
      goto LABEL_33;
    case 2uLL:
      if (v43)
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2 object:self file:@"UISSlotMachine.m" lineNumber:286 description:@"Cannot synchronously create local content with asynchronous image drawer method."];
      }
      slotDrawer = self->_slotDrawer;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_40;
      v46[3] = &unk_1E5735518;
      v48 = v27;
      id v47 = v26;
      BOOL v50 = v22 != 0;
      id v49 = v24;
      [(UISSlotDrawer *)slotDrawer getImageWithStyle:v47 tag:v25 forRemote:1 reply:v46];

      v29 = 0;
      v33 = v48;
      goto LABEL_32;
    case 4uLL:
      v34 = [(UISSlotDrawer *)self->_slotDrawer drawingWithStyle:v26 tag:v25 forRemote:1];
      v29 = v34;
      if (v34)
      {
        [v34 drawingSize];
        if (v35 > 0.0)
        {
          [v29 drawingSize];
          if (v36 > 0.0) {
            goto LABEL_28;
          }
        }
      }
      v37 = _UISSlotMachineServiceLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191ABF000, v37, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty drawing.", buf, 2u);
      }
      goto LABEL_36;
    case 5uLL:
      uint64_t v30 = [(UISSlotDrawer *)self->_slotDrawer imageWithStyle:v26 tag:v25 forRemote:1];
      if (v30)
      {
LABEL_30:
        v33 = +[UISSlotLocalContent contentWithImage:scale:](UISSlotLocalContent, "contentWithImage:scale:", v30, [v26 displayScale]);
        ((void (**)(void, void *, BOOL))v27)[2](v27, v33, v22 != 0);
LABEL_31:
        v29 = 0;
        goto LABEL_32;
      }
      v39 = [(UISSlotDrawer *)self->_slotDrawer drawingWithStyle:v26 tag:v25 forRemote:1];
      v29 = v39;
      if (v39)
      {
        [v39 drawingSize];
        if (v40 > 0.0)
        {
          [v29 drawingSize];
          if (v41 > 0.0)
          {
LABEL_28:
            v33 = +[UISSlotLocalContent contentWithDrawing:v29 style:v26];
            ((void (**)(void, void *, BOOL))v27)[2](v27, v33, v22 != 0);
LABEL_32:

            goto LABEL_33;
          }
        }
      }
      v37 = _UISSlotMachineServiceLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191ABF000, v37, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty drawing.", buf, 2u);
      }
LABEL_36:

      (*((void (**)(id, void))v24 + 2))(v24, 0);
LABEL_33:

      objc_destroyWeak(v59);
      objc_destroyWeak(&location);

      return;
    default:
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2 object:self file:@"UISSlotMachine.m" lineNumber:279 description:@"Unsupported drawer method configuration."];
      goto LABEL_31;
  }
}

void __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0, a2);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UISSlotMachineErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

void __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v37 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    if (!a3) {
      goto LABEL_9;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
  id v6 = [*((id *)WeakRetained + 6) objectForKeyedSubscript:*(void *)(a1 + 32)];
  v7 = v6;
  if (v6)
  {
    [v6 setObject:v37 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v37 forKey:*(void *)(a1 + 40)];
    [*((id *)WeakRetained + 6) setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);

LABEL_9:
  if ([MEMORY[0x1E4F39CF8] currentState])
  {
    double v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 48) file:@"UISSlotMachine.m" lineNumber:175 description:@"An active implicit transaction will delay slot creation; please use an explicit transaction instead"];
  }
  [MEMORY[0x1E4F39CF8] begin];
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 9);
  v9 = [UISSlotRemoteContent alloc];
  [v37 contentSize];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [v37 contentScale];
  id v15 = [v37 image];
  unint64_t v16 = -[UISSlotRemoteContent initWithContentSize:contentScale:localImage:toLayerContext:](v9, "initWithContentSize:contentScale:localImage:toLayerContext:", v14, v15, WeakRetained + 56, v11, v13);

  [(UISSlotRemoteContent *)v16 transferFromLayerContext:*((void *)WeakRetained + 7) toLayerContextWithId:*(void *)(a1 + 96)];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 9);
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] synchronize];
  if (WeakRetained[24])
  {
    uint64_t v17 = [*(id *)(a1 + 32) authenticationMessageContextForStyle:*(void *)(a1 + 56)];
    uint64_t v18 = [*(id *)(a1 + 32) backgroundStatisticsRegionForStyle:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) backgroundStatisticsForegroundForStyle:*(void *)(a1 + 56)];
    int v20 = v19;
    [*(id *)(a1 + 32) backgroundStatisticsPassingContrastForStyle:*(void *)(a1 + 56)];
    int v22 = v21;
    [*(id *)(a1 + 32) backgroundStatisticsFailingContrastForStyle:*(void *)(a1 + 56)];
    int v24 = v23;
    uint64_t v25 = [*(id *)(a1 + 32) hitTestInformationMaskForStyle:*(void *)(a1 + 56)];
    uint64_t v26 = [*(id *)(a1 + 32) initialSampleEventForStyle:*(void *)(a1 + 56)];
    uint64_t v27 = [*(id *)(a1 + 32) secureNameForStyle:*(void *)(a1 + 56)];
    LODWORD(v28) = v20;
    LODWORD(v29) = v22;
    LODWORD(v30) = v24;
    id v31 = [(UISSlotRemoteContent *)v16 newTouchAuthenticationSpecificationWithAuthenticationMessageContext:v17 backgroundStatisticsRegion:v18 backgroundStatisticsForeground:v25 backgroundStatisticsPassingContrast:v26 backgroundStatisticsFailingContrast:v27 hitTestInformationMask:v28 initialSampleEvent:v29 secureName:v30];
    v32 = [MEMORY[0x1E4F4F3F0] sharedInstance];
    v33 = [MEMORY[0x1E4F1CAD0] setWithObject:v31];
    [v32 addTouchAuthenticationSpecifications:v33 forReason:@"slot machine"];
  }
  if (a3 && *(void *)(a1 + 104) != -1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 10);
    v34 = [*((id *)WeakRetained + 8) objectForKey:*(void *)(a1 + 112)];
    if (!v34)
    {
      v34 = [[UISLRUCache alloc] initWithLimit:*(void *)(a1 + 104)];
      [*((id *)WeakRetained + 8) setObject:v34 forKey:*(void *)(a1 + 112)];
    }
    double v35 = [(UISLRUCache *)v34 evictedObjectForUsedObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 10);
    if (v35) {
      [*(id *)(a1 + 48) removeContentsForTag:v35];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = +[UISSlotLocalContent contentWithImage:scale:](UISSlotLocalContent, "contentWithImage:scale:", a2, [*(id *)(a1 + 32) displayScale]);
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    id v8 = _UISSlotMachineServiceLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_191ABF000, v8, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty image.", v9, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 reply:(id)a6
{
}

- (id)remoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = __Block_byref_object_copy__1;
  uint64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__UISSlotMachine_remoteContentForLayerContextWithId_style_tag___block_invoke;
  v12[3] = &unk_1E5735540;
  v12[4] = &v13;
  [(UISSlotMachine *)self _getRemoteContentForLayerContextWithId:a3 style:v8 tag:v9 forceSync:1 reply:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__UISSlotMachine_remoteContentForLayerContextWithId_style_tag___block_invoke(uint64_t a1, void *a2)
{
}

- (void)removeContentForStyle:(id)a3 tag:(id)a4
{
  id v8 = a4;
  uint64_t v6 = [v8 resolvedStyleForStyle:a3];
  os_unfair_lock_lock(&self->_cachedContentsLock);
  v7 = [(NSMutableDictionary *)self->_cachedContents objectForKeyedSubscript:v8];
  [v7 removeObjectForKey:v6];
  if (![v7 count]) {
    [(NSMutableDictionary *)self->_cachedContents removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(&self->_cachedContentsLock);
}

- (void)removeContentsForTag:(id)a3
{
  p_cachedContentsLock = &self->_cachedContentsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cachedContentsLock);
  [(NSMutableDictionary *)self->_cachedContents removeObjectForKey:v5];

  os_unfair_lock_unlock(p_cachedContentsLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LRUTagsByClass, 0);
  objc_storeStrong((id *)&self->_layerContext, 0);
  objc_storeStrong((id *)&self->_cachedContents, 0);
  objc_storeStrong((id *)&self->_slotDrawer, 0);
}

@end