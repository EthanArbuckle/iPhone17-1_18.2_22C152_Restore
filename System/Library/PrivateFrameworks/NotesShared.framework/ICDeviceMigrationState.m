@interface ICDeviceMigrationState
+ (id)allDeviceMigrationStatesInContext:(id)a3;
+ (id)currentDeviceMigrationStateForAccount:(id)a3;
+ (id)currentDeviceMigrationStateForAccount:(id)a3 createIfNecessary:(BOOL)a4;
+ (id)deviceMigrationStateWithDeviceIdentifier:(id)a3 account:(id)a4;
+ (id)deviceMigrationStateWithDeviceIdentifier:(id)a3 context:(id)a4;
+ (id)deviceMigrationStatesByAccountIDInContext:(id)a3;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)identifierForDeviceIdentifier:(id)a3;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newDeviceMigrationStateWithDeviceIdentifier:(id)a3 account:(id)a4;
+ (id)stringFromMigrationState:(signed __int16)a3;
- (BOOL)isInICloudAccount;
- (BOOL)isMigrating;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (id)ic_loggingValues;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)recordType;
- (id)recordZoneName;
- (void)deleteFromLocalDatabase;
- (void)objectWasDeletedFromCloud;
- (void)objectWasDeletedFromCloudByAnotherDevice;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
@end

@implementation ICDeviceMigrationState

+ (id)deviceMigrationStateWithDeviceIdentifier:(id)a3 context:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  v8 = [v6 predicateWithFormat:@"%K == %@", @"deviceIdentifier", a3];
  v9 = [a1 deviceMigrationStatesMatchingPredicate:v8 context:v7];

  v10 = [v9 firstObject];

  return v10;
}

+ (id)deviceMigrationStateWithDeviceIdentifier:(id)a3 account:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  v8 = [v6 predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"deviceIdentifier", a3, @"account", v7];
  v9 = [v7 managedObjectContext];

  v10 = [a1 deviceMigrationStatesMatchingPredicate:v8 context:v9];
  v11 = [v10 firstObject];

  return v11;
}

+ (id)newDeviceMigrationStateWithDeviceIdentifier:(id)a3 account:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 identifierForDeviceIdentifier:v7];
  v9 = [v6 managedObjectContext];
  v10 = (void *)[a1 newObjectWithIdentifier:v8 context:v9];

  v11 = [v6 persistentStore];
  [v10 assignToPersistentStore:v11];

  [v10 setAccount:v6];
  [v10 setDeviceIdentifier:v7];

  return v10;
}

+ (id)currentDeviceMigrationStateForAccount:(id)a3
{
  return (id)[a1 currentDeviceMigrationStateForAccount:a3 createIfNecessary:1];
}

+ (id)currentDeviceMigrationStateForAccount:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 identifier];
  v8 = [v6 managedObjectContext];
  v9 = [a1 deviceMigrationStateWithDeviceIdentifier:v7 context:v8];

  if (!v9 && v4)
  {
    v9 = (void *)[a1 newDeviceMigrationStateWithDeviceIdentifier:v7 account:v6];
    v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v9 setStateModificationDate:v10];
  }
  id v11 = [v9 account];

  if (v11 != v6)
  {
    v12 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ICDeviceMigrationState currentDeviceMigrationStateForAccount:createIfNecessary:](v9, v6, v12);
    }

    [v9 setAccount:v6];
  }

  return v9;
}

+ (id)allDeviceMigrationStatesInContext:(id)a3
{
  return (id)[a1 deviceMigrationStatesMatchingPredicate:0 context:a3];
}

+ (id)deviceMigrationStatesByAccountIDInContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke;
  v8[3] = &unk_1E64A6000;
  id v11 = a1;
  id v5 = v4;
  id v9 = v5;
  v10 = &v12;
  [v5 performBlockAndWait:v8];
  id v6 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 48) allDeviceMigrationStatesInContext:*(void *)(a1 + 32)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 account];
        id v9 = [v8 identifier];

        if (v9)
        {
          v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", objc_msgSend(v7, "state"));
          id v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          os_log_t v12 = [v7 account];
          v13 = [v12 identifier];
          [v11 setObject:v10 forKeyedSubscript:v13];
        }
        else
        {
          os_log_t v12 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke_cold_1(v18, v7, &v19, v12);
          }
          v10 = v12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v4);
  }
}

