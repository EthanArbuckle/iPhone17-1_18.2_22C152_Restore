@interface PTPDeviceUSBTransport
- (BOOL)busy;
- (BOOL)connected;
- (BOOL)delegateNeedsData;
- (BOOL)delegateNeedsResponse;
- (BOOL)handleBulkData:(unint64_t)a3 result:(int)a4;
- (BOOL)processDeviceInterface:(unsigned int)a3;
- (BOOL)sendCancel:(id)a3;
- (BOOL)sendEvent:(id)a3;
- (BOOL)sendEvents;
- (BOOL)sendNextEvent;
- (BOOL)sendRequest:(id)a3 needsData:(BOOL)a4;
- (BOOL)sendResponse:(id)a3;
- (BOOL)startResponder;
- (BOOL)timedOut;
- (NSMutableArray)eventArray;
- (NSMutableData)eventData;
- (NSMutableData)transactionData;
- (NSString)usbSerialNumberString;
- (OS_dispatch_queue)connectionTimerQueue;
- (OS_dispatch_queue)transportQueue;
- (OS_dispatch_source)connectionTimer;
- (PTPDeviceUSBCore)usbCore;
- (PTPDeviceUSBTransport)initWithDelegate:(id)a3;
- (char)eventDataBuffer;
- (char)readBuffer;
- (char)writeBuffer;
- (id)delegate;
- (id)description;
- (int)connectionStatus;
- (int)handleDeviceRequest:(id *)a3 data:(__IOUSBDeviceData *)a4 dataSize:(unint64_t *)a5 status:(int *)a6;
- (int)maxPacketSizeBulkIn;
- (int)maxPacketSizeBulkOut;
- (int)maxPacketSizeInterruptIn;
- (int)readBulkData;
- (int)readInterruptData;
- (int)role;
- (int)setupDeviceInterface;
- (int)status;
- (int)writeBulkData:(id)a3;
- (int)writeInterruptData:(id)a3;
- (unint64_t)bulkPipeIn;
- (unint64_t)bulkPipeOut;
- (unint64_t)interruptPipeIn;
- (unsigned)canceledTransactionID;
- (unsigned)deviceStatus;
- (unsigned)eventDataBufferSize;
- (unsigned)locationID;
- (unsigned)numberOfSendEventsTimedOut;
- (unsigned)productID;
- (unsigned)readBufferSize;
- (unsigned)transactionCanceled:(unsigned int)a3;
- (unsigned)transactionID;
- (unsigned)type;
- (unsigned)vendorID;
- (unsigned)writeBufferSize;
- (void)abortInterruptWrite:(id)a3;
- (void)abortPendingIO;
- (void)activate:(unsigned int)a3;
- (void)cancelTransaction:(id)a3;
- (void)checkInterruptWriteCompletion:(id)a3;
- (void)clearDeviceInterface;
- (void)deactivate;
- (void)dealloc;
- (void)deviceAdded:(unsigned int)a3;
- (void)handleInterruptData:(unint64_t)a3;
- (void)handleWriteInterruptDataCompletion:(id)a3;
- (void)sendData:(id)a3;
- (void)sendDataPackets:(id)a3;
- (void)sendDataPacketsSplit:(id)a3;
- (void)setBulkPipeIn:(unint64_t)a3;
- (void)setBulkPipeOut:(unint64_t)a3;
- (void)setBusy:(BOOL)a3;
- (void)setCanceledTransactionID:(unsigned int)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionStatus:(int)a3;
- (void)setConnectionTimer:(id)a3;
- (void)setConnectionTimerQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateNeedsData:(BOOL)a3;
- (void)setDelegateNeedsResponse:(BOOL)a3;
- (void)setEventArray:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventDataBuffer:(char *)a3;
- (void)setEventDataBufferSize:(unsigned int)a3;
- (void)setInterruptPipeIn:(unint64_t)a3;
- (void)setLocationID:(unsigned int)a3;
- (void)setMaxPacketSizeBulkIn:(int)a3;
- (void)setMaxPacketSizeBulkOut:(int)a3;
- (void)setMaxPacketSizeInterruptIn:(int)a3;
- (void)setNumberOfSendEventsTimedOut:(unsigned int)a3;
- (void)setProductID:(unsigned __int16)a3;
- (void)setReadBuffer:(char *)a3;
- (void)setReadBufferSize:(unsigned int)a3;
- (void)setRole:(int)a3;
- (void)setSendEvents:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTransactionData:(id)a3;
- (void)setTransactionID:(unsigned int)a3;
- (void)setTransportQueue:(id)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setUsbCore:(PTPDeviceUSBCore *)a3;
- (void)setUsbSerialNumberString:(id)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setWriteBuffer:(char *)a3;
- (void)setWriteBufferSize:(unsigned int)a3;
- (void)stop;
- (void)waitForHostConnection:(BOOL)a3;
@end

@implementation PTPDeviceUSBTransport

- (PTPDeviceUSBTransport)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTPDeviceUSBTransport;
  v5 = [(PTPDeviceUSBTransport *)&v20 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    v5->_role = 0;
    objc_storeWeak(&v5->_delegate, v4);
    v6->_locationID = 0;
    v7 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0];
    transactionData = v6->_transactionData;
    v6->_transactionData = v7;

    v9 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0];
    eventData = v6->_eventData;
    v6->_eventData = v9;

    v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    eventArray = v6->_eventArray;
    v6->_eventArray = v11;

    v6->_writeBufferSize = dword_10005E438;
    v6->_readBufferSize = 0x4000;
    v6->_eventDataBuffer = 0;
    *(_OWORD *)&v6->_usbCore._notificationPort = 0u;
    *(_OWORD *)&v6->_writeDataRef = 0u;
    v6->_writeBuffer = 0;
    v6->_readBuffer = 0;
    v6->_sendEvents = 1;
    connectionTimer = v6->_connectionTimer;
    v6->_connectionTimer = 0;
    v6->_numberOfSendEventsTimedOut = 0;
    v6->_eventDataBufferSize = 196608;
    v6->_canceledTransactionID = -1;
    v6->_cancelLock._os_unfair_lock_opaque = 0;

    dispatch_queue_t v14 = dispatch_queue_create("ptp.connectionTimer_queue", 0);
    connectionTimerQueue = v6->_connectionTimerQueue;
    v6->_connectionTimerQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v17 = dispatch_queue_create("PTPDeviceUSBTransportQueue", v16);
    transportQueue = v6->_transportQueue;
    v6->_transportQueue = (OS_dispatch_queue *)v17;
  }
  return v6;
}

- (void)dealloc
{
  [(PTPDeviceUSBTransport *)self setDelegate:0];
  [(PTPDeviceUSBTransport *)self waitForHostConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)PTPDeviceUSBTransport;
  [(PTPDeviceUSBTransport *)&v3 dealloc];
}

