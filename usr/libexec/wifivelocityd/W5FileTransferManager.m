@interface W5FileTransferManager
- (NSData)publicKeySelf;
- (W5FileTransferManager)init;
- (void)_setupWithTargetID:(id)a3;
- (void)_stop;
- (void)initializeReceiverWithTargetID:(id)a3;
- (void)initializeSenderWithTargetID:(id)a3 peerPublicKey:(id)a4;
- (void)startW5FileReceiverWithPeerPublicKey:(id)a3 reply:(id)a4;
- (void)startW5FileSenderForFile:(id)a3;
@end

@implementation W5FileTransferManager

- (W5FileTransferManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)W5FileTransferManager;
  v2 = [(W5FileTransferManager *)&v8 init];
  uint64_t v3 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity" isDirectory:1];
  tempDirPath = v2->_tempDirPath;
  v2->_tempDirPath = (NSURL *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.wifivelocity.file-transfer", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  if (!v2->_queue)
  {

    return 0;
  }
  return v2;
}

- (void)_setupWithTargetID:(id)a3
{
  id v6 = a3;
  v4 = (RPFileTransferSession *)objc_alloc_init((Class)RPFileTransferSession);
  session = self->_session;
  self->_session = v4;

  [(RPFileTransferSession *)self->_session setTemporaryDirectoryURL:self->_tempDirPath];
  [(RPFileTransferSession *)self->_session setDispatchQueue:self->_queue];
  [(RPFileTransferSession *)self->_session setTargetID:v6];
}

- (void)initializeReceiverWithTargetID:(id)a3
{
  id v4 = a3;
  if (self->_session) {
    [(W5FileTransferManager *)self _stop];
  }
  [(W5FileTransferManager *)self _setupWithTargetID:v4];
  [(RPFileTransferSession *)self->_session setFlags:0];
  [(RPFileTransferSession *)self->_session setFlags:[(RPFileTransferSession *)self->_session flags] | 1];
  [(RPFileTransferSession *)self->_session setFlags:[(RPFileTransferSession *)self->_session flags] | 0x10];
  [(RPFileTransferSession *)self->_session setFlags:[(RPFileTransferSession *)self->_session flags] | 0x100];
  session = self->_session;
  id v10 = 0;
  [(RPFileTransferSession *)session prepareTemplateAndReturnError:&v10];
  id v6 = v10;
  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136316162;
    v12 = "-[W5FileTransferManager initializeReceiverWithTargetID:]";
    __int16 v13 = 2080;
    v14 = "W5FileTransferManager.m";
    __int16 v15 = 1024;
    int v16 = 71;
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_send_and_compose_impl();
  }

  objc_super v8 = [(RPFileTransferSession *)self->_session selfPublicKey];
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v8;
}

- (void)initializeSenderWithTargetID:(id)a3 peerPublicKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_session) {
    [(W5FileTransferManager *)self _stop];
  }
  [(W5FileTransferManager *)self _setupWithTargetID:v6];
  [(RPFileTransferSession *)self->_session setFlags:0];
  [(RPFileTransferSession *)self->_session setFlags:[(RPFileTransferSession *)self->_session flags] | 0x10];
  [(RPFileTransferSession *)self->_session setFlags:[(RPFileTransferSession *)self->_session flags] | 0x100];
  [(RPFileTransferSession *)self->_session setPeerPublicKey:v7];
  session = self->_session;
  id v13 = 0;
  [(RPFileTransferSession *)session prepareTemplateAndReturnError:&v13];
  id v9 = v13;
  id v10 = sub_10009756C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316162;
    __int16 v15 = "-[W5FileTransferManager initializeSenderWithTargetID:peerPublicKey:]";
    __int16 v16 = 2080;
    __int16 v17 = "W5FileTransferManager.m";
    __int16 v18 = 1024;
    int v19 = 93;
    __int16 v20 = 2114;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_send_and_compose_impl();
  }

  int v11 = [(RPFileTransferSession *)self->_session selfPublicKey];
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v11;
}

- (void)startW5FileSenderForFile:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(RPFileTransferSession *)self->_session selfPublicKey];
    v12 = [(RPFileTransferSession *)self->_session peerPublicKey];
    _os_log_send_and_compose_impl();
  }
  [(RPFileTransferSession *)self->_session setCompletionHandler:&stru_1000DD500];
  [(RPFileTransferSession *)self->_session setProgressHandler:&stru_1000DD540];
  [(RPFileTransferSession *)self->_session setReceivedItemHandler:&stru_1000DD580];
  [(RPFileTransferSession *)self->_session activate];
  id v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  id v8 = objc_alloc_init((Class)RPFileTransferItem);
  [v8 setItemURL:v4];
  id v9 = [v4 path];
  id v10 = [v9 lastPathComponent];
  [v8 setFilename:v10];

  [v8 setCompletionHandler:&stru_1000DD5A0];
  int v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  [(RPFileTransferSession *)self->_session addItem:v8];
  [(RPFileTransferSession *)self->_session finish];
}

- (void)startW5FileReceiverWithPeerPublicKey:(id)a3 reply:(id)a4
{
  id v6 = a4;
  [(RPFileTransferSession *)self->_session setPeerPublicKey:a3];
  id v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(RPFileTransferSession *)self->_session selfPublicKey];
    [(RPFileTransferSession *)self->_session peerPublicKey];
    int v13 = 136316162;
    int v14 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    __int16 v15 = 2080;
    __int16 v16 = "W5FileTransferManager.m";
    __int16 v17 = 1024;
    int v18 = 147;
    __int16 v19 = 2114;
    __int16 v20 = v8;
    __int16 v21 = 2114;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }
  [(RPFileTransferSession *)self->_session setProgressHandler:&stru_1000DD5C0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014338;
  v11[3] = &unk_1000DD5E8;
  id v9 = v6;
  id v12 = v9;
  [(RPFileTransferSession *)self->_session setReceivedItemHandler:v11];
  [(RPFileTransferSession *)self->_session activate];
  id v10 = sub_10009756C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    int v14 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    __int16 v15 = 2080;
    __int16 v16 = "W5FileTransferManager.m";
    __int16 v17 = 1024;
    int v18 = 179;
    _os_log_send_and_compose_impl();
  }
}

- (void)_stop
{
  [(RPFileTransferSession *)self->_session invalidate];
  session = self->_session;
  self->_session = 0;
}

- (NSData)publicKeySelf
{
  return self->_publicKeySelf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeySelf, 0);
  objc_storeStrong((id *)&self->_tempDirPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end