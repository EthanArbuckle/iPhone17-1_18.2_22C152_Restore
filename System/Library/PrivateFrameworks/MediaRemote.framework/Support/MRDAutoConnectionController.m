@interface MRDAutoConnectionController
+ (id)sharedConnectionController;
- (NSArray)autoConnectedEndpoints;
- (NSArray)autoConnectingEndpoints;
- (id)_init;
- (void)_connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_connectToGroup:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_connectToOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_discoverGroup:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_discoverOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleEndpointDidInvalidateNotification:(id)a3;
- (void)_onSerialQueue_addConnectedEndpoint:(id)a3;
- (void)_onSerialQueue_connectToEndpoint:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_onSerialQueue_discoverGroup:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_onSerialQueue_discoverOutputDevice:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_onSerialQueue_removeConnectedEndpoint:(id)a3;
- (void)connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)connectToGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)connectToOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)discoverGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)discoverOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation MRDAutoConnectionController

+ (id)sharedConnectionController
{
  if (qword_10047E210 != -1) {
    dispatch_once(&qword_10047E210, &stru_10041D1B0);
  }
  v2 = (void *)qword_10047E208;

  return v2;
}

- (id)_init
{
  v28.receiver = self;
  v28.super_class = (Class)MRDAutoConnectionController;
  v2 = [(MRDAutoConnectionController *)&v28 init];
  if (!v2) {
    return v2;
  }
  v3 = +[MRDMediaRemoteServer server];
  uint64_t v4 = [v3 nowPlayingServer];
  nowPlayingServer = v2->_nowPlayingServer;
  v2->_nowPlayingServer = (MRDNowPlayingServer *)v4;

  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MRDAutoConnectionController", v6);
  serialQueue = v2->_serialQueue;
  v2->_serialQueue = (OS_dispatch_queue *)v7;

  v9 = +[MRUserSettings currentSettings];
  unsigned int v10 = [v9 connectToAllEndpointsWhenAnyEndpointBeginsPlayback];

  if (v10)
  {
    v11 = +[MRCompanionLinkClient sharedCompanionLinkClient];
    uint64_t v12 = MRCompanionLinkClientEventIsPlaying;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10010F27C;
    v26[3] = &unk_100419248;
    v13 = (id *)&v27;
    v27 = v2;
    v14 = v26;
  }
  else
  {
    v15 = +[MRUserSettings currentSettings];
    unsigned int v16 = [v15 connectToEndpointWhenBeginsPlayback];

    if (!v16) {
      goto LABEL_7;
    }
    v11 = +[MRCompanionLinkClient sharedCompanionLinkClient];
    uint64_t v12 = MRCompanionLinkClientEventIsPlaying;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10010F454;
    v24[3] = &unk_100419248;
    v13 = (id *)&v25;
    v25 = v2;
    v14 = v24;
  }
  id v17 = [v11 registerEvent:v12 callback:v14];

LABEL_7:
  v18 = +[MRUserSettings currentSettings];
  unsigned int v19 = [v18 connectToUserSelectedEndpoint];

  if (v19)
  {
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010F538;
    block[3] = &unk_100415CC8;
    v23 = v2;
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

- (NSArray)autoConnectingEndpoints
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10010F7B0;
  unsigned int v10 = sub_10010F7C0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010F7C8;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)autoConnectedEndpoints
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10010F7B0;
  unsigned int v10 = sub_10010F7C0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010F908;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (!v10)
  {
    id v10 = &_dispatch_main_q;
    id v12 = &_dispatch_main_q;
  }
  id v13 = a4;
  id v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010FAAC;
  v19[3] = &unk_10041D248;
  id v21 = v10;
  id v22 = v11;
  id v20 = [objc_alloc((Class)MSVBlockGuard) initWithDeallocHandler:&stru_10041D220];
  id v15 = v10;
  id v16 = v11;
  id v17 = v20;
  v18 = objc_retainBlock(v19);
  [(MRDAutoConnectionController *)self _connectToAllOutputDevicesForReason:v14 comparator:v13 queue:v15 completion:v18];
}

- (void)connectToOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10010FCC0;
  v18[3] = &unk_10041D290;
  id v20 = v10;
  id v21 = v11;
  id v19 = [objc_alloc((Class)MSVBlockGuard) initWithDeallocHandler:&stru_10041D268];
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  id v17 = objc_retainBlock(v18);
  [(MRDAutoConnectionController *)self _connectToOutputDevice:v13 reason:v12 completion:v17];
}

- (void)connectToGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10010FED4;
  v18[3] = &unk_10041D290;
  id v20 = v10;
  id v21 = v11;
  id v19 = [objc_alloc((Class)MSVBlockGuard) initWithDeallocHandler:&stru_10041D2B0];
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  id v17 = objc_retainBlock(v18);
  [(MRDAutoConnectionController *)self _connectToGroup:v13 reason:v12 completion:v17];
}

