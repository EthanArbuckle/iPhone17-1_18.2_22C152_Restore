@interface SearchUIWatchListCardsManager
- (BOOL)isInUpNext;
- (BOOL)isTappable;
- (NSHashTable)rowModels;
- (NSString)watchListIdentifier;
- (SearchUIWatchListCardsManager)initWithWatchListIdentifier:(id)a3;
- (SearchUIWatchListState)watchListState;
- (WLKCanonicalPlayablesResponse)response;
- (void)addWatchListRowModelObserver:(id)a3;
- (void)setIsInUpNext:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setRowModels:(id)a3;
- (void)setWatchListIdentifier:(id)a3;
- (void)setWatchListState:(id)a3;
@end

@implementation SearchUIWatchListCardsManager

- (SearchUIWatchListCardsManager)initWithWatchListIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchUIWatchListCardsManager;
  v5 = [(SearchUIWatchListCardsManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(SearchUIWatchListCardsManager *)v5 setWatchListIdentifier:v4];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    [(SearchUIWatchListCardsManager *)v6 setRowModels:v7];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke;
    v9[3] = &unk_1E6E72FF8;
    v10 = v6;
    +[SearchUIWatchListUtilities generateWatchListReponseForWatchListIdentifier:v4 type:5 completion:v9];
  }
  return v6;
}

void __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke_2;
  v5[3] = &unk_1E6E72620;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v5];
}

void __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setResponse:*(void *)(a1 + 40)];
  v2 = [[SearchUIWatchListState alloc] initWithResponse:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setWatchListState:v2];

  id v3 = [*(id *)(a1 + 32) response];
  objc_msgSend(*(id *)(a1 + 32), "setIsInUpNext:", objc_msgSend(v3, "isWatchListed"));

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v39 = a1;
  id obj = [*(id *)(a1 + 32) rowModels];
  uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v38 = *(void *)v41;
    uint64_t v35 = *MEMORY[0x1E4FB5288];
    uint64_t v36 = *MEMORY[0x1E4FB5290];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v8 = [*(id *)(v39 + 32) response];
        v9 = [v8 playables];
        v10 = [v9 firstObject];

        if (!v10)
        {
          [v7 setHasError:1];
          goto LABEL_28;
        }
        objc_super v11 = [SearchUIWatchListIconImage alloc];
        v12 = [v10 channelDetails];
        v13 = [v12 images];
        v14 = [(SearchUIWatchListIconImage *)v11 initWithArtwork:v13];

        +[SearchUIAppIconImage sizeForVariant:2];
        -[SearchUIWatchListIconImage setSize:](v14, "setSize:");
        v15 = [v10 channelDetails];
        LODWORD(v13) = [v15 isAppInstalled];

        if (!v13)
        {
          v24 = [v10 channelDetails];
          v25 = [v24 appStoreURL];

          if (!v25) {
            goto LABEL_20;
          }
          v22 = [v10 channelDetails];
          uint64_t v23 = [v22 appStoreURL];
          goto LABEL_16;
        }
        v16 = [v10 punchoutUrls];
        v17 = [v16 objectForKeyedSubscript:v36];
        uint64_t v18 = [v17 length];
        v19 = [v10 punchoutUrls];
        v20 = v19;
        if (v18) {
          uint64_t v21 = v36;
        }
        else {
          uint64_t v21 = v35;
        }
        v22 = [v19 objectForKeyedSubscript:v21];

        if ([v22 length])
        {
          uint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
LABEL_16:
          v25 = (void *)v23;
          goto LABEL_18;
        }
        v25 = 0;
LABEL_18:

        if (!v25)
        {
LABEL_20:
          v26 = 0;
          goto LABEL_21;
        }
        v26 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v25];
LABEL_21:
        v27 = [v7 cardSection];
        v28 = [v27 watchListItem];
        v29 = [v28 watchLiveTextFormat];

        v30 = [v10 channelDetails];
        v31 = [v30 name];

        if ([v29 length]) {
          v32 = v29;
        }
        else {
          v32 = v31;
        }
        id v33 = v32;
        if ([v29 length]) {
          v34 = v31;
        }
        else {
          v34 = 0;
        }
        [v7 updateWithTitle:v33 subtitle:v34 image:v14 punchout:v26];

LABEL_28:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v5);
  }
}

- (void)addWatchListRowModelObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIWatchListCardsManager *)self rowModels];
  [v5 addObject:v4];
}

- (BOOL)isTappable
{
  v2 = [(SearchUIWatchListCardsManager *)self response];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSHashTable)rowModels
{
  return self->_rowModels;
}

- (void)setRowModels:(id)a3
{
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setWatchListIdentifier:(id)a3
{
}

- (WLKCanonicalPlayablesResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (SearchUIWatchListState)watchListState
{
  return self->_watchListState;
}

- (void)setWatchListState:(id)a3
{
}

- (BOOL)isInUpNext
{
  return self->_isInUpNext;
}

- (void)setIsInUpNext:(BOOL)a3
{
  self->_isInUpNext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListState, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
  objc_storeStrong((id *)&self->_rowModels, 0);
}

@end