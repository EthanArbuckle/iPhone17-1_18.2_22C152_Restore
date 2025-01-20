@interface EAOverHID
- (BOOL)accessoryInfoValid;
- (BOOL)applyStagedFirmwareVersionsAfterDelay:(unsigned __int16)a3;
- (BOOL)publishEAAccessory;
- (BOOL)queryAllCurrentFirmwareVersions;
- (BOOL)queryAllStagedFirmwareVersions;
- (BOOL)registerForHIDCallbacks;
- (BOOL)sendControlMessageOutputReport:(int)a3 payload:(char *)a4 payloadLength:(unsigned __int16)a5;
- (BOOL)sendEAMessageOutputReport:(id)a3;
- (BOOL)sendHIDReport:(char *)a3 reportID:(int)a4 length:(int)a5;
- (BOOL)sendVendorSpecificRequest:(id)a3;
- (EAHIDAccessory)eaHIDAccessory;
- (EAOverHID)init;
- (id)getEAProductIDForAccessory;
- (id)getProtocolString;
- (id)getSerialNumber;
- (unsigned)getReportSizeForReportUsage:(unsigned int)a3;
- (unsigned)getServiceForRegistryID:(unint64_t)a3;
- (void)accessoryAttached:(id)a3 withInfo:(id)a4;
- (void)cleanupEASession;
- (void)dealloc;
- (void)getHIDAccessoryInformation;
- (void)handleHIDAccessoryDisconnect;
- (void)idleExitAllowed:(BOOL)a3;
- (void)logDebugMessageFromAccessory:(char *)a3 length:(int64_t)a4;
- (void)overrideProtocol:(id)a3;
- (void)parseInputReportWithId:(unsigned int)a3 andBuffer:(id)a4;
- (void)processControlMessageRequest:(id)a3;
- (void)processControlMessageResponse:(id)a3;
- (void)processIncomingEADataFromPlugin:(id)a3;
- (void)processInputControlMessageReport:(id)a3;
- (void)processInputEAMessageReportFromAccessory:(id)a3;
- (void)queueEvent:(id)a3 withInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEaHIDAccessory:(id)a3;
- (void)verifyMinimumFirmwareVersion:(BOOL)a3;
@end

@implementation EAOverHID

- (EAOverHID)init
{
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  v3 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[EAOverHID init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tracer: %s", buf, 0xCu);
  }
  v11.receiver = self;
  v11.super_class = (Class)EAOverHID;
  v4 = [(EAOverHID *)&v11 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.accessoryupdater.eaoverhid.queue", v5);
    v4->_eaHIDQueue = (OS_dispatch_queue *)v6;
    if (v6)
    {
      v7 = dlopen("/System/Library/PrivateFrameworks/CoreAccessories.framework/CoreAccessories", 4);
      v4->_coreAccFrameworkRef = v7;
      if (!v7)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Error: Failed to dlopen CoreAccessories.framework";
        goto LABEL_49;
      }
      off_1000963C0 = dlsym(v7, "acc_transportClient_createConnection");
      if (!off_1000963C0)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_createConnection";
        goto LABEL_49;
      }
      off_1000963C8 = dlsym(v4->_coreAccFrameworkRef, "acc_transportClient_createEndpoint");
      if (!off_1000963C8)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_createEndpoint";
        goto LABEL_49;
      }
      off_1000963D0 = dlsym(v4->_coreAccFrameworkRef, "acc_transportClient_setAccessoryInfo");
      if (!off_1000963D0)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_setAccessoryInfo";
        goto LABEL_49;
      }
      off_1000963D8 = dlsym(v4->_coreAccFrameworkRef, "acc_transportClient_setEndpointPropertyDidChangeHandler");
      if (!off_1000963D8)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_setEndpointPropertyDidChangeHandler";
        goto LABEL_49;
      }
      off_1000963E0 = dlsym(v4->_coreAccFrameworkRef, "acc_transportClient_publishConnection");
      if (!off_1000963E0)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_publishConnection";
        goto LABEL_49;
      }
      off_1000963E8 = dlsym(v4->_coreAccFrameworkRef, "acc_transportClient_processIncomingData");
      if (!off_1000963E8)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        v9 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_processIncomingData";
        goto LABEL_49;
      }
      off_1000963F0 = dlsym(v4->_coreAccFrameworkRef, "acc_transportClient_destroyEndpoint");
      if (off_1000963F0)
      {
        v4->_queuedEvents = 0;
        v4->_isActive = 0;
        v4->_input = 0;
        *(_WORD *)&v4->_hidDeviceScheduled = 0;
        v4->_overrideProtocol = 0;
        *(void *)&v4->_expectedHIDMessageID = 0;
        *(_WORD *)&v4->_dispatchGroupHeld = 256;
        return v4;
      }
      if (qword_1000963B0 != -1) {
        dispatch_once(&qword_1000963B0, &stru_10007DC68);
      }
      v9 = qword_1000963B8;
      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v10 = "Symbol not found for acc_transportClient_destroyEndpoint";
LABEL_49:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      }
    }
LABEL_50:

    return 0;
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EAOverHIDDelegate *)a3;
}

- (id)getSerialNumber
{
  return [(EAHIDAccessory *)self->_eaHIDAccessory serialNumber];
}

- (id)getProtocolString
{
  return [(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString];
}

- (void)overrideProtocol:(id)a3
{
  self->_overrideProtocol = (NSString *)a3;
}

- (void)verifyMinimumFirmwareVersion:(BOOL)a3
{
  self->_verifyMinFWVersion = a3;
}

- (void)accessoryAttached:(id)a3 withInfo:(id)a4
{
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  v7 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v24) = 136315138;
    *(void *)((char *)&v24 + 4) = "-[EAOverHID accessoryAttached:withInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tracer: %s", (uint8_t *)&v24, 0xCu);
  }
  if (self->_isActive)
  {
    [(EAOverHID *)self queueEvent:a3 withInfo:a4];
    return;
  }
  self->_isActive = 1;
  self->_eaStreamReady = 0;
  *(void *)&self->_expectedHIDMessageID = 0;
  [(EAOverHID *)self idleExitAllowed:0];
  if ([a4 objectForKeyedSubscript:@"IOMatchLaunchServiceID"])
  {
    id v8 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IOMatchLaunchServiceID"), "unsignedLongLongValue");
    io_service_t v9 = [(EAOverHID *)self getServiceForRegistryID:v8];
    if (v9)
    {
      io_object_t v10 = v9;
      IOHIDDeviceRef v11 = IOHIDDeviceCreate(kCFAllocatorDefault, v9);
      if (v11)
      {
        IOHIDDeviceRef v12 = v11;
        v13 = [[EAHIDAccessory alloc] initWithName:a3 HIDDeviceRef:v11];
        self->_eaHIDAccessory = v13;
        if (v13)
        {
          if ([(EAOverHID *)self registerForHIDCallbacks])
          {
            if (![a4 objectForKey:@"QueryAccInfo"]
              || objc_msgSend(objc_msgSend(a4, "objectForKey:", @"QueryAccInfo"), "BOOLValue"))
            {
              [(EAOverHID *)self getHIDAccessoryInformation];
            }
            goto LABEL_14;
          }
          if (qword_1000963B0 != -1) {
            dispatch_once(&qword_1000963B0, &stru_10007DC68);
          }
          uint64_t v23 = qword_1000963B8;
          if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
          {
LABEL_40:
            [(EAOverHID *)self cleanupEASession];
LABEL_14:
            IOObjectRelease(v10);
            return;
          }
          LODWORD(v24) = 138412290;
          *(void *)((char *)&v24 + 4) = v12;
          v20 = "ERROR: Failed to register for HID Callbacks for IOHIDDevice %@";
        }
        else
        {
          if (qword_1000963B0 != -1) {
            dispatch_once(&qword_1000963B0, &stru_10007DC68);
          }
          uint64_t v23 = qword_1000963B8;
          if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_40;
          }
          LODWORD(v24) = 138412290;
          *(void *)((char *)&v24 + 4) = v12;
          v20 = "ERROR: Failed to create EAAccessory for IOHIDDevice %@";
        }
        v21 = v23;
        uint32_t v22 = 12;
      }
      else
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        uint64_t v19 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        LODWORD(v24) = 67109120;
        DWORD1(v24) = v10;
        v20 = "ERROR: Failed to create IOHIDDevice for service 0x%x";
        v21 = v19;
        uint32_t v22 = 8;
      }
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, v22);
      goto LABEL_40;
    }
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v18 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    LODWORD(v24) = 134217984;
    *(void *)((char *)&v24 + 4) = v8;
    v15 = "ERROR: Failed to create ioservice for registryEntryID 0x%llx";
    v16 = v18;
    uint32_t v17 = 12;
  }
  else
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v14 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    LOWORD(v24) = 0;
    v15 = "ERROR: IOMatchLaunchServiceID not present in info dict";
    v16 = v14;
    uint32_t v17 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, v17);
