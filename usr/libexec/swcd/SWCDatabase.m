@interface SWCDatabase
+ (OS_dispatch_queue)queue;
+ (SWCDatabase)new;
+ (SWCDatabase)sharedDatabase;
+ (id)_archivedDataFromStorage:(id)a3 error:(id *)a4;
+ (id)_storageFromArchivedData:(id)a3 error:(id *)a4;
+ (id)loadContentsOfURL:(id)a3 error:(id *)a4;
- (BOOL)_deleteStorageItemReturningError:(id *)a3;
- (BOOL)_updateStorageItemWithData:(id)a3 error:(id *)a4;
- (BOOL)addEntries:(id)a3;
- (BOOL)mayContainEntryMatchingServiceSpecifier:(id)a3;
- (BOOL)removeEntries:(id)a3;
- (BOOL)saveReturningError:(id *)a3;
- (NSData)enterpriseState;
- (NSNumber)launchServicesDatabaseGeneration;
- (NSURL)storageURL;
- (SWCDatabase)init;
- (_SWCGeneration)settingsGeneration;
- (id)_dataFromStorageReturningError:(id *)a3;
- (id)_dataURLReturningError:(id *)a3;
- (id)_initShared;
- (id)_storageForArchiving;
- (id)entry:(id)a3;
- (id)entryMatchingService:(id)a3 domain:(id)a4 appID:(id)a5;
- (id)entryMatchingServiceSpecifier:(id)a3;
- (id)settingsDictionaryForServiceSpecifier:(id)a3;
- (void)_removeSettingsForKeysNoSave:(id)a3 serviceSpecifier:(id)a4;
- (void)_reorderAppLinks:(id)a3 domain:(id)a4;
- (void)_scheduleSave;
- (void)cleanOldSettings;
- (void)enumerateEntries:(id)a3 matchingService:(id)a4 domain:(id)a5 appID:(id)a6 block:(id)a7;
- (void)enumerateEntries:(id)a3 matchingServiceSpecifier:(id)a4 block:(id)a5;
- (void)enumerateEntriesMatchingService:(id)a3 domain:(id)a4 appID:(id)a5 block:(id)a6;
- (void)enumerateEntriesMatchingService:(id)a3 exactDomain:(id)a4 appID:(id)a5 block:(id)a6;
- (void)enumerateEntriesMatchingServiceSpecifier:(id)a3 block:(id)a4;
- (void)enumerateEntriesMatchingServiceSpecifierWithExactDomain:(id)a3 block:(id)a4;
- (void)enumerateEntriesWithBlock:(id)a3;
- (void)enumerateSettingsDictionariesWithBlock:(id)a3;
- (void)receiveSIGTERMSignal;
- (void)removeAllEntries;
- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4;
- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4;
- (void)setEnterpriseState:(id)a3;
- (void)setLaunchServicesDatabaseGeneration:(id)a3;
- (void)setSettingsDictionary:(id)a3 forServiceSpecifier:(id)a4;
- (void)updateEntriesForDomain:(id)a3 canonicalEntries:(id)a4;
@end

@implementation SWCDatabase

+ (OS_dispatch_queue)queue
{
  if (qword_10003B240 != -1) {
    dispatch_once(&qword_10003B240, &stru_100034C68);
  }
  v2 = (void *)qword_10003B238;

  return (OS_dispatch_queue *)v2;
}

+ (SWCDatabase)sharedDatabase
{
  v2 = [(id)objc_opt_class() queue];
  dispatch_assert_queue_V2(v2);

  if (qword_10003B230 != -1) {
    dispatch_once(&qword_10003B230, &stru_100034C48);
  }
  v3 = (void *)qword_10003B228;

  return (SWCDatabase *)v3;
}

+ (SWCDatabase)new
{
}

- (SWCDatabase)init
{
}

