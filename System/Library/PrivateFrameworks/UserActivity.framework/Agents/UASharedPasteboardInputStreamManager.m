@interface UASharedPasteboardInputStreamManager
- (BOOL)receivedDelem;
- (NSFileHandle)file;
- (NSInputStream)stream;
- (NSMutableData)receivedData;
- (NSOutputStream)outStream;
- (NSProgress)progress;
- (NSSet)typesToReceive;
- (UASharedPasteboardInfoWrapper)pbwrapper;
- (UASharedPasteboardInputStreamManager)initWithInputStream:(id)a3 outputStream:(id)a4 dataFile:(id)a5;
- (id)handler;
- (int64_t)bytesReceived;
- (int64_t)expectedLength;
- (unint64_t)absoluteToNSec:(unint64_t)a3;
- (unint64_t)state;
- (unint64_t)streamStartTime;
- (unint64_t)timeRemaining;
- (void)cancel;
- (void)receiveTypes:(id)a3 withProgress:(id)a4 completionHandler:(id)a5;
- (void)setBytesReceived:(int64_t)a3;
- (void)setExpectedLength:(int64_t)a3;
- (void)setFile:(id)a3;
- (void)setHandler:(id)a3;
- (void)setOutStream:(id)a3;
- (void)setPbwrapper:(id)a3;
- (void)setProgress:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setReceivedDelem:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStream:(id)a3;
- (void)setStreamStartTime:(unint64_t)a3;
- (void)setTimeRemaining:(unint64_t)a3;
- (void)setTypesToReceive:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)streamDoneWithInfo:(id)a3 error:(id)a4;
@end

@implementation UASharedPasteboardInputStreamManager

- (UASharedPasteboardInputStreamManager)initWithInputStream:(id)a3 outputStream:(id)a4 dataFile:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UASharedPasteboardInputStreamManager;
  v11 = [(UASharedPasteboardInputStreamManager *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(UASharedPasteboardInputStreamManager *)v11 setStream:v8];
    [(UASharedPasteboardInputStreamManager *)v12 setOutStream:v9];
    [(UASharedPasteboardInputStreamManager *)v12 setFile:v10];
  }

  return v12;
}

- (void)receiveTypes:(id)a3 withProgress:(id)a4 completionHandler:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  [(UASharedPasteboardInputStreamManager *)self setProgress:a4];
  [(UASharedPasteboardInputStreamManager *)self setTypesToReceive:v8];
  [(UASharedPasteboardInputStreamManager *)self setHandler:v9];

  [(UASharedPasteboardInputStreamManager *)self setState:0];
  [(UASharedPasteboardInputStreamManager *)self setExpectedLength:7];
  id v10 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"All";
    if (v8) {
      CFStringRef v11 = v8;
    }
    int v20 = 138412290;
    CFStringRef v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Starting to receive types: %@", (uint8_t *)&v20, 0xCu);
  }

  v12 = [(UASharedPasteboardInputStreamManager *)self stream];
  [v12 setDelegate:self];

  v13 = [(UASharedPasteboardInputStreamManager *)self outStream];
  [v13 setDelegate:self];

  objc_super v14 = [(UASharedPasteboardInputStreamManager *)self stream];
  v15 = +[NSRunLoop mainRunLoop];
  [v14 scheduleInRunLoop:v15 forMode:NSRunLoopCommonModes];

  v16 = [(UASharedPasteboardInputStreamManager *)self stream];
  [v16 open];

  v17 = [(UASharedPasteboardInputStreamManager *)self outStream];
  v18 = +[NSRunLoop mainRunLoop];
  [v17 scheduleInRunLoop:v18 forMode:NSRunLoopCommonModes];

  v19 = [(UASharedPasteboardInputStreamManager *)self outStream];
  [v19 open];

  [(UASharedPasteboardInputStreamManager *)self setStreamStartTime:mach_absolute_time()];
}

- (void)cancel
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Input stream canceled", v5, 2u);
  }

  v4 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
  [(UASharedPasteboardInputStreamManager *)self streamDoneWithInfo:0 error:v4];
}

