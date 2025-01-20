@interface KCSharingStore
- (BOOL)applyIncomingDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)applyIncomingEntriesInTransaction:(__OpaqueSecDbConnection *)a3 updateInfos:(id)a4 error:(id *)a5;
- (BOOL)applyIncomingShareDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 updateInfos:(id)a4 error:(id *)a5;
- (BOOL)dropDeletionsForRecordIDs:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (BOOL)dropOutgoingChangeForRecordID:(id)a3 error:(id *)a4;
- (BOOL)dropOutgoingChangeForRecordID:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (BOOL)enumerateRowsInRemotelyDeletedZonesForEntryModel:(Class)a3 inTransaction:(__OpaqueSecDbConnection *)a4 withError:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowsInRemotelyDeletedZonesForLocalItemsInTransaction:(__OpaqueSecDbConnection *)a3 withError:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateRowsInZoneIDs:(id)a3 forEntryModel:(Class)a4 inTransaction:(__OpaqueSecDbConnection *)a5 withError:(id *)a6 usingBlock:(id)a7;
- (BOOL)enumerateRowsInZoneIDs:(id)a3 forLocalItemsInTransaction:(__OpaqueSecDbConnection *)a4 withError:(id *)a5 usingBlock:(id)a6;
- (BOOL)fingerprintAllPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)fingerprintAllPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)fingerprintPasswordDatabaseItem:(SecDbItem *)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (BOOL)fingerprintPrivateKeyDatabaseItem:(SecDbItem *)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (BOOL)hasIncomingEntries:(BOOL *)a3 deletions:(BOOL *)a4 inTransaction:(__OpaqueSecDbConnection *)a5 error:(id *)a6;
- (BOOL)hasOutgoingChangesInDatabaseWithScope:(int64_t)a3;
- (BOOL)mergeWithError:(id *)a3;
- (BOOL)mergeWithUpdateInfos:(id)a3 error:(id *)a4;
- (BOOL)removeValueForMetadataKey:(id)a3 error:(id *)a4;
- (BOOL)resetMetadataInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)resetSyncTablesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)resolveConflictingPrimaryKeysForEntriesOfType:(int64_t)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (BOOL)resolveConflictingPrimaryKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)resolveMergeConflictsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)restageUnappliedMirrorEntriesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forMetadataKey:(id)a4 error:(id *)a5;
- (BOOL)stageAllOutgoingChangesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)stageAllOutgoingChangesWithError:(id *)a3;
- (BOOL)stageIncomingDeletionForRecordID:(id)a3 error:(id *)a4;
- (BOOL)stageIncomingRecord:(id)a3 error:(id *)a4;
- (BOOL)stageIncomingRow:(id)a3 error:(id *)a4;
- (BOOL)stageOutgoingShares:(id)a3 deletionsForShares:(id)a4 error:(id *)a5;
- (BOOL)updateMirrorWithDeletedZoneIDs:(id)a3 error:(id *)a4;
- (BOOL)updateMirrorWithDeletedZoneIDs:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (BOOL)updateMirrorWithSavedRecords:(id)a3 deletedRecordIDs:(id)a4 error:(id *)a5;
- (BOOL)wipeLocalPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)wipeLocalPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)wipeWithError:(id *)a3;
- (BOOL)withConnection:(id)a3 error:(id *)a4;
- (BOOL)withLocalFingerprintsTable:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (KCSharingAccessGroups)accessGroups;
- (KCSharingStore)init;
- (KCSharingStore)initWithConnection:(__OpaqueSecDbConnection *)a3 accessGroups:(id)a4 metadataDomain:(id)a5;
- (NSString)metadataDomain;
- (id)fetchAllCKSharesInMirrorForGroupID:(id)a3 error:(id *)a4;
- (id)fetchAllEntriesForModel:(Class)a3 withTransform:(id)a4 error:(id *)a5;
- (id)fetchAllIncomingRowsWithError:(id *)a3;
- (id)fetchAllMirrorEntriesWithError:(id *)a3;
- (id)fetchAllOutgoingRowsWithError:(id *)a3;
- (id)fetchAllSharingGroupsInMirrorWithError:(id *)a3;
- (id)fetchCKShareFromMirrorForGroupID:(id)a3 error:(id *)a4;
- (id)fetchOutgoingChangesWithCursor:(id)a3 maxChangeCount:(int64_t)a4 maxBatchSizeInBytes:(int64_t)a5 error:(id *)a6;
- (id)fetchOutgoingDatabaseItemWithRecordID:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5;
- (id)fetchOutgoingRecordWithRecordID:(id)a3 error:(id *)a4;
- (id)fetchValueForMetadataKey:(id)a3 error:(id *)a4;
- (id)fetchZoneIDsToDeleteFromDatabaseWithScope:(int64_t)a3 error:(id *)a4;
- (id)fetchZonesToSaveToDatabaseWithScope:(int64_t)a3 error:(id *)a4;
- (id)plan;
- (id)stageAllOutgoingChangedPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (id)stageAllOutgoingChangedPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (id)stageAllOutgoingDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (id)stageAllOutgoingNewPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (id)stageAllOutgoingNewPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
@end

@implementation KCSharingStore

- (id)fetchValueForMetadataKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v25[0] = kSecClass;
  v25[1] = kSecUseDataProtectionKeychain;
  v26[0] = kSecClassGenericPassword;
  v26[1] = &__kCFBooleanTrue;
  v26[2] = &__kCFBooleanFalse;
  v25[2] = kSecAttrSynchronizable;
  v25[3] = kSecAttrAccessGroup;
  v7 = [(KCSharingStore *)self accessGroups];
  v8 = [v7 entryAccessGroup];
  v26[3] = v8;
  v26[4] = v6;
  v25[4] = kSecAttrAccount;
  v25[5] = kSecAttrService;
  v26[5] = self->_metadataDomain;
  v26[6] = kSecMatchLimitOne;
  v25[6] = kSecMatchLimit;
  v25[7] = kSecReturnAttributes;
  v25[8] = kSecReturnData;
  v26[7] = &__kCFBooleanTrue;
  v26[8] = &__kCFBooleanTrue;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:9];

  v20 = (void *)0xAAAAAAAAAAAAAAAALL;
  OSStatus v10 = SecItemCopyMatching(v9, (CFTypeRef *)&v20);
  if (v10 == -25300)
  {
LABEL_11:
    v15 = 0;
    goto LABEL_15;
  }
  if (v10)
  {
    Error = (void *)SecCopyLastError();
    if (a4)
    {
      v15 = 0;
      *a4 = Error;
      goto LABEL_15;
    }
    if (Error) {
      CFRelease(Error);
    }
    goto LABEL_11;
  }
  v11 = v20;
  v12 = [v20 objectForKeyedSubscript:kSecValueData];
  if ((_NSIsNSData() & 1) == 0)
  {
    CFStringRef v23 = @"KCSharingInvalidAttribute";
    CFStringRef v21 = kSecValueData;
    id v14 = [v12 copy];
    id v22 = v14;
    v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v24 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v18);

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v13 = +[NSPropertyListSerialization propertyListWithData:v12 options:0 format:0 error:a4];
  if (!v13)
  {
    id v14 = 0;
    goto LABEL_13;
  }
  id v14 = v13;
  v15 = v14;
LABEL_14:

LABEL_15:

  return v15;
}

- (KCSharingAccessGroups)accessGroups
{
  return self->_accessGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDomain, 0);
  objc_storeStrong((id *)&self->_accessGroups, 0);

  objc_storeStrong(&self->_connection, 0);
}

- (NSString)metadataDomain
{
  return self->_metadataDomain;
}

- (id)fetchAllOutgoingRowsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(KCSharingStore *)self fetchAllEntriesForModel:v5 withTransform:&stru_100306938 error:a3];
}

- (id)fetchAllIncomingRowsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(KCSharingStore *)self fetchAllEntriesForModel:v5 withTransform:&stru_100306918 error:a3];
}

- (id)fetchAllMirrorEntriesWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(KCSharingStore *)self fetchAllEntriesForModel:v5 withTransform:&stru_1003068F8 error:a3];
}

