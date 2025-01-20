@interface MRDPauseOutputDevicesRequest
+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
- (id)_calculateDevicesInGroup:(id)a3;
- (id)_calculateOperationForEndpoint:(id)a3 outputDeviceUIDs:(id)a4;
- (id)_calculateRelevantOutputDevicesInGroup:(id)a3 outputDeviceUIDs:(id)a4;
- (void)_discoverOutputDevices:(id)a3 completion:(id)a4;
- (void)_pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_performOperation:(id)a3 details:(id)a4 completion:(id)a5;
- (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation MRDPauseOutputDevicesRequest

+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(MRDPauseOutputDevicesRequest);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009D1A4;
  v16[3] = &unk_10041A1F0;
  id v17 = v10;
  id v18 = a1;
  id v15 = v10;
  [(MRDPauseOutputDevicesRequest *)v14 pauseOutputDeviceUIDs:v13 details:v12 queue:v11 completion:v16];
}

- (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = [MRDPauseOutputDevicesRequestReport alloc];
  id v15 = [v11 requestID];
  v16 = [(MRDPauseOutputDevicesRequestReport *)v14 initWithOutputDevices:v10 requestID:v15];
  report = self->_report;
  self->_report = v16;

  id v18 = +[NSDate now];
  id v19 = objc_alloc((Class)NSMutableString);
  v20 = [v11 requestID];
  id v21 = [v19 initWithFormat:@"%@<%@>", @"MRDPauseOutputDevicesRequest.pauseOutputDeviceUIDs", v20];

  if (v10) {
    [v21 appendFormat:@" for %@", v10];
  }
  v22 = [v11 reason];

  if (v22)
  {
    v23 = [v11 reason];
    [v21 appendFormat:@" because %@", v23];
  }
  v24 = _MRLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10009D46C;
  v30[3] = &unk_10041A218;
  v30[4] = self;
  id v31 = v11;
  id v33 = v10;
  id v34 = v12;
  id v32 = v18;
  id v25 = v10;
  id v26 = v12;
  id v27 = v18;
  id v28 = v11;
  v29 = objc_retainBlock(v30);
  [(MRDPauseOutputDevicesRequest *)self _pauseOutputDeviceUIDs:v25 details:v28 queue:v13 completion:v29];
}

- (void)_pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  id v15 = [[MRDPauseOutputDevicesRequestEndpointOperation alloc] initWithEndpoint:0];
  [(MRDPauseOutputDevicesRequestReport *)self->_report addOperation:v15];
  [(MRDPauseOutputDevicesRequestEndpointOperation *)v15 startEvent:@"discover"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009DB2C;
  v20[3] = &unk_10041A268;
  id v21 = v15;
  v22 = self;
  id v23 = v11;
  v24 = v14;
  id v25 = v10;
  id v16 = v10;
  id v17 = v14;
  id v18 = v11;
  id v19 = v15;
  [(MRDPauseOutputDevicesRequest *)self _discoverOutputDevices:v16 completion:v20];
  dispatch_group_notify(v17, v13, v12);
}

- (void)_discoverOutputDevices:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)MRAVReconnaissanceSession) initWithOutputDeviceUIDs:v6 outputDeviceGroupID:0 features:8];

  [v7 setWaitForCompleteClusters:1];
  [v7 setShouldWaitForUnanimousEndpoints:0];
  [v7 setReturnPartialResults:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009E440;
  v9[3] = &unk_100418480;
  id v10 = v5;
  id v8 = v5;
  [v7 beginSearchWithTimeout:v9 endpointsCompletion:3.0];
}

- (id)_calculateDevicesInGroup:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [v3 resolvedOutputDevices];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  if ([v3 isLocalEndpoint])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = objc_msgSend(v3, "resolvedOutputDevices", 0);
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
          if ([v15 isLocalDevice])
          {
            id v16 = [v15 uid];
            id v17 = [v16 length];

            if (v17)
            {
              [v4 addObject:v15];
              goto LABEL_20;
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }

  return v4;
}

