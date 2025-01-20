int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  if ((_set_user_dir_suffix() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v9 = *__error();
    v10 = 136315394;
    v11 = "com.apple.trial.TrialArchivingService";
    v12 = 1024;
    v13 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to set private sandbox for %s, errno: %d", (uint8_t *)&v10, 0x12u);
  }
  v4 = NSTemporaryDirectory();
  v5 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TrialArchivingService started", (uint8_t *)&v10, 2u);
  }

  v6 = objc_opt_new();
  v7 = +[NSXPCListener serviceListener];
  [v7 setDelegate:v6];
  [v7 resume];

  return 1;
}

id TRILogCategory_Server()
{
  if (qword_100014F70 != -1) {
    dispatch_once(&qword_100014F70, &stru_100010500);
  }
  v0 = (void *)qword_100014F78;
  return v0;
}

void sub_100004C58(id a1)
{
  qword_100014F78 = (uint64_t)os_log_create("com.apple.triald", "server");
  _objc_release_x1();
}

id TRILogCategory_Archiving()
{
  if (qword_100014F80 != -1) {
    dispatch_once(&qword_100014F80, &stru_100010520);
  }
  v0 = (void *)qword_100014F88;
  return v0;
}

void sub_100004CF0(id a1)
{
  qword_100014F88 = (uint64_t)os_log_create("com.apple.triald", "archiving");
  _objc_release_x1();
}

void sub_10000567C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1000053C4);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100006520(id a1)
{
  return 0;
}

void sub_100006528(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 64) _createReadArchive];
  if (!v4)
  {
    v10 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error creating archive for reading.", (uint8_t *)&v14, 2u);
    }

    unsigned __int8 v11 = 0;
    uint64_t v12 = a1 + 56;
    goto LABEL_18;
  }
  id v5 = v4;
  [*(id *)(a1 + 32) fileDescriptor];
  if (archive_read_open_fd())
  {
    v6 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = archive_error_string();
      v7 = "unable to open archive_read - %s.";
      v8 = v6;
      uint32_t v9 = 12;
LABEL_21:
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v14, v9);
    }
  }
  else
  {
    notify_post("com.apple.trial.TrialArchivingService.test.beginExtract");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = [*(id *)(a1 + 64) _withLockWitness:a2 performExtractionIntoCurrentDirectoryFromArchive:v5 maxUnarchivedSize:*(void *)(a1 + 72) archiveIdentifier:*(void *)(a1 + 40) shouldDefer:*(void *)(a1 + 48)];
    if (!archive_read_close()) {
      goto LABEL_11;
    }
    v6 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      v7 = "unable to close archive_read";
      v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_21;
    }
  }

LABEL_11:
  if (archive_read_free())
  {
    v13 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "unable to free archive_read (leaking)", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v12 = a1 + 56;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) == 1 && *(void *)(a1 + 80) == 1)
  {
    notify_post("com.apple.trial.TrialArchivingService.test.beginCompress");
    unsigned __int8 v11 = [*(id *)(a1 + 64) _compressFilesInCurrentDirectoryWithLockWitness:a2 shouldDefer:*(void *)(a1 + 48)];
LABEL_18:
    *(unsigned char *)(*(void *)(*(void *)v12 + 8) + 32) = v11;
  }
}

void sub_1000071E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (a2)
  {
    _Block_object_dispose(&a26, 8);
    objc_begin_catch(exception_object);
    if (!v26) {
      JUMPOUT(0x100006FC0);
    }
    JUMPOUT(0x100006FC8);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007278(uint64_t a1)
{
  atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  v1 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    v3 = "com.apple.trial.TrialArchivingService.shouldDefer";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "received notification: %s", (uint8_t *)&v2, 0xCu);
  }
}

