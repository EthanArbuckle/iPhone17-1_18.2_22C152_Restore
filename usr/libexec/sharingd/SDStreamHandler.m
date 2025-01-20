@interface SDStreamHandler
- (BOOL)bufferSpaceAvailable;
- (BOOL)checkedCert;
- (BOOL)evaluateCert;
- (BOOL)isClient;
- (BOOL)loggedTransfer;
- (BOOL)registeredStreams;
- (BOOL)shouldReadNetwork;
- (BOOL)shouldStop;
- (BOOL)usingMessages;
- (NSData)inMessage;
- (NSDate)timeOpened;
- (NSDate)timeToOpen;
- (NSError)streamError;
- (NSInputStream)inputStream;
- (NSMutableArray)messageQueue;
- (NSMutableData)inData;
- (NSMutableData)outMessage;
- (NSMutableData)outputStreamData;
- (NSMutableDictionary)handlers;
- (NSOutputStream)outputStream;
- (NSString)bundleID;
- (NSTimer)openTimer;
- (SDStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 isClient:(BOOL)a5;
- (SDStreamHandlerDelegate)delegate;
- (id)headerWithLength:(unsigned int)a3;
- (id)messageWithData:(id)a3;
- (id)trimHeader:(id)a3;
- (int64_t)byteIndex;
- (int64_t)bytesRead;
- (int64_t)readFromNetwork;
- (int64_t)wroteToNetwork;
- (unint64_t)inputState;
- (unsigned)inMessageLength;
- (unsigned)parseHeader:(id)a3;
- (void)_stop;
- (void)applySSLSettings:(id)a3;
- (void)dealloc;
- (void)handleBytesAvailable;
- (void)handleBytesForMessage;
- (void)handleBytesForStream;
- (void)handleHeaderRead;
- (void)handleMessageRead;
- (void)handleMessageWritten:(id)a3;
- (void)handleOpenedStream:(id)a3;
- (void)handleSpaceAvailable;
- (void)handleSpaceForMessage;
- (void)handleSpaceForStream;
- (void)invalidateOpenTimer;
- (void)logTransfer;
- (void)openTimerFired:(id)a3;
- (void)resetReadState;
- (void)sendMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)sendMessage:(id)a3 withErrorHandler:(id)a4;
- (void)setBufferSpaceAvailable:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setBytesRead:(int64_t)a3;
- (void)setCheckedCert:(BOOL)a3;
- (void)setClient:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setInData:(id)a3;
- (void)setInMessage:(id)a3;
- (void)setInMessageLength:(unsigned int)a3;
- (void)setInputState:(unint64_t)a3;
- (void)setInputStream:(id)a3;
- (void)setLoggedTransfer:(BOOL)a3;
- (void)setMessageQueue:(id)a3;
- (void)setOpenTimer:(id)a3;
- (void)setOutMessage:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setOutputStreamData:(id)a3;
- (void)setReadFromNetwork:(int64_t)a3;
- (void)setRegisteredStreams:(BOOL)a3;
- (void)setShouldReadNetwork:(BOOL)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setStreamError:(id)a3;
- (void)setTCPProperties:(id)a3;
- (void)setTimeOpened:(id)a3;
- (void)setTimeToOpen:(id)a3;
- (void)setUsingMessages:(BOOL)a3;
- (void)setWroteToNetwork:(int64_t)a3;
- (void)start;
- (void)startOpenTimer;
- (void)stop;
- (void)stopIfReady;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeToStreamWithData:(id)a3;
@end

@implementation SDStreamHandler

- (SDStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 isClient:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SDStreamHandler;
  v11 = [(SDStreamHandler *)&v29 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputStream, a3);
    objc_storeStrong((id *)&v12->_outputStream, a4);
    v12->_client = a5;
    v12->_byteIndex = 0;
    v12->_bytesRead = 0;
    bundleID = v12->_bundleID;
    v12->_bundleID = (NSString *)&stru_1008E7020;

    inMessage = v12->_inMessage;
    v12->_inMessage = 0;

    v12->_shouldStop = 0;
    openTimer = v12->_openTimer;
    v12->_openTimer = 0;

    outMessage = v12->_outMessage;
    v12->_outMessage = 0;

    v12->_checkedCert = 0;
    streamError = v12->_streamError;
    v12->_streamError = 0;

    v12->_inMessageLength = 0;
    *(_WORD *)&v12->_registeredStreams = 256;
    *(_WORD *)&v12->_shouldReadNetwork = 257;
    uint64_t v18 = objc_opt_new();
    inData = v12->_inData;
    v12->_inData = (NSMutableData *)v18;

    uint64_t v20 = objc_opt_new();
    messageQueue = v12->_messageQueue;
    v12->_messageQueue = (NSMutableArray *)v20;

    uint64_t v22 = objc_opt_new();
    handlers = v12->_handlers;
    v12->_handlers = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    outputStreamData = v12->_outputStreamData;
    v12->_outputStreamData = (NSMutableData *)v24;

    v12->_inputState = 0;
    timeToOpen = v12->_timeToOpen;
    v12->_timeToOpen = 0;

    timeOpened = v12->_timeOpened;
    v12->_timeOpened = 0;

    v12->_loggedTransfer = 0;
    v12->_wroteToNetwork = 0;
    v12->_readFromNetwork = 0;
  }

  return v12;
}

