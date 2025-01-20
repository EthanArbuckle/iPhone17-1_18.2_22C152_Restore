@interface SPSearchSuggestionResult
+ (BOOL)supportsSecureCoding;
+ (id)searchSuggestionRankingResultWithResult:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6;
+ (id)searchSuggestionRankingResultWithSpotlightSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6;
+ (id)searchSuggestionRankingResultWithSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6;
+ (void)updateRankingItemForSuggestionResult:(id)a3;
- (CSSuggestion)spotlightSuggestion;
- (NSArray)searchEntities;
- (NSString)query;
- (SFSearchSuggestion)suggestion;
- (SPSearchSuggestionResult)initWithCoder:(id)a3;
- (SPSearchSuggestionResult)initWithSearchResult:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6;
- (SPSearchSuggestionResult)initWithSearchSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6;
- (SPSearchSuggestionResult)initWithSpotlightSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6;
- (id)localSuggestionFeatures;
- (id)suggestionsFeedbackData;
- (int64_t)compareByRank:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation SPSearchSuggestionResult

+ (void)updateRankingItemForSuggestionResult:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 type] == 32 || objc_msgSend(v3, "type") == 38)
  {
    v4 = objc_alloc_init(PRSRankingItem);
    v5 = [v3 suggestionsFeedbackData];
    [(PRSRankingItem *)v4 setLocalSuggestionsData:v5];

    [v3 rankingScore];
    -[PRSRankingItem setSuggestionScore:](v4, "setSuggestionScore:");
    v18 = @"suggestion score";
    v6 = (void *)MEMORY[0x1E4F28ED0];
    [(PRSRankingItem *)v4 suggestionScore];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    v19[0] = v7;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = (void **)v19;
    v10 = &v18;
  }
  else
  {
    int IsLocalSuggestion = SSResultTypeIsLocalSuggestion([v3 type]);
    v4 = objc_alloc_init(PRSRankingItem);
    v14 = [v3 suggestionsFeedbackData];
    if (!IsLocalSuggestion)
    {
      [(PRSRankingItem *)v4 setServerSuggestionsData:v14];

      [v3 rankingScore];
      -[PRSRankingItem setSuggestionScore:](v4, "setSuggestionScore:");
      goto LABEL_5;
    }
    [(PRSRankingItem *)v4 setLocalSuggestionsData:v14];

    [v3 rankingScore];
    -[PRSRankingItem setSuggestionScore:](v4, "setSuggestionScore:");
    v16 = @"suggestion score";
    v15 = (void *)MEMORY[0x1E4F28ED0];
    [(PRSRankingItem *)v4 suggestionScore];
    v7 = objc_msgSend(v15, "numberWithDouble:");
    v17 = v7;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = &v17;
    v10 = &v16;
  }
  v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
  [v3 setLocalFeatures:v11];

LABEL_5:
  [(PRSRankingItem *)v4 setSuggestionBundleIDType];
  v12 = [v3 sectionBundleIdentifier];
  [(PRSRankingItem *)v4 setSectionBundleIdentifier:v12];

  [v3 setRankingItem:v4];
}

+ (id)searchSuggestionRankingResultWithResult:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[SPSearchSuggestionResult alloc] initWithSearchResult:v11 query:v10 sectionBundleIdentifier:v9 queryId:a6];

  [(id)objc_opt_class() updateRankingItemForSuggestionResult:v12];
  return v12;
}

+ (id)searchSuggestionRankingResultWithSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[SPSearchSuggestionResult alloc] initWithSearchSuggestion:v11 query:v10 sectionBundleIdentifier:v9 queryId:a6];

  [(id)objc_opt_class() updateRankingItemForSuggestionResult:v12];
  return v12;
}

