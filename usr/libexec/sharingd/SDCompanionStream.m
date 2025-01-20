@interface SDCompanionStream
- (BOOL)clientReceived;
- (BOOL)clientSent;
- (BOOL)initiator;
- (BOOL)networkBufferSpaceAvailable;
- (BOOL)shouldStop;
- (NSData)authorData;
- (NSFileHandle)fileHandle;
- (NSInputStream)clientInputStream;
- (NSMutableData)clientStreamData;
- (NSMutableData)networkStreamData;
- (NSNetServiceBrowser)netServiceBrowser;
- (NSOutputStream)clientOutputStream;
- (NSString)identifier;
- (OS_dispatch_queue)readQueue;
- (OS_dispatch_queue)writeQueue;
- (SDCompanionStream)initWithAuthorData:(id)a3 streamHandler:(id)a4;
- (SDCompanionStream)initWithStreamHandler:(id)a3;
- (SDCompanionStreamDelegate)delegate;
- (SDStreamHandler)streamHandler;
- (id)streamsRequestHandler;
- (int)setBufferSize:(int)a3 socket:(int)a4;
- (int64_t)readFromClient;
- (int64_t)wroteToClient;
- (void)dealloc;
- (void)getStreamsWithCompletionHandler:(id)a3;
- (void)handleOpenedStream;
- (void)handleStreamRequest:(id)a3;
- (void)handleStreamResponse:(id)a3;
- (void)logClientReceived;
- (void)logClientSent;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)notifyStreamRequestWithError:(id)a3;
- (void)readClientStream;
- (void)sendInitialRequest;
- (void)sendInitialResponse:(BOOL)a3;
- (void)setAuthorData:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientInputStream:(id)a3;
- (void)setClientOutputStream:(id)a3;
- (void)setClientReceived:(BOOL)a3;
- (void)setClientSent:(BOOL)a3;
- (void)setClientStreamData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setNetServiceBrowser:(id)a3;
- (void)setNetworkBufferSpaceAvailable:(BOOL)a3;
- (void)setNetworkStreamData:(id)a3;
- (void)setReadFromClient:(int64_t)a3;
- (void)setReadQueue:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamsRequestHandler:(id)a3;
- (void)setWriteQueue:(id)a3;
- (void)setWroteToClient:(int64_t)a3;
- (void)start;
- (void)startBrowser;
- (void)stop;
- (void)stopIfReady;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)streamHandler:(id)a3 bufferSpaceChanged:(BOOL)a4;
- (void)streamHandler:(id)a3 didReceiveMessage:(id)a4;
- (void)streamHandler:(id)a3 didReceiveStreamData:(id)a4;
- (void)streamHandlerDidClose:(id)a3 withError:(id)a4;
- (void)switchToStreaming;
- (void)writeClientStream;
- (void)writeNetworkStream;
@end

@implementation SDCompanionStream

- (SDCompanionStream)initWithStreamHandler:(id)a3
{
  return [(SDCompanionStream *)self initWithAuthorData:0 streamHandler:a3];
}

