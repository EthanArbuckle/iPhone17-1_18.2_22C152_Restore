@interface NotesRefreshController
+ (NotesRefreshController)sharedInstance;
- (BOOL)notesNeedRefresh;
- (BOOL)notesNeedRefreshForCollectionWithID:(id)a3;
- (BOOL)storesListNeedsRefresh;
- (id)_accountStore;
- (void)refreshAllNotesIfNeeded;
- (void)refreshNotesForCollectionWithID:(id)a3;
- (void)refreshOrphanedAccounts;
- (void)refreshStoresList;
@end

@implementation NotesRefreshController

+ (NotesRefreshController)sharedInstance
{
  v3 = (void *)qword_1006AA338;
  if (!qword_1006AA338)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1006AA338;
    qword_1006AA338 = (uint64_t)v4;

    v3 = (void *)qword_1006AA338;
  }

  return (NotesRefreshController *)v3;
}

- (id)_accountStore
{
  v2 = +[AccountUtilities sharedAccountUtilities];
  v3 = [v2 accountStore];

  return v3;
}

- (BOOL)storesListNeedsRefresh
{
  lastStoresListRefreshDate = self->_lastStoresListRefreshDate;
  if (!lastStoresListRefreshDate) {
    return 1;
  }
  [(NSDate *)lastStoresListRefreshDate timeIntervalSinceNow];
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  return v3 >= 10.0;
}

- (void)refreshOrphanedAccounts
{
  id v2 = objc_alloc((Class)NSMutableSet);
  double v3 = +[AccountUtilities sharedAccountUtilities];
  id v4 = [v3 accountIDsEnabledForNotes];
  id v5 = [v2 initWithArray:v4];

  v6 = +[NotesApp sharedNotesApp];
  v7 = [v6 noteContext];
  v8 = [v7 allAccounts];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    uint64_t v12 = kLocalAccountIdentifier;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v13) accountIdentifier];
        if (([v14 isEqualToString:v12] & 1) == 0) {
          [v5 removeObject:v14];
        }

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v5;
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v18);
        v20 = [sub_100138738() sharedConnection];
        [v20 updateFolderListForAccountID:v19 andDataclasses:32];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
}

- (void)refreshStoresList
{
  double v3 = +[NotesApp sharedNotesApp];
  id v4 = [v3 noteContext];
  id v5 = [v4 allAccounts];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = kLocalAccountIdentifier;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) accountIdentifier];
        if (([v11 isEqualToString:v9] & 1) == 0)
        {
          uint64_t v12 = [sub_100138738() sharedConnection];
          [v12 updateFolderListForAccountID:v11 andDataclasses:32];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = +[NSDate date];
  lastStoresListRefreshDate = self->_lastStoresListRefreshDate;
  self->_lastStoresListRefreshDate = v13;
}

- (BOOL)notesNeedRefresh
{
  double v3 = +[NotesApp sharedNotesApp];
  id v4 = [v3 noteContext];
  id v5 = [v4 allAccounts];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectID:v15];
        unsigned __int8 v12 = [(NotesRefreshController *)self notesNeedRefreshForCollectionWithID:v11];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)notesNeedRefreshForCollectionWithID:(id)a3
{
  id v4 = a3;
  id v5 = +[NotesApp sharedNotesApp];
  id v6 = [v5 noteContext];
  id v7 = [v6 collectionForObjectID:v4];

  if (v7)
  {
    id v8 = [v7 basicAccountIdentifier];
    if ([v8 isEqualToString:kLocalAccountIdentifier])
    {
      BOOL v9 = 0;
LABEL_26:

      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(NSMutableDictionary *)self->_lastNotesRefreshDates objectForKey:v4];
      if (v10)
      {
LABEL_7:
        [v10 timeIntervalSinceNow];
        if (v11 < 0.0) {
          double v11 = -v11;
        }
        BOOL v9 = v11 >= 10.0;
        goto LABEL_25;
      }
    }
    else
    {
      long long v23 = v8;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v22 = v7;
      unsigned __int8 v12 = [v22 stores];
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        id v10 = 0;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            lastNotesRefreshDates = self->_lastNotesRefreshDates;
            long long v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) objectID];
            uint64_t v19 = [(NSMutableDictionary *)lastNotesRefreshDates objectForKey:v18];

            if (v19)
            {
              if (!v10) {
                id v10 = v19;
              }
              uint64_t v20 = [v10 earlierDate:v19];

              id v10 = (id)v20;
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v14);
      }
      else
      {
        id v10 = 0;
      }

      id v8 = v23;
      if (v10) {
        goto LABEL_7;
      }
    }
    BOOL v9 = 1;
LABEL_25:

    goto LABEL_26;
  }
  BOOL v9 = 0;
LABEL_27:

  return v9;
}

- (void)refreshAllNotesIfNeeded
{
  double v3 = +[NotesApp sharedNotesApp];
  id v4 = [v3 noteContext];
  id v5 = [v4 allAccounts];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) objectID:v12];
        if ([(NotesRefreshController *)self notesNeedRefreshForCollectionWithID:v11])
        {
          [(NotesRefreshController *)self refreshNotesForCollectionWithID:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)refreshNotesForCollectionWithID:(id)a3
{
  id v27 = a3;
  id v4 = +[NotesApp sharedNotesApp];
  id v5 = [v4 noteContext];
  id v6 = [v5 collectionForObjectID:v27];

  id v7 = [v6 basicAccountIdentifier];
  if (([v7 isEqualToString:kLocalAccountIdentifier] & 1) == 0)
  {
    if (!self->_lastNotesRefreshDates)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lastNotesRefreshDates = self->_lastNotesRefreshDates;
      self->_lastNotesRefreshDates = v8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v6;
      double v11 = [sub_100138738() sharedConnection];
      unsigned int v12 = [v11 updateContentsOfAllFoldersForAccountID:v7 andDataclass:32];

      if (v12)
      {
        long long v13 = +[NSDate date];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v14 = [v10 stores];
        id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v29;
          do
          {
            long long v17 = 0;
            do
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v14);
              }
              long long v18 = self->_lastNotesRefreshDates;
              uint64_t v19 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v17) objectID];
              [(NSMutableDictionary *)v18 setObject:v13 forKey:v19];

              long long v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }
          while (v15);
        }
      }
LABEL_17:

      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v6;
      long long v21 = [sub_100138738() sharedConnection];
      id v22 = [v20 externalIdentifier];
      v32 = v22;
      long long v23 = +[NSArray arrayWithObjects:&v32 count:1];
      unsigned int v24 = [v21 updateContentsOfFoldersWithKeys:v23 forAccountID:v7 andDataclass:32];

      if (v24)
      {
        long long v25 = self->_lastNotesRefreshDates;
        long long v26 = +[NSDate date];
        [(NSMutableDictionary *)v25 setObject:v26 forKey:v27];
      }
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStoresListRefreshDate, 0);

  objc_storeStrong((id *)&self->_lastNotesRefreshDates, 0);
}

@end