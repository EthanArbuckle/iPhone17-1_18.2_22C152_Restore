@interface StreamingUnzipper
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)inProcessDelegateQueue;
- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate;
- (id)_beginNonStreamablePassthroughWithRemainingBytes:(uint64_t)a3 length:;
- (id)initForClient:(id)a3 connection:(id)a4;
- (os_unfair_lock_s)_waitForAsyncFileWriterCompletionAndGetAsyncError;
- (void)_sendExtractionProgress:(uint64_t)a1;
- (void)_setErrorState;
- (void)_supplyBytes:(size_t)a3 length:(void *)a4 withReply:;
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
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  currentState = self->_currentState;
  v6 = SZGetLoggingHandle();
  v7 = v6;
  if (currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(StreamingUnzipState *)self->_currentState unzipPath];
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = v8;
      _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "Terminating extraction for %@", v12, 0xCu);
    }
    id v9 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state, but the client was terminating the stream anyway.", v12, 2u);
    }

    v11 = _CreateError((uint64_t)"-[StreamingUnzipper terminateStreamWithReply:]", 1912, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state, but the client was terminating the stream anyway.", v10, *(uint64_t *)v12);
    ((void (**)(id, void *))v4)[2](v4, v11);
  }
}

- (os_unfair_lock_s)_waitForAsyncFileWriterCompletionAndGetAsyncError
{
  v1 = a1;
  if (a1)
  {
    v2 = *(NSObject **)&a1[24]._os_unfair_lock_opaque;
    if (v2) {
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    }
    v3 = v1 + 28;
    os_unfair_lock_lock(v1 + 28);
    v1 = *(os_unfair_lock_s **)&v1[26]._os_unfair_lock_opaque;
    if (v1) {
      uint64_t v4 = v1;
    }
    os_unfair_lock_unlock(v3);
  }

  return v1;
}

- (void)_setErrorState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 64) setStreamState:8];
    v2 = [*(id *)(a1 + 64) unzipPath];
    if (v2)
    {
      v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v7 = 0;
      char v4 = [v3 removeItemAtPath:v2 error:&v7];
      id v5 = v7;

      if ((v4 & 1) == 0)
      {
        v6 = SZGetLoggingHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v9 = v2;
          __int16 v10 = 2112;
          id v11 = v5;
          _os_log_error_impl(&dword_1DD5BF000, v6, OS_LOG_TYPE_ERROR, "Failed to remove unzip path at %@ : %@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)finishStreamWithReply:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, id))a3;
  currentState = self->_currentState;
  v6 = SZGetLoggingHandle();
  id v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", buf, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipper finishStreamWithReply:]", 1868, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v12, v62);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(StreamingUnzipState *)self->_currentState unzipPath];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "Finishing extraction for %@", buf, 0xCu);
  }
  uint64_t v9 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
  if (v9)
  {
    id v10 = (id)v9;
    id v11 = SZGetLoggingHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  uint64_t v13 = [(StreamingUnzipState *)self->_currentState finishStream];
  if (v13)
  {
    id v10 = (id)v13;
LABEL_13:
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
    goto LABEL_14;
  }
  id v14 = [(StreamingUnzipState *)self->_currentState unzipPath];
  int v15 = removexattr((const char *)[v14 fileSystemRepresentation], "com.apple.streamingzip.incomplete_extraction", 1);

  if (v15 && *__error() != 93)
  {
    v16 = SZGetLoggingHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(StreamingUnzipState *)self->_currentState unzipPath];
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "com.apple.streamingzip.incomplete_extraction";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2080;
      v67 = v19;
      _os_log_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_DEFAULT, "Failed to remove xattr named %s on %@ : %s", buf, 0x20u);
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
    v37 = SZGetLoggingHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v37, OS_LOG_TYPE_ERROR, "base directory path cannot be nil", buf, 2u);
    }

    v39 = @"base directory path cannot be nil";
    uint64_t v40 = 1750;
    goto LABEL_40;
  }
  v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:1];
  if (!v21)
  {
    v41 = SZGetLoggingHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_error_impl(&dword_1DD5BF000, v41, OS_LOG_TYPE_ERROR, "base directory URL cannot be nil (created from path: \"%@\")", buf, 0xCu);
    }

    uint64_t v62 = (uint64_t)v20;
    v39 = @"base directory URL cannot be nil (created from path: \"%@\")";
    uint64_t v40 = 1757;
LABEL_40:
    _CreateError((uint64_t)"_ValidateAllSymlinksUnderPath", v40, @"SZExtractorErrorDomain", 2, 0, 0, v39, v38, v62);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0;
    goto LABEL_62;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ValidateAllSymlinksUnderPath_block_invoke;
  v67 = (char *)&unk_1E6CD1F00;
  id v68 = v21;
  id v22 = v68;
  v64 = buf;
  v73 = 0;
  uint64_t v74 = 0;
  id v23 = v22;
  v24 = (char *)[v23 fileSystemRepresentation];
  if (!v24)
  {
    v43 = SZGetLoggingHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v69 = 0;
      _os_log_error_impl(&dword_1DD5BF000, v43, OS_LOG_TYPE_ERROR, "directory url fileSystemRepresentation cannot be NULL", v69, 2u);
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
    v47 = SZGetLoggingHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v59 = __error();
      v60 = strerror(*v59);
      *(_DWORD *)v69 = 136315394;
      uint64_t v70 = (uint64_t)v25;
      __int16 v71 = 2080;
      v72 = v60;
      _os_log_error_impl(&dword_1DD5BF000, v47, OS_LOG_TYPE_ERROR, "fts_open failed for %s with error %s", v69, 0x16u);
    }

    v48 = __error();
    uint64_t v62 = (uint64_t)v25;
    strerror(*v48);
    v45 = @"fts_open failed for %s with error %s";
    uint64_t v46 = 1704;
LABEL_47:
    _CreateError((uint64_t)"_TraverseDirectory", v46, @"SZExtractorErrorDomain", 2, 0, 0, v45, v44, v62);
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
    v34 = (void *)MEMORY[0x1E01BA640]();
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
  v51 = SZGetLoggingHandle();
  uint64_t v52 = v63;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v61 = strerror(v31->fts_errno);
    *(_DWORD *)v69 = 136315394;
    uint64_t v70 = v63;
    __int16 v71 = 2080;
    v72 = v61;
    _os_log_error_impl(&dword_1DD5BF000, v51, OS_LOG_TYPE_ERROR, "Error for path %s: %s", v69, 0x16u);
  }

  strerror(v31->fts_errno);
  _CreateError((uint64_t)"_TraverseDirectory", 1713, @"SZExtractorErrorDomain", 2, 0, 0, @"Error for path %s: %s", v53, v63);
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  int v29 = 0;
LABEL_54:
  if (fts_close(v27))
  {
    int v54 = *__error();
    v55 = SZGetLoggingHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v58 = strerror(v54);
      *(_DWORD *)v69 = 136315394;
      uint64_t v70 = v52;
      __int16 v71 = 2080;
      v72 = v58;
      _os_log_error_impl(&dword_1DD5BF000, v55, OS_LOG_TYPE_ERROR, "fts_close on FTS for %s returned %s", v69, 0x16u);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void, void *))a3;
  currentState = self->_currentState;
  v6 = SZGetLoggingHandle();
  id v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v14, 2u);
    }

    id v11 = _CreateError((uint64_t)"-[StreamingUnzipper suspendStreamWithReply:]", 1836, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v13, *(uint64_t *)v14);
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
    _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "Suspending extraction at offset %llu for %@", v14, 0x16u);
  }
  uint64_t v10 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = SZGetLoggingHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v14 = 138412290;
      *(void *)&v14[4] = v11;
      _os_log_impl(&dword_1DD5BF000, v12, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", v14, 0xCu);
    }

    -[StreamingUnzipper _setErrorState]((uint64_t)self);
LABEL_11:
    v4[2](v4, 0, v11);
    goto LABEL_15;
  }
  id v11 = [(StreamingUnzipState *)self->_currentState serializeState];
  if (v11) {
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
  }
  v4[2](v4, [(StreamingUnzipState *)self->_currentState currentOffset], v11);
LABEL_15:
}

- (void)supplyBytes:(id)a3 withReply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__457;
  id v20 = __Block_byref_object_dispose__458;
  id v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = [v6 length];
  uint64_t v9 = SZGetTraceHandle();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES_UNZIP_SERVICE", "Begin processing %lu bytes in StreamingUnzipper", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__StreamingUnzipper_supplyBytes_withReply___block_invoke;
  v11[3] = &unk_1E6CD1ED8;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  v11[7] = v8;
  [v6 enumerateByteRangesUsingBlock:v11];
  uint64_t v10 = SZGetTraceHandle();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES_UNZIP_SERVICE", "End processing %lu bytes in StreamingUnzipper", buf, 0xCu);
  }

  v7[2](v7, v17[5], *((unsigned __int8 *)v13 + 24));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

void __43__StreamingUnzipper_supplyBytes_withReply___block_invoke(uint64_t a1, const Bytef *a2, uint64_t a3, size_t a4, unsigned char *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = SZGetLoggingHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    _os_log_debug_impl(&dword_1DD5BF000, v10, OS_LOG_TYPE_DEBUG, "Got block of length %lu at offset %lu", buf, 0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__StreamingUnzipper_supplyBytes_withReply___block_invoke_2;
  v13[3] = &unk_1E6CD1EB0;
  long long v14 = *(_OWORD *)(a1 + 40);
  -[StreamingUnzipper _supplyBytes:length:withReply:](v11, a2, a4, v13);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a5 = 1;
  }
}

