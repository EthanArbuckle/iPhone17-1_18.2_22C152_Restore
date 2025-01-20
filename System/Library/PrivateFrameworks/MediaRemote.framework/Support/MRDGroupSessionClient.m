@interface MRDGroupSessionClient
- (MRDGroupSession)session;
- (MRDGroupSessionClient)initWithConnection:(id)a3 bundleID:(id)a4;
- (MSVBlockGuard)connectTimeoutGuard;
- (NSString)bundleID;
- (NSString)description;
- (NSString)sessionIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)client;
- (id)infoFromGroupSession:(id)a3;
- (id)initialStateFromSession:(id)a3 token:(id)a4;
- (id)transportParticipants:(id)a3 forSession:(id)a4;
- (int64_t)type;
- (void)connectToDiscoveryWithReply:(id)a3;
- (void)connectToSession:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)manager:(id)a3 activeSessionDidChange:(id)a4;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)reevaluatePendingStateFromSession:(id)a3;
- (void)session:(id)a3 approvePendingParticipant:(id)a4 reply:(id)a5;
- (void)session:(id)a3 denyPendingParticipant:(id)a4 reply:(id)a5;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didUpdateMembers:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4;
- (void)session:(id)a3 removeAllParticipantsWithReply:(id)a4;
- (void)session:(id)a3 removeParticipant:(id)a4 reply:(id)a5;
- (void)sessionDidEnterLowPowerMode:(id)a3;
- (void)sessionDidExitLowPowerMode:(id)a3;
- (void)setConnectTimeoutGuard:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRDGroupSessionClient

- (MRDGroupSessionClient)initWithConnection:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRDGroupSessionClient;
  v9 = [(MRDGroupSessionClient *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_bundleID, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = +[MRDMediaRemoteServer server];
    v13 = [v12 groupSessionServer];
    v14 = [v13 messageQueue];
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.MRDGroupSessionClient.queue", v11, v14);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;
  }
  return v10;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p bundleID=%@>", objc_opt_class(), self, self->_bundleID];
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] <%p> Dealloc.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDGroupSessionClient;
  [(MRDGroupSessionClient *)&v4 dealloc];
}

- (id)client
{
  v3 = [(MRDGroupSessionClient *)self connection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000224FC;
  v6[3] = &unk_100415F80;
  v6[4] = self;
  objc_super v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000226A0;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didUpdateMembers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022800;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 4)
  {
    id v7 = [(MRDGroupSessionClient *)self queue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022948;
    v8[3] = &unk_1004158D8;
    id v9 = v6;
    id v10 = self;
    dispatch_async(v7, v8);
  }
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022ACC;
  block[3] = &unk_1004159B8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022DC0;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)sessionDidEnterLowPowerMode:(id)a3
{
  id v4 = a3;
  v5 = [(MRDGroupSessionClient *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022EE4;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sessionDidExitLowPowerMode:(id)a3
{
  id v4 = a3;
  v5 = [(MRDGroupSessionClient *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023008;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(MRDGroupSessionClient *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002312C;
  v8[3] = &unk_1004158D8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v5];
  id v7 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023280;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
  id v5 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023390;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v5];

  id v7 = [(MRDGroupSessionClient *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000234D4;
  v9[3] = &unk_1004158D8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  id v5 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000235CC;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)manager:(id)a3 activeSessionDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v5];
  id v7 = [(MRDGroupSessionClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023720;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)connectToSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  [(MRDGroupSessionClient *)self setType:0];
  [(MRDGroupSessionClient *)self setSessionIdentifier:v6];
  id v8 = +[MRDMediaRemoteServer server];
  id v9 = [v8 groupSessionServer];
  v46 = [v9 sessionManager];

  id v10 = [v46 session];
  id v11 = +[MRDMediaRemoteServer server];
  id v12 = [v11 routingServer];
  id v13 = [v12 systemEndpointController];

  id v14 = [v13 activeOutputDeviceUID:0];
  dispatch_queue_t v15 = [v13 originClientForDeviceUID:v14];
  v16 = [v15 deviceInfo];
  v17 = [v16 groupSessionToken];
  id v45 = [v17 copy];

  objc_super v18 = +[MRDMediaRemoteServer server];
  v19 = [v18 nowPlayingServer];

  v20 = [v19 originClientForDeviceUID:v6];
  v44 = [v20 deviceInfo];

  id v21 = [v10 identifier];
  if (v21 == v6)
  {

    goto LABEL_11;
  }
  v22 = v21;
  unsigned int v23 = [v21 isEqual:v6];

  if (v23)
  {
LABEL_11:
    [(MRDGroupSessionClient *)self setSession:v10];
    [v10 addObserver:self];
    v34 = [v10 joinToken];
    v35 = [(MRDGroupSessionClient *)self initialStateFromSession:v10 token:v34];

    v36 = _MRLogForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_10032A538((uint64_t)v35, self);
    }

    v7[2](v7, v35, 0);
    goto LABEL_14;
  }
  v24 = [v45 sessionIdentifier];
  if ([v24 isEqualToString:v6])
  {
    v25 = [v45 sharedSecret];

    if (v25)
    {
      v26 = _MRLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(MRDGroupSessionClient *)self sessionIdentifier];
        *(_DWORD *)buf = 138412290;
        v56 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] Connecting to pending session: %@", buf, 0xCu);
      }
      [v46 addObserver:self];
      objc_initWeak(&location, self);
      id v28 = objc_alloc((Class)MSVBlockGuard);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100023DE0;
      v47[3] = &unk_100416170;
      objc_copyWeak(&v51, &location);
      id v48 = v6;
      id v49 = v46;
      id v50 = v10;
      v29 = (MSVBlockGuard *)[v28 initWithTimeout:v47 interruptionHandler:30.0];
      connectTimeoutGuard = self->_connectTimeoutGuard;
      self->_connectTimeoutGuard = v29;

      v31 = [(MRDGroupSessionClient *)self initialStateFromSession:0 token:v45];
      v32 = _MRLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = [(MRDGroupSessionClient *)self connection];
        sub_10032A704((uint64_t)v31, v33, buf, v32);
      }

      v7[2](v7, v31, 0);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
      goto LABEL_14;
    }
  }
  else
  {
  }
  if ([v44 hasPlaceholderGroupSession])
  {
    v37 = (id *)[objc_alloc((Class)MRGroupSessionToken) initWithDeviceInfo:v44];
    v53[0] = _MRGroupSessionTokenInitialSyncKey;
    v43 = v37;
    v38 = [v37 data];
    v53[1] = _MRGroupSessionPlaceholderInitialSyncKey;
    v54[0] = v38;
    v54[1] = &__kCFBooleanTrue;
    v39 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];

    v40 = _MRLogForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_10032A5D8((uint64_t)v39, self);
    }

    v7[2](v7, v39, 0);
  }
  else
  {
    v41 = _MRLogForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10032A678(self);
    }

    v42 = +[NSError msv_errorWithDomain:MRGroupSessionError code:2 debugDescription:@"Could not find session for provided identifier."];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v42);
  }
