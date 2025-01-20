@interface CRLoggingFileReceiver
- (CARSession)session;
- (CARSessionChannel)channel;
- (CRFileReceiver)fileReceiver;
- (CRLoggingFileReceiver)initWithSession:(id)a3;
- (OS_os_transaction)transaction;
- (id)currentCompletion;
- (id)urlForSavingLogsForFileReceiverSession:(id)a3;
- (void)dealloc;
- (void)fileReceiver:(id)a3 didReceiveStatistics:(id)a4;
- (void)fileReceiverSession:(id)a3 didSaveLogsAtURL:(id)a4;
- (void)invalidate;
- (void)requestLogsWithCompletion:(id)a3;
- (void)setChannel:(id)a3;
- (void)setCurrentCompletion:(id)a3;
- (void)setFileReceiver:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation CRLoggingFileReceiver

- (CRLoggingFileReceiver)initWithSession:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLoggingFileReceiver;
  v6 = [(CRLoggingFileReceiver *)&v19 init];
  if (v6)
  {
    v7 = (void *)os_transaction_create();
    [(CRLoggingFileReceiver *)v6 setTransaction:v7];

    v8 = sub_10005C6FC(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "opening logging file channel", v18, 2u);
    }

    objc_storeStrong((id *)&v6->_session, a3);
    id v9 = objc_alloc((Class)CARSessionChannel);
    v10 = (CARSessionChannel *)[v9 initWithSession:v5 channelType:kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayLoggingData];
    channel = v6->_channel;
    v6->_channel = v10;

    v12 = [[CRFileReceiver alloc] initWithChannel:v6->_channel];
    fileReceiver = v6->_fileReceiver;
    v6->_fileReceiver = v12;

    v14 = v6->_fileReceiver;
    if (!v14)
    {
      v16 = 0;
      goto LABEL_8;
    }
    [(CRFileReceiver *)v14 setLogArchiveReceiver:v6];
    [(CRFileReceiver *)v6->_fileReceiver setStatisticsReceiver:v6];
    v15 = [(CRLoggingFileReceiver *)v6 fileReceiver];
    [v15 requestStartStatisticsOnInterval:10];
  }
  v16 = v6;
LABEL_8:

  return v16;
}

- (void)dealloc
{
  [(CRLoggingFileReceiver *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRLoggingFileReceiver;
  [(CRLoggingFileReceiver *)&v3 dealloc];
}

- (void)invalidate
{
  id v5 = [(CRLoggingFileReceiver *)self currentCompletion];
  if (v5)
  {
    v5[2](v5, 0);
    id currentCompletion = self->_currentCompletion;
    self->_id currentCompletion = 0;
  }
  v4 = [(CRLoggingFileReceiver *)self fileReceiver];
  [v4 invalidate];

  [(CRLoggingFileReceiver *)self setTransaction:0];
}

- (void)requestLogsWithCompletion:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = [(CRLoggingFileReceiver *)self currentCompletion];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  [(CRLoggingFileReceiver *)self setCurrentCompletion:v7];
  v6 = [(CRLoggingFileReceiver *)self fileReceiver];
  [v6 requestLogArchive];
}

- (id)urlForSavingLogsForFileReceiverSession:(id)a3
{
  objc_super v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [v3 URLsForDirectory:5 inDomains:1];
  id v5 = [v4 firstObject];

  v6 = +[NSFileManager defaultManager];
  uint64_t v10 = 0;
  id v7 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:&v10];

  v8 = [v7 URLByAppendingPathComponent:@"VehicleLogs.tar.gz"];

  return v8;
}

- (void)fileReceiverSession:(id)a3 didSaveLogsAtURL:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C190;
  block[3] = &unk_1000BD3A8;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&location);
}

- (void)fileReceiver:(id)a3 didReceiveStatistics:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  id v5 = [v4 objectForKey:@"CommStats"];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v13 = sub_10005C6FC(5uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = sub_10005C6FC(5uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000740BC((uint64_t)v4, v7);
    }
  }
}

- (CARSession)session
{
  return self->_session;
}

- (CARSessionChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (CRFileReceiver)fileReceiver
{
  return self->_fileReceiver;
}

- (void)setFileReceiver:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (id)currentCompletion
{
  return self->_currentCompletion;
}

- (void)setCurrentCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentCompletion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_fileReceiver, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end