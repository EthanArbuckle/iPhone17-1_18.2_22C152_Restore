@interface DownloadEntity
+ (Class)memoryEntityClass;
+ (id)copyValueDictionaryWithMetadata:(id)a3;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (void)initialize;
- (BOOL)_shouldSuppressDialogForError:(id)a3;
- (BOOL)deleteFromDatabase;
- (NSArray)allAssetCookies;
- (NSString)ITunesSafeGUID;
- (NSString)downloadKind;
- (id)_databaseAssetForAsset:(id)a3;
- (id)anyAssetForAssetType:(id)a3;
- (id)copyAdditionalMetadataForStoreDownload:(id)a3;
- (id)copyAssetsWithAssetType:(id)a3;
- (id)copyDownloadingIPodLibraryItem;
- (id)copyStoreDownloadMetadata;
- (id)failWithError:(id)a3;
- (id)finishWithFinalPhase:(id)a3;
- (id)rentalInformation;
- (id)retryDownload;
- (id)setAssetsUsingDownload:(id)a3;
- (int64_t)addPersistentDownloadsWithClientID:(id)a3 kind:(id)a4;
- (unint64_t)itemIdentifier;
- (void)_deleteTransaction;
- (void)_resetAssetProperty:(id)a3;
- (void)deleteScratchDirectory;
- (void)resetAssetLocalPaths;
- (void)resetAssetURLs;
@end

@implementation DownloadEntity

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(id)qword_100401C48 objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___DownloadEntity;
    objc_msgSendSuper2(&v10, "disambiguatedSQLForProperty:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return [(id)qword_100401C78 objectForKey:a3];
}

+ (id)joinClauseForProperty:(id)a3
{
  return [(id)qword_100401C70 objectForKey:a3];
}

+ (id)databaseTable
{
  return @"download";
}

+ (id)copyValueDictionaryWithMetadata:(id)a3
{
  id v4 = [a3 newDownloadProperties];
  id v5 = [a1 copyDatabaseDictionaryToSetClientDictionary:v4];

  return v5;
}

- (int64_t)addPersistentDownloadsWithClientID:(id)a3 kind:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableSet);
    id v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", -[DownloadEntity persistentID](self, "persistentID"));
    v8 = [(DownloadEntity *)self database];
    id v22 = v6;
    v21 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_kind" equalToValue:v6];
    v9 = +[PersistentDownloadManagerKindEntity queryWithDatabase:predicate:](PersistentDownloadManagerKindEntity, "queryWithDatabase:predicate:", v8);
    v36 = @"manager_id";
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10002F338;
    v30[3] = &unk_1003A3988;
    id v10 = v7;
    id v31 = v10;
    [v9 enumeratePersistentIDsAndProperties:&v36 count:1 usingBlock:v30];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v10;
    id v11 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      int64_t v13 = 0;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v17 = -[PersistentDownloadManagerEntity initWithPersistentID:inDatabase:]([PersistentDownloadManagerEntity alloc], "initWithPersistentID:inDatabase:", [v16 longLongValue], v8);
          v34[0] = @"client_id";
          v34[1] = @"filters_external_downloads";
          uint64_t v32 = 0;
          id v33 = 0;
          [(PersistentDownloadManagerEntity *)v17 getValues:&v32 forProperties:v34 count:2];
          if (![v33 BOOLValue] || objc_msgSend(v23, "isEqualToString:", v32))
          {
            id v18 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v25, @"download_id", v16, @"manager_id", 0);

            ++v13;
          }
          for (uint64_t j = 1; j != -1; --j)
        }
        id v12 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v12);
    }
    else
    {
      int64_t v13 = 0;
    }

    id v6 = v22;
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (NSArray)allAssetCookies
{
  v3 = +[NSMutableArray array];
  id v4 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
  id v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:[(DownloadEntity *)self persistentID]];
  id v6 = [(DownloadEntity *)self database];
  id v7 = +[DownloadAssetEntity queryWithDatabase:v6 predicate:v5];

  v16 = @"url";
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002F508;
  v13[3] = &unk_1003A39B0;
  id v14 = v4;
  id v8 = v3;
  id v15 = v8;
  id v9 = v4;
  [v7 enumeratePersistentIDsAndProperties:&v16 count:1 usingBlock:v13];
  id v10 = v15;
  id v11 = v8;

  return (NSArray *)v11;
}

- (id)anyAssetForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:[(DownloadEntity *)self persistentID]];
  id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"asset_type" equalToValue:v4];

  id v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v6, 0);
  id v8 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  id v9 = [(DownloadEntity *)self database];
  id v10 = +[DownloadAssetEntity anyInDatabase:v9 predicate:v8];

  return v10;
}