- (id)_calculateRelevantOutputDevicesInGroup:(id)a3 outputDeviceUIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v19 = v5;
  id obj = [v5 outputDevices];
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v6;
        id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([v12 containsUID:*(void *)(*((void *)&v21 + 1) + 8 * (void)j)]) {
                [v7 addObject:v12];
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v15);
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)_calculateOperationForEndpoint:(id)a3 outputDeviceUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MRDPauseOutputDevicesRequestOperation);
  [(MRDPauseOutputDevicesRequestOperation *)v8 setType:0];
  id v9 = [(MRDPauseOutputDevicesRequest *)self _calculateDevicesInGroup:v6];
  [(MRDPauseOutputDevicesRequestOperation *)v8 setDevicesInGroup:v9];

  uint64_t v10 = [(MRDPauseOutputDevicesRequest *)self _calculateRelevantOutputDevicesInGroup:v6 outputDeviceUIDs:v7];

  [(MRDPauseOutputDevicesRequestOperation *)v8 setRelevantOutputDevices:v10];
  id v11 = [(MRDPauseOutputDevicesRequestOperation *)v8 relevantOutputDevices];
  id v12 = [v11 count];

  if (!v12)
  {
    uint64_t v18 = 0;
    CFStringRef v17 = @"no relevant outputDevices";
    goto LABEL_17;
  }
  id v13 = [(MRDPauseOutputDevicesRequestOperation *)v8 devicesInGroup];
  id v14 = [v13 count];
  id v15 = [(MRDPauseOutputDevicesRequestOperation *)v8 relevantOutputDevices];
  id v16 = [v15 count];

  if (v14 == v16)
  {
    CFStringRef v17 = @"all devices in group need to pause";
    uint64_t v18 = 1;
    goto LABEL_17;
  }
  if ([v6 groupContainsDiscoverableGroupLeader])
  {
    CFStringRef v17 = @"discoverable group leader";
LABEL_11:
    uint64_t v18 = 2;
    goto LABEL_17;
  }
  long long v19 = [v6 designatedGroupLeader];
  if ([v19 isRemoteControllable])
  {
  }
  else
  {
    long long v20 = [v6 designatedGroupLeader];
    unsigned __int8 v21 = [v20 canRelayCommunicationChannel];

    if (v21)
    {
      CFStringRef v17 = @"relayable group leader";
      goto LABEL_11;
    }
  }
  long long v22 = [v6 designatedGroupLeader];
  if ([v22 isRemoteControllable])
  {
    long long v23 = [v6 resolvedOutputDevices];
    long long v24 = objc_msgSend(v23, "msv_filter:", &stru_10041A288);
    id v25 = [v24 count];

    if (v25)
    {
      CFStringRef v17 = @"undiscoverable remote controllable group leader but relay available";
      uint64_t v18 = 4;
      goto LABEL_17;
    }
  }
  else
  {
  }
  CFStringRef v17 = @"undiscoverable group leader";
  uint64_t v18 = 3;
LABEL_17:
  [(MRDPauseOutputDevicesRequestOperation *)v8 setReason:v17];
  [(MRDPauseOutputDevicesRequestOperation *)v8 setType:v18];

  return v8;
}