void __43__StreamingUnzipper_supplyBytes_withReply___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (void)_supplyBytes:(size_t)a3 length:(void *)a4 withReply:
{
  v566[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a1) {
    goto LABEL_519;
  }
  v511 = a2;
  size_t v510 = a3;
  uint64_t v8 = *(void **)(a1 + 64);
  v469 = (id *)(a1 + 64);
  if (!v8)
  {
    v275 = SZGetLoggingHandle();
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v552.st_dev) = 0;
      _os_log_error_impl(&dword_1DD5BF000, v275, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", (uint8_t *)&v552, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 470, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v276, v446);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v465 = 0;
    uint64_t v15 = 0;
    goto LABEL_512;
  }
  uint64_t v467 = a1;
  v463 = v7;
  v465 = [v8 unzipPath];
  id v9 = 0;
  p_st_uid = &v552.st_uid;
  uint64_t v462 = *MEMORY[0x1E4F28328];
  v458 = (void *)*MEMORY[0x1E4F28798];
  *(void *)&long long v10 = 138412546;
  long long v456 = v10;
  *(void *)&long long v10 = 136315138;
  long long v452 = v10;
  *(void *)&long long v10 = 136315394;
  long long v454 = v10;
  *(void *)&long long v10 = 136316162;
  long long v451 = v10;
  *(void *)&long long v10 = 138412290;
  long long v457 = v10;
  *(void *)&long long v10 = 138413058;
  long long v455 = v10;
  *(void *)&long long v10 = 134217984;
  long long v459 = v10;
  *(void *)&long long v10 = 67109632;
  long long v453 = v10;
  *(void *)&long long v10 = 136315650;
  long long v449 = v10;
  uint64_t v11 = v469;
  while (2)
  {
    unint64_t v12 = v510;
    if (!v510)
    {
LABEL_377:
      uint64_t v15 = 0;
      id v7 = v463;
      a1 = v467;
      goto LABEL_512;
    }
    uint64_t v13 = (void *)MEMORY[0x1E01BA640]();
    int v14 = [*v11 streamState];
    a1 = v467;
    uint64_t v15 = 0;
    switch(v14)
    {
      case 0:
        if (![*v11 currentLFRecord]) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 485, "_currentState.currentLFRecord");
        }
        _CopyStreamBytesToRecord([*v11 currentLFRecord], 4, *v11, (const void **)&v511, &v510);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16) {
          goto LABEL_463;
        }
        if ((unint64_t)[*v11 thisStageBytesComplete] >= 5) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 493, "_currentState.thisStageBytesComplete <= peekSignatureSize");
        }
        uint64_t v17 = [*v11 thisStageBytesComplete];
        id v18 = *v11;
        if (v17 == 4)
        {
          int v19 = *(_DWORD *)[v18 currentLFRecord];
          id v20 = *v11;
          if (v19 != 67324752)
          {
            v337 = [v20 unsureData];

            if (v337)
            {
              v338 = SZGetLoggingHandle();
              if (os_log_type_enabled(v338, OS_LOG_TYPE_DEFAULT))
              {
                int v339 = *(unsigned __int8 *)[*v11 currentLFRecord];
                int v340 = *(unsigned __int8 *)([*v469 currentLFRecord] + 1);
                uid_t v341 = *(unsigned __int8 *)([*v469 currentLFRecord] + 2);
                gid_t v342 = *(unsigned __int8 *)([*v469 currentLFRecord] + 3);
                v552.st_dev = 67109888;
                *(_DWORD *)&v552.st_mode = v339;
                LOWORD(v552.st_ino) = 1024;
                *(_DWORD *)((char *)&v552.st_ino + 2) = v340;
                HIWORD(v552.st_ino) = 1024;
                v552.st_uid = v341;
                LOWORD(v552.st_gvoid (**v4)(id, id) = 1024;
                *(gid_t *)((char *)&v552.st_gid + 2) = v342;
                _os_log_impl(&dword_1DD5BF000, v338, OS_LOG_TYPE_DEFAULT, "Got unexpected local file signature %c%c%c%c ; entering passthrough mode",
                  (uint8_t *)&v552,
                  0x1Au);
              }

              v315 = v511;
              uint64_t v317 = v510;
              uint64_t v316 = a1;
LABEL_431:
              -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v316, (uint64_t)v315, v317);
              id v9 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_474;
            }
            if (*(_DWORD *)[*v11 currentLFRecord] != 33639248)
            {
              v377 = SZGetLoggingHandle();
              if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v552.st_dev) = 0;
                _os_log_error_impl(&dword_1DD5BF000, v377, OS_LOG_TYPE_ERROR, "Encountered unexpectedly non-stream-compliant data in stream!", (uint8_t *)&v552, 2u);
              }

              v565 = @"SZExtractorFileOffsetErrorKey";
              v378 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
              v566[0] = v378;
              v379 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v566 forKeys:&v565 count:1];
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 552, @"SZExtractorErrorDomain", 2, 0, v379, @"Encountered unexpectedly non-stream-compliant data in stream!", v380, v446);
              id v9 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_474;
            }
            if ([*v11 bytesHashedInChunk])
            {
              v407 = [*v11 lastChunkPartialHash];

              if (!v407)
              {
                v410 = SZGetLoggingHandle();
                if (os_log_type_enabled(v410, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v552.st_dev) = 0;
                  _os_log_debug_impl(&dword_1DD5BF000, v410, OS_LOG_TYPE_DEBUG, "No last chunk partial hash; will need full chunk to validate.",
                    (uint8_t *)&v552,
                    2u);
                }
                v409 = 0;
                goto LABEL_525;
              }
              uint64_t v408 = [*v11 checkLastChunkPartialHash];
              if (v408)
              {
                v409 = (void *)v408;
                v410 = SZGetLoggingHandle();
                if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(v552.st_dev) = 0;
                  _os_log_error_impl(&dword_1DD5BF000, v410, OS_LOG_TYPE_ERROR, "Last chunk's partial hash did not validate (store hashed chunk size mismatch?); consuming more data "
                    "to check full chunk.",
                    (uint8_t *)&v552,
                    2u);
                }
LABEL_525:

                v420 = SZGetLoggingHandle();
                if (os_log_type_enabled(v420, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v552.st_dev) = 0;
                  _os_log_debug_impl(&dword_1DD5BF000, v420, OS_LOG_TYPE_DEBUG, "Finished central directory signature; updating hash with remainder of stream data",
                    (uint8_t *)&v552,
                    2u);
                }

                size_t v421 = v510;
                if ([*v11 hashedChunkSize])
                {
                  uint64_t v422 = [*v11 hashedChunkSize];
                  uint64_t v423 = [*v11 bytesHashedInChunk];
                  if (v422 - v423 >= v421) {
                    size_t v424 = v421;
                  }
                  else {
                    size_t v424 = v422 - v423;
                  }
                }
                else
                {
                  size_t v424 = v421;
                }
                id v425 = *v11;
                uint64_t v426 = [*v11 currentOffset];
                id v9 = [v425 updateHashFromOffset:v426 withBytes:v511 length:v424 onlyFinishCurrentChunk:1];

                objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v424);
                if (v9) {
                  goto LABEL_454;
                }
                if ([*v11 bytesHashedInChunk])
                {
                  if (v424 != v421) {
                    __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 543, "lengthToRead == length");
                  }
                  v427 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v427, OS_LOG_TYPE_DEBUG))
                  {
                    LOWORD(v552.st_dev) = 0;
                    _os_log_debug_impl(&dword_1DD5BF000, v427, OS_LOG_TYPE_DEBUG, "After hitting Central Directory, we need more data to finish the chunk", (uint8_t *)&v552, 2u);
                  }

                  [*v469 setStreamState:6];
                  id v9 = 0;
                  goto LABEL_454;
                }
                v437 = SZGetLoggingHandle();
                if (os_log_type_enabled(v437, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v552.st_dev) = 0;
                  _os_log_debug_impl(&dword_1DD5BF000, v437, OS_LOG_TYPE_DEBUG, "After hitting Central Directory, we had enough data already to finish the chunk", (uint8_t *)&v552, 2u);
                }

                [*v469 setStreamState:7];
                id v9 = 0;
                uint64_t v15 = 1;
                goto LABEL_455;
              }
            }
            else
            {
              v412 = SZGetLoggingHandle();
              if (os_log_type_enabled(v412, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v439 = [*v11 currentOffset];
                v552.st_dev = v459;
                *(void *)&v552.st_mode = v439;
                _os_log_debug_impl(&dword_1DD5BF000, v412, OS_LOG_TYPE_DEBUG, "Finished central directory signature at offset %llu and we are also at a chunk boundary.", (uint8_t *)&v552, 0xCu);
              }
            }
LABEL_509:
            [*v11 setStreamState:7];
            id v9 = 0;
LABEL_510:
            uint64_t v15 = 1;
            goto LABEL_511;
          }
          [v20 setStreamState:1];
        }
        else
        {
          [v18 markResumptionPoint];
        }
        id v9 = 0;
LABEL_55:
        int v56 = 3;
LABEL_359:
        if (v56 != 3) {
          goto LABEL_377;
        }
        continue;
      case 1:
        if (![*v11 currentLFRecord]) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 567, "_currentState.currentLFRecord");
        }
        if ((unint64_t)[*v11 thisStageBytesComplete] > 0x1D) {
          goto LABEL_16;
        }
        _CopyStreamBytesToRecord([*v11 currentLFRecord], 30, *v11, (const void **)&v511, &v510);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16) {
          goto LABEL_463;
        }
        id v9 = 0;
LABEL_16:
        if ([*v11 thisStageBytesComplete] != 30) {
          goto LABEL_21;
        }
        objc_msgSend(*v11, "setCurrentLFRequiresDataDescriptor:", (*(unsigned __int16 *)(objc_msgSend(*v11, "currentLFRecord") + 6) >> 3) & 1);
        int v21 = *(unsigned __int16 *)([*v11 currentLFRecord] + 26);
        id v22 = *v11;
        if (!v21)
        {
          v328 = [v22 unsureData];

          v329 = SZGetLoggingHandle();
          v330 = v329;
          if (v328)
          {
            if (os_log_type_enabled(v329, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v552.st_dev) = 0;
              v331 = "Got zero-length filename; entering passthrough mode";
              v332 = v330;
              uint32_t v333 = 2;
              goto LABEL_425;
            }
LABEL_426:

            v334 = v511;
            uint64_t v335 = v510;
            uint64_t v336 = a1;
LABEL_439:
            uint64_t v345 = -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v336, (uint64_t)v334, v335);
LABEL_440:
            id v16 = (id)v345;
LABEL_462:

            goto LABEL_463;
          }
          if (os_log_type_enabled(v329, OS_LOG_TYPE_ERROR))
          {
            uint64_t v428 = [*v11 currentOffset];
            v552.st_dev = v459;
            *(void *)&v552.st_mode = v428;
            _os_log_error_impl(&dword_1DD5BF000, v330, OS_LOG_TYPE_ERROR, "Encountered zero-length filename for local file record at offset %llu", (uint8_t *)&v552, 0xCu);
          }

          v563 = @"SZExtractorFileOffsetErrorKey";
          v374 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v564 = v374;
          v375 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v564 forKeys:&v563 count:1];
          uint64_t v443 = [*v11 currentOffset];
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 589, @"SZExtractorErrorDomain", 2, 0, v375, @"Encountered zero-length filename for local file record at offset %llu", v376, v443);
          uint64_t v28 = LABEL_504:;

LABEL_395:
          uint64_t v15 = 0;
          id v9 = (id)v28;
          goto LABEL_511;
        }
        uint64_t v23 = *(unsigned __int16 *)([v22 currentLFRecord] + 8);
        if ((v23 > 0xE || ((1 << v23) & 0x4101) == 0) && v23 != 99)
        {
          v398 = [*v11 unsureData];

          v399 = SZGetLoggingHandle();
          v330 = v399;
          if (v398)
          {
            if (os_log_type_enabled(v399, OS_LOG_TYPE_DEFAULT))
            {
              v552.st_dev = 67109120;
              *(_DWORD *)&v552.st_mode = v23;
              v331 = "Got unexpected compression method: %hu; entering passthrough mode";
              v332 = v330;
              uint32_t v333 = 8;
LABEL_425:
              _os_log_impl(&dword_1DD5BF000, v332, OS_LOG_TYPE_DEFAULT, v331, (uint8_t *)&v552, v333);
            }
            goto LABEL_426;
          }
          if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR))
          {
            __darwin_ino64_t v438 = [*v11 currentOffset];
            v552.st_dev = 67109376;
            *(_DWORD *)&v552.st_mode = v23;
            LOWORD(v552.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v552.st_ino + 2) = v438;
            _os_log_error_impl(&dword_1DD5BF000, v330, OS_LOG_TYPE_ERROR, "Encountered unsupported compression method %hu in stream at offset %llu", (uint8_t *)&v552, 0x12u);
          }

          v561 = @"SZExtractorFileOffsetErrorKey";
          v374 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v562 = v374;
          v375 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v562 forKeys:&v561 count:1];
          [*v11 currentOffset];
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 601, @"SZExtractorErrorDomain", 2, 0, v375, @"Encountered unsupported compression method %hu in stream at offset %llu", v411, v23);
          goto LABEL_504;
        }
