@interface MRDGroupSessionTransportConnection
- (BOOL)hasAccessToPlayerPath:(id)a3;
- (BOOL)isAllowedToSendCommand:(unsigned int)a3;
- (BOOL)isAllowedToSendMessageType:(unint64_t)a3;
- (BOOL)isValid;
- (MRDGroupSession)groupSession;
- (MRDGroupSessionParticipant)participant;
- (MRDGroupSessionTransportConnection)initWithGroupSession:(id)a3 participant:(id)a4;
- (NSString)description;
- (id)error;
- (id)exportOutputDevice:(id)a3 endpoint:(id)a4;
- (id)outputDeviceForGroupSession:(id)a3;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)closeWithError:(id)a3;
- (void)leaveSessionIfNeeded;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didReceiveMessageData:(id)a4 fromParticipant:(id)a5;
@end

@implementation MRDGroupSessionTransportConnection

- (MRDGroupSessionTransportConnection)initWithGroupSession:(id)a3 participant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MRDGroupSessionTransportConnection;
  v8 = [(MRDGroupSessionTransportConnection *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_groupSession, v6);
    objc_storeStrong((id *)&v9->_participant, a4);
  }
  v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionTransportConnection] %@ init", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v9->_groupSession);
  [WeakRetained addObserver:v9];

  return v9;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);
  v5 = [WeakRetained identifier];
  id v6 = +[NSString stringWithFormat:@"<%@:%p session=%@ participant=%@>", v3, self, v5, self->_participant];

  return (NSString *)v6;
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSError *)v2->_error copy];
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDGroupSessionTransportConnection *)self groupSession];
  id v7 = [(MRDGroupSessionTransportConnection *)self participant];
  v11 = v7;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  [v6 sendMessageData:v5 toParticipants:v8];

  id v9 = [v5 length];
  return (unint64_t)v9;
}

- (void)closeWithError:(id)a3
{
  id v5 = a3;
  id v6 = [(MRDGroupSessionTransportConnection *)self error];

  id v7 = _MRLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = [(MRDGroupSessionTransportConnection *)self error];
      int v15 = 138543874;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionTransportConnection] %{public}@ Ignoring request to close connection with error: %{public}@, because we already had error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (v8)
    {
      int v15 = 138543618;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionTransportConnection] %{public}@ Got request to close connection with error: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    v10 = self;
    objc_sync_enter(v10);
    objc_storeStrong((id *)&v10->_error, a3);
    objc_sync_exit(v10);

    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_groupSession);
      id v12 = [WeakRetained state];

      if (v12 == (id)3)
      {
        [(MRDGroupSessionTransportConnection *)v10 leaveSessionIfNeeded];
      }
      else
      {
        objc_super v13 = _MRLogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = sub_10017B008((unint64_t)v12);
          int v15 = 138412546;
          v16 = v10;
          __int16 v17 = 2114;
          id v18 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionTransportConnection] %@ Not destroying session because state is: %{public}@", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    [(MRDGroupSessionTransportConnection *)v10 _notifyDelegateDidCloseWithError:v5];
  }
}

- (BOOL)isValid
{
  return 1;
}

- (void)leaveSessionIfNeeded
{
  p_groupSession = &self->_groupSession;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);
  unsigned __int8 v5 = [WeakRetained isHosted];

  if ((v5 & 1) == 0)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained((id *)p_groupSession);
      int v12 = 138543618;
      objc_super v13 = self;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionTransportConnection] %{public}@ Leaving session due to client disconnect: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v8 = +[MRDMediaRemoteServer server];
    id v9 = [v8 groupSessionServer];
    v10 = [v9 sessionManager];

    id v11 = objc_loadWeakRetained((id *)p_groupSession);
    [v10 leaveRemoteControlGroupSession:v11];
  }
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 3)
  {
    id v9 = v6;
    if (a4 == 4)
    {
      id v7 = +[NSError msv_errorWithDomain:MRGroupSessionError code:1 debugDescription:@"Session changed state to invalidated"];
    }
    else
    {
      id v7 = [objc_alloc((Class)NSError) initWithMRError:105 description:@"Session disconnected"];
    }
    BOOL v8 = v7;
    [(MRDGroupSessionTransportConnection *)self closeWithError:v7];

    id v6 = v9;
  }
}

- (void)session:(id)a3 didReceiveMessageData:(id)a4 fromParticipant:(id)a5
{
  id v11 = a4;
  id v7 = [a5 identifier];
  BOOL v8 = [(MRDGroupSessionTransportConnection *)self participant];
  id v9 = [v8 identifier];
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10) {
    [(MRDGroupSessionTransportConnection *)self _notifyDelegateDidReceiveData:v11];
  }
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  id v5 = a3;
  if ([v5 isLocalDevice])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);
    id v7 = [(MRDGroupSessionTransportConnection *)self outputDeviceForGroupSession:WeakRetained];
    id v8 = [v7 mergingVolumeFrom:v5];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)outputDeviceForGroupSession:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithGroupSession:v3];

  return v4;
}

- (BOOL)hasAccessToPlayerPath:(id)a3
{
  id v3 = [a3 client];
  unsigned __int8 v4 = [v3 isSystemMediaApplication];

  return v4;
}

- (BOOL)isAllowedToSendMessageType:(unint64_t)a3
{
  if (qword_10047E108 != -1) {
    dispatch_once(&qword_10047E108, &stru_10041B4F8);
  }
  unsigned __int8 v4 = (void *)qword_10047E100;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

- (BOOL)isAllowedToSendCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_10047E118 != -1) {
    dispatch_once(&qword_10047E118, &stru_10041B518);
  }
  unsigned __int8 v4 = (void *)qword_10047E110;
  id v5 = +[NSNumber numberWithUnsignedInt:v3];
  LOBYTE(v4) = [v4 containsObject:v5] ^ 1;

  return (char)v4;
}

- (MRDGroupSession)groupSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);

  return (MRDGroupSession *)WeakRetained;
}

- (MRDGroupSessionParticipant)participant
{
  return self->_participant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_destroyWeak((id *)&self->_groupSession);

  objc_storeStrong((id *)&self->_error, 0);
}

@end