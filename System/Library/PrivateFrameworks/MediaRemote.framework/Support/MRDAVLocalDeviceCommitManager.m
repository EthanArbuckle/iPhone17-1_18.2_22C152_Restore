@interface MRDAVLocalDeviceCommitManager
- (BOOL)_shouldCommitLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4;
- (BOOL)_shouldRemoveLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4;
- (MRDAVLocalDeviceCommitManager)init;
- (MSVTimer)timer;
- (NSMutableSet)activeTopologyChangeIdentifiers;
- (OS_dispatch_queue)serialQueue;
- (void)_commitLocalDeviceWithReason:(id)a3;
- (void)airplayActiveDidChangeNotification:(id)a3;
- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4;
- (void)eventuallyCommitOutputDevice:(id)a3;
- (void)maybeCommitLocalDeviceWithReason:(id)a3;
- (void)outputContextDidRemoveLocalDeviceNotification:(id)a3;
- (void)outputContextModificationDidBeginNotification:(id)a3;
- (void)outputContextModificationDidFinishNotification:(id)a3;
- (void)setActiveTopologyChangeIdentifiers:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)validateAirPlayConfigurationForReason:(id)a3;
@end

@implementation MRDAVLocalDeviceCommitManager

- (MRDAVLocalDeviceCommitManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)MRDAVLocalDeviceCommitManager;
  v2 = [(MRDAVLocalDeviceCommitManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MRDAVLocalDeviceCommitManager.serial", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeTopologyChangeIdentifiers = v2->_activeTopologyChangeIdentifiers;
    v2->_activeTopologyChangeIdentifiers = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"airplayActiveDidChangeNotification:" name:@"MRDRoutingServerAirplayActiveDidChange" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    uint64_t v10 = MRAVOutputContextDidRemoveLocalDeviceNotification;
    v11 = +[MRAVOutputContext sharedAudioPresentationContext];
    [v9 addObserver:v2 selector:"outputContextDidRemoveLocalDeviceNotification:" name:v10 object:v11];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"outputContextModificationDidBeginNotification:" name:MRAVOutputContextDidBeginModificationNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"outputContextModificationDidFinishNotification:" name:MRAVOutputContextDidFinishModificationNotification object:0];

    v14 = +[MRAVClusterController sharedController];
    [v14 registerObserver:v2];

    [(MRDAVLocalDeviceCommitManager *)v2 eventuallyCommitOutputDevice:@"Boot"];
    [(MRDAVLocalDeviceCommitManager *)v2 validateAirPlayConfigurationForReason:@"Boot"];
  }
  return v2;
}

- (void)airplayActiveDidChangeNotification:(id)a3
{
  [(MRDAVLocalDeviceCommitManager *)self eventuallyCommitOutputDevice:@"AirplayActiveDidChange"];

  [(MRDAVLocalDeviceCommitManager *)self validateAirPlayConfigurationForReason:@"AirplayActiveDidChange"];
}

- (void)outputContextModificationDidBeginNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey];

  v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey];

  v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:MRAVOutputContextModificationTypeUserInfoKey];
  id v11 = [v10 unsignedIntegerValue];

  v12 = (void *)MRMediaRemoteCopyDeviceUID();
  unsigned int v13 = [v6 containsObject:v12];
  if (v11 == (id)3) {
    unsigned int v14 = [v8 containsObject:v12];
  }
  else {
    unsigned int v14 = 0;
  }
  if ((v13 | v14) == 1)
  {
    v15 = [v4 userInfo];
    objc_super v16 = [v15 objectForKeyedSubscript:MRAVOutputContextModificationIdentifierUserInfoKey];

    v17 = [(MRDAVLocalDeviceCommitManager *)self serialQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100060F74;
    v19[3] = &unk_1004158D8;
    v19[4] = self;
    id v20 = v16;
    id v18 = v16;
    dispatch_async(v17, v19);
  }
}

