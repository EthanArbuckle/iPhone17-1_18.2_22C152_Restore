@interface NPKMockPeerPaymentAccountManager
+ (id)sharedInstance;
- (NPKMockPeerPaymentAccountManager)initWithPeerPaymentService:(id)a3;
- (id)account;
- (void)_updateMockBalance;
- (void)dealloc;
@end

@implementation NPKMockPeerPaymentAccountManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NPKMockPeerPaymentAccountManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_6;
  return v2;
}

void __50__NPKMockPeerPaymentAccountManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;
}

- (NPKMockPeerPaymentAccountManager)initWithPeerPaymentService:(id)a3
{
  v16[5] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)NPKMockPeerPaymentAccountManager;
  v3 = [(NPKPeerPaymentAccountManager *)&v14 initWithPeerPaymentService:a3];
  v4 = v3;
  if (v3)
  {
    v3->_balanceOffset = 0;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mockPeerPaymentAccountManager", 0);
    accountQueue = v4->_accountQueue;
    v4->_accountQueue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%f", 0x406900A3D70A3D71);
    id v8 = objc_alloc(MEMORY[0x263F5C140]);
    v15[0] = @"currentBalance";
    v15[1] = @"currency";
    v16[0] = v7;
    v16[1] = @"USD";
    v15[2] = @"minimumTransferAmounts";
    v15[3] = @"maximumTransferAmounts";
    v16[2] = &unk_26D043A38;
    v16[3] = &unk_26D043A60;
    v15[4] = @"state";
    v16[4] = @"active";
    v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
    v10 = [MEMORY[0x263EFF910] date];
    uint64_t v11 = [v8 initWithDictionary:v9 lastUpdated:v10];
    mockAccount = v4->_mockAccount;
    v4->_mockAccount = (PKPeerPaymentAccount *)v11;
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NPKMockPeerPaymentAccountManager;
  [(NPKMockPeerPaymentAccountManager *)&v2 dealloc];
}

- (void)_updateMockBalance
{
  v14[4] = *MEMORY[0x263EF8340];
  unint64_t balanceOffset = self->_balanceOffset;
  unint64_t v4 = (balanceOffset + 100) % 0x12C;
  self->_unint64_t balanceOffset = v4;
  if (v4)
  {
    dispatch_queue_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (double)balanceOffset + 200.02);
    id v6 = objc_alloc(MEMORY[0x263F5C140]);
    v13[0] = @"currentBalance";
    v13[1] = @"currency";
    v14[0] = v5;
    v14[1] = @"USD";
    v13[2] = @"minimumTransferAmounts";
    v13[3] = @"maximumTransferAmounts";
    v14[2] = &unk_26D043A88;
    v14[3] = &unk_26D043AB0;
    v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
    id v8 = [MEMORY[0x263EFF910] date];
    v9 = (PKPeerPaymentAccount *)[v6 initWithDictionary:v7 lastUpdated:v8];
    mockAccount = self->_mockAccount;
    self->_mockAccount = v9;
  }
  else
  {
    uint64_t v11 = self->_mockAccount;
    self->_mockAccount = 0;
  }
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"NPKPeerPaymentAccountManagerAccountDidChangeNotification" object:self];
}

- (id)account
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__NPKMockPeerPaymentAccountManager_account__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__NPKMockPeerPaymentAccountManager_account__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_mockAccount, 0);
}

@end