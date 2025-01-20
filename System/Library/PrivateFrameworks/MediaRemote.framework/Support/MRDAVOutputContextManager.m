@interface MRDAVOutputContextManager
+ (id)sharedManager;
- (NSArray)outputContexts;
- (NSArray)populatedOutputContexts;
- (NSHashTable)dataSources;
- (NSMutableDictionary)activeOutputContexts;
- (NSMutableDictionary)inactiveOutputContexts;
- (NSMutableDictionary)reservedOutputContexts;
- (OS_dispatch_queue)serialQueue;
- (id)_init;
- (id)_normalizeOutputDeviceUIDs:(id)a3 fromDeviceInfo:(id)a4;
- (id)debugDescription;
- (id)outputContextForOutputDevice:(id)a3;
- (id)outputContextForOutputDeviceUID:(id)a3;
- (id)outputContextForOutputDeviceUIDs:(id)a3 strict:(BOOL)a4;
- (id)outputContextForOutputDevices:(id)a3 strict:(BOOL)a4;
- (void)_handleMediaServerDeath;
- (void)_notifyLocalDeviceDidChangeOutputContext;
- (void)addDataSource:(id)a3;
- (void)outputDevicesDidChangeNotification:(id)a3;
- (void)processOutputContext:(id)a3;
- (void)registerCommunicationChannelForOutputContext:(id)a3;
- (void)registerCommunicationsChannels;
- (void)registerForOutputContextNotifications:(id)a3;
- (void)registerOutputContext:(id)a3;
- (void)reloadOutputContexts;
- (void)removeDataSource:(id)a3;
- (void)setActiveOutputContexts:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setInactiveOutputContexts:(id)a3;
- (void)setReservedOutputContexts:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation MRDAVOutputContextManager

+ (id)sharedManager
{
  if (qword_10047DF90 != -1) {
    dispatch_once(&qword_10047DF90, &stru_100418018);
  }
  v2 = (void *)qword_10047DF88;

  return v2;
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)MRDAVOutputContextManager;
  v2 = [(MRDAVOutputContextManager *)&v23 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeOutputContexts = v2->_activeOutputContexts;
    v2->_activeOutputContexts = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inactiveOutputContexts = v2->_inactiveOutputContexts;
    v2->_inactiveOutputContexts = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    reservedOutputContexts = v2->_reservedOutputContexts;
    v2->_reservedOutputContexts = v7;

    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    dataSources = v2->_dataSources;
    v2->_dataSources = (NSHashTable *)v14;

    if ((MRProcessIsMediaServerDaemon() & 1) == 0)
    {
      v16 = off_100475F70();

      if (v16)
      {
        v17 = +[AVSystemController sharedAVSystemController];
        v18 = off_100475F70();
        v24 = v18;
        v19 = +[NSArray arrayWithObjects:&v24 count:1];
        [v17 setAttribute:v19 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

        v20 = +[NSNotificationCenter defaultCenter];
        v21 = off_100475F70();
        [v20 addObserver:v2 selector:"_handleMediaServerDeath" name:v21 object:0];
      }
    }
    [(MRDAVOutputContextManager *)v2 reloadOutputContexts];
  }
  return v2;
}

- (id)debugDescription
{
  id v15 = objc_alloc((Class)NSString);
  uint64_t v14 = [(MRDAVOutputContextManager *)self description];
  v16 = +[MRAVOutputContext sharedAudioPresentationContext];
  v3 = [v16 debugDescription];
  v4 = [(MRDAVOutputContextManager *)self activeOutputContexts];
  v5 = [v4 allValues];
  v6 = objc_msgSend(v5, "mr_map:", &stru_100418058);
  v7 = [v6 componentsJoinedByString:@"\n"];
  v8 = [(MRDAVOutputContextManager *)self inactiveOutputContexts];
  v9 = [v8 debugDescription];
  v10 = [(MRDAVOutputContextManager *)self reservedOutputContexts];
  v11 = [v10 debugDescription];
  id v12 = [v15 initWithFormat:@"%@\nlocal=%@\nactive=%@\ninactive=%@\nreserved=%@", v14, v3, v7, v9, v11];

  return v12;
}

- (void)addDataSource:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C454;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)removeDataSource:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C4F8;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (NSArray)outputContexts
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10005C5F4;
  v10 = sub_10005C604;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C60C;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)populatedOutputContexts
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10005C5F4;
  v10 = sub_10005C604;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C7C0;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)registerCommunicationsChannels
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C8F4;
  v8[3] = &unk_100418080;
  v8[4] = self;
  id v3 = objc_retainBlock(v8);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C9EC;
  block[3] = &unk_100417A50;
  block[4] = self;
  id v7 = v3;
  v5 = v3;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (id)outputContextForOutputDevice:(id)a3
{
  id v4 = [a3 uid];
  v5 = [(MRDAVOutputContextManager *)self outputContextForOutputDeviceUID:v4];

  return v5;
}

- (id)outputContextForOutputDevices:(id)a3 strict:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_msgSend(a3, "mr_map:", &stru_1004180A0);
  id v7 = [(MRDAVOutputContextManager *)self outputContextForOutputDeviceUIDs:v6 strict:v4];

  return v7;
}