- (SDCompanionStream)initWithAuthorData:(id)a3 streamHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SDCompanionStream;
  v9 = [(SDCompanionStream *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorData, a3);
    objc_storeStrong((id *)&v10->_streamHandler, a4);
    *(_WORD *)&v10->_initiator = 0;
    v10->_clientSent = 0;
    identifier = v10->_identifier;
    v10->_identifier = 0;

    v10->_clientReceived = 0;
    netServiceBrowser = v10->_netServiceBrowser;
    v10->_netServiceBrowser = 0;

    v10->_networkBufferSpaceAvailable = 1;
    uint64_t v13 = +[NSMutableData data];
    clientStreamData = v10->_clientStreamData;
    v10->_clientStreamData = (NSMutableData *)v13;

    uint64_t v15 = +[NSMutableData data];
    networkStreamData = v10->_networkStreamData;
    v10->_networkStreamData = (NSMutableData *)v15;

    v10->_readFromClient = 0;
    v10->_wroteToClient = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(SDCompanionStream *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDCompanionStream;
  [(SDCompanionStream *)&v3 dealloc];
}

- (void)start
{
  [(SDStreamHandler *)self->_streamHandler setDelegate:self];
  streamHandler = self->_streamHandler;

  [(SDStreamHandler *)streamHandler start];
}

- (void)stop
{
  v2 = self;
  objc_super v3 = [(SDCompanionStream *)v2 streamHandler];

  if (v3)
  {
    v4 = [(SDCompanionStream *)v2 streamHandler];
    [v4 stop];
  }
  v5 = [(SDCompanionStream *)v2 clientInputStream];

  if (v5)
  {
    v6 = [(SDCompanionStream *)v2 clientInputStream];
    [v6 close];

    id v7 = [(SDCompanionStream *)v2 clientInputStream];
    [v7 setDelegate:0];

    [(SDCompanionStream *)v2 setClientInputStream:0];
  }
  id v8 = [(SDCompanionStream *)v2 clientOutputStream];

  if (v8)
  {
    v9 = [(SDCompanionStream *)v2 clientOutputStream];
    [v9 close];

    v10 = [(SDCompanionStream *)v2 clientOutputStream];
    [v10 setDelegate:0];

    [(SDCompanionStream *)v2 setClientOutputStream:0];
  }
  v11 = [(SDCompanionStream *)v2 netServiceBrowser];

  if (v11)
  {
    v12 = [(SDCompanionStream *)v2 netServiceBrowser];
    [v12 stop];

    uint64_t v13 = [(SDCompanionStream *)v2 netServiceBrowser];
    [v13 setDelegate:0];

    [(SDCompanionStream *)v2 setNetServiceBrowser:0];
    v14 = streams_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Stopped net service browser", buf, 2u);
    }
  }
  uint64_t v15 = streams_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client streams closed", v19, 2u);
  }

  v16 = [(SDCompanionStream *)v2 streamHandler];
  if (v16) {
    goto LABEL_16;
  }
  v17 = [(SDCompanionStream *)v2 delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v16 = [(SDCompanionStream *)v2 delegate];
    [v16 companionStreamClosedStreams:v2];
LABEL_16:
  }
}

- (void)stopIfReady
{
  if (self->_shouldStop && ![(NSMutableData *)self->_networkStreamData length])
  {
    [(SDCompanionStream *)self stop];
  }
}

- (void)setBundleID:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"com.apple."])
  {
    [(SDStreamHandler *)self->_streamHandler setBundleID:v4];
  }
  else
  {
    v5 = streams_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Third party app client", v6, 2u);
    }
  }
}

- (void)getStreamsWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id streamsRequestHandler = self->_streamsRequestHandler;
  self->_id streamsRequestHandler = v4;

  [(SDCompanionStream *)self sendInitialRequest];
  [(SDCompanionStream *)self startBrowser];
  self->_initiator = 1;
}

- (void)startBrowser
{
  if (!self->_netServiceBrowser)
  {
    objc_super v3 = (NSNetServiceBrowser *)objc_alloc_init((Class)NSNetServiceBrowser);
    netServiceBrowser = self->_netServiceBrowser;
    self->_netServiceBrowser = v3;

    [(NSNetServiceBrowser *)self->_netServiceBrowser setDelegate:self];
    [(NSNetServiceBrowser *)self->_netServiceBrowser _setIncludesAWDL:1];
    [(NSNetServiceBrowser *)self->_netServiceBrowser searchForServicesOfType:@"_continuity._tcp." inDomain:@"local."];
    v5 = streams_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started net service browser", v6, 2u);
    }
  }
}

- (void)sendInitialRequest
{
  objc_super v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending initial request", buf, 2u);
  }

  v10[0] = @"StreamMessageType";
  v10[1] = @"StreamMessageVersion";
  v11[0] = &off_100902DC0;
  v11[1] = &off_100902DD8;
  v10[2] = @"RequestAuthorData";
  v11[2] = self->_authorData;
  id v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:NSKeyedArchiveRootObjectKey];
  streamHandler = self->_streamHandler;
  id v7 = [v5 encodedData];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DE6E8;
  v8[3] = &unk_1008CA6A8;
  v8[4] = self;
  [(SDStreamHandler *)streamHandler sendMessage:v7 withCompletionHandler:v8];
}

