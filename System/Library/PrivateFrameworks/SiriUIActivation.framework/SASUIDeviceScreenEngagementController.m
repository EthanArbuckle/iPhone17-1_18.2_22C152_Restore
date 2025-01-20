@interface SASUIDeviceScreenEngagementController
- (BOOL)_detectionStartedForType:(unint64_t)a3;
- (BOOL)_startButtonPressAttentionAwarenessClient:(id *)a3;
- (BOOL)_startTouchAttentionAwarenessClient:(id *)a3;
- (BOOL)_stopButtonPressAttentionAwarenessClient:(id *)a3;
- (BOOL)_stopTouchAttentionAwarenessClient:(id *)a3;
- (BOOL)startIfNeeded:(id *)a3;
- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4;
- (BOOL)stopIfNeeded:(id *)a3;
- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4;
- (SASUIDeviceScreenEngagementController)initWithSamplingInterval:(double)a3 attentionLostTimeout:(double)a4;
- (SASUIDeviceScreenEngagementController)initWithSignalProviderFactory:(id)a3;
- (SASUIDeviceScreenEngagementControllerDelegate)delegate;
- (void)_handleButtonPressAttentionEvent:(id)a3;
- (void)_handleTouchAttentionEvent:(id)a3;
- (void)_setDetectionStarted:(BOOL)a3 forType:(unint64_t)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startIfNeededForTypes:(unint64_t)a3 completionQueue:(id)a4 completion:(id)a5;
@end

@implementation SASUIDeviceScreenEngagementController

void __68__SASUIDeviceScreenEngagementController__handleTouchAttentionEvent___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    [v2 deviceScreenEngagementController:v3 didLoseAttentionWithEvent:*(void *)(a1 + 40)];
  }
  else
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    [v2 deviceScreenEngagementController:v3 didGainAttentionWithEvent:*(void *)(a1 + 48)];
  }
}

- (SASUIDeviceScreenEngagementControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SASUIDeviceScreenEngagementControllerDelegate *)WeakRetained;
}

void __77__SASUIDeviceScreenEngagementController__startTouchAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleTouchAttentionEvent:v3];
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
  v6[2] = __68__SASUIDeviceScreenEngagementController__handleTouchAttentionEvent___block_invoke;
  v6[3] = &unk_2645BCC90;
  v7[1] = 0;
  objc_copyWeak(v7, &location);
  v7[2] = (id)v5;
  dispatch_async(MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (SASUIDeviceScreenEngagementController)initWithSamplingInterval:(double)a3 attentionLostTimeout:(double)a4
{
  uint64_t v5 = [[SASUIUserEngagementProviderFactory alloc] initWithSamplingInterval:a3 attentionLostTimeout:a4];
  v6 = [(SASUIDeviceScreenEngagementController *)self initWithSignalProviderFactory:v5];

  return v6;
}

- (SASUIDeviceScreenEngagementController)initWithSignalProviderFactory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASUIDeviceScreenEngagementController;
  v6 = [(SASUIDeviceScreenEngagementController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userAttentionSignalProviderFactory, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.siri.AttentionAwarenessQueue", 0);
    attentionAwarenessHandlerQueue = v7->_attentionAwarenessHandlerQueue;
    v7->_attentionAwarenessHandlerQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[SASUIDeviceScreenEngagementController dealloc]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_221664000, a2, OS_LOG_TYPE_ERROR, "%s Failed to stop user attention: %@", (uint8_t *)&v2, 0x16u);
}

- (void)_setDetectionStarted:(BOOL)a3 forType:(unint64_t)a4
{
  BOOL v5 = a3;
  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  if (attentionDetectionStatuses)
  {
    dispatch_queue_t v8 = attentionDetectionStatuses;
  }
  else
  {
    dispatch_queue_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v9 = self->_attentionDetectionStatuses;
  self->_attentionDetectionStatuses = v8;

  id v12 = [NSNumber numberWithBool:v5];
  v10 = self->_attentionDetectionStatuses;
  objc_super v11 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v10 setObject:v12 forKeyedSubscript:v11];
}

- (BOOL)_detectionStartedForType:(unint64_t)a3
{
  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  __int16 v4 = [NSNumber numberWithUnsignedInteger:a3];
  BOOL v5 = [(NSMutableDictionary *)attentionDetectionStatuses objectForKeyedSubscript:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)_startTouchAttentionAwarenessClient:(id *)a3
{
  BOOL v5 = [(SASUIUserEngagementProviderFactory *)self->_userAttentionSignalProviderFactory touchAttentionAwarenessClient];
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_touchAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __77__SASUIDeviceScreenEngagementController__startTouchAttentionAwarenessClient___block_invoke;
  v13 = &unk_2645BCC68;
  objc_copyWeak(&v14, &location);
  [(AWAttentionAwarenessClient *)v7 setEventHandlerWithQueue:attentionAwarenessHandlerQueue block:&v10];
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_touchAttentionAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (BOOL)_startButtonPressAttentionAwarenessClient:(id *)a3
{
  BOOL v5 = [(SASUIUserEngagementProviderFactory *)self->_userAttentionSignalProviderFactory buttonPressAwarenessClient];
  buttonPressAwarenessClient = self->_buttonPressAwarenessClient;
  self->_buttonPressAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_buttonPressAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __83__SASUIDeviceScreenEngagementController__startButtonPressAttentionAwarenessClient___block_invoke;
  v13 = &unk_2645BCC68;
  objc_copyWeak(&v14, &location);
  [(AWAttentionAwarenessClient *)v7 setEventHandlerWithQueue:attentionAwarenessHandlerQueue block:&v10];
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_buttonPressAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __83__SASUIDeviceScreenEngagementController__startButtonPressAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleButtonPressAttentionEvent:v3];
}

- (void)_handleButtonPressAttentionEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)(([v4 eventMask] << 62 >> 63) & 5);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SASUIDeviceScreenEngagementController__handleButtonPressAttentionEvent___block_invoke;
  id v7[3] = &unk_2645BCCB8;
  v9[1] = v5;
  objc_copyWeak(v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __74__SASUIDeviceScreenEngagementController__handleButtonPressAttentionEvent___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    [v2 deviceScreenEngagementController:v3 didGainAttentionWithEvent:*(void *)(a1 + 48)];
  }
  else
  {
    if (*(void *)(a1 + 32)) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v2 = [WeakRetained delegate];
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    [v2 deviceScreenEngagementController:v3 didLoseAttentionWithEvent:0];
  }
}

