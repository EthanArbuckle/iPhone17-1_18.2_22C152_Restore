@interface SiriActivationButtonEventListener
+ (id)listener;
- (NSMutableDictionary)listeners;
- (id)_init;
- (id)connection;
- (void)_registerListenerWithIdentifier:(id)a3;
- (void)buttonDownWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5;
- (void)buttonLongPressWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5;
- (void)buttonUpWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5;
- (void)configureConnectionForIdentifier:(id)a3;
- (void)invalidate;
- (void)invalidatedAtTimestamp:(double)a3;
- (void)registerWithListener:(id)a3 identifier:(id)a4;
- (void)setListeners:(id)a3;
- (void)unregisterListenerWithIdentifier:(id)a3;
@end

@implementation SiriActivationButtonEventListener

+ (id)listener
{
  if (listener_onceToken != -1) {
    dispatch_once(&listener_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)listener_sharedListener;
  return v2;
}

uint64_t __45__SiriActivationButtonEventListener_listener__block_invoke()
{
  listener_sharedListener = [[SiriActivationButtonEventListener alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SiriActivationButtonEventListener;
  v2 = [(SiriActivationSource *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    listeners = v2->_listeners;
    v2->_listeners = v3;
  }
  return v2;
}

- (void)registerWithListener:(id)a3 identifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    v12 = [v10 currentThread];
    int v17 = 136315394;
    v18 = "-[SiriActivationButtonEventListener registerWithListener:identifier:]";
    __int16 v19 = 2048;
    uint64_t v20 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v17, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[SiriActivationButtonEventListener registerWithListener:identifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v17, 0xCu);
  }
  v14 = [(SiriActivationButtonEventListener *)self listeners];
  [v14 setObject:v6 forKey:v7];

  v15 = [(BSServiceConnection *)self->super._connection remoteTarget];
  os_unfair_lock_unlock(&self->super._lock);
  v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[SiriActivationButtonEventListener registerWithListener:identifier:]";
    _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v17, 0xCu);
  }
  if (v15) {
    [(SiriActivationButtonEventListener *)self _registerListenerWithIdentifier:v7];
  }
  else {
    [(SiriActivationButtonEventListener *)self configureConnectionForIdentifier:v7];
  }
}

- (void)configureConnectionForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F50BB8];
  id v6 = +[SASBoardServicesConfiguration configuration];
  id v7 = [v6 machServiceIdentifier];
  v8 = +[SASBoardServicesConfiguration configuration];
  v9 = [v8 identifierForService:1];
  v10 = [v5 endpointForMachName:v7 service:v9 instance:0];

  v11 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v10];
  connection = self->super._connection;
  self->super._connection = v11;

  objc_initWeak(&location, self);
  v13 = self->super._connection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke;
  v15[3] = &unk_1E6B67F80;
  objc_copyWeak(&v17, &location);
  id v14 = v4;
  id v16 = v14;
  [(BSServiceConnection *)v13 configureConnection:v15];
  [(BSServiceConnection *)self->super._connection activate];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = +[SASSignalServer serviceQuality];
    [v3 setServiceQuality:v5];

    id v6 = +[SASSignalServer interface];
    [v3 setInterface:v6];

    [v3 setInterfaceTarget:WeakRetained];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_2;
    v12[3] = &unk_1E6B67898;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    [v3 setInvalidationHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_3;
    v10[3] = &unk_1E6B67898;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    [v3 setInterruptionHandler:v10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_4;
    v7[3] = &unk_1E6B67F58;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v7[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    [v3 setActivationHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
  }
}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v16 = 136315650;
    id v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke_4";
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated for button event listener strongSelf=%p connection=%@", (uint8_t *)&v16, 0x20u);
  }
  if (WeakRetained)
  {
    os_log_t v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)MEMORY[0x1E4F29060];
      v10 = v8;
      id v11 = [v9 currentThread];
      uint64_t v12 = [v11 qualityOfService];
      int v16 = 136315394;
      id v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke";
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock about to lock with qos: %zd", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(WeakRetained + 4);
    id v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      id v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke";
      _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock successfully locked", (uint8_t *)&v16, 0xCu);
    }
    id v14 = [v3 remoteTarget];
    [v14 registerButtonEventListenerWithIdentifier:*(void *)(a1 + 40)];

    os_unfair_lock_unlock(WeakRetained + 4);
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      id v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke";
      _os_log_impl(&dword_1D9588000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock unlocked", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)unregisterListenerWithIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F29060];
    os_log_t v8 = v6;
    id v9 = [v7 currentThread];
    int v20 = 136315394;
    id v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
    __int16 v22 = 2048;
    uint64_t v23 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v20, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    id v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v20, 0xCu);
  }
  id v11 = [(NSMutableDictionary *)self->_listeners allKeys];
  char v12 = [v11 containsObject:v4];

  id v13 = *v5;
  id v14 = *v5;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->super._connection;
      int v20 = 136315650;
      id v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v4;
      __int16 v24 = 2112;
      v25 = connection;
      _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Unregistering SiriActivationButtonEventListenerDelegate delegate=%@ connection=%@", (uint8_t *)&v20, 0x20u);
    }
    [(NSMutableDictionary *)self->_listeners removeObjectForKey:v4];
    int v16 = [(BSServiceConnection *)self->super._connection remoteTarget];
    [v16 unregisterButtonEventListenerWithIdentifier:v4];

    uint64_t v17 = [(NSMutableDictionary *)self->_listeners count];
    os_unfair_lock_unlock(&self->super._lock);
    __int16 v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      id v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
      _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v20, 0xCu);
    }
    if (!v17) {
      [(SiriActivationButtonEventListener *)self invalidate];
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]((uint64_t)v4, v13);
    }
    os_unfair_lock_unlock(&self->super._lock);
    uint64_t v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      id v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
      _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_registerListenerWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F29060];
    os_log_t v8 = v6;
    id v9 = [v7 currentThread];
    int v14 = 136315394;
    v15 = "-[SiriActivationButtonEventListener _registerListenerWithIdentifier:]";
    __int16 v16 = 2048;
    uint64_t v17 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v14, 0x16u);
  }
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  id v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[SiriActivationButtonEventListener _registerListenerWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v14, 0xCu);
  }
  char v12 = [(BSServiceConnection *)self->super._connection remoteTarget];
  [v12 registerButtonEventListenerWithIdentifier:v4];

  os_unfair_lock_unlock(p_lock);
  id v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[SiriActivationButtonEventListener _registerListenerWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v14, 0xCu);
  }
}

