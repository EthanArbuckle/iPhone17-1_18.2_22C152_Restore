@interface TRAccountsManager
+ (id)sharedInstance;
- (ACAccount)activeiCloudAccount;
- (ACAccountStore)iCloudAccountStore;
- (GKLocalPlayer)localGameCenterPlayer;
- (NSString)deviceName;
- (NSString)homeSharingAppleID;
- (NSString)homeSharingGroupID;
- (SSAccount)activeiTunesStoreAccount;
- (id)accountTypesWithDefaultAccountID:(id)a3;
- (id)defaultAccountIDForAuthenticationAccountType:(unint64_t)a3;
- (void)setICloudAccountStore:(id)a3;
@end

@implementation TRAccountsManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TRAccountsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __35__TRAccountsManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (NSString)deviceName
{
  v2 = (void *)MGCopyAnswer();
  return (NSString *)v2;
}

- (SSAccount)activeiTunesStoreAccount
{
  v2 = [MEMORY[0x263F7B0E8] defaultStore];
  v3 = [v2 activeAccount];

  return (SSAccount *)v3;
}

- (ACAccountStore)iCloudAccountStore
{
  iCloudAccountStore = self->_iCloudAccountStore;
  if (!iCloudAccountStore)
  {
    v4 = [MEMORY[0x263EFB210] defaultStore];
    v5 = self->_iCloudAccountStore;
    self->_iCloudAccountStore = v4;

    iCloudAccountStore = self->_iCloudAccountStore;
  }
  return iCloudAccountStore;
}

- (ACAccount)activeiCloudAccount
{
  v2 = [(TRAccountsManager *)self iCloudAccountStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return (ACAccount *)v3;
}

- (NSString)homeSharingAppleID
{
  v2 = (void *)CFPreferencesCopyAppValue(@"homeSharingAppleID", @"com.apple.homesharing");
  return (NSString *)v2;
}

- (NSString)homeSharingGroupID
{
  v2 = (void *)CFPreferencesCopyAppValue(@"homeSharingGroupID", @"com.apple.homesharing");
  return (NSString *)v2;
}

- (GKLocalPlayer)localGameCenterPlayer
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getGKLocalPlayerClass_softClass;
  uint64_t v10 = getGKLocalPlayerClass_softClass;
  if (!getGKLocalPlayerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getGKLocalPlayerClass_block_invoke;
    v6[3] = &unk_2642207A0;
    v6[4] = &v7;
    __getGKLocalPlayerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 localPlayer];
  return (GKLocalPlayer *)v4;
}

- (id)defaultAccountIDForAuthenticationAccountType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v3 = [(TRAccountsManager *)self activeiTunesStoreAccount];
      goto LABEL_7;
    case 2uLL:
      v5 = [(TRAccountsManager *)self activeiCloudAccount];
      uint64_t v6 = [v5 username];
      goto LABEL_8;
    case 3uLL:
      v4 = [(TRAccountsManager *)self homeSharingAppleID];
      break;
    case 4uLL:
      id v3 = [(TRAccountsManager *)self localGameCenterPlayer];
LABEL_7:
      v5 = v3;
      uint64_t v6 = [v3 accountName];
LABEL_8:
      v4 = (void *)v6;

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)accountTypesWithDefaultAccountID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] arrayWithArray:&unk_26C58CD88];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 unsignedIntegerValue];

      uint64_t v9 = [(TRAccountsManager *)self defaultAccountIDForAuthenticationAccountType:v8];
      if (([v9 isEqualToString:v4] & 1) == 0) {
        [v5 removeObjectAtIndex:v6--];
      }

      ++v6;
    }
    while (v6 < [v5 count]);
  }

  return v5;
}

- (void)setICloudAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end