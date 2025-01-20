@interface NPSBackupReaderWriter
+ (BOOL)losslessFileCompressionFrom:(id)a3 to:(id)a4 shouldCompress:(BOOL)a5;
+ (id)tempFilePath;
- (BOOL)doneWriting;
- (BOOL)enumerateMessages:(id)a3;
- (NPSBackupReaderWriter)initWithPathToCreateBackup:(id)a3;
- (NPSBackupReaderWriter)initWithPathToLoadBackup:(id)a3;
- (NSURL)compressedPath;
- (void)writeMessage:(unint64_t)a3 data:(id)a4;
@end

@implementation NPSBackupReaderWriter

- (NPSBackupReaderWriter)initWithPathToCreateBackup:(id)a3
{
  id v4 = a3;
  v5 = [(NPSBackupReaderWriter *)self init];
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      v6 = [(id)objc_opt_class() tempFilePath];
    }
    compressedPath = v5->_compressedPath;
    v5->_compressedPath = v6;

    uint64_t v8 = [(id)objc_opt_class() tempFilePath];
    uncompressedPath = v5->_uncompressedPath;
    v5->_uncompressedPath = (NSURL *)v8;

    v10 = [[NPSBlobReaderWriter alloc] initWithPathToCreateBlobFile:v5->_uncompressedPath];
    fh = v5->_fh;
    v5->_fh = v10;
  }
  if (v5->_fh) {
    v12 = v5;
  }
  else {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (NPSBackupReaderWriter)initWithPathToLoadBackup:(id)a3
{
  id v5 = a3;
  v6 = [(NPSBackupReaderWriter *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_compressedPath, a3);
    uint64_t v8 = [(id)objc_opt_class() tempFilePath];
    uncompressedPath = v7->_uncompressedPath;
    v7->_uncompressedPath = (NSURL *)v8;

    if ([(id)objc_opt_class() losslessFileCompressionFrom:v7->_compressedPath to:v7->_uncompressedPath shouldCompress:0])
    {
      v10 = [[NPSBlobReaderWriter alloc] initWithPathToLoadBlobFile:v7->_uncompressedPath];
      fh = v7->_fh;
      v7->_fh = v10;
    }
  }
  if (v7->_fh) {
    v12 = v7;
  }
  else {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

+ (id)tempFilePath
{
  v2 = NSTemporaryDirectory();
  v3 = objc_opt_new();
  id v4 = [v3 UUIDString];
  id v5 = [v2 stringByAppendingString:v4];
  v6 = +[NSURL fileURLWithPath:v5];

  return v6;
}

+ (BOOL)losslessFileCompressionFrom:(id)a3 to:(id)a4 shouldCompress:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v29 = 0;
  v9 = +[NSFileHandle fileHandleForReadingFromURL:v7 error:&v29];
  id v10 = v29;
  if (!v10)
  {
    v13 = +[NSFileManager defaultManager];
    v14 = [v8 path];
    [v13 createFileAtPath:v14 contents:0 attributes:0];

    id v28 = 0;
    v15 = +[NSFileHandle fileHandleForWritingToURL:v8 error:&v28];
    id v11 = v28;
    if (v11)
    {
      [v9 closeFile];
    }
    else
    {
      memset(&stream, 0, sizeof(stream));
      if (compression_stream_init(&stream, (compression_stream_operation)!v5, COMPRESSION_ZLIB) == COMPRESSION_STATUS_OK)
      {
        id v26 = v8;
        id v16 = +[NSMutableData dataWithLength:0x10000];
        stream.dst_ptr = (uint8_t *)[v16 bytes];
        stream.dst_size = (size_t)[v16 length];
        do
        {
          v18 = [v9 readDataOfLength:0x10000];
          BOOL v19 = [v18 length] == 0;
          id v20 = v18;
          stream.src_ptr = (const uint8_t *)[v20 bytes];
          stream.src_size = (size_t)[v20 length];
          do
          {
            compression_status v21 = compression_stream_process(&stream, v19);
            v22 = (char *)[v16 length];
            v23 = objc_msgSend(v16, "subdataWithRange:", 0, &v22[-stream.dst_size]);
            [v15 writeData:v23];

            id v24 = v16;
            stream.dst_ptr = (uint8_t *)[v24 bytes];
            stream.dst_size = (size_t)[v24 length];
          }
          while (stream.src_size && v21 == COMPRESSION_STATUS_OK);
        }
        while (v21 == COMPRESSION_STATUS_OK);
        [v9 closeFile];
        [v15 closeFile];

        id v8 = v26;
        if (v21 == COMPRESSION_STATUS_END)
        {
          BOOL v12 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
    }
    BOOL v12 = 0;
    goto LABEL_14;
  }
  id v11 = v10;
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (void)writeMessage:(unint64_t)a3 data:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v10[0] = 67109376;
    v10[1] = v4;
    __int16 v11 = 1024;
    unsigned int v12 = [v6 length];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NPSBackupReaderWriter writing type %d length %u", (uint8_t *)v10, 0xEu);
  }
  LOBYTE(v10[0]) = v4;
  v9 = +[NSMutableData dataWithBytes:v10 length:1];
  [v9 appendData:v6];
  [(NPSBlobReaderWriter *)self->_fh writeBlob:v9];
}

- (BOOL)enumerateMessages:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  BOOL v5 = [(NPSBlobReaderWriter *)self->_fh readBlob];
  if ((unint64_t)[v5 length] >= 2)
  {
    do
    {
      id v6 = v5;
      uint64_t v7 = *(unsigned __int8 *)[v6 bytes];
      id v8 = (void *)nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        unsigned int v10 = [v6 length];
        *(_DWORD *)buf = 67109376;
        int v18 = v7;
        __int16 v19 = 1024;
        unsigned int v20 = v10 - 1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NPSBackupReaderWriter reading type %d length %u", buf, 0xEu);
      }
      unsigned int v12 = objc_msgSend(v6, "subdataWithRange:", 1, (char *)objc_msgSend(v6, "length") - 1);
      v4[2](v4, v7, v12);

      BOOL v5 = [(NPSBlobReaderWriter *)self->_fh readBlob];
    }
    while ((unint64_t)[v5 length] > 1);
  }

  BOOL v13 = [(NPSBlobReaderWriter *)self->_fh isFileGood];
  [(NPSBlobReaderWriter *)self->_fh close];
  fh = self->_fh;
  self->_fh = 0;

  v15 = +[NSFileManager defaultManager];
  [v15 removeItemAtURL:self->_uncompressedPath error:0];

  return v13;
}

- (BOOL)doneWriting
{
  unsigned int v3 = [(NPSBlobReaderWriter *)self->_fh isFileGood];
  [(NPSBlobReaderWriter *)self->_fh close];
  fh = self->_fh;
  self->_fh = 0;

  if (v3
    && (p_compressedPath = &self->_uncompressedPath,
        [(id)objc_opt_class() losslessFileCompressionFrom:self->_uncompressedPath to:self->_compressedPath shouldCompress:1]))
  {
    id v6 = +[NSFileManager defaultManager];
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[NSFileManager defaultManager];
    [v8 removeItemAtURL:self->_uncompressedPath error:0];

    id v6 = +[NSFileManager defaultManager];
    BOOL v7 = 0;
    p_compressedPath = &self->_compressedPath;
  }
  [v6 removeItemAtURL:*p_compressedPath error:0];

  return v7;
}

- (NSURL)compressedPath
{
  return self->_compressedPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedPath, 0);
  objc_storeStrong((id *)&self->_uncompressedPath, 0);
  objc_storeStrong((id *)&self->_fh, 0);
}

@end