- (void)streamDoneWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ((id)[(UASharedPasteboardInputStreamManager *)v8 state] != (id)3)
  {
    id v9 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Done with input stream", v19, 2u);
    }

    id v10 = [(UASharedPasteboardInputStreamManager *)v8 outStream];
    id v11 = [@"PBDONE" dataUsingEncoding:4];
    objc_msgSend(v10, "write:maxLength:", objc_msgSend(v11, "bytes"), 6);

    v12 = [(UASharedPasteboardInputStreamManager *)v8 stream];
    [v12 close];

    v13 = [(UASharedPasteboardInputStreamManager *)v8 stream];
    objc_super v14 = +[NSRunLoop mainRunLoop];
    [v13 removeFromRunLoop:v14 forMode:NSRunLoopCommonModes];

    v15 = [(UASharedPasteboardInputStreamManager *)v8 outStream];
    [v15 close];

    v16 = [(UASharedPasteboardInputStreamManager *)v8 outStream];
    v17 = +[NSRunLoop mainRunLoop];
    [v16 removeFromRunLoop:v17 forMode:NSRunLoopCommonModes];

    v18 = [(UASharedPasteboardInputStreamManager *)v8 handler];
    ((void (**)(void, id, id))v18)[2](v18, v6, v7);

    [(UASharedPasteboardInputStreamManager *)v8 setState:3];
  }
  objc_sync_exit(v8);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(UASharedPasteboardInputStreamManager *)self progress];
  unsigned int v8 = [v7 isCancelled];

  if (v8)
  {
    id v9 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Paste cancelled, closing stream", buf, 2u);
    }

    [(UASharedPasteboardInputStreamManager *)self cancel];
    goto LABEL_68;
  }
  id v10 = [(UASharedPasteboardInputStreamManager *)self stream];
  unsigned int v11 = [v6 isEqual:v10];

  if (!v11) {
    goto LABEL_68;
  }
  if (a4 == 16)
  {
    v25 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Stream End Encountered", buf, 2u);
    }

    v26 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-127 userInfo:0];
    goto LABEL_28;
  }
  if (a4 == 8)
  {
    v27 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = [(UASharedPasteboardInputStreamManager *)self stream];
      v29 = [v28 streamError];
      *(_DWORD *)buf = 138412290;
      v77 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[IN STREAM] Stream Event Error: %@", buf, 0xCu);
    }
    uint64_t v30 = UAContinuityErrorDomain;
    v31 = [(UASharedPasteboardInputStreamManager *)self stream];
    v32 = [v31 streamError];
    v73 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    v26 = +[NSError errorWithDomain:v30 code:-127 userInfo:v33];

