@interface DefaultCoreTelephonyDataSource
+ (id)sharedInstance;
- (BOOL)isCellularServiceAvailable;
- (BOOL)subscriberCountryCodeDidChange;
- (CoreTelephonyClient)coreTelephonyClient;
- (DefaultCoreTelephonyDataSource)init;
- (NSArray)allRelevantISOCountryCodes;
- (OS_dispatch_queue)coreTelephonyClientQueue;
- (id)isSuperboxEnabled;
- (id)isoCountryCodeOverride;
- (void)setIsSuperboxEnabled:(id)a3;
- (void)setSubscriberCountryCodeDidChange:(BOOL)a3;
- (void)subscriberCountryCodeDidChange:(id)a3;
@end

@implementation DefaultCoreTelephonyDataSource

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005720;
  block[3] = &unk_10004CC38;
  block[4] = a1;
  if (qword_100058940 != -1) {
    dispatch_once(&qword_100058940, block);
  }
  v2 = (void *)qword_100058938;

  return v2;
}

- (DefaultCoreTelephonyDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)DefaultCoreTelephonyDataSource;
  v2 = [(DefaultCoreTelephonyDataSource *)&v8 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.TelephonyUtilities.PhoneIntentHandler.%@", objc_opt_class()];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    coreTelephonyClientQueue = v2->_coreTelephonyClientQueue;
    v2->_coreTelephonyClientQueue = (OS_dispatch_queue *)v4;

    id isSuperboxEnabled = v2->_isSuperboxEnabled;
    v2->_id isSuperboxEnabled = &stru_10004CC78;
  }
  return v2;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (!coreTelephonyClient)
  {
    id v4 = objc_alloc((Class)CoreTelephonyClient);
    v5 = [(DefaultCoreTelephonyDataSource *)self coreTelephonyClientQueue];
    v6 = (CoreTelephonyClient *)[v4 initWithQueue:v5];
    v7 = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v6;

    [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:self];
    coreTelephonyClient = self->_coreTelephonyClient;
  }

  return coreTelephonyClient;
}

- (NSArray)allRelevantISOCountryCodes
{
  id v3 = [(DefaultCoreTelephonyDataSource *)self isoCountryCodeOverride];
  if (v3)
  {
    id v4 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using ISO Country Code Override: %@", buf, 0xCu);
    }

    v5 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, 0);
  }
  else
  {
    if (!self->_allRelevantISOCountryCodes
      || [(DefaultCoreTelephonyDataSource *)self subscriberCountryCodeDidChange])
    {
      id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
      v7 = [(DefaultCoreTelephonyDataSource *)self coreTelephonyClient];
      id v35 = 0;
      objc_super v8 = [v7 getSubscriptionInfoWithError:&v35];
      id v9 = v35;

      if (v8)
      {
        id v29 = v9;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v10 = [v8 subscriptionsInUse];
        id v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v11)
        {
          id v12 = v11;
          v28 = v8;
          uint64_t v13 = *(void *)v32;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              v16 = [(DefaultCoreTelephonyDataSource *)self coreTelephonyClient];
              id v30 = 0;
              v17 = (NSArray *)[v16 copyMobileCountryCode:v15 error:&v30];
              v18 = (NSArray *)v30;

              if ([(NSArray *)v17 length])
              {
                v19 = TUISOCountryCodeForMCC();
                if ([v19 length])
                {
                  [v6 addObject:v19];
                }
                else
                {
                  v20 = IntentHandlerDefaultLog();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v38 = v17;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not determine ISO Country Code from Mobile Country Code: %@", buf, 0xCu);
                  }
                }
              }
              else
              {
                v19 = IntentHandlerDefaultLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v18;
                  _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Could not determine mobile country code from Core Telephony Subscription Context. Error: %@", buf, 0xCu);
                }
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
          }
          while (v12);
          objc_super v8 = v28;
          id v3 = 0;
        }
        id v9 = v29;
      }
      else
      {
        v10 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100030A74((uint64_t)v9, v10);
        }
      }

      v21 = TUHomeCountryCode();
      if ([v21 length]) {
        [v6 addObject:v21];
      }
      [(DefaultCoreTelephonyDataSource *)self setSubscriberCountryCodeDidChange:0];
      v22 = [v6 array];
      allRelevantISOCountryCodes = self->_allRelevantISOCountryCodes;
      self->_allRelevantISOCountryCodes = v22;

      v24 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_allRelevantISOCountryCodes;
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Resolved relevant ISO country codes: %@", buf, 0xCu);
      }
    }
    v5 = self->_allRelevantISOCountryCodes;
  }
  v26 = v5;

  return v26;
}

