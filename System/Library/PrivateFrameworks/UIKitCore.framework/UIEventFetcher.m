@interface UIEventFetcher
- (UIEventFetcher)init;
- (uint64_t)_latestHoverEventForContextID:(uint64_t)result;
- (uint64_t)_receiveHIDEventInternal:(uint64_t)result;
- (uint64_t)signalEventsAvailableWithReason:(uint64_t)result filteredEventCount:(uint64_t)a2;
- (void)_receiveHIDEvent:(__IOHIDEvent *)a3;
- (void)_removeHIDEventObserver;
- (void)_removeHIDGameControllerEventObserver;
- (void)_requestFilterChainUpdate;
- (void)_resendHoverEventForContextID:(uint64_t)a1;
- (void)_setHIDEventObserver:(void *)a3 onQueue:;
- (void)_setHIDGameControllerEventObserver:(void *)a3 onQueue:;
- (void)_setupFilterChain;
- (void)displayLinkDidFire:(id)a3;
- (void)drainEvents:(uint64_t)a1;
- (void)drainEventsIntoEnvironment:(uint64_t)a1;
- (void)resendDragMoveEventsOnTimer:(__CFRunLoopTimer *)a3 withInterval:(double)a4;
- (void)setEventFetcherSink:(uint64_t)a1;
- (void)setSynchronizer:(uint64_t)a1;
- (void)threadMain;
@end

@implementation UIEventFetcher

uint64_t __22__UIEventFetcher_init__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((_UIUpdateCycleEnabled() & 1) == 0) {
    *(double *)(*(void *)(a1 + 32) + 136) = (double)(unint64_t)IOHIDEventGetTimeStamp();
  }
  v4 = *(void **)(a1 + 40);
  return [v4 addObject:a2];
}

- (void)drainEvents:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__UIEventFetcher_drainEvents___block_invoke;
    v5[3] = &unk_1E52DB330;
    v5[4] = a1;
    id v6 = v3;
    os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
    __30__UIEventFetcher_drainEvents___block_invoke((uint64_t)v5);
    os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
  }
}

uint64_t __30__UIEventFetcher_drainEvents___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 removeAllObjects];
}

- (uint64_t)_receiveHIDEventInternal:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    _UIEventProfileCollectionSubmitEvent(a2);
    int Type = IOHIDEventGetType();
    IOHIDEventGetEventFlags();
    if (Type == 11 && _UIEventHIDGetChildStylusEvent(a2)) {
      IOHIDEventGetFloatValue();
    }
    v5 = BKSHIDEventGetDigitizerAttributes();
    [v5 options];

    IOHIDEventGetSenderID();
    IOHIDEventGetTimeStamp();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    if (_UIUpdateCycleEnabled())
    {
      kdebug_trace();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = (void (*)(uint64_t *))__39__UIEventFetcher_filterEventAndSignal___block_invoke;
      v20 = &unk_1E52D9CD0;
      uint64_t v21 = v3;
      v22 = (void *)a2;
      os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
      __39__UIEventFetcher_filterEventAndSignal___block_invoke((uint64_t)&v17);
      os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
      [*(id *)(v3 + 256) eventFetcherDidReceiveEvents:v3];
      kdebug_trace();
    }
    result = _UIUpdateCycleEnabled();
    if ((result & 1) == 0)
    {
      kdebug_trace();
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __43__UIEventFetcher__receiveHIDEventInternal___block_invoke;
      v15 = &unk_1E52D9F70;
      uint64_t v16 = v3;
      os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
      __43__UIEventFetcher__receiveHIDEventInternal___block_invoke((uint64_t)&v12);
      os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      int v42 = 0;
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2020000000;
      char v40 = 0;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 1;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      v32[3] = 0;
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      char v31 = 0;
      char v6 = *(unsigned char *)(v3 + 168);
      char v7 = objc_msgSend(*(id *)(v3 + 80), "isPaused", v12, v13);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = (void (*)(uint64_t *))__30__UIEventFetcher_filterEvent___block_invoke;
      v20 = &unk_1E5304A70;
      char v28 = v7;
      char v29 = v6;
      v26 = v32;
      uint64_t v27 = a2;
      uint64_t v21 = v3;
      v22 = v41;
      v23 = &v37;
      v24 = &v33;
      v25 = v30;
      v8 = &v17;
      os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
      v19(v8);

      os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
      kdebug_trace();
      if (*((unsigned char *)v38 + 24))
      {
        if (*(void *)(v3 + 80))
        {
          double v9 = CACurrentMediaTime();
          double v10 = *(double *)(v3 + 192);
          if (v10 != 0.0)
          {
            double v11 = v10 - *(double *)(v3 + 184);
            if (v10 < v9 + v11 * 0.3)
            {
              *(double *)(v3 + 184) = v10;
              *(double *)(v3 + 192) = v10 + v11;
            }
          }
        }
        -[UIEventFetcher signalEventsAvailableWithReason:filteredEventCount:](v3, v34[3]);
      }
      _Block_object_dispose(v30, 8);
      _Block_object_dispose(v32, 8);
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(v41, 8);
      return kdebug_trace();
    }
  }
  return result;
}

uint64_t __39__UIEventFetcher_filterEventAndSignal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

