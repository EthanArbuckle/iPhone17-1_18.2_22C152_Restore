@interface SSSuggestionResultBuilder
+ (id)buildResultWithResult:(id)a3 queryContext:(id)a4;
+ (id)buildResultWithSpotlightSuggestion:(id)a3 queryContext:(id)a4;
+ (id)buildResultWithSuggestion:(id)a3 queryContext:(id)a4;
+ (id)buildResultsWithCompletionsData:(id)a3 queryContext:(id)a4;
+ (id)buildResultsWithSuggestionsData:(id)a3 queryContext:(id)a4;
- (CSSuggestion)spotlightSuggestion;
- (NSString)contactIdentifier;
- (NSString)queryString;
- (NSString)suggestionString;
- (SFSearchSuggestion)suggestion;
- (SPSearchEntity)entity;
- (SSSuggestionResultBuilder)initWithResult:(id)a3 queryContext:(id)a4;
- (SSSuggestionResultBuilder)initWithSpotlightSuggestion:(id)a3 queryContext:(id)a4;
- (SSSuggestionResultBuilder)initWithSuggestion:(id)a3 queryContext:(id)a4;
- (id)buildCommand;
- (id)buildCompactCardSection;
- (id)buildHighlightedTextForSuggestion;
- (id)buildInlineCardSections;
- (id)buildPhotoTextAndGlyphForSuggestion:(id)a3;
- (id)buildResult;
- (id)buildSymbolImage;
- (void)setContactIdentifier:(id)a3;
- (void)setEntity:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setSpotlightSuggestion:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setSuggestionString:(id)a3;
@end

@implementation SSSuggestionResultBuilder

+ (id)buildResultWithResult:(id)a3 queryContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SSSuggestionResultBuilder alloc] initWithResult:v6 queryContext:v5];

  v8 = [(SSSuggestionResultBuilder *)v7 buildResult];
  [v8 clearBackendData];

  return v8;
}

- (SSSuggestionResultBuilder)initWithResult:(id)a3 queryContext:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SSSuggestionResultBuilder;
  v8 = [(SSSuggestionResultBuilder *)&v22 init];
  v9 = v8;
  if (v8)
  {
    [(SSResultBuilder *)v8 setQueryContext:v7];
    v10 = [v7 searchString];
    v11 = +[SPSearchSuggestionResult searchSuggestionRankingResultWithResult:query:sectionBundleIdentifier:queryId:](SPSearchSuggestionResult, "searchSuggestionRankingResultWithResult:query:sectionBundleIdentifier:queryId:", v6, v10, @"com.apple.searchd.suggestions", [v7 queryIdent]);
    [(SSResultBuilder *)v9 setResult:v11];

    v12 = [(SSResultBuilder *)v9 result];
    v13 = [v12 searchEntities];
    v14 = [v13 lastObject];
    [(SSSuggestionResultBuilder *)v9 setEntity:v14];

    v15 = [(SSResultBuilder *)v9 result];
    v16 = [v15 completion];

    if (v16)
    {
      v17 = [(SSResultBuilder *)v9 result];
      v18 = [v17 completion];
      [(SSSuggestionResultBuilder *)v9 setSuggestionString:v18];

      v19 = [(SSSuggestionResultBuilder *)v9 suggestionString];
      v23[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [(SSResultBuilder *)v9 setMatchedStrings:v20];
    }
  }

  return v9;
}

+ (id)buildResultWithSuggestion:(id)a3 queryContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SSSuggestionResultBuilder alloc] initWithSuggestion:v6 queryContext:v5];

  v8 = [(SSSuggestionResultBuilder *)v7 buildResult];
  [v8 clearBackendData];

  return v8;
}

