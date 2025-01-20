@interface MRDMRRelayRemoteControlService
- (MRDMRRelayRemoteControlServiceDelegate)delegate;
- (MRDPreemptiveRemoteControlConnectionManager)connectionManager;
- (NSMutableDictionary)operations;
- (NSMutableDictionary)relayConnectionsToSecondaries;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (void)_clearSecondaryConnectionsForDevicesNotInArray:(id)a3;
- (void)_handleCompletedOperation:(id)a3 forOutputDeviceUID:(id)a4;
- (void)_reevaluateSecondaryConnectionWithDeviceInfo:(id)a3;
- (void)_reevaluateWithReason:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperations:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelayConnectionsToSecondaries:(id)a3;
- (void)start;
- (void)stop;
- (void)transportDidClose:(id)a3 error:(id)a4;
@end

@implementation MRDMRRelayRemoteControlService

- (void)start
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MediaRemote.MRDMRRelayRemoteControlService", v3);
  queue = self->_queue;
  self->_queue = v4;

  v6 = [(MRDMRRelayRemoteControlService *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100180158;
  v7[3] = &unk_100415CC8;
  v7[4] = self;
  sub_10016A738(v6, v7);
}

- (void)stop
{
  v3 = [(MRDMRRelayRemoteControlService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001802F8;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSString)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v4 = [(MRDMRRelayRemoteControlService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100180578;
  block[3] = &unk_1004158D8;
  block[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, block);

  v6 = v10;
  id v7 = v5;

  return (NSString *)v7;
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MRDMRRelayRemoteControlService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001807FC;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_reevaluateWithReason:(id)a3
{
  v4 = [(MRDMRRelayRemoteControlService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100180A94;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_reevaluateSecondaryConnectionWithDeviceInfo:(id)a3
{
  id v17 = a3;
  v4 = [(MRDMRRelayRemoteControlService *)self queue];
  dispatch_assert_queue_V2(v4);

  v18 = +[MRAVOutputContext sharedAudioPresentationContext];
  id v5 = objc_msgSend(v18, "mr_allAirPlayDevices");
  [(MRDMRRelayRemoteControlService *)self _clearSecondaryConnectionsForDevicesNotInArray:v5];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v9 = [v8 uid];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100180E50;
        v25[3] = &unk_100420130;
        v25[4] = self;
        id v10 = v9;
        id v26 = v10;
        v27 = v8;
        v11 = sub_100180E50((uint64_t)v25);
        if ([v11 result])
        {
          id v12 = [[MRDConnectToRelaySecondaryOperation alloc] initWithOutputDevice:v8];
          objc_initWeak(&location, v12);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100180FA8;
          v21[3] = &unk_100420158;
          v21[4] = self;
          objc_copyWeak(&v23, &location);
          id v13 = v10;
          id v22 = v13;
          [(MRDConnectToRelaySecondaryOperation *)v12 setCompletionBlock:v21];
          v14 = [(MRDMRRelayRemoteControlService *)self operations];
          id v15 = [v14 objectForKeyedSubscript:v13];

          if (!v15)
          {
            id v15 = objc_alloc_init((Class)NSOperationQueue);
            v16 = [(MRDMRRelayRemoteControlService *)self operations];
            [v16 setObject:v15 forKeyedSubscript:v13];
          }
          [v15 addOperation:v12];

          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
}

- (void)_handleCompletedOperation:(id)a3 forOutputDeviceUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MRDMRRelayRemoteControlService *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 handle];
  id v10 = [v9 connection];
  [v10 addObserver:self];

  v11 = [v6 handle];
  id v12 = [v11 connection];
  if (([v12 isValid] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v13 = [v6 error];

  if (v13)
  {
LABEL_9:
    uint64_t v20 = [v6 handle];
    v21 = [v20 connection];
    id v22 = [v6 error];
    [v21 closeWithError:v22];

    id v23 = [v6 handle];
    v24 = [v23 connection];
    [v24 removeObserver:self];

    id v25 = objc_alloc((Class)NSString);
    id v26 = [v6 error];
    v27 = [v6 handle];
    id v28 = [v25 initWithFormat:@"relayConnection is not valid with error=%@: %@", v26, v27];

    [(MRDMRRelayRemoteControlService *)self _reevaluateWithReason:v28];
    goto LABEL_10;
  }
  v14 = [(MRDMRRelayRemoteControlService *)self relayConnectionsToSecondaries];

  if (!v14)
  {
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    [(MRDMRRelayRemoteControlService *)self setRelayConnectionsToSecondaries:v15];
  }
  v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v6 handle];
    *(_DWORD *)buf = 138412290;
    v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDMRRelayRemoteControlService] Adding relayConnection: %@", buf, 0xCu);
  }
  v18 = [v6 handle];
  v19 = [(MRDMRRelayRemoteControlService *)self relayConnectionsToSecondaries];
  [v19 setObject:v18 forKeyedSubscript:v7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001813EC;
  block[3] = &unk_1004158D8;
  block[4] = self;
  id v30 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_10:
}

- (void)_clearSecondaryConnectionsForDevicesNotInArray:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDMRRelayRemoteControlService *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc((Class)NSSet);
  id v7 = objc_msgSend(v4, "msv_map:", &stru_100420178);

  id v8 = [v6 initWithArray:v7];
  id v9 = [(MRDMRRelayRemoteControlService *)self operations];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100181600;
  v16[3] = &unk_1004201A0;
  id v10 = v8;
  id v17 = v10;
  v18 = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  v11 = [(MRDMRRelayRemoteControlService *)self relayConnectionsToSecondaries];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100181728;
  v13[3] = &unk_1004201C8;
  id v14 = v10;
  id v15 = self;
  id v12 = v10;
  [v11 enumerateKeysAndObjectsUsingBlock:v13];
}

- (MRDMRRelayRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDMRRelayRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRDPreemptiveRemoteControlConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (NSMutableDictionary)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (NSMutableDictionary)relayConnectionsToSecondaries
{
  return self->_relayConnectionsToSecondaries;
}

- (void)setRelayConnectionsToSecondaries:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_relayConnectionsToSecondaries, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end