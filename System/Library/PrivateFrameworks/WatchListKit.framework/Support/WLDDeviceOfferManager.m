@interface WLDDeviceOfferManager
+ (BOOL)_hasProcessedDeviceOfferForCurrentUser:(id)a3;
+ (id)amsDeviceOffertoDictionary:(id)a3;
- (AMSMetrics)metricsController;
- (WLDDeviceOfferManager)init;
- (void)_reportAMSDeviceOfferMetrics;
- (void)processDeviceOffers;
@end

@implementation WLDDeviceOfferManager

- (WLDDeviceOfferManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WLDDeviceOfferManager;
  v2 = [(WLDDeviceOfferManager *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)AMSMetrics);
    v4 = WLKTVAppBundleID();
    v5 = +[AMSBag wlk_defaultBag];
    v6 = (AMSMetrics *)[v3 initWithContainerID:v4 bag:v5];
    metricsController = v2->_metricsController;
    v2->_metricsController = v6;
  }
  return v2;
}

- (void)processDeviceOffers
{
  id v3 = +[AMSDevice deviceOffers];

  v4 = WLKSystemLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = +[AMSDevice deviceOffers];
      *(_DWORD *)buf = 134217984;
      id v40 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - Found %lu offer(s) in [AMSDevice deviceOffers]", buf, 0xCu);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - [AMSDevice deviceOffers] returns nil", buf, 2u);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v7 = +[AMSDevice deviceOffers];
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    v32 = v7;
    v33 = 0;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 offerIdentifier];
          if (v13)
          {
            v14 = (void *)v13;
            v15 = [v12 offerIdentifier];
            unsigned int v16 = [v15 isEqualToString:@"com.apple.TV"];

            if (v16)
            {
              v17 = [v12 adamId];
              v18 = +[NSString stringWithFormat:@"%@", v17];
              if (([(id)objc_opt_class() _hasProcessedDeviceOfferForCurrentUser:v18] & 1) == 0)
              {
                id v19 = objc_alloc_init((Class)NSMutableDictionary);
                [v19 setObject:@"AMSDeviceOfferTypeTV" forKey:@"offerSource"];
                v20 = self;
                v21 = [(id)objc_opt_class() amsDeviceOffertoDictionary:v12];
                if (v21) {
                  [v19 addEntriesFromDictionary:v21];
                }
                ++v33;
                v22 = +[WLKOfferManager defaultOfferManager];
                [v22 saveOffer:v19 completionHandler:0];

                self = v20;
                v7 = v32;
              }
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }
  else
  {
    v33 = 0;
  }

  v23 = WLKSystemLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v40 = v33;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - Found %lu TV offer(s)", buf, 0xCu);
  }

  if (v33)
  {
    [(WLDDeviceOfferManager *)self _reportAMSDeviceOfferMetrics];
    if (+[WLKBadgingUtilities addBadgeIdentifier:WLKNotificationsBadgingIdentifierDefaultValue])
    {
      v24 = WLKSystemLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - [processDeviceOffers] badging TV App", buf, 2u);
      }

      v25 = +[WLKBadgingUtilities currentBadgeNumber];
      v26 = +[WLKNotificationCenter defaultCenter];
      [v26 setBadgeNumber:v25 withCompletionHandler:0];
    }
  }
  v27 = +[ACAccountStore ams_sharedAccountStore];
  v28 = objc_msgSend(v27, "ams_activeiTunesAccount");

  if (!v28)
  {
    v29 = WLKSystemLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - Inactive iTunes account", buf, 2u);
    }
  }
  uint64_t v30 = AMSDeviceOfferIdentifierTV;
  v31 = +[AMSBag wlk_defaultBag];
  +[AMSDevice removeDeviceOfferWithIdentifier:v30 account:v28 bag:v31 logKey:@"WLDDeviceOfferManager"];
}

