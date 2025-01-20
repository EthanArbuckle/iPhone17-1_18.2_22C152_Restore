@interface PersistentDownloadManagerEntity
+ (id)databaseTable;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (void)initialize;
- (id)finishPersistentDownloadsWithDownloadIDs:(id)a3;
- (void)performNewsstandMigration1InDatabase:(id)a3;
@end

@implementation PersistentDownloadManagerEntity

+ (id)databaseTable
{
  return @"persistent_manager";
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return [(id)qword_100401D70 objectForKey:a3];
}

- (id)finishPersistentDownloadsWithDownloadIDs:(id)a3
{
  v38 = objc_alloc_init(DownloadsChangeset);
  id v5 = [(PersistentDownloadManagerEntity *)self database];
  id obj = a3;
  v41 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"manager_id" equalToLongLong:[(PersistentDownloadManagerEntity *)self persistentID]];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v42 = *(void *)v44;
    uint64_t v37 = SSDownloadMetadataKeyFileExtensionMoviePackage;
    uint64_t v39 = SSDownloadPhaseFailed;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v10 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v9 longLongValue], v5);
        v52[0] = @"kind";
        v52[1] = @"download_state.phase";
        v52[2] = @"is_hls";
        [(DownloadEntity *)v10 getValues:v51 forProperties:v52 count:3];
        v11 = (void *)v51[2];
        if (objc_opt_respondsToSelector()) {
          unsigned int v12 = [v11 BOOLValue];
        }
        else {
          unsigned int v12 = 0;
        }
        v13 = (void *)v51[0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          v13 = 0;
        }
        if (SSDownloadPhaseIsUnsuccessful())
        {
          if (v12)
          {
            if (SSDownloadKindIsMediaKind())
            {
              id v14 = +[DownloadAssetEntity anyInDatabase:predicate:](DownloadAssetEntity, "anyInDatabase:predicate:", v5, +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"download_id", v9), +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_hls" equalToValue:&__kCFBooleanTrue],
                          0)));
              if (v14)
              {
                id v15 = [sub_10018A454(v13) stringByAppendingPathComponent:-[NSString stringByAppendingPathExtension:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", objc_msgSend(v14, "persistentID")), "stringByAppendingPathExtension:", v37)];
                if (v15)
                {
                  id v16 = v15;
                  LOBYTE(v47) = 0;
                  unsigned int v17 = [+[NSFileManager defaultManager] fileExistsAtPath:v15 isDirectory:&v47];
                  if ((_BYTE)v47)
                  {
                    if (v17)
                    {
                      unsigned int v36 = [+[NSFileManager defaultManager] removeItemAtPath:v16 error:0];
                      id v18 = +[SSLogConfig sharedDaemonConfig];
                      if (!v18) {
                        id v18 = +[SSLogConfig sharedConfig];
                      }
                      unsigned int v19 = [v18 shouldLog];
                      if ([v18 shouldLogToDisk]) {
                        v19 |= 2u;
                      }
                      if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEBUG)) {
                        v19 &= 2u;
                      }
                      if (v19)
                      {
                        uint64_t v20 = objc_opt_class();
                        int v47 = 138412802;
                        uint64_t v48 = v20;
                        __int16 v49 = 1024;
                        LODWORD(v50[0]) = v36;
                        WORD2(v50[0]) = 2112;
                        *(void *)((char *)v50 + 6) = v9;
                        LODWORD(v35) = 28;
                        v33 = &v47;
                        uint64_t v21 = _os_log_send_and_compose_impl();
                        if (v21)
                        {
                          v22 = (void *)v21;
                          v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v47, v35);
                          free(v22);
                          v33 = (int *)v23;
                          SSFileLog();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if ((SSDownloadPhaseIsFinishedPhase() & 1) != 0
          || [(id)v51[1] isEqualToString:v39])
        {
          id v24 = +[SSLogConfig sharedDaemonConfig];
          if (!v24) {
            id v24 = +[SSLogConfig sharedConfig];
          }
          unsigned int v25 = [v24 shouldLog];
          if ([v24 shouldLogToDisk]) {
            int v26 = v25 | 2;
          }
          else {
            int v26 = v25;
          }
          if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_INFO)) {
            v26 &= 2u;
          }
          if (v26)
          {
            uint64_t v27 = objc_opt_class();
            int v47 = 138412546;
            uint64_t v48 = v27;
            __int16 v49 = 2112;
            v50[0] = v9;
            LODWORD(v35) = 22;
            v34 = &v47;
            uint64_t v28 = _os_log_send_and_compose_impl();
            if (v28)
            {
              v29 = (void *)v28;
              v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v47, v35);
              free(v29);
              v34 = (int *)v30;
              SSFileLog();
            }
          }
          v31 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id", v9, v34 equalToValue];
          objc_msgSend(+[PersistentDownloadEntity queryWithDatabase:predicate:](PersistentDownloadEntity, "queryWithDatabase:predicate:", v5, +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v31, v41, 0))), "deleteAllEntities");
          if (!+[PersistentDownloadEntity anyInDatabase:v5 predicate:v31])
          {
            [(DownloadEntity *)v10 deleteFromDatabase];
            [(DownloadsChangeset *)v38 addDownloadChangeTypes:8];
            [(DownloadsChangeset *)v38 addDownloadKind:v51[0]];
            [(DownloadsChangeset *)v38 addRemovedDownloadID:[(DownloadEntity *)v10 persistentID]];
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v7);
  }
  return v38;
}

- (void)performNewsstandMigration1InDatabase:(id)a3
{
  CFStringRef v9 = @"download_id";
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BD16C;
  v5[3] = &unk_1003A5BD8;
  id v6 = a3;
  id v7 = [(PersistentDownloadManagerEntity *)self valueForProperty:@"client_id"];
  v8 = self;
  objc_msgSend(+[PersistentDownloadEntity queryWithDatabase:predicate:](PersistentDownloadEntity, "queryWithDatabase:predicate:", v6, +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", @"manager_id", -[PersistentDownloadManagerEntity persistentID](self, "persistentID"))), "enumeratePersistentIDsAndProperties:count:usingBlock:", &v9, 1, v5);
  id v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), @"migration_version", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"filters_external_downloads", 0);
  [(PersistentDownloadManagerEntity *)self setValuesWithDictionary:v4];
}

+ (id)foreignDatabaseTablesToDelete
{
  return (id)qword_100401D68;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100401D70 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"persistent_download", @"manager_id", @"persistent_manager_kind", 0);
    qword_100401D68 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"persistent_download", @"persistent_manager_kind", 0);
  }
}

@end