- (void)dealloc
{
  v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Deallocating Stream Handler", buf, 0xCu);
  }

  [(SDStreamHandler *)self _stop];
  v4.receiver = self;
  v4.super_class = (Class)SDStreamHandler;
  [(SDStreamHandler *)&v4 dealloc];
}

- (void)start
{
  if (![(NSInputStream *)self->_inputStream streamStatus])
  {
    [(SDStreamHandler *)self applySSLSettings:self->_inputStream];
    inputStream = self->_inputStream;
    objc_super v4 = +[NSRunLoop currentRunLoop];
    [(NSInputStream *)inputStream scheduleInRunLoop:v4 forMode:NSDefaultRunLoopMode];

    [(NSInputStream *)self->_inputStream setProperty:&__kCFBooleanFalse forKey:kCFStreamPropertyAutoErrorOnSystemChange];
    [(NSInputStream *)self->_inputStream setProperty:&__kCFBooleanTrue forKey:kCFStreamPropertyIndefiniteConnection];
    if (!self->_client) {
      [(NSInputStream *)self->_inputStream setProperty:&off_100902CE8 forKey:_kCFStreamPropertySSLClientSideAuthentication];
    }
    [(NSInputStream *)self->_inputStream setDelegate:self];
    [(NSInputStream *)self->_inputStream open];
  }
  if (![(NSOutputStream *)self->_outputStream streamStatus])
  {
    [(SDStreamHandler *)self applySSLSettings:self->_outputStream];
    outputStream = self->_outputStream;
    v6 = +[NSRunLoop currentRunLoop];
    [(NSOutputStream *)outputStream scheduleInRunLoop:v6 forMode:NSDefaultRunLoopMode];

    [(NSOutputStream *)self->_outputStream setProperty:&__kCFBooleanFalse forKey:kCFStreamPropertyAutoErrorOnSystemChange];
    [(NSOutputStream *)self->_outputStream setProperty:&__kCFBooleanTrue forKey:kCFStreamPropertyIndefiniteConnection];
    if (!self->_client) {
      [(NSInputStream *)self->_inputStream setProperty:&off_100902CE8 forKey:_kCFStreamPropertySSLClientSideAuthentication];
    }
    [(NSOutputStream *)self->_outputStream setDelegate:self];
    [(NSOutputStream *)self->_outputStream open];
  }
  v7 = +[NSDate date];
  timeToOpen = self->_timeToOpen;
  self->_timeToOpen = v7;

  if (!self->_registeredStreams)
  {
    id v9 = +[SDStreamManager sharedManager];
    [v9 registerConnectedStreams];

    self->_registeredStreams = 1;
  }
  [(SDStreamHandler *)self startOpenTimer];
  id v10 = streams_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating network streams", v11, 2u);
  }
}

- (void)stop
{
  if ([(SDStreamHandler *)self usingMessages])
  {
    [(SDStreamHandler *)self _stop];
  }
  else
  {
    self->_shouldStop = 1;
    [(SDStreamHandler *)self stopIfReady];
  }
}

- (void)stopIfReady
{
  if (self->_shouldStop && ![(NSMutableData *)self->_outputStreamData length])
  {
    [(SDStreamHandler *)self _stop];
  }
}

- (void)_stop
{
  if (self->_inputStream)
  {
    v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Closing input stream", (uint8_t *)&v13, 0xCu);
    }

    [(NSInputStream *)self->_inputStream close];
    [(NSInputStream *)self->_inputStream setDelegate:0];
    inputStream = self->_inputStream;
    self->_inputStream = 0;
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    [(NSOutputStream *)outputStream close];
    [(NSOutputStream *)self->_outputStream setDelegate:0];
    v6 = streams_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Closing output stream", (uint8_t *)&v13, 0xCu);
    }

    v7 = self->_outputStream;
    self->_outputStream = 0;
  }
  if (self->_registeredStreams)
  {
    v8 = +[SDStreamManager sharedManager];
    [v8 unregisterConnectedStreams];

    self->_registeredStreams = 0;
  }
  [(SDStreamHandler *)self logTransfer];
  id v9 = streams_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Network streams closed", (uint8_t *)&v13, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 streamHandlerDidClose:self withError:self->_streamError];
  }
}