- (void)sendInitialResponse:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = streams_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending initial streams response (accepted = %@)", buf, 0xCu);
  }

  v15[0] = &off_100902DF0;
  v14[0] = @"StreamMessageType";
  v14[1] = @"StreamMessageVersion";
  id v7 = +[NSNumber numberWithInteger:1];
  v15[1] = v7;
  v14[2] = @"CompanionStreamConnectResponse";
  id v8 = +[NSNumber numberWithBool:v3];
  v15[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v10 encodeObject:v9 forKey:NSKeyedArchiveRootObjectKey];
  streamHandler = self->_streamHandler;
  v12 = [v10 encodedData];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001DEA20;
  v13[3] = &unk_1008CA6A8;
  v13[4] = self;
  [(SDStreamHandler *)streamHandler sendMessage:v12 withCompletionHandler:v13];
}

- (void)switchToStreaming
{
  BOOL v3 = streams_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Switched from messages to Streams", v4, 2u);
  }

  [(SDStreamHandler *)self->_streamHandler setUsingMessages:0];
  [(SDCompanionStream *)self writeNetworkStream];
}

- (void)notifyStreamRequestWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_streamsRequestHandler)
  {
    if (v4)
    {
      CFStringRef v6 = streams_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001E0594();
      }

      (*((void (**)(void))self->_streamsRequestHandler + 2))();
    }
    else
    {
      id v8 = [(SDCompanionStream *)self fileHandle];
      if (v8)
      {
        (*((void (**)(void))self->_streamsRequestHandler + 2))();
      }
      else
      {
        v9 = streams_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1001E0560();
        }

        id streamsRequestHandler = (void (**)(id, void, void *))self->_streamsRequestHandler;
        NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
        CFStringRef v15 = @"Could not create streams";
        v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v11];
        streamsRequestHandler[2](streamsRequestHandler, 0, v12);
      }
    }
    id v7 = self->_streamsRequestHandler;
    self->_id streamsRequestHandler = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (self->_initiator)
  {
    id v7 = streams_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No handler for stream request", v13, 2u);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (NSFileHandle)fileHandle
{
  if (self->_fileHandle || self->_clientInputStream || self->_clientOutputStream)
  {
    BOOL v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requested fileHandle more than once.", (uint8_t *)&v16, 2u);
    }
LABEL_6:

    goto LABEL_7;
  }
  *(void *)sock = 0;
  if (socketpair(1, 1, 0, sock))
  {
    BOOL v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1001E0630();
    }
    goto LABEL_6;
  }
  if (![(SDCompanionStream *)self setBufferSize:0x4000 socket:sock[0]]
    || ![(SDCompanionStream *)self setBufferSize:0x4000 socket:sock[1]])
  {
    BOOL v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1001E05FC();
    }
    goto LABEL_6;
  }
  id v6 = objc_alloc((Class)NSFileHandle);
  id v7 = (NSFileHandle *)[v6 initWithFileDescriptor:sock[0]];
  fileHandle = self->_fileHandle;
  self->_fileHandle = v7;

  CFWriteStreamRef writeStream = 0;
  CFReadStreamRef readStream = 0;
  CFStreamCreatePairWithSocket(0, sock[1], &readStream, &writeStream);
  CFStringRef v9 = kCFStreamPropertyShouldCloseNativeSocket;
  CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
  CFWriteStreamSetProperty(writeStream, v9, kCFBooleanTrue);
  clientInputStream = self->_clientInputStream;
  self->_clientInputStream = (NSInputStream *)readStream;

  v11 = self->_clientInputStream;
  v12 = +[NSRunLoop mainRunLoop];
  [(NSInputStream *)v11 scheduleInRunLoop:v12 forMode:NSDefaultRunLoopMode];

  v16.version = 0;
  v16.info = self;
  v16.retain = (void *(__cdecl *)(void *))&_CFRetain;
  v16.release = (void (__cdecl *)(void *))&_CFRelease;
  v16.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
  CFReadStreamSetClient((CFReadStreamRef)self->_clientInputStream, 0x1BuLL, (CFReadStreamClientCallBack)sub_1001DEFEC, &v16);
  [(NSInputStream *)self->_clientInputStream open];
  clientOutputStream = self->_clientOutputStream;
  self->_clientOutputStream = (NSOutputStream *)writeStream;

  NSErrorUserInfoKey v14 = self->_clientOutputStream;
  CFStringRef v15 = +[NSRunLoop mainRunLoop];
  [(NSOutputStream *)v14 scheduleInRunLoop:v15 forMode:NSDefaultRunLoopMode];

  [(NSOutputStream *)self->_clientOutputStream setDelegate:self];
  [(NSOutputStream *)self->_clientOutputStream open];
LABEL_7:
  id v4 = self->_fileHandle;

  return v4;
}

