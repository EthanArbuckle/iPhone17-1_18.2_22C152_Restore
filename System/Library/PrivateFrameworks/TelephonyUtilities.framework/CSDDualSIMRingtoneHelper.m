@interface CSDDualSIMRingtoneHelper
- (CSDDualSIMRingtoneHelper)init;
- (CSDDualSIMRingtoneHelper)initWithQueue:(id)a3;
- (CTXPCServiceSubscriptionContext)defaultSIMLineSubscriptionContext;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSArray)subscriptionsInUse;
- (NSString)cachedDefaultToneIdentifier;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (int64_t)alertType;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)handleActiveSubscriptionsDidChange;
- (void)handleTLTonePreferencesDidChangeNotification;
- (void)refreshSubscriptionsInUse;
- (void)refreshToneForDefaultSIM;
- (void)refreshToneForSIMIdentifier:(id)a3;
- (void)sendDualSIMRingtoneMetrics;
- (void)setCachedDefaultToneIdentifier:(id)a3;
- (void)setDefaultSIMLineSubscriptionContext:(id)a3;
- (void)setSubscriptionsInUse:(id)a3;
@end

@implementation CSDDualSIMRingtoneHelper

- (CSDDualSIMRingtoneHelper)init
{
  return 0;
}

- (CSDDualSIMRingtoneHelper)initWithQueue:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSDDualSIMRingtoneHelper;
  v5 = [(CSDDualSIMRingtoneHelper *)&v21 init];
  if (v5)
  {
    v6 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v6;

    v8 = [(CSDDualSIMRingtoneHelper *)v5 featureFlags];
    unsigned int v9 = [v8 dualSIMRingtoneEnabled];

    if (v9)
    {
      v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing CSDDualSIMRingtoneHelper", (uint8_t *)buf, 2u);
      }

      v5->_alertType = TLAlertTypeFromString();
      if (v4)
      {
        v11 = (OS_dispatch_queue *)v4;
        queue = v5->_queue;
        v5->_queue = v11;
      }
      else
      {
        id v13 = &_dispatch_main_q;
        queue = v5->_queue;
        v5->_queue = (OS_dispatch_queue *)&_dispatch_main_q;
      }

      v14 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v5->_queue];
      coreTelephonyClient = v5->_coreTelephonyClient;
      v5->_coreTelephonyClient = v14;

      [(CoreTelephonyClient *)v5->_coreTelephonyClient setDelegate:v5];
      objc_initWeak(buf, v5);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000F7B4;
      handler[3] = &unk_100504E98;
      objc_copyWeak(&v19, buf);
      xpc_activity_register("com.apple.callservicesd.ringtone.metrics.daily", XPC_ACTIVITY_CHECK_IN, handler);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_10000F8AC, @"_TLTonePreferencesDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      objc_destroyWeak(&v19);
      objc_destroyWeak(buf);
    }
  }

  return v5;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"_TLTonePreferencesDidChangeNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)CSDDualSIMRingtoneHelper;
  [(CSDDualSIMRingtoneHelper *)&v4 dealloc];
}

