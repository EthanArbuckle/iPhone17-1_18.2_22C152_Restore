@interface RTIInputSystemService
+ (Class)serviceSessionClass;
+ (id)sharedServiceWithMachName:(id)a3;
- (BOOL)_canResumeConnection;
- (BOOL)isEnabled;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)lastAppId;
- (NSString)machName;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (RTIInputSystemDelegate)delegate;
- (RTIInputSystemService)initWithMachName:(id)a3;
- (RTIInputSystemServiceSession)currentSession;
- (void)_createListenerIfNecessary;
- (void)_destroyListenerIfNecessary;
- (void)dealloc;
- (void)inputSession:(id)a3 didAddRTISupplementalLexicon:(id)a4;
- (void)inputSession:(id)a3 didAddSupplementalLexicon:(id)a4;
- (void)inputSession:(id)a3 didChangePause:(BOOL)a4 withReason:(id)a5;
- (void)inputSession:(id)a3 didReceiveConnection:(id)a4;
- (void)inputSession:(id)a3 didRemoveRTISupplementalLexicon:(id)a4;
- (void)inputSession:(id)a3 didRemoveSupplementalLexicon:(id)a4;
- (void)inputSession:(id)a3 documentStateDidChange:(id)a4;
- (void)inputSession:(id)a3 documentTraitsDidChange:(id)a4;
- (void)inputSession:(id)a3 performInputOperation:(id)a4;
- (void)inputSession:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5;
- (void)inputSession:(id)a3 textSuggestionsChanged:(id)a4;
- (void)inputSessionDidBegin:(id)a3 options:(id)a4;
- (void)inputSessionDidDie:(id)a3;
- (void)inputSessionDidEnd:(id)a3 options:(id)a4;
- (void)inputSessionDidEnd:(id)a3 options:(id)a4 completion:(id)a5;
- (void)prepareForInputSession:(id)a3 options:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastAppId:(id)a3;
- (void)setListener:(id)a3;
- (void)setMachName:(id)a3;
@end

@implementation RTIInputSystemService

+ (id)sharedServiceWithMachName:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  if (sharedServiceWithMachName__onceToken == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&sharedServiceWithMachName__onceToken, &__block_literal_global_3);
    if (v4)
    {
LABEL_3:
      if (![(__CFString *)v4 isEqualToString:@"com.apple.iosmac.remote-text-editing"])goto LABEL_5; {
    }
      }
  }

  v4 = @"Anonymous";
LABEL_5:
  v5 = [(id)sharedServiceWithMachName___services objectForKey:v4];
  if (!v5)
  {
    v5 = [[RTIInputSystemService alloc] initWithMachName:v4];
    [(id)sharedServiceWithMachName___services setObject:v5 forKey:v4];
  }

  return v5;
}

uint64_t __51__RTIInputSystemService_sharedServiceWithMachName___block_invoke()
{
  sharedServiceWithMachName___services = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  return MEMORY[0x1F41817F8]();
}

- (RTIInputSystemService)initWithMachName:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTIInputSystemService;
  v6 = [(RTIInputSystemService *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_enabled = 1;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sessions = v7->_sessions;
    v7->_sessions = v8;

    v7->_sessionsLock._os_unfair_lock_opaque = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.RemoteTextInput.service", v11);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_machName, a3);
    [(RTIInputSystemService *)v7 _createListenerIfNecessary];
  }
  return v7;
}

- (void)dealloc
{
  [(RTIInputSystemService *)self _destroyListenerIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)RTIInputSystemService;
  [(RTIInputSystemService *)&v3 dealloc];
}

+ (Class)serviceSessionClass
{
  return (Class)objc_opt_class();
}

- (void)_createListenerIfNecessary
{
  if (!self->_listener)
  {
    if ([(NSString *)self->_machName isEqualToString:@"Anonymous"])
    {
      objc_super v3 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    else
    {
      objc_super v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:self->_machName];
    }
    listener = self->_listener;
    self->_listener = v3;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener _setQueue:self->_dispatchQueue];
    id v5 = self->_listener;
    [(NSXPCListener *)v5 resume];
  }
}

- (void)_destroyListenerIfNecessary
{
  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener setDelegate:0];
    [(NSXPCListener *)self->_listener invalidate];
    v4 = self->_listener;
    self->_listener = 0;
  }
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (BOOL)_canResumeConnection
{
  return 1;
}

