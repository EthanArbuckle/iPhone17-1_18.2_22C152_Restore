@interface NDDownloadConsumerProxy
- (BOOL)sendingMesssage;
- (NDDownloadConsumer)consumer;
- (NDDownloadConsumerProxy)init;
- (NDDownloadConsumerProxy)initWithConsumer:(id)a3 connection:(id)a4;
- (NSMutableArray)pendingMessages;
- (NSString)connectionDescription;
- (NSXPCConnection)connection;
- (void)_enqueueBarrierMessage:(id)a3;
- (void)_enqueueMessage:(id)a3;
- (void)_sendNextMessage;
- (void)downloadFinishedForRequest:(id)a3 error:(id)a4;
- (void)downloadProgressedForRequest:(id)a3 contentArchive:(id)a4;
- (void)downloadProgressedForRequest:(id)a3 progress:(double)a4;
- (void)setConnection:(id)a3;
- (void)setSendingMesssage:(BOOL)a3;
@end

@implementation NDDownloadConsumerProxy

- (NDDownloadConsumerProxy)initWithConsumer:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NDDownloadConsumerProxy;
  v9 = [(NDDownloadConsumerProxy *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_consumer, a3);
    objc_storeWeak((id *)&v10->_connection, v8);
    uint64_t v11 = +[NSString stringWithFormat:@"%p", v8];
    connectionDescription = v10->_connectionDescription;
    v10->_connectionDescription = (NSString *)v11;

    uint64_t v13 = +[NSMutableArray array];
    pendingMessages = v10->_pendingMessages;
    v10->_pendingMessages = (NSMutableArray *)v13;
  }
  return v10;
}

- (NDDownloadConsumerProxy)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDDownloadConsumerProxy init]";
    __int16 v7 = 2080;
    id v8 = "NDDownloadConsumerProxy.m";
    __int16 v9 = 1024;
    int v10 = 43;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDDownloadConsumerProxy init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)downloadProgressedForRequest:(id)a3 progress:(double)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008920;
  v6[3] = &unk_100061958;
  __int16 v7 = self;
  id v8 = a3;
  double v9 = a4;
  id v5 = v8;
  [(NDDownloadConsumerProxy *)v7 _enqueueMessage:v6];
}

- (void)downloadProgressedForRequest:(id)a3 contentArchive:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008A38;
  v7[3] = &unk_100061980;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NDDownloadConsumerProxy *)v8 _enqueueBarrierMessage:v7];
}

- (void)downloadFinishedForRequest:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008B4C;
  v7[3] = &unk_100061980;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NDDownloadConsumerProxy *)v8 _enqueueMessage:v7];
}

- (void)_enqueueMessage:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(NDDownloadConsumerProxy *)self pendingMessages];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008C78;
  v8[3] = &unk_1000619A8;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = objc_retainBlock(v8);
  [v5 addObject:v7];

  [(NDDownloadConsumerProxy *)self _sendNextMessage];
}

- (void)_enqueueBarrierMessage:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  objc_initWeak(&location, self);
  id v5 = [(NDDownloadConsumerProxy *)self pendingMessages];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008E20;
  v8[3] = &unk_1000619D0;
  id v6 = v4;
  id v9 = v6;
  objc_copyWeak(&v10, &location);
  __int16 v7 = objc_retainBlock(v8);
  [v5 addObject:v7];

  [(NDDownloadConsumerProxy *)self _sendNextMessage];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)_sendNextMessage
{
  +[NSThread isMainThread];
  if (![(NDDownloadConsumerProxy *)self sendingMesssage])
  {
    v3 = [(NDDownloadConsumerProxy *)self pendingMessages];
    id v4 = [v3 count];

    if (v4)
    {
      id v5 = [(NDDownloadConsumerProxy *)self connection];

      if (v5)
      {
        [(NDDownloadConsumerProxy *)self setSendingMesssage:1];
        id v6 = [(NDDownloadConsumerProxy *)self pendingMessages];
        objc_msgSend(v6, "fc_popFirstObject");
        __int16 v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

        id v8 = (void *)FCOfflineDownloadsLog;
        if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v8;
          id v10 = [(NDDownloadConsumerProxy *)self connectionDescription];
          *(_DWORD *)buf = 138543362;
          v14 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "consumer proxy will send message, connection=%{public}@", buf, 0xCu);
        }
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100009168;
        v11[3] = &unk_100061828;
        v11[4] = self;
        ((void (**)(void, void *))v7)[2](v7, v11);
      }
      else
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10000911C;
        v12[3] = &unk_100061828;
        v12[4] = self;
        sub_10000911C((uint64_t)v12);
      }
    }
  }
}

- (NDDownloadConsumer)consumer
{
  return self->_consumer;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (NSString)connectionDescription
{
  return self->_connectionDescription;
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (BOOL)sendingMesssage
{
  return self->_sendingMesssage;
}

- (void)setSendingMesssage:(BOOL)a3
{
  self->_sendingMesssage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_connectionDescription, 0);
  objc_destroyWeak((id *)&self->_connection);

  objc_storeStrong((id *)&self->_consumer, 0);
}

@end