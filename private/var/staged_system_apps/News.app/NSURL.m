@interface NSURL
+ (BOOL)fr_canHandleNavigationAction:(id)a3;
+ (id)_urlForTagID:(id)a3 internal:(BOOL)a4;
+ (id)fr_NewsInternalURLForTagID:(id)a3;
+ (id)fr_NewsURLForNotificationsWithTagID:(id)a3;
+ (id)fr_NewsURLForTagID:(id)a3 title:(id)a4;
+ (id)fr_createArticleLinkWithArticleID:(id)a3 url:(id)a4;
+ (id)fr_sanitizedURLForWebView:(id)a3 navigationAction:(id)a4;
- (BOOL)_caseInsensitiveCompareWithFirstPathComponent:(id)a3;
- (BOOL)fr_handleExternalURLWithPrompt;
- (BOOL)fr_isBundleSubcriptionURL;
- (BOOL)fr_isFeldsparFavoritesPickerURL;
- (BOOL)fr_isFeldsparFollowingURL;
- (BOOL)fr_isFeldsparForYouURL;
- (BOOL)fr_isFeldsparHistoryURL;
- (BOOL)fr_isFeldsparOpenInNewsErrorURL;
- (BOOL)fr_isFeldsparReferableURL;
- (BOOL)fr_isFeldsparSavedURL;
- (BOOL)fr_isFeldsparSpotlightURL;
- (BOOL)fr_isFeldsparTabURL;
- (BOOL)fr_isFromSafariSearchWithSourceApplication:(id)a3;
- (BOOL)fr_isHTTPScheme;
- (BOOL)fr_isOpenedFromExploreTab;
- (BOOL)fr_isPreviewURL;
- (BOOL)fr_isStoreURL;
- (BOOL)fr_isSubcriptionURL;
- (BOOL)fr_isSubscriptionURLForWebOptIn;
- (BOOL)fr_isUserSegmentationURL;
- (BOOL)fr_isWebArchiveURL;
- (BOOL)fr_isiAdOriginatedURL;
- (id)_fr_representationWithScheme:(id)a3;
- (id)fr_accessTokenFromAuthenticationCallback;
- (id)fr_campaignType;
- (id)fr_creativeID;
- (id)fr_deepLinkURL;
- (id)fr_httpRepresentation;
- (id)fr_httpsRepresentation;
- (id)fr_iAdPreviewId;
- (id)fr_notificationsURLTagID;
- (id)fr_podcastRepresentation;
- (id)fr_storeURLRepresentation;
- (id)fr_subscriptionURLTagID;
- (id)fr_userActionDate;
- (id)fr_valueForQueryItemWithName:(id)a3;
- (id)fr_widgetEngagementFileURL;
- (id)fr_widgetModeGroupID;
- (id)fr_widgetReferralItemWithQueryItemName:(id)a3;
- (int64_t)_articleOpenedFromQueryValue:(id)a3;
- (int64_t)fr_articleOpenedFrom;
- (int64_t)fr_iAdPreviewLimit;
- (void)fr_feldsparArticleIDWithAssetManager:(id)a3 completion:(id)a4;
- (void)fr_getOverrideSegmentSetIDs:(id *)a3 additionalSegmentSetIDs:(id *)a4 disableABTesting:(BOOL *)a5;
- (void)fr_getPreviewChannelIdentifier:(id *)a3 articleIdentifier:(id *)a4;
- (void)fr_openedFromEditorialArticleURLQueryParametersWithCompletion:(id)a3;
- (void)fr_subscriptionURLQueryParametersWithCompletion:(id)a3;
@end

@implementation NSURL

- (id)_fr_representationWithScheme:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSURLComponents) initWithURL:self resolvingAgainstBaseURL:1];
  [v5 setScheme:v4];

  v6 = [v5 URL];

  return v6;
}

- (id)fr_httpRepresentation
{
  return [(NSURL *)self _fr_representationWithScheme:NSSHTTPURLScheme];
}

- (id)fr_httpsRepresentation
{
  return [(NSURL *)self _fr_representationWithScheme:NSSHTTPSURLScheme];
}

- (id)fr_podcastRepresentation
{
  return [(NSURL *)self _fr_representationWithScheme:@"podcast"];
}

