@interface TUIEmojiSearchSource
- (BOOL)shouldSupplyVerbatimResultsFor:(id)a3;
- (EMFEmojiLocaleData)localeData;
- (NSArray)multilingualSearchLocales;
- (NSArray)results;
- (NSArray)suggestedEmojis;
- (NSLocale)locale;
- (TUIEmojiSearchSource)initWithLocale:(id)a3;
- (TUIEmojiSearchSourceDelegate)delegate;
- (id)_emojiResultSetForExactQuery:(id)a3 autocorrectedQuery:(id)a4;
- (id)_filteredTokensIgnoringModifiers:(id)a3;
- (id)_repeatSearchQuery:(id)a3 forLocales:(id)a4;
- (id)languagesForMultilingualSearch;
- (void)_deliverResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5;
- (void)beginSearchForExactQuery:(id)a3 autocorrectedQuery:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocaleData:(id)a3;
- (void)setMultilingualSearchLocales:(id)a3;
@end

@implementation TUIEmojiSearchSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeData, 0);
  objc_storeStrong((id *)&self->_multilingualSearchLocales, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_autocorrectedQuery, 0);
  objc_storeStrong((id *)&self->_exactQuery, 0);
}

- (void)setLocaleData:(id)a3
{
}

- (EMFEmojiLocaleData)localeData
{
  return self->_localeData;
}

- (void)setMultilingualSearchLocales:(id)a3
{
}

- (NSArray)multilingualSearchLocales
{
  return self->_multilingualSearchLocales;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setDelegate:(id)a3
{
}

- (TUIEmojiSearchSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIEmojiSearchSourceDelegate *)WeakRetained;
}

- (void)_deliverResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__TUIEmojiSearchSource__deliverResults_forExactQuery_autocorrectedQuery___block_invoke;
  v14[3] = &unk_1E5593FD0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __73__TUIEmojiSearchSource__deliverResults_forExactQuery_autocorrectedQuery___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) isEqualToString:*(void *)(a1 + 40)])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) isEqualToString:*(void *)(a1 + 48)])
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 56));
      v2 = [*(id *)(a1 + 32) delegate];

      if (v2)
      {
        id v3 = [*(id *)(a1 + 32) delegate];
        [v3 emojiSearchSource:*(void *)(a1 + 32) didProduceResults:*(void *)(*(void *)(a1 + 32) + 24) forExactQuery:*(void *)(*(void *)(a1 + 32) + 8) autocorrectedQuery:*(void *)(*(void *)(a1 + 32) + 16)];
      }
    }
  }
}