- (SPSearchSuggestionResult)initWithSearchResult:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id obj = a4;
  id v10 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v12 = v9;
  v79.receiver = self;
  v79.super_class = (Class)SPSearchSuggestionResult;
  v13 = [(SFSearchResult_SpotlightExtras *)&v79 initWithResult:v12 groupId:0];
  v14 = v13;
  if (v13)
  {
    v15 = [(SPSearchSuggestionResult *)v13 resultBundleId];
    if (v15)
    {
      [(SPSearchSuggestionResult *)v14 setResultBundleId:v15];
    }
    else
    {
      v16 = [(SPSearchSuggestionResult *)v14 applicationBundleIdentifier];
      if (v16)
      {
        [(SPSearchSuggestionResult *)v14 setResultBundleId:v16];
      }
      else
      {
        v17 = [(SPSearchSuggestionResult *)v14 sectionBundleIdentifier];
        [(SPSearchSuggestionResult *)v14 setResultBundleId:v17];
      }
    }

    [v12 rankingScore];
    [(SFSearchResult_SpotlightExtras *)v14 setScore:(unsigned __int128)v18];
    if (isKindOfClass)
    {
      v19 = [v12 personQueryIdentifier];
      [(SFSearchResult_SpotlightExtras *)v14 setPersonQueryIdentifier:v19];

      v20 = [v12 personIdentifier];
      [(SFSearchResult_SpotlightExtras *)v14 setPersonIdentifier:v20];
    }
    else
    {
      [(SFSearchResult_SpotlightExtras *)v14 setPersonQueryIdentifier:0];
      [(SFSearchResult_SpotlightExtras *)v14 setPersonIdentifier:0];
    }
    if ([(SPSearchSuggestionResult *)v14 type] == 38
      || [(SPSearchSuggestionResult *)v14 type] == 37)
    {
      v21 = [(SFSearchResult_SpotlightExtras *)v14 personIdentifier];
      if (v21)
      {
      }
      else
      {
        v22 = [(SPSearchSuggestionResult *)v14 contactIdentifier];

        if (v22)
        {
          v23 = [(SPSearchSuggestionResult *)v14 identifier];
          [(SFSearchResult_SpotlightExtras *)v14 setPersonIdentifier:v23];

          v24 = [(SPSearchSuggestionResult *)v14 contactIdentifier];
          [(SFSearchResult_SpotlightExtras *)v14 setPersonQueryIdentifier:v24];

          [(SPSearchSuggestionResult *)v14 setContactIdentifier:0];
        }
      }
    }
    [(SFSearchResult_SpotlightExtras *)v14 setProtectionClass:&stru_1F1824018];
    v25 = [(SFSearchResult_SpotlightExtras *)v14 personQueryIdentifier];

    if (v25)
    {
      v26 = [(SPSearchSuggestionResult *)v14 title];
      v27 = [v26 text];
      [(SPSearchSuggestionResult *)v14 setCompletion:v27];

      v28 = [(SFSearchResult_SpotlightExtras *)v14 personQueryIdentifier];
      v29 = [(SPSearchSuggestionResult *)v14 contactIdentifier];

      if (v29)
      {
        v30 = [(SPSearchSuggestionResult *)v14 contactIdentifier];
        uint64_t v31 = +[SPSearchContactEntity updatePersonQueryIdentifier:v28 withContactIdentifier:v30];

        v28 = (void *)v31;
      }
      v32 = [(SFSearchResult_SpotlightExtras *)v14 personIdentifier];

      if (v32)
      {
        v33 = [(SFSearchResult_SpotlightExtras *)v14 personIdentifier];
        uint64_t v34 = +[SPSearchContactEntity updatePersonQueryIdentifier:v28 withPersonIdentifier:v33];

        v28 = (void *)v34;
      }
      v35 = +[SPSearchEntity searchEntityWithPersonQueryIdentifier:v28 personName:0 fromSuggestion:1];
      v36 = v35;
      if (v35)
      {
        v37 = [v35 contactIdentifier];
        [(SPSearchSuggestionResult *)v14 setContactIdentifier:v37];

        v38 = [v36 personIdentifier];
        [(SFSearchResult_SpotlightExtras *)v14 setPersonIdentifier:v38];

        v39 = [v36 personQueryIdentifier];
        [(SFSearchResult_SpotlightExtras *)v14 setPersonQueryIdentifier:v39];

        v84[0] = v36;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
        v6 = [(SFSearchResult_SpotlightExtras *)v14 personIdentifier];
        if (v6)
        {
          [(SPSearchSuggestionResult *)v14 setIdentifier:v6];
        }
        else
        {
          [(SPSearchSuggestionResult *)v14 contactIdentifier];
          v46 = id v45 = v10;
          [(SPSearchSuggestionResult *)v14 setIdentifier:v46];

          id v10 = v45;
        }
      }
      else
      {
        v40 = 0;
      }
      [(SPSearchSuggestionResult *)v14 setType:38];
      [(SPSearchSuggestionResult *)v14 setResultBundleId:@"com.apple.spotlight.suggestionlist.contact.people"];
      goto LABEL_32;
    }
    v41 = [(SPSearchSuggestionResult *)v14 contactIdentifier];

    if (v41)
    {
      v42 = [(SPSearchSuggestionResult *)v14 title];
      v43 = [v42 text];
      [(SPSearchSuggestionResult *)v14 setCompletion:v43];

      v44 = [(SPSearchSuggestionResult *)v14 contactIdentifier];
      v28 = +[SPSearchEntity searchEntityWithContactIdentifier:v44 fromSuggestion:1];

      if (v28)
      {
        v83 = v28;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      }
      else
      {
        v40 = 0;
      }
      [(SPSearchSuggestionResult *)v14 setType:32];
      [(SPSearchSuggestionResult *)v14 setResultBundleId:@"com.apple.spotlight.suggestionlist.contact.contact"];
      goto LABEL_39;
    }
    v47 = [v12 inlineCard];
    v48 = [v47 cardSections];
    v6 = [v48 firstObject];
    v28 = [v6 command];

    v49 = [v12 resultBundleId];
    LODWORD(v48) = [v49 isEqualToString:@"com.apple.spotlight.suggestionlist.parsec.entity"];

    if (v48)
    {
      if (v28)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v50 = +[SPSearchEntity searchEntityWithCommand:v28 fromSuggestion:1];
          v82 = v50;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];

          v51 = [v28 searchString];
          goto LABEL_70;
        }
      }
LABEL_72:
      v40 = 0;
LABEL_73:
      v36 = [(SPSearchSuggestionResult *)v14 completion];
      [(SPSearchSuggestionResult *)v14 setCompletion:v36];
LABEL_32:

LABEL_39:
      v51 = 0;
      goto LABEL_40;
    }
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v74 = [v28 searchString];
LABEL_66:
        v51 = (void *)v74;
        goto LABEL_69;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v74 = [v28 utteranceText];
        goto LABEL_66;
      }
    }
    v75 = [v12 title];
    v76 = [v75 text];

    if (!v76) {
      goto LABEL_72;
    }
    v77 = [v12 title];
    v51 = [v77 text];

