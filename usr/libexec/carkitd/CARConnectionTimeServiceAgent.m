@interface CARConnectionTimeServiceAgent
+ (id)_CARConnectionServiceInterface;
- (BOOL)allowSessionDurationRecordingEvents;
- (BOOL)allowUnlimitedConnectionEvents;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)wasPairing;
- (CARConnectionTimeServiceAgent)initWithUserDefaults:(id)a3 sessionStatus:(id)a4;
- (CARSessionStatus)sessionStatus;
- (NSString)sessionUUIDString;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)connectionTimeQueue;
- (id)sortedConnectionEvents;
- (void)_addConnectionData:(id)a3 toReconnectArray:(id)a4;
- (void)clearHistoricalConnectionDataWithReply:(id)a3;
- (void)eraseConnectionData;
- (void)fetchConnectionSessions:(id)a3;
- (void)recordConnectionEvent:(id)a3 completion:(id)a4;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAllowSessionDurationRecordingEvents:(BOOL)a3;
- (void)setAllowUnlimitedConnectionEvents:(BOOL)a3;
- (void)setConnectionTimeQueue:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setSessionUUIDString:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setWasPairing:(BOOL)a3;
@end

@implementation CARConnectionTimeServiceAgent

- (CARConnectionTimeServiceAgent)initWithUserDefaults:(id)a3 sessionStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionTimeServiceAgent;
  v9 = [(CARConnectionTimeServiceAgent *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_sessionStatus, a4);
    [(CARSessionStatus *)v10->_sessionStatus addSessionObserver:v10];
    uint64_t v11 = [(NSUserDefaults *)v10->_userDefaults stringForKey:@"CARConnectionTimeSessionUUIDKey"];
    sessionUUIDString = v10->_sessionUUIDString;
    v10->_sessionUUIDString = (NSString *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.carkit.connectionTimeQueue", v13);
    connectionTimeQueue = v10->_connectionTimeQueue;
    v10->_connectionTimeQueue = (OS_dispatch_queue *)v14;

    v10->_wasPairing = 0;
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.carkit.carconnectiontime"];
  unsigned __int8 v7 = [v6 BOOLValue];

  id v8 = CarConnectionTimeLogging();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = [v5 serviceName];
      uint64_t v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
      int v14 = 138412802;
      *(void *)v15 = v5;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = v10;
      __int16 v16 = 2112;
      objc_super v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Receiving connection %@ to service %@ from %@", (uint8_t *)&v14, 0x20u);
    }
    v12 = [(id)objc_opt_class() _CARConnectionServiceInterface];
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    if (v9)
    {
      int v14 = 67109378;
      *(_DWORD *)v15 = [v5 processIdentifier];
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = @"com.apple.private.carkit.carconnectiontime";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Process %i does not have entitlement %@", (uint8_t *)&v14, 0x12u);
    }
  }
  return v7;
}

+ (id)_CARConnectionServiceInterface
{
  if (qword_1000E38D0 != -1) {
    dispatch_once(&qword_1000E38D0, &stru_1000BEE48);
  }
  v2 = (void *)qword_1000E38C8;

  return v2;
}

- (void)clearHistoricalConnectionDataWithReply:(id)a3
{
  id v4 = a3;
  connectionTimeQueue = self->_connectionTimeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E30C;
  v7[3] = &unk_1000BD668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionTimeQueue, v7);
}

- (void)fetchConnectionSessions:(id)a3
{
  id v4 = a3;
  connectionTimeQueue = self->_connectionTimeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E3F0;
  v7[3] = &unk_1000BD668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionTimeQueue, v7);
}

- (void)setAllowUnlimitedConnectionEvents:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CARConnectionTimeServiceAgent *)self allowUnlimitedConnectionEvents] != a3)
  {
    id v4 = +[CARPrototypePref allowUnlimitedConnectionEvents];
    [v4 setInternalSettingsState:v3];
  }
}

- (BOOL)allowUnlimitedConnectionEvents
{
  v2 = +[CARPrototypePref allowUnlimitedConnectionEvents];
  unsigned __int8 v3 = [v2 internalSettingsState];

  return v3;
}

- (void)setAllowSessionDurationRecordingEvents:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CARConnectionTimeServiceAgent *)self allowSessionDurationRecordingEvents] != a3)
  {
    id v4 = +[CARPrototypePref allowSessionDurationRecordingEvents];
    [v4 setInternalSettingsState:v3];
  }
}

