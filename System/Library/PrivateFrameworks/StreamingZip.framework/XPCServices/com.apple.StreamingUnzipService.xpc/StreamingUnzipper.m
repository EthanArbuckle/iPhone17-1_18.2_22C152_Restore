@interface StreamingUnzipper
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)inProcessDelegateQueue;
- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate;
- (id)initForClient:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)finishStreamWithReply:(id)a3;
- (void)getPidForTestingWithReply:(id)a3;
- (void)setActiveDelegateMethods:(int)a3;
- (void)setInProcessDelegateQueue:(id)a3;
- (void)setInProcessExtractorDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setupUnzipperWithOutputPath:(id)a3 sandboxExtensionToken:(char *)a4 options:(id)a5 withReply:(id)a6;
- (void)streamingFileWriter:(id)a3 didEncounterError:(id)a4;
- (void)supplyBytes:(id)a3 withReply:(id)a4;
- (void)suspendStreamWithReply:(id)a3;
- (void)terminateStreamWithReply:(id)a3;
@end

@implementation StreamingUnzipper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inProcessDelegateQueue, 0);
  objc_destroyWeak((id *)&self->inProcessExtractorDelegate);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_asyncError, 0);
  objc_storeStrong((id *)&self->_asyncWorkTrackingGroup, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);

  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)setInProcessDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)inProcessDelegateQueue
{
  return self->inProcessDelegateQueue;
}

- (void)setInProcessExtractorDelegate:(id)a3
{
}

- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->inProcessExtractorDelegate);

  return (StreamingUnzipDelegateProtocol *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)getPidForTestingWithReply:(id)a3
{
  id v5 = a3;
  uint64_t v4 = getpid();
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, v4, 0);
}

- (void)terminateStreamWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  currentState = self->_currentState;
  v6 = sub_100003788();
  v7 = v6;
  if (currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(StreamingUnzipState *)self->_currentState unzipPath];
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Terminating extraction for %@", v12, 0xCu);
    }
    id v9 = sub_1000082FC((os_unfair_lock_s *)self);
    sub_100008364((uint64_t)self);
    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state, but the client was terminating the stream anyway.", v12, 2u);
    }

    v11 = sub_100004A7C((uint64_t)"-[StreamingUnzipper terminateStreamWithReply:]", 1912, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state, but the client was terminating the stream anyway.", v10, *(uint64_t *)v12);
    ((void (**)(id, void *))v4)[2](v4, v11);
  }
}

- (void)finishStreamWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  currentState = self->_currentState;
  v6 = sub_100003788();
  v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", buf, 2u);
    }

    sub_100004A7C((uint64_t)"-[StreamingUnzipper finishStreamWithReply:]", 1868, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v12, v62);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(StreamingUnzipState *)self->_currentState unzipPath];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finishing extraction for %@", buf, 0xCu);
  }
  uint64_t v9 = sub_1000082FC((os_unfair_lock_s *)self);
  if (v9)
  {
    id v10 = (id)v9;
    v11 = sub_100003788();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  uint64_t v13 = [(StreamingUnzipState *)self->_currentState finishStream];
  if (v13)
  {
    id v10 = (id)v13;
LABEL_13:
    sub_100008364((uint64_t)self);
    goto LABEL_14;
  }
  id v14 = [(StreamingUnzipState *)self->_currentState unzipPath];
  int v15 = removexattr((const char *)[v14 fileSystemRepresentation], "com.apple.streamingzip.incomplete_extraction", 1);

  if (v15 && *__error() != 93)
  {
    v16 = sub_100003788();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(StreamingUnzipState *)self->_currentState unzipPath];
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "com.apple.streamingzip.incomplete_extraction";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2080;
      v67 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to remove xattr named %s on %@ : %s", buf, 0x20u);
    }
  }
  if (![(StreamingUnzipState *)self->_currentState denyInvalidSymlinks])
  {
    id v10 = 0;
    goto LABEL_14;
  }
  id v20 = [(StreamingUnzipState *)self->_currentState unzipPath];
  if (!v20)
  {
    v37 = sub_100003788();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "base directory path cannot be nil", buf, 2u);
    }

    v39 = @"base directory path cannot be nil";
    uint64_t v40 = 1750;
    goto LABEL_40;
  }
  v21 = +[NSURL fileURLWithPath:v20 isDirectory:1];
  if (!v21)
  {
    v41 = sub_100003788();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "base directory URL cannot be nil (created from path: \"%@\")", buf, 0xCu);
    }

    uint64_t v62 = (uint64_t)v20;
    v39 = @"base directory URL cannot be nil (created from path: \"%@\")";
    uint64_t v40 = 1757;
