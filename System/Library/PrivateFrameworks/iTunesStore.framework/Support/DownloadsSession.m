@interface DownloadsSession
- (BOOL)placeholderDownloadCanceledForPurchaseIdentifier:(int64_t)a3;
- (DownloadPipeline)pipeline;
- (DownloadPolicyManager)policyManager;
- (DownloadsSession)init;
- (DownloadsSession)initWithSessionDescriptor:(id)a3;
- (NSOrderedSet)activeDownloadIdentifiers;
- (SSSQLiteDatabase)database;
- (id)downloadForStoreDownload:(id)a3;
- (id)externalValuesForDownloadID:(int64_t)a3;
- (id)newEventDictionaryWithDownloadIdentifier:(int64_t)a3 assetIdentifier:(int64_t)a4;
- (id)placeholderDownloadForPurchase:(id)a3;
- (id)placeholderDownloadForPurchaseIdentifier:(int64_t)a3;
- (id)valueForExternalProperty:(id)a3 ofAssetID:(int64_t)a4;
- (id)valueForExternalProperty:(id)a3 ofDownloadID:(int64_t)a4;
- (void)dealloc;
@end

@implementation DownloadsSession

- (SSSQLiteDatabase)database
{
  return self->_database;
}

- (DownloadsSession)initWithSessionDescriptor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadsSession;
  v4 = [(DownloadsSession *)&v6 init];
  if (v4)
  {
    v4->_database = (SSSQLiteDatabase *)[a3 database];
    v4->_externalState = (ExternalDownloadState *)[a3 externalState];
    v4->_pipeline = (DownloadPipeline *)[a3 pipeline];
    v4->_policyManager = (DownloadPolicyManager *)[a3 policyManager];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadsSession;
  [(DownloadsSession *)&v3 dealloc];
}

- (DownloadsSession)init
{
  return [(DownloadsSession *)self initWithSessionDescriptor:0];
}

- (NSOrderedSet)activeDownloadIdentifiers
{
  return 0;
}

- (id)downloadForStoreDownload:(id)a3
{
  id result = [a3 transactionIdentifier];
  if (result)
  {
    id v6 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"store_item_id", [a3 itemIdentifier]), +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"store_transaction_id", result), 0));
    database = self->_database;
    return +[DownloadEntity anyInDatabase:database predicate:v6];
  }
  return result;
}

- (id)externalValuesForDownloadID:(int64_t)a3
{
  return [(ExternalDownloadState *)self->_externalState externalValuesForDownloadID:a3];
}

- (id)newEventDictionaryWithDownloadIdentifier:(int64_t)a3 assetIdentifier:(int64_t)a4
{
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = +[NSNumber numberWithLongLong:a4];
  [v7 setObject:v8 forKey:SSEventKeyDownloadAssetIdentifier];
  v9 = +[NSNumber numberWithLongLong:a3];
  [v7 setObject:v9 forKey:SSEventKeyDownloadIdentifier];
  v10 = [[DownloadAssetEntity alloc] initWithPersistentID:a4 inDatabase:self->_database];
  id v25 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"bytes_total", @"url", 0);
  v26 = v10;
  id v11 = [objc_alloc((Class)SSMemoryEntity) initWithDatabaseEntity:v10 properties:v25];
  id v12 = [v11 valueForProperty:@"bytes_total"];
  if (v12) {
    [v7 setObject:v12 forKey:SSEventKeySizeInBytes];
  }
  id v13 = [v11 valueForProperty:@"url"];
  if (v13) {
    [v7 setObject:v13 forKey:SSEventKeyURLString];
  }
  v14 = [[DownloadEntity alloc] initWithPersistentID:a3 inDatabase:self->_database];
  id v15 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"is_automatic", @"client_id", @"is_restore", @"kind", 0);
  id v16 = [objc_alloc((Class)SSMemoryEntity) initWithDatabaseEntity:v14 properties:v15];
  uint64_t v17 = SSEventDownloadClassUserInitiated;
  if (objc_msgSend(objc_msgSend(v16, "valueForProperty:", @"is_restore"), "BOOLValue"))
  {
    v18 = (uint64_t *)&SSEventDownloadClassRestore;
LABEL_11:
    uint64_t v17 = *v18;
    v21 = v25;
    v20 = v26;
    goto LABEL_12;
  }
  id v19 = objc_msgSend(objc_msgSend(v16, "valueForProperty:", @"is_automatic"), "integerValue");
  if (v19 == (id)2)
  {
    v18 = (uint64_t *)&SSEventDownloadClassAutomaticUpdate;
    goto LABEL_11;
  }
  v21 = v25;
  v20 = v26;
  if (v19 == (id)1) {
    uint64_t v17 = SSEventDownloadClassAutomaticDownload;
  }