LABEL_69:
    v40 = 0;
LABEL_70:
    if (v51)
    {
      [(SPSearchSuggestionResult *)v14 setCompletion:v51];
LABEL_40:

      v52 = [(SPSearchSuggestionResult *)v14 completion];

      if (v52)
      {
        if (v40) {
          goto LABEL_50;
        }
      }
      else
      {
        if (v51) {
          id v53 = v51;
        }
        else {
          id v53 = v10;
        }
        [(SPSearchSuggestionResult *)v14 setCompletion:v53];
        if (v40)
        {
LABEL_50:
          v60 = [(SPSearchSuggestionResult *)v14 contactIdentifier];
          if (v60
            || ([(SFSearchResult_SpotlightExtras *)v14 personIdentifier],
                (v6 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v61 = [(SPSearchSuggestionResult *)v14 resultBundleId];
            [(SPSearchSuggestionResult *)v14 setIdentifier:v61];

            if (v60)
            {
LABEL_59:

              v69 = [(SPSearchSuggestionResult *)v14 suggestionsFeedbackData];
              [(SFSearchResult_SpotlightExtras *)v14 setSuggestionsFeedbackData:v69];

              searchEntities = v14->_searchEntities;
              v14->_searchEntities = v40;
              v71 = v40;

              suggestion = v14->_suggestion;
              v14->_suggestion = 0;

              objc_storeStrong((id *)&v14->_query, obj);
              goto LABEL_60;
            }
          }
          else
          {
            v62 = [(SPSearchSuggestionResult *)v14 resultBundleId];
            v80[0] = v62;
            uint64_t v63 = [(SPSearchSuggestionResult *)v14 completion];
            v64 = (void *)v63;
            if (v63) {
              v65 = (__CFString *)v63;
            }
            else {
              v65 = &stru_1F1824018;
            }
            v80[1] = v65;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
            v67 = id v66 = v10;
            v68 = [v67 componentsJoinedByString:@":"];
            [(SPSearchSuggestionResult *)v14 setIdentifier:v68];

            id v10 = v66;
            v6 = 0;
          }

          goto LABEL_59;
        }
      }
      v54 = [(SPSearchSuggestionResult *)v14 completion];

      if (v54)
      {
        v55 = [(SPSearchSuggestionResult *)v14 completion];
        v56 = SSEscapedStringForSearchQuery(v55);

        v6 = [(SPSearchSuggestionResult *)v14 completion];
        [NSString stringWithFormat:@"**=\"%@\"cwd || _kMDItemLaunchString=\"%@\"cwd", v56, v56, obj];
        v58 = id v57 = v10;
        v59 = +[SPSearchEntity searchEntityWithSearchString:v6 spotlightQueryString:v58 preferredBundleIDs:0];
        v81 = v59;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];

        id v10 = v57;
      }
      else
      {
        v40 = 0;
      }
      goto LABEL_50;
    }
    goto LABEL_73;
  }
LABEL_60:

  return v14;
}

+ (id)searchSuggestionRankingResultWithSpotlightSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[SPSearchSuggestionResult alloc] initWithSpotlightSuggestion:v11 query:v10 sectionBundleIdentifier:v9 queryId:a6];

  [(id)objc_opt_class() updateRankingItemForSuggestionResult:v12];
  return v12;
}

- (SPSearchSuggestionResult)initWithSpotlightSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v43.receiver = self;
  v43.super_class = (Class)SPSearchSuggestionResult;
  v14 = [(SFSearchResult_SpotlightExtras *)&v43 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_38;
  }
  unint64_t v39 = a6;
  objc_storeStrong((id *)&v14->_spotlightSuggestion, a3);
  v16 = [(SPSearchSuggestionResult *)v15 localSuggestionFeatures];
  [(SPSearchSuggestionResult *)v15 setLocalFeatures:v16];

  v17 = [(SPSearchSuggestionResult *)v15 suggestionsFeedbackData];
  [(SFSearchResult_SpotlightExtras *)v15 setSuggestionsFeedbackData:v17];

  double v18 = [v11 localizedAttributedSuggestion];
  v19 = [v18 string];

  v20 = @"com.apple.spotlight.suggestionlist.local";
  v21 = [(SPSearchSuggestionResult *)v15 localFeatures];
  id v41 = v13;
  id v42 = v12;
  v40 = v21;
  if (v21)
  {
    v22 = [v21 objectForKeyedSubscript:@"completionType"];
    if (v22)
    {
      v23 = v22;
      int v24 = [v22 intValue];
      if (v24 > 20)
      {
        if (v24 == 21)
        {
          uint64_t v31 = SSResultBundleIdSuggestionLocalTopic;
        }
        else
        {
          if (v24 != 22)
          {
LABEL_19:
            v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];

            goto LABEL_20;
          }
          uint64_t v31 = SSResultBundleIdSuggestionLocalCategory;
        }
        v25 = *v31;

        v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];

        uint64_t v27 = 39;
        goto LABEL_25;
      }
      if (v24 != 5)
      {
        if (v24 == 6)
        {
          v25 = @"com.apple.spotlight.suggestionlist.photo";

          v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];

          uint64_t v27 = 35;
LABEL_25:
          v20 = v25;
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];

