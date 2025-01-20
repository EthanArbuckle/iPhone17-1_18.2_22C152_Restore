@interface NRTermsAcknowledgementRegistryService
+ (Class)proxyClass;
+ (Class)xpcListenerClass;
+ (id)sharedInstance;
- (BOOL)_checkForLocalAcknowledgementForEvent:(id)a3 forDeviceID:(id)a4;
- (NRTermsAcknowledgementRegistryService)delegate;
- (NRTermsAcknowledgementRegistryService)init;
- (NRTermsEventCollectionDB)termsDB;
- (NRXPCServer)server;
- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5;
- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setServer:(id)a3;
- (void)setTermsDB:(id)a3;
@end

@implementation NRTermsAcknowledgementRegistryService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013C90;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1080 != -1) {
    dispatch_once(&qword_1001A1080, block);
  }
  v2 = (void *)qword_1001A1088;

  return v2;
}

- (NRTermsAcknowledgementRegistryService)init
{
  v14.receiver = self;
  v14.super_class = (Class)NRTermsAcknowledgementRegistryService;
  v2 = [(NRTermsAcknowledgementRegistryService *)&v14 init];
  if (v2)
  {
    v3 = [NRXPCServer alloc];
    id v4 = [(id)objc_opt_class() proxyClass];
    v5 = -[NRXPCServer initWithProxyClass:xpcListenerClass:serverDelegate:xpcTarget:services:](v3, "initWithProxyClass:xpcListenerClass:serverDelegate:xpcTarget:services:", v4, [(id)objc_opt_class() xpcListenerClass], v2, v2, v2);
    server = v2->_server;
    v2->_server = v5;

    v7 = [objc_msgSend((id)objc_opt_class(), "proxyClass") machServiceName];
    v8 = nr_framework_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = nr_framework_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NRTermsAcknowledgementRegistryService: Listening to %@", buf, 0xCu);
      }
    }
    uint64_t v11 = +[NRTermsEventCollectionDB sharedInstance];
    termsDB = v2->_termsDB;
    v2->_termsDB = (NRTermsEventCollectionDB *)v11;

    [(NRTermsEventCollectionDB *)v2->_termsDB loadEvents];
  }
  return v2;
}

- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v56 = a4;
  id v57 = a5;
  v58 = v8;
  if (![v8 eventType]
    || ([v8 termsText],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 length],
        v9,
        (unint64_t)v10 <= 9))
  {
    uint64_t v11 = +[NRTermsAcknowledgementRegistry errorWithEnum:3];
LABEL_7:
    v18 = (void *)v11;
    v19 = v57;
    (*((void (**)(id, uint64_t))v57 + 2))(v57, v11);

    goto LABEL_8;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v8 eventDate];
  if (v13 - v14 > 60.0
    || (+[NSDate timeIntervalSinceReferenceDate],
        double v16 = v15,
        [v8 eventDate],
        v16 - v17 < -60.0))
  {
    uint64_t v11 = +[NRTermsAcknowledgementRegistry errorWithEnum:7];
    goto LABEL_7;
  }
  [(NRTermsEventCollectionDB *)self->_termsDB addEvent:v8];
  [(NRTermsEventCollectionDB *)self->_termsDB saveEvents];
  v55 = [(NRTermsAcknowledgementRegistryService *)self delegate];
  v20 = +[NRPairedDeviceRegistry sharedInstance];
  v54 = [v20 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_100165BD8];

  v21 = +[NRPairedDeviceRegistry sharedInstance];
  v53 = [v21 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_100165BF8];

  v52 = [v55 termsAcknowledgementServiceGetCloudObject];
  if (v56)
  {
    v22 = +[NRPairedDeviceRegistry sharedInstance];
    v23 = [v22 getActivePairedDevice];

    v24 = [v23 valueForProperty:_NRDevicePropertyBluetoothIdentifier];
    v25 = [v55 termsAcknowledgementServiceGetRemoteObject];
    if ([v25 isIDSConnected])
    {
      [v25 addTermsEvent:v8 toIDSBTUUID:v24 withResponseBlock:v57];
    }
    else
    {
      v28 = +[NSSet setWithObject:v56];
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100014984;
      v77[3] = &unk_100165C20;
      id v78 = v57;
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_100014A70;
      v75[3] = &unk_100165C48;
      id v76 = v78;
      [v52 sendTermsEventToDestinations:v28 termsEvent:v8 withSentBlock:v77 withResponseBlock:v75];
    }
LABEL_17:

    goto LABEL_18;
  }
  v26 = nr_framework_log();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

  if (v27)
  {
    v23 = nr_framework_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Active device is nil, skipping terms push to active device", buf, 2u);
    }
    goto LABEL_17;
  }