- (void)_performOperation:(id)a3 details:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = objc_alloc((Class)NSString);
  id v11 = [v7 endpoint];
  id v12 = [v11 debugName];
  id v13 = [v7 pauseOperation];
  unint64_t v14 = (unint64_t)[v13 type];
  if (v14 > 4) {
    CFStringRef v15 = @"?";
  }
  else {
    CFStringRef v15 = off_10041A490[v14];
  }
  id v16 = [v7 pauseOperation];
  CFStringRef v17 = [v16 relevantOutputDevices];
  id v18 = [v10 initWithFormat:@"Endpoint %@ will %@ %@", v12, v15, v17];

  long long v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = [v8 requestID];
    *(_DWORD *)buf = 138543874;
    CFStringRef v84 = @"MRDPauseOutputDevicesRequest.pauseOutputDeviceUIDs";
    __int16 v85 = 2114;
    v86 = v20;
    __int16 v87 = 2112;
    id v88 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }
  unsigned __int8 v21 = [v7 pauseOperation];
  id v22 = [v21 type];

  switch((unint64_t)v22)
  {
    case 0uLL:
      v9[2](v9);
      break;
    case 1uLL:
      [v7 startEvent:@"pause"];
      id v23 = objc_alloc((Class)MRNowPlayingRequest);
      long long v24 = [v7 endpoint];
      id v25 = [v24 origin];
      id v26 = [v23 initWithOrigin:v25];

      v81[0] = kMRMediaRemoteOptionContextID;
      long long v27 = [v8 requestID];
      v82[0] = v27;
      v81[1] = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
      long long v28 = [v8 reason];
      v82[1] = v28;
      v29 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];

      qos_class_t v30 = qos_class_self();
      id v31 = dispatch_get_global_queue(v30, 0);
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_10009F31C;
      v78[3] = &unk_100416848;
      id v79 = v7;
      v80 = v9;
      [v26 sendCommand:1 options:v29 queue:v31 completion:v78];

      goto LABEL_10;
    case 2uLL:
      id v32 = MRGroupTopologyModificationRequestTypeDescription();
      [v7 startEvent:v32];

      id v33 = objc_alloc((Class)MRGroupTopologyModificationRequest);
      id v34 = [v7 pauseOperation];
      v35 = [v34 relevantOutputDevices];
      id v36 = [v35 allObjects];
      id v26 = [v33 initWithRequestDetails:v8 type:2 outputDevices:v36];

      [v26 setSuppressErrorDialog:1];
      v37 = [v7 endpoint];
      qos_class_t v38 = qos_class_self();
      v39 = dispatch_get_global_queue(v38, 0);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10009F38C;
      v75[3] = &unk_1004187A8;
      id v76 = v7;
      v77 = v9;
      [v37 modifyTopologyWithRequest:v26 withReplyQueue:v39 completion:v75];

LABEL_10:
      break;
    case 3uLL:
      [v7 startEvent:@"removeFromParentGroup"];
      v40 = +[MRDMediaRemoteServer server];
      v41 = [v40 routingServer];
      v42 = [v7 pauseOperation];
      v43 = [v42 relevantOutputDeviceUIDs];
      v44 = [v43 allObjects];
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_10009F404;
      v72[3] = &unk_1004187A8;
      id v73 = v7;
      v74 = v9;
      [v41 removeOutputDeviceUIDsFromParentGroup:v44 details:v8 completion:v72];

      v45 = v73;
      goto LABEL_18;
    case 4uLL:
      v46 = [v7 pauseOperation];
      v47 = [v46 devicesInGroup];
      v48 = objc_msgSend(v47, "msv_filter:", &stru_10041A2A8);

      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10009F474;
      v70[3] = &unk_100417940;
      id v49 = v7;
      id v71 = v49;
      uint64_t v50 = objc_msgSend(v48, "msv_firstWhere:", v70);
      v51 = (void *)v50;
      if (!v50)
      {
        v51 = [v48 firstObject];
      }
      v65 = v48;
      [v49 startEvent:@"createRelayEndpointForOutputDeviceUIDs"];
      v52 = +[MRDMediaRemoteServer server];
      v53 = [v52 routingServer];
      v64 = v51;
      v54 = [v51 uid];
      v55 = [v53 createTransientEndpointForOutputDeviceUID:v54 details:v8];

      [v49 endEvent:@"createRelayEndpointForOutputDeviceUIDs" withError:0];
      if (v55)
      {
        BOOL v63 = v50 == 0;
        id v56 = objc_alloc((Class)MRGroupTopologyModificationRequest);
        v57 = [v49 pauseOperation];
        v58 = [v57 relevantOutputDeviceUIDs];
        v59 = [v58 allObjects];
        id v60 = [v56 initWithRequestDetails:v8 type:2 outputDeviceUIDs:v59];

        [v60 setSuppressErrorDialog:1];
        [v49 startEvent:@"modifyRelayEndpoint"];
        qos_class_t v61 = qos_class_self();
        v62 = dispatch_get_global_queue(v61, 0);
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10009F4F4;
        v66[3] = &unk_10041A2D0;
        BOOL v69 = v63;
        id v67 = v49;
        v68 = v9;
        [v55 modifyTopologyWithRequest:v60 withReplyQueue:v62 completion:v66];
      }
      else
      {
        v9[2](v9);
      }

      v45 = v65;
LABEL_18:

      break;
    default:
      break;
  }
}

- (void).cxx_destruct
{
}

@end