@interface SOSLegacyContactsManager
+ (BOOL)authorizedToUseContactStore;
+ (id)contactStore;
+ (void)preloadContactStoreIfNecessary;
- (BOOL)SOSLegacyContactsExist;
- (FKFriendsManager)friendsManager;
- (SOSLegacyContactsManager)init;
- (id)SOSLegacyContacts;
- (id)SOSLegacyContactsDestinations;
- (id)_SOSDestinationsForFriend:(id)a3;
- (id)_SOSFormattedDestinationForFriend:(id)a3 withDestinationNumber:(id)a4;
- (id)_SOSFriends;
- (id)_contactFromFriend:(id)a3;
- (void)contactStoreDidChange;
- (void)dealloc;
- (void)setFriendsManager:(id)a3;
@end

@implementation SOSLegacyContactsManager

- (SOSLegacyContactsManager)init
{
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.contacts"])
  {
    v9.receiver = self;
    v9.super_class = (Class)SOSLegacyContactsManager;
    v3 = [(SOSLegacyContactsManager *)&v9 init];
    if (v3)
    {
      [MEMORY[0x1E4F62358] setGroupSize:3 domain:@"com.apple.mobilephone"];
      [MEMORY[0x1E4F62358] setMaxGroupCount:2 domain:@"com.apple.mobilephone"];
      [MEMORY[0x1E4F62358] setFriendsChangedExternallyNotificationName:@"SOSFriendsManagerChangedNotification" domain:@"com.apple.mobilephone"];
      uint64_t v4 = [MEMORY[0x1E4F62358] managerForDomain:@"com.apple.mobilephone"];
      friendsManager = v3->_friendsManager;
      v3->_friendsManager = (FKFriendsManager *)v4;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_SOSFriendsChangedExternallyHandler, @"SOSFriendsManagerChangedNotification", 0, CFNotificationSuspensionBehaviorDrop);
    }
    self = v3;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SOSFriendsManagerChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)SOSLegacyContactsManager;
  [(SOSLegacyContactsManager *)&v4 dealloc];
}

- (id)SOSLegacyContacts
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(SOSLegacyContactsManager *)self _SOSFriends];
  uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v4;
        v5 = *(void **)(*((void *)&v24 + 1) + 8 * v4);
        v6 = [(SOSLegacyContactsManager *)self _SOSDestinationsForFriend:v5];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              v12 = objc_opt_new();
              v13 = [v5 displayName];
              [v12 setName:v13];

              v14 = [(SOSLegacyContactsManager *)self _SOSFormattedDestinationForFriend:v5 withDestinationNumber:v11];
              [v12 setPhoneNumber:v14];

              [v3 addObject:v12];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }

  return v3;
}

- (BOOL)SOSLegacyContactsExist
{
  v2 = [(SOSLegacyContactsManager *)self SOSLegacyContacts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_SOSFriends
{
  BOOL v3 = [(FKFriendsManager *)self->_friendsManager allPeople];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(FKFriendsManager *)self->_friendsManager friendGroups];
    v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 friends];
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    uint64_t v9 = [v7 filteredArrayUsingPredicate:v8];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }

  return v9;
}

uint64_t __39__SOSLegacyContactsManager__SOSFriends__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)SOSLegacyContactsDestinations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(SOSLegacyContactsManager *)self _SOSFriends];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(SOSLegacyContactsManager *)self _SOSDestinationsForFriend:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_SOSDestinationsForFriend:(id)a3
{
  return (id)[a3 metadataValueForKey:@"SOSFriendsDestinationNumbersArrayMetaKey"];
}

- (id)_SOSFormattedDestinationForFriend:(id)a3 withDestinationNumber:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(SOSLegacyContactsManager *)self _contactFromFriend:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 phoneNumbers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "value", (void)v19);
          v15 = [v14 unformattedInternationalStringValue];

          if ([v15 isEqualToString:v6])
          {
            uint64_t v16 = [v13 value];
            v10 = [v16 formattedStringValue];

            goto LABEL_12;
          }
        }
        v10 = (void *)[v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "length", (void)v19))
  {
    id v17 = v6;

    v10 = v17;
  }

  return v10;
}

- (id)_contactFromFriend:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a3 abRecordGUID];
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() contactStore];
    v10[0] = *MEMORY[0x1E4F1AEE0];
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v9 = 0;
    id v6 = [v4 unifiedContactWithIdentifier:v3 keysToFetch:v5 error:&v9];
    uint64_t v7 = v9;

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_5:

  return v6;
}

- (void)contactStoreDidChange
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SOSLegacyContactsChangedNotification" object:0];
}

+ (void)preloadContactStoreIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadContactStoreIfNecessary_once_0 != -1) {
    dispatch_once(&preloadContactStoreIfNecessary_once_0, block);
  }
}

void __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sos.contactStoreQueue", 0);
  BOOL v3 = (void *)__contactStoreQueue_0;
  __contactStoreQueue_0 = (uint64_t)v2;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__contactStoreQueue_0, block);
}

uint64_t __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) authorizedToUseContactStore];
  if (result)
  {
    __contactStore_0 = [MEMORY[0x1E4F1B980] storeWithOptions:1];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)contactStore
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  [a1 preloadContactStoreIfNecessary];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SOSLegacyContactsManager_contactStore__block_invoke;
  block[3] = &unk_1E60640A0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__contactStoreQueue_0, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__SOSLegacyContactsManager_contactStore__block_invoke(uint64_t a1)
{
}

+ (BOOL)authorizedToUseContactStore
{
  if (authorizedToUseContactStore_onceToken_0 != -1) {
    dispatch_once(&authorizedToUseContactStore_onceToken_0, &__block_literal_global_24);
  }
  return authorizedToUseContactStore_contactStoreAuthorized_0;
}

void __55__SOSLegacyContactsManager_authorizedToUseContactStore__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  authorizedToUseContactStore_contactStoreAuthorized_0 = v0 == 3;
  if (v0 != 3) {
    NSLog(&cfstr_NotAuthorizedT.isa, v0);
  }
}

- (FKFriendsManager)friendsManager
{
  return self->_friendsManager;
}

- (void)setFriendsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end