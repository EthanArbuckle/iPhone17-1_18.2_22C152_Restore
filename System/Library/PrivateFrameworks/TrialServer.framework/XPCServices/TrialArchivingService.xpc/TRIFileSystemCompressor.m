@interface TRIFileSystemCompressor
+ (BOOL)_enumerateFilesInDirectory:(id)a3 block:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)_compressContentsOfSourceHandle:(id)a3 toDestinationFd:(int)a4 shouldDefer:(id)a5;
- ($A5A652246548B43F8BC05201A1C72A70)compressContentsOfFileHandle:(id)a3 toDestinationFile:(id)a4 shouldDefer:(id)a5;
- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressDirectory:(id)a3 shouldDefer:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressFile:(id)a3 shouldDefer:(id)a4;
- (BOOL)_isCompressibleFile:(id)a3;
- (id)_temporaryCompressionFileForFile:(id)a3;
@end

@implementation TRIFileSystemCompressor

- (id)_temporaryCompressionFileForFile:(id)a3
{
  v5 = [a3 stringByDeletingLastPathComponent];
  v6 = objc_opt_new();
  v7 = [v6 UUIDString];
  v8 = [v5 stringByAppendingPathComponent:v7];

  v9 = [v8 stringByAppendingPathExtension:@"trial-afsc-compressed"];
  if (!v9)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 41, @"Expression was unexpectedly nil/false: %@", @"[temporaryFile stringByAppendingPathExtension:@\"trial-afsc-compressed\"]" object file lineNumber description];
  }
  return v9;
}

- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressFile:(id)a3 shouldDefer:(id)a4
{
  v7 = (char *)a3;
  v8 = (Block_layout *)a4;
  if (!v7)
  {
    v35 = +[NSAssertionHandler currentHandler];
    [v35 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 49, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];
  }
  if ([(TRIFileSystemCompressor *)self _isCompressibleFile:v7])
  {
    if (v8) {
      v9 = v8;
    }
    else {
      v9 = &stru_100010658;
    }
    v10 = objc_retainBlock(v9);

    v11 = +[NSURL fileURLWithPath:v7];
    id v36 = 0;
    v12 = +[NSFileHandle fileHandleForReadingFromURL:v11 error:&v36];
    v13 = (char *)v36;

    if (!v12)
    {
      v14 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v7;
        __int16 v39 = 2112;
        v40 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to open file \"%@\" for AFSC compression: %@", buf, 0x16u);
      }
      unsigned __int8 v18 = 0;
      goto LABEL_25;
    }
    v14 = [(TRIFileSystemCompressor *)self _temporaryCompressionFileForFile:v7];
    uint64_t v15 = open_dprotected_np((const char *)[v14 fileSystemRepresentation], 514, 4, 0, 384);
    if ((v15 & 0x80000000) != 0)
    {
      v20 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v29 = __error();
        v30 = strerror(*v29);
        int v31 = *__error();
        *(_DWORD *)buf = 136315394;
        v38 = v30;
        __int16 v39 = 1024;
        LODWORD(v40) = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Skipping AFSC compression because temp file could not be opened: %s (%d)", buf, 0x12u);
      }
    }
    else
    {
      int v16 = v15;
      if (v10) {
        v17 = v10;
      }
      else {
        v17 = &stru_100010678;
      }
      unsigned __int8 v18 = [(TRIFileSystemCompressor *)self _compressContentsOfSourceHandle:v12 toDestinationFd:v15 shouldDefer:v17];
      close(v16);
      if (v18 == 2) {
        goto LABEL_25;
      }
      if (v18)
      {
        v22 = v14;
        v23 = (const std::__fs::filesystem::path *)[v22 fileSystemRepresentation];
        v24 = v7;
        v25 = (const std::__fs::filesystem::path *)[v24 fileSystemRepresentation];
        rename(v23, v25, v26);
        if (!v27)
        {
          unsigned __int8 v18 = 1;
          v14 = v22;
          goto LABEL_25;
        }
        v28 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v32 = __error();
          v33 = strerror(*v32);
          int v34 = *__error();
          *(_DWORD *)buf = 138413058;
          v38 = (char *)v22;
          __int16 v39 = 2112;
          v40 = v24;
          __int16 v41 = 2080;
          v42 = v33;
          __int16 v43 = 1024;
          int v44 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Couldn't rename %@ --> %@: %s (%d)", buf, 0x26u);
        }

        v20 = +[NSFileManager defaultManager];
        [v20 removeItemAtPath:v22 error:0];
        unsigned __int8 v18 = 0;
LABEL_24:

LABEL_25:
        v8 = v10;
        goto LABEL_26;
      }
      v19 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping AFSC compression due to error while compressing.", buf, 2u);
      }

      v20 = +[NSFileManager defaultManager];
      [v20 removeItemAtPath:v14 error:0];
    }
    unsigned __int8 v18 = 1;
    goto LABEL_24;
  }
  unsigned __int8 v18 = 0;