- (BOOL)isMigrating
{
  return (int)[(ICDeviceMigrationState *)self state] >= 2
      && (int)[(ICDeviceMigrationState *)self state] < 7;
}

+ (id)stringFromMigrationState:(signed __int16)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E64A6020[a3];
  }
  return v3;
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICDeviceMigrationState;
  uint64_t v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(ICDeviceMigrationState *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICDeviceMigrationState_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E64A4218;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = v6;
  return v7;
}

void __42__ICDeviceMigrationState_ic_loggingValues__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "stringFromMigrationState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"state"];

  uint64_t v3 = [*(id *)(a1 + 40) stateModificationDate];
  id v5 = (id)v3;
  if (v3) {
    uint64_t v4 = (__CFString *)v3;
  }
  else {
    uint64_t v4 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"stateModificationDate"];
}

+ (id)identifierForDeviceIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"DeviceMigrationState_%@", a3];
}

- (id)recordType
{
  return @"MigrationState";
}

- (id)recordZoneName
{
  return @"Metadata";
}

- (BOOL)isInICloudAccount
{
  return 1;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a3;
  v8 = +[ICAccount cloudKitAccountWithIdentifier:a4 context:a5];
  id v9 = [v7 recordName];

  id v10 = +[ICDeviceMigrationState deviceMigrationStateWithDeviceIdentifier:v9 account:v8];

  return v10;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ICAccount cloudKitAccountWithIdentifier:v8 context:a5];
  id v11 = [v9 recordID];
  objc_super v12 = [v11 recordName];
  v13 = (void *)[a1 newDeviceMigrationStateWithDeviceIdentifier:v12 account:v10];

  [v13 mergeCloudKitRecord:v9 accountID:v8 approach:0];
  [v13 setServerRecord:v9];

  [v13 setInCloud:1];
  [v13 clearChangeCountWithReason:@"Created migration state"];

  return v13;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  if (a3)
  {
    id v6 = (void *)MEMORY[0x1E4F836F8];
    id v7 = [(ICDeviceMigrationState *)self className];
    id v8 = ICStringFromSyncingApproach(a3);
    [v6 handleFailedAssertWithCondition:"__objc_no", "-[ICDeviceMigrationState(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v7, v8 functionName simulateCrash showAlert format];

    id v9 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICDeviceMigrationState;
    id v9 = [(ICCloudSyncingObject *)&v13 makeCloudKitRecordForApproach:0 mergeableFieldState:a4];
    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICDeviceMigrationState state](self, "state"));
    [v9 setObject:v10 forKeyedSubscript:@"State"];

    id v11 = [(ICDeviceMigrationState *)self stateModificationDate];
    [v9 setObject:v11 forKeyedSubscript:@"StateModificationDate"];
  }
  return v9;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F836F8];
    objc_super v13 = [(ICDeviceMigrationState *)self className];
    long long v14 = ICStringFromSyncingApproach(a5);
    [v12 handleFailedAssertWithCondition:"__objc_no", "-[ICDeviceMigrationState(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v13, v14 functionName simulateCrash showAlert format];

LABEL_15:
    BOOL v33 = 0;
    goto LABEL_16;
  }
  v38.receiver = self;
  v38.super_class = (Class)ICDeviceMigrationState;
  if (![(ICCloudSyncingObject *)&v38 mergeCloudKitRecord:v10 accountID:v11 approach:0 mergeableFieldState:a6])goto LABEL_15; {
  long long v15 = [v10 objectForKeyedSubscript:@"StateModificationDate"];
  }
  if (v15)
  {
    uint64_t v16 = [(ICDeviceMigrationState *)self stateModificationDate];
    if (!v16
      || (long long v17 = (void *)v16,
          [(ICDeviceMigrationState *)self stateModificationDate],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = objc_msgSend(v15, "ic_isLaterThanDate:", v18),
          v18,
          v17,
          v19))
    {
      [(ICDeviceMigrationState *)self setStateModificationDate:v15];
      v20 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v35 = objc_msgSend(v10, "ic_loggingIdentifier");
        *(_DWORD *)buf = 138412802;
        v40 = v35;
        __int16 v41 = 2112;
        id v42 = v11;
        __int16 v43 = 2112;
        v44 = v15;
        _os_log_debug_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_DEBUG, "Merged ICDeviceMigrationState data from record: %@ for accountID: %@. Setting stateModificationDate to %@.", buf, 0x20u);
      }
      uint64_t v21 = [v10 objectForKeyedSubscript:@"State"];

      if (v21)
      {
        v22 = [v10 objectForKeyedSubscript:@"State"];
        unsigned __int16 v23 = [v22 integerValue];

        if ((unsigned __int16)[(ICDeviceMigrationState *)self state] != v23)
        {
          uint64_t v24 = (__int16)v23;
          [(ICDeviceMigrationState *)self setState:v24];
          v25 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v36 = objc_msgSend(v10, "ic_loggingIdentifier");
            v37 = +[ICDeviceMigrationState stringFromMigrationState:v24];
            *(_DWORD *)buf = 138412802;
            v40 = v36;
            __int16 v41 = 2112;
            id v42 = v11;
            __int16 v43 = 2112;
            v44 = v37;
            _os_log_debug_impl(&dword_1C3A61000, v25, OS_LOG_TYPE_DEBUG, "Merged ICDeviceMigrationState data from record: %@ for accountID: %@. Setting state to %@.", buf, 0x20u);
          }
        }
      }
    }
  }
  v26 = [v10 recordID];
  v27 = [v26 recordName];
  [(ICDeviceMigrationState *)self setDeviceIdentifier:v27];

  v28 = objc_opt_class();
  v29 = [(ICDeviceMigrationState *)self deviceIdentifier];
  v30 = [v28 identifierForDeviceIdentifier:v29];
  [(ICDeviceMigrationState *)self setIdentifier:v30];

  v31 = [(ICDeviceMigrationState *)self managedObjectContext];
  v32 = +[ICAccount cloudKitAccountInContext:v31];

  BOOL v33 = 1;
  [v32 setNeedsToBeFetchedFromCloud:1];

