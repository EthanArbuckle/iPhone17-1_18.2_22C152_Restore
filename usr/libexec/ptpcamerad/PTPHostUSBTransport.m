@interface PTPHostUSBTransport
- (BOOL)busy;
- (BOOL)connected;
- (BOOL)sendCancel:(id)a3;
- (BOOL)sendEvent:(id)a3;
- (BOOL)sendRequest:(id)a3;
- (BOOL)startInitiator;
- (BOOL)timedOut;
- (BOOL)writeBulkData:(id)a3;
- (NSMutableData)eventData;
- (NSMutableDictionary)transactions;
- (NSString)usbSerialNumberString;
- (OS_dispatch_queue)transportQueue;
- (PTPHostUSBTransport)initWithLocationID:(unsigned int)a3 delegate:(id)a4;
- (char)eventDataBuffer;
- (char)writeBuffer;
- (id)delegate;
- (id)description;
- (id)getTransaction:(id)a3;
- (id)sendTransaction:(id)a3 timeout:(unsigned int)a4;
- (int)connectionStatus;
- (int)maxPacketSizeBulkIn;
- (int)maxPacketSizeBulkOut;
- (int)maxPacketSizeInterruptIn;
- (int)readInterruptData;
- (int)readResponseData:(id)a3 withTimeout:(unsigned int)a4;
- (int)role;
- (int)status;
- (unsigned)bulkPipeIn;
- (unsigned)bulkPipeOut;
- (unsigned)cancelRequest:(id)a3;
- (unsigned)canceledTransactionID;
- (unsigned)deviceStatus;
- (unsigned)eventDataBufferSize;
- (unsigned)interruptPipeIn;
- (unsigned)locationID;
- (unsigned)productID;
- (unsigned)type;
- (unsigned)vendorID;
- (unsigned)writeBufferSize;
- (void)abortPendingIO;
- (void)addTransaction:(id)a3;
- (void)cancelTransaction:(id)a3;
- (void)clearBulkInPipeStall;
- (void)clearPipeStall:(unsigned __int8)a3;
- (void)dealloc;
- (void)deviceReset;
- (void)handleBulkData:(unint64_t)a3 result:(int)a4 forTxID:(id)a5;
- (void)handleInterruptData:(unint64_t)a3;
- (void)removeTransaction:(id)a3;
- (void)sendData:(id)a3;
- (void)sendDataPackets:(id)a3;
- (void)setBulkPipeIn:(unsigned __int8)a3;
- (void)setBulkPipeOut:(unsigned __int8)a3;
- (void)setBusy:(BOOL)a3;
- (void)setCanceledTransactionID:(unsigned int)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionStatus:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventDataBuffer:(char *)a3;
- (void)setEventDataBufferSize:(unsigned int)a3;
- (void)setInterruptPipeIn:(unsigned __int8)a3;
- (void)setLocationID:(unsigned int)a3;
- (void)setMaxPacketSizeBulkIn:(int)a3;
- (void)setMaxPacketSizeBulkOut:(int)a3;
- (void)setMaxPacketSizeInterruptIn:(int)a3;
- (void)setProductID:(unsigned __int16)a3;
- (void)setRole:(int)a3;
- (void)setStatus:(int)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTransactions:(id)a3;
- (void)setTransportQueue:(id)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setUsbSerialNumberString:(id)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setWriteBuffer:(char *)a3;
- (void)setWriteBufferSize:(unsigned int)a3;
- (void)stop;
@end

@implementation PTPHostUSBTransport

- (PTPHostUSBTransport)initWithLocationID:(unsigned int)a3 delegate:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PTPHostUSBTransport;
  v7 = [(PTPHostUSBTransport *)&v18 init];
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    machRecvSemaphore = v7->_machRecvSemaphore;
    v7->_machRecvSemaphore = (OS_dispatch_semaphore *)v8;

    v7->_type = 2;
    objc_storeWeak(&v7->_delegate, v6);
    v7->_locationID = a3;
    v10 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0];
    eventData = v7->_eventData;
    v7->_eventData = v10;

    v7->_eventDataBufferSize = 196608;
    v7->_writeBufferSize = 12582912;
    v7->_writeBuffer = (char *)malloc_type_malloc(0xC00000uLL, 0x18E2CD6DuLL);
    v7->_eventDataBuffer = (char *)malloc_type_malloc(v7->_eventDataBufferSize, 0x97B6AB72uLL);
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactions = v7->_transactions;
    v7->_transactions = v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v15 = dispatch_queue_create("PTPHostUSBTransportQueue", v14);
    transportQueue = v7->_transportQueue;
    v7->_transportQueue = (OS_dispatch_queue *)v15;
  }
  return v7;
}

- (void)dealloc
{
  __ICOSLogCreate();
  v3 = @"PTPTransport";
  if ((unint64_t)[@"PTPTransport" length] >= 0x15)
  {
    v4 = [@"PTPTransport" substringWithRange:0, 18];
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = +[NSString stringWithFormat:@"%p | %16s - 0x%08X", self, "dealloc locID", [(PTPHostUSBTransport *)self locationID]];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    dispatch_semaphore_t v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v15 = [(__CFString *)v7 UTF8String];
    __int16 v16 = 2114;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  objc_storeWeak(&self->_delegate, 0);
  writeBuffer = self->_writeBuffer;
  if (writeBuffer) {
    free(writeBuffer);
  }
  self->_writeBuffer = 0;
  eventDataBuffer = self->_eventDataBuffer;
  if (eventDataBuffer) {
    free(eventDataBuffer);
  }
  self->_eventDataBuffer = 0;
  machRecvSemaphore = self->_machRecvSemaphore;
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)machRecvSemaphore, v12);
  v13.receiver = self;
  v13.super_class = (Class)PTPHostUSBTransport;
  [(PTPHostUSBTransport *)&v13 dealloc];
}

