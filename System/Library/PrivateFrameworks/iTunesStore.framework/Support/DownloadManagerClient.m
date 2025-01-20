@interface DownloadManagerClient
- (BOOL)_isBackgroundApp;
- (BOOL)_supportsDownloadKind:(id)a3;
- (BOOL)canAccessAsset:(id)a3;
- (BOOL)canAccessDownload:(id)a3;
- (BOOL)hasEntitlements;
- (BOOL)reloadPersistenceStateInDatabase:(id)a3;
- (BOOL)shouldFilterExternalDownloads;
- (BOOL)supportsDownloadKind:(id)a3;
- (DownloadManagerClient)initWithInputConnection:(id)a3;
- (NSArray)prefetchedDownloadExternalProperties;
- (NSArray)prefetchedDownloadProperties;
- (NSSet)downloadKinds;
- (NSString)persistenceIdentifier;
- (id)_copyAllowedThirdPartyKinds;
- (id)_copyDownloadKindsFromEntitlement;
- (id)_copyFilteredKindsForKinds:(id)a3;
- (id)_copyPrivateDownloadKinds;
- (id)downloadsQueryForMessage:(id)a3 database:(id)a4;
- (id)newDownloadWithClientXPCDownload:(id)a3 error:(id *)a4;
- (id)persistentDownloadManagerInDatabase:(id)a3;
- (void)_sendCoalescableMessage:(int64_t)a3 withDownloadIDs:(id)a4;
- (void)addClientEntityToDatabase:(id)a3;
- (void)dealloc;
- (void)sendChangeset:(id)a3;
- (void)sendDownloadKindsUsingNetwork:(id)a3;
- (void)sendDownloadStateChangedWithID:(int64_t)a3 externalValues:(id)a4 propertyValues:(id)a5;
- (void)sendDownloadStatesChangedWithIdentifiers:(id)a3;
- (void)sendDownloadsRemovedWithIdentifiers:(id)a3;
- (void)sendDownloadsUpdatedWithIdentifiers:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setDownloadKinds:(id)a3;
- (void)setPersistenceIdentifier:(id)a3;
- (void)setPrefetchedDownloadExternalProperties:(id)a3;
- (void)setPrefetchedDownloadProperties:(id)a3;
- (void)setShouldFilterExternalDownloads:(BOOL)a3;
@end

@implementation DownloadManagerClient

- (NSArray)prefetchedDownloadProperties
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1000A0DA8;
  v10 = sub_1000A0DB8;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BDE4;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldFilterExternalDownloads
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BDC8;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)prefetchedDownloadExternalProperties
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000A0DA8;
  v10 = sub_1000A0DB8;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BB2C;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientOptions:(id)a3
{
  if (a3)
  {
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      dispatchQueue = self->super._dispatchQueue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000054F0;
      v6[3] = &unk_1003A3380;
      v6[4] = self;
      v6[5] = a3;
      dispatch_sync(dispatchQueue, v6);
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadManagerClient;
  [(XPCClient *)&v3 dealloc];
}

- (DownloadManagerClient)initWithInputConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadManagerClient;
  v4 = -[XPCClient initWithInputConnection:](&v6, "initWithInputConnection:");
  if (v4)
  {
    if (a3) {
      v4->_isDownloadsEntitled = SSXPCConnectionHasEntitlement();
    }
    if (!v4->super._entitlements && !v4->_isDownloadsEntitled) {
      v4->_shouldFilterExternalDownloads = 1;
    }
  }
  return v4;
}

- (void)addClientEntityToDatabase:(id)a3
{
  v5 = [(XPCClient *)self clientIdentifier];
  if (v5)
  {
    objc_super v6 = v5;
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:v6 forKey:@"client_id"];
    v7 = [(XPCClient *)self auditTokenData];
    if (v7) {
      [v8 setObject:v7 forKey:@"audit_token_data"];
    }
    objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (id)-[XPCClient clientType](self, "clientType") == (id)1), @"client_type");
  }
}

