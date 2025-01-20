@interface SCROScriptClient
+ (SCROScriptClient)sharedClient;
- (BOOL)_isReady;
- (BOOL)_runAsyncWithConnection:(int)a3 object:(id)a4;
- (BOOL)runScriptFile:(id)a3;
- (BOOL)runShortcutWithIdentifier:(id)a3;
- (OS_dispatch_queue)_scriptDispatchQueue;
- (SCROScriptClient)init;
- (id)_lazyConnection;
- (void)_killConnection;
- (void)dealloc;
- (void)handleCallback:(id)a3;
- (void)set_scriptDispatchQueue:(id)a3;
@end

@implementation SCROScriptClient

+ (SCROScriptClient)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_sharedClient;

  return (SCROScriptClient *)v2;
}

uint64_t __32__SCROScriptClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(SCROScriptClient);
  _sharedClient = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

- (SCROScriptClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)SCROScriptClient;
  v2 = [(SCROScriptClient *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F67020]) initWithTarget:v2 selector:sel__killConnection threadKey:0];
    timer = v2->_timer;
    v2->_timer = (SCRCTargetSelectorTimer *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("SCROScriptClient_scriptRunner", 0);
    scriptDispatchQueue = v2->__scriptDispatchQueue;
    v2->__scriptDispatchQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)dealloc
{
  [(SCRCTargetSelectorTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCROScriptClient;
  [(SCROScriptClient *)&v3 dealloc];
}

- (void)_killConnection
{
  [(NSLock *)self->_lock lock];
  [(SCROConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  self->_isReady = 0;
  [(NSLock *)self->_lock unlock];
}

- (id)_lazyConnection
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_connection;
  [(NSLock *)self->_lock unlock];
  if (v3) {
    goto LABEL_6;
  }
  [(NSLock *)self->_lock lock];
  if (!self->_connection)
  {
    v4 = [[SCROConnection alloc] initWithHandlerType:2 delegate:self];
    connection = self->_connection;
    self->_connection = v4;

    if (![(SCROScriptClient *)self _isReady]) {
      fwrite("Screen Reader Script Server: NOT AVAILABLE\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
  }
  objc_super v3 = self->_connection;
  [(NSLock *)self->_lock unlock];
  if (v3) {
LABEL_6:
  }
    [(SCRCTargetSelectorTimer *)self->_timer dispatchAfterDelay:300.0];

  return v3;
}

- (BOOL)_isReady
{
  unsigned int isReady = self->_isReady;
  if (self->_isReady) {
    return 1;
  }
  do
  {
    unsigned int v5 = isReady;
    usleep(0x186A0u);
    if (v5 == 49) {
      break;
    }
    unsigned int isReady = v5 + 1;
  }
  while (!self->_isReady);
  return v5 < 0x31;
}

- (void)handleCallback:(id)a3
{
  id v8 = a3;
  int v4 = [v8 key];
  if (v4 == 4)
  {
    BOOL v7 = 0;
    goto LABEL_6;
  }
  if (v4 == 3)
  {
    unsigned int v5 = [v8 object];
    connection = self->_connection;

    if (v5 == connection)
    {
      BOOL v7 = 1;
LABEL_6:
      self->_unsigned int isReady = v7;
    }
  }
}

- (BOOL)_runAsyncWithConnection:(int)a3 object:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(SCROScriptClient *)self _lazyConnection];
  if (v7)
  {
    id v8 = [(SCROScriptClient *)self _scriptDispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SCROScriptClient__runAsyncWithConnection_object___block_invoke;
    block[3] = &unk_264414E10;
    id v11 = v7;
    int v13 = a3;
    id v12 = v6;
    dispatch_async(v8, block);
  }
  return v7 != 0;
}

id __51__SCROScriptClient__runAsyncWithConnection_object___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) handlerValueForKey:*(unsigned int *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (BOOL)runScriptFile:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SCROScriptClient.m", 156, @"Invalid parameter not satisfying: %@", @"file" object file lineNumber description];
  }
  if ([v5 length]) {
    BOOL v6 = [(SCROScriptClient *)self _runAsyncWithConnection:96 object:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)runShortcutWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SCROScriptClient.m", 167, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if ([v5 length]) {
    BOOL v6 = [(SCROScriptClient *)self _runAsyncWithConnection:97 object:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (OS_dispatch_queue)_scriptDispatchQueue
{
  return self->__scriptDispatchQueue;
}

- (void)set_scriptDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scriptDispatchQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end