- (id)copyAdditionalMetadataForStoreDownload:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = SSDownloadMetadataKeyPurchaseDate;
  id v7 = [v4 valueForMetadataKey:SSDownloadMetadataKeyPurchaseDate];
  if (v7) {
    [v5 setObject:v7 forKey:v6];
  }
  v21[0] = @"kind";
  v21[1] = @"store_account_id";
  v21[2] = @"store_account_name";
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  [(DownloadEntity *)self getValues:&v18 forProperties:v21 count:3];
  if (v19)
  {
    id v8 = +[SSAccountStore defaultStore];
    id v9 = [v8 accountWithUniqueIdentifier:v19];

    id v10 = [v9 copyLockdownRepresentation];
    if (!v10)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      [v10 setObject:v19 forKey:kSSLockdownKeyAccountDSPersonID];
    }
    uint64_t v11 = kSSLockdownKeyAccountID;
    id v12 = [v10 objectForKey:kSSLockdownKeyAccountID];
    uint64_t v13 = v20;

    if (v12) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v13 == 0;
    }
    if (!v14) {
      [v10 setObject:v20 forKey:v11];
    }
    [v5 setObject:v10 forKey:SSDownloadMetadataKeyAccountInfo];
  }
  if (SSDownloadKindIsToneKind())
  {
    id v15 = [(DownloadEntity *)self ITunesSafeGUID];
    [v5 setObject:v15 forKey:SSDownloadMetadataKeyRingtoneGUID];
  }
  for (uint64_t i = 2; i != -1; --i)

  return v5;
}

- (id)copyAssetsWithAssetType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v6 = [(DownloadEntity *)self database];
  id v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:[(DownloadEntity *)self persistentID]];
  id v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"asset_type" equalToValue:v4];

  id v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, 0);
  id v10 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  CFStringRef v21 = @"asset_order";
  uint64_t v11 = +[NSArray arrayWithObjects:&v21 count:1];
  id v12 = +[DownloadAssetEntity queryWithDatabase:v6 predicate:v10 orderingProperties:v11];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002FB98;
  v18[3] = &unk_1003A39F0;
  id v19 = v6;
  id v13 = v5;
  id v20 = v13;
  id v14 = v6;
  [v12 enumeratePersistentIDsUsingBlock:v18];
  id v15 = v20;
  id v16 = v13;

  return v16;
}

- (id)copyDownloadingIPodLibraryItem
{
  v13[0] = @"is_restore";
  v13[1] = @"kind";
  v13[2] = @"library_id";
  v11[0] = 0;
  v11[1] = 0;
  id v12 = 0;
  [(DownloadEntity *)self getValues:v11 forProperties:v13 count:3];
  v3 = 0;
  if (SSDownloadKindIsMediaKind())
  {
    id v4 = [(DownloadEntity *)self anyAssetForAssetType:SSDownloadAssetTypeMedia];
    v3 = [v4 valueForProperty:@"url"];

    if (v3)
    {
      v3 = objc_alloc_init(IPodLibraryItem);
      if ([v11[0] BOOLValue]) {
        [(IPodLibraryItem *)v3 setDownloadType:1];
      }
      if (v12) {
        -[IPodLibraryItem setLibraryPersistentIdentifier:](v3, "setLibraryPersistentIdentifier:", [v12 longLongValue]);
      }
      id v5 = [v4 valueForProperty:@"protection_type"];
      uint64_t v6 = v5;
      if (v5) {
        -[IPodLibraryItem setProtectionType:](v3, "setProtectionType:", [v5 integerValue]);
      }
      id v7 = [(DownloadEntity *)self copyStoreDownloadMetadata];
      [(IPodLibraryItem *)v3 setItemMetadata:v7];
      id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", -[DownloadEntity persistentID](self, "persistentID"));
      [(IPodLibraryItem *)v3 setItemDownloadIdentifier:v8];
    }
  }
  for (uint64_t i = 2; i != -1; --i)

  return v3;
}

- (id)copyStoreDownloadMetadata
{
  id v3 = [(DownloadEntity *)self persistentID];
  id v4 = [(DownloadEntity *)self valueForProperty:@"kind"];
  id v5 = +[ScratchManager directoryPathForDownloadID:v3 kind:v4 createIfNeeded:0];
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

  id v7 = [[StoreDownload alloc] initWithContentsOfFile:v6];
  if (!v7) {
    id v7 = [[StoreDownload alloc] initWithDownload:self];
  }

  return v7;
}

- (NSString)downloadKind
{
  v2 = [(DownloadEntity *)self valueForProperty:@"kind"];
  id v3 = v2;
  if (!v2) {
    v2 = (void *)SSDownloadKindOther;
  }
  id v4 = v2;

  return v4;
}