- (void)inputSession:(id)a3 didReceiveConnection:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [v12 setSessionDelegate:self];
  [v6 _setQueue:self->_dispatchQueue];
  os_unfair_lock_lock(&self->_sessionsLock);
  [(NSMutableSet *)self->_sessions addObject:v12];
  os_unfair_lock_unlock(&self->_sessionsLock);
  if ([(RTIInputSystemService *)self _canResumeConnection]) {
    [v6 resume];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 inputSystemService:self didCreateInputSession:v12];
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "serviceSessionClass"), "sessionWithConnection:", v5);
  [(RTIInputSystemService *)self inputSession:v6 didReceiveConnection:v5];

  return 1;
}

- (RTIInputSystemServiceSession)currentSession
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  v4 = self->_currentSession;
  os_unfair_lock_unlock(p_sessionsLock);
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (a3) {
    [(RTIInputSystemService *)self _createListenerIfNecessary];
  }
  else {
    [(RTIInputSystemService *)self _destroyListenerIfNecessary];
  }
}

- (void)prepareForInputSession:(id)a3 options:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 inputSystemService:self prepareForInputSession:v12 options:v6];
    }
  }
}

- (void)inputSessionDidBegin:(id)a3 options:(id)a4
{
  id v27 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_sessionsLock);
  lastAppId = self->_lastAppId;
  id v9 = [v27 documentTraits];
  char v10 = [v9 appId];
  id v11 = v10;
  if (lastAppId)
  {
    BOOL v12 = [(NSString *)lastAppId isEqualToString:v10];

    v13 = [v27 documentTraits];
    v14 = [v13 appId];
    objc_super v15 = self->_lastAppId;
    self->_lastAppId = v14;

    objc_storeStrong((id *)&self->_currentSession, a3);
    os_unfair_lock_unlock(&self->_sessionsLock);
    if (!v12)
    {
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"RTIInputSessionWillChangeToNewProcessNotification" object:0];
    }
  }
  else
  {
    v17 = self->_lastAppId;
    self->_lastAppId = v10;

    objc_storeStrong((id *)&self->_currentSession, a3);
    os_unfair_lock_unlock(&self->_sessionsLock);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v19 = WeakRetained;
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      if (!v7)
      {
        id v7 = +[RTISessionOptions defaultBeginOptions];
      }
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 inputSystemService:self inputSessionDidBegin:v27 options:v7];
      goto LABEL_13;
    }
  }
  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v23)
  {
    v24 = v23;
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 inputSystemService:self inputSessionDidBegin:v27];
LABEL_13:
    }
  }
}

- (void)inputSessionDidEnd:(id)a3 options:(id)a4
{
}

- (void)inputSessionDidEnd:(id)a3 options:(id)a4 completion:(id)a5
{
  v8 = (RTIInputSystemServiceSession *)a3;
  id v9 = a4;
  char v10 = (void (**)(void))a5;
  id v11 = dispatch_group_create();
  dispatch_time_t v12 = dispatch_time(0, 2100000000);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = WeakRetained;
  if (!v10 || !WeakRetained)
  {

    goto LABEL_8;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
LABEL_8:
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v18
      && (v19 = v18,
          id v20 = objc_loadWeakRetained((id *)&self->_delegate),
          char v21 = objc_opt_respondsToSelector(),
          v20,
          v19,
          (v21 & 1) != 0))
    {
      if (!v9)
      {
        id v9 = +[RTISessionOptions defaultEndOptions];
      }
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 inputSystemService:self inputSessionDidEnd:v8 options:v9];
    }
    else
    {
      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      if (!v23) {
        goto LABEL_17;
      }
      v24 = v23;
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0) {
        goto LABEL_17;
      }
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 inputSystemService:self inputSessionDidEnd:v8];
    }

    goto LABEL_17;
  }
  if (!v9)
  {
    id v9 = +[RTISessionOptions defaultEndOptions];
  }
  dispatch_group_enter(v11);
  id v17 = objc_loadWeakRetained((id *)&self->_delegate);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__RTIInputSystemService_inputSessionDidEnd_options_completion___block_invoke;
  v28[3] = &unk_1E583C300;
  v29 = v11;
  [v17 inputSystemService:self inputSessionDidEnd:v8 options:v9 completion:v28];

