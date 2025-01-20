@interface UASharedPasteboardOutputStreamManager
- (BOOL)infoSent;
- (NSData)currentSendData;
- (NSFileHandle)dataFile;
- (NSInputStream)inStream;
- (NSOutputStream)stream;
- (NSSet)typesToSend;
- (NSTimer)backupTimer;
- (UASharedPasteboardInfoWrapper)pbwrapper;
- (UASharedPasteboardOutputStreamManager)initWithOutputStream:(id)a3 inputStream:(id)a4 pasteboard:(id)a5;
- (id)headerForData:(id)a3;
- (id)sendErrorHandler;
- (int64_t)byteIndex;
- (unint64_t)dataSent;
- (void)sendTypes:(id)a3 completionHandler:(id)a4;
- (void)setBackupTimer:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setCurrentSendData:(id)a3;
- (void)setDataFile:(id)a3;
- (void)setDataSent:(unint64_t)a3;
- (void)setInStream:(id)a3;
- (void)setInfoSent:(BOOL *)a3;
- (void)setPbwrapper:(id)a3;
- (void)setSendErrorHandler:(id)a3;
- (void)setStream:(id)a3;
- (void)setTypesToSend:(id)a3;
- (void)shutdownStream;
- (void)shutdownTimerFired:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation UASharedPasteboardOutputStreamManager

- (UASharedPasteboardOutputStreamManager)initWithOutputStream:(id)a3 inputStream:(id)a4 pasteboard:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UASharedPasteboardOutputStreamManager;
  v11 = [(UASharedPasteboardOutputStreamManager *)&v19 init];
  v12 = v11;
  if (v11)
  {
    [(UASharedPasteboardOutputStreamManager *)v11 setStream:v8];
    [(UASharedPasteboardOutputStreamManager *)v12 setInStream:v9];
    [(UASharedPasteboardOutputStreamManager *)v12 setPbwrapper:v10];
    v13 = [(UASharedPasteboardOutputStreamManager *)v12 pbwrapper];
    v14 = [v13 pbinfo];
    v15 = [v14 dataFile];
    [(UASharedPasteboardOutputStreamManager *)v12 setDataFile:v15];

    v16 = [(UASharedPasteboardOutputStreamManager *)v12 pbwrapper];
    v17 = [v16 pbinfo];
    [v17 setDataFile:0];
  }
  return v12;
}

- (void)sendTypes:(id)a3 completionHandler:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  [(UASharedPasteboardOutputStreamManager *)self setDataSent:0];
  [(UASharedPasteboardOutputStreamManager *)self setTypesToSend:v6];
  [(UASharedPasteboardOutputStreamManager *)self setSendErrorHandler:v7];

  id v8 = [(UASharedPasteboardOutputStreamManager *)self pbwrapper];
  id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

  id v10 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(UASharedPasteboardOutputStreamManager *)self pbwrapper];
    int v23 = 138412290;
    CFStringRef v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Sending pboard info: %@", (uint8_t *)&v23, 0xCu);
  }
  v12 = [(UASharedPasteboardOutputStreamManager *)self headerForData:v9];
  [(UASharedPasteboardOutputStreamManager *)self setCurrentSendData:v12];

  v13 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    CFStringRef v14 = @"All";
    if (v6) {
      CFStringRef v14 = v6;
    }
    int v23 = 138412290;
    CFStringRef v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[OUT STREAM] Starting to send types: %@", (uint8_t *)&v23, 0xCu);
  }

  v15 = [(UASharedPasteboardOutputStreamManager *)self stream];
  [v15 setDelegate:self];

  v16 = [(UASharedPasteboardOutputStreamManager *)self inStream];
  [v16 setDelegate:self];

  v17 = [(UASharedPasteboardOutputStreamManager *)self stream];
  v18 = +[NSRunLoop mainRunLoop];
  [v17 scheduleInRunLoop:v18 forMode:NSRunLoopCommonModes];

  objc_super v19 = [(UASharedPasteboardOutputStreamManager *)self stream];
  [v19 open];

  v20 = [(UASharedPasteboardOutputStreamManager *)self inStream];
  v21 = +[NSRunLoop mainRunLoop];
  [v20 scheduleInRunLoop:v21 forMode:NSRunLoopCommonModes];

  v22 = [(UASharedPasteboardOutputStreamManager *)self inStream];
  [v22 open];
}