void __34__UIEventFetcher_setupForRunLoop___block_invoke_2(uint64_t a1)
{
  if (IOHIDEventGetType() != 35
    || (_UIFocusBehaviorForScene(0),
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 supportsGameControllers],
        v2,
        v3))
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (UIEventFetcher)init
{
  kdebug_trace();
  v24.receiver = self;
  v24.super_class = (Class)UIEventFetcher;
  int v3 = [(UIEventFetcher *)&v24 init];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    latestMoveDragEventsBySessionID = v3->_latestMoveDragEventsBySessionID;
    v3->_latestMoveDragEventsBySessionID = v4;

    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    incomingHIDEventsFiltered = v3->_incomingHIDEventsFiltered;
    v3->_incomingHIDEventsFiltered = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventFilters = v3->_eventFilters;
    v3->_eventFilters = v8;

    double v10 = v3->_incomingHIDEventsFiltered;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __22__UIEventFetcher_init__block_invoke;
    uint64_t v21 = &unk_1E53049B8;
    double v11 = v3;
    v22 = v11;
    v23 = v10;
    uint64_t v12 = v10;
    uint64_t v13 = _Block_copy(&v18);
    id addToFilteredEventsBlock = v11->_addToFilteredEventsBlock;
    v11->_id addToFilteredEventsBlock = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F29060]);
    uint64_t v16 = objc_msgSend(v15, "initWithTarget:selector:object:", v11, sel_threadMain, 0, v18, v19, v20, v21);
    [v16 setQualityOfService:33];
    [v16 setName:@"com.apple.uikit.eventfetch-thread"];
    [v16 start];
  }
  kdebug_trace();
  return v3;
}

- (void)setEventFetcherSink:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 256), a2);
    if (_UIUpdateCycleEnabled()) {
      [*(id *)(a1 + 256) eventFetcherDidReceiveEvents:a1];
    }
    if ((_UIUpdateCycleEnabled() & 1) == 0) {
      -[UIEventFetcher signalEventsAvailableWithReason:filteredEventCount:](a1, 1);
    }
  }
}

- (void)threadMain
{
  int v3 = (void *)MEMORY[0x18C108260](self, a2);
  id v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  if (self)
  {
    kdebug_trace();
    self->_cfRunLoop = (__CFRunLoop *)[v4 getCFRunLoop];
    [(NSMutableArray *)self->_eventFilters addObject:&__block_literal_global_471];
    -[UIEventFetcher _setupFilterChain]((uint64_t)self);
    if ((_UIUpdateCycleEnabled() & 1) == 0)
    {
      if (qword_1E8FDF6B0 != -1) {
        dispatch_once(&qword_1E8FDF6B0, &__block_literal_global_117_2);
      }
      if (byte_1E8FDF639)
      {
        v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_displayLinkDidFire_];
        displayLink = self->_displayLink;
        self->_displayLink = v5;

        [(CADisplayLink *)self->_displayLink maximumRefreshRate];
        if ((uint64_t)llround(1.0 / v7) >= 61)
        {
          v8 = self->_displayLink;
          [(CADisplayLink *)v8 maximumRefreshRate];
          if (v9 != 0.0) {
            [(CADisplayLink *)v8 setPreferredFramesPerSecond:llround(1.0 / v9)];
          }
        }
        [(CADisplayLink *)self->_displayLink addToRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];
      }
    }
    BKSHIDEventRegisterEventCallbackOnRunLoop();
    _UIEventProfileCollectionInit();
    kdebug_trace();
  }

  while (1)
  {
    double v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v4 runUntilDate:v10];
  }
}

- (void)_setupFilterChain
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)[*(id *)(a1 + 64) copy];
    int v3 = _Block_copy(*(const void **)(a1 + 32));
    if (*(unsigned char *)__UILogGetCategoryImpl("HIDEventFiltered"))
    {
      _logFilter((uint64_t)"HIDEventFiltered", @"HID Event sent to App");
      uint64_t v33 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v34 = ((void (**)(void, void *))v33)[2](v33, v3);

      int v3 = (void *)v34;
    }
    id v4 = (_UIHIDTransformer *)(id)a1;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = ___hoverEventMemoryFilter_block_invoke;
    v44 = &unk_1E5304B38;
    v45 = v4;
    v5 = (void (**)(void *, void *))_Block_copy(&aBlock);

    char v6 = v5[2](v5, v3);

    double v7 = v4;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = ___dragEventExtractionFilter_block_invoke;
    v44 = &unk_1E5304B38;
    v45 = v7;
    v8 = (void (**)(void *, void *))_Block_copy(&aBlock);

    double v9 = v8[2](v8, v6);

    double v11 = ___grapeFingerOneStrokeMisinterpretationWorkaround_block_invoke(v10, v9);

    uint64_t v13 = ___globalEdgeSwipeEventDiscardFilterGenerator_block_invoke(v12, v11);

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v2;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        uint64_t v18 = 0;
        uint64_t v19 = v13;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v13 = (*(void (**)(void))(*(void *)(*((void *)&v37 + 1) + 8 * v18) + 16))(*(void *)(*((void *)&v37 + 1) + 8 * v18));

          ++v18;
          uint64_t v19 = v13;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v16);
    }

    v20 = v7;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = ___wakeOnTouchSynchronizationFilter_block_invoke;
    v44 = &unk_1E5304B38;
    v45 = v20;
    uint64_t v21 = (void (**)(void *, void *))_Block_copy(&aBlock);

    v22 = v21[2](v21, v13);

    v23 = v20;
    objc_super v24 = [_UIHIDTransformer alloc];
    v25 = -[_UIHIDTransformer initWithRunLoop:](v24, "initWithRunLoop:", v23->_hidEvents, (void)v37);
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = ___iosMacEventExtractionFilter_block_invoke;
    v44 = &unk_1E5304B38;
    v45 = v25;
    v26 = v25;
    uint64_t v27 = (void (**)(void *, void *))_Block_copy(&aBlock);

    char v28 = v27[2](v27, v22);

    v30 = ___pencilRangeAndTouchingSeparationFilter_block_invoke(v29, v28);

    if (*(unsigned char *)__UILogGetCategoryImpl("HIDEventIncoming"))
    {
      _logFilter((uint64_t)"HIDEventIncoming", @"HID Event incoming");
      uint64_t v35 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v36 = ((void (**)(void, void *))v35)[2](v35, v30);

      v30 = (void *)v36;
    }
    char v31 = (NSMutableDictionary *)_Block_copy(v30);
    hidContextByContextId = v23->_hidContextByContextId;
    v23->_hidContextByContextId = v31;
  }
}