- (id)failWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(DownloadsChangeset);
  v34[0] = @"bundle_id";
  v34[1] = @"client_id";
  void v34[2] = @"is_restore";
  v34[3] = @"kind";
  v34[4] = @"is_private";
  v34[5] = @"title";
  v34[6] = @"transaction_id";
  v34[7] = @"suppress_error_dialogs";
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  [(DownloadEntity *)self getValues:&v30 forProperties:v34 count:8];
  id v6 = [(DownloadEntity *)self persistentID];
  if (!v4)
  {
    SSError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  ArchivableData = (void *)SSCodingCreateArchivableData();
  uint64_t v8 = SSDownloadPhaseFailed;
  v28[0] = @"download_state.phase";
  v28[1] = @"download_state.download_error";
  v29[0] = SSDownloadPhaseFailed;
  v29[1] = ArchivableData;
  id v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  [(DownloadEntity *)self setValuesWithDictionary:v9];

  if (SSDownloadKindIsSoftwareKind())
  {
    id v10 = [(id)v33 longLongValue];
    uint64_t v11 = [ApplicationHandle alloc];
    id v12 = [(ApplicationHandle *)v11 initWithTransactionIdentifier:v10 downloadIdentifier:v6 bundleIdentifier:(void)v30];
    [(DownloadsChangeset *)v5 addFailedAppWithHandle:v12];
    +[ApplicationWorkspaceState incompleteNotificationForFailedDownload:v6 bundleIdentifier:(void)v30];
  }
  else
  {
    if (![*((id *)&v31 + 1) isEqualToString:SSDownloadKindInAppContent]) {
      goto LABEL_8;
    }
    id v13 = objc_alloc((Class)NSOrderedSet);
    id v14 = +[NSNumber numberWithLongLong:v6];
    id v12 = (ApplicationHandle *)objc_msgSend(v13, "initWithObjects:", v14, 0);

    id v15 = +[MicroPaymentQueue paymentQueue];
    [v15 failDownloadsWithIdentifiers:v12];
  }
LABEL_8:
  id v16 = *((id *)&v31 + 1);
  if (SSDownloadKindIsBookToShimKind())
  {
    v17 = [v4 domain];
    if ([v17 isEqualToString:SSErrorDomain])
    {
      id v18 = [v4 code];

      if (v18 == (id)150)
      {
        [(DownloadEntity *)self deleteFromDatabase];
        [(DownloadsChangeset *)v5 addDownloadChangeTypes:8];
        [(DownloadsChangeset *)v5 addDownloadKind:v16];
        [(DownloadsChangeset *)v5 addRemovedDownloadID:[(DownloadEntity *)self persistentID]];
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  if (([(id)v32 BOOLValue] & 1) == 0
    && ([*((id *)&v31 + 1) isEqualToString:SSDownloadKindInAppContent] & 1) == 0)
  {
    [(DownloadEntity *)self addPersistentDownloadsWithClientID:*((void *)&v30 + 1) kind:*((void *)&v31 + 1)];
  }
  v26[0] = SSDownloadPropertyDownloadPhase;
  v26[1] = SSDownloadPropertyEncodedErrorData;
  v27[0] = v8;
  v27[1] = ArchivableData;
  id v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [(DownloadsChangeset *)v5 setChangedDownloadProperties:v19];

  [(DownloadsChangeset *)v5 addDownloadChangeTypes:2];
  [(DownloadsChangeset *)v5 addDownloadKind:*((void *)&v31 + 1)];
  [(DownloadsChangeset *)v5 addStatusChangedDownloadID:v6];
  if (([*((id *)&v33 + 1) BOOLValue] & 1) == 0
    && ([(id)v31 BOOLValue] & 1) == 0
    && (SSDownloadKindIsSoftwareKind() & 1) == 0
    && ![(DownloadEntity *)self _shouldSuppressDialogForError:v4])
  {
    if (ISErrorIsEqual()) {
      id v20 = objc_alloc_init(DownloadDiskSpaceError);
    }
    else {
      id v20 = [[DownloadGenericError alloc] initWithError:v4];
    }
    CFStringRef v21 = v20;
    if (v20)
    {
      [(DownloadError *)v20 addDownloadIdentifier:v6];
      [(DownloadError *)v21 setDownloadKind:*((void *)&v31 + 1)];
      [(DownloadError *)v21 setDownloadTitle:*((void *)&v32 + 1)];
      id v22 = +[DownloadErrorController sharedErrorController];
      [v22 showDownloadError:v21];
    }
  }
LABEL_26:
  id v23 = v5;

  for (uint64_t i = 7; i != -1; --i)

  return v23;
}

- (id)finishWithFinalPhase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(DownloadsChangeset);
  id v6 = [(DownloadEntity *)self database];
  v38[0] = @"bundle_id";
  v38[1] = @"cancel_url";
  v38[2] = @"client_id";
  v38[3] = @"download_state.did_restore_data";
  v38[4] = @"is_restore";
  v38[5] = @"download_state.is_server_finished";
  v38[6] = @"kind";
  v38[7] = @"library_id";
  v38[8] = @"is_private";
  v38[9] = @"store_account_id";
  v38[10] = @"store_item_id";
  v38[11] = @"store_transaction_id";
  v38[12] = @"transaction_id";
  id v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  [(DownloadEntity *)self getValues:&v31 forProperties:v38 count:13];
  if (SSDownloadKindIsMediaKind())
  {
    id v7 = [(DownloadEntity *)self allAssetCookies];
    if ([v7 count]) {
      [(DownloadsChangeset *)v5 addDeletedHTTPCookies:v7];
    }
    unsigned int v8 = [v4 isEqualToString:SSDownloadPhaseCanceled];
    id v9 = [(DownloadEntity *)self persistentID];
    if (v8) {
      [(DownloadsChangeset *)v5 addCanceledIPodLibraryDownloadID:v9];
    }
    else {
      [(DownloadsChangeset *)v5 addDeletedIPodLibraryDownloadID:v9];
    }
  }
  else
  {
    if (!SSDownloadKindIsSoftwareKind()) {
      goto LABEL_19;
    }
    id v7 = (id)v31;
    if ([v7 length])
    {
      id v10 = [ApplicationHandle alloc];
      uint64_t v11 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:](v10, "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:", [v37 longLongValue], -[DownloadEntity persistentID](self, "persistentID"), v7);
      if ([v4 isEqualToString:SSDownloadPhaseCanceled])
      {
        if ([(id)v33 BOOLValue]
          && ([*((id *)&v32 + 1) BOOLValue] & 1) == 0)
        {
          [(DownloadsChangeset *)v5 addCanceledAppDataRestoreID:v7];
        }
        if (([(id)v35 BOOLValue] & 1) == 0)
        {
          [(DownloadsChangeset *)v5 addCanceledAppWithHandle:v11];
          +[ApplicationWorkspaceState incompleteNotificationForCanceledDownload:[(DownloadEntity *)self persistentID] bundleIdentifier:v7];
        }
      }
      else if (([(id)v35 BOOLValue] & 1) == 0)
      {
        [(DownloadsChangeset *)v5 addFinishedAppWithHandle:v11];
      }
    }
  }

LABEL_19:
  if ((void)v32)
  {
    id v12 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"client_id");
    id v13 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"wake_up_on_finish" equalToLongLong:1];
    id v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, v12, 0);
    id v15 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

    id v16 = [(DownloadEntity *)self database];
    v17 = +[PersistentDownloadManagerEntity anyInDatabase:v16 predicate:v15];

    if (v17)
    {
      id v18 = objc_alloc((Class)NSArray);
      id v19 = objc_msgSend(v18, "initWithObjects:", *((void *)&v34 + 1), 0);
      id v20 = +[SSAppWakeRequest newsstandFinishRequestWithAppIdentifier:(void)v32 issueIdentifiers:v19];
      if (v20) {
        [(DownloadsChangeset *)v5 addSSAppWakeRequest:v20];
      }
    }
  }
  if (![(id)v35 BOOLValue])
  {
    if ([(id)v34 isEqualToString:SSDownloadKindInAppContent])
    {
      id v21 = [(DownloadEntity *)self persistentID];
    }
    else
    {
      uint64_t v23 = [(DownloadEntity *)self addPersistentDownloadsWithClientID:(void)v32 kind:(void)v34];
      id v21 = [(DownloadEntity *)self persistentID];
      if (v23 < 1) {
        goto LABEL_27;
      }
    }
    id v24 = objc_alloc((Class)NSDictionary);
    id v25 = objc_msgSend(v24, "initWithObjectsAndKeys:", v4, SSDownloadPropertyDownloadPhase, 0);
    [(DownloadEntity *)self setValue:v4 forProperty:@"download_state.phase"];
    [(DownloadsChangeset *)v5 addDownloadChangeTypes:10];
    [(DownloadsChangeset *)v5 addRemovedPersistentDownloadID:v21];
    [(DownloadsChangeset *)v5 addStatusChangedDownloadID:v21];
    [(DownloadsChangeset *)v5 setChangedDownloadProperties:v25];

    int v22 = 1;
    goto LABEL_34;
  }
  id v21 = [(DownloadEntity *)self persistentID];
