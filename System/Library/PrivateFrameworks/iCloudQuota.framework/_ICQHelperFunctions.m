@interface _ICQHelperFunctions
+ (BOOL)_checkOptions:(id)a3 forKey:(id)a4;
+ (BOOL)_requestedDefaultOfferInOptions:(id)a3;
+ (BOOL)_requestedEventOfferInOptions:(id)a3;
+ (BOOL)_requestedFetchOffersInOptions:(id)a3;
+ (BOOL)_requestedPremiumOfferInOptions:(id)a3;
+ (BOOL)backupRestoreCompletedInOptions:(id)a3;
+ (BOOL)defaultKeyExists:(id)a3;
+ (BOOL)isBackupEnabledForAccount:(id)a3 accountStore:(id)a4;
+ (BOOL)isICPLEnabledForAccount:(id)a3;
+ (BOOL)isPhotosLibraryIncludedInBackupForAccount:(id)a3;
+ (BOOL)isServerMockingEnabled;
+ (BOOL)shouldDisplay:(id)a3 forReason:(id)a4 dismissedInSession:(BOOL)a5 supressUntil:(double)a6;
+ (BOOL)userDefaultsBoolValueForKey:(id)a3;
+ (id)_darwinNotificationNameForRequestType:(int64_t)a3;
+ (id)_fetchNextBackupSize:(id)a3;
+ (id)_getOfferDescriptionFromRequestType:(int64_t)a3;
+ (id)_remoteBackupSizeOperationQueue;
+ (id)base64EncodeString:(id)a3;
+ (id)defaultStringValueForKey:(id)a3;
+ (id)defaultValueForKey:(id)a3;
+ (id)dictionaryForKey:(id)a3 from:(id)a4;
+ (id)findPlaceholdersInString:(id)a3;
+ (id)followUpGroupIdentifierForString:(id)a3;
+ (id)followUpIdentifierPrefixForRequestType:(int64_t)a3;
+ (id)getStringFromNumber:(id)a3;
+ (id)lastUpdatedForReason:(id)a3 decayUntil:(double)a4;
+ (id)numberForKey:(id)a3 from:(id)a4;
+ (id)parseTemplates:(id)a3;
+ (id)replaceWordsIn:(id)a3 with:(id)a4;
+ (id)standardDateFormat:(unint64_t)a3;
+ (id)stringFromTemplates:(id)a3 key:(id)a4;
+ (id)usedCapacityForVolume:(id)a3;
+ (id)userDefaultsDictionaryForKey:(id)a3;
+ (id)userDefaultsObjectForKey:(id)a3;
+ (id)userDefaultsStringForKey:(id)a3;
+ (int64_t)_getOfferRequestTypeFromOptions:(id)a3 bundleId:(id)a4 isBuddy:(BOOL)a5;
+ (int64_t)_offerRequestTypeForStub:(id)a3;
+ (void)appLaunchLinkTrackerSetLastShownDate:(id)a3 forBundleID:(id)a4;
+ (void)bubbleBannerTrackLastDismissed:(id)a3 forReason:(id)a4;
+ (void)getOriginalPhotosSizeWithCompletion:(id)a3;
+ (void)getPhotosLibrarySizeWithCompletion:(id)a3;
+ (void)remoteBackupSizeForAccount:(id)a3 timeoutInSeconds:(double)a4 completion:(id)a5;
+ (void)setUserDefaultsBool:(BOOL)a3 forKey:(id)a4;
+ (void)setUserDefaultsObject:(id)a3 forKey:(id)a4;
@end

@implementation _ICQHelperFunctions

+ (BOOL)shouldDisplay:(id)a3 forReason:(id)a4 dismissedInSession:(BOOL)a5 supressUntil:(double)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F179C8] defaultStore];
  v12 = objc_msgSend(v11, "aa_primaryAppleAccount");

  if (v12)
  {
    v13 = +[ICQBubbleBannerTracker shared];
    char v14 = [v13 account:v12 shouldDisplay:v9 forReason:v10 dismissedInSession:v7 supressUntil:a6];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (int64_t)_getOfferRequestTypeFromOptions:(id)a3 bundleId:(id)a4 isBuddy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = [a1 _requestedFetchOffersInOptions:v8];
  int v11 = [a1 _requestedPremiumOfferInOptions:v8];
  if ([a1 _requestedDefaultOfferInOptions:v8])
  {
    int v12 = [a1 _requestedEventOfferInOptions:v8];
LABEL_4:
    int v10 = 1;
    uint64_t v14 = 1;
    goto LABEL_6;
  }
  int v13 = [v9 isEqualToString:@"com.apple.icq"];
  int v12 = [a1 _requestedEventOfferInOptions:v8];
  if (v13) {
    goto LABEL_4;
  }
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = 3;
  if (v12) {
    uint64_t v15 = 5;
  }
  if (v5) {
    uint64_t v15 = 4;
  }
  if (v11) {
    uint64_t v15 = 2;
  }
  if (v10) {
    int64_t v16 = v14;
  }
  else {
    int64_t v16 = v15;
  }

  return v16;
}