- (BOOL)startInitiator
{
  v2 = self;
  if (self->_role)
  {
    BOOL v3 = 0;
    goto LABEL_14;
  }
  io_iterator_t existing = 0;
  v4 = IOServiceMatching("IOUSBInterface");
  v5 = +[NSNumber numberWithUnsignedInt:v2->_locationID];
  id v6 = +[NSDictionary dictionaryWithObject:v5 forKey:@"locationID"];
  [(__CFDictionary *)v4 setObject:v6 forKey:@"IOPropertyMatch"];

  BOOL v3 = 0;
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing)) {
    goto LABEL_13;
  }
  v103 = v4;
  v104 = v2;
  io_object_t v7 = IOIteratorNext(existing);
  if (!v7)
  {
LABEL_12:
    IOObjectRelease(existing);
    BOOL v3 = 0;
    goto LABEL_13;
  }
  io_registry_entry_t v8 = v7;
  while (1)
  {
    *(void *)properties = 0;
    if (!IORegistryEntryCreateCFProperties(v8, (CFMutableDictionaryRef *)properties, kCFAllocatorDefault, 0)) {
      break;
    }
LABEL_11:
    IOObjectRelease(v8);
    io_registry_entry_t v8 = IOIteratorNext(existing);
    if (!v8) {
      goto LABEL_12;
    }
  }
  v9 = *(void **)properties;
  v10 = [*(id *)properties objectForKey:@"bInterfaceClass"];
  unsigned int v11 = [v10 unsignedCharValue];

  dispatch_time_t v12 = [v9 objectForKey:@"bInterfaceSubClass"];
  unsigned int v13 = [v12 unsignedCharValue];

  v14 = [v9 objectForKey:@"bInterfaceProtocol"];
  unsigned int v15 = [v14 unsignedCharValue];

  if (v11 != 6 || v13 != 1 || v15 != 1)
  {

    goto LABEL_11;
  }
  v17 = [v9 objectForKey:@"idVendor"];
  -[PTPHostUSBTransport setVendorID:](v2, "setVendorID:", [v17 unsignedShortValue]);

  objc_super v18 = [v9 objectForKey:@"idProduct"];
  -[PTPHostUSBTransport setProductID:](v2, "setProductID:", [v18 unsignedShortValue]);

  io_registry_entry_t parent = 0;
  if (!IORegistryEntryGetParentEntry(v8, "IOService", &parent))
  {
    if (parent)
    {
      CFMutableDictionaryRef v110 = 0;
      if (!IORegistryEntryCreateCFProperties(parent, &v110, kCFAllocatorDefault, 0))
      {
        CFMutableDictionaryRef v19 = v110;
        v20 = [(__CFDictionary *)v110 objectForKey:@"USB Serial Number"];
        [(PTPHostUSBTransport *)v2 setUsbSerialNumberString:v20];
      }
    }
  }

  IOObjectRelease(existing);
  CFMutableDictionaryRef v110 = 0;
  io_registry_entry_t parent = 0;
  CFUUIDRef v21 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  CFUUIDRef v22 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  uint64_t v23 = IOCreatePlugInInterfaceForService(v8, v21, v22, (IOCFPlugInInterface ***)&v110, (SInt32 *)&parent);
  if (!v23)
  {
    CFMutableDictionaryRef v32 = v110;
    v33 = *(void (**)(CFMutableDictionaryRef, void, void, IOUSBInterfaceStruct942 ***))(*(void *)v110 + 8);
    CFUUIDRef v34 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
    CFUUIDBytes v35 = CFUUIDGetUUIDBytes(v34);
    p_interfaceInterfaceRef = &v2->_interfaceInterfaceRef;
    v33(v32, *(void *)&v35.byte0, *(void *)&v35.byte8, &v2->_interfaceInterfaceRef);
    IODestroyPlugInInterface((IOCFPlugInInterface **)v110);
    interfaceInterfaceRef = v2->_interfaceInterfaceRef;
    if (!interfaceInterfaceRef
      || ((unsigned int (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->USBInterfaceOpen)(interfaceInterfaceRef))
    {
      goto LABEL_25;
    }
    unsigned __int8 v109 = 0;
    if (((unsigned int (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(**p_interfaceInterfaceRef)->GetNumEndpoints)(*p_interfaceInterfaceRef, &v109))
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(**p_interfaceInterfaceRef)->USBInterfaceClose)(*p_interfaceInterfaceRef);
      goto LABEL_25;
    }
    char v108 = 0;
    __int16 v107 = 0;
    char v106 = 0;
    unsigned __int16 v105 = 0;
    if (!v109)
    {
LABEL_84:
      v2 = v104;
      if (((unsigned int (*)(IOUSBInterfaceStruct942 **, unsigned int *))(*v104->_interfaceInterfaceRef)->CreateInterfaceAsyncPort)(v104->_interfaceInterfaceRef, &v104->_asyncPort))
      {
        goto LABEL_90;
      }
      __ICOSLogCreate();
      v95 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v96 = [@"HostUSB" substringWithRange:0, 18];
        v95 = [v96 stringByAppendingString:@".."];
      }
      v97 = +[NSString stringWithFormat:@"Interface Installed: %s", "YES"];
      v98 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v99 = v95;
        v100 = v98;
        id v101 = [(__CFString *)v99 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v101;
        __int16 v114 = 2114;
        v115 = v97;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      v102 = (IONotificationPort *)((uint64_t (*)(IOUSBInterfaceStruct942 **))(*v104->_interfaceInterfaceRef)->GetEndpointPropertiesV3)(v104->_interfaceInterfaceRef);
      v104->_notificationPort = v102;
      IONotificationPortSetDispatchQueue(v102, (dispatch_queue_t)v104->_transportQueue);
      if ([(PTPHostUSBTransport *)v104 readInterruptData])
      {
LABEL_90:
        ((void (*)(IOUSBInterfaceStruct942 **))(**p_interfaceInterfaceRef)->USBInterfaceClose)(*p_interfaceInterfaceRef);
        BOOL v3 = 0;
      }
      else
      {
        v104->_role = 2;
        BOOL v3 = 1;
      }
      v4 = v103;
      goto LABEL_26;
    }
    unsigned __int8 v38 = 0;
    while (((unsigned int (*)(IOUSBInterfaceStruct942 **, void, char *, char *, __int16 *, unsigned __int16 *, char *))(**p_interfaceInterfaceRef)->GetPipeProperties)(*p_interfaceInterfaceRef, ++v38, &v108, (char *)&v107 + 1, &v107, &v105, &v106))
    {
LABEL_67:
      if (v109 <= v38) {
        goto LABEL_84;
      }
    }
    if (v108 == 1 && v107 == 2)
    {
      v104->_bulkPipeIn = v38;
      v104->_maxPacketSizeBulkIn = v105;
      __ICOSLogCreate();
      v60 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v61 = [@"HostUSB" substringWithRange:0, 18];
        v60 = [v61 stringByAppendingString:@".."];
      }
      v62 = +[NSString stringWithFormat:@"_maxPacketSizeBulkIn: %d", v104->_maxPacketSizeBulkIn];
      v63 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v64 = v60;
        v65 = v63;
        id v66 = [(__CFString *)v64 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v66;
        __int16 v114 = 2114;
        v115 = v62;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      if (((unsigned int (*)(IOUSBInterfaceStruct942 **, void))(*v104->_interfaceInterfaceRef)->GetPipeStatus)(v104->_interfaceInterfaceRef, v104->_bulkPipeIn) != -536854449)goto LABEL_67; {
      __ICOSLogCreate();
      }
      v67 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v68 = [@"HostUSB" substringWithRange:0, 18];
        v67 = [v68 stringByAppendingString:@".."];
      }
      v69 = +[NSString stringWithFormat:@"Bulk In Clearing Pipe Stall"];
      v70 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v71 = v67;
        v72 = v70;
        id v73 = [(__CFString *)v71 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v73;
        __int16 v114 = 2114;
        v115 = v69;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      uint64_t v74 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void))(*v104->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(v104->_interfaceInterfaceRef, v104->_bulkPipeIn);
      __ICOSLogCreate();
      v56 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v75 = [@"HostUSB" substringWithRange:0, 18];
        v56 = [v75 stringByAppendingString:@".."];
      }
      v58 = +[NSString stringWithFormat:@"Bulk In Clear Reported: %0x", v74];
      v59 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_66;
      }
    }
    else if (v108 || v107 != 2)
    {
      if (v108 != 1 || v107 != 3) {
        goto LABEL_67;
      }
      v104->_interruptPipeIn = v38;
      v104->_maxPacketSizeInterruptIn = v105;
      int v78 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void))(*v104->_interfaceInterfaceRef)->GetPipeStatus)(v104->_interfaceInterfaceRef, v38);
      __ICOSLogCreate();
      v79 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v80 = [@"HostUSB" substringWithRange:0, 18];
        v79 = [v80 stringByAppendingString:@".."];
      }
      v81 = +[NSString stringWithFormat:@"_maxPacketSizeInterruptIn: %d", v104->_maxPacketSizeInterruptIn];
      v82 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v83 = v79;
        v84 = v82;
        id v85 = [(__CFString *)v83 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v85;
        __int16 v114 = 2114;
        v115 = v81;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      if (v78 != -536854449) {
        goto LABEL_67;
      }
      __ICOSLogCreate();
      v86 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v87 = [@"HostUSB" substringWithRange:0, 18];
        v86 = [v87 stringByAppendingString:@".."];
      }
      v88 = +[NSString stringWithFormat:@"Interrupt Clearing Pipe Stall"];
      v89 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v90 = v86;
        v91 = v89;
        id v92 = [(__CFString *)v90 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v92;
        __int16 v114 = 2114;
        v115 = v88;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      uint64_t v93 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void))(*v104->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(v104->_interfaceInterfaceRef, v104->_interruptPipeIn);
      __ICOSLogCreate();
      v56 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v94 = [@"HostUSB" substringWithRange:0, 18];
        v56 = [v94 stringByAppendingString:@".."];
      }
      v58 = +[NSString stringWithFormat:@"Interrupt Clear Reported: %0x", v93];
      v59 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_66;
      }
    }
    else
    {
      v104->_bulkPipeOut = v38;
      v104->_maxPacketSizeBulkOut = v105;
      int v40 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void))(*v104->_interfaceInterfaceRef)->GetPipeStatus)(v104->_interfaceInterfaceRef, v38);
      __ICOSLogCreate();
      v41 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v42 = [@"HostUSB" substringWithRange:0, 18];
        v41 = [v42 stringByAppendingString:@".."];
      }
      v43 = +[NSString stringWithFormat:@"_maxPacketSizeBulkOut: %d", v104->_maxPacketSizeBulkOut];
      v44 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v45 = v41;
        v46 = v44;
        id v47 = [(__CFString *)v45 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v47;
        __int16 v114 = 2114;
        v115 = v43;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      if (v40 != -536854449) {
        goto LABEL_67;
      }
      __ICOSLogCreate();
      v48 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v49 = [@"HostUSB" substringWithRange:0, 18];
        v48 = [v49 stringByAppendingString:@".."];
      }
      v50 = +[NSString stringWithFormat:@"Bulk Out Clearing Pipe Stall"];
      v51 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v52 = v48;
        v53 = v51;
        id v54 = [(__CFString *)v52 UTF8String];
        *(_DWORD *)properties = 136446466;
        *(void *)&properties[4] = v54;
        __int16 v114 = 2114;
        v115 = v50;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
      }
      uint64_t v55 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void))(*v104->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(v104->_interfaceInterfaceRef, v104->_bulkPipeOut);
      __ICOSLogCreate();
      v56 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v57 = [@"HostUSB" substringWithRange:0, 18];
        v56 = [v57 stringByAppendingString:@".."];
      }
      v58 = +[NSString stringWithFormat:@"Bulk In Clear Reported: %0x", v55];
      v59 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_66;
      }
    }
    v56 = v56;
    v76 = v59;
    id v77 = [(__CFString *)v56 UTF8String];
    *(_DWORD *)properties = 136446466;
    *(void *)&properties[4] = v77;
    __int16 v114 = 2114;
    v115 = v58;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

