@interface SLGNotificationActivatedLogger
- (BOOL)isActive;
- (BOOL)isEnabled;
- (SLGNotificationActivatedLogger)initWithLogger:(id)a3;
- (id)activationHandler;
- (id)deactivationHandler;
- (void)_beginLoggingForReason:(id)a3;
- (void)_cancelRegistrations;
- (void)_endLoggingForReason:(id)a3;
- (void)addBeginNotification:(id)a3 endNotification:(id)a4;
- (void)invalidate;
- (void)logBlock:(id)a3 domain:(id)a4;
- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6;
- (void)setActivationHandler:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDeactivationHandler:(id)a3;
@end

@implementation SLGNotificationActivatedLogger

- (SLGNotificationActivatedLogger)initWithLogger:(id)a3
{
  id v5 = a3;
  if ([v5 isEnabled])
  {
    objc_storeStrong((id *)&self->_logger, a3);
    self->_lock._os_unfair_lock_opaque = 0;
    v6 = [MEMORY[0x1E4F1CA80] set];
    activeReasons = self->_activeReasons;
    self->_activeReasons = v6;

    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    registrationsByReason = self->_registrationsByReason;
    self->_registrationsByReason = v8;
  }
  else
  {
    registrationsByReason = self;
    self = 0;
  }

  return self;
}

- (void)addBeginNotification:(id)a3 endNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(NSMutableDictionary *)self->_registrationsByReason objectForKeyedSubscript:v6];

  if (!v8)
  {
    int out_token = 0;
    id v9 = v6;
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_get_global_queue(33, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke;
    handler[3] = &unk_1E6870160;
    handler[4] = self;
    id v12 = v9;
    id v24 = v12;
    notify_register_dispatch(v10, &out_token, v11, handler);

    int v22 = 0;
    v13 = (const char *)[v7 UTF8String];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke_2;
    v19 = &unk_1E6870160;
    v20 = self;
    id v14 = v12;
    id v21 = v14;
    notify_register_dispatch(v13, &v22, v11, &v16);

    v15 = +[SLGNotificationActivatedLoggerRegistration registrationWithBeginToken:endToken:](SLGNotificationActivatedLoggerRegistration, "registrationWithBeginToken:endToken:", out_token, v22, v16, v17, v18, v19, v20);
    [(NSMutableDictionary *)self->_registrationsByReason setObject:v15 forKeyedSubscript:v14];
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginLoggingForReason:*(void *)(a1 + 40)];
}

uint64_t __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endLoggingForReason:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  [(SLGNotificationActivatedLogger *)self _cancelRegistrations];
  logger = self->_logger;

  [(SLGActivatableLogging *)logger invalidate];
}

- (BOOL)isActive
{
  return [(SLGActivatableLogging *)self->_logger isActive];
}

- (void)setActive:(BOOL)a3
{
  -[SLGActivatableLogging setActive:](self->_logger, "setActive:");
  os_unfair_lock_lock(&self->_lock);
  if (!a3) {
    [(NSMutableSet *)self->_activeReasons removeAllObjects];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setActivationHandler:(id)a3
{
}

- (id)activationHandler
{
  return (id)[(SLGActivatableLogging *)self->_logger activationHandler];
}

- (void)setDeactivationHandler:(id)a3
{
}

- (id)deactivationHandler
{
  return (id)[(SLGActivatableLogging *)self->_logger deactivationHandler];
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(SLGNotificationActivatedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v7 domain:v6];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SLGNotificationActivatedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v10 domain:v8 completion:v9];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SLGNotificationActivatedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v10 domain:v8 tags:v9];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(SLGNotificationActivatedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v13 domain:v10 tags:v11 completion:v12];
  }
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)_beginLoggingForReason:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_activeReasons addObject:v5];

  os_unfair_lock_unlock(p_lock);
  logger = self->_logger;

  [(SLGActivatableLogging *)logger setActive:1];
}

- (void)_endLoggingForReason:(id)a3
{
  logger = self->_logger;
  id v5 = a3;
  [(SLGActivatableLogging *)logger setActive:0];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_activeReasons removeObject:v5];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_cancelRegistrations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_registrationsByReason;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_registrationsByReason, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        notify_cancel([v9 beginToken]);
        notify_cancel([v9 endToken]);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_registrationsByReason removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationsByReason, 0);
  objc_storeStrong((id *)&self->_activeReasons, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end