- (void)fr_feldsparArticleIDWithAssetManager:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void *, void *, uint64_t))a4;
  id v60 = 0;
  LOBYTE(a4) = [(NSURL *)self fc_isHardPaywallNewsArticleURL:&v60];
  id v8 = v60;
  if ((a4 & 1) == 0)
  {
    uint64_t v9 = [(NSURL *)self fc_NewsArticleID];

    id v8 = (id)v9;
  }
  v10 = [(NSURL *)self query];
  v11 = [v10 componentsSeparatedByString:@"&"];

  v12 = +[NSMutableDictionary dictionary];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (!v14)
  {

    v15 = 0;
    v28 = 0;
    v30 = 0;
    v33 = 0;
LABEL_36:
    uint64_t v41 = 1;
    if (!v7) {
      goto LABEL_38;
    }
LABEL_37:
    v7[2](v7, v8, v33, v12, v41);
    goto LABEL_38;
  }
  v42 = self;
  id v43 = v8;
  id v45 = v6;
  v46 = v12;
  v49 = 0;
  id obj = v13;
  v44 = v7;
  v15 = 0;
  v51 = 0;
  uint64_t v16 = *(void *)v57;
  uint64_t v17 = FCArticleListPathComponent;
  uint64_t v48 = FCWidgetArticleListReferralItemQueryItemName;
  uint64_t v47 = NSSOpenedFromPathComponent;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v57 != v16) {
        objc_enumerationMutation(obj);
      }
      v19 = [*(id *)(*((void *)&v56 + 1) + 8 * i) componentsSeparatedByString:@"="];
      v20 = [v19 firstObject];
      v21 = [v20 stringByRemovingPercentEncoding];

      v22 = [v19 lastObject];
      v23 = [v22 stringByRemovingPercentEncoding];

      if ([v21 isEqualToString:v17])
      {
        v24 = v51;
        v51 = v23;
      }
      else if ([v21 isEqualToString:v48])
      {
        v24 = v49;
        v49 = v23;
      }
      else
      {
        unsigned int v25 = [v21 isEqualToString:v47];
        v26 = v15;
        v24 = v15;
        v15 = v23;
        if (!v25) {
          goto LABEL_14;
        }
      }
      id v27 = v23;

      v26 = v15;
LABEL_14:
      v15 = v26;
    }
    id v14 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  }
  while (v14);
  id v13 = obj;

  v28 = v49;
  if (!v49)
  {
    v12 = v46;
    id v8 = v43;
    v30 = v51;
    if (!v15)
    {
      uint64_t v41 = 1;
      goto LABEL_34;
    }
    id v29 = [(NSURL *)v42 _articleOpenedFromQueryValue:v15];
LABEL_31:
    uint64_t v41 = (uint64_t)v29;
LABEL_34:
    v7 = v44;
    if (!v30)
    {
      id v14 = 0;
      v33 = 0;
      if (!v44) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    v33 = [v30 componentsSeparatedByString:@","];
    id v14 = 0;
    goto LABEL_36;
  }
  id v29 = [(NSURL *)v42 fr_articleOpenedFrom];
  v12 = v46;
  id v8 = v43;
  v30 = v51;
  if (v29 != (id)2) {
    goto LABEL_31;
  }
  v31 = [[FRNewsReferralItemDecoder alloc] initWithAssetManager:v6];
  id v14 = [(FRNewsReferralItemDecoder *)v31 destructivelyDecodeReferraltemOfClass:objc_opt_class() withQueryValue:v49 error:0];

  if (!v14)
  {
    uint64_t v41 = 2;
    goto LABEL_34;
  }
  v32 = [v14 referredArticlesWithAssetManager:v6];
  v33 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v34 = v32;
  id v35 = [v34 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v53;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
        v40 = [v39 articleID];
        [v33 addObject:v40];
        [v46 setObject:v39 forKeyedSubscript:v40];
      }
      id v36 = [v34 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v36);
  }

  uint64_t v41 = 2;
  v7 = v44;
  id v6 = v45;
  v28 = v49;
  id v13 = obj;
  v12 = v46;
  v30 = v51;
  if (v44) {
    goto LABEL_37;
  }
LABEL_38:
}