- (BOOL)shouldReadNetwork
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL shouldReadNetwork = v2->_shouldReadNetwork;
  objc_sync_exit(v2);

  return shouldReadNetwork;
}

- (void)setShouldReadNetwork:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL shouldReadNetwork = v3;
  if (v3
    && [(NSInputStream *)obj->_inputStream hasBytesAvailable]
    && ![(SDStreamHandler *)obj usingMessages])
  {
    [(SDStreamHandler *)obj handleBytesForStream];
  }
  objc_sync_exit(obj);
}

- (void)logTransfer
{
  int64_t wroteToNetwork = self->_wroteToNetwork;
  int64_t readFromNetwork = self->_readFromNetwork;
  if (self->_timeOpened)
  {
    v5 = +[NSDate date];
    [v5 timeIntervalSinceDate:self->_timeOpened];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  if (!self->_loggedTransfer)
  {
    uint64_t v8 = readFromNetwork + wroteToNetwork;
    BOOL v9 = !self->_bundleID || v8 == 0;
    if (!v9 && v7 != 0.0)
    {
      id v10 = streams_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = [(NSString *)self->_bundleID isEqualToString:&stru_1008E7020];
        char v12 = v11;
        if (v11)
        {
          bundleID = self->_bundleID;
        }
        else
        {
          bundleID = +[NSString stringWithFormat:@", bundleID = %@", self->_bundleID];
        }
        *(_DWORD *)buf = 134218498;
        uint64_t v15 = v8;
        __int16 v16 = 2048;
        double v17 = v7;
        __int16 v18 = 2112;
        v19 = bundleID;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stream Stats: total bytes transferred = %ld, duration = %g%@", buf, 0x20u);
        if ((v12 & 1) == 0) {
      }
        }
      sub_100047648((__CFString *)self->_bundleID, v8, v7);
      self->_loggedTransfer = 1;
    }
  }
}

- (void)startOpenTimer
{
  BOOL v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = 30;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting open timer with timeout = %d", (uint8_t *)v6, 8u);
  }

  objc_super v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"openTimerFired:" selector:0 userInfo:0 repeats:30.0];
  openTimer = self->_openTimer;
  self->_openTimer = v4;
}

- (void)openTimerFired:(id)a3
{
  if (![(NSInputStream *)self->_inputStream streamStatus]
    || [(NSInputStream *)self->_inputStream streamStatus] == (id)1
    || ![(NSOutputStream *)self->_outputStream streamStatus]
    || [(NSOutputStream *)self->_outputStream streamStatus] == (id)1)
  {
    objc_super v4 = streams_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(NSInputStream *)self->_inputStream streamStatus];
      unsigned int v6 = [(NSOutputStream *)self->_outputStream streamStatus];
      *(_DWORD *)buf = 67109376;
      unsigned int v14 = v5;
      __int16 v15 = 1024;
      unsigned int v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Open timer fired with input stream status = %d, output stream status = %d, closing streams", buf, 0xEu);
    }

    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Connection timed out";
    double v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:v7];
    streamError = self->_streamError;
    self->_streamError = v8;

    [(SDStreamHandler *)self _stop];
  }
  openTimer = self->_openTimer;
  self->_openTimer = 0;
}

- (void)invalidateOpenTimer
{
  if (self->_openTimer)
  {
    BOOL v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Streams invalidating open timer", v5, 2u);
    }

    [(NSTimer *)self->_openTimer invalidate];
    openTimer = self->_openTimer;
    self->_openTimer = 0;
  }
}

- (void)applySSLSettings:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v6 = [v5 disableContinuityTLS];

  if ((v6 & 1) == 0)
  {
    double v7 = +[SDStatusMonitor sharedMonitor];
    id v8 = [v7 copyMyAppleIDSecIdentity];

    if (v8)
    {
      BOOL v9 = +[SDStatusMonitor sharedMonitor];
      id v10 = [v9 copyMyAppleIDIntermediateCertificate];

      if (v10)
      {
        v21[0] = v8;
        v21[1] = v10;
        NSErrorUserInfoKey v11 = +[NSArray arrayWithObjects:v21 count:2];
        v19[0] = kCFStreamSSLLevel;
        v19[1] = kCFStreamSSLCertificates;
        v20[0] = kCFStreamSocketSecurityLevelTLSv1;
        v20[1] = v11;
        v19[2] = kCFStreamSSLValidatesCertificateChain;
        v19[3] = kCFStreamSSLIsServer;
        if (self->_client) {
          CFBooleanRef v12 = kCFBooleanFalse;
        }
        else {
          CFBooleanRef v12 = kCFBooleanTrue;
        }
        v20[2] = kCFBooleanFalse;
        v20[3] = v12;
        int v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
        unsigned int v14 = streams_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Applying tls settings", v18, 2u);
        }

        [v4 setProperty:v13 forKey:kCFStreamPropertySSLSettings];
        CFRelease(v10);
      }
      else
      {
        unsigned int v16 = +[SDStatusMonitor sharedMonitor];
        double v17 = [v16 myAppleID];
        SFMetricsLogUnexpectedEvent();

        NSErrorUserInfoKey v11 = streams_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10017B6C4();
        }
      }

      CFRelease(v8);
    }
    else
    {
      __int16 v15 = streams_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10017B690();
      }
    }
  }
}

