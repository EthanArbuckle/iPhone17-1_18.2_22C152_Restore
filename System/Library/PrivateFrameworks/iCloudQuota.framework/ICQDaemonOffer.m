@interface ICQDaemonOffer
+ (BOOL)placeholderExistsInString:(id)a3;
+ (id)defaultPlaceholderKeys;
+ (id)persistenceKey;
+ (id)placeholderKeysInString:(id)a3 fromKeys:(id)a4;
+ (id)stringWithPlaceholderFormat:(id)a3;
+ (id)stringWithPlaceholderFormat:(id)a3 alternateString:(id)a4;
+ (id)stringWithPlaceholderFormat:(id)a3 substitutions:(id)a4;
+ (id)substitutionForPlaceholderKey:(id)a3 outIsBelowMin:(BOOL *)a4;
+ (id)substitutionsForPlaceholderKeys:(id)a3;
+ (id)substitutionsForPlaceholderKeys:(id)a3 checkIfBelowMin:(BOOL)a4 outIsMissingSubstitution:(BOOL *)a5;
- (BOOL)isBuddyOffer;
- (BOOL)isDefaultOffer;
- (BOOL)isEventOffer;
- (BOOL)isPremiumOffer;
- (ICQDaemonOffer)initWithDictionary:(id)a3;
- (NSArray)internalAppLaunchLinks;
- (NSArray)savedEligibleAppLaunchLinks;
- (NSDictionary)lockScreenInfo;
- (NSString)notificationID;
- (NSString)offerId;
- (_ICQAlertSpecification)internalAlertSpecification;
- (_ICQFollowupSpecification)internalFollowupSpecification;
- (id)_eligibleAppLaunchLinks;
- (id)_initWithAccount:(id)a3 error:(id)a4;
- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4;
- (id)_mutablePersistenceDictionary;
- (id)alertSpecificationForAlertKey:(id)a3;
- (id)appLaunchLinkForBundleID:(id)a3;
- (int64_t)level;
- (int64_t)requestType;
- (void)_addSampleAlert;
- (void)_initSubclassFromServerDictionary;
- (void)cacheLiftUIContent;
- (void)setInternalAlertSpecification:(id)a3;
- (void)setInternalAppLaunchLinks:(id)a3;
- (void)setInternalFollowupSpecification:(id)a3;
- (void)setNotificationID:(id)a3;
- (void)setOfferId:(id)a3;
- (void)setSavedEligibleAppLaunchLinks:(id)a3;
- (void)setServerDictionary:(id)a3;
@end

@implementation ICQDaemonOffer

+ (id)persistenceKey
{
  return @"_ICQCachedOfferInternal";
}

- (int64_t)level
{
  v2 = [(ICQDaemonPersisted *)self serverDictionary];
  v3 = [v2 objectForKeyedSubscript:@"type"];
  int64_t v4 = _ICQLevelForString(v3);

  return v4;
}

- (BOOL)isBuddyOffer
{
  v2 = [(ICQDaemonPersisted *)self serverDictionary];
  char v3 = _ICQIsBuddyOfferDictionary(v2);

  return v3;
}

- (BOOL)isDefaultOffer
{
  v2 = [(ICQDaemonPersisted *)self serverDictionary];
  char v3 = _ICQIsDefaultOfferDictionary(v2);

  return v3;
}

- (BOOL)isPremiumOffer
{
  v2 = [(ICQDaemonPersisted *)self serverDictionary];
  char v3 = _ICQIsPremiumOfferDictionary(v2);

  return v3;
}

- (BOOL)isEventOffer
{
  v2 = [(ICQDaemonPersisted *)self serverDictionary];
  char v3 = _ICQIsEventOfferDictionary(v2);

  return v3;
}

- (int64_t)requestType
{
  if ([(ICQDaemonOffer *)self isBuddyOffer]) {
    return 4;
  }
  if ([(ICQDaemonOffer *)self isPremiumOffer]) {
    return 2;
  }
  if ([(ICQDaemonOffer *)self isDefaultOffer]) {
    return 1;
  }
  if ([(ICQDaemonOffer *)self isEventOffer]) {
    return 5;
  }
  return 3;
}

