@interface FCEndpointConfiguration
- (BOOL)isEqual:(id)a3;
- (FCEndpointConfiguration)initWithClientAPIBaseURLString:(id)a3 notificationsBaseURLString:(id)a4 staticAssetBaseURLString:(id)a5 remoteDataSourceBaseURLString:(id)a6 newsletterAPIBaseURLString:(id)a7 appAnalyticsBaseURLString:(id)a8 fairPlayBaseURLString:(id)a9 searchAPIBaseURLString:(id)a10 puzzlesArchiveAPIBaseURLString:(id)a11 appAnalyticsNotificationReceiptBaseURLString:(id)a12 authTokenAPIBaseURLString:(id)a13 sportsDataVisualizationAPIBaseURLString:(id)a14 fineGrainedNewsletterSubscriptionBaseURLString:(id)a15 appAnalyticsSportsEventsBaseURLString:(id)a16 appAnalyticsAppHealthBaseURLString:(id)a17 appAnalyticsAppHeartbeatBaseURLString:(id)a18 ckOrderFeedBaseURLString:(id)a19 ckMultiFetchBaseURLString:(id)a20 ckRecordFetchBaseURLString:(id)a21 ckEdgeCachedOrderFeedBaseURLString:(id)a22 ckEdgeCachedMultiFetchBaseURLString:(id)a23;
- (FCEndpointConfiguration)initWithClientAPIBaseURLString:(id)a3 notificationsBaseURLString:(id)a4 staticAssetBaseURLString:(id)a5 remoteDataSourceBaseURLString:(id)a6 newsletterAPIBaseURLString:(id)a7 appAnalyticsBaseURLString:(id)a8 fairPlayBaseURLString:(id)a9 searchAPIBaseURLString:(id)a10 puzzlesArchiveAPIBaseURLString:(id)a11 appAnalyticsNotificationReceiptBaseURLString:(id)a12 authTokenAPIBaseURLString:(id)a13 sportsDataVisualizationAPIBaseURLString:(id)a14 fineGrainedNewsletterSubscriptionBaseURLString:(id)a15 appAnalyticsSportsEventsBaseURLString:(id)a16 appAnalyticsAppHealthBaseURLString:(id)a17 ckOrderFeedBaseURLString:(id)a18 ckMultiFetchBaseURLString:(id)a19 ckRecordFetchBaseURLString:(id)a20 ckEdgeCachedOrderFeedBaseURLString:(id)a21 ckEdgeCachedMultiFetchBaseURLString:(id)a22;
- (NSString)appAnalyticsAppHealthBaseURLString;
- (NSString)appAnalyticsAppHeartbeatBaseURLString;
- (NSString)appAnalyticsBaseURLString;
- (NSString)appAnalyticsNotificationReceiptBaseURLString;
- (NSString)appAnalyticsSportsEventsBaseURLString;
- (NSString)authTokenAPIBaseURLString;
- (NSString)ckEdgeCachedMultiFetchBaseURLString;
- (NSString)ckEdgeCachedOrderFeedBaseURLString;
- (NSString)ckMultiFetchBaseURLString;
- (NSString)ckOrderFeedBaseURLString;
- (NSString)ckRecordFetchBaseURLString;
- (NSString)clientAPIBaseURLString;
- (NSString)fairPlayBaseURLString;
- (NSString)fineGrainedNewsletterSubscriptionBaseURLString;
- (NSString)newsletterAPIBaseURLString;
- (NSString)notificationsBaseURLString;
- (NSString)puzzlesArchiveAPIBaseURLString;
- (NSString)remoteDataSourceBaseURLString;
- (NSString)searchAPIBaseURLString;
- (NSString)sportsDataVisualizationAPIBaseURLString;
- (NSString)staticAssetBaseURLString;
- (unint64_t)hash;
@end

