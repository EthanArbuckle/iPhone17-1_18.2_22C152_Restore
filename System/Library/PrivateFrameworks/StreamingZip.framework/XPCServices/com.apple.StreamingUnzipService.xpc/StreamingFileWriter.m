@interface StreamingFileWriter
+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11;
+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8;
- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8;
- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4;
- (BOOL)suspendWithError:(id *)a3;
- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (NSString)path;
- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9;
- (id)description;
- (int)currentOutputFD;
- (int64_t)currentOffsetWithError:(id *)a3;
- (int64_t)fileSize;
- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)closeCurrentOutputFD;
- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5;
- (void)dealloc;
- (void)setCurrentOutputFD:(int)a3;
- (void)setIncompleteExtractionAttribute;
@end

@implementation StreamingFileWriter

- (void).cxx_destruct
{
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setCurrentOutputFD:(int)a3
{
  self->_currentOutputFD = a3;
}

- (int)currentOutputFD
{
  return self->_currentOutputFD;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(StreamingFileWriter *)self path];
  v6 = +[NSString stringWithFormat:@"<%@: path=%@>", v4, v5];

  return v6;
}

- (void)closeCurrentOutputFD
{
  int v3 = [(StreamingFileWriter *)self currentOutputFD];
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    [(StreamingFileWriter *)self setCurrentOutputFD:0xFFFFFFFFLL];
  }
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  int v6 = a5;
  uint64_t v7 = *(void *)&a4.tv_usec;
  __darwin_time_t tv_sec = a4.tv_sec;
  uint64_t v9 = *(void *)&a3.tv_usec;
  __darwin_time_t v10 = a3.tv_sec;
  int v12 = [(StreamingFileWriter *)self currentOutputFD];
  v25.__darwin_time_t tv_sec = v10;
  *(void *)&v25.tv_usec = v9;
  __darwin_time_t v26 = tv_sec;
  uint64_t v27 = v7;
  if (futimes(v12, &v25))
  {
    int v13 = *__error();
    v14 = sub_100003788();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = [(StreamingFileWriter *)self path];
      int v21 = 138412546;
      v22 = v18;
      __int16 v23 = 2080;
      v24[0] = strerror(v13);
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to set times on %@ : %s", (uint8_t *)&v21, 0x16u);
    }
  }
  if (fchmod(v12, v6))
  {
    int v15 = *__error();
    v16 = sub_100003788();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = [(StreamingFileWriter *)self path];
      v20 = strerror(v15);
      int v21 = 138412802;
      v22 = v19;
      __int16 v23 = 1024;
      LODWORD(v24[0]) = v6;
      WORD2(v24[0]) = 2080;
      *(void *)((char *)v24 + 6) = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to set mode of %@ to 0%o: %s", (uint8_t *)&v21, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)suspendWithError:(id *)a3
{
  return 1;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  BOOL v7 = a3;
  uint64_t v9 = [(StreamingFileWriter *)self path];
  uint64_t v10 = [(StreamingFileWriter *)self fileSize];
  int v11 = [(StreamingFileWriter *)self currentOutputFD];
  int v12 = v11;
  if (v10 > 0x4000)
  {
    *(void *)&buf[16] = v10;
    uint64_t v23 = 0;
    *(void *)buf = 0x300000002;
    *(void *)&buf[8] = 0;
    if (fcntl(v11, 42, buf) == -1)
    {
      int v13 = *__error();
      v14 = sub_100003788();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v21 = strerror(v13);
        *(_DWORD *)timeval v25 = 134218498;
        uint64_t v26 = v10;
        __int16 v27 = 2112;
        v28 = v9;
        __int16 v29 = 2080;
        v30 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Advisory preallocation of %lld bytes for %@ failed: %s", v25, 0x20u);
      }
    }
  }
  if (fchmod(v12, 0x180u))
  {
    int v15 = *__error();
    v16 = sub_100003788();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = strerror(v15);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Setting initial mode on %@ failed: %s", buf, 0x16u);
    }
  }
  if (v7 && fchown(v12, a4, a5))
  {
    int v17 = *__error();
    v18 = sub_100003788();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = strerror(v17);
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a5;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v17;
      HIWORD(v23) = 2080;
      v24 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to fchown %@ to (%d:%d) : %d (%s)", buf, 0x28u);
    }
  }
}

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int v9 = [(StreamingFileWriter *)self currentOutputFD];
  uint64_t v10 = 0;
  do
  {
    if (a4 == v10) {
      return 1;
    }
    ssize_t v11 = write(v9, (char *)a3 + v10, a4 - v10);
    v10 += v11;
  }
  while ((v11 & 0x8000000000000000) == 0);
  if (a4 == -1) {
    return 1;
  }
  uint64_t v12 = *__error();
  int v13 = [(StreamingFileWriter *)self path];
  v14 = sub_100003788();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v13;
    __int16 v23 = 2080;
    v24 = strerror(v12);
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to write data to output file at %@: %s", buf, 0x16u);
  }

  NSErrorUserInfoKey v19 = NSFilePathErrorKey;
  v20 = v13;
  int v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  strerror(v12);
  int v17 = sub_100004A7C((uint64_t)"-[StreamingFileWriter writeBuffer:length:error:]", 263, NSPOSIXErrorDomain, v12, 0, v15, @"Failed to write data to output file at %@: %s", v16, (uint64_t)v13);

  if (a5) {
    *a5 = v17;
  }

  return 0;
}