LABEL_22:
      uint64_t v27 = 34;
      goto LABEL_26;
    }
  }
  v28 = [v11 currentToken];
  uint64_t v29 = [v28 tokenKind];

  switch(v29)
  {
    case 5:
      v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];
      goto LABEL_22;
    case 17:
      v30 = @"com.apple.spotlight.suggestionlist.photo";

      v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];
      uint64_t v27 = 35;
      break;
    case 45:
      v30 = @"com.apple.spotlight.suggestionlist.local.topic";

      v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];
      uint64_t v27 = 39;
      break;
    default:
      v26 = +[SPSearchEntity searchEntityWithSpotlightSuggestion:v11 symbolName:@"magnifyingglass" fromSuggestion:1];
LABEL_20:
      uint64_t v27 = 31;
      goto LABEL_26;
  }
  v20 = v30;
LABEL_26:
  [(SPSearchSuggestionResult *)v15 setQueryId:v39];
  if (v20) {
    v32 = v20;
  }
  else {
    v32 = &stru_1F1824018;
  }
  if (v19) {
    v33 = v19;
  }
  else {
    v33 = &stru_1F1824018;
  }
  v45[0] = v32;
  v45[1] = v33;
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v35 = [v34 componentsJoinedByString:@": "];
  [(SPSearchSuggestionResult *)v15 setIdentifier:v35];

  v36 = [MEMORY[0x1E4F9A4C0] textWithString:v19];
  [(SPSearchSuggestionResult *)v15 setTitle:v36];

  id v13 = v41;
  [(SPSearchSuggestionResult *)v15 setSectionBundleIdentifier:v41];
  [(SPSearchSuggestionResult *)v15 setType:v27];
  [(SPSearchSuggestionResult *)v15 setCompletion:v19];
  [(SPSearchSuggestionResult *)v15 setResultBundleId:v20];
  [(SFSearchResult_SpotlightExtras *)v15 setProtectionClass:&stru_1F1824018];
  if (v26)
  {
    v44 = v26;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  }
  else
  {
    v37 = 0;
  }
  id v12 = v42;
  objc_storeStrong((id *)&v15->_searchEntities, v37);
  if (v26) {

  }
  objc_storeStrong((id *)&v15->_query, a4);
LABEL_38:

  return v15;
}

- (SPSearchSuggestionResult)initWithSearchSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SPSearchSuggestionResult;
  v14 = [(SFSearchResult_SpotlightExtras *)&v47 init];
  if (!v14) {
    goto LABEL_35;
  }
  id v44 = a4;
  v46 = v13;
  if (v11)
  {
    v15 = [v11 suggestion];
    if (objc_opt_respondsToSelector())
    {
      v16 = [v11 searchEntities];
      goto LABEL_7;
    }
  }
  else
  {
    v15 = (__CFString *)v12;
  }
  v16 = 0;
LABEL_7:
  id obj = a3;
  id v45 = v12;
  v17 = [(NSArray *)v16 lastObject];
  double v18 = @"com.apple.spotlight.suggestionlist.local";
  [v11 score];
  double v20 = v19;
  uint64_t v21 = 34;
  switch([v11 type])
  {
    case 1u:
      v22 = @"com.apple.spotlight.suggestionlist.parsec";

      uint64_t v21 = 17;
      goto LABEL_27;
    case 2u:
      v22 = @"com.apple.spotlight.suggestionlist.proactive";

      [v11 score];
      double v20 = v23 * 128.0 * 1024.0 * 1024.0;
      uint64_t v21 = 15;
      goto LABEL_27;
    case 5u:
      v22 = @"com.apple.spotlight.suggestionlist.contact.contact";

      uint64_t v21 = 32;
      goto LABEL_27;
    case 6u:
      v22 = @"com.apple.spotlight.suggestionlist.usertypedstring";

      uint64_t v21 = 30;
      goto LABEL_27;
    case 7u:
      if (v17 && [v17 isPhotosEntitySearch])
      {
        int v24 = @"com.apple.spotlight.suggestionlist.photo";

        uint64_t v21 = 35;
        double v18 = v24;
      }
      else
      {
        uint64_t v21 = 31;
      }
      [v11 score];
      double v20 = v25 * 128.0 * 1024.0 * 1024.0;
      goto LABEL_28;
    case 0xBu:
      v22 = @"com.apple.spotlight.suggestionlist.siri";

      uint64_t v21 = 27;
      goto LABEL_27;
    case 0xCu:
      v22 = @"com.apple.spotlight.websuggestionlist.parsec";

      uint64_t v21 = 28;
      goto LABEL_27;
    case 0xEu:
      v22 = @"com.apple.spotlight.websuggestionlist.usertypedstring";

      uint64_t v21 = 29;
      goto LABEL_27;
    case 0xFu:
      goto LABEL_28;
    default:
      if (v17 && [v17 isAppEntitySearch]
        || ([v11 bundleIdentifier],
            v26 = objc_claimAutoreleasedReturnValue(),
            int v27 = [v26 isEqualToString:@"com.apple.application"],
            v26,
            v27))
      {
        v22 = @"com.apple.application";

        uint64_t v21 = 33;
LABEL_27:
        double v18 = v22;
        goto LABEL_28;
      }
      if ([v46 isEqualToString:@"com.apple.searchd.searchThroughSuggestions"])
      {
        v28 = [v11 bundleIdentifier];
        uint64_t v29 = [v28 componentsSeparatedByString:@"."];
        v30 = [v29 lastObject];

        v22 = [@"com.apple.other:search_" stringByAppendingString:v30];

        uint64_t v21 = 16;
        goto LABEL_27;
      }
      uint64_t v21 = 16;
LABEL_28:
      [(SPSearchSuggestionResult *)v14 setQueryId:v42];
      [(SFSearchResult_SpotlightExtras *)v14 setScore:(unsigned __int128)v20];
      [v11 score];
      -[SPSearchSuggestionResult setRankingScore:](v14, "setRankingScore:");
      if (v18) {
        uint64_t v31 = v18;
      }
      else {
        uint64_t v31 = &stru_1F1824018;
      }
      if (v15) {
        v32 = v15;
      }
      else {
        v32 = &stru_1F1824018;
      }
      v48[0] = v31;
      v48[1] = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
      uint64_t v34 = [v33 componentsJoinedByString:@": "];
      [(SPSearchSuggestionResult *)v14 setIdentifier:v34];

      v35 = [MEMORY[0x1E4F9A4C0] textWithString:v15];
      [(SPSearchSuggestionResult *)v14 setTitle:v35];

      v36 = [v11 fbr];
      [(SPSearchSuggestionResult *)v14 setFbr:v36];

      id v13 = v46;
      [(SPSearchSuggestionResult *)v14 setSectionBundleIdentifier:v46];
      [(SPSearchSuggestionResult *)v14 setType:v21];
      [(SPSearchSuggestionResult *)v14 setCompletion:v15];
      [(SPSearchSuggestionResult *)v14 setResultBundleId:v18];
      v37 = [v11 serverFeatures];
      [(SPSearchSuggestionResult *)v14 setServerFeatures:v37];

      v38 = [(SPSearchSuggestionResult *)v14 suggestionsFeedbackData];
      [(SFSearchResult_SpotlightExtras *)v14 setSuggestionsFeedbackData:v38];

      [(SFSearchResult_SpotlightExtras *)v14 setProtectionClass:&stru_1F1824018];
      searchEntities = v14->_searchEntities;
      v14->_searchEntities = v16;
      v40 = v16;

      objc_storeStrong((id *)&v14->_suggestion, obj);
      objc_storeStrong((id *)&v14->_query, v44);

      id v12 = v45;
      break;
  }