LABEL_25:
  [(EAOverHID *)self cleanupEASession];
}

- (void)queueEvent:(id)a3 withInfo:(id)a4
{
  if (a3 && a4)
  {
    v7 = [[EAOverHIDEvent alloc] initWithName:a3 info:a4];
    if (v7)
    {
      id v8 = v7;
      if (!self->_queuedEvents) {
        self->_queuedEvents = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      }
      if (qword_1000963B0 != -1) {
        dispatch_once(&qword_1000963B0, &stru_10007DC68);
      }
      io_service_t v9 = qword_1000963B8;
      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        IOHIDDeviceRef v12 = "-[EAOverHID queueEvent:withInfo:]";
        __int16 v13 = 2112;
        id v14 = a3;
        __int16 v15 = 2112;
        id v16 = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Queueing EAOverHID Event for filtername: %@ info: %@", (uint8_t *)&v11, 0x20u);
      }
      [(NSMutableArray *)self->_queuedEvents addObject:v8];
    }
  }
  else
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    io_object_t v10 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      IOHIDDeviceRef v12 = "-[EAOverHID queueEvent:withInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid filetername or info dict", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)registerForHIDCallbacks
{
  eaHIDAccessory = self->_eaHIDAccessory;
  if (eaHIDAccessory)
  {
    eaHIDAccessory = [(EAHIDAccessory *)eaHIDAccessory HIDDevice];
    if (eaHIDAccessory)
    {
      [(EAHIDAccessory *)self->_eaHIDAccessory setHIDReportSizeInput:[(EAOverHID *)self getReportSizeForReportUsage:1] >> 3];
      LODWORD(eaHIDAccessory) = [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportSizeInput];
      if (eaHIDAccessory)
      {
        [(EAHIDAccessory *)self->_eaHIDAccessory setHIDReportSizeOutput:[(EAOverHID *)self getReportSizeForReportUsage:2] >> 3];
        LODWORD(eaHIDAccessory) = [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportSizeOutput];
        if (eaHIDAccessory)
        {
          if (IOHIDDeviceOpen([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice], 0))
          {
            LOBYTE(eaHIDAccessory) = 0;
          }
          else
          {
            IOHIDDeviceRegisterRemovalCallback([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice], (IOHIDCallback)sub_100038638, self);
            self->_input = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", -[EAHIDAccessory HIDReportSizeInput](self->_eaHIDAccessory, "HIDReportSizeInput")+ 1);
            IOHIDDeviceRegisterInputReportCallback([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice], (uint8_t *)[(NSMutableData *)self->_input mutableBytes], [(NSMutableData *)self->_input length], (IOHIDReportCallback)sub_1000386D4, self);
            v4 = [(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice];
            Main = CFRunLoopGetMain();
            IOHIDDeviceScheduleWithRunLoop(v4, Main, kCFRunLoopDefaultMode);
            LOBYTE(eaHIDAccessory) = 1;
            self->_hidDeviceScheduled = 1;
          }
        }
      }
    }
  }
  return (char)eaHIDAccessory;
}

- (void)getHIDAccessoryInformation
{
  eaHIDQueue = self->_eaHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003893C;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)qword_1000975B0, eaHIDQueue, block);
}

- (BOOL)sendControlMessageOutputReport:(int)a3 payload:(char *)a4 payloadLength:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  LODWORD(v25) = 0;
  HIDWORD(v25) = a3;
  uint64_t v24 = 0;
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  io_service_t v9 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DEBUG: Creating HID Report for Control message 0x%x\n", buf, 8u);
  }
  eaHIDAccessory = self->_eaHIDAccessory;
  if (!eaHIDAccessory || ![(EAHIDAccessory *)eaHIDAccessory HIDDevice]) {
    goto LABEL_29;
  }
  id v11 = objc_alloc_init((Class)NSMutableData);
  WORD1(v25) = 2560;
  [v11 appendBytes:(char *)&v25 + 2 length:2];
  int v12 = self->_expectedHIDMessageID + 1;
  self->_expectedHIDMessageID = v12;
  LOWORD(v25) = bswap32(v12) >> 16;
  [v11 appendBytes:&v25 length:2];
  HIWORD(v24) = bswap32(v5 + 14) >> 16;
  [v11 appendBytes:(char *)&v24 + 6 length:2];
  HIDWORD(v25) = bswap32(a3) >> 16;
  [v11 appendBytes:(char *)&v25 + 4 length:2];
  WORD2(v24) = 256;
  [v11 appendBytes:(char *)&v24 + 4 length:2];
  int v13 = self->_expectedControlMessageID + 1;
  self->_expectedControlMessageID = v13;
  WORD1(v24) = bswap32(v13) >> 16;
  [v11 appendBytes:(char *)&v24 + 2 length:2];
  LOWORD(v24) = bswap32(v5 + 8) >> 16;
  [v11 appendBytes:&v24 length:2];
  if (a4) {
    [v11 appendBytes:a4 length:v5];
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  id v14 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DEBUG: Sending HID Report to Accessory: %@\n", buf, 0xCu);
  }
  id v15 = [v11 length];
  if ((unint64_t)v15 > [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportSizeOutput])
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v17 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    id v18 = [v11 length];
    unsigned int v19 = [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportSizeOutput];
    *(_DWORD *)buf = 134218240;
    id v27 = v18;
    __int16 v28 = 1024;
    unsigned int v29 = v19;
    v20 = "ERROR: Size of outputReport %lu > HID Output Report Size from accessory descriptor %d";
    v21 = v17;
    uint32_t v22 = 18;
    goto LABEL_26;
  }
  if (!-[EAOverHID sendHIDReport:reportID:length:](self, "sendHIDReport:reportID:length:", [v11 bytes], -[EAHIDAccessory HIDReportID](self->_eaHIDAccessory, "HIDReportID"), objc_msgSend(v11, "length")))
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v23 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = HIDWORD(v25);
    v20 = "Failed to send HID Report for Control message 0x%x\n";
    v21 = v23;
    uint32_t v22 = 8;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_27:
    if (v11) {

    }
