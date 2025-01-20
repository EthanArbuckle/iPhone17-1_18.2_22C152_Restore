@interface DownloadsTransaction
+ (double)orderKeyIncrement;
+ (unsigned)orderingBucketSize;
- (BOOL)_moveDownloadWithID:(int64_t)a3 relativeToDownloadWithID:(int64_t)a4 comparisonType:(int64_t)a5;
- (BOOL)_resetDownload:(id)a3 withValues:(const void *)a4 isUserIntiated:(BOOL)a5;
- (BOOL)deletePersistentDownloadManagerWithClientID:(id)a3 persistenceID:(id)a4;
- (BOOL)deletePersistentDownloadManagerWithID:(int64_t)a3;
- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4;
- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4 updatePipeline:(BOOL)a5;
- (BOOL)finishDownloadsWithIdentifiers:(id)a3 finalPhase:(id)a4;
- (BOOL)moveDownloadWithID:(int64_t)a3 afterDownloadWithID:(int64_t)a4;
- (BOOL)moveDownloadWithID:(int64_t)a3 beforeDownloadWithID:(int64_t)a4;
- (BOOL)pauseDownloadsWithIdentifiers:(id)a3;
- (BOOL)prioritizeDownloadWithID:(int64_t)a3 aboveDownloadWithID:(int64_t)a4 error:(id *)a5;
- (BOOL)prioritizeDownloadsWithKind:(id)a3 clientID:(id)a4;
- (BOOL)resetDownloadsMatchingPredicate:(id)a3;
- (BOOL)resetDownloadsMatchingPredicate:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)resetDownloadsWithIdentifiers:(id)a3;
- (BOOL)resetDownloadsWithIdentifiers:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)restartDownloadsWithIdentifiers:(id)a3;
- (BOOL)retryDownloadWithIdentifier:(int64_t)a3;
- (BOOL)retryDownloadsWithIdentifiers:(id)a3;
- (BOOL)updateDownloadEntityWithIdentifier:(int64_t)a3 withDownload:(id)a4;
- (double)_orderKeyAdjacentToOrderKey:(double)a3 comparisonType:(int64_t)a4;
- (id)_addEffectiveClientWithBundleID:(id)a3 database:(id)a4;
- (id)_copyEffectiveBundleIDForDownload:(id)a3;
- (id)_newTransactionForDownload:(id)a3 inDatabase:(id)a4;
- (id)addDownloads:(id)a3;
- (id)changeset;
- (id)importDownloads:(id)a3 initialOrderKey:(double)a4 orderKeyIncrement:(double)a5;
- (id)insertDownloads:(id)a3 afterDownloadWithID:(int64_t)a4;
- (id)insertDownloads:(id)a3 beforeDownloadWithID:(int64_t)a4;
- (void)_setPolicy:(id)a3 forDownloadWithID:(int64_t)a4;
- (void)reconcileSoftwareDownloads:(id)a3 fromITunesStore:(BOOL)a4;
- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5;
@end

@implementation DownloadsTransaction

- (id)changeset
{
  id v2 = [(DownloadsChangeset *)self->super._changeset copy];

  return v2;
}

+ (unsigned)orderingBucketSize
{
  return 1000000;
}

+ (double)orderKeyIncrement
{
  return 100.0;
}

- (id)addDownloads:(id)a3
{
  objc_msgSend(+[DownloadEntity maxValueForProperty:predicate:database:](DownloadEntity, "maxValueForProperty:predicate:database:", @"order_key", 0, -[DownloadsSession database](self, "database")), "doubleValue");
  double v6 = v5;
  [(id)objc_opt_class() orderKeyIncrement];
  id v8 = [(DownloadsTransaction *)self importDownloads:a3 initialOrderKey:v6 orderKeyIncrement:v7];
  id v9 = [v8 count];
  if (v9 == [a3 count]) {
    [(DownloadsChangeset *)self->super._changeset addDownloadsToPipelineWithIDs:v8];
  }
  return v8;
}

- (BOOL)deletePersistentDownloadManagerWithClientID:(id)a3 persistenceID:(id)a4
{
  id v5 = +[PersistentDownloadManagerEntity anyInDatabase:predicate:](PersistentDownloadManagerEntity, "anyInDatabase:predicate:", [(DownloadsSession *)self database], +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"persistence_id", a4), +[SSSQLiteComparisonPredicate predicateWithProperty:@"client_id" equalToValue:a3],
             0)));
  if (v5)
  {
    id v6 = [v5 persistentID];
    LOBYTE(v5) = [(DownloadsTransaction *)self deletePersistentDownloadManagerWithID:v6];
  }
  return (char)v5;
}

- (BOOL)deletePersistentDownloadManagerWithID:(int64_t)a3
{
  id v5 = [(DownloadsSession *)self database];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v25 = @"download_id";
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000D52C;
  v23[3] = &unk_1003A32B8;
  v23[4] = v6;
  objc_msgSend(+[PersistentDownloadEntity queryWithDatabase:predicate:](PersistentDownloadEntity, "queryWithDatabase:predicate:", v5, +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"manager_id", a3)), "enumeratePersistentIDsAndProperties:count:usingBlock:", &v25, 1, v23);
  double v7 = [[PersistentDownloadManagerEntity alloc] initWithPersistentID:a3 inDatabase:v5];
  unsigned int v8 = [(PersistentDownloadManagerEntity *)v7 deleteFromDatabase];

  if (!v8)
  {
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  v18 = self;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    unsigned __int8 v12 = 1;
LABEL_4:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v6);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      if (!+[PersistentDownloadEntity anyInDatabase:predicate:](PersistentDownloadEntity, "anyInDatabase:predicate:", v5, +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToValue:v14]))
      {
        v15 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v14 longLongValue], v5);
        unsigned __int8 v12 = [(DownloadEntity *)v15 deleteFromDatabase];
      }
      if ((v12 & 1) == 0) {
        goto LABEL_13;
      }
      if (v10 == (id)++v13)
      {
        id v10 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  BOOL v16 = 1;
  [(DownloadsChangeset *)v18->super._changeset addDownloadChangeTypes:1];
LABEL_14:

  return v16;
}

- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4
{
  return [(DownloadsTransaction *)self finishDownloadWithID:a3 finalPhase:a4 updatePipeline:1];
}

- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4 updatePipeline:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v18 = 138412802;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2048;
    int64_t v21 = a3;
    __int16 v22 = 2112;
    id v23 = a4;
    LODWORD(v17) = 32;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v17);
      free(v13);
      SSFileLog();
    }
  }
  if (v5)
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithObjects:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3), 0);
    [(DownloadPipeline *)self->super.super._pipeline stopDownloadsWithIdentifiers:v14 reason:0];
  }
  v15 = [[DownloadEntity alloc] initWithPersistentID:a3 inDatabase:[(DownloadsSession *)self database]];
  [(DownloadsExternalTransaction *)self unionChangeset:[(DownloadEntity *)v15 finishWithFinalPhase:a4]];
  [(DownloadEntity *)v15 deleteScratchDirectory];
  if (objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "isMultiUser")&& objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "shouldModifyQuota:", -[DownloadEntity valueForProperty:](v15, "valueForProperty:", @"kind")))
  {
    objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "resumeQuotas");
  }

  return 1;
}

- (BOOL)finishDownloadsWithIdentifiers:(id)a3 finalPhase:(id)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        LODWORD(v11) = -[DownloadsTransaction finishDownloadWithID:finalPhase:updatePipeline:](self, "finishDownloadWithID:finalPhase:updatePipeline:", [v11 longLongValue], a4, 0);
        if (!v11)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:
  [(DownloadPipeline *)self->super.super._pipeline stopDownloadsWithIdentifiers:a3 reason:0];
  return v13;
}