LABEL_35:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPSearchSuggestionResult;
  id v4 = a3;
  [(SFSearchResult_SpotlightExtras *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, @"query", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_suggestion forKey:@"suggestion"];
  [v4 encodeObject:self->_spotlightSuggestion forKey:@"spotlightSuggestion"];
  [v4 encodeObject:self->_searchEntities forKey:@"searchEntities"];
}

- (SPSearchSuggestionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SPSearchSuggestionResult;
  objc_super v5 = [(SFSearchResult_SpotlightExtras *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    query = v5->_query;
    v5->_query = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestion"];
    suggestion = v5->_suggestion;
    v5->_suggestion = (SFSearchSuggestion *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightSuggestion"];
    spotlightSuggestion = v5->_spotlightSuggestion;
    v5->_spotlightSuggestion = (CSSuggestion *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"searchEntities"];
    searchEntities = v5->_searchEntities;
    v5->_searchEntities = (NSArray *)v15;
  }
  return v5;
}

- (int64_t)compareByRank:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SPSearchSuggestionResult *)self spotlightSuggestion];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = [v4 suggestion];

    if (v7)
    {
      int64_t v8 = -1;
      goto LABEL_25;
    }
  }
  uint64_t v9 = [(SPSearchSuggestionResult *)self suggestion];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v11 = [v4 spotlightSuggestion];

    if (v11)
    {
      int64_t v8 = 1;
      goto LABEL_25;
    }
  }
  uint64_t v12 = [(SPSearchSuggestionResult *)self suggestion];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(SPSearchSuggestionResult *)self suggestion];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v4 suggestion], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      v17 = [v4 suggestion];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v19 = [(SPSearchSuggestionResult *)self suggestion];
        double v20 = [v4 suggestion];
        uint64_t v21 = [v19 compare:v20];
LABEL_21:
        int64_t v8 = v21;

        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  uint64_t v22 = [(SPSearchSuggestionResult *)self suggestion];
  if (v22
    && (double v23 = (void *)v22,
        [v4 suggestion],
        int v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    [(SPSearchSuggestionResult *)self rankingScore];
    double v26 = v25;
    [v4 rankingScore];
    if (v26 <= v27) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v28 = [(SPSearchSuggestionResult *)self spotlightSuggestion];
    if (v28)
    {
      uint64_t v29 = (void *)v28;
      v30 = [v4 spotlightSuggestion];

      if (v30)
      {
        double v19 = [(SPSearchSuggestionResult *)self spotlightSuggestion];
        double v20 = [v4 spotlightSuggestion];
        uint64_t v21 = [v19 compareByRank:v20];
        goto LABEL_21;
      }
    }
    uint64_t v31 = [(SFSearchResult_SpotlightExtras *)self score];
    unint64_t v33 = v32;
    uint64_t v34 = [v4 score];
    if (__PAIR128__(v35, v34) < __PAIR128__(v33, v31)) {
      int64_t v8 = -1;
    }
    else {
      int64_t v8 = 1;
    }
  }
LABEL_25:

  return v8;
}