- (id)_repeatSearchQuery:(id)a3 forLocales:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 = [(TUIEmojiSearchSource *)self locale];
        char v15 = UIKeyboardInputModeLanguageMatchesLocaleLanguage();

        if ((v15 & 1) == 0)
        {
          id v16 = [MEMORY[0x1E4F61078] emojiLocaleDataWithLocaleIdentifier:v13];
          id v17 = [v16 emojiTokensForText:v6 phoneticReading:0 options:17 searchType:2 includePrefixMatches:1];
          if ([v17 count]) {
            [v19 addObjectsFromArray:v17];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v19;
}

- (id)languagesForMultilingualSearch
{
  if (TIGetMultilingualEmojiSearchValue_onceToken != -1) {
    dispatch_once(&TIGetMultilingualEmojiSearchValue_onceToken, &__block_literal_global_7385);
  }
  id v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v4 = [v3 valueForPreferenceKey:@"MultilingualEmojiSearch"];

  LODWORD(v3) = [v4 BOOLValue];
  if (v3
    && ([(TUIEmojiSearchSource *)self multilingualSearchLocales],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    id v7 = [(TUIEmojiSearchSource *)self multilingualSearchLocales];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_emojiResultSetForExactQuery:(id)a3 autocorrectedQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8 + [v7 length])
  {
    uint64_t v10 = [(TUIEmojiSearchSource *)self localeData];
    id v11 = [v10 emojiTokensForText:v6 phoneticReading:0 options:17 searchType:2 includePrefixMatches:1];

    if ([(TUIEmojiSearchSource *)self shouldSupplyVerbatimResultsFor:v11])
    {
      id v11 = v11;
      uint64_t v9 = v11;
    }
    else
    {
      id v12 = [(TUIEmojiSearchSource *)self languagesForMultilingualSearch];
      if (![v11 count] && v12)
      {
        uint64_t v13 = [(TUIEmojiSearchSource *)self _repeatSearchQuery:v6 forLocales:v12];

        id v11 = (id)v13;
      }
      v14 = [(TUIEmojiSearchSource *)self localeData];
      char v15 = [v14 emojiTokensForText:v7 phoneticReading:0 options:17 searchType:2 includePrefixMatches:1];

      id v16 = [v11 arrayByAddingObjectsFromArray:v15];
      if ((unint64_t)[v12 count] >= 2)
      {
        id v17 = [(TUIEmojiSearchSource *)self _repeatSearchQuery:v7 forLocales:v12];
        uint64_t v18 = [v16 arrayByAddingObjectsFromArray:v17];

        id v16 = (void *)v18;
      }
      uint64_t v9 = [(TUIEmojiSearchSource *)self _filteredTokensIgnoringModifiers:v16];
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (NSArray)suggestedEmojis
{
  id v3 = [MEMORY[0x1E4F61068] categoryWithIdentifier:*MEMORY[0x1E4F61058]];
  v4 = [v3 emojiTokensForLocaleData:self->_localeData];
  id v5 = objc_alloc_init(MEMORY[0x1E4F61080]);
  id v6 = [v5 recentEmojis];
  id v7 = (void *)[v6 mutableCopy];

  if ((unint64_t)[v7 count] <= 0xE)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v8 + 1;
      uint64_t v10 = objc_msgSend(v4, "objectAtIndex:");
      [v7 addObject:v10];

      unint64_t v11 = [v7 count];
      uint64_t v8 = v9;
    }
    while (v11 < 0xF);
  }
  id v12 = [(TUIEmojiSearchSource *)self _filteredTokensIgnoringModifiers:v7];

  return (NSArray *)v12;
}

- (id)_filteredTokensIgnoringModifiers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsSkinToneVariants", (void)v19))
        {
          id v12 = (void *)MEMORY[0x1E4F610B8];
          uint64_t v13 = [v11 string];
          v14 = [v12 _baseStringForEmojiString:v13];

          if ([v4 containsObject:v14])
          {

            continue;
          }
        }
        else
        {
          char v15 = [v11 string];
          char v16 = [v4 containsObject:v15];

          if (v16) {
            continue;
          }
          v14 = [v11 string];
        }
        [v4 addObject:v14];

        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v17 = [v5 array];

  return v17;
}

- (BOOL)shouldSupplyVerbatimResultsFor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "string", (void)v14);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  unint64_t v11 = (void *)shouldSupplyVerbatimResultsFor__verbatimResultSets;
  if (!shouldSupplyVerbatimResultsFor__verbatimResultSets)
  {
    unint64_t v11 = &unk_1EDC79C08;
    shouldSupplyVerbatimResultsFor__verbatimResultSets = (uint64_t)&unk_1EDC79C08;
  }
  char v12 = objc_msgSend(v11, "containsObject:", v4, (void)v14);

  return v12;
}

- (void)beginSearchForExactQuery:(id)a3 autocorrectedQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(NSString *)self->_exactQuery isEqualToString:v6]
    || ![(NSString *)self->_autocorrectedQuery isEqualToString:v7])
  {
    uint64_t v8 = (NSString *)[v6 copy];
    exactQuery = self->_exactQuery;
    self->_exactQuery = v8;

    uint64_t v10 = (NSString *)[v7 copy];
    autocorrectedQuery = self->_autocorrectedQuery;
    self->_autocorrectedQuery = v10;

    searchQueue = self->_searchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__TUIEmojiSearchSource_beginSearchForExactQuery_autocorrectedQuery___block_invoke;
    block[3] = &unk_1E5593FA8;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(searchQueue, block);
  }
}

void __68__TUIEmojiSearchSource_beginSearchForExactQuery_autocorrectedQuery___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _emojiResultSetForExactQuery:*(void *)(a1 + 40) autocorrectedQuery:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _deliverResults:v2 forExactQuery:*(void *)(a1 + 40) autocorrectedQuery:*(void *)(a1 + 48)];
}

- (TUIEmojiSearchSource)initWithLocale:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIEmojiSearchSource;
  id v5 = [(TUIEmojiSearchSource *)&v12 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TextInputUI.emojiSearchQueue", MEMORY[0x1E4F14430]);
    searchQueue = v5->_searchQueue;
    v5->_searchQueue = (OS_dispatch_queue *)v6;

    [(TUIEmojiSearchSource *)v5 setLocale:v4];
    uint64_t v8 = (void *)MEMORY[0x1E4F61078];
    uint64_t v9 = [v4 localeIdentifier];
    uint64_t v10 = [v8 emojiLocaleDataWithLocaleIdentifier:v9];
    [(TUIEmojiSearchSource *)v5 setLocaleData:v10];
  }
  return v5;
}

@end