@interface RPClientProxy
- (NSXPCConnection)connection;
- (RPClientProxy)initWithConnection:(id)a3;
- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4;
- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4;
- (void)dealloc;
- (void)recordingDidPause;
- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4;
- (void)recordingLockInterrupted:(id)a3;
- (void)recordingTimerDidUpdate:(id)a3;
- (void)setConnection:(id)a3;
- (void)shouldResumeSessionType:(id)a3;
- (void)updateBroadcastServiceInfo:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateScreenRecordingStateWithCurrentState:(id)a3;
@end

@implementation RPClientProxy

- (RPClientProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPClientProxy;
  v5 = [(RPClientProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(RPClientProxy *)v5 setConnection:v4];
  }

  return v6;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)RPClientProxy;
  [(RPClientProxy *)&v5 dealloc];
}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:updateScreenRecordingStateWithCurrentState:", v6, 2u);
  }
  objc_super v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085728];
  [v5 updateScreenRecordingStateWithCurrentState:v4];
}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingDidStopWithError:movieURL:", v9, 2u);
  }
  objc_super v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085748];
  [v8 recordingDidStopWithError:v6 movieURL:v7];
}

- (void)updateBroadcastServiceInfo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:updateBroadcastServiceInfo:", v6, 2u);
  }
  objc_super v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085768];
  [v5 updateBroadcastServiceInfo:v4];
}

- (void)updateBroadcastURL:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:updateBroadcastURL:", v6, 2u);
  }
  objc_super v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085788];
  [v5 updateBroadcastURL:v4];
}

- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    v10 = "-[RPClientProxy captureHandlerWithSample:timingData:]";
    __int16 v11 = 1024;
    int v12 = 71;
    __int16 v13 = 2080;
    v14 = "-[RPClientProxy captureHandlerWithSample:timingData:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %s Sending client video", (uint8_t *)&v9, 0x1Cu);
  }
  objc_super v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_1000857A8];
  [v8 captureHandlerWithSample:v6 timingData:v7];
}

- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4
{
  id v6 = a3;
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446978;
    int v9 = "-[RPClientProxy captureHandlerWithAudioSample:bufferType:]";
    __int16 v10 = 1024;
    int v11 = 79;
    __int16 v12 = 2080;
    __int16 v13 = "-[RPClientProxy captureHandlerWithAudioSample:bufferType:]";
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %s Sending client audio with type %ld", (uint8_t *)&v8, 0x26u);
  }
  id v7 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_1000857C8];
  [v7 captureHandlerWithAudioSample:v6 bufferType:a4];
}

- (void)recordingLockInterrupted:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingLockInterrupted:", v6, 2u);
  }
  objc_super v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_1000857E8];
  [v5 recordingLockInterrupted:v4];
}

- (void)shouldResumeSessionType:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:shouldResumeSessionType:", v6, 2u);
  }
  objc_super v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085808];
  [v5 shouldResumeSessionType:v4];
}

- (void)recordingDidPause
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingDidPause:", v4, 2u);
  }
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085828];
  [v3 recordingDidPause];
}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingTimerDidUpdate:", v6, 2u);
  }
  objc_super v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100085848];
  [v5 recordingTimerDidUpdate:v4];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end