LABEL_21:
        uint64_t v24 = v510;
        id v25 = *v11;
        if (!v510)
        {
LABEL_400:
          [v25 markResumptionPoint];
          goto LABEL_474;
        }
        if ((unint64_t)[v25 thisStageBytesComplete] <= 0x1D) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 617, "_currentState.thisStageBytesComplete >= sizeof(LocalFileRecord)");
        }
        uint64_t v26 = [*v11 currentLFRecord];
        unint64_t v27 = *(unsigned __int16 *)(v26 + 26) + (unint64_t)*(unsigned __int16 *)(v26 + 28) + 30;
        if (v27 > [*v11 currentLFRecordAllocationSize])
        {
          objc_msgSend(*v11, "setCurrentLFRecord:", reallocf(objc_msgSend(*v11, "currentLFRecord"), v27));
          if (![*v11 currentLFRecord])
          {
            v343 = SZGetLoggingHandle();
            if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v552.st_dev) = 0;
              _os_log_error_impl(&dword_1DD5BF000, v343, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", (uint8_t *)&v552, 2u);
            }

            uint64_t v345 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 624, v458, 12, 0, 0, @"Could not allocate memory for local file record", v344, v446);
            goto LABEL_440;
          }
          [*v11 setCurrentLFRecordAllocationSize:v27];
        }
        if ([*v11 thisStageBytesComplete] < v27)
        {
          uint64_t v28 = _CopyStreamBytesToRecord([*v11 currentLFRecord], v27, *v11, (const void **)&v511, &v510);

          if (v28) {
            goto LABEL_395;
          }
          uint64_t v24 = v510;
          if (!v510)
          {
LABEL_407:
            id v47 = *v11;
LABEL_408:
            [v47 markResumptionPoint];
            id v9 = 0;
LABEL_474:
            uint64_t v15 = 0;
            goto LABEL_511;
          }
          id v9 = 0;
        }
        if ([*v11 thisStageBytesComplete] != v27) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 643, "_currentState.thisStageBytesComplete == fullLFRSize");
        }
        if (([*v11 currentLFRequiresDataDescriptor] & 1) == 0)
        {
          uint64_t UncompressedSize = _GetUncompressedSize(*v11);
          uint64_t CompressedSize = _GetCompressedSize(*v11);
          id v31 = *v11;
          if (!CompressedSize && UncompressedSize)
          {
            v346 = [v31 unsureData];

            v347 = SZGetLoggingHandle();
            v348 = v347;
            if (v346)
            {
              if (os_log_type_enabled(v347, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v552.st_dev) = 0;
                _os_log_impl(&dword_1DD5BF000, v348, OS_LOG_TYPE_DEFAULT, "File has 0-length compressed size but non-zero uncompressed size; entering passthrough mode",
                  (uint8_t *)&v552,
                  2u);
              }

              v334 = v511;
              uint64_t v336 = a1;
              uint64_t v335 = v24;
              goto LABEL_439;
            }
            if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
            {
              uint64_t v429 = [*v11 currentOffset];
              v552.st_dev = v459;
              *(void *)&v552.st_mode = v429;
              _os_log_error_impl(&dword_1DD5BF000, v348, OS_LOG_TYPE_ERROR, "Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size", (uint8_t *)&v552, 0xCu);
            }

            v559 = @"SZExtractorFileOffsetErrorKey";
            v374 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v560 = v374;
            v375 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v560 forKeys:&v559 count:1];
            uint64_t v444 = [*v11 currentOffset];
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 658, @"SZExtractorErrorDomain", 2, 0, v375, @"Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size", v381, v444);
            goto LABEL_504;
          }
          if (!*(_WORD *)([v31 currentLFRecord] + 8) && UncompressedSize != CompressedSize)
          {
            v349 = v13;
            v350 = [*v11 unsureData];

            v351 = SZGetLoggingHandle();
            v352 = v351;
            if (v350)
            {
              if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v552.st_dev) = 0;
                _os_log_impl(&dword_1DD5BF000, v352, OS_LOG_TYPE_DEFAULT, "Stored file has compressed size != uncompressed size; entering passthrough mode",
                  (uint8_t *)&v552,
                  2u);
              }

              uint64_t v353 = -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v24);
            }
            else
            {
              if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
              {
                uint64_t v430 = [*v11 currentOffset];
                v552.st_dev = 134218496;
                *(void *)&v552.st_mode = v430;
                WORD2(v552.st_ino) = 2048;
                *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = UncompressedSize;
                HIWORD(v552.st_gvoid (**v4)(id, id) = 2048;
                *(void *)&v552.st_rdev = CompressedSize;
                _os_log_error_impl(&dword_1DD5BF000, v352, OS_LOG_TYPE_ERROR, "Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)", (uint8_t *)&v552, 0x20u);
              }

              v557 = @"SZExtractorFileOffsetErrorKey";
              v382 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
              v558 = v382;
              v383 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v558 forKeys:&v557 count:1];
              uint64_t v384 = [*v11 currentOffset];
              uint64_t v353 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 671, @"SZExtractorErrorDomain", 2, 0, v383, @"Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)", v385, v384);
            }
            uint64_t v15 = 0;
            id v9 = (id)v353;
            uint64_t v13 = v349;
            goto LABEL_511;
          }
        }
        id v468 = v9;
        v464 = v13;
        GetFileNameStringFromLocalFileRecord((_WORD *)[*v11 currentLFRecord]);
        id v9 = objc_claimAutoreleasedReturnValue();
        v32 = (const char *)[v9 fileSystemRepresentation];
        id v33 = *v11;
        if (!v9 || !v32)
        {
          v318 = [v33 unsureData];

          v319 = SZGetLoggingHandle();
          v320 = v319;
          if (v318)
          {
            BOOL v321 = os_log_type_enabled(v319, OS_LOG_TYPE_DEFAULT);
            uint64_t v13 = v464;
            if (v321)
            {
              LOWORD(v552.st_dev) = 0;
              _os_log_impl(&dword_1DD5BF000, v320, OS_LOG_TYPE_DEFAULT, "Failed to get filename for file; entering passthrough mode",
                (uint8_t *)&v552,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v24);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v367 = os_log_type_enabled(v319, OS_LOG_TYPE_ERROR);
            uint64_t v13 = v464;
            if (v367)
            {
              uint64_t v419 = [*v11 currentOffset];
              v552.st_dev = v459;
              *(void *)&v552.st_mode = v419;
              _os_log_error_impl(&dword_1DD5BF000, v320, OS_LOG_TYPE_ERROR, "Failed to get filename for file at offset %llu.", (uint8_t *)&v552, 0xCu);
            }

            v555 = @"SZExtractorFileOffsetErrorKey";
            v368 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v556 = v368;
            v369 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v556 forKeys:&v555 count:1];
            uint64_t v370 = [*v11 currentOffset];
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 686, @"SZExtractorErrorDomain", 2, 0, v369, @"Failed to get filename for file at offset %llu.", v371, v370);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_461;
        }
        uint64_t v34 = [v33 currentLFRecord];
        int v35 = *(unsigned __int8 *)(*(unsigned __int16 *)(v34 + 26) + v34 + 29);
        [*v11 setPerformingExtraction:1];
        uint64_t v36 = [*v11 currentLFRecord];
        v37 = v11;
        int v38 = *(unsigned __int16 *)(v36 + 8);
        int v39 = [*v37 currentLFRequiresDataDescriptor];
        uint64_t v40 = SZGetTraceHandle();
        BOOL v41 = os_signpost_enabled(v40);
        if (v39)
        {
          if (!v41) {
            goto LABEL_78;
          }
          v552.st_dev = v456;
          *(void *)&v552.st_mode = v9;
          WORD2(v552.st_ino) = 1024;
          *(_DWORD *)((char *)&v552.st_ino + 6) = v38;
          id v42 = v40;
          v43 = "Processing file %@ (csize: ??; usize: ??; cmethod: %hu)";
          uint32_t v44 = 18;
        }
        else
        {
          if (!v41) {
            goto LABEL_78;
          }
          uint64_t v74 = v469;
          uint64_t v75 = _GetCompressedSize(*v469);
          uint64_t v76 = _GetUncompressedSize(*v74);
          v552.st_dev = v455;
          *(void *)&v552.st_mode = v9;
          WORD2(v552.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = v75;
          HIWORD(v552.st_gvoid (**v4)(id, id) = 2048;
          *(void *)&v552.st_rdev = v76;
          LOWORD(v552.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&v552.st_atimespec.tv_sec + 2) = v38;
          id v42 = v40;
          v43 = "Processing file %@ (csize: %llu; usize: %llu; cmethod: %hu)";
          uint32_t v44 = 38;
        }
        _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v42, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", v43, (uint8_t *)&v552, v44);
LABEL_78:

        uint64_t v11 = v469;
        if (v35 == 47 && ([*v469 currentLFRequiresDataDescriptor] & 1) == 0 && _GetCompressedSize(*v11))
        {
          v372 = [*v11 unsureData];

          v373 = SZGetLoggingHandle();
          v322 = v373;
          if (v372)
          {
            if (os_log_type_enabled(v373, OS_LOG_TYPE_DEFAULT))
            {
              v552.st_dev = v452;
              *(void *)&v552.st_mode = v32;
              v324 = "Got directory %s with non-zero compressed data size; entering passthrough mode";
              v325 = v322;
              uint32_t v326 = 12;
LABEL_419:
              _os_log_impl(&dword_1DD5BF000, v325, OS_LOG_TYPE_DEFAULT, v324, (uint8_t *)&v552, v326);
            }
LABEL_420:

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v24);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
            {
              v552.st_dev = v452;
              *(void *)&v552.st_mode = v32;
              _os_log_error_impl(&dword_1DD5BF000, v322, OS_LOG_TYPE_ERROR, "Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
                (uint8_t *)&v552,
                0xCu);
            }

            v553 = @"SZExtractorFileOffsetErrorKey";
            v404 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v554 = v404;
            v405 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v554 forKeys:&v553 count:1];
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 708, @"SZExtractorErrorDomain", 2, 0, v405, @"Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
              v406,
              (uint64_t)v32);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v13 = v464;
LABEL_461:

          goto LABEL_462;
        }
        v77 = [*v11 unsureData];

        if (!v77) {
          goto LABEL_108;
        }
        if ((unint64_t)[*v11 recordsProcessed] >= 3) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 714, "_currentState.recordsProcessed <= 2");
        }
        if ([*v11 recordsProcessed])
        {
          if ([*v11 recordsProcessed] != 1)
          {
            if ([*v11 recordsProcessed] != 2 || strcmp(v32, "META-INF/com.apple.ZipMetadata.plist"))
            {
LABEL_417:
              v322 = SZGetLoggingHandle();
              if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v323 = [*v11 recordsProcessed];
                v552.st_dev = 134218498;
                *(void *)&v552.st_mode = v323;
                WORD2(v552.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v32;
                HIWORD(v552.st_gvoid (**v4)(id, id) = 2080;
                *(void *)&v552.st_rdev = "META-INF/";
                v324 = "Item %lld (%s) in archive was not 'mimetype' or %s; entering passthrough mode";
                v325 = v322;
                uint32_t v326 = 32;
                goto LABEL_419;
              }
              goto LABEL_420;
            }
LABEL_105:
            v93 = SZGetLoggingHandle();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            {
              v552.st_dev = v452;
              *(void *)&v552.st_mode = v32;
              _os_log_debug_impl(&dword_1DD5BF000, v93, OS_LOG_TYPE_DEBUG, "File %s is metadata file, so keeping in memory", (uint8_t *)&v552, 0xCu);
            }

            [*v11 setStoreCurrentFileInMemory:1];
            goto LABEL_108;
          }
          if (!strcmp(v32, "META-INF/com.apple.ZipMetadata.plist")) {
            goto LABEL_105;
          }
          v78 = v32;
          v79 = "META-INF/";
        }
        else
        {
          if (!strcmp(v32, "META-INF/")) {
            goto LABEL_108;
          }
          v78 = v32;
          v79 = "mimetype";
        }
        if (strcmp(v78, v79)) {
          goto LABEL_417;
        }
LABEL_108:
        if (!strcmp(v32, "META-INF/com.apple.FixedZipMetadata.bin"))
        {
          v94 = SZGetLoggingHandle();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            v552.st_dev = v452;
            *(void *)&v552.st_mode = v32;
            _os_log_debug_impl(&dword_1DD5BF000, v94, OS_LOG_TYPE_DEBUG, "File %s is fixed metadata file, so keeping in memory", (uint8_t *)&v552, 0xCu);
          }

          [*v11 setStoreCurrentFileInMemory:1];
        }
        id v95 = [v465 stringByAppendingPathComponent:v9];
        v96 = (const char *)[v95 fileSystemRepresentation];
        v97 = [*v11 streamInfoDict];

        id v98 = *v11;
        if (!v97)
        {
          if (v35 == 47) {
            uint64_t v105 = 16877;
          }
          else {
            uint64_t v105 = 33188;
          }
          goto LABEL_137;
        }
        uint64_t v99 = [v98 currentLFRecord];
        if (*(_WORD *)(v99 + 28))
        {
          ExtraFieldWithSignature = GetExtraFieldWithSignature(v99 + *(unsigned __int16 *)(v99 + 26) + 30, *(unsigned __int16 *)(v99 + 28), &kStreamingZipLFExtraFieldSignature);
          if (ExtraFieldWithSignature)
          {
            if (ExtraFieldWithSignature[1] >= 2u)
            {
              uint64_t v105 = ExtraFieldWithSignature[2];
              id v98 = *v11;
LABEL_137:
              [v98 setCurrentLFMode:v105];
              goto LABEL_155;
            }
          }
        }
        v101 = [*v11 streamInfoDict];
        v102 = v101;
        if (v35 == 47)
        {
          v103 = [v101 objectForKeyedSubscript:@"StandardDirectoryPerms"];

          if (!v103)
          {
            uint64_t v104 = 16877;
            goto LABEL_154;
          }
LABEL_122:
          uint64_t v104 = [v103 unsignedShortValue];
          goto LABEL_154;
        }
        v103 = [v101 objectForKeyedSubscript:@"StandardFilePerms"];

        if (v103) {
          goto LABEL_122;
        }
        uint64_t v104 = 33188;
LABEL_154:
        [*v11 setCurrentLFMode:v104];

LABEL_155:
        objc_msgSend(*v11, "setCurrentLFMode:", objc_msgSend(*v11, "currentLFMode") & 0xFFFFF1FFLL);
        if (([*v11 currentLFMode] & 0xF000) == 0xA000)
        {
          v125 = SZGetLoggingHandle();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
          {
            int v246 = [*v11 currentLFMode];
            v552.st_dev = v454;
            *(void *)&v552.st_mode = v32;
            WORD2(v552.st_ino) = 1024;
            *(_DWORD *)((char *)&v552.st_ino + 6) = v246;
            _os_log_debug_impl(&dword_1DD5BF000, v125, OS_LOG_TYPE_DEBUG, "File %s is a symlink (mode = 0%o), so keeping in memory", (uint8_t *)&v552, 0x12u);
          }

          [*v11 setStoreCurrentFileInMemory:1];
        }
        LFuint64_t UncompressedSize = GetLFUncompressedSize([*v11 currentLFRecord]);
        if (LFUncompressedSize > 0x500000)
        {
          __darwin_ino64_t v127 = LFUncompressedSize;
          v128 = SZGetLoggingHandle();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
          {
            v552.st_dev = v454;
            *(void *)&v552.st_mode = v32;
            WORD2(v552.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = v127;
            _os_log_debug_impl(&dword_1DD5BF000, v128, OS_LOG_TYPE_DEBUG, "File %s is larger than 5 MB (%llu) so not keeping in memory", (uint8_t *)&v552, 0x16u);
          }

          [*v11 setStoreCurrentFileInMemory:0];
        }
        v129 = [v95 stringByDeletingLastPathComponent];
        if ([v129 isEqualToString:v465]) {
          goto LABEL_176;
        }
        id v130 = v129;
        v131 = (const char *)[v130 fileSystemRepresentation];
        memset(&v552, 0, sizeof(v552));
        if (!stat(v131, &v552)) {
          goto LABEL_176;
        }
        if (*__error() != 2)
        {
          uint64_t v152 = *__error();
          v153 = SZGetLoggingHandle();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
          {
            v259 = strerror(v152);
            uid_t v548 = v456;
            id v549 = v130;
            __int16 v550 = 2080;
            v551 = v259;
            _os_log_error_impl(&dword_1DD5BF000, v153, OS_LOG_TYPE_ERROR, "Can't determine if parent path exists %@: %s", (uint8_t *)&v548, 0x16u);
          }

          uint64_t v544 = v462;
          id v545 = v130;
          v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v545 forKeys:&v544 count:1];
          strerror(v152);
          v156 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 881, v458, v152, 0, v154, @"Can't determine if parent path exists %@: %s", v155, (uint64_t)v130);

          goto LABEL_200;
        }
        v466 = v96;
        v132 = SZGetLoggingHandle();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
        {
          uid_t v548 = v457;
          id v549 = v130;
          _os_log_debug_impl(&dword_1DD5BF000, v132, OS_LOG_TYPE_DEBUG, "Parent path %@ did not exist", (uint8_t *)&v548, 0xCu);
        }

        int v133 = mkpath_np(v131, 0x1EDu);
        int v134 = v133;
        int v56 = 0;
        int v135 = 1;
        if (v133 && v133 != 17)
        {
          v136 = SZGetLoggingHandle();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v274 = strerror(v134);
            uid_t v548 = v456;
            id v549 = v130;
            __int16 v550 = 2080;
            v551 = v274;
            _os_log_error_impl(&dword_1DD5BF000, v136, OS_LOG_TYPE_ERROR, "Failed to create parent directory %@: %s", (uint8_t *)&v548, 0x16u);
          }

          uint64_t v546 = v462;
          id v547 = v130;
          v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v547 forKeys:&v546 count:1];
          strerror(v134);
          v139 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 834, v458, v134, 0, v137, @"Failed to create parent directory %@: %s", v138, (uint64_t)v130);

          int v135 = 0;
          int v56 = 2;
          id v468 = v139;
        }
        v96 = v466;
        if (v134 && v134 != 17 && !v135) {
          goto LABEL_207;
        }
