@interface WifiP2PController
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherStarted:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation WifiP2PController

- (void)dataSessionRequestStarted:(id)a3
{
  v4 = _os_activity_create((void *)&_mh_execute_header, "dataSessionRequestStarted:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController dataSessionRequestStarted:]", 455, self, @"Data session started", v5, v6, v8);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017240;
  block[3] = &unk_1000549A8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _os_activity_create((void *)&_mh_execute_header, "dataSession:confirmedForPeerDataAddress:serviceSepcificInfo:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (self) {
    wifiDataSession = self->_wifiDataSession;
  }
  else {
    wifiDataSession = 0;
  }
  v13 = wifiDataSession;
  [v10 protocolType];
  [v10 servicePort];
  v20 = [v10 hostname];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(WifiP2PController *)"PeerAddr=%@ dataSession:serviceSpecificInfo={type=%ld confirmedForPeerDataAddress:port=%d serviceSpecificInfo:host=%@}}""], v14, v15, (uint64_t)v9);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017404;
  block[3] = &unk_100054D58;
  block[4] = self;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  dispatch_async(workQueue, block);
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "dataSession:failedToStartWithError:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController dataSession:failedToStartWithError:]", 495, self, @"Data session fail to start, error=%ld", v7, v8, a4);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000176C4;
  block[3] = &unk_1000549A8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "dataSession:terminatedWithReason:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController dataSession:terminatedWithReason:]", 510, self, @"Data session terminated, reason=%ld", v7, v8, a4);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000177C0;
  block[3] = &unk_100054D80;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(workQueue, block);
}

- (void)publisherStarted:(id)a3
{
  v4 = _os_activity_create((void *)&_mh_execute_header, "publisherStarted:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisherStarted:]", 525, self, @"Publisher started", v5, v6, v8);
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017A50;
  block[3] = &unk_1000549A8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "publisher:failedToStartWithError:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisher:failedToStartWithError:]", 538, self, @"Publisher start failure, reason=%ld", v7, v8, a4);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017BB4;
  block[3] = &unk_100054D80;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(workQueue, block);
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "publisher:terminatedWithReason:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisher:terminatedWithReason:]", 554, self, @"Publisher terminated, reason=%ld", v7, v8, a4);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E58;
  block[3] = &unk_1000549A8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "publisher:receivedMessage:fromSubscriberID:subscriberAddress:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisher:receivedMessage:fromSubscriberID:subscriberAddress:]", 566, self, @"Recv msg %@, subscriberID=%ld, address=%@", v11, v12, (uint64_t)v9);
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = _os_activity_create((void *)&_mh_execute_header, "publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  [v10 protocolType];
  [v10 servicePort];
  id v17 = [v10 hostname];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 577, self, @"handle=%@, localInterfaceIdx=%u, serviceSpecificInfo={type=%ld, port=%d, host=%@}", v12, v13, (uint64_t)v9);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000180A8;
  block[3] = &unk_100054DA8;
  block[4] = self;
  id v19 = v9;
  unsigned int v21 = a5;
  id v20 = v10;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(workQueue, block);
}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "publisher:dataTerminatedForHandle:reason:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisher:dataTerminatedForHandle:reason:]", 607, self, @"Publisher data session terminated; handle=%@, reason=%ld",
    v9,
    v10,
    (uint64_t)v7);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018398;
  block[3] = &unk_100054D80;
  block[4] = self;
  void block[5] = a5;
  dispatch_async(workQueue, block);
}

- (void)subscriberStarted:(id)a3
{
  v4 = _os_activity_create((void *)&_mh_execute_header, "subscriberStarted:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);
  os_activity_scope_leave(&v8);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController subscriberStarted:]", 622, self, @"Subscriber started", v5, v6, v8.opaque[0]);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained wifiP2PController:self didStart:0];
  }
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "subscriber:failedToStartWithError:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController subscriber:failedToStartWithError:]", 632, self, @"Subscriber start failure, reason=%ld", v7, v8, a4);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000186F4;
  block[3] = &unk_100054D80;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(workQueue, block);
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  unsigned int v5 = a4;
  uint64_t v7 = _os_activity_create((void *)&_mh_execute_header, "subscriber:lostDiscoveryResultForPublishID:address:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController subscriber:lostDiscoveryResultForPublishID:address:]", 649, self, @"Subscriber lost discovery result, publishID=%ld", v8, v9, v5);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018984;
  block[3] = &unk_1000549A8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "subscriber:receivedDiscoveryResult:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[WifiP2PController subscriber:receivedDiscoveryResult:]", 666, self, @"Subscriber recv discovery result:%@", v7, v8, (uint64_t)v5);
  id v9 = v5;
  uint64_t v10 = v9;
  if (self)
  {
    workQueue = self->_workQueue;
    state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
    state.opaque[1] = 3221225472;
    uint64_t v13 = sub_1000158D0;
    uint64_t v14 = &unk_100054C50;
    id v15 = self;
    id v16 = v9;
    dispatch_async(workQueue, &state);
  }
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  uint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "subscriber:terminatedWithReason:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController subscriber:terminatedWithReason:]", 673, self, @"Subscriber terminated, reason=%ld", v7, v8, a4);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018CFC;
  block[3] = &unk_1000549A8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_targetIPAddr, 0);
  objc_storeStrong((id *)&self->_wifiDataSession, 0);
  objc_storeStrong((id *)&self->_wifiSubscriber, 0);
  objc_storeStrong((id *)&self->_datapathHandle, 0);
  objc_storeStrong((id *)&self->_wifiPublisher, 0);
  objc_storeStrong((id *)&self->_peerDHInfo, 0);
  objc_storeStrong((id *)&self->_securityInfo, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end