LABEL_14:
}

- (id)initialStateFromSession:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 members];
  id v9 = +[NSSet setWithArray:v8];

  id v10 = [v6 participants];
  id v11 = [(MRDGroupSessionClient *)self transportParticipants:v10 forSession:v6];

  id v12 = [v6 pendingParticipants];
  id v13 = objc_msgSend(v12, "msv_compactMap:", &stru_100416190);
  id v14 = +[NSSet setWithArray:v13];

  dispatch_queue_t v15 = +[NSMutableDictionary dictionary];
  if (v6)
  {
    if ([v6 isLowPowerMode]) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 3;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  v17 = +[NSNumber numberWithInteger:v16];
  [v15 setObject:v17 forKeyedSubscript:_MRGroupSessionStateInitialSyncKey];

  [v15 setObject:v11 forKeyedSubscript:_MRGroupSessionParticipantsInitialSyncKey];
  [v15 setObject:v14 forKeyedSubscript:_MRGroupSessionPendingParticipantsInitialSyncKey];
  [v15 setObject:v9 forKeyedSubscript:_MRGroupSessionMembersInitialSyncKey];
  objc_super v18 = [v7 data];

  [v15 setObject:v18 forKeyedSubscript:_MRGroupSessionTokenInitialSyncKey];

  return v15;
}

- (void)session:(id)a3 approvePendingParticipant:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(MRDGroupSessionClient *)self session];
  id v12 = [v11 identifier];
  if (v12 == v8)
  {
  }
  else
  {
    id v13 = v12;
    unsigned __int8 v14 = [v8 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      dispatch_queue_t v15 = +[NSError msv_errorWithDomain:MRGroupSessionError code:2 debugDescription:@"Session identifier does not match connected session."];
      v10[2](v10, v15);

      goto LABEL_8;
    }
  }
  uint64_t v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v9 identifier];
    objc_super v18 = [(MRDGroupSessionClient *)self bundleID];
    int v20 = 138412546;
    id v21 = v17;
    __int16 v22 = 2112;
    unsigned int v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] Handling approve pending participant %@ from client: %@", (uint8_t *)&v20, 0x16u);
  }
  v19 = [v9 identifier];
  [v11 approvePendingParticipant:v19];

  v10[2](v10, 0);
LABEL_8:
}

- (void)session:(id)a3 denyPendingParticipant:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(MRDGroupSessionClient *)self session];
  id v12 = [v11 identifier];
  if (v12 == v8)
  {
  }
  else
  {
    id v13 = v12;
    unsigned __int8 v14 = [v8 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      dispatch_queue_t v15 = +[NSError msv_errorWithDomain:MRGroupSessionError code:2 debugDescription:@"Session identifier does not match connected session."];
      v10[2](v10, v15);

      goto LABEL_8;
    }
  }
  uint64_t v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v9 identifier];
    objc_super v18 = [(MRDGroupSessionClient *)self bundleID];
    int v20 = 138412546;
    id v21 = v17;
    __int16 v22 = 2112;
    unsigned int v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] Handling deny pending participant %@ from client: %@", (uint8_t *)&v20, 0x16u);
  }
  v19 = [v9 identifier];
  [v11 denyPendingParticipant:v19];

  v10[2](v10, 0);
