@interface ICDateHeadersUtilities
+ (BOOL)isShowingQueryDateHeadersForDateHeadersType:(int)a3;
+ (BOOL)showsQueryDateHeaders;
+ (BOOL)supportsQueryDateHeaders;
+ (NSString)menuTitle;
+ (id)actionItemTitleWithDateHeadersType:(int)a3;
+ (id)stringForDateHeadersType:(int)a3;
+ (int)defaultDateHeadersType;
+ (int)queryDateHeadersType;
+ (void)clearCache;
+ (void)setDateHeadersUserPreference:(int)a3 forKey:(id)a4 postNotificationName:(id)a5;
+ (void)setDefaultDateHeadersType:(int)a3;
+ (void)setQueryDateHeadersType:(int)a3;
@end

@implementation ICDateHeadersUtilities

+ (int)defaultDateHeadersType
{
  v2 = (void *)cachedDefaultDateHeadersType;
  if (cachedDefaultDateHeadersType) {
    goto LABEL_3;
  }
  uint64_t v3 = objc_opt_class();
  v4 = +[ICSettingsUtilities objectForKey:@"kICSettingsNoteDateHeadersTypeKey"];
  uint64_t v5 = ICCheckedDynamicCast(v3, (uint64_t)v4);
  v6 = (void *)cachedDefaultDateHeadersType;
  cachedDefaultDateHeadersType = v5;

  v2 = (void *)cachedDefaultDateHeadersType;
  if (cachedDefaultDateHeadersType)
  {
LABEL_3:
    int result = [v2 integerValue];
    if (result) {
      return result;
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDateHeadersUtilities defaultDateHeadersType]", 1, 0, @"Default should never be stored as user preference. Return fallback default instead.");
  }
  else
  {
    cachedDefaultDateHeadersType = (uint64_t)&unk_26C144C10;
  }
  return 2;
}

+ (void)clearCache
{
  v2 = (void *)cachedDefaultDateHeadersType;
  cachedDefaultDateHeadersType = 0;

  uint64_t v3 = (void *)cachedQueryDateHeadersType;
  cachedQueryDateHeadersType = 0;
}

+ (void)setDefaultDateHeadersType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([a1 defaultDateHeadersType] != a3)
  {
    if ((v3 - 1) >= 2)
    {
      if (!v3)
      {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDateHeadersUtilities setDefaultDateHeadersType:]", 1, 0, @"Default should never be stored as user preference. Ignore.");
      }
    }
    else
    {
      uint64_t v5 = [NSNumber numberWithInt:v3];
      v6 = (void *)cachedDefaultDateHeadersType;
      cachedDefaultDateHeadersType = v5;

      [a1 setDateHeadersUserPreference:v3 forKey:@"kICSettingsNoteDateHeadersTypeKey" postNotificationName:@"kICDateHeadersUtilitiesDidChangeDefaultDateHeadersTypeNotification"];
    }
  }
}

+ (int)queryDateHeadersType
{
  v2 = (void *)cachedQueryDateHeadersType;
  if (cachedQueryDateHeadersType) {
    return [v2 integerValue];
  }
  uint64_t v3 = objc_opt_class();
  v4 = +[ICSettingsUtilities objectForKey:@"kICQueryDateHeadersTypeKey"];
  uint64_t v5 = ICCheckedDynamicCast(v3, (uint64_t)v4);
  v6 = (void *)cachedQueryDateHeadersType;
  cachedQueryDateHeadersType = v5;

  v2 = (void *)cachedQueryDateHeadersType;
  if (cachedQueryDateHeadersType) {
    return [v2 integerValue];
  }
  cachedQueryDateHeadersType = (uint64_t)&unk_26C144C28;

  return 0;
}

+ (void)setQueryDateHeadersType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [a1 queryDateHeadersType];
  if (v3 <= 2 && v5 != v3)
  {
    uint64_t v6 = [NSNumber numberWithInt:v3];
    v7 = (void *)cachedQueryDateHeadersType;
    cachedQueryDateHeadersType = v6;

    [a1 setDateHeadersUserPreference:v3 forKey:@"kICQueryDateHeadersTypeKey" postNotificationName:@"kICDateHeadersUtilitiesDidChangeQueryDateHeadersTypeNotification"];
  }
}

+ (BOOL)showsQueryDateHeaders
{
  uint64_t v3 = [a1 queryDateHeadersType];
  return [a1 isShowingQueryDateHeadersForDateHeadersType:v3];
}

+ (BOOL)supportsQueryDateHeaders
{
  v2 = +[ICFolderCustomNoteSortType querySortType];
  BOOL v3 = [v2 resolvedCustomSortTypeOrder] != 3;

  return v3;
}

+ (NSString)menuTitle
{
  return (NSString *)+[ICLocalization localizedFrameworkStringForKey:@"Group By Date" value:@"Group By Date" table:0 allowSiri:1];
}

+ (id)actionItemTitleWithDateHeadersType:(int)a3
{
  switch(a3)
  {
    case 2:
      BOOL v3 = @"On";
LABEL_7:
      a1 = +[ICLocalization localizedFrameworkStringForKey:v3 value:v3 table:0 allowSiri:1];
      break;
    case 1:
      BOOL v3 = @"Off";
      goto LABEL_7;
    case 0:
      objc_msgSend(a1, "stringForDateHeadersType:");
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a1;
}

+ (id)stringForDateHeadersType:(int)a3
{
  int v4 = [a1 defaultDateHeadersType];
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      uint64_t v6 = @"Off";
      goto LABEL_12;
    }
    if (a3) {
      goto LABEL_13;
    }
    switch(v4)
    {
      case 2:
        uint64_t v6 = @"Default (On)";
        goto LABEL_12;
      case 1:
        uint64_t v6 = @"Default (Off)";
        goto LABEL_12;
      case 0:
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDateHeadersUtilities stringForDateHeadersType:]", 1, 0, @"Default should never be stored as user preference. Ignore.");
        int v5 = 0;
        goto LABEL_13;
    }
  }
  uint64_t v6 = @"On";
LABEL_12:
  int v5 = +[ICLocalization localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
LABEL_13:
  return v5;
}

+ (void)setDateHeadersUserPreference:(int)a3 forKey:(id)a4 postNotificationName:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v7 = NSNumber;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 numberWithInt:v6];
  +[ICSettingsUtilities setObject:v10 forKey:v9];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:v8 object:0];
}

+ (BOOL)isShowingQueryDateHeadersForDateHeadersType:(int)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      return [a1 supportsQueryDateHeaders];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v5 = [a1 defaultDateHeadersType];
    return [a1 isShowingQueryDateHeadersForDateHeadersType:v5];
  }
}

@end