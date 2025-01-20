@interface ICSViewBuilder
+ (Class)iCloudHomeViewControllerClassLegacy;
+ (id)buildBackupViewControllerWithAccount:(id)a3;
+ (id)buildViewControllerWithAccountManager:(id)a3 dataclass:(id)a4;
@end

@implementation ICSViewBuilder

+ (id)buildBackupViewControllerWithAccount:(id)a3
{
  id v3 = a3;
  v4 = [[ICSBackupViewController alloc] initWithAccount:v3];

  return v4;
}

+ (id)buildViewControllerWithAccountManager:(id)a3 dataclass:(id)a4
{
  id v5 = a4;
  if ((id)*MEMORY[0x263EFACB0] == v5)
  {
    id v11 = a3;
    v12 = [[ICSKeychainSyncViewController alloc] initWithAccountManager:v11];
  }
  else
  {
    v6 = (void *)MEMORY[0x263F5FC40];
    id v7 = a3;
    v8 = [v7 accounts];
    uint64_t v9 = *MEMORY[0x263F26D28];
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    objc_msgSend(v6, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v5, v10, 0, 0, 0, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [v11 setObject:v7 forKeyedSubscript:@"icloudAccountManager"];
    [v11 setObject:v5 forKeyedSubscript:*MEMORY[0x263F60138]];
    v12 = objc_alloc_init(ICSDataclassDetailViewController);
    [(ICSKeychainSyncViewController *)v12 setSpecifier:v11];
    [(ICSKeychainSyncViewController *)v12 setAccountManager:v7];
    v13 = [v7 accounts];

    v14 = [v13 objectForKeyedSubscript:v9];
    [(ICSKeychainSyncViewController *)v12 setAccount:v14];
  }

  return v12;
}

+ (Class)iCloudHomeViewControllerClassLegacy
{
  return (Class)objc_opt_class();
}

@end