@interface APIDAccountProvider
+ (id)privateUserAccount;
+ (id)segmentData;
+ (id)sharedInstance;
+ (id)userAccount;
+ (void)fetchGenderAndAgeData:(BOOL)a3 completionHandler:(id)a4;
- (APIDAccount)idAccount;
- (APIDAccountProvider)init;
- (APIDAccountsSettings)accountSettings;
- (BOOL)_loadIDAccounts;
- (id)accountChangedNotificationObject;
- (void)dealloc;
- (void)setAccountChangedNotificationObject:(id)a3;
- (void)setAccountSettings:(id)a3;
- (void)setIdAccount:(id)a3;
@end

@implementation APIDAccountProvider

+ (id)sharedInstance
{
  if (qword_100289738 != -1) {
    dispatch_once(&qword_100289738, &stru_100234BE0);
  }
  v2 = (void *)qword_100289730;

  return v2;
}

+ (id)userAccount
{
  v2 = [a1 sharedInstance];
  v3 = [v2 idAccount];

  return v3;
}

+ (id)privateUserAccount
{
  v2 = [a1 sharedInstance];
  v3 = [v2 idAccount];

  return v3;
}

- (APIDAccountProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)APIDAccountProvider;
  v2 = [(APIDAccountProvider *)&v13 init];
  v3 = v2;
  if (v2)
  {
    if (![(APIDAccountProvider *)v2 _loadIDAccounts])
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_initWeak(&location, v3);
    v4 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v5 = kAPAccountChangedNotification;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100085348;
    v10[3] = &unk_100234A68;
    objc_copyWeak(&v11, &location);
    uint64_t v6 = [v4 addObserverForName:v5 object:@"com.apple.AdLib" queue:0 usingBlock:v10];
    id accountChangedNotificationObject = v3->_accountChangedNotificationObject;
    v3->_id accountChangedNotificationObject = (id)v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v8 = v3;
LABEL_6:

  return v8;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self->_accountChangedNotificationObject];

  v4.receiver = self;
  v4.super_class = (Class)APIDAccountProvider;
  [(APIDAccountProvider *)&v4 dealloc];
}

- (BOOL)_loadIDAccounts
{
  v3 = +[APIDAccountsSettings settings];
  accountSettings = self->_accountSettings;
  self->_accountSettings = v3;

  uint64_t v5 = self->_accountSettings;
  if (v5)
  {
    uint64_t v6 = [(APIDAccountsSettings *)self->_accountSettings IDAccountsRecord];
    v7 = [(APIDAccountsSettings *)self->_accountSettings storefront];
    v8 = [(APIDAccountsSettings *)self->_accountSettings monthlyIDResetCount];
    v9 = +[APIDAccountsDefaultsSettings settings];
    v10 = [v9 storefrontOverride];

    if (!+[APSystemInternal isAppleInternalInstall]|| !v10)
    {
LABEL_19:
      v16 = [[APIDAccount alloc] initWithIDAccountsRecord:v6 storefront:v7 monthlyIDResetCount:v8];
      [(APIDAccountProvider *)self setIdAccount:v16];

      goto LABEL_20;
    }
    if ((unint64_t)[v10 length] < 6)
    {
      objc_super v13 = APLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Using override without modelnumber", buf, 2u);
      }

      id v12 = +[NSString stringWithFormat:@"%@%@", v10, @"-1,30"];
    }
    else
    {
      if ((unint64_t)[v10 length] < 7)
      {
        if ((unint64_t)[v7 length] < 7) {
          goto LABEL_16;
        }
        v18 = APLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Merging the storefronts into a new value.", buf, 2u);
        }

        id v19 = v10;
        uint64_t v20 = [v7 substringFromIndex:6];
        uint64_t v14 = +[NSString stringWithFormat:@"%@%@", v19, v20];

        v7 = (void *)v20;
LABEL_15:

        v7 = (void *)v14;
LABEL_16:
        v15 = APLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138739971;
          v22 = v7;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "StorefrontOverridden as = %{sensitive}@", buf, 0xCu);
        }

        goto LABEL_19;
      }
      id v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Use the large specific full value for Override", buf, 2u);
      }

      id v12 = v10;
    }
    uint64_t v14 = (uint64_t)v12;
    goto LABEL_15;
  }
  uint64_t v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error reading from settings module.", buf, 2u);
  }
LABEL_20:

  return v5 != 0;
}

+ (id)segmentData
{
  v2 = [a1 sharedInstance];
  v3 = [v2 accountSettings];
  objc_super v4 = [v3 IDAccountsRecord];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"segmentData"];

  return v5;
}