- (BOOL)allowSessionDurationRecordingEvents
{
  int v2 = CRIsInternalInstall();
  if (v2)
  {
    BOOL v3 = +[CARPrototypePref allowSessionDurationRecordingEvents];
    unsigned __int8 v4 = [v3 internalSettingsState];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)sortedConnectionEvents
{
  int v2 = [(CARConnectionTimeServiceAgent *)self userDefaults];
  BOOL v3 = [v2 arrayForKey:@"CARConnectionTimeEventStoreKey"];

  if (v3)
  {
    unsigned __int8 v4 = [v3 sortedArrayUsingComparator:&stru_1000BEEC8];
  }
  else
  {
    unsigned __int8 v4 = objc_opt_new();
  }

  return v4;
}

- (void)recordConnectionEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionTimeQueue = self->_connectionTimeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EF28;
  block[3] = &unk_1000BED20;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(connectionTimeQueue, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  if ([(CARConnectionTimeServiceAgent *)self allowSessionDurationRecordingEvents]&& CRIsInternalInstall())
  {
    unsigned __int8 v4 = +[NSDate date];
    id v5 = +[CARConnectionEvent eventWithName:@"CARSessionDidDisconnectEvent" type:4 date:v4 payload:0];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004FA24;
    v8[3] = &unk_1000BDF48;
    v8[4] = self;
    [(CARConnectionTimeServiceAgent *)self recordConnectionEvent:v5 completion:v8];
  }
  else
  {
    id v6 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session disconnected, clearing current session identifier if any.", v7, 2u);
    }

    [(CARConnectionTimeServiceAgent *)self setSessionUUIDString:0];
  }
  self->_wasPairing = 0;
}

- (void)setSessionUUIDString:(id)a3
{
  unsigned __int8 v4 = (NSString *)a3;
  if (v4)
  {
    id v5 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting session identifier", v7, 2u);
    }

    [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"CARConnectionTimeSessionUUIDKey"];
  }
  else
  {
    [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"CARConnectionTimeSessionUUIDKey"];
  }
  sessionUUIDString = self->_sessionUUIDString;
  self->_sessionUUIDString = v4;
}

- (void)eraseConnectionData
{
  BOOL v3 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Erasing Connection Time measurement data", v4, 2u);
  }

  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"CARConnectionTimeSessionUUIDKey"];
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"CARConnectionTimeEventStoreKey"];
}

- (void)_addConnectionData:(id)a3 toReconnectArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 eventName];
    id v10 = [v6 eventDate];
    sessionUUIDString = self->_sessionUUIDString;
    *(_DWORD *)buf = 138412802;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = sessionUUIDString;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Recording CarConnectionEvent: %@ with date %@ and identifier %@", buf, 0x20u);
  }
  id v12 = [v6 dictionaryRepresentation];
  id v13 = [v12 mutableCopy];

  int v14 = [(CARConnectionTimeServiceAgent *)self sessionUUIDString];
  [v13 setObject:v14 forKeyedSubscript:CAREventIdentifier];

  [v7 insertObject:v13 atIndex:0];
  +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004FF24;
  v23[3] = &unk_1000BEEF0;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v24;
  __int16 v16 = +[NSPredicate predicateWithBlock:v23];
  objc_super v17 = [v7 filteredArrayUsingPredicate:v16];

  if ([(CARConnectionTimeServiceAgent *)self allowUnlimitedConnectionEvents]
    || (unint64_t)[v17 count] < 0x15)
  {
    id v18 = [(CARConnectionTimeServiceAgent *)self userDefaults];
    [v18 setObject:v17 forKey:@"CARConnectionTimeEventStoreKey"];
  }
  else
  {
    id v18 = [v17 mutableCopy];
    [v18 removeObjectsInRange:20, [v18 count] - 20];
    v19 = [(CARConnectionTimeServiceAgent *)self userDefaults];
    [v19 setObject:v18 forKey:@"CARConnectionTimeEventStoreKey"];

    v20 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (char *)[v17 count];
      *(_DWORD *)buf = 134217984;
      v26 = v21 - 20;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Trimmed connection events: %lu", buf, 0xCu);
    }
  }
  v22 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Wrote CARConnectionEvent array to disk", buf, 2u);
  }
}

- (NSString)sessionUUIDString
{
  return self->_sessionUUIDString;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (OS_dispatch_queue)connectionTimeQueue
{
  return self->_connectionTimeQueue;
}

- (void)setConnectionTimeQueue:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (BOOL)wasPairing
{
  return self->_wasPairing;
}

- (void)setWasPairing:(BOOL)a3
{
  self->_wasPairing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_connectionTimeQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_sessionUUIDString, 0);
}

@end