LABEL_29:
    [(EAOverHID *)self cleanupEASession];
    return 0;
  }
  if (v11) {

  }
  return 1;
}

- (BOOL)sendHIDReport:(char *)a3 reportID:(int)a4 length:(int)a5
{
  if (![(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice]) {
    return 0;
  }
  BOOL v9 = 1;
  self->_expectedState = 1;
  IOReturn v10 = IOHIDDeviceSetReport([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice], kIOHIDReportTypeOutput, a4, (const uint8_t *)a3, a5);
  if (v10)
  {
    IOReturn v12 = v10;
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    int v13 = qword_1000963B8;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      id v15 = a3;
      __int16 v16 = 1024;
      IOReturn v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to send HID Report %s: 0x%x\n", (uint8_t *)&v14, 0x12u);
      return 0;
    }
  }
  return v9;
}

- (void)parseInputReportWithId:(unsigned int)a3 andBuffer:(id)a4
{
  if ((unint64_t)[a4 length] > 5)
  {
    id v8 = a4;
    if ([(EAHIDAccessory *)self->_eaHIDAccessory HIDReportID] == a3)
    {
      BOOL v9 = [a4 bytes];
      if (v9)
      {
        if ((v9[1] & 8) != 0)
        {
          eaHIDQueue = self->_eaHIDQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000390E4;
          block[3] = &unk_10007D4B0;
          block[4] = self;
          void block[5] = a4;
          dispatch_group_async((dispatch_group_t)qword_1000975B0, eaHIDQueue, block);
        }
        else
        {
          if ((v9[1] & 4) != 0)
          {
            IOReturn v12 = self->_eaHIDQueue;
            v13[0] = _NSConcreteStackBlock;
            v13[1] = 3221225472;
            v13[2] = sub_1000390F0;
            v13[3] = &unk_10007D4B0;
            v13[4] = self;
            v13[5] = a4;
            dispatch_group_async((dispatch_group_t)qword_1000975B0, v12, v13);
            if (!a4) {
              return;
            }
LABEL_17:

            return;
          }
          if (qword_1000963B0 != -1) {
            dispatch_once(&qword_1000963B0, &stru_10007DC68);
          }
          IOReturn v10 = qword_1000963B8;
          if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v16 = a4;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalid Incoming HID Message: %@", buf, 0xCu);
            if (!a4) {
              return;
            }
            goto LABEL_17;
          }
        }
      }
    }
    if (!a4) {
      return;
    }
    goto LABEL_17;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  v7 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v16 = [a4 length];
    __int16 v17 = 1024;
    int v18 = 6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HID Report received with invalid length: %lu expected: %u", buf, 0x12u);
  }
}

- (void)processInputControlMessageReport:(id)a3
{
  if (a3 && (unint64_t)[a3 length] > 0xD)
  {
    id v5 = a3;
    dispatch_queue_t v6 = [a3 bytes];
    if (v6)
    {
      unsigned int v7 = __rev16(*((unsigned __int16 *)v6 + 1));
      char v8 = v6[9];
      self->_expectedState = 2;
      if ((v8 & 2) != 0)
      {
        if (v7 == self->_expectedHIDMessageID)
        {
          id v10 = objc_msgSend(a3, "subdataWithRange:", 6, (char *)objc_msgSend(a3, "length") - 6);
          if (v10) {
            [(EAOverHID *)self processControlMessageResponse:v10];
          }
        }
      }
      else if ((v8 & 5) != 0)
      {
        self->_expectedHIDMessageID = v7;
        id v9 = objc_msgSend(a3, "subdataWithRange:", 6, (char *)objc_msgSend(a3, "length") - 6);
        if (v9) {
          [(EAOverHID *)self processControlMessageRequest:v9];
        }
      }
    }
LABEL_11:

    return;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  id v11 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "-[EAOverHID processInputControlMessageReport:]";
    __int16 v14 = 2048;
    id v15 = [a3 length];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Invalid payload length=%ld\n", (uint8_t *)&v12, 0x16u);
  }
  if (a3) {
    goto LABEL_11;
  }
}