- (BOOL)evaluateCert
{
  v2 = (__SecTrust *)[(NSInputStream *)self->_inputStream propertyForKey:kCFStreamPropertySSLPeerTrust];
  if (v2)
  {
    BOOL v3 = sub_100051754(v2);
    if ([v3 count])
    {
      int v28 = 0;
      if (!SFAppleIDVerifyCertificateChainSync())
      {
        id v4 = streams_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_10017B838((uint64_t)&v28, v4, v5, v6, v7, v8, v9, v10);
        }
        BOOL v11 = 0;
        goto LABEL_29;
      }
      [v3 objectAtIndexedSubscript:0];

      uint64_t v27 = 0;
      int v13 = SFAppleIDCommonNameForCertificate();
      id v4 = 0;
      int v28 = v13;
      if (v13)
      {
        unsigned int v14 = streams_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10017B7C8((uint64_t)&v28, v14, v15, v16, v17, v18, v19, v20);
        }
        BOOL v11 = 0;
        goto LABEL_28;
      }
      v21 = +[SDStatusMonitor sharedMonitor];
      unsigned int v14 = [v21 myAppleIDCommonName];

      if ([v14 length])
      {
        unsigned int v22 = [v4 isEqualToString:v14];
        v23 = streams_log();
        uint64_t v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Accounts match", v26, 2u);
          }
          BOOL v11 = 1;
          goto LABEL_27;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10017B794();
        }
      }
      else
      {
        uint64_t v24 = streams_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10017B760();
        }
      }
      BOOL v11 = 0;
LABEL_27:

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    CFBooleanRef v12 = streams_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10017B72C();
    }
  }
  else
  {
    BOOL v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10017B6F8();
    }
  }
  BOOL v11 = 0;
LABEL_30:

  return v11;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1uLL:
      [(SDStreamHandler *)self handleOpenedStream:v6];
      break;
    case 2uLL:
      [(SDStreamHandler *)self handleBytesAvailable];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      [(SDStreamHandler *)self handleSpaceAvailable];
      break;
    case 8uLL:
      uint64_t v8 = streams_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10017B8A8(v6);
      }

      uint64_t v9 = [v6 streamError];
      streamError = self->_streamError;
      self->_streamError = v9;

      goto LABEL_12;
    default:
      if (a4 == 16)
      {
        uint64_t v7 = streams_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stream end encountered, closing streams", v11, 2u);
        }

LABEL_12:
        [(SDStreamHandler *)self _stop];
      }
      break;
  }
}

- (void)setTCPProperties:(id)a3
{
  int v12 = -1;
  BOOL v3 = [a3 propertyForKey:kCFStreamPropertySocketNativeHandle];
  [v3 getBytes:&v12 length:4];
  if (v12 < 0)
  {
    id v4 = streams_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10017B9AC((uint64_t)&v12, v4, v5, v6, v7, v8, v9, v10);
    }
    goto LABEL_7;
  }
  int v11 = 0x4000;
  if (setsockopt(v12, 6, 513, &v11, 4u) == -1)
  {
    id v4 = streams_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10017B92C();
    }
LABEL_7:
  }
}

- (void)handleOpenedStream:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[(NSInputStream *)self->_inputStream streamStatus] >= 2
    && (unint64_t)[(NSOutputStream *)self->_outputStream streamStatus] >= 2)
  {
    uint64_t v5 = streams_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network streams opened", (uint8_t *)&v12, 2u);
    }

    if (!self->_timeOpened)
    {
      uint64_t v6 = +[NSDate date];
      timeOpened = self->_timeOpened;
      self->_timeOpened = v6;
    }
    if (self->_timeToOpen)
    {
      uint64_t v8 = streams_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = +[NSDate date];
        [v9 timeIntervalSinceDate:self->_timeToOpen];
        int v12 = 134217984;
        uint64_t v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Time to open streams = %f", (uint8_t *)&v12, 0xCu);
      }
      timeToOpen = self->_timeToOpen;
      self->_timeToOpen = 0;
    }
    [(SDStreamHandler *)self invalidateOpenTimer];
  }
  if ([v4 isEqual:self->_outputStream]) {
    [(SDStreamHandler *)self setTCPProperties:self->_outputStream];
  }
}