- (void)outputContextModificationDidFinishNotification:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:MRAVOutputContextModificationIdentifierUserInfoKey];

  v6 = [(MRDAVLocalDeviceCommitManager *)self serialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000610A0;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)outputContextDidRemoveLocalDeviceNotification:(id)a3
{
}

- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4
{
}

- (void)validateAirPlayConfigurationForReason:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", v4, v6];
  v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[LocalDeviceCommitManager] Maybe eventually remove localDevice with reason %@...", buf, 0xCu);
  }

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061334;
  block[3] = &unk_1004158D8;
  block[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_after(v9, (dispatch_queue_t)serialQueue, block);
}

- (void)eventuallyCommitOutputDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", v4, v6];
  v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[LocalDeviceCommitManager] Maybe eventually commit with reason %@...", buf, 0xCu);
  }

  dispatch_time_t v9 = [(MRDAVLocalDeviceCommitManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061704;
  block[3] = &unk_1004158D8;
  block[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, block);
}

- (void)maybeCommitLocalDeviceWithReason:(id)a3
{
  id v6 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 deviceInfo];

  if ([(MRDAVLocalDeviceCommitManager *)self _shouldCommitLocalDeviceWithReason:v6 deviceInfo:v5])
  {
    [(MRDAVLocalDeviceCommitManager *)self _commitLocalDeviceWithReason:v6];
  }
}

- (BOOL)_shouldCommitLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MRUserSettings currentSettings];
  unsigned __int8 v9 = [v8 supportOutputContextPrewarming];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    unsigned __int8 v11 = [v10 supportMultiplayerHost];

    if ((v11 & 1) == 0)
    {
      id v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v6;
        id v15 = "[LocalDeviceCommitManager] Not committing %@ because Not multiplayer";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    id v12 = +[MRAVClusterController sharedController];
    unsigned int v13 = [v12 needsCommandRedirection];

    if (v13)
    {
      id v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v6;
        id v15 = "[LocalDeviceCommitManager] Not committing %@ because Home Theater secondary";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v32, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    id v18 = +[MRDAVOutputContextManager sharedManager];
    v19 = [v7 WHAIdentifier];
    id v14 = [v18 outputContextForOutputDeviceUID:v19];

    if ([v14 containsLocalDevice])
    {
      id v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v6;
        v21 = "[LocalDeviceCommitManager] Not committing %@ because containsLocalDevice";
LABEL_19:
        v24 = v20;
        uint32_t v25 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v32, v25);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    v22 = [(MRDAVLocalDeviceCommitManager *)self activeTopologyChangeIdentifiers];
    id v23 = [v22 count];

    if (v23)
    {
      id v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v6;
        v21 = "[LocalDeviceCommitManager] Not committing %@ because localDevice part of another topology modification";
        goto LABEL_19;
      }
LABEL_21:

      goto LABEL_11;
    }
    if ((([v7 clusterType] - 1) & 0xFFFFFFFD) != 0)
    {
LABEL_23:
      BOOL v16 = 1;
      goto LABEL_12;
    }
    v26 = +[MRDMediaRemoteServer server];
    v27 = [v26 routingServer];
    unsigned int v28 = [v27 airplayActive];

    if (v28)
    {
      id v20 = _MRLogForCategory();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v32 = 138412546;
      id v33 = v6;
      __int16 v34 = 2112;
      CFStringRef v35 = @"Dynamic";
      v21 = "[LocalDeviceCommitManager] Not committing %@ because airplayActive on a %@ cluster";
    }
    else
    {
      v29 = [v7 deviceUID];
      v30 = [v7 clusterLeaderID];
      int v31 = [v29 isEqualToString:v30];

      if (v31) {
        goto LABEL_23;
      }
      id v20 = _MRLogForCategory();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v32 = 138412546;
      id v33 = v6;
      __int16 v34 = 2112;
      CFStringRef v35 = @"Dynamic";
      v21 = "[LocalDeviceCommitManager] Not committing %@ because not leader of a %@ cluster";
    }
    v24 = v20;
    uint32_t v25 = 22;
    goto LABEL_20;
  }
  id v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v6;
    id v15 = "[LocalDeviceCommitManager] Not committing %@ because FF disabled";
    goto LABEL_10;
  }