LABEL_16:
  return v33;
}

- (void)objectWasDeletedFromCloud
{
  v4.receiver = self;
  v4.super_class = (Class)ICDeviceMigrationState;
  [(ICCloudSyncingObject *)&v4 objectWasDeletedFromCloud];
  uint64_t v3 = [(ICDeviceMigrationState *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  v4.receiver = self;
  v4.super_class = (Class)ICDeviceMigrationState;
  [(ICCloudSyncingObject *)&v4 objectWasDeletedFromCloudByAnotherDevice];
  uint64_t v3 = [(ICDeviceMigrationState *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ICDeviceMigrationState *)self managedObjectContext];
  id v11 = +[ICAccount cloudKitAccountWithIdentifier:v9 context:v10];

  objc_super v12 = [v11 userRecordName];

  if (!v12)
  {
    objc_super v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICDeviceMigrationState(CloudKit) objectWasFetchedFromCloudWithRecord:accountID:force:](v11, v13);
    }

    long long v14 = +[ICCloudContext sharedContext];
    long long v15 = [v14 containerForAccountID:v9];

    uint64_t v16 = +[ICCloudContext userRecordNameForContainer:v15];
    if (v16) {
      [v11 setUserRecordName:v16];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)ICDeviceMigrationState;
  [(ICCloudSyncingObject *)&v17 objectWasFetchedFromCloudWithRecord:v8 accountID:v9 force:v5];
}

- (void)deleteFromLocalDatabase
{
  id v3 = [(ICDeviceMigrationState *)self managedObjectContext];
  [v3 deleteObject:self];
}

+ (void)currentDeviceMigrationStateForAccount:(NSObject *)a3 createIfNecessary:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [a1 identifier];
  id v6 = [a2 identifier];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Repairing relationship from device migration state (%@) to account (%@)", (uint8_t *)&v7, 0x16u);
}

void __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Device migration state (%@) does not have an account identifier", a1, 0xCu);
}

@end