LABEL_27:
  if ([(DownloadEntity *)self deleteFromDatabase])
  {
    [(DownloadsChangeset *)v5 addDownloadChangeTypes:8];
    [(DownloadsChangeset *)v5 addRemovedDownloadID:v21];
  }
  int v22 = 0;
LABEL_34:
  [(DownloadsChangeset *)v5 addDownloadKind:(void)v34];
  [(DownloadsChangeset *)v5 addFinishedDownloadKind:(void)v34];
  [(DownloadsChangeset *)v5 removeDownloadFromPipelineWithID:v21];
  if (*((void *)&v35 + 1) && ([*((id *)&v33 + 1) BOOLValue] & 1) == 0)
  {
    id v26 = objc_alloc_init((Class)NSMutableDictionary);
    [v26 setObject:*((void *)&v35 + 1) forKey:@"store_account_id"];
    if ([v4 isEqualToString:SSDownloadPhaseCanceled])
    {
      if (*((void *)&v31 + 1)) {
        goto LABEL_42;
      }
    }
    else if ((void)v36 && *((void *)&v36 + 1))
    {
      objc_msgSend(v26, "setObject:forKey:");
LABEL_42:
      objc_msgSend(v26, "setObject:forKey:");
      long long v27 = [[FinishedDownloadEntity alloc] initWithPropertyValues:v26 inDatabase:v6];
      if (v27)
      {
        if (v22)
        {
          long long v28 = +[NSNumber numberWithBool:1];
          [(DownloadEntity *)self setValue:v28 forProperty:@"download_state.is_server_finished"];
        }
        [(DownloadsChangeset *)v5 addDownloadChangeTypes:4];
      }
    }
  }
  for (uint64_t i = 12; i != -1; --i)

  return v5;
}

- (unint64_t)itemIdentifier
{
  v2 = [(DownloadEntity *)self valueForProperty:@"store_item_id"];
  unint64_t v3 = SSGetItemIdentifierFromValue();

  return v3;
}

- (NSString)ITunesSafeGUID
{
  return +[NSString stringWithFormat:@"%llx", [(DownloadEntity *)self persistentID]];
}