- (id)fetchCKShareFromMirrorForGroupID:(id)a3 error:(id *)a4
{
  v4 = [(KCSharingStore *)self fetchAllCKSharesInMirrorForGroupID:a3 error:a4];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)fetchAllSharingGroupsInMirrorWithError:(id *)a3
{
  v4 = [(KCSharingStore *)self fetchAllCKSharesInMirrorForGroupID:0 error:a3];
  if (!v4 || a3 && *a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = sub_100046CF4(*(void **)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (id)fetchAllCKSharesInMirrorForGroupID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  +[NSMutableArray array];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019BEF8;
  v12[3] = &unk_1003068B8;
  uint64_t v15 = v7;
  id v13 = v6;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v8;
  id v9 = v6;
  if ([(KCSharingStore *)self withConnection:v12 error:a4]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)fetchAllEntriesForModel:(Class)a3 withTransform:(id)a4 error:(id *)a5
{
  id v8 = a4;
  +[NSMutableArray array];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10019C3AC;
  v13[3] = &unk_100306890;
  id v15 = v8;
  Class v16 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v9;
  id v10 = v8;
  if ([(KCSharingStore *)self withConnection:v13 error:a5]) {
    id v11 = [v9 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)resetMetadataInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  uint64_t v7 = KCSharingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wiping local metadata...", buf, 2u);
  }

  v32 = 0;
  uint64_t v8 = sub_10000C75C(@"genp", &qword_10035D010, (uint64_t)&unk_10035D008);
  id v9 = (CFDictionaryRef *)sub_10000C7F0(v8, 0, 0, 0, &v32);
  if (v9)
  {
    id v10 = v9;
    id v11 = [(KCSharingStore *)self accessGroups];
    CFBooleanRef v12 = [v11 entryAccessGroup];
    sub_10000DF34(kSecAttrAccessGroup, v12, (uint64_t)v10);

    CFBooleanRef v13 = [(KCSharingStore *)self metadataDomain];
    sub_10000DF34(kSecAttrService, v13, (uint64_t)v10);

    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x2020000000;
    char v31 = 1;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    id v22 = v10;
    id v23 = 0;
    v20[6] = a3;
    v21.isa = _NSConcreteStackBlock;
    *(void *)&v21.flags = 3221225472;
    v21.invoke = (void (*)(void *, ...))sub_10019C990;
    v21.descriptor = (Block_descriptor_1 *)&unk_1003067D0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10019C9CC;
    v20[3] = &unk_100306818;
    v20[4] = &v24;
    v20[5] = buf;
    BOOL v14 = sub_10011C750(v10, (uint64_t)a3, (CFTypeRef *)&v23, &stru_1003067B0, &v21, 0, 0, (uint64_t)v20);
    sub_10000C2C4((const void **)v10, 0);
    if (v14)
    {
      if (v29[24])
      {
        BOOL v15 = 1;
LABEL_21:
        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(buf, 8);
        return v15;
      }
      v18 = (void *)v25[3];
      if (a4)
      {
        BOOL v15 = 0;
        *a4 = v18;
        v25[3] = 0;
        goto LABEL_21;
      }
      if (v18)
      {
        v25[3] = 0;
        CFRelease(v18);
      }
    }
    else
    {
      id v17 = v23;
      if (a4)
      {
        BOOL v15 = 0;
        *a4 = v23;
        goto LABEL_21;
      }
      if (v23)
      {
        id v23 = 0;
        CFRelease(v17);
      }
    }
    BOOL v15 = 0;
    goto LABEL_21;
  }
  Class v16 = v32;
  if (a4)
  {
    *a4 = v32;
  }
  else if (v32)
  {
    v32 = 0;
    CFRelease(v16);
  }
  return 1;
}

- (BOOL)resetSyncTablesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  uint64_t v7 = KCSharingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wiping sync tables...", buf, 2u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v22[0] = @"DELETE FROM sharingIncomingQueue WHERE agrp = ?";
  v22[1] = @"DELETE FROM sharingMirror WHERE agrp = ?";
  v22[2] = @"DELETE FROM sharingOutgoingQueue WHERE agrp = ?";
  uint64_t v8 = +[NSArray arrayWithObjects:v22 count:3];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        CFBooleanRef v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10019CC40;
        v16[3] = &unk_1003061D0;
        v16[4] = self;
        v16[5] = a3;
        if (!sub_100155E64((uint64_t)a3, v13, a4, v16))
        {
          BOOL v14 = 0;
          goto LABEL_13;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)wipeLocalPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v6 = KCSharingLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Wiping local passwords...", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019CDDC;
  v8[3] = &unk_100306730;
  v8[4] = a3;
  return sub_100155E64((uint64_t)a3, @"DELETE FROM inet WHERE ggrp <> ''", a4, v8);
}

- (BOOL)wipeLocalPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v6 = KCSharingLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Wiping local private keys...", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019CED4;
  v8[3] = &unk_100306730;
  v8[4] = a3;
  return sub_100155E64((uint64_t)a3, @"DELETE FROM keys WHERE ggrp <> ''", a4, v8);
}

- (BOOL)wipeWithError:(id *)a3
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10019D01C;
  CFBooleanRef v12 = sub_10019D02C;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019D034;
  v7[3] = &unk_1003070F0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  sub_10002B000(dword_10035D2B0, (uint64_t)v7);
  int v4 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((unsigned char *)v15 + 24))
  {
    *a3 = (id) v9[5];
    int v4 = *((unsigned __int8 *)v15 + 24);
  }
  BOOL v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)resetWithError:(id *)a3
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10019D01C;
  CFBooleanRef v12 = sub_10019D02C;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019D408;
  v7[3] = &unk_1003070F0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  sub_10002B000(dword_10035D2B0, (uint64_t)v7);
  int v4 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((unsigned char *)v15 + 24))
  {
    *a3 = (id) v9[5];
    int v4 = *((unsigned __int8 *)v15 + 24);
  }
  BOOL v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)dropOutgoingChangeForRecordID:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = a3;
  [(KCSharingStore *)self plan];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10019D72C;
  char v17 = &unk_100306290;
  long long v18 = self;
  id v19 = v8;
  Block_layout v21 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v9;
  id v10 = v8;
  if (sub_100155E64((uint64_t)a4, @"SELECT rowid FROM sharingOutgoingQueue                       WHERE (agrp, ownr, zone, uuid) = (?1, ?2, ?3, ?4)", a5, &v14))
  {
    uint64_t v11 = [(KCSharingStore *)self accessGroups];
    unsigned __int8 v12 = [v9 applyInTransaction:a4 withAccessGroups:v11 error:a5];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)dropOutgoingChangeForRecordID:(id)a3 error:(id *)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019DAF4;
  v7[3] = &unk_100306358;
  id v8 = self;
  id v9 = a3;
  id v5 = v9;
  LOBYTE(a4) = [(KCSharingStore *)v8 withConnection:v7 error:a4];

  return (char)a4;
}

- (BOOL)updateMirrorWithDeletedZoneIDs:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(KCSharingStore *)self plan];
  uint64_t v10 = objc_opt_class();
  v54[0] = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10019DF20;
  v52[3] = &unk_1003063D0;
  id v11 = v9;
  id v53 = v11;
  unsigned __int8 v12 = [(KCSharingStore *)self enumerateRowsInZoneIDs:v8 forEntryModel:v10 inTransaction:a4 withError:v54 usingBlock:v52];
  id v17 = v54[0];
  if (v12)
  {

    uint64_t v18 = objc_opt_class();
    id v51 = v17;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10019DF74;
    v49[3] = &unk_1003063D0;
    id v19 = v11;
    id v50 = v19;
    unsigned __int8 v20 = [(KCSharingStore *)self enumerateRowsInZoneIDs:v8 forEntryModel:v18 inTransaction:a4 withError:&v51 usingBlock:v49];
    id v21 = v51;

    if ((v20 & 1) == 0)
    {
      sub_100047078(a5, 30, v21, @"Enumerating outgoing rows in locally deleted zones", v22, v23, v24, v25, v42);
      unsigned __int8 v40 = 0;
      id v39 = v50;
LABEL_10:
      id v17 = v21;
      goto LABEL_11;
    }

    uint64_t v26 = objc_opt_class();
    id v48 = v21;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10019DFC8;
    v46[3] = &unk_1003063D0;
    id v27 = v19;
    id v47 = v27;
    unsigned __int8 v28 = [(KCSharingStore *)self enumerateRowsInZoneIDs:v8 forEntryModel:v26 inTransaction:a4 withError:&v48 usingBlock:v46];
    id v17 = v48;

    if (v28)
    {

      id v45 = v17;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10019E01C;
      v43[3] = &unk_1003063D0;
      id v33 = v27;
      id v44 = v33;
      unsigned __int8 v34 = [(KCSharingStore *)self enumerateRowsInZoneIDs:v8 forLocalItemsInTransaction:a4 withError:&v45 usingBlock:v43];
      id v21 = v45;

      if (v34)
      {

        id v39 = [(KCSharingStore *)self accessGroups];
        unsigned __int8 v40 = [v33 applyInTransaction:a4 withAccessGroups:v39 error:a5];
      }
      else
      {
        sub_100047078(a5, 30, v21, @"Enumerating local Keychain items in locally deleted zones", v35, v36, v37, v38, v42);
        unsigned __int8 v40 = 0;
        id v39 = v44;
      }
      goto LABEL_10;
    }
    sub_100047078(a5, 30, v17, @"Enumerating mirror entries in locally deleted zones", v29, v30, v31, v32, v42);
    unsigned __int8 v40 = 0;
    id v39 = v47;
  }
  else
  {
    sub_100047078(a5, 30, v17, @"Enumerating incoming rows in locally deleted zones", v13, v14, v15, v16, v42);
    unsigned __int8 v40 = 0;
    id v39 = v53;
  }
