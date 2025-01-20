@interface UANetworkReplayController
+ (BOOL)createConnection:(id)a3 host:(id)a4 port:(int64_t)a5;
- (BOOL)processCommand:(id)a3;
- (BOOL)sendResponse:(id)a3;
- (BOOL)terminate;
- (NSInputStream)inputStream;
- (NSMutableData)readBuffer;
- (NSMutableData)writeBuffer;
- (NSOutputStream)outputStream;
- (NSString)peerName;
- (NSUUID)peerUUID;
- (UANetworkReplayController)initWithManager:(id)a3 inputStream:(id)a4 outputStream:(id)a5 name:(id)a6;
- (UANetworkReplayController)initWithManager:(id)a3 service:(id)a4;
- (id)statusString;
- (void)setInputStream:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setPeerName:(id)a3;
- (void)setPeerUUID:(id)a3;
- (void)setReadBuffer:(id)a3;
- (void)setWriteBuffer:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation UANetworkReplayController

- (UANetworkReplayController)initWithManager:(id)a3 inputStream:(id)a4 outputStream:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (__CFString *)a6;
  if (v13)
  {
    v14 = +[NSString stringWithFormat:@"From %@", v13];
  }
  else
  {
    v14 = @"From host";
  }
  v22.receiver = self;
  v22.super_class = (Class)UANetworkReplayController;
  v15 = [(UAActivityReplay *)&v22 initWithManager:v10 name:v14];
  if (v13) {

  }
  if (v15)
  {
    [(UANetworkReplayController *)v15 setPeerName:v13];
    if (v13) {
      CFStringRef v16 = v13;
    }
    else {
      CFStringRef v16 = @"?";
    }
    v17 = [(UAActivityReplay *)v15 pairedPeer];
    [v17 setName:v16];

    v18 = +[NSMutableData data];
    [(UANetworkReplayController *)v15 setReadBuffer:v18];

    [(UANetworkReplayController *)v15 setInputStream:v11];
    [(UANetworkReplayController *)v15 setOutputStream:v12];
    [v11 setDelegate:v15];
    [v12 setDelegate:v15];
    v19 = +[NSRunLoop mainRunLoop];
    [v11 scheduleInRunLoop:v19 forMode:NSRunLoopCommonModes];

    v20 = +[NSRunLoop mainRunLoop];
    [v12 scheduleInRunLoop:v20 forMode:NSRunLoopCommonModes];

    [v11 open];
    [v12 open];
  }

  return v15;
}

- (UANetworkReplayController)initWithManager:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 name];
  if (v8)
  {
    v9 = [v7 name];
  }
  else
  {
    v9 = @"Net";
  }
  v21.receiver = self;
  v21.super_class = (Class)UANetworkReplayController;
  id v10 = [(UAActivityReplay *)&v21 initWithManager:v6 name:v9];
  if (v8) {

  }
  if (v10)
  {
    id v11 = +[NSMutableData data];
    [(UANetworkReplayController *)v10 setReadBuffer:v11];

    id v19 = 0;
    id v20 = 0;
    if ([v7 getInputStream:&v20 outputStream:&v19])
    {
      id v12 = [v7 name];
      id v13 = [v12 copy];
      [(UANetworkReplayController *)v10 setPeerName:v13];

      [(UANetworkReplayController *)v10 setInputStream:v20];
      [(UANetworkReplayController *)v10 setOutputStream:v19];
      [v20 setDelegate:v10];
      [v19 setDelegate:v10];
      id v14 = v20;
      v15 = +[NSRunLoop mainRunLoop];
      [v14 scheduleInRunLoop:v15 forMode:NSRunLoopCommonModes];

      id v16 = v19;
      v17 = +[NSRunLoop mainRunLoop];
      [v16 scheduleInRunLoop:v17 forMode:NSRunLoopCommonModes];

      [v20 open];
      [v19 open];
    }
  }
  return v10;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  v8 = [(UAActivityReplay *)v7 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062230;
  block[3] = &unk_1000C5FB0;
  id v12 = v7;
  unint64_t v13 = a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);

  objc_sync_exit(v7);
}