- (id)rentalInformation
{
  id v2 = [(DownloadEntity *)self copyStoreDownloadMetadata];
  unint64_t v3 = [v2 sinfs];
  if (v3)
  {
    id v4 = [[DownloadDRM alloc] initWithSinfArray:v3];
    id v5 = [(DownloadDRM *)v4 sinfsArray];
    id v6 = [v5 copyValueForProperty:@"SinfPropertyRentalInformation" error:0];
LABEL_6:
    id v9 = v6;
    goto LABEL_7;
  }
  id v4 = [v2 rentalID];
  id v7 = +[SSAccountStore defaultStore];
  unsigned int v8 = [v7 activeAccount];
  id v5 = [v8 uniqueIdentifier];

  id v9 = 0;
  if (v4 && v5)
  {
    sub_10002DD60((uint64_t)[v5 unsignedLongLongValue], (uint64_t)-[DownloadDRM unsignedLongLongValue](v4, "unsignedLongLongValue"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  if (v9)
  {
    id v10 = +[NSMutableDictionary dictionary];
    uint64_t v11 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)[v9 rentalStartTime]);
    id v12 = sub_10002A5D0();
    [v10 setObject:v11 forKey:v12];

    id v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 rentalDuration]);
    id v14 = sub_10002A5A0();
    [v10 setObject:v13 forKey:v14];

    id v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 playbackDuration]);
    id v16 = sub_10002A5B0();
    [v10 setObject:v15 forKey:v16];

    if ([v9 playbackStartTime] != -1)
    {
      v17 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)[v9 playbackStartTime]);
      id v18 = sub_10002A5C0();
      [v10 setObject:v17 forKey:v18];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)resetAssetLocalPaths
{
}

- (void)resetAssetURLs
{
}

- (id)retryDownload
{
  unint64_t v3 = objc_alloc_init(DownloadsChangeset);
  id v4 = [(DownloadEntity *)self persistentID];
  [(DownloadsChangeset *)v3 addDownloadToPipelineWithID:v4];
  v12[0] = @"bundle_id";
  v12[1] = @"kind";
  v12[2] = @"transaction_id";
  v10[0] = 0;
  v10[1] = 0;
  id v11 = 0;
  [(DownloadEntity *)self getValues:v10 forProperties:v12 count:3];
  if (SSDownloadKindIsSoftwareKind())
  {
    id v5 = [ApplicationHandle alloc];
    id v6 = [v11 longLongValue];
    id v7 = [(ApplicationHandle *)v5 initWithTransactionIdentifier:v6 downloadIdentifier:v4 bundleIdentifier:v10[0]];
    [(DownloadsChangeset *)v3 addRetryAppWithHandle:v7];
  }
  for (uint64_t i = 2; i != -1; --i)

  return v3;
}

- (id)setAssetsUsingDownload:(id)a3
{
  id v4 = a3;
  long long v35 = objc_alloc_init(DownloadsChangeset);
  uint64_t v5 = [(DownloadEntity *)self database];
  id v6 = +[NSNumber numberWithLongLong:[(DownloadEntity *)self persistentID]];
  id v7 = objc_alloc_init((Class)NSMutableSet);
  +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToValue:v6];
  long long v31 = v33 = (void *)v5;
  unsigned int v8 = +[DownloadAssetEntity queryWithDatabase:predicate:](DownloadAssetEntity, "queryWithDatabase:predicate:", v5);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100031228;
  v44[3] = &unk_1003A3A80;
  id v9 = v7;
  id v45 = v9;
  long long v30 = v8;
  [v8 enumeratePersistentIDsUsingBlock:v44];
  long long v32 = v4;
  [v4 assets];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = (DownloadsChangeset *)(id)objc_claimAutoreleasedReturnValue();
  id v10 = [(DownloadsChangeset *)obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v14 setValue:v6 forProperty:@"download_id"];
        uint64_t v15 = [(DownloadEntity *)self _databaseAssetForAsset:v14];
        if (v15)
        {
          id v16 = (DownloadAssetEntity *)v15;
          v17 = [v14 propertyValues];
          [(DownloadAssetEntity *)v16 setValuesWithDictionary:v17];
        }
        else
        {
          id v18 = [DownloadAssetEntity alloc];
          id v19 = [v14 propertyValues];
          id v16 = [(DownloadAssetEntity *)v18 initWithPropertyValues:v19 inDatabase:v33];

          if (!v16)
          {
            int v22 = obj;
            goto LABEL_23;
          }
        }
        id v20 = [(DownloadAssetEntity *)v16 copyStoreDownloadKeyCookie];
        if (v20) {
          [(DownloadsChangeset *)v35 addHTTPCookie:v20];
        }
        id v21 = +[NSNumber numberWithLongLong:[(DownloadAssetEntity *)v16 persistentID]];
        [v9 removeObject:v21];
      }
      id v11 = [(DownloadsChangeset *)obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v22 = (DownloadsChangeset *)v9;
  id v23 = [(DownloadsChangeset *)v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v37;
LABEL_15:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v37 != v25) {
        objc_enumerationMutation(v22);
      }
      long long v27 = -[DownloadAssetEntity initWithPersistentID:inDatabase:]([DownloadAssetEntity alloc], "initWithPersistentID:inDatabase:", [*(id *)(*((void *)&v36 + 1) + 8 * v26) longLongValue], v33);
      unsigned int v28 = [(DownloadAssetEntity *)v27 deleteFromDatabase];

      if (!v28) {
        break;
      }
      if (v24 == (id)++v26)
      {
        id v24 = [(DownloadsChangeset *)v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v24) {
          goto LABEL_15;
        }
        goto LABEL_24;
      }
    }
