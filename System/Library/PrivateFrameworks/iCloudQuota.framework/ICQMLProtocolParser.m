@interface ICQMLProtocolParser
+ (BOOL)shouldCallMlDaemonForFetchOfferStub:(id)a3;
+ (BOOL)shouldCallMlDaemonForPushNotification:(id)a3;
+ (id)parseMaxDelaySecsFromFetchOffersResponse:(id)a3;
+ (id)parseMaxDelaySecsFromPushNotification:(id)a3;
@end

@implementation ICQMLProtocolParser

+ (BOOL)shouldCallMlDaemonForPushNotification:(id)a3
{
  v3 = [a3 objectForKey:@"callSubD"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      v5 = [NSNumber numberWithBool:1];
      uint64_t v6 = objc_opt_class();
      if (v6 == objc_opt_class())
      {
        int v8 = [v4 BOOLValue];

        if (v8)
        {
          v9 = _ICQGetLogSystem();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "[SUBD] IND will now use the new code path calling into ML Subscription Daemon.", buf, 2u);
          }
          BOOL v7 = 1;
          goto LABEL_13;
        }
      }
      else
      {
      }
      v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "[SUBD] IND will use the original codepath. ML Subscription Daemon will not be called.", v11, 2u);
      }
      BOOL v7 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  BOOL v7 = 0;
LABEL_14:

  return v7;
}

+ (BOOL)shouldCallMlDaemonForFetchOfferStub:(id)a3
{
  id v4 = [a3 objectForKey:@"subdContext"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [a1 shouldCallMlDaemonForPushNotification:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)parseMaxDelaySecsFromPushNotification:(id)a3
{
  v3 = [a3 objectForKey:@"maxDelayInSecs"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)parseMaxDelaySecsFromFetchOffersResponse:(id)a3
{
  id v4 = [a3 objectForKey:@"subdContext"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v5 = [a1 parseMaxDelaySecsFromPushNotification:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

@end