@interface AsyncStreamingFileWriter
- (BOOL)_executeWithError:(id *)a3;
- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8;
- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)performCachedWrites;
- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4;
- (BOOL)setOwnership;
- (BOOL)suspendWithError:(id *)a3;
- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (NSMutableData)fileData;
- (OS_dispatch_group)trackingGroup;
- (StreamingFileWriterErrorDelegate)errorDelegate;
- (StreamingFileWriterQueueReservation)reservation;
- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 reservation:(id)a11 error:(id *)a12;
- (int)oflag;
- (int64_t)currentOffsetWithError:(id *)a3;
- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (timeval)accessTime;
- (timeval)modTime;
- (unint64_t)executeFileOperationFlags;
- (unsigned)gid;
- (unsigned)mode;
- (unsigned)omode;
- (unsigned)uid;
- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5;
- (void)dealloc;
- (void)executeAsyncOperation;
- (void)setAccessTime:(timeval)a3;
- (void)setErrorDelegate:(id)a3;
- (void)setExecuteFileOperationFlags:(unint64_t)a3;
- (void)setFileData:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setIncompleteExtractionAttribute;
- (void)setModTime:(timeval)a3;
- (void)setMode:(unsigned __int16)a3;
- (void)setSetOwnership:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation AsyncStreamingFileWriter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_errorDelegate);
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_reservation, 0);

  objc_storeStrong((id *)&self->_trackingGroup, 0);
}

- (void)setErrorDelegate:(id)a3
{
}

- (StreamingFileWriterErrorDelegate)errorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_errorDelegate);

  return (StreamingFileWriterErrorDelegate *)WeakRetained;
}

- (void)setExecuteFileOperationFlags:(unint64_t)a3
{
  self->_executeFileOperationFlags = a3;
}

- (unint64_t)executeFileOperationFlags
{
  return self->_executeFileOperationFlags;
}

- (void)setMode:(unsigned __int16)a3
{
  self->_mode = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setModTime:(timeval)a3
{
  self->_modTime = a3;
}

- (timeval)modTime
{
  p_modTime = &self->_modTime;
  __darwin_time_t tv_sec = self->_modTime.tv_sec;
  uint64_t v4 = *(void *)&p_modTime->tv_usec;
  result.tv_usec = v4;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setAccessTime:(timeval)a3
{
  self->_accessTime = a3;
}

- (timeval)accessTime
{
  p_accessTime = &self->_accessTime;
  __darwin_time_t tv_sec = self->_accessTime.tv_sec;
  uint64_t v4 = *(void *)&p_accessTime->tv_usec;
  result.tv_usec = v4;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setSetOwnership:(BOOL)a3
{
  self->_setOwnership = a3;
}

- (BOOL)setOwnership
{
  return self->_setOwnership;
}

- (void)setFileData:(id)a3
{
}

- (NSMutableData)fileData
{
  return self->_fileData;
}

- (BOOL)performCachedWrites
{
  return self->_performCachedWrites;
}

- (unsigned)omode
{
  return self->_omode;
}

- (int)oflag
{
  return self->_oflag;
}

- (StreamingFileWriterQueueReservation)reservation
{
  return self->_reservation;
}

- (OS_dispatch_group)trackingGroup
{
  return self->_trackingGroup;
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4.tv_usec;
  __darwin_time_t tv_sec = a4.tv_sec;
  -[AsyncStreamingFileWriter setAccessTime:](self, "setAccessTime:", a3.tv_sec, *(void *)&a3.tv_usec);
  -[AsyncStreamingFileWriter setModTime:](self, "setModTime:", tv_sec, v8);
  [(AsyncStreamingFileWriter *)self setMode:v7];
  [(AsyncStreamingFileWriter *)self setExecuteFileOperationFlags:[(AsyncStreamingFileWriter *)self executeFileOperationFlags] | 8];
  v11 = sub_100003830();
  if (os_signpost_enabled(v11))
  {
    v12 = [(StreamingFileWriter *)self path];
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    __int16 v20 = 2048;
    int64_t v21 = [(StreamingFileWriter *)self fileSize];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_ENQUEUE", "Enqueueing async operation for %@ size %lld", buf, 0x16u);
  }
  v13 = +[StreamingFileWriterQueue sharedInstance];
  id v17 = 0;
  unsigned __int8 v14 = [v13 insertAsyncFileOperation:self error:&v17];
  id v15 = v17;

  if (a6 && (v14 & 1) == 0) {
    *a6 = v15;
  }

  return v14;
}

- (BOOL)suspendWithError:(id *)a3
{
  [(AsyncStreamingFileWriter *)self setExecuteFileOperationFlags:[(AsyncStreamingFileWriter *)self executeFileOperationFlags] & 0xFFFFFFFFFFFFFFEFLL];

  return [(AsyncStreamingFileWriter *)self _executeWithError:a3];
}

- (void)executeAsyncOperation
{
  v3 = [(StreamingFileWriter *)self path];
  int64_t v4 = [(StreamingFileWriter *)self fileSize];
  v5 = sub_100003788();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v14 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Writing %@ asynchronously", buf, 0xCu);
  }

  v6 = sub_100003830();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v14 = v3;
    __int16 v15 = 2048;
    int64_t v16 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ASYNC_WRITE", "Start async operation for %@ size %lld", buf, 0x16u);
  }

  id v12 = 0;
  unsigned __int8 v7 = [(AsyncStreamingFileWriter *)self _executeWithError:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    v9 = sub_100003788();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v14 = v3;
      __int16 v15 = 2112;
      int64_t v16 = (int64_t)v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Async operation for %@ failed: %@", buf, 0x16u);
    }

    v10 = [(AsyncStreamingFileWriter *)self errorDelegate];
    [v10 streamingFileWriter:self didEncounterError:v8];
  }
  v11 = sub_100003830();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v14 = v3;
    __int16 v15 = 2048;
    int64_t v16 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ASYNC_WRITE", "End async operation for %@ size %lld", buf, 0x16u);
  }
}