- (id)importDownloads:(id)a3 initialOrderKey:(double)a4 orderKeyIncrement:(double)a5
{
  id v9 = +[NSMutableOrderedSet orderedSet];
  id v78 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v10 = [(DownloadsSession *)self database];
  unsigned int v11 = [(id)objc_opt_class() orderingBucketSize];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = a3;
  id v76 = [a3 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v76)
  {
    uint32_t __upper_bound = v11 >> 1;
    uint64_t v74 = *(void *)v81;
    uint64_t v73 = SSDownloadExternalPropertyPolicy;
    v77 = v9;
    v72 = v10;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v81 != v74) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v80 + 1) + 8 * (void)v12);
        a4 = a4 + a5;
        objc_msgSend(v13, "setValue:forProperty:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4), @"order_key");
        objc_msgSend(v13, "setValue:forProperty:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", arc4random_uniform(__upper_bound)), @"order_seed");
        id v15 = [v13 externalPropertyValues];
        if (![v15 objectForKey:v73])
        {
          id v16 = [v13 downloadPolicy];
          if (v16) {
            objc_msgSend(v13, "setValue:forProperty:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[DownloadPolicyManager addDownloadPolicy:](-[DownloadsSession policyManager](self, "policyManager"), "addDownloadPolicy:", v16)), @"policy_id");
          }
        }
        id v17 = [(DownloadsTransaction *)self _copyEffectiveBundleIDForDownload:v13];
        if (v17)
        {
          long long v18 = v17;
          id v19 = [v78 objectForKey:v17];
          if (v19
            || (id v19 = [(DownloadsTransaction *)self _addEffectiveClientWithBundleID:v18 database:v10]) != 0)
          {
            [v13 setValue:v19 forProperty:@"effective_client_id"];
            [v78 setObject:v19 forKey:v18];
          }
        }
        [v13 setValue:0 forProperty:@"application_id.bundle_id"];
        id v20 = [v13 propertyValues];
        int64_t v21 = [[DownloadEntity alloc] initWithPropertyValues:v20 inDatabase:v10];
        if (!v21)
        {
          id v40 = +[SSLogConfig sharedDaemonConfig];
          if (!v40) {
            id v40 = +[SSLogConfig sharedConfig];
          }
          unsigned int v41 = [v40 shouldLog];
          if ([v40 shouldLogToDisk]) {
            int v42 = v41 | 2;
          }
          else {
            int v42 = v41;
          }
          if (os_log_type_enabled((os_log_t)[v40 OSLogObject], OS_LOG_TYPE_ERROR)) {
            int v43 = v42;
          }
          else {
            int v43 = v42 & 2;
          }
          if (v43)
          {
            uint64_t v44 = objc_opt_class();
            id v45 = [v13 databaseID];
            int v84 = 138543618;
            uint64_t v85 = v44;
            __int16 v86 = 2048;
            id v87 = v45;
            LODWORD(v70) = 22;
            v69 = &v84;
            uint64_t v46 = _os_log_send_and_compose_impl();
            if (v46)
            {
              v47 = (void *)v46;
              v48 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v84, v70);
              free(v47);
              v69 = (int *)v48;
              SSFileLog();
            }
          }
          goto LABEL_67;
        }
        __int16 v22 = v21;
        id v23 = [(DownloadsTransaction *)self _newTransactionForDownload:v21 inDatabase:v10];
        -[DownloadEntity setValue:forProperty:](v22, "setValue:forProperty:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v23 persistentID]), @"transaction_id");
        if (v15) {
          [(DownloadsExternalTransaction *)self setExternalPropertyValues:v15 forDownloadWithID:[(DownloadEntity *)v22 persistentID]];
        }
        id v24 = [(DownloadEntity *)v22 setAssetsUsingDownload:v13];
        if (!v24)
        {
          id v49 = +[SSLogConfig sharedDaemonConfig];
          if (!v49) {
            id v49 = +[SSLogConfig sharedConfig];
          }
          unsigned int v50 = [v49 shouldLog];
          if ([v49 shouldLogToDisk]) {
            int v51 = v50 | 2;
          }
          else {
            int v51 = v50;
          }
          if (os_log_type_enabled((os_log_t)[v49 OSLogObject], OS_LOG_TYPE_ERROR)) {
            int v52 = v51;
          }
          else {
            int v52 = v51 & 2;
          }
          if (v52)
          {
            uint64_t v53 = objc_opt_class();
            id v54 = [(DownloadEntity *)v22 persistentID];
            int v84 = 138543618;
            uint64_t v85 = v53;
            __int16 v86 = 2048;
            id v87 = v54;
            LODWORD(v70) = 22;
            v69 = &v84;
            uint64_t v55 = _os_log_send_and_compose_impl();
            if (v55)
            {
              v56 = (void *)v55;
              v57 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v55, 4, &v84, v70);
              free(v56);
              v69 = (int *)v57;
              SSFileLog();
            }
          }

LABEL_67:
          id v9 = v77;
          goto LABEL_68;
        }
        id v25 = v24;
        context = v14;
        id v26 = [(DownloadEntity *)v22 persistentID];
        objc_msgSend(v77, "addObject:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v26));
        id v27 = [v20 objectForKey:@"kind"];
        if (v27)
        {
          id v28 = v27;
          if (SSDownloadKindIsMediaKind())
          {
            v29 = [(DownloadEntity *)v22 copyDownloadingIPodLibraryItem];
            if (v29)
            {
              v30 = v29;
              [(DownloadsChangeset *)self->super._changeset addIPodLibraryItem:v29];
              goto LABEL_22;
            }
          }
          else if (SSDownloadKindIsSoftwareKind())
          {
            if (SSDebugShouldUseAppstored())
            {
              id v31 = +[SSLogConfig sharedDaemonConfig];
              if (!v31) {
                id v31 = +[SSLogConfig sharedConfig];
              }
              v32 = v31;
              unsigned int v33 = [v31 shouldLog];
              if ([v32 shouldLogToDisk]) {
                v33 |= 2u;
              }
              if (!os_log_type_enabled((os_log_t)[v32 OSLogObject], OS_LOG_TYPE_DEBUG)) {
                v33 &= 2u;
              }
              if (v33)
              {
                uint64_t v34 = objc_opt_class();
                int v84 = 138412290;
                uint64_t v85 = v34;
                LODWORD(v70) = 12;
                v69 = &v84;
                uint64_t v35 = _os_log_send_and_compose_impl();
                if (v35)
                {
                  v36 = (void *)v35;
                  v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v84, v70);
                  free(v36);
                  SSFileLog();
                  -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v28, v37);
                  goto LABEL_36;
                }
              }
            }
            else if (objc_msgSend(objc_msgSend(v20, "objectForKey:", @"is_automatic"), "integerValue") != (id)2)
            {
              id v38 = [v20 objectForKey:@"bundle_id"];
              v30 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]([ApplicationHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:", [v23 persistentID], v26, v38);
              [(DownloadsChangeset *)self->super._changeset addAppPlaceholderWithHandle:v30];
              if ([v38 length]) {
                +[ApplicationWorkspaceState incompleteNotificationForInstallingDownload:v26 bundleIdentifier:v38];
              }
LABEL_22:
            }
          }
          -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v28, v69);
        }
LABEL_36:
        if (objc_msgSend(objc_msgSend(v20, "objectForKey:", @"is_restore"), "BOOLValue"))
        {
          [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:32];
          [(DownloadsChangeset *)self->super._changeset addRestorableDownloadID:v26];
        }
        [(DownloadsChangeset *)self->super._changeset unionChangeset:v25];

        uint64_t v12 = (char *)v12 + 1;
        unsigned int v10 = v72;
      }
      while (v76 != v12);
      id v39 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
      id v9 = v77;
      id v76 = v39;
    }
    while (v39);
  }
LABEL_68:

  id v58 = [v9 count];
  id v59 = [obj count];
  [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:1];
  if (v58 != v59)
  {
    id v60 = +[SSLogConfig sharedDaemonConfig];
    if (!v60) {
      id v60 = +[SSLogConfig sharedConfig];
    }
    unsigned int v61 = objc_msgSend(v60, "shouldLog", v69);
    if ([v60 shouldLogToDisk]) {
      int v62 = v61 | 2;
    }
    else {
      int v62 = v61;
    }
    if (!os_log_type_enabled((os_log_t)[v60 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v62 &= 2u;
    }
    if (v62)
    {
      uint64_t v63 = objc_opt_class();
      id v64 = [obj count];
      id v65 = [v9 count];
      int v84 = 138543874;
      uint64_t v85 = v63;
      __int16 v86 = 2048;
      id v87 = v64;
      __int16 v88 = 2048;
      id v89 = v65;
      LODWORD(v70) = 32;
      uint64_t v66 = _os_log_send_and_compose_impl();
      if (v66)
      {
        v67 = (void *)v66;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v66, 4, &v84, v70);
        free(v67);
        SSFileLog();
      }
    }
    return 0;
  }
  return v9;
}