- (void)handleBytesAvailable
{
  BOOL v3 = +[SDStatusMonitor sharedMonitor];
  if ([v3 disableContinuityTLS])
  {

    goto LABEL_5;
  }
  unsigned __int8 v4 = [(SDStreamHandler *)self checkedCert];

  if ((v4 & 1) != 0
    || ([(SDStreamHandler *)self setCheckedCert:1],
        [(SDStreamHandler *)self evaluateCert]))
  {
LABEL_5:
    if ([(SDStreamHandler *)self usingMessages])
    {
      [(SDStreamHandler *)self handleBytesForMessage];
    }
    else
    {
      [(SDStreamHandler *)self handleBytesForStream];
    }
    return;
  }
  uint64_t v5 = streams_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10017BA1C();
  }

  [(SDStreamHandler *)self _stop];
}

- (void)handleSpaceAvailable
{
  BOOL v3 = +[SDStatusMonitor sharedMonitor];
  if ([v3 disableContinuityTLS])
  {

    goto LABEL_5;
  }
  unsigned __int8 v4 = [(SDStreamHandler *)self checkedCert];

  if ((v4 & 1) != 0
    || ([(SDStreamHandler *)self setCheckedCert:1],
        [(SDStreamHandler *)self evaluateCert]))
  {
LABEL_5:
    if ([(SDStreamHandler *)self usingMessages])
    {
      [(SDStreamHandler *)self handleSpaceForMessage];
    }
    else
    {
      [(SDStreamHandler *)self handleSpaceForStream];
    }
    return;
  }
  uint64_t v5 = streams_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10017BA1C();
  }

  [(SDStreamHandler *)self _stop];
}

- (void)writeToStreamWithData:(id)a3
{
  [(NSMutableData *)self->_outputStreamData appendData:a3];
  if (self->_bufferSpaceAvailable && [(NSMutableData *)self->_outputStreamData length] > 0x20000)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      self->_bufferSpaceAvailable = 0;
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 streamHandler:self bufferSpaceChanged:0];
    }
  }
  if ([(SDStreamHandler *)self usingMessages]
    || ![(NSOutputStream *)self->_outputStream hasSpaceAvailable])
  {
    uint64_t v7 = +[SDStatusMonitor sharedMonitor];
    unsigned int v8 = [v7 enableStreamDebugging];

    if (v8)
    {
      uint64_t v9 = streams_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No space available on network output stream, queuing stream data", v10, 2u);
      }
    }
  }
  else
  {
    [(SDStreamHandler *)self handleSpaceForStream];
  }
}

- (void)handleBytesForStream
{
  if ([(SDStreamHandler *)self shouldReadNetwork])
  {
    bzero(buf, 0x8000uLL);
    uint64_t v3 = [(NSInputStream *)self->_inputStream read:buf maxLength:0x8000];
    if (v3 < 1)
    {
      char v5 = streams_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10017BAB8();
      }
    }
    else
    {
      uint64_t v4 = v3;
      char v5 = +[NSData dataWithBytes:buf length:v3];
      if (v5)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          unsigned int v8 = objc_loadWeakRetained((id *)&self->_delegate);
          [v8 streamHandler:self didReceiveStreamData:v5];
        }
        else
        {
          unsigned int v8 = streams_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            sub_10017BA84();
          }
        }
      }
      else
      {
        unsigned int v8 = streams_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10017BA50();
        }
      }

      self->_readFromNetwork += v4;
      uint64_t v9 = +[SDStatusMonitor sharedMonitor];
      unsigned int v10 = [v9 enableStreamDebugging];

      if (v10)
      {
        int v11 = streams_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int64_t readFromNetwork = self->_readFromNetwork;
          int v13 = 134217984;
          int64_t v14 = readFromNetwork;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Total read from network = %ld", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  else
  {
    char v5 = streams_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client buffer full, waiting to read from network", buf, 2u);
    }
  }
}