- (id)persistentDownloadManagerInDatabase:(id)a3
{
  v5 = [(XPCClient *)self clientIdentifier];
  objc_super v6 = [(DownloadManagerClient *)self persistenceIdentifier];
  if (!v5 || !v6) {
    return 0;
  }
  id v7 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"client_id", v5), +[SSSQLiteComparisonPredicate predicateWithProperty:@"persistence_id" equalToValue:v6], 0));

  return +[PersistentDownloadManagerEntity anyInDatabase:a3 predicate:v7];
}

- (NSString)persistenceIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000A0DA8;
  v10 = sub_1000A0DB8;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004C84;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)downloadsQueryForMessage:(id)a3 database:(id)a4
{
  if (xpc_dictionary_get_int64(a3, "0") != 39) {
    goto LABEL_6;
  }
  objc_opt_class();
  id v7 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
  if (![v7 count])
  {

LABEL_6:
    uint64_t v8 = [(DownloadManagerClient *)self downloadKinds];
    goto LABEL_7;
  }
  uint64_t v8 = +[NSSet setWithArray:v7];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:
  char v9 = [(XPCClient *)self clientIdentifier];
  id v10 = 0;
  if (v9 && v8)
  {
    uint64_t v11 = v9;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    BOOL v13 = xpc_dictionary_get_BOOL(a3, "1");
    v14 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"client_id" equalToValue:v11];
    if (v13)
    {
      v23[0] = v14;
      v23[1] = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(application_id.bundle_id, download.client_id)" equalToValue:v11];
      v15 = +[NSArray arrayWithObjects:v23 count:2];
    }
    else
    {
      v15 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_private" equalToLongLong:0], v14, 0);
    }
    objc_msgSend(v12, "addObject:", +[SSSQLiteCompoundPredicate predicateMatchingAnyPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAnyPredicates:", v15));
    objc_msgSend(v12, "addObject:", +[SSSQLiteContainsPredicate containsPredicateWithProperty:values:](SSSQLiteContainsPredicate, "containsPredicateWithProperty:values:", @"kind", v8));
    id v16 = objc_alloc((Class)NSArray);
    id v17 = objc_msgSend(v16, "initWithObjects:", SSDownloadPhaseFailed, SSDownloadPhaseFinished, SSDownloadPhaseCanceled, 0);
    id v18 = [(DownloadManagerClient *)self persistentDownloadManagerInDatabase:a4];
    if (v18)
    {
      id v19 = +[PersistentDownloadEntity queryWithDatabase:predicate:](PersistentDownloadEntity, "queryWithDatabase:predicate:", a4, +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"manager_id", [v18 persistentID]));
      id v20 = +[SSSQLiteCompoundPredicate predicateMatchingAnyPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAnyPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:values:](SSSQLiteContainsPredicate, "doesNotContainPredicateWithProperty:values:", @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")", v17), +[SSSQLiteContainsPredicate containsPredicateWithProperty:SSSQLEntityPropertyPersistentID query:v19 queryProperty:@"download_id"], 0));
    }
    else
    {
      id v20 = +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:@"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")" values:v17];
    }
    [v12 addObject:v20];

    id v21 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
    [v21 setEntityClass:objc_opt_class()];
    objc_msgSend(v21, "setOrderingDirections:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", SSSQLiteOrderDescending, SSSQLiteOrderAscending, 0));
    objc_msgSend(v21, "setOrderingProperties:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"priority", @"order_key", 0));
    objc_msgSend(v21, "setPredicate:", +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", v12));

    id v10 = [objc_alloc((Class)SSSQLiteQuery) initWithDatabase:a4 descriptor:v21];
  }
  return v10;
}