- (BOOL)startResponder
{
  __ICOSLogCreate();
  objc_super v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v4 = [&stru_100048E60 substringWithRange:0, 18];
    objc_super v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = +[NSString stringWithFormat:@"---"];
  v6 = (os_log_t *)&_gICOSLog;
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v3;
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v75 = [(__CFString *)v8 UTF8String];
    __int16 v76 = 2114;
    v77 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if ([(PTPDeviceUSBTransport *)self role])
  {
    __ICOSLogCreate();
    v10 = @"<PTP>";
    if ((unint64_t)[(__CFString *)v10 length] >= 0x15)
    {
      v11 = -[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18);
      uint64_t v12 = [v11 stringByAppendingString:@".."];

      v10 = (__CFString *)v12;
    }
    v13 = +[NSString stringWithFormat:@"PTP Service Did Not Start\n"];
    dispatch_queue_t v14 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    v15 = v10;
    v16 = v14;
    id v17 = [(__CFString *)v15 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v75 = v17;
    __int16 v76 = 2114;
    v77 = v13;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_11:
    return 0;
  }
  if (self->_type != 1) {
    return 0;
  }
  __ICOSLogCreate();
  objc_super v20 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v21 = [&stru_100048E60 substringWithRange:0, 18];
    objc_super v20 = [v21 stringByAppendingString:@".."];
  }
  v22 = +[NSString stringWithFormat:@"PTP Service Starting"];
  v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v20;
    v25 = v23;
    id v26 = [(__CFString *)v24 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v75 = v26;
    __int16 v76 = 2114;
    v77 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v73 = 0;
  vproc_swap_integer();
  *(void *)mainPort = 0;
  CFMutableDictionaryRef v27 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v27)
  {
    __ICOSLogCreate();
    v10 = @"<USB>";
    if ((unint64_t)[(__CFString *)v10 length] >= 0x15)
    {
      v37 = -[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18);
      uint64_t v38 = [v37 stringByAppendingString:@".."];

      v10 = (__CFString *)v38;
    }
    v13 = +[NSString stringWithFormat:@"PTP Service Matching Failed"];
    v39 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
LABEL_31:
    v40 = v10;
    v16 = v39;
    id v41 = [(__CFString *)v40 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v75 = v41;
    __int16 v76 = 2114;
    v77 = v13;
    goto LABEL_10;
  }
  CFMutableDictionaryRef v28 = v27;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFRelease(v28);
    __ICOSLogCreate();
    v10 = @"<USB>";
    if ((unint64_t)[(__CFString *)v10 length] >= 0x15)
    {
      v42 = -[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18);
      uint64_t v43 = [v42 stringByAppendingString:@".."];

      v10 = (__CFString *)v43;
    }
    v13 = +[NSString stringWithFormat:@"PTP Service PropDict Failed"];
    v39 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
  v30 = Mutable;
  CFDictionarySetValue(Mutable, @"USBDeviceFunction", @"PTP");
  CFDictionarySetValue(v28, @"IOPropertyMatch", v30);
  CFRelease(v30);
  if (IOMainPort(bootstrap_port, &mainPort[1]) || !mainPort[1])
  {
    __ICOSLogCreate();
    v44 = @"<USB>";
    if ((unint64_t)[(__CFString *)v44 length] >= 0x15)
    {
      v45 = -[__CFString substringWithRange:](v44, "substringWithRange:", 0, 18);
      uint64_t v46 = [v45 stringByAppendingString:@".."];

      v44 = (__CFString *)v46;
    }
    v47 = +[NSString stringWithFormat:@"MainPort Alocation Failed\n"];
    v48 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v44;
      v50 = v48;
      id v51 = [(__CFString *)v49 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v75 = v51;
      __int16 v76 = 2114;
      v77 = v47;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    CFRelease(v28);
    return 0;
  }
  v31 = IONotificationPortCreate(mainPort[1]);
  self->_usbCore._notificationPort = v31;
  IONotificationPortSetDispatchQueue(v31, (dispatch_queue_t)self->_transportQueue);
  if (IOServiceAddMatchingNotification(self->_usbCore._notificationPort, "IOServicePublish", v28, (IOServiceMatchingCallback)sub_10000387C, self, mainPort))
  {
    __ICOSLogCreate();
    v10 = @"<USB>";
    if ((unint64_t)[(__CFString *)v10 length] >= 0x15)
    {
      v32 = -[__CFString substringWithRange:](v10, "substringWithRange:", 0, 18);
      uint64_t v33 = [v32 stringByAppendingString:@".."];

      v10 = (__CFString *)v33;
    }
    v13 = +[NSString stringWithFormat:@"Matching Notification Failed\n"];
    v34 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    v35 = v10;
    v16 = v34;
    id v36 = [(__CFString *)v35 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v75 = v36;
    __int16 v76 = 2114;
    v77 = v13;
    goto LABEL_10;
  }
  uint64_t v52 = IOIteratorNext(mainPort[0]);
  if (v52)
  {
    uint64_t v53 = v52;
    do
    {
      __ICOSLogCreate();
      v54 = @"<USB>";
      if ((unint64_t)[(__CFString *)v54 length] >= 0x15)
      {
        v55 = -[__CFString substringWithRange:](v54, "substringWithRange:", 0, 18);
        uint64_t v56 = [v55 stringByAppendingString:@".."];

        v54 = (__CFString *)v56;
      }
      v57 = +[NSString stringWithFormat:@"[Adding 0x%x] -->(IOMatchedOnLaunch) ", mainPort[0]];
      os_log_t v58 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v59 = v6;
        v60 = v54;
        v61 = v58;
        v62 = v60;
        v6 = v59;
        id v63 = [(__CFString *)v62 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v75 = v63;
        __int16 v76 = 2114;
        v77 = v57;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [(PTPDeviceUSBTransport *)self deviceAdded:v53];
      uint64_t v53 = IOIteratorNext(mainPort[0]);
    }
    while (v53);
  }
  __ICOSLogCreate();
  v64 = @"<PTP>";
  if ((unint64_t)[(__CFString *)v64 length] >= 0x15)
  {
    v65 = -[__CFString substringWithRange:](v64, "substringWithRange:", 0, 18);
    uint64_t v66 = [v65 stringByAppendingString:@".."];

    v64 = (__CFString *)v66;
  }
  v67 = +[NSString stringWithFormat:@"Service Started"];
  os_log_t v68 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v69 = v64;
    v70 = v68;
    id v71 = [(__CFString *)v69 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v75 = v71;
    __int16 v76 = 2114;
    v77 = v67;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  BOOL v18 = 1;
  [(PTPDeviceUSBTransport *)self setRole:1];
  return v18;
}

- (void)stop
{
  [(PTPDeviceUSBTransport *)self waitForHostConnection:0];
  __ICOSLogCreate();
  objc_super v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v4 = [[&stru_100048E60 substringWithRange:0, 18];
    objc_super v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = +[NSString stringWithFormat:@"Service Stopped"];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v16 = [(__CFString *)v7 UTF8String];
    __int16 v17 = 2114;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if ([(PTPDeviceUSBTransport *)self role] == 1)
  {
    [(PTPDeviceUSBTransport *)self setRole:0];
    [(PTPDeviceUSBTransport *)self setConnected:0];
    io_object_t notification = self->_usbCore._notification;
    if (notification)
    {
      IOObjectRelease(notification);
      self->_usbCore._io_object_t notification = 0;
    }
    notificationPort = self->_usbCore._notificationPort;
    if (notificationPort)
    {
      IONotificationPortSetDispatchQueue(notificationPort, 0);
      self->_usbCore._notificationPort = 0;
    }
    deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
    if (deviceInterfaceInterfaceRef)
    {
      int v14 = 0;
      *(_DWORD *)buf = 0;
      (*((void (**)(IOUSBDeviceInterfaceInterface **, uint8_t *, int *))*deviceInterfaceInterfaceRef + 36))(deviceInterfaceInterfaceRef, buf, &v14);
      if (*(_DWORD *)buf) {
        [(PTPDeviceUSBTransport *)self deactivate];
      }
      (*((void (**)(IOUSBDeviceInterfaceInterface **, void))*self->_usbCore._deviceInterfaceInterfaceRef + 5))(self->_usbCore._deviceInterfaceInterfaceRef, 0);
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 3))(self->_usbCore._deviceInterfaceInterfaceRef);
      self->_usbCore._deviceInterfaceInterfaceRef = 0;
    }
  }
  uint64_t v12 = sub_10000B5F8();
  v13 = [v12 delegate];

  if (v13) {
    [v12 setDelegate:0];
  }
  exit(0);
}

- (void)activate:(unsigned int)a3
{
  uint64_t v77 = 0;
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, char *, uint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
        + 36))(self->_usbCore._deviceInterfaceInterfaceRef, (char *)&v77 + 4, &v77))
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = HIDWORD(v77) == 1;
  }
  if (v4)
  {
    __ICOSLogCreate();
    v5 = @"<USB>";
    if ((unint64_t)[(__CFString *)v5 length] >= 0x15)
    {
      v6 = -[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18);
      uint64_t v7 = [v6 stringByAppendingString:@".."];

      v5 = (__CFString *)v7;
    }
    v8 = +[NSString stringWithFormat:@"✅ <activated> at %d speed", v77];
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v5;
      v11 = v9;
      id v12 = [(__CFString *)v10 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v79 = v12;
      __int16 v80 = 2114;
      v81 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, void, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
        + 26))(self->_usbCore._deviceInterfaceInterfaceRef, self->_readBufferSize, &self->_readDataRef))
  {
    __ICOSLogCreate();
    v13 = @"<USB>";
    int v14 = v13;
    if ((unint64_t)[(__CFString *)v13 length] >= 0x15)
    {
      v15 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
      int v14 = [v15 stringByAppendingString:@".."];
    }
    id v16 = +[NSString stringWithFormat:@"❌ ifIfRef->createData read(%8d)", self->_readBufferSize];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  self->_readBuffer = (char *)IOUSBDeviceDataGetBytePtr();
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, void, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
        + 26))(self->_usbCore._deviceInterfaceInterfaceRef, self->_writeBufferSize, &self->_writeDataRef))
  {
    __ICOSLogCreate();
    v25 = @"<USB>";
    id v26 = v25;
    if ((unint64_t)[(__CFString *)v25 length] >= 0x15)
    {
      CFMutableDictionaryRef v27 = -[__CFString substringWithRange:](v25, "substringWithRange:", 0, 18);
      id v26 = [v27 stringByAppendingString:@".."];
    }
    CFMutableDictionaryRef v28 = +[NSString stringWithFormat:@"❌ ifIfRef->createData write(%8d)", self->_writeBufferSize];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030884();
    }

    dword_10005E438 = 0x100000;
    self->_writeBufferSize = 0x100000;
    __ICOSLogCreate();
    v29 = v25;
    v30 = v29;
    if ((unint64_t)[(__CFString *)v29 length] >= 0x15)
    {
      v31 = -[__CFString substringWithRange:](v29, "substringWithRange:", 0, 18);
      v30 = [v31 stringByAppendingString:@".."];
    }
    v32 = +[NSString stringWithFormat:@"Attempting smaller allocation... %d", 0x100000];
    uint64_t v33 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = v30;
      v35 = v33;
      id v36 = [v34 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v79 = v36;
      __int16 v80 = 2114;
      v81 = v32;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, void, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
          + 26))(self->_usbCore._deviceInterfaceInterfaceRef, self->_writeBufferSize, &self->_writeDataRef))
    {
      __ICOSLogCreate();
      v13 = v29;
      int v14 = v13;
      if ((unint64_t)[(__CFString *)v13 length] >= 0x15)
      {
        v37 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
        int v14 = [v37 stringByAppendingString:@".."];
      }
      id v16 = +[NSString stringWithFormat:@"❌ ifIfRef->createData write(%8d)", self->_writeBufferSize];
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  self->_writeBuffer = (char *)IOUSBDeviceDataGetBytePtr();
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, void, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
        + 26))(self->_usbCore._deviceInterfaceInterfaceRef, [(PTPDeviceUSBTransport *)self eventDataBufferSize], &self->_eventDataRef))
  {
    __ICOSLogCreate();
    v13 = @"<USB>";
    int v14 = v13;
    if ((unint64_t)[(__CFString *)v13 length] >= 0x15)
    {
      uint64_t v38 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
      int v14 = [v38 stringByAppendingString:@".."];
    }
    id v16 = +[NSString stringWithFormat:@"❌ ifIfRef->createData event(%8d)", [(PTPDeviceUSBTransport *)self eventDataBufferSize]];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  [(PTPDeviceUSBTransport *)self setEventDataBuffer:IOUSBDeviceDataGetBytePtr()];
  int v39 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, int *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 25))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeIn, &self->_maxPacketSizeBulkIn);
  __ICOSLogCreate();
  v13 = @"<USB>";
  id v40 = [(__CFString *)v13 length];
  if (v39)
  {
    int v14 = v13;
    if ((unint64_t)v40 >= 0x15)
    {
      id v41 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
      int v14 = [v41 stringByAppendingString:@".."];
    }
    id v16 = +[NSString stringWithFormat:@"❌ ifIfRef->getPipeCurrentMaxPacketSize [Bulk-IN]"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v42 = v13;
  if ((unint64_t)v40 >= 0x15)
  {
    uint64_t v43 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
    v42 = [v43 stringByAppendingString:@".."];
  }
  v44 = +[NSString stringWithFormat:@"_maxPacketSizeBulkIn: %d\n", self->_maxPacketSizeBulkIn];
  v45 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = v42;
    v47 = v45;
    id v48 = [v46 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v79 = v48;
    __int16 v80 = 2114;
    v81 = v44;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  int v49 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, int *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 25))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeOut, &self->_maxPacketSizeBulkOut);
  __ICOSLogCreate();
  if (v49)
  {
    v13 = v13;
    int v14 = v13;
    if ((unint64_t)[(__CFString *)v13 length] >= 0x15)
    {
      v50 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
      int v14 = [v50 stringByAppendingString:@".."];
    }
    id v16 = +[NSString stringWithFormat:@"❌ ifIfRef->getPipeCurrentMaxPacketSize [Bulk-OUT]"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v51 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    uint64_t v52 = [&stru_100048E60 substringWithRange:0, 18];
    id v51 = [v52 stringByAppendingString:@".."];
  }
  uint64_t v53 = +[NSString stringWithFormat:@"_maxPacketSizeBulkOut: %d\n", self->_maxPacketSizeBulkOut];
  v54 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v55 = v51;
    uint64_t v56 = v54;
    id v57 = [(__CFString *)v55 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v79 = v57;
    __int16 v80 = 2114;
    v81 = v53;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  int v58 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, int *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 25))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn, &self->_maxPacketSizeInterruptIn);
  __ICOSLogCreate();
  v13 = v13;
  id v59 = [(__CFString *)v13 length];
  if (v58)
  {
    int v14 = v13;
    if ((unint64_t)v59 >= 0x15)
    {
      v60 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
      int v14 = [v60 stringByAppendingString:@".."];
    }
    id v16 = +[NSString stringWithFormat:@"❌ ifIfRef->getPipeCurrentMaxPacketSize [Interrupt-IN]"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
LABEL_15:
    sub_100030884();
LABEL_16:

LABEL_17:
    __ICOSLogCreate();
    __int16 v17 = v13;
    if ((unint64_t)[(__CFString *)v17 length] >= 0x15)
    {
      BOOL v18 = -[__CFString substringWithRange:](v17, "substringWithRange:", 0, 18);
      uint64_t v19 = [v18 stringByAppendingString:@".."];

      __int16 v17 = (__CFString *)v19;
    }
    objc_super v20 = +[NSString stringWithFormat:@"❌ <activate> Failed, waiting: %2ds for reactivation before exiting", 15];
    v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = v17;
      v22 = v21;
      id v23 = [(__CFString *)v17 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v79 = v23;
      __int16 v80 = 2114;
      v81 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v24 = 1;
    goto LABEL_22;
  }
  v61 = v13;
  if ((unint64_t)v59 >= 0x15)
  {
    v62 = -[__CFString substringWithRange:](v13, "substringWithRange:", 0, 18);
    v61 = [v62 stringByAppendingString:@".."];
  }
  id v63 = +[NSString stringWithFormat:@"_maxPacketSizeInterruptIn: %d\n", self->_maxPacketSizeInterruptIn];
  v64 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v65 = v61;
    uint64_t v66 = v64;
    id v67 = [v65 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v79 = v67;
    __int16 v80 = 2114;
    v81 = v63;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(PTPDeviceUSBTransport *)self setConnected:1];
  self->_sendEvents = 1;
  self->_numberOfSendEventsTimedOut = 0;
  SEL v68 = NSSelectorFromString(@"transportActivated");
  v69 = [(PTPDeviceUSBTransport *)self delegate];
  char v70 = objc_opt_respondsToSelector();

  if (v70)
  {
    id v71 = [(PTPDeviceUSBTransport *)self delegate];
    [v71 performSelector:v68];
  }
  if ([(PTPDeviceUSBTransport *)self readBulkData]) {
    goto LABEL_17;
  }
  __ICOSLogCreate();
  __int16 v17 = v13;
  if ((unint64_t)[(__CFString *)v17 length] >= 0x15)
  {
    v72 = -[__CFString substringWithRange:](v17, "substringWithRange:", 0, 18);
    uint64_t v73 = [v72 stringByAppendingString:@".."];

    __int16 v17 = (__CFString *)v73;
  }
  objc_super v20 = +[NSString stringWithFormat:@"✅ <activate> Connected"];
  v74 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = v17;
    id v75 = v74;
    id v76 = [(__CFString *)v17 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v79 = v76;
    __int16 v80 = 2114;
    v81 = v20;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v24 = 0;
LABEL_22:

  [(PTPDeviceUSBTransport *)self waitForHostConnection:v24];
}

- (void)deactivate
{
  if ([(PTPDeviceUSBTransport *)self connected])
  {
    [(PTPDeviceUSBTransport *)self setConnected:0];
    self->_busy = 0;
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeOut))
    {
      __ICOSLogCreate();
      objc_super v3 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        BOOL v4 = [&stru_100048E60 substringWithRange:0, 18];
        objc_super v3 = [v4 stringByAppendingString:@".."];
      }
      v5 = +[NSString stringWithFormat:@"ifIfRef->abortPipe [Bulk-OUT]\n"];
      v6 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v3;
        v8 = v6;
        int v37 = 136446466;
        id v38 = [(__CFString *)v7 UTF8String];
        __int16 v39 = 2114;
        id v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);
      }
    }
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeIn))
    {
      __ICOSLogCreate();
      v9 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v10 = [&stru_100048E60 substringWithRange:0, 18];
        v9 = [v10 stringByAppendingString:@".."];
      }
      v11 = +[NSString stringWithFormat:@"ifIfRef->abortPipe [Bulk-IN]\n"];
      id v12 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v9;
        int v14 = v12;
        id v15 = [(__CFString *)v13 UTF8String];
        int v37 = 136446466;
        id v38 = v15;
        __int16 v39 = 2114;
        id v40 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);
      }
    }
    if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn))
    {
      __ICOSLogCreate();
      id v16 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        __int16 v17 = [[&stru_100048E60 substringWithRange:0, 18];
        id v16 = [v17 stringByAppendingString:@".."];
      }
      BOOL v18 = +[NSString stringWithFormat:@"ifIfRef->abortPipe [Interrupt-IN]\n"];
      uint64_t v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v20 = v16;
        v21 = v19;
        id v22 = [(__CFString *)v20 UTF8String];
        int v37 = 136446466;
        id v38 = v22;
        __int16 v39 = 2114;
        id v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);
      }
    }
    readDataRef = self->_readDataRef;
    if (readDataRef)
    {
      CFRelease(readDataRef);
      self->_readDataRef = 0;
    }
    writeDataRef = self->_writeDataRef;
    if (writeDataRef)
    {
      CFRelease(writeDataRef);
      self->_writeDataRef = 0;
    }
    [(NSMutableArray *)self->_eventArray removeAllObjects];
    eventDataRef = self->_eventDataRef;
    if (eventDataRef)
    {
      CFRelease(eventDataRef);
      self->_eventDataRef = 0;
    }
    SEL v26 = NSSelectorFromString(@"transportDeactivated");
    CFMutableDictionaryRef v27 = [(PTPDeviceUSBTransport *)self delegate];
    char v28 = objc_opt_respondsToSelector();

    if (v28)
    {
      v29 = [(PTPDeviceUSBTransport *)self delegate];
      [v29 performSelector:v26];
    }
    __ICOSLogCreate();
    v30 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v31 = [&stru_100048E60 substringWithRange:0, 18];
      v30 = [v31 stringByAppendingString:@".."];
    }
    v32 = +[NSString stringWithFormat:@"PTP Interface Deactivated\n"];
    uint64_t v33 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = v30;
      v35 = v33;
      id v36 = [(__CFString *)v34 UTF8String];
      int v37 = 136446466;
      id v38 = v36;
      __int16 v39 = 2114;
      id v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v37, 0x16u);
    }
  }
}