- (void)handleSpaceForStream
{
  if ([(NSMutableData *)self->_outputStreamData length])
  {
    uint64_t v3 = [(NSOutputStream *)self->_outputStream write:[(NSMutableData *)self->_outputStreamData bytes] maxLength:[(NSMutableData *)self->_outputStreamData length]];
    if (v3 < 1)
    {
      uint64_t v4 = streams_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10017BAEC();
      }
    }
    else
    {
      uint64_t v4 = -[NSMutableData subdataWithRange:](self->_outputStreamData, "subdataWithRange:", v3, (char *)[(NSMutableData *)self->_outputStreamData length] - v3);
      char v5 = +[NSMutableData dataWithData:v4];
      outputStreamData = self->_outputStreamData;
      self->_outputStreamData = v5;

      if (!self->_bufferSpaceAvailable && [(NSMutableData *)self->_outputStreamData length] >> 15 <= 2)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v8 = objc_opt_respondsToSelector();

        if (v8)
        {
          self->_bufferSpaceAvailable = 1;
          id v9 = objc_loadWeakRetained((id *)&self->_delegate);
          [v9 streamHandler:self bufferSpaceChanged:1];
        }
      }
      self->_wroteToNetwork += v3;
      unsigned int v10 = +[SDStatusMonitor sharedMonitor];
      unsigned int v11 = [v10 enableStreamDebugging];

      if (v11)
      {
        int v12 = streams_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int64_t wroteToNetwork = self->_wroteToNetwork;
          int v16 = 134217984;
          int64_t v17 = wroteToNetwork;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Total written to network = %ld", (uint8_t *)&v16, 0xCu);
        }
      }
      [(SDStreamHandler *)self stopIfReady];
    }
  }
  else
  {
    int64_t v14 = +[SDStatusMonitor sharedMonitor];
    unsigned int v15 = [v14 enableStreamDebugging];

    if (!v15) {
      return;
    }
    uint64_t v4 = streams_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No output stream data to write to network", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)sendMessage:(id)a3 withErrorHandler:(id)a4
{
  uint64_t v4 = streams_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10017BB60();
  }
}

- (void)sendMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, void *))a4;
  if ([(SDStreamHandler *)self usingMessages])
  {
    char v8 = [(SDStreamHandler *)self messageWithData:v6];
    if (!v8)
    {
      unsigned int v11 = streams_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10017BB94();
      }

      if (v7)
      {
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Could not create message payload";
        int v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        int v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:91 userInfo:v12];
        v7[2](v7, 0, v13);
      }
      goto LABEL_8;
    }
    [(NSMutableArray *)self->_messageQueue addObject:v8];
    id v9 = [v7 copy];
    [(NSMutableDictionary *)self->_handlers setObject:v9 forKeyedSubscript:v8];

    if ([(NSOutputStream *)self->_outputStream hasSpaceAvailable])
    {
      [(SDStreamHandler *)self handleSpaceForMessage];
LABEL_8:

      goto LABEL_9;
    }
    unsigned int v10 = streams_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No space available on network output stream, queuing message", (uint8_t *)&v14, 2u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Cannot send messages of these streams";
    char v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    unsigned int v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v8];
    v7[2](v7, 0, v10);
    goto LABEL_7;
  }
LABEL_9:
}

- (id)messageWithData:(id)a3
{
  id v4 = a3;
  char v5 = -[SDStreamHandler headerWithLength:](self, "headerWithLength:", [v4 length]);
  [v5 appendData:v4];

  return v5;
}

- (id)headerWithLength:(unsigned int)a3
{
  char v7 = 1;
  id v4 = +[NSMutableData dataWithBytes:&v7 length:1];
  unsigned int v6 = bswap32(a3);
  [v4 appendBytes:&v6 length:4];

  return v4;
}

- (void)handleBytesForMessage
{
  unint64_t inputState = self->_inputState;
  if (inputState)
  {
    if (inputState != 1)
    {
      NSErrorUserInfoKey v15 = streams_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10017BBC8();
      }

      return;
    }
    int64_t bytesRead = self->_bytesRead;
    int64_t v5 = bytesRead + 0x8000;
    int64_t inMessageLength = self->_inMessageLength;
    size_t v7 = inMessageLength - bytesRead;
    if (v5 <= inMessageLength) {
      size_t v8 = 0x8000;
    }
    else {
      size_t v8 = v7;
    }
  }
  else
  {
    size_t v8 = 5;
  }
  id v9 = &buf[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v9, v8);
  uint64_t v10 = [(NSInputStream *)self->_inputStream read:v9 maxLength:v8];
  if (v10 < 1)
  {
    CFStringRef v16 = streams_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v10 < 0)
    {
      if (v17) {
        sub_10017BC30();
      }

      goto LABEL_34;
    }
    if (v17) {
      sub_10017BCB0();
    }
  }
  else
  {
    [(NSMutableData *)self->_inData appendBytes:v9 length:v10];
    self->_bytesRead += v10;
    unsigned int v11 = streams_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v12 = self->_bytesRead;
      unsigned int v13 = self->_inMessageLength;
      if (v13)
      {
        +[NSString stringWithFormat:@" , expected = %d", self->_inMessageLength];
        __int16 v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v14 = &stru_1008E7020;
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v23 = v10;
      __int16 v24 = 2048;
      int64_t v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Read chunk = %ld, total = %ld%@", buf, 0x20u);
      if (v13) {
    }
      }
    unint64_t v18 = self->_inputState;
    if ((unint64_t)v10 >= 5 && !v18)
    {
      [(SDStreamHandler *)self handleHeaderRead];
      unint64_t v18 = self->_inputState;
    }
    if (v18 == 1)
    {
      int64_t v19 = self->_bytesRead;
      int64_t v20 = self->_inMessageLength;
      if (v19 == v20)
      {
        [(SDStreamHandler *)self handleMessageRead];
        return;
      }
      if (v19 > v20)
      {
        v21 = streams_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10017BBFC();
        }

LABEL_34:
        [(SDStreamHandler *)self _stop];
      }
    }
  }
}

