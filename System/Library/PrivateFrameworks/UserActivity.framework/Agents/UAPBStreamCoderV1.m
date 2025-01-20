@interface UAPBStreamCoderV1
- (BOOL)infoSent;
- (BOOL)isSendMode;
- (BOOL)receivedDelem;
- (NSData)currentSendData;
- (NSFileHandle)dataFile;
- (NSFileHandle)file;
- (NSMutableData)receivedData;
- (NSProgress)progress;
- (NSTimer)backupTimer;
- (UAPBStreamCoderV1)initWithInputStream:(id)a3 outputStream:(id)a4;
- (UASharedPasteboardInfoWrapper)recvRap;
- (UASharedPasteboardInfoWrapper)sendRap;
- (UAStreamHandler)streamHandler;
- (id)headerForData:(id)a3;
- (id)recvHandler;
- (id)sendErrorHandler;
- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4;
- (int64_t)byteIndex;
- (int64_t)bytesReceived;
- (int64_t)expectedLength;
- (unint64_t)dataSent;
- (unint64_t)state;
- (unint64_t)streamStartTime;
- (unint64_t)timeRemaining;
- (unint64_t)totalBytesReceived;
- (void)cancelReceive;
- (void)dealloc;
- (void)processReceivedData;
- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7;
- (void)receivedDataBack:(id)a3;
- (void)sendNextChunk;
- (void)sendPasteboard:(id)a3 withCompletion:(id)a4;
- (void)setBackupTimer:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setBytesReceived:(int64_t)a3;
- (void)setCurrentSendData:(id)a3;
- (void)setDataFile:(id)a3;
- (void)setDataSent:(unint64_t)a3;
- (void)setExpectedLength:(int64_t)a3;
- (void)setFile:(id)a3;
- (void)setInfoSent:(BOOL *)a3;
- (void)setIsSendMode:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setReceivedDelem:(BOOL)a3;
- (void)setRecvHandler:(id)a3;
- (void)setRecvRap:(id)a3;
- (void)setSendErrorHandler:(id)a3;
- (void)setSendRap:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamStartTime:(unint64_t)a3;
- (void)setTimeRemaining:(unint64_t)a3;
- (void)setTotalBytesReceived:(unint64_t)a3;
- (void)shutdownTimerFired:(id)a3;
- (void)streamDoneWithInfo:(id)a3 error:(id)a4;
- (void)streams:(id)a3 didReadRawData:(id)a4;
- (void)streamsDidClose:(id)a3 withError:(id)a4;
- (void)streamsDidWriteRawDataBuffer:(id)a3;
@end

@implementation UAPBStreamCoderV1

- (UAPBStreamCoderV1)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UAPBStreamCoderV1;
  v8 = [(UAPBStreamCoderV1 *)&v11 init];
  if (v8)
  {
    v9 = [[UAStreamHandler alloc] initWithInputStream:v6 outputStream:v7 delegate:v8];
    [(UAPBStreamCoderV1 *)v8 setStreamHandler:v9];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(UAPBStreamCoderV1 *)self streamHandler];
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)UAPBStreamCoderV1;
  [(UAPBStreamCoderV1 *)&v4 dealloc];
}

- (void)streams:(id)a3 didReadRawData:(id)a4
{
  id v6 = a4;
  if ([(UAPBStreamCoderV1 *)self isSendMode])
  {
    [(UAPBStreamCoderV1 *)self receivedDataBack:v6];
  }
  else
  {
    v5 = [(UAPBStreamCoderV1 *)self receivedData];
    [v5 appendData:v6];

    -[UAPBStreamCoderV1 setBytesReceived:](self, "setBytesReceived:", (char *)[v6 length] + -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived"));
    -[UAPBStreamCoderV1 setTotalBytesReceived:](self, "setTotalBytesReceived:", (char *)[v6 length] + -[UAPBStreamCoderV1 totalBytesReceived](self, "totalBytesReceived"));
    [(UAPBStreamCoderV1 *)self processReceivedData];
  }
}

- (void)streamsDidWriteRawDataBuffer:(id)a3
{
  if ([(UAPBStreamCoderV1 *)self isSendMode])
  {
    [(UAPBStreamCoderV1 *)self sendNextChunk];
  }
}

- (void)streamsDidClose:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v5 = (id)[(UAPBStreamCoderV1 *)self isSendMode];
  if (v6 && (v5 & 1) == 0) {
    id v5 = [(UAPBStreamCoderV1 *)self streamDoneWithInfo:0 error:v6];
  }

  _objc_release_x1(v5);
}

- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = sub_10000BA18(@"pasteboard-streams");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Starting to receive pasteboard", (uint8_t *)buf, 2u);
  }

  [(UAPBStreamCoderV1 *)self setProgress:v12];
  objc_initWeak(buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100065604;
  v20[3] = &unk_1000C6028;
  id v16 = v13;
  id v21 = v16;
  id v17 = v14;
  id v22 = v17;
  objc_copyWeak(&v23, buf);
  [(UAPBStreamCoderV1 *)self setRecvHandler:v20];
  id v18 = objc_alloc_init((Class)NSMutableData);
  [(UAPBStreamCoderV1 *)self setReceivedData:v18];

  [(UAPBStreamCoderV1 *)self setFile:v11];
  [(UAPBStreamCoderV1 *)self setState:0];
  [(UAPBStreamCoderV1 *)self setExpectedLength:7];
  v19 = [(UAPBStreamCoderV1 *)self streamHandler];
  [v19 start];

  [(UAPBStreamCoderV1 *)self setStreamStartTime:mach_absolute_time()];
  objc_destroyWeak(&v23);

  objc_destroyWeak(buf);
}

- (void)cancelReceive
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Input stream canceled", v5, 2u);
  }

  objc_super v4 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
  [(UAPBStreamCoderV1 *)self streamDoneWithInfo:0 error:v4];
}

- (void)streamDoneWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if ((id)[(UAPBStreamCoderV1 *)v8 state] != (id)3)
  {
    v9 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Done with input stream: %@, %@", (uint8_t *)&v14, 0x16u);
    }

    v10 = [(UAPBStreamCoderV1 *)v8 streamHandler];
    id v11 = [@"PBDONE" dataUsingEncoding:4];
    [v10 writeRawData:v11];

    id v12 = [(UAPBStreamCoderV1 *)v8 streamHandler];
    [v12 stop];

    id v13 = [(UAPBStreamCoderV1 *)v8 recvHandler];
    ((void (**)(void, id, id))v13)[2](v13, v6, v7);

    [(UAPBStreamCoderV1 *)v8 setState:3];
  }
  objc_sync_exit(v8);
}