LABEL_11:

  return v40;
}

- (BOOL)updateMirrorWithDeletedZoneIDs:(id)a3 error:(id *)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019E11C;
  v7[3] = &unk_100306358;
  id v8 = self;
  id v9 = a3;
  id v5 = v9;
  LOBYTE(a4) = [(KCSharingStore *)v8 withConnection:v7 error:a4];

  return (char)a4;
}

- (BOOL)updateMirrorWithSavedRecords:(id)a3 deletedRecordIDs:(id)a4 error:(id *)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10019E2A0;
  v10[3] = &unk_1003063A8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v7 = v13;
  id v8 = v12;
  LOBYTE(a5) = [(KCSharingStore *)v11 withConnection:v10 error:a5];

  return (char)a5;
}

- (id)fetchOutgoingChangesWithCursor:(id)a3 maxChangeCount:(int64_t)a4 maxBatchSizeInBytes:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = +[NSMutableArray array];
  id v11 = +[NSMutableArray array];
  id v12 = [v9 keyset];
  id v13 = [v12 mutableCopy];

  uint64_t v14 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10019EB7C;
  v47[3] = &unk_100306650;
  id v15 = v9;
  id v48 = v15;
  uint64_t v16 = objc_retainBlock(v47);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10019ED68;
  v39[3] = &unk_100306678;
  id v17 = v14;
  unsigned __int8 v40 = v17;
  id v18 = v11;
  id v41 = v18;
  id v19 = v13;
  id v44 = v46;
  int64_t v45 = a5;
  id v42 = v19;
  id v20 = v10;
  id v43 = v20;
  id v21 = objc_retainBlock(v39);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10019EFE8;
  v31[3] = &unk_1003066F0;
  id v22 = v15;
  id v32 = v22;
  uint64_t v23 = v17;
  int64_t v37 = a4;
  id v33 = v23;
  unsigned __int8 v34 = self;
  uint64_t v24 = v21;
  id v35 = v24;
  SEL v38 = a2;
  uint64_t v25 = v16;
  id v36 = v25;
  if ([(KCSharingStore *)self withConnection:v31 error:a6])
  {
    uint64_t v26 = [[KCSharingOutgoingChangesetCursor alloc] initWithDatabaseScope:[v22 databaseScope] keyset:v19 fetchBehavior:[v22 fetchBehavior]];
    id v27 = [[KCSharingOutgoingChangeset alloc] initWithRecordsToSave:v20 recordIDsToDelete:v18 cursor:v26];
  }
  else
  {
    id v27 = 0;
  }

  _Block_object_dispose(v46, 8);

  return v27;
}

- (id)fetchOutgoingRecordWithRecordID:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10019D01C;
  uint64_t v16 = sub_10019D02C;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A0838;
  v8[3] = &unk_100306628;
  id v9 = self;
  id v5 = a3;
  id v10 = v5;
  id v11 = &v12;
  if ([(KCSharingStore *)v9 withConnection:v8 error:a4]) {
    id v6 = (id)v13[5];
  }
  else {
    id v6 = 0;
  }

  _Block_object_dispose(&v12, 8);

  return v6;
}