LABEL_176:
        InfoZipExtraFieldFromLF = GetInfoZipExtraFieldFromLF([*v11 currentLFRecord]);
        id v141 = *v11;
        if (v35 == 47)
        {
          if ((~[v141 currentLFMode] & 0xC0) != 0) {
            objc_msgSend(*v11, "setCurrentLFMode:", objc_msgSend(*v11, "currentLFMode") | 0xC0);
          }
          if (mkdir(v96, [*v11 currentLFMode]))
          {
            if (*__error() != 17)
            {
              uint64_t v157 = *__error();
              v158 = SZGetLoggingHandle();
              if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
              {
                v260 = strerror(v157);
                v552.st_dev = v456;
                *(void *)&v552.st_mode = v95;
                WORD2(v552.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v260;
                _os_log_error_impl(&dword_1DD5BF000, v158, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@: %s", (uint8_t *)&v552, 0x16u);
              }

              uint64_t v542 = v462;
              id v543 = v95;
              v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v543 forKeys:&v542 count:1];
              strerror(v157);
              v156 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 899, v458, v157, 0, v159, @"Failed to create directory at path %@: %s", v160, (uint64_t)v95);

LABEL_200:
              int v56 = 2;
              id v468 = v156;
              goto LABEL_207;
            }
            if (chmod(v96, [*v11 currentLFMode]))
            {
              v142 = SZGetLoggingHandle();
              if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
              {
                v264 = __error();
                v265 = strerror(*v264);
                v552.st_dev = v456;
                *(void *)&v552.st_mode = v95;
                WORD2(v552.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v265;
                _os_log_error_impl(&dword_1DD5BF000, v142, OS_LOG_TYPE_ERROR, "Failed to set proper mode on directory %@: %s", (uint8_t *)&v552, 0x16u);
              }
            }
          }
          uid_t v548 = -1;
          gid_t v509 = -1;
          if ([*v11 resolveOwnershipWithExtraField:InfoZipExtraFieldFromLF outUID:&v548 outGID:&v509]&& lchown(v96, v548, v509))
          {
            dev_t v143 = *__error();
            v144 = SZGetLoggingHandle();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
            {
              uid_t v145 = v548;
              gid_t v146 = v509;
              v147 = strerror(v143);
              v552.st_dev = v451;
              *(void *)&v552.st_mode = v96;
              WORD2(v552.st_ino) = 1024;
              *(_DWORD *)((char *)&v552.st_ino + 6) = v145;
              uint64_t v11 = v469;
              HIWORD(v552.st_uvoid (**v4)(id, id) = 1024;
              v552.st_gid = v146;
              LOWORD(v552.st_rdev) = 1024;
              *(dev_t *)((char *)&v552.st_rdev + 2) = v143;
              *((_WORD *)&v552.st_rdev + 3) = 2080;
              v552.st_atimespec.tv_sec = (__darwin_time_t)v147;
              _os_log_impl(&dword_1DD5BF000, v144, OS_LOG_TYPE_DEFAULT, "Failed to lchown %s to (%d:%d) : %d (%s)", (uint8_t *)&v552, 0x28u);
            }
          }
          goto LABEL_204;
        }
        if ([v141 storeCurrentFileInMemory]) {
          goto LABEL_204;
        }
        uint64_t v148 = [*v11 fileWriter];
        v149 = v11;
        uint64_t v150 = v467;
        if (v148) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 929, "!_currentState.fileWriter");
        }
        if ([*v149 currentLFRequiresDataDescriptor]) {
          uint64_t v151 = -1;
        }
        else {
          uint64_t v151 = _GetUncompressedSize(*v149);
        }
        uint64_t v161 = [*(id *)(v150 + 64) performCachedWrites];
        uint64_t v162 = *(void *)(v150 + 96);
        id v163 = v468;
        id v508 = v468;
        v164 = +[StreamingFileWriter fileWriterForPath:v95 withOpenFlags:1537 mode:384 quarantineInfo:0 performCachedWrites:v161 expectedSize:v151 asyncTrackingGroup:v162 errorDelegate:v150 error:&v508];
        id v165 = v508;

        if (v164)
        {
          v552.st_dev = -1;
          uid_t v548 = -1;
          uint64_t v11 = v469;
          uint64_t v166 = [*v469 resolveOwnershipWithExtraField:InfoZipExtraFieldFromLF outUID:&v552 outGID:&v548];
          [v164 configureFileAndSetOwnership:v166 toUID:v552.st_dev GID:v548];
          [*v11 setFileWriter:v164];

          id v468 = v165;
LABEL_204:
          if (([*v11 currentLFRequiresDataDescriptor] & 1) != 0 || _GetCompressedSize(*v11))
          {
            [*v11 setStreamState:2];
            int v56 = 0;
          }
          else
          {
            [*v11 setStreamState:4];
            int v56 = 3;
          }
          goto LABEL_207;
        }
        v217 = SZGetLoggingHandle();
        BOOL v218 = os_log_type_enabled(v217, OS_LOG_TYPE_ERROR);
        uint64_t v11 = v469;
        if (v218)
        {
          v552.st_dev = v457;
          *(void *)&v552.st_mode = v95;
          _os_log_error_impl(&dword_1DD5BF000, v217, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", (uint8_t *)&v552, 0xCu);
        }

        uint64_t v540 = v462;
        id v541 = v95;
        v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v541 forKeys:&v540 count:1];
        _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 940, @"SZExtractorErrorDomain", 1, v165, v219, @"Failed to open output file at path %@", v220, (uint64_t)v95);
        id v468 = (id)objc_claimAutoreleasedReturnValue();

        int v56 = 2;
LABEL_207:

        if (v56)
        {
          uint64_t v13 = v464;
          id v9 = v468;
          goto LABEL_359;
        }
        unint64_t v12 = v510;
        a1 = v467;
        id v9 = v468;
        uint64_t v13 = v464;
LABEL_210:
        int v167 = [*v11 currentLFRequiresDataDescriptor];
        int v168 = *(unsigned __int16 *)([*v11 currentLFRecord] + 8);
        int v461 = v167;
        if (!v167 || (unint64_t v169 = v12, !v168))
        {
          uint64_t v170 = _GetCompressedSize(*v11);
          uint64_t v171 = [*v11 thisStageBytesComplete];
          if (v12 >= v170 - v171) {
            unint64_t v169 = v170 - v171;
          }
          else {
            unint64_t v169 = v12;
          }
        }
        if (![*v11 thisStageBytesComplete])
        {
          objc_msgSend(*v11, "setCurrentCRC32:", crc32(0, 0, 0));
          if (v169) {
            goto LABEL_219;
          }
LABEL_276:
          if (v461 && *(_WORD *)([*v11 currentLFRecord] + 8))
          {
            if (v169)
            {
              id v208 = *v11;
LABEL_282:
              int v56 = 3;
              [v208 setStreamState:3];
              goto LABEL_359;
            }
          }
          else
          {
            uint64_t v209 = [*v11 thisStageBytesComplete];
            if (v209 != _GetCompressedSize(*v11))
            {
              if (v12) {
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1295, "0 == length");
              }
              goto LABEL_474;
            }
            id v208 = *v11;
            if (v461) {
              goto LABEL_282;
            }
            [v208 setStreamState:4];
          }
          goto LABEL_55;
        }
        if (!v169) {
          goto LABEL_276;
        }
LABEL_219:
        int v447 = 0;
        int v448 = v168;
        v464 = v13;
        while (2)
        {
          if (v169 >= 0x7FFFFFFF) {
            __darwin_ino64_t v172 = 0x7FFFFFFFLL;
          }
          else {
            __darwin_ino64_t v172 = v169;
          }
          unint64_t v460 = v169 - v172;
          if (v168 > 13)
          {
            if (v168 != 14 && v168 != 99)
            {
LABEL_448:
              v290 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v11 currentLFRecord]);
              v528[0] = @"SZExtractorFileOffsetErrorKey";
              v359 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
              v528[1] = v462;
              v529[0] = v359;
              v529[1] = v290;
              v292 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v529 forKeys:v528 count:2];

              v360 = SZGetLoggingHandle();
              if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
              {
                int v414 = *(unsigned __int16 *)([*v11 currentLFRecord] + 8);
                v552.st_dev = 67109378;
                *(_DWORD *)&v552.st_mode = v414;
                LOWORD(v552.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v552.st_ino + 2) = (__darwin_ino64_t)v290;
                _os_log_error_impl(&dword_1DD5BF000, v360, OS_LOG_TYPE_ERROR, "Unknown compression method %hu for file %@", (uint8_t *)&v552, 0x12u);
              }

              uint64_t v361 = [*v11 currentLFRecord];
              uint64_t v299 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1283, @"SZExtractorErrorDomain", 2, 0, v292, @"Unknown compression method %hu for file %@", v362, *(unsigned __int16 *)(v361 + 8));
              goto LABEL_394;
            }
            goto LABEL_229;
          }
          if (v168)
          {
            if (v168 != 8) {
              goto LABEL_448;
            }
LABEL_229:
            id v468 = v9;
            if (!*(void *)(a1 + 56)) {
              *(void *)(a1 + 56) = malloc_type_malloc(0x10000uLL, 0x165A7F06uLL);
            }
            v173 = (compression_stream *)[*v11 cmpState];
            if (![*v11 thisStageBytesComplete])
            {
              uint64_t v174 = compression_stream_reinit();
              if (v174)
              {
                uint64_t v354 = v174;
                v355 = SZGetLoggingHandle();
                if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR))
                {
                  v552.st_dev = 67109120;
                  *(_DWORD *)&v552.st_mode = v354;
                  _os_log_error_impl(&dword_1DD5BF000, v355, OS_LOG_TYPE_ERROR, "Failed to initialize compression: %d", (uint8_t *)&v552, 8u);
                }

                v538 = @"SZExtractorCompressionLibErrorKey";
                v356 = [NSNumber numberWithInt:v354];
                v539 = v356;
                v357 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v539 forKeys:&v538 count:1];
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1044, @"SZExtractorErrorDomain", 1, 0, v357, @"Failed to initialize compression: %d", v358, v354);
                id v9 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_474;
              }
            }
            LODWORD(v466) = 0;
            src_ptr = v511;
            v173->src_ptr = v511;
            v173->size_t src_size = v172;
            while (1)
            {
              v173->dst_ptr = *(uint8_t **)(a1 + 56);
              v173->unint64_t dst_size = 0x10000;
              uint64_t v176 = compression_stream_process(v173, 0);
              size_t src_size = v173->src_size;
              __darwin_ino64_t v178 = v172 - src_size;
              v179 = SZGetLoggingHandle();
              if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG))
              {
                v552.st_dev = v459;
                *(void *)&v552.st_mode = v172 - src_size;
                _os_log_debug_impl(&dword_1DD5BF000, v179, OS_LOG_TYPE_DEBUG, "compression_stream_process consumed %zu bytes", (uint8_t *)&v552, 0xCu);
              }

              objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v178);
              objc_msgSend(*v11, "setThisStageBytesComplete:", objc_msgSend(*v11, "thisStageBytesComplete") + v178);
              unint64_t dst_size = v173->dst_size;
              if (dst_size > 0x10000) {
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1083, "outputSize >= cmpState->dst_size");
              }
              if (!v176 && v172 && v172 == src_size && dst_size == 0x10000)
              {
                v536[0] = @"SZExtractorFileOffsetErrorKey";
                v277 = v469;
                v278 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v469, "currentOffset"));
                v537[0] = v278;
                v536[1] = v462;
                v279 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v277 currentLFRecord]);
                v537[1] = v279;
                v280 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v537 forKeys:v536 count:2];

                v281 = SZGetLoggingHandle();
                if (os_log_type_enabled(v281, OS_LOG_TYPE_ERROR))
                {
                  GetFileNameStringFromLocalFileRecord((_WORD *)[*v277 currentLFRecord]);
                  id v327 = (id)objc_claimAutoreleasedReturnValue();
                  v552.st_dev = 138412802;
                  *(void *)&v552.st_mode = v327;
                  WORD2(v552.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = v172;
                  HIWORD(v552.st_gvoid (**v4)(id, id) = 2048;
                  *(void *)&v552.st_rdev = 0x10000;
                  _os_log_error_impl(&dword_1DD5BF000, v281, OS_LOG_TYPE_ERROR, "compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                    (uint8_t *)&v552,
                    0x20u);
                }
                v282 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v277 currentLFRecord]);
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1089, @"SZExtractorErrorDomain", 1, 0, v280, @"compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                  v283,
                  (uint64_t)v282);
                id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_384:
                uint64_t v15 = 0;
                a1 = v467;
