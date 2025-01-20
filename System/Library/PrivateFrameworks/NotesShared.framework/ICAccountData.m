@interface ICAccountData
+ (ICAccountData)accountDataWithIdentifier:(id)a3 context:(id)a4;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newAccountDataForAccount:(id)a3;
+ (id)newAccountDataWithIdentifier:(id)a3 account:(id)a4;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (BOOL)isDeletable;
- (BOOL)isInICloudAccount;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)mergeWithMergeableData:(id)a3;
- (BOOL)needsToBeDeletedFromCloud;
- (ICTTMergeableWallClockValue)mergeableCryptoPassphraseVerifier;
- (NSData)cryptoPassphraseVerifier;
- (NSString)recordType;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)recordName;
- (id)recordZoneName;
- (void)mergeableCryptoPassphraseVerifier;
- (void)saveMergeableDataIfNeeded;
- (void)setCryptoPassphraseVerifier:(id)a3;
- (void)updateChangeCountWithReason:(id)a3;
- (void)updateSupportsV1Neo:(id)a3;
- (void)updateSupportsV1NeoWithAccountDevices:(id)a3;
@end

@implementation ICAccountData

- (BOOL)isDeletable
{
  return 0;
}

- (void)updateChangeCountWithReason:(id)a3
{
  id v4 = a3;
  if ([(ICAccountData *)self markedForDeletion]) {
    [(ICCloudSyncingObject *)self setMarkedForDeletion:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICAccountData;
  [(ICCloudSyncingObject *)&v5 updateChangeCountWithReason:v4];
}

- (void)updateSupportsV1Neo:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_super v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAccountData updateSupportsV1Neo:](v5);
  }

  v6 = [(ICAccountData *)self account];
  int v7 = [v6 accountType];

  if (v7 == 1)
  {
    objc_initWeak(&location, self);
    v8 = +[ICCompatibilityController sharedController];
    v9 = [(ICAccountData *)self account];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__ICAccountData_updateSupportsV1Neo___block_invoke;
    v10[3] = &unk_1E64A6880;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    [v8 devicesForAccount:v9 completionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ICAccountData *)self updateSupportsV1NeoWithAccountDevices:MEMORY[0x1E4F1CBF0]];
    if (v4) {
      v4[2](v4);
    }
  }
}

void __37__ICAccountData_updateSupportsV1Neo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v5 = [WeakRetained managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ICAccountData_updateSupportsV1Neo___block_invoke_2;
  v7[3] = &unk_1E64A6858;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v6 = v3;
  id v8 = v6;
  id v9 = *(id *)(a1 + 32);
  [v5 performBlockAndWait:v7];

  objc_destroyWeak(&v10);
}

uint64_t __37__ICAccountData_updateSupportsV1Neo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained updateSupportsV1NeoWithAccountDevices:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)updateSupportsV1NeoWithAccountDevices:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = NSStringFromSelector(sel_supportsV1Neo);
  id v6 = [(ICAccountData *)self primitiveValueForKey:v5];

  if (!v6)
  {
    if (ICInternalSettingsIsLockedNotesV1NeoEnabled())
    {
      v13 = [(ICAccountData *)self account];
      int v14 = [v13 accountType];

      if (v14 == 3)
      {
        int v7 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v15 = [(ICAccountData *)self account];
          v16 = [v15 shortLoggingDescription];
          int v20 = 138412290;
          v21 = v16;
          v17 = "Enabling v1 Neo support for local account {account: %@}";
LABEL_18:
          _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v20, 0xCu);

          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (v4)
      {
        int v18 = objc_msgSend(v4, "ic_allSatisfy:", &__block_literal_global_32);
        int v7 = os_log_create("com.apple.notes", "Crypto");
        BOOL v19 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if (v18)
        {
          if (v19)
          {
            v15 = [(ICAccountData *)self account];
            v16 = [v15 shortLoggingDescription];
            int v20 = 138412290;
            v21 = v16;
            v17 = "Enabling v1 Neo support for cloud account {account: %@}";
            goto LABEL_18;
          }
LABEL_19:

          [(ICAccountData *)self setSupportsV1Neo:1];
          goto LABEL_13;
        }
        if (!v19) {
          goto LABEL_12;
        }
        id v8 = [(ICAccountData *)self account];
        id v9 = [v8 shortLoggingDescription];
        int v20 = 138412290;
        v21 = v9;
        id v10 = "Not updating v1 Neo support state for cloud account because there are unsupported devices {account: %@}";
      }
      else
      {
        int v7 = os_log_create("com.apple.notes", "Crypto");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        id v8 = [(ICAccountData *)self account];
        id v9 = [v8 shortLoggingDescription];
        int v20 = 138412290;
        v21 = v9;
        id v10 = "Not updating v1 Neo support state because compatible devices couldn't be fetched {account: %@}";
      }
    }
    else
    {
      int v7 = os_log_create("com.apple.notes", "Crypto");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      id v8 = [(ICAccountData *)self account];
      id v9 = [v8 shortLoggingDescription];
      int v20 = 138412290;
      v21 = v9;
      id v10 = "Not updating v1 Neo support state since feature flag is disabled {account: %@}";
    }
    v11 = v7;
    uint32_t v12 = 12;
    goto LABEL_11;
  }
  int v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(ICAccountData *)self account];
    id v9 = [v8 shortLoggingDescription];
    int v20 = 138412546;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v6;
    id v10 = "Not updating v1 Neo support state since explicit value was set {account: %@, supportsV1Neo: %@}";
    v11 = v7;
    uint32_t v12 = 22;