+ (void)fetchGenderAndAgeData:(BOOL)a3 completionHandler:(id)a4
{
  objc_super v4 = (void (**)(id, id))a4;
  uint64_t v5 = +[APIDAccountProvider segmentData];
  uint64_t v6 = (void *)v5;
  v7 = @"nil";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;
  v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    CFStringRef v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Fetching segmentData.  segmentData = %{private}@", buf, 0xCu);
  }

  if (!v6)
  {
    v15 = 0;
    v16 = 0;
    unint64_t v17 = -1;
    goto LABEL_45;
  }
  v10 = [v6 dataUsingEncoding:4];
  id v40 = 0;
  id v11 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v40];
  id v12 = v40;

  objc_super v13 = v12;
  if (v12)
  {
    uint64_t v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "segmentData is not in JSON format. Unable to parse segmentData.", buf, 2u);
    }
    v15 = 0;
    v16 = 0;
    unint64_t v17 = -1;
    goto LABEL_44;
  }
  uint64_t v14 = [v11 objectForKeyedSubscript:@"it"];
  v39 = [v14 objectForKeyedSubscript:@"dm"];
  uint64_t v18 = [v39 objectForKeyedSubscript:@"13"];
  v38 = (void *)v18;
  if (v18)
  {
    id v19 = (void *)v18;
    uint64_t v20 = v11;
    v21 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    v22 = +[NSDate date];
    v36 = v21;
    v23 = [v21 component:4 fromDate:v22];

    v24 = [v19 integerValue];
    unint64_t v17 = v23 - v24;
    if (v24)
    {
      id v11 = v20;
      if ((uint64_t)v17 > 17)
      {
        if (v17 > 0x18)
        {
          if (v17 > 0x22)
          {
            if (v17 > 0x2C)
            {
              if (v17 > 0x36)
              {
                if (v17 > 0x40) {
                  uint64_t v25 = 10016;
                }
                else {
                  uint64_t v25 = 10015;
                }
              }
              else
              {
                uint64_t v25 = 10014;
              }
            }
            else
            {
              uint64_t v25 = 10013;
            }
          }
          else
          {
            uint64_t v25 = 10012;
          }
        }
        else
        {
          uint64_t v25 = 10011;
        }
      }
      else
      {
        uint64_t v25 = 10010;
      }
      v15 = +[NSNumber numberWithUnsignedInt:v25];
    }
    else
    {
      v15 = +[NSNumber numberWithUnsignedInt:0];
      id v11 = v20;
    }
  }
  else
  {
    v15 = 0;
    unint64_t v17 = -1;
  }
  v26 = [v39 objectForKeyedSubscript:@"18"];
  v27 = v26;
  if (v26)
  {
    v37 = v11;
    id v28 = [v26 integerValue];
    v29 = APLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      CFStringRef v42 = @"18";
      __int16 v43 = 2117;
      v44 = v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "userProvidedGenderString %{private}@ = %{sensitive}@", buf, 0x16u);
    }

    if (v28 == (id)1)
    {
      v30 = [v39 objectForKeyedSubscript:@"17"];
      v31 = APLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        CFStringRef v42 = @"17";
        __int16 v43 = 2117;
        v44 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "genderGroupString %{private}@ = %{sensitive}@", buf, 0x16u);
      }

      if (v30)
      {
        id v32 = objc_alloc_init((Class)NSNumberFormatter);
        [v32 setNumberStyle:1];
        v16 = [v32 numberFromString:v30];

LABEL_42:
        objc_super v13 = 0;

        id v11 = v37;
        goto LABEL_43;
      }
    }
    else
    {
      v30 = APLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Gender is not inferred and so we cannot provide gender to News", buf, 2u);
      }
    }
    v16 = 0;
    goto LABEL_42;
  }
  v16 = 0;
  objc_super v13 = 0;
LABEL_43:

LABEL_44:
LABEL_45:
  v33 = +[NSMutableDictionary dictionary];
  [v33 setValue:v16 forKey:@"gender"];
  [v33 setValue:v15 forKey:@"ageGroup"];
  v34 = +[NSNumber numberWithInteger:v17];
  [v33 setValue:v34 forKey:@"age"];

  id v35 = [v33 copy];
  if (v4) {
    v4[2](v4, v35);
  }
}

- (APIDAccountsSettings)accountSettings
{
  return (APIDAccountsSettings *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountSettings:(id)a3
{
}

- (id)accountChangedNotificationObject
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountChangedNotificationObject:(id)a3
{
}

- (APIDAccount)idAccount
{
  return (APIDAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong(&self->_accountChangedNotificationObject, 0);

  objc_storeStrong((id *)&self->_accountSettings, 0);
}

@end