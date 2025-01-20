@interface NPKPeerPaymentAccountManager
+ (id)sharedInstance;
- (NPKPeerPaymentAccountManager)init;
- (NPKPeerPaymentAccountManager)initWithPeerPaymentService:(id)a3;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentService)peerPaymentService;
- (void)_updateAccount;
- (void)setAccount:(id)a3;
@end

@implementation NPKPeerPaymentAccountManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NPKPeerPaymentAccountManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

void __46__NPKPeerPaymentAccountManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;
}

- (NPKPeerPaymentAccountManager)initWithPeerPaymentService:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKPeerPaymentAccountManager;
  v5 = [(NPKPeerPaymentAccountManager *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (PKPeerPaymentService *)v4;
      peerPaymentService = v5->_peerPaymentService;
      v5->_peerPaymentService = v6;
    }
    else
    {
      peerPaymentService = [MEMORY[0x263F5C178] sharedService];
      uint64_t v8 = [peerPaymentService peerPaymentService];
      v9 = v5->_peerPaymentService;
      v5->_peerPaymentService = (PKPeerPaymentService *)v8;
    }
    v10 = [(PKPeerPaymentService *)v5->_peerPaymentService account];
    [(NPKPeerPaymentAccountManager *)v5 setAccount:v10];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v5 selector:sel__handleAccountChanged_ name:*MEMORY[0x263F5C7D0] object:v5->_peerPaymentService];

    [(NPKPeerPaymentAccountManager *)v5 _updateAccount];
  }

  return v5;
}

- (NPKPeerPaymentAccountManager)init
{
  return [(NPKPeerPaymentAccountManager *)self initWithPeerPaymentService:0];
}

- (void)_updateAccount
{
  v3 = [(NPKPeerPaymentAccountManager *)self peerPaymentService];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__NPKPeerPaymentAccountManager__updateAccount__block_invoke;
  v4[3] = &unk_2644D56C0;
  v4[4] = self;
  [v3 accountWithCompletion:v4];
}

void __46__NPKPeerPaymentAccountManager__updateAccount__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAccount:a2];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"NPKPeerPaymentAccountManagerAccountDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPeerPaymentAccount)account
{
  return (PKPeerPaymentAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end