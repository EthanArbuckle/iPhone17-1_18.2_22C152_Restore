@interface W5WiFiSniffManager
- (BOOL)__isCancelled;
- (W5WiFiSniffManager)init;
- (W5WiFiSniffManager)initWithStatusManager:(id)a3 andUserNotificationManager:(id)a4;
- (id)__pendingRequestWithUUID:(id)a3;
- (id)fetchFileHandleForInterface:(id)a3;
- (pcap)openPcapForInterface:(id)a3 datalinkType:(int)a4;
- (void)BhoundBpfFileDescriptor:(id)a3 errorOccurred:(id)a4;
- (void)BhoundBpfFileDescriptor:(id)a3 receivedPacket:(id)a4;
- (void)__nextRequest;
- (void)__setupWatchdogTask;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)startSniffingWithRequest:(id)a3 interfaceName:(id)a4 reply:(id)a5;
- (void)stopSniffingActiveRequestWithError:(id)a3;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5WiFiSniffManager

- (W5WiFiSniffManager)initWithStatusManager:(id)a3 andUserNotificationManager:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)W5WiFiSniffManager;
  v6 = [(W5WiFiSniffManager *)&v12 init];
  v7 = v6;
  if (!a3
    || !v6
    || ((v6->_status = (W5StatusManager *)a3, !a4)
      ? (v8 = 0)
      : (v8 = (W5UserNotificationManager *)a4),
        (v7->_notification = v8,
         dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifivelocity.wifi-sniffer", 0),
         (v7->_queue = (OS_dispatch_queue *)v9) == 0)
     || (v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
         (v7->_pendingRequests = v10) == 0)))
  {

    return 0;
  }
  return v7;
}

- (W5WiFiSniffManager)init
{
}

- (void)dealloc
{
  notification = self->_notification;
  if (notification) {

  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiSniffManager;
  [(W5WiFiSniffManager *)&v5 dealloc];
}

- (void)addRequest:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000573A4;
  v4[3] = &unk_1000DDC30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pendingRequests = self->_pendingRequests;
  id v5 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(pendingRequests);
    }
    dispatch_queue_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "uuid"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057574;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)__setupWatchdogTask
{
  self->_watchdogTask = 0;
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"while kill -0 %d; do sleep 10; done; kill -9 %d;",
         [+[NSProcessInfo processInfo] processIdentifier], [(NSTask *)self->_task processIdentifier]);
  v5[0] = @"-c";
  v5[1] = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100057958;
  v4[3] = &unk_1000DDCA8;
  v4[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", @"/bin/sh", +[NSArray arrayWithObjects:v5 count:2], v4, 0);
}