- (int)setBufferSize:(int)a3 socket:(int)a4
{
  int v6 = a3;
  int result = setsockopt(a4, 0xFFFF, 4097, &v6, 4u);
  if ((result & 0x80000000) == 0)
  {
    int result = setsockopt(a4, 0xFFFF, 4098, &v6, 4u);
    if (result >= 0) {
      return 1;
    }
  }
  return result;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v5 = a4;
  int v6 = streams_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Browser found net service = %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)streamHandler:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v17 = 0;
  id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:&v17];

  id v7 = v17;
  id v8 = +[NSSet setWithObject:objc_opt_class()];
  uint64_t v9 = objc_opt_class();
  id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v6 decodeDictionaryWithKeysOfClasses:v8 objectsOfClasses:v10 forKey:NSKeyedArchiveRootObjectKey];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 objectForKeyedSubscript:@"StreamMessageType"];
    NSErrorUserInfoKey v14 = v13;
    if (v13)
    {
      id v15 = [v13 integerValue];
      if (v15 == (id)1)
      {
        [(SDCompanionStream *)self handleStreamResponse:v12];
      }
      else if (!v15)
      {
        [(SDCompanionStream *)self handleStreamRequest:v12];
      }
    }
    else
    {
      CFStreamClientContext v16 = streams_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001E0718();
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v14 = streams_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001E06B0();
    }
  }
}

- (void)handleStreamRequest:(id)a3
{
  id v4 = a3;
  id v5 = streams_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to create streams", buf, 2u);
  }

  id v6 = [v4 objectForKeyedSubscript:@"RequestAuthorData"];

  if (v6)
  {
    id v7 = +[SFCompanionService serviceFromAuthorData:v6];
    id v8 = [v7 identifier];
    identifier = self->_identifier;
    self->_identifier = v8;

    if (v7)
    {
      id v10 = [(SDCompanionStream *)self fileHandle];
      if (v10)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          id v13 = objc_loadWeakRetained((id *)&self->_delegate);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1001DF530;
          v16[3] = &unk_1008CA0C0;
          v16[4] = self;
          [v13 continuationStream:self connectedToService:v7 withFileHandle:v10 acceptHandler:v16];
        }
      }
      else
      {
        id v15 = streams_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1001E0780();
        }

        [(SDCompanionStream *)self sendInitialResponse:0];
      }
    }
    else
    {
      NSErrorUserInfoKey v14 = streams_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001E074C();
      }

      [(SDCompanionStream *)self sendInitialResponse:0];
    }
  }
}

- (void)handleStreamResponse:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"CompanionStreamConnectResponse"];
  id v5 = streams_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 BOOLValue];
    CFStringRef v7 = @"NO";
    if (v6) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received response to create stream (accepted = %@)", buf, 0xCu);
  }

  if ([v4 BOOLValue])
  {
    [(SDCompanionStream *)self switchToStreaming];
    [(SDCompanionStream *)self notifyStreamRequestWithError:0];
  }
  else
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Connection refused";
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:61 userInfo:v8];
    [(SDCompanionStream *)self notifyStreamRequestWithError:v9];

    [(SDCompanionStream *)self stop];
  }
}

- (void)streamHandler:(id)a3 bufferSpaceChanged:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v6 = [(SDCompanionStream *)self networkBufferSpaceAvailable];
  [(SDCompanionStream *)self setNetworkBufferSpaceAvailable:v4];
  if (v4 && (v6 & 1) == 0 && [(NSInputStream *)self->_clientInputStream hasBytesAvailable])
  {
    [(SDCompanionStream *)self readClientStream];
  }
}

- (void)streamHandler:(id)a3 didReceiveStreamData:(id)a4
{
  [(NSMutableData *)self->_networkStreamData appendData:a4];
  if ([(NSMutableData *)self->_networkStreamData length] > 0x20000) {
    [(SDStreamHandler *)self->_streamHandler setShouldReadNetwork:0];
  }

  [(SDCompanionStream *)self writeClientStream];
}

- (void)streamHandlerDidClose:(id)a3 withError:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = streams_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stream handler closed with error = %@", buf, 0xCu);
  }

  CFStringRef v7 = +[SDStatusMonitor sharedMonitor];
  unsigned int v8 = [v7 wirelessEnabled];

  if (!v8)
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Could not create connection, wireless not enabled";
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    NSErrorDomain v10 = NSPOSIXErrorDomain;
    uint64_t v11 = 50;