- (id)outputContextForOutputDeviceUID:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];

  uint64_t v6 = -[MRDAVOutputContextManager outputContextForOutputDeviceUIDs:strict:](self, "outputContextForOutputDeviceUIDs:strict:", v5, 0, v8);

  return v6;
}

- (id)outputContextForOutputDeviceUIDs:(id)a3 strict:(BOOL)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10005C5F4;
  v30 = sub_10005C604;
  id v31 = 0;
  id v7 = +[MROrigin localOrigin];
  id v8 = +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:v7];

  v9 = [(MRDAVOutputContextManager *)self _normalizeOutputDeviceUIDs:v6 fromDeviceInfo:v8];
  v10 = +[NSMutableSet setWithArray:v9];

  id v11 = [v8 deviceUID];
  unsigned int v12 = [v10 containsObject:v11];
  char v13 = v12;
  if (v12)
  {
    id v14 = v11;
  }
  else
  {
    id v14 = [v10 anyObject];
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CE18;
  block[3] = &unk_100418118;
  block[4] = self;
  id v21 = v10;
  BOOL v24 = a4;
  id v22 = v14;
  objc_super v23 = &v26;
  char v25 = v13;
  id v16 = v14;
  id v17 = v10;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v18;
}

- (void)registerOutputContext:(id)a3
{
  id v4 = a3;
  [(MRDAVOutputContextManager *)self registerForOutputContextNotifications:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MRDAVOutputContextManager *)self registerCommunicationChannelForOutputContext:v4];
  }
}

- (void)registerForOutputContextNotifications:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"outputDevicesDidChangeNotification:" name:MRAVOutputContextOutputDevicesDidChangeNotification object:v4];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleOutputContextDidAddLocalDevice:" name:MRAVOutputContextDidAddLocalDeviceNotification object:v4];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_handleOutputContextDidRemoveLocalDevice:" name:MRAVOutputContextDidRemoveLocalDeviceNotification object:v4];
}

- (void)registerCommunicationChannelForOutputContext:(id)a3
{
  id v3 = a3;
  id v8 = +[MRDMediaRemoteServer server];
  id v4 = [v8 externalDeviceServer];
  v5 = [v4 remoteControlService];
  id v6 = [v5 airPlayService];
  id v7 = [v3 avOutputContext];

  [v6 startContext:v7];
}

- (void)outputDevicesDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  [(MRDAVOutputContextManager *)self processOutputContext:v4];
}

- (void)_notifyLocalDeviceDidChangeOutputContext
{
  id v2 = +[MRDMediaRemoteServer server];
  [v2 postClientNotificationNamed:MRAVOutputContextManagerLocalDeviceDidChangeOutputContextNotification];
}

- (void)_handleMediaServerDeath
{
  id v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDAVOutputContextManager] Re-building output context state in response to mediaserverd death", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DC1C;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"MRDAVOutputContextManagerDidReset" object:self];

  dispatch_time_t v6 = dispatch_time(0, 300000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005DC6C;
  v7[3] = &unk_100415CC8;
  v7[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)reloadOutputContexts
{
  id v3 = [(objc_class *)off_100475F78() allSharedAudioOutputContexts];
  id v4 = objc_msgSend(v3, "mr_map:", &stru_100418158);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        -[MRDAVOutputContextManager processOutputContext:](self, "processOutputContext:", v10, (void)v11);
        [(MRDAVOutputContextManager *)self registerOutputContext:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)processOutputContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contextID];
  if (v5)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005DF30;
    block[3] = &unk_1004159B8;
    v9 = v4;
    uint64_t v10 = self;
    id v11 = v5;
    dispatch_sync((dispatch_queue_t)serialQueue, block);

    id v7 = v9;
  }
  else
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10032B90C((uint64_t)v4, v7);
    }
  }
}

- (id)_normalizeOutputDeviceUIDs:(id)a3 fromDeviceInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 deviceUID];
  uint64_t v8 = [v6 clusterID];
  id v9 = objc_alloc((Class)NSMutableArray);
  uint64_t v10 = [v6 clusteredDevices];

  id v11 = objc_msgSend(v10, "msv_map:", &stru_1004181B8);
  id v12 = [v9 initWithArray:v11];

  if (v7) {
    [v12 addObject:v7];
  }
  if (v8) {
    [v12 addObject:v8];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005E5F0;
  v19[3] = &unk_100417F00;
  id v20 = v12;
  id v13 = v12;
  long long v14 = objc_msgSend(v5, "msv_filter:", v19);
  id v15 = [v14 count];
  if (v15 == [v5 count])
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v14 arrayByAddingObject:v7];

    id v17 = _MRLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10032B984();
    }
  }

  return v16;
}

- (NSMutableDictionary)activeOutputContexts
{
  return self->_activeOutputContexts;
}

- (void)setActiveOutputContexts:(id)a3
{
}

- (NSMutableDictionary)reservedOutputContexts
{
  return self->_reservedOutputContexts;
}

- (void)setReservedOutputContexts:(id)a3
{
}

- (NSMutableDictionary)inactiveOutputContexts
{
  return self->_inactiveOutputContexts;
}

- (void)setInactiveOutputContexts:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSHashTable)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_inactiveOutputContexts, 0);
  objc_storeStrong((id *)&self->_reservedOutputContexts, 0);

  objc_storeStrong((id *)&self->_activeOutputContexts, 0);
}

@end