LABEL_11:
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)_shouldRemoveLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((([v6 clusterType] - 1) & 0xFFFFFFFD) != 0)
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      v8 = "[LocalDeviceCommitManager] Not removing localDevice %@ because not dynamicCluster";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v19, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  unsigned __int8 v9 = +[MRAVClusterController sharedController];
  unsigned int v10 = [v9 needsCommandRedirection];

  if (v10)
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      v8 = "[LocalDeviceCommitManager] Not removing localDevice %@ because needsCommandRedirection";
      goto LABEL_14;
    }
LABEL_15:
    unsigned __int8 v16 = 0;
    goto LABEL_16;
  }
  unsigned __int8 v11 = +[MRDMediaRemoteServer server];
  id v12 = [v11 routingServer];
  unsigned __int8 v13 = [v12 airplayActive];

  if ((v13 & 1) == 0)
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      v8 = "[LocalDeviceCommitManager] Not removing localDevice %@ because airplayActive=NO";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v14 = +[MRDAVOutputContextManager sharedManager];
  id v15 = [v6 WHAIdentifier];
  id v7 = [v14 outputContextForOutputDeviceUID:v15];

  unsigned __int8 v16 = [v7 containsLocalDevice];
  if ((v16 & 1) == 0)
  {
    v17 = _MRLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[LocalDeviceCommitManager] Not removing localDevice %@ because localDevice is not present", (uint8_t *)&v19, 0xCu);
    }
  }
LABEL_16:

  return v16;
}

- (void)_commitLocalDeviceWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LocalDeviceCommitManager] Committing %@...", buf, 0xCu);
  }

  id v6 = +[MRDMediaRemoteServer server];
  id v7 = [v6 deviceInfo];

  if ((([v7 clusterType] - 1) & 0xFFFFFFFD) == 0)
  {
    v8 = +[MRUserSettings currentSettings];
    unsigned int v9 = [v8 supportAirplayStereoPairPersistentConnections];

    if (v9) {
      MRMediaRemoteSetClusterLeader();
    }
  }
  id v10 = objc_alloc_init((Class)_MRAVOutputDeviceDescriptorProtobuf);
  unsigned __int8 v11 = [v7 clusterID];
  [v10 setClusterID:v11];

  id v12 = [v7 deviceUID];
  [v10 setUniqueIdentifier:v12];

  id v13 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithDescriptor:v10];
  id v14 = +[MRDAVOutputContextManager sharedManager];
  id v15 = [v7 WHAIdentifier];
  unsigned __int8 v16 = [v14 outputContextForOutputDeviceUID:v15];

  id v17 = [objc_alloc((Class)MRRequestDetails) initWithName:@"CommitLocalDevice" requestID:v4 reason:@"Prewarm"];
  id v18 = objc_alloc((Class)MRGroupTopologyModificationRequest);
  id v25 = v13;
  int v19 = +[NSArray arrayWithObjects:&v25 count:1];
  id v20 = [v18 initWithRequestDetails:v17 type:1 outputDevices:v19];

  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10006226C;
  v23[3] = &unk_100415F80;
  id v24 = v4;
  id v22 = v4;
  [v16 modifyTopologyWithRequest:v20 withReplyQueue:serialQueue completion:v23];
}

- (NSMutableSet)activeTopologyChangeIdentifiers
{
  return self->_activeTopologyChangeIdentifiers;
}

- (void)setActiveTopologyChangeIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (MSVTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_activeTopologyChangeIdentifiers, 0);
}

@end