- (void)discoverOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001100E8;
  v18[3] = &unk_10041D290;
  id v20 = v10;
  id v21 = v11;
  id v19 = [objc_alloc((Class)MSVBlockGuard) initWithDeallocHandler:&stru_10041D2D0];
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  id v17 = objc_retainBlock(v18);
  [(MRDAutoConnectionController *)self _discoverOutputDevice:v13 reason:v12 completion:v17];
}

- (void)discoverGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001102FC;
  v18[3] = &unk_10041D290;
  id v20 = v10;
  id v21 = v11;
  id v19 = [objc_alloc((Class)MSVBlockGuard) initWithDeallocHandler:&stru_10041D2F0];
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  id v17 = objc_retainBlock(v18);
  [(MRDAutoConnectionController *)self _discoverGroup:v13 reason:v12 completion:v17];
}

- (void)_connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001106B4;
  v43[3] = &unk_10041D340;
  v43[4] = self;
  id v46 = v11;
  id v16 = v10;
  id v44 = v16;
  id v17 = v14;
  id v45 = v17;
  id v18 = v11;
  id v19 = [v15 addEndpointsChangedCallback:v43];
  id v20 = +[NSUUID UUID];
  id v21 = [v20 UUIDString];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110950;
  block[3] = &unk_1004159B8;
  id v22 = v21;
  id v40 = v22;
  id v41 = v16;
  id v23 = v15;
  id v42 = v23;
  id v24 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v25 = +[MRUserSettings currentSettings];
  [v25 discoverEndpointTimeoutInterval];
  dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100110A14;
  v33[3] = &unk_1004163E8;
  id v34 = v22;
  id v35 = v23;
  id v37 = v12;
  id v38 = v13;
  id v36 = v17;
  id v28 = v12;
  id v29 = v17;
  id v30 = v13;
  id v31 = v23;
  id v32 = v22;
  dispatch_after(v27, (dispatch_queue_t)&_dispatch_main_q, v33);
}

- (void)_connectToOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100110C58;
  v15[3] = &unk_100415B98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)_connectToGroup:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100110D50;
  v15[3] = &unk_100415B98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)_discoverOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100110E48;
  v15[3] = &unk_100415B98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)_discoverGroup:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100110F40;
  v15[3] = &unk_100415B98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)_onSerialQueue_discoverOutputDevice:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  serialQueue = self->_serialQueue;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  if (v10)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001112A0;
    v43[3] = &unk_10041D368;
    v43[4] = self;
    id v14 = v10;
    id v44 = v14;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001113E4;
    v39[3] = &unk_10041D390;
    id v15 = objc_retainBlock(v43);
    BOOL v42 = a4;
    id v41 = v15;
    v39[4] = self;
    id v16 = v11;
    id v40 = v16;
    id v17 = objc_retainBlock(v39);
    pendingReconSessionCompletions = self->_pendingReconSessionCompletions;
    if (!pendingReconSessionCompletions)
    {
      id v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v20 = self->_pendingReconSessionCompletions;
      self->_pendingReconSessionCompletions = v19;

      pendingReconSessionCompletions = self->_pendingReconSessionCompletions;
    }
    id v21 = [(NSMutableDictionary *)pendingReconSessionCompletions objectForKeyedSubscript:v14];

    if (!v21)
    {
      id v22 = objc_alloc_init((Class)NSMutableArray);
      [(NSMutableDictionary *)self->_pendingReconSessionCompletions setObject:v22 forKeyedSubscript:v14];
    }
    id v23 = [(NSMutableDictionary *)self->_pendingReconSessionCompletions objectForKeyedSubscript:v14];
    id v24 = [v13 copy];

    id v25 = objc_retainBlock(v24);
    [v23 addObject:v25];

    double v26 = [(NSMutableDictionary *)self->_pendingReconSessions objectForKeyedSubscript:v14];

    if (!v26)
    {
      id v27 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
      pendingReconSessions = self->_pendingReconSessions;
      if (!pendingReconSessions)
      {
        id v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v30 = self->_pendingReconSessions;
        self->_pendingReconSessions = v29;

        pendingReconSessions = self->_pendingReconSessions;
      }
      [(NSMutableDictionary *)pendingReconSessions setObject:v27 forKeyedSubscript:v14];
      id v31 = +[MRUserSettings currentSettings];
      [v31 discoverEndpointTimeoutInterval];
      double v33 = v32;
      id v34 = [v16 string];
      id v35 = self->_serialQueue;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100111534;
      v37[3] = &unk_100419A08;
      id v38 = v17;
      [v27 searchEndpointsForOutputDeviceUID:v14 timeout:v34 reason:v35 queue:v37 completion:v33];
    }
  }
  else
  {
    id v36 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    (*((void (**)(id, void *))v13 + 2))(v13, v36);
  }
}

