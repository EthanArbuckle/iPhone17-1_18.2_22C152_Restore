@interface UCRemotePasteboardGeneration
- (BOOL)dataRequested;
- (BOOL)returnEarly;
- (NSError)error;
- (NSUUID)uuid;
- (OS_dispatch_queue)respQueue;
- (UASharedPasteboardDataRequester)dataRequester;
- (UASharedPasteboardInfo)pbInfo;
- (UCRemotePasteboardGeneration)initWithRequester:(id)a3;
- (id)stateAsString;
- (int64_t)streamProtocolVersion;
- (unint64_t)state;
- (void)dealloc;
- (void)requestRemotePasteboardData:(id)a3;
- (void)requestRemoteTypeInfo:(id)a3;
- (void)setDataRequested:(BOOL)a3;
- (void)setDataRequester:(id)a3;
- (void)setError:(id)a3;
- (void)setPbInfo:(id)a3;
- (void)setRespQueue:(id)a3;
- (void)setReturnEarly:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStreamProtocolVersion:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)updateState:(unint64_t)a3;
@end

@implementation UCRemotePasteboardGeneration

- (UCRemotePasteboardGeneration)initWithRequester:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UCRemotePasteboardGeneration;
  v5 = [(UCRemotePasteboardGeneration *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(UCRemotePasteboardGeneration *)v5 setDataRequester:v4];
    [(UCRemotePasteboardGeneration *)v6 setDataRequested:0];
    v7 = +[NSUUID UUID];
    [(UCRemotePasteboardGeneration *)v6 setUuid:v7];

    [(UCRemotePasteboardGeneration *)v6 setState:0];
    v8 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.useractivity.remotegenerationresponse", v8);
    [(UCRemotePasteboardGeneration *)v6 setRespQueue:v9];

    v10 = sub_10000BA18(@"pasteboard-fetch");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(UCRemotePasteboardGeneration *)v6 uuid];
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Created remote generation %{public}@", buf, 0xCu);
    }
  }

  return v6;
}

- (id)stateAsString
{
  unint64_t v2 = [(UCRemotePasteboardGeneration *)self state];
  if (v2 - 1 > 5) {
    return @"New";
  }
  else {
    return *(&off_1000C5398 + v2 - 1);
  }
}

- (void)updateState:(unint64_t)a3
{
  unint64_t v5 = [(UCRemotePasteboardGeneration *)self state];
  if (v5 == 6 || v5 == 1)
  {
    v6 = sub_10000BA18(@"pasteboard-fetch");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = +[NSNumber numberWithUnsignedInteger:[(UCRemotePasteboardGeneration *)self state]];
      v8 = +[NSNumber numberWithUnsignedInteger:a3];
      int v9 = 138412546;
      v10 = v7;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cannot update state from %@ to %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    [(UCRemotePasteboardGeneration *)self setState:a3];
  }
}

- (void)dealloc
{
  v3 = sub_10000BA18(@"pasteboard-fetch");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(UCRemotePasteboardGeneration *)self uuid];
    unint64_t v5 = [(UCRemotePasteboardGeneration *)self stateAsString];
    *(_DWORD *)buf = 138543618;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote generation dealloc (type requested, data requested): %{public}@ %@", buf, 0x16u);
  }
  v6 = [(UCRemotePasteboardGeneration *)self respQueue];
  dispatch_activate(v6);

  v7.receiver = self;
  v7.super_class = (Class)UCRemotePasteboardGeneration;
  [(UCRemotePasteboardGeneration *)&v7 dealloc];
}

- (void)requestRemoteTypeInfo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UCRemotePasteboardGeneration *)self respQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F460;
  block[3] = &unk_1000C5328;
  block[4] = self;
  id v6 = v4;
  id v18 = v6;
  dispatch_async(v5, block);

  if ([(UCRemotePasteboardGeneration *)self state] <= 1)
  {
    objc_super v7 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Fetching remote type info", buf, 2u);
    }

    v8 = objc_alloc_init(UARemotePasteboardTypeInfoRequestedEvent);
    uint64_t v9 = mach_absolute_time();
    [(UCRemotePasteboardGeneration *)self updateState:2];
    __int16 v10 = [(UCRemotePasteboardGeneration *)self dataRequester];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002F588;
    v12[3] = &unk_1000C5350;
    v14 = self;
    uint64_t v15 = v9;
    objc_super v13 = v8;
    __int16 v11 = v8;
    [v10 requestRemotePasteboardInfo:v12];
  }
}

- (void)requestRemotePasteboardData:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((id)[(UCRemotePasteboardGeneration *)self state] == (id)6)
  {
    unint64_t v5 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
    v4[2](v4, 0, v5);
  }
  else
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = sub_10000F400;
    v26 = sub_100030054;
    id v27 = 0;
    if ([(UCRemotePasteboardGeneration *)self state] <= 2)
    {
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
      objc_super v7 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Requesting types before PB data", buf, 2u);
      }

      uint64_t v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_10003005C;
      id v18 = &unk_1000C5378;
      v20 = &v22;
      v8 = v6;
      v19 = v8;
      [(UCRemotePasteboardGeneration *)self requestRemoteTypeInfo:&v15];
      uint64_t v9 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[REMOTE GEN] Waiting on type results", buf, 2u);
      }

      dispatch_time_t v10 = dispatch_time(0, 7000000000);
      if (dispatch_semaphore_wait(v8, v10))
      {
        __int16 v11 = sub_10000BA18(@"pasteboard-server-remote-gen");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[REMOTE GEN] Timeout requesting type info", buf, 2u);
        }

        uint64_t v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", UAContinuityErrorDomain, -120, 0, v15, v16, v17, v18);
        objc_super v13 = (void *)v23[5];
        v23[5] = v12;
      }
    }
    if (v23[5])
    {
      ((void (*)(void (**)(id, void, void *), void))v4[2])(v4, 0);
    }
    else
    {
      [(UCRemotePasteboardGeneration *)self setDataRequested:1];
      if ((id)[(UCRemotePasteboardGeneration *)self streamProtocolVersion] == (id)2)
      {
        v14 = [(UCRemotePasteboardGeneration *)self dataRequester];
        [v14 requestStreamEndpointDataV2:v4];
      }
      else
      {
        v14 = [(UCRemotePasteboardGeneration *)self dataRequester];
        [v14 requestStreamEndpointData:v4];
      }
    }
    _Block_object_dispose(&v22, 8);
  }
}

- (UASharedPasteboardDataRequester)dataRequester
{
  return (UASharedPasteboardDataRequester *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataRequester:(id)a3
{
}

- (UASharedPasteboardInfo)pbInfo
{
  return (UASharedPasteboardInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPbInfo:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)returnEarly
{
  return self->_returnEarly;
}

- (void)setReturnEarly:(BOOL)a3
{
  self->_returnEarly = a3;
}

- (int64_t)streamProtocolVersion
{
  return self->_streamProtocolVersion;
}

- (void)setStreamProtocolVersion:(int64_t)a3
{
  self->_streamProtocolVersion = a3;
}

- (BOOL)dataRequested
{
  return self->_dataRequested;
}

- (void)setDataRequested:(BOOL)a3
{
  self->_dataRequested = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUuid:(id)a3
{
}

- (OS_dispatch_queue)respQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRespQueue:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_respQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pbInfo, 0);

  objc_storeStrong((id *)&self->_dataRequester, 0);
}

@end