- (int64_t)fr_articleOpenedFrom
{
  v2 = [(NSURL *)self query];
  v3 = [v2 componentsSeparatedByString:@"&"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    v26 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v28;
    uint64_t v8 = NSSOpenedFromPathComponent;
    uint64_t v9 = NSSSectionPathComponent;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = [*(id *)(*((void *)&v27 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v12 = [v11 firstObject];
        id v13 = [v12 stringByRemovingPercentEncoding];

        id v14 = [v11 lastObject];
        v15 = [v14 stringByRemovingPercentEncoding];

        if (![v13 caseInsensitiveCompare:v8])
        {
          id v16 = v15;

          id v6 = v16;
        }
        if (![v13 caseInsensitiveCompare:v9])
        {
          id v17 = v15;

          v26 = v17;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }
  else
  {
    v26 = 0;
    id v6 = 0;
  }

  v18 = [(NSURL *)self nss_campaignID];
  if ([v18 isEqualToString:NSSNewsWidgetNewsModeCampaignID])
  {
    int64_t v19 = 2;
    v20 = v26;
  }
  else
  {
    v20 = v26;
    if (v26 && (id)[(NSURL *)self _articleOpenedFromQueryValue:v6] == (id)8)
    {
      v21 = self;
      v22 = v26;
    }
    else
    {
      v21 = self;
      v22 = v6;
    }
    int64_t v19 = [(NSURL *)v21 _articleOpenedFromQueryValue:v22];
  }

  return v19;
}

- (int64_t)_articleOpenedFromQueryValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"newsletter"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"editorpicks"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"editorialarticle"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"following"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"endofarticle"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"article"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"morefrompublisher"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"related"])
  {
    int64_t v4 = 11;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)fr_widgetEngagementFileURL
{
  v2 = [(NSURL *)self fr_widgetReferralItemWithQueryItemName:FCWidgetEngagementFilePathQueryItemName];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)fr_widgetReferralItemWithQueryItemName:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000740F8();
  }
  id v5 = [(NSURL *)self query];
  id v6 = [v5 componentsSeparatedByString:@"&"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) componentsSeparatedByString:@"="];
        id v13 = [v12 firstObject];
        id v14 = [v13 stringByRemovingPercentEncoding];

        v15 = [v12 lastObject];
        id v16 = [v15 stringByRemovingPercentEncoding];

        if ([v14 isEqualToString:v4])
        {
          id v17 = v16;

          uint64_t v9 = v17;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)fr_isFromSafariSearchWithSourceApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self fr_campaignID];
  if ([v5 isEqualToString:NSSSafariSearchCampaignID]) {
    unsigned __int8 v6 = [v4 isEqualToString:@"com.apple.mobilesafari"];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)fr_valueForQueryItemWithName:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000741BC();
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100018AA0;
  id v17 = sub_1000189D8;
  id v18 = 0;
  id v5 = [(NSURL *)self query];
  unsigned __int8 v6 = [v5 componentsSeparatedByString:@"&"];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100035DF4;
  v10[3] = &unk_1000C7598;
  id v7 = v4;
  id v11 = v7;
  v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

+ (id)fr_NewsURLForTagID:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _urlForTagID:a3 internal:0];
  [v7 _setTitle:v6];

  return v7;
}

+ (id)fr_NewsInternalURLForTagID:(id)a3
{
  return [a1 _urlForTagID:a3 internal:1];
}

+ (id)_urlForTagID:(id)a3 internal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007441C();
  }
  if (![v6 length] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074358();
  }
  if ([v6 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100074284();
  }
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [a1 nss_NewsURLWithPathComponents:v7 internal:v4];

  return v8;
}

- (BOOL)fr_isFeldsparForYouURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:NSSNewsForYouPathComponent];
  }

  return v4;
}

- (BOOL)fr_isFeldsparFollowingURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:@"following"];
  }

  return v4;
}

- (BOOL)fr_isFeldsparSpotlightURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:@"spotlight"];
  }

  return v4;
}

- (BOOL)fr_isFeldsparSavedURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:NSSNewsSavedComponent];
  }

  return v4;
}

- (BOOL)fr_isFeldsparHistoryURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:NSSNewsHistoryComponent];
  }

  return v4;
}

