@interface NSURL(NSSAdditions)
+ (id)nss_MarketingPageURL;
+ (id)nss_NewsURLForArticleID:()NSSAdditions title:;
+ (id)nss_NewsURLForFavoritesPicker;
+ (id)nss_NewsURLForForYou;
+ (id)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions;
+ (id)nss_NewsURLForHistory;
+ (id)nss_NewsURLForIssueID:()NSSAdditions;
+ (id)nss_NewsURLForMagazines;
+ (id)nss_NewsURLForManageNotifications;
+ (id)nss_NewsURLForMyMagazines;
+ (id)nss_NewsURLForMySports;
+ (id)nss_NewsURLForMySportsHighlights;
+ (id)nss_NewsURLForMySportsScores;
+ (id)nss_NewsURLForPuzzle;
+ (id)nss_NewsURLForPuzzleHub;
+ (id)nss_NewsURLForPuzzleID:()NSSAdditions;
+ (id)nss_NewsURLForPuzzleTypeID:()NSSAdditions;
+ (id)nss_NewsURLForSaved;
+ (id)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:;
+ (id)nss_NewsURLForWebLinkURL:()NSSAdditions;
+ (id)nss_NewsURLWithPathComponents:()NSSAdditions queryItems:internal:;
+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions;
+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions internal:targetIsVideo:hardPaywall:;
+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions routeURL:;
+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions targetIsVideo:;
+ (uint64_t)nss_NewsURLForTagID:()NSSAdditions;
+ (uint64_t)nss_NewsURLWithPathComponents:()NSSAdditions internal:;
- (id)_nss_URLByAppendingQueryItem:()NSSAdditions;
- (id)_nss_valueForQueryParameterWithKey:()NSSAdditions;
- (id)nss_URLWithCampaignID:()NSSAdditions;
- (uint64_t)nss_campaignID;
- (uint64_t)nss_hasRefreshParameter;
- (uint64_t)nss_isAudioURL;
- (uint64_t)nss_isNewsURL;
- (uint64_t)nss_isSubscribeURL;
@end

@implementation NSURL(NSSAdditions)

+ (uint64_t)nss_NewsURLForTagID:()NSSAdditions
{
  return objc_msgSend(a1, "nss_NewsURLForTagID:feedConfiguration:", a3, 0);
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions
{
  return objc_msgSend(a1, "nss_NewsURLForArticleID:routeURL:", a3, 0);
}

+ (id)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:
{
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForTagID:feedConfiguration:]();
  }
  if (![v6 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForTagID:feedConfiguration:]();
  }
  if ([v6 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForTagID:feedConfiguration:]();
  }
  v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  switch(a4)
  {
    case 2:
      id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
      v10 = @"backCatalog";
      goto LABEL_16;
    case 4:
      id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
      v10 = @"sportsStandings";
      goto LABEL_16;
    case 5:
      id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
      v10 = @"sportsScores";
      goto LABEL_16;
    case 6:
      id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
      v10 = @"sportsHighlights";
      goto LABEL_16;
    case 7:
      id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
      v10 = @"sportsBracket";
LABEL_16:
      v11 = (void *)[v9 initWithName:@"alternate_feed" value:v10];
      [v8 addObject:v11];

      break;
    case 11:
      [v7 addObject:@"archive"];
      break;
    default:
      break;
  }
  v12 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:queryItems:internal:", v7, v8, 0);

  return v12;
}

+ (id)nss_NewsURLWithPathComponents:()NSSAdditions queryItems:internal:
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  v10 = [v8 array];
  [v10 addObject:@"/"];
  [v10 addObjectsFromArray:v9];

  v11 = [NSString pathWithComponents:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v12 setPath:v11];
  if ([v7 count]) {
    [v12 setQueryItems:v7];
  }
  if (a5) {
    v13 = @"applenews";
  }
  else {
    v13 = @"https";
  }
  if (a5) {
    v14 = &stru_1F3B518D0;
  }
  else {
    v14 = @"apple.news";
  }
  [v12 setScheme:v13];
  [v12 setHost:v14];
  v15 = [v12 URL];

  return v15;
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions routeURL:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "fc_NewsURLForArticleID:routeURL:");
}

