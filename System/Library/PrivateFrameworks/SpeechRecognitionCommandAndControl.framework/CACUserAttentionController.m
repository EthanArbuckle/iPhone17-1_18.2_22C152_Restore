@interface CACUserAttentionController
- (BOOL)_detectionStartedForType:(unint64_t)a3;
- (BOOL)_deviceSupportsFaceDetection;
- (BOOL)_isDeviceLowered;
- (BOOL)_restartFaceAttentionAwarenessClient:(id *)a3;
- (BOOL)_startFaceAttentionAwarenessClient:(id *)a3;
- (BOOL)_startTouchAttentionAwarenessClient:(id *)a3;
- (BOOL)_stopFaceAttentionAwarenessClient:(id *)a3;
- (BOOL)_stopTouchAttentionAwarenessClient:(id *)a3;
- (BOOL)startIfNeeded:(id *)a3;
- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4;
- (BOOL)stopIfNeeded:(id *)a3;
- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4;
- (CACUserAttentionController)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6;
- (CACUserAttentionController)initWithSignalProviderFactory:(id)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5;
- (CACUserAttentionControllerDelegate)delegate;
- (void)_handleFaceAttentionEvent:(id)a3;
- (void)_handleFaceInterruptNotification:(unint64_t)a3;
- (void)_handleTouchAttentionEvent:(id)a3;
- (void)_setDetectionStarted:(BOOL)a3 forType:(unint64_t)a4;
- (void)_setDeviceLowered:(BOOL)a3;
- (void)_startWakeGestureManagerIfNeeded;
- (void)_stopWakeGestureManagerIfNeeded;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startIfNeededForTypes:(unint64_t)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4;
@end

@implementation CACUserAttentionController

- (CACUserAttentionController)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6
{
  BOOL v6 = a6;
  v9 = [[CACUserAttentionSignalProviderFactory alloc] initWithSamplingInterval:a5 attentionLossTimeout:a3 supportedAttentionAwarenessEvents:a4];
  v10 = [(CACUserAttentionController *)self initWithSignalProviderFactory:v9 supportedAttentionAwarenessEvents:a5 deviceSupportsRaiseGestureDetection:v6];

  return v10;
}

- (CACUserAttentionController)initWithSignalProviderFactory:(id)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CACUserAttentionController;
  v10 = [(CACUserAttentionController *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userAttentionSignalProviderFactory, a3);
    v11->_supportedAttentionAwarenessEvents = a4;
    v11->_deviceSupportsRaiseGestureDetection = a5;
    v11->_deviceLowered = 0;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.SpeechRecognitionCore.AttentionAwarenessQueue", 0);
    attentionAwarenessHandlerQueue = v11->_attentionAwarenessHandlerQueue;
    v11->_attentionAwarenessHandlerQueue = (OS_dispatch_queue *)v12;
  }
  return v11;
}

- (void)dealloc
{
}

- (BOOL)startIfNeeded:(id *)a3
{
  return [(CACUserAttentionController *)self startIfNeededForTypes:7 error:a3];
}

- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5 = a3;
  if ((a3 & 1) != 0 && ![(CACUserAttentionController *)self _detectionStartedForType:1])
  {
    if (![(CACUserAttentionController *)self _startFaceAttentionAwarenessClient:a4])return 0; {
    [(CACUserAttentionController *)self _setDetectionStarted:1 forType:1];
    }
  }
  if ((v5 & 2) != 0 && ![(CACUserAttentionController *)self _detectionStartedForType:2])
  {
    if ([(CACUserAttentionController *)self _startTouchAttentionAwarenessClient:a4])
    {
      [(CACUserAttentionController *)self _setDetectionStarted:1 forType:2];
      goto LABEL_9;
    }
    return 0;
  }
LABEL_9:
  if ((v5 & 4) == 0 || [(CACUserAttentionController *)self _detectionStartedForType:4]) {
    return 1;
  }
  [(CACUserAttentionController *)self _startWakeGestureManagerIfNeeded];
  BOOL v7 = 1;
  [(CACUserAttentionController *)self _setDetectionStarted:1 forType:4];
  return v7;
}

- (BOOL)stopIfNeeded:(id *)a3
{
  return [(CACUserAttentionController *)self stopIfNeededForTypes:7 error:a3];
}

- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5 = a3;
  if ((a3 & 1) != 0 && [(CACUserAttentionController *)self _detectionStartedForType:1])
  {
    BOOL v7 = [(CACUserAttentionController *)self _stopFaceAttentionAwarenessClient:a4];
    if (!v7) {
      return v7;
    }
    [(CACUserAttentionController *)self _setDetectionStarted:0 forType:1];
  }
  if ((v5 & 2) != 0 && [(CACUserAttentionController *)self _detectionStartedForType:2])
  {
    BOOL v7 = [(CACUserAttentionController *)self _stopTouchAttentionAwarenessClient:a4];
    if (!v7) {
      return v7;
    }
    [(CACUserAttentionController *)self _setDetectionStarted:0 forType:2];
  }
  if ((v5 & 4) != 0 && [(CACUserAttentionController *)self _detectionStartedForType:4])
  {
    [(CACUserAttentionController *)self _stopWakeGestureManagerIfNeeded];
    [(CACUserAttentionController *)self _setDetectionStarted:0 forType:4];
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)_startFaceAttentionAwarenessClient:(id *)a3
{
  char v5 = [(CACUserAttentionSignalProviderFactory *)self->_userAttentionSignalProviderFactory faceAttentionAwarenessClient];
  faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
  self->_faceAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  BOOL v7 = self->_faceAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke;
  v15[3] = &unk_264D122D8;
  objc_copyWeak(&v16, &location);
  [(AWAttentionAwarenessClient *)v7 setEventHandlerWithQueue:attentionAwarenessHandlerQueue block:v15];
  id v9 = self->_faceAttentionAwarenessClient;
  uint64_t v10 = MEMORY[0x263EF83A0];
  id v11 = MEMORY[0x263EF83A0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke_2;
  v13[3] = &unk_264D12300;
  objc_copyWeak(&v14, &location);
  [(AWAttentionAwarenessClient *)v9 setNotificationHandlerWithQueue:v10 block:v13];

  LOBYTE(a3) = [(AWAttentionAwarenessClient *)self->_faceAttentionAwarenessClient resumeWithError:a3];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleFaceAttentionEvent:v3];
}

void __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleFaceInterruptNotification:a2];
}

- (BOOL)_startTouchAttentionAwarenessClient:(id *)a3
{
  char v5 = [(CACUserAttentionSignalProviderFactory *)self->_userAttentionSignalProviderFactory touchAttentionAwarenessClient];
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  BOOL v7 = self->_touchAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  dispatch_queue_t v12 = __66__CACUserAttentionController__startTouchAttentionAwarenessClient___block_invoke;
  v13 = &unk_264D122D8;
  objc_copyWeak(&v14, &location);
  [(AWAttentionAwarenessClient *)v7 setEventHandlerWithQueue:attentionAwarenessHandlerQueue block:&v10];
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_touchAttentionAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __66__CACUserAttentionController__startTouchAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleTouchAttentionEvent:v3];
}

- (BOOL)_stopFaceAttentionAwarenessClient:(id *)a3
{
  char v4 = [(AWAttentionAwarenessClient *)self->_faceAttentionAwarenessClient invalidateWithError:a3];
  faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
  self->_faceAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_stopTouchAttentionAwarenessClient:(id *)a3
{
  char v4 = [(AWAttentionAwarenessClient *)self->_touchAttentionAwarenessClient invalidateWithError:a3];
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_restartFaceAttentionAwarenessClient:(id *)a3
{
  if ([(CACUserAttentionController *)self _detectionStartedForType:1])
  {
    faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
    return [(AWAttentionAwarenessClient *)faceAttentionAwarenessClient resetAttentionLostTimeoutWithError:a3];
  }
  else
  {
    return [(CACUserAttentionController *)self startIfNeededForTypes:1 error:a3];
  }
}

- (void)_handleFaceAttentionEvent:(id)a3
{
  unint64_t v4 = [a3 eventMask];
  if ([(CACUserAttentionController *)self _isDeviceLowered])
  {
    char v5 = 0;
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v7 = 1;
    uint64_t v8 = 3;
    if ((v4 & 8) == 0) {
      uint64_t v8 = (v4 >> 7) & 4;
    }
    if ((v4 & 0x80) == 0) {
      uint64_t v7 = v8;
    }
    uint64_t v6 = (v4 & 1) != 0;
    if (v4) {
      char v5 = 0;
    }
    else {
      char v5 = (void *)v7;
    }
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__CACUserAttentionController__handleFaceAttentionEvent___block_invoke;
  v9[3] = &unk_264D12328;
  v10[1] = (id)v6;
  objc_copyWeak(v10, &location);
  v10[2] = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __56__CACUserAttentionController__handleFaceAttentionEvent___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    [v2 userAttentionController:v3 didLoseAttentionWithEvent:*(void *)(a1 + 40)];
  }
  else
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    [v2 userAttentionController:v3 didGainAttentionWithEvent:*(void *)(a1 + 48)];
  }
}

- (void)_handleFaceInterruptNotification:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v4 = [(CACUserAttentionController *)self delegate];
    [v4 userAttentionControllerAttentionAwarenessInterruptionEnded:self];
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    id v4 = [(CACUserAttentionController *)self delegate];
    [v4 userAttentionControllerAttentionAwarenessInterrupted:self];
  }
}

