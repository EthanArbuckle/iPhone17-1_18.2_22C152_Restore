@interface MRXPCConnectionMonitor
- (BOOL)_canSendMessage;
- (BOOL)pendingBarrierCompletion;
- (MRXPCConnectionMonitor)initWithConnection:(id)a3 label:(id)a4;
- (MRXPCConnectionMonitor)initWithXPCConnection:(id)a3 label:(id)a4;
- (MRXPCConnectionMonitorDelegate)delegate;
- (NSDate)lastMessageSentDate;
- (NSDate)lastStatusChangeDate;
- (NSDate)lastStatusCheckDate;
- (NSString)bundleID;
- (NSString)label;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)calloutQueue;
- (OS_xpc_object)connection_t;
- (id)_initWithLabel:(id)a3;
- (id)debugDescription;
- (id)description;
- (int)pid;
- (unint64_t)currentMessageCount;
- (unint64_t)status;
- (unint64_t)totalMessageCount;
- (void)_checkConnectionStatus;
- (void)_onCalloutQueue_notifyStatusDidChange:(unint64_t)a3;
- (void)canSendMessage:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnection_t:(id)a3;
- (void)setCurrentMessageCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastMessageSentDate:(id)a3;
- (void)setLastStatusChangeDate:(id)a3;
- (void)setLastStatusCheckDate:(id)a3;
- (void)setPendingBarrierCompletion:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTotalMessageCount:(unint64_t)a3;
@end

@implementation MRXPCConnectionMonitor

- (id)_initWithLabel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRXPCConnectionMonitor;
  v6 = [(MRXPCConnectionMonitor *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaRemote.connectionMonitor", v7);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_label, a3);
  }

  return v6;
}

- (MRXPCConnectionMonitor)initWithXPCConnection:(id)a3 label:(id)a4
{
  v7 = (_xpc_connection_s *)a3;
  dispatch_queue_t v8 = [(MRXPCConnectionMonitor *)self _initWithLabel:a4];
  v9 = (MRXPCConnectionMonitor *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 5, a3);
    v9->_pid = xpc_connection_get_pid(v7);
    xpc_connection_get_audit_token();
    memset(v13, 0, sizeof(v13));
    uint64_t v10 = sub_100008ACC(v13);
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v10;
  }
  return v9;
}

- (void)setDelegate:(id)a3
{
}

- (MRXPCConnectionMonitor)initWithConnection:(id)a3 label:(id)a4
{
  id v7 = a3;
  dispatch_queue_t v8 = [(MRXPCConnectionMonitor *)self _initWithLabel:a4];
  v9 = (MRXPCConnectionMonitor *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 4, a3);
    v9->_pid = [v7 processIdentifier];
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    uint64_t v10 = sub_100008ACC(v13);
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v10;
  }
  return v9;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRXPCConnectionMonitor *)self label];
  id v6 = [v3 initWithFormat:@"<%@ %p : %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = +[NSMutableString stringWithFormat:@"<%@ %p {\n", objc_opt_class(), v2];
  unint64_t status = v2->_status;
  CFStringRef v5 = @"?";
  if (status == 1) {
    CFStringRef v5 = @"Suspended";
  }
  if (status) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"Running";
  }
  id v7 = v6;
  [v3 appendFormat:@"    unint64_t status = %@\n", v7];

  objc_msgSend(v3, "appendFormat:", @"    currentMessageCount = %lu\n", v2->_currentMessageCount);
  objc_msgSend(v3, "appendFormat:", @"    totalMessageCount = %lu\n", v2->_totalMessageCount);
  lastMessageSentDate = v2->_lastMessageSentDate;
  if (lastMessageSentDate)
  {
    [(NSDate *)lastMessageSentDate timeIntervalSinceNow];
    objc_msgSend(v3, "appendFormat:", @"    lastMessageSent = %f seconds ago\n", -v9);
  }
  lastStatusCheckDate = v2->_lastStatusCheckDate;
  if (lastStatusCheckDate)
  {
    [(NSDate *)lastStatusCheckDate timeIntervalSinceNow];
    objc_msgSend(v3, "appendFormat:", @"    lastStatusCheck = %f seconds ago\n", -v11);
  }
  lastStatusChangeDate = v2->_lastStatusChangeDate;
  if (lastStatusChangeDate)
  {
    [(NSDate *)lastStatusChangeDate timeIntervalSinceNow];
    objc_msgSend(v3, "appendFormat:", @"    lastStatusChange = %f seconds ago\n", -v13);
  }
  if (v2->_pendingBarrierCompletion) {
    [v3 appendString:@"    pendingBarrierCompletion = YES\n"];
  }
  v14 = +[MRUserSettings currentSettings];
  id v15 = [v14 checkXPCConnectionStatusDefaultInterval];
  v16 = +[MRUserSettings currentSettings];
  [v16 checkXPCConnectionStatusDefaultResponseTimeout];
  objc_msgSend(v3, "appendFormat:", @"    params = {%lu x %f}\n", v15, v17);

  [v3 appendFormat:@"}>\n"];
  objc_sync_exit(v2);

  return v3;
}

- (NSString)label
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@-%d", self->_label, self->_bundleID, self->_pid];

  return (NSString *)v2;
}

- (void)canSendMessage:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100130610;
  v7[3] = &unk_100417A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)calloutQueue, v7);
}

