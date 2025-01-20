@interface OTCuttlefishAccountStateHolder
- (BOOL)_onqueuePersistAccountChanges:(id)a3 error:(id *)a4;
- (BOOL)persistAccountChanges:(id)a3 error:(id *)a4;
- (BOOL)persistLastHealthCheck:(id)a3 error:(id *)a4;
- (BOOL)persistNewEgoPeerID:(id)a3 error:(id *)a4;
- (BOOL)persistNewTrustState:(int)a3 error:(id *)a4;
- (BOOL)persistOctagonJoinAttempt:(int)a3 error:(id *)a4;
- (BOOL)persistSendingMetricsPermitted:(int)a3 error:(id *)a4;
- (NSMutableSet)monitors;
- (NSString)containerName;
- (NSString)contextID;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)queue;
- (OTCuttlefishAccountStateHolder)initWithQueue:(id)a3 container:(id)a4 context:(id)a5 personaAdapter:(id)a6 activeAccount:(id)a7;
- (OTPersonaAdapter)personaAdapter;
- (TPSpecificUser)activeAccount;
- (id)_onqueueLoadOrCreateAccountMetadata:(id *)a3;
- (id)getEgoPeerID:(id *)a3;
- (id)lastHealthCheckupDate:(id *)a3;
- (id)loadOrCreateAccountMetadata:(id *)a3;
- (int)fetchSendingMetricsPermitted:(id *)a3;
- (void)asyncNotifyAccountStateChanges:(id)a3 from:(id)a4;
- (void)registerNotification:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setMonitors:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation OTCuttlefishAccountStateHolder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setMonitors:(id)a3
{
}

- (NSMutableSet)monitors
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActiveAccount:(id)a3
{
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContextID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNotifyQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)asyncNotifyAccountStateChanges:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = [(OTCuttlefishAccountStateHolder *)self notifyQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D5DE4;
  v11[3] = &unk_1003077C8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)_onqueuePersistAccountChanges:(id)a3 error:(id *)a4
{
  id v6 = (void (**)(id, id))a3;
  id v7 = [(OTCuttlefishAccountStateHolder *)self queue];
  dispatch_assert_queue_V2(v7);

  id v23 = 0;
  v8 = [(OTCuttlefishAccountStateHolder *)self _onqueueLoadOrCreateAccountMetadata:&v23];
  id v9 = v23;
  if (!v8)
  {
    v11 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v20 = a4;
  id v10 = [v8 copy];
  v21 = v6;
  v11 = v6[2](v6, v10);

  id v12 = [(OTCuttlefishAccountStateHolder *)self containerName];
  id v13 = [(OTCuttlefishAccountStateHolder *)self contextID];
  id v14 = [(OTCuttlefishAccountStateHolder *)self personaAdapter];
  v15 = [(OTCuttlefishAccountStateHolder *)self activeAccount];
  v16 = [v15 personaUniqueString];
  id v22 = v9;
  unsigned __int8 v17 = [v11 saveToKeychainForContainer:v12 contextID:v13 personaAdapter:v14 personaUniqueString:v16 error:&v22];
  id v19 = v22;

  if ((v17 & 1) == 0)
  {

    v11 = 0;
  }
  id v9 = v19;
  a4 = v20;
  id v6 = v21;
  if (v20)
  {
LABEL_7:
    if (v9) {
      *a4 = v9;
    }
  }
LABEL_9:
  if (v11) {
    [(OTCuttlefishAccountStateHolder *)self asyncNotifyAccountStateChanges:v11 from:v8];
  }

  return v11 != 0;
}

- (BOOL)persistSendingMetricsPermitted:(int)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D611C;
  v5[3] = &unk_100307138;
  int v6 = a3;
  return [(OTCuttlefishAccountStateHolder *)self persistAccountChanges:v5 error:a4];
}

- (int)fetchSendingMetricsPermitted:(id *)a3
{
  id v10 = 0;
  v4 = [(OTCuttlefishAccountStateHolder *)self loadOrCreateAccountMetadata:&v10];
  id v5 = v10;
  int v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  if (v7)
  {
    int v8 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    int v8 = [v4 sendingMetricsPermitted];
  }

  return v8;
}

- (BOOL)persistOctagonJoinAttempt:(int)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D6260;
  v5[3] = &unk_100307138;
  int v6 = a3;
  return [(OTCuttlefishAccountStateHolder *)self persistAccountChanges:v5 error:a4];
}

- (BOOL)persistLastHealthCheck:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D6350;
  v8[3] = &unk_100307118;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = [(OTCuttlefishAccountStateHolder *)self persistAccountChanges:v8 error:a4];

  return (char)a4;
}