LABEL_23:

    int v22 = v35;
    long long v35 = 0;
  }
LABEL_24:

  return v35;
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  id v3 = a3;
  id v4 = [(id)qword_100401C80 objectForKey:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)qword_100401C78 objectForKey:v3];
  }
  id v7 = v6;

  return v7;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return [(id)qword_100401C50 objectForKey:a3];
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return [(id)qword_100401C60 objectForKey:a3];
}

+ (id)foreignDatabaseTablesToDelete
{
  return (id)qword_100401C68;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return [(id)qword_100401C58 objectForKey:a3];
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  [(DownloadEntity *)self _deleteTransaction];
  v9.receiver = self;
  v9.super_class = (Class)DownloadEntity;
  BOOL v3 = [(DownloadEntity *)&v9 deleteFromDatabase];
  id v4 = [(DownloadEntity *)self persistentID];
  [(DownloadEntity *)self deleteScratchDirectory];
  if (v3)
  {
    uint64_t v5 = +[DownloadsDatabase downloadsDatabase];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100031428;
    v8[3] = &unk_1003A3AA0;
    v8[4] = v4;
    id v6 = [v5 modifyExternalUsingTransactionBlock:v8];
  }
  return v3;
}

- (void)deleteScratchDirectory
{
  id v3 = [(DownloadEntity *)self persistentID];
  id v4 = [(DownloadEntity *)self valueForProperty:@"kind"];
  id v6 = +[ScratchManager directoryPathForDownloadID:v3 kind:v4 createIfNeeded:0];

  id v5 = objc_alloc_init((Class)NSFileManager);
  if ([v5 fileExistsAtPath:v6]) {
    [v5 removeItemAtPath:v6 error:0];
  }
}

- (id)_databaseAssetForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForProperty:@"asset_type"];
  if (v5)
  {
    id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:[(DownloadEntity *)self persistentID]];
    id v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"asset_type" equalToValue:v5];
    unsigned int v8 = [v4 valueForProperty:@"url"];
    if (v8) {
      +[SSSQLiteComparisonPredicate predicateWithProperty:@"url" equalToValue:v8];
    }
    else {
    id v10 = +[SSSQLiteNullPredicate isNullPredicateWithProperty:@"url"];
    }
    id v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, v7, v10, 0);
    uint64_t v12 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

    id v13 = [(DownloadEntity *)self database];
    objc_super v9 = +[DownloadAssetEntity anyInDatabase:v13 predicate:v12];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)_deleteTransaction
{
  id v3 = [(DownloadEntity *)self valueForProperty:@"transaction_id"];
  id v4 = [v3 longLongValue];

  id v5 = [TransactionEntity alloc];
  id v6 = [(DownloadEntity *)self database];
  id v7 = [(TransactionEntity *)v5 initWithPersistentID:v4 inDatabase:v6];

  [(TransactionEntity *)v7 deleteFromDatabase];
}

- (void)_resetAssetProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(DownloadEntity *)self database];
  id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:[(DownloadEntity *)self persistentID]];
  id v7 = +[DownloadAssetEntity queryWithDatabase:v5 predicate:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10003188C;
  v10[3] = &unk_1003A39F0;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v7 enumeratePersistentIDsUsingBlock:v10];
}

