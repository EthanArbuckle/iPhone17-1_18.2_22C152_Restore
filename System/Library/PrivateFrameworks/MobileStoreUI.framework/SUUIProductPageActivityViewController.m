@interface SUUIProductPageActivityViewController
- (SUUIProductPageActivityViewController)initWithProductPageItem:(id)a3 clientContext:(id)a4;
- (id)_activityItemsForProductPageItem:(id)a3 clientContext:(id)a4;
- (id)_activityItemsForProductPageItemProvider:(id)a3 clientContext:(id)a4;
- (id)_applicationActivitiesForProductPageItem:(id)a3 clientContext:(id)a4;
- (id)_titleForActivity:(id)a3;
@end

@implementation SUUIProductPageActivityViewController

- (SUUIProductPageActivityViewController)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  v17[5] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  v9 = [(SUUIProductPageActivityViewController *)self _activityItemsForProductPageItem:v8 clientContext:v7];
  v10 = [(SUUIProductPageActivityViewController *)self _applicationActivitiesForProductPageItem:v8 clientContext:v7];

  v16.receiver = self;
  v16.super_class = (Class)SUUIProductPageActivityViewController;
  v11 = [(SUUIProductPageActivityViewController *)&v16 initWithActivityItems:v9 applicationActivities:v10];
  if (v11)
  {
    uint64_t v12 = *MEMORY[0x263F1CFA8];
    v17[0] = *MEMORY[0x263F1CF98];
    v17[1] = v12;
    uint64_t v13 = *MEMORY[0x263F1D008];
    v17[2] = *MEMORY[0x263F1CFE0];
    v17[3] = v13;
    v17[4] = *MEMORY[0x263F1D010];
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];
    [(SUUIProductPageActivityViewController *)v11 setExcludedActivityTypes:v14];

    objc_storeStrong((id *)&v11->_clientContext, a4);
  }

  return v11;
}

- (id)_titleForActivity:(id)a3
{
  id v4 = a3;
  if ((id)*MEMORY[0x263F1CFB0] == v4)
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"ACTIVITY_COPY_LINK"];
    }
    else {
    v5 = +[SUUIClientContext localizedStringForKey:@"ACTIVITY_COPY_LINK" inBundles:0];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_activityItemsForProductPageItem:(id)a3 clientContext:(id)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SUUIURLActivityItemProvider alloc] initWithProductPageItem:v6 clientContext:v5];
  id v8 = [(SUUIDeferredActivityItemProvider *)[SUUITextActivityItemProvider alloc] initWithProductPageItem:v6 clientContext:v5];
  v9 = [(SUUIDeferredActivityItemProvider *)[SUUIImageActivityItemProvider alloc] initWithProductPageItem:v6 clientContext:v5];

  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  return v10;
}

- (id)_activityItemsForProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SUUIURLActivityItemProvider alloc] initWithProductPageItemProvider:v6 clientContext:v5];
  id v8 = [(SUUIDeferredActivityItemProvider *)[SUUITextActivityItemProvider alloc] initWithProductPageItemProvider:v6 clientContext:v5];
  v9 = [(SUUIDeferredActivityItemProvider *)[SUUIImageActivityItemProvider alloc] initWithProductPageItemProvider:v6 clientContext:v5];

  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  return v10;
}

- (id)_applicationActivitiesForProductPageItem:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = [v5 primaryItemOffer];
  [v8 price];
  if (v9 > 0.0)
  {
    uint64_t v10 = [v5 itemIdentifier];
    v11 = +[SUUIWishlist activeWishlist];
    uint64_t v12 = v11;
    if (v11 && ([v11 containsItemWithIdentifier:v10] & 1) == 0)
    {
      uint64_t v13 = +[SUUIItemStateCenter defaultCenter];
      v14 = [v13 stateForItemWithIdentifier:v10];

      if (([v14 state] & 0xF) == 0)
      {
        v15 = [[SUUIAddToWishlistActivity alloc] initWithItem:v5 clientContext:v6];
        [v7 addObject:v15];
      }
    }
    objc_super v16 = +[SUUIItemStateCenter defaultCenter];
    char v17 = objc_msgSend(v16, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v5, "parentalControlsRank"));

    if ((v17 & 1) == 0)
    {
      v18 = [[SUUIGiftActivity alloc] initWithItem:v5 clientContext:v6];
      [v7 addObject:v18];
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end