- (void)_onSerialQueue_discoverGroup:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  serialQueue = self->_serialQueue;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100111858;
  v42[3] = &unk_10041D368;
  v42[4] = self;
  id v14 = v10;
  id v43 = v14;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10011199C;
  v38[3] = &unk_10041D390;
  id v15 = objc_retainBlock(v42);
  BOOL v41 = a4;
  id v40 = v15;
  v38[4] = self;
  id v16 = v11;
  id v39 = v16;
  id v17 = objc_retainBlock(v38);
  pendingGroupReconSessionCompletions = self->_pendingGroupReconSessionCompletions;
  if (!pendingGroupReconSessionCompletions)
  {
    id v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v20 = self->_pendingGroupReconSessionCompletions;
    self->_pendingGroupReconSessionCompletions = v19;

    pendingGroupReconSessionCompletions = self->_pendingGroupReconSessionCompletions;
  }
  id v21 = [(NSMutableDictionary *)pendingGroupReconSessionCompletions objectForKeyedSubscript:v14];

  if (!v21)
  {
    id v22 = objc_alloc_init((Class)NSMutableArray);
    [(NSMutableDictionary *)self->_pendingGroupReconSessionCompletions setObject:v22 forKeyedSubscript:v14];
  }
  id v23 = [(NSMutableDictionary *)self->_pendingGroupReconSessionCompletions objectForKeyedSubscript:v14];
  id v24 = [v13 copy];

  id v25 = objc_retainBlock(v24);
  [v23 addObject:v25];

  double v26 = [(NSMutableDictionary *)self->_pendingGroupReconSessions objectForKeyedSubscript:v14];

  if (!v26)
  {
    id v27 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
    pendingGroupReconSessions = self->_pendingGroupReconSessions;
    if (!pendingGroupReconSessions)
    {
      id v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v30 = self->_pendingGroupReconSessions;
      self->_pendingGroupReconSessions = v29;

      pendingGroupReconSessions = self->_pendingGroupReconSessions;
    }
    [(NSMutableDictionary *)pendingGroupReconSessions setObject:v27 forKeyedSubscript:v14];
    id v31 = +[MRUserSettings currentSettings];
    [v31 discoverEndpointTimeoutInterval];
    double v33 = v32;
    id v34 = [v16 string];
    id v35 = self->_serialQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100111AEC;
    v36[3] = &unk_100419A08;
    id v37 = v17;
    [v27 searchEndpointsForGroupUID:v14 timeout:v34 reason:v35 queue:v36 completion:v33];
  }
}

- (void)_onSerialQueue_connectToEndpoint:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100111EDC;
  v51[3] = &unk_1004189B0;
  id v14 = v13;
  id v53 = v14;
  id v15 = v12;
  id v52 = v15;
  id v16 = objc_retainBlock(v51);
  if (v10)
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100111FA0;
    v49[3] = &unk_100418848;
    v49[4] = self;
    id v17 = v10;
    id v50 = v17;
    BOOL v42 = objc_retainBlock(v49);
    pendingConnectingEndpointCompletions = self->_pendingConnectingEndpointCompletions;
    if (!pendingConnectingEndpointCompletions)
    {
      id v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v20 = self->_pendingConnectingEndpointCompletions;
      self->_pendingConnectingEndpointCompletions = v19;

      pendingConnectingEndpointCompletions = self->_pendingConnectingEndpointCompletions;
    }
    id v43 = v11;
    id v21 = [v17 uniqueIdentifier];
    id v22 = [(NSMutableDictionary *)pendingConnectingEndpointCompletions objectForKeyedSubscript:v21];

    if (!v22)
    {
      id v23 = objc_alloc_init((Class)NSMutableArray);
      id v24 = self->_pendingConnectingEndpointCompletions;
      id v25 = [v17 uniqueIdentifier];
      [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:v25];
    }
    double v26 = self->_pendingConnectingEndpointCompletions;
    id v27 = [v17 uniqueIdentifier];
    id v28 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:v27];
    id v29 = [v16 copy];
    id v30 = objc_retainBlock(v29);
    [v28 addObject:v30];

    id v31 = [v17 externalDevice];
    if ([v31 connectionState] == 2)
    {
    }
    else
    {
      unsigned __int8 v33 = [v17 isLocalEndpoint];

      if ((v33 & 1) == 0)
      {
        connectingEndpoints = self->_connectingEndpoints;
        id v36 = [v17 uniqueIdentifier];
        id v37 = [(NSMutableDictionary *)connectingEndpoints objectForKey:v36];

        id v34 = v42;
        id v11 = v43;
        if (!v37)
        {
          id v38 = self->_connectingEndpoints;
          if (!v38)
          {
            id v39 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v40 = self->_connectingEndpoints;
            self->_connectingEndpoints = v39;

            id v38 = self->_connectingEndpoints;
          }
          BOOL v41 = [v17 uniqueIdentifier];
          [(NSMutableDictionary *)v38 setObject:v17 forKeyedSubscript:v41];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100112108;
          block[3] = &unk_100415B98;
          id v45 = v17;
          id v46 = v43;
          v47 = self;
          v48 = v42;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        goto LABEL_11;
      }
    }
    id v34 = v42;
    ((void (*)(void *, void))v42[2])(v42, 0);
    id v11 = v43;
LABEL_11:

    goto LABEL_12;
  }
  Error = (void *)MRMediaRemoteCreateError();
  ((void (*)(void *, void *))v16[2])(v16, Error);

