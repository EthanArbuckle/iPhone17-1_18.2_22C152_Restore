@interface CNContactStore
- (id)_gkChangeHistoryRequestWithToken:(id)a3;
- (id)_gkContactKeysToFetch;
- (id)_gkContactsWithContactIDs:(id)a3;
- (id)_gkMeContact;
- (id)_gkSyncAndCollectHandlesForContacts:(id)a3 updateExistingEntries:(BOOL)a4 meContactID:(id)a5 context:(id)a6;
- (void)_gkSyncAllContactsWithMeContactID:(id)a3 playerProvider:(id)a4 batchSize:(unint64_t)a5;
- (void)_gkSyncContactsWithChangeHistoryToken:(id)a3 playerProvider:(id)a4 batchSize:(unint64_t)a5 changeHistoryLimit:(unint64_t)a6 cachedListVersion:(signed __int16)a7;
- (void)_gkSyncWithBatchOfContactIDs:(id)a3 playerProvider:(id)a4 meContactID:(id)a5 commandBatcher:(id)a6;
- (void)_gkSyncWithChangeHistoryResult:(id)a3 playerProvider:(id)a4 meContactID:(id)a5 batchSize:(unint64_t)a6;
@end

@implementation CNContactStore

- (id)_gkContactKeysToFetch
{
  v2 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v5[0] = v2;
  v5[1] = CNContactIdentifierKey;
  v5[2] = CNContactEmailAddressesKey;
  v5[3] = CNContactPhoneNumbersKey;
  v5[4] = CNContactGivenNameKey;
  v5[5] = CNContactFamilyNameKey;
  v5[6] = CNContactNamePrefixKey;
  v5[7] = CNContactNameSuffixKey;
  v5[8] = CNContactTypeKey;
  v3 = +[NSArray arrayWithObjects:v5 count:9];

  return v3;
}

- (void)_gkSyncContactsWithChangeHistoryToken:(id)a3 playerProvider:(id)a4 batchSize:(unint64_t)a5 changeHistoryLimit:(unint64_t)a6 cachedListVersion:(signed __int16)a7
{
  id v11 = a3;
  id v12 = a4;
  v13 = [(CNContactStore *)self _gkMeContact];
  v14 = [v13 identifier];

  v15 = +[GKDataRequestManager sharedManager];
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "CNContactStore+GKAdditions.m", 62, "-[CNContactStore(GKAdditions) _gkSyncContactsWithChangeHistoryToken:playerProvider:batchSize:changeHistoryLimit:cachedListVersion:]");
  v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001336AC;
  v39[3] = &unk_1002D3A70;
  id v18 = v15;
  id v40 = v18;
  v41 = @"contactsSync";
  [v17 perform:v39];
  [v17 wait];
  if (v11)
  {
    id v36 = v12;
    unint64_t v19 = a5;
    v20 = [(CNContactStore *)self _gkChangeHistoryRequestWithToken:v11];
    id v38 = 0;
    v21 = [(CNContactStore *)self countForFetchRequest:v20 error:&v38];
    id v22 = v38;

    if (v21 && !v22)
    {
      v23 = [v21 value];
      id v24 = [v23 integerValue];

      if ((unint64_t)v24 < a6)
      {
        v25 = [(CNContactStore *)self _gkChangeHistoryRequestWithToken:v11];
        id v37 = 0;
        v26 = [(CNContactStore *)self enumeratorForChangeHistoryFetchRequest:v25 error:&v37];
        id v27 = v37;
        v35 = v26;
        v28 = [v26 value];

        if (!v28 || v27)
        {
          v29 = v27;
          v34 = v25;
          if (!os_log_GKGeneral) {
            id v32 = (id)GKOSLoggers();
          }
          unint64_t v33 = v19;
          v30 = v35;
          if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
            sub_100134838();
          }
          id v12 = v36;
          [(CNContactStore *)self _gkSyncAllContactsWithMeContactID:v14 playerProvider:v36 batchSize:v33];
          v25 = v34;
        }
        else
        {
          v29 = 0;
          v30 = v35;
          id v12 = v36;
          -[CNContactStore _gkSyncWithChangeHistoryResult:playerProvider:meContactID:batchSize:](self, "_gkSyncWithChangeHistoryResult:playerProvider:meContactID:batchSize:", v35);
        }
        [v18 endTransaction:@"contactsSync"];

        id v22 = 0;
        goto LABEL_16;
      }
      id v22 = 0;
    }
    a5 = v19;
    id v12 = v36;
  }
  else
  {
    id v22 = 0;
    v21 = 0;
  }
  if (!os_log_GKGeneral) {
    id v31 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_1001347D0();
  }
  [(CNContactStore *)self _gkSyncAllContactsWithMeContactID:v14 playerProvider:v12 batchSize:a5];
  [v18 endTransaction:@"contactsSync"];