@implementation FCEndpointConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckEdgeCachedMultiFetchBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckEdgeCachedOrderFeedBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckRecordFetchBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckMultiFetchBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckOrderFeedBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAppHeartbeatBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAppHealthBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsSportsEventsBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsNotificationReceiptBaseURLString, 0);
  objc_storeStrong((id *)&self->_fineGrainedNewsletterSubscriptionBaseURLString, 0);
  objc_storeStrong((id *)&self->_sportsDataVisualizationAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_authTokenAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_puzzlesArchiveAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_searchAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_fairPlayBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsBaseURLString, 0);
  objc_storeStrong((id *)&self->_newsletterAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_remoteDataSourceBaseURLString, 0);
  objc_storeStrong((id *)&self->_staticAssetBaseURLString, 0);
  objc_storeStrong((id *)&self->_notificationsBaseURLString, 0);
  objc_storeStrong((id *)&self->_clientAPIBaseURLString, 0);
}

- (FCEndpointConfiguration)initWithClientAPIBaseURLString:(id)a3 notificationsBaseURLString:(id)a4 staticAssetBaseURLString:(id)a5 remoteDataSourceBaseURLString:(id)a6 newsletterAPIBaseURLString:(id)a7 appAnalyticsBaseURLString:(id)a8 fairPlayBaseURLString:(id)a9 searchAPIBaseURLString:(id)a10 puzzlesArchiveAPIBaseURLString:(id)a11 appAnalyticsNotificationReceiptBaseURLString:(id)a12 authTokenAPIBaseURLString:(id)a13 sportsDataVisualizationAPIBaseURLString:(id)a14 fineGrainedNewsletterSubscriptionBaseURLString:(id)a15 appAnalyticsSportsEventsBaseURLString:(id)a16 appAnalyticsAppHealthBaseURLString:(id)a17 appAnalyticsAppHeartbeatBaseURLString:(id)a18 ckOrderFeedBaseURLString:(id)a19 ckMultiFetchBaseURLString:(id)a20 ckRecordFetchBaseURLString:(id)a21 ckEdgeCachedOrderFeedBaseURLString:(id)a22 ckEdgeCachedMultiFetchBaseURLString:(id)a23
{
  id v28 = a3;
  id v29 = a4;
  id v94 = a5;
  id v93 = a6;
  id v92 = a7;
  id v91 = a8;
  id v90 = a9;
  id v89 = a10;
  id v88 = a11;
  v30 = v29;
  id v87 = a12;
  id v86 = a13;
  id v85 = a14;
  id v84 = a15;
  id v83 = a16;
  id v31 = a17;
  id v32 = a18;
  id v33 = a19;
  id v34 = a20;
  id v35 = a21;
  id v36 = a22;
  id v37 = a23;
  v95.receiver = self;
  v95.super_class = (Class)FCEndpointConfiguration;
  v38 = [(FCEndpointConfiguration *)&v95 init];
  if (v38)
  {
    uint64_t v39 = [v28 copy];
    clientAPIBaseURLString = v38->_clientAPIBaseURLString;
    v38->_clientAPIBaseURLString = (NSString *)v39;

    uint64_t v41 = [v30 copy];
    notificationsBaseURLString = v38->_notificationsBaseURLString;
    v38->_notificationsBaseURLString = (NSString *)v41;

    uint64_t v43 = [v94 copy];
    staticAssetBaseURLString = v38->_staticAssetBaseURLString;
    v38->_staticAssetBaseURLString = (NSString *)v43;

    uint64_t v45 = [v93 copy];
    remoteDataSourceBaseURLString = v38->_remoteDataSourceBaseURLString;
    v38->_remoteDataSourceBaseURLString = (NSString *)v45;

    uint64_t v47 = [v92 copy];
    newsletterAPIBaseURLString = v38->_newsletterAPIBaseURLString;
    v38->_newsletterAPIBaseURLString = (NSString *)v47;

    uint64_t v49 = [v91 copy];
    appAnalyticsBaseURLString = v38->_appAnalyticsBaseURLString;
    v38->_appAnalyticsBaseURLString = (NSString *)v49;

    uint64_t v51 = [v90 copy];
    fairPlayBaseURLString = v38->_fairPlayBaseURLString;
    v38->_fairPlayBaseURLString = (NSString *)v51;

    uint64_t v53 = [v89 copy];
    searchAPIBaseURLString = v38->_searchAPIBaseURLString;
    v38->_searchAPIBaseURLString = (NSString *)v53;

    uint64_t v55 = [v88 copy];
    puzzlesArchiveAPIBaseURLString = v38->_puzzlesArchiveAPIBaseURLString;
    v38->_puzzlesArchiveAPIBaseURLString = (NSString *)v55;

    uint64_t v57 = [v87 copy];
    appAnalyticsNotificationReceiptBaseURLString = v38->_appAnalyticsNotificationReceiptBaseURLString;
    v38->_appAnalyticsNotificationReceiptBaseURLString = (NSString *)v57;

    uint64_t v59 = [v86 copy];
    authTokenAPIBaseURLString = v38->_authTokenAPIBaseURLString;
    v38->_authTokenAPIBaseURLString = (NSString *)v59;

    uint64_t v61 = [v85 copy];
    sportsDataVisualizationAPIBaseURLString = v38->_sportsDataVisualizationAPIBaseURLString;
    v38->_sportsDataVisualizationAPIBaseURLString = (NSString *)v61;

    uint64_t v63 = [v84 copy];
    fineGrainedNewsletterSubscriptionBaseURLString = v38->_fineGrainedNewsletterSubscriptionBaseURLString;
    v38->_fineGrainedNewsletterSubscriptionBaseURLString = (NSString *)v63;

    uint64_t v65 = [v83 copy];
    appAnalyticsSportsEventsBaseURLString = v38->_appAnalyticsSportsEventsBaseURLString;
    v38->_appAnalyticsSportsEventsBaseURLString = (NSString *)v65;

    uint64_t v67 = [v31 copy];
    appAnalyticsAppHealthBaseURLString = v38->_appAnalyticsAppHealthBaseURLString;
    v38->_appAnalyticsAppHealthBaseURLString = (NSString *)v67;

    uint64_t v69 = [v32 copy];
    appAnalyticsAppHeartbeatBaseURLString = v38->_appAnalyticsAppHeartbeatBaseURLString;
    v38->_appAnalyticsAppHeartbeatBaseURLString = (NSString *)v69;

    uint64_t v71 = [v33 copy];
    ckOrderFeedBaseURLString = v38->_ckOrderFeedBaseURLString;
    v38->_ckOrderFeedBaseURLString = (NSString *)v71;

    uint64_t v73 = [v34 copy];
    ckMultiFetchBaseURLString = v38->_ckMultiFetchBaseURLString;
    v38->_ckMultiFetchBaseURLString = (NSString *)v73;

    uint64_t v75 = [v35 copy];
    ckRecordFetchBaseURLString = v38->_ckRecordFetchBaseURLString;
    v38->_ckRecordFetchBaseURLString = (NSString *)v75;

    uint64_t v77 = [v36 copy];
    ckEdgeCachedOrderFeedBaseURLString = v38->_ckEdgeCachedOrderFeedBaseURLString;
    v38->_ckEdgeCachedOrderFeedBaseURLString = (NSString *)v77;

    uint64_t v79 = [v37 copy];
    ckEdgeCachedMultiFetchBaseURLString = v38->_ckEdgeCachedMultiFetchBaseURLString;
    v38->_ckEdgeCachedMultiFetchBaseURLString = (NSString *)v79;
  }
  return v38;
}