- (BOOL)processCommand:(id)a3
{
  v4 = (UANetworkReplayController *)a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(UANetworkReplayController *)self peerName];
    id v7 = [(UANetworkReplayController *)self peerUUID];
    v8 = [v7 UUIDString];
    *(_DWORD *)buf = 138478339;
    v76 = v4;
    __int16 v77 = 2113;
    id v78 = v6;
    __int16 v79 = 2114;
    v80 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COMMAND: %{private}@, from %{private}@/%{public}@", buf, 0x20u);
  }
  id v9 = [(UAActivityReplay *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = +[NSScanner scannerWithString:v4];
  id v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v73 = 0;
  unsigned int v12 = [v10 scanUpToCharactersFromSet:v11 intoString:&v73];
  id v13 = v73;

  BOOL v14 = 0;
  if (v12 && v13)
  {
    v15 = [v13 uppercaseString];

    if (([v15 isEqual:@"HANDOFF"] & 1) != 0
      || [v15 isEqual:@"VERSION"])
    {
      double v72 = 0.0;
      id v17 = 0;
      if ([v10 scanString:@"v" intoString:0])
      {
        id v17 = 0;
        if ([v10 scanDouble:&v72])
        {
          double v16 = v72;
          if (v72 >= 53.0)
          {
            v18 = +[NSCharacterSet whitespaceCharacterSet];
            id v71 = 0;
            unsigned int v19 = [v10 scanUpToCharactersFromSet:v18 intoString:&v71];
            id v20 = v71;

            id v17 = 0;
            if (v19) {
              id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:v20];
            }
          }
        }
      }
      if (objc_msgSend(v15, "isEqual:", @"HANDOFF", v16))
      {
        objc_super v21 = sub_10000BA18(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_super v22 = [(UANetworkReplayController *)self peerName];
          v23 = [v17 UUIDString];
          [(UACornerActionManagerHandler *)self manager];
          v65 = v63 = v4;
          [v65 uuid];
          v24 = v61 = v10;
          v25 = [v24 UUIDString];
          v26 = [(UACornerActionManagerHandler *)self uuid];
          [v26 UUIDString];
          v28 = v27 = v15;
          *(_DWORD *)buf = 138478595;
          v76 = v22;
          __int16 v77 = 2114;
          id v78 = v23;
          __int16 v79 = 2114;
          v80 = v25;
          __int16 v81 = 2114;
          v82 = v28;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "NETWORK: Responding to peer %{private}@/%{public}@ with our UUID, %{public}@, to establish connection from controllerUUID=%{public}@.", buf, 0x2Au);

          v15 = v27;
          id v10 = v61;

          v4 = v63;
        }

        v29 = v15;
        if (v17)
        {
          [(UANetworkReplayController *)self setPeerUUID:v17];
        }
        else
        {
          v30 = +[NSUUID UUID];
          [(UANetworkReplayController *)self setPeerUUID:v30];
        }
        v31 = [(UACornerActionManagerHandler *)self manager];
        v32 = [v31 uuid];
        v33 = [v32 UUIDString];
        v34 = +[NSString stringWithFormat:@"VERSION v%g %@\n", 0x4081380000000000, v33];
        [(UANetworkReplayController *)self sendResponse:v34];

        v15 = v29;
      }
      v35 = [(UACornerActionManagerHandler *)self manager];
      v36 = [v35 uuid];
      unsigned int v37 = [v17 isEqual:v36];

      if (v37)
      {
        v38 = sub_10000BA18(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = [v17 UUIDString];
          v40 = [(UACornerActionManagerHandler *)self uuid];
          [v40 UUIDString];
          v42 = v41 = v15;
          *(_DWORD *)buf = 138543618;
          v76 = v39;
          __int16 v77 = 2114;
          id v78 = v42;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "NETWORK: Destroying replay handler object because the peer's UUID %{public}@ matched our own, controllerUUID=%{public}@.", buf, 0x16u);

          v15 = v41;
        }

        [(UANetworkReplayController *)self terminate];
      }
      else
      {
        if (!v17)
        {
LABEL_47:
          BOOL v14 = 1;
          goto LABEL_48;
        }
        v60 = v15;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v43 = [(UACornerActionManagerHandler *)self manager];
        v44 = [v43 handlers];

        id v45 = [v44 countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v45)
        {
          id v46 = v45;
          v62 = v10;
          v64 = v4;
          uint64_t v47 = *(void *)v68;
          while (2)
          {
            for (i = 0; i != v46; i = (char *)i + 1)
            {
              if (*(void *)v68 != v47) {
                objc_enumerationMutation(v44);
              }
              v49 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v50 = v49;
                v51 = sub_10000BA18(0);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543618;
                  v76 = v50;
                  __int16 v77 = 2114;
                  id v78 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "-- checking replayController %{public}@ against peerUUID=%{public}@", buf, 0x16u);
                }

                if (v50 != self)
                {
                  v52 = [(UANetworkReplayController *)v50 peerUUID];
                  unsigned int v53 = [v17 isEqual:v52];

                  if (v53)
                  {
                    v54 = sub_10000BA18(0);
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                    {
                      v55 = [(UANetworkReplayController *)v50 peerName];
                      v56 = [v17 UUIDString];
                      v57 = [(UACornerActionManagerHandler *)self uuid];
                      v58 = [v57 UUIDString];
                      *(_DWORD *)buf = 138412802;
                      v76 = v55;
                      __int16 v77 = 2114;
                      id v78 = v56;
                      __int16 v79 = 2114;
                      v80 = v58;
                      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "NETWORK: Destroying network replay object to %@ because we already have a different connection to that peerUUID %{public}@, controllerUUID=%{public}@", buf, 0x20u);
                    }
                    [(UANetworkReplayController *)self sendResponse:@"# Terminating connection because we seem to already have a connection to this peer.\nTERMINATE\n"];
                    [(UANetworkReplayController *)self terminate];

                    id v17 = 0;
                    goto LABEL_44;
                  }
                }
              }
            }
            id v46 = [v44 countByEnumeratingWithState:&v67 objects:v74 count:16];
            if (v46) {
              continue;
            }
            break;
          }
