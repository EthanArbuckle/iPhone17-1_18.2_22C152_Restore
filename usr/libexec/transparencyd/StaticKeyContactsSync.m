@interface StaticKeyContactsSync
- (BOOL)started;
- (KTSignalTermHandler)sigTerm;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (StaticKeyContactsStorage)storage;
- (StaticKeyContactsSync)initWithStorage:(id)a3;
- (StaticKeyContactsSyncDelegate)delegate;
- (void)consumeContactsChangeHistory;
- (void)contactStoreDidChange:(id)a3;
- (void)dealloc;
- (void)drainContactsSyncing;
- (void)invalidateContactsSyncing;
- (void)onQueueMergeChangesFromContacts;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSigTerm:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStorage:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startContactsSyncing;
@end

@implementation StaticKeyContactsSync

- (StaticKeyContactsSync)initWithStorage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)StaticKeyContactsSync;
  v5 = [(StaticKeyContactsSync *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(StaticKeyContactsSync *)v5 setStorage:v4];
    [(StaticKeyContactsSync *)v6 setStarted:0];
    [(StaticKeyContactsSync *)v6 setTransaction:0];
    dispatch_queue_t v7 = dispatch_queue_create("StaticKeyContactsSync", 0);
    [(StaticKeyContactsSync *)v6 setQueue:v7];

    id location = 0;
    objc_initWeak(&location, v6);
    v8 = [KTSignalTermHandler alloc];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1001D4DB0;
    v15 = &unk_1002B72D8;
    objc_copyWeak(&v16, &location);
    v9 = [(KTSignalTermHandler *)v8 initWithSIGTERMNotification:&v12];
    -[StaticKeyContactsSync setSigTerm:](v6, "setSigTerm:", v9, v12, v13, v14, v15);

    v10 = v6;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(StaticKeyContactsSync *)self sigTerm];
  [v3 unregister];

  v4.receiver = self;
  v4.super_class = (Class)StaticKeyContactsSync;
  [(StaticKeyContactsSync *)&v4 dealloc];
}

- (void)startContactsSyncing
{
  v3 = [(StaticKeyContactsSync *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D5000;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);

  if (qword_10032F158 != -1) {
    dispatch_once(&qword_10032F158, &stru_1002C7638);
  }
  objc_super v4 = qword_10032F160;
  if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "StaticKeyContactsSync started", v5, 2u);
  }
  [(StaticKeyContactsSync *)self consumeContactsChangeHistory];
}

- (void)contactStoreDidChange:(id)a3
{
  id v4 = a3;
  if (qword_10032F158 != -1) {
    dispatch_once(&qword_10032F158, &stru_1002C7658);
  }
  v5 = qword_10032F160;
  if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "contactStoreDidChange: %@", (uint8_t *)&v6, 0xCu);
  }
  [(StaticKeyContactsSync *)self consumeContactsChangeHistory];
}

- (void)consumeContactsChangeHistory
{
  v3 = [(StaticKeyContactsSync *)self delegate];
  id v10 = 0;
  id v4 = [v3 listStaticKey:&v10];
  id v5 = v10;

  if (v5)
  {
    if (qword_10032F158 != -1) {
      dispatch_once(&qword_10032F158, &stru_1002C7678);
    }
    int v6 = qword_10032F160;
    if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error fetching static key results %@", buf, 0xCu);
    }
  }
  if ([v4 count])
  {
    if (!+[KTSignalTermHandler terminated])
    {
      id v7 = [(StaticKeyContactsSync *)self queue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001D5530;
      v9[3] = &unk_1002B6CF8;
      v9[4] = self;
      dispatch_async(v7, v9);
    }
  }
  else
  {
    if (qword_10032F158 != -1) {
      dispatch_once(&qword_10032F158, &stru_1002C7698);
    }
    v8 = qword_10032F160;
    if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "consumeContactsChangeHistory ignoring contacts change because we have no KT entries", buf, 2u);
    }
  }
}

- (void)invalidateContactsSyncing
{
  if (qword_10032F158 != -1) {
    dispatch_once(&qword_10032F158, &stru_1002C76B8);
  }
  v3 = qword_10032F160;
  if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "StaticKeyContactsSync invalidate", v5, 2u);
  }
  [(StaticKeyContactsSync *)self setStorage:0];
  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CNContactStoreDidChangeNotification object:0];
}

- (void)drainContactsSyncing
{
  v2 = [(StaticKeyContactsSync *)self queue];
  dispatch_sync(v2, &stru_1002C76D8);
}

