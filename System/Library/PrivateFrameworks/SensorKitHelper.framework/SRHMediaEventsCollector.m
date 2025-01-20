@interface SRHMediaEventsCollector
+ (void)initialize;
- (SRHMediaEventsCollector)initWithScrollView:(id)a3 scrollMonitor:(id)a4;
- (SRHMediaEventsCollector)initWithScrollView:(id)a3 scrollMonitor:(id)a4 mediaViewsStore:(id)a5;
- (int64_t)_addMediaSubviewsOfView:(id)a3 viewsTraversed:(int64_t)a4;
- (int64_t)_removeMediaSubviewsOfView:(id)a3 viewsTraversed:(int64_t)a4;
- (void)_addMediaSubviewsOfView:(id)a3;
- (void)_checkViewForMediaContent:(id)a3 withCompletionHandler:(id)a4;
- (void)_removeMediaSubviewsOfView:(id)a3;
- (void)dealloc;
- (void)didBecomeActive;
- (void)scrollViewMonitorDidStartMonitoring:(id)a3;
- (void)scrollViewMonitorDidStopMonitoring:(id)a3;
- (void)scrollViewMonitorScrollDid:(id)a3 addView:(id)a4 removeView:(id)a5;
- (void)scrollViewMonitorScrollDidScrolled:(id)a3;
- (void)willResignActive;
@end

@implementation SRHMediaEventsCollector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _MergedGlobals = (uint64_t)os_log_create("com.apple.SensorKit", "SRHMediaEventsCollector");
  }
}

- (SRHMediaEventsCollector)initWithScrollView:(id)a3 scrollMonitor:(id)a4
{
  v7 = [[SRHMediaViewsStore alloc] initWithScrollView:a3];
  return [(SRHMediaEventsCollector *)self initWithScrollView:a3 scrollMonitor:a4 mediaViewsStore:v7];
}

- (SRHMediaEventsCollector)initWithScrollView:(id)a3 scrollMonitor:(id)a4 mediaViewsStore:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SRHMediaEventsCollector;
  v8 = [(SRHMediaEventsCollector *)&v10 init];
  if (v8)
  {
    v8->_scrollView = (UIScrollView *)a3;
    v8->_scrollViewMonitor = (UIScrollViewMonitor *)a4;
    v8->_mediaViewsStore = (SRHMediaViewsStore *)a5;
  }
  return v8;
}

- (void)dealloc
{
  self->_scrollView = 0;
  self->_scrollViewMonitor = 0;

  self->_mediaViewsStore = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRHMediaEventsCollector;
  [(SRHMediaEventsCollector *)&v3 dealloc];
}

- (void)scrollViewMonitorDidStartMonitoring:(id)a3
{
  v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v6 = (void *)qword_26B34E3B0;
  uint64_t v15 = qword_26B34E3B0;
  if (!qword_26B34E3B0)
  {
    v7 = (void *)UIKitLibrary();
    v13[3] = (uint64_t)dlsym(v7, "UIApplicationDidBecomeActiveNotification");
    qword_26B34E3B0 = v13[3];
    v6 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v6) {
    goto LABEL_8;
  }
  [v5 addObserver:self selector:sel_didBecomeActive name:*v6 object:0];
  v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v9 = (void *)qword_26B34E3B8;
  uint64_t v15 = qword_26B34E3B8;
  if (!qword_26B34E3B8)
  {
    objc_super v10 = (void *)UIKitLibrary();
    v13[3] = (uint64_t)dlsym(v10, "UIApplicationWillResignActiveNotification");
    qword_26B34E3B8 = v13[3];
    v9 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v9)
  {
LABEL_8:
    dlerror();
    v11 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  [v8 addObserver:self selector:sel_willResignActive name:*v9 object:0];
  [(SRHMediaEventsCollector *)self _addMediaSubviewsOfView:a3];
  [(SRHMediaViewsStore *)self->_mediaViewsStore processScrollViewOffset];
}

- (void)scrollViewMonitorDidStopMonitoring:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3), "removeObserver:", self);
  mediaViewsStore = self->_mediaViewsStore;
  [(SRHMediaViewsStore *)mediaViewsStore removeAllViews];
}

- (void)scrollViewMonitorScrollDid:(id)a3 addView:(id)a4 removeView:(id)a5
{
  if (a4)
  {
    NSClassFromString(&cfstr_Uiscrollview.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(SRHMediaEventsCollector *)self _addMediaSubviewsOfView:a4];
    }
  }
  else if (a5)
  {
    NSClassFromString(&cfstr_Uiscrollview.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(SRHMediaEventsCollector *)self _removeMediaSubviewsOfView:a5];
    }
  }
}

- (void)scrollViewMonitorScrollDidScrolled:(id)a3
{
}

- (void)didBecomeActive
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = _MergedGlobals;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_INFO))
  {
    scrollView = self->_scrollView;
    int v5 = 134218240;
    v6 = scrollView;
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_25C113000, v3, OS_LOG_TYPE_INFO, "App did become active, scrollView:%p, self:%p", (uint8_t *)&v5, 0x16u);
  }
  [(SRHMediaViewsStore *)self->_mediaViewsStore markViewsAsOnScreen];
}

- (void)willResignActive
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = _MergedGlobals;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_INFO))
  {
    scrollView = self->_scrollView;
    int v5 = 134218240;
    v6 = scrollView;
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_25C113000, v3, OS_LOG_TYPE_INFO, "App will become inactive, scrollView:%p, self:%p", (uint8_t *)&v5, 0x16u);
  }
  [(SRHMediaViewsStore *)self->_mediaViewsStore markViewsAsOffScreen];
}