LABEL_44:
          id v10 = v62;
          v4 = v64;
        }

        v15 = v60;
      }

      goto LABEL_47;
    }
    v66.receiver = self;
    v66.super_class = (Class)UANetworkReplayController;
    BOOL v14 = [(UAActivityReplay *)&v66 processCommand:v4];
  }
  else
  {
    v15 = v13;
  }
LABEL_48:

  return v14;
}

- (BOOL)sendResponse:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  int64_t v6 = strlen(v5);
  id v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_100063FF0(v4);
    id v9 = [(UACornerActionManagerHandler *)self uuid];
    id v10 = [v9 UUIDString];
    id v11 = [(UANetworkReplayController *)self peerName];
    int v22 = 138478339;
    v23 = v8;
    __int16 v24 = 2114;
    v25 = v10;
    __int16 v26 = 2113;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "COMMANDRESPONSE: %{private}@ (controllerUUID=%{public}@ peerName=%{private}@)", (uint8_t *)&v22, 0x20u);
  }
  unsigned int v12 = self;
  objc_sync_enter(v12);
  id v13 = [(UANetworkReplayController *)v12 writeBuffer];
  if ([v13 length])
  {
    BOOL v14 = 0;
  }
  else
  {
    v15 = [(UANetworkReplayController *)v12 outputStream];
    BOOL v14 = (char *)[v15 write:v5 maxLength:strlen(v5)];
  }
  BOOL v16 = v6 <= (uint64_t)v14;
  int64_t v17 = v6 - (void)v14;
  if (!v16)
  {
    v18 = [(UANetworkReplayController *)v12 writeBuffer];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      id v20 = +[NSMutableData dataWithBytes:&v14[(void)v5] length:v17];
      [(UANetworkReplayController *)v12 setWriteBuffer:v20];
    }
    else
    {
      id v20 = [(UANetworkReplayController *)v12 writeBuffer];
      [v20 appendBytes:&v14[(void)v5] length:v17];
    }
  }
  objc_sync_exit(v12);

  return 1;
}

- (id)statusString
{
  if ([(UACornerActionManagerHandler *)self terminated]) {
    CFStringRef v3 = @"TERMINATED";
  }
  else {
    CFStringRef v3 = &stru_1000C6800;
  }
  id v4 = [(UACornerActionManagerHandler *)self name];
  v5 = [(UANetworkReplayController *)self peerName];
  int64_t v6 = [(UANetworkReplayController *)self peerUUID];
  id v7 = [v6 UUIDString];
  v8 = [(UACornerActionManagerHandler *)self uuid];
  id v9 = [v8 UUIDString];
  id v10 = +[NSString stringWithFormat:@"NetworkReplay:%@%@ peer:%@/%@ %@", v3, v4, v5, v7, v9];

  return v10;
}

- (BOOL)terminate
{
  CFStringRef v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(UACornerActionManagerHandler *)self uuid];
    v5 = [v4 UUIDString];
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "controllerUUID=%{public}@", buf, 0xCu);
  }
  [(UACornerActionManagerHandler *)self suspend];
  int64_t v6 = [(UAActivityReplay *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000639BC;
  block[3] = &unk_1000C4CF0;
  void block[4] = self;
  dispatch_async(v6, block);

  v8.receiver = self;
  v8.super_class = (Class)UANetworkReplayController;
  return [(UAActivityReplay *)&v8 terminate];
}

+ (BOOL)createConnection:(id)a3 host:(id)a4 port:(int64_t)a5
{
  id v15 = 0;
  id v16 = 0;
  id v7 = a4;
  id v8 = a3;
  +[NSStream getStreamsToHostWithName:v7 port:a5 inputStream:&v16 outputStream:&v15];
  id v9 = v16;
  id v10 = v15;
  id v11 = [UANetworkReplayController alloc];
  unsigned int v12 = +[NSString stringWithFormat:@"%@/%ld", v7, a5];
  id v13 = [(UANetworkReplayController *)v11 initWithManager:v8 inputStream:v9 outputStream:v10 name:v12];

  [(UANetworkReplayController *)v13 setPeerName:v7];
  [v8 addHandler:v13];

  return 1;
}

- (NSInputStream)inputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 128, 1);
}

- (void)setOutputStream:(id)a3
{
}

- (NSMutableData)readBuffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setReadBuffer:(id)a3
{
}

- (NSMutableData)writeBuffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWriteBuffer:(id)a3
{
}

- (NSString)peerName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPeerName:(id)a3
{
}

- (NSUUID)peerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPeerUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerUUID, 0);
  objc_storeStrong((id *)&self->_peerName, 0);
  objc_storeStrong((id *)&self->_writeBuffer, 0);
  objc_storeStrong((id *)&self->_readBuffer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end