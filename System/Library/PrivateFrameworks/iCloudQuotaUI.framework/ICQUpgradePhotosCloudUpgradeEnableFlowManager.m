@interface ICQUpgradePhotosCloudUpgradeEnableFlowManager
- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4;
@end

@implementation ICQUpgradePhotosCloudUpgradeEnableFlowManager

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__ICQUpgradePhotosCloudUpgradeEnableFlowManager__performPageButtonActionWithParameters_completion___block_invoke;
  v9[3] = &unk_264923750;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)ICQUpgradePhotosCloudUpgradeEnableFlowManager;
  id v7 = v6;
  [(ICQUpgradeCloudStorageFlowManager *)&v8 _performPageButtonActionWithParameters:a3 completion:v9];
}

void __99__ICQUpgradePhotosCloudUpgradeEnableFlowManager__performPageButtonActionWithParameters_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "PhotosCloudUpgradeEnable -- upgrade succeeded, now attempting to enable iCPL", (uint8_t *)&v9, 2u);
    }

    +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    if (v7)
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "PhotosCloudUpgradeEnable -- upgrade failed with error %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_super v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "skipping attempt to enable iCPL", (uint8_t *)&v9, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end