- (uint64_t)nss_isNewsURL
{
  v2 = objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", @"open_in");
  int v3 = [v2 isEqualToString:@"app"];

  return objc_msgSend(a1, "fc_isNewsURL") | v3;
}

- (id)_nss_valueForQueryParameterWithKey:()NSSAdditions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 query];
  id v6 = [v5 stringByRemovingPercentEncoding];
  id v7 = [v6 componentsSeparatedByString:@"&"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v14 = [v13 firstObject];
        v15 = [v13 lastObject];
        if ([v14 isEqualToString:v4])
        {
          id v16 = v15;

          v10 = v16;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)nss_isAudioURL
{
  uint64_t result = objc_msgSend(a1, "nss_isNewsURL");
  if (result)
  {
    int v3 = [a1 pathComponents];
    uint64_t v4 = [v3 containsObject:@"nowPlaying"];

    return v4;
  }
  return result;
}

+ (id)nss_NewsURLForWebLinkURL:()NSSAdditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForWebLinkURL:]();
  }
  uint64_t v4 = [v3 scheme];
  if ([v4 isEqualToString:@"http"])
  {
    v5 = [v3 absoluteString];
    id v6 = v5;
    id v7 = @"http";
    uint64_t v8 = @"applenews";
  }
  else
  {
    if (![v4 isEqualToString:@"https"])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported scheme: %@", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_12;
    }
    v5 = [v3 absoluteString];
    id v6 = v5;
    id v7 = @"https";
    uint64_t v8 = @"applenewss";
  }
  uint64_t v9 = objc_msgSend(v5, "fc_stringByReplacingPrefix:withString:", v7, v8);

  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];

    goto LABEL_13;
  }
LABEL_12:
  v10 = 0;
LABEL_13:

  return v10;
}

+ (id)nss_NewsURLForIssueID:()NSSAdditions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForIssueID:]();
  }
  if (![v4 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForIssueID:]();
  }
  if ([v4 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForIssueID:]();
    if (v4) {
      goto LABEL_10;
    }
  }
  else if (v4)
  {
LABEL_10:
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);

    goto LABEL_13;
  }
  id v6 = 0;
LABEL_13:

  return v6;
}

+ (id)nss_NewsURLForPuzzleID:()NSSAdditions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleID:]();
  }
  if (![v4 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleID:]();
  }
  if ([v4 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleID:]();
    if (v4) {
      goto LABEL_10;
    }
  }
  else if (v4)
  {
LABEL_10:
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);

    goto LABEL_13;
  }
  id v6 = 0;
LABEL_13:

  return v6;
}

+ (id)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForFullArchivePuzzleTypeID:]();
  }
  if (![v4 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForFullArchivePuzzleTypeID:]();
  }
  if ([v4 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForFullArchivePuzzleTypeID:]();
    if (v4) {
      goto LABEL_10;
    }
  }
  else if (v4)
  {
LABEL_10:
    v8[0] = v4;
    v8[1] = @"archive";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    id v6 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);

    goto LABEL_13;
  }
  id v6 = 0;
LABEL_13:

  return v6;
}

+ (id)nss_NewsURLForPuzzleTypeID:()NSSAdditions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleTypeID:]();
  }
  if (![v4 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleTypeID:]();
  }
  if ([v4 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleTypeID:]();
    if (v4) {
      goto LABEL_10;
    }
  }
  else if (v4)
  {
LABEL_10:
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);

    goto LABEL_13;
  }
  id v6 = 0;
LABEL_13:

  return v6;
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions targetIsVideo:
{
  return objc_msgSend(a1, "nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", a3, 0, a4, 0);
}

+ (id)nss_NewsURLForArticleID:()NSSAdditions title:
{
  id v6 = a4;
  id v7 = objc_msgSend(a1, "nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", a3, 0, 0, 0);
  [v7 _setTitle:v6];

  return v7;
}

- (uint64_t)nss_hasRefreshParameter
{
  uint64_t result = objc_msgSend(a1, "nss_isNewsURL");
  if (result)
  {
    id v3 = objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", @"r");
    uint64_t v4 = [v3 isEqualToString:@"1"];

    return v4;
  }
  return result;
}

- (uint64_t)nss_isSubscribeURL
{
  v1 = objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", @"subscribe");
  uint64_t v2 = [v1 isEqualToString:@"1"];

  return v2;
}

