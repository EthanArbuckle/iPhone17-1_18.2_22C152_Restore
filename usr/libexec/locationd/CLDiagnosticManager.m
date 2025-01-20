@interface CLDiagnosticManager
+ (BOOL)isSupported;
- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLDiagnosticManager)init;
- (NSFileManager)fileManager;
- (NSMutableSet)registeredFiles;
- (NSURL)mobileCrashReporterPath;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (id)pathForDate:(id)a3 withBasePath:(id)a4;
- (void)beginService;
- (void)copyRegisteredFilesWithHandler:(id)a3;
- (void)endService;
- (void)registerFileForCollection:(id)a3;
- (void)setConnection:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setListener:(id)a3;
- (void)setRegisteredFiles:(id)a3;
- (void)unregisterFileForCollection:(id)a3;
@end

@implementation CLDiagnosticManager

+ (BOOL)isSupported
{
  return 1;
}

- (CLDiagnosticManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDiagnosticManager;
  return [(CLDiagnosticManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDiagnosticManagerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLDiagnosticManagerClientProtocol];
}

- (void)beginService
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  objc_super v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#diagnosticManager beginService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  self->_registeredFiles = (NSMutableSet *)objc_opt_new();
  v4 = (NSFileManager *)objc_opt_new();
  self->_fileManager = v4;
  [(NSFileManager *)v4 setDelegate:self];
  v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.locationd.diagnostic"];
  self->_listener = v5;
  [(NSXPCListener *)v5 setDelegate:self];
  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", [objc_msgSend(-[CLDiagnosticManager universe](self, "universe"), "silo") queue]);
  [(NSXPCListener *)self->_listener resume];
}

- (void)endService
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  objc_super v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#diagnosticManager endService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager endService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }

  self->_fileManager = 0;
  [(NSXPCListener *)self->_listener invalidate];

  self->_listener = 0;
  self->_registeredFiles = 0;
}

- (void)registerFileForCollection:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Add file to #diagnosticManager: %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager registerFileForCollection:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (a3)
  {
    [(NSMutableSet *)[(CLDiagnosticManager *)self registeredFiles] addObject:a3];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to register a nil NSURL", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CDEE8);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDiagnosticManager registerFileForCollection:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)unregisterFileForCollection:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remove file to #diagnosticManager: %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager unregisterFileForCollection:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (a3)
  {
    [(NSMutableSet *)[(CLDiagnosticManager *)self registeredFiles] removeObject:a3];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to unregister a nil NSURL", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CDEE8);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDiagnosticManager unregisterFileForCollection:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)copyRegisteredFilesWithHandler:(id)a3
{
  id v5 = [(CLDiagnosticManager *)self pathForDate:+[NSDate date] withBasePath:[(CLDiagnosticManager *)self mobileCrashReporterPath]];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client requested #diagnosticManager file copy to dest: %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    int v28 = 138412290;
    id v29 = v5;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager copyRegisteredFilesWithHandler:]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  id v26 = 0;
  [(NSFileManager *)[(CLDiagnosticManager *)self fileManager] createDirectoryAtURL:v5 withIntermediateDirectories:0 attributes:0 error:0];
  v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [(CLDiagnosticManager *)self registeredFiles];
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    id v20 = a3;
    uint64_t v10 = *(void *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v11);
        id v13 = [v5 URLByAppendingPathComponent:[v12 lastPathComponent]];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CDEE8);
        }
        v14 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v31 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "diagnosticManager trying to copy file: %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022CDEE8);
          }
          int v28 = 138412290;
          id v29 = v12;
          v16 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager copyRegisteredFilesWithHandler:]", "%s\n", v16);
          if (v16 != (char *)buf) {
            free(v16);
          }
        }
        [(NSFileManager *)[(CLDiagnosticManager *)self fileManager] copyItemAtURL:v12 toURL:v13 error:&v26];
        if (v26)
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022CDEE8);
          }
          v15 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289794;
            *(_DWORD *)v31 = 0;
            *(_WORD *)&v31[4] = 2082;
            *(void *)&v31[6] = "";
            __int16 v32 = 2114;
            v33 = v12;
            __int16 v34 = 2114;
            id v35 = v13;
            __int16 v36 = 2114;
            id v37 = v26;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Failed to copy diagnostic file\", \"srcURL\":%{public, location:escape_only}@, \"dstURL\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x30u);
          }
        }
        else
        {
          [v21 addObject:v13];
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v17 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v9 = v17;
    }
    while (v17);
    id v18 = v26;
    a3 = v20;
  }
  else
  {
    id v18 = 0;
  }
  (*((void (**)(id, void *, id))a3 + 2))(a3, v21, v18);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#diagnosticManager received new XPC Connection request", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    LOWORD(v23) = 0;
    id v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  if (a4)
  {
    id v7 = [a4 valueForEntitlement:@"com.apple.locationd.diagnostic"];
    if (v7)
    {
      id v8 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue])
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100876C40;
        v22[3] = &unk_10229FED8;
        v22[4] = self;
        [a4 setInterruptionHandler:v22];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100876DEC;
        v21[3] = &unk_10229FED8;
        v21[4] = self;
        [a4 setInvalidationHandler:v21];
        [a4 _setQueue:[objc_msgSend(-[CLDiagnosticManager universe](self, "universe"), "silo") queue]];
        [a4 setExportedInterface:[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLDiagnosticManagerXPCServerInterface]];
        [a4 setExportedObject:self];
        [(CLDiagnosticManager *)self setConnection:a4];
        [a4 resume];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CDEE8);
        }
        id v9 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v26 = a4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#diagnosticManager Resuming XPC Connection: %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022CDEE8);
          }
          int v23 = 138412290;
          id v24 = a4;
          v19 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v19);
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
        LOBYTE(v10) = 1;
        return v10;
      }
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022CDF08);
    }
    v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      unsigned int v12 = [a4 processIdentifier];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)id v26 = 0;
      *(_WORD *)&v26[4] = 2082;
      *(void *)&v26[6] = "";
      __int16 v27 = 2082;
      int v28 = "com.apple.locationd.diagnostic";
      __int16 v29 = 1026;
      unsigned int v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#diagnosticManager missing entitlement\", \"entitlement\":%{public, location:escape_only}s, \"pid\":%{public}d}", buf, 0x22u);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022CDF08);
      }
    }
    id v13 = qword_102419528;
    BOOL v10 = os_signpost_enabled((os_log_t)qword_102419528);
    if (v10)
    {
      unsigned int v14 = [a4 processIdentifier];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)id v26 = 0;
      *(_WORD *)&v26[4] = 2082;
      *(void *)&v26[6] = "";
      __int16 v27 = 2082;
      int v28 = "com.apple.locationd.diagnostic";
      __int16 v29 = 1026;
      unsigned int v30 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#diagnosticManager missing entitlement", "{\"msg%{public}.0s\":\"#diagnosticManager missing entitlement\", \"entitlement\":%{public, location:escape_only}s, \"pid\":%{public}d}", buf, 0x22u);