id __34__UIEventFetcher_setupForRunLoop___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__UIEventFetcher_setupForRunLoop___block_invoke_2;
  aBlock[3] = &unk_1E5304A00;
  id v7 = v2;
  id v3 = v2;
  id v4 = _Block_copy(aBlock);

  return v4;
}

- (void)_requestFilterChainUpdate
{
  if (a1)
  {
    id v2 = *(__CFRunLoop **)(a1 + 16);
    id v3 = (const void *)*MEMORY[0x1E4F1D410];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__UIEventFetcher__requestFilterChainUpdate__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = a1;
    CFRunLoopPerformBlock(v2, v3, block);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 16));
  }
}

void __43__UIEventFetcher__requestFilterChainUpdate__block_invoke(uint64_t a1)
{
}

- (void)resendDragMoveEventsOnTimer:(__CFRunLoopTimer *)a3 withInterval:(double)a4
{
  if (self) {
    latestMoveDragEventsBySessionID = self->_latestMoveDragEventsBySessionID;
  }
  else {
    latestMoveDragEventsBySessionID = 0;
  }
  v8 = latestMoveDragEventsBySessionID;
  if ([(NSMutableDictionary *)v8 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke;
    v12[3] = &unk_1E52D9F98;
    uint64_t v13 = v8;
    id v14 = self;
    os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
    __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke((uint64_t)v12);
    os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
    double v9 = CFRunLoopTimerGetNextFireDate(a3) + a4;
    double Current = CFAbsoluteTimeGetCurrent();
    if (v9 >= Current) {
      double v11 = v9;
    }
    else {
      double v11 = Current + a4;
    }
    CFRunLoopTimerSetNextFireDate(a3, v11);
  }
}

uint64_t __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke_2;
  v3[3] = &unk_1E5304A28;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (void)displayLinkDidFire:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  kdebug_trace();
  self->_countOfEventsReceivedInPreviousFrame = self->_countOfEventsReceivedSinceLastDisplayLinkCallback;
  double v4 = CACurrentMediaTime();
  [(CADisplayLink *)self->_displayLink timestamp];
  self->_estimatedDisplayLinkDrift = v4 - v5;
  char v6 = self->_latestMoveDragEventsBySessionID;
  uint64_t v26 = [(NSMutableDictionary *)v6 count];
  if (v26)
  {
    double v7 = self->_latestMoveDragEventTimestamp >= self->_latestMoveDragEventResendTimestamp
       ? self->_latestMoveDragEventTimestamp
       : self->_latestMoveDragEventResendTimestamp;
    CFTimeInterval v8 = CACurrentMediaTime();
    if (v8 - v7 > 0.0291666667)
    {
      if (v8 - self->_latestMoveDragEventTimestamp > 30.0)
      {
        double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &displayLinkDidFire____s_category) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Trying to resend a drag event but haven't received a real one in over a minute. Please file a radar against PEP UIKit Touch Events", buf, 2u);
        }
      }
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v48 = __37__UIEventFetcher_displayLinkDidFire___block_invoke;
      v49 = &unk_1E52D9F98;
      v50 = v6;
      v51 = self;
      os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
      v48((uint64_t)v47);
      os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
      self->_latestMoveDragEventResendTimestamp = v8;
    }
  }
  if ([(NSMutableSet *)self->_contextIDsNeedingHoverEventResend count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v10 = self->_contextIDsNeedingHoverEventResend;
    uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = -[UIEventFetcher _latestHoverEventForContextID:]((uint64_t)self, [*(id *)(*((void *)&v43 + 1) + 8 * i) unsignedIntegerValue]);
          if (v14)
          {
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            long long v39 = __37__UIEventFetcher_displayLinkDidFire___block_invoke_3;
            long long v40 = &unk_1E52D9CD0;
            v41 = self;
            uint64_t v42 = v14;
            os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
            v39((uint64_t)v38);
            os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
          }
        }
        uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v11);
    }

    [(NSMutableSet *)self->_contextIDsNeedingHoverEventResend removeAllObjects];
  }
  *(void *)buf = 0;
  uint64_t v35 = buf;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  uint64_t v29 = __37__UIEventFetcher_displayLinkDidFire___block_invoke_4;
  v30 = &unk_1E52E5180;
  char v31 = self;
  id v15 = v27;
  id v32 = v15;
  uint64_t v33 = buf;
  uint64_t v16 = v28;
  os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
  v29((uint64_t)v16);

  os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
  if (self->_countOfEventsReceivedSinceLastDisplayLinkCallback)
  {
    if (self->_needsSignalOnDisplayLink)
    {
      kdebug_trace();
      if (*((int *)v35 + 6) >= 1) {
        goto LABEL_26;
      }
    }
  }
  else
  {
    kdebug_trace();
    if (*((int *)v35 + 6) >= 1)
    {
LABEL_26:
      -[UIEventFetcher signalEventsAvailableWithReason:filteredEventCount:]((uint64_t)self, 2);
      BOOL v17 = 1;
      goto LABEL_34;
    }
    int displayLinkIdleTicks = self->_displayLinkIdleTicks;
    self->_int displayLinkIdleTicks = displayLinkIdleTicks + 1;
    if (displayLinkIdleTicks >= -1)
    {
      char v19 = [v15 isPaused];
      char v20 = v26 ? 1 : v19;
      if ((v20 & 1) == 0)
      {
        [v15 setPaused:1];
        self->_commitTimeForTouchEvents = 0.0;
        kdebug_trace();
      }
    }
  }
  BOOL v17 = 0;