- (BOOL)fr_isFeldsparFavoritesPickerURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:NSSNewsFavoritePickerComponent];
  }

  return v4;
}

- (BOOL)fr_isFeldsparTabURL
{
  if ([(NSURL *)self fr_isFeldsparForYouURL]
    || [(NSURL *)self fr_isFeldsparSavedURL]
    || [(NSURL *)self fr_isFeldsparHistoryURL]
    || [(NSURL *)self fr_isFeldsparSpotlightURL])
  {
    return 1;
  }

  return [(NSURL *)self fr_isFeldsparFollowingURL];
}

- (BOOL)fr_isFeldsparReferableURL
{
  if ([(NSURL *)self fr_isFeldsparTabURL]
    || [(NSURL *)self fr_isFeldsparFavoritesPickerURL]
    || ([(NSURL *)self fc_isNewsTagURL] & 1) != 0
    || ([(NSURL *)self fc_isNewsArticleURL] & 1) != 0
    || ([(NSURL *)self fc_isHardPaywallNewsArticleURL:0] & 1) != 0
    || [(NSURL *)self fr_isSubcriptionURL])
  {
    return 1;
  }

  return [(NSURL *)self fr_isBundleSubcriptionURL];
}

- (BOOL)fr_isOpenedFromExploreTab
{
  v2 = [(NSURL *)self query];
  id v3 = [v2 stringByRemovingPercentEncoding];
  BOOL v4 = [v3 componentsSeparatedByString:@"&"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = NSSOpenedFromPathComponent;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v12 = [v11 firstObject];
        uint64_t v13 = [v11 lastObject];
        if ([v12 isEqualToString:v9]
          && [v13 isEqualToString:@"editorialarticle"])
        {

          BOOL v14 = 1;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)fr_isUserSegmentationURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(NSURL *)self _caseInsensitiveCompareWithFirstPathComponent:@"segmentation-settings"];
  }

  return v4;
}

- (BOOL)_caseInsensitiveCompareWithFirstPathComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self pathComponents];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000745A4();
    if (v4) {
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000744E0();
  }
LABEL_6:
  id v7 = [(NSURL *)self pathComponents];
  uint64_t v8 = [v7 objectAtIndex:1];

  if ([v8 length]) {
    BOOL v9 = [v8 caseInsensitiveCompare:v4] == 0;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)fr_storeURLRepresentation
{
  if ([(NSURL *)self fr_isStoreURL])
  {
    id v3 = +[NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:0];
    id v4 = [v3 scheme];
    unsigned int v5 = [v4 hasPrefix:@"http"];

    if (v5)
    {
      id v6 = [v3 scheme];
      id v7 = [v6 stringByReplacingOccurrencesOfString:@"http" withString:@"itms"];
      [v3 setScheme:v7];
    }
    uint64_t v8 = [v3 URL];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)fr_isStoreURL
{
  id v3 = [(NSURL *)self scheme];
  if ([v3 hasPrefix:@"itms"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned int v5 = [(NSURL *)self host];
    if ([v5 isEqualToString:@"itunes.apple.com"])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      id v6 = [(NSURL *)self host];
      if ([v6 isEqualToString:@"buy.itunes.apple.com"])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        id v7 = [(NSURL *)self host];
        unsigned __int8 v4 = [v7 isEqualToString:@"storepreview.apple.com"];
      }
    }
  }
  return v4;
}

- (BOOL)fr_isBundleSubcriptionURL
{
  id v3 = [(NSURL *)self pathComponents];
  if ((unint64_t)[v3 count] < 2)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    unsigned __int8 v4 = [(NSURL *)self pathComponents];
    unsigned int v5 = [v4 objectAtIndex:1];
    unsigned __int8 v6 = [v5 isEqualToString:@"subscription"];
  }
  return [(NSURL *)self nss_isNewsURL] & v6;
}