- (id)fetchZoneIDsToDeleteFromDatabaseWithScope:(int64_t)a3 error:(id *)a4
{
  if (a3 == 2)
  {
    +[NSMutableArray array];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001A09E4;
    v9[3] = &unk_1003063A8;
    id v10 = @"SELECT o.zone                       FROM sharingOutgoingQueue o                       WHERE (o.agrp, o.ownr, o.uuid) = (?1, ?2, ?3) AND                             o.deln";
    id v11 = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v6;
    if ([(KCSharingStore *)self withConnection:v9 error:a4]) {
      id v7 = [v6 copy];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)fetchZonesToSaveToDatabaseWithScope:(int64_t)a3 error:(id *)a4
{
  if (a3 == 2)
  {
    +[NSMutableArray array];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001A0D70;
    v9[3] = &unk_1003063A8;
    id v10 = @"SELECT o.zone                       FROM sharingOutgoingQueue o                       WHERE (o.agrp, o.ownr, o.uuid) = (?1, ?2, ?3) AND                             NOT o.deln AND                             NOT EXISTS(                                SELECT 1 FROM sharingMirror m                                 WHERE (m.agrp, m.ownr, m.zone, m.uuid) = (o.agrp, o.ownr, o.zone, o.uuid)                            )";
    id v11 = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v6;
    if ([(KCSharingStore *)self withConnection:v9 error:a4]) {
      id v7 = [v6 copy];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

- (BOOL)dropDeletionsForRecordIDs:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v33 = 0;
  unsigned __int8 v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v27 = 0;
  unsigned __int8 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_10019D01C;
  uint64_t v31 = sub_10019D02C;
  id v32 = 0;
  int v9 = sqlite3_limit(*((sqlite3 **)a4 + 8), 9, -1);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  id v21 = sub_1001A1228;
  id v22 = &unk_100306600;
  uint64_t v25 = &v27;
  uint64_t v26 = a4;
  uint64_t v23 = self;
  uint64_t v24 = &v33;
  id v10 = v8;
  id v11 = v20;
  id v12 = [v10 count];
  unint64_t v13 = (v9 & ~(v9 >> 31)) - 1;
  if (v13 >= 3 && v12 != 0)
  {
    char v37 = 0;
    unint64_t v15 = (unint64_t)[v10 count];
    if (v15 >= v13 / 3) {
      unint64_t v16 = v13 / 3;
    }
    else {
      unint64_t v16 = v15;
    }
    id v17 = [v10 subarrayWithRange:0, v16];
    v21(v11, v17, &v37);
  }
  int v18 = *((unsigned __int8 *)v34 + 24);
  if (a5 && !*((unsigned char *)v34 + 24)) {
    *a5 = (id) v28[5];
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18 != 0;
}

- (id)fetchOutgoingDatabaseItemWithRecordID:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = a3;
  int v9 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v10 = [(KCSharingRowMapper *)v9 columnNamesWithTableName:0];
  id v11 = [v10 componentsJoinedByString:@", "];
  id v12 = +[NSString stringWithFormat:@"SELECT %@ FROM sharingOutgoingQueue WHERE (agrp, ownr, zone, uuid) = (?1, ?2, ?3, ?4)", v11];

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10019D01C;
  uint64_t v27 = sub_10019D02C;
  id v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001A19F4;
  v18[3] = &unk_1003065B8;
  v18[4] = self;
  id v13 = v8;
  id v21 = &v23;
  id v22 = a4;
  id v19 = v13;
  uint64_t v14 = v9;
  id v20 = v14;
  if (sub_100155E64((uint64_t)a4, v12, a5, v18))
  {
    unint64_t v15 = (void *)v24[5];
    if (v15)
    {
      id v16 = v15;
    }
    else
    {
      sub_100046FBC(a5, 9, 0);
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(&v23, 8);

  return v16;
}

- (BOOL)hasIncomingEntries:(BOOL *)a3 deletions:(BOOL *)a4 inTransaction:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A1CC4;
  v7[3] = &unk_100306568;
  void v7[4] = self;
  v7[5] = a5;
  v7[6] = a3;
  void v7[7] = a4;
  return sub_100155E64((uint64_t)a5, @"SELECT EXISTS(                          SELECT 1 FROM sharingIncomingQueue i                           WHERE i.agrp = ?1 AND NOT i.deln                      ) AS hasEntries, EXISTS(                          SELECT 1 FROM sharingIncomingQueue i                           WHERE i.agrp = ?1 AND i.deln                      ) AS hasDeletions", a6, v7);
}

- (BOOL)mergeWithUpdateInfos:(id)a3 error:(id *)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A1EC8;
  v7[3] = &unk_100306358;
  id v8 = self;
  id v9 = a3;
  id v5 = v9;
  LOBYTE(a4) = [(KCSharingStore *)v8 withConnection:v7 error:a4];

  return (char)a4;
}

- (BOOL)mergeWithError:(id *)a3
{
  return [(KCSharingStore *)self mergeWithUpdateInfos:0 error:a3];
}

- (BOOL)restageUnappliedMirrorEntriesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [(KCSharingStore *)self plan];
  id v8 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v9 = [(KCSharingRowMapper *)v8 columnNamesWithTableName:@"m"];
  id v10 = [v9 componentsJoinedByString:@", "];
  id v11 = [(KCSharingStore *)self accessGroups];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT %1$@           FROM sharingMirror m           WHERE m.agrp = ?1 AND                 m.flag <> 0 AND                (                    ((m.flag & %2$u) <> 0 AND m.lwsv < %3$lli) OR                     ((m.flag & %4$u) <> 0)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue i                     WHERE (i.agrp, i.ownr, i.zone, i.uuid) = (m.agrp, m.ownr, m.zone, m.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (m.agrp, m.ownr, m.zone, m.uuid) AND                           o.deln                )", v10, 2, [v11 entrySchemaVersion], 8);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001A253C;
  v18[3] = &unk_100306290;
  id v21 = a3;
  v18[4] = self;
  id v19 = v8;
  id v13 = v7;
  id v20 = v13;
  uint64_t v14 = v8;
  if (sub_100155E64((uint64_t)a3, v12, a4, v18))
  {
    unint64_t v15 = [(KCSharingStore *)self accessGroups];
    unsigned __int8 v16 = [v13 applyInTransaction:a3 withAccessGroups:v15 error:a4];
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (BOOL)resolveConflictingPrimaryKeysForEntriesOfType:(int64_t)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v10 = [(KCSharingStore *)self plan];
  id v11 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v12 = off_100306530;
  switch(a3)
  {
    case 0:
    case 3:
      +[NSAssertionHandler currentHandler];
      uint64_t v14 = v13 = v10;
      [v14 handleFailureInMethod:a2 object:self file:@"KCSharingStore.m" lineNumber:1756 description:@"Can't resolve conflicting primary keys for entries of type %ld"];

      id v10 = v13;
      unsigned __int8 v15 = 1;
      goto LABEL_13;
    case 1:
      goto LABEL_5;
    case 2:
      id v12 = &off_100306538;
LABEL_5:
      unsigned __int8 v16 = a5;
      id v17 = *v12;
      goto LABEL_6;
    default:
      unsigned __int8 v16 = a5;
      id v17 = 0;
LABEL_6:
      int v18 = [(KCSharingRowMapper *)v11 columnNamesWithTableName:@"m"];
      [v18 componentsJoinedByString:@", "];
      v20 = id v19 = v11;
      uint64_t v21 = +[NSString stringWithFormat:@"SELECT %1$@           FROM sharingMirror m           JOIN(              SELECT ownr, zone, min(uuid) AS lo               FROM sharingMirror               WHERE agrp = ? AND type = %2$lld               GROUP BY ownr, zone, %3$@               HAVING count(*) > 1          ) p ON (p.ownr, p.zone) = (m.ownr, m.zone) AND                  p.lo = m.uuid", v20, a3, v17];

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1001A2B00;
      v41[3] = &unk_100306290;
      v41[4] = self;
      id v44 = a4;
      char v36 = v19;
      id v22 = v19;
      uint64_t v23 = (void *)v21;
      uint64_t v24 = v22;
      id v42 = v22;
      id v25 = v10;
      id v43 = v25;
      uint64_t v26 = (void *)v21;
      uint64_t v27 = v16;
      if (sub_100155E64((uint64_t)a4, v26, v16, v41))
      {
        unsigned __int8 v34 = v23;
        uint64_t v35 = v10;
        id v28 = [(KCSharingRowMapper *)v24 columnNamesWithTableName:@"m"];
        uint64_t v29 = [v28 componentsJoinedByString:@", "];
        uint64_t v30 = +[NSString stringWithFormat:@"SELECT %1$@           FROM sharingMirror m           JOIN(              SELECT ownr, zone, %3$@, min(uuid) AS lo, max(uuid) AS hi               FROM sharingMirror               WHERE agrp = ? AND type = %2$lld               GROUP BY ownr, zone, %3$@               HAVING count(*) > 1          ) r ON (r.ownr, r.zone) = (m.ownr, m.zone) AND                  m.uuid > r.lo AND m.uuid <= r.hi           WHERE m.type = %2$lld AND                 m.%3$@ = r.%3$@", v29, a3, v17];

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1001A2C18;
        v37[3] = &unk_100306290;
        v37[4] = self;
        unsigned __int8 v40 = a4;
        SEL v38 = v24;
        id v31 = v25;
        id v39 = v31;
        id v11 = v36;
        if (sub_100155E64((uint64_t)a4, v30, v27, v37))
        {
          id v32 = [(KCSharingStore *)self accessGroups];
          unsigned __int8 v15 = [v31 applyInTransaction:a4 withAccessGroups:v32 error:v27];
        }
        else
        {
          unsigned __int8 v15 = 0;
        }

        id v10 = v35;
        uint64_t v23 = v34;
      }
      else
      {
        unsigned __int8 v15 = 0;
        id v11 = v36;
      }

LABEL_13:
      return v15;
  }
}

- (BOOL)resolveConflictingPrimaryKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  BOOL v7 = [(KCSharingStore *)self resolveConflictingPrimaryKeysForEntriesOfType:1 inTransaction:a3 error:a4];
  if (v7)
  {
    LOBYTE(v7) = [(KCSharingStore *)self resolveConflictingPrimaryKeysForEntriesOfType:2 inTransaction:a3 error:a4];
  }
  return v7;
}

- (BOOL)applyIncomingDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  BOOL v7 = [(KCSharingStore *)self plan];
  id v8 = +[NSString stringWithFormat:@"SELECT i.rowid, m.rowid, IFNULL(l.type, 0), l.pkid, l.ipid           FROM sharingIncomingQueue i           JOIN sharingMirror m ON (m.agrp, m.ownr, m.zone, m.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)           LEFT JOIN lsfp l ON (l.type = %1$lld AND l.pkkp = m.pkkp) OR                               (l.type = %2$lld AND l.ipkp = m.ipkp)           WHERE i.agrp = ?1 AND                 i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )", 1, 2];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001A30D8;
  v18[3] = &unk_100306168;
  v18[4] = self;
  id v20 = a3;
  id v9 = v7;
  id v19 = v9;
  if (sub_100155E64((uint64_t)a3, v8, a4, v18))
  {
    id v10 = +[NSString stringWithFormat:@"SELECT i.rowid           FROM sharingIncomingQueue i           WHERE i.agrp = ? AND                 i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingMirror m                     WHERE (m.agrp, m.ownr, m.zone, m.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                )"];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001A3200;
    v15[3] = &unk_100306168;
    v15[4] = self;
    id v17 = a3;
    id v11 = v9;
    id v16 = v11;
    if (sub_100155E64((uint64_t)a3, v10, a4, v15))
    {
      id v12 = [(KCSharingStore *)self accessGroups];
      unsigned __int8 v13 = [v11 applyInTransaction:a3 withAccessGroups:v12 error:a4];
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)applyIncomingEntriesInTransaction:(__OpaqueSecDbConnection *)a3 updateInfos:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(KCSharingStore *)self plan];
  id v10 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v11 = [(KCSharingRowMapper *)v10 columnNamesWithTableName:@"i"];
  id v12 = [v11 componentsJoinedByString:@", "];
  unsigned __int8 v13 = +[NSString stringWithFormat:@"SELECT %1$@           FROM sharingIncomingQueue i           WHERE i.agrp = ?1 AND                 NOT i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )", v12];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001A37BC;
  v19[3] = &unk_100306290;
  id v22 = a3;
  v19[4] = self;
  id v20 = v10;
  id v14 = v9;
  id v21 = v14;
  unsigned __int8 v15 = v10;
  if (sub_100155E64((uint64_t)a3, v13, a5, v19))
  {
    id v16 = [(KCSharingStore *)self accessGroups];
    unsigned __int8 v17 = [v14 applyInTransaction:a3 withAccessGroups:v16 updateInfos:v8 error:a5];
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (BOOL)resolveMergeConflictsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  BOOL v7 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v8 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  v59[5] = a3;
  v60[0] = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1001A3E00;
  v59[3] = &unk_1003061D0;
  v59[4] = self;
  char v9 = sub_100155E64((uint64_t)a3, @"SELECT i.rowid, o.rowid, m.rowid                                         FROM sharingIncomingQueue i                                         JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                                         JOIN sharingMirror m ON (m.agrp, m.ownr, m.zone, m.uuid) = (o.agrp, o.ownr, o.zone, o.uuid)                                         WHERE i.agrp = ? AND i.deln AND o.deln", v60, v59);
  id v14 = v60[0];
  if (v9)
  {
    id v47 = a4;
    unsigned __int8 v15 = [(KCSharingRowMapper *)v7 columnNamesWithTableName:@"i"];
    id v42 = [v15 componentsJoinedByString:@", "];
    id v16 = +[NSString stringWithFormat:@"SELECT %1$@, o.rowid, o.data           FROM sharingIncomingQueue i           JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)           WHERE i.agrp = ?1 AND                 o.deln AND                 NOT i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )"];

    id v58 = 0;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1001A3EE8;
    v55[3] = &unk_100306168;
    v55[4] = self;
    v57 = a3;
    unsigned __int8 v17 = v7;
    v56 = v17;
    char v18 = sub_100155E64((uint64_t)a3, v16, &v58, v55);
    id v23 = v58;
    if (v18)
    {
      v53[5] = a3;
      id v54 = 0;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1001A4018;
      v53[3] = &unk_1003061D0;
      v53[4] = self;
      char v24 = sub_100155E64((uint64_t)a3, @"SELECT i.rowid, o.rowid, m.rowid                                                    FROM sharingIncomingQueue i                                                    JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                                                    JOIN sharingMirror m ON (m.agrp, m.ownr, m.zone, m.uuid) = (o.agrp, o.ownr, o.zone, o.uuid)                                                    WHERE i.agrp = ?1 AND                                                          NOT o.deln AND                                                          i.deln AND                                                          NOT EXISTS(                                                             SELECT 1 FROM sharingIncomingQueue ish                                                              WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                                                                    ish.deln                                                         ) AND                                                          NOT EXISTS(                                                             SELECT 1 FROM sharingOutgoingQueue osh                                                              WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                                                                    osh.deln                                                         )", &v54, v53);
      id v25 = v54;
      uint64_t v30 = v25;
      if (v24)
      {
        id v45 = v25;
        id v46 = v23;
        id v44 = [(KCSharingRowMapper *)v17 columnNamesWithTableName:@"i"];
        id v31 = [v44 componentsJoinedByString:@", "];
        id v32 = [(KCSharingRowMapper *)v8 columnNamesWithTableName:@"o"];
        id v43 = [v32 componentsJoinedByString:@", "];
        uint64_t v33 = +[NSString stringWithFormat:@"SELECT %1$@, %2$@           FROM sharingIncomingQueue i           JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)           WHERE i.agrp = ?1 AND                 NOT o.deln AND                 NOT i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )"];

        id v51 = a3;
        id v52 = 0;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1001A4128;
        v48[3] = &unk_100306290;
        v48[4] = self;
        v49 = v17;
        id v50 = v8;
        char v34 = sub_100155E64((uint64_t)a3, v33, &v52, v48);
        id v39 = v52;
        if ((v34 & 1) == 0) {
          sub_100047078(v47, 28, v39, @"Resolving change-change conflicts", v35, v36, v37, v38, (uint64_t)v31);
        }

        uint64_t v30 = v45;
        id v23 = v46;
      }
      else
      {
        sub_100047078(v47, 28, v25, @"Resolving remote deletion-local change conflicts", v26, v27, v28, v29, (uint64_t)v42);
        char v34 = 0;
      }
    }
    else
    {
      sub_100047078(v47, 28, v23, @"Resolving remote change-local deletion conflicts", v19, v20, v21, v22, (uint64_t)v42);
      char v34 = 0;
    }
  }
  else
  {
    sub_100047078(a4, 28, v14, @"Resolving deletion-deletion conflicts", v10, v11, v12, v13, v41);
    char v34 = 0;
  }

  return v34;
}

- (BOOL)enumerateRowsInZoneIDs:(id)a3 forLocalItemsInTransaction:(__OpaqueSecDbConnection *)a4 withError:(id *)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  uint64_t v39 = 0;
  unsigned __int8 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_10019D01C;
  id v43 = sub_10019D02C;
  id v44 = 0;
  uint64_t v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v35 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v36;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = sub_10004695C(*(void **)(*((void *)&v35 + 1) + 8 * i));
        if (v16) {
          [v11 addObject:v16];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v35 objects:v50 count:16];
    }
    while (v13);
  }

  int v17 = sqlite3_limit(*((sqlite3 **)a4 + 8), 9, -1);
  uint64_t v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_1001A4C58;
  uint64_t v30 = &unk_100306498;
  id v32 = &v45;
  uint64_t v33 = &v39;
  char v34 = a4;
  id v18 = v10;
  id v31 = v18;
  id v19 = v11;
  uint64_t v20 = &v27;
  id v21 = [v19 count:v27, v28];
  if (v17 >= 1 && v21)
  {
    char v49 = 0;
    id v22 = [v19 count];
    if ((unint64_t)v22 >= (v17 & ~(v17 >> 31))) {
      id v23 = (id)(v17 & ~(v17 >> 31));
    }
    else {
      id v23 = v22;
    }
    char v24 = [v19 subarrayWithRange:0, v23];
    v29((uint64_t)v20, v24, &v49);
  }
  int v25 = *((unsigned __int8 *)v46 + 24);
  if (a5 && !*((unsigned char *)v46 + 24)) {
    *a5 = (id) v40[5];
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v25 != 0;
}

- (BOOL)enumerateRowsInZoneIDs:(id)a3 forEntryModel:(Class)a4 inTransaction:(__OpaqueSecDbConnection *)a5 withError:(id *)a6 usingBlock:(id)a7
{
  char v24 = a6;
  id v11 = a3;
  id v12 = a7;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_10019D01C;
  unsigned __int8 v40 = sub_10019D02C;
  id v41 = 0;
  int v13 = sqlite3_limit(*((sqlite3 **)a5 + 8), 9, -1);
  int v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  uint64_t v27 = sub_1001A570C;
  uint64_t v28 = &unk_100306470;
  Class v34 = a4;
  long long v35 = a5;
  id v32 = &v42;
  uint64_t v33 = &v36;
  id v29 = v11;
  uint64_t v30 = self;
  id v14 = v12;
  id v31 = v14;
  id v15 = v29;
  id v16 = &v25;
  id v17 = [v15 count];
  unint64_t v18 = (v13 & ~(v13 >> 31)) - 1;
  if (v18 >= 2 && v17)
  {
    v46[0] = 0;
    id v19 = [v15 count];
    if ((unint64_t)v19 >= v18 >> 1) {
      id v20 = (id)(v18 >> 1);
    }
    else {
      id v20 = v19;
    }
    id v21 = [v15 subarrayWithRange:0, v20, v24, v25, v26];
    v27((uint64_t)v16, v21, v46);
  }
  int v22 = *((unsigned __int8 *)v43 + 24);
  if (v24 && !*((unsigned char *)v43 + 24)) {
    id *v24 = (id) v37[5];
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v22 != 0;
}

- (BOOL)enumerateRowsInRemotelyDeletedZonesForLocalItemsInTransaction:(__OpaqueSecDbConnection *)a3 withError:(id *)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = +[NSString stringWithFormat:@"SELECT lpk.rowid           FROM keys lpk           JOIN sharingIncomingQueue ish ON substr(ish.zone, 1, length(?3)) = ?3 AND                                            substr(ish.zone, length(?3) + 1) = lpk.ggrp           WHERE (ish.agrp, ish.uuid) = (?1, ?2) AND                 ish.deln"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001A5D14;
  v17[3] = &unk_100306308;
  v17[4] = self;
  id v19 = a3;
  id v10 = v8;
  id v18 = v10;
  if (sub_100155E64((uint64_t)a3, v9, a4, v17))
  {
    id v11 = +[NSString stringWithFormat:@"SELECT lip.rowid           FROM inet lip           JOIN sharingIncomingQueue ish ON substr(ish.zone, 1, length(?3)) = ?3 AND                                            substr(ish.zone, length(?3) + 1) = lip.ggrp           WHERE (ish.agrp, ish.uuid) = (?1, ?2) AND                 ish.deln"];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A5E58;
    v14[3] = &unk_100306308;
    v14[4] = self;
    id v16 = a3;
    id v15 = v10;
    char v12 = sub_100155E64((uint64_t)a3, v11, a4, v14);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateRowsInRemotelyDeletedZonesForEntryModel:(Class)a3 inTransaction:(__OpaqueSecDbConnection *)a4 withError:(id *)a5 usingBlock:(id)a6
{
  id v10 = a6;
  id v11 = +[NSString stringWithFormat:@"SELECT r.rowid, r.zone, r.uuid           FROM %1$@ r           WHERE r.agrp = ?1 AND                 EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.zone, ish.uuid) = (r.agrp, r.zone, ?2) AND                           ish.deln                )", *(void *)[(objc_class *)a3 databaseItemClass]];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A61A0;
  v14[3] = &unk_100306420;
  id v16 = a4;
  Class v17 = a3;
  v14[4] = self;
  id v15 = v10;
  id v12 = v10;
  LOBYTE(a5) = sub_100155E64((uint64_t)a4, v11, a5, v14);

  return (char)a5;
}

- (BOOL)applyIncomingShareDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 updateInfos:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(KCSharingStore *)self plan];
  uint64_t v10 = objc_opt_class();
  v45[0] = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001A6748;
  v43[3] = &unk_1003063D0;
  id v11 = v9;
  id v44 = v11;
  unsigned __int8 v12 = [(KCSharingStore *)self enumerateRowsInRemotelyDeletedZonesForEntryModel:v10 inTransaction:a3 withError:v45 usingBlock:v43];
  id v17 = v45[0];
  if (v12)
  {

    uint64_t v18 = objc_opt_class();
    id v42 = v17;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1001A679C;
    v40[3] = &unk_1003063D0;
    id v19 = v11;
    id v41 = v19;
    unsigned __int8 v20 = [(KCSharingStore *)self enumerateRowsInRemotelyDeletedZonesForEntryModel:v18 inTransaction:a3 withError:&v42 usingBlock:v40];
    id v21 = v42;

    if (v20)
    {

      uint64_t v26 = objc_opt_class();
      id v39 = v21;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1001A67F0;
      v37[3] = &unk_1003063D0;
      id v27 = v19;
      id v38 = v27;
      unsigned __int8 v28 = [(KCSharingStore *)self enumerateRowsInRemotelyDeletedZonesForEntryModel:v26 inTransaction:a3 withError:&v39 usingBlock:v37];
      id v17 = v39;

      if (v28)
      {

        id v33 = [(KCSharingStore *)self accessGroups];
        unsigned __int8 v34 = [v27 applyInTransaction:a3 withAccessGroups:v33 updateInfos:v8 error:a5];
      }
      else
      {
        sub_100047078(a5, 28, v17, @"Enumerating mirror entries in remotely deleted zones", v29, v30, v31, v32, v36);
        unsigned __int8 v34 = 0;
        id v33 = v38;
      }
    }
    else
    {
      sub_100047078(a5, 28, v21, @"Enumerating outgoing rows in remotely deleted zones", v22, v23, v24, v25, v36);
      unsigned __int8 v34 = 0;
      id v33 = v41;
      id v17 = v21;
    }
  }
  else
  {
    sub_100047078(a5, 28, v17, @"Enumerating incoming rows in remotely deleted zones", v13, v14, v15, v16, v36);
    unsigned __int8 v34 = 0;
    id v33 = v44;
  }

  return v34;
}

- (BOOL)stageOutgoingShares:(id)a3 deletionsForShares:(id)a4 error:(id *)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A6914;
  v10[3] = &unk_1003063A8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v7 = v13;
  id v8 = v12;
  LOBYTE(a5) = [(KCSharingStore *)v11 withConnection:v10 error:a5];

  return (char)a5;
}

- (BOOL)stageIncomingDeletionForRecordID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[KCSharingIncomingDeletion alloc] initForDeletedRecordWithRecordID:v6];

  LOBYTE(a4) = [(KCSharingStore *)self stageIncomingRow:v7 error:a4];
  return (char)a4;
}