- (id)localSuggestionFeatures
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SPSearchSuggestionResult *)self spotlightSuggestion];

  if (v4)
  {
    uint64_t v5 = [(SPSearchSuggestionResult *)self spotlightSuggestion];
    uint64_t v6 = [v5 features];

    if (localSuggestionFeatures_onceToken == -1)
    {
      if (v6)
      {
LABEL_4:
        id v64 = 0;
        v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:localSuggestionFeatures_sFeatureClasses fromData:v6 error:&v64];
        id v8 = v64;
        if (!v8 && v7)
        {
          [v3 addEntriesFromDictionary:v7];
          uint64_t v9 = [v3 objectForKeyedSubscript:@"score"];
          [v9 doubleValue];
          -[SPSearchSuggestionResult setRankingScore:](self, "setRankingScore:");

          id v8 = 0;
        }
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&localSuggestionFeatures_onceToken, &__block_literal_global_44);
      if (v6) {
        goto LABEL_4;
      }
    }
    id v8 = 0;
    v7 = 0;
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v10 = [(SPSearchSuggestionResult *)self suggestion];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = [(SPSearchSuggestionResult *)self suggestion];
    uint64_t v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "type"));
    [v3 setValue:v13 forKey:@"stype"];

    v14 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v15 = [(SPSearchSuggestionResult *)self suggestion];
    v16 = [v15 suggestion];
    v17 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
    [v3 setValue:v17 forKey:@"sslen"];

    objc_super v18 = (void *)MEMORY[0x1E4F28ED0];
    double v19 = [(SPSearchSuggestionResult *)self suggestion];
    [v19 score];
    double v20 = objc_msgSend(v18, "numberWithDouble:");
    [v3 setValue:v20 forKey:@"sscore"];

    uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v22 = [(SPSearchSuggestionResult *)self suggestion];
    [(id)v22 score];
    double v23 = objc_msgSend(v21, "numberWithDouble:");
    [v3 setValue:v23 forKey:@"score"];

    int v24 = [v3 objectForKeyedSubscript:@"score"];
    [v24 doubleValue];
    -[SPSearchSuggestionResult setRankingScore:](self, "setRankingScore:");

    double v25 = [(SPSearchSuggestionResult *)self suggestion];
    objc_opt_class();
    LOBYTE(v22) = objc_opt_isKindOfClass();

    if (v22)
    {
      double v26 = [(SPSearchSuggestionResult *)self suggestion];
      double v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", objc_msgSend(v26, "queryLen"));
      [v3 setValue:v27 forKey:@"queryLen"];

      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", objc_msgSend(v26, "queryFragmentCount"));
      [v3 setValue:v28 forKey:@"queryFragmentCount"];

      uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v26, "queryCompletionCount"));
      [v3 setValue:v29 forKey:@"queryCompletionCount"];

      v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", objc_msgSend(v26, "fragments"));
      [v3 setValue:v30 forKey:@"fragments"];

      uint64_t v31 = (void *)MEMORY[0x1E4F28ED0];
      [v26 age];
      unint64_t v32 = objc_msgSend(v31, "numberWithDouble:");
      [v3 setValue:v32 forKey:@"age"];

      unint64_t v33 = (void *)MEMORY[0x1E4F28ED0];
      [v26 prob];
      uint64_t v34 = objc_msgSend(v33, "numberWithDouble:");
      [v3 setValue:v34 forKey:@"prob"];

      unint64_t v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v26, "maxscore"));
      [v3 setValue:v35 forKey:@"maxscore"];

      v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v26, "weight"));
      [v3 setValue:v36 forKey:@"weight"];

      v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v26, "parentWeight"));
      [v3 setValue:v37 forKey:@"parentWeight"];

      v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v26, "rootWeight"));
      [v3 setValue:v38 forKey:@"rootWeight"];

      unint64_t v39 = (void *)MEMORY[0x1E4F28ED0];
      [v26 phraseScore];
      v40 = objc_msgSend(v39, "numberWithDouble:");
      [v3 setValue:v40 forKey:@"phraseScore"];

      id v41 = (void *)MEMORY[0x1E4F28ED0];
      [v26 punishment];
      uint64_t v42 = objc_msgSend(v41, "numberWithDouble:");
      [v3 setValue:v42 forKey:@"punishment"];

      objc_super v43 = (void *)MEMORY[0x1E4F28ED0];
      [v26 compositeScore];
      BOOL v45 = v44 == 1.79769313e308;
      double v46 = 0.0;
      if (!v45) {
        objc_msgSend(v26, "compositeScore", 0.0);
      }
      objc_super v47 = [v43 numberWithDouble:v46];
      [v3 setValue:v47 forKey:@"compositeScore"];

      v48 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v26, "completionType"));
      [v3 setValue:v48 forKey:@"completionType"];

      v49 = (void *)MEMORY[0x1E4F28ED0];
      [v26 fieldWeight];
      v50 = objc_msgSend(v49, "numberWithFloat:");
      [v3 setValue:v50 forKey:@"fieldWeight"];

      v51 = (void *)MEMORY[0x1E4F28ED0];
      if ([v26 isSingleThread]) {
        double v52 = 1.0;
      }
      else {
        double v52 = 0.0;
      }
      id v53 = [v51 numberWithDouble:v52];
      [v3 setValue:v53 forKey:@"isSingleThread"];

      v54 = (void *)MEMORY[0x1E4F28ED0];
      if ([v26 hasUsedDate]) {
        double v55 = 1.0;
      }
      else {
        double v55 = 0.0;
      }
      v56 = [v54 numberWithDouble:v55];
      [v3 setValue:v56 forKey:@"hasUsedDate"];

      id v57 = (void *)MEMORY[0x1E4F28ED0];
      if ([v26 isShortcut]) {
        double v58 = 1.0;
      }
      else {
        double v58 = 0.0;
      }
      v59 = [v57 numberWithDouble:v58];
      [v3 setValue:v59 forKey:@"isShortcut"];

      v60 = (void *)MEMORY[0x1E4F28ED0];
      if ([v26 hasMultipleResults]) {
        double v61 = 1.0;
      }
      else {
        double v61 = 0.0;
      }
      v62 = [v60 numberWithDouble:v61];
      [v3 setValue:v62 forKey:@"hasMultipleResults"];
    }
  }
