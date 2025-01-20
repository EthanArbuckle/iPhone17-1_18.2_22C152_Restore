@interface SearchUIAsyncWatchNowSectionLoader
+ (BOOL)supportsSectionModel:(id)a3;
- (NSString)cardSectionId;
- (SFWatchListItem)watchListItem;
- (SearchUIAsyncWatchNowSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5;
- (id)cacheIdentifier;
- (id)placeholderCardSections;
- (void)fetchCardSectionsWithCompletionHandler:(id)a3;
@end

@implementation SearchUIAsyncWatchNowSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 rowModels];
    if ([v4 count] == 1)
    {
      v5 = [v3 rowModels];
      v6 = [v5 firstObject];
      v7 = [v6 cardSection];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (SearchUIAsyncWatchNowSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SearchUIAsyncWatchNowSectionLoader;
  v9 = [(SearchUIAsyncSectionLoader *)&v18 initWithSectionModel:v8 result:a4 queryId:a5];
  if (v9)
  {
    v10 = [v8 rowModels];
    v11 = [v10 firstObject];
    v12 = [v11 cardSection];

    uint64_t v13 = [v12 watchListItem];
    watchListItem = v9->_watchListItem;
    v9->_watchListItem = (SFWatchListItem *)v13;

    uint64_t v15 = [v12 cardSectionId];
    cardSectionId = v9->_cardSectionId;
    v9->_cardSectionId = (NSString *)v15;
  }
  return v9;
}

- (id)cacheIdentifier
{
  v2 = [(SearchUIAsyncWatchNowSectionLoader *)self watchListItem];
  id v3 = [v2 watchListIdentifier];

  return v3;
}

- (id)placeholderCardSections
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(SearchUIAsyncWatchNowSectionLoader *)self watchListItem];
  id v3 = +[SearchUIWatchNowCardSection placeholderCardForMediaContainer:](SearchUIWatchNowCardSection, "placeholderCardForMediaContainer:", [v2 isMediaContainer]);
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SearchUIAsyncWatchNowSectionLoader *)self watchListItem];
  uint64_t v6 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", [v5 type], objc_msgSend(v5, "isMediaContainer"));
  v7 = [v5 watchListIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SearchUIAsyncWatchNowSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6E73D80;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  +[SearchUIWatchListUtilities fetchButtonsForWatchListIdentifier:v7 type:v6 isHorizontallySrollingStyle:1 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __77__SearchUIAsyncWatchNowSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  [v6 setCardSection:MEMORY[0x1E4F1CBF0]];
  [v6 setAnimated:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v30 = a1;
    v31 = v6;
    v7 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v32 = v5;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v13 = [v12 buttonType];
          if (v13 != 3)
          {
            if (v13 == 2
              && ([v12 storeIdentifier],
                  v14 = objc_claimAutoreleasedReturnValue(),
                  v14,
                  v14))
            {
              uint64_t v15 = objc_opt_new();
              v16 = [v12 storeIdentifier];
              [v15 setStoreIdentifier:v16];
            }
            else
            {
              uint64_t v15 = objc_opt_new();
              v17 = (void *)MEMORY[0x1E4F9A2F8];
              v16 = [v12 punchoutURL];
              objc_super v18 = [v17 punchoutWithURL:v16];
              [v15 setPunchout:v18];
            }
            v19 = objc_opt_new();
            v20 = [v12 thumbnailImage];
            [v19 setImage:v20];

            v21 = (void *)MEMORY[0x1E4F9A378];
            v22 = [v12 title];
            v23 = [v21 textWithString:v22];
            [v19 setTitle:v23];

            v24 = [v19 title];
            [v24 setMaxLines:1];

            v25 = (void *)MEMORY[0x1E4F9A378];
            v26 = [v12 subtitle];
            v27 = [v25 textWithString:v26];
            [v19 setSubtitle:v27];

            v28 = [v19 subtitle];
            [v28 setMaxLines:2];

            [v19 setCommand:v15];
            v29 = [WeakRetained cardSectionId];
            [v19 setCardSectionId:v29];

            [v7 addObject:v19];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v9);
    }

    uint64_t v6 = v31;
    [v31 setCardSection:v7];
    (*(void (**)(void))(*(void *)(v30 + 32) + 16))();

    id v5 = v32;
  }
}

- (SFWatchListItem)watchListItem
{
  return (SFWatchListItem *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)cardSectionId
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

@end