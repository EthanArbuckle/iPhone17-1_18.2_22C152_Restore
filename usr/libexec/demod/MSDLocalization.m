@interface MSDLocalization
+ (BOOL)getChannelWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5;
+ (BOOL)getRetailWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5;
+ (BOOL)getWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forOwnershipWarningFlag:(id)a5;
+ (id)getLocalizedOwnershipWarnings:(id)a3;
+ (id)sharedInstance;
+ (void)fillInMissingLocales:(id)a3 withOwnershipWarningMsg:(id)a4;
- (MSDLocalization)init;
- (NSDictionary)localizationTable;
- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4;
- (void)setLocalizationTable:(id)a3;
@end

@implementation MSDLocalization

+ (id)sharedInstance
{
  if (qword_100189B88 != -1) {
    dispatch_once(&qword_100189B88, &stru_100153520);
  }
  v2 = (void *)qword_100189B80;

  return v2;
}

- (MSDLocalization)init
{
  v15.receiver = self;
  v15.super_class = (Class)MSDLocalization;
  v2 = [(MSDLocalization *)&v15 init];
  if (v2)
  {
    v3 = +[NSBundle bundleWithPath:@"/Applications/StoreDemoViewService.app"];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 localizations];
      v6 = +[NSLocale preferredLanguages];
      v7 = +[NSBundle preferredLocalizationsFromArray:v5 forPreferences:v6];

      v8 = [v7 objectAtIndexedSubscript:0];
      v9 = [v4 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v8];

      v10 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:v9];
      localizationTable = v2->_localizationTable;
      v2->_localizationTable = v10;
    }
    else
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000D4F64(v12);
      }

      v7 = v2->_localizationTable;
      v2->_localizationTable = 0;
    }

    v13 = v2;
  }

  return v2;
}

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MSDLocalization *)self localizationTable];

  if (v8)
  {
    v9 = [(MSDLocalization *)self localizationTable];
    v10 = [v9 objectForKey:v6];

    v11 = v10;
    if (!v10)
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = +[NSLocale preferredLanguages];
        int v16 = 138543618;
        id v17 = v6;
        __int16 v18 = 2114;
        v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Localization lookup failed for key %{public}@, preferred languages %{public}@", (uint8_t *)&v16, 0x16u);
      }
      v11 = v7;
    }
    id v14 = v11;
  }
  else
  {
    id v14 = v7;
  }

  return v14;
}

+ (id)getLocalizedOwnershipWarnings:(id)a3
{
  id v3 = a3;
  v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "+[MSDLocalization getLocalizedOwnershipWarnings:]";
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarningFlag:  %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008152C;
  block[3] = &unk_100151AF0;
  id v10 = v3;
  uint64_t v5 = qword_100189B98;
  id v6 = v3;
  if (v5 != -1) {
    dispatch_once(&qword_100189B98, block);
  }
  id v7 = (id)qword_100189B90;

  return v7;
}

+ (void)fillInMissingLocales:(id)a3 withOwnershipWarningMsg:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100189BA8 != -1) {
    dispatch_once(&qword_100189BA8, &stru_100153540);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)qword_100189BA0;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        __int16 v13 = [v5 objectForKey:v12];

        if (!v13) {
          [v5 setObject:v6 forKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

+ (BOOL)getWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forOwnershipWarningFlag:(id)a5
{
  id v7 = a5;
  *a3 = 0;
  *a4 = 0;
  id v8 = (void *)MGGetStringAnswer();
  id v9 = v8;
  if (!v8)
  {
    __int16 v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D5180(v13);
    }
    goto LABEL_19;
  }
  if (([v8 isEqualToString:@"iPhone"] & 1) == 0
    && ([v9 isEqualToString:@"iPad"] & 1) == 0
    && ([v9 isEqualToString:@"iPod"] & 1) == 0
    && ([v9 isEqualToString:@"Watch"] & 1) == 0)
  {
    __int16 v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D5278();
    }
    goto LABEL_19;
  }
  if (([v7 isEqualToString:@"2"] & 1) == 0
    && ([v7 isEqualToString:@"1"] & 1) == 0)
  {
    __int16 v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D5204();
    }
LABEL_19:

    BOOL v11 = 0;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"2"]) {
    unsigned __int8 v10 = +[MSDLocalization getChannelWarningKeys:a3 andPlaceHolderWarnings:a4 forDeviceClass:v9];
  }
  else {
    unsigned __int8 v10 = +[MSDLocalization getRetailWarningKeys:a3 andPlaceHolderWarnings:a4 forDeviceClass:v9];
  }
  BOOL v11 = v10;
LABEL_12:

  return v11;
}

+ (BOOL)getChannelWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7 = a5;
  id v8 = +[NSMutableDictionary dictionary];
  uint64_t v9 = kMMSDPropertyClaimTitleKey;
  [v8 setObject:@"PropertyClaimTitle_Channel" forKey:kMMSDPropertyClaimTitleKey];
  uint64_t v10 = kMMSDPropertyClaimLinkKey;
  [v8 setObject:@"PropertyClaimLink_Channel" forKey:kMMSDPropertyClaimLinkKey];
  BOOL v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:@"Property of Apple Authorized Reseller" forKey:v9];
  [v11 setObject:&stru_100155450 forKey:v10];
  if ([v7 isEqualToString:@"iPhone"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_iPhone_Channel" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This iPhone cannot be used and is not for sale.";
LABEL_9:
    [v11 setObject:v13 forKey:v12];
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"iPad"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_iPad_Channel" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This iPad cannot be used and is not for sale.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"iPod"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_iPod_Channel" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This iPod cannot be used and is not for sale.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Watch"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_AppleWatch_Channel" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This Apple Watch cannot be used and is not for sale.";
    goto LABEL_9;
  }
LABEL_10:
  *a3 = +[NSDictionary dictionaryWithDictionary:v8];
  *a4 = +[NSDictionary dictionaryWithDictionary:v11];

  return 1;
}

+ (BOOL)getRetailWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7 = a5;
  id v8 = +[NSMutableDictionary dictionary];
  uint64_t v9 = kMMSDPropertyClaimTitleKey;
  [v8 setObject:@"PropertyClaimTitle_Retail" forKey:kMMSDPropertyClaimTitleKey];
  uint64_t v10 = kMMSDPropertyClaimLinkKey;
  [v8 setObject:@"PropertyClaimLink_Retail" forKey:kMMSDPropertyClaimLinkKey];
  BOOL v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:@"Property of Apple" forKey:v9];
  [v11 setObject:@"apple.com/retail" forKey:v10];
  if ([v7 isEqualToString:@"iPhone"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_iPhone_Retail" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This iPhone cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
LABEL_9:
    [v11 setObject:v13 forKey:v12];
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"iPad"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_iPad_Retail" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This iPad cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"iPod"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_iPod_Retail" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This iPod cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"Watch"])
  {
    uint64_t v12 = kMMSDPropertyClaimBodyKey;
    [v8 setObject:@"PropertyClaimBody_AppleWatch_Retail" forKey:kMMSDPropertyClaimBodyKey];
    CFStringRef v13 = @"This Apple Watch cannot be used and is not for sale.  Return it to a nearby Apple retail location.";
    goto LABEL_9;
  }
LABEL_10:
  *a3 = +[NSDictionary dictionaryWithDictionary:v8];
  *a4 = +[NSDictionary dictionaryWithDictionary:v11];

  return 1;
}

- (NSDictionary)localizationTable
{
  return self->_localizationTable;
}

- (void)setLocalizationTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end