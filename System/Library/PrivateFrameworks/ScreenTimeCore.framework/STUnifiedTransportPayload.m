@interface STUnifiedTransportPayload
+ (BOOL)supportsSecureCoding;
+ (id)_descriptionDictionariesForBlueprintDictionaries:(id)a3;
+ (id)_descriptionDictionariesForSettingsDictionaries:(id)a3;
+ (id)_descriptionDictionaryForBlueprintPayloadDictionary:(id)a3;
+ (id)_descriptionDictionaryForCheckinRequestPayloadDictionary:(id)a3;
+ (id)_descriptionDictionaryForCheckinResponsePayloadDictionary:(id)a3;
+ (id)_descriptionDictionaryForPayloadDictionary:(id)a3 type:(id)a4;
+ (id)_descriptionDictionaryForSettingsPayloadDictionary:(id)a3;
+ (id)classFallbacksForKeyedArchiver;
- (NSArray)destinations;
- (NSDictionary)payloadDictionary;
- (NSMutableDictionary)userInfo;
- (NSString)UUID;
- (NSString)payloadType;
- (STUnifiedTransportPayload)initWithCoder:(id)a3;
- (STUnifiedTransportPayload)initWithPayload:(id)a3 type:(id)a4;
- (STUnifiedTransportPayload)initWithPayload:(id)a3 type:(id)a4 userInfo:(id)a5;
- (STUnifiedTransportPayload)initWithPayload:(id)a3 userInfo:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation STUnifiedTransportPayload

- (STUnifiedTransportPayload)initWithPayload:(id)a3 type:(id)a4
{
  return [(STUnifiedTransportPayload *)self initWithPayload:a3 type:a4 userInfo:0];
}

- (STUnifiedTransportPayload)initWithPayload:(id)a3 type:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  v9 = [(STUnifiedTransportPayload *)self initWithPayload:a3 userInfo:a5];
  v10 = [(STUnifiedTransportPayload *)v9 userInfo];
  [v10 setObject:v8 forKeyedSubscript:@"RMUnifiedTransportPayloadTypeKey"];

  return v9;
}

- (STUnifiedTransportPayload)initWithPayload:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STUnifiedTransportPayload;
  id v8 = [(STUnifiedTransportPayload *)&v16 init];
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    payloadDictionary = v8->_payloadDictionary;
    v8->_payloadDictionary = v9;

    id v11 = [v7 mutableCopy];
    v12 = v11;
    if (v11) {
      v13 = (NSMutableDictionary *)v11;
    }
    else {
      v13 = (NSMutableDictionary *)objc_opt_new();
    }
    userInfo = v8->_userInfo;
    v8->_userInfo = v13;
  }
  return v8;
}