- (void)waitForHostConnection:(BOOL)a3
{
  BOOL v4 = +[NSNumber numberWithBool:a3];
  v5 = [(PTPDeviceUSBTransport *)self connectionTimerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004EF8;
  v7[3] = &unk_100048778;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)description
{
  return +[NSString stringWithFormat:@"<PTPDeviceUSBTransport 0x%lx>\n  {\n    _locationID = %u\n  }", self, self->_locationID];
}

- (BOOL)sendCancel:(id)a3
{
  return 0;
}

- (BOOL)sendRequest:(id)a3 needsData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PTPDeviceUSBTransport *)self setDelegateNeedsData:v4];
  [(PTPDeviceUSBTransport *)self setDelegateNeedsResponse:1];
  if ([(PTPDeviceUSBTransport *)self connected])
  {
    uint64_t v7 = [v6 contentForUSBUsingBuffer:self->_writeBuffer capacity:self->_writeBufferSize];
    unsigned int v8 = [(PTPDeviceUSBTransport *)self writeBulkData:v7];

    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)sendDataPackets:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = [[PTPWrappedBytes alloc] initWithBytes:self->_writeBuffer capacity:self->_writeBufferSize];
  id v40 = v4;
  [v4 range];
  uint64_t v39 = v7;
  BOOL v8 = [(PTPDeviceUSBTransport *)self transactionCanceled:v5] == 0;
  uint64_t v9 = 0;
  if ([(PTPDeviceUSBTransport *)self connected])
  {
    int v10 = -536870212;
    while (1)
    {
      if (v5 && !v8) {
        goto LABEL_26;
      }
      id v11 = [v40 copyToWrappedBytes:v6 forTransport:1];
      id v12 = [(PTPWrappedBytes *)v6 length];
      if (v12 != self->_writeBufferSize) {
        break;
      }
      unsigned int v13 = [(PTPDeviceUSBTransport *)self writeBulkData:v6];
      if (v13) {
        goto LABEL_25;
      }
      v9 += (uint64_t)v11;
      __ICOSLogCreate();
      int v14 = +[NSString stringWithFormat:@"- [%8lld] of [%8lld]\n", v9, v39];
      id v15 = +[NSString stringWithFormat:@"%@", v14];

      if (__ICLogTypeEnabled(4))
      {
        id v16 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      BOOL v8 = [(PTPDeviceUSBTransport *)self transactionCanceled:v5] == 0;
      int v10 = 0;
      unsigned int v17 = 0;
      if (![(PTPDeviceUSBTransport *)self connected]) {
        goto LABEL_13;
      }
    }
    uint64_t v19 = (uint64_t)v12;
    if (v12)
    {
      unsigned int v13 = [(PTPDeviceUSBTransport *)self writeBulkData:v6];
      if (v13)
      {
LABEL_25:
        unsigned int v17 = v13;
        if (v8) {
          goto LABEL_14;
        }
        goto LABEL_26;
      }
      v9 += (uint64_t)v11;
      __ICOSLogCreate();
      objc_super v20 = +[NSString stringWithFormat:@"- [%8lld] of [%8lld]\n", v9, v39];
      v21 = +[NSString stringWithFormat:@"%@", v20];

      if (__ICLogTypeEnabled(4))
      {
        id v22 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      int v10 = 0;
    }
    unsigned int v17 = v10;
    if (v19 % self->_maxPacketSizeBulkIn) {
      goto LABEL_22;
    }
    [(PTPWrappedBytes *)v6 setLength:0];
    unsigned int v13 = [(PTPDeviceUSBTransport *)self writeBulkData:v6];
    if (!v13)
    {
      __ICOSLogCreate();
      id v36 = +[NSString stringWithFormat:@"Z [%8lld] of [%8lld]\n", v9, v39];
      int v37 = +[NSString stringWithFormat:@"%@", v36];

      if (__ICLogTypeEnabled(4))
      {
        id v38 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      unsigned int v17 = 0;
LABEL_22:
      [v40 setBytesTransferred:v9];
      if (v8) {
        goto LABEL_14;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  unsigned int v17 = -536870212;
LABEL_13:
  if (!v8)
  {
LABEL_26:
    [(PTPWrappedBytes *)v6 setLength:0];
    unsigned int v17 = [(PTPDeviceUSBTransport *)self writeBulkData:v6];
    char v18 = 1;
    goto LABEL_27;
  }
LABEL_14:
  char v18 = 0;
LABEL_27:
  SEL v23 = NSSelectorFromString(@"sentData:responseCode:");
  uint64_t v24 = [(PTPDeviceUSBTransport *)self delegate];
  if (v24)
  {
    v25 = (void *)v24;
    SEL v26 = [(PTPDeviceUSBTransport *)self delegate];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      if (v9 == v39) {
        char v28 = v18;
      }
      else {
        char v28 = 1;
      }
      if (v28)
      {
        if (v17 == -536870186)
        {
          __ICOSLogCreate();
          v29 = &stru_100048E60;
          if ((unint64_t)[&stru_100048E60 length] >= 0x15)
          {
            v30 = [&stru_100048E60 substringWithRange:0, 18];
            v29 = [v30 stringByAppendingString:@".."];
          }
          v31 = +[NSString stringWithFormat:@"[TERM] No device to read BulkIn - Do Not Send Response \n"];
          v32 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v29 = v29;
            uint64_t v33 = v32;
            id v34 = [(__CFString *)v29 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v42 = v34;
            __int16 v43 = 2114;
            v44 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          goto LABEL_41;
        }
        v29 = [(PTPDeviceUSBTransport *)self delegate];
        uint64_t v35 = 8199;
      }
      else
      {
        v29 = [(PTPDeviceUSBTransport *)self delegate];
        uint64_t v35 = 8193;
      }
      v31 = +[NSNumber numberWithUnsignedShort:v35];
      [(__CFString *)v29 performSelector:v23 withObject:v40 withObject:v31];
LABEL_41:
    }
  }
  self->_busy = 0;
}

- (unsigned)transactionCanceled:(unsigned int)a3
{
  p_cancelLock = &self->_cancelLock;
  os_unfair_lock_lock(&self->_cancelLock);
  unsigned int canceledTransactionID = self->_canceledTransactionID;
  if (canceledTransactionID == -1) {
    unsigned int canceledTransactionID = 0;
  }
  else {
    self->_unsigned int canceledTransactionID = -1;
  }
  os_unfair_lock_unlock(p_cancelLock);
  return canceledTransactionID;
}

- (void)sendDataPacketsSplit:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  int v58 = v4;
  [v4 range];
  uint64_t v57 = v6;
  unsigned int v7 = [(PTPDeviceUSBTransport *)self transactionCanceled:v5];
  unsigned int v8 = [(PTPDeviceUSBTransport *)self connected];
  uint64_t v9 = 0;
  BOOL v10 = v7 != 0;
  if (v7) {
    BOOL v11 = v5 != 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v8
    && !v11
    && (v9 = -[PTPWrappedBytes initWithBytes:capacity:]([PTPWrappedBytes alloc], "initWithBytes:capacity:", self->_writeBuffer, self->_writeBufferSize), [v58 copyHeaderToWrappedBytes:v9 forTransport:1], (unint64_t v12 = -[PTPWrappedBytes length](v9, "length")) != 0))
  {
    unint64_t v13 = v12;
    unsigned int v14 = [(PTPDeviceUSBTransport *)self writeBulkData:v9];
    if (v14)
    {
      unsigned int v15 = v14;
    }
    else
    {
      __ICOSLogCreate();
      uint64_t v33 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        id v34 = [&stru_100048E60 substringWithRange:0, 18];
        uint64_t v33 = [v34 stringByAppendingString:@".."];
      }
      uint64_t v35 = +[NSString stringWithFormat:@"MTP Header: [%8lld] of [%8lld]\n", v13, 12];
      id v36 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v56 = v35;
        int v37 = v33;
        id v38 = v36;
        uint64_t v39 = v37;
        uint64_t v35 = v56;
        *(_DWORD *)buf = 136446466;
        id v60 = [(__CFString *)v39 UTF8String];
        __int16 v61 = 2114;
        v62 = v56;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [v58 setBytesTransferred:v13];
      unsigned int v15 = 0;
    }
  }
  else
  {
    unsigned int v15 = -536870212;
  }
  id v16 = [[PTPWrappedBytes alloc] initWithBytes:self->_writeBuffer capacity:self->_writeBufferSize];

  uint64_t v17 = 0;
  if ([(PTPDeviceUSBTransport *)self connected] && !v11)
  {
    while (1)
    {
      id v18 = v17
          ? [v58 copyToWrappedBytes:v16 forTransport:1]
          : [v58 copyDataToWrappedBytes:v16 forTransport:1 fromOffset:0];
      id v19 = v18;
      id v20 = [(PTPWrappedBytes *)v16 length];
      if (v20 != self->_writeBufferSize) {
        break;
      }
      unsigned int v21 = [(PTPDeviceUSBTransport *)self writeBulkData:v16];
      if (v21) {
        goto LABEL_41;
      }
      v17 += (uint64_t)v19;
      __ICOSLogCreate();
      id v22 = +[NSString stringWithFormat:@"- [%8lld] of [%8lld]\n", v17, v57];
      SEL v23 = +[NSString stringWithFormat:@"%@", v22];

      if (__ICLogTypeEnabled(4))
      {
        uint64_t v24 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v60 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      unsigned int v25 = [(PTPDeviceUSBTransport *)self transactionCanceled:v5];
      unsigned int v26 = [(PTPDeviceUSBTransport *)self connected];
      unsigned int v15 = 0;
      BOOL v10 = v25 != 0;
      if (v25) {
        BOOL v27 = v5 != 0;
      }
      else {
        BOOL v27 = 0;
      }
      if (!v26 || v27) {
        goto LABEL_24;
      }
    }
    uint64_t v29 = (uint64_t)v20;
    if (v20)
    {
      unsigned int v21 = [(PTPDeviceUSBTransport *)self writeBulkData:v16];
      if (v21)
      {
LABEL_41:
        unsigned int v15 = v21;
        if (v10) {
          goto LABEL_25;
        }
        goto LABEL_42;
      }
      v17 += (uint64_t)v19;
      __ICOSLogCreate();
      v30 = +[NSString stringWithFormat:@"- [%8lld] of [%8lld]\n", v17, v57];
      v31 = +[NSString stringWithFormat:@"%@", v30];

      if (__ICLogTypeEnabled(4))
      {
        v32 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v60 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      unsigned int v15 = 0;
    }
    if (v29 % self->_maxPacketSizeBulkIn) {
      goto LABEL_33;
    }
    [(PTPWrappedBytes *)v16 setLength:0];
    unsigned int v21 = [(PTPDeviceUSBTransport *)self writeBulkData:v16];
    if (!v21)
    {
      __ICOSLogCreate();
      uint64_t v53 = +[NSString stringWithFormat:@"Z [%8lld] of [%8lld]\n", v17, v57];
      v54 = +[NSString stringWithFormat:@"%@", v53];

      if (__ICLogTypeEnabled(4))
      {
        v55 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v60 = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      unsigned int v15 = 0;
LABEL_33:
      [v58 setBytesTransferred:v17];
      if (v10) {
        goto LABEL_25;
      }
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_24:
  if (!v10)
  {
LABEL_42:
    char v28 = 0;
    goto LABEL_43;
  }
LABEL_25:
  [(PTPWrappedBytes *)v16 setLength:0];
  unsigned int v15 = [(PTPDeviceUSBTransport *)self writeBulkData:v16];
  char v28 = 1;
LABEL_43:
  SEL v40 = NSSelectorFromString(@"sentData:responseCode:");
  uint64_t v41 = [(PTPDeviceUSBTransport *)self delegate];
  if (v41)
  {
    id v42 = (void *)v41;
    __int16 v43 = [(PTPDeviceUSBTransport *)self delegate];
    char v44 = objc_opt_respondsToSelector();

    if (v44)
    {
      if (v17 == v57) {
        char v45 = v28;
      }
      else {
        char v45 = 1;
      }
      if (v45)
      {
        if (v15 == -536870186)
        {
          __ICOSLogCreate();
          id v46 = &stru_100048E60;
          if ((unint64_t)[&stru_100048E60 length] >= 0x15)
          {
            v47 = [&stru_100048E60 substringWithRange:0, 18];
            id v46 = [v47 stringByAppendingString:@".."];
          }
          id v48 = +[NSString stringWithFormat:@"[TERM] No device to read BulkIn - Do Not Send Response \n"];
          int v49 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v46 = v46;
            v50 = v49;
            id v51 = [(__CFString *)v46 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v60 = v51;
            __int16 v61 = 2114;
            v62 = v48;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          goto LABEL_57;
        }
        id v46 = [(PTPDeviceUSBTransport *)self delegate];
        uint64_t v52 = 8199;
      }
      else
      {
        id v46 = [(PTPDeviceUSBTransport *)self delegate];
        uint64_t v52 = 8193;
      }
      id v48 = +[NSNumber numberWithUnsignedShort:v52];
      [(__CFString *)v46 performSelector:v40 withObject:v58 withObject:v48];
LABEL_57:
    }
  }
  self->_busy = 0;
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  transportQueue = self->_transportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006304;
  v7[3] = &unk_100048778;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)transportQueue, v7);
}

- (BOOL)sendResponse:(id)a3
{
  id v4 = a3;
  if ([(PTPDeviceUSBTransport *)self connected])
  {
    id v5 = [v4 contentForUSBUsingBuffer:self->_writeBuffer capacity:self->_writeBufferSize];
    unsigned int v6 = [(PTPDeviceUSBTransport *)self writeBulkData:v5];
  }
  else
  {
    unsigned int v6 = -536870212;
  }
  if ([v4 responseCode] != 8193)
  {
    __ICOSLogCreate();
    unsigned int v7 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v8 = [&stru_100048E60 substringWithRange:0, 18];
      unsigned int v7 = [v8 stringByAppendingString:@".."];
    }
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%4x]", [v4 responseCode]);
    BOOL v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = v7;
      unint64_t v12 = v10;
      *(_DWORD *)buf = 136446466;
      id v15 = [(__CFString *)v11 UTF8String];
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }

  return v6 == 0;
}

- (BOOL)sendEvent:(id)a3
{
  id v4 = a3;
  if (![(PTPDeviceUSBTransport *)self connected] || !self->_sendEvents)
  {
    __ICOSLogCreate();
    id v5 = @"Event Queue";
    if ((unint64_t)[@"Event Queue" length] >= 0x15)
    {
      uint64_t v9 = [[@"Event Queue" substringWithRange:0, 18];
      id v5 = [v9 stringByAppendingString:@".."];
    }
    unsigned int v10 = [(PTPDeviceUSBTransport *)self connected];
    BOOL v11 = "NO";
    if (v10) {
      unint64_t v12 = "YES";
    }
    else {
      unint64_t v12 = "NO";
    }
    if (self->_sendEvents) {
      BOOL v11 = "YES";
    }
    unint64_t v13 = +[NSString stringWithFormat:@"Connected: %s Can Send Events: %s \n", v12, v11];
    unsigned int v14 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    id v15 = v5;
    __int16 v16 = v14;
    *(_DWORD *)buf = 136446466;
    id v23 = [(__CFString *)v15 UTF8String];
    __int16 v24 = 2114;
    unsigned int v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_16:

LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  sub_100020898((int)[v4 eventCode]);
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_eventArray count];
  eventArray = self->_eventArray;
  if (!eventArray || v6 >> 4 > 0xC34)
  {
    __ICOSLogCreate();
    unint64_t v13 = @"Event Queue";
    if ((unint64_t)[@"Event Queue" length] >= 0x15)
    {
      id v18 = [[@"Event Queue" substringWithRange:0, 18];
      unint64_t v13 = [v18 stringByAppendingString:@".."];
    }
    id v5 = v5;
    __int16 v16 = +[NSString stringWithFormat:@"Current Queue[%d] - Dropping %s\n", v6, [(__CFString *)v5 UTF8String]];
    id v19 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v13;
      unsigned int v21 = v19;
      *(_DWORD *)buf = 136446466;
      id v23 = [(__CFString *)v20 UTF8String];
      __int16 v24 = 2114;
      unsigned int v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  [(NSMutableArray *)eventArray addObject:v4];
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = [(PTPDeviceUSBTransport *)self sendNextEvent];
  }
LABEL_18:

  return v8;
}

- (void)cancelTransaction:(id)a3
{
  self->_unsigned int canceledTransactionID = [a3 transactionID];
}

- (unsigned)deviceStatus
{
  return 0;
}

- (void)abortPendingIO
{
  deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
  if (deviceInterfaceInterfaceRef)
  {
    if (self->_interruptPipeIn) {
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*deviceInterfaceInterfaceRef + 24))(deviceInterfaceInterfaceRef);
    }
    if (self->_bulkPipeIn) {
      (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 24))(self->_usbCore._deviceInterfaceInterfaceRef);
    }
    if (self->_bulkPipeOut)
    {
      id v4 = (void (*)(void))*((void *)*self->_usbCore._deviceInterfaceInterfaceRef + 24);
      v4();
    }
  }
}

- (int)writeBulkData:(id)a3
{
  id v14 = [a3 length];
  if (![(PTPDeviceUSBTransport *)self connected]) {
    return -536870183;
  }
  int v4 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, __IOUSBDeviceData *, id *, uint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
        + 34))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeIn, self->_writeDataRef, &v14, 5000);
  int v5 = v4;
  if (v4 == -536870186)
  {
    __ICOSLogCreate();
    unint64_t v6 = @"USBDevice";
    if ((unint64_t)[@"USBDevice" length] >= 0x15)
    {
      unsigned int v10 = [@"USBDevice" substringWithRange:0, 18];
      unint64_t v6 = [v10 stringByAppendingString:@".."];
    }
    BOOL v8 = +[NSString stringWithFormat:@"Write Timeout(Host Terminated) - Drain Write Queue"];
    uint64_t v9 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
LABEL_12:
    unint64_t v6 = v6;
    BOOL v11 = v9;
    id v12 = [(__CFString *)v6 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v16 = v12;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_13:
    return v5;
  }
  if (v4 == -536870208)
  {
    [(PTPDeviceUSBTransport *)self setConnected:0];
    __ICOSLogCreate();
    unint64_t v6 = @"USBDevice";
    if ((unint64_t)[@"USBDevice" length] >= 0x15)
    {
      unsigned int v7 = [[@"USBDevice" substringWithRange:0, 18];
      unint64_t v6 = [v7 stringByAppendingString:@".."];
    }
    BOOL v8 = +[NSString stringWithFormat:@"Connection Terminated"];
    uint64_t v9 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  return v5;
}

- (int)writeInterruptData:(id)a3
{
  [a3 length];
  if (![(PTPDeviceUSBTransport *)self connected]) {
    return -536870183;
  }
  int v4 = (uint64_t (*)(void))*((void *)*self->_usbCore._deviceInterfaceInterfaceRef + 22);

  return v4();
}

- (void)handleWriteInterruptDataCompletion:(id)a3
{
  eventArray = self->_eventArray;
  id v5 = a3;
  id v6 = [(NSMutableArray *)eventArray count];
  unsigned int v7 = [v5 intValue];

  if (v7 == 1)
  {
    unsigned int numberOfSendEventsTimedOut = self->_numberOfSendEventsTimedOut;
    if (numberOfSendEventsTimedOut > 1) {
      self->_sendEvents = 0;
    }
    else {
      self->_unsigned int numberOfSendEventsTimedOut = numberOfSendEventsTimedOut + 1;
    }
    __ICOSLogCreate();
    uint64_t v9 = +[NSString stringWithFormat:@"Current Number of Events Timed Out: [%d] ", self->_numberOfSendEventsTimedOut];
    uint64_t v10 = __ICLogTypeEnabled(2);
    BOOL v11 = _gICOSLog;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
    {
      sub_100030914((uint64_t)v9, v11);
    }
  }
  if (v6)
  {
    id v12 = [(NSMutableArray *)self->_eventArray objectAtIndex:0];
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"checkInterruptWriteCompletion:" object:v12];
    [(NSMutableArray *)self->_eventArray removeObjectAtIndex:0];
    [(PTPDeviceUSBTransport *)self sendNextEvent];
  }
}

- (void)checkInterruptWriteCompletion:(id)a3
{
}

- (void)abortInterruptWrite:(id)a3
{
  id v4 = a3;
  if (![(PTPDeviceUSBTransport *)self connected])
  {
    __ICOSLogCreate();
    id v7 = +[NSString stringWithFormat:@"[0x%x] Device Not Attached", 3758097113];
    uint64_t v8 = __ICLogTypeEnabled(2);
    uint64_t v9 = _gICOSLog;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
    {
      sub_100030914((uint64_t)v7, v9);
    }
    goto LABEL_16;
  }
  if ([(NSMutableArray *)self->_eventArray containsObject:v4])
  {
    uint64_t v5 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t))*self->_usbCore._deviceInterfaceInterfaceRef
          + 24))(self->_usbCore._deviceInterfaceInterfaceRef, self->_interruptPipeIn);
    unsigned int numberOfSendEventsTimedOut = self->_numberOfSendEventsTimedOut;
    if (numberOfSendEventsTimedOut > 1) {
      self->_sendEvents = 0;
    }
    else {
      self->_unsigned int numberOfSendEventsTimedOut = numberOfSendEventsTimedOut + 1;
    }
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%x", [v4 eventCode]);
    __ICOSLogCreate();
    id v7 = v10;
    BOOL v11 = v7;
    if ((unint64_t)[v7 length] >= 0x15)
    {
      id v12 = [v7 substringWithRange:0, 18];
      BOOL v11 = [v12 stringByAppendingString:@".."];
    }
    unint64_t v13 = +[NSString stringWithFormat:@"[0x%x] Events Timed Out: [%d]", v5, self->_numberOfSendEventsTimedOut];
    id v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v11;
      id v16 = v14;
      *(_DWORD *)buf = 136446466;
      id v18 = [v15 UTF8String];
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
LABEL_16:
  }
}