- (void)handleTLTonePreferencesDidChangeNotification
{
  v3 = [(CSDDualSIMRingtoneHelper *)self featureFlags];
  unsigned int v4 = [v3 dualSIMRingtoneEnabled];

  if (v4)
  {
    v5 = +[TLToneManager sharedToneManager];
    v6 = [v5 currentToneIdentifierForAlertType:self->_alertType topic:0];

    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CSDDualSIMRingtoneHelper *)self cachedDefaultToneIdentifier];
      int v27 = 136315650;
      v28 = "-[CSDDualSIMRingtoneHelper handleTLTonePreferencesDidChangeNotification]";
      __int16 v29 = 2112;
      v30 = v6;
      __int16 v31 = 2112;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Received defaultToneIdentifier: %@. Cached value is: %@", (uint8_t *)&v27, 0x20u);
    }
    if (v6)
    {
      uint64_t v9 = [(CSDDualSIMRingtoneHelper *)self cachedDefaultToneIdentifier];
      if (v9
        && (v10 = (void *)v9,
            [(CSDDualSIMRingtoneHelper *)self cachedDefaultToneIdentifier],
            v11 = objc_claimAutoreleasedReturnValue(),
            unsigned int v12 = [v11 isEqualToString:v6],
            v11,
            v10,
            v12))
      {
        id v13 = sub_100008DCC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315138;
          v28 = "-[CSDDualSIMRingtoneHelper handleTLTonePreferencesDidChangeNotification]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Default ringtone identifier was not changed. No update required.", (uint8_t *)&v27, 0xCu);
        }
      }
      else
      {
        [(CSDDualSIMRingtoneHelper *)self setCachedDefaultToneIdentifier:v6];
        uint64_t v14 = [(CSDDualSIMRingtoneHelper *)self subscriptionsInUse];
        if (!v14
          || (v15 = (void *)v14,
              [(CSDDualSIMRingtoneHelper *)self subscriptionsInUse],
              v16 = objc_claimAutoreleasedReturnValue(),
              id v17 = [v16 count],
              v16,
              v15,
              !v17))
        {
          v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315138;
            v28 = "-[CSDDualSIMRingtoneHelper handleTLTonePreferencesDidChangeNotification]";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: self.subscriptionsInUse is nil or empty. Triggering a refetch.", (uint8_t *)&v27, 0xCu);
          }

          [(CSDDualSIMRingtoneHelper *)self refreshSubscriptionsInUse];
        }
        id v19 = [(CSDDualSIMRingtoneHelper *)self defaultSIMLineSubscriptionContext];
        id v13 = [v19 labelID];

        if (v13)
        {
          v20 = [@"TLAlertTopicIncomingCall" stringByAppendingString:v13];
          objc_super v21 = sub_100008DCC();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315650;
            v28 = "-[CSDDualSIMRingtoneHelper handleTLTonePreferencesDidChangeNotification]";
            __int16 v29 = 2112;
            v30 = v13;
            __int16 v31 = 2112;
            v32 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Checking for changes for default SIM with identifier: %@, topic: %@", (uint8_t *)&v27, 0x20u);
          }

          v22 = +[TLToneManager sharedToneManager];
          v23 = [v22 currentToneIdentifierForAlertType:self->_alertType topic:v20];

          v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315394;
            v28 = "-[CSDDualSIMRingtoneHelper handleTLTonePreferencesDidChangeNotification]";
            __int16 v29 = 2112;
            v30 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Received toneIdentifierForTopic: %@", (uint8_t *)&v27, 0x16u);
          }

          v25 = sub_100008DCC();
          v26 = v25;
          if (v23)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              int v27 = 136315138;
              v28 = "-[CSDDualSIMRingtoneHelper handleTLTonePreferencesDidChangeNotification]";
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: toneIdentifierForTopic: is different from defaultToneIdentifier. Overwriting toneIdentifierForTopic", (uint8_t *)&v27, 0xCu);
            }

            v26 = +[TLToneManager sharedToneManager];
            [v26 setCurrentToneIdentifier:v6 forAlertType:self->_alertType topic:v20];
          }
          else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            sub_1003A64F8(v26);
          }
        }
      }
    }
    else
    {
      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1003A6474(v13);
      }
    }
  }
}

- (void)refreshSubscriptionsInUse
{
  v3 = [(CSDDualSIMRingtoneHelper *)self featureFlags];
  unsigned int v4 = [v3 dualSIMRingtoneEnabled];

  if (v4)
  {
    [(CSDDualSIMRingtoneHelper *)self setSubscriptionsInUse:0];
    [(CSDDualSIMRingtoneHelper *)self setDefaultSIMLineSubscriptionContext:0];
    v5 = [(CSDDualSIMRingtoneHelper *)self coreTelephonyClient];
    id v24 = 0;
    v6 = [v5 getSubscriptionInfoWithError:&v24];
    id v7 = v24;

    if (!v7)
    {
      v8 = [v6 subscriptionsInUse];
      [(CSDDualSIMRingtoneHelper *)self setSubscriptionsInUse:v8];
    }
    uint64_t v9 = [(CSDDualSIMRingtoneHelper *)self subscriptionsInUse];
    id v10 = [v9 count];

    if (v10)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v11 = [(CSDDualSIMRingtoneHelper *)self subscriptionsInUse];
      id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v15);
            id v17 = [v16 userDefaultVoice];
            if ([v17 BOOLValue]
              && ([v16 isSimHidden] & 1) == 0)
            {
              unsigned __int8 v18 = [v16 isSimDataOnly];

              if ((v18 & 1) == 0) {
                [(CSDDualSIMRingtoneHelper *)self setDefaultSIMLineSubscriptionContext:v16];
              }
            }
            else
            {
            }
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v19 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
          id v13 = v19;
        }
        while (v19);
      }
    }
  }
}