LABEL_40:
    sub_100004A7C((uint64_t)"_ValidateAllSymlinksUnderPath", v40, @"SZExtractorErrorDomain", 2, 0, 0, v39, v38, v62);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0;
    goto LABEL_62;
  }
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_100008C8C;
  v67 = (char *)&unk_100028C88;
  id v68 = v21;
  id v22 = v68;
  v64 = buf;
  v73 = 0;
  uint64_t v74 = 0;
  id v23 = v22;
  v24 = (char *)[v23 fileSystemRepresentation];
  if (!v24)
  {
    v43 = sub_100003788();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v69 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "directory url fileSystemRepresentation cannot be NULL", v69, 2u);
    }

    v45 = @"directory url fileSystemRepresentation cannot be NULL";
    uint64_t v46 = 1694;
    goto LABEL_47;
  }
  v25 = v24;
  v73 = v24;
  uint64_t v74 = 0;
  v26 = fts_open(&v73, 84, 0);
  if (!v26)
  {
    v47 = sub_100003788();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v59 = __error();
      v60 = strerror(*v59);
      *(_DWORD *)v69 = 136315394;
      uint64_t v70 = (uint64_t)v25;
      __int16 v71 = 2080;
      v72 = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "fts_open failed for %s with error %s", v69, 0x16u);
    }

    v48 = __error();
    uint64_t v62 = (uint64_t)v25;
    strerror(*v48);
    v45 = @"fts_open failed for %s with error %s";
    uint64_t v46 = 1704;
LABEL_47:
    sub_100004A7C((uint64_t)"_TraverseDirectory", v46, @"SZExtractorErrorDomain", 2, 0, 0, v45, v44, v62);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v27 = v26;
  uint64_t v63 = (uint64_t)v25;
  v28 = 0;
  int v29 = 0;
  while (1)
  {
    v30 = fts_read(v27);
    if (!v30)
    {
      id v36 = v28;
      goto LABEL_53;
    }
    v31 = v30;
    int fts_info = v30->fts_info;
    if (fts_info == 10 || fts_info == 7) {
      break;
    }
    id v65 = v28;
    char v35 = (*(uint64_t (**)(unsigned char *, FTSENT *, id *))&buf[16])(v64, v31, &v65);
    id v36 = v65;

    int v29 = 1;
    v28 = v36;
    if ((v35 & 1) == 0)
    {
      int v29 = 0;
LABEL_53:
      uint64_t v52 = v63;
      goto LABEL_54;
    }
  }
  v51 = sub_100003788();
  uint64_t v52 = v63;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v61 = strerror(v31->fts_errno);
    *(_DWORD *)v69 = 136315394;
    uint64_t v70 = v63;
    __int16 v71 = 2080;
    v72 = v61;
    _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Error for path %s: %s", v69, 0x16u);
  }

  strerror(v31->fts_errno);
  sub_100004A7C((uint64_t)"_TraverseDirectory", 1713, @"SZExtractorErrorDomain", 2, 0, 0, @"Error for path %s: %s", v53, v63);
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  int v29 = 0;
LABEL_54:
  if (fts_close(v27))
  {
    int v54 = *__error();
    v55 = sub_100003788();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v58 = strerror(v54);
      *(_DWORD *)v69 = 136315394;
      uint64_t v70 = v52;
      __int16 v71 = 2080;
      v72 = v58;
      _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "fts_close on FTS for %s returned %s", v69, 0x16u);
    }
  }
  if (!v29)
  {
LABEL_48:
    id v36 = v36;
    char v49 = 0;
    v50 = v36;
    goto LABEL_60;
  }
  v50 = 0;
  char v49 = 1;