- (BOOL)_canSendMessage
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_currentMessageCount + 1;
  v2->_currentMessageCount = v3;
  id v4 = +[MRUserSettings currentSettings];
  id v5 = [v4 checkXPCConnectionStatusDefaultInterval];

  uint64_t v6 = +[NSDate now];
  lastMessageSentDate = v2->_lastMessageSentDate;
  v2->_lastMessageSentDate = (NSDate *)v6;

  unint64_t status = v2->_status;
  ++v2->_totalMessageCount;
  objc_sync_exit(v2);

  if ((id)v3 == v5) {
    [(MRXPCConnectionMonitor *)v2 _checkConnectionStatus];
  }
  return status == 0;
}

- (void)_checkConnectionStatus
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)MRBlockGuard);
  id v4 = +[MRUserSettings currentSettings];
  [v4 checkXPCConnectionStatusDefaultResponseTimeout];
  double v6 = v5;
  calloutQueue = self->_calloutQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001309E4;
  v25[3] = &unk_100416C88;
  objc_copyWeak(&v26, &location);
  id v8 = [v3 initWithTimeout:@"XPCConnectionBarrier" reason:calloutQueue queue:v25 handler:v6];

  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100130A28;
  v22 = &unk_1004158D8;
  v23 = self;
  id v9 = v8;
  id v24 = v9;
  uint64_t v10 = objc_retainBlock(&v19);
  double v11 = self;
  objc_sync_enter(v11);
  if (v11->_pendingBarrierCompletion)
  {
    objc_sync_exit(v11);
  }
  else
  {
    v11->_pendingBarrierCompletion = 1;
    uint64_t v12 = +[NSDate now];
    lastStatusCheckDate = v11->_lastStatusCheckDate;
    v11->_lastStatusCheckDate = (NSDate *)v12;

    objc_sync_exit(v11);
    v14 = +[MRUserSettings currentSettings];
    unsigned int v15 = [v14 verboseConnectionMonitorLogging];

    if (v15)
    {
      v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[ConnectionMonitor] Checking connection %@", buf, 0xCu);
      }
    }
    connection = v11->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection scheduleSendBarrierBlock:v10];
    }
    else
    {
      connection_t = v11->_connection_t;
      if (connection_t) {
        xpc_connection_send_barrier(connection_t, v10);
      }
    }
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)_onCalloutQueue_notifyStatusDidChange:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_calloutQueue);
  double v5 = self;
  objc_sync_enter(v5);
  double v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"?";
    if (a3 == 1) {
      id v7 = @"Suspended";
    }
    if (!a3) {
      id v7 = @"Running";
    }
    id v8 = v7;
    [(NSDate *)v5->_lastStatusChangeDate timeIntervalSinceNow];
    *(_DWORD *)buf = 138412802;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v5;
    __int16 v32 = 2048;
    double v33 = -v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[ConnectionMonitor] Updated connectionStatus = %@ for %@ after %lf seconds", buf, 0x20u);
  }
  v5->_unint64_t status = a3;
  uint64_t v10 = +[NSDate now];
  lastStatusChangeDate = v5->_lastStatusChangeDate;
  v5->_lastStatusChangeDate = (NSDate *)v10;

  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  objc_sync_exit(v5);

  if (a3)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained connectionDidInvalidate:v5];
    }
  }
  else
  {
    double v13 = +[NSDate now];
    v14 = [MRDTaskAssertion alloc];
    id v15 = (id)[(MRXPCConnectionMonitor *)v5 pid];
    v16 = [(MRXPCConnectionMonitor *)v5 bundleID];
    uint64_t v17 = [(MRXPCConnectionMonitor *)v5 label];
    v18 = [(MRDTaskAssertion *)v14 initWithType:5 pid:v15 bundleID:v16 name:v17];

    if (objc_opt_respondsToSelector()) {
      [WeakRetained connectionDidResume:v5];
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100130EB0;
    v24[3] = &unk_1004159B8;
    v19 = v18;
    v25 = v19;
    id v26 = v5;
    id v20 = v13;
    id v27 = v20;
    v21 = objc_retainBlock(v24);
    connection = v5->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection scheduleSendBarrierBlock:v21];
    }
    else
    {
      connection_t = v5->_connection_t;
      if (connection_t) {
        xpc_connection_send_barrier(connection_t, v21);
      }
    }
  }
}

- (MRXPCConnectionMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRXPCConnectionMonitorDelegate *)WeakRetained;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection_t
{
  return self->_connection_t;
}

- (void)setConnection_t:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (unint64_t)currentMessageCount
{
  return self->_currentMessageCount;
}

- (void)setCurrentMessageCount:(unint64_t)a3
{
  self->_currentMessageCount = a3;
}

- (unint64_t)totalMessageCount
{
  return self->_totalMessageCount;
}

- (void)setTotalMessageCount:(unint64_t)a3
{
  self->_totalMessageCount = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (BOOL)pendingBarrierCompletion
{
  return self->_pendingBarrierCompletion;
}

- (void)setPendingBarrierCompletion:(BOOL)a3
{
  self->_pendingBarrierCompletion = a3;
}

- (NSDate)lastStatusCheckDate
{
  return self->_lastStatusCheckDate;
}

- (void)setLastStatusCheckDate:(id)a3
{
}

- (NSDate)lastStatusChangeDate
{
  return self->_lastStatusChangeDate;
}

- (void)setLastStatusChangeDate:(id)a3
{
}

- (NSDate)lastMessageSentDate
{
  return self->_lastMessageSentDate;
}

- (void)setLastMessageSentDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMessageSentDate, 0);
  objc_storeStrong((id *)&self->_lastStatusChangeDate, 0);
  objc_storeStrong((id *)&self->_lastStatusCheckDate, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connection_t, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_label, 0);
}

@end