LABEL_8:
    char v12 = +[NSError errorWithDomain:v10 code:v11 userInfo:v9];
    [(SDCompanionStream *)self notifyStreamRequestWithError:v12];

    goto LABEL_9;
  }
  if (!v5)
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"Connection lost";
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    NSErrorDomain v10 = NSPOSIXErrorDomain;
    uint64_t v11 = 51;
    goto LABEL_8;
  }
  [(SDCompanionStream *)self notifyStreamRequestWithError:v5];
LABEL_9:
  [(SDStreamHandler *)self->_streamHandler setDelegate:0];
  streamHandler = self->_streamHandler;
  self->_streamHandler = 0;

  self->_shouldStop = 1;
  [(SDCompanionStream *)self stopIfReady];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  CFStringRef v7 = v6;
  switch(a4)
  {
    case 1uLL:
      [(SDCompanionStream *)self handleOpenedStream];
      break;
    case 2uLL:
      if (![v6 isEqual:self->_clientInputStream])
      {
        uint64_t v9 = streams_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1001E07B4();
        }
        goto LABEL_17;
      }
      [(SDCompanionStream *)self readClientStream];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      if ([v6 isEqual:self->_clientOutputStream])
      {
        [(SDCompanionStream *)self writeClientStream];
      }
      else
      {
        uint64_t v9 = streams_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received NSStreamEventHasSpaceAvailable on a stream other than an output stream", buf, 2u);
        }
LABEL_17:
      }
      break;
    case 8uLL:
      unsigned int v8 = streams_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001E07E8(v7);
      }
      goto LABEL_12;
    default:
      if (a4 == 16)
      {
        unsigned int v8 = streams_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)NSErrorDomain v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stream end encountered, closing streams", v10, 2u);
        }
LABEL_12:

        [(SDCompanionStream *)self stop];
      }
      break;
  }
}

- (void)handleOpenedStream
{
  if ([(NSInputStream *)self->_clientInputStream streamStatus] == (id)2
    && [(NSOutputStream *)self->_clientOutputStream streamStatus] == (id)2)
  {
    BOOL v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client Streams Opened", v4, 2u);
    }
  }
}

- (void)writeClientStream
{
  if ([(NSOutputStream *)self->_clientOutputStream hasSpaceAvailable]
    && [(NSMutableData *)self->_networkStreamData length])
  {
    uint64_t v3 = [(NSOutputStream *)self->_clientOutputStream write:[(NSMutableData *)self->_networkStreamData bytes] maxLength:[(NSMutableData *)self->_networkStreamData length]];
    if (v3 >= 1)
    {
      if (!self->_clientReceived) {
        [(SDCompanionStream *)self logClientReceived];
      }
      BOOL v4 = -[NSMutableData subdataWithRange:](self->_networkStreamData, "subdataWithRange:", v3, (char *)[(NSMutableData *)self->_networkStreamData length] - v3);
      id v5 = +[NSMutableData dataWithData:v4];
      networkStreamData = self->_networkStreamData;
      self->_networkStreamData = v5;

      if ([(NSMutableData *)self->_networkStreamData length] < 0x18000) {
        [(SDStreamHandler *)self->_streamHandler setShouldReadNetwork:1];
      }
      CFStringRef v7 = +[SDStatusMonitor sharedMonitor];
      unsigned int v8 = [v7 enableStreamDebugging];

      if (v8)
      {
        self->_wroteToClient += v3;
        uint64_t v9 = streams_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int64_t wroteToClient = self->_wroteToClient;
          *(_DWORD *)buf = 134217984;
          int64_t v15 = wroteToClient;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Total written to client = %ld", buf, 0xCu);
        }
      }
      [(SDCompanionStream *)self stopIfReady];

      return;
    }
    char v12 = streams_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001E086C();
    }
LABEL_22:

    return;
  }
  id v13 = +[SDStatusMonitor sharedMonitor];
  if ([v13 enableStreamDebugging])
  {
    unsigned __int8 v11 = [(NSOutputStream *)self->_clientOutputStream hasSpaceAvailable];

    if (v11) {
      return;
    }
    char v12 = streams_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Queueing client write, no space available", buf, 2u);
    }
    goto LABEL_22;
  }
}

