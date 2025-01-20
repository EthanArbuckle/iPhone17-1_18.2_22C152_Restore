@interface MDARSessionObserver
- (ARSession)session;
- (ARSessionObserver)observer;
- (MDARSessionObserver)initWithObserver:(ARSessionObserver *)a3 onQueue:(id)a4;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setObserver:(ARSessionObserver *)a3;
- (void)setSession:(id)a3;
@end

@implementation MDARSessionObserver

- (MDARSessionObserver)initWithObserver:(ARSessionObserver *)a3 onQueue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MDARSessionObserver;
  v8 = [(MDARSessionObserver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_observer = a3;
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (ARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (ARSession *)WeakRetained;
}

- (void)setObserver:(ARSessionObserver *)a3
{
  self->_observer = a3;
}

- (ARSessionObserver)observer
{
  return self->_observer;
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  observer = self->_observer;
  if (observer)
  {
    p_session = &self->_session;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_session);
    v9 = (void (*)(ARSessionObserver *, id))*((void *)observer->var0 + 1);

    v9(observer, WeakRetained);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  observer = self->_observer;
  if (observer) {
    (*(void (**)(ARSessionObserver *, id))observer->var0)(observer, v6);
  }
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  observer = self->_observer;
  if (observer) {
    (*((void (**)(ARSessionObserver *, id, id))observer->var0 + 2))(observer, v8, v6);
  }
}

- (void)setSession:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_session = &self->_session;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained != v4)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_session);

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_session);
      [v8 setDelegate:0];

      id v9 = objc_loadWeakRetained((id *)&self->_session);
      [v9 setDelegateQueue:0];

      if (GEOGetVectorKitARSessionObserverLog(void)::onceToken[0] != -1) {
        dispatch_once(GEOGetVectorKitARSessionObserverLog(void)::onceToken, &__block_literal_global_46804);
      }
      v10 = (void *)GEOGetVectorKitARSessionObserverLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitARSessionObserverLog(void)::log, OS_LOG_TYPE_INFO))
      {
        objc_super v11 = v10;
        id v12 = objc_loadWeakRetained((id *)&self->_session);
        int v20 = 134217984;
        id v21 = v12;
        _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_INFO, "Did stop observing session:%p", (uint8_t *)&v20, 0xCu);
      }
    }
    id v13 = objc_storeWeak((id *)&self->_session, v4);

    if (v4)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_session);
      [v14 setDelegate:self];

      delegateQueue = self->_delegateQueue;
      id v16 = objc_loadWeakRetained((id *)&self->_session);
      [v16 setDelegateQueue:delegateQueue];

      if (GEOGetVectorKitARSessionObserverLog(void)::onceToken[0] != -1) {
        dispatch_once(GEOGetVectorKitARSessionObserverLog(void)::onceToken, &__block_literal_global_46804);
      }
      v17 = (void *)GEOGetVectorKitARSessionObserverLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitARSessionObserverLog(void)::log, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        id v19 = objc_loadWeakRetained((id *)p_session);
        int v20 = 134217984;
        id v21 = v19;
        _os_log_impl(&dword_1A1780000, v18, OS_LOG_TYPE_INFO, "Did start observing session:%p", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

@end