- (BOOL)stageIncomingRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[KCSharingIncomingEntry alloc] initWithFetchedRecord:v6];

  LOBYTE(a4) = [(KCSharingStore *)self stageIncomingRow:v7 error:a4];
  return (char)a4;
}

- (BOOL)stageIncomingRow:(id)a3 error:(id *)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A6DA0;
  v7[3] = &unk_100306358;
  id v8 = self;
  id v9 = a3;
  id v5 = v9;
  LOBYTE(a4) = [(KCSharingStore *)v8 withConnection:v7 error:a4];

  return (char)a4;
}

- (id)stageAllOutgoingDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [(KCSharingStore *)self plan];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A70C4;
  v21[3] = &unk_1003062B8;
  uint64_t v22 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v23 = v7;
  id v8 = v7;
  id v9 = v22;
  uint64_t v10 = objc_retainBlock(v21);
  id v11 = [(KCSharingRowMapper *)v9 columnNamesWithTableName:@"m"];
  id v12 = [v11 componentsJoinedByString:@", "];
  id v13 = +[NSString stringWithFormat:@"SELECT %1$@           FROM sharingMirror m           WHERE m.agrp = ? AND                (                    (m.type = %2$lld AND m.pkkp NOT IN(                        SELECT l.pkkp FROM lsfp l                         WHERE l.type = %2$lld                    )) OR                     (m.type = %3$lld AND m.ipkp NOT IN(                        SELECT l.ipkp FROM lsfp l                         WHERE l.type = %3$lld                    )) OR                     (m.flag <> 0 AND (m.flag & %4$u) <> 0)                )", v12, 1, 2, 4];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001A71FC;
  v18[3] = &unk_100306308;
  id v19 = v10;
  unsigned __int8 v20 = a3;
  v18[4] = self;
  uint64_t v14 = v10;
  if (sub_100155E64((uint64_t)a3, v13, a4, v18)) {
    uint64_t v15 = v8;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (id)stageAllOutgoingNewPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [(KCSharingStore *)self plan];
  id v8 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v9 = [(KCSharingRowMapper *)v8 columnNamesWithTableName:@"lip"];
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  id v11 = +[NSString stringWithFormat:@"WITH groups(ownr, zone) AS(              SELECT msh.ownr, msh.zone               FROM sharingMirror msh               WHERE (msh.agrp, msh.uuid) = (?1, ?2) AND                     NOT EXISTS(                        SELECT 1 FROM sharingIncomingQueue ish                         WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid) AND                               ish.deln                    ) AND                     NOT EXISTS(                        SELECT 1 FROM sharingOutgoingQueue osh                         WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid)                    )               UNION ALL               SELECT osh.ownr, osh.zone               FROM sharingOutgoingQueue osh               WHERE (osh.agrp, osh.uuid) = (?1, ?2) AND                     NOT osh.deln          )           SELECT g.ownr, g.zone, %1$@           FROM lsfp l           JOIN inet lip ON lip.rowid = l.ipid           JOIN groups g ON substr(g.zone, 1, length(?3)) = ?3 AND                            substr(g.zone, length(?3) + 1) = lip.ggrp           WHERE NOT EXISTS(                    SELECT 1 FROM sharingMirror m                     WHERE (m.ownr, m.zone) = (g.ownr, g.zone) AND                           (m.type, l.type, m.ipkp) = (%2$lld, %2$lld, l.ipkp)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone) = (g.ownr, g.zone) AND                           (o.type, l.type, o.ipkp) = (%2$lld, %2$lld, l.ipkp)                )", v10, 2];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001A7484;
  v17[3] = &unk_100306290;
  v17[4] = self;
  uint64_t v18 = v8;
  id v19 = v7;
  unsigned __int8 v20 = a3;
  id v12 = v7;
  id v13 = v8;
  if (sub_100155E64((uint64_t)a3, v11, a4, v17)) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)stageAllOutgoingChangedPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v6 = [(KCSharingStore *)self plan];
  id v7 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v8 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v9 = [(KCSharingRowMapper *)v7 columnNamesWithTableName:@"m"];
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  id v11 = [(KCSharingRowMapper *)v8 columnNamesWithTableName:@"lip"];
  id v12 = [v11 componentsJoinedByString:@", "];
  id v13 = +[NSString stringWithFormat:@"SELECT %1$@, %2$@           FROM lsfp l           JOIN sharingMirror m ON (m.type = %3$lld AND l.type = %3$lld AND m.ipkp = l.ipkp)           JOIN inet lip ON lip.rowid = l.ipid           WHERE m.agrp = ?1 AND                (                    (l.type = m.type AND l.ipvp <> m.ipvp) OR                     (m.flag <> 0 AND(                        (m.flag & %4$u) <> 0                    ))                ) AND                 (m.flag = 0 OR (m.flag & %5$u) = 0) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone, o.uuid) = (m.ownr, m.zone, m.uuid)                )", v10, v12, 2, 1, 4];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A7A40;
  v21[3] = &unk_100306240;
  id v24 = v6;
  uint64_t v25 = a3;
  void v21[4] = self;
  uint64_t v22 = v7;
  id v23 = v8;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  if (sub_100155E64((uint64_t)a3, v13, a4, v21)) {
    id v17 = v14;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (id)stageAllOutgoingNewPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [(KCSharingStore *)self plan];
  id v8 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v9 = [(KCSharingRowMapper *)v8 columnNamesWithTableName:@"lpk"];
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  id v11 = +[NSString stringWithFormat:@"WITH groups(ownr, zone) AS(              SELECT msh.ownr, msh.zone               FROM sharingMirror msh               WHERE (msh.agrp, msh.uuid) = (?1, ?2) AND                     NOT EXISTS(                        SELECT 1 FROM sharingIncomingQueue ish                         WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid) AND                               ish.deln                    ) AND                     NOT EXISTS(                        SELECT 1 FROM sharingOutgoingQueue osh                         WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid)                    )               UNION ALL               SELECT osh.ownr, osh.zone               FROM sharingOutgoingQueue osh               WHERE (osh.agrp, osh.uuid) = (?1, ?2) AND                     NOT osh.deln          )           SELECT g.ownr, g.zone, %1$@           FROM lsfp l           JOIN keys lpk ON lpk.rowid = l.pkid           JOIN groups g ON substr(g.zone, 1, length(?3)) = ?3 AND                            substr(g.zone, length(?3) + 1) = lpk.ggrp           WHERE NOT EXISTS(                    SELECT 1 FROM sharingMirror m                     WHERE (m.ownr, m.zone) = (g.ownr, g.zone) AND                           (m.type, l.type, m.pkkp) = (%2$lld, %2$lld, l.pkkp)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone) = (g.ownr, g.zone) AND                           (o.type, l.type, o.pkkp) = (%2$lld, %2$lld, l.pkkp)                )", v10, 1];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001A8090;
  v17[3] = &unk_100306290;
  v17[4] = self;
  id v18 = v8;
  id v19 = v7;
  unsigned __int8 v20 = a3;
  id v12 = v7;
  id v13 = v8;
  if (sub_100155E64((uint64_t)a3, v11, a4, v17)) {
    id v14 = v12;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)stageAllOutgoingChangedPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v6 = [(KCSharingStore *)self plan];
  id v7 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v8 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v9 = [(KCSharingRowMapper *)v7 columnNamesWithTableName:@"m"];
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  id v11 = [(KCSharingRowMapper *)v8 columnNamesWithTableName:@"lpk"];
  id v12 = [v11 componentsJoinedByString:@", "];
  id v13 = +[NSString stringWithFormat:@"SELECT %1$@, %2$@           FROM lsfp l           JOIN sharingMirror m ON (m.type = %3$lld AND l.type = %3$lld AND m.pkkp = l.pkkp)           JOIN keys lpk ON lpk.rowid = l.pkid           WHERE m.agrp = ? AND                (                    (l.type = m.type AND l.pkvp <> m.pkvp) OR                     (m.flag <> 0 AND(                        (m.flag & %4$u) <> 0                    ))                ) AND                 (m.flag = 0 OR (m.flag & %5$u) = 0) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone, o.uuid) = (m.ownr, m.zone, m.uuid)                )", v10, v12, 1, 1, 4];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A8648;
  v21[3] = &unk_100306240;
  id v24 = v6;
  uint64_t v25 = a3;
  void v21[4] = self;
  uint64_t v22 = v7;
  id v23 = v8;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  if (sub_100155E64((uint64_t)a3, v13, a4, v21)) {
    id v17 = v14;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (BOOL)stageAllOutgoingChangesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A8B94;
  v5[3] = &unk_1003060F0;
  v5[4] = self;
  v5[5] = a3;
  return [(KCSharingStore *)self withLocalFingerprintsTable:v5 inTransaction:a3 error:a4];
}

- (BOOL)fingerprintPasswordDatabaseItem:(SecDbItem *)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = [[KCSharingLocalFingerprint alloc] initWithDatabaseItem:a3 error:a5];
  if (!v8) {
    goto LABEL_8;
  }
  id v17 = 0;
  uint64_t v9 = sub_10011B728(a3, &v17);
  if (!v9)
  {
    id v12 = v17;
    if (a5)
    {
      char v11 = 0;
      *a5 = v17;
      goto LABEL_9;
    }
    if (v17)
    {
      id v17 = 0;
      CFRelease(v12);
    }
LABEL_8:
    char v11 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = +[NSString stringWithFormat:@"INSERT INTO lsfp(type, ipid, ipkp, ipvp)           VALUES(%lld, %lld, ?1, ?2)", 2, v9];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A9394;
  v14[3] = &unk_1003061D0;
  id v15 = v8;
  id v16 = a4;
  char v11 = sub_100155E64((uint64_t)a4, v10, a5, v14);

LABEL_9:
  return v11;
}

- (BOOL)fingerprintAllPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v8 = [(KCSharingRowMapper *)v7 columnNamesWithTableName:@"lip"];
  uint64_t v9 = [v8 componentsJoinedByString:@", "];
  uint64_t v10 = +[NSString stringWithFormat:@"SELECT %@           FROM inet lip           WHERE lip.ggrp <> ''", v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A95B8;
  v13[3] = &unk_100306168;
  id v15 = self;
  id v16 = a3;
  id v14 = v7;
  char v11 = v7;
  LOBYTE(a4) = sub_100155E64((uint64_t)a3, v10, a4, v13);

  return (char)a4;
}

- (BOOL)fingerprintPrivateKeyDatabaseItem:(SecDbItem *)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = [[KCSharingLocalFingerprint alloc] initWithDatabaseItem:a3 error:a5];
  if (!v8) {
    goto LABEL_8;
  }
  id v17 = 0;
  uint64_t v9 = sub_10011B728(a3, &v17);
  if (!v9)
  {
    id v12 = v17;
    if (a5)
    {
      char v11 = 0;
      *a5 = v17;
      goto LABEL_9;
    }
    if (v17)
    {
      id v17 = 0;
      CFRelease(v12);
    }
LABEL_8:
    char v11 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = +[NSString stringWithFormat:@"INSERT INTO lsfp(type, pkid, pkkp, pkvp)           VALUES(%lld, %lld, ?1, ?2)", 1, v9];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A9898;
  v14[3] = &unk_1003061D0;
  id v15 = v8;
  id v16 = a4;
  char v11 = sub_100155E64((uint64_t)a4, v10, a5, v14);

LABEL_9:
  return v11;
}

- (BOOL)fingerprintAllPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [[KCSharingRowMapper alloc] initWithModel:objc_opt_class()];
  id v8 = [(KCSharingRowMapper *)v7 columnNamesWithTableName:@"lpk"];
  uint64_t v9 = [v8 componentsJoinedByString:@", "];
  uint64_t v10 = +[NSString stringWithFormat:@"SELECT %@           FROM keys lpk           WHERE lpk.ggrp <> ''", v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A9ABC;
  v13[3] = &unk_100306168;
  id v15 = self;
  id v16 = a3;
  id v14 = v7;
  char v11 = v7;
  LOBYTE(a4) = sub_100155E64((uint64_t)a3, v10, a4, v13);

  return (char)a4;
}

- (BOOL)withLocalFingerprintsTable:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8 = (uint64_t (**)(id, id *))a3;
  uint64_t v9 = +[NSString stringWithFormat:@"CREATE TEMP TABLE lsfp(               type INTEGER NOT NULL,               pkid INTEGER, /* Private key row ID */               pkkp BLOB, /* Private key keyprint */               pkvp BLOB, /* Private key valueprint */               ipid INTEGER, /* Internet password row ID */               ipkp BLOB, /* Internet password keyprint */               ipvp BLOB /* Internet password valueprint */          );"];
  CFTypeRef v28 = 0;
  if ((sub_100026908((uint64_t)a4, v9, &v28) & 1) == 0)
  {
    id v15 = (id)v28;
    id v19 = @"Creating fingerprints table";
LABEL_7:
    sub_100047078(a5, 27, v15, v19, v10, v11, v12, v13, v25);
    char v18 = 0;
    goto LABEL_10;
  }
  id v27 = 0;
  unsigned __int8 v14 = [(KCSharingStore *)self fingerprintAllPrivateKeysInTransaction:a4 error:&v27];
  id v15 = v27;
  if ((v14 & 1) == 0)
  {
    sub_100026908((uint64_t)a4, @"DROP TABLE lsfp", 0);
    id v19 = @"Fingerprinting all private keys";
    goto LABEL_7;
  }
  id v26 = 0;
  unsigned __int8 v16 = [(KCSharingStore *)self fingerprintAllPasswordsInTransaction:a4 error:&v26];
  id v17 = v26;
  if (v16)
  {
    char v18 = v8[2](v8, a5);
    sub_100026908((uint64_t)a4, @"DROP TABLE lsfp", 0);
  }
  else
  {
    sub_100026908((uint64_t)a4, @"DROP TABLE lsfp", 0);
    sub_100047078(a5, 27, v17, @"Fingerprinting all passwords", v20, v21, v22, v23, v25);
    char v18 = 0;
  }

LABEL_10:
  return v18;
}