- (void)processControlMessageRequest:(id)a3
{
  if (a3 && (unint64_t)[a3 length] > 7)
  {
    id v5 = (unsigned __int8 *)[a3 bytes];
    if (v5)
    {
      dispatch_queue_t v6 = v5;
      int v7 = *v5;
      int v8 = v5[1];
      self->_expectedControlMessageID = bswap32(*((unsigned __int16 *)v5 + 2)) >> 16;
      unint64_t v9 = __rev16(*((unsigned __int16 *)v5 + 3));
      if (v9 >= 9)
      {
        int v10 = v8 | (v7 << 8);
        if ((unint64_t)[a3 length] >= v9 && v10 == 10)
        {
          [(EAOverHID *)self logDebugMessageFromAccessory:v6 + 8 length:v9 - 8];
          self->_expectedState = 1;
        }
      }
    }
  }
  else
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    int v12 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      __int16 v14 = "-[EAOverHID processControlMessageRequest:]";
      __int16 v15 = 2048;
      id v16 = [a3 length];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Invalid payload length=%ld\n", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)processControlMessageResponse:(id)a3
{
  if (a3 && (unint64_t)[a3 length] > 7)
  {
    id v5 = a3;
    dispatch_queue_t v6 = (unsigned __int16 *)[a3 bytes];
    if (v6)
    {
      int v7 = v6;
      unsigned int v8 = __rev16(*v6);
      int v9 = *((unsigned __int8 *)v6 + 3);
      int v10 = v9 | (*((unsigned __int8 *)v6 + 2) << 8);
      if ((v9 & 0x10) != 0)
      {
        if (self->_expectedControlMessageID == bswap32(v6[2]) >> 16)
        {
          unsigned int v11 = __rev16(v6[3]);
          unsigned __int16 v12 = v11 - 8;
          if (v11 >= 8)
          {
            if (qword_1000963B0 != -1) {
              dispatch_once(&qword_1000963B0, &stru_10007DC68);
            }
            int v13 = qword_1000963B8;
            if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v38 = 67109376;
              *(_DWORD *)&v38[4] = v8;
              *(_WORD *)&v38[8] = 1024;
              *(_DWORD *)&v38[10] = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received Control Message 0x%x, payloadlength = %d", v38, 0xEu);
            }
            if ((unint64_t)[a3 length] >= v12 + 8)
            {
              switch(v8)
              {
                case 1u:
                  if (v12)
                  {
                    id v14 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v14)
                    {
                      overrideProtocol = self->_overrideProtocol;
                      if (!overrideProtocol) {
                        overrideProtocol = (NSString *)[objc_alloc((Class)NSString) initWithData:v14 encoding:4];
                      }
                      [(EAHIDAccessory *)self->_eaHIDAccessory setEAProtocolString:overrideProtocol];
                      if ([(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString])
                      {
                        [(EAOverHID *)self sendControlMessageOutputReport:4 payload:0 payloadLength:0];
                        unsigned int v8 = 1;
                      }
                      else
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        uint64_t v36 = qword_1000963B8;
                        unsigned int v8 = 1;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v38 = 136315394;
                          *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                          *(_WORD *)&v38[12] = 1024;
                          *(_DWORD *)&v38[14] = 1;
                          v32 = "%s: MessageType 0x%x: Failed to create EAProtocolString\n";
                          goto LABEL_170;
                        }
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 1;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 1;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
                        goto LABEL_170;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 1;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 1;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  break;
                case 2u:
                  self->_expectedState = 1;
                  unsigned int v8 = 2;
                  break;
                case 3u:
                  [(EAOverHID *)self cleanupEASession];
                  unsigned int v8 = 3;
                  break;
                case 4u:
                  if (v12)
                  {
                    id v16 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v16)
                    {
                      -[EAHIDAccessory setName:](self->_eaHIDAccessory, "setName:", [objc_alloc((Class)NSString) initWithData:v16 encoding:4]);
                      if ([(EAHIDAccessory *)self->_eaHIDAccessory name])
                      {
                        [(EAOverHID *)self sendControlMessageOutputReport:5 payload:0 payloadLength:0];
                        unsigned int v8 = 4;
                      }
                      else
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        uint64_t v36 = qword_1000963B8;
                        unsigned int v8 = 4;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v38 = 136315394;
                          *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                          *(_WORD *)&v38[12] = 1024;
                          *(_DWORD *)&v38[14] = 4;
                          v32 = "%s: MessageType 0x%x: Failed to create accessoryname\n";
                          goto LABEL_170;
                        }
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 4;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 4;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
                        goto LABEL_170;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 4;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 4;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  break;
                case 5u:
                  if (v12)
                  {
                    id v17 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v17)
                    {
                      -[EAHIDAccessory setModelNumber:](self->_eaHIDAccessory, "setModelNumber:", [objc_alloc((Class)NSString) initWithData:v17 encoding:4]);
                      if ([(EAHIDAccessory *)self->_eaHIDAccessory modelNumber])
                      {
                        [(EAOverHID *)self sendControlMessageOutputReport:7 payload:0 payloadLength:0];
                        unsigned int v8 = 5;
                      }
                      else
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        uint64_t v36 = qword_1000963B8;
                        unsigned int v8 = 5;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v38 = 136315394;
                          *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                          *(_WORD *)&v38[12] = 1024;
                          *(_DWORD *)&v38[14] = 5;
                          v32 = "%s: MessageType 0x%x: Failed to create modelNumber\n";
                          goto LABEL_170;
                        }
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 5;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 5;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
                        goto LABEL_170;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 5;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 5;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  break;
                case 6u:
                  if (qword_1000963B0 != -1) {
                    dispatch_once(&qword_1000963B0, &stru_10007DC68);
                  }
                  int v18 = qword_1000963B8;
                  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v38 = 136315394;
                    *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                    *(_WORD *)&v38[12] = 1024;
                    *(_DWORD *)&v38[14] = v12;
                    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Processing FirmwareVersion bufferLen=%d", v38, 0x12u);
                  }
                  if (v12 <= 5u)
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 6;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 6;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  else
                  {
                    [(EAHIDAccessory *)self->_eaHIDAccessory setFirmwareVersionMajor:bswap32(v7[4]) >> 16];
                    [(EAHIDAccessory *)self->_eaHIDAccessory setFirmwareVersionMinor:bswap32(v7[5]) >> 16];
                    [(EAHIDAccessory *)self->_eaHIDAccessory setFirmwareVersionRelease:bswap32(v7[6]) >> 16];
                    if (!self->_verifyMinFWVersion
                      || [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMajor] > 1|| [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMajor] == 1&& ([(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMinor] > 0x10|| [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMinor] == 16&& [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionRelease] >= 0x2C))
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      unsigned int v19 = qword_1000963B8;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315138;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: Publishing EA Accessory", v38, 0xCu);
                      }
                      if (![(EAOverHID *)self publishEAAccessory])
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        v37 = qword_1000963B8;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)v38 = 0;
                          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to publish EA Endpoint", v38, 2u);
                        }
                        [(EAOverHID *)self cleanupEASession];
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      v26 = qword_1000963B8;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned int v27 = [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMajor];
                        unsigned int v28 = [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMinor];
                        unsigned int v29 = [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionRelease];
                        *(_DWORD *)v38 = 67110400;
                        *(_DWORD *)&v38[4] = v27;
                        *(_WORD *)&v38[8] = 1024;
                        *(_DWORD *)&v38[10] = v28;
                        *(_WORD *)&v38[14] = 1024;
                        *(_DWORD *)&v38[16] = v29;
                        *(_WORD *)&v38[20] = 1024;
                        *(_DWORD *)&v38[22] = 1;
                        __int16 v39 = 1024;
                        int v40 = 16;
                        __int16 v41 = 1024;
                        int v42 = 44;
                        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Error: Minimum FW Version requirements not met %d.%d.%d < %d.%d.%d", v38, 0x26u);
                      }
                    }
                    unsigned int v8 = 6;
                  }
                  break;
                case 7u:
                  if (v12)
                  {
                    id v20 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v20)
                    {
                      -[EAHIDAccessory setSerialNumber:](self->_eaHIDAccessory, "setSerialNumber:", [objc_alloc((Class)NSString) initWithData:v20 encoding:4]);
                      if ([(EAHIDAccessory *)self->_eaHIDAccessory serialNumber])
                      {
                        [(EAOverHID *)self sendControlMessageOutputReport:8 payload:0 payloadLength:0];
                        unsigned int v8 = 7;
                      }
                      else
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        uint64_t v36 = qword_1000963B8;
                        unsigned int v8 = 7;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v38 = 136315394;
                          *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                          *(_WORD *)&v38[12] = 1024;
                          *(_DWORD *)&v38[14] = 7;
                          v32 = "%s: MessageType 0x%x: Failed to create serialNumber\n";
                          goto LABEL_170;
                        }
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 7;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 7;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
                        goto LABEL_170;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 7;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 7;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  break;
                case 8u:
                  if (v12)
                  {
                    id v21 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v21)
                    {
                      -[EAHIDAccessory setManufacturer:](self->_eaHIDAccessory, "setManufacturer:", [objc_alloc((Class)NSString) initWithData:v21 encoding:4]);
                      if ([(EAHIDAccessory *)self->_eaHIDAccessory manufacturer])
                      {
                        [(EAOverHID *)self sendControlMessageOutputReport:9 payload:0 payloadLength:0];
                        unsigned int v8 = 8;
                      }
                      else
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        uint64_t v36 = qword_1000963B8;
                        unsigned int v8 = 8;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v38 = 136315394;
                          *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                          *(_WORD *)&v38[12] = 1024;
                          *(_DWORD *)&v38[14] = 8;
                          v32 = "%s: MessageType 0x%x: Failed to create manufacturer\n";
                          goto LABEL_170;
                        }
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 8;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 8;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
                        goto LABEL_170;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 8;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 8;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  break;
                case 9u:
                  if (v12)
                  {
                    id v22 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v22)
                    {
                      -[EAHIDAccessory setHardwareVersion:](self->_eaHIDAccessory, "setHardwareVersion:", [objc_alloc((Class)NSString) initWithData:v22 encoding:4]);
                      if ([(EAHIDAccessory *)self->_eaHIDAccessory hardwareVersion])
                      {
                        [(EAOverHID *)self sendControlMessageOutputReport:6 payload:0 payloadLength:0];
                        unsigned int v8 = 9;
                      }
                      else
                      {
                        if (qword_1000963B0 != -1) {
                          dispatch_once(&qword_1000963B0, &stru_10007DC68);
                        }
                        uint64_t v36 = qword_1000963B8;
                        unsigned int v8 = 9;
                        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v38 = 136315394;
                          *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                          *(_WORD *)&v38[12] = 1024;
                          *(_DWORD *)&v38[14] = 9;
                          v32 = "%s: MessageType 0x%x: Failed to create hardwareVersion\n";
                          goto LABEL_170;
                        }
                      }
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 9;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 9;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
                        goto LABEL_170;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 9;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 9;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
                      goto LABEL_117;
                    }
                  }
                  break;
                case 0xBu:
                  if (v12)
                  {
                    id v23 = objc_msgSend(a3, "subdataWithRange:", 8, v12);
                    if (v23)
                    {
                      id v24 = v23;
                      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
                        [(EAOverHIDDelegate *)self->_delegate vendorSpecificMessageResponse:v24];
                      }
                      unsigned int v8 = 11;
                    }
                    else
                    {
                      if (qword_1000963B0 != -1) {
                        dispatch_once(&qword_1000963B0, &stru_10007DC68);
                      }
                      uint64_t v36 = qword_1000963B8;
                      unsigned int v8 = 11;
                      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v38 = 136315394;
                        *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                        *(_WORD *)&v38[12] = 1024;
                        *(_DWORD *)&v38[14] = 11;
                        v32 = "%s: MessageType 0x%x: Failed to create payload\n";
LABEL_170:
                        v33 = v36;
                        uint32_t v34 = 18;
                        goto LABEL_171;
                      }
                    }
                  }
                  else
                  {
                    if (qword_1000963B0 != -1) {
                      dispatch_once(&qword_1000963B0, &stru_10007DC68);
                    }
                    uint64_t v35 = qword_1000963B8;
                    unsigned int v8 = 11;
                    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v38 = 136315650;
                      *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
                      *(_WORD *)&v38[12] = 1024;
                      *(_DWORD *)&v38[14] = 11;
                      *(_WORD *)&v38[18] = 1024;
                      *(_DWORD *)&v38[20] = v12;
                      v32 = "%s: MessageType 0x%x: Invalid payload length=%d\n";
LABEL_117:
                      v33 = v35;
                      uint32_t v34 = 24;
                      goto LABEL_171;
                    }
                  }
                  break;
                default:
                  break;
              }
            }
          }
        }
      }
      else
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        uint64_t v31 = qword_1000963B8;
        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v38 = 67109120;
          *(_DWORD *)&v38[4] = v10;
          v32 = "Invalid Control message flag 0x%x";
          v33 = v31;
          uint32_t v34 = 8;