- (BOOL)sendNextEvent
{
  if (![(PTPDeviceUSBTransport *)self connected] || ![(NSMutableArray *)self->_eventArray count]) {
    return 0;
  }
  objc_super v3 = [(NSMutableArray *)self->_eventArray objectAtIndex:0];
  id v4 = sub_100020898((int)[v3 eventCode]);
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x]", [v3 eventCode]);
  __ICOSLogCreate();
  id v6 = v5;
  id v7 = v6;
  if ((unint64_t)[v6 length] >= 0x15)
  {
    uint64_t v8 = [v6 substringWithRange:0, 18];
    id v7 = [v8 stringByAppendingString:@".."];
  }
  uint64_t v9 = +[NSString stringWithFormat:@"<event> %@", v4];
  uint64_t v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v7;
    id v12 = v10;
    *(_DWORD *)buf = 136446466;
    id v18 = [v11 UTF8String];
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  unint64_t v13 = [v3 contentForUSBUsingBuffer:-[PTPDeviceUSBTransport eventDataBuffer](self, "eventDataBuffer") capacity:-[PTPDeviceUSBTransport eventDataBufferSize](self, "eventDataBufferSize")];
  unsigned int v14 = [(PTPDeviceUSBTransport *)self writeInterruptData:v13];

  BOOL v15 = v14 == 0;
  if (!v14) {
    [(PTPDeviceUSBTransport *)self performSelector:"checkInterruptWriteCompletion:" withObject:v3 afterDelay:5.0];
  }

  return v15;
}

