@interface MeasurementControllerBase
- (BOOL)_shouldConsiderPageLoadEnded;
- (MeasurementControllerBase)initWithPluginPageContextController:(id)a3;
- (double)allSubresourcesFinishedLoadingDelay;
- (id).cxx_construct;
- (unsigned)version;
- (void)_clearPageLoadState;
- (void)_maybeEndPageLoadSoon;
- (void)_postPageLoadEnd;
- (void)_resourceLoadCompleted:(unint64_t)a3;
- (void)_sendPageLoadFinishedEvent;
- (void)_waitforLoadEndTimerFired:(id)a3;
- (void)setAllSubresourcesFinishedLoadingDelay:(double)a3;
- (void)setVersion:(unsigned int)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFailLoadWithErrorForFrame:(id)a4 error:(id)a5;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFirstVisuallyNonEmptyLayoutForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didHandleOnloadEventsForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didFailLoadForResource:(unint64_t)a5 error:(id)a6;
- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didFinishLoadForResource:(unint64_t)a5;
- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didInitiateLoadForResource:(unint64_t)a5 request:(id)a6;
- (void)webProcessPlugInBrowserContextController:(id)a3 renderingProgressDidChange:(unint64_t)a4;
@end

@implementation MeasurementControllerBase

- (MeasurementControllerBase)initWithPluginPageContextController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MeasurementControllerBase;
  v5 = [(MeasurementControllerBase *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contextController, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    loadingFrames = v6->_loadingFrames;
    v6->_loadingFrames = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    loadData = v6->_loadData;
    v6->_loadData = v9;

    v6->_version = 4;
    v6->_allSubresourcesFinishedLoadingDelay = 1.0;
    v11 = v6;
  }

  return v6;
}

- (void)_clearPageLoadState
{
  id v4 = self;
  self->_currentPageLoadFinished = 0;
  objc_msgSend_removeAllObjects(self->_loadingFrames, a2, v2, v3);
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  loadData = v4->_loadData;
  v4->_loadData = v5;

  left = v4->_loadingSubresources.__tree_.__pair1_.__value_.__left_;
  id v4 = (MeasurementControllerBase *)((char *)v4 + 40);
  sub_235F77F2C((uint64_t)&v4[-1]._allSubresourcesFinishedLoadingDelay, left);
  *(void *)&v4[-1]._allSubresourcesFinishedLoadingDelay = v4;
  v4->super.isa = 0;
  v4->_waitForLoadToReallyEnd = 0;
  contextController = v4[-1]._contextController;

  MEMORY[0x270F9A6D0](contextController, sel_invalidate, v8, v9);
}

- (BOOL)_shouldConsiderPageLoadEnded
{
  if (self->_version <= 4)
  {
    if (self->_currentPageLoadFinished && !self->_loadingSubresources.__tree_.__pair3_.__value_) {
      return objc_msgSend_count(self->_loadingFrames, a2, v2, v3) == 0;
    }
    return 0;
  }
  if (self->_loadingSubresources.__tree_.__pair3_.__value_) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(self->_loadData, a2, @"PageLoadDOMContentLoadedTime", v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_loadData, v6, @"PageLoadFirstMeaningfulPaintTime", v7);
    BOOL v5 = v9 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_waitforLoadEndTimerFired:(id)a3
{
  if (objc_msgSend__shouldConsiderPageLoadEnded(self, a2, (uint64_t)a3, v3))
  {
    MEMORY[0x270F9A6D0](self, sel__postPageLoadEnd, v5, v6);
  }
}

- (void)_postPageLoadEnd
{
  objc_msgSend__sendPageLoadFinishedEvent(self, a2, v2, v3);

  objc_msgSend__clearPageLoadState(self, v5, v6, v7);
}

- (void)_maybeEndPageLoadSoon
{
  if (objc_msgSend__shouldConsiderPageLoadEnded(self, a2, v2, v3))
  {
    objc_msgSend__doAfterPageLoad(self, v5, v6, v7);
    if (objc_msgSend_isValid(self->_waitForLoadToReallyEnd, v8, v9, v10))
    {
      waitForLoadToReallyEnd = self->_waitForLoadToReallyEnd;
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v11, v12, v13, self->_allSubresourcesFinishedLoadingDelay);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFireDate_(waitForLoadToReallyEnd, v15, (uint64_t)v28, v16);
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x263EFFA20]);
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v18, v19, v20, self->_allSubresourcesFinishedLoadingDelay);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (NSTimer *)objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(v17, v21, (uint64_t)v28, (uint64_t)self, sel__waitforLoadEndTimerFired_, 0, 0, 0.0);
      v23 = self->_waitForLoadToReallyEnd;
      self->_waitForLoadToReallyEnd = v22;
    }
    objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v24, v25, v26);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addTimer_forMode_(v29, v27, (uint64_t)self->_waitForLoadToReallyEnd, *MEMORY[0x263EFF478]);
  }
}