- (id)_copyFilteredKindsForKinds:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [(DownloadManagerClient *)self _copyPrivateDownloadKinds];
  id v6 = [(DownloadManagerClient *)self _copyDownloadKindsFromEntitlement];
  if (v6)
  {
    [v5 minusSet:v6];
  }
  else if (self->super._legacyEntitlements || self->_isDownloadsEntitled)
  {
    [v5 removeAllObjects];
  }
  else if ((id)[(XPCClient *)self _clientType] == (id)1)
  {
    id v18 = [(DownloadManagerClient *)self _copyAllowedThirdPartyKinds];
    [v5 unionSet:a3];
    if (v18)
    {
      [v5 minusSet:v18];
    }
  }

  id v8 = [a3 mutableCopy];
  id v9 = [v8 mutableCopy];
  [v9 intersectSet:v5];
  if ([v9 count])
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v13 = objc_opt_class();
      clientIdentifier = self->super._clientIdentifier;
      int v20 = 138412802;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      v23 = clientIdentifier;
      __int16 v24 = 2112;
      id v25 = v9;
      LODWORD(v19) = 32;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        id v16 = (void *)v15;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v20, v19);
        free(v16);
        SSFileLog();
      }
    }
  }

  [v8 minusSet:v5];
  id v7 = [v8 copy];

  return v7;
}

- (id)_copyPrivateDownloadKinds
{
  id v2 = objc_alloc((Class)NSMutableSet);
  return objc_msgSend(v2, "initWithObjects:", SSDownloadKindAudiobook, SSDownloadKindCoachedAudio, SSDownloadKindEBook, SSDownloadKindMovie, SSDownloadKindMusic, SSDownloadKindMusicVideo, SSDownloadKindOSUpdate, SSDownloadKindPodcast, SSDownloadKindRingtone, SSDownloadKindSoftwareApplication, SSDownloadKindTelevisionEpisode, SSDownloadKindTone, SSDownloadKindVideoPodcast, 0);
}

- (BOOL)reloadPersistenceStateInDatabase:(id)a3
{
  id v5 = [(DownloadManagerClient *)self persistenceIdentifier];
  if (v5)
  {
    id v6 = v5;
    id v7 = [(DownloadManagerClient *)self downloadKinds];
    unsigned int v8 = [(NSSet *)v7 containsObject:SSDownloadKindNewsstandContent];
    char v9 = v8;
    if (v8) {
      BOOL v10 = (id)[(XPCClient *)self clientType] == (id)1;
    }
    else {
      BOOL v10 = 0;
    }
    int v12 = (PersistentDownloadManagerEntity *)[(DownloadManagerClient *)self persistentDownloadManagerInDatabase:a3];
    BOOL v36 = v10;
    if (v12)
    {
      uint64_t v13 = v12;
      if (v9)
      {
        if (objc_msgSend(-[PersistentDownloadManagerEntity valueForProperty:](v12, "valueForProperty:", @"migration_version"), "integerValue") != (id)1)
        {
          id v14 = +[SSLogConfig sharedDaemonConfig];
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
          if (os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_INFO)) {
            int v17 = v16;
          }
          else {
            int v17 = v16 & 2;
          }
          if (v17)
          {
            int v42 = 138412546;
            uint64_t v43 = objc_opt_class();
            __int16 v44 = 2112;
            v45 = [(XPCClient *)self clientIdentifier];
            LODWORD(v34) = 22;
            v33 = &v42;
            uint64_t v18 = _os_log_send_and_compose_impl();
            if (v18)
            {
              uint64_t v19 = (void *)v18;
              int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v42, v34);
              free(v19);
              v33 = (int *)v20;
              SSFileLog();
            }
          }
          -[PersistentDownloadManagerEntity performNewsstandMigration1InDatabase:](v13, "performNewsstandMigration1InDatabase:", a3, v33);
        }
      }
      else
      {
        [(PersistentDownloadManagerEntity *)v12 setValue:+[NSNumber numberWithInteger:1] forProperty:@"migration_version"];
      }
    }
    else
    {
      id v21 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v6, @"persistence_id", -[XPCClient clientIdentifier](self, "clientIdentifier"), @"client_id", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10), @"wake_up_on_finish", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), @"migration_version", 0);
      uint64_t v13 = [[PersistentDownloadManagerEntity alloc] initWithPropertyValues:v21 inDatabase:a3];

      if (!v13) {
        goto LABEL_34;
      }
    }
    if (objc_msgSend(+[PersistentDownloadManagerKindEntity queryWithDatabase:predicate:](PersistentDownloadManagerKindEntity, "queryWithDatabase:predicate:", a3, +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"manager_id", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[PersistentDownloadManagerEntity persistentID](v13, "persistentID")))), "deleteAllEntities"))
    {
      __int16 v22 = +[NSNumber numberWithLongLong:[(PersistentDownloadManagerEntity *)v13 persistentID]];
      v35 = self;
      v23 = [(DownloadManagerClient *)self downloadKinds];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v24 = [(NSSet *)v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v38;
        while (2)
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v22, @"manager_id", *(void *)(*((void *)&v37 + 1) + 8 * i), @"download_kind", 0);
            id v29 = a3;
            v30 = [[PersistentDownloadManagerKindEntity alloc] initWithPropertyValues:v28 inDatabase:a3];

            if (!v30)
            {
              BOOL v11 = 0;
              goto LABEL_36;
            }
            a3 = v29;
          }
          id v25 = [(NSSet *)v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
      id v31 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DownloadManagerClient shouldFilterExternalDownloads](v35, "shouldFilterExternalDownloads")), @"filters_external_downloads", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v36), @"wake_up_on_finish", 0);
      [(PersistentDownloadManagerEntity *)v13 setValuesWithDictionary:v31];

      BOOL v11 = 1;
      goto LABEL_36;
    }
