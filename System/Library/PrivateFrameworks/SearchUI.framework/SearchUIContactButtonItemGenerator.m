@interface SearchUIContactButtonItemGenerator
+ (id)buttonCategoriesForActionTypes:(id)a3;
+ (id)buttonTitleForActionType:(id)a3 contact:(id)a4;
+ (id)cachedEnabledActionsForButtonItems;
+ (id)defaultButtonCategoriesForPerson:(id)a3;
- (CNContactQuickActionsController)quickActionsController;
- (NSMutableDictionary)quickActionViews;
- (SFButtonItem)sfButtonItem;
- (UITraitCollection)traitCollection;
- (id)cachedEnabledActionTypes;
- (id)completionHandler;
- (id)viewForActionType:(id)a3;
- (id)visibleButtonForActionType:(id)a3;
- (void)cacheEnabledActionType:(id)a3;
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setQuickActionViews:(id)a3;
- (void)setQuickActionsController:(id)a3;
- (void)setSfButtonItem:(id)a3;
- (void)updateButtons;
@end

@implementation SearchUIContactButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, uint64_t))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [v8 person];
    v10 = [v8 contactIdentifier];

    if (v10)
    {
      v11 = [v8 contactIdentifier];
      [v9 setContactIdentifier:v11];
    }
    v12 = [v8 actionTypesToShow];
    uint64_t v13 = [v12 count];
    v14 = objc_opt_class();
    if (v13) {
      [v14 buttonCategoriesForActionTypes:v12];
    }
    else {
    v18 = [v14 defaultButtonCategoriesForPerson:v9];
    }
  }
  else
  {
    id v8 = [v6 command];
    v9 = objc_opt_new();
    v15 = [v8 phoneNumber];
    if (v15)
    {
      v16 = [v8 phoneNumber];
      v29[0] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [v9 setPhoneNumbers:v17];
    }
    else
    {
      [v9 setPhoneNumbers:0];
    }

    uint64_t v28 = *MEMORY[0x1E4F1AD20];
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  }

  if ([v18 count])
  {
    v19 = objc_opt_new();
    [(SearchUIContactButtonItemGenerator *)self setQuickActionViews:v19];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1BB90]) initWithActionTypes:v18 contactQuickActionViewContainer:self];
    [(SearchUIContactButtonItemGenerator *)self setQuickActionsController:v20];
    [(SearchUIContactButtonItemGenerator *)self setSfButtonItem:v6];
    [(SearchUIContactButtonItemGenerator *)self setCompletionHandler:v7];
    v21 = +[SearchUIContactCache sharedCache];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __93__SearchUIContactButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
    v26 = &unk_1E6E74708;
    id v27 = v20;
    id v22 = v20;
    [v21 fetchContactForPerson:v9 completionHandler:&v23];

    [(SearchUIContactButtonItemGenerator *)self updateButtons];
  }
  else
  {
    v7[2](v7, 0, 1);
  }
}

uint64_t __93__SearchUIContactButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setContact:a2];
}

+ (id)cachedEnabledActionsForButtonItems
{
  if (cachedEnabledActionsForButtonItems_onceToken != -1) {
    dispatch_once(&cachedEnabledActionsForButtonItems_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)cachedEnabledActionsForButtonItems_cachedEnabledActionsForButtonItems;
  return v2;
}

uint64_t __72__SearchUIContactButtonItemGenerator_cachedEnabledActionsForButtonItems__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = cachedEnabledActionsForButtonItems_cachedEnabledActionsForButtonItems;
  cachedEnabledActionsForButtonItems_cachedEnabledActionsForButtonItems = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)cachedEnabledActionTypes
{
  v3 = [(id)objc_opt_class() cachedEnabledActionsForButtonItems];
  v4 = [(SearchUIContactButtonItemGenerator *)self sfButtonItem];
  v5 = [v3 objectForKey:v4];

  return v5;
}

