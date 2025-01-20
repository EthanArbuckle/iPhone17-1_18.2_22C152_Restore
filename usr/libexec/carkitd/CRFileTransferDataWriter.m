@interface CRFileTransferDataWriter
- (BOOL)_openFile;
- (BOOL)hasAllChunks;
- (BOOL)saveData:(id)a3 forIndex:(id)a4;
- (CRFileTransferDataWriter)initWithFileURL:(id)a3 chunkCount:(id)a4;
- (NSFileHandle)fileHandle;
- (NSNumber)chunkCount;
- (NSNumber)currentChunkIndex;
- (NSURL)fileURL;
- (void)_closeFile;
- (void)setCurrentChunkIndex:(id)a3;
- (void)setFileHandle:(id)a3;
@end

@implementation CRFileTransferDataWriter

- (CRFileTransferDataWriter)initWithFileURL:(id)a3 chunkCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRFileTransferDataWriter;
  v9 = [(CRFileTransferDataWriter *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (v9
    && (objc_storeStrong((id *)&v9->_fileURL, a3),
        objc_storeStrong(p_isa + 2, a4),
        ![p_isa _openFile]))
  {
    v11 = 0;
  }
  else
  {
    v11 = p_isa;
  }

  return v11;
}

- (BOOL)_openFile
{
  v3 = [(CRFileTransferDataWriter *)self fileURL];
  v4 = [v3 path];
  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) != 0
    || (+[NSFileManager defaultManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 createFileAtPath:v4 contents:0 attributes:0],
        v7,
        (v8 & 1) != 0))
  {
    id v14 = 0;
    v9 = +[NSFileHandle fileHandleForWritingToURL:v3 error:&v14];
    v10 = v14;
    BOOL v11 = v9 != 0;
    if (v9)
    {
      [(CRFileTransferDataWriter *)self setFileHandle:v9];
    }
    else
    {
      v12 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10006EE88((uint64_t)v10, v12);
      }
    }
  }
  else
  {
    v10 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006EF00(v10);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_closeFile
{
  v3 = [(CRFileTransferDataWriter *)self fileHandle];
  [v3 closeFile];

  [(CRFileTransferDataWriter *)self setFileHandle:0];
}

- (BOOL)saveData:(id)a3 forIndex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(CRFileTransferDataWriter *)self fileHandle];
  if (v8)
  {
    [(CRFileTransferDataWriter *)self setCurrentChunkIndex:v7];
    [v8 seekToEndReturningOffset:0 error:0];
    id v17 = 0;
    unsigned __int8 v9 = [v8 writeData:v6 error:&v17];
    id v10 = v17;
    if (v9)
    {
      unsigned int v11 = [(CRFileTransferDataWriter *)self hasAllChunks];
      v12 = sub_10005C6FC(4uLL);
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (v13)
        {
          v15 = [(CRFileTransferDataWriter *)self chunkCount];
          *(_DWORD *)buf = 138412546;
          id v19 = v7;
          __int16 v20 = 2112;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "saved file chunk index %@ (total chunks: %@)", buf, 0x16u);
        }
        goto LABEL_13;
      }
      if (!v13)
      {
LABEL_9:

        [(CRFileTransferDataWriter *)self _closeFile];
LABEL_13:

        goto LABEL_14;
      }
      id v14 = [(CRFileTransferDataWriter *)self chunkCount];
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "saved final file chunk index %@ (total chunks: %@)", buf, 0x16u);
    }
    else
    {
      v12 = sub_10005C6FC(4uLL);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      id v14 = [(CRFileTransferDataWriter *)self chunkCount];
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to save file chunk %@ of %@: %@", buf, 0x20u);
    }

    goto LABEL_9;
  }
  unsigned __int8 v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)hasAllChunks
{
  v3 = [(CRFileTransferDataWriter *)self currentChunkIndex];

  if (!v3) {
    return 0;
  }
  v4 = [(CRFileTransferDataWriter *)self currentChunkIndex];
  v5 = (char *)[v4 unsignedIntegerValue];
  id v6 = [(CRFileTransferDataWriter *)self chunkCount];
  BOOL v7 = v5 == (char *)[v6 unsignedIntegerValue] - 1;

  return v7;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSNumber)chunkCount
{
  return self->_chunkCount;
}

- (NSNumber)currentChunkIndex
{
  return self->_currentChunkIndex;
}

- (void)setCurrentChunkIndex:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_currentChunkIndex, 0);
  objc_storeStrong((id *)&self->_chunkCount, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end