- (void)processReceivedData
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_super v4 = [(UAPBStreamCoderV1 *)self receivedData];
    int v72 = 134217984;
    id v73 = [v4 length];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CODER_V1] Processing Received data with length: %ld", (uint8_t *)&v72, 0xCu);
  }
  id v5 = [(UAPBStreamCoderV1 *)self receivedData];
  id v6 = [v5 length];

  if (!v6) {
    return;
  }
  unint64_t v7 = [(UAPBStreamCoderV1 *)self state];
  if (v7 == 2)
  {
    if ([(UAPBStreamCoderV1 *)self receivedDelem])
    {
      v19 = [(UAPBStreamCoderV1 *)self progress];
      objc_msgSend(v19, "setCompletedUnitCount:", -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived"));

      double v20 = (double)+[UADiagnosticUtils absoluteToNSec:mach_absolute_time() - [(UAPBStreamCoderV1 *)self streamStartTime]]/ 1000000000.0;
      double v21 = (double)[(UAPBStreamCoderV1 *)self bytesReceived] / v20;
      id v22 = [(UAPBStreamCoderV1 *)self progress];
      id v23 = +[NSNumber numberWithDouble:v21];
      [v22 setUserInfoObject:v23 forKey:NSProgressThroughputKey];

      int64_t v24 = [(UAPBStreamCoderV1 *)self expectedLength];
      double v25 = (double)(v24 - [(UAPBStreamCoderV1 *)self bytesReceived]) / v21;
      if (*(double *)&qword_1000E68F0 != 0.0) {
        double v25 = v25 * 0.5 + *(double *)&qword_1000E68F0 * 0.5;
      }
      qword_1000E68F0 = *(void *)&v25;
      v26 = +[UAUserActivityDefaults sharedDefaults];
      [v26 pasteboardUITimeRemainingDelay];
      double v28 = v27;

      if (v20 > v28)
      {
        v29 = [(UAPBStreamCoderV1 *)self progress];
        v30 = +[NSNumber numberWithDouble:*(double *)&qword_1000E68F0];
        [v29 setUserInfoObject:v30 forKey:NSProgressEstimatedTimeRemainingKey];

LABEL_27:
      }
    }
    else
    {
      id v38 = [(UAPBStreamCoderV1 *)self receivedData];
      v39 = (const char *)[v38 bytes];

      if (strncmp(v39, "===", 3uLL))
      {
        v40 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v72) = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[CODER_V1] Error, malformed data received. Did not receive correct delimiter", (uint8_t *)&v72, 2u);
        }

        uint64_t v41 = UAContinuityErrorDomain;
        NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
        CFStringRef v77 = @"Invalid delimiter before pb data";
        v42 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        v29 = +[NSError errorWithDomain:v41 code:-122 userInfo:v42];

        [(UAPBStreamCoderV1 *)self streamDoneWithInfo:0 error:v29];
        goto LABEL_27;
      }
      v57 = [(UAPBStreamCoderV1 *)self progress];
      objc_msgSend(v57, "setTotalUnitCount:", -[UAPBStreamCoderV1 expectedLength](self, "expectedLength"));

      v58 = [(UAPBStreamCoderV1 *)self progress];
      objc_msgSend(v58, "setCompletedUnitCount:", -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived"));

      v59 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v72) = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Started receiving data file", (uint8_t *)&v72, 2u);
      }

      v60 = [(UAPBStreamCoderV1 *)self receivedData];
      v61 = [(UAPBStreamCoderV1 *)self trimFirstBytes:3 ofData:v60];
      [(UAPBStreamCoderV1 *)self setReceivedData:v61];

      [(UAPBStreamCoderV1 *)self setReceivedDelem:1];
    }
    v62 = [(UAPBStreamCoderV1 *)self receivedData];
    id v63 = [v62 length];

    if (v63)
    {
      v64 = [(UAPBStreamCoderV1 *)self file];
      v65 = [(UAPBStreamCoderV1 *)self receivedData];
      [v64 writeData:v65];

      v66 = [(UAPBStreamCoderV1 *)self receivedData];
      [v66 setLength:0];
    }
    v67 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      int64_t v68 = [(UAPBStreamCoderV1 *)self bytesReceived];
      int64_t v69 = [(UAPBStreamCoderV1 *)self expectedLength];
      int v72 = 134218240;
      id v73 = (id)v68;
      __int16 v74 = 2048;
      int64_t v75 = v69;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "[CODER_V1] Recived %ld of %ld", (uint8_t *)&v72, 0x16u);
    }

    uint64_t v70 = [(UAPBStreamCoderV1 *)self bytesReceived];
    if (v70 >= [(UAPBStreamCoderV1 *)self expectedLength])
    {
      v71 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v72) = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Received data file", (uint8_t *)&v72, 2u);
      }

      id v15 = [(UAPBStreamCoderV1 *)self recvRap];
      __int16 v16 = self;
      id v17 = v15;
      id v18 = 0;
      goto LABEL_50;
    }
    return;
  }
  if (v7 != 1)
  {
    if (v7) {
      return;
    }
    id v8 = [(UAPBStreamCoderV1 *)self receivedData];
    v9 = (char *)[v8 bytes];

    int v10 = strncmp(v9, "===", 3uLL);
    id v11 = sub_10000BA18(@"pasteboard-server");
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v72) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[CODER_V1] Error, malformed data received. Have not received message header.", (uint8_t *)&v72, 2u);
      }

      uint64_t v13 = UAContinuityErrorDomain;
      NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
      CFStringRef v81 = @"Invalid message header";
      int v14 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      id v15 = +[NSError errorWithDomain:v13 code:-122 userInfo:v14];

      __int16 v16 = self;
      id v17 = 0;
      id v18 = v15;
