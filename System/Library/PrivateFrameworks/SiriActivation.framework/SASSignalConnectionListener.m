@interface SASSignalConnectionListener
+ (id)listener;
+ (id)new;
- (BSServiceConnectionListener)listener;
- (SASSignalConnectionListener)init;
- (id)_init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation SASSignalConnectionListener

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 remoteProcess];
  if (v6)
  {
    id v7 = +[SASSignalServer serverForConnection:v5];
  }
  else
  {
    v8 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[SASSignalConnectionListener listener:didReceiveConnection:withContext:]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s SASSignalConnectionListener: Unable to assign new incoming connection to a process because the remote was unknown : connection=%@", (uint8_t *)&v9, 0x16u);
    }
    [v5 invalidate];
  }
}

+ (id)listener
{
  if (listener_onceToken_0 != -1) {
    dispatch_once(&listener_onceToken_0, &__block_literal_global_23);
  }
  v2 = (void *)listener_sharedListener_0;
  return v2;
}

uint64_t __39__SASSignalConnectionListener_listener__block_invoke()
{
  listener_sharedListener_0 = [[SASSignalConnectionListener alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (SASSignalConnectionListener)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)SASSignalConnectionListener;
  v2 = [(SASSignalConnectionListener *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F50BC8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__SASSignalConnectionListener__init__block_invoke;
    v9[3] = &unk_1E6B68690;
    id v5 = v2;
    v10 = v5;
    v6 = [v4 listenerWithConfigurator:v9];
    [(SASSignalConnectionListener *)v5 setListener:v6];

    id v7 = [(SASSignalConnectionListener *)v5 listener];
    [v7 activate];
  }
  return v3;
}

void __36__SASSignalConnectionListener__init__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = +[SASBoardServicesConfiguration configuration];
  v4 = [v3 domainForService:1];
  [v7 setDomain:v4];

  id v5 = +[SASBoardServicesConfiguration configuration];
  v6 = [v5 identifierForService:1];
  [v7 setService:v6];

  [v7 setDelegate:*(void *)(a1 + 32)];
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end