- (void)setIncompleteExtractionAttribute
{
  if (fsetxattr([(StreamingFileWriter *)self currentOutputFD], "com.apple.streamingzip.incomplete_extraction", "y", 1uLL, 0, 0))
  {
    int v3 = *__error();
    v4 = sub_100003788();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [(StreamingFileWriter *)self path];
      int v6 = 138412546;
      BOOL v7 = v5;
      __int16 v8 = 2080;
      int v9 = strerror(v3);
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to set incomplete extraction xattr on %@ : %s", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  off_t v7 = lseek([(StreamingFileWriter *)self currentOutputFD], a3, 0);
  if (v7 == -1)
  {
    uint64_t v8 = *__error();
    int v9 = [(StreamingFileWriter *)self path];
    uint64_t v10 = sub_100003788();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      int64_t v18 = a3;
      __int16 v19 = 2112;
      v20 = v9;
      __int16 v21 = 2080;
      v22 = strerror(v8);
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to seek to offset %llu in output file at path %@ : %s", buf, 0x20u);
    }

    NSErrorUserInfoKey v15 = NSFilePathErrorKey;
    uint64_t v16 = v9;
    ssize_t v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    strerror(v8);
    int v13 = sub_100004A7C((uint64_t)"-[StreamingFileWriter setCurrentOffset:error:]", 239, NSPOSIXErrorDomain, v8, 0, v11, @"Failed to seek to offset %llu in output file at path %@ : %s", v12, a3);

    if (a4) {
      *a4 = v13;
    }
  }
  return v7 != -1;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  off_t v5 = lseek([(StreamingFileWriter *)self currentOutputFD], 0, 1);
  if (v5 == -1)
  {
    uint64_t v6 = *__error();
    off_t v7 = [(StreamingFileWriter *)self path];
    uint64_t v8 = sub_100003788();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v7;
      __int16 v17 = 2080;
      int64_t v18 = strerror(v6);
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to seek to current offset in output file at path %@ : %s", buf, 0x16u);
    }

    NSErrorUserInfoKey v13 = NSFilePathErrorKey;
    v14 = v7;
    int v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    strerror(v6);
    ssize_t v11 = sub_100004A7C((uint64_t)"-[StreamingFileWriter currentOffsetWithError:]", 225, NSPOSIXErrorDomain, v6, 0, v9, @"Failed to seek to current offset in output file at path %@ : %s", v10, (uint64_t)v7);

    if (a3) {
      *a3 = v11;
    }
  }
  return v5;
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  ssize_t v7 = read([(StreamingFileWriter *)self currentOutputFD], a3, a4);
  if (v7 == -1)
  {
    int v8 = *__error();
    int v9 = [(StreamingFileWriter *)self path];
    uint64_t v10 = sub_100003788();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v18 = v9;
      __int16 v19 = 1024;
      int v20 = v8;
      __int16 v21 = 2080;
      v22 = strerror(v8);
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to read bytes from %@ : %d (%s)", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v15 = NSFilePathErrorKey;
    uint64_t v16 = v9;
    ssize_t v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    strerror(v8);
    NSErrorUserInfoKey v13 = sub_100004A7C((uint64_t)"-[StreamingFileWriter readIntoBuffer:length:error:]", 210, NSPOSIXErrorDomain, v8, 0, v11, @"Failed to read bytes from %@ : %d (%s)", v12, (uint64_t)v9);

    if (a5) {
      *a5 = v13;
    }
  }
  return v7;
}