- (void)_sendPageLoadFinishedEvent
{
  kdebug_trace();
  pageLoadTestEventsProxy = self->_pageLoadTestEventsProxy;
  if (!pageLoadTestEventsProxy)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contextController);
    uint64_t v9 = objc_msgSend__remoteObjectRegistry(WeakRetained, v6, v7, v8);

    uint64_t v12 = objc_msgSend_remoteObjectInterfaceWithProtocol_(MEMORY[0x263F1FAB8], v10, (uint64_t)&unk_26E95A820, v11);
    objc_msgSend_remoteObjectProxyWithInterface_(v9, v13, (uint64_t)v12, v14);
    v15 = (PageLoadTestEventsListener *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = self->_pageLoadTestEventsProxy;
    self->_pageLoadTestEventsProxy = v15;

    pageLoadTestEventsProxy = self->_pageLoadTestEventsProxy;
  }
  loadData = self->_loadData;

  MEMORY[0x270F9A6D0](pageLoadTestEventsProxy, sel_didFinishPageLoadWithLoadData_, loadData, v3);
}

- (void)_resourceLoadCompleted:(unint64_t)a3
{
  p_pair1 = &self->_loadingSubresources.__tree_.__pair1_;
  left = self->_loadingSubresources.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_loadingSubresources = (uint64_t **)&self->_loadingSubresources;
    uint64_t v7 = (uint64_t *)p_pair1;
    do
    {
      unint64_t v8 = left[4];
      BOOL v9 = v8 >= a3;
      if (v8 >= a3) {
        uint64_t v10 = left;
      }
      else {
        uint64_t v10 = left + 1;
      }
      if (v9) {
        uint64_t v7 = left;
      }
      left = (void *)*v10;
    }
    while (*v10);
    if (v7 != (uint64_t *)p_pair1 && v7[4] <= a3)
    {
      sub_235F77F80(p_loadingSubresources, v7);
      operator delete(v7);
      if (!self->_loadingSubresources.__tree_.__pair3_.__value_)
      {
        uint64_t v14 = NSNumber;
        v15 = objc_msgSend_date(MEMORY[0x263EFF910], v11, v12, v13);
        objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18);
        v22 = objc_msgSend_numberWithDouble_(v14, v19, v20, v21);

        objc_msgSend_setValue_forKey_(self->_loadData, v23, (uint64_t)v22, @"PageLoadAllSubresourcesLoadedTime");
      }
      objc_msgSend__maybeEndPageLoadSoon(self, v11, v12, v13);
    }
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  objc_msgSend_mainFrame(v17, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    objc_msgSend__clearPageLoadState(self, v11, v12, v13);
    objc_msgSend__doBeforePageLoad(self, v14, v15, v16);
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4
{
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishLoadForFrame:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_msgSend_mainFrame(v14, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    self->_currentPageLoadFinished = 1;
    objc_msgSend__maybeEndPageLoadSoon(self, v11, v12, v13);
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didHandleOnloadEventsForFrame:(id)a4
{
  id v10 = a4;
  objc_msgSend_removeObject_(self->_loadingFrames, v5, (uint64_t)v10, v6);
  objc_msgSend__maybeEndPageLoadSoon(self, v7, v8, v9);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFailLoadWithErrorForFrame:(id)a4 error:(id)a5
{
  id v11 = a4;
  objc_msgSend_removeObject_(self->_loadingFrames, v6, (uint64_t)v11, v7);
  objc_msgSend__maybeEndPageLoadSoon(self, v8, v9, v10);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didInitiateLoadForResource:(unint64_t)a5 request:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v19 = a5;
  id v12 = a6;
  uint64_t v16 = v12;
  if (!a5)
  {
    WTFLogAlways();
    goto LABEL_8;
  }
  objc_msgSend__CFURLRequest(v12, v13, v14, v15);
  CFBooleanRef v17 = (const __CFBoolean *)_CFURLRequestCopyProtocolPropertyForKey();
  CFBooleanRef v18 = v17;
  if (!v17)
  {
LABEL_7:
    sub_235F78378((uint64_t **)&self->_loadingSubresources, &v19, (uint64_t *)&v19);
    goto LABEL_8;
  }
  if (!CFBooleanGetValue(v17))
  {
    CFRelease(v18);
    goto LABEL_7;
  }
  CFRelease(v18);
LABEL_8:
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didFinishLoadForResource:(unint64_t)a5
{
  if (a5) {
    MEMORY[0x270F9A6D0](self, sel__resourceLoadCompleted_, a5, a4);
  }
  else {
    WTFLogAlways();
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didFailLoadForResource:(unint64_t)a5 error:(id)a6
{
  if (a5) {
    MEMORY[0x270F9A6D0](self, sel__resourceLoadCompleted_, a5, a4);
  }
  else {
    WTFLogAlways();
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFirstVisuallyNonEmptyLayoutForFrame:(id)a4
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9);
  objc_msgSend_numberWithDouble_(v5, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(self->_loadData, v13, (uint64_t)v14, @"PageLoadFirstVisuallyNonEmptyLayoutTime");
}

- (void)webProcessPlugInBrowserContextController:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4 = a4;
  id v6 = a3;
  if ((v4 & 0x100) != 0 && self->_version >= 5)
  {
    id v26 = v6;
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_loadData, v7, @"PageLoadFirstMeaningfulPaintTime", v8);

    id v6 = v26;
    if (!v9)
    {
      uint64_t v13 = NSNumber;
      id v14 = objc_msgSend_date(MEMORY[0x263EFF910], v10, v11, v12);
      objc_msgSend_timeIntervalSinceReferenceDate(v14, v15, v16, v17);
      uint64_t v21 = objc_msgSend_numberWithDouble_(v13, v18, v19, v20);

      objc_msgSend_setValue_forKey_(self->_loadData, v22, (uint64_t)v21, @"PageLoadFirstMeaningfulPaintTime");
      objc_msgSend__maybeEndPageLoadSoon(self, v23, v24, v25);

      id v6 = v26;
    }
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v27 = a3;
  id v9 = a4;
  if (self->_version >= 5)
  {
    objc_msgSend_mainFrame(v27, v6, v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v9)
    {
      id v14 = NSNumber;
      uint64_t v15 = objc_msgSend_date(MEMORY[0x263EFF910], v11, v12, v13);
      objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18);
      v22 = objc_msgSend_numberWithDouble_(v14, v19, v20, v21);

      objc_msgSend_setValue_forKey_(self->_loadData, v23, (uint64_t)v22, @"PageLoadDOMContentLoadedTime");
      objc_msgSend__maybeEndPageLoadSoon(self, v24, v25, v26);
    }
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (double)allSubresourcesFinishedLoadingDelay
{
  return self->_allSubresourcesFinishedLoadingDelay;
}

- (void)setAllSubresourcesFinishedLoadingDelay:(double)a3
{
  self->_allSubresourcesFinishedLoadingDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLoadTestEventsProxy, 0);
  objc_destroyWeak((id *)&self->_contextController);
  objc_storeStrong((id *)&self->_loadingFrames, 0);
  sub_235F77F2C((uint64_t)&self->_loadingSubresources, (void *)self->_loadingSubresources.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_loadData, 0);

  objc_storeStrong((id *)&self->_waitForLoadToReallyEnd, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

@end