- (BOOL)persistAccountChanges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1001D660C;
  v43 = sub_1001D661C;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1001D660C;
  v37 = sub_1001D661C;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1001D660C;
  v31 = sub_1001D661C;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  BOOL v7 = [(OTCuttlefishAccountStateHolder *)self queue];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1001D6624;
  v16 = &unk_100307160;
  id v19 = &v27;
  v20 = &v39;
  unsigned __int8 v17 = self;
  v21 = &v33;
  id v8 = v6;
  id v18 = v8;
  id v22 = &v23;
  dispatch_sync(v7, &v13);

  if (a4)
  {
    id v9 = (void *)v40[5];
    if (v9) {
      *a4 = v9;
    }
  }
  uint64_t v10 = v34[5];
  if (v10) {
    -[OTCuttlefishAccountStateHolder asyncNotifyAccountStateChanges:from:](self, "asyncNotifyAccountStateChanges:from:", v10, v28[5], v13, v14, v15, v16, v17);
  }
  char v11 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v11;
}

- (BOOL)persistNewTrustState:(int)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D6844;
  v5[3] = &unk_100307138;
  int v6 = a3;
  return [(OTCuttlefishAccountStateHolder *)self persistAccountChanges:v5 error:a4];
}

- (BOOL)persistNewEgoPeerID:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D6934;
  v8[3] = &unk_100307118;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = [(OTCuttlefishAccountStateHolder *)self persistAccountChanges:v8 error:a4];

  return (char)a4;
}

- (id)lastHealthCheckupDate:(id *)a3
{
  id v10 = 0;
  v4 = [(OTCuttlefishAccountStateHolder *)self loadOrCreateAccountMetadata:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  if (v7)
  {
    id v8 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    id v8 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 lastHealthCheckup] / 1000.0);
  }

  return v8;
}

- (id)getEgoPeerID:(id *)a3
{
  id v12 = 0;
  v4 = [(OTCuttlefishAccountStateHolder *)self loadOrCreateAccountMetadata:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  if (v7)
  {
    if (a3)
    {
      id v8 = v5;
LABEL_12:
      id v10 = 0;
      *a3 = v8;
      goto LABEL_14;
    }
  }
  else
  {
    id v9 = [v4 peerID];

    if (v9)
    {
      id v10 = [v4 peerID];
      goto LABEL_14;
    }
    if (a3)
    {
      id v8 = +[NSError errorWithDomain:@"otcuttlefish" code:0 description:@"No existing ego peer ID"];
      goto LABEL_12;
    }
  }
  id v10 = 0;
LABEL_14:

  return v10;
}

- (id)_onqueueLoadOrCreateAccountMetadata:(id *)a3
{
  id v5 = [(OTCuttlefishAccountStateHolder *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OTCuttlefishAccountStateHolder *)self containerName];
  BOOL v7 = [(OTCuttlefishAccountStateHolder *)self contextID];
  id v8 = [(OTCuttlefishAccountStateHolder *)self personaAdapter];
  id v9 = [(OTCuttlefishAccountStateHolder *)self activeAccount];
  id v10 = [v9 personaUniqueString];
  id v18 = 0;
  char v11 = +[OTAccountMetadataClassC loadFromKeychainForContainer:v6 contextID:v7 personaAdapter:v8 personaUniqueString:v10 error:&v18];
  id v12 = v18;

  if (v11 && !v12) {
    goto LABEL_6;
  }
  id v13 = [v12 domain];
  if ([v13 isEqualToString:NSOSStatusErrorDomain])
  {
    id v14 = [v12 code];

    if (v14 == (id)-25300)
    {
      v15 = objc_alloc_init(OTAccountMetadataClassC);

      [(OTAccountMetadataClassC *)v15 setAttemptedJoin:1];
      char v11 = v15;
LABEL_6:
      id v16 = v11;
      char v11 = v16;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v16 = 0;
  if (a3) {
    *a3 = v12;
  }
LABEL_10:

  return v16;
}

- (id)loadOrCreateAccountMetadata:(id *)a3
{
  uint64_t v16 = 0;
  unsigned __int8 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_1001D660C;
  v20 = sub_1001D661C;
  id v21 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1001D660C;
  id v14 = sub_1001D661C;
  id v15 = 0;
  id v5 = [(OTCuttlefishAccountStateHolder *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D6E78;
  block[3] = &unk_1003070F0;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v5, block);

  if (a3)
  {
    id v6 = (void *)v11[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (void)registerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishAccountStateHolder *)self monitors];
  [v5 addObject:v4];
}

- (OTCuttlefishAccountStateHolder)initWithQueue:(id)a3 container:(id)a4 context:(id)a5 personaAdapter:(id)a6 activeAccount:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)OTCuttlefishAccountStateHolder;
  unsigned __int8 v17 = [(OTCuttlefishAccountStateHolder *)&v25 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    dispatch_queue_t v19 = dispatch_queue_create("OTCuttlefishAccountStateHolderNotifier", 0);
    notifyQueue = v18->_notifyQueue;
    v18->_notifyQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_containerName, a4);
    objc_storeStrong((id *)&v18->_contextID, a5);
    uint64_t v21 = +[NSMutableSet set];
    monitors = v18->_monitors;
    v18->_monitors = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v18->_personaAdapter, a6);
    objc_storeStrong((id *)&v18->_activeAccount, a7);
  }

  return v18;
}

@end