- (void)handleHeaderRead
{
  self->_unsigned int inMessageLength = [(SDStreamHandler *)self parseHeader:self->_inData];
  uint64_t v3 = [(SDStreamHandler *)self trimHeader:self->_inData];
  id v4 = +[NSMutableData dataWithData:v3];
  inData = self->_inData;
  self->_inData = v4;

  self->_bytesRead -= 5;
  self->_unint64_t inputState = 1;
  unsigned int v6 = streams_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int inMessageLength = self->_inMessageLength;
    v8[0] = 67109120;
    v8[1] = inMessageLength;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Expected message length = %d", (uint8_t *)v8, 8u);
  }
}

- (void)handleMessageRead
{
  uint64_t v3 = (NSData *)[(NSMutableData *)self->_inData copy];
  inMessage = self->_inMessage;
  self->_inMessage = v3;

  [(SDStreamHandler *)self resetReadState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained streamHandler:self didReceiveMessage:self->_inMessage];
}

- (void)resetReadState
{
  self->_int64_t bytesRead = 0;
  self->_unsigned int inMessageLength = 0;
  uint64_t v3 = (NSMutableData *)objc_opt_new();
  inData = self->_inData;
  self->_inData = v3;

  self->_unint64_t inputState = 0;
}

- (void)handleSpaceForMessage
{
  if ([(NSMutableArray *)self->_messageQueue count])
  {
    p_outMessage = &self->_outMessage;
    outMessage = self->_outMessage;
    if (!outMessage)
    {
      int64_t v5 = [(NSMutableArray *)self->_messageQueue objectAtIndexedSubscript:0];
      unsigned int v6 = self->_outMessage;
      self->_outMessage = v5;

      outMessage = self->_outMessage;
    }
    p_byteIndex = &self->_byteIndex;
    size_t v8 = (char *)[(NSMutableData *)outMessage mutableBytes] + self->_byteIndex;
    NSUInteger v9 = [(NSMutableData *)self->_outMessage length];
    NSUInteger v10 = v9;
    if (v9 - self->_byteIndex >= 0x8000) {
      size_t v11 = 0x8000;
    }
    else {
      size_t v11 = v9 - *p_byteIndex;
    }
    int64_t v12 = (char *)&v32 - ((v11 + 15) & 0x1FFF0);
    bzero(v12, v11);
    memcpy(v12, v8, v11);
    uint64_t v13 = [(NSOutputStream *)self->_outputStream write:v12 maxLength:v11];
    uint64_t v14 = v13;
    if (v13 >= 1)
    {
      NSErrorUserInfoKey v15 = (void *)(*p_byteIndex + v13);
      int64_t *p_byteIndex = (int64_t)v15;
      if (v15 == (void *)[(NSMutableData *)*p_outMessage length])
      {
        CFStringRef v16 = streams_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          NSUInteger v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished writing message of size = %lu", buf, 0xCu);
        }

        [(SDStreamHandler *)self handleMessageWritten:0];
        return;
      }
      unint64_t v23 = *p_byteIndex;
      if (v23 <= [(NSMutableData *)*p_outMessage length]) {
        return;
      }
      __int16 v24 = streams_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10017BCE4(&self->_byteIndex, (id *)&self->_outMessage, v24);
      }

      NSErrorDomain v20 = NSPOSIXErrorDomain;
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      CFStringRef v37 = @"Wrote more bytes than message contained";
      v21 = &v37;
      unsigned int v22 = &v36;
LABEL_23:
      int64_t v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v22, 1, v32, v33);
      __int16 v26 = +[NSError errorWithDomain:v20 code:94 userInfo:v25];
      [(SDStreamHandler *)self handleMessageWritten:v26];

      return;
    }
    unint64_t v18 = streams_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if ((v14 & 0x8000000000000000) == 0)
    {
      if (v19) {
        sub_10017BE04();
      }

      NSErrorDomain v20 = NSPOSIXErrorDomain;
      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      CFStringRef v33 = @"Zero bytes written for message";
      v21 = &v33;
      unsigned int v22 = &v32;
      goto LABEL_23;
    }
    if (v19) {
      sub_10017BD84();
    }

    uint64_t v27 = *__error();
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    int v28 = __error();
    objc_super v29 = +[NSString stringWithFormat:@"%s", strerror(*v28)];
    v35 = v29;
    v30 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v31 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v27 userInfo:v30];
    [(SDStreamHandler *)self handleMessageWritten:v31];
  }
  else
  {
    BOOL v17 = streams_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No messages to write in queue", buf, 2u);
    }
  }
}