- (void)dealloc
{
  [(StreamingFileWriter *)self closeCurrentOutputFD];
  v3.receiver = self;
  v3.super_class = (Class)StreamingFileWriter;
  [(StreamingFileWriter *)&v3 dealloc];
}

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9
{
  BOOL v10 = a7;
  uint64_t v12 = a5;
  uint64_t v13 = *(void *)&a4;
  id v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)StreamingFileWriter;
  __int16 v17 = [(StreamingFileWriter *)&v21 init];
  int64_t v18 = v17;
  if (v17
    && (v17->_fileSize = a8,
        objc_storeStrong((id *)&v17->_path, a3),
        v18->_currentOutputFD = -1,
        ![(StreamingFileWriter *)v18 _openCurrentOutputFDForPath:v16 withOpenFlags:v13 mode:v12 performCachedWrites:v10 quarantineInfo:a6 error:a9]))
  {
    __int16 v19 = 0;
  }
  else
  {
    __int16 v19 = v18;
  }

  return v19;
}

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  unsigned int v10 = a5;
  id v13 = a3;
  uint64_t v14 = [(StreamingFileWriter *)self fileSize];
  id v15 = v13;
  id v16 = (const char *)[v15 fileSystemRepresentation];

  if ((a4 & 0x200) != 0) {
    uint64_t v32 = v10;
  }
  uint64_t v17 = open(v16, a4, v32);
  uint64_t v18 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    if (fcntl(v17, 68, 1) < 0)
    {
      int v23 = *__error();
      v24 = sub_100003788();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v34 = v16;
        __int16 v35 = 1024;
        int v36 = v23;
        __int16 v37 = 2080;
        v38 = strerror(v23);
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not mark %s static: %d (%s)", buf, 0x1Cu);
      }

      if (a6) {
        goto LABEL_20;
      }
    }
    else if (a6)
    {
LABEL_20:
      if (fcntl(v18, 76, 1) < 0)
      {
        int v27 = *__error();
        v28 = sub_100003788();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v30 = strerror(v27);
          *(_DWORD *)buf = 136315650;
          v34 = v16;
          __int16 v35 = 1024;
          int v36 = v27;
          __int16 v37 = 2080;
          v38 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Unable to set F_SINGLE_WRITER on %s : %d (%s)", buf, 0x1Cu);
        }
      }
      [(StreamingFileWriter *)self setCurrentOutputFD:v18];
      id v22 = 0;
      goto LABEL_25;
    }
    if ((v14 >= 0x8000 || v14 == -1) && fcntl(v18, 48, 1) < 0)
    {
      int v25 = *__error();
      uint64_t v26 = sub_100003788();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v31 = strerror(v25);
        *(_DWORD *)buf = 136315650;
        v34 = v16;
        __int16 v35 = 1024;
        int v36 = v25;
        __int16 v37 = 2080;
        v38 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to set F_NOCACHE accessing file %s : %d (%s)", buf, 0x1Cu);
      }
    }
    goto LABEL_20;
  }
  int v19 = *__error();
  int v20 = sub_100003788();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v34 = v16;
    __int16 v35 = 1024;
    int v36 = v19;
    __int16 v37 = 2080;
    v38 = strerror(v19);
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to open %s : %d (%s)", buf, 0x1Cu);
  }

  strerror(v19);
  sub_100004A7C((uint64_t)"-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]", 93, NSPOSIXErrorDomain, v19, 0, 0, @"Failed to open %s : %d (%s)", v21, (uint64_t)v16);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (a8)
  {
    id v22 = v22;
    *a8 = v22;
  }
LABEL_25:

  return (int)v18 >= 0;
}

+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v11 = a5;
  uint64_t v12 = *(void *)&a4;
  id v13 = a3;
  id v14 = [[StreamingFileWriter alloc] _initForWritingToPath:v13 withOpenFlags:v12 mode:v11 quarantineInfo:a6 performCachedWrites:v9 expectedSize:-1 error:a8];

  return v14;
}

+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11
{
  uint64_t v12 = a7;
  uint64_t v14 = a5;
  uint64_t v15 = *(void *)&a4;
  id v16 = a3;
  uint64_t v17 = a9;
  id v18 = a10;
  char v24 = 0;
  if (qword_10002F3B0 != -1) {
    dispatch_once(&qword_10002F3B0, &stru_100028B08);
  }
  if (byte_10002F3B8) {
    goto LABEL_4;
  }
  unsigned int v23 = v12;
  int v20 = +[StreamingFileWriterQueue sharedInstance];
  uint64_t v21 = [v20 reserveAsyncOperationForFileSize:a8 path:v16 group:v17 operationPendingForPath:&v24];

  if (v24) {
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v12 = v23;
  if (!v21)
  {
LABEL_4:
    id v19 = [[StreamingFileWriter alloc] _initForWritingToPath:v16 withOpenFlags:v15 mode:v14 quarantineInfo:a6 performCachedWrites:v12 expectedSize:a8 error:a11];
  }
  else
  {
    id v19 = [[AsyncStreamingFileWriter alloc] _initForWritingToPath:v16 withOpenFlags:v15 mode:v14 quarantineInfo:a6 performCachedWrites:v23 expectedSize:a8 asyncTrackingGroup:v17 errorDelegate:v18 reservation:v21 error:a11];
  }

  return v19;
}

@end