LABEL_34:
  [v15 timestamp];
  double v22 = v21;
  [v15 targetTimestamp];
  double v24 = v23;
  [v15 timestamp];
  if (self->_lastImportantEventTimestamp < v22 + (v24 - v25) * -0.3)
  {
    self->_didSignalOneMoveEventSinceLastDisplayLinkCallback = v17;
    self->_countOfEventsReceivedSinceLastDisplayLinkCallback = 0;
  }
  self->_needsSignalOnDisplayLink = 0;
  kdebug_trace();

  _Block_object_dispose(buf, 8);
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__UIEventFetcher_displayLinkDidFire___block_invoke_2;
  v3[3] = &unk_1E5304A28;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (uint64_t)_latestHoverEventForContextID:(uint64_t)result
{
  if (result)
  {
    id v2 = *(void **)(result + 240);
    id v3 = [NSNumber numberWithUnsignedInt:a2];
    uint64_t v4 = [v2 objectForKey:v3];

    return v4;
  }
  return result;
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 40) timestamp];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(void *)(v3 + 184) = v2;
  }
  [*(id *)(a1 + 40) targetTimestamp];
  *(void *)(*(void *)(a1 + 32) + 192) = v4;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)signalEventsAvailableWithReason:(uint64_t)result filteredEventCount:(uint64_t)a2
{
  if (result)
  {
    uint64_t v2 = result;
    *(_DWORD *)(result + 72) = 0;
    if ((unint64_t)(a2 - 1) > 6) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_186B9C178[a2 - 1];
    }
    *(void *)(result + 152) = v3;
    *(void *)(result + 160) = a2;
    CFTimeInterval v4 = CACurrentMediaTime();
    uint64_t v5 = *(void *)(v2 + 136);
    *(CFTimeInterval *)(v2 + 120) = v4;
    *(void *)(v2 + 128) = v5;
    kdebug_trace();
    char v6 = *(void **)(v2 + 256);
    return [v6 eventFetcherDidReceiveEvents:v2];
  }
  return result;
}

void __40__UIEventFetcher__logSynchronizedEvent___block_invoke()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t TimeStamp = IOHIDEventGetTimeStamp();
  double v1 = _UIMediaTimeForMachTime(TimeStamp);
  uint64_t v2 = BKSHIDEventGetDigitizerAttributes();
  uint64_t v3 = _UIEventHIDPathAttributesForChild(v2);
  CFTimeInterval v4 = v3;
  if (v3)
  {
    [v3 hitTestLocationX];
    uint64_t v6 = v5;
    [v4 hitTestLocationY];
  }
  else
  {
    IOHIDEventGetFloatValue();
    uint64_t v6 = v8;
    IOHIDEventGetFloatValue();
  }
  uint64_t v9 = v7;

  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v11 = IOHIDEventGetIntegerValue();
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &_UIInternalPreference_HIDEventsDeliverImmediatly_block_invoke___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v13 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67110144;
      v14[1] = v11 != 0;
      __int16 v15 = 1024;
      int v16 = (IntegerValue >> 7) & 1;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2048;
      double v22 = v1;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "[UIEventFetcher] Synchronized event (t: %u, c: %u). Position: [%f:%f]. Timestamp: %f", (uint8_t *)v14, 0x2Cu);
    }
  }
}

uint64_t __47__UIEventFetcher__receiveSynchronizedHIDEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (void)_receiveHIDEvent:(__IOHIDEvent *)a3
{
  CFRetain(a3);
  cfRunLoop = self->_cfRunLoop;
  uint64_t v6 = (const void *)*MEMORY[0x1E4F1D410];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__UIEventFetcher__receiveHIDEvent___block_invoke;
  v7[3] = &unk_1E52D9CD0;
  v7[4] = self;
  v7[5] = a3;
  CFRunLoopPerformBlock(cfRunLoop, v6, v7);
  CFRunLoopWakeUp(self->_cfRunLoop);
}

void __35__UIEventFetcher__receiveHIDEvent___block_invoke(uint64_t a1)
{
  -[UIEventFetcher _receiveHIDEventInternal:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

uint64_t __43__UIEventFetcher__receiveHIDEventInternal___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 80)) {
    ++*(void *)(v1 + 88);
  }
  return result;
}

- (void)_resendHoverEventForContextID:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(__CFRunLoop **)(a1 + 16);
    CFTimeInterval v4 = (const void *)*MEMORY[0x1E4F1D410];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__UIEventFetcher__resendHoverEventForContextID___block_invoke;
    v5[3] = &unk_1E52E7FF0;
    v5[4] = a1;
    int v6 = a2;
    CFRunLoopPerformBlock(v3, v4, v5);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 16));
  }
}

uint64_t __48__UIEventFetcher__resendHoverEventForContextID___block_invoke(uint64_t result)
{
  uint64_t v1 = *(id **)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(unsigned int *)(result + 40);
    if ((_UIUpdateCycleEnabled() & 1) == 0)
    {
      id v3 = v1[29];
      if (!v3)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v5 = v1[29];
        v1[29] = v4;

        id v3 = v1[29];
      }
      unint64_t v6 = [v3 count];
      id v7 = v1[29];
      uint64_t v8 = [NSNumber numberWithUnsignedInt:v2];
      [v7 addObject:v8];

      if ([v1[10] isPaused] && objc_msgSend(v1[29], "count") > v6) {
        [v1[10] setPaused:0];
      }
    }
    uint64_t result = _UIUpdateCycleEnabled();
    if (result)
    {
      uint64_t result = -[UIEventFetcher _latestHoverEventForContextID:]((uint64_t)v1, v2);
      if (result)
      {
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3221225472;
        uint64_t v11 = __56__UIEventFetcher__resendHoverEventForContextIDInternal___block_invoke;
        uint64_t v12 = &unk_1E52D9CD0;
        uint64_t v13 = v1;
        uint64_t v14 = result;
        os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
        __56__UIEventFetcher__resendHoverEventForContextIDInternal___block_invoke((uint64_t)&v9);
        os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
        return objc_msgSend(v1[32], "eventFetcherDidReceiveEvents:", v1, v9, v10);
      }
    }
  }
  return result;
}

