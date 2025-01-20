@interface EPNanoRegistryStatusCodeElection
+ (Class)resourceClass;
+ (id)newService:(id)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3 delegate:(id)a4;
- (EPNanoRegistryStatusCodeElection)initWithQueue:(id)a3 delegate:(id)a4;
- (EPNanoRegistryStatusCodeElectionDelegate)delegate;
- (NSString)statusCodeString;
- (id)newStatusCodeVote:(unint64_t)a3;
- (id)statusCodeStringForStatusCode:(unint64_t)a3;
- (unint64_t)holdElectionWithVotes:(id)a3;
- (unint64_t)statusCode;
- (void)resourceWasRemoved;
- (void)setDelegate:(id)a3;
- (void)setStatusCode:(unint64_t)a3;
- (void)updateStatusCode;
@end

@implementation EPNanoRegistryStatusCodeElection

+ (id)newService:(id)a3
{
  id v4 = a3;
  v5 = [v4 serviceFromProtocol:&OBJC_PROTOCOL___EPNanoRegistryStatusCodeElectionDelegate];
  v6 = [v4 queue];

  v7 = [a1 sharedInstanceWithQueue:v6 delegate:v5];

  return v7;
}

+ (id)sharedInstance
{
  return [a1 sharedInstanceWithQueue:0 delegate:0];
}

+ (id)sharedInstanceWithQueue:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092950;
  block[3] = &unk_100168520;
  id v14 = a4;
  id v15 = a1;
  id v13 = v6;
  uint64_t v7 = qword_1001A1258;
  id v8 = v14;
  id v9 = v6;
  if (v7 != -1) {
    dispatch_once(&qword_1001A1258, block);
  }
  id v10 = (id)qword_1001A1250;

  return v10;
}

- (EPNanoRegistryStatusCodeElection)initWithQueue:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(EPResourceManager *)self initWithQueue:a3];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    if (qword_1001A1260 != -1) {
      dispatch_once(&qword_1001A1260, &stru_100168540);
    }
  }

  return v8;
}

- (void)updateStatusCode
{
  +[NSMutableArray array];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100092CAC;
  v4[3] = &unk_1001683F8;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v4];
  [(EPNanoRegistryStatusCodeElection *)self setStatusCode:[(EPNanoRegistryStatusCodeElection *)self holdElectionWithVotes:v3]];
}

- (unint64_t)holdElectionWithVotes:(id)a3
{
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v22;
  uint64_t v8 = -1;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(v4);
      }
      id v10 = [(id)qword_1001A1270 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      id v11 = [v10 integerValue];

      if ((uint64_t)v11 > v8) {
        uint64_t v8 = (uint64_t)v11;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  }
  while (v6);
  if (v8 < 0)
  {
LABEL_12:
    id v13 = 0;
  }
  else
  {
    v12 = [(id)qword_1001A1268 objectAtIndexedSubscript:v8];
    id v13 = [v12 integerValue];
  }
  id v14 = [v4 count];
  if (v13 == (id)3 && v14 == (id)1) {
    id v13 = 0;
  }
  v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    v18 = nr_daemon_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(EPNanoRegistryStatusCodeElection *)self statusCodeStringForStatusCode:v13];
      *(_DWORD *)buf = 134218498;
      id v26 = v13;
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2114;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPNanoRegistryStatusCodeElection: Held NRPairedDeviceRegistryStatusCode election. statusCode: [%ld]%@ votes: %{public}@", buf, 0x20u);
    }
  }

  return (unint64_t)v13;
}

- (void)setStatusCode:(unint64_t)a3
{
  if (self->_statusCode != a3)
  {
    id v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(EPNanoRegistryStatusCodeElection *)self statusCodeStringForStatusCode:a3];
        int v10 = 134218242;
        unint64_t v11 = a3;
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPNanoRegistryStatusCodeElection: Setting statusCode to [%ld]%@", (uint8_t *)&v10, 0x16u);
      }
    }
    self->_statusCode = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained statusCodeManager:self electionOutcomeChanged:self->_statusCode];
  }
}

- (id)statusCodeStringForStatusCode:(unint64_t)a3
{
  id v3 = (void *)qword_1001A1278;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

- (NSString)statusCodeString
{
  unint64_t v3 = [(EPNanoRegistryStatusCodeElection *)self statusCode];

  return (NSString *)[(EPNanoRegistryStatusCodeElection *)self statusCodeStringForStatusCode:v3];
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (id)newStatusCodeVote:(unint64_t)a3
{
  id v5 = [(EPResourceManager *)self newResourceWithDelegate:0];
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [v5 setStatusCodeVoteNumber:v6];

  [(EPNanoRegistryStatusCodeElection *)self updateStatusCode];
  return v5;
}

- (void)resourceWasRemoved
{
  unint64_t v3 = [(EPResourceManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EPNanoRegistryStatusCodeElection: resourceWasRemoved", v7, 2u);
    }
  }
  [(EPNanoRegistryStatusCodeElection *)self updateStatusCode];
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (EPNanoRegistryStatusCodeElectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPNanoRegistryStatusCodeElectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end