@interface IMAPServiceBodyLoadContext
- (BOOL)loadHasStarted;
- (BOOL)mimePartFinishedLoading;
- (NSMutableData)bodyData;
- (id)parseWithDelegate:(id)a3;
- (unsigned)currentOffset;
- (unsigned)expectedLength;
- (void)_postNotification:(id)a3 withLengthNumber:(id)a4;
- (void)cleanUpErroredFile;
- (void)dealloc;
- (void)setBodyData:(id)a3;
- (void)setExpectedLength:(unsigned int)a3;
- (void)setMimePartFinishedLoading:(BOOL)a3;
- (void)writeDataIfNeeded;
@end

@implementation IMAPServiceBodyLoadContext

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMAPServiceBodyLoadContext;
  [(IMAPServiceBodyLoadContext *)&v2 dealloc];
}

- (void)cleanUpErroredFile
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    int recordLibraryId = self->_recordLibraryId;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    v6 = WeakRetained;
    if (recordLibraryId == 0x7FFFFFFF)
    {
      v7 = [WeakRetained accountDir];
      v9 = sub_10006D9E8(v7, v8);
      v10 = [v9 path];
    }
    else
    {
      v11 = [WeakRetained getAccountStore];
      id v12 = sub_100079A6C(v11, self->_recordLibraryId);

      if (!v12)
      {
LABEL_8:
        self->_int fd = -1;
        return;
      }
      id v13 = objc_loadWeakRetained((id *)&self->_service);
      v14 = [v13 getAccountStore];
      v10 = (void *)sub_10007966C(v14, (uint64_t)v12);

      CFRelease(v12);
    }
    if (v10)
    {
      id v15 = v10;
      unlink((const char *)[v15 fileSystemRepresentation]);
    }
    goto LABEL_8;
  }
}

- (void)writeDataIfNeeded
{
  if ((self->_fd & 0x80000000) == 0)
  {
    v4 = [(MFProgressiveMimeParser *)self->_parser currentPart];
    v5 = v4;
    if (!v4 || (v6 = (char *)[v4 range], unint64_t v8 = v7, lastOffset = self->_lastOffset, v7 <= lastOffset))
    {
LABEL_24:

      goto LABEL_25;
    }
    v10 = v6;
    if (*((unsigned char *)self + 64))
    {
      unint64_t v27 = v7 - lastOffset;
      id v15 = [(MFProgressiveMimeParser *)self->_parser data];
      v16 = objc_msgSend(v15, "mf_decodeBase64InRange:", &v26);

      if (v27)
      {
        id v17 = v16;
        id v12 = (char *)[v17 bytes];
        int v14 = v27;
        id v13 = (char *)[v17 length];
      }
      else
      {
        id v12 = 0;
        id v13 = 0;
        int v14 = 0;
      }

      if (!v13) {
        goto LABEL_12;
      }
    }
    else
    {
      id v11 = [(MFProgressiveMimeParser *)self->_parser data];
      id v12 = &v10[(void)[v11 bytes] + self->_lastOffset];

      id v13 = (char *)(v8 - self->_lastOffset);
      int v14 = (int)v13;
      if (!v13)
      {
LABEL_12:
        [(IMAPServiceBodyLoadContext *)self mf_lock];
        if (v13)
        {
          uint64_t lengthWritten = self->_lengthWritten;
          if ((unint64_t)&v13[lengthWritten] >= 0x400)
          {
            if (lengthWritten >= 0x400) {
              v19 = &off_1000C2320;
            }
            else {
              v19 = &off_1000C2318;
            }
            v20 = *v19;
            if (self->_notificationDict)
            {
              id v21 = [objc_alloc((Class)NSNumber) initWithUnsignedLong:&v13[self->_lengthWritten]];
              [(IMAPServiceBodyLoadContext *)self mf_performOnewaySelectorInMainThread:"_postNotification:withLengthNumber:" withObject:v20 withObject:v21];
            }
          }
        }
        unsigned int v22 = self->_lengthWritten + v13;
        self->_lastOffset += v14;
        self->_uint64_t lengthWritten = v22;
        [(IMAPServiceBodyLoadContext *)self mf_unlock];
        goto LABEL_24;
      }
    }
    if (write(self->_fd, v12, (size_t)v13) < 0)
    {
      [(IMAPServiceBodyLoadContext *)self cleanUpErroredFile];
      v23 = +[MFActivityMonitor currentTracebleMonitor];
      v24 = [v23 error];

      if (!v24)
      {
        v25 = +[NSError errorWithDomain:kVVErrorDomain code:1010 localizedDescription:@"Unable to write to file."];
        [v23 setError:v25];
      }
      goto LABEL_24;
    }
    goto LABEL_12;
  }
LABEL_25:
}

- (void)_postNotification:(id)a3 withLengthNumber:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_notificationDict setObject:v6 forKey:@"VVCurrentDataLength"];
  unint64_t v7 = +[NSNotificationCenter defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  [v7 postNotificationName:v9 object:WeakRetained userInfo:self->_notificationDict];
}

- (BOOL)loadHasStarted
{
  [(IMAPServiceBodyLoadContext *)self mf_lock];
  BOOL v3 = self->_lengthWritten > 0x400;
  [(IMAPServiceBodyLoadContext *)self mf_unlock];
  return v3;
}

- (void)setExpectedLength:(unsigned int)a3
{
  [(IMAPServiceBodyLoadContext *)self mf_lock];
  self->_expectedLength = a3;
  [(IMAPServiceBodyLoadContext *)self mf_unlock];
}

- (unsigned)expectedLength
{
  [(IMAPServiceBodyLoadContext *)self mf_lock];
  unsigned int expectedLength = self->_expectedLength;
  [(IMAPServiceBodyLoadContext *)self mf_unlock];
  return expectedLength;
}

- (unsigned)currentOffset
{
  [(IMAPServiceBodyLoadContext *)self mf_lock];
  unsigned int lengthWritten = self->_lengthWritten;
  [(IMAPServiceBodyLoadContext *)self mf_unlock];
  return lengthWritten;
}

- (id)parseWithDelegate:(id)a3
{
  id v4 = a3;
  if (!self->_parser && self->_headersDict && [(NSMutableData *)self->_bodyData length])
  {
    id v7 = objc_alloc((Class)MFProgressiveMimeParser);
    bodyData = self->_bodyData;
    headersDict = self->_headersDict;
    v10 = +[IMAPServiceBodyLoadMonitor _headersToPreserve];
    id v11 = (MFProgressiveMimeParser *)[v7 initWithBodyData:bodyData topLevelHeaders:headersDict headersToPreserve:v10];
    parser = self->_parser;
    self->_parser = v11;

    [(MFProgressiveMimeParser *)self->_parser setDelegate:v4];
    [(MFProgressiveMimeParser *)self->_parser setContext:self];
    [(MFProgressiveMimeParser *)self->_parser start];
  }
  v5 = self->_parser;

  return v5;
}

- (NSMutableData)bodyData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBodyData:(id)a3
{
}

- (BOOL)mimePartFinishedLoading
{
  return self->_mimePartFinishedLoading;
}

- (void)setMimePartFinishedLoading:(BOOL)a3
{
  self->_mimePartFinishedLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_notificationDict, 0);
  objc_storeStrong((id *)&self->_headersDict, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

@end