+ (id)loadContentsOfURL:(id)a3 error:(id *)a4
{
  id v17 = 0;
  id v8 = [objc_alloc((Class)NSData) initWithContentsOfURL:a3 options:1 error:&v17];
  id v9 = v17;
  v10 = v9;
  if (v8)
  {
    id v16 = v9;
    v11 = [a1 _storageFromArchivedData:v8 error:&v16];
    id v12 = v16;

    if (v11) {
      id v13 = v11;
    }

    v10 = v12;
  }
  else
  {
    v11 = 0;
  }

  if (!v11)
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    v14 = qword_10003B248;
    if (!os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_ERROR))
    {
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to load SWC database: %@", buf, 0xCu);
    if (a4) {
LABEL_11:
    }
      *a4 = v10;
  }
LABEL_12:

  return v11;
}

- (void)receiveSIGTERMSignal
{
  v3 = (void *)os_transaction_create();
  v4 = +[SWCDatabase queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000127E0;
  v6[3] = &unk_1000347C0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (NSURL)storageURL
{
  if (*((unsigned char *)self + 40))
  {
    v2 = [(SWCDatabase *)self _dataURLReturningError:0];
  }
  else
  {
    v2 = 0;
  }

  return (NSURL *)v2;
}

- (id)entry:(id)a3
{
  id v6 = [(NSMutableOrderedSet *)self->_entries indexOfObject:a3];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSMutableOrderedSet *)self->_entries objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (BOOL)mayContainEntryMatchingServiceSpecifier:(id)a3
{
  return 1;
}

- (void)enumerateEntries:(id)a3 matchingService:(id)a4 domain:(id)a5 appID:(id)a6 block:(id)a7
{
  id v13 = (NSMutableOrderedSet *)a3;
  id obj = v13;
  if (a5 && self->_entries == v13 && [(SWCDomainCache *)self->_domainCache isValid])
  {
    uint64_t v14 = [(SWCDomainCache *)self->_domainCache entriesForDomain:a5];

    id obj = (id)v14;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obja = obj;
  id v15 = [obja countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(obja);
      }
      v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
      if (!a4
        || ([*(id *)(*((void *)&v29 + 1) + 8 * v17) serviceType],
            v19 = objc_claimAutoreleasedReturnValue(),
            BOOL v20 = [v19 caseInsensitiveCompare:a4] == 0,
            v19,
            v20))
      {
        if (!a5
          || ([v18 domain],
              v21 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v22 = [v21 encompassesDomain:a5],
              v21,
              (v22 & 1) != 0))
        {
          if (!a6
            || ([v18 applicationIdentifier],
                v23 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v24 = [v23 isEqualToApplicationIdentifierIgnoringPrefix:a6],
                v23,
                (v24 & 1) != 0))
          {
            char v28 = 0;
            (*((void (**)(id, void *, char *))a7 + 2))(a7, v18, &v28);
            if (v28) {
              break;
            }
          }
        }
      }
      if (v15 == (id)++v17)
      {
        id v15 = [obja countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
}

- (void)enumerateEntries:(id)a3 matchingServiceSpecifier:(id)a4 block:(id)a5
{
  id v11 = [a4 serviceType];
  id v9 = [a4 SWCDomain];
  v10 = [a4 SWCApplicationIdentifier];
  [(SWCDatabase *)self enumerateEntries:a3 matchingService:v11 domain:v9 appID:v10 block:a5];
}

- (void)enumerateEntriesWithBlock:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_entries;
  id v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
      unsigned __int8 v10 = 0;
      (*((void (**)(id, uint64_t, unsigned __int8 *))a3 + 2))(a3, v8, &v10);
      LODWORD(v8) = v10;
      if (v8) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateEntriesMatchingService:(id)a3 domain:(id)a4 appID:(id)a5 block:(id)a6
{
}

- (void)enumerateEntriesMatchingServiceSpecifier:(id)a3 block:(id)a4
{
  entries = self->_entries;
  id v10 = [a3 serviceType];
  uint64_t v8 = [a3 SWCDomain];
  id v9 = [a3 SWCApplicationIdentifier];
  [(SWCDatabase *)self enumerateEntries:entries matchingService:v10 domain:v8 appID:v9 block:a4];
}

- (void)enumerateEntriesMatchingService:(id)a3 exactDomain:(id)a4 appID:(id)a5 block:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012F78;
  v6[3] = &unk_100034C90;
  v6[4] = a4;
  void v6[5] = a6;
  [(SWCDatabase *)self enumerateEntriesMatchingService:a3 domain:a4 appID:a5 block:v6];
}

- (void)enumerateEntriesMatchingServiceSpecifierWithExactDomain:(id)a3 block:(id)a4
{
  id v9 = [a3 serviceType];
  uint64_t v7 = [a3 SWCDomain];
  uint64_t v8 = [a3 SWCApplicationIdentifier];
  [(SWCDatabase *)self enumerateEntriesMatchingService:v9 exactDomain:v7 appID:v8 block:a4];
}

- (id)entryMatchingService:(id)a3 domain:(id)a4 appID:(id)a5
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = sub_100013220;
  long long v12 = sub_100013230;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013238;
  v7[3] = &unk_100034CB8;
  v7[4] = a4;
  v7[5] = &v8;
  [(SWCDatabase *)self enumerateEntriesMatchingService:a3 domain:a4 appID:a5 block:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)entryMatchingServiceSpecifier:(id)a3
{
  id v5 = [a3 serviceType];
  uint64_t v6 = [a3 SWCDomain];
  uint64_t v7 = [a3 SWCApplicationIdentifier];
  uint64_t v8 = [(SWCDatabase *)self entryMatchingService:v5 domain:v6 appID:v7];

  return v8;
}

- (BOOL)addEntries:(id)a3
{
  id v5 = [(NSMutableOrderedSet *)self->_entries count];
  [(NSMutableOrderedSet *)self->_entries unionOrderedSet:a3];
  id v6 = [(NSMutableOrderedSet *)self->_entries count];
  if (v6 != v5)
  {
    [(SWCDomainCache *)self->_domainCache updateCachedDomainsForEntries:a3];
    [(SWCDatabase *)self _scheduleSave];
  }
  return v6 != v5;
}

- (BOOL)removeEntries:(id)a3
{
  id v5 = [(NSMutableOrderedSet *)self->_entries count];
  [(NSMutableOrderedSet *)self->_entries minusOrderedSet:a3];
  id v6 = [(NSMutableOrderedSet *)self->_entries count];
  if (v6 != v5)
  {
    [(SWCDomainCache *)self->_domainCache clear];
    [(SWCDomainCache *)self->_domainCache updateCachedDomainsForEntries:self->_entries];
    [(SWCDatabase *)self _scheduleSave];
  }
  return v6 != v5;
}

- (void)removeAllEntries
{
  [(NSMutableOrderedSet *)self->_entries removeAllObjects];
  [(NSMutableDictionary *)self->_settings removeAllObjects];
  launchServicesDatabaseGeneration = self->_launchServicesDatabaseGeneration;
  self->_launchServicesDatabaseGeneration = 0;

  enterpriseState = self->_enterpriseState;
  self->_enterpriseState = 0;

  [(SWCDomainCache *)self->_domainCache clear];
  if (qword_10003B250 != -1) {
    dispatch_once(&qword_10003B250, &stru_100034D78);
  }
  id v5 = qword_10003B248;
  if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting old SWC database from storage", buf, 2u);
  }
  id v9 = 0;
  unsigned __int8 v6 = [(SWCDatabase *)self _deleteStorageItemReturningError:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    uint64_t v8 = qword_10003B248;
    if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Delete SWC database from storage failed with error %@", buf, 0xCu);
    }
  }
}

- (void)updateEntriesForDomain:(id)a3 canonicalEntries:(id)a4
{
  id v7 = +[NSDate date];
  if (![a4 count])
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    uint64_t v8 = qword_10003B248;
    if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "JSON file for %@ had no entries", buf, 0xCu);
    }
  }
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  long long v12 = sub_10001392C;
  id v13 = &unk_100034CE0;
  id v9 = v7;
  id v14 = v9;
  id v15 = a4;
  [(SWCDatabase *)self enumerateEntriesMatchingService:0 exactDomain:a3 appID:0 block:&v10];
  -[SWCDatabase _reorderAppLinks:domain:](self, "_reorderAppLinks:domain:", a4, a3, v10, v11, v12, v13);
  +[SWCEntry canonicalizeEntries:self->_entries];
  [(SWCDatabase *)self scheduleNextSave];
}

