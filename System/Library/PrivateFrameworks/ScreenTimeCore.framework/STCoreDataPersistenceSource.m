@interface STCoreDataPersistenceSource
- (id)_coreUserForIdentifier:(id)a3 inContext:(id)a4;
- (id)userDataWithIdentifier:(id)a3;
- (void)saveCommunicationSafetySettingsForDSID:(id)a3 checkForUnsafePhotos:(BOOL)a4 communicationSafetyNotificationEnabled:(BOOL)a5 communicationSafetyAnalyticsEnabled:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation STCoreDataPersistenceSource

- (void)saveCommunicationSafetySettingsForDSID:(id)a3 checkForUnsafePhotos:(BOOL)a4 communicationSafetyNotificationEnabled:(BOOL)a5 communicationSafetyAnalyticsEnabled:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  v12 = +[STAdminPersistenceController sharedController];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __184__STCoreDataPersistenceSource_saveCommunicationSafetySettingsForDSID_checkForUnsafePhotos_communicationSafetyNotificationEnabled_communicationSafetyAnalyticsEnabled_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7788;
  v14[4] = self;
  id v15 = v11;
  BOOL v16 = a4;
  BOOL v17 = a5;
  BOOL v18 = a6;
  id v13 = v11;
  [v12 performBackgroundTaskAndWait:v14];
}

void __184__STCoreDataPersistenceSource_saveCommunicationSafetySettingsForDSID_checkForUnsafePhotos_communicationSafetyNotificationEnabled_communicationSafetyAnalyticsEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) _coreUserForIdentifier:*(void *)(a1 + 40) inContext:v3];
  v5 = v4;
  if (v4)
  {
    [v4 setIsCommunicationSafetySendingRestricted:*(unsigned __int8 *)(a1 + 48)];
    [v5 setIsCommunicationSafetyReceivingRestricted:*(unsigned __int8 *)(a1 + 48)];
    [v5 setIsCommunicationSafetyNotificationEnabled:*(unsigned __int8 *)(a1 + 49)];
    [v5 setIsCommunicationSafetyAnalyticsEnabled:*(unsigned __int8 *)(a1 + 50)];
    v6 = +[STAdminPersistenceController sharedController];
    id v9 = 0;
    char v7 = [v6 saveContext:v3 error:&v9];
    id v8 = v9;

    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1DA519000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Could not save Communication Safety settings changes. Error: %@", buf, 0xCu);
    }
  }
}

- (id)userDataWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  BOOL v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  v5 = +[STAdminPersistenceController sharedController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__STCoreDataPersistenceSource_userDataWithIdentifier___block_invoke;
  v9[3] = &unk_1E6BC77B0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 performBackgroundTaskAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__STCoreDataPersistenceSource_userDataWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id v21 = [*(id *)(a1 + 32) _coreUserForIdentifier:*(void *)(a1 + 40) inContext:a2];
  if (v21)
  {
    id v3 = [STUserData alloc];
    uint64_t v19 = *(void *)(a1 + 40);
    v20 = v3;
    BOOL v18 = [v21 givenName];
    unsigned int v17 = [v21 isParent];
    id v4 = [v21 localUserDeviceState];
    v5 = [v21 effectivePasscode];
    BOOL v6 = [v5 length] != 0;
    uint64_t v7 = [v21 screenTimeEnabled];
    char v8 = [v21 syncingEnabled];
    char v9 = [v21 isCommunicationSafetySendingRestricted];
    char v10 = [v21 isCommunicationSafetyNotificationEnabled];
    char v11 = [v21 isCommunicationSafetyAnalyticsEnabled];
    uint64_t v12 = [v21 familyMemberType];
    BYTE3(v16) = v11;
    BYTE2(v16) = v10;
    BYTE1(v16) = v9;
    LOBYTE(v16) = v8;
    uint64_t v13 = -[STUserData initWithIdentifier:givenName:isParent:isRemote:hasPasscode:screenTimeEnabled:syncingEnabled:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:familyMemberType:](v20, "initWithIdentifier:givenName:isParent:isRemote:hasPasscode:screenTimeEnabled:syncingEnabled:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:familyMemberType:", v19, v18, v17, v4 == 0, v6, v7, v16, v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)_coreUserForIdentifier:(id)a3 inContext:(id)a4
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setNumberStyle:1];
  BOOL v6 = [v5 numberFromString:v4];

  uint64_t v7 = +[STCoreUser fetchRequestForUsersWithDSID:v6];
  char v8 = [v7 execute:0];
  char v9 = v8;
  if (v8)
  {
    char v10 = [v8 firstObject];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

@end