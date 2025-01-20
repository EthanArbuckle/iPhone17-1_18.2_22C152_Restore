@interface STStorageItemCell
+ (id)specifierForItemURL:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation STStorageItemCell

+ (id)specifierForItemURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = a3;
  v5 = [v3 preferenceSpecifierNamed:&stru_26C91D0A0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v5 setProperty:v4 forKey:@"stItemURL"];

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)STStorageItemCell;
  id v4 = a3;
  [(PSTableCell *)&v19 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"stItemURL"];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F160C8]);
    ScreenScale();
    v8 = objc_msgSend(v6, "initWithFileAtURL:size:scale:representationTypes:", v5, 4, 29.0, 29.0, v7);
    v9 = [MEMORY[0x263F160D0] sharedGenerator];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke;
    v18[3] = &unk_264302468;
    v18[4] = self;
    [v9 generateBestRepresentationForRequest:v8 completionHandler:v18];

    id v17 = 0;
    [v5 getResourceValue:&v17 forKey:*MEMORY[0x263EFF738] error:0];
    id v10 = v17;
    if (![v10 length])
    {
      v11 = [v5 URLByDeletingPathExtension];
      uint64_t v12 = [v11 lastPathComponent];

      id v10 = (id)v12;
    }
    [(STStorageTableCell *)self setTitle:v10];
    v13 = dispatch_get_global_queue(9, 0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_3;
    v14[3] = &unk_2643023A0;
    id v15 = v5;
    v16 = self;
    dispatch_async(v13, v14);
  }
  else
  {
    [(STStorageTableCell *)self setIcon:0];
    [(STStorageTableCell *)self setTitle:@"<No URL specified>"];
    [(STStorageTableCell *)self setInfo:0];
    [(STStorageTableCell *)self setSize:0];
    NSLog(&cfstr_ErrorNoUrlProv.isa);
  }
}

void __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_2;
  block[3] = &unk_264302440;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    PSBlankIconImage();
  }
  else {
  id v2 = [*(id *)(a1 + 48) UIImage];
  }
  [*(id *)(a1 + 32) setIcon:v2];
}

void __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v20 = 0;
  [v2 getResourceValue:&v20 forKey:*MEMORY[0x263EFF770] error:0];
  id v3 = v20;
  if (!v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v19 = 0;
    [v4 getResourceValue:&v19 forKey:*MEMORY[0x263EFF628] error:0];
    id v3 = v19;
  }
  id v5 = *(void **)(a1 + 32);
  id v18 = 0;
  [v5 getResourceValue:&v18 forKey:*MEMORY[0x263EFF5E8] error:0];
  id v6 = v18;
  if (!v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v17 = 0;
    [v7 getResourceValue:&v17 forKey:*MEMORY[0x263EFF5F8] error:0];
    id v6 = v17;
    if (!v6)
    {
      id v8 = *(void **)(a1 + 32);
      id v16 = 0;
      [v8 getResourceValue:&v16 forKey:*MEMORY[0x263EFF610] error:0];
      id v6 = v16;
      if (!v6) {
        goto LABEL_8;
      }
    }
  }
  [v6 timeIntervalSinceReferenceDate];
  if (v9 != 0.0)
  {
    id v10 = STFormattedShortDate();
  }
  else
  {
LABEL_8:
    id v10 = 0;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_4;
  v13[3] = &unk_264302440;
  v13[4] = *(void *)(a1 + 40);
  id v14 = v10;
  id v15 = v3;
  id v11 = v3;
  id v12 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setInfo:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 48) longLongValue];
  id v3 = *(void **)(a1 + 32);

  return [v3 setSize:v2];
}

@end