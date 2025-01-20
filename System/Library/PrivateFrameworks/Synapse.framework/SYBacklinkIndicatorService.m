@interface SYBacklinkIndicatorService
+ (BOOL)_forTesting;
+ (id)sharedInstance;
+ (void)set_forTesting:(BOOL)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (SYBacklinkIndicatorService)init;
- (SYBacklinkIndicatorServiceDelegate)delegate;
- (id)_listenerEndpoint;
- (void)dealloc;
- (void)hideIndicator;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)showIndicatorForBacklinkWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4 displayID:(unsigned int)a5 corner:(int64_t)a6 action:(int64_t)a7;
@end

@implementation SYBacklinkIndicatorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance___instance_1;

  return v2;
}

uint64_t __44__SYBacklinkIndicatorService_sharedInstance__block_invoke()
{
  sharedInstance___instance_1 = objc_alloc_init(SYBacklinkIndicatorService);

  return MEMORY[0x1F41817F8]();
}

- (SYBacklinkIndicatorService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SYBacklinkIndicatorService;
  v2 = [(SYBacklinkIndicatorService *)&v8 init];
  if (v2)
  {
    v3 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_DEFAULT, "Starting Backlink Manager Service", v7, 2u);
    }

    if ([(id)objc_opt_class() _forTesting])
    {
      uint64_t v4 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    else
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.synapse.backlinkindicator"];
    }
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SYBacklinkIndicatorService;
  [(SYBacklinkIndicatorService *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v7 = (NSXPCListener *)a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SYBacklinkIndicatorService.m", 61, @"Invalid parameter not satisfying: %@", @"newConnection" object file lineNumber description];
  }
  if (self->_listener != v7) {
    goto LABEL_4;
  }
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2E058];
  [v8 setExportedInterface:v10];

  if ([(id)objc_opt_class() _forTesting])
  {
LABEL_9:
    [v8 setExportedObject:self];
    [v8 resume];
    BOOL v9 = 1;
    goto LABEL_10;
  }
  v11 = [v8 valueForEntitlement:@"com.apple.synapse.allowBacklinkIndicatorRequests"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 BOOLValue])
  {

    goto LABEL_9;
  }
  v13 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_DEFAULT, "BacklinkIndicatorService: Refusing connection from non-entitled client with connection: %@", buf, 0xCu);
  }

LABEL_4:
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (void)showIndicatorForBacklinkWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4 displayID:(unsigned int)a5 corner:(int64_t)a6 action:(int64_t)a7
{
  uint64_t v9 = *(void *)&a5;
  id v18 = a3;
  id v12 = a4;
  v13 = [(SYBacklinkIndicatorService *)self delegate];
  if (a7 == 3)
  {
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
    v15 = [(SYBacklinkIndicatorService *)self delegate];
    [v15 hotCornerExited];
  }
  else
  {
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_7;
    }
    v15 = SYMakeEditNoteUserActivity(v18, v12);
    uint64_t v17 = [(SYBacklinkIndicatorService *)self delegate];
    [v17 showIndicatorForBacklinkWithUserActivity:v15 displayID:v9 corner:a6 toggle:a7 == 2];
  }
LABEL_7:
}

- (void)hideIndicator
{
  objc_super v3 = [(SYBacklinkIndicatorService *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SYBacklinkIndicatorService *)self delegate];
    [v5 hideIndicator];
  }
}

- (SYBacklinkIndicatorServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SYBacklinkIndicatorServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)_forTesting
{
  return __forTesting;
}

+ (void)set_forTesting:(BOOL)a3
{
  __forTesting = a3;
}

- (id)_listenerEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

@end