- (id)insertDownloads:(id)a3 afterDownloadWithID:(int64_t)a4
{
  id v6 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:[(DownloadsSession *)self database]];
  id v7 = [(DownloadEntity *)v6 valueForProperty:@"order_key"];
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
    -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:](self, "_orderKeyAdjacentToOrderKey:comparisonType:", 5);
    id v11 = -[DownloadsTransaction importDownloads:initialOrderKey:orderKeyIncrement:](self, "importDownloads:initialOrderKey:orderKeyIncrement:", a3, v9, vabdd_f64(v10, v9) / (double)((unint64_t)[a3 count] + 1));
  }
  else
  {
    id v11 = [(DownloadsTransaction *)self addDownloads:a3];
  }
  uint64_t v12 = v11;
  id v13 = [v11 count];
  if (v13 == [a3 count]) {
    [(DownloadsChangeset *)self->super._changeset addDownloadsToPipelineWithIDs:v12];
  }

  return v12;
}

- (id)insertDownloads:(id)a3 beforeDownloadWithID:(int64_t)a4
{
  id v6 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:[(DownloadsSession *)self database]];
  id v7 = [(DownloadEntity *)v6 valueForProperty:@"order_key"];
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
    -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:](self, "_orderKeyAdjacentToOrderKey:comparisonType:", 3);
    id v11 = -[DownloadsTransaction importDownloads:initialOrderKey:orderKeyIncrement:](self, "importDownloads:initialOrderKey:orderKeyIncrement:", a3, v10, vabdd_f64(v10, v9) / (double)((unint64_t)[a3 count] + 1));
  }
  else
  {
    id v11 = [(DownloadsTransaction *)self addDownloads:a3];
  }
  uint64_t v12 = v11;
  id v13 = [v11 count];
  if (v13 == [a3 count]) {
    [(DownloadsChangeset *)self->super._changeset addDownloadsToPipelineWithIDs:v12];
  }

  return v12;
}

- (BOOL)moveDownloadWithID:(int64_t)a3 afterDownloadWithID:(int64_t)a4
{
  return [(DownloadsTransaction *)self _moveDownloadWithID:a3 relativeToDownloadWithID:a4 comparisonType:5];
}

- (BOOL)moveDownloadWithID:(int64_t)a3 beforeDownloadWithID:(int64_t)a4
{
  return [(DownloadsTransaction *)self _moveDownloadWithID:a3 relativeToDownloadWithID:a4 comparisonType:3];
}

- (BOOL)pauseDownloadsWithIdentifiers:(id)a3
{
  id v19 = [(DownloadsSession *)self database];
  id obj = a3;
  id v18 = [a3 count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = SSDownloadPhasePaused;
    uint64_t v16 = SSDownloadPropertyDownloadPhase;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v9);
        uint64_t v12 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v10 longLongValue], v19);
        id v13 = [(DownloadEntity *)v12 downloadKind];
        [(DownloadEntity *)v12 setValue:v8 forProperty:@"download_state.phase"];
        [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:2];
        [(DownloadsChangeset *)self->super._changeset addDownloadKind:v13];
        [(DownloadsChangeset *)self->super._changeset addStatusChangedDownloadID:[(DownloadEntity *)v12 persistentID]];
        if (v18 == (id)1)
        {
          id v14 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v8, v16, 0);
          [(DownloadsChangeset *)self->super._changeset setChangedDownloadProperties:v14];
        }
        double v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  [(DownloadPipeline *)self->super.super._pipeline stopDownloadsWithIdentifiers:obj reason:1];
  return 1;
}

- (BOOL)prioritizeDownloadWithID:(int64_t)a3 aboveDownloadWithID:(int64_t)a4 error:(id *)a5
{
  double v9 = [[DownloadEntity alloc] initWithPersistentID:a3 inDatabase:[(DownloadsSession *)self database]];
  if (([(DownloadEntity *)v9 existsInDatabase] & 1) != 0
    && ([(DownloadEntity *)v9 valueForProperty:@"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")"], !SSDownloadPhaseIsFinishedPhase()))
  {
    id v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13) {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v21 = 138412546;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2048;
      int64_t v24 = a3;
      LODWORD(v20) = 22;
      id v19 = &v21;
      uint64_t v16 = _os_log_send_and_compose_impl();
      if (v16)
      {
        id v17 = (void *)v16;
        id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v21, v20);
        free(v17);
        id v19 = (int *)v18;
        SSFileLog();
      }
    }
    [(DownloadEntity *)v9 setValue:&off_1003C8EE0, @"priority", v19 forProperty];
    if (!a4)
    {
      BOOL v11 = 1;
      [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:1];
      [(DownloadsChangeset *)self->super._changeset addDownloadKind:[(DownloadEntity *)v9 downloadKind]];
      [(DownloadPipeline *)self->super.super._pipeline prioritizeDownloadWithIdentifier:+[NSNumber numberWithLongLong:a3]];
      goto LABEL_6;
    }
    BOOL v11 = [(DownloadsTransaction *)self moveDownloadWithID:a3 beforeDownloadWithID:a4];
    double v10 = 0;
    if (!a5) {
      goto LABEL_6;
    }
  }
  else
  {
    double v10 = (void *)SSError();
    BOOL v11 = 0;
    if (!a5) {
      goto LABEL_6;
    }
  }
  if (!v11)
  {
    BOOL v11 = 0;
    *a5 = v10;
  }
LABEL_6:

  return v11;
}