LABEL_12:
  [v7 setObject:v17 forKey:SSEventKeyDownloadClass];
  id v22 = [v16 valueForProperty:@"kind"];
  if (v22) {
    [v7 setObject:v22 forKey:SSEventKeyDownloadKind];
  }
  id v23 = [v16 valueForProperty:@"client_id"];
  if (v23) {
    [v7 setObject:v23 forKey:SSEventKeyClientIdentifier];
  }

  return v7;
}

- (BOOL)placeholderDownloadCanceledForPurchaseIdentifier:(int64_t)a3
{
  id v3 = objc_msgSend(-[DownloadsSession placeholderDownloadForPurchaseIdentifier:](self, "placeholderDownloadForPurchaseIdentifier:", a3), "valueForProperty:", @"download_state.phase");
  uint64_t v4 = SSDownloadPhaseCanceled;

  return [v3 isEqualToString:v4];
}

- (id)placeholderDownloadForPurchase:(id)a3
{
  id v5 = [a3 valueForDownloadProperty:SSSQLEntityPropertyPersistentID];
  if (!v5
    || (id result = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v5 longLongValue], self->_database)) == 0)
  {
    id v7 = [a3 uniqueIdentifier];
    return [(DownloadsSession *)self placeholderDownloadForPurchaseIdentifier:v7];
  }
  return result;
}

- (id)placeholderDownloadForPurchaseIdentifier:(int64_t)a3
{
  id v4 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"is_purchase", 1), +[SSSQLiteComparisonPredicate predicateWithProperty:@"purchase_id" equalToLongLong:a3], 0));
  database = self->_database;

  return +[DownloadEntity anyInDatabase:database predicate:v4];
}

- (id)valueForExternalProperty:(id)a3 ofAssetID:(int64_t)a4
{
  if ([a3 isEqualToString:SSDownloadAssetExternalPropertySINFs])
  {
    id v7 = [[DownloadAssetEntity alloc] initWithPersistentID:a4 inDatabase:self->_database];
    v8 = [(DownloadAssetEntity *)v7 sinfs];

    return v8;
  }
  else
  {
    externalState = self->_externalState;
    return [(ExternalDownloadState *)externalState valueForExternalProperty:a3 ofAssetID:a4];
  }
}

- (id)valueForExternalProperty:(id)a3 ofDownloadID:(int64_t)a4
{
  if ([a3 isEqualToString:SSDownloadExternalPropertyRentalInformation])
  {
    id v7 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:self->_database];
    id v8 = [(DownloadEntity *)v7 rentalInformation];

    return v8;
  }
  if ([a3 isEqualToString:SSDownloadExternalPropertyPolicy])
  {
    v10 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:self->_database];
    id v11 = [(DownloadEntity *)v10 valueForProperty:@"policy_id"];
    if (v11)
    {
      id v12 = -[DownloadPolicyManager downloadPolicyForID:](self->_policyManager, "downloadPolicyForID:", [v11 longLongValue]);
      uint64_t v25 = 0;
      id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v25];
      if (v25)
      {
        id v14 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v14) {
          id v14 = +[SSLogConfig sharedConfig];
        }
        unsigned int v15 = [v14 shouldLog];
        if ([v14 shouldLogToDisk]) {
          int v16 = v15 | 2;
        }
        else {
          int v16 = v15;
        }
        if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v16 &= 2u;
        }
        if (v16)
        {
          uint64_t v17 = objc_opt_class();
          int v26 = 138543618;
          uint64_t v27 = v17;
          __int16 v28 = 2114;
          uint64_t v29 = v25;
          LODWORD(v24) = 22;
          uint64_t v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            id v19 = (void *)v18;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v26, v24);
            free(v19);
            SSFileLog();
          }
        }
      }
    }
    else
    {
      id v13 = 0;
    }

    return v13;
  }
  if ([a3 isEqualToString:SSDownloadExternalPropertyPolicySizeLimit])
  {
    id v20 = [(DownloadPolicyManager *)self->_policyManager overrideDownloadSizeLimitForDownloadIdentifier:a4];
    if (v20)
    {
      id v21 = [v20 longLongValue];
    }
    else
    {
      id v22 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:self->_database];
      id v23 = [(DownloadEntity *)v22 valueForProperty:@"policy_id"];
      if (v23) {
        id v21 = -[DownloadPolicyManager downloadSizeLimitForPolicyWithID:](self->_policyManager, "downloadSizeLimitForPolicyWithID:", [v23 longLongValue]);
      }
      else {
        id v21 = (id)SSDownloadSizeLimitNoLimit;
      }
    }
    return +[NSNumber numberWithLongLong:v21];
  }
  id v13 = [(ExternalDownloadState *)self->_externalState valueForExternalProperty:a3 ofDownloadID:a4];
  if (v13) {
    return v13;
  }
  if (![a3 isEqualToString:SSDownloadExternalPropertyPercentComplete]) {
    return 0;
  }

  return +[NSNumber numberWithInteger:0];
}

- (DownloadPipeline)pipeline
{
  return self->_pipeline;
}

- (DownloadPolicyManager)policyManager
{
  return self->_policyManager;
}

@end