+ (id)amsDeviceOffertoDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 adamId];
  BOOL v5 = [v3 description];
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isDowngrading]);
  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isSubscribed]);
  id v8 = [v3 serialNumbers];
  id v9 = [v8 allObjects];
  uint64_t v10 = +[NSArray arrayWithArray:v9];

  v11 = [v3 offerIdentifier];
  v12 = (char *)[v3 offerType];

  if ((unint64_t)(v12 - 1) > 3) {
    CFStringRef v13 = @"AMSDeviceOfferTypeUnknown";
  }
  else {
    CFStringRef v13 = *(&off_100045A90 + (void)(v12 - 1));
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v4 forKey:@"adamId"];
  if (v5) {
    CFStringRef v15 = v5;
  }
  else {
    CFStringRef v15 = &stru_100047980;
  }
  [v14 setObject:v15 forKey:@"description"];
  [v14 setObject:v6 forKey:@"downgrading"];
  [v14 setObject:v7 forKey:@"subscribed"];
  if (v10) {
    unsigned int v16 = v10;
  }
  else {
    unsigned int v16 = &__NSArray0__struct;
  }
  [v14 setObject:v16 forKey:@"serialNumbers"];
  if (v11) {
    CFStringRef v17 = v11;
  }
  else {
    CFStringRef v17 = &stru_100047980;
  }
  [v14 setObject:v17 forKey:@"offerIdentifer"];
  [v14 setObject:v13 forKey:@"offerType"];
  id v18 = [v14 copy];

  return v18;
}

- (void)_reportAMSDeviceOfferMetrics
{
  v8[0] = @"eventType";
  v8[1] = @"eventVersion";
  v9[0] = @"notificationRequest";
  v9[1] = &off_100049C08;
  v8[2] = @"notificationType";
  v9[2] = @"AMSDeviceOffer";
  id v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDDeviceOfferManager._reportAMSDeviceOfferMetrics"];
  id v6 = [objc_alloc((Class)AMSMetricsEvent) initWithTopic:@"xp_amp_notifications"];
  [v6 addPropertiesWithDictionary:v3];
  [v4 addObject:v6];
  v7 = [(WLDDeviceOfferManager *)self metricsController];
  +[WLDMetricsUtilities sendMetricsEvents:v4 metricsController:v7];
}

+ (BOOL)_hasProcessedDeviceOfferForCurrentUser:(id)a3
{
  id v3 = a3;
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - Received device offer [%@] to check", (uint8_t *)&v16, 0xCu);
  }

  if ([v3 length])
  {
    id v5 = objc_alloc((Class)NSUserDefaults);
    id v6 = [v5 initWithSuiteName:WLKDefaultsDomain];
    v7 = [v6 objectForKey:@"PreviouslyBadgedTVOffers"];
    id v8 = objc_opt_new();
    if (v7)
    {
      unsigned int v9 = [v7 containsObject:v3];
      uint64_t v10 = WLKSystemLogObject();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          int v16 = 138412290;
          id v17 = v3;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - Device TV offer [%@] has already been processed for current user", (uint8_t *)&v16, 0xCu);
        }

        BOOL v12 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if (v11)
      {
        int v16 = 138412290;
        id v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - New device TV offer [%@] for current user", (uint8_t *)&v16, 0xCu);
      }

      [v8 addObjectsFromArray:v7];
    }
    else
    {
      CFStringRef v13 = WLKSystemLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDDeviceOfferManager - New device TV offer for current user", (uint8_t *)&v16, 2u);
      }
    }
    [v8 addObject:v3];
    if ((unint64_t)[v8 count] >= 0x33) {
      [v8 removeObjectAtIndex:0];
    }
    if (v8)
    {
      [v6 setObject:v8 forKey:@"PreviouslyBadgedTVOffers"];
    }
    else
    {
      id v14 = WLKSystemLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[WLDDeviceOfferManager _hasProcessedDeviceOfferForCurrentUser:]((uint64_t)v3, v14);
      }
    }
    BOOL v12 = 0;
    goto LABEL_24;
  }
  BOOL v12 = 0;
LABEL_25:

  return v12;
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void).cxx_destruct
{
}

+ (void)_hasProcessedDeviceOfferForCurrentUser:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "WLDDeviceOfferManager - Failed to save device TV offer [%@]", (uint8_t *)&v2, 0xCu);
}

@end