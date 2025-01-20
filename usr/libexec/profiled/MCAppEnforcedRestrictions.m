@interface MCAppEnforcedRestrictions
+ (id)enforcedRestrictionsForBundleID:(id)a3;
+ (id)enforcedRestrictionsForBundleID:(id)a3 countryCode:(id)a4;
+ (id)restrictionEnforcingApps;
+ (id)setOfActiveRestrictionUUIDs;
+ (id)setOfActiveRestrictionUUIDsForCountryCode:(id)a3;
@end

@implementation MCAppEnforcedRestrictions

+ (id)restrictionEnforcingApps
{
  if (qword_100105A70 != -1) {
    dispatch_once(&qword_100105A70, &stru_1000EC400);
  }
  v2 = (void *)qword_100105A68;

  return v2;
}

+ (id)enforcedRestrictionsForBundleID:(id)a3
{
  return +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:a3 countryCode:0];
}

+ (id)enforcedRestrictionsForBundleID:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[NSSet setWithObject:v7];
  }
  else
  {
    v8 = 0;
  }
  v9 = [a1 restrictionEnforcingApps];
  v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    v11 = [v10 stringByAppendingPathComponent:@"MCRestrictions.plist"];
    v12 = +[NSURL fileURLWithPath:v11];

    if (v12)
    {
      v13 = +[MCAppEnforcedRestrictionUtilities enforcedRestrictionsForBundleID:v6 restrictionPlistURL:v12 countryCodes:v8];
    }
    else
    {
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v17 = 138543362;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not find restriction plist for app “%{public}@”", (uint8_t *)&v17, 0xCu);
      }
      v13 = 0;
    }
  }
  else
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Attempted to enforce restrictions for unhandled app “%{public}@”", (uint8_t *)&v17, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)setOfActiveRestrictionUUIDs
{
  return +[MCAppEnforcedRestrictions setOfActiveRestrictionUUIDsForCountryCode:0];
}

+ (id)setOfActiveRestrictionUUIDsForCountryCode:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableSet set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = +[MCAppEnforcedRestrictions restrictionEnforcingApps];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:v10 countryCode:v3];
        if ([v11 count])
        {
          v12 = +[MCAppEnforcedRestrictionUtilities clientUUIDForBundleID:v10];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end