- (BOOL)prioritizeDownloadsWithKind:(id)a3 clientID:(id)a4
{
  uint64_t v7 = [(DownloadsSession *)self database];
  uint64_t v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"kind" equalToValue:a3];
  id v9 = +[DownloadEntity minValueForProperty:predicate:database:](DownloadEntity, "minValueForProperty:predicate:database:", @"order_key", +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, +[SSSQLiteComparisonPredicate predicateWithProperty:@"client_id" value:a4 comparisonType:2], 0)), v7);
  if (v9)
  {
    id v40 = a3;
    double v10 = v9;
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v38 = v10;
    [v10 doubleValue];
    id v39 = self;
    -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:](self, "_orderKeyAdjacentToOrderKey:comparisonType:", 3);
    double v13 = v12;
    id v14 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, +[SSSQLiteComparisonPredicate predicateWithProperty:@"client_id" equalToValue:a4], 0));
    id v15 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
    [v15 setEntityClass:objc_opt_class()];
    objc_msgSend(v15, "setOrderingDirections:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", SSSQLiteOrderDescending, SSSQLiteOrderAscending, 0));
    objc_msgSend(v15, "setOrderingProperties:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"priority", @"order_key", 0));
    [v15 setPredicate:v14];
    id v16 = [objc_alloc((Class)SSSQLiteQuery) initWithDatabase:v7 descriptor:v15];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000EEFC;
    v45[3] = &unk_1003A32E0;
    v45[4] = v11;
    [v16 enumeratePersistentIDsUsingBlock:v45];

    if ([v11 count])
    {
      id v17 = a4;
      id v18 = +[SSLogConfig sharedDaemonConfig];
      if (!v18) {
        id v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      if (os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_INFO)) {
        int v21 = v20;
      }
      else {
        int v21 = v20 & 2;
      }
      if (v21)
      {
        uint64_t v22 = objc_opt_class();
        int v47 = 138412802;
        uint64_t v48 = v22;
        __int16 v49 = 2112;
        id v50 = v40;
        __int16 v51 = 2112;
        id v52 = v17;
        LODWORD(v37) = 32;
        v36 = &v47;
        uint64_t v23 = _os_log_send_and_compose_impl();
        if (v23)
        {
          int64_t v24 = (void *)v23;
          id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v47, v37);
          free(v24);
          v36 = (int *)v25;
          SSFileLog();
        }
      }
      objc_msgSend(v38, "doubleValue", v36);
      double v27 = v26;
      id v28 = [v11 count];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v29 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v29)
      {
        id v30 = v29;
        double v31 = (v27 - v13) / (double)((unint64_t)v28 + 1);
        uint64_t v32 = *(void *)v42;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v42 != v32) {
              objc_enumerationMutation(v11);
            }
            double v13 = v31 + v13;
            uint64_t v34 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [*(id *)(*((void *)&v41 + 1) + 8 * i) longLongValue], v7);
            [(DownloadEntity *)v34 setValue:+[NSNumber numberWithDouble:v13] forProperty:@"order_key"];
          }
          id v30 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v30);
      }
      [(DownloadsChangeset *)v39->super._changeset addDownloadChangeTypes:1];
      [(DownloadsChangeset *)v39->super._changeset addDownloadKind:v40];
    }
  }
  return 1;
}

- (void)reconcileSoftwareDownloads:(id)a3 fromITunesStore:(BOOL)a4
{
  if (a4) {
    id v6 = (SSSQLiteComparisonPredicate *)+[SSSQLiteCompoundPredicate predicateMatchingAnyPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAnyPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"is_from_store", 0), +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_restore" equalToLongLong:1], 0));
  }
  else {
    id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_from_store" equalToLongLong:1];
  }
  uint64_t v7 = v6;
  uint64_t v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"kind" equalToValue:SSDownloadKindSoftwareApplication];
  id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_purchase" equalToLongLong:0];
  uint64_t v10 = SSDownloadPhaseCanceled;
  v42[0] = SSDownloadPhaseCanceled;
  v42[1] = SSDownloadPhaseFinished;
  id v11 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v7, v9, +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:values:](SSSQLiteContainsPredicate, "doesNotContainPredicateWithProperty:values:", @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")", +[NSArray arrayWithObjects:v42 count:2]), 0));
  id v12 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v38 = 138412546;
    uint64_t v39 = objc_opt_class();
    __int16 v40 = 2048;
    id v41 = [a3 count];
    LODWORD(v35) = 22;
    unsigned int v33 = &v38;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      id v17 = (void *)v16;
      id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v38, v35);
      free(v17);
      unsigned int v33 = (int *)v18;
      SSFileLog();
    }
  }
  v36[5] = v12;
  CFStringRef v37 = @"bundle_id";
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000F4D4;
  v36[3] = &unk_1003A3308;
  v36[4] = a3;
  objc_msgSend(+[DownloadEntity queryWithDatabase:predicate:](DownloadEntity, "queryWithDatabase:predicate:", -[DownloadsSession database](self, "database", v33), v11), "enumeratePersistentIDsAndProperties:count:usingBlock:", &v37, 1, v36);
  if ([v12 count])
  {
    id v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19) {
      id v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      uint64_t v22 = objc_opt_class();
      id v23 = [v12 count];
      int v38 = 138412546;
      uint64_t v39 = v22;
      __int16 v40 = 2048;
      id v41 = v23;
      LODWORD(v35) = 22;
      uint64_t v34 = &v38;
      uint64_t v24 = _os_log_send_and_compose_impl();
      if (v24)
      {
        id v25 = (void *)v24;
        double v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v38, v35);
        free(v25);
        uint64_t v34 = (int *)v26;
        SSFileLog();
      }
    }
    -[DownloadsTransaction finishDownloadsWithIdentifiers:finalPhase:](self, "finishDownloadsWithIdentifiers:finalPhase:", v12, v10, v34);
    id v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27) {
      id v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    if (!os_log_type_enabled((os_log_t)[v27 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v29 &= 2u;
    }
    if (v29)
    {
      uint64_t v30 = objc_opt_class();
      int v38 = 138412546;
      uint64_t v39 = v30;
      __int16 v40 = 2112;
      id v41 = v12;
      LODWORD(v35) = 22;
      uint64_t v31 = _os_log_send_and_compose_impl();
      if (v31)
      {
        uint64_t v32 = (void *)v31;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v38, v35);
        free(v32);
        SSFileLog();
      }
    }
  }
}

