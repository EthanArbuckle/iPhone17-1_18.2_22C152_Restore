@interface STStorageAppCell
+ (id)specifierForAppBundleURL:(id)a3;
+ (id)specifierForAppIdentifier:(id)a3;
+ (id)specifierForAppProxy:(id)a3;
+ (id)specifierForChildApp:(id)a3;
+ (id)specifierForStorageApp:(id)a3;
- (STStorageAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation STStorageAppCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)STStorageAppCell;
  [(PSTableCell *)&v28 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"stStorageApp"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 name];
    [(STStorageTableCell *)self setTitle:v7];

    v8 = [v4 propertyForKey:@"stIcon"];
    if (v8)
    {
      [(STStorageTableCell *)self setIcon:v8];
    }
    else
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke;
      v27[3] = &unk_264302350;
      v27[4] = self;
      STLoadTableIconForApp(v6, v27);
    }
    v9 = [v6 lastUsedDate];
    v10 = v9;
    if (!v9 || ([v9 timeIntervalSinceReferenceDate], v11 == 0.0))
    {
      v15 = 0;
    }
    else
    {
      v12 = NSString;
      if (LastUsedFormatString_onceToken != -1) {
        dispatch_once(&LastUsedFormatString_onceToken, &__block_literal_global_29);
      }
      id v13 = (id)LastUsedFormatString__lastUsedFormat;
      v14 = STFormattedShortDate();
      v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
    }
    [(STStorageTableCell *)self setInfo:v15];
    -[STStorageTableCell setInfoHidden:](self, "setInfoHidden:", [v15 length] == 0);
    v16 = [v4 propertyForKey:@"stCloudIconHidden"];
    v17 = v16;
    if (v16) {
      uint64_t v18 = [v16 BOOLValue];
    }
    else {
      uint64_t v18 = [v6 isDemoted] ^ 1;
    }
    [(STStorageTableCell *)self setCloudIconHidden:v18];
    v19 = [v6 appSizeIfComputed];
    v20 = v19;
    if (v19)
    {
      uint64_t v21 = [v19 userTotal];
      v22 = STFormattedSize();
      [(STStorageTableCell *)self setSize:v21];
      [(STStorageTableCell *)self setSizeString:v22];
    }
    else
    {
      v23 = STSharedConcurrentQueue();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_2;
      block[3] = &unk_2643023A0;
      id v25 = v6;
      v26 = self;
      dispatch_async(v23, block);

      v22 = v25;
    }
  }
}

- (STStorageAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STStorageAppCell;
  v9 = [(STStorageTableCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"stStorageApp"];
    double v11 = [v10 name];
    if ([v11 length])
    {
      v12 = [NSString stringWithFormat:@"App:%@", v11];
      [(STStorageAppCell *)v9 setAccessibilityIdentifier:v12];
    }
  }

  return v9;
}

+ (id)specifierForStorageApp:(id)a3
{
  v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = a3;
  v5 = [v3 preferenceSpecifierNamed:&stru_26C91D0A0 target:0 set:0 get:0 detail:0 cell:2 edit:0];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v5 setProperty:v4 forKey:@"stStorageApp"];

  return v5;
}

+ (id)specifierForChildApp:(id)a3
{
  uint64_t v4 = specifierForChildApp__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&specifierForChildApp__onceToken, &__block_literal_global_1);
  }
  v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C91D0A0 target:a1 set:0 get:0 detail:specifierForChildApp___appDetailClass cell:1 edit:0];
  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v7 = [v5 appIdentifier];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F60138]];

  [v6 setProperty:v5 forKey:@"stStorageApp"];

  return v6;
}

Class __41__STStorageAppCell_specifierForChildApp___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Ststorageappde.isa);
  specifierForChildApp___appDetailClass = (uint64_t)result;
  return result;
}

+ (id)specifierForAppIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F7B000];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  v6 = +[STStorageAppCell specifierForStorageApp:v5];

  return v6;
}

+ (id)specifierForAppBundleURL:(id)a3
{
  v3 = [MEMORY[0x263F086E0] bundleWithURL:a3];
  id v4 = [v3 bundleIdentifier];
  id v5 = +[STStorageAppCell specifierForAppIdentifier:v4];

  return v5;
}

+ (id)specifierForAppProxy:(id)a3
{
  v3 = [a3 bundleIdentifier];
  id v4 = +[STStorageAppCell specifierForAppIdentifier:v3];

  return v4;
}

uint64_t __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIcon:a2];
}

void __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appSize];
  uint64_t v3 = [v2 userTotal];
  if (v3 != [*(id *)(a1 + 40) size])
  {
    if (v2)
    {
      STFormattedSize();
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = &stru_26C91D0A0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_3;
    block[3] = &unk_264302378;
    uint64_t v5 = *(void *)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v3;
    void block[4] = v5;
    v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setSize:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setSizeString:v3];
}

@end