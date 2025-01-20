@interface MSMSASServiceConnection
- (NSMutableDictionary)XPCForegroundRequestByPersonID;
- (NSMutableDictionary)foregroundPingTimerByPersonID;
- (id)workQueue;
- (void)XPCNSServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5;
- (void)XPCNSServiceConnectionDidDisconnect:(id)a3;
- (void)_foregroundPingTimerDidExpire:(id)a3;
- (void)_handleFocusAlbum:(id)a3;
- (void)_handleForegroundPing:(id)a3 request:(id)a4;
- (void)setForegroundPingTimerByPersonID:(id)a3;
- (void)setXPCForegroundRequestByPersonID:(id)a3;
@end

@implementation MSMSASServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCForegroundRequestByPersonID, 0);

  objc_storeStrong((id *)&self->_foregroundPingTimerByPersonID, 0);
}

- (void)setXPCForegroundRequestByPersonID:(id)a3
{
}

- (void)setForegroundPingTimerByPersonID:(id)a3
{
}

- (void)XPCNSServiceConnectionDidDisconnect:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A530;
  v4[3] = &unk_100018BD8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)XPCNSServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 message];
  [v9 objectForKey:kMSASFunctionNameKey];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A700;
  block[3] = &unk_100018C78;
  block[4] = self;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  id v13 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleFocusAlbum:(id)a3
{
  id v3 = a3;
  v4 = MSASPlatform();
  id v7 = [v4 albumSharingDaemon];

  id v5 = [v3 objectForKey:kMSASAlbumGUIDKey];
  v6 = [v3 objectForKey:kMSASPersonIDKey];

  [v7 setFocusAlbumGUID:v5 forPersonID:v6];
}

- (void)_foregroundPingTimerDidExpire:(id)a3
{
  id v4 = a3;
  id v5 = MSASPlatform();
  v6 = [v5 albumSharingDaemon];

  id v7 = [v4 userInfo];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Dropping foreground assertion for personID “%@”", (uint8_t *)&v12, 0x16u);
  }
  [v6 didEndForegroundFocusForPersonID:v7];
  id v8 = [(MSMSASServiceConnection *)self XPCForegroundRequestByPersonID];
  v9 = [v8 objectForKey:v7];

  if (v9)
  {
    [v9 sendReply:0];
    id v10 = [(MSMSASServiceConnection *)self XPCForegroundRequestByPersonID];
    [v10 removeObjectForKey:v7];
  }
  id v11 = [(MSMSASServiceConnection *)self foregroundPingTimerByPersonID];
  [v11 removeObjectForKey:v7];

  [v4 invalidate];
}

- (void)_handleForegroundPing:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:kMSASPersonIDKey];
  if (v8)
  {
    v9 = [v6 objectForKey:kMSASIsUIForegroundKey];
    unsigned int v10 = [v9 BOOLValue];

    id v11 = MSASPlatform();
    int v12 = [v11 albumSharingDaemon];

    id v13 = [v12 delegate];
    [v13 MSAlbumSharingDaemonDidUnidleMomentarily:v12];

    if (v10)
    {
      __int16 v14 = [(MSMSASServiceConnection *)self foregroundPingTimerByPersonID];
      id v15 = [v14 objectForKey:v8];

      if (v15)
      {
        id v16 = +[NSDate dateWithTimeIntervalSinceNow:8.0];
        [v15 setFireDate:v16];
      }
      else
      {
        id v15 = +[NSTimer timerWithTimeInterval:self target:"_foregroundPingTimerDidExpire:" selector:v8 userInfo:0 repeats:8.0];
        id v17 = [(MSMSASServiceConnection *)self foregroundPingTimerByPersonID];
        [v17 setObject:v15 forKey:v8];

        [v12 didBeginForegroundFocusForPersonID:v8];
        id v16 = +[NSRunLoop currentRunLoop];
        [v16 addTimer:v15 forMode:NSRunLoopCommonModes];
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 138543618;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%{public}@: Holding foreground assertion for personID “%@”", (uint8_t *)&v21, 0x16u);
      }
      id v18 = [(MSMSASServiceConnection *)self XPCForegroundRequestByPersonID];
      v19 = [v18 objectForKey:v8];

      if (v19) {
        [v19 sendReply:0];
      }
      v20 = [(MSMSASServiceConnection *)self XPCForegroundRequestByPersonID];
      [v20 setObject:v7 forKey:v8];

      [v12 retryOutstandingActivities];
    }
  }
}

- (id)workQueue
{
  if (qword_10001E3A0 != -1) {
    dispatch_once(&qword_10001E3A0, &stru_100018B60);
  }
  v2 = (void *)qword_10001E3A8;

  return v2;
}

- (NSMutableDictionary)XPCForegroundRequestByPersonID
{
  XPCForegroundRequestByPersonID = self->_XPCForegroundRequestByPersonID;
  if (!XPCForegroundRequestByPersonID)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_XPCForegroundRequestByPersonID;
    self->_XPCForegroundRequestByPersonID = v4;

    XPCForegroundRequestByPersonID = self->_XPCForegroundRequestByPersonID;
  }

  return XPCForegroundRequestByPersonID;
}

- (NSMutableDictionary)foregroundPingTimerByPersonID
{
  foregroundPingTimerByPersonID = self->_foregroundPingTimerByPersonID;
  if (!foregroundPingTimerByPersonID)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_foregroundPingTimerByPersonID;
    self->_foregroundPingTimerByPersonID = v4;

    foregroundPingTimerByPersonID = self->_foregroundPingTimerByPersonID;
  }

  return foregroundPingTimerByPersonID;
}

@end