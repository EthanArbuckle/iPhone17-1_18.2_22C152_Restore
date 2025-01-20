@interface NPSBlobReaderWriter
- (BOOL)isFileGood;
- (NPSBlobReaderWriter)initWithPathToCreateBlobFile:(id)a3;
- (NPSBlobReaderWriter)initWithPathToLoadBlobFile:(id)a3;
- (id)readBlob;
- (void)close;
- (void)writeBlob:(id)a3;
@end

@implementation NPSBlobReaderWriter

- (NPSBlobReaderWriter)initWithPathToCreateBlobFile:(id)a3
{
  id v4 = a3;
  v5 = [(NPSBlobReaderWriter *)self init];
  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    v7 = [v4 path];
    [v6 createFileAtPath:v7 contents:0 attributes:0];

    id v15 = 0;
    uint64_t v8 = +[NSFileHandle fileHandleForWritingToURL:v4 error:&v15];
    id v9 = v15;
    fh = v5->_fh;
    v5->_fh = (NSFileHandle *)v8;

    if (!v9)
    {
      v12 = v5;
      goto LABEL_8;
    }
    v11 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
      sub_100028D30((uint64_t)v9, v11);
    }
  }
  else
  {
    id v9 = 0;
  }
  v12 = 0;
LABEL_8:
  v13 = v12;

  return v13;
}

- (NPSBlobReaderWriter)initWithPathToLoadBlobFile:(id)a3
{
  id v4 = a3;
  v5 = [(NPSBlobReaderWriter *)self init];
  if (v5)
  {
    id v13 = 0;
    uint64_t v6 = +[NSFileHandle fileHandleForReadingFromURL:v4 error:&v13];
    id v7 = v13;
    fh = v5->_fh;
    v5->_fh = (NSFileHandle *)v6;

    if (!v7)
    {
      v10 = v5;
      goto LABEL_8;
    }
    id v9 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
      sub_100028DA8((uint64_t)v7, v9);
    }
  }
  else
  {
    id v7 = 0;
  }
  v10 = 0;
LABEL_8:
  v11 = v10;

  return v11;
}

- (void)writeBlob:(id)a3
{
  id v4 = a3;
  unsigned int v9 = [v4 length];
  fh = self->_fh;
  uint64_t v6 = +[NSData dataWithBytes:&v9 length:4];
  [(NSFileHandle *)fh writeData:v6];

  id v7 = self->_fh;
  self->_offset += 4;
  [(NSFileHandle *)v7 writeData:v4];
  id v8 = [v4 length];

  self->_offset += (unint64_t)v8;
}

- (id)readBlob
{
  if (self->_done)
  {
    id v2 = 0;
  }
  else
  {
    id v4 = [(NSFileHandle *)self->_fh readDataOfLength:4];
    if ([v4 length] == (id)4
      && (self->_offset += (unint64_t)[v4 length],
          v5 = (char *)*(unsigned int *)[v4 bytes],
          (unint64_t)(v5 - 1048577) > 0xFFFFFFFFFFEFFFFFLL))
    {
      uint64_t v6 = [(NSFileHandle *)self->_fh readDataOfLength:v5];
      if ([v6 length] == v5)
      {
        self->_offset += (unint64_t)[v6 length];
        id v2 = v6;
      }
      else
      {
        id v2 = 0;
        self->_done = 1;
      }
    }
    else
    {
      id v2 = 0;
      self->_done = 1;
    }
  }
  return v2;
}

- (void)close
{
  [(NSFileHandle *)self->_fh closeFile];
  fh = self->_fh;
  self->_fh = 0;
}

- (BOOL)isFileGood
{
  unint64_t v3 = [(NSFileHandle *)self->_fh offsetInFile];
  unint64_t offset = self->_offset;
  v5 = nps_daemon_log;
  if (v3 == offset)
  {
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "File length is %ld bytes as expected", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
  {
    sub_100028E20(v5);
  }
  return v3 == offset;
}

- (void).cxx_destruct
{
}

@end