LABEL_385:
                uint64_t v13 = v464;
                goto LABEL_511;
              }
              if (v176 >= 2)
              {
                v534[0] = @"SZExtractorCompressionLibErrorKey";
                v284 = [NSNumber numberWithInt:v176];
                v535[0] = v284;
                v534[1] = @"SZExtractorFileOffsetErrorKey";
                v285 = v469;
                v286 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v469, "currentOffset"));
                v535[1] = v286;
                v534[2] = v462;
                v287 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v285 currentLFRecord]);
                v535[2] = v287;
                v280 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v535 forKeys:v534 count:3];

                v288 = SZGetLoggingHandle();
                if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR))
                {
                  v552.st_dev = 67109120;
                  *(_DWORD *)&v552.st_mode = v176;
                  _os_log_error_impl(&dword_1DD5BF000, v288, OS_LOG_TYPE_ERROR, "compression_stream_process returned unexpected result %d", (uint8_t *)&v552, 8u);
                }

                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1097, @"SZExtractorErrorDomain", 2, 0, v280, @"compression_stream_process returned unexpected result %d", v289, v176);
                id v9 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_384;
              }
              if (v172 == src_size)
              {
                a1 = v467;
              }
              else
              {
                uint64_t v181 = objc_msgSend(*v469, "updateHashFromOffset:withBytes:length:", objc_msgSend(*v469, "currentOffset") - v178, src_ptr, v172 - src_size);

                a1 = v467;
                if (v181)
                {
                  uint64_t v15 = 0;
                  id v9 = (id)v181;
                  goto LABEL_385;
                }
                id v468 = 0;
                LODWORD(v466) = v466 + v178;
              }
              if (dst_size == 0x10000)
              {
                uint64_t v11 = v469;
              }
              else
              {
                unint64_t v182 = 0x10000 - dst_size;
                objc_msgSend(*(id *)(a1 + 64), "setUncompressedBytesOutput:", objc_msgSend(*(id *)(a1 + 64), "uncompressedBytesOutput") + 0x10000 - dst_size);
                objc_msgSend(*(id *)(a1 + 64), "setCurrentCRC32:", crc32(objc_msgSend(*(id *)(a1 + 64), "currentCRC32"), *(const Bytef **)(a1 + 56), 0x10000 - (int)dst_size));
                int v183 = [*(id *)(a1 + 64) storeCurrentFileInMemory];
                v184 = *(void **)(a1 + 64);
                if (v183)
                {
                  v185 = [v184 inMemoryFileData];
                  [v185 appendBytes:*(void *)(a1 + 56) length:0x10000 - dst_size];

                  uint64_t v11 = v469;
                }
                else
                {
                  v186 = [v184 fileWriter];
                  v187 = v469;
                  if (!v186) {
                    __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1118, "_currentState.fileWriter");
                  }

                  v188 = [*(id *)(a1 + 64) fileWriter];
                  uint64_t v189 = *(void *)(a1 + 56);
                  id v190 = v468;
                  id v506 = v468;
                  int v191 = [v188 writeBuffer:v189 length:v182 error:&v506];
                  id v192 = v506;

                  if (!v191) {
                    goto LABEL_489;
                  }
                  id v468 = v192;
                  uint64_t v11 = v187;
                }
                objc_msgSend(*v11, "setTotalFileSizeWritten:", objc_msgSend(*v11, "totalFileSizeWritten") + v182);
                if ([*v11 totalUncompressedBytes]) {
                  -[StreamingUnzipper _sendExtractionProgress:](a1, (double)(unint64_t)[*(id *)(a1 + 64) totalFileSizeWritten]/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalUncompressedBytes"));
                }
              }
              if (v176) {
                break;
              }
              __darwin_ino64_t v172 = v173->src_size;
              if (!v172 && v173->dst_size) {
                goto LABEL_263;
              }
              src_ptr = v173->src_ptr;
            }
            if ((v461 & 1) == 0)
            {
              uint64_t v203 = _GetCompressedSize(*v11);
              uint64_t v204 = [*v11 thisStageBytesComplete];
              id v9 = v468;
              if (v203 == v204)
              {
                uint64_t v205 = _GetUncompressedSize(*v11);
                if (v205 == [*v11 uncompressedBytesOutput])
                {
                  LODWORD(v172) = v466;
                  uint64_t v13 = v464;
                  goto LABEL_274;
                }
                v393 = SZGetLoggingHandle();
                if (os_log_type_enabled(v393, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v434 = [*v11 uncompressedBytesOutput];
                  GetFileNameStringFromLocalFileRecord((_WORD *)[*v11 currentLFRecord]);
                  id v435 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v436 = _GetUncompressedSize(*v11);
                  v552.st_dev = 134218498;
                  *(void *)&v552.st_mode = v434;
                  WORD2(v552.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v435;
                  HIWORD(v552.st_gvoid (**v4)(id, id) = 2048;
                  *(void *)&v552.st_rdev = v436;
                  _os_log_error_impl(&dword_1DD5BF000, v393, OS_LOG_TYPE_ERROR, "Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes", (uint8_t *)&v552, 0x20u);
                }
                v530 = @"SZExtractorFileOffsetErrorKey";
                v394 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
                v531 = v394;
                v395 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v531 forKeys:&v530 count:1];
                uint64_t v396 = [*v11 uncompressedBytesOutput];
                v442 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v11 currentLFRecord]);
                _GetUncompressedSize(*v11);
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1143, @"SZExtractorErrorDomain", 2, 0, v395, @"Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes", v397, v396);
                id v192 = (id)objc_claimAutoreleasedReturnValue();

LABEL_489:
                uint64_t v15 = 0;
                id v9 = v192;
              }
              else
              {
                v386 = SZGetLoggingHandle();
                if (os_log_type_enabled(v386, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v431 = _GetCompressedSize(*v11);
                  uint64_t v432 = v431 - [*v11 thisStageBytesComplete];
                  GetFileNameStringFromLocalFileRecord((_WORD *)[*v469 currentLFRecord]);
                  id v433 = (id)objc_claimAutoreleasedReturnValue();
                  v552.st_dev = 134218242;
                  *(void *)&v552.st_mode = v432;
                  uint64_t v11 = v469;
                  WORD2(v552.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v433;
                  _os_log_error_impl(&dword_1DD5BF000, v386, OS_LOG_TYPE_ERROR, "Hit compression stream end with %llu compressed bytes remaining for file %@", (uint8_t *)&v552, 0x16u);
                }
                v532 = @"SZExtractorFileOffsetErrorKey";
                v387 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
                v533 = v387;
                v388 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v533 forKeys:&v532 count:1];
                uint64_t v389 = _GetCompressedSize(*v11);
                uint64_t v390 = v389 - [*v11 thisStageBytesComplete];
                v445 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v469 currentLFRecord]);
                uint64_t v392 = _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1140, @"SZExtractorErrorDomain", 2, 0, v388, @"Hit compression stream end with %llu compressed bytes remaining for file %@", v391, v390);

                uint64_t v15 = 0;
                id v9 = (id)v392;
              }
              goto LABEL_385;
            }
            unint64_t v460 = 0;
            int v447 = 1;
LABEL_263:
            LODWORD(v172) = v466;
            uint64_t v13 = v464;
            id v9 = v468;
LABEL_274:
            v206 = [*v11 unsureData];
            v207 = v511;
            [v206 appendBytes:v511 length:v172];

            unint64_t v12 = v510 - v172;
            size_t v510 = v12;
            v511 = &v207[v172];
            int v168 = v448;
            unint64_t v169 = v460;
            if (!v460)
            {
              LOBYTE(v169) = v447;
              goto LABEL_276;
            }
            continue;
          }
          break;
        }
        uLong v193 = [*v11 currentCRC32];
        v194 = v511;
        objc_msgSend(*v11, "setCurrentCRC32:", crc32(v193, v511, v172));
        int v195 = [*v11 storeCurrentFileInMemory];
        id v196 = *v11;
        if (v195)
        {
          v197 = [v196 inMemoryFileData];
          [v197 appendBytes:v194 length:v172];

LABEL_267:
          objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v172);
          objc_msgSend(*v11, "setThisStageBytesComplete:", objc_msgSend(*v11, "thisStageBytesComplete") + v172);
          objc_msgSend(*v11, "setUncompressedBytesOutput:", objc_msgSend(*v11, "uncompressedBytesOutput") + v172);
          objc_msgSend(*v11, "setTotalFileSizeWritten:", objc_msgSend(*v11, "totalFileSizeWritten") + v172);
          if ([*v11 totalUncompressedBytes]) {
            -[StreamingUnzipper _sendExtractionProgress:](a1, (double)(unint64_t)[*(id *)(a1 + 64) totalFileSizeWritten]/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalUncompressedBytes"));
          }
          id v201 = *v11;
          uint64_t v202 = [*v11 currentOffset];
          id v16 = [v201 updateHashFromOffset:v202 - v172 withBytes:v511 length:v172];

          if (!v16)
          {
            [*v11 markResumptionPoint];
            id v9 = 0;
            goto LABEL_274;
          }
        }
        else
        {
          v198 = [v196 fileWriter];
          if (!v198) {
            __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 993, "_currentState.fileWriter");
          }

          v199 = [*v11 fileWriter];
          id v507 = v9;
          int v200 = [v199 writeBuffer:v194 length:v172 error:&v507];
          id v16 = v507;

          if (v200)
          {
            id v9 = v16;
            goto LABEL_267;
          }
        }
LABEL_463:
        uint64_t v15 = 0;
        id v9 = v16;
LABEL_511:
        id v7 = v463;
LABEL_512:
        if (v9)
        {
          if ([*v469 performingExtraction])
          {
            v413 = SZGetTraceHandle();
            if (os_signpost_enabled(v413))
            {
              LOWORD(v552.st_dev) = 0;
              _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v413, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction failed", (uint8_t *)&v552, 2u);
            }

            [*v469 setPerformingExtraction:0];
          }
          -[StreamingUnzipper _setErrorState](a1);
        }
        v7[2](v7, v9, v15);