- (void)cacheEnabledActionType:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUIContactButtonItemGenerator *)self cachedEnabledActionTypes];
  if (v5)
  {
    id v7 = v5;
    [v5 addObject:v4];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA80] setWithObject:v4];

    id v4 = [(id)objc_opt_class() cachedEnabledActionsForButtonItems];
    id v6 = [(SearchUIContactButtonItemGenerator *)self sfButtonItem];
    [v4 setObject:v7 forKey:v6];
  }
}

- (void)updateButtons
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v34 = objc_opt_new();
  v3 = [(SearchUIContactButtonItemGenerator *)self quickActionsController];
  v30 = [(SearchUIContactButtonItemGenerator *)self cachedEnabledActionTypes];
  id v4 = [(SearchUIContactButtonItemGenerator *)self sfButtonItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SearchUIContactButtonItemGenerator *)self sfButtonItem];
    id v6 = [v5 title];
  }
  else
  {
    id v6 = 0;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v3 actionTypes];
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v35 = *(void *)v37;
    uint64_t v32 = *MEMORY[0x1E4F1AD38];
    v33 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v35) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v11 = [(SearchUIContactButtonItemGenerator *)self quickActionViews];
        v12 = [v11 objectForKeyedSubscript:v10];

        if (([v12 enabled] & 1) != 0 || objc_msgSend(v30, "containsObject:", v10))
        {
          uint64_t v13 = [SearchUIContactButtonItem alloc];
          v14 = [(SearchUIContactButtonItemGenerator *)self sfButtonItem];
          v15 = [(SearchUIButtonItem *)v13 initWithSFButtonItem:v14];

          [(SearchUIContactButtonItem *)v15 setQuickActionsController:v3];
          [(SearchUIContactButtonItem *)v15 setActionType:v10];
          if (v6)
          {
            [(SearchUIContactButtonItem *)v15 setTitle:v6];
          }
          else
          {
            v16 = objc_opt_class();
            v17 = [v3 contact];
            v18 = [v16 buttonTitleForActionType:v10 contact:v17];
            [(SearchUIContactButtonItem *)v15 setTitle:v18];
          }
          v19 = [(SearchUIContactButtonItemGenerator *)self quickActionsController];
          -[SearchUIButtonItem setShowsMenuAsPrimaryAction:](v15, "setShowsMenuAsPrimaryAction:", [v19 hasDefaultActionForActionType:v10] ^ 1);

          if (![v10 isEqualToString:v32]
            || (([v3 contact],
                 v20 = objc_claimAutoreleasedReturnValue(),
                 int v21 = [v20 hasBeenPersisted],
                 id v22 = @"square.and.pencil",
                 !v21)
              ? (uint64_t v23 = @"square.and.pencil")
              : (uint64_t v23 = 0),
                uint64_t v24 = v23,
                v20,
                v21))
          {
            id v22 = [MEMORY[0x1E4F5A740] symbolOulinedImageNameForActionType:v10];
          }
          if ([(__CFString *)v22 length])
          {
            v25 = objc_opt_new();
            [v25 setSymbolName:v22];
            [v25 setIsTemplate:1];
            [(SearchUIContactButtonItem *)v15 setImage:v25];
          }
          [v12 setButtonItem:v15];
          [v3 setModelTrackingDelegate:v15];
          [v34 addObject:v15];
          [(SearchUIContactButtonItemGenerator *)self cacheEnabledActionType:v10];

          id v6 = v33;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v8);
  }

  v26 = [v3 actionTypes];
  uint64_t v27 = [v26 count];
  BOOL v28 = v27 == [v34 count];

  v29 = [(SearchUIContactButtonItemGenerator *)self completionHandler];
  ((void (**)(void, void *, BOOL))v29)[2](v29, v34, v28);
}