LABEL_11:
    _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v20, v12);
  }
LABEL_12:

LABEL_13:
}

BOOL __55__ICAccountData_updateSupportsV1NeoWithAccountDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notesVersion] > 12;
}

- (ICTTMergeableWallClockValue)mergeableCryptoPassphraseVerifier
{
  id v3 = NSStringFromSelector(sel_cryptoPassphraseVerifier);
  id v4 = [(ICAccountData *)self primitiveValueForKey:v3];

  if (+[ICTTMergeableWallClockValue canParseData:v4])
  {
    objc_super v5 = [[ICTTMergeableWallClockValue alloc] initWithData:v4];
  }
  else
  {
    id v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountData mergeableCryptoPassphraseVerifier](v6);
    }

    int v7 = [ICTTMergeableWallClockValue alloc];
    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    objc_super v5 = [(ICTTMergeableWallClockValue *)v7 initWithValue:v4 timestamp:v8];
  }
  return v5;
}

- (NSData)cryptoPassphraseVerifier
{
  v2 = [(ICAccountData *)self mergeableCryptoPassphraseVerifier];
  id v3 = [v2 value];

  return (NSData *)v3;
}

- (void)setCryptoPassphraseVerifier:(id)a3
{
  id v4 = a3;
  id v9 = [[ICTTMergeableWallClockValue alloc] initWithValue:v4 timestamp:0];

  objc_super v5 = NSStringFromSelector(sel_cryptoPassphraseVerifier);
  [(ICAccountData *)self willChangeValueForKey:v5];

  id v6 = [(ICTTMergeableWallClockValue *)v9 serialize];
  int v7 = NSStringFromSelector(sel_cryptoPassphraseVerifier);
  [(ICAccountData *)self setPrimitiveValue:v6 forKey:v7];

  id v8 = NSStringFromSelector(sel_cryptoPassphraseVerifier);
  [(ICAccountData *)self didChangeValueForKey:v8];
}

- (void)saveMergeableDataIfNeeded
{
  id v2 = [(ICAccountData *)self account];
  [v2 saveSubFolderMergeableDataIfNeeded];
}

- (BOOL)mergeWithMergeableData:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICAccountData *)self account];
  char v6 = [v5 mergeWithSubFolderMergeableData:v4];

  return v6;
}

+ (ICAccountData)accountDataWithIdentifier:(id)a3 context:(id)a4
{
  char v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"identifier = %@", a3];
  id v9 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v7);

  id v10 = [v9 firstObject];

  return (ICAccountData *)v10;
}

+ (id)newAccountDataForAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  char v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = (void *)[a1 newAccountDataWithIdentifier:v7 account:v5];

  return v8;
}

+ (id)newAccountDataWithIdentifier:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 managedObjectContext];
  id v9 = (void *)[a1 newObjectWithIdentifier:v7 context:v8];

  [v9 setAccount:v6];
  id v10 = [v6 persistentStore];

  [v9 assignToPersistentStore:v10];
  [v9 updateSupportsV1Neo:0];
  return v9;
}

- (BOOL)isInICloudAccount
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ICAccountData *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ICAccountData_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A4528;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __44__ICAccountData_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) account];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInICloudAccount];
}

- (id)recordZoneName
{
  return @"Notes";
}

- (id)recordName
{
  return @"AccountData";
}