- (SSSuggestionResultBuilder)initWithSuggestion:(id)a3 queryContext:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SSSuggestionResultBuilder;
  v8 = [(SSSuggestionResultBuilder *)&v23 init];
  v9 = v8;
  if (v8)
  {
    [(SSResultBuilder *)v8 setQueryContext:v7];
    v10 = [v6 suggestion];
    if (v10)
    {
      [(SSSuggestionResultBuilder *)v9 setSuggestionString:v10];
    }
    else
    {
      v11 = [v7 searchString];
      [(SSSuggestionResultBuilder *)v9 setSuggestionString:v11];
    }
    v12 = [v7 searchString];
    v13 = +[SPSearchSuggestionResult searchSuggestionRankingResultWithSuggestion:query:sectionBundleIdentifier:queryId:](SPSearchSuggestionResult, "searchSuggestionRankingResultWithSuggestion:query:sectionBundleIdentifier:queryId:", v6, v12, @"com.apple.searchd.suggestions", [v7 queryIdent]);
    [(SSResultBuilder *)v9 setResult:v13];

    v14 = [(SSResultBuilder *)v9 result];
    v15 = [v14 searchEntities];
    v16 = [v15 lastObject];
    [(SSSuggestionResultBuilder *)v9 setEntity:v16];

    v17 = [(SSSuggestionResultBuilder *)v9 entity];

    if (!v17)
    {
      v18 = [v6 suggestion];
      v19 = +[SPSearchEntity searchEntityWithSearchString:v18 spotlightQueryString:0 preferredBundleIDs:0];
      [(SSSuggestionResultBuilder *)v9 setEntity:v19];
    }
    [(SSSuggestionResultBuilder *)v9 setSuggestion:v6];
    v20 = [(SSSuggestionResultBuilder *)v9 suggestionString];
    v24[0] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [(SSResultBuilder *)v9 setMatchedStrings:v21];
  }
  return v9;
}