+ (BOOL)_checkOptions:(id)a3 forKey:(id)a4
{
  v4 = [a3 objectForKeyedSubscript:a4];
  BOOL v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)_requestedPremiumOfferInOptions:(id)a3
{
  return [a1 _checkOptions:a3 forKey:@"isPremiumOffer"];
}

+ (BOOL)_requestedFetchOffersInOptions:(id)a3
{
  return [a1 _checkOptions:a3 forKey:@"isForFetchOffers"];
}

+ (BOOL)_requestedEventOfferInOptions:(id)a3
{
  return [a1 _checkOptions:a3 forKey:@"isEventOffer"];
}

+ (BOOL)_requestedDefaultOfferInOptions:(id)a3
{
  return [a1 _checkOptions:a3 forKey:@"isDefaultOffer"];
}

+ (id)_darwinNotificationNameForRequestType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return off_1E6A52060[a3 - 1];
  }
}

+ (id)_getOfferDescriptionFromRequestType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"premium";
  }
  else {
    return off_1E6A52030[a3];
  }
}

+ (BOOL)userDefaultsBoolValueForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  BOOL v5 = [v3 standardUserDefaults];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

+ (id)replaceWordsIn:(id)a3 with:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      int v11 = v5;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        int v13 = [v6 objectForKey:v12];
        id v5 = [v11 stringByReplacingOccurrencesOfString:v12 withString:v13];

        ++v10;
        int v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)stringFromTemplates:(id)a3 key:(id)a4
{
  id v5 = (__CFString *)a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v9 = @"default";
    uint64_t v8 = v6;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  return v10;
}

+ (id)findPlaceholdersInString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 containsString:@"%$"])
  {
    id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v5 = [v3 componentsSeparatedByCharactersInSet:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasPrefix:", @"%$", (void)v15)) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    int v13 = (void *)[v6 copy];
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

+ (void)setUserDefaultsBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = [v5 standardUserDefaults];
  [v7 setBool:v4 forKey:v6];
}

+ (void)setUserDefaultsObject:(id)a3 forKey:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 standardUserDefaults];
  [v8 setObject:v7 forKey:v6];
}

+ (id)userDefaultsObjectForKey:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)userDefaultsDictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 userDefaultsObjectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[_ICQHelperFunctions userDefaultsDictionaryForKey:]();
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)userDefaultsStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 userDefaultsObjectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[_ICQHelperFunctions userDefaultsStringForKey:]();
    }

    id v6 = 0;
  }

  return v6;
}

+ (BOOL)defaultKeyExists:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.cloud.quota", &keyExistsAndHasValidFormat)) {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (id)defaultValueForKey:(id)a3
{
  BOOL v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.cloud.quota");
  return v3;
}

+ (id)defaultStringValueForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[_ICQHelperFunctions defaultValueForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    if (v4)
    {
      id v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "defaults key %@ is not of correct type", (uint8_t *)&v8, 0xCu);
      }
    }
    id v5 = 0;
  }

  return v5;
}

+ (id)parseTemplates:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"format", (void)v17);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          int v13 = [v10 objectForKeyedSubscript:@"key"];

          if (v13)
          {
            uint64_t v14 = [v10 objectForKeyedSubscript:@"format"];
            long long v15 = [v10 objectForKeyedSubscript:@"key"];
            [v4 setObject:v14 forKey:v15];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)standardDateFormat:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateStyle:a3];
  [v4 setTimeStyle:a3];
  id v5 = [v4 dateFormat];

  return v5;
}

+ (BOOL)isServerMockingEnabled
{
  return +[_ICQHelperFunctions defaultKeyExists:@"_ICQEnableServerMocking"];
}

+ (id)getStringFromNumber:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v4 setLocale:v5];

  [v4 setNumberStyle:1];
  [v4 setUsesGroupingSeparator:1];
  [v4 setMaximumFractionDigits:0];
  uint64_t v6 = [v4 stringFromNumber:v3];

  return v6;
}

+ (id)base64EncodeString:(id)a3
{
  if (a3)
  {
    id v3 = [a3 dataUsingEncoding:4];
    id v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Invalid string", v7, 2u);
    }

    id v4 = 0;
  }
  return v4;
}

