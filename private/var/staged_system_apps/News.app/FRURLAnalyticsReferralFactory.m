@interface FRURLAnalyticsReferralFactory
- (FRAppActivityMonitor)appActivityMonitor;
- (FRURLAnalyticsReferralFactory)init;
- (FRURLAnalyticsReferralFactory)initWithAppActivityMonitor:(id)a3;
- (id)_extractWidgetEngagementFromReferralURL:(id)a3;
- (id)_removeAMSTokensFromUrl:(id)a3;
- (id)analyticsReferralForURL:(id)a3 sourceApplication:(id)a4;
@end

@implementation FRURLAnalyticsReferralFactory

- (FRURLAnalyticsReferralFactory)initWithAppActivityMonitor:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006F420();
  }
  v9.receiver = self;
  v9.super_class = (Class)FRURLAnalyticsReferralFactory;
  v6 = [(FRURLAnalyticsReferralFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appActivityMonitor, a3);
  }

  return v7;
}

- (FRURLAnalyticsReferralFactory)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRURLAnalyticsReferralFactory init]";
    __int16 v7 = 2080;
    v8 = "FRURLAnalyticsReferralFactory.m";
    __int16 v9 = 1024;
    int v10 = 25;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRURLAnalyticsReferralFactory init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)analyticsReferralForURL:(id)a3 sourceApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006F4E4();
  }
  if (objc_msgSend(v6, "nss_isNewsURL"))
  {
    v8 = [v6 fr_campaignID];
    uint64_t v9 = [v6 fr_campaignType];
    int v10 = [v6 fr_creativeID];
    __int16 v11 = [(FRURLAnalyticsReferralFactory *)self _removeAMSTokensFromUrl:v6];
    v33 = [v11 absoluteString];

    id v12 = v7;
    uint64_t v13 = [v6 fr_widgetModeGroupID];
    unsigned int v14 = [v12 isEqualToString:FCNotificationMarketingExtensionBundleIdentifier];
    uint64_t v15 = [(FRURLAnalyticsReferralFactory *)self _extractWidgetEngagementFromReferralURL:v6];
    unsigned __int8 v30 = [v6 fr_isFeldsparReferableURL];
    v31 = (void *)v15;
    if (objc_msgSend(v6, "fr_articleOpenedFrom") == (id)2)
    {
      v16 = (void *)v13;
      uint64_t v17 = 12;
    }
    else if (objc_msgSend(v6, "fr_isFromSafariSearchWithSourceApplication:", v12))
    {
      v16 = (void *)v13;
      uint64_t v17 = 9;
    }
    else
    {
      v16 = (void *)v13;
      if (([v8 isEqualToString:NSSSafariSearchCampaignID] & 1) == 0)
      {
        if (v14) {
          uint64_t v26 = 3;
        }
        else {
          uint64_t v26 = 4;
        }
        uint64_t v28 = v26;
        uint64_t v29 = v14;
        goto LABEL_13;
      }
      uint64_t v17 = 8;
    }
    uint64_t v28 = v17;
    uint64_t v29 = 0;
LABEL_13:
    v19 = [(FRURLAnalyticsReferralFactory *)self appActivityMonitor];
    v20 = [v19 appSessionStartReferral];

    v21 = [v20 referringURL];
    unsigned int v22 = [v21 isEqual:v33];

    id v32 = v7;
    if (v22)
    {
      v18 = v20;
      v23 = v31;
      v24 = (void *)v9;
    }
    else
    {
      v23 = v31;
      v24 = (void *)v9;
      LOBYTE(v27) = v30;
      v18 = [[FRAnalyticsReferral alloc] initWithUserActivityType:0 creativeID:v10 campaignID:v8 campaignType:v9 referringApplication:v12 referringURL:v33 appOpenedByUserActivity:v27 widgetModeGroupID:v16 widgetEngagement:v31 appSessionStartMethod:v28 appSessionStartNotificationType:v29];
    }

    id v7 = v32;
    goto LABEL_17;
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (id)_extractWidgetEngagementFromReferralURL:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006F66C();
  }
  if ((objc_msgSend(v3, "nss_isNewsURL") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006F5A8();
  }
  id v4 = [v3 fr_widgetEngagementFileURL];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:v4];
    if (v5) {
      id v6 = [objc_alloc((Class)NTPBWidgetEngagement) initWithData:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_removeAMSTokensFromUrl:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSURLComponents) initWithURL:v3 resolvingAgainstBaseURL:0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BC68;
  v10[3] = &unk_1000C5798;
  __int16 v11 = &off_1000CF978;
  id v5 = +[NSPredicate predicateWithBlock:v10];
  id v6 = [v4 queryItems];
  id v7 = [v6 filteredArrayUsingPredicate:v5];
  [v4 setQueryItems:v7];

  v8 = [v4 URL];

  return v8;
}

- (FRAppActivityMonitor)appActivityMonitor
{
  return self->_appActivityMonitor;
}

- (void).cxx_destruct
{
}

@end