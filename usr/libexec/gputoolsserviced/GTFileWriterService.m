@interface GTFileWriterService
- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4;
- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5;
- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation GTFileWriterService

- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GTFileWriterService;
  v12 = [(GTFileWriterService *)&v24 init];
  if (v12)
  {
    v13 = NSTemporaryDirectory();
    DeleteAllArchives(v13);

    v14 = GTTransportArchiveDirectory();
    DeleteAllArchives(v14);

    os_log_t v15 = os_log_create("com.apple.gputools.transport", "FileWriterService");
    log = v12->_log;
    v12->_log = (OS_os_log *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessions = v12->_sessions;
    v12->_sessions = v17;

    objc_storeStrong((id *)&v12->_connectionProvider, a3);
    objc_storeStrong((id *)&v12->_deviceUDID, a4);
    objc_storeStrong((id *)&v12->_urlAccessProvider, a5);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.gputools.filetransfer", 0);
    fileTransferQueue = v12->_fileTransferQueue;
    v12->_fileTransferQueue = (OS_dispatch_queue *)v19;

    dispatch_semaphore_t v21 = dispatch_semaphore_create(1);
    writeSem = v12->_writeSem;
    v12->_writeSem = (OS_dispatch_semaphore *)v21;
  }
  return v12;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = GTTransportArchiveDirectory();
  v18 = [v17 stringByAppendingPathComponent:v15];
  id v19 = +[NSURL fileURLWithPath:v18 isDirectory:1];

  [(GTFileWriterService *)self initiateTransfer:v16 basePath:v15 fromDevice:v14 toURL:v19 options:v13 completionHandler:v12];
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  ++dword_100041CFC;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [v11 lastPathComponent];
  v17 = [v16 stringByDeletingPathExtension];

  v18 = [v11 pathExtension];
  id v19 = [[v17 stringByAppendingFormat:@"-%04u", dword_100041CFC];
  v20 = [v19 stringByAppendingPathExtension:v18];

  dispatch_semaphore_t v21 = NSTemporaryDirectory();
  v22 = [v21 stringByAppendingPathComponent:v20];

  v23 = +[NSURL fileURLWithPath:v22 isDirectory:1];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000E7B0;
  v27[3] = &unk_100034A20;
  id v28 = v23;
  id v29 = v12;
  v27[4] = self;
  id v24 = v23;
  id v25 = v12;
  [(GTFileWriterService *)self initiateTransfer:v15 basePath:v11 fromDevice:v14 toURL:v24 options:v13 completionHandler:v27];
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v48 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v41 = log;
    id v42 = [v17 chunkSize];
    unint64_t v43 = (unint64_t)[v17 compressionAlgorithm];
    if (v43 > 5) {
      v44 = "<UNKNOWN>";
    }
    else {
      v44 = off_100034B48[v43];
    }
    *(_DWORD *)buf = 138413314;
    id v60 = v48;
    __int16 v61 = 2112;
    id v62 = v15;
    __int16 v63 = 2112;
    id v64 = v16;
    __int16 v65 = 2048;
    id v66 = v42;
    __int16 v67 = 2080;
    v68 = v44;
    _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Initiate transfer basePath:%@ device:%@ toURL:%@ chunkSize:%lu compression:%s", buf, 0x34u);
  }
  if (sub_10000EDAC(v17))
  {
    id v52 = 0;
    v20 = +[GTFileWriterSession sessionWithFileEntries:v14 relativeToURL:v16 options:v17 error:&v52];
    id v21 = v52;
    if (v20)
    {
      id v46 = v16;
      id v47 = v14;
      unint64_t v22 = self->_sessionCounts + 1;
      self->_sessionCounts = v22;
      sessions = self->_sessions;
      id v24 = +[NSNumber numberWithUnsignedLongLong:v22];
      [(NSMutableDictionary *)sessions setObject:v20 forKeyedSubscript:v24];

      id v25 = [(GTConnectionProvider *)self->_connectionProvider connectionForDeviceUDID:v15];
      v26 = v25;
      if (v25)
      {
        v27 = sub_10000A84C(v25, v15, self->_connectionProvider);
        if (v27)
        {
          id v28 = [GTFileWriterServiceXPCProxy alloc];
          [v27 serviceProperties];
          id v29 = v45 = v15;
          v30 = [(GTFileWriterServiceXPCProxy *)v28 initWithConnection:v26 remoteProperties:v29];

          deviceUDID = self->_deviceUDID;
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_10000EE00;
          v49[3] = &unk_100034A48;
          v49[4] = self;
          unint64_t v51 = v22;
          id v50 = v18;
          v32 = v48;
          v33 = deviceUDID;
          id v15 = v45;
          [(GTFileWriterServiceXPCProxy *)v30 beginTransferSessionWithFileEntries:v47 basePath:v48 toDevice:v33 options:v17 sessionID:v22 completionHandler:v49];
        }
        else
        {
          NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
          v39 = +[NSString stringWithFormat:@"Service is unavailable: \"%@\", @"GTFileWriterService""];
          v54 = v39;
          v40 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v30 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:1 userInfo:v40];

          (*((void (**)(id, GTFileWriterServiceXPCProxy *))v18 + 2))(v18, v30);
          v32 = v48;
        }
      }
      else
      {
        NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
        v37 = +[NSString stringWithFormat:@"Unable to find remote connection"];
        v56 = v37;
        v38 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v27 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:5 userInfo:v38];

        (*((void (**)(id, void *))v18 + 2))(v18, v27);
        v32 = v48;
      }

      id v16 = v46;
      id v14 = v47;
    }
    else
    {
      (*((void (**)(id, id))v18 + 2))(v18, v21);
      v32 = v48;
    }
  }
  else
  {
    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterService", @"options sent to initiateTransfer are invalid."];
    v35 = id v34 = v16;
    v58 = v35;
    v36 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    id v21 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v36];

    id v16 = v34;
    (*((void (**)(id, id))v18 + 2))(v18, v21);
    v32 = v48;
  }
}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = [(GTURLAccessProvider *)self->_urlAccessProvider urlForPath:v15];
  if (![v14 count])
  {
    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    CFStringRef v55 = @"No files specified";
    id v21 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    unint64_t v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:v21];
    goto LABEL_9;
  }
  if (sub_10000EDAC(v17))
  {
    v20 = [(GTConnectionProvider *)self->_connectionProvider connectionForDeviceUDID:v16];
    id v21 = v20;
    if (v20)
    {
      unint64_t v22 = sub_10000A84C(v20, v16, self->_connectionProvider);
      if (v22)
      {
        v36 = v22;
        v23 = [GTFileWriterServiceXPCProxy alloc];
        [v36 serviceProperties];
        id v24 = v38 = v19;
        id v25 = [(GTFileWriterServiceXPCProxy *)v23 initWithConnection:v21 remoteProperties:v24];

        [v38 startAccessingSecurityScopedResource];
        v26 = +[NSURL fileURLWithPath:v15 isDirectory:1];
        queue = self->_fileTransferQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000F3E8;
        block[3] = &unk_100034AC0;
        id v40 = v14;
        id v41 = v26;
        id v42 = v17;
        unint64_t v43 = self;
        v44 = v25;
        unint64_t v47 = a7;
        id v45 = v38;
        id v46 = v18;
        v27 = v25;
        id v28 = v26;
        unint64_t v22 = v36;
        id v19 = v38;
        id v29 = v28;
        dispatch_async(queue, block);
      }
      else
      {
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        v37 = +[NSString stringWithFormat:@"Service is unavailable: \"%@\", @"GTFileWriterService""];
        v49 = v37;
        id v34 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        id v29 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:1 userInfo:v34];

        (*((void (**)(id, id))v18 + 2))(v18, v29);
      }

      goto LABEL_12;
    }
    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    v32 = +[NSString stringWithFormat:@"Unable to find remote connection"];
    unint64_t v51 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    unint64_t v22 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:5 userInfo:v33];

LABEL_9:
    (*((void (**)(id, void *))v18 + 2))(v18, v22);
LABEL_12:

    goto LABEL_13;
  }
  NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
  v30 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterService", @"options sent to beginTransferSessionWithFileEntries is invalid"];
  NSErrorUserInfoKey v53 = v30;
  v31 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  id v21 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v31];

  (*((void (**)(id, void *))v18 + 2))(v18, v21);
LABEL_13:
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  sessions = self->_sessions;
  id v8 = a5;
  id v9 = a3;
  id v11 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v11];
  [v10 writeFileData:v9 completionHandler:v8];
}

- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4
{
  sessions = self->_sessions;
  id v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v9 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v8];

  id v10 = self->_sessions;
  id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  LOBYTE(a4) = [v9 finish:a4];
  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSem, 0);
  objc_storeStrong((id *)&self->_urlAccessProvider, 0);
  objc_storeStrong((id *)&self->_fileTransferQueue, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end