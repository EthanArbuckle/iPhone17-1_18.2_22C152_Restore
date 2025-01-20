@interface NSURL(FCAdditions)
+ (id)fc_NewsURLForArticleID:()FCAdditions internal:targetIsVideo:hardPaywall:;
+ (id)fc_NewsURLForArticleID:()FCAdditions routeURL:;
+ (id)fc_NewsURLForTagID:()FCAdditions;
+ (id)fc_NewsURLWithPathComponents:()FCAdditions queryItems:internal:;
+ (id)fc_safeURLWithString:()FCAdditions;
+ (uint64_t)fc_NewsURLForArticleID:()FCAdditions hardPaywall:;
+ (uint64_t)fc_NewsURLWithPathComponents:()FCAdditions;
+ (uint64_t)fc_NewsURLWithPathComponents:()FCAdditions internal:;
- (BOOL)_isFeldsparOldArticleURL;
- (BOOL)_isFeldsparOldChannelURL;
- (BOOL)_isFeldsparOldTopicURL;
- (id)fc_NewsArticleID;
- (id)fc_NewsArticleIDs;
- (id)fc_NewsIssueID;
- (id)fc_URLByAddingQueryItem:()FCAdditions;
- (id)fc_URLByDeletingFragment;
- (id)fc_URLByDeletingQuery;
- (id)fc_URLWithVideoTarget:()FCAdditions;
- (id)fc_feldsparTagID;
- (id)fc_valueForQueryItemWithName:()FCAdditions;
- (uint64_t)fc_directoryExists;
- (uint64_t)fc_fileSystemFreeSize;
- (uint64_t)fc_hasValidArticleComponents;
- (uint64_t)fc_isEqualToURL:()FCAdditions;
- (uint64_t)fc_isFeldsparInterstitialPreviewURL;
- (uint64_t)fc_isGzippedWithMIMETypeHint:()FCAdditions;
- (uint64_t)fc_isHTTPScheme;
- (uint64_t)fc_isHardPaywallNewsArticleURL:()FCAdditions;
- (uint64_t)fc_isNewsArticleURL;
- (uint64_t)fc_isNewsArticleVideoURL;
- (uint64_t)fc_isNewsIssueURL;
- (uint64_t)fc_isNewsPuzzleTypeURL;
- (uint64_t)fc_isNewsPuzzleURL;
- (uint64_t)fc_isNewsSportsEventURL;
- (uint64_t)fc_isNewsTagURL;
- (uint64_t)fc_isNewsURL;
- (uint64_t)fc_isStocksURL;
- (uint64_t)fc_isStoreURL;
- (uint64_t)fc_isWebArchiveURL;
- (uint64_t)fc_isWebOptInURL;
- (uint64_t)fc_volumeAvailableCapacityForOpportunisticUsage;
- (uint64_t)getUInt16XAttrWithName:()FCAdditions;
- (uint64_t)setUInt16XAttr:()FCAdditions withName:;
@end

@implementation NSURL(FCAdditions)

+ (id)fc_safeURLWithString:()FCAdditions
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)fc_NewsURLForArticleID:()FCAdditions routeURL:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v28 = objc_msgSend(a1, "fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", v6, 0, 0, 0);
    goto LABEL_32;
  }
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v51 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:routeURL:]";
    __int16 v52 = 2080;
    v53 = "NSURL+FCAdditions.m";
    __int16 v54 = 1024;
    int v55 = 383;
    __int16 v56 = 2114;
    v57 = v38;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (![v6 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID.length != 0");
    *(_DWORD *)buf = 136315906;
    v51 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:routeURL:]";
    __int16 v52 = 2080;
    v53 = "NSURL+FCAdditions.m";
    __int16 v54 = 1024;
    int v55 = 384;
    __int16 v56 = 2114;
    v57 = v39;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if ([v6 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)[[NSString alloc] initWithFormat:@"article IDs with slashes won't be handled properly"];
    *(_DWORD *)buf = 136315906;
    v51 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:routeURL:]";
    __int16 v52 = 2080;
    v53 = "NSURL+FCAdditions.m";
    __int16 v54 = 1024;
    int v55 = 385;
    __int16 v56 = 2114;
    v57 = v36;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_11;
    }