- (void)_checkViewForMediaContent:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([a3 isHidden])
  {
    v6 = _MergedGlobals;
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEBUG))
    {
      __int16 v7 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = NSStringFromClass(v7);
      _os_log_debug_impl(&dword_25C113000, v6, OS_LOG_TYPE_DEBUG, "View:%p, class:%@ is hidden", buf, 0x16u);
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  uint64_t v25 = qword_26B34E3C0;
  if (!qword_26B34E3C0)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __getUIImageViewClass_block_invoke;
    v20 = &unk_2654ACA10;
    v21 = buf;
    __getUIImageViewClass_block_invoke((uint64_t)&v17);
  }
  _Block_object_dispose(buf, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "image"), "imageAsset");
    uint64_t v9 = _MergedGlobals;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2048;
    v23 = (void (*)(uint64_t, uint64_t))v8;
    uint64_t v14 = "View:%p, class:%@, is UIImageView class and not hidden, asset:%p";
LABEL_19:
    _os_log_debug_impl(&dword_25C113000, v9, OS_LOG_TYPE_DEBUG, v14, buf, 0x20u);
    goto LABEL_8;
  }
  NSClassFromString(&cfstr_Ckimageballoon.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_16;
  }
  v11 = (void *)[a3 performSelector:sel_image];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  uint64_t v25 = qword_26B34E3C8;
  if (!qword_26B34E3C8)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __getUIImageClass_block_invoke;
    v20 = &unk_2654ACA10;
    v21 = buf;
    __getUIImageClass_block_invoke((uint64_t)&v17);
  }
  _Block_object_dispose(buf, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v8 = [v11 imageAsset];
  uint64_t v9 = _MergedGlobals;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    v23 = (void (*)(uint64_t, uint64_t))v8;
    uint64_t v14 = "View:%p, class:%@ asset:%p";
    goto LABEL_19;
  }
LABEL_8:
  BOOL v10 = v8 != 0;
LABEL_17:
  (*((void (**)(id, BOOL, void))a4 + 2))(a4, v10, 0);
}

- (void)_addMediaSubviewsOfView:(id)a3
{
}

- (void)_removeMediaSubviewsOfView:(id)a3
{
}

- (int64_t)_addMediaSubviewsOfView:(id)a3 viewsTraversed:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a4 < 5000)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __66__SRHMediaEventsCollector__addMediaSubviewsOfView_viewsTraversed___block_invoke;
    v21 = &unk_2654AC9E8;
    int64_t v4 = a4 + 1;
    v22 = self;
    id v23 = a3;
    -[SRHMediaEventsCollector _checkViewForMediaContent:withCompletionHandler:](self, "_checkViewForMediaContent:withCompletionHandler:");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = objc_msgSend(a3, "subviews", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          int64_t v4 = [(SRHMediaEventsCollector *)self _addMediaSubviewsOfView:*(void *)(*((void *)&v14 + 1) + 8 * v12++) viewsTraversed:v4];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v25 count:16];
      }
      while (v10);
    }
  }
  else
  {
    int v5 = _MergedGlobals;
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25C113000, v5, OS_LOG_TYPE_ERROR, "Adding view. Stop subviews parsing. View is too big.", buf, 2u);
    }
  }
  return v4;
}

uint64_t __66__SRHMediaEventsCollector__addMediaSubviewsOfView_viewsTraversed___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 24) addViewToStore:*(void *)(result + 40)];
  }
  return result;
}

- (int64_t)_removeMediaSubviewsOfView:(id)a3 viewsTraversed:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a4 < 5000)
  {
    id v6 = a3;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __69__SRHMediaEventsCollector__removeMediaSubviewsOfView_viewsTraversed___block_invoke;
    v20 = &unk_2654AC9E8;
    v21 = self;
    id v22 = a3;
    -[SRHMediaEventsCollector _checkViewForMediaContent:withCompletionHandler:](self, "_checkViewForMediaContent:withCompletionHandler:");
    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x3052000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    uint64_t v33 = qword_26B34E3D0;
    if (!qword_26B34E3D0)
    {
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getUICollectionViewCellClass_block_invoke;
      uint64_t v26 = &unk_2654ACA10;
      v27 = buf;
      __getUICollectionViewCellClass_block_invoke((uint64_t)&v23);
    }
    _Block_object_dispose(buf, 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x3052000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    uint64_t v33 = qword_26B34E3D8;
    if (!qword_26B34E3D8)
    {
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getUITableViewCellClass_block_invoke;
      uint64_t v26 = &unk_2654ACA10;
      v27 = buf;
      __getUITableViewCellClass_block_invoke((uint64_t)&v23);
    }
    _Block_object_dispose(buf, 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
LABEL_10:
    }
      id v6 = (id)[v6 contentView];
    uint64_t v8 = (void *)[v6 subviews];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v34 count:16];
    ++v4;
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          int64_t v4 = [(SRHMediaEventsCollector *)self _removeMediaSubviewsOfView:*(void *)(*((void *)&v13 + 1) + 8 * i) viewsTraversed:v4];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v34 count:16];
      }
      while (v9);
    }
  }
  else
  {
    int v5 = _MergedGlobals;
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25C113000, v5, OS_LOG_TYPE_ERROR, "Removing view. Stop subviews parsing. View is too big.", buf, 2u);
    }
  }
  return v4;
}

uint64_t __69__SRHMediaEventsCollector__removeMediaSubviewsOfView_viewsTraversed___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 24) removeViewFromStore:*(void *)(result + 40)];
  }
  return result;
}

@end