- (BOOL)fr_isSubcriptionURL
{
  unsigned int v3 = [(NSURL *)self fr_isSubscriptionURLForWebOptIn];
  unsigned __int8 v4 = [(NSURL *)self pathComponents];
  if ([v4 count] == (id)3)
  {
    unsigned int v5 = [(NSURL *)self path];
    unsigned __int8 v6 = [v5 lastPathComponent];
    unsigned int v7 = [v6 isEqualToString:@"subscription"];

    v3 |= v7;
  }

  if (![(NSURL *)self nss_isNewsURL] || !v3) {
    return 0;
  }
  uint64_t v8 = [(NSURL *)self pathComponents];
  BOOL v9 = [v8 objectAtIndex:1];

  LOBYTE(v8) = [v9 fc_isValidTagID];
  return (char)v8;
}

- (id)fr_subscriptionURLTagID
{
  if ([(NSURL *)self fr_isSubcriptionURL])
  {
    unsigned int v3 = [(NSURL *)self pathComponents];
    unsigned __int8 v4 = [v3 objectAtIndex:1];

    if (objc_msgSend(v4, "fc_isValidTagID")) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)fr_isSubscriptionURLForWebOptIn
{
  if (![(NSURL *)self nss_isNewsURL]) {
    return 0;
  }
  unsigned int v3 = [(NSURL *)self pathComponents];
  if ([v3 count] != (id)4)
  {
LABEL_8:
    unsigned __int8 v10 = 0;
    goto LABEL_9;
  }
  unsigned __int8 v4 = [(NSURL *)self path];
  unsigned int v5 = [v4 lastPathComponent];
  if (([v5 isEqualToString:@"weboptin"] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v6 = [(NSURL *)self pathComponents];
  unsigned int v7 = [v6 objectAtIndexedSubscript:2];
  unsigned int v8 = [v7 isEqualToString:@"subscription"];

  if (v8)
  {
    BOOL v9 = [(NSURL *)self pathComponents];
    unsigned int v3 = [v9 objectAtIndex:1];

    unsigned __int8 v10 = [v3 fc_isValidTagID];
LABEL_9:

    return v10;
  }
  return 0;
}

- (void)fr_subscriptionURLQueryParametersWithCompletion:(id)a3
{
  long long v22 = (void (**)(id, void *, void *, void *, void *, id, id, id))a3;
  unsigned __int8 v4 = [(NSURL *)self query];
  unsigned int v5 = [v4 stringByRemovingPercentEncoding];
  id v6 = [v5 componentsSeparatedByString:@"&"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v7)
  {
    long long v23 = 0;
    v24 = 0;
    BOOL v9 = 0;
    unsigned __int8 v10 = 0;
    unsigned int v25 = 0;
    goto LABEL_21;
  }
  id v8 = v7;
  long long v23 = 0;
  v24 = 0;
  BOOL v9 = 0;
  unsigned __int8 v10 = 0;
  unsigned int v25 = 0;
  uint64_t v11 = *(void *)v28;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) componentsSeparatedByString:@"="];
      BOOL v14 = [v13 firstObject];
      uint64_t v15 = [v13 lastObject];
      if ([v14 caseInsensitiveCompare:@"qtoken"])
      {
        if ([v14 caseInsensitiveCompare:@"campaignId"])
        {
          if ([v14 caseInsensitiveCompare:@"presentedContext"])
          {
            if ([v14 caseInsensitiveCompare:@"feedId"])
            {
              long long v16 = v9;
              long long v17 = v15;
              if ([v14 caseInsensitiveCompare:@"articleId"]) {
                goto LABEL_17;
              }
            }
            else
            {
              long long v16 = v23;
              long long v17 = v9;
              long long v23 = v15;
            }
          }
          else
          {
            long long v16 = v24;
            v24 = v15;
            long long v17 = v9;
          }
        }
        else
        {
          long long v16 = v25;
          long long v17 = v9;
          unsigned int v25 = v15;
        }
      }
      else
      {
        long long v16 = v10;
        long long v17 = v9;
        unsigned __int8 v10 = v15;
      }
      id v18 = v15;

      BOOL v9 = v17;
LABEL_17:
    }
    id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v8);
LABEL_21:

  id v19 = [v24 isEqualToString:@"feed"];
  id v20 = [v24 isEqualToString:@"article"];
  id v21 = [v24 isEqualToString:@"betweenArticle"];
  if (v22) {
    v22[2](v22, v10, v25, v23, v9, v19, v20, v21);
  }
}

