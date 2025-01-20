@interface CSDUserActivity
+ (BOOL)activityTypeRequiresBestAppSuggestionListener:(unsigned int)a3;
+ (BOOL)activityTypeSupportsDynamicIdentifierRegistration:(unsigned int)a3;
+ (CSDUserActivity)activityWithType:(unsigned int)a3 dynamicIdentifier:(id)a4 userInfo:(id)a5 originatingDeviceType:(id)a6;
+ (id)_userActivityTypeStringForActivityType:(unsigned int)a3;
+ (id)appHistoryActivityWithTitle:(id)a3 subtitle:(id)a4 keywords:(id)a5 userInfo:(id)a6;
+ (unsigned)activityTypeForUserActivityTypeString:(id)a3;
+ (void)registerActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
+ (void)unregisterActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (NSString)dynamicIdentifier;
- (NSString)originatingDeviceType;
- (NSUserActivity)userActivity;
- (id)description;
- (void)addUserInfoEntriesFromDictionary:(id)a3;
- (void)becomeCurrent;
- (void)invalidate;
- (void)resignCurrent;
- (void)setDynamicIdentifier:(id)a3;
- (void)setOriginatingDeviceType:(id)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation CSDUserActivity

+ (id)appHistoryActivityWithTitle:(id)a3 subtitle:(id)a4 keywords:(id)a5 userInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(CSDUserActivity);
  v15 = [a1 _userActivityTypeStringForActivityType:4];
  id v16 = [objc_alloc((Class)NSUserActivity) _initWithTypeIdentifier:v15 suggestedActionType:1 options:0];
  [v16 _setContentType:v15];
  v17 = +[NSDate dateWithTimeIntervalSinceNow:864000.0];
  [v16 setExpirationDate:v17];

  [v16 setEligibleForSearch:1];
  [v16 setEligibleForPublicIndexing:0];
  [v16 setEligibleForHandoff:0];
  [v16 setTitle:v13];

  [v16 _setSubtitle:v12];
  [v16 _setContentUserAction:NSUserActivityContentUserActionCall];
  v18 = +[NSSet setWithArray:v11];

  [v16 setKeywords:v18];
  [(CSDUserActivity *)v14 setUserActivity:v16];
  v19 = [(CSDUserActivity *)v14 userActivity];
  [v19 setUserInfo:v10];

  return v14;
}

+ (CSDUserActivity)activityWithType:(unsigned int)a3 dynamicIdentifier:(id)a4 userInfo:(id)a5 originatingDeviceType:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init(CSDUserActivity);
  v14 = [a1 _userActivityTypeStringForActivityType:v8];
  if (v8 <= 5)
  {
    if (((1 << v8) & 0x2C) != 0)
    {
      id v15 = objc_alloc((Class)NSUserActivity);
      v22[0] = UAUserActivityAlwaysPickKey;
      v22[1] = UAAlwaysAdvertise;
      v23[0] = &off_100523B60;
      v23[1] = &__kCFBooleanTrue;
      id v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      id v17 = [v15 _initWithUserActivityType:v14 dynamicActivityType:v10 options:v16];
      [(CSDUserActivity *)v13 setUserActivity:v17];

LABEL_7:
      goto LABEL_8;
    }
    if (((1 << v8) & 0x11) != 0)
    {
      id v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v21[0] = 67109120;
        v21[1] = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Bad activity type: %d", (uint8_t *)v21, 8u);
      }
      goto LABEL_7;
    }
    id v20 = [objc_alloc((Class)NSUserActivity) _initWithTypeIdentifier:v14 suggestedActionType:12 options:&__NSDictionary0__struct];
    [(CSDUserActivity *)v13 setUserActivity:v20];
  }
LABEL_8:
  [(CSDUserActivity *)v13 setDynamicIdentifier:v10];
  v18 = [(CSDUserActivity *)v13 userActivity];
  [v18 setUserInfo:v12];

  [(CSDUserActivity *)v13 setOriginatingDeviceType:v11];

  return v13;
}

+ (void)registerActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = +[CSDUserActivity _userActivityTypeStringForActivityType:v4];
  unsigned int v7 = +[CSDUserActivity activityTypeSupportsDynamicIdentifierRegistration:v4];
  uint64_t v8 = sub_100008DCC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registering for %@ user activity type and dynamic identifier %@", (uint8_t *)&v10, 0x16u);
    }

    +[NSUserActivity _registerUserActivityType:v6 dynamicActivityType:v5];
  }
  else
  {
    if (v9)
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 1024;
      LODWORD(v13) = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to register for activity type %@ (%d), but that is not supported", (uint8_t *)&v10, 0x12u);
    }
  }
}