- (NSString)clientAPIBaseURLString
{
  return self->_clientAPIBaseURLString;
}

- (NSString)appAnalyticsAppHeartbeatBaseURLString
{
  return self->_appAnalyticsAppHeartbeatBaseURLString;
}

- (NSString)notificationsBaseURLString
{
  return self->_notificationsBaseURLString;
}

- (NSString)newsletterAPIBaseURLString
{
  return self->_newsletterAPIBaseURLString;
}

- (NSString)staticAssetBaseURLString
{
  return self->_staticAssetBaseURLString;
}

- (NSString)remoteDataSourceBaseURLString
{
  return self->_remoteDataSourceBaseURLString;
}

- (NSString)fairPlayBaseURLString
{
  return self->_fairPlayBaseURLString;
}

- (NSString)ckRecordFetchBaseURLString
{
  return self->_ckRecordFetchBaseURLString;
}

- (NSString)ckEdgeCachedMultiFetchBaseURLString
{
  return self->_ckEdgeCachedMultiFetchBaseURLString;
}

- (NSString)appAnalyticsSportsEventsBaseURLString
{
  return self->_appAnalyticsSportsEventsBaseURLString;
}

- (FCEndpointConfiguration)initWithClientAPIBaseURLString:(id)a3 notificationsBaseURLString:(id)a4 staticAssetBaseURLString:(id)a5 remoteDataSourceBaseURLString:(id)a6 newsletterAPIBaseURLString:(id)a7 appAnalyticsBaseURLString:(id)a8 fairPlayBaseURLString:(id)a9 searchAPIBaseURLString:(id)a10 puzzlesArchiveAPIBaseURLString:(id)a11 appAnalyticsNotificationReceiptBaseURLString:(id)a12 authTokenAPIBaseURLString:(id)a13 sportsDataVisualizationAPIBaseURLString:(id)a14 fineGrainedNewsletterSubscriptionBaseURLString:(id)a15 appAnalyticsSportsEventsBaseURLString:(id)a16 appAnalyticsAppHealthBaseURLString:(id)a17 ckOrderFeedBaseURLString:(id)a18 ckMultiFetchBaseURLString:(id)a19 ckRecordFetchBaseURLString:(id)a20 ckEdgeCachedOrderFeedBaseURLString:(id)a21 ckEdgeCachedMultiFetchBaseURLString:(id)a22
{
  return -[FCEndpointConfiguration initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:](self, "initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           0,
           a18,
           a19,
           a20,
           a21,
           a22);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FBA8A8];
    v8 = [(FCEndpointConfiguration *)self clientAPIBaseURLString];
    v9 = [v6 clientAPIBaseURLString];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E4FBA8A8];
      v11 = [(FCEndpointConfiguration *)self notificationsBaseURLString];
      v12 = [v6 notificationsBaseURLString];
      char v13 = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12);
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(FCEndpointConfiguration *)self clientAPIBaseURLString];
  uint64_t v4 = [v3 hash];
  v5 = [(FCEndpointConfiguration *)self notificationsBaseURLString];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)appAnalyticsBaseURLString
{
  return self->_appAnalyticsBaseURLString;
}