- (void)cacheLiftUIContent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ICQDaemonOffer *)self internalAppLaunchLinks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cacheLiftUIContentIfNeeded];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (ICQDaemonOffer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQDaemonOffer;
  uint64_t v5 = [(ICQDaemonPersisted *)&v9 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eligibleAppLaunchLinks"];
    savedEligibleAppLaunchLinks = v5->_savedEligibleAppLaunchLinks;
    v5->_savedEligibleAppLaunchLinks = (NSArray *)v6;

    [(ICQDaemonOffer *)v5 _initSubclassFromServerDictionary];
  }

  return v5;
}

- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICQDaemonOffer;
  return [(ICQDaemonPersisted *)&v5 _initWithAccount:a3 serverDictionary:a4];
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICQDaemonOffer;
  return [(ICQDaemonPersisted *)&v5 _initWithAccount:a3 error:a4];
}

- (void)setServerDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQDaemonOffer;
  [(ICQDaemonPersisted *)&v4 setServerDictionary:a3];
  [(ICQDaemonOffer *)self _initSubclassFromServerDictionary];
}

- (id)_mutablePersistenceDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)ICQDaemonOffer;
  uint64_t v3 = [(ICQDaemonPersisted *)&v8 _mutablePersistenceDictionary];
  objc_super v4 = v3;
  if (v3)
  {
    if (self->_notificationID) {
      notificationID = (__CFString *)self->_notificationID;
    }
    else {
      notificationID = &stru_1F2DCE430;
    }
    [v3 setObject:notificationID forKey:@"notificationId"];
    uint64_t v6 = [(ICQDaemonOffer *)self _eligibleAppLaunchLinks];
    [v4 setObject:v6 forKey:@"eligibleAppLaunchLinks"];
  }
  return v4;
}

- (void)_initSubclassFromServerDictionary
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "no followupInfo provided", v1, 2u);
}

- (id)_eligibleAppLaunchLinks
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = self->_internalAppLaunchLinks;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEligible", (void)v13))
        {
          long long v10 = [v9 appId];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];
  return v11;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
}

- (_ICQAlertSpecification)internalAlertSpecification
{
  return self->_internalAlertSpecification;
}

- (void)setInternalAlertSpecification:(id)a3
{
}

- (_ICQFollowupSpecification)internalFollowupSpecification
{
  return self->_internalFollowupSpecification;
}

- (void)setInternalFollowupSpecification:(id)a3
{
}

- (NSArray)internalAppLaunchLinks
{
  return self->_internalAppLaunchLinks;
}

- (void)setInternalAppLaunchLinks:(id)a3
{
}

- (NSArray)savedEligibleAppLaunchLinks
{
  return self->_savedEligibleAppLaunchLinks;
}

- (void)setSavedEligibleAppLaunchLinks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEligibleAppLaunchLinks, 0);
  objc_storeStrong((id *)&self->_internalAppLaunchLinks, 0);
  objc_storeStrong((id *)&self->_internalFollowupSpecification, 0);
  objc_storeStrong((id *)&self->_internalAlertSpecification, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
}

- (id)appLaunchLinkForBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_savedEligibleAppLaunchLinks containsObject:v4])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_internalAppLaunchLinks;
    id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = objc_msgSend(v9, "appId", (void)v13);
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }
        id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSDictionary)lockScreenInfo
{
  v2 = [(ICQDaemonPersisted *)self serverDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"lockScreenInfo"];

  return (NSDictionary *)v3;
}