- (int)readBulkData
{
  if (![(PTPDeviceUSBTransport *)self connected]) {
    return -536870183;
  }
  __ICOSLogCreate();
  if (byte_10005E488) {
    objc_super v3 = "YES";
  }
  else {
    objc_super v3 = "NO";
  }
  id v4 = +[NSString stringWithFormat:@"(_bulkPipeOut)->readPipeAsync - Read In Progress: %s \n", v3];
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v5 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  if (byte_10005E488) {
    return -536870184;
  }
  int result = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, unint64_t, __IOUSBDeviceData *, void, void (*)(void *, int, uint64_t), PTPDeviceUSBTransport *))*self->_usbCore._deviceInterfaceInterfaceRef
            + 20))(self->_usbCore._deviceInterfaceInterfaceRef, self->_bulkPipeOut, self->_readDataRef, self->_readBufferSize, sub_100007634, self);
  if (result == -536870208)
  {
    [(PTPDeviceUSBTransport *)self setConnected:0];
    return -536870208;
  }
  else if (!result)
  {
    byte_10005E488 = 1;
  }
  return result;
}

- (int)readInterruptData
{
  if (![(PTPDeviceUSBTransport *)self connected]) {
    return -536870183;
  }
  __ICOSLogCreate();
  v2 = +[NSString stringWithFormat:@"(_interfacePipeIn)->readPipeAsync - Pend \n"];
  if (__ICLogTypeEnabled(4))
  {
    objc_super v3 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

  return 0;
}

- (BOOL)handleBulkData:(unint64_t)a3 result:(int)a4
{
  __ICOSLogCreate();
  unint64_t v84 = a3;
  if (__ICLogTypeEnabled(4))
  {
    id v6 = @"handleBulkData";
    if ((unint64_t)[@"handleBulkData" length] >= 0x15)
    {
      id v7 = [@"handleBulkData" substringWithRange:0, 18];
      id v6 = [v7 stringByAppendingString:@".."];
    }
    uint64_t v8 = [(PTPDeviceUSBTransport *)self transactionData];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Received: [%8ld]b, Buffer Allocated: [%8ld]b\n", a3, [v8 length]);

    uint64_t v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v6;
      id v12 = v10;
      unint64_t v13 = v11;
      a3 = v84;
      *(_DWORD *)buf = 136446466;
      id v86 = [(__CFString *)v13 UTF8String];
      __int16 v87 = 2114;
      v88 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  BOOL v83 = [(PTPDeviceUSBTransport *)self connected];
  if (v83)
  {
    if (a3)
    {
      unsigned int v14 = [(PTPDeviceUSBTransport *)self transactionData];
      BOOL v15 = (char *)[v14 length];

      id v16 = [(PTPDeviceUSBTransport *)self transactionData];
      [v16 increaseLengthBy:a3];

      id v17 = [(PTPDeviceUSBTransport *)self transactionData];
      memcpy(&v15[(void)[v17 mutableBytes]], self->_readBuffer, a3);

      __ICOSLogCreate();
      id v18 = +[NSString stringWithFormat:@"Grew Buffer:     [%8lu]b\n", a3];
      if (__ICLogTypeEnabled(4))
      {
        __int16 v19 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v86 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
    }
    id v20 = [(PTPDeviceUSBTransport *)self transactionData];
    id v21 = [v20 length];

    if (v21)
    {
      id v22 = 0;
      uint64_t v23 = 0;
      do
      {
        if ((unint64_t)v21 >= 4)
        {
          do
          {
            id v24 = [(PTPDeviceUSBTransport *)self transactionData];
            id v22 = (unsigned int *)[v24 mutableBytes];

            uint64_t v23 = *v22;
            if (v23 > 0xB) {
              break;
            }
            unsigned int v25 = [(PTPDeviceUSBTransport *)self transactionData];
            v89.location = 0;
            v89.length = 4;
            CFDataDeleteBytes(v25, v89);

            unsigned int v26 = [(PTPDeviceUSBTransport *)self transactionData];
            id v21 = [v26 length];

            __ICOSLogCreate();
            BOOL v27 = &stru_100048E60;
            if ((unint64_t)[&stru_100048E60 length] >= 0x15)
            {
              char v28 = [&stru_100048E60 substringWithRange:0, 18];
              BOOL v27 = [v28 stringByAppendingString:@".."];
            }
            uint64_t v29 = [(PTPDeviceUSBTransport *)self transactionData];
            v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Illegal Length:   [%8lu]b, Adjusting Buffer: [%8lu]b\n", a3, [v29 length]);

            v31 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v27;
              uint64_t v33 = v31;
              id v34 = [(__CFString *)v32 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v86 = v34;
              __int16 v87 = 2114;
              v88 = v30;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
          }
          while ((unint64_t)v21 > 3);
        }
        __ICOSLogCreate();
        uint64_t v35 = +[NSString stringWithFormat:@"Length Received: [%8u]b, Buffer Allocated: [%8lu]b\n", v23, v21];
        if (__ICLogTypeEnabled(4))
        {
          id v36 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v86 = v35;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

        if (v23 < 0xC || (unint64_t)v21 < v23) {
          return v83;
        }
        int v37 = *((unsigned __int16 *)v22 + 2);
        switch(v37)
        {
          case 3:
            SEL v52 = NSSelectorFromString(@"handleResponse:");
            id v38 = [[PTPOperationResponsePacket alloc] initWithUSBBuffer:v22];
            if (!v38)
            {
              __ICOSLogCreate();
              id v51 = &stru_100048E60;
              if ((unint64_t)[&stru_100048E60 length] >= 0x15)
              {
                id v65 = [[&stru_100048E60 substringWithRange:0, 18];
                id v51 = [v65 stringByAppendingString:@".."];
              }
              uint64_t v66 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport received bad response!"];
              id v67 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
LABEL_63:
                v69 = v51;
                char v70 = v67;
                id v71 = v69;
                a3 = v84;
                id v72 = [(__CFString *)v71 UTF8String];
                *(_DWORD *)buf = 136446466;
                id v86 = v72;
                __int16 v87 = 2114;
                v88 = v66;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
              }
LABEL_64:

              goto LABEL_65;
            }
            uint64_t v53 = [(PTPDeviceUSBTransport *)self delegate];
            if (v53)
            {
              id v51 = (__CFString *)v53;
              v54 = [(PTPDeviceUSBTransport *)self delegate];
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_59;
              }
              unsigned int v55 = [(PTPDeviceUSBTransport *)self delegateNeedsResponse];
              goto LABEL_46;
            }
            break;
          case 2:
            id v38 = [[PTPDataPacket alloc] initWithUSBBuffer:v22];
            if ((unint64_t)[(PTPOperationResponsePacket *)v38 bufferSize] <= a3)
            {
              SEL v56 = NSSelectorFromString(@"handleData:");
              if (!v38)
              {
                __ICOSLogCreate();
                id v51 = &stru_100048E60;
                if ((unint64_t)[&stru_100048E60 length] >= 0x15)
                {
                  SEL v68 = [&stru_100048E60 substringWithRange:0, 18];
                  id v51 = [v68 stringByAppendingString:@".."];
                }
                uint64_t v66 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport received bad data!"];
                id v67 = (void *)_gICOSLog;
                if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_63;
                }
                goto LABEL_64;
              }
              SEL v52 = v56;
              uint64_t v57 = [(PTPDeviceUSBTransport *)self delegate];
              if (v57)
              {
                id v51 = (__CFString *)v57;
                v54 = [(PTPDeviceUSBTransport *)self delegate];
                if ((objc_opt_respondsToSelector() & 1) == 0)
                {
LABEL_59:

                  goto LABEL_65;
                }
                unsigned int v55 = [(PTPDeviceUSBTransport *)self delegateNeedsData];
LABEL_46:
                unsigned int v58 = v55;

                if (v58)
                {
                  id v51 = [(PTPDeviceUSBTransport *)self delegate];
                  [(__CFString *)v51 performSelector:v52 withObject:v38];
                  goto LABEL_54;
                }
LABEL_48:
                a3 = v84;
              }
            }
            break;
          case 1:
            id v38 = [[PTPOperationRequestPacket alloc] initWithUSBBuffer:v22];
            SEL v39 = NSSelectorFromString(@"holdPowerAssertion");
            uint64_t v40 = [(PTPDeviceUSBTransport *)self delegate];
            if (v40)
            {
              uint64_t v41 = (void *)v40;
              id v42 = [(PTPDeviceUSBTransport *)self delegate];
              char v43 = objc_opt_respondsToSelector();

              if (v43)
              {
                char v44 = [(PTPDeviceUSBTransport *)self delegate];
                [v44 performSelector:v39 withObject:0];
              }
            }
            SEL v45 = NSSelectorFromString(@"handleRequest:");
            if (!v38)
            {
              __ICOSLogCreate();
              id v51 = &stru_100048E60;
              if ((unint64_t)[&stru_100048E60 length] >= 0x15)
              {
                id v59 = [[&stru_100048E60 substringWithRange:0, 18];
                id v51 = [v59 stringByAppendingString:@".."];
              }
              id v60 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport received bad request!\n"];
              __int16 v61 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
                v62 = v51;
                id v63 = v61;
                id v64 = [(__CFString *)v62 UTF8String];
                *(_DWORD *)buf = 136446466;
                id v86 = v64;
                __int16 v87 = 2114;
                v88 = v60;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
              }
LABEL_54:
              a3 = v84;
LABEL_65:

              break;
            }
            SEL v46 = v45;
            uint64_t v47 = [(PTPDeviceUSBTransport *)self delegate];
            if (v47)
            {
              id v48 = (void *)v47;
              int v49 = [(PTPDeviceUSBTransport *)self delegate];
              char v50 = objc_opt_respondsToSelector();

              if (v50)
              {
                id v51 = [(PTPDeviceUSBTransport *)self delegate];
                -[PTPDeviceUSBTransport setDelegateNeedsData:](self, "setDelegateNeedsData:", [v51 performSelector:v46 withObject:v38]);
                goto LABEL_54;
              }
            }
            goto LABEL_48;
          default:
            __ICOSLogCreate();
            id v76 = &stru_100048E60;
            if ((unint64_t)[&stru_100048E60 length] >= 0x15)
            {
              uint64_t v77 = [&stru_100048E60 substringWithRange:0, 18];
              id v76 = [v77 stringByAppendingString:@".."];
            }
            v78 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport received unrecognizable packet!"];
            id v79 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v80 = v76;
              v81 = v79;
              id v82 = [(__CFString *)v80 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v86 = v82;
              __int16 v87 = 2114;
              v88 = v78;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            exit(1);
        }

        uint64_t v73 = [(PTPDeviceUSBTransport *)self transactionData];
        v90.location = 0;
        v90.length = (CFIndex)v21;
        CFDataDeleteBytes(v73, v90);

        v74 = [(PTPDeviceUSBTransport *)self transactionData];
        id v21 = [v74 length];
      }
      while (v21);
    }
  }
  return v83;
}

- (void)handleInterruptData:(unint64_t)a3
{
  if ([(PTPDeviceUSBTransport *)self connected])
  {
    int v5 = [(PTPDeviceUSBTransport *)self eventData];
    [v5 appendBytes:-[PTPDeviceUSBTransport eventDataBuffer](self, "eventDataBuffer"), a3];

    id v6 = [(PTPDeviceUSBTransport *)self eventData];
    id v7 = [v6 length];

    while (v7)
    {
      id v8 = [(PTPDeviceUSBTransport *)self eventData];
      uint64_t v9 = (unsigned int *)[v8 mutableBytes];

      unint64_t v10 = *v9;
      if ((unint64_t)v7 < v10) {
        break;
      }
      if (*((_WORD *)v9 + 2) == 4)
      {
        SEL v11 = NSSelectorFromString(@"handleEvent:");
        id v12 = [[PTPEventPacket alloc] initWithUSBBuffer:v9];
        uint64_t v13 = [(PTPDeviceUSBTransport *)self delegate];
        if (v13)
        {
          unsigned int v14 = (void *)v13;
          BOOL v15 = [(PTPDeviceUSBTransport *)self delegate];
          char v16 = objc_opt_respondsToSelector();

          if (v16)
          {
            id v17 = [(PTPDeviceUSBTransport *)self delegate];
            [v17 performSelector:v11 withObject:v12 afterDelay:0.0];
          }
        }
      }
      id v18 = [(PTPDeviceUSBTransport *)self eventData];
      v20.location = 0;
      v20.length = v10;
      CFDataDeleteBytes(v18, v20);

      __int16 v19 = [(PTPDeviceUSBTransport *)self eventData];
      id v7 = [v19 length];
    }
  }
}

- (void)deviceAdded:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000086D8;
  v3[3] = &unk_1000487A0;
  v3[4] = self;
  unsigned int v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (BOOL)processDeviceInterface:(unsigned int)a3
{
  theInterface = 0;
  SInt32 theScore = 0;
  objc_super v3 = &CFDataDeleteBytes_ptr;
  unsigned int v4 = (os_log_t *)&_gICOSLog;
  if (!a3)
  {
    __ICOSLogCreate();
    SEL v46 = @"<USB>";
    if ((unint64_t)[(__CFString *)v46 length] >= 0x15)
    {
      uint64_t v47 = -[__CFString substringWithRange:](v46, "substringWithRange:", 0, 18);
      uint64_t v48 = [v47 stringByAppendingString:@".."];

      SEL v46 = (__CFString *)v48;
    }
    int v49 = +[NSString stringWithFormat:@"❌ processDeviceInterface did not find service"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030884();
    }

    return 1;
  }
  uint64_t v5 = *(void *)&a3;
  id v6 = self;
  p_usbCore = &self->_usbCore;
  uint64_t v7 = 4;
  while (1)
  {
    [(PTPDeviceUSBTransport *)v6 clearDeviceInterface];
    CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    uint64_t v10 = IOCreatePlugInInterfaceForService(v5, v8, v9, &theInterface, &theScore);
    uint64_t v11 = v10;
    id v12 = theInterface;
    if (theInterface)
    {
      if (!v10) {
        break;
      }
    }
    __ICOSLogCreate();
    char v16 = @"<USB>";
    if ((unint64_t)[(__CFString *)v16 length] >= 0x15)
    {
      id v21 = -[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18);
      uint64_t v22 = [v21 stringByAppendingString:@".."];

      char v16 = (__CFString *)v22;
    }
    __int16 v19 = [v3[185] stringWithFormat:@"❌ IOCreatePlugInInterfaceForService failed"];
    os_log_t v23 = *v4;
    if (!os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
LABEL_28:
    char v16 = v16;
    uint64_t v40 = v23;
    id v41 = [(__CFString *)v16 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v65 = v41;
    __int16 v66 = 2114;
    id v67 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);

LABEL_20:
    __ICOSLogCreate();
    unsigned int v26 = @"<USB>";
    if ((unint64_t)[(__CFString *)v26 length] >= 0x15)
    {
      BOOL v27 = -[__CFString substringWithRange:](v26, "substringWithRange:", 0, 18);
      uint64_t v28 = [v27 stringByAppendingString:@".."];

      unsigned int v26 = (__CFString *)v28;
    }
    uint64_t v29 = "YES";
    if (!theInterface) {
      uint64_t v29 = "NO";
    }
    v30 = [v3[185] stringWithFormat:@"❌ Retry[%u], kr = %d, pluginInterface = %s", v7, v11, v29];
    os_log_t v31 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v32 = v6;
      uint64_t v33 = v3;
      uint64_t v34 = v5;
      uint64_t v35 = v4;
      id v36 = v26;
      int v37 = v31;
      id v38 = v36;
      unsigned int v4 = v35;
      uint64_t v5 = v34;
      objc_super v3 = v33;
      id v6 = v32;
      id v39 = [(__CFString *)v38 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v65 = v39;
      __int16 v66 = 2114;
      id v67 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);
    }
    sleep(2u);
    uint64_t v7 = (v7 - 1);
    if (v7 == -1)
    {
      char v44 = v3;
      int v45 = 1;
      goto LABEL_35;
    }
  }
  QueryInterface = (*theInterface)->QueryInterface;
  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  CFUUIDBytes v15 = CFUUIDGetUUIDBytes(v14);
  uint64_t v11 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, PTPDeviceUSBCore *))QueryInterface)(v12, *(void *)&v15.byte0, *(void *)&v15.byte8, p_usbCore);
  IODestroyPlugInInterface(theInterface);
  if (!p_usbCore->_deviceInterfaceInterfaceRef || v11)
  {
    __ICOSLogCreate();
    char v16 = @"<USB>";
    if ((unint64_t)[(__CFString *)v16 length] >= 0x15)
    {
      id v24 = -[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18);
      uint64_t v25 = [v24 stringByAppendingString:@".."];

      char v16 = (__CFString *)v25;
    }
    __int16 v19 = [v3[185] stringWithFormat:@"❌ QueryInterface failed"];
    os_log_t v23 = *v4;
    if (!os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    goto LABEL_28;
  }
  if ([(PTPDeviceUSBTransport *)v6 setupDeviceInterface])
  {
    __ICOSLogCreate();
    char v16 = @"<USB>";
    if ((unint64_t)[(__CFString *)v16 length] >= 0x15)
    {
      id v17 = -[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18);
      uint64_t v18 = [v17 stringByAppendingString:@".."];

      char v16 = (__CFString *)v18;
    }
    __int16 v19 = [v3[185] stringWithFormat:@"❌ SetupDeviceInterface failed"];
    os_log_t v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      char v16 = v16;
      id v42 = v20;
      id v43 = [(__CFString *)v16 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v65 = v43;
      __int16 v66 = 2114;
      id v67 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);
    }
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  char v44 = v3;
  IOServiceAddInterestNotification(v6->_usbCore._notificationPort, v5, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000092F4, v6, &v6->_usbCore._notification);
  int v45 = 0;
  uint64_t v11 = 0;
LABEL_35:
  char v50 = theInterface;
  __ICOSLogCreate();
  id v51 = @"<USB>";
  id v52 = [(__CFString *)v51 length];
  if (v50)
  {
    if ((unint64_t)v52 >= 0x15)
    {
      -[__CFString substringWithRange:](v51, "substringWithRange:", 0, 18);
      v54 = int v53 = v45;
      uint64_t v55 = [v54 stringByAppendingString:@".."];

      int v45 = v53;
      id v51 = (__CFString *)v55;
    }
    SEL v56 = [v44[185] stringWithFormat:@"✅ processDeviceInterface"];
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
  }
  else
  {
    if ((unint64_t)v52 >= 0x15)
    {
      -[__CFString substringWithRange:](v51, "substringWithRange:", 0, 18);
      unsigned int v58 = v57 = v45;
      uint64_t v59 = [v58 stringByAppendingString:@".."];

      int v45 = v57;
      id v51 = (__CFString *)v59;
    }
    SEL v56 = [v44[185] stringWithFormat:@"❌ processDeviceInterface failed: %d", v11];
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
LABEL_43:
    }
      sub_100030884();
  }

  IOObjectRelease(v5);
  if (v45)
  {
    [(PTPDeviceUSBTransport *)v6 clearDeviceInterface];
    return 0;
  }
  return 1;
}

- (int)setupDeviceInterface
{
  uint64_t v71 = 0;
  [(PTPDeviceUSBTransport *)self waitForHostConnection:0];
  __ICOSLogCreate();
  objc_super v3 = @"<USB>";
  unsigned int v4 = v3;
  if ((unint64_t)[(__CFString *)v3 length] >= 0x15)
  {
    uint64_t v5 = -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 18);
    unsigned int v4 = [v5 stringByAppendingString:@".."];
  }
  id v6 = +[NSString stringWithFormat:@"USBDeviceInterface Setup"];
  uint64_t v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v4;
    CFUUIDRef v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v73 = [v8 UTF8String];
    __int16 v74 = 2114;
    id v75 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  int v10 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, void))*self->_usbCore._deviceInterfaceInterfaceRef
         + 4))(self->_usbCore._deviceInterfaceInterfaceRef, 0);
  if (v10)
  {
    int v11 = v10;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      uint64_t v13 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v14 = [v13 stringByAppendingString:@".."];

      id v12 = (__CFString *)v14;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->open"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v16 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, const __CFString *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 10))(self->_usbCore._deviceInterfaceInterfaceRef, @"PTP");
  if (v16)
  {
    int v11 = v16;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      id v17 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v18 = [v17 stringByAppendingString:@".."];

      id v12 = (__CFString *)v18;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ iRef->setDescription\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v19 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, void))*self->_usbCore._deviceInterfaceInterfaceRef
         + 11))(self->_usbCore._deviceInterfaceInterfaceRef, 6, 0);
  if (v19)
  {
    int v11 = v19;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      os_log_t v20 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v21 = [v20 stringByAppendingString:@".."];

      id v12 = (__CFString *)v21;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->setClassForAlternateSetting\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v22 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, void))*self->_usbCore._deviceInterfaceInterfaceRef
         + 12))(self->_usbCore._deviceInterfaceInterfaceRef, 1, 0);
  if (v22)
  {
    int v11 = v22;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      os_log_t v23 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v24 = [v23 stringByAppendingString:@".."];

      id v12 = (__CFString *)v24;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->setSubClassForAlternateSetting\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v25 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, void))*self->_usbCore._deviceInterfaceInterfaceRef
         + 13))(self->_usbCore._deviceInterfaceInterfaceRef, 1, 0);
  if (v25)
  {
    int v11 = v25;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      unsigned int v26 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v27 = [v26 stringByAppendingString:@".."];

      id v12 = (__CFString *)v27;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->setProtocolForAlternateSetting\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v28 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, void, uint64_t, uint64_t, void, void, unint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 16))(self->_usbCore._deviceInterfaceInterfaceRef, 2, 0, 0xFFFFFFFFLL, 10, 0, 0, &self->_bulkPipeOut);
  if (v28)
  {
    int v11 = v28;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      uint64_t v29 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v30 = [v29 stringByAppendingString:@".."];

      id v12 = (__CFString *)v30;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->createPipe [Bulk-OUT]\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v31 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, uint64_t, uint64_t, uint64_t, void, void, unint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 16))(self->_usbCore._deviceInterfaceInterfaceRef, 2, 1, 0xFFFFFFFFLL, 10, 0, 0, &self->_bulkPipeIn);
  if (v31)
  {
    int v11 = v31;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      v32 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v33 = [v32 stringByAppendingString:@".."];

      id v12 = (__CFString *)v33;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->createPipe [Bulk-IN]\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v34 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, uint64_t, uint64_t, uint64_t, uint64_t, void, void, unint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 16))(self->_usbCore._deviceInterfaceInterfaceRef, 3, 1, 0xFFFFFFFFLL, 10, 0, 0, &self->_interruptPipeIn);
  if (v34)
  {
    int v11 = v34;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      uint64_t v35 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v36 = [v35 stringByAppendingString:@".."];

      id v12 = (__CFString *)v36;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->createPipe [Interrupt-IN]\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v37 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, void (*)(void *, uint64_t, uint64_t), PTPDeviceUSBTransport *, PTPDeviceUSBTransport *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 9))(self->_usbCore._deviceInterfaceInterfaceRef, sub_10000A614, self, self);
  if (v37)
  {
    int v11 = v37;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      id v38 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v39 = [v38 stringByAppendingString:@".."];

      id v12 = (__CFString *)v39;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->setMessageCallback\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
  id v41 = (uint64_t (*)(IOUSBDeviceInterfaceInterface **, id (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t), void, void, PTPDeviceUSBTransport *, PTPDeviceUSBTransport *, CFRunLoopRef, const CFRunLoopMode))*((void *)*deviceInterfaceInterfaceRef + 8);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  int v43 = v41(deviceInterfaceInterfaceRef, sub_10000AAA4, 0, 0, self, self, Current, kCFRunLoopCommonModes);
  if (v43)
  {
    int v11 = v43;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      char v44 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v45 = [v44 stringByAppendingString:@".."];

      id v12 = (__CFString *)v45;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->setClassCommandCallbacksWithRunLoop: %p\n", CFRunLoopGetCurrent()];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  SEL v46 = self->_usbCore._deviceInterfaceInterfaceRef;
  uint64_t v47 = (uint64_t (*)(IOUSBDeviceInterfaceInterface **, CFRunLoopRef, const CFRunLoopMode))*((void *)*v46 + 6);
  CFRunLoopRef v48 = CFRunLoopGetCurrent();
  int v49 = v47(v46, v48, kCFRunLoopCommonModes);
  if (v49)
  {
    int v11 = v49;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      char v50 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v51 = [v50 stringByAppendingString:@".."];

      id v12 = (__CFString *)v51;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->scheduleWithRunLoop\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_64;
  }
  int v52 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 17))(self->_usbCore._deviceInterfaceInterfaceRef);
  if (v52)
  {
    int v11 = v52;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      int v53 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v54 = [v53 stringByAppendingString:@".."];

      id v12 = (__CFString *)v54;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ ifRef->commitConfiguration\n"];
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
LABEL_64:
    sub_100030884();
LABEL_76:

    return v11;
  }
  if ((*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, const __CFString *))*self->_usbCore._deviceInterfaceInterfaceRef
        + 28))(self->_usbCore._deviceInterfaceInterfaceRef, @"com.apple.usbptpd.demand"))
  {
    __ICOSLogCreate();
    uint64_t v55 = v3;
    if ((unint64_t)[(__CFString *)v55 length] >= 0x15)
    {
      SEL v56 = -[__CFString substringWithRange:](v55, "substringWithRange:", 0, 18);
      uint64_t v57 = [v56 stringByAppendingString:@".."];

      uint64_t v55 = (__CFString *)v57;
    }
    unsigned int v58 = +[NSString stringWithFormat:@"❌ ifRef->registerForDemandLaunch\n"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030884();
    }
  }
  int v59 = (*((uint64_t (**)(IOUSBDeviceInterfaceInterface **, char *, uint64_t *))*self->_usbCore._deviceInterfaceInterfaceRef
         + 36))(self->_usbCore._deviceInterfaceInterfaceRef, (char *)&v71 + 4, &v71);
  if (v59)
  {
    int v11 = v59;
    __ICOSLogCreate();
    id v12 = v3;
    if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
    {
      id v60 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
      uint64_t v61 = [v60 stringByAppendingString:@".."];

      id v12 = (__CFString *)v61;
    }
    CFUUIDBytes v15 = +[NSString stringWithFormat:@"❌ <not active>"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030884();
    }
    goto LABEL_76;
  }
  if (HIDWORD(v71))
  {
    [(PTPDeviceUSBTransport *)self activate:v71];
  }
  else
  {
    __ICOSLogCreate();
    id v63 = v3;
    if ((unint64_t)[(__CFString *)v63 length] >= 0x15)
    {
      id v64 = -[__CFString substringWithRange:](v63, "substringWithRange:", 0, 18);
      uint64_t v65 = [v64 stringByAppendingString:@".."];

      id v63 = (__CFString *)v65;
    }
    __int16 v66 = +[NSString stringWithFormat:@"✅ <active> and waiting: %2ds for host connection", 15];
    id v67 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      SEL v68 = v63;
      v69 = v67;
      id v70 = [(__CFString *)v68 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v73 = v70;
      __int16 v74 = 2114;
      id v75 = v66;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(PTPDeviceUSBTransport *)self waitForHostConnection:1];
  }
  return 0;
}