- (NSString)searchAPIBaseURLString
{
  return self->_searchAPIBaseURLString;
}

- (NSString)puzzlesArchiveAPIBaseURLString
{
  return self->_puzzlesArchiveAPIBaseURLString;
}

- (NSString)authTokenAPIBaseURLString
{
  return self->_authTokenAPIBaseURLString;
}

- (NSString)sportsDataVisualizationAPIBaseURLString
{
  return self->_sportsDataVisualizationAPIBaseURLString;
}

- (NSString)fineGrainedNewsletterSubscriptionBaseURLString
{
  return self->_fineGrainedNewsletterSubscriptionBaseURLString;
}

- (NSString)appAnalyticsNotificationReceiptBaseURLString
{
  return self->_appAnalyticsNotificationReceiptBaseURLString;
}

- (NSString)appAnalyticsAppHealthBaseURLString
{
  return self->_appAnalyticsAppHealthBaseURLString;
}

- (NSString)ckOrderFeedBaseURLString
{
  return self->_ckOrderFeedBaseURLString;
}

- (NSString)ckMultiFetchBaseURLString
{
  return self->_ckMultiFetchBaseURLString;
}

- (NSString)ckEdgeCachedOrderFeedBaseURLString
{
  return self->_ckEdgeCachedOrderFeedBaseURLString;
}

@end