LABEL_66:
    goto LABEL_67;
  }
  uint64_t v24 = v23;
  __ICOSLogCreate();
  v25 = @"HostUSB";
  if ((unint64_t)[@"HostUSB" length] >= 0x15)
  {
    v26 = [@"HostUSB" substringWithRange:0, 18];
    v25 = [v26 stringByAppendingString:@".."];
  }
  v27 = +[NSString stringWithFormat:@"IOCreatePlugInInterfaceForService returned: %d [0x%x]\n", v24, v24];
  v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v25;
    v30 = v28;
    id v31 = [(__CFString *)v29 UTF8String];
    *(_DWORD *)properties = 136446466;
    *(void *)&properties[4] = v31;
    __int16 v114 = 2114;
    v115 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);
  }
LABEL_25:
  BOOL v3 = 0;
LABEL_26:
  IOObjectRelease(v8);
LABEL_13:

LABEL_14:
  v2->_connected = v3;
  return v3;
}

- (void)stop
{
  __ICOSLogCreate();
  BOOL v3 = @"PTPTransport";
  if ((unint64_t)[@"PTPTransport" length] >= 0x15)
  {
    v4 = [@"PTPTransport" substringWithRange:0, 18];
    BOOL v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = +[NSString stringWithFormat:@"%p | %16s - 0x%08X", self, "stopping locID", [(PTPHostUSBTransport *)self locationID]];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    io_object_t v7 = v3;
    io_registry_entry_t v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v12 = [(__CFString *)v7 UTF8String];
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (self->_role == 2)
  {
    if (self->_bulkPipeIn)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
      self->_bulkPipeIn = 0;
    }
    if (self->_bulkPipeOut)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
      self->_bulkPipeOut = 0;
    }
    if (self->_interruptPipeIn)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
      ((void (*)(IOUSBInterfaceStruct942 **, void))(*self->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(self->_interfaceInterfaceRef, self->_interruptPipeIn);
      self->_interruptPipeIn = 0;
    }
    notificationPort = self->_notificationPort;
    if (notificationPort)
    {
      IONotificationPortSetDispatchQueue(notificationPort, 0);
      self->_notificationPort = 0;
    }
    interfaceInterfaceRef = self->_interfaceInterfaceRef;
    if (interfaceInterfaceRef)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->USBInterfaceClose)(interfaceInterfaceRef);
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->Release)(self->_interfaceInterfaceRef);
      self->_interfaceInterfaceRef = 0;
    }
    self->_role = 0;
    self->_connected = 0;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"<PTPHostUSBTransport %p>\n  {\n    _locationID = %lu\n  }", self, self->_locationID];
}