+ (id)buildResultWithSpotlightSuggestion:(id)a3 queryContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 suggestionKind] == 2)
  {
    id v7 = [[SSSuggestionResultBuilder alloc] initWithSpotlightSuggestion:v5 queryContext:v6];
    v8 = [(SSSuggestionResultBuilder *)v7 buildResult];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildResultsWithCompletionsData:(id)a3 queryContext:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (isMacOS())
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = SSBundlesDonatingPhotos();
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = [MEMORY[0x1E4F23870] emptySuggestion];
    v10 = (void *)MEMORY[0x1E4F23870];
    v11 = [v6 searchString];
    uint64_t v12 = [v10 updatedSuggestionWithCurrentSuggestion:v9 userString:v11 tokens:MEMORY[0x1E4F1CBF0]];

    v13 = (void *)MEMORY[0x1E4F23870];
    v14 = [v6 searchString];
    v33 = @"photosBundleIDs";
    v34[0] = v7;
    v27 = (void *)v7;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v26 = (void *)v12;
    v16 = [v13 suggestionsWithCurrentSuggestion:v12 userQueryString:v14 completionData:v5 options:v15];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_super v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v22 suggestionKind] == 2)
          {
            objc_super v23 = [[SSSuggestionResultBuilder alloc] initWithSpotlightSuggestion:v22 queryContext:v6];
            v24 = [(SSSuggestionResultBuilder *)v23 buildResult];
            if (v24) {
              [v8 addObject:v24];
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

+ (id)buildResultsWithSuggestionsData:(id)a3 queryContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = (void *)MEMORY[0x1E4F23870];
    v9 = [MEMORY[0x1E4F23870] emptySuggestion];
    v10 = [v6 searchString];
    uint64_t v11 = [v8 updatedSuggestionWithCurrentSuggestion:v9 userString:v10 tokens:MEMORY[0x1E4F1CBF0]];

    uint64_t v12 = (void *)MEMORY[0x1E4F23870];
    v13 = [v6 searchString];
    v24 = (void *)v11;
    v14 = [v12 suggestionsWithCurrentSuggestion:v11 userQueryString:v13 suggestionData:v5 options:MEMORY[0x1E4F1CC08]];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v20 suggestionKind] == 2)
          {
            v21 = [[SSSuggestionResultBuilder alloc] initWithSpotlightSuggestion:v20 queryContext:v6];
            objc_super v22 = [(SSSuggestionResultBuilder *)v21 buildResult];
            if (v22) {
              [v7 addObject:v22];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (SSSuggestionResultBuilder)initWithSpotlightSuggestion:(id)a3 queryContext:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SSSuggestionResultBuilder;
  id v8 = [(SSSuggestionResultBuilder *)&v20 init];
  v9 = v8;
  if (v8)
  {
    [(SSResultBuilder *)v8 setQueryContext:v7];
    v10 = [v7 searchString];
    [(SSSuggestionResultBuilder *)v9 setSuggestionString:v10];

    uint64_t v11 = [v7 searchString];
    uint64_t v12 = +[SPSearchSuggestionResult searchSuggestionRankingResultWithSpotlightSuggestion:query:sectionBundleIdentifier:queryId:](SPSearchSuggestionResult, "searchSuggestionRankingResultWithSpotlightSuggestion:query:sectionBundleIdentifier:queryId:", v6, v11, @"com.apple.searchd.suggestions", [v7 queryIdent]);
    [(SSResultBuilder *)v9 setResult:v12];

    v13 = [(SSResultBuilder *)v9 result];
    v14 = [v13 searchEntities];
    id v15 = [v14 lastObject];
    [(SSSuggestionResultBuilder *)v9 setEntity:v15];

    [(SSSuggestionResultBuilder *)v9 setSpotlightSuggestion:v6];
    uint64_t v16 = [(SSResultBuilder *)v9 result];
    uint64_t v17 = [v16 completion];
    v21[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(SSResultBuilder *)v9 setMatchedStrings:v18];
  }
  return v9;
}

- (id)buildResult
{
  id v5 = [(SSSuggestionResultBuilder *)self suggestion];
  if (v5)
  {
    int v6 = 0;
  }
  else
  {
    uint64_t v7 = [(SSSuggestionResultBuilder *)self spotlightSuggestion];
    if (v7)
    {
      v2 = (void *)v7;
      int v6 = 0;
    }
    else
    {
      v3 = [(SSResultBuilder *)self result];
      if (SSResultTypeIsServer([v3 type]))
      {

        goto LABEL_10;
      }
      v2 = 0;
      int v6 = 1;
    }
  }
  id v8 = [(SSResultBuilder *)self result];
  v9 = [v8 inlineCard];

  if (v6) {
  if (!v5)
  }

  if (!v9)
  {
    uint64_t v18 = [(SSResultBuilder *)self buildCompactCard];
    uint64_t v19 = [(SSResultBuilder *)self result];
    [v19 setCompactCard:v18];

    objc_super v20 = [(SSResultBuilder *)self buildInlineCard];
    v21 = [(SSResultBuilder *)self result];
    [v21 setInlineCard:v20];

    objc_super v22 = [(SSResultBuilder *)self buildPreviewButtonItems];
    objc_super v23 = [(SSResultBuilder *)self result];
    v24 = [v23 inlineCard];
    long long v25 = [v24 cardSections];
    long long v26 = [v25 firstObject];
    [v26 setPreviewButtonItems:v22];

    goto LABEL_16;
  }
LABEL_10:
  v10 = [(SSResultBuilder *)self result];
  uint64_t v11 = [v10 inlineCard];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    v13 = [(SSResultBuilder *)self result];
    v14 = [v13 inlineCard];
    id v15 = [v14 cardSections];
    uint64_t v16 = [v15 firstObject];
    uint64_t v17 = [v16 command];

    if (v17) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  objc_super v22 = [(SSResultBuilder *)self buildInlineCard];
  objc_super v23 = [(SSResultBuilder *)self result];
  [v23 setInlineCard:v22];
LABEL_16:

LABEL_17:
  return [(SSResultBuilder *)self result];
}

- (id)buildCompactCardSection
{
  return 0;
}

- (id)buildInlineCardSections
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSResultBuilder *)self result];
  if ([v3 type] == 32)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(SSResultBuilder *)self result];
    BOOL v4 = [v5 type] == 38;
  }
  int v6 = [(SSSuggestionResultBuilder *)self spotlightSuggestion];

  if (!v6)
  {
    uint64_t v16 = [(SSSuggestionResultBuilder *)self suggestion];

    if (v16)
    {
      uint64_t v7 = [(SSSuggestionResultBuilder *)self suggestion];
      unsigned int v17 = [v7 type];
      uint64_t v18 = [(SSSuggestionResultBuilder *)self entity];
      unsigned int v19 = [v18 isContactEntitySearch];

      if ((v17 & 0xFFFFFFFD) == 0xC) {
        uint64_t v20 = 4;
      }
      else {
        uint64_t v20 = 3;
      }
      if (v17 > 0xE || ((1 << v17) & 0x5800) == 0)
      {
        v21 = [(SSSuggestionResultBuilder *)self entity];
        int v22 = [v21 isAppEntitySearch];

        if (v22) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = v19;
        }
      }
      v9 = objc_opt_new();
      objc_super v23 = [v7 bundleIdentifier];
      [v9 setBundleIdentifier:v23];

      v24 = (SSContactResultBuilder *)objc_opt_new();
      long long v25 = [(SSSuggestionResultBuilder *)self buildHighlightedTextForSuggestion];
      [(SSContactResultBuilder *)v24 setSuggestionText:v25];

      long long v26 = [(SSContactResultBuilder *)v24 suggestionText];
      [v26 setMaxLines:1];

      [(SSContactResultBuilder *)v24 setSuggestionType:v20];
      long long v27 = (void *)MEMORY[0x1E4F9A378];
      long long v28 = [v7 detailText];
      long long v29 = [v27 textWithString:v28];
      [(SSContactResultBuilder *)v24 setDetailText:v29];

      v65 = v9;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
      [(SSContactResultBuilder *)v24 setPunchoutOptions:v30];

      long long v31 = [(SSSuggestionResultBuilder *)self buildSymbolImage];
      [(SSContactResultBuilder *)v24 setThumbnail:v31];

      v32 = [(SSSuggestionResultBuilder *)self buildCommand];
      [(SSContactResultBuilder *)v24 setCommand:v32];

      v64 = v24;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      goto LABEL_18;
    }
    if (v4)
    {
      v34 = [(SSSuggestionResultBuilder *)self entity];
      int v35 = [v34 isContactEntitySearch];

      if (v35)
      {
        uint64_t v7 = [(SSSuggestionResultBuilder *)self entity];
      }
      else
      {
        uint64_t v7 = 0;
      }
      v9 = objc_opt_new();
      v55 = [(SSResultBuilder *)self result];
      v56 = [v55 resultBundleId];
      [v9 setBundleIdentifier:v56];

      v57 = [SSContactResultBuilder alloc];
      v58 = [(SSResultBuilder *)self result];
      v59 = [v7 contact];
      v24 = [(SSContactResultBuilder *)v57 initWithResult:v58 contactEntity:v7 contact:v59];

      v48 = [(SSResultBuilder *)v24 buildCompactCardSection];
      v63 = v48;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
LABEL_31:

      goto LABEL_32;
    }
    v36 = [(SSResultBuilder *)self result];
    v37 = [v36 inlineCard];
    v38 = [v37 cardSections];
    uint64_t v7 = [v38 firstObject];

    if (v7 && ([v7 command], v39 = objc_claimAutoreleasedReturnValue(), v39, !v39))
    {
      v61 = [(SSSuggestionResultBuilder *)self buildCommand];
      [v7 setCommand:v61];
    }
    else
    {
      v40 = [(SSResultBuilder *)self result];
      char IsServer = SSResultTypeIsServer([v40 type]);

      if ((IsServer & 1) == 0)
      {
        v9 = objc_opt_new();
        v42 = [(SSSuggestionResultBuilder *)self entity];
        uint64_t v43 = [v42 symbolName];
        v44 = (void *)v43;
        if (v43) {
          v45 = (__CFString *)v43;
        }
        else {
          v45 = @"magnifyingglass";
        }
        [v9 setSymbolName:v45];

        [v9 setIsTemplate:1];
        v24 = (SSContactResultBuilder *)objc_opt_new();
        v46 = [(SSResultBuilder *)self result];
        v47 = [v46 resultBundleId];
        [(SSContactResultBuilder *)v24 setBundleIdentifier:v47];

        v48 = objc_opt_new();
        [v48 setThumbnail:v9];
        [v48 setShouldUseCompactDisplay:1];
        v49 = (void *)MEMORY[0x1E4F9A378];
        v50 = [(SSSuggestionResultBuilder *)self suggestionString];
        v51 = [v49 textWithString:v50];
        [v48 setTitle:v51];

        v52 = [v48 title];
        [v52 setMaxLines:1];

        v53 = objc_opt_new();
        v54 = [(SSSuggestionResultBuilder *)self suggestionString];
        [v53 setSearchString:v54];

        [v53 setQuerySource:1];
        [v48 setCommand:v53];
        v62 = v48;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];

        goto LABEL_31;
      }
    }
    v9 = [(SSResultBuilder *)self result];
    v24 = [v9 inlineCard];
    uint64_t v33 = [(SSContactResultBuilder *)v24 cardSections];