LABEL_17:
  os_unfair_lock_lock(&self->_sessionsLock);
  if (self->_currentSession == v8)
  {
    self->_currentSession = 0;
  }
  [(NSMutableSet *)self->_sessions removeObject:v8];
  os_unfair_lock_unlock(&self->_sessionsLock);
  if (v10)
  {
    if (dispatch_group_wait(v11, v12))
    {
      id v27 = RTIInputSessionChangeLogFacility();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[RTIInputSystemService inputSessionDidEnd:options:completion:](v8, v27);
      }
    }
    v10[2](v10);
  }
}

void __63__RTIInputSystemService_inputSessionDidEnd_options_completion___block_invoke(uint64_t a1)
{
}

- (void)inputSessionDidDie:(id)a3
{
  v19 = (RTIInputSystemServiceSession *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 inputSystemService:self inputSessionDidDie:v19];
LABEL_10:

      goto LABEL_11;
    }
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v9)
  {
    char v10 = v9;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v8 = +[RTISessionOptions defaultOptions];
      [v8 setShouldResign:0];
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 inputSystemService:self inputSessionDidEnd:v19 options:v8];

      goto LABEL_10;
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v14)
  {
    id v15 = v14;
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 inputSystemService:self inputSessionDidEnd:v19];
      goto LABEL_10;
    }
  }
LABEL_11:
  if (self->_currentSession == v19)
  {
    self->_currentSession = 0;

    id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 postNotificationName:@"RTIInputSessionDidEndUnexpectedlyNotification" object:0];
  }
  os_unfair_lock_lock(&self->_sessionsLock);
  [(NSMutableSet *)self->_sessions removeObject:v19];
  os_unfair_lock_unlock(&self->_sessionsLock);
}

- (void)inputSession:(id)a3 documentTraitsDidChange:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 inputSystemService:self inputSession:v16 documentTraitsDidChange:v6];
LABEL_7:

      goto LABEL_8;
    }
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 inputSystemService:self inputSessionDocumentDidChange:v16];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)inputSession:(id)a3 documentStateDidChange:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 inputSystemService:self inputSession:v16 documentStateDidChange:v6];
LABEL_7:

      goto LABEL_8;
    }
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 inputSystemService:self inputSessionDocumentDidChange:v16];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)inputSession:(id)a3 didChangePause:(BOOL)a4 withReason:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = WeakRetained;
  if (v6)
  {
    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        [v13 inputSystemService:self inputSessionDidPause:v16 withReason:v8];
LABEL_8:
      }
    }
  }
  else if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 inputSystemService:self inputSessionDidUnpause:v16 withReason:v8];
      goto LABEL_8;
    }
  }
}

- (void)inputSession:(id)a3 textSuggestionsChanged:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 inputSystemService:self inputSession:v10 textSuggestionsChanged:v6];
  }
}

- (void)inputSession:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 inputSystemService:self inputSession:v10 didAddSupplementalLexicon:v6];
  }
}

- (void)inputSession:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 inputSystemService:self inputSession:v10 didAddRTISupplementalLexicon:v6];
  }
}

- (void)inputSession:(id)a3 didRemoveSupplementalLexicon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 inputSystemService:self inputSession:v10 didRemoveSupplementalLexicon:v6];
  }
}

- (void)inputSession:(id)a3 didRemoveRTISupplementalLexicon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 inputSystemService:self inputSession:v10 didRemoveRTISupplementalLexicon:v6];
  }
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 inputSystemService:self inputSession:v10 performInputOperation:v6];
  }
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 inputSystemService:self inputSession:v13 performInputOperation:v8 withResponse:v9];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RTIInputSystemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RTIInputSystemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSString)lastAppId
{
  return self->_lastAppId;
}

- (void)setLastAppId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppId, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (void)inputSessionDidEnd:(void *)a1 options:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a1 uuid];
  int v4 = 136315394;
  id v5 = "-[RTIInputSystemService inputSessionDidEnd:options:completion:]";
  __int16 v6 = 2112;
  char v7 = v3;
  _os_log_error_impl(&dword_19AFFA000, a2, OS_LOG_TYPE_ERROR, "%s  Timeout while waiting to end session. sessionID = %@", (uint8_t *)&v4, 0x16u);
}

@end