- (id)alertSpecificationForAlertKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v4 = [(ICQDaemonPersisted *)self serverDictionary];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"inlineAlertInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      objc_super v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v13 = [v12 objectForKeyedSubscript:@"alertKey"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [v13 isEqualToString:v17])
            {
              uint64_t v14 = _ICQAlertSpecificationForServerDict(v12);

              objc_super v9 = (void *)v14;
            }
          }
          else
          {
            long long v13 = _ICQGetLogSystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v12;
              _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "expected inlineAlertInfo to be NSArray<NSDictionary *> but found %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }
    else
    {
      objc_super v9 = 0;
    }

    uint64_t v5 = v16;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (BOOL)placeholderExistsInString:(id)a3
{
  return [a3 containsString:@"%$"];
}

+ (id)defaultPlaceholderKeys
{
  if (defaultPlaceholderKeys_onceToken[0] != -1) {
    dispatch_once(defaultPlaceholderKeys_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)defaultPlaceholderKeys_sPlaceholderKeysDefault;
  return v2;
}

void __50__ICQDaemonOffer_Internal__defaultPlaceholderKeys__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PhotoLibrarySize";
  v4[1] = @"PhotoLibraryUploadSize";
  v4[2] = @"PhotosVideosCount";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)defaultPlaceholderKeys_sPlaceholderKeysDefault;
  defaultPlaceholderKeys_sPlaceholderKeysDefault = v2;
}

+ (id)placeholderKeysInString:(id)a3 fromKeys:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 componentsSeparatedByString:@"%$"];
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v8 = objc_opt_new();
    if ((unint64_t)[v6 count] >= 2)
    {
      unint64_t v9 = 1;
      do
      {
        uint64_t v10 = [v6 objectAtIndexedSubscript:v9];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v5;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              if ([v10 hasPrefix:v16])
              {
                [v8 addObject:v16];
                goto LABEL_15;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_15:

        ++v9;
      }
      while (v9 < [v6 count]);
    }
    uint64_t v7 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (id)substitutionForPlaceholderKey:(id)a3 outIsBelowMin:(BOOL *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"PhotoLibrarySize"])
  {
    id v6 = +[ICQDaemonOfferConditions photosLibrarySize];
LABEL_3:
    uint64_t v7 = 1;
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"PhotoLibraryUploadSize"])
  {
    unint64_t v9 = +[ICQDaemonOfferConditions photosLibraryUploadSize];
    id v6 = v9;
    if (!a4 || [v9 integerValue] >= 100000000) {
      goto LABEL_3;
    }
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = 100000000;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "photosLibraryUploadSize: %@ < %lld -- recommending alternate string", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v7 = 1;
    *a4 = 1;
  }
  else
  {
    if (![v5 isEqualToString:@"PhotosVideosCount"])
    {
      id v6 = 0;
      goto LABEL_22;
    }
    id v11 = +[ICQDaemonOfferConditions photosVideosCount];
    id v6 = v11;
    if (a4 && [v11 integerValue] <= 0)
    {
      uint64_t v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        id v17 = v6;
        __int16 v18 = 2048;
        uint64_t v19 = 1;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "photosVideosCount: %@ < %lld -- recommending alternate string", (uint8_t *)&v16, 0x16u);
      }

      *a4 = 1;
    }
    uint64_t v7 = 2;
  }
LABEL_4:
  if (!v6)
  {
LABEL_22:
    uint64_t v8 = 0;
    goto LABEL_23;
  }
  if (v7 == 2)
  {
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v13 setLocale:v14];

    [v13 setNumberStyle:1];
    [v13 setUsesGroupingSeparator:1];
    [v13 setMaximumFractionDigits:0];
    uint64_t v8 = [v13 stringFromNumber:v6];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v6, "longLongValue"), 2);
  }
LABEL_23:

  return v8;
}