LABEL_50:
      [(UAPBStreamCoderV1 *)v16 streamDoneWithInfo:v17 error:v18];
      goto LABEL_51;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[CODER_V1] Receiving Header Info", (uint8_t *)&v72, 2u);
    }

    [(UAPBStreamCoderV1 *)self setExpectedLength:(*(_DWORD *)(v9 + 3) + 3)];
    [(UAPBStreamCoderV1 *)self setState:1];
    [(UAPBStreamCoderV1 *)self setBytesReceived:(char *)[(UAPBStreamCoderV1 *)self bytesReceived] - 7];
    [(UAPBStreamCoderV1 *)self setReceivedDelem:0];
    id v15 = [(UAPBStreamCoderV1 *)self receivedData];
    id v48 = [(UAPBStreamCoderV1 *)self trimFirstBytes:7 ofData:v15];
    [(UAPBStreamCoderV1 *)self setReceivedData:v48];
LABEL_38:

LABEL_51:
    return;
  }
  v31 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v72) = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "[CODER_V1] Receiving Header", (uint8_t *)&v72, 2u);
  }

  id v32 = [(UAPBStreamCoderV1 *)self receivedData];
  v33 = (const char *)[v32 bytes];

  if (!strncmp(v33, "===", 3uLL))
  {
    v43 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Started receiving header", (uint8_t *)&v72, 2u);
    }

    v44 = [(UAPBStreamCoderV1 *)self receivedData];
    v45 = [(UAPBStreamCoderV1 *)self trimFirstBytes:3 ofData:v44];
    [(UAPBStreamCoderV1 *)self setReceivedData:v45];

    [(UAPBStreamCoderV1 *)self setReceivedDelem:1];
    [(UAPBStreamCoderV1 *)self setExpectedLength:(char *)[(UAPBStreamCoderV1 *)self expectedLength] - 3];
    [(UAPBStreamCoderV1 *)self setBytesReceived:(char *)[(UAPBStreamCoderV1 *)self bytesReceived] - 3];
  }
  else if (![(UAPBStreamCoderV1 *)self receivedDelem])
  {
    v34 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[CODER_V1] Error, malformed data received. Did not receive correct delimiter", (uint8_t *)&v72, 2u);
    }

    uint64_t v35 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
    CFStringRef v79 = @"Invalid delimiter before pbinfo";
    v36 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    v37 = +[NSError errorWithDomain:v35 code:-122 userInfo:v36];

    [(UAPBStreamCoderV1 *)self streamDoneWithInfo:0 error:v37];
  }
  uint64_t v46 = [(UAPBStreamCoderV1 *)self bytesReceived];
  if (v46 >= [(UAPBStreamCoderV1 *)self expectedLength])
  {
    v47 = [(UAPBStreamCoderV1 *)self receivedData];
    id v15 = objc_msgSend(v47, "subdataWithRange:", 0, -[UAPBStreamCoderV1 expectedLength](self, "expectedLength"));

    id v48 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v15 error:0];
    v49 = [v48 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    [(UAPBStreamCoderV1 *)self setRecvRap:v49];

    [(UAPBStreamCoderV1 *)self setState:2];
    v50 = [(UAPBStreamCoderV1 *)self recvRap];
    v51 = [v50 pbinfo];
    -[UAPBStreamCoderV1 setExpectedLength:](self, "setExpectedLength:", (char *)[v51 dataSize] + 3);

    -[UAPBStreamCoderV1 setBytesReceived:](self, "setBytesReceived:", (unsigned char *)-[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived") - (unsigned char *)[v15 length]);
    [(UAPBStreamCoderV1 *)self setReceivedDelem:0];
    [v48 finishDecoding];
    id v52 = [v15 length];
    v53 = [(UAPBStreamCoderV1 *)self receivedData];
    v54 = [(UAPBStreamCoderV1 *)self trimFirstBytes:v52 ofData:v53];
    [(UAPBStreamCoderV1 *)self setReceivedData:v54];

    v55 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = [(UAPBStreamCoderV1 *)self recvRap];
      int v72 = 138412290;
      id v73 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Received Header: %@", (uint8_t *)&v72, 0xCu);
    }
    goto LABEL_38;
  }
}

