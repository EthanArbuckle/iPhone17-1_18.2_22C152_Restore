@interface WFScreenOnObserver
- (BOOL)screenOn;
- (OS_dispatch_queue)queue;
- (WFScreenOnObserver)init;
- (WFScreenOnObserverDelegate)delegate;
- (int)token;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setToken:(int)a3;
- (void)start;
- (void)stateChanged:(BOOL)a3;
- (void)stop;
@end

@implementation WFScreenOnObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (int)token
{
  return self->_token;
}

- (void)setDelegate:(id)a3
{
}

- (WFScreenOnObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFScreenOnObserverDelegate *)WeakRetained;
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)stateChanged:(BOOL)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [(WFScreenOnObserver *)self screenOn];
  v6 = getWFWFScreenOnObserverLogObject();
  v7 = v6;
  if (v5 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      v9 = "-[WFScreenOnObserver stateChanged:]";
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s previous state (%i) and new state (%i) match, not notifying", (uint8_t *)&v8, 0x18u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      v9 = "-[WFScreenOnObserver stateChanged:]";
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s screen on state transitioned from %i to %i", (uint8_t *)&v8, 0x18u);
    }

    self->_screenOn = v3;
    v7 = [(WFScreenOnObserver *)self delegate];
    [v7 screenOnStateDidChange:self];
  }
}

- (void)stop
{
  self->_token = -1;
}

- (void)start
{
  if (self->_token == -1)
  {
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __27__WFScreenOnObserver_start__block_invoke;
    handler[3] = &unk_1E654ED10;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_token, queue, handler);
    v4 = self->_queue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __27__WFScreenOnObserver_start__block_invoke_2;
    v5[3] = &unk_1E6558B28;
    v5[4] = self;
    dispatch_async(v4, v5);
  }
}

uint64_t __27__WFScreenOnObserver_start__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) stateChanged:state64 == 0];
}

uint64_t __27__WFScreenOnObserver_start__block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 12);
  uint64_t state64 = 0;
  notify_get_state(v2, &state64);
  return [*(id *)(a1 + 32) stateChanged:state64 == 0];
}

- (WFScreenOnObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFScreenOnObserver;
  int v2 = [(WFScreenOnObserver *)&v9 init];
  int v3 = v2;
  if (v2)
  {
    v2->_token = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shortcuts.WFScreenOnObserver", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = v3;
  }

  return v3;
}

@end