LABEL_519:
        return;
      case 2:
        goto LABEL_210;
      case 3:
        if (![*v11 dataDescriptor]) {
          objc_msgSend(*v11, "setDataDescriptor:", malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL));
        }
        BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField([*v11 currentLFRecord]);
        if (HasZip64ExtraField) {
          uint64_t v46 = 24;
        }
        else {
          uint64_t v46 = 16;
        }
        uint64_t v28 = _CopyStreamBytesToRecord([*v11 dataDescriptor], v46, *v11, (const void **)&v511, &v510);

        if (v28) {
          goto LABEL_395;
        }
        unint64_t v12 = v510;
        id v47 = *v11;
        if (!v510) {
          goto LABEL_408;
        }
        if ([v47 thisStageBytesComplete] != v46) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1334, "_currentState.thisStageBytesComplete == expected_size");
        }
        if (*(_DWORD *)[*v11 dataDescriptor] != 134695760)
        {
          v308 = [*v11 unsureData];

          v309 = SZGetLoggingHandle();
          v310 = v309;
          if (v308)
          {
            if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
            {
              int v311 = *(unsigned __int8 *)[*v11 dataDescriptor];
              int v312 = *(unsigned __int8 *)([*v469 dataDescriptor] + 1);
              uid_t v313 = *(unsigned __int8 *)([*v469 dataDescriptor] + 2);
              gid_t v314 = *(unsigned __int8 *)([*v469 dataDescriptor] + 3);
              v552.st_dev = 67109888;
              *(_DWORD *)&v552.st_mode = v311;
              LOWORD(v552.st_ino) = 1024;
              *(_DWORD *)((char *)&v552.st_ino + 2) = v312;
              HIWORD(v552.st_ino) = 1024;
              v552.st_uid = v313;
              LOWORD(v552.st_gvoid (**v4)(id, id) = 1024;
              *(gid_t *)((char *)&v552.st_gid + 2) = v314;
              _os_log_impl(&dword_1DD5BF000, v310, OS_LOG_TYPE_DEFAULT, "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx); entering passthrough mode",
                (uint8_t *)&v552,
                0x1Au);
            }

            v315 = v511;
            uint64_t v316 = a1;
            uint64_t v317 = v12;
            goto LABEL_431;
          }
          if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
          {
            int v415 = *(unsigned __int8 *)[*v11 dataDescriptor];
            int v416 = *(unsigned __int8 *)([*v469 dataDescriptor] + 1);
            uid_t v417 = *(unsigned __int8 *)([*v469 dataDescriptor] + 2);
            gid_t v418 = *(unsigned __int8 *)([*v469 dataDescriptor] + 3);
            v552.st_dev = 67109888;
            *(_DWORD *)&v552.st_mode = v415;
            uint64_t v11 = v469;
            LOWORD(v552.st_ino) = 1024;
            *(_DWORD *)((char *)&v552.st_ino + 2) = v416;
            HIWORD(v552.st_ino) = 1024;
            v552.st_uid = v417;
            LOWORD(v552.st_gvoid (**v4)(id, id) = 1024;
            *(gid_t *)((char *)&v552.st_gid + 2) = v418;
            _os_log_error_impl(&dword_1DD5BF000, v310, OS_LOG_TYPE_ERROR, "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).", (uint8_t *)&v552, 0x1Au);
          }

          v526 = @"SZExtractorFileOffsetErrorKey";
          v363 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v527 = v363;
          v364 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v527 forKeys:&v526 count:1];
          uint64_t v365 = *(unsigned __int8 *)[*v11 dataDescriptor];
          [*v469 dataDescriptor];
          [*v469 dataDescriptor];
          [*v469 dataDescriptor];
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1343, @"SZExtractorErrorDomain", 2, 0, v364, @"Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).", v366, v365);
          id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_454:
          uint64_t v15 = 0;
LABEL_455:
          a1 = v467;
          goto LABEL_511;
        }
        v48 = SZGetLoggingHandle();
        BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG);
        if (HasZip64ExtraField)
        {
          if (!v49) {
            goto LABEL_57;
          }
          int v50 = *(_DWORD *)([*v11 dataDescriptor] + 4);
          __darwin_ino64_t v51 = *(void *)([*v469 dataDescriptor] + 16);
          uint64_t v52 = *(void *)([*v469 dataDescriptor] + 8);
          v552.st_dev = v453;
          *(_DWORD *)&v552.st_mode = v50;
          uint64_t v11 = v469;
          LOWORD(v552.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v552.st_ino + 2) = v51;
          HIWORD(v552.st_uvoid (**v4)(id, id) = 2048;
          *(void *)&v552.st_gid = v52;
          uint64_t v53 = v48;
          int v54 = "Got data descriptor with CRC 0x%x, uncompressed size %llu, compressed size %llu";
          uint32_t v55 = 28;
        }
        else
        {
          if (!v49) {
            goto LABEL_57;
          }
          int v243 = *(_DWORD *)([*v11 dataDescriptor] + 4);
          int v244 = *(_DWORD *)([*v469 dataDescriptor] + 12);
          uid_t v245 = *(_DWORD *)([*v469 dataDescriptor] + 8);
          v552.st_dev = v453;
          *(_DWORD *)&v552.st_mode = v243;
          uint64_t v11 = v469;
          LOWORD(v552.st_ino) = 1024;
          *(_DWORD *)((char *)&v552.st_ino + 2) = v244;
          HIWORD(v552.st_ino) = 1024;
          v552.st_uid = v245;
          uint64_t v53 = v48;
          int v54 = "Got data descriptor with CRC 0x%x, uncompressed size %u, compressed size %u";
          uint32_t v55 = 20;
        }
        _os_log_debug_impl(&dword_1DD5BF000, v53, OS_LOG_TYPE_DEBUG, v54, (uint8_t *)&v552, v55);
LABEL_57:

        [*v11 setStreamState:4];
        id v9 = 0;
LABEL_58:
        uint64_t v57 = [*v11 uncompressedBytesOutput];
        uint64_t v58 = _GetUncompressedSize(*v11);
        id v59 = *v11;
        if (v57 != v58)
        {
          v290 = GetFileNameStringFromLocalFileRecord((_WORD *)[v59 currentLFRecord]);
          v524[0] = @"SZExtractorFileOffsetErrorKey";
          v291 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v524[1] = v462;
          v525[0] = v291;
          v525[1] = v290;
          v292 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v525 forKeys:v524 count:2];

          v293 = SZGetLoggingHandle();
          if (os_log_type_enabled(v293, OS_LOG_TYPE_ERROR))
          {
            __darwin_ino64_t v400 = [*v11 uncompressedBytesOutput];
            uint64_t v401 = _GetUncompressedSize(*v11);
            v552.st_dev = 138412802;
            *(void *)&v552.st_mode = v290;
            WORD2(v552.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = v400;
            HIWORD(v552.st_gvoid (**v4)(id, id) = 2048;
            *(void *)&v552.st_rdev = v401;
            _os_log_error_impl(&dword_1DD5BF000, v293, OS_LOG_TYPE_ERROR, "Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
              (uint8_t *)&v552,
              0x20u);
          }

          [*v11 uncompressedBytesOutput];
          _GetUncompressedSize(*v11);
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1364, @"SZExtractorErrorDomain", 2, 0, v292, @"Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
            v294,
            (uint64_t)v290);
          uint64_t v299 = LABEL_393:;
LABEL_394:
          uint64_t v28 = v299;

          goto LABEL_395;
        }
        uint64_t v60 = [v59 currentCRC32];
        int CRC32 = _GetCRC32(*v11);
        uint64_t v62 = (_WORD *)[*v11 currentLFRecord];
        if (v60 != CRC32)
        {
          v290 = GetFileNameStringFromLocalFileRecord(v62);
          v522[0] = @"SZExtractorFileOffsetErrorKey";
          v295 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v522[1] = v462;
          v523[0] = v295;
          v523[1] = v290;
          v292 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v523 forKeys:v522 count:2];

          v296 = SZGetLoggingHandle();
          if (os_log_type_enabled(v296, OS_LOG_TYPE_ERROR))
          {
            uint64_t v402 = [*v11 currentCRC32];
            int v403 = _GetCRC32(*v11);
            v552.st_dev = 134218498;
            *(void *)&v552.st_mode = v402;
            WORD2(v552.st_ino) = 1024;
            *(_DWORD *)((char *)&v552.st_ino + 6) = v403;
            HIWORD(v552.st_uvoid (**v4)(id, id) = 2112;
            *(void *)&v552.st_gid = v290;
            _os_log_error_impl(&dword_1DD5BF000, v296, OS_LOG_TYPE_ERROR, "CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
              (uint8_t *)&v552,
              0x1Cu);
          }

          uint64_t v297 = [*v11 currentCRC32];
          _GetCRC32(*v11);
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1372, @"SZExtractorErrorDomain", 2, 0, v292, @"CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
            v298,
            v297);
          goto LABEL_393;
        }
        id v468 = v9;
        uint64_t v63 = GetInfoZipExtraFieldFromLF((uint64_t)v62);
        GetFileNameStringFromLocalFileRecord((_WORD *)[*v11 currentLFRecord]);
        id v64 = objc_claimAutoreleasedReturnValue();
        id v65 = (const char *)[v64 fileSystemRepresentation];
        id v66 = *v11;
        if (!v64 || !v65)
        {
          __int16 v71 = [v66 unsureData];

          if (!v71)
          {
            uint64_t v80 = [*v11 currentLFRecord];
            size_t v81 = *(unsigned __int16 *)(v80 + 26);
            v82 = malloc_type_calloc(v81 + 1, 1uLL, 0xCB3B20E1uLL);
            memcpy(v82, (const void *)(v80 + 30), v81);
            v83 = SZGetLoggingHandle();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              v552.st_dev = v452;
              *(void *)&v552.st_mode = v82;
              _os_log_error_impl(&dword_1DD5BF000, v83, OS_LOG_TYPE_ERROR, "Couldn't get filename for current file \"%s\"", (uint8_t *)&v552, 0xCu);
            }

            v520 = @"SZExtractorFileOffsetErrorKey";
            v84 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v521 = v84;
            v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v521 forKeys:&v520 count:1];
            int v56 = 2;
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1387, @"SZExtractorErrorDomain", 2, 0, v85, @"Couldn't get filename for current file \"%s\"", v86, (uint64_t)v82);
            id v73 = (id)objc_claimAutoreleasedReturnValue();

            free(v82);
            goto LABEL_358;
          }
          v72 = SZGetLoggingHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v552.st_dev) = 0;
            _os_log_impl(&dword_1DD5BF000, v72, OS_LOG_TYPE_DEFAULT, "Couldn't get filename for stream metadata file; entering passthrough mode",
              (uint8_t *)&v552,
              2u);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v12);
          id v73 = (id)objc_claimAutoreleasedReturnValue();

LABEL_74:
          int v56 = 2;
          goto LABEL_358;
        }
        unint64_t v67 = [v66 recordsProcessed];
        v464 = v13;
        if (v67 > 2 || strcmp(v65, "META-INF/com.apple.ZipMetadata.plist"))
        {
          if ((unint64_t)[*v11 recordsProcessed] > 3
            || strcmp(v65, "META-INF/com.apple.FixedZipMetadata.bin"))
          {
            if (([*v11 currentLFMode] & 0xF000) == 0xA000)
            {
              id v68 = [v465 stringByAppendingPathComponent:v64];
              if ([*v11 storeCurrentFileInMemory])
              {
                v69 = [*v11 inMemoryFileData];
                if (!v69) {
                  __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1496, "_currentState.inMemoryFileData");
                }

                uint64_t v70 = [*v11 inMemoryFileData];
                goto LABEL_126;
              }
              id v474 = 0;
              uint64_t v70 = [MEMORY[0x1E4F1CA58] dataWithContentsOfFile:v68 options:3 error:&v474];
              id v106 = v474;
              if (v70)
              {
                v107 = [MEMORY[0x1E4F28CB8] defaultManager];
                [v107 removeItemAtPath:v68 error:0];

LABEL_126:
                char v473 = 0;
                [v70 appendBytes:&v473 length:1];
                v108 = v70;
                v109 = (const char *)[v108 bytes];
                v87 = v68;
                v110 = (const char *)[v87 fileSystemRepresentation];
                if ([*v11 denyInvalidSymlinks])
                {
                  if (*v109 == 47)
                  {
                    v111 = SZGetLoggingHandle();
                    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                    {
                      v552.st_dev = v454;
                      *(void *)&v552.st_mode = v110;
                      WORD2(v552.st_ino) = 2080;
                      *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v109;
                      _os_log_error_impl(&dword_1DD5BF000, v111, OS_LOG_TYPE_ERROR, "Invalid symlink: %s -> %s (absolute symlinks are forbidden)", (uint8_t *)&v552, 0x16u);
                    }

                    uint64_t v516 = v462;
                    v517 = v87;
                    v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v517 forKeys:&v516 count:1];
                    _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1520, @"SZExtractorErrorDomain", 5, 0, v112, @"Invalid symlink: %s -> %s (absolute symlinks are forbidden)", v113, (uint64_t)v110);
LABEL_324:
                    id v73 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_325;
                  }
                  uid_t v548 = 0;
                  gid_t v509 = 0;
                  if (!_GetAndValidatePathDepth((const char *)[v64 fileSystemRepresentation], 0, (int *)&v509)|| !_GetAndValidatePathDepth(v109, v509, (int *)&v548))
                  {
                    v240 = SZGetLoggingHandle();
                    if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
                    {
                      v552.st_dev = v454;
                      *(void *)&v552.st_mode = v110;
                      WORD2(v552.st_ino) = 2080;
                      *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v109;
                      _os_log_error_impl(&dword_1DD5BF000, v240, OS_LOG_TYPE_ERROR, "Invalid symlink: %s -> %s", (uint8_t *)&v552, 0x16u);
                    }

                    uint64_t v514 = v462;
                    v515 = v87;
                    v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v515 forKeys:&v514 count:1];
                    _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1533, @"SZExtractorErrorDomain", 5, 0, v112, @"Invalid symlink: %s -> %s", v241, (uint64_t)v110);
                    goto LABEL_324;
                  }
                }
                if (symlink(v109, v110))
                {
                  v221 = v108;
                  uint64_t v222 = *__error();
                  v223 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
                  {
                    v263 = strerror(v222);
                    v552.st_dev = v449;
                    *(void *)&v552.st_mode = v110;
                    WORD2(v552.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v109;
                    HIWORD(v552.st_gvoid (**v4)(id, id) = 2080;
                    *(void *)&v552.st_rdev = v263;
                    _os_log_error_impl(&dword_1DD5BF000, v223, OS_LOG_TYPE_ERROR, "Failed to create symlink at %s to %s: %s", (uint8_t *)&v552, 0x20u);
                  }

                  uint64_t v512 = v462;
                  v513 = v87;
                  v224 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v513 forKeys:&v512 count:1];
                  strerror(v222);
                  _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1541, v458, v222, 0, v224, @"Failed to create symlink at %s to %s: %s", v225, (uint64_t)v110);
                  id v73 = (id)objc_claimAutoreleasedReturnValue();

                  v108 = v221;
                  goto LABEL_325;
                }
                lchmod(v110, [*v11 currentLFMode]);
                if ([*v11 denyInvalidSymlinks])
                {
                  v466 = v108;
                  uint64_t v237 = a1;
                  id v238 = v468;
                  id v472 = v468;
                  int v239 = _CheckRealpathHasBasePrefix(v87, v465, &v472);
                  id v73 = v472;

                  a1 = v237;
                  v108 = (char *)v466;
                  id v468 = v73;
                  if (!v239)
                  {
LABEL_325:

LABEL_326:
LABEL_337:
                    int v56 = 2;
                    uint64_t v13 = v464;
LABEL_358:

                    id v9 = v73;
                    goto LABEL_359;
                  }
                }
                if (v63)
                {
                  *(void *)&v552.st_dev = *((unsigned int *)v63 + 1);
                  LODWORD(v552.st_ino) = 0;
                  *(void *)&v552.st_uid = *((unsigned int *)v63 + 2);
                }
                else
                {
                  *(void *)&v552.st_dev = DOS2UNIXTime(*(_DWORD *)([*v11 currentLFRecord] + 10));
                  LODWORD(v552.st_ino) = 0;
                  *(void *)&v552.st_uid = *(void *)&v552.st_dev;
                }
                v552.st_rdev = 0;
                lutimes(v110, (const timeval *)&v552);

                goto LABEL_343;
              }
              v226 = SZGetLoggingHandle();
              if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
              {
                v552.st_dev = v457;
                *(void *)&v552.st_mode = v68;
                _os_log_error_impl(&dword_1DD5BF000, v226, OS_LOG_TYPE_ERROR, "Failed to read symlink path from %@", (uint8_t *)&v552, 0xCu);
              }

              uint64_t v518 = v462;
              v519 = v68;
              v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v519 forKeys:&v518 count:1];
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1502, @"SZExtractorErrorDomain", 5, v106, v227, @"Failed to read symlink path from %@", v228, (uint64_t)v68);
              id v73 = (id)objc_claimAutoreleasedReturnValue();