uint64_t __56__UIEventFetcher__resendHoverEventForContextIDInternal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (void)drainEventsIntoEnvironment:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__UIEventFetcher_drainEventsIntoEnvironment___block_invoke;
    v5[3] = &unk_1E52D9F98;
    v5[4] = a1;
    id v6 = v3;
    os_unfair_lock_lock(&__UIEventFetcherEventArrayAccessLock);
    __45__UIEventFetcher_drainEventsIntoEnvironment___block_invoke((uint64_t)v5);
    os_unfair_lock_unlock(&__UIEventFetcherEventArrayAccessLock);
  }
}

void __45__UIEventFetcher_drainEventsIntoEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 160);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v4 = *(id *)(v2 + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (!v5)
  {
LABEL_9:

    if (v3 == 4) {
      goto LABEL_26;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (!v11) {
      goto LABEL_24;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
LABEL_12:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * v14);
      uint64_t v16 = __deviceEventDrainPolicy(v15);
      switch(v16)
      {
        case 0:
LABEL_21:
          objc_msgSend(*(id *)(a1 + 40), "_enqueueHIDEvent:", v15, (void)v32);
          [v9 addObject:v15];
          goto LABEL_22;
        case 1:
          unint64_t TimeStamp = IOHIDEventGetTimeStamp();
          double v18 = _UIMediaTimeForMachTime(TimeStamp);
          double v19 = *(double *)(*(void *)(a1 + 32) + 120);
          break;
        case 2:
          unint64_t v17 = IOHIDEventGetTimeStamp();
          double v18 = _UIMediaTimeForMachTime(v17);
          double v19 = *(double *)(*(void *)(a1 + 32) + 128);
          break;
        default:
          goto LABEL_22;
      }
      if (v18 < v19) {
        goto LABEL_21;
      }
LABEL_22:
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (!v12)
        {
LABEL_24:

          [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsInArray:v9];
          goto LABEL_34;
        }
        goto LABEL_12;
      }
    }
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v41;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v41 != v7) {
      objc_enumerationMutation(v4);
    }
    if (_UIEventHIDEventWantsImmediateDelivery()) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }

LABEL_26:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(a1 + 40) _enqueueHIDEvent:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v23);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
LABEL_34:
  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  if (v26) {
    uint64_t v28 = *(void *)(v26 + 176);
  }
  *(void *)(*(void *)(a1 + 40) + 64) = v28;
  uint64_t v29 = *(void *)(a1 + 32);
  if (v29) {
    uint64_t v27 = *(void *)(v29 + 184);
  }
  *(void *)(*(void *)(a1 + 40) + 72) = v27;
  uint64_t v30 = *(void *)(a1 + 32);
  if (v30) {
    uint64_t v31 = *(void *)(v30 + 192);
  }
  else {
    uint64_t v31 = 0;
  }
  *(void *)(*(void *)(a1 + 40) + 80) = v31;
}

void __30__UIEventFetcher_filterEvent___block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if ([*(id *)(*(void *)(a1 + 32) + 80) isPaused])
  {
    [*(id *)(*(void *)(a1 + 32) + 80) setPaused:0];
    *(void *)(*(void *)(a1 + 32) + 152) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      *(void *)(v3 + 184) = 0;
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4)
      {
        *(void *)(v4 + 192) = 0;
        uint64_t v5 = *(void *)(a1 + 32);
        if (v5) {
          *(unsigned char *)(v5 + 168) = 0;
        }
      }
    }
    kdebug_trace();
  }
  kdebug_trace();
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 104) || !*(unsigned char *)(a1 + 88) || !*(unsigned char *)(a1 + 89) || !v2) {
    goto LABEL_8;
  }
  kdebug_trace();
  if (os_variant_has_internal_diagnostics())
  {
    if (os_variant_has_internal_diagnostics())
    {
      v51 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v97 = "-[UIEventFetcher filterEvent:]_block_invoke";
        __int16 v98 = 2048;
        uint64_t v99 = v2;
        _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "%s: Event filtering started with undelivered, filtered events: %lu", buf, 0x16u);
      }
      goto LABEL_108;
    }
    v51 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1E8FDF640) + 8);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[UIEventFetcher filterEvent:]_block_invoke";
      __int16 v98 = 2048;
      uint64_t v99 = v2;
      v52 = "%s: Event filtering started with undelivered, filtered events: %lu";
      uint64_t v53 = v51;
      os_log_type_t v54 = OS_LOG_TYPE_ERROR;
      uint32_t v55 = 22;
      goto LABEL_107;
    }
  }
  else
  {
    v51 = *(id *)(__UILogGetCategoryCachedImpl("EventFetcher", &qword_1E8FDF648) + 8);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v52 = "Event filtering started with undelivered, filtered events";
      uint64_t v53 = v51;
      os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
      uint32_t v55 = 2;
LABEL_107:
      _os_log_impl(&dword_1853B0000, v53, v54, v52, buf, v55);
    }
  }
LABEL_108:

  uint64_t v6 = *(void *)(a1 + 32);