- (NSString)UUID
{
  v2 = [(STUnifiedTransportPayload *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"RMUnifiedTransportPayloadIdentifierKey"];

  return (NSString *)v3;
}

- (void)setUUID:(id)a3
{
  id v5 = [a3 copy];
  v4 = [(STUnifiedTransportPayload *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"RMUnifiedTransportPayloadIdentifierKey"];
}

- (NSString)payloadType
{
  v2 = [(STUnifiedTransportPayload *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"RMUnifiedTransportPayloadTypeKey"];

  return (NSString *)v3;
}

+ (id)_descriptionDictionariesForBlueprintDictionaries:(id)a3
{
  id v3 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v34 = *(void *)v37;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v36 + 1) + 8 * i);
        id v8 = objc_opt_new();
        uint64_t v9 = [v7 objectForKeyedSubscript:@"identifier"];
        v10 = (void *)v9;
        if (v9) {
          CFStringRef v11 = (const __CFString *)v9;
        }
        else {
          CFStringRef v11 = @"None";
        }
        [v8 setObject:v11 forKeyedSubscript:@"identifier"];

        uint64_t v12 = [v7 objectForKeyedSubscript:@"users"];
        v13 = (void *)v12;
        if (v12) {
          CFStringRef v14 = (const __CFString *)v12;
        }
        else {
          CFStringRef v14 = @"None";
        }
        [v8 setObject:v14 forKeyedSubscript:@"users"];

        uint64_t v15 = [v7 objectForKeyedSubscript:@"enabled"];
        objc_super v16 = (void *)v15;
        if (v15) {
          v17 = (void *)v15;
        }
        else {
          v17 = &__kCFBooleanFalse;
        }
        [v8 setObject:v17 forKeyedSubscript:@"enabled"];

        uint64_t v18 = [v7 objectForKeyedSubscript:@"limitEnabled"];
        v19 = (void *)v18;
        if (v18) {
          v20 = (void *)v18;
        }
        else {
          v20 = &__kCFBooleanFalse;
        }
        [v8 setObject:v20 forKeyedSubscript:@"limitEnabled"];

        uint64_t v21 = [v7 objectForKeyedSubscript:@"creationDate"];
        v22 = (void *)v21;
        if (v21) {
          CFStringRef v23 = (const __CFString *)v21;
        }
        else {
          CFStringRef v23 = @"None";
        }
        [v8 setObject:v23 forKeyedSubscript:@"creationDate"];

        uint64_t v24 = [v7 objectForKeyedSubscript:@"expiration"];
        v25 = (void *)v24;
        if (v24) {
          CFStringRef v26 = (const __CFString *)v24;
        }
        else {
          CFStringRef v26 = @"None";
        }
        [v8 setObject:v26 forKeyedSubscript:@"expiration"];

        uint64_t v27 = [v7 objectForKeyedSubscript:@"organization.class"];
        v28 = (void *)v27;
        if (v27) {
          CFStringRef v29 = (const __CFString *)v27;
        }
        else {
          CFStringRef v29 = @"None";
        }
        [v8 setObject:v29 forKeyedSubscript:@"organization.class"];

        v30 = [v7 objectForKeyedSubscript:@"configurations"];

        if (v30)
        {
          v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 count]);
          [v8 setObject:v31 forKeyedSubscript:@"NumberOfConfigurations"];
        }
        else
        {
          [v8 setObject:&off_10030FE08 forKeyedSubscript:@"NumberOfConfigurations"];
        }

        [v35 addObject:v8];
      }
      id v5 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v5);
  }

  return v35;
}