- (void)_handleTouchAttentionEvent:(id)a3
{
  unint64_t v4 = [a3 eventMask];
  if ((v4 & 8) != 0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = (v4 >> 7) & 4;
  }
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CACUserAttentionController__handleTouchAttentionEvent___block_invoke;
  v6[3] = &unk_264D12328;
  v7[1] = 0;
  objc_copyWeak(v7, &location);
  v7[2] = (id)v5;
  dispatch_async(MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __57__CACUserAttentionController__handleTouchAttentionEvent___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    [v2 userAttentionController:v3 didLoseAttentionWithEvent:*(void *)(a1 + 40)];
  }
  else
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    [v2 userAttentionController:v3 didGainAttentionWithEvent:*(void *)(a1 + 48)];
  }
}

- (void)_startWakeGestureManagerIfNeeded
{
  if (![(CACUserAttentionController *)self _deviceSupportsFaceDetection]
    && self->_deviceSupportsRaiseGestureDetection)
  {
    id v3 = [(CACUserAttentionSignalProviderFactory *)self->_userAttentionSignalProviderFactory wakeGestureManager];
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = v3;

    [(CMWakeGestureManager *)self->_wakeGestureManager setDelegate:self];
    uint64_t v5 = self->_wakeGestureManager;
    [(CMWakeGestureManager *)v5 startWakeGestureUpdates];
  }
}

- (void)_stopWakeGestureManagerIfNeeded
{
  if (![(CACUserAttentionController *)self _deviceSupportsFaceDetection]
    && self->_deviceSupportsRaiseGestureDetection)
  {
    [(CMWakeGestureManager *)self->_wakeGestureManager stopWakeGestureUpdates];
    [(CMWakeGestureManager *)self->_wakeGestureManager setDelegate:0];
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = 0;
  }
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke;
  block[3] = &unk_264D12350;
  v6[1] = (id)a4;
  objc_copyWeak(v6, &location);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if ((unint64_t)(v1 - 2) >= 2)
  {
    if (v1 != 1)
    {
      id v6 = 0;
      goto LABEL_13;
    }
    id v14 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _setDeviceLowered:0];

    id v16 = objc_loadWeakRetained(v14);
    id v27 = 0;
    char v17 = [v16 stopIfNeededForTypes:1 error:&v27];
    id v6 = v27;

    if ((v17 & 1) == 0)
    {
      v18 = CACLogAttentionAware();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_2((uint64_t)v6, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    uint64_t v7 = objc_loadWeakRetained(v14);
    v25 = [v7 delegate];
    id v26 = objc_loadWeakRetained(v14);
    [v25 userAttentionController:v26 didGainAttentionWithEvent:2];

    goto LABEL_11;
  }
  v2 = (id *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 _setDeviceLowered:1];

  id v4 = objc_loadWeakRetained(v2);
  id v28 = 0;
  char v5 = [v4 _restartFaceAttentionAwarenessClient:&v28];
  id v6 = v28;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = CACLogAttentionAware();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_11:
  }
LABEL_13:
}

- (BOOL)_detectionStartedForType:(unint64_t)a3
{
  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  char v5 = [(NSMutableDictionary *)attentionDetectionStatuses objectForKeyedSubscript:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)_setDetectionStarted:(BOOL)a3 forType:(unint64_t)a4
{
  BOOL v5 = a3;
  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  if (attentionDetectionStatuses)
  {
    uint64_t v8 = attentionDetectionStatuses;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v9 = self->_attentionDetectionStatuses;
  self->_attentionDetectionStatuses = v8;

  id v12 = [NSNumber numberWithBool:v5];
  uint64_t v10 = self->_attentionDetectionStatuses;
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v10 setObject:v12 forKeyedSubscript:v11];
}

- (BOOL)_deviceSupportsFaceDetection
{
  return LOBYTE(self->_supportedAttentionAwarenessEvents) >> 7;
}

- (CACUserAttentionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACUserAttentionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_isDeviceLowered
{
  return self->_deviceLowered;
}

- (void)_setDeviceLowered:(BOOL)a3
{
  self->_deviceLowered = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousCallQueue, 0);
  objc_storeStrong((id *)&self->_attentionDetectionStatuses, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessHandlerQueue, 0);
  objc_storeStrong((id *)&self->_wakeGestureManager, 0);
  objc_storeStrong((id *)&self->_touchAttentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_faceAttentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_userAttentionSignalProviderFactory, 0);
}

- (void)startIfNeededForTypes:(unint64_t)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    if (!self->_asynchronousCallQueue)
    {
      uint64_t v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SpeechRecognitionCore.CACUserAttentionControllerQueue", 0);
      asynchronousCallQueue = self->_asynchronousCallQueue;
      self->_asynchronousCallQueue = v11;
    }
    objc_initWeak(&location, self);
    uint64_t v13 = self->_asynchronousCallQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke;
    block[3] = &unk_264D123A0;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a3;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(v13, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
}

void __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  id v11 = 0;
  [WeakRetained startIfNeededForTypes:v3 error:&v11];
  id v4 = v11;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2;
  block[3] = &unk_264D12378;
  BOOL v5 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

uint64_t __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end