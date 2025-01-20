@interface SearchUIWatchListButtonItemGenerator
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUIWatchListButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 watchListItem];
  uint64_t v8 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", [v7 type], objc_msgSend(v7, "isMediaContainer"));
  v9 = [v7 watchListIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  v12[3] = &unk_1E6E72FA8;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  +[SearchUIWatchListUtilities fetchWatchListStateForWatchListIdentifier:v9 type:v8 completion:v12];
}

void __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = SearchUIButtonItemLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  if (v5)
  {
    uint64_t v8 = [(SearchUIButtonItem *)[SearchUIWatchListButtonItem alloc] initWithSFButtonItem:*(void *)(a1 + 32)];
    -[SearchUIButtonItem setStatus:](v8, "setStatus:", [v5 isWatchListed]);
    uint64_t v9 = *(void *)(a1 + 40);
    v11[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v10, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "error fetching watch list state for watch list identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end