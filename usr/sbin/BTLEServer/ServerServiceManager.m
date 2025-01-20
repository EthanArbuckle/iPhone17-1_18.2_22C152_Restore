@interface ServerServiceManager
+ (id)instance;
+ (void)initialize;
- (BOOL)shouldPersist;
- (CBPeripheralManager)peripheralManager;
- (NSMapTable)serverServiceMap;
- (NSMutableArray)pendingUpdates;
- (OS_os_transaction)persistanceAssertion;
- (ServerServiceManager)init;
- (id)nameForCentral:(id)a3;
- (id)peripheralManagerStateString;
- (void)addService:(id)a3;
- (void)createServices;
- (void)destroyServices;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3;
- (void)refreshPersistanceAssertion;
- (void)removeService:(id)a3;
- (void)respondToRequest:(id)a3 withResult:(int64_t)a4;
- (void)setPendingUpdates:(id)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setPersist:(BOOL)a3;
- (void)setPersistanceAssertion:(id)a3;
- (void)setServerServiceMap:(id)a3;
- (void)setShouldPersist:(BOOL)a3;
- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5;
@end

@implementation ServerServiceManager

+ (id)instance
{
  if (qword_1000CD0E0 != -1) {
    dispatch_once(&qword_1000CD0E0, &stru_1000B1F38);
  }
  v2 = (void *)qword_1000CD0D8;

  return v2;
}

- (void)setPersist:(BOOL)a3
{
  [(ServerServiceManager *)self setShouldPersist:a3];

  [(ServerServiceManager *)self refreshPersistanceAssertion];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)qword_1000CD0D0;
    qword_1000CD0D0 = (uint64_t)&off_1000B7BE0;
  }
}

- (ServerServiceManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)ServerServiceManager;
  v2 = [(ServerServiceManager *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CBPeripheralManager);
    v14[0] = CBCentralManagerOptionReceiveSystemEvents;
    v14[1] = CBManagerNeedsRestrictedStateOperation;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanTrue;
    v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v5 = (CBPeripheralManager *)[v3 initWithDelegate:v2 queue:&_dispatch_main_q options:v4];
    peripheralManager = v2->_peripheralManager;
    v2->_peripheralManager = v5;

    uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
    serverServiceMap = v2->_serverServiceMap;
    v2->_serverServiceMap = (NSMapTable *)v7;

    v2->_shouldPersist = 0;
    persistanceAssertion = v2->_persistanceAssertion;
    v2->_persistanceAssertion = 0;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingUpdates = v2->_pendingUpdates;
    v2->_pendingUpdates = v10;
  }
  return v2;
}

- (void)createServices
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)qword_1000CD0D0;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = NSClassFromString(*(NSString **)(*((void *)&v12 + 1) + 8 * (void)v7));
        if (v8)
        {
          id v9 = objc_alloc_init(v8);
          v10 = [(ServerServiceManager *)self serverServiceMap];
          v11 = [v9 service];
          [v10 setObject:v9 forKey:v11];

          [v9 start];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)destroyServices
{
  id v3 = [(ServerServiceManager *)self serverServiceMap];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_1000B1F78];

  id v4 = [(ServerServiceManager *)self serverServiceMap];
  [v4 removeAllObjects];

  id v5 = [(ServerServiceManager *)self pendingUpdates];
  [v5 removeAllObjects];
}

- (void)refreshPersistanceAssertion
{
  id v3 = [(ServerServiceManager *)self peripheralManager];
  if ([v3 state] == (id)4)
  {

LABEL_6:
    [(ServerServiceManager *)self setPersistanceAssertion:0];
    return;
  }
  unsigned int v4 = [(ServerServiceManager *)self shouldPersist];

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [(ServerServiceManager *)self persistanceAssertion];

  if (!v5)
  {
    id v7 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
    [v7 UTF8String];
    uint64_t v6 = (void *)os_transaction_create();
    [(ServerServiceManager *)self setPersistanceAssertion:v6];
  }
}

- (void)addService:(id)a3
{
  id v4 = a3;
  id v5 = [(ServerServiceManager *)self peripheralManager];
  [v5 addService:v4];
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  id v5 = [(ServerServiceManager *)self peripheralManager];
  [v5 removeService:v4];
}

- (void)respondToRequest:(id)a3 withResult:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100072A54(v7, v6, a4);
  }
  v8 = [(ServerServiceManager *)self peripheralManager];
  [v8 respondToRequest:v6 withResult:a4];
}

- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100072BE4(v11, v9, (uint64_t)v8);
  }
  long long v12 = [(ServerServiceManager *)self pendingUpdates];
  if ([v12 count])
  {
  }
  else
  {
    long long v13 = [(ServerServiceManager *)self peripheralManager];
    unsigned __int8 v14 = [v13 updateValue:v8 forCharacteristic:v9 onSubscribedCentrals:v10];

    if (v14) {
      goto LABEL_8;
    }
  }
  long long v15 = [(ServerServiceManager *)self pendingUpdates];
  v16 = +[ATTUpdate updateWithValue:v8 characteristic:v9 centrals:v10];
  [v15 addObject:v16];

  v17 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100072B48(v17, self);
  }