uint64_t sub_100007334(uint64_t a1)
{
  if (*(double *)(a1 + 40) > 0.0)
  {
    int v2 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Test config: pausing for %g sec before deferral check", (uint8_t *)&v7, 0xCu);
    }

    +[NSThread sleepForTimeInterval:*(double *)(a1 + 40)];
    v3 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Test config: deferral check executing", (uint8_t *)&v7, 2u);
    }
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  return v4 & 1;
}

void sub_1000078B8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x100007724);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a2)
  {
    _Block_object_dispose(&a27, 8);
    objc_begin_catch(exception_object);
    JUMPOUT(0x100007E40);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008084(uint64_t a1)
{
  atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  v1 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    v3 = "com.apple.trial.TrialArchivingService.shouldDefer";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "received notification: %s", (uint8_t *)&v2, 0xCu);
  }
}

uint64_t sub_100008140(uint64_t a1)
{
  if (*(double *)(a1 + 40) > 0.0)
  {
    int v2 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Test config: pausing for %g sec before deferral check", (uint8_t *)&v7, 0xCu);
    }

    +[NSThread sleepForTimeInterval:*(double *)(a1 + 40)];
    v3 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Test config: deferral check executing", (uint8_t *)&v7, 2u);
    }
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  return v4 & 1;
}

void sub_100008C94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2)
  {
    _Block_object_dispose(&a11, 8);
    objc_begin_catch(exception_object);
    JUMPOUT(0x100008A70);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008D1C()
{
  if (!qword_100014F90) {
    qword_100014F90 = _sl_dlopen();
  }
  return qword_100014F90;
}

uint64_t sub_100008DEC()
{
  uint64_t result = _sl_dlopen();
  qword_100014F90 = result;
  return result;
}

void *sub_100008E60(uint64_t a1)
{
  int v2 = sub_100008EB0();
  uint64_t result = dlsym(v2, "espresso_create_context");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100014F98 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100008EB0()
{
  uint64_t v0 = sub_100008D1C();
  if (v0) {
    return (void *)v0;
  }
  v1 = +[NSAssertionHandler currentHandler];
  v3 = +[NSString stringWithUTF8String:"void *EspressoLibrary(void)"];
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, @"TrialArchivingService.m", 29, @"%s", 0);

  __break(1u);
  free(v4);
  return v1;
}

void *sub_100008F60(uint64_t a1)
{
  int v2 = sub_100008EB0();
  uint64_t result = dlsym(v2, "espresso_context_destroy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100014FA0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100008FB0(uint64_t a1)
{
  int v2 = sub_100008EB0();
  uint64_t result = dlsym(v2, "espresso_ane_cache_purge_network");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100014FA8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100009000(uint64_t a1)
{
  int v2 = sub_100008EB0();
  uint64_t result = dlsym(v2, "espresso_ane_cache_has_network");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100014FB0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL sub_100009584(id a1)
{
  return 0;
}

BOOL sub_10000958C(id a1)
{
  return 0;
}

BOOL sub_1000098F8(id a1)
{
  return 0;
}

void sub_100009E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100009E6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009E7C(uint64_t a1)
{
}

void sub_100009E84(uint64_t a1)
{
  unsigned int v2 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if (v2 == 1)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      unsigned __int8 v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = 0;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      id v5 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deferring during AFSC stream write.", (uint8_t *)&v13, 2u);
      }

      atomic_store(2u, (unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) bytes];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length];
      uint64_t v9 = ParallelCompressionAFSCStreamWrite();
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      unsigned __int8 v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      if (v9 < 0)
      {
        uint64_t v12 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = 134217984;
          uint64_t v14 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AFSC stream failed to write with error (%zu)", (uint8_t *)&v13, 0xCu);
        }

        atomic_store(0, (unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    uint64_t v8 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v8);
  }
}

void sub_10000A370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000A394(id a1)
{
  return 0;
}

void sub_10000A39C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v6 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deferred during AFSC directory pass.", (uint8_t *)&v11, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 2;
LABEL_5:
    *a3 = 1;
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = [*(id *)(a1 + 32) inPlaceCompressFile:v5 shouldDefer:*(void *)(a1 + 40)];
  int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  if (v7 == 2)
  {
    uint64_t v9 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deferred during compression of %@", (uint8_t *)&v11, 0xCu);
    }

    *a3 = 1;
  }
  else
  {
    if (v7 != 1)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)) {
        goto LABEL_6;
      }
      uint64_t v8 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error: compression failed for %@", (uint8_t *)&v11, 0xCu);
      }

      goto LABEL_5;
    }
    uint64_t v10 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Finished compressing %@", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_6:
}

