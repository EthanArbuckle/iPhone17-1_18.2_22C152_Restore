@interface WFCaptiveObserver
- (BOOL)isObserving;
- (OS_dispatch_queue)captiveNotificationQueue;
- (WFCaptiveObserver)init;
- (id)eventHandler;
- (int)endCaptiveNotificationToken;
- (int)startCaptiveNotificationToken;
- (void)dealloc;
- (void)setCaptiveNotificationQueue:(id)a3;
- (void)setEndCaptiveNotificationToken:(int)a3;
- (void)setEventHandler:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setStartCaptiveNotificationToken:(int)a3;
- (void)startObservingEvents;
- (void)stopObservingEvents;
@end

@implementation WFCaptiveObserver

- (WFCaptiveObserver)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)WFCaptiveObserver;
  v2 = [(WFCaptiveObserver *)&v8 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifikit.captive", 0);
  captiveNotificationQueue = v2->_captiveNotificationQueue;
  v2->_captiveNotificationQueue = (OS_dispatch_queue *)v3;

  if (!v2->_captiveNotificationQueue)
  {
    v6 = WFLogForCategory(2uLL);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFCaptiveObserver init]";
      _os_log_impl(&dword_226071000, v6, v7, "%s: failed to create queue", buf, 0xCu);
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  [(WFCaptiveObserver *)self stopObservingEvents];
  v3.receiver = self;
  v3.super_class = (Class)WFCaptiveObserver;
  [(WFCaptiveObserver *)&v3 dealloc];
}

- (void)startObservingEvents
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFCaptiveObserver *)self isObserving];
  v4 = WFLogForCategory(2uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v3)
  {
    if (v7)
    {
      if (os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[WFCaptiveObserver startObservingEvents]";
        _os_log_impl(&dword_226071000, v4, v5, "%s: already observing", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFCaptiveObserver startObservingEvents]";
      _os_log_impl(&dword_226071000, v4, v5, "%s", buf, 0xCu);
    }

    [(WFCaptiveObserver *)self setObserving:1];
    objc_initWeak((id *)buf, self);
    self->_startCaptiveNotificationToken = 0;
    captiveNotificationQueue = self->_captiveNotificationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke;
    handler[3] = &unk_26478F4B8;
    objc_copyWeak(&v14, (id *)buf);
    notify_register_dispatch("com.apple.networking.nanowebsheet.start", &self->_startCaptiveNotificationToken, captiveNotificationQueue, handler);
    self->_endCaptiveNotificationToken = 0;
    p_endCaptiveNotificationToken = &self->_endCaptiveNotificationToken;
    v10 = *((void *)p_endCaptiveNotificationToken + 2);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke_2;
    v11[3] = &unk_26478F4B8;
    objc_copyWeak(&v12, (id *)buf);
    notify_register_dispatch("com.apple.networking.nanowebsheet.end", p_endCaptiveNotificationToken, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(2uLL);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[WFCaptiveObserver startObservingEvents]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: captive start notification", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke_4;
  block[3] = &unk_26478E3E8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_type_t v3 = [WeakRetained eventHandler];

  if (v3)
  {
    id v5 = objc_loadWeakRetained(v1);
    v4 = [v5 eventHandler];
    v4[2](v4, 0);
  }
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(2uLL);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[WFCaptiveObserver startObservingEvents]_block_invoke_2";
    _os_log_impl(&dword_226071000, v2, v3, "%s: captive end notification", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFCaptiveObserver_startObservingEvents__block_invoke_8;
  block[3] = &unk_26478E3E8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
}

void __41__WFCaptiveObserver_startObservingEvents__block_invoke_8(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_type_t v3 = [WeakRetained eventHandler];

  if (v3)
  {
    id v5 = objc_loadWeakRetained(v1);
    v4 = [v5 eventHandler];
    v4[2](v4, 1);
  }
}

- (void)stopObservingEvents
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  os_log_type_t v3 = WFLogForCategory(2uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    BOOL v6 = "-[WFCaptiveObserver stopObservingEvents]";
    _os_log_impl(&dword_226071000, v3, v4, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(WFCaptiveObserver *)self setObserving:0];
  notify_cancel(self->_startCaptiveNotificationToken);
  self->_startCaptiveNotificationToken = -1;
  notify_cancel(self->_endCaptiveNotificationToken);
  self->_endCaptiveNotificationToken = -1;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (OS_dispatch_queue)captiveNotificationQueue
{
  return self->_captiveNotificationQueue;
}

- (void)setCaptiveNotificationQueue:(id)a3
{
}

- (int)startCaptiveNotificationToken
{
  return self->_startCaptiveNotificationToken;
}

- (void)setStartCaptiveNotificationToken:(int)a3
{
  self->_startCaptiveNotificationToken = a3;
}

- (int)endCaptiveNotificationToken
{
  return self->_endCaptiveNotificationToken;
}

- (void)setEndCaptiveNotificationToken:(int)a3
{
  self->_endCaptiveNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captiveNotificationQueue, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end