- (BOOL)_shouldSuppressDialogForError:(id)a3
{
  return ISErrorIsEqual();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"download_state.auto_update_state", @"blocked_reason", @"download_state.blocked_reason", @"can_cancel", @"download_state.can_cancel", @"can_pause", @"download_state.can_pause", @"can_prioritize", @"download_state.can_prioritize", @"audit_token_data", @"client.audit_token_data", @"phase", @"download_state.phase", @"did_restore_data", @"download_state.did_restore_data", @"bundle_id", @"application_id.bundle_id",
           @"download_error",
           @"download_state.download_error",
           @"has_restore_data",
           @"download_state.has_restore_data",
           @"is_restricted",
           @"download_state.is_restricted",
           @"is_server_finished",
           @"download_state.is_server_finished",
           @"last_odr_action",
           @"download_state.last_odr_action",
           @"restore_data_size",
           @"download_state.restore_data_size",
           @"restore_state",
           @"download_state.restore_state",
           @"store_queue_refresh_count",
           @"download_state.store_queue_refresh_count",
           @"auto_update_state",
           @"IFNULL(download_state.auto_update_state, 0)",
           @"blocked_reason",
           @"IFNULL(download_state.blocked_reason, 0)",
           @"can_cancel",
           @"IFNULL(download_state.can_cancel, 1)",
           @"can_pause",
           @"IFNULL(download_state.can_pause, 1)",
           @"can_prioritize",
           @"IFNULL(download_state.can_prioritize, 1)",
           @"phase",
           @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")",
           @"bundle_id",
           @"IFNULL(application_id.bundle_id, download.client_id)",
           @"has_restore_data",
           @"IFNULL(download_state.has_restore_data, -1)",
           @"is_restricted",
           @"IFNULL(download_state.is_restricted, 0)",
           @"is_server_finished",
           @"IFNULL(download_state.is_server_finished, 0)",
           @"restore_data_size",
           @"IFNULL(download_state.restore_data_size, 0)",
           @"restore_state",
           @"IFNULL(download_state.restore_state, 0)",
           0);
    id v4 = (void *)qword_100401C50;
    qword_100401C50 = (uint64_t)v3;

    id v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"asset", @"client_id", @"client", @"download_id", @"download_state", @"effective_client_id", @"application_id", 0);
    id v6 = (void *)qword_100401C58;
    qword_100401C58 = (uint64_t)v5;

    id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"download_state", @"download_state.auto_update_state", @"download_state", @"download_state.blocked_reason", @"download_state", @"download_state.can_cancel", @"download_state", @"download_state.can_pause", @"download_state", @"download_state.can_prioritize", @"client", @"client.audit_token_data", @"download_state", @"download_state.did_restore_data", @"download_state", @"download_state.phase", @"application_id",
           @"application_id.bundle_id",
           @"download_state",
           @"download_state.download_error",
           @"download_state",
           @"download_state.has_restore_data",
           @"download_state",
           @"download_state.is_restricted",
           @"download_state",
           @"download_state.is_server_finished",
           @"download_state",
           @"download_state.last_odr_action",
           @"download_state",
           @"download_state.restore_data_size",
           @"download_state",
           @"download_state.restore_state",
           @"download_state",
           @"IFNULL(download_state.auto_update_state, 0)",
           @"download_state",
           @"IFNULL(download_state.blocked_reason, 0)",
           @"download_state",
           @"IFNULL(download_state.can_cancel, 1)",
           @"download_state",
           @"IFNULL(download_state.can_pause, 1)",
           @"download_state",
           @"IFNULL(download_state.can_prioritize, 1)",
           @"download_state",
           @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")",
           @"application_id",
           @"IFNULL(application_id.bundle_id, download.client_id)",
           @"download_state",
           @"IFNULL(download_state.has_restore_data, -1)",
           @"download_state",
           @"IFNULL(download_state.is_restricted, 0)",
           @"download_state",
           @"IFNULL(download_state.is_server_finished, 0)",
           @"download_state",
           @"IFNULL(download_state.restore_data_size, 0)",
           @"download_state",
           @"IFNULL(download_state.restore_state, 0)",
           @"download_state",
           @"download_state.store_queue_refresh_count",
           0);
    id v8 = (void *)qword_100401C60;
    qword_100401C60 = (uint64_t)v7;

    id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"asset", @"download_state", 0);
    id v10 = (void *)qword_100401C68;
    qword_100401C68 = (uint64_t)v9;

    id v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"auto_update_time", @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id", @"download_state.blocked_reason", @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id", @"download_state.can_cancel", @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id", @"download_state.can_pause", @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id", @"download_state.can_prioritize", @"LEFT OUTER JOIN client ON download.client_id = client.client_id", @"client.audit_token_data", @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id", @"download_state.did_restore_data", @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id", @"download_state.phase", @"LEFT OUTER JOIN application_id ON download.effective_client_id = application_id.effective_client_id", @"application_id.bundle_id",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.download_error",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.has_restore_data",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.is_restricted",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.is_server_finished",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.last_odr_action",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.restore_data_size",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.restore_state",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.auto_update_state, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.blocked_reason, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.can_cancel, 1)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.can_pause, 1)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.can_prioritize, 1)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")",
            @"LEFT OUTER JOIN application_id ON download.effective_client_id = application_id.effective_client_id",
            @"IFNULL(application_id.bundle_id, download.client_id)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.has_restore_data, -1)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.is_restricted, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.is_server_finished, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.restore_data_size, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.restore_state, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.store_queue_refresh_count",
            0);
    id v12 = (void *)qword_100401C70;
    qword_100401C70 = (uint64_t)v11;

    id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", @"client.audit_token_data", @"client.audit_token_data", @"application_id.bundle_id", @"application_id.bundle_id", @"IFNULL(download_state.auto_update_state, 0)", @"IFNULL(download_state.auto_update_state, 0)", @"IFNULL(download_state.blocked_reason, 0)", @"IFNULL(download_state.blocked_reason, 0)", @"IFNULL(download_state.can_cancel, 1)", @"IFNULL(download_state.can_cancel, 1)", @"IFNULL(download_state.can_pause, 1)", @"IFNULL(download_state.can_pause, 1)", @"IFNULL(download_state.can_prioritize, 1)", @"IFNULL(download_state.can_prioritize, 1)", @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")", @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")", @"IFNULL(application_id.bundle_id, download.client_id)",
            @"IFNULL(application_id.bundle_id, download.client_id)",
            @"IFNULL(download_state.has_restore_data, -1)",
            @"IFNULL(download_state.has_restore_data, -1)",
            @"IFNULL(download_state.is_restricted, 0)",
            @"IFNULL(download_state.is_restricted, 0)",
            @"IFNULL(download_state.is_server_finished, 0)",
            @"IFNULL(download_state.is_server_finished, 0)",
            @"IFNULL(download_state.restore_data_size, 0)",
            @"IFNULL(download_state.restore_data_size, 0)",
            @"IFNULL(download_state.restore_state, 0)",
            @"IFNULL(download_state.restore_state, 0)",
            @"IFNULL(download.store_item_id, 0)",
            @"IFNULL(download.store_item_id, 0)",
            0);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = objc_retain(objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"airplay_content_type", @"artist_name", @"artwork_is_prerendered", @"artwork_template_name", @"is_automatic", @"auto_update_time", @"download_state.blocked_reason", @"bundle_id", @"cancel_url", @"download_state.can_cancel", @"download_state.can_pause", @"download_state.can_prioritize", @"client_id", @"collection_artist_name", @"collection_group_count", @"collection_item_count",
              @"collection_name",
              @"composer_name",
              @"download_state.did_restore_data",
              @"document_target_id",
              @"download_state.phase",
              @"download_permalink",
              @"duet_transfer_type",
              @"duration_in_ms",
              @"effective_client_id",
              @"enable_extensions",
              @"download_state.download_error",
              @"episode_id",
              @"episode_sort_id",
              @"genre_name",
              @"handler_id",
              @"download_state.has_restore_data",
              @"index_in_collection",
              @"index_in_collection_group",
              @"is_compilation",
              @"is_device_based_vpp",
              @"is_explicit",
              @"is_hd",
              @"is_hls",
              @"is_store_queued",
              @"is_premium",
              @"is_private",
              @"is_purchase",
              @"is_redownload",
              @"is_rental",
              @"is_restore",
              @"download_state.is_restricted",
              @"download_state.is_server_finished",
              @"is_sample",
              @"is_shared",
              @"is_from_store",
              @"is_tv_template",
              @"is_music_show",
              @"show_composer",
              @"work_name",
              @"kind",
              @"download_state.last_odr_action",
              @"library_id",
              @"long_description",
              @"long_season_description",
              @"network_name"));
    id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v20 = [a1 disambiguatedSQLForProperty:v19];
          [v13 setObject:v20 forKey:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v16);
    }

    id v21 = [v13 copy];
    int v22 = (void *)qword_100401C48;
    qword_100401C48 = (uint64_t)v21;

    id v33 = objc_alloc((Class)NSDictionary);
    uint64_t v23 = SSDownloadPropertyClientBundleIdentifier;
    uint64_t v24 = SSDownloadPropertyDownloadPhase;
    uint64_t v25 = SSDownloadPropertyCanPrioritize;
    uint64_t v26 = SSDownloadPropertyCanPause;
    uint64_t v27 = SSDownloadPropertyCanCancel;
    uint64_t v28 = SSDownloadPropertyIsContentRestricted;
    id v29 = objc_msgSend(v33, "initWithObjectsAndKeys:", @"airplay_content_type", SSDownloadPropertyAirPlayContentType, @"artist_name", SSDownloadPropertyArtistName, @"artwork_is_prerendered", SSDownloadPropertyArtworkIsPrerendered, @"artwork_template_name", SSDownloadPropertyArtworkTemplateName, @"is_automatic", SSDownloadPropertyAutomaticType, @"auto_update_time", SSDownloadPropertyAutoUpdateTime, @"beta_external_version_identifier", SSDownloadPropertyBetaExternalVersionIdentifier, @"bundle_id", SSDownloadPropertyBundleIdentifier, @"bundle_version",
            SSDownloadPropertyBundleVersion,
            @"cancel_url",
            SSDownloadPropertyStoreCancelURL,
            @"collection_artist_name",
            SSDownloadPropertyCollectionArtistName,
            @"collection_group_count",
            SSDownloadPropertyNumberOfCollectionsInGroup,
            @"collection_item_count",
            SSDownloadPropertyNumberOfItemsInCollection,
            @"collection_name",
            SSDownloadPropertyCollectionName,
            @"composer_name",
            SSDownloadPropertyComposerName,
            @"document_target_id",
            SSDownloadPropertyDocumentTargetIdentifier,
            @"download_permalink",
            SSDownloadPropertyDownloadPermalink,
            @"duet_transfer_type",
            SSDownloadPropertyDuetTransferType,
            @"duration_in_ms",
            SSDownloadPropertyDurationInMilliseconds,
            @"episode_id",
            SSDownloadPropertyEpisodeIdentifier,
            @"episode_sort_id",
            SSDownloadPropertyEpisodeSortIdentifier,
            @"enable_extensions",
            SSDownloadPropertyEnableExtensions,
            @"download_state.download_error",
            SSDownloadPropertyEncodedErrorData,
            @"genre_name",
            SSDownloadPropertyGenre,
            @"handler_id",
            SSDownloadPropertyHandlerID,
            @"has_messages_extension",
            SSDownloadPropertyHasMessagesExtension,
            @"is_hls",
            SSDownloadPropertyIsHLS,
            @"hls_playlist_url",
            SSDownloadPropertyHLSPlaylistURL,
            @"index_in_collection",
            SSDownloadPropertyIndexInCollection,
            @"index_in_collection_group",
            SSDownloadPropertyIndexInCollectionGroup,
            @"is_compilation");
    long long v30 = (void *)qword_100401C78;
    qword_100401C78 = (uint64_t)v29;

    id v31 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"download_state.can_cancel", v27, @"download_state.can_pause", v26, @"application_id.bundle_id", v23, @"download_state.can_prioritize", v25, @"download_state.phase", v24, @"download_state.is_restricted", v28, 0);
    long long v32 = (void *)qword_100401C80;
    qword_100401C80 = (uint64_t)v31;
  }
}

@end