- (id)settingsDictionaryForServiceSpecifier:(id)a3
{
  return [(NSMutableDictionary *)self->_settings objectForKeyedSubscript:a3];
}

- (void)setSettingsDictionary:(id)a3 forServiceSpecifier:(id)a4
{
  id v6 = [a3 copy];
  [(NSMutableDictionary *)self->_settings setObject:v6 forKeyedSubscript:a4];

  id v7 = [(_SWCGeneration *)self->_settingsGeneration generationByIncrementingSelf];
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v7;

  +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:a4];

  [(SWCDatabase *)self scheduleNextSave];
}

- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  settings = self->_settings;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100013DD8;
  v29[3] = &unk_100034D08;
  v29[4] = a4;
  id v9 = v7;
  id v30 = v9;
  [(NSMutableDictionary *)settings enumerateKeysAndObjectsUsingBlock:v29];
  uint64_t v10 = [a3 allObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        [(SWCDatabase *)self _removeSettingsForKeysNoSave:v10 serviceSpecifier:*(void *)(*((void *)&v25 + 1) + 8 * (void)v14)];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v12);
  }

  id v15 = [(_SWCGeneration *)self->_settingsGeneration generationByIncrementingSelf];
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v15;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v17 = v11;
  id v18 = [v17 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v22;
    do
    {
      BOOL v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v17);
        }
        +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:](_SWCServiceSettings, "postChangeNotificationForServiceSpecifier:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v20), (void)v21);
        BOOL v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v17 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v18);
  }

  [(SWCDatabase *)self scheduleNextSave];
}

- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4
{
  id v6 = [a3 allObjects];
  [(SWCDatabase *)self _removeSettingsForKeysNoSave:v6 serviceSpecifier:a4];

  id v7 = [(_SWCGeneration *)self->_settingsGeneration generationByIncrementingSelf];
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v7;

  +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:a4];

  [(SWCDatabase *)self scheduleNextSave];
}

- (void)enumerateSettingsDictionariesWithBlock:(id)a3
{
}

- (void)cleanOldSettings
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001412C;
  v17[3] = &unk_100034D08;
  v17[4] = self;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v18 = v4;
  [(SWCDatabase *)self enumerateSettingsDictionariesWithBlock:v17];
  if ([v4 count])
  {
    settings = self->_settings;
    id v6 = [v4 allObjects];
    [(NSMutableDictionary *)settings removeObjectsForKeys:v6];

    id v7 = [(_SWCGeneration *)self->_settingsGeneration generationByIncrementingSelf];
    settingsGeneration = self->_settingsGeneration;
    self->_settingsGeneration = v7;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:](_SWCServiceSettings, "postChangeNotificationForServiceSpecifier:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), (void)v13);
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v10);
    }

    [(SWCDatabase *)self scheduleNextSave];
  }
}

- (BOOL)saveReturningError:(id *)a3
{
  if (*((unsigned char *)self + 40))
  {
    id v9 = (void *)os_transaction_create();
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    id v10 = (id)qword_10003B248;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(NSMutableOrderedSet *)self->_entries count];
      *(_DWORD *)buf = 134217984;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Saving SWC database with %llu entries...", buf, 0xCu);
    }

    id v12 = [(SWCDatabase *)self _storageForArchiving];
    id v19 = 0;
    long long v13 = [(id)objc_opt_class() _archivedDataFromStorage:v12 error:&v19];
    id v14 = v19;
    id v7 = v14;
    if (v13)
    {
      id v18 = v14;
      BOOL v8 = [(SWCDatabase *)self _updateStorageItemWithData:v13 error:&v18];
      id v15 = v18;

      id v7 = v15;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    id v6 = qword_10003B248;
    if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Non-shared instance of SWCDatabase cannot save--ignoring call.", buf, 2u);
    }
    id v7 = 0;
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    long long v16 = qword_10003B248;
    if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to save SWC database: %@", buf, 0xCu);
      if (!a3) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    if (a3) {
LABEL_20:
    }
      *a3 = v7;
  }