LABEL_34:
    BOOL v11 = 0;
LABEL_36:

    return v11;
  }
  return 1;
}

- (NSSet)downloadKinds
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1000A0DA8;
  BOOL v10 = sub_1000A0DB8;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000044C0;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDownloadKinds:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BEBC;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)_copyDownloadKindsFromEntitlement
{
  if (self->super._legacyEntitlements || self->_isDownloadsEntitled)
  {
    return [(DownloadManagerClient *)self _copyPrivateDownloadKinds];
  }
  else
  {
    id result = [(XPCClient *)self valueForEntitlement:@"PrivateDownloadKinds"];
    if (result)
    {
      id v3 = result;
      id v4 = objc_alloc((Class)NSMutableSet);
      return [v4 initWithArray:v3];
    }
  }
  return result;
}

- (BOOL)canAccessAsset:(id)a3
{
  id v5 = [a3 valueForProperty:@"download_id"];
  if (v5)
  {
    uint64_t v6 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v5 longLongValue], objc_msgSend(a3, "database"));
    unsigned __int8 v7 = [(DownloadManagerClient *)self canAccessDownload:v6];

    LOBYTE(v5) = v7;
  }
  return (char)v5;
}

- (BOOL)canAccessDownload:(id)a3
{
  v7[0] = @"client_id";
  v7[1] = @"is_private";
  v7[2] = @"kind";
  [a3 getValues:v6 forProperties:v7 count:3];
  if (v6[2])
  {
    unsigned int v4 = -[DownloadManagerClient supportsDownloadKind:](self, "supportsDownloadKind:");
    if (v4)
    {
      if ([v6[1] BOOLValue] && v6[0]) {
        LOBYTE(v4) = objc_msgSend(v6[0], "isEqualToString:", -[XPCClient clientIdentifier](self, "clientIdentifier"));
      }
      else {
        LOBYTE(v4) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)newDownloadWithClientXPCDownload:(id)a3 error:(id *)a4
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = sub_1000A0DA8;
  v33 = sub_1000A0DB8;
  uint64_t v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3052000000;
  uint64_t v26 = sub_1000A0DA8;
  v27 = sub_1000A0DB8;
  uint64_t v28 = 0;
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    dispatchQueue = self->super._dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A10D8;
    block[3] = &unk_1003A53C8;
    block[4] = a3;
    block[5] = self;
    block[6] = &v23;
    block[7] = &v29;
    dispatch_sync(dispatchQueue, block);
    id v15 = (id)v24[5];
  }
  else
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    unsigned int v9 = [v7 shouldLogToDisk];
    BOOL v10 = [v7 OSLogObject];
    if (v9) {
      v8 |= 2u;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      uint64_t v11 = objc_opt_class();
      int v35 = 138412290;
      uint64_t v36 = v11;
      LODWORD(v21) = 12;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v35, v21);
        free(v13);
        SSFileLog();
      }
    }
    id v14 = objc_alloc((Class)NSError);
    id v15 = [v14 initWithDomain:SSErrorDomain code:400 userInfo:0];
    v24[5] = (uint64_t)v15;
  }
  id v17 = v15;
  uint64_t v18 = v30;
  uint64_t v19 = (void *)v30[5];
  if (a4 && !v19)
  {
    *a4 = (id)v24[5];
    uint64_t v19 = (void *)v18[5];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v19;
}