- (void)readClientStream
{
  if ([(SDCompanionStream *)self networkBufferSpaceAvailable])
  {
    bzero(buf, 0x4000uLL);
    uint64_t v3 = [(NSInputStream *)self->_clientInputStream read:buf maxLength:0x4000];
    if (v3 < 1)
    {
      unsigned int v8 = streams_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001E08D4();
      }
      goto LABEL_13;
    }
    uint64_t v4 = v3;
    if (!self->_clientSent) {
      [(SDCompanionStream *)self logClientSent];
    }
    clientStreamData = self->_clientStreamData;
    id v6 = +[NSData dataWithBytes:buf length:v4];
    [(NSMutableData *)clientStreamData appendData:v6];

    [(SDCompanionStream *)self writeNetworkStream];
    CFStringRef v7 = +[SDStatusMonitor sharedMonitor];
    LODWORD(v6) = [v7 enableStreamDebugging];

    if (v6)
    {
      self->_readFromClient += v4;
      unsigned int v8 = streams_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int64_t readFromClient = self->_readFromClient;
        int v11 = 134217984;
        int64_t v12 = readFromClient;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Total read from client = %ld", (uint8_t *)&v11, 0xCu);
      }
LABEL_13:
    }
  }
  else
  {
    NSErrorDomain v10 = streams_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Network buffer is full, waiting to read from client", buf, 2u);
    }
  }
}

- (void)writeNetworkStream
{
  if ([(NSMutableData *)self->_clientStreamData length])
  {
    unsigned int v8 = self->_clientStreamData;
    uint64_t v3 = +[NSMutableData data];
    clientStreamData = self->_clientStreamData;
    self->_clientStreamData = v3;

    [(SDStreamHandler *)self->_streamHandler writeToStreamWithData:v8];
  }
  else
  {
    id v5 = +[SDStatusMonitor sharedMonitor];
    unsigned int v6 = [v5 enableStreamDebugging];

    if (v6)
    {
      CFStringRef v7 = streams_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001E0908();
      }
    }
  }
}

- (void)logClientSent
{
  self->_clientSent = 1;
  v2 = streams_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Client has written data", v3, 2u);
  }
}

- (void)logClientReceived
{
  self->_clientReceived = 1;
  v2 = streams_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Client has read data", v3, 2u);
  }
}

- (SDCompanionStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDCompanionStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SDStreamHandler)streamHandler
{
  return (SDStreamHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStreamHandler:(id)a3
{
}

- (NSData)authorData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthorData:(id)a3
{
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)clientSent
{
  return self->_clientSent;
}

- (void)setClientSent:(BOOL)a3
{
  self->_clientSent = a3;
}

- (BOOL)clientReceived
{
  return self->_clientReceived;
}

- (void)setClientReceived:(BOOL)a3
{
  self->_clientReceived = a3;
}

- (BOOL)networkBufferSpaceAvailable
{
  return self->_networkBufferSpaceAvailable;
}

- (void)setNetworkBufferSpaceAvailable:(BOOL)a3
{
  self->_networkBufferSpaceAvailable = a3;
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return (NSNetServiceBrowser *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetServiceBrowser:(id)a3
{
}

- (NSInputStream)clientInputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientInputStream:(id)a3
{
}

- (NSOutputStream)clientOutputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 72, 1);
}

- (void)setClientOutputStream:(id)a3
{
}

- (OS_dispatch_queue)writeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWriteQueue:(id)a3
{
}

- (NSMutableData)networkStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNetworkStreamData:(id)a3
{
}

- (OS_dispatch_queue)readQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setReadQueue:(id)a3
{
}

- (NSMutableData)clientStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientStreamData:(id)a3
{
}

- (int64_t)readFromClient
{
  return self->_readFromClient;
}

- (void)setReadFromClient:(int64_t)a3
{
  self->_int64_t readFromClient = a3;
}

- (int64_t)wroteToClient
{
  return self->_wroteToClient;
}

- (void)setWroteToClient:(int64_t)a3
{
  self->_int64_t wroteToClient = a3;
}

- (id)streamsRequestHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setStreamsRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamsRequestHandler, 0);
  objc_storeStrong((id *)&self->_clientStreamData, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_networkStreamData, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_clientOutputStream, 0);
  objc_storeStrong((id *)&self->_clientInputStream, 0);
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_storeStrong((id *)&self->_authorData, 0);
  objc_storeStrong((id *)&self->_streamHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end