LABEL_27:
  return v3;
}

void __51__SPSearchSuggestionResult_localSuggestionFeatures__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  id v3 = (void *)localSuggestionFeatures_sFeatureClasses;
  localSuggestionFeatures_sFeatureClasses = v2;
}

- (id)suggestionsFeedbackData
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = SSRoundDouble(4, (double)(int)[(SPSearchSuggestionResult *)self type]);
  [v3 setValue:v4 forKey:@"type"];

  uint64_t v5 = [(SPSearchSuggestionResult *)self query];
  uint64_t v6 = SSRoundDouble(4, (double)(unint64_t)[v5 length]);
  [v3 setValue:v6 forKey:@"plen"];

  uint64_t v7 = [(SFSearchResult_SpotlightExtras *)self score];
  id v8 = SSRoundDouble(4, (double)*(unsigned long long *)&v7);
  [v3 setValue:v8 forKey:@"score"];

  uint64_t v9 = [(SPSearchSuggestionResult *)self completion];
  uint64_t v10 = SSRoundDouble(4, (double)(unint64_t)[v9 length]);
  [v3 setValue:v10 forKey:@"slen"];

  id v11 = [(SPSearchSuggestionResult *)self query];
  unint64_t v12 = [v11 length];
  uint64_t v13 = [(SPSearchSuggestionResult *)self completion];
  v14 = SSRoundDouble(4, (double)v12 / ((double)(unint64_t)[v13 length] + 1.0));
  [v3 setValue:v14 forKey:@"ratio"];

  v112 = [(SPSearchSuggestionResult *)self serverFeatures];
  v113 = [(SPSearchSuggestionResult *)self localFeatures];
  if ([v112 count])
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    uint64_t v15 = [(SPSearchSuggestionResult *)self serverFeatures];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v114 objects:v118 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v115 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v114 + 1) + 8 * i);
          double v20 = [(SPSearchSuggestionResult *)self serverFeatures];
          uint64_t v21 = [v20 objectForKeyedSubscript:v19];
          [v21 doubleValue];
          double v23 = SSRoundDouble(4, v22);
          [v3 setValue:v23 forKey:v19];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v114 objects:v118 count:16];
      }
      while (v16);
    }
  }
  else if ([v113 count])
  {
    double v26 = [v113 objectForKeyedSubscript:@"stype"];

    if (v26)
    {
      double v27 = [v113 objectForKeyedSubscript:@"stype"];
      [v27 doubleValue];
      uint64_t v29 = SSRoundDouble(4, v28);
      [v3 setValue:v29 forKey:@"stype"];
    }
    v30 = [v113 objectForKeyedSubscript:@"sslen"];

    if (v30)
    {
      uint64_t v31 = [v113 objectForKeyedSubscript:@"sslen"];
      [v31 doubleValue];
      unint64_t v33 = SSRoundDouble(4, v32);
      [v3 setValue:v33 forKey:@"sslen"];
    }
    uint64_t v34 = [v113 objectForKeyedSubscript:@"sscore"];

    if (v34)
    {
      unint64_t v35 = [v113 objectForKeyedSubscript:@"sscore"];
      [v35 doubleValue];
      v37 = SSRoundDouble(4, v36);
      [v3 setValue:v37 forKey:@"sscore"];
    }
    v38 = [v113 objectForKeyedSubscript:@"queryLen"];

    if (v38)
    {
      unint64_t v39 = [v113 objectForKeyedSubscript:@"queryLen"];
      [v39 doubleValue];
      id v41 = SSRoundDouble(4, v40);
      [v3 setValue:v41 forKey:@"queryLen"];
    }
    uint64_t v42 = [v113 objectForKeyedSubscript:@"queryFragmentCount"];

    if (v42)
    {
      objc_super v43 = [v113 objectForKeyedSubscript:@"queryFragmentCount"];
      [v43 doubleValue];
      BOOL v45 = SSRoundDouble(4, v44);
      [v3 setValue:v45 forKey:@"queryFragmentCount"];
    }
    double v46 = [v113 objectForKeyedSubscript:@"queryCompletionCount"];

    if (v46)
    {
      objc_super v47 = [v113 objectForKeyedSubscript:@"queryCompletionCount"];
      v48 = SSRoundUInt64([v47 unsignedLongValue]);
      [v3 setValue:v48 forKey:@"queryCompletionCount"];
    }
    v49 = [v113 objectForKeyedSubscript:@"fragments"];

    if (v49)
    {
      v50 = [v113 objectForKeyedSubscript:@"fragments"];
      [v50 doubleValue];
      double v52 = SSRoundDouble(4, v51);
      [v3 setValue:v52 forKey:@"fragments"];
    }
    id v53 = [v113 objectForKeyedSubscript:@"age"];

    if (v53)
    {
      v54 = [v113 objectForKeyedSubscript:@"age"];
      [v54 doubleValue];
      v56 = SSRoundDouble(4, v55);
      [v3 setValue:v56 forKey:@"age"];
    }
    id v57 = [v113 objectForKeyedSubscript:@"prob"];

    if (v57)
    {
      double v58 = [v113 objectForKeyedSubscript:@"prob"];
      [v58 doubleValue];
      v60 = SSRoundDouble(2, v59);
      [v3 setValue:v60 forKey:@"prob"];
    }
    double v61 = [v113 objectForKeyedSubscript:@"maxscore"];

    if (v61)
    {
      v62 = [v113 objectForKeyedSubscript:@"maxscore"];
      uint64_t v63 = SSRoundUInt64([v62 unsignedLongValue]);
      [v3 setValue:v63 forKey:@"maxscore"];
    }
    id v64 = [v113 objectForKeyedSubscript:@"weight"];

    if (v64)
    {
      v65 = [v113 objectForKeyedSubscript:@"weight"];
      [v65 doubleValue];
      v67 = SSRoundDouble(4, v66);
      [v3 setValue:v67 forKey:@"weight"];
    }
    v68 = [v113 objectForKeyedSubscript:@"parentWeight"];

    if (v68)
    {
      v69 = [v113 objectForKeyedSubscript:@"parentWeight"];
      [v69 doubleValue];
      v71 = SSRoundDouble(4, v70);
      [v3 setValue:v71 forKey:@"parentWeight"];
    }
    v72 = [v113 objectForKeyedSubscript:@"rootWeight"];

    if (v72)
    {
      v73 = [v113 objectForKeyedSubscript:@"rootWeight"];
      [v73 doubleValue];
      v75 = SSRoundDouble(4, v74);
      [v3 setValue:v75 forKey:@"rootWeight"];
    }
    v76 = [v113 objectForKeyedSubscript:@"phraseScore"];

    if (v76)
    {
      v77 = [v113 objectForKeyedSubscript:@"phraseScore"];
      [v77 doubleValue];
      objc_super v79 = SSRoundDouble(4, v78);
      [v3 setValue:v79 forKey:@"phraseScore"];
    }
    v80 = [v113 objectForKeyedSubscript:@"punishment"];

    if (v80)
    {
      v81 = [v113 objectForKeyedSubscript:@"punishment"];
      [v81 doubleValue];
      v83 = SSRoundDouble(4, v82);
      [v3 setValue:v83 forKey:@"punishment"];
    }
    v84 = [v113 objectForKeyedSubscript:@"compositeScore"];

    if (v84)
    {
      v85 = [v113 objectForKeyedSubscript:@"compositeScore"];
      [v85 doubleValue];
      v87 = SSRoundDouble(4, v86);
      [v3 setValue:v87 forKey:@"compositeScore"];
    }
    v88 = [v113 objectForKeyedSubscript:@"completionType"];

    if (v88)
    {
      v89 = [v113 objectForKeyedSubscript:@"completionType"];
      [v89 doubleValue];
      v91 = SSRoundDouble(4, v90);
      [v3 setValue:v91 forKey:@"completionType"];
    }
    v92 = [v113 objectForKeyedSubscript:@"fieldWeight"];

    if (v92)
    {
      v93 = [v113 objectForKeyedSubscript:@"fieldWeight"];
      [v93 doubleValue];
      v95 = SSRoundDouble(4, v94);
      [v3 setValue:v95 forKey:@"fieldWeight"];
    }
    v96 = [v113 objectForKeyedSubscript:@"isSingleThread"];

    if (v96)
    {
      v97 = [v113 objectForKeyedSubscript:@"isSingleThread"];
      [v97 doubleValue];
      v99 = SSRoundDouble(2, v98);
      [v3 setValue:v99 forKey:@"isSingleThread"];
    }
    v100 = [v113 objectForKeyedSubscript:@"hasUsedDate"];

    if (v100)
    {
      v101 = [v113 objectForKeyedSubscript:@"hasUsedDate"];
      [v101 doubleValue];
      v103 = SSRoundDouble(2, v102);
      [v3 setValue:v103 forKey:@"hasUsedDate"];
    }
    v104 = [v113 objectForKeyedSubscript:@"isShortcut"];

    if (v104)
    {
      v105 = [v113 objectForKeyedSubscript:@"isShortcut"];
      [v105 doubleValue];
      v107 = SSRoundDouble(2, v106);
      [v3 setValue:v107 forKey:@"isShortcut"];
    }
    v108 = [v113 objectForKeyedSubscript:@"hasMultipleResults"];

    if (v108)
    {
      v109 = [v113 objectForKeyedSubscript:@"hasMultipleResults"];
      [v109 doubleValue];
      v111 = SSRoundDouble(2, v110);
      [v3 setValue:v111 forKey:@"hasMultipleResults"];
    }
  }
  int v24 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:2 error:0];

  return v24;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
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

- (NSArray)searchEntities
{
  return self->_searchEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEntities, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end