- (void)clearDeviceInterface
{
  __ICOSLogCreate();
  objc_super v3 = @"<USB>";
  if ((unint64_t)[(__CFString *)v3 length] >= 0x15)
  {
    unsigned int v4 = -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 18);
    uint64_t v5 = [v4 stringByAppendingString:@".."];

    objc_super v3 = (__CFString *)v5;
  }
  id v6 = +[NSString stringWithFormat:@"USBDeviceInterface Clear"];
  uint64_t v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v3;
    CFUUIDRef v9 = v7;
    int v11 = 136446466;
    id v12 = [(__CFString *)v8 UTF8String];
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v11, 0x16u);
  }
  deviceInterfaceInterfaceRef = self->_usbCore._deviceInterfaceInterfaceRef;
  if (deviceInterfaceInterfaceRef)
  {
    (*((void (**)(IOUSBDeviceInterfaceInterface **, void))*deviceInterfaceInterfaceRef + 5))(deviceInterfaceInterfaceRef, 0);
    (*((void (**)(IOUSBDeviceInterfaceInterface **))*self->_usbCore._deviceInterfaceInterfaceRef + 3))(self->_usbCore._deviceInterfaceInterfaceRef);
    self->_usbCore._deviceInterfaceInterfaceRef = 0;
  }
}

