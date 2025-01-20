@interface PDAuxiliaryPassInformationManager
- (BOOL)_canUpdateMapsDataForMerchant:(id)a3 configurations:(id *)a4;
- (PDAuxiliaryPassInformationManager)initWithDatabaseManager:(id)a3 withMerchantUpdater:(id)a4 userNotificationManager:(id)a5;
- (id)_mapsBrandAndMerchantForMerchant:(id)a3;
- (void)_lookupMapsInformationForItem:(id)a3 completion:(id)a4;
- (void)_markOutstandingUpdatesInvalidForPassUniqueIdentifier:(id)a3;
- (void)_processAuxiliaryPassInformation:(id)a3 pass:(id)a4;
- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4 oldAuxiliaryInformationIdentifiers:(id)a5;
- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5;
- (void)passWillBeRemoved:(id)a3;
@end

@implementation PDAuxiliaryPassInformationManager

- (PDAuxiliaryPassInformationManager)initWithDatabaseManager:(id)a3 withMerchantUpdater:(id)a4 userNotificationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDAuxiliaryPassInformationManager;
  v12 = [(PDAuxiliaryPassInformationManager *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_merchantUpdater, a4);
    if (PKMultiReservationTTUNotificationEnabled())
    {
      v14 = [[PDAuxiliaryPassInformationNotificationManager alloc] initWithUserNotificationManager:v11];
      notificationManager = v13->_notificationManager;
      v13->_notificationManager = v14;
    }
    v13->_lock._os_unfair_lock_opaque = 0;
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    processingItemUpdatesForPass = v13->_processingItemUpdatesForPass;
    v13->_processingItemUpdatesForPass = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    processingItemCompletions = v13->_processingItemCompletions;
    v13->_processingItemCompletions = v18;
  }
  return v13;
}

- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4 oldAuxiliaryInformationIdentifiers:(id)a5
{
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  v27 = v7;
  id v9 = [v7 auxiliaryPassInformation];
  id v10 = objc_alloc_init((Class)NSMutableSet);
  id v11 = [objc_alloc((Class)NSMutableSet) initWithSet:v8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v9;
  id v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v40;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obj);
        }
        v13 = [*(id *)(*((void *)&v39 + 1) + 8 * i) items];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
              v19 = [v18 identifier];
              if ([v8 containsObject:v19]) {
                [v11 removeObject:v19];
              }
              else {
                [v10 addObject:v18];
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v15);
        }
      }
      id v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v30);
  }

  if ([v11 count])
  {
    v20 = [v26 uniqueID];
    [(PDAuxiliaryPassInformationManager *)self _markOutstandingUpdatesInvalidForPassUniqueIdentifier:v20];
    databaseManager = self->_databaseManager;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000AAD74;
    v31[3] = &unk_100733610;
    id v32 = v11;
    v33 = self;
    id v34 = v20;
    id v22 = v20;
    [(PDDatabaseManager *)databaseManager performTransactionWithBlock:v31];
  }
  if ([v10 count])
  {
    v23 = [v27 uniqueID];
    [(PDAuxiliaryPassInformationManager *)self _markOutstandingUpdatesInvalidForPassUniqueIdentifier:v23];

    v24 = [v10 allObjects];
    [(PDAuxiliaryPassInformationManager *)self _processAuxiliaryPassInformation:v24 pass:v27];
  }
  if (PKMultiReservationTTUNotificationEnabled()) {
    [(PDAuxiliaryPassInformationNotificationManager *)self->_notificationManager didInsertOrUpdatePass:v27 oldPass:v26];
  }
}

- (void)passWillBeRemoved:(id)a3
{
  databaseManager = self->_databaseManager;
  id v4 = [a3 uniqueID];
  [(PDDatabaseManager *)databaseManager deleteAllPassAuxiliaryItemMerchantsForPassUniqueIdentifier:v4];
}

- (void)_markOutstandingUpdatesInvalidForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_processingItemUpdatesForPass objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setIsInvalid:1];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  [(NSMutableDictionary *)self->_processingItemUpdatesForPass setObject:v6 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_processAuxiliaryPassInformation:(id)a3 pass:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [a4 uniqueID];
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v40 = objc_alloc_init((Class)NSMutableArray);
    id v48 = objc_alloc_init((Class)NSMutableDictionary);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v38 = v6;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    long long v41 = v8;
    v47 = self;
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v63;
      long long v39 = v7;
      uint64_t v43 = *(void *)v63;
      do
      {
        long long v12 = 0;
        id v44 = v10;
        do
        {
          if (*(void *)v63 != v11) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v12);
          long long v14 = objc_msgSend(v13, "identifier", lock);
          if (v14)
          {
            id v15 = [v13 mapsURL];

            if (v15)
            {
              uint64_t v16 = [(PDDatabaseManager *)self->_databaseManager merchantForPassUniqueIdentifier:v7 auxiliaryPassInformationItemIdentifier:v14];
              if (v16)
              {
                id v17 = [(PDAuxiliaryPassInformationManager *)self _mapsBrandAndMerchantForMerchant:v16];
                [v8 addObjectsFromArray:v17];
              }
              else
              {
                v18 = [(NSMutableDictionary *)self->_processingItemUpdatesForPass objectForKey:v7];
                v19 = objc_alloc_init(PDAuxiliaryPassInformationManagerItemUpdate);
                [(PDAuxiliaryPassInformationManagerItemUpdate *)v19 setItem:v13];
                [(PDAuxiliaryPassInformationManagerItemUpdate *)v19 setIsInvalid:0];
                if (v18)
                {
                  long long v42 = v19;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  id v17 = v18;
                  id v20 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
                  if (v20)
                  {
                    id v21 = v20;
                    uint64_t v22 = *(void *)v59;
                    do
                    {
                      for (i = 0; i != v21; i = (char *)i + 1)
                      {
                        if (*(void *)v59 != v22) {
                          objc_enumerationMutation(v17);
                        }
                        v24 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                        v25 = [v24 item];
                        if ([v13 isEqual:v25])
                        {
                          unsigned __int8 v26 = [v24 isInvalid];

                          if ((v26 & 1) == 0)
                          {

                            self = v47;
                            id v7 = v39;
                            [(NSMutableDictionary *)v47->_processingItemUpdatesForPass setObject:v17 forKeyedSubscript:v39];

                            goto LABEL_26;
                          }
                        }
                        else
                        {
                        }
                      }
                      id v21 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
                    }
                    while (v21);
                  }

                  v19 = v42;
                  [v17 addObject:v42];
                  id v7 = v39;
                  self = v47;
                }
                else
                {
                  id v27 = objc_alloc((Class)NSMutableSet);
                  v68 = v19;
                  v28 = +[NSArray arrayWithObjects:&v68 count:1];
                  id v17 = [v27 initWithArray:v28];
                }
                [(NSMutableDictionary *)self->_processingItemUpdatesForPass setObject:v17 forKeyedSubscript:v7];
                [v40 addObject:v13];
                [v48 setObject:v19 forKey:v14];

LABEL_26:
                id v8 = v41;
              }

              uint64_t v11 = v43;
              id v10 = v44;
            }
          }

          long long v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        id v10 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v10);
    }

    os_unfair_lock_unlock(lock);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obja = v40;
    id v29 = [obja countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v55;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
          id v34 = objc_msgSend(v33, "identifier", lock);
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000AB528;
          v49[3] = &unk_100733660;
          v49[4] = v47;
          id v50 = v7;
          id v51 = v48;
          v52 = v34;
          v53 = v33;
          [(PDAuxiliaryPassInformationManager *)v47 _lookupMapsInformationForItem:v33 completion:v49];
        }
        id v30 = [obja countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v30);
    }

    if ([v41 count])
    {
      merchantUpdater = v47->_merchantUpdater;
      id v36 = [v41 copy];
      [(PDMapsBrandAndMerchantUpdater *)merchantUpdater updateMapsDataForConfigurations:v36];
    }
    id v6 = v38;
  }
}

- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if (v10)
  {
    if (v8 && v9)
    {
      long long v12 = [v9 identifier];
      if (!v12) {
        v11[2](v11, 0);
      }
      os_unfair_lock_lock(&self->_lock);
      long long v13 = [(NSMutableDictionary *)self->_processingItemUpdatesForPass objectForKey:v8];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000ABDBC;
      v32[3] = &unk_100733688;
      v32[4] = v12;
      if (objc_msgSend(v13, "pk_hasObjectPassingTest:", v32))
      {
        long long v14 = [(NSMutableDictionary *)self->_processingItemCompletions objectForKey:v8];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = [v14 objectForKey:v12];
          if (v16)
          {
            id v17 = objc_retainBlock(v11);
            [v16 addObject:v17];
          }
          else
          {
            id v28 = objc_alloc((Class)NSMutableArray);
            id v17 = objc_retainBlock(v11);
            id v24 = objc_msgSend(v28, "initWithObjects:", v17, 0);
            id v29 = v13;
            v25 = v24;
            [v15 setObject:v24 forKey:v12];

            long long v13 = v29;
          }
        }
        else
        {
          id v20 = objc_alloc((Class)NSMutableDictionary);
          id v21 = objc_alloc((Class)NSMutableArray);
          id v22 = objc_retainBlock(v11);
          id v23 = objc_msgSend(v21, "initWithObjects:", v22, 0);
          id v15 = objc_msgSend(v20, "initWithObjectsAndKeys:", v23, v12, 0);

          [(NSMutableDictionary *)self->_processingItemCompletions setObject:v15 forKey:v8];
        }
        unsigned __int8 v26 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          processingItemCompletions = self->_processingItemCompletions;
          *(_DWORD *)buf = 138412802;
          id v34 = v12;
          __int16 v35 = 2112;
          id v36 = v8;
          __int16 v37 = 2112;
          id v38 = processingItemCompletions;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "PDAuxiliaryPassInformationManager: Merchant lookup for %@ in pass %@ in progress, queueing completion %@", buf, 0x20u);
        }

        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
        v18 = [(PDDatabaseManager *)self->_databaseManager merchantForPassUniqueIdentifier:v8 auxiliaryPassInformationItemIdentifier:v12];
        [(NSMutableDictionary *)v18 setUseDisplayNameIgnoringBrand:1];
        v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v34 = v12;
          __int16 v35 = 2112;
          id v36 = v8;
          __int16 v37 = 2112;
          id v38 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDAuxiliaryPassInformationManager: Fetched merchant for %@ in pass %@ (merchant lookup not in progress): %@", buf, 0x20u);
        }

        if (v18)
        {
          ((void (**)(void, NSMutableDictionary *))v11)[2](v11, v18);
        }
        else
        {
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1000ABE50;
          v30[3] = &unk_1007336B0;
          uint64_t v31 = v11;
          [(PDAuxiliaryPassInformationManager *)self _lookupMapsInformationForItem:v9 completion:v30];
        }
      }
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)_lookupMapsInformationForItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)PKAuxiliaryItemMerchantLookupSource) initWithAuxiliaryItem:v5];
  id v8 = [objc_alloc((Class)PKMerchantLookupRequest) initWithSource:v7];
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v5 description];
    *(_DWORD *)buf = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDAuxiliaryPassInformationManager: Looking up maps data for aux item %@", buf, 0xCu);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AC040;
  v13[3] = &unk_1007336D8;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v8 startLookupWithCompletion:v13];
}

- (id)_mapsBrandAndMerchantForMerchant:(id)a3
{
  id v8 = 0;
  unsigned int v3 = [(PDAuxiliaryPassInformationManager *)self _canUpdateMapsDataForMerchant:a3 configurations:&v8];
  id v4 = v8;
  id v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)_canUpdateMapsDataForMerchant:(id)a3 configurations:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 mapsBrand];
  id v16 = 0;
  unsigned __int8 v8 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForBrand:v7 outConfiguration:&v16];
  id v9 = v16;

  [v6 safelyAddObject:v9];
  id v10 = [v5 mapsMerchant];

  id v15 = 0;
  unsigned __int8 v11 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForMerchant:v10 outConfiguration:&v15];
  id v12 = v15;

  [v6 safelyAddObject:v12];
  char v13 = PKIsPhone();
  if (a4) {
    *a4 = [v6 copy];
  }

  return v13 & (v8 | v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingItemCompletions, 0);
  objc_storeStrong((id *)&self->_processingItemUpdatesForPass, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_merchantUpdater, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end