LABEL_18:
    id v15 = (void *)v33;
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v7 = objc_opt_new();
  id v8 = [(SSSuggestionResultBuilder *)self buildSymbolImage];
  [v7 setThumbnail:v8];

  [v7 setShouldUseCompactDisplay:1];
  v9 = [(SSSuggestionResultBuilder *)self buildHighlightedTextForSuggestion];
  v10 = [(SSSuggestionResultBuilder *)self entity];
  int v11 = [v10 isPhotosEntitySearch];

  if (v11)
  {
    uint64_t v12 = [(SSSuggestionResultBuilder *)self buildPhotoTextAndGlyphForSuggestion:v9];

    v9 = (void *)v12;
  }
  [v7 setTitle:v9];
  v13 = [v7 title];
  [v13 setMaxLines:1];

  v14 = [(SSSuggestionResultBuilder *)self buildCommand];
  [v7 setCommand:v14];

  v66[0] = v7;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
LABEL_33:

  return v15;
}

- (id)buildSymbolImage
{
  v3 = [(SSSuggestionResultBuilder *)self entity];
  BOOL v4 = v3;
  if (!v3)
  {
    uint64_t v6 = [(SSSuggestionResultBuilder *)self suggestion];
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = (void *)v6;
    id v8 = [(SSResultBuilder *)self result];
    char IsLocalSuggestion = SSResultTypeIsLocalSuggestion([v8 type]);

    if ((IsLocalSuggestion & 1) == 0) {
      goto LABEL_8;
    }
    id v5 = @"magnifyingglass";
LABEL_7:
    v10 = objc_opt_new();
    [v10 setSymbolName:v5];
    [v10 setIsTemplate:1];

    goto LABEL_9;
  }
  id v5 = [v3 symbolName];
  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)buildCommand
{
  uint64_t v3 = [(SSSuggestionResultBuilder *)self spotlightSuggestion];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    id v5 = [(SSSuggestionResultBuilder *)self entity];

    if (v5)
    {
      uint64_t v6 = [(SSSuggestionResultBuilder *)self entity];
      uint64_t v7 = [v6 command];

      goto LABEL_25;
    }
  }
  id v8 = [(SSSuggestionResultBuilder *)self suggestion];

  if (v8)
  {
    v9 = [(SSSuggestionResultBuilder *)self suggestion];
    if ([v9 type] != 12 && objc_msgSend(v9, "type") != 14)
    {
      long long v31 = [(SSResultBuilder *)self result];
      int IsLocalSuggestion = SSResultTypeIsLocalSuggestion([v31 type]);

      if (IsLocalSuggestion)
      {
        uint64_t v7 = objc_opt_new();
        uint64_t v33 = [(SSSuggestionResultBuilder *)self entity];
        v34 = [v33 searchString];
        [v7 setSearchString:v34];

        [v7 setQuerySource:1];
      }
      else
      {
        uint64_t v7 = 0;
      }
      goto LABEL_24;
    }
    uint64_t v7 = objc_opt_new();
    v10 = [(SSResultBuilder *)self result];
    int v11 = [(__CFString *)v10 title];
    uint64_t v12 = [v11 text];
    if (v12)
    {
      [v7 setSearchString:v12];
    }
    else
    {
      long long v29 = [(SSSuggestionResultBuilder *)self suggestionString];
      [v7 setSearchString:v29];
    }
  }
  else
  {
    v13 = [(SSSuggestionResultBuilder *)self entity];
    int v14 = [v13 isContactEntitySearch];

    if (v14)
    {
      v9 = [(SSSuggestionResultBuilder *)self entity];
      uint64_t v7 = objc_opt_new();
      id v15 = [v9 tokenText];
      [v7 setTokenString:v15];

      uint64_t v16 = [v9 personQueryIdentifier];
      unsigned int v17 = (void *)v16;
      uint64_t v18 = &stru_1F1824018;
      if (v16) {
        uint64_t v18 = (__CFString *)v16;
      }
      v10 = v18;

      unsigned int v19 = [v9 contactIdentifier];

      if (v19)
      {
        uint64_t v20 = [v9 contactIdentifier];
        uint64_t v21 = +[SPSearchContactEntity updatePersonQueryIdentifier:v10 withContactIdentifier:v20];

        v10 = (__CFString *)v21;
      }
      int v22 = [v9 personIdentifier];

      if (v22)
      {
        objc_super v23 = [v9 personIdentifier];
        uint64_t v24 = +[SPSearchContactEntity updatePersonQueryIdentifier:v10 withPersonIdentifier:v23];

        v10 = (__CFString *)v24;
      }
      [v7 setEntityIdentifier:v10];
      [v7 setEntityType:2];
      long long v25 = [(SSSuggestionResultBuilder *)self buildSymbolImage];
      [v7 setSymbolImage:v25];

      goto LABEL_23;
    }
    long long v26 = [(SSResultBuilder *)self result];
    long long v27 = [v26 resultBundleId];
    int v28 = [v27 isEqual:@"com.apple.spotlight.related_search_as_typed.web"];

    if (!v28)
    {
      uint64_t v7 = objc_opt_new();
      int v35 = [(SSResultBuilder *)self result];
      v36 = [v35 title];
      v37 = [v36 text];
      if (v37)
      {
        [v7 setSearchString:v37];
      }
      else
      {
        v39 = [(SSSuggestionResultBuilder *)self suggestionString];
        [v7 setSearchString:v39];
      }
      [v7 setQuerySource:2];
      goto LABEL_25;
    }
    uint64_t v7 = objc_opt_new();
    v9 = [(SSResultBuilder *)self result];
    v10 = [v9 title];
    int v11 = [(__CFString *)v10 text];
    if (v11)
    {
      [v7 setSearchString:v11];
    }
    else
    {
      v38 = [(SSSuggestionResultBuilder *)self suggestionString];
      [v7 setSearchString:v38];
    }
  }