- (int)handleDeviceRequest:(id *)a3 data:(__IOUSBDeviceData *)a4 dataSize:(unint64_t *)a5 status:(int *)a6
{
  __ICOSLogCreate();
  int v11 = @"<USB>";
  if ((unint64_t)[(__CFString *)v11 length] >= 0x15)
  {
    id v12 = -[__CFString substringWithRange:](v11, "substringWithRange:", 0, 18);
    uint64_t v13 = [v12 stringByAppendingString:@".."];

    int v11 = (__CFString *)v13;
  }
  uint64_t v14 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport | Handle Service Device Request: 0x%x, Data: %p, Count: %llu\n", a3->var1, a4, *a5];
  CFUUIDBytes v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = v11;
    id v17 = v15;
    *(_DWORD *)buf = 136446466;
    id v38 = [(__CFString *)v16 UTF8String];
    __int16 v39 = 2114;
    uint64_t v40 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  int var1 = a3->var1;
  switch(var1)
  {
    case 'd':
      if (*a5 < 6) {
        return 1;
      }
      uint64_t v36 = 0;
      if (!(*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, uint64_t, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
             + 26))(self->_usbCore._deviceInterfaceInterfaceRef, 6, &v36))
      {
        *a4 = v36;
        *a6 = 0;
      }
      os_unfair_lock_lock(&self->_cancelLock);
      self->_unsigned int canceledTransactionID = self->_transactionID;
      os_unfair_lock_unlock(&self->_cancelLock);
      __ICOSLogCreate();
      unsigned int v26 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        uint64_t v27 = [&stru_100048E60 substringWithRange:0, 18];
        unsigned int v26 = [v27 stringByAppendingString:@".."];
      }
      int v28 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport | Canceled Transaction: %d\n", self->_transactionID];
      uint64_t v29 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      goto LABEL_29;
    case 'f':
      if (*a5) {
        return 1;
      }
      uint64_t v36 = 0;
      if (!(*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, uint64_t, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
             + 26))(self->_usbCore._deviceInterfaceInterfaceRef, 6, &v36))
      {
        *a4 = v36;
        *a6 = 0;
      }
      __ICOSLogCreate();
      unsigned int v26 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        uint64_t v30 = [&stru_100048E60 substringWithRange:0, 18];
        unsigned int v26 = [v30 stringByAppendingString:@".."];
      }
      int v28 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport | Device Reset: %d\n", self->_transactionID];
      uint64_t v29 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        int v31 = v26;
        v32 = v29;
        id v33 = [(__CFString *)v31 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v38 = v33;
        __int16 v39 = 2114;
        uint64_t v40 = v28;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
LABEL_29:

      return 1;
    case 'g':
      if (*a5 < 4
        || (uint64_t v36 = 0,
            (*((unsigned int (**)(IOUSBDeviceInterfaceInterface **, uint64_t, __IOUSBDeviceData **))*self->_usbCore._deviceInterfaceInterfaceRef
             + 26))(self->_usbCore._deviceInterfaceInterfaceRef, 4, &v36)))
      {
        *a5 = 0;
        *a4 = 0;
        *a6 = -536870212;
        __ICOSLogCreate();
        int v19 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          os_log_t v20 = [&stru_100048E60 substringWithRange:0, 18];
          int v19 = [v20 stringByAppendingString:@".."];
        }
        uint64_t v21 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport | Device Request Failed"];
        int v22 = (void *)_gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
      }
      else
      {
        *(_DWORD *)IOUSBDeviceDataGetBytePtr() = 536936452;
        *a5 = 4;
        *a4 = v36;
        *a6 = 0;
        __ICOSLogCreate();
        int v19 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          uint64_t v35 = [&stru_100048E60 substringWithRange:0, 18];
          int v19 = [v35 stringByAppendingString:@".."];
        }
        uint64_t v21 = +[NSString stringWithFormat:@"PTPDeviceUSBTransport | Device Request Handled"];
        int v22 = (void *)_gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
      }
      os_log_t v23 = v19;
      uint64_t v24 = v22;
      id v25 = [(__CFString *)v23 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v38 = v25;
      __int16 v39 = 2114;
      uint64_t v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_14:
      return 1;
  }
  return 0;
}