LABEL_28:
    [(UASharedPasteboardInputStreamManager *)self streamDoneWithInfo:0 error:v26];

    goto LABEL_68;
  }
  if (a4 != 2) {
    goto LABEL_68;
  }
  int64_t v12 = [(UASharedPasteboardInputStreamManager *)self expectedLength];
  int64_t v13 = [(UASharedPasteboardInputStreamManager *)self bytesReceived];
  if (v12 - v13 >= 0x10000) {
    uint64_t v14 = 0x10000;
  }
  else {
    uint64_t v14 = v12 - v13;
  }
  if (v12 - v13 <= 0) {
    uint64_t v15 = 0x10000;
  }
  else {
    uint64_t v15 = v14;
  }
  v16 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (char *)objc_msgSend(v6, "read:maxLength:", v16);
  [(UASharedPasteboardInputStreamManager *)self setBytesReceived:&v17[[(UASharedPasteboardInputStreamManager *)self bytesReceived]]];
  unint64_t v18 = [(UASharedPasteboardInputStreamManager *)self state];
  if (v18 == 2)
  {
    if ([(UASharedPasteboardInputStreamManager *)self receivedDelem])
    {
      v36 = [(UASharedPasteboardInputStreamManager *)self progress];
      objc_msgSend(v36, "setCompletedUnitCount:", -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived"));

      double v37 = (double)[(UASharedPasteboardInputStreamManager *)self absoluteToNSec:mach_absolute_time()- [(UASharedPasteboardInputStreamManager *)self streamStartTime]]/ 1000000000.0;
      double v38 = (double)[(UASharedPasteboardInputStreamManager *)self bytesReceived] / v37;
      v39 = [(UASharedPasteboardInputStreamManager *)self progress];
      v40 = +[NSNumber numberWithDouble:v38];
      [v39 setUserInfoObject:v40 forKey:NSProgressThroughputKey];

      int64_t v41 = [(UASharedPasteboardInputStreamManager *)self expectedLength];
      double v42 = (double)(v41 - [(UASharedPasteboardInputStreamManager *)self bytesReceived]) / v38;
      if (*(double *)&qword_1000E68C0 != 0.0) {
        double v42 = v42 * 0.5 + *(double *)&qword_1000E68C0 * 0.5;
      }
      qword_1000E68C0 = *(void *)&v42;
      v43 = +[UAUserActivityDefaults sharedDefaults];
      [v43 pasteboardUITimeRemainingDelay];
      double v45 = v44;

      if (v37 > v45)
      {
        v46 = [(UASharedPasteboardInputStreamManager *)self progress];
        v47 = +[NSNumber numberWithDouble:*(double *)&qword_1000E68C0];
        [v46 setUserInfoObject:v47 forKey:NSProgressEstimatedTimeRemainingKey];
      }
      id v24 = +[NSData dataWithBytesNoCopy:v16 length:v17 freeWhenDone:0];
    }
    else
    {
      if (strncmp(v16, "===", 3uLL))
      {
        v48 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "[IN STREAM] Error, malformed data received. Did not receive correct delimiter", buf, 2u);
        }

        uint64_t v49 = UAContinuityErrorDomain;
        NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
        CFStringRef v75 = @"Invalid delimiter before pb data";
        v50 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        v51 = +[NSError errorWithDomain:v49 code:-122 userInfo:v50];

        [(UASharedPasteboardInputStreamManager *)self streamDoneWithInfo:0 error:v51];
        id v24 = 0;
        goto LABEL_61;
      }
      v67 = [(UASharedPasteboardInputStreamManager *)self progress];
      objc_msgSend(v67, "setTotalUnitCount:", -[UASharedPasteboardInputStreamManager expectedLength](self, "expectedLength"));

      v68 = [(UASharedPasteboardInputStreamManager *)self progress];
      objc_msgSend(v68, "setCompletedUnitCount:", -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived"));

      v69 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Started receiving data file", buf, 2u);
      }

      id v24 = +[NSData dataWithBytesNoCopy:v16 + 3 length:v17 - 3 freeWhenDone:0];
      [(UASharedPasteboardInputStreamManager *)self setReceivedDelem:1];
    }
    if (!v24)
    {
LABEL_62:
      uint64_t v70 = [(UASharedPasteboardInputStreamManager *)self bytesReceived];
      if (v70 < [(UASharedPasteboardInputStreamManager *)self expectedLength])
      {
LABEL_67:

        goto LABEL_68;
      }
      v71 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Received data file", buf, 2u);
      }

      v65 = [(UASharedPasteboardInputStreamManager *)self pbwrapper];
      [(UASharedPasteboardInputStreamManager *)self streamDoneWithInfo:v65 error:0];
LABEL_66:

      goto LABEL_67;
    }
    v51 = [(UASharedPasteboardInputStreamManager *)self file];
    [v51 writeData:v24];
