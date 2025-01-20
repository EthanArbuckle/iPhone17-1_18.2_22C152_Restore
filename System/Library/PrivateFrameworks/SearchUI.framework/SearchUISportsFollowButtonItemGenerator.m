@interface SearchUISportsFollowButtonItemGenerator
- (BOOL)isUserSignedIntoStore;
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUISportsFollowButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, uint64_t))a4;
  v8 = [[SearchUISportsFollowButtonItem alloc] initWithSFButtonItem:v6];
  v9 = [v6 sportsItem];
  int v10 = [v9 type];
  if ((v10 - 1) > 1)
  {
    if (v10 != 3)
    {
      v7[2](v7, 0, 1);
      goto LABEL_9;
    }
    if (generateSearchUIButtonItemsWithSFButtonItem_completion__onceToken != -1) {
      dispatch_once(&generateSearchUIButtonItemsWithSFButtonItem_completion__onceToken, &__block_literal_global_13);
    }
    v12 = (void *)generateSearchUIButtonItemsWithSFButtonItem_completion__liveActivitiesEnabledCache;
    v13 = [MEMORY[0x1E4F1CA98] null];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_4;
    v14[3] = &unk_1E6E72F08;
    v15 = v8;
    v17 = v7;
    id v16 = v6;
    [v12 getObjectForKey:v13 completionHandler:v14];

    v11 = v15;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
    v18[3] = &unk_1E6E72EE0;
    v19 = v8;
    v22 = v7;
    v20 = self;
    id v21 = v6;
    +[SearchUITVUtilities fetchSportsFavoritesEnabledStatusWithCompletionHandler:v18];

    v11 = v19;
  }

LABEL_9:
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2;
    v14[3] = &unk_1E6E72EB8;
    id v16 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    [v6 updateStateIfNeededWithCompletionHandler:v14];
  }
  else if ([*(id *)(a1 + 40) isUserSignedIntoStore] {
         && +[SearchUIUtilities isAppInstalledWithBundleId:@"com.apple.sports"])
  }
  {
    v7 = objc_opt_new();
    [v7 setApplicationBundleIdentifier:@"com.apple.sports"];
    v8 = [[SearchUIButtonItem alloc] initWithSFButtonItem:*(void *)(a1 + 48)];
    v9 = [*(id *)(a1 + 32) title];
    [(SearchUIButtonItem *)v8 setTitle:v9];

    int v10 = [*(id *)(a1 + 32) image];
    if (v10)
    {
      [(SearchUIButtonItem *)v8 setImage:v10];
    }
    else
    {
      v11 = [*(id *)(a1 + 32) fallbackImage];
      [(SearchUIButtonItem *)v8 setImage:v11];
    }
    -[SearchUIButtonItem setUseDefaultSymbolFillStyle:](v8, "setUseDefaultSymbolFillStyle:", [*(id *)(a1 + 32) useDefaultSymbolFillStyle]);
    [(SearchUIButtonItem *)v8 setCommand:v7];
    uint64_t v12 = *(void *)(a1 + 56);
    v17[0] = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v12 + 16))(v12, v13, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2(uint64_t a1, char a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v6[0] = *(void *)(a1 + 32);
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v3, 1);
  }
  else
  {
    v4 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 0, 1);
  }
}

uint64_t __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_3()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = generateSearchUIButtonItemsWithSFButtonItem_completion__liveActivitiesEnabledCache;
  generateSearchUIButtonItemsWithSFButtonItem_completion__liveActivitiesEnabledCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_4(id *a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([a2 BOOLValue])
  {
    id v3 = a1[4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_5;
    v10[3] = &unk_1E6E72EB8;
    id v12 = a1[6];
    id v11 = a1[4];
    [v3 updateStateIfNeededWithCompletionHandler:v10];
  }
  else
  {
    v4 = [a1[5] fallbackTitle];

    if (v4)
    {
      uint64_t v5 = [[SearchUIButtonItem alloc] initWithSFButtonItem:a1[5]];
      id v6 = [a1[5] fallbackTitle];
      [(SearchUIButtonItem *)v5 setTitle:v6];

      v7 = (void (**)(id, void *, uint64_t))a1[6];
      v13[0] = v5;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      v7[2](v7, v8, 1);
    }
    else
    {
      v9 = (void (*)(void))*((void *)a1[6] + 2);
      v9();
    }
  }
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_5(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v3[0] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  (*(void (**)(uint64_t, void *, uint64_t))(v1 + 16))(v1, v2, 1);
}

- (BOOL)isUserSignedIntoStore
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F179C8] defaultStore];
  v23[0] = *MEMORY[0x1E4F17890];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v4 = [v2 accountsWithAccountTypeIdentifiers:v3 error:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

    goto LABEL_16;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v11, "isActive", (void)v18))
      {
LABEL_7:
        id v12 = v11;

        v8 = v12;
        continue;
      }
      if (!v8)
      {
        if (objc_msgSend(v11, "ams_isLocalAccount")) {
          goto LABEL_7;
        }
        v8 = 0;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  if (!v8)
  {
LABEL_16:
    v13 = objc_msgSend(MEMORY[0x1E4F179C8], "defaultStore", (void)v18);
    v8 = objc_msgSend(v13, "ams_localiTunesAccount");
  }
  v14 = objc_msgSend(v8, "ams_DSID");
  id v15 = [v14 stringValue];
  BOOL v16 = v15 != 0;

  return v16;
}

@end