- (void)handleMessageWritten:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_handlers objectForKeyedSubscript:self->_outMessage];
  unsigned int v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4 == 0, v4);
    [(NSMutableDictionary *)self->_handlers removeObjectForKey:self->_outMessage];
  }
  else
  {
    size_t v7 = streams_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10017BE38();
    }
  }
  outMessage = self->_outMessage;
  self->_outMessage = 0;

  [(NSMutableArray *)self->_messageQueue removeObjectAtIndex:0];
  self->_byteIndex = 0;
}

- (unsigned)parseHeader:(id)a3
{
  id v3 = a3;
  if (*(unsigned char *)[v3 bytes] == 1)
  {
    unsigned int v4 = bswap32(*(_DWORD *)((char *)[v3 bytes] + 1));
  }
  else
  {
    uint64_t v5 = streams_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10017BE6C();
    }

    unsigned int v4 = -1;
  }

  return v4;
}

- (id)trimHeader:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 subdataWithRange:5, (char *)[v3 length] - 5];

  return v4;
}

- (BOOL)usingMessages
{
  return self->_usingMessages;
}

- (void)setUsingMessages:(BOOL)a3
{
  self->_usingMessages = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (SDStreamHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDStreamHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSInputStream)inputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputStream:(id)a3
{
}

- (BOOL)checkedCert
{
  return self->_checkedCert;
}

- (void)setCheckedCert:(BOOL)a3
{
  self->_checkedCert = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)registeredStreams
{
  return self->_registeredStreams;
}

- (void)setRegisteredStreams:(BOOL)a3
{
  self->_registeredStreams = a3;
}

- (BOOL)bufferSpaceAvailable
{
  return self->_bufferSpaceAvailable;
}

- (void)setBufferSpaceAvailable:(BOOL)a3
{
  self->_bufferSpaceAvailable = a3;
}

- (NSTimer)openTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOpenTimer:(id)a3
{
}

- (BOOL)isClient
{
  return self->_client;
}

- (void)setClient:(BOOL)a3
{
  self->_client = a3;
}

- (NSError)streamError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStreamError:(id)a3
{
}

- (NSMutableData)outputStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutputStreamData:(id)a3
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

- (NSMutableData)outMessage
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOutMessage:(id)a3
{
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHandlers:(id)a3
{
}

- (int64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(int64_t)a3
{
  self->_int64_t bytesRead = a3;
}

- (unsigned)inMessageLength
{
  return self->_inMessageLength;
}

- (void)setInMessageLength:(unsigned int)a3
{
  self->_unsigned int inMessageLength = a3;
}

- (NSData)inMessage
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInMessage:(id)a3
{
}

- (NSMutableData)inData
{
  return (NSMutableData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInData:(id)a3
{
}

- (unint64_t)inputState
{
  return self->_inputState;
}

- (void)setInputState:(unint64_t)a3
{
  self->_unint64_t inputState = a3;
}

- (BOOL)loggedTransfer
{
  return self->_loggedTransfer;
}

- (void)setLoggedTransfer:(BOOL)a3
{
  self->_loggedTransfer = a3;
}

- (int64_t)wroteToNetwork
{
  return self->_wroteToNetwork;
}

- (void)setWroteToNetwork:(int64_t)a3
{
  self->_int64_t wroteToNetwork = a3;
}

- (int64_t)readFromNetwork
{
  return self->_readFromNetwork;
}

- (void)setReadFromNetwork:(int64_t)a3
{
  self->_int64_t readFromNetwork = a3;
}

- (NSDate)timeOpened
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTimeOpened:(id)a3
{
}

- (NSDate)timeToOpen
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTimeToOpen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToOpen, 0);
  objc_storeStrong((id *)&self->_timeOpened, 0);
  objc_storeStrong((id *)&self->_inData, 0);
  objc_storeStrong((id *)&self->_inMessage, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_outMessage, 0);
  objc_storeStrong((id *)&self->_outputStreamData, 0);
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end