LABEL_23:
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v15 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Why didn't we get a connection?", buf, 2u);
    }
    BOOL v16 = sub_10013D1A0(115, 0);
    LOBYTE(v10) = 0;
    if (v16)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CDEE8);
      }
      LOWORD(v23) = 0;
      id v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
      goto LABEL_23;
    }
  }
  return v10;
}

- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CDEE8);
  }
  id v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412546;
    *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
    WORD2(buf[0].__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#diagnosticManager fileManager asking if should copy from %@ to %@", (uint8_t *)buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    id v13 = (std::string *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDiagnosticManager fileManager:shouldCopyItemAtURL:toURL:]", "%s\n", (const char *)v13);
    if (v13 != buf) {
      free(v13);
    }
  }
  sub_10053B99C(0, buf);
  if ((buf[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v8 = buf;
  }
  else {
    id v8 = (std::string *)buf[0].__r_.__value_.__r.__words[0];
  }
  id v9 = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithUTF8String:v8]);
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  unsigned __int8 v10 = [[objc_msgSend(a4, "absoluteString") hasPrefix:-[NSURL absoluteString](v9, "absoluteString")];
  if ((v10 & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CDEE8);
    }
    v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Trying to move a file that is not in our cache directory: %@", (uint8_t *)buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CDEE8);
      }
      unsigned int v14 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDiagnosticManager fileManager:shouldCopyItemAtURL:toURL:]", "%s\n", (const char *)v14);
      if (v14 != buf) {
        free(v14);
      }
    }
  }
  return v10;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6
{
  return 0;
}

- (NSURL)mobileCrashReporterPath
{
  if (qword_10247E620 != -1) {
    dispatch_once(&qword_10247E620, &stru_1022CDEA8);
  }
  return (NSURL *)qword_10247E618;
}

- (id)pathForDate:(id)a3 withBasePath:(id)a4
{
  if (qword_10247E630 != -1) {
    dispatch_once(&qword_10247E630, &stru_1022CDEC8);
  }
  id v6 = [(id)qword_10247E628 stringFromDate:a3];

  return [a4 URLByAppendingPathComponent:v6];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)registeredFiles
{
  return self->_registeredFiles;
}

- (void)setRegisteredFiles:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end