- (id)fr_creativeID
{
  v2 = [(NSURL *)self query];
  unsigned int v3 = [v2 stringByRemovingPercentEncoding];
  unsigned __int8 v4 = [v3 componentsSeparatedByString:@"&"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"="];
        uint64_t v11 = [v10 firstObject];
        v12 = [v10 lastObject];
        if ([v11 isEqualToString:@"creative_id"])
        {
          id v13 = v12;

          id v7 = v13;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)fr_campaignType
{
  v2 = [(NSURL *)self query];
  unsigned int v3 = [v2 stringByRemovingPercentEncoding];
  unsigned __int8 v4 = [v3 componentsSeparatedByString:@"&"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"="];
        uint64_t v11 = [v10 firstObject];
        v12 = [v10 lastObject];
        if ([v11 isEqualToString:@"campaign_type"])
        {
          id v13 = v12;

          id v7 = v13;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)fr_widgetModeGroupID
{
  v2 = [(NSURL *)self query];
  unsigned int v3 = [v2 stringByRemovingPercentEncoding];
  unsigned __int8 v4 = [v3 componentsSeparatedByString:@"&"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = FCWidgetModeGroupIDPathComponent;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v12 = [v11 firstObject];
        id v13 = [v11 lastObject];
        if ([v12 isEqualToString:v9])
        {
          id v14 = v13;

          id v7 = v14;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)fr_userActionDate
{
  +[NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v15 = long long v19 = 0u;
  v2 = [v15 queryItems];
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = FCUserActionDatePathComponent;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned __int8 v10 = [v9 name];
        unsigned int v11 = [v10 isEqualToString:v7];

        if (v11)
        {
          v12 = [v9 value];
          uint64_t v13 = +[NSDate fc_dateFromStringWithISO8601Format:v12];

          id v5 = (void *)v13;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)fr_accessTokenFromAuthenticationCallback
{
  v2 = [(NSURL *)self query];
  id v3 = [v2 stringByRemovingPercentEncoding];
  id v4 = [v3 componentsSeparatedByString:@"&"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"="];
        unsigned int v11 = [v10 firstObject];
        v12 = [v10 lastObject];
        if ([v11 isEqualToString:@"access_token"])
        {
          id v13 = v12;

          uint64_t v7 = v13;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)fr_NewsURLForNotificationsWithTagID:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007473C();
  }
  if (![v4 length] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074678();
  }
  v8[0] = v4;
  v8[1] = NSSNewsNotificationsPathComponent;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = [a1 nss_NewsURLWithPathComponents:v5];

  return v6;
}

- (id)fr_notificationsURLTagID
{
  id v3 = [(NSURL *)self pathComponents];
  id v4 = [v3 count];

  if (v4 == (id)3)
  {
    id v5 = [(NSURL *)self pathComponents];
    id v6 = [v5 objectAtIndex:1];

    if (objc_msgSend(v6, "fc_isValidTagID")) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)fr_openedFromEditorialArticleURLQueryParametersWithCompletion:(id)a3
{
  long long v16 = (void (**)(id, void *, void *, void *, void))a3;
  id v4 = [(NSURL *)self query];
  id v5 = [v4 stringByRemovingPercentEncoding];
  id v6 = [v5 componentsSeparatedByString:@"&"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    BOOL v17 = 0;
    long long v20 = 0;
    id v21 = 0;
    long long v22 = 0;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) componentsSeparatedByString:@"="];
        unsigned int v11 = [v10 firstObject];
        v12 = [v10 lastObject];
        if ([v11 isEqualToString:@"componentId"])
        {
          id v13 = v12;

          long long v22 = v13;
        }
        if ([v11 isEqualToString:@"articleId"])
        {
          id v14 = v12;

          id v21 = v14;
        }
        if ([v11 isEqualToString:@"articleVersion"])
        {
          id v15 = v12;

          long long v20 = v15;
        }
        if ([v11 isEqualToString:@"showingBadge"]) {
          BOOL v17 = [v12 intValue] == 1;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    BOOL v17 = 0;
    long long v20 = 0;
    id v21 = 0;
    long long v22 = 0;
  }

  if (v16) {
    ((void (**)(id, void *, void *, void *, BOOL))v16)[2](v16, v22, v21, v20, v17);
  }
}

- (BOOL)fr_isPreviewURL
{
  id v3 = [(NSURL *)self host];
  if ([v3 isEqualToString:@"preview"])
  {
    id v4 = [(NSURL *)self pathComponents];
    BOOL v5 = [v4 count] == (id)3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)fr_getPreviewChannelIdentifier:(id *)a3 articleIdentifier:(id *)a4
{
  id v10 = [(NSURL *)self lastPathComponent];
  id v7 = [(NSURL *)self URLByDeletingLastPathComponent];
  id v8 = [v7 lastPathComponent];
  uint64_t v9 = v8;
  if (a3) {
    *a3 = v8;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (void)fr_getOverrideSegmentSetIDs:(id *)a3 additionalSegmentSetIDs:(id *)a4 disableABTesting:(BOOL *)a5
{
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  BOOL v5 = [(NSURL *)self query];
  id v6 = [v5 componentsSeparatedByString:@"&"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) componentsSeparatedByString:@"="];
        v12 = [v11 firstObject];
        id v13 = [v12 stringByRemovingPercentEncoding];

        id v14 = [v11 lastObject];
        id v15 = [v14 stringByRemovingPercentEncoding];

        if ([v13 isEqualToString:@"overrideSSIDs"]) {
          *a3 = [v15 copy];
        }
        if ([v13 isEqualToString:@"additionalSSIDs"]) {
          *a4 = [v15 copy];
        }
        if ([v13 isEqualToString:@"disableABTesting"]) {
          *a5 = [v15 isEqualToString:@"1"];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

- (BOOL)fr_isiAdOriginatedURL
{
  v2 = [(NSURL *)self query];
  id v3 = [v2 stringByRemovingPercentEncoding];
  id v4 = [v3 componentsSeparatedByString:@"&"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v12 = [v11 firstObject];
        v8 |= [v12 isEqualToString:@"adpreviewid"];
        v7 |= [v12 isEqualToString:@"adpreviewlimit"];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
    char v13 = v8 & v7;
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (id)fr_iAdPreviewId
{
  v2 = [(NSURL *)self query];
  id v3 = [v2 stringByRemovingPercentEncoding];
  id v4 = [v3 componentsSeparatedByString:@"&"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"="];
        unsigned int v11 = [v10 firstObject];
        v12 = [v10 lastObject];
        if ([v11 isEqualToString:@"adpreviewid"])
        {
          id v13 = v12;

          int v7 = v13;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (int64_t)fr_iAdPreviewLimit
{
  v2 = [(NSURL *)self query];
  id v3 = [v2 stringByRemovingPercentEncoding];
  id v4 = [v3 componentsSeparatedByString:@"&"];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v12 = [v11 firstObject];
        id v13 = [v11 lastObject];
        if ([v12 isEqualToString:@"adpreviewlimit"]) {
          id v8 = [v13 integerValue];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (BOOL)fr_isFeldsparOpenInNewsErrorURL
{
  v2 = [(NSURL *)self path];
  if ([v2 length]) {
    BOOL v3 = [v2 rangeOfString:@"openinnewserror" options:1] != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)fr_createArticleLinkWithArticleID:(id)a3 url:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = +[NSString stringWithFormat:@"https://apple.news/%@", a3];
    id v8 = +[NSURLComponents componentsWithString:v7];
    uint64_t v9 = +[NSURLComponents componentsWithURL:v6 resolvingAgainstBaseURL:0];

    id v10 = [v9 queryItems];
    [v8 setQueryItems:v10];

    id v4 = [v8 URL];
  }

  return v4;
}

+ (BOOL)fr_canHandleNavigationAction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 request];
  id v5 = [v3 targetFrame];

  id v6 = [v5 isMainFrame];
  LOBYTE(v6) = +[WebView _canHandleRequest:v4 forMainFrame:v6];

  return (char)v6;
}

- (id)fr_deepLinkURL
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = [v3 URLOverrideForURL:self];

  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v6 = [v5 applicationsAvailableForOpeningURL:v4];

  if ([v6 count])
  {
    id v7 = [v6 objectAtIndex:0];
    id v8 = [v7 localizedName];
    id v9 = [v8 length];

    if (v9) {
      self = v4;
    }
  }
  id v10 = self;

  return v10;
}

+ (id)fr_sanitizedURLForWebView:(id)a3 navigationAction:(id)a4
{
  id v5 = a4;
  id v6 = [v5 request];
  id v7 = [v6 URL];

  id v8 = v7;
  id v9 = [v5 targetFrame];
  if ([v9 isMainFrame])
  {
  }
  else
  {
    id v10 = [v5 navigationType];

    unsigned int v11 = v8;
    if (v10) {
      goto LABEL_5;
    }
  }
  unsigned int v11 = [v8 fr_deepLinkURL];

LABEL_5:
  if ([v11 isEqual:v8])
  {
    if ((objc_msgSend(a1, "fr_canHandleNavigationAction:", v5) & 1) == 0
      && [v8 isSpringboardHandledURL]
      && (([v8 hasTelephonyScheme] & 1) != 0
       || ([v8 isFaceTimeURL] & 1) != 0
       || [v8 isFaceTimeAudioURL]))
    {
      id v12 = [objc_alloc((Class)TUDialRequest) initWithURL:v8];
      [v12 setShowUIPrompt:1];
      id v13 = [v12 URL];

      id v8 = v13;
    }
    else
    {
      id v13 = v8;
    }
  }
  else
  {
    id v13 = v11;
  }
  id v14 = v13;

  return v14;
}

- (BOOL)fr_handleExternalURLWithPrompt
{
  id v3 = [(NSURL *)self scheme];
  if ([(NSURL *)self fr_isStoreURL]) {
    goto LABEL_2;
  }
  if ([(NSURL *)self fr_isHTTPScheme])
  {
    unsigned __int8 v5 = 0;
    goto LABEL_11;
  }
  id v6 = [(NSURL *)self absoluteString];
  unsigned __int8 v7 = [v6 isEqualToString:@"about:blank"];

  unsigned __int8 v5 = 0;
  if ((v7 & 1) == 0 && v3)
  {
    if ([(NSURL *)self nss_isNewsURL])
    {
      id v8 = +[UIApplication sharedApplication];
      id v9 = [v8 delegate];
      UIApplicationOpenURLOptionsKey v20 = UIApplicationOpenURLOptionsSourceApplicationKey;
      id v10 = +[NSBundle mainBundle];
      unsigned int v11 = [v10 bundleIdentifier];
      long long v21 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      unsigned __int8 v5 = [v9 application:v8 openURL:self options:v12];
    }
    else
    {
      if (([(NSURL *)self hasTelephonyScheme] & 1) != 0
        || ([(NSURL *)self isFaceTimeAudioURL] & 1) != 0
        || [(NSURL *)self isFaceTimeURL])
      {
LABEL_2:
        id v4 = +[UIApplication sharedApplication];
        [v4 openURL:self options:&__NSDictionary0__struct completionHandler:0];

        unsigned __int8 v5 = 1;
        goto LABEL_11;
      }
      id v14 = +[LSApplicationWorkspace defaultWorkspace];
      id v8 = [v14 applicationsAvailableForOpeningURL:self];

      if (![v8 count])
      {
        unsigned __int8 v5 = 0;
        goto LABEL_10;
      }
      id v9 = [v8 objectAtIndex:0];
      long long v15 = [v9 localizedName];
      id v16 = [v15 length];
      unsigned __int8 v5 = v16 != 0;

      if (v16)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100038A2C;
        block[3] = &unk_1000C56D0;
        id v18 = v9;
        long long v19 = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

LABEL_10:
  }
LABEL_11:

  return v5;
}

- (BOOL)fr_isWebArchiveURL
{
  id v3 = [(NSURL *)self scheme];
  id v4 = [(NSURL *)self pathExtension];
  if ([v3 isEqualToString:@"file"]) {
    unsigned __int8 v5 = [v4 isEqualToString:@"webarchive"];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)fr_isHTTPScheme
{
  id v3 = [(NSURL *)self scheme];
  if (([v3 isEqualToString:@"http"] & 1) != 0
    || ([v3 isEqualToString:@"https"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = [(NSURL *)self fr_isWebArchiveURL];
  }

  return v4;
}

@end