LABEL_60:

  id v42 = v50;
  if (v49)
  {
    v56 = 0;
    char v57 = 1;
    goto LABEL_63;
  }
LABEL_62:
  id v42 = v42;
  char v57 = 0;
  v56 = v42;
LABEL_63:

  id v10 = v56;
  if ((v57 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
  v4[2](v4, v10);
}

- (void)suspendStreamWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  currentState = self->_currentState;
  v6 = sub_100003788();
  v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v14, 2u);
    }

    v11 = sub_100004A7C((uint64_t)"-[StreamingUnzipper suspendStreamWithReply:]", 1836, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v13, *(uint64_t *)v14);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(StreamingUnzipState *)self->_currentState currentOffset];
    uint64_t v9 = [(StreamingUnzipState *)self->_currentState unzipPath];
    *(_DWORD *)id v14 = 134218242;
    *(void *)&v14[4] = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Suspending extraction at offset %llu for %@", v14, 0x16u);
  }
  uint64_t v10 = sub_1000082FC((os_unfair_lock_s *)self);
  if (v10)
  {
    v11 = (void *)v10;
    uint64_t v12 = sub_100003788();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v14 = 138412290;
      *(void *)&v14[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", v14, 0xCu);
    }

    sub_100008364((uint64_t)self);
LABEL_11:
    v4[2](v4, 0, v11);
    goto LABEL_15;
  }
  v11 = [(StreamingUnzipState *)self->_currentState serializeState];
  if (v11) {
    sub_100008364((uint64_t)self);
  }
  v4[2](v4, [(StreamingUnzipState *)self->_currentState currentOffset], v11);
LABEL_15:
}

- (void)supplyBytes:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100009648;
  id v20 = sub_100009658;
  id v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v8 = [v6 length];
  uint64_t v9 = sub_100003830();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    id v23 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES_UNZIP_SERVICE", "Begin processing %lu bytes in StreamingUnzipper", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009660;
  v11[3] = &unk_100028C60;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  v11[7] = v8;
  [v6 enumerateByteRangesUsingBlock:v11];
  uint64_t v10 = sub_100003830();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    id v23 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES_UNZIP_SERVICE", "End processing %lu bytes in StreamingUnzipper", buf, 0xCu);
  }

  v7[2](v7, v17[5], *((unsigned __int8 *)v13 + 24));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

- (void)dealloc
{
  v3 = sub_100003788();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(StreamingUnzipState *)self->_currentState unzipPath];
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocating state for extraction to %@", buf, 0xCu);
  }
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0;

  free(self->_decompressionOutputBuffer);
  if (self->_sandboxToken) {
    sandbox_extension_release();
  }
  v6.receiver = self;
  v6.super_class = (Class)StreamingUnzipper;
  [(StreamingUnzipper *)&v6 dealloc];
}

- (void)streamingFileWriter:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003788();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "StreamingFileWriter %@ encountered error %@", (uint8_t *)&v12, 0x16u);
  }

  p_asyncErrorLock = &self->_asyncErrorLock;
  os_unfair_lock_lock(&self->_asyncErrorLock);
  asyncError = self->_asyncError;
  p_asyncError = &self->_asyncError;
  if (!asyncError) {
    objc_storeStrong((id *)p_asyncError, a4);
  }
  os_unfair_lock_unlock(p_asyncErrorLock);
}

- (void)setActiveDelegateMethods:(int)a3
{
  id v5 = sub_100003788();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set active delegate methods to 0x%x", (uint8_t *)v6, 8u);
  }

  self->_activeDelegateMethods = a3;
}