- (BOOL)stageAllOutgoingChangesWithError:(id *)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A9E60;
  v4[3] = &unk_100306118;
  v4[4] = self;
  return [(KCSharingStore *)self withConnection:v4 error:a3];
}

- (BOOL)hasOutgoingChangesInDatabaseWithScope:(int64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A9FC4;
  v5[3] = &unk_1003060C8;
  void v5[6] = a3;
  v5[7] = a2;
  v5[4] = self;
  v5[5] = &v6;
  BOOL v3 = [(KCSharingStore *)self withConnection:v5 error:0] && *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)setValue:(id)a3 forMetadataKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    char v9 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:a5];
    if (v9)
    {
      v24[0] = kSecClass;
      v24[1] = kSecUseDataProtectionKeychain;
      v25[0] = kSecClassGenericPassword;
      v25[1] = &__kCFBooleanTrue;
      v25[2] = &__kCFBooleanFalse;
      v24[2] = kSecAttrSynchronizable;
      v24[3] = kSecAttrAccessGroup;
      uint64_t v10 = [(KCSharingStore *)self accessGroups];
      uint64_t v11 = [v10 entryAccessGroup];
      v25[3] = v11;
      v25[4] = v8;
      v24[4] = kSecAttrAccount;
      v24[5] = kSecAttrService;
      v25[5] = self->_metadataDomain;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];

      v22[0] = kSecAttrIsInvisible;
      v22[1] = kSecValueData;
      v23[0] = &__kCFBooleanTrue;
      v23[1] = v9;
      CFDictionaryRef v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      id v14 = [v12 mutableCopy];
      [v14 addEntriesFromDictionary:v13];
      v20[0] = kSecAttrAccessible;
      v20[1] = kSecAttrSysBound;
      v21[0] = kSecAttrAccessibleWhenUnlocked;
      v21[1] = &off_100326770;
      id v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      [v14 addEntriesFromDictionary:v15];

      OSStatus v16 = SecItemAdd((CFDictionaryRef)v14, 0);
      if (v16 == -25299) {
        OSStatus v16 = SecItemUpdate((CFDictionaryRef)v12, v13);
      }
      unsigned __int8 v17 = v16 == 0;
      if (v16)
      {
        Error = (void *)SecCopyLastError();
        if (a5)
        {
          *a5 = Error;
        }
        else if (Error)
        {
          CFRelease(Error);
        }
      }
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v17 = [(KCSharingStore *)self removeValueForMetadataKey:v8 error:a5];
  }

  return v17;
}