LABEL_16:
}

- (id)_gkChangeHistoryRequestWithToken:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
  [v5 setShouldUnifyResults:1];
  v6 = [(CNContactStore *)self _gkContactKeysToFetch];
  [v5 setAdditionalContactKeyDescriptors:v6];

  [v5 setStartingToken:v4];

  return v5;
}

- (void)_gkSyncWithChangeHistoryResult:(id)a3 playerProvider:(id)a4 meContactID:(id)a5 batchSize:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 value];
  v13 = [GKContactsCacheUpdateFinishedCommand alloc];
  v14 = [v9 currentHistoryToken];
  v15 = [(GKContactsCacheUpdateFinishedCommand *)v13 initWithChangeHistoryToken:v14];

  v16 = [[GKContactsChangedCommandBatcher alloc] initWithPlayerProvider:v10 meContactID:v11 batchSize:a6 finishedCommand:v15];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v24;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v21) acceptEventVisitor:v16 (void)v23];
        id v22 = [(GKContactsChangedCommandBatcher *)v16 error];

        if (v22)
        {

          goto LABEL_11;
        }
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  [(GKContactsChangedCommandBatcher *)v16 finish];
LABEL_11:
}

- (id)_gkMeContact
{
  id v12 = CNContactIdentifierKey;
  v3 = +[NSArray arrayWithObjects:&v12 count:1];
  id v11 = 0;
  id v4 = [(CNContactStore *)self _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v11];
  id v5 = v11;

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100134918();
    }
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    v8 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001348A0((uint64_t)v5, v8);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)_gkSyncAllContactsWithMeContactID:(id)a3 playerProvider:(id)a4 batchSize:(unint64_t)a5
{
  id v38 = a3;
  id v8 = a4;
  id v10 = [v8 localPlayerCacheGroup];
  id v11 = [v10 context];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100133F30;
  v44[3] = &unk_1002D40E0;
  id v45 = v10;
  id v12 = v10;
  [v11 performBlockAndWait:v44];

  id v13 = objc_alloc((Class)CNContactFetchRequest);
  v47 = CNContactIdentifierKey;
  v14 = +[NSArray arrayWithObjects:&v47 count:1];
  id v15 = [v13 initWithKeysToFetch:v14];

  id v43 = 0;
  v16 = [(CNContactStore *)self enumeratorForContactFetchRequest:v15 error:&v43];
  id v17 = v43;
  if (v17 || !v16)
  {
    if (!os_log_GKGeneral) {
      id v32 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1001349C4();
    }
    if (!os_log_GKGeneral) {
      id v33 = (id)GKOSLoggers();
    }
    v34 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_10013494C((uint64_t)v17, v34);
    }
  }
  else
  {
    id v37 = v15;
    id v18 = [GKContactsCacheUpdateFinishedCommand alloc];
    id v19 = [v16 currentHistoryToken];
    uint64_t v20 = [(GKContactsCacheUpdateFinishedCommand *)v18 initWithChangeHistoryToken:v19];

    v35 = v20;
    v21 = [[GKContactsChangedCommandBatcher alloc] initWithPlayerProvider:v8 meContactID:v38 batchSize:a5 finishedCommand:v20];
    id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a5];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = v16;
    long long v23 = [v16 value];
    id v24 = [v23 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v39 + 1) + 8 * i) identifier];
          [v22 addObject:v28];

          if ((unint64_t)[v22 count] >= a5)
          {
            id v29 = [v22 copy];
            [(CNContactStore *)self _gkSyncWithBatchOfContactIDs:v29 playerProvider:v8 meContactID:v38 commandBatcher:v21];

            [v22 removeAllObjects];
            v30 = [(GKContactsChangedCommandBatcher *)v21 error];

            if (v30)
            {

              goto LABEL_22;
            }
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    id v31 = [v22 copy];
    [(CNContactStore *)self _gkSyncWithBatchOfContactIDs:v31 playerProvider:v8 meContactID:v38 commandBatcher:v21];

    [(GKContactsChangedCommandBatcher *)v21 finish];
LABEL_22:

    v16 = v36;
    id v15 = v37;
    id v17 = 0;
  }
}