- (BOOL)_executeWithError:(id *)a3
{
  unsigned __int8 v5 = [(AsyncStreamingFileWriter *)self executeFileOperationFlags];
  if (v5)
  {
    v6 = [(StreamingFileWriter *)self path];
    v22.receiver = self;
    v22.super_class = (Class)AsyncStreamingFileWriter;
    unsigned int v7 = [(StreamingFileWriter *)&v22 _openCurrentOutputFDForPath:v6 withOpenFlags:[(AsyncStreamingFileWriter *)self oflag] mode:[(AsyncStreamingFileWriter *)self omode] performCachedWrites:[(AsyncStreamingFileWriter *)self performCachedWrites] quarantineInfo:0 error:a3];

    if (!v7) {
      goto LABEL_12;
    }
  }
  if ((v5 & 2) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)AsyncStreamingFileWriter;
    [(StreamingFileWriter *)&v21 configureFileAndSetOwnership:[(AsyncStreamingFileWriter *)self setOwnership] toUID:[(AsyncStreamingFileWriter *)self uid] GID:[(AsyncStreamingFileWriter *)self gid]];
  }
  if ((v5 & 4) == 0) {
    goto LABEL_16;
  }
  id v8 = [(AsyncStreamingFileWriter *)self fileData];
  id v9 = [v8 bytes];
  v10 = [(AsyncStreamingFileWriter *)self fileData];
  v20.receiver = self;
  v20.super_class = (Class)AsyncStreamingFileWriter;
  LODWORD(v9) = -[StreamingFileWriter writeBuffer:length:error:](&v20, "writeBuffer:length:error:", v9, [v10 length], a3);

  if (!v9)
  {
LABEL_12:
    LOBYTE(v16) = 0;
  }
  else
  {
LABEL_16:
    if ((v5 & 8) == 0
      || (id v11 = [(AsyncStreamingFileWriter *)self accessTime],
          uint64_t v13 = v12,
          id v14 = [(AsyncStreamingFileWriter *)self modTime],
          v19.receiver = self,
          v19.super_class = (Class)AsyncStreamingFileWriter,
          BOOL v16 = -[StreamingFileWriter finalizeFileWithAccessTime:modTime:mode:error:](&v19, "finalizeFileWithAccessTime:modTime:mode:error:", v11, v13, v14, v15, [(AsyncStreamingFileWriter *)self mode], a3)))
    {
      if ((v5 & 0x10) != 0)
      {
        v18.receiver = self;
        v18.super_class = (Class)AsyncStreamingFileWriter;
        [(StreamingFileWriter *)&v18 closeCurrentOutputFD];
      }
      [(AsyncStreamingFileWriter *)self setExecuteFileOperationFlags:0];
      LOBYTE(v16) = 1;
    }
  }
  return v16;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  [(AsyncStreamingFileWriter *)self setSetOwnership:a3];
  [(AsyncStreamingFileWriter *)self setUid:v6];
  [(AsyncStreamingFileWriter *)self setGid:v5];
  unint64_t v8 = [(AsyncStreamingFileWriter *)self executeFileOperationFlags] | 2;

  [(AsyncStreamingFileWriter *)self setExecuteFileOperationFlags:v8];
}

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  unint64_t v8 = [(AsyncStreamingFileWriter *)self fileData];
  [v8 appendBytes:a3 length:a4];

  [(AsyncStreamingFileWriter *)self setExecuteFileOperationFlags:[(AsyncStreamingFileWriter *)self executeFileOperationFlags] | 4];
  return 1;
}

