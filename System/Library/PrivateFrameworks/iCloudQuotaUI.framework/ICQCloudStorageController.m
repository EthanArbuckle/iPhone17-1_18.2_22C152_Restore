@interface ICQCloudStorageController
- (id)specifiers;
- (void)_changeStoragePlan;
- (void)_storageUpgrade;
- (void)_storageUpgradeOfferNotification:(id)a3;
- (void)_storageUpgradeOfferTimeout:(id)a3;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICQCloudStorageController

- (void)dealloc
{
  [(ICQCloudStorageGroupController *)self->_cloudGroup groupRemovedFromListController];
  [(NSTimer *)self->_storageUpgradeOfferTimer invalidate];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F88840] object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICQCloudStorageController;
  [(ICQCloudStorageController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (!self->_cloudGroup)
    {
      v6 = objc_alloc_init(ICQCloudStorageGroupController);
      cloudGroup = self->_cloudGroup;
      self->_cloudGroup = v6;
    }
    v8 = [(ICQCloudStorageGroupController *)self->_cloudGroup specifiersWithBuyMore:PSUsedByManagedAccount() ^ 1];
    [v5 addObjectsFromArray:v8];

    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_changeStoragePlan
{
  id v3 = [(ICQCloudStorageController *)self specifiers];
  [(ICQCloudStorageGroupController *)self->_cloudGroup addGroupToListController:self];
  cloudGroup = self->_cloudGroup;
  [(ICQCloudStorageGroupController *)cloudGroup enterBuyStorage];
}

- (void)_storageUpgradeOfferTimeout:(id)a3
{
}

- (void)_storageUpgradeOfferNotification:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 removeObserver:self name:*MEMORY[0x263F88840] object:0];

  [(NSTimer *)self->_storageUpgradeOfferTimer invalidate];
  storageUpgradeOfferTimer = self->_storageUpgradeOfferTimer;
  self->_storageUpgradeOfferTimer = 0;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ICQCloudStorageController__storageUpgradeOfferNotification___block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__ICQCloudStorageController__storageUpgradeOfferNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  id v3 = [v2 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [MEMORY[0x263F88928] sharedOfferManager];
    id v12 = [v5 currentOffer];

    if (+[ICQUpgradeFlowManager shouldShowForOffer:v12])
    {
      v6 = [[ICQUpgradeFlowManager alloc] initWithOffer:v12];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 1392);
      *(void *)(v7 + 1392) = v6;

      v9 = *(void **)(a1 + 32);
      v10 = (void *)v9[174];
      v11 = [v9 navigationController];
      [v10 beginFlowWithPresentingViewController:v11];
    }
    else
    {
      [*(id *)(a1 + 32) _changeStoragePlan];
    }
  }
}

- (void)_storageUpgrade
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__storageUpgradeOfferNotification_ name:*MEMORY[0x263F88840] object:0];

  objc_super v4 = [MEMORY[0x263F88928] sharedOfferManager];
  int v5 = [v4 fetchOfferIfNeeded];

  if (v5)
  {
    v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__storageUpgradeOfferTimeout_ selector:0 userInfo:0 repeats:10.0];
    storageUpgradeOfferTimer = self->_storageUpgradeOfferTimer;
    self->_storageUpgradeOfferTimer = v6;
  }
  else
  {
    [(ICQCloudStorageController *)self _storageUpgradeOfferNotification:0];
  }
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKey:@"path"];
  if ([v5 isEqualToString:@"MANAGE_STORAGE"])
  {
    id v6 = [(ICQCloudStorageController *)self specifiers];
    [(ICQCloudStorageGroupController *)self->_cloudGroup addGroupToListController:self];
    [(ICQCloudStorageGroupController *)self->_cloudGroup enterManageStorageWhenPossible];
  }
  else if ([v5 isEqualToString:@"CHANGE_STORAGE_PLAN"])
  {
    [(ICQCloudStorageController *)self _changeStoragePlan];
  }
  else if ([v5 isEqualToString:@"STORAGE_UPGRADE"])
  {
    [(ICQCloudStorageController *)self _storageUpgrade];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICQCloudStorageController;
    [(ICQCloudStorageController *)&v7 handleURL:v4];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQCloudStorageController;
  [(ICQCloudStorageController *)&v4 viewWillAppear:a3];
  if ([(ICQCloudStorageController *)self isMovingToParentViewController]) {
    [(ICQCloudStorageGroupController *)self->_cloudGroup addGroupToListController:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQCloudStorageController;
  [(ICQCloudStorageController *)&v4 viewWillDisappear:a3];
  if ([(ICQCloudStorageController *)self isMovingFromParentViewController])[(ICQCloudStorageGroupController *)self->_cloudGroup groupRemovedFromListController]; {
}
  }

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageUpgradeOfferTimer, 0);
  objc_storeStrong((id *)&self->_quotaManager, 0);
  objc_storeStrong((id *)&self->_cloudGroup, 0);
}

@end