LABEL_171:
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, v38, v34);
        }
      }
      if ((v9 & 0x20) != 0)
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        uint64_t v25 = qword_1000963B8;
        if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v38 = 67109120;
          *(_DWORD *)&v38[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received NAK for Control Message 0x%x", v38, 8u);
        }
        [(EAOverHID *)self cleanupEASession];
      }
    }
LABEL_66:

    return;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  v30 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v38 = 136315394;
    *(void *)&v38[4] = "-[EAOverHID processControlMessageResponse:]";
    *(_WORD *)&v38[12] = 2048;
    *(void *)&v38[14] = [a3 length];
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s: Invalid payload length=%ld\n", v38, 0x16u);
  }
  if (a3) {
    goto LABEL_66;
  }
}

- (void)processInputEAMessageReportFromAccessory:(id)a3
{
  if (a3 && (unint64_t)[a3 length] > 5)
  {
    id v5 = a3;
    if (self->_expectedState == 1)
    {
      self->_expectedState = 2;
      dispatch_queue_t v6 = [a3 bytes];
      if (v6)
      {
        unsigned int v7 = __rev16(*((unsigned __int16 *)v6 + 2));
        if (v7 <= 5)
        {
          if (qword_1000963B0 != -1) {
            dispatch_once(&qword_1000963B0, &stru_10007DC68);
          }
          uint64_t v12 = qword_1000963B8;
          if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_42;
          }
          *(_WORD *)id v17 = 0;
          int v13 = "Invalid hidHeaderPayloadLength";
        }
        else
        {
          if ((v6[1] & 2) == 0) {
            goto LABEL_42;
          }
          self->_expectedHIDMessageID = bswap32(*((unsigned __int16 *)v6 + 1)) >> 16;
          unsigned __int16 v8 = v7 - 6;
          if (v8)
          {
            id v9 = objc_msgSend(a3, "subdataWithRange:", 6, v8);
            if (v9)
            {
              id v10 = v9;
              if (!self->_eaStreamReady)
              {
                +[NSThread sleepForTimeInterval:1.0];
                self->_eaStreamReady = 1;
              }
              if (((uint64_t (*)(id, NSString *))off_1000963E8)(v10, [(EAHIDAccessory *)self->_eaHIDAccessory EAEndpointUUID]))
              {
                self->_expectedState = 3;
LABEL_13:

                return;
              }
              if (qword_1000963B0 != -1) {
                dispatch_once(&qword_1000963B0, &stru_10007DC68);
              }
              uint64_t v16 = qword_1000963B8;
              if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id v17 = 136315138;
                *(void *)&v17[4] = "-[EAOverHID processInputEAMessageReportFromAccessory:]";
                int v13 = "%s: acc_transportClient_processIncomingData Failed";
                id v14 = v16;
                uint32_t v15 = 12;
                goto LABEL_41;
              }
LABEL_42:
              [(EAOverHID *)self cleanupEASession];
              goto LABEL_13;
            }
            if (qword_1000963B0 != -1) {
              dispatch_once(&qword_1000963B0, &stru_10007DC68);
            }
            uint64_t v12 = qword_1000963B8;
            if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_42;
            }
            *(_WORD *)id v17 = 0;
            int v13 = "Failed to create eaData";
          }
          else
          {
            if (qword_1000963B0 != -1) {
              dispatch_once(&qword_1000963B0, &stru_10007DC68);
            }
            uint64_t v12 = qword_1000963B8;
            if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_42;
            }
            *(_WORD *)id v17 = 0;
            int v13 = "Invalid eaDataLength";
          }
        }
      }
      else
      {
        if (qword_1000963B0 != -1) {
          dispatch_once(&qword_1000963B0, &stru_10007DC68);
        }
        uint64_t v12 = qword_1000963B8;
        if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        *(_WORD *)id v17 = 0;
        int v13 = "Invalid hidHeaderPayloadLength";
      }
    }
    else
    {
      if (qword_1000963B0 != -1) {
        dispatch_once(&qword_1000963B0, &stru_10007DC68);
      }
      uint64_t v12 = qword_1000963B8;
      if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_WORD *)id v17 = 0;
      int v13 = "Invalid state not expecting EA Message from Accessory";
    }
    id v14 = v12;
    uint32_t v15 = 2;
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, v17, v15);
    goto LABEL_42;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  unsigned int v11 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v17 = 136315394;
    *(void *)&v17[4] = "-[EAOverHID processInputEAMessageReportFromAccessory:]";
    *(_WORD *)&v17[12] = 2048;
    *(void *)&v17[14] = [a3 length];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Invalid payload length=%ld\n", v17, 0x16u);
  }
  [(EAOverHID *)self cleanupEASession];
  if (a3) {
    goto LABEL_13;
  }
}