- (void)setIncompleteExtractionAttribute
{
  v3 = sub_100003788();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int64_t v4 = [(StreamingFileWriter *)self path];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Setting incomplete extraction attribute not available on this async file operation for %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = sub_100003788();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v11 = [(StreamingFileWriter *)self path];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Setting current output offset not available on async file operation for %@", buf, 0xCu);
  }
  unsigned int v7 = [(StreamingFileWriter *)self path];
  id v9 = sub_100004A7C((uint64_t)"-[AsyncStreamingFileWriter setCurrentOffset:error:]", 415, @"SZExtractorErrorDomain", 1, 0, 0, @"Setting current output offset not available on async file operation for %@", v8, (uint64_t)v7);

  if (a4) {
    *a4 = v9;
  }

  return 0;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  if ([(StreamingFileWriter *)self currentOutputFD] < 0)
  {
    uint64_t v6 = sub_100003788();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = [(StreamingFileWriter *)self path];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Getting current output offset not available on async file operation for %@", buf, 0xCu);
    }
    unsigned int v7 = [(StreamingFileWriter *)self path];
    id v9 = sub_100004A7C((uint64_t)"-[AsyncStreamingFileWriter currentOffsetWithError:]", 406, @"SZExtractorErrorDomain", 1, 0, 0, @"Getting current output offset not available on async file operation for %@", v8, (uint64_t)v7);

    if (a3) {
      *a3 = v9;
    }

    return -1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)AsyncStreamingFileWriter;
    return [(StreamingFileWriter *)&v11 currentOffsetWithError:a3];
  }
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  unsigned int v7 = sub_100003788();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = [(StreamingFileWriter *)self path];
    *(_DWORD *)buf = 138412290;
    id v14 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Read not available on async file operation for %@", buf, 0xCu);
  }
  uint64_t v8 = [(StreamingFileWriter *)self path];
  v10 = sub_100004A7C((uint64_t)"-[AsyncStreamingFileWriter readIntoBuffer:length:error:]", 391, @"SZExtractorErrorDomain", 1, 0, 0, @"Read not available on async file operation for %@", v9, (uint64_t)v8);

  if (a5) {
    *a5 = v10;
  }

  return -1;
}

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)AsyncStreamingFileWriter;
  [(StreamingFileWriter *)&v4 closeCurrentOutputFD];
  v3.receiver = self;
  v3.super_class = (Class)AsyncStreamingFileWriter;
  [(StreamingFileWriter *)&v3 dealloc];
}

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 reservation:(id)a11 error:(id *)a12
{
  BOOL v13 = a7;
  uint64_t v14 = a5;
  uint64_t v15 = *(void *)&a4;
  id v28 = a9;
  id v18 = a10;
  id v27 = a11;
  v29.receiver = self;
  v29.super_class = (Class)AsyncStreamingFileWriter;
  id v19 = a3;
  int64_t v20 = a8;
  objc_super v21 = [(StreamingFileWriter *)&v29 _initForWritingToPath:v19 withOpenFlags:v15 mode:v14 quarantineInfo:a6 performCachedWrites:v13 expectedSize:a8 error:a12];
  objc_super v22 = v21;
  if (v21)
  {
    objc_storeStrong(v21 + 7, a9);
    objc_storeStrong(v22 + 8, a11);
    *((_DWORD *)v22 + 10) = v15;
    *((_WORD *)v22 + 17) = v14;
    *((unsigned char *)v22 + 32) = v13;
    objc_storeWeak(v22 + 11, v18);
    v22[10] = (id)17;
    uint64_t v23 = +[NSMutableData dataWithCapacity:v20];
    id v24 = v22[9];
    v22[9] = (id)v23;
  }
  return v22;
}

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  return 1;
}

@end