LABEL_8:
  (*(void (**)(void))(*(void *)(v6 + 24) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) count];
  unint64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if ((int)v7 < 1) {
    goto LABEL_163;
  }
  if (qword_1E8FDF6C0 != -1) {
    dispatch_once(&qword_1E8FDF6C0, &__block_literal_global_147_0);
  }
  if (_MergedGlobals_900 < v7) {
    goto LABEL_22;
  }
  if (qword_1E8FDF6B0 != -1) {
    dispatch_once(&qword_1E8FDF6B0, &__block_literal_global_117_2);
  }
  if (byte_1E8FDF639)
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v8 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (int v85 = _UIInternalPreference_HIDEventsDeliverImmediatly,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_HIDEventsDeliverImmediatly))
    {
      BOOL v9 = 0;
    }
    else
    {
      do
      {
        BOOL v9 = v8 < v85;
        if (v8 < v85) {
          break;
        }
        _UIInternalPreferenceSync(v8, &_UIInternalPreference_HIDEventsDeliverImmediatly, @"HIDEventsDeliverImmediatly", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v85 = _UIInternalPreference_HIDEventsDeliverImmediatly;
      }
      while (v8 != _UIInternalPreference_HIDEventsDeliverImmediatly);
    }
    char v10 = byte_1EB257894 && v9;
  }
  else
  {
LABEL_22:
    char v10 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
  }
  unint64_t v11 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (qword_1E8FDF6C0 != -1) {
    dispatch_once(&qword_1E8FDF6C0, &__block_literal_global_147_0);
  }
  if (_MergedGlobals_900 < v11) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 3;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    goto LABEL_163;
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (!v13) {
    goto LABEL_118;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v91;
  while (2)
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v91 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v90 + 1) + 8 * v16);
      unsigned int Type = IOHIDEventGetType();
      int v19 = IOHIDEventGetType();
      switch(v19)
      {
        case 3:
          BOOL v23 = _UIEventHIDPressTypeForKeyboardHIDEvent() == -1;
LABEL_43:
          BOOL v21 = !v23;
          break;
        case 29:
          uint64_t IntegerValue = IOHIDEventGetIntegerValue();
          BOOL v23 = IntegerValue == 3 || IntegerValue == 0;
          goto LABEL_43;
        case 17:
          uint64_t v20 = _UIEventHIDUIScreenForHIDEvent(v17);
          BOOL v21 = [v20 _userInterfaceIdiom] == 3;

          break;
        default:
          BOOL v21 = 0;
          break;
      }
      if (Type == 6) {
        int v24 = _UIEventHIDIsScrollEvent(v17) ^ 1;
      }
      else {
        int v24 = 0;
      }
      if (((v21 | v24) & 1) != 0 || (Type <= 0x11 ? (BOOL v25 = ((1 << Type) & 0x208C0) == 0) : (BOOL v25 = 1), v25))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 5;
        goto LABEL_118;
      }
      if (_UIEventHIDEventWantsImmediateDelivery())
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 4;
        *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
        *(CFTimeInterval *)(*(void *)(a1 + 32) + 112) = CACurrentMediaTime();
        goto LABEL_118;
      }
      uint64_t v26 = *(void *)(a1 + 32);
      if (v26) {
        BOOL v27 = *(unsigned char *)(v26 + 168) != 0;
      }
      else {
        BOOL v27 = 0;
      }
      uint64_t v28 = *(void *)(v26 + 152);
      if (_UIEventHIDEventWantsImmediateDelivery()) {
        goto LABEL_67;
      }
      if (qword_1E8FDF6D8 != -1) {
        dispatch_once(&qword_1E8FDF6D8, &__block_literal_global_180_2);
      }
      if (byte_1E8FDF63E && ((v28 | 2) == 2 || v27))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        if (v29) {
          *(unsigned char *)(v29 + 168) = 1;
        }
      }
      else
      {
LABEL_67:
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 104)
          || CACurrentMediaTime() - *(double *)(*(void *)(a1 + 32) + 120) < 0.00075)
        {
          if (_UIEventHIDGetChildStylusEvent(v17)) {
            goto LABEL_115;
          }
          if (qword_1E8FDF6C8 != -1) {
            dispatch_once(&qword_1E8FDF6C8, &__block_literal_global_155_0);
          }
          if (!byte_1E8FDF63C) {
            goto LABEL_115;
          }
          uint64_t v30 = *(void **)(*(void *)(a1 + 32) + 80);
          if (!v30) {
            goto LABEL_115;
          }
          [v30 timestamp];
          double v32 = v31;
          [*(id *)(*(void *)(a1 + 32) + 80) targetTimestamp];
          double v34 = v33;
          double v35 = v33 - CACurrentMediaTime();
          if (v35 <= 0.0) {
            goto LABEL_115;
          }
          uint64_t v36 = *(void *)(a1 + 32);
          double v37 = *(double *)(v36 + 144);
          int v38 = *(unsigned __int8 *)(a1 + 89);
          uint64_t v39 = *(void *)(v36 + 152);
          uint64_t v40 = *(void *)(*(void *)(a1 + 72) + 8);
          if (qword_1E8FDF6D0 != -1) {
            dispatch_once(&qword_1E8FDF6D0, &__block_literal_global_158);
          }
          if (byte_1E8FDF63D)
          {
            qword_1EB256E18 = 0x3FE6666666666666;
            qword_1EB256E20 = 0x3FE6666666666666;
            double v41 = 0.7;
          }
          else
          {
            double v41 = *(double *)&qword_1EB256E20;
          }
          double v42 = CACurrentMediaTime();
          switch(v39)
          {
            case 2:
              double v41 = 0.7;
              break;
            case 1:
              double v41 = *(double *)&qword_1EB256E18;
              break;
            case 0:
              double v41 = *(double *)&qword_1EB256E20;
              break;
          }
          double v43 = v34 - v32;
          BOOL v44 = v38 == 0;
          *(double *)(v40 + 24) = v41;
          double v45 = v34 - v42;
          if (v45 < v43 * v41) {
            BOOL v44 = 1;
          }
          BOOL v46 = v37 > 0.0;
          if (v37 / v43 <= 0.1) {
            BOOL v46 = 0;
          }
          if (v44) {
            BOOL v47 = v45 < v43 * v41;
          }
          else {
            BOOL v47 = v46;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v47;
          kdebug_trace();
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
          {
            if (v35 < v43 * 0.85 && v35 > v43 * 0.7)
            {
              uint64_t v56 = *(void *)(a1 + 32);
              if (v56) {
                *(void *)(v56 + 176) = 0;
              }
            }
LABEL_115:
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            CFTimeInterval v57 = CACurrentMediaTime();
            uint64_t v58 = 6;
            if (v57 - *(double *)(*(void *)(a1 + 32) + 120) < 0.00075) {
              uint64_t v58 = 7;
            }
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v58;
            *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
            goto LABEL_118;
          }
          uint64_t v48 = *(void *)(a1 + 32);
          if (v48)
          {
            *(unsigned char *)(v48 + 168) = 1;
            uint64_t v49 = *(void *)(a1 + 32);
            if (v49) {
              *(double *)(v49 + 176) = v43 * 0.25;
            }
          }
        }
      }
      ++v16;
    }
    while (v14 != v16);
    uint64_t v50 = [v12 countByEnumeratingWithState:&v90 objects:v95 count:16];
    uint64_t v14 = v50;
    if (v50) {
      continue;
    }
    break;
  }