- (void)sendPasteboard:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  [(UAPBStreamCoderV1 *)self setIsSendMode:1];
  v34 = v6;
  [(UAPBStreamCoderV1 *)self setSendRap:v6];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  val = self;
  unint64_t v7 = [(UAPBStreamCoderV1 *)self sendRap];
  id v8 = [v7 pbinfo];
  v9 = [v8 items];

  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v14 = [v13 types];
        id v15 = [v14 allKeys];
        unsigned int v16 = [v15 containsObject:@"public.file-url"];

        if (v16)
        {
          id v17 = [v13 types];
          id v18 = [v17 mutableCopy];

          [v18 removeObjectForKey:@"public.file-url"];
          [v18 removeObjectForKey:@"com.apple.security.sandbox-extension-dict"];
          [v18 removeObjectForKey:@"com.apple.finder.noderef"];
          [v13 setTypes:v18];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }

  objc_initWeak(&location, val);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10006692C;
  v36[3] = &unk_1000C6050;
  id v19 = v33;
  id v37 = v19;
  objc_copyWeak(&v38, &location);
  [(UAPBStreamCoderV1 *)val setSendErrorHandler:v36];
  double v20 = [v34 pbinfo];
  double v21 = [v20 dataFile];
  [(UAPBStreamCoderV1 *)val setDataFile:v21];

  id v22 = [(UAPBStreamCoderV1 *)val sendRap];
  id v23 = [v22 pbinfo];
  [v23 setDataFile:0];

  [(UAPBStreamCoderV1 *)val setDataSent:0];
  int64_t v24 = [(UAPBStreamCoderV1 *)val sendRap];
  double v25 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:0];

  v26 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    double v27 = [(UAPBStreamCoderV1 *)val sendRap];
    *(_DWORD *)buf = 138412290;
    v45 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Sending pboard info: %@", buf, 0xCu);
  }
  double v28 = [(UAPBStreamCoderV1 *)val headerForData:v25];
  [(UAPBStreamCoderV1 *)val setCurrentSendData:v28];

  v29 = [(UAPBStreamCoderV1 *)val streamHandler];
  v30 = [(UAPBStreamCoderV1 *)val currentSendData];
  [v29 writeRawData:v30];

  v31 = [(UAPBStreamCoderV1 *)val currentSendData];
  -[UAPBStreamCoderV1 setDataSent:](val, "setDataSent:", (char *)[v31 length] + -[UAPBStreamCoderV1 dataSent](val, "dataSent"));

  [(UAPBStreamCoderV1 *)val setCurrentSendData:0];
  id v32 = [(UAPBStreamCoderV1 *)val streamHandler];
  [v32 start];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