- (BOOL)sendCancel:(id)a3
{
  return 0;
}

- (id)sendTransaction:(id)a3 timeout:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(PTPHostUSBTransport *)self addTransaction:v6];
  if (self->_connected)
  {
    io_registry_entry_t v8 = [v6 requestPacket];
    unsigned int v9 = [(PTPHostUSBTransport *)self sendRequest:v8];

    if (v9)
    {
      v10 = [v6 txDataPacket];

      if (v10)
      {
        unsigned int v11 = [v6 txDataPacket];
        [(PTPHostUSBTransport *)self sendData:v11];
      }
      [(PTPHostUSBTransport *)self readResponseData:v6 withTimeout:v4];
    }
  }
  id v12 = [v6 txID];
  [(PTPHostUSBTransport *)self removeTransaction:v12];

  __int16 v13 = [v6 responsePacket];

  return v13;
}

- (BOOL)sendRequest:(id)a3
{
  BOOL v3 = self;
  uint64_t v4 = [a3 contentForUSBUsingBuffer:self->_writeBuffer capacity:self->_writeBufferSize];
  LOBYTE(v3) = [(PTPHostUSBTransport *)v3 writeBulkData:v4];

  return (char)v3;
}

- (void)sendData:(id)a3
{
  id v13 = a3;
  if (self->_connected && !self->_busy)
  {
    [v13 range];
    uint64_t v6 = v5;
    [v13 setBytesTransferred:0];
    if (v6)
    {
      self->_busy = 1;
      [(PTPHostUSBTransport *)self performSelector:"sendDataPackets:" withObject:v13];
    }
    else
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained(p_delegate);
      if (WeakRetained)
      {
        unsigned int v9 = WeakRetained;
        id v10 = objc_loadWeakRetained(p_delegate);
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          id v12 = objc_loadWeakRetained(p_delegate);
          [v12 performSelector:"sentData:" withObject:v13];
        }
      }
    }
  }
}

- (BOOL)sendEvent:(id)a3
{
  return 0;
}

- (void)cancelTransaction:(id)a3
{
  self->_canceledTransactionID = [a3 transactionID];
}

- (void)sendDataPackets:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 transactionID];
  uint64_t v6 = [[PTPWrappedBytes alloc] initWithBytes:self->_writeBuffer capacity:self->_writeBufferSize];
  [v4 range];
  if (self->_connected)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v47 = v7;
    while (1)
    {
      if (v5 && v5 == self->_canceledTransactionID) {
        goto LABEL_31;
      }
      id v10 = [v4 copyToWrappedBytes:v6 forTransport:2];
      id v11 = [(PTPWrappedBytes *)v6 length];
      if (v11 != self->_writeBufferSize) {
        break;
      }
      if ([(PTPHostUSBTransport *)self writeBulkData:v6])
      {
        v9 += (uint64_t)v10;
        __ICOSLogCreate();
        if (__ICLogTypeEnabled(4))
        {
          id v12 = @"HostUSB";
          if ((unint64_t)[@"HostUSB" length] >= 0x15)
          {
            id v13 = [[@"HostUSB" substringWithRange:0, 18];
            id v12 = [v13 stringByAppendingString:@".."];
          }
          v14 = +[NSString stringWithFormat:@"sendDataPackets (full) - %8lld of %8lld bytes sent\n", v9, v8];
          unsigned int v15 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v16 = v12;
            v17 = v15;
            objc_super v18 = v16;
            uint64_t v8 = v47;
            id v19 = [(__CFString *)v18 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v49 = v19;
            __int16 v50 = 2114;
            v51 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }
        if (self->_connected) {
          continue;
        }
      }
      goto LABEL_31;
    }
    uint64_t v20 = (uint64_t)v11;
    if (v11)
    {
      if (![(PTPHostUSBTransport *)self writeBulkData:v6]) {
        goto LABEL_31;
      }
      v9 += (uint64_t)v10;
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        CFUUIDRef v21 = @"HostUSB";
        if ((unint64_t)[@"HostUSB" length] >= 0x15)
        {
          CFUUIDRef v22 = [[@"HostUSB" substringWithRange:0, 18];
          CFUUIDRef v21 = [v22 stringByAppendingString:@".."];
        }
        uint64_t v23 = +[NSString stringWithFormat:@"sendDataPackets (short) - %8lld of %8lld bytes sent\n", v9, v8];
        uint64_t v24 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v21;
          v26 = v24;
          id v27 = [(__CFString *)v25 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v49 = v27;
          __int16 v50 = 2114;
          v51 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        uint64_t v8 = v47;
      }
    }
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v28 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v29 = [@"HostUSB" substringWithRange:0, 18];
        v28 = [v29 stringByAppendingString:@".."];
      }
      v30 = +[NSString stringWithFormat:@"bytesCopied: %8lld, _maxPacketSizeBulkOut: %8d\n", v10, self->_maxPacketSizeBulkOut];
      id v31 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        CFMutableDictionaryRef v32 = v28;
        v33 = v31;
        id v34 = [(__CFString *)v32 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v49 = v34;
        __int16 v50 = 2114;
        v51 = v30;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    if (v20 % self->_maxPacketSizeBulkOut)
    {
LABEL_30:
      [v4 setBytesTransferred:v9];
      goto LABEL_31;
    }
    [(PTPWrappedBytes *)v6 setLength:0];
    if ([(PTPHostUSBTransport *)self writeBulkData:v6])
    {
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        int v40 = @"HostUSB";
        if ((unint64_t)[@"HostUSB" length] >= 0x15)
        {
          v41 = [@"HostUSB" substringWithRange:0, 18];
          int v40 = [v41 stringByAppendingString:@".."];
        }
        v42 = +[NSString stringWithFormat:@"sendDataPackets (zero) - %8lld of %8lld bytes sent\n", v9, v8];
        v43 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v40;
          v45 = v43;
          id v46 = [(__CFString *)v44 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v49 = v46;
          __int16 v50 = 2114;
          v51 = v42;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      goto LABEL_30;
    }
  }
LABEL_31:
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v36 = WeakRetained;
    id v37 = objc_loadWeakRetained(&self->_delegate);
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      id v39 = objc_loadWeakRetained(&self->_delegate);
      [v39 performSelector:"sentData:" withObject:v4];
    }
  }
  self->_busy = 0;
}

