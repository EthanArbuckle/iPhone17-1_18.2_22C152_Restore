@interface RPFileTransferResumeStateItem
- (BOOL)outputFileItemUsable:(id)a3;
- (BOOL)sourceFileItemUsable:(id)a3;
- (RPFileTransferResumeStateItem)initWithFileTransferRequestDict:(id)a3;
- (RPFileTransferResumeStateItem)initWithStateDict:(id)a3;
- (id)error;
- (id)fileInfo;
- (id)fileName;
- (id)itemURL;
- (unint64_t)bytesWritten;
- (unint64_t)fileModTime;
- (unint64_t)fileModTimeNsec;
- (unint64_t)fileOffset;
- (unint64_t)fileSize;
- (void)dealloc;
- (void)setBytesWritten:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setFileModTime:(unint64_t)a3;
- (void)setFileModTimeNsec:(unint64_t)a3;
- (void)setFileName:(id)a3;
- (void)setFileOffset:(unint64_t)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setItemURL:(id)a3;
@end

@implementation RPFileTransferResumeStateItem

- (RPFileTransferResumeStateItem)initWithFileTransferRequestDict:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPFileTransferResumeStateItem;
  v5 = [(RPFileTransferResumeStateItem *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fileInfo = v5->_fileInfo;
    v5->_fileInfo = v6;

    CFStringGetTypeID();
    v8 = CFDictionaryGetTypedValue();
    if (v8) {
      [(RPFileTransferResumeStateItem *)v5 setFileName:v8];
    }
    [(RPFileTransferResumeStateItem *)v5 setFileSize:CFDictionaryGetInt64()];
    [(RPFileTransferResumeStateItem *)v5 setFileOffset:CFDictionaryGetInt64()];
    [(RPFileTransferResumeStateItem *)v5 setFileModTime:CFDictionaryGetInt64()];
    [(RPFileTransferResumeStateItem *)v5 setFileModTimeNsec:CFDictionaryGetInt64()];
    [(RPFileTransferResumeStateItem *)v5 setBytesWritten:0];
    [(RPFileTransferResumeStateItem *)v5 setError:0];
    v9 = v5;
  }
  return v5;
}

- (RPFileTransferResumeStateItem)initWithStateDict:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPFileTransferResumeStateItem;
  v6 = [(RPFileTransferResumeStateItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  fileInfo = self->_fileInfo;
  self->_fileInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)RPFileTransferResumeStateItem;
  [(RPFileTransferResumeStateItem *)&v4 dealloc];
}

- (id)fileInfo
{
  return self->_fileInfo;
}

- (id)itemURL
{
  return (id)[(NSMutableDictionary *)self->_fileInfo objectForKey:@"sourceFileURL"];
}

- (void)setItemURL:(id)a3
{
}

- (id)fileName
{
  return (id)[(NSMutableDictionary *)self->_fileInfo objectForKey:@"outputFileName"];
}

- (void)setFileName:(id)a3
{
}

- (unint64_t)fileSize
{
  v2 = [(NSMutableDictionary *)self->_fileInfo objectForKey:@"fileSize"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setFileSize:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)fileInfo setValue:v4 forKey:@"fileSize"];
}

- (unint64_t)fileOffset
{
  v2 = [(NSMutableDictionary *)self->_fileInfo objectForKey:@"fileOffset"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setFileOffset:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)fileInfo setValue:v4 forKey:@"fileOffset"];
}

- (unint64_t)fileModTime
{
  v2 = [(NSMutableDictionary *)self->_fileInfo objectForKey:@"modTime"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setFileModTime:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)fileInfo setValue:v4 forKey:@"modTime"];
}

- (unint64_t)fileModTimeNsec
{
  v2 = [(NSMutableDictionary *)self->_fileInfo objectForKey:@"modTimeNsec"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setFileModTimeNsec:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)fileInfo setValue:v4 forKey:@"modTimeNsec"];
}

