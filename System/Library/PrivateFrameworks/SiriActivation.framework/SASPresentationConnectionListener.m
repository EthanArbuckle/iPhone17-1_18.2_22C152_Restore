@interface SASPresentationConnectionListener
+ (id)listener;
+ (id)new;
- (BSServiceConnectionListener)listener;
- (SASPresentationConnectionListener)init;
- (id)_init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation SASPresentationConnectionListener

+ (id)listener
{
  if (listener_onceToken_1 != -1) {
    dispatch_once(&listener_onceToken_1, &__block_literal_global_26);
  }
  v2 = (void *)listener_sharedListener_1;
  return v2;
}

uint64_t __45__SASPresentationConnectionListener_listener__block_invoke()
{
  listener_sharedListener_1 = [[SASPresentationConnectionListener alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (SASPresentationConnectionListener)init
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
  v11.super_class = (Class)SASPresentationConnectionListener;
  v2 = [(SASPresentationConnectionListener *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F50BC8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__SASPresentationConnectionListener__init__block_invoke;
    v9[3] = &unk_1E6B68690;
    v5 = v2;
    v10 = v5;
    v6 = [v4 listenerWithConfigurator:v9];
    [(SASPresentationConnectionListener *)v5 setListener:v6];

    v7 = [(SASPresentationConnectionListener *)v5 listener];
    [v7 activate];
  }
  return v3;
}

void __42__SASPresentationConnectionListener__init__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = +[SASBoardServicesConfiguration configuration];
  v4 = [v3 domainForService:0];
  [v7 setDomain:v4];

  v5 = +[SASBoardServicesConfiguration configuration];
  v6 = [v5 identifierForService:0];
  [v7 setService:v6];

  [v7 setDelegate:*(void *)(a1 + 32)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 remoteProcess];
  if (v6)
  {
    id v7 = +[SASPresentationServer serverForConnection:v5];
  }
  else
  {
    v8 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[SASPresentationConnectionListener listener:didReceiveConnection:withContext:]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s SASPresentationConnectionListener: Unable to assign new incoming connection to a process because the remote was unknown : connection=%@", (uint8_t *)&v9, 0x16u);
    }
    [v5 invalidate];
  }
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