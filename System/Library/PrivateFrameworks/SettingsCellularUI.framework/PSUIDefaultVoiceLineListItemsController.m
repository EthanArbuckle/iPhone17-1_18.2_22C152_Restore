@interface PSUIDefaultVoiceLineListItemsController
- (PSUIDefaultVoiceLineListItemsController)init;
- (id)specifiers;
- (void)reloadCache;
@end

@implementation PSUIDefaultVoiceLineListItemsController

- (PSUIDefaultVoiceLineListItemsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSUIDefaultVoiceLineListItemsController;
  v2 = [(PSUIDefaultVoiceLineListItemsController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_reloadCache name:@"PSUICellularPlanChanged" object:0];
  }
  return v2;
}

- (void)reloadCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__PSUIDefaultVoiceLineListItemsController_reloadCache__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__PSUIDefaultVoiceLineListItemsController_reloadCache__block_invoke(uint64_t a1)
{
  id v7 = *(id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FE98]);
  [v7 updateCachedState];
  int v2 = [v7 isSubcontrollerNeeded];
  v3 = *(char **)(a1 + 32);
  if (v2)
  {
    [v3 reloadSpecifiers];
    v4 = v7;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v3[*MEMORY[0x263F5FE88]]);

    id v6 = (id)[WeakRetained popViewControllerAnimated:1];
    v4 = WeakRetained;
  }
}

- (id)specifiers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)PSUIDefaultVoiceLineListItemsController;
  v3 = [(PSListItemsController *)&v22 specifiers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    uint64_t v7 = *MEMORY[0x263F5FFE0];
    uint64_t v8 = *MEMORY[0x263F5FFE8];
    uint64_t v17 = *MEMORY[0x263F60290];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 cellType])
        {
          [v10 setProperty:objc_opt_class() forKey:v7];
          uint64_t v11 = (int)*MEMORY[0x263F5FE98];
          v12 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v11) planItemForListItem:v10];
          if (v12)
          {
            [v10 setProperty:v12 forKey:v8];
            v13 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v11) subscriptionContextForListItem:v10];
            if (v13) {
              [v10 setProperty:v13 forKey:v17];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  v14 = (void *)MEMORY[0x263F67F00];
  v15 = (void *)[v3 mutableCopy];
  [v14 logSpecifiers:v15 origin:@"[PSUIDefaultVoiceLineListItemsController specifiers] end"];

  return v3;
}

@end