- (BOOL)startIfNeeded:(id *)a3
{
  return [(SASUIDeviceScreenEngagementController *)self startIfNeededForTypes:10 error:a3];
}

- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5 = a3;
  if ((a3 & 2) != 0
    && ![(SASUIDeviceScreenEngagementController *)self _detectionStartedForType:2])
  {
    if (![(SASUIDeviceScreenEngagementController *)self _startTouchAttentionAwarenessClient:a4])return 0; {
    [(SASUIDeviceScreenEngagementController *)self _setDetectionStarted:1 forType:2];
    }
  }
  if ((v5 & 8) != 0
    && ![(SASUIDeviceScreenEngagementController *)self _detectionStartedForType:8])
  {
    if ([(SASUIDeviceScreenEngagementController *)self _startButtonPressAttentionAwarenessClient:a4])
    {
      BOOL v7 = 1;
      [(SASUIDeviceScreenEngagementController *)self _setDetectionStarted:1 forType:8];
      return v7;
    }
    return 0;
  }
  return 1;
}

- (BOOL)stopIfNeeded:(id *)a3
{
  return [(SASUIDeviceScreenEngagementController *)self stopIfNeededForTypes:10 error:a3];
}

- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  if ([(SASUIDeviceScreenEngagementController *)self _detectionStartedForType:2])
  {
    BOOL v6 = [(SASUIDeviceScreenEngagementController *)self _stopTouchAttentionAwarenessClient:a4];
    if (!v6) {
      return v6;
    }
    [(SASUIDeviceScreenEngagementController *)self _setDetectionStarted:0 forType:2];
  }
  if (![(SASUIDeviceScreenEngagementController *)self _detectionStartedForType:8])
  {
LABEL_7:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v6 = [(SASUIDeviceScreenEngagementController *)self _stopButtonPressAttentionAwarenessClient:a4];
  if (v6)
  {
    [(SASUIDeviceScreenEngagementController *)self _setDetectionStarted:0 forType:8];
    goto LABEL_7;
  }
  return v6;
}

- (BOOL)_stopTouchAttentionAwarenessClient:(id *)a3
{
  char v4 = [(AWAttentionAwarenessClient *)self->_touchAttentionAwarenessClient invalidateWithError:a3];
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_stopButtonPressAttentionAwarenessClient:(id *)a3
{
  char v4 = [(AWAttentionAwarenessClient *)self->_buttonPressAwarenessClient invalidateWithError:a3];
  buttonPressAwarenessClient = self->_buttonPressAwarenessClient;
  self->_buttonPressAwarenessClient = 0;

  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousCallQueue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessHandlerQueue, 0);
  objc_storeStrong((id *)&self->_attentionDetectionStatuses, 0);
  objc_storeStrong((id *)&self->_buttonPressAwarenessClient, 0);
  objc_storeStrong((id *)&self->_touchAttentionAwarenessClient, 0);
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
      uint64_t v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.SASUIDeviceScreenEngagementControllerQueue", 0);
      asynchronousCallQueue = self->_asynchronousCallQueue;
      self->_asynchronousCallQueue = v11;
    }
    objc_initWeak(&location, self);
    v13 = self->_asynchronousCallQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke;
    block[3] = &unk_2645BCD08;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a3;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(v13, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
}

void __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  id v11 = 0;
  [WeakRetained startIfNeededForTypes:v3 error:&v11];
  id v4 = v11;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2;
  block[3] = &unk_2645BCCE0;
  char v5 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

uint64_t __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end