- (void)setupUnzipperWithOutputPath:(id)a3 sandboxExtensionToken:(char *)a4 options:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, id, void))a6;
  id v13 = [v11 objectForKey:@"SZExtractorOptionsAssertQOS"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = [v11 objectForKey:@"SZExtractorOptionsAssertQOS"];
    id v16 = [v15 unsignedIntValue];

    qos_class_t v17 = qos_class_self();
    if (v17 != v16)
    {
      qos_class_t v32 = v17;
      v33 = sub_100003788();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x", buf, 0xEu);
      }

      sub_100004A7C((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 74, NSPOSIXErrorDomain, 22, 0, 0, @"Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x", v34, (uint64_t)v16);
      goto LABEL_30;
    }
  }
  if (a4)
  {
    int64_t v18 = sandbox_extension_consume();
    self->_sandboxToken = v18;
    if (v18 == -1)
    {
      int v35 = *__error();
      id v36 = sub_100003788();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v35);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension token for %@ : %s (%d)", buf, 0x1Cu);
      }

      strerror(v35);
      sub_100004A7C((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 85, NSPOSIXErrorDomain, v35, 0, 0, @"Failed to consume sandbox extension token for %@ : %s (%d)", v37, (uint64_t)v10);
      goto LABEL_30;
    }
  }
  if (self->_hasConnection)
  {
    id v19 = v10;
    id v20 = [v19 fileSystemRepresentation];
    long long v21 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v21;
    id v44 = v20;
    int v22 = sandbox_check_by_audit_token();
    if (v22)
    {
      if (v22 == -1) {
        int v23 = *__error();
      }
      else {
        int v23 = 1;
      }
      uint64_t v40 = sub_100003788();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v23);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Cannot write to path %@ : %s (%d)", buf, 0x1Cu);
      }

      strerror(v23);
      sub_100004A7C((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 97, NSPOSIXErrorDomain, v23, 0, 0, @"Cannot write to path %@ : %s (%d)", v41, (uint64_t)v19);
LABEL_30:
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v29, 0);
      goto LABEL_31;
    }
  }
  v24 = sub_100003788();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [v11 objectForKey:@"SZExtractorOptionsHashedChunkSize"];
    id v26 = [v25 unsignedLongLongValue];
    v27 = [v11 objectForKey:@"SZExtractorOptionsHashesArray"];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Initialized with path %@ ; hashed chunk size %llu ; hashes %@",
      buf,
      0x20u);
  }
  id v45 = 0;
  v28 = +[StreamingUnzipState unzipStateWithPath:v10 options:v11 error:&v45];
  id v29 = v45;
  currentState = self->_currentState;
  self->_currentState = v28;

  v31 = self->_currentState;
  if (!v29)
  {
    if (!v31) {
      __assert_rtn("-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", "StreamingUnzipper.m", 109, "error || _currentState");
    }
    goto LABEL_21;
  }
  if (v31)
  {
LABEL_21:
    id v38 = v10;
    if (setxattr((const char *)[v38 fileSystemRepresentation], "com.apple.streamingzip.incomplete_extraction", "y", 1uLL, 0, 1))
    {
      v39 = sub_100003788();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v42 = __error();
        v43 = strerror(*v42);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to set incomplete extraction xattr on %@ : %s", buf, 0x16u);
      }
    }
  }
  v12[2](v12, v29, [(StreamingUnzipState *)self->_currentState currentOffset]);
LABEL_31:
}

- (id)initForClient:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)StreamingUnzipper;
  id v8 = [(StreamingUnzipper *)&v18 init];
  if (v8)
  {
    id v9 = +[NSString stringWithFormat:@"Unzip session on behalf of %@", v6];
    [v9 UTF8String];
    uint64_t v10 = os_transaction_create();
    id v11 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v10;

    dispatch_group_t v12 = dispatch_group_create();
    id v13 = (void *)*((void *)v8 + 12);
    *((void *)v8 + 12) = v12;

    if (v7)
    {
      objc_storeWeak((id *)v8 + 15, v7);
      v8[8] = 1;
      [v7 auditToken];
      long long v14 = v16;
      *(_OWORD *)(v8 + 28) = v17;
    }
    else
    {
      *(void *)&long long v14 = -1;
      *((void *)&v14 + 1) = -1;
      *(_OWORD *)(v8 + 28) = v14;
    }
    *(_OWORD *)(v8 + 12) = v14;
  }
  return v8;
}

@end