- (BOOL)publishEAAccessory
{
  if (![(EAOverHID *)self accessoryInfoValid]) {
    goto LABEL_41;
  }
  [(EAHIDAccessory *)self->_eaHIDAccessory setEAConnectionUUID:off_1000963C0(6, 0)];
  if (![(EAHIDAccessory *)self->_eaHIDAccessory EAConnectionUUID])
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    unsigned int v19 = qword_1000963B8;
    LOBYTE(v12) = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    id v20 = "failed to create EA connection";
LABEL_40:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
LABEL_41:
    LOBYTE(v12) = 0;
    goto LABEL_23;
  }
  v3 = off_1000963C8;
  v4 = [(EAHIDAccessory *)self->_eaHIDAccessory EAConnectionUUID];
  id v5 = [(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003B178;
  v22[3] = &unk_10007DCF0;
  v22[4] = self;
  [(EAHIDAccessory *)self->_eaHIDAccessory setEAEndpointUUID:((uint64_t (*)(NSString *, uint64_t, uint64_t, NSString *, void *, void))v3)(v4, 5, 5, v5, v22, 0)];
  if (![(EAHIDAccessory *)self->_eaHIDAccessory EAEndpointUUID])
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    unsigned int v19 = qword_1000963B8;
    LOBYTE(v12) = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    id v20 = "failed to create EA endpoint";
    goto LABEL_40;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  dispatch_queue_t v6 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(EAHIDAccessory *)self->_eaHIDAccessory EAEndpointUUID];
    *(_DWORD *)buf = 138412290;
    *(void *)v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Created EA endpoint %@ for accessory", buf, 0xCu);
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
  }
  unsigned __int16 v8 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMajor];
    unsigned int v10 = [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMinor];
    unsigned int v11 = [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionRelease];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v26 = v9;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v10;
    __int16 v27 = 1024;
    unsigned int v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Firmware Version for acc %d.%d.%d", buf, 0x14u);
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%d.%d.%d", [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMajor], [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionMinor], [(EAHIDAccessory *)self->_eaHIDAccessory firmwareVersionRelease]];
  if (!v12) {
    goto LABEL_23;
  }
  v23[0] = @"Name";
  v24[0] = [(EAHIDAccessory *)self->_eaHIDAccessory name];
  v23[1] = @"Manufacturer";
  v24[1] = [(EAHIDAccessory *)self->_eaHIDAccessory manufacturer];
  v23[2] = @"Model";
  v24[2] = [(EAHIDAccessory *)self->_eaHIDAccessory modelNumber];
  v23[3] = @"SerialNumber";
  v24[3] = [(EAHIDAccessory *)self->_eaHIDAccessory serialNumber];
  v23[4] = @"HardwareVersion";
  int v13 = [(EAHIDAccessory *)self->_eaHIDAccessory hardwareVersion];
  v23[5] = @"FirmwareVersionActive";
  v24[4] = v13;
  v24[5] = v12;
  id v14 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  uint32_t v15 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AccessoryInfo for EAEndpoint=%@", buf, 0xCu);
  }
  if ((((uint64_t (*)(NSString *, NSDictionary *))off_1000963D0)([(EAHIDAccessory *)self->_eaHIDAccessory EAEndpointUUID], v14) & 1) == 0)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    unsigned int v19 = qword_1000963B8;
    LOBYTE(v12) = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    id v20 = "failed to set endpoint accessory info";
    goto LABEL_40;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003B21C;
  v21[3] = &unk_10007DD18;
  v21[4] = self;
  off_1000963D8(v21, @"EA_SessionOpen");
  if (((uint64_t (*)(NSString *))off_1000963E0)([(EAHIDAccessory *)self->_eaHIDAccessory EAConnectionUUID]))
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v16 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString];
      *(_DWORD *)buf = 138412290;
      *(void *)v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Published EA Accessory: %@", buf, 0xCu);
    }
    LOBYTE(v12) = 1;
    goto LABEL_23;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  unsigned int v19 = qword_1000963B8;
  LOBYTE(v12) = 0;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v20 = "failed to publish EA connection for accessory";
    goto LABEL_40;
  }
LABEL_23:
  [(EAOverHID *)self idleExitAllowed:1];
  return (char)v12;
}

- (void)processIncomingEADataFromPlugin:(id)a3
{
  if (self->_expectedState == 3)
  {
    self->_expectedState = 4;
    if (![(EAOverHID *)self sendEAMessageOutputReport:a3])
    {
      if (qword_1000963B0 != -1) {
        dispatch_once(&qword_1000963B0, &stru_10007DC68);
      }
      id v5 = qword_1000963B8;
      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_queue_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up", v6, 2u);
      }
      [(EAOverHID *)self cleanupEASession];
    }
  }
  else
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    v4 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalid state", buf, 2u);
    }
  }
}

- (void)handleHIDAccessoryDisconnect
{
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  v3 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Error: HID Accessory disconnected, cleaning up", buf, 2u);
  }
  eaHIDQueue = self->_eaHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B6F0;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(eaHIDQueue, block);
}

- (void)cleanupEASession
{
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  v3 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint32_t v15 = "-[EAOverHID cleanupEASession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tracer: %s", (uint8_t *)&v14, 0xCu);
  }
  [(EAOverHID *)self idleExitAllowed:1];
  if (self->_isActive)
  {
    eaHIDAccessory = self->_eaHIDAccessory;
    if (eaHIDAccessory)
    {
      if ([(EAHIDAccessory *)eaHIDAccessory EAEndpointUUID]) {
        ((void (*)(NSString *))off_1000963F0)([(EAHIDAccessory *)self->_eaHIDAccessory EAEndpointUUID]);
      }
      if ([(EAHIDAccessory *)self->_eaHIDAccessory EAConnectionUUID]) {
        ((void (*)(NSString *))off_1000963F0)([(EAHIDAccessory *)self->_eaHIDAccessory EAConnectionUUID]);
      }
      if ([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice])
      {
        if (self->_hidDeviceScheduled)
        {
          id v5 = [(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice];
          Main = CFRunLoopGetMain();
          IOHIDDeviceUnscheduleFromRunLoop(v5, Main, kCFRunLoopDefaultMode);
          IOHIDDeviceClose([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice], 0);
          self->_hidDeviceScheduled = 0;
        }
        CFRelease([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice]);
        [(EAHIDAccessory *)self->_eaHIDAccessory setHIDDevice:0];
      }

      self->_eaHIDAccessory = 0;
    }
    input = self->_input;
    if (input)
    {

      self->_input = 0;
    }
    self->_isActive = 0;
    queuedEvents = self->_queuedEvents;
    if (queuedEvents)
    {
      if ([(NSMutableArray *)queuedEvents count])
      {
        id v9 = [(NSMutableArray *)self->_queuedEvents firstObject];
        if (v9)
        {
          unsigned int v10 = v9;
          [(NSMutableArray *)self->_queuedEvents removeObjectAtIndex:0];
          if (qword_1000963B0 != -1) {
            dispatch_once(&qword_1000963B0, &stru_10007DC68);
          }
          unsigned int v11 = qword_1000963B8;
          if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = [v10 filterName];
            id v13 = [v10 info];
            int v14 = 136315650;
            uint32_t v15 = "-[EAOverHID cleanupEASession]";
            __int16 v16 = 2112;
            id v17 = v12;
            __int16 v18 = 2112;
            id v19 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: EAOverHID: Kicking off queued event: %@: %@", (uint8_t *)&v14, 0x20u);
          }
          -[EAOverHID accessoryAttached:withInfo:](self, "accessoryAttached:withInfo:", [v10 filterName], objc_msgSend(v10, "info"));
        }
      }
    }
  }
}