LABEL_118:

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 5)
  {
    if (qword_1E8FDF6D8 != -1) {
      dispatch_once(&qword_1E8FDF6D8, &__block_literal_global_180_2);
    }
    if (byte_1E8FDF63E)
    {
      uint64_t v59 = *(void *)(a1 + 32);
      if (v59) {
        *(unsigned char *)(v59 + 168) = 1;
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (qword_1E8FDF6C8 != -1) {
      dispatch_once(&qword_1E8FDF6C8, &__block_literal_global_155_0);
    }
    if (byte_1E8FDF63C)
    {
      v60 = [*(id *)(*(void *)(a1 + 32) + 8) lastObject];

      v61 = _UIEventHIDGetChildStylusEvent((uint64_t)v60);
      uint64_t v62 = *(void *)(a1 + 32);
      if (v61) {
        goto LABEL_130;
      }
      if ([*(id *)(v62 + 8) count] == 1)
      {
LABEL_150:
        uint64_t v73 = *(void *)(a1 + 32);
        if (v73) {
          *(unsigned char *)(v73 + 168) = 1;
        }
      }
      else
      {
        unint64_t v76 = [*(id *)(*(void *)(a1 + 32) + 8) count];
        uint64_t v62 = *(void *)(a1 + 32);
        if (v76 >= 2 && *(void *)(v62 + 152) == 2)
        {
          if (__deviceEventDrainPolicy((uint64_t)v60)) {
            goto LABEL_150;
          }
          uint64_t v62 = *(void *)(a1 + 32);
        }
LABEL_130:
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v63 = *(id *)(v62 + 8);
        uint64_t v64 = [v63 countByEnumeratingWithState:&v86 objects:v94 count:16];
        if (v64)
        {
          v65 = 0;
          v66 = 0;
          uint64_t v67 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v64; ++i)
            {
              if (*(void *)v87 != v67) {
                objc_enumerationMutation(v63);
              }
              uint64_t v69 = *(void *)(*((void *)&v86 + 1) + 8 * i);
              v70 = BKSHIDEventGetBaseAttributes();
              LODWORD(v71) = objc_msgSend(v70, "contextID", (void)v86);

              if (_UIEventHIDGetChildStylusEvent(v69))
              {
                if (v66)
                {
                  uint64_t v71 = v71;
                  if ([v66 containsIndex:v71])
                  {
                    LOBYTE(v64) = 1;
                    goto LABEL_153;
                  }
                }
                else
                {
                  v66 = objc_opt_new();
                  uint64_t v71 = v71;
                }
                v72 = v66;
              }
              else
              {
                if (v65)
                {
                  uint64_t v71 = v71;
                  if ([v65 containsIndex:v71])
                  {

                    goto LABEL_161;
                  }
                }
                else
                {
                  v65 = objc_opt_new();
                  uint64_t v71 = v71;
                }
                v72 = v65;
              }
              [v72 addIndex:v71];
            }
            uint64_t v64 = [v63 countByEnumeratingWithState:&v86 objects:v94 count:16];
          }
          while (v64);
        }
        else
        {
          v66 = 0;
          v65 = 0;
        }
LABEL_153:

        uint64_t v74 = [v66 count];
        if ((v64 & 1) == 0 && v74)
        {
LABEL_161:
          *(void *)(*(void *)(a1 + 32) + 152) = 0;
        }
        else
        {
          uint64_t v75 = *(void *)(a1 + 32);
          if (v75) {
            *(unsigned char *)(v75 + 168) = 1;
          }
        }
      }
    }
  }
LABEL_163:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (qword_1E8FDF6E0[0] != -1) {
      dispatch_once(qword_1E8FDF6E0, &__block_literal_global_189_0);
    }
    if (byte_1E8FDF63F)
    {
      uint64_t v77 = *(void *)(a1 + 32);
      if (*(void *)(v77 + 80))
      {
        v78 = [*(id *)(v77 + 8) lastObject];

        if (v78)
        {
          if (IOHIDEventGetType() == 11)
          {
            [*(id *)(*(void *)(a1 + 32) + 80) timestamp];
            double v80 = v79;
            [*(id *)(*(void *)(a1 + 32) + 80) targetTimestamp];
            double v82 = v81 - v80;
            double v83 = v81 - CACurrentMediaTime();
            if (v83 < 0.0) {
              double v83 = -v83;
            }
            if (v83 < v82 * 0.15)
            {
              uint64_t v84 = *(void *)(a1 + 32);
              if (v84) {
                *(unsigned char *)(v84 + 168) = 1;
              }
            }
          }
        }
      }
    }
  }
}