LABEL_18:
  v51 = [v55 termsAcknowledgementServiceForAltAccount];
  if ([v54 count])
  {
    id v29 = objc_alloc_init((Class)NSMutableSet);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v30 = v54;
    id v31 = [v30 countByEnumeratingWithState:&v71 objects:v82 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v72;
      uint64_t v33 = _NRDevicePropertyMigrationIDSCloudIdentifier;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v72 != v32) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v36 = [v35 objectForKeyedSubscript:v33];
          if (v36)
          {
            [v29 addObject:v36];
          }
          else
          {
            v37 = nr_framework_log();
            BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);

            if (v38)
            {
              v39 = nr_framework_log();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v81 = v35;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NRDevice: %@ has no cloudIDs", buf, 0xCu);
              }
            }
          }
        }
        id v31 = [v30 countByEnumeratingWithState:&v71 objects:v82 count:16];
      }
      while (v31);
    }

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100014A80;
    v69[3] = &unk_100165C20;
    id v70 = v57;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100014B6C;
    v67[3] = &unk_100165C48;
    id v68 = v70;
    [v51 sendTermsEventToDestinations:v29 termsEvent:v58 withSentBlock:v69 withResponseBlock:v67];
  }
  if ([v53 count])
  {
    id v40 = objc_alloc_init((Class)NSMutableSet);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v41 = v53;
    id v42 = [v41 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v64;
      uint64_t v44 = _NRDevicePropertyMigrationIDSCloudIdentifier;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v64 != v43) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          v47 = [v46 objectForKeyedSubscript:v44];
          if (v47)
          {
            [v40 addObject:v47];
          }
          else
          {
            v48 = nr_framework_log();
            BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);

            if (v49)
            {
              v50 = nr_framework_log();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v81 = v46;
                _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "NRDevice: %@ has no cloudIDs", buf, 0xCu);
              }
            }
          }
        }
        id v42 = [v41 countByEnumeratingWithState:&v63 objects:v79 count:16];
      }
      while (v42);
    }

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100014B7C;
    v61[3] = &unk_100165C20;
    id v62 = v57;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100014C68;
    v59[3] = &unk_100165C48;
    id v60 = v62;
    [v52 sendTermsEventToDestinations:v40 termsEvent:v58 withSentBlock:v61 withResponseBlock:v59];
  }
  v19 = v57;
LABEL_8:
}

- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = (void *)MGCopyAnswer();
  double v12 = (void *)MGCopyAnswer();
  double v13 = [v8 displayDeviceName];
  if ([v11 isEqual:v13])
  {
    double v14 = [v8 displayDeviceSerialNumber];
    unsigned __int8 v15 = [v12 isEqual:v14];

    if (v15)
    {
      double v16 = [(NRTermsAcknowledgementRegistryService *)self delegate];
      if (v16)
      {
        unsigned int v17 = [(NRTermsAcknowledgementRegistryService *)self _checkForLocalAcknowledgementForEvent:v8 forDeviceID:v9];
        v18 = nr_framework_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v17)
        {
          if (v19)
          {
            v20 = nr_framework_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v28 = "-[NRTermsAcknowledgementRegistryService checkForAcknowledgement:forDeviceID:withCompletion:]";
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:Terms already accepted.", buf, 0xCu);
            }
          }
          v10[2](v10, 1, 0);
        }
        else
        {
          if (v19)
          {
            v22 = nr_framework_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v28 = "-[NRTermsAcknowledgementRegistryService checkForAcknowledgement:forDeviceID:withCompletion:]";
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:Terms not already accepted. Checking active watch.", buf, 0xCu);
            }
          }
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100014FB0;
          v23[3] = &unk_100165C70;
          id v24 = v16;
          id v25 = v8;
          v26 = v10;
          [v24 termsAcknowledgementServiceGetDeviceMirrorFromDeviceID:v9 block:v23];
        }
      }
      else if (v10)
      {
        v21 = +[NRTermsAcknowledgementRegistry errorWithEnum:4];
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v21);
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (v10)
  {
    double v16 = +[NRTermsAcknowledgementRegistry errorWithEnum:6];
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v16);
LABEL_13:
  }
}

- (BOOL)_checkForLocalAcknowledgementForEvent:(id)a3 forDeviceID:(id)a4
{
  id v5 = a3;
  v6 = [v5 termsDigest];

  if (!v6)
  {
    v7 = [v5 termsText];
    id v8 = +[NRTermsEvent digestFromData:v7];
    [v5 setTermsDigest:v8];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [(NRTermsEventCollectionDB *)self->_termsDB reverseObjectEnumerator];
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v32;
    *(void *)&long long v11 = 138412546;
    long long v30 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v9);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v16 = [v5 termsDigest:v30];
        unsigned int v17 = [v15 termsDigest];
        unsigned int v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          BOOL v19 = [v5 termsText];
          v20 = [v15 termsText];
          unsigned int v21 = [v19 isEqual:v20];

          if (v21)
          {
            unsigned int v22 = [v15 eventType];
            BOOL v23 = v22 != 1;
            if (v22 == 1 || [v15 eventType] == 4) {
              goto LABEL_20;
            }
          }
        }
        else
        {
          id v24 = nr_framework_log();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

          if (v25)
          {
            v26 = nr_framework_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v27 = [v5 termsDigest];
              v28 = [v15 termsDigest];
              *(_DWORD *)buf = v30;
              v36 = v27;
              __int16 v37 = 2112;
              BOOL v38 = v28;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "digests do not match: %@ - %@", buf, 0x16u);
            }
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v12);
  }
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (void)resume
{
}

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

+ (Class)xpcListenerClass
{
  return (Class)objc_opt_class();
}

- (NRTermsAcknowledgementRegistryService)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRTermsAcknowledgementRegistryService *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NRTermsEventCollectionDB)termsDB
{
  return self->_termsDB;
}

- (void)setTermsDB:(id)a3
{
}

- (NRXPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_termsDB, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end