- (BOOL)removeValueForMetadataKey:(id)a3 error:(id *)a4
{
  v16[0] = kSecClass;
  v16[1] = kSecUseDataProtectionKeychain;
  v17[0] = kSecClassGenericPassword;
  v17[1] = &__kCFBooleanTrue;
  v17[2] = &__kCFBooleanFalse;
  v16[2] = kSecAttrSynchronizable;
  v16[3] = kSecAttrAccessGroup;
  id v6 = a3;
  id v7 = [(KCSharingStore *)self accessGroups];
  id v8 = [v7 entryAccessGroup];
  v17[3] = v8;
  v17[4] = v6;
  v16[4] = kSecAttrAccount;
  v16[5] = kSecAttrService;
  void v17[5] = self->_metadataDomain;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];

  OSStatus v10 = SecItemDelete(v9);
  OSStatus v11 = v10;
  if (v10 != -25300 && v10)
  {
    Error = (void *)SecCopyLastError();
    if (a4)
    {
      *a4 = Error;
    }
    else if (Error)
    {
      CFRelease(Error);
    }
  }
  if (v11) {
    BOOL v13 = v11 == -25300;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13;

  return v14;
}

- (BOOL)withConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10019D01C;
  id v27 = sub_10019D02C;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  id connection = self->_connection;
  if (!connection)
  {
    id v17 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001AA86C;
    v13[3] = &unk_100306050;
    id v15 = &v19;
    id v14 = v6;
    OSStatus v16 = &v23;
    if ((sub_10000CBA4(1, 1, 0, (uint64_t)&v17, (uint64_t)v13) & 1) == 0)
    {
      id v11 = v17;
      if (a4)
      {
        *a4 = v17;
        id v17 = 0;
      }
      else if (v17)
      {
        id v17 = 0;
        CFRelease(v11);
      }

      goto LABEL_13;
    }

    if (*((unsigned char *)v20 + 24)) {
      goto LABEL_3;
    }
LABEL_6:
    if (a4)
    {
      BOOL v10 = 0;
      *a4 = (id) v24[5];
      goto LABEL_14;
    }
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  id obj = 0;
  int v9 = (*((uint64_t (**)(id, id, id *))v6 + 2))(v6, connection, &obj);
  objc_storeStrong(&v28, obj);
  *((unsigned char *)v20 + 24) = v9;
  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v10 = 1;
LABEL_14:
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (id)plan
{
  v2 = objc_alloc_init(KCSharingDatabaseUpdatePlan);

  return v2;
}

- (KCSharingStore)initWithConnection:(__OpaqueSecDbConnection *)a3 accessGroups:(id)a4 metadataDomain:(id)a5
{
  id v8 = a4;
  int v9 = (__CFString *)a5;
  v16.receiver = self;
  v16.super_class = (Class)KCSharingStore;
  BOOL v10 = [(KCSharingStore *)&v16 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_connection, a3);
    if (v8) {
      uint64_t v12 = (KCSharingAccessGroups *)v8;
    }
    else {
      uint64_t v12 = objc_alloc_init(KCSharingAccessGroups);
    }
    accessGroups = v11->_accessGroups;
    v11->_accessGroups = v12;

    if (v9) {
      id v14 = v9;
    }
    else {
      id v14 = @"KCSharingStoreMetadata";
    }
    objc_storeStrong((id *)&v11->_metadataDomain, v14);
  }

  return v11;
}

- (KCSharingStore)init
{
  return [(KCSharingStore *)self initWithConnection:0 accessGroups:0 metadataDomain:0];
}

@end