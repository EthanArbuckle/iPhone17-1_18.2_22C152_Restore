@interface LSBundleRecord
+ (id)sr_bundleRecordWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)sr_isSocialNetworking;
- (BOOL)sr_supportsDataGeneration;
- (BOOL)sr_supportsMessagingIntents;
- (BOOL)sr_supportsVOIP;
@end

@implementation LSBundleRecord

+ (id)sr_bundleRecordWithIdentifier:(id)a3 error:(id *)a4
{
  v4 = +[LSBundleRecord bundleRecordWithBundleIdentifier:a3 allowPlaceholder:0 error:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return v4;
}

- (BOOL)sr_supportsVOIP
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([[-[LSBundleRecord UIBackgroundModes](self, "UIBackgroundModes") containsObject:@"voip"]])return 1; {
  id v4 = [(LSBundleRecord *)self appTags];
  }

  return [v4 containsObject:@"any-telephony"];
}

- (BOOL)sr_supportsMessagingIntents
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((objc_msgSend(-[LSBundleRecord supportedIntents](self, "supportedIntents"), "containsObject:", @"INSendMessageIntent") & 1) == 0)
    {
      id v5 = [(LSBundleRecord *)self applicationExtensionRecords];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v3 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (!v3) {
        return (char)v3;
      }
      id v6 = v3;
      uint64_t v7 = *(void *)v11;
LABEL_10:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v8) supportedIntents] containsObject:@"INSendMessageIntent") break; {
        if (v6 == (id)++v8)
        }
        {
          id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(v3) = 0;
          if (v6) {
            goto LABEL_10;
          }
          return (char)v3;
        }
      }
    }
    LOBYTE(v3) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [(LSBundleRecord *)self supportedIntents];
      LOBYTE(v3) = [v4 containsObject:@"INSendMessageIntent"];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (BOOL)sr_supportsDataGeneration
{
  id v2 = [[-[LSBundleRecord infoDictionary](self, "infoDictionary") objectForKey:@"SRResearchDataGeneration" ofClass:objc_opt_class()];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }

  return [v2 BOOLValue];
}

- (BOOL)sr_isSocialNetworking
{
  objc_opt_class();
  id v3 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = (LSBundleRecord *)[(LSBundleRecord *)self containingBundleRecord];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v3 = v4;
      }
      else {
        id v3 = 0;
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  id v5 = [[-[LSBundleRecord iTunesMetadata](v3, "iTunesMetadata") genreIdentifier];
  id v6 = [[-[LSBundleRecord iTunesMetadata](v3, "iTunesMetadata") genre];
  id v7 = [(LSBundleRecord *)v3 infoDictionary];
  uint64_t v8 = objc_opt_class();
  id v9 = [v7 objectForKey:@"SBMatchingApplicationGenres" ofClass:v8 valuesOfClass:objc_opt_class()];
  if (qword_10006EB78 != -1)
  {
    dispatch_once(&qword_10006EB78, &stru_10005D010);
    long long v10 = qword_10006EB80;
    if (!os_log_type_enabled((os_log_t)qword_10006EB80, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  long long v10 = qword_10006EB80;
  if (os_log_type_enabled((os_log_t)qword_10006EB80, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    int v12 = 138478595;
    id v13 = [(LSBundleRecord *)self bundleIdentifier];
    __int16 v14 = 2050;
    id v15 = v5;
    __int16 v16 = 2113;
    id v17 = v6;
    __int16 v18 = 2113;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bundle id: %{private}@, genre id: %{public}llu, genre: %{private}@, genres: %{private}@", (uint8_t *)&v12, 0x2Au);
  }
LABEL_10:
  if (v5 == (id)6005 || ([v6 isEqualToString:@"Social Networking"] & 1) != 0) {
    return 1;
  }
  else {
    return [v9 containsObject:@"Social Networking"];
  }
}

@end