- (BOOL)resetDownloadsMatchingPredicate:(id)a3
{
  return [(DownloadsTransaction *)self resetDownloadsMatchingPredicate:a3 isUserInitiated:1];
}

- (BOOL)resetDownloadsMatchingPredicate:(id)a3 isUserInitiated:(BOOL)a4
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v7 = objc_alloc_init((Class)NSMutableOrderedSet);
  v20[0] = @"is_automatic";
  v20[1] = @"download_state.blocked_reason";
  v20[2] = @"is_private";
  v20[3] = @"kind";
  v20[4] = @"download_state.phase";
  v20[5] = @"download_state.restore_state";
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F748;
  v10[3] = &unk_1003A3330;
  id v11 = [(DownloadsSession *)self database];
  id v12 = self;
  BOOL v15 = a4;
  id v13 = v7;
  unsigned int v14 = &v16;
  objc_msgSend(+[DownloadEntity queryWithDatabase:predicate:](DownloadEntity, "queryWithDatabase:predicate:", v11, a3), "enumeratePersistentIDsAndProperties:count:usingBlock:", v20, 6, v10);
  if (*((unsigned char *)v17 + 24) && [v7 count]) {
    [(DownloadsChangeset *)self->super._changeset addDownloadsToPipelineWithIDs:v7];
  }

  char v8 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)resetDownloadsWithIdentifiers:(id)a3
{
  return [(DownloadsTransaction *)self resetDownloadsWithIdentifiers:a3 isUserInitiated:1];
}

- (BOOL)resetDownloadsWithIdentifiers:(id)a3 isUserInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = objc_alloc_init((Class)NSMutableOrderedSet);
  v22[0] = @"is_automatic";
  v22[1] = @"download_state.blocked_reason";
  v22[2] = @"is_private";
  v22[3] = @"kind";
  v22[4] = @"download_state.phase";
  v22[5] = @"download_state.restore_state";
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v11 longLongValue], -[DownloadsSession database](self, "database"));
        [(DownloadEntity *)v12 getValues:v20 forProperties:v22 count:6];
        if ([(DownloadsTransaction *)self _resetDownload:v12 withValues:v20 isUserIntiated:v4])
        {
          [v15 addObject:v11];
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }
  id v13 = [v15 count];
  if (v13) {
    [(DownloadsChangeset *)self->super._changeset addDownloadsToPipelineWithIDs:v15];
  }

  return v13 != 0;
}

- (BOOL)restartDownloadsWithIdentifiers:(id)a3
{
  id v5 = [(DownloadsSession *)self database];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a3;
  id v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v10 longLongValue], v5);
        [(DownloadsChangeset *)self->super._changeset addDownloadKind:[(DownloadEntity *)v12 downloadKind]];
        [(DownloadsChangeset *)self->super._changeset addStatusChangedDownloadID:[(DownloadEntity *)v12 persistentID]];
      }
      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  [(DownloadsChangeset *)self->super._changeset restartDownloadsInPipelineWithIDs:obj];
  [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:2];
  return 1;
}

- (BOOL)retryDownloadWithIdentifier:(int64_t)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithObjects:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3), 0);
  LOBYTE(self) = [(DownloadsTransaction *)self retryDownloadsWithIdentifiers:v4];

  return (char)self;
}

- (BOOL)retryDownloadsWithIdentifiers:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) longLongValue], -[DownloadsSession database](self, "database"));
        [(DownloadsExternalTransaction *)self unionChangeset:[(DownloadEntity *)v9 retryDownload]];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return 1;
}