- (BOOL)isCellularServiceAvailable
{
  if ((*((unsigned int (**)(void))self->_isSuperboxEnabled + 2))())
  {
    id v3 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Superbox is enabled, returning YES", buf, 2u);
    }
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(DefaultCoreTelephonyDataSource *)self coreTelephonyClient];
    id v29 = 0;
    id v6 = [v5 getSubscriptionInfoWithError:&v29];
    id v3 = v29;

    if (v6)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v7 = [v6 subscriptionsInUse];
      id v8 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v8)
      {
        id v10 = v8;
        v21 = v6;
        v22 = v3;
        uint64_t v11 = *(void *)v26;
        uint64_t v12 = kCTRegistrationStatusRegisteredHome;
        uint64_t v23 = kCTRegistrationStatusRegisteredRoaming;
        *(void *)&long long v9 = 138412290;
        long long v20 = v9;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v15 = [(DefaultCoreTelephonyDataSource *)self coreTelephonyClient];
            id v24 = 0;
            id v16 = [v15 copyRegistrationStatus:v14 error:&v24];
            id v17 = v24;

            if ([v16 length])
            {
              if (([v16 isEqualToString:v12] & 1) != 0
                || ([v16 isEqualToString:v23] & 1) != 0)
              {

                BOOL v4 = 1;
                id v6 = v21;
                id v3 = v22;
                goto LABEL_27;
              }
              v18 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v31 = v16;
                __int16 v32 = 2112;
                uint64_t v33 = v14;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Cellular service is not available for SIM. Registration Status: %@ Subscription context: %@", buf, 0x16u);
              }
            }
            else
            {
              v18 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                id v31 = v17;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not determine registration status from Core Telephony Subscription Context. Error: %@", buf, 0xCu);
              }
            }
          }
          id v10 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        id v6 = v21;
        id v3 = v22;
      }
    }
    else
    {
      v7 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100030A74((uint64_t)v3, v7);
      }
    }

    v7 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Determined cellular service is unavailable.", buf, 2u);
    }
    BOOL v4 = 0;
LABEL_27:
  }
  return v4;
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
}

- (id)isoCountryCodeOverride
{
  if (_TUIsInternalInstall())
  {
    v2 = +[NSUserDefaults tu_defaults];
    id v3 = [v2 stringForKey:@"IntentHandlerISOCountryCodeInternalOverride"];

    if (v3)
    {
      BOOL v4 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_100030AEC((uint64_t)v3, v4);
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)isSuperboxEnabled
{
  return self->_isSuperboxEnabled;
}

- (void)setIsSuperboxEnabled:(id)a3
{
}

- (OS_dispatch_queue)coreTelephonyClientQueue
{
  return self->_coreTelephonyClientQueue;
}

- (BOOL)subscriberCountryCodeDidChange
{
  return self->_subscriberCountryCodeDidChange;
}

- (void)setSubscriberCountryCodeDidChange:(BOOL)a3
{
  self->_subscriberCountryCodeDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClientQueue, 0);
  objc_storeStrong(&self->_isSuperboxEnabled, 0);
  objc_storeStrong((id *)&self->_allRelevantISOCountryCodes, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end