+ (id)buttonTitleForActionType:(id)a3 contact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 hasBeenPersisted];
  if ([v5 isEqualToString:*MEMORY[0x1E4F1AD78]])
  {
    uint64_t v8 = @"FACE_TIME_VIDEO";
    if (v7) {
      uint64_t v8 = @"VIDEO_CALL_MENU_TITLE";
    }
    v9 = v8;
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F1AD48]])
  {
    v9 = @"SEND_MESSAGE";
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F1AD20]])
  {
    v10 = [v6 phoneNumbers];
    uint64_t v11 = [v10 count];
    v12 = @"AUDIO_CALL_MENU_TITLE";
    if (!v11) {
      v12 = @"FACE_TIME_AUDIO";
    }
    v9 = v12;
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F1AD38]])
  {
    v9 = @"SEND_EMAIL";
  }
  else
  {
    v9 = 0;
  }
  uint64_t v13 = +[SearchUIUtilities localizedStringForKey:v9];

  return v13;
}

- (id)viewForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIContactButtonItemGenerator *)self quickActionViews];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v6 = objc_opt_new();
    [v6 setGenerator:self];
    int v7 = [(SearchUIContactButtonItemGenerator *)self quickActionViews];
    [v7 setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

+ (id)defaultButtonCategoriesForPerson:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1AD48];
  uint64_t v10 = *MEMORY[0x1E4F1AD78];
  uint64_t v11 = v3;
  uint64_t v12 = *MEMORY[0x1E4F1AD20];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v10 count:3];
  int v7 = objc_msgSend(v6, "mutableCopy", v10, v11, v12, v13);

  uint64_t v8 = [v5 emailAddresses];

  if (v8)
  {
    [v7 insertObject:*MEMORY[0x1E4F1AD38] atIndex:0];
  }
  else if ([MEMORY[0x1E4FAE198] isMacOS])
  {
    [v7 addObject:*MEMORY[0x1E4F1AD38]];
  }
  return v7;
}

+ (id)buttonCategoriesForActionTypes:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v23 = (void *)*MEMORY[0x1E4F1AD30];
    id v22 = (void *)*MEMORY[0x1E4F1AD28];
    int v21 = (void *)*MEMORY[0x1E4F1AD50];
    v20 = (void *)*MEMORY[0x1E4F1AD68];
    v19 = (void *)*MEMORY[0x1E4F1AD60];
    v9 = (void *)*MEMORY[0x1E4F1AD20];
    uint64_t v10 = (void *)*MEMORY[0x1E4F1AD78];
    uint64_t v11 = (void *)*MEMORY[0x1E4F1AD48];
    uint64_t v12 = (void *)*MEMORY[0x1E4F1AD38];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        int v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) intValue] - 1;
        v15 = v12;
        switch(v14)
        {
          case 0:
            goto LABEL_15;
          case 1:
            v15 = v11;
            goto LABEL_15;
          case 2:
            v15 = v10;
            goto LABEL_15;
          case 3:
            v15 = v9;
            goto LABEL_15;
          case 4:
            v15 = v19;
            goto LABEL_15;
          case 5:
            v15 = v20;
            goto LABEL_15;
          case 6:
            v15 = v21;
            goto LABEL_15;
          case 7:
            v15 = v22;
            goto LABEL_15;
          case 8:
            v15 = v23;
LABEL_15:
            id v16 = v15;
            if (v16)
            {
              v17 = v16;
              [v4 addObject:v16];
            }
            break;
          default:
            continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)visibleButtonForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIContactButtonItemGenerator *)self quickActionViews];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [(SearchUIButtonItemGenerator *)self delegate];
  uint64_t v8 = [v6 buttonItem];
  v9 = [v7 viewForButtonItem:v8];

  return v9;
}

- (UITraitCollection)traitCollection
{
  return self->traitCollection;
}

- (CNContactQuickActionsController)quickActionsController
{
  return (CNContactQuickActionsController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQuickActionsController:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableDictionary)quickActionViews
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQuickActionViews:(id)a3
{
}

- (SFButtonItem)sfButtonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSfButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfButtonItem, 0);
  objc_storeStrong((id *)&self->_quickActionViews, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_quickActionsController, 0);
  objc_storeStrong((id *)&self->traitCollection, 0);
}

@end