- (id)_gkContactsWithContactIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc((Class)CNContactFetchRequest);
    id v6 = [(CNContactStore *)self _gkContactKeysToFetch];
    id v7 = [v5 initWithKeysToFetch:v6];

    id v8 = +[CNContact predicateForContactsWithIdentifiers:v4];
    [v7 setPredicate:v8];

    id v17 = 0;
    id v9 = [(CNContactStore *)self enumeratorForContactFetchRequest:v7 error:&v17];
    id v10 = v17;
    id v11 = [v9 value];

    if (!v11 || v10)
    {
      if (!os_log_GKGeneral) {
        id v14 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100134AA0();
      }
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100134A38();
      }
      id v12 = 0;
    }
    else
    {
      id v12 = [v9 value];
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001349F8();
    }
    id v12 = 0;
  }

  return v12;
}

- (void)_gkSyncWithBatchOfContactIDs:(id)a3 playerProvider:(id)a4 meContactID:(id)a5 commandBatcher:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(CNContactStore *)self _gkContactsWithContactIDs:a3];
  id v14 = [v12 localPlayerCacheGroup];

  id v15 = [v14 context];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001342DC;
  v20[3] = &unk_1002D4928;
  id v21 = v13;
  id v22 = v10;
  id v23 = v11;
  id v24 = v14;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  [v15 performBlockAndWait:v20];
}

- (id)_gkSyncAndCollectHandlesForContacts:(id)a3 updateExistingEntries:(BOOL)a4 meContactID:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v34 = a5;
  id v10 = a6;
  id v33 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  id v32 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  if (a4)
  {
    id v11 = v10;
    id v12 = 0;
  }
  else
  {
    id v13 = [v9 _gkDistinctValuesForKeyPath:@"identifier"];
    id v14 = +[NSPredicate predicateWithFormat:@"contactID in %@", v13];
    id v11 = v10;
    id v15 = +[GKCDContactInfo _gkObjectsMatchingPredicate:v14 withContext:v10];
    id v12 = [v15 _gkDistinctValuesForKeyPath:@"contactID"];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v22 = [v21 identifier];
        unsigned __int8 v23 = [v12 containsObject:v22];

        if (v23)
        {
          id v24 = [v21 _gkAllHandles];
          [v33 unionSet:v24];
        }
        else
        {
          id v24 = [[GKContactsChangedAddOrUpdateCommand alloc] initWithContact:v21 meContactID:v34];
          id v25 = [(GKContactsChangedAddOrUpdateCommand *)v24 executeWithContext:v11];
          if ([v25 count])
          {
            [v32 unionSet:v25];
          }
          else
          {
            if (!os_log_GKGeneral) {
              id v26 = (id)GKOSLoggers();
            }
            id v27 = (void *)os_log_GKContacts;
            if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
              sub_100134AD4(v39, v27, v21, &v40);
            }
            v28 = [v21 _gkAllHandles];
            [v32 unionSet:v28];
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v18);
  }

  if ([v32 count])
  {
    id v29 = objc_alloc_init(GKContactsCacheUpdateBatchEndCommand);
    [(GKContactsCacheUpdateBatchEndCommand *)v29 executeWithHandles:v32 context:v11];
  }
  [v33 unionSet:v32];
  id v30 = [v33 copy];

  return v30;
}

@end