- (void)_setHIDEventObserver:(void *)a3 onQueue:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unint64_t v7 = *(const void **)(a1 + 48);
    if (v7)
    {
      int v8 = *(void **)(a1 + 64);
      BOOL v9 = _Block_copy(v7);
      [v8 removeObject:v9];
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke;
    uint64_t v17 = &unk_1E5304AC0;
    id v18 = v6;
    id v19 = v5;
    char v10 = _Block_copy(&v14);
    unint64_t v11 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v10;

    id v12 = *(void **)(a1 + 64);
    uint64_t v13 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v12, "addObject:", v13, v14, v15, v16, v17);

    -[UIEventFetcher _requestFilterChainUpdate](a1);
  }
}

id __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_2;
  aBlock[3] = &unk_1E5304A98;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);

  return v5;
}

void __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t Copy = IOHIDEventCreateCopy();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_3;
  v8[3] = &unk_1E52DA9A8;
  id v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = Copy;
  dispatch_async(v5, v8);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v6, v7);
}

void __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (void)_removeHIDEventObserver
{
  if (a1)
  {
    uint64_t v2 = *(const void **)(a1 + 48);
    if (v2)
    {
      id v3 = *(void **)(a1 + 64);
      id v4 = _Block_copy(v2);
      [v3 removeObject:v4];

      -[UIEventFetcher _requestFilterChainUpdate](a1);
      id v5 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
  }
}

- (void)_setHIDGameControllerEventObserver:(void *)a3 onQueue:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(const void **)(a1 + 40);
    if (v7)
    {
      id v8 = *(void **)(a1 + 64);
      id v9 = _Block_copy(v7);
      [v8 removeObject:v9];
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke;
    uint64_t v17 = &unk_1E5304AC0;
    id v18 = v6;
    id v19 = v5;
    uint64_t v10 = _Block_copy(&v14);
    unint64_t v11 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v10;

    id v12 = *(void **)(a1 + 64);
    uint64_t v13 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v12, "addObject:", v13, v14, v15, v16, v17);

    -[UIEventFetcher _requestFilterChainUpdate](a1);
  }
}

id __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_2;
  aBlock[3] = &unk_1E5304A98;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_2(uint64_t a1, const void *a2)
{
  int Type = IOHIDEventGetType();
  if (Type > 5)
  {
    if (Type != 6 && Type != 35 && (Type != 11 || !_UIEventHIDGetDescendantPointerEvent((uint64_t)a2))) {
      return (*(uint64_t (**)(void, const void *, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v5, v6);
    }
LABEL_42:
    CFRetain(a2);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_3;
    v23[3] = &unk_1E52DA9A8;
    BOOL v21 = *(NSObject **)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    BOOL v25 = a2;
    dispatch_async(v21, v23);

    return (*(uint64_t (**)(void, const void *, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v5, v6);
  }
  if (Type == 1)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v13 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 65280 && v13 == 59) {
      goto LABEL_42;
    }
  }
  else if (Type == 3)
  {
    uint64_t v7 = IOHIDEventGetIntegerValue();
    unint64_t v8 = IOHIDEventGetIntegerValue();
    unint64_t v9 = v8;
    if (v7 == 12
      && (int64x2_t v10 = vdupq_n_s64(v8),
          vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v10, (int64x2_t)xmmword_186B9BEC0), (int32x4_t)vceqq_s64(v10, (int64x2_t)xmmword_186B9BED0)))) & 1 | (v8 == 178)))
    {
      BOOL v11 = 1;
    }
    else
    {
      BOOL v14 = v7 != 12 || v8 - 65 >= 5;
      BOOL v11 = !v14;
    }
    if (IOHIDEventGetType() == 3)
    {
      uint64_t v15 = IOHIDEventGetIntegerValue();
      switch(v15)
      {
        case 7:
          goto LABEL_42;
        case 255:
          goto LABEL_42;
        case 12:
          uint64_t v16 = IOHIDEventGetIntegerValue();
          if (v16 == 184 || v16 == 430 || v16 == 669) {
            goto LABEL_42;
          }
          break;
      }
    }
    BOOL v17 = v7 == 12 && v9 == 547;
    BOOL v18 = v17;
    BOOL v19 = v7 == 1 && v9 == 134;
    char v20 = v19 || v11;
    if ((v20 & 1) != 0 || v18) {
      goto LABEL_42;
    }
  }
  return (*(uint64_t (**)(void, const void *, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v5, v6);
}

void __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (void)_removeHIDGameControllerEventObserver
{
  if (a1)
  {
    uint64_t v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      id v3 = *(void **)(a1 + 64);
      id v4 = _Block_copy(v2);
      [v3 removeObject:v4];

      -[UIEventFetcher _requestFilterChainUpdate](a1);
      uint64_t v5 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
  }
}

- (void)setSynchronizer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 248), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFetcherSink, 0);
  objc_storeStrong((id *)&self->_synchronizer, 0);
  objc_storeStrong((id *)&self->_latestHoverEventsByContextID, 0);
  objc_storeStrong((id *)&self->_contextIDsNeedingHoverEventResend, 0);
  objc_storeStrong((id *)&self->_latestMoveDragEventsBySessionID, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_eventFilters, 0);
  objc_storeStrong(&self->_watchSystemAppFilter, 0);
  objc_storeStrong(&self->_passiveObservationFilterGenerator, 0);
  objc_storeStrong(&self->_gameControllerEventFilterGenerator, 0);
  objc_storeStrong(&self->_addToFilteredEventsBlock, 0);
  objc_storeStrong(&self->_receiveBlock, 0);
  objc_storeStrong((id *)&self->_incomingHIDEventsFiltered, 0);
}

@end