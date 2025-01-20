@interface ValidDelegate
- (BOOL)finishedDownloading;
- (NSFileHandle)currentUpdateFile;
- (NSString)currentUpdateServer;
- (NSURL)currentUpdateFileURL;
- (OS_dispatch_queue)revDbUpdateQueue;
- (OS_os_transaction)transaction;
- (id)handler;
- (int64_t)versionFromTask:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)reschedule;
- (void)setCurrentUpdateFile:(id)a3;
- (void)setCurrentUpdateFileURL:(id)a3;
- (void)setCurrentUpdateServer:(id)a3;
- (void)setFinishedDownloading:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setRevDbUpdateQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)updateDb:(int64_t)a3;
@end

@implementation ValidDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdateFileURL, 0);
  objc_storeStrong((id *)&self->_currentUpdateFile, 0);
  objc_storeStrong((id *)&self->_currentUpdateServer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_revDbUpdateQueue, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)setFinishedDownloading:(BOOL)a3
{
  self->_finishedDownloading = a3;
}

- (BOOL)finishedDownloading
{
  return self->_finishedDownloading;
}

- (void)setCurrentUpdateFileURL:(id)a3
{
}

- (NSURL)currentUpdateFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentUpdateFile:(id)a3
{
}

- (NSFileHandle)currentUpdateFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentUpdateServer:(id)a3
{
}

- (NSString)currentUpdateServer
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRevDbUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)revDbUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_10001CB28("validupdate");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v18 = 138412802;
      CFAbsoluteTime Current = *(double *)&v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Session %@ task %@ failed with error %@", (uint8_t *)&v18, 0x20u);
    }

    v13 = +[TrustAnalytics logger];
    [v13 logResultForEvent:@"ValidUpdateEvent" hardFailure:0 result:v10];

    [(ValidDelegate *)self reschedule];
    [(NSFileHandle *)self->_currentUpdateFile closeFile];
    currentUpdateFile = self->_currentUpdateFile;
    self->_currentUpdateFile = 0;

    currentUpdateServer = self->_currentUpdateServer;
    self->_currentUpdateServer = 0;

    currentUpdateFileURL = self->_currentUpdateFileURL;
    self->_currentUpdateFileURL = 0;
  }
  else
  {
    if (v12)
    {
      int v18 = 134217984;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "download finished at %f", (uint8_t *)&v18, 0xCu);
    }

    self->_finishedDownloading = 1;
    [(ValidDelegate *)self updateDb:[(ValidDelegate *)self versionFromTask:v9]];
  }
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  currentUpdateFile = self->_currentUpdateFile;
  if (currentUpdateFile)
  {
    [(NSFileHandle *)currentUpdateFile writeData:v10];
  }
  else
  {
    BOOL v12 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "received data, but output file is not open", v13, 2u);
    }

    [v9 cancel];
    [(ValidDelegate *)self reschedule];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  v14 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v14;

  id v16 = [v12 statusCode];
  v17 = sub_10001CB28("validupdate");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v39 = [v12 MIMEType];
    *(_DWORD *)buf = 138413314;
    CFAbsoluteTime v42 = *(double *)&v10;
    __int16 v43 = 2112;
    id v44 = v11;
    __int16 v45 = 2048;
    id v46 = v16;
    __int16 v47 = 2112;
    v48 = v39;
    __int16 v49 = 2048;
    id v50 = [v12 expectedContentLength];
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Session %@ data task %@ returned response %ld (%@), expecting %lld bytes", buf, 0x34u);
  }
  if (sub_10005233C() == qword_10008A920 && v16 == (id)403)
  {
    int v18 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFAbsoluteTime v42 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "failed to connect to URL. canceling task %@", buf, 0xCu);
    }

    v13[2](v13, 0);
    qword_10008A920 = 4;