+ (BOOL)backupRestoreCompletedInOptions:(id)a3
{
  return [a1 _checkOptions:a3 forKey:@"backupRestoreComplete"];
}

+ (int64_t)_offerRequestTypeForStub:(id)a3
{
  id v3 = a3;
  if ([v3 isDefaultOffer])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isPremiumOffer])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isBuddyOffer])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEventOffer])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

+ (id)followUpIdentifierPrefixForRequestType:(int64_t)a3
{
  id v3 = @"com.apple.iCloudQuotaDaemon.ICQFollowupRegular";
  if (a3 == 5) {
    id v3 = @"com.apple.iCloudQuotaDaemon.ICQFollowupEvent";
  }
  if (a3 == 2) {
    return @"com.apple.iCloudQuotaDaemon.ICQFollowupPremium";
  }
  else {
    return v3;
  }
}

+ (BOOL)isBackupEnabledForAccount:(id)a3 accountStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 accountStore];

  if (v7)
  {
    LOBYTE(v8) = [v6 isEnabledForDataclass:*MEMORY[0x1E4F17A68]];
  }
  else
  {
    id v9 = [v5 enabledDataclassesForAccount:v6];

    uint64_t v8 = [v9 containsObject:*MEMORY[0x1E4F17A68]];
    id v6 = v9;
  }

  return v8;
}

+ (BOOL)isICPLEnabledForAccount:(id)a3
{
  return [a3 isEnabledForDataclass:*MEMORY[0x1E4F17A88]];
}

+ (BOOL)isPhotosLibraryIncludedInBackupForAccount:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F78010];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 personaIdentifier];

  uint64_t v7 = (void *)[v5 initWithDelegate:0 eventQueue:0 personaIdentifier:v6];
  LOBYTE(v4) = [v7 isBackupEnabledForDomainName:@"CameraRollDomain"];

  return (char)v4;
}

+ (void)getPhotosLibrarySizeWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F8B920] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___ICQHelperFunctions_getPhotosLibrarySizeWithCompletion___block_invoke;
  v6[3] = &unk_1E6A51F78;
  id v7 = v3;
  id v5 = v3;
  [v4 getLibrarySizes:v6];
}

+ (void)getOriginalPhotosSizeWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v6 = v3;
  id v5 = v3;
  PLRequestSizeOfOriginalResourcesForLibrary();
}

+ (id)usedCapacityForVolume:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = ICQUsedDiskSpaceForVolume(v3);
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  uint64_t v6 = *MEMORY[0x1E4F1C810];
  uint64_t v7 = *MEMORY[0x1E4F1C800];
  v32[0] = *MEMORY[0x1E4F1C810];
  v32[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v25 = 0;
  id v9 = [v5 resourceValuesForKeys:v8 error:&v25];
  id v10 = v25;

  if (v9)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:v6];
    uint64_t v12 = [v9 objectForKeyedSubscript:v7];
    unint64_t v13 = [v11 unsignedLongLongValue];
    if (v13 <= [v12 unsignedLongLongValue])
    {
      uint64_t v17 = [v12 unsignedLongLongValue];
      unint64_t v14 = v17 - [v11 unsignedLongLongValue];
      if (v14 > v4)
      {
        long long v18 = _ICQGetLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v23 = [NSNumber numberWithUnsignedLongLong:v4];
          v24 = [NSNumber numberWithUnsignedLongLong:v14];
          *(_DWORD *)buf = 138543874;
          id v27 = v3;
          __int16 v28 = 2114;
          v29 = v23;
          __int16 v30 = 2114;
          v31 = v24;
          _os_log_error_impl(&dword_1D5851000, v18, OS_LOG_TYPE_ERROR, "Somehow reclaimable space is bigger than used space for %{public}@: %{public}@, %{public}@", buf, 0x20u);
        }
        long long v19 = NSNumber;
        unint64_t v20 = v4;
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
    long long v19 = NSNumber;
    unint64_t v20 = v4 - v14;
LABEL_12:
    long long v16 = [v19 numberWithUnsignedLongLong:v20];
    v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v3;
      __int16 v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "Used Capacity on %{public}@: %{public}@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  long long v15 = _ICQGetLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[_ICQHelperFunctions usedCapacityForVolume:]();
  }

  long long v16 = [NSNumber numberWithUnsignedLongLong:v4];
LABEL_15:

  return v16;
}