LABEL_23:
LABEL_24:

LABEL_25:
  return v7;
}

- (id)buildHighlightedTextForSuggestion
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SSResultBuilder *)self matchedStrings];
  BOOL v4 = [v3 firstObject];

  id v5 = [(SSResultBuilder *)self queryContext];
  uint64_t v6 = [v5 searchEntities];
  uint64_t v7 = [v6 count];
  id v8 = [(SSResultBuilder *)self queryContext];
  v9 = v8;
  if (v7)
  {
    v10 = [v8 searchEntities];
    int v11 = [v10 firstObject];
    uint64_t v12 = [v11 displayString];
  }
  else
  {
    uint64_t v12 = [v8 searchString];
  }

  v13 = objc_opt_new();
  [v13 setText:v4];
  [v13 setIsEmphasized:1];
  v32[0] = v13;
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v15 = objc_opt_new();
  [v15 setFormattedTextPieces:v14];
  if (([v4 isEqual:v12] & 1) == 0)
  {
    uint64_t v16 = [(SSResultBuilder *)self buildHighlightedMatchedTextWithTitle:0 headTruncation:0];
    unsigned int v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = (void *)v16;
    }
    else {
      uint64_t v18 = v15;
    }
    id v19 = v18;

    id v15 = v19;
  }
  if (SSDefaultsGetState(6uLL))
  {
    uint64_t v20 = [(SSSuggestionResultBuilder *)self spotlightSuggestion];

    if (v20)
    {
      uint64_t v21 = [(SSResultBuilder *)self result];
      int v22 = [v21 type];

      if (v22 == 31)
      {
        objc_super v23 = @" L";
      }
      else
      {
        uint64_t v24 = [(SSResultBuilder *)self result];
        int v25 = [v24 type];

        if (v25 == 34)
        {
          objc_super v23 = @" N";
        }
        else
        {
          long long v26 = [(SSResultBuilder *)self result];
          int v27 = [v26 type];

          if (v27 != 39) {
            goto LABEL_18;
          }
          objc_super v23 = @" T";
        }
      }
      int v28 = objc_opt_new();
      [v28 setText:v23];
      [v28 setTextColor:3];
      long long v29 = [v15 formattedTextPieces];
      uint64_t v30 = [v29 arrayByAddingObject:v28];
      [v15 setFormattedTextPieces:v30];
    }
  }