LABEL_17:
    [(ValidDelegate *)self reschedule];
    goto LABEL_29;
  }
  CFURLRef v19 = sub_100020F2C(@"update-current");
  currentUpdateFileURL = self->_currentUpdateFileURL;
  if (v19) {
    id v21 = (NSURL *)v19;
  }
  else {
    id v21 = 0;
  }
  self->_currentUpdateFileURL = v21;

  __int16 v22 = [(NSURL *)self->_currentUpdateFileURL fileSystemRepresentation];
  if (!v22)
  {
    v26 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFAbsoluteTime v42 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "failed to find revocation info directory. canceling task %@", buf, 0xCu);
    }

    v13[2](v13, 0);
    goto LABEL_17;
  }
  v24 = (const char *)v22;
  remove(v22, v23);
  int v25 = open(v24, 1538, 420);
  if (v25 < 0)
  {
    v27 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_currentUpdateFileURL;
      int v29 = *__error();
      *(_DWORD *)buf = 138412546;
      CFAbsoluteTime v42 = *(double *)&v28;
      __int16 v43 = 1024;
      LODWORD(v44) = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "unable to open %@ (errno %d)", buf, 0x12u);
    }
  }
  else
  {
    close(v25);
  }
  v30 = sub_10001CB28("validupdate");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v42 = Current;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "download started at %f", buf, 0xCu);
  }

  v32 = self->_currentUpdateFileURL;
  id v40 = 0;
  v33 = +[NSFileHandle fileHandleForWritingToURL:v32 error:&v40];
  id v34 = v40;
  currentUpdateFile = self->_currentUpdateFile;
  self->_currentUpdateFile = v33;

  if (self->_currentUpdateFile)
  {
    v13[2](v13, 1);
  }
  else
  {
    v36 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_currentUpdateFileURL;
      *(_DWORD *)buf = 138412802;
      CFAbsoluteTime v42 = *(double *)&v37;
      __int16 v43 = 2112;
      id v44 = v34;
      __int16 v45 = 2112;
      id v46 = v11;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "failed to open %@: %@. canceling task %@", buf, 0x20u);
    }

    v38 = +[TrustAnalytics logger];
    [v38 logResultForEvent:@"ValidUpdateEvent" hardFailure:0 result:v34];

    v13[2](v13, 0);
    [(ValidDelegate *)self reschedule];
  }

LABEL_29:
}

- (int64_t)versionFromTask:(id)a3
{
  id v3 = [a3 taskDescription];
  int64_t v4 = atol((const char *)[v3 cStringUsingEncoding:4]);

  return v4;
}

- (void)updateDb:(int64_t)a3
{
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10003DB38;
  v26[4] = sub_10003DB48;
  v5 = self->_currentUpdateFileURL;
  v27 = v5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10003DB38;
  v24[4] = sub_10003DB48;
  int v25 = self->_currentUpdateServer;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10003DB38;
  v22[4] = sub_10003DB48;
  v6 = self->_currentUpdateFile;
  id v23 = v6;
  if (v5 && v6)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_10003DB38;
    v20[4] = sub_10003DB48;
    id v21 = (id)0xAAAAAAAAAAAAAAAALL;
    id v21 = (id)os_transaction_create();
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_10003DB38;
    int v18 = sub_10003DB48;
    id v19 = 0;
    v7 = dispatch_get_global_queue(25, 0);
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);
    id v9 = (void *)v15[5];
    v15[5] = (uint64_t)v8;

    id v10 = v15[5];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003DB50;
    handler[3] = &unk_10007F3B0;
    handler[4] = v20;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_activate((dispatch_object_t)v15[5]);
    revDbUpdateQueue = self->_revDbUpdateQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003DBD8;
    v12[3] = &unk_10007F3D8;
    v12[4] = self;
    v12[5] = v26;
    v12[6] = &v14;
    v12[7] = v20;
    v12[8] = v24;
    v12[9] = v22;
    v12[10] = a3;
    dispatch_async(revDbUpdateQueue, v12);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(v20, 8);
  }
  else
  {
    [(ValidDelegate *)self reschedule];
  }
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

- (void)reschedule
{
  id v3 = sub_10001CB28("validupdate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_finishedDownloading) {
      int64_t v4 = "update";
    }
    else {
      int64_t v4 = "download";
    }
    int v6 = 136315394;
    v7 = v4;
    __int16 v8 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s canceled at %f", (uint8_t *)&v6, 0x16u);
  }

  (*((void (**)(void))self->_handler + 2))();
  qword_10008AE08 = sub_10004FAD4(0);
  sub_100048740(*(double *)&qword_10008AE08);
  qword_10008AE00 = 0;
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;
  }
}

@end