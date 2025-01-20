@interface VMServiceClient
+ (id)sharedClient;
- (BOOL)sharedServiceIsSubscribed;
- (VMServiceClient)init;
- (VMVoicemailManager)voicemailManager;
- (id)sharedAccount;
- (void)dealloc;
- (void)setVoicemailManager:(id)a3;
@end

@implementation VMServiceClient

- (VMServiceClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)VMServiceClient;
  v2 = [(VMServiceClient *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(VMVoicemailManager);
    voicemailManager = v2->_voicemailManager;
    v2->_voicemailManager = v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_handleVoicemailsChangedNotification_ name:@"VMVoicemailVoicemailsChangedNotification" object:v2->_voicemailManager];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_handleSubscriptionStatusChangedNotification_ name:@"VMVoicemailSubscriptionStateStatusChangedNotification" object:v2->_voicemailManager];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_handleOnlineStatusChangedNotification_ name:@"VMVoicemailOnlineStatusChangedNotification" object:v2->_voicemailManager];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VMServiceClient;
  [(VMServiceClient *)&v4 dealloc];
}

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global);
  }
  v2 = (void *)__sharedServiceClient;
  return v2;
}

uint64_t __31__VMServiceClient_sharedClient__block_invoke()
{
  __sharedServiceClient = objc_alloc_init(VMServiceClient);
  return MEMORY[0x270F9A758]();
}

- (id)sharedAccount
{
  if (sharedAccount_onceToken != -1) {
    dispatch_once(&sharedAccount_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedAccount___legacyAccount;
  return v2;
}

uint64_t __32__VMServiceClient_sharedAccount__block_invoke()
{
  sharedAccount___legacyAccount = objc_alloc_init(VMLegacyAccount);
  return MEMORY[0x270F9A758]();
}

- (BOOL)sharedServiceIsSubscribed
{
  v2 = [(VMServiceClient *)self voicemailManager];
  char v3 = [v2 isSubscribed];

  return v3;
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end