- (void)sendNextChunk
{
  v3 = [(UAPBStreamCoderV1 *)self dataFile];
  objc_super v4 = [v3 readDataOfLength:0x10000];

  -[UAPBStreamCoderV1 setDataSent:](self, "setDataSent:", (char *)[v4 length] + -[UAPBStreamCoderV1 dataSent](self, "dataSent"));
  id v5 = [v4 length];
  id v6 = sub_10000BA18(@"pasteboard-server");
  unint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134217984;
      id v12 = [v4 length];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[CODER_V1] Queuing next chunk to send: %ld", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [(UAPBStreamCoderV1 *)self streamHandler];
    [v8 writeRawData:v4];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Done queuing chunks, starting shutdown timer", (uint8_t *)&v11, 2u);
    }

    v9 = +[NSTimer timerWithTimeInterval:self target:"shutdownTimerFired:" selector:0 userInfo:0 repeats:30.0];
    [(UAPBStreamCoderV1 *)self setBackupTimer:v9];

    id v8 = +[NSRunLoop mainRunLoop];
    id v10 = [(UAPBStreamCoderV1 *)self backupTimer];
    [v8 addTimer:v10 forMode:NSRunLoopCommonModes];
  }
}

- (void)receivedDataBack:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];

  id v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    unint64_t v16 = (unint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Got data back: %@", (uint8_t *)&v15, 0xCu);
  }

  unint64_t v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(UAPBStreamCoderV1 *)self dataSent];
    v9 = [(UAPBStreamCoderV1 *)self streamHandler];
    id v10 = [v9 totalBytesSent];
    int v15 = 134218240;
    unint64_t v16 = v8;
    __int16 v17 = 2048;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Data sent: %ld - %ld", (uint8_t *)&v15, 0x16u);
  }
  int v11 = [(UAPBStreamCoderV1 *)self streamHandler];
  [v11 stop];

  id v12 = [(UAPBStreamCoderV1 *)self backupTimer];
  [v12 invalidate];

  uint64_t v13 = [(UAPBStreamCoderV1 *)self sendErrorHandler];
  int v14 = [(UAPBStreamCoderV1 *)self streamHandler];
  ((void (**)(void, id, void))v13)[2](v13, [v14 totalBytesSent], 0);
}

- (void)shutdownTimerFired:(id)a3
{
  id v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[OUT STREAM] Stream Timer Fired, shutting down", v8, 2u);
  }

  id v5 = [(UAPBStreamCoderV1 *)self streamHandler];
  [v5 stop];

  id v6 = [(UAPBStreamCoderV1 *)self sendErrorHandler];
  unint64_t v7 = [(UAPBStreamCoderV1 *)self streamHandler];
  ((void (**)(void, id, void))v6)[2](v6, [v7 totalBytesSent], 0);
}

- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(v5, "subdataWithRange:", a3, (char *)objc_msgSend(v5, "length") - a3);

  unint64_t v7 = +[NSMutableData dataWithData:v6];

  return v7;
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

- (UAStreamHandler)streamHandler
{
  return (UAStreamHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStreamHandler:(id)a3
{
}

- (BOOL)isSendMode
{
  return self->_isSendMode;
}

- (void)setIsSendMode:(BOOL)a3
{
  self->_isSendMode = a3;
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFile:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProgress:(id)a3
{
}

- (id)recvHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setRecvHandler:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)recvRap
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecvRap:(id)a3
{
}

- (NSMutableData)receivedData
{
  return (NSMutableData *)objc_getProperty(self, a2, 56, 1);
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

- (unint64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(unint64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (UASharedPasteboardInfoWrapper)sendRap
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSendRap:(id)a3
{
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataFile:(id)a3
{
}

- (id)sendErrorHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setSendErrorHandler:(id)a3
{
}

- (NSData)currentSendData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
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
  return (NSTimer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBackupTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupTimer, 0);
  objc_storeStrong((id *)&self->_currentSendData, 0);
  objc_storeStrong(&self->_sendErrorHandler, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_sendRap, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_recvRap, 0);
  objc_storeStrong(&self->_recvHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_file, 0);

  objc_storeStrong((id *)&self->_streamHandler, 0);
}

@end