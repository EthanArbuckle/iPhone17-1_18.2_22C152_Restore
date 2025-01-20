@interface WLCredentialStore
+ (id)sharedInstance;
- (WLCredentialStore)init;
- (id)credentialsForAuthentication:(id)a3;
- (id)currentAuthentication;
- (void)setCredentials:(id)a3 forAuthentication:(id)a4;
@end

@implementation WLCredentialStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __35__WLCredentialStore_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(WLCredentialStore);
  return MEMORY[0x270F9A758]();
}

- (WLCredentialStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLCredentialStore;
  return [(WLCredentialStore *)&v3 init];
}

- (void)setCredentials:(id)a3 forAuthentication:(id)a4
{
  v6 = (WLAuthenticationCredentials *)a3;
  v7 = (WLDeviceAuthentication *)a4;
  obj = self;
  objc_sync_enter(obj);
  credentials = obj->_credentials;
  obj->_credentials = v6;
  v9 = v6;

  authentication = obj->_authentication;
  obj->_authentication = v7;

  objc_sync_exit(obj);
}

- (id)currentAuthentication
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_authentication;
  objc_sync_exit(v2);

  return v3;
}

- (id)credentialsForAuthentication:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [v4 sessionUUID];
  v7 = [(WLDeviceAuthentication *)v5->_authentication sessionUUID];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    v9 = v5->_credentials;
  }
  else {
    v9 = 0;
  }
  objc_sync_exit(v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authentication, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end