- (BOOL)updateDownloadEntityWithIdentifier:(int64_t)a3 withDownload:(id)a4
{
  uint64_t v7 = [[DownloadEntity alloc] initWithPersistentID:a3 inDatabase:[(DownloadsSession *)self database]];
  id v8 = [a4 externalPropertyValues];
  if (![v8 objectForKey:SSDownloadExternalPropertyPolicy])
  {
    id v9 = [a4 downloadPolicy];
    if (v9) {
      objc_msgSend(a4, "setValue:forProperty:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[DownloadPolicyManager addDownloadPolicy:](-[DownloadsSession policyManager](self, "policyManager"), "addDownloadPolicy:", v9)), @"policy_id");
    }
  }
  if (v8) {
    [(DownloadsExternalTransaction *)self setExternalPropertyValues:v8 forDownloadWithID:a3];
  }
  -[DownloadEntity setValuesWithDictionary:](v7, "setValuesWithDictionary:", [a4 propertyValues]);
  id v10 = [(DownloadEntity *)v7 setAssetsUsingDownload:a4];
  if (v10)
  {
    id v11 = [a4 valueForProperty:@"kind"];
    if (SSDownloadKindIsMediaKind())
    {
      id v12 = [(DownloadEntity *)v7 copyDownloadingIPodLibraryItem];
      if (v12)
      {
        long long v13 = v12;
        [(DownloadsChangeset *)self->super._changeset addIPodLibraryItem:v12];
      }
    }
    [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:16];
    [(DownloadsChangeset *)self->super._changeset addDownloadKind:v11];
    [(DownloadsChangeset *)self->super._changeset addDownloadToPipelineWithID:a3];
    [(DownloadsChangeset *)self->super._changeset addUpdatedDownloadID:a3];
    [(DownloadsChangeset *)self->super._changeset unionChangeset:v10];
  }

  return v10 != 0;
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5
{
  if ([a4 isEqualToString:SSDownloadExternalPropertyPolicy])
  {
    [(DownloadsTransaction *)self _setPolicy:a3 forDownloadWithID:a5];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DownloadsTransaction;
    [(DownloadsExternalTransaction *)&v9 setValue:a3 forExternalProperty:a4 ofDownloadID:a5];
  }
}

- (id)_addEffectiveClientWithBundleID:(id)a3 database:(id)a4
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3052000000;
  unsigned int v20 = sub_100010224;
  int v21 = sub_100010234;
  uint64_t v22 = 0;
  id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:a3];
  CFStringRef v23 = @"effective_client_id";
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010240;
  v16[3] = &unk_1003A3358;
  v16[4] = &v17;
  objc_msgSend(+[DownloadApplicationIdentifierEntity queryWithDatabase:predicate:](DownloadApplicationIdentifierEntity, "queryWithDatabase:predicate:", a4, v6), "enumeratePersistentIDsAndProperties:count:usingBlock:", &v23, 1, v16);
  uint64_t v7 = (void *)v18[5];
  if (!v7)
  {
    id v8 = +[DownloadApplicationIdentifierEntity maxValueForProperty:@"effective_client_id" predicate:0 database:a4];
    id v9 = objc_alloc((Class)NSNumber);
    if ((uint64_t)[v8 longLongValue] >= 999) {
      uint64_t v10 = (uint64_t)[v8 longLongValue] + 1;
    }
    else {
      uint64_t v10 = 1000;
    }
    id v11 = [v9 initWithLongLong:v10];
    v18[5] = (uint64_t)v11;
    id v12 = objc_alloc((Class)NSDictionary);
    id v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", v18[5], @"effective_client_id", a3, @"bundle_id", 0);

    uint64_t v7 = (void *)v18[5];
  }
  id v14 = v7;
  _Block_object_dispose(&v17, 8);
  return v14;
}

- (id)_copyEffectiveBundleIDForDownload:(id)a3
{
  id v4 = [a3 valueForProperty:@"override_audit_token_data"];
  if (v4)
  {
    id v5 = v4;
    if (objc_msgSend(v4, "length", 0, 0, 0, 0) == (id)32)
    {
      [v5 getBytes:&v8 length:32];
      return (id)CPCopyBundleIdentifierFromAuditToken();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    id result = [a3 valueForProperty:@"application_id.bundle_id"];
    if (!result)
    {
      id v7 = [a3 valueForProperty:@"client_id"];
      return v7;
    }
  }
  return result;
}

- (BOOL)_moveDownloadWithID:(int64_t)a3 relativeToDownloadWithID:(int64_t)a4 comparisonType:(int64_t)a5
{
  long long v8 = [[DownloadEntity alloc] initWithPersistentID:a3 inDatabase:[(DownloadsSession *)self database]];
  id v9 = [(DownloadEntity *)v8 downloadKind];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:[(DownloadsSession *)self database]];
    id v12 = [(DownloadEntity *)v11 valueForProperty:@"order_key"];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      [v12 doubleValue];
      double v15 = v14;
      -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:](self, "_orderKeyAdjacentToOrderKey:comparisonType:", a5);
      if (a5 == 3) {
        double v17 = v16;
      }
      else {
        double v17 = v15;
      }
      [(DownloadEntity *)v8 setValue:+[NSNumber numberWithDouble:v17 + vabdd_f64(v15, v16) * 0.5] forProperty:@"order_key"];
      [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:1];
      [(DownloadsChangeset *)self->super._changeset addDownloadKind:v10];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_newTransactionForDownload:(id)a3 inDatabase:(id)a4
{
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [a3 valueForProperty:@"kind"];
  if ([v7 isEqualToString:SSDownloadKindSoftwareApplication])
  {
    if (objc_msgSend(objc_msgSend(a3, "valueForProperty:", @"is_automatic"), "integerValue") == (id)2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8), @"type");
  id v9 = [a3 valueForProperty:@"bundle_id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setObject:v9 forKey:@"bundle_id"];
  }
  uint64_t v10 = [[TransactionEntity alloc] initWithPropertyValues:v6 inDatabase:a4];

  return v10;
}