- (id)headerForData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableData);
  unsigned int v6 = [v3 length];
  [v4 appendBytes:"===" length:3];
  [v4 appendBytes:&v6 length:4];
  [v4 appendBytes:"===" length:3];
  [v4 appendData:v3];

  [v4 appendBytes:"===" length:3];

  return v4;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(UASharedPasteboardOutputStreamManager *)self stream];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (a4 == 8)
    {
      v39 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v47 = 8;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "[OUT STREAM] Unexpected event code: %lu", buf, 0xCu);
      }

      [(UASharedPasteboardOutputStreamManager *)self shutdownStream];
      v35 = [(UASharedPasteboardOutputStreamManager *)self sendErrorHandler];
      unint64_t v40 = [(UASharedPasteboardOutputStreamManager *)self dataSent];
      uint64_t v41 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-127 userInfo:0];
LABEL_25:
      v38 = (void (**)(void, void, void))v41;
      v35[2](v35, v40, v41);
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
    if (a4 == 4)
    {
      uint64_t v9 = [(UASharedPasteboardOutputStreamManager *)self currentSendData];
      if (!v9
        || (id v10 = (void *)v9,
            unint64_t v11 = [(UASharedPasteboardOutputStreamManager *)self byteIndex],
            [(UASharedPasteboardOutputStreamManager *)self currentSendData],
            v12 = objc_claimAutoreleasedReturnValue(),
            id v13 = [v12 length],
            v12,
            v10,
            v11 >= (unint64_t)v13))
      {
        CFStringRef v14 = [(UASharedPasteboardOutputStreamManager *)self dataFile];
        v15 = [v14 readDataOfLength:0x10000];
        [(UASharedPasteboardOutputStreamManager *)self setCurrentSendData:v15];

        [(UASharedPasteboardOutputStreamManager *)self setByteIndex:0];
        v16 = [(UASharedPasteboardOutputStreamManager *)self currentSendData];
        id v17 = [v16 length];

        if (!v17)
        {
          v42 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Done sending pasteboard, waiting for end of stream", buf, 2u);
          }

          v43 = +[NSTimer timerWithTimeInterval:self target:"shutdownTimerFired:" selector:0 userInfo:0 repeats:30.0];
          [(UASharedPasteboardOutputStreamManager *)self setBackupTimer:v43];

          v35 = +[NSRunLoop mainRunLoop];
          v44 = [(UASharedPasteboardOutputStreamManager *)self backupTimer];
          [v35 addTimer:v44 forMode:NSRunLoopCommonModes];

          goto LABEL_27;
        }
      }
      v18 = [(UASharedPasteboardOutputStreamManager *)self currentSendData];
      id v19 = [v18 length];

      if (v19)
      {
        id v20 = [(UASharedPasteboardOutputStreamManager *)self currentSendData];
        id v21 = [v20 bytes];

        v22 = (char *)[(UASharedPasteboardOutputStreamManager *)self byteIndex] + (void)v21;
        int v23 = [(UASharedPasteboardOutputStreamManager *)self currentSendData];
        id v24 = [v23 length];

        int64_t v25 = [(UASharedPasteboardOutputStreamManager *)self byteIndex];
        if ((uint64_t)v24 - v25 >= 0x10000) {
          uint64_t v26 = 0x10000;
        }
        else {
          uint64_t v26 = (uint64_t)v24 - v25;
        }
        v27 = (char *)[v6 write:v22 maxLength:v26];
        if (v27 != (char *)-1)
        {
          v28 = v27;
          [(UASharedPasteboardOutputStreamManager *)self setDataSent:&v27[[(UASharedPasteboardOutputStreamManager *)self dataSent]]];
          [(UASharedPasteboardOutputStreamManager *)self setByteIndex:&v28[[(UASharedPasteboardOutputStreamManager *)self byteIndex]]];
          goto LABEL_28;
        }
        [(UASharedPasteboardOutputStreamManager *)self shutdownStream];
        v35 = [(UASharedPasteboardOutputStreamManager *)self sendErrorHandler];
        unint64_t v40 = [(UASharedPasteboardOutputStreamManager *)self dataSent];
        uint64_t v41 = [v6 streamError];
        goto LABEL_25;
      }
    }
  }
  else
  {
    v29 = [(UASharedPasteboardOutputStreamManager *)self inStream];
    unsigned int v30 = [v6 isEqual:v29];

    if (v30 && (a4 == 16 || a4 == 2))
    {
      unint64_t v31 = (unint64_t)[v6 read:v45 maxLength:10];
      if ((v31 & 0x8000000000000000) == 0)
      {
        unint64_t v32 = v31;
        id v33 = objc_alloc((Class)NSString);
        v34 = +[NSData dataWithBytes:v45 length:v32];
        v35 = (void (**)(id, unint64_t, uint64_t))[v33 initWithData:v34 encoding:4];

        v36 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v47 = (uint64_t)v35;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Got data back: %@", buf, 0xCu);
        }

        v37 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Stream End Encountered, shutting down", buf, 2u);
        }

        [(UASharedPasteboardOutputStreamManager *)self shutdownStream];
        v38 = [(UASharedPasteboardOutputStreamManager *)self sendErrorHandler];
        v38[2](v38, [(UASharedPasteboardOutputStreamManager *)self dataSent], 0);
        goto LABEL_26;
      }
    }
  }