- (PTPDeviceUSBCore)usbCore
{
  *retstr = *(PTPDeviceUSBCore *)&self->_notification;
  return self;
}

- (void)setUsbCore:(PTPDeviceUSBCore *)a3
{
  long long v3 = *(_OWORD *)&a3->_deviceInterfaceInterfaceRef;
  self->_usbCore._notificationPort = a3->_notificationPort;
  *(_OWORD *)&self->_usbCore._deviceInterfaceInterfaceRef = v3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (int)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(int)a3
{
  self->_connectionStatus = a3;
}

- (NSMutableData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)delegateNeedsData
{
  return self->_delegateNeedsData;
}

- (void)setDelegateNeedsData:(BOOL)a3
{
  self->_delegateNeedsData = a3;
}

- (BOOL)delegateNeedsResponse
{
  return self->_delegateNeedsResponse;
}

- (void)setDelegateNeedsResponse:(BOOL)a3
{
  self->_delegateNeedsResponse = a3;
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unsigned int)a3
{
  self->_locationID = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned __int16)a3
{
  self->_productID = a3;
}

- (NSString)usbSerialNumberString
{
  return self->_usbSerialNumberString;
}

- (void)setUsbSerialNumberString:(id)a3
{
}

- (unint64_t)bulkPipeIn
{
  return self->_bulkPipeIn;
}

- (void)setBulkPipeIn:(unint64_t)a3
{
  self->_bulkPipeIn = a3;
}

- (unint64_t)bulkPipeOut
{
  return self->_bulkPipeOut;
}

- (void)setBulkPipeOut:(unint64_t)a3
{
  self->_bulkPipeOut = a3;
}

- (unint64_t)interruptPipeIn
{
  return self->_interruptPipeIn;
}

- (void)setInterruptPipeIn:(unint64_t)a3
{
  self->_interruptPipeIn = a3;
}

- (int)maxPacketSizeBulkIn
{
  return self->_maxPacketSizeBulkIn;
}

- (void)setMaxPacketSizeBulkIn:(int)a3
{
  self->_maxPacketSizeBulkIn = a3;
}

- (int)maxPacketSizeBulkOut
{
  return self->_maxPacketSizeBulkOut;
}

- (void)setMaxPacketSizeBulkOut:(int)a3
{
  self->_maxPacketSizeBulkOut = a3;
}

- (int)maxPacketSizeInterruptIn
{
  return self->_maxPacketSizeInterruptIn;
}

- (void)setMaxPacketSizeInterruptIn:(int)a3
{
  self->_maxPacketSizeInterruptIn = a3;
}

- (BOOL)sendEvents
{
  return self->_sendEvents;
}

- (void)setSendEvents:(BOOL)a3
{
  self->_sendEvents = a3;
}

- (unsigned)numberOfSendEventsTimedOut
{
  return self->_numberOfSendEventsTimedOut;
}

- (void)setNumberOfSendEventsTimedOut:(unsigned int)a3
{
  self->_unsigned int numberOfSendEventsTimedOut = a3;
}

- (unsigned)eventDataBufferSize
{
  return self->_eventDataBufferSize;
}

- (void)setEventDataBufferSize:(unsigned int)a3
{
  self->_eventDataBufferSize = a3;
}

- (char)eventDataBuffer
{
  return self->_eventDataBuffer;
}

- (void)setEventDataBuffer:(char *)a3
{
  self->_eventDataBuffer = a3;
}

- (NSMutableData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (NSMutableArray)eventArray
{
  return self->_eventArray;
}

- (void)setEventArray:(id)a3
{
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (void)setWriteBufferSize:(unsigned int)a3
{
  self->_writeBufferSize = a3;
}

- (char)writeBuffer
{
  return self->_writeBuffer;
}

- (void)setWriteBuffer:(char *)a3
{
  self->_writeBuffer = a3;
}

- (unsigned)readBufferSize
{
  return self->_readBufferSize;
}

- (void)setReadBufferSize:(unsigned int)a3
{
  self->_readBufferSize = a3;
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (void)setReadBuffer:(char *)a3
{
  self->_readBuffer = a3;
}

- (OS_dispatch_source)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (OS_dispatch_queue)connectionTimerQueue
{
  return self->_connectionTimerQueue;
}

- (void)setConnectionTimerQueue:(id)a3
{
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (unsigned)canceledTransactionID
{
  return self->_canceledTransactionID;
}

- (void)setCanceledTransactionID:(unsigned int)a3
{
  self->_unsigned int canceledTransactionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_connectionTimerQueue, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_eventArray, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_usbSerialNumberString, 0);
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong((id *)&self->_transactionData, 0);
}

@end