- (void)refreshToneForDefaultSIM
{
  v3 = [(CSDDualSIMRingtoneHelper *)self featureFlags];
  unsigned int v4 = [v3 dualSIMRingtoneEnabled];

  if (v4)
  {
    v5 = [(CSDDualSIMRingtoneHelper *)self defaultSIMLineSubscriptionContext];
    v6 = [v5 labelID];

    if (v6)
    {
      id v7 = [@"TLAlertTopicIncomingCall" stringByAppendingString:v6];
      v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = v6;
        __int16 v20 = 2112;
        long long v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking for changes for default SIM with identifier: %@, topic: %@", (uint8_t *)&v18, 0x16u);
      }

      uint64_t v9 = +[TLToneManager sharedToneManager];
      id v10 = [v9 currentToneIdentifierForAlertType:self->_alertType topic:v7];

      v11 = +[TLToneManager sharedToneManager];
      id v12 = [v11 currentToneIdentifierForAlertType:self->_alertType topic:0];

      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = v10;
        __int16 v20 = 2112;
        long long v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received toneIdentifierForTopic: %@, defaultToneIdentifier: %@", (uint8_t *)&v18, 0x16u);
      }

      if (v12 && v10)
      {
        unsigned __int8 v14 = [v10 isEqualToString:v12];
        v15 = sub_100008DCC();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            LOWORD(v18) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "toneIdentifierForTopic: is same as defaultToneIdentifier. Setting defaultToneIdentifier as toneIdentifierForTopic in case toneIdentifierForTopic was nil in defaults", (uint8_t *)&v18, 2u);
          }

          id v17 = +[TLToneManager sharedToneManager];
          [v17 setCurrentToneIdentifier:v12 forAlertType:self->_alertType topic:v7];
        }
        else
        {
          if (v16)
          {
            LOWORD(v18) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "toneIdentifierForTopic: is different from defaultToneIdentifier. Overwriting defaultToneIdentifier", (uint8_t *)&v18, 2u);
          }

          id v17 = +[TLToneManager sharedToneManager];
          [v17 setCurrentToneIdentifier:v10 forAlertType:self->_alertType];
        }
      }
      else
      {
        id v17 = sub_100008DCC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1003A657C(v17);
        }
      }
    }
  }
}

- (void)refreshToneForSIMIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDDualSIMRingtoneHelper *)self featureFlags];
  unsigned int v6 = [v5 dualSIMRingtoneEnabled];

  if (v6)
  {
    id v7 = [@"TLAlertTopicIncomingCall" stringByAppendingString:v4];
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking for changes for non-default SIM with identifier: %@, topic: %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v9 = +[TLToneManager sharedToneManager];
    id v10 = [v9 currentToneIdentifierForAlertType:self->_alertType topic:v7];

    v11 = +[TLToneManager sharedToneManager];
    id v12 = [v11 currentToneIdentifierForAlertType:self->_alertType topic:0];

    if (v12 && v10)
    {
      if (![v10 isEqualToString:v12])
      {
LABEL_13:

        goto LABEL_14;
      }
      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "toneIdentifierForTopic: is same as defaultToneIdentifier. Setting defaultToneIdentifier as toneIdentifierForTopic in case toneIdentifierForTopic was nil in defaults", (uint8_t *)&v15, 2u);
      }

      unsigned __int8 v14 = +[TLToneManager sharedToneManager];
      [v14 setCurrentToneIdentifier:v12 forAlertType:self->_alertType topic:v7];
    }
    else
    {
      unsigned __int8 v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1003A657C(v14);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)handleActiveSubscriptionsDidChange
{
  v3 = [(CSDDualSIMRingtoneHelper *)self featureFlags];
  unsigned int v4 = [v3 dualSIMRingtoneEnabled];

  if (v4)
  {
    [(CSDDualSIMRingtoneHelper *)self refreshSubscriptionsInUse];
    v5 = [(CSDDualSIMRingtoneHelper *)self subscriptionsInUse];

    if (!v5)
    {
      unsigned int v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received no subscriptions. Not doing anything", buf, 2u);
      }
    }
    [(CSDDualSIMRingtoneHelper *)self refreshToneForDefaultSIM];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(CSDDualSIMRingtoneHelper *)self subscriptionsInUse];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [v12 userDefaultVoice];
          if (([v13 BOOLValue] & 1) == 0
            && ([v12 isSimHidden] & 1) == 0)
          {
            unsigned __int8 v14 = [v12 isSimDataOnly];

            if (v14) {
              continue;
            }
            id v13 = [v12 labelID];
            [(CSDDualSIMRingtoneHelper *)self refreshToneForSIMIdentifier:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)activeSubscriptionsDidChange
{
  v3 = [(CSDDualSIMRingtoneHelper *)self featureFlags];
  unsigned int v4 = [v3 dualSIMRingtoneEnabled];

  if (v4)
  {
    [(CSDDualSIMRingtoneHelper *)self handleActiveSubscriptionsDidChange];
  }
}

- (void)sendDualSIMRingtoneMetrics
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010798;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)subscriptionsInUse
{
  return self->_subscriptionsInUse;
}

- (void)setSubscriptionsInUse:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)defaultSIMLineSubscriptionContext
{
  return self->_defaultSIMLineSubscriptionContext;
}

- (void)setDefaultSIMLineSubscriptionContext:(id)a3
{
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)cachedDefaultToneIdentifier
{
  return self->_cachedDefaultToneIdentifier;
}

- (void)setCachedDefaultToneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDefaultToneIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultSIMLineSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_subscriptionsInUse, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end