- (NSString)recordType
{
  return (NSString *)@"AccountData";
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a3;
  uint64_t v8 = +[ICAccount cloudKitAccountWithIdentifier:a4 context:a5];
  char v9 = [v8 accountDataCreateIfNecessary];
  id v10 = v9;
  if (v7
    && ([v9 recordID],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:v7],
        v11,
        v12))
  {
    id v13 = v10;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"0" functionName:"+[ICAccountData(CloudKit) newCloudObjectForRecord:accountID:context:]" simulateCrash:1 showAlert:0 format:@"Not reached. ExistingCloudObjectForRecordID should not have returned nil for a CloudKit account"];
  return 0;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (!a5)
  {
    v31.receiver = self;
    v31.super_class = (Class)ICAccountData;
    if (![(ICCloudSyncingObject *)&v31 mergeCloudKitRecord:v10 accountID:a4 approach:0 mergeableFieldState:v11])goto LABEL_13; {
    v15 = objc_msgSend(v10, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"MergeableData");
    }
    if (v15)
    {
      [(ICAccountData *)self mergeWithMergeableData:v15];
      [(ICAccountData *)self saveMergeableDataIfNeeded];
    }
    v16 = [v10 objectForKeyedSubscript:@"LockedNotesMode"];

    if (v16)
    {
      objc_opt_class();
      v17 = [v10 objectForKeyedSubscript:@"LockedNotesMode"];
      int v18 = ICCheckedDynamicCast();
      -[ICAccountData setLockedNotesMode:](self, "setLockedNotesMode:", (__int16)[v18 integerValue]);
    }
    BOOL v19 = [v10 objectForKeyedSubscript:@"CryptoPassphraseVerifier"];
    if (+[ICTTMergeableWallClockValue canParseData:v19])
    {
      if (v19)
      {
        int v20 = [(ICAccountData *)self mergeableCryptoPassphraseVerifier];
        v21 = [[ICTTMergeableWallClockValue alloc] initWithData:v19];
        if (v20)
        {
          if ([(ICTTMergeableWallClockValue *)v20 merge:v21] != 2)
          {
LABEL_20:

            goto LABEL_21;
          }
          __int16 v22 = [(ICTTMergeableWallClockValue *)v20 serialize];
          v23 = NSStringFromSelector(sel_cryptoPassphraseVerifier);
          [(ICAccountData *)self setPrimitiveValue:v22 forKey:v23];

          uint64_t v24 = v20;
        }
        else
        {
          v29 = NSStringFromSelector(sel_cryptoPassphraseVerifier);
          [(ICAccountData *)self setPrimitiveValue:v19 forKey:v29];

          uint64_t v24 = v21;
        }
        v30 = [(ICTTMergeableWallClockValue *)v24 timestamp];
        [v11 setObject:v30 forKeyedSubscript:@"CryptoPassphraseVerifier"];

        goto LABEL_20;
      }
      v27 = self;
      v28 = 0;
    }
    else
    {
      v27 = self;
      v28 = v19;
    }
    [(ICAccountData *)v27 setCryptoPassphraseVerifier:v28];
LABEL_21:

    BOOL v25 = 1;
    goto LABEL_14;
  }
  int v12 = (void *)MEMORY[0x1E4F836F8];
  id v13 = [(ICAccountData *)self className];
  int v14 = ICStringFromSyncingApproach(a5);
  [v12 handleFailedAssertWithCondition:"__objc_no", "-[ICAccountData(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v13, v14 functionName simulateCrash showAlert format];

LABEL_13:
  BOOL v25 = 0;
LABEL_14:

  return v25;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v8 = [(ICAccountData *)self className];
    char v9 = ICStringFromSyncingApproach(a3);
    [v7 handleFailedAssertWithCondition:"__objc_no", "-[ICAccountData(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v8, v9 functionName simulateCrash showAlert format];

    id v10 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ICAccountData;
    id v10 = [(ICCloudSyncingObject *)&v19 makeCloudKitRecordForApproach:0 mergeableFieldState:v6];
    id v11 = [(ICAccountData *)self mergeableData];

    if (v11)
    {
      int v12 = [(ICAccountData *)self mergeableData];
      objc_msgSend(v10, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v12, @"MergeableData", 0);
    }
    id v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICAccountData lockedNotesMode](self, "lockedNotesMode"));
    [v10 setObject:v13 forKeyedSubscript:@"LockedNotesMode"];

    int v14 = [(ICAccountData *)self mergeableCryptoPassphraseVerifier];
    v15 = v14;
    if (v14)
    {
      v16 = [v14 serialize];
      [v10 setObject:v16 forKeyedSubscript:@"CryptoPassphraseVerifier"];

      v17 = [v15 timestamp];
      [v6 setObject:v17 forKeyedSubscript:@"CryptoPassphraseVerifier"];
    }
  }

  return v10;
}

- (void)updateSupportsV1Neo:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  id v2 = "-[ICAccountData updateSupportsV1Neo:]";
  __int16 v3 = 1024;
  int v4 = 55;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Updating v1 Neo support state…%s:%d", (uint8_t *)&v1, 0x12u);
}

- (void)mergeableCryptoPassphraseVerifier
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Derived mergeable crypto verifier from unboxed verifier", v1, 2u);
}

@end