- (unint64_t)bytesWritten
{
  v2 = [(NSMutableDictionary *)self->_fileInfo objectForKey:@"bytesWritten"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setBytesWritten:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)fileInfo setValue:v4 forKey:@"bytesWritten"];
}

- (id)error
{
  return (id)[(NSMutableDictionary *)self->_fileInfo objectForKey:@"error"];
}

- (void)setError:(id)a3
{
  fileInfo = self->_fileInfo;
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)fileInfo setValue:v4 forKey:@"error"];
}

- (BOOL)sourceFileItemUsable:(id)a3
{
  id v4 = a3;
  id v5 = [(RPFileTransferResumeStateItem *)self error];

  if (v5)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v4];

  if ((v7 & 1) == 0)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
LABEL_12:
    [v4 UTF8String];
    LogPrintF();
    goto LABEL_25;
  }
  memset(&v13, 0, sizeof(v13));
  id v8 = v4;
  if (stat((const char *)[v8 UTF8String], &v13))
  {
    if (gLogCategory_RPFileTransferSession > 30)
    {
LABEL_25:
      BOOL v9 = 0;
      goto LABEL_26;
    }
    if (gLogCategory_RPFileTransferSession == -1)
    {
      BOOL v9 = 0;
      if (!_LogCategory_Initialize()) {
        goto LABEL_26;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    __darwin_time_t tv_sec = v13.st_mtimespec.tv_sec;
    uint64_t tv_nsec = v13.st_mtimespec.tv_nsec;
    if (tv_sec == [(RPFileTransferResumeStateItem *)self fileModTime]
      && tv_nsec == [(RPFileTransferResumeStateItem *)self fileModTimeNsec])
    {
      if (gLogCategory_RPFileTransferSession > 30)
      {
        BOOL v9 = 1;
        goto LABEL_26;
      }
      if (gLogCategory_RPFileTransferSession == -1)
      {
        BOOL v9 = 1;
        if (!_LogCategory_Initialize()) {
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      if (gLogCategory_RPFileTransferSession > 30) {
        goto LABEL_25;
      }
      if (gLogCategory_RPFileTransferSession == -1)
      {
        BOOL v9 = 0;
        if (!_LogCategory_Initialize()) {
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }
  [v8 UTF8String];
  LogPrintF();
LABEL_26:

  return v9;
}

- (BOOL)outputFileItemUsable:(id)a3
{
  id v4 = a3;
  id v5 = [(RPFileTransferResumeStateItem *)self fileName];
  v6 = [v4 stringByAppendingPathComponent:v5];

  unint64_t v7 = [(RPFileTransferResumeStateItem *)self fileOffset];
  unint64_t v8 = [(RPFileTransferResumeStateItem *)self bytesWritten];
  BOOL v9 = [(RPFileTransferResumeStateItem *)self error];

  if (v9)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
    goto LABEL_4;
  }
  off_t v10 = v8 + v7;
  if (!(v8 + v7))
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
LABEL_4:
    [v6 UTF8String];
LABEL_5:
    LogPrintF();
LABEL_34:
    BOOL v14 = 0;
    goto LABEL_35;
  }
  objc_super v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = [v11 fileExistsAtPath:v6];

  if ((v12 & 1) == 0)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
    goto LABEL_4;
  }
  memset(&v16, 0, sizeof(v16));
  id v13 = v6;
  if (stat((const char *)[v13 UTF8String], &v16))
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
    goto LABEL_11;
  }
  if (v16.st_size < v10)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
LABEL_11:
    [v13 UTF8String];
    goto LABEL_5;
  }
  if (gLogCategory_RPFileTransferSession <= 30
    && (gLogCategory_RPFileTransferSession != -1 || _LogCategory_Initialize()))
  {
    [v13 UTF8String];
    LogPrintF();
  }
  BOOL v14 = 1;
LABEL_35:

  return v14;
}

- (void).cxx_destruct
{
}

@end