LABEL_28:
}

- (void)shutdownTimerFired:(id)a3
{
  id v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Stream Timer Fired, shutting down", v6, 2u);
  }

  [(UASharedPasteboardOutputStreamManager *)self shutdownStream];
  v5 = [(UASharedPasteboardOutputStreamManager *)self sendErrorHandler];
  v5[2](v5, [(UASharedPasteboardOutputStreamManager *)self dataSent], 0);
}

- (void)shutdownStream
{
  id v3 = [(UASharedPasteboardOutputStreamManager *)self backupTimer];
  [v3 invalidate];

  id v4 = [(UASharedPasteboardOutputStreamManager *)self stream];
  [v4 close];

  v5 = [(UASharedPasteboardOutputStreamManager *)self stream];
  id v6 = +[NSRunLoop mainRunLoop];
  [v5 removeFromRunLoop:v6 forMode:NSRunLoopCommonModes];

  id v7 = [(UASharedPasteboardOutputStreamManager *)self inStream];
  [v7 close];

  id v9 = [(UASharedPasteboardOutputStreamManager *)self inStream];
  unsigned int v8 = +[NSRunLoop mainRunLoop];
  [v9 removeFromRunLoop:v8 forMode:NSRunLoopCommonModes];
}

- (NSOutputStream)stream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStream:(id)a3
{
}

- (NSInputStream)inStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInStream:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)pbwrapper
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPbwrapper:(id)a3
{
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataFile:(id)a3
{
}

- (NSSet)typesToSend
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTypesToSend:(id)a3
{
}

- (id)sendErrorHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSendErrorHandler:(id)a3
{
}

- (NSData)currentSendData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentSendData:(id)a3
{
}

- (int64_t)byteIndex
{
  return self->_byteIndex;
}

- (void)setByteIndex:(int64_t)a3
{
  self->_byteIndex = a3;
}

- (BOOL)infoSent
{
  return self->_infoSent;
}

- (void)setInfoSent:(BOOL *)a3
{
  self->_infoSent = a3;
}

- (unint64_t)dataSent
{
  return self->_dataSent;
}

- (void)setDataSent:(unint64_t)a3
{
  self->_dataSent = a3;
}

- (NSTimer)backupTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBackupTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupTimer, 0);
  objc_storeStrong((id *)&self->_currentSendData, 0);
  objc_storeStrong(&self->_sendErrorHandler, 0);
  objc_storeStrong((id *)&self->_typesToSend, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_pbwrapper, 0);
  objc_storeStrong((id *)&self->_inStream, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

@end