- (void)__nextRequest
{
  if (!self->_activeRequest && [(NSMutableArray *)self->_pendingRequests count])
  {
    self->_activeRequest = objc_alloc_init(W5WiFiActiveSnifferRequest);
    -[W5WiFiActiveSnifferRequest setRequestInfo:](self->_activeRequest, "setRequestInfo:", [[-[NSMutableArray firstObject](self->_pendingRequests, "firstObject") copy];
    v3 = self->_activeRequest;
    [(NSMutableArray *)self->_pendingRequests removeObjectAtIndex:0];
    v28[4] = self;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v30 = sub_1000582EC;
    v31 = &unk_1000DEB18;
    v32 = self;
    v27[4] = self;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000585E8;
    v28[3] = &unk_1000DEB18;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000587A4;
    v27[3] = &unk_1000DEB40;
    v4 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
    id v5 = [(NSURL *)[(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] outputFile] path];
    if (!v4 || (id v6 = v5) == 0)
    {
      NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v34 = @"W5ParamErr";
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1]);
      v30((uint64_t)v29, 0, (uint64_t)v15);
      return;
    }
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] setTcpDump:1];
    }
    if (!objc_opt_class()) {
      [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] setTcpDump:1];
    }
    if ([(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] monitorMode])
    {
      [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] disassociate];
      [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] setChannel:[(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] channel]];
      uint64_t v7 = sub_10009756C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] channel];
        int v42 = 136315906;
        v43 = "-[W5WiFiSniffManager __nextRequest]";
        __int16 v44 = 2080;
        v45 = "W5WiFiSniffManager.m";
        __int16 v46 = 1024;
        int v47 = 469;
        __int16 v48 = 2114;
        v49 = v8;
        LODWORD(v26) = 38;
        v25 = &v42;
        _os_log_send_and_compose_impl();
      }
      unsigned int v9 = [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] tcpDump];
      v10 = sub_10009756C();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          int v42 = 136315650;
          v43 = "-[W5WiFiSniffManager __nextRequest]";
          __int16 v44 = 2080;
          v45 = "W5WiFiSniffManager.m";
          __int16 v46 = 1024;
          int v47 = 472;
          LODWORD(v26) = 28;
          v25 = &v42;
          _os_log_send_and_compose_impl();
        }
        if ([(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] noAutoStop])
        {
          long long v12 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
          v41[0] = @"-i";
          v41[1] = v4;
          v41[2] = @"-I";
          v41[3] = @"-G";
          v41[4] = +[NSString stringWithFormat:@"%ld", [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] rotationInterval]];
          [(NSArray *)v12 addObjectsFromArray:+[NSArray arrayWithObjects:v41 count:5]];
          if ([(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] maxSize] >= 1)
          {
            v40[0] = @"-C";
            v40[1] = +[NSString stringWithFormat:@"%ld", [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] maxSize]];
            [(NSArray *)v12 addObjectsFromArray:+[NSArray arrayWithObjects:v40 count:2]];
          }
          if ([(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] maxFiles] >= 1)
          {
            v39[0] = @"-W";
            v39[1] = +[NSString stringWithFormat:@"%ld", [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] maxFiles]];
            [(NSArray *)v12 addObjectsFromArray:+[NSArray arrayWithObjects:v39 count:2]];
          }
          if ([(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] snaplen] >= 1)
          {
            v38[0] = @"-s";
            v38[1] = +[NSString stringWithFormat:@"%ld", [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] snaplen]];
            [(NSArray *)v12 addObjectsFromArray:+[NSArray arrayWithObjects:v38 count:2]];
          }
          v37[0] = @"-w";
          v37[1] = v6;
          [(NSArray *)v12 addObjectsFromArray:+[NSArray arrayWithObjects:v37 count:2]];
          [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] duration];
          long long v14 = v12;
          goto LABEL_37;
        }
        v36[0] = @"-i";
        v36[1] = v4;
        v36[2] = @"-I";
        v36[3] = @"-G";
        [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] duration];
        LODWORD(v24) = vcvtpd_s64_f64(v23);
        v36[4] = +[NSString stringWithFormat:@"%d", v24];
        v36[5] = @"-W";
        v36[6] = @"1";
        v36[7] = @"-w";
        v36[8] = v6;
        v21 = v36;
        uint64_t v22 = 9;
LABEL_36:
        long long v14 = +[NSArray arrayWithObjects:v21 count:v22];
        double v13 = 0.0;
LABEL_37:
        +[NSTask runTaskWithLaunchPath:@"/usr/sbin/tcpdump" arguments:v14 timeout:v29 startBlock:0 updateBlock:v28 endBlock:v13];
        return;
      }
      if (v11)
      {
        int v42 = 136315650;
        v43 = "-[W5WiFiSniffManager __nextRequest]";
        __int16 v44 = 2080;
        v45 = "W5WiFiSniffManager.m";
        __int16 v46 = 1024;
        int v47 = 488;
        LODWORD(v26) = 28;
        v25 = &v42;
LABEL_33:
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      unsigned int v16 = [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] tcpDump];
      v17 = sub_10009756C();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          int v42 = 136315650;
          v43 = "-[W5WiFiSniffManager __nextRequest]";
          __int16 v44 = 2080;
          v45 = "W5WiFiSniffManager.m";
          __int16 v46 = 1024;
          int v47 = 512;
          LODWORD(v26) = 28;
          v25 = &v42;
          _os_log_send_and_compose_impl();
        }
        v35[0] = @"-q";
        v35[1] = @"-n";
        v35[2] = @"-i";
        v35[3] = v4;
        v35[4] = @"-I";
        v35[5] = @"-G";
        [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] duration];
        LODWORD(v20) = vcvtpd_s64_f64(v19);
        v35[6] = +[NSString stringWithFormat:@"%d", v20];
        v35[7] = @"-W";
        v35[8] = @"1";
        v35[9] = @"-w";
        v35[10] = v6;
        v21 = v35;
        uint64_t v22 = 11;
        goto LABEL_36;
      }
      if (v18)
      {
        int v42 = 136315650;
        v43 = "-[W5WiFiSniffManager __nextRequest]";
        __int16 v44 = 2080;
        v45 = "W5WiFiSniffManager.m";
        __int16 v46 = 1024;
        int v47 = 516;
        LODWORD(v26) = 28;
        v25 = &v42;
        goto LABEL_33;
      }
    }
    [(W5WiFiSniffManager *)self startSniffingWithRequest:[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] interfaceName:v4 reply:v27];
  }
}