LABEL_26:

  return ($A5A652246548B43F8BC05201A1C72A70)v18;
}

- (BOOL)_isCompressibleFile:(id)a3
{
  id v3 = a3;
  char v9 = 0;
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v9];

  BOOL v6 = 0;
  if (v5)
  {
    if (v9)
    {
      v7 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unexpectedly requested to AFSC compress a directory %@", buf, 0xCu);
      }

      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- ($A5A652246548B43F8BC05201A1C72A70)compressContentsOfFileHandle:(id)a3 toDestinationFile:(id)a4 shouldDefer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (Block_layout *)a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 123, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v25 = +[NSAssertionHandler currentHandler];
  [v25 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 124, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];

LABEL_3:
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = &stru_100010698;
  }
  v13 = objc_retainBlock(v12);

  id v14 = v10;
  uint64_t v15 = open_dprotected_np((const char *)[v14 fileSystemRepresentation], 514, 4, 0, 384);
  if ((v15 & 0x80000000) != 0)
  {
    unsigned __int8 v18 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = __error();
      v22 = strerror(*v21);
      int v23 = *__error();
      *(_DWORD *)buf = 138412802;
      id v27 = v14;
      __int16 v28 = 2080;
      v29 = v22;
      __int16 v30 = 1024;
      int v31 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to open %@: %s (%d)", buf, 0x1Cu);
    }

    unsigned __int8 v17 = 0;
  }
  else
  {
    int v16 = v15;
    unsigned __int8 v17 = [(TRIFileSystemCompressor *)self _compressContentsOfSourceHandle:v9 toDestinationFd:v15 shouldDefer:v13];
    close(v16);
    if (v17 == 1)
    {
      unsigned __int8 v17 = 1;
    }
    else
    {
      v19 = +[NSFileManager defaultManager];
      [v19 removeItemAtPath:v14 error:0];
    }
  }

  return ($A5A652246548B43F8BC05201A1C72A70)v17;
}

- ($A5A652246548B43F8BC05201A1C72A70)_compressContentsOfSourceHandle:(id)a3 toDestinationFd:(int)a4 shouldDefer:(id)a5
{
  id v6 = a3;
  id v30 = a5;
  memset(&v42, 0, sizeof(v42));
  if (fstat((int)[v6 fileDescriptor], &v42))
  {
    v7 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v24 = __error();
      v25 = strerror(*v24);
      int v26 = *__error();
      *(_DWORD *)v45 = 136315394;
      *(void *)&v45[4] = v25;
      *(_WORD *)&v45[12] = 1024;
      *(_DWORD *)&v45[14] = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to fstat source file handle for AFSC compression: %s (%d)", v45, 0x12u);
    }
    v8.var0 = 0;
    goto LABEL_5;
  }
  if (v42.st_size)
  {
    uint64_t v29 = ParallelCompressionAFSCStreamOpen();
    if (v29)
    {
      id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);

      if (!v11)
      {
        id v27 = +[NSAssertionHandler currentHandler];
        __int16 v28 = +[NSString stringWithUTF8String:"dispatch_queue_t  _Nonnull _PASAutoreleasingSerialQueueWithQOS(const char * _Nullable, qos_class_t)"];
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"_PASDispatchInline.h", 191, @"Unsupported QOS class: %u", 17);
      }
      v7 = dispatch_queue_create("com.apple.trial.compression-io", v11);

      dispatch_semaphore_t v12 = dispatch_semaphore_create(2);
      uint64_t v38 = 0;
      __int16 v39 = (unsigned int *)&v38;
      uint64_t v40 = 0x2020000000;
      int v41 = 1;
      while (1)
      {
        unsigned int v13 = atomic_load(v39 + 6);
        if (v13 != 1)
        {
LABEL_21:
          dispatch_sync(v7, &stru_1000106E0);
          v8.var0 = atomic_load(v39 + 6);
          int v20 = ParallelCompressionAFSCStreamClose();
          int v21 = v20;
          if (v8.var0 == 1 && v20 != 0)
          {
            int v23 = TRILogCategory_Archiving();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v45 = 67109120;
              *(_DWORD *)&v45[4] = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "AFSC stream failed to close with error (%d)", v45, 8u);
            }

            v8.var0 = 0;
          }
          _Block_object_dispose(&v38, 8);

          goto LABEL_5;
        }
        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        *(void *)v45 = 0;
        *(void *)&v45[8] = v45;
        *(void *)&v45[16] = 0x3032000000;
        v46 = sub_100009E6C;
        v47 = sub_100009E7C;
        id v37 = 0;
        uint64_t v15 = [v6 readDataUpToLength:0x20000 error:&v37];
        id v16 = v37;
        id v48 = v15;
        unsigned __int8 v17 = *(void **)(*(void *)&v45[8] + 40);
        if (!v17) {
          break;
        }
        if (![v17 length]) {
          goto LABEL_19;
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100009E84;
        block[3] = &unk_1000106C0;
        int v34 = &v38;
        v35 = v45;
        v32 = v12;
        id v33 = v30;
        uint64_t v36 = v29;
        dispatch_async(v7, block);

        char v18 = 1;
LABEL_20:
        _Block_object_dispose(v45, 8);

        if ((v18 & 1) == 0) {
          goto LABEL_21;
        }
      }
      v19 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to read source file during AFSC compression: %@", buf, 0xCu);
      }

      atomic_store(0, v39 + 6);
