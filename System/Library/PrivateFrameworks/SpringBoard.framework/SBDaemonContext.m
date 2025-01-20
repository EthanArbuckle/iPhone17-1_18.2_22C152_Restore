@interface SBDaemonContext
- (SBDaemonContext)initWithPid:(int)a3 queue:(id)a4;
- (id)_newDispatchSourceForPid:(int)a3 queue:(id)a4;
- (id)description;
- (int)pid;
- (void)_handleCancelation;
- (void)addRequest:(id)a3 forKey:(id)a4;
- (void)removeRequestForKey:(id)a3;
@end

@implementation SBDaemonContext

uint64_t __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancelation];
}

- (SBDaemonContext)initWithPid:(int)a3 queue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBDaemonContext;
  v7 = [(SBDaemonContext *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_pid = v4;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    daemonRequests = v8->_daemonRequests;
    v8->_daemonRequests = v9;

    uint64_t v11 = [(SBDaemonContext *)v8 _newDispatchSourceForPid:v4 queue:v6];
    dispatchSource = v8->_dispatchSource;
    v8->_dispatchSource = (OS_dispatch_source *)v11;

    if (!v8->_dispatchSource)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)addRequest:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_daemonRequests objectForKey:v6];
  if (!v7)
  {
    [(NSMutableDictionary *)self->_daemonRequests setObject:v8 forKey:v6];
    [v8 dispatchEnablerOnQueue:MEMORY[0x1E4F14428]];
  }
}

- (id)_newDispatchSourceForPid:(int)a3 queue:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBDaemonContext _newDispatchSourceForPid:queue:](v9);
    }
    goto LABEL_8;
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14470], a3, 0x80000000uLL, v6);
  if (!v7)
  {
    v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBDaemonContext _newDispatchSourceForPid:queue:](a3, v9);
    }
LABEL_8:
    id v8 = 0;
    goto LABEL_9;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke;
  handler[3] = &unk_1E6AF4AC0;
  id v8 = v7;
  v13 = v8;
  dispatch_source_set_event_handler(v8, handler);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke_2;
  v11[3] = &unk_1E6AF4AC0;
  v11[4] = self;
  dispatch_source_set_cancel_handler(v8, v11);
  dispatch_resume(v8);
  v9 = v13;
LABEL_9:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonRequests, 0);
  objc_storeStrong((id *)&self->_dispatchSource, 0);
}

- (void)removeRequestForKey:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_daemonRequests, "objectForKey:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_daemonRequests removeObjectForKey:v5];
    [v4 dispatchDisablerOnQueue:MEMORY[0x1E4F14428]];
    if (![(NSMutableDictionary *)self->_daemonRequests count]) {
      dispatch_source_cancel((dispatch_source_t)self->_dispatchSource);
    }
  }
}

- (void)_handleCancelation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(NSMutableDictionary *)self->_daemonRequests allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) dispatchDisablerOnQueue:v7];
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  daemonRequests = self->_daemonRequests;
  self->_daemonRequests = 0;

  dispatchSource = self->_dispatchSource;
  if (dispatchSource)
  {
    self->_dispatchSource = 0;
  }
  +[SBDaemonHandler noteDaemonCanceled:self];
}

- (int)pid
{
  return self->_pid;
}

void __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke(uint64_t a1)
{
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@[%i]:", objc_opt_class(), -[SBDaemonContext pid](self, "pid")];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_daemonRequests;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@" %@", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_newDispatchSourceForPid:(os_log_t)log queue:.cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Invalid daemon pid %d", (uint8_t *)v1, 8u);
}

- (void)_newDispatchSourceForPid:(int)a1 queue:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to create dispatch source for pid %d", (uint8_t *)v2, 8u);
}

@end