- (BOOL)__isCancelled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_1000589BC;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)teardownAndNotify:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058A7C;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startSniffingWithRequest:(id)a3 interfaceName:(id)a4 reply:(id)a5
{
  [(W5WiFiActiveSnifferRequest *)self->_activeRequest setActiveFileHandle:[(W5WiFiSniffManager *)self fetchFileHandleForInterface:a4]];
  if (![(W5WiFiActiveSnifferRequest *)self->_activeRequest activeFileHandle])
  {
    uint64_t v20 = sub_10009756C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      v27 = "-[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:]";
      __int16 v28 = 2080;
      v29 = "W5WiFiSniffManager.m";
      __int16 v30 = 1024;
      int v31 = 589;
      LODWORD(v22) = 28;
      v21 = &v26;
      _os_log_send_and_compose_impl();
    }
    if (!a5) {
      return;
    }
    NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v39 = @"W5ParamErr";
    BOOL v18 = &v39;
    double v19 = &v38;
LABEL_16:
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, 1, v21, v22));
    goto LABEL_17;
  }
  [-[W5WiFiActiveSnifferRequest setActiveBFD:](self->_activeRequest, "setActiveBFD:", [objc_alloc((Class)BhoundBpfFileDescriptor) initWithFileDescriptor:-[NSFileHandle fileDescriptor](-[W5WiFiActiveSnifferRequest activeFileHandle](self->_activeRequest, "activeFileHandle"), "fileDescriptor"), datalinkType:127, delegate:self, delegateQueue:self->_queue]);
  -[W5WiFiActiveSnifferRequest setActivePCap:](self->_activeRequest, "setActivePCap:", [objc_alloc((Class)BhoundPcap) initWithSaveFileName:[objc_msgSend(objc_msgSend(a3, "outputFile"), "path")] dataLinkTypeValue:127 sizeLimit:0 countLimit:0 circularSaveFiles:0 timestampSaveFiles:0]);
  uint64_t v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(NSFileHandle *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest activeFileHandle] fileDescriptor];
    v10 = [(W5WiFiActiveSnifferRequest *)self->_activeRequest activeBFD];
    BOOL v11 = [(W5WiFiActiveSnifferRequest *)self->_activeRequest activePCap];
    int v26 = 136316418;
    v27 = "-[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:]";
    __int16 v28 = 2080;
    v29 = "W5WiFiSniffManager.m";
    __int16 v30 = 1024;
    int v31 = 599;
    __int16 v32 = 1024;
    unsigned int v33 = v9;
    __int16 v34 = 2114;
    v35 = v10;
    __int16 v36 = 2114;
    v37 = v11;
    LODWORD(v22) = 54;
    v21 = &v26;
    _os_log_send_and_compose_impl();
  }
  if (![(W5WiFiActiveSnifferRequest *)self->_activeRequest activeBFD]
    || ![(W5WiFiActiveSnifferRequest *)self->_activeRequest activePCap])
  {
    if (!a5) {
      return;
    }
    NSErrorUserInfoKey v24 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v25 = @"W5ParamErr";
    BOOL v18 = &v25;
    double v19 = &v24;
    goto LABEL_16;
  }
  [a3 duration];
  if (v12 > 0.0)
  {
    [(W5WiFiActiveSnifferRequest *)self->_activeRequest setTimeoutTimer:dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue)];
    double v13 = [(W5WiFiActiveSnifferRequest *)self->_activeRequest timeoutTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100059004;
    handler[3] = &unk_1000DDC80;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
    long long v14 = [(W5WiFiActiveSnifferRequest *)self->_activeRequest timeoutTimer];
    [a3 duration];
    dispatch_time_t v16 = dispatch_time(0, 1000000000 * (uint64_t)v15);
    dispatch_source_set_timer((dispatch_source_t)v14, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)[(W5WiFiActiveSnifferRequest *)self->_activeRequest timeoutTimer]);
  }
  [(BhoundBpfFileDescriptor *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest activeBFD] resume];
  if (a5)
  {
    v17 = 0;
LABEL_17:
    (*((void (**)(id, NSError *))a5 + 2))(a5, v17);
  }
}