- (void)sendChangeset:(id)a3
{
  id v5 = [a3 downloadChangeTypes];
  if ([(XPCClient *)self canReceiveMessages])
  {
    id v6 = [a3 statusChangedDownloadIDs];
    if (v5)
    {
      [(XPCClient *)self sendCoalescedMessageWithIdentifier:1003];
      if ((v5 & 2) == 0) {
        return;
      }
      goto LABEL_14;
    }
    if ((v5 & 8) != 0)
    {
      id v10 = [a3 removedDownloadIDs];
      id v11 = [a3 removedPersistentDownloadIDs];
      if ([(NSString *)[(DownloadManagerClient *)self persistenceIdentifier] length])
      {
        if ([v10 count]) {
          [(DownloadManagerClient *)self sendDownloadsRemovedWithIdentifiers:v10];
        }
        if ([v11 count])
        {
          if ([v6 count])
          {
            id v12 = [v11 mutableCopy];
            [v12 minusSet:v6];
            if ([v12 count]) {
              [(DownloadManagerClient *)self sendDownloadsUpdatedWithIdentifiers:v12];
            }
          }
          else
          {
            [(DownloadManagerClient *)self sendDownloadsUpdatedWithIdentifiers:v11];
          }
        }
      }
      else if ([v11 count])
      {
        id v13 = [v10 mutableCopy];
        [v13 unionOrderedSet:v11];
        [(DownloadManagerClient *)self sendDownloadsRemovedWithIdentifiers:v13];
      }
      else
      {
        [(DownloadManagerClient *)self sendDownloadsRemovedWithIdentifiers:v10];
      }
    }
    if ((v5 & 0x10) != 0) {
      -[DownloadManagerClient sendDownloadsUpdatedWithIdentifiers:](self, "sendDownloadsUpdatedWithIdentifiers:", [a3 updatedDownloadIDs]);
    }
    if ((v5 & 2) != 0)
    {
LABEL_14:
      if ([v6 count] == (id)1)
      {
        id v7 = objc_msgSend(objc_msgSend(v6, "anyObject"), "longLongValue");
        id v8 = [a3 changedExternalDownloadProperties];
        id v9 = [a3 changedDownloadProperties];
        [(DownloadManagerClient *)self sendDownloadStateChangedWithID:v7 externalValues:v8 propertyValues:v9];
      }
      else
      {
        [(DownloadManagerClient *)self sendDownloadStatesChangedWithIdentifiers:v6];
      }
    }
  }
  else if (v5)
  {
    [(XPCClient *)self sendCoalescedMessageWithIdentifier:1003];
  }
}

- (void)sendDownloadKindsUsingNetwork:(id)a3
{
  if ([(XPCClient *)self canReceiveMessages])
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 1006);
    SSXPCDictionarySetCFObject();
    [(SSXPCConnection *)self->super._outputConnection sendMessage:v4 withReply:&stru_1003A5408];
    xpc_release(v4);
  }
  else
  {
    [(XPCClient *)self sendCoalescedMessageWithIdentifier:1006];
  }
}