- (unsigned)deviceStatus
{
  uint64_t v21 = 0;
  CFUUIDRef v22 = 0;
  uint64_t v23 = 0;
  int v20 = 0;
  unsigned __int8 v19 = 0;
  ((void (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interfaceInterfaceRef)->GetInterfaceNumber)(self->_interfaceInterfaceRef, &v19);
  LOWORD(v21) = 26529;
  WORD2(v21) = v19;
  HIWORD(v21) = 4;
  CFUUIDRef v22 = &v20;
  uint64_t v3 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, uint64_t *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, &v21);
  __ICOSLogCreate();
  id v4 = @"HostUSB";
  if ((unint64_t)[@"HostUSB" length] >= 0x15)
  {
    unsigned int v5 = [@"HostUSB" substringWithRange:0, 18];
    id v4 = [v5 stringByAppendingString:@".."];
  }
  uint64_t v6 = +[NSString stringWithFormat:@"-> ControlRequest(): 0x%08x", v3];
  uint64_t v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v4;
    uint64_t v9 = v7;
    id v10 = [(__CFString *)v8 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (!v3)
  {
    __ICOSLogCreate();
    id v11 = @"HostUSB";
    if ((unint64_t)[@"HostUSB" length] >= 0x15)
    {
      id v12 = [@"HostUSB" substringWithRange:0, 18];
      id v11 = [v12 stringByAppendingString:@".."];
    }
    id v13 = +[NSString stringWithFormat:@"<- Data size: %d", HIWORD(v21)];
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = v11;
      __int16 v16 = v14;
      id v17 = [(__CFString *)v15 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v25 = v17;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  return HIWORD(v20);
}

- (unsigned)cancelRequest:(id)a3
{
  int v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  unsigned __int8 v20 = 0;
  unsigned __int16 v21 = 16385;
  uint64_t v22 = [a3 unsignedIntValue];
  ((void (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interfaceInterfaceRef)->GetInterfaceNumber)(self->_interfaceInterfaceRef, &v20);
  WORD2(v22) = 25761;
  LOWORD(v23) = v20;
  HIWORD(v23) = 6;
  uint64_t v24 = &v21;
  uint64_t v4 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, char *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, (char *)&v22 + 4);
  __ICOSLogCreate();
  unsigned int v5 = @"HostUSB";
  if ((unint64_t)[@"HostUSB" length] >= 0x15)
  {
    uint64_t v6 = [@"HostUSB" substringWithRange:0, 18];
    unsigned int v5 = [v6 stringByAppendingString:@".."];
  }
  uint64_t v7 = +[NSString stringWithFormat:@"(*_interfaceInterfaceRef)->ControlRequest() returned = 0x%08x\n\n", v4];
  uint64_t v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v5;
    id v10 = v8;
    id v11 = [(__CFString *)v9 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v27 = v11;
    __int16 v28 = 2114;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (!v4)
  {
    __ICOSLogCreate();
    id v12 = @"HostUSB";
    if ((unint64_t)[@"HostUSB" length] >= 0x15)
    {
      id v13 = [@"HostUSB" substringWithRange:0, 18];
      id v12 = [v13 stringByAppendingString:@".."];
    }
    v14 = +[NSString stringWithFormat:@"returned size: %d, buffer[0]: 0x%04x, buffer[1]: 0x%04x\n, buffer[2]: 0x%04x", HIWORD(v23), v21, (unsigned __int16)v22, WORD1(v22)];
    unsigned int v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = v12;
      id v17 = v15;
      id v18 = [(__CFString *)v16 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v27 = v18;
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  return v22;
}

- (void)deviceReset
{
  memset(v19, 0, sizeof(v19));
  unsigned __int8 v18 = 0;
  ((void (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interfaceInterfaceRef)->GetInterfaceNumber)(self->_interfaceInterfaceRef, &v18);
  LOWORD(v19[0]) = 26145;
  WORD2(v19[0]) = v18;
  __ICOSLogCreate();
  uint64_t v3 = @"HostUSB";
  if ((unint64_t)[@"HostUSB" length] >= 0x15)
  {
    uint64_t v4 = [@"HostUSB" substringWithRange:0, 18];
    uint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  unsigned int v5 = +[NSString stringWithFormat:@"RequestType: 0x%02x SubType: 0x%02x", 33, 102];
  uint64_t v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    uint64_t v8 = v6;
    id v9 = [(__CFString *)v7 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v21 = v9;
    __int16 v22 = 2114;
    int v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v10 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, void *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, v19);
  __ICOSLogCreate();
  id v11 = @"HostUSB";
  if ((unint64_t)[@"HostUSB" length] >= 0x15)
  {
    id v12 = [@"HostUSB" substringWithRange:0, 18];
    id v11 = [v12 stringByAppendingString:@".."];
  }
  id v13 = +[NSString stringWithFormat:@"(*_interfaceInterfaceRef)->ControlRequest() returned = 0x%08x\n\n", v10];
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = v11;
    __int16 v16 = v14;
    id v17 = [(__CFString *)v15 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v21 = v17;
    __int16 v22 = 2114;
    int v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (BOOL)writeBulkData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  if (self->_connected)
  {
    if (v5)
    {
      uint64_t v6 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, id, id, uint64_t, uint64_t))(*self->_interfaceInterfaceRef)->WritePipeTO)(self->_interfaceInterfaceRef, self->_bulkPipeOut, [v4 bytes], v5, 5000, 60000);
    }
    else
    {
      buf[0] = 0;
      uint64_t v6 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, uint8_t *, void, uint64_t, uint64_t))(*self->_interfaceInterfaceRef)->WritePipeTO)(self->_interfaceInterfaceRef, self->_bulkPipeOut, buf, 0, 5000, 60000);
    }
    uint64_t v8 = v6;
    if ((int)v6 > -536854450)
    {
      if (v6 == -536854449 || v6 == -536850432) {
        goto LABEL_21;
      }
      if (!v6)
      {
LABEL_41:
        BOOL v7 = v8 == 0;
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v9 = (v6 + 536870208);
      if (v9 <= 0x2D)
      {
        if (((1 << (v6 + 64)) & 0x280002000001) != 0)
        {
          __ICOSLogCreate();
          uint64_t v10 = @"HostUSB";
          if ((unint64_t)[@"HostUSB" length] >= 0x15)
          {
            id v11 = [[@"HostUSB" substringWithRange:0, 18];
            uint64_t v10 = [v11 stringByAppendingString:@".."];
          }
          id v12 = +[NSString stringWithFormat:@"writeBulkData: (disconnected) 0x%x:0x%x", [(PTPHostUSBTransport *)self locationID], v8];
          id v13 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v10;
            unsigned int v15 = v13;
            id v16 = [(__CFString *)v14 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v38 = v16;
            __int16 v39 = 2114;
            int v40 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          self->_connected = 0;
          goto LABEL_41;
        }
        if (v9 == 22)
        {
LABEL_21:
          __ICOSLogCreate();
          unsigned __int8 v18 = @"HostUSB";
          if ((unint64_t)[@"HostUSB" length] >= 0x15)
          {
            unsigned __int8 v19 = [@"HostUSB" substringWithRange:0, 18];
            unsigned __int8 v18 = [v19 stringByAppendingString:@".."];
          }
          unsigned __int8 v20 = +[NSString stringWithFormat:@"writeBulkData: (timedout) 0x%x:0x%x", [(PTPHostUSBTransport *)self locationID], v8];
          id v21 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = v18;
            int v23 = v21;
            id v24 = [(__CFString *)v22 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v38 = v24;
            __int16 v39 = 2114;
            int v40 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          if (v8 == -536850432 || v8 == -536854449)
          {
            __ICOSLogCreate();
            __int16 v26 = @"HostUSB";
            if ((unint64_t)[@"HostUSB" length] >= 0x15)
            {
              id v27 = [@"HostUSB" substringWithRange:0, 18];
              __int16 v26 = [v27 stringByAppendingString:@".."];
            }
            __int16 v28 = +[NSString stringWithFormat:@"writeBulkData: (cleared pipestall) 0x%x:0x%x", [(PTPHostUSBTransport *)self locationID], v8];
            v29 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v30 = v26;
              id v31 = v29;
              id v32 = [(__CFString *)v30 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v38 = v32;
              __int16 v39 = 2114;
              int v40 = v28;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            ((void (*)(IOUSBInterfaceStruct942 **, void))(*self->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(self->_interfaceInterfaceRef, self->_bulkPipeOut);
          }
          self->_timedOut = 1;
          goto LABEL_41;
        }
      }
    }
    __ICOSLogCreate();
    v33 = @"HostUSB";
    if ((unint64_t)[@"HostUSB" length] >= 0x15)
    {
      id v34 = [[@"HostUSB" substringWithRange:0, 18];
      v33 = [v34 stringByAppendingString:@".."];
    }
    CFUUIDBytes v35 = +[NSString stringWithFormat:@"writeBulkData: (general) 0x%x:0x%x", [(PTPHostUSBTransport *)self locationID], v8];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }

    goto LABEL_41;
  }
  BOOL v7 = 0;
LABEL_42:

  return v7;
}

- (int)readInterruptData
{
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007EB8;
  v11[3] = &unk_10004C870;
  objc_copyWeak(&v12, &location);
  id v3 = [v11 copy];
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  ReadPipeAsync = (*interfaceInterfaceRef)->ReadPipeAsync;
  uint64_t interruptPipeIn = self->_interruptPipeIn;
  eventDataBuffer = self->_eventDataBuffer;
  uint64_t eventDataBufferSize = self->_eventDataBufferSize;
  id v9 = objc_retainBlock(v3);
  LODWORD(eventDataBufferSize) = ((uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, char *, uint64_t, void (*)(void (**)(void)), id))ReadPipeAsync)(interfaceInterfaceRef, interruptPipeIn, eventDataBuffer, eventDataBufferSize, sub_1000080A4, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return eventDataBufferSize;
}

- (void)handleInterruptData:(unint64_t)a3
{
  if (self->_connected)
  {
    [(NSMutableData *)self->_eventData appendBytes:self->_eventDataBuffer length:a3];
    unsigned int v4 = [(NSMutableData *)self->_eventData length];
    if (v4)
    {
      unsigned int v5 = v4;
      do
      {
        uint64_t v6 = [(NSMutableData *)self->_eventData mutableBytes];
        CFIndex v7 = *(unsigned int *)v6;
        if (v5 < v7) {
          break;
        }
        if (v6[2] == 4)
        {
          uint64_t v8 = [[PTPEventPacket alloc] initWithUSBBuffer:v6];
          id WeakRetained = objc_loadWeakRetained(&self->_delegate);
          if (WeakRetained)
          {
            uint64_t v10 = WeakRetained;
            id v11 = objc_loadWeakRetained(&self->_delegate);
            char v12 = objc_opt_respondsToSelector();

            if (v12)
            {
              id v13 = objc_loadWeakRetained(&self->_delegate);
              [v13 performSelectorOnMainThread:"handleEvent:" withObject:v8 waitUntilDone:0];
            }
          }
        }
        v26.id location = 0;
        v26.length = v7;
        CFDataDeleteBytes((CFMutableDataRef)self->_eventData, v26);
        CFIndex v14 = v5 - v7;
        if (v14)
        {
          __ICOSLogCreate();
          unsigned int v15 = @"HostUSB";
          if ((unint64_t)[@"HostUSB" length] >= 0x15)
          {
            id v16 = [@"HostUSB" substringWithRange:0, 18];
            unsigned int v15 = [v16 stringByAppendingString:@".."];
          }
          id v17 = +[NSString stringWithFormat:@"%d excess byte(s) received -- placing them in the bit bucket\n", v14];
          unsigned __int8 v18 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v19 = v15;
            unsigned __int8 v20 = v18;
            id v21 = [(__CFString *)v19 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v23 = v21;
            __int16 v24 = 2114;
            uint64_t v25 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          v27.id location = 0;
          v27.length = v14;
          CFDataDeleteBytes((CFMutableDataRef)self->_eventData, v27);
        }
        unsigned int v5 = [(NSMutableData *)self->_eventData length];
      }
      while (v5);
    }
  }
}

- (int)readResponseData:(id)a3 withTimeout:(unsigned int)a4
{
  id v6 = a3;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 1;
  [(PTPHostUSBTransport *)self setTimedOut:0];
  id v34 = v6;
  v33 = [v6 txID];
  uint64_t v7 = 1000 * a4;
  uint64_t delta = 2000000000 * a4;
  while ([(PTPHostUSBTransport *)self connected]
       && ![(PTPHostUSBTransport *)self timedOut]
       && ([v34 txComplete] & 1) == 0)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000089C4;
    v35[3] = &unk_10004C898;
    objc_copyWeak(&v39, &location);
    id v36 = v33;
    id v38 = v41;
    id v9 = v8;
    id v37 = v9;
    id v10 = [v35 copy];
    id v11 = [v34 bufMutableBytes];
    id v12 = [v34 bufSize];
    if (!v11)
    {
      __ICOSLogCreate();
      if ((unint64_t)[@"HostUSB" length] < 0x15)
      {
        CFRange v26 = @"HostUSB";
      }
      else
      {
        uint64_t v25 = [[@"HostUSB" substringWithRange:0, 18];
        CFRange v26 = [v25 stringByAppendingString:@".."];
      }
      v29 = +[NSString stringWithFormat:@"buf provided is NULL"];
      v30 = (id)_gICOSLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        CFRange v26 = v26;
        sub_100033CAC((uint64_t)[(__CFString *)v26 UTF8String], (uint64_t)v29, (uint64_t)buf);
      }
LABEL_30:

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);

      break;
    }
    id v13 = v12;
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      CFIndex v14 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        unsigned int v15 = [@"HostUSB" substringWithRange:0, 18];
        CFIndex v14 = [v15 stringByAppendingString:@".."];
      }
      id v16 = +[NSString stringWithFormat:@"ReadPipeAsyncTO: %d bytes", v13];
      id v17 = (id)_gICOSLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(__CFString *)v14 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v44 = v18;
        __int16 v45 = 2114;
        id v46 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    interfaceInterfaceRef = self->_interfaceInterfaceRef;
    ReadPipeAsyncTO = (*interfaceInterfaceRef)->ReadPipeAsyncTO;
    uint64_t bulkPipeIn = self->_bulkPipeIn;
    id v22 = objc_retainBlock(v10);
    uint64_t v23 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, id, id, uint64_t, uint64_t, void (*)(uint64_t, int, uint64_t), id))ReadPipeAsyncTO)(interfaceInterfaceRef, bulkPipeIn, v11, v13, v7, v7, sub_100008E4C, v22);

    if (v23)
    {
      __ICOSLogCreate();
      if ((unint64_t)[@"HostUSB" length] < 0x15)
      {
        CFRange v26 = @"HostUSB";
      }
      else
      {
        CFRange v27 = [@"HostUSB" substringWithRange:0, 18];
        CFRange v26 = [v27 stringByAppendingString:@".."];
      }
      v29 = +[NSString stringWithFormat:@"ReadPipeAsyncTO returned %x -- bailing", v23];
      v30 = (id)_gICOSLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    dispatch_time_t v24 = dispatch_time(0, delta);
    if (dispatch_semaphore_wait(v9, v24))
    {
      __ICOSLogCreate();
      if ((unint64_t)[@"HostUSB" length] < 0x15)
      {
        CFRange v26 = @"HostUSB";
      }
      else
      {
        __int16 v28 = [@"HostUSB" substringWithRange:0, 18];
        CFRange v26 = [v28 stringByAppendingString:@".."];
      }
      v29 = +[NSString stringWithFormat:@"ReadPipeAsyncTO timed out -- bailing"];
      v30 = (id)_gICOSLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      goto LABEL_30;
    }

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(v41, 8);

  return 0;
}

- (id)getTransaction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PTPHostUSBTransport *)self transactions];
  objc_sync_enter(v5);
  id v6 = [(PTPHostUSBTransport *)self transactions];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)addTransaction:(id)a3
{
  id v7 = a3;
  id v4 = [(PTPHostUSBTransport *)self transactions];
  objc_sync_enter(v4);
  unsigned int v5 = [(PTPHostUSBTransport *)self transactions];
  id v6 = [v7 txID];
  [v5 setObject:v7 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (void)removeTransaction:(id)a3
{
  id v6 = a3;
  id v4 = [(PTPHostUSBTransport *)self transactions];
  objc_sync_enter(v4);
  unsigned int v5 = [(PTPHostUSBTransport *)self transactions];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)handleBulkData:(unint64_t)a3 result:(int)a4 forTxID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  dispatch_semaphore_t v8 = [(PTPHostUSBTransport *)self getTransaction:a5];
  id v9 = v8;
  if (v5)
  {
    __ICOSLogCreate();
    id v10 = @"HostUSB";
    if ((unint64_t)[@"HostUSB" length] >= 0x15)
    {
      id v11 = [@"HostUSB" substringWithRange:0, 18];
      id v10 = [v11 stringByAppendingString:@".."];
    }
    id v12 = +[NSString stringWithFormat:@"Read failed: %d", v5];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }

    if (v9) {
      goto LABEL_7;
    }
  }
  else if (self->_connected && v8 != 0)
  {
    CFIndex v14 = (unsigned int *)[v8 bufMutableBytes];
    unsigned int v15 = [v9 bufSize];
    if (!v14 || !v15)
    {
LABEL_7:
      [v9 setTxComplete:1];
      goto LABEL_13;
    }
    unsigned int v16 = [v9 containerType];
    unsigned int v17 = [v9 containerType];
    if (a3 >= 0xC && !v17)
    {
      uint64_t v18 = *v14;
      if (v18 >= 0xC && (v14[1] & 0xFFFE) == 2)
      {
        [v9 setContainerType:];
        [v9 setContainerLength:v18];
        unsigned __int8 v19 = [v9 rxDataBuffer];
        [v19 setHeaderOffset:12];
      }
    }
    if ([v9 containerType])
    {
      unsigned int v20 = [v9 containerType];
      if (v20 == 3)
      {
        if ([v9 containerLength] <= a3)
        {
          if (([v9 dataReceived] & 1) == 0
            && [v9 dataExpected])
          {
            CFIndex v14 = (unsigned int *)[v9 rxDataMutableBytes];
          }
          dispatch_time_t v24 = [[PTPOperationResponsePacket alloc] initWithUSBBuffer:v14];
          [v9 setResponsePacket:v24];
          if (!v24)
          {
            __ICOSLogCreate();
            uint64_t v25 = @"HostUSB";
            if ((unint64_t)[@"HostUSB" length] >= 0x15)
            {
              CFRange v26 = [@"HostUSB" substringWithRange:0, 18];
              uint64_t v25 = [v26 stringByAppendingString:@".."];
            }
            CFRange v27 = +[NSString stringWithFormat:@"PTP PTPHostUSBTransport received bad response!"];
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
              sub_100033C1C();
            }
          }
        }
        goto LABEL_7;
      }
      if (v20 == 2)
      {
        if (a3 > 0xB || v16)
        {
          unsigned int v21 = [v9 rxCopyDataBuffer];
          id v22 = [v9 rxDataBuffer];
          uint64_t v23 = v22;
          if (v21) {
            [v22 appendBytes:v14 length:a3];
          }
          else {
            [v22 setLength:a3];
          }
        }
        id v31 = [v9 rxDataBuffer];
        id v32 = [v31 length];
        unsigned int v33 = [v9 containerLength];

        if (v32 == (id)v33)
        {
          if (v16 || (unsigned int v36 = [v9 containerLength], a3 != 12) || v36 <= 0xC)
          {
            [v9 setContainerType:0];
            [v9 setContainerLength:0];
          }
          id v34 = [v9 rxDataBuffer];
          CFUUIDBytes v35 = [v9 rxDataBuffer];
          [v34 setLength:((char *)[v35 length]) - 12];

          [v9 setDataReceived:1];
        }
      }
      else
      {
        __ICOSLogCreate();
        __int16 v28 = @"HostUSB";
        if ((unint64_t)[@"HostUSB" length] >= 0x15)
        {
          v29 = [@"HostUSB" substringWithRange:0, 18];
          __int16 v28 = [v29 stringByAppendingString:@".."];
        }
        v30 = +[NSString stringWithFormat:@"PTP PTPHostUSBTransport received unrecognizable packet!"];
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
          sub_100033C1C();
        }
      }
    }
  }
LABEL_13:
}

- (void)clearPipeStall:(unsigned __int8)a3
{
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  if (interfaceInterfaceRef)
  {
    uint64_t v5 = a3;
    __int16 v14 = 0;
    __int16 v13 = 0;
    __int16 v12 = 0;
    uint64_t v11 = 0;
    ((void (*)(IOUSBInterfaceStruct942 **, void, char *, __int16 *, char *, __int16 *, __int16 *))(*interfaceInterfaceRef)->GetPipeProperties)(interfaceInterfaceRef, a3, (char *)&v14 + 1, &v14, (char *)&v13 + 1, &v12, &v13);
    int v7 = 258;
    if (HIBYTE(v14) == 1) {
      __int16 v6 = v14 + 128;
    }
    else {
      __int16 v6 = v14;
    }
    __int16 v8 = v6;
    __int16 v9 = 0;
    uint64_t v10 = 0;
    ((void (*)(IOUSBInterfaceStruct942 **, void, int *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, &v7);
    ((void (*)(IOUSBInterfaceStruct942 **, uint64_t))(*self->_interfaceInterfaceRef)->ClearPipeStall)(self->_interfaceInterfaceRef, v5);
  }
}

- (void)clearBulkInPipeStall
{
  __ICOSLogCreate();
  id v3 = @"HostUSB";
  if ((unint64_t)[@"HostUSB" length] >= 0x15)
  {
    id v4 = [@"HostUSB" substringWithRange:0, 18];
    id v3 = [v4 stringByAppendingString:@".."];
  }
  uint64_t v5 = +[NSString stringWithFormat:@"*** clearBulkInPipeStall"];
  __int16 v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v3;
    __int16 v8 = v6;
    int v10 = 136446466;
    id v11 = [(__CFString *)v7 UTF8String];
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
  }
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  if (interfaceInterfaceRef)
  {
    if (self->_bulkPipeIn) {
      ((void (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->ClearPipeStallBothEnds)(interfaceInterfaceRef);
    }
  }
}

- (void)abortPendingIO
{
  __ICOSLogCreate();
  id v3 = @"PTPTransport";
  if ((unint64_t)[@"PTPTransport" length] >= 0x15)
  {
    id v4 = [@"PTPTransport" substringWithRange:0, 18];
    id v3 = [v4 stringByAppendingString:@".."];
  }
  uint64_t v5 = +[NSString stringWithFormat:@"%p | %16s - 0x%08X", self, "abortPipe locID", [(PTPHostUSBTransport *)self locationID]];
  __int16 v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v3;
    __int16 v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v11 = [(__CFString *)v7 UTF8String];
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  if (interfaceInterfaceRef)
  {
    if (self->_interruptPipeIn) {
      ((void (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->AbortPipe)(interfaceInterfaceRef);
    }
    if (self->_bulkPipeIn) {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
    }
    if (self->_bulkPipeOut) {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
    }
  }
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

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
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

- (unsigned)bulkPipeIn
{
  return self->_bulkPipeIn;
}

- (void)setBulkPipeIn:(unsigned __int8)a3
{
  self->_uint64_t bulkPipeIn = a3;
}

- (unsigned)bulkPipeOut
{
  return self->_bulkPipeOut;
}

- (void)setBulkPipeOut:(unsigned __int8)a3
{
  self->_bulkPipeOut = a3;
}

- (unsigned)interruptPipeIn
{
  return self->_interruptPipeIn;
}

- (void)setInterruptPipeIn:(unsigned __int8)a3
{
  self->_uint64_t interruptPipeIn = a3;
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

- (unsigned)eventDataBufferSize
{
  return self->_eventDataBufferSize;
}

- (void)setEventDataBufferSize:(unsigned int)a3
{
  self->_uint64_t eventDataBufferSize = a3;
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

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
}

- (unsigned)canceledTransactionID
{
  return self->_canceledTransactionID;
}

- (void)setCanceledTransactionID:(unsigned int)a3
{
  self->_canceledTransactionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_usbSerialNumberString, 0);
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong((id *)&self->_machRecvSemaphore, 0);
}

@end