+ (id)nss_NewsURLForForYou
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"foryou";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForMagazines
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"magazines";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForMyMagazines
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"mymagazines";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForPuzzleHub
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"puzzles";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForMySports
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"mysports";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForMySportsScores
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"myscores";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForMySportsHighlights
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"mysportshighlights";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForSaved
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"saved";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForHistory
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"history";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForFavoritesPicker
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"favoritespicker";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForManageNotifications
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"notifications";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

+ (id)nss_NewsURLForPuzzle
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"puzzle";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v3 = objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);

  return v3;
}

- (id)nss_URLWithCampaignID:()NSSAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSURL(NSSAdditions) nss_URLWithCampaignID:]();
  }
  v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"campaign_id" value:v4];
  id v6 = objc_msgSend(a1, "_nss_URLByAppendingQueryItem:", v5);

  return v6;
}

- (uint64_t)nss_campaignID
{
  return objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", @"campaign_id");
}

- (id)_nss_URLByAppendingQueryItem:()NSSAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSURL(NSSAdditions) _nss_URLByAppendingQueryItem:]();
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:1];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [v5 queryItems];
  uint64_t v8 = [v6 arrayWithArray:v7];

  [v8 addObject:v4];
  [v5 setQueryItems:v8];
  uint64_t v9 = [v5 URL];

  return v9;
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions internal:targetIsVideo:hardPaywall:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:");
}

+ (uint64_t)nss_NewsURLWithPathComponents:()NSSAdditions internal:
{
  return objc_msgSend(a1, "nss_NewsURLWithPathComponents:queryItems:internal:", a3, MEMORY[0x1E4F1CBF0], a4);
}

+ (id)nss_MarketingPageURL
{
  v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  v1 = [v0 objectForKey:*MEMORY[0x1E4F1C400]];
  uint64_t v2 = [v1 lowercaseString];

  id v3 = [&unk_1F3B54410 objectForKeyedSubscript:v2];

  if (v3)
  {
    id v4 = NSString;
    v5 = [&unk_1F3B54410 objectForKeyedSubscript:v2];
    id v6 = [v4 stringWithFormat:@"https://www.apple.com/%@/news", v5];
  }
  else
  {
    id v6 = @"https://www.apple.com/news";
  }
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  return v7;
}

+ (void)nss_NewsURLForWebLinkURL:()NSSAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"webLinkURL != nil", v6, 2u);
}

+ (void)nss_NewsURLForIssueID:()NSSAdditions .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"issue IDs with slashes won't be handled properly"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

+ (void)nss_NewsURLForIssueID:()NSSAdditions .cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"issueID.length != 0", v6, 2u);
}

+ (void)nss_NewsURLForIssueID:()NSSAdditions .cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"issueID != nil", v6, 2u);
}

+ (void)nss_NewsURLForPuzzleID:()NSSAdditions .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"puzzle IDs with slashes won't be handled properly"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

+ (void)nss_NewsURLForPuzzleID:()NSSAdditions .cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleID.length != 0", v6, 2u);
}

+ (void)nss_NewsURLForPuzzleID:()NSSAdditions .cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleID != nil", v6, 2u);
}

+ (void)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"puzzle type IDs with slashes won't be handled properly"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

+ (void)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions .cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID.length != 0", v6, 2u);
}

+ (void)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions .cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID != nil", v6, 2u);
}

+ (void)nss_NewsURLForPuzzleTypeID:()NSSAdditions .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"puzzle type IDs with slashes won't be handled properly"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

+ (void)nss_NewsURLForPuzzleTypeID:()NSSAdditions .cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID.length != 0", v6, 2u);
}

+ (void)nss_NewsURLForPuzzleTypeID:()NSSAdditions .cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID != nil", v6, 2u);
}

+ (void)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"tag IDs with slashes won't be handled properly"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

+ (void)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID.length != 0", v6, 2u);
}

+ (void)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID != nil", v6, 2u);
}

- (void)nss_URLWithCampaignID:()NSSAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"campaignID", v6, 2u);
}

- (void)_nss_URLByAppendingQueryItem:()NSSAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryItem", v6, 2u);
}

@end