@interface W5XPCConnection
- (BOOL)isAdvertising;
- (BOOL)isBrowsing;
- (NSArray)activeRequests;
- (NSArray)eventIDs;
- (NSSet)faultEventMonitoringPeers;
- (NSString)processName;
- (NSURL)additionalLog;
- (NSUUID)uuid;
- (NSXPCConnection)connection;
- (W5XPCConnection)initWithXPCConnection:(id)a3;
- (W5XPCConnectionDelegate)delegate;
- (id)__activeRequestWithUUID:(id)a3;
- (void)__logMessage:(id)a3 timestamped:(BOOL)a4;
- (void)cancelAllRequestsAndReply:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 OnPeer:(id)a4 OfType:(int64_t)a5 reply:(id)a6;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)collectLogs:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)collectLogsDiagnosticMode:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5;
- (void)log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5;
- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5;
- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4;
- (void)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5;
- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4;
- (void)queryLocalPeerAndReply:(id)a3;
- (void)queryPeerCacheAndReply:(id)a3;
- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3;
- (void)queryStatusForPeer:(id)a3 reply:(id)a4;
- (void)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5;
- (void)runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)runWiFiPerformanceLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startAdvertisingAndReply:(id)a3;
- (void)startBrowsingAndReply:(id)a3;
- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4;
- (void)startMonitoringEvents:(id)a3 reply:(id)a4;
- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)startPeerDiscoveryWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)stopAdvertisingAndReply:(id)a3;
- (void)stopBrowsingAndReply:(id)a3;
- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5;
- (void)stopMonitoringEvents:(id)a3 reply:(id)a4;
- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)stopPeerDiscoveryWithUUID:(id)a3 reply:(id)a4;
- (void)submitFaultEvent:(id)a3 reply:(id)a4;
- (void)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5;
@end

@implementation W5XPCConnection

- (W5XPCConnection)initWithXPCConnection:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)W5XPCConnection;
  v4 = [(W5XPCConnection *)&v16 init];
  v5 = v4;
  if (!a3) {
    goto LABEL_12;
  }
  if (!v4) {
    goto LABEL_12;
  }
  v6 = (NSXPCConnection *)a3;
  v5->_connection = v6;
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath([(NSXPCConnection *)v6 processIdentifier], buffer, 0x1000u) < 1) {
    goto LABEL_12;
  }
  id v7 = [objc_alloc((Class)NSString) initWithCString:buffer encoding:4];
  if (!v7) {
    goto LABEL_12;
  }
  v8 = (NSString *)[[[v7 lastPathComponent] copy];
  v5->_processName = v8;
  if (!v8) {
    goto LABEL_12;
  }
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifivelocity.xpc-connection", 0);
  v5->_queue = (OS_dispatch_queue *)v9;
  if (!v9) {
    goto LABEL_12;
  }
  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_mutableActiveRequests = v10;
  if (!v10) {
    goto LABEL_12;
  }
  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_mutableEventIDs = v11;
  if (!v11
    || (v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet),
        (v5->_mutableFaultEventMonitoringPeers = v12) == 0)
    || (v13 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter), (v5->_formatter = v13) == 0)
    || ([(NSDateFormatter *)v13 setDateFormat:@"MM/dd/yy HH:mm:ss.SSS"],
        v14 = +[NSUUID UUID],
        (v5->_uuid = v14) == 0))
  {
LABEL_12:

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)W5XPCConnection;
  [(W5XPCConnection *)&v4 dealloc];
}