LABEL_21:

  return v8;
}

- (_SWCGeneration)settingsGeneration
{
  return (_SWCGeneration *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)launchServicesDatabaseGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLaunchServicesDatabaseGeneration:(id)a3
{
}

- (NSData)enterpriseState
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEnterpriseState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enterpriseState, 0);
  objc_storeStrong((id *)&self->_launchServicesDatabaseGeneration, 0);
  objc_storeStrong((id *)&self->_settingsGeneration, 0);
  objc_storeStrong((id *)&self->_domainCache, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

- (id)_initShared
{
  v37.receiver = self;
  v37.super_class = (Class)SWCDatabase;
  v2 = [(SWCDatabase *)&v37 init];
  if (v2)
  {
    *((unsigned char *)v2 + 40) |= 1u;
    id v4 = (_SWCGeneration *)objc_alloc_init((Class)_SWCGeneration);
    settingsGeneration = v2->_settingsGeneration;
    v2->_settingsGeneration = v4;

    id v6 = objc_alloc_init(SWCDomainCache);
    domainCache = v2->_domainCache;
    v2->_domainCache = v6;

    id v36 = 0;
    BOOL v8 = [(SWCDatabase *)v2 _dataFromStorageReturningError:&v36];
    id v9 = v36;
    id v10 = v9;
    if (v8)
    {
      id v35 = v9;
      id v11 = [(id)objc_opt_class() _storageFromArchivedData:v8 error:&v35];
      id v12 = v35;

      if (v11)
      {
        long long v13 = [v11 settings];
        id v14 = (NSMutableDictionary *)[v13 mutableCopy];
        settings = v2->_settings;
        v2->_settings = v14;

        if ([v11 databaseVersion] == (id)9)
        {
          long long v16 = [v11 entries];
          id v17 = (NSMutableOrderedSet *)[v16 mutableCopy];
          entries = v2->_entries;
          v2->_entries = v17;

          id v19 = [v11 launchServicesDatabaseGeneration];
          BOOL v20 = (NSNumber *)[v19 copy];
          launchServicesDatabaseGeneration = v2->_launchServicesDatabaseGeneration;
          v2->_launchServicesDatabaseGeneration = v20;

          long long v22 = [v11 enterpriseState];
          long long v23 = (NSData *)[v22 copy];
          enterpriseState = v2->_enterpriseState;
          v2->_enterpriseState = v23;

          [(SWCDomainCache *)v2->_domainCache updateCachedDomainsForEntries:v2->_entries];
        }
        else
        {
          if (qword_10003B250 != -1) {
            dispatch_once(&qword_10003B250, &stru_100034D78);
          }
          long long v25 = (id)qword_10003B248;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = [v11 databaseVersion];
            *(_DWORD *)buf = 134218240;
            id v39 = v26;
            __int16 v40 = 2048;
            uint64_t v41 = 9;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SWC database version did not match (had %llu, wanted %llu). Keeping settings and regenerating entries.", buf, 0x16u);
          }

          long long v27 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
          long long v28 = v2->_entries;
          v2->_entries = v27;
        }
      }
    }
    else
    {
      id v12 = v9;
    }

    if (!v2->_entries || !v2->_settings)
    {
      if (qword_10003B250 != -1) {
        dispatch_once(&qword_10003B250, &stru_100034D78);
      }
      long long v29 = qword_10003B248;
      if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to get SWC database, rebuilding: %@", buf, 0xCu);
      }
      id v30 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      long long v31 = v2->_entries;
      v2->_entries = v30;

      long long v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v33 = v2->_settings;
      v2->_settings = v32;
    }
  }
  return v2;
}

- (void)_removeSettingsForKeysNoSave:(id)a3 serviceSpecifier:(id)a4
{
  settings = self->_settings;
  if (a3)
  {
    BOOL v8 = [(NSMutableDictionary *)settings objectForKeyedSubscript:a4];
    id v10 = [v8 mutableCopy];

    if (v10)
    {
      [v10 removeObjectsForKeys:a3];
      if ([v10 count])
      {
        id v9 = [v10 copy];
        [(NSMutableDictionary *)self->_settings setObject:v9 forKeyedSubscript:a4];
      }
      else
      {
        [(NSMutableDictionary *)self->_settings setObject:0 forKeyedSubscript:a4];
      }
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](settings, "setObject:forKeyedSubscript:");
  }
}

