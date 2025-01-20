@interface SearchUIPlayWatchListItemButtonItemGenerator
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUIPlayWatchListItemButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 watchListItem];
  uint64_t v8 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", [v7 type], objc_msgSend(v7, "isMediaContainer"));
  v9 = [v7 watchListIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__SearchUIPlayWatchListItemButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  v12[3] = &unk_1E6E72FD0;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  +[SearchUIWatchListUtilities fetchButtonsForWatchListIdentifier:v9 type:v8 isHorizontallySrollingStyle:0 completion:v12];
}

void __103__SearchUIPlayWatchListItemButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = SearchUIButtonItemLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  uint64_t v8 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v14, "buttonType", (void)v26) == 1)
        {
          v15 = [v14 punchoutURL];

          if (v15)
          {
            v16 = objc_opt_new();
            v17 = (void *)MEMORY[0x1E4F9A2F8];
            v18 = [v14 punchoutURL];
            v19 = [v17 punchoutWithURL:v18];
            [v16 setPunchout:v19];

            v20 = [[SearchUIButtonItem alloc] initWithSFButtonItem:*(void *)(a1 + 32)];
            v21 = [*(id *)(a1 + 32) title];
            if (v21)
            {
              [(SearchUIButtonItem *)v20 setTitle:v21];
            }
            else
            {
              v22 = [v14 title];
              if (v22)
              {
                [(SearchUIButtonItem *)v20 setTitle:v22];
              }
              else
              {
                v23 = +[SearchUIUtilities localizedStringForKey:@"WATCH_LIVE"];
                [(SearchUIButtonItem *)v20 setTitle:v23];
              }
            }

            v24 = [*(id *)(a1 + 32) image];
            if (v24)
            {
              [(SearchUIButtonItem *)v20 setImage:v24];
            }
            else
            {
              v25 = [[SearchUISymbolImage alloc] initWithSymbolName:@"play"];
              [(SearchUIButtonItem *)v20 setImage:v25];
            }
            [(SearchUIButtonItem *)v20 setCommand:v16];
            [v8 addObject:v20];

            goto LABEL_25;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end