+ (id)_descriptionDictionariesForSettingsDictionaries:(id)a3
{
  id v3 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v3;
  id v50 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v52;
    CFStringRef v4 = @"organization";
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v51 + 1) + 8 * i);
        id v7 = objc_opt_new();
        uint64_t v8 = [v6 objectForKeyedSubscript:@"user"];
        uint64_t v9 = (void *)v8;
        if (v8) {
          CFStringRef v10 = (const __CFString *)v8;
        }
        else {
          CFStringRef v10 = @"None";
        }
        [v7 setObject:v10 forKeyedSubscript:@"user"];

        CFStringRef v11 = [v6 objectForKeyedSubscript:@"passcode"];
        if (v11) {
          CFStringRef v12 = @"Set";
        }
        else {
          CFStringRef v12 = @"Not Set";
        }
        [v7 setObject:v12 forKeyedSubscript:@"passcode"];

        uint64_t v13 = [v6 objectForKeyedSubscript:@"allLimitsEnabled"];
        CFStringRef v14 = (void *)v13;
        if (v13) {
          uint64_t v15 = (void *)v13;
        }
        else {
          uint64_t v15 = &__kCFBooleanFalse;
        }
        [v7 setObject:v15 forKeyedSubscript:@"allLimitsEnabled"];

        uint64_t v16 = [v6 objectForKeyedSubscript:@"defaultUserPolicies"];
        v17 = (void *)v16;
        if (v16) {
          uint64_t v18 = (_UNKNOWN **)v16;
        }
        else {
          uint64_t v18 = &off_10030FE08;
        }
        [v7 setObject:v18 forKeyedSubscript:@"defaultUserPolicies"];

        uint64_t v19 = [v6 objectForKeyedSubscript:@"communicationPolicy"];
        v20 = (void *)v19;
        if (v19) {
          uint64_t v21 = (_UNKNOWN **)v19;
        }
        else {
          uint64_t v21 = &off_10030FE08;
        }
        [v7 setObject:v21 forKeyedSubscript:@"communicationPolicy"];

        uint64_t v22 = [v6 objectForKeyedSubscript:@"communicationWhileLimitedPolicy"];
        CFStringRef v23 = (void *)v22;
        if (v22) {
          uint64_t v24 = (_UNKNOWN **)v22;
        }
        else {
          uint64_t v24 = &off_10030FE08;
        }
        [v7 setObject:v24 forKeyedSubscript:@"communicationWhileLimitedPolicy"];

        uint64_t v25 = [v6 objectForKeyedSubscript:@"contactManagementState"];
        CFStringRef v26 = (void *)v25;
        if (v25) {
          uint64_t v27 = (_UNKNOWN **)v25;
        }
        else {
          uint64_t v27 = &off_10030FE08;
        }
        [v7 setObject:v27 forKeyedSubscript:@"contactManagementState"];

        uint64_t v28 = [v6 objectForKeyedSubscript:@"isCommunicationSafetySendingRestricted"];
        CFStringRef v29 = (void *)v28;
        if (v28) {
          v30 = (void *)v28;
        }
        else {
          v30 = &__kCFBooleanFalse;
        }
        [v7 setObject:v30 forKeyedSubscript:@"isCommunicationSafetySendingRestricted"];

        uint64_t v31 = [v6 objectForKeyedSubscript:@"isCommunicationSafetyReceivingRestricted"];
        v32 = (void *)v31;
        if (v31) {
          v33 = (void *)v31;
        }
        else {
          v33 = &__kCFBooleanFalse;
        }
        [v7 setObject:v33 forKeyedSubscript:@"isCommunicationSafetyReceivingRestricted"];

        uint64_t v34 = [v6 objectForKeyedSubscript:@"isCommunicationSafetyNotificationEnabled"];
        id v35 = (void *)v34;
        if (v34) {
          long long v36 = (void *)v34;
        }
        else {
          long long v36 = &__kCFBooleanFalse;
        }
        [v7 setObject:v36 forKeyedSubscript:@"isCommunicationSafetyNotificationEnabled"];

        uint64_t v37 = [v6 objectForKeyedSubscript:@"isCommunicationSafetyAnalyticsEnabled"];
        long long v38 = (void *)v37;
        if (v37) {
          long long v39 = (void *)v37;
        }
        else {
          long long v39 = &__kCFBooleanFalse;
        }
        [v7 setObject:v39 forKeyedSubscript:@"isCommunicationSafetyAnalyticsEnabled"];

        v40 = [v6 objectForKeyedSubscript:v4];
        if (v40) {
          [v7 setObject:v40 forKeyedSubscript:v4];
        }
        v41 = [v6 objectForKeyedSubscript:@"recoveryAltDSID"];
        if (v41) {
          [v7 setObject:v41 forKeyedSubscript:@"recoveryAltDSID"];
        }
        v42 = [v6 objectForKeyedSubscript:@"isManaged"];
        if (v42) {
          [v7 setObject:v42 forKeyedSubscript:@"isManaged"];
        }
        CFStringRef v43 = v4;
        v44 = [v6 objectForKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
        if (v44) {
          [v7 setObject:v44 forKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
        }
        v45 = [v6 objectForKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];

        if (v45) {
          [v7 setObject:v45 forKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
        }

        [v49 addObject:v7];
        CFStringRef v4 = v43;
      }
      id v50 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v50);
  }

  return v49;
}