LABEL_31:
    v28 = 0;
    goto LABEL_32;
  }
  if (!v6) {
    goto LABEL_31;
  }
LABEL_11:
  id v43 = v6;
  id v49 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v40 = objc_msgSend(a1, "fc_NewsURLWithPathComponents:", v8);

  id v42 = v7;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v7 resolvingAgainstBaseURL:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v41 = v9;
  v11 = [v9 fragment];
  [v10 setQuery:v11];

  uint64_t v12 = [v10 queryItems];
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    v14 = (void *)v12;
  }
  id v15 = v14;

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v23 = [v22 name];
        char v24 = [v23 isEqualToString:@"nff_cid"];

        if ((v24 & 1) == 0) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v19);
  }

  [v10 setQueryItems:v16];
  v25 = [v10 query];
  if ([v25 length])
  {
    v26 = [v10 query];
    v27 = v41;
    [v41 setFragment:v26];
  }
  else
  {
    v27 = v41;
    [v41 setFragment:0];
  }
  id v7 = v42;
  id v6 = v43;

  uint64_t v29 = [v27 URL];
  v30 = (void *)v29;
  if (v29) {
    v31 = (void *)v29;
  }
  else {
    v31 = v42;
  }
  id v32 = v31;

  v33 = [v32 dataRepresentation];

  v34 = [v33 base64EncodedStringWithOptions:0];

  v35 = [MEMORY[0x1E4F290C8] queryItemWithName:@"route" value:v34];
  v28 = objc_msgSend(v40, "fc_URLByAddingQueryItem:", v35);

LABEL_32:
  return v28;
}

+ (id)fc_NewsURLForArticleID:()FCAdditions internal:targetIsVideo:hardPaywall:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:]";
    __int16 v24 = 2080;
    v25 = "NSURL+FCAdditions.m";
    __int16 v26 = 1024;
    int v27 = 422;
    __int16 v28 = 2114;
    uint64_t v29 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (![v10 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID.length != 0");
    *(_DWORD *)buf = 136315906;
    v23 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:]";
    __int16 v24 = 2080;
    v25 = "NSURL+FCAdditions.m";
    __int16 v26 = 1024;
    int v27 = 423;
    __int16 v28 = 2114;
    uint64_t v29 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if ([v10 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v17 = (void *)[[NSString alloc] initWithFormat:@"article IDs with slashes won't be handled properly"];
    *(_DWORD *)buf = 136315906;
    v23 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:]";
    __int16 v24 = 2080;
    v25 = "NSURL+FCAdditions.m";
    __int16 v26 = 1024;
    int v27 = 425;
    __int16 v28 = 2114;
    uint64_t v29 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_10;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (!v10) {
    goto LABEL_17;
  }
LABEL_10:
  if (a6)
  {
    objc_msgSend(NSString, "fc_hardPaywallArticleIDWithArticleID:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v10;
  }
  uint64_t v12 = v11;
  id v21 = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v14 = objc_msgSend(a1, "fc_NewsURLWithPathComponents:internal:", v13, a4);

  if (a5)
  {
    id v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"v" value:@"1"];
    uint64_t v16 = objc_msgSend(v14, "fc_URLByAddingQueryItem:", v15);

    v14 = (void *)v16;
  }

LABEL_18:
  return v14;
}

+ (id)fc_NewsURLWithPathComponents:()FCAdditions queryItems:internal:
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = [v8 array];
  [v10 addObject:@"/"];
  [v10 addObjectsFromArray:v9];

  id v11 = [NSString pathWithComponents:v10];
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
    v14 = &stru_1EF8299B8;
  }
  else {
    v14 = @"apple.news";
  }
  [v12 setScheme:v13];
  [v12 setHost:v14];
  id v15 = [v12 URL];

  return v15;
}