- (void)stopSniffingActiveRequestWithError:(id)a3
{
  activeRequest = self->_activeRequest;
  if (activeRequest && [(W5WiFiActiveSnifferRequest *)activeRequest activeBFD])
  {
    [(BhoundBpfFileDescriptor *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest activeBFD] cancel];
    if ([(W5WiFiActiveSnifferRequest *)self->_activeRequest timeoutTimer]
      && !dispatch_source_testcancel((dispatch_source_t)[(W5WiFiActiveSnifferRequest *)self->_activeRequest timeoutTimer]))
    {
      dispatch_source_cancel((dispatch_source_t)[(W5WiFiActiveSnifferRequest *)self->_activeRequest timeoutTimer]);
    }
    if ([(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] reply])
    {
      uint64_t v6 = [(W5WiFiSnifferRequest *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest requestInfo] reply];
      v6[2](v6, a3);
    }
    [(BhoundPcap *)[(W5WiFiActiveSnifferRequest *)self->_activeRequest activePCap] shutdown];

    self->_activeRequest = 0;
    [(W5WiFiSniffManager *)self __nextRequest];
  }
}

- (id)fetchFileHandleForInterface:(id)a3
{
  char v3 = [(W5WiFiSniffManager *)self openPcapForInterface:a3 datalinkType:127];
  if (!v3) {
    return 0;
  }
  uint64_t selectable_fd = pcap_get_selectable_fd(v3);
  if ((selectable_fd & 0x80000000) != 0) {
    return 0;
  }
  id v5 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:selectable_fd closeOnDealloc:1];

  return v5;
}

- (void)BhoundBpfFileDescriptor:(id)a3 receivedPacket:(id)a4
{
  if (a4 && [(W5WiFiActiveSnifferRequest *)self->_activeRequest activePCap])
  {
    uint64_t v6 = [(W5WiFiActiveSnifferRequest *)self->_activeRequest activePCap];
    [(BhoundPcap *)v6 savePacket:a4];
  }
}

- (void)BhoundBpfFileDescriptor:(id)a3 errorOccurred:(id)a4
{
  uint64_t v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315906;
    v10 = "-[W5WiFiSniffManager BhoundBpfFileDescriptor:errorOccurred:]";
    __int16 v11 = 2080;
    double v12 = "W5WiFiSniffManager.m";
    __int16 v13 = 1024;
    int v14 = 668;
    __int16 v15 = 2114;
    id v16 = a4;
    LODWORD(v8) = 38;
    uint64_t v7 = &v9;
    _os_log_send_and_compose_impl();
  }
  -[W5WiFiSniffManager stopSniffingActiveRequestWithError:](self, "stopSniffingActiveRequestWithError:", a4, v7, v8);
}

- (pcap)openPcapForInterface:(id)a3 datalinkType:(int)a4
{
  id v5 = pcap_create((const char *)[a3 UTF8String], v9);
  if (pcap_set_snaplen(v5, 0x80000)) {
    return 0;
  }
  pcap_set_promisc(v5, 1);
  if (pcap_set_timeout(v5, 0)
    || (a4 - 105) <= 0x3A
    && ((1 << (a4 - 105)) & 0x40000000040C001) != 0
    && pcap_set_rfmon(v5, 1))
  {
    return 0;
  }
  pcap_activate(v5);
  if (pcap_set_datalink(v5, a4)) {
    return 0;
  }
  int selectable_fd = pcap_get_selectable_fd(v5);
  int v8 = 1;
  if (ioctl(selectable_fd, 0x80044270uLL, &v8)) {
    return 0;
  }
  else {
    return v5;
  }
}

@end