- (NSArray)activeRequests
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  dispatch_queue_t v9 = sub_100084D2C;
  v10 = sub_100084D3C;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084D48;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)eventIDs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  dispatch_queue_t v9 = sub_100084D2C;
  v10 = sub_100084D3C;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084E8C;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)faultEventMonitoringPeers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  dispatch_queue_t v9 = sub_100084D2C;
  v10 = sub_100084D3C;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084FD0;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBrowsing
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000850D0;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAdvertising
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000851C0;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSURL)additionalLog
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_100084D2C;
  v10 = sub_100084D3C;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000852F4;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__activeRequestWithUUID:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mutableActiveRequests = self->_mutableActiveRequests;
  id v5 = [(NSMutableArray *)mutableActiveRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(mutableActiveRequests);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v9, "uuid")))
        {
          id v5 = [v9 copy];
          return v5;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [(NSMutableArray *)mutableActiveRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (void)__logMessage:(id)a3 timestamped:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_additionalLogURL)
  {
    fileHandle = self->_fileHandle;
  }
  else
  {
    uint64_t v8 = (NSURL *)[+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:[+[NSUUID UUID] UUIDString]] stringByAppendingPathExtension:@"log"]) copy];
    self->_additionalLogURL = v8;
    if (!v8) {
      return;
    }
    if (![+[NSFileManager defaultManager] createFileAtPath:[(NSURL *)self->_additionalLogURL path] contents:0 attributes:0])return; {
    fileHandle = +[NSFileHandle fileHandleForWritingAtPath:[(NSURL *)self->_additionalLogURL path]];
    }
    self->_fileHandle = fileHandle;
    if (!fileHandle) {
      return;
    }
  }
  [(NSFileHandle *)fileHandle seekToEndOfFile];
  if (v4) {
    char v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@\n", [(NSDateFormatter *)self->_formatter stringFromDate:+[NSDate date]], a3);
  }
  else {
    char v9 = +[NSString stringWithFormat:@"%@\n", a3, v10];
  }
  [(NSFileHandle *)self->_fileHandle writeData:[(NSString *)v9 dataUsingEncoding:4]];
}

- (void)startMonitoringEvents:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085728;
  block[3] = &unk_1000DDC58;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopMonitoringEvents:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000858D8;
  block[3] = &unk_1000DDC58;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryLocalPeerAndReply:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100085A84;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)queryStatusForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085B44;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085C08;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085CCC;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085D90;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085E54;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085F18;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085FE0;
  block[3] = &unk_1000DE1B8;
  block[4] = a5;
  block[5] = a4;
  block[6] = self;
  void block[7] = a3;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100086270;
  v8[3] = &unk_1000DE168;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  v8[8] = a4;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000864FC;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000865C0;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100086680;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086740;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100086804;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000868C8;
  v6[3] = &unk_1000DE050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)collectLogs:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086990;
  block[3] = &unk_1000DE1B8;
  block[4] = a5;
  block[5] = a4;
  block[6] = self;
  void block[7] = a3;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)collectLogsDiagnosticMode:(id)a3 uuid:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100086C20;
  v6[3] = &unk_1000DE050;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)startPeerDiscoveryWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100086EB0;
  v6[3] = &unk_1000DE050;
  v6[4] = a4;
  v6[5] = self;
  v6[6] = a3;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)stopPeerDiscoveryWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000870F8;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000871C4;
  v8[3] = &unk_1000DF240;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  *(double *)&v8[9] = a4;
  v8[8] = a7;
  dispatch_async(queue, v8);
}

- (void)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008743C;
  v8[3] = &unk_1000DF240;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  *(double *)&v8[9] = a4;
  v8[8] = a7;
  dispatch_async(queue, v8);
}

- (void)runWiFiPerformanceLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000876A4;
  v6[3] = &unk_1000DE050;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087910;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)cancelAllRequestsAndReply:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100087B28;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)cancelRequestWithUUID:(id)a3 OnPeer:(id)a4 OfType:(int64_t)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087D94;
  block[3] = &unk_1000DF290;
  void block[7] = a6;
  block[8] = a5;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100087E84;
  v6[3] = &unk_1000DF2B8;
  v6[4] = self;
  v6[5] = a3;
  BOOL v7 = a4;
  v6[6] = a5;
  dispatch_async(queue, v6);
}

- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087F5C;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088084;
  block[3] = &unk_1000DDC58;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)submitFaultEvent:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088170;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088234;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryPeerCacheAndReply:(id)a3
{
}

- (void)startAdvertisingAndReply:(id)a3
{
}

- (void)startBrowsingAndReply:(id)a3
{
}

- (void)stopAdvertisingAndReply:(id)a3
{
}

- (void)stopBrowsingAndReply:(id)a3
{
}

- (W5XPCConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (W5XPCConnectionDelegate *)a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

@end