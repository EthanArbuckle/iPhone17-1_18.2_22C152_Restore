@interface CACTouchEventObserver
- (AXMutableReplayableGesture)gestureBeingRecorded;
- (BOOL)_isLiftEvent:(id)a3;
- (BOOL)_isTouchEvent:(id)a3;
- (BOOL)isRecording;
- (CACTouchEventObserver)init;
- (CACTouchEventObserverDelegate)delegate;
- (double)startTimeForGestureBeingRecorded;
- (id)stopRecordingGesture;
- (void)_didReceiveEvent:(id)a3;
- (void)_recordEvent:(id)a3;
- (void)beginObserving;
- (void)endObserving;
- (void)setDelegate:(id)a3;
- (void)setGestureBeingRecorded:(id)a3;
- (void)setStartTimeForGestureBeingRecorded:(double)a3;
- (void)startRecordingGesture;
@end

@implementation CACTouchEventObserver

- (CACTouchEventObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)CACTouchEventObserver;
  v2 = [(CACTouchEventObserver *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F22898]);
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [v3 initWithHIDTapIdentifier:v5 HIDEventTapPriority:33 systemEventTapIdentifier:0 systemEventTapPriority:0];
    eventProcessor = v2->_eventProcessor;
    v2->_eventProcessor = (AXEventProcessor *)v6;

    objc_initWeak(&location, v2);
    [(AXEventProcessor *)v2->_eventProcessor setHIDEventFilterMask:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __29__CACTouchEventObserver_init__block_invoke;
    v9[3] = &unk_264D125A0;
    objc_copyWeak(&v10, &location);
    [(AXEventProcessor *)v2->_eventProcessor setHIDEventHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __29__CACTouchEventObserver_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__CACTouchEventObserver_init__block_invoke_2;
  v8[3] = &unk_264D117C0;
  id v9 = WeakRetained;
  id v10 = v3;
  id v5 = v3;
  id v6 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  return 0;
}

uint64_t __29__CACTouchEventObserver_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveEvent:*(void *)(a1 + 40)];
}

- (void)beginObserving
{
  eventProcessor = self->_eventProcessor;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXEventProcessor *)eventProcessor beginHandlingHIDEventsForReason:v4];
}

- (void)endObserving
{
  eventProcessor = self->_eventProcessor;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXEventProcessor *)eventProcessor endHandlingHIDEventsForReason:v4];
}

- (BOOL)isRecording
{
  v2 = [(CACTouchEventObserver *)self gestureBeingRecorded];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)startRecordingGesture
{
  id v3 = objc_alloc_init(MEMORY[0x263F228F0]);
  [(CACTouchEventObserver *)self setGestureBeingRecorded:v3];

  [(CACTouchEventObserver *)self setStartTimeForGestureBeingRecorded:0.0];
  id v4 = +[CACDisplayManager sharedManager];
  [v4 showLiveRecordingGesturePreview];
}

- (id)stopRecordingGesture
{
  id v3 = [(CACTouchEventObserver *)self gestureBeingRecorded];
  [(CACTouchEventObserver *)self setGestureBeingRecorded:0];
  id v4 = +[CACDisplayManager sharedManager];
  [v4 hideLiveRecordingGesturePreview];

  return v3;
}

- (BOOL)_isTouchEvent:(id)a3
{
  id v3 = [a3 handInfo];
  int v4 = [v3 eventType];

  return (v4 - 1) < 2;
}

- (BOOL)_isLiftEvent:(id)a3
{
  id v3 = [a3 handInfo];
  unsigned int v4 = [v3 eventType];

  return (v4 < 0xB) & (0x740u >> v4);
}

- (void)_recordEvent:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37 = [MEMORY[0x263EFF9A0] dictionary];
  v36 = [MEMORY[0x263EFF9A0] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = [v4 handInfo];
  id v6 = [v5 paths];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_super v12 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "pathIdentity"));
        if ([(CACTouchEventObserver *)self _isLiftEvent:v4])
        {
          v13 = +[CACDisplayManager sharedManager];
          [v13 removeTrackingForFingerIdentifier:v12];
        }
        else
        {
          [v11 pathLocation];
          double v15 = v14;
          double v17 = v16;
          v18 = [MEMORY[0x263F82B60] mainScreen];
          [v18 bounds];
          CACPortraitUpRectFromViewRect(0, v19, v20, v21, v22);
          double v24 = v23;
          double v26 = v25;

          v27 = objc_msgSend(MEMORY[0x263F08D40], "axValueWithCGPoint:", CACViewPointFromPortraitUpPoint(0, v15 * v24, v17 * v26));
          [v37 setObject:v27 forKeyedSubscript:v12];

          v28 = NSNumber;
          [v11 orbValue];
          v13 = objc_msgSend(v28, "numberWithFloat:");
          [v36 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v8);
  }

  if (!dword_2689756AC) {
    mach_timebase_info((mach_timebase_info_t)&_recordEvent___TimebaseInfo);
  }
  uint64_t v29 = [v4 HIDTime];
  double v30 = (double)(v29 * (unint64_t)_recordEvent___TimebaseInfo / dword_2689756AC)
      / 1000000000.0;
  [(CACTouchEventObserver *)self startTimeForGestureBeingRecorded];
  if (v31 == 0.0)
  {
    [(CACTouchEventObserver *)self setStartTimeForGestureBeingRecorded:v30];
    double v32 = 0.0;
  }
  else
  {
    [(CACTouchEventObserver *)self startTimeForGestureBeingRecorded];
    double v32 = v30 - v33;
  }
  v34 = [(CACTouchEventObserver *)self gestureBeingRecorded];
  [v34 addPointsByFingerIdentifier:v37 forces:v36 atTime:v32];

  v35 = +[CACDisplayManager sharedManager];
  [v35 addPointsToLiveRecordingGesturePreviewByFingerIdentifier:v37 forces:v36 atTime:v32];
}

- (void)_didReceiveEvent:(id)a3
{
  id v6 = a3;
  id v4 = [(CACTouchEventObserver *)self gestureBeingRecorded];

  if (v4) {
    [(CACTouchEventObserver *)self _recordEvent:v6];
  }
  if ([v6 senderID] != 0x8000000817319372)
  {
    if ([(CACTouchEventObserver *)self _isTouchEvent:v6])
    {
      if (self->_areTouchesDown) {
        goto LABEL_11;
      }
      self->_areTouchesDown = 1;
      id v5 = [(CACTouchEventObserver *)self delegate];
      [v5 didObserveFirstTouchDownForObserver:self];
      goto LABEL_10;
    }
    if ([(CACTouchEventObserver *)self _isLiftEvent:v6] && self->_areTouchesDown)
    {
      self->_areTouchesDown = 0;
      id v5 = [(CACTouchEventObserver *)self delegate];
      [v5 didObserveLastTouchUpForObserver:self];
LABEL_10:
    }
  }
LABEL_11:
}

- (CACTouchEventObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACTouchEventObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXMutableReplayableGesture)gestureBeingRecorded
{
  return self->_gestureBeingRecorded;
}

- (void)setGestureBeingRecorded:(id)a3
{
}

- (double)startTimeForGestureBeingRecorded
{
  return self->_startTimeForGestureBeingRecorded;
}

- (void)setStartTimeForGestureBeingRecorded:(double)a3
{
  self->_startTimeForGestureBeingRecorded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureBeingRecorded, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
}

@end