uint64_t sub_10000A7A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

int AAByteStreamClose(AAByteStream s)
{
  return _AAByteStreamClose(s);
}

off_t AAByteStreamProcess(AAByteStream istream, AAByteStream ostream)
{
  return _AAByteStreamProcess(istream, ostream);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return _AAFileStreamOpenWithPath(path, open_flags, open_mode);
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return _AEAContextCreateWithEncryptedStream(encrypted_stream);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return _AEAContextSetFieldBlob(context, field, representation, buf, buf_size);
}

AAByteStream AEADecryptionInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, AAFlagSet flags, int n_threads)
{
  return _AEADecryptionInputStreamOpen(encrypted_stream, context, flags, n_threads);
}

uint64_t DirectoryPatch()
{
  return _DirectoryPatch();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t ParallelCompressionAFSCStreamClose()
{
  return _ParallelCompressionAFSCStreamClose();
}

uint64_t ParallelCompressionAFSCStreamOpen()
{
  return _ParallelCompressionAFSCStreamOpen();
}

uint64_t ParallelCompressionAFSCStreamWrite()
{
  return _ParallelCompressionAFSCStreamWrite();
}

uint64_t ParallelCompressionEnterThreadErrorContext()
{
  return _ParallelCompressionEnterThreadErrorContext();
}

uint64_t ParallelCompressionLeaveThreadErrorContext()
{
  return _ParallelCompressionLeaveThreadErrorContext();
}

uint64_t TRINamespace_NamespaceId_EnumDescriptor()
{
  return _TRINamespace_NamespaceId_EnumDescriptor();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint64_t archive_entry_filetype()
{
  return _archive_entry_filetype();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_pathname_utf8()
{
  return _archive_entry_pathname_utf8();
}

uint64_t archive_entry_perm()
{
  return _archive_entry_perm();
}

uint64_t archive_entry_set_pathname_utf8()
{
  return _archive_entry_set_pathname_utf8();
}

uint64_t archive_entry_set_perm()
{
  return _archive_entry_set_perm();
}

uint64_t archive_entry_size()
{
  return _archive_entry_size();
}

uint64_t archive_entry_size_is_set()
{
  return _archive_entry_size_is_set();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_fd()
{
  return _archive_read_open_fd();
}

uint64_t archive_read_support_format_zip()
{
  return _archive_read_support_format_zip();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data_block()
{
  return _archive_write_data_block();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_options()
{
  return _archive_write_disk_set_options();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return _archive_write_disk_set_standard_lookup();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return _getcwd(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createReadArchive(void *a1, const char *a2, ...)
{
  return [a1 _createReadArchive];
}

id objc_msgSend__createWriteDiskArchive(void *a1, const char *a2, ...)
{
  return [a1 _createWriteDiskArchive];
}

id objc_msgSend__deferralDelaySecondsForTesting(void *a1, const char *a2, ...)
{
  return [a1 _deferralDelaySecondsForTesting];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 currentDirectoryPath];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fileAttributes(void *a1, const char *a2, ...)
{
  return [a1 fileAttributes];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedSystemPaths(void *a1, const char *a2, ...)
{
  return [a1 sharedSystemPaths];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_triStringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 triStringByResolvingSymlinksInPath];
}

id objc_msgSend_trialRootDir(void *a1, const char *a2, ...)
{
  return [a1 trialRootDir];
}