LABEL_8:
}

- (void)session:(id)a3 removeParticipant:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(MRDGroupSessionClient *)self session];
  id v12 = [v11 identifier];
  if (v12 == v8)
  {
  }
  else
  {
    id v13 = v12;
    unsigned __int8 v14 = [v8 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      dispatch_queue_t v15 = +[NSError msv_errorWithDomain:MRGroupSessionError code:2 debugDescription:@"Session identifier does not match connected session."];
      v10[2](v10, v15);

      goto LABEL_8;
    }
  }
  uint64_t v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(MRDGroupSessionClient *)self bundleID];
    int v18 = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] Handling remove participant %@ from client: %@", (uint8_t *)&v18, 0x16u);
  }
  [v11 revokeAutoApprovalForParticipant:v9];
  [v11 removeParticipant:v9];
  v10[2](v10, 0);
LABEL_8:
}

- (void)session:(id)a3 removeAllParticipantsWithReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(MRDGroupSessionClient *)self session];
  id v9 = [v8 identifier];
  if (v9 == v6)
  {
  }
  else
  {
    id v10 = v9;
    unsigned __int8 v11 = [v6 isEqual:v9];

    if ((v11 & 1) == 0)
    {
      id v12 = +[NSError msv_errorWithDomain:MRGroupSessionError code:2 debugDescription:@"Session identifier does not match connected session."];
      v7[2](v7, v12);

      goto LABEL_8;
    }
  }
  id v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v14 = [(MRDGroupSessionClient *)self bundleID];
    int v15 = 138412290;
    uint64_t v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] Handling remove all command from client: %@", (uint8_t *)&v15, 0xCu);
  }
  [v8 revokeAutoApprovalForAllParticipants];
  [v8 removeAllParticipants];
  v7[2](v7, 0);
LABEL_8:
}

- (void)connectToDiscoveryWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  [(MRDGroupSessionClient *)self setType:1];
  id v5 = +[MRDMediaRemoteServer server];
  id v6 = [v5 groupSessionServer];
  id v10 = [v6 sessionManager];

  [v10 addObserver:self];
  id v7 = [v10 discoveredSessions];
  id v8 = [v10 session];
  id v9 = [(MRDGroupSessionClient *)self infoFromGroupSession:v8];
  v4[2](v4, v7, v9);
}

- (void)reevaluatePendingStateFromSession:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionClient *)self sessionIdentifier];
  id v6 = [v4 identifier];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [(MRDGroupSessionClient *)self connectTimeoutGuard];
    unsigned int v9 = [v8 disarm];

    id v10 = _MRLogForCategory();
    unsigned __int8 v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(MRDGroupSessionClient *)self sessionIdentifier];
        int v19 = 138412290;
        __int16 v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionClient] Pending session: %@ joined", (uint8_t *)&v19, 0xCu);
      }
      id v13 = +[MRDMediaRemoteServer server];
      unsigned __int8 v14 = [v13 groupSessionServer];
      unsigned __int8 v11 = [v14 sessionManager];

      [v11 removeObserver:self];
      [(MRDGroupSessionClient *)self setSession:v4];
      [v4 addObserver:self];
      int v15 = [v4 joinToken];
      uint64_t v16 = [(MRDGroupSessionClient *)self initialStateFromSession:v4 token:v15];

      v17 = [(MRDGroupSessionClient *)self client];
      int v18 = [v4 identifier];
      [v17 session:v18 didConnectWithInitialState:v16];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_10032A7E8(self);
    }
  }
  else
  {
    unsigned __int8 v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10032A870((uint64_t)v4, self, v11);
    }
  }
}

- (id)transportParticipants:(id)a3 forSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [v6 localParticipant];
  id v8 = [v6 leader];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100024EE4;
  v19[3] = &unk_1004161B8;
  id v9 = v7;
  id v20 = v9;
  __int16 v22 = &v23;
  id v10 = v8;
  id v21 = v10;
  unsigned __int8 v11 = objc_msgSend(v5, "msv_compactMap:", v19);
  id v12 = +[NSMutableSet setWithArray:v11];

  if (!*((unsigned char *)v24 + 24))
  {
    id v13 = objc_alloc((Class)MRCodableGroupSessionParticipant);
    unsigned __int8 v14 = [v9 identifier];
    int v15 = [v9 identity];
    id v16 = objc_msgSend(v13, "initWithIdentifier:identity:connected:guest:hidden:", v14, v15, 1, objc_msgSend(v9, "guest"), objc_msgSend(v9, "hidden"));

    [v16 setLocal:1];
    objc_msgSend(v16, "setHost:", objc_msgSend(v6, "isHosted"));
    [v12 addObject:v16];
  }
  id v17 = [v12 copy];

  _Block_object_dispose(&v23, 8);

  return v17;
}

- (id)infoFromGroupSession:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (MRDGroupSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (MRDGroupSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (MSVBlockGuard)connectTimeoutGuard
{
  return self->_connectTimeoutGuard;
}

- (void)setConnectTimeoutGuard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectTimeoutGuard, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end