- (double)_orderKeyAdjacentToOrderKey:(double)a3 comparisonType:(int64_t)a4
{
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3052000000;
  long long v18 = sub_100010224;
  uint64_t v19 = sub_100010234;
  uint64_t v20 = 0;
  id v7 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
  [v7 setEntityClass:objc_opt_class()];
  [v7 setLimitCount:1];
  if (a4 == 3) {
    objc_msgSend(v7, "setOrderingDirections:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", SSSQLiteOrderDescending));
  }
  objc_msgSend(v7, "setOrderingProperties:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", @"order_key"));
  objc_msgSend(v7, "setPredicate:", +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](SSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", @"order_key", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), a4));
  id v8 = objc_msgSend(objc_alloc((Class)SSSQLiteQuery), "initWithDatabase:descriptor:", -[DownloadsSession database](self, "database"), v7);
  CFStringRef v21 = @"order_key";
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001083C;
  v14[3] = &unk_1003A3358;
  v14[4] = &v15;
  [v8 enumeratePersistentIDsAndProperties:&v21 count:1 usingBlock:v14];

  id v9 = (void *)v16[5];
  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    [(id)objc_opt_class() orderKeyIncrement];
    if (a4 == 5) {
      double v11 = v12 + a3;
    }
    else {
      double v11 = a3 - v12;
    }
  }

  _Block_object_dispose(&v15, 8);
  return v11;
}

- (BOOL)_resetDownload:(id)a3 withValues:(const void *)a4 isUserIntiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(id)*a4 integerValue];
  BOOL v10 = ([(id)a4[4] isEqualToString:SSDownloadPhaseFailed] & 1) != 0
     || ([(id)a4[4] isEqualToString:SSDownloadPhasePaused] & 1) != 0
     || [(id)a4[1] integerValue] != 0;
  unsigned int v11 = [(id)a4[2] BOOLValue];
  if (v9) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  if (!v10 && !v12) {
    return 0;
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:SSDownloadPhaseWaiting forKey:@"download_state.phase"];
  objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), @"download_state.restore_state");
  objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), @"download_state.blocked_reason");
  objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), @"store_preorder_id");
  objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), @"download_state.store_queue_refresh_count");
  id v15 = [a3 persistentID];
  if (v9) {
    char v16 = v10;
  }
  else {
    char v16 = 1;
  }
  id v17 = +[SSLogConfig sharedDaemonConfig];
  id v18 = v17;
  if ((v16 & 1) != 0 || !v5)
  {
    if (!v17) {
      id v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_INFO)) {
      v28 &= 2u;
    }
    if (v28)
    {
      int v35 = 138412546;
      uint64_t v36 = objc_opt_class();
      __int16 v37 = 2048;
      id v38 = v15;
      LODWORD(v34) = 22;
      unsigned int v33 = &v35;
      uint64_t v29 = _os_log_send_and_compose_impl();
      if (v29)
      {
        uint64_t v30 = (void *)v29;
        uint64_t v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v35, v34);
        free(v30);
        unsigned int v33 = (int *)v31;
        SSFileLog();
      }
    }
    uint64_t v26 = 18;
  }
  else
  {
    if (!v17) {
      id v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_INFO)) {
      v20 &= 2u;
    }
    if (v20)
    {
      int v35 = 138412546;
      uint64_t v36 = objc_opt_class();
      __int16 v37 = 2048;
      id v38 = v15;
      LODWORD(v34) = 22;
      unsigned int v33 = &v35;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        CFStringRef v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v35, v34);
        free(v22);
        unsigned int v33 = (int *)v23;
        SSFileLog();
      }
    }
    objc_msgSend(v14, "setObject:forKey:", &off_1003C8EF8, @"is_automatic", v33);
    [v14 setObject:&__kCFBooleanFalse forKey:@"is_private"];
    [v14 setObject:&off_1003C8F10 forKey:@"priority"];
    id v24 = objc_alloc((Class)SSDownloadPolicy);
    id v25 = [v24 initWithDownloadKind:SSDownloadKindSoftwareApplication URLBagType:0];
    objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[DownloadPolicyManager addDownloadPolicy:](-[DownloadsSession policyManager](self, "policyManager"), "addDownloadPolicy:", v25)), @"policy_id");

    [(DownloadsChangeset *)self->super._changeset addPolicyChangedDownloadID:v15];
    uint64_t v26 = 19;
  }
  if (objc_msgSend((id)a4[5], "integerValue", v33))
  {
    v26 |= 0x20uLL;
    [(DownloadsChangeset *)self->super._changeset addRestorableDownloadID:v15];
  }
  [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:v26];
  [(DownloadsChangeset *)self->super._changeset addDownloadKind:a4[3]];
  [(DownloadsChangeset *)self->super._changeset addStatusChangedDownloadID:v15];
  [(DownloadsChangeset *)self->super._changeset addUpdatedDownloadID:v15];
  unsigned __int8 v13 = [a3 setValuesWithDictionary:v14];

  return v13;
}

- (void)_setPolicy:(id)a3 forDownloadWithID:(int64_t)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    objc_opt_class();
    uint64_t ObjectWithArchivedData = SSCodingCreateObjectWithArchivedData();
    if (!ObjectWithArchivedData) {
      return;
    }
    id v8 = (void *)ObjectWithArchivedData;
    int64_t v6 = [(DownloadPolicyManager *)[(DownloadsSession *)self policyManager] addDownloadPolicy:ObjectWithArchivedData];

    if (v6 == -1) {
      return;
    }
  }
  id v9 = [[DownloadEntity alloc] initWithPersistentID:a4 inDatabase:[(DownloadsSession *)self database]];
  [(DownloadEntity *)v9 setValue:+[NSNumber numberWithLongLong:v6] forProperty:@"policy_id"];
  [(DownloadsChangeset *)self->super._changeset addDownloadChangeTypes:17];
  [(DownloadsChangeset *)self->super._changeset addPolicyChangedDownloadID:a4];
  [(DownloadsChangeset *)self->super._changeset addUpdatedDownloadID:a4];
}

@end