- (void)onQueueMergeChangesFromContacts
{
  if (qword_10032F158 != -1) {
    dispatch_once(&qword_10032F158, &stru_1002C76F8);
  }
  v3 = qword_10032F160;
  if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "mergeChangesFromContacts started", buf, 2u);
  }
  id v4 = [(StaticKeyContactsSync *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
  int v6 = [(StaticKeyContactsSync *)self storage];
  id v7 = [v6 fetchContactsSyncToken];
  [v5 setStartingToken:v7];

  [v5 setExcludedTransactionAuthors:&off_1002DA5B8];
  v58[0] = CNContactEmailAddressesKey;
  v58[1] = CNContactPhoneNumbersKey;
  v58[2] = CNContactExternalIdentifierKey;
  v8 = +[NSArray arrayWithObjects:v58 count:3];
  [v5 setAdditionalContactKeyDescriptors:v8];

  id v9 = objc_alloc_init((Class)CNContactStore);
  id v53 = 0;
  id v10 = [v9 enumeratorForChangeHistoryFetchRequest:v5 error:&v53];
  id v11 = v53;
  id v12 = v11;
  if (!v10)
  {
    if (qword_10032F158 != -1) {
      dispatch_once(&qword_10032F158, &stru_1002C7718);
    }
    v39 = qword_10032F160;
    if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v12;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "CNFetchResult failed: %@", buf, 0xCu);
    }
    goto LABEL_57;
  }
  id v51 = v11;
  v52 = v10;
  uint64_t v13 = [v10 value];
  v14 = 0;
  *(void *)&long long v15 = 138412546;
  long long v49 = v15;
  while (1)
  {
    id v16 = v14;
    v14 = [v13 nextObject:v49];

    if (!v14) {
      break;
    }
    if (qword_10032F158 != -1) {
      dispatch_once(&qword_10032F158, &stru_1002C7738);
    }
    v17 = qword_10032F160;
    if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "mergeChangesFromContacts: change history enumerator object = %@", buf, 0xCu);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (qword_10032F158 != -1) {
        dispatch_once(&qword_10032F158, &stru_1002C7758);
      }
      objc_super v18 = qword_10032F160;
      if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - drop everything", buf, 2u);
      }
      v19 = [(StaticKeyContactsSync *)self delegate];
      [v19 resetContactsStorage];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v14;
        if (qword_10032F158 != -1) {
          dispatch_once(&qword_10032F158, &stru_1002C7778);
        }
        v21 = (void *)qword_10032F160;
        if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          v23 = [v20 contact];
          *(_DWORD *)buf = 138412290;
          v55 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - AddContact event - %@", buf, 0xCu);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = v14;
            id v50 = v9;
            if (qword_10032F158 != -1) {
              dispatch_once(&qword_10032F158, &stru_1002C77B8);
            }
            id v30 = v5;
            v31 = (void *)qword_10032F160;
            if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              v33 = [v29 contactIdentifier];
              v34 = [v29 externalURI];
              *(_DWORD *)buf = v49;
              v55 = v33;
              __int16 v56 = 2112;
              v57 = v34;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - DeleteContact event - %@[%@]", buf, 0x16u);
            }
            v35 = [(StaticKeyContactsSync *)self delegate];
            v36 = [v29 contactIdentifier];
            v37 = [v29 externalURI];
            [v35 deleteContact:v36 contactExternalURI:v37];

            id v5 = v30;
            id v9 = v50;
          }
          else
          {
            if (qword_10032F158 != -1) {
              dispatch_once(&qword_10032F158, &stru_1002C77D8);
            }
            v38 = qword_10032F160;
            if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v14;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - ignoring event - %@", buf, 0xCu);
            }
          }
          goto LABEL_29;
        }
        id v20 = v14;
        if (qword_10032F158 != -1) {
          dispatch_once(&qword_10032F158, &stru_1002C7798);
        }
        v24 = (void *)qword_10032F160;
        if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v24;
          v26 = [v20 contact];
          *(_DWORD *)buf = 138412290;
          v55 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - UpdateContact event - %@", buf, 0xCu);
        }
      }
      v27 = [(StaticKeyContactsSync *)self delegate];
      v28 = [v20 contact];
      [v27 updateContact:v28];
    }
LABEL_29:
    if (+[KTSignalTermHandler terminated])
    {
      if (qword_10032F158 != -1) {
        dispatch_once(&qword_10032F158, &stru_1002C77F8);
      }
      uint64_t v48 = qword_10032F160;
      id v12 = v51;
      if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v45 = "terminated while syncing, abandon sync";
        v46 = v48;
        os_log_type_t v47 = OS_LOG_TYPE_ERROR;
        goto LABEL_55;
      }
      goto LABEL_56;
    }
  }
  v40 = [v52 currentHistoryToken];

  if (v40)
  {
    v41 = [(StaticKeyContactsSync *)self storage];
    v42 = [v52 currentHistoryToken];
    [v41 storeContactsSyncToken:v42];
  }
  v43 = [(StaticKeyContactsSync *)self storage];
  [v43 updateLastContactSyncDate];

  if (qword_10032F158 != -1) {
    dispatch_once(&qword_10032F158, &stru_1002C7818);
  }
  id v12 = v51;
  uint64_t v44 = qword_10032F160;
  if (os_log_type_enabled((os_log_t)qword_10032F160, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v45 = "mergeChangesFromContacts: mergeChangesFromContacts done";
    v46 = v44;
    os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
LABEL_55:
    _os_log_impl((void *)&_mh_execute_header, v46, v47, v45, buf, 2u);
  }
LABEL_56:

  id v10 = v52;
LABEL_57:
}

- (StaticKeyContactsSyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StaticKeyContactsSyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (StaticKeyContactsStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  return (StaticKeyContactsStorage *)WeakRetained;
}

- (void)setStorage:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
}

- (KTSignalTermHandler)sigTerm
{
  return (KTSignalTermHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSigTerm:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sigTerm, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_storage);

  objc_destroyWeak((id *)&self->_delegate);
}

@end