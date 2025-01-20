@interface SYNotesActivationService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)_listener;
- (OS_dispatch_queue)_serviceQueue;
- (SYNotesActivationObserver)_notesActivationObserver;
- (SYNotesActivationService)init;
- (void)_setListener:(id)a3;
- (void)_setNotesActivationObserver:(id)a3;
- (void)_setServiceQueue:(id)a3;
- (void)activateNotesWithContext:(id)a3 completion:(id)a4;
- (void)beginListeningToConnections;
@end

@implementation SYNotesActivationService

- (SYNotesActivationService)init
{
  v9.receiver = self;
  v9.super_class = (Class)SYNotesActivationService;
  v2 = [(SYNotesActivationService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.NotesActivationService", v3);
    serviceQueue = v2->__serviceQueue;
    v2->__serviceQueue = (OS_dispatch_queue *)v4;

    v6 = [[SYNotesActivationObserver alloc] initWithHandler:&__block_literal_global_8];
    notesActivationObserver = v2->__notesActivationObserver;
    v2->__notesActivationObserver = v6;
  }
  return v2;
}

- (void)beginListeningToConnections
{
  v3 = [(SYNotesActivationService *)self _listener];

  if (!v3)
  {
    dispatch_queue_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.synapse.notes-activation-service"];
    [(SYNotesActivationService *)self _setListener:v4];

    v5 = [(SYNotesActivationService *)self _listener];
    v6 = [(SYNotesActivationService *)self _serviceQueue];
    [v5 _setQueue:v6];

    v7 = [(SYNotesActivationService *)self _listener];
    [v7 setDelegate:self];

    id v8 = [(SYNotesActivationService *)self _listener];
    [v8 resume];
  }
}

- (void)activateNotesWithContext:(id)a3 completion:(id)a4
{
  id v23 = a3;
  v6 = (void (**)(id, void))a4;
  if (SYIsPhone()
    && SYIsQuickNoteOnPhoneEnabled()
    && ([(SYNotesActivationService *)self _notesActivationObserver],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isVisible],
        v7,
        !v8))
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.SystemPaperViewService" viewControllerClassName:@"ViewController"];
    id v10 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    v11 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v9 configurationContext:v10];
    id v12 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    v13 = [v23 processHandle];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4FA6BE0]);
      v15 = [v23 processHandle];
      v16 = (void *)[v14 initWithTargetProcess:v15];
      [v12 setPresentationTarget:v16];
    }
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v23 contextID] && objc_msgSend(v23, "renderID"))
    {
      v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v23, "renderID"));
      [v17 setObject:v18 forKeyedSubscript:@"renderID"];

      v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v23, "contextID"));
      [v17 setObject:v19 forKeyedSubscript:@"contextID"];
    }
    v20 = [v23 userActivityData];

    if (v20)
    {
      v21 = [v23 userActivityData];
      [v17 setObject:v21 forKeyedSubscript:@"userActivityData"];
    }
    v22 = (void *)[v17 copy];
    [v12 setUserInfo:v22];

    [v11 activateWithContext:v12];
    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.synapse" code:-127 userInfo:0];
    ((void (**)(id, void *))v6)[2](v6, v9);
  }

LABEL_7:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SYNotesActivationService *)self _listener];

  if (v8 == v7)
  {
    objc_super v9 = [(SYNotesActivationService *)self _serviceQueue];
    [v6 _setQueue:v9];

    id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2B688];
    [v6 setExportedInterface:v10];

    [v6 setExportedObject:self];
    [v6 resume];
  }

  return v8 == v7;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (void)_setListener:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)_setServiceQueue:(id)a3
{
}

- (SYNotesActivationObserver)_notesActivationObserver
{
  return self->__notesActivationObserver;
}

- (void)_setNotesActivationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__notesActivationObserver, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
}

@end