+ (id)_descriptionDictionaryForCheckinRequestPayloadDictionary:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = objc_opt_new();
  id v5 = [v3 objectForKeyedSubscript:@"Blueprints"];
  id v6 = [v5 count];
  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  [v4 setObject:v7 forKeyedSubscript:@"NumberOfBlueprints"];

  if (v6)
  {
    uint64_t v8 = +[NSMutableArray arrayWithCapacity:v6];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v9 = [v5 allKeys];
    id v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v47;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 addObject:*(void *)(*((void *)&v46 + 1) + 8 * i)];
        }
        id v11 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKeyedSubscript:@"Blueprints"];
  }
  CFStringRef v14 = [v3 objectForKeyedSubscript:@"Settings"];
  id v15 = [v14 count];
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:v15];
  [v4 setObject:v16 forKeyedSubscript:@"NumberOfSettings"];

  if (v15)
  {
    v17 = +[NSMutableArray arrayWithCapacity:v15];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v18 = [v14 allKeys];
    id v19 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          [v17 addObject:*(void *)(*((void *)&v42 + 1) + 8 * (void)j)];
        }
        id v20 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKeyedSubscript:@"Settings"];
  }
  CFStringRef v23 = [v3 objectForKeyedSubscript:@"UserDeviceState"];
  uint64_t v24 = objc_opt_new();
  uint64_t v25 = [v23 objectForKeyedSubscript:@"user"];
  CFStringRef v26 = (void *)v25;
  if (v25) {
    CFStringRef v27 = (const __CFString *)v25;
  }
  else {
    CFStringRef v27 = @"None";
  }
  [v24 setObject:v27 forKeyedSubscript:@"user"];

  uint64_t v28 = [v23 objectForKeyedSubscript:@"screenTimeEnabled"];
  CFStringRef v29 = (void *)v28;
  if (v28) {
    v30 = (void *)v28;
  }
  else {
    v30 = &__kCFBooleanFalse;
  }
  [v24 setObject:v30 forKeyedSubscript:@"screenTimeEnabled"];

  uint64_t v31 = [v23 objectForKeyedSubscript:@"managementEnabled"];
  v32 = (void *)v31;
  if (v31) {
    v33 = (void *)v31;
  }
  else {
    v33 = &__kCFBooleanFalse;
  }
  [v24 setObject:v33 forKeyedSubscript:@"managementEnabled"];

  uint64_t v34 = [v23 objectForKeyedSubscript:@"passcodeOwner"];
  id v35 = (void *)v34;
  if (v34) {
    CFStringRef v36 = (const __CFString *)v34;
  }
  else {
    CFStringRef v36 = @"None";
  }
  [v24 setObject:v36 forKeyedSubscript:@"passcodeOwner"];

  uint64_t v37 = [v23 objectForKeyedSubscript:@"lastFamilyCheckinDate"];
  long long v38 = (void *)v37;
  if (v37) {
    CFStringRef v39 = (const __CFString *)v37;
  }
  else {
    CFStringRef v39 = @"None";
  }
  [v24 setObject:v39 forKeyedSubscript:@"lastFamilyCheckinDate"];

  [v4 setObject:v24 forKeyedSubscript:@"UserDeviceState"];
  id v40 = [v4 copy];

  return v40;
}

+ (id)_descriptionDictionaryForCheckinResponsePayloadDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 objectForKeyedSubscript:@"Blueprints"];
  id v7 = [v6 count];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:v7];
  [v5 setObject:v8 forKeyedSubscript:@"NumberOfBlueprints"];

  if (v7)
  {
    uint64_t v9 = [a1 _descriptionDictionariesForBlueprintDictionaries:v6];
    [v5 setObject:v9 forKeyedSubscript:@"Blueprints"];
  }
  id v10 = [v4 objectForKeyedSubscript:@"Settings"];
  id v11 = [v10 count];
  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:v11];
  [v5 setObject:v12 forKeyedSubscript:@"NumberOfSettings"];

  if (v11)
  {
    uint64_t v13 = [a1 _descriptionDictionariesForSettingsDictionaries:v10];
    [v5 setObject:v13 forKeyedSubscript:@"Settings"];
  }
  CFStringRef v14 = [v4 objectForKeyedSubscript:@"UserDeviceState"];
  id v15 = objc_opt_new();
  uint64_t v16 = [v14 objectForKeyedSubscript:@"user"];
  v17 = (void *)v16;
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  else {
    CFStringRef v18 = @"None";
  }
  [v15 setObject:v18 forKeyedSubscript:@"user"];

  uint64_t v19 = [v14 objectForKeyedSubscript:@"screenTimeEnabled"];
  id v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (void *)v19;
  }
  else {
    uint64_t v21 = &__kCFBooleanFalse;
  }
  [v15 setObject:v21 forKeyedSubscript:@"screenTimeEnabled"];

  uint64_t v22 = [v14 objectForKeyedSubscript:@"managementEnabled"];
  CFStringRef v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = (void *)v22;
  }
  else {
    uint64_t v24 = &__kCFBooleanFalse;
  }
  [v15 setObject:v24 forKeyedSubscript:@"managementEnabled"];

  uint64_t v25 = [v14 objectForKeyedSubscript:@"passcodeOwner"];
  CFStringRef v26 = (void *)v25;
  if (v25) {
    CFStringRef v27 = (const __CFString *)v25;
  }
  else {
    CFStringRef v27 = @"None";
  }
  [v15 setObject:v27 forKeyedSubscript:@"passcodeOwner"];

  uint64_t v28 = [v14 objectForKeyedSubscript:@"lastFamilyCheckinDate"];
  CFStringRef v29 = (void *)v28;
  if (v28) {
    CFStringRef v30 = (const __CFString *)v28;
  }
  else {
    CFStringRef v30 = @"None";
  }
  [v15 setObject:v30 forKeyedSubscript:@"lastFamilyCheckinDate"];

  [v5 setObject:v15 forKeyedSubscript:@"UserDeviceState"];
  id v31 = [v5 copy];

  return v31;
}