+ (void)remoteBackupSizeForAccount:(id)a3 timeoutInSeconds:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v11 = dispatch_queue_create("com.apple.icloud.quota.remote-backup-size-timeout-queue", v10);

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  uint64_t v12 = (void *)MEMORY[0x1E4F28B48];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke;
  v26[3] = &unk_1E6A51FC8;
  id v13 = v8;
  v29 = &v31;
  id v30 = a1;
  id v27 = v13;
  id v14 = v9;
  id v28 = v14;
  uint64_t v15 = [v12 blockOperationWithBlock:v26];
  long long v16 = (void *)v32[5];
  v32[5] = v15;

  dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2;
  v23 = &unk_1E6A51FF0;
  id v25 = &v31;
  id v18 = v14;
  id v24 = v18;
  dispatch_after(v17, v11, &v20);
  long long v19 = objc_msgSend(a1, "_remoteBackupSizeOperationQueue", v20, v21, v22, v23);
  [v19 addOperation:v32[5]];

  _Block_object_dispose(&v31, 8);
}

+ (id)_fetchNextBackupSize:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  id v26 = 0;
  unint64_t v4 = [v3 getBackupListWithError:&v26];
  id v5 = v26;
  uint64_t v6 = [v3 backupDeviceUUID];
  if (v5)
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_ICQHelperFunctions _fetchNextBackupSize:]();
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  id v9 = (id)[v8 countByEnumeratingWithState:&v22 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "backupUUID", (void)v22);
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_15;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v22 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  uint64_t v15 = [v9 snapshots];
  long long v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_1];

  dispatch_time_t v17 = _ICQGetLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v16;
    _os_log_debug_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEBUG, "Backups array %@, current device uuid %@, matchingBackup %@, available snapshots %@", buf, 0x2Au);
  }

  id v18 = NSNumber;
  long long v19 = [v16 lastObject];
  uint64_t v20 = objc_msgSend(v18, "numberWithLongLong:", objc_msgSend(v19, "estimatedRestoreSize"));

  return v20;
}

+ (id)_remoteBackupSizeOperationQueue
{
  if (_remoteBackupSizeOperationQueue_onceToken != -1) {
    dispatch_once(&_remoteBackupSizeOperationQueue_onceToken, &__block_literal_global_140);
  }
  v2 = (void *)_remoteBackupSizeOperationQueue_operationQueue;
  return v2;
}

+ (id)dictionaryForKey:(id)a3 from:(id)a4
{
  unint64_t v4 = [a4 objectForKeyedSubscript:a3];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)numberForKey:(id)a3 from:(id)a4
{
  unint64_t v4 = [a4 objectForKeyedSubscript:a3];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)followUpGroupIdentifierForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FLGroupIdentifierDevice"])
  {
    unint64_t v4 = (id *)MEMORY[0x1E4F5B728];
  }
  else if ([v3 isEqualToString:@"FLGroupIdentifierNoGroup"])
  {
    unint64_t v4 = (id *)MEMORY[0x1E4F5B738];
  }
  else if ([v3 isEqualToString:@"FLGroupIdentifierAppleServices"])
  {
    unint64_t v4 = (id *)MEMORY[0x1E4F5B720];
  }
  else
  {
    int v5 = [v3 isEqualToString:@"FLGroupIdentifierNewDeviceOutreach"];
    unint64_t v4 = (id *)MEMORY[0x1E4F5B718];
    if (v5) {
      unint64_t v4 = (id *)MEMORY[0x1E4F5B730];
    }
  }
  id v6 = *v4;

  return v6;
}

+ (void)appLaunchLinkTrackerSetLastShownDate:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ICQAppLaunchLinkTracker shared];
  [v7 setLastShownDate:v6 forBundleID:v5];
}

+ (void)bubbleBannerTrackLastDismissed:(id)a3 forReason:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F179C8] defaultStore];
  id v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (v7)
  {
    id v8 = +[ICQBubbleBannerTracker shared];
    [v8 trackLastDismissed:v7 date:v9 reason:v5];
  }
}

+ (id)lastUpdatedForReason:(id)a3 decayUntil:(double)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F179C8] defaultStore];
  id v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (v7)
  {
    id v8 = +[ICQBubbleBannerTracker shared];
    id v9 = [v8 account:v7 lastUpdated:v5 decayUntil:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)userDefaultsDictionaryForKey:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D5851000, v0, OS_LOG_TYPE_DEBUG, "Could not find a dictionary at key %@", v1, 0xCu);
}

+ (void)userDefaultsStringForKey:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D5851000, v0, OS_LOG_TYPE_DEBUG, "Could not find a string at key %@", v1, 0xCu);
}

+ (void)usedCapacityForVolume:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D5851000, v1, OS_LOG_TYPE_ERROR, "Failed to get resource values for %@: %@", v2, 0x16u);
}

+ (void)_fetchNextBackupSize:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1D5851000, v0, OS_LOG_TYPE_ERROR, "Unable to retrieve remote backup info: %@", v1, 0xCu);
}

@end