LABEL_336:
              goto LABEL_337;
            }
            if ([*v11 storeCurrentFileInMemory])
            {
              v87 = SZGetLoggingHandle();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
              {
                v552.st_dev = v457;
                *(void *)&v552.st_mode = v64;
                _os_log_debug_impl(&dword_1DD5BF000, v87, OS_LOG_TYPE_DEBUG, "Not doing anything with data for file %@", (uint8_t *)&v552, 0xCu);
              }
            }
            else
            {
              if (v63)
              {
                time_t v114 = *((unsigned int *)v63 + 1);
                time_t v115 = *((unsigned int *)v63 + 2);
              }
              else
              {
                time_t v114 = DOS2UNIXTime(*(_DWORD *)([*v11 currentLFRecord] + 10));
                time_t v115 = v114;
              }
              uint64_t v229 = [*v11 currentLFRecord];
              if (*(unsigned char *)(*(unsigned __int16 *)(v229 + 26) + v229 + 29) != 47)
              {
                uint64_t v231 = a1;
                v232 = [*v11 fileWriter];
                if (!v232) {
                  __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1582, "_currentState.fileWriter");
                }

                v233 = [*v11 fileWriter];
                uint64_t v234 = [*v11 currentLFMode];
                id v235 = v468;
                id v471 = v468;
                char v236 = objc_msgSend(v233, "finalizeFileWithAccessTime:modTime:mode:error:", v114, 0, v115, 0, v234, &v471);
                id v73 = v471;

                if ((v236 & 1) == 0) {
                  goto LABEL_74;
                }
                a1 = v231;
                goto LABEL_344;
              }
              v230 = [v465 stringByAppendingPathComponent:v64];
              *(void *)&v552.st_dev = v114;
              v552.st_ino = 0;
              *(void *)&v552.st_uid = v115;
              *(void *)&v552.st_rdev = 0;
              v87 = v230;
              lutimes((const char *)[v87 fileSystemRepresentation], (const timeval *)&v552);
            }
LABEL_343:

            id v73 = v468;
            uint64_t v13 = v464;
LABEL_344:
            v251 = SZGetTraceHandle();
            if (os_signpost_enabled(v251))
            {
              v552.st_dev = v457;
              *(void *)&v552.st_mode = v64;
              _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v251, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction completed successfully for file %@", (uint8_t *)&v552, 0xCu);
            }

            [*(id *)(a1 + 64) setPerformingExtraction:0];
            id v252 = v64;
            if ((*(unsigned char *)(a1 + 80) & 2) != 0)
            {
              v253 = [(id)a1 xpcConnection];
              v254 = v253;
              if (v253)
              {
                id v255 = [v253 remoteObjectProxy];
                [v255 extractionCompleteAtArchivePath:v252];
              }
              else
              {
                [(id)a1 inProcessExtractorDelegate];
                v256 = (void *)a1;
                id v255 = (id)objc_claimAutoreleasedReturnValue();
                if (v255)
                {
                  v257 = [v256 inProcessDelegateQueue];

                  if (v257)
                  {
                    v258 = [v256 inProcessDelegateQueue];
                    *(void *)&v552.st_dev = MEMORY[0x1E4F143A8];
                    v552.st_ino = 3221225472;
                    *(void *)&v552.st_uid = __58__StreamingUnzipper__sendExtractionCompleteAtArchivePath___block_invoke;
                    *(void *)&v552.st_rdev = &unk_1E6CD1E60;
                    id v255 = v255;
                    v552.st_atimespec.tv_sec = (__darwin_time_t)v255;
                    v552.st_atimespec.tv_nsec = (uint64_t)v252;
                    dispatch_async(v258, &v552);
                  }
                }
                uint64_t v11 = v469;
              }

              a1 = v467;
            }

            [*v11 setStreamState:0];
            if (![*v11 totalUncompressedBytes] && objc_msgSend(*v11, "totalRecordCount")) {
              -[StreamingUnzipper _sendExtractionProgress:](a1, (double)(unint64_t)[*(id *)(a1 + 64) recordsProcessed]/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalRecordCount"));
            }
            int v56 = 3;
            goto LABEL_358;
          }
          if ([*v11 storeCurrentFileInMemory])
          {
            v116 = [*v11 inMemoryFileData];
            if (!v116) {
              __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1452, "_currentState.inMemoryFileData");
            }

            v87 = [*v11 inMemoryFileData];
          }
          else
          {
            v211 = [v465 stringByAppendingPathComponent:v64];
            id v503 = 0;
            v87 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v211 options:3 error:&v503];
            id v212 = v503;
            if (!v87)
            {
              v213 = SZGetLoggingHandle();
              if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
              {
                v552.st_dev = v456;
                *(void *)&v552.st_mode = v211;
                WORD2(v552.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v552.st_ino + 6) = (__darwin_ino64_t)v212;
                _os_log_error_impl(&dword_1DD5BF000, v213, OS_LOG_TYPE_ERROR, "Failed to read fixed stream metadata from %@: %@", (uint8_t *)&v552, 0x16u);
              }
            }
          }
          if (!v87) {
            goto LABEL_343;
          }
          v214 = v87;
          uint64_t v215 = [v214 bytes];
          unint64_t v216 = [v214 length];
          if (v216 < 7 || *(_DWORD *)v215 != 2017879117)
          {
            v122 = SZGetLoggingHandle();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              v552.st_dev = v459;
              *(void *)&v552.st_mode = v216;
              _os_log_error_impl(&dword_1DD5BF000, v122, OS_LOG_TYPE_ERROR, "Got a fixed metadata file that did not match expected content (length %lu). Ignoring.", (uint8_t *)&v552, 0xCu);
            }
LABEL_298:

            goto LABEL_343;
          }
          id v248 = *v11;
          if (*v11)
          {
            [v248 hashContext];
            id v248 = *v11;
            unsigned __int8 v249 = v489 + 1;
            if (v248)
            {
              id v248 = (id)[v248 hashContext];
              uint64_t v250 = v475;
              goto LABEL_364;
            }
            long long v261 = 0uLL;
          }
          else
          {
            uint64_t v502 = 0;
            long long v261 = 0uLL;
            long long v500 = 0u;
            long long v501 = 0u;
            long long v498 = 0u;
            long long v499 = 0u;
            long long v496 = 0u;
            long long v497 = 0u;
            long long v494 = 0u;
            long long v495 = 0u;
            long long v492 = 0u;
            long long v493 = 0u;
            long long v490 = 0u;
            long long v491 = 0u;
            unsigned __int8 v249 = 1;
            long long v489 = 0u;
          }
          uint64_t v250 = 0;
          uint64_t v488 = 0;
          long long v486 = v261;
          long long v487 = v261;
          long long v484 = v261;
          long long v485 = v261;
          long long v482 = v261;
          long long v483 = v261;
          long long v481 = v261;
          long long v479 = v261;
          long long v480 = v261;
          long long v477 = v261;
          long long v478 = v261;
          long long v475 = v261;
          long long v476 = v261;
LABEL_364:
          uint64_t v266 = gHashDigestSizes[v250];
          LOWORD(v548) = v266;
          BOOL v267 = *(unsigned __int8 *)(v215 + 4) == v249;
          uint64_t v11 = v469;
          if (!v267) {
            goto LABEL_343;
          }
          if (*(unsigned __int16 *)(v215 + 5) != (unsigned __int16)v548) {
            goto LABEL_343;
          }
          size_t v268 = (unsigned __int16)v266;
          if (v216 < (unint64_t)(unsigned __int16)v266 + 7) {
            goto LABEL_343;
          }
          MEMORY[0x1F4188790](v248);
          v270 = (char *)&v446 - v269;
          bzero((char *)&v446 - v269, v268);
          v271 = (unsigned __int8 *)(v215 + 7);
          if (!memcmp(v270, v271, v268))
          {
            v122 = SZGetLoggingHandle();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v552.st_dev) = 0;
              _os_log_debug_impl(&dword_1DD5BF000, v122, OS_LOG_TYPE_DEBUG, "Found last chunk partial hash data but the hash was not computed.", (uint8_t *)&v552, 2u);
            }
          }
          else
          {
            v272 = StringFromDigest(v271, v268);
            [*v11 setLastChunkPartialHash:v272];

            v122 = SZGetLoggingHandle();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
            {
              v273 = [*v11 lastChunkPartialHash];
              v552.st_dev = v457;
              *(void *)&v552.st_mode = v273;
              _os_log_debug_impl(&dword_1DD5BF000, v122, OS_LOG_TYPE_DEBUG, "Got last chunk partial hash %@", (uint8_t *)&v552, 0xCu);
            }
          }
          goto LABEL_298;
        }
        if ([*v11 storeCurrentFileInMemory])
        {
          v88 = [*v11 inMemoryFileData];
          if (!v88) {
            __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1396, "_currentState.inMemoryFileData");
          }

          id v68 = [*v11 inMemoryFileData];
          id v505 = 0;
          v89 = [MEMORY[0x1E4F28F98] propertyListWithData:v68 options:0 format:0 error:&v505];
          id v90 = v505;
          [*v11 setStreamInfoDict:v89];

          v91 = [*v11 streamInfoDict];

          if (!v91)
          {
            v92 = SZGetLoggingHandle();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v552.st_dev) = 0;
              _os_log_impl(&dword_1DD5BF000, v92, OS_LOG_TYPE_DEFAULT, "Failed to decode stream metadata; entering passthrough mode",
                (uint8_t *)&v552,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v12);
            id v73 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_74;
          }
