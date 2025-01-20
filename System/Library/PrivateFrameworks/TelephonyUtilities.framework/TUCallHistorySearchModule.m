@interface TUCallHistorySearchModule
- (BOOL)isSearchComplete;
- (NSMutableArray)currentResultsList;
- (NSString)previousSearchString;
- (TUSearchController)searchController;
- (TUSearchResults)searchResults;
- (void)searchForString:(id)a3 completion:(id)a4;
- (void)setCurrentResultsList:(id)a3;
- (void)setPreviousSearchString:(id)a3;
- (void)setSearchComplete:(BOOL)a3;
- (void)setSearchController:(id)a3;
@end

@implementation TUCallHistorySearchModule

- (void)searchForString:(id)a3 completion:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, TUCallHistorySearchModule *, uint64_t))a4;
  [(TUCallHistorySearchModule *)self setSearchComplete:0];
  uint64_t v8 = [v6 length];
  if (v8
    && ([(TUCallHistorySearchModule *)self previousSearchString],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = [(TUCallHistorySearchModule *)self previousSearchString];
    uint64_t v11 = [v6 rangeOfString:v10];

    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 1;
  }
  [(TUCallHistorySearchModule *)self setPreviousSearchString:v6];
  v13 = [(TUCallHistorySearchModule *)self currentResultsList];

  unint64_t v14 = 0x1E4F1C000uLL;
  id v48 = v6;
  v49 = self;
  v47 = v7;
  if (!v13 || v12)
  {
    -[TUCallHistorySearchModule setCurrentResultsList:](self, "setCurrentResultsList:", 0, v7, v6);
    v15 = +[TUCallHistoryController sharedController];
    v16 = [v15 recentCalls];

    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      [(TUCallHistorySearchModule *)self setCurrentResultsList:v17];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v56 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[TUProxyRecentCall alloc] initWithRecentCall:*(void *)(*((void *)&v55 + 1) + 8 * i)];
            v24 = [(TUCallHistorySearchModule *)v49 searchController];
            [(TUProxyRecentCall *)v23 setSearchController:v24];

            v25 = [(TUCallHistorySearchModule *)v49 currentResultsList];
            [v25 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v20);
      }

      id v6 = v48;
      self = v49;
      v7 = v47;
      unint64_t v14 = 0x1E4F1C000;
    }
    else
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(TUCallHistorySearchModule *)self setCurrentResultsList:v26];
    }
  }
  if (v8)
  {
    if (!gPhoneSeparatorCharacterSet)
    {
      uint64_t v27 = [MEMORY[0x1E4F28B88] phoneNumberSeparatorCharacterSet];
      v28 = (void *)gPhoneSeparatorCharacterSet;
      gPhoneSeparatorCharacterSet = v27;
    }
    v29 = objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v47, v48);
    v30 = [v29 componentsJoinedByString:&stru_1EECEA668];
    v31 = [v30 lowercaseString];

    v32 = *(void **)(v14 + 2632);
    v33 = [(TUCallHistorySearchModule *)self currentResultsList];
    v34 = objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = [(TUCallHistorySearchModule *)self currentResultsList];
    uint64_t v35 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          v40 = [v39 callerId];
          v41 = [v40 componentsSeparatedByCharactersInSet:gPhoneSeparatorCharacterSet];
          v42 = [v41 componentsJoinedByString:&stru_1EECEA668];
          v43 = [v42 lowercaseString];

          if ([v43 containsString:v31])
          {
            [v34 addObject:v39];
          }
          else
          {
            v44 = [v39 backingContact];

            if (v44)
            {
              v45 = [v39 displayName];
              v46 = [v45 lowercaseString];

              if ([v46 containsString:v31]) {
                [v34 addObject:v39];
              }
            }
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v36);
    }

    self = v49;
    [(TUCallHistorySearchModule *)v49 setCurrentResultsList:v34];

    v7 = v47;
    id v6 = v48;
  }
  -[TUCallHistorySearchModule setSearchComplete:](self, "setSearchComplete:", 1, v47, v48);
  if (v7) {
    v7[2](v7, self, 1);
  }
}

- (TUSearchResults)searchResults
{
  v3 = objc_alloc_init(TUSearchResults);
  v4 = [(TUCallHistorySearchModule *)self searchController];
  [(TUSearchResults *)v3 setSearchController:v4];

  v5 = [(TUCallHistorySearchModule *)self currentResultsList];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [TUResultGroup alloc];
    uint64_t v8 = TUBundle();
    v9 = [v8 localizedStringForKey:@"RECENTS" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    v10 = [(TUCallHistorySearchModule *)self currentResultsList];
    uint64_t v11 = [(TUResultGroup *)v7 initWithTitle:v9 results:v10];
    [(TUSearchResults *)v3 addResultGroup:v11];
  }

  return v3;
}

- (TUSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (TUSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (NSMutableArray)currentResultsList
{
  return self->_currentResultsList;
}

- (void)setCurrentResultsList:(id)a3
{
}

- (NSString)previousSearchString
{
  return self->_previousSearchString;
}

- (void)setPreviousSearchString:(id)a3
{
}

- (BOOL)isSearchComplete
{
  return self->_searchComplete;
}

- (void)setSearchComplete:(BOOL)a3
{
  self->_searchComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSearchString, 0);
  objc_storeStrong((id *)&self->_currentResultsList, 0);

  objc_destroyWeak((id *)&self->_searchController);
}

@end