- (void)sendDownloadsRemovedWithIdentifiers:(id)a3
{
}

- (void)sendDownloadStateChangedWithID:(int64_t)a3 externalValues:(id)a4 propertyValues:(id)a5
{
  if ([(XPCClient *)self canReceiveMessages])
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "0", 1004);
    SSXPCDictionarySetCFObject();
    SSXPCDictionarySetCFObject();
    xpc_object_t v8 = xpc_array_create(0, 0);
    xpc_array_set_int64(v8, 0xFFFFFFFFFFFFFFFFLL, a3);
    xpc_dictionary_set_value(v7, "1", v8);
    xpc_release(v8);
    [(SSXPCConnection *)self->super._outputConnection sendMessage:v7 withReply:&stru_1003A5428];
    xpc_release(v7);
  }
  else
  {
    [(XPCClient *)self sendCoalescedMessageWithIdentifier:1003];
  }
}

- (void)sendDownloadStatesChangedWithIdentifiers:(id)a3
{
}

- (void)sendDownloadsUpdatedWithIdentifiers:(id)a3
{
}

- (void)setPersistenceIdentifier:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1A20;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setPrefetchedDownloadProperties:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1AEC;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setPrefetchedDownloadExternalProperties:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1BB8;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setShouldFilterExternalDownloads:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1C88;
  v4[3] = &unk_1003A3860;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (BOOL)supportsDownloadKind:(id)a3
{
  uint64_t v7 = 0;
  xpc_object_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  dispatchQueue = self->super._dispatchQueue;
  char v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1D5C;
  block[3] = &unk_1003A5450;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)hasEntitlements
{
  if (self->_isDownloadsEntitled) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)DownloadManagerClient;
  return [(XPCClient *)&v3 hasEntitlements];
}

- (id)_copyAllowedThirdPartyKinds
{
  if (![(XPCClient *)self _isNewsstandApp]
    || !objc_msgSend(-[XPCClient _applicationBackgroundModes](self, "_applicationBackgroundModes"), "containsObject:", @"newsstand-content"))
  {
    return 0;
  }
  id v3 = objc_alloc((Class)NSMutableSet);
  return objc_msgSend(v3, "initWithObjects:", SSDownloadKindNewsstandContent, 0);
}

- (BOOL)_isBackgroundApp
{
  unsigned int v2 = [(XPCClient *)self _applicationState];
  return (v2 < 5) & (0x16u >> v2);
}

- (void)_sendCoalescableMessage:(int64_t)a3 withDownloadIDs:(id)a4
{
  if ([(XPCClient *)self canReceiveMessages])
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "0", a3);
    xpc_object_t v8 = xpc_array_create(0, 0);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(a4);
          }
          xpc_array_set_int64(v8, 0xFFFFFFFFFFFFFFFFLL, (int64_t)[*(id *)(*((void *)&v13 + 1) + 8 * i) longLongValue]);
        }
        id v10 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
    xpc_dictionary_set_value(v7, "1", v8);
    xpc_release(v8);
    [(SSXPCConnection *)self->super._outputConnection sendMessage:v7 withReply:&stru_1003A5470];
    xpc_release(v7);
  }
  else
  {
    [(XPCClient *)self sendCoalescedMessageWithIdentifier:1003];
  }
}

- (BOOL)_supportsDownloadKind:(id)a3
{
  downloadKinds = self->_downloadKinds;
  if (downloadKinds)
  {
    return -[NSSet containsObject:](downloadKinds, "containsObject:");
  }
  else
  {
    id v7 = [(DownloadManagerClient *)self _copyPrivateDownloadKinds];
    if ([v7 containsObject:a3])
    {
      id v8 = [(DownloadManagerClient *)self _copyDownloadKindsFromEntitlement];
      unsigned __int8 v9 = [v8 containsObject:a3];
    }
    else
    {
      unsigned __int8 v9 = 1;
    }

    return v9;
  }
}

@end