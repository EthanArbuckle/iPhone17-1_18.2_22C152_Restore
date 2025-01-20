@interface WLDMercuryPushHandler
+ (id)_addMercurySilentNotifOfferSource:(id)a3 badgeId:(id)a4;
+ (id)_getBadgeID:(id)a3;
- (AMSMetrics)metricsController;
- (BOOL)shouldHandleNotification:(id)a3;
- (int64_t)_getBadgeAlertType:(id)a3;
- (void)handleNotification:(id)a3 shouldBadge:(BOOL)a4;
- (void)setMetricsController:(id)a3;
@end

@implementation WLDMercuryPushHandler

- (BOOL)shouldHandleNotification:(id)a3
{
  return [(WLDMercuryPushHandler *)self _getBadgeAlertType:a3] != 0;
}

- (void)handleNotification:(id)a3 shouldBadge:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  int64_t v6 = [(WLDMercuryPushHandler *)self _getBadgeAlertType:v18];
  uint64_t v7 = [(id)objc_opt_class() _getBadgeID:v18];
  v8 = (void *)v7;
  v9 = (void *)WLKNotificationsBadgingIdentifierDefaultValue;
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  if (v6 == 3)
  {
LABEL_9:
    v13 = objc_msgSend(v18, "wlk_dictionaryForKey:", @"aps");
    v14 = objc_msgSend(v13, "wlk_dictionaryForKey:", @"payload");
    v15 = [(id)objc_opt_class() _addMercurySilentNotifOfferSource:v14 badgeId:v10];
    v16 = +[WLKOfferManager defaultOfferManager];
    [v16 saveOffer:v15 completionHandler:0];

    goto LABEL_12;
  }
  if (v6 != 2)
  {
    if (v6 != 1) {
      goto LABEL_13;
    }
    if (v4
      && +[WLKBadgingUtilities addBadgeIdentifier:v10])
    {
      v11 = +[WLKBadgingUtilities currentBadgeNumber];
      v12 = +[WLKNotificationCenter defaultCenter];
      [v12 setBadgeNumber:v11 withCompletionHandler:0];
    }
    goto LABEL_9;
  }
  if (!+[WLKBadgingUtilities removeBadgeIdentifier:v10])goto LABEL_13; {
  v13 = +[WLKBadgingUtilities currentBadgeNumber];
  }
  v17 = +[WLKNotificationCenter defaultCenter];
  [v17 setBadgeNumber:v13 withCompletionHandler:0];

  v14 = +[WLKOfferManager defaultOfferManager];
  [v14 removeOfferByBadgeId:v10 completionHandler:0];
LABEL_12:

LABEL_13:
}

- (int64_t)_getBadgeAlertType:(id)a3
{
  v3 = objc_msgSend(a3, "wlk_dictionaryForKey:", @"aps");
  BOOL v4 = objc_msgSend(v3, "wlk_stringForKey:", @"payloadType");
  if ([v4 isEqualToString:@"mercury:tvapp:BadgeAlertAdd"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"mercury:tvapp:BadgeAlertRemove"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"mercury:tvapp:BadgeAlertNoBadge"])
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)_getBadgeID:(id)a3
{
  v3 = objc_msgSend(a3, "wlk_dictionaryForKey:", @"aps");
  BOOL v4 = objc_msgSend(v3, "wlk_stringForKey:", WLKOfferManagerKeyBadgeId);

  return v4;
}

+ (id)_addMercurySilentNotifOfferSource:(id)a3 badgeId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  if (v5 && [v5 count]) {
    [v7 addEntriesFromDictionary:v5];
  }
  [v7 setObject:@"MercurySilentNotification" forKey:@"offerSource"];
  [v7 setObject:v6 forKey:WLKOfferManagerKeyBadgeId];

  id v8 = [v7 copy];

  return v8;
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end