LABEL_8:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(ServerServiceManager *)self peripheralManagerStateString];
    *(_DWORD *)buf = 138412290;
    long long v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PeripheralManager state is now %@", buf, 0xCu);
  }
  [(ServerServiceManager *)self refreshPersistanceAssertion];
  id v8 = [(ServerServiceManager *)self serverServiceMap];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000474CC;
  v10[3] = &unk_1000B1FA0;
  id v9 = v4;
  id v11 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  if ([v9 state] == (id)5) {
    [(ServerServiceManager *)self createServices];
  }
  else {
    [(ServerServiceManager *)self destroyServices];
  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ServerServiceManager *)self serverServiceMap];
  id v11 = [v10 objectForKey:v8];

  if (v11) {
    [v11 peripheralManager:v12 didAddService:v8 error:v9];
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ServerServiceManager *)self serverServiceMap];
  id v9 = [v7 characteristic];
  id v10 = [v9 service];
  id v11 = [v8 objectForKey:v10];

  if (v11)
  {
    id v12 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_100072CA4(v12, v7, self);
    }
    [v11 peripheralManager:v6 didReceiveReadRequest:v7];
  }
  else
  {
    long long v13 = [(ServerServiceManager *)self peripheralManager];
    [v13 respondToRequest:v7 withResult:10];
  }
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 firstObject];
  id v9 = [(ServerServiceManager *)self serverServiceMap];
  id v10 = [v8 characteristic];
  id v11 = [v10 service];
  id v12 = [v9 objectForKey:v11];

  if (v12)
  {
    v26 = v12;
    id v27 = v7;
    id v28 = v6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      v29 = self;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
          {
            v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v17);
            v20 = v18;
            v30 = [v19 central];
            v21 = [(ServerServiceManager *)self nameForCentral:v30];
            v22 = [v19 characteristic];
            v23 = [v22 UUID];
            v24 = [v19 value];
            *(_DWORD *)buf = 138412802;
            v36 = v21;
            __int16 v37 = 2112;
            v38 = v23;
            __int16 v39 = 2112;
            v40 = v24;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Central \"%@\" sent a write request on characteristic \"%@\": %@", buf, 0x20u);

            self = v29;
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v15);
    }

    id v12 = v26;
    id v6 = v28;
    [v26 peripheralManager:v28 didReceiveWriteRequests:v13];
    id v7 = v27;
  }
  else
  {
    v25 = [(ServerServiceManager *)self peripheralManager];
    [v25 respondToRequest:v8 withResult:10];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ServerServiceManager *)self serverServiceMap];
  id v12 = [v10 service];
  id v13 = [v11 objectForKey:v12];

  if (v13)
  {
    id v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [(ServerServiceManager *)self nameForCentral:v9];
      v17 = [v10 UUID];
      int v18 = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Central \"%@\" is now subscribed to characteristic \"%@\"", (uint8_t *)&v18, 0x16u);
    }
    [v13 peripheralManager:v8 central:v9 didSubscribeToCharacteristic:v10];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ServerServiceManager *)self serverServiceMap];
  id v12 = [v10 service];
  id v13 = [v11 objectForKey:v12];

  if (v13)
  {
    id v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [(ServerServiceManager *)self nameForCentral:v9];
      v17 = [v10 UUID];
      int v18 = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Central \"%@\" is now unsubscribed from characteristic \"%@\"", (uint8_t *)&v18, 0x16u);
    }
    [v13 peripheralManager:v8 central:v9 didUnsubscribeFromCharacteristic:v10];
  }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100072DA8(v5, self);
  }
  while (1)
  {
    id v6 = [(ServerServiceManager *)self pendingUpdates];
    id v7 = [v6 count];

    if (!v7) {
      break;
    }
    id v8 = [(ServerServiceManager *)self pendingUpdates];
    id v9 = [v8 firstObject];

    id v10 = [(ServerServiceManager *)self peripheralManager];
    id v11 = [v9 value];
    id v12 = [v9 characteristic];
    id v13 = [v9 centrals];
    unsigned __int8 v14 = [v10 updateValue:v11 forCharacteristic:v12 onSubscribedCentrals:v13];

    if ((v14 & 1) == 0)
    {

      break;
    }
    id v15 = [(ServerServiceManager *)self pendingUpdates];
    [v15 removeObjectAtIndex:0];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ServerServiceManager *)self serverServiceMap];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100047E68;
  v13[3] = &unk_1000B1FC8;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
}

- (id)nameForCentral:(id)a3
{
  id v3 = [a3 identifier];
  id v4 = +[ConnectionManager instance];
  id v5 = [v4 peripheralForIdentifier:v3];

  if (v5) {
    [v5 name];
  }
  else {
  id v6 = [v3 UUIDString];
  }

  return v6;
}

- (id)peripheralManagerStateString
{
  v2 = [(ServerServiceManager *)self peripheralManager];
  id v3 = (char *)[v2 state];

  if ((unint64_t)(v3 - 1) > 9) {
    return @"unknown";
  }
  else {
    return *(&off_1000B1FE8 + (void)(v3 - 1));
  }
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
}

- (NSMapTable)serverServiceMap
{
  return self->_serverServiceMap;
}

- (void)setServerServiceMap:(id)a3
{
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
}

- (NSMutableArray)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_persistanceAssertion, 0);
  objc_storeStrong((id *)&self->_serverServiceMap, 0);

  objc_storeStrong((id *)&self->_peripheralManager, 0);
}

@end