+ (void)unregisterActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = +[CSDUserActivity _userActivityTypeStringForActivityType:v4];
  unsigned int v7 = +[CSDUserActivity activityTypeSupportsDynamicIdentifierRegistration:v4];
  uint64_t v8 = sub_100008DCC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregistering for %@ user activity type and dynamic identifier %@", (uint8_t *)&v10, 0x16u);
    }

    +[NSUserActivity _unregisterUserActivityType:v6 dynamicActivityType:v5];
  }
  else
  {
    if (v9)
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 1024;
      LODWORD(v13) = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to unregister for activity type %@ (%d), but that is not supported", (uint8_t *)&v10, 0x12u);
    }
  }
}

+ (BOOL)activityTypeSupportsDynamicIdentifierRegistration:(unsigned int)a3
{
  return (a3 < 6) & (0x2Cu >> a3);
}

+ (BOOL)activityTypeRequiresBestAppSuggestionListener:(unsigned int)a3
{
  return ((a3 - 3) & 0xFFFFFFFD) == 0;
}

+ (unsigned)activityTypeForUserActivityTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilephone"])
  {
    unsigned int v4 = 1;
  }
  else
  {
    id v5 = TUCallHandoffActivityType();
    unsigned __int8 v6 = [v3 isEqualToString:v5];

    if (v6)
    {
      unsigned int v4 = 2;
    }
    else if ([v3 isEqualToString:@"com.apple.telephonyutilities.suppressringtone"])
    {
      unsigned int v4 = 3;
    }
    else if ([v3 isEqualToString:TUUserActivityTypeConversationHandoff])
    {
      unsigned int v4 = 5;
    }
    else
    {
      unsigned int v4 = 0;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unsigned int v4 = [(CSDUserActivity *)self userActivity];
  id v5 = [v4 activityType];
  [v3 appendFormat:@" activityType=%@", v5];

  unsigned __int8 v6 = [(CSDUserActivity *)self dynamicIdentifier];
  [v3 appendFormat:@" dynamicIdentifier=%@", v6];

  unsigned int v7 = [(CSDUserActivity *)self userActivity];
  uint64_t v8 = [v7 userInfo];
  [v3 appendFormat:@" activityUserInfo=%@", v8];

  [v3 appendString:@">"];
  id v9 = [v3 copy];

  return v9;
}

+ (id)_userActivityTypeStringForActivityType:(unsigned int)a3
{
  switch(a3)
  {
    case 1u:
      id v3 = @"com.apple.mobilephone";
      break;
    case 2u:
      TUCallHandoffActivityType();
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      id v3 = @"com.apple.telephonyutilities.suppressringtone";
      break;
    case 4u:
      TUCallPhoneAppHistoryActivityType();
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
      id v3 = (__CFString *)TUUserActivityTypeConversationHandoff;
      break;
    default:
      id v3 = 0;
      break;
  }

  return v3;
}

- (void)addUserInfoEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivity *)self userActivity];
  [v5 addUserInfoEntriesFromDictionary:v4];

  id v6 = [(CSDUserActivity *)self userActivity];
  [v6 setNeedsSave:1];
}

- (void)becomeCurrent
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDUserActivity *)self userActivity];
    int v6 = 138412290;
    unsigned int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning advertising user activity as current: %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(CSDUserActivity *)self userActivity];
  [v5 becomeCurrent];
}

- (void)resignCurrent
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDUserActivity *)self userActivity];
    int v6 = 138412290;
    unsigned int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping advertising user activity as current, without invalidating: %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(CSDUserActivity *)self userActivity];
  [v5 resignCurrent];
}

- (void)invalidate
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDUserActivity *)self userActivity];
    int v6 = 138412290;
    unsigned int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating user activity: %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(CSDUserActivity *)self userActivity];
  [v5 invalidate];
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (NSString)dynamicIdentifier
{
  return self->_dynamicIdentifier;
}

- (void)setDynamicIdentifier:(id)a3
{
}

- (NSString)originatingDeviceType
{
  return self->_originatingDeviceType;
}

- (void)setOriginatingDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDeviceType, 0);
  objc_storeStrong((id *)&self->_dynamicIdentifier, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end