- (void)invalidate
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(SiriActivationButtonEventListener *)self invalidatedAtTimestamp:Current];
}

- (void)invalidatedAtTimestamp:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (os_log_t *)MEMORY[0x1E4F4E360];
  v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->super._connection;
    int v15 = 136315394;
    __int16 v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    __int16 v17 = 2112;
    uint64_t v18 = (uint64_t)connection;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection invalidating listener connection=%@", (uint8_t *)&v15, 0x16u);
  }
  os_log_t v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = (void *)MEMORY[0x1E4F29060];
    id v9 = v7;
    v10 = [v8 currentThread];
    uint64_t v11 = [v10 qualityOfService];
    int v15 = 136315394;
    __int16 v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v15, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  char v12 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    __int16 v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v15, 0xCu);
  }
  [(BSServiceConnection *)self->super._connection invalidate];
  id v13 = self->super._connection;
  self->super._connection = 0;

  os_unfair_lock_unlock(&self->super._lock);
  int v14 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    __int16 v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v15, 0xCu);
  }
}

- (id)connection
{
  return self->super._connection;
}

- (void)buttonDownWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v25 = a4;
  id v8 = a5;
  id v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    char v12 = [v10 currentThread];
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    __int16 v34 = 2048;
    uint64_t v35 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  id v13 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", buf, 0xCu);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v14 = [(NSMutableDictionary *)self->_listeners allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v20 = [(NSMutableDictionary *)self->_listeners objectForKey:v19];
        id v21 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
          __int16 v34 = 2112;
          uint64_t v35 = v19;
          _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy Forwarding Button down event to Listener with identifier %@", buf, 0x16u);
        }
        [v8 timeInterval];
        objc_msgSend(v20, "buttonEventListenerDidReceiveButtonDownWithButtonIdentifier:atTimestamp:", objc_msgSend(v26, "integerValue"), v22);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v23 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", buf, 0xCu);
  }
}

- (void)buttonUpWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v25 = a4;
  id v8 = a5;
  id v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    char v12 = [v10 currentThread];
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    __int16 v34 = 2048;
    uint64_t v35 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  id v13 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", buf, 0xCu);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v14 = [(NSMutableDictionary *)self->_listeners allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v20 = [(NSMutableDictionary *)self->_listeners objectForKey:v19];
        id v21 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
          __int16 v34 = 2112;
          uint64_t v35 = v19;
          _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy Forwarding Button down event to Listener with identifier %@", buf, 0x16u);
        }
        [v8 timeInterval];
        objc_msgSend(v20, "buttonEventListenerDidReceiveButtonUpWithButtonIdentifier:atTimestamp:", objc_msgSend(v26, "integerValue"), v22);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v23 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", buf, 0xCu);
  }
}

- (void)buttonLongPressWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v25 = a4;
  id v8 = a5;
  id v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    char v12 = [v10 currentThread];
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    __int16 v34 = 2048;
    uint64_t v35 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  id v13 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", buf, 0xCu);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v14 = [(NSMutableDictionary *)self->_listeners allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v20 = [(NSMutableDictionary *)self->_listeners objectForKey:v19];
        id v21 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
          __int16 v34 = 2112;
          uint64_t v35 = v19;
          _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy Forwarding Button down event to Listener with identifier %@", buf, 0x16u);
        }
        [v8 timeInterval];
        objc_msgSend(v20, "buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier:atTimestamp:", objc_msgSend(v26, "integerValue"), v22);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v23 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", buf, 0xCu);
  }
}

- (NSMutableDictionary)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)unregisterListenerWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9588000, a2, OS_LOG_TYPE_ERROR, "%s #activation Unregister listener '%@' when it is not connected.", (uint8_t *)&v2, 0x16u);
}

@end