- (id)_storageForArchiving
{
  id v4 = objc_alloc_init(SWCDatabaseStorage);
  if (!v4)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SWCDatabase.mm" lineNumber:806 description:@"Failed to allocate storage object"];
  }
  [(SWCDatabaseStorage *)v4 setDatabaseVersion:9];
  [(SWCDatabaseStorage *)v4 setEntries:self->_entries];
  [(SWCDatabaseStorage *)v4 setSettings:self->_settings];
  [(SWCDatabaseStorage *)v4 setLaunchServicesDatabaseGeneration:self->_launchServicesDatabaseGeneration];
  [(SWCDatabaseStorage *)v4 setEnterpriseState:self->_enterpriseState];

  return v4;
}

+ (id)_storageFromArchivedData:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v7 = +[NSKeyedUnarchiver swc_unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v10];
  id v8 = v10;
  if (a4 && !v7) {
    *a4 = v8;
  }

  return v7;
}

+ (id)_archivedDataFromStorage:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
  id v8 = v10;
  if (a4 && !v7) {
    *a4 = v8;
  }

  return v7;
}

- (void)_scheduleSave
{
  if (*((unsigned char *)self + 40))
  {
    uint64_t v8 = 0;
    *(void *)buf = 0x402E000000000000;
    uint64_t v9 = 0x401E000000000000;
    id v10 = [(id)objc_opt_class() queue];
    id v11 = (id)os_transaction_create();
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000157E0;
    v4[3] = &unk_100034D58;
    objc_copyWeak(&v5, &location);
    sub_100021D24((dispatch_object_t *)&self->_saveTimer, (uint64_t)buf, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    v2 = qword_10003B248;
    if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Non-shared instance of SWCDatabase cannot save--ignoring scheduling call.", buf, 2u);
    }
  }
}

- (void)_reorderAppLinks:(id)a3 domain:(id)a4
{
  id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = _SWCServiceTypeAppLinks;
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
        id v14 = [v13 serviceType:v19, v20];
        unsigned int v15 = [v14 isEqual:v11];

        if (v15)
        {
          long long v16 = [(SWCDatabase *)self entry:v13];
          if (v16)
          {
            if (qword_10003B250 != -1) {
              dispatch_once(&qword_10003B250, &stru_100034D78);
            }
            id v17 = qword_10003B248;
            if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              id v25 = v16;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Removing to reorder %@", buf, 0xCu);
            }
            [v6 addObject:v16];
          }
        }
        id v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  [(SWCDatabase *)self removeEntries:v6];
  [(SWCDatabase *)self addEntries:v6];
  if ([v6 count])
  {
    if (qword_10003B250 != -1) {
      dispatch_once(&qword_10003B250, &stru_100034D78);
    }
    id v18 = qword_10003B248;
    if (os_log_type_enabled((os_log_t)qword_10003B248, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Reordered %@", buf, 0xCu);
    }
  }
}

- (id)_dataURLReturningError:(id *)a3
{
  id v4 = +[_SWCPrefs sharedPrefs];
  id v5 = [v4 containerURLReturningError:a3];

  if (v5)
  {
    id v6 = [v5 URLByAppendingPathComponent:@"swc.db" isDirectory:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_dataFromStorageReturningError:(id *)a3
{
  id v4 = -[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:");
  if (v4) {
    id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:v4 options:1 error:a3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_updateStorageItemWithData:(id)a3 error:(id *)a4
{
  id v6 = [(SWCDatabase *)self _dataURLReturningError:a4];
  if (v6) {
    unsigned __int8 v7 = [a3 writeToURL:v6 options:268435457 error:a4];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_deleteStorageItemReturningError:(id *)a3
{
  id v4 = -[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:");
  if (v4)
  {
    id v5 = +[NSFileManager defaultManager];
    unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:a3];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end