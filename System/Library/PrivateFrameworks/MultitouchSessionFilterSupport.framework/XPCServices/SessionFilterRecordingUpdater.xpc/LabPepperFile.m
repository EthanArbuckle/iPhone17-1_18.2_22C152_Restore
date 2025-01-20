@interface LabPepperFile
- (LabPepperFile)initWithLabPepperURL:(id)a3;
- (NSURL)url;
- (OS_os_log)log;
- (id)nextEntry;
- (unint64_t)fileOffset;
- (unsigned)lpVersion;
- (void)nextEntry;
- (void)resetOffset;
- (void)setFileOffset:(unint64_t)a3;
@end

@implementation LabPepperFile

- (LabPepperFile)initWithLabPepperURL:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LabPepperFile;
  v5 = [(LabPepperFile *)&v20 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;

    uint64_t v8 = MTLoggingContinuousRecordingFilterManager();
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    id v19 = 0;
    v10 = +[NSFileHandle fileHandleForReadingFromURL:v4 error:&v19];
    id v11 = v19;
    if (v11)
    {
      id v12 = v11;
      v13 = 0;
    }
    else
    {
      v14 = [v10 readDataOfLength:2];
      if ([v14 length] == (id)2)
      {
        v5->_lpVersion = *(_WORD *)[v14 bytes];
        v5->_fileOffset = 2;
        id v18 = 0;
        unsigned __int8 v15 = [v10 closeAndReturnError:&v18];
        id v12 = v18;
        if (v15)
        {
          v13 = v5;
        }
        else
        {
          v16 = [(LabPepperFile *)v5 log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[LabPepperFile initWithLabPepperURL:]();
          }

          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
        id v12 = 0;
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)resetOffset
{
}

- (id)nextEntry
{
  v3 = [(LabPepperFile *)self url];
  id v22 = 0;
  id v4 = +[NSFileHandle fileHandleForReadingFromURL:v3 error:&v22];
  id v5 = v22;

  if (v4)
  {
    id v21 = 0;
    unsigned __int8 v6 = objc_msgSend(v4, "seekToOffset:error:", -[LabPepperFile fileOffset](self, "fileOffset"), &v21);
    id v7 = v21;

    if (v6)
    {
      uint64_t v8 = [v4 readDataOfLength:4];
      if ([v8 length] == (id)4)
      {
        v9 = (unsigned __int16 *)[v8 bytes];
        uint64_t v10 = *v9;
        id v11 = (char *)v9[1];
        [(LabPepperFile *)self setFileOffset:(char *)[(LabPepperFile *)self fileOffset] + 4];
        objc_msgSend(v4, "seekToFileOffset:", -[LabPepperFile fileOffset](self, "fileOffset"));
        id v12 = [v4 readDataOfLength:v11];
        if ([v12 length] == v11)
        {
          v13 = [[LabPepperEntry alloc] initWithLPDataSource:v10 data:v12];
          [(LabPepperFile *)self setFileOffset:&v11[[(LabPepperFile *)self fileOffset]]];
          id v5 = v7;
        }
        else
        {
          id v19 = 0;
          unsigned __int8 v15 = [v4 closeAndReturnError:&v19];
          id v5 = v19;

          if ((v15 & 1) == 0)
          {
            v16 = [(LabPepperFile *)self log];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[LabPepperFile nextEntry]();
            }
          }
          v13 = 0;
        }
      }
      else
      {
        id v20 = 0;
        [v4 closeAndReturnError:&v20];
        id v5 = v20;
        v13 = 0;
        id v12 = v7;
      }
    }
    else
    {
      uint64_t v8 = [(LabPepperFile *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = [(LabPepperFile *)self fileOffset];
        *(_DWORD *)buf = 134218498;
        unint64_t v24 = v18;
        __int16 v25 = 2112;
        v26 = v4;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error seeking to offset %lu for file %@ when getting next entry: %@", buf, 0x20u);
      }
      v13 = 0;
      id v5 = v7;
    }
  }
  else
  {
    uint64_t v8 = [(LabPepperFile *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = [(LabPepperFile *)self url];
      [(LabPepperFile *)v14 nextEntry];
    }
    v13 = 0;
  }

  return v13;
}

- (unsigned)lpVersion
{
  return self->_lpVersion;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)fileOffset
{
  return self->_fileOffset;
}

- (void)setFileOffset:(unint64_t)a3
{
  self->_fileOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithLabPepperURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Error closing file %@ after getting version: %@");
}

- (void)nextEntry
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Error closing file %@ after getting next LP entry: %@");
}

@end