LABEL_61:

    goto LABEL_62;
  }
  if (v18 == 1)
  {
    v34 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "[IN STREAM] Receiving Header", buf, 2u);
    }

    if (!strncmp(v16, "===", 3uLL))
    {
      v52 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Started receiving header", buf, 2u);
      }

      v53 = [(UASharedPasteboardInputStreamManager *)self receivedData];
      [v53 appendBytes:v16 + 3 length:v17 - 3];

      [(UASharedPasteboardInputStreamManager *)self setReceivedDelem:1];
    }
    else if ([(UASharedPasteboardInputStreamManager *)self receivedDelem])
    {
      v35 = [(UASharedPasteboardInputStreamManager *)self receivedData];
      [v35 appendBytes:v16 length:v17];
    }
    else
    {
      v55 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "[IN STREAM] Error, malformed data received. Did not receive correct delimiter", buf, 2u);
      }

      uint64_t v56 = UAContinuityErrorDomain;
      NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
      CFStringRef v79 = @"Invalid delimiter before pbinfo";
      v57 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      v58 = +[NSError errorWithDomain:v56 code:-122 userInfo:v57];

      [(UASharedPasteboardInputStreamManager *)self streamDoneWithInfo:0 error:v58];
    }
    v59 = [(UASharedPasteboardInputStreamManager *)self bytesReceived];
    if (v59 != (void *)[(UASharedPasteboardInputStreamManager *)self expectedLength]) {
      goto LABEL_68;
    }
    id v60 = objc_alloc((Class)NSKeyedUnarchiver);
    v61 = [(UASharedPasteboardInputStreamManager *)self receivedData];
    id v24 = [v60 initForReadingFromData:v61 error:0];

    v62 = [v24 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    [(UASharedPasteboardInputStreamManager *)self setPbwrapper:v62];

    [(UASharedPasteboardInputStreamManager *)self setState:2];
    v63 = [(UASharedPasteboardInputStreamManager *)self pbwrapper];
    v64 = [v63 pbinfo];
    -[UASharedPasteboardInputStreamManager setExpectedLength:](self, "setExpectedLength:", (char *)[v64 dataSize] + 3);

    [(UASharedPasteboardInputStreamManager *)self setBytesReceived:0];
    [(UASharedPasteboardInputStreamManager *)self setReceivedDelem:0];
    [v24 finishDecoding];
    v65 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = [(UASharedPasteboardInputStreamManager *)self pbwrapper];
      *(_DWORD *)buf = 138412290;
      v77 = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Received Header: %@", buf, 0xCu);
    }
    goto LABEL_66;
  }
  if (v18) {
    goto LABEL_68;
  }
  int v19 = strncmp(v16, "===", 3uLL);
  int v20 = sub_10000BA18(@"pasteboard-server");
  CFStringRef v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[IN STREAM] Error, malformed data received. Have not received message header.", buf, 2u);
    }

    uint64_t v22 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
    CFStringRef v81 = @"Invalid message header";
    v23 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    id v24 = +[NSError errorWithDomain:v22 code:-122 userInfo:v23];

    [(UASharedPasteboardInputStreamManager *)self streamDoneWithInfo:0 error:v24];
    goto LABEL_67;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[IN STREAM] Receiving Header Info", buf, 2u);
  }

  [(UASharedPasteboardInputStreamManager *)self setExpectedLength:(*(_DWORD *)(v16 + 3) + 3)];
  [(UASharedPasteboardInputStreamManager *)self setState:1];
  [(UASharedPasteboardInputStreamManager *)self setBytesReceived:0];
  id v54 = objc_alloc_init((Class)NSMutableData);
  [(UASharedPasteboardInputStreamManager *)self setReceivedData:v54];

  [(UASharedPasteboardInputStreamManager *)self setReceivedDelem:0];
LABEL_68:
}

- (unint64_t)absoluteToNSec:(unint64_t)a3
{
  unsigned int v4 = dword_1000E68CC;
  if (!dword_1000E68CC)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000E68C8);
    unsigned int v4 = dword_1000E68CC;
  }
  return dword_1000E68C8 * a3 / v4;
}

- (NSInputStream)stream
{
  return (NSInputStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStream:(id)a3
{
}

- (NSOutputStream)outStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutStream:(id)a3
{
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFile:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProgress:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setHandler:(id)a3
{
}

- (NSSet)typesToReceive
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTypesToReceive:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)pbwrapper
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPbwrapper:(id)a3
{
}

- (NSMutableData)receivedData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setReceivedData:(id)a3
{
}

- (unint64_t)streamStartTime
{
  return self->_streamStartTime;
}

- (void)setStreamStartTime:(unint64_t)a3
{
  self->_streamStartTime = a3;
}

- (unint64_t)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(unint64_t)a3
{
  self->_timeRemaining = a3;
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(int64_t)a3
{
  self->_bytesReceived = a3;
}

- (int64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(int64_t)a3
{
  self->_expectedLength = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)receivedDelem
{
  return self->_receivedDelem;
}

- (void)setReceivedDelem:(BOOL)a3
{
  self->_receivedDelem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_pbwrapper, 0);
  objc_storeStrong((id *)&self->_typesToReceive, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_outStream, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

@end