+ (id)_descriptionDictionaryForBlueprintPayloadDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 objectForKeyedSubscript:@"Blueprints"];

  id v7 = [v6 count];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:v7];
  [v5 setObject:v8 forKeyedSubscript:@"NumberOfBlueprints"];

  if (v7)
  {
    uint64_t v9 = [a1 _descriptionDictionariesForBlueprintDictionaries:v6];
    [v5 setObject:v9 forKeyedSubscript:@"Blueprints"];
  }
  return v5;
}

+ (id)_descriptionDictionaryForSettingsPayloadDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 objectForKeyedSubscript:@"Settings"];

  id v7 = [v6 count];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:v7];
  [v5 setObject:v8 forKeyedSubscript:@"NumberOfSettings"];

  if (v7)
  {
    uint64_t v9 = [a1 _descriptionDictionariesForSettingsDictionaries:v6];
    [v5 setObject:v9 forKeyedSubscript:@"Settings"];
  }
  return v5;
}

+ (id)_descriptionDictionaryForPayloadDictionary:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinRequest"])
  {
    uint64_t v9 = [a1 _descriptionDictionaryForCheckinRequestPayloadDictionary:v6];
LABEL_7:
    id v10 = (_UNKNOWN **)v9;
LABEL_8:

    uint64_t v8 = v10;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinResponse"])
  {
    uint64_t v9 = [a1 _descriptionDictionaryForCheckinResponsePayloadDictionary:v6];
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeBlueprints"])
  {
    uint64_t v9 = [a1 _descriptionDictionaryForBlueprintPayloadDictionary:v6];
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageRequest"])
  {
    id v10 = &off_100310058;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageResponse"])
  {
    id v10 = &off_100310080;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeAskForTimeRequest"])
  {
    uint64_t v9 = STGetDescriptionForAskForTimeRequestDictionary();
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeAskForTimeResponse"])
  {
    uint64_t v9 = STGetDescriptionForAskForTimeResponseDictionary();
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"RMUnifiedTransportPayloadTypeFamilySettings"])
  {
    uint64_t v9 = [a1 _descriptionDictionaryForSettingsPayloadDictionary:v6];
    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(STUnifiedTransportPayload *)self payloadType];
  id v5 = [(STUnifiedTransportPayload *)self UUID];
  id v6 = [(STUnifiedTransportPayload *)self payloadDictionary];
  id v7 = [(STUnifiedTransportPayload *)self payloadType];
  uint64_t v8 = +[STUnifiedTransportPayload _descriptionDictionaryForPayloadDictionary:v6 type:v7];
  uint64_t v9 = +[NSString stringWithFormat:@"<%@ { Type: %@ UUID: %@ Contents: %@}>", v3, v4, v5, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUnifiedTransportPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STUnifiedTransportPayload;
  id v5 = [(STUnifiedTransportPayload *)&v34 init];
  if (v5)
  {
    id v33 = objc_alloc((Class)NSSet);
    uint64_t v32 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v33, "initWithObjects:", v32, v31, v30, v29, v28, v27, v26, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"payloadDictionary"];
    payloadDictionary = v5->_payloadDictionary;
    v5->_payloadDictionary = (NSDictionary *)v15;

    id v17 = objc_alloc((Class)NSSet);
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    id v21 = objc_msgSend(v17, "initWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"userInfo"];
    CFStringRef v23 = (NSMutableDictionary *)[v22 mutableCopy];
    userInfo = v5->_userInfo;
    v5->_userInfo = v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  payloadDictionary = self->_payloadDictionary;
  id v5 = a3;
  [v5 encodeObject:payloadDictionary forKey:@"payloadDictionary"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
}

+ (id)classFallbacksForKeyedArchiver
{
  return &off_10030FFF0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPayload:self->_payloadDictionary userInfo:self->_userInfo];
  [v4 setDestinations:self->_destinations];
  return v4;
}

- (NSDictionary)payloadDictionary
{
  return self->_payloadDictionary;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_payloadDictionary, 0);
}

@end