- (BOOL)sendEAMessageOutputReport:(id)a3
{
  int v20 = 0;
  __int16 v19 = 0;
  if (!a3
    || (eaHIDAccessory = self->_eaHIDAccessory) == 0
    || ![(EAHIDAccessory *)eaHIDAccessory HIDDevice])
  {
LABEL_20:
    [(EAOverHID *)self cleanupEASession];
    return 0;
  }
  unsigned int v6 = [a3 length];
  unsigned __int16 v7 = v6;
  unsigned int v8 = v6 + 6;
  id v9 = objc_alloc_init((Class)NSMutableData);
  HIWORD(v20) = 1536;
  [v9 appendBytes:(char *)&v20 + 2 length:2];
  LOWORD(v20) = self->_expectedHIDMessageID;
  [v9 appendBytes:&v20 length:2];
  __int16 v19 = bswap32(v8) >> 16;
  [v9 appendBytes:&v19 length:2];
  objc_msgSend(v9, "appendBytes:length:", objc_msgSend(a3, "bytes"), v7);
  id v10 = [v9 length];
  if ((unint64_t)v10 > [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportSizeOutput])
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v12 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    id v13 = [v9 length];
    unsigned int v14 = [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportSizeOutput];
    *(_DWORD *)buf = 134218240;
    id v22 = v13;
    __int16 v23 = 1024;
    unsigned int v24 = v14;
    uint32_t v15 = "ERROR: Size of outputReport %lu > HID Output Report Size from accessory descriptor %d";
    __int16 v16 = v12;
    uint32_t v17 = 18;
    goto LABEL_17;
  }
  if (!-[EAOverHID sendHIDReport:reportID:length:](self, "sendHIDReport:reportID:length:", [v9 bytes], -[EAHIDAccessory HIDReportID](self->_eaHIDAccessory, "HIDReportID"), objc_msgSend(v9, "length")))
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v18 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint32_t v15 = "Failed to send EA HID Report";
    __int16 v16 = v18;
    uint32_t v17 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_18:
    if (v9) {

    }
    goto LABEL_20;
  }
  if (v9) {

  }
  return 1;
}

- (void)idleExitAllowed:(BOOL)a3
{
  if (a3)
  {
    if (!self->_dispatchGroupHeld) {
      return;
    }
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    v4 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Leaving Shared DispatchGroup", buf, 2u);
    }
    dispatch_group_leave((dispatch_group_t)qword_1000975B0);
    BOOL v5 = 0;
  }
  else
  {
    if (self->_dispatchGroupHeld) {
      return;
    }
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    unsigned int v6 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int16 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering Shared DispatchGroup", v7, 2u);
    }
    dispatch_group_enter((dispatch_group_t)qword_1000975B0);
    BOOL v5 = 1;
  }
  self->_dispatchGroupHeld = v5;
}

- (BOOL)sendVendorSpecificRequest:(id)a3
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  eaHIDQueue = self->_eaHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BE0C;
  block[3] = &unk_10007D860;
  void block[5] = a3;
  void block[6] = &v7;
  block[4] = self;
  dispatch_sync(eaHIDQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)queryAllCurrentFirmwareVersions
{
  __int16 v6 = 512;
  id v3 = objc_alloc_init((Class)NSMutableData);
  [v3 appendBytes:&v6 length:2];
  BOOL v4 = [(EAOverHID *)self sendVendorSpecificRequest:v3];
  if (v3) {

  }
  return v4;
}

- (BOOL)queryAllStagedFirmwareVersions
{
  __int16 v6 = 768;
  id v3 = objc_alloc_init((Class)NSMutableData);
  [v3 appendBytes:&v6 length:2];
  BOOL v4 = [(EAOverHID *)self sendVendorSpecificRequest:v3];
  if (v3) {

  }
  return v4;
}

- (BOOL)applyStagedFirmwareVersionsAfterDelay:(unsigned __int16)a3
{
  __int16 v8 = 1024;
  __int16 v7 = __rev16(a3);
  id v4 = objc_alloc_init((Class)NSMutableData);
  [v4 appendBytes:&v8 length:2];
  [v4 appendBytes:&v7 length:2];
  BOOL v5 = [(EAOverHID *)self sendVendorSpecificRequest:v4];
  if (v4) {

  }
  return v5;
}

- (unsigned)getServiceForRegistryID:(unint64_t)a3
{
  CFDictionaryRef v3 = IORegistryEntryIDMatching(a3);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v3);
  if (!MatchingService)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    __int16 v6 = qword_1000963B8;
    if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IOServiceGetMatchingService ioService=IO_OBJECT_NULL", v7, 2u);
    }
  }
  return MatchingService;
}

- (unsigned)getReportSizeForReportUsage:(unsigned int)a3
{
  CFArrayRef v5 = IOHIDDeviceCopyMatchingElements([(EAHIDAccessory *)self->_eaHIDAccessory HIDDevice], (CFDictionaryRef)&off_100086858, 0);
  __int16 v6 = (id)CFMakeCollectable(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(__IOHIDElement **)(*((void *)&v17 + 1) + 8 * i);
        if (IOHIDElementGetUsage(v11) == a3)
        {
          uint32_t ReportSize = IOHIDElementGetReportSize(v11);
          [(EAHIDAccessory *)self->_eaHIDAccessory setHIDReportID:IOHIDElementGetReportID(v11)];
          if (qword_1000963B0 != -1) {
            dispatch_once(&qword_1000963B0, &stru_10007DC68);
          }
          unsigned int v14 = qword_1000963B8;
          if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v15 = [(EAHIDAccessory *)self->_eaHIDAccessory HIDReportID];
            *(_DWORD *)buf = 67109632;
            unsigned int v22 = a3;
            __int16 v23 = 1024;
            uint32_t v24 = ReportSize;
            __int16 v25 = 1024;
            unsigned int v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "reportUsage=0x%x, ReportSize=%dbits, reportID=0x%x", buf, 0x14u);
          }
          return ReportSize;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  uint64_t v12 = qword_1000963B8;
  uint32_t ReportSize = 0;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error: No IOHIDElement found with EA Usage 0x%x", buf, 8u);
    return 0;
  }
  return ReportSize;
}