LABEL_12:
}

- (void)_onSerialQueue_addConnectedEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v5 = [v4 externalDevice];
  if (v5)
  {
    id v24 = v5;
    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = kMRExternalDeviceConnectionStateDidChangeNotification;
    id v8 = [v4 externalDevice];
    [v6 addObserver:self selector:"_handleEndpointDidInvalidateNotification:" name:v7 object:v8];

    connectedEndpoints = self->_connectedEndpoints;
    if (!connectedEndpoints)
    {
      id v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v11 = self->_connectedEndpoints;
      self->_connectedEndpoints = v10;

      connectedEndpoints = self->_connectedEndpoints;
    }
    [(NSMutableSet *)connectedEndpoints allObjects];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v28 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v35;
      id v27 = v4;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v12;
          id v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = [v4 outputDeviceUIDs];
          id v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v31;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
                id v20 = [v13 outputDeviceUIDs];
                LODWORD(v19) = [v20 containsObject:v19];

                if (v19)
                {
                  id v21 = _MRLogForCategory();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    id v22 = [v13 uniqueIdentifier];
                    id v23 = [v13 localizedName];
                    *(_DWORD *)buf = 138412546;
                    id v39 = v22;
                    __int16 v40 = 2112;
                    BOOL v41 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[MRDAutoConnectionController] Removing outdated endpoint <%@> (<%@>)", buf, 0x16u);
                  }
                  [(NSMutableSet *)self->_connectedEndpoints removeObject:v13];
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
            }
            while (v16);
          }

          uint64_t v12 = v29 + 1;
          id v4 = v27;
        }
        while ((id)(v29 + 1) != v28);
        id v28 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v28);
    }
    [(NSMutableSet *)self->_connectedEndpoints addObject:v4];

    v5 = v24;
  }
}

- (void)_onSerialQueue_removeConnectedEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(NSMutableSet *)self->_connectedEndpoints allObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "externalDevice", (void)v16);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          uint64_t v12 = _MRLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [v10 uniqueIdentifier];
            id v14 = [v10 localizedName];
            *(_DWORD *)buf = 138412546;
            id v21 = v13;
            __int16 v22 = 2112;
            id v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDAutoConnectionController] Removing endpoint <%@> (<%@>)", buf, 0x16u);
          }
          id v15 = +[NSNotificationCenter defaultCenter];
          [v15 removeObserver:self name:kMRExternalDeviceConnectionStateDidChangeNotification object:v4];

          [(NSMutableSet *)self->_connectedEndpoints removeObject:v10];
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_handleEndpointDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:kMRExternalDeviceConnectionStateUserInfoKey];
  unsigned int v8 = [v7 intValue];

  if (v8 == 3)
  {
    serialQueue = self->_serialQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100112D8C;
    v10[3] = &unk_1004158D8;
    v10[4] = self;
    id v11 = v5;
    dispatch_async((dispatch_queue_t)serialQueue, v10);
  }
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v13 = a3;
  id v4 = [v13 userInfo];
  id v5 = [v4 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  unsigned int v6 = [v5 intValue];

  if (!v6)
  {
    id v7 = [v13 userInfo];
    unsigned int v8 = [v7 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];

    id v9 = objc_alloc((Class)NSString);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v11 = [v9 initWithFormat:@"%@ endpoint changed", active];

    uint64_t v12 = +[MRDAutoConnectionControllerReason reasonWithType:2 string:v11];
    [(MRDAutoConnectionController *)self connectToOutputDevice:v8 reason:v12 queue:0 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConnectingEndpointCompletions, 0);
  objc_storeStrong((id *)&self->_connectingEndpoints, 0);
  objc_storeStrong((id *)&self->_connectedEndpoints, 0);
  objc_storeStrong((id *)&self->_pendingGroupReconSessionCompletions, 0);
  objc_storeStrong((id *)&self->_pendingGroupReconSessions, 0);
  objc_storeStrong((id *)&self->_pendingReconSessionCompletions, 0);
  objc_storeStrong((id *)&self->_pendingReconSessions, 0);
  objc_storeStrong((id *)&self->_nowPlayingServer, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end