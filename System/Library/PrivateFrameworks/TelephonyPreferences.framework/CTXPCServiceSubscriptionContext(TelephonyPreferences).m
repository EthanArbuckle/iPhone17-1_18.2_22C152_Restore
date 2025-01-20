@interface CTXPCServiceSubscriptionContext(TelephonyPreferences)
+ (id)telephonyClient;
- (id)tps_isoCountryCode;
- (id)tps_localizedLabel;
- (id)tps_localizedPhoneNumber;
- (id)tps_localizedShortLabel;
- (uint64_t)tps_isEquivalentToSubscriptionContext:()TelephonyPreferences;
@end

@implementation CTXPCServiceSubscriptionContext(TelephonyPreferences)

+ (id)telephonyClient
{
  if (telephonyClient_onceToken != -1) {
    dispatch_once(&telephonyClient_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)telephonyClient_telephonyClient;
  return v0;
}

- (id)tps_isoCountryCode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() telephonyClient];
  id v10 = 0;
  v3 = [v2 getMobileSubscriberHomeCountryList:a1 error:&v10];
  id v4 = v10;

  if (v3)
  {
    v5 = TPSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = a1;
      _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Retreived ISO country codes %@ for %@.", buf, 0x16u);
    }

    v6 = [v3 firstObject];
  }
  else
  {
    v7 = [v4 domain];

    if (v7)
    {
      v8 = TPSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        uint64_t v14 = a1;
        _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Retreiving ISO country codes failed with error %@ for %@.", buf, 0x16u);
      }
    }
    v6 = 0;
  }

  return v6;
}

- (id)tps_localizedLabel
{
  v2 = [a1 label];
  if (!v2)
  {
    v2 = objc_msgSend(a1, "tps_localizedPhoneNumber");
  }
  return v2;
}

- (id)tps_localizedPhoneNumber
{
  v1 = [a1 phoneNumber];
  v2 = (const void *)CFPhoneNumberCreate();

  if (v2)
  {
    String = (void *)CFPhoneNumberCreateString();
    CFRelease(v2);
  }
  else
  {
    String = 0;
  }
  return String;
}

- (id)tps_localizedShortLabel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() telephonyClient];
  id v8 = 0;
  v3 = [v2 getShortLabel:a1 error:&v8];
  id v4 = v8;

  id v5 = 0;
  if (!v4)
  {
    v6 = TPSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v10 = "-[CTXPCServiceSubscriptionContext(TelephonyPreferences) tps_localizedShortLabel]";
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = a1;
      _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "%s: Received shortLabel: %@ for Context: %@", buf, 0x20u);
    }

    id v5 = v3;
  }

  return v5;
}

- (uint64_t)tps_isEquivalentToSubscriptionContext:()TelephonyPreferences
{
  id v4 = a3;
  uint64_t v5 = [a1 slotID];
  if (v5 == [v4 slotID])
  {
    v6 = [a1 labelID];
    v7 = [v4 labelID];
    uint64_t v8 = v6;
    unint64_t v9 = v7;
    id v10 = (void *)v9;
    if (v8 | v9)
    {
      if (!v9)
      {
        uint64_t v14 = 0;
        uint64_t v12 = v8;
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      int v11 = [(id)v8 isEqualToString:v9];

      if (!v11)
      {
        uint64_t v14 = 0;
        goto LABEL_11;
      }
    }
    uint64_t v12 = [a1 uuid];
    uint64_t v13 = [v4 uuid];
    uint64_t v14 = (v12 | v13) == 0;
    if (v13) {
      uint64_t v14 = [(id)v12 isEqual:v13];
    }

    goto LABEL_10;
  }
  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

@end