- (BOOL)accessoryInfoValid
{
  CFDictionaryRef v3 = [(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString];
  if (v3)
  {
    CFDictionaryRef v3 = [(EAHIDAccessory *)self->_eaHIDAccessory name];
    if (v3)
    {
      CFDictionaryRef v3 = [(EAHIDAccessory *)self->_eaHIDAccessory manufacturer];
      if (v3)
      {
        CFDictionaryRef v3 = [(EAHIDAccessory *)self->_eaHIDAccessory modelNumber];
        if (v3)
        {
          CFDictionaryRef v3 = [(EAHIDAccessory *)self->_eaHIDAccessory serialNumber];
          if (v3) {
            LOBYTE(v3) = [(EAHIDAccessory *)self->_eaHIDAccessory hardwareVersion] != 0;
          }
        }
      }
    }
  }
  return (char)v3;
}

- (id)getEAProductIDForAccessory
{
  id result = [(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString];
  if (result)
  {
    id v4 = [[(NSString *)[(EAHIDAccessory *)self->_eaHIDAccessory EAProtocolString] pathExtension] componentsSeparatedByString:@"-"];
    return [(NSArray *)v4 firstObject];
  }
  return result;
}

- (void)logDebugMessageFromAccessory:(char *)a3 length:(int64_t)a4
{
  if ((unint64_t)a4 <= 1)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v35 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    v45 = "-[EAOverHID logDebugMessageFromAccessory:length:]";
    __int16 v46 = 2048;
    v47[0] = a4;
    uint64_t v36 = "%s: Invalid payload length=%ld\n";
    v37 = v35;
    uint32_t v38 = 22;
LABEL_69:
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    return;
  }
  unsigned int v6 = *(unsigned __int16 *)a3;
  id v7 = [(EAOverHID *)self getEAProductIDForAccessory];
  if (!v7)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v39 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v36 = "Error: No valid accessory info found\n";
    goto LABEL_54;
  }
  id v8 = v7;
  uint64_t v9 = +[NSString stringWithFormat:@"EA%@Strings", v7];
  if (!v9)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v40 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    v45 = v8;
    uint64_t v36 = "Error: Failed to create EAStringsFileName for accessory iAUP ProductID %@\n";
    goto LABEL_67;
  }
  char v10 = v9;
  unsigned int v11 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileAccessoryUpdater"];
  if (!v11)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v39 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v36 = "Error: MAU bundle not found\n";
LABEL_54:
    v37 = v39;
    uint32_t v38 = 2;
    goto LABEL_69;
  }
  uint64_t v12 = [(NSBundle *)v11 pathForResource:v10 ofType:@"plist"];
  if (!v12)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v41 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    v45 = (const char *)v10;
    uint64_t v36 = "Error: File %@.plist not found\n";
    v37 = v41;
    goto LABEL_68;
  }
  id v13 = (const char *)v12;
  unsigned int v14 = +[NSDictionary dictionaryWithContentsOfFile:v12];
  if (!v14)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v40 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    v45 = v13;
    uint64_t v36 = "Error: Failed to create EAStringsDict from %@\n";
    goto LABEL_67;
  }
  id v15 = [(NSDictionary *)v14 objectForKey:@"DebugStrings"];
  if (!v15)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v40 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    v45 = v13;
    uint64_t v36 = "Error: DebugStrings table not found in %@\n";
LABEL_67:
    v37 = v40;
LABEL_68:
    uint32_t v38 = 12;
    goto LABEL_69;
  }
  __int16 v16 = v15;
  unint64_t v17 = __rev16(v6);
  if ((unint64_t)[v15 count] <= v17)
  {
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    uint64_t v42 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    v45 = "-[EAOverHID logDebugMessageFromAccessory:length:]";
    __int16 v46 = 1024;
    LODWORD(v47[0]) = v17;
    WORD2(v47[0]) = 2048;
    *(void *)((char *)v47 + 6) = [v16 count];
    uint64_t v36 = "%s: Invalid stringIndex = %d, DebugStrings table count = %lu\n";
    v37 = v42;
    uint32_t v38 = 28;
    goto LABEL_69;
  }
  long long v18 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", [v16 objectAtIndex:v17]);
  if (v18)
  {
    long long v19 = v18;
    id v20 = [(NSMutableString *)v18 rangeOfString:@"%s"];
    id v22 = 0;
    BOOL v23 = v20 != (id)0x7FFFFFFFFFFFFFFFLL;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2 || (id v24 = v20, v20 == (id)0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_21:
      if (!v23) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v25 = v21;
      id v22 = 0;
      uint64_t v26 = 2;
      while (1)
      {
        int64_t v27 = a3[(v26 + 1)] | ((unint64_t)a3[v26] << 8);
        uint64_t v28 = (v26 + 2);
        if (a4 - v28 < v27) {
          break;
        }
        if (v22) {

        }
        id v22 = [objc_alloc((Class)NSString) initWithBytes:&a3[v28] length:v27 encoding:4];
        -[NSMutableString deleteCharactersInRange:](v19, "deleteCharactersInRange:", v24, v25);
        [(NSMutableString *)v19 insertString:v22 atIndex:v24];
        id v29 = [(NSMutableString *)v19 rangeOfString:@"%s"];
        id v24 = v29;
        uint64_t v25 = v30;
        uint64_t v26 = (v28 + v27);
        BOOL v23 = v29 != (id)0x7FFFFFFFFFFFFFFFLL;
        if ((unint64_t)(a4 - v26) < 2 || v29 == (id)0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_21;
        }
      }
      if (qword_1000963B0 != -1) {
        dispatch_once(&qword_1000963B0, &stru_10007DC68);
      }
      v32 = qword_1000963B8;
      if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Error: Invalid Payload", buf, 2u);
    }
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
LABEL_29:
    v33 = qword_1000963B8;
    if (!os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_33:
      uint32_t v34 = qword_1000963B8;
      if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = (const char *)v19;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "DEBUG STRING FROM ACCESSORY: %@", buf, 0xCu);
      }
      if (v22) {

      }
      return;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[Warning] args provided by accessory are less than the debug string expects", buf, 2u);
LABEL_31:
    if (qword_1000963B0 != -1) {
      dispatch_once(&qword_1000963B0, &stru_10007DC68);
    }
    goto LABEL_33;
  }
  if (qword_1000963B0 != -1) {
    dispatch_once(&qword_1000963B0, &stru_10007DC68);
  }
  uint64_t v43 = qword_1000963B8;
  if (os_log_type_enabled((os_log_t)qword_1000963B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v17;
    uint64_t v36 = "Failed to create debugString for string table index %d";
    v37 = v43;
    uint32_t v38 = 8;
    goto LABEL_69;
  }
}

- (void)dealloc
{
  if (self->_isActive) {
    [(EAOverHID *)self cleanupEASession];
  }
  eaHIDQueue = self->_eaHIDQueue;
  if (eaHIDQueue)
  {
    dispatch_release(eaHIDQueue);
    self->_eaHIDQueue = 0;
  }
  eaHIDAccessory = self->_eaHIDAccessory;
  if (eaHIDAccessory)
  {

    self->_eaHIDAccessory = 0;
  }
  if (qword_1000963B8) {

  }
  coreAccFrameworkRef = self->_coreAccFrameworkRef;
  if (coreAccFrameworkRef)
  {
    dlclose(coreAccFrameworkRef);
    self->_coreAccFrameworkRef = 0;
  }

  queuedEvents = self->_queuedEvents;
  if (queuedEvents)
  {

    self->_queuedEvents = 0;
  }
  delegate = self->_delegate;
  if (delegate) {

  }
  v8.receiver = self;
  v8.super_class = (Class)EAOverHID;
  [(EAOverHID *)&v8 dealloc];
}

- (EAHIDAccessory)eaHIDAccessory
{
  return self->_eaHIDAccessory;
}

- (void)setEaHIDAccessory:(id)a3
{
  self->_eaHIDAccessory = (EAHIDAccessory *)a3;
}

@end