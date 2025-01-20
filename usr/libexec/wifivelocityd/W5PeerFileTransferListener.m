@interface W5PeerFileTransferListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5FileTransferManager)transferManager;
- (W5PeerFileTransferListener)initWithTransferManager:(id)a3;
- (id)_listFiles:(id)a3;
- (int64_t)currentVersion;
- (void)setTransferManager:(id)a3;
@end

@implementation W5PeerFileTransferListener

- (W5PeerFileTransferListener)initWithTransferManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerFileTransferListener;
  v5 = [(W5PeerFileTransferListener *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (W5FileTransferManager *)v4;
    p_super = &v6->_transferManager->super;
    v6->_transferManager = v7;
  }
  else
  {

    p_super = sub_10009756C();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5PeerFileTransferListener initWithTransferManager:]";
      __int16 v13 = 2080;
      v14 = "W5PeerFileTransferListener.m";
      __int16 v15 = 1024;
      int v16 = 37;
      _os_log_send_and_compose_impl();
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 payload];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 version];
    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136316418;
      v31 = "-[W5PeerFileTransferListener handleClientRequest:]";
      __int16 v32 = 2080;
      v33 = "W5PeerFileTransferListener.m";
      __int16 v34 = 1024;
      *(_DWORD *)v35 = 47;
      *(_WORD *)&v35[4] = 2114;
      *(void *)&v35[6] = v4;
      __int16 v36 = 2114;
      v37 = v6;
      __int16 v38 = 2114;
      v39 = v7;
      _os_log_send_and_compose_impl();
    }

    v9 = objc_alloc_init(W5PeerFileTransferResponsePayload);
    objc_super v10 = +[NSNumber numberWithInteger:[(W5PeerFileTransferListener *)self currentVersion]];
    [(W5PeerFileTransferResponsePayload *)v9 setVersion:v10];

    id v11 = [v7 integerValue];
    if (v11 == (id)[(W5PeerFileTransferListener *)self currentVersion])
    {
      id v12 = [v6 type];
      if (v12 == (id)2)
      {
        __int16 v13 = [v6 remotePath];
        v23 = sub_10009756C();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 138543362;
          v31 = v13;
          _os_log_send_and_compose_impl();
        }

        BOOL v17 = v13 != 0;
        if (v13)
        {
          [(W5PeerFileTransferResponsePayload *)v9 setStatus:1];
          v24 = [(W5PeerFileTransferListener *)self _listFiles:v13];
          [(W5PeerFileTransferResponsePayload *)v9 setFiles:v24];

          uint64_t v25 = [v4 handler];
          (*(void (**)(uint64_t, W5PeerFileTransferResponsePayload *, void))(v25 + 16))(v25, v9, 0);
        }
        else
        {
          uint64_t v25 = sub_10009756C();
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v30) = 0;
            _os_log_send_and_compose_impl();
          }
        }
      }
      else
      {
        if (v12 != (id)1)
        {
          BOOL v17 = 0;
LABEL_28:

          goto LABEL_29;
        }
        [(W5PeerFileTransferResponsePayload *)v9 setStatus:1];
        __int16 v13 = [v6 targetID];
        v14 = [v6 remotePath];
        __int16 v15 = [v6 publicKey];
        int v16 = sub_10009756C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          [v6 publicKey];
          int v30 = 138543874;
          v31 = v14;
          __int16 v32 = 2114;
          v33 = (char *)objc_claimAutoreleasedReturnValue();
          __int16 v34 = 2114;
          *(void *)v35 = v13;
          _os_log_send_and_compose_impl();
        }
        BOOL v17 = v14 != 0;
        if (v14)
        {
          [(W5FileTransferManager *)self->_transferManager initializeSenderWithTargetID:v13 peerPublicKey:v15];
          v18 = [(W5FileTransferManager *)self->_transferManager publicKeySelf];
          [(W5PeerFileTransferResponsePayload *)v9 setPublicKey:v18];

          v19 = [v4 handler];
          ((void (**)(void, W5PeerFileTransferResponsePayload *, void))v19)[2](v19, v9, 0);

          [(W5FileTransferManager *)self->_transferManager startW5FileSenderForFile:v14];
        }
        else
        {
          v26 = sub_10009756C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v30) = 0;
            _os_log_send_and_compose_impl();
          }
        }
      }
    }
    else
    {
      v20 = sub_10009756C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        v31 = (const char *)v7;
        _os_log_send_and_compose_impl();
      }

      [(W5PeerFileTransferResponsePayload *)v9 setStatus:2];
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v29 = @"W5PeerFileListenerUnsupportedVersion";
      BOOL v17 = 1;
      v21 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      v22 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:11 userInfo:v21];
      [(W5PeerFileTransferResponsePayload *)v9 setError:v22];

      __int16 v13 = [v4 handler];
      (*((void (**)(char *, W5PeerFileTransferResponsePayload *, void))v13 + 2))(v13, v9, 0);
    }

    goto LABEL_28;
  }
  BOOL v17 = 0;
LABEL_29:

  return v17;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.fileTransfer";
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)_listFiles:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = +[NSFileManager defaultManager];
  id v19 = 0;
  v6 = [v5 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:4 error:&v19];
  id v7 = v19;

  if (v7)
  {
    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315906;
      v22 = "-[W5PeerFileTransferListener _listFiles:]";
      __int16 v23 = 2080;
      v24 = "W5PeerFileTransferListener.m";
      __int16 v25 = 1024;
      int v26 = 139;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v13 hasDirectoryPath] & 1) == 0) {
            [v4 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }

  return v4;
}

- (W5FileTransferManager)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end