+ (id)substitutionsForPlaceholderKeys:(id)a3 checkIfBelowMin:(BOOL)a4 outIsMissingSubstitution:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v22 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v25;
    *(void *)&long long v11 = 138412546;
    long long v21 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        char v23 = 0;
        uint64_t v16 = objc_msgSend(a1, "substitutionForPlaceholderKey:outIsBelowMin:", v15, &v23, v21);
        id v17 = (void *)v16;
        if (v6 && v23)
        {
          if (a5) {
            goto LABEL_15;
          }
        }
        else
        {
          if (v16)
          {
            [v22 setObject:v16 forKeyedSubscript:v15];
            goto LABEL_16;
          }
          __int16 v18 = _ICQGetLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v29 = @"%$";
            __int16 v30 = 2112;
            uint64_t v31 = v15;
            _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "no substitution for placeholder %@%@", buf, 0x16u);
          }

          if (a5) {
LABEL_15:
          }
            *a5 = 1;
        }
LABEL_16:
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v12);
  }

  uint64_t v19 = (void *)[v22 copy];
  return v19;
}

+ (id)substitutionsForPlaceholderKeys:(id)a3
{
  return (id)[a1 substitutionsForPlaceholderKeys:a3 checkIfBelowMin:0 outIsMissingSubstitution:0];
}

+ (id)stringWithPlaceholderFormat:(id)a3
{
  return (id)[a1 stringWithPlaceholderFormat:a3 alternateString:0];
}

+ (id)stringWithPlaceholderFormat:(id)a3 alternateString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 placeholderExistsInString:v6])
  {
    id v8 = [a1 defaultPlaceholderKeys];
    id v9 = [a1 placeholderKeysInString:v6 fromKeys:v8];

    char v15 = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    long long v11 = [a1 substitutionsForPlaceholderKeys:v10 checkIfBelowMin:v7 != 0 outIsMissingSubstitution:&v15];

    if (v7 && v15)
    {
      id v12 = v7;
    }
    else
    {
      id v12 = [a1 stringWithPlaceholderFormat:v6 substitutions:v11];
    }
    id v13 = v12;
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

+ (id)stringWithPlaceholderFormat:(id)a3 substitutions:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 componentsSeparatedByString:@"%$"];
  if ((unint64_t)[v7 count] > 1)
  {
    id v26 = v5;
    id v9 = [v7 objectAtIndexedSubscript:0];
    uint64_t v10 = (void *)[v9 mutableCopy];

    if ((unint64_t)[v7 count] >= 2)
    {
      unint64_t v11 = 1;
      do
      {
        id v12 = [v7 objectAtIndexedSubscript:v11];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = v6;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              __int16 v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              if ([v12 hasPrefix:v18])
              {
                uint64_t v20 = [NSString stringWithFormat:@"%@%@", @"%$", v18];
                long long v21 = _ICQGetLogSystem();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = [v13 objectForKeyedSubscript:v18];
                  *(_DWORD *)buf = 138543618;
                  id v32 = v20;
                  __int16 v33 = 2112;
                  v34 = v22;
                  _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "substituting for placeholder %{public}@ = %@", buf, 0x16u);
                }
                char v23 = [v13 objectForKeyedSubscript:v18];
                [v10 appendString:v23];

                long long v24 = objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v18, "length"));
                [v10 appendString:v24];

                goto LABEL_19;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        id v13 = [NSString stringWithFormat:@"%@%@", @"%$", v12];
        uint64_t v19 = _ICQGetLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v13;
          _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "missing substitution for substring \"%{public}@\"", buf, 0xCu);
        }

        [v10 appendString:v13];
LABEL_19:

        ++v11;
      }
      while (v11 < [v7 count]);
    }
    id v8 = (id)[v10 copy];

    id v5 = v26;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (void)_addSampleAlert
{
  uint64_t v3 = [(ICQDaemonPersisted *)self serverDictionary];
  id v7 = (id)[v3 mutableCopy];

  if (![(ICQDaemonOffer *)self level])
  {
    id v4 = _ICQStringForLevel(2);
    [v7 setObject:v4 forKey:@"type"];
  }
  id v5 = +[_ICQAlertSpecification alertSpecificationDictionarySampleForLevel:2];
  [v7 setObject:v5 forKey:@"alertInfo"];
  id v6 = (void *)[v7 copy];
  [(ICQDaemonOffer *)self setServerDictionary:v6];
}

@end