LABEL_18:

  return v15;
}

- (id)buildPhotoTextAndGlyphForSuggestion:(id)a3
{
  id v3 = a3;
  v38 = [v3 formattedTextPieces];
  BOOL v4 = objc_opt_new();
  [v4 setSymbolName:@"photo.on.rectangle"];
  [v4 setIsTemplate:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A0E0]);
  v36 = v4;
  [v5 setGlyph:v4];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"TEMPLATE_PHOTOS_LOCATION_SEARCH" value:&stru_1F1824018 table:@"SpotlightServices"];

  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  int v35 = v7;
  v9 = [v7 componentsSeparatedByString:@"<query>"];
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v9 objectAtIndexedSubscript:v11];
      char v13 = [v12 isEqualToString:&stru_1F1824018];

      if ((v13 & 1) == 0)
      {
        int v14 = [v9 objectAtIndexedSubscript:v11];
        [v10 addObject:v14];
      }
      if (v11 < [v9 count] - 1) {
        [v10 addObjectsFromArray:v38];
      }
      ++v11;
    }
    while (v11 < [v9 count]);
  }
  v37 = v3;
  if ([v10 count])
  {
    uint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = [v10 objectAtIndexedSubscript:v15];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v18 = [v10 objectAtIndexedSubscript:v15];
      id v19 = v18;
      if ((isKindOfClass & 1) == 0) {
        break;
      }
      uint64_t v20 = [v18 rangeOfString:@"<photo-icon>"];

      uint64_t v21 = [v10 objectAtIndexedSubscript:v15];
      int v22 = v21;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = [v21 componentsSeparatedByString:@"<photo-icon>"];

        if ([v19 count])
        {
          unint64_t v26 = 0;
          do
          {
            int v27 = [v19 objectAtIndexedSubscript:v26];
            char v28 = [v27 isEqualToString:&stru_1F1824018];

            if ((v28 & 1) == 0)
            {
              long long v29 = (void *)MEMORY[0x1E4F9A0E0];
              uint64_t v30 = [v19 objectAtIndexedSubscript:v26];
              long long v31 = [v29 textWithString:v30];
              [v8 addObject:v31];
            }
            if (v26 < [v19 count] - 1) {
              [v8 addObject:v5];
            }
            ++v26;
          }
          while (v26 < [v19 count]);
        }
        goto LABEL_22;
      }
      char v23 = [v21 isEqualToString:&stru_1F1824018];

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F9A0E0];
        id v19 = [v10 objectAtIndexedSubscript:v15];
        int v25 = [v24 textWithString:v19];
        [v8 addObject:v25];

LABEL_22:
      }
      if (++v15 >= (unint64_t)[v10 count]) {
        goto LABEL_24;
      }
    }
    [v8 addObject:v18];
    goto LABEL_22;
  }
LABEL_24:
  if ([v8 count])
  {
    id v32 = (id)objc_opt_new();
    [v32 setFormattedTextPieces:v8];
    uint64_t v33 = v37;
  }
  else
  {
    uint64_t v33 = v37;
    id v32 = v37;
  }

  return v32;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)suggestionString
{
  return self->_suggestionString;
}

- (void)setSuggestionString:(id)a3
{
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (SFSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (CSSuggestion)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (void)setSpotlightSuggestion:(id)a3
{
}

- (SPSearchEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_suggestionString, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end