+ (uint64_t)fc_NewsURLWithPathComponents:()FCAdditions internal:
{
  return objc_msgSend(a1, "fc_NewsURLWithPathComponents:queryItems:internal:", a3, MEMORY[0x1E4F1CBF0], a4);
}

- (uint64_t)fc_directoryExists
{
  char v6 = 0;
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [a1 path];
  uint64_t v4 = [v2 fileExistsAtPath:v3 isDirectory:&v6];

  return v4;
}

- (uint64_t)fc_isNewsURL
{
  v2 = [a1 scheme];
  uint64_t v3 = [a1 host];
  if (v2)
  {
    if ([v2 isEqualToString:@"applenews"]) {
      int v4 = 1;
    }
    else {
      int v4 = [v2 isEqualToString:@"applenewss"];
    }
    if (([v2 isEqualToString:@"http"] & 1) != 0
      || (int v6 = [v2 isEqualToString:@"https"]) != 0)
    {
      if (([v3 isEqualToString:@"news.apple.com"] & 1) != 0
        || ([v3 isEqualToString:@"apple.news"] & 1) != 0)
      {
        int v6 = 1;
      }
      else
      {
        int v6 = [v3 isEqualToString:@"one.apple.com"];
      }
    }
    uint64_t v5 = v4 | v6;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)fc_isWebOptInURL
{
  uint64_t result = objc_msgSend(a1, "fc_isNewsURL");
  if (result)
  {
    uint64_t v3 = [a1 path];
    uint64_t v4 = [v3 containsString:@"weboptin"];

    return v4;
  }
  return result;
}

- (uint64_t)fc_hasValidArticleComponents
{
  v2 = [a1 lastPathComponent];
  uint64_t v3 = [v2 lowercaseString];
  int v4 = [v3 isEqualToString:@"articles"];

  uint64_t v5 = [a1 pathComponents];
  if ([v5 count] == 2)
  {
    int v6 = objc_msgSend(v2, "fc_isValidArticleID");

    if (((v6 ^ 1 | v4) & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  if (([a1 _isFeldsparOldArticleURL] & 1) == 0)
  {
    uint64_t v7 = objc_msgSend(a1, "fc_isHardPaywallNewsArticleURL:", 0);
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

- (uint64_t)fc_isNewsArticleURL
{
  uint64_t result = objc_msgSend(a1, "fc_isNewsURL");
  if (result)
  {
    return objc_msgSend(a1, "fc_hasValidArticleComponents");
  }
  return result;
}

- (uint64_t)fc_isNewsArticleVideoURL
{
  uint64_t result = objc_msgSend(a1, "fc_isNewsArticleURL");
  if (result)
  {
    uint64_t v3 = objc_msgSend(a1, "fc_valueForQueryItemWithName:", @"v");
    uint64_t v4 = [v3 isEqualToString:@"1"];

    return v4;
  }
  return result;
}

- (id)fc_URLWithVideoTarget:()FCAdditions
{
  id v4 = a1;
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"v" value:@"1"];
    uint64_t v6 = objc_msgSend(v4, "fc_URLByAddingQueryItem:", v5);

    id v4 = (id)v6;
  }
  return v4;
}

- (uint64_t)fc_isNewsIssueURL
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  v2 = [a1 lastPathComponent];
  uint64_t v3 = [a1 pathComponents];
  if ([v3 count] == 2) {
    uint64_t v4 = objc_msgSend(v2, "fc_isValidIssueID");
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)fc_isHardPaywallNewsArticleURL:()FCAdditions
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  uint64_t v5 = [a1 lastPathComponent];
  id v6 = [a1 pathComponents];
  uint64_t v7 = [v6 count];
  BOOL v8 = v7 == 2;
  if (v7 == 2)
  {
    uint64_t v9 = objc_msgSend(v5, "fc_isValidHardPaywallArticleID");

    if (!a3 || !v9) {
      goto LABEL_8;
    }
    id v6 = v5;
    if ((unint64_t)[v6 length] >= 2)
    {
      id v10 = [v6 substringFromIndex:1];
      id v11 = objc_msgSend(v10, "nf_stringByReversingString");

      id v12 = [NSString stringWithFormat:@"A%@", v11];
      *a3 = v12;
    }
  }

  uint64_t v9 = v8;
LABEL_8:

  return v9;
}

- (id)fc_NewsArticleID
{
  v2 = [a1 path];
  uint64_t v3 = [v2 lastPathComponent];

  if (objc_msgSend(v3, "fc_isValidArticleID"))
  {
    id v4 = v3;
  }
  else
  {
    id v9 = 0;
    int v5 = objc_msgSend(a1, "fc_isHardPaywallNewsArticleURL:", &v9);
    id v6 = v9;
    uint64_t v7 = v6;
    id v4 = 0;
    if (v5 && v6) {
      id v4 = v6;
    }
  }
  return v4;
}

- (id)fc_NewsArticleIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  [v1 queryItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v8 = objc_msgSend(v7, "name", (void)v13);
        char v9 = [v8 isEqualToString:@"articleList"];

        if (v9)
        {
          id v11 = [v7 value];
          id v10 = [v11 componentsSeparatedByString:@","];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)fc_NewsIssueID
{
  v1 = [a1 path];
  id v2 = [v1 lastPathComponent];

  if (objc_msgSend(v2, "fc_isValidIssueID")) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)fc_isStocksURL
{
  id v2 = [a1 scheme];
  id v3 = [a1 host];
  if (v2)
  {
    int v4 = [v2 isEqualToString:@"stocks"];
    if (([v2 isEqualToString:@"http"] & 1) != 0
      || (unsigned int v5 = [v2 isEqualToString:@"https"]) != 0)
    {
      unsigned int v5 = [v3 isEqualToString:@"stocks.apple.com"];
    }
    uint64_t v6 = v4 | v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_isFeldsparOldArticleURL
{
  id v2 = [a1 pathComponents];
  uint64_t v3 = [v2 count];

  int v4 = [a1 path];
  BOOL v5 = 0;
  if ([v4 length] && v3 == 3) {
    BOOL v5 = [v4 rangeOfString:@"articles" options:1] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (uint64_t)fc_isFeldsparInterstitialPreviewURL
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  id v2 = [a1 pathComponents];
  if ([v2 count] == 2)
  {
    uint64_t v3 = [a1 path];
    int v4 = [v3 lastPathComponent];
    uint64_t v5 = [v4 isEqualToString:@"interstitial-preview"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)fc_isNewsTagURL
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  id v2 = [a1 lastPathComponent];
  uint64_t v3 = [v2 lowercaseString];
  int v4 = [v3 isEqualToString:@"topics"];

  uint64_t v5 = [v2 lowercaseString];
  int v6 = [v5 isEqualToString:@"channels"];

  int v7 = objc_msgSend(v2, "fc_isValidTagID");
  BOOL v8 = [a1 pathComponents];
  if ([v8 count] == 2) {
    int v9 = v7;
  }
  else {
    int v9 = 0;
  }
  int v10 = v9 & ((v4 | v6) ^ 1);

  if (v7)
  {
    if ([a1 _isFeldsparOldChannelURL]) {
      int v11 = 1;
    }
    else {
      int v11 = [a1 _isFeldsparOldTopicURL];
    }
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v12 = v10 | v11;

  return v12;
}

- (uint64_t)fc_isNewsSportsEventURL
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  id v2 = [a1 lastPathComponent];
  unsigned int v3 = objc_msgSend(v2, "fc_isValidSportsEventID");
  int v4 = [a1 pathComponents];
  if ([v4 count] == 2) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)fc_isNewsPuzzleURL
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  id v2 = [a1 lastPathComponent];
  unsigned int v3 = objc_msgSend(v2, "fc_isValidPuzzleID");
  int v4 = [a1 pathComponents];
  if ([v4 count] == 2) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)fc_isNewsPuzzleTypeURL
{
  if (!objc_msgSend(a1, "fc_isNewsURL")) {
    return 0;
  }
  id v2 = [a1 lastPathComponent];
  unsigned int v3 = objc_msgSend(v2, "fc_isValidPuzzleTypeID");
  int v4 = [a1 pathComponents];
  if ([v4 count] == 2) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (uint64_t)fc_NewsURLWithPathComponents:()FCAdditions
{
  return objc_msgSend(a1, "fc_NewsURLWithPathComponents:internal:", a3, 0);
}

+ (uint64_t)fc_NewsURLForArticleID:()FCAdditions hardPaywall:
{
  return objc_msgSend(a1, "fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", a3, 0, 0, a4);
}

+ (id)fc_NewsURLForTagID:()FCAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "+[NSURL(FCAdditions) fc_NewsURLForTagID:]";
    __int16 v13 = 2080;
    long long v14 = "NSURL+FCAdditions.m";
    __int16 v15 = 1024;
    int v16 = 447;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (![v4 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID.length != 0");
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "+[NSURL(FCAdditions) fc_NewsURLForTagID:]";
    __int16 v13 = 2080;
    long long v14 = "NSURL+FCAdditions.m";
    __int16 v15 = 1024;
    int v16 = 448;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v10 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  int v6 = objc_msgSend(a1, "fc_NewsURLWithPathComponents:", v5);

  return v6;
}

- (id)fc_feldsparTagID
{
  v1 = [a1 path];
  id v2 = [v1 lastPathComponent];

  if (objc_msgSend(v2, "fc_isValidTagID")) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)fc_isEqualToURL:()FCAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 absoluteURL];
  int v6 = [v4 absoluteURL];
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = 1;
  }
  else if ([a1 isFileURL] && objc_msgSend(v4, "isFileURL"))
  {
    BOOL v8 = [a1 path];
    int v9 = [v4 path];
    uint64_t v7 = [v8 isEqual:v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_isFeldsparOldTopicURL
{
  id v2 = [a1 pathComponents];
  uint64_t v3 = [v2 count];

  id v4 = [a1 path];
  BOOL v5 = 0;
  if ([v4 length] && v3 == 3) {
    BOOL v5 = [v4 rangeOfString:@"topics" options:1] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)_isFeldsparOldChannelURL
{
  id v2 = [a1 pathComponents];
  uint64_t v3 = [v2 count];

  id v4 = [a1 path];
  BOOL v5 = 0;
  if ([v4 length] && v3 == 3) {
    BOOL v5 = [v4 rangeOfString:@"channels" options:1] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (uint64_t)fc_isWebArchiveURL
{
  id v2 = [a1 scheme];
  uint64_t v3 = [a1 pathExtension];
  if ([v2 isEqualToString:@"file"]) {
    uint64_t v4 = [v3 isEqualToString:@"webarchive"];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)fc_isHTTPScheme
{
  id v2 = [a1 scheme];
  if (([v2 isEqualToString:@"http"] & 1) != 0
    || ([v2 isEqualToString:@"https"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = objc_msgSend(a1, "fc_isWebArchiveURL");
  }

  return v3;
}

- (uint64_t)fc_isStoreURL
{
  id v2 = [a1 scheme];
  if ([v2 hasPrefix:@"itms"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [a1 host];
    if ([v4 isEqualToString:@"itunes.apple.com"])
    {
      uint64_t v3 = 1;
    }
    else
    {
      BOOL v5 = [a1 host];
      if ([v5 isEqualToString:@"buy.itunes.apple.com"])
      {
        uint64_t v3 = 1;
      }
      else
      {
        int v6 = [a1 host];
        uint64_t v3 = [v6 isEqualToString:@"storepreview.apple.com"];
      }
    }
  }
  return v3;
}

- (id)fc_URLByDeletingQuery
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  [v1 setQuery:0];
  id v2 = [v1 URL];

  return v2;
}

- (id)fc_URLByDeletingFragment
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  [v1 setFragment:0];
  id v2 = [v1 URL];

  return v2;
}

- (id)fc_URLByAddingQueryItem:()FCAdditions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  int v6 = [v4 componentsWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v7 = [v6 queryItems];
  if (v7)
  {
    BOOL v8 = [v6 queryItems];
    int v9 = (void *)[v8 mutableCopy];
  }
  else
  {
    int v9 = [MEMORY[0x1E4F1CA48] array];
  }

  [v9 addObject:v5];
  [v6 setQueryItems:v9];
  id v10 = [v6 URL];
  int v11 = v10;
  if (!v10) {
    id v10 = a1;
  }
  id v12 = v10;

  return v12;
}

- (id)fc_valueForQueryItemWithName:()FCAdditions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 query];
  int v6 = [v5 stringByRemovingPercentEncoding];
  uint64_t v7 = [v6 componentsSeparatedByString:@"&"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) componentsSeparatedByString:@"="];
        long long v14 = [v13 firstObject];
        __int16 v15 = [v13 lastObject];
        if ([v14 isEqualToString:v4])
        {
          id v16 = v15;

          id v10 = v16;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (uint64_t)fc_isGzippedWithMIMETypeHint:()FCAdditions
{
  id v4 = a3;
  if (FCMIMETypeIsGZip(v4))
  {
    uint64_t v5 = 1;
  }
  else if (v4 && !FCMIMETypeIsBinary(v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    int v6 = (void *)MEMORY[0x1E4F28CB0];
    uint64_t v7 = [a1 path];
    uint64_t v8 = [v6 fileHandleForReadingAtPath:v7];

    uint64_t v9 = [v8 readDataOfLength:2];
    [v8 closeFile];
    uint64_t v5 = objc_msgSend(v9, "fc_isGzipped");
  }
  return v5;
}

- (uint64_t)fc_fileSystemFreeSize
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [a1 path];
  id v13 = 0;
  id v4 = [v2 attributesOfFileSystemForPath:v3 error:&v13];
  id v5 = v13;

  if (v4)
  {
    int v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v6 longLongValue];
    }
    else
    {
      uint64_t v9 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "failed to lookup file system free size with unknown error", buf, 2u);
      }
      uint64_t v7 = 0;
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__NSURL_FCAdditions__fc_fileSystemFreeSize__block_invoke;
    v11[3] = &unk_1E5B53FE0;
    id v12 = v5;
    __43__NSURL_FCAdditions__fc_fileSystemFreeSize__block_invoke((uint64_t)v11);
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = v12;
  }

  return v8;
}

- (uint64_t)fc_volumeAvailableCapacityForOpportunisticUsage
{
  long long v14 = 0;
  uint64_t v1 = *MEMORY[0x1E4F1C808];
  id v13 = 0;
  char v2 = [a1 getResourceValue:&v14 forKey:v1 error:&v13];
  uint64_t v3 = v14;
  id v4 = v13;
  id v5 = v4;
  if ((v2 & 1) == 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__NSURL_FCAdditions__fc_volumeAvailableCapacityForOpportunisticUsage__block_invoke;
    v11[3] = &unk_1E5B53FE0;
    id v12 = v4;
    id v8 = v3;
    __69__NSURL_FCAdditions__fc_volumeAvailableCapacityForOpportunisticUsage__block_invoke((uint64_t)v11);

LABEL_7:
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  id v6 = v3;
  if (![v6 longLongValue])
  {
    uint64_t v9 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "failed to lookup volume available capacity for opportunistic usage with unknown error", buf, 2u);
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v6 longLongValue];
LABEL_8:

  return v7;
}

- (uint64_t)getUInt16XAttrWithName:()FCAdditions
{
  unsigned __int16 value = 0;
  id v4 = a1;
  id v5 = a3;
  id v6 = (const char *)[v4 fileSystemRepresentation];
  id v7 = v5;
  id v8 = (const char *)[v7 cString];

  getxattr(v6, v8, &value, 2uLL, 0, 0);
  return value;
}

- (uint64_t)setUInt16XAttr:()FCAdditions withName:
{
  __int16 value = a3;
  id v5 = a1;
  id v6 = a4;
  id v7 = (const char *)[v5 fileSystemRepresentation];
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 cString];

  return setxattr(v7, v9, &value, 2uLL, 0, 0);
}

@end