LABEL_19:
      dispatch_semaphore_signal(v12);
      char v18 = 0;
      goto LABEL_20;
    }
    v8.var0 = 0;
  }
  else
  {
    v7 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "File data is empty, ignoring compression.", v45, 2u);
    }
    v8.var0 = 1;
LABEL_5:
  }
  return v8;
}

- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressDirectory:(id)a3 shouldDefer:(id)a4
{
  id v7 = a3;
  $A5A652246548B43F8BC05201A1C72A70 v8 = (Block_layout *)a4;
  if (!v7)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 254, @"Invalid parameter not satisfying: %@", @"dirPath" object file lineNumber description];
  }
  char v24 = 0;
  id v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:v7 isDirectory:&v24];

  if (!v10) {
    goto LABEL_18;
  }
  if (!v24)
  {
    unsigned __int8 v17 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unexpectedly requested to AFSC compress a file %@", (uint8_t *)&buf, 0xCu);
    }

LABEL_18:
    v16.var0 = 0;
    goto LABEL_19;
  }
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &stru_100010700;
  }
  dispatch_semaphore_t v12 = objc_retainBlock(v11);

  unsigned int v13 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Compressing files in %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2810000000;
  id v27 = &unk_10000D389;
  char v28 = 1;
  id v14 = objc_opt_class();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000A39C;
  v21[3] = &unk_100010728;
  $A5A652246548B43F8BC05201A1C72A70 v8 = v12;
  v22 = v8;
  p_long long buf = &buf;
  v21[4] = self;
  if (([v14 _enumerateFilesInDirectory:v7 block:v21] & 1) == 0)
  {
    uint64_t v15 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v20 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Some files not AFSC compressed due to directory enumeration failure.", v20, 2u);
    }
  }
  v16.var0 = *(unsigned char *)(*((void *)&buf + 1) + 32);

  _Block_object_dispose(&buf, 8);
LABEL_19:

  return v16;
}

+ (BOOL)_enumerateFilesInDirectory:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if (v7)
  {
    $A5A652246548B43F8BC05201A1C72A70 v8 = +[NSFileManager defaultManager];
    id v9 = [v8 enumeratorAtPath:v5];

    uint64_t v11 = [v9 nextObject];
    if (v11)
    {
      dispatch_semaphore_t v12 = (void *)v11;
      while (1)
      {
        unsigned int v13 = [v9 fileAttributes];
        NSFileAttributeType v14 = [v13 objectForKeyedSubscript:NSFileType];

        if (v14 != NSFileTypeDirectory)
        {
          uint64_t v15 = [v5 stringByAppendingPathComponent:v12];
          unsigned __int8 v16 = [v7 addString:v15];

          if ((v16 & 1) == 0) {
            break;
          }
        }

        dispatch_semaphore_t v12 = [v9 nextObject];
        if (!v12) {
          goto LABEL_7;
        }
      }

      unsigned __int8 v17 = 0;
    }
    else
    {
LABEL_7:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000A7A0;
      v19[3] = &unk_100010750;
      id v20 = v6;
      unsigned __int8 v17 = [v7 enumerateStringsWithBlock:v19];
    }
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

@end