LABEL_141:

          v119 = SZGetLoggingHandle();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
          {
            v262 = [*v11 streamInfoDict];
            v552.st_dev = v457;
            *(void *)&v552.st_mode = v262;
            _os_log_debug_impl(&dword_1DD5BF000, v119, OS_LOG_TYPE_DEBUG, "Got stream metadata: %@", (uint8_t *)&v552, 0xCu);
          }
          v120 = [*v11 streamInfoDict];
          v87 = [v120 objectForKey:@"Version"];

          if (!v87
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || [v87 intValue] != 2)
          {
            v210 = SZGetLoggingHandle();
            if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v552.st_dev) = 0;
              _os_log_impl(&dword_1DD5BF000, v210, OS_LOG_TYPE_DEFAULT, "Stream metadata was incompatible version or not present; entering passthrough mode",
                (uint8_t *)&v552,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v12);
            id v73 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_326;
          }
          [*v11 setUnsureData:0];
          v121 = [*v11 streamInfoDict];
          v122 = [v121 objectForKey:@"RecordCount"];

          if (v122)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(*v11, "setTotalRecordCount:", -[NSObject unsignedLongLongValue](v122, "unsignedLongLongValue"));
            }
          }
          v123 = [*v11 streamInfoDict];
          v124 = [v123 objectForKey:@"TotalUncompressedBytes"];

          if (v124)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(*v11, "setTotalUncompressedBytes:", objc_msgSend(v124, "unsignedLongLongValue"));
            }
          }

          goto LABEL_298;
        }
        id v68 = [v465 stringByAppendingPathComponent:v64];
        id v106 = [MEMORY[0x1E4F1CA10] inputStreamWithFileAtPath:v68];
        if (v106)
        {
          id v504 = 0;
          v117 = [MEMORY[0x1E4F28F98] propertyListWithStream:v106 options:0 format:0 error:&v504];
          id v90 = v504;
          [*v11 setStreamInfoDict:v117];

          v118 = [*v11 streamInfoDict];

          if (v118)
          {

            goto LABEL_141;
          }
          v247 = SZGetLoggingHandle();
          if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v552.st_dev) = 0;
            _os_log_impl(&dword_1DD5BF000, v247, OS_LOG_TYPE_DEFAULT, "Failed to decode stream metadata; entering passthrough mode",
              (uint8_t *)&v552,
              2u);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v12);
          id v73 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v242 = SZGetLoggingHandle();
          if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
          {
            v552.st_dev = v457;
            *(void *)&v552.st_mode = v68;
            _os_log_impl(&dword_1DD5BF000, v242, OS_LOG_TYPE_DEFAULT, "Failed to read stream metadata from %@; entering passthrough mode",
              (uint8_t *)&v552,
              0xCu);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v511, v12);
          id v73 = (id)objc_claimAutoreleasedReturnValue();
          id v90 = v468;
        }

        goto LABEL_336;
      case 4:
        goto LABEL_58;
      case 5:
        v300 = [*v11 fileWriter];
        if (!v300) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1612, "_currentState.fileWriter");
        }

        objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v12);
        id v301 = *v11;
        uint64_t v302 = [*v11 currentOffset];
        id v16 = [v301 updateHashFromOffset:v302 - v12 withBytes:v511 length:v12];

        if (v16) {
          goto LABEL_463;
        }
        v303 = [*v11 fileWriter];
        id v470 = 0;
        uint64_t v15 = [v303 writeBuffer:v511 length:v510 error:&v470];
        id v9 = v470;

        if (!v15) {
          goto LABEL_511;
        }
        id v25 = *v11;
        goto LABEL_400;
      case 6:
        if ([*v11 hashedChunkSize])
        {
          uint64_t v304 = [*v11 hashedChunkSize];
          uint64_t v305 = [*v11 bytesHashedInChunk];
          if (v304 - v305 < v12) {
            unint64_t v12 = v304 - v305;
          }
        }
        id v306 = *v11;
        uint64_t v307 = [*v11 currentOffset];
        id v16 = [v306 updateHashFromOffset:v307 withBytes:v511 length:v12 onlyFinishCurrentChunk:1];

        objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v12);
        if (v16) {
          goto LABEL_463;
        }
        if (![*v11 bytesHashedInChunk]) {
          goto LABEL_509;
        }
        if (v12 != v510) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1645, "lengthToRead == length");
        }
        goto LABEL_407;
      case 7:
        goto LABEL_511;
      case 8:
        goto LABEL_510;
      default:
        v440 = SZGetLoggingHandle();
        if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR))
        {
          int v441 = [*v469 streamState];
          v552.st_dev = 67109120;
          *(_DWORD *)&v552.st_mode = v441;
          _os_log_error_impl(&dword_1DD5BF000, v440, OS_LOG_TYPE_ERROR, "Invalid unzip state encountered: %hhu", (uint8_t *)&v552, 8u);
        }

        __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1658, "false");
    }
  }
}

- (id)_beginNonStreamablePassthroughWithRemainingBytes:(uint64_t)a3 length:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = [*(id *)(a1 + 64) unzipPath];
  id v7 = *(NSObject **)(a1 + 96);
  if (v7) {
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([*(id *)(a1 + 64) performingExtraction])
  {
    uint64_t v8 = SZGetTraceHandle();
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction entered passthrough mode", (uint8_t *)&buf, 2u);
    }

    [*(id *)(a1 + 64) setPerformingExtraction:0];
  }
  id v9 = SZGetLoggingHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1DD5BF000, v9, OS_LOG_TYPE_DEFAULT, "Beginning passthrough of non-streamable zip file to %@", (uint8_t *)&buf, 0xCu);
  }

  long long v10 = SZGetTraceHandle();
  if (os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PASSTHROUGH_MODE", "Beginning passthrough of non-streamable zip file to %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v11 removeItemAtPath:v6 error:0];

  uint64_t v12 = [*(id *)(a1 + 64) performCachedWrites];
  id v39 = 0;
  uint64_t v13 = +[StreamingFileWriter synchronousFileWriterForPath:v6 withOpenFlags:1537 mode:384 quarantineInfo:0 performCachedWrites:v12 error:&v39];
  id v14 = v39;
  if (!v13)
  {
    id v25 = SZGetLoggingHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_1DD5BF000, v25, OS_LOG_TYPE_ERROR, "Failed to open passthrough output file at %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v44 = *MEMORY[0x1E4F28328];
    v45 = v6;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    _CreateError((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 196, @"SZExtractorErrorDomain", 1, v14, v26, @"Failed to open passthrough output file at %@", v27, (uint64_t)v6);
    goto LABEL_33;
  }
  [v13 setIncompleteExtractionAttribute];
  uint64_t v15 = [*(id *)(a1 + 64) unsureData];
  uint64_t v16 = [v15 length];

  id v17 = [*(id *)(a1 + 64) unsureData];
  id v38 = v14;
  char v18 = objc_msgSend(v13, "writeBuffer:length:error:", objc_msgSend(v17, "bytes"), v16, &v38);
  id v19 = v38;

  if (v18)
  {
    if (!a3)
    {
LABEL_16:
      [*(id *)(a1 + 64) setFileWriter:v13];
      [*(id *)(a1 + 64) setCurrentOffset:v16 + a3];
      int v21 = [*(id *)(a1 + 64) updateHashFromOffset:v16 withBytes:a2 length:a3];

      if (!v21)
      {
        [*(id *)(a1 + 64) setStreamState:5];
        if ((*(unsigned char *)(a1 + 80) & 4) != 0)
        {
          id v22 = [(id)a1 xpcConnection];
          uint64_t v23 = v22;
          if (v22)
          {
            id v24 = [v22 remoteObjectProxy];
            [v24 extractionEnteredPassThroughMode];
          }
          else
          {
            id v24 = [(id)a1 inProcessExtractorDelegate];
            if (v24)
            {
              uint64_t v34 = [(id)a1 inProcessDelegateQueue];

              if (v34)
              {
                int v35 = [(id)a1 inProcessDelegateQueue];
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 3221225472;
                id v47 = __54__StreamingUnzipper__extractionEnteredPassThroughMode__block_invoke;
                v48 = &unk_1E6CD1E88;
                id v24 = v24;
                id v49 = v24;
                dispatch_async(v35, &buf);
              }
            }
          }
        }
        int v21 = [*(id *)(a1 + 64) serializeState];
        if (!v21) {
          goto LABEL_35;
        }
      }
LABEL_34:
      -[StreamingUnzipper _setErrorState](a1);
      goto LABEL_35;
    }
    id v37 = v19;
    char v20 = [v13 writeBuffer:a2 length:a3 error:&v37];
    id v14 = v37;

    if (v20)
    {
      id v19 = v14;
      goto LABEL_16;
    }
    id v31 = SZGetLoggingHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1DD5BF000, v31, OS_LOG_TYPE_ERROR, "Failed to write remaining initial data to passthrough output file", (uint8_t *)&buf, 2u);
    }

    uint64_t v40 = *MEMORY[0x1E4F28328];
    BOOL v41 = v6;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    _CreateError((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 211, @"SZExtractorErrorDomain", 1, v14, v26, @"Failed to write remaining initial data to passthrough output file", v32, v36);
    int v21 = LABEL_33:;

    if (!v21) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  uint64_t v28 = SZGetLoggingHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1DD5BF000, v28, OS_LOG_TYPE_ERROR, "Failed to write initial data to passthrough output file", (uint8_t *)&buf, 2u);
  }

  uint64_t v42 = *MEMORY[0x1E4F28328];
  v43 = v6;
  int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  int v21 = _CreateError((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 205, @"SZExtractorErrorDomain", 1, v19, v29, @"Failed to write initial data to passthrough output file", v30, v36);

  if (v21) {
    goto LABEL_34;
  }
LABEL_35:

  return v21;
}

- (void)_sendExtractionProgress:(uint64_t)a1
{
  if ((*(unsigned char *)(a1 + 80) & 1) != 0 && a2 - *(double *)(a1 + 88) >= 0.00999999978)
  {
    *(double *)(a1 + 88) = a2;
    char v4 = [(id)a1 xpcConnection];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 remoteObjectProxy];
      [v6 setExtractionProgress:a2];
    }
    else
    {
      id v6 = [(id)a1 inProcessExtractorDelegate];
      if (v6)
      {
        id v7 = [(id)a1 inProcessDelegateQueue];

        if (v7)
        {
          uint64_t v8 = [(id)a1 inProcessDelegateQueue];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __45__StreamingUnzipper__sendExtractionProgress___block_invoke;
          v9[3] = &unk_1E6CD1E38;
          id v10 = v6;
          double v11 = a2;
          dispatch_async(v8, v9);
        }
      }
    }
  }
}

uint64_t __58__StreamingUnzipper__sendExtractionCompleteAtArchivePath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionCompleteAtArchivePath:*(void *)(a1 + 40)];
}

uint64_t __45__StreamingUnzipper__sendExtractionProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExtractionProgress:*(double *)(a1 + 40)];
}

uint64_t __54__StreamingUnzipper__extractionEnteredPassThroughMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionEnteredPassThroughMode];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = SZGetLoggingHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(StreamingUnzipState *)self->_currentState unzipPath];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1DD5BF000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating state for extraction to %@", buf, 0xCu);
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SZGetLoggingHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_error_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_ERROR, "StreamingFileWriter %@ encountered error %@", (uint8_t *)&v12, 0x16u);
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
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEFAULT, "Set active delegate methods to 0x%x", (uint8_t *)v6, 8u);
  }

  self->_activeDelegateMethods = a3;
}

- (void)setupUnzipperWithOutputPath:(id)a3 sandboxExtensionToken:(char *)a4 options:(id)a5 withReply:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, id, void))a6;
  id v13 = [v11 objectForKey:@"SZExtractorOptionsAssertQOS"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = [v11 objectForKey:@"SZExtractorOptionsAssertQOS"];
    uint64_t v16 = [v15 unsignedIntValue];

    qos_class_t v17 = qos_class_self();
    if (v17 != v16)
    {
      qos_class_t v32 = v17;
      id v33 = SZGetLoggingHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        _os_log_error_impl(&dword_1DD5BF000, v33, OS_LOG_TYPE_ERROR, "Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x", buf, 0xEu);
      }

      _CreateError((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 74, (void *)*MEMORY[0x1E4F28798], 22, 0, 0, @"Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x", v34, v16);
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
      uint64_t v36 = SZGetLoggingHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v35);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = v35;
        _os_log_error_impl(&dword_1DD5BF000, v36, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension token for %@ : %s (%d)", buf, 0x1Cu);
      }

      id v37 = (void *)*MEMORY[0x1E4F28798];
      strerror(v35);
      _CreateError((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 85, v37, v35, 0, 0, @"Failed to consume sandbox extension token for %@ : %s (%d)", v38, (uint64_t)v10);
      goto LABEL_30;
    }
  }
  if (self->_hasConnection)
  {
    id v19 = v10;
    uint64_t v20 = [v19 fileSystemRepresentation];
    long long v21 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)long long buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v21;
    uint64_t v46 = v20;
    int v22 = sandbox_check_by_audit_token();
    if (v22)
    {
      if (v22 == -1) {
        int v23 = *__error();
      }
      else {
        int v23 = 1;
      }
      BOOL v41 = SZGetLoggingHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v23);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = v23;
        _os_log_error_impl(&dword_1DD5BF000, v41, OS_LOG_TYPE_ERROR, "Cannot write to path %@ : %s (%d)", buf, 0x1Cu);
      }

      uint64_t v42 = (void *)*MEMORY[0x1E4F28798];
      strerror(v23);
      _CreateError((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 97, v42, v23, 0, 0, @"Cannot write to path %@ : %s (%d)", v43, (uint64_t)v19);
LABEL_30:
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v29, 0);
      goto LABEL_31;
    }
  }
  id v24 = SZGetLoggingHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v11 objectForKey:@"SZExtractorOptionsHashedChunkSize"];
    uint64_t v26 = [v25 unsignedLongLongValue];
    uint64_t v27 = [v11 objectForKey:@"SZExtractorOptionsHashesArray"];
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v27;
    _os_log_impl(&dword_1DD5BF000, v24, OS_LOG_TYPE_DEFAULT, "Initialized with path %@ ; hashed chunk size %llu ; hashes %@",
      buf,
      0x20u);
  }
  id v47 = 0;
  uint64_t v28 = +[StreamingUnzipState unzipStateWithPath:v10 options:v11 error:&v47];
  id v29 = v47;
  currentState = self->_currentState;
  self->_currentState = v28;

  id v31 = self->_currentState;
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
    id v39 = v10;
    if (setxattr((const char *)[v39 fileSystemRepresentation], "com.apple.streamingzip.incomplete_extraction", "y", 1uLL, 0, 1))
    {
      uint64_t v40 = SZGetLoggingHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = __error();
        v45 = strerror(*v44);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v39;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v45;
        _os_log_error_impl(&dword_1DD5BF000, v40, OS_LOG_TYPE_ERROR, "Failed to set incomplete extraction xattr on %@ : %s", buf, 0x16u);
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
  uint64_t v8 = [(StreamingUnzipper *)&v18 init];
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"Unzip session on behalf of %@", v6];
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